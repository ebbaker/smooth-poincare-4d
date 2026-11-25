import DifferentialGeometry.Geometry.Metric.Convergence.Curvature.RiemannTensor
import DifferentialGeometry.Geometry.Curvature.Coordinates.RiemannTensorBridge
import DifferentialGeometry.Geometry.Metric.Convergence.Metric.Evaluation
import FirstOrderTwistor.GeometricChiralBlock

/-!
# Curvature coefficients in convergent tangent frames

Two-jet convergence controls evaluations of the lowered curvature on fixed tangent vectors.
A finite multilinear expansion gives the corresponding convergence in supplied moving frames.
-/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
open DifferentialGeometry.Geometry.Curvature Filter
open scoped BigOperators ContDiff Manifold Topology

namespace FirstOrderTwistor

private theorem tendsto_fourLinear_apply {κ V : Type*} [Fintype κ] [AddCommGroup V] [Module ℝ V]
    (basis : Module.Basis κ ℝ V)
    (T : ℕ → MultilinearMap ℝ (fun _ : Fin 4 => V) ℝ)
    (S : MultilinearMap ℝ (fun _ : Fin 4 => V) ℝ)
    (v : ℕ → Fin 4 → V) (w : Fin 4 → V)
    (hT : ∀ k : Fin 4 → κ,
      Tendsto (fun n => T n (fun a => basis (k a))) atTop (𝓝 (S (fun a => basis (k a)))))
    (hv : ∀ a j, Tendsto (fun n => basis.repr (v n a) j) atTop (𝓝 (basis.repr (w a) j))) :
    Tendsto (fun n => T n (v n)) atTop (𝓝 (S w)) := by
  have expand (A : MultilinearMap ℝ (fun _ : Fin 4 => V) ℝ) (u : Fin 4 → V) :
      A u = ∑ k : Fin 4 → κ,
        (∏ a, basis.repr (u a) (k a)) * A (fun a => basis (k a)) := by
    calc
      A u = A (fun a => ∑ j, basis.repr (u a) j • basis j) :=
        congrArg A (funext fun a => (basis.sum_repr (u a)).symm)
      _ = _ := by rw [A.map_sum]; simp only [A.map_smul_univ, smul_eq_mul]
  have hsum : Tendsto
      (fun n => ∑ k : Fin 4 → κ,
        (∏ a, basis.repr (v n a) (k a)) * T n (fun a => basis (k a))) atTop
      (𝓝 (∑ k : Fin 4 → κ,
        (∏ a, basis.repr (w a) (k a)) * S (fun a => basis (k a)))) := by
    refine tendsto_finsetSum _ fun k _ => ?_
    exact (tendsto_finsetProd _ fun a _ => hv a (k a)).mul (hT k)
  simpa only [← expand] using hsum

section Geometric

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

/-- Fixed-vector curvature convergence and coordinate convergence in the limiting
basis give convergence of the moving frame coefficients at the same point. The
last two slots follow the convention of `metricCurvatureFrameTensor`. -/
theorem tendsto_metricCurvatureFrameTensor_of_fixedCurvature
    {G : ℕ → SmoothRiemannianMetric I M} {g : SmoothRiemannianMetric I M}
    {x : M} {o : ManifoldOrientation I M 4}
    (hFixed : ∀ v w u z : TangentSpace I x,
      Tendsto (fun n => metricRm04StandardAt (G n) x v w u z) atTop
        (𝓝 (metricRm04StandardAt g x v w u z)))
    (frames : ∀ n, OrientedOrthonormalFrameAt (G n) o x)
    (frame : OrientedOrthonormalFrameAt g o x)
    (hframes : ∀ a j, Tendsto (fun n => frame.basis.repr ((frames n).basis a) j) atTop
      (𝓝 (frame.basis.repr (frame.basis a) j)))
    (a b c d : Fin 4) :
    Tendsto (fun n => metricCurvatureFrameTensor (G n) o x (frames n) a b c d) atTop
      (𝓝 (metricCurvatureFrameTensor g o x frame a b c d)) := by
  let T := fun n => (metricRm04At (G n) x).toMultilinearMap
  let S := (metricRm04At g x).toMultilinearMap
  let v := fun n => vec4 ((frames n).basis a) ((frames n).basis b)
    ((frames n).basis d) ((frames n).basis c)
  let w := vec4 (frame.basis a) (frame.basis b) (frame.basis d) (frame.basis c)
  have hT (k : Fin 4 → Fin 4) :
      Tendsto (fun n => T n (fun j => frame.basis (k j))) atTop
        (𝓝 (S (fun j => frame.basis (k j)))) := by
    let u : Fin 4 → TangentSpace I x := fun j => frame.basis (k j)
    have hslots : vec4 (u 0) (u 1) (u 2) (u 3) = u := by
      funext j
      fin_cases j <;> rfl
    change Tendsto (fun n => metricRm04At (G n) x u) atTop (𝓝 (metricRm04At g x u))
    simpa only [metricRm04StandardAt_apply, hslots] using
      hFixed (u 0) (u 1) (u 2) (u 3)
  have hv (p j : Fin 4) : Tendsto (fun n => frame.basis.repr (v n p) j) atTop
      (𝓝 (frame.basis.repr (w p) j)) := by
    fin_cases p
    · exact hframes a j
    · exact hframes b j
    · exact hframes d j
    · exact hframes c j
  exact tendsto_fourLinear_apply frame.basis T S v w hT hv

