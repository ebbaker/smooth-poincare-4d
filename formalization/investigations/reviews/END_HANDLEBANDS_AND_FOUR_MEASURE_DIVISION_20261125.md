# The selected end filtrations and simultaneous division by marked disks

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The author selected GPT-6.2 Astra/ultra as lead. The four bounded proof workers and two independent reviewers were dispatched as GPT-6.2 Sol/ultra. Independent lead serving telemetry was unavailable. [Frozen packets](../research-progress/handoffs/ED03_END_BANDS_PACKETS_20261125.md) · [Exact public replay](../research-progress/handoffs/ED03_END_BANDS_CHECKS.lean) · [Continuation](../continuation-notes/AFTER_END_HANDLEBANDS_AND_FOUR_MEASURE_DIVISION_20261125.md)

## Which proof steps changed

**At the selected height.** The inclusive induced-energy bound $E_+\le64\pi^2/9$ gives one direction, one ordered auxiliary Morse function on the immersion domain and two regular cuts. Starting with the empty sublevel, the construction lists all the relevant critical values in order, separates them by regular levels and supplies a native smooth local attachment at each stage. Do this on $h$ up to $a$ and on $-h$ up to $-b$. Together with the empty or singleton middle set, the two point lists partition the critical set of the original height. For a birth the empty attaching region gives the old sublevel plus a closed four-cell as a topological disjoint sum. For a one-handle the maps on the two entire three-dimensional feet are smooth and closed embeddings. The selected half-radius chart retains its original normal form and smooth radius to $2R$. Since $\varepsilon>0$, $2\varepsilon+8r^2 < 4(2\varepsilon+2r^2)\le4R^2$. The two radius-two foot graphs fit in that very chart, leaving the inverse graph charts and their orientation signs to construct. In each local trace the actual outgoing sublevel and deep-lower identification are explicit. [End construction](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_END_HANDLE_BANDS.md) · [Selected composition](../../SmoothPoincare/Heights/SelectedEndHandlePresentation.lean)

**Regular levels and one model tree edge.** Both intrinsic restrictions of a regular ambient diffeomorphism come from the same map. The sublevel and level inclusions commute forward and backward even after composition with a supplied boundary parametrization. In the model of two normalized product balls joined by a standard one-handle, the quotient maps explicitly onto the long cylinder. Its exposed frontier identifies with the boundary of one ball. All later attaching coordinates and the supplied outgoing boundary map transport through this homeomorphism. The change of linear model conjugates the very same ambient transport to the native Morse atlases. The levels $h=b$ and $-h=-b$ admit an unsigned smooth identification equal to the identity on ambient points in each direction. Their signed outward normal comparison remains separate. General smooth normalization of the actual feet, relative to other tubes and the signed collar germ, remains the obstruction to cancelling a tree and applying smooth recognition. The singleton case requires the actual relative framed diagram after such normalization. [Tree-edge quotient](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_MARKED_END_TREE.md) · [Native end markings](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_REGULAR_END_MARKINGS.md) · [Independent topology review](../09_morse_heights_and_handle_recognition/reviews/ED03_END_REDUCTIONS.md)

**Four measures on one physical source.** Let $U$ be any open subset of the compact Hausdorff smooth boundaryless four-manifold and let $\mu_1,\ldots,\mu_4$ be finite singleton-null Borel measures. For each $\varepsilon>0$ there is a finite disjoint family of smooth marked closed disks in $U$ whose union approximates $\mu_j(U)/2$ to within $\varepsilon$ simultaneously for all $j$. The construction also supplies the rejected disks and the estimate for the entire uncovered region. Pack the open remainder in a finite atlas for the sum measure using fine disjoint closed balls. Choose signs of their four mass vectors successively so that the sum of their squared norms controls the squared norm of the discrepancy. Small individual masses make this arbitrarily accurate. This argument works even if some measures vanish or coincide. A separate exact affine bisection in one smooth marked chart has the continuous odd four-dimensional antipodal-zero theorem as an explicit hypothesis. [Atlas packing](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_ATLAS_BALL_PACKING.md) · [Physical chart measures](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_CHART_MEASURE_TRANSPORT.md) · [Affine bisection](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_FOUR_MEASURE_BISECTION.md)

**One physical disk on a connected source.** Add the original closed core to the finite packing. A smooth ambient diffeomorphism moves their distinct centers into prescribed nonempty opens, by supported point motions in the complement of finitely many previously assigned points. Use the open interior and the open complement of a seed disk as the two targets. Before applying this map, contract each entire disk into the inverse image of its assigned open region. Every contraction fixes all the other original disks and sends its own disk into itself. The inverse image of the seed marking is therefore a single smooth outer disk enclosing the original core strictly and realizing the prescribed trace on every packed disk. The source metric and the supplied parametrization of the core remain those of the incoming problem. If the packing leaves mass $r$ and has discrepancy $d$ on its own union, the full exterior error is at most $d+r/2$. The core seam is volume-null. Iteration with one-step error $\tau$ gives $2^{-k}$ of each original full exterior mass with error at most $2\tau(1-2^{-k})$, hence any prescribed positive tolerance. The construction uses supported smooth maps and does not require an antipodal-zero premise. [Finite point routing](../../SmoothPoincare/Variational/FinitePointRouting.lean) · [Simultaneous contractions](../../SmoothPoincare/Variational/FiniteDiskContraction.lean) · [Single marked exterior](../../SmoothPoincare/Variational/MarkedDiskSeparation.lean) · [Error and iteration](../../SmoothPoincare/Variational/MarkedDivisionIteration.lean)

