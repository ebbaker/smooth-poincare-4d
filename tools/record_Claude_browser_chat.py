#!/usr/bin/env python3
"""Record a Claude Cowork session from its claude.ai event log, turn by turn.

Prepared for Edward B. Baker III with LLM assistance. Model: Claude Fable 5.2
(`claude-fable-5-2`), Claude Cowork, reasoning effort max, 23 November 2026.

tools/record_Claude_cowork_chat.py let a Cowork session capture itself from
the transcript file in its cloud workspace. The Cowork runtime of November
2026 keeps no such file (there is no ~/.claude/projects in the workspace), so
that route has nothing to read. The session's event log on claude.ai is still
complete. This script lets a session, or a later one, record a session from
that log through a browser signed in to claude.ai:

  script       Print the reader to install once in a claude.ai page
               (window.rhCoworkRead).
  status       On the computer: the registry that holds a session, how far
               its store reaches, and the read to run next.
  pending      On the computer: registered Cowork sessions whose last turn
               was still running at their last capture, so that a later
               session can complete them.
  ingest       On the computer: check a read against its SHA-256, add it to
               the session's store, convert the store with
               record_Claude_export_chat.py and register the result with
               record_chat.py.
  readme-stub  Print a draft registry README entry for a registered chat.

The reader calls GET /v1/code/sessions/{id} and
GET /v1/code/sessions/{id}/events, internal endpoints of the claude.ai web
app that can change without notice. It keeps, in the page, only what the
coverage rules use, and returns records after a given sequence number, so a
refresh passes only the new public messages through the chat.

Coverage, as for the other Cowork captures. Kept:
  - messages typed by the person, including messages sent while a reply was
    in progress and interruption markers;
  - the text ending each completed turn (phase final_answer);
  - progress updates between tool calls (phase commentary). The log holds
    these as a condensed rewrite of what the assistant wrote there (flagged as
    narration), not the verbatim text; the rewrite is what is kept;
  - chat-visible items that travel through tools, rendered as text and
    labelled in message metadata: question cards (AskUserQuestion) with the
    selected options, notes sent with SendUserMessage, and file-card captions
    (SendUserFile).
Omitted: system and harness text, the session's system prompt, internal
reasoning (the log holds none), other tool calls and outputs, permission
prompts, control events, usage figures, subagent messages and attachment
contents. Neither the event log nor the store is kept in the repository; each
record stores their SHA-256 values.

Per-turn procedure for a Cowork session. SESSION is the session id: cse_
followed by the suffix of the session link (https://claude.ai/code/session_…),
also visible in the cloud workspace's mount table.

  1. On the computer, from the repository root:
       python3 tools/record_Claude_browser_chat.py status --session-id SESSION
     It prints since_seq and the read to run. If the reader is not installed
     in the page yet (first read, or the page was reloaded), install it with
     the output of `script` first; the page answers with the SHA-256 of the
     installed text, which must equal the reader_sha256 that status prints.
  2. In a claude.ai page of the signed-in browser, run the read:
       await window.rhCoworkRead('SESSION', SINCE_SEQ)
     The result is a JSON object {body, body_bytes, format, sha256}.
  3. On the computer, pass that object on standard input:
       python3 tools/record_Claude_browser_chat.py ingest \\
           --registry PATH [--new-registry] --sdk-session-id ID \\
           [--project-name NAME --project-uuid UUID] <<'EOF'
       {...}
       EOF
     ingest recomputes the SHA-256 of the body before using it. If it prints
     "more": true, repeat steps 2 and 3 with the next_since_seq it gives.
     --sdk-session-id is the cloud workspace's CLAUDE_CODE_SESSION_ID; the log
     must name it, which ties the log to the running session.
  4. First capture only: add the printed README entry, with its Work sentence
     written, to the registry's README.

A capture made during a turn holds everything up to that point; the reply
being written enters with the next read. The last reply of a session therefore
enters only when someone reads its log again: `pending` lists such records,
and a later session completes each one with the same status, read and ingest
steps, leaving out --sdk-session-id (the log is then another session's).

Text in a read travels in ASCII: `~uXXXX` stands for one UTF-16 code unit
outside printable ASCII (the line feed excepted) and `~~` for a tilde, so that
a copy through the chat cannot silently alter a character; ingest decodes it
after the hash check.

Standard library only (Python 3.9+).
"""
from __future__ import annotations

import argparse
import contextlib
import json
import os
import re
import subprocess
import sys
import tempfile
import textwrap
from datetime import datetime
from pathlib import Path

TOOLS = Path(__file__).resolve().parent
if str(TOOLS) not in sys.path:
    sys.path.insert(0, str(TOOLS))
import record_Claude_export_chat as export  # noqa: E402  (the converter and its helpers)

ROOT = export.ROOT
READ_FORMAT = "rh-cowork-session-read/1"
STORE_FORMAT = "rh-cowork-session-events/2 (public records only, read incrementally in the signed-in browser)"
DEFAULT_STORE_DIR = "~/.cache/cowork-chat-events"
SESSION_ID = re.compile(r"cse_[0-9A-Za-z]{8,}")
TOKEN = re.compile(r"~(~|u[0-9a-f]{4})")
SOURCE_KIND = ("Claude Cowork cloud session event log (claude.ai GET /v1/code/sessions/{id}/events), read in the "
               "signed-in browser, reduced there to completed public messages and transferred with a SHA-256 check")
