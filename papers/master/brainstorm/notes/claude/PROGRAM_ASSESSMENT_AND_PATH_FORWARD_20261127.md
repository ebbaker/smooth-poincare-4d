# Program assessment and path forward

27 November 2026 (America/New_York). Assessment and brainstorm note prepared for Edward B. Baker III by Claude (Anthropic, model `claude-fable-5-2`, Cowork session, reasoning effort max as configured, no subagents). It answers the request to review the master manuscript, overview, plan and register, the sub-investigations and the formalization, to assess the project as it stands, and to discuss the best path forward on the natural-language and formal sides. Input: the repository at `b607bd17e79598edd18beb6d02f69fed80d72f4d` (27 November, 10:52 EST, clean tree). The note continues the [external review of 26 November](../../../reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md) and the three notes of that date in this folder, and repeats them only where the state has changed.

Evidence scope. *Known* marks a published statement I am confident of. *Read* marks a statement taken on this pass from the cited paper through a web reader that summarizes; each needs a direct reading before a manuscript cites it. *Repo* marks a statement of the linked repository file. *Here* marks a short derivation made for this note; the formulas so marked are tested in the [check scripts](PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127_checks/README.md) (71 checks, all pass), which test identities and constants and are not proofs. *Sketch* marks an outline that was not checked in detail. *Assessment* marks my judgment. The Lean libraries were read as source and were not built. Nothing here was read by a specialist. Apart from the session's chat-history record, no file outside this folder was changed, and the note is not linked from any index.

## 1. Summary

The logical frame is sound and has not changed: the smooth Poincaré conjecture in dimension four is equivalent to entry **E** together with recognition **S**, and both are open. Between the commit of 26 November 23:05 and the head, 785 files and about 54,000 lines were added under `papers/` and `formalization/`. In that material no sphere of unresolved type acquired an entering class, none was recognized through its energy, the attainment theorem **X** was not read by anyone outside the model pipeline, and no mechanism for rigidity **R** appeared. The one marked entry trial was excluded for either Yamabe sign. The recognitions that did occur are topological. Three are marked-cut recognitions through 05's working theorem, two of them of spheres already known to be standard. One further result stands apart, and the master documents do not mention it: the tube child of 08 claims, by a circle action, that a specific homotopy sphere from the literature is standard, and it names that sphere's Gluck twin as open (section 2.2). The Lean libraries stand at 427 files and 90,608 lines with no `sorry` and no `axiom`, and their main theorems are conditional: the geometric content enters through hypotheses and structure fields.

*Assessment.* I do not see a route from the present state to the conjecture. Entry on every homotopy four-sphere would in particular give every homotopy four-sphere a metric of positive Ricci curvature, and no construction of even positive scalar curvature on an arbitrary homotopy four-sphere is known. What I do see is a route to two or three solid theorems in the conformal geometry of four-manifolds, one of which may settle a published conjecture, and one sharply posed sub-problem on which the program's ideas bear. More volume on the present tasks will not change the status of E or S. The best use of the next period is different in kind: connect the program to the literature it has partly rediscovered, have its strongest statements verified by people, concentrate research on one target, and rebuild the formal side around statements and trust instead of the daily frontier.

Three findings of this pass shape that advice.

1. **The master's invariant is the one Chang, Gursky and Zhang introduced in 2018.** On a homotopy four-sphere $\int\sigma_2=4\pi^2-e/2$ and their conformal invariant is $\beta=4e/(8\pi^2-e)$. Entry says that their set $\mathcal Y_2^+(M)$ is nonempty. Their Conjecture 1.2, restricted to $b_2=0$, is S on the band $e<4T/3$. And if the master's recognition gap is correct, it supplies the missing case of their Conjecture 1.1 (section 3.4). The master manuscript and the shared bibliography do not cite that paper.

2. **The band $T\le e<4T/3$ has more structure than the rest.** Every positive class in it, on a homotopy four-sphere, contains a metric with half positive isotropic curvature for each chirality, in general two different metrics (section 4). The operator that decides this is the $P_z$ of investigation 03. So S on this band follows from a statement that needs neither attainment nor a minimizer: a homotopy four-sphere with a PIC$_+$ metric is standard. That is a case of a question Richard and Seshadri left open.

3. **Attainment should be stated where it is not vacuous.** X concerns homotopy spheres, and unless an exotic sphere enters it asserts nothing beyond the round sphere. This corrects a sentence of my 26 November review. The method is the valuable part, and its budget inequality has a general form (section 5.3).

| | Recommendation | Section |
| --- | --- | --- |
| 1 | Pause new trials. Write the recognition gap as a standalone paper in the $\beta$ language, with its consequence for the Chang–Gursky–Zhang conjecture, and with the smoothing step cited from refereed sources where possible. Have a specialist read it. | 3.4, 5.2 |
| 2 | Adopt the literature frame in the overview and the manuscript, from direct readings. | 3 |
| 3 | Make the first band the single research target for S. | 4, 5.3 |
| 4 | Restate attainment for closed oriented four-manifolds with $\mathcal Y_2^+\neq\emptyset$ and test the method on $\mathbb{CP}^2$. | 5.3 |
| 5 | Have the prism recognition of 08 checked by a four-manifold topologist, and bring it and its open Gluck twin into the master as the program's test type. | 2.2, 5.1, 5.2 |
| 6 | Close the entry trial and the cut-geometry children, with written reopening criteria. | 5.4 |
| 7 | Formal side: stop tracking the frontier. Build a short audited statements file, a ledger of literature inputs, non-vacuity instances, a clean-runner build, and one flagship theorem. | 6 |

## 2. State of the program

### 2.1 Logic and status

Notation as in the [plan](../../../research-plan/PLAN.md): $M$ is a closed oriented smooth homotopy four-sphere, $T=4\pi^2$, $e=E_+=E_-$ in the Hilbert–Schmidt norm on real two-forms, and $I^+(M)$ is the infimum of $e$ over positive Yamabe classes.

