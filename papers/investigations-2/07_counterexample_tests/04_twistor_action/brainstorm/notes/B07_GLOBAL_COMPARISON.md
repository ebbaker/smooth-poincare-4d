# A sharp comparison at the prescribed unequal traces

28 November 2026, America/New_York, for Edward B. Baker III with Codex assistance. Author-selected lead GPT-6.2 Astra/ultra, backend telemetry unavailable. Baseline `280376dd7a18` and the [previous closing](../../continuation-notes/CLOSING_20261128.md), [analytic replay](../../reviews/E07_ANALYTIC_REPLAY.md) and [register](../../research-progress/REGISTER.md).

Use the original smooth finite-cost class on \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\), with trivial periodic spin lift, volume \(D=2\), unit parallel positive spinor \(\sigma\), and \(b=1/200\). Compare every admissible \(\psi\) of traces \(e^{\pm b}\sigma\) to \(\psi_*=e^{bt}\sigma\). The field may have finitely many isolated transverse Clifford-compatible zeros. The equality test uses smooth fields with those traces, without any requirement of closeness to \(\psi_*\).

Conjugate by the *known radial field's amplitude*: write \(f=e^{-bt}\psi=\sigma+v\) with \(v\) zero on both faces. Put \(A=\Pi(dt\otimes\cdot)\), \(B=P+bA\), \(k^2=3b^2/4\). Hölder gives \(J_g(\psi)^2\|f\|_4^2\ge\|Bf\|_2^2\) and is exact at \(\sigma\). Test the global estimate
\[
 \|Bf\|_2^2-k^2\sqrt D\,\|f\|_4^2
 \ \ge c\,\|\nabla v\|_2^2,\qquad c>0.
\]
The quadratic numerator and the squared \(L^4\) norm have identical affine terms at \(\sigma\): the \(Pv\) term integrates to zero and \(A^*A=3I/4\). Bound the remaining denominator term *globally* by the second derivative inequality for the squared \(L^4\) norm. It suffices to bound this remainder by \(3\|v\|_4^2\), then absorb it in the homogeneous Dirichlet coercivity of \(B\) at the specified \(b\). The endpoint conditions let one get an elementary numerical Sobolev bound by cutoff of a tangential periodic extension and zero extension in time. Check the constants rather than invoking asymptotic smallness. If successful this decides attainment and uniqueness and gives strong \(H^1\) convergence of minimizing sequences. The previous \(H^5\) implicit-function theorem and \(d\to0\) bound have separate quantifiers.
