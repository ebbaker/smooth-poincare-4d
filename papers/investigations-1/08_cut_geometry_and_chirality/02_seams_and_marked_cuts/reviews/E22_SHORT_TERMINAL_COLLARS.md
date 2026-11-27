# E22 · Short terminal collars and the actual inner jets

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI Codex assistance. The [frozen E22 request](../research-progress/handoffs/E22_REQUEST_R1.md), SHA-256 prefix `e667d1da94ca`, specifies the selected Astra/ultra lead and requests GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. Working HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The frozen input hashes agree with the request. The additional calculations read were the [B06 short-axis note](../notes/B06_SHORT_AXIS_OBSTRUCTIONS.md), prefix `f01739e72af6`, and the [E12 axial and transgression identities](../notes/E12_AXIAL_MOMENT.md), prefix `1f86b5ea20b5`. The identities, costs and lower comparisons below are exact. A stated decimal is only a diagnostic evaluation of its exact expression.

The \(r=1/2\) collar and any smooth invariant marked core meeting its first jet exceed the target. For \(r=2/3\) a core must fit the smaller-block cost \(19\pi^2/18\), have normalized radial mean squared length \(>7/12\), and exceed the normalized volume threshold below. Both explicit collars have positive Robin sign. This leaves the whole-side test and construction of a cheaper matching core at \(r=2/3\).

## Signed collar energies and physical jets

Use the smooth oriented Riemannian convention of [E19](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md), with real HS chiral blocks and \(T=4\pi^2\). The principal orbit is the fixed left quotient \(Q_8\backslash S^3\), and the original core collapses the short \(i\) axis. On the outer collar alone use cyclic order \((k,i,j)\), which preserves orientation, and write
\[
 g_{\mathrm{ph}}=ds_k^2+\sigma_i^2+\sigma_j^2+b^2\sigma_k^2,\qquad
 dv_k=b\,ds_k,\qquad x=e^{2v_k},\qquad
 y_k=b^2=1+4x-2x^2,\qquad r\le x\le1 .
\]
Here \(s_k\) increases outward, both short lengths are one, and the boundary is \(v_k=0\). This is a gauge of the annulus and does not change the actual core marking. With \(D_k=\partial_{v_k}\), the E19 compressed axial entries here have
\[
 6\lambda_k^\pm=-(D_k\pm2)(D_k\pm4)(y_k-1).
\]
Indeed the axial electric term is \(-b_{s_ks_k}/(3b)+4(1-b^2)/3\), the mixed term is \(-2b_{s_k}\), and \(b_{s_k}=D_k y_k/2,\ b_{s_ks_k}/b=D_k^2y_k/2\). Thus \(\lambda_k^+=-16x(1-x)\) and \(\lambda_k^-=0\). The two transverse entries in each block agree by biaxial symmetry, so the corresponding squared block norm is \(\tfrac32(\lambda_k^\pm)^2\). Orbit volume is \(\pi^2 b/4\), with the order-eight quotient. In particular
\[
 \frac{E_+^{\mathrm{collar}}}{\pi^2}
 =48\int_r^1 x(1-x)^2\,dx
 =16(1-r)^3-12(1-r)^4,\qquad E_-^{\mathrm{collar}}=0 .
\]
The scalar curvature is \(R/2=-D_k^2y_k/2+4-y_k=3-12x+18x^2=1+18(x-1/3)^2>0\).

At the inner slice, with the normal pointing toward the physical outer boundary,
\[
 b_{s_k}=4r(1-r),\qquad h:=b_{s_k}/b=4r(1-r)/b .
\]
The principal curvatures in the common physical gauge are \((0,0,h)\). The core sees these curvatures with its outward unit normal. The collar sees their negatives at its inner boundary, where its outward normal is \(-\partial_{s_k}\). The interface is nonumbilic for both values of \(r\). At the physical outer face one has \(b=\sqrt3\), \(b_{s_k}=0\), and the entire shape operator is zero.

