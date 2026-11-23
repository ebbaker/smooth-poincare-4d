# B55 — Test the finite flow before interpreting derivative growth

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable.

The exact E91 frozen solver has a large horizontal C1 norm despite small coefficient-pair norm. That does not by itself settle finite-flow control. Its vector field is u_n=e1−epsilon_n cos(nx1)e2 and is the pullback of constant translation by the small shear Psi_n(x)=x+f_n(x1)e2. This gives a ready check of cancellation along trajectories.

E94 will compute the autonomous flow Phi_t=Psi_n^(-1) composed with R_t composed with Psi_n, where R_t translates x1 by t. The proposed formula is

    Phi_t(x)=(x1+t, x2+f_n(x1)−f_n(x1+t), x3, x4).

Check uniform C0 and C1 closeness to R_t, including the inverse, for bounded time intervals and the prescribed epsilon_n=n^(−3/4). At the same time compute the integrated C1 size of the generator. If the expected cancellation holds, retain both conclusions: this inverse has no uniform instantaneous C1 bound in the frozen coefficient norm, while this particular finite flow does remain uniformly close to translation. This is a reason to examine transport-adapted estimates in future conceptual work, not an established mechanism for the actual nonlinear slice.
