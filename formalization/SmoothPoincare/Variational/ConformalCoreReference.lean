import SmoothPoincare.Variational.MatchedCurvedDisk
import DifferentialGeometry.Geometry.Curvature.ConformalScalar
import DifferentialGeometry.Geometry.Curvature.Coordinates.RiemannTensorBridge
import DifferentialGeometry.Geometry.Operator.Gradient.Regularity

/-! # Positive curved conformal references on a native marked inner disk -/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Geometry.Metric
open FirstOrderTwistor Filter Function Manifold Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

/-- Translating all smooth logarithmic factors leaves the class Yamabe
infimum exactly unchanged. -/
theorem classYamabeFour_conformalCore (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (hDim : Module.finrank ℝ E₄ = 4) :
    classYamabeFour hDim (conformalMetric g u) = classYamabeFour hDim g := by
  have hShift : Function.Surjective (fun v : C^∞⟮I, M; ℝ⟯ => u + v) := by
    intro v
    refine ⟨v - u, ?_⟩
    change u + (v - u) = v
    rw [add_comm u, sub_add_cancel]
  unfold classYamabeFour
  simp only [← conformalMetric_add]
  conv_rhs => rw [← hShift.range_comp]
  rfl

/-- A bump on the original selected chart, with support strictly inside
the inner disk and with a nonzero differential at an interior point. -/
theorem exists_selectedConformalCoreBump
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (hn : 0 < n)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    ∃ (u : C^∞⟮I, M; ℝ⟯) (x : M),
      let w : ℝ := 1 / ((n : ℝ) + 1)
      u (F 0) = 1 ∧
      tsupport (u : M → ℝ) ⊆ F '' Metric.ball (0 : E₄) (1 - w) ∧
      x ∈ F '' Metric.ball (0 : E₄) (1 - w) ∧
      mfderiv I 𝓘(ℝ) (u : M → ℝ) x ≠ 0 := by
  let w : ℝ := 1 / ((n : ℝ) + 1)
  have hw : 0 < w := by dsimp [w]; positivity
  have hw' : w < 1 := by
    dsimp [w]
    exact (div_lt_one (by positivity)).2 (by exact_mod_cast Nat.succ_lt_succ hn)
  let r : ℝ := (1 - w) / 2
  have hr : 0 < r := by dsimp [r]; linarith
  have hr' : r < 1 - w := by dsimp [r]; linarith
  let U : TopologicalSpace.Opens E₄ := ⟨Metric.ball 0 r, Metric.isOpen_ball⟩
  let K := F '' Metric.closedBall (0 : E₄) r
  have hSource : Metric.closedBall (0 : E₄) r ⊆ F.source :=
    (Metric.closedBall_subset_closedBall (by change r ≤ 1 + w; linarith)).trans hBuffer
  have hU : (U : Set E₄) ⊆ F.source := Metric.ball_subset_closedBall.trans hSource
  have hKClosed : IsClosed K :=
    ((isCompact_closedBall _ _).image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hSource)).isClosed
  have hKInner : K ⊆ F '' Metric.ball (0 : E₄) (1 - w) := by
    apply image_mono
    intro z hz
    rw [Metric.mem_closedBall, dist_zero_right] at hz
    rw [Metric.mem_ball, dist_zero_right]
    linarith
  have hSingleton : ({F 0} : Set M) ⊆ F '' (U : Set E₄) :=
    singleton_subset_iff.mpr ⟨0, Metric.mem_ball_self hr, rfl⟩
  obtain ⟨f, hf, _, hSupp, hOne⟩ := exists_contMDiff_support_eq_eq_one_iff I (n := ⊤)
    (image_opens_isOpen F hU) isClosed_singleton hSingleton
  let u : C^∞⟮I, M; ℝ⟯ := ⟨f, hf⟩
  have hZeroPoint : u (F 0) = 1 := (hOne (F 0)).1 (mem_singleton _)
  have hSuppK : tsupport (u : M → ℝ) ⊆ K := by
    change closure (support f) ⊆ K
    rw [hSupp]
    exact closure_minimal (image_mono Metric.ball_subset_closedBall) hKClosed
  let e : E₄ := EuclideanSpace.single 0 (1 : ℝ)
  have heNorm : ‖e‖ = 1 := by simp [e]
  have heSrc : e ∈ F.source := hBuffer (by
    rw [Metric.mem_closedBall, dist_zero_right, heNorm]
    linarith)
  have heOut : F e ∉ K := by
    rintro ⟨z, hz, he⟩
    have heq : z = e := F.injOn (hSource hz) heSrc he
    rw [heq, Metric.mem_closedBall, dist_zero_right, heNorm] at hz
    linarith
  have heZero : u (F e) = 0 :=
    notMem_support.mp (fun h => heOut (hSuppK (subset_closure h)))
  have hExists : ∃ x : M, mfderiv I 𝓘(ℝ) (u : M → ℝ) x ≠ 0 := by
    by_contra! h
    have hLocal := DifferentialGeometry.isLocallyConstant_of_mfderiv_eq_zero
      (I := I) (u.contMDiff.mdifferentiable (by simp)) h
    have hEq := hLocal.apply_eq_of_preconnectedSpace (F 0) (F e)
    rw [hZeroPoint, heZero] at hEq
    exact one_ne_zero hEq
  obtain ⟨x, hx⟩ := hExists
  have hxK : x ∈ K := by
    by_contra h
    have hEventual : (u : M → ℝ) =ᶠ[𝓝 x] fun _ => 0 := by
      filter_upwards [hKClosed.isOpen_compl.mem_nhds h] with y hy
      exact notMem_support.mp (fun hsy => hy (hSuppK (subset_closure hsy)))
    apply hx
    rw [hEventual.mfderiv_eq, mfderiv_const]
    simp
  exact ⟨u, x, hZeroPoint, hSuppK.trans hKInner, hKInner hxK, hx⟩

