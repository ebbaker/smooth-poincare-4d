# From the native cuff lengths to the metric and its first derivatives

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. Master B02, bounded E. Selected Astra/ultra scientific lead and Sol/ultra calculations and independent readings. Actual serving telemetry unavailable. Checkout `48f36794f9b1`. The metric is the smooth oriented Miller–Schupp trial with \(L=2\operatorname{arcosh}5\), normal displacement scale \(1/16\) in the planar marking and switch width \(1/16\). The [native scalar reconstruction](NATIVE_HARMONIC_DATA_20261127.md) fixes the cuff labels, reflections and orientation. The [dyadic comparator](../numerics/whole_pants_residual_d18.json) fixes the parameter normalization and all 608 coefficients and both response columns.

## Certificate on all three cuffs and the entire pants

In the actual quarter-pants \(x,y\ge0\), let \(r=|z|\) and \(d=|z-1|\). Its nearest circular hole is the right one. The closed sets below cover the full quarter, including the circular boundaries. Reflections in the two axes recover the original pants. The residual includes the absolute physical flux allowance divided by the reaction, as specified in the [comparison proof](SCALAR_FIT_RESIDUAL_20261127.md).

| Region | Interval calculation |
| --- | --- |
| \(2\le r\le4\) | All 64 [outer polar tiles](OUTER_RESIDUAL_20261127.md) give weighted residual below \(0.00008914\). |
| \(r\le2,\ d\ge119/128\) | All 140 [Cartesian tiles](CENTRAL_RESIDUAL_CERTIFICATE_20261127.md) give weighted residual below \(0.000122377\). |
| \(1/4\le d\le119/128\) | The [hole-centered replay](../numerics/hole_residual_certificate.py) uses four successive radial strips, 256 closed patches and both signs of the angular cosine. |

Together all 460 patches give \(\eta<1/8000\) on the whole domain and throughout the two-dimensional parameter box. The largest upper bound is below \(0.000122913\), in a hole annulus. The scalar comparison gives \(S<0.000126\), and the true signed edge margins exceed \(8.0391\times10^{-6}\) and \(1.8377\times10^{-5}\). The [independent audit](HOPF_CUFF_FIT_20261127.md) checks coverage, transfer and the physical anchors.

The two cuff-length functions for the **true** harmonic coefficient are evaluated via the scalar comparison. If every patch gives \(\eta\le0.00019\), the [exact flux bound](../numerics/cuff_flux_certificate.py) and maximum principle give \(S=\sup|u_p-v_p|<0.000193\) throughout the parameter box. On the actual cuffs, \(\Phi_p\tau^2\ge0\) for the unit tangent \(\tau\). Each true cuff length differs from its comparator by at most \(4.6(e^{S/2}-1)\). By the [continuous four-edge enclosures](CUFF_LENGTH_CERTIFICATE_20261127.md), subtracting these errors after the stated preconditioner leaves positive face margins exceeding \(1.68\times10^{-6}\) and \(1.57\times10^{-6}\). Opposite faces have opposite signs. The degree theorem gives an interior root. The unique labeled right-angled hexagon with the three specified alternate side lengths, cuff reflections, and uniqueness of the doubled harmonic marking identify the root with the native solution. This isolates its parameters in the box of radii \((2\times10^{-5},5\times10^{-5})\) about the two hexadecimal entries in the dyadic comparator, printed as \((-0.001141493625,-0.119851720819)\).

## Error in the original first jets

