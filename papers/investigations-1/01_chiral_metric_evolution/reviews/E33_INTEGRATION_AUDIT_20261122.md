# SP4-CME-E33 — Integration audit of the fixed gauge and the recognition criterion

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Independent runtime introspection and selected lead settings
were unavailable. The [request][req] and [return][ret] identify the
frozen inputs. All ten hashes matched at consumption. Line numbers
below refer to that manuscript version. I wrote E26, E28 and E31,
and previously worked on some of the underlying estimates. This
is a transcription and derivation audit with prior participation.
Its comparisons do not constitute independent review of those inputs.

The two conclusions are supported in their stated scope. The reverse
symbol needs an explicit initial-time qualification, and the forward
recovery sentence needs the inverse flow and its sign. Two further
phrasing changes below clarify the derivative-order argument. The
recognition constants, strict threshold and zero case check.
After input consumption the lead reported applying the wording
edits and displaying the waiting time in two branches. The
verdicts and line numbers here refer to the earlier frozen
version. The later Yamabe subsection is outside this packet.

## Fixed vertical adjoint and smooth local flow

### Normalization, live vertical term and corrected reference symbol

**Pass with one notation edit.** In `subsec:fixed-adjoint` the
internal pairing is \(2\delta\), the curvature volume therefore
doubles relative to the manuscript's \(\mu=2K^2dV_{\widehat g}\),
and \(dV_{h_A}=4K^2dV_{\widehat g_A}\) gives
\(h_A=2K\widehat g_A\). Both the curvature Gram form and its
normalizing trace acquire the same factor, leaving \(Q\) unchanged.
The internal rescaling is constant and cancels in the formal adjoint.
For two-forms the constant base metric dilation gives
\(d_A^{*h_A}=(2K)^{-1}d_A^{*\widehat g_A}\). With the same \(B_A\)
as in `flow:gradient-equation`, the physical speed is therefore
\(\partial_\tau A=(2K)^{-1}\partial_t A\) for \(\tau=2Kt\).
[Manuscript, normalization and `flow:gradient-equation`][tex] ·
[Fine v2, Definition 1.4 and Proposition 4.2][fine].

For the live metric the one-form codifferential is
\(d_A^{*h_A}a=-\rho^{-1}\partial_i(\rho h_A^{ij}a_j)
-h_A^{ij}[A_i,a_j]\). The outer \(-d_A\) yields the
third-order coefficient
\(\rho^{-1}a_j\partial_\ell\partial_i(\rho h_A^{ij})\).
For amplitude \(b=\iota_u F_A\) with real symbol convention,
naturality in the direction of an \(A\)-horizontal lifted vector
field gives \(k=D h_A{}_\zeta(b)=\zeta\otimes u^\flat+
u^\flat\otimes\zeta\). Thus
\(\rho^{-1}\zeta_i\delta(\rho h_A^{ij})
=-\zeta_i k^{ij}+\frac12\zeta^j\operatorname{tr}_{h_A}k
=-|\zeta|_{h_A}^2 u^j\).
The outer symbol is \(-|\zeta|_{h_A}^2\zeta\otimes a(u)\).
One can keep \(A\) round and vary the smooth definite reference
arbitrarily slightly with \(a(u)\ne0\) at a point. At \(A=\bar A\)
each coefficient variation in the live or fixed vertical term
acts on zero, giving the same full reference linearization.
At line 2320 use \(\delta h_A\) or \(D h_A{}_\zeta(b)\) for the
metric variation. The observed order concerns the literal live
formula in arXiv v2 and is consistent with its reference symbol.
[E26][e26] · [E27][e27] · [Fine v2, §4.2, Theorem 4.10][fine].

