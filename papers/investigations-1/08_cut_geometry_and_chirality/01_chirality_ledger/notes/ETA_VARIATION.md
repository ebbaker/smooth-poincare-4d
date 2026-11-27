# APS eta variation near a marked spherical link

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual model identifier and reasoning effort were unavailable to this helper. Bounded execution SP4-CUT-LED-E03, [request 1](../research-progress/handoffs/E03_REQUEST_R1.md), with parent input `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`, the [B01 decision](../brainstorm/notes/ROUTING_20261127.md), and the frozen signed E01 Berger test in the request. This is a symbolic derivation for smooth Riemannian metrics, with a checked special case and conditional applications to the cited comparison data.

## Relative formula and first variation

Let \(\Sigma\) be a closed oriented smooth three-manifold, and let \(h_0,h_1\) be smooth Riemannian metrics. Use the APS even-form odd-signature eta invariant at zero, in the normalization of [parent Section 3](../../manuscript/cuts_of_subcritical_conformal_classes.tex). The primary input is [Atiyah–Patodi–Singer I, Theorem 4.14, p. 66](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf), checked on 27 November 2026. For an oriented compact smooth Riemannian four-manifold with product metric near its oriented boundary it gives \(\tau=\tfrac13\int p_1-\eta(\partial V)\). Use \(p_1=-\operatorname{tr}(\Omega\wedge\Omega)/(8\pi^2)\), with trace in the real tangent representation. The curvature convention is \(R(X,Y)=[\nabla_X,\nabla_Y]-\nabla_{[X,Y]}\) and \(R_{ijkl}=\langle R(e_i,e_j)e_l,e_k\rangle\). The unit sphere has curvature operator \(I\).

