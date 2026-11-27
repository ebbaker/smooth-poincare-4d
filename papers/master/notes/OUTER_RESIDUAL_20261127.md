# Continuum residual on the outer part of the native pants

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance, bounded master B02. Actual serving model and reasoning effort were unavailable. Intake HEAD 48f36794f9b1. The [frozen degree-18 comparator](../numerics/whole_pants_residual_d18.json) at SHA-256 prefix 40830dc65163 and the [true harmonic-field enclosure](HARMONIC_MEASURE_CERTIFICATE_20261127.md) use the whole real parameter box of radii \(2\cdot10^{-5},5\cdot10^{-5}\) about the stored pair. This is the literal planar pants of the smooth oriented long-cuff trial. [Comparison and required flux margin](SCALAR_FIT_RESIDUAL_20261127.md)

Use \(H=e^{v_p}\), \(A=H+|\Phi_p|^2/H\), \(R=\Delta v_p-2(H-|\Phi_p|^2/H)\), and \(b=2\cdot10^{-9}\), the validated tolerance for the physical cuff flux. All 64 closed tiles in the first quadrant certify
\[
 |R|<9.721\cdot10^{-6},\qquad A>0.0202995,\qquad
 \frac{|R|+(2/3)b}{2A}<8.914\cdot10^{-5}<\frac1{8000}
 \qquad (2\le |z|\le4).
\]
The ratio uses the paired bounds on each tile. The largest tile ratio occurs on \(r\in[2,9/4]\), \(t\in[3/8,1/2]\) in the coordinates below. Both coordinate reflections preserve these quantities and give the same bound on the full annulus. [Cuff-flux certificate](HOPF_CUFF_FIT_20261127.md#exact-boundary-flux-of-the-smooth-comparator)

## Continuation through the stereographic chart

Use \(z=r(1+it)/(1-it)\) and \(w=r(1-it)/(1+it)\) on \(t\in[0,1]\), which parametrizes the first quadrant. Continue \(r,t\) separately to the Bernstein ellipse of parameter three on each tile. The broad run uses radial interval width \(1/4\) and stereographic width \(1/8\). For radial midpoint \(r_0\) the complex displacement is \(|r-r_0|\le5/24\), and \(|\operatorname{Im}t|\le1/12\). Both angular factors have modulus in \([11/13,13/11]\). Even after increasing the \(z,w\) domains by a disk of radius \(d=1/64\) in each variable, the resulting complex coordinates satisfy \(8/5<|z|,|w|<5\). The code checks these inequalities by rational arithmetic.

Write \(C(z,w)\) for the finite mode correction in \(v_p\), with independent holomorphic variables \(z,w\). In the outer chart \(y_0(z)=z/4\), the Chebyshev argument has \(q_0=y_0(z)y_0(w)=r^2/16\) prior to the \(d\)-inflation. If \(z_{\max}\) is the checked inflated upper bound, \(q_0\) stays within
\[
 \frac{2r_0(5/24)+(5/24)^2+2z_{\max}d+d^2}{16}
\]
of \(r_0^2/16\). In a hole chart, the analogous \(q_\pm=y_\pm(z)y_\pm(w)\) stays within \((4(z_{\min}-1))^{-2}\) of zero, where \(z_{\min}\) is the checked lower bound. Each radial row is the polynomial \(\sum_{j=0}^{18}c_jT_j(2q-1)\). The program expands this whole row in powers of the displacement from the stated center with exact dyadic coefficients, then applies the triangle inequality. Keeping the cancellations inside a radial row makes its continuation bound small. Multiply by the bounds for the angular factors, sum over all modes, and include both affine parameter responses at their real box radii. This proves \(|C|<6.916\) on the inflated two-variable domains of all radial tiles. [Exact radial coefficient replay](../numerics/outer_residual_certificate.py)

Cauchy's estimate therefore gives \(|4C_{zw}|\le4\cdot64^2|C|_{\rm bound}\) on the original product of ellipses. The native field error for each harmonic parity extends across the outer circle by odd inversion, since that error has exactly zero outer trace. It is harmonic throughout \(13/10<|z|<160/13\) with the same supremum \(<2\cdot10^{-15}\). A disk of radius \(1/4\) about each enlarged complex-coordinate position stays inside that annulus, so the derivative error is below \(1.6\cdot10^{-14}\). The one-pole approximation satisfies
\[
 |p^{\rm app}(z)|\le \frac53+\frac1{11}+
       \frac13\left(\frac{25}{36}+\frac4{121}\right)<2.01 .
\]
The first terms bound its logarithmic derivatives. The last uses the exact coefficient sum \(<1/3\) and the bound \(k|\zeta|^{k-1}\le1\) for both multipole arguments, each of which has modulus below \(1/2\). The parity sum of the two poles gives \(|P_\pm|<5\) including the continuation error. Since \(|p_1|+|p_2|<.13\), this yields \(|\Phi_p|<13/4\). The real-grid error uses the stronger radius-\(1/2\) disk bound, valid around every real sample with \(2\le|z|\le4\). [Multipole coefficient and scalar comparison data](HARMONIC_MEASURE_CERTIFICATE_20261127.md)

The factor \((1-z^2)(1-w^2)\) in
\[
 H=\frac{\exp(zw/64+C)}{\big((1-z^2)(1-w^2)\big)^{3/4}},
 \qquad \Delta v_p=1/16+4C_{zw}
\]
has no zeros on the product of parameter ellipses. Use the \(H\) branch positive on real samples. Analytically continue \(|\Phi_p|^2\) as \(\Phi_p(z)\Phi_p(w)\), using the real symmetry of the Hopf basis. For \(|C|\) bounded respectively by \(1,2,7\), upper bounds for the exponential of \(25/64+|C|\) are \(5,12,3000\). The script checks these by a rational Taylor sum with a geometric tail. In each case \(|H|\) is bounded by the same upper bound, and \(|1/H|\) by that bound times \(156>26^{3/2}\). Combining these with the Cauchy derivative and Hopf bounds gives respective uniform complex supremum bounds \(40{,}000,\ 100{,}000,\ 12{,}000{,}000\) for both \(R\) and \(A=(H+\Phi_p(z)\Phi_p(w)/H)\).

## From the samples to the closed annulus

At the real Lobatto nodes the [central residual interval routines](../numerics/interior_residual_certificate.py) enclose the true-field \(R,A\) uniformly in the two parameters. Grid coordinates use only the rational stereographic formulas and bracketed square roots for Lobatto nodes. To pass from these samples to the tile, truncate the double Chebyshev series at degree \(n=27,28,33\) in each variable according to the corresponding complex bound \(M\). The error is bounded by \(\epsilon=8M3^{-n-1}/(1-1/3)^2\), by the Laurent coefficient bound on the product ellipses. With \(N+1\) Lobatto nodes the norming factor is bounded above by \(K=(1-(22n/(14N))^2/2)^{-2}\). Apply it to the sample upper bound for \(|R|\) and to the deviation of \(A\) from the midpoint of its enclosed sampled range. Subtracting that midpoint changes only the constant Chebyshev coefficient. The two tensor polynomial norms are bounded by \(K\) times their respective sample bound enlarged by \(\epsilon\), and restoring the tail at the end gives the continuum residual and positive reaction lower bound used in the ratio. Each tile begins with \(N=64\), with a bounded retry at \(N=128\) if necessary. [Norming derivation](CENTRAL_RESIDUAL_CERTIFICATE_20261127.md#complex-bounds-for-the-interpolation-error)

The [replay](../numerics/outer_residual_certificate.py) runs with Python and NumPy. Its default run covers the full outer part, and its outer-only option uses the finer tiling on \(15/4\le |z|\le4\). The length root additionally uses the other parts of the pants and the independent face and flux checks.
