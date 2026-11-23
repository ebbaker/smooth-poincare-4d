# E205 — Conditional convergence from late spectral pinching

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E derivation under B99, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I authored E179 and E203. The compactness and round-tail arguments below use the lead-assessed E179 with the separate E181 audit. The stationary gap remains an explicit premise, as dispatched.

## Statement and normalization

Fix a closed connected smooth oriented homotopy four-sphere \(M\) and a smooth principal \(SO(3)\) bundle \(P\to M\). Use the native negative-Killing pairing on \(E=\operatorname{ad}P\), the positive Riemannian reconstructed metric \(g_A\), and native time. In internal orthonormal frames,
\[
 \mu_A=dV_{g_A}=\tfrac13\langle F_A\wedge F_A\rangle,\qquad
 Q_{ij}=\frac{F_i\wedge F_j}{\mu_A},\qquad
 q=Q-I,\qquad \rho(Q)=\frac{\lambda_{\max}(Q)}{\lambda_{\min}(Q)}.
\]
In the positive definite class \(Q>0\) and \(\operatorname{tr}Q=3\). Use E179's real density \(\Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2\), where \(T_X=(Q^{-1/2}D_X^AQ\,Q^{-1/2})_0/2\), \(\mathcal R_X(f)=P_{f^\perp}T_X f\), and \(f\) runs over the unit internal sphere with area \(4\pi\). The derivative uses the chiral Levi–Civita horizontal lift and the live covariant derivative on the base covector slot. [E179][e179]

Assume \((H_{\rm gap})\). Every smooth positive-plane, round-compatible definite critical connection on the stated closed base and bundle satisfying \(\sup_M\rho(Q)\le9/4\) is perfect, meaning \(Q=I\). Criticality is under smooth independent connection variations of the native defect energy
\[
 \mathcal E(A)=\int_M |q|^2\,dV_{g_A}.
\]

Let \(A(t)\), \(t\in[0,T_*)\) with \(0<T_*\le\infty\), be a supplied maximal smooth original native flow on this \(P\), with positive planes and round-compatible sign. Suppose a sequence \(t_n\uparrow T_*\) satisfies, for finite \(P_0\ge0\) and \(D_0>0\),
\[
 \sup_M\Psi(A(t_n))\le P_0,\qquad
 \operatorname{diam}(M,g_{A(t_n)})\le D_0,\qquad
 \limsup_{n\to\infty}\sup_M\rho(Q(A(t_n)))\le\tfrac94 .          \tag{1}
\]
Then \(T_*=\infty\) and the actual original connection and curvature pair converges smoothly and exponentially to one fixed smooth pullback of the standard native round pair. The native exponent is the assessed round rate \(\alpha=\lambda_1(G_0)/2>0\), with \(\lambda_1(G_0)=\inf\operatorname{spec}G_0\) for the fixed positive round stability operator. Constants at each fixed spatial order depend on the smooth datum and the fixed identifications used for the estimate. [Round recovery assessment][limit]

For the conditional provenance of \(H_{\rm gap}\), E203 uses the older pairing \(\delta\) and a fixed \(K>0\) with \(\mu_{\rm old}=2K^2dV_{\widehat g}\). The native pairing is \(2\delta\), so the curvature components in its orthonormal internal frames are \(\sqrt2 F_i^{\rm old}\). This doubles both the wedge numerator and \(\mu\), leaving \(Q\), \(\rho\), the curvature plane and the round-compatible sign unchanged. Thus
\[
 \mu_A=2\mu_{\rm old},\quad g_A=2K\widehat g,\quad
 t_{\rm native}=2K t_{\rm old},\quad \mathcal E=2\mathcal P_{\rm old}.
\]
The energy scaling is an identity on the open definite class, with \(K\) held fixed. Vanishing under every smooth variation is equivalent in the two conventions. In particular E203's ratio conclusion under \(H_{\rm ratio}\) would furnish \(H_{\rm gap}\) with the stated native normalization. This implication retains \(H_{\rm gap}\) throughout. E202 and E203 were unassessed at dispatch. [Foundation assessment][foundation] · [Conditional stationary theorem][e203]

## Common interval, adjusted limit and criticality

