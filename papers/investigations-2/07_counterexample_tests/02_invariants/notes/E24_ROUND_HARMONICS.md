# WIN-E24 · Explicit mean-aware rigidity from round harmonics

28 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The [revision 1 request](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md)
specifies a bounded GPT-6.2 Sol/ultra helper. Actual serving model and effort
are unavailable. Baseline `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`,
with request SHA-256
`6f14dfe991432fcdf766cb2d187a5bb5e875365b38353b033ab1744d4c2c33fa`.
This is a working analytical proof in the round auxiliary metric.

## Round estimate

Let \(q\) be the unit round metric on \(S^4\subset\mathbb R^5\) and
\(\mu=dV_q/V_0\), where \(V_0=8\pi^2/3\). All norms and integrals in
the proof use \(\mu\). Derivative norms are Hilbert–Schmidt, with
domain metric \(q\) and Euclidean target. Let \(f:S^4\to S^4\) be smooth,
\(|\deg f|=1\), and \(\int |df|^4\,d\mu\le16+e\). Set
\(m=\int f\,d\mu\). There exists \(O\in O(5)\) with
\[
 \int |df-d(Ox)|^2\,d\mu
 \le \frac{39}{8}e+380|m|^2\le380(e+|m|^2).
\]
The estimate holds for all \(e\ge0\). The degree allows either orientation.
The arithmetic–geometric mean inequality on the four derivative singular
values gives \(|df|^4\ge16|J_f|\), so integrating and using the degree gives
\(e\ge0\) automatically. The harmonic comparison below uses only this
nonnegativity and the energy bound.

Write \(f=m+Ax+u\), where \(Ax\) is the componentwise projection onto the
span of the coordinate functions \(x_1,\dots,x_5\). The remainder \(u\)
is orthogonal in \(L^2(\mu)\) to constants and coordinates. The coordinates
have eigenvalue 4 for the nonnegative scalar Laplacian and the spectrum on
the remaining modes is at least 10. A derivation appears below. Integration
by parts gives mutual orthogonality for the derivative terms. Since
\(|f|=1\),
\[
 \|df\|_2^2=4(1-|m|^2-\|u\|_2^2)+\|du\|_2^2,
 \qquad \|du\|_2^2\ge10\|u\|_2^2.
\]
By Cauchy–Schwarz and concavity of the square root,
\(\|df\|_2^2\le\sqrt{16+e}\le4+e/8\). Thus for
\(\delta=e/8+4|m|^2\) one has
\[
 \|du\|_2^2-4\|u\|_2^2\le\delta,\qquad
 \|du\|_2^2\le\tfrac53\delta,\qquad \|u\|_2^2\le\delta/6.
\]

The second moments of the sphere coordinates are \(\delta_{ij}/5\).
Consequently \(\|A\|_F^2=5\|Ax\|_2^2\le5\), and
\(|Ax|+|f|\le\sqrt5+1<4\) pointwise. For \(B=A^\mathsf T A-I\),
\[
 \int (x^\mathsf T Bx)^2\,d\mu
 =\int (|Ax|^2-|f|^2)^2\,d\mu
 \le16\|m+u\|_2^2=16(|m|^2+\|u\|_2^2).
\]
Diagonalize \(B\) by an orthogonal change of coordinates. Reflection and
permutation invariance give two relevant fourth moments,
\(\alpha=\int x_1^4\,d\mu\) and \(\beta=\int x_1^2x_2^2\,d\mu\).
Invariance under rotation to \((x_1+x_2)/\sqrt2\) gives
\(\alpha=3\beta\), and \(1=\int (\sum_i x_i^2)^2\,d\mu=5\alpha+20\beta\)
gives \(\beta=1/35\). It follows that
\[
 \int (x^\mathsf T Bx)^2\,d\mu
 =\frac{2\|B\|_F^2+(\operatorname{tr}B)^2}{35},\qquad
 \|B\|_F^2\le 280(|m|^2+\delta/6).
\]

Take a singular value decomposition \(A=U\operatorname{diag}(s_i)V^\mathsf T\)
and let \(O=UV^\mathsf T\). This choice works even if some \(s_i\) are
zero. Since \((s_i-1)^2\le(s_i^2-1)^2\) for \(s_i\ge0\),
\(\|A-O\|_F^2\le\|B\|_F^2\). The degree-one eigenvalue and Dirichlet
orthogonality now give
\[
 \|df-d(Ox)\|_2^2=\|du\|_2^2+\tfrac45\|A-O\|_F^2
 \le 39\delta+224|m|^2=\tfrac{39}{8}e+380|m|^2.
\]

## Absorbing a change of centering measure

Let \(w\ge0\) have \(\int w\,d\mu=1\), write
\(d=\|w-1\|_2\), and set \(M=|\int x w\,d\mu|\). If
\(\int fw\,d\mu=0\), then
\[
 |m|\le M+d\|f-Ox\|_2,
 \qquad
 \|f-Ox\|_2^2\le |m|^2+\tfrac14\|df-d(Ox)\|_2^2
                 \le 96|m|^2+\tfrac{39}{32}e.
\]
The first bound follows by adding and subtracting \(Ox\) inside
\(m=-\int f(w-1)\,d\mu\). The second is the round Poincaré inequality.
If \(d^2\le1/384\), combining them yields
\[
 |m|^2\le4M^2+\tfrac{39}{8}d^2 e,
 \qquad
 \|df-d(Ox)\|_2^2\le 10e+1520 M^2.
\]
Here \(w\) changes only the centering. The derivative estimate still uses
the unit round metric and its probability measure.

## Spectrum used in the proof

For a homogeneous harmonic polynomial \(P\) of degree \(k\) in five real
variables, write \(P(rx)=r^kY(x)\). The Euclidean Laplacian in polar
coordinates is \(\partial_r^2+4r^{-1}\partial_r+r^{-2}\Delta_{S^4}\),
with \(\Delta_{S^4}=\operatorname{div}\nabla\). Hence
\(-\Delta_{S^4}Y=k(k+3)Y\). To see completeness, on real polynomials
homogeneous of degree \(k\) use the inner product with orthogonal monomials
and \(\|x^\alpha\|^2=\alpha!\). Multiplication by \(|x|^2\) from degree
\(k-2\) is adjoint to the Euclidean Laplacian from degree \(k\). Thus each
homogeneous polynomial splits into a harmonic polynomial plus \(|x|^2\)
times one of degree \(k-2\). Iterating and restricting to the unit sphere
shows that the harmonic restrictions span all polynomial restrictions.
These restrictions are dense by the Stone–Weierstrass theorem. Integration
by parts makes distinct eigenvalues orthogonal, and Parseval applied to a
smooth component and its Laplacian gives the corresponding Dirichlet
energy identity. Degrees 0, 1 and 2 give eigenvalues 0, 4 and 10,
respectively. The spectrum here is derived directly, with no imported
spherical stability or spectral theorem beyond these general tools.
