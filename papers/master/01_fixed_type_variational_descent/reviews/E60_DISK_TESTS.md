# E60r1 · Disk capacity and local signature checks

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and effort are unavailable. This is an independent analytical check of two fixed derivations and the subsequent E61 selection argument. The frozen repository input is `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`. The checked branch inputs are the [E58 spectral-median argument](E58_BAND_CHARGE.md), [simultaneous removal theorem](../manuscript/fixed_type_chiral_energy_descent.tex), [collar estimate](../manuscript/disk_collar_comparison.tex), and [disk selection](../../manuscript/physical_volume.tex).

## Auxiliary volume and nested annuli

Fix one source index. Let \(g\) be the smooth volume-one positive Yamabe metric on the oriented, closed smooth homotopy four-sphere \(M\), and let \(q\) be the actual volume-one \(C^{2,\alpha}\) modified Yamabe representative. Write \(Y=Y([g])\), \(\mu=dV_q\), \(L=\max_\pm\lambda_{\max}(W_q^\pm)\), \(\sigma=L^2\mu\), and \(\ell^2=\sigma(M)\). The nonstandard-type premise gives \(R_q=6L+c\) with \(c\le 0\). The modified quotient, constant representative, and sign use Chen–Zhu Lemma 2.1 and Theorem 1.7 in the published version. Yamabe covariance for \(q\) follows from the conformal-Laplacian transformation and the given regularity. [Chen–Zhu published text](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf) · [Lee–Parker §2, (2.7)](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf) · [E54 regularity and sign check](../../reviews/E54_SPECTRAL_ENDPOINT.md)

Normalize the smooth positive-Ricci \(k\in[g]\) by the \(\sigma\)-median radius. Assume \(Y-6\ell/\sqrt{2}\ge\kappa>0\). Every comparison ball of radius at most one has \(\sigma\)-mass at most \(\ell^2/2\). Thus, for an \(H^1\) cutoff \(f\) zero almost everywhere off such a ball, Yamabe and Hölder give
\[
 \kappa\|f\|_{4,q}^2\le 6\int |df|_q^2\,d\mu.
\tag{1}
\]
The estimate uses the nonzero set of \(f\), so a cutoff vanishing on the boundary is admissible. The finite-source lower spectral floor is the E58 hypothesis. A uniform floor follows automatically after discarding finitely many indices if \(I<4T/3\), where \(T=4\pi^2\).

For a core \(D_j\), suppose \(N_j\ge1\) exterior spherical annuli \(A_{j,n}\) are nested in order, with disjoint interiors, separating the core from the outside of the outermost face. Assume the whole region through the outermost face is contained in a radius-at-most-one comparison ball. Take smooth markings from Euclidean annuli of log-width \(b_{j,n}>0\), with their faces extending smoothly, and assume the determinant-one metric in each marking has smallest eigenvalue at least \(\Lambda^{-1}\). For a unit drop across a marked layer the log-radial function \(f_{j,n}\) has fourth-power Dirichlet integral
\[
 \int_{A_{j,n}} |df_{j,n}|_q^4\,d\mu
  =\int_{A_{j,n}} |df_{j,n}|_k^4\,dV_k
  \le 2\pi^2\Lambda^2 b_{j,n}^{-3}.
\]
The equality is four-dimensional conformal invariance. In determinant-one coordinates the volume is Euclidean and the inverse metric on covectors is bounded by \(\Lambda\). The radial integral is \(\int r^{-1}dr=b_{j,n}\). In particular use \(K=2\pi^2\Lambda^2\) when every log-width is one. A common positive lower bound on log-width gives a common \(K\).

