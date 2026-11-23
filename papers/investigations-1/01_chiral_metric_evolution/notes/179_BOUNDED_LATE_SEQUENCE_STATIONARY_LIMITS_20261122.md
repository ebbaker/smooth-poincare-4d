# E179 — Stationary accumulation from a bounded late sequence

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E execution under B89, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored the inherited E174 argument, E168 metric construction, E159 geometric combination and E09 transport estimate. I audited the E148 sequential comparison, round stability transfer and smooth limiting recovery in E150, E52 and E77. The compact-family small-energy result E177 is not a premise here.

## Statement and native equation

Fix a smooth closed connected oriented homotopy four-sphere \(M\) and a smooth principal \(SO(3)\) bundle \(P\to M\). Let \(A(t)\) be a supplied maximal smooth original Fine solution on \([0,T_*)\), \(0<T_*\le\infty\), with positive curvature planes and the round-compatible sign throughout its lifespan. Use the native negative Killing pairing on \(E=\operatorname{ad}P\), the native reconstructed metric \(g=g_A\), and native time. Write \(S=Q^{1/2}\), \(\operatorname{tr}Q=3\), \(q=Q-I\), and \(F_A=-S\sigma\) in native orthonormal internal columns, with \(\sigma:E\to\Lambda_g^+\) the native oriented isometry. The native volume is \(\mu_A=dV_g=\frac13\langle F_A\wedge F_A\rangle\).

Let \(T_X=(S^{-1}D_X^A Q S^{-1})_0/2\) and \(\mathcal G=|\nabla^A T|+|T|^2\), with the full live base connection in the derivative. The E159 real whole-fiber quantity is \(\Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2\), where \(\mathcal R_X(f)=P_{f^\perp}T_X f\) for unit internal \(f\), with the \(\Gamma\)-horizontal derivative on the target sphere and the live derivative on the base covector slot. The fiber uses round area of total mass \(4\pi\).

Assume \(t_n\uparrow T_*\) and common finite constants \(P_0\ge0\), \(D_0>0\) with

\[
 \sup_M\Psi(A(t_n))\le P_0,\qquad
 \operatorname{diam}(M,g_{A(t_n)})\le D_0 .                        \tag{1}
\]

Then \(T_*=\infty\). There are a subsequence, a single \(s_0>0\), and smooth equivariant orientation-preserving automorphisms \(K_n:P\to P\) such that, in a fixed smooth background on this same bundle,

\[
 K_n^*(A(t_n+s_0),F_{A(t_n+s_0)})\longrightarrow(A^\dagger,F_{A^\dagger})
                            \quad\text{smoothly}.                \tag{2}
\]

The limit \(A^\dagger\) is smooth, definite of the same sign, and critical for the native defect energy \(\mathcal E=\int_M|q|^2 dV_g\). Its energy is precisely the monotone limit \(\mathcal E_\infty=\lim_{t\to\infty}\mathcal E(A(t))\). Thus if \(\mathcal E_\infty>0\), (2) supplies a smooth nonperfect critical accumulation pair. If \(\mathcal E_\infty=0\), the actual original trajectory converges smoothly and exponentially to one fixed smooth pullback of the standard native round perfect pair, with datum-dependent higher-order constants. In that case the underlying smooth base is standard \(S^4\).

## Compactness and one common comparison interval

The assessed two-bound continuation criterion from E168/E169 applies to exactly (1) if \(T_*<\infty\) and gives smooth definite extension in the original fixed identification. This contradicts maximality. In the infinite-lifespan case, every time \(t_n+s\) used below is in the actual original trajectory. [Metric and two-bound continuation assessment][metric]

For the compactness input at the unshifted times, set \(k^2=4\pi/5\), \(B=(1+4\sqrt3)P_0/k^2\) and \(Z_0=\sqrt6/2+(42+8\sqrt3)B\). The assessed E159 native estimates give

