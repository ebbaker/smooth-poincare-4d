# E56b · A conformally invariant coordinate test on the selected disk collars

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution for SP4-MASTER-DESC-B01. Actual serving model and reasoning effort are unavailable. Frozen inputs are the E55 master and fixed-type TeX bundles `15c0f568bb52bdde` and `d68f8bb116c8bdbd` and the endpoint section `endpoint_charge.tex` at SHA-256 prefix `b877c61b76b7`. The [E53–E55 assessment and version receipt](../../research-progress/handoffs/E53_E55_ENDPOINT_CHARGE_20261125.md), [endpoint review](../../reviews/E55_ENDPOINT_DISK_AUDIT.md) and [owning register](../research-progress/REGISTER.md) record the input scopes.

The marked splice can be tested using the two physical Weyl measures and two coordinate quantities on the actual collar. These quantities are the uniform distortion of the determinant-one metric and the differentiated residual of its four-harmonic coordinate equations. Both quantities agree when computed using the positive-Ricci comparison or physical Yamabe metric in the same chart, regardless of the derivative of the conformal multiplier. This replaces the separate comparison-gauge curvature and first-derivative estimates with one coordinate-equation test. The disk selection supplies the curvature term. It leaves the two coordinate bounds open, even with smooth positive-Ricci containing balls.

## Actual disks and conformal normalization

Fix the E55 subsequence and one finite selection at a fixed tolerance on the closed oriented smooth homotopy four-sphere. Use \(T=4\pi^2\), \(e_i=E_+(g_i;M)=E_-(g_i;M)\to T\), and the Hilbert–Schmidt norm for the real Weyl operators on \(\Lambda^\pm\). Each closed disk \(B_{ij}\) is a subdisk of an open parametrized model ball contained in the \(k_i\)-ball with physical full-tensor curvature integral below \(\zeta\). Its compact containment gives an annulus about the boundary in that open embedding. A smooth increasing change of the radial parameter sends the unit sphere of \(A=\{e^{-1}<|x|<e\}\) onto the actual marked sphere. Keep the angular parametrization from the disk, the source orientation, and the outer radial direction towards the retained source. The radial change may depend on the index and is included when testing the estimates. This construction gives disjoint collars in the containing balls, with both halves of each collar included. [E55 disk construction](../manuscript/endpoint_charge.tex) · [Model ball and closed subdisk in the volume proof](../../manuscript/physical_volume.tex)

For an oriented collar embedding \(\Psi:A\hookrightarrow M\), write \(p=\Psi^* k_i\) and \(m=(\det p)^{-1/4}p\) using these coordinates. The matrix \(m\) is unchanged if \(p\) is replaced by \(\Psi^*g_i\) or \(\Psi^*q_i\). Use \(m=\exp h\), with \(h=\log m\) symmetric and trace free, and let \(a=\|h\|_{L^\infty(A)}\). Define the coordinate residual by

$$
 G_\alpha(m)=\partial_j\!\big(m^{\alpha\alpha}m^{j\alpha}\big)
 \quad (\text{no sum on }\alpha),\qquad
 \tau=\|DG(m)\|_{L^2(A,dx)}.
$$

