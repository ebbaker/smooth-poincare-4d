# B51 — A low-order endpoint estimate for the orbit solver

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable.

The smooth local section is now assessed, but its smooth tame neighborhoods can involve higher derivatives of the coefficient fields. Extending slice placement to the full value-small basin requires more. The next bounded dependency is an estimate for the actual infinitesimal solver at the intrinsic Lorentz endpoint, with constants uniform under value smallness alone.

Use the same reference N and K0=d0*Pi0d0 as E71, and the actual K_A=d0*Pi_A d_A and restricted solver as E79. The target is a uniform estimate for smooth one-form r:

    ||phi||W(1,(4,1)) + ||phi||C0 + ||u||L(4,1)
       + ||r_sl||L(4,1) <= C ||r||L(4,1).

The constants may depend on the fixed reference and a sufficiently small sup norm tube for A−A0 and F_A−F0, but not on their higher derivatives. Begin by proving the fixed-reference divergence estimate K0^dagger d0*:L(4,1)(one-forms)→W(1,(4,1))(E), after projecting the forcing off the finite smooth kernel. The E66 fixed inverse and Lorentz layer method are useful models, but its non-divergence forcing estimate for G0 does not automatically imply this distinct operator estimate. Derive the needed order-zero gradient multiplier and localization estimate explicitly.

Then write the equation as a perturbation of K0 on W(1,(4,1)) intersect N-perpendicular. Multiplication by Pi_A−Pi0 and a=A−A0 costs only their sup norms inside the divergence forcing. A small Neumann perturbation should preserve the estimate. Identify the resulting solution with the E79 weak solution using the finite-volume embeddings and uniqueness, and use the exact u and residual formulas. Prove the endpoint C0 bound for phi from its W(1,(4,1)) norm on the fixed compact four-manifold.

E88 will test this precise estimate. It must account for the N projection and all lower-order terms, and must not smuggle coefficient derivatives into a uniform constant. The desired bound controls the horizontal parameter only in L(4,1), so even a successful result does not give a C1 vector-field flow or finite value-only slice placement. No intrinsic-budget claim beyond the assessed smooth orbit neighborhood follows from this linear estimate.
