# E251/E252 — Every prescribed strict spectral cap fails

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. The selected lead model and effort are preserved and unavailable. Helpers configured gpt-6.2-sol/ultra; independent runtime attestation unavailable. The lead read both complete proofs, checked compact-parameter uniformity, common parabolic time, interpolation, recovery-map continuity and final quantifiers. This is internal assessment, not external peer review or novelty certification. E251's author previously derived E249; E252's author previously derived E250. They worked on disjoint new dependencies and did not independently rederive each other's results.

Accept [E251](../notes/251_UNIFORM_PARAMETER_CAP_FAMILY_20261123.md) and [E252](../notes/252_CONDITIONAL_PRESCRIBED_STRICT_CAP_FLOW_20261123.md). E251 now supplies H_family in E252; its frozen conditional wording is preserved. The [preceding assessment](E248_E250_FIXED_RATIO_CAP_ASSESSMENT_20261123.md) remains the fixed-r closed-cap result. This assessment closes its explicit strict-threshold quantifier gap.

Fix any prescribed finite threshold r0>1. On the standard smooth oriented round S4 and its positive chiral SO(3) bundle, there are smooth positive definite round-compatible initial data whose global ratio is strictly below r0, but whose actual original native smooth flow has global ratio strictly above r0 at a positive time. Both the time and the data may depend on r0. Thus neither the closed nor the strict global ratio class at any finite r0>1 is generally invariant. This is a short-time statement on a supplied standard sphere; it gives no arbitrary-r global lifetime, convergence, singularity, or unknown-sphere initialization.

## Uniform static family

On any chosen compact I contained in(1,infinity) about r0, all explicit E235 coefficients and their derivatives are bounded, including the factors involving(r-1)^-1 and p(r)^-1. Its normalized quotient has a common positive floor and simple center gaps. The joint scalar log ratio is smooth near I times{x0}, and its spatial Hessian at the center is -|G_r|^2 I. Uniform continuity and a positive minimum of |G_r|^2 give a common strict local maximum ball, with f_L(r,x)<=log r-Gamma|x|^2/4.

The E249 model has a common Gram floor on I times the full parameter rectangle. Its corner simple gaps and positive log-ratio derivatives persist on one closed convex corner for all r. The complement of a relatively open corner neighborhood is compact, and min(r-rho_model)>0 there. The exact actual curvature formula and its first u,v,r derivatives approach the model uniformly as O_I(R). The quotient transfer and corner/complement comparisons therefore use one sufficiently small radius R for all r in I. This supplies exact unique global maximum r at x0 for every member. With R fixed, differences A_r-A_r0 are finite sums of fixed supported smooth sections with smooth scalar coefficient functions. Every finite mixed seminorm is bounded, and the parameter map is smooth in C-infinity. No continuous selection from unspecified individual radii is used.

## Common time and recovery continuity

E252 fixes reference A_r0 and uses the assessed [E28/E29 local construction](E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md). Restricting I makes all initial differences small in the same graph H6 norm. Choose the graph-H6 bootstrap ball inside the common cutoff-one first-jet tube. The uniform differential inequality Y'<=K(1+Y) then gives one positive interval before any exit. Higher even Sobolev estimates use the same C2 bound and uniformly bounded smooth traces, so all orders persist on that interval. Spectral approximation and strong higher-norm convergence pass the common tube bound to the limit and remove the cutoff uniformly.

Subtracting the same adjusted equation gives uniform L2 difference control. Its principal coefficients retain the common Hermitian margin and C1 bounds; first/zeroth-order difference coefficients are bounded by the common C2 solution bound. Interpolation between L2 differences and arbitrarily high uniformly bounded Sobolev norms yields continuity in C([0,T],Ck) for every fixed k. This does not require differentiating in the parameter.

The compact frame-bundle recovery generator has spatial order at most two. Adjusted C3 convergence and C4 bounds give C1 convergence and C2 bounds for its vector fields. In finite nested charts, the trajectory and derivative ODEs plus Gronwall give C1 convergence of maps j_r from the identity on a common shorter interval. The sign j_r'=-xi(Ahat_r) composed with j_r recovers the original native path j_r* Ahat_r. Its curvature is j_r*F_Ahat_r, hence converges uniformly. Quotient smoothness on compact positive values and min–max yield continuity of its spectral ratio.

At boundary parameter r0, the native initial derivative is1/2. Choose one positive time at which the fixed-center ratio exceeds r0. Continuity in r at this fixed time preserves that strict excess for all sufficiently close lower parameters r<r0; their initial global maximum is exactly r. This proves failure for each prescribed strict threshold. All constants may depend on r0 and the chosen compact family. The special near-round global basin remains a separate result.

## Source scope and identities

This uses no newly imported primary theorem. Fine v2 Proposition4.2 and §4.2 provide the inherited gradient/action framework; Taylor's previously checked author-text §7.3 provides the inherited system estimates through E29's branch compact-bundle proof. The common-time and continuity arguments are supplied above and in E252. The Fine-cited Taylor2011 Proposition8.1 remains unverified. [Canonical consumer](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#prescribed-strict-cap-consumers--e251e252).

| Input | SHA-256 |
| --- | --- |
| [251_UNIFORM_PARAMETER_CAP_FAMILY_20261123.md](../notes/251_UNIFORM_PARAMETER_CAP_FAMILY_20261123.md) | 04b4730a801c9eb789142deec7263f5d413b2887a7f728e3e7fbf4a6661956fa |
| [252_CONDITIONAL_PRESCRIBED_STRICT_CAP_FLOW_20261123.md](../notes/252_CONDITIONAL_PRESCRIBED_STRICT_CAP_FLOW_20261123.md) | 877c8b9ad4e4aa37f3907d268055b973b238771ccb20f8a69b2722722beadb1e |
| [SP4-CME-E251_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E251_RETURN_v1.md) | d454c31907fc0fcc9471f2982f793ff6e77be5eb328535fc669df6370cbce47b |
| [SP4-CME-E252_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E252_RETURN_v1.md) | ea02c7cf4a4188f65d7c0cb578bf1103fa8348034897759f64ee34c47b281d44 |
