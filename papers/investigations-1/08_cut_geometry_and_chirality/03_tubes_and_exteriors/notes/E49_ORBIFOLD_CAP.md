# E49 — Positive orbifold compactification of the half-flat Berger collar

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance under [E49_REQUEST_R1](../research-progress/handoffs/E49_REQUEST_R1.md). Sol 6.2/ultra requested. Actual model and effort unavailable. Base checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Working SHA-256 prefixes are e13a82fe1f7ac8ed6 for [E15](../reviews/E15_QUATERNIONIC_COLLAR.md), 25ee65328a65213b6 for [E35](E35_COVER_CAP.md), and 84c2f83a2a6cfcb3 for the [quaternionic marking](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md).

The collar compactifies to a smooth Riemannian orbifold metric on \(B^4/Q_8\), with its specified nonround Berger boundary. An explicit smooth conformal factor makes that face totally geodesic and makes scalar curvature strictly positive everywhere. The cap contributes zero to the smaller signed energy when glued in the required orientation. The checked orbifold Weyl inequalities on the resulting closed comparisons give no improvement over the smooth reflection bound \(E_+(W)\ge\pi^2/6\).

## Exact compactification and the Berger face

Take the right-invariant quaternion coframe \(\sigma_i\), \(d\sigma_i=2\sigma_j\wedge\sigma_k\) cyclically. On E15's cylinder \(v\ge0\), put \(r=e^{-v}\), \(x=r^2\) and \(F=1+4x-2x^2\). The cylinder and its compactification are
\[
 g=\frac{dv^2}{F}+\sigma_1^2+\sigma_2^2+F\sigma_3^2,\qquad
 \bar g=r^2g=\frac{dr^2}{F}+r^2(\sigma_1^2+\sigma_2^2+F\sigma_3^2).
\]
Here \(r=1\) is the old face and \(r=0\) is the added point. Write a Cartesian quaternion as \(X\) and define the smooth one-forms \(\alpha=\langle X,dX\rangle\) and \(\beta=\langle kX,dX\rangle\). On \(r>0\) they are \(r\,dr\) and \(r^2\sigma_3\), respectively. In the Euclidean chart the compactified tensor is exactly
\[
 \bar g=g_{\rm Eucl}-\frac{4-2r^2}{F}\,\alpha^2+(4-2r^2)\,\beta^2 .
\]
Both apparent polar degeneracies have canceled. The resulting tensor is smooth with value \(g_{\rm Eucl}\) at \(X=0\), and is positive definite on the whole chart since \(1\le F\le3\) and the original polar expression is positive off the origin. Left multiplication by \(Q_8\) fixes \(\alpha\) and acts on \(\beta\) by the sign with which its adjoint action sends \(k\) to \(k\) or \(-k\). Hence it preserves the tensor. This gives the smooth orbifold cap \(A=B^4/Q_8\) with standard linear isotropy at its sole singular point.

