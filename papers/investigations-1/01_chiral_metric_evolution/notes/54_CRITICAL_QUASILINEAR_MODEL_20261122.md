# E54 — A small-data critical quasilinear model on the flat four-torus

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and actual lead settings are unavailable.
The [request][req] freezes the [E53][e53] input. [B37][b37] and
the [E53 assessment][lead] specify the flat model and its linear bound.

## Mild theorem

Use the exact volume-one \(\mathbb T^4=(\mathbb R/\mathbb Z)^4\)
and smooth inhomogeneous Fourier blocks \(\Delta_j\) of E53,
with real \(\mathbb R^N\) values and the Euclidean and induced
tensor norms. Put \(s=1/2\) and \(B=B^s_{8,1}\).
Let \(X\) be the complete space of strong \(B\)-continuous
paths with finite norm \(E_\infty\) from E53 (6).
For smooth coefficient maps \(A^{ij}(z)\) and \(Q^{ij}(z)\)
on a neighborhood of zero, \(A^{ij}(0)=0\), consider
\[
 U_t=(\Delta-1)U+\mathcal N(U),\qquad
 \mathcal N(U)=\sum_{i,j=1}^4
     \left(A^{ij}(U)\partial_{ij}U
         +Q^{ij}(U)[\partial_iU,\partial_jU]\right).              \tag{1}
\]
The \(A^{ij}\) act linearly on \(\mathbb R^N\) and the
\(Q^{ij}(z)\) are bilinear maps.

There are \(R,\epsilon,C>0\) depending on the fixed partition,
value dimension, and a fixed coefficient tube and its smooth
bounds. Every real \(U_0\) with \(\|U_0\|_B\leq\epsilon\)
has a global mild solution in the radius-\(R\) ball of \(X\),
unique in that ball, with strong \(B\) and spatial uniform
initial traces. The solution map is Lipschitz there in \(X\).
Its values stay in a fixed small tube where the principal
array is uniformly strongly parabolic. Moreover
\[
 \|U\|_X+\int_0^\infty\|D^2U(t)\|_\infty\,dt\leq C\|U_0\|_B .     \tag{2}
\]
The same conclusion holds under sufficiently small
\(\|U_0\|_8+\|dU_0\|_{4,1}\) in the full weak-derivative graph
of E53. This theorem makes no smoothness assertion.

## Translation difference norm for the fixed blocks

Write \(\mathcal F=[-1/2,1/2)^4\) for the centered fundamental
cube and \(\delta_h u(x)=u(x+h)-u(x)\) with periodic translation.
For \(0<s<1\) define
\[
 \mathfrak d_s(u)=
        \int_{\mathcal F}\frac{\|\delta_h u\|_8}{|h|^{4+s}}\,dh .
\]
For the E53 partition, \(B^s_{8,1}\) is equivalent to
\(\|u\|_8+\mathfrak d_s(u)\). Here are both directions,
including the low block.

The derivative multiplier on each already localized block
uses the E53 auxiliary cutoff equal to one on the block
support. Its kernel has \(L^1\) norm bounded by \(C2^j\),
including the corresponding fixed estimate for \(j=0\).
The mean-value bound and translation isometry give
\[
 \|\delta_h\Delta_j u\|_8
         \leq C\min\{1,2^j|h|\}\,\|\Delta_j u\|_8 .
\]
The radial majorant over \(|h|\leq1\), split at \(2^{-j}\),
has integral at most \(C_s2^{sj}\) against \(|h|^{-4-s}dh\).
Combine this with the absolutely \(L^8\)-convergent block
series and the \(L^8\) bound from E53.

