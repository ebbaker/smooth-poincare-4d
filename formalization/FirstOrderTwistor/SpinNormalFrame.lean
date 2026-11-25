import FirstOrderTwistor.SpinMetricBlock
import FirstOrderTwistor.SpinCurvature

/-!
# The self-dual curl of the twistor operator in a positive spin frame

The second jet consists of ordered covariant second derivatives at one point.
Its antisymmetric part is constrained by the spin curvature commutator. No
field equation constrains its symmetric part.
-/

namespace FirstOrderTwistor

open scoped Quaternion
noncomputable section

/-- Clifford multiplication by a frame vector from the negative to the positive half. -/
def negativeCliffordVector : Fin 4 → ℍ[ℝ] := ![1, spinUnit 0, spinUnit 1, spinUnit 2]

/-- Clifford multiplication in the opposite direction is the negative adjoint. -/
def positiveCliffordVector : Fin 4 → ℍ[ℝ] := ![-1, spinUnit 0, spinUnit 1, spinUnit 2]

/-- Components of the self-dual alternating part in the normalized basis. -/
def selfDualAlternation (B : Fin 4 → Fin 4 → ℍ[ℝ]) (a : Fin 3) : ℍ[ℝ] :=
  let p := selfDualFirstWedge a
  let q := selfDualSecondWedge a
  (Real.sqrt 2 / 2) • ((B p.1 p.2 - B p.2 p.1) + (B q.1 q.2 - B q.2 q.1))

private theorem selfDualAlternation_add (B G : Fin 4 → Fin 4 → ℍ[ℝ]) (a : Fin 3) :
    selfDualAlternation (B + G) a = selfDualAlternation B a + selfDualAlternation G a := by
  unfold selfDualAlternation
  simp only [Pi.add_apply, smul_add, smul_sub]
  abel

/-- The Clifford correction in the alternating twistor derivative is purely in the
trace direction. Here ηᵢ represents ∇ᵢDψ and the last sum represents D²ψ. -/
theorem selfDualAlternation_cliffordCorrection (η : Fin 4 → ℍ[ℝ]) (a : Fin 3) :
    selfDualAlternation (fun i j => (1 / 4 : ℝ) • (negativeCliffordVector j * η i)) a =
      selfDualCliffordGenerator a ((1 / 8 : ℝ) • (∑ i, negativeCliffordVector i * η i)) := by
  fin_cases a <;> ext <;>
    norm_num [selfDualAlternation, selfDualFirstWedge, selfDualSecondWedge,
      selfDualCliffordGenerator, negativeCliffordVector, spinUnit, Fin.sum_univ_four,
      Quaternion.re_mul, Quaternion.imI_mul, Quaternion.imJ_mul, Quaternion.imK_mul] <;> ring

/-- Imaginary quaternion acting in the spin curvature of a single unnormalized
coordinate wedge, before multiplication by −1/2. -/
def frameCurvatureQuaternion (R : CurvatureFrameTensor) (i j : Fin 4) : ℍ[ℝ] :=
  ⟨0, R i j 0 1 + R i j 2 3, R i j 0 2 + R i j 3 1, R i j 0 3 + R i j 1 2⟩

/-- The six two-form slots of the spin curvature commutator in a normal frame. -/
def SpinFrameCommutator (R : CurvatureFrameTensor) (ψ : ℍ[ℝ])
    (B : Fin 4 → Fin 4 → ℍ[ℝ]) : Prop :=
  ∀ i j, B i j - B j i = (-1 / 2 : ℝ) • (frameCurvatureQuaternion R i j * ψ)

/-- Self-dual compression of the commutator removes the mixed curvature block. -/
theorem selfDualAlternation_of_spinCommutator {R : CurvatureFrameTensor} {ψ : ℍ[ℝ]}
    {B : Fin 4 → Fin 4 → ℍ[ℝ]} (h : SpinFrameCommutator R ψ B) (a : Fin 3) :
    selfDualAlternation B a = weylSpinDefect (selfDualCurvatureBlock R).transpose ψ a := by
  unfold SpinFrameCommutator at h
  simp only [selfDualAlternation, h, ← smul_add, ← add_mul, smul_smul, weylSpinDefect,
    weylSpinRows, selfDualClifford, ← smul_mul_assoc]
  congr 1
  apply Quaternion.ext <;>
    norm_num [frameCurvatureQuaternion, selfDualCliffordQuaternion, Matrix.transpose,
      selfDualCurvatureBlock, selfDualFirstWedge, selfDualSecondWedge] <;> ring

