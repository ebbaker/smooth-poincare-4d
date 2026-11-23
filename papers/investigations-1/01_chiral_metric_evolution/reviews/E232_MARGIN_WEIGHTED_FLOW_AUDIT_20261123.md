# E232 Independent audit of the margin-weighted original flow criterion

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E audit under B108. Configured execution
metadata gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored the earlier E209 gradient
absorption, E212 occupation argument, E183 uniform-entry combination,
and E76 limiting recovery, and audited E181 and E206. I also authored
E229, which is outside this packet. I did not author E231. The verdict
below is on the frozen E231 implication from the stated
\(H_{\rm linear}\) with symbolic \(k>0\).

**Conditional pass.** The pointwise, integrated, and native-clock factors
agree with the frozen proof. Both late-sequence criteria identify an
actual original tail on the fixed bundle. In any integration, write the
polarization estimate explicitly as \(|B_Q(X,Y)|\le120|X||Y|\).
This is the operator norm associated to the Frobenius jet pairing.
The wording “bounded in Frobenius norm” in E231 could instead be read
as a bound on the Hilbert–Schmidt norm of the representing matrix.
The proof uses the correct bilinear bound.
[Frozen E231](../notes/231_CONDITIONAL_MARGIN_WEIGHTED_FLOW_20261123.md).

## Frame and scale transfer, and the velocity complement

The static datum is a smooth definite \(SO(3)\) connection on a
smooth closed connected oriented real four-manifold, with positive
curvature planes and the round-compatible sign. In the old
\(\delta\)-pairing and old metric \(\widehat g\), the signed curvature
polar map \(-F^\sharp Q^{-1/2}/(\sqrt2K)\) identifies an oriented
internal frame with an oriented orthonormal frame in
\(\Lambda^+_{\widehat g}\). Choose an ordered oriented eigenbasis
pointwise. The surjective oriented coframe action on the positive
chiral triples gives a matched coframe with \(F=-KQ^{1/2}\Sigma\).
This works at repeated eigenvalues. The first-jet coordinates are
values of the tensor \(X=\nabla^AQ\), so the choice does not require
derivatives of an eigenbasis. Conjugation of internal endomorphisms
and rotation of the base covector slot preserve the jet norm, the full
quadratic form and the stationary kernel. In the old orthonormal
coordinates the common factor \(K\) cancels in Bianchi and hence does
not enter the coefficients of \(R_Q\). The velocity components
gain \(K\), with the same kernel. Thus the \(K=1\) premise applies at
every point and every fixed \(K>0\), with its prescribed jet norm.
[Assessed frame and scale formulas](../notes/220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md).

For the complement check, write \(S=Q^{1/2}=cD\),
\(D=\operatorname{diag}(d_1,d_2,d_3)=\operatorname{diag}(1,u,v)\)
and \(c^2=3/(1+u^2+v^2)\). The closed ratio bound \(v^2\le7/2\)
gives \(c^2\ge3/8\). In each one-form coefficient the substitution
\(C_a=X_a-\operatorname{tr}(QX_a)I/3\) maps trace-free symmetric
matrices to \(\operatorname{tr}(D^2 C_a)=0\). Ordinary trace-free
projection is the inverse and contracts the Frobenius norm. With the
assessed chiral quaternion action \(J_i\), the speed row
\(W_i=\sum_j d_j J_j C_{ij}\) satisfies
\(V_{{\rm o},i}=-4KcW_i\) and
\(\sum_i d_i J_iW_i=0\). For the latter identity the off-diagonal
terms cancel in pairs and the diagonal sum is the negative weighted
trace. To invert on that relation space, set
\[
 C_{11}=-J_1W_1/d_1,\qquad C_{22}=-J_2W_2/d_2,\qquad
 C_{33}=-(d_1^2C_{11}+d_2^2C_{22})/d_3^2,\qquad C_{ij}=0\ (i\ne j).
\]
The first two velocity rows recover \(W_1,W_2\) since \(J_i^2=-I\),
and the relation fixes the third row since \(d_3J_3\) is invertible.
The relation has four independent scalar equations by surjectivity
of the first block, giving rank eight for the speed. The displayed
preimage obeys \(|C_{33}|^2\le2(|C_{11}|^2+|C_{22}|^2)\)
and \(|C_{ii}|\le|W_i|\) for \(i=1,2\).
Projecting it to the trace-free space and then perpendicular to the
stationary kernel preserves the velocity and decreases the norm.
Every preimage differs from the perpendicular preimage by a kernel
vector. Consequently the true minimal preimage \(X_\perp\) of the
velocity of \(X\) has
\[
 |X_\perp|^2\le3|W|^2
   =\frac{3|V_{\rm o}|^2_{\widehat g,\delta}}{16K^2c^2}
   \le\frac{|V_{\rm o}|^2_{\widehat g,\delta}}{2K^2}.
\]
[Assessed inverse and full form](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md).