Construct a single cutoff that is one on the core, drops by \(1/N_j\) through each layer, is constant in the gaps, and is zero outside the outermost face. It is continuous and piecewise smooth with weak gradient in the layers, and its fourth-power energy is at most \(K/N_j^3\). Let \(A_j=\bigcup_n A_{j,n}\). Hölder on the union of the layers and (1) give
\[
 \kappa\mu(D_j)^{1/2}\le 6(K/N_j^3)^{1/2}\mu(A_j)^{1/2},\qquad
 \sum_j N_j^3\mu(D_j)\le \frac{36K}{\kappa^2}\sum_j\mu(A_j).
\tag{2}
\]
The final sum includes multiplicity. If the stacks avoid the other cores and are disjoint across \(j\), the right side is at most \((36K/\kappa^2)d\), where \(d=\mu(M\setminus U)\) and \(U=\bigcup_jD_j\). A multiplicity bound \(m\) gives the corresponding bound with \(md\). At fixed \(K,\kappa,m\), covering almost all auxiliary volume on a diagonal with even one such layer per core is impossible. If \(N_j\ge N\) for every core, one needs \(d\ge\kappa^2 N^3/(36Km+\kappa^2N^3)\). The disjoint transferred inner comparison balls in the disk selection suffice for disjointness if the annuli and their cutoffs stay inside those balls.

For nonnegative weights \(p_j\), (2) gives
\[
 \sum_j p_j\mu(D_j)\le \frac{36K}{\kappa^2}
       \int_{M\setminus U}\sum_j\frac{p_j}{N_j^3}\mathbf 1_{A_j}\,d\mu.
\tag{3}
\]
For any subfamily with these protected stacks and fixed \(K,\kappa,m\), it follows that its \(L\)-first moment is at most \(\ell(36Kmd/(\kappa^2N^3))^{1/2}\). Its \(L^2\) mass needs a separate estimate. Equations (2)–(3) bound a geometrically controlled family's auxiliary volume. The collar theorem still needs the differentiated coordinate residual and the actual one-sided Weyl costs in the chosen seam charts.

### Application to the E59a candidate rings

The [E59a packet](../notes/E59_CHARGED_DISKS.md) uses log-width two and \(\Lambda=e^a\), giving its constant \(K_i(a)=9\pi^2 e^{2a}/\kappa_i^2\) in (2) with the factor \(36/\kappa_i^2\) already included. Its curvature ceiling bounds the sum of the raw physical terms \(w_{j\ell}^2\) on disjoint rings. Its improvement to the collar density allowance also checks. The integration-by-parts bounds on \(Z=\|\chi Dh\|_2\) and \(J=\|\chi Dh\|_4^2\) give \(Z\le C(\sqrt{dX}+d)\) and \(J\le Ca(X+d)\), where \(X=\|\chi^2D^2h\|_2\) and \(d=\|h\|_2\) in the normalized chart. The elliptic estimate absorbs \(CaX\) at small universal \(a\), yielding \(X\le Cb\). In the density difference, smooth principal-coefficient changes and all derivatives of the interpolation cutoff carry a factor \(s\). This gives \(s C(ab+\sqrt{db}+d)\). The norm of the leading density plus the linear error bound is a nonnegative convex function of \(s\), so its square is bounded by the larger endpoint square. The signed surcharges (6) of E59a follow, including an exterior surcharge that can be negative. One may apply that estimate on each patch before choosing its sign in (4).

For \(v_j=\mu(C_j)\) on the protected cores and \(d_C=1-\sum_jv_j>0\), combine the capacity bound with E59a's \(\Gamma=2\sum_j\mathcal D_j/N_j\). Hölder gives
\[
 \sum_j\mathcal D_j^{3/4}v_j^{1/4}
 \le (\Gamma/2)^{3/4}\left(\sum_j N_j^3v_j\right)^{1/4},\qquad
 \Gamma\ge 2\frac{(\sum_j\mathcal D_j^{3/4}v_j^{1/4})^{4/3}}
                    {(K_i(a)d_C)^{1/3}}.
\]
This is a lower bound on the certified error formula for the averaging argument. Individual measured allowances or actual signed surcharges may be smaller. With \(p=\mu(\bigcup_j C_j)\), the E59a first-moment lower bound \(Q_i(p)\) for joint charge also certifies \(Q_i(p)/2\) for the maximum-per-disk charge in (5). The numerical guarantee \(Q_i(p)/2\) is bounded above by \(e_i p\) and vanishes unless \(p>1-(Y_i/(6\ell_i))^2\). Independently the actual measured mixed charge on the cores is bounded below by \(Y_i^2/48-\epsilon-\Delta_*\), where
\[
 \Delta_*=\sum_j\max_\pm\lambda_i^\pm(D_{ij}\setminus C_j).
\]
Here an omitted core is empty. This follows by choosing the better sign on the original disk, subtracting its loss, and taking the maximum on the smaller core. Any chosen seam encloses that core. This replacement of the right side of E59a's descent test retains the exact same cost and positivity requirements.

