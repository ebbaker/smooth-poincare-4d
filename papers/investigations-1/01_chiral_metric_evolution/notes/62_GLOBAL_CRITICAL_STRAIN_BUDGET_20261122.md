# E62 — Whole-time critical strain budget conditional on the initial estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and actual lead settings are unavailable.
The [request][req] freezes the inputs and [B41][b41] specifies the
implication.

## Premise and conclusion

Fix the oriented standard round \(S^4\) with metric \(g_0\) of
sectional curvature \(K>0\) and its round-compatible perfect
chiral connection \(A_0\) with curvature \(F_0\).
Fix an integer \(m\geq6\). Use Fine's native time
\(\tau\) and native fixed reference norms for E36, E42, E49 and E50.
Use the E14 norm and clock \(t\) for the strain budget. Set
\(c_K=2K\), so \(\tau=c_Kt\) and \(g_A^{\rm F}=c_K\widehat g(A)\).
Let \(\mathcal B^{1/2}\) be the
fixed localized \(B^{1/2}_{8,1}\) space of the E57/B38/E59 form,
and \(E_T\) the corresponding weighted sum of blockwise time
suprema and time integrals at orders \(1/2\) and \(5/2\).
For the smooth compatible datum put
\[
 U_{\rm in}=(A_{\rm in}-A_0,F_{A_{\rm in}}-F_0),\qquad
 \delta=\|U_{\rm in}\|_{\mathcal B^{1/2}} .
\]

Assume precisely \(H_{\rm crit}\). There exist
\(T_{\rm crit},\epsilon_{\rm crit},C_{\rm crit}>0\) such that
each smooth compatible initial pair with
\(\delta<\epsilon_{\rm crit}\) has the E36 adjusted solution,
identical to the E42 solution, smooth through zero and
compatible on \([0,T_{\rm crit}]\), and its difference
pair \(U=(\widehat A-A_0,\widehat F-F_0)\) satisfies
\[
 E_{T_{\rm crit}}(U)\leq C_{\rm crit}\delta                         \tag{1}
\]
in native time. All use of the identity of the two solutions
below is on their common interval. This is the named premise
of the request.

Under this premise there are \(\delta_*>0\) and a finite
nondecreasing modulus \(\Omega:[0,\delta_*]\to[0,\infty)\)
with \(\Omega(0)=0\) and \(\Omega(r)\to0\) as \(r\downarrow0\).
For every such smooth input with \(\delta\leq\delta_*\) the
original unadjusted flow exists smoothly and definitely for all
time and has
\[
 J(\infty)=\int_0^\infty\sup_x
       \left(|\nabla^A T|_{\widehat g}+|T|_{\widehat g}^2\right)\,dt
       \leq \Omega(\delta) .                                      \tag{2}
\]
All choices depend on the fixed setup, \(m\) and the constants
in the premise, with no required bound on higher initial derivatives.

## Local norms and a common smoothing slice

For the norm use the actual fixed pieces in (1), with compact
interior support, coordinate frames, a partition of unity,
and nested reconstructing cutoffs. Affine chart offsets
place the localized pieces inside a volume-one torus, on
which the E53 Fourier partition is used. Fixed frame and
density comparisons only change constants. Summation of E53
Bernstein at order zero and reconstruction give
\[
 \|U_{\rm in}\|_{C^0,\mathrm{native}}\leq C_{\rm emb}\delta,\qquad
 \sup_{0\leq\tau\leq T_{\rm crit}}\|U(\tau)\|_{C^0,\mathrm{E14}}
                                   \leq C_{\rm emb} E_{T_{\rm crit}}(U).
                                                                    \tag{3}
\]
Both norms can use this common constant since the native
reference metric is \(c_K\) times the E14 round metric and
the internal pairings differ by a constant. The reference
spatial derivatives agree as connections.

