# E250 — Conditional fixed-cap crossing in the original local flow

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E implication under B113, configured
gpt-6.2-sol/ultra. Selected-lead settings and independent runtime
attestation are unavailable. I authored the E235 local germ calculation
and the E245 near-round cap-crossing implication. This packet uses
the lead-assessed local inputs and proves the new conditional
arbitrary-fixed-ratio flow implication.

## Hypotheses and conclusion

Work on the supplied standard smooth closed oriented real \(S^4\) and
the fixed oriented Euclidean rank-three round chiral bundle \(E\),
with principal \(SO(3)\) frame bundle \(P\). Use the positive
Riemannian definite, round-compatible component of the connection
space, Fine's native internal pairing and reconstructed metric
\(g_A\), and native time \(\tau\). The normalized wedge quotient \(Q_A\)
is symmetric positive definite with trace three, and
\(\rho_A=\lambda_{\max}(Q_A)/\lambda_{\min}(Q_A)\).

Assume \(H_{\rm fixedcap}\). For each fixed finite \(r>1\) there is
a smooth connection \(A_r\) in this component with
\(\sup_{S^4}\rho_{A_r}=r\), unique maximizing point \(x_0\), and
the exact E235 germ near \(x_0\). In particular the original native
vector field at this datum gives
\(\bigl(d(\log\rho)_{A_r}[v(A_r)]\bigr)_{x_0}=1/2\). The static realization is
pending E248/E249 at the boundary of this conditional packet.
[B113](../brainstorm/notes/B113_FIXED_RATIO_RADIAL_MODEL_20261123.md)
· [E235/E236 assessment](../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md).

For each such \(r\) and each supplied datum \(A_r\), there is a
unique smooth original solution \(A^{(r)}(\tau)\) on a
datum-dependent interval starting at \(A_r\). There is a
\(\delta_r>0\) within that interval such that
\[
 \sup_{S^4}\rho_{A^{(r)}(\tau)}
 \ \geq\ \rho_{A^{(r)}(\tau)}(x_0)
 \ \geq\ r\exp(\tau/4)>r
 \qquad(0<\tau<\delta_r).
 \tag{1}
\]
In particular the closed cap with threshold \(r\) fails to be
forward invariant, conditionally for every fixed finite \(r>1\).

## Smooth existence and sign of recovery

Set the smooth reference \(\bar A=A_r\), \(\bar g=g_{A_r}\).
The E29 unknown \(\widehat a=\widehat A-\bar A\) is a smooth section
of \(T^*S^4\otimes\mathfrak{so}(E)\), with initial section and
initial first jet zero. For this reference the E27/E29 strict
Hermitian symbol bound is uniform on its compact unit cosphere
and unit amplitudes, and gives a small admissible first-jet
neighborhood of zero for this datum. The construction applies
on the closed bundle with fixed smooth metrics and finite
local trivializations. E29's cutoff and spectral approximation
produce the smooth adjusted solution from this smooth trace
with smoothness up to the initial slice. First-jet continuity
allows restriction to the interval where the auxiliary cutoff
equals one, with the same positive definite sign. Reference
choice and the symbol test apply at each individual \(A_r\).
The radius, coefficient bounds and short interval can depend
on \(A_r\). [E29, matching and closed-bundle proof](29_LOCAL_PARABOLIC_INPUT_20261122.md)
· [E28/E29 assessment](../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md).

