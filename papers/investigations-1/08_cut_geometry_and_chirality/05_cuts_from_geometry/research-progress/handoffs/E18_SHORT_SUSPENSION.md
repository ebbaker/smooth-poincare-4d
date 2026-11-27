# GEO-E18 · The short Berger suspension

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex. Bounded E packet, [revision 1](ISSUE_BERGER_COMPLETION_20261127.md), with requested GPT‑6.2 Sol/ultra settings. Actual serving model and effort are unavailable. Inputs over baseline `bc2c1bb` are the working [E06 germ](E06_GERM.md), the [angular area test](../../notes/GLOBAL_AREA_TEST_20261127.md), and §2 of the [parent manuscript](../../../manuscript/cuts_of_subcritical_conformal_classes.tex). The bounds below are analytic.

The prescribed smooth metric on the standard \(S^4\) agrees with E06 on an open collar of the central orbit. The closed angular three-sphere has area less than \(777\pi/512\), while the central orbit has area \(2\pi^2\sqrt{65}/4\). Each interpolating cap has negative ambient scalar curvature at its transition midpoint.

## Metric and polar charts

Identify \(S^3\) with the unit quaternions and let \(\sigma_i\) be the coframe dual to the round unit fields \(X_i(q)=q\mathbf e_i\), where \(\mathbf e_i\) are the quaternion units in cyclic order. The brackets are \([X_i,X_j]=2X_k\) for cyclic \(i,j,k\). Work in positive Riemannian signature, with unit round sectional curvature \(+1\) and orientation \(ds\wedge\sigma_1\wedge\sigma_2\wedge\sigma_3\). For \(b=1/(2\sqrt{2})\), the E06 logarithmic warps are

\[
 L_1(s)=bs-\frac{67}{32}s^2,\quad
 L_2(s)=-bs-\frac{67}{32}s^2,\quad
 L_3(s)=\log t+\frac{129}{32}s^2,\qquad t=\frac{\sqrt{65}}4.
\]

Indeed the Berger orbit has Ricci eigenvalues \((-33/8,-33/8,65/8)\), and the E06 normal jets use \(L_i''=r_i-1/16\). To define the cutoff on both caps let \(x=|s|\), \(z=32x-1\), and put

\[
 F(v)=\begin{cases}e^{-1/v}&v>0,\\0&v\le0,\end{cases}
 \qquad \chi(x)=\frac{F(1-z)}{F(z)+F(1-z)}.
\]

Every derivative from the positive side of \(F\) at zero tends to zero, since it is a polynomial in \(1/v\) times \(e^{-1/v}\). The denominator is everywhere positive. Consequently \(\chi=1\) on \(x\le1/32\), \(\chi=0\) on \(x\ge1/16\), and all derivatives of the deviations from those constants vanish at the transition endpoints. On the regular part \(-1/4<s<1/4\) define

\[
 u_i(s)=\chi(x)L_i(s)+(1-\chi(x))\log\sin(1/4-x),
 \qquad a_i(s)=e^{u_i(s)},\qquad
 g=ds^2+\sum_i a_i(s)^2\sigma_i^2.
\]

The factors involving \(|s|\) outside the germ vanish identically near \(s=0\). At the left and right ends use \(r_-=1/4+s\) and \(r_+=1/4-s\), respectively. Both metrics equal \(dr_\pm^2+\sin^2r_\pm\,g_{S^3}\) for \(0<r_\pm\le3/16\). In the two smooth charts \(y=r_\pm q\in\mathbb R^4\), set \(k(r)=(\sin r/r)^2\). The metric is

\[
 k(r)|dy|^2+\frac{1-k(r)}{r^2}(y\cdot dy)^2.
\]

Both coefficients are smooth functions of \(r^2\) with \(k(0)=1\), giving a nondegenerate extension across each pole. In the inward distance coordinate the warps have the exact odd Taylor series of \(\sin r\), with first derivative \(1\) and all even derivatives zero at the pole. In the \(s\) coordinate the endpoint first derivatives are \(+1\) at the left pole and \(-1\) at the right pole. These two polar charts are the standard smooth charts of the \(S^3\) suspension \(S^4\). Reflecting \(s\) and conjugating \(q\) by the unit imaginary quaternion \((\mathbf e_1+\mathbf e_2)/\sqrt2\) gives an isometry that interchanges the caps. The conjugation exchanges axes 1 and 2 and reverses axis 3, which agrees with the behavior of the squared warps under reflection.

