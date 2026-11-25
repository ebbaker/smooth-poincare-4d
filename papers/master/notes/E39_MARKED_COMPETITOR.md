# SP4-MASTER-E39 · Finite marked replacement and positive assembly

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E execution of the finite fixed-type comparison.
Actual serving model and reasoning effort were unavailable. The mathematical
inputs are frozen at `2689540e6dae1656b7f5ad4be52504db044995f2`. The
parallel program and fixed-type launch are from the subsequent setup commit
`a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`.

| Verified input | SHA-256 prefix |
| --- | --- |
| [Master variational comparison](../manuscript/variational_comparison.tex) | `0c9b1dce4aa6` |
| [Master physical volume](../manuscript/physical_volume.tex) | `b972bc546624` |
| [First-order splice](../manuscript/first_order_splice.tex) | `f93717b0b73c` |
| [E03 joint selection](E03_JOINT_SELECTION.md) | `8e09d60395f9` |
| [E17 normal-ball test](E17_DIFFUSE_REPAIR.md) | `008b6b25e030` |
| [E20 closed variation](E20_CLOSED_VARIATION.md) | `0d637f3ddede` |
| [E21 round restart](E21_ROUND_RESTART.md) | `fe25b0b69af4` |
| [Parallel program](../continuation-notes/PARALLEL_PROGRAM_20261125.md) | `558ee0badcbd` |
| [Fixed-type launch](../01_fixed_type_variational_descent/continuation-notes/CONTINUATION.md) | `2ae48578e45d` |

## Source marks and the signed comparison

Let $M$ be a smooth closed connected oriented homotopy four-sphere. Use
smooth positive-definite Riemannian metrics and the positive real Weyl
block with Hilbert–Schmidt norm. Fix one smooth volume-one Yamabe
minimizing sequence $g_i$ in positive classes, with
$e_i=E_+(g_i;M)\to I=I^+(M)$ and $e_i\le8\pi^2-\delta$ for
$\delta>0$. Write $Y_i=R_{g_i}\ge y_0=\sqrt{48\delta}$,
$s_i=e_i-I$, and use the physical source measures

$$
\mu_i=dV_{g_i},\qquad
\lambda_i=|W^+_{g_i}|_{\rm HS}^2\,dV_{g_i},\qquad
\nu_i=|\mathrm{Rm}_{g_i}|_{\rm tens}^2\,dV_{g_i}.
$$

Here $4\lambda_i\le\nu_i$ and $\nu_i(M)$ is bounded. For a fixed E03
tolerance, window and curvature ceiling $\zeta$, take the actual finite
family of oriented smooth marked parameter disks $\Omega_{ij}$.
Their markings use the positive-Ricci distance. All three measures
above use $g_i$. A scale or chart estimate in the physical gauge below
is a separate hypothesis. In E03 notation $G_\zeta$ consists of the
Euclidean regular points with $\nu(\{x\})<\zeta$. At fixed marks the
complement of the disks has

$$
\limsup_i\lambda_i\!\left(M\setminus\bigcup_j\Omega_{ij}\right)
\le (I-\lambda(X))+\lambda(X\setminus\mathcal R)
+\lambda\bigl(\{x\in\mathcal R:\nu(\{x\})\ge\zeta\}\bigr)+\varepsilon.
$$

These are escape, nonregular mass, excluded atoms and selection loss.
This bound supplies no control of the Yamabe form of a new metric.
The physical volume of that metric may change again when it is put in
Yamabe gauge. [E03 limits and marking](E03_JOINT_SELECTION.md)

Evaluate one smooth metric $k_i$ on the same oriented $M$, with
boundary collars matched before gluing. A copy of a marked disk
identified by its original parametrization gives the same smooth
manifold. A comparison using a different exterior requires an actual
oriented diffeomorphism from its closed assembly to $M$. Pull the
metric back by it before applying the following estimates.

Take $A_i=\bigcup_j\Omega_{ij}$, $C_i$ the rest of the specified
connecting and transition geometry, counted outside $A_i$, and
$X_i=M\setminus(A_i\cup C_i)$. Count each point once and charge every
splice in the piece where it lies. Piece boundaries can be assigned
arbitrarily when they are smooth and hence null for the energy
measures. For any piece $U$ write $c_i(U)=E_+(k_i;U)-\lambda_i(U)$.
Suppose the comparison gives an incoming-mass lower bound $m_i$
on $A_i$, a new-energy upper bound $b_i$ on $A_i$, and signed upper
bounds $c_i(C_i)\le\Gamma_i$ and $c_i(X_i)\le\Xi_i$. Then

