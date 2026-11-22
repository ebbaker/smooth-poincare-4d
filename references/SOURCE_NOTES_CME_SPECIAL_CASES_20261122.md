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
