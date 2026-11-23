# E132 — Audit of the intrinsic endpoint head estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E53, E42, E102 and E84, and audited the new arguments of E125 and E128 in E127 and E130. I did not author E129, E125, E128, E57, E50 or E119. The independent check concerns E129's head combination, with the inherited results taken at their assessed scope. [Request][req], [B67][b67], [E129 derivation][e129], [return and hashes][ret].

**Pass at the native smooth round head scope.** The E125/E127 and E128/E130 assessments discharge the two formerly pending inputs. I found no missing premise or mathematical correction in E129's combination. The frozen E129 note and return retain their historical conditional wording. The resulting head estimate uses the initial live \(L^{4,1}\) strain through the initial defect and a uniform fixed-reference value radius for absorption. It requires neither a slice equation nor a separate strain threshold and leaves the existing E50 splice intact. [E129 request][req129], [E129 return][ret129], [E125/E127 assessment][a125], [E128/E130 assessment][a128].

## Reference, live input norm and fixed trace space

Use the smooth closed oriented round Riemannian \(S^4\), positive perfect chiral \(\mathrm{SO}(3)\) reference \(A_0\), \(F_0=F_{A_0}\), negative-Killing pairing and native \(G=g(F_0)\) of curvature \(1/2\). Write \(D_0\) for its product covariant derivative on all internal and base slots. On the compatible adjusted head set \(U=(a,\zeta)=(\mathcal A-A_0,F_{\mathcal A}-F_0)\), \(q=Q(F_{\mathcal A})-I\), \(g=g(F_{\mathcal A})\). The endomorphism bundle for \(q\) is the trace-free self-adjoint rank-five bundle. Let \(v=\|a(0)\|_{\infty;0}+\|\zeta(0)\|_{\infty;0}\) in fixed norms and \(\ell=\|T(A_{\rm in})\|_{L^{4,1}(g_{A_{\rm in}})}\) with the actual native live strain norm and volume. The rearrangement convention is
\[
 \|w\|_{(4,1);\nu}=\int_0^\infty s^{-3/4}|w|^*(s)\,ds
                  =4\int_0^\infty \nu(\{|w|>\lambda\})^{1/4}\,d\lambda .
\]
The metric in the modulus and the density \(\nu\) are both live for \(\ell\). E50 recovers with identity at zero, so the adjusted initial defect is precisely \(Q(A_{\rm in})-I\). [E50, initial recovery][e50], [E84 (3)–(6)][e84].

E102 bounds \(\|q(0)\|_{W^{1,(4,1)};0}+\|q(0)\|_\infty\le C\ell\) in the fixed value tube without either slice equation. Its absorption uses small \(\|a(0)\|_\infty\) and the kernel-free reference divergence inverse, independently of \(\ell\). The fixed/live comparison there controls the one-form-valued \(\nabla^A Q\) through the exact strain inversion, and the common layer formula gives the density factor \(2^{1/4}\) and covector factor \(\sqrt{3/2}\) with E102's stated metric/volume comparisons. There is no need to make \(\ell\) small for that inequality. [E102 (1), (4) and strain comparison][e102], [E102/E106 assessment][a102].

In each fixed E57 chart let \(q_\alpha\) be the supported partition piece expressed in its frame and extended to the unit torus. Its ordinary gradient has terms from \(D_0q\), the fixed connection frame and the cutoff derivative times \(q\). The support is compact inside the chart, with smooth zero extension. Fixed component norms, Jacobian and density comparisons on it act boundedly in \(L^{4,1}\). More explicitly, a pointwise norm bound by \(c_1\) and a density bound by \(c_2\) yield comparison factor \(c_1c_2^{1/4}\) by changing \(\lambda\) in the layer formula. Thus \(\|\partial q_\alpha(0)\|_{4,1}\le C(\|D_0q(0)\|_{4,1;0}+\|q(0)\|_{4,1;0})\), and its \(\|q_\alpha(0)\|_8\) is bounded by \(C\|q(0)\|_\infty\). Apply E53 (4) to these actual localized fields, including its value term for the low block, and sum the fixed atlas. This gives
\[
             \|q(0)\|_{\mathcal B^{1/2}}\le C_0\ell .
 \tag{1}
\]
Only the defect is embedded, and the proof uses no control of the full pair in a critical norm. [E53 (4)][e53], [E57 (2)–(3)][e57].

