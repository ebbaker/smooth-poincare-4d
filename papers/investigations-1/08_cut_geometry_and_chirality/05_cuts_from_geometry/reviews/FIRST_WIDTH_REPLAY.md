# GEO-E11 — Independent first-width replay

27 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex.
Requested GPT-6.2 Sol/ultra for this independent reading. Actual serving
model and reasoning effort are unavailable. The inputs are the
[replay request](../research-progress/handoffs/ISSUE_REPLAYS_20261127.md),
[GEO-E04](../research-progress/handoffs/E04_MINMAX.md),
[GEO-E06](../research-progress/handoffs/E06_GERM.md), the
[failed-route assessment](LOCAL_VERSUS_WIDTH_20261127.md), and the
[proposed reduction](../brainstorm/notes/FIRST_WIDTH_IMPASSE_20261127.md).
The [parent TeX](../../manuscript/cuts_of_subcritical_conformal_classes.tex)
is at `bc2c1bb`, SHA-256
`ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`.
The ambient metric is smooth Riemannian and satisfies the parent
entering inequalities on a closed connected oriented homotopy
four-sphere. Local collars and specified symmetry classes below have
their own scope.

The width characterization, the index bound for every least-area
candidate, and the Schur-complement reduction replay successfully.
The sign comment in E04 requires correction. A meridional \(S^3\) gives
a global area competitor in a diagonal \(\mathrm{SU}(2)\) two-pole
filling. The resulting integral inequality does not decide whether
the triaxial Berger germ has a closed entering extension or realizes
its width in one.

## Zhou source and quantifiers

