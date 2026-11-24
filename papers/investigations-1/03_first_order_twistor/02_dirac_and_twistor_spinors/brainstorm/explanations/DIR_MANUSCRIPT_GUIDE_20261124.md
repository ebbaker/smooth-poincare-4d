# How twistor spinors lead to five-eigenfunction rigidity

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI assistance. The selected model identifier and reasoning
effort were unavailable. Section and theorem numbers refer to the
25-page working draft [Twistor spinors, Dirac concentration, and Yamabe
spectral rigidity in dimension four](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex),
with TeX SHA-256
`35b9c19b26c7ba68755fce831551dd75c169d0fc8356cb349994c6ec3a29aaee`.
The [current continuation](../../continuation-notes/02_AFTER_FIVE_EIGENFUNCTION_RIGIDITY_20261124.md)
gives the construction question. This is an explanatory reading of
the assessed results.

## Exact recognition and loss of spinor compactness

On a smooth closed oriented Riemannian homotopy four-sphere, the
positive half-spinor equation is
\[
P_X\psi=\nabla_X\psi+\tfrac14c(X)D_g\psi=0.
\]
The Weyl integrability condition says that the real self-dual Weyl
action annihilates the spinor. A nonzero real self-dual form acts
invertibly on the positive half-spin space, so $W^+=0$ where
$\psi\ne0$. The prolongation for $(\psi,D_g\psi)$ makes the zeros
isolated and extends the conclusion to all of $M$. The signature
identity gives $E_-(g)=E_+(g)=0$, where
$E_\pm=\int|W^\pm|_{\mathrm{HS}}^2\,dV_g$. Conformal development and
the compact covering argument then identify $M$ with standard $S^4$.
Round Killing spinors give the converse after chiral projection
(Proposition 2.1).

The least eigenvalue $\mu(g)$ of
$P_g^*P_g=\tfrac34D_g^2-\tfrac14s_g$ is a natural variational target.
It has infimum zero in every fixed conformal class, even at unit
volume. Magnifying a small ball makes a localized spinor cheap in
the Rayleigh quotient. In a kernel-free class the actual normalized
lowest eigenspinors in this family concentrate their $L^2$ mass at
the point (Theorem 3.1). There is a stronger conformal invariant,
$J_g(\psi)=\||P_g\psi|/|\psi|\|_{L^4}$, which has a positive gap on
the transverse-zero domain in each fixed kernel-free class.
A construction varying the conformal class would still need a
uniform geometric estimate or compact attainment (§§3.2–3.3).

## What the punctured Dirac field controls

Choose a compact metric flat near one point with invertible
$D_g$. The Green spinor at the point becomes a harmonic field
$\Psi$ after puncturing and blowing up the flat germ to a Euclidean
end. It tends to a prescribed nonzero constant there. Its
Schrödinger–Lichnerowicz boundary identity is
\[
\int s_h|\Psi|^2\,dV_h=-4\int|\nabla^h\Psi|^2\,dV_h.
\]
An independent nonnegative bound on the left side would force
parallelism and produce a compact twistor spinor (Proposition 4.1
and Eq. (4.4)). The fixed-end Dirichlet energy can be made small by
shrinking the interior length scale, which also shrinks its spinor
mass (§4.3).

For a compact twistor defect $T=P_g\psi$, the exact curvature relation is
\[
\frac{|\Pi(d^\nabla T)^+|^2}{|\psi|^2}
   =\tfrac12|W^+|_{\mathrm{HS}}^2 .
\]
Here $\Pi$ is projection onto the two-form Clifford-contraction
kernel. The adjoint defect $P_g^*T$ determines the complementary part
of the decomposition in Eq. (2.5). In an explicit oscillatory
family even the canonical Green fields are zero-free off the pole,
with $J_g=O(n^{-1/2})$ and $E_+(g)\ge cn$ (Proposition 4.2). Thus
the curvature estimate must reach a derivative of the first-order
defect. The identity also gives a concrete sufficient target. It is
an integrated projected defect strictly below $2\pi^2$ in a
positive Yamabe class (§2.3).

## How map balance produces scalar modes

A smooth degree-one map $f:(M,g)\to(S^4,h_{\rm rd})$ makes the
product-graded twisted Dirac index equal to two. The scalar comparison
leads to a modified Yamabe quotient with potential $3|df|^2$.
\[
Y_f([g])=\inf_{u\ne0}
\frac{\int_M \bigl(6|du|^2+(s_g-3|df|^2)u^2\bigr)\,dV_g}
     {(\int_M u^4\,dV_g)^{1/2}}.
\]
Writing $Y([g])$ for the quotient without the map potential, the
sharp unrestricted supremum over degree-one maps is
$\min\{Y([g]),0\}$. A shrinking stereographic bubble carries all
the degree in its signed Jacobian measure and approaches the
supremum. Attainment is equivalent to a conformally round class
(Theorem 5.2).

