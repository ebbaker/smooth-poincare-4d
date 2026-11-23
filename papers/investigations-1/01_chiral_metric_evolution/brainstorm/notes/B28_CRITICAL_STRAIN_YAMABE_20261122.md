# B28 — Test positivity of the Yamabe constant directly from critical strain

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model/effort preserved; actual settings unavailable. Conceptual B decision by lead; fixed E35 work delegated to configured Sol6.2/ultra.

E31 obtains positive Yamabe constant from the L2 norm of R_K, including a derivative of T. The scalar trace of the curvature comparison has additional structure: the derivative of b=A−Gamma+ is a divergence because the chiral frame Sigma is Gamma+-parallel. Integration against u² can transfer this derivative to u. E09 already supplies the eigenvalue-floor-free estimate |b|<=2 sqrt(3)|T|. Since tr sqrt(Q)>=sqrt(3) when tr Q=3, the scalar baseline stays positive even without near-perfect pinching. This suggests a critical L4 strain criterion for positive Yamabe constant under a supplied scalar Sobolev inequality.

Freeze E35 to verify the exact scalar/divergence identity and constants, rather than assuming a generic scalar estimate is sharp. Proposed identity is s=4K tr S+2 div V+< [b wedge b],Sigma>, V^a=sum_i Sigma_i^{ab}b_{ib}, using ordinary two-form norms and F_A=−KS Sigma. Proposed bounds |V|<=sqrt(3)|b| and |<[b wedge b],Sigma>|<=2 sqrt(3)|b|² give Y>=3/C_S−(48+24 sqrt(3))||T||4². All signs and factors must be checked; safe corrected constants are allowed.

This is a static conformal-positivity test only. Even if successful it supplies neither a Weyl L2 bound nor the CGY sphere theorem by itself, and does not construct initial data or close the flow. It may improve the separation of the Yamabe and Weyl hypotheses in the finite-time route.