To compare a core with E12, divide the collar metric by the product of its \(j,k\) lengths, namely \(b\). In E12's \(i\)-distinguished gauge, \(ds_i=b^{-1/2}ds_k\), \(a_i=b^{-1/2}\), \(u_i=\tfrac12\log b\), and \(dv_i=a_i ds_i=b^{-1}ds_k\). The data at the inner cut are therefore
\[
 y_i=a_i^2=1/b,\qquad
 \frac{dy_i}{dv_i}=-h,\qquad
 (a_i)_{s_i}=-h/2,\qquad
 (u_i)_{s_i}=h\sqrt b/2,\qquad P=2\cosh(2u_i)=b+1/b .
\]
The last two first-jet derivatives fix the physical matching, even though the axial estimate only uses \(dy_i/dv_i\). Conversely a core with these normalized jets can be put in the common physical gauge by multiplying its \(i\)-normalized metric by \(e^{2u_i}\) near the cut. A smooth cutoff in this exponent away from the cut makes the positive conformal factor constant near the bolt. In the restored arclength the boundary lengths are \((1,1,b)\), with outward derivatives \((0,0,b_{s_k})\).

The invariant-core assumption is under the prescribed cohomogeneity-one right action. The principal isotropy acts by the three different sign characters on the axes, so an invariant orbit metric is diagonal and there is no invariant radial-orbit cross term. On an arclength normal geodesic through the bolt, the isotropy rotation sending the normal vector to its opposite interchanges the two horizontal lines. Their length product thus extends smoothly and positively as an even function. In the \(i\)-horizontal-area-one gauge this gives the smooth E12 jets \(a_i=4s_i+O(s_i^3)\), \(u_i=O(s_i)\) odd, and \(dy_i/dv_i=8\) at the bolt. These are the hypotheses of the core identities, rather than an aligned-axis calculation at the bolt.

## The two axial lower comparisons

Use \(v_i=0\) at the bolt, let \(V\) be its value at the interface, and put \(q=e^{-2V}\) and \(\phi=e^{2(v_i-V)}\). In this section primes are \(v_i\) derivatives. E12 gives the exact equality
\[
\begin{split}
 6\lambda_i^+&=-(\partial_{v_i}+2)(\partial_{v_i}+4)y_i
                  +2(\partial_{v_i}+2)P+4w^2,\\
 w^2&=y_i(u_i'+d/y_i)^2,\qquad d=2\sinh(2u_i),\\
 6\int_0^V\phi\lambda_i^+\,dv_i
   &= [-\phi y_i'-4\phi y_i+2\phi P]_0^V
            +4\int_0^V\phi w^2\,dv_i\\
   &= C+4q+4\int_0^V\phi w^2\,dv_i,\qquad C=2b-2/b+h .
\end{split}
\]
At the bolt \(y_i=0,\ y_i'=8,\ P=2\), which produces the positive \(4q\) term. Writing \(w^2=y_i(u_i')^2+d^2/y_i+P'\) gives \(w^2\ge2(P')_+\), by \(P'=2du_i'\). Therefore one may replace the lower bound \(C+4q\) on the moment by \(C+[4+8(P(V)-2)]q\). Since \(\int\phi^2=(1-q^2)/4\) and the axial contribution to \(E_+/\pi^2\) is \(\tfrac38\int(\lambda_i^+)^2\,dv_i\), its Cauchy–Schwarz lower bound is
\[
 \frac{E_+^{\mathrm{core}}}{\pi^2}
       \ge \frac{\big(C+[4+8(P(V)-2)]q\big)^2}{24(1-q^2)}. \tag{1}
\]

**\(r=1/2\).** Here \(b^2=5/2\), \(b_{s_k}=1\), \(h=1/b\), and \(C=4/b\). Even the weaker moment gives \(E_+^{\mathrm{core}}/\pi^2> C^2/24=4/15\) since \(0<q<1\) for each finite core. The collar adds \(5/4\), so the energy of the full smaller block exceeds \(91/60\) in units of \(\pi^2\). This exceeds the strict target \(3/2\) by at least \(1/60\) in the limit of fixed-jet smoothing.

