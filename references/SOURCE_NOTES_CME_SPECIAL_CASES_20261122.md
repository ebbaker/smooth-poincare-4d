# Sources for the chiral evolution summary and special cases

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual selected model identifier and effort
are unavailable. Selected primary passages were checked for
SP4-CME-EXPL-E01 and SP4-CME-SPECIAL-B01; this is not a comprehensive
novelty review or an audit of the proofs.

The consuming [explanation](../papers/investigations-1/01_chiral_metric_evolution/brainstorm/explanations/RESEARCH_SUMMARY_20261122.md)
uses the working manuscript with SHA-256
4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0.
Repository HEAD at inspection was
69d602ad580314d68c2b336fda1ddcffca541482; the worktree already contained
editorial changes. The manuscript was not revised in this task.

| Source | Checked passage and inspection level | Consequence and limits |
| --- | --- | --- |
| Fine2011, [arXiv:1111.5005v2](https://arxiv.org/html/1111.5005v2), 29 November 2011 | Full-text HTML passages: Definitions 1.3–1.6, Conjecture 1.7, Theorems 4.3 and 4.11 | Definite reconstruction, perfect ASD Einstein geometry, short-time flow, and stability under sufficiently small Sobolev L²_k perturbations of a given perfect connection on a compact four-manifold, k ≥ 3. Bundle automorphisms include the relevant gauge and base freedom. The conjecture of a positive definite connection implying a sphere/projective-plane classification is explicitly conjectural in this source. Its curvature-map orientation convention must be translated before comparison with F = −KΣ in the manuscript. |
| FineKrasnovPanov2014, [published paper](https://nyjm.albany.edu/j/2014/20-18v.pdf), New York J. Math. 20 (2014), 293–323 | Published PDF text, §4.3, journal pp. 306–309: Conjectures 4.8 and 4.10; Theorems 4.9, 4.11, 4.12 and 4.14. Also consulted the [v3 HTML](https://arxiv.org/html/1312.2831v3), dated 7 August 2016, without conflating its version with publication. | The metric condition C > 0 and C² > BBᵀ is an existing conjectural sphere/projective-plane target. The weaker established conclusion quoted there is a homeomorphism classification. The additional ASD or Einstein situations have rigidity results. Their volume-functional flow is distinct from Fine's defect-functional flow used in the manuscript. |
| Hamilton1986, [primary article](https://doi.org/10.4310/jdg/1214440433), J. Differential Geom. 24 (1986), 153–179 | Indexed opening theorem from the primary PDF; direct PDF opening returned an iframe, so no complete proof or page-layout inspection | Positive curvature operator on a closed four-manifold yields a diffeomorphism to S⁴ or RP⁴. A homotopy four-sphere is therefore standard. This is already a four-dimensional Hamilton special case. |
| ChenTangZhu2012, [arXiv:0810.1999v1](https://arxiv.org/html/0810.1999v1), 11 October 2008; published J. Differential Geom. 91 (2012), 41–80 | Full-text HTML Introduction, Main Theorem, and discussion of the Hamilton/Chen–Zhu theorem; published title/metadata checked in the journal reading copy | Closed four-manifolds with positive isotropic curvature have a smooth connected-sum classification. For a homotopy sphere, the fundamental-group alternatives are excluded and the result is the standard S⁴. Full PIC is distinct from positivity in just one chirality. |
| ChangGurskyYang2003, [published paper](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf), Publ. Math. IHÉS 98 (2003), 105–143 | PDF text, Theorem A and norm-convention remarks, journal p. 107, including the positive Yamabe hypothesis. The experimental arXiv HTML truncates before the theorem's hypotheses and was not used to recover them. | A positive Yamabe conformal class with total four-index Weyl energy below 16π²χ implies S⁴ or RP⁴. In the manuscript's operator norm, on a homotopy four-sphere this becomes E₊ < 4π². The reduction uses χ = 2, τ = 0 and the factor four between norms. It does not identify E₊ with the nonlinear connection defect energy. |
| FinePanov2014, [arXiv:1407.0840](https://arxiv.org/html/1407.0840), first submitted 2014 | Full-text HTML Definitions 1.1–1.2, Theorem 1.3, Corollary 1.5 | A faithful circle action on a closed four-manifold, lifted by fiber isometries to the rank-three bundle and preserving a definite connection, forces S⁴ or oppositely oriented CP². Thus circle symmetry is not an unoccupied special-case classification target. No claim is made here about convergence of Fine's flow under that symmetry. |
| Maximo2011, [arXiv:0911.1827v2](https://arxiv.org/html/0911.1827), 1 December 2009; Proc. Amer. Math. Soc. 139 (2011), 675–685 | Full-text abstract and Introduction; publication metadata checked in the author's [published reading copy](https://www2.math.upenn.edu/~dmaxim/nonnegricci2011.pdf) | Nonnegative Ricci curvature is not preserved on general closed manifolds in dimension four and higher. The examples are Kähler; this is not a counterexample on a homotopy four-sphere and does not disprove any sphere recognition conjecture restricted to such manifolds. |
| RichardSeshadri2014, [arXiv:1311.5256v2](https://arxiv.org/html/1311.5256v2), 29 January 2014 | Full-text Introduction, Proposition 1.2, Proposition 1.4 and discussion following it | Half PIC is preserved by Ricci flow. The cited rigidity is for Einstein metrics; the topological observation without Einstein is b₂⁺ = 0. Neither is a general smooth classification theorem for half-PIC homotopy spheres. Used to screen the chiral curvature proposal. |
| GurskyViaclovsky2015, [arXiv:1105.4648v2](https://arxiv.org/html/1105.4648v2), 20 April 2013 | Theorem 3.10, equation (3.41), read in full-text HTML | The Einstein TT quadratic-curvature Hessian factorization is established background. The manuscript derives its round chiral specialization from its connection identities. This reading did not certify novelty of that derivation. |

All inspections above occurred on 22 November 2026. Remote reading copies
were not saved to the repository; no new local PDF provenance or hash is
claimed. The existing background and introduction source records remain
canonical for their earlier inspections.

The targeted searches did not identify a general resolution of the positive
definite connection sphere conjecture or an intrinsic theorem based only on
small uniform Q − I. That is a search result, not proof of novelty or a
complete current literature audit. Positive Ricci curvature alone was not
found to settle the homotopy-four-sphere case in the sources inspected.

For the norm conversion used above, let W_op denote the Weyl endomorphism.
Then
\[
\int |W_{\rm tensor}|^2\,dV
=4\int(|W^+_{\rm op}|^2+|W^-_{\rm op}|^2)\,dV
=8\mathcal E_+
\]
when τ = 0. Theorem A's bound is 32π² when χ = 2, giving E₊ < 4π².
Positive Yamabe constant means the particular conformal class contains a
metric of positive scalar curvature; it is not silently inferred from small
Weyl energy.

## Follow-up: nonlinear flow and singularity evidence

Checked on 22 November 2026 for SP4-CME-EXPL-E02 and SP4-CME-FLOW-B01,
with the same manuscript hash and unavailable actual model/effort metadata.
The consuming [follow-up explanation](../papers/investigations-1/01_chiral_metric_evolution/brainstorm/explanations/NONLINEAR_FLOW_AND_SINGULARITIES_20261122.md)
distinguishes possible failure mechanisms from demonstrated trajectories.

Re-read Fine2011 v2, §4.2 (Theorems 4.3 and 4.10), §4.3
(Theorem 4.11 and Proposition 4.12), and the end of §1.6. The general
short-time result is not restricted to perturbations of a perfect
connection. The gauge-fixed local stability uses a positive definite
elliptic linearization at a perfect connection and closeness in a fixed
background Sobolev norm. The end of §1.6 explicitly leaves exclusion of
nonperfect connection-energy critical points unresolved in that source;
the exclusion result for definite triples in §5 is not the same theorem.

Targeted searches combined "definite connections", "gradient flow",
"singularities", "finite time", "critical points" and Fine's exact paper
title. They did not identify a general singularity classification or an
arbitrary-data convergence theorem for this precise defect-functional
flow. Search results included the distinct volume-functional formulation
and hypersymplectic flow; their conclusions were not imported. Fine's
[institutional project description](https://cvchercheurs.ulb.ac.be/Site/projet/4441UK.php)
also lists singularity formation as a research topic, but has no verified
publication date and is not used to establish current theorem status.
This is a bounded source check, not a claim that a full literature search
proves absence of further results.

## Activated-run flow source reinspection — 22 November 2026

The selected lead re-read Fine v2 Definitions 1.3–1.6, §4.1 Proposition 4.2,
§4.2 Proposition 4.5 and Theorems 4.3/4.10, and §4.3 Theorem 4.11 in the
primary arXiv HTML. These supply the definite-connection equation,
gauge-adjusted parabolicity, short-time theorem and the specific strong
near-perfect stability regime. The new nonlinear calculation uses the
manuscript's independently defined internal norm and clock. Direct source
clock comparison requires translating Fine's Killing norm as well as the
reconstructed volume, as flagged in the activated E01 audit. This source
check establishes no arbitrary-data preservation or convergence theorem.


## Broad-run static calibration — 22 November 2026

For Edward B. Baker III with OpenAI assistance; actual selected lead settings unavailable. E13 helper configured gpt-6.2-sol/ultra and lead both inspected the published Chang–Gursky–Yang PDF, printed p.107 (Theorem A, eq. (0.3), Remarks 1–2). The target uses the positive Yamabe constant of the given conformal class and the four-index Weyl norm; the latter is four times the squared curvature-operator norm. The [E13 note](../papers/investigations-1/01_chiral_metric_evolution/notes/15_STATIC_TRANSPORT_SPHERE_CRITERION_20261122.md) checks all hypotheses for the supplied transport threshold. Its conclusion is an application of the existing theorem; no new sphere classification, initialization or flow convergence is asserted. The [lead assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md) records the separate mathematical checks.

## Endpoint heat source and Fine version check — broad-run follow-up

22 November 2026, America/New_York. Lead source inspection; actual model/effort unavailable. Prepared for Edward B. Baker III with OpenAI assistance.

Matthias Ludewig, *Strong short-time asymptotics and convolution approximation of the heat kernel*, Annals of Global Analysis and Geometry 55(2) (2019), 371–394, DOI 10.1007/s10455-018-9630-4. The version of record was published online 22 September 2018; the issue date is 4 March 2019. Inspected version: final publisher text, selected passages (not full reading), on 22 November 2026.

Ludewig’s [publisher text](https://link.springer.com/article/10.1007/s10455-018-9630-4), Theorems 1.1 and 3.5, was opened and inspected. The first applies to Laplace-type bundle operators on a compact Riemannian manifold, uniformly on compact pairs outside the cut locus, including derivatives of the Gaussian quotient. The second requires formal self-adjointness and gives a global Gaussian upper bound with time power n+2j+m+l+1. E22 uses the first near the diagonal and absorbs the second’s additional power with exponential decay away from it. No moving-metric uniform kernel statement is imported. The record is Ludewig2019 in the shared bibliography. Consuming claim: [E22 round Lorentz heat estimate](../papers/investigations-1/01_chiral_metric_evolution/notes/22_ROUND_LORENTZ_HEAT_20261122.md), manuscript subsection “Temporal endpoint estimates and the principal-term gap”. E40 additionally checked final PDF pp.372,374–375,382. The MPG alternate PDF returned 403; the [final publisher PDF](https://link.springer.com/content/pdf/10.1007/s10455-018-9630-4.pdf) was accessible. No reading copy was retained by this run, so no local path, byte size or stored-byte hash is claimed.

Later same-date reinspection for [B61/E112](../papers/investigations-1/01_chiral_metric_evolution/research-progress/handoffs/SP4-CME-E112_REQUEST_v1.md): the lead read publisher HTML Theorem 1.1, (1.1)–(1.3), and §2's Laplace-type sign convention. The proposed fixed-round application uses expansion order zero and spatial derivatives through two on compact pairs away from the cut locus. The required Hessian bounds and own-scale limit are to be derived, not quoted as an evolving-metric theorem. Same final version; no new reading copy or whole-paper inspection. E112 independently rechecked the same final publisher HTML on 22 November 2026: §1, (1.1)–(1.3), Theorem 1.1 and the subsequent covariant-derivative convention, then §2's opening sign convention; publisher metadata confirmed the same online/issue dates. For the fixed rank-five real bundle connection Laplacian on compact round S4, it uses expansion order zero, no time or y derivative, and x derivatives through order two on a compact pair set away from the cut locus. Complexification is harmless if the theorem is read on Hermitian bundles. It derives the full Hessian Gaussian bound and rescaled own-annulus limit, rather than importing them for varying geometry. The new consumer is [E112, local round differentiated heat kernel](../papers/investigations-1/01_chiral_metric_evolution/notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md). No Theorem 3.5 use or inspection is claimed for E112, and no reading copy was retained. E114 independently reinspected the same theorem, derivative convention and §2 definition on the same date, with the same final HTML metadata and no retained PDF. Its [audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E114_ROUND_MULTISCALE_BUDGET_AUDIT_20261122.md) verifies the application to the actual round linearization, including the full ordered Hessian and fixed geometric hypotheses.

Later consumers, recorded 22 November 2026 after E144: manuscript subsec:round-multiscale and subsec:nonlinear-unbounded-budget, checked in [E120](../papers/investigations-1/01_chiral_metric_evolution/reviews/E120_MULTISCALE_MANUSCRIPT_AUDIT_20261122.md) and [E126](../papers/investigations-1/01_chiral_metric_evolution/reviews/E126_NONLINEAR_BUDGET_MANUSCRIPT_AUDIT_20261122.md). The [E123/E124 nonlinear transfer](../papers/investigations-1/01_chiral_metric_evolution/reviews/E123_E124_NONLINEAR_MULTISCALE_ASSESSMENT_20261122.md) combines that fixed-bundle Theorem 1.1/Section 2 input with the separately proved uniform parabolic Taylor remainder. Theorem 3.5 retains its separate E22 role. No evolving-geometry heat theorem or additional primary inspection is imported by the nonlinear transfer.


Fine’s [arXiv record](https://arxiv.org/abs/1111.5005) identifies v2, revised 29 November 2011, as the current listed version. The [author’s publication list](https://joel.fine.web.ulb.be/papers.html) lists this work by its arXiv identifier, without a journal entry; the distinct Fine–Krasnov–Panov paper has a NYJM entry. Accordingly, this audit refers to the Fine preprint, and does not describe its theorem as independently verified publication evidence. E26/E27 examine a specific metric-dependent-adjoint issue in its displayed gauge formula; the existence and stability statements must remain attributed to that source while the operator audit is assessed.

The same Fine v2 passages now supply the source comparison for E26–E30, E34 and E36, especially Proposition4.5, Lemma4.9 and the §4.2 local-gauge formula. The [E26–E27 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E26_E27_GAUGE_ASSESSMENT_20261122.md) distinguishes the literal live-adjoint derivative-order issue from the intended local-existence result; the [E28–E29 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md) supplies the corrected implementation. Manuscript consumers are `subsec:fixed-adjoint` and `subsec:coupled-curvature`. The source works with smooth definite connections on a compact oriented Riemannian four-manifold and its native negative-Killing pairing; the manuscript’s metric/time conversion is an explicit separate calculation. This local reinspection does not verify the distinct stability-gauge implementation.

An existing ignored reading copy, [references/1111.5005v2.pdf](1111.5005v2.pdf), was re-identified on 22 November 2026: 447930 bytes, SHA-256 `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8`. Its earlier provenance is retained in the [21 November background record](SOURCE_NOTES_CME_BACKGROUND_20261121.md); the original retrieval date and transfer URL remain unknown. The stable primary version URL is [arXiv v2 PDF](https://arxiv.org/pdf/1111.5005v2), which identifies the source, not a newly inferred original download event. No overwrite or new retrieval is claimed.

## Local parabolic primary input

Michael E. Taylor, *Pseudodifferential Operators and Nonlinear PDE*, Birkhäuser Boston, Progress in Mathematics100, 1991, DOI [10.1007/978-1-4612-0431-2](https://doi.org/10.1007/978-1-4612-0431-2). Inspected version: undated, repaginated author-hosted text; the original publication year is not a revision date for that file. The title/contents and author listing provide no revision identifier or date. Selected passages inspected 22 November 2026; not a full reading. No local reading copy was retained, so size and stored-byte hash are unavailable.

Root inspected Taylor’s [author-hosted revised text](https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf), Chapter7 pp147–149. Equations7.3.1–2 and Proposition7.3.A explicitly concern vector-valued systems and a negative Hermitian principal part, including nonsymmetric matrices; Proposition7.3.B gives the first-jet quasilinear specialization. The chapter initially works on a torus. E29 supplies a smooth-data compact-bundle extension with finite charts and fixed elliptic spectral projections; it is identified as a derivation rather than quoted as part of the source theorem. The Fine-cited 2011 edition Proposition8.1 was inaccessible and is not claimed inspected. The accepted application is smooth short-time theory only; no continuous endpoint restart is imported. Consuming notes: [E29](../papers/investigations-1/01_chiral_metric_evolution/notes/29_LOCAL_PARABOLIC_INPUT_20261122.md), [E33 audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E33_INTEGRATION_AUDIT_20261122.md), and the smooth application assessed after [E36](../papers/investigations-1/01_chiral_metric_evolution/reviews/E36_COUPLED_SYSTEM_ASSESSMENT_20261122.md). Manuscript labels: `subsec:fixed-adjoint` and `subsec:coupled-curvature`. The inspected file starts Chapter7 at printed p.141; the original published chapter is pp.146–162. Preserve this pagination distinction. Fine’s separate citation to *Partial Differential Equations III*, second edition, Chapter15 (DOI [10.1007/978-1-4419-7049-7_3](https://doi.org/10.1007/978-1-4419-7049-7_3)), was checked only at the metadata level; its Proposition8.1 was not read and is not imported.


## Finite-time recognition reinspection

On 22 November 2026, E31 and E33 reopened the same final Chang–Gursky–Yang version and checked Theorem A, equation(0.3), Remarks1–2 on printed p.107. The canonical version/metadata entry above is unchanged. The new consumers are [E31](../papers/investigations-1/01_chiral_metric_evolution/notes/31_L2_TRANSPORT_SPHERE_CRITERION_20261122.md), the [E30–E32 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E30_E32_RECOGNITION_ASSESSMENT_20261122.md), and manuscript `subsec:finite-time-sphere`. The hypotheses remain a smooth closed real four-manifold, positive Yamabe constant of the specified conformal class, and the strict full-tensor Weyl integral bound. The homotopy-sphere specialization uses chi=2, tau=0 and simple connectivity. Selecting a time slice is the separate E32 derivation, not a source theorem about Fine’s flow. No new local reading copy was retained.

## Rough-data source — inspected preprint and publication metadata

Herbert Koch and Tobias Lamm, *Parabolic equations with rough data*, Mathematica Bohemica140(4) (2015),457–477, DOI [10.21136/MB.2015.144463](https://doi.org/10.21136/MB.2015.144463). The [official journal record](https://dml.cz/handle/10338.dmlcz/144463) verifies final publication metadata. Inspected text: [arXiv:1310.3658v1](https://arxiv.org/pdf/1310.3658v1), submitted 14 October 2013, selected passages read 22 November 2026 by lead and E37 helper. Published PDF access timed out from the official record/direct link; a mirror was unavailable. No claim of inspecting or comparing the final journal theorem text is made. Remote inspection only: no retained local copy, size or stored-byte hash. BibTeX key KochLamm2015 retains the exact inspected version in its note.

Checked passages: preprint Theorem1.1, pp.2–3; Sections2–3, pp.4–7; Sections4.1–4.2, pp.7–8; and Theorem5.3, p.12. The scalar divergence-form theorem assumes uniform parabolicity, Lipschitz value dependence, controlled quadratic gradient forcing, bounded smooth coefficient derivatives and small local oscillation at a chosen time scale. The systems extension requires Gaussian and Calderón–Zygmund inputs; it distinguishes rank-one positivity for small L-infinity perturbations of uniformly continuous data from the stronger integral coercivity used for BMO perturbations. Uniqueness uses the fixed-point class or the specified small sqrt(t)||Du||infinity condition, not continuity alone. Only positive-order derivative estimates are used; local oscillation cannot bound the absolute zeroth-order size. The uniform-manifold and Ricci–DeTurck applications do not automatically prove the required strongly coupled bundle construction.

Consumer: [E37 exact source audit](../papers/investigations-1/01_chiral_metric_evolution/notes/37_ROUGH_DATA_SOURCE_TEST_20261122.md), under [B30](../papers/investigations-1/01_chiral_metric_evolution/brainstorm/notes/B30_ROUGH_DATA_SOURCE_TEST_20261122.md), for potential rough-data theory of the E36 connection–curvature system. At that E37 inspection, applicability remained conditional on the compact-bundle linear estimates and construction; the later E41–E44 assessment supplies those branch proofs. No continuous-data existence theorem for that system, compatibility passage or unadjusted endpoint restart is imported. The source’s separate weaker spectral paragraph prints a sign inconsistent with its positive diffusion convention; E37 consistently tests the actual Fourier generator −P(xi). Inspection level: checked passages and theorem-hypothesis map, not full reading or independent verification of the source proofs.


### Weighted derivative reinspection for B63/E119

On 22 November 2026, [E121](../papers/investigations-1/01_chiral_metric_evolution/reviews/E121_ROUGH_DERIVATIVE_SOURCE_AUDIT_20261122.md) rechecked arXiv:1310.3658v1 through indexed PDF text and [same-version HTML](https://arxiv.org/html/1310.3658v1). Locators: (1.1)/Theorem 1.1, pp.2–3; (2.1)–(2.3), p.3; norms, pp.4–5; §3, pp.6–7; §§4.1–4.2, pp.7–8. The lead separately read those HTML passages and the official metadata. Page-image requests failed; no retained copy. The official journal PDF retry timed out, so final theorem text remains unchecked.

The checked scalar theorem gives positive-order parabolic derivative bounds; absolute zeroth-order control cannot follow from local oscillation. Systems still require the stated linear estimates. The parameter method motivates [E119](../papers/investigations-1/01_chiral_metric_evolution/notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md), but the checked passages do not supply its uniform weighted second datum derivative. That compact-bundle bound requires a separate derivation and audit; current status is in the investigation register. The earlier Y0 scaling qualification remains. For the §3 definition v(t,x)=u(st,x+ta), direct differentiation gives v_t−sΔv−a·∇v=sΓ(v)|∇v|²; v1's displayed transformed equation instead has a plus drift and omits the s factor. The branch uses exact conjugation, not that display's coefficients. Inspection is selected passages, not a full proof audit. The later [E119/E122 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md) accepts the branch derivation of the fixed-space uniform remainder. The manuscript subsection “A uniform parabolic Taylor estimate” cites this source for the method and proves its additional scale-uniform mixed-datum estimate explicitly. [E123/E124](../papers/investigations-1/01_chiral_metric_evolution/reviews/E123_E124_NONLINEAR_MULTISCALE_ASSESSMENT_20261122.md) consumes that branch estimate for the nonlinear family. These are new consumers of the same inspected version, not new primary inspections. The later [E128/E130 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E128_E130_MIXED_COEFFICIENT_ASSESSMENT_20261122.md) extends the branch parameter argument to the full third weighted spatial derivative using one datum derivative. Its separate dyadic coefficient-product proof is internal and is not attributed as a theorem from this source.

The [E129/E132 head](../papers/investigations-1/01_chiral_metric_evolution/reviews/E129_E132_INTRINSIC_HEAD_ASSESSMENT_20261122.md) and [E131/E134 whole-time endpoint](../papers/investigations-1/01_chiral_metric_evolution/reviews/E131_E134_WHOLE_TIME_ENDPOINT_ASSESSMENT_20261122.md) consume that branch third-jet estimate and the separate mixed-product proof. The manuscript section “The intrinsic Lorentz endpoint in the round value basin” gives these derivations and the finite-order tail argument explicitly. This adds consumers of the same method, with no new primary-text inspection, version, retained copy or imported endpoint theorem. The published-text access limitation and all preceding qualifications remain.

### Further use of the same inspected parabolic sources

On 22 November 2026, E41 rechecked Koch–Lamm v1 §2, pp.4–5, and E42 rechecked §§2–4 and Taylor’s undated host-file §7.3, printed pp.147,149. These are additional selected-passage uses of the canonical versions above; no new local copies or new publication versions were obtained. E41 defines its own explicitly dimensionally scaled X/Y norms and derives the fixed compact-bundle linear estimates. The extracted v1 upper Y0 expression has different printed scaling, so literal equality with that formula is not asserted. E42 adapts the source’s parameter method in its own fixed compact-bundle smooth-completion spaces, conditional on the E41 estimates, and uses the already checked Taylor smooth local construction only to identify each smooth compatible approximation. Consuming notes: [E41](../papers/investigations-1/01_chiral_metric_evolution/notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md) and [E42](../papers/investigations-1/01_chiral_metric_evolution/notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md). E43/E44 are focused proof audits. Their presence alone does not upgrade the results; the sole register and lead assessments carry disposition.


On 22 November 2026, E43 rechecked Koch–Lamm v1 §2, printed pp.4–5; E44 checked its parameter identities (2.1)–(2.3), p.3 and §3, pp.6–7, and Taylor’s undated host-file pp.141,147–149. Same canonical versions, selected passages only, no retained new copy. The [combined lead assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md) accepts the separately derived compact-bundle linear estimates and small continuous-data adjusted construction, with closed-time-cylinder source completion and a uniform-trace qualification. E44 supplies the smooth-linear-evaluation density bridge and discloses its writer’s participation in E41. New manuscript consumer: `subsec:rough-local`, including Lemma `lem:rough-linear` and Theorem `thm:rough-local`. The source contributes the contraction and parameter method; the bundle kernel, exact norm scaling, compatible approximation and constraint passage are this investigation’s derivations. No unadjusted endpoint continuation, invariant small-data region or novelty is inferred.


### Fixed-reference stability follow-up

On 22 November 2026 the lead re-read Fine v2 printed pp.37–40, Theorem4.11, equation(4.9), Proposition4.12 and Theorem4.13, in the existing local copy identified above; the arXiv record was rechecked and still lists v2,29November2011. No new PDF retrieval occurred. The source states smooth/Sobolev stability near a supplied perfect connection on a compact four-manifold, using a separate live-metric stability gauge. [B35](../papers/investigations-1/01_chiral_metric_evolution/brainstorm/notes/B35_FIXED_STABILITY_GAUGE_20261122.md) separates that gauge’s nonlinear order, the exact positive linear operator and the half-line trace estimate. E47 and E48 are bounded checks, initially on round S4, of a newly specified gauge with fixed reference differential operators. Their outcome was pending at this reinspection; the later E47/E48 assessment below records their disposition. This inspection itself does not certify the source implementation or transfer stability to continuous data.


E46 rechecked the same Koch–Lamm v1 §2, printed pp.4–5, and Taylor host-file §7.3, Propositions7.3.A–B, printed p.149, on 22 November 2026 for the rough-local manuscript integration. No new version or local reading copy was acquired. The resulting [integration audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E46_ROUGH_MANUSCRIPT_AUDIT_20261122.md) led to a direct Taylor citation at the smooth-compatible comparison; the rough existence theorem is not attributed to Taylor.


### Round stability implementation checks

E47 and E48 inspected the same existing Fine v2 PDF on 22 November 2026. E47 checked Definitions1.4–1.5 (pp.4–5), Proposition1.12 (p.9), Lemma2.2 (p.12), (3.1)–(3.3) (pp.17–18), Lemma3.5 and §3.4 (pp.21–24), Theorems3.11/3.13 (§3.6,pp.25–29), Proposition4.2 (p.30), (4.5) and Lemma4.9 (pp.32–35), and §4.3 (pp.37–40). E48 also checked Lemma3.2/(3.4), Lemma4.1 and equations(4.1)–(4.4), Lemma4.6 and Corollary4.7. The notation on pp.28,33,38–40 was visually checked against rendered original pages. No source replacement or new retrieval was made; prior byte hash/provenance remain above.

The [lead assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E47_E48_STABILITY_INPUTS_ASSESSMENT_20261122.md) accepts the exact reference Hessian factor P0=sqrt(8) tf L0, the fixed-round positive operator and direct half-line estimate, and a separately specified fixed-reference nonlinear gauge with quadratic Sobolev remainder. The source’s Proposition4.12 proof recalls an inverse square root where definition(4.5) uses the positive square root; their kernels coincide. The displayed P_2k norm on pp.39–40 has trace H^(2k−1), so the printed isomorphism onto forcing plus H^k is not onto for k≥3. E48 computes a nonzero cubic derivative for the literal live expression(4.9) away from the reference. These are scoped implementation findings, not a refutation of the stability conclusion. The accepted linear kernel argument here is restricted to round S4 and derives its Dirac vanishing directly; no new general perfect-manifold theorem is imported. Consumers: notes47/48, their assessment and proposed E49 stability contraction.

The preceding normalization comparison also includes a scoped factor discrepancy checked by [E48](../papers/investigations-1/01_chiral_metric_evolution/notes/48_FIXED_STABILITY_GAUGE_20261122.md) and [E51](../papers/investigations-1/01_chiral_metric_evolution/reviews/E51_STABILITY_INPUTS_AUDIT_20261122.md): the component formula following (3.1), p.18, and Lemma4.6 give L0(xi wedge i_u F0)=xi(u)I/2 at perfection. Corollary4.7, p.34, omits the factor one-half. Both scalar matrices vanish after trace-free projection, so this observation does not invalidate that projected symbol argument.

### Dirac rigidity pointers discovered through Fine

On 22 November 2026, Fine v2 Theorems3.11/3.13 and bibliography p.51 identified the following related sources. They are recorded immediately for reference-workflow compliance, but no independent theorem from them is used: E47 derives round vanishing by the explicit twisted Dirac square. Category, full theorem hypotheses, constants and exact printed theorem pages in these three primary articles remain unverified unless stated below. No local copy was retained; retrieval size and hash are unavailable.

- R21, Nigel J. Hitchin, *Linear field equations on self-dual spaces*, Proc. R. Soc. Lond. A370(1741) (1980),173–191, DOI10.1098/rspa.1980.0028. Metadata checked in the [Oxford archive record](https://ora.ox.ac.uk/objects/uuid:941036fb-18aa-4688-9b20-95dd200b33ff) and [author publication list](https://people.maths.ox.ac.uk/hitchin/files/pubs.html). Fine points to Theorem4.1(ii) for a Dirac/twistor correspondence; that primary theorem has not been independently inspected here. DOI opening failed. Search exposed an abstract and a scholar-hosted PDF pointer, without a full-text/theorem review.
- R22, Claude LeBrun, *A rigidity theorem for quaternionic-Kähler manifolds*, Proc. AMS103(4) (1988),1205–1208. Bibliographic metadata checked against the [author list](https://www.math.stonybrook.edu/~claude/papers.html) and Fine entry25. Fine attributes the positive case of its Theorem3.13 to this source. Candidate publisher DOI10.1090/S0002-9939-1988-0955010-7 was discovered in another primary article’s references, but its opening failed; it is not added as independently verified canonical DOI. No exact theorem imported.
- R23, R. Horan, *A rigidity theorem for quaternionic Kähler manifolds*, Differential Geometry and its Applications6(2) (1996),189–196, identified from [Fine v2](https://arxiv.org/pdf/1111.5005v2), entry20. Fine attributes its negative-case vanishing to this source. A search candidate DOI10.1016/0926-2245(96)89149-2 could not be opened and has not been independently verified against a primary publisher record. Inspection level: discovered bibliographic pointer only; no primary theorem import.


### Taylor composition and commutator input for stability

On 22 November 2026, E49 and the lead rechecked the same undated [author-hosted Taylor text](https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf), §3.1 equations(3.1.18)–(3.1.20), printed p.66, and §3.6 Proposition3.6.A/equation(3.6.14), printed p.94. The composition bound uses 1<p<infinity, 0<s<N, smooth coefficient derivative bounds of order N, bounded input values and its smoothing remainder. The commutator bound applies to an operator of order s>0 in the standard (1,0) class, sigma≥0 and 1<p<infinity, with the multiplier Lipschitz and in H^(s+sigma,p), and the differentiated input in the corresponding lower Sobolev space and L-infinity. E49 uses p=2, sigma=0 and even integer s≥6 in fixed charts. These provide the tame high-order estimates for a fixed cutoff system; the uniform H6 lifespan, compact-bundle construction and comparison with the weighted solution are separately derived. No new version, retained copy or external nonlinear stability theorem was used. E49 remains subject to the lead assessment and focused audit in the sole register.

E50 rechecked Fine v2 §3.2 Lemma3.2/(3.4) and §4.2 Lemma4.4/(4.3)–(4.4) on 22 November 2026 for the exact recovery convention. Its use of Taylor §7.3 remains the inherited smooth comparison through E29. The transfer is explicitly conditional on the separately specified stability hypothesis, with smooth input through the initial slice; neither continuous-time-zero recovery nor convergence of the automorphisms is imported.


### Assessed stability integration and audit reinspection

On 22 November 2026 E51 checked the same frozen Fine v2 PDF and rendered printed pp.33 and 38–40, confirming the scoped square-root and trace-space comparisons above. E52 rechecked Fine printed pp.19/31, Lemmas3.2/4.4 and equations(3.4),(4.3)–(4.4), and the same undated Taylor author file, printed pp.66/94/147/149, including (3.1.15),(3.1.18)–(3.1.20), Proposition3.6.A/(3.6.14), (7.3.1)–(7.3.2), Propositions7.3.A–B. These were selected-passage checks, not new source versions or retained copies. Prior metadata and retrieval limitations are preserved.

The lead's [combined assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md) accepts E49's fixed-round nonlinear theorem and its discharge of E50's stability premise. Manuscript consumer: subsection label subsec:round-stability, Lemma lem:round-positive, Theorem thm:round-stability and Corollary cor:round-small-values. The source's stated stability is credited; the corrected gauge, exact graph trace, smooth restart and small-value transfer are separately derived with the recorded scope. The result requires smooth initial data and a fixed round reference. Bibliographic Hitchin/LeBrun/Horan pointers remain unimported. E53's flat finite-p embedding and heat estimates are direct derivations and add no primary theorem dependency.


E55 subsequently reopened Fine v2 Theorem4.11 (small L2_k definite perturbations, integer k≥3, perfect reference on a compact four-manifold, convergence modulo automorphisms), and the same Taylor author file, printed pp.66 and 94, equations(3.1.18)–(3.1.20) and Proposition3.6.A/(3.6.14), on 22 November 2026. The [manuscript integration audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E55_STABILITY_MANUSCRIPT_AUDIT_20261122.md) reports selected-passage checks only, without a new version or retained reading copy. Its operator, energy-norm and trace wording corrections were integrated by the lead. No theorem from the three uninspected rigidity pointers was imported.


### Critical path and smoothing follow-up

E65 rechecked the same Fine arXiv:1111.5005v2 remote PDF text on 22 November 2026, America/New_York: Definition1.4 and the negative-Killing normalization, p.4; Definition1.5, p.5; Lemma2.2 and proof, pp.12–13; Proposition4.2 and (4.1), p.30. The [E65 audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E65_CRITICAL_STRAIN_AUDIT_20261122.md) independently checks the clock tau=2Kt, metric g_F=2K ghat and the invariant temporal strain integral. No new version or reading copy was obtained; prior copy hash and unknown original retrieval details remain unchanged.

E53–E54, E57 and their focused audits derive the Fourier, Lorentz, product, matrix-kernel and fixed compact-bundle estimates directly, without adding an external theorem dependency. E59 derives the geometric path-to-strain dictionary from the already assessed reconstruction. E60 applies those estimates to the established E36 system and identifies its smooth-compatible solution with E42; it does not import a new rough-data theorem. E62 combines the local path estimate, existing stability and spatial naturality while preserving its explicit Hcrit premise. E63 derives a finite-order Lipschitz consequence of the E42 parameter/data proof. Its inherited methodological attribution is Koch–Lamm's inspected 2013v1, §§2–3 pp.4–7 and the system/manifold qualifications in §§4.1–4.2 pp.7–8; it is not attributed to a newly read Koch–Lamm theorem. No fresh primary inspection occurred in E60/E62/E63. These are consuming-note updates, not new source versions or claims of novelty. Their current assessment status belongs to the branch's sole register.


The later consumers are [E59](../papers/investigations-1/01_chiral_metric_evolution/notes/59_CRITICAL_PATH_STRAIN_20261122.md), [E60](../papers/investigations-1/01_chiral_metric_evolution/notes/60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md), [E62](../papers/investigations-1/01_chiral_metric_evolution/notes/62_GLOBAL_CRITICAL_STRAIN_BUDGET_20261122.md) and [E63](../papers/investigations-1/01_chiral_metric_evolution/notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md). The independent [E64 audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E64_COMPATIBLE_CRITICAL_AUDIT_20261122.md) checks that E60 supplies the exact Hcrit premise. The [combined E62–E67 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E62_E67_GLOBAL_CRITICAL_ASSESSMENT_20261122.md) accepts the resulting linear whole-time bound; E62 retains its original conditional statement. Manuscript consumer: subsec:critical-budget and thm:critical-global-budget. E67 and the lead add no primary reinspection. The [E68 records audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E68_REFERENCE_FOLLOWUP_AUDIT_20261122.md) checked local records only, at its own frozen versions; its bibliography, factor and consumer-link corrections were integrated on 22 November 2026.

### Later native-flow and continuation consumers

22 November 2026, after the E144 record-consistency audit. The
[adjusted defect assessment E125/E127](../papers/investigations-1/01_chiral_metric_evolution/reviews/E125_E127_ADJUSTED_DEFECT_ASSESSMENT_20261122.md),
[joint comparison E133/E135](../papers/investigations-1/01_chiral_metric_evolution/reviews/E133_E135_ROUND_COMPARISON_ASSESSMENT_20261122.md)
and [real comparison E137/E139](../papers/investigations-1/01_chiral_metric_evolution/reviews/E137_E139_REAL_COMPARISON_ASSESSMENT_20261122.md)
consume the same Fine v2 original equation, native metric/clock
translation and distinction between the fixed vertical and live
horizontal adjoints. Manuscript locators are
subsec:adjusted-defect-endpoint, subsec:quantitative-round-endpoint
and subsec:real-comparison-time; E141 checks the last integration.
The new equations and estimates are branch derivations, not extra
theorems attributed to Fine. The relevant previously checked passages
remain Definition 1.4, Proposition 4.2/(4.1), Lemma 3.2/(3.4),
Lemma 4.4/(4.2)–(4.4) and the separately recorded stability passages.
No fresh source inspection occurred in these packets.

The [E138–E143 general continuation assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md)
also uses those inherited native conventions and the assessed smooth
local correspondence. Its uniform value-radius refinement is proved
directly for the compact pair system, using the recorded Koch–Lamm v1
contraction/parameter method through E41/E42 and Taylor §7.3 for an
individual smooth graph start. Reference derivatives may shorten the
local time; they do not determine the new value radii. The resulting
finite-J original continuation criterion on compact closed oriented
four-manifolds in the chosen positive component is a branch theorem,
not an imported continuous-data restart theorem from these sources.
Manuscript locator: subsec:general-continuation. E144 predates this
integration and is not claimed as an audit of it. Source versions,
selected-passage inspection levels, reading-copy hashes and access
limitations remain unchanged.

### Same-version continuation comparison — E149

On 22 November 2026, [E149](../papers/investigations-1/01_chiral_metric_evolution/reviews/E149_GENERAL_CONTINUATION_SOURCE_COMPARISON_20261122.md)
reinspected selected passages of Fine arXiv:1111.5005v2 through its
primary remote HTML, and the published Fine--Krasnov--Panov
NYJM 20 (2014), 293--323 PDF. No new version or local reading copy
was retained; the earlier copy identities and retrieval limitations
remain unchanged. Fine's Sections 1, 4 and 5 distinguish the original
trace-three defect gradient from the later closed-triple evolution:
Proposition 4.2/(4.1), Theorems 4.3, 4.10, 4.11 and 4.13 supply
the original equation, smooth local and near-perfect statements;
Proposition 5.7/(5.2) and Theorem 5.8 concern a different flow.
The selected passages do not state the branch's finite temporal
strain-budget or positive continuous pair endpoint criteria.
That bounded comparison is not a novelty certification.

In the same published FKP version, E149 checked Section 2.2,
equation (1), p.298; Section 2.3, equation (3), p.299;
Definition 2.8/Theorem 2.9; and Section 5.3, equation (18)
and Theorem 5.18, p.320. Its normalization
\(\operatorname{tr}\sqrt M=|\Lambda|\), action and flow
\(A_t=\Lambda d_A^{*g}\Phi/(6\pi^2)\) differ from Fine's
trace-three defect gradient. Relative to this branch,
\(\nu=\Lambda^{-2}(\operatorname{tr}\sqrt Q)^2\mu\);
the factor depends on the spectrum and is not a constant clock
conversion. Its stationary pure-connection equation and smooth
local theorem are not imported as continuation for the present
flow. The [lead assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E149_CONTINUATION_SOURCE_ASSESSMENT_20261122.md)
and [R26/R27 comparison record](SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md)
are the consumers and preserve the exact inspection limits.

## Nonlinear slice source discovery

22 November 2026. The lead discovered Hamilton, *The inverse function theorem of Nash and Moser*, in the [AMS publisher PDF](https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf). The primary search excerpt identifies Richard S. Hamilton, Bulletin (New Series) of the American Mathematical Society, volume 7, number 1, July 1982, starting page 65. This is discovery and first-page metadata only; no theorem has yet been imported, and final pagination is unverified. No reading copy has been retrieved by the lead. B48 and the bounded E81 source audit consume this pointer to determine whether a nonlinear slice argument can meet the exact tame inverse hypotheses. Separate infinitesimal inverses in E71/E79 do not themselves establish those premises.

## Nonlinear slice primary hypotheses — E81

22 November 2026. The [E81 source audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E81_NONLINEAR_SLICE_SOURCE_AUDIT_20261122.md) upgrades R24 from discovery to selected-passage inspection. Richard S. Hamilton, *The inverse function theorem of Nash and Moser*, Bulletin (New Series) of the AMS 7(1), July 1982, 65–222, DOI [10.1090/S0273-0979-1982-15004-2](https://doi.org/10.1090/S0273-0979-1982-15004-2). Metadata and passages were read in indexed text of the [original AMS PDF](https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf); a [later AMS bibliography](https://www.ams.org/journals/bull/2023-60-02/S0273-0979-2023-01794-1/S0273-0979-2023-01794-1.pdf) corroborates the DOI. Direct PDF and image access returned 403; no file, size or hash is available. Earlier first-page discovery is preserved above.

Checked: II.1.3.1–4 and .9 (pp.136,139), II.2.1 (pp.140–143), II.2.2.6–2.3.6 (pp.145–149), II.3.1.1 (p.150), II.3.3.1–4 (pp.155–159), III.1.1.1–3 (pp.171–172). These cover tame section spaces, retracts, finite-jet maps, compact-manifold composition/inversion, and elliptic inverse families on compact boundaryless bases. The augmented elliptic version requires invertibility with fixed finite-dimensional constraints/corrections. The nonlinear right-inverse theorem requires a jointly smooth tame family of differential right inverses throughout an open domain. The lead separately checked III.1.1.3 through its indexed primary excerpt. B49/E82/E83 consume these exact premises; their application remains separate from E81's source audit.

### Fine action and slice distinction — E81

Fresh selected inspection on 22 November 2026 of the existing R15 v2 bytes: references/1111.5005v2.pdf, 447930 bytes, SHA-256 d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8. No new retrieval; original copy transfer URL/date remain unknown. The [version record](https://arxiv.org/abs/1111.5005v2) gives 29 November 2011, 11:54:34 UTC. This remains the preprint version already catalogued.

The helper checked §§3–3.4 (pp.16–22), especially Lemma3.2/(3.4), Lemma3.5/(3.7) and Proposition3.6; §4.2 (pp.30–32,36–37), Theorem4.3, Lemma4.4/(4.2–4.4),(4.8); §4.3 (pp.37–40), Theorems4.11/4.13,(4.9); §§6.2–6.3 (pp.45–46,48–49), Lemma6.10/Theorem6.11. Printed pp.19,22,31–32,37–38 were visually checked. The actual connection-horizontal complement is a vector-space splitting; its curvature need not make it a Lie subalgebra. The infinitesimal inverse-pullback action is −d_A phi−i_uF_A. The subsequent gauge and stability discussion concerns linearized ellipticity and time-dependent evolution. The searched passages do not furnish the fixed finite static slice used in E71/E79. This focused distinction is not a fresh proof audit of Fine's flow theorems. B48/E81 and B49 consume it; prior normalization and gauge qualifications remain in force.

B49 lead follow-up on 22 November 2026 independently inspected Hamilton's indexed original §II.3.3 setup and Theorem3.3.3/Lemma3.3.4 (printed pp.155–159). The source uses Hölder or mixed coefficient-Cn/solution-W(n,p) gradings for the elliptic estimate; it explicitly avoids a bare Cn Gårding claim. The finite-dimensional input map is bounded one order below the operator order, and the output map has fixed smooth finite-dimensional image. This verifies the source conditions being checked in E82; it does not itself prove the nonlinear application. Direct publisher access remains 403 and no copy was retained.

The B49 lead also checked the indexed original III.1.2.1–2 (pp.172–173), algorithm1.5.1 (p.179), Corollary1.6.9/Theorem1.6.10 (pp.184–185), and Theorem1.7.1 (p.187). These center a prescribed preimage, start the algorithm at zero, bound its solution by the target norm, and make its limit a smooth tame right inverse in the surjective case. Consequently the zero target has zero limit before undoing the normalizations. This supports the pointed-section clause being checked in E83. The theorem itself remains subject to the full chart and smooth-tame derivative-family verification.

### Tame solver and full chart consumers — E82/E83

22 November 2026. E82 freshly reinspected the original indexed AMS text at II.1.3 (pp.136,139), II.2.1 (pp.140–143), II.2.2.6–7 (pp.145–146), II.3.1.1 (p.150), and II.3.3 (pp.155–159). Its [derivation](../papers/investigations-1/01_chiral_metric_evolution/notes/82_TAME_ORBIT_SOLVER_20261122.md) applies the finite-dimensional augmented elliptic inverse theorem using coefficient Cn and section Hn gradings, the fixed N projection/inclusion, and the actual second-jet coefficient map. It claims a local smooth tame family, not uniform higher constants on a value tube. Independent E85 audit is separate.

E83 freshly checked I.1.1.5 (p.68), II.1.3.1–4 and .9 (pp.136,139), II.2.1 (pp.140,143), II.2.2.6–II.2.3.6 (pp.145–149), III.1.1.3/III.1.2.1–3 (pp.172–174), III.1.5.1 (pp.179–180), III.1.6.9–10 (pp.184–185), and III.1.7.1 (p.187). Its [full-chart derivation](../papers/investigations-1/01_chiral_metric_evolution/notes/83_TAME_FULL_ORBIT_CHART_20261122.md) uses compact-total-space section charts, composition and diffeomorphism inversion. The local section conclusion remains conditional in that frozen packet on the E82 family. The algorithm's zero-target estimate supports the pointed value at the round reference.

Both helpers used selected indexed publisher text after direct access returned 403, with no retained Hamilton PDF, page-image inspection or full-paper proof audit. These are fresh checks of the same published version, not new source versions. The lead read both complete derivations and independently checked the elliptic and pointed-theorem passages recorded above. The combined nonlinear conclusion awaits its independent audit and lead assessment.

E85 independently reinspected the E82/E83 Hamilton dependencies in the same indexed published version on 22 November 2026, including the compact-section/tame mapping passages, the augmented theorem (II.3.3.3 itself on p.158; setup starts p.157), and the pointed-section proof passages. Its [audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E85_TAME_LOCAL_SECTION_AUDIT_20261122.md) and [lead assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E82_E85_LOCAL_SECTION_ASSESSMENT_20261122.md) accept the application to the full local action map. The working manuscript subsection Smooth local representatives and an intrinsic orbit budget now consumes these theorems at the precise hypotheses. This produces a smooth local section and the E84/E86 intrinsic consequence on a smooth saturated neighborhood, with no claim of placement throughout the value tube. Live access remained 403; no new file, version, visual check or full-paper audit is implied.

### Critical gauge source discovery — Feehan 2001

22 November 2026. [Publisher PDF](https://msp.org/pjm/2001/200-1/pjm-v200-n1-p05-s.pdf): Paul M. N. Feehan, *Critical-exponent Sobolev norms and the slice theorem for the quotient space of connections*, Pacific J. Math. 200(1), September 2001, 71–118. Publication and pagination checked in the original; DOI 10.2140/pjm.2001.200.71 corroborated by the [author's publication list](https://sites.math.rutgers.edu/~feehan/vita/Paul_Feehan_Curriculum_Vitae.pdf). No copy retained; path, size and hash unavailable. The arXiv predecessor was discovered but not inspected.

The lead read introductory §§1.1–1.2, pp.72–75, including Theorems1.1–1.2 and their norm definitions. They concern a fixed closed Riemannian four-manifold, compact structure group, Hk connections and H(k+1) gauge transformations with integer k≥2. Smallness uses the stated quotient distances and critical weighted norms, with reference spectral/curvature constants. This is a Coulomb gauge result; it does not supply the additional horizontal slice equation. B54 requests a bounded applicability audit before any import. The inspected statement is distinct from its proof, which has not yet been audited. Publisher HTML endpoints were inaccessible; indexed published PDF text was accessible.

E93 follow-up, same inspection date and published version: selected §§2–4 (pp.77–81,86–87) and §8 (pp.111–116) checked for action, norm and representative hypotheses. [Audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E93_CRITICAL_GAUGE_SOURCE_AUDIT_20261122.md) and [assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E93_SOURCE_COMPARISON_ASSESSMENT_20261122.md) record the missing application estimates. Superscript extraction was ambiguous, with no verified printed error. Direct terminal retrieval failed DNS; no copy or visual inspection was obtained.

Later consumer, same date: the working manuscript subsection `subsec:finite-internal-gauge` now cites Theorems 1.1–1.2 and 8.2/8.4 as a fixed-base critical Coulomb comparison. [E98/E99/E101](../papers/investigations-1/01_chiral_metric_evolution/reviews/E98_E101_VERTICAL_GAUGE_ASSESSMENT_20261122.md) instead derive an exponential contraction in fixed W1,(4,1), prove smoothness for smooth data, and combine it with a static W1,8 estimate at the special round reference. No Feehan theorem is imported, no new primary version or inspection is claimed, and neither construction supplies the additional horizontal equation. The earlier missing norm implication is preserved as the scope of the attempted Feehan application; the direct proof uses different premises.


### Intrinsic energy-entry consumers — E174 through E180

22 November 2026. The [E174/E176 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E174_E176_INTRINSIC_ENTRY_ASSESSMENT_20261122.md) and stronger [E177/E178 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E177_E178_COMPACT_FAMILY_ENERGY_ASSESSMENT_20261122.md) reuse the already inspected Fine v2 gradient in §4.1 and local/stability inputs in §§4.2–4.3. The working manuscript subsection `subsec:intrinsic-round-entry` derives its own native defect-energy variation and exact unit dissipation coefficient, then combines the assessed branch compactness and common local interval to obtain a perfect smooth positive-time slice. This is Fine's actual original defect-gradient flow after recovery, not the different volume or hypersymplectic flows. No new source passage or newer version was inspected in these packets.

The perfect-to-round step consumes the E01C signature inspection: Hirzebruch, *The signature theorem: Reminiscences and recreation*, §4, p11, equation(16), with the branch's explicit contraction giving 12pi squared times signature in ordinary Weyl-operator Hilbert–Schmidt norms. The smooth closed oriented homotopy four-sphere has signature zero; perfection supplies W+=0, Einstein geometry and native scalar6, so W−=0 and sectional curvature1/2. The exact source identity, version and primary link remain in the [canonical E01C metadata](../papers/investigations-1/01_chiral_metric_evolution/research-progress/handoffs/SP4-CME-E01C_RETURN_v1.md#metadata-for-canonical-references), linked from the shared catalog.

Schoen–Yau, *Conformally flat manifolds, Kleinian groups and scalar curvature*, pp47 and49–50, supplies the previously inspected conformal developing-map method. The new argument constructs local isometries from the constant-curvature Jacobi equation, verifies their sphere-rotation transitions, and uses simple connectivity and a compact covering to give a global round isometry. It does not import the stronger Kleinian result or its extra scalar-curvature hypotheses. The manuscript cites these source passages at this step and writes the adjoint-fiber identification explicitly. Kuiper's original inaccessible text is not newly imported. Inspection levels and copy provenance remain unchanged; these are additional consumers, not new source checks.

The [assessed E179/E181 extension](../papers/investigations-1/01_chiral_metric_evolution/reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) reuses the native energy and round-identification inputs. Its energy-threshold alternative applies E177 at one actual unshifted late slice. The integrated theorem explicitly shifts and normalizes before smooth accumulation. E184 checks the directional gradient identity and Fine v2 scope, with no new source inspection. Fine v2 leaves nonperfect connection-energy critical points unresolved at the end of §1.6; its §5 theorem concerns a different definite-triple equation. No general critical exclusion or current novelty claim is inferred.

The later [E182/E183/E185 uniform extension](../papers/investigations-1/01_chiral_metric_evolution/reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) and E188 integration reuse these exact native energy and round-identification inputs after constructing one reference base/bundle. Theorem 6.26 in the verified 135-page manuscript gives uniform thresholds; its late-limit Theorem 6.27 uses them at an unshifted slice. This updates consumers, not primary version or inspection status.


## Stationary spectral comparison — E207, 23 November 2026

Prepared for Edward B. Baker III with OpenAI assistance. Lead model and effort unavailable; bounded helper configured gpt-6.2-sol/ultra. The [E207 receipt](../papers/investigations-1/01_chiral_metric_evolution/reviews/E207_STATIONARY_PINCHING_SOURCE_COMPARISON_20261123.md) records four targeted searches and six primary comparators. It is a selected-passage comparison, not a novelty audit. No source theorem is newly imported.

R15 / Fine2011: the existing v2 reading copy (447930 bytes, SHA-256 d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8) was reinspected by E207 on 23 November. Original retrieval provenance remains unknown. The version record dates v2 to 29 November 2011, 11:54:34 UTC. Definitions 1.9–1.10/Proposition 1.12, pp. 8–10, give the native trace-three energy; its difference from the defect energy is the fixed-bundle topological constant. The final paragraph of §1.6, p. 11, raises intermediate connection critical points historically. Proposition 4.2/(4.1), p. 30, gives the same native original gradient after the Bianchi cancellation. Theorem 4.11, p. 37, assumes a supplied perfect reference and small fixed-background L²_k distance, integer k≥3, and states convergence after time-dependent automorphisms. Proposition 5.9, p. 43, instead concerns definite individually closed triples in fixed cohomology. [Inspected v2](https://arxiv.org/pdf/1111.5005v2).

Consumers: assessed [stationary ratio theorem](../papers/investigations-1/01_chiral_metric_evolution/reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md), [late spectral convergence](../papers/investigations-1/01_chiral_metric_evolution/reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md), and manuscript labels `thm:stationary-spectral-pinching` and `cor:late-spectral-convergence`. The first treats supplied positive round-compatible critical connections with ratio at most 9/4; the second presupposes a supplied maximal native trajectory on a homotopy four-sphere with one bounded density/diameter sequence and the closed spectral limsup. Neither conclusion is attributed to Fine's local stability theorem.

FineKrasnovPanov2014: E207 checked the published §§2.3–2.5, pp. 298–301, and Theorem 4.14, pp. 308–309, on 23 November; the lead independently checked Definition 2.8/Theorem 2.9 and Theorem 4.14. This action is the normalized reconstructed volume, with critical equation d_A Phi_A=0. Its positive definite critical points give standard ASD Einstein sphere/projective-plane metrics. The metric and action differ from the trace-three defect functional. Section 5.3/(18)/Theorem 5.18, pp. 320–321, gives the volume-action flow, not the branch flow. Published metadata: NYJM20 (2014), 293–323; received 13 January, revised 27 February 2014. No new local copy. [Published source](https://nyjm.albany.edu/j/2014/20-18v.pdf).

Existing adjacent versions remain separate: E207 rechecked R26 Fine–Yao v2, Definitions 2.2 and equations (2.4)/(3.1), Theorems 4.3/4.10/4.16 (determinant-one hypersymplectic triple flow, with their compactness/full-time hypotheses); R27 UCL accepted v3 dated 3 June 2020, Theorems 1.2/2.8/3.1 (negative chiral Einstein rigidity and volume-action Hessian); and R17 Fine–Panov v2 dated 5 March 2008, §3.3/Theorem 3.7 (strict pointwise 2/5 sectional-curvature pinching of a supplied metric implying definiteness). Exact links and hypothesis comparisons are in the [E207 receipt](../papers/investigations-1/01_chiral_metric_evolution/reviews/E207_STATIONARY_PINCHING_SOURCE_COMPARISON_20261123.md); their canonical source/version records are unchanged. No matching stationary 9/4 statement was found in these inspected passages; no current open-status or novelty conclusion follows.

## R43 — Liu self-dual frame comparison

Hanwen Liu, *A Self-Dual Frame Formalism of the SO(3) Yang-Mills Theory*, arXiv:2607.14204v2, 8 September 2026, 19:10:19 UTC (v1: 15 July 2026). [Version record](https://arxiv.org/abs/2607.14204), [inspected v2](https://arxiv.org/html/2607.14204v2), DOI10.48550/arXiv.2607.14204. E207 checked selected §§1–2, Definition 2.5, Proposition 2.6/(5), Theorem 2.11 on 23 November; the lead checked the version history, introductory fixed-metric convention, Definition 2.5 and Theorem 2.11. This concerns smooth Yang–Mills connections on a closed oriented Riemannian four-manifold with fixed g and a positive self-dual curvature isomorphism. Its equation F^+_{A(h)}h^(-1)=I permits nonzero F^- and is a comparison of curvature variables, not the evolving-metric defect equation. Proofs of the later elliptic/index/conformal results were not audited. Publication status unknown; remote reading only, no local copy/hash. Consumer: E207 source comparison; no imported theorem.

## R44 — Fine Oberwolfach historical abstract

Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*, contributed abstract credited as joint work with Dmitri Panov, in *Differentialgeometrie im Großen*, Oberwolfach Report 33/2011, p. 1891. Workshop 3–9 July 2011; whole report Oberwolfach Rep. 8 (2011), 1857–1912. [Primary report record](https://publications.mfo.de/handle/mfo/3248), publisher DOI10.4171/OWR/2011/33 (repository DOI10.14760/OWR-2011-33). E207 and the lead checked the contribution and metadata on 23 November 2026, using the [report PDF](https://publications.mfo.de/bitstream/handle/mfo/3248/OWR_2011_33.pdf?isAllowed=y&sequence=1), printed p. 1891/PDF index 34. Inspection level: contributed abstract only. It describes the definite-connection energy and short-time flow without full analytical hypotheses. Historical pointer distinct from R15; no theorem imported, no local copy/hash. Consumer: E207.

### Quantitative and occupation-time consumers — E209 through E214

23 November 2026. The [E209/E210 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md) reuses the already inspected Fine v2 Proposition 4.2 / equation (4.1), p.30, for the actual defect gradient, with the branch's explicit old/native volume, pairing and clock conversion. Its static inequality D≥gamma E+beta G on the supplied global ratio≤9/4 class is a branch derivation from the assessed stationary algebra and full derivative estimate; it is not a theorem imported from Fine. The [E212/E213 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md) then uses native dissipation and an absolutely continuous integrating factor for accumulated good time. Its fixed round tail uses the separately assessed branch entry and late-limit results, retaining their signature and compactness source hypotheses. The finite test concerns past occupation only; eventual round convergence forces all sufficiently late times to be pinched.

The working manuscript's Proposition `prop:pinched-gradient-domination` and Corollary `cor:intermittent-spectral-return` consume these assessments. The surrounding stationary comparison retains Fine2011's historical §1.6 question and the distinct positive compact Einstein volume-action theorem of FKP2014 at the E207 inspection level. No new source version, retrieval, full-paper proof audit or novelty certification is claimed in these integrations.

The local spectral-ratio consumer [E215/E217](../papers/investigations-1/01_chiral_metric_evolution/reviews/E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md), assessed 23 November 2026, uses the same original Fine gradient at a supplied connection germ. Its actual affine reaction is derived directly from the velocity and covariant Bianchi identity, with the old/native factors retained. The local strict maximum at ratio9/4 and positive directional derivative are branch calculations; they neither import a scalar maximum theorem nor claim a global preservation counterexample. The manuscript label `prop:spectral-ratio-local-maximum` consumes this assessment. No fresh source inspection is claimed.

### Sharp spectral consumers — E218 through E224

23 November 2026. The [E218/E219 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) establishes a branch pointwise derivative-form certificate through ratio7/2, with a corrected v2 endpoint-basis generator and an independent coefficientwise verification. The [E220/E222 assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) uses the already inspected original Fine gradient and assessed branch identity to extend critical perfection and the late spectral limsup criterion to the closed bound. Its quantitative gradient and occupation estimates are confined to each fixed strict subregion. The working manuscript labels `lem:sharp-stationary-form`, `thm:stationary-spectral-pinching`, `prop:strict-spectral-gradient`, `cor:late-spectral-convergence` and `cor:intermittent-spectral-return` consume these results. The primary-source scopes and versions above are unchanged. No new theorem import, fresh inspection or novelty claim is made. Algebraic sharpness does not establish a critical connection above the bound.


## Endpoint absorption consumers — E223 through E228

23 November 2026. The [E223/E225 endpoint assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E223_E225_ENDPOINT_ABSORPTION_ASSESSMENT_20261123.md) and [E227/E228 strict-interior assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E227_E228_STRICT_INTERIOR_ASSESSMENT_20261123.md) derive pointwise full-form obstructions from the branch's checked original defect-gradient identity and Bianchi reconstruction. They are new consumers of the same inspected R15 Fine v2 gradient (Proposition 4.2/(4.1), p.30) at the exact old/native normalization already recorded above. No new primary theorem, version, retrieval or proof inspection is asserted. The local jet realization is the branch's curvature-quotient calculation, with actual smooth Riemannian positive connection germs; no closed datum is imported from a source.

The manuscript label `prop:spectral-absorption-limit` records failure of speed-only pointwise absorption at Q=diag(6/11,6/11,21/11), a necessary blow-up bound on the adjacent axial family, and per-parameter strictly pinched local realizations. These statements neither contradict the nonnegative stationary restriction nor disprove an integrated endpoint energy-gradient estimate. Their scope is distinct from Fine–Krasnov–Panov's volume-action critical theorem and Fine–Yao's definite-triple evolution. Novelty is not claimed.
