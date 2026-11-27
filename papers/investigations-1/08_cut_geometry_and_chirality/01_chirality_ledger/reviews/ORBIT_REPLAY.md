# Independent replay of the round quaternionic cut

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. [SP4-CUT-LED-E11, request 1](../research-progress/handoffs/E11_REQUEST_R1.md), checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The packet requested a Sol/ultra reader. Actual serving model and effort unavailable. Reviewed [ROUND_ORBIT_MARKING.md](../notes/ROUND_ORBIT_MARKING.md), SHA-256 `ce0dfc657a5a2fff5368d7d1e329795e4aba0b5e8d7d5b049a0a6f3356fabe32`, and used [E04](../notes/QUATERNIONIC.md) and [E10](../notes/QUATERNIONIC_MARKING.md) for the orientation and eta comparison. All checks below are exact and concern the fixed standard round model.

## Orbits, isotropies and both markings

The real trace-free symmetric matrices form a five-dimensional inner-product space under \(\langle U,V\rangle=\operatorname{tr}(UV)\). The spectral theorem diagonalizes every unit matrix by a rotation, since one can flip the sign of an eigenvector to achieve determinant one. Ordering the eigenvalues determines their triple uniquely and gives a closed arc of the unit circle in the trace-zero diagonal plane. An explicit unit-speed orthonormal parametrization is

\[
 D(\theta)=\frac{\cos\theta}{\sqrt2}\operatorname{diag}(1,0,-1)
           +\frac{\sin\theta}{\sqrt6}\operatorname{diag}(1,-2,1),
 \qquad -\frac\pi6\le\theta\le\frac\pi6.
\]

At interior parameters each eigenspace is a line. A rotation fixing \(D\) is diagonal with entries \(\pm1\) and determinant one, so the stabilizer \(H\) is the Klein four group. The preimage under \(\mathrm{SU}(2)\to\mathrm{SO}(3)\) consists of \(\pm1,\pm i,\pm j,\pm k\). The orbit map \(u\mapsto \operatorname{Ad}_u D\), with \(\operatorname{Ad}_u\) understood here as the corresponding conjugation action on matrices, induces the quotient by the right action of \(Q_8\). Its pulled-back metric is left-invariant since the orbit map intertwines left translations with isometries. Quaternion inversion has derivative \(-I\) on the tangent at the identity, exchanges the left and right deck actions and carries this metric to a right-invariant lift of the left quotient, reversing orientation. These statements identify the induced metric with the correct family in E10, with the sign change determined if the orientation on the right quotient is inherited from \((1,i,j,k)\).

At \(\theta=-\pi/6\), \(d_1=d_2\) and the simple eigenspace is axis 3. At \(\theta=\pi/6\), \(d_2=d_3\) and the simple eigenspace is axis 1. Let \(K_j\) be the stabilizer of the corresponding unoriented simple eigenline. In the splitting into the repeated plane and the line, any element acts by \(A\in O(2)\) and \(\det A\), so \(K_j\simeq O(2)\) and the singular orbit \(\mathrm{SO}(3)/K_j\) parametrizes lines, giving \(\mathbb{RP}^2\).

At the endpoint matrix, the normal two-plane within the sphere is the space of trace-free symmetric matrices on the repeated eigenspace. It is orthogonal both to the endpoint matrix and to the orbit's infinitesimal rotations, which are off-diagonal between the line and its orthogonal complement. In a repeated-plane frame a variation is \(\bigl(\begin{smallmatrix}a&b\\b&-a\end{smallmatrix}\bigr)\). Conjugating it by a rotation through \(\phi\) rotates \((a,b)\) through \(2\phi\), so the unit normal circle is the homogeneous fibre \(K_j/H\simeq SO(2)/\{1,R_\pi\}\). Normal exponential in the round sphere is \(D_*\cos\rho+V\sin\rho\) for unit normal \(V\). It follows directly on the diagonal arc and then by equivariance that the side from each singular orbit to any given principal orbit is its normal disk bundle up to that level: for \(\rho>0\) the orbit coordinate is unique and the stabilizer of each normal direction is \(H\) up to conjugacy, while the zero section has stabilizer \(K_j\). The two boundary maps on the same orbit are therefore the projections \(gH\mapsto gK_3\) and \(gH\mapsto gK_1\). On the quaternion cover the circle through the identity is \(\exp(\mathbb R k)\) or \(\exp(\mathbb R i)\), respectively, and its intersection with \(Q_8\) is the corresponding cyclic group of order four. This identifies the markings up to orientation, including which normal fibre is meant on each side. The fibre circles on the quotient need no common oriented circle action.

## Metric axes, curvature and eta