\[
 \begin{gathered}
 |\nabla^AT|+|T|^2\le B,\qquad |T|+|\nabla^AT|\le \sqrt B+B,\\
 |W^+|_{\rm op,HS}\le Z_0,\qquad |\operatorname{Ric}|_g\le3+(2+2\sqrt3)Z_0 .    \tag{3}
 \end{gathered}
\]

The chiral curvature estimate is for the ordinary self-dual operator block with \(|\operatorname{Ric}_0|\le2Z_0\) and \(|s_g-6|\le4\sqrt3 Z_0\). The bound comes from \(|q|\le\sqrt6\) on the positive trace-three cone and the strain estimate. It uses no quantitative minimum eigenvalue. For any smooth connection variation \(a\), Bianchi gives \(\delta\mu_A=(2/3)d\langle a\wedge F_A\rangle\). Thus the reconstructed total volume along the actual path is the common positive fixed-bundle constant \(v_P\), equal in the native pairing to \((8\pi^2/3)\langle p_1(E),[M]\rangle\). This supplies the positive volume lower bound for (1) and (3). [Geometric and native normalization assessment][geo] · [Volume and energy interface assessment][entry]

The assessed metric compactness gives smooth orientation-preserving base diffeomorphisms \(\varphi_n\), with \(\varphi_n^*g_{A(t_n)}\) converging positively in \(C^{1,1/4}\) on the fixed smooth base. The assessed static pair theorem uses this \(C^1\) convergence, the first inequality of (3) and the topology of a homotopy sphere. It supplies smooth equivariant bundle automorphisms \(h_n\) covering \(\varphi_n\) and, after a further subsequence, uniform convergence of

\[
 (\widetilde A_n,\widetilde F_n)=h_n^*(A(t_n),F_{A(t_n)})
                      \longrightarrow (A_*,F_*)                  \tag{4}
\]

in a fixed smooth affine pair background. The limit is continuous, positive with the specified sign, and compatible distributionally. In a smooth affine origin \(A_b\), the identity \(d_{A_b}a_n=\widetilde F_n-F_{A_b}-[a_n\wedge a_n]/2\), \(a_n=\widetilde A_n-A_b\), passes in distributions by uniform convergence of its right side. No regularity beyond the indicated compactness output is needed. [Metric assessment][metric] · [Pair compactness and topology assessment][geo]

Use the E138–E143 uniform value-radius theorem and the common-lifespan construction of E148. First choose a compact positive value tube about (4)'s continuous limit in the fixed background. On it the norm comparisons and the required native symbol margins are uniform, with a common admissible coupled parameter. Fix the common adjusted datum and completion radii and the graph comparison radius on that tube. Choose one smooth compatible positive definite reference within a quarter of both tube and datum radii using the assessed compatible approximation. This is on the original bundle and need not be stationary. Then fix its \(T_{\rm ref}>0\). Every late normalized pair and the limiting pair lie in this reference's datum ball. This choice takes place after the converging subsequence is determined but before choosing the comparison time. [Uniform local assessment][local] · [E148, common lifespan and reference selection][seq]

Let \((\mathcal A_n(s),\mathcal F_n(s))\) be the adjusted paths from the smooth normalized data, and \((\mathcal A_*(s),\mathcal F_*(s))\) the adjusted path from \((A_*,F_*)\). The paths are compatible and definite in the positive tube. They converge smoothly on every compact interior positive-time strip in \((0,T_{\rm ref})\). Each individual smooth datum has its own smooth graph comparison through zero, and each resulting smooth generator integrates on the compact principal bundle on the common closed slab \([0,\theta]\), \(\theta=3T_{\rm ref}/4\). On that slab the adjusted equation reads

\[
 \partial_s\mathcal A_n=V(\mathcal A_n)+\mathcal L_{\xi_n}\mathcal A_n,
 \qquad j_n'(s)=-\xi_n(s)\circ j_n(s),\quad j_n(0)=\mathrm{id},       \tag{5}
\]

