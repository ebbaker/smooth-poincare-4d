# E213 — Independent intermittent spectral return audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E audit under B102, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I authored E179, E203 and E205 and audited the gradient extension in E210. I also authored the inherited E177 and E182 notes and the E77 audit. The new occupation estimate and the two sufficiency arguments were checked independently of the E212 author.

## Disposition and exact repair

The occupation estimate and both round-tail implications pass. One sentence in the finite-test paragraph of the frozen E212 note needs correction for integration. It says that the strict finite-slice criterion can hold with finite **total** pinched time. The criterion only uses a finite observation interval. Its conclusion in fact entails infinite total pinched time along the resulting original trajectory. Use “This finite-time test uses only the pinched time accumulated by \(t_n\).” Preserve the frozen note and its conditional status at issuance. The error concerns the interpretation of the finite test and leaves the theorem and proof of that test intact. [Frozen E212 note][e212]

Indeed, the finite test gives smooth convergence to one fixed round pair on the actual bundle. In a fixed smooth background the limiting curvature is positive and perfect. The wedge quotient is continuous in a common positive neighborhood of that limit, so \(Q_{A(t)}\to I\) uniformly. For all sufficiently late times \(\|Q_{A(t)}-I\|_{\mathrm{op}}\le1/4\), which gives \(r(t)\le(1+1/4)/(1-1/4)=5/3<9/4\). Hence \(S\) contains a tail interval of infinite measure. This is a consequence of the round-limit theorem, confined to the qualifying paths.

## Exact discharge of the historical premise

E212 assumed \(H_{\rm grad}\) pending assessment. The frozen E209/E210 lead assessment now supplies it statically for every smooth positive-plane, round-compatible definite \(SO(3)\) connection on a smooth closed connected oriented real four-manifold with \(\sup_M\rho(Q)\le9/4\), including the boundary. Its \(\mathscr D\) uses the native negative-Killing pairing and reconstructed metric for the actual original velocity. Its \(\mathscr G\) uses the same metric on the single covector slot of \(\nabla^AQ\), the Frobenius endomorphism norm and native volume. Its energy is \(\mathcal E=\int_M|Q-I|^2\,dV_{g_A}\). These are precisely the quantities in E212. Set
\[
 \kappa=\frac{32768}{2205225},\quad L_0=81,\quad
 C_0=\frac{11}{32}\left(\frac{2L_0^2}{\kappa}+L_0+\frac{\kappa}{2}\right),
 \qquad
 \gamma=\frac{48}{5(1+4C_0)},\quad\beta=\frac{\kappa}{1+4C_0}.
\]
They are fixed positive native constants, uniform over the stated bases and bundles. The result is a pointwise-in-time static inequality on \(S\), so it applies even at isolated pinched times and supplies \(H_{\rm grad}\) without first assuming a whole pinched interval. [E209/E210 assessment][grad]

## Measurability and weighted energy calculation

