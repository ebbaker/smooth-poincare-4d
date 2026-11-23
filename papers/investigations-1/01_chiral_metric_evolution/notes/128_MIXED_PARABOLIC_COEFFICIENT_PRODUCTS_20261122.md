# SP4-CME-E128 — Mixed parabolic coefficient products

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E119 and E63 and
previously audited E57 in E61. I did not author E53 or E57.
The five frozen input hashes matched. The analytic test and third
jet extraction below do not use E125. No primary source was
newly inspected. [Request][req] · [B66][b66] · [Return][ret].

## Mixed estimate on the fixed torus

Work first on the E53 unit torus with a fixed finite-dimensional
fiber. Put \(s=1/2\), \(\lambda_j=2^j\), and use the E53 blocks
\(\Delta_j\), \(j\ge0\). Set \(q_k=\Delta_k q\) and
\[
 Q_k(t)=\|q_k(t)\|_{L^8},\quad
 M_k=\sup_{0<t\le T}Q_k(t),\quad I_k=\int_0^T Q_k(t)\,dt .
\]
Then \(M(q)=\sum_k\lambda_k^s M_k\) and
\(H(q)=\sum_k\lambda_k^{s+2}I_k\).
The source norm is
\(\|f\|_F=\sum_\ell\lambda_\ell^s\int_0^T\|\Delta_\ell f\|_8\,dt\).
In this section derivatives are ordinary coordinate derivatives.
The coefficient contractions are fixed multilinear operations
on finite-dimensional tensors.

Suppose \(A\) has the stated bounds through order three and
write \(B,C\) collectively as \(b\), with the stated bounds
through order two. Dyadic Bernstein, using the enlarged
block kernels from E53 and their \(L^1\) bound, gives
\(\|\partial^d q_k\|_8\le C_d\lambda_k^d Q_k\),
including the low block. For \(j\ge1\), high coefficient blocks
obey
\[
 \begin{aligned}
 \|\Delta_j A(t)\|_\infty
   &\le C\epsilon\min(1,\lambda_j^{-3}t^{-3/2}),\\
 \|\Delta_j b(t)\|_\infty
   &\le C\epsilon\min(t^{-1/2},\lambda_j^{-2}t^{-3/2}).
 \end{aligned}                                                     \tag{1}
\]
For the derivative gains in (1), write the annular symbol
as \(\varphi(\xi)=\sum_i m_i(\xi)(2\pi i\xi_i)^m\) for
\(m=3\) or \(2\), using
\[
 m_i(\xi)=\frac{\varphi(\xi)\overline{(2\pi i\xi_i)^m}}
                          {\sum_l|(2\pi i\xi_l)^m|^2}
\]
on the annulus and zero near the origin. These are smooth
compactly supported symbols. Their rescaled periodic kernels
have uniformly bounded \(L^1\) norm, so one gains
\(\lambda_j^{-m}\) from \(m\) derivatives of the coefficient.
The low block satisfies the nonderivative bounds in (1).

Split the high-frequency time integrals at
\(t_j=\lambda_j^{-2}\), using intervals truncated at \(T\).
For \(A\), the integral before \(t_j\) is at most
\(C\epsilon t_j\) and the remaining integral is at most
\(C\epsilon\lambda_j^{-3}t_j^{-1/2}\).
For \(b\) they are at most \(C\epsilon t_j^{1/2}\) and
\(C\epsilon\lambda_j^{-2}t_j^{-1/2}\).
The low-block integrals use \(T\le1\) and
\(\int_0^T t^{-1/2}\,dt=2\sqrt T\).
Thus uniformly for all \(j\ge0\),
\[
  \|\Delta_j A\|_{L^1_t L^\infty}\le C\epsilon\lambda_j^{-2},
  \qquad
  \|\Delta_j b\|_{L^1_t L^\infty}\le C\epsilon\lambda_j^{-1}.
 \tag{2}
\]
Partial sums up to any low cutoff telescope to a single
rescaled low-pass symbol. Their \(L^\infty\) operator norms
are uniformly bounded by E53, so the accumulated low
coefficients obey \(C\epsilon\) for \(A\) and
\(C\epsilon t^{-1/2}\) for \(b\). No bound on a sum of
individual low block suprema is needed.
[E53, kernels and Bernstein][e53].

