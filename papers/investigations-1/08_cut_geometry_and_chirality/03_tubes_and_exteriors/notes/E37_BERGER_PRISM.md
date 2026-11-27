# Berger metrics and the marked order-seventeen prism

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI
assistance. The packet requests GPT‑6.2 Sol with ultra reasoning. Actual
model and effort are unavailable. Input checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0, [frozen E37
request](../research-progress/handoffs/E37_REQUEST_R1.md), [marked prism
construction](MARKED_PRISM_17.md), [independent prism
replay](../reviews/E28_PRISM_REPLAY.md), and [E26 length
test](E26_LENGTH_TEST.md). The latter three working-tree SHA‑256
prefixes are 63ad69fc5d311001, b3dab900fb3f108d, and 8345b550f604762d.
All estimates below are analytical.

The marked displacement persists under Hopf collapse. The stationary
trace-free Ricci integral goes to zero linearly in the fibre scale. For
the explicit bent puncture and localized volume-preserving transport
constructed here, positive Yamabe sign for the doubled conformal class
forces $L>2^{-10}$, and the static collar alone then puts the exterior
Weyl energy above $8\pi^2/3$. The obstruction applies to the stated bend
profile, neck scale, and support and matching radii.

## Quotient, marking, and displacement

Write $i,j,k$ for the quaternion units, $\zeta=e^{2\pi i/17}$, and
$\Gamma=Q_8\times\langle\zeta\rangle$. The action on the unit quaternions
is $(q,\zeta^m)p=q p\zeta^{-m}$. The Riemannian metric $h_\epsilon$ is
left invariant with the imaginary basis orthogonal of lengths
$\epsilon,1,1$, where $0<\epsilon\le1$. Right multiplication by
$e^{i\theta}$ or by $j$ is isometric because its adjoint action preserves
the eigenspaces $\mathbb R i$ and $\operatorname{span}(j,k)$ and their
inner products. Thus $h_\epsilon$ descends to the smooth orientable
quotient $Y$ by the free action of $\Gamma$. The marked map
$J(p)=a_q p j^{-1}$, where $a_q=(1+i+j+k)/2$, is isometric and normalizes
$\Gamma$ with the same cycle and inversion as on the round metric. The
group and marking conventions are those in the [marked prism
construction](MARKED_PRISM_17.md).

The Hopf projection $p\mapsto p i p^{-1}$ to the two-sphere of radius
$1/2$ is a Riemannian submersion. Its differential doubles horizontal
lengths in the unit-sphere coordinates, which accounts for the base
radius. A marked lift has the form $p\mapsto A p B^{-1}$ with
$A=q a_q$ and $B=\zeta^m j$. The real part of $A$ is $\pm1/2$, and
$B i B^{-1}=-i$. On unit base coordinates $y$ this map has value
$-\operatorname{Ad}_A y$. If $c$ is the component of $y$ along the
rotation axis of $\operatorname{Ad}_A$, the cosine of the rotation
angle is $-1/2$ and
$y\cdot(-\operatorname{Ad}_A y)=1/2-3c^2/2$. Each projected
displacement is at least $\pi/6$, so every lift has displacement at
least $\pi/6$ in $h_\epsilon$. Each lift attains that bound somewhere.
Choose $p$ with $p^{-1}A p=\exp(B\alpha)$, where
$\alpha=\arccos(\operatorname{Re}A)$ is $\pi/3$ or $2\pi/3$. Then the
lift moves $p$ to $p\exp(B(\alpha-\pi/2))$ along a horizontal arc of
length $\pi/6$.

For the prescribed lift, choose $p_0$ satisfying
$p_0^{-1}(i+j+k)p_0/\sqrt3=j$. Set $d=\pi/6$ and
$p_\theta=p_0 e^{-j\theta}$ for $0\le\theta\le d$. The isometry
$T_\theta(p)=p_0e^{-j\theta}p_0^{-1}p$ moves $p_0$ along this arc and
supplies local isometric transport. Its endpoint correction
$T_d^{-1}J$ is $u\mapsto juj^{-1}$ in the chart $p=p_0u$. This isometry
fixes the center and preserves every sufficiently small normal ball.
The right factor in the round plane transvection rotates around $j$
through intermediate angles and generally does not preserve the
Berger vertical axis. The calculation below uses the pure left
translation and the actual Berger polar angular metric.

Extend the local translation by an isotopy $\Psi_t$ of $Y$ as
constructed below, starting at the identity and lifting to an
isotopy starting at the identity. At its endpoint it sends $p_0$ to
$Jp_0$. Thus $\Psi_1^{-1}\bar J$ preserves the base point, induces the
exact marked automorphism, and restricts to $\operatorname{Ad}_j$ in
the translated local chart. The normal pole in direction $j$ is
fixed, so it supplies the boundary point convention for the stable
letter in the [replay](../reviews/E28_PRISM_REPLAY.md). In that
convention the meridional and framed-band group and homology
calculations apply.

