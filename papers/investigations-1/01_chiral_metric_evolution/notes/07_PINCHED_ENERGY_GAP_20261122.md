# SP4-CME-E05 conditional energy decay and stationary gap

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The helper launch configured `gpt-6.2-sol` /
`ultra`. Independent runtime introspection and the selected lead's actual
settings were unavailable. This is the fixed execution of the
[E05 request](../research-progress/handoffs/SP4-CME-E05_REQUEST_v1.md)
under the [B04 decision](../brainstorm/notes/B04_PINCHED_ENDPOINT_DECISION_20261122.md).
See the [return](../research-progress/handoffs/SP4-CME-E05_RETURN_v1.md)
for the checked input versions.

## Statement and premises

Let \(M\) be a smooth closed connected oriented real four-manifold and
\(E\to M\) a fixed oriented Euclidean rank-three bundle. Work with smooth
definite \(SO(3)\) connections \(A\) of positive curvature plane and
round-compatible curvature sign. Use the internal bracket
\([e_i,e_j]=\epsilon_{ijk}e_k\), the internal metric
\(\delta_{ij}=-2\operatorname{tr}_{\mathbb C^2}(T_iT_j)\) in the
local spin representation, and the positive Riemannian reconstruction
\[
 Q>0,\qquad \operatorname{tr}Q=3,\qquad
 F=-KS\Sigma,\qquad S=Q^{1/2},\qquad
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g},\qquad
 \mu=2K^2dV_{\widehat g}.
\]
Here \(K>0\) is fixed and \(F_i\wedge F_j=Q_{ij}\mu\).
Define \(q=Q-I\), \(H=q-|q|^2 I/6\), and
\(\mathcal P(A)=\int_M |q|^2\mu\). Matrix norms and pairings are
Frobenius, while covector indices use the instantaneous metric
\(\widehat g\). The unadjusted connection flow in the manuscript's time is
\[
 A_t=-4d_A^{*\widehat g}(HF)
\]
in a fixed bundle and base identification. All derivatives below use \(A\)
on internal indices and the instantaneous reconstructed Levi–Civita
connection on tangent indices.

If such a smooth solution satisfies \(|q(x,t)|\le1/8\) throughout
\(M\times[t_0,t_1]\), then
\[
 \boxed{\quad
 \mathcal P'(t)\le-2\int_M|\nabla^A Q|^2\mu-36K\mathcal P(t)
 \quad}
 \tag{1}
\]
on that interval. In particular, any smooth definite critical point
of \(\mathcal P\) with \(|q(x)|\le1/8\) on \(M\) is perfect.

## Exact integration and cancellation

Put \(X_c=\nabla_cQ\), \(\Delta_AQ=\nabla^c\nabla_cQ\),
\(b=A-\Gamma_A^+\), and \(\Xi_c=2[\nabla_cS,S]+4S\operatorname{ad}(b_c)S\),
where \(\Xi_c\) is skew. In the E02 equation, the nonlinear defect evolves by
\[
 \begin{aligned}
 Q_t={}&\mathscr L_Q(\Delta_A Q)-24K\sqrt{\det Q}\,q\\
       &+\sum_c\left(4X_c^2-\tfrac43\operatorname{tr}(QX_c)X_c
         -\tfrac43|X_c|^2Q+[X_c,\Xi_c]\right),\\
 \mathscr L_Q(T)={}&2(QT+TQ)-\tfrac43\operatorname{tr}(QT)Q,\qquad
 \mu_t=0 .
 \end{aligned}
 \tag{2}
\]
The \(c\)-sums in (2) are evaluated in an instantaneous
\(\widehat g\)-orthonormal frame. Pointwise density conservation
holds for this very vector field in the fixed base identification.
[E02A exact derivative](04A_NONLINEAR_Q_20261122.md).

For a trace-free symmetric variation \(X\) of \(Q\) and
trace-free symmetric \(T\) held fixed, differentiation gives
\[
 (D_Q\mathscr L_Q)\bigl([X]\bigr)(T)
 =2(XT+TX)-\tfrac43\operatorname{tr}(XT)Q
                  -\tfrac43\operatorname{tr}(QT)X .
\]
In particular \((D_Q\mathscr L_Q)\bigl([X_c]\bigr)(X_c)\) is exactly the
sum of the three noncommutator quadratic terms in (2) for that
index. The chain rule yields
\[
 \nabla^c(\mathscr L_Q(X_c))
   =\mathscr L_Q(\Delta_A Q)+
       \sum_c (D_Q\mathscr L_Q)\bigl([X_c]\bigr)(X_c).
\]
This places the derivative terms in divergence form with only the
skew commutator outside that divergence. Equivalently, integrating
the Hessian term alone against \(q\) gives a coefficient derivative
which cancels exactly against those three quadratic terms.

