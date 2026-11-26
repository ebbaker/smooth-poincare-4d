# Isotropic spectral gap · Physical entry estimates

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 execution. The actual serving model and reasoning effort were unavailable. [Isotropic-gap manuscript](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/isotropic_gap.tex) · [E62 derivation](../../../../../papers/master/01_fixed_type_variational_descent/notes/E62_ISOTROPIC_FLOW.md) · [E57 smoothing lemma](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/endpoint_smoothing.tex) · [Lean proof](../../../../SmoothPoincare/Variational/IsotropicGapEntry.lean)

The physical input at each index is a smooth, oriented, closed, volume-one positive Yamabe metric in dimension four. The existing `EndpointPhysicalSpectralData` records ordered eigendata of its two trace-free chiral Weyl blocks in actual oriented orthonormal frames, integrability, signature zero, Euler characteristic two, and the strict Chen–Zhu inequality. Write $e$ for the common chiral Hilbert–Schmidt energy, $L$ for the larger of the two largest signed chiral eigenvalues, $\sigma=\int L^2dV_g$, $Y$ for the Yamabe constant, and $T=4\pi^2$.

The density in $D$ is $\sum_{a,b}(\operatorname{Ric}_{ab}-R\delta_{ab}/4)^2$ in that same orthonormal frame, by `endpointRicciDefectDensity_eq_ricci`. It is the squared ordered-index norm of the trace-free Ricci tensor. The existing Euler normalization is $16\pi^2=2e-D/2+Y^2/24$, using constant scalar $Y$ and volume one. Thus the checked identity has precisely the manuscript factors
$$
 P=4e+3\sigma,\qquad
 P-8T=D+(36\sigma-Y^2)/12.
$$
The Ricci integral has unit coefficient in this balance.

`orderedEndpointSpectrum_hilbertSchmidt_bounds` proves for a real symmetric trace-free block with largest eigenvalue $z$ that $z\ge0$ and
$$
 \tfrac32 z^2\le\|W\|_{\rm HS}^2\le6z^2.
$$
For the upper bound, if the smaller eigenvalues are $a,b$, then $(z-a)(z-b)\ge0$ and $a+b=-z$ give $ab\ge-2z^2$. The lower bound follows from $(a-b)^2\ge0$. Integrating the positive-block upper bound gives $e/6\le\sigma$. The existing two-block spectral deficit and signature give $\sigma\le4e/3$. `endpointPhysicalIsotropicGapBounds` certifies the identity and moment bounds from the actual metric, and `IsotropicGapBounds.quantity_sandwich` gives $9e/2\le P\le8e$. [Physical endpoint data](ED03_ENDPOINT_SPECTRAL_DEFICIT.md)

The scalar entry theorem accepts one independent certificate per index and only nonnegativity of the Yamabe spectral deficit $36\sigma_i-Y_i^2$. If $P_i\to8T$, it bounds $D_i$ above by $P_i-8T$ and $36\sigma_i-Y_i^2$ above by $12(P_i-8T)$. Hence both defects tend to zero. Eventually $P_i<8T+T/2$, so the lower bound for $P_i$ also gives $e_i<2T-T/9$. The geometric sequence theorem instantiates this argument with the actual physical Ricci integral, spectral integral, chiral energy and Yamabe constant at every index. Its manifolds, orientations, metrics and eigendata can vary. The existing endpoint data supply strict spectral deficit in this instantiation.

This establishes the physical estimates entering the manuscript's degeneration argument. Applying the E57 smoothing lemma still requires the modified Yamabe representative and its transport, smooth approximation, the uniform Sobolev and curvature-tail estimates, and the initial Einstein comparison. The flow, isotropic-curvature transport, smooth identification and recognition remain separate geometric steps.

## Input and verification receipt

Intake HEAD was `bfdf0660e4f7d574cf507333af8e5e6781fa7915`, with the E62 manuscript in the working generation. The SHA-256 prefixes at intake were `4b797040f9e0` for `isotropic_gap.tex`, `7cce530242f8` for `endpoint_smoothing.tex`, `9d54970bab33` for the E62 note, and `59fb8d21856d` for `EndpointSpectralDeficit.lean`. The pins remained Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.

`lake env lean SmoothPoincare/Variational/IsotropicGapEntry.lean` passed without diagnostics. The checked source SHA-256 prefix is `dc805ad57651`.

`lake build SmoothPoincare.Variational.IsotropicGapEntry` passed without diagnostics in 9,774 jobs.

A fresh import checked the types and axioms of five new theorems and the existing frame Ricci identity. It also elaborated the expanded identity and both sandwich inequalities. Every axiom report contained only `propext`, `Classical.choice` and `Quot.sound`. The checkout advanced independently to `4bec4df82e8b949935dd5a43f12f52cd3d018acb` during verification. The source manuscript and physical spectral input retained the recorded hashes.
