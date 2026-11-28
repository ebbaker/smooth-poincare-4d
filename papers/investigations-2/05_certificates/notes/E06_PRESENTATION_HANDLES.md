# Five-dimensional handles for the minus Miller–Schupp presentation

27 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Frozen target SP4-CERT-E06, request 1, source generation 6a422ce7814f. The launcher recorded GPT-6.2 Sol with ultra reasoning effort. Serving settings beyond the launcher are unavailable. The scope is one smooth, outward-oriented boundary. [Request](../research-progress/handoffs/REQUEST_CERT_E06_20261127.md) · [Data](../numerics/e06_handles.json) · [Checker](../numerics/e06_check.py) · [07 attaching maps](../../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md)

## One zero-handle and its two one-handles

**Project construction, working.** Write \(D^m\) for the closed unit ball and let \(a_x=-1\), \(a_y=1\). In the oriented \(XY\)-plane use \(F=\overline D_4(0)\setminus(D_{1/4}(-1,0)\cup D_{1/4}(1,0))\) and put \(V=F\times D^3\), oriented in order \(X,Y,z_1,z_2,z_3\). Take the rounded boundary with its outward-normal-first orientation.

Here is a rounding in the allowed neighborhood from 07. Let \(b(q)\) be the minimum of the three inward distances to the boundary circles of \(F\), and \(d(z)=1-|z|\). For \(0\le h<1\) put \(\psi(h)=\exp(-h/(1-h))\), with \(\psi=0\) for \(h\ge1\). Keep the part of \(V\) where \(\psi(b/\delta)+\psi(d/\delta)\le1\), with \(\delta=1/128\). Each active distance function is smooth near a corner. The new defining function has nonzero gradient on the corner arc and joins the old faces smoothly by flatness of \(\psi\) at \(1\). The rounding lies in distance \(\sqrt2\,\delta<1/64\) of \(\partial F\times S^2\).

For \(a\in\{a_x,a_y\}\) and strip half-width \(d_a=1/8\), the strip times \(D^3\) is the one-handle. Its product chart is
\[
 U\in[-1,1],\quad s\in[0,1],\quad z\in D^3,\qquad
 X=a-d_a U,\quad
 Y=(1-s)\sqrt{(1/4)^2-(X-a)^2}+s\sqrt{16-X^2},\qquad z=z.
\]
The zero-handle is the closure of the complementary planar region times \(D^3\). The two strips open the holes to the outer circle, so its planar boundary consists of a single simple piecewise-smooth curve. In its boundary, the two feet of each handle are the \(U=-1\) and \(U=+1\) restrictions of the displayed chart. The gluing maps send \((s,z)\) to the same \(X,Y,z\) on the zero-handle. The \(-\) foot is on the right at \(X=a+d_a\) and the \(+\) foot on the left at \(X=a-d_a\). Apply the displayed rounding inequality to the common image coordinates on both sides of a foot. The planar disk assertion uses smooth planar Schoenflies after rounding the complementary planar curve, and the handle terminology uses the usual rounding of products of disks. These are background premises here.

Orient the strip by its parametrization into \(V\), which has negative Jacobian on \((U,s)\) since \(dX/dU=-d_a\) and \(dY/ds>0\). The two sides of each foot thus have opposite boundary orientations. Oriented travel from \(-\) to \(+\) reads the generator. The basepoint is \(q_0=(0,0)\) off both strips.

## Fourteen strands in the attaching boundary

**Project construction, working.** The positive based planar paths for \(x,y\) on \(v\in\mathbb R/\mathbb Z\) are
\[
 L_x(v)=(-1+\cos 2\pi v,\ \sin 2\pi v),\qquad
 L_y(v)=(1-\cos 2\pi v,\ -\sin 2\pi v).
\]
Set \(j(h)=\exp(-1/h)\) for \(h>0\) and \(j(h)=0\) otherwise. Put \(H(u)=j(u)/(j(u)+j(1-u))\) for \(0\le u\le1\). In slot \(k=0,\ldots,6\) of a component, with row entry \(a^\sigma\), set \(c_i(t)=L_a(\sigma H(7t-k))\) for \(k/7\le t\le(k+1)/7\). All junctions are smooth by the flat endpoints of \(H\). For inverse letters this prescription agrees with reversal in 07 by \(H(1-u)=1-H(u)\) and periodicity of \(L_a\). The specified feet appear in parentheses in this table.

| \(i\) | \(k=0\) | \(k=1\) | \(k=2\) | \(k=3\) | \(k=4\) | \(k=5\) | \(k=6\) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | \(x^{-1}\ (+,-)\) | \(y\ (-,+)\) | \(y\ (-,+)\) | \(x\ (-,+)\) | \(y^{-1}\ (+,-)\) | \(y^{-1}\ (+,-)\) | \(y^{-1}\ (+,-)\) |
| 2 | \(x^{-1}\ (+,-)\) | \(y\ (-,+)\) | \(x\ (-,+)\) | \(x\ (-,+)\) | \(y^{-1}\ (+,-)\) | \(x^{-1}\ (+,-)\) | \(x^{-1}\ (+,-)\) |

