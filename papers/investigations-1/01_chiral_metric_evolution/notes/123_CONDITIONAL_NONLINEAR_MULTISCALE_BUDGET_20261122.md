# SP4-CME-E123 — Conditional nonlinear multiscale budget transfer

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E50, E76, E115 and E119,
and audited E84 in E86. I did not author E84, E112 or E116.
This is a combination check, with the E119 estimate an explicit
premise for the trajectory lower bound. E122 was auditing that
premise at dispatch. The seven frozen digests matched. No new
primary text was inspected. [Request][req] · [B64][b64] · [Return][ret].

## Data and estimates

Use the actual positive perfect chiral \(\mathrm{SO}(3)\) bundle
of the smooth compact closed oriented round Riemannian \(S^4\),
with connection \(A_0\), curvature \(F_0\), negative Killing
pairing and native metric \(G=G_{A_0}\) of sectional curvature
\(1/2\). Write \(D_0\) for the product covariant derivative
with \(A_0\) on internal slots and the Levi–Civita connection of
\(G\) on base slots. All times \(\tau\) are native. Fix E112's
normal ball centered at \(p\), annular atoms \(a^{(r)}\), scale
ratio \(R>2\), and heat window endpoints \(\alpha,\beta\) with
\(R^2>\beta/\alpha\). Choose the fixed upper scale \(\sigma\)
small enough for the E112 and E116 estimates and
\[
    \beta r_1^2/4<\min\{\mathcal T/4,\tau_s\},
       \qquad r_j=\sigma R^{-j},\qquad \tau_s=\mathcal T/2,
 \tag{1}
\]
where \(\mathcal T\) is the fixed E42 native head time used by
E119 and \(\tau_s\) is the E50 splice. Decreasing \(\sigma\)
improves the geometric errors and the upper heat-time bound,
and the E112 off-scale estimates use the same fixed ratios.
The choices precede \(N,\delta\). Set
\[
 b_N=\sum_{j=1}^N a^{(r_j)},\qquad
 A_{\delta,N}=A_0+\delta b_N,\qquad 0<\delta\le\delta_* .
\]
Here \(\delta_*>0\) is a fixed threshold to be decreased below.
[E112, native windows][e112] · [E112/E114 assessment][a112] ·
[E116, support and scale][e116].

The initial values obey
\[
 \|A_{\delta,N}-A_0\|_\infty+
   \|F_{A_{\delta,N}}-F_0\|_\infty\le C\delta .
 \tag{2}
\]
With the true live metric and volume, for every fixed
\(1\le q<\infty\) one has
\[
   \|T(A_{\delta,N})\|_{(4,q);G_{A_{\delta,N}}}
         \asymp_q\delta N^{1/q},\qquad
   \|T(A_{\delta,N})\|_{(4,\infty);G_{A_{\delta,N}}}
         \asymp\delta .                                           \tag{3}
\]
The comparison constants are independent of \(N,\delta\).
These are static conclusions. **Assume the E119 weighted linear
and quadratic remainder estimates (1)** for the centered adjusted
pair solution map \(\mathsf S\). Then the actual original flow
from these data satisfies
\[
   cN\delta-CN\delta^2
     \le J(A_{\delta,N})<\infty,\qquad
   J(A_{\rm in})=\int_0^\infty
      \sup_{S^4}(|\nabla^AT|_{G_A}+|T|_{G_A}^2)\,d\tau .            \tag{4}
\]
The constants in the lower bound and the datum threshold are
independent of \(N,\delta\). Finiteness for each datum uses the
ordinary smooth global basin and stable-tail result.
[E119, stated premise][e119] · [E50, smooth basin][e50] ·
[E76, smooth tail][e76] · [E84, native budget][e84].

## Actual annular strain and live distributions

On the \(j\)-th annulus, write \(r=r_j\) and \(a=a^{(r)}\).
The E112 coordinate bounds, after fixed covariant conversion,
give \(|a|\le Cr\), \(|D_0a|\le C\) and
\(|D_0^2a|\le C/r\). They imply
\[
 |d_0a|\le C,\quad |D_0d_0a|\le C/r,\qquad
 |[a\wedge a]|\le Cr^2,\quad |D_0[a\wedge a]|\le Cr .
 \tag{5}
\]
The projection from \(D_0a\) to \(d_0a\) uses the fixed
torsion-free base derivative and is bounded. All these estimates
hold through the zero collars. The annuli are pairwise disjoint.
The exact curvature on each annulus satisfies
\[
 F_{A_{\delta,N}}=F_0+\zeta,\qquad
 \zeta=\delta d_0a+\tfrac{\delta^2}{2}[a\wedge a].
 \tag{6}
\]
Outside the annuli the connection is exactly \(A_0\).
Thus \(|\zeta|\le C\delta\), \(|D_0\zeta|\le C\delta/r\)
on the annulus, and (2) holds globally. Choose a fixed static
threshold so the curvature stays in a compact sub-tube of the
positive definite component of \(F_0\).
[E112, actual atom and derivative errors][e112].

