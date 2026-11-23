# SP4-CME-E41 request v1 — one compact-bundle linear estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized helper configuration gpt-6.2-sol / ultra; lead actual settings unavailable. No shared-file edits. Smooth compact closed real four-manifold, fixed smooth vector bundle and metric connection D, fixed positive density/metric and fiber pairing. All constants may depend on fixed smooth coefficients, atlas and finitely many required derivatives; do not assert uniformity from value bounds alone.

Use n=4 and fixed p>6 (p=8 allowed). For T small and r<=sqrt(T) below a fixed injectivity/chart scale, set X_T norm to sup|u| plus sup_{x,r} r (r^{-6} integral_{r²/2}^{r²} integral_{B_r(x)} |Du|^p)^{1/p} plus sup_{x,r}(r^{-4} integral_0^{r²} integral_{B_r(x)}|Du|²)^{1/2}. Define Y0_T norm of f by sup r²(r^{-6} integral_{r²/2}^{r²} integral_B |f|^{p/2})^{2/p} plus sup r^{-4} integral_0^{r²} integral_B |f|. Define Y1_T norm of a bundle-valued covector G by the two gradient seminorm expressions with G in place of Du. Fixed metric balls and volume. These are dimensionally scaled KL-type norms; inspect the primary PDF before asserting literal equality with its printed notation. Source: arXiv:1310.3658v1, Theorem1.1 and §§2–4, exact source status in E37/canonical records.

Own only notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md and research-progress/handoffs/SP4-CME-E41_RETURN_v1.md.

Let L=D_i(P0^{ij}(x)D_j), using the fixed covariant divergence and fixed volume. P0 smooth, bounded, not necessarily symmetric, and Re<P0(x,xi)v,v>>=c|xi|²|v|² uniformly in the fixed pairing. Prove, or give the precise missing primary input for, the estimates ||e^{tL}u0||X_T <= C||u0||infinity and ||integral_0^t e^{(t-s)L}(f+div_D G)(s) ds||X_T <= C(||f||Y0_T+||G||Y1_T), uniformly 0<T<=T0. Include strong C0 initial trace for continuous u0 and continuous dependence; forcing claims may start smooth and extend by the appropriate completion/distributional interpretation. Retain possible harmless fixed lower-order/short-time factors.

Finite scope one fixed linear operator and its estimates. Need a global compact-bundle Cauchy operator, not independent chart solutions pasted by fiat. Account for smooth transitions, Gårding rather than full gradient-array positivity, Gaussian and differentiated kernel bounds, the energy and local parabolic Calderon–Zygmund input required for the X estimates, and bounded chart/cutoff errors. You may prove a local parametrix/perturbative assembly, or import a precisely verified primary theorem with exact hypotheses. Do not label unproved Gaussian/CZ assertions 'standard' as a substitute for the required input. If a technical step remains, isolate it and return conditional estimates. No nonlinear flow, rough compatibility, or gauge recovery theorem in this packet. Inspect source statements at dependence and report bibliographic metadata/inspection details for root integration; do not create duplicate canonical reference records.

## Frozen inputs

- `brainstorm/notes/B33_COMPACT_ROUGH_SYSTEM_20261122.md` SHA-256 `fd2f7557e141a15479daecbdd331ddec0207ca5be035bfa8180db24b6d9cb734`
- `notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md` SHA-256 `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a`
- `notes/37_ROUGH_DATA_SOURCE_TEST_20261122.md` SHA-256 `de2c9c2887a6df86d32c0c40f8ae2ce8da6bfc16a7c2a0158a2c3a8862ed424d`
- `notes/38_CONTINUOUS_COMPATIBLE_DATA_20261122.md` SHA-256 `cbc7dc854602fe2271503663900e35d2ad874116ccb1871ec4bbccdb802e73c7`
