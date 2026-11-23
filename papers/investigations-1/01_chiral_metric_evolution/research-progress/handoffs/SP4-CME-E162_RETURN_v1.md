# SP4-CME-E162 return v1 — ALE core topology test

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E execution from the [frozen request][req]
under B82, configured `gpt-6.2-sol` / `ultra`. Independent runtime
attestation and actual lead settings are unavailable. I authored related
E154 and E158. Neither is a proof input in this packet. I did not author
B82, E160 or its lead assessment.

## Disposition

**Proved for a supplied full smooth core.** No smooth compact end
truncation of a connected complete nonflat oriented Ricci-flat ASD ALE
four-manifold embeds orientation-preservingly in a closed smooth oriented
integral homology four-sphere. The proof also covers any full compact
core with a collared product complement. The term ASD is \(W^{+}=0\)
in the chosen orientation.

- Connectedness and smooth collars give two compact sides of the
  embedded boundary. Integral Mayer–Vietoris gives \(H_2=0\) on
  both sides and splits \(H_1(Y)\) as their first homologies. The pair
  sequence, integral Poincaré–Lefschetz duality and integral UCT give
  \(H_1(Y;\mathbb Z)\cong G\oplus G\), \(G=H_1(K;\mathbb Z)\).
  A nontrivial cyclic finite group cannot have this form.
- If \(b_2>0\), the rational intersection form of the core is
  nonsingular because the boundary is a rational homology sphere.
  It has a vector of nonzero self-intersection. A smooth compactly
  supported relative dual form extends by zero to the ambient sphere
  with the same square integral, which vanishes there.
- If \(b_2=0\), Wright supplies a degree-\(d>1\) cyclic quotient
  of a Gibbons–Hawking cover with \(d\) monopoles, using multiplicativity
  of the Euler characteristic. The oriented circle fiber generates
  the \(C_d\) subgroup of the end group. Deck transformations preserve
  the generator, so this subgroup is central. A cyclic quotient then
  makes the whole end group abelian, and the free linear sphere
  action makes it cyclic. Thus \(H_1(Y;\mathbb Z)=C_{d^2}\),
  which contradicts the two-sided splitting. The proof compares
  the quotient circle bundle sections to the ALE sections by
  cofinal product tails. [Wright v2][wright].

The obstruction is conditional on the smooth full-core embedding.
The analytic extraction needed to produce such a core from the
bounded-Ricci sequence remains outside this result. Orbifold cores
and incomplete compact subsets are outside the tested statement.

## Source and access

One primary work, Evan P. Wright, *Quotients of gravitational
instantons*, arXiv:1102.2442v2, revised 29 April 2011. Successfully
reopened the versioned PDF text, HTML and metadata on 22 November
2026. Used zero discovery queries and no retained local reading copy.
Selected primary locators are Theorem A p. 1, §2 and Table 1 pp. 2–3,
§3 Remark 3 and Proposition 1 with proof pp. 4–5, §7.1 Theorem 2 and
circle action p. 16, §7.2 pp. 17–19 and §8 Corollary B pp. 19–20.
The circle-action reading includes the \(k=2\) conjugation and the
fixed-fiber sign argument. The printed §8 phrase “\(k-1\) monopoles”
does not match §7.1 and Table 1. The proof uses \(k\) monopoles and
\(b_2(\widetilde X)=k-1\), independent of that phrase. The original
Kronheimer, Gibbons–Hawking and Bando–Kasue–Nakajima works cited
by Wright were not opened. R31 carries the publication metadata
*Annals of Global Analysis and Geometry* 41 (2012), 91–108,
DOI 10.1007/s10455-011-9272-2. The E162 inspection was of the
named preprint version. Sent the additional R31 passage details
to the lead. [Version record][meta] · [PDF][wright] · [HTML][html] · [R31][r31].

## Verified versions

| File | SHA-256 |
| --- | --- |
| [E162 request v1][req] | d592fb1814b75c1ab22f2836ea621c9ec925cfc789d91dd050479fe87d92cd78 |
| [B82][b82] | 7ad5aff3e23ba3e21fbe14fd2ad5adb591831118090a6581794c0acae67abe7c |
| [E160 source test][e160] | 61a877ec4465ad7c5b786b4190b6042295cafc1aae5bef4a80965dbf455aab32 |
| [E160 lead assessment][e160a] | 0b6d53dcfd8beb13e58fb7e94384929aef98dad88d93737a2432af9d0e9dd48c |
| [E162 proof note][note] | c99bc41b15e828f54e717b9eb8250927586d2aa277c6160a6b323fd12fdddf54 |

Only the designated note and this return were written.

[req]: SP4-CME-E162_REQUEST_v1.md
[b82]: ../../brainstorm/notes/B82_ALE_CORE_TOPOLOGY_TEST_20261122.md
[e160]: ../../reviews/E160_FOUR_DIMENSIONAL_NONCOLLAPSE_SOURCE_TEST_20261122.md
[e160a]: ../../reviews/E160_NONCOLLAPSE_SOURCE_ASSESSMENT_20261122.md
[note]: ../../notes/162_ALE_CORE_TOPOLOGY_TEST_20261122.md
[r31]: ../../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r31--wright-ale-quotients
[meta]: https://arxiv.org/abs/1102.2442v2
[wright]: https://arxiv.org/pdf/1102.2442v2
[html]: https://arxiv.org/html/1102.2442v2
