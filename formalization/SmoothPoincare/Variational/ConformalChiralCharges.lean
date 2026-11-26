import DifferentialGeometry.Geometry.Curvature.Conformal
import FirstOrderTwistor.ConformalEnergy
import SmoothPoincare.Variational.BalancedPhysicalDivision

/-! # The signed Weyl energy measures of a smooth conformal variation -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Metric DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor0SBundle
open FirstOrderTwistor MeasureTheory SectionsAndConnections
open scoped ContDiff Manifold

namespace SmoothPoincare

noncomputable section

/-- The anti-self-dual compression of a metric Kulkarni–Nomizu term is pure trace. -/
theorem antiSelfDualCurvatureBlock_metricKulkarniNomizu (S : Matrix (Fin 4) (Fin 4) ℝ)
    (hS : ∀ a b, S a b = S b a) :
    antiSelfDualCurvatureBlock (metricKulkarniNomizuFrameTensor S) = (S.trace / 2) • 1 := by
  have hEntry (a b c d : Fin 4) : metricKulkarniNomizuFrameTensor S a b c d =
      (if a = c then 1 else 0) * S b d + S a c * (if b = d then 1 else 0) -
      (if a = d then 1 else 0) * S b c - S a d * (if b = c then 1 else 0) := rfl
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [antiSelfDualCurvatureBlock, hEntry, selfDualFirstWedge, selfDualSecondWedge,
      Matrix.smul_apply, Matrix.one_apply, Matrix.trace, Fin.sum_univ_four] <;>
    linarith only [hS 0 1, hS 0 2, hS 0 3, hS 1 2, hS 1 3, hS 2 3]

/-- A nonnegative scaling of an ordered spectrum preserves its ordering and its
orthogonal diagonalization. -/
theorem OrderedEndpointSpectrum.smul {W : Matrix (Fin 3) (Fin 3) ℝ} {s : Fin 3 → ℝ}
    (h : OrderedEndpointSpectrum W s) (r : ℝ) (hr : 0 ≤ r) :
    OrderedEndpointSpectrum (r • W) (r • s) := by
  refine ⟨fun _ _ hij => mul_le_mul_of_nonneg_left (h.ordered hij) hr, ?_⟩
  obtain ⟨Q, hQ, hW⟩ := h.diagonalization
  refine ⟨Q, hQ, ?_⟩
  rw [hW, Matrix.diagonal_smul, Matrix.mul_smul, Matrix.smul_mul]

private theorem traceFreeChiralBlock_smul_add_scalar (r q : ℝ) (B : Matrix (Fin 3) (Fin 3) ℝ) :
    traceFreeChiralBlock (r • (B + q • 1)) = r • traceFreeChiralBlock B := by
  unfold traceFreeChiralBlock
  simp only [Matrix.trace_smul, Matrix.trace_add, Matrix.trace_one, Fintype.card_fin,
    Nat.cast_ofNat, smul_eq_mul]
  ext i j
  simp only [Matrix.sub_apply, Matrix.add_apply, Matrix.smul_apply, smul_eq_mul]
  ring

private theorem selfDualCurvatureBlock_smul_add (r : ℝ) (R S : CurvatureFrameTensor) :
    selfDualCurvatureBlock (r • (R + S)) =
      r • (selfDualCurvatureBlock R + selfDualCurvatureBlock S) := by
  ext i j
  simp only [Matrix.smul_apply, Matrix.add_apply]
  simp only [selfDualCurvatureBlock, Pi.smul_apply, Pi.add_apply, smul_eq_mul]
  ring

private theorem antiSelfDualCurvatureBlock_smul_add (r : ℝ) (R S : CurvatureFrameTensor) :
    antiSelfDualCurvatureBlock (r • (R + S)) =
      r • (antiSelfDualCurvatureBlock R + antiSelfDualCurvatureBlock S) := by
  ext i j
  simp only [Matrix.smul_apply, Matrix.add_apply]
  simp only [antiSelfDualCurvatureBlock, Pi.smul_apply, Pi.add_apply, smul_eq_mul]
  ring

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

