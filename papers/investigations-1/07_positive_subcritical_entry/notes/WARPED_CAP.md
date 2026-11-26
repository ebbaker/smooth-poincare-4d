# Weyl cost of the warped round-fiber cap

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Exact serving model and reasoning effort were unavailable. This is the fixed analytical calculation assigned under B02, at intake `1c81a3048c8c`. It uses the [fixed request](../research-progress/handoffs/FIRST_ASSEMBLY_ISSUE_20261126.md) (`aa97267bec13`), the master's [product circle cap calculation](../../../master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex) (`6a5d73af897a`, §“The cost of a product circle cap”) and [entry budget](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) (`066e60479548`). The computation uses the real two-form operator Hilbert–Schmidt norm and is intrinsic to the specified cap.

## Metric class and signed end data

Let \(D\) be a smooth compact disk, \(h\) any smooth Riemannian metric on it and \(f\) a smooth strictly positive function on \(D\). Fix the marking of the round fibers, with \(\sigma\) the round metric of curvature \(+1\) on \(S^2\). The cap, including all its transitions, has metric

\[
g=\Omega^2(h+f^2\sigma)=(\Omega f)^2(q+\sigma),\qquad q=f^{-2}h,
\]

where \(\Omega\) is any smooth strictly positive function on \(D\times S^2\), possibly varying on a fiber. The orientation is the product orientation or its reverse. This includes every metric invariant under the fixed product \(SO(3)\) action on the fibers. The stabilizer of a fiber point acts by rotations on the fiber tangent plane and trivially on the base plane, so the mixed metric block vanishes and the fiber metric is a multiple of \(\sigma\). Transitivity on each fiber makes the base metric and the fiber scale depend only on the base. The collar and the closing use the same marked round fibers. Smooth positivity of the factors gives a smooth metric with a round fiber over every point of the disk in the warped representative.

Use the master's boundary germ in this marking, normalized to the unit sphere gauge. Its base is the radius-\(\rho\) circle of \(\mathbb H^2(-1)\), with \(\rho>0\). The collar coordinate \(s\) increases into the cap and satisfies

\[
q=ds^2+\sinh^2(\rho+s)\,d\theta^2,\qquad \theta\in\mathbb R/2\pi\mathbb Z,
\]

to first order at \(s=0\). The retained side points toward decreasing hyperbolic radius. The sign in disk Gauss–Bonnet is \(k_q=\langle\nabla_T T,\nu_{\mathrm{in}}\rangle_q\) for a unit boundary tangent \(T\) and the inward disk normal \(\nu_{\mathrm{in}}\). For \(ds^2+a(s)^2d\theta^2\), \(\nabla_TT=-(a'/a)\partial_s\). Thus

\[
L_q=2\pi\sinh\rho,\qquad k_q=-\coth\rho,\qquad
\int_{\partial D} k_q\,d\ell_q=-2\pi\cosh\rho.
\]

These are the data after reducing the round-fiber scale. In the common product marking the vertical metric is \(\lambda\sigma\), where \(\lambda=(\Omega f)^2\) on the cap. The normalization \(g/\lambda\) is smooth across any smooth match to the exterior germ, including a conformal rescaling of the exterior. For a warped metric \(h+f^2\sigma\), the base boundary formulas are \(d\ell_q=f^{-1}d\ell_h\) and \(k_q=f k_h+\nu_{\mathrm{in},h}(f)\) with the same inward convention. A common homothety of the physical hyperbolic and spherical factors preserves the dimensionless data. For spherical radius \(r_0\) with simultaneous hyperbolic curvature \(-r_0^{-2}\), \(\rho\) is physical hyperbolic distance divided by \(r_0\). The estimate applies whenever the normalized signed boundary integral has the displayed value.

## Chiral energy calculation

Write \(A=\operatorname{Area}_q(D)>0\), \(K=K_q\), and \(c=2\pi(1+\cosh\rho)\). Disk Gauss–Bonnet gives \(\int_D K\,dA_q=c\), so that \(\int_D(K+1)\,dA_q=A+c\).

For \(q+\sigma\), use a product orthonormal frame with indices \(1,2\) on the disk and \(3,4\) on the sphere. The curvature operator is diagonal on the simple coordinate two-forms with sectional entries \(K,1,0,0,0,0\), and the scalar curvature is \(2(K+1)\). The Schouten eigenvalues are \((2K-1)/6\) on the base and \((2-K)/6\) on the fiber. Subtracting the Schouten contribution gives Weyl eigenvalues \((K+1)/3\) on the two factor planes and \(-(K+1)/6\) on the four mixed planes. The Hodge star pairs the two factor planes and pairs the mixed planes among themselves. Each real chiral block therefore has eigenvalues \((K+1)(1/3,-1/6,-1/6)\), with squared norm \((K+1)^2/6\).

Under a smooth positive conformal rescaling in four dimensions the Hodge star on two-forms is invariant, the Weyl endomorphism scales with weight \(-2\) and the volume with weight \(4\). The two Weyl energy densities are separately invariant, pointwise as volume densities, for every \(\Omega f\). Integrating the unit sphere area \(4\pi\) yields

\[
E_\pm(g;D\times S^2)=\frac{2\pi}{3}\int_D(K+1)^2\,dA_q.
\]

Separating the mean and optimizing in the area gives the exact identity and lower bounds

\[
\begin{aligned}
E_\pm(g;D\times S^2)
&=\frac{2\pi}{3}\left(4c+\frac{(A-c)^2}{A}
+\int_D\left(K-\frac cA\right)^2\,dA_q\right)\\
&\ge \frac{2\pi}{3}\frac{(A+c)^2}{A}
 \ge \frac{16\pi^2}{3}(1+\cosh\rho)
 > \frac{32\pi^2}{3}.
\end{aligned}
\]

In the two signs together this gives \(\frac{32\pi^2}{3}(1+\cosh\rho)>\frac{64\pi^2}{3}\). Saturating the area-independent bound requires \(A=c\) and \(K\equiv 1\). A smooth match to the exact hyperbolic collar in the normalized gauge has \(K=-1\) on the seam, so the fixed-radius bound is also strict for that smooth match. If an exact hyperbolic continuation occupies positive normalized area \(A_0\) *inside* the counted disk, its Weyl integrand vanishes there. Cauchy–Schwarz on the complement improves the squared-curvature bound to \((A+c)^2/(A-A_0)\ge 4(c+A_0)\).

The negative sign of the boundary curvature is essential. Taking the inward cap direction toward decreasing hyperbolic radius changes the boundary integral to \(+2\pi\cosh\rho\). The hyperbolic disk itself then closes smoothly and has \(K=-1\) and zero chiral energy. For the prescribed negative sign, the normalized cap has integrated scalar curvature \(8\pi(A+c)>0\). This integral is gauge dependent and gives no sign test for the assembled closed conformal Laplacian.

Every transition included in the same disk and warped/conformal metric class contributes to the displayed integral with only the outer signed boundary term in Gauss–Bonnet. A single cap with these data already exceeds the closed entry ceiling \(8\pi^2\) separately in each chirality. This obstruction covers warped round fibers and their smooth conformal multiples with the prescribed marking. A change of the normalized boundary data, a different orbit structure or a non-product horizontal geometry requires its own calculation.
