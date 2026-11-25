# SP4-MASTER-E38 · Marking a physical spherical shell

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution under B03. Actual serving model and reasoning effort are unavailable. Baseline `2689540e6dae1656b7f5ad4be52504db044995f2`. Checked SHA-256 prefixes for [critical annulus](../manuscript/critical_annulus.tex), [Ricci scales](../manuscript/ricci_scales.tex), [complete limits](../manuscript/complete_limits.tex), [E16](E16_SEPARATED_BLOCK.md) and [E25](../reviews/E25_ANNULAR_VOLUME.md) are `c0235f11a429`, `091cd448e885`, `8b5692f2bcab`, `3bd0ea1daa0d` and `81c17fd36f00`. The working [physical-shell launch](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/continuation-notes/PHYSICAL_SHELL_LAUNCH_20261125.md) has prefix `7b4aa674a9c5`.

An embedded uniformly elliptic spherical collar in the selected physical block puts the **entire median exterior on one side**, even if that exterior has several components. The Dirichlet cost of a cutoff inside the collar rules out any median-exterior point on the smaller-volume side. One nonzero intersection with an actual source arc then suffices for the full marking. This implication uses the physical Yamabe inequality and a collar already embedded on the source. It leaves existence of that collar, the linking test and the critical coordinate estimates open.

## Source and hypotheses

Take one separated subsequence of smooth Riemannian volume-one positive Yamabe minimizers \(g_i\) on a fixed smooth, closed, oriented hypothetical nonstandard homotopy four-sphere \(M\). Use \(e_i=E_+(g_i)\to I^+(M)\) and \(4\pi^2\le e_i\le 8\pi^2-\delta\) for fixed \(\delta>0\). The scalar curvature is \(Y_i=Y([g_i])\ge y_0=\sqrt{48\delta}\). The marked measure is \(\lambda_i=|W^+_{g_i}|_{\rm HS}^2dV_{g_i}\) in the fixed orientation. For fixed \(0<\theta<1/2\), take \(a_i=r_i(\theta)\), \(b_i=r_i(1/2)\), with \(a_i/b_i\to0\), and take \(x_i\) attaining \(a_i\). Write \(d_i=d_{g_i}(x_i,\cdot)\). The marks \(D_{i,-}=\{d_i<a_i\}\) and \(D_{i,+}=\{d_i\ge b_i\}\) have masses \(\theta e_i\) and at least \(e_i/2\). The second bound uses the maximum over all centers in the definition of \(r_i(1/2)\). Distance spheres have zero four-volume, hence zero chiral mass. The selected physical block \(\mathcal C_i=\{s_i^-<d_i<s_i^+\}\) has \(a_i/s_i^-\to0\), \(s_i^+/b_i\to0\) and full four-index curvature integral tending to zero. The physical noncollapse bound is \(\operatorname{Vol}_{g_i}B_{g_i}(z,r)\ge c_0r^4\) for every center and \(0<r\le1\), and the physical diameter is bounded above by a fixed \(D\). These inputs come from [complete limits](../manuscript/complete_limits.tex), [E16](E16_SEPARATED_BLOCK.md) and [E25](../reviews/E25_ANNULAR_VOLUME.md).

Suppose that an oriented smooth embedding \(\Phi_i:A(1/8,8)\to\mathcal C_i\) has been obtained with \(m_i=\rho_i^{-2}\Phi_i^*g_i\) obeying \(\lambda\delta_{\rm Euc}\le m_i\le\Lambda\delta_{\rm Euc}\), for fixed \(0<\lambda\le\Lambda<\infty\). Let \(S_i=\Phi_i(\{|y|=1\})\) and \(Q_i=\Phi_i(\{1/4\le|y|\le4\})\). The two marks are disjoint from the whole trim \(Q_i\) by its position. Put \(t_i=\max_{Q_i}d_i\); in particular \(t_i\le s_i^+\).

## The smaller side has no point beyond the collar depth bound

The connected two-sided hypersurface \(S_i\) has exactly two complementary components. For a direct proof suppress the index and write \(r=|y|\) on the chart. Choose a smooth \(\psi(r)\) that is zero near the trim's inner face and one near its outer face. The one-form \(\alpha=d(\psi(r))\) on the trim extends by zero to a smooth closed one-form on \(M\). It has a primitive \(F\) since \(M\) is simply connected. On \(M\setminus S\) use the smooth function \(k\) equal to \(\psi(r)\) on the inner half-trim and \(\psi(r)-1\) on the outer half-trim, extended by zero. The function \(F-k\) is locally constant there, and its values at the two faces differ by one, as seen by integrating \(\alpha\) along a radial segment. Thus the faces lie in different components. Every complementary component meets one of the two connected half-collars, by following a path to its first point of \(S\). This gives exactly two components, labeled by the coordinate faces. In particular, this argument requires no assumption on the smooth types of their closures.

