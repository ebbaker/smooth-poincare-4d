# Edition 03 assessment of the selected middle attachment and physical disk repairs

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Author-selected GPT-6.2 Astra/ultra lead, four GPT-6.2 Sol/ultra proof workers and two independent GPT-6.2 Sol/ultra readers. Independent serving metadata for the lead were unavailable. [Previous assessment](GLOBAL_GEOMETRY_AND_SELECTED_COLLARS_20261125.md) · [Frozen work and review assignments](../research-progress/handoffs/ED03_MARKED_REDUCTION_PACKETS_20261125.md) · [Public replay](../research-progress/handoffs/ED03_MARKED_REDUCTION_CHECKS.lean) · [Continuation](../continuation-notes/AFTER_MARKED_REDUCTION_AND_SIGNED_REPAIRS_20261125.md)

## What the inclusive energy bound now constructs

Fix a smooth oriented isometric hypersurface immersion of a nonempty compact Polish four-manifold into Euclidean five-space. Its induced $E_+\le64\pi^2/9$ selects a Morse height with at most one index-two point. Reordering that height on the same smooth source gives a new Morse function $h$ with distinct critical values, retaining every critical point and its index. Two regular values $a<b$ enclose exactly the original height's index-two points. The ordered function supplies the levels used by the gluing construction. [Ordinary indexed Gauss identity](../../SmoothPoincare/Heights/OrientedIndexedMean.lean) · [Ordering and regular cuts](../../SmoothPoincare/Heights/OrderedMorseHeight.lean)

| Middle points | Maps now obtained on the selected source |
| --- | --- |
| Empty | One ambient diffeomorphism takes the sublevel at $a$ onto the sublevel at $b$ and takes the whole level at $a$ onto the level at $b$. |
| One point $p$ | With $c=h(p)$, regular cuts $a<c-\epsilon<c+\epsilon<b$ enclose the native rounded two-handle. Its attaching map parametrizes the full $S^1\times D^2$ in the incoming level. The trace diffeomorphism identifies the adjunction with the local upper sublevel. The inclusions of the lower sublevel and the handle are smooth, with forward and inverse formulas on the deep lower region. Two ambient diffeomorphisms carry levels and sublevels over the remaining regular intervals. |

The framed tube has a checked smooth map and a closed topological embedding. The pinned theorem expressing the stronger native smooth embedding predicate requires an analytic atlas. The smooth trace result uses the ordinary smooth atlas. On a source homotopy equivalent to the unit four-sphere, rational singular homology and the Morse Euler sum yield $(n_1-n_0+1)+(n_3-n_4+1)=n_2$, also for an initial height with tied critical values. The two end-count inequalities specialize this to zero or one residual odd rank. Reversing the function preserves the points and complements their indices. Degree-zero incidence maps on the actual critical generators of the function and its reversal give the two end inequalities when their cokernels compute singular zeroth homology. Constructing the boundary maps and end-body tree contractions with their induced smooth markings remains open. [Dual indices and end inequalities](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_MORSE_END_BOUNDS.md) [Selected reduction](../../SmoothPoincare/Heights/SelectedHandleReduction.lean) · [Local attachment](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_ISOLATED_MIDDLE_ATTACHMENT.md) · [Count proof](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_MORSE_HANDLE_COUNTS.md)

Changing a lower marking acts on the whole tube by the inverse boundary change. Maps on the closed quotient and their inverses respect each handle coordinate and the actual upper gluing. Smoothness requires compatible germs across the seam. In the model $D^2\times S^2\cup S^1\times D^3$, the signed coordinate $t=|x|^2-1/2$ and the two unit directions give an explicit invertible smooth chart. Agreement with it on a source collar, plus smooth interior maps in both directions, upgrades the supplied marked homeomorphism to a diffeomorphism to the unit sphere in $\mathbb R^5$. For the hypothetical one-handle trace on a homotopy sphere the outstanding comparisons include the marked knot exterior and framing, the zero-surgery identification, and extension of the actual outgoing map. The primary Milnor, Gabai and Laudenbach–Poénaru inputs and their precise roles are in the independent review. [Marked quotients](../../SmoothPoincare/Heights/MarkedHandleGluing.lean) · [Seam and standard target](../../SmoothPoincare/Heights/SmoothMarkedSeam.lean) · [Native and literature audit](../09_morse_heights_and_handle_recognition/reviews/ED03_SURGERY_AND_MARKINGS.md)

