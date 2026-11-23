# E231 Conditional spectral-margin-weighted flow criterion

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B108, configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored inherited E220 and audited
the related intermittent manuscript integration in E214. The present
application uses the assessed formulas from that work. The following
separate premise stays conditional.

**\(H_{\rm linear}\).** In the old \(K=1\) pointwise conventions,
for every \(1\le r<7/2\) and every positive trace-three \(Q\) with
\(\rho(Q)=\lambda_{\max}(Q)/\lambda_{\min}(Q)\le r\), the full derivative
form on the actual stationary kernel obeys
\[
 R_Q(X)\ge k(7/2-r)|X|^2
 \qquad\text{if } V_Q(X)=0,
\]
for one fixed explicit \(k>0\). The proof below keeps \(k\) symbolic.
It uses this premise at its stated strict-subregion scope. No E229
result is an input. [B108](../brainstorm/notes/B108_LINEAR_SPECTRAL_MARGIN_20261123.md).

## Native inequality at a supplied smooth slice

Let \(M\) be a smooth closed connected oriented real four-manifold
with a supplied smooth definite connection \(A\) on a smooth principal
\(SO(3)\) bundle. The curvature planes are positive and the curvature-map
sign is round-compatible. The Riemannian metric \(g_A\) is the native
reconstructed one, with the negative-Killing internal pairing. Put
\[
 \begin{aligned}
 q&=Q-I,\qquad
 \mathcal E(A)=\int_M|q|^2\,dV_{g_A},\\
 \mathscr D(A)&=\int_M|V_{\rm n}|^2_{g_A,\,2\delta}\,dV_{g_A},
 \qquad
 \mathscr G(A)=\int_M|\nabla^AQ|^2_{g_A}\,dV_{g_A}.
 \end{aligned}
\]
The endomorphism norm is Frobenius and the base covector slot uses
the indicated metric. Suppose \(\sup_M\rho(Q)\le r\) for some
\(1\le r<7/2\), and put \(\epsilon=7/2-r\) and \(\kappa=k\epsilon\).

Use the old reconstruction at any fixed \(K>0\), with metric
\(\widehat g\), internal pairing \(\delta\), \(F=-KQ^{1/2}\Sigma\),
and \(\mu_{\rm o}=2K^2dV_{\widehat g}\). The assessed matched,
oriented eigenframe and chiral coframe adapt the full form
tensorially even at repeated spectra. In such an orthonormal frame
the old \(R_Q\) has the coefficients of the \(K=1\) form, since
the common \(K\) cancels in the Bianchi recovery. Its velocity has
the same zero space because its components acquire the common factor
\(K\). Thus \(H_{\rm linear}\) supplies \(\kappa|X|^2\) on the true
stationary kernel in these frames.

By E220/E222, the full symmetric polarization \(B_Q\) is bounded
in Frobenius norm by \(L_0=120\) throughout the closed ratio
\(7/2\) region. For \(X=X_0+X_\perp\), its orthogonal decomposition
relative to the actual zero-speed space, the normal component is
the minimum-norm preimage of the velocity. The assessed diagonal
right inverse gives
\[
 |X_\perp|^2\le \frac{|V_{\rm o}(X)|^2_{\widehat g,\delta}}{2K^2}.
\]
This is the bound \(3/(16K^2c^2)\le1/(2K^2)\) for \(c^2=\lambda_{\min}(Q)
\ge3/8\). The same spectral floor gives
\(\sqrt{\det Q}\ge(3/8)^{3/2}>1/5\).
Both the full symmetric form and this speed complement are taken
in the exact older conventions of the assessed proof.
[E220 derivation](220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md) ·
[E220/E222 assessment](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md).

Apply the kernel inequality and Young's inequality:
\[
 \begin{aligned}
 R_Q(X)
 &\ge \kappa|X_0|^2-2L_0|X_0|\,|X_\perp|-L_0|X_\perp|^2\\
 &\ge \tfrac{\kappa}{2}|X|^2-
             (2L_0^2/\kappa+L_0+\kappa/2)|X_\perp|^2\\
 &\ge \tfrac{\kappa}{2}|X|^2
              -\frac{C(\epsilon)}{K^2}|V_{\rm o}(X)|^2_{\widehat g,\delta},
 \qquad C(\epsilon)=\tfrac12(2L_0^2/(k\epsilon)+L_0+k\epsilon/2).
 \end{aligned}
\]
The second line uses \(|X_0|^2=|X|^2-|X_\perp|^2\).

