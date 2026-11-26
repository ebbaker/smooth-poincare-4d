# Finite measured selection of signed collar repairs

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 execution. The actual serving model and reasoning effort were unavailable. [Finite measured selection in the manuscript](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/collar_capacity.tex) · [Signed assembly and capped tests](ED03_SIGNED_COLLAR_REPAIR.md) · [Lean proof](../../../../SmoothPoincare/Variational/MeasuredCollarChoice.lean)

For every protected core in a finite family, let its nonempty finite candidate set have cardinality $N_j$. A candidate's measured score is $w_{j\ell}^2+\beta_{j\ell}^2$. In the manuscript $w^2=4(E_++E_-)$ on the same candidate annulus, and a local physical curvature ceiling can bound this measured quantity. The proof uses the bound $S\le w^2/4$ on each of its raw chiral charges. The coordinate inputs in the row budget are $L_j^2=\sum_\ell\tau_{j\ell}^2$, $P_j^2=\sum_\ell d_{j\ell}^2$, and the row smallness bound $a_j$. The norm of $DG$ and the norm of the chart deviation supply $\tau$ and $d$ in the comparison charts. With $W_j^2=\sum_\ell w_{j\ell}^2$, the Lean budget is the manuscript expression
$$
 \mathcal D_j=W_j^2+C\bigl[a_j^2(W_j^2+L_j^2)+P_j(W_j+L_j)+P_j^2\bigr].
$$
The statement consumes the measured inequality $\sum_\ell(w_{j\ell}^2+\beta_{j\ell}^2)\le\mathcal D_j$ for each supplied row. Availability of the candidates, the derivative and chart bounds, and their aggregate certification remain geometric inputs.

`exists_measuredCollarChoice` chooses a minimizer on each nonempty candidate row. The selected score times $N_j$ is at most the row sum, which gives the upper bound $\mathcal D_j/N_j$ on that score. The total of twice the chosen scores is at most $\Gamma=2\sum_j\mathcal D_j/N_j$. Only rows belonging to the outer finite family enter the argument.

For either region and either sign, the weighted square mass is at most the raw charge $S$, and the corresponding nonnegative error is at most $\beta$. The local lemmas use $2\sqrt S\,\beta\le S+\beta^2$ to bound the joined allowance and the signed exterior change above by $2(w^2+\beta^2)$. The exterior region is the supplied annulus minus the supplied whole disk. Its raw charge bound follows by inclusion in that same annulus. A signed exterior change can still be negative.

`excludesStrictRepair_of_measuredCollarChoice` takes a realization on each minimizing choice, with actual disk and annulus sets indexed by that choice. The same `SignedCollarAssembly` determines the joined path and capped output. `excludesStrictRepair_of_measuredSelectedDiskCollarChoice` makes the candidate sets explicit as `selectedChartDisk (F j k)` and `selectedDiskTrim (F j k) (width j k)`. The chart and width used by both repairs are those of the selected candidate. Its cap-test path gives positivity of that output when $e+\Gamma<2T$. Since each selected disk contains its corresponding protected core, monotonicity of both physical chiral measures gives the lower bound
$$
 G\ge\sum_j\max_\pm\lambda^\pm(C_j)-\Gamma
$$
on the signed gain. Thus $\sum_j\max_\pm\lambda^\pm(C_j)>\Gamma+(e-I)$ contradicts the fixed-type infimum. The finite derivative budget and core charge apply to the same choices. The candidate geometry, marked gluing, full-complement agreement, and cap test transplants are supplied by the realization. The route to obtaining those data is independent of the averaging proof.

## Input and verification receipt

Intake HEAD was `4bec4df82e8b949935dd5a43f12f52cd3d018acb`. The checked SHA-256 prefixes of the collar-capacity source and signed Lean inputs were `9b08ae7f6253`, `d8b63804f565` and `572b7dd9566a`. The pins remained Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.

`lake env lean SmoothPoincare/Variational/MeasuredCollarChoice.lean` and `lake build SmoothPoincare.Variational.MeasuredCollarChoice` passed without diagnostics. The targeted build completed in 9,799 Lake jobs. The checked source SHA-256 prefix is `414ebd4d4eaa`. A fresh import checked seven theorem types and axiom sets, including the exact selected-width corollary, and evaluated a two-row example with different candidate counts. All axiom reports contain only `propext`, `Classical.choice` and `Quot.sound`.