The fixed vertical term differentiates once an expression
first order in \(A\) with fixed metric. In the physical and
horizontal terms the two-form input and live metric are
first-jet functions. Their differentiated factors occur
additively in the codifferential, with each multiplied by
undifferentiated factors. Hence `flow:fixed-adjoint` is affine
in second derivatives. At the reference,
\((w_\zeta^1)^* w_\zeta^1 c=c\) for a transverse amplitude
\(c\) and unit \(\zeta\), and \(H_\zeta(\zeta\otimes x)=0\).
The negative Fourier symbol has quadratic form
\[
 |H_\zeta c|^2+|\mathsf S^*c|^2+|x|^2+
 \langle\mathsf S\mathsf S^*c,\zeta\otimes x\rangle .
\]
The native normalization and self-duality give
\(\sum_i|F_i|^2=3\), so the cross term is bounded in magnitude
by \(\sqrt3|\mathsf S^*c||x|\). The manuscript's lower bound
follows by \(2ab\le a^2+b^2\). If equality at zero is possible,
\(x=0\) and \(c\) is orthogonal to both \(\operatorname{im}\mathsf S\)
and \(\operatorname{im}w_\zeta^0\), whereas \(H_\zeta c=0\)
places it in their sum. This forces \(c=0\). The unit covector
and amplitude sets over the closed base are compact, giving
a uniform strict reference gap that persists on a small open
first-jet neighborhood. [E26][e26] · [E27][e27] ·
[Fine v2, Proposition 4.5 and Lemma 4.9][fine].

### Compact-bundle local existence and uniqueness

**Pass.** I reopened Taylor's primary §7.3. Equations
(7.3.1)–(7.3.2), printed p. 147, allow smooth time dependence
and impose positivity of the negative Hermitian part of the
Fourier symbol. The coefficient matrices need not be symmetric
under that condition. Proposition 7.3.A on printed p. 149 has
data \(H^s\) with \(s>n/2+2\). Equation (7.3.18) is the
first-jet quasilinear form relevant here. Proposition 7.3.B
on the same page has \(s>n/2+1\) and a \(C^{1+r}\) persistence
condition. The elementary proof in E29 uses smooth data and
the conservative \(H^6\) starting norm. Taylor uses a torus
for simplicity at the start of §7.1, so the bundle passage is
from E29. Fine's separate Taylor citation by proposition number
was left unverified in E29 and is unnecessary here.
[Taylor 1991, §§7.1, 7.3][taylor] · [E29][e29].

The proof checks as follows. With a cutoff in the first-jet
region, interpolate the principal coefficient to a fixed scalar
Laplacian to preserve the uniform Hermitian gap. Spectral
projections of a fixed connection Laplacian commute with
\(\Lambda^s=(I+D^*D)^{s/2}\) and drop out of the energy pairing.
In fixed local frames, freezing the leading coefficients and
density reduces the top quadratic term to the stated Fourier
bound. The freezing error is absorbed on small charts using
bounded coefficient \(C^1\) norms, while derivatives of cutoffs,
coefficients and densities cost lower-order terms. At even
\(s\ge6\), the first-jet coefficients have tame \(H^s\) bounds
by \(C_s(\|a_N\|_{C^2})(1+\|a_N\|_{H^{s+1}})\). Commuting
\(\Lambda^s\) past a principal coefficient on \(D^2a_N\)
uses the coefficient \(C^1\) and \(H^s\) bounds, paired with
\(\|a_N\|_{H^{s+1}}\) and \(\|a_N\|_{C^2}\), respectively.
Young's inequality absorbs the high derivative in the
coercive term, as in lines 2364–2368. Here the differentiated
\(H^s\) norm can be specified as the fixed graph norm
\(\|\Lambda^s a_N\|_2\).

In dimension four, \(H^6\hookrightarrow C^2\). The \(s=6\)
estimate gives a common short interval with bounded \(C^2\),
and the same \(C^2\) bound controls the coefficients in every
higher even-\(s\) estimate. The projected equation bounds
\(\partial_\tau a_N\) in \(H^{s-2}\). Interpolation and compact
embedding give convergence in \(C_\tau H^{s-1}\) for each
such \(s\) along a diagonal subsequence, sufficient for a
smooth solution up to the initial slice. Continuity in \(C^1\)
removes the cutoff locally in time. For the difference of two
smooth solutions, the leading part uses one solution's
coefficients, and subtracting the coefficients gives terms at
most first order in the difference with bounded multipliers.
The same \(L^2\) coercivity and Gronwall give uniqueness. Smooth
prescribed time dependence leaves these fixed local estimates
uniform over a sufficiently short closed interval. [E29][e29] ·
[Lead local-flow assessment][local].

### Reverse order, symbol and inverse paths

