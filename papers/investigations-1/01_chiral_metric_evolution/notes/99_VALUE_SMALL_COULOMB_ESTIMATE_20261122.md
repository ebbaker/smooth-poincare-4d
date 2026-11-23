# E99 — Static regularity from a supplied Coulomb representative

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
This is the static estimate selected by B57. E88/E89 and E66 supply
methodological precedents for the fixed multiplier computation.
[Frozen request][req] · [B57][b57].

## Result and fixed setting

On the compact closed oriented standard round Riemannian \(S^4\), fix
the positive perfect chiral connection \(A_0\) on its \(\mathrm{SO}(3)\)
bundle, the native reference metric \(g_0\), and the positive internal
pairing from the negative Killing form. Let \(E\) be the adjoint
bundle. Write \(d_0=d_{A_0}\), \(d_0^*\) for its fixed-metric adjoint,
and \(D_0\) for the reference covariant derivative on all slots.
All norms are fixed-reference norms, with ordinary differential-form
norms counting each increasing multi-index once. Let
\[
 d_0^*b=0,\qquad \beta=F_{A_0+b}-F_0,\qquad
 \eta=\|b\|_{L^4}+\|\beta\|_{C^0},\qquad F_0=F_{A_0},
\]
for a supplied smooth \(E\)-valued one-form \(b\).
There are positive reference constants \(\eta_*,C\) such that
\[
 \eta\le\eta_*\quad\Longrightarrow\quad
    \|b\|_{W^{1,8}}+\|b\|_{C^{0,1/2}}\le C\eta .              \tag{1}
\]
The constants use neither higher derivatives of \(b,\beta\) nor a
finite gauge construction. The \(C^{0,1/2}\) norm uses fixed smooth
frames in a finite atlas, including the uniform norm.

## Fixed elliptic estimate with the lower norm retained

Let \(\mathcal D=d_0\oplus d_0^*\) on \(E\)-valued one-forms.
For \(p\in\{3,6,8\}\), the needed estimate is
\[
  \|v\|_{W^{1,p}}\le C_p\bigl(\|\mathcal Dv\|_p+\|v\|_2\bigr)
                    \qquad (v\text{ smooth}).                \tag{2}
\]
We prove it for the actual fixed curved operator. With the convention
\(\partial_i\mapsto i\xi_i\), the symbol of \(\mathcal D\) has
entries \(i\xi\wedge v\), \(-i\iota_{\xi^\sharp}v\).
Choosing a basis aligned with the nonzero \(\xi\) shows
\[
 \|\xi\wedge v\|^2+\|\iota_{\xi^\sharp}v\|^2
                  =|\xi|_{g_0}^2\|v\|^2 .
\]
Thus \(\mathcal P=I+\mathcal D^*\mathcal D\) has scalar positive
principal symbol \(|\xi|_{g_0}^2I\). Its difference from \(I+D_0^*D_0\)
is a fixed operator of order at most one. Integrating and using
Young's inequality gives
\(\|D_0v\|_2^2\le 2\|\mathcal Dv\|_2^2+C\|v\|_2^2\).
In particular the \(\mathcal P\) form
\(\|v\|_2^2+\|\mathcal Dv\|_2^2\) is equivalent to the \(H^1\)
norm squared. Its weak realization has a coercive inverse by the
Hilbert space representation theorem, with no kernel. We use only
the identity
\[
                 \mathcal P v=\mathcal D^*q+f,\qquad
                         q=\mathcal Dv,\quad f=v              \tag{3}
\]
on smooth forms. The \(I\) term acts as identity on the kernel of
\(\mathcal D\), and the proof retains the lower value norm in (2).
There is no projection removing any component of \(v\).

Choose fixed precompact coordinate charts and smooth orthonormal
frames for the bundles. With \(dV_{g_0}=\mu\,dx\), put
\(P=\mu\mathcal P\). One can use leading coefficient
\(A^{ij}=\mu g_0^{ij}I\) in divergence form because it gives the
exact second-order symbol. The remaining first and zeroth-order
terms are fixed smooth matrices. Moving the first-order term
\(C^j\partial_jv\) into \(\partial_j(C^jv)-(\partial_jC^j)v\)
gives the exact form
\[
 Pv=-\partial_i(A^{ij}\partial_j v+M^iv)+Z v
\]
for fixed smooth matrix coefficients \(M^i,Z\). This retains
the reference connection, curvature, coordinate and \(I\) terms.
If \(\mathcal D=L^i\partial_i+L^0\) in these frames,
the right side of (3) after multiplying by \(\mu\) is
\(-\partial_iF^i+G\), where
\(F^i=\mu(L^i)^*q\), \(G=\mu(L^0)^*q+\mu f\).
Thus the right side costs only \(q,f\) in \(L^p\) after
localization, even though it contains one divergence.

