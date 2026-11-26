# Edition 03 · Isotropic spectral entry review

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded independent E review. Actual serving model and effort are unavailable. Working base `bfdf0660e4f7d574cf507333af8e5e6781fa7915` and Lake manifest `839111aae86b6935`. [E62 manuscript](../../../../papers/master/01_fixed_type_variational_descent/manuscript/isotropic_gap.tex) · [E62 flow review](../../../../papers/master/01_fixed_type_variational_descent/reviews/E62_ISOTROPIC_FLOW.md) · [Route 07](../research-progress/REGISTER.md)

## Finite normalization and sequence entry

Use a smooth volume-one positive Yamabe metric $g$ on a closed oriented Riemannian homotopy four-sphere. Let $T=4\pi^2$, $e=E_+(g)=E_-(g)$ in Hilbert–Schmidt chiral operator norm, $D=\int|Z_g|^2\,dV_g$, $Y=Y([g])>0$, $L=\max_\pm\lambda_{\max}(W_g^\pm)$, $\sigma=\int L^2\,dV_g$, $\Delta=36\sigma-Y^2$ and $P=4e+3\sigma$. The two terms defining $P$ are conformally invariant on the smooth class. `EndpointPhysicalSpectralData.euler_two` with unit volume, $R_g=Y$ and signature zero reads

$$
16\pi^2=2e-\frac{D}{2}+\frac{Y^2}{24},\qquad
Y^2=48(2T-e)+12D.
$$

It follows exactly that $P-8T=D+\Delta/12$. The strict Chen–Zhu spectral certificate gives $\Delta>0$ in the nonstandard case, and the squared Ricci defect gives $D\ge0$. For ordered trace-free block eigenvalues $a\le b\le z$, $z\ge0$ and $b\in[-z/2,z]$. The function $z^2+b^2+(z+b)^2$ is increasing on this interval, hence $|W^\pm|_{\mathrm{HS}}^2\le6L^2$. Cauchy–Schwarz on the two lower eigenvalues gives $|W^\pm|_{\mathrm{HS}}^2\ge3z^2/2$, which implies $L^2\le(2/3)(|W^+|_{\mathrm{HS}}^2+|W^-|_{\mathrm{HS}}^2)$. Integration gives $e/6\le\sigma\le4e/3$ and therefore $9e/2\le P\le8e$. [Physical data and norm convention](../../../SmoothPoincare/Variational/EndpointSpectralDeficit.lean) · [Chen–Zhu, Theorems 1.4 and 1.6](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)

For a sequence with $P_i\to8T$, the nonnegative bounds $D_i\le P_i-8T$ and $\Delta_i\le12(P_i-8T)$ give vanishing of both defects. The lower spectral bound gives $\limsup e_i\le16T/9$. For instance, $P_i<(17/2)T$ eventually implies $e_i<17T/9$ and $Y_i^2>48T/9$. This gives a positive floor for the Yamabe constant on the same late sequence. The paper uses the Yamabe upper bound to obtain a subsequential positive limit $Y_i\to y$. For this subsequence step the algebra also gives the required boundedness, since $Y_i^2\le36\sigma_i\le12P_i$. The scalar values $e=3T/2$, $\sigma=2T/3$, $Y^2=24T$ and $D=\Delta=0$ meet the limiting identities and inequalities. Thus the algebra allows endpoint values other than $e=T$ and $\sigma=4T/3$.

## Modified gauge and geometric scope

For the actual volume-one modified representative $q$ write $\mu=dV_q$ and $R_q=6L_q+c$ with $c\le0$, $\int L_q^2\,d\mu=\sigma$. The constant test and Cauchy–Schwarz give $Y\le c+6\int L_qd\mu\le c+6\sqrt\sigma$, so $-\Delta/(6\sqrt\sigma+Y)\le c\le0$ and $\int(L_q-Y/6)^2\,d\mu\le\Delta/36$. For the scalar term,

$$
\int R_q^2d\mu=36\sigma+c\left(12\int L_qd\mu+c\right)\le36\sigma,
\qquad
\int(R_q-Y)^2d\mu\le\Delta.
$$

