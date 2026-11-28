# SP4-TWA-E14 · Exact Hessian and first Dirichlet crossing

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E14_REQUEST_v1.md)
records GPT-6.2 Astra/ultra as the author-selected lead and GPT-6.2 Sol/ultra
as the configured helper. Actual backend model and reasoning effort were
unavailable. HEAD was **280376dd7a1820fa2878d0ab0ee2e639facb2eeb**.
All seven frozen input digests matched.

Use the oriented flat Riemannian \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\),
orientation \(dt\wedge dx_1\wedge dx_2\wedge dx_3\), the periodic spin
structure, and \(\sigma\) a parallel unit positive half-spinor. Positive
chirality is the one on which self-dual two-forms act. Use the real part of
the Hermitian pairing, Clifford square \(X\cdot X=-|X|^2\), and \(S=J^4\).
At fixed traces \(e^{\pm b}\sigma\), the reference stationary field is
\(\psi_b=e^{bt}\sigma\). The following crossing is for its real
homogeneous Dirichlet Hessian. The first crossing is
\[
 b_*=\frac32\frac{(2\pi)^2+(\pi/2)^2}{2\pi}=\frac{51\pi}{16}.
\]
For \(0<|b|<b_*\) this Hessian is coercive. At \(|b|=b_*\) it is
nonnegative with six-dimensional real kernel. For every \(|b|>b_*\), a
smooth zero-free field with the same end traces has strictly less action
than \(\psi_b\). At \(b=0\) the entire Hessian vanishes.

## Clifford sign and stationarity

Write \(e_0=\partial_t\), \(e_i=\partial_{x_i}\), and use the parallel
quaternion model sending the tangent basis to \(1,I_1,I_2,I_3\), with
\(I_i I_j=-\delta_{ij}+\sum_k\epsilon_{ijk}I_k\). One can realize the
full Clifford action by
\[
 c(v)(s_+,s_-)=(v s_-,-\overline v\,s_+).
\]
Then \(c(e_0)c(e_i)\) acts on the first summand by \(+I_i\) on the left,
and the self-dual \(e^0\wedge e^1+e^2\wedge e^3\) acts there by
\(2I_1\) and vanishes on the other summand. This fixes the chirality
and the sign of the spatial orientation in the calculation. Identify
the first summand with \(\mathbb H\) by using \(\sigma\) for \(1\), with
\(I_i\sigma\) its other real basis vectors. In this basis write
\(v=u+w\), with \(u\) real, \(w\) imaginary and represented by a
spatial real vector field. The twistor operator \(P=\Pi d\) uses the
orthogonal Clifford projection \(\Pi=I-c^*c/4\), where \(c\) is Clifford
contraction when applied to a one-form tensor.

Set \(A z=\Pi(dt\otimes z)\), \(a=bA\sigma\), \(k^2=|a|^2=3b^2/4\),
and \(B=P+bA\), as in [E08](E08_LOCAL_DIRICHLET.md).
Then \(A^*A=(3/4)I\), and \(A^*T=T(e_0)\) on the projection range.
For \(\psi=e^{bt}(\sigma+v)\) the action has density
\(|a+Bv|^4|\sigma+v|^{-4}\). Its first variation at \(v=0\) is
\(4k^2(a,Pv)\), since \(bA^*a=k^2\sigma\) cancels the zero-order
terms. This is a divergence with constant coefficients and has zero
integral for zero trace. In particular stationarity holds for all
real \(b\). The value of \(S(\psi_b)\) is \(2k^4=9b^4/8\).

The additive field \(v=u+w\) is also the first derivative of the
log-amplitude and unit-quaternion variation
\(e^{bt}e^{\epsilon u}\exp(\epsilon w)\) in this identification.
Both paths have the exact base traces if \(u=w=0\) there. Their
second derivatives of the action coincide at the stationary
field, since their second-order acceleration difference has
zero trace.

## Exact integrated Hessian