The assessed bound \(|R_Q(X)|\le(96+4\sqrt{21})|X|^2\le120|X|^2\)
holds on the full jet space. Represent its symmetric polarization by a
self-adjoint matrix for the jet inner product. The quadratic bound
puts all eigenvalues in \([-120,120]\), giving
\(|B_Q(X,Y)|\le L_0|X||Y|\), \(L_0=120\).
For \(\epsilon=7/2-r>0\), \(\kappa=k\epsilon\), and \(X=X_0+X_\perp\),
use \(H_{\rm linear}\) on \(X_0\). Young's inequality allocates the
mixed term via \(2L_0ab\le(\kappa/2)a^2+(2L_0^2/\kappa)b^2\).
The exact orthogonal square identity then yields
\[
 R_Q(X)\ge \frac{k\epsilon}{2}|X|^2
      -\frac{C(\epsilon)}{K^2}|V_{\rm o}(X)|^2_{\widehat g,\delta},
 \qquad
 C(\epsilon)=\frac12\left(\frac{2L_0^2}{k\epsilon}
                              +L_0+\frac{k\epsilon}{2}\right).
\]
The \(k\epsilon/2\) inside the parentheses restores the missing
\(X_\perp\) part of \((k\epsilon/2)|X|^2\).

## Old first variation and native constants

At a fixed datum take \(A+\sigma V_{\rm o}(A)\) for small \(\sigma\)
in the open definite sign class. Its first curvature derivative is
\(d_AV_{\rm o}\). The speed row relation gives
\(*\langle V_{\rm o}\wedge F\rangle_\delta=
4K^2c^2\sum_i d_iJ_i W_i=0\) pointwise. Bianchi and
\(\dot\mu_{\rm o}=(2/3)d\langle V_{\rm o}\wedge F\rangle_\delta\)
give zero volume derivative at this tangent. The assessed exact
quotient identity and spatial integration at \(\sigma=0\) therefore
apply directly to the datum. Independent variation of
\(\mathcal P_{\rm o}=\int|q|^2\mu_{\rm o}\) on this tangent gives
\(-\mathscr D_{\rm o}\), with
\(\mathscr D_{\rm o}=\int|V_{\rm o}|^2_{\widehat g,\delta}
dV_{\widehat g}\). The resulting identity is
\[
 \mathscr D_{\rm o}
   =2\int R_Q(\nabla^AQ)\,\mu_{\rm o}
       +48K\int\sqrt{\det Q}\,|q|^2\,\mu_{\rm o}.
\]
The last two integrals use \(\mu_{\rm o}=2K^2dV_{\widehat g}\).
Only the initial spatial ratio enters the bound, and the affine
curve supplies the first tangent for this static argument.
The complement term therefore costs \(4C(\epsilon)\mathscr D_{\rm o}\).
As \(\det Q\ge(3/8)^3=27/512>1/25\), its square root is
at least \(1/5\). For
\(\mathscr G_{\rm o}=\int|\nabla^AQ|_{\widehat g}^2\,\mu_{\rm o}\)
this gives
\[
 (1+4C(\epsilon))\mathscr D_{\rm o}
     \ge k\epsilon\,\mathscr G_{\rm o}+(48K/5)\mathcal P_{\rm o}.
\]
[Assessed static identity and old measures](../notes/220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md).

