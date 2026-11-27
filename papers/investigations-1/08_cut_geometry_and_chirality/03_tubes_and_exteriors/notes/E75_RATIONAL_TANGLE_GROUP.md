# E75 · Independent rational-tangle group check

27 November 2026, for Edward B. Baker III, with OpenAI assistance. Checkout bc2c1bb. Bounded E75 request from the research lead. Actual helper model and effort are unavailable. Inputs are the exact marked [E70 quotient chart](E70_EQUIVARIANT_SURGERY.md), [E39 regular torus](E39_PRISM_FILLINGS.md), and the [ordinary-lift covering sequence](../reviews/E74_ALL_SLOPES.md). All three-dimensional base orbifolds below retain weight two on the old knot and have regular new dual core.

The rational-tangle presentation gives \(G_0=S_3\) and \(G_1=C_4*_{C_2}D_{14}\), with dihedral order \(14\). For \(s=-1\) the marked tangle group surjects onto \(\mathrm{PSL}_2(\mathbb F_{29})\), as does the deep group \(\pi_1(\Sigma_2(K_{-1}))\) of its single-branch lift. In particular both groups at the alternate slope are infinite. Together with E74, only \(s=0\) meets the cyclic or odd-dihedral hypotheses of the four-dimensional recognition among the integer slopes \(a+s\mu\).

## Crossing relations and boundary marking

Project the ball chart onto \((X,v)\) from positive \(Y\), ordered so \((X,v,Y)\) is the positive spatial frame. The old strands at \(X=\pm1,Y=0\) are parametrized upward. The order-three surgery circle \(F\) is counterclockwise in the \((X,v)\) plane, with \(Y=v\) and \(X^2+v^2=4\). The regular surgery circle \(L\) is clockwise, with \(Y=-v\) and \((X-1)^2+v^2=9/4\). Both diagrams start at their rightmost points. At the two intersections of the circles, \(X=11/8\) and \(v=\pm\sqrt{135}/8\). The upper crossing has \(F\) over and the lower has \(L\) over. Along the old strands \(F\) has \(v=\pm\sqrt3\); \(L\) has \(v=\pm3/2\) on the positive old strand and no intersection with the negative one. At each of the eight crossings the sign of \(\det(\mathrm{over\,tangent},\mathrm{under\,tangent})\) is negative. For example at the upper \(F,L\) crossing the tangent of \(F\) is \((-v,X)\), that of \(L\) is \((v,-(X-1))\), and the determinant is \(-v<0\).

Use \(F,L\) also for the positive meridians at the starting arcs of those circles. Let \(b,c\) be the bottom meridians at \(X=+1,-1\), and \(b_1,b_t,c_t\) the indicated middle and top meridians. Under a negative crossing, front-path transport changes the outgoing meridian by conjugation by the over meridian, and the longitude records its inverse. Tracing upwards and along each closed circle gives
\[
 b_1=L b L^{-1},\qquad b_t=F b_1 F^{-1},\qquad c_t=F c F^{-1},\qquad
 \lambda_F=c^{-1}b^{-1}L^{-1},\qquad
 \lambda_L=b_1^{-1}F^{-1}.
\]
The \(F\)-undercrossings occur under \(c,b,L\) in that order, and the \(L\)-undercrossings under \(b_1,F\). Closing those components imposes \([F,\lambda_F]=[L,\lambda_L]=1\). Their diagrams have no self-crossings, so the words are the zero ball longitudes. The ordinary surgery slopes \(F^3\lambda_F^{-2}\) and \(L^{s-1}\lambda_L\) are E70's signed attachments.

On the boundary front use the open rectangle \(0<x_0<1/2,\ 0<\theta<1/2\). Its image lies in \(Y>0\) because the disk coordinate is \(\cosh(cx+2\pi i\theta)\) on this side and \(\sin(2\pi\theta)>0\). The basing paths from that rectangle are the same front paths used to read the Wirtinger arcs. On the affine pillowcase cover the half-turns at \((0,0),(0,1/2),(1/2,0),(1/2,1/2)\) therefore give \(b_t,c_t,b,c\). Composing a half-turn at one corner with the one at \((0,0)\) gives twice the coordinate displacement. Thus \(d_2=b b_t\) advances \(x_0\), and \(f=c_t b_t\) advances \(\theta\). The two solid-torus angles of the attached order-two neighbourhood are \(2x_0+\theta,\ 3x_0+2\theta\). The determinant of this change of basis is one, and the primitive lifted meridian is \((2,-3)\). The pillowcase translation group is the torus subgroup \(\mathbb Z^2\), on which a half-turn acts by inversion. The rational tangle attaches by quotienting this subgroup by that primitive meridian. The half-turns survive, so the resulting orbifold tangle group is the infinite dihedral group, and the quotient kills exactly the normal closure of the lifted meridian translation. This gives the single outer relator
\[
     (b b_t)^2(c_t b_t)^{-3}=1 .
\]
Impose \(b^2=c^2=1\) for the old branch. The pillowcase relation for the four perimeter meridians can also be checked directly in the front chart, and is included in the finite representation check below. [E70 angles, front paths and attachment](E70_EQUIVARIANT_SURGERY.md)

## The three marked integer slopes

