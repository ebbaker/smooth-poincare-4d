# A scalar spectral bound for volume-centered kernel maps

27 November 2026 (New York), for Edward B. Baker III, by the OpenAI Codex lead. Selected GPT-6.2 Astra/ultra, serving settings unavailable. WIN-B06, revision 1, baseline 86b24d9f9c2d. Continue from the [residue and incidence jet](PENCIL_RIGIDITY.md), [concentration control](PENCIL_CONCENTRATION.md) and [signed degree](E13_SPINOR_PENCIL.md). This comparison uses real Hilbert–Schmidt norms and the unit-radius target.

**Proposition.** Fix the compact metric g and a generating quaternionic pencil E as above. Identify HP¹ with the unit sphere in ℝ⁵ by the Hopf map. If its kernel map f obeys the five real centering equations ∫ f dV_g=0, set V=Vol(g), V₀=Vol(S⁴ of radius one)=8π²/3 and L=λ₁(g)√V, where λ₁ is the first positive eigenvalue of the scalar nonnegative Laplacian. Then
\[
   R_g(E)^{1/2}\ \ge\ \frac{(L^2-16V_0)_+}{408 L}.
\]
A certified lower bound on L above 4√V₀ suffices because the right side increases there. The constant is an explicit conservative estimate. The balancing equations concern the volume distribution of the lines K_x. They are invariant under common pointwise scaling of the generators. The quaternionic L² Gram condition on the generators weights those lines by m² and cannot enforce these five equations by itself.

**Proof.** Put A=df in real oriented orthonormal frames. In the usual projective chart at [0:1] the unit-radius Hopf identification has differential of length factor 2 on Hom_H(K,K^⊥) evaluated at a unit k; the action of Sp(2) preserves this factor everywhere. Indeed the off-diagonal coordinate of the Hopf map is 2q/(1+|q|²) in this chart; the fifth coordinate has zero derivative at q=0. The incident spinor derivative in the proof of rigidity therefore decomposes A=S+N, where S is the image of the Clifford summand c(·)(−Ds_k/4) and N the image of P s_k, with a common signed similarity of factor 2/m on their values. Thus S is either zero or a real similarity, and d=|N|=2|Bk|/m. The two matrices are perpendicular in the real Hilbert–Schmidt inner product since P has zero Clifford trace. Although local unit lifts k suffice, the resulting tangent maps do not depend on their right phase. There is a single sign σ for the orientation of the nonzero Clifford similarities: in oriented spin frames their model is X↦c(X)h for h≠0; the allowed frames, unit parameters and nonzero h in the quaternionic line vary in connected spaces. This convention also applies where S=0. Only the absolute topological degree will enter.

For a real four-by-four matrix C let F(C)=|C|⁴−16σ det C. At any such similarity S, F(S)=0 and DF(S)=0, since for scale a its cofactor satisfies cof S=σ a² S and |S|²=4a². Both vanish also at S=0. For any N the second directional derivative of |C|⁴ is bounded in magnitude by 12|C|²|N|². In the determinant expansion its second derivative is a sum of twelve ordered replacements of two columns of C by columns of N, each of absolute value at most |C|²|N|² by the Euclidean volume bound for four vectors. Hence
\[
    |F(A)|\le102 |A|^2 d^2.
\]
Here Taylor's integral remainder has weight 1/2, and |S+tN|≤|A| on 0≤t≤1 by perpendicularity. This bound includes degenerate and orientation-reversing derivatives without a regular-value restriction.

Set H=(∫|A|⁴)^{1/2} and D=(∫d⁴)^{1/2}=4R_g(E)^{1/2}. Integrate, use |∫det A|=V₀ by |deg f|=1, and apply Cauchy–Schwarz:
\[
 H^2\le16 V_0+102 H D.
\]
The five mean-zero coordinate functions of f have squared sum one. Their scalar Rayleigh inequalities yield ∫|df|²≥λ₁V, and Cauchy–Schwarz bounds the left side above by H√V. Thus H≥L>0. The function H−16V₀/H is increasing. Substitution gives the claimed bound. Degree integration and centering are used on this same pencil and metric.

**Controls and cost.** The round twistor pencil has zero residue and its round kernel map is a similarity globally with constant dilation one for the unit round metrics, so its coordinate means vanish. At λ₁=4 the right side vanishes. On the standard smooth sphere, centering can be imposed on a diffeomorphic kernel map for every metric. See the [primary source and centering check](E16_SPECTRAL_CONTROL.md) for the extent of the large-eigenvalue control. The estimate reduces verification for all centered pencils on one metric to a scalar spectral lower bound and a volume. Producing a rigorous eigenvalue lower bound can itself require global analysis. A positive value on a marked metric is compatible with the standard smooth sphere. No uniform lower bound over all metrics on a candidate follows.
