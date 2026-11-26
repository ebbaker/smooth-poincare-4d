import SmoothPoincare.Variational.TransportedDiskCaps

open SmoothPoincare FirstOrderTwistor Set
open scoped ContDiff Manifold

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

-- One proper transported pocket in the actual sphere chart.
example :
    transportedCapPocketChart (1 / 3) (by norm_num) '' standardFourSphereCap =
      Metric.closedBall (0 : E₄) (1 / 3) :=
  transportedCapPocketChart_image_cap (1 / 3) (by norm_num)

-- Compare the actual inverse at the chart center and the omitted north pole.
example :
    let C := transportedCapPocketChart (1 / 3) (by norm_num)
    C.symm (0 : E₄) ∈ standardFourSphereCap ∧ C (C.symm (0 : E₄)) = 0 ∧
      transportedCapNorthPole ∉ C.source := by
  intro C
  have hz : (0 : E₄) ∈ C '' standardFourSphereCap := by
    change (0 : E₄) ∈ transportedCapPocketChart (1 / 3) (by norm_num) '' _
    rw [transportedCapPocketChart_image_cap]
    exact Metric.mem_closedBall_self (by norm_num)
  obtain ⟨p, hp, hImg⟩ := hz
  have hps : p ∈ C.source := by
    change p ∈ (transportedCapPocketChart (1 / 3) (by norm_num)).source
    rw [transportedCapPocketChart_source]
    exact transportedCapStereographic_cap_in_source hp
  have hInv : C.symm 0 = p := by
    rw [← hImg, show C.symm (C p) = p from C.left_inv' hps]
  refine ⟨hInv.symm ▸ hp, hInv.symm ▸ hImg, ?_⟩
  change transportedCapNorthPole ∉ (transportedCapPocketChart (1 / 3) (by norm_num)).source
  rw [transportedCapPocketChart_source, transportedCapStereographic_source]
  simp
