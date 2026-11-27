# Fubini–Study balls and the ledger sign

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI assistance in Codex. Actual model and effort of this execution are unavailable to the author of this note. Frozen task [SP4-CUT-LED-E01, request 1](../research-progress/handoffs/E01_REQUEST_R1.md), checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The tested input is Sections 2–3 of the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex), SHA-256 `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`. The evidence is an exact model calculation, with a [rational arithmetic check](../numerics/check_fs.py). The intrinsic eta calculation uses the product-boundary signature theorem, independently of the parent ledger and the extrinsic computation.

For the Fubini–Study metric of holomorphic sectional curvature (4) on complex-oriented \(\mathbb{CP}^2\), use the closed radius-\(r\) ball \(V_r\) with \(0<r<\pi/2\), its boundary \(\Sigma_r\) oriented outward first, and \(x=\sin^2 r\). In the parent Hilbert–Schmidt curvature-operator norms and its APS convention,

| Quantity | Exact value |
| --- | --- |
| \(\tau(V_r)\) | \(0\) |
| \(\operatorname{Vol}(V_r)\) | \(\tfrac{\pi^2}{2}x^2\) |
| \(\operatorname{Vol}(\Sigma_r)\) | \(2\pi^2\sin^3r\cos r\) |
| \(E_+(V_r),\ E_-(V_r)\) | \(12\pi^2 x^2,\ 0\) |
| \(\eta(\Sigma_r,h_r)\) | \(+\tfrac23 x^2\) |
| \(\mathcal T(\Sigma_r)\) | \(+4\pi^2 x^2\) |

The sum \(12\pi^2(\tau+\eta)+\mathcal T=8\pi^2x^2+4\pi^2x^2\) agrees with \(E_+-E_-\) at every radius in the interval. Since \(\mathcal T>0\) there, the sign in (3.2) is fixed by this family.

## Polar metric and orientation

Use the Hopf quotient of the unit \(S^5\subset\mathbb C^3\), with its Riemannian submersion metric, and centre \([1:0:0]\). A unit representative of a point in the affine chart is \((\cos r,\sin r\,z)\), \(z=(z_1,z_2)\in S^3\). Its distance from the centre is \(r\): the length of any curve from the centre is at least the least spherical distance between the two Hopf fibres, by horizontal lifting, and the displayed radial great circle is horizontal and realizes this bound. The affine coordinate \(w=\tan r\,z\) shows that \(V_r\) is a smooth ball and that its boundary orientation is the usual boundary orientation of \(S^3\subset\mathbb C^2\).

Identify \(z\) with \(\left(\begin{smallmatrix}z_1&-\bar z_2\\z_2&\bar z_1\end{smallmatrix}\right)\in SU(2)\). Left translate the tangent vectors \((0,1),(0,i),(i,0)\) from \((1,0)\) and write \(\sigma_i\) for their dual coframe. Prepending \((1,0)\) to that triple preserves the complex orientation. Left multiplication is unitary on the first column, so \(\sigma_{123}=\sigma_1\wedge\sigma_2\wedge\sigma_3\) is the positive round volume form. Direct matrix brackets of the three vectors give \([X_i,X_j]=-2X_k\) for cyclic \((i,j,k)\), hence

\[
 d\sigma_i=2\sigma_j\wedge\sigma_k,\qquad
 \int_{S^3}\sigma_{123}=2\pi^2.
\]

The vertical Hopf direction at \(z\) of \(S^3\to\mathbb{CP}^1\) is \(iz\), so \(\operatorname{Im}(z^\dagger dz)=\sigma_3\). The unit-circle connection of the \(S^5\) Hopf quotient pulls back to \(\sin^2 r\,\sigma_3\). Subtract its square from the pulled-back unit sphere metric to obtain

\[
 g=dr^2+h_r,\qquad h_r=a^2(\sigma_1^2+\sigma_2^2)+b^2\sigma_3^2,
 \qquad a=\sin r,\quad b=\sin r\cos r.
\]

The positive volume of a slice is \(a^2 b\,\sigma_{123}\). The ball volume is \(2\pi^2\int_0^r\sin^3 s\cos s\,ds\).

## Intrinsic eta by relative Chern–Simons

