# Edition 03 · A Euclidean reference on the selected physical disk

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 proof packet on working base a7bb158d6af806d2573a7702386622ed4c0bb1f1. Independent serving model and effort telemetry are unavailable. The construction and signed accounting are checked in the linked Lean leaf. The moving-density calculation and the two model tests below are analytical derivations.

[Lean leaf](../../../../SmoothPoincare/Variational/SelectedDiskReference.lean) · [Protected four-measure width](../../../../SmoothPoincare/PhysicalScales/ProtectedMarkedTrims.lean) · [Selected native jets](ED03_SELECTED_PHYSICAL_JETS.md) · [Quadratic estimates](ED03_SELECTED_QUADRATIC_JETS.md) · [Current companion](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex)

## A single metric, width and exact cap

Let \(F\) be the selected buffered outer marking, \(Q\) the original marked core and \(B=F(\overline B_1)\). All metrics are smooth and Riemannian on the same closed oriented homotopy four-sphere. Take one protected index \(n>0\), with \(w=1/(n+1)\), and put \(C=F(\{1-w<|x|<1+w\})\), \(A=F(\overline B_{1-w})\). The protected-core and buffer conclusions give \(Q\subset A\subset B\), \(A\cap C=\varnothing\), and \(A\cup C=B\cup C\). In particular the fixed exterior is the complete complement of \(A\cup C\).

Extend \(F_*\delta\), the actual Euclidean metric in this marking, to a smooth ambient reference \(b\) by the compact metric extension theorem with fallback \(g\). It agrees with \(F_*\delta\) on a neighborhood of the whole buffered disk. Let \(G\) be the existing smooth native lift of \(g\). For the chosen radial step \(\chi=\phi((1+w-|x|^2)/(2w))\), splice by \(h_t=(1-t\chi)g+t\chi b\), \(0\le t\le1\), using the extended cutoff on the source. The path is positive definite and pulls back exactly to \((1-t\chi)G+t\chi\delta\) on that neighborhood. Off \(A\cup C\) all its metric germs equal \(g\). In fact the cutoff is supported inside \(F(\overline B_{1+w/2})\). Its weight is one on \(A\), so the original \(Q\) is protected from transition derivatives and is itself replaced in the time-one metric.

The metric \(h_1\) is exactly Euclidean in the marking on an open neighborhood of the entire \(A\), since \((1-w)^2<1-w\). The sphere of radius \(1-w\) is thus a marked seam with collars on both sides. Cap its whole retained exterior with the Euclidean ball of radius \(1-w\) by the same marking. This reconstructs \(h_1\) smoothly, with the original orientation and smooth type. The added ball has zero chiral, spectral and full curvature charge. The original unit sphere has cutoff value \(1/2\) and lies in the transition. No matched Euclidean cap at the original unit sphere follows without a separate matching condition.

For any one of the four incoming measures \(m=\lambda^+,\lambda^-,\sigma,\nu\), write \(V_A=M\setminus\operatorname{int} A\), \(V_B=M\setminus\operatorname{int} B\). The annulus \(V_A\setminus V_B\) lies in \(C\) up to the smooth inner sphere, which is \(m\)-null by absolute continuity. Hence
\[
 0\le m(V_A)-m(V_B)\le m(C).
\]
An absolute dyadic division tolerance \(\tau\) at \(V_B\) becomes at most \(\tau+m(C)\) at \(V_A\). This uses the very same \(n\) for both chiral measures, the spectral density in the source frame and the ordered full curvature density. The four densities of the new metric are unchanged on the complete complement of \(A\cup C\) by metric locality. Their values on the retained transition belong to \(h_t\) and use its volume.

## Estimated joined and capped costs

