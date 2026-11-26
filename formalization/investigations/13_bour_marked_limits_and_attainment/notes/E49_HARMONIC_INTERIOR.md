# FOT-E49 · Harmonic radius and stationary interior estimates

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Route 13 execution under the selected Edition 06 lead. Actual serving model and effort unavailable. Input checkout `9c80575988ad8915ad39515c64400e3d8590cf46`, Edition 06 plan SHA-256 `d86d59c000b9c1f29c5b53ae6600cae34c8fda30d7369899d5497f761bf1bab1`, scientific manuscript SHA-256 `719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`. The analysis below uses classical comparison and interior estimates on the actual normalized sequence. The Lean module verifies parts of the chart calculation for a supplied harmonic chart. [Edition 06 plan](../../research-plan/06_PLAN.md) · [Standing sequence](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) · [E48 interior derivation](E48_STATIONARY_INTERIOR.md)

## The normalized physical balls

Take the smooth, closed, connected, volume-one constant-scalar metrics \(g_j\) on the fixed oriented four-manifold after the first returns. Assume a uniform Yamabe floor \(y_*>0\), \(0\le R(g_j)\le C\), and the physical constant-scalar critical equation at \(p_j\in\{0,\alpha_j\}\), with \(0<\alpha_j<1\) and \(\alpha_j\to0\). Set \(a_j=1\) on a bounded-curvature subsequence. On a divergent subsequence choose a curvature maximum \(x_j\), discard the initial indices before \(a_j\ge1\), and take \(a_j=\max_M|\mathrm{Rm}(g_j)|_{(0,4)}\). Write \(h_j=a_jg_j\) and \(s_j=R(h_j)=R(g_j)/a_j\). In both gauges there is \(K\ge1\) with \(\sup_M|\mathrm{Rm}(h_j)|_{(0,4)}\le K\). The divergent branch has ordered norm one at \(x_j\). The ordered curvature square is four times the curvature-operator Hilbert–Schmidt square. Thus the curvature-operator Hilbert–Schmidt norm at \(x_j\) in this normalization is \(1/2\). Trace-free Ricci uses the ordinary two-tensor norm throughout. [Curvature normalization and physical balls](E48_HARMONIC_BALLS.md)

