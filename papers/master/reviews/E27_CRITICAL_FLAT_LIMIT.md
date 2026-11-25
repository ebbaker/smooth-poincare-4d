# SP4-MASTER-E27 · Flat comparison from a fixed-distortion harmonic annulus

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded independent analytical check of the
[frozen packet](../research-progress/handoffs/E27_CRITICAL_FLAT_LIMIT.md).
The request specified GPT-6.2 Sol/ultra. Actual serving model and reasoning
effort were unavailable. Verified base `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`,
master main SHA-256 prefix `c8a9f68da492`, and E22 review SHA-256
`bf6387d4745036bba1bbb496180a82315d3183238319c7337ab837f10caa1236`.

The proposed reduction works on a supplied whole sufficiently
small-distortion harmonic annulus with vanishing full curvature
energy. The fixed distortion supplies small critical drift. It does
not need to tend to zero on the source sequence. A single developed
chart on an inner annulus preserves a protected marking of the two
complete sides. The same result holds with differentiated coordinate
tension tending to zero in $L^2$ in that original chart.

## Critical compactness and convergence of the equations

Fix the Euclidean annulus $A_0=\{1/8<|x|<8\}$ and an oriented smooth
embedding of it into each source. Let $m_i$ be the smooth Riemannian
comparison metrics, each a positive conformal multiple of the pulled-back
physical metric. Assume in this chart

$$
\|m_i-\delta\|_{L^\infty(A_0)}\le \varepsilon_*,\qquad
\|\operatorname{Rm}_{m_i}\|_{L^2(A_0,m_i)}\longrightarrow0,
$$

with $\varepsilon_*>0$ chosen sufficiently small before the source
limit. Suppose also the Cartesian coordinate functions are harmonic
for $m_i$, or that $\|DT_i\|_{L^2(A_0,dx)}\to0$ for
$T_i^a=\Delta_{m_i}x^a$. In what follows $D$ is the original
Cartesian derivative and the coefficient norms use $dx$.

For each fixed compactly contained annular trim the E22 estimate,
using $\chi=1$ on that trim and supported in $A_0$, gives

$$
\limsup_i\|D^2m_i\|_2\le C_\chi\varepsilon_*,\qquad
\limsup_i\|Dm_i\|_4\le C_\chi\varepsilon_*.
\tag{1}
$$

