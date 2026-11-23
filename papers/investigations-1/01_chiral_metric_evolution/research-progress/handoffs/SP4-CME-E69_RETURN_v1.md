# SP4-CME-E69 return v1 — critical-budget manuscript audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper `gpt-6.2-sol`/`ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Request v1][req] · [Detailed audit][review].

## Disposition

The frozen source carries the assessed fixed-round smooth-compatible
result \(J(\infty)\leq C\delta\) with the stronger full pair norm.
The audit independently compares the integration to the checked
inputs. This assistant authored E53, E54, E59, E62, E64 and E68 and
the earlier supporting E36, E42 and E49 notes. It did not author
the manuscript integration, E57, E60, E63 or E67.

The core linear matrix estimate, product and composition bounds,
two-class energy identification, smoothing estimate, recovery and
clock argument all match the assessed proofs. The frozen compression
would benefit from these explicit steps, using frozen line numbers.

- **3312–3314 and 3402–3405.** State
  \(U_{\rm in}\in\mathcal B^s\) and
  \(f\in L^1(0,\tau_c;\mathcal B^s)\).
  Fix precompact master charts and frames before restricting and
  translating smaller balls. The frozen semigroup and top absorption
  constants then depend on bounds in the master charts, while new
  overlaps and cutoffs affect only the lower-order terms.
  Rename the freezing tolerance to avoid reusing the fixed adjoint
  notation \(\delta_0\).
- **3534–3561.** Retain the same \(A_0\) reference and explicitly
  invoke the earlier individual jet cutoff in the rough-local proof.
  The lifted \(X_\ell\) gradient term is
  \(O(\sqrt\ell\sup|D_0Z|)\); choose the embedded initial value norm
  below the E42 threshold and strictly inside its radius before
  invoking either short-time uniqueness. Compare on
  \([\tau_*,\tau_c]\) from a positive time \(\tau_*\) in the
  agreement interval. The averaged leading coefficient costs at
  most a fixed fraction of the integrated Gårding margin.
- **3663–3717.** State the two covariant derivative estimates for
  \(S^{-1}\) and \(\nabla^AQ\) in the audit. Use the displayed pair
  \(C^2\) bound and the stable exponential estimate to shrink the
  threshold so the full stable pair stays in the E59 tube for every
  tail time. The alternation in \(d_0b\) uses only fixed ordered
  derivatives, and the bracket uses the Leibniz products.
- **63 and 3734–3738.** Make the abstract's smooth fixed-round
  scope explicit in the critical sentence. In the clock conversion,
  the underlying strain tensors are unchanged under the constant
  metric and internal normalization changes. The two native norm
  factors cancel the clock factor exactly as written.

The reference fixes from E68 are present in the manuscript and
current canonical records. The frozen source cites 31 distinct
canonical keys, with the 31 manual entries in first-use order.
No primary source was newly opened. No manuscript or shared record
was edited and no lead output was rebuilt.

## Versions

The complete audited TeX subsection and surrounding scope were
verified before release for later typesetting at SHA-256
`6f71341fa47e4d04985f331a11730f7d4a2bc99ce8f76b0510814d279827b635`.
The observed later live source was used only for the separately
identified cross-reference and bibliography checks. All consumed
note, review and reference-record digests are in the [audit][review].

| Artifact | SHA-256 |
| --- | --- |
| `research-progress/handoffs/SP4-CME-E69_REQUEST_v1.md` | `f4794d949746b68373e0ad64adcf62e37a1bd1b5d10e1872f3bbbac0af26f6b0` |
| `reviews/E69_CRITICAL_MANUSCRIPT_AUDIT_20261122.md` | `a3921c85ea86693dfd8d7df81cdcf7ae9cce3244a4637bc3b3c6719cb321fb71` |

[req]: SP4-CME-E69_REQUEST_v1.md
[review]: ../../reviews/E69_CRITICAL_MANUSCRIPT_AUDIT_20261122.md
