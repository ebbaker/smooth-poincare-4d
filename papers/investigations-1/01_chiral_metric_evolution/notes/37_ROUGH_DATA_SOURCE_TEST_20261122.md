# SP4-CME-E37 — Koch–Lamm rough-data theorem and coupled-system hypotheses

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. Fixed source audit and conditional operator map. The [frozen request][request] records the input versions. All five hashes were verified. The E36 derivation was outside the frozen inputs.

## Source and version

Herbert Koch and Tobias Lamm, *Parabolic equations with rough data*, *Mathematica Bohemica* **140** (2015), 457–477, DOI `10.21136/MB.2015.144463`. The official record verifies publication metadata. The published PDF timed out through the official link and the corresponding DML university mirror did not provide the file. The statements below were checked in **arXiv:1310.3658v1, 14 October 2013**. Page references below use preprint pagination. [Journal record][journal]. [Preprint][kl].

## Scalar statement, systems extension, and uniqueness

Theorem 1.1 (pp. 2–3) is for the scalar equation (u_t-\partial_i(a^{ij}(t,x,u)\partial_j u)=h(t,x,u,Du)) on \(\mathbb R^d\). The coefficients and forcing are continuous. The coefficient tensor is bounded and uniformly positive on real covectors, with constant controlled by \(\lambda\). Symmetry is optional. Its oscillation at fixed value \(z\) for \(0\le s,t\le T\) and \(|x-y|\le\sqrt T\) must be bounded by a small \(\delta\). Value dependence is uniformly Lipschitz with constant \(L\). The forcing is controlled by

\[
\begin{split}
 |h(t,x,z,0)|&\le \varepsilon/T,\\
 |h(t,x,z,p)-h(t,x,w,q)|
 &\le C\left[|z-w|(\varepsilon/T+L|p|^2)
       +(\varepsilon/\sqrt T+L(|p|+|q|))|p-q|\right].
\end{split}
\]

The hypotheses also give bounds for spatial and value derivatives of \(a\) through order \(k\ge1\), with a weight \(T^{|\alpha|/2}\) on \(|\alpha|\) spatial derivatives. The bounds for \(\partial_x^\alpha\partial_z^j\partial_p^\beta h\), \(|\alpha|+j+|\beta|\le k\), use the weight \(T^{1+|\alpha|/2-|\beta|/2}\) and growth \(1+(\sqrt T|p|)^{(2-|\beta|)_+}\). The smallness threshold for \(\varepsilon\) is chosen after the coefficient constants. If \(|u_0(x)-u_0(y)|\le\varepsilon\) whenever \(|x-y|\le\sqrt T\), the theorem gives a continuous solution with the stated initial data up to \(T\), and

\[
 \sup_{0<t\le T}t^{|\alpha|/2}\|\partial_x^\alpha u(t)\|_\infty
       \le c_\alpha\varepsilon,\qquad 1\le |\alpha|\le k.
\]

We use positive derivative orders. Constant data of arbitrary magnitude for the heat equation already show that local oscillation alone cannot control the absolute zeroth-order norm. [Koch–Lamm, preprint pp. 2–3][scalar].

Section 2 (pp. 4–5) uses boundedness and two gradient seminorms in its fixed-point space \(X\). For \(p>d+2\) and \(0<r^2<T\), these are suprema over centers and radii of

\[
 r\left(r^{-d-2}\int_{r^2/2}^{r^2}\int_{B_r(x)}|Du|^p\right)^{1/p},\qquad
 \left(r^{-d}\int_0^{r^2}\int_{B_r(x)}|Du|^2\right)^{1/2}.
\]

The inhomogeneous estimates for a forcing and a divergence forcing yield the \(X\) bound from the corresponding forcing norms. The proof uses Gaussian kernel estimates for the semigroup and pointwise bounds, energy and kernel estimates for the second seminorm, and parabolic Calderón–Zygmund estimates for the first. Section 3 (pp. 6–7) gives uniqueness of the contraction fixed point in its \(X\) class and explains the theorem's weak-solution uniqueness with \(\sqrt t\|Du(t)\|_\infty\le c_1\varepsilon\). The pointwise weighted bound alone does not imply the second seminorm by direct time integration. The authors return to the positive-time initial problem and pass to zero time in the \(X\) estimates. Continuity alone supplies neither uniqueness premise. [Koch–Lamm, preprint §§2–3][spaces].

Section 4.2 (pp. 7–8) extends the argument to systems once the Gaussian and Calderón–Zygmund estimates are available. It permits rank-one positivity for small \(L^\infty\) perturbations of uniformly continuous data. With positive diffusion convention \(P(\xi)=P^{ij}\xi_i\xi_j\), the required bound in a fixed fiber pairing is

\[
 \operatorname{Re}\langle P(\xi)v,v\rangle\ge c|\xi|^2|v|^2.
\]

