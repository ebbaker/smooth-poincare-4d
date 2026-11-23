# E254/E255 — Effective static recognition assessment

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model/effort preserved and unavailable. Helpers configured gpt-6.2-sol/ultra, independent runtime attestation unavailable. The lead read both full outputs and returns and independently checked the simplex minimum, rational threshold ordering, old/native comparison and sphere-theorem inference. This is internal verification, not external peer review.

Accept [E254](../notes/254_EFFECTIVE_STATIC_RECOGNITION_20261123.md) and the independent [E255 audit](E255_EFFECTIVE_STATIC_RECOGNITION_AUDIT_20261123.md), which did not access E254. Credit N4 of the [Claude Fable5.2 review](EXTERNAL_MANUSCRIPT_REVIEW_20261123.md) for observing the combination of the existing small-strain estimate and static sphere criterion. Its numerical minimum is replaced by the displayed exact calculation in these packets. The review's author/model/effort are as reported there, not independently attested.

For supplied smooth positive-plane round-compatible definite SO(3) data on a smooth closed oriented homotopy four-sphere, use native Riemannian reconstruction and negative-Killing pairing. Either of the explicit conditions

    sup G <= epsilon_static = 3/[4(2+sqrt3)(78+8sqrt3)],
    sup Psi <= [4pi/(5(1+4sqrt3))] epsilon_static

forces the base to be diffeomorphic to standard smooth S4. G=|nabla^A T|+|T|^2 and Psi is the whole-direction-sphere density with fiber area4pi and the already assessed chiral horizontal derivative. No diameter or quantitative Sobolev bound is added. This is a static supplied-data criterion; it neither constructs initial data nor asserts that the given connection is perfect, that its metric is round, or that these explicit constants ensure global convergence.

The exact minimum p_* on the nonnegative trace-three simplex outside the two selected spectral neighborhoods is (12-sqrt6)/16. With z=lambda-I and t=|z|, the maximum-coordinate restriction gives 1/2<=t<=sqrt(7/2). The product estimate z1z2z3<=t^3/(3sqrt6) follows from AM–GM when the product is positive. Thus P>=3t^2(1-t/sqrt6), whose minimum on that interval is its lower endpoint value; the upper endpoint is strictly larger by a rational square-root comparison. The spectrum I+(2,-1,-1)/(2sqrt6), up to permutation, is admissible and attains equality. Rational separators prove the third epsilon0 entry is smallest. These are exact statements with no floating-point premise.

At old K=1/2 the metric is native and endomorphism norms of q,T,nabla^A T agree under constant internal rescaling. The inherited |q|<=72G gives R_(1/2)<1/2. The previously assessed Chang–Gursky–Yang application has positive Yamabe constant, native topological volume32pi²/3, and full four-index Weyl integral at most64pi²/3<32pi². Simple connectivity excludes RP4. The theorem is used at its already inspected published p.107, Theorem A, equation(0.3), Remarks1–2 scope. [Inherited static source assessment](E08_E13_CONTROL_ASSESSMENT_20261122.md). No new classification result or source inspection is claimed.

The separate energy/strain thresholds that prove a global original round-attracting flow remain non-effective. The external review's broader N3 optimization and linear/background proposals were not executed here. At the author's request this is the last new research consequence in the bounded closing checkpoint; only integration, verification and a brainstorming handoff remain.

| Input | SHA-256 |
| --- | --- |
| [254_EFFECTIVE_STATIC_RECOGNITION_20261123.md](../notes/254_EFFECTIVE_STATIC_RECOGNITION_20261123.md) | 0c6fd55898b624e3ae2b58baa20403b869640b43d3b77a37ebe1c91914dcbe81 |
| [E255_EFFECTIVE_STATIC_RECOGNITION_AUDIT_20261123.md](E255_EFFECTIVE_STATIC_RECOGNITION_AUDIT_20261123.md) | 2772cd9e7fd92f4706fd272a13e31a517b31bdec8e2184b43095b3a226ed8d32 |
| [SP4-CME-E254_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E254_RETURN_v1.md) | 010911d78d4f02864b2c9633fd8a19387c773cd3c689448dccb820983f7309f2 |
| [SP4-CME-E255_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E255_RETURN_v1.md) | 408353d1c2247b42aaff10221d73b06aa26d80c58c5bc830148436b266389ef0 |