## Intrinsic sequence and finite comparisons

Let $T=4\pi^2$. In E58, take physical Yamabe metrics $g_i$ with $e_i\to I<5T/4$ and the specified spectral, Euler, signature and same-set measure transport. Choose the omitted-probability tolerance before fixing the comparison windows. Given fixed inner, middle and outer comparison radii, strict separation, late smooth open-ball charts and the limit margins, compactness of an inner core allows a smaller concentric source ball in each chart. Its closed unit reparametrization leaves room on both sides. The resulting marked disks contain the protected cores and are disjoint. Both physical chiral masses on the **whole complement of the same disk union** are strictly below $T$. The ball distance belongs to the comparison metric, the missed probability to the modified gauge, and the full-curvature ceiling on each outer ball to $g_i$ and its own volume. No marked comparison has been constructed from the bare energy hypothesis. [Extraction and measures](../06_physical_scales_and_marked_annuli/research-progress/handoffs/ED03_SELECTED_COMPARISON_DISKS.md) · [Public E58 theorem](../../SmoothPoincare/Variational/MarkedBandCharge.lean)

The concurrent master’s E65 then supplied a different disk construction for the full strict band. Its paper proof preserves a marked core $Q_i$ and bisects four exterior measures inside a larger disk $B_i$. The Lean bridge starts with the two nested charts and the measured division for both physical chiralities. It proves that the smooth seam is null in the actual metric and treats the closed exterior $M\setminus\operatorname{int}B_i$. At fixed $k\ge1$, division with $q=2^{-k}$ to error $\tau_i\to0$ implies both raw exterior charges are eventually below $T$ whenever $e_i\to I<2T$. At a finite source, if an actual endpoint $h$ has energy below $2T$ and a positive same-type cap has energy at most the retained exterior of $h$ plus $\delta$, then its disk-side saving in sign $s$ satisfies
$$
 E_s(g;B)-E_s(h;B)>(1-q)e+qE_s(g;Q)+I^+(M)-2T-\tau-\delta.
$$
For any supplied $\varepsilon_*>0$, choose a single depth with $2^{-k}(T+\varepsilon_*)\le\varepsilon_*$ independently of the smooth type. If $I^+(M)>T+\varepsilon_*$, the original energy tends to this infimum, the endpoint hypotheses hold eventually and $\tau_i+\delta_i\to0$, each sign eventually requires a saving strictly above $\varepsilon_*$. This excludes a repair whose disk-side saving tends to zero on these same disks. The construction of the larger marked disk, the four-measure division, and the product-seam path to a positive cap each have their own proof obligations. [Independent marked-exterior and finite-choice review](../07_fixed_type_variational_descent/reviews/ED03_MEASURED_CHOICE_REVIEW.md) [Scientific construction](../../../papers/master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex) · [Necessary saving in the master](../../../papers/master/manuscript/balanced_disk.tex) · [Lean measured implication](../../SmoothPoincare/Variational/BalancedMarkedExterior.lean)

At one finite source all sufficiently thin common marked trims have full annular buffers and arbitrarily small total raw charge in both signs. The cutoff error also depends on derivatives in the chosen chart. For actual single and simultaneous repairs, write $U_j^\pm$ for joined surcharges and $V_j^\pm$ for signed changes on the exterior half. Signature and full-complement agreement for each single patch permit a sign choice separately on each disk. The joined ceiling and capped gain obey
$$
 C=e+\sum_j\min_\pm U_j^\pm,\qquad
 G=\sum_j\max_\pm\bigl(\lambda^\pm(D_j)-V_j^\pm\bigr),\qquad
 E_+(g_{\rm out})\le e-G.
