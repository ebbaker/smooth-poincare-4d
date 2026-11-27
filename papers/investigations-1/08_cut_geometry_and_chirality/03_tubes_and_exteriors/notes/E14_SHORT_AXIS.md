# SP4-CUT-TUBE-E14 — the short-axis Berger cap

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Requested Sol 6.2/ultra. Actual model and effort unavailable to this worker. This is the bounded return to [E14_REQUEST_R1](../research-progress/handoffs/E14_REQUEST_R1.md), checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`, using the working [quaternionic marking](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md) and [E07 structure-equation review](../reviews/E07_PROJECTIVE.md). The construction and bounds below are analytic.

The positive right-invariant Berger datum with lengths \((\sqrt3,1,1)\) occurs as a totally geodesic boundary of a smooth positive-scalar-curvature cap on the specified \(\mathbb{RP}^2\) normal disk bundle. The circle collapsing at the core is the third axis \(k\), one of the two short axes. The long Berger axis is the first axis \(i\). In the outward-first quaternion orientation this cap has \(E_-\ge457\pi^2/48>8\pi^2\), excluding a subcritical homotopy-sphere closing with this cap.

## Smooth positive connection cap with a round boundary

Use the homogeneous projection \(Y=Q_8\backslash SU(2)\to\mathbb{RP}^2\) given by \([g]\mapsto[g^{-1}kg]\). Take the right-invariant forms \(\sigma_1,\sigma_2,\sigma_3\) in the quaternion basis \(i,j,k\), with \(d\sigma_i=2\sigma_j\wedge\sigma_k\) cyclically on the cover. Their squares descend. Give the cap the metric
\[
    g_0=ds^2+\sigma_1^2+\sigma_2^2+c(s)^2\sigma_3^2
    \qquad (0\le s\le L_0),\qquad L_0=\tfrac12.
\]
Here \(\chi(y)\) is the following smooth nonincreasing cutoff on \([0,1]\):
\[
 \chi(y)=\frac{\rho(3/4-y)}{\rho(3/4-y)+\rho(y-1/4)},
 \qquad \rho(a)=
 \begin{cases}
   e^{-1/a}, & a>0,\\
   0, & a\le0 .
 \end{cases}
 \qquad
 c(s)=4L_0\int_0^{s/L_0}\chi(y)\,dy .
\]
The denominator is positive. The numerator is nonincreasing and the other term in the denominator nondecreasing, which gives monotonicity. The reflection identity \(\chi(y)+\chi(1-y)=1\) gives integral \(1/2\). Thus \(c(s)=4s\) for \(0\le s\le1/8\), \(0<c\le1\) off the core, \(c=1\) for \(3/8\le s\le1/2\), and \(c''\le0\).

The normal circle has period \(\pi/2\) in the right-frame generator \(k\), so its ordinary angular coordinate in a local trivialization is \(\gamma=4\alpha\). The horizontal tensor \(\sigma_1^2+\sigma_2^2\) is the pullback of the smooth homogeneous base metric, and \(4\sigma_3=d\gamma+\mathcal A\) locally for the corresponding circle connection, with reversal on orientation-reversing trivializations. Near the core the metric therefore has normal part \(ds^2+s^2(d\gamma+\mathcal A)^2\). In normal Cartesian coordinates \(X=s\cos\gamma,\ Y=s\sin\gamma\), the untwisted part is \(dX^2+dY^2\), and \(s^2d\gamma=X\,dY-Y\,dX\) makes the extra terms smooth. This gives the smooth bolt on the actual marked bundle. The connection-cap scalar formula is \(R_0=2(4-c^2-c''/c)\) off the bolt, hence \(R_0\ge6\) there and at the bolt by continuity. The terminal round collar is a product, so all normal derivatives of the tangential metric vanish there. [E07 curvature and bundle calculation](../reviews/E07_PROJECTIVE.md)

## Smooth positive cylinder to the short-axis datum

Attach a cylinder in the same marked \(Y\) coordinates. Use its own arclength \(r\in[0,L_1]\) and set
\[
 g_1=dr^2+\lambda(r)^2\sigma_1^2+\sigma_2^2+\sigma_3^2,\qquad
 \lambda(r)=1+(\sqrt3-1)\psi(r/L_1),\qquad \psi=1-\chi.
\]
Take \(L_1=1+\sqrt{2(\sqrt3-1)\|\psi''\|_\infty}\), a finite length since the cutoff is smooth. Then \(1\le\lambda\le\sqrt3\) and \(|\lambda''|\le1/2\). A cyclic permutation of the orthonormal labels in E07 makes the varying direction axial. Its scalar curvature is
\[
 R_1=2(4-\lambda^2-\lambda''/\lambda)\ge 1 .
\]
The initial cylinder end is constant and round on a nonzero collar, so all jets agree with the terminal product collar of \(g_0\). At the final end \(\lambda=\sqrt3\) on a nonzero collar, making the face totally geodesic with the specified Berger metric. The attach map is the identity in the marked \(Y\) coordinates. In particular the boundary marking retains \(k\) as the collapsing normal direction while the deformation lengthens \(i\). The induced scalar curvature at the final product end is \(2\).

## Signed energy and the closing budget

Write \(E_\pm=\int|W^\pm|_{\rm HS}^2\,dV\), and use the orientation \(ds\wedge\sigma_1\wedge\sigma_2\wedge\sigma_3\) on \(g_0\), with \(dr\) in place of \(ds\) on the cylinder. For a biaxial region of varying axis length \(a\), set \(v=\int a\,ds,\ z=a^2-1\) in its increasing arclength. The E07 squared norm and Jacobian give the signed difference
\[
 \frac{E_+-E_-}{\pi^2}=\frac14\left[\frac12\dot z^2+4z^2\right]_{\rm ends}.
\]
On \(g_0\), the core pair is \((z,\dot z)=(-1,8)\) and the round end pair is \((0,0)\), hence \(E_+(g_0)-E_-(g_0)=-9\pi^2\). A concrete improvement of the lower bound uses the region \(0<s<1/8\) where \(c=4s\). The self-dual axial eigenvalue there is
\[
 \lambda_3^+=\frac{4-4c^2-c''/c-6c'}3
             =-\frac{20+4c^2}{3}.
\]
Using \(|W^+|_{\rm HS}^2=\tfrac32(\lambda_3^+)^2\) and quotient orbit volume \(\pi^2 c/4\) gives
\[
 \frac{E_+(g_0)}{\pi^2}\ge
        \frac38\,\frac{400}{9}\int_0^{1/8}4s\,ds
        =\frac{25}{48}.
\]
Thus \(E_-(g_0)\ge(9+25/48)\pi^2=457\pi^2/48\). The cylinder is biaxial after an orientation-preserving cyclic permutation of the orbit labels. Its endpoints have \((z,\dot z)=(0,0)\) and \((2,0)\), respectively, so \(E_+(g_1)-E_-(g_1)=4\pi^2\). The whole cap has difference \(-5\pi^2\), agreeing with \(12\pi^2\eta\) at \(\eta=-5/12\) for the final marking. Nonnegativity of \(E_-(g_1)\) retains the initial lower bound. [E07 signed identity](../reviews/E07_PROJECTIVE.md) · [Marked Berger eta](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md)

A closed smooth homotopy four-sphere has equal chiral energies, both equal to its \(e\). Any exterior has nonnegative energy in each chirality, and therefore cannot put this prescribed cap below \(8\pi^2\). Reversing orientation exchanges the two chiralities and preserves the exclusion. The result is specific to the round-intermediate construction. It gives an actual positive short-axis filling, while the possibility of a subcritical short-axis cap without that intermediate face remains open.
