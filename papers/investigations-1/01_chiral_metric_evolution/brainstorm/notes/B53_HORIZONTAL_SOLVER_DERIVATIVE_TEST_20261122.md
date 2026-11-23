# B53 — A fixed high-frequency test of horizontal regularity

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable.

E88 leaves the horizontal parameter only in L(4,1). Before trying to integrate that inverse with critical coefficient bounds, test whether a uniform C1 estimate is even plausible for this particular solver. Use a frozen flat periodic model of the E79 fiber algebra and differential principal part, explicitly not a global definite SO(3) connection on S4.

On flat T4 choose a constant oriented orthonormal self-dual triple F0 and S0u=i_uF0. Then S0*S0=3I/2 and K0=d*Pi0d=(2/3)Delta on the trivial internal bundle, with kernel the constants. Fix xi=dx1, u0=e1, v=e2 and r0=S0u0. Set f_n=(epsilon_n/n)sin(nx1), a_n=f_n S0v, beta_n=d a_n, and F_theta=F0+theta beta_n. Use S_theta, H_theta=(S0*S_theta)^(-1)S0*, Pi_theta=I-S_theta H_theta, and K_theta=d*Pi_theta d. This omits connection bracket terms and is only a frozen differential model.

The shear x -> x+theta f_n(x1)v has determinant one and should pull F0 back to F_theta exactly. The proposed exact decomposition of r0 is

    phi_theta=theta f_n (S0v)(u0),
    u_theta=u0−theta f_n' v,
    residual=0.

Verify its sign, normalization, uniqueness with mean-zero phi and all three slice constraints. At theta=1 and epsilon_n=n^(−3/4), the full pair (a_n,beta_n) should tend to zero in the flat B^(1/2)_(8,1) norm, whereas the C1 norm of u_theta diverges. This is a specified model test, not a claim that such a counterexample has been realized for the full curved connection solver. It would delimit an attempted Banach estimate for the frozen inverse and explain why the low-order endpoint result alone cannot justify C1 integration.

E91 must keep this evidence boundary explicit. If the exact decomposition fails, compute the actual derivative at theta=0 and return the corrected scoped conclusion. Do not infer failure of nonlinear slice placement or of a different solver.