STORE_NOTE = ("The store holds the public records of every read of this session's event log, outside the "
              "repository; sha256_of_events_json is the SHA-256 of JSON.stringify(events sorted by sequence_num) "
              "computed in the browser at the last read. Neither the event log nor the store is kept in the "
              "repository")
COVERAGE = (
    "Messages typed by the person (including any sent while a reply was in progress, with the names of files "
    "sent with them) and interruption markers; the options the person selected in question cards; the text "
    "ending each completed turn (phase final_answer); and, as phase commentary, progress updates between tool "
    "calls in the condensed form the event log holds (not the assistant's verbatim wording), question cards "
    "rendered as text, and notes and file-card captions sent through tools; recorded through the event log as "
    "read. A reply still in progress at a read enters with the next one")
TIMESTAMPS = (
    "Event times, in seconds since Unix epoch and ISO 8601: the session's own timestamp where the event "
    "carries one, otherwise the server's event time (typed messages); the conversation create_time is the "
    "creation time in the session object on claude.ai")
DELIVERED_NOTE = (
    "Paths reported by device_commit_files, names of file cards, and files the capturing session named to "
    "ingest with --delivered; other files written by shell commands or saved as project documents are not "
    "detected")

READER_JS = r'''async function rhCoworkRead(id, sinceSeq, maxBytes) {
  sinceSeq = Number(sinceSeq || 0); maxBytes = Number(maxBytes || 12000);
  const H = {headers: {'anthropic-version': '2023-06-01'}};
  const KEEP_INPUT = new Set(['AskUserQuestion', 'SendUserMessage', 'SendUserFile']);
  const INTERRUPTED = '[Request interrupted by user';
  const strip = (t) => typeof t === 'string' ? t.replace(/<system-reminder>[\s\S]*?<\/system-reminder>/g, '').trim() : '';
  const get = async (url) => {
    let r, tries = 0;
    while (true) { r = await fetch(url, H); if (r.status !== 429 && r.status < 500) break; if (++tries > 6) throw new Error('fetch failed ' + r.status); await new Promise(res => setTimeout(res, 2000 * tries)); }
    if (!r.ok) throw new Error('HTTP ' + r.status + ' for ' + url.split('?')[0]);
    return r.json();
  };
  const hex = async (text) => Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256', new TextEncoder().encode(text)))).map(x => x.toString(16).padStart(2, '0')).join('');
  const enc = (v) => typeof v === 'string' ? v.replace(/~/g, '~~').replace(/[^\x20-\x7e\n]/g, ch => '~u' + ch.charCodeAt(0).toString(16).padStart(4, '0')) : Array.isArray(v) ? v.map(enc) : (v && typeof v === 'object') ? Object.fromEntries(Object.entries(v).map(([k, x]) => [enc(k), enc(x)])) : v;
  const canon = (v) => v === null || v === undefined ? 'null' : typeof v === 'string' ? JSON.stringify(v) : typeof v !== 'object' ? String(v) : Array.isArray(v) ? '[' + v.map(canon).join(',') + ']' : '{' + Object.keys(v).filter(k => v[k] !== undefined).sort().map(k => JSON.stringify(k) + ':' + canon(v[k])).join(',') + '}';
  const written = (v) => {
    if (Array.isArray(v)) v = v.map(x => (x && x.text) || '').join('');
    if (typeof v === 'string') { try { v = JSON.parse(v); } catch (_) { return null; } }
    return v && typeof v === 'object' && Array.isArray(v.written) ? v.written.filter(x => typeof x === 'string') : null;
  };
  const started = new Date().toISOString();
  const wrapped = await get(`/v1/code/sessions/${id}`);
  const s = wrapped.response_shape || wrapped;
  if (s.id !== id) throw new Error('The session object is not for ' + id);
  let events = [], cursor = null, pages = 0; const seen = new Set();
  while (true) {
    const b = await get(`/v1/code/sessions/${id}/events?limit=100` + (cursor ? '&cursor=' + encodeURIComponent(cursor) : ''));
    const fresh = (b.data || []).filter(e => !seen.has(e.event_id));
    fresh.forEach(e => seen.add(e.event_id));
    events = events.concat(fresh); pages++;
    if (!fresh.length || !b.next_cursor || b.next_cursor === cursor || pages > 2000) break;
    cursor = b.next_cursor;
  }
  events.sort((a, b) => Number(a.sequence_num) - Number(b.sequence_num));
  const raw = JSON.stringify(events);
  const names = {};
  for (const e of events) { const p = e.payload || {}; if (p.type === 'assistant' && p.message && Array.isArray(p.message.content)) for (const k of p.message.content) if (k.type === 'tool_use') names[k.id] = k.name; }
  const counts = {}, sdk = new Set(), records = []; let subagent = 0, narrations = 0;
  for (const e of events) {
    const p = e.payload || {}; const t = p.type || e.event_type;
    counts[t] = (counts[t] || 0) + 1;
    if (p.session_id) sdk.add(p.session_id);
    const base = {seq: Number(e.sequence_num), created_at: e.created_at, source: e.source || null, type: t};
    if (t === 'user' || t === 'assistant') {
      if (p.parent_tool_use_id) { subagent++; continue; }
      const m = p.message || {}; const c = m.content;
      const list = typeof c === 'string' ? [{type: 'text', text: c}] : (Array.isArray(c) ? c : []);
      const rec = Object.assign(base, {uuid: p.uuid || null, timestamp: p.timestamp || null});
      const blocks = []; let keep = false;
      if (t === 'assistant') {
        const narrated = new Set(Array.isArray(p.narration_block_indexes) ? p.narration_block_indexes : []);
        list.forEach((k, i) => {
          if (k.type === 'text') { const tx = strip(k.text); blocks.push({type: 'text', text: tx}); if (tx) keep = true; }
          else if (k.type === 'thinking' && narrated.has(i) && strip(k.thinking)) { blocks.push({type: 'text', text: strip(k.thinking), narration: true}); keep = true; narrations++; }
          else if (k.type === 'tool_use' && KEEP_INPUT.has(k.name)) {
            const inp = k.input || {}; let input;
            if (k.name === 'SendUserMessage') input = {message: inp.message || null};
            else if (k.name === 'SendUserFile') input = {files: Array.isArray(inp.files) ? inp.files : [], caption: inp.caption || null};
            else input = {questions: (inp.questions || []).map(q => ({header: q.header || '', question: q.question || '', options: (q.options || []).map(o => ({label: o.label || '', description: o.description || ''}))}))};
            blocks.push({type: 'tool_use', id: k.id, name: k.name, input}); keep = true;
          }
          else if (k.type === 'tool_use') blocks.push({type: 'tool_use', id: k.id, name: k.name});
          else blocks.push({type: k.type});
        });
        Object.assign(rec, {blocks, model: m.model || null, message_id: m.id || null, stop_reason: m.stop_reason || null});
      } else {
        let text = '', other = false;
        for (const k of list) {
          if (k.type === 'text') { const tx = strip(k.text); blocks.push({type: 'text', text: tx}); text += tx; }
          else if (k.type === 'tool_result') {
            const n = names[k.tool_use_id] || null;
            blocks.push({type: 'tool_result', tool_use_id: k.tool_use_id, name: n, is_error: !!k.is_error});
            const r = p.tool_use_result;
            if (n === 'AskUserQuestion' && r && typeof r === 'object' && r.answers && Object.keys(r.answers).length) {
              const notes = {};
              for (const [q, a] of Object.entries(r.annotations || {})) if (a && a.notes) notes[q] = {notes: a.notes};
              rec.tool_use_result = {answers: r.answers, annotations: notes, questions: (r.questions || []).map(q => ({header: q.header || '', question: q.question || ''}))};
              keep = true;
            } else if (n && n.endsWith('device_commit_files')) {
              const w = written(r) || written(k.content);
              if (w && w.length) { rec.tool_use_result = {written: w}; keep = true; }
            }
          } else { blocks.push({type: k.type}); other = true; }
        }
        for (const k of ['isMeta', 'isSynthetic', 'shouldQuery', 'priority', 'isReplay', 'isCompactSummary', 'origin']) if (p[k] !== undefined && p[k] !== null) rec[k] = p[k];
        if (e.source === 'client' && p.shouldQuery !== false && !p.isMeta && !p.isSynthetic && (text || other)) keep = true;
        if (text.startsWith(INTERRUPTED)) keep = true;
        rec.blocks = blocks;
      }
      if (keep) records.push(rec);
    } else if (t === 'result') {
      records.push(Object.assign(base, {subtype: p.subtype || null, is_error: !!p.is_error, stop_reason: p.stop_reason || null, terminal_reason: p.terminal_reason || null, user_message_uuids: p.user_message_uuids || [], origin: p.origin || null, uuid: p.uuid || null}));
    } else if (t === 'system' && p.subtype === 'compact_boundary') {
      records.push(Object.assign(base, {subtype: p.subtype}));
    } else if (t === 'control_request' && p.request && p.request.subtype === 'interrupt') {
      records.push(Object.assign(base, {subtype: 'interrupt'}));
    }
  }
  const cfg = s.config || {};
  const folders = (((s.client_metadata || {}).remote_cowork || {}).userSelectedFolders || []).map(f => String((f && f.path) || '').replace(/[\\/]+$/, '').split(/[\\/]/).pop());
  const session = {id: s.id, title: s.title || null, created_at: s.created_at, last_event_at: s.last_event_at || null, status_bucket: s.status_bucket || null, chat_project_id: s.chat_project_id || null, model: cfg.model || null, effort_level: cfg.effort_level || null, origin: cfg.origin || null, permission_mode: cfg.permission_mode || null, user_selected_folders: folders, last_served_model: (s.external_metadata || {}).last_served_model || null};
  const last = events.length ? Number(events[events.length - 1].sequence_num) : 0;
  const log = {events_read: events.length, pages, first_seq: events.length ? Number(events[0].sequence_num) : null, last_seq: last, sha256_of_events_json: await hex(raw), events_json_bytes: new TextEncoder().encode(raw).length, event_counts: counts, subagent_messages_omitted: subagent, progress_updates: narrations, public_records: records.length, sdk_session_ids: [...sdk].sort(), reader_sha256: await hex(rhCoworkRead.toString()), read_started_at: started, read_finished_at: new Date().toISOString()};
  const pending = records.filter(r => r.seq > sinceSeq), out = []; let size = 0;
  for (const r of pending) { const n = canon(enc(r)).length + 1; if (out.length && size + n > maxBytes) break; out.push(r); size += n; }
  const more = out.length < pending.length;
  const body = enc({format: 'rh-cowork-session-read/1', session, log, since_seq: sinceSeq, through_seq: more ? out[out.length - 1].seq : Math.max(last, sinceSeq), more, records: out});
  const text = canon(body);
  return {format: 'rh-cowork-session-read/1', sha256: await hex(text), body_bytes: text.length, body};
}'''


