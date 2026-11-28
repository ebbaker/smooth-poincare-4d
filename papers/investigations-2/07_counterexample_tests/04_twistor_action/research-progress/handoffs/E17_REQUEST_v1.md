# SP4-TWA-E17 · Polar global bound using the angular current

Frozen request v1, 28 November 2026 (America/New_York), for Edward B. Baker III, Codex lead. Author-selected lead GPT-6.2 Astra/ultra; helper configured GPT-6.2 Sol/ultra. Independent backend telemetry unavailable. Baseline `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`. [Register](../REGISTER.md).

B08 extension of the global comparison after isolating the spinor angular current. For ψ=e^{bt+u}g, |g|=1, unit boundary g=σ, log correction u vanishes at ends. At isolated compatible transverse zeros deal with g,u as H¹ (derivatives O(1/r)), cutoff/distribution justification, or prove there are no such zeros on this domain. In a parallel frame set K_i=Σ_{j≠i}<g,c_i c_j ∂_j g>. Recompute ∫ |Pψ|²/|ψ|² as D(3/4)b²+(3/4)∫(|du|²+|dg|²)+(1/2)∫du·K+(b/2)∫K_0. Verify |K|≤√3|dg| from Clifford, complete the square, and control ∫K₀=<g−σ,T(g−σ)> with T=Σc₀c_i∂_i, Fourier |T|=|k| and time Dirichlet. Test global minimality for |b|≤( (2π)²+(π/2)² )/(2π)=17π/8 using Jensen and prove equality/uniqueness if possible at endpoint. Scope: same product and finite-cost class, no extra geometry. Report precise bound or failed identity.

Own only `notes/E17_POLAR_LOWER_BOUND.md` and `research-progress/handoffs/E17_RETURN.md` in this branch. Include hypotheses, date, author/model provenance, constants, limitations and failure disposition. Return changes of target to B08; do not edit shared files.

Frozen SHA-256, paths relative to this branch

```text
9ffcc3c64a9deb63a3aafca72005a985d55992979dd888b018b7084e48115280  research-overview/OVERVIEW.md
8acfc1b19d209161098b4b2c8c1c66d969078766173ce82eda990e723e7482ed  continuation-notes/CLOSING_B07_GLOBAL_MINIMUM_20261128.md
56dd6ce033df6237a8efc3de9f23a42861a986140dcc5c695210b7188610521f  reviews/E13_GLOBAL_MINIMUM_REPLAY.md
06f959c03d711e80edc479c5858a62068b6d4dec9e638d5ed24e720b4c4f1014  notes/E11_GLOBAL_COMPARISON.md
2bd781958d2f045befbd5cea19a9c485432289670a96a7d0187fd037403346ba  notes/E12_CYLINDER_CONSTANT.md
c5e19983b3538ec65fb7c86298654a88f3cc9545605deddbfc0c8482a6328194  notes/E08_LOCAL_DIRICHLET.md
6ca49af7b6de882bae911bb54a142c85576e97c6c9350b2add2fc41162251140  brainstorm/notes/B08_SLOPE_AND_HELICITY.md
```
