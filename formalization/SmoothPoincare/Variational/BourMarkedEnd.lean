import DifferentialGeometry.Topology.Manifold.ManifoldIsotopyExtension
import DifferentialGeometry.Topology.Manifold.OrientationDiffeomorphTransport
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph.Opens
import DifferentialGeometry.Analysis.SpecialFunctions.JacobiModel.Volume
import Mathlib.MeasureTheory.Constructions.HaarToSphere
import SmoothPoincare.Variational.TransportedDiskCaps

/-! # A marked cap comparison on a common chart of the recognized double -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Topology.Manifold
  Filter Metric Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

section Cap

variable {P D : Type*} [TopologicalSpace P] [ChartedSpace E₄ P] [IsManifold I₄ ∞ P]
  [TopologicalSpace D] [ChartedSpace E₄ D] [IsManifold I₄ ∞ D]
  [T2Space D] [PreconnectedSpace D]

/-- On a recognized double, move the actual parameterized cap into the
specified target cap using an ambient chart containing both buffered images.
Relative orientation in this chart is read at the two centers. The resulting
whole diffeomorphism agrees with the prescribed map and its inverse on open
neighborhoods of the closed caps, and carries the closed exterior onto the
other closed side. -/
theorem bourMarkedExterior_of_commonChart
    (A : P ≃ₘ⟮I₄, I₄⟯ D)
    (oP : ManifoldOrientation I₄ P 4) (oD : ManifoldOrientation I₄ D 4)
    (hA : A.preservesOrientation oP oD)
    (sourceCap : PartialDiffeomorph I₄ I₄ E₄ P ∞)
    (targetCap : PartialDiffeomorph I₄ I₄ E₄ D ∞)
    (prescribed : PartialDiffeomorph I₄ I₄ P D ∞)
    (chart : PartialDiffeomorph I₄ I₄ D E₄ ∞)
    {r R : ℝ} (hr : 0 < r) (hBuffer : r < R)
    (hSource : closedBall (0 : E₄) R ⊆ sourceCap.source)
    (hTarget : closedBall (0 : E₄) R ⊆ targetCap.source)
    (hPrescribed : sourceCap '' closedBall (0 : E₄) R ⊆ prescribed.source)
    (hAgree : ∀ x ∈ closedBall (0 : E₄) R, prescribed (sourceCap x) = targetCap x)
    (hChartSource : A '' (sourceCap '' closedBall (0 : E₄) R) ⊆ chart.source)
    (hChartTarget : targetCap '' closedBall (0 : E₄) R ⊆ chart.source)
    (hSegment : ∀ t ∈ Icc (0 : ℝ) 1,
      (1 - t) • chart (A (sourceCap 0)) + t • chart (targetCap 0) ∈ chart.target)
    (hDet : 0 < (fderiv ℝ (fun x : E₄ => chart (A (sourceCap x))) 0).det *
      (fderiv ℝ (fun x : E₄ => chart (targetCap x)) 0).det)
    (pole : D) (hPole : pole ∉ chart.source) :
    ∃ F : P ≃ₘ⟮I₄, I₄⟯ D,
      F.preservesOrientation oP oD ∧
      (∀ x ∈ closedBall (0 : E₄) R, F (sourceCap x) = targetCap x) ∧
      IsOpen (sourceCap '' ball (0 : E₄) R) ∧
      IsOpen (targetCap '' ball (0 : E₄) R) ∧
      EqOn F prescribed (sourceCap '' ball (0 : E₄) R) ∧
      EqOn F.symm prescribed.symm (targetCap '' ball (0 : E₄) R) ∧
      F '' (sourceCap '' ball (0 : E₄) r)ᶜ = (targetCap '' ball (0 : E₄) r)ᶜ := by
  classical
  let f₀ := (sourceCap.trans A.toPartialDiffeomorph).trans chart
  let f₁ := targetCap.trans chart
  have hf₀ (x : E₄) : f₀ x = chart (A (sourceCap x)) := rfl
  have hf₁ (x : E₄) : f₁ x = chart (targetCap x) := rfl
  have h₀ : closedBall (0 : E₄) R ⊆ f₀.source := by
    intro x hx
    exact ⟨⟨hSource hx, mem_univ _⟩,
      hChartSource (mem_image_of_mem A (mem_image_of_mem sourceCap hx))⟩
  have h₁ : closedBall (0 : E₄) R ⊆ f₁.source := by
    intro x hx
    exact ⟨hTarget hx, hChartTarget (mem_image_of_mem targetCap hx)⟩
  obtain ⟨J, hJ, hJi, _, hJact, K, hK, hKV, hKfix⟩ :=
    exists_isotopy_eqOn_closedBall_of_partialDiffeomorphs_of_subset_of_radius f₀ f₁
      (hr.trans hBuffer) h₀ h₁ chart.open_target
      (by rintro _ ⟨x, hx, rfl⟩; exact chart.map_source' (h₀ hx).2)
      (by rintro _ ⟨x, hx, rfl⟩; exact chart.map_source' (h₁ hx).2)
      hSegment hDet
  obtain ⟨S, _, _, hS, hCompact, hInside, hSfix⟩ :=
    exists_diffeomorph_extension_of_partial_chart_family (P := ℝ)
      chart.toOpenPartialHomeomorph chart.contMDiffOn_toFun chart.contMDiffOn_invFun
      J hJ hJi hK hKV hKfix
  let F := A.trans (S 1)
  have hF (x : E₄) (hx : x ∈ closedBall (0 : E₄) R) :
      F (sourceCap x) = targetCap x := by
    have hx₀ := hChartSource (mem_image_of_mem A (mem_image_of_mem sourceCap hx))
    have hx₁ := hChartTarget (mem_image_of_mem targetCap hx)
    change S 1 (A (sourceCap x)) = _
    rw [(hS 1 _).1]
    unfold extendChartById
    rw [ite_eq_left (show A (sourceCap x) ∈ chart.toOpenPartialHomeomorph.source from hx₀)]
    change chart.symm (J 1 (chart (A (sourceCap x)))) = _
    rw [← hf₀, hJact x hx, hf₁]
    exact chart.symm_apply_apply hx₁
  have hSOrientation : (S 1).preservesOrientation oD oD := by
    let L := chart.toOpenPartialHomeomorph.symm '' K
    have hOut : pole ∉ L := fun h => hPole (hInside h)
    have hGerm : ((S 1) : D → D) =ᶠ[𝓝 pole] id :=
      eventuallyEq_of_mem (hCompact.isClosed.isOpen_compl.mem_nhds hOut)
        (fun x hx => (hSfix 1 x hx).1)
    have hD : ((S 1).mfderivToContinuousLinearEquiv (by simp) pole).toLinearEquiv =
        LinearEquiv.refl ℝ (TangentSpace I₄ pole) := by
      ext v
      change (mfderiv I₄ I₄ (S 1) pole : E₄ →L[ℝ] E₄) v = v
      rw [hGerm.mfderiv_eq, mfderiv_id]
      rfl
    apply ((S 1).preservesOrientation_iff_eq_at oD oD pole).2
    rw [hD]
    change Orientation.map (Fin 4) (LinearEquiv.refl ℝ E₄) (oD.orientation pole) =
      oD.orientation (S 1 pole)
    rw [Orientation.map_refl, hGerm.eq_of_nhds]
    rfl
  refine ⟨F, Diffeomorph.preservesOrientation_trans hA hSOrientation, hF,
    DifferentialGeometry.image_opens_isOpen sourceCap (U := ⟨_, isOpen_ball⟩)
      (ball_subset_closedBall.trans hSource),
    DifferentialGeometry.image_opens_isOpen targetCap (U := ⟨_, isOpen_ball⟩)
      (ball_subset_closedBall.trans hTarget), ?_, ?_, ?_⟩
  · rintro _ ⟨x, hx, rfl⟩
    exact (hF x (ball_subset_closedBall hx)).trans (hAgree x (ball_subset_closedBall hx)).symm
  · rintro _ ⟨x, hx, rfl⟩
    have hx' := ball_subset_closedBall hx
    calc
      F.symm (targetCap x) = sourceCap x := by rw [← hF x hx', F.symm_apply_apply]
      _ = prescribed.symm (targetCap x) := by
        rw [← hAgree x hx', prescribed.symm_apply_apply (hPrescribed (mem_image_of_mem _ hx'))]
  · have hImage : F '' (sourceCap '' ball (0 : E₄) r) = targetCap '' ball (0 : E₄) r := by
      ext y
      constructor
      · rintro ⟨_, ⟨x, hx, rfl⟩, rfl⟩
        exact ⟨x, hx, (hF x (ball_subset_closedBall (ball_subset_ball hBuffer.le hx))).symm⟩
      · rintro ⟨x, hx, rfl⟩
        exact ⟨sourceCap x, mem_image_of_mem _ hx,
          hF x (ball_subset_closedBall (ball_subset_ball hBuffer.le hx))⟩
    rw [← hImage]
    exact image_compl_eq (f := (F : P → D)) ⟨F.injective, F.surjective⟩

end Cap

section RoundCap

open FirstOrderTwistor

/-- A concrete marked round model. In a fixed stereographic chart of the
standard four-sphere, the radius-two cap and its full prescribed buffer
are transported by a translation of arbitrary vector. The ambient map has
both seam germs and sends the actual closed complementary side onto the
translated closed complementary side. -/
theorem bourMarkedTranslatedRoundCap
    (o : ManifoldOrientation I₄ StandardFourSphere 4) (v : E₄)
    {R : ℝ} (hR : 2 < R) :
    ∃ F : StandardFourSphere ≃ₘ⟮I₄, I₄⟯ StandardFourSphere,
      F.preservesOrientation o o ∧
      (∀ x ∈ closedBall (0 : E₄) R, F (transportedCapStereographic.symm x) = transportedCapStereographic.symm (x + v)) ∧
      (∀ x ∈ ball (0 : E₄) R, F.symm (transportedCapStereographic.symm (x + v)) = transportedCapStereographic.symm x) ∧
      F '' (transportedCapStereographic.symm '' ball (0 : E₄) 2)ᶜ =
        ((fun x : E₄ => transportedCapStereographic.symm (x + v)) '' ball (0 : E₄) 2)ᶜ := by
  let V₅ := EuclideanSpace ℝ (Fin 5)
  have hRank : 1 < Module.rank ℝ V₅ := by simp [V₅, ← Module.finrank_eq_rank]
  let _ : PathConnectedSpace StandardFourSphere :=
    isPathConnected_iff_pathConnectedSpace.1 (isPathConnected_sphere hRank (0 : V₅) zero_le_one)
  let A := Diffeomorph.refl I₄ StandardFourSphere ∞
  let T := DifferentialGeometry.Topology.translateDiffeomorph v
  let sourceCap := transportedCapStereographic.symm
  let targetCap := T.toPartialDiffeomorph.trans transportedCapStereographic.symm
  let prescribed := transportedCapStereographic.trans targetCap
  have hTargetMem (x : E₄) : x ∈ transportedCapStereographic.target := by
    rw [transportedCapStereographic_target]
    exact mem_univ _
  have hCoord (x : E₄) : transportedCapStereographic (transportedCapStereographic.symm x) = x :=
    transportedCapStereographic.apply_symm_apply (hTargetMem x)
  have hSource (x : E₄) : x ∈ sourceCap.source := hTargetMem x
  have hTarget (x : E₄) : x ∈ targetCap.source := ⟨mem_univ _, hTargetMem (x + v)⟩
  have hIn (x : E₄) : transportedCapStereographic.symm x ∈ transportedCapStereographic.source :=
    transportedCapStereographic.symm.map_source' (hTargetMem x)
  have hDet : 0 < (fderiv ℝ (fun x : E₄ => transportedCapStereographic (A (sourceCap x))) 0).det *
      (fderiv ℝ (fun x : E₄ => transportedCapStereographic (targetCap x)) 0).det := by
    have h₀ : (fun x : E₄ => transportedCapStereographic (A (sourceCap x))) = id := funext hCoord
    have h₁ : (fun x : E₄ => transportedCapStereographic (targetCap x)) = fun x => x + v :=
      funext fun x => hCoord (x + v)
    have hDeriv : fderiv ℝ (fun x : E₄ => x + v) 0 = ContinuousLinearMap.id ℝ E₄ :=
      ((hasFDerivAt_id (0 : E₄)).add_const v).fderiv
    have hOne : (ContinuousLinearMap.id ℝ E₄).det = 1 := by
      change LinearMap.det (1 : E₄ →ₗ[ℝ] E₄) = 1
      exact map_one _
    rw [h₀, h₁, hDeriv, fderiv_id, hOne]
    norm_num
  obtain ⟨F, hFO, hF, _, _, _, _, hExterior⟩ := bourMarkedExterior_of_commonChart A o o
    (Diffeomorph.preservesOrientation_refl o) sourceCap targetCap prescribed transportedCapStereographic
    (by norm_num : (0 : ℝ) < 2) hR
    (fun x _ => hSource x) (fun x _ => hTarget x)
    (by rintro _ ⟨x, _, rfl⟩; exact ⟨hIn x, hTarget _⟩)
    (by intro x _; change targetCap (transportedCapStereographic (transportedCapStereographic.symm x)) = _; rw [hCoord])
    (by rintro _ ⟨_, ⟨x, _, rfl⟩, rfl⟩; exact hIn x)
    (by rintro _ ⟨x, _, rfl⟩; exact hIn (x + v))
    (fun _ _ => hTargetMem _) hDet transportedCapNorthPole
    (by rw [transportedCapStereographic_source]; simp)
  refine ⟨F, hFO, hF, ?_, hExterior⟩
  intro x hx
  have h := hF x (ball_subset_closedBall hx)
  change F (transportedCapStereographic.symm x) = transportedCapStereographic.symm (x + v) at h
  rw [← h, F.symm_apply_apply]

end RoundCap

section EuclideanBoundary

open MeasureTheory DifferentialGeometry.Geometry.Riemannian.VolumeComparison
open scoped ENNReal

/-- On the actual radius sphere the radial field is unit outward. Its ambient
linear extension has derivative $r^{-1}$ times the identity, so its restriction
to tangent directions is the Euclidean positive shape operator. -/
theorem bourEuclideanOutwardRadialDerivative {r : ℝ} (hr : 0 < r)
    (x : sphere (0 : E₄) r) :
    ‖r⁻¹ • (x : E₄)‖ = 1 ∧ fderiv ℝ (fun y : E₄ => r⁻¹ • y) x =
      r⁻¹ • ContinuousLinearMap.id ℝ E₄ := by
  have hx : ‖(x : E₄)‖ = r := by
    simpa only [Metric.mem_sphere, dist_zero_right] using x.property
  refine ⟨?_, ?_⟩
  · rw [norm_smul, Real.norm_of_nonneg (inv_nonneg.mpr hr.le), hx, inv_mul_cancel₀ hr.ne']
  · exact ((r⁻¹ • ContinuousLinearMap.id ℝ E₄).hasFDerivAt (x := (x : E₄))).fderiv

/-- The polar measure of the Euclidean unit three-sphere is $2\\pi^2$. -/
theorem bourEuclideanUnitLinkArea :
    ((volume : Measure E₄).toSphere).real univ = 2 * Real.pi ^ 2 := by
  have hBall : (volume : Measure E₄).real (ball 0 1) = Real.pi ^ 2 / 2 := by
    change ((volume : Measure E₄) (ball 0 1)).toReal = _
    rw [euclidean_volume_unitBall 4 (by decide)]
    unfold euclideanUnitBallVolume
    have hGamma : Real.Gamma 3 = 2 := by
      simp
    rw [show ((4 : ℕ) : ℝ) / 2 + 1 = 3 by norm_num, hGamma,
      show Real.sqrt Real.pi ^ 4 = (Real.sqrt Real.pi ^ 2) ^ 2 by ring,
      Real.sq_sqrt Real.pi_pos.le]
  rw [Measure.toSphere_real_apply_univ, hBall]
  have hDim : (Module.finrank ℝ E₄ : ℝ) = 4 := by simp
  rw [hDim]
  ring

/-- On a Euclidean spherical boundary the flat contribution is the cubic
shape term, with the convention that a sphere with outward normal has
shape matrix $r^{-1} I_3$. This evaluates its integral against the
radius-$r$ polar surface measure expressed on the unit link. -/
theorem bourEuclideanSphereCubicBoundaryIntegral {r : ℝ} (hr : 0 < r) :
    (∫ _ : sphere (0 : E₄) 1,
      4 * Matrix.det (r⁻¹ • (1 : Matrix (Fin 3) (Fin 3) ℝ))
      ∂(ENNReal.ofReal (r ^ 3) • (volume : Measure E₄).toSphere)) = 8 * Real.pi ^ 2 := by
  rw [Matrix.det_smul, Matrix.det_one, Fintype.card_fin, mul_one, integral_smul_measure,
    integral_const, ENNReal.toReal_ofReal (pow_nonneg hr.le _), smul_eq_mul, smul_eq_mul,
    bourEuclideanUnitLinkArea]
  field_simp
  norm_num

end EuclideanBoundary

end SmoothPoincare
