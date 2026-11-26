import SmoothPoincare.Variational.MarkedDiskSeparation

/-! # Dyadic division of the full physical exterior in both chiralities -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "T" => (4 * Real.pi ^ 2)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- With the ordered Weyl spectra of the physical metric as inputs, this
measures the squared larger top chiral eigenvalue in its physical volume. -/
noncomputable def balancedPhysicalSpectralMeasure (g : SignedCollarMetric o)
    (plus minus : M → Fin 3 → ℝ) : Measure M :=
  energyMeasure (riemannianVolumeMeasure I M g.metric)
    (fun x => endpointTopWeyl (plus x) (minus x) ^ 2)

/-- The simultaneous error on the whole closed exterior. This accounts
for both chiralities, the spectral measure and the full curvature measure
on one and the same marking. -/
structure BalancedPhysicalExteriorDivision (g : SignedCollarMetric o) (σ ν : Measure M)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (marks : NestedBalancedDisks I M) (k : ℕ) (ε : ℝ) : Prop where
  core_eq : marks.core = Q
  chiral : ∀ sign,
    |g.charge sign (interior (selectedChartDisk marks.outer))ᶜ -
      (1 / (2 : ℝ) ^ k) * g.charge sign (interior (selectedChartDisk Q))ᶜ| < ε
  spectral : |σ.real (interior (selectedChartDisk marks.outer))ᶜ -
    (1 / (2 : ℝ) ^ k) * σ.real (interior (selectedChartDisk Q))ᶜ| < ε
  full_curvature : |ν.real (interior (selectedChartDisk marks.outer))ᶜ -
    (1 / (2 : ℝ) ^ k) * ν.real (interior (selectedChartDisk Q))ᶜ| < ε

/-- Apply the dyadic marked construction to the two physical chiral
measures and the two further finite measures of the same physical gauge. -/
theorem exists_balancedPhysicalExteriorDivision [PreconnectedSpace M]
    (g : SignedCollarMetric o) (σ ν : Measure M) [IsFiniteMeasure σ] [IsFiniteMeasure ν]
    (hσ : σ ≪ riemannianVolumeMeasure I M g.metric) (hν : ν ≪ riemannianVolumeMeasure I M g.metric)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (k : ℕ) (hk : 0 < k) {ε : ℝ} (hε : 0 < ε) :
    ∃ marks, BalancedPhysicalExteriorDivision g σ ν Q marks k ε := by
  let μ : Fin 4 → Measure M := ![g.chiralMeasure .plus, g.chiralMeasure .minus, σ, ν]
  let : ∀ j, IsFiniteMeasure (μ j) := by
    intro j
    fin_cases j
    · exact (inferInstance : IsFiniteMeasure (g.chiralMeasure .plus))
    · exact (inferInstance : IsFiniteMeasure (g.chiralMeasure .minus))
    · exact (inferInstance : IsFiniteMeasure σ)
    · exact (inferInstance : IsFiniteMeasure ν)
  have hAc : ∀ j, μ j ≪ riemannianVolumeMeasure I M g.metric := by
    intro j
    fin_cases j
    · exact (show g.chiralMeasure .plus ≪ _ from withDensity_absolutelyContinuous _ _)
    · exact (show g.chiralMeasure .minus ≪ _ from withDensity_absolutelyContinuous _ _)
    · exact hσ
    · exact hν
  obtain ⟨marks, hCore, hDiv⟩ := exists_nestedMarkedDisk_fourMeasure_dyadic g.metric μ hAc Q hQ k hk hε
  refine ⟨marks, hCore, ?_, hDiv 2, hDiv 3⟩
  intro sign
  cases sign
  · exact hDiv 0
  · exact hDiv 1

