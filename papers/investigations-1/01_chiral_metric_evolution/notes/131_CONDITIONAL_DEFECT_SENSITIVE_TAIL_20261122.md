# SP4-CME-E131 — Conditional defect-sensitive stable tail

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E50, E63, E76 and E125
among the direct derivations and previously audited E84 in E86.
I authored the E119 and E128 inputs upstream of the head premise.
I did not author E48, E49, E84 or E129. The eleven frozen hashes
matched. The returned E129 note and return were also read. The
E128/E130 analytic assessment is available, and this packet still
uses the head combination at the explicit conditional scope of
the request. No new primary text was inspected.
[Request][req] · [B68][b68] · [E129 return][ret129] ·
[E128/E130 assessment][a128] · [Return][ret].

## Fixed setting and conditional conclusion

On the smooth closed oriented native round Riemannian \(S^4\), fix
the positive perfect chiral \(\mathrm{SO}(3)\) connection \(A_0\),
curvature \(F_0\), negative Killing pairing, and round reference
metric \(G\) of sectional curvature \(1/2\). Use native time
\(\tau\) and the fixed product derivative \(D_0\) with the
reference connections on internal and base slots. For smooth
actual data set
\[
 v=\|A_{\rm in}-A_0\|_{\infty;0}
      +\|F_{A_{\rm in}}-F_0\|_{\infty;0},\qquad
 \ell=\|T(A_{\rm in})\|_{L^{4,1}(g^{\rm F}_{A_{\rm in}})} .
\]
The live Lorentz convention is that of E129. Let \(\mathcal T\)
be the fixed E42 head time. Use the fixed \(0<h\le\mathcal T/4\)
of E129. **Premise:** for \(v\) below one fixed threshold, the
compatible adjusted head satisfies \(E_h(q)\le C\ell\), and the
recovered original head budget on \([0,h]\) is at most \(C\ell\).
There is no smallness assumption on \(\ell\). Here
\(q=Q-I\) and \(E_h\) is the E129 fixed-atlas critical path norm.
[E129, (1) and fixed setting][e129] · [Frozen head premise][r129].

After one fixed reduction of the allowed \(v\), the tail
recovered from the splice at \(h\) satisfies
\[
 \int_h^\infty
 \sup_{S^4}\bigl(|\nabla^AT|_{g^{\rm F}_A}+|T|_{g^{\rm F}_A}^2\bigr)
 \,d\tau\le C_h\ell .                                             \tag{1}
\]
The constants and threshold use only fixed data, including \(h\)
and the constants in the head premise. In particular the whole-time
sum of head and tail is at most \(C_h\ell\) conditional on that
premise. The proof uses \(H^5\) for the defect and \(H^{10}\)
for the stable connection.

## Finite smoothing at the fixed splice

Write \(\widehat A\) for the compatible E42 head, with pair
\(U=(\widehat A-A_0,F_{\widehat A}-F_0)\). On
\(I=[h/2,h]\), choose the E63 strip and datum radius at order ten
once. Comparing against the zero centered pair gives
\(\sup_I\|U(\tau)\|_{C^{10}}\le C_h v\) in fixed norms.
If necessary use a fixed positive strip slightly larger than \(I\)
inside \(0<\tau<\mathcal T\). Compactness and fixed Sobolev norms
in particular give
\[
 \|\widehat A(h)-A_0\|_{H^{10}}\le C_h v.                          \tag{2}
\]
This relies on fixed positive smoothing time and finite order,
independent of initial derivatives.
[E63, uniform fixed-strip estimate and Sobolev consequence][e63].