For either generator the core stays outside both holes and inside the outer circle. Its own strip catches precisely its upper arc across \(a-d_a\le X\le a+d_a\), because there \(Y=\sqrt{1-(X-a)^2}\) lies between the strip's lower and upper edges. Its lower arc lies below the strip, and its whole circle misses the other strip. The positive core moves left along this upper arc, with \(dX/d(2\pi v)=-Y<0\). To locate each foot crossing exactly, put \(\beta=\arcsin(d_a)/(2\pi)\), \(v_x=1/4\), and \(v_y=3/4\). For a positive strand, the entrance and exit happen at \(t=(k+H^{-1}(v_a-\beta))/7\) and \(t=(k+H^{-1}(v_a+\beta))/7\). For a negative strand use \(1-v_a\) in place of \(v_a\). The paths between traversals, including all returns to \(q_0\), are the complementary portions of the displayed \(L_a\).

Let \(p(\phi,\theta)=(\sin\phi\cos\theta,\sin\phi\sin\theta,\cos\phi)\), set \((\phi_1,\phi_2)=(\pi/3,2\pi/3)\), and use longitude \(\theta=2\pi t\). The exact two height coordinates over the projection to \(F\) are \((\phi_i,t\bmod 1)\). The two projected circles touch only at \(q_0\) and every repeated traversal of the same circle coincides in projection. For a nonbasepoint with positive parameter \(0<v<1\) the heights on a matching slot are
\[
 \left(\phi_i,\frac{k+H^{-1}(v)}7\right)\quad\text{or}\quad
 \left(\phi_i,\frac{k+H^{-1}(1-v)}7\right)
\]
for the positive or negative orientation, respectively. Over \(q_0\) the heights are \((\phi_i,k/7)\) for \(k=0,\ldots,6\). Consecutive endpoints at the same time are one junction on a component. These formulas resolve all projected overlaps in the four-dimensional attaching boundary, with the longitude read modulo one. The planar projection reads precisely \(x^{-1}y^2xy^{-3}\) and \(x^{-1}yx^2y^{-1}x^{-2}\). Projection to \(F\) induces the generator identification for \(V\) since the ball factor contracts.

## Framed handles and the two collar identifications

**Project construction, working.** The attaching chart, on \(z=(u,v,w)\) through radius \(5/4\), is
\[
 \Phi_i(t,z)=\big(c_i(t)+\epsilon(u,v),\ p(\phi_i+\epsilon w,2\pi t)\big),
 \qquad \epsilon=1/16.
\]
The planar displacements are at most \(5/64\). The distance to either hole center is at least \(1-5/64\), and the distance to the outer center is at most \(2+5/64\). Thus the whole chart lies off the rounding. The latitude bands have half-width \(5/64\), are mutually disjoint and avoid the poles. On such a band, angular longitude recovers \(t\) as a circle-valued smooth coordinate; the planar difference from \(c_i(t)\), divided by \(\epsilon\), and \((\phi-\phi_i)/\epsilon\) recover \(z\). This inverse proves that the enlarged charts are disjoint smooth embeddings, including at all repeated planar points and stationary planar junctions.

The selected framing is the transverse-quotient frame from the three \(z\) coordinates of \(\Phi_i\). In the coordinates \(X,Y,\phi,\theta\), \(\partial\Phi_i\) has the transverse directions \((\partial_X,\partial_Y,\partial_\phi)\) with positive factors. With the oriented tangent first, the orientation-compatible normal frame has directions \((\partial_X,\partial_Y,-\partial_\phi)\) modulo the tangent. Moving \(\partial_\theta\) past three directions gives an orientation-reversing gluing in the raw \((u,v,w)\) coordinates for the standard-oriented \(D^2\times D^3\). A representative for the other relative framing parity precomposes \(\Phi_i(t,z)\) with \((t,R_{2\pi t}z)\), the positive turn in the \(u,v\) plane fixing \(w\). This representative specifies the other convention on the same core. The data select the coordinate framing on both handles.

For the ambient Euclidean reference spin structure, the coordinate framing is the spin-extending one on both components. To compute the sign, take the adapted orthonormal frame on the core in order outward normal, oriented tangent, tangent-first normal frame. Scale the planar part of the tangent to zero and orthonormalize continuously. The determinant retains its sign because the \(\theta\)-component stays positive. At the endpoint the \(X,Y\) directions are constant and the other three directions are \(p,\ p_\theta/|p_\theta|,\ -p_\phi\), rotating once in the sphere factor. A full rotation in one plane lifts to a path with opposite endpoints in the spin double cover, as given by the half-angle lift. This is the same sign as the rotating radial and tangent frame on the edge of the handle disk. The compensating boundary orientation sign is constant along the edge. The extra full turn in the other framing multiplies the spin sign by \(-1\) and prevents extension of this reference spin structure. The quaternion double cover \(S^3\to SO(3)\) is simply connected upstairs and detects the two relative framing classes.

