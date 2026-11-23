# SP4-CME-E109 — A multiscale lower bound for the frozen heat strain budget

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I did not author E47 or E21.
The two used frozen note hashes matched the [request][req].
E53 was unnecessary for this calculation. No new primary source
was inspected or imported. [B60][b60]. [Return][ret].

## Frozen compatible defect and strain

Use oriented Euclidean \(\mathbb R^4\) with constant
\(E=\mathbb R^3\) and its fixed Euclidean pairing.
Take the constant self-dual orthonormal triple \(F_0\)
with components
\[
 F_{0,1}=(dx^{12}+dx^{34})/\sqrt2,\quad
 F_{0,2}=(dx^{13}-dx^{24})/\sqrt2,\quad
 F_{0,3}=(dx^{14}+dx^{23})/\sqrt2 .
\]
Then \(F_{0i}\wedge F_{0j}=\delta_{ij}\,dx^{1234}\).
Fix the trace-free symmetric matrix
\(M=\operatorname{diag}(1,-1,0)/\sqrt2\), of Hilbert–Schmidt
norm one, and put \(C_i=\sum_j M_{ij}F_{0j}\).
Use any one fixed nonzero nonnegative
\(\chi\in C_c^\infty((1,2))\), evaluated at the radius.
With \(X=x^i\partial_i\) the radial dilation field, define
\[
                   a_*=\tfrac12\chi(r)\iota_X C,\qquad r=|x|.
\]
This is a smooth compactly supported \(E\)-valued
one-form. Since each \(C_i\) is constant, \(d(\iota_X C)=2C\)
by dilation and the Lie derivative of a two-form.
For \(x\ne0\) take a unit covector \(\theta=x^\flat/r\).
A self-dual two-form has the form
\(C_i=\theta\wedge\alpha_i+*(\theta\wedge\alpha_i)\),
where \(\alpha_i=\iota_{X/r}C_i\). Thus
\[
  (x^\flat\wedge\iota_X C_i)^+
       =r^2(\theta\wedge\alpha_i)^+=\tfrac12 r^2 C_i .
\]
Using \(dr=x^\flat/r\) on the support, it follows that
\[
 da_*=\chi C+\tfrac12\chi'(r)dr\wedge\iota_X C,\qquad
 (da_*)^+= f(r)C,\qquad f(r)=\chi(r)+\tfrac14r\chi'(r).
                                                                            \tag{1}
\]
The factor \(\frac14\) uses both the \(\frac12\) in \(a_*\)
and the \(\frac12\) in the self-dual projection.

In E47's notation
\(L_0(B)_{ij}=\big((B_i,F_{0j})+(B_j,F_{0i})\big)/2\).
Since \((C_i,F_{0j})=M_{ij}=M_{ji}\), \(L_0(da_*)=fM\)
and this is trace-free. Thus the normalized frozen
linearized defect is exactly \(q_*=2\operatorname{tf}L_0(da_*)=2fM\).
The factor two follows also by differentiating the
wedge Gram matrix and dividing by its trace normalization
at the unit triple. [E47, exact Hessian and normalization][e47].

