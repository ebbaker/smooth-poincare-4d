# E49 — Nonlinear stability of the fixed round gauge

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and actual lead settings are unavailable.
The [request][req] freezes the inputs. [B35][b35], [B36][b36] and
the [E47–E48 assessment][lead] identify the operator and scope.

## Theorem

On the smooth closed oriented round Riemannian \(S^4\), fix its perfect
chiral connection \(A_0\), the native metric \(g_0=g_{A_0}\) and time,
and the positive internal pairing given by the negative Killing form.
Use fixed geometric Sobolev norms on the connection difference with
\(D\) induced by \(g_0,A_0\). For each integer \(m\geq6\) there are
\(\eta,C,\alpha>0\) such that every smooth definite initial
connection \(B_0\) with \(\|B_0-A_0\|_{H^m}<\eta\) has a global smooth
solution of
\[
 B_t=v(B)-d_B\delta_0(B-A_0)-S_B\Delta_0 S_0^*(B-A_0),             \tag{1}
\]
where \(\delta_0=d_{A_0}^*\), \(\Delta_0=\nabla_0^*\nabla_0\) on
vector fields and \(S_0^*\) are fixed at \(A_0,g_0\).
Here \(S_B(Y)=\iota_Y F_B\). The solution is smooth up to the
initial slice with \(B(0)=B_0\), stays in a single fixed definite
and strongly parabolic neighborhood, and satisfies
\[
 \|B(t)-A_0\|_{H^m}\leq C e^{-\alpha t}\|B_0-A_0\|_{H^m}
 \qquad (t\geq0).                                                 \tag{2}
\]
This is the \(H_{\rm st}\) hypothesis in the [E50 request][e50].

## Weighted contraction and trace

Set \(a=B-A_0\) and \(a_{\rm in}=B_0-A_0\). By [E48][e48],
(1) is \(a_t+G_0a=N(a)\), with the exact linear operator
\(G_0=d_0^*P_0^*P_0d_0+S_0\Delta_0S_0^*+d_0d_0^*\).
Let \(\lambda_1>0\) be the lowest eigenvalue from [E47][e47]
and choose \(\alpha=\lambda_1/2\).
For forcing let \(Y=L^2(e^{2\alpha t}dt;H^{m-1})\).
Use the space \(X\) of sections on the half-line with
\(e^{\alpha t}a\in C_b([0,\infty);H^m)\cap L^2_tH^{m+1}\)
and \(e^{\alpha t}a_t\in L^2_tH^{m-1}\), where the derivative
is distributional. Its norm is
\[
 \|a\|_X=\sup_{t\geq0}e^{\alpha t}\|a(t)\|_{H^m}
       +\|e^{\alpha t}a\|_{L^2 H^{m+1}}
       +\|e^{\alpha t}a_t\|_{L^2 H^{m-1}}.                         \tag{3}
\]
It is complete. Multiplication by \(e^{\alpha t}\) identifies it
with the graph space of \(b=e^{\alpha t}a\) with
\(b\in L^2 H^{m+1}\) and \(b_t\in L^2 H^{m-1}\).
Indeed \(b_t=e^{\alpha t}a_t+\alpha b\), and E47's spectral
projection argument gives the continuous \(H^m\) representative
and sup bound from this graph norm. Equivalently, the distributional
relation between the \(L^2\) limits and the derivative is closed,
and the continuous representatives agree with the uniform limit
in the norm (3). Evaluation at \(t=0\) is a continuous strong
trace. Let \(\mathcal S(f,u_0)\) be the E47 bounded inverse for
\(a_t+G_0a=f,\ a(0)=u_0\), with
\[
 \|\mathcal S(f,u_0)\|_X\leq K(\|f\|_Y+\|u_0\|_{H^m}),\qquad K\geq1 .
                                                                    \tag{4}
\]
[E47, half-line isomorphism and graph trace][e47].

