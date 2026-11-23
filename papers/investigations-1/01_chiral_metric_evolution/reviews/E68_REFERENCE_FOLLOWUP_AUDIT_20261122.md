# E68 — Reference workflow follow-up for E47–E65

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and actual lead settings are unavailable.
I authored some of the consumed notes, including E48, E49, E53,
E54, E59, E62 and E64. This is a local records audit against the
[root workflow][workflow] and the [frozen request][req].
It does not independently reassess the scientific proofs.
I checked source statements and inspection levels against the recorded
notes and returns, without reopening a primary text or downloading
a source. The local Fine PDF was identified by bytes only.
The earlier [E40 audit][e40] remains the record for its own scope.

## Key and build identities

The frozen 67-page manuscript source was consumed at
`64d65b2ecbf964ccfbed70d9d50d3e0f20f89859cb3f49444e3c63bb6445e74b`.
Section 6.10 is `subsec:round-stability`, lines 2900–3238 of
that source. The manuscript uses a manual `thebibliography`.
I stripped TeX comments, extracted active citation arguments
including multiline optional passage notes, expanded comma-separated
keys, and compared the order of first use with its
`\bibitem` list. There were 56 active citation-key occurrences,
31 distinct cited keys and 31 distinct manual entries, in first-use
order. Every cited key and every manual entry is present in the
44-key canonical BibTeX file. There are no duplicate keys after
case folding, and the 27 DOI and 13 arXiv/eprint fields are also
unique after case folding. Inline fields are included in those
counts. Section 6.10 has three uses of `Fine2011` and one
of `Taylor1991Nonlinear`; `KochLamm2015` is used in
`subsec:rough-local`. The three rigidity pointers are neither
manual entries nor citations in this manuscript.

The [recorded integration checkpoint][integration] identifies the
PDF as 732232 bytes, SHA-256
`be40af471e6e064207316cc521dd0f7541cbc3e81e93a78975429402b48be4ec`.
The ignored normal output matched both numbers and `pdfinfo`
reported 67 pages. That checks the identity of the prior lead build.
I did not recompile or visually inspect it here. E55 audited the
earlier TeX digest `59b31f1b63f64f394f2e05b8e680156f2c73f2c967148a4294958b134dd772dd`,
as stated in its request and the integration record. The two TeX
identities remain distinct. Relative paths and anchors in the
frozen root catalog, shared source note and branch index resolved
in a local check. [Shared catalog][catalog] · [Canonical bibliography][bib] ·
[Branch index][branch].

## Fine's v2 and the round stability consumers

The recorded preprint is Joel Fine, *A gauge theoretic approach to
the anti-self-dual Einstein equations*, arXiv:1111.5005v2,
29 November 2011. The existing ignored root copy is
`references/1111.5005v2.pdf`, 447930 bytes, SHA-256
`d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8`.
The canonical version link does not establish its original retrieval
URL or date; both remain unknown in the [background provenance][background].
The later packets record the following selected-passage checks on
22 November 2026, America/New_York.

| Consumer | Recorded Fine passages and evidence |
| --- | --- |
| E47 | Existing local v2. Definitions 1.4–1.5 (pp. 4–5), Proposition 1.12 (p. 9), Lemma 2.2 (p. 12), (3.1)–(3.3) (pp. 17–18), Lemma 3.5 and §3.4 (pp. 21–24), §3.6 and Theorems 3.11/3.13 (pp. 25–29), Proposition 4.2 (p. 30), (4.5) and Lemma 4.9 (pp. 32–35), and §4.3 (pp. 37–40). Its return records visual verification of pp. 28, 33 and 38–40. |
| E48 | Existing local v2, with selected pages rendered. Definition 1.4 (p. 4), (3.1)–(3.3) and Lemma 3.1 (pp. 17–18), Lemma 3.2/(3.4) (p. 19), Lemma 4.1, Proposition 4.2 and (4.1)–(4.4) (pp. 29–31), (4.5), Proposition 4.5, (4.7), Lemma 4.6, Corollary 4.7 and Lemma 4.9 (pp. 32–35), and (4.9)/Proposition 4.12 (pp. 38–39). |
| E50/E52 | Fine §3.2 Lemma 3.2/(3.4) (p. 19) and §4.2 Lemma 4.4/(4.3)–(4.4) (p. 31) for the left-action signs and recovery. E50 reports this selected reinspection in its note. E52 explicitly reports a selected remote PDF check. |
| E51 | Existing local v2; Definitions 1.4–1.5 and Lemma 2.2 (pp. 4–5, 12), Lemmas 3.7–3.9 and chirality (pp. 22–24), action/gradient formulas (p. 19 and pp. 29–34), and the relevant stability passages (pp. 38–40). It visually checked pp. 33, 38–40 and directly checked the algebraic identity on p. 34 against the PDF text. |
| E55 | Reopened Theorem 4.11 for manuscript integration. The audit records small definite \(L^2_k\) perturbations, integer \(k\geq3\), a perfect reference on a compact four-manifold, and convergence modulo bundle automorphisms as the source statement. |
| E65 | Selected remote text of the same v2, Definition 1.4 and Killing normalization (p. 4), Definition 1.5 (p. 5), Lemma 2.2 and proof (pp. 12–13), and Proposition 4.2/(4.1) (p. 30), for the fixed curvature scale, native conventions and clock. |