variable [T2Space M] [I.Boundaryless] [SigmaCompactSpace M]

open DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Geometry.Connection

private theorem metricCP_tendsto_chartRiemannTensor
    {G : ℕ → SmoothRiemannianMetric I M} {g R : SmoothRiemannianMetric I M}
    {K : Set M} (hconv : MetricCPConvergenceOn K 2 G g R) (hK : IsCompact K)
    {x : M} (hx : x ∈ K) (i j k l : Fin (Module.finrank ℝ E)) :
    Tendsto (fun n => chartRiemannTensor (G n) x i j k l (extChartAt I x x)) atTop
      (𝓝 (chartRiemannTensor g x i j k l (extChartAt I x x))) := by
  let B : ℝ := (∑ q ∈ Finset.range 3, metricCovDerivNorm q g R x) + 1
  have hbase (q : ℕ) (hq : q ≤ 2) :
      metricCovDerivNorm q g R x ≤ ∑ q ∈ Finset.range 3, metricCovDerivNorm q g R x :=
    Finset.single_le_sum (f := fun q : ℕ => metricCovDerivNorm q g R x)
      (fun _ _ => Real.sqrt_nonneg _) (Finset.mem_range.mpr (by omega))
  have hChartSet : ({x} : Set M) ⊆ (chartAt H x).source :=
    Set.singleton_subset_iff.mpr (mem_chart_source H x)
  obtain ⟨L, hL, hLower⟩ := metric_lower_on (K := {x}) isCompact_singleton g R
  obtain ⟨C, hC, hEstimate⟩ := exists_abs_chartRiemannTensor_sub_le R x
    isCompact_singleton hChartSet (L / 2) B (by positivity)
  apply Metric.tendsto_atTop.mpr
  intro ε hε
  let d : ℝ := Module.finrank ℝ (TangentSpace I x)
  have hd : 0 ≤ d := Nat.cast_nonneg _
  let δ := min 1 (min (L / (2 * (d + 1))) (ε / (3 * C + 1)))
  have hδ : 0 < δ := by dsimp [δ]; positivity
  have hδOne : δ ≤ 1 := min_le_left _ _
  have hSmall : d * δ ≤ L / 2 := by
    have h := (le_div_iff₀ (by positivity : 0 < 2 * (d + 1))).mp
      ((min_le_right _ _).trans (min_le_left _ _) : δ ≤ L / (2 * (d + 1)))
    nlinarith only [h, hδ]
  have hError : C * (3 * δ) < ε := by
    have h := (le_div_iff₀ (by positivity : 0 < 3 * C + 1)).mp
      ((min_le_right _ _).trans (min_le_right _ _) : δ ≤ ε / (3 * C + 1))
    nlinarith only [h, hδ]
  obtain ⟨N, hN⟩ := hconv δ hδ
  refine ⟨N, fun n hn => ?_⟩
  -- The same jet threshold supplies the chart lower bound and the upper derivative bound.
  have hjet (q : ℕ) (hq : q ≤ 2) : metricDerivNorm q (G n) g R x ≤ δ :=
    (derivNorm_le_sup hK hq (G n) g R hx).trans (hN n hn).le
  have hLowG (y : M) (hy : y ∈ ({x} : Set M)) (u : TangentSpace I y) :
      (L / 2) * R.inner y u u ≤ (G n).inner y u u := by
    have hyx := Set.mem_singleton_iff.mp hy
    subst y
    have hdiff := metricQuadFormDiff_le_metricDerivNorm (G n) g R x u
    have hcoef : d * metricDerivNorm 0 (G n) g R x ≤ L / 2 :=
      (mul_le_mul_of_nonneg_left (hjet 0 (by omega)) hd).trans hSmall
    have hprod := mul_le_mul_of_nonneg_right hcoef (metric_inner_self_nonneg R x u)
    change |(G n).inner x u u - g.inner x u u| ≤
      d * metricDerivNorm 0 (G n) g R x * R.inner x u u at hdiff
    linarith only [(abs_le.mp hdiff).1, hprod, hLower x (Set.mem_singleton x) u]
  have hLowg (y : M) (hy : y ∈ ({x} : Set M)) (u : TangentSpace I y) :
      (L / 2) * R.inner y u u ≤ g.inner y u u :=
    (mul_le_mul_of_nonneg_right (by linarith only [hL]) (metric_inner_self_nonneg R y u)).trans
      (hLower y hy u)
  have hUpperG (y : M) (hy : y ∈ ({x} : Set M)) (q : ℕ) (hq : q ≤ 2) :
      metricCovDerivNorm q (G n) R y ≤ B := by
    have hyx := Set.mem_singleton_iff.mp hy
    subst y
    exact (covNorm_le_add q (G n) g R x).trans
      (add_le_add (hbase q hq) ((hjet q hq).trans hδOne))
  have hUpperg (y : M) (hy : y ∈ ({x} : Set M)) (q : ℕ) (hq : q ≤ 2) :
      metricCovDerivNorm q g R y ≤ B := by
    have hyx := Set.mem_singleton_iff.mp hy
    subst y
    exact (hbase q hq).trans (le_add_of_nonneg_right zero_le_one)
  have hsum : (∑ q ∈ Finset.range 3, metricDerivNorm q (G n) g R x) ≤ 3 * δ := by
    calc
      _ ≤ ∑ _q ∈ Finset.range 3, δ :=
        Finset.sum_le_sum fun q hq => hjet q (by have := Finset.mem_range.mp hq; omega)
      _ = _ := by norm_num
  rw [Real.dist_eq]
  exact (hEstimate (G n) g hLowG hLowg hUpperG hUpperg x (Set.mem_singleton x) i j k l).trans_lt
    ((mul_le_mul_of_nonneg_left hsum hC.le).trans_lt hError)

