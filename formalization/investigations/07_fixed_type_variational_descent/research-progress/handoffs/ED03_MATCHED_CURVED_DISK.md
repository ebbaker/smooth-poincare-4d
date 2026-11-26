# Edition 03 · A curved reference on the original marked disk

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. DESC-E08a is a bounded proof packet on the E41 staged intake at Git base a7bb158d6af806d2573a7702386622ed4c0bb1f1. Independent serving model and effort telemetry are unavailable. [Lean leaf](../../../../SmoothPoincare/Variational/MatchedCurvedDisk.lean) · [E41 assessment](../../../reviews/ROUNDED_EDGES_AND_REFERENCE_COST_20261125.md) · [Fixed-type companion](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex)

## Native construction and exactly matched costs

Fix one compact oriented smooth source of signature zero, a smooth Riemannian metric \(g\), the actual selected four-ball marking \(F\), and a buffered protected width \(w=(n+1)^{-1}\) with \(n>0\). Write \(B=F(\overline B_1)\), \(A=F(\overline B_{1-w})\), \(C=F(\{1-w<|x|<1+w\})\), and \(V_B=M\setminus\operatorname{int}B\). Supply a smooth reference metric \(r\) in the native Euclidean model. Require that it agree with \(F^*g\) on an open neighborhood of the closed full trim, and that \(\operatorname{Rm}(r)\) be nonzero at a chosen point of the closed unit disk. This is a statement about the same marking and the same selected width.

The compact metric extension uses \(g\) as its fallback and provides a smooth ambient \(b\) with \(F^*b=r\) on an open neighborhood of the full buffer. Use the old native cutoff \(\chi\) extended to the physical source and the same affine family \(h_t=(1-t\chi)g+t\chi b\), \(0\le t\le1\). All slices are smooth positive-definite metrics. The step is one on an open neighborhood of \(A\). On the full trim \(g=b\), and off \(B\cup C\) the cutoff vanishes. Since \(A\cup C=B\cup C\) and \(A\cap C=\varnothing\), every slice agrees with \(g\) on the open complement of the closed \(A\), which contains the whole trim and \(V_B\). At time one the pullback is \(r\) on an open neighborhood of the original closed \(B\). Curvature naturality at the witness point transfers the nonzero ordered covariant tensor to the physical endpoint in the actual marking.

The original cap uses the unit ball with the metric \(r\) and its original boundary map \(F\). The agreement on an open seam neighborhood reconstructs the time-one metric smoothly on the same oriented source. The cap generally retains Weyl energy. A supplied ambient reference \(b_0\) already agreeing with \(g\) off \(A\) is a second concrete construction route. With that reference the same selected-width splice equals the ordinary affine interpolation between \(g\) and \(b_0\) everywhere and reaches \(b_0\) itself. This supplies an exact endpoint identity when positivity of \(b_0\) is independently known.

Metric-germ equality fixes the two chiral densities, the spectral-square density and the full covariant curvature density on \(C\) and \(V_B\), with their physical volume forms. The joined and capped trim increments are exactly zero in each sign, while their common raw charges can be strictly positive. The raw four-measure division on \(V_B\) from the supplying source remains the same test against the original measures of the exterior of the protected core \(Q\).

Put \(\ell_s=\lambda_g^s(V_B)\), \(d_s=\lambda_g^s(B)\), \(r_s(t)=\lambda_{h_t}^s(B)\), and \(e=E_+(g)\), with the established Hilbert–Schmidt normalization. For either sign \(s\), including the cap, the exact identities are
\[
 E_+(h_t)=\ell_s+r_s(t),\qquad e-E_+(h_t)=d_s-r_s(t).
\]
The seam is null. The kernel comparison uses matching oriented frames on the retained region to pass from the common metric germs to both physical charges. The independent-frame transport is a separate input in the E41 comparison.

