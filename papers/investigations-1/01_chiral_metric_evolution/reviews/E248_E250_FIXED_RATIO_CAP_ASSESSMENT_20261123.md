# E248–E250 — Closed ratio-cap failure at every fixed finite threshold

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. The selected lead model and effort are preserved and unavailable. Helpers were configured gpt-6.2-sol/ultra; independent runtime attestation is unavailable. The lead read the complete derivations and independent audit, checked the reflection algebra, six scalar quotients, compact-complement argument and original-flow application. This is an internal mathematical assessment, not external peer review or novelty certification.

Accept [E248](../notes/248_FIXED_RATIO_RADIAL_MODEL_20261123.md), independently verified in [E249](E249_FIXED_RATIO_RADIAL_MODEL_AUDIT_20261123.md), and [E250](../notes/250_CONDITIONAL_FIXED_CAP_LOCAL_FLOW_20261123.md). E249 did not read E248, but shared B113 and the assessed local germ and cutoff inputs. Their agreement is supplemented by the explicit computations below. E248/E249 discharge H_fixedcap in E250. Preserve that note's historical conditional formulation. Its later notation-only repair and original hash are recorded in the return.

## Static statement and verification

For each fixed finite r>1 on the supplied standard smooth oriented S4 and its positive chiral SO(3) bundle, there is a smooth round-compatible positive definite connection with unique global spectral-ratio maximum r at x0. In old K=1 Euclidean coefficient conventions set p=sqrt(2/(1+r)), q=sqrt(2r/(1+r)), and s=(p,1,q). The reflected anti-self-dual triple is minus the pullback of the self-dual triple by reflection negating the unit radial direction. Its Gram is -I, with zero cross-chiral pairing. The exact model Gram on u in[0,1], v in[-5/2,0] is diagonal:

    M_i=(1+u(s_i-1))(1+(u+v/2)(s_i-1)), M_2=1.

Its first entry decreases and its third increases in both parameters. Their factors stay positive, including the lower bound (9-5q)/4>0. The quotient M3/M1 is at most r, with equality only at(1,0). The other five quotients are strictly below r: the two elementary comparisons use p<1<q; two reduce to strict monotonicity of 13z^2-5z^3 on(0,sqrt2); the last reduces to positivity of 9z-5-(5/2)z^2 on z in[sqrt2,2]. Thus this proves the cap even where spectral ordering changes.

At(1,0), simple ordered eigenvalues give log-ratio parameter derivatives 2(1/p-1/q) and (1/p-1/q)/2, both positive. The actual cutoff curvature formula retains the radial derivative term and the difference bracket. For this fixed r it and its u,v derivatives differ from the model by O_r(R), uniformly in angles and the full parameter rectangle. A positive model Gram floor gives quotient C1 convergence in these two parameters. A closed convex corner preserves simple gaps and positive derivatives, so comparison along the segment from(1,0) bounds the actual value by the exact uncut polynomial at the same punctured spatial point. The E235 strict local maximum controls this polynomial at a sufficiently small fixed-r radius. The complement of a relatively open corner neighborhood is compact and omits the unique equality parameter; its strict gap transfers by min–max and the common eigenvalue floor. This proves the exact cap everywhere on the annulus. Core and exterior bounds finish the construction. Connectedness and the nonempty round exterior fix the definite sign. All radii and estimates may depend on r; no limit as r approaches1 or infinity is imported.

## Original short-time crossing

The germ at x0 has the assessed native directional derivative d(log rho)[v]=1/2. Choose the smooth initial connection itself as reference in the [E28/E29 general local theory](E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md). The compact first-jet neighborhood gives strict adjusted parabolicity and a datum-dependent smooth interval. The compact frame-bundle ODE j'=-xi(Ahat) composed with j, j(0)=id, recovers A=j* Ahat. The Cartan derivative cancels the adjusted term with exactly this sign. Both the path and its native derivative are smooth through zero; reverse adjustment supplies original uniqueness. No near-round assumption enters this local input.

Simple eigenvalues persist at the fixed original point x0. For sufficiently small positive native t, log rho(A(t))(x0)>=log r+t/4. Therefore sup rho(A(t))>=r exp(t/4)>r. Every closed cap sup rho<=r, r>1 finite, fails to be invariant in this class. Spatial suprema are invariant under smooth orientation-preserving bundle pullbacks. The separate [near-round family](E243_E245_GLOBAL_RATIO_CAP_ASSESSMENT_20261123.md) has global existence and exponential round attraction modulo automorphisms; no such arbitrary-r conclusion follows here.

For each r, a single short trajectory also crosses an interval of strict thresholds immediately above r. This does not yet establish failure at each prescribed strict threshold: that requires an additional parameter-continuity argument. B114 addresses that specific gap. The stationary7/2 and margin-weighted conditional results retain their stated hypotheses. There is no singularity, arbitrary-homotopy-sphere initialization, uniform lifespan or novelty claim.

## References and frozen identities

The only imported flow and parabolic dependencies are Fine v2 Proposition4.2 and §4.2, and the previously checked Taylor 1991 author-text §7.3 through the branch compact-bundle proof. The Fine-cited Taylor 2011 Proposition8.1 remains unverified. The new model and cap proofs are displayed branch arguments. [Canonical consumer record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#fixed-ratio-cap-consumers--e248-through-e250).

| Input | SHA-256 |
| --- | --- |
| [248_FIXED_RATIO_RADIAL_MODEL_20261123.md](../notes/248_FIXED_RATIO_RADIAL_MODEL_20261123.md) | c86c9768910aedfb0e117042a6b5f049dc5ee98aa7de8782904cc7f106f4dcf5 |
| [E249_FIXED_RATIO_RADIAL_MODEL_AUDIT_20261123.md](E249_FIXED_RATIO_RADIAL_MODEL_AUDIT_20261123.md) | fbb09ae0835de9de37415fcfa05470e84ac55601a9056a2c9f9e5d5b5c2c17d0 |
| [250_CONDITIONAL_FIXED_CAP_LOCAL_FLOW_20261123.md](../notes/250_CONDITIONAL_FIXED_CAP_LOCAL_FLOW_20261123.md) | 2b4ff8990ff5e4a86c9ca22d5f9bdee762584d1435769453ee25c4d52c86b3ea |
| [SP4-CME-E248_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E248_RETURN_v1.md) | 73d01c3471cd26d08152624c007b5a7e1e8f0ceffec83a03f0a4100f33c641ed |
| [SP4-CME-E249_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E249_RETURN_v1.md) | df9d5f578d4fb25669fbd199046d00cb2a64fc81b53bd6360954dcb25747f8b3 |
| [SP4-CME-E250_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E250_RETURN_v1.md) | 0aacd0503adc48a691349d7f3142fc286802060e36afbcf956e22ccb5eb5fbab |