For a supplied unit-volume Yamabe minimizer, let $s$ be its constant
scalar curvature and $\lambda_i$ its positive scalar Laplace
eigenvalues with multiplicity. Mean-zero coordinates
$\int f\,dV_g=0$ give
\[
Y_f\le s-3\int |df|^2\,dV_g\le s-3\lambda_1\le0.
\]
The steps use the constant test, Poincaré's inequality, and the
Yamabe second variation. A balanced sequence with $Y_{f_j}\to0$
on this fixed metric has a subsequence converging in ambient
$W^{1,2}$ to a smooth first eigenmap $F$, with $s=3\lambda_1$ and
$\Delta_g F=\lambda_1F$. The degree can change in this limit.
With bounded fourth energy, the Jacobian defect is a sum of integer
point masses in units of the sphere volume, costing at least
$16\operatorname{Vol}(S^4,h_{\rm rd})$
in fourth energy per unit of degree at that point
(Theorems 6.1–6.2). A strict local energy cap preserves degree.
A separate way to recognize the metric is to retain all five
directions of the covariance $C_f=\int ff^{\mathsf T}\,dV_g$.
For isotropic covariance $C_f=I/5$, the trace principle gives
$Y_f\le -A(g)$ with $A(g)$ below (§7.2).

## The fourth variation and the round metric

On any smooth unit-volume Yamabe minimizer in dimension four,
\[
A(g)=\tfrac35\sum_{i=1}^5\lambda_i-s\ge0,
\]
with equality exactly for a scaled round sphere (Theorem 7.1).
At $s=3\lambda_1$, let $\phi$ be a unit $L^2$ first eigenfunction.
Use the test $u=1+t\phi+t^2(\phi^2-1)$ in the Yamabe inequality.
The quadratic term vanishes, and the two signs of $t$ force the
cubic term to vanish. The fourth-order coefficient is
$25-\tfrac{35}{3}\int\phi^4$, giving $\int\phi^4\le15/7$.
Averaging over directions in the $d$-dimensional first eigenspace
forces $3d/(d+2)\le15/7$, hence $d\le5$. At $d=5$ every direction
saturates the bound, and the normalized basis map $X$ has
\[
|X|=1,\qquad
\langle dX_i,dX_j\rangle_g
=\tfrac{\lambda_1}{4}(\delta_{ij}-X_iX_j),\qquad
X^*h_{\rm rd}=\tfrac{\lambda_1}{4}g.
\]
The differential is invertible everywhere and $X$ is a
diffeomorphism by compactness and simple connectivity of the
target. This explains why five nondegenerate covariance
directions suffice. At scalar equality a remaining degree-zero
first eigenmap on a homotopy sphere must have image in a great
$S^2$ or $S^3$. The Hopf, rank and stress identities in §8 give
conditional restrictions on such a map.

## What near equality gives and what must be constructed

For varying smooth unit-volume Yamabe minimizers with $s>0$, put
$\epsilon=3\lambda_5/s-1$. Theorem 9.1 gives weak convergence of
$X_*(dV_g)$ to round probability as $\epsilon\to0$.
Here $X$ uses the first five $L^2$-orthonormal modes divided by
$\sqrt5$. The map obeys
$\||X|^2-1\|_2=O(\epsilon^{1/4})$ and the normalized Gram defect
$\tfrac3s\langle dX_i,dX_j\rangle_g-\tfrac14(\delta_{ij}-X_iX_j)$
has size $O(\epsilon^{1/4})$ in a dual energy norm.
These bounds control values and averaged derivative tests.
Pointwise rank and the geometry of vanishing-volume regions
are separate matters. A sufficiently strong pointwise Ricci
lower bound, asymptotic to $(s/4)g$, gives smooth recognition
via Aubry's theorem (§9).

The proposed gluing test asks whether a round region can dominate
the low spectrum in the actual Yamabe-minimizing representative.
In four dimensions, rescaling by $g\mapsto t^2g$ multiplies the
numerator and denominator of the Yamabe quotient of a supported
test by the same $t^2$. A low-quotient punctured core can therefore
compete with the round region even as its volume shrinks. A
successful construction needs both relative spectral pinching
on the minimizing metrics and geometric control that retains the
smooth structure of the whole manifold (§10).