This is the coordinate divergence of the \(4\)-harmonic flux for \(x^\alpha\). Before normalization the flux is \(\sqrt{\det p}\,p^{\alpha\alpha}p^{j\alpha}\), which has exactly the same value because the two contravariant factors cancel the dimensional volume factor. In particular, \(G=0\) is the exact four-harmonic coordinate condition in both gauges. The determinant-one and \(4\)-harmonic choices are the four-dimensional case of Liimatainen–Salo, Theorem 1.1 and equation (1.1) in arXiv:1310.3666v1. The cited theorem concerns ellipticity in supplied \(n\)-harmonic coordinates. The small-distortion \(L^2\) estimate with nonzero residual below is obtained directly at the Euclidean symbol. The primary preprint statements and flux convention were checked on 25 November 2026. [Published source](https://doi.org/10.1093/imrn/rnv255) · [Inspected preprint, pp. 1–2](https://arxiv.org/pdf/1310.3666)

For every source annulus set

$$
 w^2=4\big(E_+(g_i;\Psi(A))+E_-(g_i;\Psi(A))\big)
     =\int_{\Psi(A)} |W(g_i)|_{\mathrm{tens}}^2\,dV_{g_i}.
$$

On an E55 collar \(w^2<\zeta\). For disjoint collars \(\sum_j w_j^2\le 8e_i\). These are the original chiral measures on the actual sets. With \(a\) less than a fixed small constant, the Euclidean component norm \(\|W_{\mathrm{low}}(m)\|_{L^2(A,dx)}\) is bounded by \(Cw\), by uniform ellipticity, \(\det m=1\), and conformal invariance of the dimension-four Weyl integral. The comparison uses the conformally invariant Weyl curvature.

## Interior estimate on the fixed annulus

Fix a trimmed subannulus \(A_0\Subset A\) containing the straightening cutoff support, and let \(b=w+\tau+a\). For smooth \(m\) as above, there are constants depending only on the trim, profile and dimension such that, if \\(a\le a_0\),

$$
 \|D^2h\|_{2,A_0}\le Cb,qquad
 \|Dh\|_{4,A_0}^2\le Cab,qquad
 \|\mathrm{Rm}_m\|_{L^2(A_0,m)}\le Cb.
 \tag{1}
$$

All derivative norms in this note use Euclidean components and \(dx\). To see the symbol estimate, write \(\mathcal W_0(h)\) for the linearization of all-lowered Weyl at \(\delta\), and take \(\mathcal G_{0,\alpha}(h)=-\partial_j h_{j\alpha}-\partial_\alpha h_{\alpha\alpha}\) with no sum on the free \(\alpha\). At a nonzero covector \(\xi\), the kernel of the linearized Weyl symbol consists of \(\ell\delta+\xi\otimes u+u\otimes\xi\). One way to check this is to set \(\xi\) parallel to the first coordinate. The linearized Riemann symbol has only components generated by \(R'_{1a1b}\), proportional to \(h_{ab}\) for \(a,b>1\). If the Weyl symbol vanishes, this Riemann symbol has the algebraic form \(\delta\owedge P\). Restricted to \(\xi^\perp\), the vanishing of its components forces the transverse Schouten block to vanish, since that space has dimension three. Its mixed components with one index parallel to \(\xi\) force \(P_{1a}=0\). Then \(R'_{1a1b}\) is proportional to \(\delta_{ab}\), as claimed. The displayed tensors are in the Weyl kernel by linear conformal and diffeomorphism invariance. For such a tensor with trace zero, \(4\ell+2\xi\cdot u=0\), and up to the common sign and Fourier factor,

$$
 \xi_j h_{j\alpha}+\xi_\alpha h_{\alpha\alpha}
  = (|\xi|^2+2\xi_\alpha^2)u_\alpha.
$$

Thus the pair \((\mathcal W_0,D\mathcal G_0)\) is jointly elliptic on the trace-free subspace in the fixed \(x^\alpha\) coordinates. Homogeneity and compactness of the unit covectors give by Plancherel

$$
 \|D^2 f\|_2 \le C\big(\|\mathcal W_0 f\|_2+\|D\mathcal G_0 f\|_2\big)
$$

for every smooth compactly supported trace-free \(f\) in Euclidean four-space. Using the matrix exponential and the all-lowered curvature formula, both \(W_{\mathrm{low}}(m)-\mathcal W_0 h\) and \(DG(m)-D\mathcal G_0 h\) are bounded pointwise by \(C(a|D^2h|+|Dh|^2)\). Indeed, the highest-order coefficients in each are smooth in \(h\) and agree with their linearization at \(h=0\). The remaining terms are quadratic in first derivatives with bounded smooth coefficients.

Let \(\chi\) be a smooth cutoff compactly supported in \(A\), equal to one on \(A_0\), with \(0\le\chi\le1\). Put \(X=\|\chi^2D^2h\|_2\) and \(J=\|\chi Dh\|_4^2\). Apply the Fourier estimate to \(\chi^2h\) and expand the two operator commutators. The bound is

$$
 X\le C\big(w+\tau+a+\|\chi Dh\|_2+aX+J\big).
$$

The first-derivative cutoff terms have a factor \(\chi\) because they differentiate \(\chi^2\) once. Integration by parts in \(\int\chi^2|Dh|^2\) gives \(\|\chi Dh\|_2\le C\sqrt{aX}+Ca\). Integrating one derivative onto \(\chi^4 Dh|Dh|^2\) in \(\int\chi^4|Dh|^4\) gives \(J^2\le Ca(JX+J^{3/2})\). The term with \(D\chi\) uses Hölder on its fixed finite-volume support. The other term uses \(\chi^4|Dh|^2|D^2h|\). Hence \(J\le Ca(X+a)\). Young’s inequality for \(\sqrt{aX}\) and the fixed smallness of \(a_0\) absorb all \(X\)-terms and give the first two conclusions of (1). The identity \(m=\exp h\) and the full curvature expression then give the last conclusion. The proof is interior on the actual marked annulus, with a fixed cutoff supported away from both faces.

## Certified path and retained costs

Use a fixed smooth \(0\le\psi\le1\) supported in \(A_0\), equal to one on a band about the marked sphere, and the path

$$
 n_s = \exp\big((1-s\psi)h\big),\qquad 0\le s\le1 .
$$

Restore the original positive scalar multiplier from the smooth physical source, so the joined path is smooth, agrees with the source off the collars, and uses the same marked seam. In an oriented frame put \(F_\pm(m)=(\det m)^{1/4}\) times the chiral Weyl matrix computed in the symmetric \(m^{-1/2}\) orthonormalization. Its Euclidean \(L^2\) norm gives the square root of the respective chiral energy. For a metric of the form \(\exp f\), the all-lowered curvature formula and the smooth projection give the pointwise expansion

$$
 F_\pm(\exp f)=L_\pm(D^2 f)+R_\pm(f,Df,D^2 f),
 \quad |R_\pm|\le C(|f|\,|D^2f|+|Df|^2),
$$

where \(L_\pm\) has constant coefficients. For \(\theta=1-s\psi\), the principal term in \(F_\pm(n_s)-\theta F_\pm(m)\) cancels except for terms bounded by \(C(|Dh|+a)\). The two remainders are each bounded by \(C(a|D^2h|+|Dh|^2+|Dh|+a)\) on the fixed transition support, using bounded cutoff derivatives and \(a\le a_0\). Outside that support the path agrees with the incoming metric. Consequently (1) gives uniformly in \(s\)

$$
 \|F_\pm(n_s)-\theta F_\pm(m)\|_{2,A_0}
 \le C\big[a+\sqrt{ab}+ab\big] =:\beta.
 \tag{2}
$$

At the endpoint \(n_1=\delta\) near the actual seam. The conformal change there to \(|x|^{-2}\delta=dt^2+\gamma_{S^3}\), \(t=\log|x|\), installs the exact round product. The cap attachment uses the same angular marking, which extends over the parametrized original disk. A smooth cutoff for the conformal restoration can be used on both sides of the seam. Thus all joined metrics and the capped metric live on the original oriented smooth type. The conformal changes leave both chiral energies on the same sets. For an aggregate allowance, put

$$
 A_2=\Big(\sum_j a_j^2\Big)^{1/2},\quad
 a_{\max}=\max_j a_j,\quad
 J_1=\sum_j a_j(w_j+\tau_j+a_j).
$$

The direct sum of (2) on both halves gives

$$
 \eta=\Big(\sum_j\beta_j^2\Big)^{1/2}
 \le C\Big[A_2+\sqrt{J_1}+\Big(\sum_j(a_jb_j)^2\Big)^{1/2}\Big]
 \le C[A_2+\sqrt{J_1}+J_1].
 \tag{3}
$$

The physical Weyl contribution to \(J_1\) is at most \(A_2\sqrt{8e_i}\). For example \(a_{\max}\le a_0\), \(A_2\to0\) and \(\sum_j a_j\tau_j\to0\) suffice for \(\eta\to0\). The test allows divergent individual \(\tau_j\) when the product decays. The curvature contribution to (3) is uniform in the number of selected disks. At one fixed index use the actual finite \(A_2,J_1\) and the actual masses rather than an interchange of the source limit and the number of disks.

Write \(s_\pm\) for the incoming chiral mass of all collar supports, \(s_{\pm,o}\) for the part on exterior halves, and \(r_\pm=e_i-\sum_j E_\pm(g_i;B_{ij})\). Either chirality on the joined path has upper bound \(e_i+2\sqrt{s_\pm}\eta+\eta^2\). If this is bounded by \(H<2T\) for one chirality, the subcritical path stays positive, since their closed energies agree. Use the same marking, stretch each product into the discarded side, transfer compactly supported conformal-Laplacian tests by zero extension, and compactify the round ends as in the simultaneous-removal theorem. The resulting positive class has Yamabe constant at least \(\sqrt{48(2T-H)}\), and either retained chiral energy has upper bound

$$r_\pm+2\sqrt{s_{\pm,o}}\,\eta_o+\eta_o^2,\qquad \eta_o\le\eta.$$

Here \(\eta_o\) can be computed by restriction to the exterior halves. The raw charge \(r_\pm\) counts the exterior exactly once. Both halves are included before specifying \(H\). These are the exact-sign conditions from the existing path and cap argument. [Simultaneous replacement and localized costs](../manuscript/fixed_type_chiral_energy_descent.tex#L138)

With all E55 disks and fixed uncovered total charge \(\epsilon<T\), an aggregate error tending to zero gives the strict tests at large indices. The same is true for just one fixed selected disk if its total raw chiral charge is bounded below and its own allowance in (2) tends to zero. For the E55 construction its retained inner comparison ball has a fixed positive auxiliary volume in the limit, so its total raw chiral charge has a positive lower bound by the total-variation transfer. On a subsequence choose the chirality with positive lower raw charge on that disk. Its exterior energy is then \(e_i-E_\pm(g_i;B_{ij})+o(1)<T\) at late indices while the joined bound tends to \(T\). The final closed competitor has equal chiral energies, so either choice contradicts the positive-class infimum. This conditional single-disk test uses the measured source disk without needing the other selected boundaries to have controlled charts.

## Obstruction to inferring the coordinate bound from the disk sandwich

Consider a stereographic patch of the standard round \(S^4\) with its smooth volume-one Yamabe and positive-Ricci comparison gauges both constant multiples of round. Use an oriented stereographic scale so the unit parameter disk and the fixed surrounding annulus lie in the patch. In these parameters make a smooth radial reparametrization

$$
 x=r\omega\longmapsto f_N(r)\omega,\qquad
 f_N(r)=r+\frac{\varepsilon_N}{N}\chi_1(r)\sin(N(r-1)),\quad
 \varepsilon_N=N^{-1/2}.
$$

Take \(\chi_1\) compactly supported in the trim and identically one on a fixed smaller band about \(r=1\). The map is the identity outside the support, fixes \(r=1\) pointwise, and \(f_N'>0\) at large \(N\). Thus it preserves the orientation, and the two marked faces can be chosen below and above its support and fixed. The closed disk image, all source ball inclusions, all comparison volume ratios and all physical curvature integrals stay the same. The physical curvature ceiling can be made arbitrarily small by choosing a small source stereographic patch. Weyl vanishes identically in every chart in this model.

The round stereographic multiplier cancels from determinant normalization. In the Euclidean radial and tangential eigenspaces the eigenvalues of the resulting \(m_N\) are \(\rho_N^{3/2}\) and \(\rho_N^{-1/2}\) respectively, with \(\rho_N=f_N'/(f_N/r)\). On the plateau \(f_N'=1+\varepsilon_N\cos(N(r-1))\), and \(f_N''=-\varepsilon_N N\sin(N(r-1))\). Hence \(\|h_N\|_\infty=O(\varepsilon_N)\) and \(\|Dh_N\|_{4,A_0}\ge c\varepsilon_N N\) for large \(N\). The radial derivative of its radial eigenvalue in the logarithm is \(\tfrac32[f_N''/f_N'-(f_N/r)'/(f_N/r)]\), with the latter term bounded by \(C\varepsilon_N\). The fourth power of the leading sine has uniformly positive integral over the fixed band. In (1) we have \(w_N=0\) and thus \(\tau_N\ge c'\varepsilon_N N^2\) at large \(N\). The weighted residual \(a_N\tau_N\) also diverges since \(a_N\ge c''\varepsilon_N\) on that band. In particular even uniform determinant-one convergence and an exact spherical metric ball sandwich give neither a first jet nor the differentiated four-harmonic bound for their arbitrary supplied parametrizations.

This obstruction concerns evaluation in the marked coordinates. The undeformed round chart has zero splice cost, and the example carries no endpoint charge. The source measure and ball selection hypotheses by themselves are invariant under the reparametrization just used. A geometric proof would need to choose, modify or replace each tested marking with quantitative control of distortion and differentiated tension, on a whole annulus about a disk that still has the actual inner charge. The coordinate construction must cover the whole annulus and preserve its specified faces. The endpoint comparison remains conditional on such a choice or on a different measured splice mechanism.
