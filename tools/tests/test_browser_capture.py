"""Check the event-log capture of Cowork sessions: transfer, store, conversion and registration.

Synthetic data only. The reader itself runs under Node when it is installed;
no test contacts claude.ai, and passing them does not show that the live
endpoints still answer.
"""
import contextlib
import io
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))
import record_Claude_browser_chat as browser  # noqa: E402
import record_Claude_export_chat as export  # noqa: E402

SESSION = "cse_01SyntheticSession0000000"
SDK = "11111111-2222-5333-8444-555555555555"
PROJECT_UUID = "01a206ce-2bd2-72df-8520-4722487e9bc8"
PROMPT = "aaaaaaaa-0000-4000-8000-000000000001"
REGISTRY = "chat-histories/claude-cowork"
TRICKY = "Poincaré ĝ_A ~ tilde, “quotes”, tab\there, back\\slash, emoji \U0001f600, ~u00e9 literal"


def project_tag(uuid_text):
    number, digits = int(uuid_text.replace("-", ""), 16), ""
    while number:
        number, remainder = divmod(number, 58)
        digits = export.BASE58[remainder] + digits
    return export.PROJECT_TAG + digits


def session_meta(status="working"):
    return {"id": SESSION, "title": "Synthetic capture check", "created_at": "2026-11-23T16:12:53.927667Z",
            "last_event_at": "2026-11-23T16:41:26.276973Z", "status_bucket": status,
            "chat_project_id": project_tag(PROJECT_UUID), "model": "claude-synthetic-1", "effort_level": "max",
            "origin": "desktop_app", "permission_mode": "auto", "user_selected_folders": ["synthetic-repo"],
            "last_served_model": "claude-synthetic-1"}


def first_records():
    """What the reader keeps of a turn that asked one question and is still running."""
    return [
        {"seq": 7, "created_at": "2026-11-23T16:13:57.058698Z", "source": "client", "type": "user",
         "uuid": PROMPT, "timestamp": None, "blocks": [{"type": "text", "text": "Please check " + TRICKY}]},
        {"seq": 13, "created_at": "2026-11-23T16:13:57.453865Z", "source": "worker", "type": "result",
         "subtype": "success", "is_error": False, "stop_reason": None, "terminal_reason": None,
         "user_message_uuids": ["aaaaaaaa-0000-4000-8000-000000000000"], "origin": {"kind": "human"},
         "uuid": "aaaaaaaa-0000-4000-8000-0000000000ff"},
        {"seq": 20, "created_at": "2026-11-23T16:24:39.310785Z", "source": "worker", "type": "assistant",
         "uuid": "bbbbbbbb-0000-4000-8000-000000000001", "timestamp": "2026-11-23T16:24:39.287Z",
         "blocks": [{"type": "tool_use", "id": "toolu_note", "name": "SendUserMessage",
                     "input": {"message": "A note between tool calls.\n\nSecond paragraph."}}],
         "model": "claude-synthetic-1", "message_id": "msg_1", "stop_reason": None},
        {"seq": 22, "created_at": "2026-11-23T16:24:47.310862Z", "source": "worker", "type": "assistant",
         "uuid": "bbbbbbbb-0000-4000-8000-000000000002", "timestamp": "2026-11-23T16:24:47.290Z",
         "blocks": [{"type": "tool_use", "id": "toolu_ask", "name": "AskUserQuestion",
                     "input": {"questions": [{"header": "Scope", "question": "Which one?",
                                              "options": [{"label": "A", "description": "First"},
                                                          {"label": "B", "description": "Second"}]}]}}],
         "model": "claude-synthetic-1", "message_id": "msg_1", "stop_reason": None},
        {"seq": 25, "created_at": "2026-11-23T16:31:03.188796Z", "source": "worker", "type": "user",
         "uuid": "cccccccc-0000-4000-8000-000000000001", "timestamp": "2026-11-23T16:31:03.134Z",
         "blocks": [{"type": "tool_result", "tool_use_id": "toolu_ask", "name": "AskUserQuestion",
                     "is_error": False}],
         "tool_use_result": {"answers": {"Which one?": "A"}, "annotations": {},
                             "questions": [{"header": "Scope", "question": "Which one?"}]}},
    ]