Choose a fixed \(R>2\), to be enlarged below, and set
\(r_k=R^{-k}\) for \(k=1,\ldots,N\) and
\(\delta_N=N^{-1/2}\). Define the finite family
\[
 a_N(x)=\delta_N\sum_{k=1}^N r_k a_*(x/r_k),\qquad
 q_N(0,x)=2\operatorname{tf}L_0(da_N)
     =2\delta_N\sum_{k=1}^N f(|x|/r_k)M .                            \tag{2}
\]
The scaled one-forms use their coefficient arrays in
the fixed Euclidean frame. One derivative cancels
the \(r_k\) prefactor, so \(da_N\) is precisely the
compatible curvature input in this linear calculation.
The supports \(r_k<|x|<2r_k\) are disjoint. In particular
\[
 \|a_N\|_\infty\le \delta_N r_1\|a_*\|_\infty,\qquad
 \|da_N\|_\infty\le\delta_N\|da_*\|_\infty .
\]
All inputs are smooth and compactly supported for each
finite \(N\). In dimension four the factor \(r_k^{-1}\)
in the gradient of \(f(|x|/r_k)\) cancels \(r_k^4\) in the
fourth-power integral. With \(f_{\rm rad}(x)=f(|x|)\),
disjoint support and \(T_N(0)=\frac12 d q_N(0)\) give
\[
 \|T_N(0)\|_4^4
    =\delta_N^4 N\|df_{\rm rad}\|_4^4,\qquad
 \|T_N(0)\|_4=N^{-1/4}\|df_{\rm rad}\|_4 .                            \tag{3}
\]
Here \(r^3 f(r)=\frac14(r^4\chi(r))'\). That identity
shows both \(\int_0^\infty f(r)r^3\,dr=0\) and
\(f\not\equiv0\), since a constant \(r^4\chi\) with
this support would vanish. Therefore
\(\|df_{\rm rad}\|_4>0\).

## Damped heat and the sign at the origin

Fix \(\lambda>0\). Choose ordinary heat coefficient one
and \(\Delta=\sum_i\partial_i^2\), so
\[
 q_N(t)=e^{-\lambda t}e^{t\Delta}q_N(0),\qquad
 T_N(t)=\tfrac12 d q_N(t).
\]
The full spatial derivative \(D T_N\) is used in
\[
 J_{\rm lin}(N)=\int_0^\infty
       \big(\|D T_N(t)\|_\infty+\|T_N(t)\|_\infty^2\big)\,dt .
\]
In this notation the derivative in the budget is the
Euclidean counterpart of the full covariant derivative
of strain. It is a Hessian, with both base slots
retained. The exterior derivative of the one-form
\(T_N=\tfrac12 dq_N\) vanishes and is a different
operation. Applying the same scalar semigroup to
\(a_N\) would preserve the relation in (2), since
\(d\) and the constant \(L_0\) commute with the semigroup.
[E21, scalar heat benchmark and its scope][e21].

Let \(\mathcal H(s)=\partial_{11}e^{s\Delta} f_{\rm rad}(0)\)
for \(s>0\). By symmetry, all diagonals agree and
off-diagonals vanish at zero. With the heat kernel
\(K_s(y)=(4\pi s)^{-2}e^{-|y|^2/(4s)}\),
direct differentiation gives
\(\partial_{11}K_s=(y_1^2/(4s^2)-1/(2s))K_s\).
The angular average of \(y_1^2\) on a radius-\(r\)
sphere is \(r^2/4\). Thus
\[
 \begin{split}
 \mathcal H(s)
 &=\frac{|S^3|}{(4\pi s)^2}
   \int_0^\infty
    \left(\frac{r^2}{16s^2}-\frac1{2s}\right)
       e^{-r^2/(4s)} f(r) r^3\,dr\\
 &=\frac{1}{1024\,s^5}
     \int_1^2 r^5\chi(r)(r^2-12s)e^{-r^2/(4s)}\,dr .                \tag{4}
 \end{split}
\]
For the second equality insert \(r^3f=(r^4\chi)'/4\).
The derivative of the Gaussian-weighted parenthesis
in the first line is
\(\frac{r(12s-r^2)}{32s^3}e^{-r^2/(4s)}\).
Integrating by parts gives the sign and coefficient
in (4), with no boundary contributions and \(|S^3|=2\pi^2\).

In particular \(\mathcal H(s)>0\) for \(0<s<1/12\),
and \(\mathcal H(s)<0\) for \(s>1/3\).
Choose fixed \(0<a<b<1/12\), for example
\(a=1/48,\ b=1/24\). On \([a,b]\), (4) gives the
strict positive lower bound
\[
 \mathcal H(s)\ge h_*
   :=\frac{(1-12b)e^{-1/a}}{1024\, b^5}
                      \int_1^2 r^5\chi(r)\,dr>0 .                     \tag{5}
\]
In addition, for \(s\ge a\), the bound
\(|r^2-12s|\le4+12s\) on the support gives
\[
 |\mathcal H(s)|\le C_{a,\chi}s^{-4},\qquad
 C_{a,\chi}=\frac{4/a+12}{1024}\int_1^2 r^5\chi(r)\,dr .
                                                                            \tag{6}
\]
The extra decay in (6) comes from the cancellation
\(r^3 f=(r^4\chi)'/4\).

## Disjoint time intervals and interactions

The scale identity for each atom is
\[
 \partial_{11}e^{t\Delta}\big(f_{\rm rad}(\,\cdot/r_j)\big)(0)
                  =r_j^{-2}\mathcal H(t/r_j^2).
\]
On \(I_k=[a r_k^2,b r_k^2]\), the own-scale atom
is at least \(h_* r_k^{-2}\) by (5).
For \(j<k\), the coarser atom satisfies
\(t/r_j^2\le b(r_k/r_j)^2<1/12\), so it contributes
with the same positive sign.
Enlarge \(R\) so that \(aR^2>1/3\).
For \(j>k\), the finer atom then has \(t/r_j^2>1/3\)
on \(I_k\) and contributes with negative sign.
Its absolute contribution has the bound
\[
 r_j^{-2}|\mathcal H(t/r_j^2)|
      \le C_{a,\chi}t^{-4}r_j^6
      \le C_{a,\chi}a^{-4}r_k^{-2}(r_j/r_k)^6 .
\]
This is stronger than the power-four bound from
\(\|\partial_{11}K_t\|_\infty\le C t^{-3}\) and the
atom's \(L^1\) norm \(r_j^4\|f_{\rm rad}\|_1\).
Choose \(R\) also with \(R^2>b/a\) and
\[
           C_{a,\chi}a^{-4}\,\frac{R^{-6}}{1-R^{-6}}
                                    \le h_*/2.                      \tag{7}
\]
All choices are fixed, independent of \(N\).
The intervals are disjoint because
\(b r_{k+1}^2<a r_k^2\). Summing the fine geometric
tail and keeping the coarse nonnegative terms gives
\[
 \sum_{j=1}^N r_j^{-2}\mathcal H(t/r_j^2)
                \ge \tfrac12 h_* r_k^{-2}\qquad(t\in I_k).           \tag{8}
\]

By (2), the \(11\) derivative slot of \(D T_N(t,0)\)
is
\(\delta_N e^{-\lambda t}\sum_j r_j^{-2}\mathcal H(t/r_j^2)M\).
Since \(|M|=1\), (8) bounds the full spatial
supremum from below by
\(\delta_N e^{-\lambda b r_1^2}(h_*/2)r_k^{-2}\)
throughout \(I_k\). The squared strain term in the
budget is nonnegative. Integrating over the disjoint
intervals yields
\[
 J_{\rm lin}(N)
       \ge \frac{h_*}{2}(b-a)e^{-\lambda b r_1^2}\,N\delta_N
       =c\sqrt N .                                                  \tag{9}
\]
Thus the same \(c>0\) works for all finite \(N\).

The budget is finite for each \(N\). Derivatives commute
with scalar heat, and convolution by its positive
unit-mass kernel is a contraction on tensor \(L^\infty\).
The smooth compact data and damping give the bound
\[
 J_{\rm lin}(N)
   \le\lambda^{-1}\|D T_N(0)\|_\infty
          +(2\lambda)^{-1}\|T_N(0)\|_\infty^2<\infty.
\]
No uniform upper bound or sharp Lorentz asymptotic
is asserted.

The calculation is on a frozen principal model with
ordinary exterior derivative and an independently
prescribed nonzero \(F_0\). An actual adjoint derivative
for a chiral \(SO(3)\) connection with that curvature
would satisfy \(d_A^2=[F_A,\cdot]\), whereas \(d^2=0\)
here. The ordinary-compatible pair in (2) is a
first-order frozen pair. The large budget in (9)
therefore tests only this fixed damped heat evolution,
with small values and small initial \(L^4\) strain.
No result for an actual round-bundle or nonlinear
connection flow follows from this test.

[req]: ../research-progress/handoffs/SP4-CME-E109_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E109_RETURN_v1.md
[b60]: ../brainstorm/notes/B60_MULTISCALE_STRAIN_BUDGET_TEST_20261122.md
[e47]: 47_ROUND_STABLE_LINEAR_20261122.md
[e21]: 21_LORENTZ_HEAT_BENCHMARK_20261122.md
