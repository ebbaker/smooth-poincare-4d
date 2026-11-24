# SP4-FOT-DIR-E05 · Degree twist and conformal scalar test · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The packet was configured for
`gpt-6.2-sol` / ultra. Actual realized model identifier and effort were
not independently exposed to the helper. The [request](SP4-FOT-DIR-E05_REQUEST_v1.md)
pins the input bytes and the [derivation](../../notes/DIR_E05_20261124.md)
records the checks. Observed HEAD and all five frozen digests match.

| Clause | Result |
| --- | --- |
| Degree and kernel | The smooth degree-one collapse exists and can be constant on an open patch. For every smooth metric, domain-chiral indices for the two target half-spin twists are $+1,-1$ in the self-dual positive convention. The product-graded index is $+2$. |
| Pointwise test | Listing's cutoff for target sectional curvature one is $\sqrt{24\sum_{i<j}\sigma_i^2\sigma_j^2}\le 3\sum_i\sigma_i^2$. The twist curvature is bounded below by minus one quarter of the cutoff. The inequality $s_g\ge3|df|^2$ holds precisely when $f$ is a homothety, and then holds with equality. |
| Spectral test | The first eigenvalue of $6\Delta_g+s_g-3|df|^2$ is always nonpositive. It equals zero precisely when $f$ is a diffeomorphism and $g=w^2 f^*h$ for a smooth $w>0$. Constant $w$ yields pointwise equality. Nonconstant $w$ gives a sign-changing pointwise deficit. A fixed map with a constant patch gives a strictly negative eigenvalue for all $g$. |

The [primary passage record](../../notes/DIR_E05_20261124.md#primary-passage-record)
locates Listing's checked theorem, index, curvature and equality
passages. The unconditional existence clause is for the pulled-back
twist. The rigidity clauses do not realize their premises on an
arbitrary homotopy sphere. For the lead's DIR-B01/B02 assessment, a
construction aiming at zero for a fixed collapse map cannot attain
that value in a smooth metric. Any revised potential or equality
premise returns to DIR-B01. No optimization over maps was used.
