# SP4-CME-E50 — Conditional transfer from small values to round stability

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. The [request][req] and
[return][ret] record the five consumed inputs. [B35][b35] fixes
the stability equation and [B36][b36] separates this implication
from its stability hypothesis.

## Setting and conditional consequence

Fix the smooth round oriented Riemannian \(S^4\), the perfect chiral
connection \(A_0\) in the round-compatible definite component, its
curvature \(F_0\), and the principal \(\mathrm{SO}(3)\) frame bundle
\(\mathcal P\). Both equations use Fine's native time and negative
Killing internal pairing. Let \(g_0=g_{A_0}\) be the native reference
metric. Use fixed spatial Sobolev and uniform norms from the
reference geometry. Put \(S_A(u)=\iota_uF_A\), \(S_0=S_{A_0}\),
let \(\delta_0=d_{A_0}^{*g_0}\) on adjoint one-forms, and let
\(\Delta_0=\nabla_0^*\nabla_0\) on vector fields. Thus
\(\delta_0,\Delta_0,S_0^*\) are fixed throughout.

Assume exactly \(H_{\rm st}\) of the request. For some fixed integer
\(m\ge6\) and \(\eta,C,\alpha>0\), every smooth definite \(B_0\)
with \(\|B_0-A_0\|_{H^m}<\eta\) starts a global smooth solution
\(B(u)\), smooth through \(u=0\), of
\[
 B_u=v(B)-d_B\delta_0(B-A_0)
              -S_B\Delta_0 S_0^*(B-A_0).
 \tag{1}
\]
Its curvature stays in a fixed definite neighborhood and
\[
 \|B(u)-A_0\|_{H^m}
 \le C e^{-\alpha u}\|B_0-A_0\|_{H^m},\qquad u\ge0.
 \tag{2}
\]
Under this hypothesis, there are \(\epsilon>0\) and a fixed
\(\tau>0\) such that every smooth \(A_{\rm in}\) with
\[
 \|A_{\rm in}-A_0\|_{C^0}
       +\|F_{A_{\rm in}}-F_0\|_{C^0}<\epsilon
 \tag{3}
\]
starts a global smooth definite solution of the actual equation
\(A_t=v(A)\). For \(t\ge\tau\) there are smooth time-dependent
bundle automorphisms \(h(t)\) that give exponential \(H^m\)
convergence in the fixed reference norms.

## Fixed smoothing time and regularity at zero for each smooth datum

Apply E42 with \(\bar A=A_0\), \(\bar F=F_0\), fixed \(p>6\) and
the chosen Bianchi coefficient for this reference. Choose the E42
value tube also inside the parabolic value region of the
fixed-reference adjusted connection equation on the curvature
graph. The pair datum
\((A_{\rm in}-A_0,F_{A_{\rm in}}-F_0)\) is compatible. The
sup norm of this datum is controlled by (3) in the fixed pairing.
For small enough \(\epsilon\), its E42 path
\((\widehat A(t),\widehat F(t))\) exists on a common \([0,T]\),
is continuous to its initial pair, is smooth on \(0<t<T\), and
has \(\widehat F=F_{\widehat A}\) there. The strict definite
value condition also follows from the uniform curvature
comparison to \(F_0\).
[E42, local solution and compatible passage][e42] ·
[Lead assessment][assessment].

The E42 pair at zero datum is stationary. At the reference
\(Q=I\), its physical factor is
\(4I-\frac23\operatorname{tr}(I)I=2I\), so \(v(A_0)=0\) by
self-duality and Bianchi. In the independent system the vertical
and horizontal inputs and the curvature constraint vanish,
and \(d_{A_0}F_0=0\). Its stationary pair is therefore the
unique zero-datum solution in the E42 ball. Fix \(\tau=T/2\).
Positive-time continuity of all derivatives at that stationary
datum gives
\[
 \widehat A(\tau)-A_0\longrightarrow0
 \quad\text{in }H^m
 \quad\text{as the pair datum tends uniformly to zero}.
 \tag{4}
\]
In fact the convergence in spatial \(C^m\) at \(\tau\) implies
this by compactness and the fixed reference norms. Shrink
\(\epsilon\) once so every datum satisfying (3) gives
\(\|\widehat A(\tau)-A_0\|_{H^m}<\eta/2\). This step uses
neither a uniform \(H^m\) bound at zero nor a datum-dependent
smoothing time. [E36, system (1)–(2)][e36] ·
[E42, positive-time derivative continuity][e42].

