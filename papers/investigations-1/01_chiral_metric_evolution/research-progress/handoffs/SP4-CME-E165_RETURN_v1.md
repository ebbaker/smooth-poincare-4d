# SP4-CME-E165 return v1 — Minimum harmonic-radius extraction

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E execution of the [frozen request][req]
under B84, configured `gpt-6.2-sol` / `ultra`. Independent runtime
attestation and actual lead settings are unavailable. I authored the
E154 review underlying its frozen lead assessment and the separate
E162 core topology proof. I did not author B84, E160 or the E154
assessment. E162 is outside this proof.

## Disposition

**The pre-ALE extraction holds under the specified assumptions.**
Take fixed \(p>4\), metric distortion \(m>1\), and derivative threshold
\(\eta>0\) in the radius definition of the [proof note][proof]. For
smooth metrics with the stated absolute Ricci and \(W^+\) bounds,
positive total volume lower bound and diameter upper bound, suppose
the global infimum \(r_i\) of that radius tends to zero. The metrics
\(\bar g_i=r_i^{-2}g_i\) at \(1+o(1)\) minimizing centers have a
complete connected smooth nonflat Ricci-flat ASD pointed
four-dimensional limit. It has positive Euclidean volume growth
at every center and finite total full curvature energy.
There are based orientation-preserving smooth embeddings on
neighborhoods of every fixed compact subset of the limit, with strong
local \(W^{2,p}\) and \(C^{1,\alpha}\), \(0<\alpha<1-4/p\),
convergence of the pulled-back metrics. The proof uses no
additional geometric compactness premise.

- Bishop–Gromov gives scale-invariant lower volume bounds and
  packing on each bounded rescaled radius, yielding a complete
  proper geodesic pointed metric limit. The normalized lower
  harmonic radius yields local charts with stable overlaps in that
  limit. The Ricci equation gives strong \(W^{2,p}\) convergence
  on interior chart regions and a smooth limit. The harmonic
  transition equations give strong local \(W^{3,p}\) convergence
  of the transition maps, so the chart limits form a smooth atlas.
- Finite cutoff-coordinate embeddings and a tubular projection
  construct comparison embeddings over each compact region.
  Local inverse branches agree by the chart margins and inverse
  uniqueness. Their images capture smaller intrinsic balls,
  giving volume convergence and passage of the Euclidean growth
  bound. Strong curvature convergence on compact regions and
  the scale-invariant Chern–Gauss–Bonnet energy bound give finite
  limit energy. The rescaled Ricci and \(W^+\) norms tend to zero
  with factor \(r_i^2\).
- If the limit were flat, a nontrivial Euclidean deck element
  would give an intermediate cyclic quotient with ball volume
  \(O(t^3)\), contrary to the lower growth bound. For the
  Euclidean limit the harmonic Dirichlet solutions on a fixed
  ball converge to the Euclidean coordinates in \(W^{3,p}\)
  on a smaller ball. Restrict them to the intrinsic radius-two
  ball in the approximants. They give an admissible radius
  exceeding the normalized near-minimum \(1+o(1)\), a contradiction.

This result stops before the ALE conclusion and any combined
static compactness or flow theorem. Smoothness of the limit and
the comparison embeddings is established in the above local
convergence class.

## Primary source

Reopened R29, Michael T. Anderson, *Cheeger–Gromov theory and
applications to general relativity*, undated author PDF, via its
legible indexed primary text on 22 November 2026. Consulted
Definition 1.1, printed p. 2, harmonic-radius Definition 2.1,
(2.1)–(2.2), p. 5, Theorem 2.2 and proof (2.3)–(2.9),
pp. 5–7, and volume comparison (2.12)–(2.13), p. 8.
The proof there uses the injectivity-radius premise for the
long minimizing lines at (2.8). The present proof supplies
its own metric and smooth-manifold compactness at the normalized
scale and its own flat-limit contradiction. It uses the exact
rescaling \(r_i^2\) for curvature norms. The printed (2.7) in
R29 gives a single \(r_h\) power in its vanishing bound.
Reported the passage check to the lead. No other primary work
opened, zero discovery queries, no retained reading copy.
[Author PDF][r29] · [Canonical R29][r29record] · [E154 assessment][e154a].

## Verified versions

| File | SHA-256 |
| --- | --- |
| [E165 request v1][req] | 98c05ba3f5dd9c51e50ceaed267da7abc86c1f8a673627a466068367706fd013 |
| [B84][b84] | b76959efa4ed2f4f6207a9b6b897f0f52b286adc735d2a0569a9c54ce02f13b6 |
| [E160 source test][e160] | 61a877ec4465ad7c5b786b4190b6042295cafc1aae5bef4a80965dbf455aab32 |
| [E154 assessment][e154a] | ea4b36e70a665ade7fa143e97be1f3f2238db7657591f729b22b27802e4594ec |
| [E165 proof note][proof] | 3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2 |

Only the designated proof note and this return were written.

[req]: SP4-CME-E165_REQUEST_v1.md
[b84]: ../../brainstorm/notes/B84_MINIMUM_HARMONIC_RADIUS_ALTERNATIVE_20261122.md
[e160]: ../../reviews/E160_FOUR_DIMENSIONAL_NONCOLLAPSE_SOURCE_TEST_20261122.md
[e154a]: ../../reviews/E154_METRIC_COMPACTNESS_SOURCE_ASSESSMENT_20261122.md
[proof]: ../../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md
[r29]: https://www.math.stonybrook.edu/~anderson/cargese.pdf
[r29record]: ../../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r29--anderson-author-survey-discovery
