# B108 — Quantify the distance from the sharp spectral boundary

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Conceptual B decision by the selected lead; actual model and effort unavailable, unchanged. Bounded ensuing E work is assigned to configured gpt-6.2-sol/ultra. [Sole register](../../research-progress/REGISTER.md).

## Decision and reason

The assessed sharp certificate has exactly one zero determinant Bernstein coefficient, at the sole endpoint corner. Its positive coefficient support may quantify the loss of stationary coercivity without another spectral search. E227 separately predicts a linear upper bound on the kernel coercivity, but is not needed for the lower estimate and remains under E228 audit. Test the following fixed route; no result is presumed here.

Let alpha=sqrt(7/2), h=alpha-1, v=1+ha, u=1+hab. The assessed determinant P3=det M has natural bidegree (37,23), with only coefficient (37,0) zero and every other coefficient positive. Obtain one explicit positive rational delta0 bounded above by all 911 positive coefficients. Then the Bernstein partition gives P3 >= delta0[1-a^37(1-b)^23] >= delta0(1-a). For epsilon=7/2-r and v<=sqrt(r), 1-a >= epsilon/[2 alpha(alpha-1)] > epsilon/4. This is a proposed quantitative consequence of the existing certificate, not a new positivity search.

On the whole closed region, L=12(uv)^3(1+u)(1+v)(u+v)<=27648, lambda>=3/8. The existing edge-to-jet map should give |X|^2<=11|Z|^2: the diagonal terms cost at most nine per edge and the off-diagonal terms two, followed by the orthogonal trace projection. The accepted full-form bound |R|<=120|X|^2 would then imply lambda_max(G)<=880. From det G=P3/(8L^3), the smallest eigenvalue is at least det G/880^2. Consequently the candidate effective constant is

    k = 3 delta0 / (704 * 27648^3 * 880^2),
    kappa(r) >= k (7/2-r),  1<=r<7/2.

All factors and norm directions require E verification. The E227 upper bound, if independently accepted, would then identify the order of degeneration of kappa, without an optimal leading constant.

## Conditional analytical use

If that lower estimate passes, substitute k epsilon for kernel coercivity in the already assessed E220 completion-of-squares argument with L0=120. Write H=1205/2+57600/k+25k/4. The proposed native static consequence is D >= [24/(5H)] epsilon E + [k/H] epsilon^2 G. For a supplied smooth original flow let w(t)=(7/2-sup_M rho(Q(t)))_+ and Theta(t)=integral_0^t w. The proposed integrating-factor bound uses w and w^2, with no fixed interior cutoff. Separate E work must check normalization, continuity and the inherited bounded geometric late-sequence entry criterion. It would still impose spectral/time and geometric hypotheses on a supplied flow, and would neither preserve pinching nor construct initial data.

## Finite scope and escalation

E229 recomputes the finite existing determinant coefficient array, obtains a rational lower coefficient bound and checks the explicit coercivity estimate. It does not optimize constants, subdivide the certificate, search further spectra or prove a global flow result. Independent E230 follows. If a proposed inequality fails, return its exact obstruction to this B decision. Any changed mechanism must be recorded before execution. E227/E228 remain independent and are not prerequisites.

Inputs: [sharp assessment](../../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md), [applications assessment](../../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md), [corrected generator](../../numerics/e218_stationary_spectral_range_v2.py), and [independent verifier](../../numerics/e219_sharp_stationary_verify.py). No new external theorem is imported; the canonical source workflow is unchanged.
