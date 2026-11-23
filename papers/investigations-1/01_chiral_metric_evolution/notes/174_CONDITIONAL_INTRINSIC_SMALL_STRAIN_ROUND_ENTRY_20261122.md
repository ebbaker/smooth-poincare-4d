# E174 — Conditional positive-time entry to the round basin

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E combination under B87, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored E171, E168, E159 and inherited E09, and audited the E148 sequential argument and round stability/recovery in E150, E52 and E77. These dependencies enter with their stated assessment status. The new combination keeps the frozen E171 conclusion conditional as requested.

## Fixed data, premise, and assertion

Fix a smooth closed connected oriented homotopy four-sphere \(M\) and a smooth principal \(SO(3)\) bundle \(P\to M\). Use original Fine flow in the native negative Killing pairing and native time, positive curvature planes, and the round-compatible curvature-map sign. In particular \(\operatorname{tr}Q=3\), \(q=Q-I\), and \(F_A=-\sqrt Q\,\sigma\) in native orthonormal internal labels, with \(\sigma:E=\operatorname{ad}P\to\Lambda_g^+\) the oriented isometry of the reconstructed metric. Set \(T_X=(Q^{-1/2}D_X^A Q\,Q^{-1/2})_0/2\) and \(\mathcal G=|\nabla^A T|+|T|^2\), using the live Levi–Civita derivative on all base slots and \(A\) on internal slots. For unit internal \(f\), put \(\mathcal R_X(f)=P_f T_X f\) with \(P_f\) the orthogonal projection onto \(f^\perp\). The whole-fiber density is \(\Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2\) of E145/E159, using the \(\Gamma\)-horizontal lift on the target unit sphere, the live derivative on the base covector and ordinary fiber area of total mass \(4\pi\).

**Premise \(H_{\rm small}\).** Assume the exact frozen E171 conclusion with its threshold. Namely, for every smooth definite slice of the specified sign on a smooth closed connected simply connected oriented four-manifold with \(H^2(M;\mathbb R)=0\), \(\sup_M\mathcal G\le\varepsilon_{\rm sm}\) implies \(|q|\le72\mathcal G\) pointwise and \(\operatorname{Ric}_g\ge(3/4)g\), where

\[
 \varepsilon_{\rm sm}=\min\left\{\frac{\sqrt{p_*}}{72\sqrt6},
       \frac{\sqrt5}{36},\frac{3}{4(2+\sqrt3)(78+8\sqrt3)}\right\}.
\]

Here \(p_*\) is the positive minimum of \(\sum_{\rm cyc}\lambda_i(\lambda_j-\lambda_k)^2\) on the nonnegative trace-three simplex outside the open sets \(|\lambda-(1,1,1)|_2<1/2\) and \(\lambda_{\max}>5/2\). This premise is exactly the conclusion pending independent audit at E174 dispatch. [E171][small]

**Conditional assertion.** There is an \(\epsilon(M,P)>0\) such that every smooth definite \(A\) of the specified sign with \(\sup_M\Psi(A)<\epsilon(M,P)\) starts a smooth global definite original flow. Some positive-time slice, after a smooth orientation-preserving equivariant identification with the native round chiral bundle, lies in the assessed fixed round connection-and-curvature value basin. The original connection and curvature converge smoothly and exponentially to one fixed smooth pullback of the native round perfect pair. The existence of such small-strain data on \(M/P\) implies that \(M\) is smoothly diffeomorphic to the standard \(S^4\). The threshold assertion is non-effective and is for the fixed smooth \(M/P\). Each higher-order estimate can depend on the datum. The qualifying class may be empty on a given base or bundle.

## Bad sequence, common volume, and positive pair limit

