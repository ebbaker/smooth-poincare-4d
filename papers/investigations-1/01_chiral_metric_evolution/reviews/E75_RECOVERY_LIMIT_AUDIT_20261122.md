# E75 independent audit of the critical recovery limit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
This helper authored E60 and E67 and independently audited the E59
dictionary in E65. I did not write E74. This is a check of the new
E74 generator estimates and limiting argument using the assessed
existence, smoothing and stability inputs. [Frozen request][req] ·
[E74 derivation][e74].

**Disposition.** E74 passes for smooth compatible data with sufficiently
small fixed native round critical pair norm \(\delta\). The two actual
direct recovery generators have an integrated fixed \(C^1(P)\) bound of
order \(\delta\). The spliced automorphisms and inverses converge in
\(C^1\) to mutually inverse principal \(SO(3)\) bundle maps, with
\(O(\delta)\) distance to identity. The original connection and
curvature converge uniformly to the indicated round pullbacks, with
curvature interpreted distributionally for the continuous connection.

## Actual generator, signs and graph

E36's compatible first row at the fixed native round reference is
\[
 A_\tau=v(A)-d_A\phi-S_A Y,\quad
 \phi=d_A^{*g_0}a,\quad
 Y=S_A^*d_A^{*g_A}d_Aa,\quad a=A-A_0 .
\]
Indeed the defect correction \(d_A^{*g_A}(F-F_A)\) vanishes on the
compatible graph. The Bianchi-reduced physical term becomes \(v(A)\)
by \(d_AF_A=0\). In E49 the same form uses fixed inner operators
\(\phi=\delta_0b\), \(Y=\Delta_0S_0^*b\), and \(A=B\).
[E27, (2)][e27] · [E36, (1)–(2)][e36] · [E49, (1)][e49].

For a right-invariant principal vector field \(V=\phi+\chi_A(Y)\),
the local notation treats \(\phi\) as its equivariant vertical
field and \(\chi_A(Y)\) as an \(A\)-horizontal lift. Cartan's
formula for the connection gives
\(\mathcal L_V A=d_A\phi+\iota_YF_A\), using
\(F_A=dA+\tfrac12[A\wedge A]\) and \(A(V)=\phi\). The infinitesimal
action is \(R(V,A)=-\mathcal L_V A\) because the left action is
\(g\cdot A=(g^{-1})^*A\). Thus \(\xi=-V\) satisfies
\(A_\tau=v(A)-R(\xi,A)\). Taking \(j_\tau=-\xi\circ j\) gives
\[
 \partial_\tau(j^*A)
  =j^*(A_\tau+\mathcal L_{-\xi}A)
  =j^*v(A)=v(j^*A).
\]
This directly verifies the generator \(W=-\xi=V\) and the
recovery sign in E74 (3) and (13). Differentiating \(g=j^{-1}\) gives
\(\dot g=-Dg\,W\), evaluated at the argument of \(g\), so
\(\dot g\circ g^{-1}=g_*\xi\). A spatial derivative of that last field
would contain second derivatives of \(g\). E74 uses the \(C^1\)
bound on \(W\) in the equation for \(j\).
[E28, recovery][e28] · [E50, (5)–(9)][e50] · [E62, (6)][e62].

## Fixed-bundle \(C^1\) bound on the initial interval

Let \(U=(a,\beta)\) with \(\beta=F_A-F_0\), and
\(h_\ell=\|D_0^\ell U\|_\infty\). The two identities
\(F_A-F_0=d_0a+\tfrac12[a\wedge a]\) and
\(d_Aa=d_0a+[a\wedge a]\) give
\(\eta=d_Aa=\beta+\tfrac12[a\wedge a]\).
The reference bracket and alternation are parallel. With \(h_0\le1\),
the first two ordered derivatives give
\(\|\eta\|_\infty\le Ch_0\), \(\|D_0\eta\|_\infty\le Ch_1\),
\(\|D_0^2\eta\|_\infty\le C(h_2+h_1^2)\). The fixed vertical
codifferential satisfies
\[
 \phi=-g_0^{ij}((D_0)_ia_j+[a_i,a_j])=d_0^*a
\]
by symmetry of \(g_0^{ij}\) and antisymmetry of the Lie bracket.
Its value and reference derivative are bounded by \(Ch_1\) and
\(Ch_2\).