In the tube, the trace-normalized wedge Gram endomorphism is
a smooth pointwise function \(Q(x,\zeta)\), with \(Q(x,0)=I\).
Set \(\mathfrak q=Q-I\) and write
\(\mathfrak q=L(x)\zeta+\mathcal R(x,\zeta)\), where \(L\)
is the curvature derivative of \(Q\) at \(F_0\).
On the fixed bundle,
\[
 |\mathcal R|\le C|\zeta|^2,\qquad
 |D_0\mathcal R|\le C(|\zeta||D_0\zeta|+|\zeta|^2).
\]
The first bound follows by Taylor integration in \(\zeta\).
The second follows by differentiating that identity in fixed
frames, with smooth fixed coefficient and connection terms.
Using (5)–(6) and \(q^{(r)}=L(x)d_0a^{(r)}\) gives
\[
 |\mathfrak q|\le C\delta,\qquad
 |D_0\mathfrak q-\delta D_0q^{(r)}|\le C\delta^2/r .
\]
For \(A=A_{\delta,N}\), the derivative of \(Q\) on the
endomorphism zero-form is
\(\nabla^A Q=D_0\mathfrak q+
[\operatorname{ad}(\delta a),\mathfrak q]\).
The commutator costs \(C\delta^2r\).
In \(T=\tfrac12(Q^{-1/2}\nabla^AQ\,Q^{-1/2})_0\),
both factors \(Q^{-1/2}\) differ from \(I\) by \(O(\delta)\),
and \(\nabla^AQ\) is at most \(C\delta/r\).
The linear tensor \(D_0q^{(r)}\) is trace-free, so
the trace-free projection leaves it fixed. With
\(T^{(r)}=\tfrac12D_0q^{(r)}\), this proves
\[
             |T(A_{\delta,N})-\delta T^{(r_j)}|_G
                      \le C\delta^2/r_j                           \tag{7}
\]
on every annulus. All tensors vanish where the connection
equals \(A_0\) in the collars and outside the annuli.
The bound does not use an evolution estimate.

The live metric is smooth in the curvature values in this
tube, by the positive curvature plane and its prescribed
wedge volume. In fixed norm, \(G_A-G=O(\delta)\), hence
\((1-C\delta)G\le G_A\le(1+C\delta)G\) after decreasing the
threshold. The four-dimensional determinant then gives
\(dV_{G_A}/dV_G=1+O(\delta)\). Those comparisons are uniform
in the annuli and across their collars. The internal pairing
is fixed. E116 supplies a positive-volume subannulus
\(B_{r_j}=\{u_-r_j<d_G(p,\cdot)<u_+r_j\}\) on which
\(|T^{(r_j)}|_G\ge L_*/r_j\); the full support upper bound
is \(U_*/r_j\). The scale in (1) can be chosen small enough
for the E116 lower bound. Decrease the fixed static threshold so
\(C\delta_*\le L_*/2\) in (7). Then for fixed \(l,u>0\)
the true \(g=|T(A_{\delta,N})|_{G_A}\) is at least
\(l\delta/r_j\) on \(B_{r_j}\), and at most \(u\delta/r_j\)
on the full annulus \(A_{r_j}\). The live volumes of the lower
and upper sets have respective bounds \(v r_j^4\) below
and \(V r_j^4\) above, using the actual volume comparisons.
[E116 (1)–(4)][e116] · [E116/E117 assessment][a116].