def later_records():
    """A progress update, the closing text of the turn, and its result."""
    return [
        {"seq": 40, "created_at": "2026-11-23T16:40:00.100000Z", "source": "worker", "type": "assistant",
         "uuid": "bbbbbbbb-0000-4000-8000-000000000003", "timestamp": "2026-11-23T16:40:00.000Z",
         "blocks": [{"type": "text", "text": "Reading the files next.", "narration": True}],
         "model": "claude-synthetic-1", "message_id": "msg_2", "stop_reason": None},
        {"seq": 55, "created_at": "2026-11-23T16:50:00.100000Z", "source": "worker", "type": "assistant",
         "uuid": "bbbbbbbb-0000-4000-8000-000000000004", "timestamp": "2026-11-23T16:50:00.000Z",
         "blocks": [{"type": "text", "text": "Done. Here is the result."}],
         "model": "claude-synthetic-1", "message_id": "msg_3", "stop_reason": "end_turn"},
        {"seq": 57, "created_at": "2026-11-23T16:50:01.000000Z", "source": "worker", "type": "result",
         "subtype": "success", "is_error": False, "stop_reason": "end_turn", "terminal_reason": None,
         "user_message_uuids": [PROMPT], "origin": {"kind": "human"},
         "uuid": "aaaaaaaa-0000-4000-8000-0000000000fe"},
    ]


def read(records, since, through, more=False, status="working", events=60):
    """The object a reader returns, built in Python."""
    body = {"format": browser.READ_FORMAT, "session": session_meta(status),
            "log": {"events_read": events, "pages": 1, "first_seq": 1, "last_seq": events,
                    "sha256_of_events_json": "0" * 64, "events_json_bytes": 1000, "event_counts": {"user": 3},
                    "subagent_messages_omitted": 0, "progress_updates": 0, "public_records": len(records),
                    "sdk_session_ids": sorted([SDK, SESSION]), "reader_sha256": browser.reader_sha256(),
                    "read_started_at": "2026-11-23T16:45:00.000Z",
                    "read_finished_at": "2026-11-23T16:45:01.000Z"},
            "since_seq": since, "through_seq": through, "more": more, "records": records}
    body = browser.transform(body, browser.encode_text)
    data = export.canonical(body)
    return {"format": browser.READ_FORMAT, "sha256": export.sha256(data), "body_bytes": len(data), "body": body}


class Workspace(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="browser-capture-")
        self.root = Path(self.temp.name) / "repo"
        (self.root / "papers").mkdir(parents=True)
        (self.root / "tools").mkdir()
        self.store = Path(self.temp.name) / "stores"
        self.count = 0

    def tearDown(self):
        self.temp.cleanup()

    def run_tool(self, *arguments):
        output = io.StringIO()
        with contextlib.redirect_stdout(output), contextlib.redirect_stderr(io.StringIO()):
            browser.main(list(arguments))
        return output.getvalue()

    def ingest(self, payload, *arguments, as_displayed=True):
        self.count += 1
        path = Path(self.temp.name) / ("read-%d.json" % self.count)
        # The browser tool shows the object with sorted keys and indentation; the hash must not depend on that.
        path.write_text(json.dumps(payload, indent=2, sort_keys=True) if as_displayed else json.dumps(payload))
        return json.loads(self.run_tool("ingest", "--input", str(path), "--root", str(self.root),
                                        "--store-dir", str(self.store), *arguments))

    def first(self, *extra):
        return self.ingest(read(first_records(), 0, 30, events=30), "--registry", REGISTRY, "--new-registry",
                           "--sdk-session-id", SDK, "--project-name", "Synthetic project",
                           "--project-uuid", PROJECT_UUID, *extra)

    def registered(self):
        index = json.loads((self.root / REGISTRY / "index.json").read_text())
        entry = index["chats"][0]
        data = (self.root / REGISTRY / entry["file"]).read_bytes()
        return index, entry, data, json.loads(data)[0]

    @staticmethod
    def chain(conversation):
        found, node = [], conversation["mapping"]["root"]
        while node["children"]:
            node = conversation["mapping"][node["children"][-1]]
            found.append(node["message"])
        return found