The following test works for \(A\partial^d q\) with
\(0\le d\le2\) and \(b\partial^d q\) with \(0\le d\le1\).
Take a fixed frequency gap \(L\ge4\). When one input index
is at least \(L\) above the other, the frequencies of their
product lie in an annulus comparable to the higher frequency.
This follows by subtracting the smaller support radius from
the larger annulus's inner radius. When the indices differ
by less than \(L\), the product may reach down to frequency
zero. Its output index is at most the larger input index
plus a fixed constant. These support statements include the
E53 low block. The output projectors are uniformly bounded
on \(L^8\).

**Low coefficient and high defect.** Sum the low coefficient
blocks first, with index at most \(k-L\). The possible output
weights sum to at most \(C\lambda_k^s\).
For \(A\) the contribution is
\(C\epsilon\lambda_k^{s+d}I_k\le
 C\epsilon\lambda_k^{s+2}I_k\).
For \(b\) the time integral at block \(k\) obeys
\[
 \lambda_k^d\int_0^T t^{-1/2}Q_k(t)\,dt
   \le 2\lambda_k^{d-1}M_k+\lambda_k^{d+1}I_k
   \le C(M_k+\lambda_k^2 I_k).
 \tag{3}
\]
Indeed, integrate \(t^{-1/2}\) up to
\(\min(T,\lambda_k^{-2})\) against \(M_k\), and above
\(\lambda_k^{-2}\) use \(t^{-1/2}\le\lambda_k\).
This covers \(k=0\) since \(T\le1\) and
\(\lambda_0=1\). Multiplying by the output weight and summing
gives \(C\epsilon E(q)\) for these terms.

**High coefficient and low defect.** For \(j\ge k+L\)
the output weights sum to \(C\lambda_j^s\). Use (2) and
the time supremum of the defect block. With
\(m=2\) for \(A\) or \(m=1\) for \(b\), summing high
coefficient indices gives
\[
 C\epsilon\sum_k \lambda_k^s M_k\,\lambda_k^{d-m}
                   \sum_{j\ge k+L} 2^{-(m-s)(j-k)} .
 \tag{4}
\]
Here \(m-s=3/2\) or \(1/2\), both positive, and
\(d\le m\). Hence (4) is at most \(C\epsilon M(q)\).
In particular this includes low defect index zero.

**Comparable inputs.** For \(|j-k|<L\) one must sum low
as well as high outputs. Since \(s>0\), their weights
sum to \(C\lambda_k^s\) even when the product has a constant
mode. There are at most \(2L-1\) coefficient indices for
each \(k\). For \(A\) use
\(\|\Delta_j A(t)\|_\infty\le C\epsilon\), giving
\(C\epsilon\lambda_k^{s+d}I_k\) per pair.
For \(b\), use \(\|\Delta_j b(t)\|_\infty\le
C\epsilon t^{-1/2}\) and the exact time split (3), giving
\(C\epsilon\lambda_k^s(M_k+\lambda_k^2 I_k)\).
All comparable terms are therefore controlled, with no
assumption that their outputs stay annular.

For smooth fields the Fourier decomposition is exact at
positive times. One can first truncate spatially and pass to
the limit in \(F\) by the displayed summable quantities.
The low-coefficient sums are kept as single low-pass terms.
The three cases give
\[
       \|A\partial^d q\|_F\le C\epsilon E(q)\quad(d\le2),
       \qquad
       \|b\partial^d q\|_F\le C\epsilon E(q)\quad(d\le1).           \tag{5}
\]
The argument uses no coefficient equation.

