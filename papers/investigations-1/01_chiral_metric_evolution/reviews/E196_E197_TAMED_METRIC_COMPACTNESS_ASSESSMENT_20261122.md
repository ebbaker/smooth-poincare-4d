# E196/E197 — Lead assessment of tamed metric compactness

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Lead conceptual review and integration under B96; actual selected lead model/effort unavailable. E196 and E197 were assigned to separate helpers configured gpt-6.2-sol/ultra; independent runtime attestation unavailable. The lead read both full derivations and returns and verified the output digests below. The audit's inherited source work is disclosed in E197; agreement alone is not the mathematical evidence.

## Accepted statement

Fix K,K_+ finite, v>0, D finite and an Euler upper bound chi_0. Smooth closed connected oriented Riemannian four-manifolds with absolute Ricci norm at most K, positive Weyl endomorphism Hilbert–Schmidt norm at most K_+, volume at least v, diameter at most D, Euler characteristic at most chi_0, and supplied strict positive-chiral **metric twistor taming** are sequentially compact modulo smooth orientation-preserving diffeomorphisms from one late smooth member. The positive pulled-back limit is strong C^{1,1/4} and weak W^{2,8} in that fixed smooth atlas. Consequently the class has finitely many oriented diffeomorphism types.

The two explicit historical premises in the frozen E196 note are supplied by the separate [E191/E194 assessment](E191_E194_C1_TWISTOR_ASSESSMENT_20261122.md) and [E193 assessment](E193_ALE_SPHERE_SOURCE_ASSESSMENT_20261122.md). The former supplies the first-jet comparison and C0 persistence proof. The latter imports the Kronheimer metric classification as attributed in the checked Wright v2 and Lyu–Xu v3 passages; the original construction and Torelli bodies remain uninspected. This provenance is part of the accepted source scope and must accompany manuscript application. E196's frozen conditional wording remains authentic.

## Lead checks and dependency assembly

The full component curvature convention gives
\[
32\pi^2\chi(M)=\int(|\mathrm{Rm}|^2-4|\mathrm{Ric}|^2+s^2)dV.
\]
Thus for D'>D, model volume V_max=V_{-K/3}(D'), the energy is at most C_E=32 pi² chi_0+4K² V_max. If C_E<0 the class is empty. This is the only Euler input. Bishop–Gromov gives volume at most V_max and, at every center for r<=D', volume at least (v omega_4/V_max)r^4. Both estimates persist at fixed rescaled radii when the unscaled radius tends to zero. No lower injectivity bound is imported.

The exact p=8,m=2,eta=1 minimum harmonic-radius argument uses each smooth M_i individually. Local transitions compare charts on that same M_i. Ricci and W+ rescale by the square of the small radius; total full curvature energy is scale invariant. The assessed E165/E167 chart construction therefore gives a complete smooth Ricci-flat ASD pointed limit, strong W^{2,8} actual compact comparison embeddings, quartic volume growth, finite full energy and nonflatness. The flat alternative is excluded by the genuine radius-two harmonic-coordinate construction, not a semicontinuity assertion. The fixed homotopy-sphere topology previously used only after this stage is absent here. [Extraction assessment](E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md).

Bando–Kasue–Nakajima Theorem (1.5), Remark (1.8)(1), applies to that supplied complete candidate and gives the ALE end. Its Einstein-sequence theorem is not used for extraction. Rescaling g by b² sends ordinary unit self-dual two-forms alpha to b² alpha, intertwining the same Levi–Civita horizontal connection, the fiber orientation, canonical almost complex structures and normalized Reznikov form. In curvature coordinates both blocks acquire b^{-2}, so strict metric taming persists without a uniform taming constant. Actual positive comparison embeddings give its natural pullbacks. The limit's flat positive chiral connection gives the compatible hyperkähler cover. E191/E194 excludes all embedded holomorphic spheres there; E193 supplies one. Hence a sequence with vanishing minimum radius cannot exist. [ALE source assessment](E164_RICCI_FLAT_ALE_SOURCE_ASSESSMENT_20261122.md).