**Pass after clarifying the reference time and the forward
recovery.** For the left action \(h(A)=(h^{-1})^*A\), write
the local map as base map \(f\) and group map \(k\). The identities
\(f^*\hat A=\operatorname{Ad}_k A-dk\,k^{-1}\) and
\(f^*F_{\hat A}=\operatorname{Ad}_k F_A\) show that the connection
and curvature evaluated at the target and pulled back through
the first-jet inverses depend on at most one spatial derivative
of \(h\). The algebraic reconstruction gives the same for the
metric. In particular
\(d_{\hat A}\hat a=F_{\hat A}-F_{\bar A}+
\tfrac12[\hat a\wedge\hat a]\) is first jet in \(h\). The fixed
vertical and live horizontal codifferentials each differentiate
one of these first-jet expressions once. Evaluating a target
derivative after composition with \(f\) adds only the
first-jet inverse \(Df^{-1}\) in the chain rule. Lifting, right
translation and section-chart time conversion are algebraic in
values or first jets. This gives the required quasilinear second
order and the smooth prescribed time dependence when \(A(\tau)\)
is supplied. [E28][e28].

At \(\tau=0,h=\mathrm{id},A(0)=\bar A\), both \(\hat a\)
and \(d_{\bar A}\hat a\) vanish. Variation in
\(\phi+\chi_{\bar A}(u)\) gives
\(\delta\hat a=-d_{\bar A}\phi-\mathsf S_{\bar A}u\). The
vertical mixed term differentiates \(u\) once and the horizontal
mixed term uses \(d_{\bar A}^2\phi=[F_{\bar A},\phi]\) before
application of the outside codifferential. Thus the two
second-order Fourier diagonal blocks are precisely
\(-|\zeta|_{\bar h}^2I\) and
\(-\mathsf S^*(w_\zeta^1)^*w_\zeta^1\mathsf S\).
The second block keeps the transverse projection, and the
injection of \(\mathsf S+w_\zeta^0\) gives
\(|w_\zeta^1\mathsf S u|>0\) for \(u\ne0,\zeta\ne0\).
The compact-bundle result applies in the smooth automorphism
section chart over a sufficiently short interval. At line 2381
replace “At the identity” by “At the initial point
\(\tau=0,\ h=\mathrm{id},\ A(0)=\bar A\).” Simply setting
\(h=\mathrm{id}\) later in the prescribed path does not
give the reference coefficients. [E28][e28] ·
[E29][e29] · [Lead local-flow assessment][local].

At lines 2388–2390 specify the ordinary flow for
\(j=g^{-1}\). With \(\xi\)
the fixed-adjustment generator evaluated along the same
adjusted path \(\hat A\), the reverse equation is
\(r(h^{-1})_*\dot h=-\xi\), and the forward recovery is
\(\ell(g^{-1})_*\dot g=\xi\). Differentiating \(g\circ
j=\mathrm{id}\) gives \(\dot j=-\xi\circ j\). Thus the
ordinary smooth invariant vector flow on the compact frame bundle
is \(j\), and its inverse \(g\) recovers the unadjusted solution
by physical equivariance. The derivative of the product satisfies
\(\partial_\tau(gh)=r(h)_*\ell(g)_*\xi-\ell(g)_*r(h)_*\xi=0\).
Both paths start at identity, so \(gh=\mathrm{id}\).
This supplies the stated uniqueness for smooth unadjusted
solutions on a common short interval starting at a smooth
definite \(A(0)\). [E28][e28] · [E29][e29].

### Principal coefficient values and continuous endpoints

**Pass with one wording edit.** Self-duality and Bianchi give
\(v_{\rm F}=*_{h_A}((d_AB_A)\wedge F_A)\), so the only
derivatives of \(F_A\) there are in \(d_AB_A\). In the horizontal
term \(\beta=d_Aa=F_A-F_{\bar A}+\frac12[a\wedge a]\), and
\(d_A^{*h_A}\beta\) includes \(\partial\beta\) and
\(\Gamma(h_A)\beta\). The first contributes \(\partial F_A\)
and lower-order terms. The second contributes
\(D_F h_A[\partial F_A]\) with a coefficient depending on
\(\beta\) and the undifferentiated metric. In components,
\(\partial_\ell F_{ij}=\partial_\ell\partial_i A_j
-\partial_\ell\partial_j A_i+[\partial_\ell A_i,A_j]
+[A_i,\partial_\ell A_j]\). The principal coefficient has
the indicated value dependence. More specifically, its
dependence on the connection values comes through \(a\) in
\(\beta\). In the fixed vertical term the leading coefficient
uses only the fixed metric value; spatial derivatives of the
reference can still occur in the two lower-order coefficients.
Replace “Differentiating either expression produces one
derivative of \(F_A\)” at lines 2408–2409 by “The derivative in
\(d_AB_A\) and the live codifferential on \(d_Aa\) involve at
most one derivative of \(F_A\).” The displayed physical speed
already includes its derivative. [E30][e30].

