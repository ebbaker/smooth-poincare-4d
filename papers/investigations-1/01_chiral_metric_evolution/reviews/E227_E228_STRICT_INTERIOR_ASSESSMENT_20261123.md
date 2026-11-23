# E227/E228 — Strict-interior absorption assessment

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead assessment; actual model/effort unavailable and preserved. Derivation and independent audit were configured gpt-6.2-sol/ultra; independent runtime attestation unavailable. [Sole register](../research-progress/REGISTER.md).

## Accepted result and quantifiers

For old K=1 and Q_s=3 diag(1,1,s)/(s+2), 3<s<7/2, let N_s be the zero-speed edge vector (-sqrt(s)/2,1,-1)dx1 and Y have first slot diag(1,0,-1). The full derivative form gives R(N_s)=12s(7-2s)/(s+2), |N_s|^2=s+4, B(N_s,Y)=6sqrt(s)(2-s)/(s+2), R(Y)=12(5s+1)/(s+2)^2 and |V(Y)|^2=4R(Y). Completing the square at sigma=(s-2)/(2sqrt(s)(7-2s)) yields the necessary bound

    C(s) >= c_test(s) = (s+2)(s-2)^2/[16(5s+1)(7-2s)] - 1/4

for every pointwise speed-only coefficient at that center spectrum. The exact limit of (7/2-s)c_test(s) is 99/4736; hence the scaled liminf for any admissible C(s) is at least this number. This is not the optimum full-space coefficient. The strict-region minimum satisfies 0<kappa(r)<=12r(7-2r)/[(r+2)(r+4)] for 3<r<7/2 and thus tends to zero. No matching lower estimate is claimed by this packet.

Every fixed finite optimizing jet is realized by a smooth local quadratic SO(3) connection with positive curvature planes and the round-compatible sign. At its center rho=s, and for each s<r'<7/2 there is a sufficiently small closed ball with rho<=r'. This does not assert rho<=s on that ball or a uniform radius. It excludes a single finite pointwise speed-only coefficient on the union of these strictly locally pinched data. It gives no closed-manifold realization, integrated counterexample, flow failure, singularity or new critical connection. Fixed old/native scale factors preserve the qualitative failure.

## Independent content and lead checks

The lead read both full notes and returns and verified their identities. The mixed contribution 2lambda t minus half of 4lambda t(s-1) is 2lambda t(2-s). Square completion and the scaled rational limit were checked directly. The local quotient derivative uses the symmetric trace-free array and removes no further term at trace three.

E228 solved the actual Bianchi equations on Y and N_s separately, rather than importing E223 mixed entries. Its direct principal value 12lambda s+8lambda minus skew value 8lambda(s-1)^2 also recomputes R(N_s)=4lambda s(7-2s), independently checking the assessed axial specialization used by E227. The audit verifies the actual speed square, covector and internal norm factors, polynomial curvature derivative, quotient normalization, strict-neighborhood continuity and liminf quantifiers. Shared foundations and previous authorship are disclosed in the audit. No new primary source was imported or inspected; this is a branch derivation with the inherited source record retained.

The endpoint case is separately accepted in [E223/E225](E223_E225_ENDPOINT_ABSORPTION_ASSESSMENT_20261123.md). B108/E229 tests an effective lower bound from the existing Bernstein certificate, independently of this upper bound; consult the register before using that proposed consequence.

## Frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [notes/227_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md](../notes/227_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md) | `f3d777307b40ea66d74f8f06432d08b839ab75e2c2804d3b1584ec91749e0412` |
| [research-progress/handoffs/SP4-CME-E227_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E227_RETURN_v1.md) | `e18fdf8e7af806c5bb435121b027f22c558ee5400199f7e911df13e1cbe5d6d5` |
| [reviews/E228_STRICT_INTERIOR_ABSORPTION_AUDIT_20261123.md](../reviews/E228_STRICT_INTERIOR_ABSORPTION_AUDIT_20261123.md) | `ab69acd97a9a4b3d255f537f773cf1afe02408f9c1299311da7b8325f0250e2e` |
| [research-progress/handoffs/SP4-CME-E228_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E228_RETURN_v1.md) | `d528a07c9256a95488996ae5d9a52ce325a65450c2408a308da25080c141f8cb` |
| [reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | `be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa` |
| [reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) | `a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5` |