By E125 the head defect obeys, with fixed derivatives,
\[
 q_\tau=A^{ij}D_{0,i}D_{0,j}q+B^iD_{0,i}q+Cq ,
 \qquad A^{ij}=g^{ij}\mathscr L_Q .
 \tag{3}
\]
Here \(B,C\) are actual arrays obtained from the known head
pair and include the determinant reaction and both gauge terms.
Their smooth value dependence is affine in \(D_0U\), apart from
the fixed \(-12\) reaction in \(C\). Thus the E63 bound gives
uniform \(C^6\) for \(A\) and \(C^5\) for \(B,C\) on \(I\).
For example \(C^5\) of an affine first-jet coefficient uses
at most \(D_0^6U\). The coefficient \(A\) is pointwise
positive on each differentiated tensor bundle, with a uniform
lower constant: \(g\) stays uniformly comparable to \(G\), and
\(\mathscr L_Q\) is positive self-adjoint on the trace-free
internal symmetric endomorphisms in the value tube. Extra
fixed base slots are acted on by identity.
[E125 (1), (9)–(11)][e125] · [E125/E127 assessment][a125].

We give the finite smoothing estimate in the fixed \(G\) volume
and fixed pairings. Let \(y_m(\tau)=\sum_{j=0}^m
\|D_0^j q(\tau)\|_2^2\), \(0\le m\le6\).
For \(0\le j\le5\), differentiating (3) \(j\) times and
reordering the fixed covariant derivatives gives the same leading
array on \(D_0^j q\). Reordering two adjacent slots of a fixed
covariant derivative produces the curvature on the remaining
fixed tensor slots. With any derivatives outside that swap this
costs fixed coefficients times derivatives of \(q\) through
order \(j\) in the commutation of \(D_0^j\) past a Hessian.
Leibniz terms with one or more derivatives on \(A\) use at most
order \(j+1\) of \(q\). The differentiated \(B,C\) terms
also use at most order \(j+1\).

For \(z=D_0^j q\), integrate the principal term in (3) by
parts against \(z\). It is
\(-\int\langle A^{ik}D_{0,k}z,D_{0,i}z\rangle\,dV_G\)
plus a term bounded by \(C\|D_0z\|_2\|z\|_2\) from
\(D_0 A\). The other terms just described are bounded by
\(C_j(\|D_0^{j+1}q\|_2+\|q\|_{H^j})\|z\|_2\).
Young's inequality absorbs the highest derivative factor using
the fixed coercivity. Summing through order \(m\) and including
the \(L^2\) term of \(y_{m+1}\) on the right gives
\[
                 y_m'+c\,y_{m+1}\le C_m y_m,\qquad 0\le m\le5,     \tag{4}
\]
with \(c>0\) and \(C_m\) uniform on the strip and the
chosen value ball. The coefficients need only the finite orders
above. All differentiations are on the supplied smooth positive
head strip.

Set \(x=\tau-h/2\) and choose positive \(\nu_m\), starting with
\(\nu_0=1\), so \(m\nu_m\le c\nu_{m-1}/2\) for \(1\le m\le5\).
The derivative of \(\sum_{m=0}^5\nu_m x^m y_m\) has the
weight terms \(m\nu_m x^{m-1}y_m\), each absorbed by
the preceding dissipation in (4). Thus this sum is bounded
by \(e^{C x}y_0(h/2)\). In particular
\(\|q(h)\|_{H^5}\le C_h\|q(h/2)\|_2\).
On the fixed compact base \(\mathcal B^{1/2}_{8,1}\hookrightarrow
L^8\hookrightarrow L^2\) by the block sum and fixed atlas
reconstruction. The \(M_h\) part of the premise therefore
bounds \(\|q(h/2)\|_2\) by \(CE_h(q)\). We conclude
\[
                         \|q(h)\|_{H^5}\le C_h\ell .               \tag{5}
\]
There is no use of a small \(\ell\) in this finite-order energy
argument.

## Uniform \(H^{10}\) stable background at the earlier splice

