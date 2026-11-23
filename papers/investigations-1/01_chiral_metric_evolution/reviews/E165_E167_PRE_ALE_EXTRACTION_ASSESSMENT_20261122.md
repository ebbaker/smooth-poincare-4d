# E165/E167 assessment — Minimum harmonic-radius extraction

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. The selected lead remains unchanged; actual lead model
and effort are unavailable. Both bounded helpers were configured
gpt-6.2-sol/ultra; independent runtime attestation is unavailable.
The E167 auditor did not author E165, but authored the separate E163/E164
source checks. The lead read both complete derivations and returns.

## Accepted statement and quantifiers

Accept [E165](../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md)
at its stated pre-ALE boundary, with
[E167's independent audit](E167_MINIMUM_HARMONIC_RADIUS_EXTRACTION_AUDIT_20261122.md).
On a fixed smooth closed connected oriented homotopy four-sphere, take
smooth Riemannian metrics with uniform absolute Ricci and positive Weyl
block bounds, positive total volume lower bound and diameter upper bound.
Fix p>4, m>1 and eta>0 in E165's explicit harmonic-radius definition.
If the infima of those radii tend to zero, rescale by their inverse
squares at approximate minimizing centers. A subsequence has a connected
complete smooth nonflat Ricci-flat ASD limit with positive Euclidean
volume growth and finite full-curvature L2 integral. For every fixed
compact subset there are based orientation-preserving smooth comparison
embeddings on a neighborhood, with strong local W2,p and C1,alpha
pullback convergence, 0<alpha<1−4/p.

No minimum-attainment, injectivity floor, continuity of harmonic radius,
or pre-existing manifold limit is presumed. This supplies H_pre as
stated in the historical conditional E168 request and proof. The
complementary unscaled global compactness argument remains a separate
step under E169 audit.

## Checks carrying the conclusion

The lead accepts the packing and finite-net construction from
Bishop–Gromov at the scaled diameter, followed by limit charts from the
global normalized harmonic-radius floor. Uniform interior margins make
chart images open and overlaps persistent. The harmonic Ricci equation
first makes the weak limit smooth and Ricci-flat, then gives strong
W2,p convergence. Transition equations provide the third derivative
needed when pulling back a metric through the comparison maps.

The compact embeddings are actual maps, not just formal convergent
atlases. Finite cutoff-coordinate embeddings and a tubular projection
to the smooth limit give local inverse branches. The uniform chart
margins put competing branches in one chart, where derivative closeness
to the identity proves uniqueness. The right-inverse identity gives
global injectivity on the prescribed neighborhood. The same margins
give coverage of smaller intrinsic balls, so metric-ball volumes pass
to the limit. The smoothness here uses the rescaled Ricci-flat limit;
it does not apply to an unscaled metric limit without further work.

Chern–Gauss–Bonnet in the full (0,4) curvature convention bounds energy
by the fixed Euler characteristic and the controlled Ricci-square
integral. Constant rescaling preserves that energy. Strong local
curvature convergence and exhaustion give finite limit energy and
vanishing positive Weyl block.

Nonflatness has a direct proof. A nontrivial free Euclidean deck element
has a translational component and gives a cyclic intermediate quotient
whose balls have volume at most a constant times radius cubed, contrary
to the four-dimensional lower growth bound. Thus a flat limit would
be Euclidean. Solving the harmonic Dirichlet coordinate problem on a
larger Euclidean ball then gives strong W3,p coordinate convergence.
Ball coverage permits restriction to the whole intrinsic radius-two
ball of the approximants. Both fixed distortion and derivative
thresholds become strict, contradicting the normalized near-minimum.
No continuity theorem for the radius is substituted for this step.

## Attribution and locator correction

Anderson's harmonic-coordinate framework and blow-up method are
acknowledged. E165 uses its own explicit two-derivative criterion with
coordinate Lebesgue measure; it is not literally the single order-k,
metric-measure seminorm in the source. The source Theorem 2.2 keeps
its injectivity hypothesis. Its argument is not imported after deleting
that hypothesis.
[Anderson, undated author PDF](https://www.math.stonybrook.edu/~anderson/cargese.pdf).

The lead retrieved and rendered the actual PDF after the indexed
page locators disagreed. Printed Definition 2.1/(2.1)–(2.2) is on p.4;
Theorem 2.2/(2.3) and the rescaling start are on p.5; the proof and
(2.9) end on p.6; Bishop–Gromov (2.12)–(2.13) is on p.7.
The frozen helper files retain their original reported locators.
The canonical R29 record carries this correction and the actual
temporary-copy hash. The one-power curvature bound printed in (2.7)
does not replace the exact squared rescaling in E165.

## Verified evidence

| Input | SHA-256 |
| --- | --- |
| [E165 note](../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md) | 3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2 |
| [E165 return](../research-progress/handoffs/SP4-CME-E165_RETURN_v1.md) | e67b8095fa6c6dd67fa8469dfcaa7ded5aaf410be5894549dd963d6872039999 |
| [E167 audit](E167_MINIMUM_HARMONIC_RADIUS_EXTRACTION_AUDIT_20261122.md) | ea67edb902f8f0adc3826cea5e1d8cef463b40b7db6c6b130a25b9c68fea4ca5 |
| [E167 return](../research-progress/handoffs/SP4-CME-E167_RETURN_v1.md) | d1f4185ace2998afbf43564671a160edcd8eb28eff8804ae37d8e33d5eeb9717 |

The earlier requests and input digests remain frozen. Acceptance is
an assessed derivation with an independent fixed-route audit, not
external specialist review or a novelty determination.
