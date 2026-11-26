# FOT-E51 · The stationary rough term on the physical harmonic patch

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Route 13 calculation. Actual serving model and effort were unavailable. Input checkout 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5 with the working E50 harmonic patch and E51 Ricci-interior estimates. [E50 harmonic chart](E50_INTERIOR.md) · [E51 Ricci equation](E51_RICCI_INTERIOR.md) · [Lean proof](../../../SmoothPoincare/Variational/BourStationaryPullback.lean)

Let \(\Phi:U\to \Phi U\) denote the physical chart map, where its open image \(\Phi U\) lies in the original manifold with metric \(h\). Let \(g\) be the globally smooth model metric given by E50. Assume \(g=\Phi^*h\) on the open set \(U\), which in E50 is the inner buffered model ball. Apply the diffeomorphism of open subtypes induced by the same partial diffeomorphism. Its differential at \(x\) is the differential of the original chart. If tensor fields agree under this differential at every point of \(U\), the pinned iterated-connection naturality theorem identifies their derivatives of every order at \(x\), including the two derivative slots. Ambient derivatives agree with the subtype derivatives by locality. [Pinned metric-isometry connection treatment](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Metric/Tensor/Pullback.lean)

For the occupied rough term choose one tangent basis \(b_i\) at \(x\) and its image \(d\Phi_x b_i\) at \(\Phi x\). Their Gram matrices have the same entries under \(g\) and \(h\); the same inverse entries are therefore valid in both. Contraction in the first two slots of the second covariant derivative gives
\[
 (\operatorname{tr}_g\nabla_g^2 A)_x(v_1,\dots,v_k)
 =
 (\operatorname{tr}_h\nabla_h^2 B)_{\Phi x}
               (d\Phi_xv_1,\dots,d\Phi_xv_k)
\]
whenever \(A=\Phi^*B\) on \(U\). This is the ordinary rough trace used by the actual stationary equation, with sign \(+\operatorname{tr}\nabla^2\).

Ricci naturality gives this tensor agreement for \(A=\operatorname{Ric}(g)\) and \(B=\operatorname{Ric}(h)\). Scalar and metric naturality give it for \(A=\operatorname{Ric}_0(g)\), \(B=\operatorname{Ric}_0(h)\) with the four-dimensional \(R/4\) subtraction. The stationary forcing is evaluated only at the image \(\Phi x\) in the supplied physical slice \(h\), on the transported pair of vectors. This supplies the rough-term input for the harmonic coordinate inequality on the original open model ball. The metric extension can have arbitrary scalar curvature and gradient off \(U\). The stationarity assumption, constant scalar assumption and curvature estimates refer to the physical metric alone. [Pinned Ricci and scalar naturality](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Curvature/Naturality/Pullback/LocalCross.lean)

The full lowered Riemann tensor also transports on the same patch. Mapping a physical orthonormal basis by \(d\Phi\) gives an orthonormal basis for the same source slice at the image point. Every ordered four-slot component agrees across these bases, so the two ordered squared norms are equal. Thus the physical curvature ceiling gives the model ceiling needed to bound its output-raised chart curvature.

The targeted build passed with Lean 4.35.0-rc3, DifferentialGeometry 788efe97894474c032de6dfb1289d515f613d15a and Mathlib c55e6e786f49471c72fbddbec5415808896aec1e.

A downstream application takes the actual extension returned by the E50 harmonic chart and applies both the rough trace-free Ricci equality and the curvature-square equality on its entire inner ball. Axiom inspection of the iterated derivative, rough trace, ordered curvature and stationary transport declarations reports propext, Classical.choice and Quot.sound.
