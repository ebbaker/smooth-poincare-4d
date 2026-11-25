import FirstOrderTwistor.FrameEnergy
import FirstOrderTwistor.GeometricChiralBlock

/-!
# Compatibility of chiral frame reconstruction and compression

Both maps use the complementary pairs `(01, 02, 03)` and `(23, 31, 12)`
with their displayed order and the normalized self-dual sums.
-/

namespace FirstOrderTwistor

/-- Compressing the reconstructed tensor returns the positive block with the
same row and column order. This identity holds for arbitrary real blocks. -/
theorem selfDualCurvatureBlock_chiralFrameTensor
    (WPlus WMinus : Matrix (Fin 3) (Fin 3) ℝ) :
    selfDualCurvatureBlock (chiralFrameTensor WPlus WMinus) = WPlus := by
  ext i j
  calc
    _ = ((WPlus i j + WMinus i j) / 2 + (WPlus i j - WMinus i j) / 2 +
        (WPlus i j - WMinus i j) / 2 + (WPlus i j + WMinus i j) / 2) / 2 := by
      fin_cases i <;> fin_cases j <;> rfl
    _ = _ := by ring

/-- Trace removal preserves the recovered positive block when it is trace free. -/
theorem traceFreeChiralBlock_chiralFrameTensor
    (WPlus WMinus : Matrix (Fin 3) (Fin 3) ℝ) (hTrace : WPlus.trace = 0) :
    traceFreeChiralBlock (selfDualCurvatureBlock (chiralFrameTensor WPlus WMinus)) = WPlus := by
  rw [selfDualCurvatureBlock_chiralFrameTensor]
  simp [traceFreeChiralBlock, hTrace]

end FirstOrderTwistor