where \(V\) is the native original vector field and \(\xi_n\) is the smooth invariant recovery generator from E148. The (j_n) preserve base orientation. In particular \(j_n(s)^*\mathcal A_n(s)\) solves the original equation from \(\widetilde A_n\). Applying the time-independent \((h_n^{-1})^*\) and using smooth original uniqueness from the common slice at \(t_n\) yields

\[
 A(t_n+s)=(j_n(s)\circ h_n^{-1})^*\mathcal A_n(s),
                           \qquad 0\le s\le\theta .                \tag{6}
\]

For uniqueness on this whole slab, local uniqueness first gives equality near \(s=0\), and recentering at any last common slice extends agreement until \(\theta\). The shifted actual flow exists because \(T_*=\infty\). Natural curvature pullback gives (6) for the pairs. No bounds on generator or normalizer derivatives as \(n\) varies are required. [Local comparison and recovery][local] · [E148, fixed normalization and uniqueness][seq]

## Energy on the adjusted limit and exact criticality

To fix the normalization, \(\mathcal E=\int_M\operatorname{tr}(Q^2)\mu_A-3v_P\). Differentiation of \(Q_{ij}\mu_A=F_i\wedge F_j\) in native orthonormal labels gives

\[
 \delta\mathcal E(a)=\int_M\left\langle d_Aa\wedge
                       (4Q-\tfrac23\operatorname{tr}(Q^2)I)F_A\right\rangle.
\]

The second factor is self-dual. Hence the gradient in the live native one-form \(L^2\) pairing is \(d_A^{*g}[(4Q-\tfrac23\operatorname{tr}(Q^2)I)F_A]\). The constant \(2F_A\) term is killed by \(d_A^{*g}F_A=0\), which follows from self-duality and Bianchi. Therefore

\[
 V(A)=-4 d_A^{*g}[(q-|q|^2 I/6)F_A],
 \qquad \frac{d}{dt}\mathcal E(A(t))=-\int_M |V(A(t))|_g^2\,dV_g     \tag{7}
\]

in native time. In particular \(\mathcal E\) is nonincreasing and nonnegative, so its limit \(\mathcal E_\infty\) exists and is finite. Energy is invariant under smooth equivariant automorphisms covering orientation-preserving diffeomorphisms, since they conjugate the pulled-back \(Q\) by an internal isometry and pull back the volume form. This also gives equality of the energy values under a time-dependent such map separately at each time. [Assessed energy identity and normalization][entry] · [E176, energy variation][audit]

Equation (6) and this invariance give \(\mathcal E(\mathcal A_n(s))=\mathcal E(A(t_n+s))\) on the common slab. By monotonicity,

\[
 \mathcal E_\infty\le\mathcal E(A(t_n+s))\le\mathcal E(A(t_n))
                                         \qquad(0\le s\le\theta).
\]

The right endpoint tends to \(\mathcal E_\infty\) as \(t_n\to\infty\), uniformly squeezing the energy values at all these local times. On any compact interior strip of \((0,\theta)\) the smooth positive adjusted convergence gives convergence of the reconstructed \(Q\), volume, and energy. Therefore \(\mathcal E(\mathcal A_*(s))\) is exactly \(\mathcal E_\infty\) for every \(s\in(0,\theta)\).

At each such \(s\), the smooth compatible adjusted limit satisfies the same adjusted equation as (5), with its own smooth invariant generator \(\xi_*(s)\). Freeze this generator at that one time. Its ordinary flow \(\chi_\rho\) for small \(\rho\) is equivariant, and covers an orientation-preserving base isotopy because it starts at the identity. The orientation and equivariance preserve the component. Since \(\mathcal E(\chi_\rho^*\mathcal A_*(s))=\mathcal E(\mathcal A_*(s))\), differentiating in \(\rho\) at zero gives

