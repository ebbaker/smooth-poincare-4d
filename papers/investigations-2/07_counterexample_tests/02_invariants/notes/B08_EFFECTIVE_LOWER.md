# A first-order lower bound on one compact DIR-E33 metric

28 November 2026, America/New_York. For Edward B. Baker III, with OpenAI Codex assistance. Lead B08, proof revision 1. Selected GPT-6.2 Astra/ultra, exact serving metadata unavailable. Checkout 86b24d9f9c2d plus the preceding WIN proofs. All tensors, maps and metrics are smooth, on the oriented standard four-sphere. Analytic estimates below use the fixed data in the [issued metric specification](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md).

**Theorem.** For the specified compact representative with radius a=2⁻²⁵⁶ and amplitude ε=a⁴, every volume-centered quaternionic generating pencil satisfies
\[
 R_g(E)^{1/4}>2^{-40}a^7,
 \qquad b(g)=\inf_E\sqrt{R_g(E)}\ \ge\ 2^{-80}a^{14}=2^{-3664}.
\]
The infimum uses L²(g)-orthonormal pencils. The lower bound also holds without Gram normalization when the same coefficient inner product and centering convention are used. It is a statement about a specified metric. It uses no eigenvalue enclosure on the perturbed sphere.

### Quantities on the same manifold

In stereographic y-coordinates write s=|y|, q=Ω²δ, Ω=2/(1+s²), with q the unit round metric. Its probability measure is ν=dV_q/V₀, V₀=8π²/3. The specified compact metric is g=ρ²δ+εχ(s)(y¹)²[(dy²)²−(dy³)²]. The metric γ=(Ω/ρ)²g=q+h has tracefree h with |q⁻¹h|op≤τ=a⁶, supported in U={s≤a}. Centering concerns the kernel map f:M→HP¹=S⁴⊂ℝ⁵ of E under dV_g/Vol(g). The actual volume is the exact integral of ρ⁴√(1−ε²χ²(y¹)⁴) dy from the frozen profiles. E22 encloses it and uses a test function for the scalar spectrum of g. [Metric, volume and scalar control](E22_METRIC_AND_SPECTRUM.md)

For a unit coefficient k in the pointwise kernel, hold k constant in differentiating the combined field s_k. With m the fibre operator norm of evaluation, R=∫|P s_k|⁴/m⁴ dV. Its angular logarithmic coefficient is 12R. Transporting the generators conformally from g to γ leaves R and f unchanged; comparisons with round derivatives below do not replace the physical measure used to center f. With respect to γ, the differential of f decomposes into the Clifford similarity S and orthogonal remainder N, with |N|=2|P s_k|/m. This factor 2 uses the unit-radius Hopf target. Write r=R^{1/4}. [Incidence identity](BALANCED_SPECTRAL_BOUND.md)

### Round comparison and cancellation

Assume for contradiction that r≤2⁻⁴⁰a⁷. In particular r²≤τ². The [metric square-root calculation](E26_TRANSFER_DEFICIT.md) gives e=∫|df|_q⁴ dν−16 in [0,25000(τ²+r²)]. The lower endpoint follows from |deg f|=1 and the arithmetic-geometric mean on singular values. The upper bound uses the quadratic vanishing of the signed determinant deficit at a similarity. E22's L¹ density comparison gives |∫f dν|≤4096a⁶ since ∫f dV_g=0 and |f|=1. Project the five components of f to the round constants, the first harmonics and their orthogonal complement. The [round harmonic bound](E24_ROUND_HARMONICS.md) supplies O∈O(5) such that
\[
    D=\int |df-d(Ox)|_q^2 d\nu
      \le380(e+|\textstyle\int f d\nu|^2)\le2^{40}a^{12}.
\]
Here x is the identity embedding of the unit sphere in ℝ⁵. All adjoints, pairings and integrals in the remainder of the proof use q and ν unless indicated.

