# E134 — Audit of the defect-sensitive tail and whole-time bound

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E48, E49 and E84 among the direct inputs and E42, E53 and E102 upstream. I audited E125, E128 and E129 in E127, E130 and E132. I did not author E131, E50, E63, E76, E125 or E129. Independence concerns E131's new finite-order tail argument and the combination with the assessed head. [Request][req], [B68][b68], [E131 derivation][e131], [return and hashes][ret].

**Pass at the fixed smooth round scope.** The E129/E132 assessment discharges the historical head premise in E131. The tail proof uses quantitative finite-order smoothing, E76's graph energy started at the earlier splice, and the exact stable-gauge defect equation. It closes with one fixed reduction of the initial connection/curvature value radius. I found no mathematical correction or additional premise. The frozen E129 and E131 records retain their historical conditional wording. [E131 request][req131], [E131 return][ret131], [assessed head][a129].

## Setting and quantitative splice data

Use the smooth closed oriented round Riemannian \(S^4\), genuine positive perfect chiral reference \(A_0\) on its \(\mathrm{SO}(3)\) bundle, negative-Killing pairing, native reference \(G\) of sectional curvature \(1/2\), and native time \(\tau\). All fixed derivatives \(D_0\) include \(A_0,G\) on the appropriate slots. Write \(v=\|A_{\rm in}-A_0\|_{\infty;0}+\|F_{A_{\rm in}}-F_0\|_{\infty;0}\) and \(\ell=\|T(A_{\rm in})\|_{L^{4,1}(g_{A_{\rm in}}^{\rm F})}\) in the actual live norm and volume with factor-four Lorentz layer convention. On the assessed E42/E50 head use the fixed E129 interval \([0,h]\), \(h\le\mathcal T/4\), and \(q=Q(F_{\widehat A})-I\). The premise now available is \(E_h(q)\le C\ell\), along with the original head budget \(\le C\ell\) at this same \(h\). [E129][e129], [E129/E132 assessment][a129].

On a fixed positive strip containing \([h/2,h]\) inside \((0,\mathcal T)\), take E63 at order ten, comparing the E42 pair \(U=(\widehat A-A_0,F_{\widehat A}-F_0)\) to the stationary zero pair. The datum lies in the fixed strip radius after decreasing only \(v\), as its \(C^0\) norm is at most a fixed multiple of \(v\). Hence \(\sup_{[h/2,h]}\|U\|_{C^{10}}\le C_h v\). On the compact manifold this gives
\[
 \|\widehat A(h)-A_0\|_{H^{10}}\le C_h v .
 \tag{1}
\]
The same estimate controls the head defect coefficients in \(C^6\) for \(A^{ij}=g^{ij}\mathscr L_Q\) and \(C^5\) for the first- and zeroth-order arrays in \(q_\tau=A^{ij}D_{0,i}D_{0,j}q+B^i D_{0,i}q+Cq\). The principal array is a value map, and \(C^5\) of an affine first-jet lower array uses at most \(D_0^6U\), plus the fixed native reaction. Uniform equivalence of \(g\) to \(G\) and positivity of \(\mathscr L_Q\) on symmetric trace-free endomorphisms give uniform pointwise coercivity on differentiated sections, with identity on the extra base factors. None of these bounds uses \(\ell\) or an initial derivative norm. [E63 (1) and Sobolev consequence][e63], [E125 (1) and (9)–(11)][e125], [E125/E127 assessment][a125].

Set \(y_m=\sum_{j=0}^m\|D_0^jq\|_2^2\), using the fixed volume. At derivative order \(0\le j\le5\), commute the ordered \(D_0^j\) through the two leading derivatives. Each adjacent swap replaces two derivatives by a fixed curvature action on the section and the retained base slots. Derivatives outside the swap can hit that curvature and the remaining section derivatives. Thus the commutation error is at most order \(j\) of \(q\). Leibniz terms with a derivative on \(A\) have order at most \(j+1\) of \(q\). The differentiated lower terms have at most that order as well. Coefficients through order \(j\) suffice for these terms. Integrating the leading term against \(D_0^j q\) gives a negative gradient square with the uniform coercivity and a cross term from \(D_0 A\). All cross terms are bounded by a uniform constant times
\((\|D_0^{j+1}q\|_2+\|q\|_{H^j})\|D_0^j q\|_2\).
Young's inequality, followed by summation and adding the \(j=0\) square to the coercive sum with a corresponding \(y_m\) cost, yields
\[
 y_m'+c\,y_{m+1}\le C_m y_m\qquad(0\le m\le5).
 \tag{2}
\]
The finite constants can be chosen uniform on the strip because the above coefficient and fixed curvature bounds are uniform. The supplied head is smooth at every point of this strip. [E131 (3)–(4)][e131].

