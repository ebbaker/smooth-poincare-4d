# B56 — Realize the derivative test on the actual round orbit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable.

The frozen E91/E94 family separates large instantaneous derivatives from controlled finite transport. Its curvature-compatibility limitation can be tested directly by using actual bundle pullbacks of the round connection. This preserves all curvature identities, and the E79 inverse is exactly computable for a pure horizontal forcing.

Choose nested coordinate cubes on S4 inside a principal-bundle trivialization. Let a smooth cutoff rho equal one on the inner cube and vanish near the outer boundary. Put V_n=(epsilon_n/n)rho(x)sin(nx1)e2, epsilon_n=n^(−3/4), and let psi_n be its time-one base flow. On a slightly smaller cube it is the exact shear for large n. Extend the map by identity and lift it in the chosen trivialization by G_n(x,h)=(psi_n(x),h), again identity outside. Then A_n=G_n*A0 is an actual perfect connection, and F_A_n=G_n*F0.

Choose a fixed smooth u0 equal to e1 on the smaller cube, with support inside the chart; put r0=S0u0. Define u_n=psi_n* u0 in the vector-field pullback convention, and r_n=G_n*r0. Naturality gives r_n=S_A_n u_n. Hence the exact E79 normalized solution for r_n is phi_n=0, horizontal u_n, residual zero. On the inner cube u_n=e1−epsilon_n cos(nx1)e2, so its C1 derivative grows like n epsilon_n.

The intended estimates are that the coefficient pair (A_n−A0,F_A_n−F0), and the forcing-pair differences (r_n−r0,d_A_n r_n−d0r0), tend to zero in the fixed localized B^(1/2)_(8,1) norm. C0 bounds O(epsilon_n) and first-derivative bounds O(n epsilon_n), followed by a derived dyadic interpolation inequality, should suffice. This would show failure of C1 continuity for this particular actual inverse in the specified joint critical topology, even on perfect connections. It does not exclude other right inverses or finite sections.

The same construction should give an exact auxiliary flow conjugacy: the A_n-horizontal lift of u_n is G_n* of the A0-horizontal lift of u0, so its finite flow is G_n^(-1) composed with the fixed reference flow composed with G_n. Because G_n is C1-close to identity, both finite flows and inverses should be C1-close on each bounded time interval. This auxiliary transport is distinct from Fine's original flow, which is stationary on the perfect A_n.

E95 is the bounded actual-connection test of these formulas and norm estimates. If a global lift, derivative estimate or exact inverse identification fails, return the precise failure and preserve the valid frozen evidence.