On the two-form \(\eta\) there are two live base covector slots.
Writing \(L=\nabla^g-\nabla^0\), the local exact formula is
\[
 Z_k=(d_A^{*g}\eta)_k
   =-g^{ij}\big((D_0)_i\eta_{jk}+[a_i,\eta_{jk}]
          -L^p{}_{ij}\eta_{pk}-L^p{}_{ik}\eta_{jp}\big).
\]
The two Christoffel-difference signs are the covector signs before
the overall minus from the adjoint. The metric difference is
\(L^p{}_{ij}=\tfrac12g^{pq}((D_0)_i g_{jq}+(D_0)_j g_{iq}-(D_0)_qg_{ij})\).
Also the live adjoint on a one-form \(z\) is
\((S_A^*z)^i=g^{ij}g^{k\ell}\langle F_{jk},z_\ell\rangle\).
The smooth curvature-to-metric map and inverse, together with
\(D_0F_0=0\), give
\(\|D_0 g\|+\|D_0g^{-1}\|+\|D_0S_A^*\|\le Ch_1\) and
\(\|D_0^2g\|\le C(h_2+h_1^2)\) in fixed sup norms. Consequently
\(\|L\|_\infty\le Ch_1\) and
\(\|D_0L\|_\infty\le C(h_2+h_1^2)\). These counts use the
covariant fiber chain rule for the algebraic metric construction.
The words “reference-parallel frames” at E74 lines 120–122 mean
frames parallel at the individual point or the covariant chain
rule. An open set with a parallel frame is unnecessary.

One obtains
\(\|Z\|_\infty\le C(h_1+h_0^2+h_0h_1)\).
For \(D_0Z\), the inverse metric derivative multiplies this bound
by \(Ch_1\), the differentiated bracket costs \(Ch_0h_1\), and each
differentiated \(L\eta\) costs
\(C[h_0(h_2+h_1^2)+h_1^2]\). Differentiating \(D_0\eta\) gives
\(C(h_2+h_1^2)\). The derivative of \(S_A^*\) contributes only
another \(Ch_1\|Z\|_\infty\). Thus E74 (9) follows with
\(\|Y\|_\infty\le C(h_0+h_1)\) and
\(\|D_0Y\|_\infty\le C(h_2+h_1^2+h_0h_1)\).
[E59, reconstruction][e59] · [E74, (4)–(9)][e74].

For \(p=s(x)r\) in a fixed section,
\(A_P=\operatorname{Ad}_{r^{-1}}(A_i\,dx^i)+r^{-1}dr\).
The horizontal lift imposes \(\dot r=-A_iY^i r\), while the
vertical term has \(\dot r=\phi r\). This checks the chart formula
\(W_{\rm loc}=(Y,(\phi-A_iY^i)r)\). It also shows right invariance.
In fixed supports \(A_i=A_{0i}+a_i\), so a base derivative of
\(A_i Y^i\) costs at most
\(C[(1+h_0)(\|D_0Y\|_\infty+\|Y\|_\infty)+h_1\|Y\|_\infty]\).
Fiber and chart conversion derivatives use bounded fixed
coefficients and the undifferentiated fields. No term survives
with \(a=\beta=0\). The resulting \(C^1(P)\) norm is bounded by
\(C(h_0+h_1+h_2+h_1^2)\), exactly (11).

