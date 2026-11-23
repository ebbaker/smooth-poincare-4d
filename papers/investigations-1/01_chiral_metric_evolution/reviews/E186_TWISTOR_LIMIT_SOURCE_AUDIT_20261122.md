# E186 Fine twistor-limit source and applicability audit

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Bounded E source audit under B91, configured
gpt-6.2-sol/ultra. Independent runtime and lead-model attestation
unavailable. I audited E165 in E167 and the native chiral estimates
in later applications, and authored the related E145/E155/E157
calculations. Fine's twistor-limit theorem is a new primary source for
this audit. The branch compactness proof is used at its assessed scope.

## Disposition and inspected version

Fine's Theorem 3 gives a conditional comparison for a locally
hyperkähler pointed limit. It uses **pointed \(C^2\) convergence and
tamed prelimit metric twistor spaces**. The assessed branch
extraction supplies the locally hyperkähler limit input, but supplies
neither of those two hypotheses. The two unmet hypotheses are
independent in this application. No twistor-limit theorem is imported
into the assessed compactness chain.

On 22 November 2026 I opened Joel Fine's *Limits of Riemannian
4-manifolds and the symplectic geometry of their twistor spaces* in
the HTML and indexed PDF of arXiv:1602.03829v2. The arXiv submission
record gives 15 November 2016 and identifies v2 as the accepted
version. The indexed PDF header gives the same arXiv version/date
and separately displays April 4, 2018 on its title page. That
display is not an arXiv revision date. The author index and related
DOI identify *Transactions of the London Mathematical Society*
4(1) (2017), 100–109, DOI 10.1112/tlm3.12003. The published body
was not inspected and no final-edition page crosswalk is asserted.
The version-specific abstract route returned a cache miss; the
unversioned arXiv record exposed the actual v2 submission history.
No local source bytes or hash were retained.
[v2 HTML](https://arxiv.org/html/1602.03829v2).
[v2 PDF](https://arxiv.org/pdf/1602.03829v2).
[arXiv submission history](https://arxiv.org/abs/1602.03829).
[Author publication index](https://joel.fine.web.ulb.be/papers.html).
[Journal DOI](https://doi.org/10.1112/tlm3.12003).

The following locators are the **printed preprint pages**, not
journal locators. The v1 HTML route returned a cache miss, and
the indexed v1 PDF supplied the one comparison passage below.
No discovery queries or additional primary works were used.

| Checked v2 location | Printed page(s) |
| --- | --- |
| §1.1, metric twistor definitions, (1)–(2), Theorem 1 and Definition 2 | 1–2 |
| §1.1, Theorem 3 and the limit vertical form | 3 |
| §1.2, Corollary 4 and application explanation | 3–4 |
| §1.2, Remark 5 | 4 |
| §2.1, comparison construction and Lemma 6 | 5–7, lemma on 6 and proof on 6–7 |
| §2.2, Proposition 7 and (3)–(5) | 7–8 |
| §2.3, Proposition 8 and Corollary 9 | 8–10, statements on 9 and 10 |
| §2.4, universal-cover pullback and area contradiction | 10–11 |

## Metric twistor curvature and theorem scope

Fine uses the Riemannian \(S^2\)-bundle for the chosen orientation,
equivalently the sphere of positive orthogonal tangent complex
structures. Its horizontal splitting uses the Levi–Civita
connection, and \(J_+\) and \(J_-\) agree vertically and differ by a
horizontal sign. In ordinary orthonormal Hodge bases write the
curvature operator as
\[
 \operatorname{Rm}_{\mathrm{op}}
    =\begin{pmatrix}\mathsf A & B^*\\ B & \mathsf C\end{pmatrix},
 \qquad \mathsf A=W^++\tfrac{s}{12}I,\quad
 B:\Lambda^+\longrightarrow\Lambda^- .
\]
Here \(\mathsf A\) is the metric self-dual block. It is a different
object from the branch's given connection \(A\).
Theorem 1 assumes
\[
 |\langle\mathsf A\theta,\theta\rangle|
           >|B\theta|\,|\theta|\qquad
        (0\ne\theta\in\Lambda^+),
 \tag{1}
\]
pointwise. The Reznikov form then tames \(J_+\) if
\(\det\mathsf A>0\), and tames \(J_-\) if \(\det\mathsf A<0\).
The strict inequality makes the quadratic form of \(\mathsf A\)
sign definite on each fiber, so the determinant distinguishes
the signs in dimension three. Definition 2 calls (1) the tamed
case. An ASD Einstein metric in this orientation has \(W^+=0\)
and \(B=0\); its nonzero scalar curvature gives (1) with the
sign of \(s\). Theorem 1 is Fine's stated version of a cited
theorem; this audit did not open that earlier work separately.
[Fine v2, §1.1](https://arxiv.org/html/1602.03829v2).

Theorem 3 assumes a sequence of Riemannian four-manifolds with
tamed metric twistor spaces and pointed \(C^2\) convergence to a
locally hyperkähler four-manifold. Here locally hyperkähler
means its universal cover is hyperkähler. The conclusion
excludes a holomorphic sphere on that cover in each hyperkähler
complex structure. The theorem is not a compactness or extraction
statement and does not require taming of the limit: there
\(\mathsf A=B=0\). Fine passes to a subsequence of a single
taming sign. [Fine v2, Theorem 3 and §2.4](https://arxiv.org/html/1602.03829v2).

## Proof use of convergence, regularity, and taming

In §2.1 Lemma 6, over a fixed compact comparison domain the
pulled-back metrics give smooth fiber identifications by
positive chiral projection and normalization of the sphere.
The dependence of the projector on the metric is algebraic,
while the horizontal splitting involves the first derivatives
of the metric. The \(C^2\) metric comparison thus gives
\(C^1\) convergence of the pulled-back twistor almost complex
structures. The companion equality \([\omega_i]=[\omega]\)
comes from the isomorphism of vertical oriented two-plane
bundles and their Euler classes in Fine's normalization.
The area argument uses this class equality rather than a
strict positivity constant uniform in \(i\).
[Fine v2, §2.1](https://arxiv.org/html/1602.03829v2).

Proposition 7 deforms a regular holomorphic curve under a
\(C^1\)-small perturbation of \(J\). Its local Cauchy–Riemann
map is on \(W^{1,p}\) maps of a surface with \(p>2\), into
\(L^p\) sections. The undifferentiated difference of the maps
has a \(C^0\) coefficient estimate in (4). Their first
differential has a term from differentiating \(J'-J\) at
the perturbed map, controlled in (5) by \(\|J'-J\|_{C^1}\).
Surjectivity of the linearized curve equation and that
differential estimate are the inputs to persistence. Remark 5
identifies this exact issue for bounded-Ricci \(C^{1,\alpha}\)
metric convergence, which gives only a \(C^{0,\alpha}\)
twistor comparison in this construction.
[Fine v2, Remark 5 and §2.2](https://arxiv.org/html/1602.03829v2).

In §2.3, Proposition 8 first rules out motion of the horizontal
lift in the hyperkähler-structure direction, using the
holomorphic volume form and the nonzero area of the curve.
Corollary 9's sphere regularity calculation uses the
\(\mathcal O(-2)\) normal line and real index six, with the
kernel coming from reparametrization. Section 2.4 starts
with a holomorphic sphere \(S\) in the universal cover.
For the embedded sphere used there, the normal-line calculation
is the relevant case. It should not be read as a regularity
claim for arbitrary multiple-cover parametrizations. The
horizontal sign is read from \(J_\pm=\pm I_a\oplus J_{S^2}\):
with the same \(I_a\)-holomorphic parametrization, use
the constant \(a\) lift for \(J_+\) and constant \(-a\)
for \(J_-\). This keeps the displayed horizontal sign and
the zero-area property.
[Fine v2, §§2.3–2.4](https://arxiv.org/html/1602.03829v2).

The compact comparison and its pulled-back structures lift
to a compact neighborhood of the sphere on the universal
cover. The limit form is pulled back from the sphere of
hyperkähler complex structures. It has zero integral over
the horizontal lift. Regularity and Proposition 7 produce
a nearby nonconstant holomorphic sphere in the same class
for each sufficiently large \(i\). Taming makes its
\(\omega_i\) area strictly positive, whereas the cohomology
equality and homotopy give area zero. This is the specific
use of prelimit taming. Neither merely having a closed
fiber-area form nor convergence of that form would give
the positivity step.
[Fine v2, §2.4](https://arxiv.org/html/1602.03829v2).

## Corollary 4 and the withdrawn v1 statement

Corollary 4 is for compact oriented four-manifolds with ASD
Einstein metrics, **nonzero scalar curvature normalized by
\(|s|=1\)**, uniform diameter upper bound and positive total
volume lower bound. It gives a subsequence with smooth ASD
Einstein convergence, retaining nonzero scalar curvature.
Its explanation invokes Einstein orbifold convergence and
ALE rescalings, plus the holomorphic \((-2)\)-sphere in a
nonflat ALE gravitational instanton. These are Fine's
cited inputs in the application. No independently checked
additional theorem is imported here. The branch's uniform
absolute Ricci and \(W^+\) estimates and prelimit
definiteness do not replace the exact Einstein/ASD
assumptions or the scalar normalization.
[Fine v2, §1.2](https://arxiv.org/html/1602.03829v2).

The arXiv history explicitly removes **v1 Corollary 6**
because its proof was false. I checked v1 §1.3, printed p. 5,
only to identify what was withdrawn. Its Question 5 was
about Einstein degeneration to an isolated
\(\mathbb C^2/\Gamma\) orbifold point with \(\Gamma\subset SU(2)\)
and a pointed nonflat ALE gravitational-instanton rescaling.
The proposed partial conclusion was a nonzero
\(\theta\in\Lambda^+_p\) with
\(\langle\mathsf A_p\theta,\theta\rangle=0\).
This quadratic-null-direction conclusion is weaker than a
nontrivial kernel, which was the question. Neither conclusion
from that deleted argument is used. Theorem 3 and Corollary 4
are present in the accepted v2. V2 Lemma 6 is a separate
comparison lemma, not the removed v1 Corollary 6.
[v1 PDF, §1.3](https://arxiv.org/pdf/1602.03829v1).
[arXiv version history](https://arxiv.org/abs/1602.03829).

## Comparison with the assessed branch estimates

The smooth E165 limit is Ricci-flat and ASD in the chosen
orientation. Thus its metric positive chiral connection
is flat, since \(\mathsf A=B=0\). The universal cover has a
parallel positive chiral frame. The corresponding parallel
orthogonal complex structures give the hyperkähler triple.
This verifies the target geometry required by Theorem 3.
The positive comparison embeddings in E165/E167, however,
supply strong \(W^{2,8}\) and \(C^{1,\alpha}\) for
\(0<\alpha<1/2\) in the \(p=8\) setting. They do not give
pointed \(C^2\). For the existing twistor identification
the first missing analytic estimate is uniform convergence
of the first derivatives of the pulled-back \(J_i\) on a
neighborhood of the candidate lifted sphere. The metric
estimates give uniform first-jet convergence and second-jet
control in \(L^8\). They do not supply the uniform
second-jet convergence used to get this \(C^1\) twistor
estimate. In particular the norm in Proposition 7 (5)
cannot be replaced by the supplied estimates in the
written proof.
[E165/E167 extraction assessment](E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md).
[Fine v2, Remark 5 and Proposition 7](https://arxiv.org/html/1602.03829v2).

Uniformly vanishing \(\operatorname{Ric}\) and \(W^+\) of the
rescaled metrics make \(\mathsf A\) and \(B\) tend to zero.
That supplies no strict relative comparison in (1). Under
constant positive rescaling, both operator blocks scale by
the same inverse metric factor in orthonormal Hodge
identifications. Thus (1) is scale invariant if known
before rescaling. The branch's given definite connection has
\(F_A=-S\sigma\) in native components. The metric twistor
construction instead uses the chiral Levi–Civita connection
\(\Gamma\) transported through \(\sigma\).
For \(b=A-\Gamma\),
\(F_A=F_\Gamma+d_\Gamma b+\tfrac12[b\wedge b]\).
The relative estimates bound the mismatch in terms of strain
and its derivative. Without the required smallness or a
direct metric curvature inequality, definiteness of \(F_A\)
does not verify (1) for the curvature of \(\Gamma\).
[E157–E159 geometric assessment](E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md).
[Fine v2, §2.1](https://arxiv.org/html/1602.03829v2).

In the unscaled native scalar-six normalization an explicit
sufficient hypothesis for the positive taming branch is
\[
    \|W^+\|_{\mathrm{op}}+\frac{|s-6|}{12}
                  +\|B\|_{\mathrm{op}}<\frac12
    \quad\text{pointwise}.
 \tag{2}
\]
The norms here are operator norms with ordinary orthonormal
two-forms. In fact
\[
 \langle\mathsf A\theta,\theta\rangle
 \ge \left(\frac12-\|W^+\|_{\mathrm{op}}
                   -\frac{|s-6|}{12}\right)|\theta|^2
 >\|B\|_{\mathrm{op}}|\theta|^2
 \ge |B\theta|\,|\theta| .
\]
Thus \(\mathsf A\) is positive and Fine's sign is \(J_+\).
In the branch's block conventions
\(\|B\|_{\mathrm{HS}}=|\operatorname{Ric}_0|/2\),
and each operator norm in (2) is at most its corresponding
Hilbert–Schmidt norm. For comparison, the left side of (2)
is at most \(\sqrt{7/3}\) times the native chiral quantity
\[
 \left(\|W^+\|_{\mathrm{HS}}^2
       +\tfrac14|\operatorname{Ric}_0|^2
       +\tfrac1{48}(s-6)^2\right)^{1/2}.
\]
This follows by Cauchy–Schwarz since the scalar factor
\(1/12\) is \(1/\sqrt3\) times \(1/\sqrt{48}\).
E159 gives a bounded value of that quantity and does not
supply the strict smallness in (2). Condition (2) applies to
the native original metrics. It is (1), not the scalar-six
form of (2), that is preserved by blow-up rescaling.

If metric taming, for example (2) on the unscaled
approximants, **and** pointed \(C^2\) convergence are supplied
in addition to the checked locally hyperkähler limit,
Theorem 3 applies at its stated holomorphic-sphere scope.
Neither additional premise is present in the current
bounded-reconstruction argument. The already assessed
E168/E169 result uses the smooth ALE core obstruction on the
homotopy-sphere topology. Its proof does not depend on this
twistor route. The packet supplies a comparison and the two
precise gaps, with no replacement argument or new analytic
estimate.
[E168/E169 assessment](E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md).
[Canonical R38 discovery](../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r38--fine-twistor-limit-comparison).

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E186 request v1](../research-progress/handoffs/SP4-CME-E186_REQUEST_v1.md) | 44469ab52e2089f468a69e0e3b75335dca6b7b3d9e7a061f2c2b5e701c41cd53 |
| [B91](../brainstorm/notes/B91_TWISTOR_BUBBLE_COMPARISON_20261122.md) | 568deca9a3c361c5cf760bf686beefe65fbb7fd4f61b14c2785792310e1cd203 |
| [E165/E167 assessment](E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md) | 2bbdb056d7a54440eccbf09ee65511252d71daa310f129a01718670aa08c8b63 |
| [E165](../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md) | 3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2 |
| [E157/E159 assessment](E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md) | b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52 |
| [E168/E169 assessment](E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) | 6dbf39d42f980e1d04eeeba60cfad575d16e1a13a91c5ffb7531bd77ead04d1f |
