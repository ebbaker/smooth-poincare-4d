# SP4-MASTER-E22 · Critical estimates on a marked harmonic annulus

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded analytical execution of the [frozen packet](../research-progress/handoffs/E22_CRITICAL_HARMONIC_CHART.md).
Requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort
were unavailable to this helper. Verified input commit
`b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a` and SHA-256 prefixes
`c8a9f68da492`, `8b5692f2bcab`, `0c9b1dce4aa6`, `b972bc546624`,
`f93717b0b73c` for the main, `complete_limits`, `variational_comparison`,
`physical_volume` and `first_order_splice` TeX inputs, respectively.

Uniform metric convergence to Euclidean on a supplied buffered harmonic
annulus, with bounded comparison Ricci energy, gives strong interior
$W^{1,4}$ convergence and a full interior $L^2$ curvature bound. The
same conclusion holds with bounded $L^2$ differentiated coordinate
tension. A weaker scale condition on the tension still suffices for
the short-cut comparison because its curvature term is multiplied by
the uniform metric error.

## Fixed-domain estimate

Let $A\subset\mathbb R^4$ be a bounded Euclidean annulus and fix a
smaller closed concentric annulus $A'\Subset A$. Let $m$ be a smooth
Riemannian metric on $A$, $u=m-\delta_{\mathrm{Euc}}$ and
$\eta=\|u\|_{L^\infty(A)}$, with $0\le\eta\le\eta_0$ for a
dimension-dependent $\eta_0>0$. The component norms in the proof are
Euclidean and all integrals are against $dx$, unless otherwise
specified. The small uniform error gives uniform metric ellipticity,
so metric and coordinate $L^2$ curvature norms are comparable. Define
the tension of the Cartesian coordinate functions by
$T^a=\Delta_m x^a=-m^{bc}\Gamma^a_{bc}$, with
$\Delta_m=\operatorname{div}_m\nabla^m$. For
$0\le\chi\le1$ in $C^\infty_c(A)$ equal to one near $A'$, put

$$
L_\chi=\|D\chi\|_4^2+\|D^2(\chi^2)\|_2,\qquad
B_\chi=\|\chi^2\operatorname{Ric}(m)\|_2+\|\chi^2 DT\|_2+\eta L_\chi.
$$

There is a dimensional constant $C$ such that

