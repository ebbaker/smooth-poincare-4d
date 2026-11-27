import SmoothPoincare.Variational.PositiveScalarYamabeFour
import Mathlib.Topology.Homotopy.Equiv

/-! # The two universal obligations

The chiral energy is the operator-normalized positive block, which the
signature identity identifies with the negative energy on a homotopy sphere.
The entry predicate requires a metric, including when no positive class has
yet been supplied. -/

open DifferentialGeometry FirstOrderTwistor
open scoped Manifold ContDiff ContinuousMap

namespace SmoothPoincare

universe u

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

/-- The domain of the universal statements, in boundaryless four-dimensional
Euclidean charts. The homotopy equivalence is topological. -/
structure OrientedHomotopyFourSphere where
  Carrier : Type u
  [topology : TopologicalSpace Carrier]
  [atlas : ChartedSpace E₄ Carrier]
  [smooth : IsManifold (𝓡 4) ∞ Carrier]
  [hausdorff : T2Space Carrier]
  [compact : CompactSpace Carrier]
  [connected : ConnectedSpace Carrier]
  orientation : ManifoldOrientation (𝓡 4) Carrier 4
  homotopySphere : Nonempty (Carrier ≃ₕ StandardFourSphere)

attribute [instance] OrientedHomotopyFourSphere.topology OrientedHomotopyFourSphere.atlas
  OrientedHomotopyFourSphere.smooth OrientedHomotopyFourSphere.hausdorff
  OrientedHomotopyFourSphere.compact OrientedHomotopyFourSphere.connected

/-- Entry on this smooth type and orientation. No real infimum is evaluated on
a potentially empty set. -/
def OrientedHomotopyFourSphere.Entered (M : OrientedHomotopyFourSphere) : Prop :=
  ∃ e ∈ geometricPositiveEnergies M.orientation, e < 8 * Real.pi ^ 2

def OrientedHomotopyFourSphere.Standard (M : OrientedHomotopyFourSphere)
    (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4) : Prop :=
  Nonempty {Φ : M.Carrier ≃ₘ⟮𝓡 4, 𝓡 4⟯ StandardFourSphere //
    Φ.preservesOrientation M.orientation oS}

/-- Program obligation E. -/
def UniversalPositiveSubcriticalEntry : Prop := ∀ M : OrientedHomotopyFourSphere.{u}, M.Entered

/-- Program obligation S. Attainment, a native diagram or a cut can enter a
proof of this universal statement. Its scientific premise is entry alone. -/
def EnteredTypeRecognition (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4) : Prop :=
  ∀ M : OrientedHomotopyFourSphere.{u}, M.Entered → M.Standard oS

theorem OrientedHomotopyFourSphere.entered_of_standard (M : OrientedHomotopyFourSphere)
    {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4} (h : M.Standard oS) : M.Entered := by
  obtain ⟨⟨Φ, hΦ⟩⟩ := h
  exact ⟨0, (geometricInfimum_eq_zero_of_roundIdentification Φ hΦ standardRoundFour_yamabe_pos).1,
    by positivity⟩

/-- The logical reduction, with a checked round pullback on every already
recognized type. Neither universal statement is an axiom of this module. -/
theorem orientedSmoothPoincare_iff_entry_and_recognition
    (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4) :
    (∀ M : OrientedHomotopyFourSphere.{u}, M.Standard oS) ↔
    UniversalPositiveSubcriticalEntry.{u} ∧ EnteredTypeRecognition.{u} oS :=
  ⟨fun h => ⟨fun M => M.entered_of_standard (h M), fun M _ => h M⟩,
    fun ⟨entry, recognize⟩ M => recognize M (entry M)⟩

end SmoothPoincare
