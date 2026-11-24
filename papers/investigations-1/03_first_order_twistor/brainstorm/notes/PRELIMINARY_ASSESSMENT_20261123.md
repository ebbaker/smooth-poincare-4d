# Preliminary assessment of the first-order twistor routes

**24 November follow-up:** the [Dirac and proof-architecture clarification](DIRAC_AND_PROOF_ARCHITECTURE_20261124.md)
revises the priority proposal in §6: Dirac/twistor methods belong in the
initial comparison, and global construction, estimates, and compactness
must be explicit research objectives. The dated calculations below are
preserved at their original evidence scope.

23 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The actual selected model identifier and reasoning
effort were unavailable and were not changed. One lead wrote this note;
there was no helper or independent specialist review.

**Scope.** The author requested a preliminary investigation before an
outline of the overview, plan, and progress register. This records that
bounded inquiry. It does not activate a sustained research program or
populate those three currently empty files. New research notes are kept
in this brainstorm folder at the author's request. The manuscript is
unchanged. Statements below distinguish inherited results, selected source
checks, original preliminary calculations, and proposed work.

## 1. Inputs and finite questions

The starting inputs are the [founding idea](FIRST_ORDER_TWISTOR_IDEA_20261123.md),
the [manuscript](../../manuscript/first_order_twistor_and_smooth_poincare.tex),
the [setup workflow](../../../../../INVESTIGATION_SETUP_WORKFLOW.md), and
the [B/E workflow](../../../../../GPT_RESEARCH_MODEL_WORKFLOW.md).
The existing overview, plan, and register were read and verified empty.

The conceptual question, B work, is which formulation and first estimate
would make a useful research program without assuming its desired global
geometry. Fixed E checks within that comparison are the three-direction
linear algebra, a local differential-defect calculation, and the
four-dimensional chiral specialization of an inspected spinor result.
These are finite preparation checks, not issued research packets or a
second live register. A future register should link this evidence rather
than silently treating it as independently reviewed work. Astra/ultra
for B and Sol 6.2/ultra for fixed E are repository recommendations, not
metadata for this execution.

For later import into the sole register, the preparation evidence has
the following stable identities. These identify the work recorded here;
they do not purport to be previously issued helper requests.

| Preparation identity | Classification, finite check, and evidence boundary |
| --- | --- |
| SP4-FOT-PRE-B01 | B: compare exactly the three manuscript formulations and recommend a first sequence; this note is the deliverable. Any broader construction remains a future conceptual decision. |
| SP4-FOT-PRE-E01 | E: expand the five-variable quadratic reconstruction identity and check the single-plane curvature block; exact rational arithmetic and the displayed algebra are the completion evidence. No optimization over all separated triples was attempted. |
| SP4-FOT-PRE-E02 | E: use the null Koszul identity and the difference of two connections to derive one local norm bound and its weighted integral consequence; §§4.2–4.4 contain the derivation. An uncancelled free curvature term would require returning to PRE-B01. The constants and formal theorem statement await audit. |
| SP4-FOT-PRE-E03 | E: check the hypotheses of Friedrich's Proposition 6 for a nonzero positive half-spinor in dimension four; §5 contains the Clifford-algebra implication. Constructing such a spinor or selecting a new classification theorem remains B work. |

All preparation components have the same lead and this one assigned
output. No claim of independent verification follows from the E label.

At the time of inspection the repository HEAD was
`dbf88c6f128dbc055cbb6570921bd936f377427c`. The first-order branch was
untracked; the following SHA-256 values identify the actual inputs:

| Input | SHA-256 |
| --- | --- |
| Founding idea | `44db4aea03ee590657aad615e78a1e1535d3819154690b11b5855fa80b832bf3` |
| First-order manuscript | `2e11413d0e3a25a059ae6e8375c0bdd361fb25fcb8dfad6c5c7e4d34d7f6bfa0` |
| [Companion manuscript](../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex) | `8f7c71f36835f62acdd587960d8b61108908dd3fc1b50ab8b74a2549752796f6` |
| Setup workflow | `2507cb0ea0a7d1e29e01afc499bae08aed98f66a59f3e0b91a77f7079ce2376b` |
| B/E workflow | `e62039b694fbd4032fee9c003cd07b2391c3f4007a03e2c3511dcbac9277541a` |

