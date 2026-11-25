import FirstOrderTwistor.CylinderWeakMode
import FirstOrderTwistor.CylinderTraceEnergy

/-! # A discontinuous forcing and the short-cylinder trace obstruction
Prepared for Edward B. Baker III, 25 November 2026, with OpenAI Codex.
-/

open FirstOrderTwistor MeasureTheory Set
noncomputable section

private def stepForcing (t : ℝ) : ℝ := (Ici (1 : ℝ)).indicator (fun _ => 1) t

private theorem step_memLp : MemLp stepForcing 2 (volume.restrict (Icc (0 : ℝ) 2)) := by
  have : IsFiniteMeasure (volume.restrict (Icc (0 : ℝ) 2)) :=
    ⟨by simp⟩
  exact (memLp_const (1 : ℝ)).indicator measurableSet_Ici

/-- The same discontinuous forcing admits an AC weak solution from either incoming end. -/
example (i : Bool) :
    let a : ℝ := if i then 3/2 else -(3/2)
    let u := forcedCylinderMode 2 a (2 : ℝ) 3 stepForcing
    CylinderModeH1 2 u (fun t => stepForcing t - a • u t) ∧
      u (cylinderIncomingEnd 2 a) = (if i then 2 else 3) := by
  intro a u
  constructor
  · exact forcedCylinderMode_memH1 (by norm_num) a 2 3 step_memLp
  · cases i <;> norm_num [u, a, forcedCylinderMode_at_incoming]

/-- A nonzero constant field has both endpoint values equal to one while its
bulk first-order graph integral shrinks in direct proportion to length. -/
example {L : ℝ} (hL : 0 < L) :
    |(3/2 : ℝ)| * (‖(1 : ℝ)‖ ^ 2 + ‖(1 : ℝ)‖ ^ 2) = 3 ∧
    (∫ _t in (0:ℝ)..L, ‖(0 : ℝ)‖ ^ 2 + (1 + (3/2 : ℝ)^2) * ‖(1 : ℝ)‖ ^ 2) =
      (13/4 : ℝ) * L ∧ 0 < (13/4 : ℝ) * L := by
  refine ⟨by norm_num, ?_, by positivity⟩
  simp [intervalIntegral.integral_const]
  ring
