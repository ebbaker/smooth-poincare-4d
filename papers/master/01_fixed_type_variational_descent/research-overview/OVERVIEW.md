# Research overview

## Current geometric witnesses · 25 November 2026

The original marked disk carries a quantitative first- and second-variation test. On a vanishing-deficit sequence the modified ball-volume bound locates concentrated Ricci energy and a positive-time flow with a nonzero negative Euler trace. That flow has no smooth complete initial limit in the fixed markings. The exact overlap disk and the round exit give separate comparisons on their own source metrics. [Assessment and source generations](../../research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md)

## Current marked and exact alternatives

The [disk enlargement](../manuscript/balanced_exterior.tex) controls the full raw residual in four measures. Its new boundary lacks the original small-ball chart estimates. The [connector flux](../manuscript/connected_repair.tex) limits transfer of chiral excess. At vanishing deficit the [modified shrinking-limit proof](../manuscript/ricci_concentration.tex) excludes a complete marked bubble with positive Ricci charge. The [exact-class theorem](../manuscript/exact_spectral_gap.tex) separates this regime from positive exact closed classes on nonstandard types.

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. E35c requested GPT-6.2 Sol/ultra for setup. Independent serving telemetry is unavailable. This overview identifies inherited results and planned comparisons.

## Uniform recognition and charged disks

There is a universal $\eta>0$ such that a smooth homotopy four-sphere is standard if the infimum of $4e+3\int L^2dV$ over its positive Yamabe classes is at most $8T+\eta$. Here $e=E_+=E_-$, $T=4\pi^2$, and $L$ is the larger top eigenvalue of the two Weyl blocks. This also gives the inclusive recognition gap for $I^+(M)$. For every surviving $I^+(M)<2T$, a subsequence has a positive-Ricci comparison scale with absolutely continuous chiral mass in the original conformal measures. One marked disk carries positive mass of the same sign on both complete sides, and its bicollar can have arbitrarily small incoming full curvature relative to its core charge. Its normalized chart and its repair cost remain to be controlled. [Spectral scale](../manuscript/spectral_windows.tex) · [Isotropic curvature test](../manuscript/isotropic_gap.tex)

## Fixed variational problem