$$
For a positive start, path data, the Euler inequality and actual cap-test transfers, $C<2T$ gives the attained output a Yamabe floor $\sqrt{48(2T-C)}>0$, hence $G\le e-I^+(M)$. Strict improvement over that excess contradicts the witnessed same-type infimum. Equality does not give a contradiction. Passing a raw exterior below $T$ does not yet bound the capped metric. [Full-width lemma](../../SmoothPoincare/PhysicalScales/FullDiskTrims.lean) · [Signed comparison](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_SIGNED_COLLAR_REPAIR.md) · [Independent signed review](../07_fixed_type_variational_descent/reviews/ED03_SELECTED_DISKS_AND_SIGNED_COSTS.md)

The finite measured choice improves the repair test when several annuli protect the same core. On each nonempty candidate row minimize $w^2+\beta^2$. For a certified row total $D_j$ and $N_j$ candidates, the joined surcharge and the signed exterior surcharge on the chosen charts sum to at most $\Gamma=2\sum_j D_j/N_j$. Core inclusion transfers the protected charge. If every minimizing choice admits the stated actual assembly, measured local bounds and cap tests, then $e+\Gamma<2T$ implies $\sum_j\max_\pm\lambda^\pm(C_j)\le\Gamma+e-I^+(M)$. The row data include the gauge derivative and chart deviation. Small raw curvature alone supplies only the curvature part. [Measured choice](../../SmoothPoincare/Variational/MeasuredCollarChoice.lean)

In the E62 physical metrics let $D$ be the integrated squared trace-free Ricci tensor, $Y$ the Yamabe constant and $\sigma$ the integrated square of the larger top chiral Weyl eigenvalue. The physical curvature identities imply
$$
 P=4e+3\sigma,\quad P-8T=D+(36\sigma-Y^2)/12,\quad 9e/2\le P\le8e.
$$
For $P_i\to8T$ both defects tend to zero and eventually $e_i<2T-T/9$, including on varying source manifolds with their own data. These estimates give inputs to the paper's E57 common-time smoothing argument. Its modified metric, curvature tails, flow and positive-time smooth identifications remain to be built. The estimates alone allow $e_i$ away from $T$. [Varying physical source theorem](../../SmoothPoincare/Variational/IsotropicGapEntry.lean) · [Independent physical normalization and limiting checks](../07_fixed_type_variational_descent/reviews/ED03_ISOTROPIC_ENTRY_REVIEW.md)

## Smooth types after the comparisons

The standard four-sphere supplies the explicit round surgery model. No further smooth type has been recognized by these declarations. An eligible immersed candidate now has the selected local trace or regular middle band. Its end-body markings and surgery recognition are still required. A candidate in the strict two-middle band still needs a selected framed diagram. The fixed-type route needs a concrete admissible replacement with its measured derivatives, or a physical window or smooth closed limit that supplies independent recognition. E61's charged disk through the full strict band and E62's uniform recognition are scientific manuscript results with stronger hypotheses and additional arguments than the Lean parts accepted here. The new connected-repair companion measures transfer through a genuine connector. Its geometric costs remain to be supplied for a competitor. The physical radial comparison likewise requires a polar Jacobian bound. The concurrent smooth-limit and spin-boundary arguments concern the actual modified-gauge blow-up and the supplied marked filling, respectively. Neither supplies a physical Ricci window or a recognition map in this release. [Modified-gauge Ricci concentration](../../../papers/master/01_fixed_type_variational_descent/manuscript/ricci_concentration.tex) · [Spin test on a marked filling](../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/eta_zero_filling.tex) The closing scientific E66 doubles test assumes a compatible totally geodesic half. E67 proves finiteness of the nonstandard types carrying exact positive Bach-flat classes in a fixed subcritical band using compactness with smooth identifications. The formal release leaves those hypotheses and the classification of such types open. [E63–E67 scientific register](../../../papers/master/research-progress/REGISTER.md) · [Exact closed classes](../../../papers/master/manuscript/exact_closed_types.tex)

