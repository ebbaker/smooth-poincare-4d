# E124 — Audit of the nonlinear multiscale strain-budget transfer

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E42, E84, E112 and E116, and independently checked E115's new fixed-window argument in E118. I did not author E123, E119, E115, E50 or E76. This is an independent check of E123's new combination using the assessed inherited results. [Request][req], [B64][b64], [E123 request][req123], [E123 derivation][e123], [return and file identities][ret].

## Disposition and fixed choices

**Pass at the actual smooth round scope.** The two weighted bounds of E119 are the precise analytic premise of the historically conditional E123. The E119/E122 assessment accepts them for the fixed native compact-bundle problem. With that premise discharged, I find no further missing estimate for E123's uniform lower bound and family consequences. The original E123 note and return preserve their issue-time status. [E123 return][ret123], [E119/E122 assessment][a119].

Fix the closed smooth oriented round Riemannian \(S^4\), the genuine positive chiral \(\mathrm{SO}(3)\) connection \(A_0\), its negative-Killing pairing and native metric \(G=G_{A_0}\) of sectional curvature \(1/2\). Let \(D_0\) denote the reference product derivative and \(G_A\) the live native metric. Use the E42 head of length \(\mathcal T\le1\), the E50 splice at \(\tau_s=\mathcal T/2\), E112's fixed ball, window endpoints \(0<\alpha<\beta\), and fixed \(R>2\) with \(R^2>\beta/\alpha\). Take \(\sigma\) small enough for all E112 own-scale errors, the E116 lower subannulus and \(\beta(\sigma R^{-1})^2/4<\min(\mathcal T/4,\tau_s)\). Shrinking \(\sigma\) preserves the ratio-dependent off-scale estimates and improves the small-radius errors. All these choices precede \(N,\delta\). With \(r_j=\sigma R^{-j}\), the windows
\[
 I_j=[\alpha r_j^2/4,\beta r_j^2/4]
\]
are disjoint and lie inside the assessed E119 interval and the recovered E50 head. The denominator four converts E112's heat time to native time \(\tau\). [E112, choice of scales and native clock][e112], [E116, lower subannulus][e116], [E119 (1)][e119], [E50, splice][e50].

## Initial curvature, strain and Lorentz sizes

Take the unweighted E112 atoms and \(b_N=\sum_{j=1}^N a^{(r_j)}\), \(A_{\delta,N}=A_0+\delta b_N\). For one annulus \(r<\rho<2r\), the actual atom \(a=a^{(r)}\) has fixed ordered derivative sizes \(Cr,C,C/r\) through order two, and vanishes in smooth collars. The exterior covariant derivative is the antisymmetrization of the first fixed derivative, so \(|d_0 a|\le C\) and \(|D_0d_0 a|\le C/r\). The reference derivative preserves the adjoint bracket. Its product rule gives \(|[a\wedge a]|\le Cr^2\) and \(|D_0[a\wedge a]|\le Cr\). Different annuli have disjoint supports, so both the global connection and curvature differences have sup size \(O(\delta)\), by the exact formula
\[
 \zeta:=F_{A_{\delta,N}}-F_0
  =\delta d_0 b_N+\tfrac{\delta^2}{2}[b_N\wedge b_N].
 \tag{1}
\]
On the \(j\)-th annulus \(|D_0\zeta|\le C\delta/r_j\). The fixed bound for \(\zeta\) gives a uniform positive definite tube for all sufficiently small \(\delta\), independent of \(N\). The input is a smooth actual connection for every finite \(N\), since each atom has zero collars and the sum is finite. [E112 (4)–(6)][e112].

