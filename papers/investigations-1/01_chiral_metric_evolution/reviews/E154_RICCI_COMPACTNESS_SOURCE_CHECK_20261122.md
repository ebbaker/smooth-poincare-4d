# E154 — Primary check of compactness under Ricci bounds

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol`
/ `ultra`. Independent runtime and selected lead identifiers were
unavailable. I authored E137 and audited E145 in E147, both upstream
of the supplied project context. This packet checks only the metric
compactness source. [Request][req] · [B77][b77].

## Disposition

**The metric input is supported on one fixed smooth closed
manifold.** Anderson's later author text states and sketches the
proof of the exact Ricci–injectivity–diameter theorem in that
setting. It gives a positive metric limit in \(C^{1,\alpha}\)
for any fixed \(0<\alpha<1\), using diffeomorphisms in its
definition of convergence. This is the setup for the B77 slices
on the same base. The 1990 journal article's contents were not
reached. The assertion for an arbitrary sequence of varying
smooth types is therefore left conditional on an exact
varying-manifold theorem or an independently supplied
finiteness statement. [Author text, Definition 1.1 and
Theorem 2.2][cargese] · [B77][b77].

## Discovery and access

Michael T. Anderson, *Convergence and rigidity of manifolds under
Ricci curvature bounds*, *Inventiones mathematicae* **102**
(December 1990), 429–445, DOI 10.1007/BF01233434. Publisher
search indexing on 22 November 2026 exposed this bibliographic
record and indicated subscription access. The direct DOI open
redirected to an inaccessible Springer route (tool HTTP 500).
At discovery this is metadata only. The theorem will be credited
only if its primary text is reached.
[Publisher DOI][andersondoi].

The direct Springer article page loads as a subscription preview.
The publisher PDF route redirects to that same page. The
Göttingen Digitalisierungszentrum index identifies the article
as GDZPPN002108003, at scan page 435 (printed p. 429) of the
digitized volume. Its viewer exposed catalogue metadata but no
legible article text in the web tool. The public resolver,
METS, PDF and IIIF routes attempted did not deliver the scan;
shell access could not resolve the archive hostname. No browser
provider was available, and the native browser fallback returned
that Computer Use permissions were not granted. The Stony Brook
course file contains citations to the 1990 result, with the
1989 article scanned separately. I did not use a secondary
citation as evidence for the original 1990 statement. The
publisher metadata and institutional catalogue record are
verified, while the theorem, page locator, precise smooth
category and proof of that article remain uninspected.
[Springer metadata][springer] · [Göttingen catalogue][gdz] ·
[Canonical discovery record][canon].

Anderson's author-hosted *Cheeger-Gromov theory and applications
to general relativity* was reached on 22 November 2026. The
undated author PDF gives Theorem 2.2 (Convergence I) and a proof
sketch under the same three metric bounds. At this point its
statement is on a fixed closed \(n\)-manifold. Anderson's author
index lists the chapter in P. T. Chruściel and H. Friedrich (eds.),
*The Einstein Equations and the Large Scale Behavior of
Gravitational Fields*, Birkhäuser, Basel (2004), pp. 347–377.
The chapter DOI and edition crosswalk for the author PDF have
not yet been verified. This is an author proof sketch and
restatement of his own 1990 result, with separate inspection
status from the original article.
[Author PDF][cargese] · [Author index][author].

The third work encountered was Michael T. Anderson, *Ricci
curvature bounds and Einstein metrics on compact manifolds*,
*Journal of the American Mathematical Society* **2**(3)
(July 1989), 455–490. The published-paper scan is embedded in
the public Stony Brook course reading file. Checked the cover,
journal pp. 455–457 and Theorems A and A′ on 22 November 2026.
They address different compactness hypotheses and do not
supply the requested three-bound theorem. Record this as a
nonmatching comparator. DOI not independently verified.
[Stony Brook primary scan][jams] · [JSTOR SICI on the scan cover][jamsid].

## The exact checked fixed-base theorem

In the undated author PDF, §1 Definition 1.1 (printed p. 2)
defines convergence of metrics on \(M_i\) to a metric on \(M\)
by diffeomorphisms \(F_i:M\to M_i\), with convergence of
the components of \(F_i^*g_i\) in the fixed charts of \(M\).
It describes the analogous definitions for Hölder and weak
Sobolev topologies. Theorem 2.2 (Convergence I) in §2
(printed pp. 4–6 including its sketch), (2.3), states its
hypothesis for metrics on
a **fixed closed** \(n\)-manifold. For fixed constants
\(k<\infty\), \(i_0>0\), \(D<\infty\), the bounds are
\[
 |\operatorname{Ric}_{g_i}|_{g_i}\le k,\qquad
 \operatorname{inj}(M,g_i)\ge i_0,\qquad
 \operatorname{diam}(M,g_i)\le D .
\]
The family is precompact, modulo the diffeomorphisms in
Definition 1.1, in \(C^{1,\alpha}\) for each \(0<\alpha<1\)
and also in weak \(L^{2,p}\) for finite \(p\), where the
author's \(L^{2,p}\) denotes \(W^{2,p}\). The argument
is Riemannian and works at the fixed dimension \(n=4\)
required here. The Ricci hypothesis bounds the absolute
Ricci tensor in the live metric and so supplies both
sides. There is no input on the full curvature tensor,
either Weyl block, derivatives of Ricci, Einstein property
or an extra volume bound. No topological finiteness result
is needed on the already fixed smooth \(M\).
[Author text, §§1–2, pp. 2, 4–6][cargese].

The proof sketch immediately beneath Theorem 2.2 uses
uniform positive harmonic radius. Definition 2.1, (2.1)
and (2.2) supply fixed local positive comparability with
the Euclidean metric and a scale-invariant \(W^{2,p}\)
bound. If the least harmonic radius tended to zero,
rescaling at its minimum would give a pointed complete
limit with the injectivity radii of the rescaled sequence
tending to infinity and the rescaled Ricci tensors tending
to zero. In the author's norm convention the exact
scale of the norm at \(r_i^{-2}g_i\) is \(r_i^2\) times
its old value. The estimate tending to zero in (2.7)
is enough for the argument. The limit is weakly Ricci-flat
and its Ricci equation gives extra regularity in harmonic
coordinates. The long lines in every direction and splitting
give Euclidean space. In this blow-up argument, the strong
convergence of the rescaled Ricci tensors upgrades the
rescaled metric convergence by the harmonic-coordinate
elliptic equation (2.9), contradicting the normalized
harmonic radius one. The proof uses this strong
\(W^{2,p}\) step on the rescaled sequence. The compactness
statement for the given metrics uses **weak** \(W^{2,p}\)
and strong \(C^{1,\alpha}\). Taking \(p>n/(1-\alpha)\)
leaves a strict Sobolev exponent margin to obtain strong
convergence at the desired \(\alpha\). Remark 2.4(ii)
separately describes the extra regularity available with
stronger hypotheses, such as an Einstein equation.
[Author text, (2.1)–(2.9) and Remark 2.4, pp. 4–7][cargese].

This proof supplies a positive limit. The harmonic charts
have uniform two-sided metric comparability, and Theorem
2.2 specifies a Riemannian limit. In any fixed smooth
comparison metric \(g_b\) on the compact base, continuity
and positivity of \(g_\infty\), together with the uniform
component convergence, give
\[
 c g_b\le F_i^*g_i\le C g_b
\]
for all sufficiently large indices, with \(c>0\).
Theorems 2.2 and 2.3 have different input lists.
Theorem 2.3 on four-manifolds uses a lower 1-cross
bound and volume lower bound in place of the
injectivity-radius assumption. The author does not
require either extra premise in (2.3). The
volume-only variant displayed in (2.11) is discussed
in dimension three. None is needed for the fixed-base
application here. [Author text, Theorems 2.2–2.3
and Remark 2.4][cargese].

## Normalizing maps and the orientation refinement

On the fixed smooth manifold, Definition 1.1 uses
diffeomorphisms, interpreted in the smooth category
of this metric statement. The limit metric is
\(C^{1,\alpha}\) on that smooth manifold. The theorem
does not assert a uniform derivative bound for these
diffeomorphisms or their inverses relative to an
arbitrary fixed auxiliary geometry. It also does not
state convergence or isotopy of the normalizers. The
discussion of harmonic-chart transition regularity
in the proof is separate from the metric regularity
claimed in the conclusion.
[Author text, Definition 1.1 and pp. 4–6][cargese].

For clarity, an alternative formulation that produced
only \(C^{2,\beta}\) diffeomorphisms between smooth
manifolds for some \(\alpha<\beta<1\) would still
suffice for smooth maps. This is an elementary
per-map refinement, not a claim about the maps
in the uninspected 1990 article. Approximate each such
diffeomorphism in \(C^{2,\alpha}\) by smooth maps
in a finite cover, using a smooth embedding and
tubular projection to keep the target. Sufficient
\(C^1\) closeness to a diffeomorphism on a compact
manifold keeps it a diffeomorphism. For each fixed
smooth \(g_i\), the local pullback product and chain
rules are continuous in that \(C^{2,\alpha}\) norm
into \(C^{1,\alpha}\). The error may therefore be
chosen \(<1/i\) in the pulled-back metric norm.
The needed closeness is allowed to depend on \(i\)
and no common bound is inferred. This observation
is unnecessary when one uses Definition 1.1 directly
in the ordinary smooth category.

Orientation is an independent elementary refinement.
On a connected oriented base, pass to a subsequence
with one Jacobian sign. If the limit orientation is
free, orient the limit so those signs are positive.
On the fixed oriented \(M\) of B77, if all remaining
\(F_i:M\to M\) reverse orientation, one of those maps
\(F_{i_0}\) provides a fixed reversing diffeomorphism.
Replace \(F_i\) by \(F_i\circ F_{i_0}^{-1}\).
Then the maps preserve the given orientation and
the normalized metrics converge to
\((F_{i_0}^{-1})^*g_\infty\) in the same topology.
There is no need to assume the existence of an
orientation-reversing map independently. If working
componentwise on a fixed disconnected compact base,
there are finitely many pullback orientation patterns,
so the same conclusion follows after selecting a
common pattern. For a varying sequence already known
to contain a subsequence of one smooth diffeomorphism
type, first pull back to a common smooth \(M\) and
then apply the checked fixed-base theorem. Theorem
2.2 as stated does not supply that topological
finiteness deduction.

## Nonmatching 1989 theorem and bundle boundary

Theorem A on pp. 456–457 of the 1989 JAMS scan is
genuine \(C^{1,\alpha}\)-compactness in its Lipschitz
topology for a class of compact four-dimensional
Riemannian manifolds. It assumes bounded \(|\operatorname{Ric}|\),
scale-weighted local \(L^{q/2}\) control of \(D^2\operatorname{Ric}\)
for \(q>4\), a lower bound on the shortest null-homotopic
nontrivial geodesic loop, a volume lower bound, a diameter
upper bound and a bound on \(\dim H_2(M;\mathbb R)\).
Theorem A′ uses the corresponding \(n\)-dimensional
conditions with an integral bound on full curvature
instead of the Betti bound and notes its odd-dimensional
qualification. These are different hypotheses and do
not verify the B77 three-bound input. No 1989 theorem
is imported. [Stony Brook primary scan, journal pp. 456–457][jams].

For B77, the usable conclusion is metric convergence
on the same smooth compact oriented base, with
orientation-preserving smooth normalizations and a
positive \(C^{1,\alpha}\) limit. It does not construct
automorphisms of the fixed \(SO(3)\) bundle covering
those normalizations. A later proof must establish
appropriate smooth bundle identifications or lifts,
and convergence of the independent connection and
curvature values to a positive distributionally
compatible pair in one fixed bundle background.
The metric theorem alone supplies none of that
compatibility or the continuation hypothesis for
a supplied connection trajectory. This packet stops
before the bundle step. [B77][b77] ·
[Sequential continuation assessment][seq].

## Bounded search record

Six distinct web searches were issued:

~~~text
Michael T Anderson Convergence and rigidity of manifolds under Ricci curvature bounds 1990 Theorem C 1 alpha inj diameter Inventiones DOI PDF
"Convergence and rigidity of manifolds under Ricci curvature bounds" Anderson pdf Theorem 2.2
site:eudml.org "Convergence and rigidity of manifolds under Ricci curvature bounds"
site:gdz.sub.uni-goettingen.de "Convergence and rigidity of manifolds under Ricci curvature bounds"
"Convergence and rigidity of manifolds under Ricci curvature bounds" Anderson 429 filetype:pdf
Anderson "GDZPPN002108003" "Convergence and rigidity" PDF digital Göttingen
~~~

The three works in scope were the 1990 article
(metadata only), the author-hosted 2004 chapter
version (checked passages and proof sketch), and the
published 1989 scan (checked comparator passages).
No PDF was retained locally. The DOI and final
published pagination for the specific author
chapter proof were not independently verified.
No shared records were edited by this helper.
[Return][return] · [Canonical source records][canon].

[req]: ../research-progress/handoffs/SP4-CME-E154_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E154_RETURN_v1.md
[b77]: ../brainstorm/notes/B77_GEOMETRIC_SEQUENCE_COMPACTNESS_20261122.md
[seq]: E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md
[canon]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md
[andersondoi]: https://doi.org/10.1007/BF01233434
[springer]: https://link.springer.com/article/10.1007/BF01233434
[gdz]: https://gdz.sub.uni-goettingen.de/id/PPN356556735_0102?tify=%7B%22view%22%3A%22info%22%2C%22pages%22%3A%5B435%5D%7D
[cargese]: https://www.math.stonybrook.edu/~anderson/cargese.pdf
[author]: https://www.math.stonybrook.edu/~anderson/papers.html
[jams]: https://www.math.stonybrook.edu/Courses/MAT683/201001/MAT683S10.pdf
[jamsid]: https://links.jstor.org/sici?sici=0894-0347%28198907%292%3A3%3C455%3ARCBAEM%3E2.0.CO%3B2-Q
