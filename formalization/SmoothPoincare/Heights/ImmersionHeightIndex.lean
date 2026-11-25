import SmoothPoincare.Immersions.ImmersionChart
import SmoothPoincare.Heights.PrincipalIndex
import DifferentialGeometry.Topology.Morse.Strip.Defs

/-! # Morse index of an actual immersed height -/

open DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open FirstOrderTwistor Manifold
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
  {o : ManifoldOrientation I M 4} {p : M}

omit [FiniteDimensional ℝ E] in
private theorem immersionHeight_chart_contDiffAt (v : EuclideanSpace ℝ (Fin 5)) :
    ContDiffAt ℝ 2 (fun z => immersionHeight F v ((extChartAt I p).symm z))
      (extChartAt I p p) := by
  let L := innerSL ℝ v
  let f := F.localMap p
  have hfun : (fun z => immersionHeight F v ((extChartAt I p).symm z)) = L ∘ f := by
    funext z
    simp [immersionHeight, L, f, writtenInExtChartAt]
  have h := (contMDiffAt_iff.mp (F.smooth.contMDiffAt (x := p))).2
  rw [ModelWithCorners.Boundaryless.range_eq_univ, contDiffWithinAt_univ] at h
  have hf : ContDiffAt ℝ 2 f (extChartAt I p p) := h.of_le (by decide : (2 : ℕ∞ω) ≤ ∞)
  rw [hfun]
  exact L.contDiff.contDiffAt.comp (extChartAt I p p) hf

private theorem principalHeight_morseData (P : PrincipalFrameAt F o p) (s : ℝ) :
    morseIndex I (immersionHeight F (s • P.normal)) p = {i | s * P.curvature i < 0}.ncard ∧
    ((∀ i, s * P.curvature i ≠ 0) →
      IsNondegenerateCriticalPointAt I (immersionHeight F (s • P.normal)) p) := by
  let f := immersionHeight F (s • P.normal)
  let Q := hessianAt I f p
  let B := chartHessianBilinAt (fun z => f ((extChartAt I p).symm z)) (extChartAt I p p)
  let b : Module.Basis (Fin 4) ℝ E := P.frame.basis
  let k := fun i => s * P.curvature i
  have hQ (v : E) : Q v = B v v := rfl
  have hSmooth := immersionHeight_chart_contDiffAt (F := F) (p := p) (s • P.normal)
  have hSymmetric : LinearMap.IsSymm B :=
    ⟨fun u v => (hSmooth.isSymmSndFDerivAt (by norm_num)).eq u v⟩
  have hDiagonal (i j : Fin 4) : B (b i) (b j) = if i = j then k i else 0 :=
    principalHeight_hessian P s i j
  refine ⟨(principalQuadratic_signature Q B b k hQ hSymmetric hDiagonal).1, ?_⟩
  intro hk
  refine ⟨(immersionHeight_critical_iff F (s • P.normal)).2 ?_, ?_⟩
  · intro u
    let v : EuclideanSpace ℝ (Fin 5) :=
      mfderiv I 𝓘(ℝ, EuclideanSpace ℝ (Fin 5)) F.map p u
    change inner ℝ (s • P.normal) v = 0
    rw [real_inner_smul_left]
    exact mul_eq_zero_of_right _ (P.perpendicular u)
  · change (QuadraticMap.associated (R := ℝ) Q).SeparatingLeft
    rw [principalQuadratic_associated_eq Q B hQ hSymmetric]
    exact (principalQuadratic_nondegenerate Q B b k hQ hSymmetric hDiagonal hk).2.2.1

/-- The Morse index of the actual height in a scaled principal-normal
direction equals the number of negative signed principal curvatures. -/
theorem principalHeight_morseIndex (P : PrincipalFrameAt F o p) (s : ℝ) :
    morseIndex I (immersionHeight F (s • P.normal)) p = {i | s * P.curvature i < 0}.ncard :=
  (principalHeight_morseData P s).1

/-- If the scaled principal curvatures are nonzero, the actual height
has a nondegenerate critical point on the smooth immersion domain. -/
theorem principalHeight_nondegenerateCritical (P : PrincipalFrameAt F o p) (s : ℝ)
    (hk : ∀ i, s * P.curvature i ≠ 0) :
    IsNondegenerateCriticalPointAt I (immersionHeight F (s • P.normal)) p :=
  (principalHeight_morseData P s).2 hk

/-- On the ordered signature-two locus both unit-normal heights are
nondegenerate critical points of Morse index two. -/
theorem principalHeight_twoMiddle_bothNormals (P : PrincipalFrameAt F o p)
    (h₀ : P.curvature 0 < 0) (h₁ : P.curvature 1 < 0)
    (h₂ : 0 < P.curvature 2) (h₃ : 0 < P.curvature 3) :
    (IsNondegenerateCriticalPointAt I (immersionHeight F P.normal) p ∧
      morseIndex I (immersionHeight F P.normal) p = 2) ∧
    (IsNondegenerateCriticalPointAt I (immersionHeight F (-P.normal)) p ∧
      morseIndex I (immersionHeight F (-P.normal)) p = 2) := by
  have hk (i : Fin 4) : P.curvature i ≠ 0 := by
    fin_cases i
    · exact h₀.ne
    · exact h₁.ne
    · exact h₂.ne'
    · exact h₃.ne'
  have hNegative : {i | P.curvature i < 0} = ({0, 1} : Set (Fin 4)) := by
    ext i
    fin_cases i <;> simp [h₀, h₁, not_lt_of_ge h₂.le, not_lt_of_ge h₃.le]
  have hPositive : {i | 0 < P.curvature i} = ({2, 3} : Set (Fin 4)) := by
    ext i
    fin_cases i <;> simp [not_lt_of_ge h₀.le, not_lt_of_ge h₁.le, h₂, h₃]
  have hIndexPos := principalHeight_morseIndex P 1
  have hIndexNeg := principalHeight_morseIndex P (-1)
  refine ⟨⟨?_, ?_⟩, ⟨?_, ?_⟩⟩
  · simpa using principalHeight_nondegenerateCritical P 1 (fun i => by simpa using hk i)
  · simpa [hNegative, Set.ncard_pair (by decide : (0 : Fin 4) ≠ 1)] using hIndexPos
  · simpa using principalHeight_nondegenerateCritical P (-1) (fun i => by simpa using hk i)
  · simpa [hPositive, Set.ncard_pair (by decide : (2 : Fin 4) ≠ 3)] using hIndexNeg

end SmoothPoincare
