# WEX-E09 · Signed peripheral transport for 16n68278

28 November 2026 (UTC), for Edward B. Baker III with OpenAI Codex assistance. Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. The serving model and effort are unavailable to this helper. [Frozen transport request, revision 1](../research-progress/handoffs/REQUEST_E09_TRANSPORT_R1.md) has SHA-256 `50e0c5d806ae2abb05cd81a465ea23d39402ab52f4a00d01c710c08c4506e207`. The finite diagram calculation below is local. The verified SnapPy computation was executed separately by the lead on SageMathCell using SnapPy 3.3.2, with its commands and returned data recorded here.

**Result.** The exterior retaining original cusp **1**, the component on raw arcs **5–24**, matches the exterior of the literal signed 16-crossing diagram of `16n68278`. The exterior map preserves ambient orientation and sends \((\mu,\lambda)\) to \((-\mu,-\lambda)\). It extends to the oriented standard \(S^3\), reversing the knot traversal. Keeping original cusp **2**, the component on arcs **25–40**, gives a different oriented or unoriented exterior from that named knot. The computation uses the frozen mirror-member data. [Frozen rows and framings](../research-progress/handoffs/REQUEST_E09_TRANSPORT_R1.md) · [Dunfield–Gong, Definition 5.7, §5.11 and Table 11](https://arxiv.org/pdf/2512.21825)

## Input and surviving cusp conventions

Use meridians with linking \(+1\) to the oriented components, and preferred longitudes oriented parallel to the knots. Integer \(n\)-surgery is the unoriented primitive slope \(n\mu+\lambda\), and a SnapPy pair \((m,l)\) denotes \(m\mu+l\lambda\). PD tuples are in counterclockwise cyclic order from the incoming under-edge. The orientation follows increasing labels with cyclic wrap in each component. SnapPy's PD roundtrip in the lead run subtracted one from all arc numbers with no other change. The opposite-slot circuits of the supplied link, found without a triangulation package, are:

| Original SnapPy index | Raw arc labels | Framing | Role |
| --- | --- | ---: | --- |
| 0 | \(1,\ldots,4\) | \(+1\) | Red, \(R\) |
| 1 | \(5,\ldots,24\) | \(0\) | Retained component \(A\) for the named knot |
| 2 | \(25,\ldots,40\) | \(0\) | Other retained component \(C\) |

In this order the linking matrix has off-diagonal entries \(\operatorname{lk}(R,A)=\operatorname{lk}(R,C)=1\), \(\operatorname{lk}(A,C)=0\). The signed mixed crossings for \(R\) are rows \((3,4)\) with \(A\) and \((1,2)\) with \(C\), all positive. For \(A,C\) the positive rows are \(8,11,14,15,17\), and the negative rows are \(6,9,10,12,18\), using one-based PD row numbers. This is independent of the lead's SnapPy linking-matrix readout. The digests of the literal PDs, serialized as compact ASCII JSON arrays with comma separators and no trailing newline, are:

| PD | SHA-256 |
| --- | --- |
| Named knot | `f8102835b2008bc535970e1ac34a868333d2ce338bed21b364bc0ac1c13e5348` |
| RBG link | `77bac88b17c4c0a295e5d4fc5ac3bd99c124b608daa140637453de7974f26498` |

Each original red sublink is positive Hopf. The red disk below meets the other component once positively, and that component by itself is an unknot by the elementary reductions below. Shrinking red along the punctured red disk gives a positive meridian circle. Filling the original Hopf pair with slopes \(\mu_R+\lambda_R\) and \(\lambda_j\) gives the oriented \(S^3\), since the two slopes have absolute intersection one on the Hopf product torus. Its knot is the image of the component kept. The untouched meridian is its meridian. For the longitude, \(H_1\) of the original exterior has basis \((\mu_R,\mu_A,\mu_C)\) with
\[
 \lambda_R=\mu_A+\mu_C,\qquad \lambda_A=\mu_R,\qquad
 \lambda_C=\mu_R
\]
in homology. On either one-cusp filling the \((0,1)\)-filling imposes \(\mu_R=0\). The red filling then kills \(\mu_A+\mu_C\). Consequently the untouched longitude on the kept cusp is primitive and null-homologous in the filled exterior, so it is exactly the preferred longitude oriented along the retained traversal. This gives the geometrical basis in which to interpret the subsequent cusp matrices.

## Verified comparisons

Let \(Y_A\) be the result of filling \((1,1)\) on cusp 0 and \((0,1)\) on cusp 2 of the original literal RBG exterior. Let \(Y_C\) keep cusp 2 instead, filling \((1,1)\) on cusp 0 and \((0,1)\) on cusp 1. Both retain the original unfilled peripheral basis. Denote the literal named exterior by \(E_K\). The lead permanently filled the specified cusps, computed verified canonical retriangulations, and enumerated their combinatorial isomorphisms. Neither cusp basis was reset. The orientation- and curve-orientation-sensitive decorated signatures were:

| Exterior | Canonical decorated signature |
| --- | --- |
| \(E_K\) | `vLvAvvzLAMPMQQQbefljlkonmtrsutsrusurthaiaotuahcaksauksmbqwq_BbBa` |
| \(Y_A\) | `vLvAvvzLAMPMQQQbefljlkonmtrsutsrusurthaiaotuahcaksauksmbqwq_bBba` |
| \(Y_C\) | `FvLAvzzPzzLQzAAPLzAQQkcefjlikmkqutuuqrswzwxwCDAEDBDCEEnnaaagsxkraxxaovsiaawwqpqaaoncgj_BaaB` |

There is one combinatorial isomorphism from the canonical retriangulation of \(E_K\) to that of \(Y_A\), with cusp \(0\to0\) and matrix
\[
 \begin{pmatrix}-1&0\\0&-1\end{pmatrix}.
\]
There are no isomorphisms in the same comparison to \(Y_C\), and the verified volumes for the two fillings were, respectively, `17.04395684436338572946254?` and `19.5530818518452060265138?`. The question marks are Sage's interval display. These disjoint volumes corroborate the negative comparison. The exact sign comes from the integer combinatorial cusp matrix. SnapPy reports its images in the columns, and \(\det(-I)=+1\) implies preservation of ambient orientation by the oriented boundary convention. Its inverse gives the same matrix from \(Y_A\) to the named diagram. The meridian slope is preserved, so the torus map extends across the ambient meridional filling. The linear \(-I\) boundary map has extension \((z,e^{it})\mapsto(\bar z,e^{-it})\) on \(D^2\times S^1\), reversing the oriented core and preserving the oriented solid torus. Any torus map in that boundary mapping class can be joined to it by an isotopy in a collar. The match thus fixes the ambient mirror choice and changes both peripheral signs together. [SnapPy filled triangulations and canonical certification](https://snappy.computop.org/manifold.html) · [Verification and interval conventions](https://snappy.computop.org/verify.html)

The archive checker mentioned in the frozen intake accepts either assignment through an exterior comparison and returns no peripheral map. The web fetches attempted here for the mirrored `rbg.py` were inaccessible. For the indexing convention \(R,B,G=(0,1,2)\), the present calculation is \(K_B=16n68278\) up to the displayed traversal reversal. The index and raw arc interval specify the component independently of that naming convention. The \(Y_C\) comparison here is against the literal named knot. A separate verified comparison would identify its signed match to the 50-crossing friend diagram.

## Replay code

Run in SageMath with SnapPy 3.3.2, from the repository root. The sole input other than SnapPy is the frozen Markdown. Python literal parsing leaves the PD labels as Python integers. The originals are the reference cusp indices for both fillings, before permanently removing filled ideal vertices.

```python
from ast import literal_eval
from pathlib import Path
import re
import snappy

request = Path(
    "papers/investigations-2/07_counterexample_tests/01_examples/"
    "research-progress/handoffs/REQUEST_E09_TRANSPORT_R1.md"
).read_text()
knot_pd = literal_eval(re.search(r"16n68278, 16,\s*(\[\[.*\]\])", request)[1])
link_pd = literal_eval(re.search(r"RBG_PD\s*=\s*([^\n]+), framing", request)[1])
K = snappy.Link(knot_pd)
L = snappy.Link(link_pd)

def normalized_pd(link):
    return [tuple(row) for row in link.PD_code()]

def from_one_based(rows):
    return [tuple(x - 1 for x in row) for row in rows]

assert normalized_pd(K) == from_one_based(knot_pd)
assert normalized_pd(L) == from_one_based(link_pd)
assert [len(component) for component in L.link_components] == [4, 20, 16]
print(snappy.__version__, L.linking_matrix())

def keep(original_index):
    exterior = L.exterior()
    exterior.dehn_fill((int(1), int(1)), int(0))
    exterior.dehn_fill((int(0), int(1)), int(3 - original_index))
    kept = exterior.filled_triangulation()
    assert kept.num_cusps() == 1
    return kept

def signature(canonical):
    return canonical.triangulation_isosig(
        ignore_orientation=False, ignore_curve_orientations=False
    )

target = K.exterior().canonical_retriangulation(verified=True)
print("Named", signature(target))
for original_index in (1, 2):
    filled = keep(original_index)
    canonical = filled.canonical_retriangulation(verified=True)
    isomorphisms = target.isomorphisms_to(canonical)
    print("Keep", original_index, signature(canonical))
    print("Cusp maps", [iso.cusp_maps() for iso in isomorphisms])
    print("Volume", filled.volume(verified=True))
```

## Independent local reduction and execution scope

The PD rotation-system face walk takes each outgoing half-edge to its mate across the arc and advances one cyclic slot. It gives 22 faces for 20 crossings and 40 arcs. Cutting the face adjacency graph on the four red arcs separates the small projected disk with faces \((39,4,7,2)\), \((7,3)\), and \((39,1)\). Arcs 7 and 39 are the only nonred arcs in this disk. Both run from below to above the red planar disk under the increasing-label orientations. The \(+1\) blowdown is the negative full twist on these two strands. The surviving frames become \(-1,-1\) and their mutual linking number becomes \(-1\), the Schur-complement calculation. A two-crossing planar replacement for the twist keeps rows 5–20 and adds \((42,6,40,41)\) and \((41,38,8,42)\). These have the required attachment ends and negative signs, and the resulting rotation system has 18 crossings and 20 faces. The local reduction ends at this red blowdown. The full comparison above uses the separate verified canonical route.

For the standalone unknot check, delete every row where the component under test is absent or crosses another component, then splice its opposite darts at deleted crossings. Use the smallest original arc label for each resulting segment. The resulting \(A\) rows, with original numbers \(5,7,13,16\), are \((24,20,5,19),(9,5,14,9),(14,20,16,21),(16,24,19,21)\). Remove the row 7 monogon, then the row 5–13 bigon, giving the single row \((16,16,19,19)\), a removable curl. The two standalone \(C\) rows \(19,20\) are \((27,27,28,36),(28,33,33,36)\). Remove row 19 and then the remaining curl \((28,33,33,28)\). These computations on a standalone component can use either the original or the red-blown-down diagram, since the short cut-and-spliced arcs through the red disk are the same when the other component is deleted.

The local arm64 Python 3.10 environment had no Sage, SnapPy, Spherogram or Regina executable or import, and a PyPI header request failed DNS before receiving bytes. The lead's SageMathCell run supplies the verified computation. Official Dataverse file provenance and signed friend transport have their own intake scope. Nothing in the peripheral match supplies a smooth slice disk.