For \(s=0\) the \(L\) filling gives \(\lambda_L=L\). Hence \(L=F^{-1}b\), \(b_t=b\) and \(\lambda_F=cF\). The \(F\) longitude commutation now gives \([F,c]=1\), and its surgery gives \(F=1\) since \(c^2=1\). Thus \(c_t=c\), and the exterior attachment reduces to \((cb)^3=1\). These substitutions recover all relators. Therefore \(G_0=\langle b,c\mid b^2=c^2=(cb)^3=1\rangle=S_3\).

For \(s=1\) the \(L\) surgery is \(\lambda_L=1\), so \(b_1=b_t=F\) and \(F^2=1\). The \(F\)-slope and longitude commutation are \(F^3=\lambda_F^2,\ [F,\lambda_F]=1\), so \(F=\lambda_F^2\) and \(\lambda_F^4=1\). Writing \(q=\lambda_F\), the other variables are
\[
 L=qc,\qquad b=cq^2c,\qquad b_t=q^2,\qquad c_t=q^2 c q^2 .
\]
The exterior translates become \(d_2=(cq^2)^2\) and \(f=(cq^2)^{-1}\). Thus \(G_1=\langle q,c\mid q^4=c^2=(cq^2)^7=1\rangle\), the asserted amalgam. Its infinite-order conclusion follows from the reduced word theorem for amalgamated products, since both inclusions of the amalgam have proper image.

For \(s=-1\), \(\lambda_L=L^2\) gives \(b=LFL,\ b_1=L^2F,\ b_t=FL^2\). Put \(t=cL\). Then \(\lambda_F=cLF=tF\), since \(b,c\) are involutions. Its commutation with \(F\) therefore gives \([F,t]=1\), and the \(F\) surgery becomes \(F=t^2\). The remaining exact relations can be written
\[
 c^2=1,\qquad ((ct)^2t^2)^2=1,\qquad d_2^2=f^3,
 \qquad
 d_2=bFL^2,\quad f=FcL^2,\quad L=ct,\quad b=LFL.
\]
The first two relations are the bottom minus and middle plus squares, equivalent to the original old strand square relations. Thus this reduction can also be checked by substitution into the original presentation.

The matrices
\[
     t=\begin{pmatrix}3&7\\7&7\end{pmatrix},\qquad
     c=\begin{pmatrix}10&19\\13&19\end{pmatrix}
       \quad\text{in }\mathrm{SL}_2(\mathbb F_{29})
\]
are the witness supplied by the lead. The [checker](../numerics/e75_psl29_tangle.py) applies them to the **original** relators. Both old squares, both longitude commutators, both exact filling relations, the outer relation \(d_2^2f^{-3}\), and the perimeter product \(b_t c_t c b\) map to \(I\) or \(-I\). The commutator \([t,c]\) is the matrix with rows \((21,27),(27,3)\), neither sign of the identity. Enumerating the subgroup by multiplication by the two displayed generators modulo sign gives \(12180=29(29^2-1)/2\) elements, the full order of \(\mathrm{PSL}_2(\mathbb F_{29})\).

## The alternate group is infinite

The kernel of the cyclic order-eight quotient of \(G_{-1}\) in E74 is the fundamental group of the actual smooth double branched cover of the single knot \(K_{-1}\subset S^3\). Its image in the computed projective quotient is normal and must be the entire projective group. Indeed \(\mathrm{PSL}_2(\mathbb F_{29})\) is simple, and trivial kernel image would factor the nonabelian projective group through \(C_8\). For the simplicity used here, the projective action on \(\mathbb P^1(\mathbb F_{29})\) is faithful and two-transitive. Its point stabilizer normalizes the abelian translation group, whose conjugates generate by elementary matrices. The projective group is perfect, since diagonal conjugation of translations multiplies their parameter by a nontrivial square and expresses every translation as a commutator. Any nontrivial normal subgroup is transitive by primitivity. Modulo such a subgroup the point stabilizer generates the quotient and the images of all conjugate translation groups coincide. This makes the quotient abelian, hence trivial by perfection.

If the deep group were finite, three-dimensional elliptization would realize it as a finite subgroup of \(SO(4)\) acting freely on \(S^3\). Every finite subgroup of \(SO(4)\) has only \(A_5\) as a possible nonabelian simple composition factor. To see this, lift it through the central double cover \(SU(2)\times SU(2)\to SO(4)\), then take one projection of the lifted group and its kernel in the other factor. Each is a finite subgroup of \(SU(2)\) and is a central twofold extension of a subgroup of \(SO(3)\), with possible image cyclic, dihedral, \(A_4,S_4,A_5\). This implies the asserted restriction on composition factors even after quotienting the lift by its central kernel. It rules out the computed simple quotient of order \(12180\). Thus the deep group, and hence \(G_{-1}\), is infinite even though the deep cover has trivial first homology. [Scott, §4, classification of spherical rotation groups](https://sschleimer.warwick.ac.uk/Teach/2021_3MFDS/References/1983the_geometries_of_three-manifolds.pdf) · [Dinkelbach–Leeb, introduction and Theorem E, smooth spherical finite actions](https://msp.org/gt/2009/13-2/gt-v13-n2-p15-p.pdf)

By E74 all other odd-slope groups in this marked family are already infinite. The sole possible odd-dihedral slope is \(s=0\) from the native abelianizations, and the alternate above was the sole possible cyclic slope before the projective quotient check. Thus this recognition route resolves the even framing from \(G_0=S_3\) and gives no standardness result for the odd framing. [E76 transfer](../reviews/E76_RECOGNITION_TRANSFER.md)
