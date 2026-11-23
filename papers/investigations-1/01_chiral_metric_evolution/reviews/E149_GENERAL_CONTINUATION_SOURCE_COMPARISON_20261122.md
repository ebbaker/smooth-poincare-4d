# E149 — Primary comparison for general native continuation

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol`
/ `ultra`. Independent runtime and selected lead identifiers were
unavailable. I authored E140 and the E142 audit of E138, which are
inherited by the general continuation assessment used here. This
packet compares primary sources and does not reassess those proofs.
[Request][req] · [B75][b75] · [Continuation assessment][cont].

## Result

Six targeted queries and selected passages in four primary works
identified no matching finite-\(J\) or positive \(C^0\) pair-endpoint
continuation theorem for Fine's exact unadjusted defect-gradient
equation. The same equation occurs in Fine v2, where the checked
theorems give smooth local existence and near-perfect stability.
The closest continuation theorem in the four works is Fine–Yao's
integral torsion criterion for a hypersymplectic triple. The
bounded comparison leaves the general strain estimate and the
literature status beyond these queries open.
[Fine v2, §4][fine] · [Fine–Yao v2, §§3–4][fy].

## Discovery records

- Joel Fine and Chengjian Yao, *A report on the hypersymplectic flow*,
  arXiv:2001.11755v2, revised 6 February 2020. First inspection on
  22 November 2026 reached the primary abstract and version
  history. This is a direct comparator for finite-time extension
  and integral scalar-curvature assumptions on the hypersymplectic
  equation. The exact equation and theorem are checked below.
  The search surfaced it as an adjacent flow, with no equation
  match claimed at discovery. Publication metadata were not
  supplied by the arXiv record. The subsequent check reached
  the numbered passages below in the versioned full-text
  HTML. [Versioned arXiv record][fyabs] · [Primary text][fy].
- Joel Fine, Kirill Krasnov and Michael Singer, *Local rigidity of
  Einstein 4-manifolds satisfying a chiral curvature condition*.
  UCL institutional PDF labeled v3, title-page date 3 June 2020.
  Primary title page, abstract, contents and §1.1 reached on
  22 November 2026. The paper cites Fine arXiv:1111.5005 and
  employs definite-connection variables. Its negative chiral
  Einstein block hypothesis is on a static rigidity theorem.
  The precise comparison is below. Publication metadata and an
  arXiv version crosswalk were not verified at discovery.
  The subsequent institutional check verified publication in
  *Mathematische Annalen* **379** (2021), 569–588,
  DOI 10.1007/s00208-020-02097-z, and identifies the inspected
  v3 PDF as the accepted version. The final publisher full
  text was not used. [UCL versioned PDF][fks] ·
  [UCL publication record][fksmeta].

Fine's arXiv:1111.5005v2 and the published Fine–Krasnov–Panov
paper already have canonical records. Remote text is used for
all passage checks, with no new locally retained reading copy.
[Existing canonical records][sources] · [R26/R27 discovery
records][supplement].

## Exact equation and same-equation results

**Joel Fine, *A gauge theoretic approach to the anti-self-dual
Einstein equations*, arXiv:1111.5005v2, 29 November 2011.**
Checked selected passages in versioned remote HTML on
22 November 2026. Definitions 1.3–1.6 specify metric \(SO(3)\)
connections on real four-manifolds, the definite curvature
plane determining the self-dual space of a Riemannian metric,
and the positive or negative sign given by the orientation of
the curvature-map identification. The curvature components
are in the Lie algebra's orthonormal frame. Fine calls this
the Killing normalization; the investigation uses its positive
negative-Killing pairing as recorded in the canonical
normalization check. The round-compatible curvature-map sign
is the positive component in the investigation's calibrated
conventions. Definitions 1.4, 1.9–1.10 and Proposition 1.12
give \(\mu_A=\frac13\sum_i F_i\wedge F_i\),
\(Q_{ij}=F_i\wedge F_j/\mu_A\), \(\operatorname{tr}Q=3\), and
\(\mathcal E(A)=\int_X\operatorname{tr}(Q^2)\mu_A\).
The difference from the defect energy
\(\int_X |Q-I|^2\mu_A\) is \(3\int_X\mu_A\), a fixed
Pontryagin number multiple in the compact closed setting.
[Fine v2, §§1.3–1.6][fineintro] · [Canonical normalization][sources].

Proposition 4.2 and its proof, (4.1), printed p. 30 in the
recorded v2 pagination, give the native downward flow
\[
 \partial_\tau A=-d_A^{*g_A}\bigl(B_A F_A\bigr),\qquad
 B_A=4Q-\tfrac23\operatorname{tr}(Q^2)I.
\]
The adjoint is for the live curvature-derived metric and \(B_A\)
acts on internal slots. This is the original equation in the
branch assessment. With \(q=Q-I\), \(B_A=2I+4(q-|q|^2I/6)\).
Self-duality in \(g_A\) and Bianchi give \(d_A^{*g_A}F_A=0\),
so the constant \(2I\) term drops. The same calculation explains
the match with the branch's earlier calibrated clock after
its constant native conversion. Fine's fixed-metric Yang–Mills
equation in the comparison immediately following (4.1) uses
\(-d_A^*F_A\) with no live reconstruction or \(B_A\).
[Fine v2, §4.1][fine41] · [Continuation assessment][cont].

In §4.2 Theorem 4.3, printed p. 31, the stated datum is a smooth
definite connection \(A_0\) in the geometric setup, with no
near-perfect or sign restriction in that statement. The result
gives a definite solution on a short datum-dependent interval
and uniqueness on its existence interval. Equations (4.2)–(4.4)
describe the adjusted comparison and smooth automorphism
correspondence. Theorem 4.10 is the near-reference symbol
statement for the displayed adjusted connection equation; it
does not specify an independent continuous pair space,
a \(C^0\) data radius or the coefficient dependence of a
completed norm estimate. The separately assessed branch proof
uses its corrected fixed vertical adjoint and independent
connection–curvature pair. The comparison here uses (4.1)
as the shared original equation and keeps the branch gauge
implementation separate from the source display.
[Fine v2, §4.2][fine42] · [Canonical gauge record][sources].

Theorem 4.11, §4.3, printed pp. 37–38, assumes a fixed
perfect \(\hat A\) on a compact four-manifold and another
definite \(A_0\) sufficiently close to \(\hat A\) in a fixed
background \(L^2_k\) norm, integer \(k\ge3\). It gives global
existence and \(o(e^{-\alpha t})\) convergence in that norm
after bundle automorphisms. Theorem 4.13 states the
near-perfect conclusion for the stability-adjusted equation
(4.9). The fourth section introduces singularity formation
and general long-time obstructions as work beyond its local
results. Neither the near-perfect theorem nor the local
existence statement supplies the branch's arbitrary-incoming-slice
finite-budget or continuous compatible endpoint criterion.
The paper also treats a separately proposed flow on potentials
of closed definite triples in §5, Proposition 5.7, (5.2),
and Theorem 5.8. Its unknown is \(a_i\) with closed forms
\(\omega_i+da_i\), and the equation uses the ordinary
codifferential. Its short-time theorem is for that equation.
Conjecture 1.7 is the distinct positive-definite classification
target. [Fine v2, §4.3][fine43] · [Fine v2, §5][fine5] ·
[Fine v2, §1.4][fineintro].

## Comparison with three adjacent works

**Joel Fine, Kirill Krasnov and Dmitri Panov, *A gauge theoretic
approach to Einstein 4-manifolds*.** Checked the published
*New York Journal of Mathematics* **20** (2014), 293–323,
PDF on 22 November 2026. In §2.2, (1), p. 298, choose
\(\Lambda\ne0\) of the sign of the definite connection; the
positive definite curvature-plane orientation is used. The
volume form \(\nu_A\) normalizes its Gram matrix \(M_A\) by
\(\operatorname{tr}\sqrt{M_A}=|\Lambda|\). In §2.3, (3),
p. 299, \(\Phi_A=\operatorname{sgn}(A)F_A\circ M_A^{-1/2}\)
is the curvature-induced chiral isometry. Definition 2.8,
Theorem 2.9 and the variation in §2.5 identify the action
\(\Lambda^2(12\pi^2)^{-1}\int_X\nu_A\) on compact
four-manifolds and its stationary equation \(d_A\Phi_A=0\).
The critical-point metric is Einstein, with the definiteness
used in the preceding reconstruction.
[Published text, §§2.2–2.5][fkp] · [Existing record][sources].

In §5.3, p. 320, the gradient flow (18) is
\(\partial_t A=(\Lambda/(6\pi^2))d_A^{*g_A}\Phi_A\) for
the volume-normalized metric of that paper. Theorem 5.18
gives short-time existence from a smooth definite datum
of the selected sign. The group includes bundle isometries
covering base diffeomorphisms. Its compact smooth
definite-connection prescription involves an inverse square
root of the Gram matrix and a different volume normalization.
For instance, expressed in one common internal pairing
and with \(\mu=\frac13\sum_iF_i\wedge F_i\)
and \(Q_{ij}=F_i\wedge F_j/\mu\), the volume rule (1)
is \(\nu_A=\Lambda^{-2}(\operatorname{tr}\sqrt Q)^2\mu\).
Up to fixed internal calibration factors, even the conformal
scale relating these two volume conventions varies with
the spectrum of \(Q\). The gradient in (18) involves
\(M_A^{-1/2}\) instead of the \(B_A\) polynomial in (4.1).
This is a different nonlinear prescription. Its
short-time theorem supplies no matching endpoint criterion.
The paper explicitly cites Fine's 2011 preprint in reference
[7]. [Published text, §§2.2, 5.3 and references][fkp].

**Joel Fine and Chengjian Yao, *A report on the hypersymplectic
flow*.** Checked arXiv:2001.11755v2, 6 February 2020, in
remote full-text HTML on 22 November 2026. Definition 2.2,
§§2.3 and 3.1, (2.4), Lemma 3.1 and (3.1) use a compact
oriented real four-manifold with a smooth triple of individually
closed symplectic two-forms \(\underline\omega\) whose nonzero
constant linear combinations are symplectic. The associated
closed \(G_2\)-structure \(\phi\) is on \(M\times\mathbb T^3\).
The evolving four-dimensional metric has the triple's
positive self-dual plane and volume normalized by
\(\det Q=1\), with \(Q_{ij}=\omega_i\wedge\omega_j/(2\mu)\).
The triple keeps its cohomology classes and satisfies
\[
 \partial_t\underline\omega
 =d\bigl(Q\,d^{*}_{g_{\underline\omega}}
                         (Q^{-1}\underline\omega)\bigr).
\]
Fine's defect flow evolves an \(SO(3)\)-connection with
curvature equation
\(\partial_\tau F_A=-d_A d_A^{*g_A}(B_A F_A)\).
The covariant Bianchi identity \(d_AF_A=0\) does not give
individual closure of the local frame components of \(F_A\).
The source's \(G_2\) torsion
\(\mathbf T=-\frac12d^*_{g_\phi}\phi\) is a seven-dimensional
tensor with \(\mathrm{Scal}(g_\phi)=-|\mathbf T|^2\) in
the stated convention, (3.13). The \(T\) of the branch
is a four-dimensional covariant derivative of the trace-three
endomorphism, not that torsion. [Fine–Yao v2, §§2–3][fy].

In §4.2 Theorem 4.7 and proof, a supplied smooth compact
hypersymplectic flow on \([0,s)\), \(s<\infty\), extends
past \(s\) if
\(\int_0^s\sup_M|\mathbf T|^2\,dt<\infty\), using the
associated seven-dimensional norm and torus invariance.
The proof integrates first
the upper inequality for \(\sup\operatorname{tr}Q\), then
that for \(\sup|dQ|_Q^2\). The relevant two inequalities are
(3.10) and (3.11) in Proposition 3.2; the first sentence
of the proof of Theorem 4.7 points to (3.11), while the
trace inequality itself is (3.10). The bound on \(|dQ|_Q^2\)
controls \(|\mathbf T|^2\) via the cited earlier Lemma 3.13.
Theorem 3.3 of the report restates the earlier bounded
seven-dimensional scalar-curvature extension theorem, which
then closes the argument. That earlier paper was not opened
as a separate text in this packet. In §4.3 Theorem 4.10,
an initial smooth hypersymplectic triple with
\(\operatorname{tr}Q(0)<3+\epsilon_0\) has a global
hypersymplectic flow preserving that bound and with
\(|dQ|_Q^2\) bounded. Its hypothesis uses near orthogonality
for determinant-one \(Q\), rather than continuous pair values
around arbitrary smooth positive references with the
trace-three constraint. These are adjacent continuation and
stability results with explicit equation discrepancies.
[Fine–Yao v2, Proposition 3.2, Theorems 3.3, 4.7, 4.10][fy]
· [Canonical comparator record R26][supplement].

The ordinary Ricci flow evolves a Riemannian metric by
\(\partial_tg=-2\operatorname{Ric}(g)\). Fine–Yao's
discussion in §§3.1–3.2 uses explicit extra terms in the
metric equation from the hypersymplectic system and
compares parabolic rescaling arguments with Ricci flow.
None of the compared sources identifies the reconstructed
metric of the defect-gradient connection flow as solving
ordinary Ricci flow. No Ricci-flow criterion is imported.
[Fine–Yao v2, §§3.1–3.2][fy] · [Fine v2, (4.1)][fine41].

**Joel Fine, Kirill Krasnov and Michael Singer, *Local
rigidity of Einstein 4-manifolds satisfying a chiral
curvature condition*.** Checked the 3 June 2020 accepted v3
manuscript in the UCL institutional PDF on 22 November
2026. The title, Definition 1.1, Theorem 1.2 and outline
in §§1.1–1.2, pp. 1–3, give static rigidity of a
Riemannian Einstein metric on a compact orientable
four-manifold with \(R_+<0\) or \(R_-<0\).
Here the chiral block is a quadratic form on the
corresponding real self-dual or anti-self-dual two-forms.
The rigidity statement concerns infinitesimal Einstein
deformations being Lie derivatives. The text explains
the corresponding local isometry statement for sufficiently
nearby Einstein metrics in an appropriate stronger topology.
Definition 2.7 and Theorem 2.8 in §2.3 use the signed
pure connection action \((\Lambda/2)\operatorname{vol}(g_A)\)
for a definite connection of the sign of \(\Lambda\ne0\),
with Euler–Lagrange equation \(d_A\Sigma_A=0\).
The source cites arXiv:1111.5005 as [3] for a related
variational description in a weaker setting and treats a
Hessian criterion at a critical point. Neither its use of
paths of connections in the deformation calculation nor
its static theorem requires a solution of Fine's (4.1).
[UCL accepted version, §§1, 2.3 and reference [3]][fks]
· [Canonical comparator record R27][supplement].

## Exact branch comparison and next checks

The assessed branch result starts with a supplied smooth
original solution on a fixed smooth \(SO(3)\) bundle over
a compact closed oriented Riemannian four-manifold in the
round-compatible positive component. At a finite endpoint
it uses the time integral of the base supremum of
\(|\nabla^AT|_g+|T|_g^2\), where
\(T=(Q^{-1/2}\nabla^AQ\,Q^{-1/2})_0/2\).
Finiteness gives a continuous positive pair limit in the
original fixed identification, with curvature compatibility
distributionally. Independently, the existence of this
positive \(C^0\) pair endpoint already suffices. The
local refinement makes the pair-value and completed-norm
radii uniform over a compact positive algebraic range,
with a time that can depend on derivatives of each smooth
reference. The smooth original restart is from one late
smooth incoming slice, and uniqueness identifies the overlap
after smooth recovery. This is different from a local theorem
from an arbitrary smooth reference with unspecified radius
dependence and from global stability under an \(L^2_k\)
near-perfect hypothesis. None of the four texts supplies
the same continuation hypotheses and conclusion, or the
stated value-radius and time separation on this equation.
[Continuation assessment][cont] · [Fine v2, §§4.2–4.3][fine].

- For a subsequent source check, follow actual citation
  chains to Fine v2 using a dedicated citation database or
  author publication lists, then confirm any asserted
  continuation theorem by matching (4.1), \(B_A\),
  the live adjoint and the curvature-volume normalization.
  The present literal-query search did not exhaust those
  chains. [Fine v2, Proposition 4.2][fine41].
- For a subsequent estimate test, Fine–Yao's two-step
  maximum-principle proof suggests isolating what controls
  the spectrum and a first-derivative quantity for the exact
  connection system. In the branch equation
  \(\operatorname{tr}Q=3\) identically, so their trace
  inequality cannot be adopted as a spectral bound. A
  separate derivation would need a nonconstant quantity
  that detects the approach to the positive-cone boundary
  and an estimate for the branch strain on its own equation.
  No such estimate follows from the present source comparison.
  [Fine–Yao v2, (3.10)–(3.11)][fy] · [Continuation assessment][cont].

## Search and access record

Six web search queries in two three-query batches:

~~~text
"1111.5005" "definite connections" flow continuation singularity
"Gauge theory and calibrated geometry" "definite connections" gradient flow singularities blow-up regularity
Fine "definite connection flow" continuation finite time curvature regularity gradient flow
"1111.5005" "gradient flow" "definite connection" -site:scirate.com
Fine definite connections flow "defect" "energy" "continuation" singularity
Fine Yao hypersymplectic flow finite time singularity "definite connections" original equations extension
~~~

Selected passages from the four works listed above were
checked through arXiv, the journal PDF, and the UCL accepted
PDF. Institutional and arXiv metadata for those same works
are recorded separately from passage inspection. The
Fine–Krasnov–Panov and Fine–Krasnov–Singer texts cite
the original preprint, with the differences in equations
checked above. Search snippets, secondary
summaries, unrelated results, and links to additional
papers were not used as theorem evidence. Exact find
`singularities` on Fine v2 returned no match; its §4
directly discusses singularity formation as further work.
Exact find `(18)` in the FKP PDF did not locate the
equation; direct §5.3 reading recovered it. All four
selected primary texts were accessible. No local PDF
was retained and no publication status was inferred from
an arXiv comment alone. This is a bounded no-match finding.
It does not certify novelty or nonexistence of related
results. [Return][return] · [Canonical comparison records][supplement].

[req]: ../research-progress/handoffs/SP4-CME-E149_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E149_RETURN_v1.md
[b75]: ../brainstorm/notes/B75_GENERAL_CONTINUATION_LITERATURE_COMPARISON_20261122.md
[cont]: E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
[supplement]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2#S4
[fineintro]: https://arxiv.org/html/1111.5005v2#S1
[fine41]: https://arxiv.org/html/1111.5005v2#S4.SS1
[fine42]: https://arxiv.org/html/1111.5005v2#S4.SS2
[fine43]: https://arxiv.org/html/1111.5005v2#S4.SS3
[fine5]: https://arxiv.org/html/1111.5005v2#S5
[fkp]: https://nyjm.albany.edu/j/2014/20-18v.pdf
[fyabs]: https://arxiv.org/abs/2001.11755v2
[fy]: https://arxiv.org/html/2001.11755v2
[fks]: https://discovery.ucl.ac.uk/id/eprint/10112563/1/rigidity_Einstein_4d_v3.pdf
[fksmeta]: https://discovery.ucl.ac.uk/id/eprint/10112563/