In the native chart set \(D=\delta-G\), \(q=t\chi\), \(G_t=G+qD\), \(P=\partial G\). Use any fixed orientation-adjusted Cartesian basis, the Euclidean tensor coefficient norms in that basis and the pulled incoming volume \(\mu=F^*dV_g\). On a compact buffered disk choose \(0<m_0\le M_0<\infty\) so that both \(G\) and \(\delta\) are in the matrix window \([m_0\mathrm{Id},M_0\mathrm{Id}]\). This same window contains all \(G_t\). The inverse comparison is
\[
 G_t^{-1}-G^{-1}=-q\,G_t^{-1}D G^{-1},
 \qquad \|G_t^{-1}-G^{-1}\|\le t m_0^{-2}\|D\|.
\]
With covariant ordered slots, the coordinate curvature has the form \(R_t=L(\partial^2 G_t)+Q_2(G_t^{-1},\partial G_t,\partial G_t)\), where \(L\) is constant linear and \(Q_2\) is a fixed trilinear expression. Here \(Q_2\) is unrelated to the marked core \(Q\). On \(C\) put \(d_{0,p}=\|D\|_p\), \(d_{1,2}=\|P\|_2\), \(p_4=\|P\|_4\), all on \(\mu|_C\). Write \(\partial G_t=(1-q)P+tE\) with \(E=d\chi\otimes D\). Twice differentiating gives the frozen term \((1-q)\partial^2 G\) and the error \(t[(\partial^2\chi)D-\partial\chi\otimes P-\text{the transposed mixed term}]\). Applying the first- and second-jet bounds and Hölder, and adding and subtracting \((1-q)^2Q_2(G_t^{-1},P,P)\), gives
\[
\begin{split}
 \|R_t-(1-q)R_0\|_2\le at,\qquad
 a=C_*[&(w^{-2}+w^{-1})d_{0,2}+w^{-1}d_{1,2}\\
 &+m_0^{-1}(w^{-1}d_{0,4}p_4+w^{-2}d_{0,4}^{\,2})\\
 &+(m_0^{-1}+m_0^{-2}\|D\|_\infty)p_4^{\,2}].
\end{split}
\]
The dimension and cutoff determine \(C_*\). The last line accounts for both the moving inverse and the difference between squaring the first-jet weight and applying the weight once to the curvature. It can persist where the cutoff derivatives vanish. On \(A\), replace this formula by the same last line using \(p_4,\|D\|_\infty\) on \(A\), since \(\chi=1\) there.

Let \(P_s(H;G)\) evaluate the covariant slots in an oriented \(H\)-orthonormal frame, take the trace-free \(s\)-chiral compression, and multiply by \((\det H/\det G)^{1/4}\). Use oriented Gram–Schmidt in the fixed basis on the positive Gram cone. Frame evaluation, the two compression maps and the determinant factor are smooth there, with bounded derivatives on the ellipticity window. In particular \(P_s(G_t;G)-P_s(G;G)\) has operator norm at most \(t C(m_0,M_0)\|D\|_\infty\). The fourth root makes the squared norm use precisely \(dV_{h_t}\) relative to \(\mu\). With \(F_t^s=P_s(G_t;G)R_t\), on each \(U=A,C\),
\[
 \|F_t^s-(1-t\chi)F_0^s\|_{2,U}
 \le t\beta_s(U),\qquad
 \beta_s(U)=C(m_0,M_0)\big[a(U)+\|D\|_{\infty,U}\|R_0\|_{2,U}\big].
\]
The sign is determined by the source orientation. If the native parameters reverse it, reverse one Cartesian basis vector before computing the two compressions. The constants and the actual mismatch here belong to this finite source and width.

For each sign set \(r_s(U)=\lambda_g^s(U)\), \(b_s(U)=\int_U(1-\chi)^2\,d\lambda_g^s\). Apply the signed norm comparison on \(A\) and \(C\) with the two fixed densities \(F_0^s\) and \((1-\chi)F_0^s\). The joined surcharge on \(U\) is bounded by
\[
 J_s(U)=\max\{0,(\sqrt{b_s(U)}+\beta_s(U))^2-r_s(U)\}.
\]
The time-one increase on the retained \(C\) is bounded by the signed cost
\[
 c_s(C)=(\sqrt{b_s(C)}+\beta_s(C))^2-r_s(C).
\]
There is no other retained change or cap cost on this inner seam. The spectral charge can be calculated from the same two densities via the top eigenvalue and the spectral Lipschitz estimate in the companion's balanced exterior. The norm of the full pulled curvature in the moving frame with the same fourth-root volume factor similarly gives the physical full charge. None of these comparisons bounds the new charges by the four small raw charges alone.