The symbol margin in the reference pairing is uniform for
reference curvature in a compact definite value set and small
fixed-background differences of both \(A\) and \(F_A\).
Compactness gives the reference margin, and the joint value
map gives the uniform smallness threshold. As described in
E30, E24 supplies these uniform \(C^0\) differences for
sufficiently late smooth fixed references along the given
unadjusted fields. The same coefficient map yields continuous
principal values at the endpoint along that unadjusted path.
This does not give a bound for the symmetric part of the first
jet, spatial derivatives of the fixed reference as that
reference varies, or an adjusted or reverse trajectory with
an adequate limit and controlled local existence time. The
manuscript makes no continuous-endpoint restart inference.
[E26][e26] · [E30][e30] · [Lead recognition assessment][recognition].

## Conditional recognition from an energy-selected time slice

### Static \(L^2\) threshold and cited theorem

**Pass.** From `transport:curvature` and
`transport:curvature-block`,
\(|W^+|_{\rm op,HS}\le\mathfrak R_K\) and
\(s\ge12K-\sqrt{48}\mathfrak R_K
=12K-4\sqrt3\mathfrak R_K\). For a smooth positive \(u\),
the Yamabe quotient in dimension four has numerator
\(\int(6|du|^2+su^2)\,dV\). Apply
\(\int\mathfrak R_Ku^2\,dV\le\|\mathfrak R_K\|_2\|u\|_4^2\)
and use \(12K\ge6K\) with the \(K\)-weighted Sobolev
inequality. The quotient is uniformly bounded below by
\(6/C_S-4\sqrt3\|\mathfrak R_K\|_2\), strictly positive
when \(\|\mathfrak R_K\|_2<\sqrt3/(2C_S)\).
Taking its infimum gives a positive Yamabe constant for the
given conformal class.

Write \(E_\pm=\int|W^\pm|_{\rm op,HS}^2\,dV\).
The homotopy sphere has signature zero, so \(E_-=E_+\).
Each unordered pair of indices is counted twice in a full
four-index contraction, giving
\(|W|_{\rm tensor}^2=4(|W^+|_{\rm op,HS}^2+
|W^-|_{\rm op,HS}^2)\). Its integral is therefore
\(8E_+\le8\|\mathfrak R_K\|_2^2\). As \(\chi=2\),
the strict \(2\pi\) bound gives precisely the strict Weyl
threshold \(16\pi^2\chi=32\pi^2\). I reopened printed
p. 107, Theorem A, equation (0.3) and Remarks 1–2.
The source's hypotheses are a smooth closed four-manifold,
the positive Yamabe constant of the given conformal class,
and that strict Weyl integral in the full tensor norm.
The conclusion is diffeomorphism to \(S^4\) or
\(\mathbb{RP}^4\). Simple connectivity selects \(S^4\), as
stated in the preceding manuscript proof. Both strict
hypotheses thus hold at the displayed minimum threshold.
[Chang–Gursky–Yang, Theorem A and Remarks 1–2][cgy] · [E31][e31].

### Decay, averaging window and scale