For a cutoff \(\chi\) supported in a chart put \(u=\chi v\).
The full product rule gives
\[
 P u=\chi Pv-\partial_i(A^{ij}(\partial_j\chi)v)
             -(\partial_i\chi)A^{ij}\partial_jv
             -(\partial_i\chi)M^iv .
\]
Write the third term as
\(-\partial_j((\partial_i\chi)A^{ij}v)
   +\partial_j((\partial_i\chi)A^{ij})v\)
and use
\(-\chi\partial_iF^i=-\partial_i(\chi F^i)+(\partial_i\chi)F^i\).
Then \(P u=-\partial_iF_\chi^i+G_\chi\), with
\[
 \|F_\chi\|_p+\|G_\chi\|_p
    \le C_\chi(\|q\|_{p,\mathrm{chart}}+\|f\|_{p,\mathrm{chart}}
                                          +\|v\|_{p,\mathrm{chart}}).
\]
The supported quantities extend by zero to \(\mathbb R^4\).
Freeze at a chart center, writing
\(P_*=-A_*^{ij}\partial_i\partial_j\) and
\(a_*(\xi)=A_*^{ij}\xi_i\xi_j\). Then
\[
 (I+P_*)u=-\partial_i\bigl(F_\chi^i+
            (A_*^{ij}-A^{ij})\partial_j u-M^iu\bigr)
                +G_\chi+(I-Z)u .                              \tag{4}
\]
Only the top oscillation multiplies \(\partial u\) here.
The relevant multiplier for the gradient of the resolvent
with flux forcing is \(m_{ij}(\xi)=\xi_i\xi_j(I+a_*(\xi))^{-1}\);
the one for value forcing is
\(n_i(\xi)=i\xi_i(I+a_*(\xi))^{-1}\).
The first multiplier includes the spatial derivative on the
flux input as well as the gradient of the resolvent output.
[E88, local divergence method][e88] · [E89][e89].

Here are the fixed \(L^p\) bounds used for (4).
The fixed master charts give upper coefficient bounds and a
positive lower bound on \(a_*\) on the unit sphere, independent
of centers and the subsequent support radii. On high annuli
\(|\xi|\sim2^j\), rescaling reduces \(m_{ij}\) to a smooth
compactly supported symbol with uniformly bounded derivatives,
using denominator \(2^{-2j}I+a_*(\xi)\) at unit frequency.
The low block has a smooth compact symbol. Scaling and
integration by parts give high-block kernel bounds
\(C_N2^{4j}(1+2^j|x|)^{-N}\), and their first derivatives
have the same bounds with \(2^{5j}\). Absolute summation
off zero, splitting at \(2^j|x|=1\), gives
\(|K(x)|\le C|x|^{-4}\), \(|DK(x)|\le C|x|^{-5}\).
The multipliers and their adjoints are bounded on \(L^2\)
by Plancherel. Partial annular sums converge strongly in
\(L^2\) and the bounds identify the off-support kernels.

