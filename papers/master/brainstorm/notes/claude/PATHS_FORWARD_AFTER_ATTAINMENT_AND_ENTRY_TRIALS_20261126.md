# Paths forward after the attainment proof and the first entry trials

26 November 2026 (America/New_York). Brainstorm note prepared for Edward B. Baker III by Claude (Anthropic, model `claude-fable-5-2`, Cowork session; reasoning effort max as the session's configuration records it). It answers the request to read the master documents and those of investigations 05 and 07 and to discuss the best paths forward, and it updates the [earlier entry note](ENTRY_DIRECT_APPROACHES_20261126.md). Input: the repository at `de2125da3cceeea5eb4210b1f4c6d56fd4def364`, namely the master [manuscript](../../../manuscript/chiral_weyl_energy_and_smooth_poincare.tex), [overview](../../../research-overview/OVERVIEW.md), [plan](../../../research-plan/PLAN.md) and [register](../../../research-progress/REGISTER.md); the same documents of [05](../../../../investigations-1/05_collar_deformation_and_surgery/README.md) and [07](../../../../investigations-1/07_positive_subcritical_entry/README.md) (07 has no manuscript text yet, so I read its notes and reviews); the [06 manuscript](../../../../investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex); and the [assessment of the earlier note](../../../reviews/DIRECT_ENTRY_AND_REDUCIBLE_CUT_PRIORITIES_20261126.md).

Evidence scope. *Known* means quoted from the cited source. *Here* means a derivation made for this note; every formula so marked is tested in the [check scripts](PATHS_FORWARD_AFTER_ATTAINMENT_AND_ENTRY_TRIALS_20261126_checks/README.md) (95 checks in five scripts, all pass; the fifth script came with section 9). *Sketch* means an outline that was not checked in detail. *Assessment* means my judgement. Nothing here was read by a specialist, and I did not audit the proof in 06. When sections 1 to 8 were written, no file was changed apart from this folder and the session's own record in the [Claude chat-history registry](../../../chat-histories/claude-cowork/README.md). Later the same day Edward asked for the results that belong in the master manuscript to be put there. Section 9 lists what went in and which files changed.

## 1. Summary

The master now reduces the conjecture to three statements: entry E, attainment X and rigidity R. This is how I read their state.

- **X** has a working proof in 06. It is the one statement that keeps its value whatever the truth about exotic spheres, and so far it has been read only inside the pipeline.
- **E** has produced no entered type. Section 2 shows that the negative results of 07 are instances of one inequality. A conformal class that contains half of a Hopf manifold pays at least $u=16\pi^2/3$ per sign unless the double of the rest is Yamabe-negative, and then strongly so; the whole budget is $2T=1.5\,u$. For the two tubes of 07, at any width, an entering class would give a conformal class on $S^2\times S^2$ with less Weyl energy than the Einstein product. That would contradict a conjecture of Kobayashi from 1985, which is open. The same holds for the trivial presentation drawn with the same thin tubes, so the obstruction is the design and not the presentation.
- **R**, given X, is equivalent to a sphere theorem which contains the statement that a homotopy four-sphere with a positive Einstein metric is standard. I know of no mechanism for it.

The order I would choose: certify X and publish what is proved; close the thin-tube family with the inequality instead of further width trials; reopen E only for a design that first passes a calibration on the trivial presentation; treat R as a named conjecture with sub-cases; stop the slide enumeration in 05.

| | Item | Kind |
| --- | --- | --- |
| 1 | X first: a specialist reading in three blocks, a standalone paper, published imports (section 3) | assessment |
| 2 | State the main theorem as "the conjecture holds if and only if E and S hold", with X turning S into R (4.1) | here, logic only |
| 3 | Doubling across an umbilic cut (Lemma 2.1) and half-Hopf pieces (Corollary 2.2): $e\ge u$, or $e\ge 2T$ with two pieces, when the double is Yamabe-positive | here; uses Gursky (1998) |
| 4 | Hopf closing (Lemma 2.3) and the Kobayashi test (Proposition 2.4): an entering trial in the 07 family contradicts Kobayashi's conjecture | here |
| 5 | Symmetric control: exact cost of a cap; the collar of the collar lemma is not wide enough in any case tested; a cap is cheap only if it swallows a collar of area comparable to $2\pi$; the trivial presentation enters at $4.13\,\pi^2$ (2.3) | here, numerical |
| 6 | Bach-flat classes in the symmetric control: the round sphere, the Einstein $S^2\times S^2$, and the Euclidean Schwarzschild metric, which has $e=2T$ exactly (4.3) | here, symbolic |
| 7 | 05: keep the theorems, stop the enumeration. 04: keep the pilot (section 5) | assessment |
| 8 | Order of work with stop rules (section 6) | assessment |

## 2. Entry

Throughout $T=4\pi^2$ and $u=16\pi^2/3=\tfrac43T$, and entry is $Y>0$ with $e<2T=\tfrac32u$. The number $u$ is the energy per sign of (round hemisphere of $S^2$) $\times S^2$, half of the Einstein product, for which $E_\pm=2u$ and $Y=16\pi$ (`check_01` c).

What 07 already has: the two-dimensional Gauss–Bonnet bounds for its warped caps and adapters ([WARPED_CAP](../../../../investigations-1/07_positive_subcritical_entry/notes/WARPED_CAP.md), [CONNECTION_BUDGET](../../../../investigations-1/07_positive_subcritical_entry/notes/CONNECTION_BUDGET.md), [POSITIVE_CYLINDRICAL_ASSEMBLY](../../../../investigations-1/07_positive_subcritical_entry/notes/POSITIVE_CYLINDRICAL_ASSEMBLY.md)), the single-relator closings, the equator seam test and the thin-width obstruction. What is added here: a four-dimensional version of the bound that needs no symmetry of the filling, a closing that moves each relator to the standard sphere, the link with Kobayashi's conjecture, and exact costs in the symmetric control.

### 2.1 Doubling across an umbilic cut

**Lemma 2.1 (here).** Let $(M^4,[g])$ be closed and oriented, and let $\Sigma\subset M$ be a closed hypersurface with $M=W_1\cup_\Sigma W_2$, such that near $\Sigma$ the class is invariant under a reflection in $\Sigma$. Let $DW_i$ be the double of $W_i$ with the reflected class and put $e_i=\tfrac12\big(E_+(W_i)+E_-(W_i)\big)$, so that $E_+(M)+E_-(M)=2(e_1+e_2)$. Then $E_\pm(DW_i)=2e_i$, $\chi(DW_i)=2\chi(W_i)$ and $\tau(DW_i)=0$. Let $Y_i$ be the Yamabe constant of $DW_i$ and $D_i=\int\lvert\mathrm{Ric}_0\rvert^2$ for its unit-volume Yamabe metric. Then

1. $e_i=4\pi^2\chi(W_i)-Y_i^2/96+D_i/8$;
2. if $Y_i>0$ and $b_1(DW_i)>0$, then $e_i\ge 4\pi^2\chi(W_i)$;
3. if $Y_i>0$ and $b_2(DW_i)>0$, then $e_i\ge \tfrac{8\pi^2}{3}\chi(W_i)$;
4. $Y_i^2\le\int_{DW_i}R_h^2\,dV_h$ for every metric $h$ in the doubled class.

*Proof.* The reflection exchanges $W^+$ and $W^-$, and $\chi(\Sigma)=0$. Item 1 is Gauss–Bonnet, $8\pi^2\chi=E_++E_-+\tfrac1{24}\int R^2-\tfrac12\int\lvert\mathrm{Ric}_0\rvert^2$, on $DW_i$ in the Yamabe gauge. Item 2 is Gursky's theorem that $Y>0$ and $b_1>0$ give $\int\sigma_2\le 0$. Item 3 is Gursky's inequality $E_+\ge\tfrac{4\pi^2}{3}(2\chi+3\tau)$ for $Y>0$ and $b_2^+>0$; here $b_2^+=b_2/2$. Item 4 is standard: for $Y\ge0$ use the constant test function and Cauchy–Schwarz, for $Y<0$ write $h=v^2h_Y$ and integrate $R_hv^2$. The statement and proof are the same when $\Sigma$ has several components and $W_1$, $W_2$ are the two sides. Checks: `check_04` (b) to (e).

The seam lemma of the earlier note says that an umbilic seam of an entry class carries positive scalar curvature. Lemma 2.1 is its quantitative companion: it prices the two sides. For a general umbilic $\Sigma$ the double is $C^{2,1}$ after a conformal change that makes $\Sigma$ totally geodesic, and the inequalities should pass to it by approximation (sketch). In every use below the class is exactly reflection-symmetric near the cut.

**Corollary 2.2 (half-Hopf pieces; here).** Call a *half-Hopf piece* of length $\ell$ a domain conformal to $S^1(\ell)\times\bar D$, with $\bar D\subset S^3$ a closed hemisphere, inside a neighbourhood conformal to one in $S^1(\ell)\times S^3$. Let $M$ be a homotopy four-sphere whose class contains $k\ge1$ disjoint half-Hopf pieces, let $W$ be the complement and $DW$ its double. Then

$$e=8\pi^2-\frac{Y(DW)^2}{96}+\frac D8,\qquad Y(DW)>0\ \Rightarrow\ e\ge u,\qquad Y(DW)>0,\ k\ge2\ \Rightarrow\ e\ge 2T .$$

*Proof.* The pieces are conformally flat, so $e_1=e$ and $e_2=0$. Also $\chi(W)=2$, $b_1(DW)\ge k-1$ and $b_2(DW)\ge2$. Apply Lemma 2.1.

So an entry class with two disjoint half-Hopf pieces needs $Y(DW)\le-\sqrt{96\,(8\pi^2-e)}$, and a class with one piece and $e<u$ needs $Y(DW)<-16\pi$. For comparison $Y(S^4)=8\sqrt6\,\pi$ and $16\pi$ is the Yamabe constant of the Einstein product.

### 2.2 Hopf closing and the Kobayashi test

In 07 the exterior is $N=\Omega/\Gamma$, with $\Gamma$ the Fuchsian group of the pants acting on $S^4\supset H^2\times S^2$. For a hyperbolic $g\in\Gamma$ with axis $\gamma$ and translation length $\ell$, let $r$ be the signed distance from $\gamma$ and $t$ the arclength along it. Then

$$dt^2+d\beta^2+\cos^2\!\beta\,g_{S^2}=\cos^2\!\beta\,\big(dr^2+\cosh^2\!r\,dt^2+g_{S^2}\big),\qquad \cosh r=\sec\beta ,$$

so $(S^4\setminus\mathrm{Fix}\,g)/\langle g\rangle$ is the Hopf manifold $S^1(\ell)\times S^3$, with $y=\sin\beta\,E+\cos\beta\,\omega\in S^3$ (`check_01` e). The two sides $r\to\pm\infty$ of the axis are the circles $y=\pm E$. The funnel beyond a cuff waist is a half-Hopf piece. The tube of angular radius $\theta$ about $y=E$ is $\{\sinh r>\cot\theta\}$, and about a geodesic $\gamma\times\{\omega_0\}$ it is $\{\langle\omega,\omega_0\rangle>\cos\theta\,\cosh r\}$ (`check_01` f).

**Lemma 2.3 (Hopf closing; here).** Let $c\subset N$ be an embedded closed curve in the class of a primitive hyperbolic $g$, let $T$ be a tubular neighbourhood of $c$, and let $B\cong D^2\times S^2$ fill $T$ with a conformal class that agrees with the flat class near $\partial T$. Then $T$ lifts to a tube $\tilde T$ in $\Omega/\langle g\rangle\subset S^1(\ell)\times S^3$ about a curve isotopic to the circle factor, and $\big(S^1(\ell)\times S^3\setminus\tilde T\big)\cup B$ is $S^4$ with a class whose Weyl curvature is supported in $B$. Hence $E_+(B)=E_-(B)=:c(B)$ and $c(B)>0$.

*Proof.* Surgery on the circle factor of $S^1\times S^3$ gives $S^4$ for either framing. The signature of $S^4$ gives the equality. If $c(B)$ were zero the class would be flat, hence round by Kuiper, and the holonomy of the Hopf exterior would be trivial.

This recovers the equality $E_+(U_i)=E_-(U_i)=c_i$ of 07's single-relator closings, and it says more: the cost of a relator band is the energy of a class *on the standard sphere* that contains a Hopf exterior. It depends on the presentation only through $\ell(\rho(r_i))$ and the shape of the lifted curve.

**Proposition 2.4 (Kobayashi test; here).** In Lemma 2.3 suppose $\tilde T\subset S^1(\ell)\times D$ for an open hemisphere $D\subset S^3$. Then the complementary closed hemisphere is a half-Hopf piece of the class on $S^4$. The double of the rest is $S^2\times S^2$ with a reflection-invariant class with $E_+=E_-=2c(B)$, and with $Y_D$ its Yamabe constant,

$$c(B)=8\pi^2-\frac{Y_D^2}{96}+\frac D8,\qquad Y_D>0\ \Rightarrow\ c(B)\ge u,\qquad c(B)<u\ \Rightarrow\ Y_D<-16\pi,\qquad c(B)<4\pi^2\ \Rightarrow\ Y_D<-8\sqrt6\,\pi .$$

In every case $c(B)<u$ means a class on $S^2\times S^2$ with total Weyl energy $4c(B)<64\pi^2/3$, the value of the Einstein product.

*Proof.* The rest is the complement of a tubular neighbourhood of an unknotted circle in $S^4$, that is $D^2\times S^2$, with double $S^2\times S^2$. Apply Corollary 2.2 with $k=1$. Checks: `check_04` (c), (d).

Known: Kobayashi showed that the Einstein product is a strictly stable critical point of the Weyl functional on $S^2\times S^2$ and conjectured that it realises the infimum. Gursky's inequality proves this among classes with $Y>0$, and LeBrun proved it among classes of symplectic type. LeBrun's 2023 paper calls the conjecture increasingly plausible for $S^2\times S^2$ without settling it, and shows that the analogous bound fails in the Yamabe-negative regime on connected sums of many copies of $S^2\times S^2$.

Consequences for the 07 family.

1. Both tubes satisfy the hypothesis at every width in use: tube 1 stays within colatitude $\pi/3+5/64<\pi/2$ and tube 2 beyond $2\pi/3-5/64>\pi/2$, so each lies over an open hemisphere of its Hopf cover, $\pm\langle y,N\rangle>0$ with $N$ the pole of the $S^2$ factor (`check_01` h). Entry needs $c_1+c_2<8\pi^2$, hence some $c_i<4\pi^2<u$. **An entering member of the family, for any pants, bands and caps, would therefore give a conformal class on $S^2\times S^2$ with total Weyl energy below $16\pi^2$, and so a counterexample to Kobayashi's conjecture.** Under the conjecture $e\ge 2u=32\pi^2/3$ on the whole family. The failures that LeBrun found on large connected sums are in the Yamabe-negative regime too, so the conjecture is not a formality here; it is the exact content of the open corner.
2. The statement does not see the presentation. It holds for $\langle x,y\mid x,y\rangle$ with tubes drawn in the same way, where $M=S^4$ and the infimum is zero. The design is the obstruction.
3. Unconditional form. By item 4 of Lemma 2.1, for every metric $h$ of the class on the Hopf half $W_+$ that is the product near the cut, $c_i\ge\min\{u,\ 8\pi^2-\tfrac1{48}\int_{W_+}R_h^2\}$. So the sign of one Neumann eigenvalue of the conformal Laplacian on $W_+$, or one representative with $\int_{W_+}R_h^2\le128\pi^2$, closes a tube without the conjecture; and $c_i<4\pi^2$ needs $\int_{W_+}R_h^2>192\pi^2$ for every such $h$. LeBrun's theorem gives a second unconditional case: if the doubled class is of symplectic type, meaning that its self-dual harmonic 2-form has no zeros, then $c_i\ge u$ whatever the sign of $Y_D$ (known: Theorem B of arXiv:1310.0848, which covers $S^2\times S^2$).
4. Three funnels. The three funnel pieces are disjoint half-Hopf pieces of $M$ itself. With $\delta=8\pi^2-e$, entry needs $Y(DW_A)\le-\sqrt{96\,\delta}$ for the double of the three-cuff core $W_A$, while $Y(M)\ge\sqrt{48\,\delta}$. If some metric of the class on $W_A$, totally geodesic at the three waists, has $R\ge0$, then $e\ge 2T$. In the product gauge the core and the caps are scalar-flat, so the negative sign has to come from the bands.
5. Equator. With tube 1 north and tube 2 south, the retained equator cuts $M$ into $W_1$, $W_2$ with $\chi(W_i)=1$, and $\pi_1(DW_i)$ maps onto the one-relator group $\langle x,y\mid r_i\rangle$, whose first homology is $\mathbb Z$ (`check_04` f). So $c_i\ge 4\pi^2-Y(DW_i)^2/96$, and $c_i\ge4\pi^2$ when $Y(DW_i)>0$. Entry needs at least one equator double to be Yamabe-negative.

The register of 07 lists the full-width trial at switching width $1/16$ as open. Consequence 1 covers it.

| Result in 07 | Reading |
| --- | --- |
| Inverse-facing connection caps cost at least $\tfrac{16\pi^2}{3}(1+\cosh\rho)$ | The constant is $u$. In the symmetric control a cut at depth $r_0$ in the funnel costs at least $u\,(1+\tfrac{\ell}{2\pi}\sinh r_0)$ (2.3) |
| Positive cylindrical assembly: $Y>0$, each adapter at least $\tfrac{16\pi^2}{3}\cosh 1$ | Proposition 2.4 gives $u$ per tube for every filling, symmetric or not, once the Hopf double is Yamabe-positive |
| Thin direct bands: $Y(M)<0$ and $E_\pm(U_i)\sim K_i/\varepsilon^3$ | The negative regime, where Proposition 2.4 asks for $Y_D<-16\pi$ |
| Full width at $1/16$: open | Entry there contradicts Kobayashi's conjecture |

Not covered: a tube whose Hopf lift does not lie over a hemisphere, for instance a curve that spins about a great circle of the $S^2$ factor while crossing the axis. I see no reason for such a tube to be cheaper, because the control below prices a tube by the collar it swallows, but that is not a proof.

### 2.3 The symmetric control

Classes $[q+g_{S^2}]$, with $q$ a metric on a surface, have $\lvert W^\pm\rvert^2=(K+1)^2/6$ (`check_01` a), so $E_\pm=\tfrac{2\pi}{3}\int(K+1)^2\,dA$. The standard sphere is $(\Sigma\times S^2)\cup S^1$ for a plane $\Sigma$ with one asymptotically hyperbolic end, and the round class is $\Sigma=H^2$. Because $S^1(\ell)\times S^3$ is homogeneous, a round tube of angular radius $\theta$ about any circle $S^1\times\{y_0\}$ is the same conformal problem as the tube about $y=E$. So this control prices round tubes about closed geodesics, among fillings with the rotational symmetry.

A filling is a disc $ds^2+a(s)^2d\varphi^2$ with $a(0)=0$, $a'(0)=1$, matched $C^1$ to the retained side $\{\sinh r<\cot\theta\}$ of the hyperbolic cylinder. With $\sinh r_0=\cot\theta$ the matching data are $a(S)=\tfrac{\ell}{2\pi}\cosh r_0$ and

$$f:=a'(S)=-\tfrac{\ell}{2\pi}\sinh r_0=-\tfrac{\ell}{2\pi}\cot\theta .$$

For a thin tube ($\theta<\pi/2$) the cut lies in the funnel and $f<0$. For a fat tube ($\theta>\pi/2$) the cut lies at depth $w=-r_0$ beyond the waist, $f>0$, and $2\pi f=\ell\sinh w$ is the area of hyperbolic collar that the cap swallows. Results (here; `check_02`):

- **Gauss–Bonnet bound.** Since $(K+1)^2\ge4K$, every cap costs at least $u\,(1-f)$. Thin tubes cost at least $u\,(1+\tfrac{\ell}{2\pi}\cot\theta)$.
- **Exact minimisers.** The Euler–Lagrange caps satisfy $K'=c\,a$ and $2c\,a'=1-K^2$, which reduces the matching to two algebraic equations and the cost to $\tfrac{4\pi^2}{3}\big((K_S+1)^3-(K_0+1)^3\big)/(3c)$. An independent minimisation over piecewise constant curvature reproduces these values. Least cost of one cap, in units of $\pi^2$:

| $\ell$ | $f=0.25$ | $0.5$ | $0.75$ | $1$ | $1.5$ |
| --- | ---: | ---: | ---: | ---: | ---: |
| $1$ | 7.94 | 3.38 | 1.36 | 0.68 | 0.24 |
| $2$ | 7.73 | 3.06 | 1.39 | 0.73 | 0.27 |
| $2\operatorname{arccosh}2$ | 6.08 | 2.88 | 1.43 | 0.78 | 0.30 |
| $\pi$ | 5.26 | 2.77 | 1.46 | 0.83 | 0.32 |
| $4$ | 4.47 | 2.68 | 1.55 | 0.93 | 0.38 |
| $2\pi$ | 4.01 | 2.83 | 1.93 | 1.31 | 0.63 |
| bound $u(1-f)$ | 4.00 | 2.67 | 1.33 | 0 | 0 |

- **At the waist** ($f=0$) the cost is $u$ for $\ell=2\pi$, where the cap is a round hemisphere, and larger otherwise: $5.56$ at $\ell=5$, $7.47$ at $\ell=3$, $7.95$ at $\ell=1$, tending to $8$ as $\ell\to0$, and rising again for long waists ($8.11$ at $\ell=15$). Closing a short waist converges to the cusp solution of 4.3.
- **The collar of the collar lemma is not enough.** At $\sinh w\,\sinh(\ell/2)=1$ one has $f\le1/\pi$, and one cap costs between $4.8$ and $8.0$ for every waist length tested, from $0.25$ to $2\pi$. Two caps exceed $2T$.
- **Cheap means fat.** Two equal caps fit the budget only when $f$ exceeds a threshold between about $0.25$ (at $\ell=2\pi$) and $0.47$ (at $\ell=1$). Each cap has to swallow a one-sided collar whose area $2\pi f$ is a sizeable fraction of $2\pi$, the area of a pair of pants.
- **The trivial presentation enters with fat caps.** Take pants with cuffs $(\pi,\pi,m)$ and round caps on the first two cuffs. A round cap fits when $\cos2S=-(\ell/2\pi)^2$ and $\tanh w=\cot S$, and costs $u(1-\cos S)$. For $\ell=\pi$: $w=1.03$ and $e=4.13\,\pi^2$. The two collars are embedded and disjoint exactly when $m>6.79$, they swallow $3.85$ each, more than the $2\pi$ of the core, and they cross the third waist. Here $R\ge0$, so $Y>0$. This is a non-round entry class on $S^4$ in the exterior family of 07, for $\langle x,y\mid x,y\rangle$.
- **Retained area.** If a geodesic waist is retained with hyperbolic area $A_{\rm ret}$ inside it, then $e\ge u+\tfrac{8\pi}{3}A_{\rm ret}$, which is below $2T$ only for $A_{\rm ret}<\pi$. The 07 design retains all three waists and the whole core, $A_{\rm ret}=2\pi$, which gives $2u$ in the symmetric analogue.

### 2.4 Thin and fat

Two reasons to expect that this is structural (assessment).

Known: an entry metric has positive 1-curvature, $R-2\,\mathrm{Ric}(\nu,\nu)>0$ (earlier note, section 2), and Labbi's surgery theorem for positive $p$-curvature needs codimension at least $p+3$. For $p=1$ that is codimension four: connected sums, not circle surgeries. So no Gromov–Lawson principle carries entry across a thin circle surgery, which agrees with the price $u$ per thin tube.

Here and sketch: fat tubes in flat exteriors force visibly trivial presentations. In a Fuchsian exterior a round tube about a non-peripheral class has $\theta<\pi/2$, because limit points lie on both circles $y=\pm E$ and the distances from $y_0$ to $E$ and to $-E$ add up to $\pi$. Only cuffs have half-Hopf pieces. A sphere with $n+1$ holes has $n+1$ cuffs, and $n$ of them as relators give the trivial presentation; surfaces of positive genus have fewer cuffs than relators. The budget allows at most one thin relator modulo Kobayashi, which leaves $\langle x_1,\dots,x_n\mid x_1,\dots,x_{n-1},r\rangle$. For exteriors from Schottky groups in $SO(3,1)$, classes with half-Hopf pieces are disjoint simple curves on the boundary of the handlebody, hence a Heegaard diagram of $S^3$, which is Andrews–Curtis trivial by Waldhausen (sketch).

The open sub-problem is therefore precise: a Schottky group in $SO(5,1)$ with $\delta<1$ (positive Yamabe type) in which the images of two relators of a presentation that is not visibly trivial have disjoint half-Hopf pieces, or wider tubes. I expect that none exists. A proof would close every design with a conformally flat exterior, modulo Kobayashi and the hemisphere condition. Exteriors that are not conformally flat spend Weyl energy outside the handles as well, and I know of no construction principle for them.

### 2.5 What I would do in 07

1. Not run the width-$1/16$ Weyl integration as an entry attempt. Compute instead the sign of the first Neumann eigenvalue of the conformal Laplacian on the Hopf half $W_+$ of each tube. If both are nonnegative the family is closed without any conjecture, with $e\ge2u$. If one is negative, evaluate $8\pi^2-\tfrac1{48}\int_{W_+}R_h^2$ and test whether the self-dual harmonic form of the double has zeros.
2. Treat a numerical $c_i<u$ as a candidate counterexample to Kobayashi's conjecture: a result in its own right if true, and one that needs an independent replay before any use.
3. Run the same design on the trivial presentation, with tubes about cuff-parallel curves. The number that comes out is the overhead of the design.
4. Record Lemma 2.1 to Proposition 2.4 among the necessary conditions, next to the seam lemma.
5. Reopen direct entry only for a design that retains no umbilic hypersurface with Yamabe-nonnegative doubles and that passes step 3 below $2T$.

## 3. Attainment

I did not audit the proof. The [manuscript](../../../../investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) is short for what it claims (about 24 KB of TeX), and it rests on three kinds of imports: published theorems (Bahuaud–Helliwell, Tian–Viaclovsky, Ache–Viaclovsky, Chang–Gursky–Yang, Palais), Bour's unpublished 2010 preprint with corrections recorded in 06's [audit](../../../../investigations-1/06_bour_flow_and_fixed_type_attainment/01_regularized_flow_and_energy/notes/BOUR_AUDIT_20261126.md), and the program's own neck manuscript.

Why it comes first (assessment). X is true or false independently of whether exotic spheres exist. With the recognition gap and the finiteness corollary it gives a theory of the invariant $I^+$: zero on $S^4$, above $T+\varepsilon_*$ on any other homotopy sphere, attained by a Bach-flat class below $2T$, with finitely many types below each level $2T-\delta$. Malchiodi and Malizia (2025) prove strict subadditivity of the Weyl energy under connected sum and point to a variational theory of minimising sequences as the natural next question; X is a result of that kind. Everything else in the program is conditional on it.

Where a specialist's time is best spent, as far as I can tell from the text:

- **The flow at fixed $\alpha$.** The corrections to Bour include the reverse DeTurck step, a factor $\tfrac12$ in the dissipation identity, and the exponents in his Corollary 9.14. A paper should prove what it uses or cite published statements. Streets (Calc. Var. 2013) treats the long-time behaviour of fourth-order curvature flows; 06's audit used it, the manuscript does not cite it.
- **The coupled limit.** The scheme takes $\epsilon_j\le\alpha_j^2$, which gives $D(t)\le 4I+4\epsilon/\alpha\le4I+4\alpha<32\pi^2$. The flow estimates are at fixed $\alpha$. The limit is then taken over critical metrics of $\mathcal F^{\alpha_j}$ with $\alpha_j\to0$. At constant $R$ their equation is $B=c\,\alpha\,R\,\mathrm{Ric}_0$, the family studied by Gursky and Viaclovsky, and the regularity for it has to be uniform as $\alpha\to0$.
- **The marked limit lemma.** The end count through $D_X=2(E_++E_-)+32\pi^2(k-1)$; trivial groups at infinity through a quotient obstruction proved in the neck manuscript (Hillman's restriction, the spin obstruction for the binary icosahedral link, the signature term $9\pi^2$ for a quaternionic link); the removable point; and the identification $M\to N$ by Palais after the capped exterior is recognised below $T$. A standalone paper has to carry the proofs that are now cited from the program.

Two cheap experiments that would test the theorem end to end on the standard sphere (assessment):

- Integrate the regularised flow in the symmetric control of 2.3, which is one space dimension. Start from the $4.13\,\pi^2$ class and watch monotonicity, the $D$ budget, the Yamabe bound and convergence to the round class.
- Start near the wall. The model there is the Euclidean Schwarzschild metric of 4.3: Ricci-flat, $e=2T$, with a collapsing end. It is not an asymptotically locally Euclidean bubble, and the bound $Y^2\ge48(2T-e)$ is what keeps it out. The constants of X should degenerate in exactly this way as $e\to2T$.

The natural readers are the authors of the imported results. I would send them X alone, before anything about the conjecture.

## 4. Rigidity

### 4.1 What R is equivalent to

Let S be the statement: a homotopy four-sphere with a conformal class with $Y>0$ and $\int\sigma_2>0$ is diffeomorphic to $S^4$. By Chang–Gursky–Yang (2002) the hypothesis is the same as a metric with $R>0$ and $\lvert\mathrm{Ric}_0\rvert^2<R^2/12$.

1. The conjecture holds if and only if E and S hold. No use of X.
2. Given X, S is equivalent to R. If a nonstandard $M$ had a class below $2T$, X would give a Bach-flat minimiser on $M$, which R excludes; the converse is trivial.
3. Known: a positive Einstein metric on a homotopy four-sphere has $\int\sigma_2>0$. So S contains the statement that a homotopy four-sphere with a positive Einstein metric is standard, which is open as far as I know.

Two consequences for planning. First, E is an existence statement for every homotopy sphere, including any that are unknown, so one entered presentation recognises one sphere, and a universal construction of entry is the conjecture modulo S (the earlier note said this; the trials of 07 confirm how little room there is). Second, the method divides hypothetical exotic spheres into those with $I^+\ge2T$, which it cannot see, and those with $T+\varepsilon_*<I^+<2T$, which carry a canonical Bach-flat class. I would write the main theorem of the master in this form and name E and S as conjectures.

### 4.2 The scale between 0 and 2T

The constant $u$ appears four times: as the energy of hemisphere times $S^2$; in Corollary 2.2; in Gursky's bound for Einstein metrics, which gives $u\le e<2T$ for a non-round positive Einstein metric on a homotopy sphere (known; `check_04` j); and in the plan's recognition test $P\le8T$, with $P=4E_++3\ell^2$, which is the Chen–Zhu criterion combined with Gauss–Bonnet. In general $P\le8e$, which gives recognition below $T$. In the symmetric control with $K\ge-1$ one has $P=6e$, so the same test reaches $e<u$ (here; `check_04` k). So between $T+\varepsilon_*$ and $u$ there are no Einstein classes. There R has to exclude Bach-flat minimisers that are not Einstein, and in $[u,2T)$ it has to exclude everything.

### 4.3 A calibration: Bach-flat classes in the symmetric control

For $g=ds^2+a(s)^2d\varphi^2+g_{S^2}$ with $K=-a''/a$ the Bach tensor is diagonal with (here; `check_03` b)

$$B_{ss}=-\tfrac13\Big[\tfrac{1-K^2}{2}-\tfrac{a'}{a}K'\Big],\qquad a^{-2}B_{\varphi\varphi}=-\tfrac13\Big[\tfrac{1-K^2}{2}-K''\Big].$$

So $B=0$ if and only if $K'=c\,a$ and $2c\,a'=1-K^2$ for a constant $c$. At a smooth centre $c=(1-K_0^2)/2$, and $K$ moves in the potential $K^3/6-K/2$ starting at rest at $K_0$. The solutions:

- $K\equiv-1$: conformally flat; with one funnel end this is the round $S^4$.
- $K\equiv1$: the Einstein $S^2\times S^2$.
- $K_0=2$: $K=-1+3\operatorname{sech}^2(s/2)$, $a=2\operatorname{sech}^2(s/2)\tanh(s/2)$. This is the Euclidean Schwarzschild metric in the gauge $r^2(q+g_{S^2})$, with $r=1+\cosh s$ for $m=1$. It is Ricci-flat with $E_\pm=8\pi^2=2T$ exactly, so it lies on the zero-Yamabe wall $e=2T+\tfrac14\int\lvert\mathrm{Ric}\rvert^2$ of the plan (`check_03` e).
- $K_0\in(-1,1)\cup(1,2)$: the surface closes at a second pole with cone angle $2\pi\lvert1-K_1^2\rvert/\lvert1-K_0^2\rvert\ne2\pi$, because a smooth closing would need $K_0K_1=1$ and $K_0^2+K_1^2=2$.
- $K_0>2$ or $K_0<-1$: $K\to-\infty$ at finite distance.

An end with $a'/a\to1$ and $K\to-1$ forces $c=0$. Hence **the only Bach-flat class on $S^4$ invariant under $SO(3)\times SO(2)$ is the round one**. This is weak evidence: it tests a strong form of R on the standard sphere in a one-dimensional family. It is cheap to extend to the $U(2)$-invariant classes, where I expect the same answer (sketch). What it adds is the identification of the object at the wall.

### 4.4 What I would do on R

- Keep B06 unactivated as a universal claim. Activate two sub-cases only.
- **Einstein sub-case.** A non-round positive Einstein metric on a homotopy sphere has $u\le e<2T$. By Brendle's theorem that Einstein metrics with nonnegative isotropic curvature are locally symmetric, it has $\lambda_{\max}(W^\pm)>R/6$ somewhere (known). The question for R is whether it can be a minimiser; the plan's window $(R/3,R/2)$ for the Lichnerowicz operator is the right test.
- **The wall.** Describe the degeneration $e\to2T$, $Y\to0$ with the Schwarzschild model in hand.
- Expectation (assessment): no closure of R at the size of a work packet. It is a sphere theorem between the Chang–Gursky–Yang threshold and the cone $\Gamma_2^+$, and the homotopy-sphere hypothesis enters integral estimates only through $\chi$ and $\tau$; there are no harmonic forms to use.

## 5. Investigations 05 and 04

05 has moved from collars to handle calculus. Its register reports the reduction from a reducible native cut (through Scharlemann's theorem), recognition for the square-knot family (Meier–Zupan), Whitehead exteriors and doubled three-string tangles, and an enumeration of handle slides on the Gompf–Scharlemann–Thompson links $L_{n,1}$: no first reverse cancellation in at most three slides, and 32 of 256 signed fourth-slide histories remaining at $n=3$. The universal selection theorem is recorded as open.

Known: by Gompf, Scharlemann and Thompson, $L_{n,1}$ satisfies Generalized Property R only if $\langle x,y\mid yxy=xyx,\ x^{n+1}=y^n\rangle$ is Andrews–Curtis trivial, which they regard as very unlikely for $n\ge3$. So a successful slide search at $n=3$ would trivialise the Akbulut–Kirby presentation, a problem open since 1985, and an unsuccessful bounded search proves nothing (assessment). I would let the depth-four table finish, record it as a negative result with its scope, and stop. The statements that the master takes from this line of work, the reduction from a reducible cut among them, deserve a human reading more than the enumeration deserves more depth.

04: the folded-height pilot is a recognition exit and not an entry mechanism. Keep it at pilot size.

## 6. Order of work, with stop rules

1. **X.** A specialist reading in the three blocks of section 3; a standalone paper; published imports. No new sub-investigation before the first block has a human reader.
2. **Master text.** Main theorem as in 4.1; E and S named as conjectures; $I^+$ presented as an invariant with gap, attainment and finiteness.
3. **07.** Steps 1 to 4 of 2.5. Stop rule: if both Hopf doubles are Yamabe-nonnegative, close B02 as negative for the family. If a trial gives $c_i<u$, hand it to an independent replay as a Kobayashi candidate.
4. **Fat handles.** One packet on the sub-problem of 2.4. Stop rule: one packet; if no example, record the Fuchsian and $SO(3,1)$ cases and close flat exteriors.
5. **R.** The two sub-cases of 4.4 and the $U(2)$ calibration. Timeboxed, no universal claim.
6. **05 and 04.** As in section 5.
7. **Flow experiment** in the symmetric control (section 3), as a test of X on the standard sphere.

## 7. Corrections and process

- The assessment corrected section 7.2 of the earlier note: an exact conformal product $D_R\times S^2$ through a knotted core cannot lie in the round class, since an umbilic $S^2$ in the round sphere is round. That is right. The Gluck estimate there needs a non-round background, which nothing supplies.
- The readings recorded as independent in the registers are by other instances inside the same pipeline. They found real errors, several of them in Bour's preprint, but they are not what a journal means by a reading.
- Volume. By git, 07 was set up in commit `1c81a30` at 15:38 and holds about 350 KB of Markdown at the input commit of 16:17; 05 holds 2.7 MB. Nobody can read at that rate. I would move effort from generation to checking, and keep one page of negative results across investigations (design, bound, scope, where proved), so that closed families are not reopened.
- Hygiene. `,qquad` still occurs on 30 lines of Markdown, among them line 27 of 07's `REGULAR_HEXAGON_SEAM.md` and line 9 of `HYPERBOLIC_EXTERIOR.md`. The TeX sources are clean. `tools/check_repository_hygiene.py` has no test for it.

## 8. Limits

- I read the documents of 05 and 07 once and quote their results from the registers and notes. I did not check their proofs, and I did not audit 06.
- Lemma 2.1 is proved here only for a class that is reflection-symmetric near the cut. Proposition 2.4 needs the hemisphere condition, and its conclusion is conditional on Kobayashi's conjecture unless the sign of $Y_D$ is determined. The Kleinian paragraph of 2.4 is a sketch.
- The symmetric control prices symmetric fillings only. The table gives the least Euler–Lagrange value; the direct minimisation never went below it, but I did not prove that it is the global minimum.
- The hypotheses of Gursky's theorems and the status of Kobayashi's conjecture are taken from LeBrun's papers and from the introduction of Kobayashi's paper; the statement about $L_{n,1}$ from the introduction of Gompf–Scharlemann–Thompson. I did not reread the proofs.
- The checks are floating-point and computer-algebra tests of formulas and constants. They are not proofs, and they do not test the topological statements.

## 9. What went into the master manuscript

Added later on 26 November 2026, at Edward's request, by the same session and model, on the repository at `de2125d`. The new text is in three input files in a `claude` folder beside the master, so that it can be told apart from the pipeline's text and removed by deleting three lines.

| Input file | Place in the master | Content | From this note |
| --- | --- | --- | --- |
| [umbilic_doubling.tex](../../../manuscript/claude/umbilic_doubling.tex) | end of Section 2 | Reflective seams; Proposition 2.2 (doubling); Corollary 2.3 (half-Hopf pieces); the Fuchsian exterior and equation (2.4); Proposition 2.4 (one tube closes on the standard sphere); the link with Kobayashi's conjecture; the consequence for circle surgeries; Labbi's codimension; symmetric fillings | 2.1, 2.2, the first two results of 2.3, the first paragraph of 2.4 |
| [symmetric_critical_classes.tex](../../../manuscript/claude/symmetric_critical_classes.tex) | Section 7, after the constant-$\sigma_2$ gauge | The strict Einstein range; Proposition 7.1 (a Bach-flat class on $S^4$ invariant under the rotations fixing a circle is round); Euclidean Schwarzschild at $e=2T$ | 4.2, 4.3 |
| [logical_form.tex](../../../manuscript/claude/logical_form.tex) | end of Section 9 | Proposition 9.1 (the conjecture holds if and only if entry holds on every type and S holds; given attainment, S is the rigidity statement; S contains the Einstein statement) | 4.1 |

Where the manuscript differs from sections 1 to 8.

- The cut of Lemma 2.1 is called a reflective seam, and $e_V$ replaces $e_i$. The manuscript adds the exact form of item 4: in a representative $h$ for which an umbilic boundary is totally geodesic, $e_V=T\chi(V)+\tfrac14\int_V\lvert Z_h\rvert^2-\tfrac1{48}\int_VR_h^2$, because Chern–Gauss–Bonnet has no boundary term there. It needs no reflection and no approximation, and it sharpens consequence 3 of 2.2: $c_i\ge 2T-\tfrac1{48}\int_{W_+}R_h^2$ for every representative $h$ on the Hopf half in which the cut is totally geodesic (`check_05` b).
- Proposition 2.4 is stated for any $\gamma\ne1$ in the Fuchsian group. Primitivity is not needed, because the cover is taken by $\langle\gamma\rangle$.
- The consequence for circle surgeries is stated for $\Sigma_P$ and any Fuchsian exterior, without the data of 07. Consequence 1 of 2.2, with the colatitudes of the two tubes of 07, stays here.
- A round cap fits at both roots of $\cosh2r_0=(2\pi/\ell)^2$, which is the condition $\cos2S=-(\ell/2\pi)^2$ of 2.3. At the positive root the cap is larger than a hemisphere and costs more than $u$ (`check_05` h).
- The Einstein range is strict, $u<e<2T$, by the companion theorem "Strict half-harmonic bound" of the marked-neck paper, which I had not used in 4.2.
- **Proposition 7.1 is stronger than the statement of 4.3, and its proof is new.** It assumes invariance under $SO(3)$ only. On the orbit disc the class is $[q+g_{S^2}]$, and the first variation $\tfrac{4\pi}{3}\int\langle\nabla^2K-\Delta K\,q+\tfrac12(1-K^2)q,\,k\rangle\,dA$ shows that the class is Bach-flat exactly when $\nabla^2K=\tfrac12(1-K^2)\,q$. Then $J\nabla K$ is a Killing field of $q$. Smoothness at the fixed circle gives $K=-1$ there, so this field vanishes on the boundary of the disc. It is holomorphic for the smooth conformal structure of the closed disc, hence zero, and $K\equiv-1$. Checks: `check_05` (j) for the first variation, with a general symmetric direction on a torus, and (k) for the boundary value; `check_03` (b) for the rotational case.
- The Schwarzschild remark is tied to the attainment theorem: the metric is complete, scalar-flat and Bach-flat like the blow-up limits there, and it is excluded twice, by cubic volume growth and by carrying exactly $2T$.

Left out of the manuscript: the table of cap costs and the other numerical results of 2.3, the Kleinian sketch of 2.4, sections 3, 5, 6 and 7, and the reference to Malchiodi and Malizia.

Files changed in the repository for this, besides this note and its checks. Nothing was committed.

| File | Change |
| --- | --- |
| `papers/master/manuscript/claude/` (new) | the three input files |
| `papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex` | one sentence in the abstract, three `\input` lines, eight lines of provenance |
| `references/references.bib` | four entries appended, under a two-line comment: `Kobayashi1985Conformal`, `LeBrun2013DelPezzo`, `LeBrun2023Balance`, `Labbi1997Surgery` |
| `papers/master/manuscript/README.md` | one table row |
| `papers/master/DRAFT_HISTORY.md` | one milestone at the top |
| `references/claude/` (new) | [source record](../../../../../references/claude/SOURCE_NOTES_REFLECTIVE_SEAMS_20261126.md) with the inspection level of each imported statement |

The plan, register, overview and the root reference index were not touched. To undo the four edits to pipeline files, run `git checkout -- papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex papers/master/manuscript/README.md papers/master/DRAFT_HISTORY.md references/references.bib`.

Verification. The master was built with `latexmk` in the session's cloud workspace from copies of the repository files whose SHA-256 values match the ones now on disk: 17 pages (12 before), 45 references (38 before), no undefined reference or citation. It was not built on Edward's computer, where the shared folder's shell lacks the bibliography style, and the reading copy under `output/` was not replaced. `tools/check_repository_hygiene.py` reports the same 28 failures as before, all in `formalization/`. The additions had no independent reading.

## Sources

Gursky's inequalities, as quoted in LeBrun, [arXiv:1310.0848](https://arxiv.org/abs/1310.0848) and [arXiv:2203.02528](https://arxiv.org/abs/2203.02528) (Pure Appl. Math. Q. 19 (2023)), and in [arXiv:1601.04796](https://arxiv.org/abs/1601.04796) · Kobayashi, [J. Math. Soc. Japan 37 (1985)](https://ir.library.osaka-u.ac.jp/repo/ouka/all/26341/JMSJ37_3_373.pdf) · Chang, Gursky, Yang, [Ann. of Math. 155 (2002)](https://annals.math.princeton.edu/2002/155-3/p02) and [arXiv:math/0309287](https://arxiv.org/abs/math/0309287) · Chen, Zhu, [arXiv:1206.5051](https://arxiv.org/abs/1206.5051) · Malchiodi, Malizia, [arXiv:2505.17752](https://arxiv.org/abs/2505.17752) · Bour, [arXiv:1012.0342](https://arxiv.org/abs/1012.0342) · Bahuaud, Helliwell, [arXiv:1407.4406](https://arxiv.org/abs/1407.4406) · Streets, [arXiv:1103.4136](https://arxiv.org/abs/1103.4136) · Gursky, Viaclovsky, [arXiv:1105.4648](https://arxiv.org/abs/1105.4648) · Labbi, [Ann. Global Anal. Geom. 15 (1997)](https://doi.org/10.1023/A:1006553611999) · Gompf, Scharlemann, Thompson, [arXiv:1103.1601](https://arxiv.org/abs/1103.1601) · Brendle, Duke Math. J. 151 (2010) · Waldhausen, Topology 7 (1968)
