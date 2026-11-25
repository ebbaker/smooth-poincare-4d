import SmoothPoincare.Immersions.PrincipalPatch
import SmoothPoincare.Immersions.NormalFrameReindex
import SmoothPoincare.Immersions.NormalChartTransition
import SmoothPoincare.Immersions.FixedChartFrames
import SmoothPoincare.Heights.GaussDifferential

/-! # No open middle-signature equality locus on a Euclidean hypersurface -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Tensor.Coordinates FirstOrderTwistor Filter Set Manifold
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M} {o : ManifoldOrientation I M 4}
  {F : IsometricHypersurface g}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

omit [T2Space M] in
private theorem balancedForm_in_fixed_chart (p q : M) (hq : q ∈ (extChartAt I p).source)
    (Q : PrincipalFrameAt F o q) (a : ℝ) (hk : Q.curvature = ![-a,-a,a,a])
    (w : V₅) (hUnit : inner ℝ w w = 1)
    (hw : ∀ v, inner ℝ w (fderiv ℝ (F.localMap p) (extChartAt I p q) v) = 0)
    (hB : ∀ X Y V, inner ℝ (hypersurfaceChartSecondForm F p (extChartAt I p q) X Y)
        (fderiv ℝ (F.localMap p) (extChartAt I p q) V) = 0) :
    let y := extChartAt I p q
    (∀ X Y, ∃ c : ℝ, hypersurfaceChartSecondForm F p y X Y = c • w) ∧
    ∃ b : Module.Basis (Fin 4) ℝ E,
      (∀ i j, chartMetricBilin g p y (b i) (b j) = if i = j then 1 else 0) ∧
      ∀ i j, chartNormalForm (metricChartConnectionForm g p) (F.localMap p) (fun _ => w) y
        (b i) (b j) = if i = j then saturatedPrincipalSign i * a else 0 := by
  intro y
  obtain ⟨b, _, _, hL, ho, ht⟩ := exists_fixedChartPrincipalBasis p hq Q
  let t (i : Fin 4) : V₅ := mfderiv I 𝓘(ℝ,V₅) F.map q (Q.frame.basis i)
  have hot : Orthonormal ℝ t := orthonormal_iff_ite.mpr fun i j =>
    (F.isometric q _ _).trans (Q.frame.orthonormal i j)
  have hwT (i : Fin 4) : inner ℝ w (t i) = 0 := (congrArg (inner ℝ w) (ht i).symm).trans (hw _)
  have hsign := unitNormal_eq_or_eq_neg_of_collinear Q.unit hUnit
    ⟨_, ambientOrthogonal_eq_inner_smul_normal t Q.normal w hot Q.unit (fun i => Q.perpendicular _) hwT⟩
  obtain ⟨ε, hε, heq⟩ : ∃ ε : ℝ, (ε = 1 ∨ ε = -1) ∧ w = ε • Q.normal := by
    rcases hsign with h | h
    · exact ⟨1, Or.inl rfl, by simpa using h⟩
    · exact ⟨-1, Or.inr rfl, by simpa using h⟩
  constructor
  · intro X Y
    refine ⟨_, ambientOrthogonal_eq_inner_smul_normal t w _ hot hUnit hwT (fun i => ?_)⟩
    exact (congrArg (inner ℝ _) (ht i).symm).trans (hB X Y _)
  · refine exists_reindexedBalancedNormalFrame b (fun u v => chartMetricBilin g p y u v)
      (chartNormalForm (metricChartConnectionForm g p) (F.localMap p) (fun _ => w) y) (a := a) hε ho ?_
    intro i j
    have hNcenter (v : E) : inner ℝ (fderiv ℝ (F.localMap q) (extChartAt I q q) v) w = 0 := by
      rw [heq, real_inner_smul_right]
      have hd : fderiv ℝ (F.localMap q) (extChartAt I q q) v =
          mfderiv I 𝓘(ℝ,V₅) F.map q v :=
        (tangentLinearMapToModel_mfderiv_eq_fderiv_writtenInExtChartAt
          (F.smooth.mdifferentiableAt (by simp)) v).symm
      have hperp : inner ℝ (show V₅ from mfderiv I 𝓘(ℝ,V₅) F.map q v) Q.normal = 0 :=
        (real_inner_comm _ _).trans (Q.perpendicular v)
      rw [hd, hperp, mul_zero]
    have h := chartNormalForm_eq_secondFundamentalFormAt F p q hq w hNcenter (b i) (b j)
    dsimp only at h
    change _ = inner ℝ (show V₅ from secondFundamentalFormAmbientAt g euclideanMetric F.map q
      (fixedChartFrameTransition (I := I) p q (b i)) (fixedChartFrameTransition (I := I) p q (b j))) w at h
    rw [hL i, hL j] at h
    change _ = inner ℝ (show V₅ from secondFundamentalFormAmbientAt g euclideanMetric F.map q
      (Q.frame.basis i) (Q.frame.basis j)) w at h
    rw [h, Q.principal, heq, real_inner_smul_left, real_inner_smul_right, Q.unit, mul_one]
    have hki : Q.curvature i = saturatedPrincipalSign i * a := by
      rw [hk]
      fin_cases i <;> simp [saturatedPrincipalSign]
    by_cases hij : i = j
    · subst j
      simp only [ite_true, hki, mul_comm]
    · simp [hij]