Attach the two copies of \(D^2\times D^3\) by \((e^{2\pi it},z)\mapsto\Phi_i(t,z)\) on \(S^1\times D^3\). Let \(E=\partial V\setminus\bigcup_i\Phi_i(S^1\times\operatorname{int}D^3)\). This retains all complement faces. In the closed boundary each free face \(C_i=D^2\times S^2\) attaches by
\[
 a_i(e^{2\pi it},p)=\Phi_i(t,p),\qquad |p|=1.
\]
The boundary of the attached five-dimensional handlebody has exactly these pieces after rounding the product corners along the seam. An explicit collar on this gluing uses \(|s|\le1/8\), longitude \(t\) and sphere point \(p\). On the exterior side \(s\ge0\) it is \(\Phi_i(t,(1+s)p)\); on the cap side \(s\le0\) it is \(((1+s)e^{2\pi it},p)\). In these coordinates the seam orientation from \(E\) is \(-dt\wedge dA\) and that from \(C_i\) is \(dt\wedge dA\), where \(dA\) is the outward area form on \(S^2\). This follows from the sign of \(\Phi_i\) and \(d^3z=\rho^2d\rho\wedge dA\), with \(\rho=1+s\).

The inverse surgery removes \(C_i\), the product neighborhood of its core \(\{0\}\times S^2\), and restores the cradle \(S^1\times D^3\). Its seam map is again \(a_i\) exactly, and its incoming collar uses \(\Phi_i(t,(1+s)p)\) with \(s\le0\). The inverse angular and fiber coordinates for both end and cradle are the same restriction of \(\Phi_i^{-1}\). The same table specifies the handle attachment, cap, cradle and outer collar, so there is no additional rotation, longitude change or upper closing choice.

## Named sphere and evidence

**Source identification, checked primary passages on 27 November 2026.** Shehper et al., arXiv:2408.15332v2, §3.3, give the displayed length-14 pair; \(yx^2y^{-1}x^{-2}\) is the minus choice. Gabai, arXiv:2212.02004v2, Remark 13.5(ii) and Problem 13.6 on p. 62, identifies the five-dimensional recognition question for \(x^{-1}y^2x=y^3,\ x=w\) with \(x\)-exponent of \(w\) zero. [Shehper et al., §3.3](https://arxiv.org/html/2408.15332v2) · [Gabai, §13](https://arxiv.org/pdf/2212.02004v2)

**Import.** Miller–Schupp, *Some presentations of the trivial group*, Theorem 1, applies to a perfect two-generator group satisfying \(a^{-1}b^na=b^m\) for coprime positive \(n,m\). Here the exponent matrix from the two words has rows \((0,-1)\), \((-1,0)\) and determinant \(-1\), so the group is perfect. The first relation uses \(n=2,m=3\); the presented group is trivial. [Primary manuscript, p. 1](https://hcmuaf.edu.vn/giangvien/data/file/Some%20presentations%20of%20the%20trivial%20group.pdf) · [Publication](https://doi.org/10.1090/conm/250/03848)

**Project identification, working.** Choose the same allowed corner profile in 07. The base \(V\), parametrized \(\Phi_i\), retained \(E\), and full cap gluing \(a_i\) coincide with the 07 marking. The identity on the pieces identifies the oriented closed manifolds. The one-handle feet merely express this \(V\) as a handlebody. Forgetting the marking yields the presentation sphere.

**Import for presentation independence.** Gay–Kirby, *Constructing Lefschetz-type fibrations on four-manifolds*, §4.1, p. 2095, state that attaching the ordered relations of a finite balanced trivial presentation to a five-ball with its generator one-handles gives a unique smooth contractible five-manifold up to diffeomorphism. Its boundary is their homotopy sphere \(S_P\). Their Lemma 4.7 identifies \(S_P\) with the smooth identity double of a four-dimensional \(0,1,2\)-handle realization of \(P\). For an outward-oriented comparison to another realization, an orientation mismatch can be corrected by the double's orientation-reversing swap. This follows by reflecting the symmetric product collar of the double and swapping the two signed copies. Thus the identification with the actual 07 marking follows directly from the maps, while uniqueness among unmarked thickenings uses the cited result. [Primary publication, §4.1 and Lemma 4.7](https://msp.org/gt/2007/11-4/gt-v11-n4-p03-p.pdf)

**Certificate.** The standalone Python checker reads the hand-entered table and recomputes the signed words, determinant, foot conditions, clearance inequalities, latitude separation, collar bounds, framing parity and equality of the seam and inverse map declarations. The chart and spin arguments above supply their smooth interpretation. The working proof and cited imports have no Lean verification in this packet. The smooth recognition of this sphere as standard remains unresolved within its scope.
