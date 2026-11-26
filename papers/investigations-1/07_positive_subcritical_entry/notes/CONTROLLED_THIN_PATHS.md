# Uniform obstruction to thin transitions in the fixed tube coordinates

26 November 2026, for Edward B. Baker III with OpenAI Codex assistance. B02 inference from the [closed Rayleigh witness](THIN_DIRECT_SIGN.md) and [two signed curvature limits](DIRECT_WIDTH_WEYL.md), with the [fixed marking](DIRECT_TRIAL_AND_VARIATION.md) at working HEAD 1c81a3048c8c. Selected Astra/ultra lead, serving metadata unavailable. The [independent reading](../reviews/CONTROLLED_THIN_PATHS_READBACK.md) tests the generalization below.

Fix one native band, one \(q_L\), \(s_*=3/32\), and the two end metrics \(A(s,y),B_i(s,y)\). Let \(G(s,a,y)\) be any smooth path of positive definite four-dimensional metric tensors between those endpoints for each \(s,y\), expressed in the same framed product coordinates. Thus \(G(s,0,y)=A(s,y)\) and \(G(s,1,y)=B_i(s,y)\). Insert the prescribed switch \(a=H(x)\) on the layer \(s=s_*+\varepsilon(x-1/2)\), \(0\le x\le1\). Use the unchanged pieces on either side and extend the Rayleigh test by zero to the entire closed manifold. There exists a positive width below which this band alone forces negative closed Yamabe sign and exceeds \(8\pi^2\) in **each** chirality.

The width can be chosen uniformly over any such collection whose matrices, in a fixed finite atlas, have common positive ellipticity lower bound and common \(C^3\) upper bound in \((s,a,y)\) on the whole compact parameter region. In particular the interpolation itself can vary with \(\varepsilon\). This statement imposes controls in the physical marking. Paths with unbounded lapse, shift, inverse or jets in that marking require a different estimate.

Write \(h,N,\beta\) for the slice metric, lapse and shift of \(G\). Relative to the fixed density \(d\mu=d\theta\,dA_\sigma\) write \(dV_h=J\,d\mu\). Freeze at \(s=s_*\) and put \(h(x,y)=h(s_*,H(x),y)\), using the same evaluation for \(N,J\). Let \(\chi\) be any fixed smooth cutoff supported inside the band and identically one on a fixed neighborhood of \(s_*\). The negative term in the exact completed square for \(f=\chi J(s,a_\varepsilon(s),y)^{-1/3}\) gives
\[
 \varepsilon Q(f)=-D(G)+O(\varepsilon),\qquad
 D(G)=\frac14\int_Y\int_0^1 |(\partial_x h)^\circ_h|_h^2
                  J^{1/3}N^{-1}\,dx\,d\mu.
\]
Indeed the singular second fundamental form is \((\partial_x h)^\circ/(2\varepsilon N)\). Derivatives of the density in the normal square cancel its singular trace exactly. The mixed product with the bounded part of the second fundamental form has bounded integral, as do the intrinsic curvature, lapse, shift, cutoff and endpoint terms. Freezing the leading integrand incurs \(O(\varepsilon)\) after multiplication by \(\varepsilon\). These errors are uniform under the stated coefficient bounds. If \(D(G)=0\), for each \(y\) the curve \(h(x,y)\) has vanishing trace-free derivative, so its end metrics are proportional at that \(y\). At \(p=(1,0,0)\) in either physical framing, the latitude vector fixes the proportionality constant at \(r^2/16^2\), \(r=1+s_*\), while the longitude has squared length at least \(3/4\) in the exterior and less than \(1/4\) in that multiple of the cap metric. This contradiction proves \(D(G)>0\). The integrand can vanish on entire subintervals of an individual path.

There is also a quantitative form for the frozen scalar coefficient. Measure tensors in \(h_{\rm ref}=d\theta^2+\sigma\), so \(d\mu=dV_{h_{\rm ref}}\). Put \(\bar h=J^{-2/3}h\). Since \(\partial_x\bar h=J^{-2/3}(\partial_xh)^\circ_h\), if \(h\le M h_{\rm ref}\) and \(J\ge j>0,\ N\le n\), then
\[
 D(G)\ \ge\ \frac{j^{5/3}}{4nM^2}
       \int_Y|\bar h(1,y)-\bar h(0,y)|_{h_{\rm ref}}^2\,d\mu .
\]
Indeed \(|U|_h\ge M^{-1}|U|_{h_{\rm ref}}\) for covariant two-tensors and Cauchy–Schwarz in \(x\) bounds the squared endpoint difference. This lower bound depends on the prescribed tangential distortion and the coefficient bounds. It does not require an affine path or a nonzero trace-free derivative at every value of the switch.

For each fixed \(y\), remove the frozen shift by translation in the tangent coordinates and use proper time \(d\tau=N\,dx\). Write \(T=h^{-1}\dot h/2,\ k=\operatorname{tr}T,\ S=T-kI/3\), with dot denoting \(d/d\tau\). The general translation-invariant electric Weyl endomorphism is
\[
 {\cal E}=-\tfrac12\left(\dot S+\tfrac{k}{3}S+2(S^2)^\circ\right).
\]
The magnetic part is zero. Both real two-form chiral Hilbert–Schmidt squared norms equal \(\operatorname{tr}({\cal E}^2)\). The same rescaled two-jet calculation therefore gives
\[
 \varepsilon^3 E_\pm(U_i)=K(G)+O(\varepsilon),\qquad
 K(G)=\int_Y\int_0^1\operatorname{tr}({\cal E}^2)NJ\,dx\,d\mu .
\]
The two-jet and density errors are uniform under the stated controls. There is no assumption of commuting slice endomorphisms here. In the adapted coordinates the connection term in differentiating \(T\) in the time direction is \([T,T]=0\). If \(K(G)=0\), then with \(S(0)=0\) from flatness of the switch the smooth ODE for \(S\) gives \(S=0\) at each \(y\) throughout the path. This again forces proportional endpoints, contrary to the native longitude and latitude. Hence \(K(G)>0\).

To get uniform positive lower bounds for \(D,K\), take the closure of the coefficient class in \(C^2\) on the fixed compact parameter domain. Arzelà–Ascoli gives compactness, and ellipticity and endpoint identifications pass to every limit. Both functionals are continuous there. The trace and ODE contradictions still hold for \(C^2\) limits, so their minima on that closure are positive (for a nonempty class). With a common small enough \(\varepsilon\), the uniform errors then imply the asserted strict sign and energy failures. Each fixed smooth path is covered with its own bounds. This result does not estimate the original width \(1/16\) or impose a universal cost on all smooth fillings. The whole-closed negative test remains valid if the other band changes independently.