For clarity, the E59 norm can be taken using the same
pieces by the reconstruction in its proof. If one uses a
different finite atlas there, decompose a target chart piece
as a sum of source pieces multiplied by reconstructing
cutoffs and transported through a chart overlap. The
operator on each overlap is \(Tv(x)=A(x)v(\Phi(x))\)
extended by zero with \(A\) smooth and compactly supported
inside the overlap. Here \(A\) includes the frame change
and the cutoffs, and \(\Phi\) is the fixed overlap map.
On these supports bounded Jacobians and the chain rule give
boundedness on \(L^8\) and \(W^{4,8}\). For an input block
\(v_j\), the derivative Bernstein estimate in \(L^8\) gives
\(\|Tv_j\|_{W^{4,8}}\leq C2^{4j}\|v_j\|_8\).
For an output block \(k\geq1\) divide its annular symbol
by that of \((-\Delta)^2\) and use the E53 periodized \(L^1\)
bound. Together with the \(L^8\) bound this gives
\[
 \|\Delta_k Tv_j\|_8\leq C\min(1,2^{4(j-k)})\|v_j\|_8,
 \qquad \|\Delta_0 Tv_j\|_8\leq C\|v_j\|_8 .
\]
The sum of these factors weighted by \(2^{\sigma k}\) is at
most \(C_\sigma 2^{\sigma j}\) for \(0<\sigma<4\), splitting
at \(k=j\). The same sum controls time suprema and time
integrals, taking the respective time norm before summing
the nonnegative block bounds. In particular this compares
the localized trace norm and both parts of \(E_T\).
The reverse comparison follows by exchanging the two fixed
covers. Only this finite comparison is used here.
[E53, kernel estimates][e53] · [E57, (2)–(3)][e57] · [E59, (7)–(8)][e59].

Let \(T_{42}>0\) be the E42 common time about \(A_0,F_0\)
and choose
\[
 \tau_0=\tfrac14\min\{T_{\rm crit},T_{42},1,c_K\}>0 .
\]
This is independent of the input, and \(2\tau_0\) lies
strictly inside both common intervals. The E42 pair with
zero initial difference is stationary. The curvature
has \(Q=I\), so its physical factor is \(2I\) and the
gradient vanishes by self-duality and Bianchi. All
reference gauge and constraint terms of the independent
system vanish there, including its Bianchi term. Zero
therefore gives the E42 fixed point for zero datum.

Define \(\Psi(W)=\widehat A_W(\tau_0)-A_0\) for an
independent continuous pair datum \(W\) in the E42 small
ball. Its native-reference \(H^m\) norm tends to zero
as \(\|W\|_{C^0,\mathrm{native}}\to0\) by E42 positive-time
continuity of all spatial derivatives, using compactness
and the fixed reference norms to pass to \(H^m\).
Choose \(\rho_1>0\) so the closed \(C^0\) ball of radius
\(\rho_1\) is inside the E42 data ball and
\(\sup_{\|W\|_{C^0}\leq\rho_1}\|\Psi(W)\|_{H^m}\leq1\).
Such a radius follows from continuity at zero and
\(\Psi(0)=0\), independently of compactness of that ball.
Set
\[
 \omega(r)=\sup_{\|W\|_{C^0,\mathrm{native}}\leq C_{\rm emb}r}
               \|\Psi(W)\|_{H^m},\qquad 0\leq r\leq\rho_1/C_{\rm emb}.
                                                                    \tag{4}
\]
This is finite and nondecreasing. For every positive number
\(b'\), continuity at zero bounds the supremum by \(b'\)
for all sufficiently small \(r\). Thus \(\omega(r)\to0\).
For the compatible solution of the premise, (3), its E42
identity, and (4) give
\(\|\widehat A(\tau_0)-A_0\|_{H^m}\leq\omega(\delta)\).
No Lipschitz estimate in \(H^m\) is used.
[E42, positive-time continuity][e42] · [E50, stationary comparison][e50].

## Original flow and the two time intervals

Let \(\eta,C_{\rm st},\alpha>0\) be the E49 stability constants
for this \(m\). Shrink \(\delta_*\) to lie strictly below
\(\epsilon_{\rm crit}\), to lie in the domain of (4), and
to have \(\omega(\delta_*)<\eta/2\).
By (1) and (3) it may also be chosen so the initial adjusted
path stays in the E59 tube on \([0,2\tau_0]\).
For \(B(0)=\widehat A(\tau_0)\), E49 gives a global smooth
stable adjusted solution \(B(u)\), in its fixed reference
gauge and native elapsed time \(u\geq0\). With
\(b(u)=B(u)-A_0\) and \(q(u)=\|b(u)\|_{H^m}\), its bound is
\[
 q(u)\leq C_{\rm st} e^{-\alpha u}\omega(\delta).
                                                                    \tag{5}
\]
[E49][e49] · [E49–E52 assessment][stableassessment].

