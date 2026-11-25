import FirstOrderTwistor.BufferedInterpolation

open scoped BigOperators

namespace FirstOrderTwistor

/-- Euclidean norm in a finite orthonormal coordinate system. For a product
index this is the Hilbert–Schmidt norm of the coordinate array. -/
noncomputable def coordinateNorm {ι : Type*} [Fintype ι] (f : ι → ℝ) : ℝ :=
  Real.sqrt (∑ i, (f i) ^ 2)

private theorem coordinateNorm_nonneg {ι : Type*} [Fintype ι] (f : ι → ℝ) :
    0 ≤ coordinateNorm f := Real.sqrt_nonneg _

private theorem coordinateNorm_sq {ι : Type*} [Fintype ι] (f : ι → ℝ) :
    (coordinateNorm f) ^ 2 = ∑ i, (f i) ^ 2 :=
  Real.sq_sqrt (Finset.sum_nonneg fun i _ => sq_nonneg (f i))

private theorem abs_dot_le_coordinateNorm {ι : Type*} [Fintype ι] (f g : ι → ℝ) :
    |∑ i, f i * g i| ≤ coordinateNorm f * coordinateNorm g := by
  apply (sq_le_sq₀ (abs_nonneg _)
    (mul_nonneg (coordinateNorm_nonneg f) (coordinateNorm_nonneg g))).mp
  rw [sq_abs, mul_pow, coordinateNorm_sq, coordinateNorm_sq]
  exact Finset.sum_mul_sq_le_sq_mul_sq _ _ _

/-- The dimension-four coordinate trace contracts a Hessian array by at most
`√4 = 2` in the Euclidean norms. -/
theorem hessianTraceNorm_le {ι : Type*} [Fintype ι]
    (H : (ι × Fin 4) × Fin 4 → ℝ) :
    coordinateNorm (fun j => ∑ a : Fin 4, H ((j, a), a)) ≤ 2 * coordinateNorm H := by
  apply (sq_le_sq₀ (coordinateNorm_nonneg _)
    (mul_nonneg (by norm_num) (coordinateNorm_nonneg H))).mp
  rw [coordinateNorm_sq, mul_pow, coordinateNorm_sq]
  norm_num
  calc
    ∑ j, (∑ a : Fin 4, H ((j, a), a)) ^ 2 ≤ ∑ j, 4 * ∑ a : Fin 4, H ((j, a), a) ^ 2 := by
      apply Finset.sum_le_sum
      intro j _
      simpa using Finset.sum_mul_sq_le_sq_mul_sq Finset.univ (fun _ : Fin 4 => (1 : ℝ))
        (fun a => H ((j, a), a))
    _ = 4 * ∑ p : ι × Fin 4, H (p, p.2) ^ 2 := by
      rw [Fintype.sum_prod_type]
      simp_rw [Finset.mul_sum]
    _ ≤ 4 * ∑ q, H q ^ 2 := by
      rw [Fintype.sum_prod_type (f := fun q => H q ^ 2)]
      apply mul_le_mul_of_nonneg_left _ (by norm_num)
      exact Finset.sum_le_sum fun p _ =>
        Finset.single_le_sum (fun a _ => sq_nonneg (H (p, a))) (Finset.mem_univ p.2)

private theorem euclideanPartial_mul {f g : EuclideanFour → ℝ} {x : EuclideanFour}
    (hf : DifferentiableAt ℝ f x) (hg : DifferentiableAt ℝ g x) (a : Fin 4) :
    euclideanPartial (fun y => f y * g y) a x =
      f x * euclideanPartial g a x + g x * euclideanPartial f a x := by
  simp only [euclideanPartial, fderiv_fun_mul hf hg, add_apply, smul_apply, smul_eq_mul]

private theorem euclideanPartial_pow {f : EuclideanFour → ℝ} {x : EuclideanFour}
    (hf : DifferentiableAt ℝ f x) (a : Fin 4) (n : ℕ) :
    euclideanPartial (fun y => f y ^ n) a x = (n * f x ^ (n - 1)) * euclideanPartial f a x := by
  simp only [euclideanPartial, fderiv_fun_pow n hf, smul_apply, nsmul_eq_mul,
    smul_eq_mul]

/-- The coordinate Hessian, with `q.2` the outer derivative direction. -/
noncomputable def euclideanHessian {ι : Type*} (u : ι → EuclideanFour → ℝ)
    (x : EuclideanFour) (q : (ι × Fin 4) × Fin 4) : ℝ :=
  euclideanPartial (euclideanPartial (u q.1.1) q.1.2) q.2 x

