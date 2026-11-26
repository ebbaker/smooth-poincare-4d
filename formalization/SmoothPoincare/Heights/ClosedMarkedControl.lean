import SmoothPoincare.Heights.MarkedHandleGluing
import SmoothPoincare.Heights.StandardSurgeryModel

/-! # Full torus marks and the closing comparison of the split and slid controls -/

open Set Metric Manifold
open DifferentialGeometry.Topology DifferentialGeometry.Topology.Handle
open DifferentialGeometry.Topology.Manifold
open SmoothPoincare.StandardSurgeryModel
open scoped ContDiff Manifold

namespace SmoothPoincare.ClosedMarkedControl

noncomputable section

abbrev Circle := BoundarySphere 1
abbrev Disk := ClosedCell 2
abbrev ThreeSphere := RoundSphere 1 1

private def outerRadius (ε : ℝ) : ℝ := Real.sqrt (1 - ε ^ 2)

private theorem outerRadius_pos {ε : ℝ} (hε : 0 < ε) (hε₁ : ε < 1) :
    0 < outerRadius ε := Real.sqrt_pos.mpr (by nlinarith)

private theorem outerRadius_sq {ε : ℝ} (hε : 0 < ε) (hε₁ : ε < 1) :
    outerRadius ε ^ 2 = 1 - ε ^ 2 := Real.sq_sqrt (by nlinarith)

private theorem sphere_components (x : ThreeSphere) :
    ‖x.val.fst‖ ^ 2 + ‖x.val.snd‖ ^ 2 = 1 := by
  rw [← WithLp.prod_norm_sq_eq_of_L2, norm_eq_of_mem_sphere x]
  norm_num

private def spherePoint (x y : Block 1) (h : ‖x‖ ^ 2 + ‖y‖ ^ 2 = 1) : ThreeSphere :=
  ⟨WithLp.toLp 2 (x,y), mem_sphere_zero_iff_norm.mpr (by
    have hh : ‖WithLp.toLp 2 (x,y)‖ ^ 2 = 1 := by
      rw [WithLp.prod_norm_sq_eq_of_L2]
      exact h
    nlinarith [norm_nonneg (WithLp.toLp 2 (x,y))])⟩

private theorem disk_norm_le (u : Disk) : ‖u.val‖ ≤ 1 := u.property

private theorem radicand_pos {r : ℝ} (hr : 0 < r) (hr₁ : r < 1) (u : Disk) :
    0 < 1 - ‖r • u.val‖ ^ 2 := by
  rw [norm_smul, Real.norm_eq_abs, abs_of_pos hr]
  have hm := mul_le_of_le_one_right hr.le (disk_norm_le u)
  have hn := mul_nonneg hr.le (norm_nonneg u.val)
  nlinarith

private theorem norm_smul_circle (r : ℝ) (q : Circle) :
    ‖r • q.val‖ ^ 2 = r ^ 2 := by
  rw [norm_smul, norm_eq_of_mem_sphere q, mul_one, Real.norm_eq_abs, sq_abs]

/-- The spectator tube with the chosen product framing, in the split control's
angular marking. Its first factor is the core circle and its second is the disk. -/
def splitSpectatorTube {ε : ℝ} (hε : 0 < ε) (hε₁ : ε < 1) (p : Circle × Disk) :
    ThreeSphere :=
  spherePoint (Real.sqrt (1 - ‖ε • p.2.val‖ ^ 2) • p.1.val) (ε • p.2.val) (by
    rw [norm_smul_circle, Real.sq_sqrt (radicand_pos hε hε₁ p.2).le]
    ring)

/-- The closed exterior of the displayed spectator tube has the angular second
coordinate everywhere, including through the locus where the first block vanishes. -/
def splitExterior (ε : ℝ) : Set ThreeSphere := {x | ε ≤ ‖x.val.snd‖}

private theorem outerRadius_lt_one {ε : ℝ} (hε : 0 < ε) (hε₁ : ε < 1) :
    outerRadius ε < 1 := by
  nlinarith [outerRadius_sq hε hε₁, outerRadius_pos hε hε₁]

