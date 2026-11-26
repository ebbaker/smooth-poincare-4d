import SmoothPoincare

/-! Independent applications of the Edition 04 public interfaces. -/

set_option autoImplicit false

open Matrix

section MatrixChecks

open SmoothPoincare.PositiveScalarCuts

example (d : ℤ) : windingOneBlock d * windingOneBlockInv d = 1 :=
  windingOneBlock_mul_inv d

example (d : ℤ) : windingOneBlockInv d * windingOneBlock d = 1 :=
  windingOneBlock_inv_mul d

example {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
    normalizedBlockChange d v * normalizedBlockChangeInv d v = 1 ∧
      normalizedBlockChangeInv d v * normalizedBlockChange d v = 1 :=
  ⟨normalizedBlockChange_mul_inv d v, normalizedBlockChange_inv_mul d v⟩

example {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
    (windingLinkBlock v).transpose * windingOneBlockInv d * windingLinkBlock v = 0 :=
  windingLinkBlock_schur_eq_zero d v

example {k : ℕ} (d : ℤ) (v : Fin k → ℤ) (C : Matrix (Fin k) (Fin k) ℤ) :
    (normalizedBlockChange d v).transpose * normalizedSurgeryMatrix d v C *
        normalizedBlockChange d v =
      Matrix.fromBlocks (windingOneBlock d) 0 0 C :=
  normalizedBlockCongr d v C

example {k : ℕ} (d : ℤ) (v : Fin k → ℤ) (C : Matrix (Fin k) (Fin k) ℤ)
    (h : ((normalizedSurgeryMatrix d v C).map (Int.castRingHom ℚ)).rank = 2) : C = 0 :=
  windingZeroBlock_eq_zero_of_rank d v C h

example {k : ℕ} (d : ℤ) (v : Fin k → ℤ) (C : Matrix (Fin k) (Fin k) ℤ)
    (h : ((Fin 2 ⊕ Fin k → ℤ) ⧸ LinearMap.range (normalizedSurgeryMatrix d v C).mulVecLin)
      ≃ₗ[ℤ] (Fin k → ℤ)) : C = 0 :=
  windingZeroBlock_eq_zero_of_integralCokernel d v C h

example (d : ℤ) (v : Fin 1 → ℤ) (C : Matrix (Fin 1) (Fin 1) ℤ) :
    (normalizedSurgeryMatrix d v C).det = -C 0 0 :=
  mixedSurgeryMatrix_det d v C

-- A single off-diagonal entry, with every diagonal entry zero, already
-- prevents the full rank-two premise, even without symmetry.
example : ((normalizedSurgeryMatrix (-2) ![0, 7] !![0, 3; 0, 0]).map
      (Int.castRingHom ℚ)).rank ≠ 2 := by
  intro hRank
  have hZero := windingZeroBlock_eq_zero_of_rank (-2) ![0, 7] !![0, 3; 0, 0] hRank
  have hEntry := congrFun (congrFun hZero 0) 1
  norm_num at hEntry

example : (normalizedSurgeryMatrix (-3) ![9] !![(-8 : ℤ)]).det = 8 := by
  rw [mixedSurgeryMatrix_det]
  norm_num

end MatrixChecks

section RoundCylinderChecks

open MeasureTheory Set SmoothPoincare.IntrinsicEntry

example (l : ℕ) (f : ℝ) (w : ℝ → ℝ) (hw : RoundCylinderModeAdmissible l f w) :
    roundCylinderModeEnergy l w = 6 * ((l : ℝ) + 1) * f ^ 2 +
      6 * ∫ t in Ioi (0 : ℝ), (deriv w t + ((l : ℝ) + 1) * w t) ^ 2 :=
  roundCylinderModeEnergy_eq l f w hw

example (l : ℕ) (f : ℝ) :
    RoundCylinderModeAdmissible l f (roundCylinderModeExtension l f) :=
  roundCylinderModeExtension_admissible l f

example (l : ℕ) (f : ℝ) :
    roundCylinderModeEnergy l (roundCylinderModeExtension l f) =
      6 * ((l : ℝ) + 1) * f ^ 2 :=
  roundCylinderModeExtension_energy l f

example (l : ℕ) (f : ℝ) :
    IsLeast (roundCylinderModeEnergy l '' {w | RoundCylinderModeAdmissible l f w})
      (6 * ((l : ℝ) + 1) * f ^ 2) :=
  roundCylinderMode_isLeast l f

example (l : ℕ) (f : ℝ) :
    sInf (roundCylinderModeEnergy l '' {w | RoundCylinderModeAdmissible l f w}) =
      6 * ((l : ℝ) + 1) * f ^ 2 :=
  roundCylinderMode_inf_eq l f

example :
    sInf (roundCylinderModeEnergy 0 '' {w | RoundCylinderModeAdmissible 0 (-2) w}) = 24 := by
  rw [roundCylinderMode_zero_inf_eq]
  norm_num

example :
    sInf (roundCylinderModeEnergy 1 '' {w | RoundCylinderModeAdmissible 1 (-2) w}) = 48 := by
  rw [roundCylinderMode_one_inf_eq]
  norm_num

example (l : ℕ) :
    sInf (roundCylinderModeEnergy l '' {w | RoundCylinderModeAdmissible l 0 w}) = 0 := by
  rw [roundCylinderMode_inf_eq]
  simp

end RoundCylinderChecks

section AsymmetricFaceChecks

open SmoothPoincare

-- The two widths are independent. Moving past the left outer support at
-- t = -2 can leave t = 2 inside the right inner plateau.
example : exactFaceCutoff 2 12 (-2) = 0 :=
  exactFaceCutoff_eq_zero (by norm_num) (by norm_num) (Or.inl (by norm_num))

example : exactFaceCutoff 2 12 2 = 1 :=
  exactFaceCutoff_eq_one (by norm_num) (by norm_num) (by norm_num) (by norm_num)

example : exactFaceCutoff 2 12 9 = 0 :=
  exactFaceCutoff_eq_zero (by norm_num) (by norm_num) (Or.inr (by norm_num))

end AsymmetricFaceChecks

section MarkedSuccessorChecks

open Set Manifold DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse SmoothPoincare
open scoped ContDiff Manifold

variable {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ (Fin 4 → ℝ) H} [I.Boundaryless] [IsManifold I ∞ M]
  [BoundarylessManifold I M] [T2Space M] [CompactSpace M] [DecidableEq M]

example {f : M → ℝ} {a b l r : ℝ} {p q : M}
    (hf : MorseStrip I f a b) (hl : a ≤ l) (hr : r ≤ b)
    (hreg : ∀ x, f x = l ∨ f x = r → ¬ IsCriticalPointAt I f x)
    (hpair : isCancellingPair I f l r p q) :
    ∃ g : M → ℝ, ModifiedWithin f l r g ∧ MorseStrip I g a b ∧
      (∀ j, {x | IsCriticalPointAt I g x ∧ morseIndex I g x = j} =
        {x | IsCriticalPointAt I f x ∧ morseIndex I f x = j} \ {p, q}) ∧
      (g ⁻¹' {l} = f ⁻¹' {l}) ∧ (g ⁻¹' {r} = f ⁻¹' {r}) ∧
      (g ⁻¹' Iic l = f ⁻¹' Iic l) ∧ (g ⁻¹' Iic r = f ⁻¹' Iic r) :=
  exists_nativePrefixCancellation hf hl hr hreg hpair

variable {E K Z Z' U A : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace K] {IB : ModelWithCorners ℝ E K}
  [TopologicalSpace Z] [ChartedSpace K Z] [TopologicalSpace Z'] [ChartedSpace K Z']
  [TopologicalSpace U] [ChartedSpace K U] [TopologicalSpace A] [ChartedSpace K A]

example (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z) (γ : Z ≃ₘ^∞⟮IB, IB⟯ U) :
    (∀ z, prefixClosingMark e γ z = γ (e z)) ∧
      (∀ y, (prefixClosingMark e γ).symm y = e.symm (γ.symm y)) :=
  prefixClosingMark_marked e γ

example (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z) (u : Fin 2 → PartialDiffeomorph IB IB A Z ∞)
    (T : Set A) (h : Disjoint (u 0 '' T) (u 1 '' T)) :
    Disjoint (prefixResidualTube e (u 0) '' T) (prefixResidualTube e (u 1) '' T) ∧
      ∀ i a, e (prefixResidualTube e (u i) a) = u i a :=
  ⟨prefixResidualTubes_disjoint e u T h, fun i a => (prefixResidualTube_marked e (u i)).2.2.1 a⟩

end MarkedSuccessorChecks

section ProductBandChecks

open SmoothPoincare.PositiveScalarCuts

example : (3 : ℝ) * productBand_widthFloor 3 ^ 2 = 3 * Real.pi ^ 2 :=
  productBand_widthFloor_eq (by norm_num)

-- A wall equality for either sign excludes the combined certificate even
-- when taking an arbitrarily short product would cost zero.
example : ¬ ∃ L, 0 < L ∧ 3 * Real.pi ^ 2 ≤ (3 : ℝ) * L ^ 2 ∧
    ∀ σ, productBand_joinedEnergy (fun s => if s then 2 else 0) (fun _ => 0) (fun _ => 0)
      0 L σ < 2 * (1 : ℝ) := by
  intro h
  have hCost := (exists_productBand_width_and_budget_zero_iff
    (fun s => if s then 2 else 0) (fun _ => 0) (fun _ => 0) (by norm_num : (0 : ℝ) < 3)).mp h
  have hWall := hCost true
  norm_num at hWall

end ProductBandChecks

section RoundCapChecks

open DifferentialGeometry DifferentialGeometry.Geometry FirstOrderTwistor Manifold Set
open SmoothPoincare SmoothPoincare.RoundEquatorialCaps
open scoped ContDiff Manifold SmoothPoincare

local notation "PolarModel" => (ModelWithCorners.prod (𝓘(ℝ, ℝ)) (𝓡 3))
local instance : Nonempty StandardFourSphere :=
  ((NormedSpace.sphere_nonempty (x := (0 : EuclideanSpace ℝ (Fin 5))) (r := 1)).mpr
    zero_le_one).to_subtype

example (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (a b : HeightRadius) (s : ℝ) (A : Set StandardFourSphere) :
    ((signedRound o).conformal (logFactor a b s)).charge .plus A = 0 ∧
      ((signedRound o).conformal (logFactor a b s)).charge .minus A = 0 :=
  ⟨zero_charge o a b s .plus A, zero_charge o a b s .minus A⟩

example (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4) (a b : HeightRadius) :
    southClosure.HasPositiveCaps (signedRound o) o ∧ northClosure.HasPositiveCaps (signedRound o) o :=
  positive_caps_on_marked_hemispheres o standardRoundFour_yamabe_pos a b

example (a b : HeightRadius) (q : ℝ × PolarDir roundLatitudeNorth)
    (hq : q.1 ∈ Ioo 0 Real.pi) (hL : -a.val / 4 ≤ Real.cos q.1)
    (hR : Real.cos q.1 ≤ b.val / 4) (v w : ℝ × EuclideanSpace ℝ (Fin 3)) :
    let F := roundLatitudeChart roundLatitudeNorth
    (metric a b 1).inner (F q) (mfderiv PolarModel (𝓡 4) F q v) (mfderiv PolarModel (𝓡 4) F q w) =
      mvfderiv PolarModel (roundLatitudeCylinderTime ∘ Prod.fst) q v *
      mvfderiv PolarModel (roundLatitudeCylinderTime ∘ Prod.fst) q w +
      (roundMetric (E := (ℝ ∙ (roundLatitudeNorth : EuclideanSpace ℝ (Fin 5)))ᗮ) (n := 3)).inner
        q.2 v.2 w.2 :=
  marked_product_endpoint a b q hq hL hR v w

example (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (wL wR : ℝ) (hL : 0 < wL) (hR : 0 < wR) (hLp : wL < Real.pi / 2) (hRp : wR < Real.pi / 2) :
    let a := latitudeRadius wL hL hLp
    let b := latitudeRadius wR hR hRp
    (∀ s : ℝ, ((signedRound o).conformal (logFactor a b s)).energy .plus < 2 * (4 * Real.pi ^ 2)) ∧
      southClosure.HasPositiveCaps (signedRound o) o ∧ northClosure.HasPositiveCaps (signedRound o) o := by
  have h := fixedSource_at_physical_widths o wL wR hL hR hLp hRp
  exact ⟨h.2.2.2.2.1, h.2.2.2.2.2.1, h.2.2.2.2.2.2.1⟩

end RoundCapChecks