On this tube \(Q-I=L(x)\zeta+B(x,\zeta)[\zeta,\zeta]\), where \(L\) is the curvature derivative, and \(B\) is the integral second derivative in the Taylor formula, bounded with its first \(x,\zeta\) derivatives. The remainder's reference covariant derivative has norm at most \(C(|\zeta||D_0\zeta|+|\zeta|^2)\). In the linear term the bracket in (1) gives error \(O(\delta^2 r_j)\) after one derivative, since \(D_0L\) is uniformly bounded. Thus on that annulus
\[
 |Q-I|\le C\delta,\qquad
 D_0Q=\delta D_0q^{(r_j)}+O_G(\delta^2/r_j).
\]
The live derivative on the internal endomorphism adds \([\operatorname{ad}(\delta a),Q-I]=O_G(\delta^2r_j)\). Both \(Q^{-1/2}\) factors in the exact strain differ from identity by \(O(\delta)\). Multiplying these by \(D_0Q=O_G(\delta/r_j)\) and taking the trace-free part gives
\[
 |T(A_{\delta,N})-\delta T^{(r_j)}|_G\le C\delta^2/r_j,\qquad
 T^{(r_j)}=\tfrac12 D_0q^{(r_j)} .
 \tag{2}
\]
The trace-free projection fixes the linear derivative. Every quantity on the left vanishes where the connection equals \(A_0\) on the open collars or outside the annuli. This verifies the actual nonlinear initial estimate separately from E119. [E112 (2), (5)][e112], [E84 (3)][e84].