| | Statement | Status at `b607bd1` *[repo]* |
| --- | --- | --- |
| E | Every $M$ has a class with $Y>0$ and $e<2T$. | Open. No entering class on a type not already known to be standard. The long-cuff width-$1/16$ metric on the minus Miller–Schupp type is excluded: $c>169\pi^2/25$ on each band, sharpened formally to $17689\pi^2/2500$, against a budget below $T$ ([register](../../../research-progress/REGISTER.md)). |
| S | Every entered $M$ is standard. | Open. No sphere has been recognized through an entering class of its own. The marked-cut recognitions are topological, through 05's working theorem: the Mazur double and the Akbulut–Yasui twisted double, both known to be standard, and one Hayden–Mark–Piccirillo cross-gluing, whose prior status I did not find recorded. A further topological claim in 08 is described in 2.2. |
| X | On an entered $M$ a smooth positive Bach-flat class attains $I^+(M)$. | Working manuscript in [06](../../../../investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex), unchanged since 26 November. Two model readings and the master's [audit](../../../notes/BOUR_TERMINAL_AUDIT_20261127.md). No specialist reading. It rests on Bour's flow, which I could find only as a preprint. |
| R | No nonstandard $M$ attains a minimum in $T+\varepsilon_*<I^+<2T$. | Open. The new criteria at an attained minimum assume an umbilic three-sphere with round conformal structure, a Cotton-flat patch on one, or a local rotational axis. The manuscript itself shows that a $C^3$-open, $C^\infty$-dense set of metrics has no umbilic hypersurface patch at all. |
| Gap | $I^+(M)\le T+\varepsilon_*$ forces $M$ standard. | [Manuscript theorem](../../../manuscript/recognition_gap.tex), non-effective. Its proof uses the smoothing lemma of the [descent paper](../../../01_fixed_type_variational_descent/manuscript/endpoint_smoothing.tex). I found no gap on 26 November and listed three points for a specialist. |
| Immersed | $e(F^*g_{\rm Euc})\le 64\pi^2/9$ for an immersion in $\mathbb R^5$ forces $M$ standard. | [Manuscript theorem](../../../manuscript/immersion_entry.tex). |
| Finiteness | Given X, finitely many nonstandard types have $I^+\le 2T-\delta$. | From X and Chang–Qing–Yang. |

### 2.2 The last day

Counts are from git at the head *[repo, `check_04`]*. The repository has 84 commits from 21 to 27 November and 4,516 tracked files. Between `841d606` and the head: 785 files and 54,205 inserted lines under `papers/` and `formalization/`, of which investigation 08 has 580 files and 29,960 lines, the master 84 files and 9,170 lines, and the formalization 120 files and 15,074 lines. Investigations 01 to 07 did not change after `de2125d` (26 November, 16:17), so my readings of them from 26 November stand.

What that volume established, in the terms that matter:

- **E.** The marked trial, on a sphere whose type 07's sources leave unresolved, is dead for either sign. The task that remains in the plan certifies a scalar sign on that same excluded metric. A floating-point estimate in the [handoff](../../../research-progress/handoffs/NATIVE_COST_AND_TWISTED_DOUBLE_20261127.md) puts the band cost near $8.8\cdot10^{11}$, against a budget of order $40$. The gap is not a matter of tuning.
- **S.** Three marked-cut recognitions: the Mazur double and the Akbulut–Yasui twisted double, known to be standard, and one Hayden–Mark–Piccirillo cross-gluing. All are topological and rest on 05's working theorem. They calibrate that theorem; they say nothing about entry or energy on a sphere of unresolved type.
- **R.** Conditional criteria whose hypothesis is nongeneric, as the manuscript says.
- **08.** Its [parent assessment](../../../../investigations-1/08_cut_geometry_and_chirality/reviews/PARENT_ASSESSMENT_20261127.md) is accurate and candid: calibrations, obstructions, corrected signs, and the sentence that no new smooth type has a certified entering class from these results.
- **Formal.** The newest edition formalizes the fixed-width floor for the excluded metric, conditional on the geometric identifications of the native metric.

None of this is wasted as record. Very little of it is progress on E or S.

**One exception, in topology.** The tube child of 08 claims that the even-framed closing of its order-seventeen prism exterior is the standard sphere ([statement and outline](../../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/ORDER_SEVENTEEN_FRAMINGS.md), [replay](../../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E79_EVEN_TRANSFER_REPLAY.md)) *[repo]*. The manifold is a Plotnick–Suciu construction: a fibred two-knot whose fibre is $S^3/(Q_8\times C_{17})$ minus a ball, in a homotopy sphere. The argument moves the reverse-surgery circle onto an exceptional orbit of a locally free circle action, caps equivariantly, and applies the classification of circle actions on simply connected four-manifolds. It uses no energy. The child's source comparison found order seventeen in none of the lists it read; a 2026 preprint treats order seven. The other framing gives the Gluck twin, which the child leaves open after several obstruction computations. I read the statement, the outline and the handoffs, not the proof or its replay. The master plan, register, overview and manuscript do not mention this result. It matters for two reasons. If it is right and new, it is the most substantial new statement about a specific homotopy four-sphere in the day's work. And the twin joins the minus Miller–Schupp sphere of 07 as a named homotopy sphere whose type the sources checked leave unresolved, this time with a standard partner on the same marked exterior.

### 2.3 The investigations at a glance

| Investigation | What it holds | Role in the path proposed here |
| --- | --- | --- |
| 01 Chiral metric evolution | The definite-connection flow and its local theory near the round sphere. Paused by the author on 23 November. | Background. Its search for a condition that a flow preserves meets PIC$_+$ in section 4. |
| 02 Bach flow | The modified Bach flow and its dissipation question. The regularized family moved to 06. | None at present. |
| 03 First-order twistor | The neck paper (first fixed-type critical value, half-harmonic bound, quotient obstruction, critical annulus) and the Dirac and twistor-spinor child. | The centre of the first-band target. |
| 04 Hypersurface immersions | The immersed theorem with its companion paper, two-handle recognition, folded heights. | The second paper of section 5.2. |
| 05 Collar deformation and surgery | The mixed-cut recognition theorem, reducible-cut descent, slide enumeration on the Gompf–Scharlemann–Thompson family. | A topologist's reading, a computational note, the terminal topology of section 4.4, formal certification. |
| 06 Bour flow and attainment | X. | Bet 1 of section 5.3. |
| 07 Positive subcritical entry | The marked Miller–Schupp trial and its obstructions. No entered presentation. | Closed until the reopening criteria of section 5.4 are met. |
| 08 Cut geometry and chirality | New on 27 November: five children, calibrations and obstructions, and the prism example. | The prism example goes to the master; the rest is record. |

