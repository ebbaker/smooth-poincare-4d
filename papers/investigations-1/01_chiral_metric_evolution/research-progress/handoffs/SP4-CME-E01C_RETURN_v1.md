# SP4-CME-E01C return v1 — boundary and topology checks

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch was configured as `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. This is the return to the [frozen
E request](SP4-CME-E01C_REQUEST_v1.md). The lead owns integration.

## Disposition

Completed the assigned analytical checks. The [audit](../../reviews/E01C_AUDIT_20261122.md)
contains the exact derivations, primary passages, and scope of the results.

- `prop:bounded-defect` holds with \(\mathcal P<32\pi^2\) on the fixed round
  chiral bundle. The proof uses the manuscript's fiber norm and transgression.
  Fine's printed Pontryagin coefficient in his Killing-form convention is twice
  the manuscript's coefficient. The comparison of reconstructed metrics in the
  manuscript is valid after expressing Fine's volume prescription in the same
  component norm. The audit records both scales explicitly.
- `prop:boundary-example` holds with limit \(4K^2\) for the density relative
  to the source volume and anisotropy despite a positive limiting volume
  ratio. The definite range is verified at the displayed point and locally
  for each fixed interior parameter. The calculation concerns a family of
  source metrics and supplies no degeneration of a flow trajectory or
  counterexample to a quantitative small-energy theorem.
- `thm:ctx-ASD-sphere` holds via the signature identity in Hilbert–Schmidt
  norm, the Weyl-flatness criterion, Liouville development and the proper
  local-diffeomorphism argument. The 1949 original Kuiper text was unavailable.
  The inspected primary papers provide the signature and basic developing
  statements used by the independently checked proof. ASD existence on an
  arbitrary smooth homotopy sphere remains the missing premise.

The return supplies the two E01 claim dispositions to the lead for B01.
There is no unresolved proof premise inside this bounded packet beyond the
historical primary-access limitation. The source-normalization distinction
is relevant when comparing native Fine formulas with shared manuscript
conventions. The independently normalized manuscript flow is unaffected.

## Inputs and source versions

SHA-256 fingerprints checked on this turn. Paths are relative to the repository
root except for the branch-local paths explicitly shown. The frozen register
fingerprint matched the HEAD copy. During the packet the live register already
contained the lead's activation changes, which did not alter the frozen claim set.

| Input | SHA-256 |
| --- | --- |
| `AGENTS.md` | `6da55071c2312c204bed5cb716bc2cc71bf86b81034147f888918692e885997b` |
| `GPT_RESEARCH_MODEL_WORKFLOW.md` | `e62039b694fbd4032fee9c003cd07b2391c3f4007a03e2c3511dcbac9277541a` |
| Branch `research-plan/PLAN.md` | `0e723e1d0ffaa38e6923c7bf47cf8299aff0ab7f144d5aa16530bf067585dd57` |
| Branch `research-progress/REGISTER.md`, frozen HEAD copy | `9426bb859c0a339b97c1a711fb67da500dfa654f04f84963c71e2a64a1dea28e` |
| Branch `manuscript/chiral_curvature_and_metric_evolution.tex` | `4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0` |
| Branch `notes/01_riemannian_s4_exploration_20261121.md` | `472aa87038d7c6060ca6431c6b166b54110ed77005155eeb0094d131d7e6e416` |
| Branch `notes/02_riemannian_s4_metric_evolution_20261121.md` | `fca4cad10ee49b497628932e7ee1b150bfe4e701a3422b6e3b1f2e764cd16347` |
| `references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md` | `e779af7b70312f9ac8c1ba6e84599c1e4da4e63b5639562dfe122368997e27f4` |
| `references/SOURCE_NOTES_CME_BACKGROUND_20261121.md` | `839f7dfd6ed536cfe8daa0efa745d7fcd9bbfdce6a19da6d0e700950cafe0be0` |
| Frozen request v1 | `66a1e72727d297e835ade15b3e219f149034c291a931d665952b15678337fd84` |

Fine's v2 definitions were inspected in the arXiv HTML. The existing local PDF
hash is `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8`.
The exact signature and developing-map passage locators and inspection limits
are in the audit. No new reading copy or numerical artifact was created.

## Metadata for canonical references

The following passages were inspected on 22 November 2026. The links lead
to journal versions or institutional copies. No local copies were created.

| Source | Publication and inspected passage |
| --- | --- |
| Friedrich Hirzebruch, *The signature theorem: Reminiscences and recreation* | In *Prospects in Mathematics*, Annals of Mathematics Studies 70, Princeton University Press, Princeton, 1971, pp. 3–31. Inspected §4, p. 11, equation (16), where the author states the four-dimensional signature theorem for compact oriented differentiable manifolds without boundary. [Institutional record](https://hirzebruch.mpim-bonn.mpg.de/id/eprint/84/). |
| Richard Schoen and Shing-Tung Yau, *Conformally flat manifolds, Kleinian groups and scalar curvature* | *Inventiones Mathematicae* 92, no. 1 (1988), 47–71. Inspected p. 47 and §1, pp. 49–50 for Liouville transition regularity, Weyl-flatness and the developing map. Inspected §4, Theorem 4.5 for the extra hypotheses in the broader Kleinian theorem. [DOI](https://doi.org/10.1007/BF01393992), [published reading copy](https://math.jhu.edu/~js/Math646/schoen-yau.conformal.pdf). |
| A. Rod Gover and Matthew J. Gursky, *The anti-self-dual deformation complex and a conjecture of Singer* | *Journal für die reine und angewandte Mathematik* 811 (2024), 293–316. Inspected the introduction, pp. 293–294, particularly Definition 1.1 and the signature display that follows it. Also checked the repeated identity in §4, p. 308. [DOI](https://doi.org/10.1515/crelle-2024-0028), [publisher PDF](https://www.degruyterbrill.com/document/doi/10.1515/crelle-2024-0028/pdf?licenseType=open-access). |
