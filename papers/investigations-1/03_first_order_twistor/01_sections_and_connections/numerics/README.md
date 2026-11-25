# Computations

Established 24 November 2026 for Edward B. Baker III with OpenAI Codex
assistance; actual model/effort unavailable. No numerical campaign or code
execution is activated by setup. Future authorized work needs a fixed
question, parameters, finite limits and evidence standard in the
[plan](../research-plan/PLAN.md). Keep scripts and small execution records
here; record inputs, environment, hashes and limitations. Apply root
[LARGE_FILES.md](../../../../../LARGE_FILES.md) for larger outputs.

## E59–E61 · identities for the annular estimates, the linear model and the conservation law — 24 November 2026

Added for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured. Packets [SP4-FOT-SEC-E60](../research-progress/handoffs/SP4-FOT-SEC-E60_REQUEST_v1.md) and [SP4-FOT-SEC-E61](../research-progress/handoffs/SP4-FOT-SEC-E61_REQUEST_v1.md); notes [E59](../notes/SEC_E59_20261124.md), [E60](../notes/SEC_E60_20261124.md), [E61](../notes/SEC_E61_20261124.md).

Question: whether the formulas, constants and identities that the three notes prove by hand agree with direct evaluation. Nothing here tests an inequality beyond single instances. Limits: IEEE double precision and exact rational arithmetic (Python `fractions`), NumPy only; truncated Taylor expansions of degree at most five in four variables; quadrature on the unit three-sphere with at most \(12\times12\times24\) nodes for the flux and \(18\times18\times36\) for the constants; homogeneity \(\mu\in\{-2,\dots,2\}\), polynomial degree at most four and at most two powers of the logarithm in the mode table. Acceptance: exact zero for the rational identities; agreement to \(10^{-12}\) for pointwise identities evaluated without difference quotients; geometric decrease of the quadrature residual with the order of the rule. Observed: 37 assertions passed; pointwise identities to \(7\times10^{-15}\); the first variation to between \(2\times10^{-12}\) and \(5\times10^{-10}\), limited by its sixth-order difference quotient; flux residuals between \(6\times10^{-16}\) and \(2\times10^{-7}\) at the highest order.