## Stationary curvature and embedded radii

In the left orthonormal frame $i/\epsilon,j,k$, the cyclic bracket
coefficients are $(2\epsilon,2/\epsilon,2/\epsilon)$. The Koszul
equation gives
$\rho_i=(n_i^2-(n_j-n_k)^2)/2$ for the Ricci eigenvalues. This is also
the curvature identity used in the [E07
replay](../reviews/E07_PROJECTIVE.md). Consequently the Ricci
eigenvalues are $2\epsilon^2,4-2\epsilon^2,4-2\epsilon^2$, the scalar is
$8-2\epsilon^2$, and the sectional curvatures in the frame planes are
$\epsilon^2,\epsilon^2,4-3\epsilon^2$. The curvature operator is
diagonal, so every sectional curvature lies in $[0,4]$. In
particular
\[
 \left|\operatorname{Ric}^{\circ}_{h_\epsilon}\right|^2
   =\frac{32}{3}(1-\epsilon^2)^2,\qquad
 \operatorname{Vol}(Y,h_\epsilon)=\frac{\pi^2\epsilon}{68},\qquad
 \int_Y|\operatorname{Ric}^{\circ}_{h_\epsilon}|^2\,dV
   =\frac{8\pi^2}{51}\epsilon(1-\epsilon^2)^2.
\]
With the E26 curvature norm convention, the whole stationary closed
fibre has longitudinal Weyl coefficient
$2\pi^2\epsilon(1-\epsilon^2)^2/51$.

The metric satisfies $\epsilon^2h_{\rm rd}\le h_\epsilon\le h_{\rm rd}$.
The smallest round displacement among all nonidentity deck elements
and all points is $\pi/34$. To see this, conjugate the left factor
into the plane of the right factor to minimize distance and compare
left angles $0,\pi/2,\pi$ with the principal angles of the order
seventeen circle. The gap $\pi/34$ occurs for the left angle $\pi/2$
and right angle $8\pi/17$. It is realized vertically at an aligned
point. It follows that the global least nonidentity Berger deck
displacement is $\epsilon\pi/34$. At every point the element
$(-1,\zeta^8)$ gives a vertical arc of length $\epsilon\pi/17$.

