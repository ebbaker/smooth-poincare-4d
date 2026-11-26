import DifferentialGeometry.Analysis.Elliptic.ConnectionLaplacian.Garding.FirstDerivativeBound
import DifferentialGeometry.Analysis.Integration.L2.Hilbert.DenseSubset
import SmoothPoincare.Variational.BourAttainedVariation

/-!
# The attained Einstein spectral test and the round control

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings were unavailable. Edition 06, E49, Route 07.
The round curvature contraction and closed Green estimate use the physical unit
round metric. Application to a Weyl variation uses the physical Hessian equality
as a premise. See the E49 note for the identification with the Einstein Hessian
and the independent sharp round calculation.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Analysis.Elliptic
open DifferentialGeometry.Analysis.Parabolic.TensorSpectral
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.L2
open FirstOrderTwistor
open scoped ContDiff Manifold RealInnerProductSpace

namespace SmoothPoincare

/-- The coefficient of the squared physical L² norm of a TT eigentensor in
the single-chirality Weyl Hessian in the operator norm convention. -/
def einsteinWeylTTFactor (s eigenvalue : ℝ) : ℝ :=
  (eigenvalue - s / 2) * (eigenvalue - s / 3) / 8

theorem einsteinWeylTTFactor_neg_iff {s eigenvalue : ℝ} (hs : 0 < s) :
    einsteinWeylTTFactor s eigenvalue < 0 ↔ s / 3 < eigenvalue ∧ eigenvalue < s / 2 := by
  unfold einsteinWeylTTFactor
  rw [div_neg_iff]
  constructor
  · rintro (⟨h, _⟩ | ⟨_, h⟩)
    · rcases mul_neg_iff.mp h with h | h <;> constructor <;> linarith [h.1, h.2]
    · norm_num at h
  · rintro ⟨hLower, hUpper⟩
    exact Or.inl ⟨mul_neg_of_neg_of_pos (sub_neg.mpr hUpper) (sub_pos.mpr hLower), by norm_num⟩

theorem einsteinWeylTTFactor_endpoints (s : ℝ) :
    einsteinWeylTTFactor s (s / 3) = 0 ∧ einsteinWeylTTFactor s (s / 2) = 0 := by
  simp [einsteinWeylTTFactor]

section Variation

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

/-- A supplied physical TT Hessian on a positive two-sided path gives
same-type descent for every strict step bound when the mode lies in the open window. -/
theorem bourStrictTTWindowExcludesAttainment (v : BourPositiveMetricVariation o)
    (sign : CollarChirality) {s eigenvalue normSq : ℝ} (hs : 0 < s) (hMode : 0 < normSq)
    (hWindow : s / 3 < eigenvalue ∧ eigenvalue < s / 2)
    (hHessian : deriv (deriv (fun t => (v.path t).energy sign)) 0 =
      einsteinWeylTTFactor s eigenvalue * normSq) :
    (v.path 0).energy .plus ≠ sInf (geometricPositiveEnergies o) ∧
      ∀ ε > 0, ∃ t ∈ v.domain.regular, |t| < ε ∧
        0 < classYamabeFour o.dimension_eq (v.path t).metric ∧
          ∀ chirality, (v.path t).energy chirality < (v.path 0).energy chirality := by
  apply bourNegativeSecondVariationExcludesAttainment v sign
  rw [hHessian]
  exact mul_neg_of_neg_of_pos ((einsteinWeylTTFactor_neg_iff hs).mpr hWindow) hMode

end Variation

section Round

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

/-- In the operator frame convention, the curvature action `R_{ipjq} h_{pq}`
on a symmetric trace-free tensor equals `-h` at each point of the unit round metric. -/
theorem standardRoundFour_curvatureAction_traceFree
    (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4) (x : StandardFourSphere)
    (frame : OrientedOrthonormalFrameAt standardRoundFourMetric o x)
    (h : Fin 4 → Fin 4 → ℝ) (hSymm : ∀ i j, h i j = h j i)
    (hTrace : ∑ i, h i i = 0) (i j : Fin 4) :
    (∑ p, ∑ q, metricCurvatureFrameTensor standardRoundFourMetric o x frame i p j q * h p q) =
      -h i j := by
  rw [standardRoundFour_curvatureFrameTensor]
  change (∑ p : Fin 4, ∑ q : Fin 4,
    1 * ((if i = j then 1 else 0) * (if p = q then 1 else 0) -
      (if i = q then 1 else 0) * (if p = j then 1 else 0)) * h p q) = -h i j
  simp only [one_mul, sub_mul, Finset.sum_sub_distrib, ite_mul, zero_mul]
  simp [hTrace, hSymm j i, eq_comm]