Let \(M,H\) be the fixed critical norm terms on the interval
\([0,\tau_0]\). With \(v_\gamma\) the fixed localized pieces,
Bernstein gives \(h_\ell\le C\sum_{\gamma,j}2^{(\ell+1/2)j}
\|\Delta_j v_\gamma\|_8\) for \(0\le\ell\le2\), including the
low block and frame/cutoff lower terms. Every linear term
integrates to \(CH\). For \(X_{\gamma j}(\tau)=\|\Delta_j
v_\gamma(\tau)\|_8\), the first-gradient \(L^2_\tau\) contribution
is bounded by the sum of
\[
 2^{3j/2}\|X_{\gamma j}\|_{L^2_\tau}
 \le (2^{j/2}\sup_\tau X_{\gamma j})^{1/2}
      (2^{5j/2}\int X_{\gamma j}\,d\tau)^{1/2}.
\]
Minkowski followed by Cauchy–Schwarz in the block and chart indices
gives \(\int h_1^2\le CMH\). The small tube follows from
\(h_0\le CM\), and the restricted \(M+H\le C_{\rm crit}\delta\)
proves the integrated bound \(C(\delta+\delta^2)\).
[E59, (7)–(9)][e59] · [E60, compatible estimate][e60].

## Stable generator, tail, and composition order

E62's fixed time is
\(\tau_0=\tfrac14\min(T_{\rm crit},T_{42},1,c_K)\), strictly
inside both local intervals with room on the right. Applying E63
at \(\tau_0\) with \(k=m\) and the zero datum gives
\(\|\widehat A(\tau_0)-A_0\|_{H^m}\le K_m\delta\) by finite
volume and the critical embedding. The small entrance threshold
yields \(q_b(u)=\|B(u)-A_0\|_{H^m}\le
C_{\rm st}K_m\delta e^{-\alpha u}\). Since \(m-3>2\), the
localized Fourier bound for \(H^m\to C^3\) uses the integrable
weight \((1+|\xi|^2)^{-(m-3)}\) in four dimensions. Both
\(\delta_0b\) and \(\Delta_0S_0^*b\) are linear in \(b\) with
fixed coefficients. The chart lift by \(B=A_0+b\) adds only
a fixed-coefficient linear term and a quadratic term. Hence
\(\|W_{\rm st}\|_{C^1(P)}\le C(q_b+q_b^2)\); integrating from
\(s\) gives the factors \(e^{-\alpha s}/\alpha\) and
\(e^{-2\alpha s}/(2\alpha)\) in (14). The reference generator
vanishes and the finite head plus full tail gives
\(\mathsf B:=\int_0^\infty \|W\|_{C^1(P)}d\tau\le C\delta\)
for \(\delta\le1\). There is no clock conversion in this estimate.
[E62, splice time][e62] · [E63, (1)][e63] · [E49, (2)][e49] ·
[E67 audit][e67].

With right-to-left composition and \(c=g_{\rm loc}(\tau_0)\), the
tail starts with \(j_{\rm st}(0)c^{-1}=c^{-1}=j_{\rm loc}(\tau_0)\).
The constant right factor gives
\(\partial_\tau(j_{\rm st}c^{-1})=W_{\rm st}\circ(j_{\rm st}c^{-1})\).
It follows that \(j=j_{\rm st}c^{-1}\) and \(g=cg_{\rm st}\) on
the tail. The tail left action is exactly \(j^*B=(c^{-1})^*j_{\rm st}^*B\).
The E62 smooth original-flow
uniqueness on a right overlap proves smoothness of the recovered
original connection at the splice. The chosen maps are continuous
across the splice and obey the piecewise ODE, even if the two \(W\)
fields differ at that time. [E50, recovery and overlap][e50] ·
[E62, (6)–(7)][e62].

## Fixed-atlas \(C^1\) limits

A smooth time interval has a smooth diffeomorphism flow on compact
\(P\), with inverse from solving backward over the same interval.
Uniqueness under right translations gives equivariance, and
composition gives these properties across the splice. The displacement
bound \(d_P(j_\tau p,p)\le\int\|W\|_\infty\le\mathsf B\) and the same
inverse bound let the packet use a fixed nested cover
\(V_i\Subset O_i\Subset U_i\). Decrease the datum radius once using
the positive margins so paths from \(\overline O_i\) stay in fixed
compact subsets of \(U_i\), and inverse images of \(\overline V_i\)
stay in compact subsets of \(O_i\). First coordinate derivative norms
of \(W\) there are bounded by \(C\|W\|_{C^1(P)}\).

