# E177 — Defect-energy entry on a geometrically bounded family

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E execution under B88, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored E174, E171, E168, E159 and the inherited E09 transport estimate, and audited E148, round stability and smooth limiting recovery in E150, E52 and E77. E174 supplies the proof template. This note derives the energy-entry conclusion from the assessed metric, pair, local and round results rather than importing E174's conclusion.

## Statement

Fix a smooth closed connected oriented homotopy four-sphere \(M\), a smooth principal \(SO(3)\) bundle \(P\to M\), constants \(0\le P_0<\infty\) and \(0<D_0<\infty\). Use native time, the negative Killing pairing on \(E=\operatorname{ad}P\), and the native reconstructed Riemannian metric \(g_A\). Work with smooth definite connections of the positive-plane, round-compatible curvature sign. Write \(Q>0\), \(\operatorname{tr}Q=3\), \(q=Q-I\), \(S=Q^{1/2}\), and \(F_A=-S\sigma\) as an internal column with native oriented isometry \(\sigma:E\to\Lambda^+_{g_A}\).

Set \(T_X=(S^{-1}D_X^A Q S^{-1})_0/2\) and \(\mathcal G=|\nabla^AT|+|T|^2\), with the live base covariant slots. In the whole-fiber quantity \(\Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2\), the remainder at unit \(f\) is \(\mathcal R_X(f)=P_f T_X f\), with \(P_f\) orthogonal projection onto \(f^\perp\). The derivative uses the \(\Gamma\)-horizontal lift on the target sphere and the live base covector connection. Fiber area has total mass \(4\pi\). Define \(\mathcal E(A)=\int_M|q|^2\,dV_{g_A}\).

There is a non-effective \(\delta(M,P,P_0,D_0)>0\) such that every such \(A\) with

\[
  \sup_M\Psi(A)\le P_0,\qquad \operatorname{diam}(M,g_A)\le D_0,
                  \qquad \mathcal E(A)<\delta(M,P,P_0,D_0)         \tag{1}
\]

starts a smooth global definite original Fine flow in its original identification. At a positive time its connection and curvature are in the assessed fixed round value basin after a smooth orientation-preserving equivariant identification with the native standard round chiral bundle. The actual original pair converges smoothly and exponentially to one fixed smooth pullback of the round perfect pair, with data-dependent higher-order constants. The existence of any datum meeting (1) implies that \(M\) is diffeomorphic to standard \(S^4\). The theorem uses no initial pointwise defect smallness or quantitative eigenvalue floor, and the geometric bounds in (1) are only on the initial slice.

## Compactness of a bad sequence

If the class with the two bounded quantities is empty, any positive \(\delta\) works. Otherwise suppose the asserted positive threshold does not exist, and choose a bad sequence \(A_n\) on the same \(P\) satisfying those bounds and \(\mathcal E(A_n)<1/n\). Failure means failing the complete property above. In particular all these data are smooth definite of the selected sign. Put \(g_n=g_{A_n}\). With \(k^2=4\pi/5\), the assessed E159 estimates are

\[
 C=\frac{1+4\sqrt3}{k^2},\qquad B=CP_0,\qquad
 \mathcal G_n\le B,\qquad |T_n|+|\nabla^{A_n} T_n|\le\sqrt B+B .   \tag{2}
\]

The native pointwise block and its bound are

\[
 \begin{aligned}
 \left(|W^+|_{\rm op,HS}^2+\tfrac14|\operatorname{Ric}_0|_g^2
                           +\tfrac1{48}(s_g-6)^2\right)^{1/2}
 &\le\tfrac12|q|+6|\nabla^AT|+(42+8\sqrt3)|T|^2\\
 &\le Z_0:=\tfrac{\sqrt6}{2}+(42+8\sqrt3)B.
 \end{aligned}                                                      \tag{3}
\]

Here the \(W^+\) norm is the Hilbert–Schmidt endomorphism norm on ordinary self-dual two-forms, and \(|q|\le\sqrt6\) uses just trace three and positivity. The bound (3) gives \(|W^+|_{\rm op,HS}\le Z_0\), \(|\operatorname{Ric}_0|\le2Z_0\) and \(|s_g-6|\le4\sqrt3Z_0\). Since \(|g|_g=2\), the native absolute Hilbert–Schmidt bound is \(|\operatorname{Ric}|_g\le3+(2+2\sqrt3)Z_0\). The constants hold for \(P_0=0\) as well, and none of these steps uses a \(Q\) floor or any smallness of the initial energy. [Geometric assessment][geo]

