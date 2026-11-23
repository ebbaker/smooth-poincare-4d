# B13 — Use relative curvature velocity to control metric and definiteness in time

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model/effort preserved; actual settings unavailable. Conceptual decision under broad continuation.

E09's cancellation suggests a more direct dynamical estimate. Instead of recovering path cost from scalar energy, bound the relative curvature velocity S⁻¹F_t in terms of the actual strain and its first spatial derivative. This may control both metric distortion and relative eigenvalue variation in time without an assumed eigenvalue floor or small initial energy.

Use P_c=S⁻¹∇_c^A S, C_c=∇_cQ−tr(Q∇_cQ)I/3 and N_c=S⁻¹C_cS. The E03 inverse gives the polynomial expression
N_c=2T_cQ−(2/3)h_c Q−(2/3)k_c I+(2/9)h_c tr(Q²)I,
h_c=tr(QT_c), k_c=tr(Q²T_c).
Thus N and ∇A N have uniform bounds in T and (∇A T,T²) over the trace-three cone. The exact F_t identity of E02, conjugated by S⁻¹, involves ∇N+[P,N] and N(P+ad b), with |P|≤2|T| and |b|≤2sqrt3|T|. No inverse eigenvalue need remain.

Freeze E14 to verify that normalized relative curvature velocity, metric logarithmic velocity and the time derivative of log D are bounded by a universal explicit constant times |∇A T|+|T|². Integrate those inequalities on a smooth definite interval with integrable sup norm of that quantity. This would be a conditional exclusion of finite-time metric anisotropy and loss of quantitative definiteness, not a full PDE continuation theorem: derivative regularity and parabolic gauge issues still need attention. It is directly dynamical and does not assume the desired eigenvalue floor.