The assessed cutoffs continue to distinguish a finite attained class from an infimum along an unmarked limit. [E61–E62 paper assessment](../../../papers/master/research-progress/handoffs/E59_E62_SPECTRAL_WINDOWS_20261125.md) · [Connected repair](../../../papers/master/01_fixed_type_variational_descent/manuscript/connected_repair.tex) · [Polar Jacobian comparison](../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/critical_radial_defect.tex)

## Input generations and public acceptance

Dispatch used working sources at `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`. During execution the checkout advanced to `bfdf0660e4f7d574cf507333af8e5e6781fa7915` and then `4bec4df82e8b949935dd5a43f12f52cd3d018acb`. The closing figures below hash the working files, including uncommitted proofs and concurrent scientific revisions. No upstream package revision changed.

For each group, sort the repository-relative paths and hash the UTF-8 concatenation of `path<TAB>lowercase file SHA-256<LF>`. The six manuscript directories belong to the master, its fixed-type companion, neck geometry, hypersurface immersions, immersed handle constructions and two-handle recognition. For the register groups take each owner’s overview files, plan files and sole progress register. The formal register group covers the program and all nine routes.

| Source group | Previous assessed count and SHA-256 | Closing count and SHA-256 |
| --- | --- | --- |
| Six scientific manuscript directories | 23 · `59bf7de729c3d0b241fae7c22097aeeba72651e3f471568399b6a3f54d91a969` | 36 · `22602e367376c5c392abc6a25417ed01b1e8b06d22278b59a928d95c8227a457` |
| Edition 03 Lean topic tree | 70 · `73581c72c25a0f6fa2be6c2e27f9e5a9f86dc58af2d9d7670202720cf8351f29` | 86 · `918dc7ad968b8cf382cd89857399a73cfd57b79217a687bbf69cb75688dab993` |
| Blueprint TeX sources | 10 · `37f9fc0535254ab88c89b12a47cfb2858071cd5b344d6f2fbe1bfc05b27fdc5c` | 11 · `22a1fe21763ef0e455df753177c5a4b2727fbac0f5fd3cc017ba033ee4a4ffa3` |
| Master and companion plans and registers | 18 · `b06c9ccaef84714753bcc67c1fb357f286ecff680543ffb66ade2cbc5f4b9502` | 18 · `917c4eaa45faa38fddddf59283d1efdd16fc41fa151c45e253eeefbc4fdaa831` |
| Program and route plans and registers | 36 · `9c2409a2dc35dc268eefea25534c7ad45fd3129d2c02151d53dc9613127f2171` | 36 · `1b8daea76b737666b5e857403a10859d3b097b6d474622b3863b4825eb50e88b` |

At the first working comparison the scientific group already comprised 29 files, digest `122c70622079659e686d67088d65ee13bd68ea25aeaec7defa13dbb051e4d17a`. The closing scientific changes relative to the previous assessment are listed below. Earlier proofs retain the frozen inputs named in their individual receipts.