Write
\(\mathcal P_{\rm o}=\int_M|q|^2\mu_{\rm o}\),
\(\mathscr G_{\rm o}=\int_M|\nabla^AQ|^2_{\widehat g}\mu_{\rm o}\),
and \(\mathscr D_{\rm o}=\int_M|V_{\rm o}|^2_{\widehat g,\delta}
dV_{\widehat g}\). The assessed instantaneous integrated identity
on the old original velocity tangent is
\[
 \mathscr D_{\rm o}
   =2\int_M R_Q(\nabla^AQ)\,\mu_{\rm o}
       +48K\int_M\sqrt{\det Q}\,|q|^2\,\mu_{\rm o}.
\]
Here \(\mathscr D_{\rm o}\) is the negative first variation of
\(\mathcal P_{\rm o}\) along \(V_{\rm o}\) for the old
\(dV_{\widehat g}\) pairing. The two terms on the right use
\(\mu_{\rm o}\). The identity holds statically by evaluating at
the first tangent of \(A+\sigma V_{\rm o}(A)\). The assessed
tangent calculation uses the pointwise zero volume derivative
and the exact nonlinear quotient identity at \(\sigma=0\).
Thus the spectral assumption is imposed at \(A\).
Substituting the full pointwise lower bound costs
\[
 \frac{2C(\epsilon)}{K^2}\int_M |V_{\rm o}|^2_{\widehat g,\delta}\mu_{\rm o}
 =4C(\epsilon)\mathscr D_{\rm o}.
\]
The determinant floor therefore gives
\[
 (1+4C(\epsilon))\mathscr D_{\rm o}\ge
      k\epsilon\,\mathscr G_{\rm o}+\frac{48K}{5}\mathcal P_{\rm o}.
\]
[E220/E222 old measures and tangent identity](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md).

Under the native pairing \(2\delta\), the wedge numerator and
volume double, leaving \(Q\) and its ratio unchanged. Hence
\(g_A=2K\widehat g\), \(dV_{g_A}=2\mu_{\rm o}\) and
\(\mathcal E=2\mathcal P_{\rm o}\). The velocity one-form is
\(V_{\rm n}=(2K)^{-1}V_{\rm o}\), with native time
\(t=2K t_{\rm o}\). Indeed the old-to-native adjoint from
two-forms to one-forms scales by \((2K)^{-1}\) and the constant
internal doubling cancels in that adjoint. Its squared velocity
norm gains \(2(2K)^{-3}\) from the internal pairing, inverse metric
and speed scaling. Since \(dV_{g_A}=(2K)^2dV_{\widehat g}\),
\(\mathscr D=\mathscr D_{\rm o}/K\). The Frobenius endomorphism
norm in \(\mathscr G\) is unchanged and its covector and volume
factors give \(2/(2K)=1/K\) relative to the old \(\mu_{\rm o}\)
integral, hence \(\mathscr G=\mathscr G_{\rm o}/K\). Along the
original native clock \(d\mathcal E/dt=-\mathscr D\).
Dividing the old inequality by \(K\) gives
\[
 (1+4C(\epsilon))\mathscr D
     \ge k\epsilon\,\mathscr G+\tfrac{24}{5}\mathcal E.
\]

The proposed constant follows from the exact identity
\[
 \epsilon(1+4C(\epsilon))
   =(1+2L_0)\epsilon+\frac{4L_0^2}{k}+k\epsilon^2
   =241\epsilon+\frac{57600}{k}+k\epsilon^2
   \le H,\qquad H=\frac{1205}{2}+\frac{57600}{k}+\frac{25k}{4}.
\]
Here \(0<\epsilon\le5/2\). Taking the reciprocal in the last
inequality yields the specified static estimate
\[
 \boxed{\mathscr D\ge\gamma_0\epsilon\,\mathcal E+
                     \beta_0\epsilon^2\mathscr G,\qquad
          \gamma_0=\frac{24}{5H},\qquad \beta_0=\frac{k}{H}.}
 \tag{1}
\]
The constants are independent of \(K\), the base, the bundle and
the slice. If \(r=1\), trace three and the ratio bound give \(Q=I\).
Then \(q=0\), \(\nabla^AQ=0\), and the original velocity vanishes
because its coefficient \(q-|q|^2I/6\) is zero. The derivation uses
a positive margin throughout the static estimate.