I checked Theorem 1.1 and (1.1) in Xin Zhou, *Min-max minimal
hypersurface in \((M^{n+1},g)\) with \(\mathrm{Ric}_g>0\) and
\(2\le n\le6\)*, JDG **100** (2015), 129–160. The consulted copy was
[arXiv:1210.2112v2](https://arxiv.org/pdf/1210.2112v2). I read
all of §7, the Jacobi definition and separation and Frankel statements
in §3, the orientable sweepout and chamber argument in Proposition 3.6,
the statements of Theorems 2.7, 4.5 and 4.7 and the operative parts of
§5 (Proposition 5.1, Corollaries 5.4 and 5.9, Theorems 5.5 and 5.8),
and the statement and concluding parity argument of Proposition 6.1.
The Almgren–Pitts existence, local replacement and discretization
machinery are imported from the checked source. I did not inspect the
publisher PDF or reprove these theorems. For the later one-sided
stability statement I checked Theorem 1.1(ii), §2.4 and Claim 5 of §6
in the [arXiv v2 copy of the 2017 paper](https://arxiv.org/pdf/1504.00966).
The induced scalar-curvature transformation agrees with
[Lee–Parker §2, (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf).

For \(n=3\), the entering inequalities imply \(\operatorname{Ric}>0\).
Indeed \(\max_{\nu}|Z(\nu,\nu)|\le\sqrt3\,|Z|/2\) by the trace-free
condition and Cauchy–Schwarz. Each connected closed embedded
hypersurface separates, since a nonseparating one would admit a loop
meeting it transversely once, contrary to \(H_1(M;\mathbb Z_2)=0\).
It is two-sided and oriented as the boundary of either component.
Thus every competitor in Zhou's (1.1) has weight one. Frankel implies
that a smooth embedded support of the fundamental-class Almgren–Pitts
width has one component. By §7, its area with multiplicity equals
the least competitor area and its multiplicity is one.

There is a slight distinction between the existence in Theorem 1.1
and the universal assertion needed here. Let \(\Sigma\) be **any**
closed connected embedded minimal hypersurface of area \(W_1\) for
this fixed metric. Proposition 3.6 applies to \(\Sigma\) itself.
Its smooth collar in the positive ground-state direction has
strictly lower area off \(\Sigma\) and its boundary is mean convex
toward each chamber. An interior min–max cut in a chamber would be
disjoint from \(\Sigma\), contradicting Frankel. The chamber widths
thus lie at their boundary areas, strictly below the central area,
and the extended sweepout has its strict central maximum at
\(\Sigma\). The boundary-cycle discretization represents the same
integral fundamental class for every such sweepout.

In the convention \(J=-\Delta-(\operatorname{Ric}(\nu,\nu)+|B|^2)\),
the constant test excludes index zero. If \(\Sigma\) had two negative
directions, take a second negative eigenfunction orthogonal to the
positive ground state and extend its normal field by an ambient
isotopy. The two-parameter Hessian of area at the central leaf is
negative definite, with zero mixed term because the eigenfunctions
are orthogonal. For a small fixed nonzero isotopy the near-center
area lies below \(W_1\). The original compact parameter set away
from the center has a uniform area gap that persists by the uniform
Jacobian bound of the small isotopy. This contradicts the definition
of \(W_1\) after discretization. Every least-area embedded minimal
hypersurface therefore has index one, including all tied candidates.
No assumption on Jacobi nullity or uniqueness enters.

E04 calls the negative eigenvalues in the 2015 §7 proof a sign slip.
The arXiv v2 copy explicitly defines the eigenvalue parameter of its
operator \(L_\Sigma=\Delta+\operatorname{Ric}(\nu,\nu)+|B|^2\) by
\(L_\Sigma u=-\lambda u\), §3, p. 8. The negative \(\lambda\) in §7 is
consistent with that convention and is a negative eigenvalue of \(J\)
in the notation here. The neighboring assertion that stability
corresponds to \(\operatorname{ind}\ge0\) is a typographical error
given the accompanying quadratic-form condition. The 2015 theorem
states multiplicity two for a nonorientable cut. The 2017 theorem
adds one-sided stability, tested on sections of the normal bundle,
which lift to odd functions on the orientable double cover. The
parent need only use the orientable branch in its setting.

## The scalar test and failed routes

Set \(r_\nu=\operatorname{Ric}(\nu,\nu)\), \(b=|B|^2\), and
\(L=-8\Delta+R_\Sigma\) on the induced conformal class. Gauss gives
\(R_\Sigma=R-2r_\nu-b\) at a minimal cut. Thus
\(L=2J+6(-\Delta)+R+b=8J+(R+6r_\nu+7b)\) in quadratic form.
If \(\phi\) is a normalized positive Jacobi ground state, \(J\) is
nonnegative on \(\phi^\perp\). Therefore
\(\lambda_2(L)\ge\min(R+6r_\nu+7b)>0\) in the entering gauge.
The compression \(C\) of \(L\) to \(\phi^\perp\) is strictly
positive. Its form on \(H^1\cap\phi^\perp\) is coercive in \(H^1\)
by the elliptic gradient term and the lower bound in \(L^2\).
Set \(w=P_{\phi^\perp}L\phi\), \(z=C^{-1}w\) by the form equation,
and \(S=\langle\phi,L\phi\rangle-\langle w,z\rangle\). Then
\[
Q_L(x\phi+v)=Q_C(v+xz)+x^2 S,\qquad v\in H^1\cap\phi^\perp .
\]
The sign of \(S\) gives the sign of the lowest eigenvalue of \(L\),
with a one-dimensional kernel at equality. In dimension three
\(R_{u^4h}=u^{-5}L_hu\). For \(\lambda_1(L_h)>0\) the positive principal
eigenfunction supplies a positive representative. Conversely, if
\(L_hu>0\) with \(u>0\), pairing against the positive principal
eigenfunction shows \(\lambda_1(L_h)>0\). This is a statement about
the induced conformal class. A negative sign on a Berger \(S^3\)
is compatible with the existence of positive scalar curvature in a
different class on that three-manifold.

The quantitative reduction can be stated in either of two equivalent
forms in the fixed ambient metric.

1. Every connected closed embedded minimal cut of area \(W_1\) satisfies \(S>0\).
2. Every connected closed embedded **index-one** minimal hypersurface
   with \(S\le0\) has a connected closed embedded minimal competitor of
   strictly smaller area.

In (2) the candidate need not have area \(W_1\). If (1) holds, an
\(S\le0\) candidate has area \(>W_1\), giving the competitor by
existence and the least-area equality. If (2) holds, every area
\(W_1\) candidate has index one by the universal argument and cannot
satisfy \(S\le0\). A tied nonpositive candidate refutes these
universal formulations even if a tied positive candidate exists.
Existence of a favorable width realizer is a weaker question. A
preferred selection rule would need its own statement and evidence.

The five tried routes have the following precise effects.

- Orthogonal balancing removes the uncontrolled direction only on
  \(\phi^\perp\). Minimizing there subtracts a nonnegative term from
  the remaining diagonal entry. In the flat and homogeneous Berger
  collars the ground state is constant, \(w=0\), and \(S=R_\Sigma\).
  For instance the flat germ in E04 has \(r_\nu=a\), \(b=2a\)
  and \(\operatorname{Ric}=ag\) along the central slice. Its first
  positive Laplace eigenvalue is \(1>3a\), hence its index is one
  while \(S=0\). In E06 the Berger scalar is \(8-2t^2<0\) and
  \(3c-R_\Sigma<3/t^2\) in the specified range, giving the strict
  negative sign with the same index by the lower Laplace bound.
- For the parent Hölder test at \(H=0\), the constant trial gives
  \(P\operatorname{Vol}^{2/3}\) as an upper bound for the threshold
  when \(P=R-2r_\nu\) is constant. In the germs
  \(\|B\|_3^2=b\operatorname{Vol}^{2/3}\) and
  \(b=P-R_\Sigma\ge P\). No strict estimate is possible from these
  local data. The same central values hold with arbitrarily small
  collar width.
- On the unit round \(\mathrm{SO}(2)\times\mathrm{SO}(3)\) join, the
  minimal principal orbit has \(\sin^2 r=1/3\) and area
  \(16\pi^2/(3\sqrt3)>2\pi^2\). The reflection meridian is a minimal
  competitor of area \(2\pi^2\). For an untwisted invariant join the
  corresponding area is \(2|S^2|\int b_{\rm orb}^2\,dr\), with
  \(b_{\rm orb}\) the sphere warp factor. This is an upper bound for
  the unrestricted width by minimality. Equality remains a separate
  matter. A positive low-area cut gives no such inequality on its own.
- The fixed E06 extension by exponential factors gives positive
  orbit radii for finite normal parameter. It produces no finite
  smooth pole. Its strict decrease in \(H\) also forbids periodic
  matching of the same formula. A new extension would have its own
  global pinching and area requirements.
- The fixed minimal meridian of the untwisted invariant entering
  gauge has \(B=0\) and \(R_\Sigma=P>0\). Its role as a favorable
  minimal competitor is established separately from possible width
  equality. The raw product cap and seam lack the smooth entering
  input used in Zhou's theorem. The same checklist applies to a
  putative global extension of the Berger example.

## A meridional competitor for the two-pole Berger filling test

Assume an actual smooth two-pole filling on \(S^4\) with free
\(\mathrm{SU}(2)\) principal orbits and two smooth fixed points.
In geodesic product coordinates on the principal part suppose
\[
g=dr^2+\sum_{i=1}^3 a_i(r)^2\sigma_i^2,\qquad
0<r<L,\quad a_i>0 .
\]
The \(\sigma_i\) are dual to the fields \(E_i(q)=qe_i\) on the
unit quaternions, with \(e_i\) the imaginary unit basis and
\(\sum_i\sigma_i^2\) the unit round metric. The poles are ordinary
smooth collapses of the round unit link, with these orbit coordinates
coming from a linear identification of each tangent representation.
In particular \(\{x_0(q)=0\}\), where \(q=x_0+\sum_i x_i e_i\),
extends through each pole as a smooth linear hyperplane in its
geodesic coordinates. Its union with the two poles is a smooth
embedded three-sphere \(\mathcal M\).

On an orbit put \(m_i=a_i^{-2}\) and \(s^2=\sum_i m_i x_i^2\). The
ambient unit normal to a regular angular level is
\(N=-\sum_i m_i x_i E_i/s\). The \(E_i\) are divergence free since the
orbit volume is a multiple of bi-invariant Haar measure. As \(N\) has
no radial component, its ambient divergence is its orbit divergence.
Use \(E_i x_j=x_0\delta_{ij}+\sum_k\epsilon_{kij}x_k\) to obtain
\[
H=\operatorname{div}_gN
=-\frac{x_0}{s}\sum_i m_i+\frac{x_0}{s^3}\sum_i m_i^2x_i^2 .
\]
The terms with \(\epsilon_{kij}\) cancel by antisymmetry. Thus
\(\mathcal M\) is minimal on the principal part and across the
poles by smoothness.

At \(q=t+\sqrt{1-t^2}\,\omega\), \(\omega\in S^2\) imaginary,
the round unit normal of the angular level has left-frame components
\(-\omega_i\). The induced two-area density changes from the round
one by \(a_1a_2a_3(\sum_i \omega_i^2/a_i^2)^{1/2}\), by restricting
a diagonal positive bilinear form to this plane. The ambient normal
slices in \(r\) are orthogonal to the orbit, giving
\[
\begin{aligned}
I=\operatorname{Area}(\mathcal M)
 &=\int_0^L a_1a_2a_3
          \int_{S^2}\left(\sum_i\frac{\omega_i^2}{a_i^2}\right)^{1/2}d\omega\,dr,\\
I&\le \frac{4\pi}{\sqrt3}\int_0^L a_1a_2a_3\left(\sum_i a_i^{-2}\right)^{1/2}dr .
\end{aligned}
\]
The inequality is Cauchy–Schwarz and \(\int_{S^2}\omega_i^2\,d\omega=4\pi/3\).
The actual angular level \(x_0=t\) has area \((1-t^2)I\).
In a smooth entering filling, Zhou also gives the width bound
directly by the closed minimal competitor \(\mathcal M\). A central
minimal orbit at \(r_*\) is excluded from first width whenever
\(I<2\pi^2\prod_i a_i(r_*)\). If the test gives equality, it has
supplied no strict area exclusion.

As a check on the integral, \(a_i=\sin r\) on the unit round sphere
gives \(I=2\pi^2\) and the central orbit has the same area. To see
that strict comparison can occur, take
\(g_\epsilon=e^{2\epsilon\cos^2\theta}g_{\rm round}\), in round polar
angle \(\theta\in[0,\pi]\). For \(|\epsilon|\) sufficiently small this
is a smooth entering gauge, and the central orbit is minimal with
area \(2\pi^2\). The exact meridian area is
\(4\pi\int_0^\pi e^{3\epsilon\cos^2\theta}\sin^2\theta\,d\theta\).
It is strictly smaller for \(\epsilon<0\) and strictly larger for
\(\epsilon>0\). These tests do not realize the negative Berger germ.

There is also a global obstruction for a biaxial two-pole filling
\(a_1=a_2=a,\ a_3=c\). The ratio \(u=c/a\) extends to \(1\) at both
poles. If its maximum is at least \(2\), it occurs in the interior
with \(a'/a=c'/c=x\), so the orbital second fundamental form is
\(x\) times the induced metric. Gauss and the entering inequality
give \(R_{\rm orbit}=P+6x^2>0\) there. The Berger curvature computed
from the cyclic brackets \(2u,2/u,2/u\) gives
\(R_{\rm orbit}=a^{-2}(8-2u^2)\), a contradiction. Every orbit of
such a biaxial filling has positive intrinsic scalar curvature.
The E06 negative germ has unequal first normal derivatives of the
two equal horizontal radii, so it does not belong to this filling
class. The triaxial integral comparison remains the applicable
test if that germ can be filled.

## Disposition

The first-width sign reduces to the strict least-area comparison
above for all nonpositive index-one candidates. The independent
replay supplies an exact new test in one symmetry class, with a
closed embedded minimal competitor and an explicit bound on its
area. The negative Berger germ still lacks a closed entering
triaxial filling and a width comparison on such a filling.
The separate near-round test is a distinct packet.
