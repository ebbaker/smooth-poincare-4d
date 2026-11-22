# Sources checked for the chiral metric evolution background

21 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Actual model and effort were not independently exposed.
Scope: the fixed editorial packet SP4-CME-DOC-E01. This is a record of
selected passage checks, not a full literature review or a proof audit.

The consuming text is the introduction and Section 2 of
[the chiral metric evolution manuscript](../papers/investigations-1/01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex).
Full bibliographic metadata and stable primary links are in
[references.bib](references.bib). The local PDFs were already present;
their original retrieval dates and download URLs were not independently
established in this session. File identities are recorded below.

## Inspected passages and their use

| Catalog / bibliography key | Inspected passage | Use and hypotheses retained |
| --- | --- | --- |
| R1 / AHS1978 | Journal pp. 431–432, Proposition 2.2; pp. 435–438, Theorem 4.1 and its discussion; pp. 439–442, especially Theorem 5.2 | Smooth oriented real Riemannian dimension four. Twistor integrability is a condition on one Weyl component; an induced chiral connection satisfies the corresponding gauge duality condition precisely for an Einstein metric. Ward reconstruction requires full-line triviality and a positive compatible reality structure. The manuscript uses the opposite chirality naming from the relevant AHS convention, with its choice stated explicitly. No global spin or real-analyticity hypothesis is added to the Riemannian integrability theorem. |
| R3 / Penrose1976 | §4, especially journal pp. 41–43; §5, pp. 43–47 | Complex four-dimensional spacetime and a complex three-dimensional twistor space. Incidence of rational curves recovers conformal geometry. The Ricci-flat specialization needs additional forms and fibration data. Local complex constructions are not treated as Riemannian existence results. |
| R6 / Kodaira1962 | Main Theorem and Theorem 1, journal p. 150 (PDF p. 6) | A compact embedded complex submanifold with vanishing first cohomology of its normal sheaf has a complete local deformation family with tangent space equal to global normal sections. Applied to the explicitly specified normal bundle O(1) ⊕ O(1); h⁰ = 4 and h¹ = 0. |
| R7 / Kodaira1963 | Definition 1 and Theorem 1, journal p. 80 (PDF p. 3), with the introductory definition of stability | Vanishing H¹ of the normal sheaf gives persistence under sufficiently small deformations of the ambient complex structure. Persistence is distinguished from the separate completeness statement and does not supply an arbitrary global spacetime. |
| R8 / Shaw1986 | §2, journal pp. 755–756 (PDF pp. 4–5), equations (8), (15), and the singular-case discussion | The tangent-line construction is used on a direction patch on which the projective coordinate is a valid parameter. The manuscript gives its affine formula and the elementary rank-one derivative check, allowing stationary trajectories. It does not assert a single inverse chart on a complete fiber. |
| R5 / Ward1980 | §§1–2, particularly journal pp. 2, 5–7 and equation (2.15) | Holomorphic Einstein geometry with cosmological constant requires additional twistor forms and the specified line family. Ward's “ASD solution” includes the Einstein equation: his normalization is Ric = 6Λg and scalar curvature 24Λ. These constants are not substituted for the manuscript's Ric = 3Kg and scalar curvature 12K. |
| R9 / IsenbergYasskinGreen1978 | Theorem 5 and the adjacent extension definitions, journal p. 463 (PDF p. 2) | In the local complex flat-spacetime correspondence, the source-free Yang–Mills equation requires extension to third order off the ambitwistor quadric. An unrestricted holomorphic bundle or full neighborhood extension is not substituted for that condition. |
| R10 / Witten1978 | Journal p. 395 (PDF p. 2) | Triviality on complete CP¹ × CP¹ direction quadrics and the third-order formal extension condition; locality is explicit in the source. This is the 1978 classical Yang–Mills paper, not the later twistor-string article. |
| R11 / MasonSkinner2006 | Published article §§2–3, journal pp. 61–62 (PDF pp. 2–3) | Theorem 2 reviews the formal extension condition on suitable complex domains; null-line intersections are connected and simply connected. §3 selects an eight-real-dimensional CR submanifold using a Euclidean real slice. No arbitrary curved gravitational reconstruction theorem is imported. |
| R15 / Fine2011 | arXiv:1111.5005v2, dated 29 November 2011; Definitions 1.3–1.5, 1.9–1.10, Proposition 1.12, Theorem 2.1, and Theorem 4.11; §4.2 theorem statement | Definite SO(3) connections determine a conformal class and curvature volume. Perfection gives ASD Einstein geometry of nonzero scalar curvature. The energy differs from the manuscript's defect functional by a topological constant. Theorem 4.11 assumes a compact four-manifold, a perfect reference connection, and sufficiently small L²_k distance with k ≥ 3, and concludes convergence modulo the bundle automorphism group. The manuscript separately fixes its volume and time normalization; neither this source nor the revision is presented as arbitrary-data global convergence. |
| R16 / Baker2023 | [arXiv landing page](https://arxiv.org/abs/2301.00029), version metadata for v2 (26 January 2023), and [v2 text](https://arxiv.org/html/2301.00029v2), principally §§2 and 5 | The author's generalized conformal maps and nonlocal gauge pullback motivate the direction-dependent coordinate question in four complex dimensions. Used as motivation under the source's domain and nonsingularity assumptions, not as a theorem constructing Riemannian geometry on a homotopy sphere. This is the only Baker work cited in the revised manuscript, with the phrase “and references within.” |

Penrose's separate short paper R4, *The Nonlinear Graviton*, pp. 174–175,
was also consulted for historical motivation. It was not added as a redundant
manuscript reference. The primary journal landing page for
[Fine–Krasnov–Panov](https://nyjm.albany.edu/j/2014/20-18.html) was checked
at abstract/metadata level only. The pre-existing Gursky–Viaclovsky and
Kuiper citations remain inherited pointers; their complete proofs were not
newly audited. The manuscript's existing topological argument was read and
is now explained earlier in its motivation.

The two manuscripts under `papers/initial-investigations/` supplied the
development from local direction charts to bundle descent, the importance
of tangent-spinor identification, and the neutral wave example. They are
not cited in the revised manuscript. The elementary rank-one and signature
checks are stated in the text; no general descent theorem from those drafts
has been imported or promoted to verified status.

## Citation and version policy

The historical unpublished Baker entries in the shared catalog are retained
as provenance. For this manuscript, the author's explicit citation choice
is `Baker2023` and references within, rather than those unpublished entries
or the two initial-investigation manuscripts. The 2023 citation date follows
the arXiv v2 submission metadata, not a regenerated date on an HTML title page.

The publication metadata for the two 1978 Physics Letters papers was checked
against publisher records. Mason–Skinner's year and DOI were checked against
the published reading copy and arXiv's journal metadata. Ward's DOI resolver
could not be opened by the browser tool; its article title, year, volume and
pages were checked in the local published copy. No claim of fresh PDF
retrieval is made.

## Local reading-copy identities

SHA-256 identifies the inspected bytes, not the validity of the mathematics.

| Reading copy | Bytes | SHA-256 |
| --- | ---: | --- |
| [Atiyah.pdf](Atiyah.pdf) | 11176148 | `a4d55168994f0581232305d17397b8a69b5cf5a28b20a8dc8677a04e18394ee6` |
| [Nonlinear_Gravitons.pdf](Nonlinear_Gravitons.pdf) | 1200969 | `b38a75eb6fbb04182e66093a8ab7a5486ea00b31979ed1cc51f4b5a9a7e2539d` |
| [Nonlinear_Graviton.pdf](Nonlinear_Graviton.pdf) | 310087 | `6c2c31155c8bd5ef61ee5a7949ae54c491265a60472e2fb552392362603d9816` |
| [Kodaira-TheoremCompletenessCharacteristic-1962.pdf](Kodaira-TheoremCompletenessCharacteristic-1962.pdf) | 485067 | `136e193800e25dacec36d7dc13d629f9f2e2cd55ea235792de9fdb813d4dd986` |
| [Kodaira-StabilityCompactSubmanifolds-1963.pdf](Kodaira-StabilityCompactSubmanifolds-1963.pdf) | 1885412 | `a0441218b592703aa0873eea5b2270cc85b5e7618b8b366dc9268fc1e1709397` |
| [W_T_Shaw_1986_Class._Quantum_Grav._3_753.pdf](W_T_Shaw_1986_Class._Quantum_Grav._3_753.pdf) | 985385 | `8f42f50c61716b94a931e709262c2f1dbb548ac7595c6248d351fbf7fbcad412` |
| [ward_1980.pdf](ward_1980.pdf) | 1870247 | `d2a6f373fde264ade73682cd71264193ffab975fb26b1898bb53078921843fa5` |
| [green.pdf](green.pdf) | 227979 | `7945a50d517bb358db0323e57eda4511ee1d0d886841102333cf9e8f32aaa6b0` |
| [witten.pdf](witten.pdf) | 358172 | `5f20b2a5f92a1e51d6bf10802323ce23da3e994648921dc61442f6702fef6a76` |
| [mason2006.pdf](mason2006.pdf) | 184326 | `d6f0ee10f369ca33b853b62a7023be948dff84240b6c25adb19a30023e567516` |
| [1111.5005v2.pdf](1111.5005v2.pdf) | 447930 | `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8` |
