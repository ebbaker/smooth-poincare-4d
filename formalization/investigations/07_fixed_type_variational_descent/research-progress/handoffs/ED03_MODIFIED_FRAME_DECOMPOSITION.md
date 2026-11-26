# Edition 03 · The full frame curvature norm on the modified source

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded packet DESC-E06d. The serving model and reasoning effort
are unavailable to the worker. The working base was
`5706ef811adc3691fd85e75507a0a399cb81d18d` with Lean `4.35.0-rc3`, Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`.

In the oriented orthonormal frame \(e_a\) of a smooth Riemannian metric on
a Hausdorff boundaryless four-manifold, the repository uses the curvature
operator convention \(R_{abcd}=\langle\mathrm{Rm}(e_a,e_b)e_d,e_c\rangle\).
Its Ricci coefficients are \(\sum_iR_{ibia}\) and their trace is the actual
scalar curvature. The two chiral compressions use normalized sums and
differences of the oriented pairs \((01,02,03)\) and \((23,31,12)\). In
particular the second complementary pair is \(31\). In increasing wedge
coordinates, Bianchi gives \(R_{0123}=R_{0213}-R_{0312}\).
[Frame conventions](../../../../FirstOrderTwistor/GeometricChiralBlock.lean) ·
[Ricci contraction and Bianchi](../../../../FirstOrderTwistor/SpinRicciForcing.lean) ·
[Scalar contraction](../../../../FirstOrderTwistor/SpinTwistedSquare.lean)

`frameTensorNormSq_eq_chiral_ricci_scalar` expands the ordered sums and
reduces their entries by alternation, pair symmetry and this Bianchi
relation. `metricFrameTensorNormSq_eq_chiral_ricci_scalar` applies the
result to the actual Levi–Civita tensor and its two trace-free blocks in
the same frame. With \(Z=\mathrm{Ric}-(\mathrm{Scal}/4)g\) it proves

$$
\sum_{a,b,c,d}R_{abcd}^2
=4\bigl(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2\bigr)
+2|Z|^2+\mathrm{Scal}^2/6.
$$

[Lean source](../../../../SmoothPoincare/Variational/ModifiedFrameDecomposition.lean) ·
[Ricci concentration argument](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/ricci_concentration.tex)

`modifiedCutoffMoments_full_eq` integrates the pointwise identity in the
initial slice volume with its nonnegative test function. Integrability of
the weighted full density and almost-everywhere strong measurability of
the weighted components imply integrability of each summand by domination.
The terminal lower bound in
`modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges`
therefore uses the derived tested identity. The localized Euler
transgression bound is still supplied, as are the initial and terminal
integrability hypotheses for the cutoff sandwich.
[Finite-time Euler estimate](../../../../SmoothPoincare/Variational/ModifiedEulerCharge.lean) ·
[Euler transport analysis](../../../../../papers/master/01_fixed_type_variational_descent/reviews/E71_EULER_TRANSPORT.md)

The final leaf compiled with `lake env lean -j1` without diagnostics.
Its source SHA-256 is `a3299bc26a9de8fcd32f71a45df872c75a8deeff08a35dfc2b997c03a47253bb`.
The four declaration types replayed through the leaf import and depend
only on `propext`, `Classical.choice` and `Quot.sound`. Finite-coordinate
checks give Ricci \(3g\), scalar curvature \(12\), and squared tensor norm
\(24\) in unit constant sectional curvature. A sole unit sectional entry
on the wedge \(01\) has squared tensor norm \(4\).
