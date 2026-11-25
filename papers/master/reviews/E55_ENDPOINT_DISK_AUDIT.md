# E55r · Endpoint disk capture audit

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E check for the master fixed-type descent investigation.
Actual serving model and reasoning effort are unavailable. Frozen base
`b5de9758f16e14f22162b4a1e091166ea126c389`, E52 master bundle
`2867c940507acb77`, E51 fixed-type bundle `f50a339b25823e19`, and
`physical_volume.tex` SHA-256 prefix `b972bc5466245c5d`. This audit also
checked the [endpoint section](../01_fixed_type_variational_descent/manuscript/endpoint_charge.tex)
at SHA-256 prefix `e5c5f6d7a9e950c7`. The E51 and E52 bundle identifiers
are from the [E51](../research-progress/handoffs/E51_COMPANION_DRAFTS_20261125.md)
and [E52](../research-progress/handoffs/E52_RECOGNITION_ENDPOINT_20261125.md)
version records.

The finite disk theorem passes. For every sequence of smooth volume-one
positive Yamabe metrics on a fixed hypothetical nonstandard oriented smooth
homotopy four-sphere with $e_i=E_+(g_i)\to I^+(M)=T=4\pi^2$, a single
subsequence in the stated positive-Ricci comparison gauge works for all
tolerances. For each $\epsilon,\zeta,r_*>0$ there are finitely many
fixed positive radii below $r_*$ and disjoint smooth parametrized standard
disks, for all sufficiently large indices. Their union leaves less than
$\epsilon$ of the sum of the two original chiral measures, and each
containing comparison ball has less than $\zeta$ of the original
full-tensor curvature measure. First-order control of a marked bicollar and
its aggregate replacement cost are additional requirements for descent.

## Normalization and the auxiliary representative

Use the Hilbert–Schmidt norm of the real Weyl endomorphisms on
$\Lambda^\pm$. For a trace-free block with sorted eigenvalues
$a\le b\le z$, one has $z\ge0$ and
$|W|^2=(3z^2+(a-b)^2)/2$. With $L=\max(z_+,z_-)$, this proves the
pointwise identity for the defect density
$$
\tfrac23(|W^+|^2+|W^-|^2)-L^2
=\tfrac13[(a_+-b_+)^2+(a_--b_-)^2]+\min(z_+^2,z_-^2).
$$
Its integral is $B=4e/3-\int L^2dV$ by equality of the closed chiral
integrals. The selected smaller block contributes at most $3B/2$ after
integration, with either assignment where the two largest eigenvalues tie.
Chen–Zhu Theorems 1.4 and 1.6 exclude $Y^2\ge36\int L^2dV$ on this
smooth type. The connected-sum classification reduces to $S^4$ by
simple connectivity. A compact quotient of $S^3\times\mathbb R$ has a
nontrivial fundamental group, and van Kampen detects every such factor
and each projective factor. Both equality alternatives have nonzero second
homology in the simply connected case. Substitution of
$Y^2=12D-48e+384\pi^2$ yields $D+3B<8(e-T)$. Thus
$D_i,B_i\to0$ and $Y_i,6\|L_i\|_2\to y_*=8\sqrt3\,\pi$.
[Chen–Zhu, *A conformally invariant classification theorem in four dimensions*, Comm. Anal. Geom. 22 (2014), pp. 814–816, Theorems 1.4, 1.6 and 1.7](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)