For every \(j\), every \(x\in M\) and \(0<t\le1\), the rescaled Yamabe inequality gives \(\operatorname{Vol}_{h_j}B_{h_j}(x,t)\ge\kappa t^4\) with common \(\kappa>0\). The ordered bound gives \(|\sec_{h_j}|\le K\). The physical Cheeger–Gromov–Taylor application gives a common lower injectivity bound \(i_0>0\). In Lean, `bourUniformNormalBalls_of_yamabe` also produces a common \(r_N>0\) and genuine normal diffeomorphisms onto the physical balls of radius \(r_N\). The Jost–Karcher estimate uses only the dimension, sectional curvature and injectivity bounds, so it applies individually to the compact \(h_j\) with no diameter or total-volume ceiling. [Cheeger–Gromov–Taylor, Theorem 4.7](https://doi.org/10.4310/jdg/1214436699) · [Formal normal-ball supplier](../../../SmoothPoincare/Variational/BourHarmonicBalls.lean)

Fix \(0<\gamma<1\). Jost–Karcher, as stated by Peters, Theorem 4.3, gives harmonic coordinates on a fixed physical radius with uniform \(C^{1,\gamma}\) metric bounds. The passage immediately below 4.3 uses orthonormal tangent frames, metric comparability and a common interior Euclidean ball. Shrink to a physical radius below \(r_N\) and the comparison radius. Center the chart by translation and choose the tangent frame to respect the orientation. A constant linear normalization of the metric at the center preserves harmonicity and has uniformly bounded matrix and inverse by comparability. Write \(H_{j,x}\) for the resulting chart, with \(H_{j,x}(x)=0\). Smoothness follows from local regularity of the scalar harmonic functions for smooth \(h_j\) and the inverse function theorem. There are \(r>0\), \(\Lambda\ge1\) and \(L_\gamma<\infty\), independent of \(j,x\), for which
\[
 H_{j,x}^{-1}\colon B_{4r}(0)\longrightarrow U_{j,x}\subset B_{h_j}(x,r_N)
\]
is a smooth diffeomorphism onto its image, \(H_{j,x}^{-1}(0)=x\), and its pulled-back coefficients \(h_{ik}\) satisfy
\[
 \Lambda^{-1}\delta\le (h_{ik})\le\Lambda\delta,\qquad
 \max_{i,k}\|h_{ik}\|_{C^{1,\gamma}(B_{4r})}\le L_\gamma .
\]
The form bound controls both differentials in Euclidean and physical norms. Choose \(4r\) with a buffer in the chart target. A minimizing curve starting at \(x\) and leaving \(U_{j,x}\) must reach the coordinate sphere. Its initial segment has length at least \(4r/\sqrt{\Lambda}\). In particular \(B_{h_j}(x,r/\sqrt\Lambda)\subset U_{j,x}\). The E48 normal maps give the containing balls and the injectivity control used in this comparison. [Jost–Karcher, 1982](https://doi.org/10.1007/BF01168235) · [Peters, Theorem 4.3 and following paragraph](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=10)

## The two physical elliptic equations

Use \(h=(H_{j,x}^{-1})^*h_j\), \(Z=\mathrm{Ric}_0(h)\), \(s=s_j\), \(p=p_j\), and \(c_j=(2-p_j)s_j/12\). Bour’s nonnegative rough Laplacian is \(\nabla^*\nabla=-\operatorname{tr}_h\nabla^2\). In Bour’s \(aibj\) curvature-action convention, the expanded constant-scalar equation is
\[
 \operatorname{tr}_h\nabla^2 Z
 = F,\qquad
 F=-2W^\circ(Z)+2Z\circ Z-\tfrac12|Z|_h^2h+2c_jZ.             \tag{1}
\]
Here \(Z\circ Z\) contracts in one index with \(h^{-1}\). Bour’s expansion uses \((Z\wedge h)^\circ(Z)=|Z|_h^2h-2Z\circ Z\), and \(Z\circ Z-\frac14|Z|_h^2h\) has zero trace. For constant rescaling the Levi–Civita connection is unchanged, \(Z\) as a covariant two-tensor is unchanged, and \(W\) as a covariant four-tensor is multiplied by \(a_j\). The rough Laplacian, \(W^\circ(Z)\), \(Z\circ Z\), \(|Z|_h^2h\), and the scalar term each acquire the factor \(a_j^{-1}\) as covariant two-tensors. Thus (1) applies at either scale and includes \(p=0\). The inequality \(0\le c_j\le C/(6a_j)\le C/6\) gives \(c_j\to0\) on the divergent branch. Orthogonal curvature decomposition gives \(|W|_{(0,4)}\le K\) and \(|Z|_h\le K/\sqrt2\). Consequently \(F\) and \(Z\) are uniformly bounded in coordinate \(L^\infty\) by ellipticity. [Bour, Proposition 4.4 and its proof](https://arxiv.org/html/1012.0342v1#S4)

Let \(P=h^{ab}\partial_a\partial_b\). Since the actual coordinate functions are harmonic on the open chart, \(h^{ab}\Gamma^m_{ab}=0\) there. The harmonic Ricci identity gives
\[
 Ph_{ik}=-2\bigl(Z_{ik}+(s/4)h_{ik}\bigr)+2Q_{ik}(h^{-1},\partial h).       \tag{2}
\]
The pinned coordinate identity proves (2) from neighborhood harmonicity and bounds \(Q\) by \(9n^4 A^2L^2\), where \(n=4\), \(|h^{ab}|\le A\) and \(|\partial_m h_{ab}|\le L\). The right side is uniformly bounded on \(B_{4r}\). For fixed \(4<b<\infty\) the scalar interior estimate, applied to each of the ten components with uniformly elliptic coefficients with a common modulus of continuity, gives
\[
 \|h\|_{W^{2,b}(B_{3r})}\le C_b .
\]
The Sobolev norms here use Euclidean measure and coordinate derivatives. The physical volume densities on the chart are uniformly comparable to Euclidean measure by the form bound. [DeTurck–Kazdan, Lemma 4.1 and (4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7) · [Gilbarg–Trudinger, Theorem 9.11](https://doi.org/10.1007/978-3-642-61798-0_9) · [Lean harmonic Ricci identity](../../../SmoothPoincare/Variational/BourHarmonicRicci.lean)

The Christoffel formula and \(\partial_m h^{-1}=-h^{-1}(\partial_mh)h^{-1}\) show
\[
 \max |\Gamma|\le 6AL,\qquad
 \max|\partial\Gamma|\le 96A^2 L^2+6A\max|\partial^2h|
\]
pointwise, taking all maxima over coordinate indices. The resulting uniform derivative bound on \(B_{3r}\) is in \(L^b\).

For a covariant two-tensor \(T\) write \((C_aT)_{ik}=\Gamma^m_{ai}T_{mk}+\Gamma^m_{ak}T_{im}\). Covariantly differentiating the derivative slot as well as the two tensor slots gives
\[
 (\nabla^2 T)_{ab}
 =(\partial_a-C_a)(\partial_b-C_b)T
   -\Gamma^m_{ab}(\partial_m-C_m)T.
\]
The last term contracts to zero by harmonicity. Equation (1) becomes
\[
 PZ
 = F+h^{ab}(C_b\partial_a+C_a\partial_b)Z
      + h^{ab}\bigl(\partial_a C_b-C_a C_b\bigr)Z.                         \tag{3}
\]
The first-order system coefficients are uniformly bounded. The coefficient of the last term is uniformly \(L^b\) on \(B_{3r}\), and \(Z\) is uniformly bounded, so their product belongs to the \(L^b\) forcing. The scalar enters through its constant value, and \(p_j\) enters through \(c_j\).

Write (3) as \(PZ=B\cdot DZ+f\) with \(B\) bounded and \(f\) bounded in \(L^b(B_{3r})\). Use a cutoff equal to one on \(B_t\) and supported in \(B_{(t+T)/2}\), with derivative bounds uniform after inserting \((T-t)^{-1}\) and \((T-t)^{-2}\). Apply the scalar \(W^{2,b}\) estimate on a fixed larger pair of balls to each cut-off component. After expanding the commutator,
\[
 \|D^2Z\|_{b;B_t}\le C\Bigl(\|f\|_{b;B_{3r}}
     +(T-t)^{-1}\|DZ\|_{b;B_{(t+T)/2}}
     +(T-t)^{-2}\|Z\|_{b;B_{3r}}\Bigr)
\]
for \(2r\le t<T\le5r/2\). The constant includes the bound for \(B\). For \(\delta<(T-t)/2\), use the one-dimensional Taylor formula on segments of length \(\delta\) in each coordinate direction starting in \(B_{(t+T)/2}\). Minkowski’s inequality bounds the interior \(DZ\) by \(C\delta\|D^2 Z\|_{b;B_T}+C\delta^{-1}\|Z\|_{b;B_T}\). Choose \(\delta\) a sufficiently small fixed multiple of \(T-t\) to make the contribution of \(D^2Z\) at most \(\frac18\|D^2Z\|_{b;B_T}\). Iterate on radii increasing from \(9r/4\) to \(5r/2\) with successive gaps halved. The geometric series converges since \(4/8<1\), and the last term vanishes for each smooth \(Z\), as \(B_{5r/2}\Subset B_{3r}\). The first derivative bound on \(B_{2r}\) follows by the same Taylor inequality with a fixed margin. Thus \(\|Z\|_{W^{2,b}(B_{2r})}\le C'_b\). [Gilbarg–Trudinger, Chapter 9](https://doi.org/10.1007/978-3-642-61798-0_9)

## Higher orders and the residual

Take \(0<\beta<\min(\gamma,1-4/b)\). Morrey gives \(C^{1,\beta}\) control of \(Z\) on a smaller ball. Equation (2) and interior Schauder give \(C^{2,\beta}\) control of \(h\). This controls \(W\) and \(\partial\Gamma\) in \(C^{0,\beta}\). Equation (3) now gives \(C^{2,\beta}\) control of \(Z\). At order \(m\ge2\), \(C^{m,\beta}\) control of both gives \(C^{m-1,\beta}\) control of the right side of (2). Schauder gives \(h\in C^{m+1,\beta}\). Then \(\partial_aC_b\) and \(W\) are \(C^{m-1,\beta}\), and the right side of (3) is \(C^{m-1,\beta}\). The second Schauder application gives \(Z\in C^{m+1,\beta}\). Use nested radii decreasing to \(r\) from above. For each order the constants remain common to \(j,x\). [Gilbarg–Trudinger, Chapters 6–7](https://doi.org/10.1007/978-3-642-61798-0)

Uniform curvature-derivative bounds at every center follow. Completeness and the common injectivity bound give smooth pointed subsequential compactness, with smooth comparison embeddings on an exhaustion. Along a connected oriented exhaustion the orientation sign of each comparison map is fixed by its sign at the base point. In the divergent branch \(s_j\to0\) and the base-point ordered norm remains one. In both branches the exact-Weyl residual is \(G_0(h_j)=(p_j/12)s_j Z\) and tends to zero with all covariant derivatives on the normalized charts. This gives the analytic input for the two stationary extractions. The marked return uses the resulting smooth comparisons to identify the signed physical integrals and the end. [Bour, Theorem 7.1](https://arxiv.org/html/1012.0342v1#S7) · [E48 stationary residual](../../../SmoothPoincare/Variational/BourHarmonicBalls.lean)

## Lean verification and remaining analytic inputs

The targeted module is `SmoothPoincare.Variational.BourStationaryInterior`. Its declarations use the actual metric and its Levi–Civita connection in the supplying smooth atlas. [Lean module](../../../SmoothPoincare/Variational/BourStationaryInterior.lean)

| Declaration | Verified statement |
| --- | --- |
| `bourChartConnectionDerivative_bound` | At an interior coordinate point, inverse-metric and first-jet bounds \(A,L\) and an entrywise second-jet bound \(D\) give \(96A^2L^2+6AD\) for a Christoffel derivative in dimension four. The proof uses the pinned inverse-Gram derivative and Christoffel derivative identities. |
| `bourChartConnection_trace_eq_zero` | Pointwise harmonicity of each actual coordinate function kills the inverse-metric trace of the Levi–Civita derivatives of the coordinate frame. |
| `bourChartRoughLaplacian_eq_secondCovariantTrace` | For a supplied smooth compactly supported tensor, the physical raw rough Laplacian component equals the inverse-metric contraction of iterated covariant derivatives on the harmonic chart. The contracted derivative-slot correction vanishes. The connection terms in the tensor slots remain in the contraction. |

The metric identity `bourChartHarmonicRicci_principal_of_laplacian` uses neighborhood harmonicity, which gives differentiated gauge cancellation. The new rough Laplacian identity uses harmonicity only at the point where the trace is taken. Both interfaces use `extChartAt` of the supplying atlas. The classical harmonic radius proof supplies its own compatible chart, so formal use requires recharting the atlas at that chart or extending the coordinate identities to an arbitrary compatible smooth partial chart. The remaining analytic imports for `bourStationaryInterior_on_normalizedBall` include this harmonic-radius construction and a uniform variable-coefficient nondivergence \(W^{2,b}\) estimate for \(b>4\). The inspected pin includes Euclidean harmonic replacement, variable-coefficient Schauder estimates with local controls, and divergence-form weak regularity at exponent two. [Pinned harmonic replacement](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Sobolev/Euclidean/Replacement/Harmonic.lean) · [Pinned variable-coefficient Schauder estimates](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Schauder/Elliptic/VariableCoefficient/BallInterior.lean)

The targeted Lake build passed under Lean `4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` and Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. A downstream check applied the rough Laplacian identity to the actual smooth compactly supported \((0,2)\)-section \(\mathrm{Ric}-(R/4)h\) on a closed manifold, and separately specialized the derivative bound to dimension four. The three declarations report only `propext`, `Classical.choice` and `Quot.sound` under `#print axioms`.