For \(x=\tau-h/2\), put \(Y=\sum_{m=0}^5\nu_m x^m y_m\), with \(\nu_0=1\) and \(m\nu_m\le c\nu_{m-1}/2\). The positive contribution to \(Y'\) from differentiating \(x^m\) is \(m\nu_m x^{m-1}y_m\), absorbed by the dissipation in (2) at order \(m-1\). Consequently \(Y'\le(\max_m C_m)Y\) and \(Y(0)=y_0(h/2)\). Evaluation at \(x=h/2>0\) bounds \(y_5(h)\) by \(C_h y_0(h/2)\). The block sum \(\mathcal B^{1/2}_{8,1}\hookrightarrow L^8\), followed by finite-volume \(L^8\hookrightarrow L^2\), bounds \(\|q(h/2)\|_2\) by \(C M_h(q)\). Thus
\[
                  \|q(h)\|_{H^5}\le C_h\ell .
 \tag{3}
\]
The argument starts from the order-zero norm at an already positive time, and higher derivatives at that starting slice do not enter its estimate. [E131 (4)–(5)][e131], [assessed head][a129].

## Uniform stable background from the graph energy at time zero

Set \(B(0)=\widehat A(h)\), \(a(s)=B(s)-A_0\) and \(s=\tau-h\). It is a smooth definite datum in the reference component. After a fixed radius decrease, (1) places the \(H^6\) norm of \(a(0)\) inside E49's \(m=6\) basin and its stable solution is smooth through \(s=0\), with
\(\|a(s)\|_{H^6}\le C_6 e^{-\alpha s}\|a(0)\|_{H^6}\).
Use E76's actual tame estimate \(\|N(a)\|_{H^9}\le C_{10}\|a\|_{H^6}\|a\|_{H^{11}}\) on that tube, for the remainder after the entire stable linearization. Write \(G_{\rm st}>0\) for the full linearized stability operator on connection one-forms and \(P_{\rm st}=I+G_{\rm st}\). In this section the graph norms are \(\|P_{\rm st}^{j/2}\cdot\|_2\). The spectral bound \(G_{\rm st}-\alpha I\ge\theta P_{\rm st}\) with \(\alpha=\lambda_1/2\) and \(\theta=(\lambda_1-\alpha)/(1+\lambda_1)>0\) follows on every spectral value \(\lambda\ge\lambda_1\). For \(w=e^{\alpha s}a(s)\), E76's order-ten identity pairs \(P_{\rm st}^{9/2}e^{\alpha s}N(a)\) with \(P_{\rm st}^{11/2}w\). Thus
\[
 \tfrac12(\|w\|_{\mathcal H_{\rm st}^{10}}^2)'
       +\theta\|w\|_{\mathcal H_{\rm st}^{11}}^2
 \le C'_{10}\|a(s)\|_{H^6}\|w\|_{\mathcal H_{\rm st}^{11}}^2 .
\]
Choose one narrower \(H^6\) entry bound inside E49's ball such that \(C'_{10} C_6\|a(0)\|_{H^6}\le\theta/2\). By (1) this is precisely a fixed further reduction of \(v\), and suffices for absorption at every \(s\ge0\) including zero. The initial graph energy is bounded by \(C_h v^2\) from (1). Graph equivalence and the weighted energy yield
\[
                       \|a(s)\|_{H^{10}}\le C_h v e^{-\alpha s}.
 \tag{4}
\]
This argument uses the smooth stable solution in the \(H^6\) basin, the order-ten energy, and the quantified starting energy. It has no need for the constants in E76's later datum-dependent high-order convergence conclusion. [E49 (1)–(2)][e49], [E49/E52 assessment][a50], [E76 (6)–(9)][e76], [E76/E77 assessment][a76].

## The earlier recovery splice

