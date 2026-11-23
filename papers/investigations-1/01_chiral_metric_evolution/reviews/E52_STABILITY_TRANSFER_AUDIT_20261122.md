# SP4-CME-E52 — Audit of the round stability proof and gauge splice

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. The author of E47 performed this E49–E50 audit. It assumes the assessed E47 linear inverse and strong trace, and supplies no independent E47 review. All seven frozen input hashes in the [request][req] matched.

**Verdict.** E49 proves the precise smooth-data hypothesis \(H_{\rm st}\) used by E50. The combined inference holds on the fixed round sphere with one smooth perfect reference, in the native time and pairing. The audit found no blocking regularity, coefficient, source, or gauge-order error. The short initial comparison interval and recovery bounds may depend on higher derivatives of the individual datum. [E49][e49]. [E50][e50].

## Half-line contraction and definite jets

Fix \(m\ge6\) and \(\alpha=\lambda_1(G_0)/2\). The E47 domain for \(b=e^{\alpha t}a\) is the closed graph \(L^2H^{m+1}\cap\{b_t\in L^2H^{m-1}\}\). Since \(b_t=e^{\alpha t}a_t+\alpha b\), E49's norm is equivalent to this graph norm. E47's projection trace gives the continuous bounded \(H^m\) representative including \(t=0\). Thus the closed ball is complete, the trace is strong, and the bound \(\|\mathcal S(f,u_0)\|_X\le K(\|f\|_Y+\|u_0\|_{H^m})\) uses the exact E47 forcing and data spaces. [E47, half-line isomorphism][e47].

Let \(U(a)=\sup_t\|a(t)\|_{H^m}\) and \(J(a)=\|e^{\alpha t}a\|_{L^2H^{m+1}}\). E48 (10) gives \(\|N(a)\|_Y\le M U(a)J(a)\), and for the difference gives

\[
 \|N(a)-N(b)\|_Y\le M\bigl((U(a)+U(b))J(a-b)
                         +(J(a)+J(b))U(a-b)\bigr).
\]

Each time weight is placed on the factor estimated in \(L^2H^{m+1}\), in particular on \(a\) or \(b\) in the second difference term. The two products are bounded by \(M(\|a\|_X+\|b\|_X)\|a-b\|_X\). The coefficient maps are continuous at almost every time on the requisite Sobolev spaces, giving measurable forcing. For \(R\le(8KM)^{-1}\) and \(\|a_{\rm in}\|_{H^m}<R/(4K)\), the ball image has norm at most \(R/4+KMR^2\le3R/8\) and the contraction constant is at most \(2KMR\le1/4\). The fixed point has \(\|a\|_X\le(8K/7)\|a_{\rm in}\|_{H^m}\). The \(C_tH^m\) control bounds the actual pointwise jet at every time by Sobolev embedding, so reducing \(R\) once keeps definiteness and the strong parabolicity margin in the fixed reference pairing. [E48, (8)–(10)][e48]. [E49, (3)–(5)][e49].

## Uniform smooth restart and comparison

The cutoff equals one on \(|(a,Da)|\le r\), with support strictly inside a larger definite, elliptic jet region. Extending \(\chi C\) and \(\chi L\) by zero there and interpolating the principal array with \(g_0^{ij}I\) yields smooth global jet maps. Both arrays are uniformly rank-one coercive in the same fixed pairing on the interpolation region, so their convex combinations retain a common margin. The energy solution has jet size at most \(r/2\). The cutoff equation therefore agrees with its genuine equation at every time.

For even \(k\ge6\), \(\Lambda^k=(I+D^*D)^{k/2}\) is differential with scalar top part in each chart. Orthogonal spectral projections commute with these powers and drop from testing against \(\Lambda^{2k}u_N\). Under uniform \(C^2\) control of \(u_N\), the leading coefficients have uniform spatial \(C^1\) bounds and the principal Gårding estimate comes from the rank-one inequality, spatial freezing, Plancherel and absorption of first-order errors. No full gradient-array coercivity is required.

The exact allocation in the differentiated equation is as follows. Composition in charts gives \(\|\widehat C\|_{H^k}+\|\widehat L\|_{H^k}\le C_{k,M_2}(1+\|u_N\|_{H^{k+1}})\), since the jet has one derivative and bounded values. Taylor (3.1.20) applies with \(p=2\), \(s=k\), and coefficient derivative index \(N>k\). Smooth fixed chart coordinate functions can be included among the bounded arguments locally. The low-frequency remainder has bounded derivatives on the fixed chart supports under the low norm bound. By (3.6.14), the scalar order-\(k\) part in \([\Lambda^k,\widehat C]\) applied to \(v=D_iD_j u_N\) is bounded by

\[
 C_k\bigl(\|\widehat C\|_{C^1}\|v\|_{H^{k-1}}
          +\|\widehat C\|_{H^k}\|v\|_\infty\bigr).
\]

