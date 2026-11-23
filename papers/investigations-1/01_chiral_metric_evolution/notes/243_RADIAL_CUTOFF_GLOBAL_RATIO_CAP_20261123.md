# E243 Exact global ratio cap for the prescribed radial cutoff

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B112. Configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored the E236 local audit and
E240 cutoff proof. I use E240's checked smooth extension and
positivity estimates at their returned scope. Its separate
independent audit was pending at the input freeze.

**The exact cap holds.** On the fixed standard smooth oriented
round \(S^4\) and its positive chiral \(SO(3)\) bundle, the B112
family has
\[
 \sup_{S^4}\rho(Q_{A_\epsilon})=1+\epsilon
\]
for all sufficiently small \(\epsilon>0\), attained only at the
center \(p\). The connection is smooth, positive definite and
round-compatible, with fixed-background \(C^1\) difference
\(O(\epsilon)\) from the round reference. At \(p\) its germ remains
the assessed E235 germ. This is a static statement for the
one prescribed radial cutoff and \(R=\epsilon^2\).
[B112](../brainstorm/notes/B112_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md) ·
[E240](240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md).

## Fixed family and norms

Use E240's fixed old \(K=1\) oriented normal chart and radial
gauge on a ball about \(p\), with Euclidean coordinate norms
and the old internal metric \(\delta\). Let
\(F_0=F_{\rm rd}(0)=-\Sigma\), where \(\Sigma\) denotes the
constant coefficient self-dual triple of E235. Throughout the
local estimates \(dV_{\rm e}=dx^{1234}\) is fixed. Define
\[
 \mathcal M_{ij}(F)=\frac{F_i\wedge F_j}{2dV_{\rm e}},\qquad
 \mathcal Q(F)=\frac{3\mathcal M(F)}{\operatorname{tr}\mathcal M(F)}.
\]
Thus \(\mathcal M(F_0)=I\). Fix a coefficient ball about \(F_0\)
so small that \(\|\mathcal M-I\|_{\rm op}\le1/4\) on its closure.
There \(\operatorname{tr}\mathcal M\ge9/4\), and the map
\(\mathcal Q\) and its first two derivatives have uniform bounds
on the closure. This follows directly from the quadratic numerator
and the positive denominator. The ball is fixed independently of
\(\epsilon\). All usages below lie in it, after imposing the
specified smallness inequalities. The normalized wedge quotient is
independent of the choice of positive reference volume. With the
native internal pairing the wedge numerator and its trace double
in orthonormal labels, so \(Q=\mathcal Q(F)\) and \(\rho\) agree
in the old and native conventions.

Put \(r=1+\epsilon\), \(0<\epsilon\le1\), \(R=\epsilon^2\),
\(m_\epsilon=\epsilon/(2+\epsilon)\), and
\(Q_r=\operatorname{diag}(1-m_\epsilon,1,1+m_\epsilon)\).
Write \(F^*_i=-\sqrt{(Q_r)_{ii}}\,\Sigma_i\) and
\(\Delta F^*=F^*-F_0\). Then
\(|\Delta F^*|\le C\epsilon\) by the square-root estimates of
E240. The E235 connection coefficients are exactly
\[
 A_{\rm loc}=L_r+C_r,\qquad
 L_r(x)=\tfrac12\iota_x F^*,\qquad
 C_r(x)=\tfrac16\sum_a(x^a)^3 V^a .
\]
Here \(L_r\) and \(C_r\) are the linear and cubic polynomials.
The coefficients of \(L_r\) are \(O(1)\) and those of \(C_r\)
are \(O(\epsilon^{-1})\) by the explicit bounds
\(|U|\le33/\epsilon\) and \(|V^a|\le33\sqrt{3/2}/\epsilon\).
The notation \(O(\cdot)\) below means a constant independent of
\(\epsilon\), the location in the relevant coordinate ball,
its angular direction, and the later parameters \(u,v\). Such
constants may depend on the fixed chart, round reference and
preset cutoff, or only on the displayed dimension and coefficients.
[E235 construction](235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) ·
[E240 radial and coefficient bounds](240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md).