For the following estimates use \(\|a\|_m=\|a\|_{H^m}\).
The inequalities of E48 (10) apply at almost every time on
the small \(H^m\) ball, since \(a(t)\in H^{m+1}\) almost
everywhere. Composition and multiplication in those inequalities
also give measurability of the nonlinear forcing. Put
\(U(a)=\sup_{t\geq0}\|a(t)\|_m\) and
\(J(a)=\|e^{\alpha t}a\|_{L^2 H^{m+1}}\). Placing the single
time weight on the factor estimated in \(L^2\) gives, with
a fixed \(M\geq1\),
\[
 \begin{aligned}
 \|N(a)\|_Y
    &\leq M\,U(a)J(a)\leq M\|a\|_X^2,\\
 \|N(a)-N(b)\|_Y
    &\leq M\big[(U(a)+U(b))J(a-b)+(J(a)+J(b))U(a-b)\big]\\
    &\leq M(\|a\|_X+\|b\|_X)\|a-b\|_X .
 \end{aligned}                                                     \tag{5}
\]
In the last line both sums are dominated by
\((U(a)+J(a)+U(b)+J(b))(U(a-b)+J(a-b))\).
Here \(U(a)\leq\sup e^{\alpha t}\|a(t)\|_m\).
[E48, tame estimates][e48].

Choose a radius \(r>0\) for the pointwise first-jet norm
\(|j|=|(a,Da)|\) such that \(|j|\leq2r\) lies in the
definite and uniformly strongly parabolic region of E48.
Choose \(R_0>0\) so that \(\|a\|_m\leq R_0\) implies
\(\|j(a)\|_\infty\leq r/2\) by Sobolev embedding and
lies within the E48 smallness range for (5).
Fix
\[
 R=\min\{R_0,1,(8KM)^{-1}\},\qquad
 \eta=R/(4K).
\]
For \(\|a_{\rm in}\|_m<\eta\), the map
\(a\mapsto\mathcal S(N(a),a_{\rm in})\) on the closed
radius-\(R\) ball of \(X\) has image norm at most
\(R/4+KMR^2\leq3R/8\) and Lipschitz constant at most
\(2KMR\leq1/4\). Its unique fixed point in that ball
has the strong initial trace and solves the equation in
distributions by (4)–(5). It obeys
\[
 \|a\|_X\leq K\|a_{\rm in}\|_m+KMR\|a\|_X
            \leq K\|a_{\rm in}\|_m+\tfrac18\|a\|_X .
\]
This proves (2) with \(C=8K/7\) for this representative.
At every time its value jet satisfies \(\|j(a(t))\|_\infty\leq r/2\)
because the \(H^m\) trace is continuous at all times. The curvature
formula in E48 (2) then puts it in the selected definite component.
We next show that the representative is smooth for smooth initial
data.

## Smooth cutoff solutions with a common \(H^6\) lifespan

Write the exact E48 equation in the fixed derivative as
\(u_t=C^{ij}(x,j(u))D_iD_j u+L(x,j(u))\).
Use a fixed smooth cutoff \(\chi(j)\) equal to one for
\(|j|\leq r\) and supported in \(|j|<2r\). Define
\[
 \widehat C^{ij}=\chi C^{ij}+(1-\chi)g_0^{ij}I,\qquad
 \widehat L=\chi L.
\]
The interpolation is convex in the fixed-pairing rank-one
inequality, so this is a smooth globally defined strongly
parabolic system with a single strict margin. The energy
solution \(a\) solves this same cutoff system because its jet
is in the \(\chi=1\) range. We will construct smooth local
solutions of the cutoff system for every smooth datum satisfying
\(\|u_0\|_{H^6}\leq R\), on an interval independent of its higher
norms. Define geometric integer norms by the sums of the squared
derivative norms, so the bound \(\|a(t)\|_m\leq R\) gives
\(\|a(t)\|_{H^6}\leq R\).

Here are the quantitative details of the [E29][e29] compact
bundle construction for this cutoff. Let
\(\Lambda=(I+D^*D)^{1/2}\) on the fixed one-form bundle,
and \(Q_N\) be its finite spectral projections increasing
to the identity. Solve the finite ODE with projected right-hand
side and \(u_N(0)=Q_Nu_0\). For even \(k\geq6\),
\(\Lambda^k=(I+D^*D)^{k/2}\) is differential with scalar
principal symbol and graph norm equivalent to \(H^k\).
Test the projected equation against \(\Lambda^{2k}u_N\).
The projection drops from this inner product. Whenever
\(\|u_N\|_{C^2}\leq M_2\), the coefficients
\(\widehat C(x,j(u_N))\) have a common \(C^1\) bound.
The rank-one Gårding argument of E29, by a squared spatial
partition, local freezing, Plancherel, and bounding derivatives
of coefficients after integration by parts, gives a uniform
negative gradient term for \(\Lambda^k u_N\). The lower term
is a bounded multiple of \(\|\Lambda^k u_N\|_2^2\).

