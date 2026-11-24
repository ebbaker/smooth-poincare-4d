# SP4-FOT-DIR-E08 · Fixed-map conformal maximization · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Fixed E routing was specified as
`gpt-6.2-sol` / `ultra`. Actual helper and lead model identifiers and
reasoning effort were unavailable.
[Request v1](SP4-FOT-DIR-E08_REQUEST_v1.md) · [Owning register](../REGISTER.md) ·
[Derivation](../../notes/DIR_E08_20261124.md)

**Completed.** For the fixed smooth nonzero-degree map \(f\) into the
unit round four-sphere, the maximum of
\(\lambda_1(6\Delta_h+s_h-3|df|_h^2)\) over smooth unit-volume
\(h\in[g]\) is \(Y_f([g])\le0\).

| Case | Attainment and curvature |
| --- | --- |
| \(Y_f<0\) | The smooth positive quotient minimizer \(u\) with \(\|u\|_{4,g}=1\) gives the unique maximizing metric \(u^2g\). Its deficit \(s_{u^2g}-3|df|_{u^2g}^2\) equals \(Y_f\) everywhere. |
| \(Y_f=0\) | Every smooth unit-volume representative has first eigenvalue zero. The positive quotient minimizer is unique up to scale and selects the unique normalized metric with pointwise zero deficit. This metric is the round pullback up to scale, and \(f\) is a diffeomorphism. |
| \(f\) constant on an open set | The fixed-class spectral maximum is strictly negative. On the open patch the maximizing metric has scalar curvature \(Y_f<0\). |

At negative value the weak limit of a normalized minimizing sequence
keeps its full critical norm by lower semicontinuity and the sign of
\(Y_f\), so a subsequence converges strongly in \(H^1\). A coercive
linear comparison gives boundedness, followed by smoothness and strict
positivity from elliptic regularity and the maximum principle. The
curvature equality and the eigenvalue maximum follow separately from
the conformal transformation and the scalar Rayleigh quotient.

HEAD and all five frozen digests matched. The derivation records the
E05 input and the exact Listing and Lee–Parker passages checked. No
reading copies or numerical artifacts were saved. The result is for
one fixed pair \(([g],f)\). It supplies no uniform negative gap as
either member varies. The independent varying-map question remains E09.
