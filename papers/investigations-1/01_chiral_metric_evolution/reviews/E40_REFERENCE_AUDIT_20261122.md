# SP4-CME-E40 — Reference audit for notes 21–39

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings unavailable. This audit checks the references consumed
by the 18 frozen notes numbered 21–39, the shared catalog and bibliography,
and the branch guide. All 23 frozen input hashes matched before the
lead was told that canonical editing could resume. This audit records
that historical state. I previously wrote E26, E28 and E31 and
audited E29's integration in E33. The direct source checks here
are selective. The [request][req] and [return][ret] identify scope
and artifacts. [Reference workflow][workflow].

## Coverage and canonical destinations

The direct technical source set is Fine, Ludewig, Taylor's 1991
monograph as available in the undated author-hosted file,
Chang–Gursky–Yang, and Koch–Lamm. Taylor's distinct 2011 chapter
appears as a metadata-only pointer from Fine's reference. E31 inherits
the signature normalization through E13 and the E01 foundation
audit, which already points from the catalog to the inspected
signature sources. Notes E21, E23–E25, E32, E35 and E38–E39
derive their estimates or take input from branch notes. Mentions of
the Fine flow or the conformal-class Yamabe quotient in those notes
do not introduce a new external theorem. E33 is a review.

The frozen [shared bibliography][bib] has 40 unique case-folded
keys, 24 DOI fields and 12 arXiv eprint fields, with no duplicates
in any of the three sets. Four direct sources have unique keys
`Fine2011`, `Ludewig2019`, `Taylor1991Nonlinear` and
`ChangGurskyYang2003`. Add one `KochLamm2015` article entry with
the inspected arXiv version in its note. The unread 2011 Taylor
chapter may be recorded as a separate metadata pointer within the
existing Taylor annotation. If it receives a bibliography entry,
use a distinct chapter key and retain the metadata-only status.
The bibliography needs no second key for the same Koch–Lamm work
or for the author-hosted version of the 1991 Taylor work.

In [root references/README.md][catalog], add a short broad-run
source pointer to the existing [special-case source record][special]
with the four application groups (gauge, heat, recognition and
rough-data comparison). In the [branch reference guide][branch],
add a corresponding pointer with consuming note and manuscript
anchors. Keep the exact passage, hypotheses, version and access
annotations in the existing shared record. The older inspections and
version records should stay linked and dated there. The primary
links in the consuming notes already provide point-of-dependence
citation, with the E22 link availability exception below.