/-- Product rule for the actual E14a flux, with the same outer partial for
every term. -/
theorem bufferedFlux_partial {ι : Type*} [Fintype ι]
    {η : EuclideanFour → ℝ} {u : ι → EuclideanFour → ℝ} {x : EuclideanFour}
    (hη : DifferentiableAt ℝ η x) (hu : ∀ j, ContDiffAt ℝ 2 (u j) x)
    (p : ι × Fin 4) :
    euclideanPartial (bufferedFlux η u p) p.2 x =
      4 * η x ^ 3 * euclideanPartial η p.2 x * euclideanGradientSq u x *
        euclideanPartial (u p.1) p.2 x +
      η x ^ 4 * (2 * (∑ q : ι × Fin 4,
        euclideanPartial (u q.1) q.2 x * euclideanHessian u x (q, p.2)) *
        euclideanPartial (u p.1) p.2 x + euclideanGradientSq u x * euclideanHessian u x (p, p.2)) := by
  have hpartial (q : ι × Fin 4) : DifferentiableAt ℝ (euclideanPartial (u q.1) q.2) x :=
    (((hu q.1).fderiv_right (m := 1) (by norm_num)).clm_apply contDiffAt_const).differentiableAt
      one_ne_zero
  have hgrad : DifferentiableAt ℝ (euclideanGradientSq u) x :=
    DifferentiableAt.fun_sum fun q _ => (hpartial q).pow 2
  have hgradPartial : euclideanPartial (euclideanGradientSq u) p.2 x =
      2 * ∑ q : ι × Fin 4, euclideanPartial (u q.1) q.2 x * euclideanHessian u x (q, p.2) := by
    calc
      _ = ∑ q : ι × Fin 4,
          euclideanPartial (fun y => euclideanPartial (u q.1) q.2 y ^ 2) p.2 x := by
        change (fderiv ℝ (fun y => ∑ q : ι × Fin 4, (euclideanPartial (u q.1) q.2 y) ^ 2) x)
          (EuclideanSpace.single p.2 1) = _
        rw [fderiv_fun_sum (A := fun q : ι × Fin 4 => fun y => (euclideanPartial (u q.1) q.2 y) ^ 2)
          fun q _ => (hpartial q).pow 2]
        simp only [sum_apply, euclideanPartial]
      _ = _ := by
        rw [Finset.mul_sum]
        refine Finset.sum_congr rfl fun q _ => ?_
        rw [euclideanPartial_pow (hpartial q), euclideanHessian]
        norm_num
        ring
  have hηpow : DifferentiableAt ℝ (fun y => η y ^ 4) x := hη.pow 4
  have hgradProd : DifferentiableAt ℝ
      (fun y => euclideanGradientSq u y * euclideanPartial (u p.1) p.2 y) x :=
    hgrad.mul (hpartial p)
  unfold bufferedFlux
  rw [euclideanPartial_mul hηpow hgradProd, euclideanPartial_mul hgrad (hpartial p),
    euclideanPartial_pow hη, hgradPartial]
  simp only [euclideanHessian]
  norm_num
  ring

private theorem coordinateContraction_le {ι κ : Type*} [Fintype ι] [Fintype κ]
    (v : ι → ℝ) (D : ι × κ → ℝ) :
    coordinateNorm (fun a => ∑ j, v j * D (j, a)) ≤ coordinateNorm v * coordinateNorm D := by
  apply (sq_le_sq₀ (coordinateNorm_nonneg _)
    (mul_nonneg (coordinateNorm_nonneg v) (coordinateNorm_nonneg D))).mp
  rw [coordinateNorm_sq, mul_pow, coordinateNorm_sq, coordinateNorm_sq]
  calc
    ∑ a, (∑ j, v j * D (j, a)) ^ 2 ≤ ∑ a, (∑ j, v j ^ 2) * (∑ j, D (j, a) ^ 2) :=
      Finset.sum_le_sum fun a _ => Finset.sum_mul_sq_le_sq_mul_sq _ v (fun j => D (j, a))
    _ = _ := by rw [← Finset.mul_sum, Fintype.sum_prod_type_right (f := fun p => D p ^ 2)]

private theorem sum_mul_by_direction {ι κ : Type*} [Fintype ι] [Fintype κ]
    (v : κ → ℝ) (D : ι × κ → ℝ) :
    (∑ p : ι × κ, v p.2 * D p) = ∑ a, v a * ∑ j, D (j, a) := by
  rw [Fintype.sum_prod_type_right]
  simp only [Finset.mul_sum]

