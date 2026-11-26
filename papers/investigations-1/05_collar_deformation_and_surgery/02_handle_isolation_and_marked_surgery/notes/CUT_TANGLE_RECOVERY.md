# Recovering a framed slide from the two-point cut

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. SUR-B04/E02n, [issue 1](../../research-progress/handoffs/EXTERIOR_RECOVERY_AND_NATIVE_CAPS_20261126.md).
The packet specifies a GPT-6.2 Sol/ultra execution helper. Independent serving
model and effort telemetry is unavailable. Scientific intake
`8471728a1549614f155a8751c709904cbcf994d6`. This is a smooth oriented
relative trace calculation for one marked representative at \(n=1\).

## The framed cut tangle

Write \(Y_r=\#_r(S^1\times S^2)\). The inlet \(Y_1\) is the actual zero-surgery
on the initial split unknot \(A\) attached to \(D^4\). Take the one-period
representative of the generator family with product entrances, and cut its
inlet at the horizontal sphere \(S=S^2\times\{1/2\}\). Use
\(W=S^2\times[-1/2,1/2]\) for the resulting slab and \(S_-,S_+\) for
its two faces. A ball \(B\subset S^2\times(-1/4,1/4)\) contains the
stationary square knot \(Q\). The moving knot \(K_1\) gives one returning arc
\(R\) on \(S_-\) and one returning arc \(V\) on \(S_+\). Indeed the
lift joins the upper mouth at height near \(0\) to the lower mouth at height near
\(1\), and each leg crosses the cut level once. The same two marked points
\(p_0,p_1\) are on both faces. Use their short joining arc \(c\) in the
marked port disk, with copies \(c_-,c_+\) that agree under face gluing.
[One-period entrances and cyclic lift](LIFTED_LINKS_AND_SPHERES.md) ·
[One-turn diagram and framing](GENERATOR_BAND_PAIR.md)

The following coordinates specify the tangle input. They use the product
entrance option in the frozen family. Near the port take a disk coordinate
\((x,y)\) in which the two strands are \((0,-w)\) and \((0,w)\) in each
cross-section, with \(w>0\) small, and use the interval between them as \(c\).
Away from the mouths this follows by straightening the marked family of
sections in the slab. At the stationary mouth use the zero-framed
tubular chart \(q(s,r,\theta)\) for \(Q\), with \(s\in\mathbb R/\mathbb Z\),
\(\nu Q=\{r\le r_0\}\) and room in the collar for \(r_0<r_1\).
Fix the azimuth \(\theta_0\) of the observed returning strand and put
\(\lambda_r(s)=q(s,r,\theta_0)\). On that collar \(R\) follows
\(\lambda_{r_1}\) along \(J=\overline{S^1\setminus G}\), where \(G\) is the
interior of the short mouth interval, and then exits on the two rails to
\(p_0,p_1\in S_-\). Thus the return follows a single longitude except at
the mouth. The entire collar lies in \(B\) and misses \(V\).

Use a product box at the mouth and along the rails. Its middle rectangle
is specified by the two rail positions in each transverse product disk.
In a disk identified with a planar disk, for rail positions \(z_0(v)\)
and \(z_1(v)\), use
\[
 z(u,v)=(1-u)z_0(v)+u z_1(v),\qquad 0\le u,v\le1 .
\]
The disks have distinct product parameters \(v\) and the two rail positions
are distinct in every disk. The end segments are
\(\lambda_{r_1}|_{\overline G}\) and \(c_-\). This gives an embedded
rectangle \(C_-\) in \(W\setminus\operatorname{int}\nu Q\).
For the concrete product-entrance representative the box runs outwards
from \(\{r=r_1\}\) at the mouth, meeting the radial collar strip only
along its end segment. The long sections of the two entrance boxes lie in
the oppositely directed half-corridors of the slab. Inside \(B\) one
chooses disjoint access corridors from the two mouths to their distinct
ports, taking both boxes sufficiently thin. This is the pair of product
fingers allowed in the one-period construction. With corners rounded,
the rectangles meet their respective cores exactly along the rails.
The upper box \(C_+\) is given by the same transverse interpolation with
end segments \(c_+\) and the short mouth arc on the other component in
\(B\). Closing \(V\) by \(c_+\) and pushing across \(C_+\) identifies the
completed component with the actual unknotted partner \(U\) in Figure 5
relative to \(Q\).
[Product corridors and separation](GENERATOR_BAND_PAIR.md#place-the-pair-and-route-one-band) ·
[Gompf–Scharlemann–Thompson, §2 and Figure 5, p. 2310](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=6)

## Peripheral annulus and a local band

Test the stationary collar for a returning arc that projects to a
longitude with one gap. Test the two rails at the gap by spanning their
product sections to the port. On the above input these checks give the
radial annulus
\[
 {\cal A}_0=\{q(s,r,\theta_0):s\in S^1,\ r_0\le r\le r_1\}
\]
and the rectangle \(C_-\). They meet exactly along
\(\lambda_{r_1}|_{\overline G}\), a boundary interval of each surface.
After rounding the seams their union is the embedded annulus
\[
 {\cal A}={\cal A}_0\cup C_-,\qquad
 \partial{\cal A}=\lambda_{r_0}\ \sqcup\ (R\cup c_-)
 \quad\text{in }W\setminus\operatorname{int}\nu Q.
\]
Its interior is disjoint from both moving arcs and from the two faces.
The longitudinal boundary is the actual integral surgery slope on
\(\partial\nu Q\). Drilling the moving tube as well truncates the annulus
along \(R\). With sufficiently small tubes the other boundary then
consists of a trace on the moving tube and the truncated arc on the
punctured face \(S_-\). This clipping follows from a product normal
neighborhood along the edge \(R\), including the two port corners. The
construction identifies a peripheral annulus by the positions of the
marked curves in the cut exterior.

Choose a small closed interval \(I\subset\operatorname{int}J\) and choose
\(r_0<r'<r_1\). The rectangle
\[
 D_I=\{q(s,r,\theta_0):s\in I,\ r'\le r\le r_1\}
\]
is a band from a subarc of \(R\) to the stationary framed parallel
\(\lambda_{r'}\). Its interior avoids both link cores and the cut faces,
and it lies in the stationary collar entirely away from the two access
rails. Use the orientation on \(\lambda_{r'}\) opposite to the orientation
of the completed return under the annulus. Truncate \({\cal A}\) at
\(r'\) and remove the band with its two open attaching edges. The closure
of the complement of the band in the annulus is a disk: the band joins the
two boundary components, so cutting along it opens the annulus into a
rectangle. Its boundary is the band-summed returning arc together with
\(c_-\). The disk is embedded in the unfilled stationary exterior and its
interior misses the remaining moving arc. Push the slid return over this
disk to a short push-off of \(c_-\). After the faces are identified,
push over \(C_+\) to recover the local pair \((U,Q)\). Collars on the two
faces allow these interval pushes to be performed before seam smoothing.
They take place away from the stationary attaching tube.

The entire first band selection uses the actual marked longitude, the
visible parallel section of \(R\) and the port test. The band is a radial
rectangle inside \(B\), specified entirely within the marked cut tangle. An
equivalent filled description caps \({\cal A}\) by the actual longitude
meridian disk after \(Q\)-surgery. That gives an embedded disk from
\(R\) to \(c_-\), and a small family of parallel disks is available using
the filling-torus parameter and the product neighborhoods at the seams.
The annulus in the cut exterior and its slit version check the move
before any use of the filled description.

The slide uses the supplied framing of \(Q\). The zero self-framings
of \(K_1,Q\) and their zero pairwise linking can also be checked on the
fixture. The \(U,Q\) pair is zero-framed and algebraically unlinked by
the Figure 5 calculation and Proposition 2.2. Closing the two cut arcs
with opposite copies of \(c\) expresses the homology class of \(K_1\)
in the stationary exterior as the sum of the two completed arcs there.
The completed \(V\) is \(U\) and the completed \(R\) is homologous to
a signed zero-framed parallel of \(Q\), so \(\operatorname{lk}(K_1,Q)=0\).
The input framing of \(K_1\) is the supplied framed-sum framing of the
one-period fixture. Its coefficient is zero by the same linking
calculation for the two summands \(U\) and the framed parallel of \(Q\).
For null-homologous components this coefficient calculation applies in
\(Y_1\): a band-sum pair of pants and its disjoint framed push-off make
the self-linking of the sum equal to the sum of self-linkings plus the
two signed mixed linking terms. Linking is well defined since both
components represent zero in \(H_1(Y_1;\mathbb Z)\). Applying this to
\(D_I\) gives coefficient \(0+0-2\operatorname{lk}(K_1,Q)=0\) for
the recovered moving tube. The disk and collar isotopies carry the
full tube, yielding \(U\) with its disk framing after a framed tube
identification. The second slide is the published local slide of
\(Q\) over this \(U\), followed by its splitting isotopy in \(B\).
The result is the split zero-framed unlink in \(B\).
[Gompf–Scharlemann–Thompson, §2, pp. 2308–2311, Figure 5 and Proposition 2.2](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=4)

## Relative maps and handle count

For the first slide take \(Q\) first. In its filled boundary join
the longitude meridian disk to \(\lambda_{r'}\) by the radial annulus
from \(r_0\) to \(r'\). Attach \(D_I\) to this enlarged disk along its
short edge on \(\lambda_{r'}\). The resulting disk sweeps the attaching
arc on \(R\) to the band-summed arc and misses the rest of the moving
knot in its interior. Parallel disks in the filling parameter and
along the framed band give that sweep on the moving tube. Follow
it by the isotopies across the slit annulus and \(C_+\) to the local pair.
For the second slide take \(U\) first and use the framed isotopy in its
filled boundary. These height exchanges are available for disjoint
incoming tubes. In each case extend the moving-tube isotopy to an ambient
isotopy \(J_t\). The trace map is the identity up to and through the
anchor, \((y,t)\mapsto(J_{\eta(t)}y,t)\) on the next product collar
with \(\eta\) constant near its ends, and the identity in the remaining
handle coordinates using the transported attaching parametrization.
Its inverse on the collar uses \(J_{\eta(t)}^{-1}\) and uses the inverse
tube identification at the next handle. Include the final local
splitting isotopy with the same convention. The composition \(F\) is a
trace diffeomorphism relative to the incoming collar. If the ordered
factorization is \(F=F_2F_1\) with the reordering and splitting included,
then \(F^{-1}=F_1^{-1}F_2^{-1}\). Write \(P=\partial_+F\).
[Relative slide model](GENERATOR_BAND_PAIR.md#undo-the-band-and-track-the-closing) ·
[Milnor, §5, Theorem 5.8, isotopy extension for a compact submanifold](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=68)

For every later parametrized tube \(T\) at the block outlet take
\(T'=PT\), with inverse \(T^{-1}P^{-1}\) on its image. Extend \(P\)
over that handle in identical handle coordinates and repeat at any later
level. If additional index-two tubes were drawn in the inlet disjoint
from the two attaching tubes, place the block first and read those
tubes at the outlet via the common exterior. Transport them there by
the same formula, so their original placement may cross the recovered
band in the inlet picture. At the final outlet write \(\widetilde P\)
for the extended map
and \(\gamma\) for the original closing to the upper body. The new
closing is \(\gamma'=\gamma\widetilde P^{-1}\), with inverse
\(\widetilde P\gamma^{-1}\). The glued map is \(F\) with the corresponding
transport on later handles and the identity on the lower and upper
pieces. Its inverse uses the inverse relative maps and the same
identities. When the block closes immediately, \(\widetilde P=P\).
For an immediate closing and each original outgoing face \(o_i:D^2\times S^1\to\partial_+C\),
the original dual tube \(\gamma o_i\tau\), with factor exchange
\(\tau(v,z)=(z,v)\), is represented as
\(\gamma'(Po_i)\tau\). Its inverse on its image is
\(\tau^{-1}o_i^{-1}P^{-1}(\gamma')^{-1}\). After later handles this identity uses the extended final outlet map and faces actually present there. The geometric
cancellation intersections use the dual cores of the returned split
diagram. The old dual tube markings are tracked by the displayed
formula.

For the terminal one-sided test the lower piece after both slides is
\(\natural_3(S^2\times D^2)\) from the initial \(A\) and the two
returned split unknot attachments. The outlet is \(Y_3\), closed by
the actual rank-three upper body \(H_3=\natural_3(S^1\times D^3)\).
The three capped disk spheres in the outlet are disjoint and each
meets its corresponding returned dual core transversely once and
misses the other two. Choose the upper product marking \(\lambda\)
with these as the distinct reverse 1-handle belt spheres, and the
same gluing orientation as \(\gamma'\). The discrepancy
\(\lambda(\gamma')^{-1}\) extends over \(H_3\); its inverse has the
inverse boundary discrepancy. Three geometric 2/3 cancellations
now give \(n_2=n_3:3\to2\to1\to0\), leaving the standard \(S^4\).
The recovered pair accounts for the first two cancellations, and
the initial \(A\) for the third. Both slides keep the handle counts
and there are zero stabilizations. For an interior block the result
is its relative trace equivalence with transported residual tubes.
A net cancellation there requires the corresponding upper
geometric intersections after transport.
[Laudenbach–Poénaru, Theorem A and the boundary-extension step, pp. 337 and 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=7) ·
[Milnor, Theorem 5.4, a single transverse intersection](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=53)

## Evidence scope

The complete check uses a fixed cut of the one-period fixture with its
marked ports and stationary tube. The part of the exterior test that could
be applied to another input is the existence of the peripheral annulus
with the specified ends and disjointness, together with an exposed band
site on that annulus. In this fixture its existence follows from the
radial and ruled coordinates. A further two-point cut would require a
geometric check of the annulus, the framing and the local link type on
the opposite side. Figure 5 was inspected directly on
26 November 2026 for the inherited second slide. The §2 framing
convention, the indicated upper extension, and Milnor's one-intersection
criterion were checked at their cited passages.

Scientific working copies matched the intake byte-for-byte. SHA-256
prefixes are recorded below.

| Input | SHA-256 prefix |
| --- | --- |
| [Issued packet](../../research-progress/handoffs/EXTERIOR_RECOVERY_AND_NATIVE_CAPS_20261126.md), working issue | \(1f4b94e43838\) |
| [Lifted links and spheres](LIFTED_LINKS_AND_SPHERES.md) | \(6325b628f09a\) |
| [Generator band pair](GENERATOR_BAND_PAIR.md) | \(e88a6a83dd98\) |
| [GST pair move](GST_PAIR_MOVE.md) | \(4b6467e4c2b3\) |
| [Marked handle-cut manuscript](../manuscript/recognition_from_marked_handle_cuts.tex) | \(ea9165de0369\) |
| [Nonlocal and physical transport assessment](../../reviews/NONLOCAL_BANDS_AND_PHYSICAL_TRANSPORT_20261126.md) | \(51b3b161e487\) |
