# E05 directional estimate for the marked pole on profile A

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. The actual serving variant and reasoning effort were unavailable.
SP4-M2-E05 is bounded execution on the working tree at
`6a422ce7814fe1ad278d6904970e3b19b05a9890`. The frozen inputs, with
SHA-256 prefixes, were the [request](../research-progress/handoffs/REQUEST_M2_DIRECTIONAL_BOUND_20261127.md)
(`7f18fe28a6b432fcf`),
[ZERO-B01](../../investigations-2/02_zero_circles/brainstorm/notes/B01_GATE_SCOPE.md)
(`70fe3a0850e0270bf`),
[ZERO-E01](../../investigations-2/02_zero_circles/notes/E01_FLAT.md)
(`1a64cdcab9f95585`),
[ZERO-E02](../../investigations-2/02_zero_circles/notes/E02_GATE_TABLE.md)
(`11927731822e6546b`), and
[ZERO-E05](../../investigations-2/02_zero_circles/notes/E05_STRESS_GEOMETRY.md)
(`659762ac184ac873`).

**Disposition.** The requested lower bound holds pointwise for the marked
pole form on the oriented, smooth standard \(S^4\) with the original
Riemannian profile A, for \(t\in[-3/4,0]\). It certifies this direction
as zero-free for every \(t\in[-57/80,0]\). The bound is strictly negative
at \(t=-5/7\) and at the stress endpoint \(t=-3/4\), where it is inconclusive
about the field. The independent derivation is a written project theorem.
The rational sign checks are finite certificates.

## Fourier measure and moments

**Project theorem.** Work in the original positively oriented Euclidean end
chart with orthonormal flat chiral bases
\(E_i^\pm=(dx^{0i}\pm dx^{jk})/\sqrt2\) for cyclic \(i,j,k\).
Let \(u=(1,1,1)^{\mathsf T}/\sqrt3\), and let \(V_t(x)u\) be the flat plus
coefficients of the pole form with leading coefficient \(u\).
For the scalar graph \(\mu=t F I_3\), the flat minus coefficients are
\(tF V_t(x)u\). Thus the closedness multiplier \(T\) of ZERO-E01 gives
\(V_tu=u+tT(FV_tu)\), where \(T\) on a function denotes the Fourier
multiplier with symbol \(T(\xi)\).

Write \(h\) for the unmollified one-dimensional cubic. It equals
\(\tfrac32\mathbf 1_{[-1/2,1/2]}^{*4}\), as follows by multiplying
\(\frac16\sum_{j=0}^4(-1)^j\binom4j(s+2-j)_+^3\) by \(3/2\) and
evaluating on the knot intervals. With inverse Fourier convention
\(f(x)=\int e^{ix\cdot \xi}\widehat f(\xi)\,d\xi\), the Fourier measure
of \(h\) has density
\[
 \frac{3}{4\pi}\left(\frac{\sin(\xi/2)}{\xi/2}\right)^4 .
\]
It is even, absolutely continuous, and has mass \(h(0)=1\).
Its fourfold tensor product \(\mathbb P\) is the Fourier measure of
\(\prod_{k=0}^3 h(x_k)\). A random vector \(X\) with law \(\mathbb P\)
has independent identically distributed coordinates, and the law is
invariant under signed coordinate permutations.

For the specified real weights \(w_j\), centers \(c_j\) and probability
mollifier \(\rho\), define
\[
 L(\xi)=\sum_j w_j e^{-ic_j\cdot\xi},\qquad
 Q(\xi)= L(\xi)\prod_{k=0}^3\int_{\mathbb R} e^{-is\xi_k}\rho(s)\,ds .
\]
The Fourier measure of \(F\) is \(Q\,d\mathbb P\), with \(|Q|\le |L|\).
In particular,
\[
 \mathbb E|Q(X)|^2\le \mathbb E|L(X)|^2
   =\sum_{i,j}w_i w_j\prod_{k=0}^3 h(c_{i,k}-c_{j,k})
   = b_A^2=\frac{4403963}{6150400}.
\]
The middle equality keeps the signs of all translation terms. Substitution
of the profile A weights and centers into this polynomial expression
reproduces the last fraction.

The symbol \(T(\xi)\) is orthogonal for \(\xi\ne0\).
In the ZERO-E01 matrix, each diagonal numerator is a difference of two
pairs of coordinate squares. After division by \(|X|^2\), the four expected
normalized squares are equal. Each off-diagonal term is a product of
distinct coordinates divided by \(|X|^2\), so reflection of one coordinate
gives zero expectation. This proves \(\mathbb E T(X)=0\).

For \(X=(a,b,c,d)\) and \(r=|X|\), the same numerator gives
\[
 q(X)=u^{\mathsf T}T(X)u
 =\frac{a^2-(b^2+c^2+d^2)/3+(4/3)(bc+bd+cd)}{r^2}.
\]
Let \(A_4=\mathbb E(a^4/r^4)\) and \(B_4=\mathbb E(a^2b^2/r^4)\).
Expanding \(r^4/r^4\) and using exchangeability gives \(4A_4+12B_4=1\).
The mixed products of the square terms with the off-diagonal terms,
and the cross products among \(bc,bd,cd\), integrate to zero by sign
symmetry. The square of the diagonal part therefore contributes
\(4A_4/3-4B_4/3\), and that of the off-diagonal part contributes
\(16B_4/3\). Hence \(\mathbb E q(X)^2=4A_4/3+4B_4=1/3\).
All the normalized quantities are bounded, and \(X=0\) has probability
zero.

## Symmetrized Picard series

