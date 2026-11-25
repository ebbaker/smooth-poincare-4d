import Mathlib.Geometry.Manifold.LocalDiffeomorph
import FirstOrderTwistor.SmoothCutGluing

/-!
# The exterior patch of a marked cut

The retained exterior enters the capped manifold, the corrected recognition
maps to the model sphere, and the model hemisphere maps into the actual
normal ball. The signed collar charts identify this composition with the
core map on the full open overlap.
-/

open Set
open scoped ContDiff Manifold

namespace FirstOrderTwistor

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜]
  {E₁ E₂ E₃ E₄ : Type*}
  [NormedAddCommGroup E₁] [NormedSpace 𝕜 E₁]
  [NormedAddCommGroup E₂] [NormedSpace 𝕜 E₂]
  [NormedAddCommGroup E₃] [NormedSpace 𝕜 E₃]
  [NormedAddCommGroup E₄] [NormedSpace 𝕜 E₄]
  {H₁ H₂ H₃ H₄ : Type*}
  [TopologicalSpace H₁] [TopologicalSpace H₂] [TopologicalSpace H₃] [TopologicalSpace H₄]
  {M Vhat S Xhat : Type*}
  [TopologicalSpace M] [ChartedSpace H₁ M]
  [TopologicalSpace Vhat] [ChartedSpace H₂ Vhat]
  [TopologicalSpace S] [ChartedSpace H₃ S]
  [TopologicalSpace Xhat] [ChartedSpace H₄ Xhat]
  {I : ModelWithCorners 𝕜 E₁ H₁} {IV : ModelWithCorners 𝕜 E₂ H₂}
  {IS : ModelWithCorners 𝕜 E₃ H₃} {J : ModelWithCorners 𝕜 E₄ H₄}

variable (retained : PartialDiffeomorph I IV M Vhat ∞)
  (recognition : Diffeomorph IV IS Vhat S ∞)
  (normalBall : PartialDiffeomorph IS J S Xhat ∞)

/-- The exterior map obtained from the corrected recognition, defined on the
full composition domain of the two supplied partial diffeomorphisms. -/
def exteriorPatchOfRecognition : PartialDiffeomorph I J M Xhat ∞ :=
  (retained.trans recognition.toPartialDiffeomorph).trans normalBall

theorem exteriorPatch_source :
    (exteriorPatchOfRecognition retained recognition normalBall).source =
      retained.source ∩ (fun x ↦ recognition (retained x)) ⁻¹' normalBall.source := by
  ext x
  change ((x ∈ retained.source ∧ True) ∧ recognition (retained x) ∈ normalBall.source) ↔ _
  simp

theorem exteriorPatch_target :
    (exteriorPatchOfRecognition retained recognition normalBall).target =
      normalBall.target ∩
        (fun y ↦ recognition.symm (normalBall.symm y)) ⁻¹' retained.target := by
  ext y
  change (y ∈ normalBall.target ∧
    (True ∧ recognition.symm (normalBall.symm y) ∈ retained.target)) ↔ _
  simp

@[simp]
theorem exteriorPatch_apply (x : M) :
    exteriorPatchOfRecognition retained recognition normalBall x =
      normalBall (recognition (retained x)) := rfl

@[simp]
theorem exteriorPatch_symm_apply (y : Xhat) :
    (exteriorPatchOfRecognition retained recognition normalBall).symm y =
      retained.symm (recognition.symm (normalBall.symm y)) := rfl

section Collar

variable {A : Type*} [TopologicalSpace A]
  (sourceCollar : OpenPartialHomeomorph A M) (targetCollar : OpenPartialHomeomorph A Xhat)
  (sphereCollar : A → S)

/-- The sphere and normal-ball formulas match the target collar at the same
signed collar parameter as the source. -/
theorem exteriorPatch_eqOn_collarParameters
    (hRecognition : EqOn (fun z ↦ recognition (retained (sourceCollar z))) sphereCollar
      sourceCollar.source)
    (hBall : EqOn (fun z ↦ normalBall (sphereCollar z)) targetCollar sourceCollar.source) :
    EqOn (fun z ↦ exteriorPatchOfRecognition retained recognition normalBall (sourceCollar z))
      targetCollar sourceCollar.source :=
  fun _ hz ↦ (congrArg normalBall (hRecognition hz)).trans (hBall hz)