For a fixed matrix coefficient \(B_\beta\) in the order-\(\le k-1\) part, write \([B_\beta\partial^\beta,\widehat C]v=B_\beta[\partial^\beta,\widehat C]v+[B_\beta,\widehat C]\partial^\beta v\). The scalar derivative estimate bounds the first term and the second uses only \(\|\widehat C\|_\infty\|v\|_{H^{k-1}}\). Thus noncommuting matrices enter below order \(k\). The fixed operator commutator \([\Lambda^k,D_iD_j]\) also has order at most \(k+1\) because the top symbols commute in the fixed frames. Cutoff errors and derivatives of fixed transition functions have the same or lower derivative counts. These bounds establish the claimed energy inequality after Young's inequality, with constants depending on \(M_2\) and the fixed system, and no loss of high derivatives in the coefficient of the energy. [Taylor, Proposition 3.1.A, (3.1.18)–(3.1.20), and Proposition 3.6.A][tay]. [E49, (6)][e49].

The common Galerkin time comes from \(H^6\hookrightarrow C^2\) in dimension four. With \(E_6(Q_Nu_0)\le C_6R^2\) and bootstrap threshold \(L_6=2(1+C_6R^2)\), the differential inequality at level six gives

\[
 1+E_6(t)\le (1+C_6R^2)e^{K_6t}
   \le \tfrac32(1+C_6R^2) \quad
   \text{on }[0,\log(3/2)/(1+K_6)]
\]

whenever the bootstrap is active. The strict gap excludes a first hit and permits the finite ODE continuation. On this already fixed interval, all higher even energy inequalities use the same low \(M_2\) bound. Their constants and initial high energies can vary with order and datum without changing the chosen time. Bounds for \((u_N)_t\) in \(H^{k-2}\), interpolation and compact embedding give convergence in \(C_tH^{k-1}\) at each finite order by diagonal selection, passing the projected equation. Smooth composition in the now available spatial norms and integration of the equation give derivatives in time continuously up to the initial slice. This checks the uniform lifespan from the fixed cutoff and bounded \(H^6\), with smoothness for individual smooth data. [E29, compact-bundle construction][e29]. [E49][e49].

For comparison, subtract from the energy path \(a\) any smooth cutoff solution \(\widetilde u\) with the same initial value on a translated slab. Use the leading coefficients at \(a\). The coefficient difference acts on \(D^2\widetilde u\) and is a bounded coefficient times \((w,Dw)\), \(w=a-\widetilde u\), by the smooth first-jet mean-value formula. The leading coefficients at \(a\) are bounded in spatial \(C^1\) because \(C_tH^m\) gives bounded \(C^2\). Thus Gårding and Young give \(d\|w\|_2^2/dt\le C\|w\|_2^2\). On each finite slab \(w_t\in L^2L^2\), so the Hilbert-space energy identity and Grönwall apply before smoothness of \(a\) has been established. Its strong trace gives equality with \(\widetilde u\). The smooth cutoff solution therefore lies in the genuine region as well. Restarting at \(jT_{\rm loc}/2\) uses interior smooth slices and the same \(H^6\) bound from the global fixed point. Identifications with that point give agreement on the overlapping slabs, making the solution smooth through all joining times and up to the initial slice. E49 thereby supplies exactly the E50 hypothesis, with the same gauge, uniform definite neighborhood, and exponential \(H^m\) estimate for smooth starts. [E49, (1)–(2), (7)][e49]. [E50, (1)–(2)][e50].

## Fixed smoothing time for the transfer

At the perfect reference \(Q=I\), the physical factor is \(2I\) and \(v(A_0)=0\) by Bianchi and self-duality. The independent curvature equation and both gauge inputs also vanish at the reference. Thus the zero E42 solution is the stationary pair by small-ball uniqueness. The E42 positive-time derivative dependence at this datum gives \(C^m\) convergence of \(\widehat A(T/2)\) to \(A_0\) as the input pair converges uniformly to the reference. Compactness gives \(H^m\) convergence as well. The E42 interval \([0,T]\) is uniform for the fixed small value ball, so reducing its value threshold makes the stationary-data comparison strictly smaller than the E49 threshold at the single time \(\tau=T/2\).

For each smooth datum the E29 comparison in the E42 proof applies directly, with fixed reference \(A_0\). On the curvature graph the top coefficient depends on \(A,F_A\) values, so all initial jets lie in the open parabolic region even when their symmetric first-jet parts are large. The initial jet image is compact for this one smooth datum and can be surrounded by an individual smooth cutoff. The short E29 solution lifts by \(F=F_A\), with spatial \(C^1\) trace for the pair, so its \(X_\ell\) norm is bounded by its value sup plus \(C\sqrt\ell\,\sup|DU|\). For short enough \(\ell>0\) the lift and the restricted rough solution are in the same completed uniqueness ball. This yields the smooth adjusted initial path needed for recovery while keeping the uniform time \(\tau\) from E42 positive-time smoothing. [E42, positive-time regularity and compatible passage][e42]. [E50, (3)–(4)][e50].

