# SP4-CME-E16B — conditional nonlinear strain energy estimate

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This is the analytic check in the
[frozen request][request] under the [B15 decision][decision]. The [return][return]
records the frozen versions and the separately received round-gap dependency.

## Statement and conventions

Let \(A(t)\) be a smooth solution of the actual unadjusted Fine flow on a
closed, smooth, oriented real four-manifold, on a definite interval in a
fixed base and bundle identification. The oriented Euclidean rank-three
bundle uses \([e_i,e_j]=\epsilon_{ijk}e_k\) and the manuscript's internal
metric \(\delta_{ij}=-2\operatorname{tr}_{\mathbb C^2}(e_ie_j)\).
With \(K>0\) fixed and round-compatible sign, write
\[
 F=-KS\Sigma,\quad S=Q^{1/2}>0,\quad q=Q-I,\quad \operatorname{tr}Q=3,
 \qquad \mu=2K^2dV_g,\quad \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_g,
\]
where \(g=\widehat g_A\). Time is the manuscript clock
\(A_t=-4d_A^{*g}[(q-|q|^2I/6)F]\). Use \(\nabla=\nabla^A\) for the
spatial connection with \(A\) on internal slots and the instantaneous
Levi–Civita connection on base slots. Norms are Frobenius internally
and use \(g\) on all base slots. The rough Laplacian
\(\Delta_A=\nabla^a\nabla_a\) has nonpositive sign. The time derivative
uses fixed base coordinates and a time-independent orthonormal internal
frame.

Define \(X_c=\nabla_cQ\), \(T_c=\tfrac12(S^{-1}X_cS^{-1})_0\), and
\[
 E_T(t)=\int_M |T|^2\,dV_g,\qquad
 D_T(t)=\int_M |\nabla T|^2\,dV_g.
\]
There are finite universal \(C>0\) and \(0<\epsilon_0\le1/8\) such that on
any such interval with \(\sup_M|q|\le\epsilon_0\),
\[
 \boxed{\ \frac{d}{dt}E_T
  \le -D_T-K E_T+C\int_M |T|^4\,dV_g .\ }
 \tag{A}
\]
Universality refers to dimension four and the specified norms and
conventions. No comparison to a fixed coordinate metric is used.

## Exact remainder and pointwise estimate

Use [E15 (1)–(4)][strain]. In its notation the internal maps on
trace-free symmetric matrices are
\[
 G_Q(H)=\tfrac12(S^{-1}HS^{-1})_0,\qquad
 M_Q(V)=2SVS-\tfrac23\operatorname{tr}(QV)Q,\qquad
 \mathscr L_Q(H)=2(QH+HQ)-\tfrac43\operatorname{tr}(QH)Q .
\]
Here \(X_c=M_Q(T_c)\), \(G_Q=M_Q^{-1}\) and
\(G_Q\mathscr L_Q M_Q=\mathscr L_Q\). Put
\(b=A-\Gamma^+\), \(\Xi_a=2[\nabla_aS,S]+4S\operatorname{ad}(b_a)S\)
and \(f(Q)=\sqrt{\det Q}\), with \(\Gamma^+\) transported to \(E\) by
\(\Sigma/\sqrt2\). The \(Q\) equation is
\(Q_t=\mathscr L_Q(\Delta_AQ)+\mathcal N\), where
\[
 \mathcal N=-24K f(Q)q+\sum_a\left(
  4X_a^2-\tfrac43\operatorname{tr}(QX_a)X_a
  -\tfrac43|X_a|^2Q+[X_a,\Xi_a]\right).
\]
The exact strain equation can be written
\[
 \begin{aligned}
 \partial_t T_c={}&\mathscr L_Q((\Delta_A T)_c)\\
 &+G_Q\mathscr L_Q\left(\mathcal K_c+
    2(\nabla^a M_Q)((\nabla_a T)_c)+(\Delta_A M_Q)(T_c)\right)\\
 &+G_Q\left((\nabla_c\mathscr L_Q)(\Delta_A Q)
             +\nabla_c\mathcal N+[\operatorname{ad}(v_c),Q]\right)
        +(D_QG_Q)\bigl([Q_t]\bigr)(X_c),\\
 \mathcal K_c={}&-\operatorname{Ric}_c{}^aX_a+
                    2[\operatorname{ad}(F_{ca}),X^a].
 \end{aligned}
 \tag{1}
\]
The internal curvature divergence vanishes by Bianchi and self-duality
as in E15 (2). The last summand of \(\partial_t T_c\) differentiates both
inverse square roots in \(G_Q\), using
\((S^{-1})_t=-S^{-1}S_tS^{-1}\) and \(SS_t+S_tS=Q_t\).

Assume \(|q|\le1/8\) throughout this calculation. This puts \(Q\) in the
compact trace-three set with eigenvalues in \([7/8,9/8]\). The matrix
functions above, the square root, and their necessary derivatives are
bounded there. This follows from smoothness on an open neighborhood of
the set in the positive cone, including smooth square roots at repeated
eigenvalues. The connection differentiations are tensorial. Constants
can be evaluated in instantaneous adapted orthonormal frames, where
\(\Sigma\) has the fixed normalized coefficients. Write \(c\) for finite
universal constants which can increase between estimates.

