# SP4-CUT-SEAM-E13 · Two-scale variational trial on the short-axis disk

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI Codex assistance. Bounded GPT-6.2 Sol/ultra requested. Actual serving model and effort unavailable. Working HEAD bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. [Frozen E13 r1](../research-progress/handoffs/E13_REQUEST_R1.md), SHA-256 175bc83d65814af4. The checked input versions are [B04](B04_PAIRED_FILLING.md) 90dddbd55bcc, [E08C](../reviews/E08C_REALIZATION.md) 243574e5c143, [E11A](../reviews/E11A_INTEGRATION.md) 440b47fd2ec5, [closing](../continuation-notes/CLOSING_20261127.md) 926db2d6c534, [TUBE return](../../03_tubes_and_exteriors/research-progress/handoffs/TO_SEAM_SHORT_AXIS_RESULT_20261127.md) 1f0b0b3d5aff, and [E19](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md) 5333dc4d1816. This packet checks the smooth data symbolically and reports floating energy and spectral diagnostics. The replayable coefficients are in [seam_relaxation.py](../numerics/seam_relaxation.py).

**Outcome.** Twelve bounded optimizations gave a best smaller energy \(E_+/\pi^2\approx3.957406627\), down from the prior direct trial's \(5.0412\)–\(5.0586\) enclosure. All tested profiles exceeded the strict target \(3/2\) in floating quadrature. The best estimate for the other sign is \(E_-/\pi^2\approx8.957406627\), above the whole ambient wall \(8\). The tests give a lower-cost candidate for certification and a scoped unsuccessful search for the entering threshold. An interval or analytic enclosure remains required to certify the candidate's energy and Robin sign.

## Exact metric family

Fix the total space and outward-first quaternion marking of E19, with the \(i\) circle collapsing. Use the metric
\[
 g=ds^2+a^2\sigma_i^2+e^{-2u}\sigma_j^2+e^{2u}\sigma_k^2,
 \qquad 0\le s\le L,\qquad d\sigma_i=2\sigma_j\wedge\sigma_k
\]
in cyclic order. This is the horizontal-area-one gauge in the smooth oriented positive-definite category. Put \(A=3^{-1/4}\), \(B=\log(3)/4\), \(x=s/L\), \(q=x^2\), \(a=4Lx\exp w(q)\), \(u=xr(q)\). The two adjustable profiles use localised Gaussian functions of the graded coordinate
\[
 \xi(q)=\frac{\log(1+q/\delta)}{\log(1+1/\delta)},\qquad \delta=1/250,
 \qquad G_j(q)=\exp\!\left(-\frac{(\xi(q)-j/(n-1))^2}{(1.25/(n-1))^2}\right),
 \quad 0\le j<n .
\]
These smooth basis functions distinguish a short inner scale and graded outer transition. They provide local freedom on long profiles. Add \(\frac{q}{q+\delta}(1-q)^2\sum_j c_jG_j\) to the axial seed \(w\), and \((1-q)^2\sum_j d_jG_j\) to the transverse seed \(r\).