For the cutoff, use the prescribed fixed nonnegative smooth
mollifier \(\eta\) of integral one supported in
\((-1/20,1/20)\). The density
\(\frac52(\mathbf 1_{[11/20,19/20]}*\eta)\) has integral one,
supremum at most \(5/2\), and support in \((1/2,1)\).
Its integral from \(s\) to infinity gives a smooth nonincreasing
\(c(s)\), with the stated plateaus and \(|c'|\le5/2\).
Thus \(x\mapsto c(|x|/R)\) is smooth and equals one near zero.
As in E240 set \(a=A_{\rm loc}-A_{\rm rd}\) in the fixed chart
and \(A_\epsilon=A_{\rm rd}+c(|x|/R)a\), extending the
difference by zero. For \(R\) inside the chart, the transformation
rule for differences, cutoff plateaus and E240 estimates give
a smooth global connection, fixed-background \(C^1\) closeness
and actual curvature difference \(O(\epsilon)\). The wedge
Gram estimate relative to \(\widehat g_{\rm rd}\) of E240
supplies global positivity and round sign, with the constants
for this fixed cutoff. Outside the support the connection is round.

## Uniform Taylor estimate on the full radius-\(R\) ball

The exact polynomial curvature has only even terms
\[
 F_{\rm loc}=F^*+F_2+F_4+F_6,\qquad
 F_2=dC_r+\tfrac12[L_r\wedge L_r],\qquad
 F_4=[L_r\wedge C_r],\qquad F_6=\tfrac12[C_r\wedge C_r].
\]
Indeed \(dL_r=F^*\), and the cross bracket of two one-forms
has the same sign in either order. Let \(\ell=|x|\le R\).
The coefficient bounds give
\[
 |F_2|\le C\epsilon^{-1}\ell^2,\qquad
 |F_4|\le C\epsilon^{-1}\ell^4,\qquad
 |F_6|\le C\epsilon^{-2}\ell^6.
\]
In particular there is a fixed \(C_F\) with
\(|F_{\rm loc}-F_0|\le C_F\epsilon\) and
\(|F_{\rm loc}-F^*|\le C_F\epsilon^{-1}\ell^2\)
on this whole ball, using \(\ell\le\epsilon^2\le1\).
Thus the entire segment from \(F^*\) to \(F_{\rm loc}\)
is in the fixed coefficient ball when \(\epsilon\) is small.
The first-order Taylor expansion of \(\mathcal Q\) about \(F^*\)
has error \(O(|F_{\rm loc}-F^*|^2)\).
The \(F_4,F_6\) terms under its linear part are
\(O(\epsilon^{-2}\ell^4)\) on the fixed range. The accepted
E235 quotient Hessian calculation gives
\(D\mathcal Q_{F^*}(F_2(x))=B\ell^2/2\).
The affine bracket contributes \(dq\,\ell^2/4\) after the
trace correction and \(dC_r\) contributes \(U\ell^2/2\),
where \(U=B-dq/2\). It follows that
\[
 Q_{\rm loc}=Q_r+\tfrac12 B\ell^2+O(\epsilon^{-2}\ell^4),
 \qquad \|Q_{\rm loc}-Q_r\|_{\rm op}\le C_Q\epsilon^{-1}\ell^2 .
\]
The bound \(|B|\le32/\epsilon\) verifies the second estimate along
with the Taylor remainder. No spatial odd term is suppressed:
the curvature and quotient are even, and the expansion displays
the actual remainder. [Assessed Hessian](../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md).

The two gaps at \(Q_r\) are \(m_\epsilon\ge\epsilon/3\).
Along the matrix segment from \(Q_r\) to \(Q_{\rm loc}(x)\),
the norm displacement is at most \(C_Q\epsilon^3\).
By the min–max formula for ordered eigenvalues, for
\(2C_Q\epsilon^2\le1/6\) the gaps are at least \(\epsilon/6\).
All the eigenvalues are at least \(1/2\) after the same reduction
(the smallest at the center is at least \(2/3\)).
The Hessian of \(f(Q)=\log\lambda_{\max}(Q)-\log\lambda_{\min}(Q)\)
in symmetric matrix directions has norm \(O(\epsilon^{-1})\)
on this segment. In fact at a normalized eigenframe and for a
symmetric direction \(Y\), the second eigenvalue derivative is
\(2\sum_{j\ne i}|Y_{ji}|^2/(\lambda_i-\lambda_j)\),
obtained by differentiating the eigenpair, and the first derivative
is \(Y_{ii}\). The eigenvalue lower bound and the logarithm
chain rule give the stated Hessian bound.

The Frobenius representative \(G\) of \(df\) at \(Q_r\) is
bounded and \(df[B]=-|G|^2\). Applying the scalar Taylor formula
on the segment gives
\[
 f(Q_{\rm loc}(x))=\log r-\frac{|G|^2}{2}\ell^2+
                                      O(\epsilon^{-3}\ell^4).
\]
Here \(df\) applied to the quotient remainder costs
\(O(\epsilon^{-2}\ell^4)\), and the quadratic scalar remainder
costs \(O(\epsilon^{-1}(\epsilon^{-1}\ell^2)^2)\).
The gap dependence is therefore explicit. Also
\(G_{33}-G_{11}=1/(1+m_\epsilon)+1/(1-m_\epsilon)\ge2\),
so \(|G|^2\ge2\). If \(C_{\rm sc}\) bounds the last remainder,
then \(\epsilon^{-3}\ell^4\le\epsilon\ell^2\) for
\(\ell\le\epsilon^2\). Taking \(C_{\rm sc}\epsilon\le1/2\)
gives strict decrease of \(f(Q_{\rm loc})\) for every
\(0<\ell\le R\), with a uniform negative upper quadratic bound.

## Exact annular curvature and the \(v/4\) coefficient

On \(R/2\le\ell\le R\), put \(s=\ell/R\),
\(n=x/\ell\), \(u=c(s)\), \(v=s c'(s)\). Then
\(d(c(\ell/R))=(v/\ell)n^\flat\) in the coordinate Euclidean
coframe. The exact curvature formula is
\[
 \begin{aligned}
 F(u,v,x)
   &=F_{\rm rd}+u\,d_{A_{\rm rd}}a
          +\tfrac12 u^2[a\wedge a]+\frac{v}{\ell}n^\flat\wedge a\\
   &=F_{\rm rd}+u(F_{\rm loc}-F_{\rm rd})
          +\tfrac12u(u-1)[a\wedge a]+\frac{v}{\ell}n^\flat\wedge a .
 \end{aligned}
\]
At the actual cutoff parameters it is \(F_{A_\epsilon}\). For
fixed \(x\ne0\) it also defines a polynomial in the two parameters,
so we may estimate its value and first partial derivatives on the
entire fixed rectangle \(0\le u\le1\), \(-5/2\le v\le0\).
The endpoint \(F(1,0,x)=F_{\rm loc}(x)\) is exact. The
parameter derivatives here refer to this pointwise formula.

The round radial integral and polynomial bounds give
\[
 \begin{aligned}
 F_{\rm rd}(x)&=F_0+O(\ell),\\
 F_{\rm loc}(x)-F_{\rm rd}(x)&=\Delta F^*+O(\ell+\ell^2/\epsilon),\\
 a(x)&=\tfrac{\ell}{2}\iota_n\Delta F^*+O(\ell^2+\ell^3/\epsilon).
 \end{aligned}
\]
In particular \(|a|\le C\epsilon\ell\) on the annulus because
\(\ell\le\epsilon^2\) and \(\epsilon\le1\).
The bracket term and its \(u\) derivative are
\(O(\epsilon^2\ell^2)\). The remainder in \(a/\ell\) is
\(O(\ell+\ell^2/\epsilon)\), uniformly in \(n\).
With \(\mathcal T_n Z=\tfrac12n^\flat\wedge\iota_n Z\),
the full curvature is therefore
\[
 F(u,v,x)=F_0+u\Delta F^*+v\mathcal T_n\Delta F^*+E_F,\qquad
 |E_F|+|\partial_uE_F|+|\partial_vE_F|\le C\epsilon^2 .
\]
The errors are bounded by multiples of
\(\ell+\ell^2/\epsilon+\epsilon^2\ell^2\). They are uniform
on the compact parameter rectangle and unit angular sphere.
The full curvature is \(O(\epsilon)\) from \(F_0\) on that
rectangle, since \(\mathcal T_n\) has uniform operator norm.
Thus it and its segment to \(F_0\) lie in the fixed coefficient
ball for small \(\epsilon\). This gives the trace floor for every
parameter comparison.

The self-dual projection needed for the leading term follows
from the Euclidean identity
\(\omega=n^\flat\wedge\iota_n\omega+
*_{\rm e}(n^\flat\wedge\iota_n\omega)\) for any self-dual
two-form \(\omega\). It is the orthogonal splitting into terms
containing \(n^\flat\) and their Hodge duals. Therefore
\(\big(n^\flat\wedge\iota_n\Sigma_i\big)^+=\Sigma_i/2\)
and \((\mathcal T_n\Delta F^*)^+=\Delta F^*/4\).
The derivative \(D\mathcal Q_{F_0}\) kills the anti-self-dual
part because each of its linear wedge terms pairs with a
self-dual \(F_{0i}\). The change from \(F_0\) to \(F^*\) gives
\[
 D\mathcal Q_{F_0}(\Delta F^*)=Q_r-I+O(\epsilon^2)
                   =\epsilon D+O(\epsilon^2),\qquad
 D=\operatorname{diag}(-1/2,0,1/2).
\]
The first equality uses the fixed second-derivative bound and
\(\mathcal Q(F^*)=Q_r\). Thus the \(v\) coefficient in the quotient
is exactly one quarter of the leading \(u\) coefficient. The full
anti-self-dual curvature term remains in \(F(u,v,x)\); its
contribution to the quotient starts in the bounded error.

Use \(h=u+v/4\). The smooth quotient map with bounded
second derivative yields the uniform expansions
\[
 \begin{aligned}
 Q(u,v,x)&=I+\epsilon h D+O(\epsilon^2),\\
 \partial_u Q(u,v,x)&=\epsilon D+O(\epsilon^2),\\
 \partial_v Q(u,v,x)&=\epsilon D/4+O(\epsilon^2).
 \end{aligned}
\]
For the derivatives, \(D\mathcal Q_{F(u,v,x)}\) differs from
\(D\mathcal Q_{F_0}\) by \(O(\epsilon)\), whereas
\(\partial_uF,\partial_vF=O(\epsilon)\) with the leading terms
already displayed. Thus differentiating the pointwise quotient
does not lose a factor in the uniform error. Denote by
\(C_{\rm par}\) a common operator-norm bound for the three
remainders after division by \(\epsilon^2\).

## Spectral comparisons and unique maximum

For \(h\ge1/2\), the leading matrix \(I+\epsilon hD\) has
successive gaps \(\epsilon h/2\ge\epsilon/4\).
The min–max bound and \(2C_{\rm par}\epsilon\le1/8\)
give gaps at least \(\epsilon/8\) for \(Q(u,v,x)\).
Write \(\ell_i^0\) for its ordered leading eigenvalues and
\(\zeta_i\) for a normalized actual eigenvector with ordered
eigenvalue \(\lambda_i\). Its projected eigenvector equation
in the leading diagonal basis gives, for \(j\ne i\),
\[
 (\lambda_i-\ell_j^0)(\zeta_i)_j
       =\big((Q-I-\epsilon h D)\zeta_i\big)_j .
\]
For these \(j\) the denominators have absolute value
at least \(\epsilon/8\). The entire component perpendicular
to \(e_i\) therefore has norm at most \(8C_{\rm par}\epsilon\).
In particular \(\langle\zeta_i,D\zeta_i\rangle=D_{ii}+O(\epsilon^2)\)
by the diagonal form of \(D\).
The eigenvalue differentiation rule and
\(\lambda_i^{-1}=1+O(\epsilon)\) now give
\[
 \partial_u f(Q)=\epsilon+O(\epsilon^2),\qquad
 \partial_v f(Q)=\epsilon/4+O(\epsilon^2),
 \qquad h\ge1/2 .
\]
Both remainders are uniform. Let \(C_{\rm der}\) be a common
bound for them after division by \(\epsilon^2\).
Take \(C_{\rm der}\epsilon\le1/8\), so the partial
derivatives are at least \(\epsilon/2\) and \(\epsilon/8\),
respectively. The straight parameter segment from \((1,0)\)
to \((u,v)\) lies in the rectangle and keeps \(h\ge1/2\).
Since \(u-1\le0\), \(v\le0\), integrating gives
\[
 f(Q(u,v,x))\le f(Q(1,0,x))
                    -\frac{\epsilon}{2}\big[(1-u)+|v|/4\big].
\]
The endpoint is the actual polynomial quotient at the same
\(x\), already strictly below \(\log r\) for \(0<\ell\le R\).
The comparison also covers \(h=1\), which requires
\((u,v)=(1,0)\).

For \(h\le1/2\) the entire rectangle satisfies
\(-5/8\le h\le1/2\). The ordered extreme eigenvalues of the
leading matrix are \(1\pm\epsilon|h|/2\), even if the
middle spectrum is degenerate. Min–max gives
\(\lambda_{\max}-\lambda_{\min}\le\epsilon|h|+
2C_{\rm par}\epsilon^2\) and
\(\lambda_{\min}\ge1-\epsilon|h|/2-C_{\rm par}\epsilon^2\).
For small \(\epsilon\) the latter is at least \(1/2\)
and \(\lambda_{\min}^{-1}\le1+C\epsilon\) uniformly.
Hence there is a fixed \(C_{\rm low}\) with
\[
 \rho(Q)=1+\frac{\lambda_{\max}-\lambda_{\min}}{\lambda_{\min}}
    \le1+\tfrac58\epsilon+C_{\rm low}\epsilon^2
    \le1+\tfrac34\epsilon
\]
when \(C_{\rm low}\epsilon\le1/8\).
This region uses only eigenvalue Lipschitz estimates and
does not assume simplicity.

Choose one \(\epsilon_0>0\) small enough for the E240
background estimates with this fixed cutoff, the chart inclusion,
the fixed coefficient ball bounds, and the explicit inequalities
above on \(C_Q,C_{\rm sc},C_{\rm par},C_{\rm der},C_{\rm low}\).
All these constants were fixed independently of \(\epsilon\).
For \(0<\epsilon<\epsilon_0\), the inner ball equals the polynomial,
which gives \(\rho<r\) away from \(p\) and \(\rho(p)=r\).
The annulus is strictly below \(r\) by the two cases. Outside
the cutoff support \(\rho=1\). This proves the exact supremum
and uniqueness of its maximizer on the closed sphere. Equality
of the germ at \(p\) retains the E235 spatial Hessian and native
directional derivative \(1/2\) of \(\log\rho\).
The conclusion concerns this family of smooth initial connections.
No trajectory or flow-preservation claim is made in E243.

## Verified frozen inputs

| Artifact | SHA-256 |
| --- | --- |
| [E243 request](../research-progress/handoffs/SP4-CME-E243_REQUEST_v1.md) | c9f77cd8bfde6f60084dad4f54d317c952eb201e7024dd771a6891580a7b5666 |
| [B112](../brainstorm/notes/B112_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md) | 65f4bc96b23c11bae954d31e81d0dd5e377a1ef8a08ee49ec24407c8677fc037 |
| [E235](235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
| [E235/E236 assessment](../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md) | c8f229dbc5421449ccc1e548af0502d5524a8bf771d7e9544efed5ce846a7c50 |
| [E240](240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md) | e8bf6be314dbde48a6495057f800de637534dbc7ec1c5b6d0c054514540770fa |

Only the designated note and return were written.