# ---------------------------------------------------------------- utilities

def note(message):
    print(message, file=sys.stderr)


def encode_text(value):
    """ASCII form of a string, as the reader writes it: ~uXXXX per UTF-16 code unit, ~~ for a tilde."""
    data = value.encode("utf-16-be", "surrogatepass")
    out = []
    for index in range(0, len(data), 2):
        unit = (data[index] << 8) | data[index + 1]
        if unit == 0x7E:
            out.append("~~")
        elif 0x20 <= unit < 0x7E or unit == 0x0A:
            out.append(chr(unit))
        else:
            out.append("~u%04x" % unit)
    return "".join(out)


def decode_text(value):
    stray = TOKEN.sub("", value)
    if "~" in stray:
        raise SystemExit("A read holds a tilde outside ~~ and ~uXXXX; it was not written by the reader")
    if not value.isascii() or any(ord(c) < 0x20 and c != "\n" for c in value):
        raise SystemExit("A read holds a character outside printable ASCII; text must arrive as the reader wrote it")
    text = TOKEN.sub(lambda m: "~" if m.group(1) == "~" else chr(int(m.group(1)[1:], 16)), value)
    if any(0xD800 <= ord(c) <= 0xDFFF for c in text):
        text = text.encode("utf-16-be", "surrogatepass").decode("utf-16-be", "replace")
    return text


