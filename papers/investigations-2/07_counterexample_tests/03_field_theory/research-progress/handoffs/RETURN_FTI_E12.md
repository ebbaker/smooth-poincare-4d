# FTI-E12 return r1 · Closed gauge quotient and a trial on the actual cut

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance on checkout
`7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`. Bounded E execution
with GPT-6.2 Sol/ultra specified in the dispatch. Actual serving variant
and effort were unavailable. This return uses the [frozen request][req],
[B05][b05], [B03][b03] and the geometric inputs identified below.

On the smooth reassembled sphere, the charge-one quotient retains the
odd exact one-form partners. The curvature map is injective on every
retained co-closed space. The explicit rank-one trial is nonzero on both
sides of the physical seam. On the quotient algebra the point class is
$c^2$, including before the longitudinal evaluation prescribed in B05.

## Closed gauge quotient

Let $X$ be the closed connected oriented smooth homotopy four-sphere
obtained by the indicated capping, and let $g$ be a smooth positive
Riemannian metric on $X$. Use self-dual chirality in the given
orientation. The fields are smooth. The line is trivial and in a
unitary trivialization its charge-one connection is $d+iA$ for
a real one-form $A$. Acting on a charge-one section by
$v=e^{i\alpha}$ gives $A\mapsto A-d\alpha$. Because $X$ is simply
connected, any smooth $v:X\to U(1)$ has a smooth real lift $\alpha$,
unique modulo a constant in $2\pi\mathbb Z$. The constant circle
stabilizes every $A$ and acts trivially on the neutral fields of B03.
Its Haar mass is one in B05.

The equation $d_g^*d\alpha=d_g^*A$ has a unique smooth mean-zero
solution. Indeed the nonnegative scalar Laplacian on a closed connected
manifold has kernel the constants, and $d_g^*A$ is orthogonal to that
kernel by adjointness. It follows that each orbit has exactly one
co-closed representative. In particular the full closed quotient has
no winding shift. The independent boundary lattice and normal
coefficient of the smooth monopole problem in E01 belong to that
boundary problem. Full smooth transmission and the fixed cap precede
the B05 quotient. [E01, §§2–3][e01]

Take an oriented $L_g^2$-orthonormal basis $u_i$ of the real co-closed
subspace $U$ and a real basis $f_j$ of the retained mean-zero
functions. The $df_j$ are independent. A representative allowing
retained gauge directions has
$$
\begin{aligned}
 A&=\sum_i x_i u_i + d\sum_j a_jf_j,&
 \psi&=\sum_i\theta_i u_i+d\sum_j \zeta_j f_j,&
 \phi&=c+\sum_j b_j f_j .
\end{aligned}
$$
The intersection of a full gauge orbit with these retained connection
modes consists of translations of the $a_j$. Indeed the difference of
two equivalent retained representatives is exact, so its co-closed
component vanishes. A real lift of the gauge between them is a retained
combination of the $f_j$ plus a constant. A gauge with a lift outside
this space can move the representative outside the finite slice. The
resulting quotient uses just $x_i$ for the connection. Since $\psi$ is
gauge neutral, it keeps both sets of odd coefficients.

Before quotienting, $Qa_j=\zeta_j$ and $Q^2a_j=-b_j$. This is
the gauge translation by $\phi$ with the charge convention above.
Gauge-invariant polynomials are independent of the $a_j$. On them
$Qx_i=\theta_i$, $Q\theta_i=0$, $Q\zeta_j=-b_j$, and
$Qb_j=Qc=0$. The constant mode $c$ is the value of the constant
part of $\phi$.

## Curvature map and action

Write $P_g=(1+*_g)/2$, $d^+=P_gd$ and
$K_g=\mathrm{Id}+\ell^4(W_g^+)^2$ for fixed $\ell>0$. The chiral
Weyl operator is self-adjoint on real self-dual two-forms.
Consequently
$$
 \langle K_g\beta,\beta\rangle_g
 =|\beta|_g^2+\ell^4|W_g^+\beta|_g^2