**Project theorem.** Let \(X_1,\ldots,X_n\) be independent copies of \(X\)
and \(S_j=X_1+\cdots+X_j\). The plus coefficient is
\(V_t(x)u=u+\sum_{n\ge1}t^n W_n(x)u\), where
\[
 W_n(x)u=
 \mathbb E\!\left[e^{ix\cdot S_n}\prod_{j=1}^n Q(X_j)
 T(S_n)\cdots T(S_1)u\right].
\]
This follows by iterating the graph equation using the Fourier convolution
formula. The scalar weights commute with the matrices because the graph
is \(tF I_3\). Each \(S_j\) is absolutely continuous, so its zero event
does not affect the formula. The series converges uniformly since
\(|W_n(x)u|\le (\mathbb E|Q|)^n\le b_A^n\) and \(|t|b_A<1\).
The Fourier iterates also agree with the \(L^2\) iterates for the correction
in ZERO-E01, since \(\|tF\|_\infty\le |t|<1\) and the first forcing term
has compact support. The limits agree as distributions. This is the
smooth closed, metric-self-dual form with the specified end coefficient:
the \(L^2\) minus correction is compactly supported and its transferred plus
correction is \(O(|x|^{-4})\) on the flat end. The project pole
identification uses that the difference of two plus corrections with the
same minus part is a decaying closed flat self-dual form, whose harmonic
coefficients vanish. [ZERO-E01 and B03 replay](../../investigations-2/02_zero_circles/reviews/E01_B03_REPLAY.md)

For \(n=1\), Cauchy–Schwarz and the second moment of \(q\) give
\(|u^{\mathsf T}W_1(x)u|\le b_A/\sqrt3\).
For \(n\ge2\), exchange \(X_1\) and \(X_2\) inside the expectation and
average the two representations before taking absolute values. The
Fourier factor and the matrices \(T(S_j)\) for \(j\ge2\) are unchanged.
Thus \(T(S_1)u\) is replaced by \(D=(T(X_1)+T(X_2))u/2\).
Orthogonality and independence give
\[
 \mathbb E|D|^2=\frac14\bigl(2+2|\mathbb E[T(X)u]|^2\bigr)=\frac12 .
\]
The row vector \(u^{\mathsf T}T(S_n)\cdots T(S_2)\) has norm one, so
\[
 \left|u^{\mathsf T}W_n(x)u\right|
 \le
 \left(\mathbb E\prod_{j=1}^n|Q(X_j)|^2\right)^{1/2}
 \left(\mathbb E|D|^2\right)^{1/2}
 \le \frac{b_A^n}{\sqrt2}.
\]
Independence is used among the increments in each expectation, and
Cauchy–Schwarz handles the dependence between \(D\) and the Fourier weight.
The coefficient field is real by Fourier conjugation symmetry. With
\(v=|t|b_A\), subtracting the absolute bounds from the constant term gives
\[
 u^{\mathsf T}V_t(x)u
 \ \ge\ H(v):=1-\frac{v}{\sqrt3}-\frac{v^2}{\sqrt2(1-v)}
 \qquad\text{for all }x\in\mathbb R^4 .
\]

## Exact sign checks

**Certificate.** Put \(H(v;p,q)=1-pv-qv^2/(1-v)\). It decreases
strictly in \(v\in[0,1)\) for \(p,q>0\) and decreases in \(p,q\) for
\(v>0\). Squaring positive rationals gives
\[
 \frac{57735}{10^5}<\frac1{\sqrt3}<\frac{57736}{10^5},
 \qquad
 \frac{70710}{10^5}<\frac1{\sqrt2}<\frac{70711}{10^5}.
\]
For each row, the inequality against \(v\) follows by comparing \(r^2\)
with \(t^2(4403963/6150400)\). The last column compares \(H(v)\)
with \(H(r;p,q)\) evaluated with the respective rational bounds on
\(p=1/\sqrt3\) and \(q=1/\sqrt2\).

| \(t\) | Rational comparison | \(H(r;p,q)\) | Consequence |
| --- | --- | --- | --- |
| \(-57/80\) | \(v<60292/10^5=r\) | \(4530896249/992700000000\), using upper \(p,q\) | \(H(v)>4/1000\) |
| \(-5/7\) | \(v>60442/10^5=r\) | \(-2608719493/1318600000000\), using lower \(p,q\) | \(H(v)<-1/1000\) |
| \(-3/4\) | \(v>63464/10^5=r\) | \(-33317839291/228350000000\), using lower \(p,q\) | \(H(v)<-14/100\) |

The positive check at \(-57/80\) gives a uniform \(4/1000\) directional
margin throughout \([-57/80,0]\). It extends past the old all-directions
threshold \(v=1/2\), since \((57/80)^2 b_A^2>1/4\).
The strict monotonicity locates the unique zero of \(H(s b_A)\) in
\(57/80<s<5/7\), with \(s=|t|\).

**Sign and scope.** A positive lower bound proves positivity of the
projection onto the specified \(u\) in the original flat end basis,
hence zero-freeness of this pole form on \(S^4\setminus\{p\}\).
The coefficient in the metric orthonormal self-dual basis is
\((1-tF)V_tu\), by writing \(a\,dx^0\) as the orthonormal first covector
for \(a=(1+tF)/(1-tF)\). On this nonpositive A segment \(F\ge0\), so
the same positive number bounds the metric norm from below in the
asymptotically Euclidean representative. When \(H=0\), the displayed
inequality gives nonnegativity of the flat projection. A negative
\(H\) leaves the sign of the projection and any zeros unresolved.
The directional result concerns one pole and one direction only. The
same-profile positive Yamabe and subcritical chiral-energy certificate
in ZERO-E05 is for the original endpoint \(t=-3/4\), where this
directional bound remains inconclusive.
