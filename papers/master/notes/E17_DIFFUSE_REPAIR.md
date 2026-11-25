# SP4-MASTER-E17 · Diffuse repair in a normal ball

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E execution of the [frozen B03 packet](../research-progress/handoffs/E17_DIFFUSE_REPAIR.md).
The dispatch requested GPT-6.2 Sol/ultra. Actual serving model and effort
were unavailable to this helper. The source commit was
`b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`. Verified TeX SHA-256
prefixes for the main file, `complete_limits`, `variational_comparison`,
`physical_volume` and `first_order_splice` were respectively
`c8a9f68da492`, `8b5692f2bcab`, `0c9b1dce4aa6`, `b972bc546624`
and `f93717b0b73c`.

A smooth metric's Euclidean tangent loses the incoming Weyl density
at order zero. Its quadratic normal jet retains that density and
minimizes the leading chiral energy under matching at the entire
boundary. Among fillings with controlled scaled jets, the infimum of
the physical cost equals the incoming energy to leading order. A fixed
radial cutoff with a flat core strictly increases both closed chiral
energies to this order if the Weyl tensor at the center is nonzero.

## Normal jet and boundary-fixed infimum

Let $M$ be a smooth closed oriented homotopy four-sphere with a fixed
smooth Riemannian metric $g$ in a positive class, and let $p\in M$.
Choose an oriented $g(p)$-orthonormal frame and the resulting normal
coordinates. For all sufficiently small $r>0$, let
$\Phi_r(y)=\exp_p(ry)$ embed a neighborhood of the closed Euclidean
unit ball $\overline B$, and put $B_r=\Phi_r(B)$ and
$h_r=r^{-2}\Phi_r^*g$. With the positive round convention
$R_{ikjl}=\delta_{ij}\delta_{kl}-\delta_{il}\delta_{kj}$,

$$
h_r=\delta+r^2(q+b_r),\qquad
q_{ij}(y)=-\tfrac13 R_{ikjl}(g,p)y^k y^l,\qquad
\|b_r\|_{C^2(\overline B)}=O_g(r).
$$

