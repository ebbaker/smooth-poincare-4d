import DifferentialGeometry.Topology.Manifold.Orientation

/-!
# Recognizing the exterior with its cap marking

The marking identifies model and recorded neighborhoods of the cap. The
extension hypothesis is the instance of Palais's cell theorem for its
composition with the initial exterior recognition. Correcting the initial
map by the ambient extension preserves the chosen open collar germ.
-/

open DifferentialGeometry Set
open scoped ContDiff Manifold

namespace FirstOrderTwistor

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  {H : Type*} [TopologicalSpace H] {K : Type*} [TopologicalSpace K]
  {Vhat : Type*} [TopologicalSpace Vhat] [ChartedSpace H Vhat]
  {S : Type*} [TopologicalSpace S] [ChartedSpace K S]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  [IsManifold I ∞ Vhat] [IsManifold J ∞ S] {n : ℕ}

/-- Correct an oriented smooth recognition of the capped exterior by an ambient extension
of the cap-neighborhood germ. The marking goes from the model cap neighborhood
to the recorded one. The returned map and its inverse agree with the recording
on open neighborhoods and carry the respective cap complements onto one another. -/
theorem exists_recognition_eqOn_capNeighborhood
    (recordedOrientation : ManifoldOrientation I Vhat n)
    (modelOrientation : ManifoldOrientation J S n)
    (recognition : Diffeomorph I J Vhat S ∞)
    (hRecognition : recognition.preservesOrientation recordedOrientation modelOrientation)
    (marking : PartialDiffeomorph J I S Vhat ∞) (modelCap : Set S)
    (hExtend : ∃ (ambient : Diffeomorph J J S S ∞) (U : Set S),
      ambient.preservesOrientation modelOrientation modelOrientation ∧
        IsOpen U ∧ modelCap ⊆ U ∧ U ⊆ marking.source ∧
        EqOn ambient (marking.trans recognition.toPartialDiffeomorph) U) :
    ∃ (corrected : Diffeomorph I J Vhat S ∞) (U : Set S),
      corrected.preservesOrientation recordedOrientation modelOrientation ∧
        IsOpen U ∧ modelCap ⊆ U ∧ U ⊆ marking.source ∧ IsOpen (marking '' U) ∧
        EqOn corrected.symm marking U ∧ EqOn corrected marking.symm (marking '' U) ∧
        corrected '' (marking '' modelCap)ᶜ = modelCapᶜ ∧
        corrected.symm '' modelCapᶜ = (marking '' modelCap)ᶜ ∧
        corrected '' (interior (marking '' modelCap))ᶜ = (interior modelCap)ᶜ ∧
        corrected.symm '' (interior modelCap)ᶜ = (interior (marking '' modelCap))ᶜ := by
  obtain ⟨ambient, U, hOrientation, hOpen, hCap, hSource, hAgree⟩ := hExtend
  let corrected := recognition.trans ambient.symm
  have hSymm : EqOn corrected.symm marking U := by
    intro y hy
    change recognition.symm (ambient y) = marking y
    rw [hAgree hy]
    change recognition.symm (recognition (marking y)) = marking y
    exact recognition.symm_apply_apply (marking y)
  have hForward : EqOn corrected marking.symm (marking '' U) := by
    rintro _ ⟨y, hy, rfl⟩
    calc
      corrected (marking y) = corrected (corrected.symm y) :=
        congrArg corrected (hSymm hy).symm
      _ = y := corrected.apply_symm_apply y
      _ = marking.symm (marking y) := (marking.left_inv (hSource hy)).symm
  have hOpenImage : IsOpen (marking '' U) := by
    rw [← hSymm.image_eq]
    exact corrected.symm.toHomeomorph.isOpenMap U hOpen
  have hCapImage : corrected.symm '' modelCap = marking '' modelCap :=
    (hSymm.mono hCap).image_eq
  have hExteriorInv : corrected.symm '' modelCapᶜ = (marking '' modelCap)ᶜ := by
    rw [show corrected.symm '' modelCapᶜ = (corrected.symm '' modelCap)ᶜ from
      corrected.symm.toEquiv.image_compl modelCap, hCapImage]
  have hExterior : corrected '' (marking '' modelCap)ᶜ = modelCapᶜ := by
    rw [← hExteriorInv, image_image]
    simp
  have hClosedExteriorInv : corrected.symm '' (interior modelCap)ᶜ =
      (interior (marking '' modelCap))ᶜ := by
    rw [show corrected.symm '' (interior modelCap)ᶜ =
        (corrected.symm '' (interior modelCap))ᶜ from
      corrected.symm.toEquiv.image_compl (interior modelCap)]
    congr 1
    exact (corrected.symm.toHomeomorph.image_interior modelCap).trans (congrArg interior hCapImage)
  have hClosedExterior : corrected '' (interior (marking '' modelCap))ᶜ =
      (interior modelCap)ᶜ := by
    rw [← hClosedExteriorInv, image_image]
    simp
  have hCorrectedOrientation : corrected.preservesOrientation recordedOrientation modelOrientation :=
    Diffeomorph.preservesOrientation_trans hRecognition
      (Diffeomorph.preservesOrientation_symm hOrientation)
  exact ⟨corrected, U, hCorrectedOrientation,
    hOpen, hCap, hSource, hOpenImage, hSymm, hForward, hExterior, hExteriorInv,
    hClosedExterior, hClosedExteriorInv⟩

end FirstOrderTwistor
