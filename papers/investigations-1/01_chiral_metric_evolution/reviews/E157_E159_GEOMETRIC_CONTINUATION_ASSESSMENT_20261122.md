# E157–E159 — Topological positivity and geometric continuation

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Selected lead retained; actual lead model and
effort unavailable. Helpers configured gpt-6.2-sol/ultra; independent
runtime attestation unavailable. Lead read E157, the full E158 audit
and return, and E159 and its return. Frozen identities below matched.
This is a conditional geometric continuation result, not an a priori
estimate, a classification or a smooth Poincaré proof.

## Accepted static argument

The [E158 audit](E158_SEMIDEFINITE_LIMIT_AUDIT_20261122.md) passes the
[E157 derivation](../notes/157_SEMIDEFINITE_LIMIT_RANK_TEST_20261122.md).
The [assessed E155 extraction](E155_E156_STATIC_PAIR_COMPACTNESS_ASSESSMENT_20261122.md)
uses no Q floor through its semidefinite limit: each individual
curvature isometry is defined, while its derivatives cancel exactly
in the normalized chiral connection. Positive C1 metric convergence,
native bounds for b and its full chiral derivative, and the bound
|D_A Q|≤6|T| give a uniform subsequential connection–curvature limit.
The square root is uniformly continuous on a bounded semidefinite
matrix range. Curvature and Bianchi pass directly in distributions.

The relative quadratic-form bound with coefficient 4|T| transports
the limiting kernel along every fixed curve on the same subsequence.
Constant rank gives a continuous kernel projection, and coordinate
transport gives its C1 regularity. The continuous connection has a
continuous exterior derivative; alternating mollification justifies
curvature preservation of the projection without assuming all
ordinary derivatives of the connection are functions. Rank two
contradicts the SO(3) stabilizer and curvature image. Rank one gives
a global parallel unit section on the simply connected base. The
resulting scalar C1 self-dual closed form has squared norm three.
Closed smooth approximation by averaging pullbacks, followed by
de Rham and Stokes with H²(M;R)=0, contradicts its positive square
integral. Trace three rules out rank zero. The positive limiting
floor, curvature sign and native metric reconstruction follow.

Thus on a fixed smooth closed connected oriented simply connected
four-manifold with H²(M;R)=0, supplied positive C1 metric compactness
and uniform live |T|+|D_A T| suffice for positive pair compactness
on the fixed SO(3) bundle. The smooth normalizers need not have
common derivative bounds. E157's historical conditional wording is
preserved; its extraction dependency is now discharged.

## Accepted sequence criterion

The [E159 derivation](../notes/159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md)
correctly combines the already assessed temporal equivalence,
pointwise native curvature estimate, R29 fixed-base compactness and
E155 with the [sequential criterion](E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md).
With k²=4π/5 and sup Psi≤P, put B=(1+4√3)P/k² and
Z=√6/2+(42+8√3)B. The estimates give G≤B,
|T|+|D_A T|≤√B+B and |Ric|≤3+(2+2√3)Z.
Lead recomputed the native scalar target 6 and the Ricci constant.
No W− estimate or Q floor enters that Ricci bound.

R29 Theorem 2.2 supplies positive strong C1,alpha metric compactness
under Ricci, injectivity and diameter bounds. Orientation is repaired
by choosing one sign subsequence and, when necessary, composing on
the right with the inverse of one fixed reversing member. This
preserves the convergence after a fixed pullback. For a general
connected base, a uniform direction distortion D gives Q≥D^−2 I.
E155 gives a positive pair limit and E148 gives original extension.
The bounds are required simultaneously on one sequence approaching
the finite endpoint, not at all intervening times.

E159 explicitly froze its topology improvement under H_top rather
than relying on an unassessed E157. The preceding E157/E158
assessment now proves exactly H_top. Consequently on the stated
simply connected H²=0 topology, including a smooth homotopy
four-sphere, the D bound can be dropped: simultaneous bounds on
Psi, positive injectivity and diameter along one late sequence give
smooth definite extension in the old bundle identification.
This discharges the frozen premise without rewriting E159.

No estimate supplies those geometric bounds for arbitrary solutions.
The topological argument assumes an already positive metric limit
and does not prohibit metric singularities. E160 leaves injectivity
in place. No general initialization, infinite-time convergence or
novelty assertion follows.

## Frozen identities

| Input | SHA-256 |
| --- | --- |
| E157 note | 50e48a665f370b3c24b642f3e172e32f53ffbdc0775e3ae198dedb19fbabdde9 |
| E158 request | c0b8a03a224f50f2802e4756d211e1767cd40587ef62a72343d14f5a48cef63b |
| E158 audit | 1b2a44fb858cfcda7920fbd50e013da50fdbf0f2ebef86b5b5d44b44dd8b02c1 |
| E158 return | 2cc631c81d687bf7fb4ff5b9931111ae03784b05e3ef37d6377258903545ac21 |
| E159 note | eb5a66fc93fcf8e04e41870caa426e09399944be2a302b008befffb513851156 |
| E159 return | aa90b552e3d855b687a79c323db5212faadfbc02bd2183ec04120aab3b022e10 |