At each index choose a side \(U_i\) of physical volume at most one half. Fix two smooth radial cutoff profiles for \(Q_i\), one for each possible choice of \(U_i\). Each profile is zero near \(S_i\) and on the other side, and equals one near its own trim face. Extend it to \(f_i=1\) on \(U_i\setminus Q_i\) and zero outside \(U_i\). Define \(K_0\) as the maximum of the two Euclidean Dirichlet energies on \(A(1/4,4)\). Comparison of inverse metrics and volume forms gives

$$
 \int_M|df_i|_{g_i}^2,dV_{g_i}\le K\rho_i^2,
 \qquad K=\lambda^{-1}\Lambda^2K_0.
$$

The power \(\rho_i^2\) comes from the physical inverse metric and four-volume. The Yamabe variational quotient in dimension four, applied to \(f_i\) by adding a positive constant and taking it to zero, gives

$$
 (1-2^{-1/2})y_0\operatorname{Vol}_{g_i}(U_i\setminus Q_i)^{1/2}
 \le (1-2^{-1/2})Y_i\|f_i\|_{4}^2
 \le 6K\rho_i^2 .
$$

The second inequality uses \(\|f_i\|_2^2\le 2^{-1/2}\|f_i\|_4^2\), from the volume of the entire physical side. See [Lee–Parker, *The Yamabe Problem*, Bull. AMS 17 (1987), §1, equations (1.3)–(1.5)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) for the quotient, and [E25](../reviews/E25_ANNULAR_VOLUME.md) for the related test on an exterior component.

If \(z\in U_i\) and \(d_i(z)>t_i\), the physical ball about \(z\) of radius \(\min\{1,d_i(z)-t_i\}\) lies in \(U_i\setminus Q_i\). Each minimizing segment from \(z\) to a point of this open ball stays at distance greater than \(t_i\) from \(x_i\), so avoids both the trim and the sphere. Noncollapse therefore yields the finite bound

$$
 \min\{1,d_i(z)-t_i\}\le L\rho_i,
 \qquad L=\left(\frac{6K}{(1-2^{-1/2})y_0\sqrt{c_0}}\right)^{1/2} .
 \tag{1}
$$

The scale of a uniformly elliptic trim also satisfies \(\rho_i\le 4t_i/(3\sqrt\lambda)\). To see this, take a minimizing segment from \(x_i\) to any point of \(S_i\). The starting point is outside \(Q_i\). The last portion inside the open trim starts at a trim face and ends at coordinate radius one. Its length is at least \((3/4)\sqrt\lambda\,\rho_i\), because the Euclidean radius changes by at least \(3/4\). The entire segment has length at most \(t_i\).

Consequently \(\min\{1,b_i-t_i\}>L\rho_i\) at large \(i\). Indeed \(t_i/b_i\to0\), \(b_i\le D\) and \(\rho_i\lesssim t_i\). Equation (1) excludes **every** point of \(D_{i,+}\) from the side of volume at most one half. Since the median exterior is nonempty, the smaller side is unique at these indices. The ball \(D_{i,-}\) lies in the side containing \(x_i\), by following its minimizing radii. To prove the full marking it remains to identify \(x_i\) with the smaller side, or equivalently to show that one point of \(D_{i,+}\) is opposite \(x_i\).

## Finite crossing tests on the source

For a piecewise smooth arc \(\gamma\) from \(x_i\) to any \(q_i\in D_{i,+}\), the integral \(\int_\gamma\alpha\) is \(0\) or \(\pm1\). The primitive above shows that it is nonzero exactly when the endpoints lie on opposite sides. For a transverse arc this is the signed intersection with \(S_i\) in its increasing-radial coorientation. Both versions are independent of the chosen arc because its endpoints are in fixed sides. Together with (1), one witnessed nonzero value certifies the complete marks on opposite sides.

A concrete sufficient test uses a minimizing segment \(\gamma:[0,d_i(q_i)]\to M\), parameterized by physical arclength from \(x_i\) to one \(q_i\in D_{i,+}\). Suppose the inner face of \(Q_i\) has distances at most \(u_i\), the outer face has distances at least \(v_i\), and \(u_i<v_i\). If \(\gamma\) visits the open trim at a time in \((u_i,v_i)\), that excursion starts at the inner face and ends at the outer face, since \(d_i(\gamma(t))=t\). No excursion can traverse from outer to inner. There is at most one full inner-to-outer traversal by the same ordering. Integrating \(\alpha\) on the excursions gives one. Each incomplete excursion contributes zero, and summing over the excursions is valid by absolute integrability along the finite-length arc. This test is expressed in physical distances and the actual source embedding. Merely knowing that the chart contains a smooth flat limit or that there is a point of the trim in the shell leaves the arc visit undecided.

