# Conformal core comparison for the two chiral charges and the spectral-square measure

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The actual serving model and effort were unavailable. Bounded Lean execution on repository input `95a4f50eb9ec6e0e98454170279f45a66b000211` for the selected conformal-core alternative. [Lean source](../../../../SmoothPoincare/Variational/ConformalChiralCharges.lean) · [Conformal core realization](../../../../SmoothPoincare/Variational/ConformalCoreReference.lean)

## Physical result

Let $g$ be a smooth Riemannian metric on an oriented, boundaryless four-manifold and let $u$ be smooth. At each $x$, the basis $e^{-u(x)}e_a$ is positively oriented and orthonormal for $\widetilde g=e^{2u}g$ if $e_a$ is positively oriented and $g$-orthonormal. The sign of the frame change follows from the positive determinant of the scalar map. The proof compares the Levi–Civita tensors by polarizing the pinned sectional conformal identity. In the curvature-operator slot convention, the comparison in these bases is
$$
 \widetilde R_{abcd}=e^{-2u}(R_{abcd}+(g\mathbin{\owedge}S)_{abcd}),\qquad
 S=-\nabla^2u+du\otimes du-\tfrac12|\nabla u|_g^2g.
$$
The scalar coefficient of the Kulkarni–Nomizu correction in either normalized chiral compression is $\operatorname{tr}_g S/2$. Trace subtraction gives $\widetilde W^\pm=e^{-2u}W^\pm$ block by block. The proof supplies the actual transformation of the Weyl matrices to `riemannianChiralEnergyMeasure_conformalMetric`. [Besse, §1.159](https://doi.org/10.1007/978-3-540-74311-8) · [Existing measure change](../../../../FirstOrderTwistor/ConformalEnergy.lean)

The equalities $|\widetilde W^\pm|^2\,dV_{\widetilde g}=|W^\pm|^2\,dV_g$ hold as Borel measures. The volume factor is $e^{4u}$, and the squared Hilbert–Schmidt factor is $e^{-4u}$. In the compact signed metric package, `SignedCollarMetric.conformal` proves integrability for both transformed densities and transports the equality of the two total energies from the source. Consequently `charge_conformal` holds on every set for either sign, and `energy_conformal` rules out a strict whole-metric gain along `g.conformal (t • u)`, including a nontrivial positively matched endpoint on the selected widths.

Each supplied orthogonal diagonalization of the physical block certifies the pointwise ordered spectrum for the changed block with the same diagonalizer and with all eigenvalues multiplied by $e^{-2u}$. Because this factor is positive, the same scaling applies to the larger of the two top eigenvalues. Its squared density again has factor $e^{-4u}$. `balancedPhysicalSpectralMeasure_conformal` proves exact equality as measures, including the full closed exterior and the complete trim. The eigendata statement concerns the two actual Weyl blocks. The volume-one normalization and constant scalar identity in `EndpointPhysicalSpectralData` remain requirements on the original Yamabe metric. The full Levi–Civita curvature measure includes the displayed $S$ correction and is part of the separate curvature cost.

## Verification

Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The main curvature input is the pinned `metricRm04StdAt_conformalMetric_plane`. The complete tensor identity follows using `IsAlgCurvForm.ext`, following the polarization proof in the pinned `Geometry/Curvature/ConformalOperator.lean`. The verification also applies the package to both ordered spectra, any set $A$, and an exact conformal slice $t u$.

The targeted Lake build passed in 9,850 jobs with no diagnostics. A fresh import checked all 12 exported declarations for axioms and instantiated both eigendata transports, spectral-measure equality, the two regional charge equalities and the impossibility of a strict gain on one conformal slice. The only axioms reported were `propext`, `Classical.choice` and `Quot.sound`. The checked source SHA-256 is `ad894d246295c306ecccde0466a652e22c5910f0ff238d9dbda14de436e31be7`. The input `BalancedPhysicalDivision.lean` has SHA-256 prefix `16e3f21fe84b` and `ConformalEnergy.lean` has prefix `3643090328ab`.
