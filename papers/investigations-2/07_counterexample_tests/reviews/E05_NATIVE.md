# WIT-E05 and WIN-E04 · Native disk and signed genus comparison

28 November 2026 UTC, 27 November in America/New_York. Prepared for Edward
B. Baker III with OpenAI Codex assistance. The [non-author dispatch](../research-progress/handoffs/REQUEST_E05_JOINT_R1.md)
specifies gpt-6.2-sol, ultra. Actual serving variant and effort unavailable.
Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. The dispatch and
[synthesis](../notes/WITNESS_COMPARISONS_20261127.md) have SHA-256 prefixes
`bf19e04074b88c02` and `e25933ca2c695585`. Inputs read include
[WEX-E04](../01_examples/notes/E04_NATIVE_SURFACE.md) at
`cd07e974baf73568` and its [cap replay](../01_examples/reviews/E06_CAP.md),
[WIN-E02](../02_invariants/notes/E02_GENUS_ENTRY.md) at `b434ef42ce03fba3`,
[WIN-E01](../02_invariants/notes/E01_GENUS_CONTROL.md) at `dedd5676476606d1`,
and the [one-belt proof](../notes/ONE_BELT_TRANSFER.md) at
`46bf46d6b09a223c` and [its replay](E05_SINGLE_BELT.md) at
`0ace801604e12011`.

**Disposition.** The native surface and both signed knot entries agree
with the original outward-oriented minus Miller–Schupp puncture. The
native disk supplies a nonlocal genus-zero control, and the separate
trefoil supplies the collar genus-one control. Both give equality
between native and standard four-ball genus. The individual belt
inequality gives a necessary test for a future strict genus saving.

| Knot in the positive model \(S^3\) | Native surface | \((N_1,N_2)\) | \(g_4\) | \(g_{\Sigma_P}\) | \(\tau\) | \(s_{\mathbb Q}\) |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| \(J\), the crossing-free clockwise latitude below | Disk through two sections of \(C_1\), with belt signs \(+1,-1\) | \((2,0)\) | 0 | 0 | 0 | 0 |
| \(T=\widehat{\sigma_1^3}\), positive right-handed trefoil | Pushed-in oriented Seifert surface in the puncture collar | \((0,0)\) | 1 | 1 | \(+1\) | \(+2\) |

## Original cap disk and signed boundary

