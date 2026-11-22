# Chat capture while a second Work session is active

21 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Actual model and effort were not independently exposed.
Scope: bounded E operational diagnosis requested by the author. No scientific
task was activated, and no other session was messaged, interrupted, restarted,
or reconfigured. The parallel session's manuscript, references and progress
register were left to its writer.

## Finding

The installed desktop app contains an explicit rejection of ChatGPT-originated
app-tool requests. This is stronger evidence for a Work-mode integration
restriction than the previously observed generic history-reader error.
The repository recorder cannot repair that app-side restriction.

In app version `26.1117.41037`, build `29803`, the renderer's `canCallTool`
function includes the following condition before any thread lookup:

```javascript
if("chatgpt"===t.callerSource)return!1;
```

The enclosing desktop dispatcher asks ready app windows whether they can
handle a request. If none accepts or dispatches it, the dispatcher returns
null. The native pipe then emits the observed error:
`The app tool call ended before producing a result`.

The condition and dispatch path were inspected read-only in the installed
application. The actual request's `callerSource` field was not exposed by the
available tool result or safe diagnostic log. Thus the explicit ChatGPT gate
is a confirmed code finding, and its responsibility for these particular
Work requests is a strong inference, not a captured request-payload fact.
No caller identity was changed or impersonated to bypass the gate.

## Live observations

Both the recent-thread listing and the ChatGPT-history listing again failed
with MCP error `-32000`, `Codex app tool request failed`. A metadata-only read
of the newly observed thread also failed. This is not limited to reading the
calling conversation.

The desktop routing log identifies a newly opened thread,
`6b0271e4-e374-83ea-b200-b8f4d6af50d0`, in a successful internal `thread/read`
response event at 23:39:04 EST. The current conversation is
`6b0266d2-f9b8-83ea-9958-13f41a4ea0fb`. The new ID is an observed identifier,
not an invented one. Its native title and exact association with the
author-reported parallel session could not be independently confirmed through
the failing public app reader. The active repository task is the Introduction
rewrite SP4-CME-DOC-E02; timing is consistent but is not identity proof.

Exact-ID read-only checks for the new thread found:

- zero `threads` metadata rows in `state_5.sqlite`;
- zero turn rows and zero item rows in `thread_history_1.sqlite`;
- zero matching active or archived JSONL session files;
- no registration in this repository.

The recorder reports `local_thread_history_mode: absent`,
`source.status: unavailable`, and `capture_performed: false` for both observed
IDs. [Diagnostic evidence](CHAT_CAPTURE_PARALLEL_SESSION_20261121.json) records
the results without private message payloads. The internal routing event does
not expose the conversation text or establish a usable export source; it also
does not establish loss of the conversation on the service.

## Why an unfinished session is not the full explanation

A Stop hook can only capture a final answer after the real turn completes.
The existing reader can nevertheless process completed user and commentary
items during an active turn when a supported source contains them. It gates
unfinished items and completion-dependent refreshes separately.

Here source discovery fails before those gates: there is no exact local
thread metadata or message store for either observed ID. In addition, this
conversation's earlier completed turns are still absent from the local
stores. Ending the other session is therefore not an established remedy,
and it was left running.

There is also no repository `.codex/hooks.json` or global `~/.codex/hooks.json`
at the inspected locations. The earlier repair fixed archive registration
lookup; it did not install a hook or establish Work-mode source access.
Installing a hook alone would not supply the missing source.

## Disposition

No further recorder code change is justified by these observations. The
[previous root-registration repair](CHAT_CAPTURE_DIAGNOSIS_20261121.md) is
present and its 117-test validation remains separate from live capture.
This turn changed only diagnostic documentation and the explicitly partial
public record. It did not alter app binaries, app settings, capture filters,
manuscripts, the parallel task register, or existing notification integrations.

A complete repair requires a supported Work-mode history reader/export path
that supplies authentic public messages, original identity and timestamps,
and complete pagination. The app's capability gate and generic null-result
error are concrete points for an app-maintainer report. No external report
was submitted. An authentic export can support later recovery, but recovery
has not been performed and future automatic capture is not claimed.

## Installed-code provenance

- App resource: `/Applications/ChatGPT.app/Contents/Resources/app.asar`.
- Capability module: `webview/assets/async/911644.eaf037cac0.js`.
- Module SHA-256:
  `0d3393b090dc0d1b6134be4ec10bafa0c58c5e3986b2f91ffca559579cd56a5d`.
- Dispatcher/native-pipe module:
  `.vite/build/early-bootstrap-916-90e0adb52d70fbc5.js`.

Only the short condition above and diagnostic metadata are retained here;
the app bundle and raw history stores were not copied into the repository.
