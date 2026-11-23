# SP4-CME-E106 — Audit of the Coulomb curvature oscillation example

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored the E95 and E98
inputs, and also the E53 and E59 method inputs. I did not author
E103. This audit recomputes E103's new oscillation lower bound.
The frozen hashes in the [request][req] matched. No new primary
source was inspected or imported. [B58][b58]. [Return][ret].

**Disposition.** E103 passes. For each fixed \(M_*>0\),
the lower bound \(c n^{1/4}\) holds for all sufficiently
large dyadic \(n\) and every smooth internal gauge with
\(\|u_n-I\|_{C^1}\le M_*n^{-1/4}\).
The curvature bound is for the original fixed localized norm.
The smallness threshold in the large-\(n\) assertion can depend
on \(M_*\). E98 and E99 are now accepted after E101, so the
Coulomb application uses assessed inputs. Its placement
limitation is exactly the one stated in E103. [E103][e103].
[E101][e101]. [Lead assessment][assess].

## Actual round pullback and leading coefficient

Work on the fixed smooth oriented round Riemannian \(S^4\),
the positive perfect chiral \(SO(3)\) connection \(A_0\),
the native round metric \(g_0\), and the fixed internal
negative-Killing pairing. Put
\(\epsilon_n=n^{-1/4}\), \(\delta_n=\epsilon_n/n\), with
\(n\) dyadic. In the E95 type of principal trivialization,
\(V_n=\delta_n\rho\sin(nx^1)e_2\) has compact support
inside the chart. Its coordinate displacement for
\(|t|\le1\) is at most \(\delta_n\), and
\(\|DV_n\|_\infty\le C\epsilon_n\).
The flow's first variational equation gives
\(\|D\psi_{n,t}-I\|_\infty\le e^{C|t|\epsilon_n}-1\).
The cutoffs are fixed. On the smaller cube the trajectory
stays where \(\rho=1\), with \(x^1,x^3,x^4\) constant,
so at time one
\[
 \psi_n(x)=x+\delta_n\sin(nx^1)e_2,\qquad
 D\psi_n(x)=I+\epsilon_n\cos(nx^1)e_2\otimes dx^1 .
\]
Exterior and collar points are fixed by the global
diffeomorphism. Thus \(G_n(x,h)=(\psi_n(x),h)\) lifts
over the chart and glues by identity to a principal
automorphism, with the same construction using
\(\psi_n^{-1}\) for its inverse. The base map preserves
orientation by the flow isotopy. [E103 (1)][e103].
[E95, lift][e95]. [E96, lift audit][e96].

For \(A_n=G_n^*A_0\), this is actual curvature
\(F_{A_n}=G_n^*F_0\). In the chosen frame the local
potential and curvature have pullback expressions with
one and two \(D\psi_n\) slots, respectively. In either
case the change from composition of the fixed
coefficients is \(O(\delta_n)\), and the change of
slots is \(O(\epsilon_n)\). The connection difference
has no affine overlap error, since that term cancels
between the two potentials. Hence
\(\|a_n\|_\infty+\|\beta_n\|_\infty\le C\epsilon_n\)
in fixed global norms. The wedge Gram identity of the
reference pulls back to \(I\) times
\(\psi_n^*dV_{g_0}\), giving \(Q(A_n)=I\), the native
pullback metric, and \(T(A_n)=0\).
Internal gauge conjugation is orthogonal and therefore
leaves this identity and zero strain intact.
[E103 (2)][e103].

