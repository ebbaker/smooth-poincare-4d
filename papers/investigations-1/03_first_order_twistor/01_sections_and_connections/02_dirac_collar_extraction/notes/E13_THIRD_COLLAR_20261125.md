# Nonradial paired conformal current · SP4-FOT-EXTRACT-E13

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Request revision 1 assigns gpt-6.2-sol/ultra.
Actual serving model and reasoning effort are unavailable. Inputs are
EXTRACT-E07 and NECK-E18 at `7db310a2a9219c537b440d7c2fb39e602a32b729`.
The estimate is conditional on marked face data. The examples test two
specified conformal model classes. [Frozen request](../research-progress/handoffs/E13_THIRD_REQUEST_20261125.md)
· [EXTRACT-E07](E07_CONFORMAL_BOUNDARY_CURRENT_20261125.md)
· [NECK-E18](../../01_neck_geometry/notes/E18_POSITIVE_SCHOUTEN_BOUNDARY_FLUX_20261125.md)

## Exact current and its signed estimate

Let \(U\) be a smooth compact residual of a fixed oriented Riemannian
homotopy four-sphere. For \(h=e^{2u}g\), measure the smooth factor \(u\)
relative to the physical metric \(g\). Take two supplied embedded spherical
faces \(\Sigma_-,\Sigma_+\) with forward coorientation, so the outward
normals are backward at \(\Sigma_-\) and forward at \(\Sigma_+\). The
boundary orientations use the outward normal first. All computations are
on these faces and require no product structure through the residual.
Any additional boundary components contribute their own outward currents.

On each face choose its physical scale \(\rho>0\) and use the constant
rescaling \(\bar g=\rho^{-2}g\). Let \(\bar\gamma\) denote its induced face
metric, \(d\mu=dS_{\bar\gamma}\), \(D=\nabla_{\bar\gamma}\), and

\[
 f=u|_\Sigma,\qquad p=\rho\,u_{\nu_g},\qquad x=1+p,\qquad
 V=\int_\Sigma d\mu,\qquad m=V^{-1}\int_\Sigma x\,d\mu,\qquad \xi=x-m,
 \qquad P(x)=x^3-3x+2.
\]

Use the forward unit normal in both gauges. For an exact Euclidean sphere
of radius \(\rho\), \(\bar\gamma\) is the unit round metric, and
\(x=1+\partial_t u=\partial_t(t+u)\) for \(t=\log r\). In the formulas
below \(\bar{II},\bar H,\bar N_0\) are the forward second fundamental form,
its trace, and \(R_{\bar g}\bar g/4-\operatorname{Ric}_{\bar g}/2\).
Substitute \(a=p\) in EXTRACT-E07 (6). The terms with \(a^2,a^3\) give
\(p^2(3+p)=P(x)\) at \(\bar H=3\). The \(II(Df,Df)\) and \(a|Df|^2\)
terms combine at \(\bar{II}=\bar\gamma\). Since \(\int\Delta f=0\), the
result in the *induced* normalized metric is

\[
\begin{split}
 F_\Sigma&=-\frac12\int_\Sigma
     \bigl(P(x)+x|Df|^2+2x\Delta f\bigr)d\mu+R_\Sigma,\\
 R_\Sigma&=\int_\Sigma\left\{
    \bar N_0(\bar\nu,p\bar\nu+Df)
    -\frac12(\bar{II}-\bar\gamma)(Df,Df)
    -\frac12(\bar H-3)p^2\right\}d\mu .
\end{split}                                                     \tag{1}
\]

Here \(F_\Sigma\) is the forward EXTRACT-E07 current. Constant rescaling
leaves it invariant, including when the scales differ at the two ends.
If \(A=\|\,|p|+|Df|\,\|_{L^3(d\mu)}\), then

\[
 |R_\Sigma|\le C\left(\|\bar N_0(\bar\nu,\cdot)\|_{3/2} A
                  +\|\bar{II}-\bar\gamma\|_3 A^2\right).
                                                               \tag{2}
\]