/-- At a point in a parallel orthonormal spin frame this is the self-dual part of
d⁽∇⁾Pψ, computed from the ordered second derivatives of ψ. -/
def frameTwistorCurl (B : Fin 4 → Fin 4 → ℍ[ℝ]) : Fin 3 → ℍ[ℝ] :=
  let η i := ∑ j, positiveCliffordVector j * B i j
  selfDualAlternation (B + fun i j => (1 / 4 : ℝ) • (negativeCliffordVector j * η i))

/-- Splitting off the scalar part of a curvature block adds a Clifford trace. -/
theorem weylSpinDefect_split_trace (A : Matrix (Fin 3) (Fin 3) ℝ) (ψ : ℍ[ℝ]) :
    weylSpinDefect A ψ = weylSpinDefect (traceFreeChiralBlock A) ψ +
      selfDualCliffordTraceAdjoint ((A.trace / 6) • ψ) := by
  funext a
  fin_cases a <;> apply Quaternion.ext <;>
    norm_num [weylSpinDefect, weylSpinRows, traceFreeChiralBlock, selfDualClifford,
      selfDualCliffordQuaternion, selfDualCliffordGenerator, selfDualCliffordTraceAdjoint,
      spinUnit, Matrix.sub_apply, Matrix.smul_apply, Matrix.one_apply, smul_eq_mul,
      Quaternion.re_mul, Quaternion.imI_mul, Quaternion.imJ_mul, Quaternion.imK_mul] <;> ring

/-- The projected self-dual twistor curl of every compatible two-jet is the
signed trace-free curvature action. The Dirac second derivative cancels. -/
theorem projectedFrameTwistorCurl {R : CurvatureFrameTensor} {ψ : ℍ[ℝ]}
    {B : Fin 4 → Fin 4 → ℍ[ℝ]} (h : SpinFrameCommutator R ψ B)
    (hsym : (selfDualCurvatureBlock R).IsSymm) :
    selfDualCliffordProjection (frameTwistorCurl B) =
      weylSpinDefect (traceFreeChiralBlock (selfDualCurvatureBlock R)) ψ := by
  let A := selfDualCurvatureBlock R
  let η i := ∑ j, positiveCliffordVector j * B i j
  let v := (1 / 8 : ℝ) • (∑ i, negativeCliffordVector i * η i)
  have hcurl : frameTwistorCurl B = weylSpinDefect A ψ + selfDualCliffordTraceAdjoint (-v) := by
    funext a
    rw [frameTwistorCurl, selfDualAlternation_add, selfDualAlternation_of_spinCommutator h,
      hsym.eq, selfDualAlternation_cliffordCorrection]
    simp [A, v, η, selfDualCliffordTraceAdjoint, selfDualCliffordGenerator]
  have hW : (traceFreeChiralBlock A).IsSymm :=
    hsym.sub (Matrix.isSymm_one.smul _)
  rw [hcurl, selfDualCliffordProjection_add, selfDualCliffordProjection_traceAdjoint, add_zero,
    weylSpinDefect_split_trace A ψ, selfDualCliffordProjection_weylSpinDefect_add_adjoint
      _ _ _ hW (trace_traceFreeChiralBlock A)]

/-- DIR's exact squared coefficient in terms of the full ordered two-jet. -/
theorem projectedFrameTwistorCurl_normSq {R : CurvatureFrameTensor} {ψ : ℍ[ℝ]}
    {B : Fin 4 → Fin 4 → ℍ[ℝ]} (h : SpinFrameCommutator R ψ B)
    (hsym : (selfDualCurvatureBlock R).IsSymm) :
    (∑ a, Quaternion.normSq (selfDualCliffordProjection (frameTwistorCurl B) a)) =
      (1 / 2 : ℝ) * SectionsAndConnections.hilbertSchmidtSq
        (traceFreeChiralBlock (selfDualCurvatureBlock R)) * Quaternion.normSq ψ := by
  rw [projectedFrameTwistorCurl h hsym, weylSpinDefect_normSq]

open DifferentialGeometry
open scoped Manifold ContDiff

/-- Specialization to the actual Levi–Civita curvature in an oriented tangent
frame. The spin jet must realize its spin curvature commutator in a lift of this frame. -/
theorem metricProjectedFrameTwistorCurl_normSq
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
    [BoundarylessManifold I M] (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) (frame : OrientedOrthonormalFrameAt g o x)
    {ψ : ℍ[ℝ]} {B : Fin 4 → Fin 4 → ℍ[ℝ]}
    (h : SpinFrameCommutator (metricCurvatureFrameTensor g o x frame) ψ B) :
    (∑ a, Quaternion.normSq (selfDualCliffordProjection (frameTwistorCurl B) a)) =
      (1 / 2 : ℝ) * SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o x frame) *
        Quaternion.normSq ψ :=
  projectedFrameTwistorCurl_normSq h (selfDualCurvatureBlock_metric_isSymm g o x frame)

end
end FirstOrderTwistor