Suppose no positive threshold for this complete property exists. Select smooth definite \(A_n\) on the same \(P\) with the stated sign and \(\sup_M\Psi(A_n)\to0\), each failing the property. Write \(g_n=g_{A_n}\). In the native convention \(k^2=4\pi/5\) and \(\Psi\ge k^2\mathcal G/(1+4\sqrt3)\). Thus \(\sup_M\mathcal G_n\to0\). After discarding finitely many indices, \(H_{\rm small}\) gives uniform \(q_n\to0\) and \(\operatorname{Ric}_{g_n}\ge(3/4)g_n\), and \(\sup_M(|T_n|+|\nabla^{A_n}T_n|)\le\sqrt{\sup\mathcal G_n}+\sup\mathcal G_n\). The native E159 chiral bound, with \(|W^+|_{\rm op,HS}\) the Hilbert–Schmidt norm on the ordinary self-dual two-form space, gives

\[
 |W^+_{g_n}|_{\rm op,HS}\le Z_n,\qquad
 |\operatorname{Ric}_{g_n}|_{g_n}\le 3+(2+2\sqrt3)Z_n,
 \qquad Z_n=(78+8\sqrt3)\sup_M\mathcal G_n .                    \tag{1}
\]

Indeed the chiral block is bounded by \(\tfrac12|q|+6|\nabla^AT|+(42+8\sqrt3)|T|^2\), and its scalar target is \(6\). The factors \(|\operatorname{Ric}_0|\le2Z_n\), \(|s-6|\le4\sqrt3Z_n\), and \(|g|_g=2\) give the absolute bound. [E171][small] · [Native estimates and topology assessment][geo]

For the diameter, let a unit-speed minimizing geodesic join any two distinct points of \((M,g_n)\), with length \(L\). Apply its fixed-endpoint index form to the three normal variations \(\sin(\pi u/L)E_j(u)\) from a parallel orthonormal normal frame. Their sum is nonnegative and is at most

\[
 \int_0^L\left[3(\pi/L)^2\cos^2(\pi u/L)
            -\tfrac34\sin^2(\pi u/L)\right]du
       =\frac{3\pi^2}{2L}-\frac{3L}{8}.
\]

Hence \(L\le2\pi\) and all diameters are at most \(2\pi\) in the native metric.

For any smooth connection on \(P\), define the global four-form \(\mu_A=\tfrac13\langle F_A\wedge F_A\rangle\) using the native pairing. For an affine path of connections, with velocity \(a\), the curvature variation and Bianchi give

\[
 \dot\mu_A=\tfrac23\langle d_Aa\wedge F_A\rangle
              =\tfrac23d\langle a\wedge F_A\rangle .            \tag{2}
\]

This equality holds even if the affine path leaves the definite region. Its integral is constant on the fixed bundle by Stokes. On every positive definite endpoint, tracing the wedge Gram identity gives \(\mu_A=dV_{g_A}\). Thus every \(g_n\) has the same positive volume \(v_P\). For the characteristic normalization, in a native orthonormal bracket basis \(\operatorname{tr}_{\mathbb R^3}(\operatorname{ad}(e_i)\operatorname{ad}(e_j))=-\delta_{ij}\). Hence \(p_1(E)=-\operatorname{tr}(\operatorname{ad}F_A\wedge\operatorname{ad}F_A)/(8\pi^2)\) at the representative level, and \(v_P=(8\pi^2/3)\langle p_1(E),[M]\rangle\). [Foundation assessment][found]

Apply assessed E168/E169 to (1), this positive volume, and the diameter bound. After a subsequence it gives smooth orientation-preserving \(\varphi_n:M\to M\) with \(\varphi_n^*g_n\) converging strongly to a positive \(C^{1,1/4}\) metric, with weak \(W^{2,8}\) regularity in a fixed smooth atlas. The static E155/E157–E159 result uses just \(C^1\), the native strain bounds, and the topology to produce same-bundle smooth orientation-preserving lifts \(h_n:P\to P\) covering \(\varphi_n\), after a further subsequence. Then

\[
 (\widetilde A_n,\widetilde F_n)=(h_n^*A_n,h_n^*F_{A_n})
       \longrightarrow (A_*,F_*) \quad\text{uniformly}          \tag{3}
\]

