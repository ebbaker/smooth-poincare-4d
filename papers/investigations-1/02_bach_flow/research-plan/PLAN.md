# Research plan — Bach flow

23 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The selected lead model identifier and reasoning
effort were unavailable. The [overview](../research-overview/OVERVIEW.md)
identifies the approved outline, source versions, and inherited evidence.
The [progress register](../research-progress/REGISTER.md) owns live status.

## First objective and completion criterion

Seek a finite-time recognizing slice under explicit geometric hypotheses.
Keep degeneration and initial-data existence as distinct mathematical
dependencies of a route from an arbitrary smooth metric. The initial
condition for this first objective is a supplied class with
$Y(M,[g_0])>0$ and $4\pi^2<E_+(g_0)<8\pi^2$.

The plan uses the overview's equation and chiral operator norm on a closed,
smooth, oriented Riemannian homotopy four-sphere. Normalize total volume to
one by constant metric scaling and the corresponding fourth-order time
scaling. The modified flow then preserves that volume. Choose an energy
margin $0<\eta<4\pi^2$ and consider actual smooth windows of fixed
normalized length $L>0$ on which $Y>0$ and
$4\pi^2\le E_+\le8\pi^2-\eta$. The proposed estimate is
\[
 c_B\int_a^{a+L}\|B_{g(t)}\|_{L^2(g(t))}^2\,dt\ \ge\ d>0 .
\]
Here $d$ would be uniform on a specified class of windows, with its
dependence on $\eta$, $L$, the geometric bounds, and the base stated.
For initial data in this band, suppose the solution stays smooth and
satisfies the geometric hypotheses through time $NL$ for some positive
integer $N$ with $Nd>E_+(g_0)-4\pi^2$. If it remains above or at the
threshold, monotonicity and the Yamabe estimate put each of the $N$
successive windows in the stipulated energy and Yamabe range.
The proposed bound and the energy identity would then give
$E_+(g(NL))\le E_+(g_0)-Nd<4\pi^2$. Thus the conditional estimate would
force a crossing by $NL$.

