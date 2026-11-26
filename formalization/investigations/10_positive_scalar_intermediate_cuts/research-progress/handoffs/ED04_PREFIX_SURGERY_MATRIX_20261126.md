# Integral block reduction for the normalized prefix matrix

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. This is the bounded execution return for `SP4-FORM-PSC-E01`. Actual serving model and reasoning effort were unavailable to this worker. [Proof plan](../../research-plan/PLAN.md) · [Progress register](../REGISTER.md)

The input revision was `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. The marked handle-cuts manuscript had SHA-256 `e53bc30bb034b6db9d2576cc370d1d6f032cfca8a815c284956deaba15869b7d`, and the parent collar manuscript had SHA-256 `6be3df9bdd0205d1909b28d48bce95b8980acebd0827689b46b4d1c4cd6d9693`. The proof uses Lean `leanprover/lean4:v4.35.0-rc3` and Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` in the pinned Lake package. The package also pins DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The checked [Lean leaf](../../../../SmoothPoincare/Heights/PrefixSurgeryMatrix.lean) has SHA-256 `5731a325d9f5cfe87abb8b235371fd895dc6db09488b86f64c0412f138be2d5a`. [Marked handle cuts, `thm:mixed` and `sec:zero-sequence`](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) · [Parent manuscript, “The two orders”](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/manuscript/marked_collars_and_smooth_recognition.tex)

The full integer index type is `Fin 2 ⊕ Fin k`. Its ordered leading indices are the zero-framed replacement of the dot and the winding-one attachment. The lower-right block is an arbitrary integer matrix, so the results apply in particular when it is the symmetric linking block of a normalized diagram. The two-sided inverses certify integral invertibility. In the rank proof, the rational congruence bounds the rank of the block diagonal form by two. A nonzero entry $C_{ij}$ would give a rank-three minor using the leading two indices and row $i$, column $j$. The determinant of that minor is $-C_{ij}$. Using separate row and column selections covers off-diagonal entries as well. The geometric use requires the actual normalization and the surgery presentation of $H_1$ of the full outgoing boundary to supply the rational rank premise.

## Declaration readback

The namespace is `SmoothPoincare.PositiveScalarCuts`. These are the `#check` types with the namespace prefix omitted.

```lean
windingOneBlock_mul_inv (d : ℤ) : windingOneBlock d * windingOneBlockInv d = 1
windingOneBlock_inv_mul (d : ℤ) : windingOneBlockInv d * windingOneBlock d = 1
normalizedBlockChange_mul_inv {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
  normalizedBlockChange d v * normalizedBlockChangeInv d v = 1
normalizedBlockChange_inv_mul {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
  normalizedBlockChangeInv d v * normalizedBlockChange d v = 1
windingLinkBlock_schur_eq_zero {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
  (windingLinkBlock v).transpose * windingOneBlockInv d * windingLinkBlock v = 0
normalizedBlockCongr {k : ℕ} (d : ℤ) (v : Fin k → ℤ) (C : Matrix (Fin k) (Fin k) ℤ) :
  (normalizedBlockChange d v).transpose * normalizedSurgeryMatrix d v C * normalizedBlockChange d v =
    Matrix.fromBlocks (windingOneBlock d) 0 0 C
windingZeroBlock_eq_zero_of_rank {k : ℕ} (d : ℤ) (v : Fin k → ℤ)
  (C : Matrix (Fin k) (Fin k) ℤ) (hRank : ((normalizedSurgeryMatrix d v C).map ⇑(Int.castRingHom ℚ)).rank = 2) : C = 0
mixedSurgeryMatrix_det (d : ℤ) (v : Fin 1 → ℤ) (C : Matrix (Fin 1) (Fin 1) ℤ) :
  (normalizedSurgeryMatrix d v C).det = -C 0 0
```

From `formalization/`, `lake env lean SmoothPoincare/Heights/PrefixSurgeryMatrix.lean` and `lake build SmoothPoincare.Heights.PrefixSurgeryMatrix` succeeded. An independent import of the leaf ran `#check` and `#print axioms` on all eight declarations. Every theorem depended only on `propext`, `Classical.choice` and `Quot.sound`.

The checked examples apply the rank implication at $k=0$, check the exact reindexed mixed matrix for $d=4$, $v=(-3)$ and $C=(5)$, compute its determinant $-5$, and verify rational rank four for $d=2$, $v=(3,-7)$ and $C=\left(\begin{smallmatrix}0&5\\5&0\end{smallmatrix}\right)$. The last two examples distinguish the unconditional integer block calculation from the rank-two premise in the full surgery application.