class TransferTests(Workspace):
    def test_text_survives_the_ascii_transfer_form(self):
        encoded = browser.encode_text(TRICKY)
        self.assertTrue(encoded.isascii())
        self.assertNotIn("\t", encoded)
        self.assertEqual(browser.decode_text(encoded), TRICKY)
        value = {TRICKY: [TRICKY, {"k": "line one\nline two"}], "n": 3, "b": True, "z": None}
        self.assertEqual(browser.transform(browser.transform(value, browser.encode_text), browser.decode_text), value)

    def test_script_prints_the_reader_as_an_installable_expression(self):
        printed = self.run_tool("script")
        self.assertTrue(printed.startswith("window.rhCoworkRead = async function rhCoworkRead(id, sinceSeq, maxBytes) {"))
        self.assertIn(browser.READER_JS, printed)
        self.assertTrue(printed.rstrip().endswith("})()"))

    def test_altered_copy_is_refused_and_nothing_is_written(self):
        payload = read(first_records(), 0, 30)
        payload["body"]["records"][0]["blocks"][0]["text"] += "x"
        with self.assertRaises(SystemExit) as raised:
            self.ingest(payload, "--registry", REGISTRY, "--new-registry")
        self.assertIn("SHA-256 mismatch", str(raised.exception))
        self.assertFalse(self.store.exists())
        self.assertFalse((self.root / "chat-histories").exists())

    def test_raw_non_ascii_text_is_refused_even_with_a_matching_hash(self):
        body = read(first_records(), 0, 30)["body"]
        body["records"][0]["blocks"][0]["text"] = "café"
        data = export.canonical(body)
        payload = {"format": browser.READ_FORMAT, "sha256": export.sha256(data), "body_bytes": len(data), "body": body}
        with self.assertRaises(SystemExit) as raised:
            self.ingest(payload, "--registry", REGISTRY, "--new-registry")
        self.assertIn("outside printable ASCII", str(raised.exception))
        self.assertFalse(self.store.exists())


    def test_read_made_by_another_reader_text_is_refused(self):
        body = browser.transform(read(first_records(), 0, 30)["body"], browser.decode_text)
        body["log"]["reader_sha256"] = "f" * 64
        body = browser.transform(body, browser.encode_text)
        data = export.canonical(body)
        payload = {"format": browser.READ_FORMAT, "sha256": export.sha256(data), "body_bytes": len(data), "body": body}
        with self.assertRaises(SystemExit) as raised:
            self.ingest(payload, "--registry", REGISTRY, "--new-registry")
        self.assertIn("install the reader again", str(raised.exception))
        self.assertFalse(self.store.exists())