The smooth adjusted local path extends to a fixed time strictly past \(h\) inside \(\mathcal T\). Its smoothness through zero for each smooth datum is the E50 comparison. Recover it by \(g_{\rm loc}(\tau)=j_{\rm loc}(\tau)^{-1}\) with \(j_{\rm loc}(0)=1\), using E50's ODE on this supplied path. Likewise \(g_{\rm st}(s)=j_{\rm st}(s)^{-1}\) with \(j_{\rm st}(0)=1\) recovers the stable path. Both lift orientation-preserving base isotopies. In the left action \(g\cdot A=(g^{-1})^*A\) and product convention by composition, let \(\gamma=g_{\rm loc}(h)\). The recovered stable path is \((\gamma g_{\rm st}(s))\cdot B(s)\), with actual pullback map \(j_{\rm st}(s)\gamma^{-1}\). It matches the local original value \(\gamma\cdot\widehat A(h)\) at \(s=0\). E50's generator cancellation and equivariance of the physical flow under the time-constant left factor give the original equation on both sides and on a right neighborhood of the join. Smooth original uniqueness recentered at the actual smooth definite connection \(\gamma\cdot\widehat A(h)\) identifies both right paths there. The splice is smooth, and successive local uniqueness on common smooth intervals identifies this spliced solution with the existing original solution from the same datum. The original E50 time \(\mathcal T/2\) is therefore unnecessary for the new construction once the quantitative entry (1) is available at \(h\). This checks the exact recovery order and uses individual smooth maps only. [E50 (5)–(10) and overlap uniqueness][e50], [E49/E52 assessment][a50].

## Exact stable defect equation and coefficient inventory

Now \(q=Q(F_B)-I\), \(g=g^{\rm F}_B\), and \(\zeta=F_B-F_0\). In E48 the fixed adjoint is \(\delta_0=d_0^{*G}\); the fixed vector Laplacian \(\Delta_{\rm vec}=\nabla_0^*\nabla_0\) is nonnegative. Equation (1) of E48 has precisely \(B_s=v_{\rm F}-d_B\phi+\iota_uF_B\) with \(\phi=\delta_0 a\), \(u=-\Delta_{\rm vec}S_0^*a\). In the E50 left action \(R(\eta+\chi_B(X),B)=-d_B\eta-\iota_XF_B\), so the generator in \(v_{\rm F}-R(\xi,B)\) is \(\xi=-\phi+\chi_B(u)\), as in E48/E50. This is the stable gauge, with fixed inner operators. [E48 (1), (4)–(5)][e48], [E50 (5), (7)][e50].

The exact native physical terms are E125's \(\mathscr L_Q(\nabla^i\nabla_iq)-12\sqrt{\det Q}\,q+\mathcal N_Q(X,\Xi)\), where \(X=\nabla^B q\) and \(\Xi\) is its stated skew curvature-derivative coefficient. The additional vertical curvature term is \(-d_B^2\phi=[\phi,F_B]\), giving \(+[\operatorname{ad}\phi,q]\) in the normalized Gram and zero density trace. Bianchi gives the horizontal curvature term \(\mathcal L_uF_B+[B(u),F_B]\). Its top-degree wedge matrix velocity is \(\mu u(Q)+Q\mathcal L_u\mu+[\operatorname{ad}B(u),\mu Q]\). Subtracting the density derivative times \(Q\) cancels the entire \(Q\mathcal L_u\mu\), including every \(D_0u\) term. The only surviving defect term is \(+\nabla_u^Bq=u^i((D_0)_i q+[\operatorname{ad}(a_i),q])\), and the adjusted density satisfies \(\mu_s=\mathcal L_u\mu\). Thus the native reaction and exact physical coefficients have the same signs as on the head, while the stable drift uses no third derivative of \(a\) through \(D_0u\). [E125 (2)–(8)][e125], [E125/E127 assessment][a125].

Let \(d(s)=v e^{-\alpha s}\). The fixed four-dimensional embedding \(H^{10}\hookrightarrow C^7\) uses \(10-7>4/2\), and gives \(\|a\|_{C^7}\le C_h d(s)\) from (4). The true curvature difference \(\zeta=d_0a+\tfrac12[a\wedge a]\) is \(O(d(s))\) in \(C^6\). Smooth value reconstruction on the uniform positive tube gives \(g-G,Q-I=O(d(s))\) in \(C^6\), and therefore the \(C^6\) bound for \(P^{ij}=g^{ij}\mathscr L_Q-4G^{ij}I\). The lower inventory at \(C^5\) is as follows.