The original signed seam is
\(((1+s)m(t),n)\leftrightarrow\Phi_i(t,(1+s)n)\) at \(s=0\),
where \(m(t)=(\cos 2\pi t,\sin 2\pi t)\). The first three-ball is the
extended disk times the arc \(n(v)=(\sin v,0,-\cos v)\),
\(|v|\le 1/32\). The cap and exterior use the same \(t,n\) and signed
radius, so the section disks in the cap continue across the original
seam. The second three-ball is the radius \(a=1/12\) chart ball about
\((0,0,a,0)\) in the positive \((X,Y,y_3)\)-slice. The WEX-E04
three-dimensional connecting handle turns its transverse disk from
the \((\partial_X,\partial_Y)\) plane to the
\((\partial_X,\partial_\theta)\) plane and has fixed endpoint planes.
In its graph chart, \(h<1\) puts
\((X-c_{1X})^2+(\phi-\pi/3)^2>(17/256)^2>(1/16)^2\), so the retained
meridian clears the removed first tube, including where it enters the
larger auxiliary coordinate chart. Its colatitude is below the second
tube and above the puncture, as in the original clearance check.
The endpoint coordinates at \(h=0\) satisfy
\(dX\wedge dY\wedge dy_3=(d-b)\,dh\wedge dx\wedge dz\);
at \(h=1\), their cap orientation \(ds\wedge dt\wedge dv\) has
coefficient \((d-b)/(2\pi\epsilon^2(1+s))>0\) in the same order.
These are the compatible orientations at the two attaching disks.
[Original seams](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#framed-handles-and-the-two-collar-identifications) · [WEX cap replay](../01_examples/reviews/E06_CAP.md)

The two punctured three-ball boundaries and the side annulus of the
connecting handle form the rounded embedded sphere. The local corner
roundings are away from the seam and the puncture circle, so the whole
sections \(D^2\times\{n(\pm1/32)\}\) remain. Along \(v=1/32\) and
\(v=-1/32\) the respective outward normals of the three-ball
are \(+\partial_v\) and \(-\partial_v\). The induced section
orientations are respectively \(+d\Re\zeta\wedge d\Im\zeta\) and its
negative. In the cap orientation, disk followed by the oriented sphere,
these signs are \(+1,-1\) against \(S_1=\{0\}\times S^2\). The sphere
misses \(C_2\). Deleting the small disk at the south tip of the local
chart sphere leaves the proper cap-crossing disk in \(W\).

On that chart sphere \(y_4=0\) and \(\rho^2=2ay_3\). Its lower
graph, oriented by the outward normal of the three-ball \(B\), has
surface orientation \(-d\rho\wedge d\alpha\) up to a positive scalar,
where \(\alpha\) is the polar argument of \((X,Y)\). For the retained
surface, the boundary normal points toward decreasing \(\rho\).
Contraction therefore gives the boundary orientation of increasing
\(\alpha\). The outward puncture marking
\(\iota(u)=\chi(rR(u))\) uses \(r=1/16\) and
\(R(u)=(-u_1,u_2,u_3,u_4)\), reversing the sign from the decreasing
ambient boundary normal. Apply \(R\) once to \(y/r\) and use \(r/(2a)=3/8\).
The resulting exact oriented model knot is
\[
 J(\alpha)=\left(-\frac{\sqrt{55}}8\cos\alpha,\,
                   \frac{\sqrt{55}}8\sin\alpha,\,
                   \frac38,\,0\right)
\]
with \(\alpha\) increasing. Stereographic projection from \(e_4\)
retains the first three coordinates on \(u_4=0\). The ordered
\((u_1,u_2)\) projection is the clockwise circle and has no crossings.
The angular straightening of WEX-E04 has time zero at \(\rho=r\)
and preserves \(\rho\), making the native collar a radial product on
this exact signed knot. The standard affine disk \(u_3=3/8,\ u_4=0\)
inside the unit ball is proper and with orientation
\(-du_1\wedge du_2\) has this same oriented boundary. Its radial
derivative at the boundary is nonzero, so it too admits radial collar
straightening fixing the circle. [Native boundary and collar](../01_examples/notes/E04_NATIVE_SURFACE.md#rounding-and-the-puncture)

## Genus, invariant signs and the separate collar control

Both \(J\) disks give genus zero because genus is nonnegative.
Ozsváth–Szabó Corollary 1.3 and Rasmussen Theorem 1 then give
\(\tau(J)=s_{\mathbb Q}(J)=0\) from standard \(B^4\).
For \(T\), the oriented closure of \(\sigma_1^3\) has one component,
three positive crossings and two Seifert circles. The two disks and
three positive bands have Euler characteristic \(-1\). Push their
interior into the inward collar by the graph of a small boundary-defining
function. In the actual puncture the collar
\((u,s)\mapsto\chi((r+s)R(u))\), \(0\le s\le r/2\), is the original
mark at \(s=0\) and stays off both caps. The preassigned mark is
orientation-preserving, so the transported surface has the positive
trefoil as its boundary in the model. The same construction works in
standard \(B^4\). [WIN-E01, positive two-braid control](../02_invariants/notes/E01_GENUS_CONTROL.md#the-positive-two-braid-control)

I checked Ozsváth–Szabó, *Knot Floer homology and the four-ball genus*,
Geom. Topol. **7** (2003), 615–639, arXiv:math/0301149, Theorem 1.1,
Corollaries 1.3, 1.5 and 1.7, and Lemma 3.3. Corollary 1.7 gives
\(|\tau(T_{2,3})|=1\). Changing a positive crossing of \(T\) to negative
leaves the closure of \(\sigma_1\) after cancellation, an unknot. The
monotonicity in Corollary 1.5 with \(\tau(J)=0\) for the unknot thus
gives \(\tau(T)\ge0\), fixing \(\tau(T)=+1\).
Theorem 1.1 requires an oriented smooth filling of the oriented \(S^3\)
with \(b_1=b_2^+=0\). The original coordinate puncture is an integral
homology ball by excision and the long exact sequence of the pair
\((\Sigma_P,W)\), using the fundamental class in degree four, and
\(H_2(W,\partial W;\mathbb Z)=0\) by duality. Both surface-class terms
in the inequality therefore vanish. This gives \(\tau(K)\le g(F)\)
for each proper spanning surface there. On reversing \(W\) use
\(\iota\circ R\), so the model boundary becomes the mirror and Lemma
3.3 supplies the opposite sign, giving \(|\tau(K)|\le g(F)\).
For \(T\) the lower bound in this puncture and in standard \(B^4\)
is one. [Ozsváth–Szabó primary text](https://arxiv.org/pdf/math/0301149)

I checked Rasmussen, *Khovanov homology and the slice genus*,
arXiv:math/0402131v1, the rational-coefficient convention on p. 2,
Theorem 1 and its proof in §4.4, and the positive-diagram computation
in §5.2. For \(T\) the latter gives \(s_{\mathbb Q}=3-2+1=+2\),
independently bounding the standard genus by one from below.
The bound on the native puncture above uses the Floer theorem, while
the Rasmussen theorem here is the standard-ball statement.
[Rasmussen primary text](https://arxiv.org/pdf/math/0402131v1)

## Native implication and both belt tests

Consider a compact connected oriented proper smooth spanning surface
\(F\) of genus \(g\) for a signed \(K\) in the original marked \(W\).
If a standard-ball lower bound \(L\) gives \(L>g\), chart independence
and the oriented standard-sphere calibration contradict diffeomorphism
of \(\Sigma_P\) with \(S^4\). A diffeomorphism to \(S^4\) can be made
orientation-preserving by a standard reflection. The missed-belt
transfer preserves the puncture and the exact signed knot because
the cap replacement outside its belt uses the original \(\Phi_i\)
on the seam and is the identity near the marked ball. Its auxiliary
surgery is disjoint from the surface in the common exterior. The
separate replay checks the product surgery recognition of the
auxiliary ambient sphere. Together with oriented tubing of opposite
intersections this gives \(g_4(K)\le g+N_i/2\) for each \(i\)
when \(F\) is transverse to that belt. Hence \(N_i\ge2(L-g)\)
at **each** belt, with both signs there because the algebraic count
vanishes. This is a necessary condition for the strict saving.
[Marked calibration](../02_invariants/notes/E01_GENUS_CONTROL.md#standard-sphere-and-naturality) · [Separate belt replay](E05_SINGLE_BELT.md)

For \(J\), belt 2 is missed, so the individual bound there gives
\(g_4(J)\le0\), in agreement with the explicit affine disk. Belt 1
would give only \(g_4(J)\le1\) for this particular native disk. For
the separate \(T\) surface both belts are missed, and each bound gives
\(g_4(T)\le1\), matching the primary lower bound. The \((2,0)\)
construction and \((0,0)\) control both have zero genus gap. A strict
test for the actual minus sphere would require another marked knot
and a genus-saving surface meeting both belts.