Here the comparison Ricci norm tends to zero with the full curvature
norm and ellipticity. Use for instance the trim $1/7<|x|<7$ with its
closure inside $A_0$. The coordinate Sobolev space $W^{2,2}$ is
uniformly bounded there. Pass to one subsequence on which $m_i$
converges weakly in $W^{2,2}$, strongly in $W^{1,q}$ for $q<4$,
and almost everywhere, to $h$. The limit has the same almost
everywhere metric distortion and the same bound (1) for its weak
derivatives. In particular $Dh\in L^4$. [E22 weighted estimate and gauge term](E22_CRITICAL_HARMONIC_CHART.md#fixed-domain-estimate)

Write the harmonic Ricci equation, including the differentiated
tension if present, as a system on the Cartesian symmetric-matrix
components,

$$
a_i^{ab}\partial_{ab}m_i=Q(m_i)[Dm_i,Dm_i]+f_i,
\qquad a_i=m_i^{-1},\qquad \|f_i\|_2\longrightarrow0.
\tag{2}
$$

The bundle-valued $Q$ is bilinear in the last two arguments with
smooth coefficients on the elliptic matrix range. The source $f_i$
is $-2\operatorname{Ric}(m_i)$ and the symmetric $m_i DT_i$ terms
from E22. For any smooth compactly supported test, $a_i$ times the
test converges strongly in $L^2$ to $a=h^{-1}$ times the test.
This uses bounded almost everywhere convergence. Thus the weak
Hessians suffice for convergence of the principal term as a
distribution. The quadratic terms converge strongly locally in
$L^1$ by strong $L^2$ convergence of $Dm_i$ and bounded almost
everywhere convergence of the coefficients against $(Dh)^2$.
The result is $a^{ab}\partial_{ab}h=Q(h)[Dh,Dh]$ in distributions
and hence almost everywhere, as both sides are $L^2$.
[DeTurck–Kazdan, Lemma 4.1, (4.2)–(4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf)

For the strong estimate set $w_i=m_i-h$. Subtract (2) and its limit,
placing the part linear in $Dw_i$ on the left. This gives

$$
a_i^{ab}\partial_{ab}w_i-B_i Dw_i=F_i,
\qquad |B_i|\le C(|Dm_i|+|Dh|),
$$

where the remaining coefficient terms are
$(a-a_i)D^2h$ and $(Q(m_i)-Q(h))[Dh,Dh]$, in addition to $f_i$.
These tend to zero strongly in $L^2$: $D^2h$ and $(Dh)^2$ are fixed
$L^2$ tensors, and the coefficient differences are bounded and
converge almost everywhere. For a fixed compactly supported cutoff
$\xi$, the same operator on $v_i=\xi w_i$ has right-hand side
$\xi F_i$ plus the commutators

$$
2a_i^{ab}(\partial_a\xi)\partial_b w_i
+a_i^{ab}(\partial_{ab}\xi)w_i-B_i(D\xi)w_i.
$$

The first two commutators tend to zero in $L^2$ by strong $W^{1,2}$
convergence. The last one does so by boundedness of $B_i$ in $L^4$
and strong $L^4$ convergence of $w_i$. On the zero extension of $v_i$
to $\mathbb R^4$, use
$\|D^2v_i\|_2=\|\Delta v_i\|_2$ and
$\|Dv_i\|_4\le C\|D^2v_i\|_2$. The principal error costs
$C\varepsilon_*\|D^2v_i\|_2$ and the drift costs at most
$C\|B_i\|_4\|D^2v_i\|_2$. Both are absorbed using (1) and the
fixed smallness of $\varepsilon_*$. Hence $D^2v_i\to0$ in $L^2$.
We get strong $W^{2,2}$ and $W^{1,4}$ on inner trims without needing
smoothness of $h$ in this step.

## Smoothness and flatness of the limit

Independently, write the limit equation as $Lh=0$ with
$L=a^{ab}\partial_{ab}-B D$ and $|B|\le C|Dh|$. On an interior
Euclidean ball consider this linear system with componentwise zero
Dirichlet data. The Dirichlet Laplacian is an isomorphism
$W^{2,p}\cap W^{1,p}_0\to L^p$ for $p=2,3$. On a ball, rescale
to unit radius for the inverse and use the embeddings for the
first derivative into $L^4$ and $L^{12}$, respectively. Hölder
then bounds $BDu$ in $L^p$ by $C_p\|B\|_4\|D^2u\|_p$ on
these zero-boundary spaces. The principal perturbation is bounded
by $C\varepsilon_*\|D^2u\|_p$. The norms are used at the scale
of the ball and the $L^4$ drift norm is critical. For sufficiently
small fixed $\varepsilon_*$, $L$ is invertible at both exponents
by the Neumann series. Apply it to $\xi h$ with $\xi$ compactly
supported inside the ball. Its commutator forcing is a sum of
bounded-coefficient terms containing $Dh$, $B h$, or $h$, and
belongs to $L^3$ on that ball. The $p=3$ solution belongs to the
$p=2$ space there and agrees with $\xi h$ by uniqueness. Thus
$h\in W^{2,3}_{\mathrm{loc}}$.

Now $Dh\in L^{12}_{\mathrm{loc}}$, so the quadratic right-hand side
is in $L^6_{\mathrm{loc}}$. On one smaller ball repeat the cutoff and
inversion at $p=2,6$ for the principal operator $a^{ab}\partial_{ab}$
alone. The commutators are in $L^6$ and the principal perturbation
is again small. This gives $h\in W^{2,6}_{\mathrm{loc}}$, hence
$C^{1,\alpha}_{\mathrm{loc}}$ for $0<\alpha<1/3$ by Sobolev embedding.
Interior Schauder regularity for (2) with smooth coefficient
functions of $h$, followed by differentiation, gives smoothness.
This applies also in the differentiated-tension case because those
terms disappear from the limiting reduced equation. The Dirichlet
input is the fixed-ball $L^p$ theorem for the scalar Laplacian,
applied componentwise to the unperturbed operator.
[Gilbarg–Trudinger, *Elliptic Partial Differential Equations of Second Order*, Theorem 9.15 and §6.1](https://doi.org/10.1007/978-3-642-61798-0)

The all-lowered curvature has constant principal part $L_0(D^2h)$
and a smooth-coefficient expression quadratic in $Dh$. Strong
$W^{2,2}$ and $W^{1,4}$ pass both terms strongly in $L^2$ to the
limit. For the quadratic coefficient difference, use bounded
almost everywhere convergence against the fixed tensor $(Dh)^2$.
The corresponding curvature norms of $m_i$ tend to zero, so the
now smooth $h$ is flat. This uses the full-curvature hypothesis.
[Owning all-lowered curvature formula](../manuscript/first_order_splice.tex#L56)

## One developed annulus and the two complete sides

The original annular trim is simply connected in dimension four.
Choose an oriented parallel $h$-orthonormal coframe on it by flat
parallel transport. The coframe is closed by the torsion-free
structure equation, so it is exact. Integrating it gives an
orientation-preserving smooth local diffeomorphism $F$ with
$DF^{\mathsf T}DF=h$. This construction does not require
completeness. The distortion gives
$\operatorname{dist}(DF,SO(4))\le C\varepsilon_*$ by polar
decomposition. On the fixed connected Lipschitz annulus
$U=\{1/5<|x|<5\}$, $F$ is in $W^{1,2}$ since it is smooth on a
larger trim. Apply Friesecke–James–Müller rigidity in dimension
four. After a single rotation and translation, Poincaré gives
$\|F-x\|_{W^{1,2}(U)}\le C\varepsilon_*$.
[Friesecke–James–Müller, CPAM **55** (2002), Theorem 3.1, (3.1)](https://www.aem.umn.edu/~james/research/Publications_Files/PDF/73.pdf)

On $D=\{1/4<|x|<4\}$ one has
$\sup_{\bar D}|F(x)-x|\le C\varepsilon_*^{1/3}$. Indeed $DF$ is
bounded in $L^\infty(U)$ by the metric upper bound. A discrepancy
$s=|F(x)-x|$ at $x\in\bar D$ persists at size at least $s/2$ on
a Euclidean ball of radius $c s$ for small $s$, giving a lower
bound $c's^6$ on the squared $L^2$ norm. The fixed distance to
$\partial U$ first excludes discrepancies larger than a fixed small
constant by the same argument with a fixed ball. This proves the
stated rate.

Take $\varepsilon_*$ small enough that this discrepancy is less
than the distance of the inner and outer faces of
$V=\{1/3<|z|<3\}$ from the corresponding faces of $D$. For every
$z\in V$, the homotopy from the identity to $F$ avoids $z$ on
$\partial D$. The Brouwer degree on $D$ is therefore one. All
preimages in $D$ have positive local degree because $F$ is an
orientation-preserving local diffeomorphism. They are finite since
the preimage avoids $\partial D$ and is discrete. Hence there is
exactly one preimage in $D$ for every $z\in V$ and the inverse on
this branch is smooth on all of $V$. Its composition with the
original source embeddings gives one developed source chart on
the whole short annulus $-1<\log|z|<1$. This geometric conclusion
uses the degree on the trim only.

For the cap application require the original protected marking.
For example, each complete mass set can be outside the image of
$D$, in its respective component of the old middle cut. The new
middle sphere $F^{-1}(\{|z|=1\})$ lies close to the old unit sphere.
Inside $D$ the function $|F|-1$ is negative on the inner face and
positive on the outer face. The negative region has boundary there
given by the inner face and the new sphere, so joining it to the
unmodified inner component places the two full mass sets on
opposite sides of the new sphere. There are at most two components
of its complement, since each component meets a face of a tubular
collar and each face of the collar is connected. The entire
modification is inside the image of $D$. More generally, an original fixed radial margin
around the unit sphere suffices after choosing the support of
straightening narrower than that margin and reducing
$\varepsilon_*$ accordingly. The analytic assumptions alone say
nothing about placement of mass sets that approach or intersect
the old marked sphere.

## Splice with convergence in measure

On the developed chart the metrics $\widetilde m_i$ are uniformly
elliptic and converge strongly to $\delta$ locally in $W^{2,2}$
and $W^{1,4}$, since the change of coordinates by $F^{-1}$ is fixed
and smooth on each compact subannulus. They converge in measure.
The full comparison curvature tends to zero in $L^2$ in the new
chart by pullback. Use the fixed compactly supported radial
straightening profile $\psi$ of `prop:short-cut`, choosing it
within the protected buffer when necessary. Write
$v_i=\widetilde m_i-\delta$,
$p_{i,s}=\delta+(1-s\psi)v_i$, $0\le s\le1$, and let
$\mathcal T$ contain the fixed modified strip. Uniform ellipticity
holds for every $p_{i,s}$ by convexity. In the all-lowered curvature
formula the principal terms cancel in
$\operatorname{Rm}_{\mathrm{low}}(p_{i,s})-(1-s\psi)
\operatorname{Rm}_{\mathrm{low}}(\widetilde m_i)$ except for the
derivatives of the profile. In $L^2(\mathcal T,dz)$ the remainder
is at most

$$
C_\psi\bigl(\|Dv_i\|_4+\|Dv_i\|_4^2+\|v_i\|_2\bigr)=o(1).
$$

For this bound use Hölder on the fixed strip for the linear
$D\psi Dv_i$ and $D^2\psi v_i$ terms. The quadratic terms involve
$Dv_i$ and $D\psi v_i$. Uniform boundedness of $v_i$ gives
$\|v_i\|_4^2\le C\|v_i\|_2$, and Cauchy–Schwarz bounds the mixed
terms. The leading incoming curvature already has norm $o(1)$.
The chiral projection and volume-density maps have uniformly
bounded norm on the elliptic matrix range. Consequently both
modified-strip chiral energies are $o(1)$ uniformly in $s$, and
so are both incoming strip energies. Equivalently one could bound
the change of projection by a uniform constant times the vanishing
incoming full curvature. This comparison requires no uniform
convergence of $v_i$ to zero. It gives signed excess $o(1)$ on
each side. [Owning curvature and chiral projection](../manuscript/first_order_splice.tex#L53)

For smooth closed oriented homotopy four-sphere sources at the
positive-class infimum, use $e_i=E_+(g_i)\to I^+(M)$,
$e_i\le8\pi^2-\delta_0$ with $\delta_0>0$, and $Y([g_i])>0$.
The chiral integrals are the physical Hilbert–Schmidt block
energies, unchanged by conformal multiplication and oriented
pullback. The gauge and cylindrical factors can be extended
smoothly off the surgery support as in the owning proof. Along
the new same-manifold path the total energy stays below the
zero-Yamabe threshold. Its endpoint is exact round product near
the cut. Stretching that product is a path at fixed energy on
the same marked smooth type, giving positive Yamabe caps on the
two complete sides by their compactly supported tests on a long
joined source. The cut excess is $o(1)$ for each cap. Two fixed
positive incoming masses on the protected opposite sides then
contradict fixed-type minimizing energy on a hypothetical
nonstandard $M$. This proves the conditional cut comparison. The
existence of the original single harmonic or approximate harmonic
annulus with the required distortion and protected markings remains
an independent geometric premise.
[Owning positive wall and short marked cut](../manuscript/variational_comparison.tex#L1)