/-- The scalar curvature in the unit round eigenvalue calculation is 12. -/
theorem standardRoundFour_scalar_eq_twelve (x : StandardFourSphere) :
    metricScalarAt standardRoundFourMetric x = 12 := by
  have hdim : Module.finrank ℝ (EuclideanSpace ℝ (Fin 4)) = 4 := by simp
  have h := DifferentialGeometry.Geometry.Riemannian.metricScalarAt_of_constant_sectional
    standardRoundFourMetric x 1
    (fun u v => by simpa only [one_mul, pow_two] using
      DifferentialGeometry.Geometry.roundMetric_sec_value x u v)
  norm_num [hdim] at h
  exact h

/-- The negative Lichnerowicz Laplacian restricted to trace-free symmetric
two-tensors of the physical unit round sphere. The curvature contraction adds
`2h`, and the two Ricci terms add `6h`, to the negative rough Laplacian. -/
def standardRoundFour_negLichnerowiczOnTraceFree
    (h : SmoothCcTensor standardRoundFourMetric 0 2) :
    SmoothCcTensor standardRoundFourMetric 0 2 :=
  (8 : ℝ) • h - rawTensorConnLapSmooth standardRoundFourMetric 0 2 h

/-- The closed Green identity gives the spectral floor of the shifted round
operator already on arbitrary smooth two-tensors. -/
theorem standardRoundFour_negLichnerowicz_eigenvalue_ge_eight
    (h : SmoothCcTensor standardRoundFourMetric 0 2) (hNe : h ≠ 0) {eigenvalue : ℝ}
    (hMode : standardRoundFour_negLichnerowiczOnTraceFree h = eigenvalue • h) : 8 ≤ eigenvalue := by
  let g := standardRoundFourMetric
  let Δh := rawTensorConnLapSmooth g 0 2 h
  have hGreen := tensorL2Inner_covGrad_self_eq_neg_rawConnLap_inner g h
  have hGrad := tensorL2Inner_nonneg g 0 (2 + 1) (covGrad g 0 2 h).toFun
  have hΔ : 0 ≤ - ⟪Δh, h⟫_ℝ := by
    rw [SmoothCcTensor.inner_def]
    exact hGreen ▸ hGrad
  have hL2 : SmoothCcTensor.toL2 h ≠ 0 := by
    intro hZero
    apply hNe
    apply SmoothCcTensor.smoothCcTensor_eq_of_toL2_eq
    rw [hZero, map_zero]
  have hNorm : 0 < ⟪h, h⟫_ℝ := by
    rw [← SmoothCcTensor.inner_toL2]
    exact inner_self_pos.mpr hL2
  have hPair := congrArg (fun k : SmoothCcTensor g 0 2 => ⟪k, h⟫_ℝ) hMode
  change ⟪(8 : ℝ) • h - Δh, h⟫_ℝ = ⟪eigenvalue • h, h⟫_ℝ at hPair
  rw [inner_sub_left, real_inner_smul_left, real_inner_smul_left] at hPair
  by_contra! hLt
  have hProduct := mul_pos (sub_pos.mpr hLt) hNorm
  nlinarith only [hPair, hΔ, hProduct]

/-- The closed Green lower bound already gives a strictly positive Hessian
coefficient for every nonzero mode of the round trace-free operator. -/
theorem standardRoundFour_TTMode_weylFactor_ge_one
    (h : SmoothCcTensor standardRoundFourMetric 0 2) (hNe : h ≠ 0) {eigenvalue : ℝ}
    (hMode : standardRoundFour_negLichnerowiczOnTraceFree h = eigenvalue • h) :
    1 ≤ einsteinWeylTTFactor 12 eigenvalue := by
  have heigenvalue := standardRoundFour_negLichnerowicz_eigenvalue_ge_eight h hNe hMode
  have hProduct : 0 ≤ (eigenvalue - 8) * (eigenvalue - 2) :=
    mul_nonneg (sub_nonneg.mpr heigenvalue) (sub_nonneg.mpr (by linarith))
  unfold einsteinWeylTTFactor
  nlinarith only [heigenvalue, hProduct]

end Round

end SmoothPoincare