\[
 d\mathcal E_{\mathcal A_*(s)}(\mathcal L_{\xi_*(s)}\mathcal A_*(s))=0 .   \tag{8}
\]

This is a directional derivative on a smooth positive slice. It uses no integrated recovery map for the limiting trace at zero. Applying the energy chain rule to the adjusted equation and (7)–(8) gives

\[
 0=\frac{d}{ds}\mathcal E(\mathcal A_*(s))
       =-\int_M |V(\mathcal A_*(s))|^2_{g_{\mathcal A_*(s)}}
                                      dV_{g_{\mathcal A_*(s)}} .    \tag{9}
\]

Smoothness and positive volume imply \(V(\mathcal A_*(s))=0\) pointwise. Thus each such smooth connection is critical in the original equation. The residual right side in the adjusted equation can still be a Lie derivative. In particular criticality does not assert that the adjusted representative is constant in \(s\).

Fix \(s_0=T_{\rm ref}/2\), strictly inside \((0,\theta)\), and set \(A^\dagger=\mathcal A_*(s_0)\). Its exact critical equation is

\[
 d_{A^\dagger}^{*g_{A^\dagger}}
        \left[\left(q^\dagger-\frac{|q^\dagger|^2}{6}I\right)F_{A^\dagger}\right]=0.
\]

The normalizer of the actual shifted slice is \(K_n=h_n\circ j_n(s_0)^{-1}:P\to P\). In fact, it is the inverse of the map in (6), so applying \(K_n^*\) to the original pair at \(t_n+s_0\) gives \((\mathcal A_n(s_0),\mathcal F_n(s_0))\) by contravariance. This is (2), and \(\mathcal E(A^\dagger)=\mathcal E_\infty\). For positive limiting energy it gives a nonperfect critical pair; the conclusion is subsequential and in the chosen normalized slices.

## Zero limiting energy and one fixed limiting round pullback

If \(\mathcal E_\infty=0\), the nonnegative smooth energy density and positive metric give \(q^\dagger=0\) everywhere. Apply the assessed E174/E176 smooth perfect-pair identification, which is a statement at this one smooth time. Compatibility identifies \(A^\dagger\) with \(\Gamma_{g^\dagger}^+\) via its curvature polar isometry \(\sigma^\dagger=-F_{A^\dagger}^\sharp\). The native chiral block then gives \(W^+=0\), \(\operatorname{Ric}_0=0\), and scalar \(6\). The inherited signature identity \(12\pi^2\operatorname{sign}(M)=\int (|W^+|_{\rm op,HS}^2-|W^-|_{\rm op,HS}^2)dV\) of E01C, as used in the assessment, forces \(W^-=0\) since a homotopy sphere has zero signature. Thus the sectional curvature is \(1/2\). The assessed constant-curvature Jacobi charts and development/covering argument produce a smooth orientation-preserving isometry \(f:(M,g^\dagger)\to S^4_{\sqrt2}\). This step uses the smooth adjusted slice rather than the raw compactness metric. [Assessed round identification][entry] · [E176, signature and development][audit]

Write \((P_{\rm rd},A_0,F_0)\) for the native round chiral bundle and perfect pair in this paragraph, and \(\sigma_0:\operatorname{ad}P_{\rm rd}\to\Lambda^+_{g_0}\) for its polar isometry. The adjoint fiber map

\[
 E_x\longrightarrow(\operatorname{ad}P_{\rm rd})_{f(x)},\qquad
            (\sigma_0)_{f(x)}^{-1}\,((df_x)^{-1})^*\,\sigma_x^\dagger
\]

is a smooth oriented isometry, hence lifts by the faithful adjoint frame representation to an equivariant identification \(\Phi:P\to P_{\rm rd}\). Levi–Civita naturality gives \(\Phi^*(A_0,F_0)=(A^\dagger,F_{A^\dagger})\).

