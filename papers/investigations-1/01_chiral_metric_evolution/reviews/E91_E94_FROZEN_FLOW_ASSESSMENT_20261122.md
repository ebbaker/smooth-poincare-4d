# E91/E92/E94 — Horizontal derivative growth and finite cancellation

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable. Helpers configured gpt-6.2-sol/ultra; independent runtime attestation unavailable.

The lead read [E91](../notes/91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md), SHA-256 d566e2d9594c1ab42af2523ebd74c25b403e58fa4146a3f9e761a964a082a7f0, the independent frozen-model check in [E92](E92_GEOMETRY_AND_FROZEN_MODEL_AUDIT_20261122.md), SHA-256 3093463d094a65495b6e40abce8ccb09fd6144c0b2455c7fef90bd53d86d82c4, and [E94's exact flow](../notes/94_FROZEN_FINITE_FLOW_CANCELLATION_20261122.md), SHA-256 7181861c247b0a63a70743072031e6966a24bef274d0177f75c23115861e7f5b. E91 and E94 have different authors. The lead checked E94 by direct differentiation and composition; this is not represented as a further independent helper audit. Both computations are accepted.

The normalized self-dual constant triple and the periodic shear give an exact mean-zero splitting with zero residual. For epsilon_n=n^(−3/4), its coefficient-pair B^(1/2)_(8,1) norm tends to zero like n^(−1/4), while the selected horizontal output has C1 size of order n^(1/4) at fixed forcing. This excludes C1 continuity of that frozen inverse in that coefficient topology. The low-order horizontal values and Lorentz norms remain bounded.

Its autonomous vector field nevertheless has exact flow

    Phi_(n,t)(x)=(x1+t, x2+f_n(x1)−f_n(x1+t), x3, x4).

For the periodic difference from the translation lift, the kth derivative sup norm is 2 epsilon_n n^(k−1)|sin(nt/2)|, including k=0 for displacement. Both direct and inverse flows converge in C1 uniformly for all times. On a fixed positive interval the integral of the generator C1 norm diverges like T n^(1/4). The oscillation is integrated along each trajectory before taking its modulus; the sup-first sufficient bound misses this cancellation. Higher derivative divergence is an interval supremum statement, not a statement at every fixed time.

The frozen ordinary derivative and the nonzero prescribed curvature triple are not an actual SO(3) connection, since d²=0 conflicts with [F0,·]. Neither computation establishes a curved-connection obstruction, failure of another inverse, or failure of finite placement. B56/E95 is a new actual round-orbit construction that must be checked on its own.