**\(r=2/3\).** Here \(b=5/3\), \(b_{s_k}=8/9\), \(h=8/15\), \(P(V)=34/15\), and \(C=8/3\). Thus the physical first jet is precisely lengths \((1,1,5/3)\) and outward derivatives \((0,0,8/9)\) in the stated common gauge. The collar adds \(4/9\) and the remaining strict requirement is \(E_+^{\mathrm{core}}/\pi^2<19/18\). Equation (1) becomes
\[
 \frac{E_+^{\mathrm{core}}}{\pi^2}
       \ge \frac{(8/3+(92/15)q)^2}{24(1-q^2)}
       >\frac8{27}.
\]
Its right-hand side before the strict inequality is increasing in \(q\in(0,1)\). To meet the target it is necessary that
\[
 q<\frac{-920+15\sqrt{19893}}{3541},
 \qquad
 V>-\frac12\log\!\left(\frac{-920+15\sqrt{19893}}{3541}\right)
 \simeq 0.542865.
\]
There is also a length-independent necessary mean condition. Integrating the axial identity without a weight and using \(\bar y=V^{-1}\int_0^V y_i\,dv_i\) gives
\[
\begin{aligned}
 6\int_0^V\lambda_i^+\,dv_i
 &= [-y_i'-6y_i+2P]_0^V+
     \int_0^V(-8y_i+4P+4w^2)\,dv_i\\
 &\ge \frac{82}{15}+\frac{32}{15}+8(1-\bar y)V
  =\frac{38}{5}+8(1-\bar y)V .
\end{aligned}
\]
Here \(P\ge2\) and \(\int w^2\,dv_i\ge2(P(V)-2)\). If \(\bar y<1\), the axial energy and the arithmetic–geometric mean inequality give the lower bound \((38/15)(1-\bar y)\) on \(E_+^{\mathrm{core}}/\pi^2\). It is at least \(19/18\) exactly for \(\bar y\le7/12\). Thus every qualifying core must have \(\bar y>7/12\), also covering \(\bar y\ge1\). The actual normalized end derivative \(-8/15\) requires interior values of \(y_i>3/5\) close to the interface. These conditions give no successful core.

## Signed allocation, positivity and smoothing

For the signed check, use the E12 connection polynomial in the common physical gauge. At the inner marked slice, in order \((k,i,j)\), \(X_k^\epsilon=-b_{s_k}+\epsilon(2-b^2)\) and \(X_i^\epsilon=X_j^\epsilon=\epsilon b\). The sum over signs of its endpoint polynomial is
\[
 {\cal P}=\sum_{\epsilon=\pm1}
   \left(\sum_j(X_j^\epsilon)^2-\epsilon X_k^\epsilon X_i^\epsilon X_j^\epsilon\right)
   =4+4(b^2-1)^2+2b_{s_k}^{\,2}.
\]
A cyclic order does not change this expression. The core bolt contributes \(40\) in E12, and the physical outer face contributes \(20\). The inner values are \(15\) and \(164/9\) for \(r=1/2\) and \(2/3\), respectively. The differences \(E_+-E_-\) in units of \(\pi^2\) are \(({\cal P}-40)/4=-25/4,-49/9\) on the core and \((20-{\cal P})/4=5/4,4/9\) on the respective collars. Both totals are \(-5\), so the \(+\) block is the smaller one on the core and on the attached side. The derivative term at the nonumbilic interface is part of this allocation. For invariance of the endpoint comparison one can normalize in the \(i\) gauge throughout the actual core and collar first, since their Weyl integrals do not change. The physical-gauge polynomial agrees there by the conformal invariance of the signed ledger and its trace-free boundary correction. For the direct check, write \(m_i=-\partial_s a_i,\ c_i=f_i a_i\) in E12's notation. A radial conformal change shifts \(m_i\) by \(t a_i\) and preserves \(c_i\). The terms involving \(t\) cancel in the signed sum by \(c_j a_k+c_k a_j=2a_i\) and \(\sum_{\rm cyc}c_i a_j a_k=\sum_i a_i^2\). Equivalently, the full fixed-face difference \(-5\pi^2\) from E12 minus the directly integrated signed collar costs gives the displayed core differences without any change of gauge in the endpoint polynomial. [E12 direct transgression](../notes/E12_AXIAL_MOMENT.md) · [Parent signature ledger, §3](../../manuscript/cuts_of_subcritical_conformal_classes.tex)

Pointwise \(R>0\) on the collar requires a separate check of the Robin form because its inner outward mean curvature is \(-h\). For \(f=b^{-1/3}\) in the physical gauge, \(\mathcal Bf=(6\partial_\nu+2H)f=0\) at both boundaries, with their actual outward normals. The scalar Laplacian on a radial function is \(f_{s_ks_k}+h f_{s_k}\), so
\[
 \frac{(-6\Delta+R)f}{f}=8-2b^2-\frac23h^2\ge\frac{26}{15}>0 .
\]
Indeed \(b^2\le3\), \(b^2\ge5/2\), and \(b_{s_k}\le1\) on both domains. Integration by parts on the test function \(f\psi\) writes the Robin form as
\(\int (6f^2|\nabla\psi|^2+f(-6\Delta+R)f\,\psi^2)+\int f\mathcal Bf\,\psi^2\). This proves coercivity of the annular form. If the core form is positive, the sum on trace-matched functions is coercive and its inner boundary terms cancel. Positive scalar curvature of the core in the common gauge suffices since its interface \(H=+h\). A separate positive test of the attached whole-side form also suffices. A core with the correct jet alone has no established curvature sign. [E04 Robin covariance and smoothing](../notes/E04_ROBIN_DESCENT.md)

Use signed geodesic normal collars in the restored common gauge at the inner interface. The two tangential metrics and their first signed derivatives agree. Each differs from their common linear normal jet by \(O(t^2)\). Smoothing a layer of real positive width \(\epsilon\) with a cutoff against that jet gives \(C^1\) convergence, uniformly bounded second derivatives in the layer, and strong \(W^{2,2}\) convergence. At the physical outer face the jet has zero derivative, so one can instead cut off to the constant boundary metric exactly in a smaller collar. This is the productization in B04, and it keeps the prescribed seam metric and its zero shape operator. Both smoothings preserve the chiral integrals in the limit, and their scalar forms differ by \(o(1)\) in the quadratic-form norm on \(H^1\). The scalar curvatures converge in \(L^2\) and \(H^1\) embeds in \(L^4\) in dimension four. Thus for a fixed trial with a strict energy margin and a positive whole-side form one can choose a finite positive smoothing width preserving both. For the \(r=1/2\) construction arbitrary sufficiently small such smoothing preserves the strict energy obstruction. The exact vanishing \(E_-^{\mathrm{collar}}=0\) is asserted for the explicit collar before smoothing.

With a successful \(r=2/3\) core the product collar at the physical seam permits the exact \(j\)-switch of B04, interchanging the short axes and negating \(k\). The switch is an isometry of the outer seam and the opposite half orientation exchanges \(E_+\) and \(E_-\). The two positive Robin signs would give both smooth positive doubles. The whole closed chiral energy would be \(2E_+^{\mathrm{side}}+5\pi^2<8\pi^2\), using the fixed outer boundary and zero signature. The marked smooth type is the one identified in E11A. These conclusions use the outer physical seam, since the inner interface serves only to assemble one side. [B04 paired filling](../notes/B04_PAIRED_FILLING.md) · [E11A marked identification](E11A_INTEGRATION.md)
