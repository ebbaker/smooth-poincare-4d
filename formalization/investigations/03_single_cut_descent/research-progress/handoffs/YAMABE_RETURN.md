# SP4-FORM-FOT-E28y · Yamabe constant under the marked pullback

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The dispatch selected GPT-6.2 Sol at ultra. Independent serving telemetry is unavailable.

This fixed execution packet supplies the Yamabe part of transport to the original smooth type in [NECK-E02/E05](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md#variational-consequence). The route opened at `7db310a2a9219c537b440d7c2fb39e602a32b729`. The source note at that revision has SHA-256 `61d01e1cf53be476e2f7379449c70da40884444cec435f44f5a9246d1647f26f`. The installed dependency pins are Lean `4.35.0-rc3` (`470d5ce1400764999581fd26d5d72b00d990b0f4`), Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. [Assignment and acceptance](ACTIVATION_20261125.md) · [Lake manifest](../../../../lake-manifest.json)

## Statement and proof

For a smooth Riemannian metric $g$ on a compact, nonempty, Hausdorff smooth four-manifold with a boundaryless model, [`classYamabeFour`](../../../../FirstOrderTwistor/YamabeTransport.lean) uses

$$
Y([g])=\inf_{u\in C^{\infty}(M,\mathbb R)}
\frac{\displaystyle\int_M R_{\exp(2u)g}\,dV_{\exp(2u)g}}
{\displaystyle\sqrt{\operatorname{Vol}(M,\exp(2u)g)}}.
$$

The volume exponent is $1/2$ in dimension four. Each smooth positive conformal multiplier has a smooth logarithm, so the parameterization covers the conformal class. The packet uses the metric form of the Yamabe functional and its class infimum. [Lee and Parker, §1, (1.3) and (1.5)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=2)

For a smooth diffeomorphism $\Phi:M\to N$, composition of the factors with $\Phi$ gives $\Phi^*(e^{2u}g)=e^{2(u\circ\Phi)}\Phi^*g$. Pointwise scalar naturality and the Riemannian volume change of variables preserve the normalized scalar value. Composition with $\Phi^{-1}$ gives the inverse correspondence of factors. Equality of the two sets of values yields equality of their infima. The same-type composition can apply this equality to a supplied positive Yamabe class. The derivative-based Yamabe quotient, lower-bound estimates and minimizer existence lie outside this transport proof.

## Verification

`lake build FirstOrderTwistor.YamabeTransport` succeeded from `formalization/` with 3,987 jobs. The theorem `classYamabeFour_pullback hDimM hDimN g Φ` states `classYamabeFour hDimM (Diffeomorph.pullbackMetricCross g Φ) = classYamabeFour hDimN g`, where the dimension proofs both give real finrank four. The proof uses `metricScalarAt_pullback_scaleMetricCross` at scale one and `riemannianVolumeMeasure_pullback_cross` for the actual Riemannian volume.

~~~sh
lake env lean --stdin <<'LEAN'
import FirstOrderTwistor.YamabeTransport
#check FirstOrderTwistor.classYamabeFour
#check FirstOrderTwistor.classYamabeFour_pullback
#print axioms FirstOrderTwistor.classYamabeFour
#print axioms FirstOrderTwistor.classYamabeFour_pullback
#print axioms DifferentialGeometry.Geometry.Curvature.metricScalarAt_pullback_scaleMetricCross
#print axioms DifferentialGeometry.Integral.Measure.riemannianVolumeMeasure_pullback_cross
LEAN
~~~

Lean reported only `propext`, `Classical.choice` and `Quot.sound` for all four declarations. The route integrator owns the public import and default build checks.
