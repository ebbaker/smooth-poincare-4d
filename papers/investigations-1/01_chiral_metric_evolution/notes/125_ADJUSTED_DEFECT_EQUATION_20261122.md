# SP4-CME-E125 — Exact adjusted defect evolution and pair derivatives

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E02A and E104 among the
frozen inputs, and the earlier E01A compatibility audit. This is an
adjusted-equation derivation using the assessed original identities.
The nine frozen input hashes matched. No new primary text was
inspected. [Request][req] · [B65][b65] · [Return][ret].

## Setting and result

Use the positive perfect chiral \(\mathrm{SO}(3)\) reference \(A_0\)
on the smooth closed oriented round Riemannian \(S^4\), curvature
\(F_0\), negative Killing internal pairing, and native reference
metric \(G\) of sectional curvature \(1/2\). Let \(D_0\) be the
fixed \(A_0,G\) product covariant derivative on internal and base
slots. Use native time \(\tau\). Consider a supplied smooth
compatible solution of the E36/E42 head with
\[
 a=A-A_0,\qquad F=F_A,\qquad \zeta=F-F_0,\qquad
 U=(a,\zeta),\qquad q=Q(F)-I .
\]
All coefficient bounds below are on a fixed compact positive
value tube around \(U=0\). The notation \(g=g(F)\) refers to the
current native reconstructed metric, \(\mu=dV_g\) to its oriented
volume, and \(\nabla\) to the \(A,g\) product derivative. No
derivative smallness is assumed.
[E36, conventions and graph][e36] · [E42, compatible passage][e42].

The exact equation admits the proposed first-pair-derivative
structure, with a stronger affine bound on its lower coefficient
dependence:
\[
 \begin{split}
 \partial_\tau q
 &= g^{ij}\mathscr L_Q\big((D_0^2q)_{ij}\big)-12q\\
 &\quad+\big(\mathcal B_0^i(x,U)+\mathcal B_1^i(x,U)[D_0U]\big)
                      D_{0,i}q\\
 &\quad+\big(\mathcal C_0(x,U)+\mathcal C_1(x,U)[D_0U]\big)q .
 \end{split}                                                       \tag{1}
\]
Here the coefficient maps are smooth on the fixed value tube,
with \(\mathcal B_0^i(x,0)=\mathcal C_0(x,0)=0\). Terms
quadratic in \(D_0U\) multiplying \(q\) are unnecessary in this
allocation. No second pair derivative occurs outside \(D_0^2q\).
The exact equation and the cancellations follow below.

## Native conversion and physical part

In E04A/E04B the internal bracket-orthonormal basis has negative
Killing metric \(2\delta\). Native orthonormal curvature components
are \(\sqrt2\) times the manuscript components. The curvature volume
\(\frac13\sum_iF_i\wedge F_i\) is consequently doubled, and trace
division leaves \(Q\) unchanged. With \(c=2K\), one has
\[
 g=c\widehat g,\qquad \tau=ct,\qquad
 \mu_{\rm native}=2\mu_{\rm manuscript}
        =4K^2dV_{\widehat g}=dV_g.
\]
The constant base metric scale preserves the spatial connections.
The codifferential on two-forms scales by \(c^{-1}\), and uniform
internal metric scaling leaves its fiber action unchanged.
Set \(H=q-|q|^2I/6\). The E36 factor
\(B(F)=4Q-\frac23\operatorname{tr}(Q^2)I=2I+4H\).
Bianchi and live self-duality give \(d_A^{*g}F=0\), so
\(v_{\rm F}=-d_A^{*g}(B(F)F)=-4d_A^{*g}(HF)\).
This equals \(c^{-1}\) times the manuscript velocity, confirming
the clock. In the E04A equation all displayed first and second
derivative terms have one inverse metric contraction, which
acquires exactly the time conversion factor. The reaction
\(-24K\sqrt{\det Q}\,q\) becomes \(-12\sqrt{\det Q}\,q\).
[E04A, (1)–(6)][e04a] · [E04B, symbol][e04b] · [E36 (2)][e36].

