# SP4-CME-E29 — Local parabolic input for the corrected adjusted equation

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This finite smooth initial-value check follows [B24][decision] and
the [frozen request][request]. The [return][return] records input
identities and source access.

The corrected E27 equation has a smooth local solution for smooth
definite data when the reference is the initial connection.
The primary system estimate used here is Taylor's 1991 monograph.
The compact-bundle passage is justified below. The statement concerns
the adjusted equation with the vertical adjoint frozen.

## Primary source and differentiation convention

Fine v2, §4.2, after Theorem 4.10 and before the reverse
equation (4.8), cites Taylor's Proposition 8.1 as a parabolic
input. The 2011 second-edition publisher lists Chapter 15,
*Nonlinear Parabolic Equations*, on pp. 313–411, and Taylor's
author page identifies §8 as the sharper quasilinear section.
The chapter PDF was unavailable through the publisher's
subscription preview. A surfaced full-text mirror timed out
and a section preview returned an access check. The exact
statement and printed page of the cited Proposition 8.1 were
therefore not verified in that edition.
[Fine v2 §4.2][fine] · [Taylor 2011 chapter metadata][springer] ·
[Taylor's chapter and section list][author].

An accessible primary alternative is Michael E. Taylor,
*Pseudodifferential Operators and Nonlinear PDE* (1991),
Chapter 7. Equations (7.3.1)–(7.3.2), printed p. 147, concern
\(u_t=F(t,x,D_x^2 u)\) for \(u\) with real vector values and
smooth \(F\) of the full spatial jet through order two. The
condition is positivity of the negative Hermitian part of the
Fourier principal symbol. It does not require symmetric matrices.
Proposition 7.3.A, printed p. 149, gives a unique short-time
solution in \(C([0,T),H^s)\cap C^\infty((0,T)\times M)\)
for \(s>n/2+2\) and a strongly parabolic system. The
quasilinear form with first-jet coefficients occurs at (7.3.18),
and Proposition 7.3.B on the same page gives the sharper
\(s>n/2+1\) assertion and persistence under a \(C^{1+r}\) bound
for \(r>0\) in that formulation. Chapter 7 takes \(M\) to
be a torus for simplicity in §7.1, printed p. 141. We use
the strong Hermitian condition and a conservative Sobolev
energy argument, with the smooth compact-bundle construction
given below.
[Taylor 1991, §7.1 and §7.3][taylor].

## Matching the corrected connection equation

Let \(M\) be a smooth closed oriented real four-manifold and
\(E\) the fixed oriented Euclidean rank-three bundle, in Fine's
positive definite component. Retain Fine's native internal
pairing and metric \(g_A\) with curvature volume, and the native
time. Fix a smooth positive definite \(\bar A\), set
\(\bar g=g_{\bar A}\) and \(a=A-\bar A\), and write
\(S_A(Y)=\iota_Y F_A\). The unknown \(a\) is a section of the
real rank-twelve bundle
\(\mathcal W=T^*M\otimes\mathfrak{so}(E)\).
The corrected equation is
\[
\partial_t a
=v(\bar A+a)
-d_A d_A^{*\bar g} a
-S_A S_A^*d_A^{*g_A}d_A a .
\tag{1}
\]
Here \(v(A)=-d_A^{*g_A}(B_A F_A)\) with
\(B_A=4Q-\tfrac23\operatorname{tr}(Q^2)I\), and
\(S_A^*\) uses the native \(g_A\) and internal pairing.
The adjoint \(d_A^{*\bar g}\) varies with \(A\) in the
zeroth-order connection coefficient and uses a fixed base metric.
[Fine v2 Prop. 4.2][fine] · [E27 corrected operator][operator].

Use the fixed smooth metric \(h=\bar g\), its native internal
pairing on \(\mathcal W\), and a compatible reference connection
\(D\) on \(\mathcal W\). In terms of \(D\), (1)
has the intrinsic local form
\[
\partial_t a=\mathsf A^{ij}(x,a,Da) D_iD_j a
                    +\mathsf B(x,a,Da).
\tag{2}
\]
The curvature \(F_A=F_{\bar A}+d_{\bar A}a+
[a\wedge a]/2\) is smooth in the first jet. On the open
definite first-jet set, \(Q,g_A, g_A^{-1}, B_A, S_A,S_A^*\)
are smooth functions of that jet. In the two live two-form
codifferentials, applying one derivative to \(F_A\), to
\(d_A a\), or to a \(g_A\) coefficient yields a second jet
linearly, with first-jet factors. The outer \(S_A S_A^*\)
is algebraic. In the vertical term the fixed metric prevents
an additional derivative of a live coefficient, while the
outer covariant derivative differentiates the first-order
codifferential at most once. This gives (2), with smooth
coefficients and no derivatives of order three. Local
trivializations agree because (1) is an equation for a
tensorial connection difference.

In the Fourier convention \(\partial_j\mapsto i\xi_j\),
E27's reference calculation at \(a=0\) gives
\[
-\sigma_2(\xi)=H_\xi^*H_\xi+
 S_{\bar A}S_{\bar A}^*w_{1,\xi}^*w_{1,\xi}
 +w_{0,\xi}w_{0,\xi}^* .
\]
Here \(w_{p,\xi}\) denotes wedge by \(\xi\) on forms of
degree \(p\), and \(H_\xi=P_{\bar A}w_{1,\xi}\) uses
the physical gradient factorization. Its horizontal product
can be nonsymmetric. On unit covectors,
the E27 splitting into \(b=\xi\otimes x+c\) bounds the
real quadratic form of \(-\sigma_2\) below by
\[
|H_\xi c|^2+(1-\sqrt3/2)(|S_{\bar A}^*c|^2+|x|^2).
\]
The exact sequence used in E27 makes this vanish only
at \(b=0\). Uniform negativity of the real part of
\(\sigma_2\) follows by taking the minimum on the compact
unit cosphere and unit amplitude bundle. For a real matrix
the same quadratic bound on its symmetric part holds on
complex amplitudes in the Hermitian pairing, by separating
real and imaginary parts. Relative to the fixed \(h\) this
is precisely
\[
\operatorname{Re}\left\langle
\mathsf A^{ij}(x,a,Da)\xi_i\xi_j z,z
\right\rangle\geq c\,|\xi|_h^2|z|^2
\]
for jets sufficiently close to zero. Smooth dependence extends
the inequality to a fixed uniform first-jet neighborhood
there. Positivity of the definite curvature plane and the
chosen determinant sign also persist on a sufficiently small
such neighborhood. [E27 symbol and coercivity][operator].

## Extension of the primary proof to the closed bundle

Here a compact-bundle argument is needed even though the
source system proof uses a torus to simplify notation.
The following gives the extension at the sole regularity
needed here, namely smooth initial data.

1. Choose a smooth cutoff of the norm of \((a,Da)\) in the
   fixed bundle metrics, equal to one on a smaller uniform
   jet neighborhood of zero and supported in the one
   just verified. Interpolate \(\mathsf A\) to \(h^{ij}I\)
   outside the cutoff and multiply \(\mathsf B\) by the
   cutoff. The resulting smooth globally defined jet
   coefficients preserve the strict quadratic symbol
   because the interpolation is convex. This is a device
   for solving a system that agrees with (1) near the
   initial section.
2. In the \(L^2\) space of \((h,\mathcal W)\) let
   \(\Lambda=(I+D^*D)^{1/2}\). Use the finite spectral
   projections \(J_N\) of \(\Lambda\), which are self-adjoint
   and commute with \(\Lambda^s\). The fixed positive
   elliptic operator \(I+D^*D\) has compact inverse by
   its elliptic estimate and compact Sobolev embedding.
   Its spectral basis consists of smooth sections by
   elliptic regularity. For even integer \(s\), the
   differential operator \(\Lambda^s\) has scalar
   principal symbol and its \(L^2\) graph norm is
   equivalent to \(H^s(\mathcal W)\).
   This replaces the torus smoothing used in the source by
   finite-dimensional ODEs with initial data \(J_Na(0)\).
3. To see the needed Gårding estimate on the bundle,
   choose a finite family of coordinate trivializations
   and a quadratic partition of unity \(\sum\psi_\alpha^2=1\).
   On each chart freeze the principal coefficient and the
   smooth density at a point. Plancherel and the strict
   symmetric-part bound control the quadratic form of each
   frozen operator on \(\psi_\alpha w\). For coefficients
   with bounded \(C^1\) norm, taking the charts small makes
   the variation a uniformly small multiple of
   \(\|Dw\|_2^2\), absorbed in the frozen bound.
   Integration by parts produces only first derivatives
   of the coefficients and first-order terms from the
   density and frame or cutoffs. They are bounded by a
   constant times \(\|w\|_{H^1}\|w\|_2+\|w\|_2^2\).
   In particular the positive Fourier-symbol estimate
   suffices, and no stronger pointwise positivity of the
   coefficient array on all matrices is being used.
4. For an even \(s\ge6\), pair the projected equation
   with \(\Lambda^{2s}a_N\). The projection drops out of the
   pairing. The leading term is estimated by the previous
   step on \(\Lambda^s a_N\). With \(\|a_N\|_{C^2}\)
   bounded, the \(H^s\) norms of \(\mathsf A(x,a_N,Da_N)\)
   and \(\mathsf B(x,a_N,Da_N)\) are bounded by
   \(C_s(1+\|a_N\|_{H^{s+1}})\) by the smooth composition
   estimate. In a chart, the commutator of \(\Lambda^s\)
   with a coefficient acting on \(D^2a_N\) is bounded in
   \(L^2\) by a constant times
   \[
   \|\mathsf A\|_{C^1}\|a_N\|_{H^{s+1}}
       +\|\mathsf A\|_{H^s}\|a_N\|_{C^2}.
   \]
   Local cutoffs and fixed connection contributions have
   the same or lower order. Commuting \(\Lambda^s\) past the
   fixed second derivative itself has order at most
   \(s+1\), because the leading symbol of \(\Lambda^s\) is
   scalar. These are the source's tame estimates in finitely
   many smooth frames. Young's inequality then gives
   \[
   \frac{d}{dt}\|\Lambda^sa_N\|_2^2+
   c_1\|a_N\|_{H^{s+1}}^2
   \leq C_s(\|a_N\|_{C^2})(1+\|a_N\|_{H^s}^2).
   \tag{3}
   \]
   The constants can depend on the fixed chart data and a
   common ellipticity margin, and are independent of \(N\).
5. Since \(H^6\) embeds in \(C^2\) in dimension four, (3)
   with \(s=6\) gives a uniform short interval with bounded
   \(H^6\) norm. On this same interval (3) at each higher
   even \(s\) gives uniform bounds since its coefficient
   depends on the same \(C^2\) bound, and the smooth
   datum bounds all initial Sobolev norms. The projected
   equation bounds \(\partial_t a_N\) in \(H^{s-2}\).
   Interpolation and compact embedding then give a
   subsequence converging in \(C([0,T'],H^{s-1})\)
   on a common smaller interval for every even \(s\),
   by diagonal extraction. This suffices to pass the
   coefficients, the second derivatives and the spectral
   projections to the limit. The limit has the stated
   strong trace and is continuous in every spatial Sobolev
   space. Its time derivatives follow by differentiating (2)
   and are smooth up to the initial slice. In particular
   \(H^6\) continuity gives \(C^1\) continuity, so a further
   short restriction keeps all jets in the region where
   the cutoff is identically one. The result solves (1)
   there and remains definite and strongly parabolic.

For clarity, the partition, estimates and spectral cutoff above
take place on the fixed smooth bundle. The primary analytic
inputs of this passage are Taylor's local elliptic calculus
in §2.2, the smooth composition estimate (3.1.20), the
commutator estimate Proposition 3.6.A, and the parabolic
energy scheme (7.1.3)–(7.1.15). The localized coercivity
argument uses the same Hermitian-part hypothesis as his
Corollary 4.3.C. [Taylor 1991, §§0.12, 2.2, 3.1, 3.6, 4.3
and 7.1][taylor].

The uniqueness class for this application can be taken as
\(C([0,T'],H^6(\mathcal W))\cap
C^1([0,T'],H^4(\mathcal W))\) solutions with jets in the
specified parabolic neighborhood. Subtract two such equations,
extending both by the cutoff if necessary. The difference is
a linear system with the leading coefficient of one solution
and bounded first- and zeroth-order coefficients, by the mean
value formula in the first jet and the \(C^2\) bound of both
solutions. The \(L^2\) Gårding estimate above and Young's
inequality give \(d\|a-\widetilde a\|_2^2/dt\leq
C\|a-\widetilde a\|_2^2\). Gronwall gives uniqueness for equal
initial data. The smooth solution built above lies in this
class. When the initial connection is an arbitrary smooth
definite \(A_0\), choosing \(\bar A=A_0\) makes the initial
section zero. Smooth data sufficiently close to a fixed
reference in the chosen first-jet region also fit the proof.

## Time dependence and the remaining boundary

Taylor's primary system theorem (7.3.1) explicitly allows
\(t\)-dependence. The compact-bundle proof above is the same
with \(\mathsf A(t,x,a,Da)\) and \(\mathsf B(t,x,a,Da)\):
the cutoff, quadratic margin and coefficient bounds are
chosen on a short compact time interval. The Galerkin ODE
and estimates use these bounds uniformly, and time
differentiation uses smoothness in \(t\). Thus the required
time-dependent short-time theorem is available for a reverse
automorphism equation **once** it is put in a smooth section
chart with that verified order, ellipticity and initial
datum. Identifying its symbol, invoking this theorem in that
chart, and checking the correspondence belong to the
separate reverse-gauge assessment.
[Taylor 1991, (7.3.1)–(7.3.2) and Prop. 7.3.A][taylor].

The lifespan in this construction depends on the Sobolev
trace, the smooth fixed reference data, the parabolic
margin, and spatial coefficient bounds. The algebraic
curvature bounds alone do not supply these. E24's continuous
connection and curvature limit does not meet the smooth
trace or even the full first-jet input used here. This local
result therefore supplies no continuous-endpoint restart,
global solution or convergence theorem. [E26 endpoint
regularity audit][endpoint].

[decision]: ../brainstorm/notes/B24_LOCAL_GAUGE_CLOSURE_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E29_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E29_RETURN_v1.md
[operator]: 27_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[endpoint]: 26_FINE_GAUGE_ENDPOINT_GAP_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2#S4.SS2
[springer]: https://link.springer.com/chapter/10.1007/978-1-4419-7049-7_3
[author]: https://mtaylor.web.unc.edu/books-and-monographs/partial-differential-equations-vols-1-3/partial-differential-equations-iii-nonlinear-equations/
[taylor]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