Conversely, for \(j\geq1\) the high-block kernel \(K_j\)
has zero mean. From E53's periodization of the scaled
inverse transform of the fixed annular multiplier,
for any \(m>4+s\) one has
\[
 |K_j(h)|\leq C_m2^{4j}
     \sum_{\ell\in\mathbb Z^4}(1+2^j|h+\ell|)^{-m}.
\]
For the contribution \(\ell=0\), split the \(j\) sum at
\(2^j|h|=1\); the two geometric sums give
\[
 \sum_{j\geq1}2^{(4+s)j}(1+2^j|h|)^{-m}
                 \leq C_s |h|^{-4-s}\qquad(0<|h|\leq1).
\]
This bound also holds if the first part of the sum is empty.
For every \(\ell\ne0\) and \(h\in\mathcal F\),
\(|h+\ell|\geq|\ell|/2\). Summing the absolute bound for
these terms first in \(\ell\) and then in \(j\) is finite,
since \(m>4+s\); it is dominated by another constant
times \(|h|^{-4-s}\) on this cube. Hence
\[
 \sum_{j\geq1}2^{sj}|K_j(h)|\leq C_s |h|^{-4-s}.
\]
Zero mean gives
\(\Delta_j u(x)=\int_{\mathcal F}K_j(h)(u(x-h)-u(x))\,dh\).
Minkowski and Tonelli bound the high-block sum by
\(C_s\mathfrak d_s(u)\); the low block has bound \(C\|u\|_8\).
This proves the reverse estimate for \(L^8\) data with
finite difference norm. The forward estimate and E53 give
the equivalence for the whole \(B^s_{8,1}\) space. At
\(s=1/2\) retain E53's fixed embedding constant \(C_{\rm emb}\)
in \(\|u\|_\infty\leq C_{\rm emb}\|u\|_B\).
[E53, fixed multipliers and Bernstein][e53].

## Spatial products and composition

For a fixed continuous bilinear map \(P\) acting between
the finite-dimensional array spaces, the difference identity is
\[
 \delta_h P(u,v)=P(\delta_h u,\tau_h v)+P(u,\delta_h v),
 \qquad \tau_h v(x)=v(x+h).
\]
The \(L^8\) and difference bounds and the equivalence just
proved yield
\[
 \|P(u,v)\|_B
 \leq C\|P\|_{\rm op}
       \bigl(\|u\|_\infty\|v\|_B+\|u\|_B\|v\|_\infty\bigr).
                                                                    \tag{3}
\]
Thus \(B\) controls all these products by the product of the
two \(B\) norms. Evaluation of a matrix on a vector or a
bilinear map on two vectors uses (3) once or twice.
No higher norm of an undifferentiated coefficient is needed.

Fix a closed convex ball \(|z|\leq\rho\) in the common
smooth coefficient domain. For a smooth map \(F\) on this ball
put \(c_1=\sup\|DF\|\), \(c_2=\sup\|D^2F\|\).
When \(u,v\) take values there, the mean value formula on
segments gives
\[
 \|F(u)-F(0)\|_B\leq C c_1\|u\|_B .
\]
The constant \(F(0)\) belongs to the low block alone and
has \(B\) norm \(|F(0)|\). To see the difference estimate,
let \(w=u-v\), \(z_\theta=v+\theta w\). Write
\(F(u)-F(v)=\int_0^1 DF(z_\theta)w\,d\theta\) pointwise.
Taking its spatial increment, the two terms are a factor
\(DF(\tau_h z_\theta)\) times \(\delta_h w\), and
\(\delta_h DF(z_\theta)\) times \(w\). Therefore
\[
 \begin{aligned}
 \|\delta_h(F(u)-F(v))\|_8
 &\leq c_1\|\delta_h w\|_8
       +c_2\|w\|_\infty(\|\delta_h u\|_8+\|\delta_h v\|_8),\\
 \|F(u)-F(v)\|_B
 &\leq C\left(c_1\|w\|_B+
         c_2(\|u\|_B+\|v\|_B)\|w\|_\infty\right).                 \tag{4}
 \end{aligned}
\]
The \(L^8\) part uses \(|F(u)-F(v)|\leq c_1|w|\).
These estimates use actual pointwise representatives and
integrate the increments of the mean value formula, so no
coefficient extension past the tube is needed.

## Time norms and nonlinear forcing

