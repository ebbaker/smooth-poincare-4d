# SP4-CUT-E08 · A finite-atlas bound for bending on a marked band

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance on the bounded E route. The requested helper configuration was GPT-6.2 Sol/ultra. Actual serving model and effort were unavailable for independent verification. The [frozen request][request] and the inputs below were read with HEAD `48f36794f9b1`. The parent [manuscript, §4][parent], [marked bending note][degree], [SEAM-E05 derivation][seam], [05 marked-cut manuscript][marked], [05 Mazur witness][mazur], and [master Mazur return][master] had respective SHA-256 prefixes `ad83e848744c`, `3c09300b920d`, `869d32b73f95`, `556753cbb5f4`, `c51c9c03de4c` and `c508ac1584bc`. The estimates below are exact sufficient conditions for one smooth Riemannian physical band. The marked-recognition implication uses 05's working theorem.

## Local coercivity from a finite slice atlas

Take a band with closed oriented three-dimensional slices \((Z,h_t)\), \(a\le t\le b\), a fixed finite atlas with coordinate domains \(\Omega_j\subset\mathbb R^3\), and smooth cutoffs \(\chi_j\) compactly supported in their charts with \(\sum_j\chi_j^2=1\). In each chart let \(0<m I\le (h_t)_{kl}\le M I\) on the cutoff support, and measure

\[
\ell_t=\sum_j|d\chi_j|_{h_t}^2\le L,\qquad
Q_t=R_g-2\operatorname{Ric}_g(\nu,\nu)+\tfrac23 H_t^2\ge q_*>0.
\]

The normal \(\nu\) points in increasing height, \(B_t(X,Y)=g(\nabla_X\nu,Y)\), and \(H_t=\operatorname{tr}_{h_t}B_t\). Take any common Euclidean Dirichlet constant \(S_D>0\) in \(\int_{\Omega_j}|Dv|^2 dx\ge S_D(\int_{\Omega_j}|v|^6 dx)^{1/3}\) for \(v\in C_c^\infty(\Omega_j)\). The denominator is the squared \(L^6\) norm.

At a point order the metric eigenvalues \(\lambda_1\le\lambda_2\le\lambda_3\). The gradient measure controls the Euclidean energy density because

\[
\sqrt{\det h_t}\,h_t^{-1}\ \ge\
\frac{\sqrt{\lambda_1\lambda_2\lambda_3}}{\lambda_3}\,I
\ \ge\ \frac{m}{\sqrt M}\,I.
\]

Also \(\sqrt{\det h_t}\le M^{3/2}\), so \(\|v\|_{6,h_t}^2\le \sqrt M\,\|v\|_{6,dx}^2\). Together these give the single-chart bound

\[
\int |dv|_{h_t}^2\,d\mu_{h_t}\ \ge\ k\,\|v\|_{6,h_t}^2,
\qquad k=S_D\,\frac{m}{M}.
\]

Apply it to \(v_j=\chi_j u\). The identity \(u^2=\sum_j v_j^2\) and the triangle inequality in \(L^3\) give \(\|u\|_{6,h_t}^2\le\sum_j\|v_j\|_{6,h_t}^2\). Expanding the differentiated products, the cross term vanishes by \(\sum_j\chi_jd\chi_j=0\). Hence the quadratic partition identity gives

\[
k\|u\|_{6,h_t}^2\ \le\ \sum_j\int|d(\chi_j u)|_{h_t}^2\,d\mu_{h_t}
=\int\bigl(|du|_{h_t}^2+\ell_tu^2\bigr)\,d\mu_{h_t}.
\]

The sum over chart overlaps is accounted for in \(\ell_t\), with no multiplicity factor in the \(L^6\) estimate. Comparing the last expression with the slice form gives the uniform constant

\[
S_t:=\inf_{u\ne 0}\frac{\int(8|du|_{h_t}^2+Q_tu^2)\,d\mu_{h_t}}{\|u\|_{6,h_t}^2}
\ \ge\ C_{\rm at}:=\frac{S_D(m/M)}{\max\{1/8,L/q_*\}}>0 .
\]