Write $\mathcal W_\pm$ for the linearization at $\delta$ of the
Weyl endomorphism on the real $\Lambda^\pm$ in the oriented orthonormal
coordinate frame. Its coefficients are constant and its terms have
exactly two derivatives. The normal-jet curvature identity gives
$\mathcal W_\pm q=A_\pm=W^\pm(g,p)$, a constant matrix in the
corresponding Euclidean frame. In fact, at the center the metric and
first derivative are $\delta$ and zero, so the curvature is given
exactly by its second-derivative part. Since $q$ is quadratic, this
part is constant throughout $B$. The norms are Hilbert–Schmidt
endomorphism norms. The squared four-index norm is four times the sum
of the two squared block norms. [Chang–Gursky–Yang, Remark 2, p. 107](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

For a comparison metric $k$ on $B$, write $F_\pm(k)$ for the chiral
matrix in the oriented $k^{-1/2}$ coordinate frame, multiplied by
$(\det k)^{1/4}$. Its squared Euclidean norm integrates against $dy$
to $E_\pm(k;B)$. Pullback and constant rescaling give
$E_\pm(h_r;B)=E_\pm(g;B_r)$. Pointwise conformal invariance of the
same measures also holds for positive smooth multipliers.
[Owning curvature decomposition and projection](../manuscript/first_order_splice.tex#L56)
· [Owning chiral measure](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L160)

Use the scaled norm
$\|u\|_X=\|u\|_\infty+\|Du\|_{L^4(dy)}+\|D^2u\|_{L^2(dy)}$.
It suffices to consider all smooth fillings
$h_{r,v}=h_r+r^2 v$ with $v\in C^\infty_c(B;\operatorname{Sym}^2)$
and $\|v\|_X\le K$ for a fixed $K$. The support may approach the
boundary as $r$ varies. Each filling agrees with the entire source
metric near the boundary, so restoring the scale and pushing forward
gives a smooth $G_{r,v}$ on the same oriented $M$ with the exterior
fixed. The metric is uniformly positive definite in the scaled
coordinates for small $r$.

In the all-lowered curvature, the linear term is $L(D^2k)$ with
constant coefficients, and the rest is quadratic in $Dk$ with
coefficients depending smoothly on $k$ and $k^{-1}$. The chiral
projection and density depend smoothly on $k$. Thus for
$k=\delta+\sigma u$ with $\|u\|_X$ bounded, the difference
$F_\pm(k)-\sigma\mathcal W_\pm u$ has $L^2$ norm bounded by
$C\sigma^2(\|u\|_\infty\|D^2u\|_2+\|Du\|_4^2)$. In particular,
uniformly for $\|v\|_X\le K$,

$$
F_\pm(h_{r,v})=r^2(A_\pm+\mathcal W_\pm v)+O_{L^2,g,K}(r^3).
$$

Every second derivative of a smooth compactly supported tensor has
zero integral on $B$. Hence $\int_B\mathcal W_\pm v\,dy=0$.
Equivalently $\mathcal W_\pm^*\mathcal W_\pm q=0$. The linearized
Bach equation at $\delta$ is the double divergence of the linearized
Weyl tensor, so the same constant-curvature-jet calculation gives
$B'_\delta q=0$. The energy conclusion uses the vanishing cross term
and the nonnegative square. [Tian–Viaclovsky, §2.1, (2.1)–(2.3)](https://arxiv.org/pdf/math/0312318#page=5)

Let $m_\pm=E_\pm(g;B_r)$ and $\omega_4=|B|=\pi^2/2$. Then

$$
\begin{aligned}
m_\pm &=r^4\omega_4|A_\pm|^2+O_g(r^5),\\
E_\pm(G_{r,v})-E_\pm(g)
 &=E_\pm(h_{r,v};B)-m_\pm
 =r^4\|\mathcal W_\pm v\|_2^2+O_{g,K}(r^5).
\end{aligned}
\tag{1}
$$

In particular the infimum of the linearized cost over all smooth
$q+v$ agreeing with $q$ near $\partial B$ is exactly
$\omega_4|A_\pm|^2$, attained at $v=0$. The nonlinear infimum at
fixed $K$ is between $m_\pm-C_{g,K}r^5$ and $m_\pm$, also when
restricted to positive classes. The same calculation applies to the
sum of the blocks and hence to the full four-index Weyl integral.
For $A_\pm\ne0$ it excludes a fixed-factor reduction of that block's
incoming energy. If $A_\pm=0$, that block has $m_\pm=O_g(r^6)$ and
(1) gives no relative estimate on that smaller scale.

There is also an unrestricted comparison. For any smooth positive
definite filling $k$ agreeing with $h_r$ near the entire boundary,
let $c_\pm(k)=E_\pm(k;B)$. Subtract the closed signature identity
for $g$ and for the globally filled metric. The same exterior and
orientation give

$$
c_+(k)-c_-(k)=m_+-m_-,\qquad
\max(0,m_\pm-m_\mp)\le \inf_k c_\pm(k)\le m_\pm.
\tag{2}
$$

The upper bound uses the incoming metric as a filling. Both bounds
also hold for the infimum over positive-Yamabe fillings. If one
$A_\pm$ is nonzero and the opposite block is zero at $p$, (2) pins
down the nonzero block's unrestricted infimum up to $O_g(r^6)$.
In general (2) does not identify the order-$r^4$ unrestricted
infimum. Applying (1) to a minimizing family for that infimum
would require control of its scaled jets or a separate compactness
argument. The same signature calculation gives equal nonlinear
increments of the two blocks for every boundary-fixed repair. Taking
the scaled limit of (1) for an arbitrary fixed $v$ gives the exact
flat identity $\|\mathcal W_+v\|_2^2=\|\mathcal W_-v\|_2^2$ for
every compactly supported $v$.
[Hirzebruch, §4, p. 11, (16), prior passage record](../../investigations-1/01_chiral_metric_evolution/research-progress/handoffs/SP4-CME-E01C_RETURN_v1.md#metadata-for-canonical-references)
· [Gover–Gursky, pp. 293–294, four-index formula](https://doi.org/10.1515/crelle-2024-0028)

## Radial cutoff and positive path

Fix $0<a<b<1$ and a smooth radial $\eta$, with $0\le\eta\le1$,
$\eta=1$ on $B_a$ and $\eta=0$ off $B_b$. Use the path

$$
k_{r,t}=\delta+(1-t\eta)(h_r-\delta),\qquad 0\le t\le1.
$$

These are positive definite metrics by convexity, with the same
boundary collar for every $t$. In (1) the profile is
$v=-t\eta(q+b_r)$. Put $Z_\pm=\mathcal W_\pm(-\eta q)$.
Uniformly along the path the closed chiral energies change by
$r^4t^2\|Z_\pm\|_2^2+O_g(r^5)$ with cutoff-dependent constants.
This is a leading sign for fixed $t$ and an upper bound on the
height of the whole path.

At the endpoint $k_{r,1}=\delta$ on $B_a$. The entire interior
cost $\gamma_\pm=E_\pm(k_{r,1};B)$ is the energy of the annulus
$B\setminus\overline B_a$, including the part that keeps the
source metric. The leading chiral density matrix there is
$A_\pm+Z_\pm$. It has integral $\omega_4 A_\pm$, since its value
on $B_a$ is zero and $\int_B Z_\pm,dy=0$. Cauchy–Schwarz yields

$$
\begin{aligned}
\gamma_\pm &\ge \frac{r^4\omega_4 |A_\pm|^2}{1-a^4}-C r^5,\\
\gamma_\pm-m_\pm &\ge
\frac{a^4}{1-a^4}\,r^4\omega_4 |A_\pm|^2-C r^5.
\end{aligned}
\tag{3}
$$

The gain from deleting the raw core is therefore more than offset
by the increase over the incoming annular energy when the relevant
block is nonzero at $p$. If only one block is nonzero, the exact
equality of the closed increments gives strict increase for both.
For the full Weyl tensor with $W(g,p)\ne0$, the leading positive
increment is bounded below by summing (3) and multiplying by four.

For the fixed smooth positive-class $g$ the entire path, and in fact
the interpolation $h_r+tr^2v$ for all $\|v\|_X\le K$, has positive
Yamabe sign for small $r$. In physical coordinates the inverse metric
and volume coefficients differ from the source by $O(r^2)$, and the
scalar-curvature density difference relative to $dV_g$ has $L^2(g)$
norm $O(r^2)$. The latter follows from the scaled curvature estimate:
the scaled $L^2$ curvature on $B$ is $O(r^2)$ and that curvature
norm is scale invariant. For $Q_g(f)=\int(6|df|_g^2+R_g f^2)dV_g$
the form difference is bounded by
$C r^2(\|df\|_2^2+\|f\|_4^2)$. The inequalities
$Q_g(f)\ge Y([g])\|f\|_4^2$ and
$6\|df\|_2^2\le Q_g(f)+\|R_g\|_2\|f\|_4^2$ absorb this error.
[Lee–Parker, §2, conformal Laplacian (2.7)](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf#page=7)

For sources in the frozen band, the manuscript's zero-Yamabe
energy threshold also gives path positivity as soon as the height
above $e_i$ is less than $\delta$. On a smooth closed oriented
homotopy four-sphere, a zero first conformal-Laplacian eigenvalue
gives a scalar-flat representative by its positive first eigenfunction.
By Gauss–Bonnet with $\chi(M)=2$ and signature zero, this class has
$E_+=8\pi^2+\frac14\int_M|\operatorname{Ric}|^2dV$. The first
eigenvalue varies continuously along each smooth metric path, and
starts positive. The uniform height bound is $O(r^4)$ in (1); it
is the sum of the corresponding height bounds for simultaneous
repairs on disjoint balls. Positivity here is on the original
smooth type along the actual path, including any replacement
followed by constant renormalization to unit volume.
[Chang–Gursky–Yang, (0.4), p. 107](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)
· [Owning zero-Yamabe threshold](../manuscript/variational_comparison.tex#L1)

## Varying sources, finite families and the residual

For an actual varying family the same proof is uniform if the
marked scaled pulled-back metric on each fixed parameter ball has
the form $h_{ij}=\delta+r_{ij}^2(q_{ij}+b_{ij})$, where $q_{ij}$
is quadratic with uniformly bounded coefficients and
$\|b_{ij}\|_X\le\alpha_{ij}$. The fillings must satisfy the same
uniform bound on $v_{ij}$ and the same whole-boundary matching.
One may work in this comparison gauge if the incoming positive
conformal factor is restored for the fill before extension. Both
chiral measures then agree with their physical pullbacks exactly.
The parameter $r_{ij}$ is a physical radius in actual physical
normal coordinates. Using a conformal comparison requires a
separate identification of any sets specified by distance or
physical volume.

In (1) and (3), the absolute error for that ball is at most
$C r_{ij}^4(\alpha_{ij}+r_{ij}^2)$ for bounded $\alpha_{ij}$.
This follows by keeping the term $r_{ij}^2\mathcal W_\pm b_{ij}$ in
the matrix expansion. For fixed finite disjoint families the
costs, incoming energies and errors all add. In particular, if
$m_{ij}^+=E_+(g_i;B_{ij})$ and $\Gamma_i=\sum_j\gamma_{ij}$ is
the sum of the full exterior-retaining filling costs of controlled
profiles, then

$$
\Gamma_i\ge \sum_j m_{ij}^+-C\sum_j r_{ij}^4(\alpha_{ij}+r_{ij}^2).
\tag{4}
$$

The relative version requires the error sum to be small compared to
the incoming chiral mass. For example a uniform lower bound on
$|\mathcal W_+q_{ij}|$ and uniform smallness of $\alpha_{ij}+r_{ij}^2$
give that comparison. If a bounded number of physical balls all
shrink with bounded coefficients, their combined mass is
$O(\sum_j r_{ij}^4)$ and vanishes. This is compatible with the
physical diffuse alternative, which limits the mass of a bounded
number of balls at vanishing fractions of the half-energy radius.
[Owning physical diffuse alternative](../manuscript/complete_limits.tex#L286)

In the joint selection problem fix the tolerances, the bounded
window, the comparison radii and the number of marked balls before
taking the source limit. In the positive-Ricci half-volume gauge,
write $\lambda$ and $\nu$ for the local weak limits of the physical
positive chiral and full curvature measures, write $\mathcal R$
for the Euclidean regular set, and put
$G_\zeta=\{x\in\mathcal R:\nu(\{x\})<\zeta\}$.
At tolerance $\varepsilon$, the captured chiral mass has lower
limit at least $\lambda(G_\zeta)-\varepsilon$. It follows from (4)
that if the aggregate error is small at this stage, the proposed
cost bound likewise has a lower limit near that captured mass.
The one-sided replacement inequality gives
$\sum_j m_{ij}^+\le N_i(e_i-I^+(M))+\Gamma_i$. The first term
vanishes on the chosen subsequence. Costs as large as the raw
incoming mass give no contradiction. In a fixed smooth source one
does have $E_+(g;U)\le\|W^+_g\|_\infty^2\operatorname{Vol}_g(U)$
for all measurable $U$, so the same example has a small chiral
residual on a small physical-volume complement and still incurs the
cost in (3).
[Owning joint selection and residual](../manuscript/physical_volume.tex#L253)
· [Owning replacement inequality](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L276)

On varying sources the measured residual bound contains mass lost at
infinity, mass on nonregular points, mass on excluded atoms, and the
selection tolerance. No term there is bounded by this filling
calculation. A smooth embedded disk furnished by joint selection
does not come with the order-$r^2$ jet expansion, and a zeroth- or
first-order flat limit alone does not control the second derivative
remainder relative to the incoming energy. In a supplied smooth
limit chart one can shrink around a nonzero-Weyl point of the fixed
limit metric and repeat the calculation there. To transfer it, one
needs the corresponding estimates on the actual marked sources at
the fixed domains before refining the radii. In particular,
singular diffuse chiral mass on regular points and transfer from the
positive-Ricci volume gauge to physical median balls are outside the
proved scope. The obstruction is to fixed-factor improvement by
these controlled fillings, including the explicit radial cutoff.
