import DifferentialGeometry.Analysis.Calculus.PartialDerivative.Iterated
import DifferentialGeometry.Geometry.Connection.ChartBridge.Metric.InverseGram
import DifferentialGeometry.Geometry.Metric.Coordinates.EuclideanFrame
import DifferentialGeometry.Geometry.Operator.Laplacian.Rough
import Mathlib.Analysis.InnerProductSpace.Laplacian
import Mathlib.MeasureTheory.Function.LpSeminorm.Monotonicity
import Mathlib.MeasureTheory.Function.LpSeminorm.TriangleInequality
import Mathlib.MeasureTheory.Function.LpSpace.Indicator
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar

/-! # Freezing the harmonic-chart principal operator

E51, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and effort were unavailable.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Metric
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
  DifferentialGeometry.Tensor0SBundle MeasureTheory MeasureTheory.Measure Set
open scoped ContDiff ENNReal NNReal Manifold Laplacian InnerProductSpace

namespace SmoothPoincare.Bour

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- The principal operator in the fixed model basis used by the harmonic
Ricci equation, with one real symmetric matrix of coefficients when frozen. -/
def bourFlatOperator
    (a : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (u : E → ℝ) (z : E) : ℝ :=
  ∑ i, ∑ j, a i j * iteratedFDeriv ℝ 2 u z ![chartModelBasis E i, chartModelBasis E j]

/-- The flat Hessian estimate needed for compactly supported test functions.
The analytic constant and the fixed coefficient are specified explicitly. -/
def BourFlatHessianEstimate [MeasurableSpace E] (μ : Measure E) (p : ℝ≥0∞)
    (a : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (C : ℝ≥0∞) : Prop :=
  ∀ u : E → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
    eLpNorm (iteratedFDeriv ℝ 2 u) p μ ≤ C * eLpNorm (bourFlatOperator a u) p μ

/-- Comparison with the principal operator stated as ordered chart
derivatives in the harmonic Ricci equation. -/
theorem bourFlatOperator_eq_partialDeriv
    (a : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (u : E → ℝ) (z : E) (hu : ContDiffAt ℝ ∞ u z) :
    bourFlatOperator a u z = ∑ i, ∑ j, a i j * partialDeriv i (partialDeriv j u) z := by
  unfold bourFlatOperator
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  rw [DifferentialGeometry.Analysis.Calculus.partialDeriv_partialDeriv_eq_iteratedFDeriv_two u hu]

/-- Freezing error in the fixed chart axes. The coefficient bound carries the
two actual axis lengths, so no orthonormality of the model basis is required. -/
theorem bourFlatOperator_sub_le
    (a a₀ : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (u : E → ℝ) (z : E) :
    ‖bourFlatOperator a u z - bourFlatOperator a₀ u z‖ ≤
      (∑ i, ∑ j,
        ‖a i j - a₀ i j‖ * ‖chartModelBasis E i‖ * ‖chartModelBasis E j‖) *
      ‖iteratedFDeriv ℝ 2 u z‖ := by
  let H := iteratedFDeriv ℝ 2 u z
  let b := chartModelBasis E
  unfold bourFlatOperator
  simp only [← Finset.sum_sub_distrib, ← sub_mul]
  calc
    _ ≤ ∑ i, ∑ j, ‖(a i j - a₀ i j) * H ![b i, b j]‖ := by
      exact (norm_sum_le _ _).trans (Finset.sum_le_sum fun i _ => norm_sum_le _ _)
    _ ≤ ∑ i, ∑ j, (‖a i j - a₀ i j‖ * ‖b i‖ * ‖b j‖) * ‖H‖ := by
      refine Finset.sum_le_sum fun i _ => Finset.sum_le_sum fun j _ => ?_
      have h := H.le_opNorm (![b i, b j] : Fin 2 → E)
      simp only [Fin.prod_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one] at h
      rw [norm_mul]
      calc
        _ ≤ ‖a i j - a₀ i j‖ * (‖H‖ * (‖b i‖ * ‖b j‖)) :=
          mul_le_mul_of_nonneg_left h (norm_nonneg _)
        _ = _ := by ring
    _ = _ := by simp only [Finset.sum_mul, H, b]

/-- The coefficient error is small in the same (L^p) norm as the Hessian
whenever the weighted entrywise oscillation is uniformly small a.e. -/
theorem bourFlatOperator_sub_eLpNorm_le [MeasurableSpace E] (μ : Measure E)
    (p : ℝ≥0∞)
    (a : E → Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (a₀ : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (u : E → ℝ) {ε : ℝ}
    (hu : ∀ᵐ z ∂μ, iteratedFDeriv ℝ 2 u z ≠ 0 → ∑ i, ∑ j,
      ‖a z i j - a₀ i j‖ * ‖chartModelBasis E i‖ * ‖chartModelBasis E j‖ ≤ ε)
    (hM : AEStronglyMeasurable (fun z => bourFlatOperator (a z) u z - bourFlatOperator a₀ u z) μ) :
    eLpNorm (fun z => bourFlatOperator (a z) u z - bourFlatOperator a₀ u z) p μ ≤
      ENNReal.ofReal ε * eLpNorm (iteratedFDeriv ℝ 2 u) p μ := by
  apply eLpNorm_le_mul_eLpNorm_of_ae_le_mul hM _ p
  filter_upwards [hu] with z hz
  by_cases h : iteratedFDeriv ℝ 2 u z = 0
  · simp [bourFlatOperator, h]
  · exact (bourFlatOperator_sub_le (a z) a₀ u z).trans
      (mul_le_mul_of_nonneg_right (hz h) (norm_nonneg _))

private theorem bourFlatOperator_continuous
    (a : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (u : E → ℝ) (hu : ContDiff ℝ ∞ u) : Continuous (bourFlatOperator a u) := by
  have h : Continuous (iteratedFDeriv ℝ 2 u) := hu.continuous_iteratedFDeriv (by simp)
  unfold bourFlatOperator
  fun_prop

/-- Absorb the coefficient error on the support of the Hessian. The
constant is at most twice the supplied frozen constant. -/
theorem bourFlatHessianEstimate_perturb [MeasurableSpace E] [BorelSpace E]
    (μ : Measure E) [IsFiniteMeasureOnCompacts μ] (p : ℝ≥0∞) (hp : 1 ≤ p)
    (a : E → Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (a₀ : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (C : ℝ≥0) (hflat : BourFlatHessianEstimate μ p a₀ C)
    (u : E → ℝ) (hu : ContDiff ℝ ∞ u) (hc : HasCompactSupport u) {ε : ℝ}
    (hsmall : (C : ℝ≥0∞) * ENNReal.ofReal ε ≤ 1 / 2)
    (hosc : ∀ᵐ z ∂μ, iteratedFDeriv ℝ 2 u z ≠ 0 → ∑ i, ∑ j,
      ‖a z i j - a₀ i j‖ * ‖chartModelBasis E i‖ * ‖chartModelBasis E j‖ ≤ ε)
    (hM : AEStronglyMeasurable (fun z => bourFlatOperator (a z) u z) μ) :
    eLpNorm (iteratedFDeriv ℝ 2 u) p μ ≤
      (2 * (C : ℝ≥0∞)) * eLpNorm (fun z => bourFlatOperator (a z) u z) p μ := by
  let V := fun z => bourFlatOperator (a z) u z
  let W := bourFlatOperator a₀ u
  let H := eLpNorm (iteratedFDeriv ℝ 2 u) p μ
  let Hvar := eLpNorm V p μ
  have hHs : Continuous (iteratedFDeriv ℝ 2 u) := hu.continuous_iteratedFDeriv (by simp)
  have hH : H ≠ ⊤ :=
    (hHs.memLp_of_hasCompactSupport (hc.iteratedFDeriv 2)).eLpNorm_ne_top
  have hE : eLpNorm (V - W) p μ ≤ ENNReal.ofReal ε * H :=
    bourFlatOperator_sub_eLpNorm_le μ p a a₀ u hosc
      (hM.sub (bourFlatOperator_continuous a₀ u hu).aestronglyMeasurable)
  have hT : eLpNorm W p μ ≤ Hvar + eLpNorm (V - W) p μ := by
    have hW : V - (V - W) = W := sub_sub_cancel V W
    calc
      eLpNorm W p μ = eLpNorm (V - (V - W)) p μ :=
        congrArg (fun f : E → ℝ => eLpNorm f p μ) hW.symm
      _ ≤ _ := eLpNorm_sub_le (f := V) (g := V - W) hp
  have hsum : H ≤ (C : ℝ≥0∞) * Hvar + (1 / 2 : ℝ≥0∞) * H := by
    calc
      H ≤ (C : ℝ≥0∞) * eLpNorm W p μ := hflat u hu hc
      _ ≤ (C : ℝ≥0∞) * (Hvar + ENNReal.ofReal ε * H) := by
        gcongr
        exact hT.trans (by gcongr)
      _ ≤ (C : ℝ≥0∞) * Hvar + (1 / 2 : ℝ≥0∞) * H := by
        rw [mul_add, ← mul_assoc]
        gcongr
  change H ≤ 2 * (C : ℝ≥0∞) * Hvar
  by_cases hV : (C : ℝ≥0∞) * Hvar = ⊤
  · have htwo : (2 : ℝ≥0∞) ≠ 0 := ne_of_gt (by positivity)
    rw [mul_assoc, hV, ENNReal.mul_top htwo]
    exact le_top
  · have hhalf : (1 / 2 : ℝ≥0∞) * H ≠ ⊤ :=
      ENNReal.mul_ne_top (by norm_num) hH
    have hfin : 2 * ((C : ℝ≥0∞) * Hvar) ≠ ⊤ :=
      ENNReal.mul_ne_top (by norm_num) hV
    have hreal := ENNReal.toReal_mono (ENNReal.add_ne_top.mpr ⟨hV, hhalf⟩) hsum
    rw [ENNReal.toReal_add hV hhalf, ENNReal.toReal_mul] at hreal
    rw [mul_assoc, ← ENNReal.toReal_le_toReal hH hfin, ENNReal.toReal_mul]
    norm_num at hreal ⊢
    linarith

/-- Entrywise form of the same estimate for radii frozen in a specified
coordinate frame. The oscillation premise is needed only where the Hessian
of the localized function is nonzero. -/
theorem bourFlatHessianEstimate_perturb_entries [MeasurableSpace E] [BorelSpace E]
    (μ : Measure E) [IsFiniteMeasureOnCompacts μ] (p : ℝ≥0∞) (hp : 1 ≤ p)
    (a : E → Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (a₀ : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (C : ℝ≥0) (hflat : BourFlatHessianEstimate μ p a₀ C)
    (u : E → ℝ) (hu : ContDiff ℝ ∞ u) (hc : HasCompactSupport u) {δ : ℝ}
    (hsmall : (C : ℝ≥0∞) * ENNReal.ofReal (δ * (∑ i, ‖chartModelBasis E i‖) ^ 2) ≤ 1 / 2)
    (hosc : ∀ᵐ z ∂μ, iteratedFDeriv ℝ 2 u z ≠ 0 →
      ∀ i j, ‖a z i j - a₀ i j‖ ≤ δ)
    (hM : AEStronglyMeasurable (fun z => bourFlatOperator (a z) u z) μ) :
    eLpNorm (iteratedFDeriv ℝ 2 u) p μ ≤
      (2 * (C : ℝ≥0∞)) * eLpNorm (fun z => bourFlatOperator (a z) u z) p μ := by
  refine bourFlatHessianEstimate_perturb μ p hp a a₀ C hflat u hu hc hsmall ?_ hM
  filter_upwards [hosc] with z hz
  intro hDz
  calc
    _ ≤ ∑ i, ∑ j, δ * ‖chartModelBasis E i‖ * ‖chartModelBasis E j‖ := by
      exact Finset.sum_le_sum fun i _ => Finset.sum_le_sum fun j _ =>
        mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_right (hz hDz i j) (norm_nonneg _)) (norm_nonneg _)
    _ = _ := by
      simp only [pow_two, Finset.mul_sum, Finset.sum_mul, mul_assoc]
      exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => by ring

/-- Contravariant coefficient transformation under a linear map, in the
actual fixed basis. This is the matrix product (L a L^{\mathsf T}). -/
def bourFlatCoefficientPush (L : E →L[ℝ] E)
    (a : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ) :
    Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ :=
  fun i j => ∑ k, ∑ l, a k l *
    (chartModelBasis E).repr (L (chartModelBasis E k)) i *
    (chartModelBasis E).repr (L (chartModelBasis E l)) j

private theorem eval_in_modelBasis (H : E [×2]→L[ℝ] ℝ) (u v : E) :
    H ![u, v] = ∑ i, ∑ j,
      (chartModelBasis E).repr u i * (chartModelBasis E).repr v j *
        H ![chartModelBasis E i, chartModelBasis E j] := by
  let b := chartModelBasis E
  have hU (x y z : E) : Function.update (![x, y] : Fin 2 → E) 0 z = ![z, y] := by
    funext k
    fin_cases k <;> rfl
  have hV (x y z : E) : Function.update (![x, y] : Fin 2 → E) 1 z = ![x, z] := by
    funext k
    fin_cases k <;> rfl
  have hLeft (w v' : E) :
      H ![w, v'] = ∑ i, b.repr w i * H ![b i, v'] := by
    have h := H.toMultilinearMap.map_update_sum Finset.univ (0 : Fin 2)
      (fun i => b.repr w i • b i) (![w, v'] : Fin 2 → E)
    change H (Function.update (![w, v'] : Fin 2 → E) 0 (∑ i, b.repr w i • b i)) =
      ∑ i, H (Function.update (![w, v'] : Fin 2 → E) 0 (b.repr w i • b i)) at h
    rw [b.sum_repr w] at h
    calc
      _ = ∑ i, H (Function.update (![w, v'] : Fin 2 → E) 0 (b.repr w i • b i)) :=
        (congrArg (fun v => H v) (hU w v' w).symm).trans h
      _ = _ := Finset.sum_congr rfl fun i _ => by
        rw [H.map_update_smul, hU, smul_eq_mul]
  have hRight (w v' : E) :
      H ![w, v'] = ∑ j, b.repr v' j * H ![w, b j] := by
    have h := H.toMultilinearMap.map_update_sum Finset.univ (1 : Fin 2)
      (fun j => b.repr v' j • b j) (![w, v'] : Fin 2 → E)
    change H (Function.update (![w, v'] : Fin 2 → E) 1 (∑ j, b.repr v' j • b j)) =
      ∑ j, H (Function.update (![w, v'] : Fin 2 → E) 1 (b.repr v' j • b j)) at h
    rw [b.sum_repr v'] at h
    calc
      _ = ∑ j, H (Function.update (![w, v'] : Fin 2 → E) 1 (b.repr v' j • b j)) :=
        (congrArg (fun v => H v) (hV w v' v').symm).trans h
      _ = _ := Finset.sum_congr rfl fun j _ => by
        rw [H.map_update_smul, hV, smul_eq_mul]
  rw [hLeft]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [hRight, Finset.mul_sum]
  exact Finset.sum_congr rfl fun j _ => by ring

private theorem sum_reorder_four {ι : Type*} [Fintype ι] (f : ι → ι → ι → ι → ℝ) :
    (∑ i, ∑ j, ∑ k, ∑ l, f i j k l) = ∑ k, ∑ l, ∑ i, ∑ j, f i j k l := by
  calc
    _ = ∑ i, ∑ k, ∑ j, ∑ l, f i j k l :=
      Finset.sum_congr rfl fun i _ => Finset.sum_comm
    _ = ∑ k, ∑ i, ∑ j, ∑ l, f i j k l := Finset.sum_comm
    _ = ∑ k, ∑ i, ∑ l, ∑ j, f i j k l := by
      exact Finset.sum_congr rfl fun k _ => Finset.sum_congr rfl fun i _ => Finset.sum_comm
    _ = _ := Finset.sum_congr rfl fun k _ => Finset.sum_comm

/-- Chain rule for the frozen principal contraction, with the transformed
coefficient computed from the chosen linear map. -/
theorem bourFlatOperator_comp_right (L : E →L[ℝ] E)
    (a : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (u : E → ℝ) (hu : ContDiff ℝ ∞ u) (z : E) :
    bourFlatOperator a (u ∘ L) z = bourFlatOperator (bourFlatCoefficientPush L a) u (L z) := by
  unfold bourFlatOperator
  rw [L.iteratedFDeriv_comp_right (i := 2) hu z (by simp)]
  let H := iteratedFDeriv ℝ 2 u (L z)
  let b := chartModelBasis E
  have hvec (i j : Fin (Module.finrank ℝ E)) :
      (fun p : Fin 2 => L ((![b i, b j] : Fin 2 → E) p)) = ![L (b i), L (b j)] := by
    funext p
    fin_cases p <;> rfl
  have hEval (i j : Fin (Module.finrank ℝ E)) :
      H ![L (b i), L (b j)] = ∑ k, ∑ l, b.repr (L (b i)) k * b.repr (L (b j)) l *
        H ![b k, b l] := eval_in_modelBasis H _ _
  change (∑ i, ∑ j, a i j * (H.compContinuousLinearMap fun _ => L) ![b i, b j]) = _
  simp only [ContinuousMultilinearMap.compContinuousLinearMap_apply, hvec, hEval]
  unfold bourFlatCoefficientPush
  calc
    _ = ∑ k, ∑ l, ∑ i, ∑ j, a k l * b.repr (L (b k)) i * b.repr (L (b l)) j * H ![b i, b j] := by
      simp only [Finset.mul_sum, mul_assoc, H, b]
    _ = ∑ i, ∑ j, ∑ k, ∑ l, a k l * b.repr (L (b k)) i * b.repr (L (b l)) j * H ![b i, b j] :=
      sum_reorder_four _
    _ = _ := by simp only [Finset.sum_mul, H, b]

private theorem eLpNorm_comp_continuousLinearEquiv {F : Type*} [NormedAddCommGroup F]
    [MeasurableSpace E] [BorelSpace E] (μ : Measure E) [IsAddHaarMeasure μ]
    (p : ℝ≥0∞) (hp₀ : p ≠ 0) (hpTop : p ≠ ⊤) (L : E ≃L[ℝ] E) (f : E → F) :
    eLpNorm (f ∘ L) p μ =
      (ENNReal.ofReal |(LinearMap.det L.toLinearEquiv.toLinearMap)⁻¹|) ^
        (1 / p).toReal * eLpNorm f p μ := by
  have hdet := L.toLinearEquiv.isUnit_det'.ne_zero
  have hmap := map_linearMap_addHaar_eq_smul_addHaar μ hdet
  have he : MeasurableEmbedding L := L.toHomeomorph.toMeasurableEquiv.measurableEmbedding
  rw [← he.eLpNorm_map_measure]
  change eLpNorm f p (Measure.map L.toLinearEquiv.toLinearMap μ) = _
  rw [hmap, eLpNorm_smul_measure_of_ne_zero_of_ne_top hp₀ hpTop]
  rfl

private theorem flatEstimate_transfer [MeasurableSpace E] [BorelSpace E]
    (μ : Measure E) [IsAddHaarMeasure μ] (p : ℝ≥0∞) (hp₀ : p ≠ 0) (hpTop : p ≠ ⊤)
    (L : E ≃L[ℝ] E)
    (P₀ P₁ : (E → ℝ) → E → ℝ) (C : ℝ≥0∞)
    (hP : ∀ u : E → ℝ, ContDiff ℝ ∞ u → P₀ (u ∘ L) = P₁ u ∘ L)
    (hflat : ∀ u : E → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) p μ ≤ C * eLpNorm (P₀ u) p μ)
    (u : E → ℝ) (hu : ContDiff ℝ ∞ u) (hc : HasCompactSupport u) :
    eLpNorm (iteratedFDeriv ℝ 2 u) p μ ≤
      (ENNReal.ofReal (‖L.symm.toContinuousLinearMap‖ ^ 2) * C) *
        eLpNorm (P₁ u) p μ := by
  let V := fun z => iteratedFDeriv ℝ 2 u (L z)
  let W := iteratedFDeriv ℝ 2 (u ∘ L)
  let P := P₁ u
  let c := ENNReal.ofReal (‖L.symm.toContinuousLinearMap‖ ^ 2)
  let d := ENNReal.ofReal |(LinearMap.det L.toLinearEquiv.toLinearMap)⁻¹|
  let k := d ^ (1 / p).toReal
  have hd₀ : 0 < d :=
    ENNReal.ofReal_pos.mpr (abs_pos.mpr (inv_ne_zero L.toLinearEquiv.isUnit_det'.ne_zero))
  have hdTop : d ≠ ⊤ := ENNReal.ofReal_ne_top
  have hk₀ : k ≠ 0 := (ENNReal.rpow_pos hd₀ hdTop).ne'
  have hkTop : k ≠ ⊤ := ENNReal.rpow_ne_top_of_nonneg ENNReal.toReal_nonneg hdTop
  have hcont : Continuous V :=
    (hu.continuous_iteratedFDeriv (by simp)).comp L.continuous
  have hcoords (z : E) :
      V z = (W z).compContinuousLinearMap (fun _ => L.symm.toContinuousLinearMap) := by
    change iteratedFDeriv ℝ 2 u (L z) =
      (iteratedFDeriv ℝ 2 (u ∘ L.toContinuousLinearMap) z).compContinuousLinearMap
        (fun _ => L.symm.toContinuousLinearMap)
    rw [L.toContinuousLinearMap.iteratedFDeriv_comp_right (i := 2) hu z (by simp)]
    ext v
    simp only [ContinuousMultilinearMap.compContinuousLinearMap_apply,
      ContinuousLinearEquiv.coe_coe, ContinuousLinearEquiv.apply_symm_apply]
  have hnorm : eLpNorm V p μ ≤ c * eLpNorm W p μ := by
    apply eLpNorm_le_mul_eLpNorm_of_ae_le_mul hcont.aestronglyMeasurable _ p
    apply Filter.Eventually.of_forall
    intro z
    have h := (W z).norm_compContinuousLinearMap_le (fun _ => L.symm.toContinuousLinearMap)
    rw [hcoords z]
    simpa only [Fin.prod_univ_two, ← pow_two, mul_comm] using h
  have hPl : P₀ (u ∘ L) = P ∘ L := hP u hu
  have hflat' := hflat (u ∘ L) (hu.comp L.contDiff) (hc.comp_homeomorph L.toHomeomorph)
  rw [hPl] at hflat'
  have hCompare : eLpNorm V p μ ≤ c * (C * eLpNorm (P ∘ L) p μ) :=
    hnorm.trans (by gcongr)
  have hV : eLpNorm V p μ = k * eLpNorm (iteratedFDeriv ℝ 2 u) p μ :=
    eLpNorm_comp_continuousLinearEquiv μ p hp₀ hpTop L _
  have hP : eLpNorm (P ∘ L) p μ = k * eLpNorm P p μ :=
    eLpNorm_comp_continuousLinearEquiv μ p hp₀ hpTop L _
  rw [hV, hP] at hCompare
  apply (ENNReal.mul_le_mul_iff_right hk₀ hkTop).mp
  calc
    _ ≤ c * (C * (k * eLpNorm P p μ)) := hCompare
    _ = k * ((c * C) * eLpNorm P p μ) := by ac_rfl

/-- Transfer a flat estimate through an invertible linear map. The same
Haar Jacobian occurs in both norms. The surviving factor is the square of
the inverse map norm, from its action on the two derivative slots. -/
theorem bourFlatHessianEstimate_push [MeasurableSpace E] [BorelSpace E]
    (μ : Measure E) [IsAddHaarMeasure μ] (p : ℝ≥0∞) (hp₀ : p ≠ 0) (hpTop : p ≠ ⊤)
    (L : E ≃L[ℝ] E)
    (a : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (C : ℝ≥0∞) (hflat : BourFlatHessianEstimate μ p a C) :
    BourFlatHessianEstimate μ p (bourFlatCoefficientPush L.toContinuousLinearMap a)
      (ENNReal.ofReal (‖L.symm.toContinuousLinearMap‖ ^ 2) * C) :=
  flatEstimate_transfer μ p hp₀ hpTop L (bourFlatOperator a)
    (bourFlatOperator (bourFlatCoefficientPush L.toContinuousLinearMap a)) C
    (fun u hu => funext (bourFlatOperator_comp_right L.toContinuousLinearMap a u hu)) hflat

section Metric

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- Reduce the actual frozen inverse Gram of a metric on the model space
to the single Euclidean Laplacian estimate. The inverse linear
normalization costs the upper metric form factor (L^2). -/
theorem bourFlatHessianEstimate_metricFrozen [MeasurableSpace E] [BorelSpace E]
    (μ : Measure E) [IsAddHaarMeasure μ] (p : ℝ≥0∞) (hp₀ : p ≠ 0) (hpTop : p ≠ ⊤)
    (G : SmoothRiemannianMetric 𝓘(ℝ, E) E) (z : E) {L : ℝ} (hL : 0 ≤ L)
    (hform : ∀ v : E, G.inner z v v ≤ L ^ 2 * ‖v‖ ^ 2)
    (C : ℝ≥0∞)
    (hLap : ∀ u : E → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) p μ ≤ C * eLpNorm (Δ u) p μ) :
    BourFlatHessianEstimate μ p (fun i j => chartInvGramOnE G 0 i j z)
      (ENNReal.ofReal (L ^ 2) * C) := by
  classical
  let o := stdOrthonormalBasis ℝ E
  let T : E ≃L[ℝ] E :=
    o.repr.toContinuousLinearEquiv.trans (metricEuclideanFrame G z)
  have hiso (v w : E) : G.inner z (T v) (T w) = ⟪v, w⟫_ℝ := by
    change G.inner z (metricEuclideanFrame G z (o.repr v))
      (metricEuclideanFrame G z (o.repr w)) = _
    rw [metricEuclideanFrame_inner, o.repr.inner_map_map]
  have hT : ‖T.symm.toContinuousLinearMap‖ ≤ L := by
    refine ContinuousLinearMap.opNorm_le_bound _ hL fun v => ?_
    have hi := hiso (T.symm v) (T.symm v)
    rw [T.apply_symm_apply, real_inner_self_eq_norm_sq] at hi
    have hh := hform v
    rw [hi, ← mul_pow] at hh
    change ‖T.symm v‖ ≤ L * ‖v‖
    exact le_of_sq_le_sq hh (mul_nonneg hL (norm_nonneg _))
  let a : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ :=
    fun i j => chartInvGramOnE G 0 i j z
  have hpoint (u : E → ℝ) (hu : ContDiff ℝ ∞ u) :
      Δ (u ∘ T) = bourFlatOperator a u ∘ T := by
    funext x
    rw [InnerProductSpace.laplacian_eq_iteratedFDeriv_stdOrthonormalBasis]
    change (∑ i, iteratedFDeriv ℝ 2 (u ∘ T.toContinuousLinearMap) x ![o i, o i]) =
      bourFlatOperator a u (T x)
    rw [T.toContinuousLinearMap.iteratedFDeriv_comp_right (i := 2) hu x (by simp)]
    let H := iteratedFDeriv ℝ 2 u (T x)
    have hv (i : Fin (Module.finrank ℝ E)) :
        (fun j : Fin 2 => T ((![o i, o i] : Fin 2 → E) j)) = ![T (o i), T (o i)] := by
      funext j
      fin_cases j <;> rfl
    change (∑ i, (H.compContinuousLinearMap fun _ => T.toContinuousLinearMap) ![o i, o i]) = _
    simp only [ContinuousMultilinearMap.compContinuousLinearMap_apply,
      ContinuousLinearEquiv.coe_coe, hv]
    let b := o.toBasis.map T.toLinearEquiv
    have hbo (i j : Fin (Module.finrank ℝ E)) :
        G.inner z (b i) (b j) = if i = j then 1 else 0 := by
      change G.inner z (T (o i)) (T (o j)) = _
      rw [hiso]
      exact o.inner_eq_ite i j
    have hinv := metricInverseInBasis_identity_of_orthonormal G b hbo
    have hx : z ∈ (trivializationAt E (TangentSpace 𝓘(ℝ, E)) (0 : E)).baseSet := by
      rw [trivializationAt_baseSet_eq_chartAt_source]
      exact mem_univ _
    let c := chartBasisFamily (I := 𝓘(ℝ, E)) (0 : E) hx
    have hc (i : Fin (Module.finrank ℝ E)) : c i = chartModelBasis E i := by
      rw [show c i = chartBasisVecFiber (I := 𝓘(ℝ, E)) (0 : E) i z from
        chartBasisFamily_apply (I := 𝓘(ℝ, E)) _ _ _]
      simp only [chartBasisVecFiber, TangentBundle.symmL_model_space]
      rfl
    have hcInv : MetricInverseInBasis G z c a := by
      have hz : (extChartAt 𝓘(ℝ, E) (0 : E)).symm z = z := by
        rw [extChartAt_model_space_eq_id]
        rfl
      have h := chartInvGram_inverse G (0 : E) hx
      simpa only [a, chartInvGramOnE_def, hz] using h
    let Q : Tensor0SSpace (𝕜 := ℝ) 2 𝓘(ℝ, E) z := H
    have hA : metricTracePair0SAt G Q =
        ∑ i, ∑ j, identityInvMetric i j * H ![T (o i), T (o j)] := by
      refine (metricTracePair0SAt_eq_sum_basis G b _ hinv Q).trans ?_
      refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
      congr 1
      change H _ = H _
      apply congrArg H
      funext q
      fin_cases q <;> rfl
    have hB : metricTracePair0SAt G Q =
        ∑ i, ∑ j, a i j * H ![chartModelBasis E i, chartModelBasis E j] := by
      refine (metricTracePair0SAt_eq_sum_basis G c a hcInv Q).trans ?_
      refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
      congr 1
      change H _ = H _
      apply congrArg H
      rw [← hc i, ← hc j]
      funext q
      fin_cases q <;> rfl
    rw [hB] at hA
    rw [bourFlatOperator]
    simpa [identityInvMetric, diagonalInvMetric, ite_mul] using hA.symm
  intro u hu hcompact
  have h := flatEstimate_transfer μ p hp₀ hpTop T (fun u : E → ℝ => Δ u)
    (bourFlatOperator a) C hpoint hLap u hu hcompact
  refine h.trans ?_
  gcongr

end Metric
end
end SmoothPoincare.Bour
