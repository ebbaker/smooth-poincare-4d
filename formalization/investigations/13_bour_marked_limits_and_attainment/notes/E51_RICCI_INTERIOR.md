# E51 stationary harmonic-coordinate Ricci estimate

26 November 2026. Prepared for Edward Baker with OpenAI assistance. Actual
serving model and effort were unavailable. Inputs are the E49 harmonic
interior note (SHA-256 `2bfa7a5ea9b1c67a89e777b75053e97f24fde4bde2ff8a931b2a18c5fb7279d2`),
E50 harmonic-chart note (SHA-256 `d52a0607eff6b8a437de6912138a4b05f7e155ca0bf5802951d9ebd72c6f4245`),
the Route 13 manuscript (SHA-256 `719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`),
and the E50 physical gradient at `1c81a3048c8c21a4c1d1fb23db72f37168a15ca5`.
The calculation uses smooth Riemannian tensors in dimension four. The
coordinate identities hold in arbitrary finite dimension.

## Source equation and scale

Write \(s=R_h\), \(Q=\operatorname{Ric}_h\), \(Z=Q-sh/4\), and use the
positive-at-local-minima Laplacian \(\Delta=\operatorname{tr}_h\nabla^2\).
At a stationary point of the physical Bour gradient on a constant-scalar
region the checked commuted formula gives
\[
\operatorname{tr}_h\nabla^2Z=-2\mathscr R_h(Q)-\frac{p-4}{6}sQ
 +\left[\frac12|Q|_h^2-\frac{4-p}{24}s^2\right]h.
\]
Here \(\mathscr R_h(Q)(u,v)=\sum_{a,b}Q(e_a,e_b)
 \operatorname{Rm}_h(e_a,u,v,e_b)\) in the paper's pinned curvature