/-- The differentiated flux contribution after contraction with the coordinate
field. All norms are Euclidean, and the estimate allows `Du = 0`. -/
theorem abs_bufferedFlux_contraction_le {ι : Type*} [Fintype ι]
    {η : EuclideanFour → ℝ} {u : ι → EuclideanFour → ℝ} {x : EuclideanFour}
    (hη : DifferentiableAt ℝ η x) (hcutoff : 0 ≤ η x) (hu : ∀ j, ContDiffAt ℝ 2 (u j) x) :
    let d := fun p : ι × Fin 4 => euclideanPartial (u p.1) p.2 x
    |∑ p : ι × Fin 4, u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x| ≤
      coordinateNorm (fun j => u j x) *
        (4 * η x ^ 3 * coordinateNorm (fun a => euclideanPartial η a x) * coordinateNorm d ^ 3 +
         4 * η x ^ 4 * coordinateNorm d ^ 2 * coordinateNorm (euclideanHessian u x)) := by
  let d := fun p : ι × Fin 4 => euclideanPartial (u p.1) p.2 x
  let v := fun j => u j x
  let dη := fun a => euclideanPartial η a x
  let H := euclideanHessian u x
  let A : Fin 4 → ℝ := fun a => ∑ j, v j * d (j, a)
  let B : Fin 4 → ℝ := fun a => ∑ q, d q * H (q, a)
  let T : ι → ℝ := fun j => ∑ a : Fin 4, H ((j, a), a)
  let c₁ := 4 * η x ^ 3 * coordinateNorm d ^ 2
  let c₂ := 2 * η x ^ 4
  let c₃ := η x ^ 4 * coordinateNorm d ^ 2
  have hG : euclideanGradientSq u x = (coordinateNorm d) ^ 2 := (coordinateNorm_sq d).symm
  have hexpansion (p : ι × Fin 4) :
      u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x =
        c₁ * (dη p.2 * (v p.1 * d p)) + c₂ * (B p.2 * (v p.1 * d p)) +
          c₃ * (v p.1 * H (p, p.2)) := by
    rw [bufferedFlux_partial hη hu p, hG]
    dsimp only [c₁, c₂, c₃, dη, v, d, B, H]
    ring
  have htraceSum : (∑ p : ι × Fin 4, v p.1 * H (p, p.2)) = ∑ j, v j * T j := by
    rw [Fintype.sum_prod_type]
    simp only [T, Finset.mul_sum]
  have hsum : (∑ p : ι × Fin 4, u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x) =
      c₁ * (∑ a, dη a * A a) + c₂ * (∑ a, B a * A a) + c₃ * (∑ j, v j * T j) := by
    simp_rw [hexpansion, Finset.sum_add_distrib, ← Finset.mul_sum]
    rw [sum_mul_by_direction dη (fun p => v p.1 * d p),
      sum_mul_by_direction B (fun p => v p.1 * d p), htraceSum]
  have hA : coordinateNorm A ≤ coordinateNorm v * coordinateNorm d :=
    coordinateContraction_le v d
  have hB : coordinateNorm B ≤ coordinateNorm d * coordinateNorm H :=
    coordinateContraction_le d H
  have hT : coordinateNorm T ≤ 2 * coordinateNorm H := hessianTraceNorm_le H
  have hU := coordinateNorm_nonneg v
  have hD := coordinateNorm_nonneg d
  have hH := coordinateNorm_nonneg H
  have hDcut := coordinateNorm_nonneg dη
  have hfirst : |∑ a, dη a * A a| ≤ coordinateNorm dη * (coordinateNorm v * coordinateNorm d) :=
    (abs_dot_le_coordinateNorm dη A).trans (mul_le_mul_of_nonneg_left hA hDcut)
  have hsecond : |∑ a, B a * A a| ≤
      (coordinateNorm d * coordinateNorm H) * (coordinateNorm v * coordinateNorm d) :=
    (abs_dot_le_coordinateNorm B A).trans (mul_le_mul hB hA (coordinateNorm_nonneg A) (by positivity))
  have hthird : |∑ j, v j * T j| ≤ coordinateNorm v * (2 * coordinateNorm H) :=
    (abs_dot_le_coordinateNorm v T).trans (mul_le_mul_of_nonneg_left hT hU)
  have hc₁ : 0 ≤ c₁ := by dsimp [c₁]; positivity
  have hc₂ : 0 ≤ c₂ := by dsimp [c₂]; positivity
  have hc₃ : 0 ≤ c₃ := by dsimp [c₃]; positivity
  rw [hsum]
  refine (abs_add_le _ _).trans ?_
  calc
    |c₁ * (∑ a, dη a * A a) + c₂ * (∑ a, B a * A a)| + |c₃ * (∑ j, v j * T j)| ≤
        |c₁ * (∑ a, dη a * A a)| + |c₂ * (∑ a, B a * A a)| + |c₃ * (∑ j, v j * T j)| :=
      add_le_add_right (abs_add_le _ _) _
    _ = c₁ * |∑ a, dη a * A a| + c₂ * |∑ a, B a * A a| + c₃ * |∑ j, v j * T j| := by
      simp only [abs_mul, abs_of_nonneg hc₁, abs_of_nonneg hc₂, abs_of_nonneg hc₃]
    _ ≤ c₁ * (coordinateNorm dη * (coordinateNorm v * coordinateNorm d)) +
        c₂ * ((coordinateNorm d * coordinateNorm H) * (coordinateNorm v * coordinateNorm d)) +
        c₃ * (coordinateNorm v * (2 * coordinateNorm H)) :=
      add_le_add (add_le_add (mul_le_mul_of_nonneg_left hfirst hc₁)
        (mul_le_mul_of_nonneg_left hsecond hc₂)) (mul_le_mul_of_nonneg_left hthird hc₃)
    _ = _ := by
      change _ = coordinateNorm v *
        (4 * η x ^ 3 * coordinateNorm dη * coordinateNorm d ^ 3 +
         4 * η x ^ 4 * coordinateNorm d ^ 2 * coordinateNorm H)
      dsimp only [c₁, c₂, c₃]
      ring

end FirstOrderTwistor