For an exact first-jet expression set \(X_i=\nabla_i Q\).
In a native orthonormal internal frame define the skew one-form
endomorphism \(\Xi\) by
\[
 Y_{ab,i}=4\langle\nabla_i F_a,F_b\rangle_g,\qquad
 \Xi_i=Y_i-2X_i .
 \tag{2}
\]
The inner product here contracts the ordinary two-form slots
of the indicated internal components. In fact
\(\langle F_a,F_b\rangle_g=Q_{ab}\) by self-duality and the
native volume equality. Metricity gives \(Y_i+Y_i^\top=4X_i\).
The tensor \(Y\) is exactly E04A's expression
\(K^{-2}(\nabla F_{a,kl})F_{b,kl}\) with the original
orthonormal two-form contraction. Indeed two base contractions
scale by \(c^{-2}\), the two internal-component changes give
factor \(2\), and the ordinary norm has factor \(1/2\).
Multiplication by four yields \(K^{-2}\) times the old sum.
This comparison treats \(Y\) as a covector in its derivative
slot, prior to taking any trace with the metric. Equivalently,
with \(S=Q^{1/2}\) and \(B_i^{\rm mis}=\operatorname{ad}
(A-\Gamma^+_A)_i\) for the live chiral connection,
\(\Xi_i=2[\nabla_i S,S]+4S B_i^{\rm mis}S\), as in E04A.
Formula (2) gives the order directly from the curvature pair.

Write \(\mathscr L_Q(Z)=2(QZ+ZQ)-\frac43\operatorname{tr}(QZ)Q\)
on symmetric trace-free matrices, and
\[
 \mathcal N_Q(X,\Xi)
 =g^{ij}\left(
      4X_iX_j-\tfrac43\operatorname{tr}(QX_i)X_j
      -\tfrac43\operatorname{tr}(X_iX_j)Q+[X_i,\Xi_j]\right).
 \tag{3}
\]
These are all the physical first-derivative products. The
unadjusted part of the \(q\) equation is
\(\mathscr L_Q(\nabla^i\nabla_iq)-12\sqrt{\det Q}\,q+
\mathcal N_Q(X,\Xi)\).
In its derivation \(d_AF=0\) first removes the adjoint of \(F\)
in the velocity and replaces the antisymmetrized derivative of
\(F\) in \(d_Av_{\rm F}\) by the Bianchi term. The
antisymmetric self-dual contraction of \(\nabla^2 H\)
then uses the covariant commutator on an endomorphism zero-form.
Torsion-freeness removes the base Christoffel antisymmetrization,
and \([\nabla_i,\nabla_j]H=[\operatorname{ad}F_{ij},Q]\)
uses actual curvature compatibility. This is the algebraic
curvature term in E04A, producing the reaction above.
The remaining trace Hessian is precisely
\(\mathscr L_Q(\nabla^i\nabla_iq)\). The physical volume change
is zero by E04A/E04C.
[E04A, trace and reaction][e04a] · [E04C, volume][e04c] ·
[Nonlinear assessment][a02].

## Actual head gauge, top-degree transport and signs

On the compatible graph \(C=F-F_A=0\), and \(d_AF=0\)
eliminates the Bianchi completion. The E36 auxiliary two-form,
vertical parameter and base velocity are
\[
 \beta_{\rm h}=\zeta+\tfrac12[a\wedge a]=d_Aa,\qquad
 \phi=d_A^{*G}a,\qquad u=-S_F^*d_A^{*g}\beta_{\rm h},
                 \quad S_F(u)=\iota_uF .
 \tag{4}
\]
In particular the fixed metric \(G\) occurs in the vertical
adjoint and the live metric \(g\) in the other adjoints.
The adjusted connection equation is
\[
             A_\tau=v_{\rm F}-d_A\phi+\iota_uF.                   \tag{5}
\]
The horizontal sign is already part of the definition of \(u\).
For \(\phi\), the contraction of \([a_i,a_j]\) with
\(G^{ij}\) vanishes, so \(\phi=d_0^{*G}a\) exactly in this
setting. This is the E36 head gauge. [E36 (1), (5)–(6)][e36] ·
[Smooth pair comparison][e60] · [E36 assessment][a36].

