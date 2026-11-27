# E41 · Radial speed on the Fubini–Study conic chamber

27 November 2026, for Edward B. Baker III, with OpenAI assistance. Working baseline bc2c1bb, [frozen input](../research-progress/handoffs/E41_REQUEST_R1.md), [E35 marking](E35_COVER_CAP.md) and [independent Cartan normalization](../reviews/E20_SHORT_AXIS_READBACK.md). Sol 6.2/ultra requested. Actual worker model and effort unavailable. This concerns smooth Riemannian caps on the marked short-axis disk bundle with the Fubini–Study orbit shapes held fixed.

Every such cap reaching the marked umbilic face has
\[
 E_+(W)\ge \frac{112}{27}\pi^2,\qquad
 E_-(W)\ge \frac{247}{27}\pi^2,\qquad
 e_W\ge \frac{359}{54}\pi^2 .
\]
These are downstairs energies in the outward quaternion orientation. The larger sign itself exceeds \(2T=8\pi^2\). The comparison allows any smooth radial speed in the prescribed shape range. Its proof uses no positivity condition. A smooth reflected example below verifies positive Neumann sign for a specific speed and gives both exact energies.

## Exact curvature as a function of the speed

Write \(r\) for radial arclength on the cap and \(y=y(r)\) for the conic distance parameter in the original Fubini–Study metric. Its prescribed range is \(0\le y\le\pi/12\). Define
\[
 z=\sin(2y),\quad C=\sqrt{1-z^2},\quad
 v=y_r,\quad u=v^2,\qquad 0\le z\le 1/2 .
\]
The orbit lengths along the right-invariant axes \(i,j,k\) are
\[
 (a_1,a_2,a_3)=(2z,\sqrt{2(1-z)},\sqrt{2(1+z)}).
\]
The first axis collapses with \(a_1=4r+O(r^3)\) for a smooth bolt with \(v(0)=1\). At \(z=1/2\) the lengths are exactly \((1,1,\sqrt3)\), and the boundary is totally geodesic when \(v=0\). A smooth positive conformal rescaling changes only the pure-trace part of the second fundamental form and leaves the integrals invariant. The installed boundary axis is the first, as in [E35](E35_COVER_CAP.md).

Use \(p_i=(\partial_y a_i)/a_i\), \(k_i=vp_i\) and \(\mu_i=2a_i/(a_j a_k)\). With \(n_i=(\mu_j+\mu_k-\mu_i)/2\), the intrinsic tangential sectional entries are \(K_i=n_i\mu_i-n_jn_k\). With indices cyclic, put \(L_i=(\partial_y^2a_i)/a_i+p_jp_k\). The paired radial and tangential entries in the Cartan formula are then
\[
 F_i=A_i+T_i=K_i-uL_i-v_r p_i,\qquad
 M_i=v(-\mu_i p_i+n_k p_j+n_jp_k).
\]
Their radial and tangential sum gives \(R=2\sum_iF_i\). The signed Weyl eigenvalues are \(\lambda_i^\pm=F_i^\circ/2\pm M_i\), where the circle on a triple subtracts its mean. These formulas use \(d\sigma_i=2\sigma_j\wedge\sigma_k\) and outward-first orientation.

In the given shape family the ingredients simplify to
\[
\begin{aligned}
 p&=(2C/z,\,-C/(1-z),\,C/(1+z)),\\
 n&=(C/z,\,(1+z)/C,\,(z-1)/C),\\
 K&=(3,\,-1+2/z,\,-1-2/z),\\
 L&=(-5,\,-3+2/z,\,-3-2/z),\quad M=v(-2,1,1).
\end{aligned}
\]
For example, at \(v=1\), \(K-L=(8,2,2)\) and \((K-L)^\circ/2=(2,-1,-1)\), so the plus block vanishes, in agreement with the marked conic Fubini–Study orientation. On any positive-speed segment, \(v_r=C u_z\). The plus axial eigenvalue \(V=\lambda_1^+\) and transverse difference \(J=\lambda_2^+-\lambda_3^+\) are therefore
\[
 V=\frac23(v-1)(v-2)-\frac{2-z^2}{3z}u_z,\qquad
 J=\frac{2(1-u)}{z}+u_z .
\]
The orbit volume is \(\pi^2a_1a_2a_3/4=\pi^2zC\), with group order eight. Along the segment \(dr=dz/(2Cv)\). Tracelessness gives \(|W^+|^2=(3V^2+J^2)/2\), so this segment's normalized plus energy is \(\int z(3V^2+J^2)/(4v)\,dz\). The same formulas give
\[
 R=2+22u-\frac{4(1-2z^2)}{z}u_z .
\]
They hold pointwise away from the bolt and by limit when evaluating a smooth radial cap.