- The fixed Hessian expansion includes \(a\), \(D_0a\), the double connection action and the live Levi-Civita difference. The last uses one derivative of \(g\), so all coefficient orders fit the verified \(a\) and \(g\) bounds.
- In each physical first-jet product retain one explicit \(X=D_0q+[\operatorname{ad}a,q]\). The other \(X\), or \(\Xi=4\langle\nabla F_m,F_n\rangle_g-2X_{mn}\), is \(O(d(s))\) in \(C^5\) because it uses at most one derivative of \(Q,F\) and the first metric derivative on both form slots. The reference values are zero, including \(\nabla^{A_0,G}F_0=0\). The reaction correction to \(-12q\) is a vanishing-value function of \(Q\).
- The vertical \(\phi\) requires \(a\) through order six. The stable \(u\) and the coefficient on \(q\) from \(a(u)\) require derivatives of \(a\) through order seven, since the inner Laplacian and \(S_0^*\) are fixed and the quotient eliminated \(D_0u\).

Consequently the perturbation in \(q_s+L_{\mathcal V}q=\mathcal R_s q\), with \(L_{\mathcal V}=4D_0^*D_0+12I\), has fixed Hessian/gradient/value coefficient orders \(C^6,C^5,C^5\) bounded by \(C_h d(s)\). The coefficients may be projected onto the fixed symmetric trace-free output space, since that is the target of the exact equation. Treating them as supplied functions of this stable path, the Leibniz rule through four spatial derivatives gives
\[
                     \|\mathcal R_s z\|_{H^4}
                           \le C_h d(s)\|z\|_{H^6}.
 \tag{5}
\]
Only four coefficient derivatives enter (5). The principal term uses six derivatives of \(z\). The first- and zeroth-order terms need at most five. This coefficient argument depends on the stable background (4), separately from the defect energy. [E48, finite gauge order][e48], [E125, fixed Hessian and products][e125], [E131 (9)–(12)][e131].

## Defect graph energy and the live tail estimate

Let \(K=D_0^*D_0\) on the fixed bundle \(\operatorname{Sym}_0E\), \(P_{\mathcal V}=I+L_{\mathcal V}=13I+4K\). For clarity the finite equivalences used in E131 are
\[
 \|P_{\mathcal V}^3 z\|_2\asymp\|z\|_{H^6},\qquad
 \langle P_{\mathcal V}P_{\mathcal V}^2z,P_{\mathcal V}^2z\rangle^{1/2}
       \asymp\|z\|_{H^5}.
 \tag{6}
\]
Indeed, for a fixed product bundle the integrated squared covariant Hessian equals the rough-Laplacian squared norm up to terms bounded by \(C(\|D_0z\|_2^2+\|z\|_2^2)\), by integration by parts and the fixed curvature commutator with \(D_0\). Apply that inequality to \(D_0^j z\), commuting the bundle-specific rough Laplacians through \(D_0^j\), with at most \(j\) derivatives after each curvature commutator. Integration by parts gives \(\|D_0^{j+1}z\|_2^2\le C\|D_0^{j+2}z\|_2\|D_0^j z\|_2\); Young's inequality absorbs the intermediate order. This gives \(\|z\|_{H^{j+2}}\le C_j(\|P_{\mathcal V}z\|_{H^j}+\|z\|_{H^j})\). Induction by orders down to \(L^2\) or the positive-form \(H^1\) yields the forward norm comparisons in (6), using \(P_{\mathcal V}\ge13I\) for the lower powers. For \(H^5\) the terminal quantity of \(P_{\mathcal V}^2z\) is exactly \(13\|P_{\mathcal V}^2z\|_2^2+4\|D_0P_{\mathcal V}^2z\|_2^2\). The reverse bounds follow from the fixed differential orders of \(P_{\mathcal V}\) and \(D_0\). [E131, defect graph equivalence][e131].

Put \(Z=P_{\mathcal V}^2q\) and \(\mathscr E_5=\langle P_{\mathcal V}Z,Z\rangle\). Commuting the fixed \(P_{\mathcal V}^2\) with \(L_{\mathcal V}=P_{\mathcal V}-I\) and pairing against \(P_{\mathcal V}Z\) gives exactly
\[
 \tfrac12\mathscr E_5'
        +\|P_{\mathcal V}Z\|_2^2-\mathscr E_5
   =\langle P_{\mathcal V}^2\mathcal R_s q,P_{\mathcal V}Z\rangle .
\]
By (5) and (6) the absolute right side is at most \(C_h d(s)\|P_{\mathcal V}Z\|_2^2\). Spectral positivity \(P_{\mathcal V}\ge13I\) implies \(\|P_{\mathcal V}Z\|_2^2\ge13\mathscr E_5\), so the left dissipation is at least \(12/13\) of \(\|P_{\mathcal V}Z\|_2^2\). A fixed decrease so \(C_h v\le6/13\) leaves at least \(6\mathscr E_5\) in the energy inequality. Integrating gives \(\mathscr E_5(s)\le e^{-12s}\mathscr E_5(0)\). On the adjusted stable side \(q(0)=Q(F_{\widehat A(h)})-I\) in the same fixed frame, so (3) and (6) yield
\[
                    \|q(s)\|_{H^5}\le C_h\ell e^{-6s}.
 \tag{7}
\]
No quantitative pullback norm comparison for the initial tail defect is involved. [E131 (13)–(14)][e131].