Put \(\mathsf W=(F_a\wedge F_b)_{ab}=\mu Q\), a matrix of
top-degree forms. For any velocity the quotient rule reads
\[
 Q_\tau=\mu^{-1}\mathsf W_\tau-(\mu_\tau/\mu)Q,\qquad
 \mu_\tau=\tfrac13\operatorname{tr}\mathsf W_\tau .
 \tag{6}
\]
The vertical velocity \(-d_A\phi\) gives curvature velocity
\(-d_A^2\phi=-[F,\phi]=[\phi,F]\). Acting on each slot of
\(\mathsf W\) therefore gives \([\operatorname{ad}\phi,\mathsf W]\),
using skew-adjointness. Its trace is zero, so its contribution
to \(q_\tau\) has the plus sign
\([\operatorname{ad}\phi,q]\) and its contribution to
\(\mu_\tau\) vanishes.

The horizontal velocity \(\iota_uF\) gives
\(d_A\iota_uF=(d_A\iota_u+\iota_u d_A)F\) by Bianchi.
In a local frame the covariant Cartan expression equals
\(\mathcal L_uF+[A(u),F]\). This follows directly by expanding
\(d_A=d+[A\wedge\cdot]\) in the Cartan sum. On the top-degree
matrix \(\mathsf W\) it thus yields
\[
 \mathsf W_\tau\big|_{\rm hor}
   =\mathcal L_u(\mu Q)+[\operatorname{ad}A(u),\mu Q],\qquad
 \mu_\tau\big|_{\rm hor}=\mathcal L_u\mu .
 \tag{7}
\]
In local coordinates the part of \(\mathcal L_u\mathsf W\)
that differentiates \(u\) acts by the trace on its top-degree
slots. Equivalently the product rule gives
\(\mathcal L_u(\mu Q)=\mu\,u(Q)+Q\mathcal L_u\mu\) for the
matrix coefficients in the fixed local frame. Thus the full
\(Q\mathcal L_u\mu\) contribution, including every derivative
of \(u\), cancels in (6). The remaining plus transport term is
\(u(q)+[\operatorname{ad}A(u),q]=\nabla_u q\).
This calculation uses the time-dependent infinitesimal velocity
at each slice, with no time derivative of the parameter added.
[E04C, gauge dependence][e04c] · [E36, actual compatible velocity][e36].

Combining the three parts gives the exact invariant equations
\[
 \boxed{\begin{aligned}
 q_\tau={}&\mathscr L_Q(\nabla^i\nabla_iq)
          -12\sqrt{\det Q}\,q+\mathcal N_Q(X,\Xi)
          +\nabla_u q+[\operatorname{ad}\phi,q],\\
 \mu_\tau={}&\mathcal L_u\mu=(\operatorname{div}_g u)\,\mu,
       \qquad \operatorname{tr}_g g_\tau=2\operatorname{div}_g u .
 \end{aligned}}                                                  \tag{8}
\]
In particular the adjusted density is advected. Its integral
on the closed base is fixed. The pointwise physical volume
preservation does not give pointwise preservation in this
adjusted identification. Indeed at \(A_0\) the linearized
base velocity in a compatible connection direction \(b\) is
\(-S_0^*d_0^{*G}d_0 b\). At a nonzero covector \(\xi\) take
the one-form amplitude \(b=S_0(\xi^\sharp)\).
Its contraction with \(\xi^\sharp\) is zero, so the symbol
of \(d_0^{*G}d_0\) is \(|\xi|_G^2 b\) on this amplitude.
In the native round geometry \(S_0^*S_0=\tfrac32 I\) because
each of the three norm-one self-dual curvature forms has
squared contraction \(|v|_G^2/2\) with \(v\). Hence the
divergence symbol in this direction is
\(-\tfrac32 i|\xi|_G^4\), which is nonzero. A smooth localized
cubic jet of the connection variation realizes this symbol,
with actual compatible curvature on the varied connections.
This shows that the base velocity need not be divergence-free.