**Pass.** Take the smaller of the quadratic and quartic
pinching constants and \(1/8\), and the larger nonlinear
coefficient \(C\). The proposition already consolidates the
two strain estimates with a single such choice. The smooth
unadjusted interval through \(t_*+1/K\) must carry that pinch
and the same \(C_S\). With \(Y=\|T\|_4^2=\sqrt{E_4}\) and
\(G_4=\int |T|^2|\nabla^AT|^2\,dV\), Sobolev, Kato and
Hölder give
\(\int|T|^6\le C_SY(4G_4+KE_4)\).
As long as \(Y\le(2CC_S)^{-1}\), the quartic derivative is
at most \(-6G_4-(K/2)E_4\). The strict initial bound and
first-exit argument give \(Y(s)\le Y_0e^{-Ks/4}\) on the
whole supplied interval. Next
\(C\int|T|^4\le CC_S Y(D_2+KE_2)\le
(D_2+KE_2)/2\), so
\(E_2'\le-D_2/2-KE_2/2\) and
\(E_2(s)\le E_{20}e^{-Ks/2}\). These checks use the instantaneous
metric norms and the strain energy inequalities that already
incorporate the time derivatives of these norms. [E32][e32] ·
[Manuscript, `prop:strain-energy`][tex].

Integration gives \(\int_t^{t+1/K}D_2\,ds\le
2E_{20}e^{-Kt/2}\). Smoothness makes \(D_2\) continuous, so
its value is at most \(2K E_{20}e^{-Kt/2}\) at some slice
in that window. The gradient norm there is at most
\(\sqrt{2KE_{20}}e^{-Kt/4}\). The pointwise fixed
volume and `flow:pinched-decay` give
\(\mathcal P(s)=2K^2\|q(s)\|_2^2\le
e^{-36Ks}\mathcal P(0)\), hence defect norm decay
\(\|q(s)\|_2\le Q_{20}e^{-18Ks}\).
These imply exactly the two-term bound in lines 4012–4015.
In particular the factor on the gradient term is
\(6\sqrt{2KE_{20}}\), and \(c_RY_0\) uses
\(\||T|^2\|_2=Y\). [E32][e32] · [Lead recognition assessment][recognition].

For \(A_*>0\) and \(2A_*\le\theta\), the bound at \(t_*=0\)
is at most \(\theta/2\). For \(2A_*>\theta\) the logarithmic
waiting time gives equality in the upper bound \(\theta/2\).
When \(A_*=0\), the bound is zero in the window with \(t=0\).
The published criterion is strict in all cases because
\(\theta>0\). The branch in line 3989 gives the correct
convention. Displaying \(t_*\) with two explicit branches
would avoid writing a logarithm whose argument is zero in that
case.

Under \(K\mapsto\lambda K\) at fixed connection,
\(\widehat g\mapsto\lambda^{-1}\widehat g\) and
\(dV\mapsto\lambda^{-2}dV\). The tensor \(q\) is unchanged,
while the pointwise norms of \(T\) and \(\nabla^AT\) scale
by \(\lambda^{1/2}\) and \(\lambda\), respectively, since
the Levi–Civita connection is unchanged under constant
dilation. Thus \(\mathfrak R_K\mapsto\lambda\mathfrak R_K\)
and its \(L^2\) norm is invariant. Both sides of the Sobolev
inequality scale by \(\lambda^{-1}\), leaving \(C_S\) and
\(\theta\) invariant. The three summands of \(A_*\) likewise
remain unchanged because \(Q_{20}\) and \(E_{20}\) scale by
\(\lambda^{-1}\) and \(Y_0\) remains unchanged. The adjoint in
the unadjusted gradient scales by \(\lambda\), so the
renormalized time is \(t/\lambda\). Both \(t_*\) and \(1/K\)
scale this way. This is the manuscript metric and clock in
the recognition subsection. [E31][e31] · [E32][e32].

The proof gives one qualifying slice from an already supplied
finite interval. A small temporal budget may supply the
pinching and Sobolev bounds on a smooth segment under its
stated hypotheses. Existence of the input geometry, persistence
of the interval hypotheses, endpoint restart and convergence
remain outside the result. [Lead recognition assessment][recognition].

[req]: ../research-progress/handoffs/SP4-CME-E33_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E33_RETURN_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e26]: ../notes/26_FINE_GAUGE_ENDPOINT_GAP_20261122.md
[e27]: ../notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[e28]: ../notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e29]: ../notes/29_LOCAL_PARABOLIC_INPUT_20261122.md
[e30]: ../notes/30_CURVATURE_COEFFICIENT_REGION_20261122.md
[e31]: ../notes/31_L2_TRANSPORT_SPHERE_CRITERION_20261122.md
[e32]: ../notes/32_ENERGY_SELECTED_SLICE_20261122.md
[local]: E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md
[recognition]: E30_E32_RECOGNITION_ASSESSMENT_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2#S4.SS2
[taylor]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf#page=147
[cgy]: https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3
