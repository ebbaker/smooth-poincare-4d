# Negative closed Yamabe sign for sufficiently thin direct transitions

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. E02-width under [issue 1](../research-progress/handoffs/DIRECT_EQUATOR_ISSUE_20261126.md). Requested dispatch GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. Intake HEAD `1c81a3048c8c`. The working blobs of the issue, [tube marking](MARKED_CONNECTION_ASSEMBLY.md) and [completed exterior](FUNNEL_EXTERIOR.md) are `cbcd73ce04b1`, `59c3993e018e` and `0cc56c281145`. The calculation concerns smooth Riemannian metrics on the specified closed oriented four-manifold.

For either of the two native bands and any fixed smooth marked pants metric \(q\) in the issue, compressing the direct convex weight into a sufficiently short interval makes \(\lambda_1(-6\Delta+R)<0\) on the closed assembly. One band supplies the test, so the other can retain its original width or be compressed independently. The proof gives a positive finite width bound in terms of compact coefficient estimates for the fixed representative.

## The native tangential metrics

On either band use \(I=[0,1/8]\), slice \(Y=S^1_\theta\times S^2\), \(r=1+s\) and \(\theta=2\pi t\). Write \(\delta=1/16\) for the radius coefficient of the tube embedding. The positive-facing cap metric and retained exterior germ there are
\[
 g_c=ds^2+\sinh^2r\,d\theta^2+\sigma,
 \qquad
 g_e=\Phi_i^*(q+\sigma),
 \qquad
 (s,\theta,p)\longmapsto\Phi_i(\theta/(2\pi),rp).
\]
Here \(\sigma\) is the unit round metric. The exterior compactification factor equals one on the marked pants face containing both bands. Put \(g(s,a)=(1-a)g_c+a g_e\), \(0\le a\le1\), and let \(h(s,a)\) be its tangential restriction. The tube extends beyond the entire closed band. Thus the metric family is smooth and positive definite on \(I\times Y\times[0,1]\).