/-- The exterior coordinates of the split spectator at the supplied tube
radius. The inverse divides the first block by its maximum radius and reads
the direction of the entire second block. -/
def splitExteriorCoordinates {ε : ℝ} (hε : 0 < ε) (hε₁ : ε < 1) (q₀ : Circle) :
    Disk × Circle ≃ ↥(splitExterior ε) where
  toFun p :=
    let r := outerRadius ε
    let b := Real.sqrt (1 - ‖r • p.1.val‖ ^ 2)
    ⟨spherePoint (r • p.1.val) (b • p.2.val) (by
      rw [norm_smul_circle, Real.sq_sqrt
        (radicand_pos (outerRadius_pos hε hε₁) (outerRadius_lt_one hε hε₁) p.1).le]
      ring), by
      change ε ≤ ‖b • p.2.val‖
      have hb : 0 < b := Real.sqrt_pos.mpr
        (radicand_pos (outerRadius_pos hε hε₁) (outerRadius_lt_one hε hε₁) p.1)
      rw [norm_smul, norm_eq_of_mem_sphere p.2, mul_one, Real.norm_eq_abs, abs_of_pos hb]
      have hbs : b ^ 2 = 1 - ‖r • p.1.val‖ ^ 2 := Real.sq_sqrt
        (radicand_pos (outerRadius_pos hε hε₁) (outerRadius_lt_one hε hε₁) p.1).le
      have hle : ‖r • p.1.val‖ ≤ r := by
        rw [norm_smul, Real.norm_eq_abs, abs_of_pos (outerRadius_pos hε hε₁)]
        exact mul_le_of_le_one_right (outerRadius_pos hε hε₁).le (disk_norm_le p.1)
      nlinarith [outerRadius_sq hε hε₁, norm_nonneg (r • p.1.val),
        sq_le_sq₀ (norm_nonneg (r • p.1.val)) (outerRadius_pos hε hε₁).le |>.mpr hle]⟩
  invFun x :=
    (⟨(outerRadius ε)⁻¹ • x.val.val.fst, by
        change ‖(outerRadius ε)⁻¹ • x.val.val.fst‖ ≤ 1
        have hy : ε ≤ ‖x.val.val.snd‖ := x.property
        have hx : ‖x.val.val.fst‖ ≤ outerRadius ε := by
          nlinarith [sphere_components x.val, outerRadius_sq hε hε₁,
            norm_nonneg x.val.val.fst, outerRadius_pos hε hε₁,
            (sq_le_sq₀ hε.le (norm_nonneg x.val.val.snd)).mpr hy]
        rw [norm_smul, Real.norm_eq_abs, abs_of_pos (inv_pos.mpr (outerRadius_pos hε hε₁))]
        calc
          (outerRadius ε)⁻¹ * ‖x.val.val.fst‖ ≤ (outerRadius ε)⁻¹ * outerRadius ε :=
            mul_le_mul_of_nonneg_left hx (inv_pos.mpr (outerRadius_pos hε hε₁)).le
          _ = 1 := inv_mul_cancel₀ (outerRadius_pos hε hε₁).ne'⟩,
      sphereDirection q₀ x.val.val.snd)
  left_inv p := by
    apply Prod.ext
    · apply Subtype.ext
      change (outerRadius ε)⁻¹ • (outerRadius ε • p.1.val) = p.1.val
      simp [smul_smul, (outerRadius_pos hε hε₁).ne']
    · exact sphereDirection_pos_smul q₀ p.2 (Real.sqrt_pos.mpr
        (radicand_pos (outerRadius_pos hε hε₁) (outerRadius_lt_one hε hε₁) p.1))
  right_inv x := by
    have hr := outerRadius_pos hε hε₁
    have hscale : outerRadius ε • ((outerRadius ε)⁻¹ • x.val.val.fst) = x.val.val.fst := by
      simp [smul_smul, hr.ne']
    have hrad : Real.sqrt (1 - ‖outerRadius ε •
        ((outerRadius ε)⁻¹ • x.val.val.fst)‖ ^ 2) = ‖x.val.val.snd‖ := by
      rw [hscale, show 1 - ‖x.val.val.fst‖ ^ 2 = ‖x.val.val.snd‖ ^ 2 by
        linarith [sphere_components x.val], Real.sqrt_sq (norm_nonneg _)]
    have hy : ε ≤ ‖x.val.val.snd‖ := x.property
    have hne : x.val.val.snd ≠ 0 := norm_pos_iff.mp (hε.trans_le hy)
    apply Subtype.ext
    apply Subtype.ext
    apply (WithLp.prodContinuousLinearEquiv 2 ℝ (Block 1) (Block 1)).injective
    apply Prod.ext
    · exact hscale
    · change Real.sqrt (1 - ‖outerRadius ε • ((outerRadius ε)⁻¹ • x.val.val.fst)‖ ^ 2)
        • (sphereDirection q₀ x.val.val.snd).val = x.val.val.snd
      rw [hrad, norm_smul_sphereDirection q₀ hne]

/-- On the complete common torus the exterior and attaching charts have
the very same marked pair. This keeps both slope factors separately. -/
theorem splitExterior_torus {ε : ℝ} (hε : 0 < ε) (hε₁ : ε < 1)
    (q₀ z w : Circle) :
    (splitExteriorCoordinates hε hε₁ q₀ (onBoundary z,w)).val =
      splitSpectatorTube hε hε₁ (z,onBoundary w) := by
  have hrad : Real.sqrt (1 - ‖outerRadius ε • z.val‖ ^ 2) = ε := by
    rw [norm_smul_circle, outerRadius_sq hε hε₁, show 1 - (1 - ε ^ 2) = ε ^ 2 by ring,
      Real.sqrt_sq hε.le]
  apply Subtype.ext
  change WithLp.toLp 2 (outerRadius ε • z.val,
    Real.sqrt (1 - ‖outerRadius ε • z.val‖ ^ 2) • w.val) =
      WithLp.toLp 2 (Real.sqrt (1 - ‖ε • w.val‖ ^ 2) • z.val, ε • w.val)
  rw [hrad, norm_smul_circle]
  rfl

section SignedTorus

local instance : Fact (Module.finrank ℝ (Block 1) = 1 + 1) := ⟨by simp⟩

local instance : Fact (Module.finrank ℝ (Ambient 1 1) = (1 + 1 + 1) + 1) := ⟨by
  rw [(WithLp.prodContinuousLinearEquiv 2 ℝ (Block 1) (Block 1)).toLinearEquiv.finrank_eq,
    Module.finrank_prod]
  simp only [finrank_euclideanSpace_fin]
⟩

local notation "I" => ModelWithCorners.prod (ModelWithCorners.prod (𝓡 1) (𝓡 1)) 𝓘(ℝ, ℝ)

private def shiftedNormal (ε : ℝ) : ℝ ≃ₘ^∞⟮𝓘(ℝ,ℝ),𝓘(ℝ,ℝ)⟯ ℝ where
  toFun t := 1 / 2 - ε ^ 2 - t
  invFun t := 1 / 2 - ε ^ 2 - t
  left_inv t := by ring
  right_inv t := by ring
  contMDiff_toFun := contMDiff_const.sub contMDiff_id
  contMDiff_invFun := contMDiff_const.sub contMDiff_id

/-- Smooth signed coordinates on the actual angular torus of the split
control, with zero at the spectator radius and positive side exterior. -/
def splitTorusCollar (ε : ℝ) (z₀ w₀ : Circle) :
    PartialDiffeomorph I (𝓡 3) (SeamDomain 1 1) ThreeSphere ∞ :=
  ((Diffeomorph.refl ((𝓡 1).prod (𝓡 1)) (Circle × Circle) ∞).prodCongr
    (shiftedNormal ε)).toPartialDiffeomorph.trans (seamChart z₀ w₀)

theorem splitTorusCollar_domains (ε : ℝ) (z₀ w₀ : Circle) :
    (splitTorusCollar ε z₀ w₀).source = {p | p.2 ∈ Ioo (-(ε ^ 2)) (1 - ε ^ 2)} ∧
      (splitTorusCollar ε z₀ w₀).target = seamTarget := by
  constructor
  · ext p
    change (True ∧ (-(1 / 2 : ℝ) < 1 / 2 - ε ^ 2 - p.2 ∧
      1 / 2 - ε ^ 2 - p.2 < 1 / 2)) ↔ (-(ε ^ 2) < p.2 ∧ p.2 < 1 - ε ^ 2)
    constructor
    · rintro ⟨_, hl, hr⟩
      exact ⟨by linarith, by linarith⟩
    · rintro ⟨hl, hr⟩
      exact ⟨trivial, by linarith, by linarith⟩
  · ext y
    change (y ∈ seamTarget ∧ True) ↔ y ∈ seamTarget
    exact ⟨And.left, fun hy => ⟨hy,trivial⟩⟩

theorem splitTorusCollar_inverse_coordinates (ε : ℝ) (z₀ w₀ : Circle) (y : ThreeSphere) :
    (splitTorusCollar ε z₀ w₀).symm y =
      ((sphereDirection z₀ y.val.fst, sphereDirection w₀ y.val.snd), ‖y.val.snd‖ ^ 2 - ε ^ 2) := by
  apply Prod.ext
  · rfl
  · change 1 / 2 - ε ^ 2 - seamParameter y = ‖y.val.snd‖ ^ 2 - ε ^ 2
    unfold seamParameter
    linarith [sphere_components y]

/-- The exact signed height and both angular coordinates are recovered
on every parameter of every full torus in the open signed interval. -/
theorem splitTorusCollar_transport {ε : ℝ} (hε : 0 < ε) (z₀ w₀ : Circle)
    (p : SeamDomain 1 1) (hp : p ∈ (splitTorusCollar ε z₀ w₀).source) :
    let C := splitTorusCollar ε z₀ w₀
    C.symm (C p) = p ∧
      ‖(C p).val.snd‖ ^ 2 = ε ^ 2 + p.2 ∧ ((C p ∈ splitExterior ε) ↔ 0 ≤ p.2) := by
  let C := splitTorusCollar ε z₀ w₀
  have h := C.left_inv hp
  have hn : ‖(C p).val.snd‖ ^ 2 = ε ^ 2 + p.2 := by
    have he := congrArg Prod.snd (show C.symm (C p) = p from h)
    rw [show C.symm (C p) = ((sphereDirection z₀ (C p).val.fst,
      sphereDirection w₀ (C p).val.snd), ‖(C p).val.snd‖ ^ 2 - ε ^ 2)
      from splitTorusCollar_inverse_coordinates ε z₀ w₀ (C p)] at he
    change ‖(C p).val.snd‖ ^ 2 - ε ^ 2 = p.2 at he
    linarith
  refine ⟨h,hn,?_⟩
  change ε ≤ ‖(C p).val.snd‖ ↔ 0 ≤ p.2
  rw [← sq_le_sq₀ hε.le (norm_nonneg _), hn]
  exact le_add_iff_nonneg_right _

theorem splitTorusCollar_at_zero {ε : ℝ} (hε : 0 < ε) (hε₁ : ε < 1)
    (z₀ w₀ z w : Circle) :
    splitTorusCollar ε z₀ w₀ ((z,w),0) = splitSpectatorTube hε hε₁ (z,onBoundary w) := by
  let C := splitTorusCollar ε z₀ w₀
  let y := splitSpectatorTube hε hε₁ (z,onBoundary w)
  have hx : y.val.fst = outerRadius ε • z.val := by
    change Real.sqrt (1 - ‖ε • w.val‖ ^ 2) • z.val = outerRadius ε • z.val
    rw [norm_smul_circle]
    rfl
  have hy : y.val.snd = ε • w.val := rfl
  have hs : y ∈ C.target := by
    change y ∈ (splitTorusCollar ε z₀ w₀).target
    rw [(splitTorusCollar_domains ε z₀ w₀).2]
    change y.val.fst ≠ 0 ∧ y.val.snd ≠ 0
    rw [hx,hy]
    exact ⟨smul_ne_zero (outerRadius_pos hε hε₁).ne' (ne_zero_of_mem_unit_sphere z),
      smul_ne_zero hε.ne' (ne_zero_of_mem_unit_sphere w)⟩
  have hi : C.symm y = ((z,w),0) := by
    change (splitTorusCollar ε z₀ w₀).symm y = _
    rw [splitTorusCollar_inverse_coordinates, hx, hy,
      sphereDirection_pos_smul z₀ z (outerRadius_pos hε hε₁),
      sphereDirection_pos_smul w₀ w hε, norm_smul_circle, sub_self]
  have he : C (C.symm y) = y := C.right_inv hs
  rw [hi] at he
  exact he

end SignedTorus

section Closing

variable {S D Y Y' U : Type*}

/-- The actual dual parametrization swaps the full circle and disk coordinates.
After conjugating the upper marking by the supplied slid-trace boundary map,
the marked spectator has exactly the split dual parametrization and inverse. -/
theorem slid_dualTube_and_inverse
    (γ : Y ≃ U) (F : Y' ≃ Y) (b : D × S → Y) (b' : D × S → Y')
    (bInv : Y → D × S) (hb : Function.LeftInverse bInv b)
    (hF : ∀ v, F (b' v) = b v) :
    let γ' := F.trans γ
    let a := fun p : S × D => γ (b p.swap)
    let a' := fun p : S × D => γ' (b' p.swap)
    let aInv := fun y : U => (bInv (γ.symm y)).swap
    let aInv' := fun y : U => (bInv (F (γ'.symm y))).swap
    a' = a ∧ aInv' = aInv ∧
      Function.LeftInverse aInv a ∧ Function.LeftInverse aInv' a' ∧
      RightInvOn aInv' a' (range a') := by
  dsimp
  have hf (p : S × D) : γ (F (b' p.swap)) = γ (b p.swap) := congrArg γ (hF p.swap)
  have hi (y : U) : (bInv (F (F.symm (γ.symm y)))).swap = (bInv (γ.symm y)).swap := by
    rw [F.apply_symm_apply]
  have hleft (p : S × D) : (bInv (γ.symm (γ (b p.swap)))).swap = p := by
    rw [γ.symm_apply_apply, hb]
    exact Prod.swap_swap p
  have hleft' (p : S × D) :
      (bInv (F (F.symm (γ.symm (γ (F (b' p.swap))))))).swap = p :=
    (hi _).trans ((congrArg (fun y => (bInv (γ.symm y)).swap) (hf p)).trans (hleft p))
  refine ⟨funext hf,funext hi,hleft,hleft',?_⟩
  rintro y ⟨p,rfl⟩
  exact congrArg (fun q : S × D => γ (F (b' q.swap))) (hleft' p)

variable {X X' Q : Type*} [TopologicalSpace X] [TopologicalSpace X']
  [TopologicalSpace Y] [TopologicalSpace Y'] [TopologicalSpace U] [TopologicalSpace Q]

/-- Glue the slid trace with the transported closing map. The comparison
is the supplied trace map on the lower body and the identity on the
upper body, with those same maps inverted on the whole assembly. -/
def slidClosedAssembly
    (F : X' ≃ₜ X) (Fb : Y' ≃ₜ Y) (γ : Y ≃ₜ U)
    (j' : Y' → X') (j : Y → X) (k : U → Q)
    (hF : ∀ y, F (j' y) = j (Fb y)) :
    AdjunctionSpace j' (k ∘ (Fb.trans γ)) ≃ₜ AdjunctionSpace j (k ∘ γ) :=
  adjunctionHomeomorph _ _ _ _ Fb.toEquiv F (Homeomorph.refl Q) hF (fun _ => rfl)

theorem slidClosedAssembly_representatives
    (F : X' ≃ₜ X) (Fb : Y' ≃ₜ Y) (γ : Y ≃ₜ U)
    (j' : Y' → X') (j : Y → X) (k : U → Q)
    (hF : ∀ y, F (j' y) = j (Fb y)) :
    let A := slidClosedAssembly F Fb γ j' j k hF
    (∀ x : X', A (adjunctionCell j' (k ∘ (Fb.trans γ)) x) = adjunctionCell j (k ∘ γ) (F x)) ∧
    (∀ q : Q, A (adjunctionLower (k ∘ (Fb.trans γ)) q) = adjunctionLower (k ∘ γ) q) ∧
    (∀ x : X, A.symm (adjunctionCell j (k ∘ γ) x) =
      adjunctionCell j' (k ∘ (Fb.trans γ)) (F.symm x)) ∧
    (∀ q : Q, A.symm (adjunctionLower (k ∘ γ) q) = adjunctionLower (k ∘ (Fb.trans γ)) q) :=
  ⟨fun _ => rfl, fun _ => rfl, fun _ => rfl, fun _ => rfl⟩

end Closing

end

end SmoothPoincare.ClosedMarkedControl
