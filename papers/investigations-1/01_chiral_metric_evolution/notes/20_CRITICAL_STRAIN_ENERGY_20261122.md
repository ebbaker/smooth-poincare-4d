# SP4-CME-E19 — quartic strain energy and conditional critical-norm persistence

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. This is the fixed analytic test in
the [E19 request][request] under the [B17 decision][decision]. The
[packet return][return] records the input versions.

## Setting and test

Work on a smooth closed oriented real four-manifold with the actual
unadjusted Fine flow, on a given smooth definite interval in a fixed base
and bundle identification. The oriented Euclidean rank-three bundle
uses the manuscript's internal metric
\(\delta_{ij}=-2\operatorname{tr}_{\mathbb C^2}(e_ie_j)\) and bracket
\([e_i,e_j]=\epsilon_{ijk}e_k\). Let \(K>0\) be fixed, use the
round-compatible sign and put \(g=\widehat g_A\). The data satisfy
\[
 F=-KS\Sigma,\quad S=Q^{1/2}>0,\quad \operatorname{tr}Q=3,\quad q=Q-I,
 \quad \mu=2K^2 dV_g,\quad \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_g .
\]
The unadjusted equation is \(A_t=-4d_A^{*g}[(q-|q|^2I/6)F]\) in the
manuscript clock. In time use fixed coordinates and time-independent
local orthonormal internal frames. At each time use \(\nabla=\nabla^A\)
with \(A\) on internal slots and the Levi–Civita connection of \(g\) on
base slots. The norms and contractions use the Frobenius pairing
internally and \(g\) on base slots, and
\(\Delta_A=\nabla^a\nabla_a\) is the nonpositive rough Laplacian.