The canonical [implementation checks][stabilitysources] and
[assessed integration][stabilityassessment] retain the main division of roles.
Fine states local stability for the compact perfect-reference Sobolev
regime in Theorem 4.11 and uses the separate live-metric gauge (4.9).
The actual manuscript derives a fixed-reference gauge,
its normalized Hessian and positive round operator, the weighted
trace estimate, the compact-bundle smooth restart, and the
small-value entry to the stability basin. It attributes the
precedent at lines 2911–2913, the action signs at 2933–2934, and
the deformation description at 3017–3019. The round positive
Dirac calculation is displayed directly and does not claim
the source's general perfect-manifold vanishing for other manifolds.
The manuscript's rough smoothing and recovery require its own
fixed-reference construction and smooth initial connections.
Lines 224 and 1770 now use “Fine states” as recommended in E55.

The source note correctly preserves the two square-root notations
under their distinct locations, the exact trace range
\(H^{2k-1}\) for the displayed anisotropic norm on the checked
round setting, and the cubic derivative test for literal live
(4.9). These are scoped implementation observations, not
independent disproofs of Fine's stability statement.
The additional normalization discrepancy checked by E48 and
E51 merits one sentence in the same canonical subsection.
Combining the one-half in the component formula following
(3.1) on p. 18 with Lemma 4.6 gives
\(L_0(\xi\wedge\iota_uF_0)=\tfrac12\xi(u)I\) at perfection.
The printed Corollary 4.7 on p. 34 omits this factor.
The trace-free projection kills either scalar term.
The frozen manuscript already uses the factor one half at line 2988.
[E47–E48 source record][stabilitysources] · [E51, symbol check][e51].

## Taylor and Koch–Lamm

Taylor's canonical `Taylor1991Nonlinear` entry identifies
Michael E. Taylor, *Pseudodifferential Operators and Nonlinear
PDE*, Birkhäuser Boston, Progress in Mathematics 100 (1991),
DOI 10.1007/978-1-4612-0431-2 for the original monograph.
The checked file is the undated repaginated author-hosted
`NLIN.pdf`. Its URL directory `2018/04` is not a revision
date. No local reading copy, byte count or digest is asserted.
The 2011 second-edition `Partial Differential Equations III`
chapter cited by Fine remains a metadata-only separate pointer,
with its cited Proposition 8.1 not inspected or imported.

E49 and the lead rechecked §3.1, (3.1.18)–(3.1.20), printed
p. 66, and §3.6, Proposition 3.6.A/(3.6.14), p. 94.
The first is used for bounded first-jet values, smooth
coefficient derivative bounds above the Sobolev exponent,
and the controlled smoothing remainder. The second is used
with \(p=2,\sigma=0,s=k\) for the fixed scalar-principal
operator in charts and the indicated Lipschitz multiplier.
These are input tame estimates. The jet cutoff, \(H^6\)
lifespan and comparison are derived in E49.
E52 records these two passages, Proposition 3.1.A, and
§7.3 (7.3.1)–(7.3.2), Propositions 7.3.A–B, printed
pp. 147, 149, as fresh selected remote checks.
E55 also rechecked pp. 66 and 94.
E50 uses §7.3 through E29's existing local smooth
construction and reports no new Taylor inspection.
The negative Hermitian symbol condition for the smooth
systems and the \(H^s\) thresholds \(s>n/2+2\) in 7.3.A
and \(s>n/2+1\) in the first-jet quasilinear 7.3.B are
kept separate from the E29 compact-bundle proof. Chapter 7's
presentation starts on a torus. Section 6.10 cites the Chapter 3 estimates at
lines 3127–3128. Its manual bibliography note at line 5107
still describes the consulted text as “Chapter 7.”
The shared BibTeX note similarly mentions only Chapter 7.
Both should state the actual selected sections §§3.1, 3.6
and 7.3 of the undated host file.
[Canonical local input][taylorlocal] · [Stability Taylor follow-up][taylorst] ·
[E52][e52] · [E55][e55].