For \(Y=Bv\) the second derivative of the density at the base is
\[
4k^2|Y|^2+8(a,Y)^2-32k^2(a,Y)u+k^4(24u^2-4|v|^2).
\]
Let \(\ell=(\sigma,(Pv)(e_0))\). Then \((a,Y)=b\ell+k^2u\)
and \((Pv,Av)=((Pv)(e_0),v)\). Expanding cancels all zero-order
terms, leaving
\[
4k^2|Pv|^2+8b^2\ell^2+
8bk^2\big(((Pv)(e_0),v)-2u\ell\big).
\]
With the oriented spatial divergence and curl,
\[
(Pv)(e_0)=\tfrac34\partial_t(u+w)
+\tfrac14\big(-\operatorname{div}_x w+\nabla_x u+
                         \operatorname{curl}_x w\big),
\qquad \ell=\tfrac14(3u_t-\operatorname{div}_x w).
\]
Here the displayed spatial expression follows by expanding
\(\sum_i I_i\partial_i(u+w)\) using the quaternion product. In
particular,
\[
 ((Pv)(e_0),v)-2u\ell
 =\tfrac38\partial_t\big(|w|^2-u^2\big)
 +\tfrac14\operatorname{div}_x(uw)
 +\tfrac14 w\cdot\operatorname{curl}_x w .
\]
The first two terms integrate to zero by zero end traces and
periodicity. The integrated flat twistor identity
\(\|Pv\|_2^2=(3/4)\|\nabla v\|_2^2\) follows from zero extension in
\(t\) and Plancherel, since
\(|\Pi(\xi\otimes z)|^2=(3/4)|\xi|^2|z|^2\).
Therefore the diagonal of the full real Hessian in the conjugated
coordinates is
\[
\begin{aligned}
\mathcal H_b(v,v)={}&
  \tfrac94 b^2\int_M (|du|^2+|dw|^2)
 +\tfrac12 b^2\int_M(3u_t-\operatorname{div}_x w)^2\\
 &+\tfrac32 b^3\int_M w\cdot\operatorname{curl}_x w .
\end{aligned}
\]
The bilinear form follows by real polarization. These identities first
hold for smooth zero-trace variations and extend continuously to the
homogeneous \(H^1\) form domain. Physical variations at \(\psi_b\) are
\(e^{bt}v\), a bounded invertible change on that domain, so signs and
kernel dimensions agree with the form in physical variables.

## Frequencies, threshold and nullity

For spatial frequency \(j\in\mathbb Z^3\) put \(\xi=2\pi j\).
At \(j=0\) the helicity term vanishes and the gradient term is
strictly positive at \(b\ne0\) on nonzero variations, by time
Dirichlet. At \(j\ne0\) decompose the imaginary coefficient into
longitudinal and transverse parts relative to \(\xi\). The scalar
and longitudinal block contains the squared gradient and the
nonnegative \((3u_t-\operatorname{div}_x w)^2\) term, and has no curl
term. This block is strictly positive and separate from the
transverse block. On the complexified transverse plane \(i\xi\times\)
is Hermitian with eigenvalues \(h\lambda\) for \(h=\pm1\) and
\(\lambda=|\xi|\). Each helicity line is complex one-dimensional.

Expand the time coefficients on the transverse lines in the Dirichlet
sine basis \(\sin(\omega_n(t+1))\), \(\omega_n=n\pi/2\), \(n\ge1\).
This basis diagonalizes \(\|\partial_t w\|_2^2\) on zero-trace
coefficients. The transverse \(L^2\) Hessian eigenvalues in the
conjugated variables are
\[
 k^2\big[3(\lambda^2+\omega_n^2)+2b h\lambda\big].
\]
For a real variation the coefficients at \(j\) and \(-j\) are complex
conjugates, and conjugation carries the \(h\)-line at \(\xi\) to the
\(h\)-line at \(-\xi\). Thus an opposite-frequency pair and fixed
\((n,h)\) contributes two real directions.

