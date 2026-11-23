# SP4-CME-E166 return v1 — Independent ALE core topology audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E audit, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I did not author the frozen E162/B82 inputs. Prior work on the separate geometric continuation criterion is disclosed in the review. [Request][req] · [Audit][audit].

## Disposition

Pass for a supplied smooth full core. Integral Mayer–Vietoris gives zero second homology on both embedded sides and identifies the boundary's first homology with the direct sum of the sides' first homologies. The pair sequence, duality and UCT identify these two finite summands abstractly. Their doubled group cannot be nontrivial cyclic. This proves the positive-\(b_2\) obstruction immediately and the optional intersection-form proof also checks out.

For \(b_2=0\), Wright's oriented deck circle action, including the conjugation for \(k=2\), fixes the fiber generator under the change of basepoint implemented by a lifted loop. The resulting end extension is central with cyclic quotient, so is abelian. Its free orthogonal representation gives a faithful character, making the end group cyclic. Counting Euler characteristics gives \(k=d\) and the actual boundary group \(C_{d^2}\), \(d>1\). The cofinal product-end argument applies to each sufficiently large standard compact truncation and to a supplied full product core. Extraction, injectivity control and punctured orbifold cores lie outside the result.

I reopened Wright's arXiv:1102.2442v2 PDF and version metadata. Exact pages, imported hypotheses and source limits are recorded in the review for the lead's R31 integration. No other work was opened and no shared file was edited. All frozen hashes matched. [Wright v2][wright]

| Input or output | SHA-256 |
| --- | --- |
| [E166 request][req] | `3a1c8042aadf29b2faec32e86e779ce17f4aa8ff1814ebd4846d1dc8f7ad6245` |
| [E162 note][note] | `c99bc41b15e828f54e717b9eb8250927586d2aa277c6160a6b323fd12fdddf54` |
| [E166 audit][audit] | `2311daa8c6f12d741acbc96f9fac5800faa34a07fa5053d663c09fb0ea3a7c2e` |

[req]: SP4-CME-E166_REQUEST_v1.md
[note]: ../../notes/162_ALE_CORE_TOPOLOGY_TEST_20261122.md
[audit]: ../../reviews/E166_ALE_CORE_TOPOLOGY_AUDIT_20261122.md
[wright]: https://arxiv.org/pdf/1102.2442v2
