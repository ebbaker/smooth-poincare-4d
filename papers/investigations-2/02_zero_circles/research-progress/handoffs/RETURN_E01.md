# ZERO-E01 · Return to the lead

27 November 2026 UTC. For Edward B. Baker III with OpenAI Codex assistance.
The [frozen R1](REQUEST_E01_E03_20261127.md) records a
`gpt-6.2-sol`/ultra dispatch. Actual model and effort were unavailable to
this helper. Baseline `6a422ce`, investigation overview and `check_06` parts
(b) and (d), SHA-256 prefix `50523f0bf3006aed`.

**Working project theorem.** For a smooth compactly supported Riemannian
graph with \(\|\mu\|_\infty<1\), the closed Euclidean symbol determines
\(T\) from the equality of the normal contractions of the two chiral
parts. It gives a unique \(L^2\) correction to each constant leading
self-dual form, with a smooth result and \(O(r^{-4})\) decay of that
correction. See the [derivation](../../notes/E01_FLAT.md).

**Exact finite check.** A tensor-grid interpolation test with integer
arithmetic verified the polynomial identities for contraction, closedness,
orthogonality, determinant, parity and reflection of the symbol actually
used in the solver. [Exact check](../../numerics/e01_symbol_check.py)

**Sampled validation passed.** On \(|x|\le2\), all three unit-leading
forms for \(\varepsilon\in\{0,-0.5,0.5\}\) met the \(0.08\) maximum component
target in both raw-graph sweeps. The worst sampled error was \(0.07218\).
At fixed half-width \(L=5\), errors for \(n=17,25,33\) were
\((0.06633,0.02763,0.02239)\) at \(-0.5\) and
\((0.06849,0.02925,0.02217)\) at \(+0.5\). The round errors were exactly
zero. The initial \(n=9,L=5\) mesh was underresolved and missed the target
for both nonzero values. Fixed-spacing box refinement gave additional
improvement. At the same box and resolution the tested taper increased
error against the original exact forms. [Code](../../numerics/e01_calibration.py) ·
[Full numerical record](../../numerics/e01_results.txt)

**Endpoint and normalization.** The original calibration's \(r^{-2}\) tail
makes the direct forcing and correction non-square-integrable, with
logarithmic divergence of the squared norms. An explicit closed tail
subtraction yields an \(L^2\) continuum equation for the remainder. The
reported comparisons instead use periodic samples of the original graph
or its stated taper. Changing the torus zero mode from zero to identity
had only a roundoff effect on this symmetric calibration. A constant
graph test exercised a nonzero mean and verified the different periodic
mean conventions.

**Use by ZERO-E02.** [Solver](../../numerics/e01_fourier.py) accepts
real graph samples of shape \((n,n,n,n,3,3)\) on its centered cubic grid,
with minus rows and plus columns in Cartesian orthonormal chiral bases.
The default solves for the identity leading triple on a torus and
returns both chiral blocks. The calibrated numerical error and observed
orders apply to the grids and radial comparison above. Estimating error
for other graphs and between grid samples requires additional analysis.
