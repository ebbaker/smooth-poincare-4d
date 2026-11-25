# SP4-FORM-CUT-E01 · Strict exterior energy margin

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The dispatch selected GPT-6.2 Sol at ultra. Independent serving telemetry is unavailable.

This fixed execution packet proves the real inequality in the [route plan](../../research-plan/PLAN.md) using the estimate under “One choice of the cut and all margins” in [NECK-E02/E05](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md). The packet was assigned at checkout `7db310a2a9219c537b440d7c2fb39e602a32b729`. At that checkout the plan was last changed at `cf03e8f09359cac317499f6928edb09e4f80c280`, with SHA-256 `159ef2bf7d5701a9dfc15e74eba4f510105d597df48e4dc8fa5397555a23c7b1`. The source note was last changed at `6879850c01a741618210815be0cc8041abe45a94`, with SHA-256 `61d01e1cf53be476e2f7379449c70da40884444cec435f44f5a9246d1647f26f`, agreeing with the [route baseline](../../research-overview/OVERVIEW.md#inputs-at-setup).

## Result

[`FirstOrderTwistor.exteriorEnergyLtThreshold`](../../../../FirstOrderTwistor/CutMargin.lean) uses the plan's exact type and `Mathlib.Basic.Real.Basic` import. Its physical instantiation takes $T=4\pi^2$, $e$ to be the limiting source energy, $x=e_X$ to be the removed component energy, $v$ to be the capped exterior energy and $\eta$ to be the combined tail, transfer and splice error. In NECK-E02/E05 the three contributions are bounded together by $4\varepsilon<\delta$. The proof uses

$$
v\le e-x+\eta < e-T+\eta \le (2T-\delta)-T+\delta=T .
$$

Lean checks three boundary cases in the same module. The estimate remains strict with $\eta=\delta$ when $T<x$. At $x=T$ and $\eta=\delta$, taking $e=2T-\delta$ and $v=T$ attains equality in the exterior bound. If $T\le x$ and $\eta<\delta$, the strict error margin alone yields $v<T$. The last case is available to the cut selection as `exteriorEnergyLtThresholdOfStrictError`.

## Verification

From `formalization/`, `lake build FirstOrderTwistor.CutMargin` passed with 785 jobs. The installed Lean was `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`. The installed Mathlib HEAD was `c55e6e786f49471c72fbddbec5415808896aec1e`.

~~~sh
lake env lean --stdin <<'LEAN'
import FirstOrderTwistor.CutMargin
#check FirstOrderTwistor.exteriorEnergyLtThreshold
example : ∀ (T δ e x η v : ℝ),
    0 < T → 0 < δ → e ≤ 2 * T - δ → T < x →
    0 ≤ η → η ≤ δ → v ≤ e - x + η → v < T :=
  FirstOrderTwistor.exteriorEnergyLtThreshold
#print axioms FirstOrderTwistor.exteriorEnergyLtThreshold
#check FirstOrderTwistor.exteriorEnergyLtThresholdOfStrictError
#print axioms FirstOrderTwistor.exteriorEnergyLtThresholdOfStrictError
LEAN
~~~

The signature check passed. Lean reported precisely `propext`, `Classical.choice` and `Quot.sound` for both named declarations. The program integrator owns the public import, the full package build, the route register and the blueprint marks. The geometric use in E28 needs the error budget on the supplied physical metric from E26 and the relevant comparison and component estimates.