## Addendum, 24 November 2026: Sections 7.3 and 10 of the revised draft

Added for Edward B. Baker III with LLM assistance: Claude Fable 5.2
(`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured,
when the author asked for the results of E48–E50 to be included in the
manuscript. The text above reads the 25-page draft with the hash stated
there and was not changed. The revised draft has TeX SHA-256
`71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d` and 35 pages. Sections 1–9 keep their numbers. The outstanding
challenges are now Section 11, so the reference to §10 in the last
paragraph above means §11, and the gluing test described there is settled
by Proposition 10.1. The [draft history](../../DRAFT_HISTORY.md) lists
the changes and the [E49 supplement](../../notes/DIR_E49_SUPPLEMENT_20261124.md)
the arguments completed for them.

**Local minimizers (§7.3).** The proof of Theorem 7.1 expands the Yamabe
quotient of $1+t\phi+t^2w$ to fourth order in $t$ and uses nothing else, so
the theorem holds wherever the quotient has a local minimum along these
curves (Proposition 7.2). A conformal vector field $X$ with
$\mathcal L_Xg=2\sigma g$ on a metric of constant scalar curvature gives an
eigenfunction, $\Delta_g\sigma=\tfrac s3\sigma$. At a local minimizer that
is not round, a conformal field that is not Killing therefore forces
$s=3\lambda_1$, and at most four independent ones exist (Proposition 7.3).

**Why a round region does not help (§10.1).** Glue the punctured core of
$(M,g_0)$, flat near $p$, to a round sphere with a hole, using an inversion
on a conformally flat collar. Following the inversion from $p$ outward gives
a conformal diffeomorphism from $(M,[g_0])$ to the glued manifold. The
conformal class is the one we started with, so its Yamabe constant, its
minimizing metrics and their spectra are unchanged for every neck size and
relative scale (Proposition 10.1). In a minimizing metric the round region
is a ball of volume $O(\rho^4)$, and functions living on it have Rayleigh
quotient of order $\rho^{-2}$. More generally, changing a class inside a
ball of radius $r$ raises its Yamabe constant by at most $Cr/\log^2(1/r)$
(Proposition 10.2).

**The Delaunay minimizers (§10.2).** On $S^1(\ell)\times S^3$ with
$\ell>\sqrt2\,\pi$ the Yamabe minimizer is
$\operatorname{dn}^2(t/\sqrt{2-m})\,(dt^2+g_{S^3})$, a bulge joined to
itself by a neck of relative radius $\sqrt{m_1}$, $m_1=1-m\approx16e^{-\ell}$.
Rotation of the circle is conformal and not isometric, which gives
$s=3\lambda_1$ exactly. The profile times the four coordinate functions of
$S^3$ gives four trial functions whose Rayleigh quotient is a closed form
$\tfrac s3R(m)$, so $3\lambda_5/s-1\le R(m)-1=\tfrac{15}{16}m_1+\cdots$,
while the Yamabe deficit is $\tfrac38m_1+\cdots$ (Theorem 10.3). Relative
near equality therefore occurs on a manifold with infinite fundamental
group. The computed table shows what Theorem 9.1 sees, the round law of the
five values, and what it cannot see: the map $X/|X|$ has degree zero, the
Gram defect does not tend to zero in $L^2$, and the Ricci curvature is
negative in the neck.

**The integral Ricci criterion (§10.3).** By the Chern–Gauss–Bonnet
formula, the hypothesis of Chang, Gursky and Yang at a volume-one metric of
constant scalar curvature $s>0$ reads
$\int|{\rm Ric}_0|^2<s^2/12-8\pi^2\chi(M)$ (Proposition 10.4). On a homotopy
four-sphere the right side is $s^2/12-16\pi^2$, positive only above
$s=8\sqrt3\,\pi$. A Ricci lower bound $(1-\delta)(s/4)g$ implies it for
$\delta^2<\tfrac19-64\pi^2/(3s^2)$, with no eigenvalue involved. The
Delaunay metrics give exact equality, and the Bochner identity (10.13) shows
why pinching cannot supply the bound: it controls the sum of
$\int|{\rm Hess}_0\phi|^2$ and $\int{\rm Ric}_0(\nabla\phi,\nabla\phi)$ and
neither term.

**What Section 11 now asks.** A construction must change the conformal
class on a region carrying a definite part of the minimizer. Whether
relative pinching and a Yamabe constant near that of the round sphere imply
one another is open, as is the existence of such classes on an arbitrary
homotopy four-sphere. Recognition needs information that reaches regions of
small volume: a Ricci bound, the integral bound above, or smooth
convergence.
