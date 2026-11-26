# Edition 03 · A constant reference matched to the native collar

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. DESC-E07f is a bounded follow-on to the Euclidean reference packet at base a7bb158d6af806d2573a7702386622ed4c0bb1f1 and its resulting `SelectedDiskReference.lean`. Independent serving model and effort telemetry are unavailable. [Lean leaf](../../../../SmoothPoincare/Variational/MatchedFlatDisk.lean) · [Previous disk construction and anisotropic test](ED03_DISK_REFERENCE.md) · [Native four-measure widths](../../../../SmoothPoincare/PhysicalScales/ProtectedMarkedTrims.lean)

## The same native marking and width

Fix a closed oriented smooth homotopy four-sphere with smooth Riemannian metric \(g\), the actual buffered selected chart \(F\), and one protected \(w=(n+1)^{-1}\), \(n>0\). Write \(B=F(\overline B_1)\), \(A=F(\overline B_{1-w})\), and \(C=F(\{1-w<|x|<1+w\})\). Let \(Q\) be the protected original core and \(V_Q=M\setminus\operatorname{int}Q\). Assume on an open neighborhood of the entire closed buffered transition \(\{1-w\le |x|\le 1+w\}\) that \(F^*g\) is one constant positive definite form \(B_0\). It can be arbitrary. Choose \(L\in\mathrm{GL}(4,\mathbb R)\) with \(B_0=L^{\mathsf T}L\), for example by choosing a \(B_0\)-orthonormal basis and using its coordinate map in a Euclidean orthonormal basis. The construction uses the actual model metric \(L^*\delta\). Its inner product at any point and on any pair \(u,v\) is \(\langle Lu,Lv\rangle\), and it is flat by pullback. The theorem `exists_nativeConstantMetric_at` supplies \(L\) by composing the actual differential of \(F\) at a chosen point in the constant collar with the coordinate map of a physical orthonormal basis at its image. This fixes the reference from the incoming Gram at that point. The marked cut is still \(F|_{\partial\overline B_1}\), and the cutoff is still the native radial cutoff with this \(w\).

Extend the constant reference metric to the source, using \(g\) as the fallback and obtaining agreement with the reference on an open neighborhood of \(\overline B_{1+w}\) in the marking. Then use the actual affine splice
\[
 h_t=(1-t\chi)g+t\chi b,\qquad
 \chi\circ F(x)=\phi\!\left(\frac{1+w-|x|^2}{2w}\right),\qquad 0\le t\le1 .
\]
On an open neighborhood of \(C\), \(g=b\), so \(h_t=g\) there and its full curvature vanishes at every \(t\). On \(A\), \(\chi=1\) in a neighborhood and \(h_1=b\). Since \(A\cup C=B\cup C\), the union of these constant-reference neighborhoods covers all of the closed original \(B\). Points in the full original closed exterior \(V_B=M\setminus\operatorname{int} B\) lie off the closed support bound \(A\). At every point off \(A\), either the splice is matched on \(C\) or the cutoff is zero off \(B\cup C\). Thus the whole path has precisely the original metric germs on \(V_B\), including the native unit seam on its two sides. In fact these germs are preserved on all of \(A^c\).

The cap is \(\overline B_1\) with its constant \(B_0\) metric and original boundary parametrization. The exterior and cap agree on collars under \(F\) and reconstruct exactly \(h_1\) on the original marked smooth type. In an isometric Euclidean representation the cap is the ellipsoid \(L(\overline B_1)\), with boundary parameter \(x\mapsto Lx\) on \(\partial\overline B_1\). No change of the cut or extra round-seam hypothesis enters the metric reconstruction. Arbitrary anisotropy of the positive Gram is allowed. In particular \(L=\operatorname{diag}(1,\sqrt{1+\alpha},1,1)\) matches the constant incoming collar of the earlier unaffordability example. For that same marking and collar all cutoff commutators vanish and the curvature cost is exactly zero.