With \(m(\lambda)=\operatorname{Vol}_{G_A}\{g>\lambda\}\)
these pointwise statements give the strict distribution sandwich
\[
 v\sum_{j=1}^N r_j^4\,\mathbf1_{\{\lambda<l\delta/r_j\}}
 \ \le m(\lambda)\le\
 V\sum_{j=1}^N r_j^4\,\mathbf1_{\{\lambda<u\delta/r_j\}} .
 \tag{8}
\]
In the chosen Lorentz convention the \(q\)-th power for
finite \(q\) is \(4\int_0^\infty\lambda^{q-1}
m(\lambda)^{q/4}\,d\lambda\), and the weak norm is
\(\sup_{\lambda>0}\lambda m(\lambda)^{1/4}\).
Set \(u_j=u\delta/r_j,\ u_0=0\). On \([u_{j-1},u_j)\)
the upper sum in (8) is bounded by \(V r_j^4/(1-R^{-4})\).
Its contribution to the integral is bounded by a constant
times \(r_j^q(u_j^q-u_{j-1}^q)\le u^q\delta^q\). The weak
upper bound in each such band is \(C\delta\). Above \(u_N\)
the distribution vanishes. The lower bands
\([l\delta/(4r_j),l\delta/(2r_j)]\) are disjoint since \(R>2\).
Each has \(m(\lambda)\ge v r_j^4\) and gives a positive
constant times \(\delta^q\) to the integral. Evaluation at
the upper endpoint of any one gives the corresponding weak
lower bound. This proves (3), including the ordinary live
\(L^4\) norm at \(q=4\), with no summation of individual
atom norms in place of the distribution. [E116 (5)–(10)][e116].

## Conditional pair error and the full geometric jet

The actual centered initial pair is exactly
\[
 u_{\delta,N}=\delta v_N+\delta^2 w_N,\qquad
 v_N=(b_N,d_0b_N),\qquad
 w_N=(0,[b_N\wedge b_N]/2).
 \tag{9}
\]
The two sup norms of \(v_N,w_N\) are uniformly bounded by
disjointness and (5), in the E42 fixed norms. The E119 map
is defined on independent pairs, so its derivative may be
applied to \(w_N\) without requiring \(w_N\) itself to be
a tangent of the compatible graph. The full datum (9) is
compatible, and \(v_N\) is its tangent at zero. Choose
\(\delta_*\) below the E50 \(m=6\) smooth value-basin
threshold in (2). Under the E119 premise, decrease it
also to fit the common E119 pair ball in (9). This supplies
the global original flow for every \(N\) with a single
threshold, and identifies its adjusted head with
\(U_{\delta,N}=\mathsf S(u_{\delta,N})\).
[E50, fixed smooth value threshold][e50] · [E49/E52 assessment][a50].

For native \(0<\tau\le\mathcal T/4\), write
\(\|U\|_{2,\tau}=\sum_{k=0}^2\tau^{k/2}\|D^k U(\tau)\|_\infty\),
where \(D\) is the E119 fixed derivative. The two assumed
estimates give \(\|D_u\mathsf S(0)[h]\|_{2,\tau}\le C\|h\|_\infty\):
apply them to \(\varepsilon h\), divide by \(\varepsilon>0\),
and let \(\varepsilon\downarrow0\), with constants uniform
in \(\tau\). Put \(V_N=D_u\mathsf S(0)[v_N]\).
The exact difference decomposition is
\[
 U_{\delta,N}-\delta V_N
   =\big(\mathsf S(u_{\delta,N})
                    -D_u\mathsf S(0)[u_{\delta,N}]\big)
          +\delta^2 D_u\mathsf S(0)[w_N] .
\]
The E119 premise therefore gives
\[
 \|U_{\delta,N}\|_{2,\tau}\le C\delta,\quad
 \|V_N\|_{2,\tau}\le C,\quad
 \|U_{\delta,N}-\delta V_N\|_{2,\tau}\le C\delta^2.                \tag{10}
\]
All bounds are uniform in \(N,\delta,\tau\).
If \(D\) differs from \(D_0\), the difference of the first
derivatives is a fixed smooth zeroth-order operator. The
second derivatives differ by fixed first- and zeroth-order
operators, including any fixed Levi–Civita difference on
covector slots. The lower orders are absorbed using
\(\tau\le1\), so (10) holds with \(D_0\) as well.
[E119 (1), full derivative][e119].

