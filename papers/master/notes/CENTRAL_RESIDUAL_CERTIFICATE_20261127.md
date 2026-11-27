# A continuum residual bound on the central pause footprint

27 November 2026, prepared for Edward B. Baker III with OpenAI assistance. Bounded master B02 calculation at checkout `48f36794f9b1`. Scientific lead selected GPT-6.2 Astra/ultra. Independent serving telemetry unavailable. Inputs are the [degree-18 dyadics](../numerics/whole_pants_residual_d18.json) `52799ce89460`, [exact harmonic-measure calculation](../numerics/native_harmonic_measures.py) `2f2a755b2751`, and [whole-cuff flux certificate](../numerics/cuff_flux_certificate.py) `cd188e52dfbb`. The statement uses the smooth real planar trial field, the true native holomorphic basis, and the parameter normalization of the [scalar comparison](SCALAR_FIT_RESIDUAL_20261127.md).

For all real \(|x|,|y|\le9/128\), the complete real parameter box \(|p_1-p_1^*|\le2\cdot10^{-5}\), \(|p_2-p_2^*|\le5\cdot10^{-5}\), and its affine response field \(v=v_p\), write
\[
 H=e^v,\quad L_0=|\Phi_p|^2/H,\quad R=\Delta_{x,y}v-2(H-L_0).
\]
Throughout this square, \(|R|<0.000142596\), \(H>0.76118\), and
\[
 \frac{|R|+(2/3)(2\cdot10^{-9})}{2(H+L_0)}<0.000093669<\frac{1}{8000}.
\]
The square contains every entire projected pause disk of both fixed bands, whose largest radius is \((1+1/8)/16=9/128\). The cuff term is the upper flux tolerance separately established for this box. The estimated scalar field is a smooth comparison to the native solution. The rest of the pants must satisfy the relevant global comparison before this residual can bound the solution on the footprints. [Executable certificate](../numerics/interior_residual_certificate.py)

## Complex bounds for the interpolation error

Extend \(z=x+iy,w=x-iy\) independently. With \(C\) denoting the explicit Chebyshev and mode correction of the frozen field, the holomorphic continuations are
\[
 H=\frac{\exp(zw/64+C)}{(1-z^2)^{3/4}(1-w^2)^{3/4}},\qquad
 \Delta v=1/16+4\partial_z\partial_w C,\qquad
 |\Phi_p|^2\longmapsto\Phi_p(z)\Phi_p(w).
\]
The fractional powers are the branches equal to one at the center. Reality of the holomorphic coefficients gives the last identity on real \(x,y\). The exponential's planar base is \(|z|^2/64-(3/2)\log|z^2-1|\).

Here is a uniform bound on \(|C|\) for \(|z|,|w|\le1/3\). In each chart let \(q=y(z)y(w)\) for the holomorphic chart map \(y\); each radial polynomial is \(T_j(2q-1)\). The ellipse parameter for \(2q-1\) has semimajor axis \(\lambda=|q|+|1-q|\), so \(|T_j(2q-1)|\le(\lambda+\sqrt{\lambda^2-1})^j\) by the Joukowsky formula. In the outer chart \(|y|\le1/12\), \(|q|\le1/144\); the ellipse parameter is less than \(6/5\). In either hole chart \(|y|\le3/8\) and \(|q-1/16|\le((1-1/3)^{-2}-1)/16=5/64\) by the absolutely convergent geometric series, so the ellipse parameter is less than \(7/4\). The complexified real mode is the half-sum of the two chart powers. Inserting these bounds, the absolute dyadic center coefficients and the absolute affine responses times their parameter radii in the full finite series gives \(|C|<4.066<5\) by rational arithmetic.