$$
pointwise, and $K_g$ is invertible. If a smooth co-closed one-form
$\alpha$ satisfies $K_g d^+\alpha=0$, then $d\alpha$ is
anti-self-dual. The closed-manifold identity is
$$
 -\|d\alpha\|_{L_g^2}^2
 =\int_X d\alpha\wedge d\alpha
 =\int_X d(\alpha\wedge d\alpha)=0 .
$$
Thus $d\alpha=0$. As $H^1(X;\mathbb R)=0$, write $\alpha=dh$.
Co-closure gives $\|\alpha\|^2_{L_g^2}=\langle h,d_g^*\alpha\rangle_{L_g^2}=0$.
This proves injectivity on $U$. Choose an orthonormal target basis of
$K_gd^+U$ with the orientation transported from $U$ by $K_gd^+|_U$.
Its matrix $M$ is invertible with positive determinant, including
determinant one by convention in dimension zero.

Expand $H$ and $\chi$ in that target basis and use the same letters
for their coefficient columns. On self-dual two-forms the wedge
pairing agrees with the oriented $L^2_g$ pairing. The two exact
one-form sectors disappear from $dA$ and $d\psi$ by $d^2=0$.
The restricted gauge fermion and its differential are
$$
  V=\chi^{\mathsf T}(Mx-H/2),\qquad
  QV=H^{\mathsf T}Mx-\tfrac12 H^{\mathsf T}H
                         -\chi^{\mathsf T}M\theta .
$$
Here $Q\chi=H$ and $QH=0$, and the minus sign is the graded Leibniz
sign from $\chi$. The fixed real matrix coefficients have zero
$Q$-variation. The displayed polynomial extends holomorphically in
the auxiliary coefficients with the same transpose and signs.
[B03 definitions][b03] · [E04 classical identity][e04]

## The trial in the actual coordinates

In the oriented Cartesian chart $q$ of $\mathbb C^2$, the Gerig
circle is $(z,w)=(ae^{is},0)$, with $a=\sqrt{\epsilon}>0$. Use the
B01 tube parametrization
$$
 \tau(s,x)=((a-x_1)e^{is},x_2+i x_3),\qquad |x|\le r=a/10 .
$$
The point $q_*=(a-r,0,0,0)$ is $\tau(0,(r,0,0))$ on $Y=\partial T$.
The radius-$r/4$ coordinate neighborhood lies in the chart inside
the truncated ball, away from both the core and the outer sphere.
The tube comes from the retained circle in the modified Example 1.7.
Its defining region lies inside the ball of radius $\sqrt{2}a$,
and the cutoff at radius $64a$ lies in the standard-form region
outside radius $32\sqrt{2}a$.
[Gerig v3, Example 1.7, p. 3][gerig] · [B01][b01]

Use B05's bump formula with support radius $r/8$ inside that
neighborhood and support radius $a/8$ for the origin bump. These
choices give zero on collars of the two allowed support bounds.
The denominator in the bump formula is positive. Its smooth
flat factors give a globally smooth cutoff equal to one near its
center and zero beyond its support radius. With $\rho_*$ the seam bump, set
$$
 \beta=(q^1-q_*^1)\rho_*(q)\,dq^1\wedge dq^2,
 \qquad u_{\rm raw}=d_g^*\beta .
$$
Extend the two-form by zero before taking its codifferential. The
extension and $u_{\rm raw}$ are smooth in the reassembled manifold,
and $(d_g^*)^2=0$ gives co-closure. At $q_*$, $\beta=0$ and
$\rho_*=1$, so the connection terms in the codifferential vanish.
Using $(d_g^*\beta)_k=-g^{ij}\nabla_i\beta_{jk}$ gives
$$
 u_{\rm raw}(q_*)=
 g^{12}(q_*)\,dq^1-g^{11}(q_*)\,dq^2 .