**Both physical signs below the recognition threshold.** On a connected fixed type, start from one supplied marked core $Q_i$ per physical source. The dyadic construction chooses an actual smooth outer disk $B_i$ with the same $Q_i$ and the four complete exterior estimates. Use the two physical chiral measures, the squared top spectral density and the full physical curvature measure. For the spectral interpretation, the supplied ordered lists are the eigenvalues of the two physical Weyl blocks. The raw division theorem also applies to arbitrary finite volume-absolutely-continuous measures in the last two positions. For each fixed $k>0$, if $e_i\to I<2T$ and the division tolerances tend to zero, both raw exterior charges on these actual $B_i$ eventually lie strictly below $T$. The cap and complete changed-region increments still enter the positive recognition and strict descent tests. [Physical specialization](../../SmoothPoincare/Variational/BalancedPhysicalDivision.lean)

**Widths and the cost of protecting the core.** On a nested pair, compactness places the whole closed core at inverse radial norm strictly below one. Every sufficiently thin outer width simultaneously protects it, realizes the full angular chart annulus and makes the sum of four raw incoming masses arbitrarily small. For the path test, local nonnegative two-jet allowances $\beta\le C_0(a b+\sqrt{db}+d)$, where $b=w+\tau+d$ and $a\le\min(A,1)$, imply the measured row budget with constant $12C_0^2$. With the candidate controls, path, cap costs, unchanged full complements and compatibility, the measured selector tests strict gain on precisely those candidate widths. Existence of an affordable physical path and cap on the selected source remains open. [Protected trims](../../SmoothPoincare/PhysicalScales/ProtectedMarkedTrims.lean) · [Cutoff and cost](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_MEASURED_COLLAR_BUDGET.md)

**A matched endpoint can require a large change inside the disk.** Write $q=2^{-k}$, $e=E_+(g)$ and $I=\inf\mathcal E_+(M)$. If the incoming balanced exterior bound has upper error $\tau$, the independently positive cap costs at most the endpoint exterior charge plus $\delta$, and the initial and endpoint charges agree on $B\setminus W$ in chirality $s$, then
\[
 E_+(h)\ge I+(1-q)e+q\lambda_g^s(Q)-\tau-\delta-\lambda_g^s(B\cap W).
\]
This applies separately to either sign with its full physical exterior. If $I>T+\varepsilon$, $q(T+\varepsilon)\le\varepsilon$, $e_i\to I$ and the three losses on an actual sequence of selected trims tend to zero, every such endpoint eventually exceeds $2T+\varepsilon$. If cap positivity itself requires a subwall path, the same statement excludes the conjunction of that path and the stated local agreement. An attained positive metric is used only for the lower bound by $I$. No attainment of $I$ is used. [Endpoint proof](../../SmoothPoincare/Variational/BalancedCollarWall.lean) · [Independent analysis review](../07_fixed_type_variational_descent/reviews/ED03_DIVISION_AND_BUDGET.md)

## Physical and modified alternatives

The concurrent [E69–E72 master assessment](../../../papers/master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md) supplies a buffered physical comparison under full sectional, integral and placement hypotheses. In the modified gauge it also develops a charged positive-time Ricci flow under its own upper volume-ratio and smoothing inputs. Its charged ball carries trace-free Ricci energy in that gauge. Neither calculation supplies the missing selected physical path, cap or smoothly normalized end marking here. The induced metric on the immersed route, the physical variational metrics, the modified probability and the positive-Ricci comparison spaces retain their respective roles. No additional smooth type is recognized in this milestone.

## Working generations and package pins

The working tree was based on `4bec4df82e8b949935dd5a43f12f52cd3d018acb` at intake. The checkout at closure was `5706ef811adc3691fd85e75507a0a399cb81d18d`. The three columns use the previous formal assessment, this dispatch and the final working files. Each digest hashes the sorted repository-relative path, tab, file SHA-256, and newline, for every file in the group. Scientific changes during execution kept their own manuscript evidence status.

