import SmoothPoincare.Variational.ExactFacePhysicalJets

open SmoothPoincare Filter Set
open scoped ContDiff Topology

#check exactFaceCoordinateSplice_two_jets
#check fderiv_eq_zero_of_exactFace
#check exists_exactFaceCoordinateTaylor
#check exists_exactFaceCoordinateSplice_twoJetBound
#check exactFaceCoordinateSplice_angular_mixed
#check exactFaceCoordinateSplice_plateau_germs
#check contDiffOn_exactFaceNativeCoefficient
#check exactFaceNativePath_sub_reference_germ
#check exists_exactFaceNativePath_twoJetBound
#check exists_exactFaceNativePath_fullCoefficientBound

#print axioms exactFaceCoordinateSplice_two_jets
#print axioms exists_exactFaceCoordinateTaylor
#print axioms exists_exactFaceCoordinateSplice_twoJetBound
#print axioms exactFaceCoordinateSplice_angular_mixed
#print axioms exactFaceCoordinateSplice_plateau_germs
#print axioms contDiffOn_exactFaceNativeCoefficient
#print axioms exactFaceNativePath_sub_reference_germ
#print axioms exists_exactFaceNativePath_twoJetBound
#print axioms exists_exactFaceNativePath_fullCoefficientBound

def mixedDefect (z : ℝ × ℝ) : ℝ := z.1 * (z.2 * z.2)

theorem smooth_mixedDefect : ContDiff ℝ ∞ mixedDefect :=
  contDiff_fst.mul (contDiff_snd.mul contDiff_snd)

theorem fderiv_mixedDefect_face (a : ℝ) :
    fderiv ℝ mixedDefect (a, 0) = 0 := by
  have hf : DifferentiableAt ℝ (Prod.fst : ℝ × ℝ → ℝ) (a, 0) :=
    ((contDiff_fst : ContDiff ℝ ∞ (Prod.fst : ℝ × ℝ → ℝ)).differentiable (by simp) _)
  have hg : DifferentiableAt ℝ (Prod.snd : ℝ × ℝ → ℝ) (a, 0) :=
    ((contDiff_snd : ContDiff ℝ ∞ (Prod.snd : ℝ × ℝ → ℝ)).differentiable (by simp) _)
  have hg₂ : DifferentiableAt ℝ (fun z : ℝ × ℝ => z.2 * z.2) (a, 0) := hg.mul hg
  have hd₂ : fderiv ℝ (fun z : ℝ × ℝ => z.2 * z.2) (a, 0) = 0 := by
    rw [fderiv_fun_mul hg hg]
    simp
  unfold mixedDefect
  rw [fderiv_fun_mul hf hg₂, hd₂]
  simp

example : ∃ B : ℝ, 0 ≤ B ∧
    ∀ z ∈ Icc (-1 : ℝ) 1 ×ˢ Icc (-(1 / 3 : ℝ)) (2 / 3),
      ‖fderiv ℝ (fderiv ℝ (exactFaceCoordinateSplice (1 / 2) (1 / 3) (2 / 3) mixedDefect)) z‖ ≤ B := by
  have hN (a : ℝ) (_ : a ∈ Icc (-1 : ℝ) 1) :
      fderiv ℝ mixedDefect (a, 0) (0, 1) = 0 := by rw [fderiv_mixedDefect_face]; rfl
  obtain ⟨C, L₁, L₂, hC, hL₁, hL₂, H⟩ :=
    exists_exactFaceCoordinateSplice_twoJetBound isOpen_univ isCompact_Icc
      (WL := 1) (WR := 1) zero_le_one zero_le_one (subset_univ _)
      smooth_mixedDefect.contDiffOn (by intro a ha; simp [mixedDefect]) hN
  refine ⟨C * (1 + 2 * L₁ + L₂), by positivity, fun z hz => ?_⟩
  have h := H (1 / 2) (1 / 3) (2 / 3) (by constructor <;> norm_num)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) z hz.1
  rcases le_total z.2 0 with ht | ht
  · exact (h.1 ⟨hz.2.1, ht⟩).2.2
  · exact (h.2 ⟨ht, hz.2.2⟩).2.2

example :
    exactFaceCoordinateSplice 1 (1 / 3) (2 / 3) mixedDefect =ᶠ[𝓝 ((1, 0) : ℝ × ℝ)] (fun _ => 0) := by
  have h := (exactFaceCoordinateSplice_plateau_germs 1 (by norm_num : (0 : ℝ) < 1 / 3)
    (by norm_num : (0 : ℝ) < 2 / 3) mixedDefect (1, 0)).1
    (by constructor <;> norm_num)
  simpa only [sub_self, zero_mul] using h

example :
    exactFaceCoordinateSplice (1 / 2) (1 / 3) (2 / 3) mixedDefect =ᶠ[𝓝 ((1, 2 / 3) : ℝ × ℝ)]
      mixedDefect := by
  exact (exactFaceCoordinateSplice_plateau_germs (1 / 2)
    (by norm_num : (0 : ℝ) < 1 / 3) (by norm_num : (0 : ℝ) < 2 / 3) mixedDefect (1, 2 / 3)).2
    (Or.inr (by norm_num))