For `KochLamm2015`, the final journal metadata are
*Mathematica Bohemica* 140(4), 457–477 (2015),
DOI 10.21136/MB.2015.144463. The inspected source is
arXiv:1310.3658v1 dated 14 October 2013. The published
PDF was unavailable on the earlier checks and the publisher
metadata do not certify its theorem text. No local reading
copy is recorded. The canonical passages distinguish Theorem
1.1, pp. 2–3, for the scalar Euclidean problem with locally
small oscillation and controlled coefficients, from the
system/manifold qualifications in §§4.1–4.2. The parameter
argument informs the adapted proof in E42. The compact-bundle
estimates and completed norms are separately derived.
Section `subsec:rough-local`, at line 2589, names the inspected
preprint's §§2–4. E63 takes its parameter/data method through
E42, without inspecting Koch–Lamm anew or attributing a
finite-order Lipschitz estimate for this system to that source.
For exact inherited passage pointers, retain E44's
(2.1)–(2.3) on printed p. 3 and §3 pp. 6–7, with §§4.1–4.2
pp. 7–8 for the source qualifications. No new source entry
is needed. [Koch–Lamm canonical record][kl] · [Rough-local follow-up][roughsrc] ·
[Critical follow-up][critical].

## Unimported pointers and other later consumers

R21 Hitchin, R22 LeBrun and R23 Horan are unique canonical
bibliography entries. E47 identified them through Fine v2
Theorems 3.11/3.13 and bibliography p. 51. Hitchin's
1980 *Linear field equations on self-dual spaces* has Oxford
and author-list metadata and an identified DOI, with the
actual Theorem 4.1(ii) uninspected. LeBrun's 1988 article is
metadata-checked through his list and Fine entry 25. Horan's
1996 article is a discovered Fine entry 20 pointer.
The candidate LeBrun and Horan DOIs remain unverified and
are not fields in their canonical entries. The actual
theorem text and full hypotheses remain unread for all three,
and no local copies or new retrievals are claimed.
The `AHS1978` citation is the separate coauthored paper,
not the Hitchin rigidity pointer.
[Canonical pointer scope][pointers].

E53–E54 and E56/E58 derive and audit the flat Fourier,
Lorentz and product estimates. E57/E61 derive and audit
the fixed compact estimate, drawing on the displayed
E41 Gårding argument and the flat dyadic inputs; they do
not invoke a new external maximal-regularity theorem.
E59 uses the E14/E03A geometric conventions and E53–E54
estimates, with E26 supplying the inherited Fine convention.
E60/E64 use the previously assessed E29, E36, E42 and E57
results through the displayed critical and weak–smooth
arguments. E62 uses the named \(H_{\rm crit}\) premise
from its own frozen request and the established stability
and geometric comparisons. E63 uses E42 for its finite-order
smoothing consequence. E65 is the fresh Fine reinspection
in this group, with the passages listed above.
No further primary theorem import appears in these packets.
These critical results are note-level consumers in the
frozen 67-page manuscript checkpoint, whose §6.10 is the
separate smooth small-value round stability integration.
[Critical follow-up][critical].

## Bounded record corrections

- **Manuscript and shared BibTeX**. Expand the
  `Taylor1991Nonlinear` consultation note to the selected
  §§3.1, 3.6 and 7.3 of the undated host file. At the
  Hessian/operator comparison in §6.10, a pinpoint
  `Fine2011` citation to (3.1)–(3.3), (4.5), (4.7)
  and Proposition 4.12 would identify the formula dependence
  more directly than the preceding general §4.3 citation.
  The symbol comparison can similarly point to Lemmas 4.6
  and 4.9 while retaining the displayed round derivation.
- **Canonical shared source annotation**. In
  “Round stability implementation checks,” add the scoped
  Corollary 4.7 factor and explicit E48/E51 evidence links.
  In “Critical path and smoothing follow-up,” link E59/E60/E62/E63
  and add the E64 consumer explicitly. Preserve the fact that
  E62 was conditional in its own packet and that E64 checked
  the exact premise separately. Keep earlier audit statuses
  as dated records.
