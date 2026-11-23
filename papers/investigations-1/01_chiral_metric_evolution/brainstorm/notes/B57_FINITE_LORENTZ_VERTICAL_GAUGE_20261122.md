# B57 — Separate the finite vertical gauge from horizontal transport

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable.

The Feehan comparison leaves a representative/quotient norm implication unproved. The horizontal derivative test concerns a different part of the full action. A direct fixed-reference Lorentz construction may settle the finite vertical step under the value-small hypotheses without pretending to solve the horizontal equation.

Freeze two dependencies. E98 tests finite internal Coulomb gauge for smooth a=A−A0 with small fixed L(4,1) norm. The ordinary scalar covariant Laplacian K=d0*d0 has no kernel at the round SO(3) connection: a parallel adjoint section commutes with all of F0 and hence vanishes. Derive the fixed divergence inverse L=K^(-1)d0*:L(4,1)→W(1,(4,1))⊂C0 by the E88 method for this different operator.

Use the internal gauge convention u(A)=uAu^(-1)−du u^(-1), with u=exp(phi). Relative to A0,

    b=u a u^(-1)−(d0u)u^(-1)
      =a−d0 phi+N(phi,a).

The pointwise exponential identities should give N bounded in L(4,1) by C||phi||C0 (||d0phi||L(4,1)+||a||L(4,1)), with the corresponding Lipschitz estimate on a small W(1,(4,1)) ball. Solve phi=L(a+N) by contraction. The target is a finite gauge with quantitative C0 and derivative-Lorentz bounds and d0*b=0. Smoothness for smooth a must be proved, not inferred from the weak contraction.

One candidate regularity route uses the matrix gauge equation. For w=u−I it has the form (I+Delta0)w=B^i D_iw+f, with B small in L4 from Du and a, and f bounded when a is smooth. First obtain H2 from the quadratic equation; then invert the small first-order perturbation on W(2,3), identify the H2 solution, and bootstrap through W(2,6) to smoothness. Constants at higher orders may depend on derivatives of a. E98 must check this route or give a precise correction.

E99 independently tests the static supplied-Coulomb estimate: if b is smooth, d0*b=0, and eta=||b||L4+||F_(A0+b)−F0||C0 is small, then ||b||W(1,8)+||b||C(0,1/2)≤C eta. The fixed elliptic first-order estimate and d0b=beta−[b,b]/2 should give W(1,3) by a small L4 absorption, then L12, W(1,6), C0 and W(1,8). Prove the exact fixed estimates and thresholds. This statement can be checked without assuming E98.

If both hold, a connection/curvature value-small input admits a smooth vertical Coulomb representative small in W(1,8), because the finite gauge is uniformly near identity and its curvature transforms algebraically. The metric is unchanged by an internal gauge. This still does not impose S0*b=0, control the full horizontal inverse in C1, or extend the intrinsic theorem beyond W. No novelty claim is intended; the canonical Feehan comparison remains relevant context.
