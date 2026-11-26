# E51 flat input for freezing a harmonic chart

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded execution in Edition 06 on
`1c81a3048c8c21a4c1d1fb23db72f37168a15ca5`. Actual serving model and
effort were unavailable. The pins are Lean `v4.35.0-rc3`,
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` and
Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. The working scientific
manuscript at intake had SHA-256
`719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`.
[Issued packet](../../research-progress/handoffs/ED06_E51_PACKETS_20261126.md) ·
[E50 physical chart and freezing calculation](E50_INTERIOR.md)

## A flat estimate with a precise analytic premise

For the model axes \(b_i=\texttt{chartModelBasis}\,E\,i\), set
\(P_a u(x)=\sum_{i,j}a^{ij}D^2u(x)[b_i,b_j]\). In Lean this is
`bourFlatOperator`. The theorem `bourFlatOperator_eq_partialDeriv`
identifies it with the ordered chart partial derivatives at every
smooth point. `BourFlatHessianEstimate μ p a C` asserts the estimate
\(\|D^2w\|_{L^p(\mu)}\le C\|P_aw\|_{L^p(\mu)}\) for every globally
smooth compactly supported \(w\). The Hessian has the operator norm
of the actual Fréchet bilinear map. On Euclidean four-space this is
bounded by its Hilbert–Schmidt norm, so the classical Calderón–Zygmund
estimate in the coordinate norm supplies the model inequality, for
example at \(p=5\). The argument uses the model Haar measure and
real scalar test functions. [Lean module](../../../SmoothPoincare/Variational/BourFlatInterior.lean) ·
[Gilbarg–Trudinger, §9.4](https://doi.org/10.1007/978-3-642-61798-0_9)

The pins supply the Fourier identity for the Laplacian on Schwartz
functions and distributions. Positive-degree differential symbols and
smooth temperate-growth multipliers use that framework. The Hessian
quotient \(\xi_i\xi_j/|\xi|^2\) requires an \(L^p\) bound for a
degree-zero symbol with a singularity at zero. DifferentialGeometry
supplies the parabolic heat-Hessian \(L^2\) operator and kernel
difference estimates. The pin search found the exponent-two elliptic
Hessian interfaces and no matching Euclidean strong-type endpoint
interpolation, Riesz-transform bound, or \(L^5\) Hessian estimate.
The remaining analytic premise is the single scalar estimate
\[
 \forall w\in C_c^\infty(E),\qquad
 \|D^2w\|_{L^5(\mu)}\le C_{\Delta,5}\|\Delta w\|_{L^5(\mu)} .
\]
The premise concerns only smooth whole-space scalar tests.
[Pinned Fourier multipliers](https://github.com/leanprover-community/mathlib4/blob/c55e6e786f49471c72fbddbec5415808896aec1e/Mathlib/Analysis/Distribution/FourierMultiplier.lean) ·
[Pinned parabolic \(L^2\) theory](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Parabolic/Euclidean/HeatKernel/Hessian/L2.lean) ·
[Pinned kernel differences](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Parabolic/Euclidean/HeatKernel/Hessian/Hormander.lean)

## Linear normalization and the coefficient error

`bourFlatOperator_comp_right` computes the coefficient of
\(P_a(w\circ T)\) as \(T a T^{\mathsf T}\) in the fixed axes and
evaluates the result at \(Tx\). For a continuous linear equivalence
\(T\), the inverse Hessian chain rule costs at most \(\|T^{-1}\|^2\).
For finite \(p>0\) the pushforward of additive Haar measure multiplies
both \(L^p\) norms by \(|\det T|^{-1/p}\). The factor is positive and
finite. `bourFlatHessianEstimate_push` cancels it in Lean and keeps
the squared inverse operator norm.
[Pinned Haar change of variables](https://github.com/leanprover-community/mathlib4/blob/c55e6e786f49471c72fbddbec5415808896aec1e/Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean)

The pointwise perturbation estimate on the actual model axes is
\[
 |P_{a(x)}w(x)-P_{a_0}w(x)|
 \le \left(\sum_{i,j}|a(x)^{ij}-a_0^{ij}|\,|b_i|\,|b_j|\right)
        \|D^2w(x)\|.
\]
Inside the support of the Hessian, an entry bound \(\delta\) gives
the weighted bound \(\varepsilon=\delta(\sum_i|b_i|)^2\).
The error vanishes where \(D^2w=0\), so the coefficient hypothesis
does not constrain the artificial extension outside the physical
localization. For \(p\ge1\), a.e. measurable \(P_{a(x)}w\), and a
frozen constant \(C_0\) with \(C_0\varepsilon\le1/2\), the two
perturbation theorems give
\[
 \|D^2w\|_{L^p(\mu)}\le 2C_0\|P_{a(x)}w\|_{L^p(\mu)} .
\]
The left norm is finite by smoothness and compact support. The finite
branch of the proof takes real values before absorption. The case
of infinite right norm follows from the extended-real inequality.
The quantitative local cutoff, product forcing, and coverage are
handled in the metric interior packet. [Lean perturbation statements](../../../SmoothPoincare/Variational/BourFlatInterior.lean)

For the actual frozen metric coefficient,
`bourFlatHessianEstimate_metricFrozen` chooses a linear map that
sends the reference Euclidean orthonormal basis to a basis orthonormal
for \(G(z)\). If \(G(z)(v,v)\le L^2|v|^2\), the inverse map has norm
at most \(L\). In this basis the transform of the Euclidean Laplacian
is the metric trace of the original Hessian at the frozen point.
Changing from this orthonormal trace to the fixed model axes
produces precisely \(\texttt{chartInvGramOnE}(G,0,z)\). The resulting
constant is \(L^2 C_{\Delta,p}\), uniformly for any \(z\) satisfying
the same form bound. Thus one scalar Euclidean supplier suffices
for both physical gauges in E50. [Pinned metric frame](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Metric/Coordinates/EuclideanFrame.lean) ·
[Checked physical normalization](../../../SmoothPoincare/Variational/BourFlatInterior.lean)

The targeted Lake build completed 3,943 jobs without diagnostics.
Type and axiom checks on eight public theorems returned only
`propext`, `Classical.choice` and `Quot.sound`.

For the localized system, take any finite component set and measurable
support set \(K\) of finite measure. If the pointwise forcing in row
\(i\) is bounded by \(a_i1_K+\sum_j b_{ij}|v_j|\) with \(a_i,b_{ij}\)
nonnegative and each jet \(v_j\) in \(L^p\), the real norms satisfy
\[
 \sum_i\|f_i\|_{p}
 \le \left(\sum_i a_i\right)\mu(K)^{1/p}
       +\sum_{i,j} b_{ij}\|v_j\|_p,\qquad 1\le p<\infty.
\]
The indicator norm gives the exact volume factor, and the finite
Minkowski inequality keeps each coupling coefficient. An a.e.
strongly measurable row with the same a.e. domination belongs to
\(L^p\). For the real-norm Hessian perturbation,
`bourLpNorm_hessianPerturb_entries` uses this finiteness or a
direct compact-support argument for the variable operator and keeps
the same constant \(2C_0\). [Lean assembly](../../../SmoothPoincare/Variational/BourLpAssembly.lean)

The assembly target completed 3,944 jobs without diagnostics. The
public replay checked a two-component application at \(p=6\). The
five declarations report only `propext`, `Classical.choice` and
`Quot.sound`.
