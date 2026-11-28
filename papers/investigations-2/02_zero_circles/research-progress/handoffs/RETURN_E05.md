# ZERO-E05 return — Stress-case geometry

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The bounded dispatch specified GPT-6.2 Sol at ultra effort. Actual serving variant and effort were unavailable. [Request r1](REQUEST_E05_STRESS_GEOMETRY_20261127.md), base commit 6a422ce, and [execution note](../../notes/E05_STRESS_GEOMETRY.md).

**Certificate.** Both exact mollified classes have \(Y(c)>0\) and \(e/T<2\), with \(e=E_+=E_-\) and \(T=4\pi^2\).

| Case | \(t\) | Certified \(e/T\) | Certified \(Y(c)\) |
|---|---:|---:|---:|
| A | \(-3/4\) | \([0.00590,1.00731]\) | \(>2.21\) |
| B | \(3/4\) | \([0.00183,1.30521]\) | \(>4.45\) |

The \(16^4\) tests were inconclusive. The nested \(32^4\) fixed-point enclosures on \([-3,3]^4\) certified both cases and met the stopping test. For A, positivity follows from the gradient potential and a diagonal rescaling of Talenti's inequality. For B, positivity follows from the upper bound on \(\|(\Delta_y a)_+\|_2\) and the Euclidean Sobolev inequality. The exact interval inputs, proof of enclosure and primary Talenti receipt are in the execution note. A second Codex worker independently replayed both \(32^4\) runs and audited the inclusion and curvature algebra.

**Return to the lead.** Use the two certified geometry rows for ZERO-E02 within the [register's](../REGISTER.md) existing dependencies. The [replay program](../../numerics/e05_stress_geometry.py) reproduces the rational bounds.