The recovery uses the E50 left action \(g\cdot A=(g^{-1})^*A\)
and the composition \(gh=g\circ h\).
Write \(S_A(Y)=\iota_YF_A\) for curvature contraction here
and \(\chi_A\) for the horizontal lift to the principal
frame bundle. The infinitesimal action is
\(R(\phi+\chi_A(Y),A)=-d_A\phi-S_A(Y)\).
In the convention \(A_{{\rm adj},\tau}=v(A_{\rm adj})-
R(\xi(A_{\rm adj}),A_{\rm adj})\), the two E50 generators are
\[
 \begin{aligned}
 \xi_{\rm loc}(A)
   &=-d_A^{*g_0^{\rm F}}(A-A_0)
      -\chi_A\!\left(S_A^*d_A^{*g_A^{\rm F}}d_A(A-A_0)\right),\\
 \xi_{\rm st}(B)
   &=-\delta_0 b-\chi_B\!\left(\Delta_0S_0^*b\right).
 \end{aligned}                                                     \tag{6}
\]
The local formula is the one on the compatible E36 graph,
and the inner stable operators are fixed at the reference.
For either adjusted path solve \(\dot j=-\xi(A_{\rm adj})\circ j\)
from identity and use \(g=j^{-1}\). The smooth invariant
vector field has a flow on each compact time interval under
consideration since the principal bundle is compact.
ODE uniqueness gives equivariance and agreement on
overlapping time intervals. These time-dependent bundle
automorphisms cover orientation-preserving maps.
Differentiating the inverse gives right velocity
\(\dot g\circ g^{-1}=\operatorname{Ad}_g \xi\).
The chain rule and equivariance of the physical vector
field give \(\partial_\tau(g\cdot A_{\rm adj})=v(g\cdot A_{\rm adj})\),
because the infinitesimal action term cancels the
pushforward of \(-R(\xi,A_{\rm adj})\).
[E50, (5)–(9)][e50].

Apply this along \(\widehat A\) through \(2\tau_0\), with
recovery \(g_{\rm loc}\), and along \(B\) from \(u=0\),
with recovery \(g_{\rm st}\). Put \(c=g_{\rm loc}(\tau_0)\).
The original native-time path is
\[
 A^{\rm F}(\tau)=
 \begin{cases}
 g_{\rm loc}(\tau)\cdot\widehat A(\tau),&0\leq\tau\leq\tau_0,\\
 (c\, g_{\rm st}(\tau-\tau_0))\cdot B(\tau-\tau_0),&\tau\geq\tau_0 .
 \end{cases}                                                       \tag{7}
\]
The constant automorphism is on the left of the tail
recovery. Both branches solve the original equation and
have value \(c\cdot B(0)\) at the splice. The local branch
already exists past \(\tau_0\). E50's smooth original-flow
uniqueness, with the corrected short-time reference
recentered at \(c\cdot B(0)\), identifies the two original
branches on a common right neighborhood of the splice.
Consequently (7) is smooth there by actual overlap.
The inverse comparison on the tail is
\(g_{\rm st}(\tau-\tau_0)^{-1}c^{-1}\), which carries
\(A^{\rm F}(\tau)\) to \(B(\tau-\tau_0)\) in that order.
This uses smooth paths from zero and no limit of the
recovering automorphisms. [E50, (10)–(12) and smooth uniqueness][e50].

## Strain estimates in the E14 clock

