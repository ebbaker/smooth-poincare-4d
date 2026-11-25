import FirstOrderTwistor.AccountingLimits
import FirstOrderTwistor.ComponentBudgets
import FirstOrderTwistor.MeasureAccounting
import SectionsAndConnections.FiniteAccounting
import Mathlib.MeasureTheory.Measure.FiniteMeasure
import Mathlib.Algebra.BigOperators.Option

/-!
# Finite component accounting

The comparison spaces can differ from one another and from the source. Fixed
truncations are compared along a single sequence. Their union may omit null
sets in the component, for instance removable points. Source images need only
be disjoint up to null boundaries for sufficiently large indices.

Geometric applications supply the energy measures, fixed-domain comparisons
and strip estimates on the physical sequence. The limiting accounting equality
is a conclusion.
-/

open Filter MeasureTheory Set Topology
open scoped BigOperators

namespace FirstOrderTwistor

variable {X ι κ : Type*} [MeasurableSpace X]

/-- Mass data on finite component truncations. The first natural argument of
`image` is the truncation and the second is the source index. -/
structure TruncationFamily (μ : ℕ → Measure X) (J : Finset ι)
    (Y : ι → Type*) [∀ j, MeasurableSpace (Y j)] where
  energy : (j : ι) → FiniteMeasure (Y j)
  domain : (j : ι) → ℕ → Set (Y j)
  image : ι → ℕ → ℕ → Set X
  increasing : ∀ j ∈ J, Monotone (domain j)
  exhausts : ∀ j ∈ J, (⋃ L, domain j L) =ᵐ[(energy j).toMeasure] univ
  imageMeasurable : ∀ L, ∀ᶠ i in atTop, ∀ j ∈ J, MeasurableSet (image j L i)
  imageDisjoint : ∀ L, ∀ᶠ i in atTop, Set.Pairwise (↑J)
    (fun j k => AEDisjoint (μ i) (image j L i) (image k L i))
  compareMass : ∀ j ∈ J, ∀ L, Tendsto (fun i => (μ i).real (image j L i))
    atTop (𝓝 ((energy j).toMeasure.real (domain j L)))

/-- A finite collection of strips and their individual estimated costs.
The index set may vary with the source index and truncation. -/
structure StripFamily (X κ : Type*) where
  indices : Finset κ
  strip : κ → Set X
  error : κ → ℝ

namespace TruncationFamily

variable {μ : ℕ → Measure X} {J : Finset ι}
    {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ J Y)

/-- Source region outside every comparison image at the given indices. -/
def remainder (L i : ℕ) : Set X := (⋃ j ∈ J, F.image j L i)ᶜ

/-- All energy of each comparison component, including its entire end. -/
noncomputable def componentEnergy (j : ι) : ℝ := (F.energy j).toMeasure.real univ

private theorem tendstoCaptured (L : ℕ) :
    Tendsto (fun i => ∑ j ∈ J, (μ i).real (F.image j L i)) atTop
      (𝓝 (∑ j ∈ J, (F.energy j).toMeasure.real (F.domain j L))) :=
  tendsto_finsetSum _ fun j hj => F.compareMass j hj L

private theorem tendstoExhausted :
    Tendsto (fun L => ∑ j ∈ J, (F.energy j).toMeasure.real (F.domain j L)) atTop
      (𝓝 (∑ j ∈ J, F.componentEnergy j)) := by
  refine tendsto_finsetSum _ fun j hj => ?_
  unfold componentEnergy
  rw [← measureReal_congr (F.exhausts j hj)]
  exact (ENNReal.tendsto_toReal (measure_ne_top _ _)).comp
    (tendsto_measure_iUnion_atTop (F.increasing j hj))

variable [∀ i, IsFiniteMeasure (μ i)]

private theorem eventually_split (L : ℕ) :
    ∀ᶠ i in atTop, (μ i).real univ = (∑ j ∈ J, (μ i).real (F.image j L i)) +
      (μ i).real (F.remainder L i) := by
  filter_upwards [F.imageMeasurable L, F.imageDisjoint L] with i hm hd
  exact measureReal_univ_eq_sum_add_compl _ _ _ hm hd

private theorem captured_le_total (L : ℕ) :
    ∀ᶠ i in atTop, (∑ j ∈ J, (μ i).real (F.image j L i)) ≤ (μ i).real univ := by
  filter_upwards [F.eventually_split L] with i hi
  rw [hi]
  exact le_add_of_nonneg_right measureReal_nonneg