For clarity, the two tame bounds entering the differentiated
equation are as follows, with \(u=u_N\) and \(\widehat C,\widehat L\)
evaluated at \(j(u)\). The smooth composition estimate on the
fixed charts gives
\[
 \|\widehat C\|_{H^k}+\|\widehat L\|_{H^k}
          \leq C_{k,M_2}(1+\|u\|_{H^{k+1}}).
\]
The first jet is bounded in value by \(M_2\) and its \(H^k\)
norm is bounded by \(\|u\|_{H^{k+1}}\).
For the principal commutator with a coefficient,
\[
 \|[\Lambda^k,\widehat C^{ij}]D_iD_j u\|_2
 \leq C_k\bigl(\|\widehat C\|_{C^1}\|u\|_{H^{k+1}}
                   +\|\widehat C\|_{H^k}\|u\|_{C^2}\bigr).
\]
These are the same chart composition and commutator allocations
as in E29. Taylor (3.1.20) takes \(p=2,\ s=k\) and a fixed
derivative order greater than \(k\) in the coefficient
bound, using the bounded value range of the first jet.
Explicit \(x\) dependence can be included as fixed smooth
additional components in charts. The smoothing remainder in
that formula is bounded at fixed \(M_2\) on the chart cutoffs.
Taylor Proposition 3.6.A with \(\sigma=0,\ p=2,\ s=k\)
gives the commutator bound, applied componentwise to the
scalar top part of the fixed localized differential operator
and \(D_iD_j u\). Its fixed matrix-valued lower part has
order at most \(k-1\), so the tame product bound there uses
at most \(H^{k-1}\) of \(\widehat C\) and \(H^{k+1}\) of \(u\).
Moving \(\Lambda^k\) past the fixed \(D_iD_j\) costs order
at most \(k+1\) by the scalar top symbol. The cutoffs and
fixed curvature commutators have the same or lower order.
Thus the differentiated lower and commutator terms have
\(L^2\) bound \(C_{k,M_2}(1+\|u\|_{H^{k+1}})\). Multiplying
by \(\|\Lambda^k u\|_2\) and applying Young's inequality
to the principal gradient margin gives
\[
 \frac{d}{dt}E_k(u_N)+c_{k,M_2}\|u_N\|_{H^{k+1}}^2
     \leq C_{k,M_2}(1+E_k(u_N)),\qquad
 E_k(u)=\|\Lambda^k u\|_2^2 .                                      \tag{6}
\]
The constants are independent of \(N\). [E29, steps 2–5][e29] ·
[Taylor, (3.1.20) and Proposition 3.6.A][tay].

There is a fixed \(C_6\) so that \(E_6(Q_Nu_0)\leq C_6R^2\).
Set \(L_6=2(1+C_6R^2)\). As long as \(E_6(u_N)\leq L_6\),
the \(H^6\) embedding into \(C^2\) bounds \(M_2\) by a
constant depending only on \(L_6\) and the fixed bundle.
Let \(K_6=C_{6,M_2}\) denote the coefficient on the right of
(6) for this \(M_2\), with \(k=6\). Choose
\[
 T_{\rm loc}=\frac{\log(3/2)}{1+K_6}>0 .
\]
The estimate \(1+E_6(u_N(t))\leq (1+C_6R^2)e^{K_6t}\)
on the first interval where \(E_6\leq L_6\) prevents a
first hit before or at \(T_{\rm loc}\). The finite ODE
continues there by this bound. For each higher even \(k\)
the same \(M_2\) and duration give (6) with high energy
controlled by the individual \(\|u_0\|_{H^k}\).
Those high energies enter the bounds on the solutions
and leave the choice of \(T_{\rm loc}\) independent of them.

The equation gives a uniform bound on \((u_N)_t\) in
\(L^\infty H^{k-2}\) for each such \(k\), since the
projections are bounded in the equivalent spectral norms.
Interpolation with the \(H^k\) bound gives equicontinuity
in \(H^{k-1}\), and compact embedding gives subsequential
convergence in \(C([0,T_{\rm loc}];H^{k-1})\) at each \(k\)
by diagonal extraction. The limit solves the cutoff equation.
The smooth coefficient maps and enough spatial Sobolev norms
give convergence of its right-hand side, and \(Q_N\) converges
strongly on each of the fixed Sobolev spaces used here by
spectral approximation. The continuous spatial norms of
every order and the equation give a continuous first time
derivative in each spatial norm by integrating the equation
in time. Differentiation of the smooth coefficient expressions
then gives all higher time derivatives continuously up to
zero. The strong initial trace is \(u_0\), so the limit is
a smooth solution on the closed local slab.