Independently inserting the exact shear derivative in
both arguments of \(F_0(\psi_n(x))\) gives the two-form
correction
\(\epsilon_n\cos(nx^1)\,dx^1\wedge
\iota_{e_2}F_0(\psi_n(x))\) in the fixed arrays.
The term quadratic in the rank-one shear has both
arguments proportional to \(e_2\) and is zero.
Put \(H=dx^1\wedge\iota_{e_2}F_0\). On the inner cube,
\[
 F_{A_n}=F_0+\epsilon_n\cos(nx^1)H+r_n,\qquad
 \|r_n\|_\infty\le C(\delta_n+\epsilon_n\delta_n)
               \le C\epsilon_n/n .
\]
This uses only the first derivatives of the fixed
arrays \(F_0,H\). At the center
\(H(e_1,e_3)=F_0(e_2,e_3)\ne0\) as an internal
vector. Indeed the curvature components form a basis
of \(\Lambda^+\), and
\(dx^2\wedge dx^3+*(dx^2\wedge dx^3)\) is self-dual
and evaluates to \(1\) on \((e_2,e_3)\) in the
orthonormal coordinates there. Choose a fixed real
scalar component \(\lambda\) detecting this value, a
rectangle \(R\) on which \(|\lambda H|\ge h_*>0\),
and a smooth cutoff \(\theta\) supported strictly in
the inner cube and equal to one on \(R\).
[E103 (3) and window construction][e103].

## Exact dyadic block and gauge errors

Let \(L_n=\operatorname{Ad}_{u_n}\) for gauges with
\(\|u_n-I\|_{C^1}\le M_*\epsilon_n\). In local frames
\(\|L_n-I\|_{C^1}\le C_{M_*}\epsilon_n\), by the
conjugation product rule and fixed connection
coefficients multiplying \(u_n-I\). All derivatives
here are at most first order. In the window coordinates
\(y=x/(2\pi)\) the phase \(nx^1\) is \(2\pi n y^1\).
The fixed chart size and supported cutoff permit smooth
zero extension to the unit torus. Retaining the
scalar projection on the \(x\) coefficient array gives
\[
 z_n=\epsilon_n p_n c_n+q_n+e_n,\qquad
 c_n=\cos(2\pi n y^1),
\]
where \(p_n=\theta\lambda(L_nH)\),
\(q_n=\theta\lambda((L_n-I)F_0)\),
\(e_n=\theta\lambda(L_n r_n)\), with the fixed coordinate
conversion understood. Thus \(p_n\) has uniformly bounded
\(C^1\) norm for fixed \(M_*\), differs from the reference
window amplitude by \(O_{M_*}(\epsilon_n)\) in sup norm,
and \(\|q_n\|_{C^1}=O_{M_*}(\epsilon_n)\),
\(\|e_n\|_8=O(\epsilon_n/n)\). The residual \(r_n\)
uses only its value bound. On \(R/(2\pi)\) the amplitude
has modulus at least \(h_*/2\) for large \(n\).
The first-coordinate interval contains whole carrier
periods with total length at least half its length,
for large \(n\). Each period has positive average of
\(|c_n|^8\). Integrating on the rectangle therefore
gives \(\|p_n c_n\|_8\ge c_0>0\), with \(c_0\) fixed.
[E103 (4)–(6)][e103].

For \(n=2^j\), E53's symbol at the actual two modes
\(\pm n e_1\) is
\(\chi(\pm e_1)-\chi(\pm2e_1)=1\).
Thus \(\Delta_j c_n=c_n\) for the genuine block
and the proof needs no assertion of a plateau near
those frequencies. Its kernel \(K_j\) is the
periodization of \(n^4\check\varphi(ny)\).
The torus distance to zero is bounded by \(|y+\ell|\)
for every integer lift \(y+\ell\), so unfolding gives
\[
 \int_{\mathbb T^4}d_{\mathbb T}(y,0)|K_j(y)|\,dy
    \le n^{-1}\int_{\mathbb R^4}|z|\,|\check\varphi(z)|\,dz
    \le C/n .
\]
The last moment is finite since \(\varphi\) is smooth
with compact annular support. The same unfolding
gives the uniform \(L^1\) bound. The kernel has
mean zero since its symbol vanishes at frequency zero.
[E53, dyadic partition and periodization][e53].
[E103 (7)][e103].