## Fine v2 — extend the dated consumer record

Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein
equations*, arXiv:1111.5005v2, revised 29 November 2011 after the
21 November 2011 v1. The preprint identity in `Fine2011` and
R15 is correct. The arXiv record and author's publication list
were rechecked in this run. Preserve the 21 November 2026
background inspection and the 22 November 2026 reinspection entries.
The latter are selected HTML and PDF passages. The existing
author-list check identifies this version as a preprint and does
not identify a separate journal version. [Version record][fineabs] ·
[Author's publication list][fineauthor] · [Background record][background].

In the shared source record's Fine section, add the existing E26–E30,
E34 and E36 uses and the manuscript's `subsec:fixed-adjoint`.
Definitions 1.3–1.4 and Proposition 4.2 supply the definite
reconstruction and physical gradient. Section 3.1 (3.2) and
§4.2 Proposition 4.5 (4.5)–(4.7) supply the \(Q\) linearization
and physical symbol. Lemma 3.2, (3.4), Lemmas 3.3/3.5, and
Lemmas 4.6/4.9 supply the infinitesimal automorphism action and
exact-sequence algebra. The printed adjusted equation (4.2),
Theorem 4.10, Lemma 4.4 and (4.3), (4.4), (4.8) are the
comparison source for E26–E28. Fine's Theorem 4.3 starts with
a smooth definite \(A_0\) in the compact setting. Section 4.3,
Theorems 4.11/4.13 and (4.9) concern a fixed perfect reference
and sufficiently small given \(L^2_k\) distance with integer
\(k\ge3\). Keep the native negative Killing pairing, reconstructed
metric and clock distinct from the manuscript comparison.
The fixed vertical adjoint and independent curvature completion
are branch derivations. [Fine v2, §§3–4][fine] · [E26][e26] ·
[E27][e27] · [E28][e28].

The existing ignored reading copy
`references/1111.5005v2.pdf` measures 447930 bytes and has SHA-256
`d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8`.
These values match the historical background record. Record the
versioned arXiv PDF as the primary access link and leave the
date and transfer URL for acquisition of the existing local copy
unknown. The 2026 passage inspection dates are known and separate.
There is no new local copy from E40. [Fine versioned PDF][finepdf] ·
[Historical reading-copy table][background].

## Ludewig — final issue, checked passages and working access link

Matthias Ludewig, *Strong short-time asymptotics and convolution
approximation of the heat kernel*, *Annals of Global Analysis and
Geometry* **55**(2), 371–394 (2019). The publisher identifies
22 September 2018 as online publication and version-of-record date,
and 4 March 2019 as the issue date. DOI `10.1007/s10455-018-9630-4`.
Keep year 2019 in `Ludewig2019` and add issue 2. The two dates
belong in the shared annotation. [Publisher metadata][ludpub] ·
[Volume 55, issue 2][ludissue].

Extend the existing Ludewig paragraph in the shared source record.
E22's contemporaneous return records a published-PDF selected-passage
check on 22 November 2026. This audit reopened the publisher's final
PDF. Theorem 1.1, printed p. 372, applies to Laplace-type bundle
operators on compact Riemannian \(M\), on any fixed compact subset
off the cut locus and for \(0<t\le T\). It controls differentiated
Gaussian quotients using metric connections in the two slots.
Section 2, pp. 374–375, fixes the operator and adjoint conventions.
Theorem 3.5, p. 382, assumes formal self-adjointness and gives a
global Gaussian estimate with prefactor \(t^{-(n+2j+m+l+1)}\)
for derivative orders \((j,m,l)\). E22 uses the sharper local result
near the round diagonal and absorbs the global prefactor loss with
the fixed positive distance in the other region. This is a fixed
round-bundle application. [Publisher PDF][ludpdf] · [E22][e22] ·
[E22 source return][e22ret].

The Max Planck copy linked in E22 returned HTTP 403 on this
recheck. Add the working publisher PDF link in the canonical
record and use it as the preferred link if E22's source pointer
is updated, preserving the original one as access provenance.
This source is remote-only in the scoped repository locations.
[E22's original access link][ludmpg] · [Publisher PDF][ludpdf].

## Taylor — distinguish the publication and the undated host file

Michael E. Taylor, *Pseudodifferential Operators and Nonlinear
PDE*, Birkhäuser Boston, Progress in Mathematics **100**, first
edition 1991, DOI `10.1007/978-1-4612-0431-2`. The publisher gives
1 November 1991 for the softcover and 6 December 2012 for the
publisher eBook. The inspected remote file `NLIN.pdf` identifies
the same title and author. The cover, contents and author
bibliographic listing give no revision date or edition number for
that file. It has different pagination from the publisher record.
Chapter 7 starts at printed p. 141 in `NLIN.pdf`, while the
publisher places the chapter at pp. 146–162. Label the checked
source “undated author-hosted version of the 1991 monograph,
inspected 22 November 2026.” The URL directory and publication
dates do not date this version. In `Taylor1991Nonlinear`, keep the
publisher year, add series, volume and DOI, and identify the
undated author file as the passage source. [Publisher book record][taypub] ·
[Author book listing][tayauthor] · [Inspected remote file][taypdf].

Update the existing “Local parabolic primary input” section in the
shared source record. The exact printed pages in `NLIN.pdf` are
147 for (7.3.1)–(7.3.2), and 149 for Proposition 7.3.A,
(7.3.18) and Proposition 7.3.B. The first equation allows
smooth time-dependent real vector systems. The condition is
uniform positivity of the negative Hermitian part of the
Fourier principal symbol. Proposition 7.3.A uses \(H^s\)
initial data with \(s>n/2+2\). Proposition 7.3.B uses
the first-jet quasilinear case with \(s>n/2+1\)
and persistence under the stated \(C^{1+r}\) bound.
Section 7.1 starts on a torus. E29 also names the supporting
composition estimate (3.1.20), Proposition 3.6.A, Corollary
4.3.C and (7.1.3)–(7.1.15). E29 supplies the smooth-data
compact-bundle argument for the manuscript's `subsec:fixed-adjoint`.
Its proof and assumptions are separate from the quoted vector
system statement. E29, lead and E33 checked selected passages
on 22 November 2026. The new inspection concerns the version
identification and source metadata. All these are remote readings.
[Chapter 7 in the host file][taychap] · [E29][e29] · [E33][e33].

Fine's bibliography [31] names *Partial Differential Equations
III: Nonlinear Equations*, 2nd ed., Springer, Applied Mathematical
Sciences **117** (2011). The publisher places Chapter 15,
*Nonlinear Parabolic Equations*, at pp. 313–411, DOI
`10.1007/978-1-4419-7049-7_3`, with first online date
27 October 2010. Fine §4.2 cites Proposition 8.1 from that
chapter. E29 did not verify the proposition or its page in the
subscription edition. The publisher metadata and author chapter
listing are accessible. Preserve that access limitation and the
distinct bibliographic identity in the source record.
[Fine v2, §4.2 and reference 31][fine] · [Chapter metadata][tay2011].

## Chang–Gursky–Yang — add the finite-time criterion consumer

Sun-Yung A. Chang, Matthew J. Gursky and Paul C. Yang,
*A conformally invariant sphere theorem in four dimensions*,
*Publications Mathématiques de l'IHÉS* **98**, 105–143 (2003),
DOI `10.1007/s10240-003-0017-z`. The existing bibliography entry
and the special-case annotation are correct. Retain E13's dated
record. Add the 22 November 2026 selected-passage reinspections in
E31 and E33 and consuming manuscript `subsec:finite-time-sphere`.
The published PDF, printed p. 107, Theorem A, (0.3), and
Remarks 1–2 require a smooth closed four-manifold, positive
Yamabe constant of the given conformal class and strictly
\(\int |W|_{\rm tensor}^2\,dV_g<16\pi^2\chi\). The four-index
squared norm is four times the curvature-operator squared
Hilbert–Schmidt norm. The source gives \(S^4\) or
\(\mathbb{RP}^4\) up to diffeomorphism. E31 adds the homotopy
sphere and supplied transport and Sobolev bounds, with simple
connectivity selecting \(S^4\). E32 supplies the selected slice
for the manuscript use. E35 gives a separate Yamabe-only estimate.
The published PDF reading is remote-only.
[Published p. 107][cgypdf] · [E31][e31] · [E33][e33].

## Koch–Lamm — add the missing shared record

Herbert Koch and Tobias Lamm, *Parabolic equations with rough data*,
*Mathematica Bohemica* **140**(4), 457–477 (2015), DOI
`10.21136/MB.2015.144463`. Add `KochLamm2015` with this final
metadata and a note identifying the inspected
arXiv:1310.3658v1, 14 October 2013, primary class `math.AP`.
The Czech Digital Mathematics Library record gives the journal
details and the arXiv history and PDF title page confirm v1.
The published PDF timed out during E37 and the corresponding
mirror did not provide it. This audit verified the official
publication metadata and reopened selected passages in v1.
Keep “published text uninspected” and preserve v1 pagination.
Both the 22 November 2026 E37 and E40 inspections are remote,
without a retained local file or hash.
[Publication record][klpub] · [arXiv v1 metadata][klabs] · [Preprint PDF][klpdf].

In the canonical shared annotation, point to E37 and identify
Theorem 1.1, preprint pp. 2–3, §§2–3, pp. 4–7,
§§4.1–4.2, pp. 7–8, and Theorem 5.3, p. 12.
Theorem 1.1 treats a scalar divergence-form equation on
\(\mathbb R^d\), with bounded elliptic continuous coefficients,
controlled coefficient and forcing derivatives, small oscillation
on the parabolic scale \(\sqrt T\), Lipschitz value dependence,
and the stated growth and scaled smallness of the source.
The uniqueness identified in §3 uses the small weighted gradient
class, while §2 builds the contraction with local space-time
gradient norms. The systems discussion requires Gaussian and
Calderón–Zygmund estimates. Equations (4.1)–(4.2) distinguish
integral coercivity from a rank-one symbol condition under uniform
continuity. Theorem 5.3 treats Ricci–DeTurck on a uniform \(C^1\)
Riemannian manifold with uniformly continuous metric data, a
uniform \(C^3\) atlas, and a fixed \(C^2\) comparison metric
with bounded second derivatives. Its principal part acts
as a scalar on tensor fibers. This supplies an operator comparison
in E37 and isolates the estimates needed for the separate
strongly coupled compact-bundle construction. It does not
upgrade that construction to a rough-data theorem.
[E37][e37] · [Koch–Lamm v1, pp. 2–8 and 12][klpdf].

The local reading-copy search included ignored files in the
repository reference directories. Apart from the already recorded
Fine copy, no scoped source had an identified local reading copy.
No new PDFs were retained. The review leaves scientific proof
status unchanged.

[req]: ../research-progress/handoffs/SP4-CME-E40_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E40_RETURN_v1.md
[workflow]: ../../../../REFERENCE_WORKFLOW.md
[catalog]: ../../../../references/README.md
[bib]: ../../../../references/references.bib
[background]: ../../../../references/SOURCE_NOTES_CME_BACKGROUND_20261121.md
[special]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
[branch]: ../references/README.md
[e22]: ../notes/22_ROUND_LORENTZ_HEAT_20261122.md
[e22ret]: ../research-progress/handoffs/SP4-CME-E22_RETURN_v1.md
[e26]: ../notes/26_FINE_GAUGE_ENDPOINT_GAP_20261122.md
[e27]: ../notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[e28]: ../notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e29]: ../notes/29_LOCAL_PARABOLIC_INPUT_20261122.md
[e31]: ../notes/31_L2_TRANSPORT_SPHERE_CRITERION_20261122.md
[e33]: E33_INTEGRATION_AUDIT_20261122.md
[e37]: ../notes/37_ROUGH_DATA_SOURCE_TEST_20261122.md
[fineabs]: https://arxiv.org/abs/1111.5005v2
[fine]: https://arxiv.org/html/1111.5005v2#S4
[finepdf]: https://arxiv.org/pdf/1111.5005v2
[fineauthor]: https://joel.fine.web.ulb.be/papers.html
[ludpub]: https://link.springer.com/article/10.1007/s10455-018-9630-4
[ludissue]: https://link.springer.com/journal/10455/volumes-and-issues/55-2
[ludpdf]: https://link.springer.com/content/pdf/10.1007/s10455-018-9630-4.pdf
[ludmpg]: https://pure.mpg.de/rest/items/item_3086319_4/component/file_3135346/content
[taypub]: https://link.springer.com/book/10.1007/978-1-4612-0431-2
[tayauthor]: https://mtaylor.web.unc.edu/books-and-monographs/
[taypdf]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
[taychap]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf#page=147
[tay2011]: https://link.springer.com/chapter/10.1007/978-1-4419-7049-7_3
[cgypdf]: https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3
[klpub]: https://dml.cz/handle/10338.dmlcz/144463
[klabs]: https://arxiv.org/abs/1310.3658v1
[klpdf]: https://arxiv.org/pdf/1310.3658v1