If \(g\) has positive Yamabe class and \(E_s(g)+J_s(A)+J_s(C)<2T\) for one sign, the entire joined path stays below the scalar-flat wall. The classical Yamabe theorem and the normalized four-dimensional Gauss–Bonnet identity give that wall at \(2T=8\pi^2\) on the homotopy sphere. A continuous sign detector is the lowest conformal-Laplacian eigenvalue along the smooth compact path. Its continuity follows from the Rayleigh forms on the common \(H^1\) space, using uniform ellipticity and uniform convergence of the gradient, scalar and volume coefficients as the path parameter varies. Its sign agrees with the class Yamabe sign by testing the Yamabe representative and using conformal covariance of the quadratic form. Thus the reconstructed \(h_1\) is positive, as it also is if its positivity is established directly. [Yamabe quadratic form and theorem](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf) · [Project wall convention](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex)

The actual gain is
\[
 \lambda_g^s(A)-\big(\lambda^s_{h_1}(C)-\lambda_g^s(C)\big)
   = E_+(g)-E_+(h_1).
\]
Signature zero and exterior equality give the same gain for both signs. The lower bound \(\lambda_g^s(A)-c_s(C)>0\) therefore tests strict saving when the positivity condition is available. On this positive same-type competitor the gain cannot exceed \(E_+(g)-I^+(M)\). An estimate strictly exceeding that finite excess would contradict the stated hypotheses for that source.

## Two tests of the same replacement

**Positive exact match on the standard sphere.** Take a conformally round \(h_0\) on standard \(S^4\), Euclidean on the buffered marked chart by cancelling the stereographic factor there and round on a nonempty open exterior. Pick concentric \(Q\subset\operatorname{int} A\), with disjoint boxes in \(\operatorname{int} Q\) and \(\operatorname{int} A\setminus Q\). In the first box perturb \(\delta_{22}\) by \(\epsilon f\), where \(f=x_1^2\) near the center and has smooth compact support. For small nonzero \(\epsilon\) this has nonzero Weyl curvature there: at the center only the \(12\)-sectional plane is curved and its two chiral trace-free blocks are nonzero. Smallness in \(C^2\) gives arbitrarily small original full charge on \(Q\) and \(E_+<2T\) on the closed source and the whole affine path. In the second box multiply by \(e^{2b\psi}\) for a fixed smooth compactly supported \(\psi\) equal to \(x_1\) on a subbox. There \(R^2dV=36b^4\,dx\), so the full curvature charge on the second box is continuous in \(b\), starts at zero and tends to infinity by \(|\mathrm{Rm}|^2\ge R^2/6\). For any chosen positive dyadic depth \(k\), choose \(b\) so that the full charge in \(B\setminus Q\) is \((2^k-1)\nu(V_B)\). Then all four incoming divisions are exact: the two Weyl and spectral charges outside \(Q\) vanish and the full charge has the prescribed ratio. All four raw charges on \(C\) vanish and \(h_t=g=h_0\) there.

On the first box \(h_t\) just reduces the perturbation to \((1-t)\epsilon f\). On the second box it multiplies \(\delta\) by the positive scalar \((1-t)e^{2b\psi}+t\), so it is conformally flat there at every time. Elsewhere it is \(h_0\). Each \(h_t\) is conformal to a \(C^2\)-small perturbation of \(h_0\) and has positive Yamabe sign for sufficiently small \(\epsilon\). The joined path stays below the wall, the Euclidean cap gives exactly \(h_1=h_0\), and the signed saving is \(E_+(g)>0\) in both signs. Here \(I^+(S^4)=0\) and the endpoint attains it. The exterior has positive full curvature and zero chiral charge. This is a standard-type special case with an originally matched collar.