/-- Two-jet metric convergence gives convergence of the lowered curvature on
fixed tangent vectors. Work in the chart centered at the point. -/
theorem tendsto_metricRm04StandardAt_of_metricCPConvergence
    {G : ℕ → SmoothRiemannianMetric I M} {g R : SmoothRiemannianMetric I M}
    {K : Set M} (hconv : MetricCPConvergenceOn K 2 G g R) (hK : IsCompact K)
    {x : M} (hx : x ∈ K) (v w u z : TangentSpace I x) :
    Tendsto (fun n => metricRm04StandardAt (G n) x v w u z) atTop
      (𝓝 (metricRm04StandardAt g x v w u z)) := by
  let b := centeredChartTangentBasis (I := I) x
  let T := fun n => (metricRm04At (G n) x).toMultilinearMap
  let S := (metricRm04At g x).toMultilinearMap
  let v' := vec4 v w u z
  have hT (q : Fin 4 → Fin (Module.finrank ℝ E)) :
      Tendsto (fun n => T n (fun j => b (q j))) atTop (𝓝 (S (fun j => b (q j)))) := by
    let a : Fin 4 → TangentSpace I x := fun j => b (q j)
    have hslots : vec4 (a 0) (a 1) (a 2) (a 3) = a := by
      funext j
      fin_cases j <;> rfl
    have heq (s : SmoothRiemannianMetric I M) :
        metricRm04At s x a =
          ∑ m, chartRiemannTensor s x (q 2) (q 0) (q 1) m (extChartAt I x x) *
            s.inner x (a 3) (b m) := by
      rw [← hslots, ← metricRm04StandardAt_apply, metricRm04StandardAt_eq_chartRiemannCLM]
      change s.inner x (a 3) (chartRiemannCLM s x (b (q 0)) (b (q 1)) (b (q 2))) = _
      rw [chartRiemannCLM_basis_apply]
      simp only [map_sum, map_smul, smul_eq_mul, hslots, b]
    change Tendsto (fun n => metricRm04At (G n) x a) atTop (𝓝 (metricRm04At g x a))
    simp only [heq]
    exact tendsto_finsetSum _ fun m _ =>
      (metricCP_tendsto_chartRiemannTensor hconv hK hx (q 2) (q 0) (q 1) m).mul
        (hconv.tendsto_inner hK hx (a 3) (b m))
  exact tendsto_fourLinear_apply b T S (fun _ => v') v' hT (fun _ _ => tendsto_const_nhds)

/-- Two-jet metric convergence on a compact set gives moving-frame
curvature coefficient convergence at each supplied point and frame. -/
theorem tendsto_metricCurvatureFrameTensor_of_metricCPConvergence
    {G : ℕ → SmoothRiemannianMetric I M} {g R : SmoothRiemannianMetric I M}
    {K : Set M} (hconv : MetricCPConvergenceOn K 2 G g R) (hK : IsCompact K)
    {x : M} (hx : x ∈ K) {o : ManifoldOrientation I M 4}
    (frames : ∀ n, OrientedOrthonormalFrameAt (G n) o x)
    (frame : OrientedOrthonormalFrameAt g o x)
    (hframes : ∀ a j, Tendsto (fun n => frame.basis.repr ((frames n).basis a) j) atTop
      (𝓝 (frame.basis.repr (frame.basis a) j)))
    (a b c d : Fin 4) :
    Tendsto (fun n => metricCurvatureFrameTensor (G n) o x (frames n) a b c d) atTop
      (𝓝 (metricCurvatureFrameTensor g o x frame a b c d)) :=
  tendsto_metricCurvatureFrameTensor_of_fixedCurvature
    (tendsto_metricRm04StandardAt_of_metricCPConvergence hconv hK hx) frames frame hframes a b c d

end Geometric

end FirstOrderTwistor
