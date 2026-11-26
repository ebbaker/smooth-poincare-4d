import SmoothPoincare.Variational.BourMarkedEnd
import DifferentialGeometry.Topology.Manifold.SupportedPointMotion

/-! # A common stereographic chart for two buffered caps on a recognized sphere

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
The two parametrized disks may initially cover the whole target between them.
Preliminary oriented point motions align exterior points and cap centers.
-/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Topology.Manifold Filter FirstOrderTwistor Metric Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

private def poleChart (p : S₄) : PartialDiffeomorph I₄ I₄ S₄ E₄ ∞ where
  toPartialEquiv := (stereographic' 4 p).toPartialEquiv
  open_source := (stereographic' 4 p).open_source
  open_target := (stereographic' 4 p).open_target
  contMDiffOn_toFun := (stereographic_isLocalDiffeomorphOn p).contMDiffOn
  contMDiffOn_invFun := (stereographicInverse_isLocalDiffeomorph p).contMDiff.contMDiffOn

private theorem chartSource (p : S₄) : (poleChart p).source = {p}ᶜ := stereographic'_source p
private theorem chartTarget (p : S₄) : (poleChart p).target = univ := stereographic'_target p

private theorem orientedMotionAway (o : ManifoldOrientation I₄ S₄ 4)
    (p a b : S₄) (ha : a ≠ p) (hb : b ≠ p) :
    ∃ F : S₄ ≃ₘ⟮I₄, I₄⟯ S₄, F.preservesOrientation o o ∧ F a = b ∧ F p = p := by
  let _ : PathConnectedSpace S₄ := isPathConnected_iff_pathConnectedSpace.1
    (isPathConnected_sphere (by simp [← Module.finrank_eq_rank] :
      1 < Module.rank ℝ (EuclideanSpace ℝ (Fin 5))) (0 : EuclideanSpace ℝ (Fin 5)) zero_le_one)
  let c := poleChart p
  have hConnected : IsPreconnected c.source := by
    have hi : c.symm '' c.target = c.source := c.toOpenPartialHomeomorph.symm_image_target_eq_source
    rw [← hi]
    exact (show IsPreconnected c.target by rw [show c.target = univ from chartTarget p];
      exact isPreconnected_univ).image _ c.symm.continuousOn
  obtain ⟨J, _, hJ, _, _, K, hK, hInside, hFix⟩ :=
    DifferentialGeometry.Topology.exists_supported_isotopy_apply_eq_of_isPreconnected
      (E := E₄) c.source c.open_source hConnected a b
      (by rwa [show c.source = {p}ᶜ from chartSource p]) (by rwa [show c.source = {p}ᶜ from chartSource p])
  have hp : p ∉ K := fun h => by simpa [c, chartSource] using hInside h
  have hg : ((J 1 : S₄ ≃ₘ⟮I₄, I₄⟯ S₄) : S₄ → S₄) =ᶠ[𝓝 p] id :=
    eventuallyEq_of_mem (hK.isClosed.isOpen_compl.mem_nhds hp) (fun x hx => (hFix 1 x hx).1)
  have hd : ((J 1).mfderivToContinuousLinearEquiv (by simp) p).toLinearEquiv =
      LinearEquiv.refl ℝ (TangentSpace I₄ p) := by
    ext v
    change (mfderiv I₄ I₄ (J 1) p : E₄ →L[ℝ] E₄) v = v
    rw [hg.mfderiv_eq, mfderiv_id]
    rfl
  refine ⟨J 1, ((J 1).preservesOrientation_iff_eq_at o o p).2 ?_, hJ, hg.eq_of_nhds⟩
  rw [hd]
  change Orientation.map (Fin 4) (LinearEquiv.refl ℝ E₄) (o.orientation p) = o.orientation (J 1 p)
  rw [Orientation.map_refl, hg.eq_of_nhds]
  rfl

private theorem thirdPole (a b : S₄) : ∃ p : S₄, a ≠ p ∧ b ≠ p := by
  let c := poleChart a
  have hT : ∀ x : E₄, x ∈ c.target := fun x => by rw [show c.target = univ from chartTarget a]; trivial
  let _ : Infinite S₄ := Infinite.of_injective c.symm
    (fun x y h => c.symm.injOn (hT x) (hT y) h)
  obtain ⟨p, hp⟩ := ((Set.finite_singleton b).insert a).exists_notMem
  exact ⟨p, fun h => hp (Or.inl h.symm), fun h => hp (Or.inr h.symm)⟩

private theorem capExteriorPoint {P : Type*} [TopologicalSpace P] [ChartedSpace E₄ P]
    [IsManifold I₄ ∞ P] [CompactSpace P] (cap : PartialDiffeomorph I₄ I₄ E₄ P ∞)
    {R : ℝ} (hR : 0 ≤ R) (hCap : closedBall (0 : E₄) R ⊆ cap.source) :
    ∃ p : P, p ∉ cap '' closedBall (0 : E₄) R := by
  by_contra! h
  have hFull : cap.target = univ := eq_univ_of_forall fun p => by
    obtain ⟨x, hx, rfl⟩ := h p
    exact cap.map_source' (hCap hx)
  have hComp : IsCompact cap.source := by
    have hi : cap.symm '' cap.target = cap.source := cap.toOpenPartialHomeomorph.symm_image_target_eq_source
    rw [← hi]
    exact (show IsCompact cap.target by rw [hFull]; exact isCompact_univ).image_of_continuousOn
      cap.symm.continuousOn
  rcases isClopen_iff.mp (⟨hComp.isClosed, cap.open_source⟩ : IsClopen cap.source) with he | hu
  · have h0 := hCap (mem_closedBall_self hR)
    simp [he] at h0
  · exact (not_compactSpace_iff.mpr (inferInstance : NoncompactSpace E₄))
      (isCompact_univ_iff.mp (hu ▸ hComp))

/-- On a positively recognized source with target the standard sphere, align an
exterior point and then the centers by oriented ambient changes of the initial
recognition. This supplies a chart with full Euclidean target containing both
entire buffered cap images, without an initial common-chart hypothesis. -/
theorem bourRecognizedCap_commonChart
    {P : Type*} [TopologicalSpace P] [ChartedSpace E₄ P] [IsManifold I₄ ∞ P] [CompactSpace P]
    (A : P ≃ₘ⟮I₄, I₄⟯ S₄) (oP : ManifoldOrientation I₄ P 4) (o : ManifoldOrientation I₄ S₄ 4)
    (hA : A.preservesOrientation oP o)
    (s : PartialDiffeomorph I₄ I₄ E₄ P ∞) (t : PartialDiffeomorph I₄ I₄ E₄ S₄ ∞)
    {R : ℝ} (hR : 0 ≤ R) (hs : closedBall (0 : E₄) R ⊆ s.source)
    (ht : closedBall (0 : E₄) R ⊆ t.source) :
    ∃ (B : P ≃ₘ⟮I₄, I₄⟯ S₄) (chart : PartialDiffeomorph I₄ I₄ S₄ E₄ ∞) (pole : S₄),
      B.preservesOrientation oP o ∧ B (s 0) = t 0 ∧
      chart.source = {pole}ᶜ ∧ chart.target = univ ∧
      B '' (s '' closedBall (0 : E₄) R) ⊆ chart.source ∧
      t '' closedBall (0 : E₄) R ⊆ chart.source := by
  obtain ⟨a, ha⟩ := capExteriorPoint s hR hs
  obtain ⟨p, hp⟩ := capExteriorPoint t hR ht
  obtain ⟨z, haz, hpz⟩ := thirdPole (A a) p
  obtain ⟨G, hGo, hGa, _⟩ := orientedMotionAway o z (A a) p haz hpz
  let A' := A.trans G
  have hAp : A' a = p := hGa
  have hAway (x : E₄) (hx : x ∈ closedBall (0 : E₄) R) : A' (s x) ≠ p := fun h =>
    ha ⟨x, hx, A'.injective (h.trans hAp.symm)⟩
  have hZero := mem_closedBall_self (x := (0 : E₄)) hR
  obtain ⟨J, hJo, hJ, hjp⟩ := orientedMotionAway o p (A' (s 0)) (t 0)
    (hAway _ hZero) (fun he => hp ⟨0, hZero, he⟩)
  refine ⟨A'.trans J, poleChart p, p, Diffeomorph.preservesOrientation_trans
    (Diffeomorph.preservesOrientation_trans hA hGo) hJo, hJ, chartSource p, chartTarget p, ?_, ?_⟩
  · rintro _ ⟨_, ⟨x, hx, rfl⟩, rfl⟩
    rw [chartSource]
    exact fun he => hAway x hx (J.injective (he.trans hjp.symm))
  · intro w hw
    rw [chartSource]
    exact fun he => hp (he ▸ hw)

private abbrev capLinear {P Q : Type*} [TopologicalSpace P] [ChartedSpace E₄ P] [IsManifold I₄ ∞ P]
    [TopologicalSpace Q] [ChartedSpace E₄ Q] [IsManifold I₄ ∞ Q]
    (f : PartialDiffeomorph I₄ I₄ P Q ∞) (x : P) (hx : x ∈ f.source) : E₄ ≃ₗ[ℝ] E₄ :=
  ((f.isLocalDiffeomorphAt I₄ I₄ ∞ hx).mfderivToContinuousLinearEquiv (by simp)).toLinearEquiv

private theorem det_pair_positive (u : Orientation ℝ E₄ (Fin 4)) (f g : E₄ ≃ₗ[ℝ] E₄)
    (h : Orientation.map (Fin 4) f u = Orientation.map (Fin 4) g u) :
    0 < LinearMap.det (f : E₄ →ₗ[ℝ] E₄) * LinearMap.det (g : E₄ →ₗ[ℝ] E₄) := by
  have hmap : Orientation.map (Fin 4) (f.trans g.symm) u = u := by
    rw [DifferentialGeometry.orientation_map_trans, h, ← Orientation.map_symm]
    exact Equiv.symm_apply_apply _ _
  have hpos := (Orientation.map_eq_iff_det_pos u (f.trans g.symm) (by simp)).mp hmap
  change 0 < LinearMap.det ((g.symm : E₄ →ₗ[ℝ] E₄).comp (f : E₄ →ₗ[ℝ] E₄)) at hpos
  rw [LinearMap.det_comp, LinearEquiv.det_coe_symm, ← div_eq_inv_mul] at hpos
  exact (div_pos_iff.mp hpos).elim (fun ⟨hf, hg⟩ => mul_pos hf hg)
    (fun ⟨hf, hg⟩ => mul_pos_of_neg_of_neg hf hg)

/-- After recognizing the two capped carriers, the common chart, placement
of both full disks, center alignment, and coordinate sign all follow. Only
the parametrizations' intrinsic orientation at their centers is tested.
The resulting oriented map agrees with the prescribed collar in both directions. -/
theorem bourMarkedExterior_of_recognizedSphere
    {P : Type*} [TopologicalSpace P] [ChartedSpace E₄ P] [IsManifold I₄ ∞ P] [CompactSpace P]
    (A : P ≃ₘ⟮I₄, I₄⟯ S₄) (oP : ManifoldOrientation I₄ P 4) (o : ManifoldOrientation I₄ S₄ 4)
    (hA : A.preservesOrientation oP o)
    (s : PartialDiffeomorph I₄ I₄ E₄ P ∞) (t : PartialDiffeomorph I₄ I₄ E₄ S₄ ∞)
    (prescribed : PartialDiffeomorph I₄ I₄ P S₄ ∞)
    {r R : ℝ} (hr : 0 < r) (hBuffer : r < R)
    (hs : closedBall (0 : E₄) R ⊆ s.source) (ht : closedBall (0 : E₄) R ⊆ t.source)
    (hPr : s '' closedBall (0 : E₄) R ⊆ prescribed.source)
    (hAgree : ∀ x ∈ closedBall (0 : E₄) R, prescribed (s x) = t x)
    (u : Orientation ℝ E₄ (Fin 4))
    (hos : Orientation.map (Fin 4) ((s.isLocalDiffeomorphAt I₄ I₄ ∞
      (hs (mem_closedBall_self (hr.trans hBuffer).le))).mfderivToContinuousLinearEquiv
        (by simp)).toLinearEquiv u = oP.orientation (s 0))
    (hot : Orientation.map (Fin 4) ((t.isLocalDiffeomorphAt I₄ I₄ ∞
      (ht (mem_closedBall_self (hr.trans hBuffer).le))).mfderivToContinuousLinearEquiv
        (by simp)).toLinearEquiv u = o.orientation (t 0)) :
    ∃ F : P ≃ₘ⟮I₄, I₄⟯ S₄, F.preservesOrientation oP o ∧
      (∀ x ∈ closedBall (0 : E₄) R, F (s x) = t x) ∧
      EqOn F prescribed (s '' ball (0 : E₄) R) ∧
      EqOn F.symm prescribed.symm (t '' ball (0 : E₄) R) ∧
      F '' (s '' ball (0 : E₄) r)ᶜ = (t '' ball (0 : E₄) r)ᶜ := by
  let _ : PathConnectedSpace S₄ := isPathConnected_iff_pathConnectedSpace.1
    (isPathConnected_sphere (by simp [← Module.finrank_eq_rank] :
      1 < Module.rank ℝ (EuclideanSpace ℝ (Fin 5))) (0 : EuclideanSpace ℝ (Fin 5)) zero_le_one)
  have hz := mem_closedBall_self (x := (0 : E₄)) (hr.trans hBuffer).le
  obtain ⟨B, c, pole, hB, hCenter, hSource, hTarget, hCs, hCt⟩ :=
    bourRecognizedCap_commonChart A oP o hA s t (hr.trans hBuffer).le hs ht
  have hsc := hCs (mem_image_of_mem B (mem_image_of_mem s hz))
  have htc := hCt (mem_image_of_mem t hz)
  let S := capLinear s 0 (hs hz)
  let T := capLinear t 0 (ht hz)
  let L := (B.mfderivToContinuousLinearEquiv (by simp) (s 0)).toLinearEquiv
  let C := capLinear c (t 0) htc
  have hMaps : Orientation.map (Fin 4) ((S.trans L).trans C) u =
      Orientation.map (Fin 4) (T.trans C) u := by
    rw [DifferentialGeometry.orientation_map_trans, DifferentialGeometry.orientation_map_trans,
      DifferentialGeometry.orientation_map_trans, hos, hot, hB (s 0), hCenter]
  have hsDer : fderiv ℝ (fun x : E₄ => c (B (s x))) 0 =
      ((mfderiv I₄ I₄ c (t 0)).comp ((mfderiv I₄ I₄ B (s 0)).comp (mfderiv I₄ I₄ s 0))) := by
    rw [← mfderiv_eq_fderiv]
    change mfderiv I₄ I₄ (c ∘ (B ∘ s)) 0 = _
    rw [mfderiv_comp _ (c.mdifferentiableAt (by simp) hsc)
      (B.mdifferentiable.mdifferentiableAt.comp _ (s.mdifferentiableAt (by simp) (hs hz))),
      mfderiv_comp _ B.mdifferentiable.mdifferentiableAt (s.mdifferentiableAt (by simp) (hs hz))]
    simp only [Function.comp_apply, hCenter]
  have htDer : fderiv ℝ (fun x : E₄ => c (t x)) 0 =
      (mfderiv I₄ I₄ c (t 0)).comp (mfderiv I₄ I₄ t 0) := by
    rw [← mfderiv_eq_fderiv]
    exact mfderiv_comp _ (c.mdifferentiableAt (by simp) htc) (t.mdifferentiableAt (by simp) (ht hz))
  have hDet : 0 < (fderiv ℝ (fun x : E₄ => c (B (s x))) 0).det *
      (fderiv ℝ (fun x : E₄ => c (t x)) 0).det := by
    rw [hsDer, htDer]
    exact det_pair_positive u _ _ hMaps
  obtain ⟨F, hFo, hF, _, _, hf, hi, he⟩ := bourMarkedExterior_of_commonChart B oP o hB s t
    prescribed c hr hBuffer hs ht hPr hAgree hCs hCt (fun _ _ => hTarget ▸ mem_univ _) hDet pole
    (by rw [hSource]; simp)
  exact ⟨F, hFo, hF, hf, hi, he⟩

end SmoothPoincare