For completeness the left body velocity of the Berger geodesic
starting at $1$ with velocity $u+v i$, $u\perp i$, satisfies
$\dot v=0$ and $\dot u=-(1-\epsilon^2)v[i,u]$. Hence the geodesic is
\[
 g(t)=\exp\!\big(t(u+\epsilon^2 vi)\big)\,
      \exp\!\big(t(1-\epsilon^2)vi\big).
\]
If $u\ne0$, a return to $1$ requires
$t\sqrt{|u|^2+\epsilon^4v^2}\ge\pi$ since the first factor must lie
in the $i$-circle. The geodesic length is at least $\pi$. A vertical
loop has length at least $2\pi\epsilon$. The upper sectional bound
gives conjugate radius at least $\pi/2$ by comparison of the index
form with constant curvature $4$. The geodesic loop and conjugate
radius estimate therefore gives
$\operatorname{inj}(S^3,h_\epsilon)\ge\min(\pi/2,\pi\epsilon)$.
See Lemma 1.8 in [Abresch–Meyer, *Injectivity radius estimates and
sphere theorems*](https://library2.msri.org/books/Book30/files/abresch.pdf),
which gives the short loop alternative used here. Comparing with half
the deck displacements gives
\[
 \inf_{x\in Y}\operatorname{inj}_x(Y,h_\epsilon)
 =\frac{\epsilon\pi}{68},\qquad
 \operatorname{inj}_x(Y,h_\epsilon)\le\frac{\epsilon\pi}{34}.
\]
In particular, every normal ball of radius $R=\epsilon/32$ centered
along the marked path is embedded.

Let $\gamma(r)$ be the polar angular metric on the actual Berger
normal sphere at radius $r\le R$, and let $B(r)$ be its shape operator
with the outward normal. The minimizing index form on radial
Jacobi fields with fixed terminal value is bounded below by the
constant curvature $4$ minimum and above by testing the parallel
affine field with nonnegative curvature. Thus
$2\cot(2r)\le \kappa_\ell(B(r))\le 1/r$ and, in these charts,
$3/(4r)\le \kappa_\ell\le1/r$. Integrating the radial Jacobi length
equation gives angular length ratios to Euclidean polar coordinates
between $\sin(2r)/(2r)$ and $1$. In particular, in normal coordinates
$(3/4)^2\delta\le h_\epsilon\le\delta$ and the volume density lies
between $1/4$ and $1$. The area bounds are
$4\pi(3r/4)^2\le\operatorname{Area}(\gamma(r))\le4\pi r^2$.
By Gauss and the shape bounds,
\[
 \frac{9}{8r^2}\le \mathrm{Scal}_{\gamma(r)}\le 8+\frac{2}{r^2},
 \qquad H(r):=\operatorname{tr} B(r)\le\frac2r .
\]

## A fixed smooth positive-scalar bend

Set $b=R/4$ and $\rho=b^9/16^4$. Use a smooth nonincreasing cutoff
$\chi$ equal to one for $r\le b$ and zero near $2b$, with
$|\chi'|\le4/b$. On the outgoing bend solve
\[
 f(0)=\rho,\qquad f'(s)=\sqrt{y(f(s))},\qquad
 y(r)=1-(\rho/r)^{1/4}\chi(r)
\]
by integrating $ds=dr/\sqrt{y(r)}$ for $r>\rho$. Add the constant
piece $f(s)=\rho$ for $-2\rho\le s\le0$. The affine outgoing piece
with $f'=1$ matches the Berger polar metric at $r=2b$. Use
$ds^2+\gamma(f(s))$ in the puncture, via a radial reparametrization
that agrees with the outgoing polar coordinate near the match.

For this polar metric, direct Gauss calculation gives
\[
 \mathrm{Scal}_{ds^2+\gamma(f)}
  =f'^2\mathrm{Scal}_{h_\epsilon}
    +(1-f'^2)\mathrm{Scal}_{\gamma(f)}-2 f'' H(f).
\]
On the outgoing branch this is
$y\mathrm{Scal}_{h_\epsilon}
 +(\rho/r)^{1/4}\chi(\mathrm{Scal}_{\gamma(r)}-H/(4r))
 +(\rho/r)^{1/4}\chi'H$.
The middle term is at least
$(\rho/r)^{1/4}\chi\,5/(8r^2)$. On the cutoff transition $y\ge15/16$
and the negative term has magnitude at most
$8\rho^{1/4}/b^{9/4}=1/2$. This gives strict positivity on the
outgoing branch.

The function $f$ is $C^1$ at its constant join and is convex. Its
outgoing second derivative is at most $1/(8\rho)$ in a neighborhood
of the join. Smooth it by convolution with a symmetric nonnegative
small-support kernel, maintaining the unchanged constant and affine
interiors. Near the former join use
$\rho\le f\le9\rho/8$, $|f'|\le1/4$, and
$0\le f''\le1/(8\rho)$. The scalar lower bound there is
$1/(3\rho^2)$. Away from the join positivity persists by $C^2$
convergence. The smoothed function is convex with $0\le f'\le1$.
A support radius less than $\rho$ for the convolution leaves a
product collar of width at least $\rho$ at the puncture boundary.

The entire bend length is less than $7b$. In fact on
$[\rho,2\rho]$, $y'\ge1/(12\rho)$, giving length less than
$7\rho$. On $[2\rho,2b]$, $y\ge1-2^{-1/4}>1/8$ gives length less
than $6b$. The initial constant length is $2\rho$, and smoothing
leaves the final affine region unchanged. Throughout the bend
$\mathrm{Scal}\le8+2/f^2$ and the sphere area is at most $4\pi f^2$.
The bend scalar integral is thus at most $84\pi b$. Writing
$\widetilde h_\theta$ for this bent metric at center $p_\theta$, its
scalar integral over the punctured $Y$ is bounded by
\[
 \int \mathrm{Scal}_{\widetilde h_\theta}\,dV_{\widetilde h_\theta}
 \le 84\pi b+\frac{8\pi^2}{68}\epsilon<4\epsilon.
\]

## Marked transport and the length obstruction

Use a smooth parametrization $\theta(t)$, $0\le t\le1$, stationary
near the time endpoints, with $v(t)=\theta'(t)$ and
$\int_0^1 v(t)\,dt=d$. In each moving normal ball $B_R$ the
time-dependent left translation has local Killing generator
$v(t)Z_t$, with $Z_t$ unit and horizontal at the center. For the
Berger volume form $\nu$, choose a local primitive of the closed
two-form $\iota_{vZ_t}\nu$, multiply it by a smooth cutoff equal to
one on a neighborhood of $\overline{B_{R/2}}$, and take the exterior
derivative. Equating the resulting two-form with $\iota_{V_t}\nu$
gives a smooth volume-preserving extension supported in $B_R$.
The local primitive can be chosen by radial contraction in the
smooth moving chart. This repeats the differential form extension
in the [prism replay](../reviews/E28_PRISM_REPLAY.md) with the Berger
volume. On the inner moving ball its flow $\Psi_t$ agrees with the
translations $T_{\theta(t)}$.

Let $P$ be the fixed punctured manifold at time zero. Pull
$\widetilde h_{\theta(t)}$ back by $\Psi_t$ to get $h_t$ on $P$.
The path is stationary on the bent piece and has time-independent
volume density everywhere. Because the endpoint of the moving
bent metric is $\bar J_*\widetilde h_0$, the pullback path closes
up by the marked diffeomorphism (with inverse if the time direction
is reversed). The angular metric on the puncture collar is
preserved by its endpoint germ. Thus $g_L=L^2dt^2+h_t$ is a smooth
metric on the compact exterior $X$ with exact product boundary
collar, and it doubles smoothly by reflection. For
$K_t=\dot h_t/2$, one has $\operatorname{tr}_{h_t}K_t=0$. The scalar
identity in [E26](E26_LENGTH_TEST.md) then gives
$\mathrm{Scal}_{g_L}=\mathrm{Scal}_{h_t}-L^{-2}|K_t|^2$.
For each such extension the doubled metric is pointwise
positive-scalar for all sufficiently large $L$.

A lower bound on $L$ applies to every smooth volume-preserving
extension with the indicated support and inner germ. Since $V_t$
is Killing on the bent piece and the pullback derivative vanishes
there,
\[
 \int_P |K_t|^2\,dV_{h_t}
  =\int_Y|\operatorname{sym}\nabla V_t|^2\,dV_{h_\epsilon}.
\]
On the closed Berger quotient, integration by parts using
$\operatorname{div}V_t=0$ gives
\[
 2\int_Y|\operatorname{sym}\nabla V_t|^2
  =\int_Y|\nabla V_t|^2-\int_Y\operatorname{Ric}(V_t,V_t).
\]
In the moving $R$-ball, extend a supported test function by zero on
the Euclidean coordinate cube $[-R,R]^3$. Integration and
Cauchy–Schwarz along a coordinate interval give the Euclidean
Dirichlet bound $1/(4R^2)$ for the squared gradient to squared
function Rayleigh quotient. The metric and volume comparison,
applied to $|V_t|$ with the pointwise Kato inequality, give
$\int|\nabla V_t|^2\ge(16R^2)^{-1}\int|V_t|^2$. Since
$\operatorname{Ric}\le4h_\epsilon$ and $R\le1/32$, the last two
inequalities yield
\[
 \int_Y|\operatorname{sym}\nabla V_t|^2
 \ge\frac1{64R^2}\int_Y|V_t|^2 .
\]
On the inner ball $|Z_t|\ge1/2$. Indeed the round distance to the
center is at most $R/(2\epsilon)=1/64$, so conjugating the round unit
imaginary generator changes it by at most $1/32$ in the left
trivialization. Its horizontal component alone has length at least
$1/2$. The inner ball has volume at least $\pi R^3/24$ from the
normal density bound. Therefore
\[
 \int_P|K_t|^2\,dV_{h_t}\ge\frac{\pi v(t)^2 R}{6144},\qquad
 \int_0^1\!\int_P|K_t|^2\,dV_{h_t}\,dt>\frac{R}{8192},
\]
where the last strict bound uses $\int_0^1 v^2\,dt\ge d^2$ and
$\pi d^2>3/4$.

Positive Yamabe type for the conformal class of the reflected
double forces positivity of the constant-function conformal
Laplacian quadratic form. This form is
$2L\int_0^1\int_P\mathrm{Scal}_{h_t}
 -2L^{-1}\int_0^1\int_P|K_t|^2$ with the respective volume forms.
The scalar integral bound therefore forces
\[
 L^2>\frac{R}{32768\epsilon}=2^{-20}.
\]
On the stationary product collar of width $\rho$,
the Gaussian curvature of $\gamma(\rho)$ is at least
$1/(2\rho^2)$ and its area is at least $2\pi\rho^2$. The metric
$ds^2+\gamma(\rho)$ has squared trace-free Ricci norm
$2K_{\gamma(\rho)}^2/3$. In the E26 Weyl normalization the
stationary time cylinder has Weyl energy density
$|\operatorname{Ric}^{\circ}|^2/4$. Nonnegativity on the rest of
the exterior consequently gives
\[
 e_X(L)\ge\frac{\pi L}{12\rho}>
 \frac{L}{4\rho}>\frac{1}{4096\rho}
 =16b^{-9}>\frac{8\pi^2}{3}.
\]
This decides the simultaneous positive-double and small-energy test
for the bend and volume-preserving localized transport above, at
every $0<\epsilon\le1$. A different bent geometry, scale of support,
or choice of marked transport could have a different length test.
