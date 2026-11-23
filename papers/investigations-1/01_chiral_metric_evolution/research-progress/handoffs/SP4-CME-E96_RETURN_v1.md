# SP4-CME-E96 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I did not author E95
or its four frozen notes E79, E53, E91 and E94.
I previously audited E79 and E91 in E80 and E92 and authored
related E71, E66 and E82. See the [request][req] and [audit][review].

## Disposition

E95 passes on the actual round chiral bundle. The selected E79
horizontal output fails \(C^1\) continuity at \((A_0,r_0)\)
in the stated joint critical topology. The auxiliary finite
maps converge in \(C^1\) on each fixed bounded time interval.

- Nested cubes give the exact positive and negative inner
  shears. The smooth equivariant lift is identity on a collar
  and glues to the identity across the nontrivial bundle.
  Map and inverse displacement and \(C^1\) error are \(O(\delta_n)\)
  and \(O(\epsilon_n)\), and their \(C^2\) difference from identity
  has order \(n\epsilon_n\).
- The curvature is actual, \(F_{A_n}=G_n^*F_0\), and
  \(d_{A_n}r_n=G_n^*d_0r_0\) exactly.
  Fixed frame and cutoff errors respect the pullback estimates.
  The verified \(L^8/W^{1,8}\) block interpolation gives
  \(O(n^{-1/4})\) convergence for both the connection–curvature
  pair and the forcing–derivative pair.
- The forcing is \(r_n=G_n^*r_0\) and varies. At the
  chart origin its difference from \(r_0\) is
  \(\epsilon_n F_0(e_1,e_2)dx^1\ne0\).
  The exact identity \(r_n=S_{A_n}\psi_n^*u_0\) makes
  the normalized E79 solution \((0,\psi_n^*u_0,0)\).
  At an inner point the horizontal reference difference
  vanishes but its covariant derivative has order
  \(n\epsilon_n=n^{1/4}\) in fixed global norms.
- Actual horizontal lifts obey \(Y_n=G_n^*Y_0\).
  Hence the direct auxiliary maps are
  \(G_n^{-1}\circ\Theta_{0,t}\circ G_n\) and their
  inverses have \(-t\) in the middle.
  Their \(C^1\) errors are \(O_T(\epsilon_n)\) on
  \(|t|\le T\), using only the first derivatives of
  \(G_n^{\pm1}\) and fixed derivatives of the reference
  maps. The original Fine path is stationary since
  \(Q(A_n)=I\) and \(T(A_n)=0\).

No correction was found. The conclusion concerns the stated
selected solver with jointly converging, varying forcing.
No claim about fixed forcing for this example, other solvers
or failure of finite placement follows. No primary source was
newly inspected or imported. Only the named audit and return
were edited.

## File identities

The E95 note and all inherited frozen hashes matched.
The B56 digest records the observed rationale.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E96_REQUEST_v1.md | `ca7b31c863eeaed9b6b86337363a1ad058fd3955a5762b1cbaf8fb7c16666fac` |
| SP4-CME-E95_REQUEST_v1.md | `6d5a282b1d0d646b733464effe6eb21c8c6c388c6bcacdfff3d1a79006dcdd51` |
| B56_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md | `7052b90727d7ee36802baaf6d15c911587d801b356f14647e4e42618885dd788` |
| 95_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md | `1a5930ba2052e2f97d0c8fe869cc0f9a0407509ad9182c33a6efbea60e4b59af` |
| 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| 53_CRITICAL_FINITE_P_HEAT_20261122.md | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |
| 91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md | `d566e2d9594c1ab42af2523ebd74c25b403e58fa4146a3f9e761a964a082a7f0` |
| 94_FROZEN_FINITE_FLOW_CANCELLATION_20261122.md | `7181861c247b0a63a70743072031e6966a24bef274d0177f75c23115861e7f5b` |
| E96_CURVED_ORBIT_EXAMPLE_AUDIT_20261122.md | `4d46618e45e51902f81bbc8c180f183005bbea376dd9ee572945636f1f0f7747` |

[req]: SP4-CME-E96_REQUEST_v1.md
[review]: ../../reviews/E96_CURVED_ORBIT_EXAMPLE_AUDIT_20261122.md
