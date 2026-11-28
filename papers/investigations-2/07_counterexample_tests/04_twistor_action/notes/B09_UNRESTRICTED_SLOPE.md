# The angular current norm and a stronger unrestricted slope bound

28 November 2026, America/New_York. For Edward B. Baker III with OpenAI Codex assistance. Author-selected GPT-6.2 Astra/ultra. Backend telemetry unavailable. Checkout `7c6bbab9a0a6`. Use the full smooth periodic positive-spin trace problem of [B09](B09_GLOBAL_AMPLITUDE.md), the [E17 identity and signed spectrum](E17_POLAR_LOWER_BOUND.md) and the [compactness alternative](B09_POLAR_COMPACTNESS.md).

Set \(B=17\pi/8\), \(b_H=3B/2\), \(C=3/4\), \(D=2\), \(d^2=\|dg\|_2^2\) and \(H=\int_M K_0\). The four spinors \(c_i g\) form a real orthonormal basis of the negative spin space for unit positive \(g\). The diagonal \((g,\partial_i g)\) vanishes, so the four E17 components are \(K_i=-(c_i g,\mathcal Dg)\). Hence \(|K|^2=|\mathcal Dg|^2\) pointwise. Writing \(g=w+\sigma\) and integrating the flat Dirichlet identity gives the exact norm
\[
                 \|K\|_2^2=\|dg\|_2^2 .                         \tag{1}
\]
This uses the four real components of the half-spinor and both fixed end values. It also gives \(\int V=2d^2/3\) for the orthogonal angular remainder in the flux formula.

Let \(G\) be the \(L^2\) projection onto gradients of real zero-end functions. The constant one-form \(dt\) is orthogonal to its range and has norm squared \(D\). Consequently \(\|GK\|_2^2\le d^2-H^2/D\). Completing the amplitude square in the *integrated* identity gives
\[
 \begin{split}
 \int_M Q-DCb^2
 &=C\|du+GK/3\|_2^2+Cd^2+\frac b2H-\frac1{12}\|GK\|_2^2\\
 &\ge C\|du+GK/3\|_2^2+\frac23d^2+\frac b2H+\frac{H^2}{12D}.
 \end{split}                                                     \tag{2}
\]
The angular helicity bound \(|H|\le d^2/B\) shows that for \(|b|\le4B/3=17\pi/6\) the radial field is the unique global minimizer of the exact action. Jensen gives the action bound from (2). If equality holds and \(H\ne0\), the last square in (2) is strictly positive after the preceding two signed terms have been bounded below by zero, a contradiction. If \(H=0\), (2) forces \(d=0\) and \(du=0\), which gives the radial field by the traces. All terms and comparisons extend to the relaxed polar space by the strong density in B09. In particular uniqueness holds in that space at \(b=17\pi/6\). The coexistence theorem for \(b_G<b_H\) now rules out \(b_G=17\pi/6\), giving the improved unrestricted bracket
\[
             \boxed{\displaystyle \frac{17\pi}{6}<b_G\le\frac{51\pi}{16}} .
\]
The strict improvement beyond the explicit lower endpoint has no quantified size in this argument.

At the crossing any cheaper normalized field must have \(d>0\), \(H<0\), and satisfy
\[
 \frac{-BH}{d^2}>\frac89+\frac{H^2}{9Dd^2},\qquad
 \frac{\|GK\|_2^2}{d^2}>9\left(1+\frac{BH}{d^2}\right).           \tag{3}
\]
Indeed strict improvement in the action forces strict improvement in the mean of nonnegative \(Q\), and (2) gives both statements. In the Dirichlet-time and spatial Fourier decomposition of \(w\), let \(f\) be the proportion of its gradient energy on the negative \(T\)-eigenspace at time mode 1 and spatial length \(2\pi\). Each Fourier mode's signed helicity ratio \(-BH/d^2\) is bounded by 1 on that shell and by \(17/20\) off it. The best other time mode has \(n=2, |k|=2\pi\). Other spatial lengths start at \(2\sqrt2\pi\), where the ratio at \(n=1\) is \(17\sqrt2/33<17/20\), decreasing thereafter. Therefore \(f>7/27\) for every strict crossing competitor. This Fourier shell concerns all four real spin components of \(g-\sigma\); the six-dimensional Dirichlet Hessian kernel in E14 concerns the tangent perturbations at the radial field.

Equation (2) gives a global comparison on the full amplitude class. At the crossing E27 and E30 have actual negative-mean fields with larger action. To decide (3)'s remaining sector the quartic variance or an equivalent part of the full flux comparison is essential.