Fix the symmetric covariant tensor T in E25. Its q-trace and q-divergence vanish, it is supported in U, and its HS sup norm is at most K=128. Its explicit Weyl-tensor construction and two integrations by parts yield
\[
   \int\langle T,h\rangle d\nu\ \ge\ 2^{-16}\epsilon a^6=2^{-16}a^{10}.
\]
Write O⁻¹f=x+v and identify its derivative inner products in the ambient ℝ⁵. The linear variation in the pullback metric is the sum of a Lie derivative from the tangential part of v and a multiple of q from its normal part. Its contraction with T integrates to zero. The quadratic remainder is the Gram tensor of dv. Thus |∫⟨T,f* q⟩ dν|≤KD; here f* q denotes the pulled-back target metric. [Test tensor and its normalization](E25_TT_DETECTOR.md) · [Sphere cancellation](E27_STRAIN_TEST.md)

### Localized error and constants

In a q-orthonormal source frame put B=(q⁻¹γ)¹ᐟ². The round matrix of df is A=(S+N)B in compatible frames. Since S is a similarity for γ, the Gram matrix of SB corresponds to uγ for some u≥0 (zero where S=0). Define the covariant tensor Z=f* q−uγ. Using |B|op,|B⁻¹|op≤2, the HS orthogonality of S,N for γ, and the identity for the difference of two Gram matrices gives
\[
 |Z|_q\le (|A|+|SB|)|NB|\le10 |df|_q |N|_\gamma .
\]
Indeed |S|≤|AB⁻¹|≤2|A|, |SB|≤4|A| and |NB|≤2|N|. Also dV_γ/dV_q=√(1−ε²χ²(y¹)⁴)≥1/2, V₀>1, hence ||N||_{L⁴(ν)}≤4r. The round cap satisfies ν(U)≤3a⁴ by Ω≤2 and the Euclidean ball volume. Minkowski's inequality gives
\[
 \|df\|_{L^2(U,\nu)}\le 2\sqrt{3}\,a^2+\sqrt D\le5a^2 .
\]
Hölder on U with exponents 2,4,4 therefore gives the crucial spatial factor
\[
 Z_U:=\int_U |Z|_q\,d\nu\le2^9 a^3 r.
\]
The global estimate for the same error would lose three powers of the cap radius here.

Taking the q-trace in f* q=u(q+h)+Z, use tr_q h=0 and |tr_q Z|≤2|Z|. Since |d(Ox)|=2,
\[
 \int_U|u-1|d\nu\le\sqrt D+D/4+Z_U/2.
\]
This follows by integrating | |df|²−4 |≤4|dv|+|dv|². Pair the Gram equation with T and use |h|_q≤2τ. The linear cancellation and the preceding two bounds give
\[
 \left|\int\langle T,h\rangle d\nu\right|
 \le128\big[D+2\tau(\sqrt D+D/4)+(1+\tau)Z_U\big]
 \le 2^{49}a^{12}+2^{17}a^3r .
\]
The constants in the last inequality allow D≤2⁴⁰a¹² and √D≤2²⁰a⁶. Under the contradiction assumption, the right side is at most (2⁴⁹a²+2⁻²³)a¹⁰, strictly below 2⁻¹⁶a¹⁰ at the frozen radius. This contradicts the explicit pairing and proves the lower bound. No curvature estimate for the second derivatives of f, uniform density change over a conformal class, or prescribed lift of a near-minimizer is assumed. A compatible lift is required separately for the upper control.

### What supplies the quantitative information

The lower bound uses first harmonics to obtain L² derivative error small enough to control the nonlinear remainder. The local tracefree, divergencefree tensor gives a signed strain pairing which survives all linearized changes of coordinates and conformal scale. Both are necessary for this estimate. Guerra–Lamy–Zemas Theorem 1.1 concerns maps with round source and target and an unspecified dimensional stability constant. The [primary reading and transport check](E23_ROUND_STABILITY.md) explains why that result by itself cannot yield the positive number here. The actual compact metric has a nonzero Weyl jet but the fixed-metric compactness theorem alone did not quantify its gap. The above comparison gives a bound before optimizing over the fields.