Here $12\int L_qd\mu+c\ge2Y-c>0$ and the test also gives $\int R_qd\mu\ge Y$. Applying Gauss–Bonnet in both conformal gauges, with matching chiral charges, gives $D_q=D+(\int R_q^2d\mu-Y^2)/12\le D+\Delta/12$. These estimates use the modified scalar equation on the same measure as the norm. [Modified minimizer and test](../../../SmoothPoincare/Variational/EndpointChargeTransfer.lean) · [Chen–Zhu, Lemma 2.1 and Theorem 1.7](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)

The paper then uses indexwise $C^2$ conformal smoothing, bounded $Y_i$, the full tensor decomposition $|\mathrm{Rm}|^2\le48L^2+2|Z|^2+R^2/6$, and a common Sobolev bound to enter the E57 common-time lemma. The isotropic deficit is initially small because the sum of the two lowest eigenvalues of either curvature block is $R/6-\lambda_{\max}(W^\pm)\ge c/6$ before smoothing. Propagation, a smooth closed limit identified by diffeomorphisms with the late sources, and Einstein/isotropic rigidity are later analytic and geometric steps. [Smoothing lemma](../../../../papers/master/01_fixed_type_variational_descent/manuscript/endpoint_smoothing.tex) · [Master recognition](../../../../papers/master/manuscript/recognition_gap.tex)

For an actual class the strictly positive aggregate deficit is a finite inequality. Even when the sequence argument excludes $P_i\to8T$ across varying types, passing to an inclusive bound on an unattained infimum requires selecting an actual class strictly inside the resulting uniform gap. The infimum convention for an empty class family is extended-real $+\infty$ in the manuscript. A real `sInf` formulation of this last step requires a nonempty positive-energy family or an explicit extended-real translation.

## Lean scope

`orderedEndpointSpectrum_hilbertSchmidt_bounds` first uses the supplied orthogonal diagonalization to reduce the trace and Hilbert–Schmidt norm to the three eigenvalues. Its upper-bound inequality uses $(z-a)(z-b)\ge0$ and $a+b=-z$, hence $ab\ge-2z^2$ and $a^2+b^2+z^2=2z^2-2ab\le6z^2$. `endpointPhysicalIsotropicGapBounds` applies the upper bound to the actual positive block and the spectral-defect identity to the two physical blocks for the other direction. The Ricci and spectral moments integrate in the same original metric volume. Euler, signature zero, normalization and the strict spectral classification are explicit fields of the supplied physical data.

`isotropicGap_smoothingEntry` is a real-sequence implication with nonnegative Ricci and spectral defects and the aggregate equality certified at each index. `endpointPhysicalIsotropicGap_smoothingEntry` assembles that certificate for a dependent sequence of manifold types, models, orientations, physical metrics, frames and eigendata. Its exact output is vanishing of $D_i$ and $\Delta_i$ and $e_i<2T-T/9$ eventually. Conformal transport, the modified representative and its scalar equation, common-time Ricci smoothing, isotropic-defect propagation, smooth limit identification, recognition and passage to the class infimum remain geometric steps beyond these declarations. [Isotropic entry module](../../../SmoothPoincare/Variational/IsotropicGapEntry.lean)

## Reviewed generations

The checkout advanced to `4bec4df82e8b949935dd5a43f12f52cd3d018acb` during this review. Here are the SHA-256 prefixes of the inspected working sources.

| Source | SHA-256 prefix |
| --- | --- |
| `IsotropicGapEntry.lean` | `dc805ad5765157cb` |
| `EndpointSpectralDeficit.lean` | `59fb8d21856d8eaa` |
| `EndpointChargeTransfer.lean` | `fce935005ce655af` |
| `isotropic_gap.tex` | `4b797040f9e081cf` |
| `E62_ISOTROPIC_FLOW.md` | `084612e58d5fb420` |
| `endpoint_smoothing.tex` | `7cce530242f8ce70` |

An independent `lake env lean` replay imported the topic module under Lean `4.35.0-rc3` and the pinned manifest. The five declaration type and axiom pairs passed, with axioms drawn from `propext`, `Classical.choice` and `Quot.sound`. Two real-valued tests also passed. A positive finite spectral deficit gives $P>8T$, while the explicit limiting scalar data above have $P=8T$ and $e=3T/2$ after setting $T=1$.