For a marked unit sphere in a fixed buffered Euclidean annulus with
\(\|\bar g-\delta\|_{C^2}\le\varepsilon\), the two coefficients are
\(O(\varepsilon)\) and \(V=2\pi^2+O(\varepsilon)\). On flat round faces
\(R_\Sigma=0\). Estimate (2) also works with the displayed face norms
measured directly. It requires small products if \(A\) is growing.

With the averages in the actual induced measure, (1) becomes

\[
\begin{split}
 F_\Sigma&=-\tfrac12\bigl(VP(m)+\mathcal A_\Sigma\bigr)+R_\Sigma,\\
 \mathcal A_\Sigma&=\int_\Sigma
   \bigl(3m\xi^2+\xi^3+(m+\xi)|Df|^2+2\xi\Delta f\bigr)d\mu .
\end{split}                                                     \tag{3}
\]

The angular corrections about radial data begin at quadratic order.
Hölder bounds the absolute angular correction by

\[
 B_\Sigma=3|m|\|\xi\|_2^2+\|\xi\|_3^3+|m|\|Df\|_2^2
       +\|\xi\|_3\|Df\|_3^2+2\|\xi\|_3\|\Delta f\|_{3/2}.
                                                               \tag{4}
\]

The final product may be replaced by \(2\|D\xi\|_{3/2}\|Df\|_3\)
through integration by parts. The outward pair has
\(J=F_+-F_-\). Thus \(J_-=\max\{-J,0\}\) satisfies

\[
 J_-\le \tfrac12[ V_+P(m_+)-V_-P(m_-) ]_+
     +\tfrac12[\mathcal A_+-\mathcal A_-]_+
     +|R_+|+|R_-| .                                             \tag{5}
\]

The second term on the right is at most \((B_++B_-)/2\).
If the faces are flat and radial, \(VP(m)=2\pi^2 P(m)\) is exactly the
NECK-E18 \(\mathcal C(m)\). A constant plateau slope cancels. A radial
round dilation has \(m=-\tanh(t-t_0)\), and \(P\) is decreasing on
\([-1,1]\). Its slope drop gives a **negative** \(J\). If \(m_\pm\)
are bounded, the areas tend to \(2\pi^2\), and
\(|m_+-m_-|\to0\), then the radial term in (5) tends to zero.

On exact flat face windows the angular contributions in (4) can also be
selected by averaging if the markings permit moving the cuts. On each
window of log-width bounded below, bounded mean slopes and vanishing
integrals of \(|\xi|^3+|Df|^3+|\Delta f|^{3/2}\) in \(dt\,d\mu_\gamma\)
give a slice with \(B_\Sigma=o(1)\) by Hölder and averaging per unit
length. The radial bound and end comparison must hold at the reselected
physical cuts. For \(\operatorname{Ric}_h>0\) on an exact flat shell,
write \(w=t+u\) in the cylindrical expression for \(h\). The conformal
Ricci formula gives \(\operatorname{Ric}_h(\partial_t,\partial_t)
=-3 w_{tt}-\Delta_\gamma w-2|D_\gamma w|^2\). Hence

\[
 -3m'(t)>2\fint_{S^3}|D_\gamma w|^2\,d\mu_\gamma .              \tag{6}
\]

Small mean drop then controls this sliced angular \(L^2\) integral.
The cubic and mixed-derivative terms in (3) require further bounds.
The Ricci positivity used here holds in the four-dimensional
\(\Gamma_2^+\) chamber by the algebra in [NECK-E14](../../01_neck_geometry/notes/E14_POSITIVE_RICCI_GAUGE_20261125.md).

## Nonradial tests