/-- A conformal change rescales each tangent basis vector by the same positive factor,
giving a positively oriented orthonormal basis for the new metric. -/
def conformalOrientedFrameAt {g : SmoothRiemannianMetric I M} (u : C^∞⟮I, M; ℝ⟯)
    {o : ManifoldOrientation I M 4} {x : M} (f : OrientedOrthonormalFrameAt g o x) :
    OrientedOrthonormalFrameAt (conformalMetric g u) o x := by
  let e := LinearEquiv.smulOfNeZero ℝ (TangentSpace I x) (Real.exp (-u x)) (Real.exp_ne_zero _)
  refine ⟨f.basis.map e, ?_, ?_⟩
  · intro i j
    change (conformalMetric g u).inner x (Real.exp (-u x) • f.basis i)
      (Real.exp (-u x) • f.basis j) = _
    rw [conformalMetric_inner]
    simp only [map_smul, smul_apply, smul_eq_mul, f.orthonormal]
    have h : Real.exp (2 * u x) * (Real.exp (-u x) * Real.exp (-u x)) = 1 := by
      rw [← Real.exp_add, ← Real.exp_add]
      convert Real.exp_zero using 2
      ring
    rw [← mul_assoc (Real.exp (-u x)), ← mul_assoc (Real.exp (2 * u x)), h, one_mul]
  · rw [← f.oriented, Module.Basis.orientation_comp_linearEquiv_eq_iff_det_pos]
    have he : (e : TangentSpace I x →ₗ[ℝ] TangentSpace I x) =
        Real.exp (-u x) • LinearMap.id := by ext v; rfl
    rw [he, LinearMap.det_smul, LinearMap.det_id, mul_one]
    positivity

@[simp]
theorem conformalOrientedFrameAt_basis {g : SmoothRiemannianMetric I M}
    (u : C^∞⟮I, M; ℝ⟯) {o : ManifoldOrientation I M 4} {x : M}
    (f : OrientedOrthonormalFrameAt g o x) (i : Fin 4) :
    (conformalOrientedFrameAt u f).basis i = Real.exp (-u x) • f.basis i := rfl

private def kulkarni {V : Type*} (G S : V → V → ℝ) (a b c d : V) : ℝ :=
  S b c * G a d + S a d * G b c - S a c * G b d - S b d * G a c

private theorem kulkarni_isAlg {V : Type*} [AddCommGroup V] [Module ℝ V]
    (G S : V → V → ℝ)
    (hGa : ∀ a b c, G (a + b) c = G a c + G b c)
    (hGs : ∀ (r : ℝ) a b, G (r • a) b = r * G a b)
    (hGsym : ∀ a b, G a b = G b a)
    (hSa : ∀ a b c, S (a + b) c = S a c + S b c)
    (hSs : ∀ (r : ℝ) a b, S (r • a) b = r * S a b)
    (hSsym : ∀ a b, S a b = S b a) : IsAlgCurvForm (kulkarni G S) where
  add_left := by intros; simp only [kulkarni, hGa, hSa]; ring
  smul_left := by intros; simp only [kulkarni, hGs, hSs]; ring
  anti_first := by intros; simp only [kulkarni]; ring
  anti_last := by intros; simp only [kulkarni]; ring
  bianchi := by
    intro a b c d
    simp only [kulkarni]
    rw [hGsym c b, hGsym c a, hGsym b a, hSsym c b, hSsym c a, hSsym b a]
    ring

variable [T2Space M] [I.Boundaryless] [BoundarylessManifold I M]

