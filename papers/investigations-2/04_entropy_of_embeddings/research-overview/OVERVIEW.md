# Research overview — Entropy of embeddings

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. An investigation of the [second series](../../README.md). The [register](../research-progress/REGISTER.md) alone owns live status.

## Objective

Can a given homotopy four-sphere be embedded in $\mathbb R^5$ with Colding–Minicozzi entropy in the band where recognition of the standard sphere is a published theorem, and what does the entropy of the natural embeddings measure?

State the imported flow theorems exactly, write the embedding lemma, and decide whether an upper bound for the least entropy of a named sphere is within reach. This is the second-ranked framework of the proposing note: its recognition band is settled by a published theorem, and its open step, lowering the entropy of an embedding, has no known method.

## Setting

- *Category.* $M$ is a smooth homotopy four-sphere and $F:M\to\mathbb R^5$ a smooth embedding with image $\Sigma$. No metric on $M$ is fixed; the induced metric plays no role in the definition. Orientation is irrelevant here.
- *Entropy.* $\lambda(\Sigma)=\sup_{x_0,t_0}(4\pi t_0)^{-2}\int_\Sigma e^{-|x-x_0|^2/4t_0}$, which does not increase along mean curvature flow. The shrinking sphere of dimension $k$ and the cylinder $S^k\times\mathbb R^{4-k}$ have entropy $\lambda(S^k)=\operatorname{Area}(S^k)\,(k/2\pi e)^{k/2}$: about $1.5203$, $1.4715$, $1.4531$ and $1.4436$ for $k=1,2,3,4$.
- *Least entropy.* $I_{\rm ent}(M)$ is the infimum of $\lambda$ over smooth embeddings of $M$ in $\mathbb R^5$.
- The conventions of the [second master's overview](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions) apply where the pole-form frame is mentioned; nothing here depends on it.

## Inherited, with evidence level

- **Every homotopy four-sphere embeds in $\mathbb R^5$.** Classical: it bounds a contractible five-manifold whose double is $S^5$. Stated in the proposing note from memory, with the argument in outline. ENT-E02 writes it with sources.
- **Recognition at low entropy.** Chodosh, Mantoulidis and Schulze, Corollary 1.5: for a closed connected embedded $M^4\subset\mathbb R^5$, entropy at most $\lambda(S^3)$ gives an isotopy to a round sphere, and entropy at most $\lambda(S^2)$ gives an isotopy to the boundary of a standard handlebody, by the flow with the surgery of Daniels-Holgate. Their Theorem 1.3: entropy at most $2$ gives generic flows with multiplicity-one singularities of four cylindrical types. Import; read through a summarizing reader, whose rendering of the dimension of the handlebody was inconsistent.
- **Two-convex hypersurfaces.** Huisken and Sinestrari. Import; an existing bibliography entry, not reopened.
- **Entropy values.** `check_07` of the note's [checks](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/README.md). Checked.
- **Entropy of thin neighbourhoods of a spine.** The proposing note's count that cells of dimension $k$ contribute entropy near $\lambda(S^{4-k})$. Heuristic; no proof and no computation.

## Inputs that need a global extension

Recognition is published only up to $\lambda(S^2)$. Between that value and $2$ the flow meets singularities modelled on $S^2\times\mathbb R^2$ and $S^1\times\mathbb R^3$, for which no surgery exists; a statement about them would be new mathematics in geometric analysis, not a consequence of anything in this repository. The heuristic for spines ignores the junctions where cells meet, whose Gaussian densities are not computed. No relation between entropy and the curvature integrals of the first series is known.

## Place in the route to the conjecture

Independent of the route through pole forms and of its gates. If $I_{\rm ent}(M)\le\lambda(S^2)$ then $M$ is standard, so the conjecture is equivalent to that bound for every $M$, which is again a reformulation. The investigation supplies exact import statements to the ledger that [05](../../05_certificates/README.md) drafts, and a second frame to move to if the first is recorded as a reformulation at gate 2.

## Unresolved decisions

Whether a rigorous upper bound for the least entropy of the presentation spheres of [investigation 07](../../../investigations-1/07_positive_subcritical_entry/README.md) is feasible and worth a computation (ENT-B01). Whether to compare entropy with the Chern–Lashof integral behind the immersed inequality of the first series (ENT-B02, reserved).

## Ownership

Owns $I_{\rm ent}$, the import statements of the flow theorems, the embedding lemma and model estimates. It does not own [investigation 04 of the first series](../../../investigations-1/04_hypersurface_immersions/README.md) or its immersed inequality.
