# SP4-CME-E140 — Conditional original-flow restart from finite temporal strain

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol`
/ `ultra`. Independent runtime and selected lead identifiers were
unavailable. The helper authored E27, E36 and E42, with E02C and E84
upstream, and audited the smooth-compatible identification in E64.
This is a bounded combination of inherited arguments under [B72][b72].
The [request][request] and [return][return] give the frozen versions.

## Conditional statement

Let \(P\) be a fixed smooth principal \(SO(3)\) bundle over a smooth
compact closed oriented real four-manifold \(M\). Let \(A(\tau)\),
\(0\leq\tau<t_*<\infty\), \(t_*>0\), be a supplied smooth solution of
the native original Fine flow, with curvature planes positive definite
in the chosen orientation and the round-compatible curvature-map
sign. Use the positive internal metric from the negative Killing form
and the native reconstructed metric \(g=g(F_A)\), with the ordinary
form norms. Write \(Q\) for the trace-three normalized wedge Gram
endomorphism, \(S=Q^{1/2}\), and
\[
 T_X=\tfrac12(S^{-1}\nabla^A_XQ\,S^{-1})_0,\qquad
 \mathcal G=|\nabla^A T|_g+|T|_g^2,\qquad
 J=\int_0^{t_*}\sup_M\mathcal G\,d\tau .
\]
The connection \(\nabla^A\) includes the live Levi–Civita connection
on base slots.

Assume the **uniform-radius premise** of the frozen [E138 request][e138].
On each prescribed compact positive algebraic reference-value range
there are common pair-value and completion-ball radii \(\epsilon,R>0\),
independent of higher reference derivatives. Each smooth compatible
reference in the range has a positive time \(T_{\rm ref}\), which may
depend on its derivatives, on which the actual E36/E42 construction
applies to every compatible continuous datum within \(\epsilon\).
Pair norms refer to uniformly equivalent fixed \(C^0\) norms. The
construction has the E42 closed-slab completion, uniqueness in the
ball on shortened slabs in its construction interval, strong trace,
compatibility, and positive-time smoothness. These are the properties
of the E42 construction whose radius is being assumed uniform.
[E36][e36] · [E42][e42] · [E41–E44 assessment][roughcheck].

Under this premise, \(J<\infty\) implies smooth positive definite
extension of the original solution past \(t_*\) on the same bundle
and in the original fixed base and bundle identification. In
particular, under the same premise, a finite maximal smooth definite
lifespan in this component must have \(J=\infty\).

## Native endpoint from the temporal estimates

To use E24, put \(c=2K\) with its fixed normalization parameter \(K>0\),
and let \(\delta\) be its bracket-orthonormal internal metric. In those
frames \(-\operatorname{tr}(\operatorname{ad}e_i\operatorname{ad}e_j)
=2\delta_{ij}\). Native orthonormal frames are divided by \(\sqrt2\),
so curvature components acquire \(\sqrt2\) and the wedge volume
doubles from \(2K^2dV_{\widehat g}\) to \(4K^2dV_{\widehat g}\).
Division by the wedge volume keeps \(Q\) unchanged, and the same
self-dual plane then gives \(g=c\widehat g\). This calculation is
pointwise on the definite region for any fixed \(K>0\).

For \(q=Q-I\), set \(H_q=q-\tfrac16|q|^2 I\). The native gradient
coefficient is
\[
 B=4Q-\tfrac23\operatorname{tr}(Q^2)I=2I+4H_q.
\]
On compatible data the curvature is self-dual and Bianchi gives
\(d_A^{*g}F_A=0\). Thus \(V(A)=-d_A^{*g}(BF_A)=-4d_A^{*g}(H_qF_A)\).
For the constant scaling \(g=c\widehat g\), the codifferential on
two-forms is \(d_A^{*g}=c^{-1}d_A^{*\widehat g}\). Comparing the actual
equations gives \(\tau=ct\) for the E24 time \(t\). The Levi–Civita
connection is unchanged, and the endomorphism norms are unchanged by
the constant internal scale. Since \(T\) has one base slot and
\(\nabla^AT\) has two, their native norms are \(c^{-1/2}|T|_{\widehat g}\)
and \(c^{-1}|\nabla^AT|_{\widehat g}\). The native budget \(J\) is
therefore E24's budget on \([0,t_*/c)\).
[E24, (1) and (6)–(10)][e24] · [Fine v2, Definition 1.4 and
Proposition 4.2][fine] · [Canonical normalization record][sources].

Let \(g_b=g(F_{A(0)})\) and \(a_*=4512\sqrt2\,J\). The relative
comparisons carry across unchanged:
\[
 e^{-a_*}g_b\leq g(\tau)\leq e^{a_*}g_b,\qquad
 e^{-a_*}Q(0,x)\leq Q(\tau,x)\leq e^{a_*}Q(0,x).
 \tag{1}
\]
For E-valued \(k\)-forms the change to a live native norm has
factor \(\sqrt2\,c^{-k/2}\), in addition to \(c^{-1}\) for a time
derivative. Applying these factors to E24 (7) gives
\[
 |A_\tau|_{g}\leq36\sqrt6\,|T|_g,\qquad
 |F_\tau|_{g}\leq2256\sqrt6\,\mathcal G .
\]
The fixed \(g_b\) norm costs \(e^{ka_*/2}\) on \(k\)-forms by (1).
Using Cauchy–Schwarz in time for the first line gives
\[
 \int_0^{t_*}\|A_\tau\|_{\infty,g_b}\,d\tau
 \leq 36\sqrt6\,e^{a_*/2}\sqrt{t_*J},\qquad
 \int_0^{t_*}\|F_\tau\|_{\infty,g_b}\,d\tau
 \leq 2256\sqrt6\,e^{a_*}J .
 \tag{2}
\]
The fixed internal metric in (2) is native. The relative comparisons
and velocity bounds in E24 use the unadjusted equation and do not
require the separate small-budget assumptions for its decay estimate.

Writing \(A=A(0)+\alpha\), the integrable tails in (2) give uniform
limits \(\alpha_*,F_*\). They are continuous in the same fixed
identification. The curvature formula passes to the limit
distributionally,
\[
 F_*=F_{A(0)}+d_{A(0)}\alpha_*+\tfrac12[\alpha_*\wedge\alpha_*].
 \tag{3}
\]
Indeed the derivative is linear with smooth fixed coefficients
and the values in the bracket converge uniformly. Write
\(A_*=A(0)+\alpha_*\). The positive wedge volume in native units is
fixed pointwise in time by E24, so remains positive at \(F_*\).
The inequality \(Q_*(x)\geq e^{-a_*}Q(0,x)>0\) follows from (1) and
the continuous wedge Gram formula. Since \(M\) is compact, this is
a uniform positive lower bound; the chosen sign persists by local
constancy in the definite region. The reconstructed endpoint
metric is continuous and positive. This yields the hypotheses of
E38 with \(A(0)\) and \(g_b\) as smooth background data.
[E24, continuous limits][e24] · [E38][e38].

## A fixed smooth reference and one late smooth datum

Use \(A(0)\) as the affine origin for connection values and denote
the fixed direct-sum \(C^0\) pair norm from \(g_b\) and the native
internal pairing by \(\|\cdot\|_b\). Take closed pointwise balls of
a fixed radius \(r>0\) about the continuous endpoint pair values.
For a sufficiently small \(r\), their total set \(\mathcal K\) is a
compact tube contained in the chosen open definite region. The
fiberwise radii are uniform since the endpoint graph is compact.
The reconstructed metrics on \(\mathcal K\) are uniformly
equivalent to \(g_b\); there is a fixed norm comparison factor
\(L_0\geq1\) for the pair norms made from any smooth reference in
\(\mathcal K\). The E36 algebraic symbol bound also permits a fixed
\(\lambda>0\) and reference-pairing margin on this tube. Its choice
uses the lower closed-symbol bound and upper curvature-symbol
bound on the compact value range. [E36, value neighborhood][e36].

The smooth compatible comparison also needs the **connection-graph**
symbol to stay parabolic. This gives a possibly smaller uniform
value neighborhood without adding an analytic premise to E138.
On \(F=F_A\) the zero constraint term drops out of the A row.
The vertical term uses a fixed adjoint. The remaining \(W\) is
affine in first derivatives of the independent pair with value
coefficients. Inserting \(F_A=\bar F+d_{\bar A}a+
\frac12[a\wedge a]\), \(a=A-\bar A\), brings in \(D^2a\) through
the fixed exterior symbol applied to \(Da\) in \(F_A\). Its
coefficient can therefore depend on reference and current values
and on fixed coordinate tensors, with no dependence on the
symmetric part of \(Da\) or on derivatives of the reference
curvature. Derivatives of the fixed vertical metric, and derivatives
of reference coefficients in this substitution, are lower order.
At reference equality the E29 negative symbol in its native
pairing, on a unit covector and \(b=\xi\otimes x+c\), has real
quadratic form bounded below by
\[
 |H_\xi c|^2+(1-\sqrt3/2)(|S_{\bar F}^*c|^2+|x|^2).
\]
The reference exact sequence of E27 makes this definite. The unit
covector and unit amplitude bundles over the compact reference
value set give a positive common minimum. Smooth value dependence
then gives a positive uniform comparison radius
\(\rho_{\rm gr}\) in the reference pair norm. This concerns a symbol
bound, with individual smooth lifespans determined by E29.
[E29, reference symbol][e29] · [E36, order inventory][e36] ·
[E42, smooth comparison][e42].

Use the common radii \(\epsilon,R\) on \(\mathcal K\) from the
uniform-radius premise. Absorb the fixed norm comparison into
\(L_0\) if the premise uses another equivalent pair norm. Fix
\[
 0<\delta<\tfrac14\min\{r,\epsilon/L_0,\rho_{\rm gr}/L_0,R/L_0\}.
 \tag{4}
\]
Apply E38 to (3) and choose **one** smooth compatible pair
\((\bar A,\bar F=F_{\bar A})\) within \(\delta\) of \((A_*,F_*)\)
in \(\|\cdot\|_b\). It is definite of the chosen sign with graph in
\(\mathcal K\). Fix its positive \(T_{\rm ref}\) from the premise,
shortening it if needed within the construction interval. By (2)
there is \(t_0<t_*\) so that all \(t\geq t_0\) in the original interval
have pair distance to the endpoint less than \(\delta\). Such a
pair is within \(2\delta\) of the fixed reference in \(\|\cdot\|_b\),
hence within \(\epsilon,\rho_{\rm gr}\) and \(R/2\) in the reference
sup norms used above. Only now choose \(t_{\rm in}\) satisfying
\[
 \max\{t_0,t_*-T_{\rm ref}/2,0\}<t_{\rm in}<t_* .
 \tag{5}
\]
Set \(s=\tau-t_{\rm in}\). Apply the actual E36/E42 construction
with trace \((A(t_{\rm in}),F_A(t_{\rm in}))\) relative to \(\bar A\).
Write \((\mathcal A(s),\mathcal F(s))\) for this path. The pair is
compatible and smooth at positive times for \(0<s<T_{\rm ref}\).
[E38][e38] · [E42][e42] · [E41–E44 assessment][roughcheck].

## Smoothness up to the new initial slice

The initial datum used in (5) is smooth. Its first-jet graph lies
in the open parabolic jet region by (4), even if its symmetric
first jet is large. This graph is compact because the datum and
base are smooth and compact. Use the E29 smooth jet cutoff equal
to one near this compact graph, supported in the parabolic region,
with convex interpolation to the fixed Laplacian in the reference
pairing. E29 yields a smooth solution up to \(s=0\) of the adjusted
connection equation on an individual short slab. Its curvature
lift solves E36 by the compatible converse. The cutoff argument
uses the negative Hermitian part of the symbol and ordinary smooth
data in the compact-bundle construction, with a time allowed to
depend on all relevant smooth bounds.
[E29][e29] · [E42, smooth comparison][e42] ·
[Taylor, §§7.1 and 7.3][taylor].

The lifted difference pair \(U_{\rm sm}\) is in the smooth
closed-slab completion of E42. For \(\ell>0\) within its individual
interval, the \(X_\ell\) norm satisfies the E42 short-cylinder bound
\[
 \|U_{\rm sm}\|_{X_\ell}
 \leq \sup_{0\leq s\leq \ell}|U_{\rm sm}(s)|
       +C_{\rm ref}\sqrt\ell\,\sup_{0\leq s\leq \ell}|DU_{\rm sm}(s)|.
 \tag{6}
\]
Continuity at zero and \(\|U_{\rm sm}(0)\|_\infty<R/2\) allow
an individual \(\ell>0\) for which (6) is less than \(R\).
The smooth lift is a mild solution by the assessed E42
distributional-to-mild identification. The original fixed point
restricts to the same radius-\(R\) completion on this slab, and E42
uniqueness there identifies both paths. This proves smoothness of
the chosen \((\mathcal A,\mathcal F)\) through \(s=0\), in addition
to its positive-time smoothness. The length \(\ell\) need only be
positive. The comparison used two adjusted paths started at the
one chosen smooth trace.
[E42, mild identity and compatible passage][e42] ·
[E41–E44 assessment][roughcheck].

## Original recovery in the nonstationary-reference gauge

Evaluate the E36 quantities along the compatible \(\mathcal A(s)\).
Suppress the variable \(s\), put \(a=\mathcal A-\bar A\),
\(F=F_{\mathcal A}\), and use \(g=g(F)\), \(\bar g=g(\bar F)\).
The correction and Bianchi terms vanish on the compatible path.
The remaining gauge quantities are
\[
 \begin{split}
 \beta&=F-\bar F+\tfrac12[a\wedge a]=d_{\mathcal A}a,\\
 \phi&=d_{\mathcal A}^{*\bar g}a=d_{\bar A}^{*\bar g}a,\\
 z&=S_F^*d_{\mathcal A}^{*g}\beta,\qquad S_Fu=\iota_u F .
 \end{split}
 \tag{7}
\]
The second equality for \(\phi\) follows from
\(-\bar g^{ij}[a_i,a_j]=0\). Only the vertical adjoint has the
fixed metric. Using (2) of E36 with \(d_{\mathcal A}F=0\), the
connection equation is
\[
 \partial_s\mathcal A=V(\mathcal A)-d_{\mathcal A}\phi-S_F z,
 \qquad V(\mathcal A)=-d_{\mathcal A}^{*g}(B(F)F).
 \tag{8}
\]
Let \(\chi_{\mathcal A}(z)\) be the \(\mathcal A\)-horizontal lift
and identify \(\phi\) with its invariant vertical vector field.
With composition \(gh=g\circ h\) and left action
\(h\cdot A=(h^{-1})^*A\), Cartan's formula for a connection gives
\[
 R(\eta+\chi_{\mathcal A}(u),\mathcal A)
  =-\mathcal L_{\eta+\chi_{\mathcal A}(u)}\mathcal A
  =-d_{\mathcal A}\eta-S_Fu .
\]
Thus the exact generator and adjusted equation are
\[
 \xi(\mathcal A)=-\phi-\chi_{\mathcal A}(z),\qquad
 \partial_s\mathcal A=V(\mathcal A)-R(\xi(\mathcal A),\mathcal A)
                    =V(\mathcal A)+\mathcal L_{\xi(\mathcal A)}\mathcal A .
 \tag{9}
\]
The reference is fixed in time and may be a nonstationary connection
for \(V\). At \(\mathcal A=\bar A\) the gauge terms vanish, and the
full physical term \(V(\bar A)\) remains. The reconstruction,
generator and recovery all use native time.
[E36][e36] · [E28, fixed generator][e28] · [Fine v2, (3.4)
and (4.2)–(4.4)][fine].

For any \(0<\theta<T_{\rm ref}\) solve on the total frame bundle
\[
 \dot j(s)=-\xi(\mathcal A(s))\circ j(s),\qquad j(0)=\mathrm{id}.
 \tag{10}
\]
The invariant vector field in (10) is smooth on a closed slab,
including at zero by the individual comparison. The total bundle
is compact, so the time-dependent vector flow and its inverse
are smooth over this whole slab. Right-equivariance follows by
ODE uniqueness, and the induced base isotopy preserves orientation.
Define \(A_{\rm rec}(s)=j(s)^*\mathcal A(s)\). In the inverse
pullback left action this is \(g_{\rm rec}(s)\cdot\mathcal A(s)\)
with \(g_{\rm rec}=j^{-1}\). Differentiating \(g_{\rm rec}\circ j
=\mathrm{id}\) gives \(\dot g_{\rm rec}=Dg_{\rm rec}\,\xi\);
equivalently \(g_{\rm rec}\) has left-translated velocity \(\xi\).
In the pullback variables,
\[
 \partial_s A_{\rm rec}
 =j^*\big(\partial_s\mathcal A+\mathcal L_{-\xi}\mathcal A\big)
 =j^*V(\mathcal A)=V(A_{\rm rec}).
 \tag{11}
\]
The last step is physical-flow naturality under smooth
orientation-preserving bundle automorphisms, from the natural
curvature, reconstructed metric, internal pairing and adjoints.
In particular \(A_{\rm rec}(0)=A(t_{\rm in})\) and recovery stays
in the positive definite component. Equations (10)–(11) need
smoothness on this one slab, with no uniform recovery derivative
bound over choices of incoming slice.
[E28, exact correspondence][e28] · [E28–E29 assessment][flowcheck].

## Matching on the full overlap

Choose \(\theta=3T_{\rm ref}/4\) in (10); by (5),
\(0<t_*-t_{\rm in}<T_{\rm ref}/2<\theta\).
The recovered solution therefore exists smoothly past \(t_*\).
On the initial common time interval it has the same datum as the
incoming original solution, so smooth original-flow uniqueness
from the E28/E29 assessment gives equality there. At each common
matching slice before \(t_*\) the uniqueness proof can be
recentered at the common actual smooth definite connection. The
reverse parabolic comparison then starts the automorphisms at
the identity and needs only a positive individual time. If the
two solutions ceased to agree before \(t_*\), the supremum of the
times of agreement starting at \(t_{\rm in}\) would be a common
smooth slice by continuity. Recentering there would extend the
agreement further. Hence equality holds on all
\([t_{\rm in},t_*)\). This invokes smooth original-flow uniqueness
after gauge recovery, with no condition on the incoming trajectory
in the fixed-reference adjusted ball.
[E28–E29 local-flow assessment][flowcheck].

Use the incoming solution up to \(t_{\rm in}\) and
\(A_{\rm rec}(\tau-t_{\rm in})\) from \(t_{\rm in}\) onward.
Equality on the overlap makes the splice smooth, and the
recovered path is smooth across \(t_*\) on the fixed bundle.
Its endpoint values agree with \(A_*,F_*\) by (2) and continuity.
This proves the stated conditional theorem and contrapositive.
The proof applies to any finite \(J\); the compact positive tube
is obtained from this solution's initial definiteness and
temporal comparison, with no near-round hypothesis. No additional
premise has been used beyond the stated E138 refinement and
the inherited estimates and smooth correspondence.

The proof never starts gauge recovery from genuinely continuous
endpoint data. The E138 radius refinement remains an explicit
conditional premise here. No new general-data strain estimate,
initialization theorem, or Poincaré conclusion follows. E50 is
an inherited comparison for the finite smooth matching step;
its stability and round input are outside this proof. The Fine,
Taylor and Koch–Lamm records retain their inherited versions and
selected-passage scope, with no fresh theorem or source inspection.
[E50][e50] · [Canonical source record][sources].

[request]: ../research-progress/handoffs/SP4-CME-E140_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E140_RETURN_v1.md
[b72]: ../brainstorm/notes/B72_UNIFORM_RADIUS_ENDPOINT_RESTART_20261122.md
[e138]: ../research-progress/handoffs/SP4-CME-E138_REQUEST_v1.md
[e24]: 24_TEMPORAL_BOOTSTRAP_20261122.md
[e28]: 28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e38]: 38_CONTINUOUS_COMPATIBLE_DATA_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[roughcheck]: ../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[flowcheck]: ../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2
[taylor]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
