# E111 — Independent audit of the frozen multiscale strain budget

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I did not author E109. I authored the E47 normalization
input and the E21 Euclidean heat benchmark. This audit verifies the
algebra and multiscale lower bound in E109 with those overlaps.
The E53 hash was verified and its results were unnecessary. No new
external source was inspected. [Request][req] · [E109][e109] ·
[Packet return][ret].

## Disposition and derivative convention

Pass in the specified fixed flat damped heat model. The finite smooth
ordinary-compatible pairs have values \(O(N^{-1/2})\) and initial
Euclidean \(L^4\) strain of exact order \(N^{-1/4}\). Their model budgets
are finite for each \(N\) and bounded below by \(c\sqrt N\) with a fixed
positive \(c\). The derivative meant by the B60 and E109 request
notation \(dT\) is the **full Euclidean derivative** \(DT\) of the
one-form \(T\). It retains both differentiation and one-form slots as
the flat counterpart of the geometric full covariant derivative.
With \(T=\tfrac12dq\), one has
\[
 (D T)_{ij}=\tfrac12\partial_i\partial_j q,\qquad
 (d_{\rm ext}T)_{ij}=\tfrac12(\partial_i\partial_jq-
                                \partial_j\partial_iq)=0 .
\]
Thus the Hessian lower bound below pertains to \(DT\).
The same derivative distinction holds for every finite \(N\) and
at every time. [B60][b60] · [E109 request][req109].

## Chiral algebra and finite annuli

In the given orientation of \(\mathbb R^4\),
\(*dx^{12}=dx^{34}\), \(*dx^{13}=-dx^{24}\), and
\(*dx^{14}=dx^{23}\). The listed \(F_{0i}\) are self-dual,
and their norms and mutual products give
\(F_{0i}\wedge F_{0j}=\delta_{ij}\,dx^{1234}\).
In particular, for \(C_i=\sum_j M_{ij}F_{0j}\) and the fixed
unit trace-free symmetric \(M\), \((C_i,F_{0j})=M_{ij}\).
For \(X=x^k\partial_k\), let \(r=|x|\), \(\theta=x^\flat/r\),
and \(\alpha_i=\iota_{X/r}C_i\) for \(r>0\).
The part of \(C_i\) containing \(\theta\) is
\(\theta\wedge\alpha_i\); self-duality forces the other
part to be its Hodge star. Thus
\((x^\flat\wedge\iota_XC_i)^+=(r^2/2)C_i\).
The pullback of the constant two-form \(C_i\) by dilation
\(x\mapsto e^s x\) has derivative \(2C_i\) at \(s=0\), so
\(d(\iota_X C_i)=2C_i\) by Cartan's formula. Differentiating
\(a_*=\frac12\chi(r)\iota_X C\) gives
\[
 (da_*)^+=f(r)C,\qquad f(r)=\chi(r)+\tfrac14r\chi'(r).
\]
The coefficient \(1/4\) uses the prefactor in \(a_*\) and the
self-dual projection factor.

For a two-form array \(B\), differentiate the wedge Gram matrix
\(W_{ij}(\varepsilon)=
 (F_0+\varepsilon B)_i\wedge(F_0+\varepsilon B)_j/dx^{1234}\)
at zero. Its derivative is
\((B_i,F_{0j})+(B_j,F_{0i})=2L_0(B)_{ij}\) by self-duality.
Since \(W(0)=I\), differentiating \(Q=3W/\operatorname{tr}W\)
gives \(2\operatorname{tf}L_0(B)\). For \(B=da_*\), the
self-dual projection and symmetry of \(M\) give \(L_0(B)=fM\).
This verifies the exact frozen linear defect \(q_*=2fM\)
in the E47 normalization. The factor pertains to linearized
\(Q\), distinct from the Hessian multiplier \(\sqrt8\) in E47.
[E47, conventions and exact Hessian][e47] · [E109, (1)–(2)][e109].

Let \(r_k=R^{-k}\), \(R>2\), \(\delta_N=N^{-1/2}\), and
\(a_N=\delta_N\sum_{k=1}^N r_k a_*(x/r_k)\), with scaling of
the components in the fixed Euclidean coframe. Its exterior
derivative is the sum of \(\delta_N(da_*)(x/r_k)\) in the
same component convention. This follows by differentiating
the array, which cancels the \(r_k\) multiplier. The terms have
disjoint supports inside \(r_k<|x|<2r_k\) and vanish identically
on a neighborhood of every support boundary. For each finite
\(N\) the fields vanish on \(|x|\le r_N\) and \(|x|\ge2r_1\).
Thus \(a_N,da_N\) are smooth and compactly supported, with
\(\|a_N\|_\infty\le\delta_N r_1\|a_*\|_\infty\) and
\(\|da_N\|_\infty\le\delta_N\|da_*\|_\infty\).
Keeping the sum finite avoids any regularity assumption at an
accumulation of scales.