Let \(B(0)=\widehat A(h)\) and write \(a(s)=B(s)-A_0\)
in tail time \(s=\tau-h\). The connection is smooth at \(h\)
and definite in the reference component. Decrease the fixed
\(v\) radius using (2) so its \(H^6\) norm is strictly inside
E49's \(m=6\) entry ball. E49 provides smoothness through
\(s=0\) for this smooth datum and
\[
                     \|a(s)\|_{H^6}\le C_6 e^{-\alpha s}
                                   \|a(0)\|_{H^6}.               \tag{6}
\]
Use E76's exact tame inequality at order ten,
\(\|N(a)\|_{H^9}\le C_{10}\|a\|_{H^6}\|a\|_{H^{11}}\)
for the fixed stability operator with its full linearization
subtracted. It holds on the original \(H^6\) tube. Let \(G_{\rm st}\)
denote that positive linearized operator, \(P_{\rm st}=I+G_{\rm st}\),
and \(\mathcal H_{\rm st}^j\) its fixed graph norm
\(\|P_{\rm st}^{j/2}\cdot\|_2\). As in E76 (7),
with \(\alpha=\lambda_1(G_{\rm st})/2\) there is a fixed
\(\theta>0\) with \(G_{\rm st}-\alpha I\ge\theta P_{\rm st}\).
For \(b=e^{\alpha s}a\), the exact E76 graph energy gives
\[
 \tfrac12\frac{d}{ds}\|b\|_{\mathcal H_{\rm st}^{10}}^2
       +\theta\|b\|_{\mathcal H_{\rm st}^{11}}^2
 \le C_{10}'\|a(s)\|_{H^6}\|b\|_{\mathcal H_{\rm st}^{11}}^2 .
\]
Choose a further fixed threshold so
\(C_{10}' C_6 C_h v\le\theta/2\), using (2) to control
\(a(0)\) in \(H^6\). Then (6) absorbs the right side
from \(s=0\) for every such datum. The starting energy is
bounded by the quantitative \(H^{10}\) estimate (2).
Graph equivalence and monotonicity give
\[
                 \|a(s)\|_{H^{10}}
                    \le C\|a(0)\|_{H^{10}} e^{-\alpha s}
                    \le C_h v e^{-\alpha s}.                    \tag{7}
\]
This uses E76's energy before its qualitative high-order
consequence. Its datum-dependent late-tail constants are unnecessary.
[E49, (1)–(2)][e49] · [E76 (6)–(9)][e76].

E50's argument works at this earlier fixed \(h\). The local
head is smooth through zero for each actual smooth datum by
its individual comparison, and exists smoothly on a right
neighborhood of \(h\), since \(h<\mathcal T\).
Recover the head there by \(g_{\rm loc}(\tau)\) and recover
the stable solution by \(g_{\rm st}(s)\) from the identity at
\(s=0\). With the left action \(g\cdot A=(g^{-1})^*A\), put
\(\gamma=g_{\rm loc}(h)\). The two original paths are
\(g_{\rm loc}(\tau)\cdot\widehat A(\tau)\) and
\((\gamma g_{\rm st}(s))\cdot B(s)\).
They agree at \(h\) because \(B(0)=\widehat A(h)\).
Both solve the original equation on a right neighborhood of \(h\)
by E50 recovery and the fixed left factor's equivariance.
Smooth original uniqueness recentered at their common definite
connection identifies them there, giving a smooth splice.
The orientation-preserving recovery maps exist individually
for these smooth paths. No uniform bound on their derivatives
is used. Equality with the existing original solution follows
from the same smooth uniqueness. The former choice
\(\mathcal T/2\) served as a fixed interior smoothing time.
[E50, fixed-time choice and (8)–(12)][e50].

## Stable-gauge defect coefficients

In this section \(q=Q(F_B)-I\), \(g=g^{\rm F}_B\).
Let \(\Delta_{\rm vec}=\nabla_0^*\nabla_0\) be the
**nonnegative** fixed rough Laplacian on vector fields in E48.
That velocity has
\[
 \phi=d_0^{*G}a,\qquad u=-\Delta_{\rm vec}S_0^*a,\qquad
 B_s=v_{\rm F}(B)-d_B\phi+\iota_uF_B .                            \tag{8}
\]
Here the base velocity has order two in \(a\), the vertical
parameter has order one, and every operator on their right is
fixed. This is the stable gauge in E48. In E50's convention
\(R(\eta+\chi_B(X),B)=-d_B\eta-\iota_XF_B\) for the left
action, so the recovery generator in \(B_s=v_{\rm F}-R(\xi,B)\)
is \(\xi=-\phi+\chi_B(u)\), in agreement with E48 (5).
[E48 (1), (4)–(5)][e48] · [E50 (5), (7)][e50].

Apply the exact E125 normalized wedge calculation to (8) with
these parameters. The vertical curvature term is
\(-d_B^2\phi=[\phi,F_B]\), yielding \(+[\operatorname{ad}\phi,q]\).
By Bianchi the base contribution has \(d_B\iota_uF_B=
\mathcal L_u F_B+[B(u),F_B]\) in a local frame. Its
normalization cancels the common density factor from
\(\mathcal L_u(\mu Q)\), so it gives \(+\nabla_u^B q\).
In particular no derivative of the second-order base velocity
is needed here. The adjusted volume obeys
\(\mu_s=\mathcal L_u\mu\). Thus the exact defect identity is
\[
 q_s=\mathscr L_Q(\nabla^i\nabla_i q)
       -12\sqrt{\det Q}\,q+\mathcal N_Q(X,\Xi)
       +\nabla_u^Bq+[\operatorname{ad}\phi,q],                    \tag{9}
\]
with the physical terms in E125 (2)–(3), in native time.
[E125 (6)–(8)][e125].

We check the finite coefficient orders explicitly. On the fixed
four-dimensional bundle \(H^{10}\hookrightarrow C^7\), since
\(10>7+2\). This fixed Sobolev estimate follows in charts
by Fourier Cauchy–Schwarz against the summable squared
weight of order \(7-10<-2\), with fixed cutoffs.
Put \(d(s)=v e^{-\alpha s}\). From (7) one has
\(\|a\|_{C^7}\le C_h d(s)\).
The actual curvature identity
\(F_B-F_0=d_0a+[a\wedge a]/2\) gives
\(\|\zeta\|_{C^6}\le C_h d(s)\).
Smooth metric and wedge-Gram reconstruction then give
\(\|g-G\|_{C^6}+\|Q-I\|_{C^6}\le C_h d(s)\)
on a fixed positive tube. The principal array
\(g^{ij}\mathscr L_Q-4G^{ij}\mathrm{Id}\) has the same
\(C^6\) bound. Differentiating its coefficients through six
orders uses at most seven derivatives of \(a\).

The lower arrays can be read from the fixed Hessian expansion
in E125 (10). The internal \(a,D_0a\) terms and the
Levi–Civita difference, which uses \(D_0g\), are bounded
in \(C^5\) by \(C_h d(s)\).
In each physical first-jet product, retain
\(X=D_0q+[\operatorname{ad}(a),q]\) as one factor and
use the actual \(X\) or \(\Xi\) for the other coefficient.
These coefficient factors are \(O(d(s))\) in \(C^5\)
from \(D_0Q,D_0 F\), the two live base slots of \(\nabla F\),
and the fixed-background internal action. Their reference
values vanish. The residual reaction coefficient after
subtracting \(-12q\) is also \(O(d(s))\) in \(C^5\).
The vertical commutator uses \(\phi\) in \(C^5\), costing
at most \(a\) in \(C^6\). The base transport uses \(u\)
in \(C^5\) and \(a(u)\) in its internal action. Its highest
derivative is seven on \(a\), because both inner base
operators in (8) are fixed and the quotient has eliminated
\(D_0u\). These checks include all variable base slots.

In particular use the **nonpositive** fixed defect Laplacian
\(\Delta_{\mathcal V}=-D_0^*D_0\) on
\(\mathcal V=\operatorname{Sym}_0 E\), separate from
\(\Delta_{\rm vec}\). Then (9) is
\[
 q_s+L_{\mathcal V}q=\mathcal R_s q,\qquad
 L_{\mathcal V}=-4\Delta_{\mathcal V}+12I,\qquad
 \mathcal R_s z=P^{ij}D_{0,i}D_{0,j}z+B^i_*D_{0,i}z+C_*z ,
 \tag{10}
\]
where the coefficients are those of the actual smooth solution
with the allocation just made. They obey
\[
 \|P\|_{C^6}+\|B_*\|_{C^5}+\|C_*\|_{C^5}\le C_h d(s).
 \tag{11}
\]
If using a bilinear product allocation that splits a symmetric
contraction, project the output arrays onto the fixed trace-free
symmetric bundle. This preserves (10) on \(q\) and is a bounded
fixed operation. Since we need the source in \(H^4\), the
ordinary integer Leibniz rule gives, in particular,
\[
                 \|\mathcal R_s z\|_{H^4}\le C_h d(s)\|z\|_{H^6}.
 \tag{12}
\]
The principal term uses at most four coefficient derivatives
and six of \(z\), and the lower terms use at most four coefficient
derivatives and five of \(z\). The verified orders in (11) are
sufficient.
[E125, fixed-reference inventory][e125] · [E48, finite gauge order][e48].

## Defect graph energy and intrinsic tail

Let \(P_{\mathcal V}=I+L_{\mathcal V}=13I+4D_0^*D_0\).
The two graph quantities
\(\|P_{\mathcal V}^3 z\|_2\) and
\(\langle P_{\mathcal V}P_{\mathcal V}^2z,P_{\mathcal V}^2z\rangle^{1/2}\)
are equivalent to fixed \(H^6\) and \(H^5\), respectively.
For the elementary finite elliptic estimate, integrate the
squared second derivative by parts and commute the fixed rough
Laplacian through \(D_0\). Curvature times \(D_0z\) and its
fixed derivative times \(z\) are the commutator costs. This gives
\(\|D_0^2z\|_2^2\le \|D_0^*D_0z\|_2^2+
C(\|D_0z\|_2^2+\|z\|_2^2)\).
Apply this to \(D_0^j z\) and commute the fixed Laplacian through
the \(j\) derivatives. Those commutators use fixed smooth
curvature coefficients and at most \(j\) derivatives of \(z\).
Interpolating the intermediate derivative by
\(\|D_0^{j+1}z\|_2^2\le C\|D_0^{j+2}z\|_2\|D_0^jz\|_2\)
gives
\(\|z\|_{H^{j+2}}\le C_j(\|P_{\mathcal V}z\|_{H^j}+\|z\|_{H^j})\).
The intermediate inequality is integration by parts on \(D_0^jz\)
against its fixed rough Laplacian. Iterating the bound down at the
lower orders, with the positive form at order one, yields
\(\|z\|_{H^{j+2}}\le C_j(\|P_{\mathcal V}z\|_{H^j}+\|z\|_2)\)
at the finite orders at issue.
For \(H^6\) iterate the even estimates with \(P_{\mathcal V}\ge13I\).
For \(H^5\) iterate to \(P_{\mathcal V}^2z\) in \(H^1\), whose
graph quantity is \(13\|P_{\mathcal V}^2z\|_2^2+
4\|D_0P_{\mathcal V}^2z\|_2^2\). The reverse inequalities
use only the fixed orders of these differential operators.

Put \(Z=P_{\mathcal V}^2q\) and
\(\mathscr E_5=\langle P_{\mathcal V}Z,Z\rangle\).
Since \(P_{\mathcal V}\) commutes with \(L_{\mathcal V}\), the
exact smooth energy identity from (10) is
\[
 \tfrac12\mathscr E_5'
      +\|P_{\mathcal V}Z\|_2^2-\mathscr E_5
    =\langle P_{\mathcal V}^2\mathcal R_s q,P_{\mathcal V}Z\rangle .
 \tag{13}
\]
The right side is at most \(C_h d(s)\|P_{\mathcal V}Z\|_2^2\)
by (12) and the \(H^6\) equivalence. Positivity gives
\(\|P_{\mathcal V}Z\|_2^2\ge13\mathscr E_5\), using the
positive form and Cauchy–Schwarz. Hence the dissipation on the
left is at least \((12/13)\|P_{\mathcal V}Z\|_2^2\).
For a fixed threshold \(C_h v\le6/13\), absorb the right
side and get \(\tfrac12\mathscr E_5'+6\mathscr E_5\le0\).
In particular, by (5),
\[
                  \|q(s)\|_{H^5}\le C e^{-6s}\|q(0)\|_{H^5}
                                \le C_h \ell e^{-6s}.             \tag{14}
\]
The tail starts with \(q(0)=Q(F_{\widehat A(h)})-I\) in the
same fixed frame, so no gauge change or distortion of (5) is
needed here. The absorption conditions constrain only \(v\).

Finally \(H^5\hookrightarrow C^2\) in dimension four.
In the live tube \(T=\frac12(Q^{-1/2}\nabla^B q\,Q^{-1/2})_0\)
and its full derivative satisfy
\[
 |T|_g\le C|\nabla^B q|_g,\qquad
 |\nabla^B T|_g\le C\bigl(|(\nabla^B)^2q|_g+|\nabla^B q|_g^2\bigr).
\]
These follow by differentiating the matrix factors on the
internal slots and using the live Levi–Civita derivative on all
base slots. The exact fixed comparison in E125 (10) controls
\(\nabla^B q,(\nabla^B)^2q\) in sup norm by \(C\|q\|_{H^5}\)
on the small tail. In the squared terms retain one factor
\(\|\nabla^B q\|_\infty\le C_h d(s)\) from the background
coefficient estimates and one factor \(C\|q\|_{H^5}\).
Thus the full derivative and squared strain sum is at most
\(C_h\ell e^{-6s}\). The metrics are uniformly comparable
to the round reference in these adjusted coordinates.

The recovered original tail at each time is the bundle pullback
of the stable slice by the inverse of \(\gamma g_{\rm st}(s)\).
By E84 the internal and Levi–Civita covariant derivatives pull
back together with the live metric. In particular the sup of
the full derivative plus squared strain is identical on the two
slices at that time. Integration in the same native time proves
(1). Adding the explicitly assumed E129 head budget gives the
conditional whole-time bound. No derivative-dependent threshold
or extra hypothesis on \(\ell\) appears.
[E84, (2)–(5) and native budget][e84] · [E129, head premise][e129].

[req]: ../research-progress/handoffs/SP4-CME-E131_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E131_RETURN_v1.md
[b68]: ../brainstorm/notes/B68_DEFECT_SENSITIVE_STABLE_TAIL_20261122.md
[r129]: ../research-progress/handoffs/SP4-CME-E129_REQUEST_v1.md
[ret129]: ../research-progress/handoffs/SP4-CME-E129_RETURN_v1.md
[e129]: 129_CONDITIONAL_INTRINSIC_ENDPOINT_HEAD_20261122.md
[a128]: ../reviews/E128_E130_MIXED_COEFFICIENT_ASSESSMENT_20261122.md
[e125]: 125_ADJUSTED_DEFECT_EQUATION_20261122.md
[a125]: ../reviews/E125_E127_ADJUSTED_DEFECT_ASSESSMENT_20261122.md
[e48]: 48_FIXED_STABILITY_GAUGE_20261122.md
[e49]: 49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e63]: 63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e76]: 76_HIGH_ORDER_STABLE_LIMIT_20261122.md
[e84]: 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
