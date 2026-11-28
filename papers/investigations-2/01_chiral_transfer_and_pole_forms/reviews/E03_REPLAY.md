# R04 — Replay of the pointwise algebra and diagonal family

27 November 2026 (UTC). Independent reading by OpenAI Codex for Edward
B. Baker III. The [frozen request](../research-progress/handoffs/REQUEST_REPLAYS_R1_20261127.md)
specifies gpt-6.2-sol, ultra. The runtime supplies no separate model or effort
receipt. Repository baseline `6a422ce7814fe1ad278d6904970e3b19b05a9890`.
Replayed [E03](../notes/E03_ALGEBRA.md), SHA-256 prefix
`c08a9fdd7b6e39e3`, and checked the
[handoff to 05](../research-progress/handoffs/TO_05_ALGEBRA_20261127.md),
prefix `64b87479860a11d5`, against it. Also read the
[proposal §3.5](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md#35-two-calibrations)
and the [script](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_06_pole_forms.py)
and its [recorded output](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/output.txt)
with the hashes in E03.

**Disposition.** The pointwise and explicit family statements in the E03
handoff are replayed project theorems. The claim that the three modes
exhaust the full pole space has the separately recorded A1 dependency.
The energy comparisons are floating-point diagnostics in the supplied
output. This replay recomputed the algebra below without running the
curvature script.

## Star, Gram matrix and parallel triple

For a \(k\)-form the scaling of its inner product and volume multiply
to \(\Omega^{4-2k}\). Nondegeneracy of the wedge pairing gives the
star scaling. The eigenvalues of the differential of the inversion
in the radial and three tangential directions are
\(-\rho^{-2},\rho^{-2},\rho^{-2},\rho^{-2}\), respectively. Hence its
two-form action is \(\rho^{-4}R_y^*\). Orthogonality gives the squared
norm factor \(\rho^{-8}\), and reversal of the volume factor gives
\(*R_y^*=-R_y^**\) for the two fixed equally oriented coordinate spaces.
The given manifold star consequently selects coordinate ASD leading
coefficients in the orientation-reversing \(x\)-chart. Closedness
follows by pullback from the constant form.

In an orthonormal self-dual frame the coefficient matrix \(C\) of
the three forms gives \(Q=C^{\mathsf T}C\). Applying arithmetic–geometric
mean to its three nonnegative eigenvalues gives the inequality, with
equality only when all three eigenvalues coincide. If one eigenvalue
is zero, equality requires zero trace and thus all three vanish.
Strictly positive equality gives \(\langle Cu,Cv\rangle
=\lambda\langle u,v\rangle\). Rescaling the metric by
\(\sqrt{\lambda}\) multiplies the two-form inner product by
\(\lambda^{-1}\).

For \(S_i=(e^{0i}+e^{jk})/\sqrt 2\), on cyclic indices,
\(J_i=\sqrt2*(\,\cdot\,\wedge S_i)\) sends
\((e^0,e^i,e^j,e^k)\) to \((e^i,-e^0,e^k,-e^j)\). Its square is
\(-1\) and \(J_iJ_j=J_k\) for cyclic indices, as follows by applying
the displayed action on each basis vector. These identities rotate
with a positive orthonormal triple by invariance of the alternating
tensor. Reorient an arbitrary local orthonormal triple by a constant
sign on one form. For the skew connection matrix written in E03's
variables, the last two equations from closedness give
\(b_2=-J_3b_1\), \(b_3=J_2b_1\) and the first then gives
\(-(1+1)b_1=0\). This gives the zero connection matrix, with the same
conclusion after undoing the sign.

## Diagonal family and its two ends

The Maurer–Cartan equation for \(q^{-1}dq\), with each cyclic pair of
imaginary units satisfying \([{\bf i},{\bf j}]=2{\bf k}\), gives
\(d\sigma_i=2\sigma_j\wedge\sigma_k\) for its negated components.
In the coframe \((dr,a_1\sigma_1,a_2\sigma_2,a_3\sigma_3)\),
\(d(f_i\sigma_i)\) has only the mutually complementary components
\((0,i)\) and \((j,k)\). Equality of their coefficients gives
\(f_i'=2a_i f_i/(a_j a_k)\); the three pairs are disjoint. The squared
norm is twice the square of \(2f_i/(a_j a_k)\).

Using real quaternion coordinates \(x^\mu\), the Cartesian primitive is
\[
\alpha_i=-x^0dx^i+x^i dx^0+x^jdx^k-x^kdx^j,\qquad
d\alpha_i=-2(dx^0\wedge dx^i-dx^j\wedge dx^k).
\]
The \(d\alpha_i\) are linearly independent and are ASD for the ordinary
quaternion-coordinate orientation. The polar orientation of E03 is
opposite to this orientation, as one sees on the positive real
quaternion ray where \(\sigma_i=-dx^i/r\). Thus the constants are SD
geometrically as required. The perturbation of the Euclidean metric is
\((A^2-1)\alpha_1^2/t\), \(t=r^2\), and
\((A^2-1)/t=2\varepsilon/(1+t)^2+\varepsilon^2t/(1+t)^4\).
Its coefficient is smooth, and \(\alpha_1\) is linear and vanishes at
\(0\). The angular metric stays positive for \(\varepsilon>-4\) by
\((1+t)^2-4t=(1-t)^2\); at \(\varepsilon=-4,t=1\) one angular
coefficient vanishes. Inversion leaves \(t/(1+t)^2\) invariant and
changes the full polar metric by the overall factor \(\rho^{-4}\).
Thus its compactification times \(4/(1+r^2)^2\) is smooth positive
in both Cartesian charts.

The logarithmic residual derivative of \(f_1=r^2F_1(t)\) is
\(d_t\log F_1=\varepsilon/(1+t)^2\). It integrates from infinity
to \(-\varepsilon/(1+t)\) with the required normalization. For the
other two modes the residual derivative in \(t\) is
\((A^{-1}-1)/t=-\varepsilon/P_\varepsilon(t)\). Its integral from
infinity is \(+\varepsilon\int_t^\infty
P_\varepsilon(s)^{-1}\,ds\). This sign makes both modes solve their
listed equations. The denominator is positive for \(t\geq0\) and
the integral converges. All \(F_i\) are smooth and positive at zero,
so the extended forms there are the nonzero multiples
\(F_i(0)d\alpha_i\) of the three basis elements. For large \(r\),
\(F_i-1=O(r^{-2})\) and \(dF_i=O(r^{-3})\) follow directly from the
logarithms, using \(P_\varepsilon(s)\) of order \(s^2\).
Consequently \(d(F_i\alpha_i)=d\alpha_i+O(r^{-2})\); inversion gives
the quartic pole and its \(O(\rho^{-2})\) remainder. The positive
diagonal Gram entries away from the origin, together with the
Cartesian value at the origin, give full evaluation rank at every
finite point.