## Original equation, overlap and inverse order

With the E28 left action \(g\cdot A=(g^{-1})^*A\) and \(gh=g\circ h\), a vertical section \(\phi\) and horizontal lift \(\chi_A(u)\) give \(R=-d_A\phi-S_Au\). In the local gauge the inputs in \(\xi_{\rm loc}\) are \(-d_A^{*g_0}(A-A_0)\) and the \(A\)-horizontal lift of \(-S_A^*d_A^{*g_A}d_A(A-A_0)\). Thus \(-R\) gives the two negative E29 corrections. In the stable gauge the inputs in \(\xi_{\rm st}\) are \(-\delta_0(B-A_0)\) and the \(B\)-horizontal lift of \(-\Delta_0S_0^*(B-A_0)\). Here \(-R\) gives the two negative terms of E49, with the differential and inner adjoint factors fixed. [Fine v2, Lemma 3.2 and (3.4)][fine]. [E28][e28]. [E50, (5)–(7)][e50].

For either smooth adjusted path solve \(\dot j=-\xi\circ j\). The principal \(\mathrm{SO}(3)\) frame bundle is compact. The prescribed time-dependent smooth invariant vector field has a flow on each finite time interval of the adjusted path, with bundle equivariance by uniqueness and inverse by backward integration on that interval. With \(g=j^{-1}\), differentiation of \(g\circ j=\mathrm{id}\) gives \(\dot g=Dg\,\xi\), so its right velocity is \(\operatorname{Ad}_g\xi\). In the transformed equation the action derivative \(R(\operatorname{Ad}_g\xi,g\cdot A)\) cancels \(-g_*R(\xi,A)\); naturality of \(v\) supplies the original vector field. The generators are evaluated on their own adjusted paths. The agreement requires equivariance of the physical equation, not of the two fixed-reference generators. [Fine v2, Lemma 4.4 and (4.3)–(4.4)][fine]. [E28][e28].

Set \(c=g_{\rm loc}(\tau)\) and \(B_0=\widehat A(\tau)\). The recovered original left path extends a little past \(\tau\). The tail is \((c g_{\rm st}(t-\tau))\cdot B(t-\tau)\), with the constant automorphism acting on the left. It solves the original equation and starts at \(c\cdot B_0\), the datum of the left path there. For smooth original uniqueness, recenter the corrected local gauge at this common smooth definite datum. The E28 reverse symbol is strictly negative at the identity for each supplied path, the smooth E29 chart equation provides their reverse maps, the corrected adjusted solutions agree by uniqueness, and forward recovery agrees by ODE uniqueness. Therefore the actual paths agree on a nontrivial right overlap and the splice is smooth. Finally \(h(t)=g_{\rm st}(t-\tau)^{-1}c^{-1}\) is the inverse of the full tail product, so \(h(t)\cdot A(t)=B(t-\tau)\) exactly, yielding the exponential \(H^m\) estimate from E49. This is a timewise comparison by smooth automorphisms at finite times. The result is for smooth initial connections satisfying the small uniform pair condition. No continuous-data recovery at zero or limiting automorphism follows. [E28][e28]. [E29][e29]. [E50, (8)–(12)][e50].

## Source versions

Selected remote PDF passages were rechecked 22 November 2026, America/New_York. Michael E. Taylor, *Pseudodifferential Operators and Nonlinear PDE*, Birkhäuser Boston, Progress in Mathematics 100 (1991), DOI `10.1007/978-1-4612-0431-2`, undated repaginated author file, printed p. 66 Proposition 3.1.A and (3.1.18)–(3.1.20), p. 94 Proposition 3.6.A and (3.6.14), and pp. 147 and 149 (7.3.1)–(7.3.2) and Propositions 7.3.A–B. The first two passages supply the local tame bounds, with the compact-bundle construction checked in E29/E49. Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*, arXiv:1111.5005v2 (29 November 2011), rechecked p. 19 Lemma 3.2 and (3.4), and p. 31 Lemma 4.4 and (4.3)–(4.4) for action signs and correspondence. The original-flow local theorem relies on the corrected E28/E29 implementation. No new source versions or PDF copies were retained. [Taylor host file][tay]. [Fine preprint v2][fine]. [Canonical provenance][canonical].

[req]: ../research-progress/handoffs/SP4-CME-E52_REQUEST_v1.md
[e28]: ../notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e29]: ../notes/29_LOCAL_PARABOLIC_INPUT_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e47]: ../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e48]: ../notes/48_FIXED_STABILITY_GAUGE_20261122.md
[e49]: ../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
[fine]: https://arxiv.org/pdf/1111.5005v2
[canonical]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#taylor-composition-and-commutator-input-for-stability