**A flat plateau with fixed-width faces.** For \(g=dr^2+r^2\gamma\)
put \(w=t+u=\epsilon\eta(t)\phi(\theta)\), where \(\phi\) is a coordinate
function on the unit \(S^3\), \(\eta=0\) near \(t_-\), and
\(\eta(t_+)=1,\ \eta'(t_+)=-1\). Both mean slopes are exactly zero. At the
outer face \(\xi=-\epsilon\phi\), \(Df=\epsilon D\phi\), and the cubic
integrals in (3) vanish by reflection. Since \(\Delta\phi=-3\phi\),
\(J=-3\epsilon^2\int_{S^3}\phi^2\,d\mu_\gamma\). Reversing \(\eta'(t_+)\)
reverses the sign. This is a local smooth conformal example that tests
the quadratic angular term of the plateau expansion without a positivity
hypothesis on \(h\).

**A shifted round dilation in the positive chamber.** On the standard
oriented \(S^4\), let \(g\) be unit-volume round. In stereographic
coordinates \(z\in\mathbb R^4\), define
\(h_b=(z\mapsto b^2z-be_1)^*g\), \(b\to\infty\). For fixed
\(a>0\) and \(b>a\), take the actual physical annulus

\[
 U_b=\{(b-a)/b^2\le |z|\le (b+a)/b^2\}.
\]

These concentric spheres have areal scales \(\rho=r\Omega_g(r)\), where
\(g=\Omega_g(r)^2\delta\). The normalized faces are unit round, the
physical-normal slope is \(p=r\,\partial_r u_b\), and the scaled ambient
metric differs from the Euclidean one by \(O(r^2)\) in buffered \(C^2\).
With \(R=b^2r\) and \(s=\theta\cdot e_1\), that slope gives

\[
 x=\frac{1+b^2-R^2}{1+b^2+R^2-2Rb s}+\frac{2r^2}{1+r^2} .        \tag{7}
\]

At \(R=b\pm a\), the first numerator is \(O_a(b)\) and the denominator
is \(1+a^2+2Rb(1-s)\). The round polar measure has a \(\sin^2\vartheta\)
factor for \(s=\cos\vartheta\). Integrating against that measure gives
\(|m_\pm|=O_a(b^{-1})\) and \(\|\xi_\pm\|_2^2=O_a(b^{-1})\), using
\(1-\cos\vartheta\gtrsim\vartheta^2\) for \(0\le\vartheta\le\pi\).
The absolute cubic integral of the slope fluctuation stays bounded
below, as \(|x|\) is of order \(b\) on a cap of angular radius of order
\(b^{-1}\) at each face.

The affine maps are orientation-preserving conformal diffeomorphisms
of \(S^4\). Both metrics have the same positive constant Schouten
density, and \(\operatorname{Vol}_g(U_b)\to0\). In the image coordinates
\(y=b^2z-be_1\), the annuli have indicator functions converging away from
two hyperplanes to that of \(\{|y_1|\le a\}\), since
\(|y+be_1|-b\to y_1\). Dominated convergence for the finite round measure
and EXTRACT-E07 (2) give

\[
 \lim_{b\to\infty}J_b
   =-\int_{\{|y_1|\le a\}}\sigma_2(A_g)\,dV_g\in(-4\pi^2,0).
                                                               \tag{8}
\]

The complementary round Schouten mass is also positive. This gives a
nonzero limiting modular error in the \(8\pi^2\) chiral normalization.
The mean slopes and their \(L^2\) fluctuations vanish at the actual
round-scaled faces, while the negative paired current persists. The
example has \(E_\pm=0\) and shrinking log-width
\(\log((b+a)/(b-a))\to0\). It tests these face data in the round class.

## Implication for the marked residual

On the physical unit-volume Yamabe sequence in the fixed positive band
\(4\pi^2\le E_+=E_-\le 8\pi^2-\delta\), assume the physical end and
volume hypotheses of EXTRACT-E06 yield \(I_\pm(U,g)\to0\). For a
positive Schouten representative of the same class, (5) and
\(I_\pm(U,h)=I_\pm(U,g)-2J\) give
\(0\le E_\pm(U)\le |I_\pm(U,g)|+2J_-\). Thus vanishing of the right side
of (5) suffices. The real Chern–Simons change in conformally transported
half-spin frames is \(-2s_\pm J\), with \(s_+=-1,s_-=1\).
The \(S^3\) faces in the models have the induced spin structure. The
marked source requires the actual embeddings and frames of the physical
accounting. Fix the truncations and faces first, take the source index
limsup, then exhaust the ends. The B05 dependency is an estimate for the
signed radial and angular difference on these faces in the positive band,
or a way to select other admissible faces where it vanishes. The round
examples leave that implication open.
[Physical accounting and exhaustion](E06_PHYSICAL_END_FRAMES_20261125.md)
· [Joint premises](../../../reviews/SECOND_COLLAR_ASSESSMENT_20261125.md)
