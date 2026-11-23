# SP4-CME-E192 return v1 — Independent compact \(C^0\) persistence audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B93, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings
are unavailable. I authored related metric compactness inputs E162
and E165. B93, E186 and E190 were independently checked at the
scope specified in the E192 request. [Full audit][audit].

## Disposition

**Mathematical pass, with a source-locator correction.** The
linearization, fixed-target projection, compact convex ball,
weak-to-uniform continuity of the self-map and Schauder hypotheses
check. The radius and \(C^0\) threshold use only the fixed data.
The geometric equation holds for the fixed point. The radial
homotopy and diameter estimate give a nonconstant sphere in the
claimed homotopy class.

The \(L^8\cdot L^8\) difference-quotient forcing and local
coefficient absorption give \(W^{2,4}_{\rm loc}\). The Hilbert
transform identity, directional Riesz averaging and the two
Fourier factorizations check. The weak Poisson estimate and
composition and product orders then justify smoothness for each
individual smooth \(J'\). These estimates can use individual
derivatives of \(J'\) after the fixed-point threshold has been
selected.

Laugesen's compact-map definition is **§1.6, Definition 1.11,
printed p. 18 / PDF index 17**. Read §1.6 in the two E190 compact-map
citations and the inherited E192 locator that give §1.5. §1.7
Theorem 1.17 and proof (pp. 23–24 / indices 22–23), Theorem 3.22
(p. 71 / index 70) and Proposition 5.7(i)–(ii) (pp. 110–111 /
indices 109–110) verify in the 22 December 2020 author PDF.
Theorem 3.22 is used on smooth chart disks, and Proposition 5.7
is localized by segment and weak testing arguments. No further
regularity theorem was imported. [Laugesen author PDF][laugesen].

Fine arXiv:1602.03829v2 was checked in HTML and the indexed PDF.
Remark 5 starts on printed p. 4 with its closing line on p. 5.
Proposition 7 is on pp. 7–8 and (3)–(5) on p. 8. The first two
equations compare the residuals using \(C^0\), while (5) bounds
the derivative using \(C^1\). The posted date is 15 November 2016
and the PDF displays 4 April 2018 separately. No published body,
local source copy, or additional source was used. [Fine v2 HTML][fine]
· [Fine v2 PDF][finepdf].

The result is single-curve existence at the supplied regular
sphere and right inverse. It provides individual smoothness and
the asserted nonconstancy and homotopy. Embeddedness of the
perturbed map, uniqueness, smooth dependence, uniform higher
estimates, taming, bubble exclusion and novelty are outside the
finding. Lead assessment remains pending. Only the two assigned
outputs were written.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E192 request][req] | 2cc33eaccd6d7be7883132c34ec30d573f52cf29ce2532eb92d25fefe766f889 |
| [B93][b93] | 4199ff5376d7d4cfb5c6555246089616f4e622ec28adb42ba07855d60e8f3c5b |
| [E190 request][e190req] | 66e5c48eb1f5e8645d0a23c7600eacb0c3ba97f26393864a2f83a86d236f5701 |
| [E190 proof][e190] | c928a60dfe4fe6fbafe4428261f7b77164648a88382c20ca5ff06b8f9302a2ea |
| [E190 return][e190ret] | bbb14248d7d5b5850ba5d325592fa8f6ac593116ee38415a93887e05c3fe0137 |
| [E186 assessment][e186] | aabd5b851a0373d8d2331a5ace9035a634eb2933d7f731632255780d08901f65 |
| [Nested E186 source audit][e186audit] | 31ead6b42eff300f3afb0633e802ba3ba75f15e69a431cc5fc656003bc4f4c6e |
| [E192 audit][audit] | a0e7a764dfe73ab2a8997a71707e347b212c761cd72a9a37842b7d610253bbed |

[req]: SP4-CME-E192_REQUEST_v1.md
[b93]: ../../brainstorm/notes/B93_WEAK_COMPACT_CURVE_PERSISTENCE_20261122.md
[e190req]: SP4-CME-E190_REQUEST_v1.md
[e190]: ../../notes/190_C0_CURVE_PERSISTENCE_TEST_20261122.md
[e190ret]: SP4-CME-E190_RETURN_v1.md
[e186]: ../../reviews/E186_TWISTOR_COMPARISON_ASSESSMENT_20261122.md
[e186audit]: ../../reviews/E186_TWISTOR_LIMIT_SOURCE_AUDIT_20261122.md
[audit]: ../../reviews/E192_C0_PERSISTENCE_AUDIT_20261122.md
[laugesen]: https://publish.illinois.edu/rlaugesen/files/2023/07/554-Lectures.pdf
[fine]: https://arxiv.org/html/1602.03829v2
[finepdf]: https://arxiv.org/pdf/1602.03829v2
