# Signed Weyl cost of a positive-scalar product band

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. This is the bounded exact-product return for Route 06 and Route 10. Actual serving model and reasoning effort were unavailable to this worker. [Physical band plan](../../research-plan/PLAN.md) · [Intermediate cuts plan](../../../10_positive_scalar_intermediate_cuts/research-plan/PLAN.md)

The input revision was `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. The scientific witness and readback had SHA-256 `c51c9c03de4c45258343d0905a29f57ce34935dff7cd618f03c201f5c0f4a74c` and `482c9f1584e7018714de37dc60aba179bd8083a1a510c25b37d488074842f442`. The bands and meridian-first discussion were also read in the working handle-cuts manuscript at SHA-256 `62b372832a0aa9b321260790341f091a0e94476e29db3c4cb8280b96d39c7b09`. [Mazur band witness](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/MIXED_WITNESS.md) · [Independent scientific readback](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/reviews/MAZUR_BAND_READBACK.md) · [Surgery manuscript, `prop:band`, `eq:width` and `eq:mean`](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex)

The [Lean leaf](../../../../SmoothPoincare/PhysicalScales/PositiveProductBand.lean) has SHA-256 `a495a543bfb7ed9075920c1cddaa01cb79c920a0b9427c518633e192862eb1fe`. It uses Lean `leanprover/lean4:v4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` and Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`.

## Curvature and measured sides

On the actual smooth product metric `cylinderMetric h`, `cylinderMetric_ricciFrameSlots` uses the product Levi–Civita curvature and three-dimensional reconstruction from Ricci. It takes one oriented orthonormal frame of the product whose first vector is the unit line axis and whose last three vectors are the lifts of the supplied orthonormal Ricci eigenbasis. It uses the project's ordered positive sectional convention, including the last two slots of the curvature operator. The scalar trace in that frame is $R=\sum_i r_i$. The normal and the mixed rows and columns vanish. The tangential block has complementary entries $R/2-r_i$.

`productChiralWeylBlocks_of_slots` compresses in the normalized sums and differences of the same wedge pairs. In each sign the curvature compression has entries $(R/2-r_i)/2$ and scalar part $R/12$. The two trace-free blocks are both diagonal with entries $-(r_i-R/3)/2$. `cylinderMetric_chiralWeylDensities` identifies both Hilbert–Schmidt squares with $|\operatorname{Ric}^\circ_h|^2/4$ using the intrinsic slice expression $|\operatorname{Ric}_h|^2-R^2/3$. The frames are pointwise inputs, and the slice expression is independent of their choices.

`riemannianProductBand_integral_eq` uses the actual Riemannian volume of `cylinderMetric h`. The pinned product-volume theorem identifies it with the slice's Riemannian volume times Lebesgue measure, accounting for the Borel measurable-space identification. With $f=|\operatorname{Ric}^\circ_h|^2$, it integrates a density equal to $f/4$ over $Y\times[a,b]$ to $(b-a)J/4$, where $J=\int_Yf\,dV_h$. The fixed-piece costs $P_\sigma,Q_\sigma$ and full upper transition $D_\sigma$ are supplied to `riemannianProductBand_completeSideLedger`. It integrates the two halves on the given product, giving complete lower and upper costs $P_\sigma+LJ/8$ and $Q_\sigma+D_\sigma+LJ/8$. Their joined endpoint is $P_\sigma+Q_\sigma+D_\sigma+LJ/4$. The signed costs are functions on `Bool` and all budget theorems test both values.

## Length and strictness

The namespace is `SmoothPoincare.PositiveScalarCuts`. Its algebraic statements use a positive floor $\rho$, a common $J\ge0$ and the strict joined wall $2T$.