$$
The inverse metric has $g^{11}(q_*)>0$. Hence the one-form is
nonzero on a neighborhood of $q_*$. On the real radial axis through
$q_*$, the point $(a-r+\lambda,0,0,0)$ has tube coordinate
$x_1=r-\lambda$ for small signed $\lambda$. It is inside the tube
for $\lambda>0$ and outside for $\lambda<0$. The nonzero
neighborhood therefore meets both sides. The normalized field
$u=u_{\rm raw}/\|u_{\rm raw}\|_{L_g^2}$ is an eligible basis of a
rank-one $U$. In particular $K_gd^+u\ne 0$.

For the origin bump $\rho_0$, let
$f=\rho_0-\operatorname{Vol}_g(X)^{-1}\int_X \rho_0\,dV_g$.
The mean lies strictly between zero and one, since the bump is
one near $p_0=0$ and vanishes on a nonempty open set. Thus $f$
is smooth and mean-zero with $f(p_0)>0$. It gives the nonzero
longitudinal trial. The trial construction applies to every smooth
positive compact metric.

## Polynomial cohomology before the longitudinal evaluation

Work over $\mathbb R$, or over $\mathbb C$ for the complex polynomial
algebra, with the coefficients $H_k$ polynomial holomorphic variables
in the complex case. In quotient coordinates the odd derivation is
$$
 Q=\sum_i\theta_i\partial_{x_i}
    +\sum_k H_k\partial_{\chi_k}
    -\sum_j b_j\partial_{\zeta_j}.
$$
With left odd derivatives, set
$$
 h=\sum_i x_i\partial_{\theta_i}
    +\sum_k\chi_k\partial_{H_k}
    -\sum_j\zeta_j\partial_{b_j}.
$$
The anticommutator $Qh+hQ$ is the Euler derivation counting all
coordinates other than $c$. This holds on generators and hence on
all polynomials. Both derivations preserve that count. If $P_m$
is closed and homogeneous of count $m>0$, then
$P_m=Q(hP_m/m)$. Evaluation at all those coordinates equal to zero
is a chain map to the polynomial algebra in $c$ with zero
differential. Each nonzero polynomial in $c$ represents a nonzero
class, and this evaluation identifies the entire quotient cohomology.

Put $B=\sum_j b_j f_j(p_0)$ and $Z=\sum_j\zeta_j f_j(p_0)$.
Then $QZ=-B$, $QB=0$ and
$$
 I_{p_0}-c^2=(c+B)^2-c^2
       =Q\bigl[-Z(2c+B)\bigr].
$$
The prescribed current evaluating $b=\zeta=0$ is itself a chain
map, since the ideal generated by these coordinates is $Q$-stable.
It sends the insertion to $c^2$ directly. The point class is already
nonzero before that evaluation.

## Matched closed inputs

Use outward-normal-first boundary orientations. The actual tube
has outgoing $Y$, the exterior has boundary $-Y\sqcup O$, and the
standard cap has boundary $-O$, with $O=+S^3_{64a}$ the fixed outer
sphere. The Gerig and zero-free forms agree on the outer annulus.
Both use the same compactification with pole at infinity and
insertion at $p_0=0$. For the end sign, with $I(v)=v/|v|^2$ and
$D=\operatorname{diag}(1,1,1,-1)$, the oriented compact chart is
$y=DI(q)$ and the inverted coordinates are $x=I(y)=Dq$. The
standard end in those coordinates is
$dx^1\wedge dx^2-dx^3\wedge dx^4$, self-dual in the inherited
orientation since these inverted coordinates reverse the $q$
orientation. The pole form is part of the marked geometric input.
The smooth curvature in the regulator is $dA$.
[End normalization][comparison]

For increasing core angle the actual marked eigenline is
$R_1(-s/2)\mathbb R e_3$, with line-aligned terminal-to-initial
spin lift $+\widetilde R_1(\pi)$. The plus half-angle chart instead
uses $-\widetilde R_1(\pi)$ on the same pulled-back spin data. The
Gerig ratio of positive normal eigenvalues is $(R-a)/(2a)>1$ in
the stipulated range. The transfer here uses the reassembled
Cartesian chart, so the closed fields and the finite matrix require
only smooth form data. The line and spin lift enter the earlier
marked and spinor problems. [Actual jet and lifts][e07]