## Fixed horizon, finite path norm and absorption

Choose one \(0<h\le\min(\mathcal T/4,h_0)\) with \(\mathcal T\le1\) the existing E42 head and \(h_0\) E57's horizon for the fixed operator below. This sits before the existing E50 splice \(\mathcal T/2\). For each smooth compatible datum inside the fixed E50 value basin, the individual smooth comparison makes \(\mathcal A\) smooth through \(\tau=0\), and E42 is smooth at positive times on a neighborhood of \((0,h]\). The smooth comparison's possibly smaller datum-dependent time is only needed to verify smoothness across zero. In particular \(q\) on \([0,h]\) is smooth and each localized piece has a finite uniform \(W^{4,8}\) bound on that slab, which may depend on the datum. For each high block the annular estimate is \(\|\Delta_j q_\alpha(\tau)\|_8\le C2^{-4j}\|q_\alpha(\tau)\|_{W^{4,8}}\). The two E57 weights \(2^{j/2}\) and \(2^{5j/2}\) therefore have uniformly summable tails. Finite low blocks are continuous in time. These facts give finite \(E_h(q)\) and the strong \(\mathcal B^{1/2}\) trace before estimating any right-hand side. The positive-time block supremum equals the one including zero by continuity. No uniform high-derivative bound is assumed in this finiteness argument. [E42, compatible passage][e42], [E50, regularity at zero and splice][e50], [E57, path and trace][e57].

The fixed operator is \(L_{\rm d}=4\Delta_0-12I\), where \(\Delta_0=G^{ij}(D_0^2)_{ij}=-D_0^*D_0\) on this bundle. Its leading Fourier generator symbol is \(-4|\xi|_G^2 I\); the positive rank-one convention in E57 tests \(4|\xi|_G^2 I\). Smooth fixed metric and connection coefficients and the constant mass meet E57's fixed compact operator hypotheses. E125's assessed equation is exactly
\[
 \partial_\tau q=L_{\rm d}q+P^{ij}(x,U)(D_0^2q)_{ij}
                     +B^i(x,U,D_0U)(D_0)_i q+C(x,U,D_0U)q ,
 \tag{2}
\]
where \(P^{ij}=g^{ij}\mathscr L_Q-4G^{ij}I\). The identity \(\mathscr L_I=4I\) on trace-free tensors makes \(P(x,0)=0\). The reaction \(-12\sqrt{\det Q}\,q\) leaves only its vanishing-value correction in \(Cq\) after retaining the mass. The remaining arrays are affine in \(D_0U\), their derivative-free parts vanishing at \(U=0\). [E125 (1) and fixed-reference inventory][e125], [E125/E127 assessment][a125], [E57 assessment][a57].

The E128/E130 third weighted jet gives \(\|D_0^m U(\tau)\|_\infty\le C_b v\,\tau^{-m/2}\) for \(0\le m\le3\) on the head quarter, since the initial E42 pair norm is bounded by a fixed constant times \(v\). A change from E42's fixed derivative to \(D_0\) at any order through three adds fixed lower-order terms bounded by the same weight for \(\tau\le1\). The \(m=0\) estimate keeps the values in a fixed small positive tube when \(v\) is small. The coefficient chains apply on that tube. For \(P\), horizontal derivatives at fixed \(U=0\) vanish identically in \(x\), so the differentiated terms without derivatives of \(U\) cost \(O(|U|)\). Every other term at order \(m\) uses at least one derivative of \(U\) with total order \(\le m\). For \(B,C\), the derivative-free parts obey that rule and the affine term retains at least one differentiated \(U\) of total order at most \(m+1\). Order \(m=2\) can reach \(D_0^3 U\). With \(v,\tau\le1\), this gives precisely
\[
 \|D_0^mP\|_\infty\le C_1 v\tau^{-m/2}\ (m\le3),\qquad
 \|D_0^mB\|_\infty+\|D_0^mC\|_\infty\le C_1v\tau^{-(m+1)/2}\ (m\le2).
\]
Every constant here uses only fixed coefficient maps and the independent pair estimate, without \(E_h(q)\), an initial derivative bound or \(\ell\). [E128, coefficient corollary][e128], [E128/E130 assessment][a128].