## Patchwise signature, joined height, and retained energy

Return to smooth physical metrics for the repairs. Use disjoint patches \(V_j\), each containing the raw disk \(D_j\), its changed exterior strip, and the complete support of the local change. Denote the raw disk energies by \(d_j^\pm=\lambda^\pm(D_j)\) in the Weyl-operator Hilbert–Schmidt norm. If the disk-side product is stretched or the disk is filled, its parametrized marking identifies the final piece with the original oriented disk and agrees with the retained collar. This is the compatibility used in the removal theorem. It is witnessed explicitly by the angular parametrization from the original disk, a smooth radial change close to the protected boundary, and the cap coordinate \(r=\exp(-s)\). The radial coordinate preserves the indicated orientation after assigning its outward direction at the disk boundary. The local product and final point compactification stay in the patch. A prescribed angular boundary identification without this compatibility would need its own smooth extension argument.

At every parameter of the joined path apply just the \(j\)-th change to \(g\) on the original closed oriented \(M\). The equality of the two total energy increments follows from the closed signature formula and carries over to the changed patch because each outside chiral measure is unchanged. This also applies to finite stretches and the final cap, by the same single-patch operation. Yamabe positivity of the isolated modification is unnecessary for this identity. Hirzebruch §4, (16) supplies the four-dimensional signature invariant. The operator convention and the Weyl form of this invariant are those of the [branch manuscript](../manuscript/fixed_type_chiral_energy_descent.tex). [Hirzebruch, primary text](https://hirzebruch.mpim-bonn.mpg.de/id/eprint/84/1/signature%20theorem.pdf)

Write \(s_j^\pm\) for the two raw full-collar energies and \(s_{j,\mathrm{out}}^\pm\) for the raw exterior-half energies. If the certified density-error bounds in \(L^2\) are \(\eta_j^\pm\) and \(\eta_{j,\mathrm{out}}^\pm\), respectively, put
\[
 P_j^\pm=2\sqrt{s_j^\pm}\,\eta_j^\pm+(\eta_j^\pm)^2,
 \qquad G_j^\pm=2\sqrt{s_{j,\mathrm{out}}^\pm}\,\eta_{j,\mathrm{out}}^\pm
                         +(\eta_{j,\mathrm{out}}^\pm)^2.
\]
The Weyl leading multipliers have absolute value at most one. The triangle inequality on the appropriate collar halves gives signed increments bounded above by these nonnegative expressions. By the patch identity the joined increment is at most \(\min(P_j^+,P_j^-)\), uniformly in the path parameter. A sufficient positivity budget is \(e+\sum_j\min(P_j^+,P_j^-)<2T\). The earlier global joined-path budget can also be used. The inherited wall and product compactification then supply a positive simultaneous endpoint on the same type. A joined bound from the actual sum of signed increments alone need not bound the joined height for a single patch in isolation.

After capping let \(o_j^\pm\) be the actual signed change on the exterior half. The fill is conformally flat, so the actual patch gain \(a_j\) satisfies
\[
 a_j=d_j^+-o_j^+=d_j^--o_j^-\ge\max\{d_j^+-G_j^+,d_j^--G_j^-\}.
\tag{4}
\]
In particular, choosing the larger-charge sign \(\varsigma_j\) separately on each disk proves \(a_j\ge\max(d_j^+,d_j^-)-G_j^{\varsigma_j}\). The charge uses the entire raw disk, including its original inner collar. The final cost uses only the exterior strip. This is a common gain for either global chirality and uses the original orientation in every patch. The imbalance forces an exterior contribution through \(o_j^+-o_j^-=d_j^+-d_j^-\) and \(o_j^-\ge-s_{j,\mathrm{out}}^-\). The comparison still requires a measured exterior cost for the selected sign.

For the E58 family the total maximum-per-disk charge \(Q_*=\sum_j\max(d_j^+,d_j^-)\) obeys
\[
 Q_*\ge\tfrac12(\lambda^++\lambda^-)(U)\ge\tfrac34\sigma(U)
 \ge\tfrac34(Y/6-\ell\sqrt d)_+^2\ge Y^2/48-\epsilon,
\tag{5}
\]
where the source-uniform volume tolerance \(d\) is chosen first at fixed \(\epsilon\). The spectral coefficient follows from the trace-free symmetric Weyl block: the squares of the two eigenvalues other than its largest eigenvalue \(l\) sum to at least \(l^2/2\). The last two estimates use the constant test in the ordinary Yamabe quotient and Cauchy–Schwarz in \(q\). More explicitly, writing \(v_j=\mu(D_j)\) and \(u_j=\int_{D_j}L\,d\mu\), one has \(\max(d_j^+,d_j^-)\ge3u_j^2/(4v_j)\). Zero-volume summands are assigned zero. Summing and applying Cauchy–Schwarz yields the same bound.

Gauss–Bonnet in \(g\) gives \(Y^2/48=2T-e+\|\operatorname{Ric}_{0,g}\|_2^2/4\). Thus, with \(G_* =\sum_j G_j^{\varsigma_j}\), the endpoint bound is \(E_+(k)\le 2(e-T)-\|\operatorname{Ric}_{0,g}\|_2^2/4+\epsilon+G_*\). The sufficient strict comparison with the infimum is \(Q_*-G_*>e-I\). The sufficient comparison with \(T\) is \(Q_*-G_*\ge e-T\). In the zero-cost limit the latter has positive margin for \(I<3T/2\) on any subsequence that supplies (5), including the entire E58 automatic band \(I<4T/3\). Beyond \(4T/3\) E58 itself requires the spectral floor. The E61 check below removes that selection restriction. For strictly descending below \(I\), a fixed positive charge-minus-cost margin is sufficient across the full subcritical band once the marked repairs are supplied. The quantity \(e-Q_*\) is a numerical comparator assembled from patchwise gains. An actual raw complement for a single chirality is \(e-\sum_jd_j^\pm\). [Chang–Gursky–Yang, (0.4) and norm conventions](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf)

## E61 · Independent check of masked spectral selection

The inputs here are the preceding smooth physical minimizing sequence, the actual volume-one \(q_i\), \(e_i\le2T-\delta_0\), \(Y_i\ge Y_0=\sqrt{48\delta_0}>0\), and a smooth positive-Ricci \(k_i\in[g_i]\). Write \(\mu_i=dV_{q_i}\), \(\sigma_i=L_i^2\mu_i\), and \(\ell_i^2=\sigma_i(M)\). Fix \(0<\beta<(Y_0/6)^2\) and use \(\kappa_0=Y_0-6\sqrt\beta>0\). Begin with \(h_i=1\). At each finite stage maintain \(0\le h_i\le1\), \(\int h_i^4d\mu_i\to1\), and \(\|dh_i\|_{4,q_i}\to0\). Masks can be Lipschitz. If \(\sigma_i(\{h_i>0\})\le\beta\) at infinitely many indices, the Yamabe test on \(h_i\) yields \(\kappa_0\|h_i\|_{4,q_i}^2\le6\|dh_i\|_{2,q_i}^2=o(1)\), which contradicts the mass invariant. Thus the residual eventually exceeds \(\beta\). All restrictions of \(\sigma_i\) used here are absolutely continuous and give distance spheres zero mass. Compactness of the center domain and continuity in center and radius give an attaining least \(\beta\)-radius. Rescale \(k_i\) so this radius is one and take an attaining center \(p_i\). Every unit ball in this frame has residual spectral mass at most \(\beta\).

If every bounded pointed window has \(\limsup_i\int_{B_R(p_i)}h_i^4d\mu_i=0\), choose \(R_i\to\infty\) slowly so the same mass in \(B_{R_i^2}(p_i)\) tends to zero. Multiply \(h_i\) by a Lipschitz cutoff equal to zero through radius \(R_i\), rising linearly in log-radius to one by \(R_i^2\). Bishop–Gromov and radial coarea give fourth-power gradient energy \(O((\log R_i)^{-3})\) in the comparison metric. Conformal invariance and the product rule give the mask gradient invariant after the cut. The mask loses \(o(1)\) weighted volume and at least \(\beta\) residual spectral mass, because it kills the entire original residual measure inside the attaining unit ball. The process stops after finitely many removals by the uniform upper bound \(\ell_i^2\le4e_i/3\) and the impossibility of residual mass at most \(\beta\) eventually. In the surviving frame pass to a subsequence with weighted mass uniformly positive in a fixed pointed ball. This choice and the number of removal stages precede all selected disk tolerances.

For any cutoff \(\chi\) in a unit ball use \(f=h_i\chi\) in Yamabe. Its nonzero set meets only the residual spectral measure there, so
\[
 \kappa_0\|h_i\chi\|_{4,q_i}^2
 \le6\|d(h_i\chi)\|_{2,q_i}^2,
 \qquad
 \|d(h_i\chi)\|_{2,q_i}\le \|dh_i\|_{2,q_i}+\|h_i d\chi\|_{2,q_i}.
\tag{6}
\]
Inward log cutoffs from radius one to radius \(r\) give a uniform bound \(C(\log(1/r))^{-3/2}+o(1)\) on the square root of \(\int_{B_r(x)}h_i^4d\mu_i\), with the error tending to zero at fixed \(r\). The error from \(dh_i\) tends to zero since \(\mu_i(M)=1\). This proves that every pointed weak weighted-volume limit is nonatomic. To obtain comparison noncollapse, pack the fixed positive-mass ball into a bounded number of quarter-balls using relative volume comparison. One quarter-ball has positive weighted mass bounded below. Apply (6) there with a linear cutoff supported in its half-ball, so \(\|h_i d\chi\|_{2,q_i}\le\|d\chi\|_{4,q_i}\le C\operatorname{Vol}_{k_i}(B_{1/2})^{1/4}\). This gives a positive comparison-volume bound in a bounded pointed window and, by relative volume comparison, noncollapse on every fixed pointed window.

Take one pointed noncollapsed limit, with local weak limits for \(h_i^4\mu_i\), the **original** \(\sigma_i\), and the physical full-curvature measures. The original \(q_i=w_i^2k_i\) obey \(-\Delta_{k_i}w_i\le L_iw_i^2w_i\) with the potential's local squared \(L^2(k_i)\) norm equal to the original \(\sigma_i\) mass. Away from atoms of its weak limit the E58 Moser step gives local \(L^8(k_i)\) control of \(w_i\) and a local \(L^2\) bound on the weighted densities by \(h_i\le1\). The weighted volume limit is therefore absolutely continuous there, and its nonatomicity handles the countable remaining atoms. The curvature atoms also have zero weighted-volume measure. Apply the existing regular-point ball selection and smooth disk embeddings to this weighted limit inside a fixed continuity window. This supplies fixed finite disjoint disks with any given strict physical curvature ceiling, prescribed maximum comparison radius, and arbitrarily small omitted source weighted volume within the window, at all sufficiently large indices. Weak transfer uses the shrunken inner comparison balls contained in the disks. [E58, Moser and volume transfer](E58_BAND_CHARGE.md#absolute-continuous-auxiliary-volume-and-marked-disks) · [Smooth embedding and measured selection](../../manuscript/physical_volume.tex)

Let \(\chi_R\) be the outward log cutoff equal to one on \(B_R(p_i)\) and zero beyond \(B_{R^2}(p_i)\). Choose \(R\) greater than the positive-mass radius in the surviving frame. Then \(f_i=h_i\chi_R\) has \(\|f_i\|_{4,q_i}^2\) bounded below uniformly independently of larger \(R\). Its gradient error is made arbitrarily small by choosing \(R\) first and then taking \(i\) large. In a continuity window containing \(B_{R^2}\), select the disks so that \(\int_{M\setminus U_i}f_i^4d\mu_i\le d\). Here \(d\) is arbitrary and fixed before the source limit. The ordinary Yamabe inequality and two Hölder bounds, one on the disks and one on their complement, give
\[
 Y_i\|f_i\|_{4,q_i}^2\le6\|df_i\|_{2,q_i}^2
  +6\sqrt{\sigma_i(U_i)}\|f_i\|_{4,q_i}^2+6\ell_i\sqrt d.
\]
The small errors can therefore be divided by the positive lower bound to obtain \(\sigma_i(U_i)\ge Y_i^2/36-\epsilon\) at any fixed tolerance, with the tolerance adjusted using the uniform upper bound on \(Y_i\). Weighted-volume capture on the support of the outer cutoff suffices, even if some mass leaves every bounded window. The trace-free spectral bound yields both \(\lambda_i^\pm(U_i)\ge Y_i^2/24-e_i-\epsilon\) and \(Q_{*,i}\ge Y_i^2/48-\epsilon\), with tolerances adjusted before selection. The second is uniformly positive at small enough tolerance for every \(I<2T\). All disk radii and cardinalities are fixed per tolerance on one surviving subsequence. The marked repairs and measured costs remain separate geometric premises.

### Absolutely continuous spectral charge and one marked disk

In the surviving frame take \(Y_i\to Y_\infty\) and extract local weak limits \(\theta,\alpha,\sigma,\lambda^\pm,\nu\) of \(h_i^4\mu_i,L_i h_i^2\mu_i,\sigma_i,\lambda_i^\pm,\nu_i\) on the same subsequence. The masses are bounded, including the bound \(\alpha_i(M)\le\ell_i\) by Cauchy–Schwarz. With \(m=\mathcal H^4\), the argument above gives \(\theta\ll m\) and \(v=\theta(X)>0\). The matrix with diagonal measures \(\theta,\sigma\) and off-diagonal \(\alpha\) is positive semidefinite as a measure. Indeed for each pair of real constants the corresponding quadratic measure is the weak limit of the nonnegative measure with density \((u h_i^2+w L_i)^2\) relative to \(\mu_i\). Taking its densities relative to \(\theta+\sigma\) and a countable dense set of \((u,w)\) gives a positive semidefinite matrix almost everywhere. Hence \(\alpha\ll\theta\) and \(\sigma\ge (d\alpha/d\theta)^2\theta\). Since \(	heta\ll m\), the absolutely continuous spectral measure \(\sigma_{\mathrm{ac}}\) relative to \(m\) dominates this last measure.

Test Yamabe on \(h_i\chi_R\) first at fixed \(R\). Convergence of the distance functions on compact comparison windows and weak measure convergence give the limits \(\int\chi_R^4d\theta\) for the fourth-power test mass and \(\int\chi_R^2d\alpha\) for the potential term. After the source limit, the gradient term vanishes as \(R\) increases. Finiteness of the measures gives \(Y_\infty\sqrt v\le6\alpha(X)\). Therefore Cauchy–Schwarz gives
\[
 \sigma_{\mathrm{ac}}(X)\ge\int (d\alpha/d\theta)^2d\theta
  \ge\alpha(X)^2/v\ge Y_\infty^2/36.
\]
The local weak spectral inequality \(\lambda^++\lambda^-\ge3\sigma/2\) then gives positive absolutely continuous charge for at least one chirality. This result uses only the surviving frame's mass \(v\) and applies if \(v<1\).

Choose a Euclidean regular differentiation point of both chiral measures with positive finite density for one sign, finite density for the other, and zero atomic mass of the physical curvature measure. Such points have positive \(m\)-measure. At such a point, differentiation with respect to the locally doubling \(m\) gives the density of the whole Radon measure, since its singular part has density zero almost everywhere. Choose a small fixed shrink \(1-3\tau\), then a small fixed joint continuity radius \(r\). The total two-sign shell energy between \((1-3\tau)r\) and \(r\) can be made arbitrarily small relative to the positive inner charge of the selected sign. The same choice makes the outer physical full-curvature mass less than any positive ceiling, with a strict buffer for transfer. The radii can also meet the smooth embedding comparison-volume threshold by regularity. After transfer, the preimage of the closed inner ball lies compactly in the open model ball. One can choose three ordered concentric model radii beyond that preimage, using the middle radius for the seam and the inner and outer radii for the bicollar faces. The bicollar then lies in the measured source shell, and the raw disk contains the charged inner ball. Both chiral raw collar charges are small relative to the fixed positive inner charge at sufficiently late indices. Uniform distortion, differentiated coordinate control and a corresponding small certified surcharge in that marking remain open. [Physical smooth-ball construction](../../manuscript/physical_volume.tex)
