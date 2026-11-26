# FOT-E48 · The stationary estimates inside a normalized ball

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance under the selected Astra/ultra lead. Serving telemetry unavailable. The source is Investigation 06 at working manuscript generation `23aceaccee4faa97fde5eb8a7a4f1d1d6aca18363a8a80da456a6d13af415aa6`. The interior estimates below are a mathematical derivation using the stated classical comparison and elliptic theorems. The final section locates the corresponding Lean boundary. [Source receipt](../../reviews/E48_SOURCE_AND_IMPORT_RECEIPT_20261126.md) · [06 stationary argument](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/CSC_ESTIMATES_20261126.md)

## Radius in the two gauges

Let the mixed metrics be smooth, closed and connected with unit volume and constant scalar curvature. Use the returned uniform Yamabe floor and upper scalar bound. Write $h=a q$, $a\ge1$, $s=R(q)/a$, $E=\mathrm{Ric}_0(h)$ and $p\in[0,1)$. The value of $p$ is the original positive regularization or zero according to the first return. At bounded curvature take $a=1$. Otherwise select a maximum of the physical norm and choose $a$ equal to this maximum along its divergent subsequence. The convention matters at this selection. If $Q$ is the ordered four-tensor norm, the rescaled ordered norm is one at its center and the curvature-operator norm there is $1/2$. If the operator norm used for this choice is the Hilbert–Schmidt norm on $\Lambda^2$, it is half the ordered norm, hence a center normalized to one in that convention has ordered norm two. The trace-free Ricci two-tensor uses its full ordinary metric norm.

