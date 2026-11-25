import FirstOrderTwistor.CylinderWeakMode
import Mathlib.Analysis.InnerProductSpace.l2Space

/-!
# Weak synthesis for incoming cylinder modes

FOT-E22f, prepared for Edward B. Baker III on 2026-11-25 with OpenAI Codex
assistance. Selected helper configuration: gpt-6.2-sol, ultra. Inputs
at intake HEAD 5ff7014: MATCH-E01 and CylinderWeakMode.

The estimates concern an indexed coefficient realization of the round
problem. The half-order trace norm uses the weights `|λ|`. The spectrum
and any identification of its Hilbert basis with spinors on the link
are geometric inputs.
-/

open MeasureTheory Set Filter
open scoped BigOperators Topology ENNReal

namespace FirstOrderTwistor

section Synthesis

variable {ι V : Type*} [NormedAddCommGroup V]

/-- Squared modal contribution to the half-order trace norm. -/
noncomputable def cylinderModalTraceEnergy (eigenvalue : ι → ℝ)
    (trace : ι → V) (i : ι) : ℝ :=
  |eigenvalue i| * ‖trace i‖ ^ 2

/-- Left outgoing trace, supported on the negative modes. -/
noncomputable def cylinderModalLeftOutgoing (eigenvalue : ι → ℝ)
    (field : ι → ℝ → V) (i : ι) : V :=
  if eigenvalue i < 0 then field i 0 else 0

/-- Right outgoing trace, supported on the nonnegative modes. -/
noncomputable def cylinderModalRightOutgoing (length : ℝ) (eigenvalue : ι → ℝ)
    (field : ι → ℝ → V) (i : ι) : V :=
  if eigenvalue i < 0 then 0 else field i length

private theorem cylinderIcc_integral {length : ℝ} (hlength : 0 ≤ length) (f : ℝ → ℝ) :
    (∫ t in 0..length, f t) = ∫ t in Icc 0 length, f t := by
  rw [intervalIntegral.integral_of_le hlength, integral_Icc_eq_integral_Ioc]

variable [NormedSpace ℝ V]

/-- Countable orthogonal coordinates for a half-order trace. -/
theorem cylinderModalTrace_memℓp (eigenvalue : ι → ℝ) (trace : ι → V)
    (htrace : Summable (cylinderModalTraceEnergy eigenvalue trace)) :
    Memℓp (fun i => Real.sqrt |eigenvalue i| • trace i) 2 := by
  apply (memℓp_gen_iff (by norm_num : 0 < (2 : ℝ≥0∞).toReal)).mpr
  convert htrace using 1
  funext i
  simp only [ENNReal.toReal_ofNat, Real.rpow_two, norm_smul, Real.norm_eq_abs,
    abs_of_nonneg (Real.sqrt_nonneg _), mul_pow, Real.sq_sqrt (abs_nonneg _),
    cylinderModalTraceEnergy]

/-- Squared graph energy keeps the ordinary time derivative, the
tangential Dirac term, and the bulk (L^2) term. -/
noncomputable def cylinderModalGraphEnergy (length eigenvalue : ℝ)
    (field velocity : ℝ → V) : ℝ :=
  ∫ t in Icc 0 length, ‖velocity t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖field t‖ ^ 2

/-- The signed weak mode equation, weighted boundary traces, and
summable bulk graph energy. The velocity is determined by the equation. -/
structure CylinderWeakModalSolution (length : ℝ) (eigenvalue : ι → ℝ)
    (left right : ι → V) (forcing field : ι → ℝ → V) : Prop where
  modes : ∀ i, CylinderModeH1 length (field i)
    (fun t => forcing i t - eigenvalue i • field i t)
  incoming : ∀ i, field i (cylinderIncomingEnd length (eigenvalue i)) =
    if eigenvalue i < 0 then right i else left i
  graph_summable : Summable (fun i => cylinderModalGraphEnergy length (eigenvalue i) (field i)
    (fun t => forcing i t - eigenvalue i • field i t))
  leftOutgoing_summable : Summable
    (cylinderModalTraceEnergy eigenvalue (cylinderModalLeftOutgoing eigenvalue field))
  rightOutgoing_summable : Summable
    (cylinderModalTraceEnergy eigenvalue (cylinderModalRightOutgoing length eigenvalue field))