Write \(\mathcal G(A)=\sup_x
(|\nabla^AT|_{\widehat g}+|T|_{\widehat g}^2)\) using E14
spatial norms. E59 timewise naturality gives equality of
\(\mathcal G\) for the original and the corresponding
adjusted connection at each evaluation time in (7).
The estimates in the fixed tubes are therefore needed
only on the adjusted paths.
The E14 original path is \(A(t)=A^{\rm F}(c_Kt)\).
Indeed the live metrics differ by the constant factor \(c_K\).
The codifferential on two-forms scales by \(c_K^{-1}\)
and the normalized algebraic factor \(B(F)\) is unchanged.
Thus multiplying the native velocity by \(c_K\) gives
the original equation in the E14 clock.
Changing variables once, with the E14 spatial norms
kept in the integrand, gives
\[
 J(\infty)=c_K^{-1}\left(
      \int_0^{\tau_0}\mathcal G(\widehat A(\tau))\,d\tau
                   +\int_0^\infty\mathcal G(B(u))\,du\right).       \tag{8}
\]
In fully native spatial norms each integrand would acquire
the factor \(c_K^{-1}\), so there is no additional clock
factor with that simultaneous convention. [E59, clock and naturality][e59].

On the first interval the geometric E59 bound uses only
the supplied smooth compatible path. Its proof is valid
with the native time as integration parameter because it
uses spatial identities and time interpolation, and
\(\tau_0\leq1\). The norm of the restriction is bounded
by (1). Thus for a fixed \(C_{\rm head}\),
\[
 \int_0^{\tau_0}\mathcal G(\widehat A(\tau))\,d\tau
                            \leq C_{\rm head}(\delta+\delta^2).
                                                                    \tag{9}
\]
The constant includes \(C_{\rm crit}\) and any fixed
atlas comparison. [E59, (9)][e59].

On the tail the exact curvature identity is
\[
 F_B-F_0=d_{A_0}b+\tfrac12[b\wedge b].
\]
The reference exterior derivative is the alternating
part of \(D_0 b\); the alternation and internal bracket
are \(D_0\)-parallel. For \(0\leq j\leq2\) this gives a
bound of the form
\[
 |D_0^j(F_B-F_0)|_0
 \leq C\left(|D_0^{j+1}b|_0+
           \sum_{\ell=0}^j|D_0^\ell b|_0|D_0^{j-\ell}b|_0\right).
\]
Here the ordered derivatives require no commutation.
In local coordinates \(d_{A_0}b\) includes the fixed
\(A_0\) multiplication, and every \(D_0^j\) is
\(\partial^j\) plus smooth reference-connection and
frame terms with fewer derivatives. For \(j\leq3\)
these lower terms use fixed derivatives of the reference
coefficients. They are already retained in the
\(D_0\)-covariant identity and cost only fixed constants
in the local Sobolev comparison. In dimension four,
\(H^m\) controls all uniform derivatives through order
three for \(m\geq6\). On the fixed chart cutoffs this
follows from Fourier Cauchy–Schwarz with
\((1+|\xi|^2)^{-(m-3)}\) integrable in four dimensions,
and the fixed chart and norm comparisons.
Consequently for \(U_B=(b,F_B-F_0)\),
\[
 \|U_B\|_{C^2_0}\leq C_{\rm curv}\,(q+q^2).
\]
Shrink \(\delta_*\) again so that
\(C_{\rm st}\omega(\delta_*)\leq1\) and
\(2C_{\rm curv}C_{\rm st}\omega(\delta_*)\) is within the
E59 value tube. This keeps \(U_B\) in that tube for
every \(u\geq0\) by (5). The pointwise E59 dictionary then
gives \(\mathcal G(B(u))\leq C_{\rm tail}(q(u)+q(u)^2)\).
Integration of (5) yields
\[
 \int_0^\infty\mathcal G(B(u))\,du\leq
 C_{\rm tail}\left(
   \frac{C_{\rm st}}{\alpha}\omega(\delta)
        +\frac{C_{\rm st}^2}{2\alpha}\omega(\delta)^2\right).       \tag{10}
\]
[E59, (6)][e59] · [E49, exponential estimate][e49].

A modulus in (2) is therefore
\[
 \Omega(r)=c_K^{-1}\left[
 C_{\rm head}(r+r^2)+C_{\rm tail}\left(
   \frac{C_{\rm st}}{\alpha}\omega(r)
     +\frac{C_{\rm st}^2}{2\alpha}\omega(r)^2\right)\right],
             \qquad 0\leq r\leq\delta_* .
\]
It is finite and nondecreasing and tends to zero.
For every prescribed \(b_{\rm bud}>0\) choose
\(0<\delta_{\rm bud}\leq\delta_*\) with
\(\Omega(\delta_{\rm bud})<b_{\rm bud}\).
Every input of size \(\delta\leq\delta_{\rm bud}\) has
\(J(\infty)<b_{\rm bud}\).

