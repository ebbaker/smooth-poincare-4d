# FOT-E51 · Metric Hessians on the realized harmonic ball

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution under the Edition 06 lead. Actual serving model and effort unavailable. Intake checkout 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5. E50 interior input SHA-256 d52a0607eff6b8a437de6912138a4b05f7e155ca0bf5802951d9ebd72c6f4245. Scientific manuscript SHA-256 719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1. [Issued packet](../../research-progress/handoffs/ED06_E51_PACKETS_20261126.md) · [E50 interior](E50_INTERIOR.md) · [Scientific manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

## Common constants before choosing the patch

The starting data are smooth Riemannian metrics on the closed oriented four-manifold and their actual E50 harmonic patches \(F\colon B_E(4r)\to M\) in the two normalized gauges. On \(B_E(3r)\) the E50 model metric \(G\) equals \(F^*h\). Its quadratic form is bounded by \(L^{-2}\) and \(L^2\) times the model form. Write \(u_{ik}=G_{ik}\), \(a=G^{-1}\) in the fixed model basis and \(Pu_{ik}=a^{ab}\partial_a\partial_b u_{ik}\). The physical ordered curvature ceiling gives the E50 bound \(F_0\) on \(\lvert Pu_{ik}\rvert\). The harmonic chart supplies \(A\) as a bound on the norm of the first derivative of each metric entry. Put \(B=\sum_i \lvert e_i\rvert\) and \(U=(LB)^2\), so \(\lvert u_{ik}\rvert\le U\). [Actual harmonic forcing](../../../SmoothPoincare/Variational/BourTransportedInterior.lean)

The lower form bound and one fixed compact Euclidean ball give a common inverse entry bound \(D\). The mean value inequality on \(B_E(3r)\) bounds the entry differences of \(G\) by \(A|w-z|\). Apply \(a(w)-a(z)=a(w)(G(z)-G(w))a(z)\) to obtain
\[
 |a^{ij}(w)-a^{ij}(z)|\le m|w-z|,\qquad m=n^2D^2A .
\]
The proof uses the pinned inverse matrix comparison on the two actual Gram matrices. The fixed axis lengths enter the contraction bound through \(B^2\). [Pinned inverse estimate](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Metric/Convergence/Coordinates/InverseGram.lean) · [Pinned matrix entry comparison](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Normed/Matrix/Entrywise.lean)

## Cutoff, absorption and cover

For exponent \(p=b>4\), let \(C_\Delta\) be the flat Euclidean Laplacian constant on smooth compactly supported scalar tests for the chosen additive Haar measure. The flat packet transports this estimate to the actual frozen inverse Gram \(a(z)\) by a linear isometry from the Euclidean model to the metric form at \(z\). The Jacobian cancels in the two \(L^p\) norms and the inverse map costs at most \(L^2\) on the Hessian. Thus the common frozen constant is \(C_0=L^2C_\Delta\). Choose
\[
 \rho=\min\!\left(\frac r4,\,\frac{1}{2(1+C_0mB^2)}\right).
\]
For each \(z\in\overline B_E(5r/2)\), use the pinned smooth cutoff \(\chi\), equal to one on \(\overline B_E(z,\rho/2)\), with support in \(\overline B_E(z,\rho)\). Its first- and second-derivative bounds are \(d_1,d_2\) from the same two radii. The product \(w=\chi u_{ik}\) is a globally smooth compactly supported flat test. Its Hessian is supported in the outer closed cutoff ball. There the variable-coefficient error obeys \(C_0m\rho B^2\le 1/2\). The flat packet's perturbation theorem gives
\[
 \|D^2w\|_{L^p(E)}\le 2C_0\|a:D^2w\|_{L^p(E)} .
\]
The localized source is bounded by
\[
 S=F_0+n^2D\left(Ud_2B^2+2d_1AB^2\right).
\]
This follows from the scalar Hessian product identity and the bounds on \(u_{ik}\), \(Du_{ik}\), \(Pu_{ik}\), the two cutoff derivatives and the coefficient entries. Restricting the result to the open inner cutoff ball uses equality of \(w\) and \(u_{ik}\) on a neighborhood of each point there. [Pinned smooth ball cutoff](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Calculus/Cutoff/Ball.lean) · [Flat perturbation](../../../SmoothPoincare/Variational/BourFlatInterior.lean)

A finite cover of the closed \(B_E(5r/2)\) by \(N\) balls of radius \(\rho/2\) is chosen before the metric. On their union, the norm of the Hessian is bounded pointwise by a sum of norms with the corresponding ball indicators. Minkowski then gives
\[
 \|D^2u_{ik}\|_{L^p(B_E(5r/2))}
   \le 2N C_0\,\mu(B_E(3r))^{1/p} S .
\]
The code uses the cover cardinality \(N\). Adding the entry and first-derivative bounds in the same restricted measure gives the uniform three-term \(W^{2,p}\) bound. The Lean wrapper applies to every finite exponent \(p\ge 1\) with a supplied flat estimate. Its norms are the actual extended \(L^p\) norms of the smooth classical derivatives, with the Euclidean measure supplied in the flat application. [Metric proof](../../../SmoothPoincare/Variational/BourMetricInteriorEstimate.lean)

## Scope

The metric estimate concerns the physical normalized metric in the supplying harmonic gauge. For a curvature-maximum normalization \(h=ag\), the original physical distance radius carries the factor \(a^{-1/2}\) proved in E50. The result gives the metric Hessian required in the trace-free Ricci analysis on smaller charts. Its flat \(L^p\) input for \(p>4\) is the Laplacian case of the Calderón–Zygmund estimate for compactly supported tests. Construction of the initial uniform harmonic chart and the coupled stationary Ricci bootstrap belong to separate supplier steps. [E50 scales and source audit](E50_INTERIOR.md) · [Gilbarg–Trudinger, §9.4 and Corollary 9.10](https://doi.org/10.1007/978-3-642-61798-0_9)

## Verification

The targeted metric build passed in 10,484 jobs under Lean 4.35.0-rc3, DifferentialGeometry 788efe97894474c032de6dfb1289d515f613d15a, and Mathlib c55e6e786f49471c72fbddbec5415808896aec1e. An exact downstream application at \(p=6\) composes the E50 common-radius supplier and the single flat estimate with physical curvature control at any allowed scale. It retains equality with the pullback metric and one bound chosen before the scale, metric, chart, or entry. The three metric estimates and four exported cutoff and covering declarations use only the standard Lean axioms propext, Classical.choice, and Quot.sound.

## Appendix · Real norms for the squared Ricci cutoff

On one chart let \(P=a^{ab}(x)\partial_a\partial_b\) and let \(u_j\) be a finite family of smooth scalar entries. The compact set \(K\) contains the support of the smooth cutoff \(\chi\). The cutoff satisfies \(|\chi|\le1\) on \(K\), with first- and second-derivative component bounds \(L,T\) in the fixed axes. Assume \(|u_j|\le U\), \(|a^{ab}|\le D\), and
\[
 |Pu_j|\le F_0+F_1\sum_{k,i}|\partial_i u_k|
\]
on \(K\). Here the constants are nonnegative. Put \(n=\dim E\), \(d_0=2U(T+L^2)\), \(d_1=4L\), \(e_2=(\sum_i|e_i|)^2\) and \(m=(\mu(K))^{1/p}\). For a system index \(q=(k,i)\) use the real norms
\[
 X_j=\|D^2(\chi^2u_j)\|_p,\qquad Y_q=\|\chi\partial_i u_k\|_p,\qquad
 Z_q=\|\chi^2\partial_i^2u_k\|_p .
\]
All three are taken on the same model domain with measure \(\mu\).

The weighted principal term pays \(F_0+F_1\sum_{q}|\chi\partial_i u_k|\) on \(K\) by \(|\chi|^2\le|\chi|\). The product error pays \(n^2D(d_0+d_1\sum_q|\chi\partial_i u_k|)\), and the cutoff operator vanishes off \(K\). Minkowski with the indicator of \(K\) preserves the same finite summation. With frozen constant \(C_0\) and small entry oscillation on \(K\), perturbation of the actual variable operator gives
\[
 X_j\le 2C_0(F_0+n^2D d_0)m+2C_0(F_1+n^2D d_1)\sum_qY_q .
\]
For the diagonal, evaluate the Hessian of the cutoff at \((e_i,e_i)\), which costs at most \(e_2\), and bound the product error by the same \(d_0+d_1\sum_q|\chi\partial_i u_k|\). Its integrated estimate is
\[
 Z_{(k,i)}\le d_0m+e_2 X_k+d_1\sum_qY_q .
\]
These inequalities retain the weighted gradient norm as an unknown. The sixth-power interpolation and final absorption use them separately. [Cutoff norm proof](../../../SmoothPoincare/Variational/BourRicciCutoffNorms.lean) · [Pointwise cutoff identities](../../../SmoothPoincare/Variational/BourCoupledInterior.lean) · [Real-norm assembly](../../../SmoothPoincare/Variational/BourLpAssembly.lean)

## Finite-cover estimate for the coupled scalar system

For exponent six, the sixth-power directional estimate bounds each weighted \(Y_q\) by a finite cutoff contribution and an arbitrarily small multiple of \(Z_q\). Summing over the fixed row and direction indices and inserting the two squared-cutoff inequalities closes the estimate for both \(\sum_q Y_q\) and each \(X_j\). The only pointwise source hypotheses are the bound \(U\) for the rows and the constants \(F_0,F_1\) in the first-order forcing inequality. [Sixth-power estimate and absorption](../../../SmoothPoincare/Variational/BourRicciW26.lean)

In the actual model metric, the freeze radius is the same \(\rho\) used for the metric stage. At each covering center \(z\), take \(K=\overline B_E(z,\rho)\) and let \(\chi=1\) on \(B_E(z,\rho/2)\). The common local constants follow from the same entrywise inverse bound and oscillation estimate, the same two cutoff radii, and Haar translation invariance of \(\mu(K)\). On the inner ball the Hessian of \(\chi^2 u_j\) equals \(D^2u_j\). The directional gradient norms control the actual Fréchet gradient through the fixed chart-basis operator-norm comparison. A finite cover of \(\overline B_E(5r/2)\) gives the first- and second-derivative bounds in the same restricted measure as the zeroth term. [Cutoff restriction](../../../SmoothPoincare/Variational/BourCutoffRestriction.lean) · [Finite-cover system application](../../../SmoothPoincare/Variational/BourHarmonicSystemInterior.lean)

The physical pullback wrapper obtains the metric form and first jet directly from the supplied harmonic chart. It uses one flat Laplacian estimate and the actual scalar row hypotheses on \(B_E(3r)\). The stationary identification of the rows, their common zeroth ceiling, and the verification of their drift forcing are separate geometric inputs to this wrapper.

The targeted cutoff and finite-cover builds passed in 10,488 and 10,492 jobs respectively. Independent `#print axioms` checks on `bourCutoffSystem_real_norm_bounds`, `bourFiniteCover_eLpNorm`, and the three public scalar-system estimates returned only `propext`, `Classical.choice`, and `Quot.sound`.

## Morrey on the same physical harmonic ball

On the four-dimensional Euclidean model, put \(w=\chi u\), where the fixed smooth ball cutoff is one on \(\overline B_E(2r)\) and supported in \(\overline B_E(9r/4)\). All three global \(L^6\) norms of \(w,Dw,D^2w\) are controlled by the input \(W^{2,6}\) norm of \(u\) on \(B_E(5r/2)\). The proof uses the order-two product bound and the fact that every cutoff derivative through order two vanishes off the larger ball. If \(\mathrm{vol}=c\mu\) for the supplying additive Haar measure, each restricted \(L^6\) norm is multiplied by \(c^{1/6}\). Lean proves the corresponding equality for the sum of all three terms. [Lean cutoff and measure comparison](../../../SmoothPoincare/Variational/BourHarmonicMorrey.lean)

Apply the pinned uniform Morrey estimates on \(B_E(5r)\). The order-zero and order-one bounds control \(w\) and \(Dw\) on the half ball. For each fixed unit Euclidean axis \(e_i\), the derivative norm of \(Dw(e_i)\) is bounded by the norm of \(D^2w\). The uniform pair estimate for these scalar functions gives exponent \(1-4/6=1/3\). The finite Euclidean basis recovers the operator-norm bound for \(Dw(x)-Dw(y)\). On \(B_E(2r)\), equality of \(w\) and \(u\) on neighborhoods identifies their actual derivatives. The mixed stationary application therefore controls the values, first derivatives, and first-derivative Hölder modulus of both the metric entries and the covariant trace-free Ricci entries in the same chart. The normalized pullback and original-metric radius comparison continue to hold. [Pinned higher-order Morrey](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Sobolev/Euclidean/Embedding/Morrey/HigherOrder.lean) · [Pinned pair estimate](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Sobolev/Euclidean/Embedding/Morrey/SmoothInequality.lean)

The targeted Morrey build passed in 11,195 jobs. Checks of the Haar conversion, the volume and Haar Morrey estimates, and the mixed stationary theorem returned only `propext`, `Classical.choice`, and `Quot.sound`.
