# Route 02 · From strip estimates to the limiting energy identity

25 November 2026 (America/New_York). For Edward B. Baker III with OpenAI Codex. The launch specified GPT-6.2 Astra/ultra. The exact lead serving configuration is unavailable. The bounded helper calls selected GPT-6.2 Sol/ultra. The lead froze the encodings, wrote the accounting compositions and performed the public-package checks. [Issued packets](LAUNCH_REQUESTS_20261125.md) · [Live register](../REGISTER.md) · [Independent proof audit](../../reviews/ACCOUNTING_PREMISE_CHECK_20261125.md)

## What the checked theorem says

Write $\mu_i=|W^+_{g_i}|_{\rm HS}^2\,dV_i$ for the intended physical energy and $e=\lim_i\mu_i(M)$. Let $\nu_j$ be the finite comparison measures, including the base. Fix increasing comparison truncations $K_L^j$ exhausting each model up to a null set, and let $R_{Li}$ be the complement of all the source images. The finite family uses one common source sequence. At fixed $L$ the measurable source images may share null faces. The theorem gives

$$
\sum_j\nu_j(X_j)\le e,\qquad
\lim_{L\to\infty}\limsup_{i\to\infty}\mu_i(R_{Li})
=e-\sum_j\nu_j(X_j).
$$

For finite collections of strips $S_{Lik}$ with bounds $d_{Lik}$, the proof bounds $\mu_i(R_{Li})$ by $\sum_k d_{Lik}$ plus $\mu_i(R_{Li}\setminus\bigcup_k S_{Lik})$. If both vanish in that order of limits, global equality follows. With varying cardinality a bound on the sum of errors is required. With a fixed finite index family, individual smallness suffices. The threshold in $i$ may depend on $L$. The one-sided inequality needs no remainder estimate. [Accounting](../../../../FirstOrderTwistor/Accounting.lean) · [Measure split](E17A_RETURN.md) · [Limits](E17B_RETURN.md)

In the framed version, each cost bounds an integral of the four-index tensor square. The positive energy on the strip is at most one quarter of it. The coefficient fields can be supplied separately on the measured regions. Equal integrated chiral energies on a closed homotopy sphere follow from the signature theorem. An individual strip uses the quarter bound. [Regional theorem](../../../../FirstOrderTwistor/WeylAccounting.lean) · [Normalization and sharpness](E02A_RETURN.md)

## Where the geometry enters

| Inputs | Verified consequence | Principal evidence |
| --- | --- | --- |
| Source and model embeddings on a common fixed domain, volume Jacobians and uniform convergence of their weighted densities | Real masses of the embedded images converge. Increasing model ranges and eventually disjoint physical ranges construct the comparison family. | [Transport](E17D_RETURN.md) · [Comparison constructor](E17G_RETURN.md) |
| A compact truncation in an open metric comparison by a smooth partial diffeomorphism, with a fixed smooth reference metric | The restriction is a measurable embedding. The reference volume is finite and its actual Riemannian density ratio gives the volume Jacobian. | [Partial diffeomorphism](E17H_RETURN.md) · [Reference metric](E17J_RETURN.md) |
| Actual Levi–Civita curvature coefficients in oriented orthonormal tangent frames at the comparison points | Compression and subtraction of one third of the trace give convergence of the geometric self-dual blocks. With the volume Jacobians and a common integrable bound, the chiral integrals converge. Compressing the reconstructed Weyl tensor gives the original positive block with the same row and column signs. | [Curvature limit](E17L_RETURN.md) · [Sign and compression checks](E02B_RETURN.md) |
| Entrywise convergence of the metric Gram matrices in a limiting oriented frame | Gram–Schmidt gives actual orthonormal frames for the varying metrics converging to the prescribed positive frame. This is a pointwise construction on the actual tangent spaces. | [Frame construction](E17O_RETURN.md) · [Proof review](../../reviews/CONVERGING_FRAMES_20261125.md) |
| Full four-slot curvature in such a frame | The squared Hilbert–Schmidt norm of the trace-free compression is bounded above by the full squared array norm. The coefficient 1 is sharp for arbitrary arrays. This turns a full-curvature majorant into a chiral one. | [Norm estimate](E02C_RETURN.md) |
| Compact metric convergence with a fixed reference metric | The Riemannian Jacobian converges pointwise at any order of metric convergence. The proof takes the determinant of the metric Gram matrix in a single coordinate chart. | [Jacobian theorem](E17P_RETURN.md) |
| Intrinsic metric two-jet convergence on a fixed compact set, measurable weighted chiral densities, and an integrable majorant for the Jacobian times the full curvature square | In positive frames constructed by Gram–Schmidt, the chiral energy integrals converge in the respective actual Riemannian volumes. Both four-slot and Jacobian convergence are derived. | [Physical compact-domain theorem](E17Q_RETURN.md) · [Metric jets](../../reviews/METRIC_JET_INPUT_20261125.md) |
| Four-dimensional conformal change and the supplied operator transformation in matched oriented frames | The actual Riemannian volume weight cancels the squared block weight. Equality holds for the chiral energy measures restricted to a measured region, and globally under a global comparison. | [Conformal change](E17K_RETURN.md) |
| Oriented chiral matrix fields, convergence of the nine entries and Jacobian, and an integrable majorant | The corresponding chiral integrals converge on the fixed truncation. This gives a dominated alternative to the uniform density argument. | [Chiral density](E17E_RETURN.md) |
| A compactly supported nonnegative $C^1$ cutoff on Euclidean four-space, $C^2$ coordinate components on its support and a supremum bound | Both inequalities of SEC `msneck:interpolation` with $c=\|D\eta\|_4$. Integration by parts, the dimension-four trace estimate and Hölder are proved, including integrability. | [Joined analytic proof](E14D_RETURN.md) · [Flux](E14B_RETURN.md) · [Hölder](E14C_RETURN.md) |
| Numerical bounds from SEC `msneck:annulus` or `msneck:neck`, uniform coefficients and iterated smallness of the appropriate defects | The annular energy vanishes in the iterated limit. The intrinsic integral bound is derived from the signed flux identity and pointwise contraction estimates. | [Annular limits](E16A_RETURN.md) · [Intrinsic integral](E15A_RETURN.md) |
| Fixed smooth-end comparisons, inner tail tending to zero and a vanishing outer comparison error | A slowly diverging outer truncation has vanishing energy on the covered annuli. A separate bound is required to reach a prescribed neighboring scale. | [Diagonal endpoint](E29A_RETURN.md) |
| Normalized source Euler and curvature formulas, the sharp round Yamabe bound, and numerical end data | Yamabe, Ricci and total curvature budgets. The end budget forces one end and the quaternionic signature defect contradicts the band. | [Source and component budgets](COMPONENT_RETURN.md) · [End count](E11A_RETURN.md) |
| Zero-or-gap alternatives, band, ALE Ricci budget and subround compactification Yamabe comparisons | Zero energy for every bubble and all limiting energy on the base. The composition derives both the strict residual and the global equality. A uniform quantitative residual additionally uses a uniform deficit for the exact critical classes. | [Finite exclusion](E01_RETURN.md) · [Composition](../../../../FirstOrderTwistor/Accounting.lean) |