The coordinate-inner side can also be identified without an exterior arc. For a coordinate sphere write \(S_i(r)=\Phi_i(\{|y|=r\})\). Suppose \(x_i\) is outside the closed trim and the two infima satisfy

$$
 \min_{S_i(1/2)}d_i\le \min_{S_i(2)}d_i .
$$

If \(x_i\) were on the coordinate-outer side, a minimizing segment to a closest point of \(S_i(1/2)\) would have to meet \(S_i(2)\). The radial spheres have the same assignment of sides for points outside the trim, by the radial isotopy in the chart. Between the last hit of \(S_i(2)\) and the first hit of \(S_i(1/2)\), the segment lies in the chart band and incurs an extra length of at least \(\tfrac32\sqrt\lambda\rho_i\). This contradicts the ordering of the infima, including equality.

For a wider embedded chart \(A(1/8,L_*)\) in the physical block, a one-point bound suffices instead. Suppose \(p_i\in S_i(1)\) has \(d_i(p_i)\le A\rho_i\) for fixed \(A>0\), and \(L_*/2>1+A/\sqrt\lambda\). An outer-side \(x_i\), which lies outside the whole chart, could reach \(p_i\) only across the band from \(S_i(L_*/2)\) to \(S_i(1)\). On a minimizing segment take the last hit of \(S_i(L_*/2)\) before the first hit of \(S_i(1)\). The intervening segment stays in the band, even if the earlier arc left and reentered the chart. Its physical length is at least \((L_*/2-1)\sqrt\lambda\rho_i>A\rho_i\), a contradiction. The one-point bound is an additional quantitative hypothesis on the actual source distances.

Once either test places \(x_i\) on the coordinate-inner side, a sufficiently wide, uniformly elliptic exterior portion of the chart identifies the deep side without an exterior arc. Use a cutoff on the coordinate-outer side that is zero up to radius one, linear from one to two, and one thereafter. Its Dirichlet energy is at most \(15\lambda^{-1}\Lambda^2\omega_4\rho_i^2\), and its plateau contains \(A(2,L_*)\) with physical volume at least \(\lambda^2\omega_4(L_*^4-16)\rho_i^4\), where \(\omega_4\) is the volume of the Euclidean unit four-ball. If

$$
 (1-2^{-1/2})y_0\lambda\sqrt{\omega_4(L_*^4-16)}
   > 90\lambda^{-1}\Lambda^2\omega_4,
$$

the half-volume Yamabe inequality would fail on that side. Thus it is the deep side by (1), and either inner-side test gives the whole marking. The width is fixed before the source limit. The fixed chart in the critical-annulus proposition may have insufficient width for this numerical test when \(y_0\) is small.