/-- The four-measure comparison for the density of the supplied chiral
spectra and the full curvature norm of the original physical metric. -/
theorem exists_balancedPhysicalSpectralExteriorDivision [PreconnectedSpace M]
    (g : SignedCollarMetric o) (plus minus : M → Fin 3 → ℝ)
    (hTop : Integrable (fun x => endpointTopWeyl (plus x) (minus x) ^ 2)
      (riemannianVolumeMeasure I M g.metric))
    (hFull : Integrable (fun x => frameTensorNormSq (metricCurvatureFrameTensor g.metric o x (g.frame x)))
      (riemannianVolumeMeasure I M g.metric))
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (k : ℕ) (hk : 0 < k) {ε : ℝ} (hε : 0 < ε) :
    ∃ marks, BalancedPhysicalExteriorDivision g (balancedPhysicalSpectralMeasure g plus minus)
      (metricFullCurvatureMeasure g.metric o g.frame) Q marks k ε := by
  let σ := balancedPhysicalSpectralMeasure g plus minus
  let ν := metricFullCurvatureMeasure g.metric o g.frame
  let : IsFiniteMeasure σ := isFiniteEnergyMeasure hTop
  let : IsFiniteMeasure ν := isFiniteEnergyMeasure hFull
  exact exists_balancedPhysicalExteriorDivision g σ ν
    (withDensity_absolutelyContinuous _ _) (withDensity_absolutelyContinuous _ _) Q hQ k hk hε

/-- The spectral measure uses the ordered spectra of both actual Weyl blocks
in the oriented frame of the physical source metric. -/
theorem exists_balancedPhysicalSpectralExteriorDivision_of_endpointData
    [PreconnectedSpace M] [Nonempty M]
    (g : SignedCollarMetric o) (plus minus : M → Fin 3 → ℝ)
    (hSpectrum : EndpointPhysicalSpectralData o g.metric g.frame plus minus)
    (hFull : Integrable (fun x => frameTensorNormSq (metricCurvatureFrameTensor g.metric o x (g.frame x)))
      (riemannianVolumeMeasure I M g.metric))
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (k : ℕ) (hk : 0 < k) {ε : ℝ} (hε : 0 < ε) :
    ∃ marks, BalancedPhysicalExteriorDivision g (balancedPhysicalSpectralMeasure g plus minus)
      (metricFullCurvatureMeasure g.metric o g.frame) Q marks k ε :=
  exists_balancedPhysicalSpectralExteriorDivision g plus minus hSpectrum.top_integrable hFull Q hQ k hk hε

/-- Choose an actual larger marking at every source. The complete raw
exterior of the chosen disks eventually has both chiral charges below `T`. -/
theorem exists_eventually_balancedPhysicalExterior_below_threshold
    [PreconnectedSpace M]
    (g : ℕ → SignedCollarMetric o) (plus minus : ℕ → M → Fin 3 → ℝ)
    (hTop : ∀ i, Integrable (fun x => endpointTopWeyl (plus i x) (minus i x) ^ 2)
      (riemannianVolumeMeasure I M (g i).metric))
    (hFull : ∀ i, Integrable (fun x => frameTensorNormSq
      (metricCurvatureFrameTensor (g i).metric o x ((g i).frame x)))
      (riemannianVolumeMeasure I M (g i).metric))
    (Q : ℕ → PartialDiffeomorph I₄ I E₄ M ∞) (hQ : ∀ i, Metric.closedBall (0 : E₄) 1 ⊆ (Q i).source)
    (k : ℕ) (hk : 0 < k) (ε : ℕ → ℝ) (hε : ∀ i, 0 < ε i)
    (hεlim : Tendsto ε atTop (𝓝 0)) {eLim : ℝ}
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 eLim)) (hLim : eLim < 2 * T) :
    ∃ marks : ℕ → NestedBalancedDisks I M,
      (∀ i, BalancedPhysicalExteriorDivision (g i) (balancedPhysicalSpectralMeasure (g i) (plus i) (minus i))
        (metricFullCurvatureMeasure (g i).metric o (g i).frame) (Q i) (marks i) k (ε i)) ∧
      ∀ᶠ i in atTop, ∀ sign, (g i).charge sign (interior (selectedChartDisk (marks i).outer))ᶜ < T := by
  choose marks hMarks using fun i => exists_balancedPhysicalSpectralExteriorDivision (g i)
    (plus i) (minus i) (hTop i) (hFull i) (Q i) (hQ i) k hk (hε i)
  refine ⟨marks, hMarks, eventually_balancedMarkedExterior_below_threshold g marks hk ε he hLim hεlim ?_⟩
  exact Eventually.of_forall fun i sign => by
    rw [(hMarks i).core_eq]
    exact ((hMarks i).chiral sign).le

end SmoothPoincare
