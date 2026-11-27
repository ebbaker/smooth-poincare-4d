# GEO-E20 · Independent replay of the short Berger suspension

27 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution under the [reader addendum](../research-progress/handoffs/ISSUE_BERGER_REPLAY_ADDENDUM_20261127.md). Requested GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. Inputs are the working [E06 germ](../research-progress/handoffs/E06_GERM.md), [E18 suspension](../research-progress/handoffs/E18_SHORT_SUSPENSION.md), and [angular area test](../notes/GLOBAL_AREA_TEST_20261127.md) over `bc2c1bb`. The checks below use smooth Riemannian metrics with sectional curvature \(+1\) on the unit round sphere. The suspension orientation on the regular part is \(ds\wedge\sigma_1\wedge\sigma_2\wedge\sigma_3\).

The E18 metric is smooth on the standard \(S^4\) and has negative scalar curvature on both transition midpoint orbits. Its integral fundamental-class one-parameter Almgren–Pitts width satisfies

\[
W_1(g)\le I=\operatorname{Area}_g(D)<\frac{777\pi}{512}<\operatorname{Area}_g(\Sigma_0)=2\pi^2\frac{\sqrt{65}}4,
\]

where \(D\) is the angular equator and \(\Sigma_0\) the central orbit. The width bound follows from a family of integral cycles for this metric. Its verification uses no curvature assumption.

## Polar closure and physical scalar curvature

Put \(x=|s|\), \(r=1/4-x\), \(t=\sqrt{65}/4\), and \(b=1/(2\sqrt2)\). The E06 logarithmic warps are

\[
L_{1,2}=\pm bs-67s^2/32,\qquad L_3=\log t+129s^2/32,
\qquad \sum_i L_i=\log t-5s^2/32.
\]