Because \(5-2>4/2\), \(H^5\hookrightarrow C^2\) on the fixed four-sphere. The full live product derivative of \(T=\tfrac12(Q^{-1/2}\nabla^Bq\,Q^{-1/2})_0\) yields
\[
 |T|_g\le C|\nabla^B q|_g,\qquad
 |\nabla^B T|_g\le C\big(|(\nabla^B)^2 q|_g+|\nabla^B q|_g^2\big).
\]
All internal and base slots are live in these expressions. The fixed/live Hessian formula in E125 (10) contains the internal \(a,D_0a\) and moving Levi-Civita difference terms. On this tail they and the norm comparisons are uniformly bounded by (4) and the reconstruction, so the linear terms are at most \(C\|q\|_{H^5}\) in sup norm. In the quadratic derivative term and the squared strain use the independent bound \(\|\nabla^Bq\|_\infty\le C_h d(s)\) on one factor, from the \(C^6\) reconstruction and small \(a\). Use (7) on the other factor. This gives \(C_h\ell e^{-6s}\) for the complete adjusted budget integrand, with no smallness condition on \(\ell\). E84 pulls back both live tensors and the live metric at each recovered time. It equates the spatial supremum of the scalar sum at the same native time without a uniform derivative estimate on the recovery. Integrating (7) in \(s\) therefore gives the original tail budget \(\le C_h\ell\). [E125 (10)][e125], [E84 (3)–(5)][e84], [E131, tail conversion][e131].

## Combined scope

Together with the assessed head, the audit supports a fixed \(v_*>0\) and \(C<\infty\) such that every smooth actual datum with \(v<v_*\) in the native positive round setting has the smooth global original solution with
\[
 J(A_{\rm in})
   =\int_0^\infty\sup_{S^4}
      \big(|\nabla^AT|_{g_A^{\rm F}}+|T|_{g_A^{\rm F}}^2\big)\,d\tau
   \le C \|T(A_{\rm in})\|_{L^{4,1}(g_{A_{\rm in}}^{\rm F})}.
\]
One can choose the radius once to satisfy the assessed head, the fixed positive-strip smoothing radius, the sharpened \(H^6\) entry bound and the defect absorption threshold. These constants depend only on the fixed setup and on its fixed \(h\), never on \(\ell\) or initial higher derivative sizes. Initial smoothness and the fixed-reference connection/curvature value hypothesis remain in force. The result concerns the actual round basin and supplies no arbitrary-manifold initialization or novelty claim. This audit imports no new primary theorem. [Head assessment][a129], [E131][e131].

[req]: ../research-progress/handoffs/SP4-CME-E134_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E134_RETURN_v1.md
[req131]: ../research-progress/handoffs/SP4-CME-E131_REQUEST_v1.md
[ret131]: ../research-progress/handoffs/SP4-CME-E131_RETURN_v1.md
[b68]: ../brainstorm/notes/B68_DEFECT_SENSITIVE_STABLE_TAIL_20261122.md
[e131]: ../notes/131_CONDITIONAL_DEFECT_SENSITIVE_TAIL_20261122.md
[e129]: ../notes/129_CONDITIONAL_INTRINSIC_ENDPOINT_HEAD_20261122.md
[a129]: E129_E132_INTRINSIC_HEAD_ASSESSMENT_20261122.md
[e125]: ../notes/125_ADJUSTED_DEFECT_EQUATION_20261122.md
[a125]: E125_E127_ADJUSTED_DEFECT_ASSESSMENT_20261122.md
[e48]: ../notes/48_FIXED_STABILITY_GAUGE_20261122.md
[e49]: ../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[a50]: E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[e63]: ../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e76]: ../notes/76_HIGH_ORDER_STABLE_LIMIT_20261122.md
[a76]: E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
