# Marked immersed index-two handles and exterior chiral Weyl bounds

Edward B. Baker III, 25 November 2026. [Standalone LaTeX manuscript](marked_immersed_handle_constructions.tex).

The manuscript constructs the two framed solid-torus faces as regular levels of an actual Euclidean height. It proves quartic chiral energy decay for the quadratic graph and compatible scaled collars, and a strictly positive lower bound for an arbitrary smooth immersed filling of one fixed nonflat quadratic collar. On a closed homotopy four-sphere with finitely many such seams, the exterior recognition criterion uses the actual directional overlap of the reference normal images. The two-birth construction compares these conditions on the standard smooth sphere.

## Sources and build

The draft uses the shared [bibliography](../../../../../references/references.bib) and the inputs fixed at revision `483ad3cef5a0af4328c5d35cabbc1f5224d26b1e`. Theorem hypotheses, proof scope, and the distinction between a local filling and a supplied exterior are stated in the manuscript. The [master immersion section](../../../../master/manuscript/immersion_entry.tex) retains the program-wide recognition and entry criteria.

| Evidence | SHA-256 |
| --- | --- |
| [E32 rotational spherical transition](../../../../master/notes/E32_ROTATIONAL_TRANSITION.md) | `117212d92c59696ecfe03cbe1c512165c8e88c391a7b67e781ff338ff06fe64b` |
| [E37 quadratic handle and exact collars](../../../../master/notes/E37_GRAPH_HANDLE.md) | `008bea06b958d5cb6286a2fe3560546c44320c72c3a0e45f2516d6cae30b2785` |
| [E42 independent relative and exterior estimates](../../../../master/reviews/E42_HEIGHT_AND_COST_AUDIT.md) | `7653e2de8eac5fde417d2e186327ef102184c2b790373968cbd1dc63af80045c` |
| [E49 actual marked height on the standard sphere](../../../../master/notes/E49_TWO_BIRTH_HEIGHT.md) | `14c4187216c8602fa7e9a24b3e844c4d4a12420b683f19d9fea2e1d50b733294` |
| [E50 independent height, framing and energy checks](../../../../master/reviews/E50_TWO_BIRTH_AUDIT.md) | `a0a72b607aee29c745ccbb87a5ce8c34c75513043add1e139cd8d679111d8c8c` |

[Reading copy (PDF)](../../../../../output/pdf/04_hypersurface_immersions/01_immersed_handle_constructions/marked_immersed_handle_constructions.pdf) · Build from the repository root with `python3 tools/build_manuscripts.py 04_hypersurface_immersions/01_immersed_handle_constructions`.

[Build and storage policy](../../../../../LARGE_FILES.md)

Prepared with OpenAI Codex assistance under editorial assignment SP4-MASTER-E51a. GPT-6.2 Sol/ultra was requested. Actual serving model and reasoning effort are unavailable.

The [short-seam section](short_seam.tex) treats the ordinary free-trace form, the signature cost of a product face and the vertical metric on the Mazur boundary with zero signature eta. The [boundary calculation](../reviews/E60_HOMOGENEOUS_ETA.md) fixes the orientation and the Dedekind-sum convention.