For every smooth connection set \(\mu_A=\frac13\langle F_A\wedge F_A\rangle\) in the native pairing. On a definite connection it is \(dV_{g_A}\) by tracing the Gram identity. Along any affine path of connections on the fixed bundle, even outside the definite component, the curvature variation and Bianchi give

\[
 \partial_s\mu_A=\tfrac23\langle d_A a\wedge F_A\rangle
                 =\tfrac23 d\langle a\wedge F_A\rangle,
                      \qquad a=\partial_s A .                     \tag{4}
\]

Thus \(\int_M\mu_A\) is constant on all connections on \(P\). In a native orthonormal bracket frame \(\operatorname{tr}_{\mathbb R^3}(\operatorname{ad}e_i\operatorname{ad}e_j)=-\delta_{ij}\). The real Pontryagin representative \(-\operatorname{tr}(\operatorname{ad}F_A\wedge\operatorname{ad}F_A)/(8\pi^2)\) gives the same constant \(v_P=(8\pi^2/3)\langle p_1(E),[M]\rangle\). It is positive whenever the definite class is nonempty. In particular, the bound on diameter and (3), together with \(\operatorname{Vol}(g_n)=v_P>0\), meet all hypotheses of the assessed fixed-base metric compactness theorem. This is a common volume across data, in addition to conservation along each flow. [Assessed metric compactness][metric]

The metric theorem gives, after a subsequence, smooth orientation-preserving diffeomorphisms \(\varphi_n:M\to M\) and strong positive \(C^{1,1/4}\) metric convergence on the fixed smooth base. The assessed E155/E157–E159 pair theorem needs only its strong \(C^1\) convergence, the uniform strain bounds in (2), and simple connectivity with \(H^2(M;\mathbb R)=0\). It supplies same-bundle smooth equivariant orientation-preserving lifts \(h_n:P\to P\) of those \(\varphi_n\), and, after a further subsequence,

\[
  (\widetilde A_n,\widetilde F_n)=(h_n^* A_n,h_n^*F_{A_n})
          \longrightarrow (A_*,F_*)                               \tag{5}
\]

uniformly in one fixed smooth affine background. The limiting pair is continuous, positive and distributionally compatible in the same component. For clarity, with the affine origin \(A_b\) and \(a_n=\widetilde A_n-A_b\), the identity \(d_{A_b}a_n=\widetilde F_n-F_{A_b}-[a_n\wedge a_n]/2\) passes to distributions by uniform convergence of its right side. Smoothness or roundness of the limiting metric in this atlas is not used. The conclusions so far require only the bounded quantities in (1). [Pair compactness and topology assessment][geo]

## Common local interval and the monotone energy limit

Apply the assessed uniform-radius local construction in E138–E143 and the common-lifespan lemma of E148 to (5). The positive compatible continuous graph is compact in the fixed background. First choose a compact positive fiber-value tube about it, with uniform comparison norms, coupled symbol parameter, and native closed-curvature and graph rank-one margins. This supplies common adjusted datum, completion, and smooth comparison radii before choosing derivatives of a reference. Choose one smooth compatible positive reference within one quarter of both tube and common datum radii by the assessed E38 approximation. It can be nonstationary and is on the same bundle. Fix this reference's \(T_{\rm ref}>0\). The limit and every sufficiently late normalized pair are in the common datum ball. [Uniform local assessment][local] · [E148, common original lifespan and compatibility][seq]

