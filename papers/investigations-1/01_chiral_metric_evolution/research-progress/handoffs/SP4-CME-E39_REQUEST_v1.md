# SP4-CME-E39 request v1 — continuous heat data and integrable Hessian model

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized configured helper gpt-6.2-sol / ultra; lead actual settings unavailable. Own notes/39_GAUGE_DERIVATIVE_HEAT_MODEL_20261122.md and research-progress/handoffs/SP4-CME-E39_RETURN_v1.md only. No shared edits.

Finite flat model on standard real flat four-torus of side 1, heat H_t=exp(t Delta), smooth positive-time scalar solutions. Prove a Dini-modulus sufficient bound for integral_0^T ||D² H_t f||infinity dt for continuous f and T<=1: use kernel cancellation to bound by C integral_0^{sqrt(T)} omega_f(r) dr/r plus harmless finite large-scale terms as needed. State constants and modulus definition; no false claim for an arbitrary function not having Dini modulus. Separately, prove integral_0^T ||grad H_t f||infinity dt <= C sqrt(T)||f||infinity.

Test a concrete continuous non-Dini f with infinite Hessian integral. Suggested construction: choose nonnegative nonzero smooth psi supported in the unit ball, centers x_j=2^{-j} e1 in a small torus coordinate chart, radii r_j=2^{-j²-L} for one sufficiently large fixed integer L, heights a_j=1/j, and f=sum_j a_j psi((x−x_j)/r_j). Adjust only fixed numerical separations/start index if needed. Supports disjoint and tail supremum tends to zero, so f continuous and f(0)=0. For t in [r_j²,2r_j²], the own D11 heat contribution at x_j is negative of size c a_j/r_j² by the Gaussian formula (psi support ensures sign). Bound the sum of other-bump and periodic-image contributions uniformly so it cannot cancel more than half for all sufficiently large j. The windows are disjoint, so summing their integrals diverges. If this proposed family is unsuitable, give the exact failure and a comparably explicit bounded-frequency/disjoint-bump repair only; no new research strategy.

Conclude only that continuous data and the standard heat smoothing bounds do not imply the time-integrable uniform Hessian condition used by one direct C1 ordinary-flow estimate. For X_t=grad H_t f, velocity is integrable while integral ||DX_t||infinity is infinite. Do not claim the associated flow lacks a limit or that the actual geometric gauge cannot be recovered. No continuous curvature compatibility is asserted for this scalar model. No external theorem beyond elementary Gaussian heat identities is needed; if importing one, inspect its primary source. Verify input hashes and provenance.

## Frozen inputs

- `brainstorm/notes/B32_GAUGE_DERIVATIVE_MODEL_20261122.md` SHA-256 `c75249b55726a10a31b7bf8ac744744e84a5f16d8dfaca7217154afa2db697d7`
- `notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md` SHA-256 `b5bc0ba6f3981370f29027481a8293083e3fc93e9fa013e4494ab86767f74175`
- `notes/24_TEMPORAL_BOOTSTRAP_20261122.md` SHA-256 `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44`