Let \(M\) be a closed connected oriented smooth homotopy four-sphere with smooth positive-definite Riemannian metrics. Assume one positive-Yamabe class on \(M\) with \(E_+<8\pi^2\). Define
$$
E_\pm(g;U)=\int_U |W_g^\pm|_{\mathrm{HS}}^2\,dV_g,
\qquad I=I^+(M)=\inf\{E_+(g;M):g\text{ smooth on }M,\ Y([g])>0\}.
$$
Here \(W^\pm\) are the real Weyl endomorphisms on \(\Lambda^\pm\) for the chosen orientation. The two total chiral energies agree by signature on \(M\), and their local measures are conformally invariant. Their sum is one quarter of the full four-index tensor Weyl integral. The local two chiral energies may differ. On a hypothetical nonstandard \(M\) with a positive class, the uniform gap gives \(I>T+\varepsilon_*\). Universal construction of the entry class belongs to the master program. [Master conventions and recognition](../../research-overview/OVERVIEW.md#the-variational-problem-on-a-fixed-smooth-type)

Use a single subsequence of smooth volume-one Yamabe metrics \(g_i\) with \(e_i=E_+(g_i;M)\to I\) and \(e_i\le8\pi^2-\delta\) for a fixed \(\delta>0\). In this physical gauge \(R_{g_i}=Y_i\ge\sqrt{48\delta}\). Set \(\mu_i=dV_{g_i}\), \(\lambda_i=|W_{g_i}^+|_{\mathrm{HS}}^2dV_{g_i}\) and \(\nu_i=|\operatorname{Rm}_{g_i}|_{\mathrm{tens}}^2dV_{g_i}\). The inherited bound gives \(4\lambda_i\le\nu_i\) and a uniform bound for \(\nu_i(M)\). Write \(r_i\) for the least physical radius at which some ball carries half of \(e_i\). The diffuse alternative supplied by the master is
$$
\lim_{b\downarrow0}\limsup_i\sup_{x\in M}
\frac{\lambda_i(B_{g_i}(x,b r_i))}{e_i}=0 .
$$
Its limit order matters. It gives vanishing chiral mass for a bounded family at radii \(o(r_i)\). The positive-Ricci half-volume gauge separately supplies a location and measure for joint selection. Any transfer between that gauge and \(B_{g_i}(x,b r_i)\) needs proof. A smooth complete physical limit with the whole markings and first-order convergence in the owning theorem is flat at minimizing energy. Extracting such a limit on arbitrary charged windows remains open. [Physical energy radius and complete limits](../../manuscript/complete_limits.tex)

## Diffuse comparison and its residual

The joint selection in E03 yields finite disjoint marked disks, a joint physical-volume and chiral-mass bound at a fixed tolerance, and a strict full-curvature tolerance per disk. In the positive-Ricci distance let \(X\) be the pointed limit, \(\lambda,\nu\) the local weak limits of the positive chiral and full curvature source measures, and \(\mathcal R\) its four-dimensional Euclidean regular set. At fixed \(\zeta>0\) let \(G_\zeta=\{x\in\mathcal R:\nu(\{x\})<\zeta\}\). For the marked union \(A_i\) selected at tolerance \(\varepsilon>0\), the inherited complement estimate is
$$
\limsup_i\lambda_i(M\setminus A_i)
\le (I-\lambda(X))+\lambda(X\setminus\mathcal R)
+\lambda\bigl(\{x\in\mathcal R:\nu(\{x\})\ge\zeta\}\bigr)+\varepsilon.
$$
The terms account for escape, nonregular mass, excluded atoms and selection error. As \(\zeta\downarrow0\) the selection can cover diffuse eligible mass and still exclude positive atomic chiral mass. The limit defining escape takes \(i\to\infty\) on continuity windows first, then exhausts \(X\). Fix the tolerances, window, marked disks, collars and finite cardinality before taking the source limit. Allow the family to change at a subsequent tolerance only with new aggregate bounds. A slow diagonal requires a source threshold at every fixed stage. [Joint-selection derivation and physical complement](../../notes/E03_JOINT_SELECTION.md)

E17 computes that controlled small boundary-fixed fillings of smooth normal disks pay the incoming leading-order chiral energy. A radial flat core raises the leading cost when the corresponding incoming Weyl block is nonzero. This scopes the obstruction to the tested scaled jets and matching. General fillings, coupled marked regions and weak diffuse measures are open. A marked disk obtained from joint selection may lack the metric-jet control that the calculation uses. Exact exterior retention also fixes the local \(E_+-E_-\) imbalance on the changed region by closed signature. [Diffuse normal-disk test](../../notes/E17_DIFFUSE_REPAIR.md) · [Single-disk exterior constraint](../../notes/E03_JOINT_SELECTION.md#what-an-exterior-retaining-repair-costs)

The proposed comparison uses several marked disks, the actual intervening geometry, all matching strips and the remaining exterior. For one candidate metric \(k_i\), let \(D_i\subset M\) include the selected disks and every added transition or connector. The signed gain is
$$
e_i-E_+(k_i;M)=
\lambda_i(D_i)-E_+(k_i;D_i)+
\lambda_i(M\setminus D_i)-E_+(k_i;M\setminus D_i).
$$
An exactly conformally retained exterior has zero contribution to this difference, while its physical source mass remains in any coverage or exhaustion claim. A modified exterior needs its own signed cost estimate. Count overlaps once and charge both interfaces of every changed region. A gain greater than \(e_i-I\) at an actual source index suffices, for example a positive limiting lower bound on the gain along the same subsequence. The endpoint must be a smooth metric in a positive class on the original oriented smooth type. It can use a proved positive conformal-Laplacian sign or the inherited same-type path below \(8\pi^2\), with the path height controlled throughout. A whole-base candidate obtained by cutting must also prove the marked smooth identification with \(M\). [Zero-Yamabe wall and whole marked base](../../manuscript/variational_comparison.tex)

## Smooth attainment and round restarts

A bounded subsequence of the physical \(L^p\) norm of trace-free Ricci for one fixed finite \(p>2\) yields smooth same-type attainment under the master's sequence hypotheses. A whole marked nonround base also yields attainment under the first-order comparison and curvature or scalar hypotheses in the master. At a smooth minimizer the Bach tensor vanishes and the Hessian is nonnegative. On a hypothetical nonstandard type the attained energy lies in \((T,8\pi^2-\delta]\). E20 gives a signed Ricci-direction Hessian with no general negative sign, and E05 treats an Einstein subclass. Choose one reachable closed class, then seek rigidity or a negative direction transverse to conformal and diffeomorphism variations, with a justified positive same-type path. The separate immersion criterion applies when the conformal class is induced by a smooth Euclidean hypersurface immersion. [Physical Ricci theorem](../../manuscript/ricci_scales.tex) · [Closed Hessian](../../notes/E20_CLOSED_VARIATION.md) · [Einstein test](../../notes/E05_CLOSED_STABILITY.md) · [Immersed recognition](../../manuscript/immersion_entry.tex)

With a supplied whole marked round base and the inherited hypotheses, one actual exterior can carry the entire limiting chiral energy. Its positive cap on the original type can preserve \(I\) in the limit. Preserve the signs of the full cap surcharge \(\sigma_i=E_+(c_i;M)-\lambda_i(V_i)\) and the remaining mass \(e_i-\lambda_i(V_i)\) for the actual raw exterior \(V_i\), including both splices. The difference \(E_+(c_i;M)-e_i=\sigma_i-(e_i-\lambda_i(V_i))\) has no strict sign from two separate vanishing estimates. E21 records an exactly repeatable evacuated conformal disk graft, with identical Yamabe value and chiral measures available on each source. It also distinguishes a physically saturated round base from an evacuated one. A decreasing quantity must detect a physically charged region and survive changes of marking. To deduce termination one needs a lower bound together with a uniform decrement, finite integer complexity, or another proved exclusion of infinite descent. Equal limiting energy, a limiting Yamabe extremum, or a shrinking diameter provides no such criterion by itself. [Round restart and exact graft](../../notes/E21_ROUND_RESTART.md)

## Ownership and versioned inputs

Setup used repository commit 2689540e6dae1656b7f5ad4be52504db044995f2. The linked analytical sources, prior reviews, primary reference records and upstream handoffs are at that commit. Two working inputs fix the editorial scope.

| Input | SHA-256 |
| --- | --- |
| [Approved placement proposal](../../brainstorm/notes/PARALLEL_INVESTIGATION_PROPOSAL_20261125.md) | c9ee3eb7ee8755ea76fac852f24899e6858383acc08d59de24e9e183b480721c |
| [E35c frozen setup request, revision 1](../../research-progress/handoffs/E35_PARALLEL_SETUP_20261125.md) | 5792fe933cc3e86067db05bc1fae468aac41449bdcf68c7b991955e0be71654a |

The [variational returns](../../research-progress/handoffs/VARIATIONAL_RETURNS_20261125.md) and [Ricci and immersion returns](../../research-progress/handoffs/RICCI_AND_IMMERSION_RETURNS_20261125.md) supply the assessed evidence. The [neck geometry owner](../../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/README.md) supplies any later whole physical shell with both charged sets marked. [Formalization Route 05](../../../../formalization/investigations/05_variational_comparison/README.md) keeps its own scope and receipts. If a comparison uses an almost-critical selection, the [Bach flow owner](../../../investigations-1/02_bach_flow/README.md) must supply actual minimizing slices in the stipulated norm. The inherited local variational limit theorem uses the minimizing property and its own marking and regularity hypotheses. [Selection and norm test](../../notes/E07_BACH_SELECTION.md)
