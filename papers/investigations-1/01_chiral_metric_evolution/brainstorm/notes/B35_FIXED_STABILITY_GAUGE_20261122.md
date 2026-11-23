# B35 — A fixed-reference stability gauge near a perfect connection

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead and effort preserved, actual identifiers unavailable.

The local theorem E41–E44 and adjusted continuation E45 do not preserve smallness. Near a perfect reference there is a concrete stability lead: Fine v2 §4.3 uses a positive self-adjoint linear operator G. Reinspect its precise kernel proof and its nonlinear implementation separately. In particular, live adjoints and the live expression Delta_A S_A* a have derivative-order issues that cannot be settled by their linearization at a=0.

Choose a new, explicitly distinct adjusted equation, with all differential gauge operators fixed at the smooth perfect reference A0:

    A_t = v(A) − d_A delta_0 a − S_A Delta_0 S_0* a,   a=A−A0.

Here v is Fine's physical gradient in native time and negative-Killing pairing; delta_0 is the covariant adjoint for A0 and g0; Delta_0 is the nonnegative rough Laplacian on vector fields for g0. The outer d_A and S_A remain live, so the two corrections are still infinitesimal bundle automorphisms. This is a different gauge from E26/E36, not a change to the physical gradient. At the reference its linearization should be −G0 from Fine Proposition4.12; away from it the coefficients should involve only the first jet and the order should remain two.

Freeze E47 to audit the exact linear coercivity and stable forced evolution for this fixed G0, initially on the round S4 only. Freeze E48 to check the corrected nonlinear order, generator, linearization and high-Sobolev quadratic remainder bounds. Use energy spaces C H^m intersect L2 H^(m+1), with derivative L2 H^(m−1), for a fixed m≥6; do not copy an unverified parabolic trace assertion from the source.

The possible later combination is a high-regularity stability theorem for this equation, and only then a separately checked positive-time smoothing and gauge-transfer corollary from E42. Neither is asserted by this decision. The positive-definite initial-data problem on arbitrary homotopy spheres and the general finite-temporal-strain endpoint remain separate.