## 2. What the three formulations actually ask for

The global base is a closed, connected, smooth, oriented homotopy
four-sphere. Metrics have positive-definite Riemannian signature. The
chosen chirality is $Z_g=S(\Lambda_g^+)$, with $W^+=0$ called ASD.
All calculations here use smooth fields. The local defect calculation
only needs the classical derivatives through order two. No weak-solution
or regularity-extension theorem is asserted.

The manuscript's three-section criterion has a coherent local proof:
three integrable positive orthogonal complex structures for the **same**
conformal metric, distinct modulo sign at every point, force the Weyl
quartic to vanish. Conversely, metric twistor integrability supplies
such sections after shrinking a neighborhood. Reinspection of AHS
Theorem 4.1 and GHN's principal-plane formulas supports the inputs to
that proof. This inquiry is not a full independent manuscript audit.

The local distinction between the formulations matters:

| Formulation | Useful role | Premise still to produce |
| --- | --- | --- |
| Common metric and three projective spinor lines | Expresses the exact local target through Frobenius equations; has a direct quantitative defect | A common positive conformal metric and compatible changes between patches |
| Normalized bundle-valued two-forms $\Sigma$ and connection $A$ | Gives a global bundle formulation against which section equations can be compared | A solution of compatibility and the trace-free self-dual curvature equation |
| Positive-chiral twistor spinor | Strong sufficient condition with finite-type prolongation | A nontrivial solution of an overdetermined equation, with allowable zeros and extra conformal Ricci-flat structure away from them |

For the mixed formulation retain
$\Sigma_i\wedge\Sigma_j=2\delta_{ij}\nu$, $d_A\Sigma=0$, and
$C_0=0$, with $C_{ij}\nu=-F_A^i\wedge\Sigma_j/2$.
The companion's compatibility inverse gives $A=\Gamma_g^+$ and
$C=W^++s_gI/12$. Eliminating $A$ therefore recovers the second-order
ASD metric equation. Counting first derivatives of independent fields
does not establish ellipticity or a new solvability theorem. In
particular, the symmetry of $C$ is a compatibility consequence; treating
all matrix components as independent equations can miscount the system.

Use a genuine rank-three bundle, for example the positive two-form bundle
of a supplied reference metric, rather than a global triple of ordinary
two-forms. No global twistor section exists on a homotopy four-sphere by
the Chern-number argument already in the manuscript. Local section
triples on different patches need not coincide or be permuted copies of
one another. The common conformal geometry and its frame transitions
are the data that must agree. A finite coordinate cover is available;
a two-stereographic-chart smooth description of an arbitrary homotopy
sphere is not an admissible starting assumption.

## 3. A more precise interpretation of the round overlap test

