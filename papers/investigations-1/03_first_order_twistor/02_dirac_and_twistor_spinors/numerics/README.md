# Computations

Established 24 November 2026 for Edward B. Baker III with OpenAI Codex
assistance; actual model/effort unavailable. No numerical campaign or code
execution is activated by setup. Future authorized work needs a fixed
question, parameters, finite limits and evidence standard in the
[plan](../research-plan/PLAN.md). Keep scripts and small execution records
here; record inputs, environment, hashes and limitations. Apply root
[LARGE_FILES.md](../../../../../LARGE_FILES.md) for larger outputs.

## E49 · Yamabe necklace on $S^1(L)\times S^3$ — 24 November 2026

Added for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured. Packet [SP4-FOT-DIR-E49](../research-progress/handoffs/SP4-FOT-DIR-E49_REQUEST_v1.md), note [DIR_E49](../notes/DIR_E49_20261124.md).

Question: for the one-period Delaunay metrics $\operatorname{dn}^2(t/\sqrt{2-m}\,|\,m)(dt^2+g_{S^3})$, the Yamabe energy, the low Laplace spectrum in units $\nu=3\lambda/s$, the relative pinching $\epsilon=3\lambda_5/s-1$, the joint-law quantities of the manuscript's near-equality theorem, and two curvature identities. Limits: IEEE double precision, NumPy and mpmath only, $1-m$ between $0.999$ and $10^{-8}$, at most 1,200 Fourier modes, one thirty-digit evaluation at $1-m=10^{-6}$ and $10^{-10}$. Acceptance: agreement to $10^{-7}$ with a second method; observed agreement $2\times10^{-9}$ or better.

| File | Role |
| --- | --- |
| [e49_necklace_lib.py](e49_necklace_lib.py) | Elliptic integrals, period, closed-form energy, $\operatorname{dn}$ from its Fourier series, Galerkin solver for $-h''+(2-m)(k+1)^2h=(4\nu+2)\operatorname{dn}^2h$, closed-form trial bound. |
| [e49_necklace_spectrum.py](e49_necklace_spectrum.py) | Spectrum by sector, five lowest eigenvalues, $\epsilon$, $A/s$, competing constant scalar curvature metrics, monotonicity of period and energy. Output [E49_NECKLACE_SPECTRUM.txt](E49_NECKLACE_SPECTRUM.txt) and [E49_NECKLACE_SPECTRUM.json](E49_NECKLACE_SPECTRUM.json). |
| [e49_necklace_law.py](e49_necklace_law.py) | Fourth moments, radial error, extreme values of $\lvert X\rvert$, Gram quantities, law of the axial coordinate, Gauss–Bonnet and Bochner identities. Output [E49_NECKLACE_LAW.txt](E49_NECKLACE_LAW.txt). |
| [e49_necklace_check.py](e49_necklace_check.py) | Second method: finite differences in the variable $f$ on the half period with $\operatorname{dn}$ from `mpmath.ellipfun`; residuals of the exact Lamé solutions at thirty digits; energy by quadrature; thirty-digit Galerkin value; ordering of the low spectrum on 93 values of $m$. Output [E49_NECKLACE_CHECK.txt](E49_NECKLACE_CHECK.txt). |
| [e50_identity_checks.py](e50_identity_checks.py) | Symbolic and exact checks of formulas in E48–E50 and in the assessment's reduced model, with sympy and mpmath: conformality of the gluing map, the scalar curvature formula, the integrals behind $15/16$, the expansions of $I_4$, $I_6$, the trial bound and the deficit at forty digits, the Ricci thresholds, and the conformal-factor expansions with the ratio $5/2$. Output [E50_IDENTITY_CHECKS.txt](E50_IDENTITY_CHECKS.txt). SHA-256 `d6bdafc50446340a5079696604fe359071eab9589203712a6570b95366c2c6e0`. |

Run each script from this folder with `python3 NAME.py`; the first also rewrites the JSON record. The retained outputs were produced on the author's computer with Python 3.10.12, NumPy 2.2.6 and mpmath 1.3.0, and match a run in the session's cloud workspace with Python 3.13.18, NumPy 2.5.3 and mpmath 1.3.0. Script hashes at the time of the run (SHA-256): lib `5c9669a181fa49113e052c86d9c5247451331b5168eb8a61d9c6646c455ac5d8`, spectrum `23cbfb6dfbf1b5d6304a3752eb4e1626a22154560bb5f539408513d295c52bd2`, law `83a815129037a921ce30fb663e4726aeb29541d3199b92a60db43442460deeb4`, check `7eaf0c2248f7286e65a905cb37d5e7738de538abdd2c6dddaa989407a33f7902`.

These are floating-point diagnostics. They support the closed forms and the asymptotic coefficients stated in the note and prove nothing by themselves. The Wasserstein distance printed by the law script stops near $8\times10^{-5}$ because of the grid. No interval arithmetic was used.

## E49 supplement · checks for the manuscript statements — 24 November 2026

Added for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured. Written when the E48–E50 results were put into the [manuscript](../manuscript/dirac_twistor_and_yamabe_rigidity.tex); the statements checked are in the [E49 supplement](../notes/DIR_E49_SUPPLEMENT_20261124.md).

Question: whether the formulas that the supplement proves by hand agree with direct evaluation. Limits: mpmath at thirty digits, sympy for four curvature identities, six values of $m$ between $0.05$ and $1-10^{-6}$ for the pointwise checks, grids of 409 and 207 values for the sign checks, and the double-precision Galerkin solver of the library at eight values of $m$. Acceptance: relative agreement $10^{-15}$ for the thirty-digit comparisons and exact zero for the symbolic ones; observed $10^{-28}$ or better and exact zero.

| File | Role |
| --- | --- |
| [e49_manuscript_checks.py](e49_manuscript_checks.py) | $T'(m)=F/(mm_1\sqrt{2-m})$ and $F'=\tfrac32(K-E)$ against numerical derivatives; the half-period inversion of $\operatorname{dn}$; the eigen-equation of $\sigma=u'/u$ and the Rayleigh quotient of one nodal arc; the closed form $R(m)$ against quadrature, $R(m)>1$, and $R(m)$ against the computed $\nu_1$ and fifth eigenvalue; the sectional curvatures, $\Delta\sigma=\tfrac s3\sigma$ and ${\rm Hess}_0\sigma=\sigma\,{\rm Ric}_0$ symbolically; $\int\lvert{\rm Ric}_0\rvert^2=s^2{\rm Vol}/12$ and $\int\sigma^2\lvert{\rm Ric}_0\rvert^2=\tfrac{s^2}{12}\int\sigma^2$ by quadrature; the constants $8\sqrt3\,\pi$, $1/(3\sqrt2)$ and the ratios $5/2$ and $2$. Output [E49_MANUSCRIPT_CHECKS.txt](E49_MANUSCRIPT_CHECKS.txt). |

Run with `python3 e49_manuscript_checks.py > E49_MANUSCRIPT_CHECKS.txt` from this folder. The retained output was produced on the author's computer with Python 3.10.12, NumPy 2.2.6, mpmath 1.3.0 and sympy 1.14.0; every check reports PASS. SHA-256 at the time of the run: script `477a48a26e8f42ac02db133cbc367a7919bc2f0e59ddd9e34e5336e41e9d6c08`, output `85846c8ef8a2557dfaa4c2f8304f06c0146fd4ae866fb1de1c7b1b8b7948d1a9`, library unchanged. These checks confirm algebra. They prove nothing by themselves, and the eigenvalue comparison is a double-precision diagnostic.