Investigations 01 to 07 are as I read them on 26 November.

### 2.4 What I checked on this pass

By hand: the budget proposition and the end count of the attainment manuscript (both limits, fixed $\alpha$ and $\alpha\to0$), the arithmetic of the fixed-width bound, the four-section contrast identity behind it, the structure of the trace-cap positivity argument (Raulot's inequality was not checked), and the analytic continuation in the Cotton-patch corollary. I found no error. By script: the dictionary of section 3, the first-band lemma of section 4, the bubbling budget of section 5.3 with exact integration on the two-ended neck, and the repository counts.

### 2.5 A correction

On 26 November I wrote that X keeps its value whatever the truth of the conjecture. That is wrong as stated. If the conjecture is true, the only entered type is $S^4$ and X is the statement that the round class has $e=0$. If it is false and no exotic sphere enters, X is empty. X has content only on an exotic sphere that enters, the object whose existence S denies. So X cannot be tested on any known example, and as a standalone theorem about spheres it is hard to put before a referee. Its value is as a step toward S, and as a method that can be stated where examples exist (section 5.3).

## 3. The program in the language of the literature

### 3.1 Dictionary *[here, `check_01`]*

In the master's normalization the Chern–Gauss–Bonnet formula is $8\pi^2\chi=E_++E_-+4\int\sigma_2(A)$ with $A=(\mathrm{Ric}-Rg/6)/2$. Chang, Gursky and Zhang define $\mathcal Y_2^+(M)$ as the metrics with $Y>0$ and $\int\sigma_2>0$, the conformal invariant $\beta(M,[g])=\int\lVert W\rVert^2/\int\sigma_2$ with $\lVert W\rVert$ the norm of $W$ as an endomorphism of two-forms and with the same Schouten tensor, and $\beta(M)=\inf_{[g]}\beta(M,[g])$, set to $-\infty$ when $\mathcal Y_2^+(M)$ is empty *[read]*. On a homotopy four-sphere

$$\int\sigma_2=4\pi^2-\frac e2,\qquad \beta=\frac{4e}{8\pi^2-e},\qquad e=\frac{8\pi^2\beta}{4+\beta}.$$

| Master | Chang–Gursky–Zhang | Meaning |
| --- | --- | --- |
| $e<2T$ | $g\in\mathcal Y_2^+(M)$, $\beta<\infty$ | entry |
| $e<T$ | $\beta<4$ | Chang–Gursky–Yang sphere theorem |
| $e\le T+\varepsilon_*$ | $\beta\le4+8\varepsilon_*/(4\pi^2-\varepsilon_*)$ | the master's recognition gap |
| $e<4T/3$ | $\beta<8$ | Gursky's threshold; the first band |
| $I^+(M)$ | $8\pi^2\beta(M)/(4+\beta(M))$ | the same smooth invariant |

The model values are $\beta=0$ on the round $S^4$, $4$ on the Fubini–Study $\mathbb{CP}^2$ and $8$ on the product $S^2\times S^2$. Their Corollary 1 says that $\beta(M)=0$ exactly when $M$ is diffeomorphic to $S^4$ *[read]*. So the conjecture is the statement that $\beta$ vanishes on every homotopy four-sphere, E says $\beta(M)>-\infty$, and S says that $\beta(M)>-\infty$ implies $\beta(M)=0$.

### 3.2 What is proved and what is conjectured there *[read]*

- Chang–Gursky–Yang, as their Theorem 1: for oriented $M$, $\beta(M,[g])<4$ gives $S^4$, and $\beta(M,[g])=4$ gives $S^4$ or the Fubini–Study class on $\mathbb{CP}^2$.
- Theorem A: for oriented $M$ with $b_2^+>0$ there is $\epsilon>0$ such that $4\le\beta(M,[g])<4(1+\epsilon)$ gives $\mathbb{CP}^2$. Theorem B: $b_2^+>0$ and $\beta(M)=4$ give $\mathbb{CP}^2$. The Ricci flow is used to pass from the integral bound to pointwise curvature information.
- For an indefinite intersection form, $\beta\ge8$ with equality on the product class of $S^2\times S^2$. This is Gursky's inequality used in both orientations *[here, `check_01` (e)]*; it is their Theorem C, whose inequality sign my reader rendered inconsistently.
- **Conjecture 1.1.** $\beta(M)=4$ implies $M\cong\pm\mathbb{CP}^2$. **Conjecture 1.2.** A metric in $\mathcal Y_2^+(M)$ with $0\le\beta(M,[g])<8$ implies $M\cong S^4$ or $\pm\mathbb{CP}^2$.
- Zhang proves the Bach-flat companions: a Bach-flat class with $b_2^+>0$ and $\beta$ slightly above $4$ is the Fubini–Study class, one with $b_2^+=b_2^->0$ and $\beta$ slightly above $8$ is the product class, and Page's metric has $\beta\approx8.4$.
- Chang and Chen show that a Bach-flat positive class on $S^4$ with $e\le T$ is round. The repository already uses this.

Two searches found no later paper that proves Conjecture 1.1 or a gap theorem for $b_2=0$. That is not a literature review.

### 3.3 A reduction to homotopy spheres *[here]*

**Lemma A.** Let $M$ be closed and oriented with $b_2(M)=0$, and suppose a class in $\mathcal Y_2^+(M)$ has $\beta<8$. Then $M$ is a homotopy four-sphere.

*Proof.* A class in $\mathcal Y_2^+$ contains a metric of positive Ricci curvature by Chang–Gursky–Yang *[known]*, so $\pi_1(M)$ is finite, of order $d$ say, and $b_1=0$. Hence $\chi(M)=2$. The universal cover is closed and simply connected with $\chi=2d$, so its $b_2$ is $2d-2$, and its signature is $d$ times that of $M$, which is zero. If $d\ge2$ its form is indefinite, Gursky's inequality holds in both orientations for the lifted positive class, and $\beta\ge8$ there. But $\beta$ is unchanged on a finite cover, since both integrals are multiplied by $d$. So $d=1$, and a simply connected closed four-manifold with $b_2=0$ is a homotopy sphere. $\square$

The arithmetic is in `check_01` (e), (f). The two imported statements are Gursky's inequality and the positive Ricci representative.

### 3.4 Consequences

**(a) S on the first band is a published conjecture.** By Lemma A, the case $b_2=0$ of Conjecture 1.2 says exactly that a homotopy four-sphere with a positive class of $e<4T/3$ is standard. The other case of that conjecture concerns $\mathbb{CP}^2$ and lies outside this program.

**(b) The recognition gap, if correct, proves Conjecture 1.1 for oriented manifolds.** Let $\beta(M)=4$. If $b_2\ne0$, orient $M$ so that $b_2^+>0$ and apply Theorem B. If $b_2=0$, Lemma A makes $M$ a homotopy sphere carrying classes with $e$ as close to $T$ as one likes, the gap makes $M$ standard, and then $\beta(M)=0$, a contradiction. *[here; the three statements of theirs that this uses should be confirmed against the published text.]*

I regard (b) as the most consequential single observation of this note, and it cuts both ways. It gives the master's gap theorem a place that a referee in conformal geometry will recognize at once, and it makes that theorem the natural first paper. It also raises the standard of proof. A statement that these authors left as a conjecture, in a paper whose own method is smoothing by the Ricci flow, will be read closely, and the step that will be read most closely is the one the master imports from its own companion manuscript.

**(c) Why the gap closes for $b_2=0$.** On a nonstandard homotopy sphere the master has $P-8T=D+\Delta/12$ and $P\le8e$, so $e-T\ge D/8+\Delta/96$ with both defects nonnegative *[repo; `check_02` (h)]*. Chen and Zhu's classification supplies the strict sign of $\Delta$, which is the role Gursky's inequality plays in Theorem A when $b_2^+>0$. The smoothing lemma follows standard lines (Perelman's entropy for a logarithmic Sobolev inequality, Ye's conversion, Moser iteration on the curvature excess), and its three delicate points are the ones I listed on 26 November. *Assessment:* the argument is short and natural, and I think it is likely to be right. I have not verified the smoothing lemma line by line, and nobody outside the pipeline has.

**(d) E in this language.** $\mathcal Y_2^+(M)\ne\emptyset$ for every homotopy four-sphere $M$. I found no statement of this as a conjecture in the papers read.

### 3.5 The minimization program

Malchiodi and Malizia (2025) prove a strict subadditivity of the Weyl energy under connected sum. Their paper of April 2026 shows, for a Bach-flat $M$ that is not half conformally flat and a locally conformally flat $Z$ with $Y>0$ other than the round sphere, that $M\# Z$ carries a metric of lower Weyl energy than the sum, and outlines a program for the existence of Weyl minimizers by excluding bubbles with the compactness theory of Tian–Viaclovsky, Streets and Ache–Viaclovsky. They do not claim existence *[read]*. The attainment theorem X is a claimed existence theorem of this kind in one topological class, by a regularized fourth-order flow. That is where its readers are.

### 3.6 Citation status *[repo, `check_04`]*

arXiv 1809.05918 (Chang–Gursky–Zhang), 1810.05897 (Zhang), 2604.17547 (Malchiodi–Malizia 2026) and 2211.09091 (Cao–Xie) appear in no tracked file under `papers/` or `references/`. Chang–Gursky–Zhang is used once by name, for Theorem C, in a review inside 08. Richard–Seshadri appears in the bibliography and in one [source note](../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md) of 22 November, which correctly records that it gives no classification. My searches under `papers/` for half positive isotropic curvature, under several spellings, found nothing.

## 4. The first band

### 4.1 The statement

**Lemma B.** Let $[g]$ be a positive class on a closed oriented four-manifold with $E_+<4\int\sigma_2$, equivalently $E_+<\tfrac{4\pi^2}{3}(2\chi+3\tau)$. Then $[g]$ contains a smooth metric with $R>6\nu_+$, where $\nu_+$ is the largest eigenvalue of $W^+$. In particular $\beta<8$ gives this for at least one orientation, and on a homotopy four-sphere $e<4T/3$ gives it for both orientations, in general in two different gauges.

*Proof.* In the unit-volume Yamabe metric $\int\sigma_2=Y^2/96-D/8$, so $Y^2\ge96\int\sigma_2>24E_+$. For $u\in H^1$, Yamabe's inequality and Cauchy–Schwarz give
$$\int\big(6\lvert\nabla u\rvert^2+Ru^2-2\sqrt6\,\lvert W^+\rvert u^2\big)\,dV\ \ge\ \big(Y-2\sqrt6\,E_+^{1/2}\big)\lVert u\rVert_4^2>0 .$$
Let $u>0$ be the first eigenfunction of $-6\Delta+R-2\sqrt6\lvert W^+\rvert$, with eigenvalue $\lambda_1>0$. The metric $\hat g=u^2g$ has $\hat R-2\sqrt6\lvert\hat W^+\rvert=\lambda_1u^{-2}>0$. It is $C^{2,\alpha}$, and the strict inequality survives a smooth approximation of $u$. Finally $\nu_+\le\sqrt{2/3}\,\lvert W^+\rvert$ for a trace-free symmetric $3\times3$ matrix. $\square$

Nothing here is new. The argument is Gursky's proof of his inequality, and the threshold $E_+<\tfrac{4\pi^2}{3}(2\chi+3\tau)$ is his. Chen and Zhu's Remark 3.1 introduces the half invariant built on $R-6\lambda_{\max}(W_+)$ and notes that its positivity forces $b_2^+=0$ *[read]*. What the lemma adds for this program is the reading of the conclusion. The condition $R>6\nu_+$ says that the two smallest eigenvalues of $W^++R/12$ have positive sum, which is Richard and Seshadri's PIC$_+$; equivalently the Weitzenböck operator $R/3-2W^+$ on self-dual two-forms is positive *[here, `check_02` (i)]*. Richard and Seshadri show that PIC$_+$ is preserved by the Ricci flow and by connected sums, and they leave the classification of compact PIC$_+$ four-manifolds open *[read]*.

### 4.2 What the repository already has

Investigation 03 proves, in the [neck paper](../../../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex) (strict half-harmonic bound), that on a homotopy sphere a nonround class with a representative satisfying $\delta W^+=0$ has $\lambda_1(-6\Delta+R-6z)<0$ and $e>16\pi^2/3$. Its operator $P_z$ is the PIC$_+$ operator. In the present language that theorem says that such a class is not conformally PIC$_+$, and Lemma B is the other half: below $16\pi^2/3$ every class is. The descent paper's [subcritical charge theorem](../../../01_fixed_type_variational_descent/manuscript/subcritical_charge.tex) works at the same threshold $I<4T/3$. So the threshold and its analysis are in the repository. What is absent is the identification of the sign of $P_z$ with a curvature condition that a geometric flow preserves.

Positive isotropic curvature of both chiralities in one gauge would finish at once, by Chen–Zhu and Chen–Tang–Zhu. That is guaranteed only for $e\le T$, and on a nonstandard sphere it never holds. The first band is where the two chiralities are balanced in the mean, by the signature, and not pointwise. The manuscript's genericity argument shows the same thing from the other side: along an umbilic patch $W^+$ and $W^-$ are isospectral, so the cut criteria ask for exactly the pointwise balance that a general class lacks.

### 4.3 Three statements, each of which gives S on the first band

I cannot prove any of them.

1. *Flow.* A homotopy four-sphere with a PIC$_+$ metric is standard. This needs no minimizer and no attainment theorem.
2. *Variational.* Given X, a Bach-flat minimizing class on a homotopy sphere that is conformally PIC$_+$ and conformally PIC$_-$ is round. Gursky's theorem and 03's already exclude every class with a half-harmonic representative, so a nonstandard minimizer in the band is Bach-flat, is not conformally Einstein, and has no gauge with $\delta W^+=0$ or $\delta W^-=0$.
3. *Literature.* Conjecture 1.2 of Chang–Gursky–Zhang for $b_2=0$.

### 4.4 The two flows have complementary defects *[sketch]*

The Ricci flow preserves PIC$_+$, but $L^2$ curvature does not control its singularities. Besides necks one must expect bubble sheets modelled on $S^2\times\mathbb R^2$, which lies on the boundary of the PIC$_+$ cone. The fourth-order flow of 06 has bounded $L^2$ curvature, so its singularities are ALE bubbles that a budget controls, but it has no maximum principle and it stops at Bach-flat metrics. Three remarks on the Ricci side:

- A Ricci-flat blow-up limit of PIC$_+$ metrics has $\nu_+\le0$, hence $W^+=0$. A simply connected one that is ALE and not flat is hyperkähler, by Kronheimer's classification, and contains an embedded sphere of nonzero self-intersection, which cannot lie in a manifold with $H_2=0$. Quotients need a separate check; cyclic groups at infinity are excluded on a homotopy sphere by Hantzsche's theorem.
- Shrinking solitons of blow-down type, such as the Feldman–Ilmanen–Knopf soliton, contain a sphere of self-intersection $-1$ and are excluded in the same way. Cao and Xie have partial classifications of four-dimensional gradient shrinking solitons with half positive or half nonnegative isotropic curvature *[read]*.
- Undoing a bubble-sheet surgery is a surgery on a circle. If necks and bubble sheets were the only singularities and every terminal piece were standard, the manifold would bound a five-dimensional handlebody with handles of index at most two, so it would be a $\Sigma_P$ for a balanced presentation $P$ of the trivial group. Even a complete surgery theory would therefore end at handle questions of Andrews–Curtis type. That is the place where 05's calculus is the right language, and it matches item 3 of my [entry note](ENTRY_DIRECT_APPROACHES_20261126.md).

### 4.5 Bounded first tasks

Write Lemma A, Lemma B and the corollaries of section 3.4 into the overview with their attributions. Read directly, and record in the source notes, Chen–Zhu's Remark 3.1, the open questions in Richard–Seshadri, Cao–Xie, and anything on Ricci flow with half positive isotropic curvature or on bubble-sheet singularities in dimension four. Optionally compute the first eigenvalues of $P_z$ for both chiralities on one explicit family on $S^4$ where $W^+$ and $W^-$ differ pointwise, as a calibration of signs and constants.

## 5. Path forward on the natural-language side

### 5.1 The test for a task

A task earns its place if success would change the status of E or S on a type not known to be standard, or would produce a statement that can be verified and published on its own. Most of the tasks of 27 November fail this test. The remaining entry task certifies a sign on a metric already excluded for either sign. The marked-cut recognitions do not pass through an entering class. The criteria at an attained minimum assume a hypersurface that generic metrics do not have.

The first clause has concrete instances. The repository names two spheres whose type its sources leave unresolved: the minus Miller–Schupp sphere of 07 and the Gluck twin of section 2.2. For any proposed criterion one can ask what it says on these two. The twin offers a controlled comparison that the first does not. Its two fillings share one exterior, so a recognition statement that reads only the exterior and its double applies to both fillings or to neither. Each exterior criterion therefore faces a sharp test there: if it holds on that exterior, it proves the twin standard, and if the twin is exotic, it must fail. This presupposes that the even recognition is correct, which is a reason to have it checked first.

### 5.2 Consolidation

Units, in the order I would write them.

1. **The gap paper.** Contents: the dictionary, Lemma A, the gap theorem stated for closed oriented $M$ with $b_2=0$, and the corollary on Conjecture 1.1. Inputs to list one by one: Chen–Zhu Theorems 1.4 and 1.6 and Lemma 2.1, Hamilton's preservation of nonnegative isotropic curvature, the smoothing lemma, compactness at positive time. For the smoothing lemma, compare it with Deane Yang's theorems of 1992 (one is in the bibliography), with the $L^{n/2}$ pinching theorem of Chen–Wei–Ye that Chang and Chen quote, and with the smoothing section of Chang–Gursky–Zhang, and cite a refereed statement wherever one applies. Prove in full only what is left. The shorter ending through Brendle's theorem (C10 of my review) removes the appeal to Obata and to the equality case. This is the paper to send to a specialist first.
2. **The immersed theorem.** State it for every closed oriented hypersurface immersion in $\mathbb R^5$, as an inequality of Chern–Lashof type. The manuscript's proof gives, with no change, that the mean number of index-two critical points of the height functions is at most $9E_+/(32\pi^2)$ *[here, `check_02` (j)]*. So $E_+<32\pi^2/9$ forces a height with none, hence a handle decomposition without two-handles and a connected sum of copies of $S^1\times S^3$; the sphere case with its sharper constant $64\pi^2/9$ is the corollary that uses Property R. Cite its neighbours (F5 of my review).
3. **The prism recognition.** If the even-framed order-seventeen closing is standard and this is new, it is a short paper in four-dimensional topology, independent of everything else here and much cheaper to referee than attainment. Check it against the literature on fibred two-knots with spherical fibres and on circle actions, beyond the four sources the child compared, and ask a four-manifold topologist to read the transfer argument. One point to settle first: for branched twist spins the Gluck twin is standard (Gordon, Pao; Theorem 3.1 in Fukuda's paper), and Plotnick characterizes branched twist spins among fibred two-knots by periodic monodromy *[read]*. The child's monodromy has period six on the closed fibre. Its statement that the twin is open therefore depends on the marked knot not being a branched twist spin, a distinction its notes discuss; its continuation note records that two of the four sources on this point had not been inspected. The same reader could be asked about 05's mixed-cut theorem, on which every marked-cut recognition rests.
4. **Attainment.** After a specialist reading, and in the general form of section 5.3. The dependence on Bour's preprint should be stated as a dependence, with the exact theorems used.
5. **Slide enumeration.** The three-slide and four-slide results on the Gompf–Scharlemann–Thompson family are exact finite statements about objects topologists care about. If the owner of 05 agrees, they make a short computational note, and they are good candidates for formal certification (section 6).
6. **A ledger of negative results.** One page listing each excluded construction with its exact scope, in the sense of the repository rule that a failed route is recorded only for the class examined. It prevents re-running, and it is citable.

The chirality ledger and seam atlas of 08 should be archived as they are unless one of the units above needs them.

### 5.3 Two research bets

**Bet 1: attainment for general four-manifolds.** Target statement: for a closed oriented $M$ with $\mathcal Y_2^+(M)\ne\emptyset$, if the infimum $I$ of $\bar e=(E_++E_-)/2$ over positive classes lies below a threshold determined by $M$, it is attained by a smooth Bach-flat positive class on $M$. The budget generalizes *[here, `check_03`]*. In the unit-volume Yamabe gauge of a closed manifold, $D=\int\lvert Z\rvert^2\le4\bar e-16\pi^2(\chi-2)$. On a complete scalar-flat ALE bubble $X$ with groups $\Gamma_j$ at infinity, $D_X=4\bar e(X)+16\pi^2\big(\sum_j1/\lvert\Gamma_j\rvert-\chi(X)\big)$; the two-ended conformally flat neck gives $32\pi^2$ by exact integration. If $V_j$ denotes the piece of $M$ beyond the $j$-th end, then

$$4\bar e(X)+16\pi^2\sum_j\Big(\frac1{\lvert\Gamma_j\rvert}+\chi(V_j)\Big)\ \le\ 4I+32\pi^2 .$$

On a homotopy sphere this is the one-end count of 06. On $\mathbb{CP}^2$ it gives one end with $b_2(V_1)\le1$. On $S^2\times S^2$ it does not exclude two ends. The reasons to do this: it tests the method where the answer is known, since Gursky's inequality makes the Fubini–Study and product classes minimizers among positive classes; it puts the method in front of the readers of Malchiodi–Malizia; and it aims at manifolds where an existence theorem would be new. A good first deliverable is the method's verdict on $\mathbb{CP}^2$ without using Gursky's theorem: either it recovers the minimizer, or it names the bubble it cannot exclude.

**Bet 2: the first band.** As in section 4. The first deliverable is a precise problem statement with attributions and a literature check, not a proof. If the check finds that half-PIC flows are closer to a classification than I know, the bet becomes the main line. If it finds bubble sheets unresolved in dimension four, the variational form 2 of section 4.3 is the place to work, and there the program's own tools (the Bach-flat Weitzenböck identities, 03's first-order identities on $\Lambda^+$) apply directly.

### 5.4 What to close, and what would reopen it

- **Entry trials.** Close the scalar-sign certification as moot. Reopen entry only for a design that passes the calibration on the trivial presentation, as the plan already requires, and whose estimated band cost is within a factor of ten of the budget before any certification is attempted. Aim any new design at one of the two named spheres of section 5.1.
- **The children of 08.** Several have written closing notes. Keep them closed. The prism example of the tube child goes to the master (section 2.2) and should not grow in place before it has been checked.
- **R beyond the first band.** Only bounded calibrations: the classification of cohomogeneity-one Bach-flat classes on $S^4$, which extends the master's symmetric section, and an effective $\varepsilon_*$.
- **The extrinsic variant.** Every homotopy four-sphere embeds in $\mathbb R^5$ and the immersed criterion needs no Yamabe sign, so existence of the object is free there and the whole problem moves into an energy bound for a conformally invariant functional of the embedding. One decision-level look is justified; I expect the analysis to be harder and the missing rigidity mechanism to be the same.

### 5.5 Where 03 and 05 stand

03's operator $P_z$ and its half-harmonic bound are the entry point to the first band, and the Weitzenböck operator on $\Lambda^+$ is the object its first-order methods were built around. If the program makes the first band its target, 03 moves from a supplier of cut estimates to the center. 05's calculus has three uses that do not depend on E: the terminal topology of any surgery argument (section 4.4), a standalone computational note, and formal certification of finite enumerations.

### 5.6 Readers

The literature suggests the communities: conformal geometry and Ricci flow for the gap paper, fourth-order flows and Bach-flat compactness for attainment, submanifold geometry for the immersed theorem. Whom to ask is the author's decision.

## 6. Path forward on the formal side

### 6.1 Facts *[repo, `check_04`]*

Lean `4.35.0-rc3`. Three libraries with 427 files, 90,608 lines and 3,116 theorem or lemma declarations, no `sorry`, no `axiom` declaration, and 58 further `.lean` check files under `formalization/investigations`. The package depends on Mathlib and on a third-party library, `DifferentialGeometry`, pinned at `788efe9`, which 173 of the files import. Its README states `sorry`-free theorems that include the three-dimensional Poincaré conjecture through Ricci flow with surgery. I did not build or audit it. No workflow in `.github/workflows` builds Lean; the build and axiom receipts in the handoffs are reported by the sessions that produced them.

### 6.2 What the theorems say

There are real definitions: `OrientedHomotopyFourSphere`, `Entered` and `Standard` in [RecognitionFromAttainment.lean](../../../../../formalization/SmoothPoincare/Variational/RecognitionFromAttainment.lean), the class Yamabe constant as an infimum over conformal metrics in [YamabeTransport.lean](../../../../../formalization/FirstOrderTwistor/YamabeTransport.lean), and the set of positive energies. The equivalence of the conjecture with entry and recognition is proved for those definitions, and the round sphere is proved to have positive Yamabe constant. That is solid and worth having.

The theorems that carry the program's names are conditional, and the conditions carry the geometry. Examples at this commit:

- In [SignedCollarRepair.lean](../../../../../formalization/SmoothPoincare/Variational/SignedCollarRepair.lean), the identity $E_+=E_-$ is the field `signature_zero` of the metric structure (line 131).
- In [AttainedRoundCut.lean](../../../../../formalization/SmoothPoincare/Variational/AttainedRoundCut.lean), `BachFlat` is a predicate variable on metrics, and the variation, continuation and recognition steps are the hypotheses `hVariation`, `hContinuation`, `hRecognition`.
- In [BourClosedCapEuler.lean](../../../../../formalization/SmoothPoincare/Variational/BourClosedCapEuler.lean), the value of the Euler characteristic and the closed Gauss–Bonnet formula are fields of the exhaustion structure (lines 378, 379).
- In [PauseStripTrial.lean](../../../../../formalization/SmoothPoincare/IntrinsicEntry/PauseStripTrial.lean), the fixed-width theorem takes the strip volume, the jet bound and the two band identities as hypotheses (lines 66 to 75).
- In [CutNonsplitting.lean](../../../../../formalization/SmoothPoincare/Variational/CutNonsplitting.lean), recognition below $4\pi^2$ is the field `recognize` of a hypothesis structure.

No declaration in the three libraries is named after the Gauss–Bonnet formula, the signature theorem or the Bach tensor.

*Assessment.* The libraries are a large and internally consistent body of checked algebra, bookkeeping and interval certificates. They do not yet raise confidence in any analytic theorem of the program, because for each of those the hard step sits on the hypothesis side. "No `sorry`" is true and is easy to over-read. The editions follow the informal frontier day by day, so much of the newest code certifies steps of a trial that the informal side has since discarded.

### 6.3 Recommendations

**F1. Stop tracking the frontier.** Formalize a statement only after it has survived a week and one reading. The cost of an edition is small; the cost of 90,000 lines that nobody can audit is not.

**F2. A statements file.** One short file, a few hundred lines, with the definitions and the target statements: the conjecture, E, S, X, R, the gap, and the first-band statement, with $\beta$ and $I^+$, and with a real Bach tensor and a real $\int\sigma_2$. Prove the logical relations there: the existing equivalence, the implication from X, R and the gap to S, and Lemma A from its two named inputs. A person reads this file line by line. Everything else in the libraries is then judged by whether it discharges a hypothesis of a statement in that file.

**F3. A ledger of literature inputs.** Each imported theorem appears once, as a named proposition with its hypotheses quantified over all manifolds and metrics, and with a source line: Chang–Gursky–Yang, Chen–Zhu, Gursky's inequality, Tian–Viaclovsky, the signature formula, Bour's theorems. Main theorems take ledger entries as explicit hypotheses. The bespoke bundles attached to single theorems are replaced by ledger entries or derived from them. The conditional structure then matches the citations of the paper, and a reader can see at a glance what is assumed.

**F4. Non-vacuity.** Every hypothesis structure gets an instance, on the round sphere or a flat or product model, or a written reason why none can exist. This guards against bundles that are contradictory or that hold only trivially.

**F5. A clean-runner build.** A workflow that builds the three libraries from the pinned manifest, prints the axioms of the named top-level theorems, and fails on anything beyond the three standard ones. The size of the dependency may call for a cached build. Until this exists, the receipts are self-reports.

**F6. One flagship.** I would choose the recognition gap. Stage A, short: from ledger entries (Chen–Zhu, the modified Yamabe representative, Gauss–Bonnet, signature, smoothing, compactness) prove the gap, and from Theorem B and Gursky's inequality prove the logic of Conjecture 1.1. Stage B, long: prove the smoothing lemma itself on the Ricci-flow layer of the dependency, whose README lists the entropy monotonicity, no local collapsing and maximum principles. That lemma is the step a referee will press, and a formal proof of it would be the first place where the formal side adds confidence that the informal side lacks. A cheaper alternative with a different payoff is to certify the finite slide enumerations of 05, which are exact, error-prone by hand, and the kind of statement formal methods handle best.

**F7. Do not formalize discarded trials.** Keep the fixed-width edition as a template for certificates of this kind and stop there. Foundations worth having in any case: the Weyl decomposition in dimension four with the conformal invariance of $\int\lvert W^\pm\rvert^2$, the Bach tensor as the gradient of the Weyl energy, and the four-dimensional Chern–Gauss–Bonnet formula. The signature formula stays in the ledger.

**Trust base.** Every theorem here inherits the definitions of the dependency: smooth manifold, orientation, metric, curvature, volume, diffeomorphism. A person should read the definitions that the statements file uses, in the dependency's source, once.

## 7. Process

Three observations, offered because the request asked for a broad assessment.

- **Verification is not keeping pace with production.** Fifty-four thousand lines in half a day cannot be read by one person, and the "independent readings" in the registers are by models of the same families. They catch slips, and they have caught several. They do not replace a reader with a different formation. The statements worth a specialist's time are named in the plan already.
- **Plans lack stop rules.** The plan still carries a certification task for a metric whose band energy the same handoff proves to be above the budget and estimates at ten orders of magnitude above it. A rule written before the trial ("make a floating-point estimate of the cost first; abandon if it exceeds the budget by a factor of ten") would have ended it before any certified work began.
- **One line per day.** A dated line in the master register answering two questions (did any type not known to be standard enter; was any type not known to be standard recognized, and by what) would keep the distinction between record and progress visible. For 27 November the answers are "no" and "two topological claims to verify", and the prism claim is not visible in the master documents at all.

## 8. Order of work

| | Work | Done when | Stop if |
| --- | --- | --- | --- |
| 1 | Direct readings of the sources of section 11; bibliography entries; the dictionary and Lemmas A and B in the overview. | Every statement used is quoted from its source with theorem numbers. | A statement differs from my reading; then correct section 3 first. |
| 2 | The gap paper, with the consequence for Conjecture 1.1. | Each external input is a refereed statement or carries a full proof that a second reader accepts. | The smoothing lemma cannot be brought to that state; then state the gap as conditional on it, and say so. |
| 3 | Specialist reading of the gap paper. | A written report. | none |
| 4 | Bet 1 on $\mathbb{CP}^2$. | The method recovers the Fubini–Study minimizer without Gursky's theorem, or names the bubble it cannot exclude. | Two weeks without either. |
| 5 | Bet 2: problem statement and literature check. | A two-page statement with attributions. | none |
| 6 | The prism recognition: literature check, then a topologist's reading. | The even case is confirmed or a gap is named; the status of the twin in the literature is recorded. | The knot turns out to be a branched twist spin; then the twin is standard and the example is a control only. |
| 7 | Formal F2, F3 and F5, then F6 stage A. | The statements file has been read by a person and the workflow is green. | none |

Steps 1, 5, 6 and 7 can run in parallel with 2.

## 9. What I would not do

- Certify anything further about the long-cuff metric.
- Open another child investigation before the gap paper has been read.
- Search for umbilic hypersurfaces in attained minimizers; the manuscript shows why generic metrics have none, and a minimizer has no reason to be special in that respect.
- Present X as a theorem about spheres to an outside reader before it is stated where examples exist.
- Add Lean editions that follow the informal work of the same day.
- Cite any statement of section 3 from this note. It is a pointer to sources, read through a summarizing tool.

## 10. Limits of this review

Read in full on this pass or the previous one: the master manuscript and its input files, the overview, plan and register, the attainment manuscript of 06, the registers and READMEs of investigations 01 to 08 and of the five children of 08, the 08 parent assessment and the theorem statements of its manuscript, the formalization README, plan, overview and newest edition review, and the Lean files named in section 6.2 with some neighbours. Of the prism example I read the statement, the outline of the argument, the source comparison and two handoffs; I did not read the transfer argument or its replay, and I did not find this example until late in the pass. Not read: most of the roughly forty master notes and twenty reviews dated 27 November, most handoffs, the bodies of the 556 Markdown files of 08, and the great majority of the Lean sources. Another result of that kind could be in the material I did not read. The Lean code was not built. The papers of section 11 were read at the level of statements, through a web reader that paraphrases; theorem numbers and inequality signs must be confirmed. The claims marked *sketch* in section 4.4 are untested. I searched for later work on the two conjectures only briefly. The repository's link check resolves every link of this note; at this commit it reports 36 broken links elsewhere, 32 of them to blueprint build outputs that are not in the checkout and 4 in the tube child of 08 to a missing index.

## 11. Sources

Read on this pass through a summarizing web reader:

- S.-Y. A. Chang, M. Gursky, S. Zhang, *A conformally invariant gap theorem characterizing $\mathbb{CP}^2$ via the Ricci flow*, Math. Z. 294 (2020), [arXiv:1809.05918](https://arxiv.org/abs/1809.05918).
- S. Zhang, *Some conformally invariant gap theorems for Bach-flat 4-manifolds*, [arXiv:1810.05897](https://arxiv.org/abs/1810.05897).
- S.-Y. A. Chang, E. Chen, *Some aspects of Ricci flow on the 4-sphere*, New Zealand J. Math. 52 (2021), [arXiv:2109.08208](https://arxiv.org/abs/2109.08208).
- B.-L. Chen, X.-P. Zhu, *A conformally invariant classification theorem in four dimensions*, [arXiv:1206.5051](https://arxiv.org/abs/1206.5051).
- T. Richard, H. Seshadri, *Positive isotropic curvature and self-duality in dimension 4*, [arXiv:1311.5256](https://arxiv.org/abs/1311.5256).
- A. Malchiodi, F. Malizia, [arXiv:2505.17752](https://arxiv.org/abs/2505.17752) and [arXiv:2604.17547](https://arxiv.org/abs/2604.17547).
- H.-D. Cao, J. Xie, [arXiv:2211.09091](https://arxiv.org/abs/2211.09091) and [arXiv:2403.19627](https://arxiv.org/abs/2403.19627).
- V. Bour, *Fourth order curvature flows and geometric applications*, [arXiv:1012.0342](https://arxiv.org/abs/1012.0342).
- M. Fukuda, *Gluck twists along 2-knots with periodic monodromy*, [arXiv:1811.05109](https://arxiv.org/abs/1811.05109).

Used from memory and from the repository's bibliography: Gursky's inequality (Ann. of Math. 1998), Chang–Gursky–Yang (2002, 2003), Chang–Qing–Yang, Tian–Viaclovsky, Hamilton, Chen–Tang–Zhu, Brendle, Kronheimer, Hantzsche, Kervaire, Laudenbach–Poénaru, Deane Yang.

Repository files are linked where they are used. Earlier notes of this folder: [uses of the first-order and marked-cut tools](USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126.md), [paths forward after attainment and the entry trials](PATHS_FORWARD_AFTER_ATTAINMENT_AND_ENTRY_TRIALS_20261126.md), [direct approaches to entry](ENTRY_DIRECT_APPROACHES_20261126.md).
