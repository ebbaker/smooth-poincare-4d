# ZERO-E01 · Flat chiral transfer and radial calibration

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The [R1 request](../research-progress/handoffs/REQUEST_E01_E03_20261127.md)
records a `gpt-6.2-sol`/ultra dispatch. Actual model and effort were unavailable
to this helper. Inputs are the [investigation overview](../research-overview/OVERVIEW.md),
Git baseline `6a422ce`, [proposal §3.5](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md#35-two-calibrations)
(`091aa015355ef938`), and [check_06](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_06_pole_forms.py)
parts (b), (d) (`50523f0bf3006aed`). Hashes are SHA-256 prefixes of the
inspected sources.

**Evidence.** Sections 1–3 are written calculations and a working project
theorem for compact graphs. The finite integer check in §1 verifies
polynomial identities exactly. The comparisons in §4 are floating-point
observations at grid points. No external theorem about a curved transform
or a pole-space identification is used.

## 1. Closed symbol

Work in flat oriented Euclidean \(\mathbb R^4_x\) with orientation
\(dx^0\wedge dx^1\wedge dx^2\wedge dx^3\), chosen as the positive orientation
in the inverted end. If inversion was performed in positively oriented
coordinates at the pole, one can compose with an orthogonal reflection
to obtain this oriented \(x\)-chart. Let
\(E_i^\pm=(dx^0\wedge dx^i\pm dx^j\wedge dx^k)/\sqrt2\), with \((i,j,k)\)
cyclic in \((1,2,3)\). These bases are orthonormal.

For \(\xi\ne0\) write \(n=\xi/|\xi|\), with covectors and vectors identified
by the Euclidean metric. A two-form symbol \(B=B^++B^-\) is closed if and
only if \(\xi\wedge B=0\), or equivalently
\(\iota_n(*B)=0\). Thus \(\iota_n B^+=\iota_n B^-\). The map
\(\sqrt2\iota_n:\Lambda^\pm_0\to n^\perp\) is an isometry onto:
decompose each two-form into its normal and tangent parts, which have
equal length on either star eigenspace. In particular, if \(C_\pm(\xi)\)
has columns \(\sqrt2\iota_\xi E_i^\pm\), then
\[
 T(\xi)=\frac{C_+(\xi)^{\mathsf T}C_-(\xi)}{|\xi|^2},\qquad
 \widehat{B^+}=T(\xi)\widehat{B^-}.
\]
For \(\xi=(a,b,c,d)\) its numerator \(N(\xi)\) is
\[
\begin{pmatrix}
a^2+b^2-c^2-d^2 & 2(bc-ad) & 2(bd+ac)\\
2(bc+ad) & a^2-b^2+c^2-d^2 & 2(cd-ab)\\
2(bd-ac) & 2(cd+ab) & a^2-b^2-c^2+d^2
\end{pmatrix}.
\]
Consequently \(T\) is even, homogeneous of degree zero and orthogonal
away from zero. Its determinant is one since it is continuous on the
unit sphere and equals the identity at \(e_0\). If
\(R_n=I-2nn^{\mathsf T}\), then \(T(\xi)=-R_n^*|_{\Lambda^-_0}\), since
reflection reverses chirality and negates the contracted tangent one-form.

[e01_symbol_check.py](../numerics/e01_symbol_check.py) checks the contraction,
orthogonality, determinant, closed-symbol, parity and reflection identities
against the implemented numerator, clearing denominators. These are integer
polynomials of degree at most six in each variable. Vanishing on the
tensor product of seven distinct integer nodes in each variable implies
that the polynomials are identically zero, by univariate interpolation in
each variable. The executable check uses exact Python integers throughout.

The value at \(\xi=0\) has measure zero for the Euclidean \(L^2\) multiplier.
Take it to be zero in code. With the convention \(\widehat{\partial_i f}
=i\xi_i\hat f\), away from the diagonal the convolution kernel is
\(-N(\partial)(4\pi^2|x|^2)^{-1}\). The derivatives give
\(-2\pi^{-2}|x|^{-4}T(x)\) for \(x\ne0\). This decay is useful only
away from the kernel singularity.

## 2. Euclidean fixed point for compact graphs

Let \(\mu:\Lambda^+_0\to\Lambda^-_0\) be smooth and compactly supported with
\(q=\|\mu\|_{L^\infty(\mathrm{op})}<1\). Use its graph for the Riemannian
self-dual bundle and let \(\omega^0\) be a constant flat self-dual form.
Write \(\psi=\omega^-\). For a closed two-form with
\(\omega-\omega^0\in L^2\), the closed-symbol relation gives
\(\omega^+=\omega^0+T\psi\). Conversely this formula gives a
distributionally closed two-form for any \(\psi\in L^2\). The graph
equation reads
\[
 (I-\mu T)\psi=\mu\omega^0,\qquad
 \psi=\sum_{k\ge0}(\mu T)^k(\mu\omega^0),\qquad
 \omega=\omega^0+(I+T)\psi .
\]
By Plancherel, \(\|T\|=1\). The forcing is square-integrable and the sum
converges in \(L^2\) by contraction. This proves uniqueness in the stated
\(L^2\) correction class, including for three or any number of leading
columns by linearity. The solution \(\psi\) has support in \(\operatorname{supp}\mu\)
and belongs to \(L^1\). The kernel formula then gives
\(T\psi=O(|x|^{-4})\) at infinity.

For smooth \(\mu\), the solution is smooth. Applying a difference quotient
\(D_h\) in a coordinate direction gives
\((I-\mu(\cdot+h)T)D_h\psi=(D_h\mu)(\omega^0+T\psi)\), since \(T\)
commutes with translations. The right-hand side is bounded in \(L^2\)
uniformly for small \(h\), using bounded derivatives of \(\mu\) and the
uniformly compact support of \(D_h\mu\). Inverting with bound \((1-q)^{-1}\)
gives one weak derivative. Differentiating the equation weakly and
reapplying the estimate gives derivatives of each order: the commutator
terms have a derivative of \(\mu\) and an already controlled derivative of
\(T\psi\), or come from \(\mu\omega^0\). Sobolev embedding for all orders
gives smoothness. Since the class is flat near infinity, inversion yields
the normalized quartic leading pole.

## 3. The original calibration and its non-square-integrable tail

In the notation of [check_06](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_06_pole_forms.py),
put \(r=|x|\), \(t=(1+r^2)^{-1}\) and \(A=1+\varepsilon t(1-t)\). The
metric is \(dr^2+r^2(A^2\sigma_1^2+\sigma_2^2+\sigma_3^2)\), where
\(\sigma_i=r^{-2}\iota_x(\sqrt2 E_i^+)\) and
\(d\sigma_i=2\sigma_j\wedge\sigma_k\). In the oriented flat radial
coframe \((dr,r\sigma_1,r\sigma_2,r\sigma_3)\) its unit self-dual basis
is the constant \(E_i^+\). The radial anti-self-dual basis has Cartesian
minus coefficients \(T(x)^{\mathsf T}\), because its radial contractions
agree with those of \(E_i^+\). Rescaling the \(r\sigma_1\) component by
\(A\) therefore gives the graph
\[
 \mu(x)=T(x)^{\mathsf T}\operatorname{diag}(m,-m,-m),\qquad
 m=\frac{A-1}{A+1} .
\]
The comparison forms are \(d(f_i\sigma_i)/(2\sqrt2)\). This scale gives
unit leading coefficients \(E_i^+\) since \(d(r^2\sigma_i)=2\sqrt2 E_i^+\).
With \(\alpha=(A,A^{-1},A^{-1})\), \(f_i'=2\alpha_i f_i/r\), and
\(g_i=f_i/r^2\), the solutions with \(g_i(\infty)=1\) satisfy
\[
 g_1=e^{-\varepsilon t},\qquad
 g_2=g_3=\exp\!\left(\varepsilon\int_0^t
             \frac{du}{1+\varepsilon u(1-u)}\right).
\]
The code evaluates that integral using its elementary arctangent or
hyperbolic arctangent antiderivative. The normalized Cartesian plus and
minus matrices are respectively \(\operatorname{diag}(g_i(1+\alpha_i)/2)\)
and \(T(x)^{\mathsf T}\operatorname{diag}(g_i(\alpha_i-1)/2)\).
At the origin the latter matrix and the graph extend by zero.

For \(\varepsilon\ne0\), \(m=\varepsilon/(2r^2)+O(r^{-4})\). For each
nonzero fixed leading column \(u\), both \(|\mu\omega^0_u|\) and \(|\psi_u|\)
are \(|\varepsilon||u|/(2r^2)+O(r^{-4})\). The squared radial integral has a
logarithmic divergence in dimension four. The Euclidean fixed point of
§2 cannot be applied to the unmodified forcing directly. The actual
solution can be put in its \(L^2\) setting after an explicit subtraction.
Write \(f_i=r^2+c_i+O(r^{-2})\), with
\(c=(-\varepsilon,\varepsilon,\varepsilon)\). For a smooth radial cutoff
\(\chi\) equal to zero near the origin and one off a ball, define
\(\beta_i=d(\chi c_i\sigma_i)/(2\sqrt2)\). The exact remainder
\(\omega_i-E_i^+-\beta_i\) is closed and \(O(r^{-4})\). Its minus part
\(\zeta_i\) solves
\[
 (I-\mu T)\zeta_i=\mu(E_i^++\beta_i^+)-\beta_i^- \in L^2 .
\]
The displayed forcing is smooth and \(O(r^{-4})\) by cancellation of the
\(r^{-2}\) terms. For every fixed \(\varepsilon>-4\) one still has
\(\|\mu\|_{L^\infty(\mathrm{op})}<1\), so this is an exact continuum
contraction for the remainder. It is separate from the numerical
periodization of the original graph below.

## 4. Periodic implementation and observations

[e01_fourier.py](../numerics/e01_fourier.py) solves the grid equation for
general real matrix-valued graph samples, with minus rows and plus columns.
It returns both blocks at every point. The reported residual is the
discrete \(L^2\) norm of the graph defect divided by the discrete \(L^2\)
norm of the forcing. The default tolerance is \(10^{-11}\). The periodic
constant mode is unrestricted by closedness. By default \(T(0)=0\)
prescribes the exact mean of the plus field. A user-supplied contraction
\(Z\) instead gives \(\overline{\omega^+}=\omega^0+Z\overline{\psi}\). The
constant-graph smoke check gives plus mean \(I\) for \(Z=0\) and \(4I/3\)
for \(Z=I\) with \(\mu=I/4\). This policy concerns the periodic problem.
For even grids, each Nyquist coordinate of the effective real spectral
derivative is set to zero, and the resulting symbol is evaluated at that
effective wavevector. All-zero effective wavevectors use zero except for
the true constant mode, where \(Z\) applies. All comparisons below use odd
grids and avoid this ambiguity.

The test period is \(2L\) in each coordinate, with spacing \(h=2L/n\).
[e01_calibration.py](../numerics/e01_calibration.py) compares all three
unit-leading forms at all grid points in the fixed ball \(|x|\le2\).
Error is the maximum absolute component error over the three columns,
both Cartesian chiral bases and those points. The two main sweeps sample
the original \(r^{-2}\)-tailed graph directly on the periodic cube. The
taper diagnostic multiplies that graph by a radial \(C^2\) cutoff equal to
one for \(r\le0.70L\) and zero for \(r\ge0.95L\). It still compares to the
original exact forms, so the error includes the change of graph.

| Sweep | \(n\) | \(L\) | \(h\) | Error \(\varepsilon=0\) | Error \(\varepsilon=-0.5\) | Error \(\varepsilon=0.5\) |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Resolution | 17 | 5 | 0.58824 | 0 | 0.066326 | 0.068490 |
| Resolution | 25 | 5 | 0.40000 | 0 | 0.027632 | 0.029255 |
| Resolution | 33 | 5 | 0.30303 | 0 | 0.022394 | 0.022165 |
| Box | 13 | 3.25 | 0.50000 | 0 | 0.070930 | 0.072179 |
| Box | 21 | 5.25 | 0.50000 | 0 | 0.041133 | 0.044182 |
| Box | 33 | 8.25 | 0.50000 | 0 | 0.029617 | 0.033224 |
| Taper | 25 | 5 | 0.40000 | 0 | 0.051256 | 0.051530 |
| Taper | 33 | 5 | 0.30303 | 0 | 0.046161 | 0.044607 |

The [execution record](../numerics/e01_results.txt) gives all three
column errors, residuals, numbers of points and observed orders. The largest
error in the table was \(0.07218\), below the requested \(0.08\). An
exploratory underresolved \(n=9,L=5\) run gave errors \(0.27161\) and
\(0.24635\) at \(\varepsilon=-0.5,0.5\). The table uses finer spacings.

For fixed \(L\), the two observed log-ratio orders with respect to \(h\)
are \(2.27,0.76\) for \(-0.5\) and \(2.21,1.00\) for \(0.5\). At fixed
\(h\), using \(1/L\) for the log-ratio orders gives \(1.14,0.73\) and
\(1.02,0.63\). This box sweep compares the same 1281 physical points
on every grid. The declining resolution orders at fixed \(L\) and the
improvements from growing \(L\) at fixed \(h\) show that the available
errors depend on both choices. The taper increased the error versus the
original solution at the same \(n,L\), consistent with discarding part of
its physical tail. These orders describe the measured range and do not
give asymptotic rates. The graph residual was below \(10^{-11}\) in each
case and controls the periodic iteration alone.

With \(n=17,L=5\) and the original radial graph, switching from \(Z=0\) to
\(Z=I\) changed the sampled interior values by at most \(2.23\,10^{-16}\).
The mean of the periodic minus field was at roundoff. Quaternion-unit
rotations preserving the cube and all three plus basis elements act by
sign flips on the minus basis with no common fixed vector. The raw radial
graph is equivariant under those rotations, so the default iteration
preserves vanishing mean in exact arithmetic on these odd grids. The
constant-graph check shows that a nonzero mean can respond to \(Z\).

The periodic and Euclidean computations have distinct error sources. At a
fixed interior point the direct far-tail convolution of an \(O(r^{-2})\)
field against the Euclidean \(O(r^{-4})\) kernel is \(O(R^{-2})\) beyond
radius \(R\), since the radial integral there is bounded by a constant
times \(\int_R^\infty s^{-3}\,ds\). This single convolution estimate does
not control the full difference of the two fixed points. The comparisons
give sampled calibration errors and supply no uniform continuum error
bound or certification for a general graph.

Run from the repository root with Python 3 and NumPy. The saved output
used Python 3.10.0 and NumPy 1.25.1 on arm64.

```sh
PYTHONDONTWRITEBYTECODE=1 python3 papers/investigations-2/02_zero_circles/numerics/e01_symbol_check.py
PYTHONDONTWRITEBYTECODE=1 python3 papers/investigations-2/02_zero_circles/numerics/e01_calibration.py
```