Because \(\mu_t=0\), \(\mathcal P'=2\int_M\langle q,Q_t\rangle\mu\).
At each fixed time the spatial factor relating \(\mu\) to \(dV_{\widehat g}\)
is constant \(2K^2\). Metric compatibility on all differentiated
indices and closedness therefore give
\[
 \int_M\langle q,\nabla^c(\mathscr L_Q(X_c))\rangle\mu
 =-\int_M\sum_c\langle X_c,\mathscr L_Q(X_c)\rangle\mu .
\]
Here \(\nabla^A I=0\); the identity does not differentiate either metric
coefficients or the volume in time. Substitution gives the exact
B04 identity at every smooth definite solution,
\[
 \boxed{\quad
 \begin{aligned}
 \mathcal P'={}&-2\int_M\sum_c\langle X_c,\mathscr L_Q(X_c)\rangle\mu
       +2\int_M\sum_c\langle q,[X_c,\Xi_c]\rangle\mu\\
       &-48K\int_M\sqrt{\det Q}\,|q|^2\mu .
 \end{aligned}\quad}
 \tag{3}
\]

## Explicit pinching constants

Let \(m=\lambda_{\min}(Q)\) and \(M_*=\lambda_{\max}(Q)\).
For symmetric trace-free \(T\), writing \(u=\operatorname{tr}(QT)/3\)
gives
\[
 \langle T,\mathscr L_Q(T)\rangle
   =4\operatorname{tr}\bigl(Q(T-uI)^2\bigr)\ge4m|T|^2.
\]
The last inequality uses \(\operatorname{tr}(T)=0\) and
\(|T-uI|^2=|T|^2+3u^2\). The pinching hypothesis implies
\(\|q\|_{\mathrm{op}}\le |q|\le1/8\), hence \(m\ge7/8\)
and \(M_*\le9/8\). The pointwise negative gradient contribution
in (3) is then at most \(-7|\nabla Q|^2\).

In the commutator pairing, cyclicity of the trace gives
\[
 \langle q,[X_c,\Xi_c]\rangle
  =\operatorname{tr}([q,X_c]\Xi_c)
  =-\langle[q,X_c],\Xi_c\rangle .
\]
The final sign uses skew symmetry of \([q,X_c]\).
Since \(|[q,X_c]|\le2\|q\|_{\mathrm{op}}|X_c|\), summing over
the base index gives
\[
 2\Big|\sum_c\langle q,[X_c,\Xi_c]\rangle\Big|
     \le4|q|\,|\nabla Q|\,|\Xi| .
\]
To bound \(\Xi\) with the declared norms, the Sylvester equation
\(S\nabla_cS+(\nabla_cS)S=X_c\) gives
\(|\nabla S|\le|\nabla Q|/(2\sqrt m)\).
The compatibility inverse gives
\[
 |b|\le|d_A\Sigma|\le\sqrt3\,|S^{-1}\nabla S|
        \le\tfrac{\sqrt3}{2m}|\nabla Q|.
\]
The middle bound follows by applying Hodge star to the wedge with
each normalized \(\Sigma_i\) and Cauchy–Schwarz over the three
internal terms. Then
\[
 |\Xi|
 \le4\sqrt{M_*}|\nabla S|+4\sqrt2 M_*|b|
 \le 2\left(\sqrt{M_*/m}+\sqrt6\,M_*/m\right)|\nabla Q| .
\]
Here \(|\operatorname{ad}(b_c)|=\sqrt2|b_c|\) in Frobenius
norm. These are the E02 constants and display the scale
through the reconstructed metric on base covectors.
Under pinching \(M_*/m\le9/7\). Using
\(\sqrt{9/7}<3/2\) and \(\sqrt6<5/2\), the coefficient
in the last bound is below \(66/7<10\). Consequently the
commutator's contribution in (3) is at most \(5|\nabla Q|^2\)
pointwise. Also \(\det Q\ge m^3\ge(7/8)^3=343/512>9/16\),
so \(\sqrt{\det Q}\ge3/4\). Thus the two negative contributions
give \(-7|\nabla Q|^2-36K|q|^2\) before absorption and
at most \(-2|\nabla Q|^2-36K|q|^2\) after absorption, proving (1).
The frozen constants follow purely from these inequalities.

As a round check, take \(Q=I+\varepsilon q_1+O(\varepsilon^2)\)
in a smooth variation at the round connection.
In (3) \(\mathscr L_I=4I\) on the trace-free matrices,
\(\Xi=O(\varepsilon)\), and \(\sqrt{\det Q}=1+O(\varepsilon^2)\).
The quadratic energy derivative is
\(-8\int_M|\nabla_{A_0}q_1|^2\mu_0
-48K\int_M|q_1|^2\mu_0\), as follows also from the
round linearization \((q_1)_t=-4(\nabla_{A_0}^*\nabla_{A_0}+6K)q_1\).
The less negative constants in (1) account for nonlinear absorption.

## Conditional consequences and primary comparison

On any interval of smooth pinched existence,
\[
 e^{36K(t-t_0)}\mathcal P(t)
   +2\int_{t_0}^t e^{36K(s-t_0)}
             \left(\int_M|\nabla^A Q(s)|^2\mu\right)ds
 \le\mathcal P(t_0).
 \tag{4}
\]
In particular the defect energy is at most
\(e^{-36K(t-t_0)}\mathcal P(t_0)\) on that interval.
The hypotheses for (4) require the pointwise condition at each
time of the interval. The estimate provides an integrated
defect and gradient bound. Preservation of the pointwise regime,
existence up to a desired time and geometric compactness require
their own arguments.

The stationarity here is the critical-point equation for the
independent connection. On the open definite set, a variation
\(a\in\Omega^1(M,E)\) has \(\delta F=d_Aa\) and the
volume variation is exact by Bianchi. Thus on a closed base
\(\int_M\mu\) is fixed and one can vary \(\int_M\operatorname{tr}(Q^2)\mu\)
in place of \(\mathcal P\). Differentiating the curvature quotient yields
\[
 \delta\mathcal P(a)
 =\int_M \left\langle d_A a,
       \bigl(4Q-\tfrac23\operatorname{tr}(Q^2)I\bigr)F
       \right\rangle_{\widehat g,\delta}dV_{\widehat g}.
\]
The bracketed product with \(F\) is self-dual, so
the wedge and \(L^2\) expressions agree. Integration by parts gives
the connection gradient. The bracket equals \(2I+4H\)
and the \(2F\) term has zero \(d_A^{*\widehat g}\) by
Bianchi and self-duality. Thus the critical equation is
\(d_A^{*\widehat g}(HF)=0\) for variations of \(A\).
The metric-dependent norm defines the gradient at the current
connection. An Einstein hypothesis or variation through
connections of source metrics is unnecessary. The functional
and flow match Fine's equation after the fixed normalization
conversion. [Fine v2, Proposition 4.2, equation (4.1)](https://arxiv.org/html/1111.5005v2)
and [E01 lead assessment, normalization correction](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md).

A smooth pinched critical connection therefore gives a constant
solution of the unadjusted equation on any time interval.
Equation (1) applied to it forces \(\mathcal P=0\).
Positivity of the smooth four-form \(\mu\) implies \(Q\equiv I\).
Conversely \(Q=I\) makes \(H=0\).
The known perfect-connection reconstruction then gives
the anti-self-dual Einstein metric with the round-compatible
scalar curvature \(12K\) in this normalization.
[Fine v2, Theorem 2.1 and Section 2.2](https://arxiv.org/html/1111.5005v2)
and [E01A compatibility and scale](../reviews/E01A_AUDIT_20261122.md).

Fine v2 Section 1.6 explicitly discusses the unresolved status
there of exclusion of all nonperfect critical connections.
Theorem 4.11 instead assumes a given perfect connection on a
compact four-manifold and sufficiently small \(L_k^2\) distance
to it for integer \(k\ge3\), measured in a fixed background
metric. Under those premises it gives all-time existence and
exponential convergence in that norm modulo the bundle
automorphism group. The present estimate uses intrinsic
pinching on an interval, and the stationary test applies
without a perfect reference. It leaves the global critical-point
question outside this pinching regime open. This comparison
is a passage check in Fine v2. [Fine v2, end of Section 1.6 and Theorem 4.11](https://arxiv.org/html/1111.5005v2).

To apply this endpoint to nonstationary data, one would need
continued smooth existence with preservation or eventual persistence
of the pointwise pinching, along with estimates giving compactness
on the original manifold modulo suitable bundle automorphisms.
For example, assume pinching persists for arbitrarily large time
and a transformed subsequence converges smoothly on the fixed
bundle to a definite limit. The defect energy is invariant under
oriented base diffeomorphisms and bundle gauges and continuous at
that limit, so (4) implies the limit is perfect. If in addition
the subsequence enters the fixed-background \(L_k^2\) neighborhood
of that reference as in Fine's theorem, his stated hypotheses
can be invoked starting at such an entry time. Neither the
needed compactness nor the Sobolev entry condition follows from
(4). Fixed density in the unadjusted identification controls
the determinant of the metric there, while metric geometry,
regularity and possible concentration require separate bounds.