## Compact localization and completed spaces

Keep the fixed atlas and nested cutoffs \(\eta_a,\rho_a\)
of E57. In each chart let \(q^{(a)}\) be the coordinates of
\(\rho_a q\), extended by zero. Then the output partition
piece \(\eta_a(AD^2q+BDq+Cq)\) is a sum of products of
coordinate derivatives of \(q^{(a)}\) with localized coefficient
arrays. Indeed \(\rho_a=1\) near \(\operatorname{supp}\eta_a\),
so these derivatives equal the original ones there. In the
fixed frame \(Dq=\partial q+\gamma q\) and
\(D^2q=\partial^2q+L_1(x)\partial q+L_0(x)q\).
The latter includes the reference base connection on the
first derivative's covector slot. Thus terms with \(A\)
have orders \(0,1,2\), and terms with \(B\) have orders
\(0,1\). All are in the ranges of (5). Localizing and
multiplying coefficients by fixed smooth frame or connection
matrices preserves the derivative estimates with a fixed
constant, since ordinary coordinate derivatives are linear
combinations of the reference covariant derivatives through
that order and \(t\le1\). The coefficient extensions are
smoothly zero outside the chart because of \(\eta_a\).

To bound \(E(q^{(a)})\), reconstruct
\(q=\sum_b\eta_b q\) using the E57 inner cutoffs and pass
each piece to the \(a\)-chart. Every such overlap map is a
fixed cutoff and frame multiplier times composition with a
fixed coordinate transition. Its \(L^8\) and \(W^{4,8}\)
bounds follow from change of variables and the chain rule
on the compact overlap supports. On an input block \(j\),
Bernstein bounds its \(W^{4,8}\) cost by \(C\lambda_j^4\).
For output block \(k\ge1\) the annular kernel divided by
the fourth-order symbol bounds its size by
\(C\lambda_k^{-4}\) times this \(W^{4,8}\) cost.
Thus the block bound is
\(C\min(1,2^{4(j-k)})\), and the low output uses \(L^8\).
Summing with weight \(2^{\sigma k}\) costs \(C_\sigma 2^{\sigma j}\)
for \(0<\sigma<4\). This works after taking a time supremum
on each input block for \(\sigma=s\), and after integrating
in time for \(\sigma=s+2\). It gives
\(\sum_a E(q^{(a)})\le C E(q)\) in the fixed atlas.
Summing (5) in the output charts proves
\[
                  \|AD^2q+BDq+Cq\|_F\le C\epsilon E(q).           \tag{6}
\]
All constants are fixed and independent of \(0<T\le1\).
[E57 (2)–(3), local reconstruction][e57].

For the E57 continuously traced path class with finite \(E\),
the high tails of its localized Fourier sums tend to zero in
both components of \(E\). This follows from finite overlap of
linear projectors and the summability in the block norms.
Reconstruct from the finite Fourier sums using the same fixed
atlas operators. The remaining finite spatial mode coefficients
are continuous in time and may be approximated uniformly on
\([0,T]\) by smooth time functions, giving approximation in
\(E\) for each fixed finite sum. This proves the needed
density in that trace class. More generally spatial
truncation and reconstruction alone work in both norms
for strongly measurable paths with finite block norms,
without claiming time-smooth density for an arbitrary
discontinuous trace.

The source \(F=L^1_t\mathcal B^s\) is complete. For fixed
admissible coefficients, (6) extends by these approximations
and identifies the limit with the actual products on each
positive-time strip. Indeed \(E\)-convergence gives
\(L^1_t\mathcal B^{s+2}\) convergence, in particular
\(L^1_tL^8\) convergence of fixed derivatives through order
two. Coefficients are bounded on the strip.
The estimate is also continuous in each coefficient measured
by the weighted sup norms of its specified derivatives:
apply (6) to the coefficient difference with its own
weighted size. Thus it extends on corresponding coefficient
completions as well. No time-cutoff density in a weighted
coefficient sup norm at \(t=0\) is needed.

