# References — Chiral transfer and pole forms

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. The canonical bibliography is [`references/references.bib`](../../../../references/references.bib), and the record of what was inspected is the [receipt of 27 November](../../../../references/claude/SOURCE_NOTES_FRAMEWORKS_AND_PRISM_20261127.md). A task that reads a source raises its inspection level in a receipt of this branch and enters or corrects its bibliography record.

| Source (bibliography key) | Branch use | Inspection at setup, and owner |
| --- | --- | --- |
| McDuff–Salamon, Theorem 9.4.2 (`McDuffSalamon2012JHolomorphic`); Gromov (`Gromov1985PseudoHolomorphic`) | The import of A2 | Statement read as quoted in two later papers. This branch owns the reading in the book (POLE-E02) |
| Donaldson–Sullivan (`DonaldsonSullivan1989`); Iwaniec–Martin (`IwaniecMartin1993`) | Attribution of the transform | Pointers from memory. This branch owns the reading (POLE-B01) |
| Weighted elliptic theory on asymptotically Euclidean manifolds | The Fredholm argument of A1 | No source chosen and no record entered. POLE-E01 chooses, reads and enters one |
| The metric that makes a near-symplectic form self-dual | POLE-E04 | No record entered. The pointers of the receipt (Honda; Auroux, Donaldson and Katzarkov) are unread |
| Kuiper (`Kuiper1949`); Atiyah–Hitchin–Singer (`AHS1978`) | The round class from $W=0$; the splitting and the twistor space | Existing shared entries, not reopened |
| The author's drafts M1 to M3 | POLE-E05 | Catalogued in the [shared reference catalog](../../../../references/README.md); not opened by the setup session |
| The proposing note (`Baker2026PoleFormsProposal`) | The two sketches and the checked family | Repository note |

## Inspection on activation, 27 November 2026

Prepared for Edward B. Baker III by the Codex lead and the named packet authors, on the working tree based on 6a422ce. The exact lead variant and effort are unavailable. Helper dispatches used gpt-6.2-sol, ultra. The table records passages actually inspected; the preceding table preserves the setup provenance.

