# FTI-E06 · Replay of finite gluing and classical off-shell variation

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance by a reader separate from the E03 and E04 writers.
The request specifies GPT-6.2 Sol at ultra effort. Actual serving variant
and effort were unavailable to this reader. Checkout 7c6bbab9a0a6. The
[request r1](../research-progress/handoffs/REQUEST_FTI_E06.md) and frozen
[E03](../research-progress/handoffs/RETURN_FTI_E03.md) and
[E04](../research-progress/handoffs/RETURN_FTI_E04.md) match SHA-256 prefixes
822ec3a0140e4674, 06fc4ffbaa71b842, and 8de826d041d540a6. The
[B01 cut](../brainstorm/notes/B01_ACTUAL_CUT.md),
[B02 choice](../brainstorm/notes/B02_FLAT_SIGN_SECTOR.md),
[B03 choice](../brainstorm/notes/B03_OFF_SHELL_CHOICE.md),
[E07 jet](../research-progress/handoffs/RETURN_FTI_E07.md), and
[WIN-E22 physical E33](../../02_invariants/notes/E22_METRIC_AND_SPECTRUM.md)
match bd923836031876e2, 565fa48c5ee30bb3, 15599fa6b4ce53275,
6e5ce3af04441dc4, and 4a7a988d5db8d603. This is an analytical replay within
the project. The source dependencies are identified at use.

Both frozen calculations replay. On a homology-ball filling with the
specified tube, the finite scalar detects precisely the cover label supplied
at the cut. The chiral spacetime insertion is a nonzero classical class
and the classical action's metric derivative is $Q$-exact. On the stated
real fields the auxiliary weight grows along every nonzero auxiliary
direction. The algebraic Ward identity leaves the scalar value open.

## Actual cut and finite gluing

Take $B=B^4_{64a}$ with the complex orientation, the actual smoothly
embedded B01 tube $T$ of radius $a/10$ around $C=(ae^{is},0)$, the
exterior $E=B\setminus\operatorname{int}T$, $Y=\partial T$, and
$O=\partial B\simeq S^3$ with its fixed marking. Orient boundaries
outward normal first. The standard cap has boundary $-O$.
The exterior is connected because paths can be moved off the
codimension-three core and $B\setminus C$ retracts onto $E$ by
pushing punctured disk fibers to their boundaries. Both projections
$T,Y\to C$ have simply connected fibers, so each induces an isomorphism
on $H^1(-;\mathbb F_2)$ and $r_T:H^1(T)\to H^1(Y)$ is an isomorphism.
The collared Mayer–Vietoris sequence identifies
$H^1(T)\oplus H^1(E)$ with $H^1(Y)$ because $H^1(B)=H^2(B)=0$.
Thus $H^1(E)=0$, with trivial restrictions at both of its boundaries.
The same proof applies to any compact connected smooth
$\mathbb F_2$-homology four-ball with outer boundary $S^3$ and such a
connected internal tube. This includes a homotopy sphere with an open
coordinate ball removed, whenever the supplied tube lies in the complement.