The covariant product rule gives
\(\nabla_aX_c=M_Q((\nabla_aT)_c)+(D_QM_Q)\bigl([X_a]\bigr)(T_c)\), including the
base index \(c\). The exact velocity is \(v_b=4C^aF_{ab}\), with
\(C_c=X_c-\operatorname{tr}(QX_c)I/3\). Consequently
\[
 |X|\le c|T|,\qquad |\nabla X|+|\Delta_AQ|
    \le c(|\nabla T|+|T|^2),\qquad |F|\le cK,\qquad |v|\le cK|T|.
 \tag{2}
\]
By the spatial Sylvester chain rule,
\(\nabla S=DS[X]\) and \(\nabla^2S=DS[\nabla X]+D^2S[X,X]\).
[E09][curvature] gives \(|b|\le c|T|\) and
\(|\nabla^\Gamma b|\le c(|\nabla T|+|T|^2)\). Switching to the internal
\(A\)-derivative of \(b_c\) adds \([b_a,b_c]\) to its \((a,c)\) component.
In particular
\[
 |\Xi|\le c|T|,\qquad |\nabla\Xi|\le c(|\nabla T|+|T|^2).
 \tag{3}
\]
This accounts for \(\nabla b\) and \(\nabla^2S\) in the differentiated
\(\Xi\) without any second derivative of \(T\).

### Round reaction, Ricci correction and exact term degrees

In an instantaneous adapted orthonormal frame compare \(F=-KS\Sigma\)
with the tensor \(F^\circ=-K\Sigma\) at that point. The round-compatible
label identifies its components with \(-K\eta_{i,ca}\) as in E16A.
The \(-3K g\) part of the Ricci contraction in (1) gives
\(-3K\mathscr L_Q(T_c)=-12KT_c+O(K|q||T|)\).
For its remaining part E09 gives
\[
 |\operatorname{Ric}-3Kg|
 \le \sqrt{12}\bigl(K|q|+6|\nabla T|+(42+8\sqrt3)|T|^2\bigr).
\]
It multiplies \(X=O(T)\) in (1). There is no derivative of Ricci here.
The internal curvature contraction
\(2G_Q\mathscr L_Q[\operatorname{ad}(F_{ca}),M_Q(T)^a]\)
is \(K\) times a smooth linear map of \(T\) in this adapted frame.
At \(Q=I\) it is \(8[\operatorname{ad}(F^\circ_{ca}),T^a]\), since
\(G_I=\tfrac12 I\), \(\mathscr L_I=4I\), \(M_I=2I\) as operators.
Its difference from that operator is \(O(K|q||T|)\) by the bounded
coefficient derivative. Finally,
\[
 G_Q\nabla_c(-24K f(Q)q)
 =-24K f(Q)T_c-24K(D_Q f)[X_c]G_Q(q).
\]
Because \(f(I)=1\), its round part is \(-24KT_c\) and its error is
\(O(K|q||T|)\). Thus the isolated reaction is
\[
 Z^\circ(T)_c=-36KT_c+8[\operatorname{ad}(F^\circ_{ca}),T^a].
 \tag{4}
\]

The remaining terms of (1) have these precise degrees.

- \(\nabla M_Q=DM_Q[X]\) and \(\nabla\mathscr L_Q=D\mathscr L_Q[X]\)
  are \(O(|T|)\). Here
  \(D\mathscr L_Q\bigl([X]\bigr)(H)=2(XH+HX)-\tfrac43\operatorname{tr}(XH)Q-
  \tfrac43\operatorname{tr}(QH)X\).
  Also \(\Delta_A M_Q=DM_Q[\Delta_AQ]+\sum_a D^2M_Q[X_a,X_a]\)
  is \(O(|\nabla T|+|T|^2)\). Their products in (1) are
  \(O(|T||\nabla T|+|T|^3)\).
- The derivatives of \(X_a^2\) are products of \(X_a\) and \(\nabla X_a\).
  Those of \(\operatorname{tr}(QX_a)X_a\) use two factors \(X_a\) and one
  \(X_c\), or one \(\nabla X_a\) and one \(X_a\). The derivatives of
  \(|X_a|^2 Q\) similarly use \(\langle X_a,\nabla X_a\rangle Q\) and
  \(|X_a|^2X_c\). Differentiating \([X_a,\Xi_a]\) introduces either
  \(\nabla X_a\) or \(\nabla\Xi_a\) in one factor. Equations (2)–(3)
  give \(O(|T||\nabla T|+|T|^3)\) for all these terms.
- The velocity commutator is \([\operatorname{ad}(v_c),q]\),
  thus \(O(K|q||T|)\).
- The exact \(Q\) equation gives
  \(|Q_t|\le c(|\nabla T|+|T|^2+K|q|)\). Since the derivative of
  \(G_Q\) is bounded, its time term is at most \(c|Q_t||T|\).