| Declaration | Checked content |
| --- | --- |
| `productBand_widthFloor_eq` and `productBand_width_iff` | With $L_0=\pi\sqrt{3/\rho}>0$, $\rho L_0^2=3\pi^2$. For $L\ge0$, $3\pi^2\le\rho L^2$ is equivalent to $L_0\le L$. |
| `exists_productBand_width_and_budget_iff` | Some positive length passes the inclusive width test and both strict joined endpoint bounds precisely when every signed endpoint at $L_0$ is strictly below $2T$. |
| `exists_productBand_width_and_budget_zero_iff` | At $J=0$, the same existence is equivalent to $P_\sigma+Q_\sigma+D_\sigma<2T$ for both signs. Equality in either sign fails. |
| `productBand_twoMean_pos_iff` | For zero outward means the actual comparison expression is positive precisely for $L>0$. |
| `exists_shortProductBand_twoMean_and_budget_iff` | For every prescribed upper length $\delta>0$, existence of $L<\delta$ passing the strict two-mean test and both strict joined bounds is equivalent to strict headroom of the two fixed signed costs. |

The exact cylinder identifies the metric and volume on the model product. To apply the ledger to the meridian-first Mazur double, the scientific witness supplies the same-source physical marking and inverse, width $d=L$, scalar floor $\rho$, zero outward means, both complete pieces and the placement of the fixed transition. Its strict $J>0$ uses the topology of $Y_2$. Räde's comparison supplies the geometric implication of either inequality. The Lean leaf checks the exact cost and feasibility inequalities. The joined expression is an endpoint energy and gives no bound for the peak of an arbitrary path used to create that endpoint. The fixed costs and $J$ on this Mazur witness remain unevaluated numerically. [Mazur band and marked comparison](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/MIXED_WITNESS.md) · [Comparison source record](../../../10_positive_scalar_intermediate_cuts/references/README.md)

## Lean readback

Both `lake env lean SmoothPoincare/PhysicalScales/PositiveProductBand.lean` and `lake build SmoothPoincare.PhysicalScales.PositiveProductBand` passed from `formalization/`. The leaf's import replay checked the principal theorem types and ran `#print axioms` on all fifteen public theorems. Every theorem depended only on `propext`, `Classical.choice` and `Quot.sound`. The namespace prefix is omitted from this readback of the three length existence results.

```lean
exists_productBand_width_and_budget_iff (lower upper transition : Bool → ℝ)
  {ρ J T : ℝ} (hρ : 0 < ρ) (hJ : 0 ≤ J) :
  (∃ L,
      0 < L ∧
        3 * Real.pi ^ 2 ≤ ρ * L ^ 2 ∧ ∀ (σ : Bool), productBand_joinedEnergy lower upper transition J L σ < 2 * T) ↔
    ∀ (σ : Bool), productBand_joinedEnergy lower upper transition J (productBand_widthFloor ρ) σ < 2 * T
exists_productBand_width_and_budget_zero_iff (lower upper transition : Bool → ℝ)
  {ρ T : ℝ} (hρ : 0 < ρ) :
  (∃ L,
      0 < L ∧
        3 * Real.pi ^ 2 ≤ ρ * L ^ 2 ∧ ∀ (σ : Bool), productBand_joinedEnergy lower upper transition 0 L σ < 2 * T) ↔
    ∀ (σ : Bool), lower σ + upper σ + transition σ < 2 * T
exists_shortProductBand_twoMean_and_budget_iff (lower upper transition : Bool → ℝ)
  {ρ J T δ : ℝ} (hρ : 0 < ρ) (hJ : 0 ≤ J) (hδ : 0 < δ) :
  (∃ L < δ,
      0 < productBand_twoMeanExpression ρ L ∧
        ∀ (σ : Bool), productBand_joinedEnergy lower upper transition J L σ < 2 * T) ↔
    ∀ (σ : Bool), lower σ + upper σ + transition σ < 2 * T
```

The leaf checks the exact width equality at $\rho=3$, the anisotropic Ricci fixture $(0,1,1)$ with Weyl density $1/6$, failure at a strictly budgeted endpoint when the transition alone equals the wall at $J=0$, and arbitrarily short two-mean products with positive transition expense and $J=2$.