At \(p=(1,0,0)\) in the framed sphere, use the unit round tangent \(V=\partial_w\) in the \(w\) direction and the coordinate tangent \(\partial_\theta\) at fixed \(p\). The marking gives
\[
 h_c(V,V)=1,\qquad h_e(V,V)=\delta^2r^2,
 \qquad h_c(\partial_\theta,\partial_\theta)=\sinh^2r,
 \qquad h_e(\partial_\theta,\partial_\theta)
 =\left|\frac{c_i'(t)}{2\pi}\right|_q^2+\sin^2\phi_i\ge \frac34.
\]
Indeed \(V\) changes only the exterior latitude to first order, and the marked longitude advances the exterior azimuth at unit angular speed. At this point \(w=0\) and \(\phi_i\) is either \(\pi/3\) or \(2\pi/3\). Proportionality would force the factor \(\delta^2r^2\) and then \(h_e(\partial_\theta,\partial_\theta)=\delta^2r^2\sinh^2r<1/4\), using \(r<2\) and \(\sinh 2<4\). This contradiction holds for either tube at every \(s\in I\). If \((\partial_a h)^\circ_h=(h_e-h_c)^\circ_h\) vanished there at any \(a\), both \(h_c=h-a(h_e-h_c)\) and \(h_e=h+(1-a)(h_e-h_c)\) would be positive multiples of \(h\). Hence the trace-free weight derivative is nonzero there for every \(a\in[0,1]\), including at pauses of the planar projection.

## The closed quadratic form

Use \(\Delta=\operatorname{div}\nabla\) and the quadratic form \(\mathcal Q_g(f)=\int_M(6|df|_g^2+R_gf^2)\,dV_g\). In the marked product coordinates decompose the metric with slice metric \(h\), lapse \(N>0\) and shift \(\beta\) by
\[
 g=N^2ds^2+h_{ab}(dy^a+\beta^a ds)(dy^b+\beta^b ds).
\]
The normal pointing toward increasing \(s\) is \(\nu=N^{-1}(\partial_s-\beta)\). Use \(B=\tfrac12\mathcal L_\nu g|_{TY}=(\partial_s h-\mathcal L_\beta h)/(2N)\), \(k=\operatorname{tr}_h B\) and \(B^\circ=B-kh/3\). The contracted Gauss identity gives
\[
 R_g=R_h-|B|_h^2-k^2-2\nu k-2N^{-1}\Delta_hN.
\]
For the lapse term, the acceleration is \(\nabla_\nu\nu=-\nabla_h\log N\), with ambient divergence \(-N^{-1}\Delta_hN\). Commuting derivatives of the normal yields \(\operatorname{Ric}(\nu,\nu)=-\nu k-|B|^2+\operatorname{div}_g(\nabla_\nu\nu)\), giving the stated sign. For a smooth \(f\) supported away from the two band endpoints, integrate the normal derivative of \(k\) using \(\operatorname{div}_g\nu=k\). The resulting normal terms are \(6(\nu f)^2+4kf\nu f+(k^2-|B|^2)f^2\). Completing the square with the three-dimensional trace gives the exact identity
\[
 \mathcal Q_g(f)=\int_{I\times Y}\left[
  6|d_hf|_h^2+(R_h-2N^{-1}\Delta_hN)f^2
  +6(\nu f+kf/3)^2-|B^\circ|_h^2 f^2
 \right]dV_g.
\]
The endpoint term vanishes by the support condition, which also lets the test extend smoothly by zero to the other band, the caps and the remaining exterior.

Choose a fixed positive reference density \(d\mu=d\theta\,dA_\sigma\) on \(Y\), and write \(dV_h=J\,d\mu\), so \(dV_g=NJ\,ds\,d\mu\). For a smooth compactly supported cutoff \(\chi=\chi(s)\) use \(f=\chi J^{-1/3}\). The identity \(\partial_s\log J=Nk+\operatorname{div}_h\beta\) follows by tracing the definition of \(B\). Since \(\operatorname{div}_h\beta=\operatorname{div}_\mu\beta+\beta(\log J)\),
\[
 \nu f+kf/3=\frac{J^{-1/3}}{N}
 \left(\chi'-\frac{\chi}{3}\operatorname{div}_\mu\beta\right).
\]
This cancels every normal derivative of the rapidly changing weight in the square. Slice derivatives of \(h,N,\beta,J\) are those of smooth compact families at fixed \((s,a)\). A shift of order one contributes through its slice derivatives, and the lapse stays uniformly positive over that same compact parameter set.

## Finite width choice

Use the issue's smooth flat-ended step \(H\) and choose \(s_*=3/32\) and \(\rho=1/128\). Let \(\chi\equiv1\) on \(|s-s_*|\le\rho\), with \(0\le\chi\le1\) and support in \(|s-s_*|<2\rho\). For \(0<\varepsilon\le2\rho\) set
\[
 a_\varepsilon(s)=H\left(\frac{s-s_*}{\varepsilon}+\frac12\right),
 \qquad D=\int_0^1(H'(u))^2\,du\ge1.
\]
The metric is the exact cap extension on an open germ of the inner endpoint and the exact retained exterior on an open germ of the outer endpoint. Both gluing maps are those in the input. On the entire band the functions \(h,N,\beta,J\) are evaluated at \(a=a_\varepsilon(s)\). With \(\partial_s h\) on the right taken at fixed \(a\), decompose
\[
 B^\circ=a_\varepsilon' P+S,\qquad
 P=\frac{(\partial_a h)^\circ_h}{2N},\qquad
 S=\frac{(\partial_s h-\mathcal L_\beta h)^\circ_h}{2N}.
\]
The mismatch proved above makes the continuous function
\[
 \mathcal A(s,a)=\int_Y |P|_h^2 NJ^{1/3}\,d\mu
\]
strictly positive for each \((s,a)\). Let \(A>0\) be its minimum on \([s_*-\rho,s_*+\rho]\times[0,1]\). The minimum is positive because the parameter domain is compact and the integrand is positive on a slice neighborhood of the selected point for each parameter. For an explicit bounded remainder take \(C\) to be \(|I|\) times the supremum over \((s,a)\in I\times[0,1]\) of
\[
 \int_Y\left[
  6\chi^2 |d_h(J^{-1/3})|_h^2
  +|R_h-2N^{-1}\Delta_hN|\chi^2J^{-2/3}
  +\frac{6J^{-2/3}}{N^2}
   \left(\chi'-\frac{\chi}{3}\operatorname{div}_\mu\beta\right)^2
  +|S|_h^2\chi^2J^{-2/3}
 \right]NJ\,d\mu.
\]
This includes both cutoff regions. All its coefficients are independent of the width as functions on the fixed compact parameter space. Using \(|a_\varepsilon'P+S|^2\ge \tfrac12(a_\varepsilon')^2|P|^2-|S|^2\) and \(\chi=1\) on the layer, obtain
\[
 \mathcal Q_{g_\varepsilon}(f_\varepsilon)
 \le C-\frac{AD}{2\varepsilon}.
\]
For example, the choice \(\varepsilon=\min\{\rho,AD/[2(C+1)]\}\) gives \(\mathcal Q_{g_\varepsilon}(f_\varepsilon)\le-1\). The bounds are representative-dependent and give a finite width for every fixed \(q\) in the issue. Keeping the cross term also gives the leading divergence
\[
 \lim_{\varepsilon\downarrow0}\varepsilon\,
       \mathcal Q_{g_\varepsilon}(f_\varepsilon)
 =-\int_0^1(H'(u))^2\mathcal A(s_*,H(u))\,du<0.
\]
For this limit, the cross term is uniformly bounded by compact coefficient bounds and \(\int_I |a_\varepsilon'|\,ds=1\). The leading term follows by rescaling within the layer. The nonzero globally smooth test has both positive \(L^2\) and \(L^4\) norms for each finite width. Its strictly negative numerator gives \(\lambda_1(-6\Delta+R)<0\) and a strictly negative Yamabe constant. Adding a small positive constant to \(f_\varepsilon\) at any fixed width also gives a strictly positive test with negative numerator.

The argument uses the prescribed marked end metric at each edge of the band and applies separately to both relators. It excludes sufficiently thin transitions within this convex interpolation family for the positive-entry test. The sign at the baseline width \(1/16\) requires a separate estimate.