The warps in E18 are \(a_i=e^{u_i}\), with \(u_i=\chi(x)L_i+(1-\chi(x))\log\sin r\). Writing \(u=32x-1\), the cutoff is \(\chi=F(1-u)/(F(u)+F(1-u))\), with \(F(v)=e^{-1/v}\) for \(v>0\) and zero for \(v\le0\). It is flat at both transition joins. It is identically one for \(x\le1/32\), so \(x=|s|\) causes no regularity issue at the center. The central mean curvature for \(\partial_s\) is \(H=\sum_i u_i'=0\), and the round unit-quaternion volume normalization gives the displayed central area. The central index, nullity and induced conformal-Laplacian sign from E06 are unchanged by this construction.

At each pole the chart \(y=rq\in\mathbb R^4\) gives the metric \(k(r)|dy|^2+(1-k(r))(y\cdot dy)^2/r^2\), where \(k=(\sin r/r)^2\). Both coefficients extend smoothly as functions of \(r^2\). These are the polar charts of the usual smooth suspension, as seen by the map \((s,q)\mapsto (\sin(2\pi s),\cos(2\pi s)q)\in S^4\subset\mathbb R\times\mathbb R^4\). In each polar chart its quaternionic component is \((\sin(2\pi r)/r)y\), with invertible derivative at \(y=0\). The equator \(D\) extends at each pole as the coordinate hyperplane \(\operatorname{Re}y=0\). The map \((s,q)\mapsto(-s,vqv^{-1})\), with \(v=(\mathbf e_1+\mathbf e_2)/\sqrt2\), is an isometry. Its angular part exchanges the short axes and reverses the third, as required under \(s\mapsto-s\).

Differentiate on the right cap with respect to \(x=s\), and write \(L=\sum_i L_i\) and \(p=\log\sin r\). At \(x_*=3/64\), \(r_*=13/64\), the cutoff satisfies \((\chi,\chi',\chi'')=(1/2,-64,0)\) by differentiating its defining ratio. Consequently

\[
H=\tfrac12(L'+3p')-64(L-3p),\qquad
H'=\tfrac12(L''+3p'')-128(L'-3p').
\]

Here \(p'=-\cot r_*\), \(p''=-\csc^2 r_*\), \(L'=-5x_*/16\), and \(L''=-5/16\). On the transition \(e^{L_{1,2}}>3/4\) and \(e^{L_3}>2\). Since \(\sin r_*<1/4\), one has \(L_i-p>\log 3>1\) for each \(i\), which gives \(H<-192\). From \(\sin r_*\ge r_*-r_*^3/6>1/6\) it follows that \(\cot r_*<6\) and \(\csc^2r_*<36\). This gives \(H'>-2359\).

The intrinsic scalar formula also follows from Koszul. Let \(X_i(q)=q\mathbf e_i\) be the unit-round left-invariant fields. For cyclic \(i,j,k\) write \([X_i/a_i,X_j/a_j]=\lambda_k X_k/a_k\) with \(\lambda_k=2a_k/(a_i a_j)\). The cyclic connection coefficient is \((\lambda_k-\lambda_i+\lambda_j)/2\), and \(\nabla_{X_i/a_i}(X_i/a_i)=0\). Substituting gives \(R_{h_x}=\sum_{i<j}\lambda_i\lambda_j-\frac12\sum_i\lambda_i^2\le4\sum_i a_i^{-2}\). Since \(a_i^2=e^{L_i}\sin r_*>1/8\) at this midpoint, \(R_{h_x}<96\). The radial sectional curvatures and Gauss equation give

\[
R_g=R_{h_x}-2H'-H^2-\sum_i(u_i')^2<96+2(2359)-192^2=-32050.
\]

This also verifies the weaker E18 bound \(R_g<-31174\). The cap isometry gives the same failure at \(s=-3/64\). Each midpoint orbit has negative scalar and has a negative Ricci eigenvalue at every point. The round pole neighborhoods have scalar \(12\). These statements concern the physical metric used for the area comparison.

## Exact latitude mass

For \(-1<z<1\) and \(\omega\in S^2\) write the latitude as \(q=z+\sqrt{1-z^2}\,\omega\) and set \(\rho=\sqrt{1-z^2}\). With \(q=x_0+\sum_i x_i\mathbf e_i\), the unit-round left-invariant fields satisfy \(X_i x_0=-x_i\). Thus in their frame the round unit normal to the latitude has components \(-\omega_i\), while its round two-area element is \(\rho^2d\omega\). For \(A=\operatorname{diag}(a_1,a_2,a_3)\), the area factor on that tangent plane is \(|\operatorname{cof}(A)\omega|\), by the cross-product identity \(Av\times Aw=\operatorname{cof}(A)(v\times w)\). The radial vector \(\partial_s\) is a unit tangent orthogonal to the orbit. The resulting exact mass of the oriented latitude cycle is

\[
\mathbf M(T_z)=(1-z^2) I,\qquad
I=\int_{-1/4}^{1/4}\int_{S^2}
\sqrt{(a_2a_3)^2\omega_1^2+(a_3a_1)^2\omega_2^2+(a_1a_2)^2\omega_3^2}
\,d\omega\,ds.
\]

The E18 bound on this cofactor integral replays directly. For \(x\le1/16\), \(L_{1,2}\le1/32\) and \(L_3\le\log t+129/8192<\log(9/4)+1/32\). Using \(e^{1/32}\le32/31\), the two short warps are less than \(9/8\) and the long warp is less than \(5/2\), also after log interpolation with the sine warp. Every cofactor entry is less than \(3\), giving \(I|_{x\le1/16}<3\pi/2\). At either end the cofactor is exactly \(\sin^2r\) in every direction. Each polar integral is less than \(4\pi(3/16)^3/3=9\pi/1024\). Their sum gives the strict bound on \(I\). In particular, \(I/(2\pi^2t)<777/(1024\pi t)<1\). To check minimality of the angular equator put \(N=-\sum_i a_i^{-2}x_i X_i/v\), where \(v^2=\sum_i a_i^{-2}x_i^2\). The tangential divergence on \(x_0=0\) vanishes by the antisymmetry of the quaternionic structure constants. The ambient divergence is the same since \(N\) is tangent to the geodesic slices. Smoothness extends minimality across both poles.

## Integral cycles, concentration and class

On the complement of the two poles let \(\Omega_z=\{x_0<z\}\) for \(-1<z<1\). These are open in \(S^4\), and both poles belong to their topological boundary. Set \(\Omega_{-1}=\varnothing\), \(\Omega_1=S^4\), and \(T_z=\partial\llbracket\Omega_z\rrbracket\) with the fixed ambient orientation. In either \(y=rq\) chart the boundary at an interior parameter is the cone \(y_0=z|y|\). It is a graph over the imaginary coordinates \(y'\in\mathbb R^3\), given by \(y_0=z|y'|/\sqrt{1-z^2}\). The finite slope at each fixed \(z\in(-1,1)\) proves locally finite perimeter at each pole. Alternatively, excision of a radius-\(\epsilon\) ball at either pole in the boundary-current identity leaves a spherical face with mass \(O(\epsilon^3)\), so the polar points contribute no extra current. The boundary current has the multiplicity-one regular mass computed above and is a cycle because \(\partial^2=0\). At the endpoints both cycles are zero. For \(z=0\) the cones are smooth hyperplanes.

All angular level sets have four-volume zero, including the endpoint rays and poles. Dominated convergence gives \(\operatorname{Vol}(\Omega_z\triangle\Omega_w)\to0\) when \(w\to z\), including the endpoints. In particular

\[
\mathcal F(T_z-T_w)\le\mathbf M(\llbracket\Omega_z\rrbracket-\llbracket\Omega_w\rrbracket)
=\operatorname{Vol}(\Omega_z\triangle\Omega_w),
\]

so this is a based flat-continuous loop of integral cycles with bounded mass. Near either pole the mass in a ball of radius \(\epsilon\) about that pole is bounded uniformly by \(4\pi\int_0^\epsilon\sin^2 r\,dr\le4\pi\epsilon^3/3\). On each compact radial subinterval in the regular part the parametrization \(q=z+\rho\omega\) and the cofactor formula give weak continuity of the weight measures for interior \(z\). The polar estimate extends the continuity to the full sphere, and \(\mathbf M(T_z)=(1-z^2)I\to0\) gives continuity at the endpoints. Each limiting weight measure has no atoms. If there were concentration, a sequence of radii tending to zero with masses bounded below would admit convergent centers and parameters by compactness. Its balls would eventually lie in every fixed closed ball about the limiting center. The weak upper bound for closed sets would give a positive atom there. Therefore \(\lim_{\epsilon\downarrow0}\sup_{p,z}\|T_z\|(B_\epsilon(p))=0\).

Checked on 27 November 2026 were Definition 2.1 (sw2)–(sw3), Theorem 5.5 and (5.1), Theorem 5.8 and its telescoping sum, and Theorem 4.5 and Definition 4.6 in Xin Zhou, *Min-max minimal hypersurface in \((M^{n+1},g)\) with \(\operatorname{Ric}_g>0\) and \(2\le n\le6\)*, JDG **100** (2015), 129–160, [arXiv:1210.2112v2](https://arxiv.org/pdf/1210.2112v2). Theorem 5.5 applies to relative flat-continuous integral cycles with zero endpoints, bounded mass and no concentration on a closed smooth Riemannian ambient manifold. Theorem 5.8 uses in addition the oriented boundary currents of open sets satisfying volume continuity and the empty/full endpoints. The small filling currents telescope to \(\llbracket S^4\rrbracket\) under Almgren's isomorphism. Its proof and the construction in Theorem 5.5 use neither positive Ricci curvature nor regularity of the angular cones. Thus the discretization represents the integral fundamental class and has limiting maximal mass at most \(I\). Rounding the cones is unnecessary for this width.

Zhou's positive-Ricci least-area characterization (Theorem 1.1) has an additional hypothesis, which fails on this trial. The strict bound excludes the center of this metric from realizing its width. A comparison for any other closed metric with this germ needs the area integral for that metric. In particular, this trial provides no entering metric or width estimate for an entering conformal representative. Any separate obstruction based on the prescribed boundary data and a chiral budget is outside this replay.

## Input versions

| Working input | SHA-256 |
| --- | --- |
| `ISSUE_BERGER_REPLAY_ADDENDUM_20261127.md` | `930cb12740d28401ee0d7dd49085376bd71d8904b2246b8b4e540670bd97aaf4` |
| `E06_GERM.md` | `589e2ad26823a71e8c9868afdf6d7ce28776f335f980b868935cf48bedc8f25e` |
| `E18_SHORT_SUSPENSION.md` | `c874777cf5b5194b985b75d324e53630258f3ee9fa625188cfddc136cb2aec5b` |
| `GLOBAL_AREA_TEST_20261127.md` | `270954fe017346bd7201ff117dfe46a5be96128bbfca1c1cf31edbb5df542ff4` |
