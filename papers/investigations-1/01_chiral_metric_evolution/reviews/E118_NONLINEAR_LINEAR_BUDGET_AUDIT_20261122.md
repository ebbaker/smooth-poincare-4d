# E118 — Audit of the nonlinear finite-window linear-budget test

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E42, E84 and E112. The frozen E118 request's statement that I did not author E42 is a provenance error. I did not author E115, E50, E63 or E114. The independence of this audit concerns E115's new derivative and limiting argument. E42, E84 and E112 are assessed inherited inputs. [Request][req], [E115][e115], [return and verified hashes][ret].

## Disposition

**Pass at E115's stated scope.** For the smooth original Fine flow on the standard oriented round \(S^4\) and its positive chiral bundle, the finite-window argument excludes a uniform whole-time budget upper bound linear in the initial live \(L^4\) strain on any fixed positive value and strain neighborhood inside the established smooth basin. The proof works at fixed finite \(N\) through the derivative limit, then uses the divergence of the linearized ratio as \(N\to\infty\). I found no missing mathematical premise in this passage. The other five frozen inputs, B62 and the E112/E114 acceptance record matched the versions in the return. [B62][b62], [E114][e114], [lead acceptance][a112].

## Fixed scales, clock and compatible data

Fix \(G=g^{\rm F}_{A_0}\) of curvature \(1/2\), the negative-Killing bundle metric and native time \(\tau\). In the two manuscript conventions \(G_A=c\widehat g_A\) and \(d\tau=c\,dt\), where \(c=2K\) is constant. The normalized defect and strain endomorphisms have the same components under the corresponding isometric change of internal frames. A uniform rescaling of the internal metric leaves the Hilbert–Schmidt norm on endomorphisms unchanged. Metric rescaling through \(c\) leaves Levi-Civita unchanged, assigns a factor \(c^{-1/2}\) to each covariant base slot, and assigns \(c^2\) to volume. Thus \(|\nabla^A T|\) and \(|T|^2\) pick up \(c^{-1}\) and that factor cancels the time factor. Similarly \(|T|^4dV_{G_A}\) and the initial live \(L^4\) norm agree across the conventions. The E50 head is posed in native time. [E84, native clock][e84], [E50, setting and recovery][e50].

Fix the common native E42 time \(\mathcal T>0\) and E50 splice \(\tau_s=\mathcal T/2\). Take E112's ratio \(R\), heat-scale window \([\alpha,\beta]\), and all its fixed normal-ball constants. Decrease the upper radius scale \(b_*\) so that the largest native window endpoint \(\beta(b_*R^{-1})^2/4<\tau_s/2\). E112's own-scale kernel error decreases with \(b_*\), its off-scale bounds are uniform in the ratios at all smaller radii, and its damping is bounded below by a positive constant on the new windows. The choices consequently precede \(N\) and preserve the uniform lower and upper constants in E115 (2). For \(r_j=b_*R^{-j}\), put
\[
 W_N=\bigcup_{j=1}^{N}[\alpha r_j^2/4,\beta r_j^2/4],\qquad
 I_N=[\alpha r_N^2/8,\tau_s/2].
\]
Every window lies in the fixed-for-that-\(N\) compact strip \(I_N\) inside the recovered head. The factor \(1/4\) is exactly the heat-to-native time conversion \(s=4\tau\), independently of the earlier \(t\)-to-\(\tau\) metric convention. [E112, native windows and scale choices][e112].

For each finite \(N\), let \(A_{{\rm in},\varepsilon}=A_0+\varepsilon a_N\). Its centered pair is precisely
\[
 u_\varepsilon=\left(\varepsilon a_N,\,
      \varepsilon d_0a_N+\tfrac{\varepsilon^2}{2}[a_N\wedge a_N]\right),
 \qquad v_N=\left.\partial_\varepsilon u_\varepsilon\right|_0
                 =(a_N,d_0a_N).
 \tag{1}
\]
It is polynomial in the fixed \(C^0\) pair space and remains smooth and compatible, with definite curvature for sufficiently small \(|\varepsilon|\). Both value differences go to zero for each fixed \(N\). Hence the curve lies in the E42 solution neighborhood and the established smooth E50 basin for sufficiently small \(|\varepsilon|\), even if the allowable radius is reduced. The E50 stable hypothesis is discharged by the assessed E49/E50 combination. [E42, compatible passage][e42], [E49/E50 assessment][a50].

