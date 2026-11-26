# DESC-E03a/b · Signed collar accounting and capped test transfer

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 execution. The actual serving model and reasoning effort were unavailable. [Signed collar source](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/collar_capacity.tex) · [Simultaneous removal and product stretching](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex) · [Exact chart trims](ED03_SELECTED_DISK_COLLARS.md)

## Signed comparison at one finite source index

Use a smooth Riemannian metric on the original compact oriented boundaryless four-manifold with fixed orientation and integrable squared Hilbert–Schmidt densities of both trace-free Weyl blocks. `SignedCollarMetric` carries the actual metric, its oriented orthonormal frames, its two physical chiral measures and the explicit signature-zero equality of the total energies. Each single-patch and simultaneous metric lives on this same manifold. [Signed accounting module](../../../../SmoothPoincare/Variational/SignedCollarRepair.lean)

At one patch let $B_j$ be the entire raw disk, $A_j$ the joined annulus and $A_j^{\mathrm{out}}=A_j\setminus B_j$. The joined cost is
$$
 U_j^\pm=\max\{0,(\sqrt{H_j^\pm}+\beta_j^\pm)^2-S_j^\pm\}.
$$
The finite-parameter proof uses the affine leading density $(1-t)F+tF_{\mathrm{weighted}}$ and error at most $t\beta$. The norm is bounded by the convex combination of $\|F\|$ and $\|F_{\mathrm{weighted}}\|+\beta$. Both are nonnegative by the norm and allowance, so squaring the endpoint maximum suffices. At the exterior endpoint the triangle inequality gives
$$
 V_j^\pm=(\sqrt{H_{j,\mathrm{out}}^\pm}+\beta_{j,\mathrm{out}}^\pm)^2
  -S_{j,\mathrm{out}}^\pm.
$$
This cost is signed. The raw charges $S$ are measured on the exact two regions. `Estimates.ofWeightedDensities` takes norm-square identifications for their raw and actual output densities and the respective error estimates. The weighted inputs represent the raw density multiplied by $1-\psi$. The constructor also supports a separately bounded exterior error.

The joined accounting subtracts the whole complement of the union of the joined annuli on the original metric and on the simultaneous path metric. Inside each annulus the path agrees in charge with an actual single-patch metric. Since that single change preserves the full complement charge in both chiralities, its total signature equality identifies the two local increments. `SignedCollarAssembly.joinedEnergy_le` therefore gives a common ceiling
$$
 C = e + \sum_j \min(U_j^+,U_j^-)
$$
for the actual joined path.

For the output, the complement is the whole complement of $\bigcup_j(B_j\cup A_j)$. The conformally flat caps carry zero chiral charge on the supplied disks. Each exterior half agrees in charge with its corresponding single-patch output. Signature on this single-patch output gives the actual identity $o_j^+-o_j^-=\lambda^+(B_j)-\lambda^-(B_j)$, where $o_j^\pm$ are exterior charge increments. Thus `SignedCollarAssembly.outputEnergy_le` evaluates the same simultaneous output $k$ and yields
$$
 E_+(k)\le e-G,\qquad
 G = \sum_j \max\{\lambda^+(B_j)-V_j^+,\lambda^-(B_j)-V_j^-\}.
$$
The better sign can differ by patch in either sum. A positive capped metric is a member of the fixed-type variational set, giving $G\le e-I^+(M)$. A strict gain above that finite excess yields a contradiction. A strict joined ceiling is a separate condition.

`SelectedDiskSignedCollarAssembly` specializes the accounting to the supplied `selectedChartDisk (F j)` and the actual `selectedDiskTrim (F j) (width j)` on each patch. The widths are fixed before any estimates. Setting all width indices equal specializes to the common-width diagonal. The chosen widths and charges remain the same in the joined and exterior comparisons.

## Positive floor on the same capped metric

`SignedCollarCapTestPath` supplies actual metrics on a preconnected parameter space beginning at the original source metric. A continuous level detects positive Yamabe sign and identifies its zero set with scalar-flat Yamabe class as required by the wall argument. The normalized Euler inequality is supplied for the Yamabe constant and the chiral energy of the same metric at every test-path index. Each test-path energy is bounded by the energy of an indicated member of the signed interpolation. For product stretching, the indicated interpolation member can be its terminal metric, using equality of energies along the stretched part. [Yamabe wall](../../../../SmoothPoincare/Variational/YamabeWall.lean) · [Signed cap-test module](../../../../SmoothPoincare/Variational/SignedCollarCapTests.lean)

For $T=4\pi^2$, a positive source and $C<2T$ give the explicit wall margin $2T-C$. The connected wall theorem gives the uniform joined Yamabe floor $\sqrt{48(2T-C)}$. Each smooth conformal test on the actual output comes with log-conformal tests on this same joined family. The scalar numerators and physical volumes of those tests converge separately to the corresponding output values. `HasJoinedCapTests.yamabeFloor` then gives
$$
 0<\sqrt{48(2T-C)}\le Y([k]).
$$
The resulting strict comparison takes this certificate in place of an implication postulating positivity. The exact selected-width version uses the same $k$, $C$ and $G$.

The geometric inputs still include the chart and same-domain Weyl-density transport, the cutoff and its estimates on the exact widths, the single and simultaneous smooth metrics, their full-complement agreements, signature and normalized Euler identities, the continuous sign detector, and the stretched-test transplants. The proof certifies the consequences of these inputs. Constructing the tests geometrically requires the marked product extension, conformal compactification and the finite-point capacity argument. [Earlier cap-test transfer](../../../03_single_cut_descent/research-progress/handoffs/ED03_CAP_TEST_TRANSFER.md) · [Existing test convergence theorem](../../../../SmoothPoincare/Variational/CapTestTransfer.lean)

## Input and verification receipt

The packet predecessor was `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`. The checkout at intake was `bfdf0660e4f7d574cf507333af8e5e6781fa7915`, which contains the collar-capacity source. The read SHA-256 prefixes were `9b08ae7f6253` for the collar-capacity source, `511525d238ea` for simultaneous removal, `708f616a6d02` for `SelectedDiskCollars.lean`, `0bf8cc30ed8f` for `CapTestTransfer.lean`, and `06d482aad1d0` for `YamabeWall.lean`. The existing pins were Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.

`lake env lean SmoothPoincare/Variational/SignedCollarRepair.lean` and `lake build SmoothPoincare.Variational.SignedCollarRepair` passed without diagnostics. The targeted build completed in 9,787 Lake jobs. The checked source SHA-256 prefix is `d8b63804f565`.

`lake env lean SmoothPoincare/Variational/SignedCollarCapTests.lean` and `lake build SmoothPoincare.Variational.SignedCollarCapTests` passed without diagnostics. The targeted build completed in 9,798 Lake jobs. The checked source SHA-256 prefix is `572b7dd9566a`.

A fresh import of `SmoothPoincare.Variational.SignedCollarCapTests` replayed the elaborated types and axioms of 16 declarations across both modules. The replay included the signed costs, weighted-density bridge, single-patch identity, same-output ceiling and gain, joined and output floors, and exact-width strict comparisons. It also checked a negative exterior cost with zero joined allowance and two sums whose preferred signs switch between patches. All reported axioms were among `propext`, `Classical.choice` and `Quot.sound`.
