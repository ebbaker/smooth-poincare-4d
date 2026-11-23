# SP4-CME-E121 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E42. This follow-up checks primary source passages for B63 and the frozen E119 request. It does not assess the E119 proof. [Request][req], [audit][audit], [B63][b63], [E119 request][req119].

## Access and exact source passages

Herbert Koch and Tobias Lamm, *Parabolic equations with rough data*, arXiv:1310.3658v1 [math.AP], submitted 14 October 2013. On 22 November 2026, America/New_York, I read the indexed versioned PDF text and same-version arXiv HTML and checked the submission metadata. The PDF page-image attempts for pp. 2–3 returned cache misses. Selected passages inspected were (1.1) and Theorem 1.1, preprint pp. 2–3, §2 (2.1)–(2.3) p. 3 and norm and estimate discussions pp. 4–5, §3 pp. 6–7, and §§4.1–4.2 including (4.1)–(4.2), pp. 7–8. The corresponding arXiv HTML passages are lines 60–106, 108–126 and 165–220, 221–265, and 267–315. [Version record][arxiv], [versioned PDF][pdf], [HTML][html].

The official journal record confirms *Mathematica Bohemica* 140(4) (2015), 457–477, DOI 10.21136/MB.2015.144463. One new attempt using the official record's direct PDF link returned a fetch timeout reported as status 400. The earlier E37 official timeout and unavailable mirror remain as recorded. Final published text and cross-version theorem comparison remain unavailable. No local reading copy was retained. [Official journal record][dml], [attempted PDF][dmlpdf], [canonical R20][r20].

## Findings and scope

- Theorem 1.1 is scalar on \(\mathbb R^d\), with uniformly bounded and elliptic divergence coefficients, small local coefficient oscillation at fixed value, Lipschitz value dependence, scaled quadratic-gradient forcing bounds, derivative bounds through a fixed regularity order and small initial oscillation at radius \(\sqrt T\). The positive-order weighted spatial estimates use \(t^{|\alpha|/2}\). Spatial analyticity is stated with analytic coefficients, and all-variable analyticity gives the mixed factorial bound with iterated \(t\partial_t\). Absolute zeroth-order smallness cannot follow from small local oscillation, as arbitrary constant heat solutions exhibit. §3 restricts weak uniqueness to the small weighted-gradient class. [Theorem 1.1 and §3][pdf].
- Section 2 gives abstract smooth or analytic parameter dependence when the fixed-point maps have that regularity and the contraction derivative is invertible. Section 3 uses a translated and time-rescaled Euclidean scalar model to read spatial and time derivatives from parameters. The displayed transformed model in v1 is inconsistent with its defining \(u(st,x+ta)\). Direct differentiation gives \(v_t-s\Delta v-a\cdot\nabla v=s\Gamma(v)|\nabla v|^2\). This confirms method attribution with a separately derived branch conjugation. Section 2 also confirms E41's recorded mismatch between the printed upper \(Y^0\) scaling and the branch's exact source norm. [§§2–3][pdf], [E41][e41].
- Sections 4.1–4.2 supply uniform-chart localization and conditional system applicability given Gaussian and Calderón–Zygmund inputs. Rank-one positivity for the uniformly continuous coefficient route and integral coercivity for the stated BMO route are distinct, with the E37 Fourier-generator sign qualification preserved. The inspected passages contain no stated quantitative second datum derivative bound in weighted spatial norms. B63/E119 must prove the uniform time-band lift, transformed source, mixed implicit derivative and weighted Taylor estimates in the assessed compact-bundle completions. [§§4.1–4.2][pdf], [E119 request][req119].

## Canonical update proposal

Append a selected-passage reinspection under R20, keeping `KochLamm2015` and the existing v1 metadata, historical publication-access limitations and E37/E41 uses. Add B63/E119 as a parameter-method consumer, with the direct proof responsible for uniform parabolic weights and the quadratic datum remainder. Record the repeat official PDF timeout and the preprint §3 display qualification. The exact locator and version details are above. Only the E121 audit and return were written.

## File identities

| File | SHA-256 |
| --- | --- |
| SP4-CME-E121_REQUEST_v1.md | `84d4e1e438dbe51f63b3719059a9698781969368dbbee5ab49f665623e711315` |
| SP4-CME-E119_REQUEST_v1.md | `fce7d9d0dc3804e137342e7e1197412108bcb89759e865397f7dadaaf373f062` |
| B63_PARABOLIC_SCALE_NONLINEAR_REMAINDER_20261122.md | `ab7254b83dd4c099b5953d530025e85f6325df5f664320e88eaf2d1860106a6f` |
| 37_ROUGH_DATA_SOURCE_TEST_20261122.md | `de2c9c2887a6df86d32c0c40f8ae2ce8da6bfc16a7c2a0158a2c3a8862ed424d` |
| 41_COMPACT_LINEAR_ESTIMATES_20261122.md | `8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3` |
| 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| 63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md | `427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb` |
| E121_ROUGH_DERIVATIVE_SOURCE_AUDIT_20261122.md | `2f628e07e312b1d902636d666729197f6666bf352d3de5e3505e99e52ce821e4` |

[req]: SP4-CME-E121_REQUEST_v1.md
[audit]: ../../reviews/E121_ROUGH_DERIVATIVE_SOURCE_AUDIT_20261122.md
[req119]: SP4-CME-E119_REQUEST_v1.md
[b63]: ../../brainstorm/notes/B63_PARABOLIC_SCALE_NONLINEAR_REMAINDER_20261122.md
[e41]: ../../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[r20]: ../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#rough-data-source--inspected-preprint-and-publication-metadata
[arxiv]: https://arxiv.org/abs/1310.3658v1
[pdf]: https://arxiv.org/pdf/1310.3658v1
[html]: https://arxiv.org/html/1310.3658v1
[dml]: https://dml.cz/handle/10338.dmlcz/144463
[dmlpdf]: https://dml.cz/bitstream/handle/10338.dmlcz/144463/MathBohem_140-2015-4_8.pdf
