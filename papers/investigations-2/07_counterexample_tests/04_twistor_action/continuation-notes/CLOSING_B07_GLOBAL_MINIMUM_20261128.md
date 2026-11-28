# Global minimization at \(b=1/200\)

28 November 2026, America/New_York, for Edward B. Baker III with Codex assistance. Author-selected lead GPT-6.2 Astra/ultra, bounded helpers configured GPT-6.2 Sol/ultra, independent backend telemetry unavailable. Checkout `280376dd7a18`. This closes the question posed by the [first horizon](CLOSING_20261128.md) on precisely its product, spin structure, action and traces. [Sole live register](../research-progress/REGISTER.md)

**Answer.** On the flat periodic \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\), for a parallel unit positive spinor \(\sigma\), the exact minimum of \(J_g^4\) with end traces \(e^{\pm1/200}\sigma\) is
\[
 \frac{9}{8\cdot 200^4}.
\]
The unique minimizer is \(\psi_*(t,x)=e^{t/200}\sigma\). The comparison ranges over all smooth spinors with these traces in the stated admissible class, including fields with finitely many transverse interior zeros having compatible Clifford first jets. It imposes no closeness, radiality, or field equation on competitors.

**Proof.** Set \(b=1/200,\ f=e^{-bt}\psi=\sigma+v,\ B=P+b\Pi(dt\otimes\cdot)\) and \(k^2=3b^2/4\). The two fixed traces imply \(v=0\) at both ends. Hölder gives \(\|Bf\|_2^2\le J_g(\psi)^2\|f\|_4^2\), with equality at \(f=\sigma\). The constant and linear terms of \(\|Bf\|_2^2\) at \(\sigma\) agree with those of \(k^2\sqrt2\,\|f\|_4^2\), by the zero traces and the parallel base spinor. The squared \(L^4\) norm has a global Taylor remainder bounded above by \(3\|v\|_4^2\). The homogeneous Dirichlet estimates \(\|v\|_4\le24\|\nabla v\|_2\) and \(\|Bv\|_2\ge(\sqrt3/2)(1-2b)\|\nabla v\|_2\) then give
\[
 (J_g(\psi)^2-k^2\sqrt2)\,\|f\|_4^2
 \ \ge\ \frac{29403-1296\sqrt2}{40000}\|\nabla v\|_2^2
 \ \ge\ \frac23\|\nabla v\|_2^2 .
\]
Evaluation on the radial field gives the minimum. Equality forces \(v=0\). The finite zero set has measure zero and the compatible jet makes the quotient locally bounded, so no inverse of the competitor was used in the derivative estimates. [Variational comparison](../notes/E11_GLOBAL_COMPARISON.md) · [Certified Sobolev constant](../notes/E12_CYLINDER_CONSTANT.md) · [Independent replay](../reviews/E13_GLOBAL_MINIMUM_REPLAY.md)

**Convergence and previous results.** Every smooth admissible minimizing sequence at these fixed end traces converges strongly in \(H^1\) to the radial field. The proof absorbs \(24\sqrt\delta\|\nabla v\|_2\), where \(\delta=J_g(\psi)^2-k^2\sqrt2\to0\). An explicit positive oscillatory sequence attains this limiting cost with unbounded \(H^5\) norms. The older \(H^5\) theorem gives local uniqueness of **critical fields** for independently varying nearby endpoint traces. The earlier \(O(d^2)\) estimate concerns competitors at or below the radial trial for **varying** log difference \(d\to0\) and normalized mean log amplitude. [Sequence and example](../notes/B07_MINIMIZING_SEQUENCES.md) · [Local Dirichlet theorem](../notes/E08_LOCAL_DIRICHLET.md) · [Earlier asymptotic](../notes/SMALL_TRACE_ASYMPTOTIC.md)

**Handoff.** The fixed-trace question is decided by global comparison. [Exact statements for Formalization](../research-progress/handoffs/TO_FORMALIZATION_TWA_GLOBAL_MINIMUM_20261128.md). The phase-space graph and geometric cobordism of the first horizon require no changes. This calculation does not establish independence of the metric or a smooth-type invariant.

A possible successor keeps the same product and explicitly changes the trace data. E12's positive-margin condition is sufficient and need not be sharp. A next session could ask how far in \(b\) uniqueness persists, and whether loss of that sufficient bound reflects any actual instability. This successor has no bearing on attainment at \(b=1/200\).

> Resume SP4-TWA from the global-minimum note, the sole register and the E13 replay. Keep the unit periodic flat product and exactly \(J_g^4\). As a new trace-data question, vary the end traces to \(e^{\pm b}\sigma\). Start from E12's sufficient coercivity range. Compare possible loss of global minimality with the first genuine negative mode or an explicit cheaper competitor, keeping failure of the sufficient bound separate from either. Freeze the selected bounded derivations and obtain independent replay.