In the carrier term use the exact commutator integral
\[
 \Delta_j(p_nc_n)-p_nc_n
   =\int_{\mathbb T^4}K_j(y)
               (p_n(\,\cdot-y)-p_n(\,\cdot\,))c_n(\,\cdot-y)\,dy .
\]
The first absolute moment and the Lipschitz bound
give \(C_{M_*}/n\) even in \(L^\infty\).
In the reference term \(q_n\), subtract its value at
the output point using the mean-zero kernel.
This gives \(C_{M_*}\epsilon_n/n\) in \(L^8\).
The residual uses \(C\|e_n\|_8\le C\epsilon_n/n\).
Including the leading prefactor \(\epsilon_n\) gives
the total error \(C_{M_*}\epsilon_n/n\) and hence
\[
 \|\Delta_j z_n\|_8\ge c_0\epsilon_n-C_{M_*}\epsilon_n/n
                   \ge (c_0/2)\epsilon_n
\]
for sufficiently large \(n\), with the threshold depending
on the fixed \(M_*\). It follows that the window
\(B^{1/2}_{8,1}\) norm is bounded below by
\((c_0/2)\epsilon_n\sqrt n\).
[E103 (8)][e103].

## Comparison to the original localized norm

The window does not replace the prescribed atlas.
For each original partition piece \(v_\gamma\) on its
unit torus, reconstruct it with the fixed inner
cutoff which is one near the original support.
Multiplying by the new window and taking the scalar
component gives a finite sum of operators
\(\mathcal T_\gamma v_\gamma=J_\gamma(v_\gamma\circ\Phi_\gamma)\).
Here \(J_\gamma\) consists of the two fixed cutoffs,
frame transitions and the scalar projection, and
its support is compact inside the overlap. The
transition \(\Phi_\gamma\) includes the fixed coordinate
rescaling and is a diffeomorphism there with fixed
Jacobian bounds. Zero extension causes no seam term.
Thus \(\mathcal T_\gamma\) is bounded on \(L^8\) by
change of variables and on \(W^{4,8}\) by the chain
rule with fixed coefficients.
[E59, localized pieces and reconstruction][e59].
[E57, fixed overlap comparison][e57].

For an input block \(v_\ell=\Delta_\ell v\),
the E53 enlarged cutoff and derivative kernels give
\(\|v_\ell\|_{W^{4,8}}\le C2^{4\ell}\|v_\ell\|_8\).
For \(k\ge1\) apply the annular multiplier with
rescaled symbol \(\varphi(\xi)/(2\pi|\xi|)^4\)
to \((-\Delta)^2w\). Its kernel is uniformly \(L^1\)
and the factor is \(2^{-4k}\), giving
\(\|\Delta_k w\|_8\le C2^{-4k}\|w\|_{W^{4,8}}\).
The uniform \(L^8\) block bound also applies, so
\[
 \|\Delta_k\mathcal T_\gamma v_\ell\|_8
 \le C\min(1,2^{4(\ell-k)})\|v_\ell\|_8,\qquad k\ge1 .
\]
For \(k=0\) use the \(L^8\) bound. Summing with weight
\(2^{k/2}\) gives \(C2^{\ell/2}\|v_\ell\|_8\):
the low side is geometric up to \(k=\ell\), and the
tail uses \(2^{-7(k-\ell)/2}\).
Sum input blocks and the finite atlas to obtain the
bounded window operator in the prescribed norm.
The fourth derivatives here concern a fixed
coordinate operator applied to single input blocks.
They place no higher derivative requirement on the
varying gauge. Hence the curvature part of the
original fixed localized norm is at least
\(c\,\epsilon_n\sqrt n=c n^{1/4}\).
[E53, block kernels][e53]. [E103 (9)][e103].

## Assessed Coulomb application and scope