omit [CompactSpace M] [ConnectedSpace M] in
/-- The exact scalar curvature along the conformal core family, with all
derivatives taken in the incoming metric. -/
theorem conformalCore_scalar_quadratic (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (x : M) (t : ℝ) :
    metricScalarAt (conformalMetric g (t • u)) x = Real.exp (-(2 * (t * u x))) *
      (metricScalarAt g x - 6 * t * laplacian (LeviCivita g) g u x -
        6 * t ^ 2 * g.inner x (gradientFun g u x) (gradientFun g u x)) := by
  have hF : ContMDiff I 𝓘(ℝ) ∞ (t • (u : M → ℝ)) := by
    change ContMDiff I 𝓘(ℝ) ∞ (fun y : M => t * u y)
    exact contMDiff_const.mul u.contMDiff
  have hEq : conformalMetric g (t • u) = conformalMetricOfContDiff g (t • (u : M → ℝ)) hF := by
    apply SmoothRiemannianMetric.ext_inner
    intro y v w
    rfl
  have hMd (y : M) : MDifferentiableAt I 𝓘(ℝ) (u : M → ℝ) y :=
    u.contMDiff.mdifferentiableAt (by simp)
  have hGrad := (gradientFun_smooth g u.contMDiff).mdifferentiableAt (by simp) (x := x)
  have hDim : Module.finrank ℝ E₄ = 4 := by simp
  rw [hEq, metricScalarAt_conformalMetric, hDim, laplacian_const_smul _ _ t hMd hGrad]
  change Real.exp (-(2 * (t * u x))) *
    (metricScalarAt g x - 2 * (4 - 1) * (t * laplacian (LeviCivita g) g u x) -
      (4 - 1) * (4 - 2) *
        g.inner x (gradientFun g (t • (u : M → ℝ)) x) (gradientFun g (t • (u : M → ℝ)) x)) = _
  rw [gradientFun_const_smul g t (hMd x)]
  simp only [map_smul, smul_apply, smul_eq_mul]
  ring

omit [CompactSpace M] [ConnectedSpace M] in
/-- At a point where the factor has nonzero differential, some arbitrarily
small nonzero conformal scale has nonzero scalar curvature at that point. -/
theorem exists_nonzeroScalar_conformalCore (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (x : M) (hx : mfderiv I 𝓘(ℝ) (u : M → ℝ) x ≠ 0)
    {η : ℝ} (hη : 0 < η) :
    ∃ t : ℝ, t ≠ 0 ∧ |t| ≤ η ∧ metricScalarAt (conformalMetric g (t • u)) x ≠ 0 := by
  let q := g.inner x (gradientFun g u x) (gradientFun g u x)
  have hGrad : gradientFun g u x ≠ 0 := by
    intro hz
    apply hx
    ext v
    have hp := inner_gradientFun g (u : M → ℝ) x v
    rw [hz, map_zero, zero_apply, mvfderiv_real_eq_mfderiv] at hp
    exact hp.symm
  have hq : 0 < q := g.pos x (gradientFun g u x) hGrad
  let a : ℝ := η / 2
  have ha : 0 < a := by dsimp [a]; positivity
  let P := fun t : ℝ => metricScalarAt g x - 6 * t * laplacian (LeviCivita g) g u x - 6 * t ^ 2 * q
  have hNonzero : ∃ t : ℝ, (t = a ∨ t = -a ∨ t = 2 * a) ∧ P t ≠ 0 := by
    by_contra! hz
    have h1 := hz a (Or.inl rfl)
    have h2 := hz (-a) (Or.inr (Or.inl rfl))
    have h3 := hz (2 * a) (Or.inr (Or.inr rfl))
    have hs : 0 < a ^ 2 * q := mul_pos (by positivity) hq
    dsimp [P] at h1 h2 h3
    nlinarith only [h1, h2, h3, hs]
  obtain ⟨t, ht, hp⟩ := hNonzero
  have hneq : t ≠ 0 := by
    rcases ht with rfl | rfl | rfl
    · exact ha.ne'
    · exact neg_ne_zero.mpr ha.ne'
    · exact mul_ne_zero (by norm_num) ha.ne'
  have hAbs : |t| ≤ η := by
    rcases ht with rfl | rfl | rfl
    · rw [abs_of_pos ha]
      dsimp [a]
      linarith
    · rw [abs_neg, abs_of_pos ha]
      dsimp [a]
      linarith
    · rw [abs_of_nonneg (show 0 ≤ 2 * a by positivity)]
      dsimp [a]
      linarith
  refine ⟨t, hneq, hAbs, ?_⟩
  rw [conformalCore_scalar_quadratic]
  exact mul_ne_zero (Real.exp_pos _).ne' hp

/-- An arbitrarily small nonzero conformal change of a positive source gives
an actual curved endpoint in the original marked disk. The entire real
family stays in the original positive Yamabe class and fixes metric germs
on the full trim and complete closed exterior. -/
theorem exists_selectedPositiveConformalCoreReference
    (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (hn : 0 < n)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (hDim : Module.finrank ℝ E₄ = 4) (hPos : 0 < classYamabeFour hDim g)
    {η : ℝ} (hη : 0 < η) :
    ∃ (u : C^∞⟮I, M; ℝ⟯) (x : M) (t : ℝ),
      let w : ℝ := 1 / ((n : ℝ) + 1)
      let B := selectedChartDisk F
      let C := selectedDiskTrim F n
      let path := fun s : ℝ => conformalMetric g (s • u)
      path 0 = g ∧ t ≠ 0 ∧ |t| ≤ η ∧ path t ≠ g ∧
      u (F 0) = 1 ∧ tsupport (u : M → ℝ) ⊆ F '' Metric.ball (0 : E₄) (1 - w) ∧
      x ∈ F '' Metric.ball (0 : E₄) (1 - w) ∧
      metricScalarAt (path t) x ≠ 0 ∧ metricRm04At (path t) x ≠ 0 ∧
      (∀ s, 0 < classYamabeFour hDim (path s)) ∧
      ∀ y ∈ C ∪ (interior B)ᶜ, ∀ᶠ z in 𝓝 y, ∀ v v' : TangentSpace I z,
        ∀ s, (path s).inner z v v' = g.inner z v v' := by
  obtain ⟨u, x, hCenter, hSupport, hx, hDiff⟩ :=
    exists_selectedConformalCoreBump F n hn hBuffer
  obtain ⟨t, ht, htBound, hScalar⟩ := exists_nonzeroScalar_conformalCore g u x hDiff hη
  have hRm : metricRm04At (conformalMetric g (t • u)) x ≠ 0 := fun hFlat =>
    hScalar (metricScalarAt_eq_zero_of_metricRm04At_eq_zero _ _ hFlat)
  have hNe : conformalMetric g (t • u) ≠ g := by
    intro hEq
    let e : TangentSpace I (F 0) := EuclideanSpace.single 0 (1 : ℝ)
    have he : e ≠ 0 := by
      intro h
      have hn : ‖(EuclideanSpace.single 0 (1 : ℝ) : E₄)‖ = 1 := by simp
      rw [show (EuclideanSpace.single 0 (1 : ℝ) : E₄) = 0 from h, norm_zero] at hn
      exact zero_ne_one hn
    have hp := g.pos (F 0) e he
    have hInner := congrArg (fun m : SmoothRiemannianMetric I M => m.inner (F 0) e e) hEq
    change Real.exp (2 * (t * u (F 0))) * g.inner (F 0) e e = _ at hInner
    rw [hCenter, mul_one] at hInner
    have hExp : Real.exp (2 * t) = 1 := by
      apply mul_right_cancel₀ hp.ne'
      simpa using hInner
    have hz : 2 * t = 0 := Real.exp_injective (hExp.trans Real.exp_zero.symm)
    exact ht (by linarith only [hz])
  refine ⟨u, x, t, by simp, ht, htBound, hNe, hCenter, hSupport, hx, hScalar, hRm, ?_, ?_⟩
  · intro s
    simpa only [classYamabeFour_conformalCore] using hPos
  · let w : ℝ := 1 / ((n : ℝ) + 1)
    have hw : 0 < w := by dsimp [w]; positivity
    let A := F '' Metric.closedBall (0 : E₄) (1 - w)
    have hSuppA : tsupport (u : M → ℝ) ⊆ A := hSupport.trans (image_mono Metric.ball_subset_closedBall)
    have hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source :=
      (Metric.closedBall_subset_closedBall (by change 1 ≤ 1 + w; linarith)).trans hBuffer
    have hAInterior : A ⊆ interior (selectedChartDisk F) := by
      rw [interior_selectedChartDisk F hDisk]
      apply image_mono
      intro z hz
      rw [Metric.mem_closedBall, dist_zero_right] at hz
      rw [Metric.mem_ball, dist_zero_right]
      linarith
    have hDisjoint := (selectedReference_innerDisk_partition F n hBuffer).2.2.1
    intro y hy
    have hMissing : y ∉ tsupport (u : M → ℝ) := by
      intro h
      rcases hy with hC | hExt
      · exact disjoint_left.mp hDisjoint (hSuppA h) hC
      · exact hExt (hAInterior (hSuppA h))
    filter_upwards [(isClosed_tsupport (u : M → ℝ)).isOpen_compl.mem_nhds hMissing] with z hz
    have hu : u z = 0 := notMem_support.mp (fun hs => hz (subset_closure hs))
    intro v v' s
    change Real.exp (2 * (s * u z)) * g.inner z v v' = g.inner z v v'
    simp [hu]

end

end SmoothPoincare