| Closed input | Meaning of the trial and algebra | Earlier finite cover evaluation where assigned |
| --- | --- | --- |
| Actual Gerig cut with the standard cap | The trial crosses the physical seam. The finite curvature map is injective and the point class is $c^2$. | The actual orientation-cover insertion gives outer state $0$ and capped scalar $0$. Plain gluing gives $1$ and $1/2$. [E03][e03] |
| Zero-free standard form with the same end and cap | Use the same coordinate supports on the capped sphere and the chosen smooth compact metric. The former seam location is then a coordinate reference. The field remains nonzero and the point class is $c^2$. | The empty insertion gives outer state $1$ and capped scalar $1/2$. [E03][e03] |
| Round and physical E33 metrics on standard $S^4$ | Use the oriented finite chart and its origin. For E33 identify its oriented stereographic coordinates with $q$. Round has $K_g=\mathrm{Id}$; E33 has nontrivial $K_g$ near the origin by its positive chiral Weyl jet. Both satisfy the same injectivity and local support calculation and give $c^2$. [E33, metric and jet][e33] | |
| Closed signed minus candidate $\Sigma_P$, conditional on the marked comparison data | Use its stated coordinate cap, smooth positive metric and specified insertion. The closed quotient and injectivity follow from its homotopy-sphere hypothesis. If the candidate supplies a smooth interior seam, a chart centered on it with the first coordinate transverse yields the same local trial and sign check. Pole, end and actual eigenline are input when making the marked comparison. | With a supplied tube and orientation line, the old outer projector gives $1$ for a trivial line and $0$ for a nontrivial line. Capping contributes the factor $1/2$. [E10][e10] |

The prescribed residual pairing uses the same normalized real
Gaussian of precision $t$ on the actual constant value $c$ in each
input. Once the finite pairing is verified to be normalized and to
annihilate $Q$-exact polynomials, the primitive above reduces the
point evaluation to the residual Gaussian moment $1/t$. The
finite integral and its Ward identity belong to the separately
frozen [E11 request][e11]. The E12 conclusion is finite-dimensional,
and the marked candidate comparison depends on its supplied geometry.

## Input receipts

Inspected mathematical records, identified by SHA-256 prefix.

- [E12 request r1][req] `6f4762c2135b002a`, [B05][b05] `c86fa5918754ea79`,
  [B03][b03] `15599fa6b4ce5327`, [register][register] `af6350ae0a2cf913`.
- [B01][b01] `bd923836031876e2`, [E01][e01] `6086097338384f74`,
  [E03][e03] `06fc4ffbaa71b842`, [E04][e04] `8de826d041d540a6`,
  [E07][e07] `6e5ce3af04441dc4`, [E10][e10] `bc6f2c1c921ca31a`.
- [End and comparison record][comparison] `b24f401ae4632832` and
  [DIR-E33][e33] `3d8fa6fe2b86c38f`, read for the chart and chiral jet.
- [Gerig, arXiv:1905.10938v3, p. 3][gerig], Example 1.7 read
  for the retained circle and standard outer region.

[req]: REQUEST_FTI_E12.md
[b05]: ../../brainstorm/notes/B05_REGULATED_POINT.md
[b03]: ../../brainstorm/notes/B03_OFF_SHELL_CHOICE.md
[b01]: ../../brainstorm/notes/B01_ACTUAL_CUT.md
[register]: ../REGISTER.md
[e01]: RETURN_FTI_E01.md#2-kernels-and-the-gauge-quotient
[e03]: RETURN_FTI_E03.md
[e04]: RETURN_FTI_E04.md
[e07]: RETURN_FTI_E07.md#half-angle-charts-and-spin-lifts
[e10]: RETURN_FTI_E10.md
[e11]: REQUEST_FTI_E11.md
[e33]: ../../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E33_20261124.md#metric-end-and-curvature-jet
[comparison]: ../../notes/FIELD_COMPARISON.md
[gerig]: https://arxiv.org/pdf/1905.10938v3#page=3
