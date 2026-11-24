# Dirac operators and the missing global proof architecture

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual selected model identifier and reasoning
effort were unavailable and were not changed. The selected lead is the
sole writer; no helper or independent review was used.

## Scope and correction

This answers the author's questions about the omitted Dirac direction
and the connection between the proposed tasks and a proof of smooth
four-dimensional Poincaré. The bounded conceptual task is
**SP4-FOT-PRE-B02**: restore the spinorial alternatives and identify the
global construction obligations. The fixed comparison
**SP4-FOT-PRE-E04** checks the round spinorial model and the relation
between Dirac and twistor energies. This note is the sole deliverable
for those preparation identities, not a live status register. A new
existence mechanism or compactness theorem is outside their finite
scope. The B/E model recommendations remain recommendations, not
execution metadata.

The [23 November assessment](PRELIMINARY_ASSESSMENT_20261123.md) gave
useful local tests but left the global construction inside a vague final
phase. It also placed the twistor-spinor direction too far in the
background. The stronger local geometry of a twistor spinor does not
justify excluding that route: on a homotopy sphere, its global existence
for some metric is itself an exact recognizing target. This note revises
the proposed priorities; the formal overview, plan, and register remain
empty, and the manuscript remains unchanged.

Inputs are the founding discussion, [idea note](FIRST_ORDER_TWISTOR_IDEA_20261123.md),
and [manuscript §3](../../manuscript/first_order_twistor_and_smooth_poincare.tex).
The founding discussion's actual proposal was a Dirac equation "of some
sort", not a restriction to the global untwisted harmonic-spinor equation.
Its canonical archive is in the [Bach branch](../../../02_bach_flow/chat-histories/0001_2026-11-23T20-58-56Z_outline-bach-flow-research-overview.json).
The manuscript SHA-256 remains
`2e11413d0e3a25a059ae6e8375c0bdd361fb25fcb8dfad6c5c7e4d34d7f6bfa0`.
The earlier assessment was read at SHA-256
`fc884b1ac6d59b1dbe480bcc3ddf13ad958037c6a4559170f700cc33032ccf5c`,
before adding its link to this clarification.

## 1. Three different uses of Dirac operators

Fix a smooth oriented positive-definite Riemannian spin four-manifold,
with Clifford convention $X\cdot X=-|X|^2$ and $S^+$ the half-spin
bundle on which real self-dual two-forms act.

**Ordinary harmonic spinors.** The equation $D_g\psi=0$ is first order,
but the Lichnerowicz identity
$D_g^2=\nabla^*\nabla+s_g/4$ gives zero global kernel on a closed
manifold with strictly positive scalar curvature. This includes round
$S^4$. The exclusion is precisely for this global homogeneous equation
with this untwisted connection; it is not an exclusion of local,
inhomogeneous, boundary-value, eigenvalue, or coupled Dirac methods.
Nor does the existence of an ordinary Dirac eigenspinor force $W^+=0$.

**The twistor equation involving Dirac.** The manuscript retains

\[
P_X\psi_+=\nabla_X\psi_++\frac14X\cdot D_g\psi_+=0.
\]

It removes the Clifford trace from the covariant derivative. It does
not impose $D_g\psi_+=0$. Its curvature compatibility forces $W^+=0$
where $\psi_+\ne0$, and prolongation plus continuity extends that
conclusion for a nontrivial global solution on a connected base. The
Friedrich source and the manuscript supply this implication. Zeros must
be allowed; a nowhere-zero positive half-spinor would define the
topologically impossible global twistor section on a homotopy sphere.

**A more general coupled Dirac-type construction.** This remains a
conceptual option. It must specify the operator, bundles, metric and
connection unknowns, reality conditions, and boundary or global domain.
Then it must prove that its solutions produce the needed Frobenius
conditions or curvature control. Calling a system Dirac-type or finding
a kernel is not that implication. A twisted operator's extra curvature
terms must be analyzed with their actual hypotheses.

### The round model supports the twistor route

Bär's author-hosted paper, §2 equation (1) and Lemma 1, constructs
Killing spinors on the unit round sphere. For such a full spinor
$\Psi$, $\nabla_X\Psi=\kappa X\cdot\Psi$ with
$\kappa=\pm1/2$ gives $D\Psi=-4\kappa\Psi$ and $P\Psi=0$.
Since $P$ preserves chirality, its positive projection is a twistor
half-spinor. That projection cannot vanish identically for a nonzero
Killing spinor with $\kappa\ne0$, by comparing the two chiral parts of
the Killing equation. This last projection argument is our elementary
deduction from the inspected round solution, not a quoted theorem.

Thus for a closed smooth homotopy four-sphere $M$ the following are
equivalent, using the manuscript's recognition argument:

\[
M\cong_{\mathrm{diff}}S^4
\quad\Longleftrightarrow\quad
\exists g,\ \exists\psi_+\not\equiv0:\ P_g\psi_+=0.
\]

The forward implication pulls back round data; the reverse uses
$W^+=0$. This is an existential reformulation, not a proof of existence.
Extra local Ricci-flat conformal structure away from zeros, noted in the
earlier assessment, does not make this global target stronger than the
classification statement on this particular class of manifolds.

### One concrete spectral question

For a supplied metric define

\[
\mu(g)=\inf_{\psi_+\ne0}
\frac{\|P_g\psi_+\|_{L^2}^2}{\|\psi_+\|_{L^2}^2}.
\]

The orthogonal Clifford-trace decomposition and Lichnerowicz formula give
the exact identity on a closed base

\[
\|P_g\psi_+\|_2^2
=\frac34\|D_g\psi_+\|_2^2-
\frac14\int_Ms_g|\psi_+|^2\,dV_g.
\tag{1}
\]

Indeed, pointwise $|P\psi|^2=|\nabla\psi|^2-|D\psi|^2/4$;
integration gives (1). For fixed smooth $g$, $P_g^*P_g$ has principal
symbol $3|\xi|^2I/4$, so ordinary compact elliptic spectral theory
identifies $\mu(g)$ with its smallest eigenvalue and gives a smooth
eigenspinor. The variable-metric question is whether a volume-one
metric can be constructed with $\mu(g)=0$. This is a precise candidate
research objective, not a selected or proved minimizing mechanism.

One would need both a reason the variable-metric infimum is zero and
smooth nondegenerate attainment. A small value along degenerating
metrics does not produce the desired spinor on a limiting smooth
metric. The zero condition is conformally invariant, but this quotient
is not asserted to be so. Volume normalization alone does not give
compactness. No positive scalar curvature hypothesis is assumed for
the unknown homotopy sphere. These are explicit B decisions for the
spinorial route, not conclusions of (1).

## 2. The exact proof chain and its missing arrow

Start with an **arbitrary** closed, connected, smooth oriented homotopy
four-sphere $M$. A reference Riemannian metric and a spin structure are
available. A recognizing conformal metric is not supplied.

The desired chain is

\[
M\ \xrightarrow{\text{global construction, open}}
(g,\text{integrable data})\ \Longrightarrow\ W_g^+=0
\ \Longrightarrow\ W_g=0\ \Longrightarrow\ M\cong_{\rm diff}S^4.
\]

The integrable data can be a nontrivial global twistor half-spinor,
compatible patchwise triples of integrable directions, or a solution
of the mixed $\Sigma,A$ equations. For patchwise triples the **same
global conformal metric** is essential; the auxiliary sections need
not match across patches.

For the final two arrows, $\tau(M)=0$ gives $E_+=E_-$. Thus $W^+=0$
implies $W^-=0$. A smooth Weyl-flat metric is locally conformally flat.
Simple connectivity supplies its conformal developing map into $S^4$;
compactness makes the local diffeomorphism a covering, and simple
connectivity of $S^4$ makes that covering a diffeomorphism. These are
the inherited recognition steps. Positive Yamabe type is not an extra
hypothesis of this exact chain.

Every coordinate ball can already be given a flat metric. The unknown
step is how to make the local choices compatible, or solve a global
coupled problem. Local flat constructions alone therefore do not
advance the missing arrow.

## 3. How a construction program could close that arrow

One concrete candidate to investigate is a continuity scheme in the
mixed formulation. Fix a reference metric, its positive two-form bundle
$E$, and compatible starting fields $u_0=(\Sigma_0,\Gamma^+_{g_0})$.
After fixing bundle identifications, define the residual schematically by

\[
\Phi(\Sigma,A)=(d_A\Sigma,\operatorname{Sym}_0 C),
\qquad C_{ij}\nu=-\tfrac12F_A^i\wedge\Sigma_j.
\]

Retain $\Sigma_i\wedge\Sigma_j=2\delta_{ij}\nu$ and positivity.
Compatibility makes $C$ symmetric, so $\Phi=0$ is the manuscript's
exact target. A possible forcing homotopy is

\[
\Phi(u_t)=(1-t)\Phi(u_0),\qquad0\leq t\leq1.
\tag{2}
\]

Equation (2) is a proposed problem, not an established continuation.
Its precise gauge, conformal normalization, forcing identifications,
and differential constraints must be fixed before execution. The
linearized range could already prevent this particular path.

The plan must nevertheless name all the obligations from the start:

1. **Initialization:** construct allowed data on every $M$ from a
   reference metric, without a round atlas or an assumed definite
   curvature connection.