For a quaternion generator of norm one the infinitesimal map to \(\mathfrak{so}(3)\) rotates its perpendicular plane at speed two. The derivative at \(D\) is \([X,D]\), with entries \(X_{jk}(d_k-d_j)\). The two symmetric off-diagonal entries each contribute \(4(d_j-d_k)^2\) to the norm squared. Different planes have disjoint matrix supports. Consequently the lengths about axes 1, 2 and 3 are

\[
 \ell_1=4\cos(\theta+\pi/3),\qquad
 \ell_2=4\cos\theta,\qquad
 \ell_3=4\cos(\theta-\pi/3).
\]

All are positive inside the ordered chamber and \(\ell_2=\ell_1+\ell_3\). At the midpoint \((\ell_1,\ell_2,\ell_3)=(2,4,2)\). Only axis 3 collapses at the negative endpoint and only axis 1 collapses at the positive endpoint. The stretched Hopf axis of the Berger metric on the cover is axis 2, along the middle eigenline. Its descended circle direction is distinct from each actual normal fibre direction. Relabelling that axis as a tube fibre requires changing the boundary identification.

The chamber coordinate is arclength and is normal to the orbits because its tangent is diagonal and the orbit tangent is off-diagonal. In the increasing normal convention the principal curvatures are \(\kappa_i=\ell_i'/\ell_i\), by differentiating the induced metric on the level family. The product of the lengths is \(16\cos3\theta\), and each length satisfies \(\ell_i''=-\ell_i\). Taking two derivatives of the product gives \(-9=-3+2\sum_{i<j}\kappa_i\kappa_j\). The round Gauss equation yields \(R_\Sigma=6+2\sum_{i<j}\kappa_i\kappa_j=0\). In fact,

\[
 H=-3\tan3\theta,\qquad
 |B^\circ|^2=\sum_i\kappa_i^2-H^2/3=6\sec^2 3\theta,
\]

so every principal orbit is non-umbilic. At the midpoint the principal curvatures are \((-\sqrt3,0,\sqrt3)\).

For a check of the general intrinsic formula, on a left-invariant orthonormal frame put \([e_j,e_k]=c_i e_i\) for cyclic indices, where \(c_i=2\ell_i/(\ell_j\ell_k)\). Koszul gives \(2\langle\nabla_i e_j,e_k\rangle=c_k-c_i+c_j\) and \(\nabla_i e_i=0\). Substitution gives \(4K_{ij}=(c_i-c_j)^2+2c_k(c_i+c_j)-3c_k^2\). Thus \(R=2(4q-p^2)/r\) with the note's \(p,q,r\). For a scaled-to-unit-short-axis Berger metric \((1,1,t)\), the formula is \(8-2t^2\), agreeing with the orbit's \(t=2\) check. There are positive-scalar metrics in the interval \(\sqrt2<t<2\) of the fixed right-invariant Berger family, while the round ambient induced orbit metric at the midpoint lies at its scalar-flat endpoint.

Let \((A,B,C)=(\ell_1^2,\ell_2^2,\ell_3^2)\). Then \(4q-p^2=4AC-(B-A-C)^2=0\) by the length relation. On the oriented left quotient with right-invariant lift, the homogeneity formula gives \(\eta=-3/4+(p^3-4pq+9r)/(12r)=-3/4+9/12=0\). This also holds after inversion back to the induced quotient and either boundary orientation. An independent filling check uses either actual side. It retracts onto \(\mathbb{RP}^2\), so its real middle intersection form has zero signature. Its round ambient curvature makes the Weyl blocks, the Pontryagin density, and the mixed curvature term in Codazzi zero. Hence \(d^\nabla B=0\) on the boundary. The boundary trace in the nonproduct Pontryagin transgression is a multiple of \(\sum_i B_i\wedge(d^\nabla B)_i\) and therefore vanishes. Productizing while retaining the same induced metric also gives zero total \(p_1\), and product APS gives \(\eta=0\). This uses [the parent transgression calculation, lines 255–287](../../manuscript/cuts_of_subcritical_conformal_classes.tex) and [Atiyah–Patodi–Singer I, Theorem (4.14), p. 66](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24), for the compact oriented four-manifold with a product boundary germ and the odd signature eta on even forms.

**Disposition.** Replayed as stated. This is the boundary marking and intrinsic metric of actual cuts of the existing round \(S^4\). Their eta vanishes, their induced scalar curvature is zero, and their trace-free second fundamental forms are nonzero. The positive-scalar Berger interval belongs to the intrinsic metric family on the link. Its realization with the prescribed tube and exterior metrics remains a separate problem. The packet makes no new entry or capping construction.
