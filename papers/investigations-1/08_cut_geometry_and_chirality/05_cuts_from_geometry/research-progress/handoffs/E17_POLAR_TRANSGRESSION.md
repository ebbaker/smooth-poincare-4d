# GEO-E17 · Polar transgression for the Berger collar

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex.
Bounded E execution under [revision 1](ISSUE_BERGER_COMPLETION_20261127.md) from
`bc2c1bb`. The requested helper setting was GPT-6.2 Sol/ultra. Actual serving
model and effort were unavailable. Inputs are the working [E06 germ](E06_GERM.md)
(SHA-256 `589e2ad26823a71e8c9868afdf6d7ce28776f335f980b868935cf48bedc8f25e`),
the [two-pole marking](../../notes/GLOBAL_AREA_TEST_20261127.md), and §2.1 of the
[parent manuscript](../../../manuscript/cuts_of_subcritical_conformal_classes.tex)
(SHA-256 `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`).
This is an exact Chern–Weil calculation from the polar Levi-Civita connection.

Use the left quaternionic orientation on the orbit and orient the suspension
by \(ds\wedge\sigma_1\wedge\sigma_2\wedge\sigma_3\), with \(s\) increasing
from the first pole to the second. On any smooth diagonal polar completion of
the marked germ, the first cap has \(E_+-E_-=-75\pi^2\) and the second has
\(E_+-E_-=75\pi^2\). Both orientations give the lower bound
\(e\ge75\pi^2=(75/4)T\) for the closed completion. The same comparison applies
to a separating copy of this marked datum in a smooth homotopy four-sphere,
with no symmetry hypothesis on either side.

## Polar frame and connection

Identify the orbit with unit quaternions and use the left-invariant fields
\(X_i(q)=q\mathbf i_i\), where \((\mathbf i_1,\mathbf i_2,\mathbf i_3)=(\mathbf i,\mathbf j,\mathbf k)\).
The dual coframe has \(d\sigma_i=-2\sigma_j\wedge\sigma_k\) for each cyclic
\((i,j,k)\), and \(\int_{S^3}\sigma_{123}=2\pi^2\) with \(\sigma_{123}=\sigma_1\wedge\sigma_2\wedge\sigma_3\).
For the positive definite metric \(ds^2+\sum_i a_i^2\sigma_i^2\) use
\(e_0=\partial_s\) and \(e_i=X_i/a_i\). The change from \((ds,\sigma_1,\sigma_2,\sigma_3)\)
to the oriented orthonormal coframe has determinant \(a_1a_2a_3>0\).