**An unaffordable flat incoming collar in this marking.** In a fixed native chart take \(G=\operatorname{diag}(1,1+\alpha,1,1)\) on a neighborhood of the whole collar, \(0<\alpha<1\), with the same Euclidean reference and selected cutoff. It has zero raw mass for all four measures. At time one the metric is the flat three-dimensional base times the one-dimensional fiber \(dx_2^2\) with coefficient \(a^2=1+\alpha(1-\chi)\), where \(a\) may depend on all coordinates. The only nonzero Christoffels are \(\Gamma^2_{i2}=a_i/a,\ \Gamma^i_{22}=-aa_i,\ \Gamma^2_{22}=a_2/a\) and the symmetric lower-slot repeats, with \(i\) a base index. The curvature operator has one possibly nonzero mixed-plane block \(S=-D_{\rm base}^2a/a\) in orthonormal slots. Thus either Weyl block is orthogonally conjugate to \(\tfrac12(S-\operatorname{tr}S\,\mathrm{Id}/3)\). Write \(a=f(\chi)\) and \(p=(1+w-|x|^2)/(2w)\). The trace-free base Hessian has the coefficient
\[
 w^{-2}\big(f'(\chi)\phi''(p)+f''(\chi)\phi'(p)^2\big)
\]
multiplying the trace-free part of \(x_{\rm base}x_{\rm base}^{\mathsf T}\). On a closed subinterval of the transition where \(\phi''>c>0\), both terms have the same sign since \(f',f''<0\). Such an interval exists because \(\phi'\) rises from zero to a positive value. On the angular sector \(|x_{\rm base}|\ge1/2\), the pointwise squared chiral norms are bounded below by \(c'\alpha^2 w^{-4}\). That sector and parameter interval have physical volume at least \(c''w\) for small \(w\), and lie in \(C\). The actual cost in each sign therefore grows at least as \(c'''\alpha^2 w^{-3}\). This test concerns the chosen Euclidean reference in a fixed marking. Selecting a different reference or controlling the actual coordinate mismatch can change its outcome.

A positive joined or independently positive capped endpoint with sufficient signed gain on a charged nonstandard minimizing sequence remains open. The example with zero exterior Weyl charge does not supply it.

## Verification

Pinned Lean 4.35.0-rc3, Mathlib c55e6e786f49471c72fbddbec5415808896aec1e and DifferentialGeometry 788efe97894474c032de6dfb1289d515f613d15a. Lake manifest SHA-256 839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239.

The working Lean input SHA-256 prefixes were `fa463f14b3d10068` (`SelectedQuadraticJets.lean`), `a22335277211ad91` (`SelectedPhysicalJetControl.lean`), `c3bfd70d18450513` (`PositiveCoreVariation.lean`) and `27a392ed20c4c96a` (`ProtectedMarkedTrims.lean`). The balanced exterior and core variation TeX prefixes were `96ec25cd36bf5d31` and `65c76bc676af0725`.

`lake build +SmoothPoincare.Variational.SelectedDiskReference` passed cleanly (9826 jobs, 9.4 s on the leaf). A separate `lake env lean -j1` import replay ran `#check @` and `#print axioms` on all 14 public declarations. Every declaration reports only `propext`, `Classical.choice` and `Quot.sound`. The leaf SHA-256 is `7f20fb9247000014ec856bea3975107e3b2981145d8a8c090782ae32b6a55811`.

- `exists_selectedEuclideanReferenceSplice` constructs the ambient reference, incoming lift, exact model/physical pullback identity and exterior metric germs.
- `selectedEuclideanSplice_flat_near_innerDisk` gives the exact open marked Euclidean germ and zero physical curvature. `selectedReference_innerDisk_partition` identifies the complete changed set. `selectedReference_complement_cost` bounds the shift for every finite incoming measure on the complements of the closed disks. The equality with the closed exteriors uses the physical null seams as above.
- `exists_selectedEuclideanSecondPartialError_on_physicalTrim` specializes the actual measured second-jet error to the constant Euclidean reference. The first-jet and quadratic results are the same-width applications of `SelectedQuadraticJets`. The finite moving inverse/projection estimates above are analytical.
- `selectedReference_charge_eq_zero_of_flat` gives zero charge in both signs. `selectedReference_charge_eq_of_germ` establishes exact signed exterior equality with both physical volumes in a shared choice of oriented frames there. Such frames can be chosen equal where the metric germs are equal. The endpoint hypotheses retain integrability and signature zero through the existing `SignedCollarMetric` interface.
- `selectedReference_endpoint_saving` and `selectedEuclideanSplice_positive_saving` check the exact finite gain and the strict positive signed test on the same marked endpoint. Its positive Yamabe sign and signed cost bound are premises to the latter theorem.
