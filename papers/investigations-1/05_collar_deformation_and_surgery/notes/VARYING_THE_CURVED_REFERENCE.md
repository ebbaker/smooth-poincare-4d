# An interval of curved references on one physical face

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Selected lead GPT-6.2 Astra/ultra, independent serving telemetry unavailable. CDS-B03/E02i and DEF-B02, [frozen assignment](../research-progress/handoffs/WINDING_AND_CURVATURE_FOLLOWUP_20261126.md). The working inputs are [the hyperbolic height](SPACE_FORM_REFERENCE.md) (cfbd7149db0f), [finite connector](../01_collar_deformation_and_adapted_coordinates/notes/FINITE_CURVED_CONNECTOR.md) (cd10e9537da6), and the [selected physical bicollar](../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) (8063d76ad687). The two sources considered below have different smooth and metric provenance.

## Varying the reference while fixing the disk and its gauge

Fix one near-round four-dimensional ellipsoid \(|x|^2/A^2+y^2/B^2+z^2/C^2=1\) in \(\mathbb R^5\), \(A\ne B,A\ne C\), and the upper disk cut by \(z=z_0=\tau C\), \(0<\tau<1\). Use its induced metric \(g\) throughout the exterior \(V\). Write \(u,u,v\) for the outward planar principal curvatures of the slice. The actual disk-to-exterior shape is \(K=\beta\,\mathrm{diag}(u,u,v)\), where \(\lambda_* = C^4/(A^4z_0^2)>0\), \(U_*=(u^2+\lambda_*)^{1/2}\), and \(\beta=u/U_*\). In particular both the face metric \(h\) and \(K\) are fixed as the reference curvature varies. The signed charges \(m^\sigma=E_\sigma(g;D)\) and \(v^\sigma=E_\sigma(g;V)\) are all positive. The principal-frame Gauss calculation gives \(m^+=m^-\), \(v^+=v^-\); on \(y=0\) the nonzero complementary Weyl entry \((p-q)(p-r)/3\) occurs up to and on this face. The volume of each side enters its full charge.