def transform(value, text):
    """Apply text() to every string of a JSON value, keys included."""
    if isinstance(value, str):
        return text(value)
    if isinstance(value, list):
        return [transform(item, text) for item in value]
    if isinstance(value, dict):
        return {text(key): transform(item, text) for key, item in value.items()}
    return value


def reader_sha256():
    return export.sha256(READER_JS.encode("utf-8"))


def clean_registry(value):
    registry = value.strip().strip("/")
    if not registry or Path(registry).is_absolute() or ".." in Path(registry).parts:
        raise SystemExit("--registry must be a repository-relative path, got %r" % value)
    if "chat-histories" not in Path(registry).parts:
        raise SystemExit("--registry must lie in a chat-histories folder, got %r" % value)
    return Path(registry).as_posix()


def history_registries(root):
    """Every chat-history registry index under root, skipping hidden folders."""
    found = []
    for folder, subfolders, files in os.walk(root):
        subfolders[:] = sorted(d for d in subfolders if not d.startswith("."))
        path = Path(folder)
        if "index.json" in files and "chat-histories" in path.relative_to(root).parts:
            found.append(path / "index.json")
    return found


def holder(root, session_id):
    """(registry, entry) of the registry that holds a session, or None; an error if several do."""
    holders = []
    for index_path in history_registries(root):
        try:
            index = json.loads(index_path.read_text(encoding="utf-8"))
        except ValueError:
            continue
        for entry in index.get("chats", []):
            if entry.get("conversation_id") == session_id:
                holders.append((index_path.parent.relative_to(root).as_posix(), entry))
    if len(holders) > 1:
        raise SystemExit("The session is registered in several registries: %s" % ", ".join(h[0] for h in holders))
    return holders[0] if holders else None


def store_path(store_dir, session_id):
    if not SESSION_ID.fullmatch(session_id):
        raise SystemExit("Not a Cowork session id (cse_…): %r" % session_id)
    return Path(store_dir).expanduser() / ("%s.json" % session_id)


def load_store(path):
    if not path.is_file():
        return None
    doc = json.loads(path.read_text(encoding="utf-8"))
    if not str(doc.get("format", "")).startswith("rh-cowork-session-events/2") or len(doc.get("sessions", [])) != 1:
        raise SystemExit("%s is not a session store of this script" % path)
    return doc


def store_bytes(doc):
    return (json.dumps(doc, ensure_ascii=False, indent=1) + "\n").encode("utf-8")


