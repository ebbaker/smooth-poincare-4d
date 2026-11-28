# The infimum of the angular residue on a fixed metric

27 November 2026 (New York). Prepared for Edward B. Baker III by the OpenAI Codex research lead. WIN-B06, proof revision 1, checkout 86b24d9f9c2d. Selected GPT-6.2 Astra/ultra, actual serving settings unavailable. Same metric, quaternionic conventions and functional R as the [rigidity proof](PENCIL_RIGIDITY.md). This is a claim about the coefficient of logarithmic divergence, prior to any restriction to eigenspinors or field equations.

**Claim.** For each smooth Riemannian metric on each smooth oriented homotopy four-sphere,
\[
 \inf_{(s,t)\ L^2\text{-orthonormal, fibre-generating}} R_g(s,t)=0 .
\]
It is attained precisely on the conformally round classes. On a nonround conformal class every such pencil has infinite untruncated angular mean, even though the coefficient of divergence can approach zero.

Fix one point p and oriented normal coordinates in a small coordinate ball. In the synchronous spin frame take s(x)=c_p(x)a with a unit negative half-spinor and constant flat Clifford matrices; thus |s|=r exactly in that frame. Extend it with no further zero. For clarity, the source construction uses the contractible coordinate-ball complement and the total Euler number −1. The local Clifford zero has index −1 in the right-complex orientation; in a complementary trivialization the boundary direction then has degree zero and extends as a nonzero smooth field with its collar. This is the [first-series prescribed-zero construction](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md). Choose t equal to a constant unit positive spinor b times a smooth radial cutoff χ supported in the chart, with χ=1 on a smaller ball. For 0<λ<1 use (s,λt); fibre generation holds at every point. Its two sections are independent since the second vanishes outside the chart and is nonzero near p.

Write m²=|s|²+λ²|t|². For unit kernel k=(k₁,k₂) the equation s k₁+λt k₂=0 gives |k₁|=λ|t|/m and |k₂|=|s|/m, including either vanishing case. At p the model has P s(p)=0, so |Ps|≤Cr in the inner ball. There |Pt|≤C. Thus
\[
 \frac{|B k|}{m}\le
 \frac{\lambda(|t||Ps|+|s||Pt|)}{m^2}
 \le C\frac{\lambda r}{r^2+\lambda^2}.
\]
Outside this inner ball |s| is bounded below and the ratio is O(λ), vanishing off the support of t and its derivative. Integrating the fourth power on r≤λ and on λ≤r≤r₀ with volume bounded by Cr³dr gives
\[
 R_g(s,\lambda t)\le C_g\lambda^4(1+|\log\lambda|).
\]
The constants also depend on the fixed chart and fields. No uniform geometry over metrics is asserted.

**Exact L² normalization.** Both orthogonality and equality of generator norms can be imposed without changing R. In the chart write dV_g=J(x)dx with J smooth and positive. Choose a smooth positive w₀ equal to 1/J on a neighborhood of the support of t, extended positively over M. For all small λ, the integral of w₀(|s|²−λ²|t|²) is positive. Let η_λ be a smooth nonnegative, nonzero radial bump supported in r<λ/2 in the inner ball. There |s|²−λ²|t|²<0. Replace w₀ by w=w₀(1+A_λ η_λ) where the unique positive A_λ makes that integral zero. Also
\[
 \int_M w\,\langle s,\lambda t\rangle_{\mathbb H}\,dV_g=0 .
\]
On the support of t this is an odd quaternion-valued real linear function of x times a radial density on a symmetric ball. Elsewhere t=0. Multiplying both fields by √w leaves R exactly unchanged by the product rule at the kernel line. Dividing by their common positive L² norm preserves R again and gives an orthonormal pencil. No derivative or uniform upper bound on w is used.

The [rigidity argument](PENCIL_RIGIDITY.md) proves the attainment statement using the compact round control. Finite-cost single spinors from the first series and angular mean or residue for a pencil are three different measurements. The construction concentrates in the parameter map and in the normalization weight; it supplies no sequence with small single-spinor J in a fixed kernel-free class.
