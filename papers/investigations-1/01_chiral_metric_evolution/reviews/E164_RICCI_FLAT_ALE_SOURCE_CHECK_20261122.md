# E164 Ricci-flat ALE theorem source check

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Bounded E work under B84. Configured helper
gpt-6.2-sol/ultra. Independent runtime and lead-model attestation unavailable.
I authored the inherited E160 and E163 source checks, and did not author B84
or the E154 assessment. This packet checks one primary theorem.

## Primary version and inspection

Shigetoshi Bando, Atsushi Kasue and Hiraku Nakajima, *On a construction of
coordinates at infinity on manifolds with fast curvature decay and maximal
volume growth*, Inventiones mathematicae **97**(2), 313–349, June 1989,
DOI 10.1007/BF01389045. The inspected text is the indexed published journal
scan in the Stony Brook Math 683 course compilation. The Springer article
page supplies publisher metadata, including the title, authors, date and
313–349 span. Use that span when citing the article. The compilation's
Göttingen cover and GEODESIC catalog give an ending page of 350. The
compilation also holds the distinct R30 work. The BKN opening imprint,
running title and journal pagination identify the inspected article within
it. [Publisher record](https://link.springer.com/article/10.1007/BF01389045).
[Published scan](https://www.math.stonybrook.edu/Courses/MAT683/201001/MAT683S10.pdf).
[GEODESIC record](https://geodesic.mathdoc.fr/item/IM_1989__97_2_143705/).

| Passage | Printed journal pages | Indexed compilation lines |
| --- | --- | --- |
| Definition, Theorems (1.1) and (1.5), Remark (1.8) | 313–315 | 10709–10789 |
| Section 3, Case 2 and order improvement from curvature decay in Case 4 | 326–331 | 11288–11319, 11410–11528 |
| Section 4 analytic setup and proof dependencies | 331–335 | 11530–11577, 11682–11762 |
| Proof conclusion for Theorem (1.5) | 335 | 11763–11774 |
| Theorem (5.1) and the distinct Einstein sequence theorem (5.5) | 335–336 | 11775–11833 |

The printed pages 313, 314, 315 and 335 occur 0, 1, 2 and 22 pages,
respectively, after the first BKN journal page. The absolute page indices
within the compilation could not be verified. Its indexed text service
opens the passages above, while the fresh PDF and screenshot routes
reject the approximately 30 MB compilation. The direct Springer
PDF route led to the article preview. The alternate archive routes
did not yield another readable copy. No local source bytes were retained.
This packet used four discovery/metadata queries and inspected one new
primary work. Discovery was reported for
[canonical R37 registration](../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r37--bando-kasue-nakajima-ale-source).

## Exact four-dimensional implication

In the smooth complete Riemannian setting defined on p. 313, let
\((N^4,h)\) be connected and Ricci-flat. Theorem (1.5), p. 314, uses
the volume and curvature assumptions (1.6) and (1.7)
\[
 \operatorname{Vol}_{h} B_h(o,t)\ge Vt^4
       \quad(t>0), \qquad
 \int_N |\operatorname{Rm}_{h}|_h^2\,dV_h<\infty
\]
for a fixed \(o\in N\) and some \(V>0\). The integral uses the full
Riemann tensor. Theorem (1.5) holds in dimensions \(n\ge4\) with
curvature exponent \(n/2\) and ALE order \(n-1\), improved to order
\(n\) when \(n=4\) or the metric is Kähler. Thus in dimension four the
order is **four**. Under \(\operatorname{Ric}=0\), Bishop–Gromov
monotonicity makes a positive volume ratio at infinity sufficient
for the stated lower bound at every radius. The ratio may be
strictly less than the Euclidean ratio. Growth forces noncompactness.
[Published scan, pp. 313–315](https://www.math.stonybrook.edu/Courses/MAT683/201001/MAT683S10.pdf).

The proof establishes one end. The definition then supplies a compact
\(K\subset N\), a radius \(R>0\), a finite \(\Gamma\subset O(4)\) acting
freely on \(S^3\), and a smooth diffeomorphism
\[
 N\setminus K\simeq(\mathbb R^4\setminus\overline{B(0,R)})/\Gamma .
\]
In the oriented case \(\Gamma\subset SO(4)\), because each deck
transformation preserves the orientation lifted from the quotient.
The quotient end may have nontrivial fundamental group. Simple
connectivity at infinity occurs in Remark (1.8)(2) as a separate
rigidity hypothesis. No chirality, Kähler, spin, simple connectivity,
injectivity radius, or global energy-smallness hypothesis is needed
for the four-dimensional ALE conclusion.

Write \(\widehat h\) for the pullback under the chart and covering,
and \(\rho=|z|\) for its Euclidean radius. The p. 313 definition gives
\(\widehat h-\delta=O(\rho^{-4})\), \(D\widehat h=O(\rho^{-5})\) and,
for some \(0<\alpha<1\), the bound
\[
 \frac{|D\widehat h(z)-D\widehat h(w)|}{|z-w|^\alpha}
      \le C\min\{|z|,|w|\}^{-5-\alpha}.
\]
Remark (1.8)(1), pp. 314–315, gives
\(D^k(\widehat h-\delta)=O(\rho^{-4-k})\) for each integer
\(k\ge0\). In particular the full curvature decays as \(O(\rho^{-6})\).
The equivalence of \(\rho\) and distance from a fixed interior point
at large \(\rho\) follows from uniform comparability of the end
metric to the Euclidean metric and compactness of a fixed
truncation. The chart provides a smooth truncation with cross-section
\(S^3/\Gamma\) inside \(N\).
[Published scan, definition and Remark (1.8)](https://www.math.stonybrook.edu/Courses/MAT683/201001/MAT683S10.pdf).

## Proof dependencies and source limits

Theorem (1.1), p. 314, is the coordinate theorem with a one-end
assumption, faster-than-quadratic full curvature and Ricci decay, and
a volume lower bound. In applying Theorem (1.5) these inputs to
(1.1) are obtained in the proof. At p. 335 the authors use
Cheeger–Gromoll splitting for the one end and Croke for the
Sobolev inequality. In the one-end argument two ends would
split off a line with a compact transverse factor, incompatible
with four-dimensional Euclidean volume growth. Ricci-flatness also
supplies the volume upper bound by Bishop–Gromov. Section 4
uses the finite curvature integral, the Einstein inequality
\(\Delta|\operatorname{Rm}|\ge -C|\operatorname{Rm}|^2\),
Proposition (4.8), and the stronger inequality in Corollary (4.10).
For dimension four that corollary uses \(\delta=2/3\) and treats
the two chiral curvature summands, with no self-duality assumption
on \(h\). This gives \(O(r^{-a})\) for each \(a<6\), where
\(r=d_h(o,\cdot)\). Theorem (1.1) applies, and the concluding
Section 4 step invokes the method of Section 3, Case 2, to obtain
\(O(r^{-6})\). Section 3, Case 4, explains how the full curvature
decay yields the corresponding coordinate order, including order
four at that rate.
[Published scan, pp. 314 and 328–335](https://www.math.stonybrook.edu/Courses/MAT683/201001/MAT683S10.pdf).

The indexed reading has local cross-reference and formula discrepancies.
The parameter in Corollary (4.10) refers to the curvature estimate in
Lemma (4.9), while its text points to (4.7). The end of the proof on
p. 335 is indexed with the exponent \(n/2\) in a tail integral,
whereas the displayed conclusion and proof of Proposition (4.8)(2)
on pp. 333–334 give the higher exponent \(\gamma n/2\) for that
step, with \(\gamma=n/(n-2)\). Use the proposition's display when
referring to the intermediate estimate. The citation to (4.1) in
Remark (1.8)(5) points in context to the removable-singularity
Theorem (5.1) on p. 335. These are observations on the indexed
text, with no separate corrected edition inferred. The publisher
record and bounded correction query supplied no verified corrigendum
for this DOI. The E163 correction to a different Bando article
supplies no change to the statement checked here.
[Published scan](https://www.math.stonybrook.edu/Courses/MAT683/201001/MAT683S10.pdf).
[Publisher record](https://link.springer.com/article/10.1007/BF01389045).

## B84 applicability

Theorem (1.5) and Remark (1.8)(1) supply the ALE input if B84's
candidate is independently obtained as a smooth complete connected
Ricci-flat four-manifold with positive Euclidean volume growth
and finite full-curvature \(L^2\) integral. The resulting smooth
end chart is a map on that manifold. Transferring a compact
truncation into a precursor manifold would require separate
convergence and embedding data. Theorem (5.5) concerns an Einstein
sequence with its own hypotheses. This packet determines the ALE
conclusion for a supplied candidate.

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E164 request v1](../research-progress/handoffs/SP4-CME-E164_REQUEST_v1.md) | 8a6eccc83e6975af3aa6a8a5160aa19a6516a787185cd563d44500041fcb27f5 |
| [B84](../brainstorm/notes/B84_MINIMUM_HARMONIC_RADIUS_ALTERNATIVE_20261122.md) | b76959efa4ed2f4f6207a9b6b897f0f52b286adc735d2a0569a9c54ce02f13b6 |
| [E160](E160_FOUR_DIMENSIONAL_NONCOLLAPSE_SOURCE_TEST_20261122.md) | 61a877ec4465ad7c5b786b4190b6042295cafc1aae5bef4a80965dbf455aab32 |
| [E154 assessment](E154_METRIC_COMPACTNESS_SOURCE_ASSESSMENT_20261122.md) | ea4b36e70a665ade7fa143e97be1f3f2238db7657591f729b22b27802e4594ec |
