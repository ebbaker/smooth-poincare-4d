# Odd framing as surgery on a section of a two-lens-space bundle

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Actual lead model and effort unavailable. The [even filling](ORDER_SEVENTEEN_FRAMINGS.md) and [odd tangle presentation](E70_EQUIVARIANT_SURGERY.md) use the original \(Q_8\times C_{17}\) prism marking. All manifolds and isotopies here are smooth. Lens-space signs below use the surgery orientation recorded by E86–E87.

**Reduction.** The unknown odd homotopy four-sphere is obtained by framed surgery on a particular section of a smooth bundle over \(S^1\) with fibre \(L(7,2)\#L(7,2)\). The unpointed return has order four and interchanges the two lens summands. The marked return has infinite order on the *based* fundamental group. This difference excludes a surgery confined to the suspended neck or a single prime piece. It also prevents applying the classification of cyclic lens-space cables to this knot pair.

## Recovering the smooth fibre and the particular section

Let \(W_1\) be the intermediate after the second stage of the \(a+\mu\) surgery. The principal orbit \(h\) has degree four in \(H_1(W_1)=\mathbb Z\). Average a closed one-form representing the integral degree generator over the locally free circle. It remains in the same integral class. Its contraction with the action field is constant by Cartan's formula and equals four with suitable orientation and period one. Integration therefore gives an equivariant submersion to \(S^1\); the primitive class gives connected fibres. Quarter-period rotation induces an order-four return. A fibre is the smooth fourfold cyclic orbifold cover of the intermediate three-orbifold. In the regular replacement \(S^1_\mu\times D^2\times S^1_f\) an exact invariant adjustment makes the map \(\mu+4f\) near its core (angles in turns). This makes the actual inverse-surgery circle \(\delta\) a section in its given product framing. [Local proof](E84_ODD_INTERMEDIATE.md) · [independent smooth replay](../reviews/E85_ODD_INTERMEDIATE_REPLAY.md).

The orbit group is
\[
G_1=C_4*_{C_2}D_{14}
=\langle q,c\mid q^4=c^2=(cq^2)^7=1\rangle.
\]
Its abelianization is \(C_4\). Choose \(q\mapsto-1,\ c\mapsto2\), so that the actual meridian \(L=qc\) maps to \(1\). Put \(r_0=cq^2,\ r_1=qr_0q^{-1}\). The smooth fibre group is \(\langle r_0\rangle*\langle r_1\rangle=C_7*C_7\). Indeed conjugation by \(q\) sends \((r_0,r_1)\) to \((r_1,r_0^{-1})\). The total group is the pullback of \(G_1\to C_4\) along \(\mathbb Z\to C_4\); lifting determines the central exponent uniquely from the degree. In particular \(L=r_1q^{-1}\) and
\[
L^4=r_1r_0r_1^{-1}r_0^{-1}.
\]
This cyclically reduced commutator has infinite order. In the fourfold product cover the lifted surgery curve has class \(([r_1,r_0],1)\). It is not conjugate into either prime product or the neck. A neck fixed setwise in the unpointed fibre does not make the marked section disjoint from it.

## Determining the lens parameters

In the actual E70 tangle, stop before filling the outer pillowcase. The resulting inner group is \(C_4*C_2\). The two translations \(d_2,f\) on the pillowcase map to \(r_0^2,r_0^{-1}\); \(r_0\) has infinite order there. Its smooth index-four cover has two torus boundaries, each carrying the translation lattice. Each torus has primitive kernel \(\alpha=d_2+2f\); the two copies are related by the deck group. The cover has free fundamental group of rank two. The loop theorem and disjoint compressions of these nonseparating meridian disks cut off both generators. Capping the sphere boundaries of the remaining simply connected piece yields a smooth \(S^3\); equivalently the inner region is the interior connected sum of two solid tori. In the oriented basis \((\alpha,-f)\) on each boundary the outer attachment is \(2d_2-3f=2\alpha+7(-f)\). This is \(+7/2\) unknot surgery on each side, hence the oriented fibres are \(L(7,2)\#L(7,2)\) in the stated convention. This determination uses the actual compressions and marked slopes. [Geometric computation](E86_ODD_LENS_FACTORS.md) · [independent peripheral check](../reviews/E87_ODD_LENS_TORSION.md).

## The published cable comparison and its limit

Teragaito's Lemma 2 on pp. 60–61 requires punctured lens factors cyclically permuted by the monodromy of the punctured fibre. The general theorem on p. 61 states an ambient and a knot-pair conclusion for any resulting lens-sum fibre in a homology sphere. In the proof, uniqueness of the closed prime decomposition is used to arrange the cyclic factor picture. The addendum on p. 953 establishes independence of the section for a single lens space with odd cyclic group and inversion. There, all primitive-degree sections are conjugate; the actual section here projects to the hyperbolic word \(qc\) in the amalgam. [Original paper, pp. 58–61](https://doi.org/10.18910/5691) · [addendum](https://doi.org/10.18910/12904).

There is a test of the claimed knot-pair conclusion which allows a diffeomorphism to change fibrations. For a 2-twist spin of a two-bridge knot its meridian square is central. For its \(d\)-cable the companion meridian is the \(d\)-th power of the cable meridian, so the \(2d\)-th power is central. A common power stays central in a finite connected sum by the meridional amalgamation. Having some nonzero central meridian power is invariant under a group isomorphism preserving the peripheral meridian up to conjugacy and inversion. For the knot obtained by surgery on \(\delta\), *no* nonzero meridian power is central, by the free-product commutator above. Thus the listed knot types cannot identify this marked pair. This provides a concrete gap in using the general theorem for the ambient conclusion here. The computation does not disprove ambient standardness. [Primary-source and marking audit](../reviews/E88_TERAGAITO_HYPOTHESES.md) · [independent cable comparison](../reviews/E89_CABLE_SOURCE_REPLAY.md).

## Continuation on the odd ambient sphere

Use the two punctured \(+7/2\) surgery solid tori and their exchanged neck as input to a **relative four-dimensional handle diagram** of \(W_1\). Place the inverse-surgery section with word \(r_1q^{-1}\) on that diagram, retain its product normal framing, and attach the actual surgery handle. In the fourfold cover a proposed localization must transport the commutator \(r_1r_0r_1^{-1}r_0^{-1}\). A successful cancellation can change the knot pair as long as it identifies the smooth closed ambient sphere. The earlier [meridian computation](E82_MERIDIAN_RELATORS.md) gives algebraic slides only.
