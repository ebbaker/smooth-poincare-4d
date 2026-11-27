import SmoothPoincare
import DifferentialGeometry.Topology.FundamentalGroup.Sphere

/-! # Independent E52 cap-jet and universal logic checks -/

open Metric Manifold DifferentialGeometry DifferentialGeometry.Topology
open SmoothPoincare SmoothPoincare.IntrinsicEntry FirstOrderTwistor
open scoped Manifold ContDiff

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "S₃" => sphere (0 : E₄) 1
local instance : Fact (Module.finrank ℝ E₄ = 3 + 1) := ⟨by simp⟩
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

private def north : S₃ := sphereThreeNorth
private def east : S₃ := ⟨EuclideanSpace.single 1 1, by simp⟩
private def angularLog (y : S₃) : ℝ := (y : E₄) 0
private def angularMean (y : S₃) : ℝ := 1 + (y : E₄) 1

private theorem angularLog_smooth : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ angularLog :=
  (EuclideanSpace.proj (𝕜 := ℝ) (0 : Fin 4)).contMDiff.comp
    (contMDiff_coe_sphere (E := E₄) (n := 3))

private theorem angularMean_smooth : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ angularMean :=
  contMDiff_const.add ((EuclideanSpace.proj (𝕜 := ℝ) (1 : Fin 4)).contMDiff.comp
    (contMDiff_coe_sphere (E := E₄) (n := 3)))

/-- The input data vary along the sphere and change both the boundary value
and the prescribed outward normal derivative. -/
example : angularLog north = 1 ∧ angularLog east = 0 ∧
    angularMean north = 1 ∧ angularMean east = 2 := by
  norm_num [north, east, angularLog, angularMean, sphereThreeNorth, sphereThreeNorthVector]

private def angularTangent : E₄ := EuclideanSpace.single 1 1

example : inner ℝ (north : E₄) angularTangent = 0 := by
  simp [north, angularTangent, sphereThreeNorth, sphereThreeNorthVector,
    EuclideanSpace.inner_single_right]

/-- At the north pole, the angular lift of a unit tangent vector sees the
positive normal lapse and the required opposite second fundamental form. -/
example :
    let g := matchedConformallyFlatBall north angularLog_smooth angularMean_smooth
    deriv (fun r : ℝ => g.inner (r • (north : E₄)) (r • angularTangent) (r • angularTangent)) 1 /
      (2 * Real.exp 1) + (1 / 3 : ℝ) * g.inner (north : E₄) angularTangent angularTangent = 0 := by
  have hLog : angularLog north = 1 := by
    simp [north, angularLog, sphereThreeNorth, sphereThreeNorthVector]
  have hMean : angularMean north = 1 := by
    simp [north, angularMean, sphereThreeNorth, sphereThreeNorthVector]
  simpa only [hLog, hMean] using matchedConformallyFlatBall_angular_firstJet
    north north angularLog_smooth angularMean_smooth angularTangent angularTangent

/-- The Robin boundary weight and sign are the ones of this nonconstant input. -/
example : (matchedBallRobinJet north angularLog angularMean).factor east = 1 ∧
    (matchedBallRobinJet north angularLog angularMean).capOutwardMean east = -2 := by
  simp [matchedBallRobinJet, east, angularLog, angularMean]
  norm_num

universe u

variable (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4)

/-- Membership contains an actual positive metric of zero energy on the
original smooth carrier after pulling back the round metric. -/
example (M : OrientedHomotopyFourSphere.{u})
    (Φ : M.Carrier ≃ₘ⟮𝓡 4, 𝓡 4⟯ StandardFourSphere)
    (hΦ : Φ.preservesOrientation M.orientation oS) :
    0 ∈ geometricPositiveEnergies M.orientation ∧ M.Entered := by
  have hZero :=
    (geometricInfimum_eq_zero_of_roundIdentification Φ hΦ standardRoundFour_yamabe_pos).1
  exact ⟨hZero, ⟨0, hZero, by positivity⟩⟩

/-- Universal smooth recognition gives E by round pullback and gives S at
every entered type. -/
example (h : ∀ M : OrientedHomotopyFourSphere.{u}, M.Standard oS) :
    UniversalPositiveSubcriticalEntry.{u} ∧ EnteredTypeRecognition.{u} oS :=
  ⟨fun M => M.entered_of_standard (h M), fun M _ => h M⟩

/-- Universal E supplies the premise of S on the same four-sphere. -/
example (hE : UniversalPositiveSubcriticalEntry.{u})
    (hS : EnteredTypeRecognition.{u} oS) (M : OrientedHomotopyFourSphere.{u}) :
    M.Standard oS :=
  hS M (hE M)

#print axioms matchedConformallyFlatBall_angular_firstJet
#print axioms matchedBallRobinJet
#print axioms geometricInfimum_eq_zero_of_roundIdentification
#print axioms standardRoundFour_yamabe_pos
#print axioms orientedSmoothPoincare_iff_entry_and_recognition
