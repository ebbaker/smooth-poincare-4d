# SP4-CME-E30 return v1 — curvature-value parabolic region

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. Return to [request v1](SP4-CME-E30_REQUEST_v1.md).
The [derivation](../../notes/30_CURVATURE_COEFFICIENT_REGION_20261122.md)
records the exact coefficient inventory and its algebraic scope.

## Disposition

Verified the requested nondivergence representation for the
E27 fixed-vertical-adjoint operator. The strongest principal
dependence displayed is \(\mathsf P^{ij}(x,A,F;\bar A,\bar F)\),
with no symmetric first jet and no derivatives of the fixed
reference beyond its curvature value. In particular,
\(d_Aa=F-\bar F+[a\wedge a]/2\) makes the undifferentiated two-form
in the live horizontal codifferential a value coefficient.
The derivatives of \(g_A\) are linear in \(\partial F\), which
splits into a second jet and a term linear in \(\partial A\).
The two lower-order coefficients can depend on fixed higher
reference derivatives.

Small \(C^0\) differences of both connection and curvature from
the reference suffice for the negative principal quadratic-form
gap. Under E24's hypotheses the unadjusted fields have joint
continuous limits in the fixed identification and range over
compact definite value sets. This permits uniform algebraic gap
and closeness constants for late smooth references, and continuous
principal coefficient values with a common continuity modulus.
Their time modulus can be bounded by the integrable E24 velocities.
This does not give a specific Hölder or Dini modulus, higher
uniform reference norms, or a first-jet estimate.

The evaluation on the given unadjusted fields supplies no
control of an adjusted trajectory or reverse automorphism.
Parabolic regularity, a uniform existence time or endpoint
continuation remain outside the result.

## Frozen inputs

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B25_CURVATURE_COEFFICIENT_REGION_20261122.md` | `a71a2c27d89c85f8329c58ed63757c9ce41db28eaec8eb39d1d08fbb20d59b61` |
| `notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md` | `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590` |
| `notes/24_TEMPORAL_BOOTSTRAP_20261122.md` | `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44` |
| `research-progress/handoffs/SP4-CME-E30_REQUEST_v1.md` | `1c05ad3dd15ca8bd08a2e39f54272fc7bb97e2604cb39ec0b31ae17bc32ec446` |

The symbolic derivation is analytic. No numerical artifact was used.