class CaptureTests(Workspace):
    def test_first_capture_opens_the_registry_with_public_messages_only(self):
        report = self.first("--delivered", "notes/synthetic.md")
        self.assertTrue(report["new_chat"])
        self.assertEqual((report["number"], report["message_count"], report["next_since_seq"]), (1, 4, 30))
        self.assertIn("TODO", report["readme_stub"])
        self.assertIn("record_Claude_browser_chat.py ingest", report["readme_stub"])
        index, entry, data, conversation = self.registered()
        self.assertEqual(entry["sha256"], export.sha256(data))
        self.assertEqual(entry["conversation_id"], SESSION)
        self.assertTrue(entry["file"].startswith("0001_2026-11-23T16-12-53Z_synthetic-capture-check"))
        messages = self.chain(conversation)
        self.assertEqual([m["author"]["role"] for m in messages], ["user", "assistant", "assistant", "user"])
        self.assertEqual(messages[0]["content"]["parts"][0], "Please check " + TRICKY)
        self.assertEqual(messages[1]["metadata"]["rendered_from_tool"], "SendUserMessage")
        self.assertIn("- A — First", messages[2]["content"]["parts"][0])
        self.assertEqual(messages[3]["content"]["parts"][0], "A")
        meta = conversation["archive_metadata"]
        self.assertEqual(list(meta["turns"].values())[0]["status"], "in_progress")
        self.assertEqual(meta["session"]["project"], {
            "name": "Synthetic project", "uuid": PROJECT_UUID, "chat_project_id": project_tag(PROJECT_UUID),
            "chat_project_id_decodes_to_uuid": True, "name_source": "stated to ingest by the capturing session",
            "uuid_source": "stated to ingest and equal to the decoded chat_project_id"})
        self.assertIn(SDK, meta["session"]["identity_check"])
        self.assertEqual(meta["session"]["claude_ai_session"], "https://claude.ai/code/session_" + SESSION[4:])
        self.assertEqual(meta["capture"]["script"], "record_Claude_browser_chat.py")
        self.assertEqual(meta["session"]["title_source"], "the title in the session object on claude.ai")
        self.assertIn("condensed form the event log holds", meta["coverage"])
        self.assertEqual(meta["source_events"]["reads"][0]["records_added"], 5)
        self.assertEqual(meta["delivered_files_not_embedded"], ["notes/synthetic.md"])
        self.assertEqual(entry["model_configurations"], [{"model": "claude-synthetic-1", "reasoning_effort": "max"}])

    def test_refresh_keeps_number_and_file_and_labels_updates_and_final_answer(self):
        self.first()
        _, before, _, _ = self.registered()
        report = self.ingest(read(later_records(), 30, 60, status="idle"), "--sdk-session-id", SDK)
        self.assertFalse(report["new_chat"])
        self.assertIsNone(report["readme_stub"])
        index, entry, _, conversation = self.registered()
        self.assertEqual((len(index["chats"]), entry["number"], entry["file"]), (1, before["number"], before["file"]))
        self.assertEqual(entry["message_count"], 6)
        messages = self.chain(conversation)
        update, final = messages[4], messages[5]
        self.assertEqual((update["metadata"]["kind"], update["metadata"]["phase"]), ("update", "commentary"))
        self.assertEqual(update["metadata"]["rendered_from"], "progress update")
        self.assertEqual((final["metadata"]["phase"], final["end_turn"]), ("final_answer", True))
        turn = list(conversation["archive_metadata"]["turns"].values())[0]
        self.assertEqual((turn["status"], turn["completed_at"]), ("completed", "2026-11-23T16:50:00.000Z"))
        self.assertEqual(len(conversation["archive_metadata"]["source_events"]["reads"]), 2)
        # The project stated at the first capture is remembered by the store.
        self.assertEqual(conversation["archive_metadata"]["session"]["project"]["name"], "Synthetic project")

    def test_delivered_files_accumulate_across_refreshes(self):
        self.first("--delivered", "notes/a.md")
        self.ingest(read(later_records(), 30, 60, status="idle"), "--delivered", "notes/b.md")
        self.assertEqual(self.registered()[3]["archive_metadata"]["delivered_files_not_embedded"],
                         ["notes/a.md", "notes/b.md"])

    def test_answers_follow_the_card_order_not_the_object_key_order(self):
        records = first_records()
        ask, answer = records[3], records[4]
        ask["blocks"][0]["input"]["questions"].append(
            {"header": "Again", "question": "And then?", "options": [{"label": "C", "description": "Third"}]})
        answer["tool_use_result"] = {"answers": {"And then?": "C", "Which one?": "A"}, "annotations": {},
                                     "questions": [{"header": "Scope", "question": "Which one?"},
                                                   {"header": "Again", "question": "And then?"}]}
        self.ingest(read(records, 0, 30), "--registry", REGISTRY, "--new-registry")
        self.assertEqual(self.chain(self.registered()[3])[3]["content"]["parts"][0], "Scope: A\nAgain: C")

    def test_a_progress_update_is_never_taken_for_the_final_answer(self):
        records = later_records()
        closing = [records[0], dict(records[2], seq=41)]
        self.first()
        self.ingest(read(closing, 30, 60, status="idle"))
        conversation = self.registered()[3]
        last = self.chain(conversation)[-1]
        self.assertEqual((last["metadata"]["kind"], last["metadata"]["phase"], last["end_turn"]),
                         ("update", "commentary", False))
        self.assertEqual(list(conversation["archive_metadata"]["turns"].values())[0]["status"], "completed")

    def test_dry_run_writes_nothing_and_a_repeated_read_is_recorded_once(self):
        payload = read(first_records(), 0, 30, events=30)
        output = Path(self.temp.name) / "conversion.json"
        tried = self.ingest(payload, "--registry", REGISTRY, "--new-registry", "--dry-run", "--output", str(output))
        self.assertEqual((tried["message_count"], tried["store"]), (4, None))
        self.assertTrue(output.is_file())
        self.assertFalse(self.store.exists())
        self.assertFalse((self.root / "chat-histories").exists())
        self.ingest(payload, "--registry", REGISTRY, "--new-registry")
        again = self.ingest(payload)
        self.assertEqual((again["records_added"], again["message_count"], again["new_chat"]), (0, 4, False))
        self.assertEqual(len(self.registered()[3]["archive_metadata"]["source_events"]["reads"]), 1)

    def test_gap_is_refused_and_overlap_is_deduplicated(self):
        self.first()
        with self.assertRaises(SystemExit) as raised:
            self.ingest(read(later_records(), 45, 60))
        self.assertIn("read again with since_seq 30", str(raised.exception))
        again = self.ingest(read(first_records() + later_records(), 0, 60, status="idle"))
        self.assertEqual((again["records_added"], again["records_stored"], again["message_count"]), (3, 8, 6))
        changed = first_records()
        changed[0]["blocks"][0]["text"] = "A different prompt"
        with self.assertRaises(SystemExit) as raised:
            self.ingest(read(changed, 0, 60))
        self.assertIn("differs from the one already stored", str(raised.exception))

    def test_multi_part_read_registers_only_after_the_last_part(self):
        records = first_records()
        part = self.ingest(read(records[:3], 0, 20, more=True), "--registry", REGISTRY, "--new-registry")
        self.assertTrue(part["more"])
        self.assertEqual(part["next_read"], "await window.rhCoworkRead('%s', 20)" % SESSION)
        self.assertFalse((self.root / REGISTRY / "index.json").exists())
        status = json.loads(self.run_tool("status", "--session-id", SESSION, "--registry", REGISTRY,
                                          "--root", str(self.root), "--store-dir", str(self.store)))
        self.assertEqual((status["since_seq"], status["store"]["complete"], status["registered"]), (20, False, None))
        done = self.ingest(read(records[3:], 20, 30), "--registry", REGISTRY, "--new-registry")
        self.assertEqual((done["more"], done["message_count"]), (False, 4))

    def test_identity_project_and_registry_checks(self):
        with self.assertRaises(SystemExit) as raised:
            self.ingest(read(first_records(), 0, 30), "--registry", REGISTRY, "--new-registry",
                        "--sdk-session-id", "99999999-0000-4000-8000-000000000000")
        self.assertIn("not the running session's log", str(raised.exception))
        with self.assertRaises(SystemExit) as raised:
            self.ingest(read(first_records(), 0, 30), "--registry", REGISTRY, "--new-registry",
                        "--project-uuid", "00000000-0000-4000-8000-000000000000")
        self.assertIn("not the stated project", str(raised.exception))
        self.assertFalse(self.store.exists())
        with self.assertRaises(SystemExit) as raised:
            self.ingest(read(first_records(), 0, 30), "--registry", REGISTRY)
        self.assertIn("--new-registry", str(raised.exception))
        with self.assertRaises(SystemExit):
            self.ingest(read(first_records(), 0, 30), "--registry", "tools/elsewhere", "--new-registry")
        self.first()
        with self.assertRaises(SystemExit) as raised:
            self.ingest(read(later_records(), 30, 60), "--registry", "papers/x/chat-histories/claude-cowork")
        self.assertIn("already registered in " + REGISTRY, str(raised.exception))

    def test_status_after_capture_and_on_a_machine_without_the_store(self):
        self.first()
        arguments = ("status", "--session-id", SESSION, "--root", str(self.root))
        here = json.loads(self.run_tool(*arguments, "--store-dir", str(self.store)))
        self.assertEqual((here["registry"], here["since_seq"], here["registered"]["message_count"]), (REGISTRY, 30, 4))
        self.assertEqual(here["read"], "await window.rhCoworkRead('%s', 30)" % SESSION)
        elsewhere = json.loads(self.run_tool(*arguments, "--store-dir", str(Path(self.temp.name) / "empty")))
        self.assertEqual((elsewhere["registry"], elsewhere["since_seq"], elsewhere["store"]), (REGISTRY, 0, None))
        # A full read on that machine rebuilds the store and refreshes the same chat.
        rebuilt = self.ingest(read(first_records() + later_records(), 0, 60, status="idle"),
                              "--store-dir", str(Path(self.temp.name) / "empty"))
        self.assertEqual((rebuilt["number"], rebuilt["message_count"], rebuilt["new_chat"]), (1, 6, False))
        # What only the first capture knew is carried forward from the registered record.
        meta = self.registered()[3]["archive_metadata"]
        self.assertEqual(meta["session"]["project"]["name"], "Synthetic project")
        self.assertIn(SDK, meta["session"]["identity_check"])
        self.assertEqual((len(meta["source_events"]["reads"]), len(meta["source_events"]["earlier_reads"])), (1, 1))

    def test_pending_lists_a_record_until_its_last_turn_is_closed(self):
        self.first()
        arguments = ("pending", "--root", str(self.root), "--store-dir", str(self.store))
        listed = json.loads(self.run_tool(*arguments))["open"]
        self.assertEqual([(e["registry"], e["session_id"], e["last_turn"], e["since_seq"]) for e in listed],
                         [(REGISTRY, SESSION, "in_progress", 30)])
        self.assertEqual(json.loads(self.run_tool(*arguments, "--except-session-id", SESSION))["open"], [])
        self.ingest(read(later_records(), 30, 60, status="idle"))
        self.assertEqual(json.loads(self.run_tool(*arguments))["open"], [])

    def test_shorter_refresh_is_left_to_the_recorder_to_refuse(self):
        self.first()
        with self.assertRaises(SystemExit):
            self.ingest(read(first_records()[:3], 0, 30), "--rebuild-store")
        self.assertEqual(self.registered()[1]["message_count"], 4)

    def test_registry_is_not_seen_by_the_codex_refresh_lookup(self):
        import refresh_chat_history as refresh
        self.first()
        self.assertIsNone(refresh.find_registered(self.root, SESSION))