convention. Replacing \(Q\) with \(Z+sh/4\) yields
\[
 \operatorname{tr}_h\nabla^2 Z=-2\mathscr R_h(Z)
       +\frac{1-p}{6}sZ+\frac12|Z|_h^2h.
\]
The second expression uses \(\mathscr R_h(h)=Q\) and is a manuscript
calculation. The Lean source uses the first expression. The scalar
conformal coefficient in the separate E50 stationary equation is
\(c_h=(2-p)s/12\). Under the physical constant homothety \(h=a g\), the
checked scaling identity gives \(c_h=a^{-1}c_g\). The covariant \(Z\)
is invariant, while \(|Z|_h=a^{-1}|Z|_g\). For the E49 normalized
metrics \(a\ge1\) and \(0\le p<1\), \(|c_h|\le |R_g|/(6a)\).
The higher-order harmonic-coordinate program in this packet starts
from Bour's stationary regularity system and the harmonic-coordinate
regularity of the metric and Ricci equations. [Bour, Proposition 4.4](https://arxiv.org/html/1012.0342v1)
[DeTurck–Kazdan, Theorem 4.5](https://doi.org/10.5802/aif.826)

## Contraction that removes the second metric jet

Put \(A^{ab}=h^{ab}\), \(\Gamma^k_{ab}=\Gamma^k_{ab}(h)\), and write the
coordinate curvature used by Lean as
\(\mathcal R^k{}_{bai}=(R(\partial_a,\partial_i)\partial_b)^k\).
Differentiate \(A^{ab}\Gamma^k_{ab}=0\) in direction \(i\). The curvature
identity and symmetry in the lower connection indices give
\[
\begin{aligned}
 C_i{}^k:=\sum_{a,b} A^{ab}\partial_a\Gamma^k_{bi}
  ={}& \sum_{a,b} A^{ab}
  \left[\mathcal R^k{}_{bai}
     -\sum_m(\Gamma^k_{am}\Gamma^m_{bi}
              -\Gamma^k_{im}\Gamma^m_{ba})\right]\\
  &-\sum_{a,b}(\partial_i A^{ab})\Gamma^k_{ab}.
\end{aligned}
\]
This identity is pointwise on any open harmonic-coordinate set. If
\(A,D,G,K\) are upper bounds on the absolute values of inverse
entries, their first coordinate derivatives, Christoffel symbols, and
upper-index curvature components, its checked component bound is
\[
 |C_i{}^k|\le H:=n^2\{A(K+2nG^2)+DG\}.
\]
Both rank-two tensor connection slots produce \(C_i{}^kZ_{kj}\)
and \(C_j{}^kZ_{ik}\). The derivative-index connection in the rough
Laplacian vanishes on contraction by the same harmonic gauge identity.
The local metric first jet suffices for \(D,G\). In coordinates
\(|\partial h|\le L_1\) gives \(D\le n^2 A^2L_1\) and
\(G\le3nAL_1/2\). If the coordinate axes have \(h\)-length at most \(L\)
and \(|\operatorname{Rm}_h|_h\le K_0\), index raising gives
\(K\le n A L^4K_0\). The E49 uniform harmonic chart provides uniform
\(A,L,L_1\). The normalized E49 curvature supplies \(K_0=1\).
[Harmonic interior and cutoff geometry](E49_HARMONIC_INTERIOR.md)

## Interior estimate at fixed exponent

The same scalar principal operator \(P=A^{ab}\partial_a\partial_b\)
acts on each component. Write \(U=\max_{i,j}|Z_{ij}|\),
\(V=\max_{m,i,j}|\partial_mZ_{ij}|\), and \(F\) for a component bound on
the rough equation's right-hand side. Expanding the two undifferentiated
connection actions, \(\max|\nabla_b Z_{ij}|\le V+2nGU\), and using
the contraction above yields
\[
 |PZ_{ij}|\le F+(2nH+4n^4AG^2)U+4n^3AGV .
\]
Uniform curvature and scalar bounds give uniform \(U\) and \(F\).
No second metric derivative enters this estimate.

Assume the common flat constant-coefficient Calderón–Zygmund estimate
at the fixed finite exponent \(b>4\) and a harmonic radius small enough
for the common first-jet modulus to absorb the change in principal
coefficients. Apply the flat estimate to a cutoff of each component,
freeze the principal operator, and absorb the coefficient difference.
With \(2r\le t<T\le 5r/2\), use the cutoff supported on
\(B_{(t+T)/2}\) and equal to one on \(B_t\). The cutoff gradient and
Hessian are bounded by constants times \((T-t)^{-1}\) and
\((T-t)^{-2}\). This gives
\[
 \|D^2 Z\|_{L^b(B_t)}\le C\left(
  \|F\|_{L^b(B_{3r})}
  +[1+(T-t)^{-1}]\|DZ\|_{L^b(B_{(t+T)/2})}
  +[1+(T-t)^{-2}]\|Z\|_{L^b(B_{3r})}\right).
\]
For each coordinate direction use the difference quotient of step
\(\delta=\varepsilon(T-t)\) and its integral Taylor remainder.
Minkowski and translation invariance give the first derivative term
bounded by \(C'\delta\|D^2Z\|_{L^b(B_T)}
+C'\delta^{-1}\|Z\|_{L^b(B_T)}\). Choose \(\varepsilon\) to give
a Hessian coefficient at most \(1/8\). Dyadic nesting of the radii
starting at \(2r\) and ending at \(5r/2\) converges because the error at
step \(m\) grows at most like \(4^m\) and is weighted by \(8^{-m}\).
The remainder tends to zero for each smooth tensor on the compactly
contained \(B_{5r/2}\). A second application of the difference quotient
bound gives \(W^{2,b}\) on \(B_{2r}\), with constants depending only on
the common ellipticity, coordinate first-jet, curvature and scalar
bounds, the fixed choice of \(r,b\), and the flat estimate.

The Lean packet proves the physical stationary source on its original
carrier in `bourStationary_roughTraceFreeRicci_eq`, and covariant
trace-free Ricci under constant scaling in `bourTraceFreeRicciField_scale`.
`bourChartTwo_principal_eq` gives the exact harmonic-coordinate equation
using the physical iterated Levi–Civita derivative. The pointwise
estimate above is `bourChartTwo_principal_bound`. Its model formulation
`bourModelHarmonicTwo_flatOperator_bound` uses the same Euclidean
principal operator as the metric estimate, and proves the inverse and
Christoffel derivative bounds from the supplied metric first jet.
`bourUniformHarmonicTraceFreeRicci_principal_bound` gives two constants
common to all E50 model realizations on the same coordinate ball,
conditional on common bounds for the upper-index curvature, tensor,
and rough forcing components. Its first-order term is a finite sum of
the actual directional derivatives, in the coordinates used by the
flat estimate. The separate `BourStationaryReaction` and
`BourStationaryPullback` interfaces address the physical source bounds
and the pullback on the region of metric equality. The interior argument
above describes the analytic estimate with the specified flat input.
