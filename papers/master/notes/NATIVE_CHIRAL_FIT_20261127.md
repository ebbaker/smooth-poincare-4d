# Floating-point chiral costs of the unchanged native band

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance, bounded master B02. Actual serving model and reasoning effort were unavailable. Intake HEAD 48f36794f9b1. This is a numerical diagnostic on the smooth oriented Riemannian minus Miller–Schupp trial with \(L=2\operatorname{arcosh}5\), radius one and switching width \(1/16\). Inputs are the [fitted native metric](HOPF_CUFF_FIT_20261127.md), [first-jet curvature identity](FIRST_JETS_FOR_BOTH_BAND_COSTS_20261127.md) and [scalar band evaluator](../numerics/native_rayleigh_fit.py), with respective code or note SHA-256 prefixes 4a4081fe8954, c2323af6d057 and 38d6fc7b3551 at integration. The input fit files for the two rows had SHA-256 prefixes bd649505e688 and 8f40f95d517c. Python 3.10.0 and NumPy 1.25.1.

All fourteen longitude halves contribute, with both signed integrals evaluated separately. The computation integrates the changing interval \(1/16<s<1/8\), then includes the exact zero energy of the pure inner region \(0\le s\le1/16\). The longitude rule is Gauss–Legendre on every full letter of the marked word, the sphere rule is Gauss–Legendre in polar height and midpoint in azimuth, and the radial rule is composite three-point Gauss–Legendre. The physical measure in these rules is \(\delta^3(1+s)^2\sqrt{\det g}\,ds\,d\theta\,dA_{S^2}\), with \(\delta=1/16\). The signed labels use the orientation of \((x,y,\phi,\theta)\).

| Fit mesh | Radial cells | Nodes per letter | Sphere orders | \(E_+\) | \(E_-\) | Full-operator mean divided by \(\pi^2\) | \(E_+-E_-\) |
| --- | ---: | ---: | --- | ---: | ---: | ---: | ---: |
| \(64\times56\) | 24 | 12 | \(6\times12\) | \(8.918184605\times10^{11}\) | \(8.918184602\times10^{11}\) | \(9.036010199\times10^{10}\) | \(302.1814\) |
| \(128\times112\) | 48 | 20 | \(8\times16\) | \(8.769927263\times10^{11}\) | \(8.769927264\times10^{11}\) | \(8.885794108\times10^{10}\) | \(-22.1395\) |

The signed differences use the full precision of the separate integrals before the displayed rounding. Relative to the per-band mean they have magnitudes \(3.4\times10^{-10}\) and \(2.5\times10^{-11}\). The two means differ by \(1.66\%\) relative to the first row. The two rows change the fit and integration resolution together. The absolute size is a floating-point order-of-magnitude diagnostic, with no continuum root, discrete-gradient or quadrature enclosure. The exact equality of the complete signed costs and the rigorous lower bound \(c>169\pi^2/25\) continue to follow from the marked closings and the native strip estimate. [Exact energy comparison](../research-progress/handoffs/NATIVE_COST_AND_TWISTED_DOUBLE_20261127.md)

The [replay](../numerics/native_chiral_fit.py) forms \(R_{ijlk}\) for \(i<j,\ k<l\) using the first jets of the two product ends and the second switch jet. The curvature operator uses the induced action of an oriented orthonormal frame on two-forms. Each diagonal chiral curvature block has the scalar part \(R/12\) removed before its Hilbert–Schmidt square is integrated. The separate mean calculation subtracts the full Schouten product from the \(6\times6\) operator and integrates one half of the squared Hilbert–Schmidt norm. Its agreement with the mean of the separate signed densities was checked on eight radial slices.

The exact half-plane calibration and both fits reproduced sectional-operator eigenvalues \((-1,0,0,0,0,1)\), Ricci equal to the spherical block minus the hyperbolic block and vanishing Weyl at the pure ends. The scalar contraction \(2\operatorname{tr}\mathcal R\) agrees with the scalar-only first-jet implementation on the check slices, with largest absolute differences \(2.29\times10^{-5}\) and \(2.94\times10^{-5}\) in the respective fits. Pulling the two complete first jets and radial Hessian into the framed Cartesian tube chart and recomputing the densities gives pointwise discrepancies \(|d_{\rm exterior}-d_{\rm tube}|/\max(1,d_{\rm tube})\) less than \(7.3\times10^{-10}\) and \(7.6\times10^{-10}\), respectively, on these samples. These checks test the sign and normalization despite the size of the diagnostic.

Generate the two fit files with the [fit replay](HOPF_CUFF_FIT_20261127.md#replay-and-evaluation), then run from the repository root.

```sh
OPENBLAS_NUM_THREADS=1 python3 papers/master/numerics/native_chiral_fit.py \
    --self-test --fit /tmp/hopf_fit_64.npz
OPENBLAS_NUM_THREADS=1 python3 papers/master/numerics/native_chiral_fit.py \
    --fit /tmp/hopf_fit_128.npz --radial 48 --longitude 20 --polar 8 --azimuth 16
```