theorem CylinderWeakModalSolution.leftOutgoing_memℓp {length : ℝ} {eigenvalue : ι → ℝ}
    {left right : ι → V} {forcing field : ι → ℝ → V}
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field) :
    Memℓp (fun i => Real.sqrt |eigenvalue i| • cylinderModalLeftOutgoing eigenvalue field i) 2 :=
  cylinderModalTrace_memℓp _ _ h.leftOutgoing_summable

theorem CylinderWeakModalSolution.rightOutgoing_memℓp {length : ℝ} {eigenvalue : ι → ℝ}
    {left right : ι → V} {forcing field : ι → ℝ → V}
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field) :
    Memℓp (fun i => Real.sqrt |eigenvalue i| • cylinderModalRightOutgoing length eigenvalue field i) 2 :=
  cylinderModalTrace_memℓp _ _ h.rightOutgoing_summable

variable [CompleteSpace V]

/-- The incoming solution is independent of the almost-everywhere
representatives of the forcing and unique at every point of the closed
interval among the absolutely continuous modal fields. -/
theorem CylinderWeakModalSolution.eqOn_of_forcing_aeEq
    {length : ℝ} (hlength : 0 ≤ length) {eigenvalue : ι → ℝ}
    {left right : ι → V} {forcing other field field' : ι → ℝ → V}
    (hforcing : ∀ i, MemLp (forcing i) 2 (volume.restrict (Icc 0 length)))
    (hother : ∀ i, MemLp (other i) 2 (volume.restrict (Icc 0 length)))
    (hEq : ∀ i, forcing i =ᵐ[volume.restrict (Icc 0 length)] other i)
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field)
    (h' : CylinderWeakModalSolution length eigenvalue left right other field') :
    ∀ i, EqOn (field i) (field' i) (Icc 0 length) := by
  intro i
  have hf := forcedCylinderMode_eqOn_of_equation hlength (eigenvalue i) (left i) (right i)
    (hforcing i) (h.modes i).absolutelyContinuous (h.modes i).hasDerivAt_ae (h.incoming i)
  have hg := forcedCylinderMode_eqOn_of_equation hlength (eigenvalue i) (left i) (right i)
    (hother i) (h'.modes i).absolutelyContinuous (h'.modes i).hasDerivAt_ae (h'.incoming i)
  exact hf.trans ((forcedCylinderMode_forcing_congr hlength (eigenvalue i) (left i) (right i)
    (hEq i)).trans hg.symm)

omit [CompleteSpace V] in
/-- Each bulk component is summable over the modes in the actual
restricted time measure. -/
theorem CylinderWeakModalSolution.summable_bulk_components {length : ℝ}
    {eigenvalue : ι → ℝ} {left right : ι → V} {forcing field : ι → ℝ → V}
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field) :
    let velocity (i : ι) (t : ℝ) := forcing i t - eigenvalue i • field i t
    Summable (fun i => ∫ t in Icc 0 length, ‖field i t‖ ^ 2) ∧
    Summable (fun i => ∫ t in Icc 0 length, ‖velocity i t‖ ^ 2) ∧
    Summable (fun i => ∫ t in Icc 0 length, ‖eigenvalue i • field i t‖ ^ 2) := by
  intro velocity
  let ν := volume.restrict (Icc (0 : ℝ) length)
  have hu (i : ι) : Integrable (fun t => ‖field i t‖ ^ 2) ν :=
    (memLp_two_iff_integrable_sq_norm (h.modes i).value_memLp.aestronglyMeasurable).mp
      (h.modes i).value_memLp
  have hv (i : ι) : Integrable (fun t => ‖velocity i t‖ ^ 2) ν :=
    (memLp_two_iff_integrable_sq_norm (h.modes i).velocity_memLp.aestronglyMeasurable).mp
      (h.modes i).velocity_memLp
  have hGraph (i : ι) :
      Integrable (fun t => ‖velocity i t‖ ^ 2 + (1 + eigenvalue i ^ 2) * ‖field i t‖ ^ 2) ν :=
    (hv i).add ((hu i).const_mul (1 + eigenvalue i ^ 2))
  have hscale (i : ι) (t : ℝ) : ‖eigenvalue i • field i t‖ ^ 2 =
      eigenvalue i ^ 2 * ‖field i t‖ ^ 2 := by
    rw [norm_smul, mul_pow, Real.norm_eq_abs, sq_abs]
  refine ⟨Summable.of_nonneg_of_le (fun _ => integral_nonneg fun _ => sq_nonneg _) ?_
    h.graph_summable, Summable.of_nonneg_of_le (fun _ => integral_nonneg fun _ => sq_nonneg _) ?_
    h.graph_summable, Summable.of_nonneg_of_le (fun _ => integral_nonneg fun _ => sq_nonneg _) ?_
    h.graph_summable⟩
  · intro i
    apply integral_mono (hu i) (hGraph i)
    intro t
    nlinarith only [sq_nonneg ‖velocity i t‖, sq_nonneg (eigenvalue i * ‖field i t‖)]
  · intro i
    exact integral_mono (hv i) (hGraph i) fun _ => le_add_of_nonneg_right (by positivity)
  · intro i
    simp_rw [hscale]
    apply integral_mono ((hu i).const_mul (eigenvalue i ^ 2)) (hGraph i)
    intro t
    nlinarith only [sq_nonneg ‖velocity i t‖, sq_nonneg ‖field i t‖]

end Synthesis

section HilbertSynthesis

variable {ι V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [CompleteSpace V]

/-- The weak incoming problem is solved coefficient by coefficient for
square-summable forcing and both signed half-order data. The signed
energy identity retains the two outgoing norms, and the graph norm
estimate has no length factor. -/
theorem cylinderWeakSynthesis {length : ℝ} (hlength : 0 < length)
    (eigenvalue : ι → ℝ) (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|)
    (left right : ι → V) (forcing : ι → ℝ → V)
    (hleft : ∀ i, eigenvalue i < 0 → left i = 0)
    (hright : ∀ i, 0 ≤ eigenvalue i → right i = 0)
    (hforcing : ∀ i, MemLp (forcing i) 2 (volume.restrict (Icc 0 length)))
    (hforcing_sq : Summable (fun i => ∫ t in Icc 0 length, ‖forcing i t‖ ^ 2))
    (hleft_sq : Summable (cylinderModalTraceEnergy eigenvalue left))
    (hright_sq : Summable (cylinderModalTraceEnergy eigenvalue right)) :
    let budget := (∑' i, ∫ t in Icc 0 length, ‖forcing i t‖ ^ 2) +
      (∑' i, cylinderModalTraceEnergy eigenvalue left i) +
      (∑' i, cylinderModalTraceEnergy eigenvalue right i)
    ∃ field, CylinderWeakModalSolution length eigenvalue left right forcing field ∧
      let velocity (i : ι) (t : ℝ) := forcing i t - eigenvalue i • field i t
      (∑' i, cylinderModalGraphEnergy length (eigenvalue i) (field i) (velocity i)) ≤
          (13 / 9 : ℝ) * budget ∧
        (∑' (i : ι), ∫ t in Icc 0 length, ‖velocity i t‖ ^ 2 + eigenvalue i ^ 2 * ‖field i t‖ ^ 2) +
          (∑' i, cylinderModalTraceEnergy eigenvalue (cylinderModalLeftOutgoing eigenvalue field) i) +
          (∑' i, cylinderModalTraceEnergy eigenvalue
            (cylinderModalRightOutgoing length eigenvalue field) i) = budget := by
  intro totalBudget
  let field (i : ι) := forcedCylinderMode length (eigenvalue i) (left i) (right i) (forcing i)
  let velocity (i : ι) (t : ℝ) := forcing i t - eigenvalue i • field i t
  let base (i : ι) := ∫ t in Icc 0 length, ‖velocity i t‖ ^ 2 + eigenvalue i ^ 2 * ‖field i t‖ ^ 2
  let graph (i : ι) := cylinderModalGraphEnergy length (eigenvalue i) (field i) (velocity i)
  let outLeft := cylinderModalTraceEnergy eigenvalue (cylinderModalLeftOutgoing eigenvalue field)
  let outRight := cylinderModalTraceEnergy eigenvalue (cylinderModalRightOutgoing length eigenvalue field)
  let fCost (i : ι) := ∫ t in Icc 0 length, ‖forcing i t‖ ^ 2
  let inLeft := cylinderModalTraceEnergy eigenvalue left
  let inRight := cylinderModalTraceEnergy eigenvalue right
  let budget (i : ι) := fCost i + inLeft i + inRight i
  have hbudget : Summable budget := (hforcing_sq.add hleft_sq).add hright_sq
  have htotal : ∑' i, budget i = totalBudget := by
    calc
      _ = (∑' i, (fCost i + inLeft i)) + (∑' i, inRight i) :=
        (hforcing_sq.add hleft_sq).tsum_add hright_sq
      _ = _ := congrArg (· + (∑' i, inRight i)) (hforcing_sq.tsum_add hleft_sq)
  have hin (i : ι) :
      |eigenvalue i| * ‖if eigenvalue i < 0 then right i else left i‖ ^ 2 =
        inLeft i + inRight i := by
    by_cases hi : eigenvalue i < 0
    · simp [hi, inLeft, inRight, cylinderModalTraceEnergy, hleft i hi]
    · simp [hi, inLeft, inRight, cylinderModalTraceEnergy, hright i (le_of_not_gt hi)]
  have hout (i : ι) :
      |eigenvalue i| * ‖field i (cylinderOutgoingEnd length (eigenvalue i))‖ ^ 2 =
        outLeft i + outRight i := by
    by_cases hi : eigenvalue i < 0 <;>
      simp [hi, outLeft, outRight, cylinderModalTraceEnergy,
        cylinderModalLeftOutgoing, cylinderModalRightOutgoing, cylinderOutgoingEnd]
  have henergy (i : ι) : base i + outLeft i + outRight i = budget i := by
    have h := forcedCylinderMode_weak_energy_balance hlength.le (eigenvalue i) (left i) (right i)
      (hforcing i)
    change (∫ t in 0..length, ‖velocity i t‖ ^ 2 + eigenvalue i ^ 2 * ‖field i t‖ ^ 2) +
        |eigenvalue i| * ‖field i (cylinderOutgoingEnd length (eigenvalue i))‖ ^ 2 =
        (∫ t in 0..length, ‖forcing i t‖ ^ 2) +
          |eigenvalue i| * ‖if eigenvalue i < 0 then right i else left i‖ ^ 2 at h
    rw [cylinderIcc_integral hlength.le, cylinderIcc_integral hlength.le, hin i, hout i] at h
    change base i + (outLeft i + outRight i) = fCost i + (inLeft i + inRight i) at h
    simpa only [← add_assoc, budget] using h
  have hbase_nonneg (i : ι) : 0 ≤ base i := integral_nonneg fun _ => by positivity
  have hleft_nonneg (i : ι) : 0 ≤ outLeft i := by
    unfold outLeft cylinderModalTraceEnergy
    positivity
  have hright_nonneg (i : ι) : 0 ≤ outRight i := by
    unfold outRight cylinderModalTraceEnergy
    positivity
  have hbase : Summable base := Summable.of_nonneg_of_le hbase_nonneg
    (fun i => by linarith [henergy i, hleft_nonneg i, hright_nonneg i]) hbudget
  have houtL : Summable outLeft := Summable.of_nonneg_of_le hleft_nonneg
    (fun i => by linarith [henergy i, hbase_nonneg i, hright_nonneg i]) hbudget
  have houtR : Summable outRight := Summable.of_nonneg_of_le hright_nonneg
    (fun i => by linarith [henergy i, hbase_nonneg i, hleft_nonneg i]) hbudget
  have hgraph_bound (i : ι) : graph i ≤ (13 / 9 : ℝ) * budget i := by
    have h := forcedCylinderMode_weak_graphEnergy_le hlength.le (hgap i) (left i) (right i)
      (hforcing i)
    change (∫ t in 0..length, ‖velocity i t‖ ^ 2 + (1 + eigenvalue i ^ 2) * ‖field i t‖ ^ 2) ≤
      (13 / 9 : ℝ) * ((∫ t in 0..length, ‖forcing i t‖ ^ 2) +
        |eigenvalue i| * ‖if eigenvalue i < 0 then right i else left i‖ ^ 2) at h
    rw [cylinderIcc_integral hlength.le, cylinderIcc_integral hlength.le, hin i] at h
    simpa only [graph, cylinderModalGraphEnergy, budget, fCost, add_assoc] using h
  have hgraph : Summable graph := Summable.of_nonneg_of_le
    (fun i => integral_nonneg fun _ => by positivity)
    hgraph_bound (hbudget.mul_left (13 / 9 : ℝ))
  refine ⟨field, ⟨fun i => forcedCylinderMode_memH1 hlength.le _ _ _ (hforcing i),
    fun i => forcedCylinderMode_at_incoming _ _ _ _ _, hgraph, houtL, houtR⟩, ?_⟩
  constructor
  · change (∑' i, graph i) ≤ _
    rw [← htotal, ← tsum_mul_left]
    exact hgraph.tsum_le_tsum hgraph_bound (hbudget.mul_left (13 / 9 : ℝ))
  · change (∑' i, base i) + (∑' i, outLeft i) + (∑' i, outRight i) = _
    calc
      _ = (∑' i, (base i + outLeft i)) + (∑' i, outRight i) :=
        congrArg (· + (∑' i, outRight i)) (hbase.tsum_add houtL).symm
      _ = ∑' i, (base i + outLeft i + outRight i) := ((hbase.add houtL).tsum_add houtR).symm
      _ = totalBudget := (tsum_congr henergy).trans htotal

end HilbertSynthesis

section HilbertRealization

variable {ι α 𝕜 H : Type*} [Countable ι] [MeasurableSpace α] [RCLike 𝕜]
  [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]

/-- A square-summable family of (L^2) coefficients gives an actual
(L^2) field in a supplied link Hilbert basis. The mode expansion holds
almost everywhere, and integration of Parseval gives exact bulk mass. -/
theorem cylinderModalHilbert_realize {μ : Measure α}
    (basis : HilbertBasis ι 𝕜 H) (coefficient : ι → α → 𝕜)
    (hcoeff : ∀ i, MemLp (coefficient i) 2 μ)
    (hsum : Summable (fun i => ∫ x, ‖coefficient i x‖ ^ 2 ∂μ)) :
    ∃ field : α → H, MemLp field 2 μ ∧
      (∀ᵐ x ∂μ, HasSum (fun i => coefficient i x • basis i) (field x) ∧
        ∀ i, basis.repr (field x) i = coefficient i x) ∧
      (∫ x, ‖field x‖ ^ 2 ∂μ) = ∑' i, ∫ x, ‖coefficient i x‖ ^ 2 ∂μ := by
  let density (i : ι) (x : α) := ‖coefficient i x‖ ^ 2
  have hInt (i : ι) : Integrable (density i) μ :=
    (memLp_two_iff_integrable_sq_norm (hcoeff i).aestronglyMeasurable).mp (hcoeff i)
  have hMeas (i : ι) : AEMeasurable (fun x => ENNReal.ofReal (density i x)) μ :=
    (hInt i).aemeasurable.ennreal_ofReal
  have hterm_nonneg (i : ι) : 0 ≤ ∫ x, density i x ∂μ := integral_nonneg fun _ => sq_nonneg _
  have hLIntegral : (∫⁻ x, ∑' i, ENNReal.ofReal (density i x) ∂μ) =
      ENNReal.ofReal (∑' i, ∫ x, density i x ∂μ) := by
    rw [lintegral_tsum hMeas, ENNReal.ofReal_tsum_of_nonneg hterm_nonneg hsum]
    exact tsum_congr fun i =>
      (ofReal_integral_eq_lintegral_ofReal (hInt i) (ae_of_all _ fun _ => sq_nonneg _)).symm
  have hfinite : ∀ᵐ x ∂μ, (∑' i, ENNReal.ofReal (density i x)) < ∞ :=
    ae_lt_top' (AEMeasurable.tsum hMeas) (hLIntegral ▸ ENNReal.ofReal_ne_top)
  let field (x : α) := ∑' i, coefficient i x • basis i
  have hpoint : ∀ᵐ x ∂μ,
      (HasSum (fun i => coefficient i x • basis i) (field x) ∧
        ∀ i, basis.repr (field x) i = coefficient i x) ∧
      (ENNReal.ofReal (‖field x‖ ^ 2) = ∑' i, ENNReal.ofReal (density i x)) := by
    filter_upwards [hfinite] with x hx
    have hs : Summable (fun i => density i x) := by
      have hs := ENNReal.summable_toReal hx.ne
      simpa only [ENNReal.toReal_ofReal (sq_nonneg _), density] using hs
    let coords : lp (fun _ : ι => 𝕜) 2 := ⟨fun i => coefficient i x, by
      apply (memℓp_gen_iff (by norm_num : 0 < (2 : ℝ≥0∞).toReal)).mpr
      simpa only [ENNReal.toReal_ofNat, Real.rpow_two, density] using hs⟩
    have hseries : HasSum (fun i => coefficient i x • basis i) (basis.repr.symm coords) :=
      basis.hasSum_repr_symm coords
    have hfield : field x = basis.repr.symm coords := hseries.tsum_eq
    refine ⟨⟨hfield ▸ hseries, ?_⟩, ?_⟩
    · intro i
      rw [hfield, basis.repr.apply_symm_apply]
    · rw [hfield, LinearIsometryEquiv.norm_map, ← ENNReal.ofReal_tsum_of_nonneg
        (fun i => sq_nonneg ‖coefficient i x‖) hs]
      congr 1
      simpa only [ENNReal.toReal_ofNat, Real.rpow_two, coords, density] using
        lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ℝ≥0∞).toReal) coords
  have hfield_meas : AEStronglyMeasurable field μ := by
    classical
    apply aestronglyMeasurable_of_tendsto_ae (f := fun s : Finset ι =>
      fun x => ∑ i ∈ s, coefficient i x • basis i) atTop
    · intro s
      exact s.aestronglyMeasurable_fun_sum fun i _ =>
        (hcoeff i).aestronglyMeasurable.smul aestronglyMeasurable_const
    · exact hpoint.mono fun _ hx => hx.1.1
  have hmass : (∫⁻ x, ENNReal.ofReal (‖field x‖ ^ 2) ∂μ) =
      ENNReal.ofReal (∑' i, ∫ x, density i x ∂μ) :=
    (lintegral_congr_ae (hpoint.mono fun _ hx => hx.2)).trans hLIntegral
  have hnorm_meas := hfield_meas.norm.pow 2
  refine ⟨field, (memLp_two_iff_integrable_sq_norm hfield_meas).mpr
    ⟨hnorm_meas, ?_⟩, hpoint.mono (fun _ hx => hx.1), ?_⟩
  · rw [hasFiniteIntegral_iff_ofReal (ae_of_all _ fun _ => sq_nonneg _), hmass]
    exact ENNReal.ofReal_lt_top
  · rw [integral_eq_lintegral_of_nonneg_ae (ae_of_all _ fun _ => sq_nonneg _) hnorm_meas,
      hmass, ENNReal.toReal_ofReal (tsum_nonneg hterm_nonneg)]

/-- The modal solution synthesizes the value, time velocity, and
tangentially weighted field as actual (L^2) fields in the supplied
link Hilbert space. Their modal coordinates and those of the assembled
forcing agree with the given coefficients on one almost-everywhere set. -/
theorem CylinderWeakModalSolution.realize {length : ℝ} {eigenvalue : ι → ℝ}
    {left right : ι → 𝕜} {forcing field : ι → ℝ → 𝕜}
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field)
    (basis : HilbertBasis ι 𝕜 H) :
    let ν := volume.restrict (Icc 0 length)
    ∃ U velocity AU : ℝ → H,
      MemLp U 2 ν ∧ MemLp velocity 2 ν ∧ MemLp AU 2 ν ∧
      (∀ᵐ t ∂ν, ∀ i, basis.repr (U t) i = field i t ∧
        basis.repr (velocity t) i = forcing i t - eigenvalue i • field i t ∧
        basis.repr (AU t) i = eigenvalue i • field i t ∧
        basis.repr (velocity t + AU t) i = forcing i t) := by
  intro ν
  let v (i : ι) (t : ℝ) := forcing i t - eigenvalue i • field i t
  let a (i : ι) (t : ℝ) := eigenvalue i • field i t
  obtain ⟨hUsum, hVsum, hAsum⟩ := h.summable_bulk_components
  obtain ⟨U, hU, hUrepr, _⟩ := cylinderModalHilbert_realize (μ := ν) basis field
    (fun i => (h.modes i).value_memLp) hUsum
  obtain ⟨velocity, hV, hVrepr, _⟩ := cylinderModalHilbert_realize (μ := ν) basis v
    (fun i => (h.modes i).velocity_memLp) hVsum
  obtain ⟨AU, hA, hArepr, _⟩ := cylinderModalHilbert_realize (μ := ν) basis a
    (fun i => (h.modes i).value_memLp.const_smul (eigenvalue i)) hAsum
  refine ⟨U, velocity, AU, hU, hV, hA, ?_⟩
  filter_upwards [hUrepr, hVrepr, hArepr] with t hu hv ha
  intro i
  refine ⟨hu.2 i, hv.2 i, ha.2 i, ?_⟩
  rw [map_add, lp.coeFn_add, Pi.add_apply, hv.2 i, ha.2 i, sub_add_cancel]

variable [NormedSpace ℝ H] [IsScalarTower ℝ 𝕜 H] [CompleteSpace H]

omit [Countable ι] in
/-- The synthesized velocity is the Hilbert-valued weak time
derivative. Verification on the complete link basis suffices. -/
theorem CylinderWeakModalSolution.weak_derivative_of_realization
    {length : ℝ} (hlength : 0 ≤ length) {eigenvalue : ι → ℝ}
    {left right : ι → 𝕜} {forcing field : ι → ℝ → 𝕜}
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field)
    (basis : HilbertBasis ι 𝕜 H) {U velocity : ℝ → H}
    (hU : MemLp U 2 (volume.restrict (Icc 0 length)))
    (hV : MemLp velocity 2 (volume.restrict (Icc 0 length)))
    (hcoords : ∀ᵐ t ∂volume.restrict (Icc 0 length), ∀ i,
      basis.repr (U t) i = field i t ∧
      basis.repr (velocity t) i = forcing i t - eigenvalue i • field i t)
    {test : ℝ → ℝ} (htest : ContDiff ℝ 1 test) (hleft : test 0 = 0)
    (hright : test length = 0) :
    (∫ t in 0..length, deriv test t • U t) =
      -(∫ t in 0..length, test t • velocity t) := by
  let ν := volume.restrict (Icc (0 : ℝ) length)
  let : IsFiniteMeasure ν := isFiniteMeasure_restrict.mpr isCompact_Icc.measure_lt_top.ne
  have hU_int : IntegrableOn U (Icc 0 length) volume :=
    hU.integrable (by norm_num : (1 : ℝ≥0∞) ≤ 2)
  have hV_int : IntegrableOn velocity (Icc 0 length) volume :=
    hV.integrable (by norm_num : (1 : ℝ≥0∞) ≤ 2)
  have hIntU : IntervalIntegrable (fun t => deriv test t • U t) volume 0 length := by
    apply intervalIntegrable_iff.mpr
    rw [uIoc_of_le hlength]
    exact (hU_int.continuousOn_smul htest.continuous_deriv_one.continuousOn
      isCompact_Icc).mono_set Ioc_subset_Icc_self
  have hIntV : IntervalIntegrable (fun t => test t • velocity t) volume 0 length := by
    apply intervalIntegrable_iff.mpr
    rw [uIoc_of_le hlength]
    exact (hV_int.continuousOn_smul htest.continuous.continuousOn
      isCompact_Icc).mono_set Ioc_subset_Icc_self
  have hsub : uIoc 0 length ⊆ Icc 0 length := by
    rw [uIoc_of_le hlength]
    exact Ioc_subset_Icc_self
  have hcoords' : ∀ᵐ t ∂volume.restrict (uIoc 0 length), ∀ i,
      basis.repr (U t) i = field i t ∧
      basis.repr (velocity t) i = forcing i t - eigenvalue i • field i t :=
    ae_mono (Measure.restrict_mono hsub (le_refl volume)) hcoords
  apply basis.repr.injective
  ext i
  let coordK : H →L[𝕜] 𝕜 :=
    (lp.evalCLM 𝕜 (fun _ : ι => 𝕜) 2 i).comp basis.repr.toContinuousLinearEquiv.toContinuousLinearMap
  let coord : H →L[ℝ] 𝕜 := coordK.restrictScalars ℝ
  change coord (∫ t in 0..length, deriv test t • U t) =
    coord (-(∫ t in 0..length, test t • velocity t))
  rw [map_neg, ← coord.intervalIntegral_comp_comm hIntU, ← coord.intervalIntegral_comp_comm hIntV]
  have hleft_eq : (∫ t in 0..length, coord (deriv test t • U t)) =
      ∫ t in 0..length, deriv test t • field i t := by
    apply intervalIntegral.integral_congr_ae_restrict
    filter_upwards [hcoords'] with t ht
    rw [map_smul]
    exact congrArg (fun z : 𝕜 => deriv test t • z) (ht i).1
  have hright_eq : (∫ t in 0..length, coord (test t • velocity t)) =
      ∫ t in 0..length, test t • (forcing i t - eigenvalue i • field i t) := by
    apply intervalIntegral.integral_congr_ae_restrict
    filter_upwards [hcoords'] with t ht
    rw [map_smul]
    exact congrArg (fun z : 𝕜 => test t • z) (ht i).2
  rw [hleft_eq, hright_eq]
  exact (h.modes i).weak_derivative hlength htest hleft hright

end HilbertRealization

end FirstOrderTwistor
