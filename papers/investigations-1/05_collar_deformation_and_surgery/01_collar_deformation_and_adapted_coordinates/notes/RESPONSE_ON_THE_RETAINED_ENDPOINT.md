# Boundary response on the actual charge-retaining endpoint

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Selected GPT-6.2 Astra/ultra lead, independent serving telemetry unavailable. DEF-E03j at [issue 2](../../research-progress/handoffs/EXTERIOR_RECOVERY_AND_NATIVE_CAPS_20261126.md). Use the [fixed-index charge-retaining construction](../../notes/RETAINING_THE_TWO_CORE_CHARGES.md), its [reader](../../reviews/CORE_MASSES_READER.md), the master's [round boundary operator](../../../../master/manuscript/marked_cut.tex) and the [scalar form comparison](SCALAR_DEFICIT_AND_CAP_RESPONSE.md). This test measures the positive capped exterior actually produced by the construction. Its retained metric differs from the original positive Yamabe exterior.

Take b=5r/2 for the target coordinate radius of that construction and choose the physical product radius ℓ=b. Write s=ρ/r and choose a fixed positive smooth profile ω(s), equal to one outside (2,3) and equal to (5/2)/s on an open interval about 5/2. The conformal factor before transport is Ω=ω(s); throughout its nonconstant support the uncharged prepared metric is Euclidean. At the supplied face use the original physical Gaussian coordinate t with \(\rho=b e^{t/b}\). Choose \(w>0\) inside both actual original Gaussian buffers and so that \((5/2)e^{t/b}\) is in the exact interval for \(|t|\le w\). Both native subwidths can be chosen equal to w, on which both chiral Weyl costs are exactly zero. Restricting the radial preparation to this germ has no effect on its proof. At all other radii the metric and its actual masses stay as in the finite construction.

Let X denote the complete retained exterior with this endpoint metric, and C its new conformally Euclidean cap. The latter is the coordinate ball of radius b with metric \(\Omega_C^2\delta\), where \(\Omega_C=\omega(\rho/r)\) on that ball. This factor is one near the center; it is \(b/\rho\) near the gluing sphere. The radial face identification and its inverse give a closed metric on the original oriented smooth type. All curvature at the calibrated sites is on the other side of the cut. Each Weyl energy of C vanishes; the rest of the capped energy, entirely off the exact central strip, is
\[
  E_c=E_\sigma(X)=e+\Delta-\beta,\qquad
 E_\sigma(\text{opposite full disk})=K+\beta .
\]
Here K is the larger prescribed core mass, Δ is the uncharged preparation increment and β is its inner-ball energy. The retained exterior therefore costs \(m^\sigma+\Delta-\beta\) against the original exterior. Assume the actual joined peak \(H<2T\). The stretch argument gives positive Yamabe sign for the capped X. Since \(E_c\le H\), Gauss–Bonnet in that cap's Yamabe gauge improves its closed lower bound to \(y_c=\sqrt{48(2T-E_c)}>0\).

The cap operator is \(L_C=-6\Delta_C+R_C\). For a zero-trace function f, conformal covariance gives \(Q_C(f)=6\int_{B_b}|d(\Omega_C f)|^2\). Its physical squared norm is \(\int_{B_b}\Omega_C^2(\Omega_C f)^2\), so that, writing \(U=\sup\omega\),
\[
 \lambda_1^D(C)\ge \frac{6\lambda_1(-\Delta_{B_1}^{D})}{U^2 b^2}>0 .
\]
On a spherical harmonic \(\varphi_j\) of degree j the zero-energy extension is \(\Omega_C^{-1}(\rho/b)^j\varphi_j\), since \(\Omega_C=1\) on the boundary. Its cap-outward derivative at b is \((j+1)\varphi_j/b\); the retained exterior uses the opposite normal. Hence \(N_C=b^{-1}\sqrt{1-\Delta_\gamma}\) in the actual angular marking and physical face measure \(b^3dA_\gamma\). This is the scaled operator of the master's round boundary theorem. On X the zero-trace Dirichlet eigenvalue also satisfies \(\lambda_1^D(X)\ge y_c/\sqrt{\operatorname{Vol}(X)}\) by extension by zero into the positive closed cap. All these are estimates at finite scale.

On the whole X, put \(n_X=\|(R_X)_-\|_2\). This can be bounded without estimating any derivatives of the transport diffeomorphism. Pull X forward by its actual marking onto the complement of the coordinate ball. The unchanged exterior beyond radius 4r has original positive scalar curvature. The nonflat part of the cuff on this side has scalar bounded by a source-dependent constant and volume \(O_i(r^4)\). On the flat conformally rescaled annulus \(R=-6\Omega^{-3}\Delta_\delta\Omega\). Therefore, with a fixed finite radial integral,
\[
 n_X^2\le N_{\rm rad}^2+C_i r^4,\qquad
 N_{\rm rad}^2=72\pi^2\int_{5/2}^{3}s^3
     \left[\frac{(\omega''+3\omega'/s)_+}{\omega}\right]^2 ds .
\]
Indeed the physical volume is \(2\pi^2\Omega^4\rho^3 d\rho\); the radial Laplacian contributes \(r^{-2}\). This includes any negative scalar curvature in the entire retained metric, independently of how thin the original exterior support of the pullback is. For a pair of harmonic extensions of a common trace, \(Q_X(f)\ge-n_X\|f\|_{4,X\cup C}^2\), while the closed form is at least \(y_c\|f\|_4^2\). Green's formula now gives
\[
 6(N_X+N_C)\succeq
 \frac{y_c}{y_c+\sqrt{N_{\rm rad}^2+C_i r^4}}\,
 \frac{6}{b}\sqrt{1-\Delta_\gamma}.
\]
The curvature price of each exact strip is zero, whereas all of \(E_c\) and \(K+\beta\) in the two complete regions lies away from it. The displayed inequalities certify the cap Dirichlet sign and the summed outward response even on high angular modes of the supplied finite repair. They imply \(E_c\ge I\) by positive-class minimization, and give no new strict exterior saving. The radius r, bounds on the original curvature jets and the measured widths at each source can degenerate with the sequence.
