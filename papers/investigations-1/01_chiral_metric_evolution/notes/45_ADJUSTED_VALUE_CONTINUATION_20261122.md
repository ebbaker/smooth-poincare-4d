# E45 — Fixed-value continuation of the adjusted trajectory

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and the actual lead settings are unavailable.
The [request][req] freezes the inputs. [B34][b34] and the
[E41–E44 lead assessment][lead] specify the local theorem and scope.

## Proposition

Let \(M\) be a smooth closed oriented real four-manifold. Fix the
smooth definite connection \(\bar A\) and curvature \(\bar F\)
in the positive component of [E36][e36]. Retain the reference
direct-sum pairing induced by \(\bar g=g(\bar F)\) and the
negative Killing form, the fixed smooth density and derivative \(D\),
and a single admissible \(\lambda\) as in E36. Use the same autonomous
adjusted equation throughout. Write \(U=(A-\bar A,F-\bar F)\).
There is \(\epsilon>0\), depending on this fixed setup, such that
every smooth compatible E36 solution on \(0\leq t<t_*<\infty\)
with \(t_*>0\) and
\[
 F(t)=F_{A(t)},\qquad
 \sup_{0\leq t<t_*}\|U(t)\|_\infty\leq\epsilon                       \tag{1}
\]
extends as a smooth compatible solution beyond \(t_*\).
The value norm in (1) is in the fixed pairing. No higher-derivative
bound as \(t\uparrow t_*\) is required.

## Proof

Fix \(p>6\). The assessed [E42][e42] construction gives common
constants \(\epsilon_0,R,T>0\) for data within \(\epsilon_0\) of
the fixed reference. The solution belongs to the radius-\(R\) ball
of the \(X_T\) completion of sections smooth on the closed slab, has
a strong uniform initial trace, is smooth for \(0<s<T\), and retains
compatibility. The linear source and solution completions have the
closed-slab bridge verified in [E44][e44]. The local uniqueness
statement applies on each shorter slab with the same radius \(R\)
and the corresponding anchored \(X\) norm. Choose
\(0<\epsilon\leq \min\{\epsilon_0,R/2\}\).
Both the datum size \(\epsilon\) and the solution radius \(R\)
lie in the definite value tube where the cutoff agrees with E36 and
the Hermitian rank-one margin holds in the fixed pairing.
[E41][e41] · [E42, (2)–(8)][e42] · [Lead assessment][lead].

Set
\[
 d=\tfrac12\min\{t_*,T\},\qquad t_0=t_*-d,\qquad s=t-t_0 .
\]
Then \(0<t_0<t_*\), \(0<d\leq T/2\), and the common
existence interval in translated time contains \(s=d\) in its
interior. Apply E42 to the smooth compatible datum \(U(t_0)\)
with the same reference, obtaining \(V(s)\) on \(0\leq s\leq T\).
The original trajectory \(U_{\mathrm{in}}(s)=U(t_0+s)\) solves
exactly the same equation on \(0\leq s<d\). It is itself an
individual smooth solution on each shorter closed interval there.

Let \(K=\sup_{0\leq s\leq d/2}\|D U_{\mathrm{in}}(s)\|_\infty\),
which is finite by smoothness on this compact slab. With a fixed
\(c>0\) from the volume comparisons in the \(X\) norm,
\[
 \|U_{\mathrm{in}}\|_{X_\ell}
 \leq \epsilon+c\sqrt\ell\,K\qquad (0<\ell\leq d/2).
                                                                    \tag{2}
\]
In the upper-slab \(L^p\) term this follows from the upper volume
bound \(C r^6\) and the factor \(r\). In the tent \(L^2\) term
\((r^{-4}|Q_r|)^{1/2}\leq C r\) gives the same bound.
Choose \(\ell=\min\{d/2,[(R-\epsilon)/(2c(1+K))]^2\}\).
Equation (2) puts this smooth incoming solution in the
radius-\(R\) completed ball for \(X_\ell\). The restriction of \(V\)
also belongs to that ball because the anchored norm and the
closed-slab smooth completion restrict. Both have datum \(U(t_0)\).
The E42 distributional uniqueness in this ball gives
\(U_{\mathrm{in}}=V\) for \(0\leq s\leq\ell\).
Only the short comparison time \(\ell\) uses \(K\).