To start smooth recovery at \(t=0\), use the individual smooth
comparison in E42 directly on the given smooth datum. The
fixed-reference connection principal coefficients depend on
\((x,A,F_A)\), by restricting the first-order \(W\) of E36
to \(F=F_A\). Each datum's initial first-jet image is compact
inside the open parabolic jet region. The smooth E29 construction
with a cutoff around that image gives a smooth adjusted
connection on a short interval with this same reference \(A_0\).
Its lift by \(F=F_A\) solves the E36 independent system.
The lift is continuous up to zero in spatial \(C^1\).
For a short interval of length \(\ell\), its \(X_\ell\) norm is
bounded by its value sup plus
\(c\sqrt\ell\sup_{[0,\ell]}|DU|\). Thus its norm tends to
the initial value sup and the lift belongs to the completed
uniqueness ball for small \(\ell\). The E42 solution restricted
to that interval is in the same ball. Uniqueness identifies the
two, making \(\widehat A\) smooth through \(t=0\) for this
input. Its smoothness at later times already holds on
\((0,T)\). The comparison interval can depend on the full
initial jet and higher norms. [E29, smooth compact construction][e29] ·
[E36, smooth compatible correspondence][e36] · [E42, individual comparison][e42].

## Recovery in the two gauges

Write group products as \(gh=g\circ h\), with the left action
\(g\cdot A=(g^{-1})^*A\). Let \(\chi_A\) denote the \(A\)-horizontal
lift, and identify an adjoint section with its invariant
vertical vector field. The infinitesimal action is
\[
 R(\phi+\chi_A(u),A)=-d_A\phi-S_A(u).
 \tag{5}
\]
On a compatible E42 path the connection solves the corrected
local equation of E29. Its generator in the convention
\(\widehat A_t=v(\widehat A)-R(\xi_{\rm loc}(\widehat A),\widehat A)\)
is, for \(a=A-A_0\),
\[
 \xi_{\rm loc}(A)
 =-d_A^{*g_0}a-\chi_A\big(S_A^*d_A^{*g_A}d_Aa\big).
 \tag{6}
\]
In the stable gauge of (1) the generator is
\[
 \xi_{\rm st}(B)
 =-\delta_0(B-A_0)-\chi_B\big(\Delta_0 S_0^*(B-A_0)\big).
 \tag{7}
\]
Applying (5) to (7) gives
\(R(\xi_{\rm st}(B),B)
=d_B\delta_0(B-A_0)+S_B\Delta_0S_0^*(B-A_0)\), including
the indicated positive sign on the right. Subtracting this
quantity gives precisely (1). In (6) the horizontal inner
operators use the live curvature metric. Equation (7) uses
the prescribed fixed operators and the live outer horizontal
lift. [Fine v2, §3.2 and (3.4)][fine-action] · [E28, generator][e28] ·
[B35, stability equation][b35].

For either supplied smooth adjusted path \(A_{\rm adj}(t)\),
let \(j(t)\) solve the ordinary equation on \(\mathcal P\)
\[
 \dot j=-\xi(A_{\rm adj}(t))\circ j,\qquad
 j(0)=\mathrm{id},\qquad g=j^{-1}.
 \tag{8}
\]
The base and structure group are compact, so \(\mathcal P\)
is compact. The time-dependent invariant vector field is smooth
on every compact time interval of its given path. Its flow
exists on each such interval, maps each fiber to a fiber,
and commutes with the right group action by ODE uniqueness.
The inverse flow for a finite time is obtained by integrating
backward along that interval. Thus \(j\) is a smooth bundle
automorphism for each finite time. These interval solutions
agree on overlaps, giving a recovery on the entire supplied
smooth adjusted trajectory.

Differentiating \(g\circ j=\mathrm{id}\) in (8) gives
\(\ell(g^{-1})_*\dot g=\xi(A_{\rm adj})\), where \(\ell\)
denotes left translation. The right velocity is
\(r(g^{-1})_*\dot g=\operatorname{Ad}_g\xi(A_{\rm adj})\).
The chain rule and physical equivariance then give
\[
 \begin{split}
 \partial_t(g\cdot A_{\rm adj})
 &=g_*\big(v(A_{\rm adj})-R(\xi(A_{\rm adj}),A_{\rm adj})\big)\\
 &\quad+R(\operatorname{Ad}_g\xi(A_{\rm adj}),g\cdot A_{\rm adj})\\
 &=v(g\cdot A_{\rm adj}).
 \end{split}
 \tag{9}
\]
The two generator terms cancel by equivariance of the
infinitesimal action. The fixed-reference generator is evaluated
on the adjusted path throughout. Only the physical gradient
needs equivariance as a vector field on connection space.
[Fine v2, Lemma 4.4 and (4.3)–(4.4)][fine-recovery] ·
[E28, supplied smooth correspondence][e28].

## Splice and convergence modulo bundle automorphisms