The initial defect is \(2\delta_N\sum_k f_{\rm rad}(x/r_k)M\),
where \(f_{\rm rad}(x)=f(|x|)\). Its strain has the factor
\(\delta_N/r_k\) on each atom. Fourth powers and the scale
\(r_k^4\) of the Euclidean volume cancel, so
\[
 \|T_N(0)\|_4^4=\delta_N^4 N\|df_{\rm rad}\|_4^4 .
\]
Since \(r^3 f=\frac14(r^4\chi)'\) and \(\chi\) is nonzero
and compactly supported in \((1,2)\), \(f\) is nonzero
and \(\int_0^\infty f(r)r^3\,dr=0\). Its smooth compact
radial extension has a nonzero derivative. Thus the fourth
root gives the stated exact \(N^{-1/4}\) rate.
[E109, (2)–(3)][e109].

## Gaussian Hessian and scale interaction

Use ordinary heat coefficient one and damping \(\lambda>0\).
At the origin, the convolution Hessian of the prototype
\(f_{\rm rad}\) is diagonal by radial symmetry. For the
\(11\) entry \(\mathcal H(s)\), the derivative of the Gaussian
is
\(\partial_{11}K_s(y)=(y_1^2/(4s^2)-1/(2s))K_s(y)\),
where \(K_s(y)=(4\pi s)^{-2}e^{-|y|^2/(4s)}\).
The spherical average of \(y_1^2\) is \(r^2/4\) by
symmetry and \(\sum_i y_i^2=r^2\).
The angular density factor is
\(|S^3|/(4\pi s)^2=1/(8s^2)\). Put
\[
 P_s(r)=\left(\tfrac{r^2}{16s^2}-\tfrac1{2s}\right)
                     e^{-r^2/(4s)} .
\]
Then \(P_s'(r)=\frac{r(12s-r^2)}{32s^3}
e^{-r^2/(4s)}\). Inserting \(r^3f=(r^4\chi)'/4\)
and integrating by parts with zero boundary terms gives
\[
 \mathcal H(s)=-\frac1{32s^2}\int_0^\infty
                   P_s'(r)r^4\chi(r)\,dr
 =\frac1{1024s^5}\int_1^2r^5\chi(r)(r^2-12s)e^{-r^2/(4s)}\,dr .
\]
This verifies the coefficient and sign in (4). Nonnegativity
and nontriviality of \(\chi\) give strict positivity on
\(0<s<1/12\) and strict negativity on \(s>1/3\).
Fix the times \(0<a<b<1/12\) before selecting \(R\).
For \(s\in[a,b]\), the three factors have lower bounds
\(s^{-5}\ge b^{-5}\), \(r^2-12s\ge1-12b>0\), and
\(e^{-r^2/(4s)}\ge e^{-1/a}\). Thus (5) gives a fixed \(h_*>0\).
For \(s\ge a\), \(|r^2-12s|\le(4/a+12)s\), so (6) gives
\(|\mathcal H(s)|\le C_{a,\chi}s^{-4}\). This uses the
radial cancellation through the integration by parts.
The proof needs only \(\chi\) fixed, smooth, nonnegative and
nonzero inside \((1,2)\).
[E109, (4)–(6)][e109].

The Gaussian change of variables \(y=r_jz\) gives
\(e^{t\Delta}(f_{\rm rad}(\cdot/r_j))(x)=
(e^{(t/r_j^2)\Delta}f_{\rm rad})(x/r_j)\). Two derivatives
therefore multiply \(\mathcal H(t/r_j^2)\) by \(r_j^{-2}\).
On \(I_k=[a r_k^2,b r_k^2]\), the own scale contributes
at least \(h_* r_k^{-2}\). If \(j<k\), then
\(t/r_j^2\le b(r_k/r_j)^2<1/12\), so the coarse terms
have the positive sign. Impose \(aR^2>1/3\). If \(j>k\),
then \(t/r_j^2\ge aR^2>1/3\), so the fine terms are
negative. Regardless of their sign their magnitudes are
bounded by
\[
 C_{a,\chi}r_j^6t^{-4}
   \le C_{a,\chi}a^{-4}r_k^{-2}(r_j/r_k)^6 .
\]
The infinite geometric upper bound for this finite tail
is \(C_{a,\chi}a^{-4}r_k^{-2}R^{-6}/(1-R^{-6})\).
Choose \(R>2\) so large that the constant on \(r_k^{-2}\)
is at most \(h_*/2\), and require \(R^2>b/a\) as well as
\(aR^2>1/3\). These are simultaneous because \(a,b,h_*,C_{a,\chi}\)
were fixed first and the geometric factor tends to zero.
Consequently the intervals \(I_k\) are disjoint, and the
sum of all prototype Hessian contributions at a time in
\(I_k\) is at least \(h_*r_k^{-2}/2\).
[E109, (7)–(8)][e109].

## Integrated lower bound, finiteness and scope

For the actual sum in the frozen evolution, the \(11\) slot of
\(D T_N(t,0)\) equals
\(\delta_N e^{-\lambda t}M\sum_jr_j^{-2}\mathcal H(t/r_j^2)\).
The factor \(1/2\) from \(T_N\) cancels the initial defect's
factor two. The full pointwise norm controls this slot,
and the spatial supremum controls its value at the origin
since the field is smooth. On all selected intervals
\(e^{-\lambda t}\ge e^{-\lambda b r_1^2}\).
Integration on \(I_k\) cancels \(r_k^{-2}\) with the length
\((b-a)r_k^2\). The nonnegative square of the strain can be
discarded for this lower bound. Summation gives
\[
 J_{\rm lin}(N)\ge
 \tfrac12 h_*(b-a)e^{-\lambda b r_1^2}N\delta_N=c\sqrt{N},
\]
with \(c>0\) independent of \(N\).
This shows failure of a uniform budget bound on every fixed
positive smallness neighborhood measured by the two input
values and the initial Euclidean \(L^4\) strain.

For each fixed \(N\), the derivatives commute with convolution.
The positive unit-mass heat kernel is contractive in the
sup norm of Euclidean tensor arrays by the norm triangle
inequality. For all \(t\ge0\),
\(\|D T_N(t)\|_\infty\le e^{-\lambda t}\|D T_N(0)\|_\infty\)
and
\(\|T_N(t)\|_\infty^2\le e^{-2\lambda t}\|T_N(0)\|_\infty^2\).
Smooth finite input makes both initial sup norms finite.
The time integrals therefore cost \(1/\lambda\) and
\(1/(2\lambda)\) times the corresponding initial quantities.
This estimate need not be uniform in \(N\).
[E109, (9) and finiteness][e109] · [E21 heat convention][e21].

The exact compatibility used here is between \(a_N\) and
its ordinary derivative \(da_N\) in the frozen model.
Applying the same scalar damped heat to \(a_N\) would
preserve this relation since both \(d\) and \(L_0\) commute
with that heat evolution. The constant nonzero triple \(F_0\)
is independently prescribed: an ordinary derivative with
\(d^2=0\) is not the adjoint covariant derivative of a
connection with this noncentral curvature. The computation
does not give an estimate or counterexample for the actual
round-bundle operator or the nonlinear Fine flow.

## File identities

| Input | SHA-256 |
| --- | --- |
| [E111 request][req] | 1e248b9c9e06f2e6172d05222321928e839be20a4f6f0fdc1e79eec948775b25 |
| [E109 request][req109] | 962c3783918a5f30cc48f630f23bd240ca81ab72f81eff1aedc30b3cff2d4341 |
| [B60][b60] | 85f70ca2c48fb0e905aa42ec409010cbb6024b39ed8a6d23be5b5543f24669d8 |
| [E109][e109] | 360544867c56de98eda76d45cd7cf33ebd02631d95820e839b19500d6bb5e2a6 |
| [E47][e47] | ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6 |
| [E21][e21] | c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2 |
| [E53][e53] | 6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312 |

[req]: ../research-progress/handoffs/SP4-CME-E111_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E111_RETURN_v1.md
[req109]: ../research-progress/handoffs/SP4-CME-E109_REQUEST_v1.md
[b60]: ../brainstorm/notes/B60_MULTISCALE_STRAIN_BUDGET_TEST_20261122.md
[e109]: ../notes/109_FROZEN_MULTISCALE_STRAIN_BUDGET_20261122.md
[e47]: ../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e21]: ../notes/21_LORENTZ_HEAT_BENCHMARK_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
