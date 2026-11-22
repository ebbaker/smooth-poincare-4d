# Pointwise direction-sphere distortion: a planning check

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual selected model identifier and effort are
unavailable; the selected lead is the sole writer. This fixed algebraic
check belongs to planning integration SP4-CME-SETUP-E01. It does not
activate the proposed real chart construction or nonlinear estimate.
Live status is in the [sole register](../research-progress/REGISTER.md).

Input: the current [manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex),
Section 4.2, labels `rec:adapted-frame` and `rec:adapted-frame-wedge`,
SHA-256 `4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0`.
The author supplied the proposed direction map and bound in this chat.
This is a direct algebraic verification under its stated normalization,
not an independent proof audit of the reconstruction theorem.

## Definition and calculation

Fix a point x. Use the Euclidean metric on E_x and the orthonormal
self-dual identification supplied by Σ_A/√2. With the round-compatible
chirality sign fixed, put S = Q_x^{1/2}, Q_x > 0, tr Q_x = 3. Removing
the fixed curvature sign gives the direction relabelling
\[
 \phi_x:S^2\longrightarrow S^2,\qquad
 \phi_x(u)=\frac{Su}{|Su|}.
\]
A fixed antipodal sign has no effect on the following singular values.
Both domain and target spheres carry the round metrics induced by these
Euclidean inner products. Define
\[
 D_x=\sup_{u\in S^2}
 \frac{\sigma_{\max}(d\phi_x|_{T_uS^2})}
      {\sigma_{\min}(d\phi_x|_{T_uS^2})}.
 \tag{1}
\]
This is the maximum pointwise tangent stretch ratio; the two singular
values in each quotient are evaluated at the same direction u.

For v perpendicular to u and w = Su/|Su|,
\[
 d\phi_x(v)=\frac{(I-w\otimes w)Sv}{|Su|}.
 \tag{2}
\]
Let 0 < a ≤ b ≤ c be the eigenvalues of S. Since orthogonal projection
computes distance to the line spanned by Su,
\[
 |(I-w\otimes w)Sv|
 =\inf_{r\in\mathbb R}|S(v-ru)|
 \geq a|v|,
\]
and its upper bound is c|v|. The singular-value ratio in (1) is therefore
at most c/a. At a unit eigenvector for b, its two tangent singular values
are a/b and c/b, attaining c/a. This also covers repeated eigenvalues by
choosing an orthonormal eigenbasis. Hence
\[
 \boxed{D_x=\sqrt{\lambda_{\max}(Q_x)/\lambda_{\min}(Q_x)}}.
 \tag{3}
\]
Trace normalization implies λ_max(Q_x) ≥ 1, so
\[
 \lambda_{\min}(Q_x)=\frac{\lambda_{\max}(Q_x)}{D_x^2}
 \geq D_x^{-2}.
 \tag{4}
\]
Conversely, λ_min(Q_x) ≥ κ implies D_x ≤ √(3/κ).
Thus uniform distortion control and uniform normalized eigenvalue control
are equivalent up to these constants. At Q = I, φ is the identity and D = 1.

## Analytical limit of this check

Equations (1)–(4) concern one fiber at one point. They contain no evolution,
base derivative, scale estimate, reality theorem or chart reconstruction.
In particular, they do not prove that D remains bounded along Fine's flow.
A proposed chart estimate whose constants already assume λ_min(Q) ≥ κ
does not establish that missing bound. Dependence on derivatives of S,
the horizontal transport, the volume density and the metric geometry must
be tracked separately. The real coordinate program remains proposed and
unactivated in the register.