def raw_log():
    """A synthetic session object and event log in the shape claude.ai returned on 23 November 2026."""
    def event(seq, kind, payload, source="worker", second=0):
        return {"event_id": "evt_%03d" % seq, "sequence_num": str(seq), "event_type": kind, "source": source,
                "created_at": "2026-11-23T16:%02d:%02d.000000Z" % (13 + seq // 10, second),
                "payload": dict(payload, type=kind, session_id=SDK if source == "worker" else SESSION)}

    def assistant(seq, blocks, **extra):
        return event(seq, "assistant", dict({"uuid": "bbbbbbbb-0000-4000-8000-%012d" % seq,
                                             "timestamp": "2026-11-23T16:%02d:00.500Z" % (13 + seq // 10),
                                             "parent_tool_use_id": None,
                                             "message": {"id": "msg_%d" % seq, "model": "claude-synthetic-1",
                                                         "stop_reason": None, "content": blocks}}, **extra))

    def tool_result(seq, tool_id, content, **extra):
        return event(seq, "user", dict({"uuid": "cccccccc-0000-4000-8000-%012d" % seq, "parent_tool_use_id": None,
                                        "timestamp": "2026-11-23T16:%02d:01.000Z" % (13 + seq // 10),
                                        "message": {"role": "user", "content": [
                                            {"type": "tool_result", "tool_use_id": tool_id, "content": content}]}},
                                       **extra))

    question = {"header": "Scöpe", "question": "Which “one”?", "multiSelect": False,
                "options": [{"label": "A", "description": "First", "preview": "PREVIEW-NOT-KEPT"},
                            {"label": "B", "description": "Second"}]}
    events = [
        event(1, "system", {"subtype": "init", "model": "claude-synthetic-1", "tools": ["TOOL-LIST-NOT-KEPT"]}),
        event(2, "user", {"uuid": "aaaaaaaa-0000-4000-8000-000000000000", "shouldQuery": False,
                          "message": {"role": "user", "content": [
                              {"type": "text", "text": "<system-reminder>MEMORY-NOT-KEPT</system-reminder>"}]}},
              source="client"),
        event(3, "user", {"uuid": PROMPT, "message": {"role": "user", "content": [
            {"type": "text", "text": "<system-reminder>CONTEXT-NOT-KEPT</system-reminder>Please check " + TRICKY}]}},
              source="client"),
        event(4, "result", {"subtype": "success", "is_error": False, "uuid": "aaaaaaaa-0000-4000-8000-0000000000ff",
                            "user_message_uuids": ["aaaaaaaa-0000-4000-8000-000000000000"],
                            "origin": {"kind": "human"}, "total_cost_usd": 1.25, "result": "RESULT-TEXT-NOT-KEPT"}),
        assistant(5, [{"type": "thinking", "thinking": "", "signature": "SIGNATURE-NOT-KEPT"}],
                  thinking_display="updates"),
        assistant(6, [{"type": "tool_use", "id": "toolu_bash", "name": "Bash",
                       "input": {"command": "COMMAND-NOT-KEPT"}}]),
        tool_result(7, "toolu_bash", [{"type": "text", "text": "OUTPUT-NOT-KEPT"}]),
        assistant(8, [{"type": "thinking", "thinking": "Reading the files next.\n\n", "signature": "S"}],
                  thinking_display="updates", narration_block_indexes=[0]),
        assistant(9, [{"type": "tool_use", "id": "toolu_note", "name": "SendUserMessage",
                       "input": {"message": "A note between tool calls.\n\nSecond paragraph."}}]),
        tool_result(10, "toolu_note", [{"type": "text", "text": "Message delivered to user."}]),
        assistant(11, [{"type": "tool_use", "id": "toolu_ask", "name": "AskUserQuestion",
                        "input": {"questions": [question]}}]),
        event(12, "control_request", {"request": {"subtype": "can_use_tool", "input": {"x": "PROMPT-NOT-KEPT"}}}),
        tool_result(13, "toolu_ask", "Your questions have been answered: ANSWER-PROSE-NOT-KEPT",
                    tool_use_result={"questions": [question], "answers": {"Which “one”?": "A"},
                                     "annotations": {"Which “one”?": {"notes": "because", "preview": "P"}}}),
        assistant(14, [{"type": "tool_use", "id": "toolu_sub", "name": "Agent", "input": {"prompt": "P"}}]),
        assistant(15, [{"type": "text", "text": "SUBAGENT-NOT-KEPT"}], parent_tool_use_id="toolu_sub"),
        assistant(16, [{"type": "tool_use", "id": "toolu_commit", "name": "mcp__remote-devices__device_commit_files",
                        "input": {"files": []}}]),
        tool_result(17, "toolu_commit", [{"type": "text", "text": json.dumps(
            {"written": ["/Users/someone/Documents/synthetic-repo/notes/a.md"], "rejected": []})}]),
        assistant(18, [{"type": "text", "text": "Done. Here is the result."}]),
        event(19, "result", {"subtype": "success", "is_error": False, "stop_reason": "end_turn",
                             "uuid": "aaaaaaaa-0000-4000-8000-0000000000fe", "user_message_uuids": [PROMPT],
                             "origin": {"kind": "human"}}),
        event(20, "rate_limit_event", {"rate_limit_info": {"status": "allowed"}}),
    ]
    session = {"response_shape": {
        "id": SESSION, "title": "Synthetic capture check", "created_at": "2026-11-23T16:12:53.927667Z",
        "last_event_at": "2026-11-23T16:41:26.276973Z", "status_bucket": "idle",
        "chat_project_id": project_tag(PROJECT_UUID), "session_url": "https://claude.ai/code/cshk_CAPABILITY-NOT-KEPT",
        "config": {"model": "claude-synthetic-1", "effort_level": "max", "origin": "desktop_app",
                   "permission_mode": "auto", "append_system_prompt": "SYSTEM-PROMPT-NOT-KEPT"},
        "client_metadata": {"remote_cowork": {"userSelectedFolders": [
            {"path": "/Users/someone/Documents/synthetic-repo", "deviceName": "DEVICE-NOT-KEPT", "addedAt": 1}]}},
        "external_metadata": {"last_served_model": "claude-synthetic-1", "usage": {"cost_usd": 3.5}}}}
    return {"session": session, "events": events}


HARNESS = r'''
const fs = require('fs');
if (!globalThis.crypto || !globalThis.crypto.subtle) globalThis.crypto = require('crypto').webcrypto;
const fixture = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
const newestFirst = fixture.events.slice().reverse();
globalThis.fetch = async (url) => {
  let data;
  if (url.includes('/events')) {
    const cursor = /cursor=(\d+)/.exec(url); const from = cursor ? Number(cursor[1]) : 0; const size = 7;
    data = {data: newestFirst.slice(from, from + size), next_cursor: from + size < newestFirst.length ? String(from + size) : null};
  } else data = fixture.session;
  return {status: 200, ok: true, json: async () => data};
};
const reader = (%s);
reader(process.argv[3], Number(process.argv[4]), Number(process.argv[5])).then(r => process.stdout.write(JSON.stringify(r)));
'''


@unittest.skipUnless(shutil.which("node"), "Node is not installed; the reader's own code is not exercised")
class ReaderTests(Workspace):
    def read_with_node(self, since=0, max_bytes=12000):
        fixture = Path(self.temp.name) / "log.json"
        fixture.write_text(json.dumps(raw_log()))
        script = Path(self.temp.name) / "harness.js"
        script.write_text(HARNESS % browser.READER_JS)
        result = subprocess.run(["node", str(script), str(fixture), SESSION, str(since), str(max_bytes)],
                                capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        return json.loads(result.stdout)

    def test_reader_hash_matches_python_and_only_public_content_leaves_the_page(self):
        payload = self.read_with_node()
        text = json.dumps(payload)
        self.assertTrue(text.isascii())
        for private in ("NOT-KEPT", "SIGNATURE", "cshk_", "cost_usd", "/Users/someone/Documents/synthetic-repo\""):
            self.assertNotIn(private, text)
        body, _ = browser.checked_body(json.loads(json.dumps(payload, indent=2, sort_keys=True)))
        self.assertEqual((body["since_seq"], body["through_seq"], body["more"]), (0, 20, False))
        self.assertEqual([r["seq"] for r in body["records"]], [3, 4, 8, 9, 11, 13, 17, 18, 19])
        self.assertEqual(body["records"][0]["blocks"], [{"type": "text", "text": "Please check " + TRICKY}])
        self.assertEqual(body["records"][2]["blocks"],
                         [{"type": "text", "text": "Reading the files next.", "narration": True}])
        self.assertEqual(body["records"][5]["tool_use_result"],
                         {"answers": {"Which “one”?": "A"},
                          "annotations": {"Which “one”?": {"notes": "because"}},
                          "questions": [{"header": "Scöpe", "question": "Which “one”?"}]})
        self.assertEqual(body["records"][6]["tool_use_result"],
                         {"written": ["/Users/someone/Documents/synthetic-repo/notes/a.md"]})
        self.assertEqual(body["session"]["user_selected_folders"], ["synthetic-repo"])
        log = body["log"]
        self.assertEqual((log["events_read"], log["pages"], log["subagent_messages_omitted"], log["progress_updates"]),
                         (20, 3, 1, 1))
        self.assertEqual(log["sdk_session_ids"], sorted([SDK, SESSION]))
        self.assertEqual(log["reader_sha256"], browser.reader_sha256())

    def test_reader_output_registers_like_the_event_log_shows_it(self):
        report = self.ingest(self.read_with_node(), "--registry", REGISTRY, "--new-registry",
                             "--sdk-session-id", SDK, "--project-uuid", PROJECT_UUID)
        self.assertEqual(report["message_count"], 6)
        conversation = self.registered()[3]
        messages = self.chain(conversation)
        self.assertEqual([(m["author"]["role"], m["metadata"]["phase"]) for m in messages],
                         [("user", None), ("assistant", "commentary"), ("assistant", "commentary"),
                          ("assistant", "commentary"), ("user", None), ("assistant", "final_answer")])
        self.assertEqual(messages[4]["content"]["parts"][0], "A\n(note: because)")
        meta = conversation["archive_metadata"]
        self.assertEqual(list(meta["turns"].values())[0]["status"], "completed")
        self.assertEqual(meta["delivered_files_not_embedded"],
                         ["/Users/someone/Documents/synthetic-repo/notes/a.md"])

    def test_reader_splits_a_long_read_and_resumes_after_a_sequence_number(self):
        first = self.read_with_node(max_bytes=600)
        body, _ = browser.checked_body(first)
        self.assertTrue(body["more"])
        self.assertEqual(body["through_seq"], body["records"][-1]["seq"])
        seen = [r["seq"] for r in body["records"]]
        while body["more"]:
            body, _ = browser.checked_body(self.read_with_node(since=body["through_seq"], max_bytes=600))
            seen += [r["seq"] for r in body["records"]]
        self.assertEqual(seen, [3, 4, 8, 9, 11, 13, 17, 18, 19])
        self.assertEqual(body["through_seq"], 20)
        tail, _ = browser.checked_body(self.read_with_node(since=20))
        self.assertEqual((tail["records"], tail["through_seq"], tail["more"]), ([], 20, False))


if __name__ == "__main__":
    unittest.main()