## Relative matrices and full-gradient sufficient data

The metric and normalized curvature comparisons apply to
the original flow in its fixed base and bundle identification.
Put \(a_*(t)=4512\sqrt2\,J(t)\). E14 (4)–(5) give at every
\(t\geq0\), as pointwise quadratic forms,
\[
 \begin{aligned}
 e^{-a_*(t)}\widehat g(A_{\rm in})
     &\leq \widehat g(A(t))\leq e^{a_*(t)}\widehat g(A_{\rm in}),\\
 e^{-a_*(t)}Q(F_{A_{\rm in}})
     &\leq Q(F_{A(t)})\leq e^{a_*(t)}Q(F_{A_{\rm in}}).
 \end{aligned}
\]
The same weaker comparisons use \(4512\sqrt2\,\Omega(\delta)\)
in place of \(a_*(t)\). In particular the lower bound for
\(\lambda_{\min}Q(F_{A(t)})(x)\) is the initial eigenvalue at
that point times \(e^{-4512\sqrt2\,\Omega(\delta)}\).
These comparisons follow along the actual original
trajectory without a scalar invariant-region assumption.
[E14, integrated relative bounds][e14].

One sufficient size condition for smooth compatible data
uses the full pair gradient. Use the fixed E14 round
volume \(dV_{g_0}\) and the rearrangement norm
\(\|f\|_{4,1}=\int_0^{\operatorname{vol}(S^4)}s^{-3/4}f^*(s)\,ds\)
on this measure. If \(v_\gamma\) is the coordinate
extension of a partition piece \(\chi_\gamma U_{\rm in}\),
its ordinary first derivative in the chart is
\[
 \partial_i v_\gamma=(\partial_i\chi_\gamma)
            (U_{\rm in})_\gamma
      +\chi_\gamma(D_{0,i}U_{\rm in})_\gamma
      -\chi_\gamma L_{\gamma,i}(U_{\rm in})_\gamma ,
\]
where \(L_{\gamma,i}\) is the fixed reference connection
matrix in these frames. The support stays in the chart
interior. For any bounded smooth multiplier and fixed
frame/density comparison, the coordinate \(L^{4,1}\)
norm on that support is at most a fixed multiple of
the global \(L^{4,1}\) norm. Indeed the distribution
function in coordinates at level \(v\) is bounded by
\(C\) times the global distribution function at \(v/C\).
Integrate their \(1/4\) powers using the E53 layer
formula. Also \(L^8\) controls \(L^{4,1}\) on the fixed
finite volume by \(f^*(s)\leq s^{-1/8}\|f\|_8\) and
integration, with bound \(8\operatorname{vol}(S^4)^{1/8}\|f\|_8\).
Thus the cutoff and connection terms
above are controlled by \(\|U_{\rm in}\|_8\).
Apply E53 to the periodic compactly supported pieces
with their \(L^8\) value and the full first derivative,
and sum the finite chart bounds to obtain
\[
 \delta\leq C_{\rm graph}
      \big(\|U_{\rm in}\|_8+\|D_0U_{\rm in}\|_{4,1}\big).
\]
In particular the right side at most \(\delta_{\rm bud}\)
gives \(J(\infty)<b_{\rm bud}\) under the same hypotheses.
Smoothness and compatibility of the initial pair are
retained. This is a full fixed-reference gradient
condition and the result remains conditional on
\(H_{\rm crit}\). [E53, (4) and graph completion][e53].

[req]: ../research-progress/handoffs/SP4-CME-E62_REQUEST_v1.md
[b41]: ../brainstorm/notes/B41_GLOBAL_CRITICAL_STRAIN_BUDGET_20261122.md
[e14]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e49]: 49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[e57]: 57_COMPACT_CRITICAL_LINEAR_20261122.md
[e59]: 59_CRITICAL_PATH_STRAIN_20261122.md
[stableassessment]: ../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