Use one supplied smooth original native trajectory \(A(t)\) in the same definite sign class for \(0\le t<T_*\), with the native energy identity \(\mathcal E'=-\mathscr D\). On any compact time slab \(M\times[a,b]\) inside this lifespan, the curvature is smooth and the normalized wedge Gram \(Q(x,t)\) is continuous and positive. In a fixed internal pairing, the min and max Rayleigh quotients of a symmetric endomorphism change by at most the operator norm difference. The continuous least eigenvalue therefore has a strictly positive minimum \(m_{[a,b]}\) on the product. For two times on the slab, using trace three to bound the maximum eigenvalue by \(3\), one obtains
\[
 |\rho(Q(x,s))-\rho(Q(x,t))|
 \le (m_{[a,b]}^{-1}+3m_{[a,b]}^{-2})\,
                \|Q(x,s)-Q(x,t)\|_{\mathrm{op}} .
\]
The right side tends to zero uniformly in \(x\) as \(s\to t\). For bounded functions the difference of their suprema is bounded by their uniform difference, proving continuity of \(r(t)=\sup_M\rho(Q_{A(t)})\), also from the right at zero. Thus \(S=r^{-1}((-\infty,9/4])\) is relatively closed and Borel. The positive minimum here depends on the compact slab. There is no uniform positive floor assumption as \(t\to T_*\). [E212 definition and continuity][e212]

Fix \(0\le t_0\le t\le t_1<T_*\). The time function \(\Theta_{t_0}(t)=\int_{t_0}^t\mathbf 1_S(s)\,ds\) is nondecreasing and \(1\)-Lipschitz by boundedness of the integrand. It is absolutely continuous with derivative \(\mathbf 1_S\) almost everywhere. On \(S\), the static inequality gives \(-\mathscr D+\gamma\mathcal E+\beta\mathscr G\le0\). Off \(S\), \(-\mathscr D\le0\). All three smooth-trajectory quantities are finite and continuous on the compact slab, so their products with the indicator are integrable. The integrating factor \(f=e^{\gamma\Theta_{t_0}}\) is absolutely continuous with \(f'=\gamma \mathbf 1_S f\) almost everywhere, since the smooth exponential has bounded derivative on the compact range in question. The energy is smooth, so \(f\mathcal E\) is absolutely continuous. Its derivative satisfies
\[
 (f\mathcal E)'=f(\mathcal E'+\gamma\mathbf 1_S\mathcal E)
             \le-\beta f\mathbf 1_S\mathscr G
\]
almost everywhere. Integrating this inequality from \(t_0\) through \(t\) gives
\[
 e^{\gamma\Theta_{t_0}(t)}\mathcal E(t)
  +\beta\int_{S\cap[t_0,t]}e^{\gamma\Theta_{t_0}(s)}\mathscr G(s)\,ds
  \le\mathcal E(t_0),\qquad
 0\le\mathcal E(t)\le\mathcal E(t_0)e^{-\gamma\Theta_{t_0}(t)}.
 \tag{1}
\]
The upper estimate follows by dropping the nonnegative integral and dividing by the positive exponential. No division by the energy is used, so zero initial energy gives zero energy thereafter and a vanishing weighted integral. The calculation also works for any measurable subset of the globally pinched times, with its own indicator and cumulative measure. It uses no differentiability of the indicator, interval decomposition or interior point. A null pinched set contributes zero time, and a positive-measure set with empty interior contributes its ordinary Lebesgue measure. Smoothness at the relative lifespan's initial endpoint and absolute continuity on each slab justify (1) at all the stated times. [E212 occupation estimate][e212]

## Lifetime and the two tests

For the round-tail conclusions, E212 adds the hypothesis of a fixed closed oriented smooth homotopy four-sphere and fixed smooth principal bundle carrying a single late sequence \(t_n\uparrow T_*\) with simultaneous native \(P_0,D_0\) bounds. The two quantities are the area-\(4\pi\) whole-sphere density \(\sup_M\Psi\) with the live chiral-horizontal and base derivatives, and the native metric diameter. These are exactly the assessed E179/E181 geometric hypotheses. They exclude a finite maximal endpoint by smooth original-flow continuation, before either (1) or the occupation hypothesis is used. In particular \(t_n\to\infty\) and all later actual times used in the two tests exist. [E179/E181 assessment][late]

- **Unbounded accumulated time.** Changing the finite start changes the accumulated measure by at most the absolute difference between the two starts. Infinite accumulated time is therefore independent of that choice. Estimate (1) applies at every finite time and \(\Theta_{t_0}(t)\to\infty\) gives \(\mathcal E_\infty=0\). E179 uses the geometric sequence, a common positive time shift and recovered smooth normalizers \(K_n\) to obtain a smooth critical limit with exactly \(\mathcal E_\infty\). At zero energy it is perfect. If \(\Phi:P\to P_{\rm rd}\) is the resulting smooth round identification, choose one sufficiently late normalized slice and set \(L=\Phi\circ K_n^{-1}\). By the assessed round-basin transfer and original uniqueness, the actual original tail is the pullback by this fixed \(L\) of the original round-basin solution, with an appropriate finite time translation. The limiting fixed map is \(b_\infty\circ L\). Occupation measures only pinched times and the extraction uses only the geometric sequence. The argument requires no intersection of those sets of times. [E179/E181 assessment][late]
- **Strict finite-slice certificate.** For \(t_n\ge t_0\) with both geometric bounds, suppose \(\mathcal E(t_0)e^{-\gamma\Theta_{t_0}(t_n)}<\delta(P_0,D_0)\), the non-effective uniform threshold in E182/E183/E185. Equation (1) makes the actual unshifted datum satisfy the same strict energy bound. The uniform theorem assumes exactly the native positive-plane and round-sign class, the initial simultaneous \(\Psi\) and diameter bounds and energy strictly below its threshold. There is no supplied ratio hypothesis at this datum. The theorem gives a smooth global original solution from it, positive-time entry into the fixed round pair-value basin and convergence to a fixed round pullback. Translate its time origin to \(t_n\) and apply original uniqueness to the two smooth solutions with common initial value \(A(t_n)\). If equality failed later, a finite last agreement time would be a common smooth slice at which recentered original uniqueness extends equality. Thus the constructed tail is the supplied original tail. This test needs only the accumulated time through \(t_n\). The strict threshold and its non-effective nature give no upper bound on waiting time or the entry time. [Uniform entry assessment][entry] · [E179/E181 uniqueness interface][late]

In both cases the available exponent of the eventual fixed-round \(C^k\) connection and curvature error is \(\alpha=\lambda_1(G_0)/2>0\) in native time, with constants at each fixed order depending on the datum and fixed identifications. A smooth fixed pullback is bounded at each such order and a finite time translation changes only the constant. The rate \(\gamma\) in (1) multiplies measured pinched time and controls the energy on the supplied trajectory. These are different estimates. The round implication uses the stated homotopy-sphere geometry and existence hypotheses, while (1) applies on the actual lifespan of any supplied trajectory on the general closed base. [Smooth limiting recovery assessment][limit]

No new source inspection, numerical work or shared edit was used.

## Verified inputs

| Input | SHA-256 |
| --- | --- |
| [E213 request][request] | 17e0b104cc7f9a5e0018831f8b5a8b73b2b2fec38077d3d5dd45c9e7cc3d4afc |
| [B102][b102] | d7fddf87589d41caad7c60f0851cdc0e0b7352dda8082c5913830faa98f1164b |
| [E212][e212] | 581dcc209b7f2683ad0a676f5a225d3c41f675c47578a9bb2871dc2ce1ca0a99 |
| [E212 return][r212] | 6e8d62c807c57970b2ea4ddfe5a3e8c739c3a73f392a13c2298454bf4e135d06 |
| [E209/E210 gradient assessment][grad] | 83df0cc9c6157a847c23c875c5f8078deb89ff63f72db97836f2b998557628e1 |
| [E179/E181 accumulation assessment][late] | 0c9eb889bb10092e631fb3bea7d06e0120934e6a80682e9f3a05b2d1ff7d3881 |
| [E182–E185 uniform entry assessment][entry] | 0f55dfd759e5dfd1f86e69cc7bd201688de0a2cf5e2bd9ce68414f9ffe96761f |
| [E76/E77 smooth recovery assessment][limit] | c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1 |

[request]: ../research-progress/handoffs/SP4-CME-E213_REQUEST_v1.md
[b102]: ../brainstorm/notes/B102_INTERMITTENT_SPECTRAL_RETURN_20261123.md
[e212]: ../notes/212_CONDITIONAL_INTERMITTENT_SPECTRAL_RETURN_20261123.md
[r212]: ../research-progress/handoffs/SP4-CME-E212_RETURN_v1.md
[grad]: E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md
[late]: E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md
[entry]: E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md
[limit]: E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