The Fourier time generator is \(-P(\xi)\). This fixes the sign when reading the separate weaker spectral-parabolicity paragraph, which prints the symbol without the Fourier minus sign. Rank-one positivity tests \(Z_i=\xi_i v\). Full gradient-array positivity instead tests \(\operatorname{Re}\sum_{ij}\langle P^{ij}Z_j,Z_i\rangle\ge c\sum_i|Z_i|^2\) for arbitrary \(Z\). The source uses the latter as a sufficient condition for the integral coercivity (4.1). For uniformly continuous coefficients rank-one positivity yields the Gårding estimate (4.2), with a lower-order \(L^2\) term. For small BMO perturbations the systems argument invokes (4.1) on coefficients evaluated at the heat extension of the data. The separate BMO discussion also requires uniform structure assumptions in the values reached by that extension. A compact value tube and rank-one positivity give the continuous-data route, with no BMO conclusion. [Koch–Lamm, preprint §3 and §4.2][systems].

Section 4.1 (p. 7) asserts localization to uniform manifolds using uniform local charts. A fixed smooth compact base admits a finite such atlas. Theorem 5.3 (p. 12) treats Ricci–DeTurck on a uniform \(C^1\) manifold with a uniformly continuous initial metric, using a uniform \(C^3\) atlas and a fixed \(C^2\) comparison metric with bounded second derivatives. Its setup places the metric values in a compact convex positive region. It gives a continuous solution and uniqueness in a small weighted gradient class. The leading coefficient \(g^{ab}\) acts as a scalar on each tensor fiber. These passages leave the uniform estimates and globalization for a general strongly coupled system on a fixed nontrivial bundle to be verified. In particular, separate Euclidean Cauchy solutions with arbitrarily extended local data are insufficient for patching, since the parabolic equation has infinite propagation speed. [Koch–Lamm, preprint §4.1][systems]. [Theorem 5.3][ricci].

## Map for the proposed \((A,F)\) system

Use B29 and the E36 request's smooth compact closed oriented real four-manifold, oriented \(SO(3)\) bundle, and fixed smooth definite \(\bar A\) with \(\bar F=F_{\bar A}\). Work in the positive round-compatible curvature component with the prescribed Fine normalization. Center the affine variable and the curvature using \(U=(A-\bar A,F-\bar F)\). This is a section of \((T^*M\oplus\Lambda^2T^*M)\otimes E\), where \(E\) is the adjoint bundle in the fixed internal Euclidean pairing. Equip the sum with that pairing and \(\bar g=g(\bar F)\). Fix \(\lambda\) in the proposed Bianchi term. The following checks assume that E36's proposed independent system has been verified to have the local form

\[
 U_t=P^{ij}(x,U)\partial_{ij}U+f(x,U,DU),
\]

with smooth value-only principal matrices, a smooth polynomial of degree at most two in \(DU\) for \(f\), and Hermitian rank-one coercivity in the fixed comparison pairing at the reference. E34 controls its completed curvature symbol in the native metric. At the reference that metric agrees with \(\bar g\). A uniform coercive margin at the reference extends to a small tube by continuity on the compact unit covector and amplitude bundles in the **same** fixed pairing. Norm equivalence alone cannot transfer a quadratic-form sign for a nonsymmetric symbol between arbitrary pairings. Definiteness of \(F\) alone does not imply this coupled coercivity. [E34][e34]. [Frozen E36 request][e36].

In a fixed smooth coordinate system and frame the exact divergence rewriting is

\[
\begin{split}
 U_t-\partial_i\big(P^{ij}(x,U)\partial_jU\big)&=h(x,U,DU),\\
 h(x,U,p)&=f(x,U,p)-(\partial_i^xP^{ij})(x,U)p_j
                  -\big(D_UP^{ij}(x,U)[p_i]\big)p_j .
\end{split}
\]

