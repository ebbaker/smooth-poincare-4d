# DESC-E02h and DESC-E02i · Marked comparison disks and E58 residuals

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The author selected GPT-6.2 Sol/ultra for bounded proof work. Independent serving model and effort telemetry for this execution were unavailable.

The request named baseline `b5ce9f481a76` with its working tree. The checkout was `bfdf0660e4f7d574cf507333af8e5e6781fa7915`, its immediate successor, with no local edits to the inputs below. The manifest SHA-256 was `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. Lean `4.35.0-rc3`, mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` were pinned.

| Input | Git blob prefix |
| --- | --- |
| [Physical-volume ball selection](../../../../../papers/master/manuscript/physical_volume.tex) | `1142e2aa60ba` |
| [Endpoint disk selection](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/endpoint_charge.tex) | `8214853deaf3` |
| [E58 subcritical band](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/subcritical_charge.tex) | `fe0aba4ecd89` |
| [Prescribed collar comparison](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/disk_collar_comparison.tex) | `45f41c42e3d8` |
| [Metric and full-tensor measure](../../../../SmoothPoincare/PhysicalScales/MetricQuantiles.lean) | `9dfeb626d178` |
| [Selected disk and raw trims](../../../../SmoothPoincare/PhysicalScales/SelectedDiskCollars.lean) | `5d861f3316f1` |
| [Band tolerance](../../../../SmoothPoincare/Variational/BandChargeTolerance.lean) | `4f653110d894` |

## DESC-E02h · Actual marked disks

`exists_selectedChartDisk_of_compact_subset` takes a smooth partial diffeomorphism from an open Euclidean four-ball of radius $R>0$. The inverse image of the protected compact core, together with the origin, is compact. Its norm has a maximum $m<R$. Choose $r=(m+R)/2$ and use the actual smooth marking $F'(z)=F(rz)$. Its source is the open ball of radius $R/r>1$, its target is the original open chart image, and the protected core lies in the image of the open unit ball. `isCompact_selectedChartDisk` checks compactness of the marked closed disk, hence Borel measurability on the Hausdorff source.

`exists_selectedComparisonDisks` applies the construction for each label on one compact connected Hausdorff smooth four-manifold. The closed inner comparison ball lies in the open marking, and the marking lies in the open middle comparison ball. The strict inner capture holds within the disk's open interior. Separation of the middle radii gives pairwise disjoint open marking targets and therefore disjoint closed disks. All three comparison balls use the length distance of $k$. With $U$ the finite union of marked disks, $A$ the union of the closed inner comparison balls, $V_j$ a marking target and $O_j$ the open outer comparison ball, the proof gives

$$
\mu(M\setminus U)\le\mu(M\setminus A)<d,
\qquad
\nu(D_j)\le\nu(V_j)\le\nu(O_j)<\zeta.
$$

Here $\mu$ is the modified probability and $\nu$ is the squared full curvature tensor measure of the physical $g$ in its own volume. These inequalities charge the complete omitted set and the entire outer comparison ball. The proof uses the finite physical curvature integral to take real measure values monotonically.

`eventually_exists_selectedComparisonDisks` fixes one finite label set and three radii per label before the source limit. It takes eventual smooth model ball charts and convergence of the pairwise comparison distances, the full omitted inner-ball probability and each outer-ball physical curvature. The strict margins in these scalar limits yield every required bound simultaneously at all sufficiently large indices. The centers, dilation factors and markings may depend on the index. Each chosen marking extends across the unit seam on both sides. The available radial room can vary with the index and label.

The Riemannian comparison compactness, regular-point finite Vitali selection, source-ball volume criterion, moving-center measure limits and smooth embedding inputs in the manuscript remain upstream. For the embedding step the manuscript uses Cheeger–Colding A.1.8–A.1.9 with the Ricci lower bound, sufficiently small radius, nearly maximal comparison volume and smooth sources. Positive dilation preserves the chart's existing orientation sign. The Lean marking type records the smooth map, with orientation compatibility left to an oriented gluing application. Derivative control in the marked collar and a positive same-type repair remain open here. [Cheeger–Colding, A.1.8–A.1.9](https://doi.org/10.4310/jdg/1214459974) · [Liimatainen–Salo, Theorem 1.1](https://doi.org/10.1093/imrn/rnv255)

The frozen [disk module](../../../../SmoothPoincare/PhysicalScales/SelectedComparisonDisks.lean) has SHA-256 `3d9d7ef05c96a8a855b65e904cd0a981420e4d21acb74e61e9db7e4cd6a6e865`. `lake build SmoothPoincare.PhysicalScales.SelectedComparisonDisks` completed successfully from the pinned package. Each of its four public declarations reports `propext`, `Classical.choice` and `Quot.sound` under `#print axioms`.

## DESC-E02i · Both residuals on the same selected disks

`eventually_exists_markedBandCharge` composes the fixed-radius disk theorem with the subcritical band tolerance theorem. The hypothesis $e_i\to e_\infty<5T/4$ with $T=4\pi^2$ and the stated Yamabe, spectral and transport data determine $d>0$ before any comparison windows are supplied. For any prescribed outer curvature ceiling and radius bound, a `FixedBandComparisonWindows` at that $d$ yields the marked disks at every late index. Each `HasMarking` records the actual charts, the strict physical outer curvature ceilings and the omitted modified probability. Both physical chiral integrals are then strictly below $T$ on the same full complement of that very family. The use of the spectral conventions is through the existing theorem, with Hilbert–Schmidt chiral blocks and their actual physical volume. [Chen–Zhu, Lemma 2.1 and Theorem 1.7](https://arxiv.org/abs/1206.5051)

The wrapper uses compact disk images to apply the spectral transport to these regions. A choice of measurable sets at early indices permits the existing sequence-level theorem to be used. At each sufficiently large index the selected sets are exactly the chosen marked disk images. The existence of suitable fixed comparison windows is a premise. A collar repair estimate and an admissible replacement metric require further geometric evidence.

The frozen [E58 module](../../../../SmoothPoincare/Variational/MarkedBandCharge.lean) has SHA-256 `f1bdf8774ba45c70c7498473bbb13068e9f2818c896279b708b3a3a3ffb61bd9`. `lake build SmoothPoincare.Variational.MarkedBandCharge` completed successfully from the pinned package. `FixedBandComparisonWindows`, `FixedBandComparisonWindows.HasMarking` and `eventually_exists_markedBandCharge` report `propext`, `Classical.choice` and `Quot.sound` under `#print axioms`.