Use Cartan's equation \(de^i=-\omega^i{}_j\wedge e^j\) and the skew connection matrix \(\nabla E_j=\omega^i{}_j E_i\) in the dual frame of \((e^1,e^2,e^3)=(a\sigma_1,a\sigma_2,b\sigma_3)\). Setting \(c=b/a^2\) gives

\[
 \omega^1{}_2=(2/b-c)e^3,\qquad \omega^2{}_3=c e^1,\qquad \omega^3{}_1=c e^2.
\]

Indeed \(de^1=(2/b)e^2\wedge e^3\), \(de^2=(2/b)e^3\wedge e^1\), and \(de^3=2c e^1\wedge e^2\). In the \(\sigma\) coframe the three displayed connection entries are \((2-v)\sigma_3,\sqrt v\,\sigma_1,\sqrt v\,\sigma_2\), respectively, where \(v=b^2/a^2=1-x\). With matrix multiplication and exterior products,

\[
 \operatorname{tr}(\omega\wedge d\omega)=-4[2v+(2-v)^2]\sigma_{123},\qquad
 \operatorname{tr}(\omega^{\wedge3})=6v(2-v)\sigma_{123}.
\]

In the quadratic trace each pair of opposite entries contributes twice with a minus sign. In the cubic trace the six cyclic and reversed terms have the same positive sign, since a reversal changes both the skew entries and the order of the forms. For the Pontryagin convention \(p_1=-(8\pi^2)^{-1}\operatorname{tr}(\Omega\wedge\Omega)\), the resulting absolute integral in this frame is

\[
 \int_{S^3}\operatorname{CS}_{p_1}(\omega)
 =-\frac{1}{8\pi^2}\int_{S^3}\operatorname{tr}\!\left(\omega\wedge d\omega+\tfrac23\omega^{\wedge3}\right)
 =2[1+(1-v)^2].
\]

To turn this into the real eta difference, take a smooth product-ended metric \(dt^2+h(t)\) on \([0,1]\times S^3\), joining the unit round metric to \(h_r\) along metrics of the displayed diagonal form with positive coefficients. Orient it by \(dt\wedge\sigma_{123}\). There is a global frame extending the normalized left frames at the ends, with \(\partial_t\) as its first vector. On each end the connection is the intrinsic connection plus a trivial normal line. In the global frame \(d\operatorname{CS}_{p_1}=p_1\), so by Stokes the Pontryagin integral on the cylinder is \(2(1-v)^2\), with the round end subtracted. Its signature is zero since \(H^2([0,1]\times S^3;\mathbb R)=0\).

[Atiyah–Patodi–Singer I, Theorem (4.14), p. 66](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24) gives \(\operatorname{sign}X=\int_X L-\eta(0)\) for a compact oriented smooth Riemannian \(4k\)-manifold with an exactly product metric near its boundary. Here \(L=p_1/3\) and the eta function is the one for the boundary operator on even forms. The lower end has reversed orientation, and the round eta vanishes, since reversing orientation reverses the eta invariant and the round metric has an orientation-reversing isometry. Therefore

\[
 \eta(\Sigma_r,h_r)=\eta(S^3,h_r)-\eta(S^3,h_{\mathrm{round}})
 =\tfrac13\int_{[0,1]\times S^3}p_1=+\tfrac23(1-v)^2.
\]

The product-ended cylinder and its global frame fix the integer ambiguity of an individual Chern–Simons value. No curvature of the Fubini–Study ball or transgression from its Levi-Civita connection enters this determination.

## Extrinsic term

The outward unit normal is \(\partial_r\). For \(B(X,Y)=g(\nabla_X\partial_r,Y)\) the three principal curvatures are \(\beta,\beta,\gamma\), with \(\beta=a'/a=\cot r\) and \(\gamma=b'/b=\cot r-\tan r\). Put \(q=\gamma-\beta=-\tan r\). For \(B_i^\circ=\beta_i^\circ e^i\) the coefficients are \((\beta_1^\circ,\beta_2^\circ,\beta_3^\circ)=(-q/3,-q/3,2q/3)\), constant on each slice. Cartan's equation gives

\[
 (d^\nabla B^\circ)_i=\sum_j(\beta_j^\circ-\beta_i^\circ)\,\omega^i{}_j\wedge e^j,
\]

