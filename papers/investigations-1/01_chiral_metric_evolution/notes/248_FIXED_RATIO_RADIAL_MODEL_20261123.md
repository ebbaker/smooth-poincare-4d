# E248 Exact radial model and fixed-ratio static cutoff

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B113, configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored the E236 local audit,
E240 cutoff construction and E243 near-round cap proof. The
present calculation verifies B113's exact model and fixed-ratio
transfer for the same germ and fixed radial cutoff.

For every fixed finite \(r>1\), there is \(R_*(r)>0\) such that
every radius \(0<R<R_*(r)\) in this construction gives a smooth
positive definite round-compatible connection on the standard
positive chiral \(SO(3)\) bundle over oriented round \(S^4\).
Its spectral ratio has global maximum exactly \(r\), with the
unique maximizer at the chart center \(x_0\). Its germ there is
the assessed E235 one, so the native instantaneous original
directional derivative of \(\log\rho\) is \(1/2\). The cutoff
radius and all comparison constants may depend on \(r\).
[B113](../brainstorm/notes/B113_FIXED_RATIO_RADIAL_MODEL_20261123.md).

## Exact model and reflected anti-self-dual triple

Fix \(r>1\) finite throughout the calculation. Write the root
triple as
\[
 s=(p,1,q),\qquad p=\sqrt{\frac2{1+r}},\qquad
 q=\sqrt{\frac{2r}{1+r}} .
\]
Thus \(0<p<1<q<\sqrt2\), \(p^2+q^2=2\), and \(r=q^2/p^2\).
Use the fixed oriented normal chart at \(x_0\) and the round
radial gauge of the assessed cutoff. The old \(K=1\) internal
pairing is \(\delta\), with the oriented cross-product bracket.
In the chart let \(dV_{\rm e}=dx^{1234}\), \(\Sigma\) be the
constant Euclidean self-dual triple of E235 with
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\rm e}\), and
\[
 F_0=F_{\rm rd}(x_0)=-\Sigma,\qquad
 F^*_i=-s_i\Sigma_i,\qquad
 \Delta F_i=F_i^*-F_{0i}=-d_i\Sigma_i,\qquad d_i=s_i-1.
\]
Coordinates are centered at \(x_0\). All fixed coefficient
norms below use the Euclidean chart and \(\delta\). The cut-off
profile \(c\) is exactly the chosen E243 fixed smooth nonincreasing
profile, equal to one up to \(1/2\), zero from \(1\), with
\(|c'|\le5/2\). For the annular calculations the full parameter
rectangle is \(\mathcal P=[0,1]\times[-5/2,0]\).
[E235 germ](235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) ·
[Assessed cutoff convention](../reviews/E243_E245_GLOBAL_RATIO_CAP_ASSESSMENT_20261123.md).

For any Euclidean unit vector \(n\) write
\(\beta_i=n^\flat\wedge\iota_n\Sigma_i\). The decomposition of
a two-form into the summands with and without \(n^\flat\) gives
\(\Sigma_i=\beta_i+*_{\rm e}\beta_i\) by self-duality.
Let \(\tau_n\) be the Euclidean reflection that negates \(n\) and
fixes \(n^\perp\). Its pullback negates \(\beta_i\) and fixes
\(*_{\rm e}\beta_i\), the latter being tangential. Thus
\[
 \Omega_i(n)=2\beta_i^-=\beta_i-*_{\rm e}\beta_i=-\tau_n^*\Sigma_i,
 \qquad \Omega_i\wedge\Omega_j=-2\delta_{ij}dV_{\rm e}.
\]
The wedge relation follows also by pulling back the reference
wedge relation and using \(\det\tau_n=-1\). This checks the
reflected triple for every \(n\), with \(\Sigma_i\wedge\Omega_j=0\)
by the orthogonality of the two Hodge summands.

The exact pointwise model at \((u,v,n)\in\mathcal P\times S^3\) is
\[
 F_{\rm mod}=F_0+u\Delta F+(v/2)n^\flat\wedge\iota_n\Delta F.
\]
Since \(\beta_i=(\Sigma_i+\Omega_i)/2\), its two chiral parts are
\[
 (F_{\rm mod})_i=-\big(1+(u+v/4)d_i\big)\Sigma_i
                         -(v/4)d_i\Omega_i .
\]
In the wedge Gram \(\mathcal M_{ij}(F)=F_i\wedge F_j/(2dV_{\rm e})\)
the mixed chiral terms vanish, and both chiral triples have
diagonal wedge pairing with opposite signs. Hence
\[
 \mathcal M(F_{\rm mod})=\operatorname{diag}(M_1,M_2,M_3),\qquad
 M_i=\big(1+(u+v/4)d_i\big)^2-(v d_i/4)^2
     =(1+u d_i)(1+(u+v/2)d_i).
\]
This is angle-independent, with \(M_2=1\). The normalized quotient
is \(Q_{\rm mod}=3\mathcal M(F_{\rm mod})/\operatorname{tr}
\mathcal M(F_{\rm mod})\). Since the scalar factor is positive,
the ratio uses the \(M_i\) directly.

## All ordered model quotients

Set \(w=u+v/2\), so \(-5/4\le w\le1\). For \(i=1\) the
two factors in \(M_1\) are both at least \(p\), since \(d_1<0\)
and \(u,w\le1\). For \(i=3\), the first factor is at least one
and the second is at least \((9-5q)/4>0\), since
\(q<\sqrt2<9/5\). Thus
\[
 m_r=\min\{p^2,1,(9-5q)/4\}>0,\qquad
 \mathcal M(F_{\rm mod})\ge m_r I.
\]
Writing \(a_i=1+ud_i\) and \(b_i=1+wd_i\) for these positive
factors gives
\[
 \partial_u M_i=d_i(a_i+b_i),\qquad
 \partial_v M_i=(d_i/2)a_i .
\]
Consequently \(M_1\) decreases strictly with each parameter,
and \(M_3\) increases strictly with each parameter on the
rectangle. Their extrema are at the opposite corners, giving
\[
 p^2\le M_1\le(9-5p)/4,\qquad (9-5q)/4\le M_3\le q^2.
\]
This includes cases where the ordering of the three entries
changes. For the six ordered quotients with distinct indices:

- \(M_3/M_1\le q^2/p^2=r\). Strict monotonicity in each variable
  gives equality exactly at \((u,v)=(1,0)\).
- \(M_2/M_1\le1/p^2<q^2/p^2\) because \(q>1\).
- \(M_3/M_2\le q^2<q^2/p^2\) because \(p<1\).
- \(M_1/M_2\le(9-5p)/4<q^2/p^2\). Clearing the positive
  denominators and using \(q^2=2-p^2\) gives the equivalent
  inequality \(13p^2-5p^3<8\). The polynomial
  \(13z^2-5z^3\) is increasing for \(0<z<26/15\) and has
  value eight at \(z=1\).
- \(M_2/M_3\le4/(9-5q)<q^2/p^2\). The strict comparison is
  equivalent to \(13q^2-5q^3>8\), by \(p^2=2-q^2\).
  Use the same monotone polynomial since \(1<q<\sqrt2<26/15\).
- \(M_1/M_3\le(9-5p)/(9-5q)<q^2/p^2\). The numerator
  difference after multiplying both sides of the strict
  comparison by \(p^2(9-5q)>0\) is
  \((q-p)[9(p+q)-5(2+pq)]\).
  For \(z=p+q\in(\sqrt2,2)\), the bracket is
  \(9z-5-(5/2)z^2\), using \(p^2+q^2=2\).
  This concave quadratic is bounded below on
  \([\sqrt2,2]\) by the minimum of its endpoint values,
  \(9\sqrt2-10\) and \(3\), both positive.

The diagonal quotients are one. Thus \(\rho(Q_{\rm mod})\le r\)
on the entire rectangle with equality precisely at the one
specified corner, for every angular direction.

## Actual curvature and uniform parameter transfer at fixed \(r\)

In the fixed chart let
\(a=A_{\rm loc}-A_{\rm rd}\), where \(A_{\rm loc}\) is the
exact E235 polynomial. Define
\[
 A_R=A_{\rm rd}+c(|x|/R)a
\]
in the chart and extend the difference by zero. In any
trivialization a change of frame transforms connection forms
by an adjoint term and the same inhomogeneous term. The
inhomogeneous terms cancel in \(a\), which patches as an
adjoint-valued one-form. The scalar cutoff is smooth at the
center by its inner plateau and vanishes smoothly at its outer
plateau. Choose \(R\) smaller than the fixed chart radius
so the extended difference is globally smooth. The construction
therefore gives a smooth connection on the fixed bundle.

For \(R/2\le\ell=|x|\le R\) put \(n=x/\ell\), \(b=\ell/R\)
and take the actual parameters \(u=c(b)\), \(v=b c'(b)\).
They lie in \(\mathcal P\) and \(d(c(\ell/R))=(v/\ell)n^\flat\).
The exact curvature, retaining the bracket and scalar derivative,
is the value at these parameters of
\[
 \begin{aligned}
 F(u,v,x)
   &=F_{\rm rd}+u\,d_{A_{\rm rd}}a+\tfrac12u^2[a\wedge a]
                       +(v/\ell)n^\flat\wedge a\\
   &=F_{\rm rd}+u(F_{\rm loc}-F_{\rm rd})
        +\tfrac12u(u-1)[a\wedge a]+(v/\ell)n^\flat\wedge a .
 \end{aligned}
\]
This follows from \(F_{\rm loc}-F_{\rm rd}
=d_{A_{\rm rd}}a+[a\wedge a]/2\). In particular
\(F(1,0,x)=F_{\rm loc}(x)\) exactly. For fixed nonzero \(x\)
it defines a smooth function of arbitrary \((u,v)\) for the
pointwise comparison. These auxiliary parameter values require
only pointwise two-form matrices and their derivatives.
[Assessed form of the cutoff curvature](243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md).

The fixed round radial gauge gives the coefficient estimate
\(A_{\rm rd}=\tfrac12\iota_x F_0+O(\ell^2)\) from the
radial transport formula
\(A_{\rm rd}(x)=\int_0^1 t\iota_x F_{\rm rd}(tx)\,dt\).
Smoothness gives \(F_{\rm rd}=F_0+O(\ell)\).
The local polynomial has linear term \(\tfrac12\iota_x F^*\)
and a cubic with finite fixed-\(r\) coefficients. Its first
curvature derivative at zero vanishes, so
\[
 F_{\rm loc}=F^*+O_r(\ell^2),\qquad
 a=\tfrac{\ell}{2}\iota_n\Delta F+O(\ell^2)+O_r(\ell^3).
\]
In particular \([a\wedge a]=O_r(\ell^2)\) for \(\ell\le1\).
The \(v\) derivative of \(F\) is \(n^\flat\wedge a/\ell\),
with leading term \(\tfrac12n^\flat\wedge\iota_n\Delta F\)
and error \(O_r(\ell)\). Its \(u\) derivative is
\(F_{\rm loc}-F_{\rm rd}+\tfrac12(2u-1)[a\wedge a]\),
with leading term \(\Delta F\) and error \(O_r(\ell)\).
In the value formula the same errors, multiplied by the
bounded scalars \(u,v\), give
\[
 \sup_{\substack{R/2\le|x|\le R\\ (u,v)\in\mathcal P}}
 \big(
 |F-F_{\rm mod}|+|\partial_u(F-F_{\rm mod})|
                         +|\partial_v(F-F_{\rm mod})|
 \big)\le C_r R .
\]
Here \(F_{\rm mod}\) uses \(n=x/|x|\) and the differentiation
holds \(x\), hence \(n\), fixed. The finite radius and constants
are for this fixed \(r\), and independent of angle, parameters
and \(R\) in the indicated range.

The model coefficient image on \(\mathcal P\times S^3\)
is compact. Its wedge Gram has uniform positive floor \(m_r\).
Wedge is bilinear, hence its Gram is Lipschitz on bounded
coefficient sets. For sufficiently small \(R\), along every
segment from \(F_{\rm mod}\) to \(F(u,v,x)\) the Gram differs
from the model Gram in operator norm by at most \(m_r/2\).
These Gram matrices therefore have trace at least \(3m_r/2\).
The wedge quotient \(\mathcal Q(F)=3\mathcal M(F)/
\operatorname{tr}\mathcal M(F)\) has bounded first and second
derivatives on the bounded, positive-trace region used by
these segments. The normalized actual and model matrices
have a common positive eigenvalue floor depending on \(r\)
by the lower Gram bound and a uniform upper trace bound.
The chain rule and mean-value estimate give
\[
 \sup_{\substack{R/2\le|x|\le R\\ (u,v)\in\mathcal P}}
 \big(
 |Q-Q_{\rm mod}|+|\partial_u Q-\partial_u Q_{\rm mod}|
                     +|\partial_v Q-\partial_v Q_{\rm mod}|
 \big)\le C'_r R,\qquad Q=\mathcal Q(F).
\]
For example, in the \(u\) derivative the change of
\(D\mathcal Q\) costs \(O_r(R)\) multiplied by a bounded
model \(\partial_u F_{\rm mod}\). The actual derivative
difference costs another \(O_r(R)\) under a bounded
\(D\mathcal Q\). The \(v\) derivative is identical in its
dependence on the fixed bounds.

## Corner comparison and compact complement

At \((1,0)\), the leading entries are \(p^2,1,q^2\) and
are strictly ordered. For \(f=\log\rho\), the two derivatives
of \(f(Q_{\rm mod})\) at that corner are
\[
 \partial_u f(Q_{\rm mod})=2(1/p-1/q)>0,\qquad
 \partial_v f(Q_{\rm mod})=(1/p-1/q)/2>0 .
\]
These follow by differentiating \(\log M_3-\log M_1\)
with the factor formulas, where \(a_i=b_i=s_i\)
at \((1,0)\). Choose \(\delta_r>0\) small enough that
the closed corner box
\[
 K_r=[1-\delta_r,1]\times[-\delta_r,0]\subset\mathcal P
\]
has model ordering \(M_1<1<M_3\) throughout and the two
model derivatives each have a positive lower bound there.
Such a box exists by continuity and strictness at the
corner. Since \(K_r\) is compact, the consecutive gaps
for the normalized model on it also have a positive
lower bound. The relative-open neighborhood
\(U_r=(1-\delta_r,1]\times(-\delta_r,0]\)
contains the corner. Every straight segment from \((1,0)\)
to a point in \(U_r\) stays in \(K_r\) by convexity.

For small \(R\), the normalized actual matrices and their
segments to the model on \(K_r\) retain positive eigenvalues
and simple ordered spectra by the min–max perturbation bound
and the fixed model gaps. The scalar \(f\) has bounded first
and second matrix derivatives there. This follows by
differentiating simple eigenpairs with a positive gap and
using the lower eigenvalue bound in the two logarithms.
The uniform parameter \(C^1\) quotient estimate thus gives
uniform convergence of the two actual derivatives of \(f\)
to their model derivatives on \(K_r\). Choose \(R\) so
the two actual derivatives are positive throughout \(K_r\)
at every annular \(x\). Since \(u-1\le0\), \(v\le0\),
integrating the derivatives on the specified segment gives
\[
 f(Q(u,v,x))\le f(Q(1,0,x))=f(Q_{\rm loc}(x)),
 \qquad (u,v)\in U_r .
\]
This compares to the exact germ at the same point. The use
of positive derivatives near the corner also covers the
unperturbed parameters \((1,0)\).

The complementary set \(\mathcal P\setminus U_r\) is
compact and excludes \((1,0)\). Let its strict model gap be
\[
 \gamma_r=r-\max_{\mathcal P\setminus U_r}\rho(Q_{\rm mod})>0 .
\]
The extreme eigenvalues are 1-Lipschitz in operator norm by
the min–max formula. With the common positive eigenvalue floor
and a uniform upper bound, their ratio is uniformly Lipschitz
between the actual and model matrices. Thus for sufficiently
small \(R\) the actual ratio on this whole complement differs
from the model ratio by less than \(\gamma_r/2\).
This uses eigenvalue continuity, including at any multiplicities
away from the corner.

Finally choose \(R_*(r)>0\) below the fixed chart radius and
the E235 fixed-\(r\) local radius, and so all the above uniform
smallness requirements hold for \(0<R<R_*(r)\).
The E235 polynomial is positive definite and has
\(\rho(Q_{\rm loc}(x))<r\) throughout the punctured radius-\(R\)
ball. This controls the inner plateau and the actual corner
part of the annulus. The actual complementary annular parameters
have \(\rho<r\) by the strict model gap and its transfer.
Outside the support the connection is round and has \(\rho=1\).
At \(x_0\) it equals the E235 germ and has \(\rho=r\), proving
uniqueness of the maximizer. The global curvature is positive
on the core by E235, on the annulus by the model floor transfer,
and on the exterior by round perfection. The sign of the
curvature identification is continuous in this positive
class. Since the base is connected and the connection equals
the round one on the exterior, its sign is round-compatible
everywhere.

The wedge quotient is independent of the auxiliary positive
chart volume and unchanged by the old-to-native doubling of
the internal pairing. The old \(K=1\) reconstruction has
native metric twice the old metric and native clock twice the
old clock. Equality of connections on the inner plateau gives
equality of their local curvature quotient and original velocity
germs, so the native derivative at \(x_0\) is \(1/2\) for
\(\log\rho\) and \(r/2\) for \(\rho\). These are static
directional derivatives at the supplied connection. The
construction gives no trajectory or cap-preservation conclusion
in this packet. There is no uniform radius in \(r\).
[E235/E236 local derivative](../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md).

## Verified frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [E248 request](../research-progress/handoffs/SP4-CME-E248_REQUEST_v1.md) | 21de1f066ec9d74e05252613a8e432b971d6964ebf6f502a59ec1c1fbfe1a8d9 |
| [B113](../brainstorm/notes/B113_FIXED_RATIO_RADIAL_MODEL_20261123.md) | d7a6013999897e167521f1564f10cb83da4eff35934faf1d44b4c51ef349fa51 |
| [E235](235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
| [E235/E236 assessment](../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md) | c8f229dbc5421449ccc1e548af0502d5524a8bf771d7e9544efed5ce846a7c50 |
| [E243](243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md) | 7c29df2ad8a5acd3aabcce9b79e5a9e9628c784028997ce8512421c4ded50cb0 |
| [E243–E245 assessment](../reviews/E243_E245_GLOBAL_RATIO_CAP_ASSESSMENT_20261123.md) | ddd09db779021672716faf6968fb8065a78c1ac6053ea2d4459f92f3b44669e1 |

Only the named note and return were written.