The measure theorem specializes to a Riemannian four-manifold once the data have their stated meanings. Converting zero chiral bubble energy into geometric flatness uses the scalar-flat AE curvature identities. Geometry still has to realize compatible smooth comparisons on fixed sets, the chart or field estimates or Route 04 differentiated defects, the smooth component gap and removal theorems, and control over the full physical remainder. The newer closed-/Green-base alternatives and curvature atoms do not supply general coverage. Chang–Qing–Yang Theorem 3.1 assumes exact Bach-flatness and annular hypotheses. A positive closed critical value and the general existence of a suitable source sequence remain open. [Source audit](../../reviews/GEOMETRIC_PREMISES_20261125.md) · [SEC §15](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L6507)

## Input revisions

Intake HEAD was `cf03e8f09359`. The checkout advanced through `ad23403e9be5`, `7db310a2a921` and `0c3399d831d7` during the session. FOT, SEC, DIR, the neck-accounting note and EXTRACT-E04 retained their hashes from the [program baseline](../../../research-progress/01_BASELINE.md). SEC remained `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Later companion assessments were reviewed separately. The initial blueprint content hash was `e97c1131cf0bfdbd62a10adff7e517eacbb7cc8ebee80cead6a571398aa6a278`.

Lean is `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, Lake `5.0.0-src+470d5ce`. All ten installed package HEADs matched the manifest and had clean tracked trees at intake. Mathlib is `c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`, and the unchanged manifest SHA-256 is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

## Acceptance in the public package

The public audit checked 115 named declarations across 28 Route 02 and shared-prerequisite modules, including 85 theorems. Each axiom report was empty or a subset of `propext`, `Classical.choice` and `Quot.sound`. The final default build passed with both public libraries and the simultaneous Route 03 integration (4,331 jobs reported). All 46 distinct Lean links in the Route 02 blueprint section and 32 in the Route 03 section resolve to the generated declaration source and exact line. The checks use the actual Riemannian volume and conformal-measure imports from the pinned DifferentialGeometry package. The PDF and web blueprint were rebuilt with separate checked-statement and checked-proof marks. The global physical no-neck problem retains its open status. [Public type and axiom list](PUBLIC_CHECKS.lean) · [Blueprint source](../../../../blueprint/src/neck_accounting.tex)

The exact E01 type, the empty family and extra zero components were checked. A positive singleton carrying the entire mass violates its conclusion when strictness is dropped. Omitting uncovered mass also gives a checked one-point counterexample. The independent two-point example exercises the complete measured theorem, with positive strip mass $1/(i+1)$ at every finite index and full tensor cost $4/(i+1)$. [E01 edge cases](E01_RETURN.md) · [Uncovered mass](../../reviews/ACCOUNTING_PREMISE_CHECK_20261125.md) · [Two-point example](E17_MEASURE_EXAMPLE.lean) · [Example return](E17_EXAMPLE_RETURN.md)

Reproduce the build and checks from `formalization/`.

~~~sh
lake build
lake env lean investigations/02_neck_energy_accounting/research-progress/handoffs/PUBLIC_CHECKS.lean
lake env lean investigations/02_neck_energy_accounting/research-progress/handoffs/E17_MEASURE_EXAMPLE.lean
make -C blueprint
~~~

Repository-wide relative-link validation passed after the simultaneous edits.

The authentic conversation could not be archived. Exact-thread diagnostics found no registered local metadata or source, and the native app reader returned a request error. No synthetic transcript was registered.
