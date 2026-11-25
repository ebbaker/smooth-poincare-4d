# Independent check of the chiral Cotton obstruction

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The request specifies gpt-6.2-sol/ultra. Serving
model and effort are unavailable. Input checkout
7db310a2a9219c537b440d7c2fb39e602a32b729 and E22 note SHA-256
08e942d9368f50f03669c801b5d30e2cfe6929ad08953f8dbb8d0dd0ed37c9f6.
The calculation applies to a smooth oriented Riemannian four-manifold.
Connectedness, compactness, the absence of boundary, and the first
cohomology condition enter as specified below.
[Frozen check](../research-progress/handoffs/COTTON_CHECK_REQUEST_20261125.md) · [E22 derivation](../notes/E22_THIRD_COLLAR_20261125.md)

## Conventions and Bach calculation

Write \(C=(W^+)_{\rm low}\), \(D_{jkl}=\nabla^iC_{ijkl}\),
\(L(\alpha)_{jkl}=\alpha^i C_{ijkl}\), and \(w=|W^+|_{\rm HS}\) on
\(\Lambda^+\). In an orthonormal eigenbasis of two-forms, contraction of
the first pair by a covector has squared norm \(|\alpha|^2/2\) in
each eigenline. The ordered sum over the remaining skew pair supplies
the factor two. The off-diagonal terms vanish by orthogonality in that
pair. Thus \(L^*L=w^2\,{\rm Id}\) using the full three-index norm.

The conformal connection correction on \(C\) and its weight \(2\)
give the coefficient \(n-3=1\) on \(L(df)\) in dimension four. This
calculation uses the trace-free and Bianchi identities of the algebraic
Weyl tensor, also satisfied by the chiral block. The one-form metric
scales by \(e^{-2f}\) and the three-tensor metric by \(e^{-6f}\) under
\(\widehat g=e^{2f}g\). Thus \(\widehat L=L\),
\(\widehat L^*=e^{-4f}L^*\), and \(\widehat w^2=e^{-4f}w^2\).
It follows that \(\widehat\beta=\beta-df\) and the covariant residual
\(\mathcal R=D+L(\beta)\) is invariant on \(U=\{w>0\}\). With
\(\mathcal R=D\) on \(M\setminus U\), the same invariance holds there.
The orthogonal splitting gives the \(4/3\)-power integral bound in E22,
and weighted Cauchy–Schwarz on a compact regular closed curve in \(U\)
gives the period bound. An isolated pointwise obstruction is tested by
the pointwise equation. [Gursky–McKeown–Tyrrell, published version, equations (3.3)–(3.4)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/103164BB62A5E9277B869CCA6213BD80/S1474748025101060a.pdf/self-dual-and-even-poincare-einstein-metrics-in-dimension-four.pdf)

