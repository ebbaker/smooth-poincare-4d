# FTI-E04 return r1 · Classical chiral spacetime test

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance on checkout `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`.
The request specifies GPT-6.2 Sol at ultra effort. Actual serving variant
and effort were unavailable to this worker. The inputs are [request r1](REQUEST_FTI_E04.md),
[B03](../../brainstorm/notes/B03_OFF_SHELL_CHOICE.md), [E02](RETURN_FTI_E02.md),
[E05](RETURN_FTI_E05.md), and the [pinned physical E33 metric][e33].

## Off-shell identities

Use the closed, connected, oriented smooth standard \(S^4\) with its
round or physical E33 Riemannian metric. The fields are smooth, and the
charge-one \(U(1)\) line is trivial. Use field parity for the graded
Leibniz rule, with \(Q\) commuting with exterior differentiation on
the coefficient fields. The metric, \(p\), and \(\ell\) are external to
\(Q\). Applying the B03 laws twice gives
\[
 Q^2A=-d\phi,\qquad Q^2\psi=Q^2\phi=Q^2\chi=Q^2H=0.
\]
This is the infinitesimal gauge action with parameter \(\phi\), in the
convention \(A\mapsto A-d\alpha\). The other fields are gauge neutral.
\(Q\) preserves gauge-invariant polynomials and squares to zero there.
Since \(QF=d\psi\) and \(Q(d\psi)=-d^2\phi=0\),
\[
 S_g=\int_X H\wedge (K_gP_gF-H/2)-\chi\wedge K_gP_gd\psi .
\]
The first term varies under \(Q\) by \(+\int_X H\wedge K_gP_gd\psi\)
and the second by its negative. Thus \(QS_g=0\), equivalently
\(Q^2V_g=0\) since \(V_g\) is gauge invariant. Also
\(QI_p=2\phi(p)Q\phi(p)=0\). Closure uses no field equation.

## First metric variation

Let \(g_t\) be any smooth metric path through either base \(g_0\), with
fixed orientation. Write \(P=P_{g_0}\), \(\Lambda^+=\Lambda^+_{g_0}\),
\(K=K_{g_0}\), \(W=W_{g_0}^+\), and use dots for derivatives at \(t=0\).
In the B03 transport, set \(\chi_t=U_t\chi\), \(H_t=U_tH\) with
\(U_t=P_{g_t}|_{\Lambda^+}\), leaving \(A,\psi,\phi\) fixed. \(U_t\) is
an isomorphism onto \(\Lambda^+_{g_t}\) for sufficiently small
\(|t|\) by continuity and compactness. In these coordinates \(Q\)
commutes with \(\partial_t\), in particular \(Q\chi_t=U_tH=H_t\).
Define the operators with fixed target \(\Lambda^+\) by
\[
 J_t=U_t^{-1}P_{g_t},\qquad
 \widetilde W_t=U_t^{-1}W_{g_t}^+U_t,\qquad
 \widetilde K_t=U_t^{-1}K_{g_t}U_t=1+\ell^4\widetilde W_t^{\,2}.
\]
Differentiation of \(P_{g_t}^2=P_{g_t}\) gives \(P\dot P P=0\) and
\(\dot P(\Lambda^+)\subseteq\Lambda^-_{g_0}\).
From \(U_tJ_t=P_{g_t}\) one obtains
\(\dot J=P\dot P\). If \(h=\dot g\), the projection variation on an
ambient two-form \(\beta\) is
\[
 \dot P\,\beta
 =\tfrac12 *_0\bigl(\tfrac12\operatorname{tr}_{g_0}(h)\,\beta
                      -h^\sharp\cdot\beta\bigr),
 \qquad
 (h^\sharp\cdot\beta)(v,w)=\beta(h^\sharp v,w)+\beta(v,h^\sharp w).
\]
The curvature coefficient contributes
\(\dot{\widetilde K}=\ell^4(W\dot{\widetilde W}+\dot{\widetilde W}W)\).
For example, in the curvature-operator convention of E33, write
\(\mathcal R_t\) for the Riemann curvature operator on ambient
two-forms and \(s_t\) for scalar curvature. Then
\(\widetilde W_t=J_t\mathcal R_tU_t-s_t\,\mathrm{Id}/12\), so
\[
 \dot{\widetilde W}
 =\bigl(P\dot{\mathcal R}+P\dot P\mathcal R_0
                 +P\mathcal R_0\dot P\bigr)\big|_{\Lambda^+}
     -\tfrac{\dot s}{12}\,\mathrm{Id}.
\]
Here \(\dot{\mathcal R}\) includes the change in raising indices with
\(g_t\). This formula uses the actual metric variation of the curvature
and its chiral splitting.

