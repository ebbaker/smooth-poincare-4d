# B07 — Test the missing scalar pinching principle

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort preserved; actual settings unavailable. Broad continuation is active. This is a conceptual B decision, followed by fixed Sol 6.2/ultra execution.

E05 gives decay conditional on pointwise pinching throughout an interval. E02C already excludes the naive least-eigenvalue minimum argument. Before proposing a bootstrap that silently assumes preservation, test the equally natural scalar |Q−I| maximum argument. Choose a near-perfect anisotropic diagonal Q and a trace-free Hessian direction H whose pairing with q is negative, but whose pairing with L_Q q is positive. The freely scalable cubic connection jets in E02C give a finite actual-connection test. This is a test of a local pointwise maximum-principle inference; it will not by itself settle global preservation on a closed manifold.

Freeze Q=diag(1+epsilon,1,1−epsilon), q=Q−I, H=diag(1,−2,1)−q/2, 0<epsilon≤1/8. Then <q,H>=−epsilon², whereas <q,L_Q H>=4epsilon²+(8/3)epsilon⁴. Check these expressions and realize the prescribed Hessian shift. A sufficiently large shift should make p a strict spatial local maximum of |q|² while its derivative under the actual initial flow vector field is positive, despite arbitrarily small nonzero defect. Finite rational sample epsilon=1/16 and the symbolic interval suffice.

Acceptance requires the full local connection, the quotient calculation, lower-order baselines, and the precise scope of failure. If accepted, the next analytic route must use neighborhood/integrated estimates or a different adapted invariant, with their hypotheses exposed; it must not claim that conditional energy decay supplies scalar preservation.

Inputs: assessed E02 and E05; exact versions are in the E08 request.