$$
e_i-E_+(k_i;M)\ge m_i-b_i-\Gamma_i-\Xi_i.
\tag{1}
$$

An exactly conformally retained exterior has $\Xi_i=0$. An exterior
whose metric is changed can conservatively be charged its entire new
energy if no sharper signed bound is available. For the strict
comparison the right-hand side must exceed $s_i$ at an actual index
where $Y([k_i])>0$. A positive limiting lower bound is sufficient.
There is one minimizing excess $s_i$ for the assembled metric,
independent of the number of disks. Closed signature also forces
$\sum_U(c_i^+(U)-c_i^-(U))=0$. Thus an exterior fixed up to conformal
change preserves the local chiral imbalance of the entire changed
region. An isolated disk with fixed collars has the same constraint
by gluing that disk alone, irrespective of its Yamabe sign. These
constraints apply to the full differences, including transitions.
[Master one-sided comparison and signature convention](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

## Positivity from the source Yamabe form

For a fixed index suppress $i$ and set
$Q_p(w)=\int_M(6|dw|_p^2+R_p w^2)dV_p$. The Yamabe inequality
$Q_g(w)\ge Y\|w\|_{4,g}^2$ applies to every real $H^1$ test.
Put $J=dV_k/dV_g$. Suppose for some $0<\alpha\le1$ the
contravariant density satisfies $J k^{-1}\ge\alpha g^{-1}$
as quadratic forms on covectors. On the disjoint pieces covering
$M$ define the scalar loss by

$$
B^2=\sum_{U}\big\|(\alpha Y-JR_k)_+\big\|_{L^2(U,g)}^2 .
$$

If the metric is physically unchanged on a piece, its contribution
is zero. Hölder on the actual source gives

$$
Q_k(w)\ge\alpha Q_g(w)-B\|w\|_{4,g}^2
\ge(\alpha Y-B)\|w\|_{4,g}^2.
$$

If $B<\alpha Y$, then
$Y([k])\ge(\alpha Y-B)/\sqrt{\sup_M J}>0$.
The lower comparison of gradient densities permits order-one metric
changes. The scalar deficit includes any loss of the old positive
potential. If $D$ is the whole changed support, one useful bound is

$$
B\le \alpha Y\sqrt{\mu(D)}+
\big\|J(R_k)_-\big\|_{L^2(D,g)} .
\tag{2}
$$

The sum of squared scalar losses over disjoint regions controls the
whole form. Independent bounds below the threshold on each region
do not imply the assembled bound.

The same argument applies in a fixed common conformal gauge
$b=f^2g$, where $f>0$ is smooth. Use the corresponding representative
$k$ of the candidate and $J=dV_k/dV_b$. Replace $Y$ in the pointwise
scalar deficit by $R_b$, with $Y([b])=Y$ still the Sobolev threshold.
Where $k=b$ the deficit vanishes if $R_b\ge0$. This applies directly
to the positive-Ricci source gauge of E03, with the scalar norms
taken in that gauge.

If $R_b$ has a negative part on the retained region, comparing to
$Q_b$ at coefficient one avoids charging that region. Suppose $k=b$
off $D$ in the common gauge. Let $\theta$ be the least number in
$[0,1]$ with $Jk^{-1}\ge(1-\theta)b^{-1}$. Let
$B_b=\|(R_b-JR_k)_+\|_{L^2(b)}$ and
$L_D=\|d\log f\|_{L^4(D,b)}$. Conformal covariance gives
$Q_b(w)=Q_g(fw)$ and $\|w\|_{4,b}=\|fw\|_{4,g}$.
Also $\|dw+w\,d\log f\|^2_{L^2(b)}=\|d(fw)\|^2_{L^2(g)}$,
so the gradient over $D$ is bounded by

$$
\|dw\|_{L^2(D,b)}
\le (6^{-1/2}+L_DY^{-1/2})Q_b(w)^{1/2}.
$$

Consequently $Q_k(w)\ge(1-\rho)Q_b(w)$ if
$\rho=6\theta(6^{-1/2}+L_DY^{-1/2})^2+B_b/Y$,
and $\rho<1$ suffices with the same denominator comparison.
An unrestricted conformal factor can make $L_D$ large. The form
comparison is with one specified background on the assembled source.
[Lee–Parker, *The Yamabe Problem*, Bull. AMS 17 (1987), §2, (2.7),
and §3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

## An explicit simultaneous cutoff on the actual marks

Here is a conditional construction giving estimates for both (1)
and (2). On the actual disks fix finitely many oriented comparison
domains $\Phi_{ia}:U_a\hookrightarrow M$ with disjoint interiors,
including any additional changed strip in the family and keeping
the rest of the intervening region physically fixed. The domains
$U_a$ are fixed bounded smooth Euclidean domains, with smooth
extensions of the markings. A single common chart, if it is supplied,
can instead cover several disk cores and a connector with one cutoff.
All changed strips must lie inside the specified domains. At each
source index assume the **constant** physical normalizations

$$
m_{ia}=r_{ia}^{-2}\Phi_{ia}^{*}g_i,\qquad
a_{ia}=\|m_{ia}-\delta_{\rm Euc}\|_\infty,\qquad
d_{ia}=\|D m_{ia}\|_{L^4(U_a)},\qquad
K_{ia}=\|\mathrm{Rm}_{m_{ia}}\|_{L^2(U_a,m_{ia})}.
$$

The $r_{ia}$ need not be the witness radii in the positive-Ricci
distance. Assume $a_{ia}$ uniformly small so the charts are
pointwise comparable to Euclidean. Choose fixed smooth
$0\le\chi_a\le1$, one near the chart boundary and zero on the
closed core $F_a\Subset U_a$. Put
$n_{ia}=\delta_{\rm Euc}+\chi_a(m_{ia}-\delta_{\rm Euc})$.
Restore scale $r_{ia}^2$ in each chart and use $g_i$ everywhere
else. This gives the assembled smooth $k_i$ on $M$ and retains
the original parametrizations on all faces. Let $D_i$ be the
union of the images of the supports of $1-\chi_a$ and $F_i$ the
union of the marked cores. The change outside $D_i$ is zero.

The constant principal second-derivative map of all-lowered
curvature cancels in
$\mathrm{Rm}_{\rm low}(n_{ia})-\chi_a\mathrm{Rm}_{\rm low}(m_{ia})$.
Its commutators have one derivative of $m_{ia}$ or none.
The quadratic first-derivative parts have $L^2$ cost bounded by
$C(d_{ia}^2+a_{ia}+d_{ia})$. The scalar contraction including
the relative volume density, and the chiral projection including
the square-root volume density, vary by $O(a_{ia})$ as algebraic
maps on all-lowered curvature. For
$\xi_{ia}=C_a(a_{ia}K_{ia}+a_{ia}+d_{ia}+d_{ia}^2)$ this gives
both estimates

$$
\begin{aligned}
\|J_{ia}R_{n_{ia}}-\chi_aR_{m_{ia}}\|_{L^2(m_{ia})}
 &\le \xi_{ia},\qquad J_{ia}=dV_{n_{ia}}/dV_{m_{ia}},\\
\|F_+(n_{ia})-\chi_aF_+(m_{ia})\|_{L^2(dx)}
 &\le \xi_{ia}.
\end{aligned}
\tag{3}
$$

Here $F_+(m)$ is the matrix of the positive Weyl block in the
oriented frame from the positive matrix square root, multiplied by
$(\det m)^{1/4}$. Its squared Euclidean $L^2$ norm is local chiral
energy. The constants depend on the fixed domains and cutoffs.
The scalar estimate uses the density $J_{ia}$ because it compares
potentials in one common measure. The normalized scalar term
$R_{m_{ia}}=r_{ia}^2Y_i$ is nonnegative. In dimension four the
scalar-density $L^2$ comparison in (3) is unchanged by restoring
the same constant scale to both metrics. [Master first-order
curvature cancellation](../manuscript/first_order_splice.tex)

Write $Z_i=(\sum_a\xi_{ia}^2)^{1/2}$ and
$A_i'=\max_a a_{ia}$. The gradient-density comparison on
all of $M$ has $\alpha_i=1-C A_i'>0$ for $A_i'$ small.
By (3) on the changed support
$(\alpha_i R_{m_{ia}}-J_{ia}R_{n_{ia}})_+
\le\alpha_i R_{m_{ia}}+
|J_{ia}R_{n_{ia}}-\chi_aR_{m_{ia}}|$.
It follows that $B_i\le\alpha_iY_i\sqrt{\mu_i(D_i)}+Z_i$.
In particular the strict inequality

$$
Z_i<\alpha_iY_i\big(1-\sqrt{\mu_i(D_i)}\big)
\tag{4}
$$

suffices to admit this candidate. Independently, stability of the
coefficient $0\le\chi_a\le1$ in (3) gives

$$
e_i-E_+(k_i;M)\ge
\lambda_i(F_i)-2\sqrt{\lambda_i(D_i\setminus F_i)}\,Z_i-Z_i^2.
\tag{5}
$$

Indeed the assembled chiral $L^2$ norm on $D_i$ is bounded above
by $\sqrt{\lambda_i(D_i\setminus F_i)}+Z_i$, and the exterior
retains its entire energy. An additional changed exterior must
be included in both the scalar-form test and the energy ledger (1).
For this cutoff alone, (4) and a right-hand side of (5) greater
than $s_i$ give the strict same-type competitor.

For example, on the common subsequence, if
$\mu_i(D_i)\le 1-\kappa$ with fixed $\kappa>0$,
$\inf_i\alpha_i>0$, $Z_i\to0$, and
$\liminf_i\lambda_i(F_i)>0$, then (4) and (5) hold for all
sufficiently large $i$. The core-mass premise can be checked by
inclusion of actual joint continuity inner balls of positive
limiting $\lambda$-mass. Low cost on all selected disks or an
independent complement estimate is unnecessary for this strict
comparison. In a refinement the family, cutoffs and collars must
first be fixed, and any later diagonal must retain the scalar
margin and the signed energy comparison at each stage.

In a positive-scalar conformal background $b_i$, the same chart
calculation with $m_{ia}=r_{ia}^{-2}\Phi_{ia}^*b_i$ gives the
sufficient scalar comparison
$Z_i+\alpha_i\|R_{b_i}\|_{L^2(D_i,b_i)}<\alpha_iY_i$.
One can refine the scalar bound by retaining only
$(\alpha_i-\chi_a)_+ R_{m_{ia}}$ in each chart. The chiral ledger
still uses $\lambda_i$ by conformal invariance.
The physical bound on $\nu_i$ controls $K_{ia}$ in the
constant-rescaled physical version of (3). It gives no corresponding
bound on the comparison scalar or full curvature for a variable
conformal change without additional estimates.

## Positive assembly by a boundary form

For a fixed $i$, divide the actual marked source into finitely many
compact smooth pieces $P_a$ with pairwise matched smooth faces and
no corners. A connector can be included in the exterior piece or
treated as its own piece with both faces matched. Assume the glued
metric is smooth. For a smooth piece metric $p$ write $L_p=-6\Delta_p+R_p$
with $\Delta_p=\nabla^j\nabla_j$. Suppose first that every piece
has strictly positive first **Dirichlet** eigenvalue. Bounded
scalar potential and this eigenvalue imply coercivity on $H^1_0(P_a)$,
by bounding the gradient by the quadratic form and the $L^2$ norm.
For every $H^{1/2}$ trace $\tau_a$ there is a unique weak solution
$H_a\tau_a$ of $L_p H_a\tau_a=0$ with that trace. This follows by
subtracting a trace extension and solving with the coercive form
on $H^1_0(P_a)$. Let $\Lambda_a$ be its outward conormal
Dirichlet-to-Neumann form, including the coefficient $6$ and the
induced boundary measure. Thus
$\langle\Lambda_a\tau_a,\tau_a\rangle=Q_{p;P_a}(H_a\tau_a)$
by the weak equation. When a piece has several faces the form
acts on their whole trace vector.

For every global $H^1$ test $w$, the two copies of its trace on
each matched face agree under the marking. Write $w|_{P_a}
=H_a\tau_a+z_a$ with $z_a\in H^1_0(P_a)$. The cross terms vanish.
Conversely compatible traces glue to a global $H^1$ test using
these harmonic extensions. It follows that the closed first
eigenvalue is positive precisely when every piece has positive
first Dirichlet eigenvalue and

$$
\sum_a\langle\Lambda_a\tau_a,\tau_a\rangle>0
\quad\text{for every nonzero compatible trace vector } \tau.
\tag{6}
$$

For necessity extend zero-trace tests by zero and test glued
harmonic extensions. For sufficiency the decomposition gives
strict positivity on each nonzero test. The lowest closed
eigenvalue is attained by compactness on the fixed smooth
manifold, so it is positive, and its form controls $H^1$ and
hence the Yamabe denominator. Positivity of each interior
Dirichlet form alone misses this check on traces. For the
abstract scalar Schrödinger form $6\int|dw|^2-\epsilon\int w^2$
on a closed manifold, every piece with boundary has positive
Dirichlet form for small enough $\epsilon>0$, but the global
constant has negative form.

There is a sufficient version using only one-sided estimates on the
changed boundary forms. For the positive physical source $g_i$ use the
same partition. Its assembled boundary form is
$\mathcal C_g(\tau)=\inf\{Q_g(w):\mathrm{Tr}\,w=\tau\}$, by
the same decomposition. Retain the exterior piece physically and
assume the new interiors have positive Dirichlet eigenvalues.
On each interface $\Sigma_j$ suppose the budget for any reduction
of the assembled boundary form is
$\beta_j\|\tau_j\|_{L^2(\Sigma_j,g)}^2$, $\beta_j\ge0$.
This can be verified piecewise by bounding each change of its
whole boundary form below by a sum of such terms on its faces
and combining the coefficients on shared faces. A sufficient
capacity bound is
$\sum_j\beta_j\|\tau_j\|_2^2\le \rho\,\mathcal C_g(\tau)$
for all compatible traces and some $\rho<1$.

For one explicit bound, choose disjoint actual source collars
$V_j$ of widths $t_j>0$ with known trace constants $T_j$. The
required trace inequality is

$$
\|\tau_j w\|_2^2\le
T_j\left(t_j\|dw\|_{L^2(V_j,g)}^2+
t_j^{-1}\|w\|_{L^2(V_j,g)}^2\right).
$$

It follows by integrating the one-dimensional trace inequality
in marked product coordinates with bounded metric/volume comparison,
with those constants absorbed into $T_j$. Hölder, disjointness
and the source Yamabe inequality prove the capacity bound when

$$
\rho=\frac{\max_j(\beta_j T_j t_j)}6+
\frac{\big(\sum_j(\beta_j T_j t_j^{-1}\mu_i(V_j)^{1/2})^2\big)^{1/2}}
{Y_i}<1 .
\tag{7}
$$

To see this, bound the weighted sum of the collar $L^2$-test
terms by Cauchy–Schwarz against the sequence
$\|w\|_{L^4(V_j,g)}^2$. Then infimize the resulting inequality
over tests with the given trace. Equations (6)–(7) permit large
changes in the interiors. They require actual collar constants
and bounds for the change of the boundary forms, including any
changed connector. E03 topological marks give neither estimate.
Uniformity of (7) across source indices is an additional input
if one wants a uniform margin.

## Scope for the diffuse, closed and restart branches

- E03 selects measured witnesses on the required common sequence.
  It gives no strong physical metric closeness in their marks, no
  core inclusion in coordinates with controlled derivatives, and
  no signed boundary-form comparison for general fills. Thus (4)–(5)
  exclude a charged diffuse family *if* those geometric bounds are
  supplied. For the controlled normal-jet families of E17, the
  boundary-fixed lower bound holds on each disk, and summing a
  fixed finite family preserves it to leading order. Its flat-core
  radial cutoff has strictly positive leading energy cost on a
  disk with nonzero incoming positive Weyl block. On a fixed smooth
  metric at radius $r$, $a+d=O(r^2)$ gives $\xi=O(r^2)$, so both
  error terms in (5) are $O(r^4)$, the scale of the incoming chiral
  mass. Coupled changes to the intervening geometry are outside the
  E17 calculation.
- At closed attainment $s_i=0$ for a constant source sequence and
  small smooth changes are positive by the form estimate or spectral
  openness. A strict energy estimate is then the entire additional
  issue. E20 supplies a Ricci-direction Hessian with no universally
  negative sign in the surviving non-Einstein class. The new assembly
  criteria leave that sign and closed rigidity unresolved.
- For the round restart of E21, the exact marked evacuated disk graft
  has the same conformal class via its marked diffeomorphism. Its
  old and new local chiral measures agree and the entire signed
  gain is zero. It therefore satisfies positivity with no strict
  competitor and can repeat. For a genuinely changed same-type restart,
  write $V_i$ for the actual full raw energy-bearing exterior and
  $\sigma_i=E_+(c_i;M)-\lambda_i(V_i)$ for the net cap surcharge.
  Even with positivity checked, a strict competitor requires
  $e_i-\lambda_i(V_i)-\sigma_i>s_i$. In the wholly evacuated
  round comparison and in the physically saturated round alternative,
  the inherited $o(1)$ estimates on both terms provide no relative
  rate or sign. No termination follows for either comparison
  from these positivity criteria.
