# E49 · An embedded standard sphere with an actual two-middle-handle height

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution using an explicit compact birth in two regular height charts. Actual serving model and reasoning effort are unavailable. The [master immersion section](../manuscript/immersion_entry.tex) was checked initially at SHA-256 `74a1bbdbbf92e53a6a858f3606a190456b1b26a8bdf738f5a755869154c392cc` and rechecked at `cf7a5e72e147772f23a657d070ea78ac7c7fceeda0f51871f40026cc17d2dd62`. The [E37 framed graph](E37_GRAPH_HANDLE.md), [positivity along a path](../manuscript/variational_comparison.tex), and [intrinsic recognition](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex) were respectively checked at `008bea06b958d5cb6286a2fe3560546c44320c72c3a0e45f2516d6cae30b2785`, `0c9b1dce4aa655be19b124b28c5e1c98d97645184561a9a00c05260b15c029db`, and `d2d3a4151a4414f6d5f5503072a8baac7458e32fbcfcc1bf4178e4b22d7e0e12`. Evidence is an explicit one-parameter family of smooth global embeddings on the standard smooth four-sphere, with a fixed linear height, actual attaching maps, and an induced energy estimate.

## Compact birth in the affine height coordinate

Write \(w=(x_1,x_2,y)=(x,y)\in\mathbb R^3\), take a fourth coordinate \(v\), and fix a smooth radial cutoff \(\omega\) equal to one on the \(d\)-ball and zero outside the \(2d\)-ball in \((w,v)\), for a small fixed \(d>0\). For a fixed small \(a>0\) use

\[
 \begin{aligned}
 Q(w)&=-|x|^2+y^2,\\
 P_{\tau,a}(w,v)&=Q(w)+v^3+3a^2v-6\tau a^2v\omega(w,v),\\
 \psi_a(w,v)&=(w,P_{0,a}(w,v)),\\
 U_{\tau,a}(w,T)&=P_{\tau,a}\circ\psi_a^{-1}(w,T),\qquad 0\le\tau\le1.
 \end{aligned}
\]