The joined ceiling must bound \(\ell_s+r_s(t)\) for the entire actual path. If one uses the strict scalar-flat wall, a continuous Yamabe sign detector, the positive source sign and a bound uniformly below \(2T=8\pi^2\) give a positive endpoint by the existing wall argument. Otherwise test endpoint positivity independently. In either case the actual positive endpoint has
\[
 I^+(M)-\ell_s\le r_s(1),\qquad
 d_s-r_s(1)\le e-I^+(M).
\]
Strict gain is equivalent to \(r_s(1)<d_s\). The lower and upper disk charges allowed by these tests differ by \(e-I^+(M)\), since \(\ell_s+d_s=e\). For a finite four-measure division of depth \(k\) and tolerance \(\varepsilon\), exact matching on the actual trim gives the stronger localized test
\[
 I^+(M)-2^{-k}\bigl(e-\lambda_g^s(Q)\bigr)-\varepsilon-\lambda_g^s(B\cap C)
       <\lambda_{h_1}^s(B\setminus C).
\]
The disk and its intersection with the trim split the measure exactly. In a minimizing sequence with vanishing division errors and raw trim charge, the limit inferior of the positive endpoints' inner charges is at least \((1-2^{-k})I\) in each sign at fixed positive depth. Even with an exact charged trim, a strictly saving positive endpoint requires a genuinely reducing interior operation with this retained charge. An orientation-preserving ambient pullback supported in \(A\) preserves total energies, as checked by the existing geometric pullback theorem, and therefore has zero saving. [Geometric pullback theorem](../../../../FirstOrderTwistor/GeometricCutDescent.lean) · [Yamabe wall](../../../../SmoothPoincare/Variational/YamabeWall.lean)

## A positive matched example with a charged trim and four exact divisions

The following calculation on standard \(S^4\) uses the unit round metric \(q\). Its ordered full-curvature density is the constant \(24\,dV_q\), and both Weyl blocks vanish. Fix an integer \(k\ge1\) and \(N=2^k-1\). Choose a round geodesic ball \(B\) of radius \(R<\pi\) large enough that \(\operatorname{Vol}_q(B)>N\operatorname{Vol}_q(V_B)\), and choose the concentric \(Q\subset\operatorname{int}B\) by the strictly increasing round volume function so that
\[
 \operatorname{Vol}_q(B\setminus Q)=N\operatorname{Vol}_q(V_B).
\]
The marking \(F\) is inverse stereographic coordinates multiplied in the domain by the positive scalar taking the unit sphere to geodesic radius \(R\), with orientation chosen consistently. It is smooth on the full model, and every sufficiently thin native trim misses \(Q\).

Fix one such width. Take a tiny geodesic ball entirely in \(C\cap V_B\) and \(N\) disjoint geodesic balls of the same radius entirely in \(C\cap(\operatorname{int}B\setminus Q)\). Such a radius exists by choosing finitely many distinct centers in the two open half trims before shrinking it. Use rotations of the round sphere to transport the metric perturbation from the exterior ball to its \(N\) copies. In a smaller stereographic box in the first ball the round metric is \(u^2\delta\). On that box take the smooth compactly supported metric perturbation \(u^2\epsilon\eta(x)x_1^2\,dx_2^2\), where \(\eta=1\) near the chosen center. At that center the corresponding perturbed flat metric has only one nonzero sectional plane, the \(12\) plane, with curvature of magnitude \(\lvert\epsilon\rvert\). The trace-free positive and negative blocks are each nonzero, since the corresponding curvature compression has rank one before its trace is removed. The round conformal factor preserves this Weyl nonvanishing. Thus each copy has strictly positive charge for both signs. The copies have exactly equal changes of full physical curvature and equal values of the other three measures, by the actual orientation-preserving round isometries.