The wide-chart version can dispense with initial placement in the physical block if the geometric and integral data are supplied directly. Suppose \(L_*>8\) is fixed, \(\Phi_i:A(1/8,L_*)\to M\) satisfies the uniform ellipticity and one-point bound above, \(a_i/\rho_i\to0\) and \(\rho_i/b_i\to0\), and the full-curvature integral on the entire chart tends to zero. For \(Q'_i=\Phi_i(\{1/4\le |y|\le L_*/2\})\), first exit from a slightly larger compact coordinate annulus forces every path from \(Q'_i\) to the exterior of the wide chart to have physical length at least \(c(\lambda,L_*)\rho_i\). If any \(z_i\in D_{i,-}\) lay in \(Q'_i\), every other point of \(D_{i,-}\) could be joined to \(z_i\) by a minimizing segment of length less than \(2a_i\). The whole inner mark would then lie in the chart, which contradicts its chiral mass \(\theta e_i\ge4\pi^2\theta\) and the vanishing full-curvature integral there. In particular \(x_i\) lies outside \(Q'_i\). Coordinate radial paths and unit-sphere arcs from \(p_i\in S_i(1)\) give \(\max_{Q'_i}d_i\le C(A,\Lambda,L_*)\rho_i\), so \(D_{i,+}\) avoids \(Q'_i\) and \(\min\{1,b_i-\max_{Q'_i}d_i\}>L\rho_i\) for large \(i\). The one-point orientation argument needs only that \(x_i\) is outside \(Q'_i\), because that region contains every sphere between \(S_i(1)\) and \(S_i(L_*/2)\). The capacity test and (1) now give the full marking, with the original protected trim inside \(Q'_i\). This variant requires a full physical source chart of width fixed sufficiently large in terms of \(y_0,\lambda,\Lambda,A\).

## What the full distance shell can certify

The earlier E25 test remains applicable directly to the physical distance shell. For \(a_i<s<R<b_i\) with \(R>2s\), define \(D_i(s)=\operatorname{Vol}_{g_i}\{s<d_i<2s\}\) and \(c_Y=(1-2^{-1/2})y_0\sqrt{c_0}/6\). If \(D_i(s)<c_Ys^2\min\{1,R-2s\}^2\), at most one component of \(\{d_i>s\}\) reaches depth \(R\). The component correspondence with \(\{s<d_i<R\}\) follows by Mayer–Vietoris with the connected inner ball, using \(H_1(M)=0\), and by minimizing segments. If \(t_i<s\), the unique component holding \(D_{i,+}\) avoids \(S_i\) and one verified arc again suffices. Once the full elliptic trim is present, (1) supplies this same-side conclusion directly. [E25 proof](../reviews/E25_ANNULAR_VOLUME.md)

The distance-shell test can also check coverage of a proposed chart in a smaller open radial band \(\{s<d_i<t\}\) with \(s<t<R\). Suppose its two trim faces lie in \(\{d_i\le s\}\) and \(\{d_i\ge t\}\), respectively. The intersection of the open trim with the radial band is relatively open and closed in the band, since the chart trim is compact and its boundary avoids the band. By the same Mayer–Vietoris correspondence the deep exterior component meets the band in a single component. A point of that component in the open trim then places the whole component in the trim. Every minimizing segment to the median exterior crosses this component and hence traverses the trim. The depth test, face bounds and component witness are additional hypotheses. Component uniqueness without the chart and this witness supplies no smooth spherical link.

The scalar-volume estimate is fixed-window information. The full tensor normalization gives \(|\operatorname{Rm}_{g_i}|^2\ge R_{g_i}^2/6\), hence \(D_i(s)\le (6/y_0^2)\int_{\{s<d_i<2s\}}|\operatorname{Rm}_{g_i}|^2dV_{g_i}\). At a fixed positive physical \(s\), this bounds the normalized ratio with a constant that may depend on \(s\). For a fixed normalized radius \(\sigma>0\) in a shrinking block of scale \(\ell_i\), the same estimate for the physical radius \(s=\sigma\ell_i\) reads

$$
 \ell_i^{-4}D_i(\sigma\ell_i)\le
 \frac{6}{y_0^2\ell_i^4}\int_{\{\sigma\ell_i<d_i<2\sigma\ell_i\}}
          |\operatorname{Rm}_{g_i}|^2dV_{g_i}.
$$

The selected block supplies an absolute \(o(1)\) on the right-hand integral. For fixed normalized \(s/\ell_i\) and \(R/\ell_i\), the E25 threshold is of order \(\ell_i^4\), and the selection provides no such rate. The physical total volume also gives no uniform normalized upper bound as \(\ell_i\to0\). This calculation does not assert failure of either volume test on the sequence.

## Conditional implication for the fixed-type cut

For the [critical-annulus proposition](../manuscript/critical_annulus.tex), additionally require the fixed small Euclidean distortion and \(T_i^a=\Delta_{m_i}y^a=0\) or \(\|DT_i\|_{L^2(dy)}\to0\), in the actual source chart. The physical block bounds the chart curvature because its integral is scale invariant in four dimensions. With one of the marking tests, both complete masses then enter the inherited splice and short-cut criterion. Fix the protected trim, splice profiles and positive Yamabe buffer before the limit. With per-side excess bounds \(\gamma_{i,\pm}=o(1)\), the inequalities \(e_i+\gamma_{i,+}+\gamma_{i,-}<8\pi^2\) and \(e_i-I^+(M)+\max\{\gamma_{i,+},\gamma_{i,-}\}<4\pi^2\theta\) hold eventually. The positive caps supplied by that criterion yield the fixed-type contradiction. [Quantitative marked cut](../manuscript/marked_cut.tex) · [Short cut](../manuscript/variational_comparison.tex)

Scale-invariant full curvature smallness and the ball-volume lower bound do not furnish the whole embedded harmonic annulus in this calculation. [E16](E16_SEPARATED_BLOCK.md) gives protected local charts with additional supercritical Ricci bounds. The [Ricci-scale theorem](../manuscript/ricci_scales.tex) uses bounds on full buffered balls for its stronger conclusions. Gluing local charts into one source embedding, verifying a spherical link if a quotient occurs, locating the collar across a physical minimizing arc, and controlling the differentiated tension in the splice chart remain geometric requirements. Neither an exact Bach-flat comparison theorem nor a smoothed or conformal gauge without source transfer proves these requirements for the selected sequence. The proved gain is that the embedded chart controls all remote points at once, with no global transition-volume estimate needed for that part of the marking.