- **Catalog and branch pointers**. Add late stability and
  E65 pointers to R15 and the Taylor Chapter 3 use to R19,
  linking the existing shared subsections. The Fine BibTeX
  note can include selected 22 November reinspection alongside
  the existing 21 November provenance. The branch index
  already resolves its assessed stability and critical links.
  Clarify its legacy sentence about E37 by identifying that
  specific source audit as applicability work and linking
  E41–E44 for the separately proved adjusted local result.
  No duplicate entries or changes to the unread-pointer
  classifications are needed.

## Consumed version ledger

The five requested digests matched at consumption. The manuscript
identity is the audited checkpoint even if the lead prepares a later
revision. The packet inspections below are of the selected source
and dependence portions of the notes and returns.

| Frozen input | SHA-256 |
| --- | --- |
| `references/README.md` | `52f729e10dd9bb992c71964a16d0f9693587d209acd28787d4dae0939aec963c` |
| `references/references.bib` | `df6d634e7059202d5881bde84156c1d928d83825a63e82d41b57c51fa0e35a98` |
| `references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md` | `dd2a85dd2d0e5e9975cf4d0826697cda9697240d17d208a4a8b182fc58885ba3` |
| Branch `references/README.md` | `6f34f8585964a03f3a0ab1334a33c82561a8be0112f48a78b532dadbcbdc4866` |
| Branch `manuscript/chiral_curvature_and_metric_evolution.tex` | `64d65b2ecbf964ccfbed70d9d50d3e0f20f89859cb3f49444e3c63bb6445e74b` |

Return names in the following ledger are
`research-progress/handoffs/SP4-CME-E<nn>_RETURN_v1.md`.
Paths are branch relative.