The denominator covers \(L=0\). By the scalar Gauss equation \(R_{h_t}=Q_t-|B_t^\circ|^2\), and Hölder gives

\[
Y(Z,[h_t])\ \ge\ C_{\rm at}-\|B_t^\circ\|_{3,h_t}^2.
\]

Strict positivity of the right-hand side gives a positive first eigenvalue of the three-dimensional conformal Laplacian \(-8\Delta_{h_t}+R_{h_t}\), and its positive first eigenfunction gives a smooth PSC representative. The same proof applies separately to each component of a disconnected slice, with measured bounds on its own atlas. [Parent, Theorem 4.1(3)][parent] · [SEAM-E05][seam]

**Potential with a measured deficit.** One can use \(Q_t\ge q_0-v_t\) with \(q_0>0\), \(v_t\ge0\), by measuring \(D=\sup_t\|v_t\|_{3/2,h_t}\), for example with \(v_t=(q_0-Q_t)_+\). Let \(C_0\) be the atlas constant computed with \(q_0\). Hölder gives \(S_t\ge C_0-\|v_t\|_{3/2,h_t}\) and more precisely \(Y(Z,[h_t])\ge C_0-\|v_t+|B_t^\circ|^2\|_{3/2,h_t}\). The same integrated test works with \(C_{\rm eff}=C_0-D>0\). This controls an integral deficit in the form, with pointwise positivity of \(Q_t\) only in the first version.

## Shear, scaling, and changes of coordinates

Write the actual band metric as \(g=N^2dt^2+h_t(dx+X\,dt,dx+X\,dt)\) with \(N>0\). Then \(\partial_t=N\nu+X\), \(dV_g=N\,dt\,d\mu_{h_t}\), and \(2NB_t=\partial_t h_t-\mathcal L_Xh_t\). Put \(A_t=(\partial_t h_t-\mathcal L_Xh_t)^\circ\), with trace removed using \(h_t\). The strict shear test is

\[
\begin{aligned}
\frac1{b-a}\int_a^b\!\int_Z |B_t^\circ|_{h_t}^3\,d\mu_{h_t}\,dt
&=\frac1{8(b-a)}\int_a^b\!\int_Z N^{-3}|A_t|_{h_t}^3\,d\mu_{h_t}\,dt\\
&=\frac1{8(b-a)}\int_{\rm band}N^{-4}|A_t|_{h_t}^3\,dV_g
< C_{\rm at}^{3/2}.
\end{aligned}
\]

At least one interior slice passes the pointwise-in-height cubic-integral threshold. If the band carries a degree-one map on its incoming face to the native target, the whole oriented level has total degree one. In the disconnected case it suffices that a component of nonzero degree is certified positive. Bounding the total cubic integral by the same threshold, when the same lower constant holds on every component, certifies all components separately. For a general homologous separator with a supplied pointwise potential and atlas on its own induced metric, the form proof is directly applicable componentwise. [Orientation and homology verification][degree]

Under \(g\mapsto\lambda^2g\), \(m,M\) scale by \(\lambda^2\), \(L,q_*\) by \(\lambda^{-2}\). The Euclidean coordinate data and \(S_D\) are fixed. The tensor \(A_t\) scales by \(\lambda^2\) as a covariant tensor and its pointwise norm is unchanged. The lapse scales by \(\lambda\) and the volume densities of slices and band by \(\lambda^3,\lambda^4\), respectively. Both shear expressions and \(C_{\rm at}\) are unchanged.

