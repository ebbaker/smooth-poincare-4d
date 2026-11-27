# Research overview — Cuts from geometry

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `4655e38`. A child of [cut geometry and chirality](../../README.md). The [register](../research-progress/REGISTER.md) alone owns live status.

## Objective

Does an entering gauge produce a cut, and a sweepout starting from it, from which the sphere can be recognized?

Carry the primary route of the parent: find a cut and a flow in an entering gauge whose leaves have scalar curvature bounded below, or show on examples why none is canonical.

## Setting

The category, orientation, curvature and chirality conventions, the definition of an entering class and of its gauge, and the vocabulary of cuts (Cauchy datum, umbilic cut, free cut, seam with positive doubles) are those of the [parent overview](../../research-overview/OVERVIEW.md#fixed-setting-and-conventions) and of Section 2 of the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex). Statements are cited by their numbers in that manuscript. This child adds no convention.

## Inherited, with evidence level

- Parent manuscript, Section 7: the restriction formula (Lemma 7.1); the Hessian criterion, which fails at every critical point of index two (Theorem 7.2); recognition by a sweepout and its equivalence with the sphere statement (Corollary 7.3); the presentation spheres whose levels are all connected sums of \(S^1\times S^2\) (Proposition 7.4); the index-one minimal cut with one undetermined eigenvalue (Proposition 7.5). Proofs written out, not read independently.
- The height-direction count of 04 and the band and slice criteria of 05, used as stated; Zhou's theorem on the min-max hypersurface, read in abstract only.
- The positivity identity of the parent's Theorem 4.1, which makes level sets with nonnegative second elementary function of the second fundamental form positive in an entering gauge.

## Inputs that need a global extension

The existence of a sweepout of positive type is the sphere statement itself. A mean-convex flow cannot at present be continued through singular leaves modelled on a circle times a plane. The positivity of the minimal cut is open. Flows that preserve two-convexity need an ambient curvature hypothesis that an entering gauge need not satisfy.

## Place in the route to the conjecture

This child carries the three steps of the [primary route](../../research-overview/OVERVIEW.md#the-proof-target): a cut, a flow, and the exclusion of index-two events. If the model computation and the first decision show index-two events on the standard sphere that no choice of cut or flow removes, the route passes to the parent's alternatives: cuts that are positive by construction (GEO-B03), a single nearly umbilic marked cut ([seams and marked cuts](../../02_seams_and_marked_cuts/README.md)), or the exterior gap ([tubes and exteriors](../../03_tubes_and_exteriors/README.md)).

## Unresolved decisions

Which cut and flow are canonical (GEO-B01). How the undetermined eigenvalue of the minimal cut is attacked (GEO-B02). Whether cuts that are positive by construction are taken up (GEO-B03, reserved).

## Ownership

Owns the sweepout criterion and the statements on the minimal cut. Does not own the immersions of 04 or the certificates of 05. The parent keeps the independent reading of the manuscript (SP4-CUT-E02) and the choice of closing lane (SP4-CUT-B01) in its [register](../../research-progress/REGISTER.md).
