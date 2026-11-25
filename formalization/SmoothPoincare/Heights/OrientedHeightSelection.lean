import SmoothPoincare.Heights.IntegratedSelection
import SmoothPoincare.Heights.OrientedIndexedMean

/-! # Subcritical selection for the actual oriented immersion -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped BigOperators ContDiff Manifold

namespace SmoothPoincare

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "μₛ" => normalizedGaussDirections gaussRoundArea (8 * Real.pi ^ 2 / 3)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M}

/-- The actual height is smooth and all its critical points are nondegenerate. -/
def IsMorseHeightDirection (F : IsometricHypersurface g) (u : GaussDirection) : Prop :=
  ContMDiff I 𝓘(ℝ, ℝ) ∞ (immersionHeight F (u : V₅)) ∧
    ∀ x, IsCriticalPointAt I (immersionHeight F (u : V₅)) x →
      IsNondegenerateCriticalPointAt I (immersionHeight F (u : V₅)) x

/-- Directions giving a Morse height with exactly two middle critical points
    on the smooth immersion domain. -/
def morseTwoMiddleDirections (F : IsometricHypersurface g) : Set GaussDirection :=
  {u | IsMorseHeightDirection F u ∧ (indexedHeightTwoPoints F u).Finite ∧
    (indexedHeightTwoPoints F u).ncard = 2}

variable [PolishSpace M] [Nonempty M] [CompactSpace M]
  (F : IsometricHypersurface g) (o : ManifoldOrientation I M 4)
  (a : OrthonormalBasis (Fin 5) ℝ V₅)

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

set_option quotPrecheck false

local notation "Pₛ" => orientedPrincipalFrameAt F o a
local notation "Uₛ" => {x : M | HasMiddlePrincipalSignature ((Pₛ) x).curvature}
local notation "Jₛ" => (fun x : M => |∏ i, ((Pₛ) x).curvature i|)
local notation "Wₛ" => (fun x : M => geometricChiralBlock g o x ((Pₛ) x).frame)
local notation "dV" => riemannianVolumeMeasure I M g
local notation "m₂" => (fun u : GaussDirection => (indexedHeightTwoPoints F u).ncard)

private theorem orientedMiddle_weyl_bound :
    ∀ x ∈ Uₛ, (8 / 3 : ℝ) * Jₛ x ≤ hilbertSchmidtSq (Wₛ x) := by
  intro x hx
  let P := Pₛ x
  obtain ⟨h₀, h₁, h₂, h₃⟩ := orientedPrincipalFrameAt_middle_order F o a x hx
  have hP : P.curvature = ![-(-P.curvature 0), -(-P.curvature 1), P.curvature 2,
      P.curvature 3] := by
    ext i
    fin_cases i <;> simp
  have hW := (inducedMiddleWeylBound P hP (neg_pos.mpr h₀) (neg_pos.mpr h₁) h₂ h₃).1
  have hJ : Jₛ x = -P.curvature 0 * -P.curvature 1 * P.curvature 2 * P.curvature 3 := by
    change |∏ i, P.curvature i| = _
    rw [Fin.prod_univ_four, abs_of_pos (mul_pos (mul_pos (mul_pos_of_neg_of_neg h₀ h₁) h₂) h₃)]
    ring
  rwa [hJ]

/-- With the topological floor on finite Morse counts, the strict induced
    chiral energy bound gives ordinary round probability above three quarters
    of Morse directions with exactly two middle critical points. -/
theorem orientedHeight_prob_morse_twoMiddle_of_subcritical_energy
    (hW : Integrable (fun x => hilbertSchmidtSq (Wₛ x)) dV)
    (hfloor : ∀ u, IsMorseHeightDirection F u → (indexedHeightTwoPoints F u).Finite →
      2 ≤ m₂ u)
    (hE : chiralFrameEnergy g Wₛ < 8 * Real.pi ^ 2) :
    IsProbabilityMeasure μₛ ∧ NullMeasurableSet (morseTwoMiddleDirections F) μₛ ∧
      (3 / 4 : ℝ) < (μₛ).real (morseTwoMiddleDirections F) := by
  obtain ⟨hm, hfinite, hprob, hmInt, hmean⟩ := orientedImmersion_indexedGaussMean g F o a
  let : IsProbabilityMeasure μₛ := hprob
  let regular : Set GaussDirection :=
    {u | IsMorseHeightDirection F u ∧ (indexedHeightTwoPoints F u).Finite}
  have hregular : ∀ᵐ u ∂μₛ, u ∈ regular := by
    filter_upwards [orientedHeight_ae_nondegenerate F o a, hfinite] with u hu hfu
    exact ⟨hu, hfu⟩
  have hfloorAE : ∀ᵐ u ∂μₛ, 2 ≤ m₂ u :=
    hregular.mono fun u hu => hfloor u hu.1 hu.2
  have hdetInt := (orientedGauss_absProduct_continuous_integrable g F o a Pₛ).2.integrableOn
    (s := Uₛ)
  have hU := (isOpen_middlePrincipalLocus Pₛ).measurableSet
  have hcount : (3 / 4 : ℝ) < (μₛ).real {u | m₂ u = 2} :=
    (prob_and_exists_regular_twoMiddle_of_subcritical_energy g o
      (fun x => ((Pₛ) x).frame) Uₛ Jₛ μₛ m₂ hU hW hdetInt
      (orientedMiddle_weyl_bound F o a) hmean hm hmInt hfloorAE hE regular hregular
      (fun _ => Unit) (fun _ _ _ => ⟨()⟩)).1
  have hevent : morseTwoMiddleDirections F =ᵐ[μₛ] {u | m₂ u = 2} := by
    filter_upwards [hregular] with u hu
    change (IsMorseHeightDirection F u ∧ (indexedHeightTwoPoints F u).Finite ∧ m₂ u = 2) ↔
      m₂ u = 2
    exact ⟨fun he => he.2.2, fun he => ⟨hu.1, hu.2, he⟩⟩
  have hMeas : MeasurableSet {u | m₂ u = 2} := hm (measurableSet_singleton 2)
  refine ⟨hprob, hMeas.nullMeasurableSet.congr hevent.symm, ?_⟩
  rwa [measureReal_congr hevent]

/-- The selected direction carries the supplied data for its own height. -/
theorem orientedHeight_exists_morse_twoMiddle_with_data_of_subcritical_energy
    (hW : Integrable (fun x => hilbertSchmidtSq (Wₛ x)) dV)
    (hfloor : ∀ u, IsMorseHeightDirection F u → (indexedHeightTwoPoints F u).Finite →
      2 ≤ m₂ u)
    (hE : chiralFrameEnergy g Wₛ < 8 * Real.pi ^ 2)
    (Data : GaussDirection → Type*) (hdata : ∀ u ∈ morseTwoMiddleDirections F, Nonempty (Data u)) :
    ∃ u ∈ morseTwoMiddleDirections F, Nonempty (Data u) := by
  obtain ⟨_, _, hp⟩ := orientedHeight_prob_morse_twoMiddle_of_subcritical_energy F o a hW hfloor hE
  have hne : (morseTwoMiddleDirections F).Nonempty := by
    by_contra! hempty
    rw [hempty, measureReal_empty] at hp
    norm_num at hp
  obtain ⟨u, hu⟩ := hne
  exact ⟨u, hu, hdata u hu⟩

end SmoothPoincare