The native negative-Killing pairing \(2\delta\) doubles the
wedge numerator in orthonormal internal labels and doubles
\(\mu_{\rm o}\), leaving the normalized \(Q\) unchanged. Since
\(dV_{g_A}=2\mu_{\rm o}=(2K)^2dV_{\widehat g}\), the native
metric is \(g_A=2K\widehat g\). The adjoint from two-forms to
one-forms scales by \(1/(2K)\), with the same internal scale
on both sides of its pairing. Hence
\(V_{\rm n}=V_{\rm o}/(2K)\) as a bundle-valued one-form and
\(t=2Kt_{\rm o}\) as a clock. In the \(\mathscr D\) integral the
squared velocity gains \(2(2K)^{-3}\) from internal pairing,
inverse metric and squared velocity scaling, and the volume gains
\((2K)^2\). This gives \(\mathscr D=\mathscr D_{\rm o}/K\).
For \(\mathscr G\) the constant internal scaling cancels in the
endomorphism norm, while the covector and normalized measure factors
give \((2K)^{-1}2=1/K\). Finally \(\mathcal E=2\mathcal P_{\rm o}\)
and the time conversion gives \(\mathcal E'=-\mathscr D\)
on the native original path.

Dividing the old estimate by \(K\) gives the native right side
\(k\epsilon\mathscr G+(24/5)\mathcal E\). Multiplying the left
coefficient by \(\epsilon\) gives the exact polynomial
\[
 \epsilon(1+4C(\epsilon))
   = (1+2L_0)\epsilon+\frac{4L_0^2}{k}+k\epsilon^2
   \le H=\frac{1205}{2}+\frac{57600}{k}+\frac{25k}{4}.
\]
The last step uses \(0<\epsilon\le5/2\), since \(r\ge1\).
Both factors in \(\epsilon(1+4C(\epsilon))\) are positive.
Thus \(1/(1+4C(\epsilon))\ge\epsilon/H\), giving
\[
 \mathscr D\ge \gamma_0\epsilon\,\mathcal E
    +\beta_0\epsilon^2\,\mathscr G,\qquad
 \gamma_0=\frac{24}{5H},\quad \beta_0=\frac{k}{H}.
\]
The constants depend only on the symbolic \(k\). If \(r=1\) for the
whole slice, trace three forces \(Q=I\) everywhere, and the jet,
energy and velocity all vanish.
[Assessed native conventions](E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md).

## Integrating factor over the actual lifespan

For \(R_*(t)=\sup_M\rho(Q(t))\), each compact smooth slab within
\([0,T_*)\) has a strictly positive minimum eigenvalue by compactness
and definiteness. The extreme Rayleigh quotients are
1-Lipschitz in operator norm in a fixed local orthonormal background.
Their ratio is continuous with a positive denominator, and the
difference in spatial suprema is at most the uniform difference in
the ratio. Thus \(R_*\) and \(w=(7/2-R_*)_+\) are continuous on each
slab, independently of spectral multiplicity. The proof requires
only the slab-dependent floor for this time regularity. At a
positive-margin time, the algebraic floor \(3/8\) follows from
pinching at that slice. At a zero-margin time, including equality
and above-threshold times, \(\mathcal E'=-\mathscr D\le0\) suffices.

At \(w>0\) take \(r=R_*(t)\) in the static estimate, whose closed
spatial inequality \(\rho\le r\) holds at every point. This gives
\(\mathcal E'+\gamma_0 w\mathcal E+\beta_0 w^2\mathscr G\le0\)
at all smooth times. With \(\Theta(t)=\int_0^t w(s)\,ds\),
\(f=e^{\gamma_0\Theta}\) is absolutely continuous on each slab,
\(f'=\gamma_0wf\) and \(f(0)=1\). The product rule gives
\[
 f(t)\mathcal E(t)+
 \beta_0\int_0^t f(s)w(s)^2\mathscr G(s)\,ds\le\mathcal E(0).
\]
Both terms are nonnegative. Zero initial energy is included
directly, and a round trajectory has \(w=5/2\) with both terms zero.
The argument applies to each compact initial slab. No
differentiability of eigenvectors or of the supremum is used.
[Assessed time integration](E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md).

## Late-sequence entry on the fixed original bundle

The extra hypotheses are one maximal smooth original native trajectory
on a fixed smooth principal \(SO(3)\) bundle over a smooth closed
connected oriented homotopy four-sphere, in the positive-plane
round-compatible class. The *same* sequence of actual unshifted times
\(t_n\uparrow T_*\) has both \(\sup_M\Psi(A(t_n))\le P_0\) and
\(\operatorname{diam}(g_{A(t_n)})\le D_0\), with \(0\le P_0<\infty\)
and \(0<D_0<\infty\). The displayed E231 density agrees with E179
and the assessed E159 convention:
\[
 T_X=\tfrac12(S^{-1}D_X^AQ\,S^{-1})_0,\qquad
 \mathcal R_X(f)=P_{f^\perp}T_Xf,\qquad
 \Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2 .
\]
The native unit internal sphere has area \(4\pi\). The derivative uses
chiral Levi–Civita horizontal transport and the live base covector
connection. This is the real whole-fiber density of the imported
geometric theorem. The two bounds alone imply \(T_*=\infty\)
by the assessed finite-endpoint implication.
[E179 density and sequence hypotheses](../notes/179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md) ·
[E179/E181 continuation assessment](E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md).

**Infinite weighted occupation.** If \(\Theta(t)\to\infty\), the
energy bound gives \(\mathcal E(t)\to0\). The E179/E181
zero-limiting-energy branch gives a perfect smooth positive-time
limit after one common shift. Its round identification
\(\Phi:P\to P_{\rm rd}\) covers an orientation-preserving
diffeomorphism to the round \(S^4_{\sqrt{2}}\).
For the adjusted recovery \(j_n\) and normalizer \(h_n\), the
shifted pair pulled back by \(K_n=h_n\circ j_n(s_0)^{-1}\) is a
round-basin pair after transfer by \((\Phi^{-1})^*\), for one
fixed sufficiently late index. Set \(L=\Phi\circ K_n^{-1}\).
The identity \((L^{-1})^*=(\Phi^{-1})^*K_n^*\) checks the datum
on \(P_{\rm rd}\). If \(B\) is the round-basin solution and
\(t_b=t_n+s_0\), then \(L^*B(t-t_b)\) has initial value
\(A(t_b)\) and is original by naturality. Recentered smooth
original uniqueness identifies the whole subsequent tail.
Its limiting pair is \((b_\infty\circ L)^*(A_0,F_0)\) with the
one smooth limiting recovery automorphism \(b_\infty\) on
\(P_{\rm rd}\).
[Assessed fixed-map transfer](E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md).

**Strict finite observation.** The uniform E182/E183/E185
threshold \(\delta(P_0,D_0)>0\) is non-effective and applies
to qualifying native data across the specified bases and bundles.
At one unshifted qualifying \(t_n\), the strict inequality
\[
 \mathcal E(0)e^{-\gamma_0\Theta(t_n)}<\delta(P_0,D_0)
\]
gives an actual subthreshold datum by the integrating factor.
It places no spectral condition at that slice. The uniform
theorem starts a global original solution from \(A(t_n)\)
with fixed round-basin entry. Translate its origin to \(t_n\).
The two original solutions agree by local smooth original
uniqueness after recentering at any common smooth slice.
Continuity at a putative finite first disagreement and recentering
there give agreement on the entire common tail, which here is
infinite. The threshold theorem therefore identifies the actual
connection–curvature pair with that tail on \(P\).
[Assessed uniform entry](E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md).

Both arguments use the assessed fixed native exponent
\(\alpha=\lambda_1(G_0)/2>0\) after entry into the round basin.
For every fixed spatial order \(m\) and fixed smooth background,
the connection–curvature error to the one fixed pullback is bounded
by a datum-dependent \(C_m e^{-\alpha t}\) for sufficiently late
\(t\). A fixed smooth pullback changes these constants and a finite
time translation multiplies the exponential prefactor. The energy
exponent in (2) instead uses accumulated \(\Theta\).
[Assessed smooth native recovery](E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md).

The finite observation uses only \(\Theta(t_n)\). Its round limit has
\(Q=I\), and uniform convergence of the compatible pair to this
positive limit transfers to uniform \(Q(t)\to I\) by the positive
normalized wedge quotient. Thus \(R_*(t)\to1\) and \(w(t)\to5/2\),
so the ensuing trajectory has divergent total weighted occupation.
The scalar comparison
\(\widehat R(t)=7/2-(1+t)^{-1}\), \(t\ge0\), is in the allowed
ratio range, with \(\int_0^t(1+s)^{-1}\,ds=\log(1+t)\).
For any fixed \(1\le r<7/2\) its sublevel set requires
\(t\le(7/2-r)^{-1}-1\) and is bounded or empty. This is a
comparison of time assumptions on scalar profiles. The audit
establishes conditional statements for supplied trajectories
and preserves the separation from preservation, initialization,
occurrence and waiting-time questions.
[Assessed finite-observation interpretation](E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md).

## Frozen inputs

| Artifact | Verified SHA-256 |
| --- | --- |
| [E232 request](../research-progress/handoffs/SP4-CME-E232_REQUEST_v1.md) | 4cd8b3560a3801afcfa69dcb8baeaa2ac37db831ce1708b662167daa21887bc7 |
| [E231 derivation](../notes/231_CONDITIONAL_MARGIN_WEIGHTED_FLOW_20261123.md) | 08ac5cef435505d77e99bbd2d8c4cb38c26be6c3a88fac276f42292da5260a4b |
| [E231 return](../research-progress/handoffs/SP4-CME-E231_RETURN_v1.md) | 25b4027d754005242464f336934671b2365f99cd3c6cf8c509947f7f69b6d3f1 |
| [E220/E222 assessment](E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E212/E213 assessment](E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md) | 63942e67c937280a0ea88f635d79be51c81b6e54f873e6b1bccf9ad2529ead3c |
| [E179/E181 assessment](E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) | 0c9eb889bb10092e631fb3bea7d06e0120934e6a80682e9f3a05b2d1ff7d3881 |
| [E182/E185 assessment](E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) | 0f55dfd759e5dfd1f86e69cc7bd201688de0a2cf5e2bd9ce68414f9ffe96761f |
| [E205/E206 assessment](E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) | bca701d680e3e0f66dca5c56ba4caa3edb43c0005b8a94d7db4c2225b49858aa |

The inherited algebra, density and native recovery references were
checked through the cited assessed materials. The packet adds an
independent analytical audit with only its designated review and return.