2. **Solvability:** identify a gauge-fixed correction operator, range,
   kernel and cokernel; prove the local continuation or correction
   statement actually needed by the chosen mechanism.
3. **Global estimates:** keep the metric positive and control the
   relevant geometry and fields throughout the construction. A priori
   bounds must come from available data, not assume proximity to round
   geometry or the desired conclusion.
4. **Compactness and completion:** obtain a smooth nondegenerate limit
   on the same smooth manifold, with the required overlap compatibility
   or nontrivial spinor. Exclude the actual concentration, collapse, or
   loss-of-regularity alternatives for that construction.
5. **Recognition:** apply the exact chain above.

For (2), these become an appropriate openness and closedness argument
for the parameter set. For a spinorial minimization, they become zero
infimum and attainment with controlled geometry. For a direct overlap
iteration, they become solvability plus summable corrections and
preservation of the requisite structures. No one of these mechanisms
has yet been shown to satisfy those requirements. Bounds may depend
on the particular starting manifold and reference data; they need not
be uniform across all homotopy spheres, but must apply to each without
assuming it is already standard.

## 4. Placement of the earlier tasks

| Earlier component | Contribution to a proof | Missing contribution |
| --- | --- | --- |
| Round linearization and overlap tests | Check gauges, auxiliary fields, and proposed inverses in a known model | Solvability and estimates away from that model |
| Three-direction criterion | Converts achieved local integrability to $W^+=0$ | Existence for a common global conformal metric |
| Differential Frobenius estimate | Measures the curvature consequence of supplied defects | A mechanism that makes those defects small |
| Mixed connection formulation | Encodes metric compatibility on the actual bundle | A global solution of its coupled equations |
| Dirac/twistor formulation | Supplies another exact target and spectral diagnostics | Construction of a metric with the required nontrivial kernel |
| Small-energy recognition | Can terminate with $Y(M,[g])>0$, $E_+<4\pi^2$ | Construction of such a metric and independent Yamabe control |

The quantitative route could avoid an exactly integrable endpoint,
but does not bypass the construction problem. The earlier estimate
alone neither reduces defects nor produces positive Yamabe type.

The proposed B01 comparison should therefore include Dirac/twistor
methods explicitly. E01/E02 remain useful finite tests, now tied to
particular solvability and estimate questions. The future plan must
reserve named global-existence, a-priori-estimate, and compactness
tasks from its first version. Their methods remain B work until fixed;
calling them E work or hiding them in a final extension task would
misstate readiness. Stable issued identities, if any, must be preserved
when the formal plan and sole register are created.

## 5. Source inspection, 24 November 2026

Existing source identities are reused. New source records below are
canonical for this bounded comparison and linked from the root catalog.
No source PDF was downloaded or retained in this turn; inspected text
was supplied by the web tool. No full-paper or novelty audit is claimed.

- **Friedrich1990TwistorSpinors / R51:** equation (1.1), p. 59,
  prolongation and curvature, pp. 61–62; rechecked the published
  [digitized text](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf).
  Earlier visual inspection and bibliographic provenance remain in
  [the previous record](PRELIMINARY_ASSESSMENT_20261123.md#7-selected-primary-source-inspection-record).
  Consumer: §1. No additional existence theorem is imported.
- **R52 / Bar1996SphereDirac:** Christian Bär, *The Dirac operator on
  space forms of positive curvature*, J. Math. Soc. Japan 48 (1996),
  no. 1, 69–83. Metadata checked against the
  [author's publication record](https://www.math.uni-potsdam.de/professuren/geometrie/publikationen/ansicht/the-dirac-operator-on-space-forms-of-positive-curvature).
  Read the [author-hosted text](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf),
  §2 equation (1), Lemma 1 and its proof, and Theorem 1. The inspected
  file's revision date is unavailable. Hypotheses: standard smooth
  sphere, Riemannian sectional curvature one, $n>2$. Consumers: the
  round benchmark and its elementary chiral projection above. No
  theorem on an arbitrary homotopy sphere or quotient classification
  is imported.
- **R53 / FriedrichKim1999Hijazi:** Thomas Friedrich and Eui Chul Kim,
  *Some Remarks on the Hijazi Inequality and Generalizations of the
  Killing Equation for Spinors*, inspected
  [arXiv:math/9906168v1](https://arxiv.org/html/math/9906168v1),
  25 June 1999. Read §1's compact Riemannian spin assumptions,
  eigenvalue lower bounds and equality discussion, and the stated
  Schrödinger–Lichnerowicz formula in the proof of Theorem 2.6.
  Consumer: background for the operator comparison and (1).
  Its generalized conformal eigenvalue theorem is not used as an
  existence result. The HTML generation date is not a new version.

The signature/developing argument and small-energy recognition retain
the [existing canonical records](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#inherited-background-and-recognition).
