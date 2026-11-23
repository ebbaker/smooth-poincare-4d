# SP4-CME-E156 return v1 — Static pair compactness audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, helper launch configured
gpt-6.2-sol/ultra. Independent runtime attestation and selected
lead settings were unavailable. I authored E09, audited E137
in E139 and its integration in E141, and audited E148 in E150.
I did not author E155. [Request][req] · [Audit][audit].

## Disposition

Pass with the exact supplied positive \(C^1\) metric limit.
The native curvature isometry is \(-F_n^\sharp S_n^{-1}\)
with the specified round-compatible orientation. The positive
inverse square root \(C_n=(g_b^{-1}g'_n)^{-1/2}\) maps
tangent vectors from the \(g_b\) metric to \(g'_n\).
Its forward two-form map is \(J_n=(C_n^{-1})^*\).
The isometry \(U_n=\widetilde\sigma_n^{-1}J_n\sigma_b\)
maps \(E_x\) to \(E_{\varphi_n(x)}\) and defines the smooth
equivariant lift \(H_n\) on the original principal bundle
through the adjoint frame representation.

The exact identity \(\widetilde\sigma_nU_n=J_n\sigma_b\)
conjugates the pulled-back chiral derivative to
\((J_n\sigma_b)^{-1}D^{+,g'_n}(J_n\sigma_b)\).
This proves uniform convergence of the chiral coefficients
from the first normalized metric derivatives. No derivatives of
the original normalizations need to be bounded separately.
The native mismatch factors \(2\sqrt6\) and
\(\sqrt2(6,36+8\sqrt3)\) and the inverse strain estimate
\(|\nabla^AQ|\le6|T|\) give the stated coordinate
equicontinuity with all covector slots included.
The finite chart subsequence yields a uniform affine
connection and curvature pair. Its determinant sign,
positive \(Q\) bound, native wedge volume and distributional
compatibility all pass to the limit. Its reconstructed metric
is \(g_\infty\).

The whole-fiber distortion and spatial \(\Psi\) comparisons
give exactly the stated alternative supplied bounds. On
actual late slices the resulting pair sequence meets the
assessed E148 criterion on the same manifold and bundle.
No \(C^{1,\alpha}\) requirement, coordinate gauge estimate,
metric second derivative control, \(W^-\) estimate,
metric compactness theorem or a priori flow bound enters.
All six frozen inputs matched. No source inspection, build,
numerical test or shared edit occurred.

| Input or output | SHA-256 |
| --- | --- |
| [E156 request][req] | 260ae94a0b9cab3e3e5a6c49382a14a90899162c6fac9bc748537583e99ea1ca |
| [E155][e155] | e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6 |
| [E156 audit][audit] | eb1a352516cf70ebb0ff0fdc9bce7efe72808c67af189944fde83b20326a6e33 |

[req]: SP4-CME-E156_REQUEST_v1.md
[e155]: ../../notes/155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md
[audit]: ../../reviews/E156_STATIC_PAIR_COMPACTNESS_AUDIT_20261122.md
