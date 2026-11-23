# SP4-CME-E115 — Finite-window differentiation of an original-flow budget

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E50 and E63. I did not
author E42, E84 or E112. I checked the manuscript integration of
the rough construction in E46 and audited E84 in E86. The five
frozen input digests matched. E114 review was pending at issue of
the request and returned an independent pass on the same E112
digest during this work. The lead then accepted the actual round
linearized result at its stated scope. The inference below uses
that frozen calculation. [Request][req] · [B62][b62] ·
[E114 audit][e114] · [E112/E114 assessment][a112] · [Return][ret].

## Fixed-window test and conclusion

On the smooth closed oriented standard round \(S^4\), fix the
positive perfect chiral \(\mathrm{SO}(3)\) connection \(A_0\)
on the actual bundle, with negative Killing internal pairing.
Write \(G=g^{\rm F}_{A_0}\) for its native metric of sectional
curvature \(1/2\), \(F_0=F_{A_0}\), \(d_0=d_{A_0}\), and \(D_0\)
for the product covariant derivative with the fixed Levi–Civita
connection on base slots. Denote a live native metric by \(G_A\).
Use native time \(\tau\) throughout. The budget in question is
\[
 J(A_{\rm in})=\int_0^\infty
    \sup_{S^4}\bigl(|\nabla^A T(A)|_{G_A}+|T(A)|_{G_A}^2\bigr)
       \,d\tau
\]
along the original smooth Fine flow. The proof uses the full
covariant derivative of the endomorphism-valued one-form \(T\),
including its one-form base slot. For \(c=2K\), the changes
\(G_A=c\widehat g_A\) and \(\tau=ct\) multiply both
\(|\nabla T|\) and \(|T|^2\) by \(c^{-1}\) and time measure by
\(c\), preserving the budget. The live \(L^4\) strain norm is also
unchanged, since \(|T|^4\) and volume gain \(c^{-2}\) and \(c^2\).
[E84 (3)–(5), native budget][e84].

The frozen E112 lower bound implies that there are no
\(C,\rho,\eta>0\) such that
\[
 J(A_{\rm in})\le C\|T(A_{\rm in})\|_{L^4(G_{A_{\rm in}})}
 \tag{1}
\]
for every smooth actual datum in the established round value
basin subject to
\[
 \|A_{\rm in}-A_0\|_\infty+
      \|F_{A_{\rm in}}-F_0\|_\infty<\rho,\qquad
 \|T(A_{\rm in})\|_{L^4(G_{A_{\rm in}})}<\eta .
\]
The two value norms use the fixed native reference. The derivation
below passes (1) to a finite-window linear estimate at the
stationary datum. The E112 lower bound and initial bound are used
only after taking that derivative at each fixed \(N\).
[E112, statement and window proof][e112].

Fix E42 at \(A_0\) with common native adjusted time \(\mathcal T\)
and the E50 splice \(\tau_s=\mathcal T/2\). In E112 use
\(r_j=b_*R^{-j}\) with the fixed scale ratio \(R\) and an upper
scale \(b_*>0\) chosen in its proof. Fix \(b_*\) small enough
that \(\beta r_1^2/4<\tau_s/2\), where \(\alpha,\beta\)
are the endpoints of its heat-time scale window. The E112
choices of \(R,\alpha,\beta\) precede this upper-scale choice.
Shrinking \(b_*\) decreases the own-scale error and the upper
heat-time bound. The off-scale estimates use only radius ratios
and fixed coefficient bounds, and the native damping lower
bound \(e^{-3\beta r_1^2}\) is positive uniformly in \(N\).
The same construction consequently supplies, with constants
\(c_*,C_*>0\) independent of \(N\),
\[
 \begin{gathered}
 I_j=[\alpha r_j^2/4,\beta r_j^2/4],\qquad
 W_N=\bigcup_{j=1}^N I_j,\\
 \int_{W_N}\|D_0 T_N(\tau)\|_{\infty,G}\,d\tau
        \ge c_*\sqrt N,\qquad
 \|T_N(0)\|_{4,G}\le C_* N^{-1/4}.
 \tag{2}
\end{gathered}
\]
Here \(s=4\tau\) is E112's heat time. Its annuli and window
estimates are applied at the chosen fixed scale, with no
additional relation between \(N\) and \(\mathcal T\).
For each \(N\), the windows lie in the compact positive-time
strip \(I_N=[\alpha r_N^2/8,\tau_s/2]\) inside the recovered
head. [E112 (6), (9)–(12) and native windows][e112].

