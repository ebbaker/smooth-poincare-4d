# Coordinate pairing for the three-axis estimate

SP4-FORM-SEC-B03, 25 November 2026. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The author selected Astra at ultra for
the lead. Independent runtime metadata for the lead model and effort
are unavailable. Inputs are the [setup revisions](../../research-overview/OVERVIEW.md#inputs-at-setup)
of manuscript `secjet:orthogonal` and blueprint `def:null-evaluations`
and `lem:three-axis-weyl`.

Use `Matrix (Fin 3) (Fin 3) ℝ`, Mathlib's `IsSymm` and its matrix trace.
An ordered orthonormal frame supplies the three coordinate axes. Addition
in `Fin 3` gives the cyclic indices \(j=i+1\) and \(k=i+2\).
Complexify the matrix entries, apply the resulting matrix to the normalized
vector, and pair the result with the same vector using `dotProduct`.
This pairs corresponding components by ordinary complex multiplication.
Use the complex norm for \(q_i\), so the final statement refers directly
to the modulus of this pairing.

Separate the complex component calculation from the real sum. Symmetry
combines the two mixed terms in the pairing. Trace zero enters only when
summing the squared diagonal differences. Count strict upper-triangular
entries once and all ordered entries in the Hilbert–Schmidt sum. This
decision fixes the coordinate version of E01 for any matrix in the
chosen frame. [Plan](../../research-plan/PLAN.md#sp4-form-sec-e01)
