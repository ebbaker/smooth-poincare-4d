import SmoothPoincare.Variational.NativeDiskCompression
import SmoothPoincare.Variational.NativePocketFlattening
import SmoothPoincare.Variational.StereographicCapMetric
import SmoothPoincare.Variational.EuclideanPocketCapGerm

/-! # Both marked cap metrics from one positive native flattening endpoint -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Geometry.Curvature FirstOrderTwistor
open Manifold Set Metric Filter
open scoped Manifold ContDiff Topology InnerProductSpace

namespace SmoothPoincare
local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
local notation "S₄" => StandardFourSphere
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

private local instance : Nonempty S₄ := ⟨transportedCapNorthPole⟩

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [Nonempty M] [PathConnectedSpace M] {o : ManifoldOrientation I M 4}

/-- Select the Euclidean reference on the given source. For a positive
signed package realizing its actual flattening endpoint, construct a single
oriented compression and two positive marked cap metrics. Their relative
metric identities, exact outgoing charges and incoming exterior change use
the same maps and factors throughout. -/
theorem exists_nativePocket_matchedCaps (g : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {R B r b ℓ : ℝ} (hR : 1 < R) (hRB : R < B)
    (hBuffer : closedBall (0:E₄) B ⊆ F.source) (hr : 0 < r) (h3r : 3*r ≤ B)
    (hb : 0 < b) (hb₁ : b < 1) (hb₂ : b < 2*r) (hℓ : 0 < ℓ)
    (oS : ManifoldOrientation I₄ S₄ 4) :
    let hF := (closedBall_subset_closedBall (hR.trans hRB).le).trans hBuffer
    let hS := (closedBall_subset_closedBall h3r).trans hBuffer
    ∃ Rflat : SmoothRiemannianMetric I M, ∀ (flat : SignedCollarMetric o),
      flat.metric = nativePocketPath F g.metric Rflat hr hS ⟨1, zero_le_one, le_rfl⟩ →
      0 < classYamabeFour o.dimension_eq flat.metric → ∀ u : C^∞⟮I, M; ℝ⟯,
      ∃ (φ : M ≃ₘ⟮I,I⟯ M) (hφ : φ.preservesOrientation o o)
        (hImage : φ '' selectedChartDisk F = F '' closedBall (0:E₄) b)
        (uDisk : C^∞⟮I₄, S₄; ℝ⟯) (ε : ℝ),
        let disk := transportedDiskCore F hF φ hb hb₁.le hImage
        let exterior := transportedExteriorCore F hF φ hb hb₁.le hImage
        let capD := (RoundEquatorialCaps.signedRound oS).conformal uDisk
        let capV := flat.conformal u
        let q := capV.pullback φ hφ
        0 < ε ∧ (∀ t, |t| < ε → ∀ y ∈ sphere (0:E₄) 1,
          φ (F ((1+t) • y)) = F ((b * Real.exp (t/ℓ)) • y) ∧
          φ.symm (F ((b * Real.exp (t/ℓ)) • y)) = F ((1+t) • y)) ∧
        0 < classYamabeFour oS.dimension_eq capD.metric ∧
        0 < classYamabeFour o.dimension_eq capV.metric ∧
        (∀ x ∈ disk.raw, ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y,
          q.metric.inner y v w = capD.metric.inner (disk.core y)
            (mfderiv I I₄ disk.core y v) (mfderiv I I₄ disk.core y w)) ∧
        (∀ x ∈ exterior.raw, exterior.core.symm (exterior.core x) = x ∧
          ∀ v w : TangentSpace I x, q.metric.inner x v w = capV.metric.inner (exterior.core x)
            (mfderiv I I exterior.core x v) (mfderiv I I exterior.core x w)) ∧
        (∀ sg, capD.energy sg = 0 ∧ capD.energy sg = q.charge sg disk.raw ∧
          capV.energy sg = q.charge sg exterior.raw ∧
          capV.energy sg - g.charge sg exterior.raw =
            g.charge sg disk.raw + (flat.energy .plus - g.energy .plus)) := by
  intro hF hS
  obtain ⟨Rflat, O, hBO, _, hRef⟩ := exists_nativePocketReference g.metric F hBuffer
  refine ⟨Rflat, ?_⟩
  intro flat hEndpoint hp u
  let U := ball (0:E₄) (2*r)
  have hUB : U ⊆ closedBall (0:E₄) B :=
    ball_subset_closedBall.trans (closedBall_subset_closedBall (by linarith))
  have hUF := hUB.trans hBuffer
  obtain ⟨hEuclidean,hRm⟩ := nativePocketPath_endpoint_flat F g.metric Rflat hr hS
    (fun x hx => hRef x (hBO (hUB hx)))
  rw [← hEndpoint] at hEuclidean hRm
  obtain ⟨φ, ε, hφ, hε, hImage, _, hRadius, _⟩ :=
    exists_nativeGaussianDiskCompression_preservesOrientation o F hR hRB hBuffer hb hb₁ hℓ
  have hball : closedBall (0:E₄) b ⊆ U := closedBall_subset_ball hb₂
  have hFlat : ∀ p ∈ φ '' selectedChartDisk F, metricRm04At flat.metric p = 0 := by
    rw [hImage]
    rintro _ ⟨x,hx,rfl⟩
    exact hRm x (hball hx)
  have hInv := euclideanPocket_inverseMetric_of_forward flat.metric F hUF
    (fun z hz v w => (hEuclidean z hz v w).symm)
  obtain ⟨W,hW,hCapW,uLocal,hLocal,hGerm⟩ := euclideanPocket_localCapConformalGerm
    flat.metric F hF φ hb hb₁.le hImage u isOpen_ball hball hUF hInv
    (fun z _ v w => by simpa only [transportedPocketRoundDensity, add_comm (4 : ℝ)] using
      transportedCapPocketChart_metric_inner b hb z v w)
  obtain ⟨uDisk,_,hDiskGerm,_,_,hD,hV,hCharges⟩ := exists_transportedDiskCaps_with_matchingGerm
    g flat F hF φ hφ hb hb₁.le hImage u oS hFlat hp hW hCapW uLocal hLocal hGerm
  refine ⟨φ,hφ,hImage,uDisk,ε,hε,hRadius,hD,hV,hDiskGerm,
    transportedExterior_metric_relative flat F hF φ hφ hb hb₁.le hImage u,?_⟩
  intro sg
  have hLedger := (transportedDiskCaps_zeroDrift g flat F hF φ hφ hb hb₁.le hImage u uDisk oS
    hFlat hp).2.2.2.2 sg
  have hz := ((chargedDisk_flatPocket_transport g flat F hF φ hφ u hFlat hp).2.2 sg).1
  exact ⟨(hCharges sg).1.trans hz,(hCharges sg).1,(hCharges sg).2,hLedger.2.2⟩

end SmoothPoincare