Write \(C=(4L/A)^2\), \(\alpha=\log(A/(4L))+\frac12\log(1+C)\) and \(\beta=-1/(2(1+C))\). The axial seed is
\[
 -\tfrac12\log(1+Cq)+\alpha q(2-q)+\beta q(q-1).
\]
Its leading ramp before the endpoint correction is \(a=4s/\sqrt{1+(4s/A)^2}\), with inner physical scale \(A/4\) independent of the chosen length window. For a chosen transverse scale \(\eta>0\), start from \(r_0=B(q+\eta)^{-1/2}\) and add the affine correction \(B-r_0(1)+(-B/2-r_0'(1))(q-1)\). Both values and first derivatives at the boundary hold identically:
\[
 w(0)=0,\qquad w(1)=\log(A/(4L)),\qquad w_q(1)=-1/2,\qquad
 r(1)=B,\qquad r_q(1)=-B/2 .
\]
Consequently \(a(L)=A,\ u(L)=B,\ a_s(L)=u_s(L)=0\). The induced end lengths are precisely \((A,A,\sqrt3 A)\). The indicated short-axis switch of the two halves is an isometry of this end and preserves the zero second fundamental forms.

The smooth functions of \(q\) extend through \(q=0\), so \(a,u\) are smooth odd functions of \(s\), \(a=4s+O(s^3)\), and \(u(0)=0\). The \(\cosh(2u)\) horizontal trace is even. The \(\sinh(2u)\) traceless coefficient is odd and \(\sinh(2u)/s\) is smooth and even. The slice plane and the horizontal traceless-tensor plane have the same weight four for \(\exp(\alpha i)\) and the same reflection action, so multiplying the latter even factor by the normal Cartesian coordinates makes the anisotropy smooth at the bolt. The polar normal length \(a/4\) has unit leading slope in that slice angle. The resulting smoothness and parity are those of the actual marked disk bundle in E19. The exponential guarantees \(a>0\) for \(s>0\). Both other lengths are positive. [E19 end data, regularity and curvature](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md) · [marked pair and switch](../../03_tubes_and_exteriors/notes/E18_QUATERNIONIC_PAIR.md)

## Signed objective and finite search

The orbit weight is \(\pi^2 a\,ds/4\). In E19's Cartan formulas the signed eigenvalues have axial component \(V_\pm=\lambda_1^\pm\) and transverse difference \(W_\pm=\lambda_2^\pm-\lambda_3^\pm\). The search residuals are the signed quantities \(\sqrt{3a\,ds/8}\,V_+\) and \(\sqrt{a\,ds/8}\,W_+\) on each quadrature node, with the cell quadrature weight inside \(ds\). Their squared Euclidean norm is \(E_+/\pi^2\). The E19 formulas with removable bolt quotients are evaluated using \(p=4L e^w\), \(p_q=p w_q\), \(p_{qq}=p(w_{qq}+w_q^2)\), and \((p-4L)/q=4L\operatorname{expm1}(w)/q\). The replay independently evaluates the direct radial and tangential curvature components and cross entries before forming both signed blocks. The direct and regularised fields agreed on 1,567 replay nodes away from \(x=0\), with tolerances in the script. The sampled \(E_+-E_-=-5\pi^2\) shift held to \(2\times10^{-14}\pi^2\) in all twelve optimizations, consistent with the fixed orientation and boundary ledger.

One damped Gauss–Newton run was used per pair of resolution and initial profile. Length was parameterised by a sigmoid inside a fixed window, with four starts \((L_{\min},L_{\max},L_{\rm init},\eta)\):
\[
 (0.28,0.67,0.55,1),\quad (0.58,1.05,0.82,0.02),\quad
 (0.95,1.75,1.40,0.15),\quad(1.65,2.80,2.25,0.005).
\]
All free local coefficients start at zero. Optimizations use \(n=8,14,22\) basis functions for each field and at most 120 iterations per run. Composite Gauss rules used \(3n\) graded cells and 8 nodes per cell for the search, 16 per cell for the reported energy, and 24 per cell for the saved-profile replay. The search optimizes the chiral energy alone. This admits profiles whose scalar curvature changes sign and whose Robin form may still be positive. Boundary values, first jets and bolt smoothness hold throughout the search.

| Basis functions per field | Start | \(L\) | \(v=\int a\,ds\) | \(E_+/\pi^2\) | Sampled \(\min R\) |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 8 | 1 | 0.38989046 | 0.2093435 | 5.060252811 | 10.47566 |
| 8 | 2 | 1.04999995 | 0.8559352 | 4.344402452 | -9.64883 |
| 8 | 3 | 1.55427038 | 1.4568695 | 4.082570745 | -5.66604 |
| 8 | 4 | 2.11045044 | 2.1853667 | 4.311586983 | -2.72264 |
| 14 | 1 | 0.39083697 | 0.2101410 | 5.055089190 | 7.98230 |
| 14 | 2 | 1.04999995 | 0.8578010 | 4.338219476 | -11.80045 |
| 14 | 3 | 1.71049154 | 1.6724426 | 3.994028806 | -7.97279 |
| 14 | 4 | 1.65000013 | 1.4792505 | 4.954806611 | -6.30918 |
| 22 | 1 | 0.39114328 | 0.2103990 | 5.053353676 | 6.08191 |
| 22 | 2 | 1.04995570 | 0.8890484 | 4.491001919 | -15.18837 |
| 22 | 3 | 1.74999991 | 1.7240085 | 3.957406627 | -9.86144 |
| 22 | 4 | 2.70241280 | 3.2399777 | 4.031273988 | -7.52846 |

The stored 22-function start-3 profile has \(a(0.35)\approx1.0453,\ a(0.70)\approx1.2571,\ a(1.40)\approx0.9520\), and \(u(0.70)\approx0.2306,\ u(1.40)\approx0.2166\). It uses a broad region with larger axial length and then decreases to the marked face. It lies near the upper length restriction of its window. Start 2 at resolution 22 stopped at the damping limit. Start 4 at resolution 22 exhausted its iteration limit. The results report attained trial values. An estimate of the finite-dimensional infima or the unrestricted filling problem requires further work. The 14-function row is the lowest resolution with a trial estimate below \(4\) in the smaller sign. Its coefficients were not emitted in the bounded run. The best 22-function row's full finite coefficients are preserved as REPLAY_PROFILE.

## Robin diagnostics and an explicit positivity test for a certificate

The face has second fundamental form \(B_g=0\), so it gives the Neumann form. With \(L_g=-6\Delta_g+R\), the invariant radial form is the weighted one-dimensional form with weight \(a\,ds\), no boundary term, and smooth even regularity at the bolt. The first Rayleigh quotient of the full form is the same as the radial one. For example, replace an arbitrary test function on each orbit by its root mean square in the fixed normalized Haar measure. Its weighted \(L^2\) norm and scalar term agree, its radial gradient norm decreases by Cauchy–Schwarz, and its angular gradient contribution vanishes. The root mean square lies in the radial form domain by approximation.

On the saved profile the 20-, 40- and 60-mode cosine Ritz estimates are \(7.6972799844,\ 7.6972797118,\ 7.6972795319\), respectively. With exact integrals these finite-dimensional minima would be upper bounds. The positive Ritz values give a diagnostic and leave positivity to a lower bound. The 24-node-per-cell samples give a minimum scalar curvature of approximately \(-9.86600577\).

For an enclosure, use the fixed smooth radial function \(\phi=1+x^6-3x^8/4\). It is positive on the interval, even at the bolt and satisfies \(\phi'(1)=0\) in \(x\). Its test quotient is
\[
 \frac{L_g\phi}{\phi}
 =R-\frac{6}{L^2\phi}\left(\phi''+\bigl(x^{-1}+2xw_q\bigr)\phi'\right),
 \qquad
 x^{-1}\phi'=6x^4(1-x^2) .
\]
The replay on 1,584 nodes gives sampled minimum \(2.7115038205\) near \(x=0.62171\). If a rigorous enclosure makes this quotient positive everywhere, the ground-state transform
\[
 \mathcal Q_g(f)=
 6\int\phi^2\left|\nabla(f/\phi)\right|^2\,dV_g
 +\int (L_g\phi/\phi) f^2\,dV_g
\]
gives strictly positive whole-side form. The boundary term in this integration vanishes by the specified Neumann jet. This test applies also to non-invariant \(f\). It uses the quotient rather than an eigenfunction estimate.

## Reproduction and disposition

Run from the repository root

    OPENBLAS_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 python3 papers/investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/numerics/seam_relaxation.py --replay

The replay evaluates the recorded profile with no further optimizations. Omitting the flag reproduces the bounded twelve-run search. Python 3.10.0 and NumPy 1.25.1 were used. The script checks signed block normalization against direct Cartan curvature on non-bolt quadrature nodes, the endpoint jets and both energy estimates. The exact mathematical parameterization verifies smoothness and the marking. Energy, its signed difference, and the positivity test for the saved numerical profile remain floating diagnostics in this packet. For B06 a fixed-profile interval check can use the saved 22-function coefficients and the rational supersolution above. The fixed \(3\pi^2/2\) strict target remains open.