The mixed analytic product theorem therefore bounds the source of (2) by \(C_{\rm prod}C_1 v\,E_h(q)\) in \(F_h=L^1(0,h;\mathcal B^{1/2})\). The Bochner norm agrees with the sum of the finitely localized block time integrals by Tonelli. The equation holds classically on the actual compatible path, and that path lies in E57's already verified trace class, so E57 applies to it with this source. Hence
\[
 E_h(q)
   \le C_{\rm lin}\|q(0)\|_{\mathcal B^{1/2}}
            +C_{\rm lin}C_{\rm prod}C_1 v\,E_h(q).
\]
Fix \(v_*\) to meet the E102 and geometric tube, E42/E50 smooth basin and E128 datum radii, as well as \(v_*\le1\) and \(C_{\rm lin}C_{\rm prod}C_1 v_*\le1/2\). All quantities determining this choice and \(h\) are fixed before the data. Absorption and (1) give \(E_h(q)\le 2C_{\rm lin}C_0\ell\). [E57 (1)][e57], [E128 (6), (9)][e128].

## Full strain-jet conversion and independent square factor

Define the smooth internal operator \(\mathcal G_Q Z=\tfrac12(Q^{-1/2}ZQ^{-1/2})_0\), and \(X_i=(D_0)_i q+[\operatorname{ad}(a_i),q]\). Since \(q\) has no covariant base slot, \(T_i=\mathcal G_Q X_i\) is the exact live strain identity using this fixed derivative. In contrast, \(T\) has a base slot and its full derivative is
\[
 \begin{split}
 (\nabla^{\mathcal A}T)_{ji}
  ={}&\mathcal G_Q((D_0^2q)_{ji})
        +((D_0)_j\mathcal G_Q)X_i\\
    &+\mathcal G_Q\big([\operatorname{ad}((D_0a)_{ji}),q]
                       +[\operatorname{ad}(a_i),(D_0)_j q]\big)\\
    &+[\operatorname{ad}(a_j),T_i]
         -(\Gamma(g)-\Gamma(G))^k{}_{ji}T_k .
 \end{split}
 \tag{3}
\]
This follows by differentiating \(X_i\) in the fixed product connection and then adding the differences for the endomorphism and one-form slots. The fixed induced connection preserves trace projection and the identity. The base difference is \(\tfrac12g^{k\ell}((D_0)_j g_{i\ell}+(D_0)_i g_{j\ell}-(D_0)_\ell g_{ji})\). Its coefficients are affine in \(D_0U\) since \(g\) is a smooth value reconstruction, and the fixed-value derivative at \(U=0\) vanishes by \(D_0G=0\). Also \((D_0)_j\mathcal G_Q=\mathcal G_Q'[D_{0,j}q]\); as a coefficient \(D_0q\) is affine in \(D_0U\) by the algebraic reconstruction. In the term involving this derivative retain \(X_i=(D_0)_iq+[\operatorname{ad}(a_i),q]\) as the explicit defect factor. In every other lower term of (3) the same explicit \(D_0q\) or \(q\) is multiplied by coefficients affine in the first pair jet, with smooth value parts vanishing at reference values. Thus the exact leading factor is \(\mathcal G_Q\) on the ordered Hessian. Uniform equivalence of the live and fixed metrics compares the final tensor norms on both base slots. It gives
\[
 |\nabla^{\mathcal A}T|_g
   \le C|D_0^2q|_0+C(|U|+|D_0U|)(|D_0q|_0+|q|_0).
 \tag{4}
\]
The moving Levi-Civita term is handled in (3) before this comparison. [E129 (4)–(5)][e129], [E84 (3)–(5)][e84].

The exact strain also gives \(\|T\|_{\infty,g}\le C(\|D_0q\|_\infty+\|q\|_\infty)\) since \(\|a\|_\infty\) is uniformly small. Independently, the weighted values and first pair derivatives give \(\|q\|_\infty\le Cv\), \(\|D_0q\|_\infty\le Cv(1+\tau^{-1/2})\) and thus \(\|T\|_{\infty,g}\le Cv(1+\tau^{-1/2})\). This uses the smooth value function \(q(x,U)\) with \(q(x,0)=0\), with no reference to \(\ell\) or \(E_h(q)\). Use the independent background estimate for only one factor:
\[
 \|T\|_{\infty,g}^2
 \le Cv(1+\tau^{-1/2})(\|D_0q\|_\infty+\|q\|_\infty).
 \tag{5}
\]
Squaring the pointwise-in-time background estimate as both factors would instead introduce a nonintegrable bound. [E119, first bound (1)][e119], [E129 (6)][e129].

## Dyadic weighted integration and original-flow transfer

For \(\lambda_j=2^j\) set \(d_{\alpha j}(\tau)=\lambda_j^{1/2}\|\Delta_j q_\alpha(\tau)\|_{L^8}\). E53's torus Bernstein gain to \(L^\infty\) in dimension four is \(\lambda_j^{4/8}\), with the corresponding uniform low block. E57 reconstruction and the fixed product rule give
\[
 \|D_0^k q(\tau)\|_\infty
       \le C\sum_{\alpha,j}\lambda_j^k d_{\alpha j}(\tau)
       \quad(0\le k\le2).
\]
For this inequality reconstruct the partition pieces using their fixed cutoffs and frames, differentiate in their source charts and convert tensor slots by fixed smooth coefficients. Every derivative hitting a reconstruction multiplier lowers the power of \(\lambda_j\), harmless for \(\lambda_j\ge1\). The unweighted time integral for \(k\le2\) is bounded by \(CH_h(q)\). [E53 (2)][e53], [E57, localization and reconstruction][e57].

For \(k=0,1\) insert the weight \(\tau^{-1/2}\) blockwise and split at \(\tau_j=\lambda_j^{-2}\). The early interval ending at \(\min(h,\tau_j)\) costs at most \(2\lambda_j^{k-1}\sup_{[0,h]}d_{\alpha j}\), by integration of \(\tau^{-1/2}\). If there is a remaining interval, \(\tau^{-1/2}\le\lambda_j\) there, so it costs at most \(\lambda_j^{k+1}\int_0^h d_{\alpha j}\). Because \(k-1\le0\) and \(k+1\le2\), these sum into \(C(M_h+H_h)\). When the split is beyond \(h\) there is only the early estimate. This includes \(j=0\) since \(\tau_0=1\ge h\). Summing yields
\[
 \int_0^h(1+\tau^{-1/2})(\|D_0q\|_\infty+\|q\|_\infty)\,d\tau
       \le C E_h(q).
\]
Thus (4) contributes at most \(C H_h+Cv E_h\) and (5) at most \(Cv E_h\). Since the supremum of the sum is bounded by the sum of suprema, the full adjusted head budget is bounded by \(C(1+v)E_h(q)\le C'\ell\). This proves the linear square contribution and the uniform head bound without an upper threshold on \(\ell\) within the value tube. [E129 (7)][e129].

At each native time \(\tau\in[0,h]\), E50 identifies the original slice with an orientation-preserving bundle pullback of the adjusted slice. E84's exact identities pull back the live metric, one-form strain and its full ordered derivative with both base slots and the internal isometry. Thus the scalar sum of the two norms composes with the base diffeomorphism, and the spatial supremum agrees at that same time. Integrating proves the original-flow head estimate without a uniform derivative bound or differentiation of the recovery maps. The result stops at this fixed head and does not move the splice or supply a tail estimate. Its only premises are the assessed inherited results. [E50 (8)–(10)][e50], [E84 (3)–(5)][e84].

[req]: ../research-progress/handoffs/SP4-CME-E132_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E132_RETURN_v1.md
[req129]: ../research-progress/handoffs/SP4-CME-E129_REQUEST_v1.md
[ret129]: ../research-progress/handoffs/SP4-CME-E129_RETURN_v1.md
[b67]: ../brainstorm/notes/B67_CONDITIONAL_ENDPOINT_HEAD_20261122.md
[e129]: ../notes/129_CONDITIONAL_INTRINSIC_ENDPOINT_HEAD_20261122.md
[e125]: ../notes/125_ADJUSTED_DEFECT_EQUATION_20261122.md
[a125]: E125_E127_ADJUSTED_DEFECT_ASSESSMENT_20261122.md
[e128]: ../notes/128_MIXED_PARABOLIC_COEFFICIENT_PRODUCTS_20261122.md
[a128]: E128_E130_MIXED_COEFFICIENT_ASSESSMENT_20261122.md
[e102]: ../notes/102_STRAIN_DEFECT_PINCHING_20261122.md
[a102]: E102_E106_DEFECT_AND_OSCILLATION_ASSESSMENT_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e57]: ../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md
[a57]: E57_COMPACT_CRITICAL_ASSESSMENT_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e119]: ../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
