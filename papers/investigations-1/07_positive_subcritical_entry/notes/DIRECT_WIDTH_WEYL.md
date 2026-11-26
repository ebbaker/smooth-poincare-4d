# Signed Weyl energy of the thin native transitions

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. E02-W requested GPT-6.2 Sol/ultra under the selected GPT-6.2 Astra/ultra lead. Actual serving model and effort were unavailable. Intake HEAD `1c81a3048c8c`, working blobs `f78cde4f6651` ([issue 2](../research-progress/handoffs/DIRECT_SECOND_ISSUE_20261126.md)), `cbcd73ce04b1` ([issue 1](../research-progress/handoffs/DIRECT_EQUATOR_ISSUE_20261126.md)), `59c3993e018e` ([tube marking](MARKED_CONNECTION_ASSEMBLY.md)), `0cc56c281145` ([completed exterior](FUNNEL_EXTERIOR.md)), and `4721e2a7789dc` ([thin sign](THIN_DIRECT_SIGN.md)). The calculation uses smooth oriented Riemannian four-metrics and the real two-form Hilbert–Schmidt normalization.

For each of the two native bands there is a constant \(C_i>0\) such that
\[
 \varepsilon^3 E_\pm(g_\varepsilon;U_i)=C_i+O(\varepsilon).
\]
The same \(C_i\) occurs in both chiralities on that band. It is an explicit integral of the electric Weyl tensor of a frozen slice family with its proper lapse time. The coefficient and the remainder bounds are for the fixed marked pants metric and width profile.

## Native metric and frozen normal family