## Positive-time Taylor limit and trace

Write \(\mathscr D=C^0(S^4;\mathcal W)\) for the fixed pair space and \(\mathscr X=X_{\mathcal T}^{\circ}\) for E42's solution completion. Its supremum component controls the continuous representative on the closed cylinder. E42 gives the joint Fréchet smooth map \(\Psi(z,u)\in\mathscr X\) for the lifted pair, where \(z\) is the finite-dimensional flow parameter. E63 (2)–(5) gives a product neighborhood with a compact parameter ball and one open datum ball, on which \(\Psi(z,u)=\mathcal T_z U(u)\) for the spatial lift. Stationarity implies \(\Psi(z,0)=0\) there. The derivative argument uses this joint map, with the E63 inverse patches to read spatial derivatives. [E42, positive-time smoothness][e42], [local assessment][a42], [E63 (2)–(8)][e63], [smoothing assessment][a63].

For each finite \(k\), \(G_\gamma(z,u)=D_u\partial_z^\gamma\Psi(z,u)\) is operator-norm continuous for \(|\gamma|\le k\). Uniform convergence \(G_\gamma(z,u)\to G_\gamma(z,0)\) on the compact parameter ball as \(u\to0\) follows by contradiction with a convergent parameter subsequence and joint continuity at its limit. Uniform boundedness for small \(u\) follows from the same compactness and continuity. The Banach-space fundamental theorem along \(\theta u_\varepsilon\) gives
\[
 \frac{\partial_z^\gamma\Psi(z,u_\varepsilon)
            -\partial_z^\gamma\Psi(z,0)}{\varepsilon}
 =\int_0^1 G_\gamma(z,\theta u_\varepsilon)
                    [u_\varepsilon/\varepsilon]\,d\theta
 \longrightarrow G_\gamma(z,0)[v_N]
 \tag{2}
\]
in \(\mathscr X\), uniformly in \(z\), using (1). This checks E115 (4) as a genuine first-order Taylor limit even though E63's standalone bound is Lipschitz.

For \(I\Subset(0,\mathcal T)\), the fixed E63 local inverse expresses \(U_\varepsilon(\tau,y)\) as inverse transport applied to \(\Psi(z_*(\tau,y),u_\varepsilon)(\tau,x_*)\). Spatial derivatives through order \(k\) use only \(\partial_z^\gamma\) for \(|\gamma|\le k\), bounded evaluation on \(\mathscr X\) and smooth patch coefficients bounded on compact subpatches. Finite covering gives convergence of \(U_\varepsilon/\varepsilon\) in \(C(I;C^k)\). Continuity in \(\tau\) of each evaluated term follows by uniform boundedness of evaluation on changes in its argument and continuity of a fixed representative as the time point moves. The limit is the fixed \(U'_N=D_u\Psi(0,0)[v_N]\), since the unlifted evaluation already determines the value limit. This verifies E115 (5) for \(k=2\) and its asserted extension to all fixed finite orders. One may choose \(k=3\) when differentiating the equation below. Each order and positive strip may have its own estimates. From evaluation at time zero, \(\Psi(0,u)|_{\tau=0}=u\), one gets \(U'_N(0)=v_N\) continuously in values. This gives the trace required for the defect equation, with no spatial-derivative limit at \(\tau=0\).

## Adjusted equation and native defect identification

Write \(U'_N=(b_N,B_N)\). The compatible curvature graph at positive times gives \(B_N=d_0b_N\) by the same polynomial expansion as (1), using spatial first-order convergence. The pointwise smooth map from curvature to \(Q\) gives \(q'_N=DQ_{A_0}(b_N)=2\operatorname{tf}L_0 B_N\) there, and its continuous trace at \(\tau=0\) is \(2\operatorname{tf}L_0 d_0a_N\). The last identity uses \(B_N(0)=d_0a_N\) and the smooth algebraic curvature derivative of \(Q\). [E112 (2)][e112].