/-- On an actual smooth Euclidean hypersurface the ordered balanced nonzero
principal spectrum cannot persist on a nonempty open set. The pointwise
oriented principal frames may vary arbitrarily, including their normal signs. -/
theorem noOpenBalancedPrincipalFrames (U : Set M) (hU : IsOpen U) (hne : U.Nonempty)
    (P : ∀ z : U, PrincipalFrameAt F o z.val)
    (hsat : ∀ z, ∃ a : ℝ, 0 < a ∧ (P z).curvature = ![-a,-a,a,a]) : False := by
  classical
  obtain ⟨p, hp⟩ := hne
  let z : U := ⟨p, hp⟩
  choose k hk hspec using hsat
  have hNZ : (P z).curvature 0 ≠ 0 := by rw [hspec z]; simpa using (hk z).ne'
  obtain ⟨n, V, hV, hpV, hchart, hn, hcenter, hnormal⟩ :=
    exists_smoothChartUnitNormal_of_principal (P z) 0 hNZ
  let back := (extChartAt I p).symm
  let z₀ := extChartAt I p p
  have hback0 : back z₀ = p := (extChartAt I p).left_inv (mem_extChartAt_source p)
  have hnearU : ∀ᶠ y in 𝓝 z₀, back y ∈ U :=
    (continuousAt_extChartAt_symm (I := I) p).preimage_mem_nhds
      (by rw [hback0]; exact hU.mem_nhds hp)
  have hnear : ∀ᶠ y in 𝓝 z₀, y ∈ V ∧ back y ∈ U ∧
      ∀ X Y W : E, inner ℝ (hypersurfaceChartSecondForm F p y X Y)
        (fderiv ℝ (F.localMap p) y W) = 0 := by
    filter_upwards [hV.mem_nhds hpV, hnearU, hypersurfaceChartSecondForm_perpendicular F p]
      with y h₁ h₂ h₃ using ⟨h₁,h₂,h₃⟩
  obtain ⟨Ω, hsub, hΩ, hpΩ⟩ := mem_nhds_iff.mp hnear
  let a (y : E) := if h : back y ∈ U then k ⟨back y, h⟩ else 0
  have ha (y : E) (hy : y ∈ Ω) : a y = k ⟨back y, (hsub hy).2.1⟩ := by simp [a, (hsub hy).2.1]
  have hΩV : Ω ⊆ V := fun _ hy => (hsub hy).1
  have hinside (y : E) (hy : y ∈ Ω) : y ∈ (extChartAt I p).target := hchart (hΩV hy)
  have hPlaced (y : E) (hy : y ∈ Ω) :
      (∀ X Y, ∃ c : ℝ, hypersurfaceChartSecondForm F p y X Y = c • n y) ∧
      ∃ b : Module.Basis (Fin 4) ℝ E,
        (∀ i j, chartMetricBilin g p y (b i) (b j) = if i = j then 1 else 0) ∧
        ∀ i j, chartNormalForm (metricChartConnectionForm g p) (F.localMap p) n y (b i) (b j) =
          if i = j then saturatedPrincipalSign i * a y else 0 := by
    let q := back y
    let Q := P ⟨q,(hsub hy).2.1⟩
    have hqy : extChartAt I p q = y := (extChartAt I p).right_inv (hinside y hy)
    have h := balancedForm_in_fixed_chart p q ((extChartAt I p).map_target (hinside y hy))
      Q (a y) (by rw [ha y hy]; exact hspec _) (n y)
      (by rw [real_inner_self_eq_norm_sq, (hnormal y (hΩV hy)).1]; norm_num)
      (by rw [hqy]; exact (hnormal y (hΩV hy)).2)
      (by rw [hqy]; exact (hsub hy).2.2)
    dsimp only at h
    rw [hqy] at h
    exact h
  have hval : a z₀ = k z := by simp [a, hback0, hp, z]
  apply noOpenBalancedPrincipalForm (P z) a n hΩ (hΩV.trans hchart) hpΩ
    ((hn.mono hΩV).of_le (by decide)) hcenter
  · intro y hy
    rw [real_inner_self_eq_norm_sq, (hnormal y (hΩV hy)).1]
    norm_num
  · intro y hy v
    exact (real_inner_comm _ _).trans ((hnormal y (hΩV hy)).2 v)
  · exact fun y hy => (hPlaced y hy).1
  · exact fun y hy => (ha y hy).symm ▸ hk _
  · exact fun y hy => (hPlaced y hy).2
  · change (P z).curvature = ![-a z₀,-a z₀,a z₀,a z₀]
    rw [hval, hspec]

end SmoothPoincare
