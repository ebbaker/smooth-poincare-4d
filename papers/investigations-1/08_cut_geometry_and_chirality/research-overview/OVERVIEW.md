# Research overview — cut geometry and chirality

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `841d606`. Inputs: the [master manuscript](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex), the [proposing note](../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126.md) with its checks, and the documents of [03](../../03_first_order_twistor/README.md), [04](../../04_hypersurface_immersions/README.md), [05](../../05_collar_deformation_and_surgery/README.md) and [07](../../07_positive_subcritical_entry/README.md) listed in that note. The [register](../research-progress/REGISTER.md) alone owns live status.

## Objective

A *cut* is a closed connected hypersurface of a smooth homotopy four-sphere. Constructions of entering classes glue pieces along cuts, and arguments for recognition look for a cut along which the manifold can be identified. This investigation studies the cut itself: which conformal invariants it carries, which cuts can occur in a class of small chiral energy, and what a cut or a family of cuts recognizes. The consequence sought is a proof of the sphere statement (S) below, or failing that a precise list of the constructions and arguments that cuts exclude.

## Fixed setting and conventions

- **Category.** Smooth, Riemannian, positive definite. \(M\) is a closed connected oriented smooth manifold homotopy equivalent to \(S^4\); its orientation is fixed.
- **Curvature.** The curvature operator of the unit sphere is the identity. \(W^\pm\) act on \(\Lambda^\pm\); \(E_\pm(U)=\int_U|W^\pm|^2_{\rm HS}\); \(e=E_+=E_-\) on \(M\); \(T=4\pi^2\). \(Z\) is the trace-free Ricci tensor, \(A=\tfrac12(\mathrm{Ric}-\tfrac R6g)\), \(\sigma_2(A)=R^2/96-|Z|^2/8\).
- **The band.** A class is *entering* if it has positive Yamabe type and \(e<2T\). It then has a representative with \(R>0\) and \(|Z|^2<R^2/12\) (Chang–Gursky–Yang), the *entering gauge*, in which \(0<\mathrm{Ric}(\nu,\nu)<R/2\).
- **Cuts.** For a cut \(\Sigma\) with unit normal \(\nu\): \(B(X,Y)=g(\nabla_X\nu,Y)\), \(H=\mathrm{tr}B\), \(B^\circ\) the trace-free part. The *Cauchy datum* is \(([h],B^\circ)\). *Umbilic* means \(B^\circ=0\). A *free cut* is an umbilic three-sphere with round conformal structure. A boundary is oriented by the outward normal first.
- **Chirality.** Both chiral energies are kept on every region with boundary. Their difference is governed by the ledger, with \(\eta\) normalized by the Atiyah–Patodi–Singer signature formula.
- **Regularity.** Classes are smooth unless a seam is present; across an umbilic seam the glued metric is \(C^{1,1}\) and is smoothed with arbitrarily small change of energy.
- **Baseline.** The round sphere, the product of two unit spheres and its half, and the one-tube classes of the manuscript's Section 6.

## What is established here, what is inherited

Proved in the [manuscript](../manuscript/cuts_of_subcritical_conformal_classes.tex), with proofs written out and not yet read independently:

1. *Ledger* (Theorem 3.1). \(E_+(V)-E_-(V)=12\pi^2(\tau(V)+\eta(\partial V))+\oint\langle B^\circ,\mathrm{curl}B^\circ\rangle\), every term conformally invariant. Consequences: \(e\ge12\pi^2|\eta|\) at an umbilic cut; one chiral energy of a collar controls the other given its end data; half-flat pieces have energy \(6\pi^2|\tau+\eta|\).
2. *Positivity* (Theorem 4.1). In an entering gauge \(R_\Sigma=P+\tfrac23H^2-|B^\circ|^2\) with \(P>0\); umbilic cuts carry positive scalar curvature. Consequences: the topology of umbilic cuts and of tubes with umbilic boundary; recognition at the winding-one cut of a mixed presentation; no reflection-invariant entering class when the fixed set has no positive scalar curvature.
3. *Seam atlas* (Theorem 5.2). A level \(\#_kS^1\times S^2\) is a seam with positive doubles of an entering class only for \(k\le1\).
4. *One tube* (Propositions 6.1, 6.2). The energy of a circle-symmetric cap as a one-dimensional functional; all such closings are the standard sphere.
5. *Sweepouts* (Theorem 7.2, Corollary 7.3, Proposition 7.4). Level sets with scalar curvature bounded below exclude index two and recognize the sphere; the topology of levels does not.
6. *Minimal cut and free cuts* (Propositions 7.5, 8.1). One eigenvalue of the conformal Laplacian of an index-one minimal cut is undetermined; a free cut splits the energy over a connected sum.

Inherited and used as stated: the reduction of the conjecture to entry and (S), the doubling inequality and the attainment theorem (master and [06](../../06_bour_flow_and_fixed_type_attainment/README.md), working theorems); the mixed-presentation theorem and the three-slide theorem ([05](../../05_collar_deformation_and_surgery/README.md), working theorems); the height-direction count ([04](../../04_hypersurface_immersions/README.md)). Published results are listed with inspection levels in the [references](../references/README.md).

Local or conditional inputs that need a global extension before they bear on the conjecture: every statement about umbilic cuts applies only to classes that have one (assembled classes, invariant classes, round-neck limits), since a generic class has none; the doubling inequality needs positive doubles; the one-tube results need circle symmetry; the cap costs are floating-point upper bounds within an ansatz.

## The proof target

The master manuscript reduces the conjecture to two statements: **entry**, every smooth homotopy four-sphere carries an entering class; and **(S)**, a smooth homotopy four-sphere with a metric satisfying \(R>0\) and \(|Z|^2<R^2/12\) is diffeomorphic to \(S^4\). Entry belongs to 07 and the master. This investigation aims at (S) and returns to the entry branches what cuts exclude.

**Primary route to (S): a sweepout of positive type.** By Corollary 7.3 of the manuscript, (S) is equivalent to the statement that such a metric admits a Morse function whose level sets have scalar curvature bounded below; in an entering gauge it is enough that the levels have \(\sigma_2(B)\ge0\). The route has three steps, each with its own test.

1. *A cut.* Take the min-max minimal hypersurface of the entering gauge. It exists, is two-sided of index one, and its conformal Laplacian has at most one nonpositive eigenvalue (Proposition 7.5). Test: is it of positive Yamabe type? First on the one-tube classes, then in general.
2. *A flow.* Sweep each side by a mean-convex flow from the cut. Its singular leaves modelled on \(S^3\) and \(S^2\times\mathbb R\) are of positive type; those modelled on \(S^1\times\mathbb R^2\) are the index-two events. Test: on the standard-sphere examples of Section 6, locate the index-two events and see whether a change of cut or of flow removes them.
3. *Exclusion.* Show that \(\sigma_2(A)>0\) excludes index-two events for a suitable cut and flow, or forces them to cancel geometrically. With steps 1 to 3 and entry, the conjecture follows.

This route is a research proposal, not a reduction to routine work. Proposition 7.4 shows that step 3 cannot be replaced by any statement about the diffeomorphism types of the leaves.

**Alternatives, entered when a step fails.**

- *If step 1 fails* (the minimal cut is not positive): replace it by a cut that is positive by construction, a stable hypersurface of a prescribed-mean-curvature functional in a wide band, and ask the same of the flow; or work with invariant classes, where the fixed set is an umbilic cut and Corollary 4.5 applies.
- *If step 2 or 3 fails on the examples* (index-two events occur on the standard sphere and cannot be removed): abandon canonical sweepouts and pass to recognition from a single cut with marked topology. Corollary 4.4 does this for mixed presentations when the cut is umbilic; the missing piece is its almost-umbilic version, statement (3) of Theorem 4.1 with a lower bound for the constant, together with the handle-level theorems of 05.
- *Descent at a minimizer.* With the attainment theorem of 06, Proposition 8.1 shows that a minimizer on a nonstandard type is indecomposable along free cuts. A quantitative version, with the cost of a cap bounded by the deviation of the Cauchy datum from the round one, would make every nearly free cut one-sided. This lane needs a source of balanced nearly free cuts and is otherwise a constraint on minimizers rather than a proof.
- *The exterior gap.* If (S) resists, the atlas still reduces every seam construction with positive doubles to one tube and an exterior with \(e_X<\tfrac23T\). Deciding whether such an exterior is standard closes the reflective constructions for entry completely, in one direction or the other.

**What is returned to entry in any case.** No seam \(\#_kS^1\times S^2\), \(k\ge2\), with positive doubles; no umbilic tube around a surface other than a sphere or a projective plane; no circle-symmetric tube on a nonstandard type; the bound \(e\ge12\pi^2|\eta|\) at every umbilic seam.

## Unresolved decisions

Which cut and which flow define the canonical sweepout (SP4-CUT-GEO-B01). Which approach to the exterior gap is tried first (SP4-CUT-TUBE-B01). How the cost of a cap for a prescribed Cauchy datum is defined (SP4-CUT-SEAM-B01). Which closing lane is pursued after the first returns (SP4-CUT-B01, kept by the parent). Whether the redirection of the slide enumeration is agreed, which is for the lead of 05 (SP4-CUT-SLIDE-B01). The sign of the ledger's boundary term (SP4-CUT-LED-E01) is a computation, not a decision.

## Children

Each child has its own overview, plan and register, which cite this overview for conventions and the manuscript for statements: [chirality ledger](../01_chirality_ledger/research-overview/OVERVIEW.md), [seams and marked cuts](../02_seams_and_marked_cuts/research-overview/OVERVIEW.md), [tubes and exteriors](../03_tubes_and_exteriors/research-overview/OVERVIEW.md), [slide filters](../04_slide_filters/research-overview/OVERVIEW.md), [cuts from geometry](../05_cuts_from_geometry/research-overview/OVERVIEW.md). The primary route lives in the last; the alternatives in the second and third; the first is an instrument for all; the fourth is not on the route.