| Source set | Previous | Intake | Close |
| --- | --- | --- | --- |
| Six manuscript directories | 36 · `22602e367376c5c392abc6a2` | 37 · `6d61527aafea79d42b99a3c6` | 42 · `80be9ab59f1ddbfc2c0c4647` |
| Scientific plans and registers | 18 · `917c4eaa45faa38fddddf592` | 18 · `1ff6659a7f77a7d1e67e26f1` | 18 · `187d405ee044f01a8b798bb8` |
| Lean topic sources | 86 · `918dc7ad968b8cf382cd8985` | 86 · `918dc7ad968b8cf382cd8985` | 104 · `627b24bb22fb1b50e21ff4cf` |
| Blueprint TeX sources | 11 · `22a1fe21763ef0e455df7531` | 11 · `22a1fe21763ef0e455df7531` | 12 · `07d41ee42b3c830701fa68cd` |
| Formalization plans and owning registers | 36 · `1b8daea76b737666b5e85740` | 36 · `1b8daea76b737666b5e85740` | 36 · `57394f13efce0a87ae7cdb91` |

For each scientific manuscript the E51 digest below includes the transitive TeX inputs. PDF digests hash the bytes of the corresponding reading copy. The frozen E63–E67 generations are cross-checked against the [scientific intake](../../../papers/master/reviews/E68_INTAKE_AND_PUBLIC_TYPES.md) and [owning crosswalk](../../../papers/master/research-progress/handoffs/E63_E67_BALANCED_DISKS_20261125.md).

| Manuscript | E63–E67 TeX / PDF | Closing TeX / PDF |
| --- | --- | --- |
| Master | `eaf123254a7eb391` / `59874923bf7155a7` | `5f12947240860902` / `383907ab614a5e74` |
| Fixed-type descent | `d9a6557377462fd3` / `d0b1452463e2857a` | `83078c791c7e3864` / `65e84af3b58c9214` |
| Physical neck | `1647ee5fdc777ee6` / `c4974953985016d4` | `0e1e29769f39a372` / `5c273dd27b0e779c` |
| Immersed construction | `1f537ec8142a495d` / `1439c8db0e035813` | `9f1bf9a87a1daafe` / `be162dcd5094fb92` |
| Immersion parent | `e5a72e29072c66e1` / `5b333c1399f51169` | `e5a72e29072c66e1` / `5b333c1399f51169` |
| Height recognition | `f8995353a388aab0` / `749114d5e2756716` | `f8995353a388aab0` / `749114d5e2756716` |

Closing bibliography SHA-256 prefix `07df2f4c65b53314`. Scientific outputs are reported at their respective file generations.

| Added or updated topic source | Closing SHA-256 prefix |
| --- | --- |
| EndHandleBands | `d5a8a1bf3f1cb37df78ac4a5` |
| MarkedEndTree | `ab6bd96809f0235726fcea68` |
| MarkedRegularTransport | `9c55145b9fedad56794a0e05` |
| RegularEndMarkings | `162d6ffe40658f8e8026a73a` |
| SelectedEndHandlePresentation | `9eceeec99465710b5c61e326` |
| FullDiskTrims | `e07087c7e562db9ea8cbfcf7` |
| ProtectedMarkedTrims | `27a392ed20c4c96a5b553dfe` |
| AtlasBallPacking | `3e06c2a84244a6ee9ee07305` |
| BalancedCollarWall | `d92ed7b39cbcb1c8aaf3bed6` |
| BalancedPhysicalDivision | `7ce0c8b25f688bdd94514240` |
| ChartMeasureTransport | `81c9ab6e12774300f8e4b423` |
| FiniteBallDivision | `d679ee2c1850c6d7e025124a` |
| FiniteDiskContraction | `05a87012774dab34662208b2` |
| FinitePointRouting | `20c68ffff6e0eede7b117073` |
| FourMeasureBisection | `1cdb1d98f25f6fc4181ce13b` |
| MarkedAtlasDivision | `1e63a2756055ddafb820b673` |
| MarkedDiskSeparation | `bba7a3ccbbef70fbd0a70ccc` |
| MarkedDivisionIteration | `10ec96752a478ccafcc5f7ff` |
| MeasuredCollarBudget | `090d00065c43808a9dc3d60d` |

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, Lake `5.0.0-src+470d5ce`. The Lake manifest SHA-256 is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. All checked-out revisions match their package pins. Each package was clean for tracked files.

| Package | Verified commit |
| --- | --- |
| DifferentialGeometry | `788efe97894474c032de6dfb1289d515f613d15a` |
| mathlib | `c55e6e786f49471c72fbddbec5415808896aec1e` |
| plausible | `fb13df72ecefd8ddbf9291021d7f33a8673eb57b` |
| LeanSearchClient | `29ff470276c725ae01505d55b17148c18fc7dfd3` |
| importGraph | `7e81a29bda33a6b257bd37557a6aa6aebe175d96` |
| proofwidgets | `c643bbb3c24f8a25f9c14e3a6b1ceb13d01f3de1` |
| aesop | `a90fbf7b02ff06a0deebf74088dff9e5fe02c9ea` |
| Qq | `37b0ba0b26109cf9f9c541f0f9557e50cfa1a3b9` |
| batteries | `3b7c8101932390d60e92a3f3d917901d5b5a773b` |
| Cli | `843844fa601dd56767b1eb22b7ada5b64d5e567a` |

Public import `599503f08b6a6756bbd3a923`, toolchain selector `bc84812c94489d1e3e191baa`, Lake package definition `35562fc83d2a568ae4ae08f3`.
