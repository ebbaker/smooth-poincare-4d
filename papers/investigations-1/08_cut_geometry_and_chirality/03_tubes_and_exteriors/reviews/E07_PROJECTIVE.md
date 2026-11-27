# SP4-CUT-TUBE-E07 — independent projective-plane cap review

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Actual model and effort unavailable to this reader. Independent review under [E07_REQUEST_R1](../research-progress/handoffs/E07_REQUEST_R1.md), input baseline `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The working inputs are the [cap argument](../notes/PROJECTIVE_CAP.md), [B02](../brainstorm/notes/B02_MARKED_CAPS.md), and the [quaternionic marking](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md).

The structure equations give the claimed strict obstruction for every smooth biaxial cap with the collapsing axis also used as the Berger axis of an umbilic boundary with \(t\ge1\). In the outward-first quaternion orientation the obstructing energy is \(E_-\). On triaxial paths the same weighted moment has a correction of either sign, even when the Berger boundary and its marking are fixed. A second moment gives a weaker lower bound on triaxial caps and covers both choices of Berger axis.

## The normal bundle and endpoint conditions

Use unit-quaternion orientation and the left quotient \(Y=Q_8\backslash SU(2)\). The projection \([g]\mapsto[g^{-1}kg]\) has fibres given by the normalizer of \(C=\{\exp(\alpha k)\}\). In fact \(H=C\cup iC\) fixes the line of \(k\) by conjugation and \(Q_8\subset H\), so the principal fibre is \(Q_8\backslash H\). Its circular coordinate at a chosen lift of \(g\) is the path \([\exp(\alpha k)g]\) with period \(\pi/2\), from \(Q_8\cap C=\{\pm1,\pm k\}\). A change of lift by an element of \(iC\cap Q_8\) reverses that coordinate. The action description is fibrewise.

The slice representation takes \(\exp(\alpha k)\) to rotation through \(4\alpha\) and \(i\) to a reflection. The real unit vector has stabilizer \(Q_8\). The oriented-base cover is \(C_4\backslash SU(2)\to S^2\), with \(C_4=\{\pm1,\pm k\}\). The circle bundle has Euler magnitude four by the homotopy sequence, since its total fundamental group is \(C_4\). The base double cover doubles the evaluation of the Euler class in the orientation local system, so the magnitude downstairs is two. The nonidentity component of \(H\) reverses both the normal and base orientations, consistently with an oriented total disk bundle.

For a smooth invariant metric the two horizontal lengths agree and are nonzero at the core. Divide by their product and use arclength \(s\) from the core. The normalized circle length profile \(c\) then gives circumference \((\pi/2)c(s)\), whose first-order expansion is \(2\pi s\). Thus \(c(0)=0\) and \(c_s(0)=4\). In the biaxial case \(a_1=a_2=1\). In the triaxial case write the normalized lengths as \((a_1,a_2,a_3)=(e^u,e^{-u},c)\) with \(u(0)=0\). The squared right-frame forms descend because the adjoint action of \(Q_8\) changes signs of axes. The usual diagonal orbit metric is the full invariant metric on the principal part in arclength gauge, since the three characters of \(Q_8/\{\pm1\}\) on the axes are nontrivial and distinct. Its second fundamental form in the outward normal has principal values \(a_{i,s}/a_i\). Since the horizontal sum vanishes in this gauge, umbilicity is equivalent to all three values vanishing. In particular the biaxial outer data are \(c(S)=t,\ c_s(S)=0\).

## Cartan calculation and signed energies

Use the right-invariant coframe with \(d\sigma_i=2\sigma_j\wedge\sigma_k\) for cyclic \(i,j,k\), positively oriented as \(\sigma_1\wedge\sigma_2\wedge\sigma_3\) on \(Y\). Set \(e^0=ds,\ e^i=a_i\sigma_i,\ H_i=a_{i,s}/a_i,\ n_i=2a_i/(a_j a_k)\), and \(U_i=(n_j+n_k-n_i)/2\). Cartan's first equation gives \(\omega_{i0}=H_i e^i,\ \omega_{jk}=U_i e^i\), with the skew partners. In the curvature convention where a unit sphere has sectional curvature one, the second equation gives
\[
 \begin{aligned}
 K_{0i}&=-a_{i,ss}/a_i,\\
 K_{jk}&=U_i n_i-U_jU_k-H_jH_k,\\
 m_i=R_{0i\,jk}&=-n_iH_i+U_kH_j+U_jH_k .
 \end{aligned}
\]
For example the two mixed terms in \(\Omega_{0i}\) come from \(\omega_{0j}\wedge\omega_{ji}\) and \(\omega_{0k}\wedge\omega_{ki}\), while \(d\omega_{0i}\) contributes \(-n_iH_i\) to the \(e^j\wedge e^k\) coefficient. All other components follow from skewness or lie in the same paired two-form blocks. In the orientation \(ds\wedge\sigma_1\wedge\sigma_2\wedge\sigma_3\), the diagonal Weyl entries in \((e^{0i}\pm e^{jk})/\sqrt2\) are
\[
 \lambda_i^\pm =\tfrac12(K_{0i}+K_{jk})\pm m_i-R/12 .
\]

In the biaxial case \(U_1=U_2=c,\ U_3=2/c-c\). The radial sectional curvatures are \(K_{01}=K_{02}=0,\ K_{03}=-c_{ss}/c\), the tangential values are \(K_{12}=4-3c^2,\ K_{23}=K_{31}=c^2\), and \((m_1,m_2,m_3)=(c_s,c_s,-2c_s)\). Therefore \(R=2(4-c^2-c_{ss}/c)\) and
\[
 \lambda_3^\pm=(4-4c^2-c_{ss}/c\mp6c_s)/3.
\]
The other two eigenvalues equal \(-\lambda_3^\pm/2\). The squared norm is \(\tfrac32(\lambda_3^\pm)^2\), and the orbit-volume Jacobian on the quotient is \((2\pi^2/8)c\). With \(v=\int_0^s c(\xi)\,d\xi,\ V=v(S),\ z=c^2-1\), one has
\[
   \dot z=2c_s,\qquad \ddot z=2c_{ss}/c,\qquad
   \frac{E_\pm}{\pi^2}=\frac1{96}\int_0^V(\ddot z\pm6\dot z+8z)^2\,dv .
\]
Here the upper signs now pair with one another. The endpoint data are \((z,\dot z)(0)=(-1,8)\) and \((z,\dot z)(V)=(t^2-1,0)\). Integrating the cross term yields
\[
 \frac{E_+-E_-}{\pi^2}
   =\frac14[\tfrac12\dot z^2+4z^2]_0^V=(t^2-1)^2-9 .
\]
This equals \(12\eta\) from the marked Berger formula for every \(t\). In particular it is \(-9\) at \(t=1\) and \(-5\) at \(t=\sqrt3\). The cap retracts to \(\mathbb{RP}^2\), so its real intersection signature vanishes. To apply the product-boundary signature theorem when the boundary is only totally geodesic, replace the metric within a shrinking collar by a product-ended interpolation to its boundary value. The first derivative vanishes at the boundary, so the metric differs from product by \(O((S-s)^2)\) and can be cut off with uniformly bounded curvature there. The integrals converge to those of the original metric, and eta is fixed. [APS I, Theorem (4.14), p. 66](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24)

For a direct round sign check, each of the three order-four subgroups acts by simultaneous \(+\pi/2\) rotations in a positively oriented pair of real planes, choosing the corresponding signed quaternion basis. The cyclic round formula gives \(-1/2\) for each quotient. The antipodal order-two quotient and the sphere give zero. Averaging the equivariant eta traces, the three order-four pairs contribute \(-2\) each, and the common central elements contribute zero, so \(\eta(Y)=-6/8=-3/4\). This uses the round metric and the free orientation-preserving actions on the sphere. [APS II, Proposition (2.12) and equation (2.13), p. 412](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf#page=8)

## Biaxial moment and scope

The operator \(Lz=\ddot z-6\dot z+8z\) satisfies
\[
 e^{-4v}Lz=(e^{-4v}(\dot z-2z))^{\boldsymbol\cdot}.
\]
Its integral is \(-10-2(t^2-1)e^{-4V}\). Cauchy–Schwarz and \(\int_0^Ve^{-8v}dv=(1-e^{-8V})/8\) give
\[
 \frac{E_-}{\pi^2}\ \ge\
   \frac{(10+2(t^2-1)e^{-4V})^2}{12(1-e^{-8V})}>\frac{25}{3}
   \qquad(t\ge1).
\]
Finite \(V>0\) makes the second inequality strict. The cap needs neither monotone \(c\) nor positive scalar curvature for this conclusion. A reversal of orientation exchanges the roles of \(E_-\) and \(E_+\). In a smooth homotopy-sphere closing both closed chiral energies equal \(e\), and nonnegativity on the complement gives the contradiction to \(e<8\pi^2\). On the \(0<t<1\) part of this Berger slice the independent boundary eta test already rules out strict subcritical energy. A biaxial path whose unequal axis is fixed cannot start at this core with a different collapsing axis, since then the other axis of its equal pair would collapse as well.

## Triaxial axial entry and a counterterm

In the triaxial gauge define \(P=2\cosh(2u)\), \(Q=P-2\), \(D=2\sinh(2u)\), and \(T_u=D^2/c^2+u_s^2\). The equations above give
\[
 \begin{aligned}
 m_3&=-2c_s+2D u_s/c=-\dot z+\dot Q,\\
 K_{12}&=2P-3c^2+D^2/c^2+u_s^2,\\
 K_{13}+K_{23}&=2c^2-2D^2/c^2,\qquad
 K_{01}+K_{02}=-2u_s^2 .
 \end{aligned}
\]
Consequently the anti-self-dual axial entry is \(\lambda_3^-=-G/6\), where
\[
 G=Lz+6\dot Q-4Q-4T_u .
\]
The traceless symmetric Weyl block satisfies \(|W^-|_{\rm HS}^2\ge\tfrac32(\lambda_3^-)^2\), by minimizing the squared norm of the other two diagonal entries at fixed sum. Thus \(E_-/\pi^2\ge\int_0^V G^2\,dv/96\). The core has \(Q(0)=0\). For a boundary whose Berger axis is the collapsing one, \(Q(V)=0\) also. Integrating the correction with the original weight yields
\[
 \int_0^V e^{-4v}(G-Lz)\,dv
 =4\int_0^Ve^{-4v}(5Q-T_u)\,dv .
\]
The right side can have either sign for smooth paths with the specified endpoints. Choose a path with an interior interval on which \(c^2=2\) and take \(u=\epsilon e^{2v}h(v)\) with \(h\) smooth and compactly supported there. Such a plateau can be put between an unchanged smooth core and the given umbilic end. The coefficient of \(\epsilon^2\) in the right side is
\[
 4\int (4h^2-2(h')^2)\,dv .
\]
Indeed \(Q=4u^2+O(u^4)\), \(D=4u+O(u^3)\) and \(u_s^2=c^2\dot u^2\); the cross term integrates to zero. Rescaling a fixed nonzero bump to sufficiently large or small support gives the two strict signs. For small amplitude this preserves the endpoint conditions and smooth core. This refutes the definite sign for the original triaxial moment correction. It supplies no example with total energy below the band wall.

A surviving estimate uses \(T_u\ge|\dot Q|\), since \(\dot Q=2D u_s/c\). The weight \(e^{-2v}\) satisfies \(e^{-2v}Lz=(e^{-2v}(\dot z-4z))^{\boldsymbol\cdot}\). Integration gives
\[
 \int_0^V e^{-2v}G\,dv\le -12+e^{-2V}(2Q(V)-4z(V)).
\]
For the aligned Berger end with \(t\ge1\), this gives \(E_-/\pi^2\ge(12+4(t^2-1)e^{-2V})^2/(24(1-e^{-4V}))>6\). If the long boundary axis is horizontal and the collapsing axis is short, the normalized boundary triple is \((\sqrt t,1/\sqrt t,1/\sqrt t)\) up to a horizontal swap. Then \(Q(V)=t+t^{-1}-2\) and \(z(V)=t^{-1}-1\). For the eligible range \(\sqrt2<t<2\), set \(b=2(t-t^{-1})\). The same estimate is
\[
 \frac{E_-}{\pi^2}\ge
 \frac{(12-b e^{-2V})^2}{24(1-e^{-4V})}
 \ge \frac{144-b^2}{24}.
\]
The last inequality follows by completing the square in \(e^{-2V}\). Both triaxial estimates leave room below \(8\pi^2\) when the conformal length can be large. These are analytic bounds for the marked class of invariant metrics. The general triaxial obstruction and the existence of a subcritical cap with a different boundary marking remain open in this packet.