For completeness, a dyadic decomposition by \(|w|\) at
height \(\lambda\) selects bad cubes of total volume
at most \(\|w\|_1/\lambda\). The vector good part has
squared \(L^2\) norm at most \(C\lambda\|w\|_1\).
Each vector bad part has integral zero. Off its enlarged cube
\(Q^*\) subtract \(K(x-x_Q)\); the derivative bound integrates
to \(C\ell(Q)\int_{c\ell(Q)}^\infty r^{-2}dr\le C\)
for every point of \(Q\) in the second kernel argument.
The sum of these off-cube \(L^1\) estimates is at most
\(C\|w\|_1\). Finite sums pass to the limit by the \(L^2\)
action and Fatou on the complement of the enlarged cubes.
Chebyshev and the good-part estimate give weak \((1,1)\)
for the operator and its adjoint. Splitting an input at
\(\lambda\) and integrating the weak and strong distributions
against \(s\lambda^{s-1}d\lambda\) gives strong \((s,s)\)
for \(1<s<2\): the integrals in \(\lambda\) have powers
\(s-2\) below the input modulus and \(s-3\) above it.
Duality with \(s=3/2,6/5,8/7\) on the adjoint gives the
needed \(p=3,6,8\). The value symbol has an extra factor
\(2^{-j}\) on high annuli. The corresponding \(L^1\) kernel
bounds sum, and the smooth low block is integrable, giving
the value gradient bound by Young's inequality. This is
the distinct frozen flux and value calculation, using the
kernel proof method of E66/E88/E89.
[E66, fixed inverse kernel method][e66] · [E89][e89].

Choose the charts small so the leading oscillation times
the flux multiplier constants and the finite slot factor
can be absorbed for each supported \(u\), for all three
chosen \(p\). The lower and cutoff coefficients are fixed
after choosing the charts. Summing and converting coordinate
to reference derivatives gives
\[
 \|D_0v\|_p\le A_p(\|q\|_p+\|f\|_p+\|v\|_p).
\]
For a local supported section component and a normalized mollifier
\(\rho_h\), integrating translation differences gives
\(\|u-\rho_h*u\|_p\le Ch\|\partial u\|_p\).
Young gives
\(\|\rho_h*u\|_p\le C h^{-2+4/p}\|u\|_2\) because the
kernel exponent is \(2p/(p+2)\). Summing in the fixed
charts adds a term \(Ch\|v\|_p\) from differentiating
cutoffs and frame coefficients. Absorbing it for small
fixed \(h\) yields
\(\|v\|_p\le\varepsilon\|D_0v\|_p+C_\varepsilon\|v\|_2\)
for any chosen fixed \(\varepsilon>0\).
Set \(q=\mathcal Dv\), \(f=v\), then choose
\(2A_p\varepsilon\le 1/2\) and absorb once more. Including
the norm of \(v\) itself proves (2). Every patch,
multiplier and interpolation constant depends only on
the reference and the finite set of exponents.

## Fixed embedding estimates

To make the exponents explicit, for compactly supported
\(w\) on \(\mathbb R^4\) the one-dimensional fundamental
theorem bounds \(|w(x)|\) by each
\(F_i(\widehat x_i)=\int|\partial_i w(x)|\,dx^i\).
The product of these four bounds to the power \(1/3\)
bounds \(|w|^{4/3}\). Iterated Hölder gives
\(\int\prod_i F_i^{1/3}\le\prod_i(\int F_i)^{1/3}\).
For this inequality, integrate in one coordinate using
Hölder on the three dependent factors, separate the
remaining factor by Hölder with exponents \(3\) and \(3/2\),
and repeat in one lower dimension. This proves
\(\|w\|_{4/3}\le C\|\partial w\|_1\).
Applying it to \(|u|^9\), and using
\(\int |u|^8|\partial u|\le\|u\|_{12}^8\|\partial u\|_3\),
gives \(\|u\|_{12}\le C\|\partial u\|_3\).
Fixed supported chart pieces and bundle-frame reconstruction
then give
\[
                   \|v\|_{12}\le S_3\|v\|_{W^{1,3}} .         \tag{5}
\]
The derivatives of cutoffs and frames contribute the lower term
\(\|v\|_3\). The same estimates apply to vector moduli by the
chain rule for \(|u|^9\).