For finite reference volume \(V\), the Lorentz layer
formula gives \(\|a_n\|_{4,1}\le4V^{1/4}\|a_n\|_\infty\)
and \(\|w\|_4\le\|w\|_{4,1}/4\) by Minkowski on the
same layers. Thus E98 applies for large \(n\) and yields
smooth internal gauges \(u_n\) and relative Coulomb
connections \(b_n\) with
\(\|u_n-I\|_\infty+\|b_n\|_4=O(\epsilon_n)\)
and \(d_0^*b_n=0\).
The transformed curvature difference is
\(L_n\beta_n+(L_n-I)F_0\), which is \(O(\epsilon_n)\)
in sup norm using only the gauge value for the second
term. This supplies E99's small input and gives
\(\|b_n\|_{W^{1,8}}+\|b_n\|_{C^{0,1/2}}=O(\epsilon_n)\).
Now the exact gauge equation gives
\(D_0u_n=u_na_n-b_nu_n\), so together with the sup
bounds it supplies a single \(C^1\) constant
\(M_*\) independent of \(n\). This is obtained before
applying the lower bound, and does not require a
curvature derivative estimate.
[E98 (1)][e98]. [E99 (1)][e99]. [E101][e101].
[Lead assessment][assess].

The connection part is small in the fixed critical norm:
on each original localized piece the low block costs
\(\|v\|_8\) and the high inverse derivative costs
\(C2^{-j}\|\partial v\|_8\). The weighted high sum
converges, so \(W^{1,8}\) bounds the localized
\(B^{1/2}_{8,1}\) norm, including fixed cutoff and frame
terms. Thus \(\|b_n\|_{\mathcal B^{1/2}}=O(\epsilon_n)\)
while the curvature part grows. The connections are
smooth, exact internal Coulomb, and small in connection
and curvature values, with zero intrinsic strain.
They show failure of the fixed-slice estimate of E66
if the horizontal equation alone is removed.
[E66, fixed-slice hypotheses][e66]. [E103 (9)–(10)][e103].

To check full placement, the vertical automorphism
\(U_n(x,h)=(x,u_n(x)^{-1}h)\) is the active-pullback
convention for the displayed internal action: on
a local section the inhomogeneous term is
\(u_n d(u_n^{-1})=-du_n u_n^{-1}\).
The local maps agree on overlaps since the local
representatives of \(u_n\) change by conjugation.
It follows that
\[
 A_0+b_n=U_n^*G_n^*A_0=(G_n\circ U_n)^*A_0 .
\]
The inverse of \(G_n\circ U_n\) gives explicit
placement at \(A_0\) on the full orbit. The example
therefore imposes no obstruction to finite horizontal
placement. The lower bound uses each fixed \(M_*\)
and sufficiently large \(n\). It makes no assertion
over arbitrary sequences with unbounded gauge constants.
The provisional label in E103 is historical and the
E101 lead assessment resolves it. No mathematical
correction to the frozen derivation is required.

[req]: ../research-progress/handoffs/SP4-CME-E106_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E106_RETURN_v1.md
[b58]: ../brainstorm/notes/B58_DEFECT_PINCHING_AND_VERTICAL_RESIDUAL_20261122.md
[e103]: ../notes/103_COULOMB_CURVATURE_OSCILLATION_20261122.md
[e95]: ../notes/95_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md
[e96]: E96_CURVED_ORBIT_EXAMPLE_AUDIT_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e59]: ../notes/59_CRITICAL_PATH_STRAIN_20261122.md
[e57]: ../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md
[e66]: ../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e98]: ../notes/98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
[e99]: ../notes/99_VALUE_SMALL_COULOMB_ESTIMATE_20261122.md
[e101]: E101_VERTICAL_GAUGE_STATIC_GAIN_AUDIT_20261122.md
[assess]: E98_E101_VERTICAL_GAUGE_ASSESSMENT_20261122.md