$$
\|D^2m\|_{L^2(A')}+\|\operatorname{Rm}_m\|_{L^2(A',m)}\le C B_\chi,
\qquad \|Dm\|_{L^4(A')}^2\le C\eta B_\chi. \tag{1}
$$

The only buffer cost in (1) is $L_\chi$. For a cutoff with
$|D^j\chi|\le C_j d^{-j}$ for $j=1,2$, where $d$ is the Euclidean
separation between $A'$ and $\partial A$, it is at most
$C|A|^{1/2}d^{-2}$. The annuli and the cutoff are fixed before any
source limit. No derivative on the boundary of $A$ is assumed.

For the metric equation, the second-derivative terms in the Ricci
formula can be written as

$$
m^{ab}\partial_{ab}u_{ij}=-2\operatorname{Ric}_{ij}(m)
-m_{ia}\partial_j T^a-m_{ja}\partial_i T^a+Q_{ij}(m,Dm),
\qquad |Q(m,Dm)|\le C|Du|^2. \tag{2}
$$

Indeed, with $H^a=m^{bc}\Gamma^a_{bc}=-T^a$, the second-derivative
terms in $2\operatorname{Ric}_{ij}$ are $-m^{ab}\partial_{ab}m_{ij}$
and the symmetric derivatives $m_{ia}\partial_jH^a+m_{ja}\partial_iH^a$.
Differentiating inverse coefficients in this expansion and forming
products of Christoffel symbols gives the stated quadratic bound.
In exact harmonic coordinates $T=0$. For approximate coordinates,
only the displayed symmetric combination of $DT$ is needed in
$B_\chi$, up to a fixed constant. Treating $T^a\partial_a$ as a
vector field on this specified chart, replacing $DT$ by $\nabla^m T$
changes the remainder by $O(|Du|^2)$, since $|T|\le C|Du|$.
[DeTurck–Kazdan, *Ann. Sci. Éc. Norm. Supér.* **14** (1981), Lemma 4.1, (4.2)–(4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf)
· [Avalos–Cogo–Royo Abrego, arXiv:2610.35257v1, (4.1)](https://arxiv.org/html/2610.35257v1#S4)

Write $X=\|\chi^2D^2u\|_2$, $S=\|\chi Du\|_4$ and
$D_\chi=\|D\chi\|_4$. Integrate by parts componentwise in
$\int_A\chi^4|Du|^4$ against $u$. The terms where the derivative
lands on $Du$ or the cutoff give, by Hölder,

$$
S^4\le C\eta\int_A\bigl(\chi^4|Du|^2|D^2u|
+\chi^3|D\chi||Du|^3\bigr)\le C\eta(S^2X+D_\chi S^3).
$$

For $S>0$, divide by $S^2$ and absorb the final linear term in $S$
by Young's inequality. The case $S=0$ already satisfies the result.
This is the critical local Gagliardo–Nirenberg estimate

$$
S^2\le C\eta X+C\eta^2D_\chi^2. \tag{3}
$$

Extend $\chi^2u$ by zero to $\mathbb R^4$. Its Euclidean Hessian
and Laplacian have equal $L^2$ norms by two integrations by parts.
Using the product rule on both quantities gives

$$
X\le \|\chi^2\Delta_{\mathrm{Euc}}u\|_2+C D_\chi S
 +C\eta\|D^2(\chi^2)\|_2.
$$

By (2), $\|m^{-1}-\delta^{-1}\|_\infty\le C\eta$ and the
quadratic structure yield

$$
\|\chi^2\Delta_{\mathrm{Euc}}u\|_2
\le C\bigl(\|\chi^2\operatorname{Ric}(m)\|_2+\|\chi^2 DT\|_2
+\eta X+S^2\bigr).
$$

Use (3) for $S^2$ and
$C D_\chi S\le X/4+C'\eta D_\chi^2$ for the cutoff term, also
from (3) and Young's inequality. The resulting $C\eta X$ is absorbed
by choosing $\eta_0$ small. Thus $X\le C B_\chi$ and (3) improves
to $S^2\le C\eta B_\chi$. The coordinate formula
$|\operatorname{Rm}_{\mathrm{low}}(m)|\le C(|D^2u|+|Du|^2)$ then
gives the full curvature estimate on $A'$. No uniform derivative
bound was used to start the absorption. [Owning curvature formula](../manuscript/first_order_splice.tex#L56)

## Approximate gauge and the flat shear

For a sequence with $\eta_i\to0$ and bounded comparison Ricci
$L^2(A,m_i)$, any bounded $L^2$ norm of the differentiated tension
on the support of the fixed cutoff gives bounded $B_{\chi,i}$.
Smallness of this differentiated term is unnecessary for strong
$W^{1,4}(A')$ convergence. If the Ricci and differentiated tension
terms tend to zero, the full comparison curvature tends to zero in
$L^2(A')$ as well. Even with unbounded tension derivatives,
$\eta_i\|\chi^2DT_i\|_2\to0$ suffices for the strong first-order
conclusion and for $\eta_i\|\operatorname{Rm}_{m_i}\|_{L^2(A',m_i)}\to0$.
Under only this product condition, (1) does not give a uniform
unweighted curvature bound.

In the [E02 shear](../notes/E02_QUANTILE_CHART.md#euclidean-model-in-an-oriented-near-isometric-marking),
$m_n=F_n^*\delta$, where $F_n(y)=y+s_n(y)e_1$ and on the interior
box $Q$ one has $s_n=A_0n^{-2}(\cos(n y_2)+\cos(n y_3))$ with
fixed $A_0>0$. In the flat $z=F_n(y)$ coordinates the first
coordinate function of the original chart is
$z_1-s_n(z_2,z_3)$. Thus on $Q$,

$$
T_n^1=A_0(\cos(n y_2)+\cos(n y_3)),\qquad T_n^2=T_n^3=T_n^4=0.
$$

The derivatives of $F_n$ through order three give global upper
bounds $O(A_0/n)$ for $\eta_n$, $O_{A_0}(1)$ for $\|T_n\|_\infty$
and $O_{A_0}(n)$ for $\|DT_n\|_2$ on a fixed annulus. On $Q$ the
metric component $(m_n)_{12}=\partial_2s_n$ gives a matching
$c A_0/n$ lower bound on $\eta_n$ for large $n$. Averaging the
squared sines on $Q$ gives
$\|DT_n\|_{L^2(Q)}\asymp A_0 n$. Since
$\partial_2(m_n)_{12}=-A_0\cos(n y_2)$ on $Q$,
$\liminf_n\|Dm_n\|_{L^4(Q)}^4\ge 3 A_0^4 |Q|/8$. This metric
has zero Ricci and full curvature. It exhibits failure at
nonvanishing $\eta_n\|DT_n\|_{L^2(Q)}$ and rules out substituting
uniformly bounded undifferentiated tension or bilipschitz control
for the differentiated estimate. The inverse shear restores exact
harmonic coordinates on the same marked support, as in E02.

## Short marked cut on the original source

Use a single oriented smooth embedding of a fixed annulus with a
fixed buffer around $\{-1<\log|x|<1\}$ into each member of the
smooth closed oriented homotopy-sphere sequence. Require that its
middle sphere separates both complete specified chiral mass sets
and that these sets are outside the modified strips. The metric
$m_i$ in (1) must be the comparison metric actually spliced, a
smooth positive conformal multiple of the physical pullback. A
constant physical rescaling inherits the physical full curvature
budget. A variable conformal representative requires its own
Ricci bound in this chart. Chiral energies are measured on the
source using the Hilbert–Schmidt norm on the real $\Lambda^\pm$
blocks. Pullback and conformal multiplication preserve their
integrals on the compared sets. [Owning measure convention](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L160)

Take $A'$ containing the support of the fixed straightening cutoff
$\psi$ from `prop:short-cut`, with $\psi=1$ for
$|\log|x||\le1/4$ and $\psi=0$ for $|\log|x||\ge3/4$.
For $m_{i,s}=\delta+(1-s\psi)(m_i-\delta)$, $0\le s\le1$,
let $d_i=\|Dm_i\|_{L^4(A')}$ and
$K_i=\|\operatorname{Rm}_{m_i}\|_{L^2(A',m_i)}$. The owning
splice estimate writes the chiral matrix density of $m_{i,s}$
as $(1-s\psi)$ times that of $m_i$, plus an $L^2$ error of size
at most

$$
\Delta_i=C_\psi(d_i+d_i^2+\eta_i+\eta_iK_i)
\le C_\psi\bigl(\sqrt{\eta_i B_{\chi,i}}+\eta_i B_{\chi,i}+\eta_i\bigr).
$$

For an incoming energy $q_{i,j}$ on the modified portion of
either side, the resulting signed excess over that raw portion
is bounded above by $2\sqrt{q_{i,j}}\Delta_i+\Delta_i^2$.
The same bound on the union holds uniformly along the path.
These are upper bounds on the excess with the incoming energy
subtracted. In the fixed energy band $q_{i,j}$ is uniformly
bounded. Bounded $B_{\chi,i}$ gives the hypotheses of the
stated short-cut proposition. Under the weaker product condition
$\eta_i B_{\chi,i}\to0$, the same proof applies using the
displayed splice error directly. The full curvature bound enters
that proof only through $\eta_i K_i$.
[Owning splice calculation](../manuscript/first_order_splice.tex#L53)
· [Owning short-cut path](../manuscript/variational_comparison.tex#L21)

If $Y([g_i])>0$, $e_i=E_+(g_i)\le8\pi^2-\delta$ and
$e_i\to I^+(M)$, the $o(1)$ upper excess keeps the joined path
below the zero-Yamabe energy threshold. Stretching the resulting
exact round product changes neither chiral energy. The owning
argument tests each complete side on a long joined source to give
positive Yamabe caps, with the above excess bound on each cap. On
a hypothetical nonstandard $M$, the smaller of the two incoming
side masses must then tend to zero. Two fixed positive masses
separated by the supplied marked sphere give the contradiction.
The local estimate supplies convergence and costs once this
chart exists. Obtaining a single harmonic or sufficiently
approximately harmonic embedding of the whole buffered annulus,
including its marking of both sides, from a small-curvature block
remains a separate geometric premise.
[Zero-Yamabe threshold and short-cut cap test](../manuscript/variational_comparison.tex#L1)