def write_store(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(".json.tmp")
    temporary.write_bytes(data)
    temporary.replace(path)


@contextlib.contextmanager
def registry_lock(folder):
    """The refresh tool's lock on a registry, where the platform provides one."""
    try:
        import refresh_chat_history as refresh
    except Exception:  # no fcntl, or the tool is absent from a partial copy
        yield
        return
    with refresh.registry_lock(folder, 10):
        yield


# ------------------------------------------------------------------- script

INSTALLED = ("await (async () => { const d = await crypto.subtle.digest('SHA-256', new TextEncoder().encode("
             "window.rhCoworkRead.toString())); return 'rhCoworkRead installed, source sha256 ' + "
             "Array.from(new Uint8Array(d)).map(x => x.toString(16).padStart(2, '0')).join(''); })()")


def cmd_script(args):
    print("window.rhCoworkRead = %s;\n%s" % (READER_JS, INSTALLED))
    note("The page should answer: rhCoworkRead installed, source sha256 %s" % reader_sha256())


def read_call(session_id, since_seq):
    return "await window.rhCoworkRead('%s', %d)" % (session_id, since_seq)


# ------------------------------------------------------------------- status

def cmd_status(args):
    root = Path(args.root).resolve() if args.root else ROOT
    path = store_path(args.store_dir, args.session_id)
    registered = holder(root, args.session_id)
    chosen = clean_registry(args.registry) if args.registry else None
    if chosen and registered and chosen != registered[0]:
        raise SystemExit("The session is already registered in %s, not %s; refresh it there" % (registered[0], chosen))
    registry = registered[0] if registered else chosen
    report = {"session_id": args.session_id, "registry": registry, "registered": None, "index_exists": False,
              "store": None, "since_seq": 0}
    if registry:
        report["index_exists"] = (root / registry / "index.json").is_file()
    if registered:
        report["registered"] = {key: registered[1].get(key) for key in
                                ("number", "file", "message_count", "captured_at_utc", "last_message_at_utc")}
    store = load_store(path)
    if store:
        session = store["sessions"][0]
        report["store"] = {"path": str(path), "through_seq": session["through_seq"],
                           "records": len(session["records"]), "complete": not session.get("more")}
        report["since_seq"] = session["through_seq"]
    report["read"] = read_call(args.session_id, report["since_seq"])
    report["reader_sha256"] = reader_sha256()
    hints = []
    if registry is None:
        hints.append("Not registered yet: pass --registry to ingest, the investigation's "
                     "chat-histories/claude-cowork or the root chat-histories/claude-cowork")
    elif not report["index_exists"]:
        hints.append("No index.json in the registry yet: pass --new-registry to ingest")
    if registered and not store:
        hints.append("No store on this machine: the read starts again from sequence 0 and rebuilds it")
    hints.append("If window.rhCoworkRead is undefined in the page, install it with the output of `script`")
    report["hints"] = hints
    print(json.dumps(report, indent=1))


# ------------------------------------------------------------------ pending

CLOSED = ("completed", "interrupted", "error")


def cmd_pending(args):
    root = Path(args.root).resolve() if args.root else ROOT
    found = []
    for index_path in history_registries(root):
        try:
            index = json.loads(index_path.read_text(encoding="utf-8"))
        except ValueError:
            continue
        for entry in index.get("chats", []):
            session_id = entry.get("conversation_id") or ""
            if not SESSION_ID.fullmatch(session_id) or session_id == args.except_session_id:
                continue
            try:
                conversation = json.loads((index_path.parent / entry["file"]).read_text(encoding="utf-8"))[0]
            except (OSError, ValueError, LookupError):
                continue
            turns = list((conversation.get("archive_metadata", {}).get("turns") or {}).values())
            status = turns[-1].get("status") if turns else None
            if status in CLOSED:
                continue
            store = load_store(store_path(args.store_dir, session_id))
            since = store["sessions"][0]["through_seq"] if store else 0
            found.append({"registry": index_path.parent.relative_to(root).as_posix(), "number": entry.get("number"),
                          "title": entry.get("title"), "session_id": session_id, "last_turn": status,
                          "captured_at_utc": entry.get("captured_at_utc"),
                          "message_count": entry.get("message_count"), "since_seq": since,
                          "read": read_call(session_id, since)})
    print(json.dumps({"open": found}, ensure_ascii=False, indent=1))


# ------------------------------------------------------------------- ingest

def checked_body(payload):
    """The decoded body of a read whose SHA-256 matches, else an error that says what differs."""
    if not isinstance(payload, dict) or payload.get("format") != READ_FORMAT or not isinstance(payload.get("body"), dict):
        raise SystemExit("Expected the object a %s read returns: {body, body_bytes, format, sha256}" % READ_FORMAT)
    body = payload["body"]
    data = export.canonical(body)
    digest = export.sha256(data)
    if digest != payload.get("sha256"):
        raise SystemExit("SHA-256 mismatch: the body received hashes to %s (%d bytes), the read gave %s (%s bytes). "
                         "Nothing was stored; copy the read again, or read again"
                         % (digest, len(data), payload.get("sha256"), payload.get("body_bytes")))
    body = transform(body, decode_text)
    if body.get("format") != READ_FORMAT:
        raise SystemExit("Unsupported read format: %r" % body.get("format"))
    for key in ("session", "log", "since_seq", "through_seq", "more", "records"):
        if key not in body:
            raise SystemExit("The read lacks %r" % key)
    expected = reader_sha256()
    if body["log"].get("reader_sha256") != expected:
        raise SystemExit("The read was made by a reader whose text hashes to %s; this script's reader hashes to %s. "
                         "Nothing was stored; install the reader again from the output of `script`"
                         % (body["log"].get("reader_sha256"), expected))
    return body, digest


def merge_read(store, body, digest, args):
    """Add a read to the store document (created if None) and return it."""
    session_id = body["session"]["id"]
    if store is None:
        store = {"format": STORE_FORMAT,
                 "fetched_by": "the reader of tools/%s, run in a browser signed in to claude.ai" % Path(__file__).name,
                 "started_at": body["log"]["read_started_at"], "finished_at": None,
                 "sessions": [{"session": {}, "records": [], "through_seq": 0, "more": False, "reads": [],
                               "delivered": []}]}
    entry = store["sessions"][0]
    if entry["session"] and entry["session"].get("id") != session_id:
        raise SystemExit("The store is of %s, not %s" % (entry["session"].get("id"), session_id))
    if body["since_seq"] > entry["through_seq"]:
        raise SystemExit("The store reaches sequence %d but the read starts after %d; read again with since_seq %d"
                         % (entry["through_seq"], body["since_seq"], entry["through_seq"]))
    known = {record["seq"]: record for record in entry["records"]}
    added = 0
    for record in body["records"]:
        seq = record.get("seq")
        if not isinstance(seq, int) or isinstance(seq, bool):
            raise SystemExit("A record lacks an integer sequence number")
        if seq in known:
            if export.canonical(known[seq]) != export.canonical(record):
                raise SystemExit("The record at sequence %d differs from the one already stored" % seq)
            continue
        if seq <= entry["through_seq"]:
            raise SystemExit("The read adds a record at sequence %d inside the range the store already covers "
                             "(through %d); inspect the store before continuing" % (seq, entry["through_seq"]))
        entry["records"].append(record)
        known[seq] = record
        added += 1
    entry["records"].sort(key=lambda record: record["seq"])
    entry["through_seq"] = max(entry["through_seq"], body["through_seq"])
    entry["more"] = bool(body["more"])

    meta = dict(entry["session"])
    meta.update(body["session"])
    project_uuid = export.project_uuid_from_tag(meta.get("chat_project_id"))
    if args.project_uuid:
        if project_uuid != args.project_uuid.lower():
            raise SystemExit("chat_project_id %s decodes to %s, not the stated project %s"
                             % (meta.get("chat_project_id"), project_uuid, args.project_uuid))
        meta["project_uuid_source"] = "stated to ingest and equal to the decoded chat_project_id"
    meta["project_uuid"] = project_uuid
    if args.project_name:
        meta["project_name"] = args.project_name
        meta["project_name_source"] = "stated to ingest by the capturing session"
    meta.setdefault("project_name", None)
    meta["url"] = "https://claude.ai/code/session_%s" % session_id[len("cse_"):]
    sdk_ids = body["log"].get("sdk_session_ids") or []
    if args.sdk_session_id:
        if args.sdk_session_id not in sdk_ids:
            raise SystemExit("The log does not name SDK session %s (it names %s); this is not the running session's log"
                             % (args.sdk_session_id, ", ".join(sdk_ids) or "none"))
        meta["identity_check"] = ("the log names the SDK session id %s that the capturing session read from its "
                                  "own workspace" % args.sdk_session_id)
    meta.setdefault("identity_check", None)
    entry["session"] = meta

    log = body["log"]
    for key in ("events_read", "pages", "first_seq", "last_seq", "sha256_of_events_json", "events_json_bytes",
                "event_counts", "subagent_messages_omitted", "progress_updates", "sdk_session_ids"):
        entry[key] = log.get(key)
    if not any(earlier["transfer_sha256"] == digest for earlier in entry["reads"]):  # the same read, passed again
        entry["reads"].append({"read_started_at_utc": log.get("read_started_at"),
                               "read_finished_at_utc": log.get("read_finished_at"),
                               "since_seq": body["since_seq"], "through_seq": body["through_seq"],
                               "records": len(body["records"]), "records_added": added, "more": bool(body["more"]),
                               "log_last_seq": log.get("last_seq"), "log_events": log.get("events_read"),
                               "sha256_of_events_json": log.get("sha256_of_events_json"),
                               "reader_sha256": log.get("reader_sha256"), "transfer_sha256": digest})
    for path in args.delivered or []:
        if path not in entry["delivered"]:
            entry["delivered"].append(path)
    store["finished_at"] = log.get("read_finished_at")
    return store, added


def finish_conversation(conversation, entry, store_file, store_data):
    """Describe the incremental reading in a conversion made by record_Claude_export_chat.py."""
    meta = conversation["archive_metadata"]
    meta["source_kind"] = SOURCE_KIND
    meta["coverage"] = COVERAGE
    meta["message_timestamps"] = TIMESTAMPS
    meta["delivered_files_note"] = DELIVERED_NOTE
    session = meta["session"]
    if session.get("title_source", "").startswith("the session's title"):
        session["title_source"] = "the title in the session object on claude.ai"
    stored = entry["session"]
    session["project"]["name_source"] = stored.get("project_name_source")
    session["project"]["uuid_source"] = stored.get("project_uuid_source") or "decoded from chat_project_id"
    session["project"]["chat_project_id_decodes_to_uuid"] = stored.get("project_uuid") is not None
    session["identity_check"] = stored.get("identity_check")
    session["last_served_model"] = stored.get("last_served_model")
    turns = meta["turns"]
    if turns:
        key = list(turns)[-1]
        if turns[key].get("status") == "no_result_recorded" and stored.get("status_bucket") == "working":
            turns[key] = {"status": "in_progress", **{k: v for k, v in turns[key].items() if k != "status"}}
    source = meta["source_events"]
    source["events_file"] = Path(store_file).name
    source["events_file_sha256"] = export.sha256(store_data)
    source["reduction"] = "public records only; the reader drops every other event in the page"
    source["progress_updates_in_log"] = entry.get("progress_updates")
    source["reads"] = entry["reads"]
    source["read_between_utc"] = [entry["reads"][0]["read_started_at_utc"], entry["reads"][-1]["read_finished_at_utc"]]
    source["note"] = STORE_NOTE
    script = Path(__file__).resolve()
    meta["capture"] = {"script": script.name, "sha256": export.sha256(script.read_bytes()),
                       "read_format": READ_FORMAT}
    return conversation


def carry_forward(conversation, earlier):
    """Keep what the registered record states and a rebuilt store no longer knows."""
    new, old = conversation["archive_metadata"], earlier.get("archive_metadata", {})
    old_session, old_source = old.get("session") or {}, old.get("source_events") or {}
    project, old_project = new["session"]["project"], old_session.get("project") or {}
    if project.get("name") is None and old_project.get("name") and old_project.get("uuid") == project.get("uuid"):
        project["name"], project["name_source"] = old_project["name"], old_project.get("name_source")
    if new["session"].get("identity_check") is None and old_session.get("identity_check"):
        new["session"]["identity_check"] = old_session["identity_check"]
    new["delivered_files_not_embedded"] = list(dict.fromkeys(
        list(old.get("delivered_files_not_embedded") or []) + new["delivered_files_not_embedded"]))
    known = {read["transfer_sha256"] for read in new["source_events"]["reads"]}
    before = []
    for read in list(old_source.get("earlier_reads") or []) + list(old_source.get("reads") or []):
        if read.get("transfer_sha256") not in known and read not in before:
            before.append(read)
    if before:
        new["source_events"]["earlier_reads"] = before
    return conversation


def model_name(identifier):
    parts = (identifier or "").split("-")
    words = [p.capitalize() for p in parts if not p.isdigit()]
    digits = [p for p in parts if p.isdigit()]
    return " ".join(words) + (" " + ".".join(digits) if digits else "")


def readme_stub_text(folder, number=None, conversation_id=None):
    """A draft registry README entry, in the numbered-list form of the claude-cowork registries."""
    folder = Path(folder)
    index = json.loads((folder / "index.json").read_text(encoding="utf-8"))
    entries = index["chats"]
    if number is not None:
        entries = [e for e in entries if e["number"] == number]
    elif conversation_id:
        entries = [e for e in entries if e["conversation_id"] == conversation_id]
    if not entries:
        raise SystemExit("No matching chat in %s" % (folder / "index.json"))
    entry = entries[-1]
    conversation = json.loads((folder / entry["file"]).read_text(encoding="utf-8"))[0]
    meta = conversation.get("archive_metadata", {})
    project = ((meta.get("session") or {}).get("project") or {}).get("name")
    models = " and ".join("%s (`%s`, reasoning effort %s per the session's configuration)"
                          % (model_name(c.get("model")), c.get("model"), c.get("reasoning_effort"))
                          for c in entry.get("model_configurations") or [{}])
    started = datetime.fromisoformat(entry["created_at_local"])
    captured = datetime.fromisoformat(entry["captured_at_local"])
    when = "the same day" if captured.date() == started.date() else \
        "on %d %s" % (captured.day, captured.strftime("%B %Y"))
    turns = meta.get("turns", {})
    count = entry["message_count"]
    session = ("A Claude Cowork cloud session%s with %s, started %d %s at %s America/New_York."
               % (" in project %s" % project if project else "", models, started.day,
                  started.strftime("%B %Y"), started.strftime("%H:%M")))
    capture = ("Captured from the session's claude.ai event log with `%s ingest`, first at %s %s (%d message%s "
               "over %d turn%s), and refreshed at the end of every later turn, before that turn's reply; "
               "[index.json](index.json) gives the current count."
               % (Path(__file__).name, captured.strftime("%H:%M"), when, count, "" if count == 1 else "s",
                  len(turns), "" if len(turns) == 1 else "s"))
    bullets = ["*Work.* TODO: one sentence on what the conversation did, with links to its saved outputs.",
               "*Session.* " + session, "*Capture.* " + capture]
    lines = ["%d. **%s** — [%s](%s)" % (entry["number"], entry["title"], entry["file"], entry["file"])]
    for bullet in bullets:
        lines.append(textwrap.fill("- " + bullet, width=78, initial_indent="   ", subsequent_indent="     ",
                                   break_on_hyphens=False, break_long_words=False))
    return "\n".join(lines) + "\n"


def cmd_ingest(args):
    root = Path(args.root).resolve() if args.root else ROOT
    source = sys.stdin.read() if args.input == "-" else Path(args.input).read_text(encoding="utf-8")
    try:
        payload = json.loads(source)
    except ValueError as error:
        raise SystemExit("The read is not JSON: %s" % error)
    body, digest = checked_body(payload)
    session_id = body["session"]["id"]
    if args.session_id and args.session_id != session_id:
        raise SystemExit("The read is of %s, not %s" % (session_id, args.session_id))
    path = store_path(args.store_dir, session_id)

    registered = holder(root, session_id)
    chosen = clean_registry(args.registry) if args.registry else None
    if chosen and registered and chosen != registered[0]:
        raise SystemExit("The session is already registered in %s, not %s; refresh it there" % (registered[0], chosen))
    registry = registered[0] if registered else chosen
    if registry is None and not args.dry_run:
        raise SystemExit("Not registered yet: pass --registry, the investigation's chat-histories/claude-cowork "
                         "or the root chat-histories/claude-cowork")
    folder = root / registry if registry else None
    if folder is not None and not args.dry_run:
        has_index = (folder / "index.json").is_file()
        if not has_index and not args.new_registry:
            raise SystemExit("No index.json at %s; pass --new-registry for a registry that has none yet" % folder)
        if has_index and args.new_registry:
            raise SystemExit("--new-registry given, but %s exists" % (folder / "index.json"))

    existing = load_store(path)
    if args.rebuild_store:
        if body["since_seq"] != 0:
            raise SystemExit("--rebuild-store needs a read that starts at sequence 0")
        existing = None
    store, added = merge_read(existing, body, digest, args)
    data = store_bytes(store)
    if not args.dry_run:
        write_store(path, data)
    entry = store["sessions"][0]
    report = {"session_id": session_id, "store": None if args.dry_run else str(path), "records_added": added,
              "records_stored": len(entry["records"]), "through_seq": entry["through_seq"], "more": entry["more"],
              "next_since_seq": entry["through_seq"], "next_read": read_call(session_id, entry["through_seq"])}
    if entry["more"]:
        report["next"] = "The log holds more: run next_read and ingest it; nothing is registered until the last part"
        print(json.dumps(report, ensure_ascii=False, indent=1))
        return

    meta = entry["session"]
    title = args.title or meta.get("title")
    if not title:
        raise SystemExit("The session has no title yet; pass --title")
    conversation = export.cowork_conversation(store, data, path, session_id,
                                              {"title": args.title, "delivered": entry["delivered"]})
    conversation["title"] = title
    conversation = finish_conversation(conversation, entry, path, data)
    if registered and folder is not None:
        record = folder / registered[1]["file"]
        if record.is_file():
            carry_forward(conversation, json.loads(record.read_text(encoding="utf-8"))[0])
    text = (json.dumps(conversation, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
    if args.output:
        Path(args.output).write_bytes(text)
        note("wrote %s  sha256 %s  (%d bytes)" % (args.output, export.sha256(text), len(text)))
    archive = conversation["archive_metadata"]
    report.update(message_count=sum(node.get("message") is not None for node in conversation["mapping"].values()),
                  turns={key[:8]: turn["status"] for key, turn in archive["turns"].items()})
    if args.dry_run:
        report["next"] = "Dry run: the read is good, and neither the store nor the registry was written"
        print(json.dumps(report, ensure_ascii=False, indent=1))
        return

    recorder = Path(args.recorder).resolve() if args.recorder else export.DEFAULT_RECORDER
    if not recorder.is_file():
        raise SystemExit("Recorder not found: %s" % recorder)
    with tempfile.TemporaryDirectory(prefix="cowork-events-") as scratch:
        converted = Path(scratch) / "conversation.json"
        converted.write_bytes(text)
        command = [sys.executable, str(recorder), "--import-json", str(converted), "--folder", str(folder)]
        if args.allow_shorter_refresh:
            command.append("--allow-shorter-refresh")
        folder.mkdir(parents=True, exist_ok=True)
        with registry_lock(folder):
            result = subprocess.run(command, capture_output=True, text=True)
    if result.returncode:
        sys.stderr.write(result.stdout + result.stderr)
        raise SystemExit(result.returncode)
    summary = json.loads(result.stdout.strip().splitlines()[-1])
    report.update(registry=registry, number=summary["number"], file=summary["file"],
                  message_count=summary["messages"], new_chat=registered is None,
                  readme_stub=None if registered else readme_stub_text(folder, number=summary["number"]))
    report["next"] = ("Registered" if registered else
                      "Registered as a new chat: add readme_stub, with its Work sentence written, to the registry README")
    print(json.dumps(report, ensure_ascii=False, indent=1))


def cmd_readme_stub(args):
    root = Path(args.root).resolve() if args.root else ROOT
    sys.stdout.write(readme_stub_text(root / clean_registry(args.registry), args.number, args.conversation_id))


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("script", help="Print the reader to install in a signed-in claude.ai page")
    p.set_defaults(func=cmd_script)

    p = sub.add_parser("status", help="On the computer: where a session is registered and the read to run next")
    p.add_argument("--session-id", required=True, help="The Cowork session id (cse_…)")
    p.add_argument("--registry", help="Repository-relative registry folder, for a first capture")
    p.add_argument("--store-dir", default=DEFAULT_STORE_DIR, help="Folder of the session stores (default: %(default)s)")
    p.add_argument("--root", help="Repository root (default: the one holding this script)")
    p.set_defaults(func=cmd_status)

    p = sub.add_parser("pending", help="On the computer: registered sessions whose last turn is not closed")
    p.add_argument("--except-session-id", help="Leave this session out (the one that is running)")
    p.add_argument("--store-dir", default=DEFAULT_STORE_DIR, help="Folder of the session stores (default: %(default)s)")
    p.add_argument("--root", help="Repository root (default: the one holding this script)")
    p.set_defaults(func=cmd_pending)

    p = sub.add_parser("ingest", help="On the computer: check a read, store it, convert and register")
    p.add_argument("--input", default="-", help="File holding the read, or - for standard input (default)")
    p.add_argument("--session-id", help="Refuse a read of any other session")
    p.add_argument("--registry", help="Repository-relative registry folder (needed for a first capture)")
    p.add_argument("--new-registry", action="store_true", help="The registry has no index.json yet")
    p.add_argument("--sdk-session-id", help="CLAUDE_CODE_SESSION_ID of the capturing session's workspace; the log must name it")
    p.add_argument("--project-name", help="The claude.ai project the session is attached to, as the session states it")
    p.add_argument("--project-uuid", help="That project's UUID; must equal the decoded chat_project_id")
    p.add_argument("--title", help="Override the session's title")
    p.add_argument("--delivered", action="append", metavar="PATH",
                   help="Delivered file the log does not show (repeatable; remembered in the store)")
    p.add_argument("--store-dir", default=DEFAULT_STORE_DIR, help="Folder of the session stores (default: %(default)s)")
    p.add_argument("--rebuild-store", action="store_true",
                   help="Discard this machine's store of the session and start it from a read at sequence 0")
    p.add_argument("--root", help="Repository root (default: the one holding this script)")
    p.add_argument("--recorder", help="record_chat.py to use (default: tools/record_chat.py)")
    p.add_argument("--output", help="Also write the converted conversation here")
    p.add_argument("--dry-run", action="store_true",
                   help="Check and convert the read; write neither the store nor the registry")
    p.add_argument("--allow-shorter-refresh", action="store_true")
    p.set_defaults(func=cmd_ingest)

    p = sub.add_parser("readme-stub", help="Draft a registry README entry for a registered chat")
    p.add_argument("--registry", required=True, help="Repository-relative registry folder")
    p.add_argument("--number", type=int)
    p.add_argument("--conversation-id")
    p.add_argument("--root", help="Repository root (default: the one holding this script)")
    p.set_defaults(func=cmd_readme_stub)

    args = parser.parse_args(argv)
    args.func(args)


if __name__ == "__main__":
    main()
