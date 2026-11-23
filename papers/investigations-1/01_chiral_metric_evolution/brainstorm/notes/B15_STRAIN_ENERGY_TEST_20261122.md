# B15 — Test a conditional energy estimate for the actual strain

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model/effort preserved; actual metadata unavailable. Conceptual decision under the broad run.

E15 gives a self-adjoint strain diffusion coefficient and identifies Ricci, rather than full Riemann curvature, in the first commutator. Test its L² energy directly. First verify the round zeroth-order operator −36K Id+8 ad(F_ca) on T*⊗Sym²_0: the expected eigenvalues are −52K and −12K (multiplicities 12 and 8), but the signs must be checked using the actual eta convention. Then use smooth coefficient bounds in |q|≤1/8, the exact E15 remainder and E09 Ricci comparison to isolate deviations from that round operator of the form C(K|q||T|+|T||∇T|+|T|³).

The fixed test is the existence of universal epsilon0>0 and C<infinity such that on a smooth closed interval with |q|≤epsilon0,
(d/dt)∫|T|²dV≤−∫|∇T|²dV−K∫|T|²dV+C∫|T|⁴dV.
The changing inverse metric in |T|² must be included through E14; dV itself is fixed. An explicit numerical C is unnecessary if a precise compact smooth coefficient argument supplies finite universal constants and a legitimate epsilon0. This is still an interval-pinching hypothesis, not its preservation.

As a conditional corollary only, a uniform scalar Sobolev inequality ||u||4²≤C_S(∫|du|²+K∫u²) and sufficiently small ||T||4² throughout the same interval would absorb the quartic term and give L² strain decay. Neither that Sobolev hypothesis nor the critical-norm persistence is automatic. The E12 examples remain compatible because they concern sup distortion on single slices. Freeze two disjoint E16 packets for the finite round algebra and the nonlinear energy bookkeeping; root retains all interpretation and integration.
