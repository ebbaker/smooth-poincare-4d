# SP4-CME-E38 request v1 — smooth density in the continuous curvature graph

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized configured gpt-6.2-sol / ultra; lead actual settings unavailable. Own only notes/38_CONTINUOUS_COMPATIBLE_DATA_20261122.md and handoffs/SP4-CME-E38_RETURN_v1.md under research-progress. No shared edits.

On a smooth closed compact oriented real four-manifold and a smooth oriented SO(3) bundle, fix any smooth reference connection Aref and smooth background metric. Suppose A=Aref+a is a continuous connection (a a continuous global adjoint one-form) and F is a continuous adjoint two-form satisfying F=F_A distributionally. Assume F is positive definite of a specified round-compatible component, so compactness gives an open compact tube of definite values. Use ordinary forms and [a wedge a]/2 curvature convention; internal normalization does not affect the lemma.

Prove or refute existence of smooth connections A_j with both A_j→A and F_Aj→F uniformly in fixed norms, with F_Aj in the same definite component for large j. Give an explicit finite-chart, partition-of-unity and local-convolution construction on the affine difference a. Account for smooth bundle transitions and derivative of partition factors; do not assume full C1 regularity of a. The needed local fact is that d a is continuous distributionally, after subtracting the smooth reference and algebraic bracket terms. Track all commutators that arise from local trivializations. Also prove a common spatial continuity modulus for the pair (A_j,F_Aj), depending only on a common modulus and uniform values of (a,F), fixed atlas/trivializations/reference, and convolution scale family. If an explicit formula is cumbersome, prove equicontinuity rigorously rather than identifying a small fixed approximation error with a modulus. State value compactness and preservation of any sufficiently small C0 tube about a smooth definite reference when A,F are strictly inside it.

Finally prove curvature-graph closure: if continuous compatible pairs (A_j,F_Aj) converge uniformly in both entries, their limiting distributional curvature is F. State clearly what the density/closure lemma does not prove about a parabolic solution, weighted gradient class, positive-time convergence, or gauge recovery. Finite scope one elementary density and closure lemma only; no elliptic gauge theorem, no rough flow theorem. Verify frozen hashes and provenance. If the construction fails for this regularity, exhibit the exact issue and return to lead.

## Frozen inputs

- `brainstorm/notes/B31_CONTINUOUS_COMPATIBLE_DATA_20261122.md` SHA-256 `ba43c4002a4549ec229ce9593e35a8eb98a4cf60061ea301f129f7764719f4df`
- `notes/24_TEMPORAL_BOOTSTRAP_20261122.md` SHA-256 `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44`
- `notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md` SHA-256 `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a`