The map \(\psi_a\) is a global diffeomorphism since its last component is strictly increasing and onto in \(v\) at fixed \(w\), with derivative \(3(v^2+a^2)>0\). Thus \(U_{0,a}=T\), and \(U_{\tau,a}=T\) off the compact set \(\psi_a(\operatorname{supp}\omega)\). On the closed transition \(d\le|(w,v)|\le2d\), the differential of \(Q+v^3\) has a positive uniform minimum. The derivative of the added term \(3a^2v-6\tau a^2v\omega\) is bounded there by \(C_d a^2\), uniformly in \(\tau\). Choose \(a\) small enough that this is less than half the minimum. Off the cutoff support the \(v\) derivative is positive. In the inner ball the polynomial is \(Q+v^3+3(1-2\tau)a^2v\), with no critical points for \(\tau<1/2\), one cubic degeneracy at \(\tau=1/2\), and the standard pair after that. At \(\tau=1\), set \(C_a(v)=v^3-3a^2v\). The lower point \((w,v)=(0,a)\) has value \(-2a^3\) and index two. The upper point \((0,-a)\) has value \(2a^3\) and index three. These follow from the Hessian entries \((-2,-2,2,6v)\) in polynomial coordinates. The cutoff calculation follows the explicit Cerf insertion, carried here out with a fixed derivative margin. [Borodzik–Powell–Teichner, *Link Concordance Implies Link Homotopy*, §3.5, (3.5.1), inspected 25 November 2026](https://www.maths.gla.ac.uk/~mpowell/link-conc-implies-link-homotopy.pdf)

## Two disjoint insertions on the actual round embedding

Fix unequal small parameters \(a_1,a_2\) with \(a_2=11a_1/10\). Choose fixed disjoint angular charts \(\Theta_j:B^3_\kappa\to S^3\subset\mathbb R^4\) on the horizontal unit sphere, for example standard hemisphere cap coordinates about the two opposite points \(e_1,-e_1\) rotated into position. Pick \(2d<\kappa\). Choose a constant \(T_0>0\) so that for both births all of \(\psi_{a_j}(\operatorname{supp}\omega)\) has \(|T|<T_0/2\) and \(|U_{\tau,a_j}|<T_0/2\) there, uniformly in \(\tau\). Fix \(R_0^2>4T_0+1\). These choices precede the small-patch limit below.

In the upper hemisphere of the unit round \(S^4\subset\mathbb R^4\times\mathbb R\) use horizontal coordinates \(z\) and height \(u_0(z)=\sqrt{1-|z|^2}\). For sufficiently small \(r>0\), put \(h_*=(1-R_0^2r^2)^{1/2}\). The global latitude parameter \(T=(u_0(z)-h_*)/r^2\) gives the two disjoint boxes by

\[
 z=r\sqrt{R_0^2-2h_*T-r^2T^2}\,\Theta_j(w),\qquad |w|<\kappa,\quad |T|<T_0 .
\]

The radial factor is bounded above and below by positive constants and has nonzero \(T\) derivative. The box centers have the common incoming round height \(h_*\) and horizontal distance \(R_0r\) from the north pole. Both boxes have diameter \(O(r)\), stay a distance comparable to \(r\) from the pole, and have disjoint angular coordinates. Replace the height there by \(u_\tau(z)=h_*+r^2 U_{\tau,a_j}(w,T)\), preserving the horizontal coordinate \(z\). It agrees with \(u_0\) near all box faces by compact support, so it gives a single smooth map of the original round smooth domain. Use the unchanged round embedding everywhere else, including the south hemisphere. In the two boxes horizontal differential is the identity and horizontal projection is injective. Their positive heights for small \(r\) exclude any collision with the lower graph at the same \(z\). Thus for each \(\tau\) this is a smooth global embedding, with exact equality to the round embedding outside the boxes.

Take \(\tau=1\). The function studied is the fixed actual linear height \(\langle F,e_5\rangle\). On a box its expression in the polynomial coordinates is \(h_*+r^2P_{1,a_j}\). Indices survive the diffeomorphism and positive scalar factor. The changed height is exactly round in neighborhoods of both poles and on the unaffected region, where there are no other critical points. The six critical points are one minimum, two distinct index-two points at \(h_*-2r^2a_j^3\), two distinct index-three points at \(h_*+2r^2a_j^3\), and one maximum. Both index-two points occur before both index-three points in the actual height. No rearrangement of critical levels is needed.

The metric is induced by the same embedding. In the normalized horizontal coordinates \(\zeta=z/r\), the angular inverse charts have bounded derivatives through order two on the supports, since \(|\zeta|\) stays bounded away from zero. The normalized latitude coordinate satisfies

\[
 T(\zeta)=\frac{\sqrt{1-r^2|\zeta|^2}-h_*}{r^2},\qquad
 D_\zeta T=-\frac{\zeta}{\sqrt{1-r^2|\zeta|^2}}.
\]

Its second derivatives are uniformly bounded there as well. The functions \(U_{\tau,a_j}\) have bounded \(C^2\) norms on the fixed boxes, with constants allowed to depend on the fixed \(a_j,d\). Consequently \(|D_z u_\tau|\le Cr\) and \(|D_z^2u_\tau|\le C\). The graph shape operator is bounded by \(|D_z^2u_\tau|\) and its volume density is \((1+|D_z u_\tau|^2)^{1/2}\). The Euclidean hypersurface Gauss equation and the master chiral operator formula give \(|W^\pm|^2\le C|A|^4\). Both coordinate supports have total horizontal volume \(O(r^4)\), and the unchanged round region has zero Weyl tensor. Thus \(E_+=E_-=O(r^4)<8\pi^2\) for all sufficiently small \(r\), uniformly along the local birth path. The equality of the two chiral budgets also follows from signature. [Master Gauss and chiral normalization](../manuscript/immersion_entry.tex)

The parameter \(\tau\) interpolates the graph heights affinely and gives a smooth closed metric path from the round class. The uniform strict bound \(E_+<8\pi^2\) excludes a zero-Yamabe class anywhere along the path by Gauss–Bonnet for its scalar-flat representative. Continuity of the lowest conformal Laplacian eigenvalue therefore leaves the assembled induced class positive Yamabe. For small \(r\) this same metric also meets both the positive-class \(4\pi^2\) and immersed \(64\pi^2/9\) direct recognition thresholds. [Master positivity along the subcritical path](../manuscript/variational_comparison.tex)

## The actual incoming framed unlink

For the rest of the note levels are normalized by \(\ell=(\langle F,e_5\rangle-h_*)/r^2\). Put \(a_{\max}=a_2\) and choose the common actual regular levels \(\ell_-=-3a_{\max}^3\), \(0\), and \(\ell_+=3a_{\max}^3\). All the following polynomial pieces lie in the \(d\)-ball by taking the fixed \(a_j\) sufficiently small, since \(|v|\le 3a_j\) and the needed \(|w|\) is \(O(a_{\max}^{3/2})\). A descending gradient-like field can be chosen to equal the negative coordinate gradient of \(Q+C_{a_j}\) on these pieces. Extend it by interpolation with a negative gradient of the global height on overlaps, where both fields strictly decrease height. Thus its descending and ascending disks in the calculations are those of one global height presentation.

At the index-two point in box \(j\), write \(a=a_j\). The descending disk has \(v=a,y=0\) and varying \(x\), so its attaching circle in \(\ell_-\) is

\[
 K_j=\{v=a,\ y=0,\ |x|^2=3a_{\max}^3-2a^3\}.
\]

Near the circle use the Morse coordinate \(V=(v-a)\sqrt{v+2a}\), so \(C_a(v)=-2a^3+V^2\). In a small normal disk the attaching parametrization is \((\theta,y,V)\mapsto(x,y,v)\) with \(x=\sqrt{3a_{\max}^3-2a^3+y^2+V^2}\,\theta\) and \(v\) the inverse of \(V\). The corresponding two framing vectors at the circle are positive multiples of \(\partial_v,\partial_y\), with the order fixed by the chosen normal-disk orientation.

The same actual incoming level contains a spanning disk

\[
 D_j=\{y=0,\ v_0\le v\le a,\ |x|^2=C_a(v)+3a_{\max}^3\},
\]

where \(v_0\in(-3a,-2a)\) is the simple left root of the expression for \(|x|^2\). The expression is positive for \(v_0<v\le a\), since its local minimum there is \(3a_{\max}^3-2a^3>0\), and its derivative is positive at the root. Smoothness where the circles collapse follows by expressing \(v\) as a smooth function of \(|x|^2\) near the root. At the boundary the radial derivative of \(|x|\) as a function of \(v\) vanishes. Hence \(\partial_v\) points outward along the disk and \(\partial_y\) is transverse to the disk in the level and extends over the disk. The handle framing therefore has zero twist relative to this Seifert framing.

The complete incoming level is a standard \(S^3\) by flowing from a lower unmodified latitude through the band without critical values. Each spanning disk is in its own angular box, so small closed smooth regular neighborhoods of the disks are disjoint three-balls in that \(S^3\). The actual attaching link is a split unlink with both framings zero. Both circles are carried to this common level before either attachment and no sliding between handles occurs. The complete intermediate level \(\ell=0\) is accordingly \(\#^2(S^1\times S^2)\), by zero surgery on the two split unknots. For one unknot its exterior is a solid torus, and the zero surgery identifies meridians of the two solid tori, giving \(S^1\times S^2\). The splitting balls separate the two surgeries.

## The outgoing attaching spheres and end markings

In each box the belt circle of the index-two handle in \(\ell=0\) and the attaching sphere of the index-three handle there are respectively

\[
 \begin{aligned}
 B_j&=\{x=0,\ 0\le v\le\sqrt3 a,\ y^2=-C_a(v)\},\\
 A_j&=\{y=0,\ -\sqrt3 a\le v\le0,\ |x|^2=C_a(v)\}.
 \end{aligned}
\]

These are smooth where their fiber spheres collapse because the roots of \(C_a\) at the endpoints are simple. The former flows under the negative coordinate gradient to \((0,a)\). The latter flows under the positive coordinate gradient to \((0,-a)\). The indicated trajectories remain in the core since their transverse radii decrease and their \(v\) coordinates stay between the initial values and the respective critical values. The attaching \(S^2\) has its normal line in the level marked by \(\partial_y\). At \((w,v)=0\) the derivative \(C_a'(0)\ne0\), so \((x,y)\) are local coordinates in the level. In those coordinates the two spheres have tangent spaces the \(y\)-line and the \(x\)-plane. They meet transversely exactly once in their own box and are disjoint across boxes. In \(\ell_+\) the dual belt \(S^0\) of each index-three handle is given by \(x=0\), \(v=-a\), \(y=\pm\sqrt{3a_{\max}^3-2a^3}\). The transverse coordinates are \((x,(v+a)\sqrt{2a-v})\), which display the actual outgoing local markings.

The outer normalized levels \(-T_0,+T_0\) are exactly the original unmodified round latitudes. The whole slab between them, as a marked smooth domain, is the same original latitude slab because all modified points and values lie strictly between the ends. Its explicit product marking is \((\xi,T)\in S^3\times[-T_0,T_0]\) using the original angle and latitude under the horizontal projection. This gives the angular identity between the two end spheres and the unchanged product on the exterior of the angular boxes. On the regular bands from \(-T_0\) to \(\ell_-\) and from \(\ell_+\) to \(+T_0\), level transport can be chosen equal to the original angular product outside the boxes. Indeed take a smooth positive-height vector field normalized to have height derivative one and equal to the product field on the unchanged exterior. Its flow gives the end identifications. Convex interpolation of such normalized fields supplies the carried isotopies relative to the exterior. These are markings of the actual height levels on one embedding.

The construction realizes the reduced pattern \((m_1,m_2,m_3)=(0,2,2)\) on the standard type with a specified split diagram and arbitrarily small induced chiral energy. It supplies no classification of diagrams or existence of comparable embeddings on other smooth types.
