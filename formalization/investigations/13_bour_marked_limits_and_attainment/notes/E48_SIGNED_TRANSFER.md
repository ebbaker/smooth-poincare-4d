# E48 · Signed physical charge on a pointed marked image

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The bounded proof assignment requested Sol 6.2/ultra. Actual serving model and effort were unavailable. Intake HEAD `226b8f404b6e5c99f8e71f85280e5c9988bbf652`. Lean `v4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. Working-source SHA-256 values were `a09d1103e02a11d33b5f7b2f77ad2d6c9a3aef75d217b15221b7698ed715b34c` for the E47 marked module and `ad894d246295c306ecccde0466a652e22c5910f0ff238d9dbda14de436e31be7` for the conformal signed measure. [E48 proofs](../../../SmoothPoincare/Variational/BourPointedTransfer.lean) · [E47 marked input](../../../SmoothPoincare/Variational/BourMarkedCore.lean) · [Conformal signed charge](../../../SmoothPoincare/Variational/ConformalChiralCharges.lean)

## One normalized majorant for the two compact masses

On the original oriented four-dimensional pointed comparison, fix one compact domain $K$ on the limit and take its image under the same comparison map $F_i$ for both signs. Eventually $F_i$ is defined and smooth on a neighborhood of all of $K$. Its compact image is measurable, and the eventual orientation hypothesis attaches to the actual comparison map. The curvature estimate in the author's physical conventions gives

$$
 |W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2
 \le \frac14|\mathrm{Rm}|_{(0,4)}^2.
$$

The removed terms are the ordinary trace-free Ricci square divided by two and the scalar square divided by twenty-four. Both are nonnegative. Consequently any normalized Hilbert–Schmidt operator-square bound $B$ on $F_i(K)$ majorizes both pointwise densities. If the normalized bound is the ordered four-tensor norm at most one, the same statement uses $B=1/4$. If it is the Hilbert–Schmidt norm of the curvature operator at most one, it uses $B=1$. [Pointwise signs and operator norm](../../../SmoothPoincare/Variational/BourPointedTransfer.lean) · [E47 physical normalization](../../../SmoothPoincare/Variational/BourTrajectoryBudget.lean)

In the supplied oriented frames, convergence of all four curvature slots on $K$ implies convergence of the positive and negative compressed blocks, their trace-free parts, and their squared Hilbert–Schmidt norms. The single $B$ and the pinned convergence of physical volume with the pointed marking give convergence of each extended nonnegative mass on $F_i(K)$ to its mass on $K$. The limiting density is bounded by the same constant on $K$. Compact volume finiteness lets the result pass to the actual real measure masses. This statement concerns every fixed compact domain. Taking a full pointed lower bound by exhaustion is a separate consequence. [Compact signed transfer](../../../SmoothPoincare/Variational/BourPointedTransfer.lean) · [E47 full-integral exhaustion](../../../SmoothPoincare/Variational/BourMarkedCore.lean)

## Return to the original physical scale

For an original metric $g_i$ and rescaling $a_i g_i$ with $a_i>0$, use the constant log-conformal factor $u_i=(\log a_i)/2$. The normalized frames are the exact conformal rescalings of the original frames. The squared Weyl blocks scale by $a_i^{-2}$ and four-volume by $a_i^2$. The equality is of measures on the supplying manifold and hence applies to the same actual image sets $F_i(K)$, regardless of their size. This gives convergence of the original unscaled masses with the pointwise curvature bound and slot convergence evaluated on the normalized metrics. [Matched signed measure equality and physical transfer](../../../SmoothPoincare/Variational/BourPointedTransfer.lean)

## Saturation and the exterior

Take an increasing compact exhaustion $K_L$ of the limit and finite measures for the two signs. If each source total tends to its corresponding model total, then at each fixed $L$ the exterior mass tends to the model total minus the model mass of $K_L$. The set complement here is the full exterior of the actual source image. By continuity from below, for each $\varepsilon>0$ all sufficiently large $L$ have model tail less than $\varepsilon$ for both signs. For each such fixed $L$, both source exterior masses are below $\varepsilon$ at all sufficiently late source indices. This is the nested order used in the second pointed saturation argument. It controls the raw exterior charge. Splice and cap costs require their own estimates. [Late truncation followed by late source index](../../../SmoothPoincare/Variational/BourPointedTransfer.lean) · [Second pointed comparison in the scientific manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

The compact transfer keeps measurability of the chosen framed densities and four-slot convergence in the paired frames as explicit geometric inputs. The present calculation uses local decomposition and transport. The closed-signature identity and a global construction of comparison-compatible measurable frames are separate geometric obligations. [E47 orientation and whole comparison](../../../SmoothPoincare/Variational/BourMarkedCore.lean)