| Packet | Note or review | Note/review SHA-256 | Return SHA-256 |
| --- | --- | --- | --- |
| E47 | `notes/47_ROUND_STABLE_LINEAR_20261122.md` | `ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6` | `719906d49c1d5bb0cdacae184e0ed9641574f10b16eff2cfe5a7051e36e469a7` |
| E48 | `notes/48_FIXED_STABILITY_GAUGE_20261122.md` | `b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b` | `fa408d6216777278045c2b275684f9a631428595af594da3f3f1dcd537506f6d` |
| E49 | `notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md` | `45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16` | `410cef1c6cceea88591a3682ee3352e80513d4b9ad718f30ffba6793833cd599` |
| E50 | `notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md` | `ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf` | `0bb3176779c6752e7cdb1a13bee2da843c467dece41f9df8f7c45988380d3996` |
| E51 | `reviews/E51_STABILITY_INPUTS_AUDIT_20261122.md` | `15f7ef87d7855b5011c53886016fcfe1bd66f050e9b3dd99e25a6d31481d4e4f` | `fb2b1711110a105c3536033bee8d64bd198cd96951c65dbcc0f82bc81c0016bf` |
| E52 | `reviews/E52_STABILITY_TRANSFER_AUDIT_20261122.md` | `a5b19a37220c701154725ab7e2ca280a37a829aac06ae8b7a16203cdf9317a61` | `c687c8cf5586b5c3c4e143f2a559813d6ea5760baf70a2f1294bcb75e6f00487` |
| E53 | `notes/53_CRITICAL_FINITE_P_HEAT_20261122.md` | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` | `b73c227a964a95d5c541cf1591df162998d88f219457e420aaa290e896ae0e6c` |
| E54 | `notes/54_CRITICAL_QUASILINEAR_MODEL_20261122.md` | `34924ef4445b1fc479b79c0f9d5452243c12ae399220e1e077b6e21bfed8073a` | `e2554bff69967bc1d02f54114021cddcff04e0cec0f86b9e0640ce0b15df0660` |
| E55 | `reviews/E55_STABILITY_MANUSCRIPT_AUDIT_20261122.md` | `d0b4ec834da38ce9eca157076edd410bf9da660f1d3e3fd9f13f130b2a3d4f75` | `3f7d212eb16976fd81d99c8f721ba0386a2dcb7d209b9c4f0ab34bbea2bb5150` |
| E56 | `reviews/E56_CRITICAL_HEAT_AUDIT_20261122.md` | `f74a9f546e40cb1881ba8e7185f69b1507c0bd50329a9264eaf17185f2185635` | `d470c9d2164359c9501dc58053e0e8676e75f56c7c162f8889cdf7a8a467d8c8` |
| E57 | `notes/57_COMPACT_CRITICAL_LINEAR_20261122.md` | `8bc1cc7551e137d58324ce9f837c174d0766330f9d61586d14c6c24e4778a3d7` | `d6ee9aecfa23b64ec0cbc5aa2a1a0c638bdc86fa6366549e721f42d05f2151dc` |
| E58 | `reviews/E58_CRITICAL_MODEL_AUDIT_20261122.md` | `1f92833edad402e4c6686d0b3534c13adec43158a7e412d0f5df1e67351bf364` | `8295681e6d8ac338d7b5b60ee23f2b585bed947925a85c3bb90d403d806be77e` |
| E59 | `notes/59_CRITICAL_PATH_STRAIN_20261122.md` | `2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a` | `bd48dd49e56540e7da483d7b6871570028b990bb2ecc6d92c97b261f64222acf` |
| E60 | `notes/60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md` | `c34bf22a1f80092a1ba33b154e4c2b308db1907ad56727099675321865a0246d` | `581fda52cb2fec777e0174f21a89e7df6514b1e8631aa615e039b8c80ca010d7` |
| E61 | `reviews/E61_COMPACT_CRITICAL_AUDIT_20261122.md` | `9b5815acdaf6bc02135d3f19366d7a2ec0f2fd2bbc5cbd007b351f12ad4d090a` | `081c0f2b9ea92eb419dcab58dddbea43952b4710c313f7ceb71d6e4efd082d0c` |
| E62 | `notes/62_GLOBAL_CRITICAL_STRAIN_BUDGET_20261122.md` | `a14e79a0ad8def1deed7af897aa33ebd734e26a3d0d161c95f30c415e82f0026` | `eaf0f4ac3644d66a607e211c9182fe39a984ae0f468f8512a9a1dfe6923762c5` |
| E63 | `notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md` | `427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb` | `a0ad9649693288f9f8a79046b6891617096f919c167deb4f17fe38dfb06ccfc5` |
| E64 | `reviews/E64_COMPATIBLE_CRITICAL_AUDIT_20261122.md` | `f0cf65d86bdbfd2c38ccd6cf25c875376a678f677ee3d86317f24d9d8de628db` | `42eabee252a53d35d7e508fa3eff6b3099792574b3ed6dfab051cd3b2c31e8e4` |
| E65 | `reviews/E65_CRITICAL_STRAIN_AUDIT_20261122.md` | `3b2e04259314e601c5e446a7bd23ced0dae91cd6f3d714559406731a349dc5cb` | `6d3562885044b5310402e13d9ee5829171e501a6aab2cfb426f4d73c78d82649` |

Other read versions were [REFERENCE_WORKFLOW.md][workflow] at
`aa50161913f3d06eaaa892c75fcd39fe05089c084a64eb88785e225c66849a0e`,
the [background provenance][background] at
`839f7dfd6ed536cfe8daa0efa745d7fcd9bbfdce6a19da6d0e700950cafe0be0`,
[E40][e40] at
`78c3bf562e611dc181e4f99693f1abf10e559a0f67742f706ccdcd32af8bd723`,
the [67-page integration record][integration] at
`5e43e3ba6e60db133646f1860342c23c710d79be75921da7a9ef994f321082db`,
the [draft history][history] at
`28684f07cc9d163a46b149778c0fac08d7087875dd38d1e968fa8d1da20081b4`,
and the [combined stability assessment][combined] at
`f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee`.

[req]: ../research-progress/handoffs/SP4-CME-E68_REQUEST_v1.md
[workflow]: ../../../../REFERENCE_WORKFLOW.md
[catalog]: ../../../../references/README.md
[bib]: ../../../../references/references.bib
[branch]: ../references/README.md
[background]: ../../../../references/SOURCE_NOTES_CME_BACKGROUND_20261121.md
[e40]: E40_REFERENCE_AUDIT_20261122.md
[integration]: BROAD_RUN_INTEGRATION_20261122.md#round-stability-checkpoint--67-pages
[history]: ../DRAFT_HISTORY.md
[stabilitysources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#round-stability-implementation-checks
[stabilityassessment]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#assessed-stability-integration-and-audit-reinspection
[combined]: E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[taylorlocal]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#local-parabolic-primary-input
[taylorst]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#taylor-composition-and-commutator-input-for-stability
[e51]: E51_STABILITY_INPUTS_AUDIT_20261122.md
[e52]: E52_STABILITY_TRANSFER_AUDIT_20261122.md
[e55]: E55_STABILITY_MANUSCRIPT_AUDIT_20261122.md
[kl]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#rough-data-source--inspected-preprint-and-publication-metadata
[roughsrc]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#further-use-of-the-same-inspected-parabolic-sources
[critical]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#critical-path-and-smoothing-follow-up
[pointers]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#dirac-rigidity-pointers-discovered-through-fine
