# Unrestricted minimization on a larger slope interval · SP4-TWA-E16

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [frozen request v1](../research-progress/handoffs/E16_REQUEST_v1.md)
records the author-selected GPT-6.2 Astra/ultra lead and configured
GPT-6.2 Sol/ultra helper. Actual backend model and reasoning effort
were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`
and all seven frozen input SHA-256 digests matched at inspection.

Let \(M=[-1,1]\times Y\), \(Y=(\mathbb R/\mathbb Z)^3\), have its
oriented flat Riemannian product metric and periodic spin structure.
Use the positive half-spin bundle on which real self-dual two-forms
act, Clifford square \(X\cdot X=-|X|^2\), the Levi–Civita spin
connection, and real parts of Hermitian pairings. Let \(\sigma\) be
a unit parallel positive spinor. For a fixed real \(b\), prescribe
traces \(e^{-b}\sigma,e^b\sigma\) in order of increasing \(t\).
The competitors are smooth up to the boundary. They may be zero-free
or have finitely many isolated transverse interior zeros with the
compatible first jet \(P\psi=0\) at each zero. The action is the
[overview's](../research-overview/OVERVIEW.md)
\(S_g=J_g^4=\int_{M\setminus Z(\psi)}|P\psi|^4|\psi|^{-4}\,dV\).

Define the constants

\[
s=\frac{19+6\sqrt2}{32},\qquad
\alpha=\frac{9\sqrt3}{16\pi s^3},\qquad
b_*=\sqrt{\frac{3/4}{4\alpha-3/\pi^2}} .
\]

For every fixed \(|b|<b_*\) the unique minimizer over the full
prescribed-trace class is \(e^{bt}\sigma\), with minimum \(9b^4/8\).
Every smooth admissible minimizing sequence at those fixed traces
converges strongly in \(H^1\) to that field. The exact comparison
radius satisfies \(2/3<b_*<3/4\) and is approximately \(0.67344\).
In particular the result includes the closed interval \(|b|\le2/3\).

## Sobolev bound with mass retained

For \(v\in H^1(M;S^+_{\mathbb R})\) with zero trace at both end faces,
let \(\widetilde v\) be its tangential periodic lift extended by zero in
time. The zero end traces exclude jump terms, so it is locally \(H^1\)
on \(\mathbb R^4\). Its norm \(g=|\widetilde v|\) satisfies
\(|\nabla g|\le|\nabla\widetilde v|\) almost everywhere by the Sobolev
chain rule, including at the zeros. The real scalar Euclidean inequality
is \(\|w\|_{L^4(\mathbb R^4)}\le C_E\|\nabla w\|_{L^2(\mathbb R^4)}\)
for compactly supported \(H^1\) functions. Here
\(C_E=(3/(32\pi^2))^{1/4}\) follows by setting \(m=4,p=2\) in Talenti's
formula (2), with gamma quotient \(6\). Smooth mollification and Fatou
give this version on compactly supported \(H^1\). [E12 extension and scalar reduction](E12_CYLINDER_CONSTANT.md) ·
[Talenti, published p. 353, theorem (1)–(2)](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1)

Take the product cutoff \(\chi(x)=\prod_{j=1}^3\theta(x_j)\) with
\(\theta(y)=\cos(\pi y/2)\) for \(|y|\le1\) and \(\theta=0\) otherwise.
For \(a\in[0,1)^3\), set \(w_a(t,x)=\chi(x-a)g(t,x)\). These are compactly
supported \(H^1\) functions. Integrate with respect to \(a\) over the
unit cube with Lebesgue measure. For \(h(y)=\sum_{\ell\in\mathbb Z}
\theta(y+\ell)^4\), the periodization of \(\chi^4\) is the product of
three copies of \(h\), and

\[
h(y)=\cos^4(\pi y/2)+\sin^4(\pi y/2)
     =1-\tfrac12\sin^2(\pi y),\qquad 0\le y\le1.
\]

When \(v\) is nonzero, normalize \(|v|^4dV/\|v\|_4^4\) to a probability
measure on \(M\). By periodicity, the quotient
\(\|w_a\|_4^4/\|v\|_4^4\) is the expectation of
\(\prod_j h(x_j-a_j)\) under this measure. Concavity of the square
root implies

\[
\int_{[0,1)^3}\|w_a\|_4^2\,da
\ \ge\
\|v\|_4^2\left(\int_0^1\sqrt{h(y)}\,dy\right)^3.
\]

This is also valid for \(v=0\). For \(u=\tfrac12\sin^2(\pi y)\) in
\([0,1/2]\) the elementary identity

\[
1-\tfrac12u-\sqrt{1-u}=\frac{u^2}{2(1+\sqrt{1-u})^2}
\le (3-2\sqrt2)u^2
\]

and the means \(\int_0^1 u\,dy=1/4\), \(\int_0^1 u^2\,dy=3/32\)
give \(\int_0^1\sqrt{h(y)}\,dy\ge s\).

For the gradient, unfold the \(x\)-integral into unit lattice cells.
After integrating in \(a\), the shift variable in any periodized
coefficient runs once over all of \(\mathbb R^3\). The pure gradient
and mass coefficients are \(\int_{\mathbb R^3}\chi^2=1\) and
\(\int_{\mathbb R^3}|\nabla\chi|^2=3\pi^2/4\) because
\(\int_{\mathbb R}\theta^2=1\), \(\int_{\mathbb R}|\theta'|^2=\pi^2/4\).
The mixed coefficient \(\int_{\mathbb R^3}\chi\nabla\chi\) vanishes
by integrating the derivative of \(\chi^2/2\). Writing the unfolded
energy on the fundamental cylinder gives

\[
\int_{[0,1)^3}\|\nabla w_a\|_2^2\,da
=\|\nabla|v|\|_2^2+\frac{3\pi^2}{4}\|v\|_2^2
\le \|\nabla v\|_2^2+\frac{3\pi^2}{4}\|v\|_2^2.
\]

Integrating the squared Euclidean Sobolev inequality therefore proves

\[
\|v\|_4^2
\le\frac{C_E^2}{s^3}
 \left(\|\nabla v\|_2^2+\frac{3\pi^2}{4}\|v\|_2^2\right).
\tag{1}
\]

For almost every fixed torus point, the time sine basis
\(\sin(n\pi(t+1)/2)\), \(n\ge1\), for zero endpoint data gives the first
Dirichlet eigenvalue \(\pi^2/4\) on \([-1,1]\). Integrating the component
estimates on \(Y\) yields the sharp time Poincaré bound
\(\|v\|_2^2\le (4/\pi^2)\|\partial_t v\|_2^2\).
Consequently \(\|v\|_4\le C_M\|\nabla v\|_2\) with
\(C_M^2=4C_E^2/s^3\). The mass term in (1) will be combined with the
quadratic numerator before Poincaré is used.

## Exact numerator and the sufficient interval

Use \(A=\Pi(dt\otimes\cdot)\), \(B=P+bA\), \(k^2=3b^2/4\), where
\(\Pi=I-c^*c/4\) is the orthogonal projection associated to Clifford
contraction \(c\). In the parallel frame let \(e_0=\partial_t\),
\(J_j=e_0\cdot e_j\cdot\), and \(K=\sum_{j=1}^3 J_j\partial_j\).
For \(T\) in the range of \(\Pi\), \(A^*T=T(e_0)\). Thus

\[
A^*Pv=\tfrac34\partial_t v+\tfrac14Kv.
\]

Using \(\|Pv\|_2^2=(3/4)\|\nabla v\|_2^2\), \(A^*A=3I/4\), and
\(\int_M(v,\partial_t v)\,dV=0\) for zero end traces yields

\[
\|Bv\|_2^2=\tfrac34\big(\|\nabla v\|_2^2+b^2\|v\|_2^2\big)
           +\tfrac b2\int_M(v,Kv)\,dV .
\tag{2}
\]

For a tangential Fourier frequency \(\xi=2\pi n\) with
\(n\in\mathbb Z^3\), the symbol \(i\sum_j\xi_jJ_j\) on the complexification
of the real fiber is Hermitian and has square \(|\xi|^2 I\) by the
Clifford anticommutator. It vanishes at frequency zero. On every
nonzero mode \(|\xi|\le |\xi|^2/(2\pi)\), so Parseval and integration in
time imply \(|\int_M(v,Kv)\,dV|\le\|\nabla_Yv\|_2^2/(2\pi)\).
[Flat homogeneous identity and operator convention](E08_LOCAL_DIRICHLET.md#conjugation-stationarity-and-coercivity)

For a competitor set \(f=e^{-bt}\psi=\sigma+v\); then \(v\) has zero
end traces. The product rule gives \(Bf=e^{-bt}P\psi\). At every admitted
transverse zero, \(|f|\) is comparable to the distance \(r\) and
\(|Bf|=O(r)\) by the compatible first jet. Define \(q=|Bf|/|f|\)
off these zeros and \(q=0\) on them. Then \(q\in L^4\),
\(J_g(\psi)=\|q\|_4\), and Hölder gives
\(\|Bf\|_2^2\le J_g(\psi)^2\|f\|_4^2\). Equality in Hölder holds
exactly for \(q^2=\lambda |f|^2\) almost everywhere for some
\(\lambda\ge0\), since \(\|f\|_4>0\). In particular at \(f=\sigma\)
one has equality with \(\lambda=k^2\).

The E11 affine cancellation and the upper Taylor remainder bound
\(3\|v\|_4^2\) for \(f\mapsto\|f\|_4^2\) use \(b\) only through
\(k^2\) and the zero-trace integration by parts. Specifically,
\(\|Bf\|_2^2=2k^2+2k^2\int_M(\sigma,v)\,dV+\|Bv\|_2^2\), while
\(k^2\sqrt2\|f\|_4^2\) has the same first two terms and its remainder
is bounded above by \(3k^2\sqrt2\|v\|_4^2\). The Taylor estimate has
the real Hilbert-valued and origin-inclusive scope proved in E11.
Thus, for every real \(b\),

\[
\big(J_g(\psi)^2-k^2\sqrt2\big)\|f\|_4^2
\ge \|Bv\|_2^2-3k^2\sqrt2\|v\|_4^2.
\tag{3}
\]

[E11 conjugation and global Taylor estimate](E11_GLOBAL_COMPARISON.md#conjugation-and-exact-affine-cancellation)

Inserting (1) into (3) costs
\(\alpha b^2(\|\nabla v\|_2^2+(3\pi^2/4)\|v\|_2^2)\), since
\((9\sqrt2/4)C_E^2/s^3=\alpha\). Combine this with (2). The total
mass coefficient \(b^2(3/4-(3\pi^2/4)\alpha)\) is nonpositive,
so time Poincaré and the tangential Fourier bound give

\[
\begin{aligned}
\big(J_g(\psi)^2-k^2\sqrt2\big)\|f\|_4^2
&\ge c_t(b)\|\partial_t v\|_2^2+c_Y(b)\|\nabla_Yv\|_2^2,\\
c_t(b)&=\tfrac34-(4\alpha-3/\pi^2)b^2,\qquad
c_Y(b)=\tfrac34-\alpha b^2-\frac{|b|}{4\pi}.
\end{aligned}
\tag{4}
\]

For rational certification, \(25/8<\pi<22/7\),
\(141/100<\sqrt2<3/2\), and \(12/7<\sqrt3<26/15\) give
\(1373/1600<s<7/8\). Inserting the respective bounds in \(\alpha\)
gives

\[
\frac9{20}
<
\frac{9(12/7)}{16(22/7)(7/8)^3}
<
\alpha
<
\frac{9(26/15)}{16(25/8)(1373/1600)^3}
<
\frac{99}{200}.
\]

In particular \(\pi^2\alpha>1\) for the mass sign in (4), and
\(4\alpha-3/\pi^2>22/15>0\), which gives
\(b_*^2<45/88<(3/4)^2\). Also \(\pi^2<10\) implies
\(c_t(2/3)>3/4-(4/9)(4\cdot99/200-3/10)=1/300\), so \(b_*>2/3\).
For \(|b|\le3/4\), \(c_Y(b)>3/4-(99/200)(9/16)-1/16>0\).
Both factors in (4) are therefore positive on \(|b|<b_*\).
The [E12 positive-margin radius](E12_CYLINDER_CONSTANT.md#absorption-at-the-prescribed-slope),
\((2+24\sqrt{3\sqrt2})^{-1}\), is less than \(1/26\).

## Attainment, equality and evidence scope

For each fixed \(b\) in the interval let \(c_b=\min\{c_t(b),c_Y(b)\}>0\).
The radial field is zero-free and gives \(q=k\), with
\(k=\sqrt3|b|/2\). Its cost is \(2k^4=9b^4/8\).
By (4), every competitor has at least that cost. For equality,
\(\nabla v=0\) and the two zero end traces force \(v=0\). The case
\(b=0\) gives zero action only at the constant field. Incompatible
transverse zeros, if included with extended cost \(+\infty\), do not
affect the finite minimum. At such a zero the nonvanishing twistor
derivative and the linear vanishing of the spinor give logarithmic
divergence exactly as in the fixed-trace proof.

For a sequence at these fixed traces with \(J_g^4\to 9b^4/8\), put
\(\delta_n=J_g(\psi_n)^2-k^2\sqrt2\) and \(x_n=\|\nabla v_n\|_2\).
For its finite-cost tail, (4) and (1) give
\(\sqrt{c_b}\,x_n\le\sqrt{\delta_n}(2^{1/4}+C_Mx_n)\).
As \(\delta_n\to0\), the \(C_M\sqrt{\delta_n}\,x_n\) term is absorbed
for all sufficiently large \(n\), yielding \(x_n\to0\).
Time Poincaré then gives \(v_n\to0\) in \(H^1\). Multiplication by
the fixed smooth \(e^{bt}\) gives \(\psi_n\to e^{bt}\sigma\) in \(H^1\).

The sufficient interval and estimates concern the fixed flat cylinder
and the single trace pair for each prescribed \(b\). At \(|b|=b_*\)
the displayed \(c_t\) vanishes; beyond that value this certificate
does not give a positive longitudinal margin. The global transition
and the local Hessian crossing are separate questions.

Checked the seven frozen inputs, including the
[fixed-slope comparison replay](../reviews/E13_GLOBAL_MINIMUM_REPLAY.md)
and the [B08 decision](../brainstorm/notes/B08_SLOPE_AND_HELICITY.md).
Rechecked Talenti's p. 353, theorem (1)–(2), in the published scan on
28 November 2026. The cutoff averaging, Fourier estimate, and rational
range certification are direct derivations here.
[Published source](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1)
