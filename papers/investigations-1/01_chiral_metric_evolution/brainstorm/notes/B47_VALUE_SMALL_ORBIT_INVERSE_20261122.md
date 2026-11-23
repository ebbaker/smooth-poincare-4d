# B47 — A varying infinitesimal orbit inverse under value smallness

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; identifiers unavailable.

The assessed [linear slice](../../reviews/E71_E73_LINEAR_SLICE_ASSESSMENT_20261122.md) has a horizontal parameter with no derivative gain. Differentiating a finite pullback using a fixed A0-horizontal lift produces a transport derivative of a. There is another useful local linearization: lift horizontally with the actual connection A. Its infinitesimal orbit direction is d_A phi+S_Au, with S_Au=i_uF_A. This formula depends on the values of A and F_A, and absorbs the transport derivative into the curvature. It may give an inverse with low-order constants depending only on their value tube, even though it does not itself construct a finite nonlinear slice.

Keep the fixed target slice X=ker S0* intersect ker d0*. For A=A0+a in the small reference value tube, set

    C_A=S0* S_A,
    Pi_A=I−S_A C_A^−1 S0*,
    K_A=d0* Pi_A d_A.

C_A is invertible near S0*S0=3I/2. Pi_A has range ker S0*, fixes that subspace, and has kernel im S_A; it need not be orthogonal. If N=ker(d0*Pi0 d0), every d0 psi for psi in N lies in im S0. Hence K_A and the forcing d0*Pi_A r annihilate N as weak functionals, even though K_A need not kill N in its input. Restrict its input to H1 intersect N-perpendicular.

The weak form differs from the coercive K0 form on this complement by at most C(||a||infinity+||F_A−F0||infinity)||phi||H1||psi||H1. This suggests a uniform invertible map to the annihilator of N for small values, without assuming a trivial stabilizer and without controlling derivatives of the coefficients in the weak estimate.

E79 will check that precise perturbation and define phi=K_A^−1 d0*Pi_A r, u=C_A^−1 S0*(r−d_A phi). Then r−d_A phi−S_Au should lie in X. Determine the exact resulting projection and its kernel. In particular, do not identify its kernel with all orbit directions: the chosen parameter space excludes N, and at A away from the reference those previously stabilizing parameters can produce nonzero directions. The correct closed complement is the image of the restricted parameters if the calculation closes.

For smooth A and r, derive regularity using coefficient-dependent elliptic estimates, separating these high-order constants from the value-only H1/L2 bound. A finite nonlinear construction would still have to propagate A,F along an orbit and control the resulting transport equation and coordinate derivatives. This decision does not supply that existence or the initial-slice hypothesis of E66. It tests a more adapted linear inverse as the next concrete dependency.
