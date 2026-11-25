# SP4-MASTER-E01 · Flattening one marked ball and inserting a round region

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded analytical execution of the
[frozen packet](../research-progress/handoffs/E01_LOCAL_ENTRY.md).
Requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort
were unavailable to this helper. Committed inputs at
fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2. All four master TeX hashes
matched the packet. The seed, point and cutoff are fixed, with arbitrary
bulb scale or neck length at each sufficiently small radius.

## First transition and chiral energy

Let $M$ be a smooth closed connected oriented four-manifold and $h$
a smooth Riemannian metric. Take oriented $h$-normal coordinates $x$
centered at $p$ and put $\rho=|x|$. Use the Hilbert–Schmidt norm on
the real Weyl endomorphisms of $\Lambda^\pm$. Set
$b(t)=e^{-1/t}$ for $t>0$, $b(t)=0$ otherwise, and
$\eta(t)=b(2-t)/(b(2-t)+b(t-1))$. Thus $\eta=1$ on $t\le1$ and
$\eta=0$ on $t\ge2$. Set $h_r=h+k_r$ where
$k_r=\eta(\rho/r)(\delta-h)$ on the chart and $k_r=0$ outside.
This smooth positive definite convex combination equals the Euclidean
metric on the marked $B_r$ and agrees with $h$ off $B_{2r}$.

Ordinary normal-coordinate estimates give
$\|\partial^j k_r\|_\infty=O_{h,j}(r^{2-j})$ for fixed $j\ge0$.
Here $h-\delta=O(\rho^2)$ and $\partial h=O(\rho)$, and each derivative
of the cutoff costs a factor $r^{-1}$. The second derivatives and
the first-derivative squares in the coordinate curvature formula
therefore give $|\operatorname{Rm}(h_r)|_{h_r}=O_h(1)$ on $B_{2r}$.
The annular transition has both chiral energies and full curvature-square
integral $O_h(r^4)$. More explicitly, with the round sign convention
$R_{ikjl}=\delta_{ij}\delta_{kl}-\delta_{il}\delta_{kj}$, put
$H_{ij}(y)=-R_{ikjl}(h,p)y^k y^l/3$. Under $D_r(y)=ry$,
$r^{-2}D_r^*h_r=\delta+r^2(1-\eta(|y|))H(y)+O(r^3)$ in each fixed
$C^j(B_2)$ norm. For $\mathcal W^\pm_\delta$ the linearized chiral
Weyl endomorphism at $\delta$, critical scale invariance gives
\[
 \begin{aligned}
 E_\pm(h_r;A_{r,2r})
   &=r^4\int_{A_{1,2}}|\mathcal W^\pm_\delta((1-\eta)H)|^2\,dy+O_h(r^5),\\
 E_\pm(h_r)-E_\pm(h)
   &=E_\pm(h_r;A_{r,2r})-r^4|B_2|_\delta|W^\pm(h,p)|^2+O_h(r^5).
 \end{aligned}
\]
The net difference includes the removed seed energy.

## Second transition and rescaled models

Choose $g_{r,u}=u^2h_r$ with $u$ smooth and positive, identically one
outside $B_{r/2}$. All overlaps of the insertion are then conformally
Euclidean and have exactly zero chiral Weyl energy. Two explicit
factors give the desired shapes.

- **Bulb.** Set $\log u=\eta(4\rho/r)\log(2\epsilon/(\epsilon^2+\rho^2))$
  for $\epsilon>0$. In coordinates $x=\epsilon y$ its exact core on
  $|y|\le r/(4\epsilon)$ has metric $4(1+|y|^2)^{-2}\delta$,
  scalar curvature $12$, and volume tending to $8\pi^2/3$ when
  $\epsilon/r\to0$. The round volume outside the core is
  $O((\epsilon/r)^4)$ by radial integration.
- **Neck.** Put $d=r/4$, $a=d e^{-L}$, $L>0$, $\psi=\eta(2\rho/a)$
  and $\xi=\eta(\rho/d)$. Set $\log u=\xi[\psi\log(2a/(a^2+\rho^2))+
  (1-\psi)\log(1/\rho)]$, using the smooth round factor at the
  center. On $a\le\rho\le d$ the metric is $dt^2+g_{S^3}$ for
  $t=\log(\rho/a)$, with length $L$, scalar curvature $6$ and volume
  $2\pi^2L$. The inner overlap $a/2<\rho<a$ gives one fixed smooth
  rescaled metric in $x=ay$ and bounded physical curvature.
  The outer overlap is $d<\rho<2d$.