in one fixed smooth affine background on this bundle, with a positive compatible limit of the same sign. The curvature identity passes distributionally. With \(a_n=\widetilde A_n-A_b\) relative to the reference affine origin \(A_b\), use \(d_{A_b}a_n=\widetilde F_n-F_{A_b}-[a_n\wedge a_n]/2\), whose right side converges uniformly. Equivariance and orientation ensure that the normalized pairs correspond to the same native equation. The compactness output (3) is used as continuous compatible data. [Metric compactness assessment][metric] · [Pair and topology assessment][geo]

## One smooth reference and one positive time

Use the assessed E138–E143 local construction in the form of E148's common-lifespan lemma. First choose a compact positive fiber-value tube about the continuous graph of \((A_*,F_*)\) in (3), with the positive-plane sign fixed. On it there are uniform metric comparisons, one admissible coupled symbol parameter and native rank-one margins. Fix the uniform adjusted-data and completion radii and the smooth graph comparison radius, before choosing reference derivatives. For example E148 may take \(r_{\rm data}=\min\{\epsilon/2,\rho_{\rm gr}/(2L_0),R/(4L_0)\}\), in its fixed background, using the common adjusted data radius \(\epsilon\), completed-ball radius \(R\), graph radius \(\rho_{\rm gr}\) and common norm conversion \(L_0\). Next choose one smooth compatible definite \((\bar A,F_{\bar A})\) close to \((A_*,F_*)\) by the E38 approximation, within one quarter of both the tube and common data radii. The reference is on the same bundle and need not be stationary. Fix its reference-dependent \(T_{\rm ref}>0\). All sufficiently late normalized pairs, and the limiting pair, are in the common data ball around this one reference. [Uniform local assessment][local] · [E148, common lifespan and reference choice][seqnote] · [Sequential assessment][seqa]