Use (8) with \(\xi_{\rm loc}\) and initial identity on the
smooth path \(\widehat A(t)\), including a compact interval
extending a little past \(\tau\) within \([0,T)\). Write the
recovery as \(g_{\rm loc}(t)\) and put
\(c=g_{\rm loc}(\tau)\). Let \(B\) be supplied by \(H_{\rm st}\)
with \(B(0)=B_0=\widehat A(\tau)\), which meets its strict
hypotheses by (4) and definiteness. Solve (8) along \(B(u)\)
with \(\xi_{\rm st}\), using initial identity at \(u=0\), and
write that recovery as \(g_{\rm st}(u)\).

Define, in native time,
\[
 A(t)=
 \begin{cases}
  g_{\rm loc}(t)\cdot\widehat A(t),&0\le t\le\tau,\\
  (c\,g_{\rm st}(t-\tau))\cdot B(t-\tau),&t\ge\tau .
 \end{cases}
 \tag{10}
\]
At \(t=\tau\) both expressions equal \(c\cdot B_0\).
The tail applies the single time-independent automorphism
\(c\) on the left of the stable recovery. This preserves the
actual equation by naturality, and (9) proves that both
branches solve it. All these automorphisms cover
orientation-preserving diffeomorphisms because the flows
start at identity. The definite component is preserved under
their action.

The local recovery was taken past \(\tau\), so the two
branches are smooth time paths on a common right neighborhood
of \(\tau\), with the same datum there. The smooth unadjusted
uniqueness from E28 and E29 applies at the smooth definite
splice connection. It uses the corrected local reference
equal to that datum, so both reverse equations have the
strict initial principal symbol, their adjusted paths agree
by smooth uniqueness, and ordinary recovery then agrees.
Hence the two actual paths agree on that neighborhood.
Equation (10) is smooth through the splice even though the
two adjusted gauges differ. The same smooth uniqueness
after recentering at matching times gives uniqueness on common
smooth intervals. This argument requires no uniqueness premise
for (1) in \(H_{\rm st}\).
[E28, reverse symbol and uniqueness][e28] ·
[E29, time-dependent smooth local input][e29] ·
[Lead smooth local assessment][smoothassessment].

For \(t\ge\tau\), put
\[
 h(t)=g_{\rm st}(t-\tau)^{-1}c^{-1}.
 \tag{11}
\]
This exact product order gives \(h(t)\cdot A(t)=B(t-\tau)\).
The desired estimate in the fixed reference norm is
\[
 \|h(t)\cdot A(t)-A_0\|_{H^m}
 \le C e^{-\alpha(t-\tau)}
       \|\widehat A(\tau)-A_0\|_{H^m}.
 \tag{12}
\]
The automorphisms are smooth at every finite tail time.
Equation (12) uses their action at the same time, independent
of their behavior as \(t\to\infty\).

## Dependencies and limits

The common \(T,\tau\) and value threshold from E42 depend
on the fixed reference, auxiliary fixed norms, \(p\), coefficient
bounds and the Bianchi diffusion parameter. The final \(\epsilon\)
also depends on \(m,\eta\) through (4). The constants \(C,\alpha\)
in (12) are the assumed stability constants. The individual
smooth comparison interval, generator norms on the initial
slab, and smooth recovery bounds can depend on the particular
smooth datum and its higher derivatives.

This proves the transfer conditional on \(H_{\rm st}\). E49
owns the separate stability question for (1). Initial recovery
here starts from smooth input through the individual comparison.
The proof supplies no recovery estimate uniform at zero over
only \(C^0\)-controlled data, no unadjusted flow from genuinely
continuous initial data, and no conclusion about limiting
automorphisms or arbitrary homotopy spheres.

The primary identities used are Fine, arXiv:1111.5005v2,
29 November 2011, §3.2 Lemma 3.2 and (3.4), and §4.2
Lemma 4.4 and (4.3)–(4.4), reopened 22 November 2026.
The inherited E29 smooth local input uses the undated,
repaginated author-hosted version of Taylor's 1991
`Pseudodifferential Operators and Nonlinear PDE`, printed
pp. 147 and 149, (7.3.1)–(7.3.2) and Propositions 7.3.A–B,
together with its own compact-bundle argument. These are
selected-passage uses of the existing canonical sources,
with no new retained reading copies.
[Fine v2][fine-recovery] · [Taylor host file][tay] · [Canonical record][sources].

[req]: ../research-progress/handoffs/SP4-CME-E50_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E50_RETURN_v1.md
[b35]: ../brainstorm/notes/B35_FIXED_STABILITY_GAUGE_20261122.md
[b36]: ../brainstorm/notes/B36_SMOOTHING_TO_STABILITY_20261122.md
[e28]: 28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[assessment]: ../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[smoothassessment]: ../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md
[fine-action]: https://arxiv.org/html/1111.5005v2#S3.SS2
[fine-recovery]: https://arxiv.org/html/1111.5005v2#S4.SS2
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf#page=147
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#local-parabolic-primary-input
