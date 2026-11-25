# FOT-E28t · Chiral frame and curvature pullback

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. This finite execution packet verifies covariance of the curvature-defined chiral block under the marked diffeomorphism. [Lean module](../../../../FirstOrderTwistor/ChiralFramePullback.lean) · [Geometric chiral block](../../../../FirstOrderTwistor/GeometricChiralBlock.lean) · [Route register](../REGISTER.md)

Let $\Phi\colon M\to N$ be a smooth diffeomorphism preserving the supplied tangent orientations in dimension four. Let $g$ be the smooth Riemannian target metric. At $x\in M$, map the target basis at $\Phi(x)$ by $(d\Phi_x)^{-1}$. The defining inner product of $\Phi^*g$ makes this basis orthonormal. The orientation transported by $d\Phi_x$ agrees with the target orientation, so the inverse-mapped basis has the specified source orientation. The construction is pointwise and uses only a basis in each fiber.

The pinned DifferentialGeometry declaration `metricRm04Standard_pullbackCross` sends all four inputs of the lowered Levi–Civita Riemann tensor by $d\Phi_x$. It applies across different model spaces to the actual metric pullback. On the paired vectors each transformed slot recovers the corresponding target vector. The curvature operator arrays agree with the same last-two-slot convention on each side. Their self-dual compressions and trace-free parts therefore agree, giving equality of the curvature-defined positive block in the paired frames. [Pinned DifferentialGeometry naturality proof](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Curvature/Naturality/Pullback/Cross.lean#L461) · [SEC chiral energy convention](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L144)

| Declaration in `FirstOrderTwistor` | Result |
| --- | --- |
| `pullbackOrientedOrthonormalFrameAt g Φ hOrientation x frame` | Oriented orthonormal frame at $x$ for the actual pullback metric. |
| `mfderiv_pullbackOrientedOrthonormalFrameAt_basis g Φ hOrientation x frame i` | Applies $d\Phi_x$ to the source basis vector and recovers its target counterpart. |
| `pullbackOrientedOrthonormalFrames g Φ hOrientation frames` | Dependent family of these frames for a given pointwise target family. |
| `metricCurvatureFrameTensor_pullback g Φ hOrientation x frame` | Equality of the complete curvature operator arrays. |
| `geometricChiralBlock_pullback g Φ hOrientation x frame` | Equality of the positive chiral coefficient matrices. |
| `geometricChiralBlockField_pullback g Φ hOrientation frames` | For paired families, the source coefficient function equals the target function composed with $\Phi$. |

The frame declarations require a Hausdorff source. The curvature equalities also require a Hausdorff target. Both models are finite dimensional and both manifolds are smooth. The instance requirements of the naturality theorem are discharged from the corresponding model hypotheses. The paired-family equality lets a change-of-variables argument take the identity positive-block transition. The present packet concerns pointwise covariance. The physical energy integral uses the actual Riemannian volume pullback and the integrability premises of its application.

## Verification

From `formalization/`, `lake build FirstOrderTwistor.ChiralFramePullback` passed with 3,839 jobs. The targeted import checked all six signatures and audited their axioms together with the imported Riemann naturality theorem. Lean reported only `propext`, `Classical.choice` and `Quot.sound` for each. The source pin is DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. Its `Geometry/Curvature/Naturality/Pullback/Cross.lean` SHA-256 is `38c24bb4c77617742fc76dfc3f2cba226ddb5831fd72a7d382a2f8ef7afd2d94`. [Route baseline](../../research-overview/OVERVIEW.md#inputs-at-setup)
