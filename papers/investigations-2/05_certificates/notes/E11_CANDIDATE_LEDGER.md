# SP4-CERT-E11 · Candidate invariant ledger

27 November 2026, for Edward B. Baker III, with OpenAI Codex assistance.
Actual helper launch setting GPT-6.2 Sol, ultra. Baseline
6a422ce7814fe1ad278d6904970e3b19b05a9890, with the late 06 reading returns.
The objects are smooth oriented four-manifolds. The boundary link is empty
for the closed skein-module comparisons. This is an annex to the
[main ledger](IMPORT_LEDGER.md), within the [frozen request](../research-progress/handoffs/REQUEST_CERT_E11_20261127.md).

## Theorem receipts

| Result and version | Hypotheses and conclusion |
| --- | --- |
| **Import, existing bibliographic record.** Reutter, *Journal of Topology* 16 (2023), Corollary B(2), pp. 543 and 557, with Definitions 2.1 and 2.6. 06 checked the version of record and the CERT lead verified Corollary B(2) in the Wiley journal HTML. | Let \(k\) be algebraically closed. For an ordinary symmetric monoidal \(Z:\mathrm{Bord}_4\to\mathrm{Vect}_k\) on the smooth oriented bordism category with both Frobenius algebras \(Z(S^3)\) and \(Z(S^2\times S^1)\) semisimple, two closed simply connected smooth oriented four-manifolds with an orientation-preserving homotopy equivalence have the same scalar value \(Z(M)=Z(N)\). No characteristic restriction is imposed here. [06 receipt](../../06_invariants_and_candidates/research-progress/handoffs/RETURN_INV_E01_20261127.md) · [Journal article](https://londmathsoc.onlinelibrary.wiley.com/doi/full/10.1112/topo.12288) |
| **Import.** Manolescu–Marengon–Sarkar–Willis, arXiv:1910.08195v2, 5 January 2022. The helper and lead verified Corollary 1.13. The helper also reopened its proof, pp. 32–33, and Definition 3.1, p. 23. | For \(X\) obtained by a Gluck twist along any smooth \(S^2\subset S^4\), let a nonempty oriented \(m\)-component link \(L\subset S^3=\partial X^\circ\) bound disjoint smooth properly embedded oriented disks in \(X^\circ\). Then \(s_{\mathbb F}(L)=1-m\) over a field of characteristic different from two. The disks have total relative class zero because \(X^\circ\) is a punctured integral homology sphere. The proof uses the separate standard positive and negative projective-plane stabilizations of \(X\), attributed there to Gompf–Stipsicz, Exercise 5.2.7(b). [Author final PDF](https://arxiv.org/pdf/1910.08195v2#page=32) · [06 receipt](../../06_invariants_and_candidates/research-progress/handoffs/RETURN_INV_E02_20261127.md) |
| **Import.** Ren, *Geometry & Topology* 28 (2024), Corollaries 1.4–1.5, p. 3937. 06 checked the journal and arXiv v3 of 20 January 2024. The CERT lead verified the corollaries in the author PDF, pp. 3–4. | Over any field \(\mathbb F\), let \(C\) be a smooth properly embedded oriented cobordism from \(L_0\) to \(L_1\) in \((I\times S^3)\#(\#^k\overline{\mathbb{CP}}^{\,2})\), \(k\geq0\), with every component meeting \(L_1\). Both links lie in their indicated copies of \(S^3\). For this boundary case the coefficient convention includes the Bar–Natan invariant in characteristic two. Writing \(z_i\) for the negative projective-plane generators, the bound is \(s_{\mathbb F}(L_1)\leq s_{\mathbb F}(L_0)-\chi(C)-[C]^2-\sum_i\lvert[C]\cdot z_i\rvert\). The last two terms vanish for the application below. Corollary 1.5 gives the connected knot surface case from the empty link with \(s(\varnothing)=1\). [06 statement](../../06_invariants_and_candidates/research-progress/handoffs/RETURN_INV_E02_20261127.md) · [Author PDF](https://arxiv.org/pdf/2305.16089) · [Published article](https://msp.org/gt/2024/28-8/gt-v28-n8-p09-s.pdf) |
| **Candidate import from a primary preprint.** Ren–Sullivan–Wedrich–Willis–Zhang, arXiv:2510.05273v1, 6 October 2025, Theorem 7.1 and Corollary 7.2, pp. 49–50, verified by the helper and lead. | For a compact smooth oriented \(X\), framed oriented \(L\subset\partial X\), and a smooth embedded interior \(S^2\) with trivial normal bundle, the two Gluck maps are isomorphisms of the classical rational \(\mathfrak{gl}_2\) skein lasagna modules. On class \(\alpha\) they use the article's skein-class transport and shift the \((h,q)\) degrees by \((\mp(\alpha\cdot[S])^2/2,\ \pm(\alpha\cdot[S])^2/2)\). For \([S]=0\) they preserve the grading. This is the classical module theorem in a paper that also develops the one-dimensional-input variant. [Author v1 PDF](https://arxiv.org/pdf/2510.05273v1#page=49) · [06 receipt](../../06_invariants_and_candidates/research-progress/handoffs/RETURN_INV_E03_20261127.md) |
| **Imports for the standard comparator, verified by 06.** Morrison–Walker–Wedrich, arXiv:1907.12194v5, Example 5.6, and Manolescu–Neithalath, arXiv:2009.08520v2, Proposition 1.6 and §2.4. | Evaluation in the standard ball with empty outer link gives the ground coefficient in degree \((0,0,0)\). An ordinary four-handle cap preserves the module. Thus \(\mathcal S_0^2(S^4;\varnothing;\mathbb Q)\) is \(\mathbb Q\) in \((h,q,\alpha)=(0,0,0)\). [Ball evaluation](https://arxiv.org/html/1907.12194v5) · [Four-handle invariance](https://arxiv.org/html/2009.08520v2) |

The existing circle-action recognition import is used only through the
working even-prism argument. Freedman–Gompf–Morrison–Walker, published §2,
is the existing reference for the boundary genus test and for changing
the normal framing of a section to perform the Gluck operation on the
dual sphere. 06 inspected that passage. [Existing ledger](IMPORT_LEDGER.md)
· [06 receipt](../../06_invariants_and_candidates/research-progress/handoffs/RETURN_INV_E02_20261127.md)

For the stabilization premise, the 06 owner also records Reutter
Proposition 4.5. A positive projective-plane sum in the interior of the
Gluck mapping cylinder makes it diffeomorphic to the corresponding
stabilized product cylinder as an oriented bordism with the identified
boundary. Glue the same exterior and cap on both sides. Apply the
positive result to the orientation-reversed pair for the negative sign.
This is an alternate source for the stabilization attributed in MMSW.
[06 import handoff](../../06_invariants_and_candidates/research-progress/handoffs/TO_05_INV_IMPORTS_20261127.md)

## Candidate consequences

- **Project corollary of Reutter.** Both named smooth homotopy spheres
  have the scalar \(Z(S^4)\) for every \(Z\) with the stated hypotheses.
  A reflection of \(S^4\) adjusts the orientation of a chosen homotopy
  equivalence if necessary. No choice of Gluck presentation or handle
  diagram enters this consequence.
- **Working deduction from Ren and both definite stabilizations.** If
  \(F\subset X^\circ\) is a smooth proper oriented surface without closed
  components and boundary \(L\) with \(m>0\) components, use disjoint
  coordinate disks connected by a tree of tubes to expose a split
  \(m\)-component unlink \(U_m\). The resulting zero-class cobordism has
  \(\chi(C)=\chi(F)-m\), every component meets both ends, and
  \(s_{\mathbb F}(U_m)=1-m\). The negative stabilization gives one
  inequality and reversing the positive stabilization gives the other.
  Thus \(1-2m+\chi(F)\leq s_{\mathbb F}(L)\leq1-\chi(F)\).
  The connected knot case gives \(|s_{\mathbb F}(K)|\leq2g(F)\), and
  disjoint disks give \(s_{\mathbb F}(L)=1-m\). These are the ordinary
  numerical tests over all fields. [06 deduction with oriented boundary conventions](../../06_invariants_and_candidates/research-progress/handoffs/RETURN_INV_E02_20261127.md)
- **Exact module comparison under the Gluck hypothesis.** For any
  Gluck twist of standard \(S^4\), the twisting sphere is null-homologous.
  The preprint theorem and the standard comparator identify the full
  classical rational \(\mathfrak{gl}_2\) module with \(\mathbb Q\) in
  \((0,0,0)\). Independently, Ren–Willis Proposition 6.17 in arXiv
  v3 gives that value for an oriented smooth homotopy sphere \(X\)
  when \(X\#k\overline{\mathbb{CP}}^{\,2}\) is orientedly
  diffeomorphic to \(\#^k\overline{\mathbb{CP}}^{\,2}\) for some
  \(k\geq0\). Their compact trace comparison has boundary and
  \(b_2=1\). [06 source comparison](../../06_invariants_and_candidates/research-progress/handoffs/RETURN_INV_E03_20261127.md)
- **Scope on the marked candidates.** The Rasmussen and exact rational
  \(\mathfrak{gl}_2\) consequences apply to \(\Sigma_{\rm odd}(17)\)
  using the project's working identification as the Gluck twist of its
  standard even closing. Once that premise holds the comparisons have
  no knot-diagram input and give no smooth recognition of the odd
  closing. For \(\Sigma_P\), the incoming five-dimensional handle
  description and identity double supply neither the Gluck premise
  nor either stabilization premise above. An exact four-dimensional
  skein computation would need the cable and three-handle quotient
  maps. A fixed grading alone gives no finite cutoff. The integral,
  finite-characteristic and higher-rank skein comparisons remain
  outside the rational result. [Candidate handoff](../../06_invariants_and_candidates/research-progress/handoffs/TO_05_CANDIDATE_INPUTS_20261127.md)

This annex carries forward source-level hypotheses and working
consequences. It supplies no Lean evaluation, new invariant computation
or additional candidate recognition.