Write \(\mathcal B_h=\dot{\widetilde K}P+KP\dot P\) on ambient
two-forms. The moving-field terms can be seen before collecting them.
Since \(K_{g_t}P_{g_t}=U_t\widetilde K_tJ_t\), one has
\[
 \begin{aligned}
 \dot V={}&\int_X
 \dot U\chi\wedge(KPF-H/2)
 +\chi\wedge\dot U(KPF-H/2)
 +\chi\wedge \mathcal B_h F .
 \end{aligned}
\]
Both \(\dot U\) terms vanish pointwise because a self-dual form wedges
to zero with an anti-self-dual form. This accounts for the transport of
\(\chi,H\), and of the projected output. The integral is of a top
form, with no separate variation of a metric volume density.
The fixed-field derivatives are therefore
\[
 \dot V=\int_X\chi\wedge\mathcal B_h F,\qquad
 \dot S=\int_X H\wedge\mathcal B_hF-\chi\wedge\mathcal B_h d\psi
       =Q\dot V,\qquad
 \dot I_p=0.
\]
The primitive is gauge invariant and the equality needs no
spacetime integration by parts.

On the round control \(W=0\), so \(K=\mathrm{Id}\) everywhere and
\(\dot{\widetilde K}=0\) for every variation. The term in the primitive
there is \(P\dot P F\). For E33 the test point \(p\) is the chart origin.
The [physical E33 value][e33] in the positively oriented orthonormal
self-dual basis gives
\[
 W(p)=\operatorname{diag}(-\epsilon/2,\epsilon/2,0),\qquad
 K(p)=\operatorname{diag}\bigl(1+\ell^4\epsilon^2/4,\,
                          1+\ell^4\epsilon^2/4,\,1\bigr).
\]
The two curved eigendirections have the same \(K\)-eigenvalue. A
constant-in-space scaling \(g_t=e^{2ct}g_0\) at E33 gives \(\dot P=0\)
and \(\dot{\widetilde K}=-4c(K-\mathrm{Id})\), exhibiting a generally
nonzero curvature-coefficient term in the primitive. Both formulas
for \(\dot S\) apply on this nonround control. The distinct twistor
comparison in B03 uses AHS Theorem 4.1 in the opposite chirality.
After orientation reversal the integrability condition for the canonical
structure on \(S(\Lambda^+)\) is \(W^+=0\). The spacetime \(Q\) above
is defined directly on differential forms. [AHS, pp. 435–436][ahs]

## Point class and the Ward-identity limit

Restrict polynomials to a flat \(A\), \(\phi\equiv a\) constant, and
\(\psi=\chi=H=0\), keeping \(a\) arbitrary. The entire \(Q\)-vector field
vanishes there, so every \(Q\)-exact polynomial restricts to zero,
including polynomials in field derivatives. The restriction of \(I_p\)
is \(a^2\), which proves \([I_p]\ne 0\) in the specified gauge-invariant
polynomial algebra at both metrics. The class is independent of the point
on this connected manifold. For any fixed path \(\gamma\) from \(p'\)
to \(p\), one has the gauge-invariant identity
\[
 I_p-I_{p'}= -Q\int_\gamma 2\phi\psi .
\]

With a differentiable pushforward on the transported gauge-invariant
algebra that annihilates \(Q\)-exact insertions, the first action
variation in the numerator of a putative Euclidean correlation
would be the insertion \(-Q(I_p\,\dot V\,e^{-S_g})\). This follows
from \(QI_p=QS_g=0\). The same identity holds with \(I_p\) replaced
by \(1\), so it also tests a normalized correlation if its denominator
exists and is nonzero. The argument removes the dependence entering
through the gauge fermion, including the smooth metric variation and
variation of \(\ell\), and the path formula removes the dependence
on the point location. The nonzero scalar class can survive in
the target of such a pushforward. A result could depend on the underlying
smooth gauge domain and on the treatment of residual data. A variation
of the measure or domain, an anomaly, or a contribution from field-space
ends would require its own calculation. This is the conditional Ward
reasoning of Witten §3, with his measure caveat, applied here only as
an algebraic test. [Witten, (3.2)–(3.9), n. 10 and (3.27)–(3.33)][witten]

A quantum pushforward needs a gauge quotient and a regulated integration
cycle or measure with a justified Ward identity, including control of
field-space ends and of the variation under \(U_t\). The constant
gauge circle acts trivially on these fields and is the stabilizer of
every \(A\) on connected \(X\). The flat connection is unique up to gauge
on \(S^4\). The pushforward must account for this stabilizer, for example
by specifying the residual equivariant target and what pairing would
produce a number. \(S_g\) is independent of \(\phi\), and its constant
mode \(a\) is \(Q\)-closed and invisible to \(d\phi\). There is no
damping of \(a\) in the frozen action, and the point insertion restricts
to \(a^2\). There are also undamped nonconstant scalar directions and
the exact one-form directions of \(\psi\) drop out of \(d\psi\).
The bosonic auxiliary term with real \(H\) is
\(\tfrac12\|K_gP_gF\|^2-\tfrac12\|H-K_gP_gF\|^2\) in the metric
\(L^2\) pairing. It gives no convergent real-\(H\) Gaussian for \(e^{-S_g}\).
An actual contour and prescription for the residual modes are part of
the missing pushforward.

The bounded check ends with the classical identities at the two controls
and the nonzero polynomial class. It provides no quantum value or
smooth-sphere comparison.

[ahs]: ../../../../../../references/Atiyah.pdf#page=12
[e33]: ../../../02_invariants/notes/E22_METRIC_AND_SPECTRUM.md#physical-and-auxiliary-metrics
[witten]: https://www.ias.edu/sites/default/files/sns/%5B109%5DCommMathPhys117-1988.pdf