This yields the pointwise decomposition
\[
 \partial_t T=\mathscr L_Q(\Delta_A T)+Z^\circ(T)+\mathcal E,\qquad
 |\mathcal E|\le c(K|q||T|+|T||\nabla T|+|T|^3).
 \tag{5}
\]
The remainder contains no second derivative of \(T\). It and \(Z^\circ\)
vanish at a point where \(T=0\), regardless of \(\nabla T\) there. The
principal term can remain.

## Energy identity with moving metric

The separately checked [E16A operator][round] is self-adjoint with
eigenvalues \(-52K,-12K\) of multiplicities twelve and eight in the
normalized \(\eta\) frame. Hence
\(\langle T,Z^\circ(T)\rangle\le-12K|T|^2\) on the full tensor space.
The estimate does not require a constraint on the strain curl.

Write \(H_g=g^{-1}g_t\) and
\(\mathcal A_T=(\langle T_c,T_d\rangle)_{cd}\) in an instantaneous
orthonormal base frame. The inverse metric differentiates by
\(\partial_t g^{cd}=-g^{ca}(g_t)_{ab}g^{bd}\). Since the unadjusted
flow fixes \(dV_g\) pointwise, the exact norm identity is
\[
 \frac{d}{dt}E_T
   =2\int_M\langle T,\partial_t T\rangle\,dV_g
     -\int_M\langle H_g,\mathcal A_T\rangle\,dV_g .
 \tag{6}
\]
The positive semidefinite Gram matrix satisfies
\(|\mathcal A_T|\le\operatorname{tr}\mathcal A_T=|T|^2\).
By [E14][metric],
\(|H_g|\le4512\sqrt2(|\nabla T|+|T|^2)\).
Thus the moving inverse metric contributes at most
\(4512\sqrt2(|T|^2|\nabla T|+|T|^4)\) in absolute value to the
integrand. The trace condition on \(H_g\) does not eliminate this term.

Integrate the self-adjoint principal operator in the instantaneous
metric on the closed base:
\[
 2\int_M\langle T,\mathscr L_Q(\Delta_A T)\rangle\,dV_g
 =-2\int_M\langle\nabla T,\mathscr L_Q(\nabla T)\rangle\,dV_g
   -2\int_M\langle T,(\nabla^a\mathscr L_Q)(\nabla_a T)\rangle\,dV_g.
\]
By E15, \(\mathscr L_Q\ge4\lambda_{\min}(Q) I\ge(7/2)I\) in the
Frobenius pairing. The first integral is bounded above by \(-7D_T\).
The second is bounded in absolute value by \(c\int|T|^2|\nabla T|\,dV_g\)
by the coefficient derivative above. Using (5)–(6) and the round gap
gives finite universal \(c_0,c_1,c_2\ge0\) such that
\[
 E_T'\le-7D_T-24K E_T+c_0K(\sup_M|q|)E_T
           +c_1\int_M |T|^2|\nabla T|\,dV_g
           +c_2\int_M |T|^4\,dV_g .
\]
Choose \(\epsilon_0=\min\{1/8,(1+c_0)^{-1}\}\), so the first reaction
error is at most \(K E_T\) on the pinched interval. Apply Young only
to the mixed term using
\(c_1|T|^2|\nabla T|\le|\nabla T|^2+(c_1^2/4)|T|^4\).
With \(C=\max\{1,c_2+c_1^2/4\}\), the bound is
\(-6D_T-23K E_T+C\int|T|^4\,dV_g\), which implies (A).

## Conditional Sobolev consequence

Suppose throughout that same interval the scalar Sobolev inequality
\[
 \|u\|_{L^4(g)}^2
 \le C_S\left(\int_M |du|_g^2\,dV_g+K\int_M u^2\,dV_g\right)
\]
holds with one finite \(C_S>0\), and
\(\|T(t)\|_{L^4(g(t))}^2\le(2 C C_S)^{-1}\) at every time.
By the Kato inequality for the metric connection,
\(|d(|T|)|\le|\nabla T|\) almost everywhere. Applying the scalar
inequality to \(|T|\), with smooth approximation at its zeros, gives
\[
 C\int_M |T|^4\,dV_g
 \le C C_S\|T\|_{L^4(g)}^2(D_T+K E_T)
 \le \tfrac12(D_T+K E_T).
\]
Then \(E_T'\le-\tfrac12D_T-\tfrac12K E_T\) and
\(E_T(t)\le e^{-K(t-t_0)/2}E_T(t_0)\) for \(t\ge t_0\) in the
given interval. The rate \(K/2\) is for squared \(L^2\) strain.
The pointwise pinching, uniform Sobolev constant, and critical-norm
smallness are all interval assumptions. The bound provides integrated
\(L^2\) spatial gradient control. The time integral of the spatial
supremum of \(|\nabla T|+|T|^2\), continuation, and convergence
require separate arguments.

[request]: ../research-progress/handoffs/SP4-CME-E16B_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E16B_RETURN_v1.md
[decision]: ../brainstorm/notes/B15_STRAIN_ENERGY_TEST_20261122.md
[strain]: 17_STRAIN_EVOLUTION_STRUCTURE_20261122.md
[curvature]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[metric]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
[round]: 18A_ROUND_STRAIN_REACTION_20261122.md
