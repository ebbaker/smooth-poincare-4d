# WIT-E08 · Commutator length of the prescribed based word

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Revision 1, checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. This execution helper inherited the session settings. Exact serving variant and reasoning effort are unavailable. Working proof for the fixed word in the free group, with non-author replay pending. [Frozen request](../research-progress/handoffs/REQUEST_BASED_EXTERIOR_R1.md)

In \(F(x,y)\), take \(r=x^{-1}y^2xy^{-3}\), \(s=x^{-1}yx^2y^{-1}x^{-2}\), and \([a,b]=aba^{-1}b^{-1}\). Then
\[
\operatorname{cl}_{F(x,y)}([r,x][s,y])=2 .
\]
The spelling of \(r,s\) is the ordered pair of signed attaching words in [CERT E06](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#fourteen-strands-in-the-attaching-boundary) and [WEX E02](../01_examples/notes/E02_PUNCTURE_INPUT.md#2-both-ambient-seams-and-a-surface-through-each). The minus presentation appears as the second length-14 display in [Shehper et al., arXiv:2408.15332v2, §3.3](https://arxiv.org/html/2408.15332v2#S3.SS3).

Write \(X=x^{-1}\) and \(Y=y^{-1}\). The expansion is `XyyxYYYxyyyXYYxXXyxxYXXyxxyXXYxY`. Cancel the consecutive `xX` in `xXX` to obtain the 30-letter cyclically reduced word

`XyyxYYYxyyyXYYXyxxYXXyxxyXXYxY`.

Its nonempty reduced spelling proves the lower bound one independently. The given product gives the upper bound two.

## The constraint from an orientable genus-one filling

If the word were one commutator, mapping the two loops of the punctured torus to its two factors would give a map from a compact connected oriented genus-one surface to the rose \(R\) with loops \(x,y\). Use a boundary collar to homotope its boundary to the exact cyclically reduced spelling, parametrized with one oriented edge traversal for each letter.

Choose a PL representative relative to that boundary, subdividing the rose to a simplicial graph and the surface to make the map simplicial. In the interior of a target edge in each of the two loops choose a point away from images of domain vertices. Each fiber then meets any triangle mapping over the target edge in a segment, and each interior endpoint on a domain edge is incident to two such segments. The fibers are disjoint compact one-manifolds, with one boundary point per occurrence of the corresponding letter. Orienting the target edge coorients each fiber, so the boundary crossings at the two ends of each arc have opposite signs. Discard circular components. The arcs give a complete pairing of inverse letters on the oriented boundary.

Take a regular neighborhood \(N\) of the boundary collar and the arcs in the filling. It is an annulus with one orientable band for each arc. Write \(E\) for the number of arcs and \(V\) for the number of boundary circles of \(N\) other than the original boundary. Capping those \(V\) circles gives a genus \(g\leq 1\) surface with one boundary and \(V-E=1-2g\). In fact \(N\) has genus at most that of the filling since each component of its complement attaches to at least one of the inner circles. Gluing such a component along its \(b\) circles adds its genus and \(b-1\) to the genus.

To read the same pairing as a graph, identify the sides of a polygon with the letters of the cyclic spelling, matching paired sides with opposite orientations. The quotient of the sides is a connected graph with \(E\) edges and \(V\) vertices. Its vertices correspond to inner circles of \(N\), since a corner identification across a paired side is the same successor step as tracing one side of the corresponding band around an inner circle. The polygon gives a single cyclic tour of this graph that crosses each edge once in each direction. The cyclically reduced spelling excludes degree-one vertices, where this tour would immediately traverse a letter and its inverse. If \(g=0\), the graph would have \(V=E+1\), impossible with every degree at least two and \(E=15\). Thus \(g=1\).

Suppress every degree-two vertex, labeling the resulting edge by the ordered word along its path. This preserves \(E-V=1\). Since the original graph is connected and \(E-V=1\), it has a vertex of degree at least three. The suppressed graph has \(V'\geq 1\), every vertex has degree at least three, and \(2E'=2V'+2\geq 3V'\). Therefore \(V'\leq 2\) and \(E'\leq 3\). The cyclic tour would split into \(2E'\) nonempty blocks, each paired with its reverse inverse from the opposite traversal of the same edge. Such a split has four or six cuts, each at a gap between consecutive letters.

## Seven necessary cuts

Number the letters from zero and call \(i\) the gap just before letter \(i\), with indices modulo 30. A cyclic four-letter window lying wholly in a block would have its reverse inverse somewhere in the cyclic word, inside the paired block. The seven windows below have no cyclic occurrence of their inverse. Each therefore needs a cut in one of its interior gaps.

| Start | Window | Inverse absent | Interior gaps |
| ---: | --- | --- | --- |
| 0 | `Xyyx` | `XYYx` | 1, 2, 3 |
| 4 | `YYYx` | `Xyyy` | 5, 6, 7 |
| 7 | `xyyy` | `YYYX` | 8, 9, 10 |
| 11 | `XYYX` | `xyyx` | 12, 13, 14 |
| 18 | `YXXy` | `Yxxy` | 19, 20, 21 |
| 21 | `yxxy` | `YXXY` | 22, 23, 24 |
| 26 | `XYxY` | `yXyx` | 27, 28, 29 |

The gap sets are disjoint, so at least seven cuts are necessary. This rules out every orientable genus-one pairing and proves the claim.

## Replay

The certificate can be checked from the cyclic spelling alone. The following Python also checks all four-cut and six-cut splits, by comparing the multiset of their blocks with the multiset of inverse blocks. Every block is nonempty and freely reduced, so none equals its own formal inverse.

```python
from itertools import combinations

word = "XyyxYYYxyyyXYYXyxxYXXyxxyXXYxY"
n = len(word)
doubled = word + word
windows = {doubled[i:i + 4] for i in range(n)}
used_gaps = set()
for i in (0, 4, 7, 11, 18, 21, 26):
    assert doubled[i:i + 4].swapcase()[::-1] not in windows
    gaps = {(i + j) % n for j in (1, 2, 3)}
    assert used_gaps.isdisjoint(gaps)
    used_gaps.update(gaps)

for k in (4, 6):
    partitions = matches = 0
    for cuts in combinations(range(n), k):
        ends = cuts[1:] + (cuts[0] + n,)
        blocks = [doubled[a:b] for a, b in zip(cuts, ends)]
        partitions += 1
        matches += sorted(blocks) == sorted(b.swapcase()[::-1] for b in blocks)
    print(k, partitions, matches)
```

Python 3.10.0 returned `4 27405 0` and `6 593775 0`. The finite certificate uses only the stated cyclic word and orientable surface maps to the rose.

Input SHA-256 prefixes are `2ff5b6688437e017` for the request, `0718114604f51a00` for CERT E06 and `f1e6e75d0af37e82` for WEX E02. The marked four-dimensional context is recorded in [WEX E07](../01_examples/notes/E07_TWO_CAPS.md), `041381b5956cedd4`, and [WIT B04](TWO_BELT_LEAF.md), `3ace20e9eeb98cea`.