Put \(D_0=\nabla^{h_0}\), \(A=\nabla^{h_1}-D_0\), and write \(\Omega_0\) for the curvature of \(D_0\). All are on the same real bundle \(T\Sigma\). On the cylinder with orientation \(ds\wedge dV_\Sigma\), choose a metric interpolating the two metrics and constant in product collars at the ends. Restriction to the bottom is a homotopy equivalence, so \(H^2(V,\partial V)\to H^2(V)\) is zero and \(\tau(V)=0\). The APS formula gives the upper eta minus the lower eta. For the Pontryagin integral, replace the cylinder connection on \(TV=\mathbb R\oplus T\Sigma\) by the trivial line plus the pullback connection with tangential part \(D_0+\chi(s)A\) and trivial derivative in the parameter direction in any pulled-back frame. Here \(\chi\) runs from zero to one. The two connections restrict to the same connections at the boundary, so the integral agrees by relative Chern–Weil transgression. The replacement curvature is \(\Omega_0+\chi d_0A+\chi^2 A\wedge A+ds\wedge\chi' A\), where \(d_0\) is the exterior covariant derivative. Thus

\[
\eta(h_1)-\eta(h_0)=-\frac{1}{24\pi^2}\int_\Sigma
\operatorname{tr}\left(2A\wedge\Omega_0+A\wedge d_0A+\frac23 A\wedge A\wedge A\right).\tag{1}
\]

This is an equality of real eta differences. For a smooth path \(h_s\) with \(v=\dot h_s\), (1) gives \(\dot\eta=-(12\pi^2)^{-1}\int\operatorname{tr}(\dot D\wedge\Omega)\). In a positively oriented orthonormal coframe at the metric being varied, use the three-dimensional Schouten tensor \(P=\operatorname{Ric}-\tfrac R4 h\), its one-forms \(P_j=P_{jk}e^k\), and the Cotton–York tensor \(Y_{ij}=\varepsilon_i{}^{kl}\nabla_kP_{lj}\). Then

\[
\Omega^j{}_i=e^j\wedge P_i+P^j\wedge e_i,
\qquad
\dot D^i{}_{kj}=\tfrac12(\nabla_kv_{ji}+\nabla_jv_{ki}-\nabla_iv_{kj}).
\]

The trace contribution containing \(\dot D^i{}_j\wedge e^j\) vanishes by torsion freeness. The remaining coefficient in \(\operatorname{tr}(\dot D\wedge\Omega)\) is \(\varepsilon^{kli}\dot D^i{}_{kj}P^j{}_l\). The term \(\nabla_jv_{ki}\) vanishes by symmetry and the other two contribute equally. Integration by parts, using \(\nabla\varepsilon=0\), gives \(\int\operatorname{tr}(\dot D\wedge\Omega)=-\int\langle v,Y\rangle_h dV_h\). Therefore

\[
\boxed{\frac{d}{ds}\eta(\Sigma,h_s)=\frac{1}{12\pi^2}\int_\Sigma\langle\dot h_s,Y_h\rangle_h\,dV_h.}\tag{2}
\]

## Signed Berger check

On \(S^3=SU(2)\), orient the scale-one coframe by \(\sigma_1\wedge\sigma_2\wedge\sigma_3>0\) and take \(d\sigma_i=2\sigma_j\wedge\sigma_k\) cyclically. This is the positive \(d\sigma\) frame of the E01 outward test. Write \(h_t=\sigma_1^2+\sigma_2^2+t^2\sigma_3^2\) for \(t>0\). In the orthonormal coframe \((\sigma_1,\sigma_2,t\sigma_3)\), Cartan's torsion equation gives \(\omega^1{}_2=(2/t-t)e^3\), \(\omega^2{}_3=te^1\), and \(\omega^3{}_1=te^2\). Their curvature coefficients give \(K_{12}=4-3t^2\), \(K_{23}=K_{31}=t^2\) and \(P=\operatorname{diag}(a,a,b)\), where \(a=2-3t^2/2\) and \(b=-2+5t^2/2\). In this frame \(\nabla_kP_{ij}=(P_{jj}-P_{ii})\omega^i{}_j(e_k)\). It follows that \(Y_{33}=2t(b-a)=8t(t^2-1)\). The only component of \(\partial_t h_t\) in the coframe is \((\partial_t h_t)_{33}=2/t\), and \(\operatorname{Vol}(h_t)=2\pi^2t\). Equation (2) gives

\[
\frac{d}{dt}\eta(h_t)=\frac83t(t^2-1),\qquad
\eta(h_t)=\frac23(1-t^2)^2.
\]

The round offset vanishes by an orientation-reversing round isometry, and the integrated expression agrees with the signed E01 input for \(0<t<1\). Reversing the orientation negates both the Cotton–York tensor and the eta invariant.

## Explicit quadratic neighbourhood

Take \(h_0\) to be the metric of sectional curvature \(+1\) on an oriented spherical space form \(S^3/\Gamma\), with fixed marking. In (1) use \(h_1=h\) pulled back by that marking. Define

\[
\delta=\max_{0\le j\le2}\sup_\Sigma |D_0^j(h-h_0)|_{h_0}.
\]

The norms are Hilbert–Schmidt on tensors, with wedge products of distinct orthonormal forms of unit length. For \(0\le\delta\le1/2\), one has

\[
\boxed{\left|\eta(\Sigma,[h])-\eta(\Sigma,[h_0])\right|
\le \frac{3\sqrt2+\sqrt3}{2|\Gamma|}\,\delta^2.}\tag{3}
\]

To check (3), the round curvature has \((\Omega_0)^j{}_i=e^j\wedge e^i\). The connection difference has symmetric lower indices, so \(\operatorname{tr}(A\wedge\Omega_0)=0\) pointwise. Put \(k=h-h_0\). The connection formula is \(A^i{}_{mj}=\tfrac12 h^{il}(D_{0,m}k_{jl}+D_{0,j}k_{ml}-D_{0,l}k_{mj})\). Since \(\|h^{-1}\|_{\rm op}\le(1-\delta)^{-1}\) relative to \(h_0\), differentiation using \(D_0h^{-1}=-h^{-1}(D_0k)h^{-1}\) yields

\[
 |A|\le\frac{3\delta}{2(1-\delta)}\le3\delta,
 \qquad
 |D_0A|\le\frac32\left(\frac{\delta}{1-\delta}+\frac{\delta^2}{(1-\delta)^2}\right)\le6\delta.
\]

Antisymmetrizing the two form indices gives \(|d_0A|\le\sqrt2|D_0A|\). By Hodge duality on the form indices and Cauchy–Schwarz on the matrix entries, \(|\operatorname{tr}(A\wedge d_0A)|\le |A|\,|d_0A|\). Writing \(A=\sum_i A_i e^i\), each cubic trace in the coefficient of the volume form is bounded by \(|A_1||A_2||A_3|\) using Frobenius matrix norms. There are six terms, hence \(|\operatorname{tr}(A^3)|\le6|A_1||A_2||A_3|\le (2/\sqrt3)|A|^3\). The absolute integrand in (1) is bounded by \(18\sqrt2\delta^2+12\sqrt3\delta^3\le(18\sqrt2+6\sqrt3)\delta^2\). Inserting \(\operatorname{Vol}(h_0)=2\pi^2/|\Gamma|\) proves (3). The displayed \(\delta\) concerns a representative at fixed scale and in a fixed marking. Existence of any such representative suffices for the inequality on its conformal class.

## Foliation and ambient data

Let \(G=N^2 ds^2+h_s\) be a smooth Riemannian metric on an oriented cylinder with \(N>0\), using slice coordinates transported along the normal (locally the shift can be removed in this way). Let \(\nu=N^{-1}\partial_s\), fix the slice orientation by \(\nu\) first and set \(B_s=(2N)^{-1}\partial_s h_s\). Define \(\mathcal T_s=\int_{\Sigma_s}\langle B_s^\circ,\operatorname{curl}B_s^\circ\rangle\,dV_{h_s}\), where \((\operatorname{curl}B)_{il}=\varepsilon_l{}^{jk}\nabla_jB_{ik}\). Relative to the product boundary connection the connection difference has off-diagonal blocks \(B_i\) and \(-B_i\), where \(B_i=B_{ij}e^j\). In the Pontryagin transgression the linear and cubic traces vanish, and the quadratic trace is \(-2\sum_i B_i\wedge(d^\nabla B)_i\). After multiplication by \(-1/(8\pi^2)\) this gives \(+\mathcal T_s/(4\pi^2)\), since all trace terms in the curl pairing vanish by symmetry. The lower end has the opposite boundary orientation, while reversing the normal leaves the quadratic pairing unchanged. Thus applying the ledger to a subcylinder and differentiating gives

\[
12\pi^2\dot\eta(\Sigma_s,h_s)=\int_{\Sigma_s}N\bigl(|W^+|^2_{\rm HS}-|W^-|^2_{\rm HS}\bigr)\,dV_{h_s}-\dot{\mathcal T}_s.\tag{4}
\]

For the specified curvature indices and orientation, put \(\mathcal E_{ij}=W_{i\nu j\nu}\), \(\mathcal H_{ij}=\tfrac12\varepsilon_i{}^{kl}W_{klj\nu}\). Codazzi gives \(R_{klj\nu}=\nabla_k B_{lj}-\nabla_l B_{kj}\). The Schouten term and the trace part of \(B\) contribute only antisymmetric tensors after the epsilon contraction, so \(\mathcal H=\operatorname{sym}(\operatorname{curl}B^\circ)\). For \(a_i=e^i\wedge\nu^\flat\) and \(b_i=\tfrac12\varepsilon_i{}^{jk}e^j\wedge e^k\), \(*a_i=-b_i\). The Weyl operator commutes with \(*\), so the diagonal blocks in these frames both equal \(\mathcal E\), and the off-diagonal blocks equal \(\mathcal H\). Hence on \(\Lambda^+\) and \(\Lambda^-\) its matrices are \(\mathcal E-\mathcal H\) and \(\mathcal E+\mathcal H\), respectively. The integrand in (4) is consequently \(-4N\langle\mathcal E,\mathcal H\rangle\) with these definitions.

For two slices marked by the same round model, (3) bounds the eta difference by the constant there times \(\delta_0^2+\delta_1^2\). The extrinsic data in (4) come from the ambient metric. A marked smooth ambient product comparison in \(C^2\) gives the tangential comparison by restriction and additionally controls \(B^\circ\) and its first tangential derivative. Indeed on a fixed slice \(B=|ds|_G^{-1}(\nabla^G ds)|_{T\Sigma}\), and \(ds\) is parallel in the model. Thus the connection difference and its derivative give \(B^\circ,\nabla^{h}B^\circ=O(\|G-G_0\|_{C^2(G_0)})\) and \(\mathcal T=O(\|G-G_0\|_{C^2(G_0)}^2)\) there. An intrinsic estimate on \(h\) alone does not control \(\mathcal T\).

- In the [marked-neck manuscript](../../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex), the smooth case of *One buffered cut* assumes small source \(C^2\) product error on the full collar. Apply (3) on its marked slices under that premise. The separate Euclidean variant assumes weaker norms and supplies no such intrinsic \(C^2\) bound by restriction.
- In the [attainment manuscript](../../../06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex), the smooth comparison on ALE end annuli gives small normalized product \(C^2\) error in the stated order of buffer length, radius and index. The normal-sphere comparison gives \(O_\ell(s^2)+o_i(1;s,\ell)\) product \(C^2\) error, for fixed \(\ell\), then small \(s\), then large \(i\). These are the source comparisons to which (3) applies. At a slice made exactly product by a splice, \(\mathcal T=0\) and eta equals the round offset for that product link.