The live metric is a smooth curvature-value function on the chosen positive tube, so \((1-C\delta)G\le G_A\le(1+C\delta)G\). For a tensor of \(k\) covariant base slots with the fixed internal norm, the induced norm factors lie between \((1+C\delta)^{-k/2}\) and \((1-C\delta)^{-k/2}\). The four-dimensional volume ratio lies between \((1-C\delta)^2\) and \((1+C\delta)^2\). The E116 subset \(u_-r_j<\rho<u_+r_j\) has \(|T^{(r_j)}|_G\ge L_*/r_j\) and native reference volume at least \(v_*r_j^4\). This follows from a fixed radial interval with \(|f'|\) bounded below and the \(O(r_j)\) covariant atom error. The total annulus has upper norm \(U_*/r_j\) and volume at most \(V_*r_j^4\). Fix \(\delta_*\) so the error in (2) uses at most \(L_*/2\) of the lower coefficient and all metric factors are uniformly bounded. In true live norm the amplitude then lies above \(l\delta/r_j\) on the subset and below \(u\delta/r_j\) on the full annulus, and their live volume bounds are \(v r_j^4\) from below and \(V r_j^4\) from above. Thus the strict distribution of \(g=|T(A_{\delta,N})|_{G_A}\) satisfies
\[
 v\sum_{j=1}^N r_j^4 \mathbf 1_{\{\lambda<l\delta/r_j\}}
  \le m(\lambda):=\operatorname{Vol}_{G_A}\{g>\lambda\}
  \le V\sum_{j=1}^N r_j^4 \mathbf 1_{\{\lambda<u\delta/r_j\}} .
 \tag{3}
\]
The reference and live measures are compared on the same coordinate sets. This permits using the actual live distribution across the entire support. [E116 (1)–(4)][e116], [E116/E117 assessment][a116].

For \(1\le q<\infty\) the rearrangement formula gives \(\|g\|_{(4,q)}^q=4\int_0^\infty \lambda^{q-1}m(\lambda)^{q/4}\,d\lambda\). The factor is \(q(4/q)\) after inserting the layer formula for \((g^*)^q\). For \(q=1\) this is exactly \(4\int_0^\infty m(\lambda)^{1/4}d\lambda\), and for \(q=4\) it is the usual fourth power of the \(L^4\) norm. For \(\lambda\in[u\delta/r_{j-1},u\delta/r_j)\), with lower endpoint zero for \(j=1\), the upper distribution is bounded by \(V r_j^4/(1-R^{-4})\) from the geometric tail and vanishes at and above the highest upper threshold. Integration bounds each band's contribution by \(C_q\delta^q\). The \(N\) disjoint lower bands \([l\delta/(4r_j),l\delta/(2r_j)]\) give a contribution \(\ge c_q\delta^q\) each. Thus \(\|T\|_{(4,q);G_A}\asymp_q\delta N^{1/q}\), and \(\|T\|_{(4,\infty);G_A}=\sup_{\lambda>0}\lambda m(\lambda)^{1/4}\asymp\delta\) from the same upper and lower bands. These estimates cover all smooth collars and all levels. [E116 (5)–(10)][e116].

## Uniform adjusted-pair control

Write \(u_{\delta,N}=\delta v_N+\delta^2 w_N\) where \(v_N=(b_N,d_0b_N)\) and \(w_N=(0,[b_N\wedge b_N]/2)\). Both have uniformly bounded values by disjointness. Their E42 norms use equivalent fixed pair metrics. The input is the compatible polynomial pair from (1). Choose \(\delta_*\) within the E42/E119 fixed datum radius, the static bounds above and E50's smooth value basin with the \(m=6\) stable splice. These choices use uniform value bounds and no initial higher norms. The E49/E50 combination supplies an actual smooth original global flow. E42 and the smooth comparison identify its adjusted head with the compatible path \(U=\mathsf S(u_{\delta,N})\) of the independent-pair map. [E42, compatible passage][e42], [E50, individual smooth comparison and splice][e50], [E49/E52 assessment][a50].

Let \(W=D_u\mathsf S(0)\) be the full linear solution-map derivative, and use \(\|Y\|_{\tau,2}=\sum_{k=0}^2\tau^{k/2}\|D^kY(\tau)\|_\infty\) for E119's fixed derivative \(D\). In a fixed small ball E119 gives
\[
 \|\mathsf S(u)\|_{\tau,2}\le C\|u\|_\infty,\qquad
 \|\mathsf S(u)-W[u]\|_{\tau,2}\le C\|u\|_\infty^2 ,
 \qquad 0<\tau\le\mathcal T/4.
\]
Applying both bounds to \(\epsilon h\) and using \(\epsilon W[h]=W[\epsilon h]\) gives \(\|W[h]\|_{\tau,2}\le C\|h\|_\infty\) after letting the test scalar \(\epsilon\) tend to zero in the resulting scalar inequality. In particular \(h=w_N\) is allowed, since the domain comprises independent pairs. The composition does not treat \(w_N\) as a tangent to the compatible graph. At \(V_N=W[v_N]\) the exact error identity is
\[
 U-\delta V_N=
 \mathsf S(u_{\delta,N})-W[u_{\delta,N}]+\delta^2 W[w_N].
\]
Hence \(\|U\|_{\tau,2}\le C\delta\), \(\|V_N\|_{\tau,2}\le C\) and \(\|U-\delta V_N\|_{\tau,2}\le C\delta^2\). The same estimates hold with \(D_0\). In fixed smooth bundles \(D-D_0\) is zeroth order, and \(D^2-D_0^2\) is first plus zeroth order, including the difference on covector slots. The weights of those lower terms are absorbed by \(0<\tau\le1\). This step uses the full ordered Hessian from the E119/E122 premise, with constants independent of \(N,\delta,\tau\). [E119 (1)][e119], [E119/E122 assessment][a119].

## Full geometric jet and live norm estimate

Set \(U=(a,\zeta)\) at positive times. In the fixed bundles let \(\bar D_i\) denote the reference derivative of a coefficient at parallel-held value \(U\). Put \(B_i=(D_0)_iU\) and \(H_{ij}=(D_0^2U)_{ij}\). The exact strain has
\[
 T_j=P(x,U)B_j+t_j(x,U),\qquad
 P(x,U)[h]=\tfrac12\big(Q^{-1/2}Q_U[h]Q^{-1/2}\big)_0,\qquad
 t_j=\tfrac12\big(Q^{-1/2}(\bar D_jQ+[\operatorname{ad}(a_j),Q])Q^{-1/2}\big)_0 .
\]
Here \(t_j(x,0)=0\) since \(Q=I\) at the reference. The maps depend on values only. Reference differentiation on the one-form slot shows
\[
 (D_0T)_{ij}=P H_{ij}
 +(\bar D_i P)B_j+(P_U[B_i])B_j
 +\bar D_i t_j+(t_j)_U[B_i].
 \tag{4}
\]
The full live derivative adds \( [\operatorname{ad}(a_i),T_j]-\Delta^k{}_{ij}T_k\), where the exact Levi-Civita difference is
\[
 \Delta^k{}_{ij}=\tfrac12 G_A^{k\ell}
     \big((D_0)_i(G_A)_{j\ell}+(D_0)_j(G_A)_{i\ell}
                         -(D_0)_\ell(G_A)_{ij}\big).
\]
Because \(G_A=G(x,U)\) depends on values, this is affine in \(B\), with fixed-value part zero at \(U=0\) by \(D_0G=0\). Multiplying by \(T\) as above gives products at most quadratic in \(B\). The additional internal commutator introduces only value and first-jet terms. This verifies the exact form
\[
 \mathcal K(U)=M_2(x,U)H+M_{11}(x,U)[B,B]+M_1(x,U)B+M_0(x,U),
 \qquad M_0(x,0)=0 .
 \tag{5}
\]
All coefficient bounds may be taken on one fixed tube. Formula (4) retains the differentiation slot \(i\) and the existing one-form slot \(j\); neither the Levi-Civita difference nor the internal action is omitted. For compatible pairs this is \(\mathcal K=\nabla^A T\). [E123 (11)–(12)][e123], [E84 (3)–(5)][e84].

At zero, \(\nabla^{A_0}Q=0\), \(T(A_0)=0\) and \(Q=I\). Differentiating the strain removes both square-root variations and the connection commutator with \(I\). Its derivative is \(\frac12D_0(L\zeta)\). Differentiating the covariant derivative then leaves only \(D_0\) on that first variation, since the connection variations multiply \(T(A_0)=0\). The exact linear map for (5) is therefore \(\mathcal K_1(U)=\frac12D_0^2(L\zeta)\). Taylor subtraction of (5) at the reference zero jet gives
\[
 |\mathcal K(U)-\mathcal K_1(U)|_G
 \le C\big(|U||H|+|B|^2+|U||B|+|U|^2\big).
\]
For the path \(U\), the four terms are each bounded by \(C\delta^2/\tau\), since the weighted bounds give \( |U|\le C\delta\), \( |B|\le C\delta/\sqrt\tau\), \( |H|\le C\delta/\tau\). Applying the fixed linear differential operator \(\mathcal K_1\) to \(U-\delta V_N\) contributes another \(C\delta^2/\tau\). Thus
\[
 \|\mathcal K(U)-\delta\mathcal K_1(V_N)\|_{\infty,G}\le C\delta^2/\tau,
 \qquad \|\mathcal K_1(V_N)\|_{\infty,G}\le C/\tau .
\]
The live metric differs uniformly from \(G\) by \(O(\delta)\). Its norm multipliers for two covariant base slots also differ from one by \(O(\delta)\). The last display and the triangle inequality in the live norm give
\[
 \sup_x\big|\,|\mathcal K(U)|_{G_A}
                  -\delta|\mathcal K_1(V_N)|_G\,\big|
                 \le C\delta^2/\tau .
 \tag{6}
\]
Thus motion of the Levi-Civita connection enters (4)–(5), and the additional change of norm enters (6).

## Signed windows, original flow and finiteness

To identify \(V_N\), differentiate the compatible finite smooth path \(\epsilon\mapsto A_0+\epsilon b_N\), whose pair tangent is \(v_N\). E115 supplies the positive-time differentiation and continuous trace for each fixed \(N\). At the reference the adjusted generator vanishes, and the derivative of the correction is a reference orbit tangent of the form \(d_0\phi+\iota_XF_0\) up to sign. Its defect derivative vanishes by \(Q(g^*A_0)=I\). The physical variation at the reference is \(-4d_0^{*G}(qF_0)\), since the constant curvature factor is annihilated by self-duality and Bianchi and the varying factors multiplying \(q=0\) vanish at first order. The native defect equation is \(q_\tau=-(4\mathcal L+12)q\) with \(\mathcal L=D_0^*D_0\) on the trace-free symmetric bundle. Its continuous trace \(DQ_{A_0}(b_N)=\sum_j q^{(r_j)}\) and energy uniqueness give
\[
 \mathcal K_1(V_N)(\tau)=e^{-12\tau}
       \sum_{j=1}^N D_0^2 e^{-4\tau\mathcal L}(q^{(r_j)}/2).
\]
The use of fixed \(N\) here identifies a linearized solution. The preceding uniform remainder bounds give the nonlinear estimates without an interchange of limits. [E115 (3)–(7)][e115], [E115/E118 assessment][a115], [E112 (2)–(3)][e112].

At \(p\), take E112's unit base vector \(e_1\) and unit \(M(p)\), and apply the signed unit projection \(Y\mapsto\langle Y(e_1,e_1),M(p)\rangle\). E112 bounds the heat sum on \(I_j\) below by \(h_*r_j^{-2}/2\) after subtracting the absolute off-scale errors. On all windows the damping obeys \(e^{-12\tau}\ge e^{-3\beta r_1^2}>0\). Thus \(|\mathcal K_1(V_N)(\tau,p)|_G\ge c_0 r_j^{-2}\) with \(c_0=e^{-3\beta r_1^2}h_*/2\). Equation (6) at this same point gives
\[
 \|\mathcal K(U)(\tau)\|_{\infty,G_A}
    \ge c_0\delta r_j^{-2}-C\delta^2/\tau,\qquad \tau\in I_j .
\]
On a single window the leading integral is \(c_0\delta(\beta-\alpha)/4\), and the error is at most \(C\delta^2\log(\beta/\alpha)\). Exact same-native-time pullback from E50 and the two-slot invariance of E84 equate the adjusted and original spatial suprema at every window time. This uses only the isometry of each slice for its live tensor norm. In particular it does not require uniformly bounded recovery derivatives or parameter differentiability of the recovery. The squared-strain term in \(J\) is nonnegative and the windows are disjoint, giving \(J(A_{\delta,N})\ge cN\delta-CN\delta^2\) with one pair of positive constants. [E112, signed windows][e112], [E50 (8)–(10)][e50], [E84 (4)–(5)][e84].

Finiteness for each finite datum follows independently of the E119 bounds. The smooth original flow through zero and the splice gives a continuous budget integrand on each compact time interval. E76's adjusted stable-tail exponential Sobolev decay gives \(\|B-A_0\|_{C^3}\le C_{N,\delta}e^{-\kappa(\tau-\tau_s)}\) for some \(\kappa>0\), since fixed Sobolev exponent \(m>5\) suffices on the compact four-sphere. The curvature identity gives the same decay in \(C^2\) for \(F_B-F_0\). Smoothness and reference vanishing in the local formulas for \(T,\mathcal K\) give exponential decay of both tail suprema, with the live norm comparable to \(G\). Per-slice invariance transfers the tail budget. No datum-independent higher Sobolev estimate is needed. [E76 (10), (15)–(16)][e76], [E76/E77 assessment][a76], [E84, native budget][e84].

## Family consequences and scope

For \(\delta=N^{-1/2}\), large \(N\) lie below the fixed datum threshold. The reference value differences and initial live \(L^4\) norm are of sizes \(O(N^{-1/2})\) and \(\asymp N^{-1/4}\), while \(J\ge c\sqrt N-C\). For each fixed \(1<q\le\infty\), take \(\max\{1/q,1/4\}<a<1\) and \(\delta=N^{-a}\), with \(1/\infty=0\). Then the values, initial live \(L^4\) norm and initial live \(L^{4,q}\) norm tend to zero, but \(J\ge N^{1-a}(c-CN^{-a})\to\infty\). These are families of smooth global round-basin flows, each of finite budget. Their \(L^{4,1}\) sizes are \(\asymp N\delta\) and diverge along the two asserted sequences, so they do not test small-endpoint control. The result establishes neither a singular individual trajectory nor failure of the \(L^{4,1}\) endpoint, and concerns the fixed round bundle. This audit used existing assessed inputs only.

[req]: ../research-progress/handoffs/SP4-CME-E124_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E124_RETURN_v1.md
[req123]: ../research-progress/handoffs/SP4-CME-E123_REQUEST_v1.md
[ret123]: ../research-progress/handoffs/SP4-CME-E123_RETURN_v1.md
[b64]: ../brainstorm/notes/B64_CONDITIONAL_NONLINEAR_MULTISCALE_TRANSFER_20261122.md
[e123]: ../notes/123_CONDITIONAL_NONLINEAR_MULTISCALE_BUDGET_20261122.md
[e119]: ../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
[a119]: E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md
[e112]: ../notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e116]: ../notes/116_ROUND_ANNULAR_LORENTZ_NORMS_20261122.md
[a116]: E116_E117_LORENTZ_THRESHOLD_ASSESSMENT_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[a50]: E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[e76]: ../notes/76_HIGH_ORDER_STABLE_LIMIT_20261122.md
[a76]: E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e115]: ../notes/115_NONLINEAR_LINEAR_BUDGET_TEST_20261122.md
[a115]: E115_E118_NONLINEAR_LINEAR_BUDGET_ASSESSMENT_20261122.md