Let \(b_0\) be \(q\) with these \(N+1\) disjoint copied perturbations and one more persistent Weyl perturbation supported in \(\operatorname{int}Q\). Let \(g\) be \(b_0\) plus a disjoint removable Weyl perturbation in \(\operatorname{int}Q\). Both perturbations inside \(Q\) can use the same local one-plane construction. The \(N+1\) copied inputs determine all four original divisions of \(g\). For each of the three measures with zero round background, the sum over \(B\setminus Q\) is \(N\) times the exterior sum. For the full-curvature measure the identity comes from the exact background volume ratio and the \(N\) equal changes of full curvature relative to \(q\). Thus for each original \(m_g=\lambda_g^+,\lambda_g^-,\sigma_g,\nu_g\),
\[
 m_g(V_B)=2^{-k}m_g(V_Q),\qquad V_Q=M\setminus\operatorname{int}Q .
\]
The trim is genuinely charged throughout the path and the two exterior chiral residuals are positive. The raw trim sum can be made arbitrarily small by taking a sufficiently thin width first and then a sufficiently small nonzero size of the perturbations. At time one the inner disk \(A\) retains positive Weyl charge from the persistent \(Q\)-perturbation. The native reference \(F^*b_0\) is genuinely curved there and exactly matched on an open neighborhood of the closed trim.

All support functions and the marking are fixed before making the sizes small. Since scalar curvature depends continuously on the positive Gram and its first two derivatives, the whole affine path from \(g\) to \(b_0\) then has strictly positive scalar curvature by uniform \(C^2\) closeness to the round metric. The positive scalar lower bound and the compact Sobolev inequality bound the four-dimensional Yamabe quotient away from zero uniformly on the path. Its Weyl energy can also be kept below the \(2T\) wall by the same closeness, although scalar positivity here is an independent witness. On the removable support \(b_0=q\), so the exact saving is the nonzero incoming Weyl energy there. Everywhere else all signed charges are preserved. The finite saving is strict and both endpoint and source energies are positive, with \(I^+(S^4)=0\). This analytical example tests a single realized positive competitor and all four marked divisions on standard \(S^4\). A positive curved competitor on a hypothetical nonstandard minimizing sequence remains open. [Conformal Yamabe quotient](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf)

## Verification

Pinned Lean 4.35.0-rc3, Mathlib c55e6e786f49471c72fbddbec5415808896aec1e and DifferentialGeometry 788efe97894474c032de6dfb1289d515f613d15a. The Lake manifest SHA-256 is 839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239.

The working input SHA-256 prefixes were `7f20fb9247000014` for `SelectedDiskReference.lean`, `b9cfe8236b96aa37` for `MatchedFlatDisk.lean`, and `4f740caae26377ba` for `ExteriorGermCharge.lean`. The master `balanced_disk` and `first_order_splice` TeX inputs were `044c5e0c1ea3f5e4` and `e31283f6c8429f7f`. The companion `balanced_exterior` and `core_variation` inputs were `96ec25cd36bf5d31` and `65c76bc676af0725`.

`lake build +SmoothPoincare.Variational.MatchedCurvedDisk` passed cleanly (9877 jobs, 9.7 s on the leaf). A separate `lake env lean -j1` import replay ran `#check @` and `#print axioms` for all seven public declarations. Each reports only `propext`, `Classical.choice` and `Quot.sound`. The final leaf SHA-256 is `bc0973419f64bf8c880357850dd3d901ee0141dbefcc287b662d558db34cfa23`.

- `nativeCurvedGerm_nonflat` carries the actual nonzero Riemann tensor witness through the native marking.
- `exists_selectedMatchedCurvedDisk` constructs the exact-width ambient splice, the open reference germ on the whole original disk and all fixed trim and exterior germs. `exists_selectedClampedCorePath` realizes the concrete ambient supported-change case.
- `selectedMatchedCurvedDisk_trim_charge` and `selectedMatchedCurvedDisk_energy` give exact zero increment and complete-exterior accounting in either chirality.
- `selectedMatchedCurvedDisk_cost_window` and `selectedMatchedCurvedDisk_core_charge_of_division` check the same positive endpoint with the retained signed cost and the explicit protected-core and trim corrections.
