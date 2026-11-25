# Formalization setup workflow

25 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The serving model identifier and reasoning
effort for this setup are unavailable.

Use this workflow to start an investigation for a coherent family of
Lean proofs. It adapts the scope, task ownership, and handoff practices in
the [investigation setup workflow](../INVESTIGATION_SETUP_WORKFLOW.md)
and the [research model workflow](../GPT_RESEARCH_MODEL_WORKFLOW.md).

## Set up an investigation

1. Identify the manuscript version, exact statement, hypotheses, and
   conventions. Check the [shared blueprint](blueprint/README.md), existing
   Lean modules, and pinned imports for prerequisites. Link source records
   using the [reference workflow](../REFERENCE_WORKFLOW.md).
2. Create the next numbered directory under
   [investigations](investigations/README.md). Give each shared
   prerequisite one task owner and link to it from dependent investigations.
3. Create the following files. Keep Lean modules in the
   [shared Lake package](README.md), and record their intended paths in
   the plan.

| File | Purpose |
| --- | --- |
| `README.md` | Scope, ownership, source investigation, and entry points |
| `research-overview/OVERVIEW.md` | Exact targets, conventions, shared prerequisites, and source versions |
| `research-plan/PLAN.md` | B/E sequence, intended declarations, output paths, and completion checks |
| `research-progress/REGISTER.md` | Sole live register for the investigation's formalization tasks |
| `continuation-notes/CONTINUATION.md` | Dated handoff and a bounded prompt for the next ready task |

Link the manuscript label, blueprint label, and intended Lean declaration
in each proof task. Record the initial status in the register. A setup
milestone leaves execution awaiting activation. Add notes, reviews, and
handoff directories as the investigation produces material for them.

## Define the task before choosing the prover

- **B tasks** settle a substantive choice, such as an encoding, curvature
  convention, dependency, or proof decomposition. Their deliverable is a
  decision with enough detail to specify the subsequent E task.
- **E tasks** have a fixed statement, definitions, inputs, output module,
  and acceptance checks. They can cover an API check, a proof, or the
  integration of a candidate. If execution exposes a choice that changes
  the statement, assumptions, or representation, return it to a B task.

Give each task a stable ID and a finite scope. Record exact toolchain and
dependency pins, the target theorem type, the assigned files, and the
failure condition. Use the existing author-selected settings when they
are available. Record the actual platform, model, and effort reported by
the run, or mark unavailable settings as unavailable.

## Platform guidance

| Platform | B decisions and integration | Bounded E tasks |
| --- | --- | --- |
| ChatGPT or Codex | Astra at ultra by default for planning, representation choices, and review | Sol 6.2 at ultra by default for a fixed proof or implementation packet |
| Claude | Fable for the corresponding planning, conceptual, and integration work | Opus for a fixed proof or implementation packet |
| Harmonic Aristotle | Prepare the mathematical statement and the packet in a planning session | Use Aristotle as a single prover for an exact Lean goal when a Lean mathematics mode is available to the author |

For Claude, use the author's available model and effort settings. Fable and
Opus are the project routing defaults. [Anthropic model catalog](https://platform.claude.com/docs/en/models/overview)

As checked on 25 November 2026, Harmonic's public service lists C, Rust,
and Verilog support and says Lean support will return. The Aristotle route
for mathematics is therefore conditional on access to a Lean-capable
mode. [Harmonic FAQ](https://aristotle.harmonic.fun/docs/faq)

For an Aristotle run, freeze one theorem or small set of goals. Supply the
Lean statement, exact imports, dependent definitions and lemmas, and the
project's toolchain and library pins. Record the environment the service
used and preserve the returned proof as a candidate for local checking.
If an external run needs repository files, send the task material the
author authorizes.

For a handoff between platforms, pass the same frozen request and the last
checked result. Record returned code, dependency changes, and failure
details under `research-progress/handoffs/` once a packet has been issued.
The designated investigation lead reviews and integrates the return,
then updates the register and the shared blueprint.

## Accept proofs in the pinned Lean project

1. Compare the elaborated declaration with the manuscript and blueprint.
   Check quantifiers, hypotheses, normalization, tensor slots, and whether
   the result is local, conditional, or global.
2. Run `lake build` from `formalization/` with the pinned toolchain.
   Check the named declaration and run `#print axioms` on it. A completed
   proof has no `sorryAx` or unreviewed project axioms. Record any
   hypotheses that the theorem legitimately takes as inputs, along with
   the actual axioms reported by Lean.
3. Record the declaration, module, commands, and verification evidence in
   the register or a linked return. Link the checked statement using
   `\lean`. Record checked statement and proof status separately using
   `\leanok`. Rebuild the [blueprint](blueprint/README.md) when its source
   changes.

Apply these checks to every candidate, including code returned by a
service that ran its own Lean checker. Comparison against the intended
theorem and verification in the pinned project are part of integration.