The first two bounds in (1) alone rule out \(T_*<\infty\) by the original-flow extension part of assessed E179/E181. This proves \(T_*=\infty\) before a positive-time shift is introduced. The same assessed result gives, on a subsequence renamed \(n\), smooth equivariant bundle automorphisms \(h_n:P\to P\) over smooth orientation-preserving diffeomorphisms and uniform convergence in a fixed smooth affine pair background,
\[
 (\widetilde A_n,\widetilde F_n)=h_n^*(A(t_n),F_{A(t_n)})
             \longrightarrow (A_*,F_*).                       \tag{2}
\]
The pair on the right is continuous, distributionally compatible, positive and of the same sign. Choose a common compact positive value tube about its graph and fix the common value radii. Then choose one smooth compatible reference inside the required radii and take its common time \(T_{\rm ref}>0\). Discard finitely many normalized pairs to fit the same datum ball. Set \(\theta=3T_{\rm ref}/4\) and \(s_0=T_{\rm ref}/2\). All actual shifted times lie in the original lifespan. [E179][e179] · [E181 audit][e181] · [Stationary accumulation assessment][assess]

Write \((\mathcal A_n,\mathcal F_n)\) for the smooth adjusted paths of the normalized data and \((\mathcal A_*,\mathcal F_*)\) for the compatible adjusted path of the continuous data. This path is smooth and positive for \(0<s<T_{\rm ref}\), with strong \(C^0\) pair trace \((A_*,F_*)\) as \(s\downarrow0\). The adjusted pairs converge smoothly on compact interior strips. The strong \(C^0\) trace is part of the assessed closed-slab completion used in the common comparison. For each smooth datum separately, its smooth recovery \(j_n:[0,\theta]\to\operatorname{Aut}(P)\) satisfies \(j_n(0)=\mathrm{id}\) and \(j_n'=-\xi_n\circ j_n\). The maps preserve base orientation. The assessed equation and original smooth uniqueness give
\[
 A(t_n+s)=(j_n(s)\circ h_n^{-1})^*\mathcal A_n(s)
 \qquad (0\le s\le\theta),                                    \tag{3}
\]
and the same for curvatures by compatibility. [Uniform value-radius assessment][local] · [E148 common comparison][e148] · [E179/E181][assess]

The native original vector field is \(V(A)=-4d_A^{*g_A}[(q-|q|^2I/6)F_A]\). The native gradient identity gives \(D\mathcal E_A[V(A)]=-\int_M |V(A)|^2_{g_A}\,dV_{g_A}\). Let \(\mathcal E_\infty\) be the nonnegative limit of the decreasing original energy as \(t\to\infty\). Invariance of the energy in (3) gives
\[
 \mathcal E_\infty\le\mathcal E(\mathcal A_n(s))
     =\mathcal E(A(t_n+s))\le \mathcal E(A(t_n)),\qquad 0\le s\le\theta .
\]
The upper bound tends to \(\mathcal E_\infty\), so smooth interior convergence yields \(\mathcal E(\mathcal A_*(s))=\mathcal E_\infty\) for \(0<s<\theta\). On this interval the limiting exact adjusted equation reads
\[
 \partial_s\mathcal A_* = V(\mathcal A_*)+\mathcal L_{\xi_*}\mathcal A_* ,
\]
with a smoothly time-dependent invariant field \(\xi_*(s)\) on every compact interior strip. Freezing the generator at one positive time, the energy is invariant under its local identity-start flow. Its derivative therefore vanishes in the \(\mathcal L_{\xi_*}\mathcal A_*\) direction. Combining this with the gradient identity and the constant energy gives \(\int_M |V(\mathcal A_*)|^2\,dV_{g_{\mathcal A_*}}=0\), hence
\[
     V(\mathcal A_*(s))=0,\qquad
     \partial_s\mathcal A_*(s)=\mathcal L_{\xi_*(s)}\mathcal A_*(s)
                       \quad (0<s<\theta).                    \tag{4}
\]
These are the assessed E179/E181 conclusions before imposing the last bound in (1). [Criticality and energy assessment][assess]

## Transfer of the closed spectral bound

Let \(h:P\to P\) be smooth equivariant over an orientation-preserving diffeomorphism \(\bar h\), with forward isometric adjoint map \(h_E(x):E_x\to E_{\bar h(x)}\). Pullback of the curvature as an adjoint-valued ordinary two-form uses \(h_E(x)^{-1}\) in the value slot. Hence \(\mu_{h^*F}=\bar h^*\mu_F\), and division of the matrix wedge numerator by this same pulled-back volume gives
\[
 Q(h^*F)(x)=h_E(x)^{-1}Q(F)(\bar h(x))h_E(x).
\]
Thus \(\rho(Q(h^*F))=\rho(Q(F))\circ\bar h\), and the supremum is identical because \(\bar h\) is surjective. This argument is algebraic for continuous positive \(F\) as well. For smooth connections compatibility gives \(F_{h^*A}=h^*F_A\).

To pass (1) through (2), choose any fixed smooth positive volume \(\nu\) on \(M\) and write \(N_{ij}(F)=F_i\wedge F_j/\nu\) in native orthonormal frames. Then \(Q(F)=3N(F)/\operatorname{tr}N(F)\), independently of \(\nu\). On the common compact positive tube about the trace, \(\operatorname{tr}N\) and \(\lambda_{\min}(Q)\) have positive minima. The polynomial wedge and this quotient give uniform \(Q\) convergence for uniformly converging curvature forms in the tube. The extreme eigenvalues of a symmetric matrix are \(1\)-Lipschitz in operator norm by the min and max Rayleigh quotients. The positive denominator for \(\rho\) therefore gives uniform convergence of the ratios as well. For example, with \(m_0=\inf\lambda_{\min}(Q)>0\) on the tube and \(\lambda_{\max}\le3\),
\[
 |\rho(Q_1)-\rho(Q_2)|
 \le (m_0^{-1}+3m_0^{-2})\|Q_1-Q_2\|_{\rm op}.
\]
Taking suprema changes the error by at most the uniform norm. Along the extracted subsequence, (2) and pullback invariance now give
\[
 \sup_M\rho(Q(F_*))
 =\lim_{n\to\infty}\sup_M \rho(Q(\widetilde F_n))
 \le\tfrac94.                                                 \tag{5}
\]
Here the original limsup bounds the limit on the subsequence. By the same tube argument and the strong \(C^0\) trace, \(\sup_M\rho(Q(\mathcal F_*(s)))\to\sup_M\rho(Q(F_*))\) as \(s\downarrow0\).

Fix \(0<\epsilon<s_0\). On \([\epsilon,s_0]\), solve
\[
 k_\epsilon'(s)=-\xi_*(s)\circ k_\epsilon(s),
 \qquad k_\epsilon(\epsilon)=\mathrm{id}.
\]
The total space \(P\) is compact because \(M\) and \(SO(3)\) are compact. The smooth field on this closed strip has a smooth flow there, with inverse obtained by reverse integration. Invariance under right translations and ODE uniqueness imply equivariance, so the maps descend to a base isotopy starting at the identity. They preserve orientation. By (4) and the pullback differentiation formula,
\[
 \frac{d}{ds}\bigl(k_\epsilon(s)^*\mathcal A_*(s)\bigr)
  = k_\epsilon(s)^*
          \bigl(\partial_s\mathcal A_*(s)-\mathcal L_{\xi_*(s)}\mathcal A_*(s)\bigr)
  =0 .
\]
Consequently \(k_\epsilon(s_0)^*\mathcal A_*(s_0)=\mathcal A_*(\epsilon)\), and their curvatures obey the same identity. Spectral naturality gives equal suprema at \(\epsilon\) and \(s_0\). The same calculation for any two times in \((0,\theta)\) shows that the supremum is constant there. Sending \(\epsilon\downarrow0\) in the **scalar** supremum equality identifies this constant with \(\sup_M\rho(Q(F_*))\). In particular
\[
          \sup_M\rho(Q(\mathcal A_*(s_0)))\le\tfrac94 .          \tag{6}
\]
Only integration on intervals bounded away from zero and convergence in pair values at the trace enter (6). The argument concerns the critical adjusted limit and imposes (1) only at the original unshifted times.

## Perfection and the fixed original tail

Apply \(H_{\rm gap}\) to \(A^\dagger=\mathcal A_*(s_0)\). It is smooth, lies in the same definite sign class, is critical by (4), and satisfies (6), including the boundary value. Hence \(Q(A^\dagger)=I\) and \(\mathcal E_\infty=\mathcal E(A^\dagger)=0\). This supplies the entry condition of the assessed zero limiting energy argument. [E179/E181][assess]

For the map order, let \(K_n=h_n\circ j_n(s_0)^{-1}\). Then (3) gives
\[
 K_n^*(A(t_n+s_0),F_{A(t_n+s_0)})
   =(\mathcal A_n(s_0),\mathcal F_n(s_0))
   \longrightarrow (A^\dagger,F_{A^\dagger}) \quad\text{smoothly}.
\]
The assessed perfect-pair identification applies at \(s_0\). The positive block identity gives \(W^+=0\), \(\operatorname{Ric}_0=0\) and scalar curvature \(6\) in the native metric. Zero signature and the signature formula force \(W^-=0\). The assessed constant-curvature development of this smooth compact simply connected base gives an orientation-preserving isometry \(f:M\to S^4_{\sqrt2}\). The polar identifications give \(\Phi:P\to P_{\mathrm{rd}}\) with adjoint map \(\sigma_0^{-1}((df_x)^{-1})^*\sigma^\dagger\) over \(f\) and \(\Phi^*(A_0,F_0)=(A^\dagger,F_{A^\dagger})\). [Perfect-pair identification in E179/E181][assess]

Transfer the actual shifted pair by \((\Phi^{-1})^*K_n^*\) to the round bundle. Its smooth convergence to \((A_0,F_0)\) puts it in the fixed round connection-and-curvature value basin for all sufficiently late \(n\). Choose one such \(n\) and fix \(t_b=t_n+s_0\), \(L=\Phi\circ K_n^{-1}=\Phi\circ j_n(s_0)\circ h_n^{-1}\). The transferred datum is \((L^{-1})^*(A(t_b),F_{A(t_b)})\). If \(B(u)\) is its original round-basin solution, then \(A(t)=L^*B(t-t_b)\) for \(t\ge t_b\) by naturality and smooth original uniqueness recentered at common slices. The same equality holds for curvatures. The assessed round result gives a fixed smooth equivariant orientation-preserving \(b_\infty\) of \(P_{\mathrm{rd}}\) and exponential convergence of \((B,F_B)\) to \(b_\infty^*(A_0,F_0)\). The original limit is therefore \((b_\infty\circ L)^*(A_0,F_0)\). A fixed smooth pullback and a fixed time translation preserve \(\alpha=\lambda_1(G_0)/2\) in native time. In any fixed smooth background on \(P\), each \(C^k\) pair error is bounded by a datum-dependent constant times \(e^{-\alpha(t-t_b)}\) for all sufficiently large \(t\). [E179 fixed-tail transfer][assess] · [Smooth limiting recovery][limit]

The result is conditional on \(H_{\rm gap}\) and presupposes the supplied trajectory and its selected sequence. The spectral comparison uses a time-zero value trace and positive-time maps on the limiting adjusted path only. The decay refers to the actual original flow in its fixed identification. No new primary-source inspection or numerical work was used.

## Input identities

| Input | Verified SHA-256 |
| --- | --- |
| [E205 request][request] | 8d04e3952a2bed5b36ef81cbb875f4162a30bbce21972071e4f32ec9459fa8f6 |
| [B99][b99] | 5edfaea404f188ebb96ed51f96b76146c7f6410bffa8991a439666f3fca02a0d |
| [E179][e179] | 7bc0ab37b5b6a787159aaaede0aceed413306049925d965b92fbc3436f7bd5da |
| [E179/E181 assessment][assess] | 0c9eb889bb10092e631fb3bea7d06e0120934e6a80682e9f3a05b2d1ff7d3881 |
| [E181 audit][e181] | faceb91fb05e65a0f71f92749bf8a4f7fb18e0a7f6c3949d65ab042cae7e20a4 |
| [E203][e203] | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [E01 foundation assessment][foundation] | 83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6 |
| [E138–E143 assessment][local] | 10909e6810beed40a4b87efd00f21637d1a6b12b102bc9f3d6b84648a7124f1e |
| [E148][e148] | 526fa0a48fe414989549172efc4c2c71b3093b8a4b22ae537c2035e0709ee894 |
| [E76/E77 assessment][limit] | c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1 |

[request]: ../research-progress/handoffs/SP4-CME-E205_REQUEST_v1.md
[b99]: ../brainstorm/notes/B99_LATE_SPECTRAL_PINCHING_CONVERGENCE_20261122.md
[e179]: 179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md
[assess]: ../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md
[e181]: ../reviews/E181_STATIONARY_ACCUMULATION_AUDIT_20261122.md
[e203]: 203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md
[foundation]: ../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md
[local]: ../reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md
[e148]: 148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md
[limit]: ../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