private def conformalCurvatureCorrection (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (x : M) (a b : TangentSpace I x) : ℝ :=
  -hessFun g u x a b + mvfderiv I u x a * mvfderiv I u x b -
    (g.inner x (gradFun g u x) (gradFun g u x) / 2) * g.inner x a b

omit [T2Space M] [BoundarylessManifold I M] in
private theorem conformalCurvatureCorrection_symm (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (x : M) (a b : TangentSpace I x) :
    conformalCurvatureCorrection g u x a b = conformalCurvatureCorrection g u x b a := by
  unfold conformalCurvatureCorrection
  rw [hessFun_symm_of_boundaryless g u.contMDiff x a b, g.symm x a b]
  ring

-- Polarization of the pinned sectional formula, as in the pinned ConformalOperator proof.
private theorem metricRm04StandardAt_conformal (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (x : M) (a b c d : TangentSpace I x) :
    metricRm04StandardAt (conformalMetric g u) x a b c d = Real.exp (2 * u x) *
      (metricRm04StandardAt g x a b c d +
        kulkarni (fun v w => g.inner x v w) (conformalCurvatureCorrection g u x) a b c d) := by
  have hg : conformalMetricOfContDiff g u u.contMDiff = conformalMetric g u := by
    apply SmoothRiemannianMetric.ext_inner
    intro y v w
    rw [conformalMetricOfContDiff_inner, conformalMetric_inner]
  rw [← hg]
  let G := fun v w : TangentSpace I x => g.inner x v w
  let S := conformalCurvatureCorrection g u x
  have hK : IsAlgCurvForm (kulkarni G S) := by
    apply kulkarni_isAlg
    · intro v w z; simp only [G, map_add, add_apply]
    · intro r v w; simp only [G, map_smul, smul_apply, smul_eq_mul]
    · exact g.symm x
    · intro v w z
      simp only [S, conformalCurvatureCorrection, map_add, add_apply, LinearMap.add_apply]
      ring
    · intro r v w
      simp only [S, conformalCurvatureCorrection, map_smul, smul_apply, LinearMap.smul_apply,
        smul_eq_mul]
      ring
    · exact conformalCurvatureCorrection_symm g u x
  have hR : IsAlgCurvForm (metricRm04StandardAt g x) :=
    mem_algebraicCurvatureTensorSubmodule.mp (metricRm04At_mem_algebraicCurvatureTensorSubmodule g x)
  have hR' : IsAlgCurvForm (metricRm04StandardAt (conformalMetricOfContDiff g u u.contMDiff) x) :=
    mem_algebraicCurvatureTensorSubmodule.mp
      (metricRm04At_mem_algebraicCurvatureTensorSubmodule (conformalMetricOfContDiff g u u.contMDiff) x)
  have heq := hR'.ext ((hR.add hK).smul (Real.exp (2 * u x))) (by
    intro v w
    rw [hR'.anti_last v w v w, metricRm04StdAt_conformalMetric_plane]
    rw [hR.anti_last v w v w]
    simp only [kulkarni, S, G, conformalCurvatureCorrection]
    rw [hessFun_symm_of_boundaryless g u.contMDiff x w v, g.symm x w v]
    ring)
  exact heq a b c d

private theorem metricRm04StandardAt_smul_four (g : SmoothRiemannianMetric I M)
    (x : M) (r : ℝ) (a b c d : TangentSpace I x) :
    metricRm04StandardAt g x (r • a) (r • b) (r • c) (r • d) =
      r ^ 4 * metricRm04StandardAt g x a b c d := by
  let : NormedAddCommGroup (TangentSpace I x →L[ℝ] TangentSpace I x) :=
    ContinuousLinearMap.toNormedAddCommGroup
  let : NormedSpace ℝ (TangentSpace I x →L[ℝ] TangentSpace I x) :=
    ContinuousLinearMap.toNormedSpace
  let : NormedAddCommGroup
      (TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] TangentSpace I x) :=
    ContinuousLinearMap.toNormedAddCommGroup
  let : NormedSpace ℝ (TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] TangentSpace I x) :=
    ContinuousLinearMap.toNormedSpace
  rw [rm04_eq_inner_riem, rm04_eq_inner_riem]
  simp only [map_smul, smul_apply, smul_eq_mul]
  ring

private theorem metricCurvatureFrameTensor_conformal (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt g o x) :
    let S : Matrix (Fin 4) (Fin 4) ℝ :=
      Matrix.of fun a b => conformalCurvatureCorrection g u x (f.basis a) (f.basis b)
    metricCurvatureFrameTensor (conformalMetric g u) o x (conformalOrientedFrameAt u f) =
      Real.exp (-2 * u x) • (metricCurvatureFrameTensor g o x f +
        metricKulkarniNomizuFrameTensor S) := by
  intro S
  have hK (a b c d : Fin 4) :
      kulkarni (fun v w => g.inner x v w) (conformalCurvatureCorrection g u x)
        (f.basis a) (f.basis b) (f.basis d) (f.basis c) =
          metricKulkarniNomizuFrameTensor S a b c d := by
    unfold kulkarni
    simp only [f.orthonormal]
    change S b d * (if a = c then 1 else 0) + S a c * (if b = d then 1 else 0) -
      S a d * (if b = c then 1 else 0) - S b c * (if a = d then 1 else 0) =
      (if a = c then 1 else 0) * S b d + S a c * (if b = d then 1 else 0) -
      (if a = d then 1 else 0) * S b c - S a d * (if b = c then 1 else 0)
    ring
  funext a b c d
  simp only [metricCurvatureFrameTensor, conformalOrientedFrameAt_basis, Pi.smul_apply,
    Pi.add_apply, smul_eq_mul]
  rw [metricRm04StandardAt_smul_four, metricRm04StandardAt_conformal, ← mul_assoc, hK]
  congr 1
  rw [← Real.exp_nat_mul, ← Real.exp_add]
  congr 1
  ring

private theorem geometricChiralBlock_conformal (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt g o x) :
    geometricChiralBlock (conformalMetric g u) o x (conformalOrientedFrameAt u f) =
      Real.exp (-2 * u x) • geometricChiralBlock g o x f := by
  unfold geometricChiralBlock
  rw [metricCurvatureFrameTensor_conformal, selfDualCurvatureBlock_smul_add,
    selfDualCurvatureBlock_metricKulkarniNomizu, traceFreeChiralBlock_smul_add_scalar]
  exact fun a b => conformalCurvatureCorrection_symm g u x (f.basis a) (f.basis b)

private theorem endpointNegativeWeylBlock_conformal (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt g o x) :
    endpointNegativeWeylBlock (conformalMetric g u) o x (conformalOrientedFrameAt u f) =
      Real.exp (-2 * u x) • endpointNegativeWeylBlock g o x f := by
  unfold endpointNegativeWeylBlock
  rw [metricCurvatureFrameTensor_conformal, antiSelfDualCurvatureBlock_smul_add,
    antiSelfDualCurvatureBlock_metricKulkarniNomizu, traceFreeChiralBlock_smul_add_scalar]
  exact fun a b => conformalCurvatureCorrection_symm g u x (f.basis a) (f.basis b)

/-- The geometric Weyl block of either chirality scales by the inverse metric
factor in the matched positively oriented orthonormal frames. -/
theorem signedCollarWeylBlock_conformal (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (sign : CollarChirality) (x : M) :
    signedCollarWeylBlock o (conformalMetric g u)
        (fun y => conformalOrientedFrameAt u (frame y)) sign x =
      Real.exp (-2 * u x) • signedCollarWeylBlock o g frame sign x := by
  cases sign
  · exact geometricChiralBlock_conformal g u o x (frame x)
  · exact endpointNegativeWeylBlock_conformal g u o x (frame x)

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

section Measures

variable [SigmaCompactSpace M]

/-- The actual energy measures of both chiralities agree under a smooth conformal
change, with equality as measures on the underlying oriented four-manifold. -/
theorem signedChiralEnergyMeasure_conformalMetric (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (sign : CollarChirality) :
    energyMeasure (riemannianVolumeMeasure I M (conformalMetric g u))
        (fun x => hilbertSchmidtSq (signedCollarWeylBlock o (conformalMetric g u)
          (fun y => conformalOrientedFrameAt u (frame y)) sign x)) =
      energyMeasure (riemannianVolumeMeasure I M g)
        (fun x => hilbertSchmidtSq (signedCollarWeylBlock o g frame sign x)) :=
  riemannianChiralEnergyMeasure_conformalMetric o.dimension_eq g u
    (ae_of_all _ (signedCollarWeylBlock_conformal g u o frame sign))

end Measures

private theorem signedChiralDensity_conformal_cancel (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (sign : CollarChirality) (x : M) :
    Real.exp (4 * u x) * hilbertSchmidtSq (signedCollarWeylBlock o (conformalMetric g u)
        (fun y => conformalOrientedFrameAt u (frame y)) sign x) =
      hilbertSchmidtSq (signedCollarWeylBlock o g frame sign x) := by
  rw [signedCollarWeylBlock_conformal]
  exact hilbertSchmidtSq_conformal_cancel (u x) _

namespace SignedCollarMetric

variable [CompactSpace M] {o : ManifoldOrientation I M 4}

private theorem chiralFrameEnergy_conformal (g : SignedCollarMetric o)
    (u : C^∞⟮I, M; ℝ⟯) (sign : CollarChirality) :
    chiralFrameEnergy (conformalMetric g.metric u)
        (signedCollarWeylBlock o (conformalMetric g.metric u)
          (fun y => conformalOrientedFrameAt u (g.frame y)) sign) = g.energy sign := by
  rw [energy, chiralFrameEnergy, chiralFrameEnergy,
    integral_conformalMetric_eq_integral_smul_exp, o.dimension_eq, Nat.cast_ofNat]
  apply integral_congr_ae
  exact ae_of_all _ (signedChiralDensity_conformal_cancel g.metric u o g.frame sign)

/-- The conformal metric carries the same two physical energies and hence the
same signature-zero relation as the given metric. -/
def conformal (g : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯) : SignedCollarMetric o where
  metric := conformalMetric g.metric u
  frame x := conformalOrientedFrameAt u (g.frame x)
  integrable sign := by
    let w : M → ENNReal := fun x => ENNReal.ofReal (Real.exp (4 * u x))
    have hw : Measurable w :=
      (Real.continuous_exp.measurable.comp
        (measurable_const.mul u.contMDiff.continuous.measurable)).ennreal_ofReal
    rw [riemannianVolumeMeasure_conformalMetric, o.dimension_eq, Nat.cast_ofNat,
      integrable_withDensity_iff_integrable_smul' hw (ae_of_all _ fun _ => ENNReal.ofReal_lt_top)]
    simpa only [w, ENNReal.toReal_ofReal (Real.exp_pos _).le, smul_eq_mul,
      signedChiralDensity_conformal_cancel] using g.integrable sign
  signature_zero := by
    rw [chiralFrameEnergy_conformal, chiralFrameEnergy_conformal]
    exact g.signature_zero

/-- Equality of the actual positive or negative physical measure throughout
the underlying manifold. -/
theorem chiralMeasure_conformal (g : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯)
    (sign : CollarChirality) : (g.conformal u).chiralMeasure sign = g.chiralMeasure sign :=
  signedChiralEnergyMeasure_conformalMetric g.metric u o g.frame sign

/-- Conformal changes save no physical charge, on any region and in either
chirality. -/
theorem charge_conformal (g : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯)
    (sign : CollarChirality) (A : Set M) :
    (g.conformal u).charge sign A = g.charge sign A :=
  congrArg (fun μ : Measure M => μ.real A) (g.chiralMeasure_conformal u sign)

/-- In particular, a conformal change cannot strictly decrease a full signed
energy. -/
theorem energy_conformal (g : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯)
    (sign : CollarChirality) : (g.conformal u).energy sign = g.energy sign :=
  g.chiralFrameEnergy_conformal u sign

/-- The ordered eigenvalues of the actual Weyl block in the conformal frame
are the original ordered eigenvalues multiplied by the inverse metric factor. -/
theorem orderedSpectrum_conformal (g : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯)
    (sign : CollarChirality) (x : M) {s : Fin 3 → ℝ}
    (hs : OrderedEndpointSpectrum (signedCollarWeylBlock o g.metric g.frame sign x) s) :
    OrderedEndpointSpectrum
      (signedCollarWeylBlock o (g.conformal u).metric (g.conformal u).frame sign x)
      (Real.exp (-2 * u x) • s) := by
  change OrderedEndpointSpectrum (signedCollarWeylBlock o (conformalMetric g.metric u)
    (fun y => conformalOrientedFrameAt u (g.frame y)) sign x) _
  rw [signedCollarWeylBlock_conformal]
  exact hs.smul _ (Real.exp_pos _).le

end SignedCollarMetric

private theorem endpointTopWeyl_smul_square_cancel (v : ℝ) (plus minus : Fin 3 → ℝ) :
    Real.exp (4 * v) *
      endpointTopWeyl (Real.exp (-2 * v) • plus) (Real.exp (-2 * v) • minus) ^ 2 =
        endpointTopWeyl plus minus ^ 2 := by
  simp only [endpointTopWeyl, Pi.smul_apply, smul_eq_mul,
    ← mul_max_of_nonneg (plus 2) (minus 2) (Real.exp_pos (-2 * v)).le,
    mul_pow, ← mul_assoc]
  have h : Real.exp (4 * v) * Real.exp (-2 * v) ^ 2 = 1 := by
    rw [pow_two, ← Real.exp_add, ← Real.exp_add]
    convert Real.exp_zero using 2
    ring
  rw [h, one_mul]

section BalancedSpectralMeasure

variable {J : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H}
  [J.Boundaryless] [IsManifold J ∞ M] [BoundarylessManifold J M] [CompactSpace M]
  {o : ManifoldOrientation J M 4}

/-- The spectral-square measure used in the marked division is also exactly
preserved, with the rescaled ordered spectra of the two Weyl blocks. -/
theorem balancedPhysicalSpectralMeasure_conformal (g : SignedCollarMetric o)
    (u : C^∞⟮J, M; ℝ⟯) (plus minus : M → Fin 3 → ℝ) :
    balancedPhysicalSpectralMeasure (g.conformal u)
        (fun x => Real.exp (-2 * u x) • plus x) (fun x => Real.exp (-2 * u x) • minus x) =
      balancedPhysicalSpectralMeasure g plus minus := by
  unfold balancedPhysicalSpectralMeasure
  change energyMeasure (riemannianVolumeMeasure J M (conformalMetric g.metric u)) _ = _
  rw [riemannianVolumeMeasure_conformalMetric, o.dimension_eq, Nat.cast_ofNat]
  have hWeight : Measurable (fun x => ENNReal.ofReal (Real.exp (4 * u x))) :=
    (Real.continuous_exp.measurable.comp
      (measurable_const.mul u.contMDiff.continuous.measurable)).ennreal_ofReal
  ext1 A hA
  simp only [energyMeasure, withDensity_apply _ hA]
  rw [setLIntegral_withDensity_eq_setLIntegral_mul_non_measurable₀
    (riemannianVolumeMeasure J M g.metric) hWeight.aemeasurable _ hA
    (ae_of_all _ fun _ => ENNReal.ofReal_lt_top)]
  apply lintegral_congr
  intro x
  rw [Pi.mul_apply, ← ENNReal.ofReal_mul (Real.exp_pos _).le,
    endpointTopWeyl_smul_square_cancel]

end BalancedSpectralMeasure

end

end SmoothPoincare
