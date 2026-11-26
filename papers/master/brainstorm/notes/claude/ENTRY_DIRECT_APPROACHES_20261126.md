# Direct approaches to entry: necessary conditions, a folded branch, and transfers to the standard sphere

26 November 2026 (America/New_York). Brainstorm note prepared for Edward B. Baker III by Claude (Anthropic, model `claude-fable-5-2`, Cowork session; reasoning effort is not exposed to the session). It answers the question "what would help to tackle entry directly?". Input: the repository at `9c80575988ad8915ad39515c64400e3d8590cf46`, in particular [section E of the master plan](../../../research-plan/PLAN.md#e--entry), the [immersed criterion](../../../manuscript/immersion_entry.tex), the [earlier entry note](../ENTRY_AND_CONCENTRATION_20261125.md) and [finding F1 of the external review](../../../reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md).

Evidence scope. *Known* means quoted from the cited source. *Here* means a short derivation made for this note; every formula so marked is tested in the [check scripts](ENTRY_DIRECT_APPROACHES_20261126_checks/README.md) (38 checks, all pass). *Sketch* means an outline that was not checked in detail. Nothing here was read by a specialist, and the session was cut short, so sections 5 to 7 are terser than intended. No file outside this folder was changed, and the note is not linked from any index.

## 1. Summary

Entry on a homotopy four-sphere $M$ asks for a class with $Y>0$ and $e<2T$. If X (now at working-manuscript level in investigation 06) and R hold, entry on a given $M$ is equivalent to $M\cong S^4$. A universal construction of entry is therefore the theorem itself, and no soft argument should be expected. What can be done directly is of three kinds: prune the constructions that cannot work, relocate the question to a place where metrics are explicit, and certify single candidates. The note's contributions, in the order I would use them:

| | Statement | Status |
| --- | --- | --- |
| 1 | Seam lemma: in an entry class every closed totally umbilic hypersurface carries positive scalar curvature. A reflection-symmetric positive class on the identity double of a contractible $W$ has $e\ge 2T$ unless $\partial W$ is $S^3$ or a sum of Poincaré spheres. For the Mazur control with face $\Sigma(2,5,7)$, a totally geodesic filling cannot have both the positive sign and the half budget. | here, 5-line proof |
| 2 | The covering involutions of Kuhrman's homotopy spheres preserve no metric of positive scalar curvature, so no invariant entry class exists there. | known (Kuhrman, Miyazawa) |
| 3 | An embedded hypersurface of $\mathbb R^5$ with positive induced scalar curvature bounds a five-dimensional 2-handlebody, so it lies in the family $\Sigma_P$. | here, relies on Harvey–Lawson and Sha |
| 4 | Folded maps $M\to\mathbb R^4$: they exist on every homotopy four-sphere with fold a small $S^3$; a count of index-two points gives a direct exit, $\int_{S_{(1,2)}}\lvert\kappa_1\kappa_2\kappa_3\rvert<2\pi^2$ or $\int_S\lvert A^\circ\rvert^3<3\sqrt6\,\pi^2$ on the fold image. | here; a reformulation |
| 5 | Positive scalar curvature on $M$ is equivalent to a metric on $M\setminus B$ with three positivities: scalar curvature, boundary mean curvature, and scalar curvature of the boundary metric. On spheres without 3-handles the first two are known. | here |
| 6 | A Gluck twist is a rotation flux of $2\pi$ and costs at most about $72/(\cosh R_1-1)$ of Weyl energy per sign across a product collar of hyperbolic radius $R_1$. | here, checked numerically; sign is a sketch |
| 7 | Branch-surface cores with $K+k=0$ have zero product cost at every size; E10, E15 and E18 tested the opposite, thin regime. | here |
| 8 | Certificates: pointwise open conditions on one metric, suited to interval arithmetic. | proposal |

## 2. Entry and the exits

The plan records the three forms of entry: $Y>0$ with $e<2T$; $Y>0$ with $\int\sigma_2(A)>0$; and, by Chang–Gursky–Yang (2002), a metric with $R>0$ and $\lvert\mathrm{Ric}_0\rvert^2<R^2/12$ everywhere. One more form of the last is used below. On the cone $\Gamma_2^+$ the first Newton tensor is positive, and $\sigma_1(A)g-A=-\tfrac12G$ with $G=\mathrm{Ric}-\tfrac R2g$. So an entry metric has negative definite Einstein tensor: for every unit vector $\nu$,

$$R-2\,\mathrm{Ric}(\nu,\nu)>0 .$$

This is the upper half of the plan's $0<2\,\mathrm{Ric}<Rg$, and it is positive 1-curvature in Labbi's sense (known: Botvinnik–Labbi). Checks: `check_01` (a) to (c).

Direct exits need no R: $e\le T$, the uniform gap, the Chen–Zhu spectral test $36\ell^2\le Y^2$, and the immersed tests. For certificates the pointwise forms are the useful ones: Margerin's $\lvert W\rvert^2+2\lvert\mathrm{Ric}_0\rvert^2<R^2/6$ with $R>0$, and positive isotropic curvature, for which Chen–Tang–Zhu give $S^4$ on a simply connected manifold.

## 3. Necessary conditions

**Lemma 3.1 (seam lemma; here).** Let $(M^4,[g])$ be closed with $Y>0$ and $\int\sigma_2>0$, and let $\Sigma^3\subset M$ be a closed hypersurface that is totally umbilic for $[g]$. Then $\Sigma$ admits a metric of positive scalar curvature.

*Proof.* Take $\hat g\in[g]$ with $\sigma_2(A_{\hat g})>0$ and $R_{\hat g}>0$ (Chang–Gursky–Yang). Umbilicity is conformally invariant. The Gauss equation for any hypersurface reads $R_\Sigma=-2G(\nu,\nu)+2\sigma_2(\kappa)$, and $2\sigma_2(\kappa)=\tfrac23H^2-\lvert A^\circ\rvert^2$. With $A^\circ=0$ and $-G>0$ this gives $R_{\hat g\vert\Sigma}>0$. Checks: `check_01` (d), (e).

**Corollary 3.2 (reflections; here).** If a conformal class is invariant under a smooth involution whose fixed set contains a closed hypersurface $\Sigma$, and the class satisfies entry, then $\Sigma$ admits positive scalar curvature. An invariant metric exists in the class, its fixed set is totally geodesic, and the lemma applies.

**Corollary 3.3 (identity doubles; here).** Let $W$ be compact and contractible and $D=W\cup_{\mathrm{id}}(-W)$. If $\partial W$ is not $S^3$ or a connected sum of Poincaré spheres, every swap-invariant class on $D$ with $Y>0$ has $\int\sigma_2\le0$, that is $e\ge2T$. For the marked Mazur half the face is $\Sigma(2,5,7)$, which is aspherical. The register entry for B02 says that "the sign and the half budget remain open" for a totally geodesic filling. They cannot both hold: a smooth even extension with positive sign and two-sided energy below $8\pi^2$ on the half would be a symmetric entry class with a totally geodesic seam. Since $D\cong S^4$ here, this is a statement about the symmetric ansatz and says nothing about entry. The reflected control should be closed as negative and replaced by a test that lets the seam bend.

**Corollary 3.4 (product strips; here).** If a closed entry class retains a strip conformal to $dt^2+\gamma$ on $[0,L]\times Y$, of any length, then $Y(Y,[\gamma])>0$. This complements the long-strip obstruction of [`prop:marked-double-neck`](../../../../investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/marked_double_exterior.tex) and excludes the exact product bands of 05 over sections without positive scalar curvature, whatever their Weyl cost.

**Proposition 3.5 (how much a seam must bend; here).** For any closed hypersurface $\Sigma$ in an entry class, $\int_\Sigma\lvert A^\circ\rvert^3\ge\big(-Y(\Sigma,[g\vert_\Sigma])\big)_+^{3/2}$. The left side is conformally invariant. In the gauge $\hat g$ one has $\lvert A^\circ\rvert^2>-R_\Sigma$ pointwise, and $Y\ge-\lVert R^-\rVert_{L^{3/2}}$ by Hölder. For a hyperbolic $\Sigma$ the bound is $6^{3/2}\,\mathrm{vol}_{\mathrm{hyp}}(\Sigma)$, using that the hyperbolic metric realizes the Yamabe invariant.

**3.6 Equivariant obstruction (known).** Kuhrman shows that the branched double covers of the roll-spun knots $\rho K(2,3,\lvert6s+1\rvert)$ are homotopy four-spheres, not known to be standard for $s\ne0,-1$, and that Miyazawa's real Seiberg–Witten invariant of the covering involution takes the values $3,5,7,\dots$ there. The invariant is trivial for an involution preserving a metric of positive scalar curvature. An invariant class with $Y>0$ contains an invariant metric of positive scalar curvature (first eigenfunction of the conformal Laplacian), so these spheres carry no invariant entry class, and the orbifold form of entry on $(S^4,\rho K)$ with cone angle $\pi$ has no solution.

The common message of 3.3 and 3.6: an ansatz that keeps the symmetry of the construction of $M$ is obstructed in both natural families, and it is obstructed on standard controls too.

## 4. The immersed branch: where the sign can come from

**Proposition 4.1 (here; relies on cited theorems in handle form).** Let $F:M^4\hookrightarrow\mathbb R^5$ be a closed embedded hypersurface with induced $R>0$. Since $R=2\sigma_2(\kappa)$ and $H\ne0$, the principal curvatures for the inner normal lie in $\Gamma_2^+$, so every sum of three of them is positive (`check_02` c). The bounded domain is then strictly 3-convex, and it is built from handles of index at most two (Harvey–Lawson, Theorem 3.10 and the Morse theory of a strictly 3-plurisubharmonic exhaustion; Sha). If $M$ is a homotopy sphere the domain is contractible, so $M$ is the boundary of a contractible five-dimensional 2-handlebody: the family $\Sigma_P$ and its framing variants. On any other type the sign $Y>0$ cannot be read off the induced scalar curvature of an embedding and has to come from the conformal class. The cited statements give the homotopy type; the handle form comes from the same Morse function and should be checked.

**4.2 Which cores cost energy (here).** For $\lvert W^\pm\rvert^2=\tfrac1{12}\big[(\kappa_1-\kappa_4)^2(\kappa_2-\kappa_3)^2+(\kappa_1-\kappa_3)^2(\kappa_2-\kappa_4)^2+(\kappa_1-\kappa_2)^2(\kappa_3-\kappa_4)^2\big]$, tubes about flat cores of dimension 0, 1, 3 and 4 are Weyl-flat and only two-dimensional cores cost, $1/(6\varepsilon^4)$ per unit volume. The tube of radius $\varepsilon$ about a round $S^2(\rho)\subset\mathbb R^3\subset\mathbb R^5$ has exactly

$$E_\pm=\frac{8\pi^2}{3}\,\frac{1}{t^2(1-t^2)},\qquad t=\varepsilon/\rho ,$$

with minimum $32\pi^2/3$ at $t^2=\tfrac12$, where the induced metric is conformal to the product of two unit spheres. This is Gursky's lower bound on $S^2\times S^2$, and twice it is the $64\pi^2/3$ of F1. Two-dimensional cores are cheapest when fat, and one closed-up handle pair already exceeds the budget (`check_02` a, b, d).

## 5. A folded branch

**5.1 Existence (known, with a short bundle computation).** A folded map has only fold singularities. By Eliashberg's theorem, in the form of Eliashberg–Mishachev Theorem 1.2.4, folded maps $V^4\to\mathbb R^4$ with prescribed nonempty fold $S$ exist as soon as the bundle $T_SV$, obtained from $TV$ by regluing along $S$ with the normal reflection, is trivial. For a homotopy four-sphere and $S=\partial B$ a small sphere, $T_SM$ is stably trivial with Euler number $\chi(M\setminus B)-\chi(B)=0$, hence trivial. So every homotopy four-sphere has folded maps to $\mathbb R^4$ folded exactly along a small $S^3$: an immersed three-sphere in $\mathbb R^4$ that bounds, on the same side, an immersed ball and an immersed copy of $M\setminus B$. If the fold image is embedded, $M$ is standard.

**Lemma 5.2 (index rule; here).** Let $\nu$ be the unit normal of the fold image pointing away from the local image, and $\kappa_i$ its principal curvatures, positive for a convex body. The height $\langle f,u\rangle$ on $M$ is critical exactly at fold points with $\nu=\pm u$, nondegenerate when $\kappa_1\kappa_2\kappa_3\ne0$, with index $1+\#\{\kappa_i>0\}$ if $\nu=u$ and $\#\{\kappa_i<0\}$ if $\nu=-u$. This follows from the normal form $(x_1^2,x_2,x_3,x_4)$; it is tested on a folded map $S^2\times S^2\to\mathbb R^4$ (`check_01` i).

**Proposition 5.3 (folded exit; here).** Let $S_{(1,2)}$ be the part of the fold image with one positive and two negative principal curvatures. Then $\int_{S^3}m_2(u)\,du=2\int_{S_{(1,2)}}\lvert\kappa_1\kappa_2\kappa_3\rvert$. By the [one-middle-handle lemma](../../../../investigations-1/04_hypersurface_immersions/manuscript/chiral_energy_of_hypersurface_immersions.tex) a nonstandard $M$ has $m_2\ge2$ for every Morse function, so

$$\int_{S_{(1,2)}}\lvert\kappa_1\kappa_2\kappa_3\rvert<2\pi^2\quad\Longrightarrow\quad M\cong S^4 .$$

On $S_{(1,2)}$ one has $\lvert\kappa_1\kappa_2\kappa_3\rvert\le\tfrac{\sqrt6}{9}\lvert A^\circ\rvert^3$, sharp at $(1,-2,-2)$, so $\int_S\lvert A^\circ\rvert^3<3\sqrt6\,\pi^2\approx72.5$ suffices, and this integral is Möbius invariant. No Yamabe sign and no smoothing enter. The count is attained with equality by the folded $S^2\times S^2$ tube (`check_01` f to h). The same argument with $m_1+m_3$ gives the exit $\int_{S_{(0,3)}\cup S_{(2,1)}}\lvert\kappa_1\kappa_2\kappa_3\rvert<2\pi^2$.

Remarks. This is the planar limit of the count behind Theorem 3.1: for a pancake $(f,\varepsilon h)$ the Gauss-map count converges to the folded one, while the induced Weyl energy diverges like $\tfrac{\pi}{4\delta}\int_S\lvert A^\circ\rvert^2$ at a rim of radius $\delta$ (`check_02` e). So the folded exit is not a limit of the $64\pi^2/9$ test. It is a reformulation: like every exit it can hold only on the standard sphere. For a doubled immersion of a contractible $W\not\cong B^4$ it fails by construction, because each height on $W$ needs a 2-handle (sketch); it can only be met by maps that break the doubling symmetry, in line with section 3. The pulled-back flat metric has scalar curvature $4H$ times the measure of the crease, so a mean-convex fold gives positive scalar curvature after smoothing (Miao), and then both sides are built from handles of index at most two (Sha). Its smoothing costs about $\tfrac1w\int_S\lvert A^\circ\rvert^2$ of Weyl energy per sign at width $w$, so in this branch the exit, not entry, is the natural target.

## 6. Positive scalar curvature first

**Proposition 6.1 (here).** Let $B\subset M$ be a ball and $M_0=M\setminus\mathrm{int}\,B$. Then $M$ has positive scalar curvature if and only if $M_0$ has a metric with $R>0$, mean-convex boundary, and positive scalar curvature of the induced boundary metric. If $M$ has such a metric, the Gromov–Lawson sum of a round cap smaller than a hemisphere with $M$ gives the metric on $M_0$. Conversely the boundary metric on $S^3$ is isotopic to the round one through positive scalar curvature (Marques), the isotopy gives a collar, and the corner is admissible (Miao).

For a sphere without 3-handles $M_0$ is a 2-handlebody, and the first two positivities are available (Sweeney, as used in `boundary_class.tex`). The first obstruction to positive scalar curvature on such an $M$ is therefore the scalar curvature of the boundary metric. No handle-by-handle construction can supply it, since the same construction on a general 2-handlebody has a boundary with no such metric. A metric of positive scalar curvature on any homotopy four-sphere outside the family $\Sigma_P$ would be new; the Cappell–Shaneson spheres outside the known standard ranges and Kuhrman's spheres are explicit candidates.

## 7. Transfers to the standard sphere

**7.1 Isometric regluing (here; a reformulation).** If a metric on $C\cup_{\mathrm{id}}X$ induces on $\partial C$ first and second fundamental forms invariant under a diffeomorphism $f$, the same metric on $C\cup_fX$ is $C^{1,1}$ with the same curvature almost everywhere, so pointwise $\Gamma_2^+$ transfers. Every homotopy four-sphere is $C\cup_fX$ with $S^4=C\cup_{\mathrm{id}}X$, $C$ contractible (Curtis–Freedman–Hsiang–Stong, Matveyev). By section 3 such a seam is not umbilic unless $\partial C$ has positive scalar curvature, and it satisfies Proposition 3.5.

**7.2 Gluck twists as flux (here; sign is a sketch).** On $D^2\times S^2$ put

$$g_s=dR^2+\sinh^2\!R\,d\theta^2+d\varphi^2+\sin^2\!\varphi\,\big(d\psi-s(R)\,d\theta\big)^2 .$$

For $s=0$ this is $H^2\times S^2$, which is conformally flat. Where $s$ is constant it is again the product in the coordinate $\psi-s\theta$, and for $s=1$ that change of coordinate is the Gluck twist. A profile rising from 0 to 1 therefore gives a smooth metric on the reglued $D^2\times S^2$. With constant flux, $s=c(\cosh R-1)$, one finds $\lvert W^\pm\rvert^2=\tfrac{c^2}{6}(c\sin^2\varphi\mp3\cos\varphi)^2$ and $R=-\tfrac{c^2}{2}\sin^2\varphi$, so the energy per sign over the disk with $\cosh R_1-1=1/c$ is $4\pi^2c\,(1+O(c^2))$; with a $C^2$ cut-off reaching $s=1$ it is about $72/(\cosh R_1-1)$ (`check_03`). Hence, if a positive class on $S^4$ contains about a 2-knot $K$ a collar conformal to $D_{R_1}\times S^2\subset H^2\times S^2$, the Gluck twist $\Sigma_K$ has a class with $E_\pm$ larger by at most that amount. The transfer needs a wide collar: a class on the standard sphere of energy below $2T$ in which $K$ is conformally fat. Whether one exists for a knotted $K$ is open. This fits the plan's reserved Gluck test.

**7.3 Branch surfaces.** In the notation of E15 the product cost of a core is $\tfrac{\pi}{3}A\big[\int(f'')^2/f-2K\delta+K^2V\big]$. For $f=\sinh(\sqrt K r)/\sqrt K$ one has $V=\delta/K$ and the cost vanishes at every core size (`check_02` f): the model is $H^2\times S^2$. E10, E15 and E18 fix the tangential patch and let $V\le C\epsilon^2$ shrink, which excludes it. The untested regime has normal area $2\pi\delta/K$ comparable to the tangential scale, and is available at no cost only for sphere components, asymptotically for tori. For a simple five-fold cover of $S^4$ by a homotopy sphere, Riemann–Hurwitz gives $\chi(F)=8$, so at least four components of the branch surface are spheres.

## 8. Certificates, and what not to do

Entry, Margerin pinching and positive isotropic curvature are open pointwise conditions on the 2-jet of one metric, and the folded and immersed exits are integrals of explicit integrands. A numerical search followed by interval arithmetic can therefore prove entry, or standardness outright, for one explicit candidate. The optimiser must in effect find the diffeomorphism, so I would calibrate on controls first: the Mazur double, where section 3 says the search has to leave the symmetric basin, and Cappell–Shaneson spheres known to be standard. A certificate of positive scalar curvature alone on an unrecognized candidate would already be a new result. I have not tried any of this.

Not recommended: handle-by-handle constructions with isolated 2-handle pairs (4.2), symmetric ansätze (section 3), and flows started outside entry, which are X and R without the pinching that makes Bour's flow work.

## 9. Suggested order

1. Check Lemma 3.1 and record Corollary 3.3 against B02; close the reflected Mazur control.
2. Check Lemma 5.2 and Proposition 5.3 and decide whether the folded exit helps the two-handle arm.
3. State Proposition 6.1 for spheres without 3-handles and ask for the boundary positivity.
4. Fix one 2-knot and ask how wide a product collar a positive class below $2T$ can have (7.2).
5. Redo E15 in the fat regime (7.3).
6. Calibrate a certificate search on the controls.

## 10. Limits

Not verified: the handle form of the Sha, Wu and Harvey–Lawson theorems; the proofs behind Eliashberg–Mishachev 1.2.4 and Kuhrman's Theorem 3, which I quote from the papers through an automated reader; the Yamabe sign in 7.2; the remark on doubled immersions in section 5; the smoothing of $C^{1,1}$ metrics in 7.1. The checks are floating-point and computer-algebra tests of formulas and constants on explicit examples and random data; they are not proofs.

## Sources

Chang, Gursky, Yang, [Ann. of Math. 155 (2002)](https://annals.math.princeton.edu/2002/155-3/p02) · Kuhrman, [arXiv:2507.03798](https://arxiv.org/abs/2507.03798) · Eliashberg, Mishachev, [arXiv:1108.1270](https://arxiv.org/abs/1108.1270) · Harvey, Lawson, [arXiv:1111.3895](https://arxiv.org/abs/1111.3895) · Sha, [Invent. Math. 83 (1986)](https://eudml.org/doc/143322) and [J. Differential Geom. 25 (1987)](https://projecteuclid.org/journals/journal-of-differential-geometry/volume-25/issue-3/Handlebodies-and-p-convexity/10.4310/jdg/1214440980.pdf) · Lawson, Michelsohn, [Invent. Math. 77 (1984)](https://link.springer.com/article/10.1007/BF01388830) · Chen, Tang, Zhu, [arXiv:0810.1999](https://arxiv.org/abs/0810.1999) · Margerin, as quoted in [arXiv:math/0309287](https://arxiv.org/abs/math/0309287) · Gursky's inequality, as quoted in [arXiv:1310.0848](https://arxiv.org/abs/1310.0848) · Labbi, [Ann. Global Anal. Geom. 15 (1997)](https://doi.org/10.1023/A:1006553611999); Botvinnik, Labbi, [arXiv:1305.5313](https://arxiv.org/abs/1305.5313) · Matveyev, [arXiv:dg-ga/9505001](https://arxiv.org/abs/dg-ga/9505001); Kirby, [arXiv:math/9712231](https://arxiv.org/abs/math/9712231) · Kim, Yamada, [arXiv:1707.03860](https://arxiv.org/abs/1707.03860); Iwaki, [arXiv:2404.05096](https://arxiv.org/abs/2404.05096) · Rosenberg, Weinberger, [arXiv:2201.01263](https://arxiv.org/abs/2201.01263) · Sweeney, [arXiv:2507.15719](https://arxiv.org/abs/2507.15719)