| New or revised scientific TeX | Closing SHA-256 prefix |
| --- | --- |
| critical_radial_defect.tex | `662615cf1dfa3820` |
| marked_necks_and_chiral_energy.tex | `f06cb256872a7f4e` |
| physical_ricci_flux.tex | `6f75a9186a6442c9` |
| eta_zero_filling.tex | `40ae2b43805df973` |
| marked_immersed_handle_constructions.tex | `24d131819bee1bfd` |
| short_seam.tex | `f719a9bff8f7b463` |
| balanced_exterior.tex | `985e478eaafacbe3` |
| collar_capacity.tex | `9b08ae7f625363b0` |
| connected_repair.tex | `9688f220fe65b682` |
| cotton_variation.tex | `b4b879bde3a86347` |
| fixed_type_chiral_energy_descent.tex | `93f9c39d8f09bfd7` |
| isotropic_gap.tex | `4b797040f9e081cf` |
| ricci_concentration.tex | `8cf098e31a6c4038` |
| spectral_windows.tex | `8063d76ad6875e80` |
| balanced_disk.tex | `0983c006fd4d7296` |
| chiral_weyl_energy_and_smooth_poincare.tex | `d9f2d41da8bc3187` |
| exact_closed_types.tex | `09b529b82f6551e3` |
| marked_cut.tex | `04186dce19563328` |
| recognition_gap.tex | `290133d33d94854e` |

| Accepted new Lean topic | SHA-256 prefix |
| --- | --- |
| IsolatedMiddleAttachment | `d6953eba13193db8` |
| MarkedHandleGluing | `c2eb2dd97745b437` |
| MorseEndBounds | `cd6ca20467f8d573` |
| MorseHandleCounts | `e8b710f193d4d3b7` |
| OrderedMorseHeight | `3c7d02bb9f9ad4e4` |
| SelectedHandleReduction | `6314de355688e45a` |
| SmoothMarkedSeam | `a926e7e517164ed7` |
| StandardSurgeryModel | `456524a5b3921aad` |
| FullDiskTrims | `855dd41bf6ad0a91` |
| SelectedComparisonDisks | `3d9d7ef05c96a8a8` |
| BalancedMarkedExterior | `88ecd83e48994968` |
| IsotropicGapEntry | `dc805ad5765157cb` |
| MarkedBandCharge | `f1bdf8774ba45c70` |
| MeasuredCollarChoice | `414ebd4d4eaaa62b` |
| SignedCollarCapTests | `572b7dd9566a736a` |
| SignedCollarRepair | `d8b63804f565d2e9` |

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, Lake `5.0.0-src+470d5ce`. The manifest SHA-256 is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. Each package working tree was clean for tracked files and its checkout equaled the manifest revision.

| Package | Verified revision |
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

The public import, Lean toolchain selector and Lake package file have SHA-256 prefixes `4f0281affced3023`, `bc84812c94489d1e` and `35562fc83d2a568a`, respectively.

### Kernel and rendered outputs

The public `lake build` finished successfully in 10,278 jobs without warnings. The checked topic tree has 86 modules, including two import-only modules. An independent inventory replayed the exact types and axioms of all 507 explicitly authored public declarations through `import SmoothPoincare`. The complete blueprint references 343 distinct declarations. These passed through the three published package roots, with 678 distinct names in the union of both inventories. Of the historical blueprint declarations outside the topic tree, 108 require the separate `FirstOrderTwistor` root. The union of reported axioms was exactly `propext`, `Classical.choice` and `Quot.sound`.

The [public milestone receipt](../research-progress/handoffs/ED03_MARKED_REDUCTION_CHECKS.lean) passed 65 exact type/axiom pairs and seven application examples. These include the native selected attachment, tied critical-value counts, unequal candidate counts per core, saturated physical gap identity, and the exact half-division finite saving for the same positive cap. The three earlier Edition 03 opening, geometric and global-geometry public receipts also passed on the closing import.

Both blueprint formats rebuilt. All 119 labels resolved in the rendered HTML and the PDF destinations. The 343 distinct Lean links lead to the indexed source lines. The new section contains eight statements and their proofs on pages 27–30. [30-page PDF](../../blueprint/print/print.pdf) · [Web chapter](../../blueprint/web/sec-ed03-marked-reduction.html) · [Dependency graph](../../blueprint/web/dep_graph_document.html)

The exact public conversation source was unavailable to the recorder. The project receipts above document the mathematical work and its verification.