| File | Role |
| --- | --- |
| [sec_jets.py](sec_jets.py) | Truncated Taylor arithmetic in four variables and tensor calculus on it: Christoffel symbols, curvature, Weyl and Bach tensors at a point from the jet of the metric, with the conventions of the manuscript. No difference quotients. |
| [sec_noether_lib.py](sec_noether_lib.py) | The Weyl density, the boundary form \(\mathfrak b(W;h)\) of the first variation, Lie derivatives of the metric and the vector field \(P_X\) of E61, on jets. |
| [e61_identity_checks.py](e61_identity_checks.py) | Conventions on the round \(S^4\), \(S^2\times S^2\), \(\mathbb R^2\times S^2\) and a product of unequal spheres; the four-dimensional contraction identity and conformal invariance of \(\lvert W\rvert^2dV\); the pointwise first variation with its divergence term at four random metrics and three step sizes; \(\operatorname{div}(\sqrt g\,P_X)=0\) at four random metrics and vector fields; \(\mathfrak b(W;fg)=0\). Output [E61_IDENTITY_CHECKS.txt](E61_IDENTITY_CHECKS.txt). |
| [e61_flux_checks.py](e61_flux_checks.py) | Flux of \(P_X\) through the unit three-sphere for three exact cones with the dilation field and for a metric that is not a cone with the dilation field and with a generic quadratic field, at quadrature orders 6, 8, 10, 12. Output [E61_FLUX_CHECKS.txt](E61_FLUX_CHECKS.txt). |
| [e59_cone_identity_check.py](e59_cone_identity_check.py) | Added at assessment. The energy identity of the proof of Theorem 1 of E59 on the exact cones \(\delta+c\,s_H\), \(c=0.05\) and \(0.30\), per unit of \(\log\lvert x\rvert\): \(2e=T_B+T_N+T_R\) with \(T_B=-4\oint\langle B,v\rangle\), the variation of the norm and volume \(T_N\) and the remainder \(T_R=-2\oint\langle W,W'_g[v]-W\rangle\). The residual decreases to \(10^{-16}\) and \(4\times10^{-7}\) at order 12; \(T_B/(2e)\) is \(1.0007\) and \(1.053\); \(e/(\sup\lvert v\rvert\,b)\) is \(0.71\) and \(0.73\); \(e\) agrees with the flux record to ten digits. Output [E59_CONE_IDENTITY_CHECK.txt](E59_CONE_IDENTITY_CHECK.txt). |
| [sec_linmodel.py](sec_linmodel.py) | Exact rational algebra for functions \(\sum c\,x^\alpha\rho^s(\log\rho)^e\) with an optional Gaussian factor, the linearized curvature operators at the flat metric, exact Gaussian and spherical moments, a quadrature rule on \(S^3\), and closed forms for the field \(H\log\rho\). |
| [e60_linear_model_checks.py](e60_linear_model_checks.py) | The closed formula for \(B'(H\log\rho)\); the three representatives of its class, including the divergence-free trace-free one with coefficient \(\tfrac59\); the densities and the constants \(\kappa_1=\tfrac{20\pi^2}9\lvert H\rvert^2\) and \(\kappa_2\); the operator identities F1, F3, F4 of the note; the modes of homogeneity \(\pm2\) with the constant \(\pi^{-2}\); the integral identity of Theorem 5 at one point; the derivative of the nonlinear Bach tensor at the flat metric. Output [E60_LINEAR_MODEL_CHECKS.txt](E60_LINEAR_MODEL_CHECKS.txt). |
| [e60_mode_count.py](e60_mode_count.py) | Dimensions of the kernels of \(B'\) and \(W'\) on spaces of homogeneous fields, by evaluation of the exact operators at random points and singular values. Output [E60_MODE_COUNT.txt](E60_MODE_COUNT.txt). |

Run from this folder: `python3 e61_identity_checks.py > E61_IDENTITY_CHECKS.txt`, `python3 e60_linear_model_checks.py > E60_LINEAR_MODEL_CHECKS.txt`, `python3 e60_mode_count.py full > E60_MODE_COUNT.txt`, and, for each of the five cases `c1a c1b c2 d1 d2`, `OMP_NUM_THREADS=1 python3 e61_flux_checks.py 6,8,10,12 CASE 4`; the flux record is the five outputs in that order after one header line. The cone identity: `OMP_NUM_THREADS=1 python3 e59_cone_identity_check.py 6,8,10,12 4 > E59_CONE_IDENTITY_CHECK.txt`, about three minutes. The retained outputs were produced on the author's computer with Python 3.10.12 and NumPy 2.2.6, in about two seconds, four seconds, one minute and five times two minutes. In the session's cloud workspace, with Python 3.13.18 and NumPy 2.5.3, the identity and linear-model scripts passed the same assertions and the mode script gave the same dimensions. The flux values were first computed there at orders 8, 10 and 12 with a working copy of the flux script that differs from the retained one only in its header and module names; \(e\), \(8b\) and \(k\) agree with the retained record to the printed digits. Timing lines, singular-value gaps and rounding-level residuals differ between runs.

SHA-256 at the time of the run:

```
cff0c73a9da762d6e2755b88587ba312b4e99e70da03f7df37ec33b4d6307ed6  sec_jets.py
d58254e98f657f20f984118d14ba43cb292caa48bb7fcb2506890670b81d2cb5  sec_noether_lib.py
ec951c36301bf354be5274517bb9228f00d30609e29d069ef23a8d263afdf1a7  sec_linmodel.py
f3366342f8d3d8c2ef002a530c176b7f15bb4edf32f4877e645450088503605d  e61_identity_checks.py
55bebe107f1aab526b752724b709830f32bfa1e57929ea3201d4ccd8ed732323  e61_flux_checks.py
2ccfab56e373bbf021101beb7fddf0b59109ebd1960a11ceda66584bc747005f  e60_linear_model_checks.py
318cba046777fc082d2bb3ea4a55d2de32f0c7d113796176110adeb175f52073  e60_mode_count.py
c4e9529c65ff74b43baea61541e791c85df11bb3482c69d320226392088ec063  E61_IDENTITY_CHECKS.txt
5987c73a01a6fd69745d14e461569053fce6676d7bea45a254568a5da848f466  E61_FLUX_CHECKS.txt
891c91ca95f46d8cfd89fe8f65d6f83c866de1b2eedc15895731e7fbc9dacd0f  E60_LINEAR_MODEL_CHECKS.txt
51ff9670dc9bc5a3b76b27aff95312236d5ebe6da4649ece51b4fbaba7e7c95d  E60_MODE_COUNT.txt
72ccfc3086207ea3932bafc4e6b7c3563762581e9fd2dbf4dffef494f8a4344b  e59_cone_identity_check.py
1d691e5e67c184819b73d9cf917edbcac4f55a94c1d2b381de6bcaaa5cced6d7  E59_CONE_IDENTITY_CHECK.txt
```

These are checks of algebra and of quadrature. They prove nothing by themselves. The mode table uses random evaluation points and a rank threshold of \(10^{-9}\); its singular-value gaps exceed \(10^{12}\). The values of \(\kappa_2\) are quadratures of a function that is not smooth where it vanishes and are reliable to about three digits. No interval arithmetic was used.