To compute the geometric remainder, use \(U=(a,\zeta)\)
and reconstruct \(Q(x,U)\) and \(G(x,U)\) from \(F_0+\zeta\).
They are smooth on the fixed value tube, with \(Q(x,0)=I\)
and \(G(x,0)=G\). In fixed frames the chain rule for
\(D_0(Q-I)\) gives the derivative in \(U\) applied to
\(D_0U\), plus a smooth coefficient vanishing at \(U=0\).
The exact commutator with \(\operatorname{ad}(a)\) in
\(\nabla^A Q\) is a value term, so there are smooth
coefficient maps \(P,t_0\) with
\[
 T=P(x,U)D_0U+t_0(x,U),\qquad t_0(x,0)=0 .
\]
For \(\mathcal K(U)=\nabla^A T\) the full derivative in
fixed frames is
\[
 \mathcal K(U)_{ij}=(D_0T)_{ij}
     +[\operatorname{ad}(a_i),T_j]-C(U)^k{}_{ij}T_k ,
 \qquad C(U)=\nabla^{G(x,U)}-\nabla^G .
 \tag{11}
\]
The difference of Levi–Civita connections is precisely
\[
 C(U)^k{}_{ij}
 =\tfrac12 G(x,U)^{k\ell}
       \big((D_0)_iG(x,U)_{j\ell}+
            (D_0)_jG(x,U)_{i\ell}-
            (D_0)_\ell G(x,U)_{ij}\big).
\]
Here \(D_0\) on the metric acts by the fixed base connection.
This is affine in \(D_0U\), with zero constant term at
\(U=0\). Differentiating \(T\)'s coefficients and using
both corrections in (11) yields the exact degree form
\[
 \mathcal K(U)=M_2(x,U)D_0^2U+
   M_{11}(x,U)[D_0U,D_0U]+M_1(x,U)D_0U+M_0(x,U),
                 \qquad M_0(x,0)=0 .
\]
All coefficients are smooth on the fixed tube. This
formula applies to independent pairs on the tube and
coincides with the actual derivative for compatible pairs.
In the linearization \(\mathcal K_1\) the coefficients of
\(D_0^2U,D_0U\) are evaluated at zero, and the value term
is \(D_UM_0(x,0)[U]\). Both connection corrections in
(11) multiply the zero reference strain, and their
coefficients vanish at the reference. In particular
\(\mathcal K_1(U)=\tfrac12 D_0^2(L(x)\zeta)\) with the
full ordered Hessian. Taylor bounds give
\[
 |\mathcal K(U)-\mathcal K_1(U)|_G
 \le C\big(|U||D_0^2U|+|D_0U|^2+|U||D_0U|+|U|^2\big).
 \tag{12}
\]
This explicitly keeps the internal connection and the
moving base Levi–Civita contribution.
[E84, full covariant strain derivative][e84].

Apply (12) and (10) along the head. The linear term on
\(U_{\delta,N}-\delta V_N\) is bounded using all three
derivative orders in (10). Since \(\tau\le1\),
\[
 \|\mathcal K(U_{\delta,N})
            -\delta\mathcal K_1(V_N)\|_{\infty,G}
           \le C\delta^2/\tau,\qquad
 \|\mathcal K_1(V_N)\|_{\infty,G}\le C/\tau .
 \tag{13}
\]
The live metric has \(G(U_{\delta,N})-G=O(\delta)\)
uniformly by (10). For two-covector tensors the
pointwise norm changes by at most \(C\delta\) times the
fixed tensor norm. With the second estimate in (13)
this implies the full live norm comparison
\[
 \sup_x\big|
     |\mathcal K(U_{\delta,N})|_{G(U_{\delta,N})}
            -\delta|\mathcal K_1(V_N)|_G
         \big|\le C\delta^2/\tau .                                \tag{14}
\]
The comparison uses only values for the norm, while the
metric derivatives were already included in (11)–(13).

## Conditional signed window transfer

For each fixed \(N\), the derivative \(V_N\) has compatible
linearized curvature, by differentiating the compatible
pair curve at zero in E115. Its tangent initial connection
is \(b_N\); this is the E112 tangent with its factor
\(N^{-1/2}\) removed. At \(A_0\) the adjusted generator
vanishes. The differentiated correction is an orbit
tangent and \(DQ_{A_0}\) kills it by \(Q(g^*A_0)=I\).
The physical composition in the native clock is
\(-(4\mathcal L+12)\) on the defect, with
\(\mathcal L=D_0^*D_0\) on trace-free symmetric
endomorphisms. The actual derivative trace supplied in
E115 therefore gives
\[
 \mathcal K_1(V_N)(\tau)
   =e^{-12\tau}\sum_{j=1}^N
          D_0^2 H_{4\tau}(q^{(r_j)}/2),\qquad
 H_s=e^{-s\mathcal L}.
 \tag{15}
\]
Only this identification uses the fixed-\(N\) derivative
passage. All estimates at the scales use the uniform
E119 premise in (10).
[E115, reference orbit cancellation][e115] · [E115/E118 assessment][a115] ·
[E112 (2)–(3)][e112].