Under an arbitrary smooth positive conformal factor the chosen \(m,M,L,q_*\) can change, and even the pointwise sign of \(Q_t\) can change. The atlas, its cutoffs and the chart Sobolev datum are choices in fixed spatial coordinates. In fixed band coordinates \(\widehat N=e^wN\) and \(\widehat X=X\). The trace-free velocity satisfies \(\widehat A_t=e^{2w}A_t\), since the derivatives of the factor multiply \(h_t\) and are pure trace. The quotient \(S_t\) itself and the integrated cubic bending on a fixed slice are conformal invariants. In fact \(Q_t=R_{h_t}+|B_t^\circ|^2\). Under \(\widehat g=e^{2w}g\), \(\widehat h_t=e^{2w}h_t\), \(\widehat B_t^\circ=e^w B_t^\circ\) as a covariant tensor, and \(\widehat u=e^{-w/2}u\) preserves each form contribution and the sixth norm. This transfers a bound proved in a specified gauge to the same physical slices in the class. The computations in a certificate use one coherent representative or this explicit conformal comparison. [SEAM-E05, conformal uniformity][seam]

In new coordinates \((s,y)\mapsto(t(s),\phi_s(y))\), let \(t'(s)>0\), \(\phi_s\) be a smooth family of orientation-preserving slice diffeomorphisms, and \(V_s=(d\phi_s)^{-1}\partial_s\phi_s\). The lapse and shift become

\[
\widehat N=t'\phi_s^* N,\qquad \widehat X=t'\phi_s^* X+V_s,\qquad
\partial_s\widehat h=t'\phi_s^*(\partial_t h)+\mathcal L_{V_s}\widehat h.
\]

Thus \(\widehat A=t'\phi_s^* A\). The inner cubic slice integral is unchanged. When \(t'\) is constant, its normalized average is unchanged as well, since \(ds=dt/t'\) and the interval length changes by the same factor. A nonconstant height relabeling weights the same slice values by \(ds\), and can change the average. A time-dependent change of only the slice coordinates preserves the entire average. The atlas constant remains valid on the transported slice geometry, or can be measured anew with a fixed atlas in the new coordinates.

## Calibrations on 05's actual split cut

Take the split \(K\)-first level of 05. The original forward tubes are the product \(a_K(z,w)=(z,w,1)\) and the locally split, disk-framed \(a_S\). In the \(K\)-first coordinates the forward pending tube is transported by the lower ball map \(\partial G_K\) and angular mark \(L\); in the reverse order the first dual is \(S^*\) and the pending \(K^*\) is carried in the surviving exterior using the inverse marking of 05, §2, equation `dual`. Retain 05's closing \(\varphi\) with its inverse. The closing sends the old and inserted spectator disk to their two marked hemispheres at the same \(q_S\) angle. The marked diffeomorphism \(D\) is the one extending \(L\) over both balls. On the inverse latitude collar \(|q|\le\pi/6\), take \(Z_K\) as \(q=0\), with projection along the signed latitude to this actual cut. Each face with increasing normal has degree \(+1\). The compact band has outward normals \(-\partial_q\) and \(+\partial_q\) on its lower and upper faces. The two outward normals of its cut-open halves at \(q=0\) are opposite and the glued hemisphere caps use the opposite outward boundary orientations. [05, §2 and the split spherical collar][marked]

Write \(g=dq^2+\cos^2(q)\gamma\) on this collar, where \(\gamma\) is the unit round \(S^3\) metric. Its \(N=1,\ X=0,\ B=-\tan(q)h_q,\ H=-3\tan q\) give \(A_q=0\) and \(Q_q=6\sec^2 q\ge6\) since \(R_g=12\) and \(\operatorname{Ric}_g(\nu,\nu)=3\). For explicit atlas data take the eight charts \(\{\epsilon y_i>1/4\}\) on \(S^3\subset\mathbb R^4\), with \(i=1,\ldots,4\), \(\epsilon=\pm1\), and project off the \(i\)-th coordinate. In coordinates \(z\) the metric of the graph is \(I+zz^{\mathsf T}/(1-|z|^2)\) with eigenvalues \(1,1,(\epsilon y_i)^{-2}\). Hence \(m=3/4,\ M=16\) work for the full collar.

Choose a smooth scalar cutoff \(f\) equal to zero for \(s\le1/3\) and to one for \(s\ge1/2\), with \(0\le f\le1\) and \(|f'|\le12\). Convolving the linear ramp on \([3/8,11/24]\) with any smooth nonnegative unit-mass mollifier supported in \((-1/24,1/24)\) gives these properties. Form \(\kappa_{i,\epsilon}=f(\epsilon y_i)\) and \(\chi_{i,\epsilon}=\kappa_{i,\epsilon}/|\kappa|\). Some \(|y_i|\ge1/2\), so \(|\kappa|\ge1\). At most four cutoffs have nonzero derivatives at a point. The derivative of normalization is orthogonal projection divided by \(|\kappa|\), and \(|dy_i|_\gamma\le1\). Thus

\[
\sum_{i,\epsilon}|d\chi_{i,\epsilon}|_{h_q}^2
\le 4\cdot12^2\cdot\tfrac43=768.
\]

For a self-contained numerical Dirichlet constant, extend a compactly supported chart function by zero to \(\mathbb R^3\). For \(w\in C_c^1(\mathbb R^3)\), the fundamental theorem of calculus from both ends of the \(i\)-th coordinate line gives \(|w(x)|\le \frac12\int_\mathbb R|\partial_i w|\,dx_i\). Multiply the three bounds to the \(1/2\) power and integrate. Cauchy–Schwarz first in one coordinate and then in the other two gives \(\|w\|_{3/2}\le \frac12\prod_{i=1}^3\|\partial_iw\|_1^{1/3}\). Explicitly, for the three nonnegative line integrals \(a_i(x_{\widehat i})\), integrating the square root of \(a_1a_2a_3\) in \(x_1\) bounds the result by \(\sqrt{a_1(x_2,x_3)}\,\sqrt{\int a_2\,dx_1}\sqrt{\int a_3\,dx_1}\). Cauchy–Schwarz in \((x_2,x_3)\) separates the remaining factors. Put \(w=u^4\), use \(\|\partial_i(u^4)\|_1\le4\|u\|_6^3\|\partial_i u\|_2\), and bound the geometric mean of the three derivative norms by \(\|Du\|_2/\sqrt3\). This gives the valid choice \(S_D=3/4\). The atlas constant on the round latitude collar is therefore \(C_{\rm at}=(3/4)(3/64)(6/768)=9/2^{15}\). The average shear is zero. In the conformal product gauge \(g'=\sec^2(q)g\) on the band, with product coordinate \(t=\int_0^q\sec v\,dv\), one has \(h_t=\gamma,\ N=1,\ X=0,\ Q=6\). With \(m=1,\ M=16,\ L=576\) the same fixed charts give \(C_{\rm at}=1/2^{11}\).

**A moving-coordinate check.** Let \(V=y_1\operatorname{grad}_\gamma y_1\) on \(S^3\), and \(\phi_s\) be its flow at a smooth time \(\theta(s)\), zero near both height endpoints, with \(|\theta|\le(\log 2)/2\). The identity \(\mathcal L_V\gamma=2dy_1\otimes dy_1-2y_1^2\gamma\) follows from \(\nabla^2_\gamma y_1=-y_1\gamma\). Its operator eigenvalues are in \([-2,2]\), so \( \frac12\gamma\le\phi_s^*\gamma\le2\gamma\). For \(q=q(s)\) with constant \(q'>0\), the transformed actual round metric has \(\widehat h=\cos^2(q)\phi_s^*\gamma,\ \widehat N=q',\ \widehat X=\theta' V\). The trace-free part of \(\partial_s\widehat h\) can be nonzero, and its entire trace-free term cancels against \(\mathcal L_{\widehat X}\widehat h\). The fixed eight charts on the \(y\)-copy give \(m=3/8,\ M=32,\ L=1536,\ q_*=6\), and \(C_{\rm at}=9/2^{18}\). The physical degree map in these coordinates is \((s,y)\mapsto\phi_s(y)\) followed by the equatorial marking. Its maps on both end faces agree with the original coordinates by the support choice.

**A small geometric shear check on the same standard type.** With \(q\) as height, retain \(\cos^2(q)\phi_q^*\gamma\) on the slices and choose the *physical* metric with \(N=1,\ X=0\) on this band. The support condition matches the round metric near the band ends, so it extends by the original metric on the closed split double. The slice scalar curvature is \(6\sec^2 q\), so \(Q=R_h+|B^\circ|^2\ge6\). With the moving-atlas constant above, the trace-free derivative is the pullback of \(2\theta'(dy_1\otimes dy_1)^\circ\) times \(\cos^2 q\). Hence \(|B^\circ|_{h_q}=\sqrt{2/3}\,|\theta'|(1-y_1^2)\) at the point pulled back from \(y\). The average is at most \(2\pi^2 (2/3)^{3/2}\|\theta'\|_\infty^3\). Fix a nonconstant smooth bump \(\zeta\) supported away from both faces with \(\|\zeta\|_\infty\le1\). For \(\theta=\varepsilon\zeta\) the explicit interval

\[
0<|\varepsilon|\le \min\left\{\frac{\log 2}{2},\
\frac{\sqrt{C_{\rm at}}}{2(2\pi^2)^{1/3}\sqrt{2/3}\,\|\zeta'\|_\infty}\right\}
\]

gives a nonzero \(B^\circ\) where \(\zeta'\ne0\) and \(|y_1|<1\), with average bounded by \(C_{\rm at}^{3/2}/8\). As \(\varepsilon\to0\) the closed metric tends to round in \(C^2\), so on a sufficiently small subinterval it also has \(R_g\ge6\), volume at most \(16\pi^2/3\), and \(\sup|W^+|_{\rm HS}\le1\). These conditions give positive Yamabe type and \(e\le16\pi^2/3<8\pi^2\). The native map remains the latitude projection. This is a calibration on the same recognized split double.

## Disposition of the single application

The [master native-degree return][master] supplies the Isoshima double, already standard by its source theorem. Its original tubes are the winding-one framed long component \(a\) and the zero-framed small meridian \(b\). After \(b\) first the pending \(a\) is transported in the common exterior, the outgoing comparison is the identity there with the given filling coordinates on both solid tori, and the upper closing is composed with the inverse comparison. The PSC product collar on that actual cut uses its identity face map. In that representative \(N=1,\ X=0,\ \partial_t h=0,\ Q=R_h\ge\rho>0\). A finite atlas of its fixed compact metric yields \(C_{\rm at}>0\), so zero shear passes the strict inequality on that band. The master shows its closed energy is at least \(8\pi^2+L_{\rm band}J/4\) for every positive product width \(L_{\rm band}\) in that family. Its separate PSC source pulls back to the round class but maps to the cut from a separately embedded hypersurface, with its explicit degree-\(+1\) diffeomorphism. These are two different measured controls on an already recognized type. [05 mixed witness][mazur] · [Master disposition][master-return]

For an untreated reduced mixed presentation the required markings are a frozen handle order, the actual two framed tubes with their forward and reverse transport, and the upper closing with its inverse. The metric evidence still needed is an embedded native band in a specified representative, an incoming face map of degree one, and measured values for its atlas, potential, lapse, shift, height range and cubic shear. An oriented separator with a certified positive component of actual nonzero degree to the specified native target would supply the alternative. The 07 regular/long-cuff case supplies the abstract winding-zero boundary type, but the two complementary groups are \(BS(2,3)\) in that case and \(\mathbb Z\) for a normalized native two-middle winding-zero cut. This rules out their marked embedded identification. This leaves the finite-atlas inequality and its control checks established, with application to an untreated diagram awaiting these inputs.

[request]: ../research-progress/handoffs/E08_NATIVE_BAND_REQUEST_20261127.md
[parent]: ../manuscript/cuts_of_subcritical_conformal_classes.tex
[degree]: MARKED_BAND_AND_MINIMIZER_20261127.md
[seam]: ../02_seams_and_marked_cuts/notes/E05_UNIFORM_BENDING.md
[marked]: ../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex
[mazur]: ../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/MIXED_WITNESS.md
[master]: ../../../master/notes/MARKED_NATIVE_DEGREE_20261127.md
[master-return]: ../../../master/research-progress/handoffs/MARKED_TESTS_AND_ATTAINMENT_20261127.md