For *every* \(\lambda>0\), the same arclength profile \(h=ds^2+r(s)^2g_{S^2}\) has an isometric embedded filling face in sectional curvature \(-\lambda\). In the explicit hyperbolic profile from the input, substitute \(k=\sqrt\lambda\) in
\[
 \rho=\lambda^{-1/2}\operatorname{arsinh}(\sqrt{\lambda}\,r),\qquad
 Z'=\frac{r\sqrt{u^2+\lambda}}{1+\lambda r^2}.
\]
The identity \(1-r'^2=r^2u^2\) proves the isometry; \(Z\) is monotone between the smooth poles. The resulting marked balls depend smoothly on \(\lambda\) in every compact positive parameter interval. Their positive outward principal curvatures are \(U_\lambda,U_\lambda,(uv+\lambda)/U_\lambda\), \(U_\lambda=\sqrt{u^2+\lambda}\), from the angular normal curvature and Gauss equation. Normalize the mean by a conformal factor equal to one at the face with outward logarithmic derivative \((\mathrm{tr}\,K-\mathrm{tr}\,S_\lambda)/3\). This modification leaves the trace-free difference \(D_\lambda=K^\circ-S_\lambda^\circ\). The difference of its meridional and repeated eigenvalues is \(u(v-u)(U_*^{-1}-U_\lambda^{-1})\). Thus the following is the measured discrepancy on the *one physical face*:
\[
 \|D_\lambda\|_{L^2(h)}^2
  =\frac23\int_\Sigma u^2(v-u)^2(U_*^{-1}-U_\lambda^{-1})^2\,dA_h.
\]
Here \(u=B_f/(A_f L)\), \(v=A_fB_f/L^3\), \(L^2=A_f^2\cos^2\theta+B_f^2\sin^2\theta\), \(A_f=A\sqrt{1-\tau^2}\), \(B_f=B\sqrt{1-\tau^2}\), and \(dA_h=A_f^2\sin^2\theta\,L\,d\theta\,dA_{S^2}\). The discrepancy is strictly positive for \(\lambda\ne\lambda_*\). Its squared ratio to \((\lambda-\lambda_*)^2\) tends to \(\frac16\int u^2(v-u)^2/U_*^6\,dA_h>0\). No rotation or change of angular marking is used.

## Positive surplus at one common width

Choose a small compact interval \(J\) about \(\lambda_*\) and choose the original marked disk identifications and conformal normalization smoothly there as in the exact reference. Smooth dependence of the geodesic ODE and the inverse function theorem on the compact embedded face provide buffered common inward radii. The sign of the limiting closed quadratic form is uniform after shrinking \(J\): the physical exterior has \(R_g>0\), and the boundary term in the flattened hyperbolic coordinates is \(6(c_\lambda-\partial_{\nu_{\rm H}}\log\Omega_\lambda)\) for \(c_\lambda=(\mathrm{tr}S_\lambda-H)/3\). Its strict positive minimum at \(\lambda_*\) persists. Trace and Sobolev constants of the compact family can be chosen uniformly. In its paired Gaussian charts the interpolated scalar curvature is bounded because the singular second-normal term is trace-free with respect to \(h\), while the tangential metric differs from \(h\) by \(O(w)\). The finite form error is \(O(w)\) uniformly on \(J\) by the strip trace estimate in the finite connector. Consequently all endpoints at \(0<w\le W\) are positive for some common \(W>0\), chosen within both native radii.

Use a fixed smooth clamped \(\chi\), \(\psi(x)=x\chi(x)\), and take
\[
 L_D=\left(\frac16\int_\Sigma
      \frac{u^2(v-u)^2}{(u^2+\min J)^3}\,dA_h\right)^{1/2},
 \quad P=\|\psi''\|_2,\quad
 b=\sqrt{\mathrm{area}(h)}\,\sup_{\lambda\in J,\,\sigma,\,0<w\le W}B_{\sigma,\lambda}(w).
\]
The curvature-block guards of the finite connector make \(b\) finite. They use the conformally normalized hyperbolic cap and the original inward continuation. Its interior is conformally flat away from the connector. Differentiating \(U_\lambda^{-1}\) gives \(\|D_\lambda\|_2\le L_D|\lambda-\lambda_*|\). With \(m=\min_\sigma m^\sigma\) pick one width \(0<w\le W\) satisfying \(b\sqrt w\le\sqrt m/4\). At this width keep
\[
   0<|\lambda-\lambda_*|\le\frac{\sqrt{mw}}{2 P L_D},\qquad \lambda\in J .
\]
The finite signed upper bounds now give \(\sqrt{c_\sigma}\le P\|D_\lambda\|_2/(2\sqrt w)+b\sqrt w\le\sqrt m/2\). The common nonzero incoming Weyl entry on the face and the physical plateau of the cutoff show \(c_\sigma>0\). The full endpoint on the original marked smooth sphere has energy \(v^\sigma+c_\sigma\), yielding \(m^\sigma-c_\sigma\ge 3m/4\) for both signs. Its sign and this saving hold at the *same* positive \(w\). The reference carries no other cap-side cost.

At this fixed \(w\) one can also keep the entire affine path positive and below the strict joined wall. Write \(G_{s,\lambda}=(1-s)g+s g_{w,\lambda}\) in the actual smooth disk identification, extending by \(g\) on \(V\). Use the near-round parameter branch constructed at \(\lambda_*\), on which \(r_*=\min_{M,s}R(G_{s,\lambda_*})>0\), \(H_*=\sup_s E_+(G_{s,\lambda_*};M)<2T\), \(T=4\pi^2\). On \([0,1]\times J\) the smooth fixed-width metrics have finite derivative bounds \(L_R=\sup|\partial_\lambda R(G_{s,\lambda})|\), \(L_E=\sup_{s,\sigma}|\partial_\lambda E_\sigma(G_{s,\lambda};M)|\), with the latter supremum also over \(J\). All changes of cap Gaussian charts are in the disk marking and can be chosen smooth in \(\lambda\). Impose also \(L_R|\lambda-\lambda_*|\le r_*/2\), \(L_E|\lambda-\lambda_*|\le(2T-H_*)/2\). These bounds still leave nonmatching choices. The joined peak, including the whole exterior, is at most \((H_*+2T)/2<2T\). This is a finite two-sign saving on the charged induced source, where \(I^+(S^4)=0\). The replacement spends the entire disk, including any charged core. Its gain is relative to its incoming energy.

## Lower bound on the mismatch of any positive reference on the minimizing disk

At one index of the actual E61 source put \(e=E_\sigma(g_i;M)<2T\), \(d=e-I^+(M)\), \(m^\sigma=E_\sigma(g_i;D_i)\). Suppose a candidate space-form ball has the required physical boundary isometry, mean normalization, a common native interval \((0,W]\) of *positive* capped endpoints, and finite bounds \(b_\sigma\ge\sqrt{\mathrm{area}(h)}\, B_\sigma(w)\) throughout that interval. The entire \(V_i\) is kept. For each sign with \(M_\sigma=m^\sigma-d>0\), the infimum and the upper connector estimate give, for every such \(w\),
\[
  \frac{P}{2}\|D\|_2\ \ge\sqrt{M_\sigma w}-b_\sigma w .
\]
This is a lower bound on the actual trace-free shape mismatch. At the maximizing *physical* width \(w_\sigma=\min(W,M_\sigma/(4b_\sigma^2))\), taking \(w_\sigma=W\) for \(b_\sigma=0\), its right side is strictly positive. For \(W\ge M_\sigma/(4b_\sigma^2)\) with \(b_\sigma>0\), it equals \(M_\sigma/(4b_\sigma)\). For a noninterval set of certified positive widths use the supremum over that set; an optimum outside the chart is inadmissible. Under only \(W\ge W_0>0\), \(b_\sigma\le b_0<\infty\), \(M_\sigma\ge m_0>0\), this gives a uniform positive mismatch on the selected subsequence, without assuming convergence of the markings. The expression is unchanged in content by a common change of physical length units (the two sides scale as length to the power \(1/2\)). This conditional bound uses neither a minimizing metric nor an interchange of a width limit with a sequence limit.

The two-sided curvature estimate gives a second check when the cap is conformally flat off the strip. Set \(x=P\|D\|_2/2\), with the same cutoff throughout. The density norm in sign \(\sigma\) differs from \(x/\sqrt w\) by at most \(b_\sigma\sqrt w\). For each sign, \(c_\sigma\le x^2/w+2xb_\sigma+b_\sigma^2w\) and \(c_\sigma\ge x^2/w-2xb_\sigma\). The complete retained exterior and closed signature give \(c_+-c_-=m^+-m^-\) at every positive \(w\). Subtract the two inequalities in each order and take \(w\downarrow0\) at this fixed index. It follows that \(|m^+-m^-|\le 2x(b_++b_-)\). This condition uses the two chiral guards and holds independently of endpoint positivity. It supplements the maximum of the separate one-sign infimum bounds.

If a replacement also carries interior energy \(j^\sigma(w)\) off its strip, the exact allowance uses \(m^\sigma-d-j^\sigma(w)\) under the positive square root at each width for which it is positive. The same connector upper estimate must independently hold for that candidate. For an enlarged disk the incoming mass is the whole \((1-2^{-k})e+2^{-k}q^\sigma-r^\sigma\). If the protected core is preserved its mass occurs also in the complete new disk. Every further interior contribution belongs in \(j^\sigma(w)\). The joined-wall bound for a round-matched path preserving that core still requires \(H\ge I+\max_\sigma q^\sigma\).

On E61 the charge floor in its selected sign eventually exceeds \(d_i\). Neither that floor nor the ordered-tensor integral on the buffered comparison ball identifies an isometric reference, an affordable physical \(W\), a uniform curvature remainder, or the spectrum of the capped boundary form. The optimized inequality is an obstruction for actual candidate data at a single index. No measured curvature choice on the ellipsoid transfers to this sequence.
