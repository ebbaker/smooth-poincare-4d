# SP4-CME-E92 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored inherited E14,
and previously audited E84 and E88 in E86 and E89. Earlier related
derivations include E63, E66, E74 and E76. I did not author either
audited note. See the [request][req] and [audit][review].

## E90 check — Endpoint geometry

Pass under the assessed \(\mathcal W\) and
\(\ell\le\ell_*\) hypotheses. E14 and the original smooth limit
give the endpoint comparisons in the same fixed identification
with \(D=4512\sqrt2\,C_{\rm budget}\ell\).
The pullback limit satisfies \(Q=I\), and the original pointwise
volume law gives \(dV_g=dV_h\). The native \(c=2K\) metric and
time conversion preserves the strain norm and budget, and
gives limiting round sectional curvature \(1/2\) in the
native scale and \(K\) in the normalized scale.

The distance and diameter factors are \(e^{\pm D/2}\).
The common-volume scalar Rayleigh quotients give eigenvalue
factors \(e^{\pm D}\) at each index, with multiplicity.
Eigenvalues scale by \(c^{-1}\).
The inhomogeneous Sobolev coefficients at a fixed scale
are \(e^D C_\nabla,C_2\), with the native \(C_2\) divided
by \(c\) and \(C_\nabla\) unchanged under normalization.
Zero strain gives a stationary round pullback. There is
no general positive-strain curvature, injectivity, or
higher-coordinate estimate from this comparison.

## E91 check — Frozen periodic model

Pass for the period-\(2\pi\) torus with the stated frozen
\(d\) and prescribed self-dual forms. The shear has
determinant one and pulls the triple back exactly.
The exact mean-zero split has
\(\phi_\theta=-\theta f_nq_1/\sqrt2\),
\(u_\theta=e_1-\theta f_n'e_2\) and zero residual,
and the weak mean-zero inverse uniquely selects it.

For the dyadic sequence the pair lies in one Fourier
block, with norm of order \(n^{-1/4}\), while
\(\|Du_1\|_\infty=n^{1/4}\). The forcing one-form is
fixed, and the values and low-order Lorentz norms have
the stated small or bounded behavior. This rules out
the uniform horizontal \(C^1\) estimate only for the
specified frozen solver. The explicit shear map itself
is \(C^1\)-small. No inference was made about failure
of a finite flow, finite placement, or a different
solver. The nonzero prescribed curvature and \(d^2=0\)
are incompatible with the actual adjoint curvature
identity, so the model is separate from a curved
\(\mathrm{SO}(3)\) connection counterexample.

## Source and version record

No corrections were found in either bounded result.
No new primary source was inspected or imported.
The live TeX had one later E88/E89 insertion. Removing
that exact fragment in memory recovered the historical
E90 TeX digest and verified the consumed version.
No snapshot, manuscript change, or shared artifact edit
was made. Only the named review and return were edited.

| File or input | SHA-256 |
| --- | --- |
| SP4-CME-E92_REQUEST_v1.md | `546f4c26c33ae25fd30c67ae0801f6be086406713dd4ea5262d54c3940edac74` |
| SP4-CME-E90_REQUEST_v1.md | `e58e895d0ef9dc2b465876f31b36fc5f1d8f028cf259bdaacedbb3e854568f04` |
| SP4-CME-E91_REQUEST_v1.md | `677de452d57050af58cc3dc14c44aa9fc10f71d7b674e0f4c9f20d962ff51636` |
| 90_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md | `6d67f6bc601df3dc0940ee8815be30f26c83c2849f6153913deb61569ef69395` |
| 91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md | `d566e2d9594c1ab42af2523ebd74c25b403e58fa4146a3f9e761a964a082a7f0` |
| B52_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md | `58fdea26948421c2137a7e1d3268e1d85c48ee0e920fe34152563ad2ea60e27b` |
| B53_HORIZONTAL_SOLVER_DERIVATIVE_TEST_20261122.md | `47539a7f11b3b10a2e37e218994c4495e431fd19d1d7e4233bba9fe464bbad8f` |
| 16_TEMPORAL_STRAIN_CRITERION_20261122.md | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| 04C_VOLUME_AND_JETS_20261122.md | `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838` |
| 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md | `fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9` |
| E84_E86_INTRINSIC_ORBIT_ASSESSMENT_20261122.md | `1c8976f6678234480e163a5ddce106e916880426e7ec71b8afee03e019864f27` |
| Historical chiral_curvature_and_metric_evolution.tex, verified in memory | `02ae44f97f59670272c326d5d3675482228b9799e89beafc6258e5454f709901` |
| Live TeX at audit | `abe7b70355bec456ece001e8a38ac3bbb1d0e94b79abaf6ed8d5aaa2d0f1d8ba` |
| E88/E89 insertion fragment | `01c39f3de911858e7be42a9f04124f1063ec073036c23ba8c1c07fd823d99e65` |
| 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| 53_CRITICAL_FINITE_P_HEAT_20261122.md | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |
| 88_LORENTZ_ORBIT_SOLVER_20261122.md | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| E92_GEOMETRY_AND_FROZEN_MODEL_AUDIT_20261122.md | `3093463d094a65495b6e40abce8ccb09fd6144c0b2455c7fef90bd53d86d82c4` |

[req]: SP4-CME-E92_REQUEST_v1.md
[review]: ../../reviews/E92_GEOMETRY_AND_FROZEN_MODEL_AUDIT_20261122.md