Write \((\mathcal A_n(s),\mathcal F_n(s))\) and \((\mathcal A_*(s),\mathcal F_*(s))\) for the corresponding adjusted solutions on this fixed slab. They are compatible, and converge smoothly on every compact interior positive-time strip. Each smooth datum has its own smooth graph comparison at zero, identifying its adjusted solution through zero. The smooth invariant recovery generator then integrates on the compact principal bundle individually on the common closed interval \([0,\theta]\), \(\theta=3T_{\rm ref}/4\). More explicitly the adjusted equation is \(\partial_s\mathcal A_n=V(\mathcal A_n)+\mathcal L_{\xi_n}\mathcal A_n\) for the assessed generator \(\xi_n\). Let \(j_n'(s)=-\xi_n(s)\circ j_n(s)\), \(j_n(0)=\mathrm{id}\). Then \(j_n(s)^*\mathcal A_n(s)\) solves the native original equation from \(\widetilde A_n\). The maps \(j_n(s)\) preserve orientation on the base. By naturality the local original solution from \(A_n\) itself is

\[
 A_n^{\rm loc}(s)=(j_n(s)\circ h_n^{-1})^*\mathcal A_n(s),
                     \qquad 0\le s\le\theta .                 \tag{4}
\]

This uses only the individual smoothness of each recovering flow. The reference time is fixed before selecting \(s_0=T_{\rm ref}/2\), which is strictly inside the common original interval. Positive-time adjusted convergence at \(s_0\) needs no convergence of \(j_n(s_0)\), and the limiting adjusted flow is used without a zero-based rough recovery. [Sequential assessment][seqa]

## Native invariant energy and the smooth perfect slice

For a smooth definite connection define

\[
 \mathcal E(A)=\int_M |q|^2\,\mu_A
           =\int_M\operatorname{tr}(Q^2)\,\mu_A-3v_P .          \tag{5}
\]

Its variation on the fixed closed base has the same native pairing as the original flow. Differentiating \(F_i\wedge F_j=Q_{ij}\mu_A\) in an orthonormal internal frame gives \(\dot Q_{ij}\mu_A=(d_Aa)_i\wedge F_j+F_i\wedge(d_Aa)_j-Q_{ij}\dot\mu_A\). Using (2) and (5), the result is

\[
 \delta\mathcal E(a)=\int_M\Big\langle d_Aa\wedge
              \bigl(4Q-\tfrac23\operatorname{tr}(Q^2)I\bigr)F_A
                          \Big\rangle .                        \tag{6}
\]

The second factor is self-dual for the live metric. Integration by parts makes the gradient \(d_A^{*g}[(4Q-\tfrac23\operatorname{tr}(Q^2)I)F_A]\) for the live ordinary one-form \(L^2(dV_g)\) pairing. Its negative is the native original velocity. Since \(d_A^{*g}F_A=0\), it also equals \(-4d_A^{*g}[(q-|q|^2I/6)F_A]\) when written as the velocity. Therefore along every smooth original path,

\[
 \frac{d}{ds}\mathcal E(A(s))=-\int_M|\partial_s A|_g^2\,dV_g.
                                                                    \tag{7}
\]

For a check against the earlier calibrated convention, \(g=c\widehat g\), \(c=2K\), \(s=ct\), and \(\mu_A=2\widehat\mu_A\). The endomorphism \(q\) is unchanged. Thus \(\mathcal E=2\widehat{\mathcal E}\), and the time derivative is \(2/c\) times the old derivative. The native one-form squared norm of the native velocity, including the integrated volume and \(\partial_s A=c^{-1}\partial_t A\), is also \(2/c\) times the old squared norm. This yields (7) with unit coefficient and the negative sign. [Foundation assessment][found] · [E01A, gradient and time normalization][grad] · [Calibrated metric note][metricnote]

For any smooth equivariant bundle automorphism covering an orientation-preserving base diffeomorphism, the connection's \(Q\) is pulled back and conjugated by the internal isometry, and the volume form is pulled back by the base map. Thus \(\mathcal E\) is invariant, including under the recovering map separately at each time. Apply (7) to the individual smooth original paths, and use that invariance in (4). It gives for all \(0\le s\le\theta\)

\[
 0\le\mathcal E(\mathcal A_n(s))
       \le\mathcal E(A_n)\le v_P\|q_n\|_{C^0}^2\longrightarrow0 .   \tag{8}
\]

Fix any \(s\in(0,\theta)\). Smooth adjusted convergence and positivity on that strip give convergence of the integral in (5), so \(\mathcal E(\mathcal A_*(s))=0\). Its smooth nonnegative integrand against a positive volume implies \(Q(\mathcal A_*(s))=I\) everywhere. In particular the selected slice \(A^\dagger=\mathcal A_*(s_0)\) is smooth and perfect. Its metric \(g^\dagger\) is the one reconstructed at this positive time. This argument uses energy monotonicity only for smooth original approximants and energy invariance at common time. It needs no rough-data defect equation at the initial trace.

## Smooth round identification and the splice

At \(A^\dagger\), \(Q=I\) implies \(T=0\). Compatibility makes \(A^\dagger=\Gamma^+\) under the smooth polar isometry \(\sigma^\dagger=- (F_{A^\dagger})^\sharp:E\to\Lambda^+_{g^\dagger}\). Here \(F^\sharp\) contracts the native internal vector into the curvature. In these labels \(F_{\Gamma^+}=-\sigma^\dagger\), so the native chiral block identity \(\tfrac12|F_{\Gamma^+}+\sigma^\dagger|=\bigl(|W^+|_{\rm op,HS}^2+|\operatorname{Ric}_0|^2/4+(s-6)^2/48\bigr)^{1/2}\) gives \(W^+=0\), \(\operatorname{Ric}_0=0\), and \(s=6\). [Foundation assessment][found] · [Native geometric assessment][geo]

The real intersection form on the homotopy sphere is zero. The inherited Hirzebruch signature theorem, inspected in E01C in *The signature theorem: Reminiscences and recreation*, §4, p. 11, (16), and its Chern–Weil contraction in the same assessment give

\[
  12\pi^2\operatorname{sign}(M)
      =\int_M\bigl(|W^+|_{\rm op,HS}^2-|W^-|_{\rm op,HS}^2\bigr)
                                                            dV_{g^\dagger}.
\]

The Weyl norms here are Hilbert–Schmidt on their ordinary two-form blocks. The Ricci off-diagonal terms cancel and the scalar blocks cancel in the stated contraction. Zero signature and \(W^+=0\) give \(W^-=0\) by the nonnegative norm density and smoothness. Both diagonal curvature blocks are then \((s/12)I=(1/2)I\), and the off-diagonal blocks vanish. Thus all sectional curvatures of \(g^\dagger\) are \(1/2\). [E01C, signature and norm derivation][sig] · [Hirzebruch, §4, p. 11, (16)][hirz]

For the round identification, use the developing and covering argument already checked in E01C, with local isometric charts here. The normal-coordinate Jacobi equation at sectional curvature \(1/2\) gives the polar metric \(dr^2+2\sin^2(r/\sqrt2)g_{S^3}\) on a sufficiently small normal ball. Thus these charts are locally isometric to the sphere of radius \(\sqrt2\) and can be chosen orientation preserving. A transition on a connected overlap piece extends to a unique rotation of that sphere by matching an oriented point and orthonormal tangent frame. The local isometry and that rotation agree on a normal neighborhood by their action on geodesics, and on the connected overlap piece by propagation of the first jet. The uniqueness gives the cocycle condition on triple overlap pieces. Continue chart germs along paths by these rotations, using the chart-subdivision and path-homotopy argument of E01C. Simple connectivity gives a global orientation-preserving local isometry \(f:M\to S^4_{\sqrt2}\). Its image is open and closed by compactness of the source and connectedness of the target, so it is onto. A proper local diffeomorphism is a covering, and the target is simply connected. Hence \(f\) is a smooth isometry and a diffeomorphism. E01C's primary development source is Schoen–Yau's conformal version. The local isometric transitions above use the constant-curvature Jacobi equation in place of Möbius conformal rigidity. [E01C, developing argument][sig] · [Schoen–Yau, pp. 47, 49–50][sy]

Let \((P_0,A_0,F_0,g_0)\) denote the native perfect chiral bundle, connection, curvature and round metric on \(S^4_{\sqrt2}\). The forward map on self-dual forms over \(f\) is \(((df)^{-1})^*\). Compose it with \(\sigma^\dagger\) to get a smooth oriented isometry of adjoint fibers \(E_x\to(\Lambda^+_{g_0})_{f(x)}\). The adjoint representation identifies each \(SO(3)\) bundle with the oriented frame bundle of its native adjoint model. The fiber isometry therefore gives one smooth equivariant identification \(\Phi:P\to P_0\) over \(f\). Naturality of the chiral Levi–Civita connection and \(A^\dagger=\Gamma^+\) imply \(\Phi^*(A_0,F_0)=(A^\dagger,F_{A^\dagger})\). [Pair assessment][geo] · [Round stability assessment][basin]

At \(s_0\), the smooth adjusted convergence implies that

\[
 \bigl((\Phi^{-1})^*\mathcal A_n(s_0),
                  (\Phi^{-1})^*\mathcal F_n(s_0)\bigr)
            \longrightarrow (A_0,F_0)
\]

smoothly in the fixed round identification, hence within its prescribed \(C^0\) connection-and-curvature basin for all sufficiently large \(n\). Denote the smooth global **original** solution on \(P_0\) from this datum by \(B_n(t)\), \(t\ge0\). This is the assessed E49/E52 result in native time. Define the fixed map \(L_n=\Phi\circ j_n(s_0)\circ h_n^{-1}:P\to P_0\). By pullback order and (4), the path \(L_n^*B_n(s-s_0)\) starts at \(A_n^{\rm loc}(s_0)\). It solves the same original equation on \(P\) by time-independent naturality. Smooth original uniqueness gives matching on the overlap \([s_0,\theta]\), by recentering at every common endpoint before \(\theta\). As \(s_0<\theta\), the head and tail give a smooth global original path from the actual \(A_n\), in its original identification. The same \(L_n\) identifies its positive-time basin entry. [Original uniqueness and local recovery][seqa] · [Round stability and smooth splice][basin]

By the assessed E76/E77 smooth limiting recovery theorem there is a smooth equivariant orientation-preserving automorphism \(j_{n,\infty}\) on \(P_0\) such that the round-basin original pair converges smoothly to \(j_{n,\infty}^*(A_0,F_0)\). Every fixed-order norm has the native exponential rate from that theorem, \(\lambda_1(G_0)/2\). Applying \(L_n^*\) gives the limit \((j_{n,\infty}\circ L_n)^*(A_0,F_0)\) on \(P\). Pullback by each fixed smooth \(L_n\) preserves smooth convergence and the rate, with constants depending on the datum and chosen identification. The shift by \(s_0\) changes constants only. The result gives a fixed limiting round identification for each datum. [Smooth limiting recovery assessment][limit]

Thus every sufficiently large member of the supposed bad sequence satisfies the whole asserted property, a contradiction. This gives a non-effective positive \(\epsilon(M,P)\) on the fixed smooth base and bundle. Lack of such initial data leaves the criterion vacuous. The proof obtains round-basin values at a positive time, and retains separate questions of initialization, cross-base uniformity, and instantaneous round-orbit value approximation. No new primary work was reopened in E174.

## Frozen inputs

| Input | SHA-256 |
| --- | --- |
| [E174 request][req] | `8b394b14ea911ce76bb25fb5b68c6741909d60958096bd27d40af7905a1bb046` |
| [B87][b87] | `7052a35cd32c00cd1a5029fe7c4a5957650527d9b8cb32f2f438f67bbb3a158b` |
| [E171][small] | `4fc28853a3866f7094aa67471c4e1df40f56ac4a516146a752fd33df624f7e60` |
| [E168/E169 metric assessment][metric] | `6dbf39d42f980e1d04eeeba60cfad575d16e1a13a91c5ffb7531bd77ead04d1f` |
| [E157–E159 geometric assessment][geo] | `b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52` |
| [E138–E143 local assessment][local] | `10909e6810beed40a4b87efd00f21637d1a6b12b102bc9f3d6b84648a7124f1e` |
| [E148][seqnote] | `526fa0a48fe414989549172efc4c2c71b3093b8a4b22ae537c2035e0709ee894` |
| [E148/E150 sequential assessment][seqa] | `6c9480a6dfaedbff17156541faa9c350e61bcf7925d5ae4cec88e8a7d93d4557` |
| [E49–E52 stability assessment][basin] | `f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee` |
| [E76/E77 limit assessment][limit] | `c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1` |
| [E01 foundation assessment][found] | `83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6` |
| [E01C][sig] | `9b725bd3e3d56248a7276dadf712deb976518210bc9596f309ed42f0df28f0ca` |
| [Calibrated metric note][metricnote] | `fca4cad10ee49b497628932e7ee1b150bfe4e701a3422b6e3b1f2e764cd16347` |

[req]: ../research-progress/handoffs/SP4-CME-E174_REQUEST_v1.md
[b87]: ../brainstorm/notes/B87_INTRINSIC_SMALL_STRAIN_ROUND_ENTRY_20261122.md
[small]: 171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md
[metric]: ../reviews/E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md
[geo]: ../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md
[local]: ../reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md
[seqnote]: 148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md
[seqa]: ../reviews/E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md
[basin]: ../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[limit]: ../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
[found]: ../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md
[grad]: ../reviews/E01A_AUDIT_20261122.md
[sig]: ../reviews/E01C_AUDIT_20261122.md
[metricnote]: 02_riemannian_s4_metric_evolution_20261121.md
[hirz]: https://hirzebruch.mpim-bonn.mpg.de/id/eprint/84/1/signature%20theorem.pdf
[sy]: https://math.jhu.edu/~js/Math646/schoen-yau.conformal.pdf