For \(s_1=\ell/2\) and any \(s_1<b<d\), both solutions are smooth
on \([s_1,b]\) and take values in the same radius-\(R\) value ball.
All segments between their values remain in the region where the
coefficients are smooth. By E42 (1) the equation is
\[
 U_s=\operatorname{div}_D(P(x,U)DU)+h_0(x,U)
       +h_1(x,U)DU+h_2(x,U)[DU,DU].
\]
For \(w=U_{\mathrm{in}}-V\), subtraction gives
\[
 w_s=\operatorname{div}_D\!\bigl(P(x,U_{\mathrm{in}})Dw+B w\bigr)
             +J(Dw)+H w,\qquad
 B w=(P(x,U_{\mathrm{in}})-P(x,V))DV .                              \tag{3}
\]
Here \(B\) is taken linear in its argument by integrating
\(D_U P\) on the pointwise segment. The same mean-value formula
for each \(h_j\) and bilinear subtraction in the two gradient
slots produce the bounded linear maps \(J,H\). For instance,
the change in the two slots of \(h_2(x,U_{\mathrm{in}})\) yields
\(h_2(x,U_{\mathrm{in}})[Dw,DU_{\mathrm{in}}]+
h_2(x,U_{\mathrm{in}})[DV,Dw]\), and the coefficient difference
acts on the two \(DV\) slots to give a bounded multiple of \(w\).
The bounds are on this compact strip and may depend on \(b\).

The fixed-pairing rank-one lower bound for \(P(x,U_{\mathrm{in}})\)
is uniform on the strip. A squared spatial partition of unity and
local coefficient freezing, uniformly in \(s\in[s_1,b]\), give
\[
 \operatorname{Re}\int_M\langle P(x,U_{\mathrm{in}})Dw,Dw\rangle\,d\nu
       \geq \gamma_b\|Dw\|_2^2-C_b\|w\|_2^2
 \qquad (\gamma_b>0).                                             \tag{4}
\]
Indeed, freeze the coefficient, density and pairing in each chart
at each time. The Fourier estimate for the frozen coefficient is
the rank-one bound. By uniform continuity on the compact strip,
charts can be taken so the spatial freezing error absorbs at most a
fixed fraction of that bound. Cutoff and connection terms are
bounded by a small fraction of the gradient norm squared plus a
fixed multiple of \(\|w\|_2^2\). This is the same local Gårding
argument as E41 (2) and E29's smooth uniqueness proof.
[E41][e41] · [E29][e29].

Use (4) in the energy of (3), integrating the divergence
term against \(w\) in the fixed density. The terms from \(B,J\)
are bounded by \(C_b\|w\|_2\|Dw\|_2\) and the \(H\) term by
\(C_b\|w\|_2^2\). Young's inequality absorbs the gradient terms
to give \(\partial_s\|w\|_2^2\leq C'_b\|w\|_2^2\).
Since \(w(s_1)=0\), the integrating factor gives \(w=0\) through
\(b\). Allowing \(b\) to range below \(d\) proves agreement on
the entire overlap. This smooth comparison only uses value
smallness and finite stripwise coefficient bounds there.

The path \(V(t-t_0)\) therefore extends the incoming trajectory
and is smooth through \(t=t_*\), since \(s=d>0\) is interior to its
smooth time interval. In particular the extension is defined
smoothly through \(t_*+T/4\), because \(d+T/4\leq3T/4<T\).
It is compatible by the assessed E42 result and remains in the
definite region. Taking \(U\) on the original interval and \(V\)
after \(t_*\) gives a smooth solution by their equality on the
open overlap.

## Scope

A maximal smooth adjusted trajectory satisfying (1) throughout
its existence interval has infinite lifespan. Equivalently a
finite maximal endpoint requires some slice with value norm
greater than \(\epsilon\). This is a continuation criterion
assuming a uniform bound along the trajectory. E42 controls
the new path in the larger radius-\(R\) ball and does not
establish preservation of the initial radius \(\epsilon\).
E24 supplies continuous limits of the **unadjusted** connection
and curvature in a fixed base and bundle identification. Those
limits give neither an incoming solution of this adjusted
equation nor the uniform smallness of any transformed path in
the fixed reference tube. Gauge recovery across that endpoint
and the unadjusted restart therefore remain open here.
[E24, continuous limits][e24] · [B34][b34].

[req]: ../research-progress/handoffs/SP4-CME-E45_REQUEST_v1.md
[b34]: ../brainstorm/notes/B34_ADJUSTED_CONTINUATION_20261122.md
[lead]: ../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[e44]: ../reviews/E44_ROUGH_SYSTEM_AUDIT_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e41]: 41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[e24]: 24_TEMPORAL_BOOTSTRAP_20261122.md#continuous-limits-and-curvature-compatibility