The same classification applied to the supremum of the modified Yamabe
constants gives $c_i\le0$ on each class. Chen–Zhu Lemma 2.1 applies to
$6L$ by the explicit specialization in their §3. Their enlarged class
allows $q_i=u_i^2g_i$ with a strictly positive $C^{2,\alpha}$ factor $u_i$ and
$R_{q_i}-6L_{q_i}=c_i$ after volume-one normalization. The Yamabe
inequality also holds on $q_i$ by covariance on $H^1$, or approximation
of the factor. If $a_i=\int L_{q_i}dV_{q_i}$ and
$l_i=\|L_{g_i}\|_{2,g_i}=\|L_{q_i}\|_{2,q_i}$, then
$$
Y_i-6l_i\le c_i\le0,\qquad
0\le6(l_i-a_i)\le6l_i-Y_i.
$$
Since $\|L_{q_i}-l_i\|_{2,q_i}^2=2l_i(l_i-a_i)$, the scalar equation
gives $\eta_i=\|R_{q_i}-Y_i\|_{2,q_i}\to0$. The trace identity and
Cauchy–Schwarz give, for $\mu_i=dV_{q_i}$ and
$\lambda_i=\lambda_i^++\lambda_i^-$,
$$
\left\|\frac{\lambda_i}{2T}-\mu_i\right\|_{\mathrm{TV}}
\le \frac{3}{4T}\left(B_i+\|L_{q_i}^{\,2}-4T/3\|_{1,q_i}\right)\to0.
$$
Both chiral measures keep their original values on each measurable subset
of $M$, by conformal covariance of the Weyl operator and the volume.
[Chen–Zhu, (2.3)–(2.6), Lemma 2.1 and §3, pp. 819–824](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf#page=9)

## Capacity and the single Sobolev step

The positive-Ricci comparison metric comes from the smooth class of
$g_i$, using $Y_i>0$ and $4\int\sigma_2(A_{g_i})=16\pi^2-2e_i>0$.
Positive Ricci curvature persists after scaling the least radius of a ball
of $\mu_i$-mass one half to one. Distance spheres have zero comparison
volume, hence zero $\mu_i$-mass, and compactness of $M$ gives an
attaining center. [Chang–Gursky–Yang, Ann. of Math. 155 (2002), Theorem A and Corollary B, p. 712](https://arxiv.org/pdf/math/0409583#page=4)

The capacity argument requires only an upper bound on the scalar term.
If $\chi$ is supported on a set of $\mu_i$-mass at most one half,
Hölder gives $\int R_{q_i}\chi^2d\mu_i\le(Y_i/\sqrt2+\eta_i)
\|\chi\|_{4,q_i}^2$. Thus the left coefficient in the cutoff estimate is
$(1-2^{-1/2})Y_i-\eta_i$, which stays uniformly positive. The
fourth-power gradient integral remains conformally invariant. Inward
logarithmic cutoffs for outer radii at most one and reversed cutoffs about
an attaining center for inner radii at least one give the two power
bounds, with the same iteration as in the reviewed input. The fixed
fraction of mass in a packing ball, followed by its linear cutoff and
relative Bishop–Gromov, proves comparison noncollapse on each bounded
window. [Capacity and packing in the physical-volume proof](../manuscript/physical_volume.tex#L57)

For $q_i=w_i^2k_i$, the scalar equation with $\Delta=\mathrm{div}\nabla$
implies $-\Delta_{k_i}w_i\le V_i w_i$, with
$V_i=(R_{q_i})_+w_i^2/6$. On a comparison ball $U$,
$$6\|V_i\|_{2,k_i;U}\le Y_i\sqrt{\mu_i(U)}+\eta_i.$$
For each bounded window choose a fixed small radius for all its centers,
then take the index large. The noncollapsed local Sobolev prefactor is
uniform on the window, and the small-ball power bound makes the displayed
potential norm absorbable. Testing with $\chi^2w_i^3$ produces the
gradient term $\frac34\int\chi^2|d(w_i^2)|^2$ before Young's inequality.
Apply Sobolev to $\chi w_i^2$, absorb
$\int V_i(\chi w_i^2)^2$ by Hölder, and use $\int w_i^4dV_{k_i}=1$.
This gives a uniform $L^8(k_i)$ bound on each half-ball, hence a
uniform $L^2(k_i)$ bound for $w_i^4$ on each bounded window by packing.
The fixed exponent $p=4$ suffices. The higher-exponent iteration for
the ordinary Yamabe representative relies on extra control of its
potential. [Saloff-Coste, *Uniformly elliptic operators on Riemannian manifolds*, J. Differential Geom. 36 (1992), Theorem 3.1, p. 423](https://pi.math.cornell.edu/~lsc/papers/uniformly-jdg.pdf#page=7)

## Weak limits and transfer

In a common pointed realization, the preceding density bound gives
$\lvert\int \phi\,d\mu_i\rvert\le C_D\|\phi\|_{L^2(k_i)}$ for
continuous tests supported in a fixed window. Pass to the limit using
the local weak convergence of the comparison volumes to $m=\mathcal H^4$.
This gives $\mu=fm$ with $f\in L^2_{\rm loc}(m)$. Tightness gives
$\mu(X)=1$. The original $\nu_i=|\mathrm{Rm}_{g_i}|^2_{\rm tens}dV_{g_i}$
have bounded mass and a subsequential local weak limit $\nu$. The atoms
of $\nu$ form a countable set, and together with the nonregular locus
they form a $\mu$-null set. At $\mu$-almost every remaining center,
the differentiation limit of $\mu(B_r(x))/m(B_r(x))$ is
$f(x)\in(0,\infty)$. This is the density wording to use in the endpoint
section. The comparison-volume density at Euclidean regular points is one
in Euclidean normalization. [Cheeger–Colding, *On the structure of spaces with Ricci curvature bounded below. I*, J. Differential Geom. 46 (1997), Theorems 2.1, 5.9 and 5.11](https://doi.org/10.4310/jdg/1214459974)

Small limit balls at these centers have arbitrarily small $\nu$-mass,
nearly Euclidean comparison volume, and small relative $\mu$-loss under a
shrink factor close to one. Select finitely many disjoint outer balls by
the same locally doubling Vitali argument. Choose the outer, embedded and
inner radii at continuity radii of the relevant limits and keep a strict
margin in the volume and mass bounds. Under fixed-radius transfer the
intermediate balls are disjoint by their positive separation in the
geodesic limit. The almost-maximal-volume embedding theorem gives a smooth
embedded open model ball containing the shrunken metric ball on each smooth
source. A closed sub-ball in its parametrizing domain then contains the
compact preimage of the desired inner metric ball. This supplies the
closed smooth disks on the original $M$. Their mass capture follows from
the fixed-radius lower bounds and total variation on those source sets.
The smooth-source part of the embedding theorem was checked in a reproduction
of the published text after the publisher returned an interstitial.
[Cheeger–Colding, Theorems A.1.8–A.1.9, pp. 458–459](https://www.researchgate.net/publication/315331142_On_the_structure_of_spaces_with_Ricci_curvature_bounded_below_I)

The comparison balls use $k_i$ distance, the capacity argument uses
$q_i$ volume, and the curvature ceiling uses the full tensor of the
original $g_i$. A curvature ceiling on the containing ball leaves the
bicollar interpolation estimates to be proved. If a later construction
does supply the required bicollars with cost $c_i<T-\epsilon$ at the
same indices, for $0<\epsilon<T$, then $e_i+c_i<2T$ eventually and
the retained positive class has energy below $\epsilon+c_i<T$. This
would give recognition by an actual smooth metric. [Simultaneous replacement hypotheses](../01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex#L137)
