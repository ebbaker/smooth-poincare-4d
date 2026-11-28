# One half-sheet on the last twisted circle

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Lead serving variant and effort unavailable. Working base `6a422ce`. The [LINE return](../../investigations-2/03_lines_and_broken_fibrations/research-progress/handoffs/TO_MASTER2_LAST_CIRCLE_20261127.md) has SHA-256 prefix `6fdb1ea2403b`. The marked profile A proof and the Gate 1 and 3 decision have prefixes `9fb4337ef141` and `76af02a52d1c`. [Frozen packets and scope](../research-progress/handoffs/REQUEST_M2_TWISTED_MODEL_20261127.md)

## The current and its sign

**Input, replayed project theorem.** Use the prepared exact Taubes tube of the transverse twisted circle $Z$ in the closed oriented Riemannian $Y=M\#\mathbb{CP}^2$. The capped form $\bar\omega$ and metric are Kähler on a neighborhood of the actual positive line $L_\infty$. For $c_1(\mathcal L)=3\,\mathrm{PD}[L_\infty]$, LINE's nonzero chamber and Taubes's existence theorem give a current $T$ with $T\cdot L_\infty=0$, disjoint from the line. Its closure is compact in $V=Y\setminus L_\infty$. Write $d\alpha=\bar\omega$ on $V$. The argument below requires exact model coordinates and the adapted almost complex structure on a tube, as allowed in LINE's prepared problem. Mere transversality of the zero does not give this formula for a prescribed pair. [LINE cap and chamber](../../investigations-2/03_lines_and_broken_fibrations/notes/CAP_DEGREE_AND_CHAMBERS.md) · [Primitive period](../../investigations-2/03_lines_and_broken_fibrations/notes/CORE_PERIOD.md)

Orient $Z$ by Taubes's convention, and its normal meridian $S$ as the boundary of the oriented normal ball. On the oriented normal double cover of the distinguished eigenline, the tube has coordinates $t\bmod 2\ell$, $x,y,z$, oriented by $dt\,dx\,dy\,dz$. Only the tube is covered. Write $\rho^2=x^2+y^2$, $N^2=\rho^2+z^2$, $f=\rho^2/2-z^2$, $h=z\rho^2$, $\phi=\arg(x+iy)$. The normalized model and the deck action are
\[
 \bar\omega=dt\wedge df+d\phi\wedge dh,\qquad
 D(t,x,y,z)=(t+\ell,x,-y,-z).
\]
Use the $\bar\omega$-positive orientation on each current. On the meridian $c_1(K)[S]=2$ and $c_1(\mathcal L)[S]=0$ since $\mathcal L$ extends over its ball. The relative class identity $2[T]=\mathrm{PD}(c_1(\mathcal L\otimes K))$ gives $T\cdot S=+1$ on either lift. This equals the signed projection degree of the boundary of the *exterior* truncation. LINE's period identity gives positive area $n_j P$ for each global component, with $P=\int_Z\alpha$. The weighted sum of the $n_j$ equals one. Consequently $P>0$, there is one irreducible component of weight one, and its energy is $P$. [Taubes, Lemma 2.1, Theorem 2.2 and §7(f)](https://arxiv.org/pdf/math/9907199) · [Sign and relative class replay](../reviews/E13_CURRENT_AND_SIGNS_20261127.md)

## Regular points and the freedom to choose a metric

**Imports and project deduction.** Taubes's structure theorem gives real analytic half-disks outside a finite subset of the lifted circle. In an outward radial parameter $a$, an equatorial model restricts the form to $a\,dt\wedge da$ and either axial model to $-2a\,dt\wedge da$. Let $p,q_+,q_-$ denote tangent multiplicities at any point. Intersection with a meridian gives $p-q_+-q_-=1$. At regular points $q_\pm$ are constant on the lifted regular locus and take values in $\{0,1\}$. The deck action exchanges the two labels. Thus the sheet counts allowed there are $(1,0,0)$ and $(3,1,1)$. The three equatorial rays at $0,\theta,-\theta$ and two axial rays realize the latter locally, each with weight one for $0<\theta<\pi$. [Taubes, Theorem 1.8 and Propositions 4.1, 7.1](https://arxiv.org/pdf/math/9901142) · [Twisted-ray computation](../reviews/E12_TWISTED_RAYS_20261127.md)