private theorem eqOn_signedCollar {f : M → Xhat}
    (h : EqOn (fun z ↦ f (sourceCollar z)) targetCollar sourceCollar.source) :
    EqOn f (sourceCollar.symm.trans targetCollar) sourceCollar.target := by
  intro x hx
  change f x = targetCollar (sourceCollar.symm x)
  exact (congrArg f (sourceCollar.right_inv hx).symm).trans (h (sourceCollar.map_target hx))

private theorem signedCollar_source (hDomain : sourceCollar.source = targetCollar.source) :
    (sourceCollar.symm.trans targetCollar).source = sourceCollar.target := by
  rw [OpenPartialHomeomorph.trans_source]
  apply inter_eq_left.mpr
  intro x hx
  change sourceCollar.symm x ∈ targetCollar.source
  rw [← hDomain]
  exact sourceCollar.map_target hx

private theorem signedCollar_target (hDomain : sourceCollar.source = targetCollar.source) :
    (sourceCollar.symm.trans targetCollar).target = targetCollar.target := by
  rw [OpenPartialHomeomorph.trans_target]
  apply inter_eq_left.mpr
  intro y hy
  change targetCollar.symm y ∈ sourceCollar.source
  rw [hDomain]
  exact targetCollar.map_target hy

/-- Combine the core comparison inverse with the exterior map calculated from
the corrected recognition. The two signed collar charts identify the source
and target overlaps of the supplied covers. -/
def SmoothCutGluing.ofRecognizedExterior
    (core : PartialDiffeomorph I J M Xhat ∞)
    (hDomain : sourceCollar.source = targetCollar.source)
    (hSourceCover : core.source ∪
      (exteriorPatchOfRecognition retained recognition normalBall).source = univ)
    (hTargetCover : core.target ∪
      (exteriorPatchOfRecognition retained recognition normalBall).target = univ)
    (hSourceOverlap : sourceCollar.target = core.source ∩
      (exteriorPatchOfRecognition retained recognition normalBall).source)
    (hTargetOverlap : targetCollar.target = core.target ∩
      (exteriorPatchOfRecognition retained recognition normalBall).target)
    (hCore : EqOn (fun z ↦ core (sourceCollar z)) targetCollar sourceCollar.source)
    (hRecognition : EqOn (fun z ↦ recognition (retained (sourceCollar z))) sphereCollar
      sourceCollar.source)
    (hBall : EqOn (fun z ↦ normalBall (sphereCollar z)) targetCollar sourceCollar.source) :
    SmoothCutGluing I J M Xhat where
  core := core.toOpenPartialHomeomorph
  exterior := (exteriorPatchOfRecognition retained recognition normalBall).toOpenPartialHomeomorph
  collar := sourceCollar.symm.trans targetCollar
  source_cover := hSourceCover
  target_cover := hTargetCover
  collar_source := (signedCollar_source sourceCollar targetCollar hDomain).trans hSourceOverlap
  collar_target := (signedCollar_target sourceCollar targetCollar hDomain).trans hTargetOverlap
  core_eq_collar := signedCollar_source sourceCollar targetCollar hDomain ▸
    eqOn_signedCollar sourceCollar targetCollar hCore
  exterior_eq_collar := signedCollar_source sourceCollar targetCollar hDomain ▸
    eqOn_signedCollar sourceCollar targetCollar
      (exteriorPatch_eqOn_collarParameters retained recognition normalBall
        sourceCollar targetCollar sphereCollar hRecognition hBall)
  core_smooth := core.contMDiffOn_toFun
  core_symm_smooth := core.contMDiffOn_invFun
  exterior_smooth := (exteriorPatchOfRecognition retained recognition normalBall).contMDiffOn_toFun
  exterior_symm_smooth :=
    (exteriorPatchOfRecognition retained recognition normalBall).contMDiffOn_invFun

end Collar

end FirstOrderTwistor
