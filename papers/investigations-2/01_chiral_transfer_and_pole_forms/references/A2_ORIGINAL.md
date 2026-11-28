# A2 source audit — Gromov’s relative splitting

27 November 2026. Prepared for Edward B. Baker III by the Codex S02 reader.
The packet was routed as `gpt-6.2-sol` at ultra. Actual model variant and
reasoning effort are unavailable to this reader. Baseline `6a422ce`. Inputs are
the [S02 packet](../research-progress/handoffs/REQUEST_REPLAYS_R1_20261127.md)
and [proposal §3.3](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md#33-the-criterion).

## Primary source and scope

**Import.** M. Gromov, *Pseudo holomorphic curves in symplectic manifolds*,
*Inventiones Mathematicae* **82** (1985), 307–347,
DOI `10.1007/BF01388806`, bibliography key `Gromov1985PseudoHolomorphic`.
I inspected the relevant passages in the published journal scan supplied on
[Gromov’s IHÉS page](https://www.ihes.fr/~gromov/symplecticmanifolds/160/)
on 27 November 2026. The passages were available through the web PDF viewer.
Local PDF retrieval failed at DNS, so there are no local size or hash values.
This is a checked-passage reading. The packet’s separate McDuff–Salamon 2012
Theorem 9.4.2 check belongs to E02.

- The open-manifold theorem in §0.3.C assumes a symplectic diffeomorphism at infinity
  with \((\mathbb R^4,dx_1\wedge dy_1+dx_2\wedge dy_2)\) and vanishing of
  \(\pi_2(V)\to H_2(V;\mathbb R)\). It defines a diffeomorphism at infinity
  as one between complements of compact sets. The theorem sentence gives
  global symplectic equivalence, and the preceding sentence points to §2.4.A₂
  for the argument. Agreement with the prescribed chart is supplied by the
  relative splitting passage below.
  [p. 311, PDF page 5](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/945.pdf#page=5)
- For a smooth closed symplectic four-manifold, §2.4.A′₁ assumes two embedded
  symplectic spheres \(S_1,S_2\) with trivial normal bundles, meeting
  transversely at one point with intersection sign \(+1\) for their
  symplectic orientations. Every smoothly mapped sphere must have area
  \(k\int_{S_1}\omega=k\int_{S_2}\omega\) for an integer \(k\) depending on
  the map. The argument uses two families of rational curves and a Moser
  homotopy to obtain a symplectic product of the two equal-area spheres.
  In the case of a neighborhood already split, §2.4.A₂ expressly allows
  “an extension of this splitting to \(V\).” Thus the prescribed product
  identification near \(S_1\cup S_2\) extends, with the neighborhood shrunk
  if needed. The complement of the two spheres in the split product is a
  product of symplectic disks.
  [p. 337, PDF page 31](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/945.pdf#page=31)

As a cross-check on the relative reading, Lalonde and McDuff state the
identity-near-the-wedge conclusion on an already identified \(S^2\times S^2\)
in §5.1, Theorem 5.1 of *J-curves and the classification of rational and ruled
symplectic 4-manifolds*, in *Contact and Symplectic Geometry* (Cambridge
University Press, 1996), 3–42. The proof distinguishes a map that fixes the
wedge from the final adjustment that makes it the identity on a neighborhood.
That theorem’s statement assumes the product as a smooth manifold. The
argument below uses Gromov’s criterion on the glued manifold without that
assumption. [Passage in the authors’ text](https://paperzz.com/doc/8143461/j-curves-and-the-classification-of-rational-and-ruled)

## Passing from the fixed splitting to the fixed Euclidean end

**Project deduction from the import.** Let \((X,\omega)\) be a connected
smooth open symplectic four-manifold with a prescribed symplectic end chart
\(e\) onto the exterior of a round ball in \((\mathbb R^4,\omega_0)\). The
chart is co-compact in the sense that each sufficiently far-out tail has
compact complement. Suppose \(\int_{S^2}f^*\omega=0\) for all smooth
\(f:S^2\to X\). Then there exists a global symplectomorphism
\(F:X\to\mathbb R^4\) equal to \(e\) on some tail of that end.

1. Choose a round truncation in the end and a much larger open polydisc
   \(P_L=D^2(L)\times D^2(L)\) containing the truncation and its collar.
   Take the symplectic product \((Y_0,\Omega_0)=(S^2\times S^2,\sigma\oplus\sigma)\)
   with each factor of area \(A=\pi L^2\). The complement of the wedge
   \(D=(S^2\times\{q\})\cup(\{q\}\times S^2)\) is identified with \(P_L\)
   by two punctured-sphere area coordinates. For example the round area form
   scaled to \(A\) in the stereographic coordinate \(w\) is
   \(L^2(1+|w|^2)^{-2}d\operatorname{Re}w\wedge d\operatorname{Im}w\),
   the pullback of disk area by \(w\mapsto Lw/\sqrt{1+|w|^2}\).
2. Replace the round truncation ball in \(Y_0\) by the compact core of
   \(X\), using \(e\) on an annular collar. Both forms are \(\omega_0\) on
   that collar, so this gives a smooth closed symplectic manifold
   \((Y,\Omega)\). The wedge retains its prescribed split neighborhood in
   \(Y_0\). The two sphere orientations are their factor area orientations,
   their product normal bundles are trivial, their transverse intersection
   has sign \(+1\), and both areas are \(A\).
3. For the period hypothesis of §2.4.A′₁, make a smooth sphere map into \(Y\)
   transverse to the gluing \(S^3\). Cut the domain along the inverse-image
   circles and cap each boundary with a disk mapped into the gluing sphere,
   possible since \(\pi_1(S^3)=0\). Every capped component has domain \(S^2\).
   Choose the same disk on each side of a cut with opposite orientation,
   so the disk integrals cancel when the component periods are added.
   Components in the core have zero period by the hypothesis on \(X\).
   Components in the cap have period in \(A\mathbb Z\) by the homology of
   \(Y_0\). The glued sphere thus has period in \(A\mathbb Z\). For A2
   specifically, the same test follows from Mayer–Vietoris:
   \(H_2(X;\mathbb Z)=0\) gives \(H_2(Y;\mathbb Z)=\mathbb Z[S_1]\oplus\mathbb Z[S_2]\).
4. The relative extension in §2.4.A₂ gives a symplectomorphism from \(Y\) to
   \(Y_0\) that is the given identification near \(D\). Remove \(D\). This is
   a map from the portion of \(X\) truncated by the outer polydisc onto
   \(P_L\). The region of agreement contains the exterior in \(P_L\) of
   some smaller closed concentric polydisc, since the complement of the
   fixed neighborhood is compact and disjoint from \(D\). On that overlap
   the map is \(e\) in the area coordinates fixed in step 1. Paste it with
   \(e\) on the exterior of the smaller polydisc. The inverses agree on the
   same overlap, yielding the global symplectomorphism and exact agreement
   on a co-compact tail of the original end.

For A2, excision in the pair \((M,M\setminus\{p\})\) gives
\(H_2(X;\mathbb Z)=0\) for a homotopy four-sphere. Once the E02 cut-off gives
a symplectic form standard in the chosen oriented end coordinates, this
deduction supplies the prescribed agreement needed for the smooth extension
over \(p\). The analytic cut-off and the smooth extension in the project’s
normalization are the separate E02 calculations.
