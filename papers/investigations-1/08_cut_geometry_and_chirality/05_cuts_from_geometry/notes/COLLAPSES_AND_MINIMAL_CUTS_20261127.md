# What the scalar curvature of a cut detects

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex. Selected lead Astra/ultra with bounded Sol/ultra derivations and separate readings. Actual serving metadata unavailable. Sources frozen at bc2c1bb. All spectra use the nonnegative sign for −Δ and all metrics are Riemannian.

## A critical surface can be invisible to a scalar lower bound

At an isolated Morse point of index two there are negative-curvature points on nearby levels on **both** sides. In an eigenbasis of the metric Hessian Q, choose unit normal n in a positive-negative eigenplane so that ⟨Q⁻¹n,n⟩=0. The tangential eigenvalue in that plane vanishes, while the other two have opposite signs. Thus the restricted two-fold symmetric sum is strictly negative. Perturb the direction to either side of this null cone, keeping strict negativity. Along each corresponding ray in the manifold, the level value is strictly monotone for sufficiently small positive radius and samples every sufficiently close value on its side. The contracted Gauss equation then gives negative divergence on both sides. [Height calculation](../research-progress/handoffs/E05_SECTIONS.md)

A Morse–Bott critical surface has different local geometry. If F is the core, let A be the invertible normal Hessian, v a unit outgoing radial direction, n=Av/|Av|, and w either unit normal to n in the normal two-plane. With the mean curvature vector of F given by the full trace,
\[
 R_{\mathrm{leaf}}(\exp_p rv)=-\frac{2\langle Aw,w\rangle\langle\vec H_F,n\rangle}{r|Av|}+O(1).
\]
Both normal signs are accessible. A whole compact patch has a uniform lower bound on nearby regular leaves exactly when F is minimal on it. This holds for a smooth Morse–Bott defining function. The exact cylinders have scalars \(6/r^2,2/r^2,0\) for spherical factors S³, S², S¹, respectively. In the last case higher jets or actual tube geometry decide the finite sign. A tangent-cylinder limit alone supplies no smooth defining function. [Proof and equality cases](../research-progress/handoffs/E03_LEAVES.md)

In the round S⁴, thin distance tubes around an equatorial S² have scalar \(2\sec^2 r>0\). Around the minimal Clifford torus in an equatorial S³ the normal-angle dependence yields both pointwise signs. In fact the constant function in the induced conformal Rayleigh quotient gives
\[
 \lambda_1(-8\Delta+R_{\mathrm{tube}})\le -\frac{2}{2\cos^2r-\sin^2r}<0,\qquad 0<r<\pi/4 .
\]
Thus even pointwise positive ambient sectional curvature allows distance tubes of a minimal surface whose induced conformal class is negative. The Clifford tube computation describes actual distances; no MCF generating those tubes is claimed. [Independent integral check](../reviews/LEAF_GERM_BAND_REPLAY.md)

## What index one adds

For a closed two-sided minimal cut let r=Ric(ν,ν), b=|B|². In a smooth entering gauge, Zhou gives a multiplicity-one least-area first-width cut with index one, and tied least-area candidates have to be included. There are exact identities
\[
 L=-8\Delta+R_\Sigma=2J+6(-\Delta)+R+b=8J+R+6r+7b .
\]
On the complement of the unstable Jacobi mode these are coercive. An exact scalar Schur complement tests the remaining direction; the equality and negative cases are realized by smooth local entering collars. The Berger S³ example has ambient Ric=(1/16)g along the slice, Jacobi potential 5/16 strictly below its positive Laplace spectral gap, induced scalar −1/8, and a local strict area maximum. Closing the two sides and comparing against unrestricted sweepouts is an indispensable global step. [Normal jets and Schur complement](../research-progress/handoffs/E06_GERM.md) · [Zhou source and eigenvalue comparison](../research-progress/handoffs/E04_MINMAX.md) · [Global area test](GLOBAL_AREA_TEST_20261127.md)

## Stable prescribed-curvature cuts and marked bands

Inside any sufficiently small geodesic annulus, use distance s from the chosen center and its leaf mean curvature H. For a prescribed function \(h=H-\kappa(s-s_0)\), \(\kappa>0\), the central sphere strictly minimizes the prescribed functional relative to its annular marking and its full second variation is \(\int(|\nabla u|^2+\kappa u^2)\). Its own induced scalar is positive for sufficiently small radius. It has degree zero over an independent marked level when the entire ball is contained in that band. For the sharp marked-width test the physical quantity \((\min R)d^2\) must reach \(3\pi^2\); an independently specified thin round band can miss it. The same stabilizing prescription works on an orbit cut of the round join, where the subsequent ordinary mean curvature flow can end at a two-sphere. It establishes scoped existence and refutes the proposed general inference from prescribed stability to exclusion of a collapse. [Band proof and examples](../research-progress/handoffs/E07_BANDS.md) · [Räde, Corollary 2.25 and Lemmas 4.2–4.4](https://arxiv.org/pdf/2104.10120v4)