On the compatible E42 head, E50 (5)–(6) gives
\[
 \partial_\tau\mathcal A_\varepsilon
 =v_{\rm F}(\mathcal A_\varepsilon)
        -R(\xi_{\rm loc}(\mathcal A_\varepsilon),\mathcal A_\varepsilon),\qquad
 R(\phi+\chi_A(X),A)=-d_A\phi-\iota_X F_A.
\]
Here \(\xi_{\rm loc}=-d_A^{*G}(A-A_0)
-\chi_A(S_A^*d_A^{*G_A}d_A(A-A_0))\).
The vertical adjoint is fixed in base metric, so the resulting \(d_A\) correction has at most two \(A\) derivatives. The horizontal term has at most two \(A\) derivatives and one curvature derivative from the live Christoffel and Hodge coefficients. The action contracts its base velocity with curvature. It adds no derivative of the horizontal coefficient. Reconstruction has smooth coefficients in \(F\), and the compatible physical term uses at most its first derivative. This order count allows Taylor limits in \(C(I;C^1)\) for the entire right side if \(k=3\) in (2). Dividing its time-integrated form by \(\varepsilon\) therefore proves the time derivative identity for \(b_N\) on each positive strip, and allows application of the first-order time-independent \(DQ_{A_0}\). [E50 (5)–(6)][e50].