## Fixed-reference inventory

Let \(\mathcal A_i=\operatorname{ad}(a_i)\) and let
\(C^k{}_{ij}=(\nabla^g-\nabla^G)^k{}_{ij}\) in the rest of this
section. This \(C\) is the Levi–Civita difference. The constraint
defect \(F-F_A\) is zero throughout. Since the live metric is
an algebraic smooth value map of \(\zeta\) in the tube,
\[
 C^k{}_{ij}
 =\tfrac12g^{k\ell}\big(
       (D_0)_i g_{j\ell}+(D_0)_j g_{i\ell}
                       -(D_0)_\ell g_{ij}\big)
 \tag{9}
\]
is affine in \(D_0\zeta\) with smooth value coefficients.
The trace-free endomorphism zero-form has
\(X_i=D_{0,i}q+[\mathcal A_i,q]\). Its full derivative is
\[
 \begin{split}
 (\nabla^2q)_{ij}={}&(D_0^2q)_{ij}
  +[\mathcal A_j,D_{0,i}q]+[\mathcal A_i,D_{0,j}q]
  +[\operatorname{ad}((D_0a)_{ij}),q]\\
 &+[\mathcal A_i,[\mathcal A_j,q]]-C^k{}_{ij}X_k .
 \end{split}                                                       \tag{10}
\]
The fixed derivative on \(a\) in (10) includes its covector
slot. This is obtained by differentiating \(X_j\) with the
reference product connection, then changing the internal
connection on that result and the base connection on its
one-form slot. Only \(D_0a\) and the first metric derivative
appear among the differentiated pair coefficients. The
principal coefficient in (8) is therefore exactly
\(g^{ij}\mathscr L_Q\) on the full fixed Hessian, with symbol
\(-|\xi|_g^2\mathscr L_Q\) in the \(i\xi\) convention.
E04B's positivity is uniform in this tube. The possible
antisymmetric fixed Hessian part is killed by \(g^{ij}=g^{ji}\).
[E04B, spectrum][e04b] · [E36/E60, pair jet maps][e60].

Here is the rest of the allocation in fixed derivatives.

- The four contractions in (3) are exactly \(XX\), the product
  \(\operatorname{tr}(QX)X\), the Gram trace
  \(\operatorname{tr}(XX)Q\), and the commutator \( [X,\Xi]\).
  In each bilinear contraction retain one \(X=D_0q+[\mathcal A,q]\)
  as the explicit defect factor. The other \(X\) is affine in
  \(D_0\zeta\) with smooth value coefficients, because
  \(q=Q(x,F_0+\zeta)-I\). In (2) the derivative of \(F\) is the
  fixed derivative plus the internal action of \(a\) and the
  two base-slot actions of (9). Therefore \(\Xi\) is affine
  in the first pair derivatives with smooth value coefficients.
  This separates the products into coefficients even when
  keeping their full chiral connection dependence.
- The reaction is exactly \(-12\sqrt{\det Q}\,q\), so
  subtracting \(-12q\) leaves a smooth value coefficient
  vanishing at \(Q=I\). The fixed adjoint in (4) uses
  \(D_0a\) linearly, yielding the first-jet commutator
  \([\operatorname{ad}\phi,q]\). Its apparent second jets
  in \(d_A(d_A\phi)\) have already canceled by the curvature
  identity leading to (6).
