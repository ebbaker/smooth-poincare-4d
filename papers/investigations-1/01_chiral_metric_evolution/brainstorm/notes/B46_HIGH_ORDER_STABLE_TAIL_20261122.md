# B46 — Bootstrap the stable tail before strengthening its recovered limit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable.

The current [E49 theorem](../../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md) gives a smooth stable path with exponential Hm decay for a fixed m≥6. Its exact second-order remainder and fixed graph norms suggest a further consequence: exponential decay in each higher norm for each supplied smooth input, with constants that can depend on that input's higher derivatives. This is different from uniform high-order estimates depending only on its initial value size.

Fix the existing theorem at m=6. For k≥6, test the tame inequality

    ||N(a)||H^(k−1) <= Ck ||a||H6 ||a||H^(k+1).

Use the exact coefficient structure C(x,a,d_Aa)D²a plus lower first-jet terms, subtracting the full linearization. Coefficient and lower differences have zero linear remainder, reference derivatives are fixed, and H6 controls C3 in dimension four. The product bound must keep the high derivative linear, rather than replacing both factors by the high norm. The Taylor inputs already checked for E49 may be used only in their recorded form; no new theorem is imported by name.

If this estimate holds, the positive graph energy for J=I+G0 at order k has nonlinear pairing bounded by Ck||a||H6 ||a||H^(k+1)². The exponentially decaying H6 norm eventually becomes smaller than the k-dependent absorption threshold. At that finite time the path is already smooth, so its high energy is finite. This gives decay thereafter for every k without requiring all higher initial norms to be small or the intersection of infinitely many datum radii. Derive the graph dual pairing precisely.

E76 executes this fixed test and its direct ODE consequence. Each spatial derivative of the stable recovery generator costs finitely more derivatives of a. If every such norm is integrable, induction on derivatives of the inverse-flow ODE should give a smooth limiting automorphism and inverse. The earlier local recovery is smooth on a finite interval, so it needs no uniform high-order critical estimate for this qualitative conclusion. The result would apply to E50's smooth small-value basin, with nonuniform high-order constants, and improve the asserted limiting regularity beyond the provisional C1 result of E74. It would not construct a nonlinear initial slice or initial data on an arbitrary homotopy sphere.

A successful derivation remains subject to separate audit and integration. If the tame inequality contains an unabsorbable high-order term, report it precisely and retain only the already proved finite-order conclusion.