The fixed-value \(x\)-derivative adds a linear term. The value derivative adds a quadratic term. With a fixed background covariant derivative, or with a smooth positive coordinate density in the divergence, the extra connection and density factors give terms of degree at most two after returning to ordinary coordinate derivatives. For example, under \(U'=R(x)U\), the leading matrices are \(RP^{ij}(x,R^{-1}U')R^{-1}\). Differentiating \(R^{-1}\) twice gives terms linear in \(DU'\) or zeroth order in its jet. Substitution of \(DU=R^{-1}DU'+D(R^{-1})U'\) into \(f\) preserves the degree bound. An affine offset in an uncentered frame is handled by the same differentiation of its fixed smooth coefficient. Fixed orthonormal fiber frames realize the reference pairing as Euclidean, and smooth coordinate changes preserve rank-one diffusion with comparable covector constants on a fixed finite atlas.

On a compact sub-tube with a positive distance from the admissible tube boundary, all the needed value and spatial coefficient derivatives have finite bounds. In reference-centered fiber balls small enough for coercivity, use a smooth value cutoff equal to one on the inner region and supported in the larger ball. Convex interpolation of \(P\) with \(P(x,0)\) preserves the fixed-pairing coercivity inequality and extends the coefficient with uniform value bounds. Apply the same cutoff to \(h\) where it is defined. A Euclidean chart extension can likewise blend with a fixed coercive constant coefficient array outside the chart. These extensions can be used for estimates only on time intervals where the evolving values stay in the region of agreement. All estimates must account for derivatives of the cutoffs and frames. A finite cover does not itself construct the global linear Cauchy operator or supply the overlap argument.

Write the resulting forcing as \(h_0(x,U)+h_1(x,U)p+h_2(x,U)[p,p]\). Under \(x=x_0+\sqrt T y\), \(t=Ts\), the three coefficients of the rescaled forcing are \(Th_0,\sqrt T h_1,h_2\). Uniform bounds for \(h_i,D_Uh_i\) then imply the source's difference estimates by making the first two scaled coefficients small and retaining the quadratic coefficient in \(L\). In the unit-time inequalities, the term linear in \(|p|\) in the value difference is bounded using \(2|p|\le1+|p|^2\). Higher rescaled derivatives follow from the polynomial degree and smooth bounded coefficients. The fixed-value spatial oscillation of \(P\) on a radius \(\sqrt T\) ball is bounded by a chart constant times \(\sqrt T\sup|D_xP|\). The relevant constants include the finite fixed atlas, frame, cutoff and reference derivatives, including the background derivatives that occur in \(f\) and \(D_xP\). They do not require derivatives of the initial sections. In a frozen constant-coefficient chart, the rank-one estimate implies \(\|e^{-tP(\xi)}\|\le e^{-ct|\xi|^2}\) by differentiating the norm square. A global argument still needs the corresponding kernel, energy and parabolic regularity estimates for the reference operators used in the contraction.

## Conditional PDE conclusion and common time

Assume the operator checks above and a compact-bundle extension of the Koch–Lamm construction supplying the uniform linear \(X\) estimates, contraction with quantitative control of the solution values in the tube, and its weighted-gradient uniqueness argument. Let the initial sections be continuous, uniformly bounded in the fixed comparison norms, have one spatial modulus of continuity in fixed frames, and have their values in a common compact sub-tube of the definite, rank-one-coercive region. For a fixed small threshold \(\varepsilon\) from uniform coefficient and linear-estimate constants, choose a chart time scale \(T>0\) with the local oscillation at radius \(\sqrt T\) at most \(\varepsilon\), the fixed-value oscillation of \(P\) small, and \(T\|h_0\|_{C^1_U}+\sqrt T\|h_1\|_{C^1_U}\) sufficiently small. \(T\) and the chosen fixed-point neighborhood must respect the tube margin. With these hypotheses the conditional conclusion is a solution continuous up to time zero in the fixed norms, smooth for positive time with smooth coefficients, with the positive-order bounds \(t^{j/2}\|D^jU(t)\|_\infty\le C_j\varepsilon\) in fixed charts in the regularity range, and uniqueness with the specified small weighted-gradient bound. A fixed-frame to covariant-norm change contributes lower-order terms weighted by positive powers of \(\sqrt t\). These are controlled by the fixed reference, the value bound and the estimates at orders below \(j\).

This selection of \(T\) is uniform for smooth compatible approximations with the same hypotheses, conditional on that bundle extension and its uniform constants. The source's Euclidean time criteria separate a common initial modulus from coefficient bounds and a definite value margin. A sup bound and a modulus by themselves can leave a family arbitrarily close to degeneration or the edge of the available coercive tube. They suffice for the margin when the sup bound itself places the values in a strictly smaller reference-centered ball. The exact source establishes the scalar theorem and gives the described extensions. It does not by itself establish the common compact-bundle lifespan for the B29 operator with only the three stated data controls.

E24 already verifies distributional curvature compatibility for its conditional continuous limit. It gives no PDE regularity for the pair in the adjusted formulation. The conditional rough PDE conclusion would concern independent \(A,F\) variables. Passing from smooth compatible solutions to a rough compatible datum still requires a compatibility argument in the selected class, including approximation and adequate stability if that is the method used. Smooth propagation of \(F-F_A=0\) on supplied intervals does not by itself settle the initial singular-time step. To continue the unadjusted flow would also require identifying its incoming path with an adjusted solution in a usable uniqueness class, controlling the recovery transformations across the endpoint, and matching the recovered flow with the necessary regularity. No such endpoint passage follows here. [E24][e24].

[request]: ../research-progress/handoffs/SP4-CME-E37_REQUEST_v1.md
[journal]: https://dml.cz/handle/10338.dmlcz/144463
[kl]: https://arxiv.org/pdf/1310.3658v1
[scalar]: https://arxiv.org/pdf/1310.3658v1#page=2
[spaces]: https://arxiv.org/pdf/1310.3658v1#page=4
[systems]: https://arxiv.org/pdf/1310.3658v1#page=7
[ricci]: https://arxiv.org/pdf/1310.3658v1#page=12
[e24]: 24_TEMPORAL_BOOTSTRAP_20261122.md
[e34]: 34_CURVATURE_BIANCHI_SYMBOL_20261122.md
[e36]: ../research-progress/handoffs/SP4-CME-E36_REQUEST_v1.md
