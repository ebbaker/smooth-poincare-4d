# FOT-E49 · Harmonic radius and stationary interior estimates

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Route 13 execution under the selected Edition 06 lead. Actual serving model and effort unavailable. Input checkout `9c80575988ad8915ad39515c64400e3d8590cf46`, Edition 06 plan SHA-256 `d86d59c000b9c1f29c5b53ae6600cae34c8fda30d7369899d5497f761bf1bab1`, scientific manuscript SHA-256 `719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`. The analysis below uses classical comparison and interior estimates on the actual normalized sequence. The Lean module verifies parts of the chart calculation for a supplied harmonic chart. [Edition 06 plan](../../research-plan/06_PLAN.md) · [Standing sequence](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) · [E48 interior derivation](E48_STATIONARY_INTERIOR.md)

## The normalized physical balls

Take the smooth, closed, connected, volume-one constant-scalar metrics (g_j) on the fixed oriented four-manifold after the first returns. Assume the uniform Yamabe floor (y_*>0), (0le R(g_j)le C), and the physical constant-scalar critical equation at (p_jin{0,alpha_j}), with (0<alpha_j<1) and (alpha_j	o0). Set (a_j=1) on a bounded-curvature subsequence. On a divergent subsequence choose a curvature maximum (x_j), discard the finite tail before (a_jge1), and take (a_j=max_M|mathrm{Rm}(g_j)|_{(0,4)}). Write (h_j=a_jg_j) and (s_j=R(h_j)=R(g_j)/a_j). In both gauges there is (Kge1) with (sup_M|mathrm{Rm}(h_j)|_{(0,4)}le K). The divergent branch has ordered norm one at (x_j). The ordered curvature square is four times the curvature-operator Hilbert–Schmidt square, so in the operator norm convention the normalized value at (x_j) is (1/2). The norm of trace-free Ricci is the ordinary two-tensor norm throughout. [Curvature normalization and physical balls](E48_HARMONIC_BALLS.md)

