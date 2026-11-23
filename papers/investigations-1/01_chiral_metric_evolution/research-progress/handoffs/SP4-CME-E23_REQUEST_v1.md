# SP4-CME-E23 request v1 — Fixed flat semilinear endpoint closure

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized configured gpt-6.2-sol / ultra; actual lead settings unavailable. Read root instructions and B19. No shared files or chat capture. Return at this finite packet boundary. Cite primary sources at every imported analytic theorem, with exact hypotheses; derive identities directly where feasible. If an indispensable estimate cannot be verified, return that precise conditional limitation instead of asserting it.

Own notes/23_SEMILINEAR_LORENTZ_MODEL_20261122.md and research-progress/handoffs/SP4-CME-E23_RETURN_v1.md only.

On R4 let U have values in R20 and U_t=4Delta U−12KU+B(U,nabla U)+C(U,U,U), K>=0, where B and C are fixed bounded multilinear maps into R20, no second derivatives and no varying coefficients. Given smooth compact initial U0 small in L^{4,1}, prove or refute a global mild solution by contraction in X with norm sup_t||U(t)||4,1 + integral||nabla U(t)||infinity dt + (integral||U(t)||infinity^2 dt)^1/2. Same Lorentz norm as E21. Constants may depend on B,C, dimension, not K.

Use E21, Lorentz heat contraction (prove from rearrangements or an inspected primary theorem) and Minkowski for time translation to derive the forced Duhamel estimates from L1_t L4,1_x. Check product bounds ||B(U,nabla U)||4,1 <=c||U||4,1||nabla U||infinity and cubic analogous; prove difference estimates, smallness radius, completeness/gradient interpretation, initial trace and uniqueness within the small X ball. It is acceptable to state a mild solution only, without claiming additional smooth regularity unless justified. The full Gaussian convolution estimates extend from smooth data by approximation; justify this carefully. Show how N small controls the same temporal integral as E14 within this model.

Finite scope: this exact class of semilinear models. Explain explicitly why variable-principal terms (L_Q−4I)Delta T, moving metric and evolving connection of Fine's flow remain outside it. Do not replace them by B,C or hide them in an unproved forcing bound. If this X space fails, exhibit the precise failing estimate and stop; alternative spaces are B work for the lead.

## Frozen inputs

- `brainstorm/notes/B19_ENDPOINT_TRANSFER_DECISION_20261122.md` SHA-256 `da9868f2aeb22096f941beeb0ca44e351730d6fd4714e0b6c11884b38862af67`
- `notes/21_LORENTZ_HEAT_BENCHMARK_20261122.md` SHA-256 `c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2`