Write $D=(W^+)'_{g_0}$ at the round metric of curvature $K>0$, and
let $\mathcal KX=(\mathcal L_Xg_0)_0$. The ASD deformation complex
is $\Gamma(TM)\xrightarrow{\mathcal K}\Gamma(S^2_0T^*M)
\xrightarrow{D}\Gamma(S^2_0\Lambda^+)$. Its source hypotheses and
the distinction between kernel and cokernel are in
[Gover–Gursky, §1.1](https://arxiv.org/html/2307.12432v1#S1.SS1).

The companion's `metric:D-factorization` gives, on global TT tensors,

\[
D^*D=\frac1{16}(L+2K)(L+4K),\qquad L=\nabla^*\nabla.
\]

Consequently $Dh=0$ and TT imply $h=0$: there are no physical global
infinitesimal conformal deformations in this gauge. This conclusion uses
the inherited factorization, not a new derivation of its normalization.
It controls the kernel; a right inverse also requires cokernel control.
The round model is unobstructed in the inspected deformation-complex
source. Its Proposition 1.2 additionally assumes $H^0=0$ and cannot be
applied directly to round $S^4$, which has conformal Killing fields.
Their finite-dimensional ambiguity must be handled in any gauge choice.

An overlap question must say which discrepancy is prescribed, which
local equations corrections preserve, and which boundary or support
conditions remain fixed. With no such restrictions, resetting both
patches to the supplied round metric is a vacuous correction. Conversely,
prescribing arbitrary ASD germs and asking them to survive in a global
solution is too strong: on a closed homotopy sphere, $W^+=0$ forces
$W^-=0$ by the signature identity. A non-conformally-flat local germ
cannot be retained in such a global metric.

**Recommendation.** First compare the two first-order linearizations
with $D$, including auxiliary-field kernels, gauge freedom, and mixed
differential orders. Then freeze one nonvacuous overlap map and its
function spaces. A bounded inverse or a precisely identified obstruction
would be useful. Neither is an existence argument on an unknown smooth
homotopy sphere.

## 4. A concrete quantitative starting point

### 4.1 Exact algebra for an orthogonal test triple

This is an original calculation in this inquiry, using the manuscript's
normalization. In an orthonormal real basis $(u_1,u_2,u_3)$ of
$\Lambda^+$, write a real symmetric trace-free block as

\[
W=\begin{pmatrix}a&x&y\\x&b&z\\y&z&c\end{pmatrix},\qquad a+b+c=0.
\]

Choose Hermitian-unit null vectors
$\xi_1=(u_2+iu_3)/\sqrt2$, $\xi_2=(u_3+iu_1)/\sqrt2$,
$\xi_3=(u_1+iu_2)/\sqrt2$, and set
$q_i=\langle W\xi_i,\xi_i\rangle_{\mathbb C}$ with bilinear pairing.
Direct expansion gives

\[
\sum_i|q_i|^2=\frac34(a^2+b^2+c^2)+x^2+y^2+z^2,
\qquad
\frac12|W|_{\rm HS}^2\leq\sum_i|q_i|^2
\leq\frac34|W|_{\rm HS}^2.
\]

Thus the reconstruction constant is exactly $\sqrt2$ in the lower
bound for this test triple. Pure off-diagonal blocks attain it. This is
a pointwise benchmark, not a proposal to require an everywhere
orthogonal *integrable* triple; that would impose additional geometry.
General triples retain the manuscript's separation-dependent constant.

Both quadratic identities were checked by exact rational coefficient
determination: after $c=-a-b$, evaluation on the five coordinate vectors
and their ten pair sums fixes every coefficient. There was no floating
sampling or numerical campaign. The residuals checked were
$\sum|q_i|^2-|W|^2/2=(a^2+b^2+c^2)/4$ and
$3|W|^2/4-\sum|q_i|^2=(x^2+y^2+z^2)/2$.

### 4.2 Preliminary intrinsic differential calculation

GHN's equations (13) and (74) already show that a null sectional Weyl
component is a derivative of Frobenius coefficients plus connection
coefficients times those defects. No Ricci assumption is needed for
this implication; see also the first paragraph of their proof of
Theorem 5.10. This identifies a known source mechanism rather than a
novel curvature identity. [GHN, Appendix](https://arxiv.org/html/0911.3364v3#S8)

Here is an intrinsic derivation of the corresponding norm estimate.
It is preliminary analytical work, with no independent review and no
optimized constants. It avoids identifying arbitrary frame coefficients
with invariant quantities.

For one positive orthogonal almost complex structure $J$, let
$\mathcal D=T^{0,1}_J$, let $P=(I+iJ)/2$ project onto $\mathcal D$,
and let $Q=I-P$. Use the Hermitian norms induced by $g$ on complexified
tensors. Define the full tensor

\[
\mathcal F(X,Y)=Q[PX,PY].
\]

Projection kills the derivatives of scalar coefficients in this formula,
so it is tensorial. It vanishes exactly when $\mathcal D$ is involutive.
For $X,Y\in\mathcal D$ put $B(X,Y)=Q\nabla_XY$. The null Koszul
formula, for $X,Y,Z\in\mathcal D$, is

\[
2g(B(X,Y),Z)=g(\mathcal F(X,Y),Z)
-g(\mathcal F(Y,Z),X)+g(\mathcal F(Z,X),Y).
\tag{1}
\]

The bilinear pairing between $\overline{\mathcal D}$ and $\mathcal D$
is nondegenerate. Thus $B$ is an algebraic linear expression in
$\mathcal F$, with a universal norm bound.

Define $\nabla^0_Xs=P\nabla_X(Ps)+Q\nabla_X(Qs)$ and
$K_X=\nabla_X-\nabla^0_X$. This connection preserves $g$, $P$, and
$Q$; $K_X$ interchanges the two subbundles and
$|K|\leq c|\nabla J|$. Its torsion on $X,Y\in\mathcal D$ is
$T^0(X,Y)=-\mathcal F(X,Y)$. With curvature convention
$R(X,Y)=[\nabla_X,\nabla_Y]-\nabla_{[X,Y]}$,

\[
R=R^0+d^{\nabla^0}K+K\wedge K,
\quad
(d^{\nabla^0}K)(X,Y)
=(\nabla^0_XK)_Y-(\nabla^0_YK)_X+K_{T^0(X,Y)}.
\tag{2}
\]

The torsion term is essential. For $X,Y,Z,T\in\mathcal D$, the
$R^0$ and $K\wedge K$ terms preserve $\mathcal D$ and hence pair
to zero with $T$. Equations (1)–(2) leave derivatives of $B$ and a
term bounded by $|K||\mathcal F|$. Since $\nabla^0$ preserves the
splitting, differentiating (1) introduces no free curvature term.
Replacing $\nabla^0\mathcal F$ by $\nabla\mathcal F$ changes the
bound by at most $c|K||\mathcal F|$. Schouten terms vanish on the
totally null arguments. For a Hermitian-unit representative $\xi$ of
$\Lambda^2\mathcal D$, this yields

\[
|\langle W^+\xi,\xi\rangle_{\mathbb C}|
\leq c\bigl(|\nabla\mathcal F|+|\nabla J||\mathcal F|\bigr).
\tag{3}
\]

A change of the curvature sign convention has no effect on (3).
Here $\nabla\mathcal F$ differentiates the full projected tensor,
not only uncorrected coefficients in a moving frame.

Combining (3) for three sections with separation at least
$\varepsilon>0$ modulo antipodes gives the preliminary local estimate

\[
|W^+|^2\leq C_\varepsilon\sum_{i=1}^3
\left(|\nabla\mathcal F_i|^2+
|\nabla J_i|^2|\mathcal F_i|^2\right).
\tag{4}
\]

The constant in (4) includes the universal differential constant, not
just the algebraic $\sqrt2$. Its explicit value remains to be audited.
The proof uses a supplied common metric and local sections; it supplies
no procedure for making the right side small.

On a finite cover with a subordinate nonnegative partition
$\sum_a\rho_a=1$ and a uniform separation bound, (4) gives

\[
E_+(g)\leq C_\varepsilon\sum_{a,i}\int_M\rho_a
\left(|\nabla\mathcal F_{ai}|^2+
|\nabla J_{ai}|^2|\mathcal F_{ai}|^2\right)dV_g.
\tag{5}
\]

No derivatives of $\rho_a$ enter this integration. No matching of
the chosen section triples on different patches is required. Their
metric must be the same. The $L^2$ derivative term and the product of
$L^4$ norms of $\nabla J$ and $\mathcal F$ are invariant under constant
metric scaling in dimension four. They are not asserted to be invariant
under arbitrary conformal rescaling, so an analytic comparison still
needs a conformal gauge.

### 4.3 Why an undifferentiated pointwise defect is insufficient

For any supplied metric, an orthonormal frame can have vanishing
connection at a chosen point. Three constant orthogonal complex
structures in that frame then satisfy $\nabla J_i=0$ and
$\mathcal F_i=0$ at that point, even when $W^+\ne0$ there.
For a concrete smooth local example take

\[
g=dx_1^2+dx_2^2+(1+a x_1^2)dx_3^2+dx_4^2,\qquad a\ne0,
\]

on a sufficiently small positive-definite neighborhood of the origin.
The first metric derivatives vanish there. Its only nonzero sectional
curvature plane is the $(1,3)$ plane, with curvature $k=-a$ in the
positive-sphere convention. In the self-dual basis formed from
$(12+34),(13-24),(14+23)$, divided by $\sqrt2$,

\[
W^+(0)=\operatorname{diag}(-k/6,k/3,-k/6),\quad
|W^+(0)|^2=k^2/6>0.
\]

The trace and norm of this block were checked exactly. This excludes
a universal pointwise estimate using only defect values that vanish
with $\mathcal F_i$. It does not exclude differential, nonlocal, or
additional-hypothesis estimates.

### 4.4 Recognition remains conditional

If (5), after audit, is below $4\pi^2$ and $Y(M,[g])>0$, the
manuscript's norm conversion gives the strict Chang–Gursky–Yang sphere
criterion. This is an application to a **supplied** metric. Constructing
such a metric, controlling the weighted defects, and establishing the
Yamabe hypothesis remain separate tasks. This inquiry does not solve
any of those existence problems. [Theorem A and Remarks 1–2, p. 107](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

## 5. The twistor-spinor alternative has an extra local restriction

An additional preliminary deduction uses Friedrich's Proposition 6,
pp. 66–67. For a positive half-spinor $\psi\ne0$ in Riemannian
dimension four, the real linear map $X\mapsto X\cdot\psi$ is an
isomorphism $T_pM\to S^-_p$: both spaces have real dimension four,
and $|X\cdot\psi|=|X||\psi|$. Consequently $D_g\psi$ lies in its
image, while $\operatorname{Re}\langle D_g\psi,\psi\rangle=0$
by chirality. Friedrich's two invariants $Q_\psi,C_\psi$ therefore
vanish. His result applies on each component where $\psi$ is nonzero:

\[
\widehat g=|\psi|^{-4}g
\]

has a parallel spinor and is Ricci-flat. This is an inference from the
inspected theorem and the dimension-four Clifford algebra, not a quote
of a separately inspected classification theorem. His Proposition 2,
p. 63, also gives isolated zeros for a nontrivial Riemannian twistor
spinor. On a compact base they are finite. The manuscript's topological
argument requires zeros on a homotopy sphere.

Thus the spinor route asks for substantially more local structure than
the three-section ASD test. Keep it as a comparative or specially
motivated route until there is a concrete way to construct the spinor
and control its zero set. No complete classification of compact twistor
spinor geometries was used or established here.

## 6. Proposed overview and research sequence

The overview should explain the exact recognition target, the surface
analogy and its failure of automatic integrability, the three local
formulations, the genuine bundle and overlap problem, and the two useful
intermediate objectives: a quantitative curvature certificate and a
well-posed correction problem. It should contain an evidence table
separating the manuscript, this preliminary derivation, imported
theorems, and still-missing global existence.

Recommended first priority: use the section and mixed-connection
formulations together, audit (4)–(5), and calibrate the linearized
equations on the round model before selecting a nonlinear overlap
mechanism. Keep the twistor-spinor alternative visible without making
it a prerequisite for the primary route.

The following is an outline, not live status. Full task definitions and
current readiness belong in the future sole register and plan.

| Proposed ID | Type and finite deliverable | Dependency / completion boundary |
| --- | --- | --- |
| SP4-FOT-B01 | Fix the common conformal unknown, bundle identification, gauge, norms, and the two initial tests | Ready for a later activated session; completes with a frozen comparison protocol |
| SP4-FOT-E01 | Audit (1)–(5), the reconstruction constants, and the derivative counterexample in one convention | Depends on B01; returns a precise local/finite-cover theorem or an identified error in this preliminary derivation |
| SP4-FOT-E02 | Compare the section and mixed-system linearizations at round curvature $K=1$ with the ASD deformation complex | Depends on B01; includes auxiliary kernels and symbol/gauge accounting, without claiming a boundary inverse |
| SP4-FOT-B02 | Select one nonvacuous correction map, allowed data, and boundary/overlap conditions | Uses E01/E02 assessments; completes with a solvability target or a documented obstruction to choosing one |
| SP4-FOT-E03 | Check that one fixed linear correction estimate or obstruction | Reserved until B02 fixes the analytic problem; an unfavorable result is scoped to that map and data class |
| SP4-FOT-B03 | Choose one next nonlinear or global dependency using the assessed results | Name the missing independent geometric control; do not assume a round atlas on the unknown sphere |
| SP4-FOT-E04 | Execute one selected conditional extension or recognition implication | Reserved until B03 freezes hypotheses, method, finite bounds, and completion test |

An optional spinor packet should be added only if a concrete construction
or zero-set mechanism is selected. A failed overlap estimate should
return to B02 with its boundary conditions and obstruction preserved.
Failure of a chosen estimate does not rule out all first-order methods.
Success near round data leaves arbitrary-sphere initialization and
nonperturbative geometric control explicit.

The future register should record inherited inputs and this completed
preparation separately from ready, unactivated B work and dependent or
reserved E work. Each task needs the workflow's routing reason, inputs,
owner, evidence standard, finite bound, completion condition, and named
B escalation. It remains the only live status owner. The plan and
continuation note should link it. Setup completion should update
navigation, DRAFT_HISTORY, and the continuation prompt without starting
research merely by saving those documents.

## 7. Selected primary-source inspection record

All inspections below occurred on 23 November 2026, America/New_York.
Existing canonical source identities and BibTeX entries are reused;
this section records additional passage-level inspection and consumers.
No full-paper audit or novelty search is claimed.

- **AHS1978:** M. F. Atiyah, N. J. Hitchin, I. M. Singer,
  *Self-duality in four-dimensional Riemannian geometry*, Proc. R. Soc.
  Lond. A 362 (1978), 425–461, [DOI](https://doi.org/10.1098/rspa.1978.0143).
  Theorem 4.1 and remarks, pp. 435–436, re-read visually in the existing
  local PDF, pages 12–13. Its $W_-=0$ is translated to this branch's
  $W^+=0$. Consumer: §2. [Canonical record](../../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md).
- **GoverHillNurowski2011GoldbergSachs / R50:** A. Rod Gover,
  C. Denson Hill, Paweł Nurowski, *Sharp version of the Goldberg–Sachs
  theorem*, Ann. Mat. Pura Appl. 190 (2011), 295–340. Inspected
  [arXiv:0911.3364v3](https://arxiv.org/html/0911.3364v3),
  11 December 2009: §3; (13); Proposition 5.1; Remark 5.2;
  Proposition 5.3; opening proof of Theorem 5.10; Corollary 7.2;
  Appendix (74). Consumers: §§2 and 4.2. Selected HTML passages,
  no local PDF retained. The page's generated display date is not
  treated as a new source version. [Canonical record](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#first-order-twistor-discussion--23-november-2026).
- **GoverGursky2024:** A. Rod Gover, Matthew J. Gursky,
  *The anti-self-dual deformation complex and a conjecture of Singer*,
  J. reine angew. Math. 811 (2024), 293–316,
  [DOI](https://doi.org/10.1515/crelle-2024-0028). This inspection used
  [arXiv:2307.12432v1](https://arxiv.org/html/2307.12432v1),
  23 July 2023, §1.1, (1.3)–(1.9), Proposition 1.2, and the round
  unobstructedness discussion. Consumer: §3. Its general gluing
  theorems and Theorem 1.5 proof are not imported. The earlier
  published-version signature check retains its
  [canonical record](../../../01_chiral_metric_evolution/research-progress/handoffs/SP4-CME-E01C_RETURN_v1.md#metadata-for-canonical-references).
- **Friedrich1990TwistorSpinors / R51:** Thomas Friedrich,
  *On the conformal relation between twistors and Killing spinors*,
  Rend. Circ. Mat. Palermo, Ser. II, Suppl. 22 (1990), 59–75.
  [Digitized published copy](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf).
  Read pp. 61–63 and 65–67 visually, including prolongation,
  Propositions 1–2, the invariants, and Proposition 6 with proof.
  Consumer: §5. A temporary verified PDF was used outside the
  repository: 1,259,097 bytes, SHA-256
  `eb7ba5c3379d420e9bec8b73809a0603e20158055eb8f8468a530f7434a5b818`.
  This is not a durable deposited reading copy. The earlier
  [canonical record](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#first-order-twistor-discussion--23-november-2026)
  remains intact.
- **ChangGurskyYang2003:** Sun-Yung A. Chang, Matthew J. Gursky,
  Paul C. Yang, *A conformally invariant sphere theorem in four
  dimensions*, Publ. Math. IHÉS 98 (2003), 105–143,
  [published copy](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf).
  Rechecked extracted text of Theorem A, (0.3), and Remarks 1–2,
  p. 107, including the four-index/operator norm conversion.
  Consumer: §4.4. [Canonical recognition record](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#inherited-background-and-recognition).

The AHS local copy's earlier provenance is preserved: 11,176,148 bytes,
SHA-256 `a4d55168994f0581232305d17397b8a69b5cf5a28b20a8dc8677a04e18394ee6`.
PDF pages were rendered using the bundled Python/PDFium runtime after
PyMuPDF was found unavailable. Friedrich's web screenshot retrieval was
incomplete, so its published PDF was retrieved and inspected locally.
No PDF or generated page image was added to Git.