At \(A_0\) both gauge inputs vanish. Their derivative gives the invariant generator
\[
 \xi'_N=-d_0^{*G}b_N
   -\chi_{A_0}\big(S_0^*d_0^{*G}d_0 b_N\big),\qquad S_0X=\iota_XF_0 .
\]
Variations of the operators and horizontal lift on the zero inputs contribute zero. Likewise the derivative of the action with respect to the connection at the zero generator is zero, so the whole correction is \(R(\xi'_N,A_0)\). Naturality makes \(Q(g^*A_0)=I\) throughout the orbit. In differential form \(DQ_{A_0}\) kills \(d_0\phi+\iota_XF_0\), which is exactly the form of the correction up to the action sign. [E112 (2)][e112], [E84 (2)][e84].

In native time the physical field is \(-d_A^{*G_A}[(4Q-\tfrac23\operatorname{tr}(Q^2)I)F_A]\). With \(q=Q-I\), the internal factor is \(2I+4q-\tfrac23|q|^2I\) since \(q\) is trace-free symmetric. The \(2I\) term gives zero on every compatible connection by self-duality and Bianchi. In the terms vanishing at \(A_0\), the variation of the adjoint or of the curvature factor multiplies zero. The physical derivative is precisely \(-4d_0^{*G}(q'_NF_0)\). The accepted native composition of this derivative with \(DQ_{A_0}\) is
\[
 \partial_\tau q'_N=-(4D_0^*D_0+12)q'_N.
 \tag{3}
\]
Its continuous trace is \(DQ_{A_0}(a_N)\), already identified. For the difference \(w\) from E112's heat solution, the positive-time energy identity is \(\frac d{d\tau}\|w\|_2^2=-8\|D_0 w\|_2^2-24\|w\|_2^2\). Applying it from any positive initial time and sending that time down to zero proves uniqueness from the continuous trace. This checks \(q'_N=q_N\) on the head with no clock discrepancy. [E84 (7)][e84], [E112 (3) and accepted composition][e112].

## Live tensors, initial norm and original-flow passage

On \(I_N\), smooth matrix calculus and the \(C(I_N;C^2)\) pair derivative give \(T(\mathcal A_\varepsilon)/\varepsilon\to \tfrac12D_0 q_N=T_N\) in \(C(I_N;C^1)\). The square-root factors in the strain formula multiply \(D_0I=0\) at the base point, and the variation of the connection contributes a commutator with \(I\), also zero. The trace-free projection fixes \(D_0q_N\). Live metric reconstruction gives \(G_{\mathcal A_\varepsilon}\to G\) in \(C(I_N;C^2)\) from curvature convergence. On a strain one-form the covariant derivative differs from \(D_0\) by the internal commutator with \(\mathcal A_\varepsilon-A_0\) and by the Levi-Civita difference acting on the existing one-form slot. Both coefficients tend uniformly to zero. Consequently
\[
 \varepsilon^{-1}\nabla^{\mathcal A_\varepsilon}T(\mathcal A_\varepsilon)
        \longrightarrow D_0T_N
       \quad\text{in } C(I_N;C^0).
\]
The differentiation and one-form slots are both retained, and uniform metric convergence gives uniform convergence of the corresponding pointwise live norms and then their spatial suprema for \(\varepsilon>0\). At the initial slice (1) with fixed smooth \(a_N\) directly gives \(T(A_{{\rm in},\varepsilon})/\varepsilon\to T_N(0)\) uniformly. Uniform metric and volume convergence give the limit of \(\varepsilon^{-1}\|T(A_{{\rm in},\varepsilon})\|_{L^4(G_{A_{{\rm in},\varepsilon}})}\) as \(\|T_N(0)\|_{L^4(G)}\). In particular that slice meets every fixed positive strain threshold for sufficiently small \(\varepsilon\). [E84 (2)–(5)][e84].

For each smooth datum on this curve, E50 recovers the original flow on the entire head at the same native time by the pullback of an orientation-preserving bundle automorphism, with the identity at zero. At each time \(Df\) is an isometry between the pulled-back live metric and the adjusted metric, and the fiber map is a negative-Killing isometry. The exact two-slot derivative law in E84 (4) then gives equality of the two spatial suprema slice by slice. The equality requires only the smooth recovery of each individual curve member at that time. It does not use any perturbation derivative of the recovery maps. [E50 (8)–(10)][e50], [E84 (2)–(5)][e84], [invariance assessment][a84].

Fix arbitrary proposed positive constants \(C,\rho,\eta\) and intersect their neighborhood with the established smooth basin. Suppose \(J(A_{\rm in})\le C\|T(A_{\rm in})\|_{L^4(G_{A_{\rm in}})}\) holds there with the values \(<\rho\) and the strain norm \(<\eta\). For each fixed \(N\), the curves above satisfy those hypotheses for all sufficiently small positive \(\varepsilon\). Discard the nonnegative squared-strain term in \(J\) and restrict to \(W_N\). Using exact recovery and dividing by \(\varepsilon\), the uniform positive-strip convergence and the initial norm limit give, as \(\varepsilon\downarrow0\),
\[
 c_*\sqrt N\le \int_{W_N}\|D_0T_N(\tau)\|_{\infty,G}\,d\tau
         \le C\|T_N(0)\|_{L^4(G)}
         \le C C_*N^{-1/4}.
\]
Here \(c_*,C_*\) are fixed by the E112 scale choices, while the positive-strip limit constants and the datum radius for \(\varepsilon\) can depend on \(N\). Sending \(N\to\infty\) after this inequality contradicts \(C<\infty\). This yields the claimed failure of a uniform **linear** bound on every tested neighborhood. The limiting order leaves the size of nonlinear \(J\) near the reference and the possibility of a general continuity modulus unresolved. The audit uses the assessed local map, recovery and linearized calculation without importing a new primary theorem.

[req]: ../research-progress/handoffs/SP4-CME-E118_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E118_RETURN_v1.md
[b62]: ../brainstorm/notes/B62_LINEARIZATION_TEST_AND_LORENTZ_THRESHOLD_20261122.md
[e115]: ../notes/115_NONLINEAR_LINEAR_BUDGET_TEST_20261122.md
[e112]: ../notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e114]: E114_ROUND_MULTISCALE_BUDGET_AUDIT_20261122.md
[a112]: E112_E114_ROUND_MULTISCALE_ASSESSMENT_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[a42]: E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[a50]: E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[e63]: ../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[a63]: E62_E67_GLOBAL_CRITICAL_ASSESSMENT_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[a84]: E84_E86_INTRINSIC_ORBIT_ASSESSMENT_20261122.md
