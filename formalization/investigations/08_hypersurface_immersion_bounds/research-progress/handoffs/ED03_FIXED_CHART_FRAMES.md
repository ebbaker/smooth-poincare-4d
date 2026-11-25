# IMM-E01 · Transport an actual principal frame to a fixed chart

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and effort were unavailable. This bounded E packet concerns the local Codazzi argument for the induced metric of the same smooth Euclidean hypersurface immersion. [Route 08 plan](../../research-plan/PLAN.md) · [Master immersion manuscript](../../../../../papers/master/manuscript/immersion_entry.tex)

| Input or output | SHA-256 prefix or revision |
| --- | --- |
| Repository intake | `b5de9758f16e14f22162b4a1e091166ea126c389` |
| Route 08 plan | `19005b5907919058` |
| Master immersion manuscript | `d294f6e4600927f5` |
| [ImmersionChart.lean](../../../../SmoothPoincare/Immersions/ImmersionChart.lean) | `3dc69a1955cff56a` |
| [ChartUnitNormal.lean audit intake](../../../../SmoothPoincare/Immersions/ChartUnitNormal.lean) | `b69b575e889efa3a` |
| [GaussDifferential.lean](../../../../SmoothPoincare/Heights/GaussDifferential.lean) | `3cc3c6d0781891ec` |
| DifferentialGeometry `Geometry/Geodesic/Chart/TransitionMap.lean` | `510df2e6aa8d69c0` |
| DifferentialGeometry `Geometry/Submanifold/SecondFundamentalForm/MetricCompatibility.lean` | `6685c27e884003b8` |
| DifferentialGeometry pin | `788efe97894474c032de6dfb1289d515f613d15a` |
| Mathlib pin | `c55e6e786f49471c72fbddbec5415808896aec1e` |
| [Lake manifest](../../../../lake-manifest.json) | `839111aae86b6935` |
| [FixedChartFrames.lean](../../../../SmoothPoincare/Immersions/FixedChartFrames.lean) | `f53e3aaf22467e96` |

The Lean pin is `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`. The module imports `ImmersionChart` for the immersion and frame definitions. The normal field and signed second form are supplied by separate modules. [Local normal receipt](ED03_CHART_UNIT_NORMAL.md) · [Signed second form transport](ED03_NORMAL_CHART_TRANSITION.md)

## Geometric statement

Let $q$ belong to the source of the fixed extended chart $\phi_p$ on the smooth real manifold without boundary. Put $y=\phi_p(q)$ and $z=\phi_q(q)$ for the coordinates of the same point. The principal basis theorem gives the interior membership of $y$ and $z$ in the corresponding chart targets.

`fixedChartFrameTransition` is $L=D(\phi_q\circ\phi_p^{-1})(y)$. On the given overlap, `fixedChartFrameTransitionEquiv` is a continuous linear equivalence whose forward and inverse maps are the derivatives of the two actual chart changes. The equations are exported as `fixedChartFrameTransitionEquiv_apply` and `fixedChartFrameTransitionEquiv_symm_apply`. The proof uses the pinned chain rule identities on the open overlap.

`fixedChartFrameTransition_metric` proves $K_q(z)(Lu,Lv)=K_p(y)(u,v)$ for the same smooth metric written in the two charts. In the centered chart at $q$, the tangent trivialization is the identity on the model tangent space. The identity map in two different charts therefore gives $L$ as the fixed chart's map from coordinate vectors at $y$ to the actual tangent space at $q$. The metric equality follows by writing the intrinsic metric in each tangent trivialization. `fixedChartFrameTransition_immersionDerivative` uses the same map $L$ to give $Df_p(y)u=dF_q(Lu)$ for the actual written immersion.

`exists_fixedChartPrincipalBasis p hq Q` takes the supplied oriented orthonormal principal frame $Q$ of the actual immersion at $q$ and returns a basis $b$ of the fixed chart. Its outputs are the two target interiors, $Lb_i=Q_i$, $K_p(y)(b_i,b_j)=\delta_{ij}$, and $Df_p(y)b_i=dF_q(Q_i)$. The basis is a pointwise pullback by $L^{-1}$. The route can combine it with the signed second form on the same overlap to derive a pointwise shape equation in one fixed chart. Smoothness must be established for the resulting shape field when applying the neighborhood Codazzi argument. The global unit normal, indexed integral and selected attaching data require separate geometric constructions.

## Verification

Both commands passed from `formalization/`.

```sh
lake env lean SmoothPoincare/Immersions/FixedChartFrames.lean
lake build +SmoothPoincare.Immersions.FixedChartFrames
```

An independent import checked all seven public declarations with `#check`. The elaborated return types of the transition and equivalence are `E →L[ℝ] E` and `E ≃L[ℝ] E`. The basis theorem uses a finite-dimensional model space and a supplied `PrincipalFrameAt F o q`, returning `∃ b : Module.Basis (Fin 4) ℝ E` with the five outputs above. The overlap, metric and immersion derivative theorems use the smooth boundaryless charted manifold. None of the exported declarations requires a Hausdorff instance as an additional premise.

`#print axioms` on `fixedChartFrameTransitionEquiv`, `fixedChartFrameTransition_metric`, `fixedChartFrameTransition_immersionDerivative` and `exists_fixedChartPrincipalBasis` returned `propext`, `Classical.choice` and `Quot.sound` for each.