For every (j), every (xin M) and (0<tle1), the rescaled Yamabe inequality gives (operatorname{Vol}_{h_j}B_{h_j}(x,t)gekappa t^4) with a common (kappa>0). The ordered bound gives (|sec_{h_j}|le K). The physical Cheeger–Gromov–Taylor application gives a common lower injectivity bound (i_0>0). In Lean, `bourUniformNormalBalls_of_yamabe` also produces a common (r_N>0) and genuine normal diffeomorphisms onto these physical balls. The dimension, sectional and injectivity bounds hold on the closed rescaled manifolds. Their total volumes and diameters need no common upper bound for this local application. [Cheeger–Gromov–Taylor, Theorem 4.7](https://doi.org/10.4310/jdg/1214436699) · [Formal normal-ball supplier](../../../SmoothPoincare/Variational/BourHarmonicBalls.lean)

Fix (0<gamma<1). Apply Jost–Karcher as stated by Peters, Theorem 4.3, to this family. It gives harmonic coordinates on a fixed physical radius with uniform (C^{1,gamma}) metric bounds. The passage immediately below 4.3 uses orthonormal tangent frames and restrictions to a uniform interior Euclidean ball, on which the metric is uniformly comparable to the Euclidean metric. Choose the physical radius smaller than (r_N) and the radius of the comparison. Center the chart by translation, and use an orthonormal choice of frame and, if needed, an orientation-preserving constant linear normalization at the center. Write (H_{j,x}) for the resulting chart, (H_{j,x}(x)=0). The original coordinates and their inverses are smooth for smooth (h_j), by local regularity for the scalar harmonic functions and the inverse function theorem. Consequently there are (r>0), (Lambdage1) and (L_gamma<infty) independent of (j,x) such that
[
 H_{j,x}^{-1}colon B_{4r}(0)longrightarrow U_{j,x}subset B_{h_j}(x,r_N)
]
is a smooth diffeomorphism onto its image, (H_{j,x}^{-1}(0)=x), and its pulled-back coefficients (h_{ik}) on (B_{4r}) satisfy
[
 Lambda^{-1}deltale (h_{ik})leLambdadelta,qquad
 max_{i,k}|h_{ik}|_{C^{1,gamma}(B_{4r})}le L_gamma .
]
The two-sided form bound controls the differentials of the chart and inverse as maps between the physical and Euclidean norms. One can guarantee an intrinsic ball in this image by first choosing a buffer in the chart target. A minimizing curve starting at (x) and leaving (H_{j,x}^{-1}(B_{4r})) must reach the coordinate sphere, and its initial segment has length at least (4r/sqrt{Lambda}). In particular (B_{h_j}(x,r/sqrtLambda)subset U_{j,x}). These are new harmonic charts on the physical metrics. The E48 normal maps supply the containing balls and the injectivity control for the comparison. [Jost–Karcher, 1982](https://doi.org/10.1007/BF01168235) · [Peters, Theorem 4.3 and following paragraph](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=10)

## The two physical elliptic equations

Use (h=H_{j,x}^{-1*}h_j), (Z=mathrm{Ric}_0(h)), (s=s_j), (p=p_j), and (c_j=(2-p_j)s_j/12). Bour’s nonnegative rough Laplacian is (
abla^*
abla=-operatorname{tr}_h
abla^2). In Bour’s (aibj) curvature-action convention, the expanded constant-scalar equation is
[
 operatorname{tr}_h
abla^2 Z
 = F,qquad
 F=-2W^circ(Z)+2Zcirc Z-	frac12|Z|_h^2h+2c_jZ.             	ag{1}
]
Here (Zcirc Z) contracts in one index with (h^{-1}). Bour’s expansion uses ((Zwedge h)^circ(Z)=|Z|^2_hh-2Zcirc Z). The quadratic tensor (Zcirc Z-rac14|Z|^2_hh) has zero trace. For constant rescaling the Levi–Civita connection is unchanged, (Z) as a covariant two-tensor is unchanged, and (W) as a covariant four-tensor is multiplied by (a_j). The rough Laplacian, (W^circ(Z)), (Zcirc Z), (|Z|_h^2h), and the scalar term each acquire the same factor (a_j^{-1}) as covariant two-tensors. Thus (1) applies at either scale, including (p=0). The inequality (0le c_jle C/(6a_j)le C/6) is uniform and gives (c_j	o0) on the divergent branch. Orthogonal curvature decomposition gives (|W|_{(0,4)}le K) and (|Z|_hle K/sqrt2). Consequently (F) and (Z) are uniformly bounded in coordinate (L^infty) by ellipticity. [Bour, Proposition 4.4 and its proof](https://arxiv.org/html/1012.0342v1#S4)

Let (P=h^{ab}partial_apartial_b). Since the actual coordinate functions are harmonic throughout the open chart, (h^{ab}Gamma^m_{ab}=0) there. The harmonic Ricci identity gives
[
 Ph_{ik}=-2igl(Z_{ik}+(s/4)h_{ik}igr)+2Q_{ik}(h^{-1},partial h).       	ag{2}
]
The pinned coordinate identity proves the same formula from neighborhood harmonicity and bounds the error (Q) by (9n^4 A^2L^2), where (n=4), (|h^{ab}|le A) and (|partial_m h_{ab}|le L). The right side is uniformly bounded on (B_{4r}). For fixed (4<b<infty) the scalar interior estimate, applied to each of the ten components with uniformly elliptic coefficients with a common modulus of continuity, gives
[
 |h|_{W^{2,b}(B_{3r})}le C_b .
]
All Sobolev norms here use Euclidean measure and coordinate derivatives. The physical volume densities on the chart are uniformly comparable to Euclidean measure by the same form bounds. [DeTurck–Kazdan, Lemma 4.1 and (4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7) · [Gilbarg–Trudinger, Theorem 9.11](https://doi.org/10.1007/978-3-642-61798-0_9) · [Lean harmonic Ricci identity](../../../SmoothPoincare/Variational/BourHarmonicRicci.lean)

The first-jet Christoffel formula and (partial_m h^{-1}=-h^{-1}(partial_mh)h^{-1}) show
[
 max |Gamma|le 6AL,qquad
 max|partialGamma|le 96A^2 L^2+6Amax|partial^2h|
]
pointwise, taking all maxima over coordinate indices. The resulting uniform derivative bound on (B_{3r}) is in (L^b). It allows (partialGamma) to depend on the metric Hessian.

For a covariant two-tensor (T) write ((C_aT)_{ik}=Gamma^m_{ai}T_{mk}+Gamma^m_{ak}T_{im}). Covariantly differentiating the derivative slot as well as the two tensor slots gives
[
 (
abla^2 T)_{ab}
 =(partial_a-C_a)(partial_b-C_b)T
   -Gamma^m_{ab}(partial_m-C_m)T.
]
The last term contracts to zero by harmonicity. In particular (1) becomes
[
 PZ
 = F+h^{ab}(C_bpartial_a+C_apartial_b)Z
      + h^{ab}igl(partial_a C_b-C_a C_bigr)Z.                         	ag{3}
]
The first-order system coefficients are uniformly bounded, and the coefficient of the last term is uniformly (L^b) on (B_{3r}). Since (Z) is uniformly bounded, its product with that coefficient belongs to the (L^b) forcing. No derivative of the scalar and no inverse power of (p_j) enters.

To see the system absorption explicitly, write (PZ=Bcdot DZ+f) with (B) bounded and (f) bounded in (L^b(B_{3r})). Use a cutoff equal to one on (B_t) and supported in (B_{(t+T)/2}), with derivative bounds uniform after inserting the factors ((T-t)^{-1}) and ((T-t)^{-2}). Apply the scalar (W^{2,b}) estimate on a fixed larger pair of balls to each cut-off component. After expanding the commutator,
[
 |D^2Z|_{b;B_t}le CBigl(|f|_{b;B_{3r}}
     +(T-t)^{-1}|DZ|_{b;B_{(t+T)/2}}
     +(T-t)^{-2}|Z|_{b;B_{3r}}Bigr)
]
for (2rle t<Tle5r/2). The constant includes the full bound for (B). For (delta<(T-t)/2), integrate the one-dimensional Taylor formula on segments of length (delta) in each coordinate direction, starting in (B_{(t+T)/2}). Minkowski’s inequality gives the interior bound for (DZ) by (Cdelta|D^2 Z|_{b;B_T}+Cdelta^{-1}|Z|_{b;B_T}). Choosing (delta) a sufficiently small fixed multiple of (T-t) bounds the contribution of (D^2Z) by (rac18|D^2Z|_{b;B_T}). Iterate along radii increasing from (9r/4) to (5r/2) with successive gaps halved. The geometric series converges since (4/8<1), and the last term vanishes for each smooth (Z), as (B_{5r/2}Subset B_{3r}). The first derivative bound on (B_{2r}) follows by the same Taylor inequality with a fixed margin. Thus (|Z|_{W^{2,b}(B_{2r})}le C'_b). [Gilbarg–Trudinger, Chapter 9](https://doi.org/10.1007/978-3-642-61798-0_9)

## Higher orders and the residual

Take (0<eta<min(gamma,1-4/b)). Morrey gives (C^{1,eta}) control of (Z) on a smaller ball. Equation (2) and interior Schauder give (C^{2,eta}) control of (h). This controls (W) and (partialGamma) in (C^{0,eta}). Equation (3) now gives (C^{2,eta}) control of (Z). At order (mge2), (C^{m,eta}) control of both gives (C^{m-1,eta}) control of the right side of (2). Apply Schauder to gain (hin C^{m+1,eta}). Then (partial_aC_b) and (W) are (C^{m-1,eta}), and the right side of (3) is (C^{m-1,eta}). The second Schauder application gains (Zin C^{m+1,eta}). Choose nested radii decreasing to (r) from above. For each order the constants remain common to (j,x). [Gilbarg–Trudinger, Chapters 6–7](https://doi.org/10.1007/978-3-642-61798-0)

Uniform curvature-derivative bounds at every center follow. Completeness and the common injectivity bound supply smooth pointed subsequential compactness, in the sense of actual smooth comparison embeddings on an exhaustion. Along a connected oriented exhaustion the sign of a comparison map is fixed by its sign at the base point. In the divergent branch (s_j	o0) and the base-point ordered norm remains one. In both branches the exact-Weyl residual is (G_0(h_j)=(p_j/12)s_j Z), so it tends to zero with all covariant derivatives on the normalized charts. The estimates give the analytic input prior to comparison of physical signed integrals and the separate marked-end identification. [Bour, Theorem 7.1](https://arxiv.org/html/1012.0342v1#S7) · [E48 stationary residual](../../../SmoothPoincare/Variational/BourHarmonicBalls.lean)