On either outer overlap the full physical curvature can be large.
For $\varphi=\log u$, the conformally Euclidean Schouten formula gives
\[
 \left|\operatorname{Rm}(u^2\delta)\right|_{u^2\delta}
 \le C u^{-2}(|D^2\varphi|+|D\varphi|^2),\qquad
 R_{u^2\delta}=-6u^{-3}\Delta_\delta u .
\]
For $j=1,2$ on the outer bulb overlap,
$|D^j\varphi|\le C_jr^{-j}(1+|\log(2\epsilon/(\epsilon^2+r^2))|)$.
The logarithm before multiplication by the cutoff varies by a bounded
amount on that overlap. The analogous neck estimate is
$C_jr^{-j}(1+|\log r|)$. The two chiral measures coincide pointwise
for $g_{r,u}$ and $h_r$ on all of $M$: the star on two-forms is unchanged,
the Weyl endomorphism scales by $u^{-2}$ and the volume by $u^4$.

## Yamabe constant and continuity

Use $\Delta=\operatorname{div}\nabla$ and
$Q_g(f)=\int(6|df|^2+R_g f^2)\,dV_g$ with quotient
$Q_g(f)/\|f\|_{4,g}^2$ on nonzero $H^1$ tests.
Conformal covariance gives $Q_{g_{r,u}}(f)=Q_{h_r}(uf)$ and
$\|f\|_{4,g_{r,u}}=\|uf\|_{4,h_r}$. Multiplication by $u$ is an
invertible map on $H^1$ at each fixed parameter value, so
$Y([g_{r,u}])=Y([h_r])$ exactly, independently of the insertion.
[Lee–Parker, §2, (2.7), p. 43](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf#page=7)

The inverse metric and volume coefficients differ uniformly by $O(r^2)$.
The scalar density difference $R_{h_r}dV_{h_r}/dV_h-R_h$ is supported
in $B_{2r}$, bounded pointwise and $O(r^2)$ in $L^2(h)$.
Consequently
\[
 \left|Q_{h_r}(f)-Q_h(f)\right|\le C r^2
    \big(\|df\|_{2,h}^2+\|f\|_{4,h}^2\big),\qquad
 \|f\|_{4,h_r}^2=(1+O(r^2))\|f\|_{4,h}^2 .
\]
When $\|f\|_{4,h}=1$ the scalar term is bounded by $\|R_h\|_{2,h}$.
The quotient difference is $O(r^2)(1+|Q_h(f)|)$, so the uniform
lower bound $Q_h(f)\ge-\|R_h\|_{2,h}$ permits taking an infimum for
the lower estimate. A minimizing sequence for $h$ gives the upper
estimate. Thus $Y([g_{r,u}])=Y([h])+O_h(r^2)$ for all insertions.
Both fixed nonzero signs persist.

## Scalar-flat endpoint

If $Y([h])=0$, take its smooth scalar-flat representative $g=v^2h$,
with $v(p)=1$, and set $\widetilde g_r=v^2h_r$. This is supplied by
the Yamabe minimizer. [Schoen, §3, Theorem 3 and its variational proof](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf#page=15)

There is an order-$r^6$ sign test in the same $h$-normal coordinates.
Set $K(y)=-\eta(|y|)H(y)$,
$P(K)=\partial_i\partial_jK_{ij}-\Delta_\delta\operatorname{tr}K$,
and $c_\eta=\frac1{12}\int_{\mathbb R^4}\eta(|y|)|y|^2\,dy>0$.
Let $K^{\mathrm{TT}}$ be the Fourier projection onto transverse
trace-free symmetric tensors at each nonzero frequency. The sign
of $Y([h_r])$ equals the sign of a real number with expansion
\[
 s_r=r^6\left[
       -c_\eta\langle\operatorname{Ric}_g(p),\operatorname{Ric}_h(p)\rangle_\delta
       -\frac14\int_{\mathbb R^4}|\partial K^{\mathrm{TT}}|^2\,dy
          \right]+o(r^6). \tag{1}
\]

To verify (1), split $H^1(M)=\mathbb R\oplus V$ with $V$ the $g$-mean-zero
subspace. The restriction $q_r=Q_{\widetilde g_r}|_V$ is uniformly
coercive by Poincaré, Sobolev and the previous form comparison
applied to $\widetilde g_r$ and $g$. Define
$b_r(w)=\int R_{\widetilde g_r}w\,dV_{\widetilde g_r}$ and
$F(\widetilde g_r)=\int R_{\widetilde g_r}\,dV_{\widetilde g_r}$.
Completing the square gives $s_r=F(\widetilde g_r)-b_r q_r^{-1} b_r$,
using the polarized restriction. A positive $s_r$ gives coercivity
on the full space for fixed $r$, a negative one gives a negative test,
and $s_r=0$ gives a nonnegative form with a nonzero kernel.

The perturbation $v^2k_r$ on $B_{2r}$ is $r^2K(x/r)+O(r^3)$ with
scaled derivatives through order two. Since $R_g=0$, the first
variation of $F$ is $-\int\langle\operatorname{Ric}_g,v^2k_r\rangle_g\,dV_g$,
by the scalar linearization and integration of its divergence terms.
The radial moment $\int\eta y^k y^l\,dy=\frac14\delta^{kl}
\int\eta |y|^2\,dy$ gives the first term of (1). The quadratic term
of $F$ is $r^6B_\delta(K)+o(r^6)$, where $B_\delta(K)$ is the
coefficient of $\theta^2$ in $F(\delta+\theta K)$ on Euclidean space.
In the scalar-density formula its leading terms have the forms
$k_r\partial^2 k_r$ and $(\partial k_r)^2$, each $O(r^2)$ on a set
of volume $O(r^4)$. Their coefficients tend to the flat coefficients
in scaled coordinates. Terms containing a derivative of the background
and fewer perturbation derivatives, or an extra factor of $k_r$,
are $o(r^2)$ pointwise.

The leading scalar density is $P(K)(x/r)+O(r)$ on $B_{2r}$, and zero
outside. The error is $O(r^4)$ in the dual of $H^1$ by Hölder.
Let $S=(-6\Delta_\delta)^{-1}P(K)$ in $\dot H^1(\mathbb R^4)$.
The Newtonian kernel and the two derivatives in $P$ give
$S=O(|y|^{-4})$ and $\partial S=O(|y|^{-5})$ at infinity.
Cut off $r^2S(x/r)$ at a fixed coordinate radius and subtract its
$g$-mean to obtain $S_r\in V$. Its Dirichlet norm is $O(r^3)$.
On $V$, $q_r(S_r,\cdot)=b_r+o(r^3)$ in the $H^1$ dual.
The flat Dirichlet equation holds before cutoff, and the cutoff
error is $O(r^6)$. The error in replacing its Dirichlet coefficients
by those of $g$ is $o(r^3)$ by rescaling and dominated convergence
using $\partial S\in L^2$ and $g(ry)\to\delta$. Replacing $g$ by
$\widetilde g_r$ uses the previous form bound. The subtracted mean
is $O(r^6(1+|\log r|))$ and its scalar-form contribution is negligible.
Coercivity and $b_r=O(r^3)$ in the dual now give
$b_r q_r^{-1}b_r=r^6\int P(K)(-6\Delta_\delta)^{-1}P(K)\,dy+o(r^6)$.

At each nonzero frequency write $K=K^{\mathrm{TT}}+2\partial_{(i}X_{j)}
+2f\delta$. This decomposition first subtracts the transverse
trace, then the components involving the frequency direction.
The flat scalar-curvature integral has zero quadratic pairing with
the gauge term by diffeomorphism invariance at its flat stationary
metric, or by the linearized contracted Bianchi identity.
On the transverse trace-free part one has
$\operatorname{Ric}'=-\Delta_\delta K^{\mathrm{TT}}/2$ and $R'=0$,
so $B_\delta(K^{\mathrm{TT}})=-\frac14\|\partial K^{\mathrm{TT}}\|_2^2$.
The pairing with $2f\delta$ vanishes by trace-freeness. For $2f\delta$
alone, $B_\delta=6\|df\|_2^2$ by conformal covariance and
$P=-6\Delta_\delta f$, so this sum cancels the scalar correction.
These identities apply to the Fourier components by their degree-two
quadratic symbols and $\dot H^1$ integrability. This proves (1).

In fact $Y([h_r])=\operatorname{Vol}(M,g)^{-1/2}s_r+o(r^6)$.
To see this, put $z_r=q_r^{-1}b_r=O(r^3)$ in $H^1$ and use the
test $1-z_r$ for the upper bound. For the lower bound, a normalized
near-minimizer with $Q_{\widetilde g_r}(f)\le Y([h_r])+o(r^6)$
decomposes as $f=a(1-z_r)+w$ with $w\in V$ and $a$ bounded by
its $L^4$ norm and the fixed mean functional. Completing the
square gives $Q_{\widetilde g_r}(f)=a^2s_r+q_r(w)$, hence
$w=O(r^3)$ in $H^1$ by the upper estimate and coercivity.
Normalization then gives
$a^2=\operatorname{Vol}(M,g)^{-1/2}+o(1)$ and the lower bound.

For a seed $h$ that is itself scalar-flat, the bracket in (1) is
strictly negative if $\operatorname{Rm}(h,p)\ne0$. If
$\operatorname{Ric}_h(p)\ne0$, the first term suffices. Otherwise
$W(h,p)\ne0$ and the linearized Weyl of $K$ on $B_1$ is $-W(h,p)$.
The gauge and trace components have zero linearized Weyl, so the
transverse trace-free Dirichlet term is strictly negative. If a
neighborhood is exactly flat, flattening leaves $h$ fixed for sufficiently
small $r$ and the Yamabe constant is exactly zero. If the coefficient
vanishes without an exactly flat neighborhood, (1) leaves the higher
order sign open.

The sign for general representatives of a zero class can differ.
For example let $g$ be the product of the unit round $S^2$ and a
closed surface of curvature $-1$. The two curvature blocks give
$R_g=0$, $W(g)=0$ and $\operatorname{Ric}_g\ne0$, with Schouten
tensor $\operatorname{Ric}_g/2$. For $h=g$, (1) gives a negative sign.
For another representative $h=e^{2w}g$, choose $w(p)=0$, $dw(p)=0$,
and $\nabla^2w(p)=(1+\lambda)\operatorname{Ric}_g(p)/2$ with
$\lambda>0$ small, using a smooth coordinate cutoff. The conformal
Ricci formula gives $\operatorname{Ric}_h(p)=-\lambda\operatorname{Ric}_g(p)$
and $W(h,p)=0$. Thus $K=O(\lambda)$ in each fixed profile norm.
The first term in (1) is $c_\eta\lambda|\operatorname{Ric}_g(p)|^2$
and the second is $O(\lambda^2)$, so $Y([h_r])>0$ and tends to zero.
This sign example is on a general closed four-manifold.

## Homotopy-sphere entry budget

On a homotopy four-sphere the signature gives $E_+=E_-$ and
$\chi=2$. For $Y([h])=0$, Gauss–Bonnet in the above scalar-flat
representative gives
\[
 E_+(h)=8\pi^2+\frac14\int_M|\operatorname{Ric}_g|_g^2\,dV_g .
\]
The Weyl term is $E_++E_-$ and the Ricci term has coefficient $-1/2$.
[Owning normalization and band](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L64)
· [Chang–Gursky–Yang, (0.4) and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

An independent sufficient seed condition is $Y([h])>0$ and
$E_+(h)<8\pi^2$. Conversely, if along some $r\to0$ there are
fixed positive margins in both inequalities for the new metrics,
the seed already satisfies both. A fixed negative Yamabe seed remains
negative even with $L\to\infty$ or with a bulb exhausting the round
sphere. A fixed energy excess above $8\pi^2$ persists. For a
zero-Yamabe homotopy-sphere seed with nonzero Ricci tensor somewhere
in the scalar-flat representative, this excess prevents entry even
when (1) gives positivity. For a Ricci-flat zero-class representative
the limiting energy is exactly $8\pi^2$. If $W(h,p)\ne0$, the bracket
in (1) is negative for any representative of this class. A vanishing
leading coefficient at the Ricci-flat endpoint, and possible finite-$r$
strict energy crossings from positive classes with $E_+(h)=8\pi^2$,
need further terms or separate data.

A round conformal class on standard $S^4$ has a representative
exactly flat near $p$, by smoothly undoing the stereographic round
factor near $p$. For this seed $h_r=h$ for all sufficiently small
$r$, the energies are exactly zero, and the Yamabe constant remains
the round value under every insertion. This gives an exact counterexample
to universal strict gain. The fixed-margin implication is preservation
within the shrinking smooth ball family. B02 still needs an independent
global seed construction or an independently controlled change of
conformal class.

Primary passages inspected for this note were Lee–Parker,
*Bull. Amer. Math. Soc.* **17** (1987), 37–91, §2 (2.7)
([DOI](https://doi.org/10.1090/S0273-0979-1987-15514-5));
Schoen, *J. Differential Geom.* **20** (1984), 479–495, §3
Theorem 3 ([DOI](https://doi.org/10.4310/jdg/1214439291));
and Chang–Gursky–Yang, *Publ. Math. IHÉS* **98** (2003), 105–143,
§0 Remark 2 and (0.4) ([DOI](https://doi.org/10.1007/s10240-003-0017-z)).
The remaining estimates are direct calculations in the frozen family.