## Exact finite saving and the positivity input

Every term of the full curvature tensor vanishes on \(C\) at all parameters, so the two physical chiral measures, the spectral-square measure and the full physical curvature measure have zero charge there. Every exterior density is the original one on \(V_B\), in its physical volume. The flat cap adds zero for all four. The four endpoint charges on \(V_B\) therefore obey the same division estimates relative to the original charges on \(V_Q\). The comparison uses the complete original exterior at the unit seam and the single realized endpoint.

For each chirality \(s\), with the Hilbert–Schmidt normalization of the source program, exact reconstruction gives
\[
 E_s(h_1)=\lambda_g^s(V_B),\qquad
 E_s(g)-E_s(h_1)=\lambda_g^s(B).
\]
The seams have zero volume. Signature zero makes the two savings equal. The Lean endpoint comparison uses the same oriented frames on the exterior, which can be chosen there because the metric germs coincide. The removed raw charge is a strict gain exactly when it is positive. If the matched endpoint has positive Yamabe class, the same-type variational comparison gives
\[
 I^+(M)\le\lambda_g^s(V_B),\qquad
 \lambda_g^s(B)\le E_+(g)-I^+(M)
\]
in both signs. In particular, on a source where the actual selected complete exterior has raw charge below \(I^+(M)\), zero collar cost forces this endpoint outside the positive class. On the hypothetical nonstandard sequence with \(I^+(M)\ge T\) and both raw exteriors below \(T=4\pi^2\), the matched flat construction consequently cannot simultaneously have positive Yamabe endpoint. The path has no added collar cost, while its interior energy and its final Yamabe sign still require a separate geometric check.

For a positive standard-type illustration, choose on \(S^4\) a positive smooth conformal multiple of the round metric that is Euclidean on a large stereographic coordinate ball. Mark the selected disk there using \(F(x)=\mathrm{stereo}^{-1}(Lx)\) and keep that marking fixed. Its native background metric is \(B_0\). A small, smooth anisotropic perturbation supported inside \(F(B_{1-w})\) can create nonzero Weyl charge while keeping the positive Yamabe sign, by uniform \(C^2\) closeness to the background for a fixed support. The affine splice decreases that perturbation linearly, leaves the original matched collar unchanged, and recovers the positive conformally round background at time one. The saving is the entire original Weyl energy. This analytical special case has zero exterior Weyl charge.

## Verification

Pinned Lean 4.35.0-rc3, Mathlib c55e6e786f49471c72fbddbec5415808896aec1e and DifferentialGeometry 788efe97894474c032de6dfb1289d515f613d15a. The Lake manifest SHA-256 is 839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239.

The incoming `SelectedDiskReference.lean` SHA-256 was `7f20fb9247000014ec856bea3975107e3b2981145d8a8c090782ae32b6a55811`. The new leaf SHA-256 is `b9cfe8236b96aa37574cca22b3bed358ba518ce77c9d2cff57a53d7e4b487784`.

`lake build +SmoothPoincare.Variational.MatchedFlatDisk` passed cleanly (9827 jobs, 12 s on the leaf). Separate `lake env lean -j1` import replays checked `#check @` and `#print axioms` for the definition and all six public theorems. Each reports only `propext`, `Classical.choice`, and `Quot.sound`.

- `nativeConstantMetric`, `nativeConstantMetric_inner`, `nativeConstantMetric_flat` define and check the constant Gram reference.
- `exists_nativeConstantMetric_at` constructs the linear equivalence from the native differential and the actual incoming metric at one chosen point.
- `exists_selectedMatchedFlatDisk` checks the actual affine path, its unchanged full trim and complete exterior germs, its flat endpoints there, and its time-one constant germ around the original closed disk.
- `selectedMatchedFlatDisk_trim_charge` checks the zero raw and time-slice charges in either physical chirality. `selectedMatchedFlatDisk_exact_saving` checks both signed energy identities and the finite infimum bound at the same positive endpoint.