By (2), the original pairs at \(t_n+s_0\), transferred by \((\Phi^{-1})^*K_n^*\) to the round bundle, enter the fixed round \(C^0\) connection-and-curvature basin for all sufficiently late terms. Choose one such index \(n\). Let \(B(u)\), \(u\ge0\), be the assessed global smooth original round-basin solution with this transferred datum, and let \(t_b=t_n+s_0\). Use the single smooth fixed map

\[
          L=\Phi\circ K_n^{-1}=\Phi\circ j_n(s_0)\circ h_n^{-1}:P\to P_{\rm rd}.
\]

Then \(L^*B(t-t_b)\) is an original solution and equals \(A(t_b)\) at its first time by the pullback order. It equals the actual \(A(t)\) for all \(t\ge t_b\) by smooth original uniqueness, recentered at common smooth slices. The assessed smooth limiting recovery theorem supplies a fixed smooth equivariant orientation-preserving automorphism \(b_\infty\) of \(P_{\rm rd}\) such that \((B,F_B)\) converges smoothly and exponentially to \(b_\infty^*(A_0,F_0)\). Therefore the actual limit on \(P\) is \((b_\infty\circ L)^*(A_0,F_0)\). The fixed pullback and finite time translation retain the native exponential exponent with datum-dependent higher-order constants. This gives full convergence of the actual original path in the zero limiting energy case. [Round stability assessment][basin] · [Smooth limiting recovery assessment][limit]

## Scope and frozen inputs

The only supplied geometric control is (1) at the selected original times. The shifted times occur in the actual maximal trajectory, with normalization at each slice by one smooth map. No initial smallness, bounds on intervening geometry, or estimates on derivatives of the changing normalizers are used. The nonperfect conclusion stops at existence of a critical accumulation pair at the limiting energy. It does not decide existence of such critical points in general, uniqueness of a normalized accumulation limit, or whole-path convergence in the positive limiting energy case. Fine v2's separate definite-triple equation is outside this implication. No new source inspection, numerical work or shared edit was done.

| Input | SHA-256 |
| --- | --- |
| [E179 request][req] | `adc74d83d267d0f7bdcef5c4c02c9266e0b4857989834952cbf79e349588f4d1` |
| [B89][b89] | `a7c7f8a15cb1409d8916fce1aeb3e8e0ad1115be5ca522433e9f53ff1dddfaad` |
| [E174/E176 entry assessment][entry] | `45c8c59dac557d65d10b029f1e495a8a7d93899613cc68e923a372ab1d831c3a` |
| [E168/E169 metric assessment][metric] | `6dbf39d42f980e1d04eeeba60cfad575d16e1a13a91c5ffb7531bd77ead04d1f` |
| [E157–E159 geometric assessment][geo] | `b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52` |
| [E148][seq] | `526fa0a48fe414989549172efc4c2c71b3093b8a4b22ae537c2035e0709ee894` |
| [E138–E143 local assessment][local] | `10909e6810beed40a4b87efd00f21637d1a6b12b102bc9f3d6b84648a7124f1e` |
| [E49–E52 stability assessment][basin] | `f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee` |
| [E76/E77 limiting recovery assessment][limit] | `c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1` |
| [E176 audit][audit] | `dc6f146209da5e206f17df685cadeb2df126935bb5014fbe8a4946e7bc7bdf6a` |

[req]: ../research-progress/handoffs/SP4-CME-E179_REQUEST_v1.md
[b89]: ../brainstorm/notes/B89_BOUNDED_SEQUENCE_STATIONARY_LIMITS_20261122.md
[entry]: ../reviews/E174_E176_INTRINSIC_ENTRY_ASSESSMENT_20261122.md
[metric]: ../reviews/E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md
[geo]: ../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md
[seq]: 148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md
[local]: ../reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md
[basin]: ../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[limit]: ../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
[audit]: ../reviews/E176_INTRINSIC_ROUND_ENTRY_AUDIT_20261122.md
