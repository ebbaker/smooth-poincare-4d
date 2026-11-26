# FOT-E51 · Smooth cutoffs on arbitrary physical pointed balls

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Route 13 derivation. Actual serving model and effort were unavailable. Input checkout 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5 with the existing E48 smooth Bour cutoff. [E48 construction](../../../SmoothPoincare/Variational/BourStationary.lean) · [Lean proof](../../../SmoothPoincare/Variational/BourPointedCutoffs.lean)

Let \(g\) be a smooth Riemannian metric on a connected Hausdorff finite-dimensional smooth manifold without boundary, and let \(o\) be a basepoint. Given \(r>0\), set \(R=3r/4\). The construction uses the compactness of the physical closed \(R\)-ball and the pinned compactly supported Lipschitz approximation on a sigma-compact manifold. If every positive-radius physical closed ball about \(o\) is compact, the integer-radius balls cover the carrier because each physical distance from \(o\) is finite. This supplies sigma-compactness for the approximation. [Pinned compactly supported approximation](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Calculus/Manifold/LipschitzApproximation.lean)

The radial function \(F(z)=\max(0,1-d_g(o,z)/R)\) has Lipschitz constant \(1/R\) and compact support in the physical closed \(R\)-ball. Approximate it by a smooth \(u\) with topological support in \(B_g(o,r)\), uniform error less than \(\varepsilon\), and differential bound
\[
 |du_z(v)|\le (1/R+\varepsilon)\sqrt{g_z(v,v)},\qquad
 \varepsilon=\min\left(\frac1{12},\frac1{12r}\right).
\]
Write \(P\) for the smooth profile with range \([0,1]\), equal to \(1\) on \((-\infty,1]\) and \(0\) on \([2,\infty)\). For \(\chi=P(2-4u)\), the value \(P(2)=0\) gives \(\operatorname{tsupp}\chi\subseteq\operatorname{tsupp}u\). On \(B_g(o,r/2)\), one has \(F\ge 1/3\) and hence \(u\ge 1/4\), so \(\chi=1\). Off \(B_g(o,r)\), \(\chi\) vanishes in a neighborhood and its gradient is zero. [Pinned radial cutoff](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Metric/Distance/RadialCutoff.lean)

The radius-dependent smoothing error gives \(1/R+\varepsilon\le (4/3+1/12)/r\le 2/r\). Let \(D\) be the pinned derivative bound for \(P\) used in E48. The chain rule gives
\[
 |\nabla_g\chi|\le \frac{8D}{r}
 \le \frac{C_{\rm Bour}}{r},\qquad C_{\rm Bour}=1+8D.
\]
Lean applies the bound for \(d\chi\) to \(\nabla_g\chi\), then records the squared estimate. The estimate applies at each positive radius with the same constant and gives the cutoff input for the stationary scalar Caccioppoli argument. [Pinned cutoff profile](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Calculus/Cutoff/Profile.lean)

The public declarations take compactness of the intermediate closed ball together with a sigma-compactness instance, or compactness of all positive-radius closed balls at the chosen center. The pinned Hopf–Rinow theorem supplies those compact balls from metric completeness in positive dimension, with a sigma-compact carrier and Hausdorff tangent bundle. [Pinned closed-ball compactness](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Comparison/HopfRinow/Proper.lean)

The targeted build passed with Lean 4.35.0-rc3, DifferentialGeometry 788efe97894474c032de6dfb1289d515f613d15a and Mathlib c55e6e786f49471c72fbddbec5415808896aec1e. A downstream application on Euclidean four-space used metric completeness to supply the closed balls and obtained the compactly supported cutoff at radius \(100\), equal to one on the physical radius-\(50\) ball. Both declarations depend on propext, Classical.choice and Quot.sound.
