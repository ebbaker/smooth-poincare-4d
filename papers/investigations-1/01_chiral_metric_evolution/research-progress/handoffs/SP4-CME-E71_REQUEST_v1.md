# SP4-CME-E71 request v1 — linear orthogonal slice at the round reference

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper gpt-6.2-sol/ultra; actual lead settings unavailable. Fixed E work under B44. Own notes/71_LINEAR_ROUND_SLICE_20261122.md and research-progress/handoffs/SP4-CME-E71_RETURN_v1.md only.

Frozen inputs:
- notes/47_ROUND_STABLE_LINEAR_20261122.md SHA-256 ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6
- notes/48_FIXED_STABILITY_GAUGE_20261122.md SHA-256 b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b
- reviews/E51_STABILITY_INPUTS_AUDIT_20261122.md SHA-256 15f7ef87d7855b5011c53886016fcfe1bd66f050e9b3dd99e25a6d31481d4e4f

Read B44_LINEAR_SLICE_AND_REGULARITY_20261122.md. Smooth oriented Riemannian standard round S4, positive perfect chiral reference, native metric/pairing and fixed d0,S0 as E47. Derive Pi=I−S0(S0*S0)^−1S0*, K=d0*Pi d0. Prove its rank-one symbol is positive from the already checked intersection, give the self-adjoint nonnegative compact realization and finite-dimensional smooth kernel, and construct the pseudoinverse on its orthogonal complement. For every smooth a prove compatibility of forcing, define phi,u,a_sl by B44, check exact slice equations and uniqueness modulo the kernel. Identify the range and kernel of a→a_sl and idempotence/self-adjointness in L2. Establish for each integer m≥0:

    ||phi||H^(m+1)+||u||H^m+||a_sl||H^m <= Cm ||a||H^m.

For m=0 use the weak H−1 forcing and coercivity on the kernel complement, not an incorrect L2 forcing assumption. Justify compact coercivity and local higher regularity. No need to compute the stabilizer dimension. State the exact ambiguity if another (phi,u) represents the same orbit direction. Examine the derivative count in the finite horizontal pullback sufficiently to show why this linear result is not itself a nonlinear low-order slice theorem; make no broad failure claim. Return finite derivation, hashes, scope and any new reference inspection, following REFERENCE_WORKFLOW. Unresolved strategy returns to lead. No shared edits, nonlinear slice, arbitrary-sphere conclusion or new numerical experiments.
