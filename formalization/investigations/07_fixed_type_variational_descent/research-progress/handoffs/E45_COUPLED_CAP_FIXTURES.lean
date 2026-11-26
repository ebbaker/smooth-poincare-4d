import SmoothPoincare.Variational.IsolatedCoupledRepair
import SmoothPoincare.Variational.MarkedCoreTestTransplant
import Mathlib.Geometry.Manifold.PartitionOfUnity

open DifferentialGeometry Set
open scoped ContDiff Manifold Topology
namespace SmoothPoincare

open private firstCoupledWall from SmoothPoincare.Variational.IsolatedCoupledRepair

-- Simultaneous isolated hits, with both strictly below the wall before the event.
example :
    ∃ t ∈ Ioc (0 : ℝ) 1, t = 1 / 2 ∧ 2 * t = 1 ∧
      ∀ s ∈ Ico (0 : ℝ) t, max (2 * s) (2 * s) < 1 := by
  let e (t : ℝ) := max (2 * t) (2 * t)
  have hc : ContinuousOn e (Icc (0 : ℝ) 1) := by
    have h : Continuous (fun t : ℝ => 2 * t) := by fun_prop
    simpa only [e, max_self] using h.continuousOn
  obtain ⟨t, ht, hit, earlier⟩ := firstCoupledWall hc (by norm_num [e])
    (show (1 : ℝ) ∈ Icc 0 1 by norm_num) (by norm_num [e] : (1 : ℝ) ≤ e 1)
  have h : 2 * t = 1 := by simpa only [e, max_self] using hit
  exact ⟨t, ht, by linarith, h, earlier⟩

-- An exact equality at the joined parameter endpoint still counts as a hit.
example :
    ∃ t ∈ Ioc (0 : ℝ) 1, t = 1 ∧ ∀ s ∈ Ico (0 : ℝ) t, s < 1 := by
  obtain ⟨t, ht, hit, earlier⟩ :=
    firstCoupledWall (energy := id) continuous_id.continuousOn
      (show (0 : ℝ) < 1 by norm_num)
      (show (1 : ℝ) ∈ Icc 0 1 by norm_num) (by rfl : (1 : ℝ) ≤ id 1)
  exact ⟨t, ht, hit, earlier⟩

-- A nonzero cut-supported test under a constant conformal change on a proper patch.
example {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
    (dim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M)
    {U O : Set M} (hU : IsOpen U) (hO : IsOpen O) (hOU : closure O ⊆ U)
    {x : M} (hx : x ∈ O) :
    ∃ k f : C^∞⟮I, M; ℝ⟯, k x = 1 ∧ f x = 2 ∧ EqOn f 0 Uᶜ ∧
      capFactorScalar g f = capFactorScalar (conformalMetric g (.const (Real.log 2))) k ∧
      capFactorVolume g f = capFactorVolume (conformalMetric g (.const (Real.log 2))) k := by
  obtain ⟨k₀, hSmooth, hRange, hSupport, hOne⟩ :=
    exists_contMDiff_support_eq_eq_one_iff (I := I) (n := (⊤ : ℕ∞)) hO
      (isClosed_singleton : IsClosed ({x} : Set M)) (by simpa using hx)
  let k : C^∞⟮I, M; ℝ⟯ := ⟨k₀, hSmooth⟩
  let mark : PartialDiffeomorph I I M M ∞ :=
    { toPartialEquiv := PartialEquiv.ofSet U
      open_source := hU
      open_target := hU
      contMDiffOn_toFun := contMDiff_id.contMDiffOn
      contMDiffOn_invFun := contMDiff_id.contMDiffOn }
  have hIdFun : (mark : M → M) = id := rfl
  have hIso : ∀ y ∈ mark.source, ∀ v w : TangentSpace I y,
      g.inner y v w = g.inner (mark y) (mfderiv I I mark y v) (mfderiv I I mark y w) := by
    intro y hy v w
    rw [hIdFun, mfderiv_id]
    rfl
  have hs : tsupport k ⊆ mark.target := by
    change closure (Function.support k₀) ⊆ U
    rwa [hSupport]
  obtain ⟨f, hF, hEq, hZero, hSupp, hS, hV⟩ :=
    exists_conformalMarkedCoreTestTransplant dim g g mark hIso (.const (Real.log 2)) k
      (fun y => (hRange (mem_range_self y)).1) hs
  have hK : k x = 1 := (hOne x).mp (by simp)
  have hX : x ∈ mark.source := hOU (subset_closure hx)
  refine ⟨k, f, hK, ?_, hZero, hS, hV⟩
  rw [show f x = Real.exp (Real.log 2) * k x from hEq hX, hK,
    Real.exp_log (by norm_num : (0 : ℝ) < 2), mul_one]

end SmoothPoincare