In such coordinates \(J'=W_i(J)\) and \(P'=(DW_i)(J)P\) with
\(P=DJ\), \(P(0)=I\). At the splice \(J,P\) match because the
stable flow at \(u=0\) is the identity with identity derivative.
The integral equations therefore give
\[
 \|P\|\le e^{C\mathsf B},\qquad
 \|P-I\|\le e^{C\mathsf B}-1,\qquad
 \|J(t)-J(s)\|_\infty+\|P(t)-P(s)\|_\infty
     \le Ce^{C\mathsf B}\int_s^t\|W\|_{C^1(P)}\,d\tau .
\]
The uniform limits on these charts give \(C^1\) convergence:
integrate the derivatives on segments in small coordinate balls to
identify the derivative of the limit, then use chart compatibility.
The direct estimates furnish a tail bound for \(j_\tau\) from (14).

The coordinate determinant solves
\((\det P)'=(\operatorname{tr}DW_i(J))\det P\). It is at least
\(e^{-C\mathsf B}\), including in the limit. The uniformly small
\(\|P-I\|<1/2\) after threshold reduction gives a uniform inverse
derivative bound on every chart. Since \(j_\tau\) is a
diffeomorphism, the inverse derivative bound gives a global
Lipschitz constant for \(g_\tau\) by estimating lengths of curves.
It implies
\(d_P(p,p')\le C d_P(j_\infty p,j_\infty p')\) and injectivity.
Given \(q\), any subsequential limit of \(j_{\tau_n}^{-1}q\)
as \(\tau_n\to\infty\) maps to \(q\) by uniform convergence.
Thus \(j_\infty\) is bijective and the inverse function theorem
gives a \(C^1\) inverse. Equivariance passes to the limit and
inverse. Projection composed with smooth local sections gives
the induced \(C^1\) base maps and convergence of their first
derivatives. They are mutually inverse, so their determinant
is nonzero. Since the smooth finite-time maps have positive
base determinants, the limiting base maps preserve orientation.

For inverse convergence in values, use
\(d_P(g_\tau q,g_\infty q)\le C d_P(q,j_\tau g_\infty q)\).
For derivatives, the inverse matrix is \(P(\tau,g_\tau q)^{-1}\),
in the appropriate fixed chart. Uniform convergence of \(P(\tau,\cdot)\),
uniform continuity of \(P(\infty,\cdot)\) on the compact interior
subsets, and uniform inverse matrix bounds give convergence there.
The unknown modulus of \(P(\infty,\cdot)\) at moving inverse
points makes this an inverse \(C^1\) convergence statement without
a rate. Distance to identity is a different estimate. Both direct
and inverse displacements are \(O(\mathsf B)\), and
\(\|P^{-1}-I\|\le\|P^{-1}\|\|P-I\|\) at the inverse point gives the
inverse \(O(\mathsf B)\) derivative bound directly. This proves the
claimed \(O(\delta)\) distance for both limit maps in the fixed
chart \(C^1\) neighborhood. [E74, (15)–(17)][e74].

## Pullback convergence and weak curvature

The exact curvature graph gives
\(F_B-F_0=d_0b+\tfrac12[b\wedge b]\), hence \(B\to A_0\) and
\(F_B\to F_0\) uniformly by the stable \(H^m\) bound. View the
connections and curvatures as forms on the fixed principal bundle.
In \(j_\tau^*B-j_\infty^*A_0\), the term \(j_\tau^*(B-A_0)\)
is bounded by the uniform \(C^0\) difference times the uniform
\(\|Dj_\tau\|\). The remaining term
\(j_\tau^*A_0-j_\infty^*A_0\) tends to zero by \(C^1\)
convergence and smoothness of \(A_0\). The curvature pullback
argument uses two derivative factors with the same uniform bound.
It follows that the original pair tends in \(C^0\) to
\(j_\infty^*(A_0,F_0)=g_\infty\cdot(A_0,F_0)\), with
\(j_\infty=j_{{\rm st},\infty}c^{-1}\). Equivariance and the
derivative on fundamental vertical vectors ensure that \(j_\infty^*A_0\)
is a continuous principal connection form.

In every smooth local section, the uniformly convergent finite-time
potentials \(\mathcal A_\tau\) and curvatures \(\mathcal F_\tau\) give
\(d\mathcal A_\tau\to\mathcal F_\infty-\tfrac12[
\mathcal A_\infty\wedge\mathcal A_\infty]\) uniformly locally by
the curvature identity. Testing the potential against derivatives of
smooth compactly supported test forms also gives
\(d\mathcal A_\tau\to d\mathcal A_\infty\) distributionally. The
two limits agree, and the equation is compatible with smooth section
transitions by passage from the finite-time identities. This verifies
the continuous representative of distributional curvature without
second derivatives of \(j_\infty\) or a classical derivative of
\(\mathcal A_\infty\). The positive wedge Gram and \(Q=I\) follow
pointwise from the invertible orientation-preserving base pullback
of \(F_0\), in the equivariant fiber identification. The established
limit regularities are \(C^1\) for the bundle maps and \(C^0\) for the
connection and curvature pair. The datum threshold uses the fixed
reference, localization, chart margins, compatible local estimate,
smoothing strip and stable tail constants at the selected \(m\).
The proof puts no higher-norm bound on the smooth initial pair.
[E74, (18)][e74].

## Frozen inputs and provenance

All six frozen inputs matched. For the corrected E67, I reversed the
five replacements in memory at corrected offsets
3914, 3966, 6498, 7118 and 7142, in descending order. This reproduces
SHA-256 `abfb4370645ac042a039629dd4725bf67a0bb81897f52cf4ac49fdbe26c0c0c8`,
the original hash consumed in E74. The five literal CR bytes are the
only change from that version according to the verified recipe.
No primary source was opened or imported. The supporting recovery
formulas are checked in the cited internal assessed derivations.
[Typesetting correction record][repair].

| Input | SHA-256 |
| --- | --- |
| [E75 request][req] | `ce06b79f3c6a1fc28fd05fa115f01a0003bc7cc62463ee5157e75d5a2467af83` |
| [E74][e74] | `b2178fb149712df61c6b660bca00e10451c1d38c5434bb562607d9ba369139fa` |
| [E59][e59] | `2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a` |
| [E60][e60] | `c34bf22a1f80092a1ba33b154e4c2b308db1907ad56727099675321865a0246d` |
| [E49][e49] | `45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16` |
| [E63][e63] | `427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb` |
| [E67, corrected][e67] | `96a962b3c40f682443b4d52d021633a83f13bbf8b1d9d5ae8693b3bdc67eb357` |
| [Typesetting record][repair] | `2ae8b3a5ce147f84aa879580f01ae62b3ef122cc2ff73bde1ce5d4adea49d807` |
| [E27, supporting][e27] | `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590` |
| [E28, supporting][e28] | `b5bc0ba6f3981370f29027481a8293083e3fc93e9fa013e4494ab86767f74175` |
| [E36, supporting][e36] | `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a` |
| [E50, supporting][e50] | `ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf` |
| [E62, supporting][e62] | `a14e79a0ad8def1deed7af897aa33ebd734e26a3d0d161c95f30c415e82f0026` |

[req]: ../research-progress/handoffs/SP4-CME-E75_REQUEST_v1.md
[e74]: ../notes/74_CRITICAL_RECOVERY_LIMIT_20261122.md
[e27]: ../notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[e28]: ../notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e36]: ../notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e49]: ../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e59]: ../notes/59_CRITICAL_PATH_STRAIN_20261122.md
[e60]: ../notes/60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md
[e62]: ../notes/62_GLOBAL_CRITICAL_STRAIN_BUDGET_20261122.md
[e63]: ../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e67]: E67_GLOBAL_BUDGET_AUDIT_20261122.md
[repair]: BROAD_RUN_TYPESETTING_CORRECTIONS_20261122.md