The central orbit \(\Sigma_0\) has \(H=\sum_i u_i'=0\) and volume factor \(a_1(0)a_2(0)a_3(0)=t\), so it is minimal with

\[
 \operatorname{Area}_g(\Sigma_0)=2\pi^2 t.
\]

On the germ region the volume factor is \(t\exp(-5s^2/32)\). The E06 Jacobi index one and nullity zero apply to this orbit. Its induced scalar curvature is \(-1/8\), and its ambient scalar curvature is \(1/4\). The strict ambient entering inequalities hold on a sufficiently small neighborhood of the orbit inside the germ region.

## Angular area on both caps

The angular hypersurface \(D\) is given by \(\operatorname{Re}q=0\) on every regular orbit and includes the two poles. In the coordinates \(y=r_\pm q\) it is given by \(\operatorname{Re}y=0\), so it is a closed smooth embedded \(S^3\). Its minimality follows by the divergence calculation of the [angular area test](../../notes/GLOBAL_AREA_TEST_20261127.md). In brief, put \(q=x_0+\sum_i x_i\mathbf e_i\), \(m_i=a_i^{-2}\) and \(v^2=\sum_i m_ix_i^2\). The unit normal in the orbit is \(-\sum_i m_ix_i X_i/v\) near \(D\), and each \(X_i\) preserves the round Haar volume, hence the slice volume. The derivatives \(X_i x_0=-x_i\) and \(X_i x_j=x_0\delta_{ij}+\sum_k\epsilon_{kij}x_k\) give divergence \(-x_0\sum_i m_i/v+x_0\sum_i m_i^2x_i^2/v^3\). The alternating term vanishes by symmetry in \(i,j\). The ambient divergence of this normal equals the slice divergence, since the slices are orthogonal to the unit geodesic radial field. Hence \(D\) is minimal on the regular part and by smoothness at the poles.

For \(q\) on this equatorial two-sphere in an orbit, let \(\omega\in S^2\) denote its imaginary coordinate vector. The round normal has frame components \(-\omega_i\). The area Jacobian on the round tangent plane is the norm of the cofactor of \(\operatorname{diag}(a_1,a_2,a_3)\) applied to that normal. The exact area integral, including the unit radial tangent, is

\[
 I=\operatorname{Area}_g(D)=\int_{-1/4}^{1/4}\int_{S^2}
 \sqrt{(a_2a_3)^2\omega_1^2+(a_3a_1)^2\omega_2^2+(a_1a_2)^2\omega_3^2}
 \,d\omega\,ds .
\]

For \(x\le1/16\), \(b<1/2\) and \(e^u\le(1-u)^{-1}\) for \(0\le u<1\) give

\[
 e^{L_1},e^{L_2}\le e^{1/32}\le32/31<9/8,\qquad
 e^{L_3}=t e^{129s^2/32}<(9/4)e^{1/32}<5/2.
\]

Here \(129s^2/32\le129/8192<1/32\), and the sine warp is less than \(1/4\). Each log interpolation is bounded by the larger endpoint warp. Every pair \(a_j a_k\) in the cofactor is therefore less than \(3\). The integrand is bounded by the maximum pair product because \(\sum_i\omega_i^2=1\). This bounds the area of the portion \(|s|\le1/16\) by \(4\pi\cdot3\cdot(1/8)=3\pi/2\), with strict inequality. On each outer portion the integrand is exactly \(\sin^2r_\pm\), giving the bound

\[
 4\pi\int_0^{3/16}\sin^2 r\,dr
 <\frac{4\pi}3(3/16)^3=\frac{9\pi}{1024}.
\]

Together \(I<777\pi/512<2\pi^2t\). The two contributions from the halves \(s\ge0\) and \(s\le0\) are equal by the cap isometry and each is less than \(777\pi/1024\). Thus the actual metric has a smaller closed minimal hypersurface than the central orbit.

## Scalar curvature at the cap midpoints

On the right cap differentiate with respect to \(x=s\). Write \(r=1/4-x\), \(p=\log\sin r\), and \(H=\sum_i u_i'\) for the mean curvature in the normal \(\partial_x\). At \(x_*=3/64\) one has \(z=1/2\) and \(r_*=13/64\). For \(0<z<1\), \(\chi=(1+\exp((1-z)^{-1}-z^{-1}))^{-1}\). Thus \(\chi(x_*)=1/2\), \(\chi'(x_*)=-64\), and \(\chi''(x_*)=0\), the last also following from reflection antisymmetry about \(1/2\) after subtracting \(1/2\). Since \(p'=-\cot r\), \(p''=-\csc^2r\), and \(\sum_i L_i=\log t-5x^2/32\), the exact midpoint formulas are

\[
 \begin{aligned}
 H&=\frac{-5x_*/16-3\cot r_*}{2}
       -64\biggl(\sum_i L_i(x_*)-3p\biggr),\\
 H'&=-\frac{5}{32}-\frac32\csc^2 r_*
        -128\bigl(-5x_*/16+3\cot r_*\bigr).
 \end{aligned}
\]

On the transition \(e^{L_1},e^{L_2}>3/4\), because \(L_1,L_2\ge-1/32-67/8192>-1/16\) and \(e^u\ge1+u\). Also \(e^{L_3}\ge t>2\). Since \(\sin r_*<1/4\), every \(L_i(x_*)-p>\log 3>1\), giving \(H<-192\). The sine lower bound \(sin r_*\ge r_*-r_*^3/6>1/6\) gives \(\csc^2r_*<36\) and \(\cot r_*<6\). Hence \(H'>-2359\).

At the midpoint each \(a_i^2=e^{L_i}\sin r_*\) is between \(1/8\) and \(5/8\). On the orbit, the orthonormal fields \(X_i/a_i\) have cyclic structure constants \(\lambda_i=2a_i/(a_ja_k)\). Koszul gives \(\nabla_{e_i}e_i=0\) and \(2\langle\nabla_{e_i}e_j,e_k\rangle=\lambda_k-\lambda_i+\lambda_j\) for cyclic \(i,j,k\), where \(e_i=X_i/a_i\). Substituting into the intrinsic sectional curvature gives

\[
 K_{ij}=\frac14(\lambda_i-\lambda_j)^2
           +\frac12\lambda_k(\lambda_i+\lambda_j)-\frac34\lambda_k^2,
 \qquad
 R_h=-\frac12\sum_i\lambda_i^2+\sum_{i<j}\lambda_i\lambda_j.
\]

The product identity \(\lambda_i\lambda_j=4/a_k^2\) for distinct indices gives \(R_h\le4\sum_k a_k^{-2}<96\). The curvatures in the radial planes are \(-u_i''-(u_i')^2\), and the tangential sectional curvatures are \(K_{ij}-u_i'u_j'\) by Gauss. Thus at the right midpoint

\[
 R_g=R_h-2H'-H^2-\sum_i(u_i')^2
 < 96 + 2\cdot2359 -192^2=-32050.
\]

The same bound holds on the entire orbit \(s=-3/64\) by the cap isometry. Each pole neighborhood itself has round scalar curvature \(12\). The explicit failure of \(R>0\) occurs in the interpolation and excludes this metric as an entering gauge. The area comparison is a least-area comparison between two closed minimal hypersurfaces of this specific metric. The parent first-width identification requires positive Ricci curvature, a hypothesis that fails here. The pointwise test gives no conclusion about conformally related gauges or about other completions of the germ.

## Input versions

| Working input | SHA-256 |
| --- | --- |
| `ISSUE_BERGER_COMPLETION_20261127.md` | `57bc237161733cf033cdb9eb081c3d0c4fe85e53dabe55cbdf5056c856b58ef8` |
| `E06_GERM.md` | `589e2ad26823a71e8c9868afdf6d7ce28776f335f980b868935cf48bedc8f25e` |
| `GLOBAL_AREA_TEST_20261127.md` | `270954fe017346bd7201ff117dfe46a5be96128bbfca1c1cf31edbb5df542ff4` |
| `cuts_of_subcritical_conformal_classes.tex` | `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0` |
