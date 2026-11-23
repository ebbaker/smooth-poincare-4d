# E72 fixed-slice manuscript integration audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
The helper wrote E70 and also contributed earlier inputs E47, E57, E60 and
E67. This review checks the lead's integration against the assessed results.
The earlier E70 proof check is the recorded independent audit of E66.
[Frozen request][req] · [E66 derivation][e66] · [E70 audit][e70].

**Disposition.** The frozen manuscript's full fixed-slice subsection and
its conditional whole-time bound pass. All four E69 items named in the
request are present. The proof uses the two imposed fixed slice equations,
small reference values of the connection and curvature differences, and
small live Lorentz strain for the whole-time conclusion. The checks below
use the frozen line numbers.

## Fixed inverse and Lorentz interpolation

**3808–3855, `eq:fixed-lorentz-inverse` and `lem:round-positive`.**
The earlier lemma gives the spectral gap and a domain-\(H^2\) self-adjoint
realization on the fixed round bundle. Its proof includes the higher
elliptic estimates for smooth forcing. The frozen matrix has a positive
principal symbol, so the multiplier \(-\xi_i\xi_jA_*(\xi)^{-1}\) is smooth
on the unit sphere and homogeneous of degree zero. A matrix norm bounds
all entries. Annular summation gives \(|K(x)|\le C|x|^{-4}\) and
\(|DK(x)|\le C|x|^{-5}\). For each vector bad part the mean-zero condition
allows subtraction at the cube center \(x_Q\). Integrating the kernel
difference outside an enlarged cube gives
\(C\ell(Q)\int_{c\ell(Q)}^\infty r^{-2}dr\le C'\). Together with the strong
\(L^2\) good-part estimate, this proves weak \((1,1)\) for the multiplier
and adjoint. The off-support calculation allows a distributional term
supported at zero. Splitting at \(\lambda\) gives, up to constants, the
two distribution costs
\(\lambda^{-1}\int_{|f|>\lambda}|f|\) and
\(\lambda^{-2}\int_{|f|\le\lambda}|f|^2\). Integrating against
\(p\lambda^{p-1}d\lambda\) yields \(L^p\) for \(1<p<2\). Adjoint \(p=8/7\)
gives \(L^8\) by duality. These are the endpoint estimates used in E66.
[E66 derivation][e66] · [E70 audit][e70].

The leading variation is absorbed on a single cutoff piece. Fixed
first-order terms, including partition commutators, are absorbed by
mollification with the lower \(L^8\) value norm retained. The localized
Bessel multiplier has annular kernel norm
\(2^{-2l}2^{4l(1-5/8)}=2^{-l/2}\) in \(L^{8/5}\), the exponent for Young
from \(L^2\) to \(L^8\). Finite volume and the \(H^2\) inverse give
\(\|G_0^{-1}f\|_8\le C\|f\|_2\le CV^{3/8}\|f\|_8\). Smooth
approximation in both \(L^8\) and \(L^2\) gives the common endpoint action
for \(G_0^{-1}\) and its weak derivatives.

**3857–3875, `eq:fixed-lorentz-inverse`.**
With \(A_p=\|h\|_p\), the rearrangement bounds switch at
\(s_*=(A_2/A_8)^{8/3}\). Integrating the smaller bound gives
\(8A_8s_*^{1/8}+4A_2s_*^{-1/4}=12A_2^{1/3}A_8^{2/3}\), where the upper
integral can be extended to infinity. The vector layer
\(f_v=(f/|f|)1_{|f|>v}\) contributes
\(12b_{j,2}^{1/3}b_{j,8}^{2/3}\mu_f(v)^{1/4}\) for
\(B_j=D_0^jG_0^{-1}\). Using
\(\|f\|_{4,1}=4\int_0^\infty\mu_f(v)^{1/4}dv\) yields
\(C_G=3\sum_{j=0}^2 b_{j,2}^{1/3}b_{j,8}^{2/3}\), as in E66.
The layers are strongly measurable by endpoint norm
continuity away from the countably many positive-measure levels and the
interpolated estimate on layer differences. The same input integral
converges in \(L^2\) since
\(\mu_f(v)^{1/2}\le V^{1/4}\mu_f(v)^{1/4}\). For the output norm,
\[
 \|h\|_{4,1}
 =V^{-3/4}J_h(V)+\tfrac34\int_0^V r^{-7/4}J_h(r)\,dr,
 \qquad J_h(r)=\sup_{|E|=r}\int_E|h| .
\]
This gives the triangle inequality and continuous inclusion in \(L^1\).
The \(L^1\) limit and Fatou give completeness. The Lorentz Bochner integral
and the \(L^2\) inverse agree in \(L^1\), justifying the common derivative
output in the compressed proof. [E66 derivation][e66] · [E70 audit][e70].

## Native expansion and critical pair norm

**3781–3804, 3877–3920, `prop:fixed-slice-strain`.**
The earlier native convention makes \(F_0\) a parallel isometry into
\(\Lambda^+\). Self-duality and the native unit two-form norms give the
mixed wedge \(2L_0\beta\) and \(\mu=(1+\sigma)\mu_0\). Thus the
trace-free quotient is \(q=2M\beta+R\) with the stated sign of
\(-2\sigma M\beta\). The coefficients of \(M\) and the reference volume
are parallel. The quadratic numerator and bounded inverse denominator
give \(D_0R=O(|\beta||D_0\beta|)\). Both slice conditions appear in the
hypotheses. They annul \(S_0\Delta_0S_0^*a\) and \(d_0d_0^*a\);
\(P_0=\sqrt8M\) then gives
\[
 G_0a=8d_0^*M^*Md_0a
      =4d_0^*M^*(q-R-2MB(a)),\qquad B(a)=[a\wedge a]/2 .
\]
This uses the actual curvature constraint of the supplied connection.

The reference derivative on \(q\) differs from \(\nabla^AQ\) by
\(-[\operatorname{ad}(a),q]\). Here \(q\) is a zero-form, so the
Levi–Civita connection on base slots enters only after an additional
derivative. The strain identity at `transport:inverse-bounds`
gives the Frobenius bound \(|\nabla^AQ|\le6|T|\) by the weighted-variance
argument, summed over a live orthonormal base frame. Smooth
positive-plane and volume reconstruction allow separate comparisons
\(\tfrac12g_0\le g_A^{\rm F}\le\tfrac32g_0\) and
\(\tfrac12dV_0\le dV_A\le\tfrac32dV_0\) in a smaller fixed tube. Thus the
reference one-form norm is at most \(\sqrt{3/2}\) times the live norm and
the reference measure of any level set is at most twice the live
measure. The layer formula yields
\(\|W\|_{4,1;0}\le2^{1/4}\sqrt{3/2}\|W\|_{4,1;A}\).
The manuscript leaves these factors inside \(C_{\rm str}\), which
suffices for the estimate it states.

The commutator error costs \(C\rho|a|\), the derivative of \(B(a)\) costs
\(C\rho|D_0a|\), and \(D_0R\) costs
\(C\rho(|D_0^2a|+\rho|D_0a|)\). The bound for \(D_0\beta\) uses the
parallel alternation in \(d_0\) and ordered reference derivatives.
These are value smallness estimates. They use no smallness of
\(\|D_0a\|_\infty\), \(\|D_0\beta\|_\infty\) or the highest derivative
norm. Shrinking the value radius inside the definite tube to
\(C_GC_{\rm err}\rho\le1/2\) proves the asserted \(W^{2,(4,1)}\) bound.

**3922–3933, `eq:critical-lorentz-embedding`.**
The earlier high-block proof uses an inverse derivative acting on
arbitrary tensors. Equivalently, for a layer of measure \(m>0\) the
weighted block bound is \(C\min(2^jm^{1/2},2^{-j/2}m^{1/8})\).
The two branches switch at \(2^j=m^{-1/4}\) and their geometric sums are
bounded by \(Cm^{1/4}\). Each low-block Fourier coefficient is bounded by
\(\|v\|_1\). This strengthens the earlier \(L^8\) low term in exactly the
way required here. The supported partition pieces extend by zero and
differentiating them in fixed frames gives only \(D_0U\) and bounded
coefficients times \(U\). Measure and amplitude comparisons give the
local Lorentz inequalities, and finite volume yields
\(\|v\|_1\le V^{3/4}\|v\|_{4,1}\). The curvature identity and its first
reference derivative control \(U=(a,\beta)\) and \(D_0U\) by the
\(W^{2,(4,1)}\) norm of \(a\) under the value hypothesis. No
differentiation of the moving metric is introduced by this static
comparison. [E66 derivation][e66] · [E70 audit][e70].

## Final budget and slice scope

**3649–3759, 3936–3944, `thm:critical-global-budget`.**
The critical theorem takes the smooth compatible pair on the same fixed
round bundle and supplies \(J(\infty)\le C_{\rm crit}\delta\), where
\(\delta=\|(a,\beta)\|_{\mathcal B^{1/2}}\). The slice theorem gives
\(\delta\le C_{\rm sl}\|T(A_{\rm in})\|_{4,1;g_{A_{\rm in}}^{\rm F}}\).
Taking the latter norm at most \(\epsilon_{\rm crit}/C_{\rm sl}\), while
retaining both slice equations and the joint value bound, gives the
stated conclusion with \(C_{\rm crit}C_{\rm sl}\). The entire flow is
treated by the critical theorem after this initial comparison.

The earlier whole-time proof obtains \(C(\delta+\delta^2)\) on the
initial smooth compatible interval from \(H+MH\), followed by
\(C(e^{-\alpha u}\delta+e^{-2\alpha u}\delta^2)\) on the stable tail.
Its spare right overlap gives the original-flow splice. At each time,
naturality under the recovery automorphisms preserves the spatial
suprema of the strain and its spatial covariant derivative. The native
internal metric is a constant rescaling of the earlier one and gives
the same endomorphism norm and strain tensors. With
\(g_A^{\rm F}=2K\widehat g_A\), the squared norm of the one-form strain
and the norm of its two-slot derivative both acquire \((2K)^{-1}\).
The relation \(\tau=2Kt\) therefore gives precisely the normalized
\(J\) in the theorem. The static datum uses the native live Lorentz
norm as stated.

The slice is imposed on the smooth initial connection in the reference
identification. There is no assumption that the original flow
preserves the slice and no slice existence statement for other data.
The estimate retains the fixed round and joint value hypotheses.
[E67 audit][e67] · [E70 audit][e70].

## E69 precision fixes

| Requested check | Frozen evidence |
| --- | --- |
| Linear input and source spaces | 3312–3323 states \(U_{\rm in}\in\mathcal B^s\) and \(f\in L^1(0,\tau_c;\mathcal B^s)\), with uniqueness in the stated path class and strong traces. |
| Uniformity under refinement | 3406–3444 chooses centers in fixed precompact master coordinates without rescaling and uses uniform frozen Hermitian bounds. The leading small variation is absorbed on the same piece before atlas comparison. Refinement-dependent lower terms are handled after fixing the atlas by reducing time. |
| Fixed-reference smooth lift and short rough norm | 3541–3559 invokes the earlier individual jet cutoff with fixed \(A_0\) and specifies the compatible lift. A uniform smooth \(W^{4,8}\) bound dominates the critical high blocks and gives the shrinking critical trace norm. The rough gradient seminorm has the explicit \(C\sqrt\ell\sup|D_0Z|\) cost. The strict initial value margin permits the same lift in both uniqueness balls for an individual positive interval. |
| Whole-tail value tube | 3720–3735 bounds the curvature pair in \(C^2\) by the stable \(H^m\) estimate with \(m\ge6\), using the exact curvature identity. The threshold reduction explicitly keeps the entire tail pair in the fixed tube used for the strain dictionary. |

On a positive slab starting inside the initial agreement interval, the
averaged coefficient at 3563–3592 differs from the fixed Gårding form
by a small operator norm. The gradient and Hessian time norms make the
coefficient \(k\) integrable before identification. This legitimates
Gronwall from the positive starting time and the use of the same
comparator throughout the common interval. [E69 review][e69].

## References and editorial checks

All 19 distinct internal reference targets in the two audited
subsections have exactly one definition in the frozen source. Relevant
targets point to the fixed positive inverse, native stability operator,
real transport identity, critical embedding, and critical original-flow
budget as expected. The four fixes and all proof dependencies needed
for the stated local and conditional results are present. No new
primary dependence arose. The established primary-source status carries
through this integration. No primary source was newly inspected, and
no manuscript or shared artifact was modified or rebuilt.

For publication clarity, at 3809 identify the \(W^{2,(4,1)}\) shorthand
with the sum in the proposition, and at 3904 cite the equation
`transport:inverse-bounds` directly. At 3908–3911 record the separate
volume and one-form comparisons in one sentence. At 3869–3874 one
sentence about the strong measurability of the vector layers would make
the compressed Bochner passage explicit. The optional E69 notation
cleanup at 3412 and 3438 remains apt because \(\delta_0\) also denotes a
fixed adjoint. These edits clarify steps already justified by the stated
hypotheses.

## Input versions

| Frozen or supporting artifact | SHA-256 |
| --- | --- |
| [E72 request][req] | `a5c60d28c04f22b4757214341faf7470cab393114373caedfeb85fec2e96e844` |
| [Frozen manuscript][ms] | `6eecda61e6da4435bd27bb73c9f022bdc5de6971943975d1f6e04f8183ef7eae` |
| [E66 derivation][e66] | `09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66` |
| [E70 audit][e70] | `d9d1ace690255fa6af7c7a37e5852e991538e24988e003636929573cb768272c` |
| [E69 review][e69] | `a3921c85ea86693dfd8d7df81cdcf7ae9cce3244a4637bc3b3c6719cb321fb71` |
| [E69 return][e69r] | `b45e5db88d11c7c1114146ae06126800f6ffa5a1481efadaa53c9349fcb2712d` |
| [E67 audit][e67] | `abfb4370645ac042a039629dd4725bf67a0bb81897f52cf4ac49fdbe26c0c0c8` |

[req]: ../research-progress/handoffs/SP4-CME-E72_REQUEST_v1.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e66]: ../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e70]: E70_FIXED_SLICE_AUDIT_20261122.md
[e69]: E69_CRITICAL_MANUSCRIPT_AUDIT_20261122.md
[e69r]: ../research-progress/handoffs/SP4-CME-E69_RETURN_v1.md
[e67]: E67_GLOBAL_BUDGET_AUDIT_20261122.md