In either normalization take $K$ to bound the ordered curvature norm. Then every sectional curvature has absolute value at most $K$. The volume ratio on every physical ball through radius one and the Jacobi comparison imply $\operatorname{inj}_h\ge i_0>0$. The formal construction provides a single radius and an actual diffeomorphism onto each selected ball, with uniform quadratic-form bounds in its normal chart. Applied separately to the closed metrics $h$, the Jost–Karcher theorem in Peters 4.3 now gives a harmonic radius $r_H>0$ and uniform $C^{1,\gamma}$ coefficient bounds for fixed $0<\gamma<1$. The constants depend only on dimension, the curvature and injectivity bounds, and the chosen exponent. Center and linearly normalize the harmonic coordinates. Shrinking once gives a Euclidean coordinate ball of a single radius with a fixed ellipticity interval by the coefficient bound and $h_{ab}(0)=\delta_{ab}$. These comparisons apply before any stationary derivative bound. [Normal-ball proof](../../../SmoothPoincare/Variational/BourHarmonicBalls.lean) · [Cheeger–Gromov–Taylor, Theorem 4.7](https://doi.org/10.4310/jdg/1214436699) · [Peters, Theorem 4.3](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=10)

## A physical first-derivative estimate before choosing coordinates

The CSC critical equation also gives a coordinate-independent estimate directly on the normalized balls. Here this is an analytic consequence of the geometric Euler equation. Write $K=\sup|\mathrm{Rm}(h)|_{(0,4)}$, $c=(2-p)s/12\ge0$, and $D=\int|E|^2$. In an orthonormal frame, Cauchy–Schwarz in the four ordered indices gives $|\langle W^\circ(E),E\rangle|\le |W|_{(0,4)} |E|^2$. Diagonalizing $E$ gives $|\operatorname{tr}E^3|\le |E|^3$. Orthogonal curvature decomposition gives $|W|_{(0,4)}\le K$ and $|E|\le K/\sqrt2$. Thus on the closed source, pairing the actual critical equation with $E$, integrating by parts in the physical volume, and using $\operatorname{tr}E=0$ gives
$$
 \tfrac12\int |\nabla E|^2+cD
 =\int\bigl(\langle W^\circ(E),E\rangle-\operatorname{tr} E^3\bigr)
 \le (1+1/\sqrt2)K D.
$$
The same pairing can be sharpened without estimating the cubic term separately. In the $aibj$ slot convention,
$$
 W^\circ(E)=\mathrm{Rm}^\circ(E)-\tfrac12|E|^2h+E^2+\tfrac{s}{12}E.
$$
The cubic terms cancel and the pure metric term vanishes on pairing with $E$. Thus
$$
 \tfrac12\int |\nabla E|^2+\tfrac{(1-p)s}{12}D
 =\int \langle\mathrm{Rm}^\circ(E),E\rangle\le K D .
$$
Indeed the four-index array $E^{ab}E^{ij}$ has Hilbert–Schmidt norm $|E|^2$ in an orthonormal frame. This estimate controls the entire rescaled source even if its total volume grows. It uses the uniform Ricci mass.

For an estimate on the specific ball, test against $\eta^2 E$ with $\eta=1$ on $B_h(x,r)$, tapering linearly to zero at $3r/2$, with support inside the open $2r$-ball and $|\nabla\eta|\le 2/r$. A distance cutoff is admissible by density in $W^{1,2}$ on the smooth compact source. The cross term is bounded by $\tfrac14\int\eta^2|\nabla E|^2+\int|\nabla\eta|^2|E|^2$. Hence
$$
 \tfrac14\int_{B_h(x,r)} |\nabla E|^2+c\int_{B_h(x,r)}|E|^2
 \le \bigl((1+1/\sqrt2)K+4/r^2\bigr)\int_{B_h(x,2r)}|E|^2 .
$$
Using the paired cancellation also replaces $c$ by $(1-p)s/12$ and $(1+1/\sqrt2)K$ by $K$ in this ball estimate. These inequalities use the full ordinary Ricci norm and $p$ only through a nonnegative scalar coefficient. The input is stationarity in physical tensor form. They apply before taking a compact or pointed limit. [CSC equation and signs](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/CSC_ESTIMATES_20261126.md) · [Pinned closed tensor Green identity](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Elliptic/ConnectionLaplacian/IntegrationByParts/CovariantTwoTensor/Basic.lean)

## Interior bounds independent of the regularization

Work on a coordinate ball $B_{4r}$ contained in the preceding chart with $r>0$ chosen uniformly. Fix $b>4$. The harmonic Ricci equation in the curvature convention of 06 reads
$$
 h^{ab}\partial_a\partial_b h_{ik}=-2\mathrm{Ric}_{ik}+2Q_{ik}(h^{-1},\partial h).
$$
The terms in $Q$ are quadratic in first derivatives with bounded inverse-metric coefficients. The checked numerical bound is $|Q_{ik}|\le9n^4 A^2L^2$ for $|h^{ab}|\le A$, $|\partial h_{ab}|\le L$. In four dimensions the corresponding additive bound for the contracted metric Hessian is $4608A^2L^2$. The gauge $h^{ab}(\partial_a h_{bk}-\frac12\partial_k h_{ab})=0$ holds in a neighborhood. Differentiating it cancels the mixed second derivatives. An equality at the center alone would leave derivatives of this contraction in Ricci. Ellipticity, the $C^1$ bound and the curvature bound give a uniform $L^\infty$ right side. The scalar linear interior $W^{2,b}$ estimate, applied to each of the ten entries, bounds $\|h\|_{W^{2,b}(B_{3r})}$. In particular $\Gamma$ is bounded and $\partial\Gamma$ is uniformly in $L^b$. [Coordinate identity](../../../SmoothPoincare/Variational/BourHarmonicRicci.lean) · [DeTurck–Kazdan, Lemma 4.1 and (4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7) · [Gilbarg–Trudinger, Chapter 9, interior estimates](https://doi.org/10.1007/978-3-642-61798-0)

Use the constant-scalar critical equation of Bour, Proposition 4.4. Its left side contains $\frac12\nabla^*\nabla E$ and its algebraic terms have magnitudes bounded by a dimensional multiple of $|W||E|+|E|^2+|(2-p)s||E|/12$. Each is bounded uniformly on the normalized chart. The coefficient $(2-p)s/12$ is in $[0,C/6]$. In covariant two-tensor coordinates, expanding the rough Laplacian adds $\Gamma\partial E$, $(\partial\Gamma)E$ and $\Gamma\Gamma E$ with bounded inverse-metric coefficients. Consequently the equation has a common scalar diagonal principal operator $h^{ab}\partial_{ab}$, a bounded first-order coupling and a uniformly $L^b$ right side. The $C^0$ curvature bound already bounds $E$. The interior $W^{2,b}$ estimate with bounded first-order coefficients gives $\|E\|_{W^{2,b}(B_{2r})}\le C_b$. Equivalently, in the scalar interior estimate on the components one absorbs the first-derivative terms by the interior interpolation inequality with a sufficiently small coefficient. The constants depend on $r,b$, the ellipticity interval and the common coefficient bounds. No division by $p$ occurs. [Bour, Proposition 4.4](https://arxiv.org/html/1012.0342v1#S4) · [Gilbarg–Trudinger, Chapters 7 and 9](https://doi.org/10.1007/978-3-642-61798-0)

Choose $0<\beta<\min(\gamma,1-4/b)$. Morrey gives a uniform $C^{1,\beta}$ bound for $E$ on smaller balls. The metric equation gives $C^{2,\beta}$ for $h$ since $\mathrm{Ric}=E+sh/4$. Thus $W$ and $\partial\Gamma$ have uniform $C^{0,\beta}$ bounds. The Ricci equation next gives $E\in C^{2,\beta}$. One more application to the metric gives $h\in C^{3,\beta}$. Iterating on nested interior balls gives uniform bounds at every fixed order on $B_r$, with constants allowed to depend on that order. At the curvature scale $s\to0$. At the bounded scale $p\to0$ still kills the residual $(p/12)sE$. Passing to a smooth limit requires the corresponding oriented comparison and passage of the actual Euler operator. These estimates establish the analytic supplier with the cited theorems. [Master fixed-type step](../../../../papers/master/manuscript/attainment_on_the_original_sphere.tex)

## What the public Lean statements supply

The physical volume estimate, the curvature normalization, the uniform injectivity and normal-ball comparison, and the differentiated coordinate principal identity have their own formal statements. On the supplied chart the physical Laplacian of its coordinate functions is the negative contracted Christoffel symbol. Its neighborhood vanishing implies the precise lowered harmonic gauge used by the principal equation. Realizing the Jost–Karcher charts with a checked transition to that interface and the interior variable-coefficient $W^{2,b}$ estimates for this coupled system remain formal obligations. An elliptic principal symbol and zeroth-order curvature alone do not give the full comparison in Lean. [Route register](../research-progress/REGISTER.md)
