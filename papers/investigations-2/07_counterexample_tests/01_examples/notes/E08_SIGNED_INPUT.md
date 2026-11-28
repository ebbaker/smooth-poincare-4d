# WEX-E08 · Signed input for 16n68278

28 November 2026 UTC (27 November in America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving variant and effort are unavailable. Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. The [resumed request](../../research-progress/handoffs/REQUEST_SIGNED_REPLAY_R2.md) has SHA-256 `fb3f0cbce52c37119e24d46706f0523b82252e9ae8065ae8976dff4fe1840a9a` and the [literal input handoff](../research-progress/handoffs/REQUEST_E09_TRANSPORT_R1.md) has SHA-256 `50e0c5d806ae2abb05cd81a465ea23d39402ab52f4a00d01c710c08c4506e207`. Evidence here consists of a primary paper reading, source retrieval checks, and an exact local cross-check of the frozen diagrams.

The handoff fixes a signed one-component PD for `16n68278` and a signed three-component surgery PD. The literal surgery PD reproduces the published Table 11 DT field. WEX-E09 matches the named PD to the filling retaining original cusp 1, with ambient orientation preserved and traversal reversed. The Dataverse V1 file metadata and native CSV bytes remain unverified. [Dunfield–Gong, Table 11](https://arxiv.org/pdf/2512.21825#page=48) · [WEX-E09](E09_PERIPHERAL.md)

## Source locators and byte evidence

Nathan M. Dunfield and Sherry Gong, *Ribbon concordances and slice obstructions: experiments and examples*, arXiv:2512.21825v1, 26 December 2025, §1.19, p. 14, points to the quick-access PDs for all 286 named \(\mathrm{PS}_{19}\) knots. Reference [DG], p. 59, identifies their 2025 Harvard Dataverse deposit *Ribbon concordances and slice obstructions: code and data*. Dunfield's item 42 links a V1 ZIP. The earlier handoff records Dataverse file ID `13283715` and mirror commit `fd0fa81c003fb73f0fc776141eb2f225364acb56`. The public mirror's repository root and `Data` directory entry were visible on the web. The pinned CSV previews and raw blobs were inaccessible on this return. The file ID and preview locations below are inherited source locators. [§1.19](https://arxiv.org/pdf/2512.21825#page=14) · [Reference [DG]](https://arxiv.org/pdf/2512.21825#page=59) · [Dataverse DOI](https://doi.org/10.7910/DVN/YBDTBT) · [Dunfield, item 42](https://nmd.web.illinois.edu/preprints/index.html) · [Mirror](https://github.com/EugeneFrancisco/plausibly_slice_v1) · [Literal input handoff](../research-progress/handoffs/REQUEST_E09_TRANSPORT_R1.md)

| Evidence level | Locator and receipt |
| --- | --- |
| Dataverse deposit | DOI `10.7910/DVN/YBDTBT`. The [V1 landing page](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/YBDTBT&version=1.0), [version 1.0 API](https://dataverse.harvard.edu/api/datasets/:persistentId/versions/1.0?persistentId=doi:10.7910/DVN/YBDTBT), and [file record `13283715`](https://dataverse.harvard.edu/file.xhtml?fileId=13283715&version=1.0) supplied no readable V1 metadata. File size, archive checksums and deposit version timestamp are unverified. |
| Whole ZIP | The [author ZIP link](https://dunfield.info/plausibly_slice_V1.zip) redirected to [the Illinois host](https://nmd.web.illinois.edu/plausibly_slice_V1.zip) and returned no bytes to the web reader. The [Dataverse datafile endpoint](https://dataverse.harvard.edu/api/access/datafile/13283715) supplied no bytes either. |
| Named knot CSV and record | [`Data/knots_mentioned_PD_codes.csv`, mirror preview row 140](https://github.com/EugeneFrancisco/plausibly_slice_v1/blob/fd0fa81c003fb73f0fc776141eb2f225364acb56/Data/knots_mentioned_PD_codes.csv#L140), counting the header. Key `16n68278`, crossing count 16, and the first literal PD below are carried by the handoff. |
| Friend CSV and record | [`Data/unknown_with_0-friend_final.csv`, mirror preview row 38](https://github.com/EugeneFrancisco/plausibly_slice_v1/blob/fd0fa81c003fb73f0fc776141eb2f225364acb56/Data/unknown_with_0-friend_final.csv#L38), counting the header. Keys `name=16n68278_0` and `base_knot=16n68278`. The handoff records `RBG_PD`, `DT[tcbjhTDJBgQmsOLhPcekIRFnA]` and framings `[(1,1),(0,1),(0,1)]`. It describes a distinct 50-crossing `PD_code` for the friend and carries no literal for that field. |
| Printed field | Table 11, p. 48, second data row `16n68278`. The 25 ASCII bytes in `tcbjhTDJBgQmsOLhPcekIRFnA`, excluding wrappers and newline, have SHA-256 `6d910405a517663a5a5949df1d2bd2dd5e230553bcba4e1467916a11d91d19a0`. |

Direct HTTPS requests for the raw GitHub and Dataverse URLs failed at DNS in the shell. The two browser connections were unavailable. In the relevant scratch files, `/tmp/sp4-wex-e01/archive.headers` was empty. Its `dt_rotation_e08.c` and the `/tmp/wex_e09_*.py` files were prior computations, with no recovered ZIP or CSV bytes. The named mirror paths are known, while the ZIP's internal paths, exact raw records, and whole member bytes remain unchecked. A new archive receipt needs the complete ZIP digest, each uncompressed member's digest and exact ZIP path, and each logical CSV record's digest over its original byte span including its line ending if present. A normalized PD digest omits CSV quoting, spacing, other fields, and line endings. Comparing member bytes from a mirror with archive bytes requires both streams or independently recorded matching checksums.

## Literal diagrams and primary row check

Use oriented standard \(S^3=\partial B^4\) with outward-normal-first orientation. In each PD tuple, slots are counterclockwise from the incoming under-edge. Opposite slots are the two strands through the crossing. The named knot follows the arcs \(1,\ldots,32\) in increasing cyclic order. The RBG traversal follows \(1,\ldots,4\), \(5,\ldots,24\) and \(25,\ldots,40\), in that component order. The cyclic order and the over/under choices supply the signed planar diagrams. [Literal input handoff](../research-progress/handoffs/REQUEST_E09_TRANSPORT_R1.md) · [WEX-E09, input conventions](E09_PERIPHERAL.md#input-and-surviving-cusp-conventions)

```json
[[4,2,5,1],[2,8,3,7],[8,4,9,3],[14,5,15,6],[6,15,7,16],[9,17,10,16],[29,10,30,11],[11,28,12,29],[21,12,22,13],[13,20,14,21],[24,17,25,18],[18,32,19,31],[19,26,20,27],[27,22,28,23],[30,24,31,23],[25,1,26,32]]
```

```json
[[4,40,1,39],[38,2,39,1],[2,8,3,7],[6,4,7,3],[24,20,5,19],[5,40,6,25],[13,8,14,9],[9,27,10,26],[10,33,11,34],[34,11,35,12],[25,13,26,12],[37,14,38,15],[15,20,16,21],[16,30,17,29],[30,18,31,17],[18,24,19,23],[21,29,22,28],[22,31,23,32],[27,37,28,36],[32,35,33,36]]
```

| PD in the order above | Compact ASCII JSON bytes, with no trailing newline | SHA-256 |
| --- | ---: | --- |
| Named knot | 207 | `f8102835b2008bc535970e1ac34a868333d2ce338bed21b364bc0ac1c13e5348` |
| RBG surgery link | 263 | `77bac88b17c4c0a295e5d4fc5ac3bd99c124b608daa140637453de7974f26498` |

Every arc label occurs twice in its PD. The face permutation, obtained by crossing the current edge to its other dart and advancing one cyclic slot, counts 18 faces for the named knot and 22 for the RBG link. The two connected projections each have Euler characteristic two.

For a direct DT cross-check, label each crossing visit by its outgoing arc. If a row is \((a,b,c,d)\), its under visit is \(c\). Its over visit is \(d\) when \(d\) is the cyclic successor of \(b\), and \(b\) otherwise. Each RBG row has one odd and one even visit. Use the convention in which an even under visit is positive and an even over visit negative. Ordered by the odd visit, the signed even sequence is

```text
-40 -8 -20 -4 14 -34 26 38 -30 -24 16 -32 6 10 22 -18 -36 -12 28 -2
```

The alphabetical header is `tcbjh` for 20 crossings, 3 components and respectively 2, 10 and 8 pairs of visits. Encoding the signed even sequence gives the published field exactly. Applying the same rule to the named PD gives `papmDAHBokCePgnIjfL` in this traversal. This compares the surgery PD and the printed DT data by direct integer operations. A match on the compact DT field does not recover raw CSV bytes or a signed peripheral map. [SnapPy 3.3.2, `Link.DT_code`](https://snappy.computop.org/spherogram.html#spherogram.Link.DT_code) · [Knot Atlas, DT signs](https://katlas.org/wiki/DT_%28Dowker-Thistlethwaite%29_Codes) · [Dunfield–Gong, Table 11](https://arxiv.org/pdf/2512.21825#page=48)

The paper's row records \(r=+1\) and \(\widetilde s_c(K')\ne0\) for the friend. Super-special means both red sublinks are Hopf and \(b=g=0\). On the frozen diagrams WEX-E09 identifies the named knot with the partial filling that keeps arcs \(5,\ldots,24\), fills cusp 0 with \(\mu+\lambda\), and fills cusp 2 with \(\lambda\). With meridians linking the oriented curves positively and preferred longitudes oriented along the knots, WEX-E09 records an orientation-preserving transport with \((\mu,\lambda)\mapsto(-\mu,-\lambda)\). Frame order \(R,B,G=(0,1,2)\) calls that output \(K_B\). The immutable CSV schema and a signed match from the other filling to the friend PD remain unconfirmed here. Theorem 5.14 gives an exotic-sphere consequence **if** the named knot bounds a smooth proper disk in the standard ball. [Dunfield–Gong, §§5.7, 5.11 and 5.13, Theorem 5.14](https://arxiv.org/pdf/2512.21825#page=43) · [WEX-E09, verified comparisons](E09_PERIPHERAL.md#verified-comparisons)

## Scope of published band moves

- In §2.2 the band path is simple in the subdivided planar dual graph of the current diagram. Endpoints lie on the diagram and interior encounters have specified over/under data. Half-twist parity gives a split. Paths leaving and reentering a complementary region are outside this class. [§2.2 and Figure 7](https://arxiv.org/pdf/2512.21825#page=16)
- Section 2.3 starts with paths shortest for their endpoints, initially allowing three half-twists. It then uses simple paths up to a bound, usually six, and proceeds through two, three and four bands. Pairwise linking, signature and multivariable Fox–Milnor tests prune intermediate links. Hyperbolic exterior comparisons consolidate duplicates. Table 6 reports successful band lengths up to seven and a later twist limit of one or two. These are aggregate statistics. [§2.3 and Table 6](https://arxiv.org/pdf/2512.21825#page=18)
- Sections 2.4–2.6 vary starting diagrams by exterior reconstruction, use a cache of 12,143 ribbon links, and test sums with a trefoil and its mirror or with two figure-eight knots. Section 2.10 certificates record consecutive PDs and encoded bands ending at an unlink or a cached ribbon link. A checker must verify the link equivalences when diagrams are changed. [§§2.4–2.6](https://arxiv.org/pdf/2512.21825#page=19) · [§2.10](https://arxiv.org/pdf/2512.21825#page=23)

In outward radial time these ribbon certificates describe disks with zero interior maxima. The bounded search does not exclude all ribbon disks, and it supplies no exclusion for a disk with an interior maximum. No per-knot ledger of the diagrams, moves or pruning for `16n68278` was recovered.