## Differentiability from the joint lifted parameter map

Fix \(N\). Use the affine curve of smooth actual data
\(A_{{\rm in},\varepsilon}=A_0+\varepsilon a_N\). Its centered
compatible pair is
\[
 u_\varepsilon
  =(\varepsilon a_N,\ \varepsilon d_0a_N+
                 \tfrac{\varepsilon^2}{2}[a_N\wedge a_N])
  =\varepsilon u'_0+O_N(\varepsilon^2),\qquad
 u'_0=(a_N,d_0a_N).
 \tag{3}
\]
For sufficiently small \(|\varepsilon|\) it belongs to the
common E42 ball and to the smooth value basin. This curve is
polynomial in the fixed \(C^0\) pair space \(\mathscr D\).
Write \(U_\varepsilon(\tau)\) for its compatible E42 head,
centered at \((A_0,F_0)\), and \(\mathcal A_\varepsilon\)
for its connection component before centering.

Use the E42 joint Fréchet smooth map
\(\Psi(s,u)\in \mathscr X=X_{\mathcal T}^{\circ}\) for the
transformed pair. Thus \(\Psi(0,u_\varepsilon)=U_\varepsilon\),
and \(\Psi(s,0)=0\) by stationarity and the lifted centered
equation. For parameter orders \(|\alpha|\le2\), the operators
\[
 G_\alpha(s,u)=D_u\partial_s^\alpha\Psi(s,u)
       \in\mathcal L(\mathscr D,\mathscr X)
\]
are continuous in operator norm. On the compact parameter
ball supplied by the E63 lifting argument, this gives
\(\sup_s\|G_\alpha(s,u)-G_\alpha(s,0)\|\to0\) as \(u\to0\).
Indeed, failure would give a sequence \(s_n\) in the compact
ball with a convergent subsequence, contradicting joint
continuity at its limit and zero datum. All these operators
are defined on a common smaller datum ball about zero by
the E63 compact-parameter construction. The mean value
identity therefore gives, uniformly in that parameter ball,
\[
 \frac{\partial_s^\alpha\Psi(s,u_\varepsilon)
       -\partial_s^\alpha\Psi(s,0)}{\varepsilon}
 \longrightarrow G_\alpha(s,0)[u'_0]
 \quad\text{in }\mathscr X.
 \tag{4}
\]
In fact the error is bounded by a fixed operator bound times
\(\|u_\varepsilon/\varepsilon-u'_0\|_{\mathscr D}\) and
\(\|u_\varepsilon/\varepsilon\|_{\mathscr D}\) times
\(\sup_{s,\theta\in[0,1]}\|G_\alpha(s,\theta u_\varepsilon)
-G_\alpha(s,0)\|\). This uses differentiability of the joint
map. A Lipschitz estimate alone would not give (4).
[E42, positive-time parameters][e42] · [E63 (3)–(5)][e63] ·
[Local construction assessment][a42] · [Smoothing assessment][a63].

On a patch over any fixed compact positive-time strip \(I\),
the E63 inverse maps express the untransformed pair as
\(P_*(\tau,y)E_{\tau,x_*}\Psi(s_*(\tau,y),u_\varepsilon)\),
with \(P_*\) the fixed inverse transport and \(E_{\tau,x_*}\)
bounded evaluation on \(\mathscr X\). Spatial differentiation
through order two yields the finite sums in E63 (8).
The coefficients are fixed smooth functions on compact
subpatches, and each evaluated term is a parameter derivative
covered by (4). A finite patch cover thus gives
\[
 \frac{U_\varepsilon}{\varepsilon}\longrightarrow U'_N
 \quad\text{in } C(I;C^2(S^4;\mathcal W)).
 \tag{5}
\]
The limit is the same as
\(U'_N=D_u\Psi(0,0)[u'_0]\) in \(\mathscr X\), since
that derivative already identifies the uniform value limit.
Each fixed lifted patch is continuous in \(\tau\) by bounded
evaluation and the continuous representatives in \(\mathscr X\).
This argument works on each fixed positive-time strip.
It also works at every fixed finite spatial order upon taking
the corresponding parameter derivatives. Evaluation of
\(\Psi(0,u)\) at \(\tau=0\) equals \(u\), so its derivative
has \(U'_N(0)=u'_0\) as a continuous value trace.
Equation (5) uses no spatial derivative convergence at zero.
All limits in (4)–(5) are taken at fixed \(N\).
[E63 (6)–(8)][e63] · [E42, trace and completion][e42].

## Identifying the actual round strain derivative

Write \(U'_N=(b_N,B_N)\), with \(B_N\) the curvature
component of the derivative. Compatibility and (5) give
\(B_N=d_0b_N\) at positive times, by differentiating the
actual curvature identity. Let \(q'_N\) denote the variation
of \(Q(\mathcal A_\varepsilon)\) at \(\varepsilon=0\).
Since \(Q\) is a smooth pointwise trace-normalized wedge
function of the curvature, (5) gives this derivative in
\(C(I;C^2)\). At positive times
\(q'_N=DQ_{A_0}(b_N)\). Its continuous value trace is
\(DQ_{A_0}(a_N)\) by the curvature component of (3) and
the \(\mathscr X\) derivative trace.
[E112 (2)][e112] · [E42, compatible passage][e42].

Use the E50 head equation in native time
\[
 \partial_\tau\mathcal A_\varepsilon
 =v_{\rm F}(\mathcal A_\varepsilon)
     -R(\xi_{\rm loc}(\mathcal A_\varepsilon),\mathcal A_\varepsilon).
 \tag{6}
\]
The correction is the infinitesimal left action, with
\(R(\phi+\chi_A(X),A)=-d_A\phi-\iota_XF_A\).
Its generator vanishes at \(A_0\) by E50 (6).
The right side of (6) is smooth in the connection and
curvature values and the required spatial jets of the pair.
The fixed-metric vertical expression has at most two
connection derivatives. The horizontal inner adjoint and
the physical term use first spatial derivatives of the
reconstructed metric, which is a smooth function of \(F\).
On any fixed positive-time strip, (5) allows differentiation
of (6) in its time-integrated form, or in time distributions.
The derivative of the correction is \(R(\xi'_N,A_0)\).
The derivative in the base connection of the action
at the zero generator is zero.
[E50 (5)–(6)][e50] · [E84 (7)][e84].

The exact identity \(Q(g^*A_0)=I\) for a smooth isotopy of
the round bundle implies \(DQ_{A_0}\big(R(\zeta,A_0)\big)=0\)
for its invariant infinitesimal generator \(\zeta\).
This kills the differentiated correction independently of
its split into vertical and horizontal parts. Equivalently
this follows from the tangent identity in E112 for
\(d_0\phi+\iota_X F_0\), with either overall sign.
One can apply the identity after taking additional finite
spatial orders in (5), or distributionally using spatial
approximation of the generator.

For the physical term, write \(q=Q-I\) and use
\(4Q-\frac23\operatorname{tr}(Q^2)I=2I+4q-\frac23|q|^2I\).
The \(2I\) term is annihilated by the live adjoint since
the curvature is self-dual and satisfies Bianchi. The variation
at \(q=0\) is consequently
\(Dv_{\rm F}(A_0)b_N=-4d_{0,G}^*(q'_NF_0)\).
Acting by \(DQ_{A_0}\), the native linear composition
of E112 (3) gives
\[
 \partial_\tau q'_N=-(4\mathcal L+12)q'_N,\qquad
 \mathcal L=D_0^*D_0\text{ on }\operatorname{Sym}^2_0E.
 \tag{7}
\]
The calculation is already in native time and introduces no
clock factor beyond the one in E112's \(s=4\tau\).
Equation (7) and the continuous trace identify \(q'_N=q_N\)
on the head. For example start the \(L^2\) difference energy
identity at any positive time and send that time down to
zero using the common trace. The skew correction from the
connection variation in \(\nabla^A I\) is zero.
Thus the derivative of the exact strain is
\[
 T_N=\tfrac12D_0q_N .
\]
The derivative of the square-root factors in the strain
formula is multiplied by the zero reference covariant
derivative of \(Q\). [E112 (2)–(3)][e112] ·
[E84 (2)–(4), (7)][e84].

## Passage to the live norm and contradiction

On \(I_N\), (5) and the smooth matrix formula for the strain
give \(T(\mathcal A_\varepsilon)/\varepsilon\to T_N\) in
\(C(I_N;C^1)\). Smooth metric reconstruction also gives
\(G_{\mathcal A_\varepsilon}\to G\) in \(C(I_N;C^2)\).
The difference between \(\nabla^{\mathcal A_\varepsilon}\)
and \(D_0\) on a strain tensor is the algebraic internal action
of \(\mathcal A_\varepsilon-A_0\) on its endomorphism slot
and the Levi–Civita difference on its one-form base slot.
Both coefficients tend to zero uniformly on \(I_N\).
It follows that
\[
 \frac{\nabla^{\mathcal A_\varepsilon}
             T(\mathcal A_\varepsilon)}{\varepsilon}
       \longrightarrow D_0T_N
       \quad\text{in } C(I_N;C^0).
 \tag{8}
\]
This retains both base slots. The live tensor norms converge
uniformly to the fixed norms and the live volume ratio tends
uniformly to one. Thus for \(\varepsilon\downarrow0\) the
scaled live supremum in (8) converges uniformly as a function
of time to \(\|D_0T_N\|_{\infty,G}\).

At the initial slice the smooth polynomial curve (3) gives
the strain derivative \(T_N(0)=\tfrac12D_0DQ_{A_0}(a_N)\)
directly, along with uniform metric and volume convergence.
For this initial calculation \(a_N\) is fixed and smooth.
Hence
\[
 \lim_{\varepsilon\downarrow0}
 \frac{\|T(A_{{\rm in},\varepsilon})\|_{L^4(G_{A_{{\rm in},\varepsilon}})}}
      {\varepsilon}
      =\|T_N(0)\|_{4,G}.
 \tag{9}
\]
In particular the initial strain condition of (1) holds
for each fixed \(N\) and sufficiently small \(\varepsilon>0\).

The smooth basin recovers the actual solution at every head
slice by an orientation-preserving bundle pullback of
\(\mathcal A_\varepsilon\). Equation (8) concerns the adjusted
solution. E84 (3)–(5) identifies, at each \(\tau\), the full
covariant strain derivative and its live norm after pullback.
The spatial supremum agrees, irrespective of the time variation
or quantitative derivatives of the recovery map. No derivative
of that map in the perturbation parameter is needed.
[E50 (8)–(10)][e50] · [Round basin assessment][a50] ·
[E84 (3)–(5)][e84].

Assume (1). For each fixed \(N\), choose \(\varepsilon>0\) small
enough for the value and strain hypotheses. Discarding the
nonnegative square term and restricting the native time
integral to \(W_N\) gives
\[
 \int_{W_N}
  \frac{\|\nabla^{\mathcal A_\varepsilon}
         T(\mathcal A_\varepsilon)\|_{\infty,G_{\mathcal A_\varepsilon}}}
       {\varepsilon}\,d\tau
 \le C\,\frac{\|T(A_{{\rm in},\varepsilon})\|_{L^4(G_{A_{{\rm in},\varepsilon}})}}
                {\varepsilon}.
\]
The windows are a finite union in \(I_N\), so (8)–(9) pass
this inequality to the limit \(\varepsilon\downarrow0\).
Then (2) would give for every \(N\)
\[
 c_*\sqrt N
 \le\int_{W_N}\|D_0T_N\|_{\infty,G}\,d\tau
 \le C\|T_N(0)\|_{4,G}
 \le C C_*N^{-1/4}.
\]
Taking \(N\to\infty\) is impossible for fixed \(C\).
The tested assertion is the uniform estimate linear in the
initial live \(L^4\) strain. The differentiation constants may
depend on the finite data and strip. This gives no uniform
nonlinear remainder as \(N\) increases, unboundedness of
nonlinear \(J\) near zero, or failure of a general continuity
modulus. No new source or endpoint theorem is used.

[req]: ../research-progress/handoffs/SP4-CME-E115_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E115_RETURN_v1.md
[b62]: ../brainstorm/notes/B62_LINEARIZATION_TEST_AND_LORENTZ_THRESHOLD_20261122.md
[e112]: 112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e63]: 63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e84]: 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e114]: ../reviews/E114_ROUND_MULTISCALE_BUDGET_AUDIT_20261122.md
[a42]: ../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[a50]: ../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[a63]: ../reviews/E62_E67_GLOBAL_CRITICAL_ASSESSMENT_20261122.md
[a112]: ../reviews/E112_E114_ROUND_MULTISCALE_ASSESSMENT_20261122.md
