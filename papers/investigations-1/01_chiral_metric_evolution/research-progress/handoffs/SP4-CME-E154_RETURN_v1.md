# SP4-CME-E154 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime and selected
lead identifiers were unavailable. Inherited overlap includes
my E137 derivation and E147 audit. [Request][req] ·
[Metric source check][audit] · [B77][b77].

## Result

**Primary author statement and proof sketch verified for B77's
fixed base.** In Anderson's author-hosted *Cheeger-Gromov theory
and applications to general relativity*, Definition 1.1 (p. 2)
and Theorem 2.2 with (2.3) and proof sketch (§2, pp. 4–6
in the inspected version) give precompactness of Riemannian
metrics on one fixed smooth closed \(n\)-manifold with
\(|\operatorname{Ric}|_g\le k\), \(\operatorname{inj}\ge i_0>0\),
and \(\operatorname{diam}\le D\). On \(n=4\), for any
fixed \(0<\alpha<1\) they give a positive \(C^{1,\alpha}\)
limit after diffeomorphisms on that base. The theorem also
gives weak \(W^{2,p}\) convergence for finite \(p\).
It assumes a two-sided norm bound on Ricci and no full
curvature, Weyl, Einstein, or separate volume assumption.
The \(C^{1,\alpha}\) norm is on the normalized metrics.
The proof uses a uniform harmonic radius and the rescaled
Ricci-flat splitting argument. [Author text][cargese].

The normalizers are called diffeomorphisms in Definition 1.1,
interpreted in the smooth category of the fixed smooth
base. The result supplies no uniform derivative estimate
for them in unrelated auxiliary geometry. The review
distinguishes an optional per-map smooth approximation if
starting with \(C^{2,\beta}\) maps, \(\beta>\alpha\).
Orientation preservation follows separately by selecting
one common sign and, for the fixed oriented base if it is
negative, precomposing with the inverse of one fixed
reversing normalization from the subsequence. This preserves
convergence up to one fixed smooth pullback. The result
also applies to varying presentation of one known smooth
type by first pulling back to a common base. It does not
verify the unrestricted varying-smooth-type assertion.

## Primary sources and access

- **R28.** Michael T. Anderson, *Convergence and rigidity of
  manifolds under Ricci curvature bounds*, *Inventiones
  mathematicae* **102** (December 1990), 429–445,
  DOI 10.1007/BF01233434. Publisher metadata verified
  on 22 November 2026. Original theorem and proof pages
  remain uninspected. The DOI route gave a redirect failure,
  the direct publisher page was subscription preview, and
  the GDZ public catalogue record did not yield readable
  article pages through the available tools.
  [Springer][springer] · [Göttingen archive record][gdz].
- **R29.** Michael T. Anderson, *Cheeger-Gromov theory and
  applications to general relativity*. Anderson lists it in
  P. T. Chruściel and H. Friedrich (eds.), *The Einstein
  Equations and the Large Scale Behavior of Gravitational
  Fields*, Birkhäuser, Basel (2004), pp. 347–377.
  Checked the undated author-hosted version on 22 November
  2026, especially Definition 1.1, Theorem 2.2 and its
  proof, (2.1)–(2.9), Theorem 2.3 and Remark 2.4.
  The chapter's DOI and final proof pagination were
  not independently verified. This is an author proof
  sketch for the fixed-base result and is kept separate
  from the uninspected 1990 paper. [Author text][cargese]
  · [Author publication index][author].
- **1989 comparator.** Michael T. Anderson, *Ricci curvature
  bounds and Einstein metrics on compact manifolds*,
  *Journal of the American Mathematical Society* **2**(3)
  (July 1989), 455–490. Checked the published scan in
  Stony Brook's public course file on 22 November 2026,
  pp. 455–457, including Theorems A and A′. Their different
  assumptions include integral control of \(D^2\operatorname{Ric}\),
  a loop length and volume lower bound, diameter upper
  bound, and a Betti or full curvature integral bound.
  They do not provide the three-bound theorem. DOI not
  independently verified. [Primary published scan][jams].

All three discoveries were reported to the lead. No local
PDF was retained. The six exact search strings and
more detailed access failures are in the audit. There
was no source import from an inaccessible theorem.
The unrestricted varying-type input remains conditional
on an exact theorem or a separate smooth finiteness
argument. The checked fixed-base input already fits B77.
The separate construction of smooth bundle-compatible
maps and convergence of connection/curvature values to a
positive compatible pair remains for the later packet.
No connection compactness or continuation corollary is
claimed here. [Canonical records][canon] · [B77][b77].

## Frozen identities

All five frozen inputs matched, as did the request.
Only the two assigned E154 files were written.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E154_REQUEST_v1.md | `39aa1918321c84934d68964ddd99bad3334cd9773a8a01d5f5e24af6f172e369` |
| B77_GEOMETRIC_SEQUENCE_COMPACTNESS_20261122.md | `401fcd08d8f704f5e94aacd60ef60e330c5a075b093836613819386a63acf037` |
| E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md | `6c9480a6dfaedbff17156541faa9c350e61bcf7925d5ae4cec88e8a7d93d4557` |
| E145_E147_REAL_CONTINUATION_ASSESSMENT_20261122.md | `a891f7d4ac95406b0ca065e34df1eb848c384296917d620f7376cff943448675` |
| 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| 137_REAL_COMPARISON_TIME_CONTROL_20261122.md | `8b2622b44a5a46106f28f67e2a37b2e1a129d238281a7be1f811498a48d95193` |
| E154_RICCI_COMPACTNESS_SOURCE_CHECK_20261122.md | `fc77960efb3cfbc5e4d22691ec2c145c4b0b445fe59f8828c045c2f88e0ed133` |

[req]: SP4-CME-E154_REQUEST_v1.md
[audit]: ../../reviews/E154_RICCI_COMPACTNESS_SOURCE_CHECK_20261122.md
[b77]: ../../brainstorm/notes/B77_GEOMETRIC_SEQUENCE_COMPACTNESS_20261122.md
[canon]: ../../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md
[springer]: https://link.springer.com/article/10.1007/BF01233434
[gdz]: https://gdz.sub.uni-goettingen.de/id/PPN356556735_0102?tify=%7B%22view%22%3A%22info%22%2C%22pages%22%3A%5B435%5D%7D
[cargese]: https://www.math.stonybrook.edu/~anderson/cargese.pdf
[author]: https://www.math.stonybrook.edu/~anderson/papers.html
[jams]: https://www.math.stonybrook.edu/Courses/MAT683/201001/MAT683S10.pdf
