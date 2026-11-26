# Balanced marked exterior · Raw charge and required disk-side saving

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The author selected GPT-6.2 Sol/ultra for bounded proof work. Independent serving model and effort telemetry for this execution were unavailable.

The starting checkout was `4bec4df82e8b949935dd5a43f12f52cd3d018acb`. The two working manuscript sections had Git blob prefixes `fdef3970cbaf` and `24e23979aac0`. The `SignedCollarRepair` input had Git blob `1b12d8e9a3951a405871fcd06b2a651bc13b078c`. The manifest SHA-256 was `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. The package pins are Lean `4.35.0-rc3`, mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. [Master balanced disk section](../../../../../papers/master/manuscript/balanced_disk.tex) · [Companion balanced exterior section](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex)

`NestedBalancedDisks` supplies two actual smooth chart markings on one compact oriented source. The closed core disk $Q$ lies strictly inside the larger marked disk $B$. `interior_selectedChartDisk` identifies the image of the open unit ball with the actual interior. `signedCharge_fullMarkedExterior` proves the exact chiral splitting on $V=M\setminus\operatorname{int}B$ for either sign. The seam is the image of a Euclidean sphere under a smooth chart and has zero physical volume, hence zero physical chiral measure. The signed metrics use the actual Weyl blocks and physical volume. Equality of the total chiralities is the existing signature premise.

`eventually_balancedMarkedExterior_below_threshold` takes the supplied measured division for both chiralities and a fixed $k\ge1$. If $q=2^{-k}$ and its error is at most $\tau_i\to0$, then the raw charge in either sign is at most $q e_i+\tau_i\le e_i/2+\tau_i$. Thus both charges are strictly below $T=4\pi^2$ on the same complete exterior at every sufficiently large index whenever $e_i\to e_\infty<2T$.

`balancedMarkedDisk_saving_gt` is a finite-source implication. It assumes a joined endpoint $h$ with total chiral energy below $2T$, an actual positive capped metric on the same oriented $M$, and capped energy in either sign at most the joined exterior charge plus $\delta$. The exactly matched energy comparison takes $\delta=0$. Writing $I$ for the actual geometric positive-class infimum, the finite conclusion retains the protected core charge:

$$
E_s(g;B)-E_s(h;B)>(1-q)e(g)+qE_s(g;Q)+I-2T-\tau-\delta.
$$

`exists_dyadicDepth_for_recognitionGap` chooses $k\ge1$ from any $\varepsilon_*>0$ so that $q(T+\varepsilon_*)\le\varepsilon_*$. It depends only on the threshold and gap. `eventually_balancedMarkedDisk_saving_gt_gap` uses $I>T+\varepsilon_*$, $e_i\to I$ and $\tau_i+\delta_i\to0$ to obtain an actual saving strictly greater than $\varepsilon_*$ in both signs on every late source satisfying the supplied endpoint and cap tests. The limiting scalar lower bound is $(2-q)I-2T>\varepsilon_*$.

The geometric existence of the nested measured division, including the four-measure construction, remains upstream. The argument uses the two supplied chiral divisions. In a matched-cap application the stretched scalar tests and smooth same-type identification must furnish the actual positive cap and its energy comparison. The finite implication uses only the endpoint ceiling once these inputs are known.

The frozen [balanced exterior module](../../../../SmoothPoincare/Variational/BalancedMarkedExterior.lean) has SHA-256 `88ecd83e48994968f3b9fc7ad495c28714d70ee5b5726b842dff4f379b2558b4`. `lake build SmoothPoincare.Variational.BalancedMarkedExterior` passed. All seven public declarations report `propext`, `Classical.choice` and `Quot.sound` under `#print axioms` from the built module.