Use the original marked relator tubes and cap-to-exterior maps. Let \(q\) be a fixed smooth curvature-minus-one metric on the marked pants, with all three geodesic cuff lengths \(2\operatorname{arcosh}5\). Its compactification factor is one on the entire face containing these bands. In each band \(U_i=[0,1/8]\times Y\) with \(Y=S^1_\theta\times S^2\), put \(r=1+s\), \(p=(u,v,w)\in S^2\), and \(\delta=1/16\). The cap metric in this parametrization is \(g_c=ds^2+\sinh^2r\,d\theta^2+\sigma\), with \(\sigma\) unit round. For the exterior set
\[
 X_i=c_i(\theta/(2\pi))+\delta r(u,v),\qquad \phi=\phi_i+\delta rw,
 \qquad \phi_1=\pi/3,\quad\phi_2=2\pi/3 .
\]
The exact pullback by the tube is
\[
 g_e=q_{X_i}(dX_i,dX_i)+(d\phi)^2+\sin^2\phi\,d\theta^2,
 \quad
 dX_i=\frac{c_i'(\theta/(2\pi))}{2\pi}d\theta+\delta(u,v)ds+\delta r(du,dv),
 \quad d\phi=\delta w\,ds+\delta r\,dw .
\]
In particular, the normal and mixed coefficients are those of this pullback. The interpolation of full tensors is \(g(s,a)=(1-a)g_c+a g_e\). Decompose it relative to \(s,Y\) as \(d\,ds^2+2b\,ds+h\), where \(b\) is a tangential covector. Its shift and lapse are \(\beta=h^{-1}b\) and \(N=\sqrt{d-b(\beta)}\). Smoothness and positivity on the compact product \([0,1/8]\times Y\times[0,1]\) give uniform bounds for all required coefficient derivatives and a positive lower bound for \(N\). The endpoints are the two exact metrics on the prescribed collars. [Tube map](MARKED_CONNECTION_ASSEMBLY.md#the-attaching-maps-exterior-and-inverse) · [Retained metric](FUNNEL_EXTERIOR.md)

Use the flat-ended step \(H\) of the marking and the interval \(s=s_*+\varepsilon(x-1/2)\), \(0\le x\le1\), with \(s_*=3/32\). Thus \(a_\varepsilon(s)=H((s-s_*)/\varepsilon+1/2)\). The original width \(1/16\) gives \(a_\varepsilon(s)=H(16s-1)\). For each \(y_0\in Y\), introduce local tangent coordinates \(z\) via \(y=y_0+\varepsilon z\) in a chart. After pulling back \(g_\varepsilon=g(s,a_\varepsilon(s))\) and multiplying by \(\varepsilon^{-2}\), its coefficient matrix in \((x,z)\) is that of \(g(s_*+\varepsilon(x-1/2),H(x),y_0+\varepsilon z)\). At \(z=0\) its two-jet differs by \(O(\varepsilon)\) from the metric with coefficients \(g(s_*,H(x),y_0)\). A finite choice of charts on smaller compact subsets gives a uniform bound over \((x,y_0)\). Derivatives in \(z\) of the coefficients bring a factor \(\varepsilon\), and an \(x\) derivative brings a factor \(\varepsilon\) whenever it differentiates the explicit \(s\)-dependence at fixed \(a\). The unfrozen family keeps all of that explicit dependence.

Write \(h(x),N(x),\beta(x)\) for the coefficients evaluated at \((s_*,H(x),y_0)\). They depend only on \(x\) in the frozen model. Translating by \(z\mapsto z+\int_0^x\beta(v)\,dv\) removes the shift, and \(\tau=\int_0^x N(v)\,dv\) is the proper lapse time. These coordinate changes preserve orientation. The frozen metric takes the form
\[
 d\tau^2+h(\tau)_{ab}\,dz^a dz^b .
\]
Here \(h\) is the affine path \(h_c+aD\) with \(D=h_e-h_c\) evaluated at \((s_*,y_0)\) and \(a=H(x(\tau))\). The shift enters the coefficient through \(N\). The construction uses the positive \(N\) determined by the full interpolated tensor, including \(b\).

## Electric Weyl tensor and chiral factors

Use the curvature convention in which the unit round sphere has sectional curvature \(+1\), and use a dot for proper time differentiation. The second fundamental form of the slices is \(B=\dot h/2\). Define the endomorphisms \(L=h^{-1}B\), \(S=L-kI/3\), and \(k=\operatorname{tr}L\). For an endomorphism \(A\), write \(A^\circ=A-\operatorname{tr}(A)I/3\). The only nonzero Christoffel symbols in the slice coordinates are \(\Gamma^0_{ab}=-B_{ab}\) and \(\Gamma^a_{0b}=\Gamma^a_{b0}=L^a{}_b\). Thus \(R_{0abc}=0\), \(R_{0a0b}=-(h(\dot L+L^2))_{ab}\), and \(R_{abcd}=-B_{ac}B_{bd}+B_{ad}B_{bc}\). Contracting gives \(\operatorname{Ric}_{0a}=0\) and \(h^{-1}\operatorname{Ric}|_{TY}=-(\dot L+kL)\).

The electric Weyl endomorphism \(\mathcal W=h^{-1}W_{0\cdot0\cdot}\) is trace-free. The Schouten subtraction in dimension four gives
\[
 \mathcal W=\big(-\tfrac12\dot L-L^2+\tfrac12kL\big)^\circ
 =-\tfrac12\big(\dot S+\tfrac{k}{3}S+2(S^2)^\circ\big).
\]
The coordinate derivative of \(L\) equals its covariant derivative along \(\partial_\tau\) because the commutator of \(\Gamma^a_{0b}=L^a{}_b\) with \(L\) vanishes. The same holds for \(S\). The mixed Weyl components \(W_{0abc}\) vanish. In the orthonormal two-form basis formed by \(d\tau\wedge e^j\) and their Hodge duals for a slice orthonormal coframe \(e^j\), the Weyl operator is block diagonal with both blocks equal to the matrix of \(\mathcal W\), since it commutes with the Hodge star. The bases of \(\Lambda^\pm\) use the sums or differences of these pairs divided by \(\sqrt 2\). Hence \(|W^+|_{\rm HS}^2=|W^-|_{\rm HS}^2=|\mathcal W|_h^2\) in the frozen metric, with \(|\mathcal W|_h^2=\operatorname{tr}(\mathcal W^2)\).

For the affine path, set \(A=h^{-1}D\). Since \(\dot A=-\dot a A^2\) and \(L=\dot a A/2\), the electric equation gives the explicit scalar multiple
\[
 \mathcal W=\left(-\frac{\ddot a}{4}+\frac{\operatorname{tr}(A)\dot a^{\,2}}8\right)A^\circ,
 \qquad
 \dot a=\frac{H'(x)}{N(x)},\qquad
 \ddot a=\frac{H''(x)}{N(x)^2}-\frac{H'(x)\partial_x N(x)}{N(x)^3} .
\]

## Limit, mismatch and scope

At each evaluation point the rescaled metric is a constant homothety of the pullback of \(g_\varepsilon\). Its squared chiral operator norm is \(\varepsilon^4|W_{g_\varepsilon}^\pm|_{\rm HS}^2\). The uniform two-jet estimate and positive definite coefficient bounds give \(\varepsilon^4|W_{g_\varepsilon}^\pm|_{\rm HS}^2=|\mathcal W|_h^2+O(\varepsilon)\) on the entire changing layer. Write \(dV_{h(s,a)}=J(s,a,y)\,d\mu(y)\) for the reference density \(d\mu=d\theta\,dA_\sigma\) on \(Y\). The original metric volume is \(\varepsilon NJ\,dx\,d\mu\), with \(NJ\) differing by \(O(\varepsilon)\) from its frozen value. Both exact metrics are Weyl-flat, so the parts of the band outside the layer have zero integrand. Accordingly,
\[
 C_i=\int_Y\int_0^1
 \big|\mathcal W(x,y)\big|_{h(x,y)}^2 N(s_*,H(x),y)J(s_*,H(x),y)\,dx\,d\mu(y) .
\]
Equivalently use \(d\tau=N\,dx\) and the slice volume \(J\,d\mu\), with the proper time interval evaluated at each \(y\). This gives the scaled \(O(\varepsilon)\) remainder above. All factors come from the invariant Weyl operator norm and the original volume of the varying layer.

For each frozen \(y\), the endpoint derivatives of \(h\) vanish by flatness of \(H\) and the positive lapse. If \(\mathcal W\) vanished identically there, the electric equation would be the smooth ordinary differential equation \(\dot S=-(k/3)S-2(S^2)^\circ\) with \(S(0)=0\). Uniqueness gives \(S=0\) on the proper time interval. Then \(\dot h=(2k/3)h\) gives proportional endpoint metrics. Conversely, if the endpoints are proportional, this affine path has \(S=0\) and \(\mathcal W=0\) throughout.

For either native tube consider \(p=(1,0,0)\) at any \(\theta\) and let \(V=\partial_w\) be the unit round tangent there. The cap and exterior give
\[
 h_c(V,V)=1,\quad h_e(V,V)=\delta^2r^2,\qquad
 h_c(\partial_\theta,\partial_\theta)=\sinh^2 r,\quad
 h_e(\partial_\theta,\partial_\theta)=\Big|\frac{c_i'}{2\pi}\Big|_q^2+\frac34 .
\]
Here \(V\) changes only the exterior latitude to first order, while the exterior azimuth equals \(\theta\). Proportionality would require the factor \(\delta^2r^2\) by the \(V\) components. The resulting longitude squared length would be less than \(1/4\), since \(r<2\) and \(\sinh 2<4\). Thus \(\mathcal W\) is nonzero somewhere along the frozen path at this tangent point, with a positive contribution on an open subset in \((x,y)\) by continuity. It follows that \(C_i>0\) for each marked band, including at longitudes where the projected relator pauses. The argument for positivity uses only the displayed native metric data and applies to each fixed marked \(q\) separately. [Native tangential test](THIN_DIRECT_SIGN.md#the-native-tangential-metrics)

For equal compressed widths, the total closed energy in either sign is \((C_1+C_2)\varepsilon^{-3}+O(\varepsilon^{-2})\), because the caps and complete retained exterior contribute zero. Sufficiently thin members exceed the closed \(8\pi^2\) threshold, and the separate Rayleigh test also gives negative closed Yamabe sign there. The derivation provides an exact leading coefficient and an existence bound for sufficiently small widths. The energy and Yamabe sign at width \(1/16\) require separate finite-width bounds. [Energy accounting](FUNNEL_EXTERIOR.md) · [Thin sign test](THIN_DIRECT_SIGN.md)
