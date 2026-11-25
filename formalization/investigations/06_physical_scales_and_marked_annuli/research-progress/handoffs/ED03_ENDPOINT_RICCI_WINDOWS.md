# SCALE-E03w · Chiral quantiles escape physical Ricci windows

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and effort were unavailable. This bounded E packet formalizes the last implication of the companion's endpoint Ricci-window proposition for the same physical distance, volume and curvature at every index. [Companion endpoint windows](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/endpoint_windows.tex) · [Master Ricci scale](../../../../../papers/master/manuscript/ricci_scales.tex)

| Input or output | SHA-256 prefix or revision |
| --- | --- |
| Repository intake | `b5de9758f16e14f22162b4a1e091166ea126c389` |
| Route 06 plan | `056d1455a78ee085` |
| Companion `endpoint_windows.tex` | `f8b673c33fd023d4` |
| [Master manuscript](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) | `80dfb1227ed8b95b` |
| `ricci_scales.tex` | `a1dec14caba7f145` |
| [MetricQuantiles.lean](../../../../SmoothPoincare/PhysicalScales/MetricQuantiles.lean) | `541f71e51c2e53e8` |
| [CurvatureCompressionBound.lean](../../../../FirstOrderTwistor/CurvatureCompressionBound.lean) | `c277ca699fdb990c` |
| DifferentialGeometry | `788efe97894474c032de6dfb1289d515f613d15a` |
| Mathlib | `c55e6e786f49471c72fbddbec5415808896aec1e` |
| [Lake manifest](../../../../lake-manifest.json) | `839111aae86b6935` |
| [EndpointRicciWindows.lean](../../../../SmoothPoincare/PhysicalScales/EndpointRicciWindows.lean) | `90984adfcb889ae7` |

## Exact return

`SmoothPoincare.metricChiralQuantile_div_tendsto_atTop_of_fullCurvature_vanishes` takes a sequence of smooth Riemannian metrics on the compact, connected, Hausdorff source, given oriented orthonormal four-frames, and scales $a_i$ that are eventually positive. The chiral and raw full curvature densities are integrated against $dV_{g_i}$. The total positive chiral energy of the sequence tends to a positive limit $e_\ast$, and $r_i$ is a supplied attaining quantile at a fixed fraction $\vartheta>0$ of this energy. For each fixed $A>0$ the full curvature integral on $B_{g_i}(x,Aa_i)$ is assumed eventually below each $\varepsilon>0$, uniformly in $x$. The theorem proves $r_i/a_i\to+\infty$.

Fix a proposed bound $L$ and use the physical window with $A=\max(L,1)$. Once the total chiral energy is close to $e_\ast$, the attaining ball has chiral mass above $\vartheta e_\ast/2$. If $r_i<L a_i$, the attaining ball is contained in that window. Positivity and finite chiral mass give monotonicity under inclusion. The pinned pointwise compression bound compares the chiral density and raw four-slot full curvature density with coefficient one, which suffices for the vanishing contradiction. Both set integrals use the same metric and volume. [Physical metric and quantile attainment](ED03_METRIC_QUANTILES.md) · [Distance sphere attainment](ED03_SPHERES.md)

At the manuscript endpoint $e_\ast=T=4\pi^2$. Once uniform vanishing is supplied for the prescribed scale $a_i=(d_i^\kappa N_{i,q}(M))^{-1/\gamma_q}$, substitution is exactly the displayed escaped-radius limit. The conclusion applies to any positive supplied quantile fraction and any eventually positive scale with the stated curvature vanishing. The companion derives full curvature vanishing from weak Ricci bounds via interpolation and the Ricci compactness theorem. The input here is the full curvature vanishing conclusion. Formal interpolation, Ricci compactness and the divergence of the global Ricci quasinorm remain separate prerequisites. Mathlib's weighted tail identity is `MeasureTheory.lintegral_comp_eq_lintegral_meas_lt_mul`. A weak-$L^q$ proof would still need the split distribution estimate, including both zero-quasinorm cases, and conversion to the stated $L^p$ norm on the same restricted physical volume.

## Verification

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`. Both focused checks passed from `formalization/`.

```sh
lake env lean SmoothPoincare/PhysicalScales/EndpointRicciWindows.lean
lake build +SmoothPoincare.PhysicalScales.EndpointRicciWindows
```

An independent import checked the exact theorem with `#check`. `#print axioms` returned `propext`, `Classical.choice` and `Quot.sound`.