The face at \(r=1\) has the same induced metric \(h_B=\sigma_1^2+\sigma_2^2+3\sigma_3^2\) and the same quaternion axis labels. The comparison uses the short marked line \(i\), so the cyclic lift is \(\widetilde A=B^4/\langle i\rangle\) with boundary \(\langle i\rangle\backslash S^3\). Although the anisotropy is along \(k\), its square is invariant under \(\langle i\rangle\), as required by this actual boundary cover. The twofold orbifold cover is everywhere the indicated action-group inclusion. [E35, actual extending subgroup](E35_COVER_CAP.md#actual-cover-and-signed-energies)

## Exact positive scalar gauge and reflection

Use \(\Delta=\operatorname{div}\nabla\) and the four-dimensional conformal Laplacian \(L=-6\Delta+R\). The volume density of \(g\) in \(v\) is constant in \(v\), and its radial Laplacian is \(\Delta_g u=(F u_v)_v\). Thus \(\Delta_g r/r=1+12x-10x^2\). E15 gives \(R_g=6(1-4x+6x^2)\). The bare compactification therefore has
\[
 R_{\bar g}=r^{-3}L_g r=-96(1-x).
\]
It is the following further scale that gives positive scalar curvature. Define \(D=1+4x\), \(f=(5/D)^{5/8}\) and \(G=f^2\bar g\). The old cylindrical face was totally geodesic, so in \(\bar g=r^2g\) it is umbilic with common outward principal curvature \(\sqrt3\). On \(r=1\) the outward unit normal for \(\bar g\) is \(\sqrt3\,\partial_r\). Since \(f(1)=1\) and \(\partial_r\log f(1)=-1\), the face in \(G\) is totally geodesic and still has induced metric \(h_B\).

The \(\bar g\) volume density is proportional to \(r^3\,dr\) and its radial inverse component is \(F\). For a function of \(x\) this gives
\[
 \Delta_{\bar g}f=4\left[xF f_{xx}+(2F+xF_x)f_x\right].
\]
With \(f_x/f=-5/(2D)\) and \(f_{xx}/f=65/(4D^2)\), direct substitution gives the exact formula
\[
 R_G=f^{-3}(-6\Delta_{\bar g}f+R_{\bar g}f)
    =24 f^{-2}\frac{1+\tfrac{23}{4}x+3x^2+\tfrac{33}{2}x^3}{(1+4x)^2}
    >0\qquad(0\le x\le1).
\]
The formula holds also at the orbifold centre, whose uniformizing metric is smooth. This yields a positive Neumann conformal-Laplacian form on \(G\) and a positive Robin form in the conformally equivalent gauge \(\bar g\).

In a normal collar, totally geodesic means the orbit metric has zero first derivative at the face. Its exact even reflection gives a \(C^{2,1}\) orbifold metric with continuous strictly positive scalar curvature. Smooth reflection-invariant approximations in \(C^2\), supported near the face, therefore give a smooth positive double. The exact reflection has a curvature-derivative mismatch. In the compact cap orientation \(W^+\) vanishes at the face with a nonzero normal derivative inherited from \(2\dot z\) in E15's other block, where \(z=F-1\) and \(\ddot z(0)=-16\). Reflection switches chiralities and the other block of the cap is identically zero, so this mismatch persists under any smooth positive conformal rescaling of the exact cap. The smooth comparisons use smoothing of the seam with energy convergence.

## Correct signed matching

The orientation of \(A\) is \(dr\wedge\sigma_{123}\), with outward quaternion boundary at \(r=1\). This is opposite to E15's cylinder orientation \(dv\wedge\sigma_{123}\). In the cylinder orientation \(W^+=0\). The other block has axial eigenvalue \(2\dot z\) with \(z=4e^{-2v}-2e^{-4v}\), and both other eigenvalues have half its magnitude. The orbit volume combined with \(ds=dv/\sqrt F\) gives \(\pi^2\,dv/4\) downstairs. Thus its nonzero energy is
\[
 \frac{3\pi^2}{2}\int_0^\infty \dot z^2\,dv
 =\frac{3\pi^2}{2}\,64\left(\frac14-\frac13+\frac18\right)
 =4\pi^2 .
\]
The conformal factors preserve both signed integrals in dimension four, and the added point has zero volume. In real chiral Hilbert–Schmidt norms the outward signed pairs are therefore \(A:(4\pi^2,0)\) and \(\widetilde A:(8\pi^2,0)\). The second pair follows by the degree two over the regular set. Their respective exact reflected doubles have equal signed energies \(4\pi^2\) and \(8\pi^2\), since reflection exchanges the signs. [E15, chiral Cartan normalization](../reviews/E15_QUATERNIONIC_COLLAR.md)

Let \(W\) be a smooth prescribed short-axis disk cap with strictly positive Robin conformal-Laplacian sign and umbilic marked boundary. Choose its smooth conformal representative to have the given \(h_B\) and zero second fundamental form. This can be done by prescribing the boundary value and normal derivative of the conformal scale and retains the positive sign by conformal covariance. In a common boundary chart the cap \(A\) has exactly the same tangential metric and first normal jet. The orientation-compatible gluing across the identity marking is \(X=W\cup_Y(-A)\). Thus the comparison contributes precisely zero in the plus block, which is the smaller signed energy of \(W\) by E35. The corresponding lift is \(\widetilde X=\widetilde W\cup_{\widetilde Y}(-\widetilde A)\), since both pieces use the same short subgroup.

The matched metrics first give a \(C^{1,1}\) gluing. The positive Neumann forms on the pieces add on functions with a shared trace and are coercive against the combined \(H^1\) norm. The same holds upstairs, where the positive sign of the smooth piece lifts by pulling back its positive Neumann eigenfunction and taking that conformal representative. To apply a smooth orbifold inequality, interpolate each side to the common product with \(h_B\) in a shrinking collar. The tangential metric differs from its boundary value by \(O(s^2)\) and has normal derivative \(O(s)\) in distance \(s\), so this interpolation has uniformly bounded second derivatives and tends to the original glued metric in \(C^1\cap W^{2,p}\) for finite \(p\). The singular chart is unchanged. The \(L^2\) scalar convergence and the four-dimensional Sobolev estimate preserve the strict quadratic form sign, while both Weyl energies converge. Thus one has smooth positive-Yamabe orbifold approximants with the stated limiting energies. [Positive Robin forms and productization](../../02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md)

## Orbifold Weyl estimates

The attached cones are contractible and their regular boundary links are rational homology spheres. Mayer–Vietoris and van Kampen give \(\chi(X)=2\), \(b_2(X)=0\), and \(\chi(\widetilde X)=3\), \(b_2^-(\widetilde X)=1\), \(b_2^+(\widetilde X)=0\), using the self-intersection \(-4\) of the lifted bolt. Both underlying topological spaces are simply connected. Each has a single isolated orbifold point. By additivity of energies and the E35 defects, the closed signed differences are \(-9\pi^2\) and \(-18\pi^2\), respectively.

Chanyoung Sung defines \(\chi_{\rm orb}=\chi-\sum(1-1/|\Gamma|)\) and \(\tau_{\rm orb}=(E_+-E_-)/(12\pi^2)\), the curvature signature rather than the underlying intersection signature. These conventions match the present operator norm. The corrected values are

| Comparison | \(\lvert\Gamma\rvert\) | \(\chi_{\rm orb}\) | \(\tau_{\rm orb}\) | \(2\chi_{\rm orb}+3\tau_{\rm orb}\) | \(2\chi_{\rm orb}-3\tau_{\rm orb}\) |
| --- | ---: | ---: | ---: | ---: | ---: |
| \(X\) | 8 | \(9/8\) | \(-3/4\) | \(0\) | \(9/2\) |
| \(\widetilde X\) | 4 | \(9/4\) | \(-3/2\) | \(0\) | \(9\) |

The plus-chiral topological term vanishes in both comparisons. The lifted negative bolt class allows Sung's Theorem 1.4(v) in the reversed orientation, yielding \(E_-(\widetilde X)\ge12\pi^2\). But \(E_-(\widetilde X)=E_+(\widetilde W)+18\pi^2\) in the limit, so the test is weaker than nonnegativity. The finite ordinary fundamental-group case in Theorem 1.4(ii), together with the single local order in each orbifold, gives \(E_-(X)\ge8\pi^2\) and \(E_-(\widetilde X)\ge16\pi^2\). Both are again weaker than the bounds from the signed differences alone, and its plus inequalities have nonpositive right-hand sides. These applications are to the smooth positive-Yamabe approximants, and take limits only after applying the inequalities. [Sung, *The Weyl functional on 4-manifolds of positive Yamabe invariant*, arXiv:2108.03808v1, Theorem 1.4(ii), (v), and equation (11)](https://arxiv.org/pdf/2108.03808#page=5)

The exact cap is therefore a legitimate singular auxiliary comparison with zero contribution to the wanted plus block. The available estimates tested on it leave the E35 smooth-cover floor as the stronger bound and do not settle the short-axis filling budget.
