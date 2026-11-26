# Edition 03 · Positive curved conformal references in the native core

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 follow-on to DESC-E08a on Git base 95a4f50eb9ec6e0e98454170279f45a66b000211. Independent serving model and effort telemetry are unavailable. [Lean leaf](../../../../SmoothPoincare/Variational/ConformalCoreReference.lean) · [Matched curved references](ED03_MATCHED_CURVED_DISK.md)

Fix a nonempty connected compact boundaryless smooth Riemannian four-source and any metric \(g\) with positive class Yamabe constant. Use the actual selected marking \(F\) and a buffered width \(w=(n+1)^{-1}\) with \(n>0\). Let
\[
 A=F(\overline B_{1-w}),\qquad B=F(\overline B_1),\qquad
 C=\operatorname{selectedDiskTrim}(F,n).
\]
The construction supplies a single actual smoothly varying conformal family on this source, with the whole original trim and closed exterior fixed as metric germs. It has curved nontrivial endpoints at arbitrarily small nonzero parameters.

Choose a smooth function \(u\) with support in the image of the native open ball of radius \((1-w)/2\), equal to one at \(F(0)\). Existence uses the smooth support theorem for the open image and the closed singleton. The closure of its support is contained in the compact image of the corresponding closed half-radius ball, which itself lies strictly inside \(A\). A native unit vector gives a point \(F(e)\) where \(u\) is zero. Injectivity of \(F\) on its source supplies this conclusion in the actual marking. If \(du\) vanished everywhere, local constancy together with connectedness would make these two function values equal. Thus some \(x\) has \(du(x)\ne0\). At a point outside the compact support bound \(u\) vanishes on a neighborhood, so the chosen \(x\) lies in the strict inner disk.

Set \(g_s=e^{2su}g\) for \(s\in\mathbb R\). Every \(g_s\) is smooth and positive definite. Addition of logarithmic conformal factors and surjectivity of translation show that the sets defining \(Y([g_s])\) and \(Y([g])\) coincide. In particular \(Y([g_s])=Y([g])>0\) for every \(s\). On the entire trim \(C\) and entire exterior \(M\setminus\operatorname{int}B\), \(u\) vanishes on a neighborhood because both sets are disjoint from \(A\). Hence every \(g_s\) has exactly the incoming metric germs there. The original boundary marking and the original cut are available to reconstruct the cap from the restriction of any \(g_s\) to \(B\).

The checked formula at the chosen point is
\[
 R_{g_s}(x)=e^{-2s u(x)}
   \left[R_g(x)-6s\Delta_g u(x)-6s^2|\nabla_g u(x)|_g^2\right].
\]
Here the Laplacian is divergence of the gradient and the derivatives use the incoming \(g\). The nonzero differential and positive definiteness imply \(|\nabla_g u(x)|_g^2>0\). The numerator is a genuine quadratic. For the same fixed bump and any \(\eta>0\), at least one of \(\eta/2,-\eta/2,\eta\) is not a root. The corresponding \(g_s\) has nonzero scalar curvature and nonzero full Riemann tensor at the chosen interior point. At \(F(0)\) the same endpoint scales the tangent metric by \(e^{2s}\neq1\), so the metric differs genuinely from \(g\).

The construction supplies a positive curved endpoint for every positive finite source at every allowed buffered width, including an incoming metric flat on all of \(A\). It supplies the exact scalar curvature formula to the separate conformal cost test. The strict Weyl-saving test concerns a separate comparison, and the chiral conformal invariance packet uses this very family \(g_s\).

## Verification

Pinned Lean 4.35.0-rc3, Mathlib c55e6e786f49471c72fbddbec5415808896aec1e and DifferentialGeometry 788efe97894474c032de6dfb1289d515f613d15a. The Lake manifest SHA-256 is 839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239.

The incoming `MatchedCurvedDisk.lean` and `SelectedDiskReference.lean` SHA-256 prefixes were `bc0973419f64bf8` and `7f20fb9247000014`. The conformal transformation uses the pinned `metricScalarAt_conformalMetric` theorem and the smooth incoming gradient and Laplacian scaling lemmas.

`lake build +SmoothPoincare.Variational.ConformalCoreReference` passed cleanly with 9887 jobs and 9.3 s on the leaf. A separate `lake env lean -j1` import replay ran `#check @` and `#print axioms` for all five public declarations. Each reports only `propext`, `Classical.choice` and `Quot.sound`. The final leaf SHA-256 is `7314515321ee202eadc56c04ce39c27798895ce85edc9a43f5a8eb9bf5370b2b`.

- `classYamabeFour_conformalCore` checks exact class equality.
- `exists_selectedConformalCoreBump` supplies the supported factor at the unchanged marking and a genuine nonzero-differential witness.
- `conformalCore_scalar_quadratic` checks the exact pointwise scale law. `exists_nonzeroScalar_conformalCore` checks the arbitrarily small parameter choice for the fixed factor and point.
- `exists_selectedPositiveConformalCoreReference` combines the same positive class, distinct nonflat endpoint, and original trim and exterior germs into one statement on the physical metric family.