On the half-line write
\[
 M(U)=\sum_{j\geq0}2^{sj}\|\Delta_j U\|_{L^\infty_tL^8},\qquad
 H(U)=\sum_{j\geq0}2^{(s+2)j}\|\Delta_j U\|_{L^1_tL^8},\qquad
 J(U)=\sum_{j\geq0}2^{(s+1)j}\|\Delta_j U\|_{L^2_tL^8}.
\]
Thus \(\|U\|_X=M(U)+H(U)\) and by Tonelli
\(H(U)=\|U\|_{L^1_t B^{s+2}_{8,1}}\).
For each block its \(L^2_t\) norm is at most the
geometric mean of its \(L^\infty_t\) and \(L^1_t\) norms.
With the indicated weights, Cauchy–Schwarz in \(j\) gives
\[
 J(U)\leq M(U)^{1/2}H(U)^{1/2},\qquad
 \|U\|_{L^2_tB^{s+1}_{8,1}}\leq J(U).                             \tag{5}
\]
The latter uses Minkowski to put the block sum outside the
\(L^2_t\) norm. Also \(\sup_t\|U(t)\|_B\leq M(U)\).
For one or two derivatives, the auxiliary-cutoff kernel
on each block has \(L^1\) bound \(C2^{kj}\) for order \(k\),
by E53 (1) applied to the derivative symbol, with the fixed
low analogue. Summation after commuting the derivatives
with the blocks gives
\(\|D^k U\|_{B}\leq C\|U\|_{B^{s+k}_{8,1}}\).
In particular
\[
 \|DU\|_{L^2_tB}\leq C J(U),\qquad
 \|D^2U\|_{L^1_tB}\leq C H(U).                                   \tag{6}
\]
The time-Besov spaces here have strongly measurable
representatives. The partial block sums are continuous in
each spatial norm, and at almost every time they converge
in the required higher Besov norm by the finite sums
in (5) and the density argument of E53. This agrees with
their distributional derivatives.

Choose \(\rho\) sufficiently small that
\(\sum_{i,j}\sup_{|z|\leq\rho}\|A^{ij}(z)\|_{\rm op}\leq1/2\),
which is possible since every \(A^{ij}(0)=0\).
In particular, on the tube the diffusion principal array
satisfies
\[
 \operatorname{Re}\left\langle
  \left(|\xi|^2 I+\sum_{i,j}\xi_i\xi_j A^{ij}(z)\right)v,v
                  \right\rangle
        \geq \tfrac12|\xi|^2|v|^2 .
\]
Here \(\xi\) is a real covector and \(v\) may be complexified.
No symmetry of the \(A^{ij}\) is required.

Use paths \(U,V\) in an \(X\) ball of radius
\(R\leq\min\{1,\rho/(2C_{\rm emb})\}\). Then their values
and all segments lie in \(|z|\leq\rho\). By (4),
\(\|A^{ij}(U(t))\|_B\leq C\|U(t)\|_B\),
\(\|Q^{ij}(U(t))\|_B\leq C(1+\|U(t)\|_B)\), and for
either coefficient map its difference at \(U,V\) is
bounded in \(B\) by
\(C(1+M(U)+M(V))\|U(t)-V(t)\|_B\).
The constants use the derivatives on this one tube.
The composed coefficients are continuous in time in \(B\)
by (4), so the following products are strongly measurable.