For the signs, let \(\mathsf S_B(u)=\iota_u F_B\) and
\(\chi_B(u)\) be the \(B\)-horizontal lift. For \(b=B-\bar A\) set
\[
 \psi_B=d_B^{*\bar g}b,\qquad
 z_B=\mathsf S_B^*d_B^{*g_B}d_B b,\qquad
 \xi(B)=-\psi_B-\chi_B(z_B).
 \tag{2}
\]
The outer \(\mathsf S_B^*\) uses the live native metric and
internal pairing. The vertical codifferential alone has the
fixed base metric. For the left action \(h(B)=(h^{-1})^*B\),
\[
 R(\phi+\chi_B(u),B)=-d_B\phi-\mathsf S_B u .
\]
Thus \(R(\xi(B),B)=d_B\psi_B+\mathsf S_B z_B\), and the
constructed path satisfies
\[
 \partial_\tau\widehat A=v(\widehat A)
                  -R(\xi(\widehat A),\widehat A),\qquad
 v(B)=-d_B^{*g_B}\!\left(
    (4Q_B-\tfrac23\operatorname{tr}(Q_B^2)I)F_B\right).
 \tag{3}
\]
These are the E28/E29 native conventions. [Fine v2, Proposition 4.2 and §4.2](https://arxiv.org/html/1111.5005v2#S4.SS2)
· [E28, (1) and (7)–(8)](28_FIXED_GAUGE_CORRESPONDENCE_20261122.md).

On the compact \(P\), solve for the equivariant diffeomorphism
path \(j(\tau)\) from
\[
 \partial_\tau j=-\xi(\widehat A(\tau))\circ j,\qquad
 j(0)=\mathrm{id}_P .
 \tag{4}
\]
The vector field is smooth up to \(\tau=0\) and right
\(SO(3)\)-invariant. Uniqueness of the vector flow gives right
equivariance, so each \(j(\tau)\) is a smooth bundle
automorphism covering a base diffeomorphism isotopic to the
identity. Set \(A^{(r)}(\tau)=j(\tau)^*\widehat A(\tau)\).
For an invariant field \(\zeta=\phi+\chi_B(u)\), the covariant
Cartan identity on the frame bundle gives
\(\mathcal L_\zeta B=d_B\phi+\mathsf S_B u=-R(\zeta,B)\).
Differentiating the pullback in (4) and using equivariance of
\(v\) therefore gives
\[
 \partial_\tau A^{(r)}
 =j^*\!\left(\partial_\tau\widehat A
                 +\mathcal L_{-\xi(\widehat A)}\widehat A\right)
 =j^*v(\widehat A)=v(A^{(r)}).
 \tag{5}
\]
The identity initial map gives \(A^{(r)}(0)=A_r\).
The recovered path and (5) are smooth up to zero, with the
right time derivative at zero equal to the original vector
field. Pullback preserves positive definiteness and the sign.
This recovered path uses the same native time \(\tau\).
[E28, smooth correspondence](28_FIXED_GAUGE_CORRESPONDENCE_20261122.md).

For original uniqueness, a supplied smooth original path
through \(A_r\) is put into the same adjusted equation by the
E28 reverse equation
\(\partial_\tau h=-\xi(h(A))\circ h\), starting at the identity.
Its parabolic short-time solvability in the time-dependent
section chart is the other E29 application. Adjusted
uniqueness then identifies the adjusted paths. The product
identity in E28 identifies their forward recovery with the
unique path (4). Recenter at matching smooth times to get
uniqueness throughout the common smooth interval.
[E28/E29 assessment](../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md).

## Fixed-point comparison and strict thresholds

At \(x_0\), the center eigenvalues in the E235 germ are
\[
 \frac{2}{1+r}<1<\frac{2r}{1+r}.
\]
For each fixed \(r>1\) the two gaps are positive. Since the
original path has smooth curvature and smooth positive
quotient up to time zero, these eigenvalues stay simple at
the same original point on a short interval. The scalar
\(\ell(\tau)=\log\rho_{A^{(r)}(\tau)}(x_0)\) is then smooth
up to zero. By (5) its derivative at zero is the E235 native
directional derivative. In E235's old \(K=1\) clock this
derivative is \(1\), with \(g=2\widehat g\) and
\(\tau=2t_{\rm old}\). Equation (5) uses the native value \(1/2\).
With \(\ell(0)=\log r\) this gives
\(\ell(\tau)=\log r+\tau/2+o(\tau)\) as \(\tau\downarrow0\).
Reducing the interval so the remainder has magnitude at most
\(\tau/4\) proves (1). The point \(x_0\) stays fixed in the
original coordinates for this argument. A continued branch
of maximizing points is unnecessary.
[E235/E236 assessment](../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md).

For each fixed \(r\) and \(\eta>0\), continuity at zero gives a
time \(\tau_*\in(0,\delta_r)\) with
\(r<\rho_{A^{(r)}(\tau_*)}(x_0)<r+\eta\).
Choose any \(R\) between \(r\) and this later point value.
The initial supremum is strictly below \(R\), and the later
supremum is strictly above \(R\). In fact for a fixed such
\(\tau_*\) the single trajectory crosses all strict thresholds
in the interval between these two values. The resulting
quantifiers are that some strict thresholds are crossed
arbitrarily close above each \(r\), with datum-dependent
intervals. A prescribed strict threshold elsewhere requires
its own argument.

For a smooth orientation-preserving bundle automorphism \(h\)
covering \(f\), write its associated oriented fiber isometry
as \(H_x:E_x\to E_{f(x)}\). The curvature transforms by
pullback, the native curvature density pulls back by \(f\),
and division of the wedge Gram by that density gives
\[
 Q_{h^*B}(x)=H_x^{-1}Q_B(f(x))H_x,\qquad
 \rho_{h^*B}(x)=\rho_B(f(x)).
\]
Taking the supremum over the base gives equality. This is
a statement on each slice, so the comparisons of spatial
suprema also hold after time-dependent smooth bundle
automorphisms on the interval.

## Primary-source and time scope

This uses assessed E28/E29 as a branch local existence and
recovery result. The Fine dependency is v2 Proposition 4.2
and the §4.2 infinitesimal action, recovery and original local
theory. The parabolic input retains Taylor's undated
repaginated author-hosted 1991 monograph, §7.3, printed
pp. 147–149, Propositions 7.3.A–B, with the E29 compact-bundle
extension supplied in the branch. The Fine-cited Taylor
2011 Proposition 8.1 remains unverified. No new source access
was made. [Fine record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md)
· [Taylor R19 record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#local-parabolic-primary-input).

The arbitrary-fixed-ratio result is a conditional short-time
result on the supplied standard sphere. The near-round family
in the separate E243–E245 assessment lies in the global
small-value basin and has its assessed round-attraction
conclusion. Here the argument gives a datum-dependent crossing
interval, with later lifetime and behavior for arbitrary \(r\)
left open. [E243–E245 assessment](../reviews/E243_E245_GLOBAL_RATIO_CAP_ASSESSMENT_20261123.md).
