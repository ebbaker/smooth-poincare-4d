# ED04 · Round half-cylinder mode and exterior source check

26 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The selected worker role was GPT-6.2 Sol/ultra. Independent serving model and effort telemetry were unavailable. Intake `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. [Route register](../REGISTER.md) · [Plan](../../research-plan/PLAN.md) · [Setup sources](ED04_ENTRY_SETUP_INPUTS_20261126.md)

## B01 decision and E01 bounded execution

B01 fixes a single real radial coefficient in a degree-$l$ angular harmonic of unit $L^2(S^3)$ norm, for the smooth Riemannian half-cylinder with unit round cross-section and increasing outward coordinate $t$. The marked-cut source gives scalar curvature $6$ and angular eigenvalue $l(l+2)$ for $-\Delta$. This gives the potential $1+l(l+2)=(l+1)^2$ after division by six. The admissible coefficient is a function on $\mathbb R$, constrained at $0$, continuous from the right there, differentiable at each $t>0$, with integrable quadratic density on $(0,\infty)$ and limit $0$ at infinity. All the statements use just the portion on $[0,\infty)$. No derivative at the seam and no integration identity are supplied as hypotheses. Weak derivatives, Sobolev traces and angular spectral decomposition remain further formalization tasks. [Marked cut, `prop:round-boundary-form`](../../../../../papers/master/manuscript/marked_cut.tex) · [Scientific E45 check](../../../../../papers/master/reviews/E45_ROUND_END_FORM.md)

Write $k=l+1$. The product $2kww'$ is integrable by the pointwise estimate $|2kww'|\le (w')^2+k^2w^2$. The half-line fundamental theorem of calculus for $kw^2$ evaluates its integral as $-kf^2$. Integrating the square gives

\[
6\int_0^\infty\!\big((w')^2+k^2w^2\big)\,dt
=6kf^2+6\int_0^\infty (w'+kw)^2\,dt.
\]

The function $f e^{-kt}$ has the same trace, is admissible by exponential integrability and decay, and makes the square vanish. This proves a least element of the image of the actual energy function and then its `sInf`. [Lean leaf](../../../../SmoothPoincare/IntrinsicEntry/RoundBoundaryForm.lean)

## Checked declarations

The module imports Mathlib `Analysis.Calculus.FDeriv.Measurable` and `Analysis.SpecialFunctions.ImproperIntegrals`. It uses `measurable_deriv`, `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`, `MeasureTheory.integrableOn_exp_mul_Ioi` and `IsLeast.csInf_eq`. Toolchain `leanprover/lean4:v4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. `lake build SmoothPoincare.IntrinsicEntry.RoundBoundaryForm` passed 2799 jobs. The leaf SHA-256 is `83fa04c0407083e04ae5024dc5de17e68d662b261a62d53dd20c92ebe67b1ddd`.

The signature and axiom replay imported only `SmoothPoincare.IntrinsicEntry.RoundBoundaryForm` and checked the following declarations under `SmoothPoincare.IntrinsicEntry`. Its output SHA-256 is `a80bf560b0c7167f32ae10e3e0489c9ed7b77f5e3356fca0e822907a3031be30`. Each theorem uses only `propext`, `Classical.choice` and `Quot.sound`.

| Declaration | Result |
| --- | --- |
| `RoundCylinderModeAdmissible` | Exact endpoint, right continuity, interior differentiability, finite energy and decay |
| `roundCylinderModeEnergy` | Six times the Bochner integral against Lebesgue measure restricted to $(0,\infty)$ |
| `roundCylinderModeExtension` | Explicit real exponential with the supplied degree and trace |
| `roundCylinderModeEnergy_eq` | Integrated square completion for each admissible profile |
| `roundCylinderModeExtension_admissible`, `roundCylinderModeExtension_energy` | Admissibility and value of the explicit profile |
| `roundCylinderMode_isLeast`, `roundCylinderMode_inf_eq` | Least element and infimum of the image of the energy on the admissible set |
| `roundCylinderMode_zero_inf_eq`, `roundCylinderMode_one_inf_eq` | $6f^2$ and $12f^2$. An importing scratch file additionally checked $f=-2$ gives $24$ and $48$, and verified admissibility of that degree-one competitor. |

## Marked exterior source check and next dependency

- The fixed-type manuscript constructs explicit product-marked two-ended exteriors with positive modified form on standard $S^4$. The slightly nonround middle length can grow without losing its sign. The resulting unbounded-energy example is a standard-type control. For the exact round product in the same markings, the conformal caps have vanishing Weyl tensor in both chiralities. This geometric fact and its signed ledger have no declaration in the modal leaf. [Fixed-type manuscript, `thm:round-form` and following example](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex)
- The actual marked identity double of $W^-(0,3)$ is standard, with Isoshima's Figure 37 at $n=1$ and Theorem 3.3. The separately displayed Mazur cork involution also gives a standard sphere for each of its identity and twisted marked doubles. These supply the cited smooth controls. The positive scalar construction for the identity double uses the boundary class of a Sweeney metric and a Bär–Hanke totally geodesic deformation. [Marked exterior example](../../../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/marked_double_exterior.tex) · [Isoshima v2, p. 10](https://arxiv.org/pdf/2403.17356v2#page=10) · [Auckly–Kim–Melvin–Ruberman §1 and Fig. 2](https://msp.org/agt/2017/17-3/agt-v17-n3-p11-p.pdf#page=5) · [Primary curvature dependencies](../../../../../references/SOURCE_NOTES_MASTER_CHARGED_FLOW_20261125.md#positive-scalar-curvature-with-a-marked-boundary-class)
- Shi–Wang–Wei Theorem 1.1 supplies PSC extensions with the exact eta-zero boundary metric. The associated all-traces Robin positivity and the full half-energy budget remain open. The positive conclusion for an isometric gluing is conditional on supplying the filling in the marked class. The scoped source check found no qualifying marked exterior on a further smooth type. [Prescribed class](../../../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/boundary_class.tex) · [Isometric family and complete budgets](../../../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/eta_zero_filling.tex) · [Shi–Wang–Wei v3, Theorem 1.1](https://arxiv.org/html/2007.06756v3#Thmtheorem1)

The next full round-form packet needs the half-line Sobolev extension of this calculation, the complete angular basis and trace pairing, the positive zero-trace remainder, the marked compactification and zero capacity of the added points, and the exact signed exterior ledger. The eta-zero candidate for a separate filling packet needs a named exact-boundary metric with positivity on all traces and a completed energy budget before E07 can certify a witness.