## Third weighted background derivative

Use E119's centered E42 solution map \(\mathsf S(u)\) and
fixed reference connection \(D\). Retain its existing
parabolic lift with \(r=\sqrt t\), \(0<t\le\mathcal T/4\)
for the fixed head time \(\mathcal T\), band parameter
\(z(\tau)=r\eta(\tau/r^2)s\), and fixed transport.
Write \(\mathscr X=X_{\mathcal T}^{\circ}\) and
\(\Psi_r(s,u)=\mathcal T_{r,s}\mathsf S(u)\), as in E119 (9).
The needed derivative \(\partial_s^\alpha D_u\Psi_r\) for
\(|\alpha|\le3\) has total order at most four. E119's
estimate (10) covers it on the same uniform parameter and
datum balls. For the order-three parameter term, the regular
source coefficients have bounded derivatives because
\(\partial_s z=r\eta I\). A typical speed coefficient is
\(r^{-1}\eta' s_i b_i(z,x)\). After up to three parameter
derivatives its amplitude is at most \(C/r\) on the same
band, because at most one derivative hits \(s_i\) and all
derivatives of \(b_i(z,x)\) bring factors \(r\eta\).
This is exactly the band estimate used for the \(Y_0,Y_1\)
completed source bounds. The datum enters the mild map
through one bounded linear Cauchy term and its subsequent
implicit derivatives. Recursion through total order four
uses only the original uniform Neumann inverse. No enlargement
of the scale-dependent spaces or change of radius with \(r\)
is needed. Since \(\Psi_r(s,0)=0\), integration on the datum
segment gives
\[
   \|\partial_s^\alpha\Psi_r(s,u)\|_{\mathscr X}
                   \le C\|u\|_\infty,\qquad |\alpha|\le3.         \tag{7}
\]
[E119 (8)–(10)][e119] · [E119/E122 assessment][a119].

For \(t=r^2\) let \(Z_0=\mathsf S(u)(t)\).
At \(s=0\) a directional parameter derivative in direction
\(a\) is the fixed covariant derivative along the spanning
combination \(V=V_a\), times \(r\). More precisely the
first three derivatives on that parameter line equal
\(r^k D_V^k Z_0\) for \(1\le k\le3\).
This follows by differentiating the evaluation along the
fixed flow of \(V\) with parallel transport back to the start.
Evaluation has norm at most one on \(\mathscr X\).
The parameter-to-position derivative at zero is \(r\) times
the spanning map \(a\mapsto V_a(x)\). At each point this map
has a right inverse uniformly bounded in the base point,
by compactness and spanning. A local inverse at each fixed
positive \(r\) also gives spatial regularity of the extracted
section where needed. The estimates use derivatives at \(s=0\),
so uniform bounds for that local inverse away from zero are
unnecessary.

Write \(W=\nabla^0_VV\) for the fixed base acceleration.
For the full ordered covariant derivatives of a section,
\[
 \begin{split}
 D_V^2Z_0&=D^2Z_0(V,V)+D_WZ_0,\\
 D_V^3Z_0&=D^3Z_0(V,V,V)+D^2Z_0(W,V)
                 +2D^2Z_0(V,W)+D_{\nabla^0_V W}Z_0 .
 \end{split}                                                       \tag{8}
\]
For the second line differentiate the Hessian term and the
linear term in the first line, retaining the slot order.
With \(V_a(x)=X\) at a fixed point, the chosen parameter
satisfies \(|a|\le C|X|\).
The fields \(W,\nabla^0_VW\) have bounds \(C|a|^2,C|a|^3\)
using the fixed spanning fields through order two. The
acceleration terms in (8) are therefore controlled by the
already established lower weighted jets after multiplication
by \(r^2,r^3\), using \(r\le1\). Polarizing the third
directional contraction gives the fully symmetric part of
\(D^3Z_0\) with the same \(r^3\) bound.

For completeness the two adjacent slots may be interchanged
with only fixed lower terms. Write \(\mathcal R_D\) for
the curvature of \(D\) on the section bundle and
\(R^0\) for the curvature of \(\nabla^0\) on the base.
For the first two slots, use the curvature commutator
on the \(E\)-valued covector \(DZ_0\), where \(E\) here
denotes the fixed section bundle:
\[
 \begin{split}
 (D^3Z_0)(X,Y,Z)-(D^3Z_0)(Y,X,Z)
  =\mathcal R_D(X,Y)(D_ZZ_0)-D_{R^0(X,Y)Z}Z_0 .
 \end{split}
\]
For the last two slots take a covariant derivative of
the antisymmetric Hessian identity. It gives
\[
 (D^3Z_0)(X,Y,Z)-(D^3Z_0)(X,Z,Y)
   =(D_X\mathcal R_D)(Y,Z) Z_0+\mathcal R_D(Y,Z)D_XZ_0 .
\]
Both identities can be evaluated using fields parallel at
the point and torsion-freeness of the reference base
connection. Here \(D_X\mathcal R_D\) differentiates all its
slots. These fixed curvature and derivative bounds show
that every permutation differs by at most
\(C(|DZ_0|+|Z_0|)\) in unit directions. The symmetric part
and these commutators recover the full ordered third derivative,
and \(r^3\) times the errors is controlled by the lower
weighted jets. Combining with (7) gives
\[
     \sup_{0<t\le\mathcal T/4}
        \sum_{k=0}^3 t^{k/2}\|D^k\mathsf S(u)(t)\|_\infty
                     \le C\|u\|_\infty .                         \tag{9}
\]
This is a linear datum bound. No higher Taylor remainder
is claimed.

## Coefficient bounds supplied by the third jet

Let \(U=\mathsf S(u)\), \(\delta=\|u\|_\infty\), in the
fixed tube of (9). For a smooth pointwise array \(A(x,U)\)
with \(A(x,0)=0\), all fixed value derivatives needed below
are bounded on this tube. Differentiating in space through
order \(m\le3\) gives products of spatial derivatives
of \(U\) of total order at most \(m\), with bounded smooth
coefficients. The term with no \(U\) derivative is
\(O(|U|)\) since its fixed horizontal derivatives vanish
at the identically zero background. For a product with
one or more \(U\) factors, (9), \(\delta\le1\) and \(t\le1\)
bound its size by \(C\delta t^{-m/2}\).
Consequently \(\|D^m A\|_\infty\le C\delta t^{-m/2}\).

For \(b(x,U,DU)=b_0(x,U)+b_1(x,U)[DU]\) with
\(b_0(x,0)=0\), this argument on \(b_0\) gives the
same bound \(C\delta t^{-m/2}\).
For the affine term Leibniz and the chain rule give
products of total derivative order at most \(m+1\),
with at least one differentiated \(U\) factor.
At \(m\le2\) the highest derivative is \(D^{m+1}U\),
which is covered by (9). Therefore
\(\|D^m b\|_\infty\le C\delta t^{-(m+1)/2}\)
through order two. This applies separately to \(B,C\)
for arbitrary specified smooth coefficient maps of this
form. Fixed changes of derivative preserve these statements
by zeroth-order connection differences and their fixed
derivatives. This identifies why the third, rather than
just the second, background jet is needed for this test.
No geometric equation or endpoint theorem is inferred.

[req]: ../research-progress/handoffs/SP4-CME-E128_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E128_RETURN_v1.md
[b66]: ../brainstorm/notes/B66_MIXED_DEFECT_PRODUCT_TEST_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[e57]: 57_COMPACT_CRITICAL_LINEAR_20261122.md
[e119]: 119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
[a119]: ../reviews/E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md