| Record | Primary passages checked and use |
| --- | --- |
| Lockhart–McOwen, 1985 | §1, §§2–3 on the parametrix, §6 Thm 6.2 and §7 Lemma 7.1. Smooth asymptotically translation-invariant elliptic system on one cylindrical end, exceptional spectrum, Fredholm and nullspace stability in one weight interval. The proof checks the conversion from cylindrical weights to Cartesian component weights. [Exact import and hypotheses](../notes/E01_A1.md) · [Journal scan](https://www.numdam.org/article/ASNSP_1985_4_12_3_409_0.pdf) |
| Donaldson–Sullivan, 1989 | §2(i)–(ii), pp. 187–189, (2.7), (2.9)–(2.14). The compact smooth oriented homology-sphere inverse and the graph isometry. Their displayed operator goes from plus to minus. The branch takes its inverse. [Paper](https://www.math.stonybrook.edu/~dennis/publications/PDF/DS-pub-0088.pdf) |
| Iwaniec–Martin, 1993 | §8, pp. 55–61, especially Thms 8.1(vi), 8.10 and 8.13. Attribution and sign comparison only. The graph test and the exact-current calculation in B01 fix the sign used here. [Paper](https://doi.org/10.1007/BF02392454) |
| Gromov, 1985 | §0.3.C p. 311, §2.4.A′₁–A₂ p. 337. The latter is the relative splitting assertion applied on a closed product cap. [Source receipt](A2_ORIGINAL.md) · [Author's scan](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/945.pdf) |
| Perutz, v2 | Definition 1.1 and Lemma 2.1, pp. 1, 4–5. Intrinsic near-positivity and compatible conformal structures on oriented four-manifolds. The section of the positive-plane bundle and the requirement on the marked end are distinct parts of E04. [Author's paper](https://arxiv.org/pdf/math/0601320) |
| Baker, M2 and M3 | First-party historical input, both PDFs inspected, no theorem used as an import. [Page-level inspection record](../notes/E05_DRAFTS.md) |
| Auroux–Donaldson–Katzarkov, 2005 | Def. 1 and Prop. 1, p. 1044, and §7.2, p. 1106. The graph in the unit operator-norm ball describes positive three-planes; containing a particular form is an affine equation. E04 proves the relative end construction. [Paper](https://arxiv.org/pdf/math/0410332) |
| Perutz, 2005 thesis | Ch. 1, Def. 1.1.1, Lem. 1.1.3 and Prop. 1.1.4, PDF pp. 17–20. Intrinsic derivative and smooth compatible classes; proof near a zero. [Thesis](https://web.ma.utexas.edu/users/perutz/PDF_files/PerutzThesis.pdf) |
| Lalonde–McDuff, 1996 | §5.1, Thm 5.1, pp. as in the [S02 receipt](A2_ORIGINAL.md). Source-reader comparison only. Its product-manifold hypothesis precludes using this version alone on the glued manifold. |
| Taubes, 2006 | §2, Prop. 2.1 and Part 5, eq. (2.16), pp. 558–561. Compact local modification of a standard symplectic ball adds a zero circle and preserves the form outside the ball. E06 uses the resulting endpoint on standard Euclidean space. [Journal paper](https://doi.org/10.4310/MRL.2006.v13.n4.a6) |
| McDuff–Salamon, 2nd edition, 2012 | The exact theorem page for 9.4.2 was unavailable in the publisher/preview searches. The exact-title and author searches for a reading copy also returned no match. The [reader's audit](../reviews/E02_REPLAY.md) distinguishes the earlier secondary quotations from the original [Gromov import](A2_ORIGINAL.md). The A2 proof uses the latter. |

## Manuscript source check · handle presentations

For Edward B. Baker III, 27 November 2026, base `6a422ce`. Gay and Kirby, *Trisecting 4-manifolds*, Geom. Topol. **20** (2016), 3097–3132. Inspected the journal text of Theorem 4, Lemma 13 and the second existence proof. The closed connected oriented smooth four-manifold has a balanced trisection with handle numbers given in Theorem 4. The Euler-characteristic specialization, collar-cover construction and max–min test in this manuscript are separate deductions. The source applies to the abstract handle presentation. [Original journal PDF](https://msp.org/gt/2016/20-6/gt-v20-n6-p02-p.pdf) · [Shared record GayKirby2016Trisecting in the checked owner patch](../../05_certificates/references/SHARED_BIBLIOGRAPHY_20261127.patch)

Existing passage records above cover the weighted and symplectic imports. For Freedman, Theorem 1.6, p. 371, on the underlying homeomorphism type, see the [primary statement](https://www.maths.gla.ac.uk/~mpowell/1982_The%20topology%20of%20four-dimensional%20manifolds.pdf#page=15) and [master audit](../../../master-2/reviews/E01_MANUSCRIPT_AUDIT_20261127.md).

## Marked pilot · 27 November 2026 (New York)

Prepared for Edward B. Baker III on base `6a422ce` by the Codex lead (exact serving variant and effort unavailable). The pilot uses the fixed boundary and its [checked marking](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md). In the primary Miller–Schupp manuscript, p. 1, Theorem 1 assumes a perfect two-generator group and the coprime positive exponents in the conjugacy relation. The exponent rows here have determinant −1 and the first relation has exponents 2,3. This identifies the trivial group in the topological input. The smooth boundary identification used here comes from the actual attaching maps. The shared bibliography already carries `MillerSchupp1999TrivialGroup`. [Primary text](https://hcmuaf.edu.vn/giangvien/data/file/Some%20presentations%20of%20the%20trivial%20group.pdf)

For the inverse used in the residual test, the lead re-opened Lockhart–McOwen, §6 Theorem 6.2 and §7 Lemma 7.1, printed pp. 434–435. Their Fredholm and kernel assertions concern the elliptic operator asymptotic to a translation-invariant cylindrical system with weight off its exceptional spectrum. The isomorphism for this specific weighted operator, its source and target orders, and the zero-leading solution are [01's A1 deduction](../notes/E01_A1.md). No numerical inverse norm follows from these results. The existing shared-owner patch already supplies `LockhartMcOwen1985Elliptic`. The cap tests below use direct differential identities. [Journal scan](https://www.numdam.org/item/ASNSP_1985_4_12_3_409_0.pdf) · [Owner bibliography patch](../../05_certificates/references/SHARED_BIBLIOGRAPHY_20261127.patch)

Aronszajn–Krzywicki–Szarski, §2, Theorem 1, supplies open-set unique continuation for the smooth closed self-dual fields on the connected punctured manifold. The [primary-source record](AKS_TRACE_20261127.md) gives the original hypotheses and their verification. The [bibliography and ledger handoff](../research-progress/handoffs/TO_05_POLE_TRACE_SOURCE_20261127.md) is for the shared owners.

The [puncture-knot source handoff](../research-progress/handoffs/TO_06_PUNCTURE_KNOT_FILTER_20261127.md) records Ozsváth–Szabó Theorems 1.1–1.2 and Plamenevskaya Theorem 1 on the proposed Legendrian witness, Rasmussen Theorem 1 on the surviving genus test, and Dunfield–Gong Theorem 5.14 on a separate named knot.