On \(|z|,|w|\le1/4\), two Cauchy derivatives give \(|4C_{zw}|\le4(5)(12)^2\). Both \(|H|\) and \(|1/H|\) are below 200 by the preceding expression. The native gradients satisfy \(|P_\pm|<4\) on the disk of radius \(1/4\). Indeed each one-pole logarithmic derivative has norm at most \(1/(16-1/4)+1/(1-1/4)\). The direct and reflected regular multipoles add at most \([1/(4(3/4)^2)+4/(16-1/4)^2]/3\) for one pole. This uses \(k(1/3)^{k-1}\le1\) and the previously certified coefficient sum \(\sum|b_k|<1/3\). Add the two poles and the genuine harmonic-gradient correction: the error in each bounded real harmonic potential is below \(2\cdot10^{-15}\); the first Fourier coefficient on disks of radii increasing to \(1/2\) centered here gives gradient error at most four times this bound. Hence \(|\Phi_p|<3\) using \(|p_1|+|p_2|<.13\). These estimates give the convenient complex supremum \(M=10000\) for both \(R\) and \(H-.77\). [True harmonic fields and their gradient errors](HARMONIC_MEASURE_CERTIFICATE_20261127.md)

Put \(a=9/128\). For the Bernstein ellipse of parameter three on each real interval \([-a,a]\), \(|x|,|y|\le a(3+1/3)/2\), hence \(|z|,|w|\le15/64<1/4\). The tensor Chebyshev coefficients are bounded by \(4M3^{-i-j}\), by two Laurent coefficient contours after the Joukowsky substitution. Truncation at degree 24 in each variable has uniform error at most
\[
 \epsilon=8M\,3^{-25}/(1-1/3)^2<2.125\cdot10^{-7}.
\]
For a real polynomial in \(x=a\cos\theta\) of degree at most 24, the trigonometric polynomial in \(\theta\) has second derivative bounded by \(24^2\) times its supremum, by two applications of Bernstein's inequality. At a point maximizing its absolute value the first derivative vanishes, including endpoints by even periodic extension. The nearest grid angle \(j\pi/128\) lies within \(\pi/256\). Applying Taylor's inequality and then applying that argument in each coordinate bounds the tensor polynomial by its maximum grid value times \(K=(1-(24\pi/256)^2/2)^{-2}<1.093\). Thus a certified residual sample supremum \(S\) gives a continuum bound \(K(S+\epsilon)+\epsilon\); likewise for \(H-.77\). [Bernstein's inequality for trigonometric polynomials and its proof](https://publicatio.bibl.u-szeged.hu/22893/1/SATarXivupdate.pdf)

## Grid and parameter enclosures

Reflection in both axes reduces the full grid to \(65^2\) samples. Repeated square roots construct the Lobatto abscissas from exact endpoints. The script uses outward-expanded binary64 intervals for the real and imaginary coordinates, finite sums and elementary operations. The square-root brackets are checked by directed squaring; exponentials use a bounded Taylor remainder after rescaling. Only dyadic input coefficients or enclosing intervals converted from exact rational numbers enter the calculation.

At each node the program evaluates \(R_0\) and its two parameter derivatives at the center. For a parameter direction let \(w=\delta v\) and \(\psi=\delta\Phi\). Then
\[
 \delta R=\Delta w-2(H+L_0)w+4\operatorname{Re}(\bar\Phi\psi)/H .
\]
Along the segment to any box point the Taylor remainder is bounded by the supremum of
\[
 (H+|\Phi|^2/H)|w|^2+(2|\psi|^2+4|\Phi||\psi||w|)/H .
\]
This includes the factor of two in the reaction and the one-half in Taylor's theorem. Along the segment \(H^{\pm1}\) are bounded by the center values times \(\exp|w|\); \(|\Phi|\le|\Phi_{p^*}|+|\psi|\). The actual harmonic fields are enclosed before forming these derivatives. The resulting uniform grid bounds are \(|R|<0.000130078\) and \(|H-.77|<0.008071\). The displayed continuum bounds above use the full outward-rounded values, including the interpolation tails. The proof is confined to the stated square and whole parameter box.

## All projected points of both complete native bands

The same full parameter box satisfies the weighted bound **below 0.000081243 on both complete physical band footprints**. This includes the moving parts of all fourteen timed letters. The calculation also covers the entire surrounding union of 56 closed squares and its reflected images. The whole-pants Neumann comparison still requires the interior residual away from this union. The central square and parameter extension above received an independent bounded reading.

Under the real coordinate reflections it suffices to cover the first-quadrant part of the annulus \(119/128\le|z-1|\le137/128\). Indeed all original projected points are within \(9/128\) of a unit circle about either hole. After reflection to \(x,y\ge0\), a point belonging only to the left annulus would have \(|z+1|\le137/128\), which forces \(x\le9/128\). Thus \(|z-1|\ge1-x\ge119/128\) and \(|z-1|\le|z+1|\le137/128\). Enumerate the squares of side \(1/8\) which meet the right annulus, using exact squared minimum and maximum distances to its center. Their centers \(c\) obey \(|c|\le2.16\) and \(|c\pm1|\ge.84\). Every sample center is at least \(.84-\sqrt2/16>.75\) from the two hole centers, so the radius-\(1/2\) disk harmonic-gradient error still applies.

For independent complex variables within \(1/4\) of \((c,\bar c)\), the outer chart has \(|y|<.61\), \(|y-y(c)|\le1/16\); its \(q=y(z)y(w)\) differs from \(|y(c)|^2\) by at most \(2(.54)/16+1/256\). Each hole chart has \(|y|<.43\), \(|y(c)|\le1/(4(.84))\) and \(|y-y(c)|\le1/(16(.84)(.59))\). Use \(|q-|y(c)|^2|\le 2|y(c)|\,|\delta y|+|\delta y|^2\), then \(\lambda\le1+2|q-|y(c)|^2|\). The two Bernstein parameters for the radial polynomials are below \(1.72,1.83\), respectively. The rational full-box coefficient sum in these weights is below 16.

On the two coordinate Bernstein ellipses of parameter 3 the displacement from either complex center is at most \((3+1/3)/16=5/24\). Hence the Cauchy bound for \(|4C_{zw}|\) is at most \(4(16)(24)^2\). The two distances to hole poles exceed \(.63\) and \(|z|,|w|<2.37\). In the previous bound for one-pole gradients replace \(16-1/4\) by \(16-2.37\) and \(3/4\) by \(.63\). The multipole arguments still have absolute value below \(.4\), with \(k(.4)^{k-1}\le1\). A disk of radius \(1/4\) suffices to add the true harmonic correction here. The sum over both poles gives \(|P_\pm|<4\) and \(|\Phi_p|<3\). Analytic branches of the two fractional powers in each disk agree with the real field on the diagonal. Both \(|H|,|1/H|\) are below \(2\cdot10^8\), by \(|1-z^2|\in(.63^2,1+2.37^2)\), its counterpart in \(w\), and \(|C|<16\). Consequently \(M=10^{10}\) bounds the complexified scalar defect and also \(H+L_0\) minus the midpoint of its enclosed real grid range. Each such midpoint in the run is smaller than 100, directly checked from the node intervals.

On each tile use the full degree-36 tensor truncation, Bernstein parameter three and \(129^2\) nodes. Apply the same quadratic Bernstein norming and tail estimate to \(R\) and to \(H+L_0\) minus the midpoint, thereby obtaining a lower bound on the reaction throughout the tile. The largest resulting ratio was on tile zero, the square \([0,1/8]^2\), with upper bound \(0.00008124265\). All 56 individual bounds were strictly below \(1/8000\). Run the certificate with `--all-footprints` for the full enumeration, or `--footprint-tile 0` for its largest value. This calculation certifies the smooth comparison's local PDE defect over the projected physical bands. To bound the true field there by the Neumann comparison still requires the missing global input or quantitative boundary values for a suitable smaller-domain comparison.

## The remaining central interior and a larger rectangular check

The same analytic bounds used for the physical footprints apply throughout
\[
 x,y\ge0,\qquad |z|\le2,\qquad |z-1|\ge119/128 .
\]
Take side-\(1/8\) grid squares in \([0,2]^2\) whose least squared distance to zero is at most 4 and whose greatest squared distance to 1 is at least \((119/128)^2\). Both tests are rational on the grid. The resulting 140 squares include 52 of the earlier footprint squares. All 140 centers satisfy the same two geometric inequalities \(|c|\le2.16\), \(|c\pm1|\ge.84\), so the preceding complex extension and harmonic-measure error proof applies without change. The computation first tries 65 nodes in each coordinate and doubles the angular resolution where needed. The square boundaries are included. A separate replay of all 140 tiles returned a maximum of 0.000122376376 (tile 44, rounded upward), strictly below 1/8000. The command is `--all-core`.

A separate calculation verifies the complete rectangle \([0,2]\times[1,2]\) in the same quotient quarter, including points of modulus greater than two. It uses 32 squares of side \(1/4\), 129 Lobatto samples per axis and residual tolerance \(0.00019\). The radius for bounding the holomorphic chart sum is \(23/48\) around the two complex centers. The two Bernstein ellipses of parameter 3 require a displacement of at most \(5/12\), leaving \(1/16\) for the two Cauchy derivatives. At \(q_0=|y(c)|^2\in(0,1)\) and \(|q-q_0|\le\delta\), the additional bound
\[
 |q|+|1-q|\le 1+\delta^2/[2q_0(1-q_0)]
\]
follows from the concave tangent-line inequality for the square root in each modulus; the two linear terms in \(\operatorname{Re}(q-q_0)\) cancel. The script takes the smaller of this bound and \(1+2\delta\) when evaluating the Chebyshev ellipse. The exact finite coefficient sum is below 12 on every tile (largest outward bound below 11.500). On the smaller complex ellipses the distances to the poles exceed \(.70\), and \(|z|,|w|<3.08\). The one-pole logarithm and regular multipole estimates again give \(|P_\pm|<4\); the radius-\(1/4\) disk for the small true-field correction stays inside the pants. Using \(4(12)(16)^2\) for the Laplacian bound and the analytic formulas for \(H,H^{-1}\) leaves both required complex suprema below \(10^{10}\). The command `--all-intermediate` checks these 32 tiles. This rectangular calculation supplies coverage beyond the central disk and overlaps part of the outer-annulus treatment.

## Conditional error on the native first derivatives

If the complete pants comparison gives the actual cuff parameter in the box and \(S=\|u-v_p\|_\infty\le0.000193\) at global residual tolerance \(\eta=0.00019\), it also gives an explicit local first-jet error on the band footprints. On the full disk of radius \(1/8\) about such a point the harmonic energy of the actual mapping satisfies \(E\le2(2.54)^2/(87/128-1/8)^2<42\). This follows from the squared target-distance bound on every smaller centered disk. With \(F_p(t)=2(e^t-|\Phi_p|^2 e^{-t})\) and \(w=u-v_p\), the trial reaction bound and mean value formula give
\[
 |\Delta w|\le 42\big(\eta e^S+Se^{2S}\big).
\]
The disk Poisson and Green gradient kernels then give
\[
 |\nabla w|\le \frac{32S}{\pi}+
      \frac{42}{12}\big(\eta e^S+Se^{2S}\big)<0.00332
\]
in Euclidean planar norm at each footprint point. This bound relies on the actual long-cuff marking after the cuff parameters are located.

For the same true \(\Phi_p\) the pullback tensor difference is exactly a scalar multiple of the flat metric: its traceless parts agree. Put \(D=H+L_0\) with \(H,L_0\) now referring to the **exact** solution, and \(\widetilde D=e^{v_p}+|\Phi_p|^2e^{-v_p}\). At a footprint point \(D<14\), \(|\Phi_p|/H<1\), \(|\nabla u|<39\), and \(|\Phi_p'|<70\) by the [harmonic data bounds](NATIVE_HARMONIC_DATA_20261127.md). Consequently
\[
 |D-\widetilde D|<0.00271,\qquad
 |\nabla(D-\widetilde D)|\le 14e^S(0.00332)
                +(e^S-1)(14\cdot39+140\sqrt{2})<0.191 .
\]
For the last inequality use \(\nabla D=(H-L_0)\nabla u+2e^{-u}\operatorname{Re}(\bar\Phi_p\nabla\Phi_p)\) and its counterpart at \(v_p\). A validated evaluation across the parameter box still needs to carry the variation of \(\Phi_p\), of its derivative and of \(v_p\) with \(p\).