The first decision concerns which geometric class gives a tractable
estimate and has a plausible route to independent bounds. A near-Bach-flat
sequence within the band is the first test if uniform dissipation cannot
be obtained. The proof would need either a suitable rigidity input or an
account of the loss of compactness. The companion's intermittent energy
estimate motivates examining controlled subintervals if there is a way
to bound their total length. [Companion occupation estimate](../../01_chiral_metric_evolution/reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) ·
[Continuation and compactness source](../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#r48--continuation-and-compactness)

## Proposed sequence and routing

The author's selected lead settings take precedence. B tasks are
conceptual decisions for the lead, with Astra/ultra recommended. An E
task is a bounded check with fixed inputs, method and completion test.
Once authorized, the repository recommends a `gpt-6.2-sol`/ultra helper
for that check. These are routing recommendations. Record available
actual settings and freeze each authorized packet under the [model workflow](../../../../GPT_RESEARCH_MODEL_WORKFLOW.md).

### SP4-BACH-B01 — Specify the dissipation question

- **Role and routing.** Selected lead, B, Astra/ultra recommended. The geometry and proof route are conceptual choices.
- **Dependencies.** The overview's normalization, smooth-interval Yamabe lower bound, dissipation identity, and recognition threshold.
- **Scope and deliverable.** Compare at most two candidate geometric classes for one fixed window. Compare direct full-curvature and injectivity control with a route using the Yamabe lower bound plus a separately justified bound for the Sobolev or curvature argument. Record the chosen class and method, or the specific premise that prevents choosing one, in a brainstorm note.
- **Evidence and completion.** State $\eta$, $L$, the geometric hypotheses, quantifiers over bases and solutions, and what is supplied or expected from the evolution. The note must exhibit one frozen inequality target and test, or identify the exact circular or missing premise. The geometric assumptions should leave a genuine recognition question for metrics above the threshold.
- **B escalation.** If selecting the class requires a new limiting mechanism, or the proposed bounds already imply recognition, route that missing decision to B02 and keep E01 reserved.

### SP4-BACH-E01 — Test one finite-window estimate

- **Role and routing.** Bounded analytical check, E, `gpt-6.2-sol`/ultra recommended once authorized. B01 fixes the class and method.
- **Dependencies.** A B01 decision fixing the class, normalized window and proof method, with exact sourced hypotheses and the frozen request.
- **Scope and deliverable.** Work on one class, one window length and one method. Return a derivation or a precise obstruction in the investigation's notes. If the method uses compactness, check the convergence needed to pass dissipation, energy, and the Yamabe hypothesis to the relevant limit.
- **Evidence and completion.** A positive result supplies a uniform $d$ with its dependencies and the conditional crossing inference. A negative result delimits the exact failed estimate or records the missing implication. A counterexample to a statement about actual Bach solutions must be realized within that class.
- **B escalation.** Send a surviving positive-energy critical limit, loss of geometric control, or need to replace the window estimate to B02. A successful estimate with a supplied geometric premise also leaves that premise available for B02.

### SP4-BACH-B02 — Choose the next geometric or rigidity question

- **Role and routing.** Selected lead, B, Astra/ultra recommended. The form of the next estimate depends on where the first argument stops.
- **Dependencies.** Either B01 identifies a missing premise that prevents freezing E01 or E01 has an assessed outcome.
- **Scope and deliverable.** Compare the observed failure or remaining hypothesis with the companion's compactness and occupation arguments. Choose one of a compact near-Bach-flat sequence in the energy band, a specified degeneration and rescaling, or an alternative estimate on controlled time intervals. Record one choice and its rationale in a brainstorm note.
- **Evidence and completion.** Specify which estimates or limit properties must be proved, the geometric class, and the source hypotheses. If the first estimate succeeds subject to geometry, name one missing geometric bound with a plausible independent test. If compactness is available, isolate the exact Bach-flat rigidity question at the resulting energy and Yamabe level.
- **B escalation.** Keep the question at B02 if several incompatible mechanisms remain or if a usable limiting object cannot yet be specified.

### SP4-BACH-E02 — Check the selected geometric implication

- **Role and routing.** Bounded analytical or source check, E, `gpt-6.2-sol`/ultra recommended once authorized. B02 fixes one implication.
- **Dependencies.** A B02 decision with the exact hypothesis set, one method, and a frozen request.
- **Scope and deliverable.** Check one implication only. Depending on B02, this could be passage to a smooth Bach-flat metric on the same base, eligibility of one rescaling for Lopez's theorem, or one bound needed to use controlled intervals. Return a note showing each required hypothesis and the conclusion it supports.
- **Evidence and completion.** Verify the hypotheses against the chosen flow or sequence and state the resulting convergence, estimate or precise missing premise. A rigidity claim must specify the limiting category and the available energy and Yamabe information.
- **B escalation.** Return to B02 if compactness changes the limit category, the estimate requires additional geometric inputs, or the selected implication must change.

### SP4-BACH-B03 — Select an initial-data question

- **Role and routing.** Selected lead, B, Astra/ultra recommended. The choice concerns which existence problem is both useful and independently approachable.
- **Dependencies.** The overview's arbitrary-metric start and conditional recognition range, plus the companion's initialization discussion. This choice can be made independently of E01.
- **Scope and deliverable.** Compare one approach to positive Yamabe type with one approach to choosing or reaching a conformal class with $E_+<8\pi^2$. Select one exact existence claim or construction to check. Record it in a brainstorm note with the manifold category and what it would contribute.
- **Evidence and completion.** Separate the universally available smooth metric from the conformal-class input. State the quantifiers and every needed extra hypothesis. Identify the gap that would remain even if the chosen claim holds.
- **B escalation.** Keep the question at B03 if the construction assumes the smooth type or an already recognizing metric, or if scope changes to a different topological or geometric problem.

### SP4-BACH-E03 — Check the chosen initial-data input

- **Role and routing.** Bounded source or construction check, E, `gpt-6.2-sol`/ultra recommended once authorized. B03 fixes the assertion and test.
- **Dependencies.** A B03 decision and a frozen request naming one theorem or construction.
- **Scope and deliverable.** Check one primary theorem at its exact passage or one proposed construction on the stated class. Return the hypotheses, the demonstrated existence consequence, and its relation to the conditional flow in a source record or derivation note.
- **Evidence and completion.** Verify the conclusion for the stated inputs, or document precisely why those inputs are insufficient. If the data only apply to already classified examples, retain that scope.
- **B escalation.** Return to B03 if the theorem or construction requires a new geometric or smooth-topological premise.
