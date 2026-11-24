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