For \(p>4\), integrating \(u(x)-u(y)\) along radial segments
and averaging \(y\in B_r(x)\) gives
\[
 \fint_{B_r(x)}|u(x)-u(y)|\,dy
       \le C\int_{B_r(x)}|x-y|^{-3}|\partial u(y)|\,dy
       \le C_p r^{1-4/p}\|\partial u\|_p .
\]
The first bound uses polar integration with the segment integral
inside the radial average. In the second, the conjugate exponent
is \(p/(p-1)<4/3\), so the kernel's \(L^{p/(p-1)}\) integral
is finite and has the displayed power of \(r\). For two points
at distance \(r\), compare both values with the average over
\(B_{2r}(x)\). This ball is contained in \(B_{3r}(y)\),
whose volume is a fixed multiple, so the same estimate applies
at \(y\). A fixed-radius average and \(\|u\|_p\) also control
the sup norm. Applying these inequalities to the fixed compactly
supported chart pieces gives
\[
 \|v\|_{C^0}\le C\|v\|_{W^{1,6}},\qquad
 \|v\|_{C^{0,1/2}}\le C\|v\|_{W^{1,8}} .                      \tag{6}
\]
Fixed coordinate distances and the metric are locally comparable,
and the derivatives of patch terms are bounded by the value
and \(D_0\) norms. Smooth frame transition factors have bounded
first derivatives, so they preserve the stated Hölder powers.
Pairs of points separated by a fixed chart scale are controlled
by the sup estimate. If the seminorm is written with fixed parallel
transport along short reference geodesics, its difference from
the chart formula is bounded by \(C d_{g_0}(x,y)\|v\|_\infty\)
using the fixed connection coefficients. This gives an equivalent
Hölder norm on the reference bundle.

## Small \(L^4\) absorption and the finite bootstrap

For the actual curvature and Coulomb equations,
\[
 \mathcal Db=(\beta-\tfrac12[b\wedge b],\,0).
\]
Let \(C_{\rm br}\) be a fixed pointwise bound for the bracket
term by \(C_{\rm br}|b|^2\), and write \(V=\operatorname{vol}(g_0)\).
Since \(\|b\|_2\le V^{1/4}\|b\|_4\), (2) at \(p=3\) gives
\[
 \|b\|_{W^{1,3}}\le C_3\bigl(
      V^{1/3}\|\beta\|_\infty+V^{1/4}\|b\|_4
      +C_{\rm br}\|b\|_4\|b\|_{12}\bigr).
\]
The product uses \(1/3=1/4+1/12\). Combine this with (5)
and require \(C_3 C_{\rm br} S_3\eta\le1/2\).
Absorption gives \(\|b\|_{W^{1,3}}+\|b\|_{12}\le C\eta\).

At \(p=6\), the bracket is bounded by
\(C_{\rm br}\|b\|_{12}^2\), and
\(\|\beta\|_6\le V^{1/6}\|\beta\|_\infty\).
Hence (2) gives \(\|b\|_{W^{1,6}}\le C(\eta+\eta^2)\).
For \(\eta\le1\), (6) yields \(\|b\|_\infty\le C\eta\).
Finally at \(p=8\), the bracket is bounded by
\(C_{\rm br}\|b\|_\infty\|b\|_8\), with
\(\|b\|_8\le V^{1/24}\|b\|_{12}\).
This gives \(\|b\|_{W^{1,8}}\le C(\eta+\eta^2)\le C'\eta\).
The endpoint in (6) proves (1).
The only two smallness requirements on the datum are
\[
           \eta_*= \min\bigl\{1,(2 C_3 C_{\rm br} S_3)^{-1}\bigr\},
                    \qquad \eta\le \eta_* .
\]
The later steps need no new absorption. The estimate concerns
the supplied exact Coulomb representative, using the actual curved
\(d_0\) and the curvature bracket. It proves no finite placement,
horizontal slice, or estimate of initial curvature derivatives.

## Versions

All three frozen methodological digests matched. No new primary
source was opened or imported. Only this note and its return were
written. [Reference workflow][workflow].

| Artifact | SHA-256 |
| --- | --- |
| [Request][req] | `6be0b2fac34803375ddfde0d16e32ac0106a2ff1730cc93cca1c0375fd5dec79` |
| [B57][b57] | `d3f7e1596d30e9a60811c4a3d60b0551708792d6df8bafeeaae64c378b7df85e` |
| [E88][e88] | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| [E89][e89] | `0f3e17807d50c6c35be82c2c442a3f3fce0bc139dfbb1cd83074ced88b371484` |
| [E66][e66] | `09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66` |

[req]: ../research-progress/handoffs/SP4-CME-E99_REQUEST_v1.md
[b57]: ../brainstorm/notes/B57_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
[e88]: 88_LORENTZ_ORBIT_SOLVER_20261122.md
[e89]: ../reviews/E89_LORENTZ_ORBIT_AUDIT_20261122.md
[e66]: 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[workflow]: ../../../../REFERENCE_WORKFLOW.md