For \(b\ne0\), zeros and negative modes can occur only for
\(h=-\operatorname{sgn}(b)\). Their thresholds are
\(\tfrac32(\lambda^2+\omega_n^2)/\lambda\). The minimum over \(n\) is
at \(n=1\). With \(\omega_1=\pi/2\), the function
\(\lambda+\omega_1^2/\lambda\) is strictly increasing for
\(\lambda\ge2\pi\); hence its lattice minimum is attained exactly at
\(|j|=1\), giving \(b_*\). It follows also that for \(0<|b|<b_*\),
\[
 \mathcal H_b(v,v)\ \ge\
 \tfrac94 b^2(1-|b|/b_*)\|\nabla v\|_2^2.
\]
Indeed the bound holds on the transverse frequencies by the threshold
inequality, and the scalar, longitudinal and spatially constant
blocks have the full gradient term. At equality \(|b|=b_*\), only
\(n=1,\ |j|=1,\ h=-\operatorname{sgn}(b)\) lie in the kernel.
The six signed lattice frequencies form three opposite pairs, giving
six real dimensions. Equivalently the complexified kernel has a
complex dimension of six, with one line per signed frequency.
For any other \(b\ne0\), a zero eigendirection occurs exactly at one of
the listed resonances, with two real dimensions per resonant pair
\(\{j,-j\}\) and temporal \(n\). At \(b=0\) the common factor \(b^2\)
forces the Hessian to vanish on the entire form domain.

## Explicit cheaper field

For \(b\ne0\), let \(\epsilon_b=\operatorname{sgn}(b)\) and take the
real, smooth Dirichlet vector field
\[
 w(t,x)=\cos(\pi t/2)
 \left(0,\ \cos(2\pi x_1),\ \epsilon_b\sin(2\pi x_1)\right),
 \qquad u=0 .
\]
It has zero spatial divergence, curl \(-\epsilon_b 2\pi w\), and
\(\|w\|_2^2=1\). With \(W=\sum_i w_i I_i\sigma\), the competitor
\(\psi_{b,\epsilon}=e^{bt}(\sigma+\epsilon W)\) has the same traces
and squared pointwise norm \(e^{2bt}(1+\epsilon^2|w|^2)>0\).
Its action is \(C^\infty\) in \(\epsilon\) near zero. The first
derivative vanishes. The second is
\(k^2[3((2\pi)^2+(\pi/2)^2)-2|b|(2\pi)]\), which is strictly negative
for every \(|b|>b_*\). Taylor's theorem then gives a strictly cheaper
field for any sufficiently small nonzero \(\epsilon\) at each such
fixed \(b\). Thus the first sign crossing occurs at the proposed
threshold and yields a genuine loss of minimality above it in the
smooth fixed-trace class.

## Sources and scope

The frozen [overview](../research-overview/OVERVIEW.md),
[B08 decision](../brainstorm/notes/B08_SLOPE_AND_HELICITY.md),
and [E08 Hessian](E08_LOCAL_DIRICHLET.md) fix the background and
conjugation. The [B07 closing](../continuation-notes/CLOSING_B07_GLOBAL_MINIMUM_20261128.md),
[E11 comparison](E11_GLOBAL_COMPARISON.md), [E12 estimate](E12_CYLINDER_CONSTANT.md)
and [E13 replay](../reviews/E13_GLOBAL_MINIMUM_REPLAY.md) give context
for the previous sufficient global bound. Friedrich's §1, p. 59,
projection and equation (1.1) were rechecked on 28 November for the
Riemannian twistor convention. The oriented Clifford sign, Hessian,
spectral calculation and cheaper fields above are direct.
[Friedrich](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

The sign crossing is a second-variation statement on the fixed product.
Global comparison below the threshold and the behavior of the action
along the null directions at the threshold are separate B08 questions.