Let
\[
 T_c=\tfrac12(S^{-1}\nabla_cQ S^{-1})_0,\qquad
 w=|T|^2,\qquad
 F_4=\int_M w^2\,dV_g,\qquad
 G_4=\int_M w|\nabla T|^2\,dV_g .
\]
Here the subscript \(0\) takes the trace-free part. The conclusion is
that there are universal \(\epsilon_1\in(0,1/8]\), \(c>0\), and finite
\(C>0\) such that under \(\sup_M|q|\le\epsilon_1\),
\[
 \boxed{\ F_4'\le-c G_4-K F_4+C\int_M |T|^6\,dV_g.\ }
 \tag{1}
\]
The uniform constants concern the fixed dimensions and conventions.
A uniform scalar Sobolev constant, together with sufficiently small
initial \(F_4^{1/2}\), then gives persistence and decay on that same
pinched smooth interval.

## Exact derivative and the non-scalar diffusion

Use the [E16B decomposition][e16b]
\[
 T_t=\mathscr L_Q(\Delta_A T)+Z^\circ(T)+\mathcal E,\qquad
 |\mathcal E|\le c_E\bigl(K|q||T|+|T||\nabla T|+|T|^3\bigr)
\]
valid for \(|q|\le1/8\). The internal coefficient is
\(\mathscr L_Q(H)=2(QH+HQ)-\tfrac43\operatorname{tr}(QH)Q\)
on trace-free symmetric matrices, with action on each internal
component of \(T\). The algebraic comparison operator \(Z^\circ\)
is evaluated at the same point in the reconstructed adapted frame.
By [E16A][e16a],
\(\langle T,Z^\circ(T)\rangle\le-12K|T|^2\).
Let \(H_g=g^{-1}g_t\) and
\(\mathcal A_T=(\langle T_c,T_d\rangle)_{cd}\) in an instantaneous
orthonormal base frame. The derivative of \(g^{-1}\) in the norm
gives \(w_t=2\langle T,T_t\rangle-\langle H_g,\mathcal A_T\rangle\).
Since \(dV_g\) is time independent for this unadjusted equation, the
exact energy derivative is
\[
 F_4'
 =4\int_M w\langle T,T_t\rangle\,dV_g
       -2\int_M w\langle H_g,\mathcal A_T\rangle\,dV_g .
 \tag{2}
\]
The second integral is present even though \(H_g\) is trace free.

At a fixed time put \(B_a=\nabla_aT\) and \(U_a=\langle T,B_a\rangle\).
Metric compatibility gives \(\nabla_a w=2U_a\). On the closed base
integration by parts in the instantaneous metric gives exactly
\[
 \begin{aligned}
 4\int_M w\langle T,\mathscr L_Q(\Delta_A T)\rangle\,dV_g
  ={}&-4\int_M w\sum_a\langle B_a,\mathscr L_Q B_a\rangle\,dV_g\\
    &-8\int_M \sum_a U_a\langle T,\mathscr L_Q B_a\rangle\,dV_g\\
    &-4\int_M w\sum_a\langle T,(\nabla_a\mathscr L_Q)B_a\rangle\,dV_g .
 \end{aligned}
 \tag{3}
\]
In the second line the sign of the full contraction cannot be inferred
from positive definiteness of the matrix coefficient. Write
\(\mathscr L_Q=4I+R_Q\) on the internal trace-free space. Its exact
residual, using the Frobenius orthogonal projection \(P_0\), is
\[
 R_Q(H)=2P_0(qH+Hq)-\tfrac43\langle q,H\rangle q .
 \tag{4}
\]
Indeed the unprojected formula has \(Q\) in the rank-one term, and
\(P_0Q=q\). Formula (4) gives
\(\|R_Q\|_{\mathrm{op}}\le4|q|+\tfrac43|q|^2\) using
\(\|q\|_{\mathrm{op}}\le|q|\) and Cauchy–Schwarz. Differentiating (4)
also gives \(|\nabla\mathscr L_Q|\le c_L|\nabla Q|\le c_L'|T|\) on
\(|q|\le1/8\), for universal constants. In detail the derivative in
the direction \(X\) replaces \(qH+Hq\) by \(XH+HX\) and the rank-one
term by \(-\tfrac43(\langle X,H\rangle q+\langle q,H\rangle X)\).
The inverse strain formula in E16B bounds \(|\nabla Q|\) by \(c|T|\).

On this same pinched region \(\|R_Q\|_{\mathrm{op}}\le25/48\) and
\(\mathscr L_Q\ge4\lambda_{\min}(Q)I\ge(7/2)I\) in the Frobenius
pairing. The first line of (3) is therefore at most \(-14G_4\).
The scalar part of the cross term in the second line is the
nonpositive integral \(-32\int_M\sum_a U_a^2\,dV_g\).
Its residual part has absolute value bounded by
\(8(25/48)G_4\), since
\[
 |U_a\langle T,R_Q B_a\rangle|
   \le \|R_Q\|_{\mathrm{op}}\,|T|^2|B_a|^2 .
\]
Thus the first two lines of (3) give at most
\(-\tfrac{59}{6}G_4-8\int_M|dw|^2\,dV_g\).
The last line is bounded in absolute value by
\(4c_L'\int_M|T|^4|\nabla T|\,dV_g\).
No scalar assumption on \(\mathscr L_Q\) entered this estimate.

## Remaining degrees and absorption

The reaction term in (2) gives at most \(-48KF_4\).
The contribution of \(\mathcal E\) in (2) is bounded by
\[
 4c_E\int_M
  \bigl(K|q||T|^4+|T|^4|\nabla T|+|T|^6\bigr)\,dV_g .
\]
For the moving metric, \(\mathcal A_T\) is positive semidefinite and
\(|\mathcal A_T|\le w\). The [E14 metric velocity bound][e14] is
\(|H_g|\le4512\sqrt2(|\nabla T|+|T|^2)\). Consequently the absolute
value of the metric term in (2) is at most
\[
 9024\sqrt2\int_M\bigl(|T|^4|\nabla T|+|T|^6\bigr)\,dV_g .
\]
These are all remaining terms. There are finite universal
\(c_0,c_1,c_2\ge0\) with
\[
 F_4'\le-\tfrac{59}{6}G_4-8\int_M|dw|^2\,dV_g-48KF_4
  +c_0 K(\sup_M|q|)F_4
  +c_1\int_M |T|^4|\nabla T|\,dV_g
  +c_2\int_M |T|^6\,dV_g .
\]
Take \(\epsilon_1=\min\{1/8,(1+c_0)^{-1}\}\), so the reaction error
is at most \(KF_4\). Use Young on the single mixed degree,
\[
 c_1 |T|^4|\nabla T|
 \le |T|^2|\nabla T|^2+(c_1^2/4)|T|^6 .
\]
This leaves \(-\tfrac{53}{6}G_4-47KF_4\) and a sixth-power term
with coefficient \(c_2+c_1^2/4\), as well as the nonpositive
\(-8\int|dw|^2\,dV_g\). In particular (1) holds with \(c=8\) and
\(C=\max\{1,c_2+c_1^2/4\}\).

## Critical norm from its initial value

Suppose the same pinched interval \(I\) starts at \(0\), and throughout
it there is one uniform \(C_S>0\) such that the scalar inequality
\[
 \|u\|_{L^4(g(t))}^2
 \le C_S\left(\int_M|du|^2\,dV_g+K\int_M u^2\,dV_g\right)
\]
holds. Set \(Y=F_4^{1/2}=\|T\|_{L^4(g(t))}^2\).
Using \(u=w\), metric compatibility and Kato give
\(|dw|\le2|T||\nabla T|\). Equivalently this last inequality
follows directly from the smooth squared norm and holds at its
zeros as well. Hence
\[
 \|T\|_{L^8(g(t))}^4\le C_S(4G_4+KF_4).
\]
Hölder gives
\(\int_M|T|^6\,dV_g\le \|T\|_{L^4}^2\|T\|_{L^8}^4\).
The nonlinear term in (1) is therefore bounded above by
\(C C_S Y(4G_4+K F_4)\). Define the explicit threshold
\[
 Y_*=\frac1{C C_S}\min\{c/8,\;1/2\}.
\]
Whenever \(Y\le Y_*\) one has
\(F_4'\le-\tfrac c2 G_4-\tfrac K2 F_4\).

Assume \(Y(0)<Y_*\). Smoothness gives continuity of \(F_4\) and \(Y\)
on the given interval. If \(Y\) first reached \(Y_*\) at a time
\(t_*\) in it, the differential inequality on \([0,t_*]\) would
give \(Y(t_*)\le e^{-Kt_*/4}Y(0)<Y_*\), a contradiction.
The inequality therefore holds throughout the same interval. In
particular
\[
 F_4(t)\le e^{-Kt/2}F_4(0),\qquad
 \|T(t)\|_{L^4(g(t))}^2\le e^{-Kt/4}\|T(0)\|_{L^4(g(0))}^2 .
\]
The exponent for the \(L^4\) norm itself is \(K/8\).
This derives persistence from small initial \(L^4\) strain on the
given interval. The interval pinching hypothesis and uniform Sobolev
constant are still required. The weighted gradient integral in (1)
does not give a bound on the E14 time integral of the spatial
supremum of \(|\nabla T|+|T|^2\). Continuation and convergence are
outside the estimate.

[request]: ../research-progress/handoffs/SP4-CME-E19_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E19_RETURN_v1.md
[decision]: ../brainstorm/notes/B17_CRITICAL_STRAIN_BOOTSTRAP_20261122.md
[e16b]: 18B_STRAIN_ENERGY_ESTIMATE_20261122.md
[e16a]: 18A_ROUND_STRAIN_REACTION_20261122.md
[e14]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
