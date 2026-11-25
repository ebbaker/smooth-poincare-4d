# E56cr · Independent check of the two-volume radial test

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded independent review of SP4-MASTER-E56c under NECK-B04/B05. Actual serving model and reasoning effort are unavailable. The frozen master and neck source bundles begin `15c0f568bb52bdde` and `9531c2a1087d3a8e`. The independently checked [E56c proof note](../notes/E56_PHYSICAL_RADIAL_FLUX.md) has SHA-256 prefix `2a0e895cdac9081b`. The previous assessed radial comparison and link/cap conclusions are the inherited inputs. [E53a review](E53_RADIAL_CHECK.md) · [Quotient link and exact product threshold](../notes/E08_QUOTIENT_LINK_TEST_20261125.md)

**Assessment.** The finite-band comparison, detection by two measured shell volumes, and the full marked spherical cut follow under the stated proper flat comparison, normalized physical volume limits, and separated-source hypotheses. The equality condition detects a nonnegative radial defect with the lower endpoint of the comparison interval as its radial shift. The exact two-volume residual below also gives a bound on the defect on compactly trimmed comparison bands. Extraction of the proper flat comparison and volume saturation on an actual selected block remain additional premises.

## Backward calibration up to the open end

In a buffered flat coordinate ball, the pullback distances converge uniformly and are equi-Lipschitz with metric length control from uniform convergence of the rescaled physical metrics. This gives \(|r(z)-r(p)|\le d_h(z,p)\) for paths in such balls and then along piecewise paths. A source minimizing final segment from the original center \(x_i\), taken backwards and stopped before the first possible exit of the buffered chart, lifts to that chart. For a fixed small duration it exists at late indices since \(d_{h_i}(x_i,F_i(p))\to r(p)>0\). Its lifted limit has speed at most one and satisfies \(r(\gamma(t))=r(p)-t\). Hence its endpoints at any two nearby times have distance at least their elapsed time. This equals the path length upper bound, so the lift limit is a straight unit-speed segment. Differentiating the calibration at almost every starting point proves \(|dr|=1\) almost everywhere.

The segment can be continued until any fixed backwards length \(\ell<r(p)-\alpha\). At each endpoint local calibration supplies a continuation and the same distance-versus-length argument excludes a corner in a convex flat chart. If its maximal backward time were smaller than a fixed such \(\ell\), the segment and its unit tangent would stay in the compact bundle over the corresponding buffered closed radial interval. The geodesic ODE extends the solution, and continuity of the calibration plus a local backwards extension at the endpoint contradict maximality. This uses properness only on compact radial strips strictly above \(\alpha\).