- The base velocity in (4) is affine in \(D_0U\).
  In detail \(D_0\beta_{\rm h}=D_0\zeta+
  D_0[a\wedge a]/2\) has only first derivatives, and the
  codifferential adds the \(a\) action on its internal
  slot and the \(C\) actions on its two form slots.
  The adjoint \(S_F^*\) is algebraic in \(F,g\).
  One may also use \(d_A^{*g}F=0\) to rewrite the same
  codifferential as \(d_A^{*g}(-F_0+[a\wedge a]/2)\).
  Either expression has only first pair jets. All terms
  with \(D_0u\), hence with apparent second pair derivatives
  from the metric, \(D_0\beta_{\rm h}\) or its differentiated
  coefficients, were removed from \(q_\tau\) by (7).
  The surviving \(u^i X_i\) thus has precisely the affine
  coefficient dependence stated in (1).
- The constraint correction and Bianchi completion in E36
  vanish as differentiated expressions along the compatible
  solution. There is no additional term from a time
  derivative of the live metric or its Levi–Civita connection,
  because the normalized defect is the quotient of the two
  wedge densities in (6).

This is an allocation on the actual graph. In particular
\(D_0^2q\) itself uses the chain rule on \(Q(x,F_0+\zeta)\):
its second curvature derivative term is \(D_\zeta Q[D_0^2\zeta]\)
and it also contains first-jet products from the value map.
Those terms are part of the stated principal defect Hessian.
The calculation does not vary \(q\) jets independently of
\(\zeta\) jets. For the physical antisymmetric term, the vertical
term and the base transport, the cancellations used the actual
curvature identity and Bianchi as specified above.

The connection difference (9), \(\Xi\), \(X\), and both gauge
parameters vanish at the stationary reference. Their pointwise
sizes are bounded by \(C(|U|+|D_0U|)\) in the indicated value
tube. This follows from the smooth affine formulas and
\(\nabla^{A_0,G}F_0=0\) at the round reference. Together (8)–(10)
and the allocation give (1), with a lower-order remainder
after retaining \(-12q\) bounded by
\[
           C(|U|+|D_0U|)(|D_0q|+|q|).
 \tag{11}
\]
The principal coefficient differs from \(4G^{ij}\mathrm{Id}\)
by \(O(|U|)\). In fixed divergence form, differentiating
\(g^{ij}\mathscr L_Q\) introduces only another affine
first-pair-derivative coefficient times \(D_0q\).

On a spatially perfect field \(q\equiv0\), every term in
the first equation of (8) vanishes. More generally, along
a supplied smooth head one can regard the coefficients of
(1) as fixed smooth coefficients of a homogeneous linear
equation for its defect. On any compact smooth time interval,
the positive principal symbol here comes from the pointwise
positive product \(g^{ij}\mathscr L_Q\), and the lower
coefficients and first spatial derivatives of the principal
coefficient are bounded for that path. In the fixed
\(L^2(G)\) pairing, integration by parts and a Young inequality
give \(\frac{d}{d\tau}\|q\|_2^2\le C_{\rm path}\|q\|_2^2\).
Thus a perfect compatible initial field stays perfect on
that interval. The native round linearization is
\(4\Delta_0 q-12q\), since all coefficients of (11) vanish
at the reference.

This derivative inventory uses E102 and E104 only for the
scope and motivation of B65. Its structural conclusion gives
no function-space estimate or defect-only endpoint theorem.
[E102, static defect][e102] · [E104, integrated energy][e104].

[req]: ../research-progress/handoffs/SP4-CME-E125_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E125_RETURN_v1.md
[b65]: ../brainstorm/notes/B65_DEFECT_ONLY_ENDPOINT_ROUTE_20261122.md
[e04a]: 04A_NONLINEAR_Q_20261122.md
[e04b]: 04B_NONLINEAR_Q_20261122.md
[e04c]: 04C_VOLUME_AND_JETS_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e60]: 60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md
[e102]: 102_STRAIN_DEFECT_PINCHING_20261122.md
[e104]: 104_GLOBAL_VALUE_BASIN_STRAIN_ENERGY_20261122.md
[a02]: ../reviews/E02_NONLINEAR_ASSESSMENT_20261122.md
[a36]: ../reviews/E36_COUPLED_SYSTEM_ASSESSMENT_20261122.md