## Comparison with the energy solution and restart

Let \(\widetilde u\) be any such smooth cutoff solution on a
translated slab where its initial value equals that of \(a\).
Both solve the same cutoff equation. Put \(w=a-\widetilde u\).
Subtracting the two equations with leading coefficient taken
at \(j(a)\) gives
\[
 w_t=\widehat C^{ij}(x,j(a))D_iD_j w+M_1(Dw)+M_0w .               \tag{7}
\]
The zero- and first-order terms follow by a mean-value
linearization on the segment from \(j(\widetilde u)\) to \(j(a)\).
For the leading coefficient difference its multiplier is
\(D^2\widetilde u\). The smooth cutoff coefficients and the
\(C^2\) bounds of both paths make \(M_0,M_1\) bounded on the
slab. Also \(\widehat C(x,j(a))\) is uniformly \(C^1\) in
space and retains the rank-one bound there. Its Gårding
estimate follows from the same freezing argument as in (6).
Integrating the leading term against \(w\) gives a negative
gradient term \(-c\|Dw\|_2^2\) up to a fixed multiple of
\(\|w\|_2^2\) and the coefficient derivative term
bounded by \(C\|Dw\|_2\|w\|_2\).
The first-order term in (7) has the same cross bound.
Young's inequality absorbs them, giving
\[
 \frac{d}{dt}\|w\|_2^2\leq C\|w\|_2^2 .
\]
This computation applies in the claimed regularity:
\(w\in C H^m\cap L^2 H^{m+1}\) on the finite slab and
\(w_t\in L^2 H^{m-1}\), so the \(L^2\) energy identity is
valid by time regularization or its Hilbert-space
absolutely continuous representative. The strong initial
trace gives \(w=0\) there and integration gives \(w=0\)
on the whole slab. Thus the smooth cutoff solution agrees
with the fixed-point solution and its jets also lie in the
region where \(\chi=1\).

Start at zero with \(a_{\rm in}\). The comparison shows the
fixed point is smooth on \([0,T_{\rm loc}]\).
At times \(t_j=jT_{\rm loc}/2\), the datum is smooth by
the preceding local comparison and the global bound gives
the same \(H^6\) norm bound \(R\). Use the same cutoff and
the same lifespan \(T_{\rm loc}\) from each such time.
The overlaps identify the smooth solutions by (7), giving
smoothness at all positive times and up to the initial
slice. This proves \(H_{\rm st}\) for the fixed round gauge.
The estimate and regularity proof here concern smooth initial
data in that gauge. Gauge recovery and small-value transfer
are separate steps.

## Source dependence

The analytic inputs are the assessed [E47][e47] inverse and
[E48][e48] estimates, and the E29 chart and Galerkin construction
with the explicit lifespan and comparison above. The two
Taylor bounds used there were rechecked remotely on 22 November
2026 in Michael E. Taylor, *Pseudodifferential Operators and
Nonlinear PDE*, Birkhäuser Boston, Progress in Mathematics
**100** (1991), DOI 10.1007/978-1-4612-0431-2, undated
author-hosted version. The passages are §3.1, (3.1.18)–(3.1.20),
printed p. 66, and §3.6, Proposition 3.6.A, (3.6.14),
printed p. 94. The localization and evolution estimates
above are the compact-bundle argument, with no external
nonlinear stability theorem needed. Fine's native conventions
and linear operator retain the frozen arXiv:1111.5005v2
dependence already checked in E47–E48.
[Taylor author-hosted PDF][tay] · [E47–E48 assessment][lead].

[req]: ../research-progress/handoffs/SP4-CME-E49_REQUEST_v1.md
[e50]: ../research-progress/handoffs/SP4-CME-E50_REQUEST_v1.md
[b35]: ../brainstorm/notes/B35_FIXED_STABILITY_GAUGE_20261122.md
[b36]: ../brainstorm/notes/B36_SMOOTHING_TO_STABILITY_20261122.md
[lead]: ../reviews/E47_E48_STABILITY_INPUTS_ASSESSMENT_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[e47]: 47_ROUND_STABLE_LINEAR_20261122.md
[e48]: 48_FIXED_STABILITY_GAUGE_20261122.md
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
