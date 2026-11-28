# Research overview — entropy of embeddings

27 November 2026, for Edward B. Baker III. OpenAI Codex integration at 6a422ce7814f, exact serving variant/effort unavailable. Setup by Claude Fable 5.2 is recorded in [history](../DRAFT_HISTORY.md). [Sole register](../research-progress/REGISTER.md) · [Original question and fixed inputs](../continuation-notes/CONTINUATION.md) · [Exact source receipts](../references/README.md)

## Which entropy would recognize a smooth type?

Fix a closed, connected smooth homotopy four-sphere \(M\). In this investigation an embedding is smooth, the ambient metric on \(\mathbb R^5\) is Euclidean, the induced four-area counts a single sheet, and neither chirality nor a conformal class is prescribed. Define
\[
 \lambda(\Sigma)=\sup_{a\in\mathbb R^5,\ t>0}(4\pi t)^{-2}
   \int_\Sigma e^{-|x-a|^2/(4t)}\,d\mathcal H^4(x),\qquad
 I_{\rm ent}(M)=\inf_{F:M\hookrightarrow\mathbb R^5}\lambda(FM).
\]

**Project theorem, replayed from classical imports.** The embedding space is nonempty. Kervaire supplies a smooth contractible five-filling. Its rounded product with an interval has simply connected boundary and is a standard six-disk by Smale. The seam of its boundary gives the embedding. For every embedding the bounded side is a standard five-ball exactly when \(M\) is diffeomorphic to \(S^4\), by the separate smooth Schönflies corollary in ambient dimension five. [Primary sources and proof](../research-progress/handoffs/E02_EMBEDDING_RETURN.md) · [Independent replay](../reviews/E07_EMBEDDING_REPLAY.md)

**Imports.** For an individual closed connected smooth embedded four-dimensional hypersurface, CMS Corollary 1.5 gives isotopy to a round sphere at \(\lambda\le\lambda(S^3)\), and to a standard handlebody boundary at \(\lambda\le\lambda(S^2)=4/e\). The construction permits an initial perturbation. In the latter range the intended solid has dimension five, with one-handles \(B^4\times S^1\). The printed indices in the pinned primary source are one too small. At entropy at most two Corollary 1.19 instead gives arbitrarily small smooth graphs for which all flows in its specified class have generic singularities. The four possible spherical factors are \(S^1,S^2,S^3,S^4\), with Euclidean factors making each hypersurface four-dimensional. [CMS and Daniels-Holgate reading with quantifiers](../research-progress/handoffs/E01_FLOW_RETURN.md)

**Project theorem, replayed.** A homotopy sphere's vanishing first homology forces the handlebody above to have no one-handles. Therefore
\[
 M\cong_{\rm diff} S^4\quad\Longleftrightarrow\quad
 \exists F,\ \lambda(FM)\le4/e\quad\Longleftrightarrow\quad I_{\rm ent}(M)<4/e .
\]
The round embedding attains \(I_{\rm ent}(S^4)=32/(3e^2)\) by the sharp lower bound of Bernstein–Wang. An infimum of \(4/e\), if realized as the value for some smooth type, would be unattained. Recognition at the inclusive threshold for individual images gives no compactness for a minimizing sequence of embeddings. Universal strict entry is a reformulation of smooth Poincaré. [B01](../brainstorm/notes/B01_SPINE_AND_ENTRY.md) · [Independent replay](../reviews/E05_SPINE_REPLAY.md)

## What the natural embeddings measure

**Project theorem, replayed.** With a rescaled two-cell interior converging on compact sets to \(\mathbb R^2\times\Gamma\), for smooth closed embedded \(\Gamma\subset\mathbb R^3\), the entropy liminf is at least \(\lambda(\Gamma)\ge4/e\). Every fixed nonround cross section gives a strict excess in the limit. A finite pair of nearby round-normal product patches with the dimensions in B01 already forces strict excess at a single test centre. **Heuristic assessment.** The minus Miller–Schupp sphere has actual attaching maps and framings in first-series 07. Its presented thickening and intrinsic assembly supply no complete Euclidean image with controlled Gaussian areas. The decision is to decline a recognition-band upper estimate from these inputs. No junction table was issued. Another embedding of the same type remains possible. [Named-spine decision](../brainstorm/notes/B01_SPINE_AND_ENTRY.md)

**Project theorems, replayed.** Minimal total absolute curvature and zero middle-signature mass coexist with entropy above the recognition threshold on a flattened ellipsoid. In the other direction, globally sheared standard spheres have entropies tending to the round value while both integrals diverge. The statements concern the given embedding. [Calculations](../brainstorm/notes/B02_CURVATURE_COMPARISON.md) · [Independent replay](../reviews/E06_CURVATURE_REPLAY.md)

**Heuristic assessment of the dated literature.** Higher-cylinder surgery has local results under nondegeneracy, and a global almost-flow construction under initial strict mean convexity. A cylindrical tangent, a local surgery, and an ambient isotopy carry different hypotheses. The checked sources yield no enlargement of the recognition band for arbitrary smooth closed connected embedded hypersurfaces in this dimension. [27 November reading](../research-progress/handoffs/E04_BEYOND_NECKS_RETURN.md)

This independent framework has no premise involving the pole forms of the [second master](../../../master-2/research-overview/OVERVIEW.md). Its named open problem is to produce one embedded representative of the minus presentation sphere whose Gaussian area is at most \(4/e\) for every centre and time.