Denote the principal and gradient contributions of (1)
by \(\mathcal P\) and \(\mathcal Q\), respectively, and
put \(w=U-V\). Suppress the finite index sums in the estimates.
In \(Y=L^1(0,\infty;B)\), product (3), composition (4),
and (6) give
\[
 \begin{aligned}
 \|\mathcal P(U)\|_Y&\leq C M(U)H(U),\\
 \|\mathcal P(U)-\mathcal P(V)\|_Y
   &\leq C\bigl(M(U)H(w)
                +(1+M(U)+M(V))M(w)H(V)\bigr).                    \tag{7}
 \end{aligned}
\]
Indeed the two difference terms are \(A(U)D^2w\) and
\((A(U)-A(V))D^2V\). Equation (7) places the second derivative
factor in \(L^1_tB\) and the coefficient factor in
\(L^\infty_tB\), using the summed block suprema for the latter.
For the gradients the two derivative factors use \(L^2_tB\),
giving
\[
 \begin{aligned}
 \|\mathcal Q(U)\|_Y&\leq C(1+M(U))J(U)^2,\\
 \|\mathcal Q(U)-\mathcal Q(V)\|_Y
    &\leq C\bigl((1+M(U))(J(U)+J(V))J(w)\\
    &\hspace{47pt}
           +(1+M(U)+M(V))M(w)J(V)^2\bigr).                        \tag{8}
 \end{aligned}
\]
To derive the two groups in (8), subtract the two derivative
slots at \(Q(U)\), then subtract the coefficient acting on
the two \(DV\) slots. This accounts for arbitrary bilinear
\(Q^{ij}\) and for its possibly nonzero value at zero.
On the stated ball \(M,H,J\) are bounded by \(\|\cdot\|_X\)
and \(R\leq1\). From (7)–(8), for a fixed \(C_N\geq1\),
\[
 \|\mathcal N(U)\|_Y\leq C_N\|U\|_X^2,\qquad
 \|\mathcal N(U)-\mathcal N(V)\|_Y
          \leq C_N(\|U\|_X+\|V\|_X)\|U-V\|_X .                  \tag{9}
\]
The positive-order \(B\) product and the damped low-block
control in \(H\) are used on the entire half-line.

## Contraction, trace and conclusion

Let \(\mathcal S(U_0,f)\) be the heat Duhamel operator of E53,
with \(\|\mathcal S(U_0,f)\|_X\leq
K(\|U_0\|_B+\|f\|_Y)\), \(K\geq1\). Choose
\[
 R=\min\{1,\rho/(2C_{\rm emb}),(8KC_N)^{-1}\},
 \qquad \epsilon=R/(4K).
\]
For \(\|U_0\|_B\leq\epsilon\), the map
\(U\mapsto\mathcal S(U_0,\mathcal N(U))\) sends the closed
radius-\(R\) ball into the radius-\(3R/8\) ball, since
\(K\epsilon+KC_NR^2\leq R/4+R/8\). Its Lipschitz constant
is at most \(2KC_NR\leq1/4\) by (9).
E53 supplies completeness and the strong trace for this map.
The fixed point has \(U(0)=U_0\) strongly in \(B\) and
uniformly in space. It is real because the iterates preserve
real data and forcing. The distributional equation follows
from the E53 Duhamel result with source \(\mathcal N(U)\in Y\).
Any distributional path in the same ball with the specified
trace is the Duhamel solution for its own source by the
E53 linear uniqueness, so contraction also identifies it.

For two initial data in this range the solutions obey
\[
 \|U-V\|_X\leq \tfrac43 K\|U_0-V_0\|_B.
\]
At the fixed point the quadratic bound gives
\(\|U\|_X\leq K\|U_0\|_B+KC_NR\|U\|_X\),
hence \(\|U\|_X\leq \tfrac87K\|U_0\|_B\).
All time-slices have \(\|U(t)\|_\infty\leq\rho/2\).
The Hessian estimate (7) of E53 applies to this path
and gives the integral in (2). Finally, if \(C_{\rm grad}\)
is the fixed E53 embedding constant, the sufficient graph
condition is
\(\|U_0\|_8+\|dU_0\|_{4,1}\leq\epsilon/C_{\rm grad}\).
The Lorentz convention and completion are those of E53.
All estimates here concern the flat model and its full
gradient input. The argument establishes the stated mild
solution class and ball uniqueness.

[req]: ../research-progress/handoffs/SP4-CME-E54_REQUEST_v1.md
[b37]: ../brainstorm/notes/B37_FINITE_P_CRITICAL_CONTROL_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[lead]: ../reviews/E53_CRITICAL_HEAT_ASSESSMENT_20261122.md
