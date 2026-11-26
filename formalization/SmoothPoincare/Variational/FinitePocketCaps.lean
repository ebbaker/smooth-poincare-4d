import SmoothPoincare.Variational.NativePocketGeometry
import SmoothPoincare.Variational.NativePocketCylinder
import SmoothPoincare.Variational.NativePocketSignedSlices
import SmoothPoincare.Variational.NativePocketCenter

/-! # A positive flattening and two matched caps at the same finite index -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Geometry.Curvature FirstOrderTwistor
open SectionsAndConnections Manifold Set Metric Filter MeasureTheory DifferentialGeometry.Integral.Measure
open scoped Manifold ContDiff Topology InnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
local notation "S₄" => StandardFourSphere
local notation "J" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty S₄ := ⟨transportedCapNorthPole⟩

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [Nonempty M] [PathConnectedSpace M] {o : ManifoldOrientation I M 4}

/-- Choose one radius within any requested tolerance on a finite
positive-scalar source. Every supplied signed realization of its native
affine slices, matched to the source frames on the exterior, has the
strict joined ceiling. The endpoint at that same radius supplies both
cap metrics, complete signed costs, and the exact central cylinder. -/
theorem exists_finite_positivePocket_matchedCaps (g : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere)
    {R B ℓ ρ η δ T : ℝ} (hR : 1 < R) (hRB : R < B) (hBuffer : closedBall (0:E₄) B ⊆ F.source)
    (hZero : ∀ v w, nativePocketMetricCoefficient F g.metric v w 0 = inner ℝ v w)
    (hℓ : 0 < ℓ) (hρ : 0 < ρ) (hFloor : ∀ y, ρ ≤ metricScalarAt g.metric y)
    (hη : 0 < η) (hδ : 0 < δ) (hGap : g.energy .plus + η < 2*T)
    (oS : ManifoldOrientation I₄ S₄ 4) :
    let hF := (closedBall_subset_closedBall (hR.trans hRB).le).trans hBuffer
    ∃ (Rflat : SmoothRiemannianMetric I M) (r : ℝ) (hr : 0 < r) (hr1 : r < 1)
      (hS : closedBall (0:E₄) (3*r) ⊆ F.source), r < δ ∧
      ∀ (slice : Icc (0:ℝ) 1 → SignedCollarMetric o),
      (∀ t, (slice t).metric = nativePocketPath F g.metric Rflat hr hS t) →
      (∀ t x, x ∉ F '' closedBall (0:E₄) (3*r) → (g.frame x).basis = ((slice t).frame x).basis) →
      let flat := slice ⟨1, zero_le_one, le_rfl⟩
      (∀ t, 0 < classYamabeFour o.dimension_eq (slice t).metric ∧
        ∀ sg, (slice t).energy sg < g.energy sg + η ∧ (slice t).energy sg < 2*T) ∧
      ∃ (u : C^∞⟮I, M; ℝ⟯) (φ : M ≃ₘ⟮I,I⟯ M) (hφ : φ.preservesOrientation o o)
        (hImage : φ '' selectedChartDisk F = F '' closedBall (0 : E₄) r)
        (uDisk : C^∞⟮I₄, S₄; ℝ⟯) (ε d : ℝ),
        let A := nativePocketMarking F p
        let disk := transportedDiskCore F hF φ hr hr1.le hImage
        let exterior := transportedExteriorCore F hF φ hr hr1.le hImage
        let capD := (RoundEquatorialCaps.signedRound oS).conformal uDisk
        let capV := flat.conformal u
        let q := capV.pullback φ hφ
        0 < d ∧ d < ε ∧ exactFaceSlab d d ⊆ A.source ∧
        (∀ x ∈ exactFaceSlab d d, ∀ v w : TangentSpace J x,
          q.metric.inner (A x) (mfderiv J I A x v) (mfderiv J I A x w) =
            (nativePocketCylinderMetric hℓ).inner x v w) ∧
        (∀ t, |t| < ε → ∀ y ∈ sphere (0 : E₄) 1,
          φ (F ((1+t) • y)) = F ((r * Real.exp (t/ℓ)) • y) ∧
          φ.symm (F ((r * Real.exp (t/ℓ)) • y)) = F ((1+t) • y)) ∧
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
  intro hF
  obtain ⟨Rflat, U, r₀, V, K, hr₀, hr₀1, hsmall, _, _, hBU, _, hRef, hbound⟩ :=
    exists_nativePocket_positive_geometry_bounds F g (zero_lt_one.trans (hR.trans hRB))
      hBuffer hZero hρ hFloor hη hGap
  obtain ⟨r, hr, hmin⟩ := exists_between (lt_min hr₀ hδ)
  have hr1 := (hmin.trans_le (min_le_left _ _)).trans_le hr₀1
  have hrr := (hmin.trans_le (min_le_left _ _)).le
  have h3r : 3*r ≤ B := by linarith
  let hS := (closedBall_subset_closedBall h3r).trans hBuffer
  refine ⟨Rflat,r,hr,hr1,hS,hmin.trans_le (min_le_right _ _),?_⟩
  intro slice hSlice hFrames flat
  have ht (t : Icc (0:ℝ) 1) := hbound hr hrr hS t (slice t) (hSlice t) (hFrames t)
  refine ⟨fun t => ⟨(ht t).1, (ht t).2.2⟩, ?_⟩
  have hRef' (x : E₄) (hx : x ∈ ball 0 (2*r)) (v w : E₄) :
      (Geometry.euclideanMetric E₄).inner x v w =
        Rflat.inner (F x) (mfderiv I₄ I F x v) (mfderiv I₄ I F x w) := by
    have hu := hBU ((ball_subset_closedBall.trans (closedBall_subset_closedBall
      (show 2*r ≤ B/2 by linarith))) hx)
    exact (hRef x hu v w).symm
  exact nativePocket_matchedCylinderCaps_of_reference g F p hR hRB hBuffer hr h3r
    hr hr1 (by linarith) hℓ oS Rflat hRef' flat (hSlice _) (ht _).1

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- On the supplied disk, first normalize the chart at its center by an
interior diffeomorphism. The radius, reference and cutoff remain common
to every subsequent computation. Local chiral measurability and the
Pontryagin balance on the changed ball give the signed slices. The two
complete cap costs and the product then hold in the original disk and
exterior, with the original angular marking near their common face. -/
theorem originalDisk_finite_positive_caps (g : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere)
    {R B ℓ ρ η δ : ℝ} (hR : 1 < R) (hRB : R < B) (hBuffer : closedBall (0:E₄) B ⊆ F.source)
    (hℓ : 0 < ℓ) (hρ : 0 < ρ) (hFloor : ∀ y, ρ ≤ metricScalarAt g.metric y)
    (hη : 0 < η) (hδ : 0 < δ) (hGap : g.energy .plus + η < 2*(4*Real.pi^2))
    (oS : ManifoldOrientation I₄ S₄ 4) :
    ∃ (F' : PartialDiffeomorph I₄ I E₄ M ∞) (Rflat : SmoothRiemannianMetric I M)
      (r : ℝ) (hr : 0 < r) (hS : closedBall (0:E₄) (3*r) ⊆ F'.source),
      selectedChartDisk F' = selectedChartDisk F ∧
      (∀ x ∉ ball (0:E₄) (1/2), F' x = F x) ∧ r < δ ∧
      (∀ s : Icc (0:ℝ) 1,
        let h := nativePocketPath F' g.metric Rflat hr hS s
        let f := nativePocketPath_frame F' g Rflat hr hS s
        let W := fun sg x => hilbertSchmidtSq (signedCollarWeylBlock o h f sg x)
        let μ := riemannianVolumeMeasure I M h
        let A := F' '' closedBall (0:E₄) (3*r)
        (∀ sg, AEStronglyMeasurable (W sg) (μ.restrict A)) ∧
        (∫ x in A, W .plus x ∂μ) - (∫ x in A, W .minus x ∂μ) =
          g.charge .plus A - g.charge .minus A) →
      ∃ (slice : Icc (0:ℝ) 1 → SignedCollarMetric o)
        (u : C^∞⟮I, M; ℝ⟯) (φ : M ≃ₘ⟮I,I⟯ M) (hφ : φ.preservesOrientation o o)
        (uDisk : C^∞⟮I₄, S₄; ℝ⟯) (d : ℝ),
        let flat := slice ⟨1,zero_le_one,le_rfl⟩
        let capV := flat.conformal u
        let capD := (RoundEquatorialCaps.signedRound oS).conformal uDisk
        let q := capV.pullback φ hφ
        let D := selectedChartDisk F
        let V := (interior D)ᶜ
        let A := nativePocketMarking F p
        (∀ s, (slice s).metric = nativePocketPath F' g.metric Rflat hr hS s ∧
          0 < classYamabeFour o.dimension_eq (slice s).metric ∧
          ∀ sg, (slice s).energy sg < g.energy sg + η ∧ (slice s).energy sg < 2*(4*Real.pi^2)) ∧
        0 < d ∧ exactFaceSlab d d ⊆ A.source ∧
        (∀ x ∈ exactFaceSlab d d, ∀ v w : TangentSpace J x,
          q.metric.inner (A x) (mfderiv J I A x v) (mfderiv J I A x w) =
            (nativePocketCylinderMetric hℓ).inner x v w) ∧
        0 < classYamabeFour o.dimension_eq capV.metric ∧
        0 < classYamabeFour oS.dimension_eq capD.metric ∧
        (∀ sg, capD.energy sg = 0 ∧ q.charge sg D = 0 ∧
          capV.energy sg = q.charge sg V ∧
          capV.energy sg - g.charge sg V = g.charge sg D + (flat.energy .plus - g.energy .plus)) := by
  have hF := (closedBall_subset_closedBall (hR.trans hRB).le).trans hBuffer
  obtain ⟨J₀,F',hF',hsrc,hdisk,_,hfix,_,hzero⟩ :=
    exists_nativePocketCenter_normalizedChart g.metric F hF (by norm_num : (0:ℝ) < 1/2)
      (by norm_num)
  have hBuf : closedBall (0:E₄) B ⊆ F'.source := hsrc.symm ▸ hBuffer
  obtain ⟨Rflat,r,hr,hr1,hS,hδr,hCap⟩ := exists_finite_positivePocket_matchedCaps g F' p
    hR hRB hBuf hzero hℓ hρ hFloor hη hδ hGap oS
  have heq : selectedChartDisk F' = selectedChartDisk F := hdisk
  refine ⟨F',Rflat,r,hr,hS,heq,fun x hx => ?_,hδr,?_⟩
  · rw [hF']
    change F (J₀ x) = F x
    rw [(hfix x hx).1]
  intro hLocal
  obtain ⟨slice,hs⟩ := exists_nativePocketSignedSlices_of_localData F' g Rflat hr hS hLocal
  obtain ⟨hp,u,φ,hφ,hIm,ud,ε,d,hd,_,hA,hProd,_,hyD,hyV,_,_,hc⟩ :=
    hCap slice (fun t => (hs t).1) (fun t => (hs t).2.2.1)
  let w := min d (1/4 : ℝ)
  have hw : 0 < w := lt_min hd (by norm_num)
  have hwsub := exactFaceSlab_mono (min_le_left d (1/4 : ℝ)) (min_le_left d (1/4 : ℝ))
  have hsame (x : ExactFaceTube) (hx : -(1/2 : ℝ) < x.2) :
      nativePocketMarking F' p x = nativePocketMarking F p x := by
    simp only [nativePocketMarking_apply, hF']
    change F (J₀ ((1+x.2) • (x.1 : E₄))) = F ((1+x.2) • (x.1 : E₄))
    apply congrArg F
    apply (hfix _ ?_).1
    rw [mem_ball_zero_iff, norm_smul, Real.norm_of_nonneg (by linarith)]
    rw [mem_sphere_zero_iff_norm.mp x.1.property, mul_one]
    linarith
  have hxHalf (x : ExactFaceTube) (hx : x ∈ exactFaceSlab w w) : -(1/2 : ℝ) < x.2 := by
    have hmin : w ≤ 1/4 := min_le_right _ _
    linarith [hx.2.1]
  refine ⟨slice,u,φ,hφ,ud,w,fun t => ⟨(hs t).1,hp t⟩,hw,?_,?_,hyV,hyD,?_⟩
  · intro x hx
    have h := hA (hwsub hx)
    exact nativePocketMarking_mem_source F p (by linarith [hxHalf x hx]) (hsrc ▸ h.2)
  · intro x hx v z
    have hg : (nativePocketMarking F' p : ExactFaceTube → M) =ᶠ[𝓝 x] (nativePocketMarking F p) :=
      (isOpen_lt continuous_const continuous_snd |>.mem_nhds (hxHalf x hx)).mono hsame
    have hm := hProd x (hwsub hx) v z
    rw [hg.self_of_nhds, hg.mfderiv_eq] at hm
    exact hm
  intro sg
  obtain ⟨hz,hdc,hvc,hdr⟩ := hc sg
  rw [← heq]
  exact ⟨hz,hdc.symm.trans hz,hvc,hdr⟩

end SmoothPoincare