For the unscaled sequence this proves a class-wide harmonic-radius floor. The existing common-target cutoff embeddings and uniform tube construction now apply on arbitrary varying closed connected oriented bases: fix the target, tube radius and allowed projection error before choosing a late smooth reference. The foot equation yields ||Dq-I|| <= 4L(1+LC_b)d_0 < 1/2. Separation places competing preimages in one convex chart, so local injectivity gives global injectivity; compactness and connectedness give surjectivity. Positive inverse maps from the reference therefore exist. The inverse third-derivative bound and stronger intermediate Hölder exponents give the claimed strong C^{1,1/4} and weak W^{2,8} metric convergence. A sequence of pairwise distinct oriented types contradicts this subsequential identification. [Varying-base assessment](E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md).

## Limits and integration

This is a metric result with a supplied strict Levi–Civita twistor-taming hypothesis. No full-curvature supremum bound, smooth unscaled limit, quantitative harmonic-radius floor, native connection positivity or general native-flow extension follows here. The separate homotopy-sphere compactness argument does not need this metric-taming assumption. No initial definite data on arbitrary homotopy spheres have been constructed, and no exhaustive novelty comparison is claimed.

The lead accepts E196 with the two premises discharged at the exact assessed scopes above. The [E197 audit](E197_TAMED_METRIC_COMPACTNESS_AUDIT_20261122.md) required no repair. Manuscript integration and rendered QA are separate tasks. Canonical reference use remains in [R29, R31, R37–R42](../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md), with inspected versions and uninspected originals distinguished there.

## Frozen inputs

| Artifact | SHA-256 |
| --- | --- |
| [B96_TAMED_METRIC_COMPACTNESS_20261122](../brainstorm/notes/B96_TAMED_METRIC_COMPACTNESS_20261122.md) | 504953dd99e8c85c4c40720ba39a308b4322b5b9c6b67f301d8fabe4b231610e |
| [SP4-CME-E196_REQUEST_v1](../research-progress/handoffs/SP4-CME-E196_REQUEST_v1.md) | 81f2d106e8addf774ed7f306f467da974fe2d05e59164904765713f0d865b6df |
| [196_CONDITIONAL_TAMED_METRIC_COMPACTNESS_20261122](../notes/196_CONDITIONAL_TAMED_METRIC_COMPACTNESS_20261122.md) | 49e0175de05a5012e86feaeeec32f261dfa78780d744afbc14ce4e0b0bd7da52 |
| [SP4-CME-E196_RETURN_v1](../research-progress/handoffs/SP4-CME-E196_RETURN_v1.md) | d5ca76910ef27e43e61ee2cd46d04d5538b4c7489b6d8cc123e7b9c1bb75f93d |
| [SP4-CME-E197_REQUEST_v1](../research-progress/handoffs/SP4-CME-E197_REQUEST_v1.md) | d21a433abb01bbad9eaccf3a576fa95cf9c6e6d1b1f8656a2fca1a2b86b7bd55 |
| [E197_TAMED_METRIC_COMPACTNESS_AUDIT_20261122](E197_TAMED_METRIC_COMPACTNESS_AUDIT_20261122.md) | a6fdd72fa8fa9725e1d7f39a7119bb78d994d3cb7422ee4f77be8935abb86820 |
| [SP4-CME-E197_RETURN_v1](../research-progress/handoffs/SP4-CME-E197_RETURN_v1.md) | 01eb489a3bf4ca65478c1466fb73c138cdf36557b0bcf4b33299d2b4ffc0976e |
| [E191_E194_C1_TWISTOR_ASSESSMENT_20261122](E191_E194_C1_TWISTOR_ASSESSMENT_20261122.md) | b4cc0c48432c57d5de678179057d17f2265f26a0b9af29e62a89da367b05ac49 |
| [E193_ALE_SPHERE_SOURCE_ASSESSMENT_20261122](E193_ALE_SPHERE_SOURCE_ASSESSMENT_20261122.md) | 75d6e5c46d92ec8dccc345cd177a5c40dba79d3aa78a65cd5a291e83e6735916 |