Write \(\omega^a{}_b=\langle\nabla e_b,e_a\rangle\). The normal connection
on a slice satisfies \(\omega^i{}_0=a_i'\sigma_i\) because the shape
operator of \(\partial_s\) has eigenvalues \(a_i'/a_i\). The cyclic
structure constants of the orbit orthonormal frame are
\(\lambda_i=2a_i/(a_j a_k)\). Koszul's identity gives
\(2\langle\nabla_{e_i}e_j,e_k\rangle=\lambda_k-\lambda_i+\lambda_j\),
so \(\omega^k{}_j=(a_j^2+a_k^2-a_i^2)\sigma_i/(a_j a_k)\). In the
chosen frame introduce the skew matrices \(P_i\), which send \(e_0\) to
\(e_i\) and \(e_i\) to \(-e_0\), and \(Q_i\), which send \(e_j\) to
\(e_k\) and \(e_k\) to \(-e_j\) for cyclic \((i,j,k)\). They are zero
on the remaining basis vectors. The pullback of the ambient connection is

\[
 \omega=\sum_i A_i\sigma_i,\qquad
 A_i=u_iP_i+v_iQ_i,\qquad
 u_i=a_i',\qquad v_i=\frac{a_j^2+a_k^2-a_i^2}{a_j a_k} .
\]

## Chern–Simons polynomial and pole subtraction

Use the trace in the real four-dimensional representation. The identities
\([P_i,P_j]=\epsilon_{ijk}Q_k\), \([Q_i,Q_j]=\epsilon_{ijk}Q_k\),
\([P_i,Q_j]=\epsilon_{ijk}P_k\), \(\operatorname{tr}(P_iP_j)=\operatorname{tr}(Q_iQ_j)=-2\delta_{ij}\),
and \(\operatorname{tr}(P_iQ_j)=0\) follow by applying the matrices to the
four frame vectors. Restricting to a fixed slice removes radial derivatives.
Then \(\operatorname{tr}(\omega\wedge d\omega)=4\sum_i(u_i^2+v_i^2)\sigma_{123}\)
and \(\operatorname{tr}(\omega^3)=3\operatorname{tr}(A_1[A_2,A_3])\sigma_{123}\).
Define the trace polynomial itself by

\[
 \operatorname{tr}\!\left(\omega\wedge d\omega+\tfrac23\omega^3\right)
 =4\mathcal P\sigma_{123},\qquad
 \mathcal P=\sum_i(u_i^2+v_i^2)-v_1v_2v_3-\sum_{\rm cyc}v_i u_j u_k .
\]

The cubic part being subtracted is
\(\tfrac12[\det\operatorname{diag}(v_i+u_i)+\det\operatorname{diag}(v_i-u_i)]\).
The intrinsic and extrinsic parts of \(\mathcal P\) are respectively
\(\sum_i v_i^2-v_1v_2v_3\) and \(\sum_i u_i^2-\sum_{\rm cyc}v_i u_j u_k\).

For a round polar reference \(a_i=f(s)>0\), one has \(v_i=1\) and a
common \(u_i=f'(s)\), so \(\mathcal P=2\). This includes the flat
reference \(f=r\) and the round sine reference \(f=\sin r\) at either
pole, where \(r\) denotes outward polar distance from that pole. In smooth
geodesic polar coordinates with the same round angular marking,
\(a_i=r+O(r^3)\) and \(\partial_r a_i=1+O(r^2)\) follow from smooth
normal-coordinate expansions. Thus \(u_i\to1\) at the first pole,
\(u_i\to-1\) at the second, and \(v_i\to1\) at both. The limiting trace
integral is \(16\pi^2\) on each copy of the positively oriented orbit.
For example, the flat first-pole frame is the Cartesian frame rotated by
left multiplication by \(q\), an orthogonal matrix of determinant one.
It is singular at the pole and has the same nonzero trace integral.

On the punctured cap use \(\Omega=d\omega+\omega\wedge\omega\) and
\(p_1=-(8\pi^2)^{-1}\operatorname{tr}(\Omega\wedge\Omega)\). Graded
cyclicity gives \(d\operatorname{tr}(\omega\wedge d\omega+\tfrac23\omega^3)=\operatorname{tr}(\Omega\wedge\Omega)\).
On an interval \([s_1,s_2]\) of regular orbits Stokes' theorem gives
\(\int p_1=-[\mathcal P(s_2)-\mathcal P(s_1)]\). Smoothness of the
curvature makes the integral over a shrinking polar ball tend to zero.
Taking the endpoint limit thus subtracts the round reference value
\(2\) at either pole. The same left angular frame is used on all regular
orbits of each cap and for the reference at its pole. A change of frame
on the punctured cap must be accounted for at both of its ends. The
computed integral is independent of the chosen trivialization.

With the parent convention, \(p_1=(4\pi^2)^{-1}(|W^+|^2_{\rm HS}-|W^-|^2_{\rm HS})dV\).
Indeed the skew-matrix trace gives
\(-\operatorname{tr}(\Omega\wedge\Omega)=2\sum_{a<b}\Omega^a{}_b\wedge\Omega^a{}_b\).
Under the curvature operator on orthonormal two-forms, the sum in the
right side before the factor two is the difference of the squared norms
of the \(\Lambda^+\) and \(\Lambda^-\) projections of its image on a full
orthonormal basis, times \(dV\). The transpose off-diagonal Ricci blocks
cancel. The equal scalar shifts in the two diagonal blocks contribute
equally because the two Weyl blocks are trace-free. This fixes the chirality
sign and the squared operator norm, which is one quarter of the squared
four-tensor norm.

## Central value and scope

At \(s=0\), E06 has \(a=(1,1,t)\) and \(a_i'(0)=a_i(0)b_i\), with
\(t^2=65/16\), \((b_1,b_2,b_3)=(b,-b,0)\), and \(b^2=1/8\).
Therefore \(v=(t,t,2-t^2)\), \(u=(b,-b,0)\), and

\[
 \begin{aligned}
 \mathcal P(0)-2
 &= 2(t^2-1)^2+b^2(4-t^2)\\
 &=\frac{2401}{128}-\frac{1}{128}=\frac{75}{4} .
 \end{aligned}
\]

The first summand is intrinsic after the round subtraction. The second
comes from the normal connection and is negative at this endpoint.
The result holds for either simultaneous choice of the horizontal signs of
\(B\). Stokes' theorem orders the endpoints as pole-to-central on the first
cap and central-to-pole on the second. Multiplication by \(4\pi^2\) gives
the signed chiral differences stated above. Global reversal of orientation
interchanges the two chiralities. Nonnegativity of each partial energy and
\(E_+=E_-=e\) on a homotopy four-sphere imply the claimed lower bound, which
exceeds the strict entry threshold \(e<2T=8\pi^2\).

For a cut in any smooth homotopy four-sphere with this marked \(h,B\), choose
boundary normal coordinates respecting the normal sign. Each side is an
integral homology four-ball by separation and Mayer–Vietoris. The metrics of
a side and the corresponding polar model agree through first order at the
cut. Within that side's collar, splice its metric to the model metric so that
they coincide on a smaller collar. This preserves the Pontryagin integral:
for the two connections join them by an affine path \(\omega_t\) on the
same tangent bundle and use \(\partial_t\operatorname{tr}(\Omega_t^2)=2d\operatorname{tr}(\dot\omega_t\wedge\Omega_t)\).
Their boundary pullbacks agree, so the transgression vanishes there.
Now glue the side to the complementary model cap to obtain a smooth closed
homology four-sphere. The closed signature identity in parent §2.1 forces
its total Pontryagin integral to vanish. The two assigned differences thus
depend on the marked Cauchy datum even for nonsymmetric interiors. The
bound excludes this exact datum on a homotopy sphere in an entering class.
It supplies no universal sign test for other index-one minimal cuts.