Let \(\mathcal P(W)=\langle W(e_1,e_1),M(p)\rangle\)
at the E112 center \(p\), with unit native \(e_1,M(p)\).
On \(I_j=[\alpha r_j^2/4,\beta r_j^2/4]\), its signed
lower bound before summing the windows is
\[
 \mathcal P(\mathcal K_1(V_N)(\tau,p))
   \ge e^{-12\tau}h_* r_j^{-2}/2\ge c_0 r_j^{-2},
       \qquad c_0=e^{-3\beta r_1^2}h_*/2>0 .
\]
The off-scale contributions in E112 were subtracted in
absolute value before this bound. Evaluating the live
tensor at \(p\), (14) and the signed projection give
\[
 \sup_{S^4}|\mathcal K(U_{\delta,N})(\tau)|_{G(U_{\delta,N})}
       \ge c_0\delta r_j^{-2}-C\delta^2/\tau,\qquad \tau\in I_j.
 \tag{16}
\]
The projection uses the fixed frame and is bounded by the
fixed norm. Equation (14) accounts for the live norm
before applying (16). Integrating the second term over
one window costs \(C\delta^2\log(\beta/\alpha)\) and the
first contributes \(c_0(\beta-\alpha)\delta/4\).
[E112 (9)–(12) and signed window bound][e112].

Each window lies in the original recovered head by (1).
By E50, at that time the original slice is an exact
orientation-preserving smooth bundle pullback of the
adjusted slice. E84 identifies the full strain derivative
by naturality, with both base slots and with the live
metric pulled back. Spatial suprema thus agree at that
same native time, with no derivative estimate on the
recovery. The windows are disjoint and the squared strain
term in the budget is nonnegative. Summing (16) yields
the conditional lower bound in (4). No difference of
integrals of two global suprema was used.
[E50 (8)–(10)][e50] · [E84 (3)–(5)][e84].

## Finiteness and prospective consequences

For each finite \(N\) and admitted \(\delta\), smoothness
through zero and the exact smooth original splice give
finite budget on compact time intervals. For the stable
adjusted tail, E76 (10) and the fixed Sobolev embedding give
future exponential convergence in \(C^3\) of its connection
and in \(C^2\) of its curvature, by the curvature identity.
The constants can depend on this smooth datum. On a late
tail the metric and volume are uniformly comparable to the
round ones. The formulas for \(T,\mathcal K\) used above and
their vanishing at the reference give exponential sup decay
of both quantities there. Exact per-slice naturality also
transfers the tail suprema to the original flow. This gives
finite \(J\) for every admitted datum using E50/E76 alone.
[E76 (10), (15)–(16)][e76] · [E76/E77 assessment][a76] ·
[E84, native budget][e84].

Under the E119 premise, along \(\delta=N^{-1/2}\) the value
differences are \(O(N^{-1/2})\), the initial live \(L^4\)
strain is comparable to \(N^{-1/4}\), and \(J\ge c\sqrt N-C\).
For each fixed \(1<q\le\infty\), set \(1/\infty=0\) and
take \(\max\{1/q,1/4\}<a<1\), \(\delta=N^{-a}\).
Then the initial live \(L^{4,q}\) and \(L^4\) strains both
tend to zero, while the conditional bound is
\(J\ge cN^{1-a}-CN^{1-2a}\to\infty\).
The same sequences have \(L^{4,1}\) strain of size
\(\delta N\), outside any sufficiently small such endpoint
ball for large \(N\). These are conditional family
consequences within the established round value basin.
They do not assert blowup of any single flow, failure of
the \(L^{4,1}\) endpoint, or a construction on another
smooth homotopy sphere.

[req]: ../research-progress/handoffs/SP4-CME-E123_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E123_RETURN_v1.md
[b64]: ../brainstorm/notes/B64_CONDITIONAL_NONLINEAR_MULTISCALE_TRANSFER_20261122.md
[e112]: 112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e115]: 115_NONLINEAR_LINEAR_BUDGET_TEST_20261122.md
[e116]: 116_ROUND_ANNULAR_LORENTZ_NORMS_20261122.md
[e119]: 119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e76]: 76_HIGH_ORDER_STABLE_LIMIT_20261122.md
[e84]: 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[a50]: ../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[a76]: ../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
[a112]: ../reviews/E112_E114_ROUND_MULTISCALE_ASSESSMENT_20261122.md
[a115]: ../reviews/E115_E118_NONLINEAR_LINEAR_BUDGET_ASSESSMENT_20261122.md
[a116]: ../reviews/E116_E117_LORENTZ_THRESHOLD_ASSESSMENT_20261122.md