For \(q\) at backwards length \(\ell\), the exponential map on a small neighborhood of the corresponding initial velocity is defined by compact interior continuation and has derivative given by parallel transport. Flatness and the Jacobi equation give a local isometry from the Euclidean tangent coordinates \(z'\) to a neighborhood of \(p\), even if another exponential branch reaches \(p\). Each of its radial paths from \(q\) has length \(|z'|\), so \(r(q)+|z'|\) is an upper support to \(r\) on that neighborhood. After applying \((\,\cdot-\alpha)^2/2\), the Laplacian of this upper support is \(1+3(r(p)-\alpha)/\ell\) at \(p\). Every smooth lower test is bounded above by this upper support and therefore has Laplacian at most four by taking \(\ell\uparrow r(p)-\alpha\). The support points stay inside the open interval for every individual limit test.

In a flat chart, subtract \(|z|^2/2\) from \(f_\alpha=(r-\alpha)^2/2\). A lower test with positive Laplacian would violate the preceding inequality. If the result fell below the harmonic function with its continuous boundary values on a Euclidean subball, subtracting a small positive multiple of \(|z-z_0|^2-R^2\) together with that harmonic function would give such a lower test at an interior minimum. This yields the super-mean inequality and, by moving the spherical mean onto smooth nonnegative tests, the distributional inequality \(\Delta_h f_\alpha\le4\,dV_h\), with \(\Delta=\operatorname{div}\nabla\). Denote the nonnegative measure by \(\mu_\alpha=4\,dV_h-\Delta_h f_\alpha\).

## Measured source image and exact residual

Write \(s=t-\alpha>0\), \(A(t)=\mathcal H_h^3(r^{-1}(t))\) for almost every \(t\), and \(B(t)=A(t)/(t-\alpha)^3\). Coarea and the eikonal identity give \(r_*dV_h=A(t)\,dt\). For a smooth compactly supported radial test \(\eta\), the Lipschitz test \(\eta(r)\) is valid in the measure pairing by uniform and strong \(W^{1,2}\) interior approximation. Integration by parts gives the exact pushforward
\[
 r_*\mu_\alpha=-(t-\alpha)^4 DB .
\]
In particular \(B\) has a nonincreasing representative and \(\nu=-DB\) is a nonnegative locally finite measure.

Pull each normalized measured source annulus back through the single comparison embedding on the buffered compact strip. The volume density converges uniformly there. The indicator of \(\{u<d_i\circ F_i<v\}\) converges off the two levels \(u,v\), which have zero comparison four-volume by coarea. Dominated convergence on the actual comparison domain \(V\) proves
\[
 Q_i(u,v)\ \longrightarrow\
 Q(u,v)=\frac{\int_u^v B(t)(t-\alpha)^3\,dt}
                  {\int_u^v (t-\alpha)^3\,dt}.
\]
For \(t_0<t_1<t_2\), the exact difference is
\[
 Q(t_0,t_1)-Q(t_1,t_2)
 =\int_{r^{-1}((t_0,t_2))}
       \frac{K(r)}{(r-\alpha)^4}\,d\mu_\alpha,
\]
where
\[
 K(t)=
 \begin{cases}
 \dfrac{(t-\alpha)^4-(t_0-\alpha)^4}
 {(t_1-\alpha)^4-(t_0-\alpha)^4},
   & t_0<t\le t_1,\\[5pt]
 \dfrac{(t_2-\alpha)^4-(t-\alpha)^4}
 {(t_2-\alpha)^4-(t_1-\alpha)^4},
   & t_1<t<t_2 .
 \end{cases}
\]
Indeed, integrate \(B(u)-B(v)=\nu((u,v))\) for almost every pair \(u,v\) sampled independently from the two intervals with their normalized \((t-\alpha)^3dt\) weights. Fubini counts a defect at \(t\) with the weight of pairs \(u<t<v\), which is \(K(t)\). In particular the weight at \(t_1\) is one, so a jump at the dividing radius contributes fully. The weight is positive on the open band and has a positive lower bound on each compact trim after dividing by \((t-\alpha)^4\). The equality of positive normalized volume limits proves vanishing of the whole defect on the open preimage and nonemptiness of that preimage.

For entire source annuli, the extra term in this limit difference is the difference of their two normalized omitted volumes. A separate vanishing of those omitted volumes suffices to read equality from entire source annuli. An absolute physical \(o(1)\) volume bound does not control the required \(\rho_i^{-4}\)-normalized volumes.

On any finite band the weak product rule gives
\(\Delta_h f_\alpha=dV_h+(r-\alpha)\Delta_h r\), where \(\Delta_h r\) is a signed measure locally by multiplying the equation for \(f_\alpha\) by \(1/(r-\alpha)\). Consequently
\[
 4\,dV_h-\Delta_h(r^2/2)
  = \frac{r}{r-\alpha}\mu_\alpha
    -\frac{3\alpha}{r-\alpha}\,dV_h .
\]
In particular for \(\alpha>0\) the unshifted defect is strictly negative on the equality band even when the shifted defect vanishes there. A proper comparison all the way down to \(0\) allows the argument with \(\alpha=0\). As a limited geometric test of the shift, the rooted warped metric in E56c has exact distance \(r=t\) and is Euclidean with Euclidean radius \(t-c\) on the protected band. There \(\Delta_h(r^2/2)=1+3r/(r-c)>4\) and its shifted area ratio is strictly decreasing. This confirms that flatness and two-sided Euclidean volume bounds on a finite band do not give the equality test. The warped metric has a separate curved core and supplies no claims about the quantitative source budget or minimizing sequence.

## Complete spherical cut and same-source costs

Flat interior regularity on the equality region makes \(s=r-\alpha\) smooth. For \(f_\alpha=s^2/2\), eikonal and Bochner give \(|df_\alpha|^2=2f_\alpha\) and \(|\nabla^2f_\alpha|^2=4\). Equality in the symmetric tensor trace inequality yields \(\nabla^2 f_\alpha=h\). Its radial gradient has unit-speed flow across every closed interval buffered inside \((t_0-\alpha,t_2-\alpha)\), by properness on the full preimage and relative closedness of each component. A component meeting any level therefore meets every level in the band and is the exact flat cone over a compact connected orientable link. The link with its unit-radius metric has sectional curvature one and is a free finite round quotient of \(S^3\).

One compact source embedding includes that entire link and a radial buffer around \(1/8\le s\le L\). With the given uniform physical distance convergence the image remains in one positive-distance rescaled strip with vanishing full curvature integral. Lifting to the finite quotient cover preserves uniform and strong \(W^{1,4}\) convergence and gives the fixed Euclidean splice estimate; its error descends to the actual quotient cylinder by equivariance. Near \(s=1\) the factor \((\rho_i s)^{-2}\) then gives the exact unit round quotient product on the oriented original type. The modified source has \(E_+\le e_i+o(1)<9\pi^2\), meeting the inherited smooth quotient-link test. That test gives the full sphere.

The unmodified spherical comparison chart meets the fixed width test with ellipticity \(H=2\) and anchor \(A_0=2\), because its seam has physical distance \((1+\alpha+o(1))\rho_i\) from \(x_i\), with \(\alpha=1/16\). The chosen \(L\) still meets both inequalities. The existing argument places the entire smaller quantile ball and the entire median exterior on opposite sides of the sphere and off the entire closed trim. In particular it applies to the whole exterior even when the distance level or exterior is disconnected. Both cap allowances are \(o(1)\) on the actual side supports. At late indices the joined upper bound is strictly below \(8\pi^2\), and the minimizing excess plus the larger cap error is strictly below \(4\pi^2\theta\). The two raw side charges are at least \(\theta e_i\), which gives the inherited nonsplitting contradiction. [Anchored-width and first-order cap argument](../manuscript/anchored_physical_shell.tex) · [Master marked cut bounds](../../../../../master/manuscript/variational_comparison.tex)