There is a cap-preserving choice of adapted metric for which every regular point of the newly supplied current has one equatorial half-sheet. Take two disjoint balls in the original exact region on the two axial sides over one base chart, outside a narrower whole tube and away from the cap. In each, use the interior-supported, compatible perturbation in Taubes's Lemma 6.1 to exclude every finite-energy subvariety containing the prescribed exterior annular patch of the axial disk. An actual open axial germ would continue along the connected exact axial surface outside the closed supporting subballs to one of these annuli (removing the two little disks leaves the axial surface connected). This is the unique-continuation argument of the proof of Proposition 7.2 of the structure paper and §6(a) of the moduli paper. Work downstairs so that both variations lift equivariantly. On the supports take $g'=(\sqrt2/|\bar\omega|_g)\bar\omega(\cdot,J'\cdot)$ with the positive compatible convention. It matches $g$ near their boundaries. The form is closed and self-dual, its class and period are fixed, and the same line and its Kähler neighborhood are available. Reapply the chamber and existence argument for $(g',\bar\omega)$ to obtain $T'$. This selection proves the regular-point assertion for an allowed realization. It gives no identification of $T'$ with a current from the originally specified metric. The integers excluded by moduli Proposition 2.11 count actual regular axial disks. Tangent multiplicities can still jump at an exceptional point. [Taubes, (1.4), Proposition 2.11 and Lemma 6.1, pp. 277–279, 286, 319–320](https://intlpress.com/site/pub/files/_fulltext/journals/ajm/1999/0003/0001/AJM-1999-0003-0001-a011.pdf) · [Relative metric argument](../reviews/E13_CURRENT_AND_SIGNS_20261127.md)

**Descent.** A single equatorial graph over $(t,\rho)$ at every lifted point glues by uniqueness. Compactness gives a common positive collar width. With $x+iy=\rho e^{i\phi}$, equivariance says $e^{i\phi(t+\ell,\rho)}=e^{-i\phi(t,\rho)}$ and $z(t+\ell,\rho)=-z(t,\rho)$. The deck action on the parameters fixes $\rho$ and translates $t$ by $\ell$. The quotient is an embedded annular collar with its inner boundary mapping once to the actual $Z$. This argument applies over individual regular intervals without excluding exceptional points. A smooth collar of the full current requires the assertion at every point.

## A local exceptional point with the same degree

**Project example.** Take the equatorial sheet along positive $x$ and the positive nappe of the cone $t=t_0$, $\rho^2=2z^2$, $z>0$. Add its deck image at $t_0+\ell$, $z<0$, all with weight one. The cone is Taubes's extreme Example 1.5. On the positive cone $h=2N^3/(3\sqrt3)$, so its energy inside radius $b$ is $4\pi b^3/(3\sqrt3)$. Its angular section projects constantly to $Z$ and gives zero algebraic degree. Its punctured normalization is connected downstairs. The entire union has two components in the punctured quotient tube, degree $+1$, one regular equatorial sheet and precisely one exceptional basepoint. The full closure is not an embedded half-disk there. The single equatorial sheet alone realizes smooth descent on this same tube. In the normalized density below, it gives $D_s=2/3$ at every centre and admissible scale. At the cone apex the union gives $2/3+4\pi/(3\sqrt3)$ at each such scale. These are exact checks of the two outcomes on the local models.

The example disproves the inference from the local degree, finite energy, unit weights and all regular sheet counts to a full collar. Its extension to the cap as the restriction of the one global irreducible current is unknown. Irreducibility of the global normalization allows separate approaches in a restricted tube. The period argument excludes a *separate global* component of degree zero. The example has an outer boundary when truncated, and does not satisfy that global premise. Taubes's §9 also allows a residual question about compensated jumps in the axial and equatorial tangent multiplicities at an exceptional point. [Cone and its normalization](../reviews/E14_LOCAL_BRANCHES_20261127.md) · [Exceptional-point reading](../reviews/E11_EXCEPTIONAL_SET_20261127.md)

## A quantitative collar criterion for one fixed marked current

**Project theorem.** Fix any one of the actual currents above and its exact tube. Choose smooth nonincreasing $\chi:[0,\infty)\to[0,1]$ equal to one on $[0,1]$ and zero on $[2,\infty)$. Put $k=\|\chi'\|_\infty$ and $b_\chi=3\int_0^\infty \chi(a)a^2\,da$. For $v\in Z$, take the flat model distance $r_v$ from one lift of $v$. Use a ball projecting injectively to the base, contained in the exact tube. Choose $2s$ strictly smaller than the radius of the retained exact tube and $\ell/2$. Set
\[
  D_s(v)=\frac{1}{b_\chi s^3}\int_T\chi(r_v/s)\,\bar\omega .
\]
Extend the weight by zero beyond the projected ball. The other lift gives the same answer. The following are equivalent.

1. The full current has exactly one smooth embedded half-sheet over every point of $Z$, with an embedded annular collar after descent.
2. $D_0(v)=\lim_{s\downarrow0}D_s(v)=2/3$ for every $v$.
3. There exist an admissible scale $s$, a finite net $v_j$ of covering radius $a$ along $Z$ and upper bounds $U_j\ge D_s(v_j)$ satisfying
   \[
   \max_j U_j+\frac{k P a}{b_\chi s^4}<\frac23+\frac1{50}.
   \]

Condition 3 is an existence criterion for upper bounds on the *same current*. The LINE input contains its total energy and no such local upper bounds.

**Proof.** Taubes's Proposition 2.1 gives monotonicity of $D_s$ in $s$, a common small scale and a local flat-area bound of order $s^2$. By Propositions 3.2 and 4.1, tangent currents consist of equatorial and axial half-planes and finitely many Example 1.5 cones counted with multiplicity. For the weighted density integral, rescale by $3s$ so that the cutoff has support inside the classified unit ball. The rescaled area there is uniformly bounded. The comass of the rescaled model form in a distance-$\epsilon$ tube about the rescaled axis is at most $2\epsilon$, so excising the axis for convergence of currents costs $O(\epsilon)$ uniformly. Homogeneity makes the weighted unit density on each cone equal to its sharp unit-ball energy after division by $b_\chi$. Integrating $a\,dt\,da$ over the equatorial half-disk gives $2/3$, and the axial energy is $4/3$. Write $q=q_++q_-$, and let $\delta_i$ be sharp unit-ball energies of the remaining cone terms, repeated with multiplicity. The signed identity yields
\[
      D_0(v)=\tfrac23 p+\tfrac43 q+\sum_i\delta_i
            =\tfrac23+2q+\sum_i\delta_i .
\]
[Taubes, Propositions 2.1, 3.2 and 4.1 and Lemma 1.10](https://arxiv.org/pdf/math/9901142)

Here is an explicit common gap in the exact normalization. The Example 1.5 cone has unit link $w(\tau)=(\pm3u'/2,\sqrt{c/u}\cos\tau,\sqrt{c/u}\sin\tau,\pm u)$, with $0<u\le1$, $|u'|\le2/3$, $u''=-4u/9+2c/(9u^2)$. Its angular integration interval covers at least $2\pi$. $w$ parametrizes the link on the unit sphere, so $|w|=1$ and $w\perp w'$. The area element is $r|w'|\,dr\,d\tau$ and the form on the oriented tangent plane is its positive comass $r\sqrt{c/u+4u^2}$ times that area element. Consequently
\[
 \delta=\tfrac13\int \sqrt{c/u+4u^2}\,|w'|\,d\tau.
\]
For $c\ge1/100$, the angular component gives $|w'|\ge\sqrt{c/u}$ and $\delta\ge2\pi/300>1/50$. For $c<1/100$, at a maximum $u_{\max}\ge1/\sqrt3$ by the turning-point equation $u^3-u+c=0$ (the maximum is its larger positive root). On the interval of length $1/2$ about that maximum, read cyclically, $u\ge1/\sqrt3-1/6>2/5$. The $t$ component gives $|w'|\ge 3|u''|/2\ge 2u/3-c/(3u^2)>1/5$ and the comass factor exceeds $4/5$. Hence $\delta>2/75>1/50$. Rotations, either nappe and multiplicities preserve the lower bound.

If all limiting densities lie below $2/3+1/50$, all cone and axial tangent terms vanish everywhere and $p\equiv1$. After the §6 splitting there are no isolated cone terms, and every point is regular by the local-minimum criterion on $p$. Proposition 7.1 and §8 give the analytic equatorial graph everywhere. The descent above gives 1. Conversely an embedded one-sheet collar with signed degree $+1$ has a single equatorial tangent with multiplicity one and density $2/3$.

For fixed $s$, moving a centre by distance $a$ along the model circle changes its weight by at most $ka/s$ pointwise. One can use the quotient product distance in the entire tube because the centre is on its axis and $2s$ is below the injectivity radius and tube radius. The positive measure $T(\bar\omega)$ has total mass $P$. Thus $|D_s(v)-D_s(v_j)|\le kPa/(b_\chi s^4)$, with no covering factor. Monotonicity proves $3\Rightarrow2$. If 2 holds, choose any common decreasing sequence $s_j\to0$ of admissible scales. The continuous $D_{s_j}$ decrease to the constant $2/3$ on compact $Z$, hence converge uniformly. Fix one such scale with margin, then take a fine enough net to satisfy 3. This proves the equivalence.

**Tests supported off the zero circle.** The local smooth primitive
\[
  \beta=-f\,dt-z(x\,dy-y\,dx)
\]
is deck invariant, $d\beta=\bar\omega$, and $|\beta|^2=\rho^4/4+z^4\le N^4$. For $\chi_s=\chi(r_v/s)$, Stokes on the proper normalization gives $\int_T\chi_s\bar\omega=-\int_T d\chi_s\wedge\beta$. To justify the omitted axis, insert a cutoff $\eta_\epsilon(N)$ that vanishes up to $\epsilon$, equals one beyond $2\epsilon$, and has derivative bounded by a constant times $1/\epsilon$. The comass of $\bar\omega$ is $\lambda=\sqrt{\rho^2+4z^2}\ge N$, attained on the current. The $d\eta_\epsilon$ term is bounded by a constant times the positive energy in a shrinking annulus and tends to zero. For fixed $\epsilon$, replacing the last integrand by $-\eta_\epsilon d\chi_s\wedge\beta$ changes the sample numerator by at most $2k\epsilon P/s$. It is now a smooth compactly supported test form away from $Z$. To use it in 3, add $2k\epsilon P/(b_\chi s^4)$ and any error in estimating the pairing. Weak convergence alone provides no error bound for a specified finite approximation. [Independent density and cutoff check](../reviews/E15_DENSITY_TEST_20261127.md)

**Range of scales.** In the projected chart let $R=(t-t_v)\partial_t+x\partial_x+y\partial_y+z\partial_z$, $\theta=\iota_R\bar\omega/3$. The homogeneous form gives $\theta-\beta=d((t-t_v)f)/3$. Pair this difference with $d\chi_s$ on the normalization. Its integral is zero by Stokes with the same axis cutoff, since $|(t-t_v)f|\le2sN^2$ on the support and the cutoff error tends to zero with annular energy. Thus $\sigma(s)=\int_T\chi_s\bar\omega=-\int_T d\chi_s\wedge\theta$. Using $|\theta|\le r_v\lambda/3$ and $\chi'\le0$ gives $\sigma(s)\le s\sigma'(s)/3$. Differentiation follows from finite energy and smooth cutoff. This proves monotonicity at every scale satisfying the stated strict radius restriction, including the measurement scale in condition 3.

**What Seiberg–Witten data would measure.** Put $\mu_j=-\eta_\epsilon d\chi_{s,j}\wedge\beta$. For the convergent subsequence defining the marked current, Taubes's normalization gives
\[
 T(\mu_j)=\lim_{n\to\infty}\frac{i}{4\pi}
     \int_Y(F_{A_n}-F_{A^0})\wedge\mu_j ,
\]
where $A^0$ is the canonical connection on $K^{-1}$ off $Z$. The same subsequence works for all the compactly supported tests once $s,\epsilon$ and the net are fixed. At finite parameter the relevant pairing is signed. Indeed on an open part of the shell with $\eta_\epsilon=1$ and $d\chi_{s,j}\ne0$, one has $d\mu_j=d\chi_{s,j}\wedge\bar\omega\ne0$, since wedging with a symplectic form is injective on one-forms in four dimensions. Such a part exists for $\epsilon$ small relative to $s$. Even for a fixed determinant bundle, an arbitrary connection variation $A\mapsto A+i\tau a$ changes this pairing by $-\tau\int a\wedge d\mu_j/(4\pi)$. A supported $a$ proportional to the Hodge dual of $d\mu_j$ makes this nonzero. This identifies precisely why a Chern-class evaluation cannot supply the numerical sample. Bounding it along actual solutions uses the equations or other additional geometry. [Taubes, §7(a), (7.1)–(7.3), and §7(d–f)](https://arxiv.org/pdf/math/9907199#page=36)

## What this decides for the marked manifold

| Assertion | Evidence after this test |
| --- | --- |
| Algebraic degrees | Signed meridian and exterior boundary $+1$, cap-line intersection zero, global multiplicity one and area $P>0$. |
| Embedded boundary collar | Proved off finitely many basepoints for a cap-relative choice of metric. For one fixed marked current the density criterion characterizes a full collar. No local upper bounds for such a current on an arbitrary capped input are presently certified. |
| Interior disk | One would need the normalized filling to be a disk and control immersion, self-intersections and embeddedness. The collar supplies only its boundary end. |
| Relative removal | One would need a deformation through the prescribed marking that eliminates the circle with the cap fixed. A local replacement fixing the outer normal-sphere germ already faces LINE's meridional obstruction. |

**Decision.** The localized axial perturbation closes one part of the regularity question. The finite exceptional set is the geometric target. Local model examples settle the limitations of signed counting. A next global estimate may now use a finite family of compactly supported pairings on the chosen SW current. The author supplied no session count for Gate 2 and no decision to open a Lean edition.
