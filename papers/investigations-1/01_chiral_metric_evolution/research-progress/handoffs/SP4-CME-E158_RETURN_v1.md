# SP4-CME-E158 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime and selected
lead identifiers were unavailable. I audited E145 in E147
and authored inherited E137 and E140. I did not author E155
or E157. This audit treats the E155/E156 extraction as assessed
at its stated scope and independently checks its floor-free
part and E157's new rank argument.
[Request][req] · [Audit][audit] · [E157][e157].

## Disposition

**Pass.** On the stated fixed smooth compact closed connected
simply connected oriented real four-manifold with
\(H^2(M;\mathbb R)=0\), the supplied positive \(C^1\) metric
limit after smooth orientation-preserving normalizations and
uniform \(|T_n|+|\nabla^{A_n}T_n|\) give a continuous positive
compatible subsequential pair limit in the original signed
definite component. No quantitative \(Q_n\) floor is needed.
The manifold and \(SO(3)\) bundle are fixed.

- **Extraction.** \(S_n^{-1}\) is used to define each smooth
  isometry, while the exact cancellation
  \(\sigma'_n=J_n\sigma_b\) removes its derivatives from the
  controlled chiral connection coefficients. The relative
  Sylvester multipliers and native bounds for \(b_n,\nabla^\Gamma b_n\)
  and \(\nabla^A Q_n\) remain bounded without a floor.
  The square root on the bounded semidefinite cone need
  only be continuous for the uniform curvature limit.
  The curvature identity and Bianchi equation pass directly
  in distributions, giving continuous \(da_\infty\) as an
  exterior derivative.
- **Parallel kernel.** The exact strain formula gives
  \(\lvert\langle(\nabla_Y^A Q)v,v\rangle\rvert
  \le4|Y||T|\langle Qv,v\rangle\). Two-sided Gronwall
  and fixed-curve transport convergence yield the kernel
  isomorphism along each curve on the same uniform
  subsequence. Rank is constant. Coordinate-line transport
  gives \(\partial_i\Pi=-[\mathcal A_i,\Pi]\) for the kernel
  projection, so \(\Pi\) is \(C^1\). Mollifying the continuous
  \(\mathcal A\) with continuous exterior derivative proves
  the alternating product rule. Jacobi then gives
  \([\operatorname{ad}(F_{\infty,ij}),\Pi]=0\) pointwise.
- **Rank exclusions.** Trace three excludes rank zero. At
  rank two the \(SO(3)\) stabilizer of the kernel line forces
  each curvature value into that line, but the internal
  curvature image equals its perpendicular plane. At
  rank one the parallel image line has a global \(C^1\)
  unit section by simple connectivity, and metricity gives
  \(D^{A_\infty}v=0\). Trace three yields the \(C^1\)
  self-dual scalar curvature form
  \(\omega=-\sqrt3\,\sigma_\infty(v)\), closed by the direct
  Bianchi limit. Flow averaging preserves closedness and
  yields smooth uniformly convergent approximants, by
  submersion coordinates and integration over the remaining
  parameters. Degree-two real cohomology and smooth Stokes
  force \(\int\omega^2=0\), whereas
  \(\omega^2=3\,dV_{g_\infty}\).
- **Final category.** Rank three and compactness give a
  positive limiting floor. The map \(-S_\infty\) in the
  chiral labels gives the original sign and the entire
  positive self-dual plane. Trace wedge density gives the
  supplied metric. For actual late slices of one supplied
  smooth native original flow, the normalized compatible
  positive pair limit satisfies the assessed E148
  continuation criterion.

The proof uses no ordinary derivatives of all the limiting
connection coefficients, no smoothness of the limiting
connection, and no metric compactness theorem. The metric
and strain bounds remain supplied. E157's historical
conditional wording was left untouched. No new primary
source inspection or numerical computation was needed.
Only the two assigned E158 files were written.

## Frozen identities

All seven frozen inputs matched, as did the request.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E158_REQUEST_v1.md | `c0b8a03a224f50f2802e4756d211e1767cd40587ef62a72343d14f5a48cef63b` |
| 157_SEMIDEFINITE_LIMIT_RANK_TEST_20261122.md | `50e48a665f370b3c24b642f3e172e32f53ffbdc0775e3ae198dedb19fbabdde9` |
| 155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md | `e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6` |
| E155_E156_STATIC_PAIR_COMPACTNESS_ASSESSMENT_20261122.md | `3fae61f8eb3c3dd391dd98595ceeddf0cac173296a3ce53867830f538d4bbc70` |
| B79_SEMIDEFINITE_LIMIT_ON_HOMOTOPY_SPHERE_20261122.md | `1c0e07dc6e4d986c34c541196d9a0ef1abba97f377292a6989b355d23252a23c` |
| 145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md | `544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4` |
| 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md | `6c9480a6dfaedbff17156541faa9c350e61bcf7925d5ae4cec88e8a7d93d4557` |
| E158_SEMIDEFINITE_LIMIT_AUDIT_20261122.md | `1b2a44fb858cfcda7920fbd50e013da50fdbf0f2ebef86b5b5d44b44dd8b02c1` |

[req]: SP4-CME-E158_REQUEST_v1.md
[audit]: ../../reviews/E158_SEMIDEFINITE_LIMIT_AUDIT_20261122.md
[e157]: ../../notes/157_SEMIDEFINITE_LIMIT_RANK_TEST_20261122.md
