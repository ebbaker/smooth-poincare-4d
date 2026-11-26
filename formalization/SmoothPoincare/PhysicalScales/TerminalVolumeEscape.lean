import SmoothPoincare.PhysicalScales.PointedTerminalBuffer
import DifferentialGeometry.Geometry.Compactness.CheegerGromov.Pointed.Convergence.CompactGlobalization

/-! # Noncompactness detected by the volumes of the supplying terminal slices -/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow.Perelman.KappaSolutions
  Set Filter MeasureTheory
open scoped Manifold ContDiff Topology ENNReal

noncomputable section
namespace SmoothPoincare

universe u uE uH
variable {E : Type uE} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type uH} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {X : PointedRiemannianSeq.{u,uE,uH} I} {P : PointedRiemannianManifold.{u,uE,uH} I}
  {φ : ℕ → ℕ}

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    MeasurableSpace Q.M := borel Q.M
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    BorelSpace Q.M := ⟨rfl⟩
private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

/-- On connected sources diverging total volume excludes a compact smooth
pointed limit, even when some compact part retains positive curvature charge. -/
theorem pointedTerminal_noncompact_of_volume_escape
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hcanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hconn : ∀ i, ConnectedSpace (X.obj (φ i)).M)
    (hvol : Tendsto (fun i => riemannianVolumeMeasure I (X.obj (φ i)).M
      (X.obj (φ i)).metric univ) atTop (𝓝 ⊤)) : ¬ CompactSpace P.M := by
  intro hcompact
  let _ : CompactSpace P.M := hcompact
  let μ := riemannianVolumeMeasure I P.M P.metric
  let _ : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts P.metric
  have hfin : μ univ ≠ ⊤ := isCompact_univ.measure_lt_top.ne
  obtain ⟨n,hn⟩ := compactLimit_eventually_globalizes F hcompact hconn
  have hconv := F.tendsto_setLIntegral_image C hcanonical (K := univ) isCompact_univ
    (fun _ _ => (1 : ℝ≥0∞)) (fun _ => measurable_const) (f := fun _ => 1) (B := 1)
    (by simp) (Eventually.of_forall (fun _ _ _ => le_rfl)) (fun _ _ => tendsto_const_nhds)
  have him : ∀ᶠ i in atTop, F.map i '' univ = univ := by
    filter_upwards [eventually_ge_atTop n] with i hi
    obtain ⟨_,_,e,he,_,_,_⟩ := hn i hi
    have hf : F.map i = e := funext fun y => (he y).symm
    rw [hf,Set.image_univ]
    exact (show Function.Surjective (fun x => e x) from e.surjective).range_eq
  have hv : Tendsto (fun i => riemannianVolumeMeasure I (X.obj (φ i)).M
      (X.obj (φ i)).metric univ) atTop (𝓝 (μ univ)) := by
    simp only [lintegral_const, one_mul,Measure.restrict_apply_univ] at hconv
    apply hconv.congr'
    filter_upwards [him] with i hi
    rw [hi]
  exact hfin (tendsto_nhds_unique hv hvol)

/-- A diverging real volume suffices, as on the finite terminal slices of
a closed Ricci flow. -/
theorem pointedTerminal_noncompact_of_realVolume_escape
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hcanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hconn : ∀ i, ConnectedSpace (X.obj (φ i)).M)
    (hvol : Tendsto (fun i => (riemannianVolumeMeasure I (X.obj (φ i)).M
      (X.obj (φ i)).metric univ).toReal) atTop atTop) : ¬ CompactSpace P.M := by
  apply pointedTerminal_noncompact_of_volume_escape F C hcanonical hconn
  exact tendsto_nhds_top_mono' (ENNReal.tendsto_ofReal_nhds_top.2 hvol)
    (fun _ => ENNReal.ofReal_toReal_le)

end SmoothPoincare
