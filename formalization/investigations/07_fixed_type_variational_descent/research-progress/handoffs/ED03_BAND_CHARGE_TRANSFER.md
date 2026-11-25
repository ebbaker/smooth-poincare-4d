# E58 · Finite-index transfer of both physical chiral charges

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 execution. The actual serving model and reasoning effort are unavailable. [Lean module](../../../../SmoothPoincare/Variational/BandChargeTransfer.lean) · [E58 manuscript](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/subcritical_charge.tex) · [Independent E58 check](../../../../../papers/master/01_fixed_type_variational_descent/reviews/E58_BAND_CHARGE.md)

At one source index, let $g$ be the smooth volume-one positive Yamabe metric on the compact oriented Riemannian four-manifold. The physical $W^\pm$ are the two trace-free chiral blocks in its prescribed oriented orthonormal frames. The spectral inputs certify increasing signed eigenvalues of both blocks, integrability, the signature-zero equality of total Hilbert–Schmidt energies $E_+=E_-=e$, and the Euler identity. The `EndpointPhysicalSpectralData` record also includes the strict Chen–Zhu inequality. The finite charge transfer holds without an assumption that $e$ approaches the endpoint $T=4\pi^2$. [Physical spectral inputs](ED03_ENDPOINT_SPECTRAL_DEFICIT.md)

Take $\mu$ to be the probability measure for the modified Yamabe gauge, $L$ its top-eigenvalue function, and $c\le0$ the constant in the modified scalar test $Y\le c+6\int L\,d\mu$, where $Y$ is the ordinary Yamabe constant. Assume $L\in L^2(\mu)$, $\ell^2=\int L^2\,d\mu$ and $\ell\ge0$. For a supplied measurable region $U$, suppose $\mu(U^c)\le d$. `modifiedYamabe_retained_square_ge` applies Hölder on $U^c$ to get $\int_{U^c} L\,d\mu\le\ell\sqrt d$. On $U$ the same inequality and $\mu(U)\le1$ give
$$
\int_U L^2\,d\mu\ \ge\ \left(Y/6-\ell\sqrt d\right)_+^2.
$$
The positive part gives a valid bound even when the test yields no positive lower bound on the remaining first moment.

The transfer premise for `bandPhysical_omitted_charges` equates $\int_U L^2\,d\mu$ to the physical integral of the squared maximum of the two largest signed Weyl eigenvalues, on that **same** $U$. The pointwise nonnegative spectral deficit bounds this transported integral above by $2/3$ of the combined chiral charge on $U$. Since the total physical charge of either opposite block is $e$, this yields both inequalities
$$
 E_\pm(g;U^c)\ \le\ 2e-\tfrac32\left(Y/6-\ell\sqrt d\right)_+^2 .
$$
Here $E_\pm(g;U^c)$ are physical Riemannian volume integrals of the squared Hilbert–Schmidt norms. Nonnegativity of the omitted integral bounds each retained charge above by its own total. No comparison radius or volume enters these integrals.

`bandPhysical_yamabeEuler_sandwich` also takes the same spectral transport on the whole source, expressed as equality to $\ell^2$. It proves $0<Y/6\le\ell$, $\ell^2\le 4e/3$, and $48(2T-e)\le Y^2$. The modified test and the probability moment give the first bounds, the spectral deficit gives the second, and the physical Euler identity with unit-volume constant scalar and nonnegative trace-free Ricci energy gives the last. Combining with the exact omitted-charge bound gives the manuscript's numerical estimate for small fixed $d$. In fact, for $a=Y/6\ge0$ and $b=\ell\sqrt d\ge0$, $a^2-(a-b)_+^2\le2ab$, so the exact bound implies
$$
 E_\pm(g;U^c)\ \le\ 2e-Y^2/24+(Y\ell/2)\sqrt d
 \ \le\ 4(e-T)+(Y\ell/2)\sqrt d .
$$
These last algebraic estimates explain the manuscript tolerance conversion.

The modified probability measure can represent the manuscript's $C^{2,\alpha}$ gauge through the supplied scalar test and spectral transports. The physical code still uses the smooth $g$. The smooth positive-Ricci comparison metric determines the manuscript's disk radii and embeddings. Its measure plays no role in either checked estimate. The formalization consumes the actual omitted-volume bound for the supplied region. Disk selection, the local curvature ceiling on the containing balls, a qualifying collar marking, the replacement budget and positivity, and uniform endpoint recognition are separate geometric results or prerequisites. The earlier endpoint argument has its own stronger hypothesis $e_i\to T$ and a vanishing modified-volume omission. The present result is a finite estimate, with the fixed-type and infimum arguments occurring only in applications. [Endpoint and cap audit](../../../06_physical_scales_and_marked_annuli/reviews/ED03_ENDPOINT_AND_CAP_AUDIT.md)

## Input receipt

HEAD `2fba0882dbf8766c95094ef4d1207190b0c24bc2`. The E58 TeX prefix was `efb34dc87367bbbd`, the independent review `f0efb7bb6f39b922e`, the endpoint charge transfer `fce935005ce655af`, and the physical spectral input `59fb8d21856d8eaa`. Lean `4.35.0-rc3` uses Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.


`lake build SmoothPoincare.Variational.BandChargeTransfer` passed (9,779 Lake jobs). A fresh import replay checked all three public signatures and `#print axioms` reported only `propext`, `Classical.choice`, and `Quot.sound`. The checked module SHA-256 prefix is `12256ebb51ac2669`.