/-- The one-sided accounting inequality needs only the comparison images. -/
theorem sum_componentEnergy_le {e : ℝ} (ht : Tendsto (fun i => (μ i).real univ) atTop (𝓝 e)) :
    ∑ j ∈ J, F.componentEnergy j ≤ e :=
  accountedEnergy_le_totalEnergy ht F.tendstoCaptured F.tendstoExhausted F.captured_le_total

/-- At fixed truncation the actual complementary mass has a limit, regardless
of the existence of any bound on the intervening necks. -/
theorem tendsto_remainder (L : ℕ) {e : ℝ} (ht : Tendsto (fun i => (μ i).real univ) atTop (𝓝 e)) :
    Tendsto (fun i => (μ i).real (F.remainder L i)) atTop
      (𝓝 (e - ∑ j ∈ J, (F.energy j).toMeasure.real (F.domain j L))) := by
  apply (tendstoAccountingRemainder ht F.tendstoCaptured L).congr'
  filter_upwards [F.eventually_split L] with i hi
  exact sub_eq_of_eq_add (hi.trans (add_comm _ _))

/-- Exhausting after taking the source limit measures the precise energy defect. -/
theorem tendsto_limsup_remainder {e : ℝ} (ht : Tendsto (fun i => (μ i).real univ) atTop (𝓝 e)) :
    Tendsto (fun L => limsup (fun i => (μ i).real (F.remainder L i)) atTop) atTop
      (𝓝 (e - ∑ j ∈ J, F.componentEnergy j)) := by
  simpa only [(F.tendsto_remainder _ ht).limsup_eq] using
    (tendsto_const_nhds (x := e) |>.sub F.tendstoExhausted)

end TruncationFamily

/-- An upper estimate on each strip, with separate iterated bounds on the sum
of all errors and the actual uncovered mass. -/
structure RemainderEstimates {μ : ℕ → Measure X} {J : Finset ι}
    {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)] (F : TruncationFamily μ J Y) (κ : Type*) where
  strips : ℕ → ℕ → StripFamily X κ
  bounds : ∀ᶠ L in atTop, ∀ᶠ i in atTop, ∀ k ∈ (strips L i).indices,
    (μ i).real ((strips L i).strip k) ≤ (strips L i).error k
  sumSmall : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
    (∑ k ∈ (strips L i).indices, (strips L i).error k) ≤ ε
  uncoveredSmall : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
    (μ i).real (F.remainder L i \ ⋃ k ∈ (strips L i).indices, (strips L i).strip k) ≤ ε