Write \((\mathcal A_n(s),\mathcal F_n(s))\) and \((\mathcal A_*(s),\mathcal F_*(s))\) for the compatible adjusted solutions on the common reference slab. They converge smoothly on its compact interior positive-time strips. For the smooth data, the individual smooth graph-start comparison makes each adjusted path smooth at zero, even though its comparison time need not be uniform. In the adjusted equation \(\partial_s\mathcal A_n=V(\mathcal A_n)+\mathcal L_{\xi_n}\mathcal A_n\), \(V\) is the native original vector field. E148 integrates \(j_n'(s)=-\xi_n(s)\circ j_n(s)\), \(j_n(0)=\mathrm{id}\), individually on the compact bundle through the common closed time \(\theta=3T_{\rm ref}/4\). The pullback by \(j_n(s)\) cancels the transport and recovers a smooth original solution from \(\widetilde A_n\). Undoing the fixed normalizer gives the smooth original solution from the actual \(A_n\) on this same interval as

\[
 A_n^{\rm loc}(s)=(j_n(s)\circ h_n^{-1})^*\mathcal A_n(s),
                        \qquad 0\le s\le\theta .                 \tag{6}
\]

All these maps preserve the base orientation. Choose \(s_0=T_{\rm ref}/2\), strictly before \(\theta\), after this construction. The proof only needs convergence of the adjusted pairs on the positive strip. The initially accumulated \(j_n(s_0)\) can vary freely with the datum. There is no recovered original solution based at the continuous limiting trace in this proof.

The operative energy can be checked directly in native units. On the definite component \(\mathcal E=\int\operatorname{tr}(Q^2)\mu_A-3v_P\). Vary \(Q_{ij}\mu_A=F_i\wedge F_j\) and contract with \(2Q_{ij}\). Symmetry gives \(2\langle Q,\partial_sQ\rangle\mu_A=4\sum_{i,j}Q_{ij}(d_Aa)_i\wedge F_j-2\operatorname{tr}(Q^2)\partial_s\mu_A\). Adding the variation of the volume factor and using (4) gives

\[
 \delta\mathcal E(a)=\int_M\left\langle d_Aa\wedge
                       (4Q-\tfrac23\operatorname{tr}(Q^2)I)F_A\right\rangle.
                                                                    \tag{7}
\]

The second factor is self-dual, so integration by parts uses the ordinary live two-form norm and gives gradient \(d_A^{*g}[(4Q-\frac23\operatorname{tr}(Q^2)I)F_A]\) in the native ordinary one-form \(L^2\) pairing. The negative of this gradient is \(V(A)\) in the native clock. Since \(4Q-\frac23\operatorname{tr}(Q^2)I=2I+4q-\frac23|q|^2I\), the constant term contributes \(2d_A^{*g}F_A=0\) by Bianchi and self-duality. Thus \(V(A)=-4d_A^{*g}[(q-|q|^2I/6)F_A]\). Along each smooth original path this gives

\[
 \partial_s\mathcal E(A(s))=-\int_M|\partial_s A|_g^2\,dV_g\le0.
                                                                    \tag{8}
\]

For each orientation-preserving equivariant automorphism, \(Q\) is pulled back and conjugated by the internal isometry, while \(\mu_A\) is pulled back on the base. It follows that \(\mathcal E\) is invariant, including under the time-dependent maps of (6) when evaluated at each fixed time. Hence

\[
        0\le\mathcal E(\mathcal A_n(s))
            =\mathcal E(A_n^{\rm loc}(s))
            \le\mathcal E(A_n)<1/n,qquad 0\le s\le\theta .       \tag{9}
\]

At any fixed \(0<s<\theta\), the smooth convergence of the adjusted pairs in the definite tube gives convergence of \(Q\), the volume form, and the integral defining \(\mathcal E\). Equation (9) gives \(\mathcal E(\mathcal A_*(s))=0\). The nonnegative smooth density against the positive live volume vanishes identically. In particular \(A^\dagger=\mathcal A_*(s_0)\) is smooth and perfect. This uses small total initial energy only through (9) and does not use an initial supremum estimate for \(q_n\).

## Round identification and the fixed original splice

Perfection gives \(T=0\), so compatibility identifies \(A^\dagger\) with the chiral Levi–Civita connection of its smooth metric \(g^\dagger\) through the polar isometry \(\sigma^\dagger=-F_{A^\dagger}^\sharp\). Here \(F^\sharp\) contracts a native internal vector into the curvature. The native chiral block is \(\frac12|F_{\Gamma^+}+\sigma^\dagger|\), and \(F_{A^\dagger}=-\sigma^\dagger\), so \(W^+=0\), \(\operatorname{Ric}_0=0\) and \(s=6\). The signature identity in E01C with ordinary Hilbert–Schmidt Weyl-block norms is

\[
  12\pi^2\operatorname{sign}(M)
       =\int_M\bigl(|W^+|_{\rm op,HS}^2-|W^-|_{\rm op,HS}^2\bigr)
                                                              dV_{g^\dagger}.
\]

The signature is zero because the real middle cohomology is zero. Thus \(W^-=0\) as well, and the full curvature operator is \((s/12)I=I/2\). This uses Hirzebruch's *The signature theorem: Reminiscences and recreation*, §4, p. 11, (16) and the curvature normalization as inspected and derived in E01C. [Native geometric assessment][geo] · [E01C source and contraction][sig]

For the global identification, the constant-curvature Jacobi equation on a sufficiently small normal ball gives the polar metric \(dr^2+2\sin^2(r/\sqrt2)g_{S^3}\), hence orientation-preserving local isometries to \(S^4_{\sqrt2}\). On connected overlap pieces these transitions extend to unique sphere rotations by matching the image and oriented orthonormal frame at one point, with agreement propagated along normal neighborhoods. Their cocycle allows development along paths. Chart subdivision in a path homotopy and simple connectivity make the development single valued, as in the E01C argument. Compactness of \(M\) makes the local isometry a proper covering onto the connected sphere, and the simply connected target makes it one-sheeted. This gives a smooth orientation-preserving isometry \(f:(M,g^\dagger)\to(S^4_{\sqrt2},g_0)\). The inspected E01C developing input is the conformal argument in Schoen–Yau, pp. 47 and 49–50. The local transitions here are isometric because of the Jacobi formula. [E01C development and covering][sig]

Let \((P_0,A_0,F_0)\) be the fixed standard native round chiral pair, and \(\sigma_0:E_0=\operatorname{ad}P_0\to\Lambda^+_{g_0}\) its polar isometry. The forward two-form isometry over \(f\) is \(((df_x)^{-1})^*\). Hence the exact map of adjoint fibers over \(f\) is

\[
 E_x\longrightarrow (E_0)_{f(x)},\qquad
             (\sigma_0)_{f(x)}^{-1}\,((df_x)^{-1})^*\,\sigma^\dagger_x. \tag{10}
\]

It preserves the native internal orientations and induces a smooth equivariant bundle isomorphism \(\Phi:P\to P_0\) by the faithful adjoint frame representation. Chiral Levi–Civita naturality gives \(\Phi^*(A_0,F_0)=(A^\dagger,F_{A^\dagger})\).

The adjusted pairs at \(s_0\), pushed to \(P_0\) by \((\Phi^{-1})^*\), tend smoothly to \((A_0,F_0)\). Thus all sufficiently late terms lie inside the assessed fixed round pair-value basin. Let \(B_n(t)\), \(t\ge0\), be its global smooth **original** basin solution from \((\Phi^{-1})^*\mathcal A_n(s_0)\). Put

\[
          L_n=\Phi\circ j_n(s_0)\circ h_n^{-1}:P\longrightarrow P_0.  \tag{11}
\]

The global tail \(L_n^*B_n(s-s_0)\) starts at the actual original value in (6). It solves the original equation by naturality under a time-independent bundle map. Smooth uniqueness on the nonempty overlap \([s_0,\theta]\) identifies the head and tail, so the path splices smoothly in the original identification. The map \(L_n\) itself therefore identifies the actual datum at \(s_0\) with the fixed basin. No estimate on derivatives of a sequence of recovering maps enters. [Original local comparison][seq] · [Round value basin][basin]

The assessed smooth limiting recovery result gives a smooth orientation-preserving equivariant automorphism \(b_{n,\infty}\) of \(P_0\) such that the round-basin path and its curvature converge smoothly and exponentially to \(b_{n,\infty}^*(A_0,F_0)\). Pulling this back by \(L_n\) gives the fixed original limit \((b_{n,\infty}\circ L_n)^*(A_0,F_0)\). For each datum, fixed smooth pullback and the time translation preserve exponential convergence in every fixed smooth norm with datum-dependent constants. The entire property eventually holds for the supposed bad sequence, a contradiction. This proves the non-effective threshold in (1), with dependence exactly on the specified fixed family parameters. [Smooth limiting recovery assessment][limit]

## Intrinsic small-\(\Psi\) corollary

Let \(\varepsilon_{171}>0\) be the assessed E171 threshold for \(\sup\mathcal G\). If \(C\sup_M\Psi\le\varepsilon_{171}\), then \(|q|\le72\mathcal G\le72C\sup_M\Psi\) pointwise and \(\operatorname{Ric}\ge(3/4)g\). The latter gives diameter at most \(2\pi\) by the minimizing-geodesic index form. In fact, along a minimizing segment of length \(L\) its three parallel normal sine variations have total index at most \(3\pi^2/(2L)-3L/8\) and total index at least zero. Consequently \(L^2\le4\pi^2\). The energy bound is \(\mathcal E(A)\le v_P(72C\sup_M\Psi)^2\). [Assessed E171][small]

Take \(P_0=1\) in native units and \(D_0=2\pi\), and choose any admissible \(\delta_0=\delta(M,P,1,2\pi)>0\) just proved. If \(v_P>0\), a sufficient threshold is

\[
 \epsilon(M,P)=\tfrac12\min\left\{1,\frac{\varepsilon_{171}}{C},
                     \frac{\sqrt{\delta_0/v_P}}{72C}\right\}.       \tag{12}
\]

Then \(\sup_M\Psi<\epsilon(M,P)\) implies the static smallness threshold, the two geometric bounds, and the strict energy inequality in (1). When \(v_P\le0\), no positive definite data of the stated sign exist and the corollary is vacuous. A positive \(v_P\) by itself leaves possible empty classes as well. The corollary obtains the same global and positive-time conclusions by applying (1), rather than supplying a second dynamical proof. All constants are in the native normalization.

## Evidence boundary and frozen inputs

This fixed-family result supplies positive-time basin entry for existing smooth data. No time-zero orbit value approximation, uniform positive entry time, initialization, or uniform threshold across bases/bundles is asserted. The class may be empty. No new source was inspected and there is no new PDE estimate. The inherited E174 note remains a template whose conclusion was not a proof premise.

| Input | SHA-256 |
| --- | --- |
| [E177 request][req] | `1d6487a97f9e481cad4787867716efa796acda183d85398229f2f0ae116c84ff` |
| [B88][b88] | `da91bb21677d7e41a2cd21386ce52bedd361b9207a25a066663f617250f5e0cd` |
| [E174 template][template] | `aa3fc40ff05bf3cc2abc5c0862176301915efb52a667e2a7bd7f7428ffd54e56` |
| [E171/E173 small-strain assessment][small] | `f8a1e2e86f0fdcd0d7b29ad915e6a249d6caed13d753befd140920a22cd12a9d` |
| [E168/E169 metric assessment][metric] | `6dbf39d42f980e1d04eeeba60cfad575d16e1a13a91c5ffb7531bd77ead04d1f` |
| [E157–E159 geometric assessment][geo] | `b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52` |
| [E148][seq] | `526fa0a48fe414989549172efc4c2c71b3093b8a4b22ae537c2035e0709ee894` |
| [E138–E143 local assessment][local] | `10909e6810beed40a4b87efd00f21637d1a6b12b102bc9f3d6b84648a7124f1e` |
| [E49–E52 stability assessment][basin] | `f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee` |
| [E76/E77 limiting recovery assessment][limit] | `c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1` |
| [E01C][sig] | `9b725bd3e3d56248a7276dadf712deb976518210bc9596f309ed42f0df28f0ca` |

[req]: ../research-progress/handoffs/SP4-CME-E177_REQUEST_v1.md
[b88]: ../brainstorm/notes/B88_COMPACT_FAMILY_DEFECT_ENERGY_GAP_20261122.md
[template]: 174_CONDITIONAL_INTRINSIC_SMALL_STRAIN_ROUND_ENTRY_20261122.md
[small]: ../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md
[metric]: ../reviews/E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md
[geo]: ../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md
[seq]: 148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md
[local]: ../reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md
[basin]: ../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[limit]: ../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
[sig]: ../reviews/E01C_AUDIT_20261122.md