## Weighted lower bound with arbitrary speed

Take the first zero of \(v\) and the last preceding point where \(v=1\), using the bolt if it is the only such point. Between them \(0<v\le1\) and \(z\) increases strictly. This also applies if a radial path reverses later, or comes to rest for a whole terminal collar. If the first zero is at \(z=b\), then \(b\le1/2\). On a segment cut short before this zero, multiply the axial identity by \(3zv^{-1/2}/(2-z^2)\). The undifferentiated term has nonnegative sign, leaving
\[
 \int\frac{3zv^{-1/2}}{2-z^2}V\,dz
 \ \ge\ -\int u^{-1/4}u_z\,dz .
\]
The right integral is a primitive. It uses the speed values at the segment ends and requires no monotonicity of \(v\) between them. Its limit approaching the zero is \(4/3\). In weighted Cauchy–Schwarz the dual squared weight is \(12z/(2-z^2)^2\), independent of \(v\). This remains integrable at the stop even if the multiplier itself diverges. Apply the inequality up to each cut and take the endpoint limit to obtain
\[
 \frac{E_+(W)}{\pi^2}\ge
 \frac{(4/3)^2}{\int_0^b 12z/(2-z^2)^2\,dz}
 =\frac{16(2-b^2)}{27b^2}\ge\frac{112}{27}.
\]
If the comparison is truncated at a free positive speed \(v_*\le1\) after the last point of speed one and before the first stop, the same estimate for the truncated portion has the factor \((1-v_*^{3/2})^2\). The proof of the full estimate uses only a smooth stop somewhere in the allowed range, so slowing in an arbitrarily selected smooth terminal portion still incurs the same full lower bound. Changing the orbit shapes in such a portion is outside this test.

At the actual terminal umbilic face the signed APS difference is exactly \(-5\pi^2\) by [E35](E35_COVER_CAP.md). This gives the stated minus and half-sum lower bounds. Every homotopy-sphere closing containing the cap has equal total chiral energies by the closed signature formula, so nonnegativity of the other piece rules out an entering closing retaining the cap.

## Smooth positive example with exact energies

Set \(u=1-4z^2\) before the terminal face. This speed is realized by \(z=(1/2)\sin\theta\), where \(\theta_r=4\sqrt{1-\sin^2\theta/4}\) and \(\theta\) increases from zero to \(\pi/2\). The coefficient is smooth and positive, even about each of the two endpoint values of \(\theta\). Thus \(y\) is smooth odd at the bolt with \(v(0)=1\) and smooth even about the terminal \(r\). The collapsed-axis odd expansion has slope four. The sum of the horizontal squares is constant and their difference is linear in \(z\), an odd function at the bolt. Under the isotropy circle the traceless horizontal tensor and polar slice angle both have weight four, with the same reflection type. Its odd coefficient therefore extends as a smooth equivariant tensor in normal Cartesian coordinates, as in [E19](E19_TRIAXIAL_CERTIFICATE.md). The even outer jets give a smooth reflection. The scalar formula yields \(R=56-152z^2\ge18\), verifying the strictly positive Neumann sign and positive Yamabe sign of the reflected double.

Here \(J=0\), \(v=\cos\theta\) and \(V=(2/3)(2v^2-3v+9)\). The plus energy is elementary:
\[
 \frac{E_+}{\pi^2}=\frac1{12}\int_0^1(2v^2-3v+9)^2\,dv=\frac{167}{30}.
\]
The exact minus energy is \(317\pi^2/30\) and the half sum is \(121\pi^2/15\). This example supplies positive sign with the prescribed boundary and makes no optimality assertion. The analytic cost bound above applies over the full prescribed shape range and leaves arbitrary triaxial shape changes open.