In the stated curvature convention \(B/2=-\nabla^k D_{jik}+C_{ikjl}P^{kl}\).
Substitution of \(D_{jik}=\mathcal R_{jik}-\beta^a C_{ajik}\) gives
\[
 \tfrac12B_{ij}
 = C_{ikjl}(P^{kl}-\nabla^k\beta^l+\beta^k\beta^l)
   -\nabla^k\mathcal R_{jik}-\beta^k\mathcal R_{ikj}.
\]
In particular \(C_{ajik}=-C_{ikja}\) and
\(\nabla^k C_{ajik}=-D_{iaj}\). If \(B=0\) and \(\mathcal R=0\), the
skew part forces \(W^+((d\beta)^+)=0\). For skew \(F\),
\(C_{ikjl}F^{kl}=C_{ijkl}F^{kl}/2\) by the algebraic Bianchi identity,
and symmetric inputs to this contraction yield symmetric outputs.
The factor two in the chiral Bach formula is in §3, p. 78 of the
published LeBrun article. [LeBrun, *Einstein Manifolds and Extremal Kähler Metrics*](https://www.math.stonybrook.edu/~claude/crelle13.pdf)

## Dense invertibility and smooth extension

Suppose \(D=-L(\beta)\) on \(U\). On a rank-two open subset of \(U\), the
three eigenvalues \(\lambda,0,-\lambda\) are simple, and local smooth
unit quaternionic structures \(I,J,K=IJ\) diagonalize the block.
The fundamental form \(\omega_J(X,Y)=g(JX,Y)\) is self-dual and lies
in the kernel. Differentiate \(C_{ijkl}\omega_J^{kl}=0\) and contract
the derivative against the first index of \(C\). The term
\(D_{jkl}\omega_J^{kl}\) vanishes by the chiral divergence equation.
Expand \(\nabla J=a\otimes I+b\otimes K\) in the remaining term.
Its \(j\)-slot says \(a(IX)=b(KX)\), since
\(\omega_I(e_i,X)=-g(e_i,IX)\) and the two nonzero eigenvalues are
opposite. Hence \(b=a\circ J\).
The quaternion identities give
\((\nabla_{JX}J)JY=(\nabla_XJ)Y\), so the Nijenhuis tensor vanishes.

For the resulting Hermitian metric the positive Weyl block has the
form
\[
 \frac{\kappa}{4}\left(\frac12\omega_J\otimes\omega_J
             -\frac13{\rm Id}_{\Lambda^+}\right)
 + \widehat F\otimes\omega_J+\omega_J\otimes\widehat F,
 \qquad \langle\widehat F,\omega_J\rangle=0 .
\]
Since \(|\omega_J|^2=2\), evaluation on \(\omega_J\) gives
\(\kappa\omega_J/6+2\widehat F\). Its vanishing implies both
coefficients vanish, contrary to rank two. This reproduces the
calculation of Gover–Nagy with the chiral divergence hypothesis.
The rank-three locus is dense in \(U\) because a nonzero symmetric
trace-free endomorphism of a three-dimensional space has rank at
least two. [Gover–Nagy, §4, Theorem 4.1 and proof of Proposition 4.1](https://www.math.auckland.ac.nz/Research/Reports/Series/555.pdf)

For a connected smooth Bach-flat metric in dimension four, \(U\)
is dense in \(M\) if \(W^+\) is nonzero anywhere. Theorems 2.2 and
3.7(c) of Lassas–Liimatainen give real analyticity of the determinant
normalized metric in local conformal harmonic coordinates when the
obstruction tensor vanishes. Bach flatness supplies that condition
in this dimension. Both the curvature and the Hodge projection are
analytic in the normalized metric. The property of vanishing is
unchanged by the positive conformal rescaling or an oriented change of
coordinates. The interior of the zero set is therefore closed by the
local identity theorem, so connectedness and the nonzero block exclude
such an interior. This applies to one chiral block by the local
analytic argument. [Lassas–Liimatainen, arXiv:1912.08030v2, Theorems 2.2 and 3.7(c)](https://arxiv.org/pdf/1912.08030)

Consequently, if \(B=0\) and \(\mathcal R=0\) on \(U\),
\((d\beta)^+=0\) there by density of the invertible locus. A smooth
extension \(\bar\beta\) then has anti-self-dual exterior derivative
everywhere. On a compact manifold without boundary,
\(\int_M d\bar\beta\wedge d\bar\beta=0\) by Stokes, hence \(d\bar\beta=0\).
On a homotopy four-sphere \(H^1(M;\mathbb R)=0\), so
\(\bar\beta=df\). The harmonic equation holds everywhere by density
and continuity. Conversely any smooth harmonic scale supplies this
extension by uniqueness of the minimizing covector on \(U\).
This proves the smooth extension criterion with the residual condition.

## Einstein reduction and the remote example

In a smooth half-harmonic representative, \(B=0\) reduces to
\(C_{ikjl}P^{kl}=0\). With positive and negative quaternionic frames
\((I_a)\) and \((J_b)\), the \(I_aJ_b\) form a basis of \(S^2_0\).
The contraction on this basis is
\(\frac12\sum_c\lambda_c I_c(I_aJ_b)I_c^{-1}\).
Conjugation fixes \(I_aJ_b\) for \(c=a\) and negates it otherwise.
The trace-free sum of eigenvalues makes this contraction
\(\lambda_a I_aJ_b\). Thus \(P_0=0\) on the dense invertible locus
and then everywhere. This implication needs a nonzero harmonic
chiral Weyl block and Bach flatness. Its proof has no Yamabe-sign,
energy-band or first-cohomology premise.

In the positive-signature orientation, LeBrun's construction on
\(N=\#_4\mathbb{CP}^2\) gives \(W^-=0\). The compactification corollary
and the following positivity calculation in §5, p. 235 give a smooth
positive-Yamabe conformal class. The displayed nonnegative scalar
curvature is positive somewhere, so the lowest conformal-Laplacian
eigenvalue is positive. The signature formula gives
\(E_+=12\pi^2\tau+E_-\), with \(\tau=4\). This class attains the
unrestricted absolute minimum \(48\pi^2\) on \(N\), so it is Bach-flat
and its unrestricted Weyl Hessian is nonnegative. If a smooth
representative satisfied \(D=0\) for the nonzero block \(W^+\), the
reduction just proved would make it Einstein. The positive Yamabe
constant tested with \(1\) forces its constant scalar \(s>0\).
For \(\chi=6\), the Einstein Gauss–Bonnet and signature identities
give \(0=4\pi^2(2\chi-3\tau)=2E_-+\int_N s^2/24\,dV>0\),
a contradiction. [LeBrun, *Explicit Self-Dual Metrics on \(\mathbb{CP}^2\#\cdots\#\mathbb{CP}^2\)*, Theorem 1 and §5 corollary and exercise](https://www.math.stonybrook.edu/~claude/jdg1991.pdf)

The example rules out the unrestricted implication from Bach
flatness and nonnegative Weyl Hessian to harmonic scale. In the
positive subcritical homotopy-sphere band, the checked proof needs
\(\mathcal R=0\) and smooth extension before it can give Einstein.
Bach-flatness alone in that band leaves both conditions open.