whose three components are \(-qc\,e^2\wedge e^3\), \(-qc\,e^3\wedge e^1\), and \(2qc\,e^1\wedge e^2\), respectively. Using \((\operatorname{curl}B^\circ)_{il}=\varepsilon_l{}^{jk}\nabla_j B^\circ_{ik}\) gives

\[
 \begin{aligned}
 \langle B^\circ,\operatorname{curl}B^\circ\rangle\,d\sigma
 &=\sum_i B_i^\circ\wedge(d^\nabla B^\circ)_i
 =2q^2c\,e^1\wedge e^2\wedge e^3,\\
 \mathcal T(\Sigma_r)&=4\pi^2 q^2 b^2=4\pi^2 \sin^4 r.
 \end{aligned}
\]

## Chiral bulk terms

The Hopf quotient metric in the affine coordinate \(w\in\mathbb C^2\) is obtained by horizontal projection of the derivative of \((1,w)/\sqrt{1+|w|^2}\). Explicitly, its real bilinear form is

\[
 g_w(X,Y)=\operatorname{Re}\left[\frac{X^\dagger Y}{1+|w|^2}-\frac{(X^\dagger w)(w^\dagger Y)}{(1+|w|^2)^2}\right].
\]

First derivatives vanish at \(w=0\). For real orthonormal \(X,Y\) at that point, set \(u=\operatorname{Im}(X^\dagger Y)=\langle JX,Y\rangle\) and \(w=sX+tY\). The quadratic parts of \(g_{XX},g_{YY},g_{XY}\) in these coordinates are \(-2s^2-(1+u^2)t^2\), \(-(1+u^2)s^2-2t^2\), and \(-(1-u^2)st\). The sectional curvature in the convention of Section 2 is \(g_{XY,st}-\tfrac12(g_{XX,tt}+g_{YY,ss})=1+3u^2\). This holds at every point by the unitary group action.

Writing \(\mathcal J(X\wedge Y)=JX\wedge JY\) and \(\varpi(X,Y)=g(JX,Y)\), the curvature operator is \(I+\mathcal J+2\varpi\otimes\varpi\). This operator has the displayed sectional curvatures and satisfies the algebraic Bianchi identity, as the cyclic sum of the \(\mathcal J\) term is minus twice that of \(\varpi\otimes\varpi\). The stated operator thus follows by polarization. The Kähler form \(\varpi\) is self-dual in the complex orientation and has squared norm \(2\). In a unitary real basis \(\mathcal J\) acts as \(+I\) on its line and on \(\Lambda^-\) and as \(-I\) on the orthogonal complement of its line in \(\Lambda^+\). The sectional curvature formula gives \(\operatorname{Ric}=6g\) by summing over the three orthogonal directions to a unit vector. Subtracting \(R/12=2\) from the curvature blocks gives the Weyl spectra \((4,-2,-2)\) and \((0,0,0)\). Their squared Hilbert–Schmidt norms are \(24\) and \(0\), yielding the reported energies.

The radius endpoints are limits of these formulas. At \(r=0\) there is no hypersurface. At \(r=\pi/2\) the Hopf circle collapses at the cut locus \(\mathbb{CP}^1\) and the ball no longer has a smooth Berger boundary. Reversing the ambient orientation exchanges the two chiral energies and reverses the signs of \(\eta\) and \(\mathcal T\).

## Source and verification scope

On 27 November 2026, the primary scanned edition of M. F. Atiyah, V. K. Patodi and I. M. Singer, *Spectral asymmetry and Riemannian Geometry. I*, Math. Proc. Cambridge Philos. Soc. **77** (1975), 43–69, was inspected at Theorem (4.14) and item (iii), printed p. 66, and at the orientation reversal discussion with equations (1.5) and (1.7), pp. 44–45. [DOI 10.1017/S0305004100049410](https://doi.org/10.1017/S0305004100049410). This is a passage check supplementing the [existing shared source record](../../../../../references/claude/SOURCE_NOTES_CUT_GEOMETRY_20261126.md). The calculation neither imports any Berger eta formula nor assumes the general ledger identity. The script checks only the rational algebra after the geometric reductions, and this return is an all-radius special-case check awaiting a separate replay.
