# WIT-E09B · Independent replay of the prescribed based word

28 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving variant and reasoning effort are unavailable. Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. SHA-256 prefixes of the checked inputs are [request](../research-progress/handoffs/REQUEST_BASED_EXTERIOR_R1.md) `2ff5b6688437e017`, [E08](../notes/E08_BASED_WORD.md) `fd32d3da8c9f6ec2`, [WEX-E02](../01_examples/notes/E02_PUNCTURE_INPUT.md) `f1e6e75d0af37e82`, and [CERT-E06](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md) `0718114604f51a00`. This replay is a free-group result for one prescribed word.

**Disposition.** The commutator length of \(w=[r,x][s,y]\) in \(F(x,y)\) is two. The relative regular-fiber construction and seven-cut exclusion replay. A separate full enumeration of inverse-letter pairings gives the same result.

## From a filling to inverse-letter pairings

I reconstructed \(r=x^{-1}y^2xy^{-3}\) and \(s=x^{-1}yx^2y^{-1}x^{-2}\) from the native table and expanded with \([a,b]=aba^{-1}b^{-1}\). Taking capital letters as inverses, the stack reduction changes `XyyxYYYxyyyXYYxXXyxxYXXyxxyXXYxY` into `XyyxYYYxyyyXYYXyxxYXXyxxyXXYxY`. The reduced spelling has 30 letters and its last and first letters, `Y` and `X`, are not inverses. This proves nontriviality. The displayed product of two commutators gives the upper bound. [Ordered handle words](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#fourteen-strands-in-the-attaching-boundary)

If \(w\) were one commutator, a punctured torus mapping to the two-petal rose would realize the cyclic spelling on its boundary. The boundary relation can be written in either orientation by exchanging the two handle generators. A collar homotopy realizes the exact edge path. Subdivide the rose to a simplicial graph and take a PL approximation relative to the prescribed subdivided boundary. Choose a point in the interior of one edge of each petal, away from vertex images. At a triangle that meets the fiber, the segment spans two triangle edges. Each crossed interior edge abuts exactly two such segments, and each crossed boundary edge gives an endpoint. The two fibers are disjoint and each is a compact one-manifold. The chosen orientation of the target edge coorients the whole fiber, and the oriented surface gives an orientation to each fiber arc. Its endpoints therefore cross the boundary with opposite signs for that petal. Discarding circles leaves one arc matching each positive occurrence to a negative one.

Let \(E=15\) be the number of arcs. A regular neighborhood of the boundary collar together with the arcs is a connected orientable annulus with \(E\) bands. Denote its other boundary circles by \(V\) and its genus by \(g\). Each complementary component of genus \(h\) with \(b\) boundary circles adds \(h+b-1\geq0\) to the genus, so \(g\leq1\). Capping the inner circles gives Euler characteristic \(V-E=1-2g\). For the graph of polygon sides paired in opposite directions, the identifications of the corners trace precisely the inner circles of this annulus with bands. It is a connected graph with \(E\) edges and \(V\) vertices and a cyclic face walk along the 30 letters.

At a degree-one vertex, the walk returns along the edge it just traversed. The corresponding letters would be consecutive inverses, including when they straddle the cyclic origin. Thus every vertex has degree at least two. This excludes \(V=E+1\), and a putative genus-one map must give \(V=E-1=14\). Suppress all degree-two vertices. The connected graph has a vertex of degree at least three since \(E-V=1\). Each maximal degree-two chain becomes one edge, possibly a loop. The resulting counts satisfy \(E'-V'=1\) and \(3V'\leq2E'\), so \((V',E')=(1,2)\) or \((2,3)\). Through every degree-two vertex the face walk continues along the same chain. The walk therefore splits at exactly four or six distinct cyclic gaps into nonempty blocks, one for each directed traversal of a suppressed edge. The two traversals have reverse-inverse spellings.

## The necessary cuts

I regenerated all 30 cyclic windows of length four, including those crossing index zero. The following seven windows have no reverse inverse among them. Gap \(i\) precedes letter \(i\).

| Start | Window | Reverse inverse | Interior gaps |
| ---: | --- | --- | --- |
| 0 | `Xyyx` | `XYYx` | 1, 2, 3 |
| 4 | `YYYx` | `Xyyy` | 5, 6, 7 |
| 7 | `xyyy` | `YYYX` | 8, 9, 10 |
| 11 | `XYYX` | `xyyx` | 12, 13, 14 |
| 18 | `YXXy` | `Yxxy` | 19, 20, 21 |
| 21 | `yxxy` | `YXXY` | 22, 23, 24 |
| 26 | `XYxY` | `yXyx` | 27, 28, 29 |

A window wholly contained within a directed block would occur in reverse-inverse order inside the block for the opposite traversal. Each chosen window therefore requires a cut at an interior gap. The interior gap sets are pairwise disjoint, requiring seven cuts and contradicting the bound of six.

## Independent complete pairing check

I also enumerated the pairings directly, without imposing a cut or valence bound. Number edge \(i\) from corner \(i\) to corner \(i+1\). For the inverse matching involution \(\alpha\), an opposite side gluing identifies corner \(i\) with \(\alpha(i)+1\) and corner \(i+1\) with \(\alpha(i)\), modulo 30. The second equality is the first at the paired edge. The number of vertex classes is therefore the number of cycles of the permutation \(i\mapsto\alpha(i)+1\). Choosing the mate of each lowercase occurrence in index order, among unused corresponding uppercase occurrences, visits each possible pairing exactly once. In particular the seven `x` occurrences and eight `y` occurrences give \(7!\,8!=203{,}212{,}800\) leaves. The C++17 loop compiled with Apple Clang 15.0.0 counted the cycles at every leaf. The recurrence is

```text
visit(next_positive, used_negative_positions):
    if every positive edge has a mate:
        totals[number_of_cycles(next_corner)] += 1
        return
    i = position of next positive edge
    for every unused j whose letter is the inverse of letter i:
        next_corner[i] = (j + 1) mod 30
        next_corner[j] = (i + 1) mod 30
        visit(next_positive + 1, used_negative_positions with j added)
```

| Vertex count | Pairings |
| ---: | ---: |
| 2 | 97,943,196 |
| 4 | 91,469,841 |
| 6 | 13,293,089 |
| 8 | 499,888 |
| 10 | 6,750 |
| 12 | 36 |

The counts sum to \(203{,}212{,}800\) and the maximum vertex count is 12. The required genus-one value 14 occurs in no pairing. This corroborates the seven-window proof for exactly the fixed ordered word. [Reviewed proof](../notes/E08_BASED_WORD.md)
