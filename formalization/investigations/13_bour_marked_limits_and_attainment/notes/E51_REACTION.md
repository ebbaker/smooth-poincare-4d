# E51 stationary curvature forcing in the physical chart

26 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded execution on the E51 working
tree over `1c81a3048c8c21a4c1d1fb23db72f37168a15ca5`. Actual serving
model and effort were unavailable. Inputs are Lean `v4.35.0-rc3`,
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`,
Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, and the
fixed-type attainment manuscript with SHA-256
`719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`.
[Stationary source and harmonic expansion](E51_RICCI_INTERIOR.md) ·
[Physical model chart](E50_INTERIOR.md)

Let \(h=ag\) be the normalized Riemannian metric on a smooth
four-dimensional stationary slice. Take \(a>0\) and \(0\le p\le1\),
and write \(R_g=R\), \(R_h=s=R/a\), \(Q=\operatorname{Ric}_h\),
and \(Z=Q-sh/4\). The constant-scalar model has \(\nabla s=0\), so the
rough Laplacian of \(Z\) is the rough Laplacian of \(Q\).
The native curvature formula uses \(\Delta=\operatorname{tr}_h\nabla^2\)
and the curvature action \(\mathcal R_h(Q)\) realized by the
pinned Hamilton tensor. The verified CSC formula is
\[
 \Delta Z=-2\mathcal R_h(Q)-\frac{p-4}{6}sQ+
       \left[\tfrac12|Q|_h^2+\tfrac{p-4}{24}s^2\right]h .
\]
The crossed-curvature action convention is
\(\mathcal R_h(Q)(u,v)=\sum_{i,j}Q(e_i,e_j)\langle R(e_i,u)v,e_j\rangle_h\)
on any physical orthonormal basis. This is the form convenient for the
estimate. Bour's Weyl decomposition writes the scalar multiple of \(Z\)
in the gradient with coefficient \(c_h=(2-p)R/(12a)\).
The constant-metric law gives \(c_h=c_g/a\) with
\(|c_h|\le C/(6a)\) when \(|R|\le C\).
The two covariant Ricci tensors \(Q\) and \(Z\) have weight zero and the
ordered curvature norm has weight minus one. The computed physical
gradient has weight minus one, which transfers zero from the original
slice to the normalized slice.
[Bour v1, Proposition 4.4](https://arxiv.org/html/1012.0342v1#S4) ·
[Physical gradient scaling](../../../SmoothPoincare/Variational/BourGradientScaling.lean) ·
[Ordered curvature normalization](../../../SmoothPoincare/Variational/BourHarmonicBalls.lean)

Fix a point and write \(|\operatorname{Rm}(h)|_{(0,4)}\le K\).
Physical orthonormal expansion bounds a Riemann evaluation by
\(K\) times the product of its four direction lengths. The Ricci trace
therefore gives \(|Q(u,v)|\le4K|u|_h|v|_h\).
Expanding the Riemann–Ricci contraction into sixteen terms gives
\(|\mathcal R_h(Q)(u,v)|\le64K^2|u|_h|v|_h\).
The squared Ricci norm is a sum of sixteen squares of entries, so
\(|Q|_h^2\le256K^2\). When \(|s|\le C\), the scalar term costs
\((8/3)CK|u|_h|v|_h\), and the density term costs
\((128K^2+C^2/6)|u|_h|v|_h\).
Together,
\[
 |\Delta Z(u,v)|\le
 \bigl[256K^2+(8/3)CK+C^2/6\bigr]|u|_h|v|_h ,
 \qquad
 |Z(u,v)|\le (4K+C/4)|u|_h|v|_h .
\]
For \(a\ge1\), the original scalar ceiling \(|R|\le C\) also bounds
\(|s|\). For arbitrary positive scales, tracing Ricci once more gives
\(|s|\le16K\) at the same point, so the uniform principal bound may use
\(C+16K\) in place of \(C\).

For fixed chart axes of \(h\)-length at most \(L\), an inverse Gram entry
bound \(D\) gives \(|\mathcal R^m{}_{ijk}|\le4DKL^4\). The proof raises
exactly the last covariant Riemann slot by the inverse Gram, and applies
the four-direction estimate to each summand. This is the specific
curvature that enters the harmonic cancellation for
\(h^{ab}\partial_a\Gamma^m_{bi}\).
[Pinned chart curvature index raising](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Flow/RicciFlow/Compactness/Fields/Open/HalfLineCurvatureContinuity.lean) ·
[Lean reaction and chart bounds](../../../SmoothPoincare/Variational/BourStationaryReaction.lean)

`bourModelStationaryReaction_bounds` transfers the ordered curvature norm
and the rough Ricci tensor through the physical chart differential. The
model metric may be any smooth extension of the actual pullback on the
open patch. The upper metric form bound gives physical axis lengths at
most \(LB\), where \(B\) bounds the fixed model axis lengths. The resulting
three inputs to the harmonic equation control the raised model curvature,
the trace-free Ricci components and the rough stationary forcing.

`bourUniformStationaryHarmonicTraceFreeRicci_bounds` chooses constants
\(U,F_0,F_1\) before the native metric, scale, parameter, harmonic chart
and matching model extension. The chart ellipticity and first-jet control
give the required common inverse-Gram bound, and the harmonic Ricci
identity yields \(|Z_j|\le U\) and
\[
 |h^{ik}\partial_i\partial_k Z_j|
   \le F_0+F_1\sum_{\ell,d}|\partial_d Z_\ell|
\]
on the fixed ball of radius \(3r\), with \(j,\ell\) indexing the two
Ricci slots and \(d\) a fixed chart axis. These are physical source
inputs to the separate finite-system estimate.
[Stationary transport](../../../SmoothPoincare/Variational/BourStationaryPullback.lean) ·
[Harmonic equation](../../../SmoothPoincare/Variational/BourRicciInteriorEstimate.lean)

`lake build SmoothPoincare.Variational.BourStationaryReaction` passed.
The axiom audit of all eleven public theorems found only `propext`,
`Classical.choice`, and `Quot.sound`.