The negative eigenline comes from the actual Example 1.7. In the
interval frame for the canonical core orientation, the E07 first-jet
matrix gives the unit representative $\sin(s/2)n_2+\cos(s/2)n_3$ of
the negative line. It returns to its negative, so
$\lambda=\pi^*w_1(L^-)$ is the unique nonzero class on
$Y$. In the minus chart it is the axis with sign-reversing transition.
In the plus chart it is that axis rotated by $R_1(-s)$ on the interval.
The coordinate change fixes the projection to $C$ and hence both classes
on $Y$. Reversing the longitudinal generator also fixes the class since
each element of $\mathbb Z/2$ is its own inverse.
[Gerig v3, Example 1.7, p. 3](https://arxiv.org/pdf/1905.10938v3#page=3) ·
[E07 physical eigenline and spin transitions](../research-progress/handoffs/RETURN_FTI_E07.md).

Use $G=\mathbb Z/2$, complex coefficients and unit action phase. Holonomy
classifies principal $G$-bundles on each connected piece by
$H^1(-;\mathbb F_2)$. Each class has two automorphisms, the constant
translations. Fix a representative at each connected boundary component.
If the bulk class has the specified restrictions, identifying those
restrictions with the representatives gives a $G^m$-torsor for $m$
boundary components. The bulk automorphisms translate all choices
together, freely for $m\ge1$. This gives $2^{m-1}$ relative classes of
weight $1$. If a restriction disagrees, the count is zero. Summing an
incoming field uses mass $1/2$ for each class on a connected boundary.
[Freed, *Lectures on Topological Quantum Field Theory*, 9 December 1992,
Lecture 2, (18)–(24), printed pp. 15–19](https://ncatlab.org/nlab/files/Freed-TQFTLectures.pdf#page=16).

Use the unit-function coordinate on $V_O=\mathbb C$ and write $a_0,b_0$
for classes on $Y$.

| Piece | Fixed-representative state or kernel | Induced state or map |
| --- | --- | --- |
| Cylinder on $Y$ | $2\delta_{b_0,a_0}$ | $f\mapsto f$ |
| Tube $T$ | $1$ on each class | $v_T=(1,1)$ in the order $0,\lambda$ |
| Exterior $E$ | $2\delta_{a_0,0}$ | $f\mapsto f(0)$ |
| Cap | $1$ on the unique class | $z\mapsto z/2$ |
| Zero-free ball | $1$ on the unique class | $v_B=1$ |

The cylinder has one extending class and two relative identifications
for each matched pair. With outer identification fixed and no cap, the
two matching isomorphisms at $Y$ are a free transitive orbit of the tube
automorphisms. The glued trivial bundle has relative weight $1$.
With the cap, the four matching choices for the two seams form a
transitive $G^3$-set with diagonal stabilizer $G$. The glued weight is $1/2$.

The specified projector is multiplication by $1_{\{\lambda\}}$. It sends
$v_T$ to $(0,1)$, and the exterior kills that vector. The projected state
and capped scalar are both $0$. Plain gluing and the zero-free comparison
with the specified empty insertion each give state $1$ and capped scalar
$1/2$. If a tube is present and its supplied line is orientable, the same
rule gives the trivial-class projector and state $1$. Equal cover labels
give equal states and equal capped scalars throughout this class of
marked homology-ball comparisons. A change of boundary basis or a common
nonzero scalar normalization preserves the endpoint discrepancy. An
artificial tube or a different empty insertion changes the input.

For a fixed cut and cover the count is independent of all Riemannian
metrics. If a smooth family transports the cut and line bundle over an
interval, the transport identifies the fiber restrictions of $w_1$.
The plus/minus frame switch therefore acts trivially on the two
finite basis functions. The differing spin coordinate transitions
matter in the separate monopole problem, where the metric, spin
structure, connection, traces and APS domain must be pulled back
together. A Floer interpretation still needs a state and pairing for
the twisted cut and a map carrying the projector. Gerig's inner pairing
assumes the absence of twisted circles. The two finite automorphisms
and the smooth constant $U(1)$ stabilizer belong to separate field spaces.
[E01 boundary problem](../research-progress/handoffs/RETURN_FTI_E01.md) ·
[Gerig, Main Result 1](https://arxiv.org/pdf/1905.10938v3#page=3) ·
[E02 scope of Gerig's counts](../research-progress/handoffs/RETURN_FTI_E02.md).

## Prescribed dilation and endpoint descent

In Cartesian coefficients put $\eta=\omega-\omega_{\rm std}$, supported
within radius $32\sqrt2a$. The dilation gives exactly
$\omega_t-\omega_{\rm std}=\eta(\cdot/t)$ in those coefficients for
$t>0$. It fixes the outer germ and transports the cut and cover to the
scaled circle. It gives smooth convergence on compact subsets away
from $0$ and $\|\eta(\cdot/t)\|_{L^p(B)}=t^{4/p}\|\eta\|_{L^p(B)}$ for
$1\le p<\infty$. The radial change
$\rho\mapsto\rho[1-(1-t)\chi(\rho)]$ has positive derivative for $t>0$
when $\chi$ is a nonincreasing cutoff equal to one on the original tube
and zero near $O$. This realizes the transport fixing the outer marking.

With the inner multiplier $\kappa\ne0$, the original polynomial has
value $-\kappa a^2\omega_{\rm std}$ at zero and $\operatorname{Re}w$
derivative $-\kappa R\operatorname{Im}(dz\wedge dw)$. The dilation
preserves the first value and multiplies the derivative by $1/t$.
The source leaves the multiplier unspecified. For any multiplier the
moving point $t(a,0)$ is a zero, and tends to a point where the
stipulated endpoint is nonzero. This rules out joint continuity
at the event and $C^0$ convergence on $B$.
[Gerig v3, Example 1.7, p. 3](https://arxiv.org/pdf/1905.10938v3#page=3).

The distinct outputs disprove descent to the underlying smooth ball
or its prescribed capped sphere. Linear interpolation supplies a
smooth path of closed forms fixed near the end, with no near-symplectic
claim along the path. Gerig's smooth polynomial birth family has a
second circle before the fixed-parameter modification. It gives no
global smooth near-symplectic disappearance for the actual modified
input as stated. Any other admitted path would still have to account
for the distinct endpoint outputs. The obstruction concerns an
endpoint-preserving extension of this finite prescription.

## Transported spacetime complex

On the closed oriented smooth standard $S^4$ with each positive-definite
metric in E04, use the trivial charge-one line and the real
connection $A\mapsto A-d\alpha$. Use the graded Leibniz rule in field
parity and let $Q$ commute with $d$ on spacetime coefficients. Applying
the B03 laws twice gives $Q^2 A=-d\phi$ and square zero on the neutral
fields. This is the infinitesimal gauge action, so $Q$ is a differential
on gauge-invariant polynomials. Applying it to the gauge fermion gives

$$
S_g=\int_X \left[H\wedge(K_gP_gF-H/2)-\chi\wedge K_gP_gd\psi\right],
\qquad K_g=1+\ell^4(W_g^+)^2,
\qquad Q S_g=Q I_p=0 .
$$

The action identity uses $QF=d\psi$ and $Qd\psi=0$ off shell. For a smooth
metric path of fixed orientation, write $P=P_{g_0}$,
$U_t=P_{g_t}|_{\Lambda^+_{g_0}}$, $J_t=U_t^{-1}P_{g_t}$ and
$\widetilde W_t=U_t^{-1}W_{g_t}^+U_t$. The restriction $U_t$ is an
isomorphism even without a smallness condition. A nonzero
$g_0$-self-dual form has positive wedge square, whereas a nonzero
$g_t$-anti-self-dual form has negative wedge square. Thus the kernel
of the restriction is zero. Transport $\chi,H$ via $U_t$ and keep
$A,\psi,\phi$ fixed. In these coordinates $Q$ commutes with the derivative.
From $P_t^2=P_t$ one has $P\dot P P=0$. Differentiating $U_tJ_t=P_t$
gives $\dot J=P\dot P$, while the range of $\dot U$ is anti-self-dual.
For $h=\dot g$, variation of the wedge/inner-product identity gives
$\dot P\beta=\tfrac12*_0(\tfrac12\operatorname{tr}_{g_0}h\,\beta-h^\sharp\cdot\beta)$,
with $h^\sharp$ acting in both covector slots.
With $\mathcal R_t$ the full curvature operator and $s_t$ scalar
curvature, differentiation of the conjugated plus block gives

$$
\dot{\widetilde W}=
(P\dot P\mathcal R_0+P\dot{\mathcal R}+P\mathcal R_0\dot P)|_{\Lambda^+_{g_0}}
-\tfrac{\dot s}{12}\mathrm{Id},
\qquad
\dot{\widetilde K}=\ell^4(\dot{\widetilde W}W+W\dot{\widetilde W}) .
$$

Each $\dot U$ term in the derivative of the top-form wedge integrand
has opposite-duality factors and vanishes. This includes the variation
of $H$ and both inputs of the wedge pairing. There is no separate
volume density or integration by parts. The variation is

$$
\dot V=\int_X\chi\wedge(\dot{\widetilde K}P+KP\dot P)F,
\qquad \dot S=Q\dot V,\qquad \dot I_p=0 .
$$

On the round sphere $W=0$, hence $K=1$ and $\dot{\widetilde K}=0$.
At the E33 origin the physical metric has flat background and its
displayed second jet gives the only independent curvature entries
$R_{1212}=-\epsilon$ and $R_{1313}=\epsilon$. The scalar curvature
vanishes there. The plus block halves each of these coefficients,
giving $W^+(0)=\operatorname{diag}(-\epsilon/2,\epsilon/2,0)$ and
$K(0)=\operatorname{diag}(1+\ell^4\epsilon^2/4,1+\ell^4\epsilon^2/4,1)$.
Under $g_t=e^{2ct}g_0$, the star on two-forms is fixed and the Weyl
endomorphism scales by $e^{-2ct}$. Thus $\dot{\widetilde K}=-4c(K-1)$.
[WIN-E22, physical E33 metric and conventions](../../02_invariants/notes/E22_METRIC_AND_SPECTRUM.md#physical-and-auxiliary-metrics).

## Point insertion and the missing pushforward

Set $A$ flat, $\psi=\chi=H=0$, and $\phi\equiv u$ for any real $u$.
The $Q$-vector field vanishes here, as do the spacetime derivatives of
its values. Restriction kills every exact polynomial and sends $I_p$
to $u^2$, proving nonexactness. For a path $\gamma:p'\to p$ one has
$Q(2\phi\psi)=-d(\phi^2)$, giving $I_p-I_{p'}=-Q\int_\gamma2\phi\psi$.
The flat gauge class is unique on $S^4$, and the constant gauge circle
acts trivially everywhere. At a fixed metric write the exact part of
$\psi$ as $d\zeta$ with $\zeta$ of mean zero. Then
$Q\zeta=-(\phi-\bar\phi)$ and $Q\bar\phi=0$. The action lacks both
scalar damping and a term on the exact part of $\psi$. A regular
$Q$-exact deformation vanishes on this scalar fixed locus and thus
cannot give a direct damping potential there in the same fields.

On the real self-dual auxiliary cycle put $B_g=K_gP_gF$. The bosonic
action is $\|B_g\|^2/2-\|H-B_g\|^2/2$. Along any nonzero real auxiliary
direction $e^{-S_g}$ grows as a positive Gaussian even on a
one-dimensional bosonic restriction. A complex contour can change
the quadratic sign. That leaves the residual modes, gauge quotient
and stabilizer, and the Ward identity to justify. A differentiable
pushforward would have to kill exact expressions such as
$Q(I_p\dot V e^{-S_g})$ and control variations of its measure or
domain and boundary contributions from field-space ends. A normalized
value also needs a defined nonzero denominator. Evaluation at any of
the specified fixed configurations already kills exact polynomials and
sends $I_p$ to the chosen $u^2$. The algebraic Ward condition alone
therefore leaves the scalar value undetermined.
[Witten 1988, §3, (3.2)–(3.9) and n. 10](https://www.ias.edu/sites/default/files/sns/%5B109%5DCommMathPhys117-1988.pdf).

## Twistor and infrared scope

For a smooth function $f$ and $(0,1)$ fields $U,V$, the ordinary
projected operator satisfies

$$
(\bar\partial_J^2 f)(U,V)
=U(Vf)-V(Uf)-df([U,V]^{0,1})=df([U,V]^{1,0}).
$$

Atiyah–Hitchin–Singer use the opposite chirality in Theorem 4.1.
Reversing orientation gives integrability of the natural structure on
$S(\Lambda_g^+)$ exactly when $W^+=0$. The E33 nonzero block gives a
noninvolutive point, and a smooth complex-valued function with a
suitable derivative there can be localized by a bump. The failure
occurs already on a gauge parameter at the trivial abelian partial
connection. The round metric gives the ordinary Dolbeault differential.
[Atiyah–Hitchin–Singer, Theorem 4.1, pp. 435–436](../../../../../references/Atiyah.pdf#page=12).

Mason's classical $J,k$ model uses a projected $d^2=0$ identity for
its shift symmetry at nonintegrable $J$. Its Euclidean curve-space
comparison uses the stated reality and local near-line conditions.
Boels–Mason–Skinner derive a flat twistor-to-spacetime perturbative
match with fibrewise holomorphic triviality in the spacetime gauge.
Neither calculation supplies the global real gauge map carrying the
B03 insertion or a Ward functional for its fields.
[Mason v2, §§4–4.2](https://arxiv.org/pdf/hep-th/0507269v2) ·
[Boels–Mason–Skinner v1, §§2–3](https://arxiv.org/pdf/hep-th/0604040v1).

The massive adjoint decoupling has a controlled Coulomb-branch limit.
The subsequent infrared point-operator expansion is near singular
vacua. The argument for suppression away from them uses $b_2^+>1$
and flags a gap for the non-Kähler $b_2^+=3$ case. The homotopy sphere
has $b_2^+=0$, and the B03
constant-scalar locus has no supplied identification with either
singular vacuum or its matter sector. The other precedents retain their
classical or scattering scope recorded in E05. The missing global map
needs to carry the prescribed insertion into a real gauge-domain
reduction on the admitted backgrounds. A value requires a
Ward-compatible pairing for that sector.
[Seiberg–Witten v1, (16.21)–(16.25)](https://arxiv.org/pdf/hep-th/9408099v1) ·
[Witten v1, §§2 and 5](https://arxiv.org/pdf/hep-th/9411102v1) ·
[E05 passage audit](../research-progress/handoffs/RETURN_FTI_E05.md).
