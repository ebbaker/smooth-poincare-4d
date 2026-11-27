# Where the first-order and marked-cut tools can work in the broader program

26 November 2026 (America/New_York). Prepared for Edward B. Baker III by Claude (Anthropic) in a Cowork session; model `claude-fable-5-2`, reasoning effort at the session's configured maximum. This is the second brainstorm note of the session. The first is [paths forward after the attainment and entry trials](PATHS_FORWARD_AFTER_ATTAINMENT_AND_ENTRY_TRIALS_20261126.md).

**Question.** Whether I recommend parking the slide enumeration of [investigation 05](../../../../investigations-1/05_collar_deformation_and_surgery/README.md) or using its tools differently, and in what ways those tools, which grew out of [investigation 03](../../../../investigations-1/03_first_order_twistor/README.md), can serve the broader program.

**Inputs.** Repository at `de2125d` plus this session's uncommitted additions. Read for this note: 05's README, overview and plan; the README, overview, plan and register of its child 02; the doubled-tangle review; the notes on the [third](../../../../investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/GST_THIRD_SLIDE_QUOTIENTS.md) and [fourth](../../../../investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/GST_FOURTH_SLIDE_QUOTIENTS.md) slides and [`gst_four_slides.py`](../../../../investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/numerics/gst_four_slides.py); the abstract, the mixed-presentation theorem, the metric criteria and the open problems of [the marked-cut manuscript](../../../../investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex); from 03 the README, the [founding idea](../../../../investigations-1/03_first_order_twistor/brainstorm/notes/FIRST_ORDER_TWISTOR_IDEA_20261123.md) and the [collar program](../../../../investigations-1/03_first_order_twistor/brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md); one theorem of [04's manuscript](../../../../investigations-1/04_hypersurface_immersions/manuscript/chiral_energy_of_hypersurface_immersions.tex). Section 10 lists what I did not read.

**Evidence labels.** *[known]* a published result, cited where used. *[pipeline]* a result of the investigations, used as stated there and not re-proved. *[here]* a short derivation given in this note or a computation in the [checks folder](USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/README.md). *[numerical]* floating-point output, not a certified enclosure. *[sketch]* an argument with a named gap. *[assessment]* my judgement.

Notation: $T=4\pi^2$, $E_\pm(V)=\int_V|W^\pm|^2_{\rm HS}$, $e=E_+=E_-$ on a homotopy sphere, the band is $e<2T$, and $e_V=\tfrac12(E_+(V)+E_-(V))$ for a piece $V$. The *entering gauge* of a class with $e<2T$ and positive Yamabe constant is a representative with $R>0$ and $|Z|^2<R^2/12$ (Chang–Gursky–Yang, as in the master manuscript); it has $\mathrm{Ric}>0$.

## 1. Answer

I recommend a different use, not parking. Three things are separate here.

1. **The tools stay, and I would promote them.** The marked-cut language of 03 and 05 turns out to be the natural place for three statements the master program does not yet have: a ledger for the two chiral energies across a cut (section 3), selection rules saying which cuts of a handle presentation can be seams of an entering class (section 4), and the form every tube construction of 07 must take (section 5). Each of these came out of trying to answer your question, and each is stated below with what is proved and what is not.
2. **One activity should stop:** deepening the unstabilized slide search on $L_{3,1}$ as a route to a cancellation. A cancellation found there would trivialize the Akbulut–Kirby presentation $\langle x,y\mid xyx=yxy,\ x^4=y^3\rangle$ by Andrews–Curtis moves, which is open after long computer searches; a failure at bounded depth proves nothing about greater depth; and the four-manifold itself is already standard after stabilization. Section 6.1 gives the references.
3. **The enumeration's machinery is redirected, not shelved.** Its filters are statements about slides with *arbitrary* band paths, which is more than the length-bounded searches in the literature can say. Section 6 proposes to write the three-slide theorem up, to finish depth four with one bounded computation, and to reuse the quaternionic representations for two other jobs.

A correction to my own review. Finding F6 said 05 "adds little leverage". That judged 05 by the distance from its current frontier to the three steps of the master plan. It did not weigh what the language does for the other investigations, and after this pass I think that weighting was wrong. The criticism I keep is narrower: the depth search is the least productive use of the best tools.

## 2. The lineage and the tools

03 starts from one observation: $W^+=0$ is a first-order condition (three local integrable sections of the twistor space, or a twistor spinor, or the system $d_A\Sigma=0$ with trace-free self-dual curvature). Local solutions exist; the open step is global, so the work moved to the places where local solutions meet, the collars. That produced the collar program: account for each chirality on a neck, identify the link of a cut, cap and descend on the same smooth type using the actual boundary identification. 05 continues this with the topology made explicit: a cut is a level between two-handles, its marking is the gluing data, and slides are the moves between presentations.

| Tool | Where it lives | What it can do outside its home |
| --- | --- | --- |
| Chiral budget on a collar, eta invariant of a quotient link | 03, quotient-link test | A ledger for every cut, section 3 |
| Supplied collar and first-order transmission | 03, collar notes | The Cauchy problem for half-flat germs, section 3.3 |
| Marked cuts, transport rules, the mixed-presentation theorem | 05, manuscript section 3 | Selection rules and a recognition corollary, section 4 |
| Band and slice certificates | 05, metric criteria | Tests on hyperplane sections and on minimal hypersurfaces, section 7 |
| Split lower zero, localization theorems | 05, terminal diagrams | The one-tube form of every entry construction, section 5 |
| Slide filters: quaternionic representations, angle bounds, Christoffel words | 05, slide notes | Theorems on slide length; certificates for cuts; twists for exteriors, section 6 |

## 3. Use 1: a chirality ledger for every cut

The collar program says that on a collar "the two chiral energies must be accounted for individually", and that a bound for $W^-$ on a strip "would require its own argument" once spinors have bounded $W^+$. 03 already has the right instrument for one case: the round $S^3/Q_8$ link has eta invariant of magnitude $3/4$, which gives the threshold $9\pi^2$ of the [joint collar assessment](../../../../investigations-1/03_first_order_twistor/reviews/JOINT_COLLAR_ASSESSMENT_20261125.md) and the [quotient-link test](../../../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E08_QUOTIENT_LINK_TEST_20261125.md). The proposal is to use the same instrument on every cut.

### 3.1 Statement

**Ledger.** *[here, from known results]* Let $V$ be a compact oriented Riemannian four-manifold with boundary $\Sigma$, induced metric $h$ and trace-free second fundamental form $B^\circ$. Then

$$E_+(V)-E_-(V)=12\pi^2\bigl(\tau(V)+\eta(\Sigma,[h])\bigr)+\mathcal T(\Sigma),\qquad \mathcal T(\Sigma)=c\oint_\Sigma\langle B^\circ,\operatorname{curl}B^\circ\rangle\,d\sigma ,$$

where $\eta$ is the eta invariant of the odd signature operator and $(\operatorname{curl}B^\circ)_{il}=\varepsilon_l{}^{jk}\nabla_jB^\circ_{ik}$. Every term is conformally invariant, and $\mathcal T=0$ when $\Sigma$ is umbilic.

This is the signature theorem of Atiyah, Patodi and Singer ([I, Theorem 4.14](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf)) with the conformal invariance of the eta invariant of that operator, proved in [part II](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf) (I cite the paper, not a numbered statement, because I did not reopen it today), the normalization $p_1=(4\pi^2)^{-1}(|W^+|^2-|W^-|^2)\,dV$, and the transgression of $p_1$ between the Levi-Civita connection and the product connection at the boundary. I computed the transgression by hand and found $c=\pm1$, the sign depending on orientation conventions. **The constant is not checked against an example**; a Berger sphere in $\mathbb{CP}^2$ would do it. Nothing below uses $c$ except through the fact that $\mathcal T$ vanishes on umbilic hypersurfaces and is bounded by $\|B^\circ\|_{L^3}\|\nabla B^\circ\|_{L^{3/2}}$.

The pointwise version is worth recording. With $E_{ij}=W_{i\nu j\nu}$ and $H_{ij}=\tfrac12\varepsilon_i{}^{kl}W_{klj\nu}$ the electric and magnetic parts of $W$ along a hypersurface, $|W^+|^2-|W^-|^2=\pm4\langle E,H\rangle$, and the Codazzi equation gives $H=\operatorname{sym}(\operatorname{curl}B^\circ)$. So the chiral imbalance is produced exactly where slices fail to be umbilic, and $W^+=0$ along a foliation reads $E=\mp H$: a first-order relation between the Weyl curvature and the second fundamental form of the slices.

### 3.2 Consequences

**(a) A lower bound from the conformal structure of a cut.** *[here]* Let $\Sigma$ be an umbilic separating hypersurface of a class on a homotopy four-sphere, $M=V\cup_\Sigma V'$. Both pieces have signature zero, so $E_+(V)-E_-(V)=12\pi^2\eta(\Sigma,[h])$ and the opposite on $V'$. Hence

$$e\ \ge\ 12\pi^2\,|\eta(\Sigma,[h])|=3T\,|\eta(\Sigma,[h])| .$$

An entering class needs $|\eta|<2/3$ on every umbilic separating hypersurface; a class below the Chang–Gursky–Yang threshold needs $|\eta|<1/3$. For round quotients by left multiplication $|\eta|=|\Gamma|^{-1}\sum_{\gamma\ne1}\cot^2(\theta_\gamma/2)$ with $\cos\theta_\gamma=\operatorname{Re}\gamma$, which gives ([check_03](USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_03_seams_eta_arithmetic.py)):

| Round link | $\mathbb Z_2$ | $\mathbb Z_3$ | $\mathbb Z_4$ | $\mathbb Z_5$ | $Q_8$ | $T^*$ | $O^*$ | $I^*$ |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| $\lvert\eta\rvert$ | 0 | 2/9 | 1/2 | 4/5 | 3/4 | 49/36 | 1.681 | 2.006 |
| $12\lvert\eta\rvert$, the bound for $e/\pi^2$ | 0 | 2.67 | 6 | 9.6 | 9 | 16.3 | 20.2 | 24.1 |

The $Q_8$ entry reproduces 03's $9\pi^2$, which confirms the normalization. What is new is only the generality: the bound holds for any conformal structure on any umbilic cut, and $\eta$ is a function on conformal structures whose first variation is local (a multiple of the Cotton tensor paired with the variation), so it can be estimated near a model.

**(b) One chirality is enough on a strip with good ends.** *[here]* For a collar $C\cong\Sigma\times[0,1]$ in $M$,

$$E_-(C)=E_+(C)-12\pi^2\bigl(\eta(\Sigma_1)-\eta(\Sigma_0)\bigr)-\mathcal T(\Sigma_1)+\mathcal T(\Sigma_0).$$

If the two end slices of a neck are close to the same round quotient and close to umbilic in the scale-invariant sense $\|B^\circ\|_{L^3}\|\nabla B^\circ\|_{L^{3/2}}\to0$, then $E_-(C)-E_+(C)\to0$. A spinorial bound for $E_+$ on the residual region then gives the full tensor energy, and the one-chirality identity $e=e_0+\sum_je_j$ of the collar program becomes an identity in both chiralities. This is the separate argument for $W^-$ that the collar program asks for. The hypothesis is first order at two slices, which is the kind of data a supplied collar carries.

**(c) Half-flat pieces have quantized energy.** *[here]* If $W^+=0$ on $V$ and $\partial V$ is umbilic, then $e_V=\tfrac12E_-(V)=6\pi^2\,|\tau(V)+\eta(\partial V)|$. A class on a homotopy sphere that is half-flat of opposite chirality on the two sides of one umbilic cut has $e=12\pi^2|\eta(\Sigma,[h])|$ exactly. The energy of a chirally split construction is a boundary invariant.

### 3.3 What a supplied collar determines

*[known]* A conformal metric on a four-ball induces on the boundary a conformal metric $[h]$ and a trace-free second fundamental form $Q$. LeBrun showed that such data are locally the boundary of a unique self-dual conformal metric, and Biquard characterized, near the round sphere, the data that bound a self-dual conformal metric on the whole ball; for $Q=0$ the filling can be taken Einstein, and the result implies LeBrun's positive frequency conjecture ([Biquard, *Métriques autoduales sur la boule*](https://arxiv.org/abs/math/0010188)).

For 03 this is the exact form of the transmission problem. The pair $([h],Q)$ on a cut is the Cauchy datum; it determines the half-flat germ on each side, for each chirality; and whether the germ extends over the piece on that side is a global, frequency-type condition. Two patches with $W^+=0$ meet along a spherical collar exactly when their common datum is fillable on both sides, and on a homotopy sphere that forces the datum to be that of a hypersurface of the round sphere. I have not read the sharp spherical transmission review of the sections-and-connections child; if it does not already use Biquard's theorem, this is the reference to connect it to, since it is the nonlinear statement of which a linearized transmission calculation at the round sphere is the first term.

### 3.4 What to do with it

Put (b) into the neck-geometry manuscript as a lemma with its hypothesis stated on two slices, after fixing $c$ on one example. Put (a) into the list of tests for any designed class of 07: compute $\eta$ of each umbilic seam. Neither needs new analysis.

## 4. Use 2: selection rules for seams and cuts

### 4.1 Umbilic hypersurfaces of an entering class have positive scalar curvature

*[here]* For a hypersurface $\Sigma$ with unit normal $\nu$ the Gauss equation is $R_\Sigma=\bigl(R-2\mathrm{Ric}(\nu,\nu)\bigr)+\tfrac23H^2-|B^\circ|^2$. In the entering gauge $|Z|<R/\sqrt{12}$, and a trace-free symmetric form in dimension four has largest eigenvalue at most $\tfrac{\sqrt3}{2}|Z|$, so $R-2\mathrm{Ric}(\nu,\nu)=\tfrac R2-2Z(\nu,\nu)>0$. Umbilicity is conformally invariant. Hence every umbilic hypersurface of an entering class carries a metric of positive scalar curvature, namely the one induced by the entering gauge. The same holds for any hypersurface whose second fundamental form has $\sigma_2\ge0$ in that gauge, and more generally $\Sigma$ is Yamabe-positive whenever $\|B^\circ\|_{L^3(\Sigma)}^2$ is below the constant $\inf_u\int_\Sigma(8|\nabla u|^2+(R-2\mathrm{Ric}(\nu,\nu)+\tfrac23H^2)u^2)/\|u\|_{L^6}^2$.

**Corollary A.** *[here, using a pipeline theorem]* Let $M$ be a homotopy four-sphere with a reduced mixed presentation with winding row $(1,0)$, and let $[g]$ be an entering class on $M$. If the winding-one cut $Z_a$ is diffeomorphic to an umbilic hypersurface of $[g]$, then $Z_a\cong S^3$ and $M\cong S^4$.

Proof: by the paragraph above $Z_a$ admits positive scalar curvature, so it is dominated by a positive-scalar-curvature manifold, and the mixed-presentation theorem of 05 applies. This is the first statement I know in the repository in which the energy condition of the master program and the recognition theorem of 05 are hypotheses of one implication.

Its limit should be said plainly: a generic conformal class has no umbilic hypersurface at all. The corollary applies to classes that are built with seams, which is how 07 builds them, and to limits in which necks become round. The $L^3$ version above is the form that could apply to a class that is merely given.

### 4.2 Which levels can be reflective seams

*[here]* Let $\Sigma\cong\#_kS^1\times S^2$ be a level of a reduced presentation of a homotopy sphere, $M=V\cup_\Sigma V'$, and $a=b_1(V)$. Mayer–Vietoris and duality give $b_2(V)=k-a$, $\chi(V)=1+k-2a$, and for the double $b_1(\mathcal DV)=a$, $b_2(\mathcal DV)=2(k-a)$. Suppose $\Sigma$ is a reflective seam and both doubled classes are Yamabe-positive. The doubling inequality of [the master manuscript](../../../manuscript/claude/umbilic_doubling.tex) (Gursky's bounds applied to the double) gives $e_V\ge T\chi(V)$ if $a>0$ and $e_V\ge\tfrac23T\chi(V)$ if $k>a$. Summing the two sides:

| Seam | Bound | Consequence |
| --- | --- | --- |
| $k=0$ | none | sphere seams are free, as expected |
| $k=1$ | $e\ge\tfrac43T$ | allowed; the side with $b_2=1$ carries at least $\tfrac43T$ |
| $k\ge2$, $0<a<k$ | $e\ge2T$ | never in the band |
| $k\ge2$, $a\in\{0,k\}$ | $e\ge\tfrac23T(1+k)\ge2T$ | never in the band |

More generally, with positive doubles the Euler characteristics of the two sides of a reflective seam of an entering class are $(0,2)$, $(1,1)$ or $(2,0)$, and in the case $(1,1)$ one side is a rational homology ball ([check_03](USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_03_seams_eta_arithmetic.py)). Without the positivity hypothesis the manuscript's bound $e_V\ge T\chi(V)-Y_{\mathcal D}^2/96$ replaces these.

Read against 05's presentations: the middle level of a $(0,k,k)$ presentation is never a reflective seam with positive doubles for $k\ge2$; in a mixed presentation the winding-zero cut $Z_b$ ($k=2$, $a=1$) never is; the winding-one cut $Z_a$ is the only candidate, and by Corollary A it is then a three-sphere. So the two cuts of the mixed theorem are not symmetric from the side of the energy: one is excluded as a seam and the other, as a seam, ends the problem.

### 4.3 What this does to 07

In a class assembled from pieces along reflective seams with positive doubles, every seam that is not a sphere is an $S^1\times S^2$ which splits $M=X\cup T$ with $\chi(X)=0$, $\chi(T)=2$, $e_T\ge\tfrac43T$ and therefore $e_X<\tfrac23T$; two such seams cannot have disjoint tube sides. That is the one-tube form of section 5, now derived from the atlas instead of observed in trials. It also names the open quantity: a piece with the homology of a circle, reflective boundary $S^1\times S^2$ and energy below $\tfrac23T$. A gap theorem saying that such a piece is a standard exterior would close the reflective route completely; it is a question about Yamabe-positive classes with $b_1=1$ and small Weyl energy on the double, where Gursky's equality case is the conformally flat product.

## 5. Use 3: the one-tube form, where 05's split zero is 07's tube

### 5.1 Dictionary

A split lower zero in a terminal diagram of 05 is a zero-framed unknot split from the rest: the zero-handle and that two-handle form $S^2\times D^2$. So a presentation with a split lower zero writes $M=X_K\cup S^2\times D^2$, with $K$ the two-knot at the core and $X_K$ its exterior, and $M$ is one circle surgery on the closed manifold $N=X_K\cup S^1\times D^3$. This is the one-tube form. The two framings of the surgery differ by the Gluck twist, which is the part of the marking that the transport rules of 05 keep track of.

### 5.2 A family where everything can be computed

Take $N=S^1_\ell\times_\varphi(S^3/\Gamma)$, the mapping torus of an isometry, with the product conformally flat structure, and remove a tube of angular radius $\theta$ about the circle through a fixed point of $\varphi$. When $S^3/\Gamma$ is the $\tau$-fold cyclic branched cover of a knot and $\varphi$ generates the covering group, the complement is the exterior of the $\tau$-twist-spun knot by [Zeeman's theorem](https://www.lms.ac.uk/sites/default/files/1965%20Twisting%20spun%20knots.pdf). The monodromy rotates the normal two-sphere by $\alpha=2\pi/\tau$, so the cap is an $S^2$-bundle with a connection:

$$g=ds^2+a(s)^2d\psi^2+d\vartheta^2+\sin^2\vartheta\,(d\phi+b(s)\,d\psi)^2,\qquad K=-a''/a,\quad F=b'/a .$$

*[here]* For this metric $R=2(K+1)-\tfrac12F^2\sin^2\vartheta$ and

$$\frac{e_{\rm cap}}{\pi^2}=\int_0^S a\Bigl[\tfrac43\bigl(K+1-\tfrac23F^2\bigr)^2+4F^2+\tfrac{16}{135}F^4+\tfrac23F'^2\Bigr]ds ,$$

with $a(0)=0$, $a'(0)=1$, and at the seam $a=(\ell/2\pi)/\sin\theta$, $a'=-(\ell/2\pi)\cot\theta$, $F=0$, $\int Fa\,ds=\beta$, where $\beta=1/\tau+n$ and the parity of $n$ is the framing. The exterior is conformally flat and scalar-flat in this gauge, so $e=e_{\rm cap}$ and the class is Yamabe-positive when $R\ge0$ on the cap. The formula is derived symbolically and validated by Gauss–Bonnet on closed bundles in [check_01](USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_01_kk_cap_energy.py).

*[numerical]* Least costs found by direct minimization ([check_02](USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_02_cap_costs.py)); each is the cost of an admissible cap, hence an upper bound for the least cost; the wall is 8.

| Exterior | Tube and circle | $\beta$ | $e/\pi^2$ |
| --- | --- | --- | --- |
| $S^1\times S^3$, round half of $S^2\times S^2$ | $\theta=\pi/2$, $\ell=2\pi$ | 0 | 5.3333 |
| $S^1\times S^3$, thinner tubes | $\pi/3$; $\pi/4$; $\pi/5$ | 0 | 7.4196; 7.8475; 7.9526 |
| flat $S^1\times(\mathbb R^3\setminus B)$, radius over length $0.3$; $1$ | | 0 | 8.3759; 8.0091 |
| $S^1\times S^3$ with a half turn | $\pi/2$, $2\pi$ | 1/2 | 5.8912 |
| 2-twist-spun trefoil, $\Gamma=\mathbb Z_3$ | $0.32\pi$, $3.2$ | 1/2 | 7.6271 |
| 2-twist-spun figure-eight, $\Gamma=\mathbb Z_5$ | $0.28\pi$, $2.5$ | 1/2 | 7.8025 |
| 3-twist-spun trefoil, $\Gamma=Q_8$ | $0.24\pi$, $1.8$ | 1/3 | 7.8928 |
| the same exterior, other framing | $0.249\pi$, $1.8$ | $-2/3$ | 7.9736 |
| 4-twist-spun trefoil, $\Gamma=T^*$ | $0.165\pi$, $0.8$ | 1/4 | 7.9875 |
| the same exterior, other framing | $0.165\pi$, $0.8$ | $-3/4$ | 8.1098 |
| 5-twist-spun trefoil, $\Gamma=I^*$ | $0.099\pi$, $0.3$ | 1/5 | 8.0043 |

In every row the cap has $R>0$. The first four twisted rows are below the wall by clear margins. The rows at 7.97 and 7.99 are below it by one to three hundredths and should not be relied on without a certified computation. The five-twist spin stays above the wall in this ansatz at the lengths tried.

### 5.3 What this shows, and what it cannot show

It shows that the one-tube form is realizable inside the band with a knotted core, that scalar-positive exteriors are what make a tube affordable (the flat model is above the wall at every radius tried, and tends to it from above), and that the framing has a price: the two fillings of the three-twist exterior differ by about $0.1\pi^2$, and in this computation those of the four-twist exterior lie on opposite sides of the wall.

It cannot reach a nonstandard type. *[known]* A homotopy four-sphere with an effective smooth circle action is diffeomorphic to $S^4$ (Fintushel and Pao, with the Poincaré conjecture for the orbit space; [Fukuda](https://arxiv.org/abs/1811.05109) describes the singular orbits of such an action as two branched twist spins and attributes the study of their Gluck twists to Fintushel, Gordon and Pao). *[here]* Every manifold in the table carries such an action: on the cap it rotates the disc with weight $\tau$ and the sphere with weight $1+n\tau$. So both framings give $S^4$, and the two cores are the branched twist spins with those weights. The same theorem disposes of every circle-symmetric design at once, and it says that an attained minimizer on a nonstandard type would have a finite conformal group.

*[sketch]* The restriction is wider than symmetry. If the exterior is conformally flat and the class is to be Yamabe-positive, then either $N$ is a closed conformally flat manifold of positive Yamabe type, whose group is virtually free by Schoen–Yau and Kapovich (quoted from memory, not re-read today), and when that group is virtually cyclic $N$ is a mapping torus as above; or the exterior is of Fuchsian type with $R=0$, where the count of section 6.4 leaves only planar surfaces. Hyperbolic exteriors such as $S^1\times Y^3$ with $Y$ a hyperbolic homology sphere of weight one do give homotopy spheres by one circle surgery without any circle symmetry, but the conformal Laplacian of $H^3\times S^1$ is negative on large compact pieces, so the resulting class is not Yamabe-positive. The gap in this sketch is the virtually free, non-cyclic case of weight one, which I expect to be empty and did not prove.

The conclusion for 07 is a design rule: with a conformally flat exterior the one-tube form yields the standard sphere, so on a hypothetical nonstandard type the exterior itself must carry Weyl energy, at most $\tfrac23T$ of it if the seam is reflective.

## 6. Use 4: the slide enumeration, redirected

### 6.1 Why the depth search should stop

*[known]* The link $L_{n,1}$ of Gompf, Scharlemann and Thompson fails generalized Property R if the presentation $\langle x,y\mid xyx=yxy,\ x^{n+1}=y^n\rangle$ is not Andrews–Curtis trivial ([arXiv:1103.1601](https://arxiv.org/abs/1103.1601)); so a first unstabilized cancellation on $L_{3,1}$ would trivialize the case $n=3$. That case is open: a recent classification of short balanced presentations reduces everything of total length 13 to it and leaves it undecided ([arXiv:2607.23611](https://arxiv.org/abs/2607.23611)). A stable trivialization was announced in 2024 ([arXiv:2408.15332](https://arxiv.org/abs/2408.15332), with an automated account in [arXiv:2501.18601](https://arxiv.org/abs/2501.18601)); a secondary source reports a later correction, which I could not confirm from a primary source, so I treat the stable status as unsettled. On the four-manifold side nothing is open: every two-component link with a surgery to $\#_2S^1\times S^2$ that contains a generalized square knot simplifies after at most two Hopf pairs are added ([Meier–Zupan, Theorem 1.2](https://arxiv.org/abs/1904.08527)), and the associated homotopy spheres are standard (their Corollary 1.3).

*[assessment]* So a success of the depth search would settle a well-known open problem at small depth after others have searched far longer, and a failure at depth five or six would leave the master program exactly where it is.

### 6.2 What to write up

*[pipeline]* No first unstabilized cancellation within three slides, for every $n\ge3$ and every band path, by a translation-length argument on a tree; at $n=3$, five quaternionic representations exclude 224 of the 256 signed four-slide histories. *[assessment]* The first is a theorem about an infinite family and infinitely many band paths per slide. The Andrews–Curtis literature bounds word length; this bounds the number of slides with unbounded conjugators. That difference is the publishable point, and it stands whatever happens to the Poincaré program. If the tree argument extends to a bound that grows with $n$, the statement becomes quantitative: a family of standard spheres whose unstabilized slide distance to the trivial diagram is unbounded, while two Hopf pairs always suffice.

### 6.3 One bounded computation to finish depth four

The filters use five points of the character variety. The representations that kill $s=x^4y^{-3}$ are the characters of $\langle x,y\mid x^4=y^3\rangle$, a torus-knot-type group whose irreducible $SU(2)$ characters form finitely many arcs with $\operatorname{tr}x$ and $\operatorname{tr}y$ fixed and $\operatorname{tr}xy$ free; likewise for $r$ and the trefoil group. On each arc the trace of any word is a polynomial in one variable, and, as far as I understand the filters, both the angle bound and the comparison with the Christoffel word of the slope fixed by the history are inequalities between such traces. Then "the history survives every $SU(2)$ filter" is a decidable statement in one real variable per arc, by resultants and Sturm sequences. Run it on the 32 surviving histories. Either depth four closes without exhibiting bands, or the survivors are certified invisible to $SU(2)$ and a different detector is needed. In both cases stop there. If the notes already use whole arcs, this item is void.

### 6.4 A second life for the representations

*As certificates for cuts.* A unit-quaternion representation of $\langle x,y\rangle$ that kills one relator is a representation of the fundamental group of the piece below the corresponding cut. Where the theorems of 05 show that a cut dominated by a positive-scalar-curvature manifold has a standard piece below it, with abelian group (I did not check which of the terminal diagrams they cover), a nonabelian representation is a certificate that the cut is not so dominated. Each such certificate then has geometric content: by section 4.1 the cut is not diffeomorphic to any umbilic hypersurface of any entering class, and by the band criterion of 05 every product band over it in every positive-scalar-curvature metric satisfies $\rho d^2<3\pi^2$.

*As twists for exteriors.* The same representation is a flat $SO(3)$ connection on the Fuchsian exterior $(H^2\times S^2)/\Gamma$. It leaves the killed relator untwisted, so that tube is a product cap, and twists the others by their holonomy angle, which costs more (5.33 against 5.89 for a half turn in the table). A nonabelian image removes every circle symmetry, which is what section 5.3 requires of any candidate.

*As bookkeeping.* Count relators as paid (a tube) or free (a surgery that stays conformally flat, such as killing a cuff). With a planar Fuchsian exterior of rank $n$, the $n-1$ cuffs are free and one relator is paid; the presentation is Andrews–Curtis trivial and the manifold is $S^4$. Positive genus needs at least two paid relators, and two reflective tubes cost at least $\tfrac83T$ under the hypotheses of the doubling inequality (positive doubles, or Kobayashi's conjecture). So the designs of 07 with at most one paid relator realize only trivial presentations, and the slide calculus of 05 is the right language for stating which presentations a given budget can reach.

## 7. Use 5: where a marked cut can come from in a given class

Corollary A needs a cut with geometric control. Two places produce candidates. Both are *[sketch]*.

**Hyperplane sections.** *[pipeline]* For a hypersurface immersion of a hypothetical nonstandard $M$ with $E_+<8\pi^2$, more than three quarters of the height directions have exactly two index-two critical points (04's manuscript, the theorem whose last sentences are about height directions). *[here]* After cancelling the extra zero- and four-handles, such a height function is a presentation of reduced type $(n_1,2,n_3)$ with $n_1+n_3=2$: exactly the three types of 05. The type is constant on components of the set of such directions, and $u\mapsto-u$ turns the presentation upside down, so a component invariant under the antipodal map consists of mixed presentations. The cut is then a hyperplane section $\Sigma=F(M)\cap\{\langle x,u\rangle=c\}$, a hypersurface of a Euclidean four-space, whose second fundamental form is $A|_{T\Sigma}/\sin\varphi$ with $A$ the second fundamental form of the immersion and $\varphi$ the angle between the normal and $u$. Hence $R_\Sigma=2\sigma_2(A|_{T\Sigma})/\sin^2\varphi$, and the section has positive scalar curvature exactly when $\sigma_2$ of $A$ restricted to $TM\cap u^\perp$ is positive along it. That is a pointwise test on the data 04 already works with, and it feeds the mixed theorem directly.

**The minimal hypersurface of the entering gauge.** The entering gauge has $\mathrm{Ric}>0$, so its min-max hypersurface $\Sigma$ is orientable of index one with multiplicity one ([Zhou](https://arxiv.org/abs/1210.2112), for ambient dimension at most seven; his other alternative, a double cover of a nonorientable stable hypersurface, does not occur in a homotopy sphere, where every closed hypersurface is two-sided). Mean-convex flow from $\Sigma$ into each side has cylindrical singularities $S^3$, $S^2\times\mathbb R$ and $S^1\times\mathbb R^2$ only, which correspond to handles of index 0, 1 and 2 of that side; if the flow can be continued through the last kind, which is not available in the literature I know, each side is a two-handlebody and $\Sigma$ is a cut between two-handles in the sense of 05. *[here]* Index one gives one inequality at once: with $J=-\Delta+\tfrac12R_\Sigma-\tfrac12(R+|B|^2)$ the Jacobi operator, $-8\Delta+R_\Sigma\ge2J+R+|B|^2$, so the conformal Laplacian of $\Sigma$ has at most one nonpositive eigenvalue. The missing statement is that it has none, or that $\Sigma$ is dominated in the sense of 05 anyway. With it, and with a mixed presentation, the entering gauge would recognize the sphere without any analysis of minimizers.

## 8. Order of work, with stop rules

1. Ledger lemma (section 3.2 b) into the neck manuscript; fix the constant on a Berger sphere. One sitting. Stop if the necks of the attainment argument do not have first-order umbilic ends, and record the boundary term actually needed.
2. Corollary A and the seam table into 05 and into 07's plan. This removes from 07 every design with a reflective seam $\#_kS^1\times S^2$, $k\ge2$, with positive doubles, and every circle-symmetric design.
3. Slides: freeze depth; write the three-slide theorem; run section 6.3 once.
4. The exterior gap of section 4.3: is a homology-circle piece with reflective boundary and $e_X<\tfrac23T$ standard? This is the sharp form of what the reflective route still needs.
5. The hyperplane-section test on the explicit immersions of 04's first child, if they are explicit enough to evaluate $\sigma_2(A|_{u^\perp})$.
6. Optional: certify one row of the table (the two-twist-spun trefoil has margin $0.37\pi^2$) by interval arithmetic, to have one rigorous entering class with a knotted core.

## 9. What I would not do

More depth on $L_{3,1}$. Circle-symmetric designs of any kind. Reflective seams along $\#_kS^1\times S^2$ with $k\ge2$. Conformally flat exteriors as a route to a nonstandard type.

## 10. Limits of this note

I did not read the parent manuscript of 05, its first child, or the manuscripts of 03's children, including the transmission review that section 3.3 points at; the lineage in section 2 rests on the founding note, the collar program and the README. The mixed-presentation theorem, the three-slide theorem and 04's count are used as stated. The constant in $\mathcal T$ is unverified. The table of section 5 is floating-point. The statements quoted from memory in section 5.3 are marked there. The sketch in section 7 has two gaps, both named. No one has read this note independently.

## 11. Sources

Atiyah, Patodi, Singer, Spectral asymmetry and Riemannian geometry [I](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf) and [II](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf). Biquard, [Métriques autoduales sur la boule](https://arxiv.org/abs/math/0010188). Zeeman, [Twisting spun knots](https://www.lms.ac.uk/sites/default/files/1965%20Twisting%20spun%20knots.pdf). Fukuda, [Gluck twists along 2-knots with periodic monodromy](https://arxiv.org/abs/1811.05109). Gompf, Scharlemann, Thompson, [Fibered knots and potential counterexamples to the Property 2R and slice-ribbon conjectures](https://arxiv.org/abs/1103.1601). Meier, Zupan, [Generalized square knots and homotopy 4-spheres](https://arxiv.org/abs/1904.08527). [arXiv:2607.23611](https://arxiv.org/abs/2607.23611), [arXiv:2408.15332](https://arxiv.org/abs/2408.15332), [arXiv:2501.18601](https://arxiv.org/abs/2501.18601) on the Akbulut–Kirby presentations. Zhou, [Min-max minimal hypersurface in $(M^{n+1},g)$ with $\mathrm{Ric}_g>0$ and $2\le n\le6$](https://arxiv.org/abs/1210.2112). Gursky's bounds, the Chang–Gursky–Yang gauge and Kobayashi's conjecture are used through [the master manuscript's section on reflective seams](../../../manuscript/claude/umbilic_doubling.tex), where they are cited with their hypotheses.