/-- For a fixed finite strip family, the individual iterated smallness
estimates (for instance from buffered charts or transverse fields) sum.
For growing families the summed bound in `RemainderEstimates` remains necessary. -/
theorem smallSumOfFiniteStripErrors (K : Finset κ) (error : κ → ℕ → ℕ → ℝ)
    (h : ∀ k ∈ K, ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop, error k L i ≤ ε) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop, (∑ k ∈ K, error k L i) ≤ ε := by
  classical
  induction K using Finset.induction_on with
  | empty => exact fun ε hε => .of_forall fun _ => .of_forall fun _ => by simpa using hε.le
  | @insert k K hk ih =>
    intro ε hε
    have hhead := h k (Finset.mem_insert_self ..) _ (half_pos hε)
    have htail := ih (fun j hj => h j (Finset.mem_insert_of_mem hj)) _ (half_pos hε)
    filter_upwards [hhead, htail] with L hl hr
    filter_upwards [hl, hr] with i hi hi'
    rw [Finset.sum_insert hk]
    exact (add_le_add hi hi').trans_eq (add_halves ε)

/-- Build the remainder estimate from separately controlled physical strips
when the index family is fixed. Different strips may use different analytic bounds. -/
def RemainderEstimates.ofFixedStrips {μ : ℕ → Measure X} {J : Finset ι}
    {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ J Y) (K : Finset κ) (strip : κ → ℕ → ℕ → Set X)
    (cost : κ → ℕ → ℕ → ℝ)
    (hbound : ∀ᶠ L in atTop, ∀ᶠ i in atTop, ∀ k ∈ K, (μ i).real (strip k L i) ≤ cost k L i)
    (hsmall : ∀ k ∈ K, ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop, cost k L i ≤ ε)
    (huncovered : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (μ i).real (F.remainder L i \ ⋃ k ∈ K, strip k L i) ≤ ε) : RemainderEstimates F κ where
  strips L i := ⟨K, fun k => strip k L i, fun k => cost k L i⟩
  bounds := hbound
  sumSmall := smallSumOfFiniteStripErrors K cost hsmall
  uncoveredSmall := huncovered

variable {μ : ℕ → Measure X} [∀ i, IsFiniteMeasure (μ i)]

/-- The sum of all component energies equals the total limit when the strip
estimates account for the complement, including gaps between charts. -/
theorem energyIdentityOfCoveredRemainder {J : Finset ι}
    {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ J Y) (R : RemainderEstimates F κ)
    {e : ℝ} (ht : Tendsto (fun i => (μ i).real univ) atTop (𝓝 e)) :
    e = ∑ j ∈ J, F.componentEnergy j := by
  apply totalEnergy_eq_accountedEnergy ht F.tendstoCaptured F.tendstoExhausted F.captured_le_total
  intro ε hε
  filter_upwards [R.bounds, R.sumSmall _ (half_pos hε), R.uncoveredSmall _ (half_pos hε)]
    with L hb hs hu
  filter_upwards [F.eventually_split L, hb, hs, hu] with i hsplit hbound hsum huncovered
  have hr := measureReal_le_sum_add_uncovered (μ i) (F.remainder L i)
    (R.strips L i).indices (R.strips L i).strip (R.strips L i).error hbound
  linarith

/-- A distinguished base (`none`) and finitely many bubbles (`some j`).
The component energies are masses, hence nonnegative. Geometry supplies
the two gap alternatives and the strict residual for each positive bubble. -/
theorem noPositiveBubbleOfCoveredRemainder [DecidableEq ι] (J : Finset ι)
    {Y : Option ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ (Finset.insertNone J) Y) (R : RemainderEstimates F κ)
    {e δ : ℝ} (ht : Tendsto (fun i => (μ i).real univ) atTop (𝓝 e))
    (hδ : 0 < δ) (hlo : 4 * Real.pi ^ 2 ≤ e) (hhi : e ≤ 8 * Real.pi ^ 2 - δ)
    (hbase : F.componentEnergy none = 0 ∨ 4 * Real.pi ^ 2 < F.componentEnergy none)
    (hgap : ∀ j ∈ J, F.componentEnergy (some j) = 0 ∨ 4 * Real.pi ^ 2 < F.componentEnergy (some j))
    (hres : ∀ j ∈ J, 0 < F.componentEnergy (some j) → 0 < e - F.componentEnergy (some j)) :
    (∀ j ∈ J, F.componentEnergy (some j) = 0) ∧ e = F.componentEnergy none := by
  have hid := energyIdentityOfCoveredRemainder F R ht
  rw [Finset.sum_insertNone] at hid
  exact SectionsAndConnections.noPositiveBubbleOfFiniteAccounting J e _ δ _ hδ
    measureReal_nonneg (fun _ _ => measureReal_nonneg) hlo hhi hid hbase hgap hres

/-- Exclusion with the strict residual itself derived from the source Euler
identity, the ALE Ricci budget and the Yamabe deficit. Here `Yhat j` is
the Yamabe constant of the supplied smooth compactification of bubble `j`. -/
theorem bubbleEnergyZeroOfRicciYamabeBounds [DecidableEq ι] (J : Finset ι)
    {Y : Option ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ (Finset.insertNone J) Y) (R : RemainderEstimates F κ)
    {e δ y D : ℝ} (Yhat : ι → ℝ)
    (ht : Tendsto (fun i => (μ i).real univ) atTop (𝓝 e))
    (hδ : 0 < δ) (hlo : 4 * Real.pi ^ 2 ≤ e) (hhi : e ≤ 8 * Real.pi ^ 2 - δ)
    (hbase : F.componentEnergy none = 0 ∨ 4 * Real.pi ^ 2 < F.componentEnergy none)
    (hgap : ∀ j ∈ J, F.componentEnergy (some j) = 0 ∨ 4 * Real.pi ^ 2 < F.componentEnergy (some j))
    (hEuler : D = y ^ 2 / 12 - 4 * (8 * Real.pi ^ 2 - e)) (hy : 0 ≤ y)
    (hRicci : ∀ j ∈ J, 4 * F.componentEnergy (some j) ≤ D)
    (hYamabe : ∀ j ∈ J, 0 < F.componentEnergy (some j) →
      y ≤ Yhat j ∧ Yhat j < roundYamabeConstant) :
    (∀ j ∈ J, F.componentEnergy (some j) = 0) ∧ e = F.componentEnergy none := by
  apply noPositiveBubbleOfCoveredRemainder J F R ht hδ hlo hhi hbase hgap
  intro j hj hpos
  obtain ⟨hTransfer, hStrict⟩ := hYamabe j hj hpos
  exact (strictComponentResidual e _ y (Yhat j) D _ hEuler rfl (hRicci j hj)
    hy hTransfer hStrict).2.2.2

end FirstOrderTwistor