For the actual parameter \(p\) use \(\widetilde q_p=(e^{v_p}+|\Phi_p|^2e^{-v_p})I+2\operatorname{Re}(\Phi_p\,dz^2)\). On the radius-\(1/8\) Euclidean disk about a footprint point, the harmonic comparison gives \(2(e^{u_p}+|\Phi_p|^2e^{-u_p})<42\). Using the certified \(S<0.000126\) and \(\eta<1/8000\), the Poisson–Green bound for \(w=u_p-v_p\) at the center gives
\[
 |\nabla w|\le \frac{32S}{\pi}+\frac{42}{12}(\eta e^S+S e^{2S})<0.002163 .
\]
Thus on both **complete** physical footprints \(q_L-\widetilde q_p=\delta D\,I\), where \(|\delta D|<0.001765\) and \(|\nabla\delta D|<0.125\) in the flat marked coordinate. The last bound follows by differentiating \(D=e^u+|\Phi|^2e^{-u}\), using \(D<14,\ |\nabla u|<39,\ |\Phi'|<70\). Evaluation of \(\widetilde q_p\) and its derivative ranges over the entire stated parameter box. The [native multipole proof](HARMONIC_MEASURE_CERTIFICATE_20261127.md) encloses the two harmonic fields in \(\Phi_p\) and their holomorphic derivatives. [Detailed gradient proof](CENTRAL_RESIDUAL_CERTIFICATE_20261127.md#conditional-error-on-the-native-first-derivatives)

The [exact rational anchor replay](../numerics/native_jet_intervals.py) includes parameter uncertainty, harmonic-measure error, scalar-height comparison and the interior derivative bound. It uses a slightly wider \(0.0022\) gradient tolerance. Reflection forces \(q_{xy}=0\) at both native real anchors. The half-turn forces all six first-derivative entries to vanish at zero.

| Native anchor | \(q_{xx}\) | \(q_{yy}\) | \(\partial_xq_{xx}\) | \(\partial_xq_{yy}\) | \(\partial_yq_{xy}\) |
| --- | --- | --- | --- | --- | --- |
| \(z=0\) | [0.13444, 0.13626] | [1.91654, 1.91836] | 0 | 0 | 0 |
| \(z=2\) | [0.07881, 0.07932] | [0.36789, 0.36840] | [−0.11477, −0.11259] | [−0.74544, −0.74326] | [−0.31559, −0.31507] |

The other first derivatives vanish at \(z=2\) by conjugation. An independent reading reproduced the anchor intervals and checked the radial polynomial derivative, the sign of \(\partial_yq_{xy}\), and the disk estimate. The scalar-curvature integration on the four-dimensional band requires an additional enclosure. [Full physical test](NATIVE_RAYLEIGH_TRIAL_20261127.md)

## An explicit upper bound on the complete chiral cost

The [footprint calculation](RADIAL_KINETIC_CERTIFICATE_20261127.md) gives \(v_*>-1.763\), \(|\widehat\Phi|/e^{v_*}<0.623\) and \(m<1.002751\) for the comparator relative to the true metric. Consequently \(q_L\ge e^{-1.763}(1-0.623)^2 I/m>I/50\). For instance the elementary exponential series gives \(e^{9/5}<25/4\), already sufficient.

Use the auxiliary product metric \(g_0=ds^2+d\theta^2+\sigma\) and the native coordinate differential \((dX,h)=(d(z_1,z_2,\phi),d\theta)\). For a tangent vector write \(w=s'p+r\,dp\). The actual tube gives \(w=16(dX-(c_\theta,0)h)\) and \(|U|_0^2\le|w|^2+h^2\). The [global timed letter speed estimate](NATIVE_RAYLEIGH_TRIAL_20261127.md#analytic-enclosure-of-the-first-part-of-the-physical-band) gives \(|c_\theta|<70/3\) at every longitude. Both physical latitude strips have \(\sin\phi>4/5\). It follows that
\[
 |U|_0^2 \le512|dX|^2+(1+512(70/3)^2)h^2
 \le 500000\left(|dX|^2/50+16h^2/25\right)\le500000 B(U,U).
\]
The inner product metric \(A\ge g_0\) since \(\sinh(1+s)>1\); convexity covers the whole blend, including its two pure ends. The [audited full-band component and volume estimate](../../../formalization/investigations/11_intrinsic_entry_from_marked_exteriors/notes/E53_HARMONIC_FOOTPRINT.md) therefore applies with \(\Lambda=500000\). Combining it with the independent strict strip floor gives
\[
 \frac{17689}{2500}\pi^2<c\le 10^{88}(500000)^6=1.5625\times10^{122}.
\]
This bounds the complete common cost in either chirality on each fixed band. The upper bound is coarse. Its proof uses the full physical volume and the verified native ellipticity; no fitted value is used. The comparison and exponent were independently checked.
