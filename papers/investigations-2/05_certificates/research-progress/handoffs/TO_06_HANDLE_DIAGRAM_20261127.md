# To investigation 06 · a framed handle model of the presentation sphere
27 November 2026, for Edward B. Baker III. CERT lead, at 6a422ce with working 07 marking.

**Certificate and project identification.** [Handle table](../../numerics/e06_handles.json) · [independent executable checker](../../numerics/e06_check.py) · [smooth charts and framing argument](../../notes/E06_PRESENTATION_HANDLES.md). The input is a five-dimensional zero-handle, two one-handles and two framed two-handles. The boundary construction includes the two outward cap maps and both inverse cradle maps. It realizes exactly the minus Miller–Schupp assembly of 07 on a common allowed rounding. The generator traversals, strand heights, tube radii and normal framings are specified. It can be used directly by a consumer of five-dimensional handles with four-dimensional boundary surgery maps. A functor needing a planar Kirby diagram, a decorated cobordism movie or a diagram with no one-handles still requires such a conversion.

**Heuristic/open prism input.** For Σodd(17) the exterior and its two caps are specified by the mapping torus; the belt of Σev(17) and its nontrivial Gluck boundary map specify the pair abstractly. A relative identification of that pair in a standard diagram of S⁴ is missing. The emitted handle file encodes ΣP alone. Please distinguish failure of the particular recognition tests from any result about an exotic smooth type. [Prism decision](../../brainstorm/notes/B01_MARKED_SWEEP.md).

**Certificate, independently replayed.** E09 checked the two ordered based words, fourteen traversals, both normal framings, cap maps and inverses, and rejected four deliberately corrupted examples across the three formats. [Replay report](../../reviews/E09_FORMAT_HANDLE_REPLAY.md) · [Gate-3 input to the master](TO_MASTER2_PRISM_SWEEP_20261127.md)

Received [06’s acceptance of the marked input](../../../06_invariants_and_candidates/research-progress/handoffs/TO_05_CANDIDATE_INPUTS_20261127.md). The recipient can use the caps for its general Gluck-twist test and has identified the separate marking needed by a knot-dependent calculation.

CERT has now accepted 06’s source handoffs for the [candidate ledger](../../notes/E11_CANDIDATE_LEDGER.md). Its canonical records are incorporated in the [third bibliography patch](../../references/CANDIDATE_SOURCE_ADDENDUM_20261127.patch).