## Weighted energy on the actual lifespan

Let \(A(t)\), \(0\le t<T_*\), be a supplied maximal smooth original
native trajectory in the stated class on the general closed base.
Set
\[
 R_*(t)=\sup_M\rho(Q(A(t))),\qquad
 w(t)=(7/2-R_*(t))_+,\qquad
 \Theta(t)=\int_0^t w(s)\,ds .
\]
On each compact slab within the actual lifespan, the smooth positive
\(Q\) has a positive minimum eigenvalue. The extremal eigenvalues
are continuous in operator norm by their Rayleigh quotient formulas.
The ratio is uniformly continuous on the slab, and the difference
of two spatial suprema is bounded by the supremum of the pointwise
difference. It follows that \(R_*\) and \(w\) are continuous, hence
Borel. In particular \(0\le w\le5/2\) and \(\Theta\) is absolutely
continuous on all compact slabs with \(\Theta'=w\).

At a time with \(w>0\), choose \(r=R_*(t)\) in (1), so the actual
margin is exactly \(\epsilon=w(t)\). At a time with \(w=0\),
including \(R_*(t)>7/2\), use only \(\mathscr D\ge0\).
The original energy identity therefore gives
\[
 \mathcal E'+\gamma_0 w\mathcal E+\beta_0 w^2\mathscr G\le0
\]
throughout the smooth lifespan. On each compact slab the factor
\(f=e^{\gamma_0\Theta}\) and \(f\mathcal E\) are absolutely
continuous, with \(f'=\gamma_0 w f\). Hence
\((f\mathcal E)'\le-\beta_0 f w^2\mathscr G\), and \(f(0)=1\)
gives
\[
 \boxed{ e^{\gamma_0\Theta(t)}\mathcal E(t)
      +\beta_0\int_0^t e^{\gamma_0\Theta(s)}w(s)^2
                                \mathscr G(s)\,ds
         \le\mathcal E(0),\qquad 0\le t<T_* .}
 \tag{2}
\]
No derivative of \(w\) or division by \(\mathcal E\) occurs. For a
round trajectory \(w=5/2\), \(\Theta=5t/2\) and both terms on the
left vanish. If \(\mathcal E(0)=0\), the nonnegative energy remains
zero. All arguments are available on arbitrary compact initial
slabs, giving (2) on the entire actual lifespan of the supplied
general-base solution.
[Assessed intermittent integrating-factor argument](../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md).

## Round entry under a bounded geometric late sequence

In addition assume that \(M\) is a smooth closed oriented homotopy
four-sphere, with \(P\) and the maximal original trajectory fixed.
Suppose the same unshifted sequence \(t_n\uparrow T_*\) satisfies
\[
 \sup_M\Psi(A(t_n))\le P_0,\qquad
 \operatorname{diam}(M,g_{A(t_n)})\le D_0,\qquad
 0\le P_0<\infty,\quad 0<D_0<\infty .
\]
The density \(\Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2\)
is the assessed native real whole-sphere transport density, with
\(\mathcal R_X(f)=P_{f^\perp}(Q^{-1/2}D_X^AQ\,Q^{-1/2})_0f/2\).
It uses the unit internal sphere of area \(4\pi\), the chiral
Levi–Civita horizontal derivative and the live base covector
derivative. These two bounds on one late sequence for
the stated class give \(T_*=\infty\) by the assessed
E179/E181 finite-endpoint continuation implication, independently
of the weighted occupation assumption.
[E179/E181 geometric sequence and zero-energy branch](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md).

1. **Infinite weighted occupation.** If
   \(\Theta(\infty)=\lim_{t\to\infty}\Theta(t)=\infty\), (2) gives
   \(\mathcal E(t)\le e^{-\gamma_0\Theta(t)}\mathcal E(0)\to0\).
   The assessed zero-limiting-energy branch then gives convergence
   of the actual original connection–curvature pair to one
   fixed round pullback. This branch uses a perfect positive-time
   limit after one common shift and one fixed sufficiently late
   round-basin datum to obtain the entire original tail by
   naturality and uniqueness.
2. **Finite observation.** Let \(\delta(P_0,D_0)>0\) be the assessed
   non-effective uniform intrinsic entry threshold. If for one
   geometrically qualifying unshifted \(t_n\) one has
   \[
        \mathcal E(0)e^{-\gamma_0\Theta(t_n)}<\delta(P_0,D_0),
   \]
   then (2) gives a strictly subthreshold original datum \(A(t_n)\)
   with the two bounds already present. The assessed uniform
   theorem yields a smooth global original solution from that
   datum and a fixed round tail. Translating its origin to \(t_n\)
   and applying recentered smooth original uniqueness at every
   common smooth slice identifies this tail with the supplied
   original solution. No positive margin at the observation
   slice is needed.

In both cases on the actual fixed bundle the limiting pair is
\(L_\infty^*(A_0,F_0)\) for one smooth equivariant bundle isomorphism
to the standard round bundle over an orientation-preserving
diffeomorphism to \(S^4\). The inherited rate of the fixed
round-basin solution is \(\lambda_1(G_0)/2>0\) in native time.
The fixed smooth pullback and finite time translation preserve
that exponent, with datum-dependent constants for each fixed
\(C^k\) norm in a fixed smooth background. This pair estimate
uses the native clock. Equation (2) controls energy in the
weighted occupation clock.
[E182/E183/E185 uniform threshold](../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) ·
[E179/E181 fixed round transfer](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) ·
[E205/E206 native rate and map check](../reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md).

The finite observation uses the integral through \(t_n\) only.
Its round conclusion implies uniform \(Q(t)\to I\) by continuity
of the normalized wedge quotient at the smooth positive perfect
limit. Consequently \(R_*(t)\to1\), \(w(t)\to5/2\), and total
weighted occupation is infinite on that qualifying trajectory.
For comparison of the scalar time conditions alone, the
continuous profile \(\widehat R(t)=7/2-(1+t)^{-1}\) has margin
\((1+t)^{-1}\) and divergent integrated margin \(\log(1+t)\).
For every fixed \(1\le r<7/2\), its sublevel set
\(\{\widehat R\le r\}\) is bounded or empty, since membership
requires \(1+t\le (7/2-r)^{-1}\). This example compares
time-profile assumptions without asserting realization by a flow.
[E212/E213 finite observation correction](../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md).

## Scope and input identities

The new combination is conditional on the symbolic positive
\(k\) in \(H_{\rm linear}\). It uses no asserted estimate on the
closed endpoint when the margin vanishes. The round-entry
conclusions apply under the stated homotopy-sphere sequence
hypotheses. Waiting-time bounds, occurrence of the weighted
condition, spectral preservation and initial-data construction
remain outside this result. Primary-source roles and exact
hypotheses are inherited through the cited assessments.

| Artifact | SHA-256 |
| --- | --- |
| [E231 request](../research-progress/handoffs/SP4-CME-E231_REQUEST_v1.md) | 70f46909154ecaa5c569f032b85fca3e55ee866ae6d8e9084c7bd27934fe362b |
| [B108](../brainstorm/notes/B108_LINEAR_SPECTRAL_MARGIN_20261123.md) | f17210f4e9d9e5d2c8839b2413794cab0d03309368ce5d872b99cc35de385c6f |
| [E220 derivation](220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md) | c9e3e7ca52f86c830e391f9c39d84207a455c95772001bb561c607842be010f2 |
| [E220/E222 assessment](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E212/E213 assessment](../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md) | 63942e67c937280a0ea88f635d79be51c81b6e54f873e6b1bccf9ad2529ead3c |
| [E179/E181 assessment](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) | 0c9eb889bb10092e631fb3bea7d06e0120934e6a80682e9f3a05b2d1ff7d3881 |
| [E182/E185 assessment](../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) | 0f55dfd759e5dfd1f86e69cc7bd201688de0a2cf5e2bd9ce68414f9ffe96761f |
| [E205/E206 assessment](../reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) | bca701d680e3e0f66dca5c56ba4caa3edb43c0005b8a94d7db4c2225b49858aa |
