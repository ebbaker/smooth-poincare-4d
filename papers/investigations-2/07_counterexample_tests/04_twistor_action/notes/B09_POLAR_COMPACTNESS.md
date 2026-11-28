# Compactness of the polar fields and the alternative at the global threshold

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Author-selected GPT-6.2 Astra/ultra lead. No independent serving telemetry. Checkout `7c6bbab9a0a6`. Use the oriented flat marked cylinder, periodic spin lift, admissible smooth class and real positive-spin representation in [B09](B09_GLOBAL_AMPLITUDE.md), the [polar identity](E17_POLAR_LOWER_BOUND.md), and the [interior estimates](B08_INTERIOR_COMPACTNESS.md). All norms below use its fixed product metric.

## The determinant controls the part discarded by the twistor projection

For \(\psi=e^v g\), \(|g|=1\), use the real four-by-four matrix with columns
\[
 m_i=(\partial_i\psi)\psi^{-1}=\partial_i v+(\partial_i g)\bar g .
\]
In this equation and its weak version the right-hand side defines \(m\) without differentiating an exponential. Since the flat projection acts by left Clifford multiplication, its action on this array commutes with right multiplication. Thus \(S(\psi)=\int|\Pi m|^4\). The projection kernel consists of matrices \(A_q:X\mapsto Xq\). Their Frobenius norms are \(2|q|\) and their determinants are \(|q|^4\). Write \(m=A_q+R\), \(R=\Pi m\). Expanding the determinant by columns gives
\[
 |\det m-|q|^4|\le \sum_{j=1}^4 {4\choose j}|q|^{4-j}|R|^j.
\]
By scalar Young inequalities the right side is bounded by \(|q|^4/2+C_0|R|^4\) for a finite universal \(C_0\). Consequently, for universal positive constants \(C_1,C_2\),
\[
 |m|^4\le C_1\det m+C_2|\Pi m|^4 .                       \tag{1}
\]
The determinant retains its sign here. Indeed one first bounds \(|m|^4\le 128|q|^4+8|R|^4\), and then substitutes the lower bound on \(\det m\).

With the standard oriented (unnormalized) volume form \(\Omega\) on the unit quaternions, \(\det m\,dV=dv\wedge g^*\Omega\). This uses the oriented right-invariant frame at \(g\). Its integral is zero by Stokes and the constant angular traces. The index calculation in [B09](B09_GLOBAL_AMPLITUDE.md) guarantees that the polar fields exist on the entire cylinder for every admissible smooth competitor. Hence
\[
 \|m\|_4^4\le C_2 S(\psi),\qquad |m|^2=|dv|^2+|dg|^2.       \tag{2}
\]
This controls the full derivatives of the log norm and angular spinor even for sequences with no uniform pointwise lower norm.

## Relaxation and compactness

Use polar pairs \((v,g)\in W^{1,4}(M,\mathbb R\times S^3)\) with \(v|_{t=\pm1}=\pm b\) and \(g|_{\partial M}=\sigma\). Smooth polar pairs with these traces are dense strongly in \(W^{1,4}\). Here are details at the critical exponent. Extend by the corresponding constant values outside both ends and periodically in the three spatial directions. On a slightly enlarged cylinder these are still \(W^{1,4}\) maps by matching traces. Mollify on radius \(\epsilon\). The local Poincaré inequality on each ball of radius \(\epsilon\) bounds the mean oscillation of \(g\) by \(C(\int_{B_\epsilon}|dg|^4)^{1/4}\), uniformly tending to zero by absolute continuity of the integral. The smoothing kernel is bounded by a constant times the normalized ball density, so the smoothed angular values lie uniformly within \(o(1)\) of the unit sphere. Normalize them radially. The resulting gradients converge strongly in \(L^4\), by the chain rule, boundedness of the derivative of the normalization on this neighborhood, convergence in measure, and tangency of \(dg\). Precompose both smoothed components by \(t\mapsto(1+2\epsilon)t\) to fix both traces. Strong convergence persists by uniform boundedness of these pullbacks on a slightly larger cylinder and strong continuity of dilation there (first for smooth functions, then by approximation). This proves density. Along strong polar approximations the matrices \(m\) converge strongly in \(L^4\) by \(|g|=1\) and dominated convergence for products with a fixed \(L^4\) derivative. Both the action and the integral of the determinant are continuous in this topology.

At any fixed \(b\) an arbitrary smooth minimizing sequence has a subsequence with weakly convergent polar pairs in \(W^{1,4}\), strongly convergent in \(L^4\) and pointwise a.e., by (2), the traces, Poincaré and compact Sobolev embedding. The weak pair has the same traces and unit angular value. Its matrix is the weak \(L^4\) limit of the matrices, since the multipliers \(\bar g_n\) are uniformly bounded and converge a.e. Density and lower semicontinuity show that the limit attains exactly the smooth infimum in the polar space. In particular the projected matrices converge **strongly** in \(L^4\) by convergence of their norms and uniform convexity.

The full matrices converge strongly in \(L^4\) as well. To see the critical step, all minors of \(m_n\) of orders \(1\le j\le3\) converge weakly in \(L^{4/j}\) to the corresponding minors of \(m\). In fact \(m_n\) is obtained from the five-component differential \(d(v_n,g_n)\) by a linear map of its target with bounded coefficients continuous in \(g_n\). Each lower minor of that differential has the stated weak convergence. One may prove this by induction: a wedge of \(j\) differentials is the distributional exterior derivative of the first component times the closed wedge of the other \(j-1\) differentials. Strong \(L^4\) convergence of the first component and weak \(L^{4/(j-1)}\) convergence of the remaining wedge justify testing against smooth compactly supported forms, for \(j\le3\). Hölder bounds upgrade distributional convergence to weak convergence in the indicated reflexive spaces. Multiplication by bounded coefficients converging a.e. preserves these weak limits. Expand \(\det(m_n-m)\) by multilinearity in columns and rows. The pure fourth minors have integral zero for each matrix by the divergence identity and density. Every mixed term pairs an order-\(j\) minor of \(m_n\) with a fixed complementary minor of \(m\) in its Hölder dual. Therefore \(\int\det(m_n-m)\to0\). Apply (1) to the difference, whose projection already converges strongly to zero. This gives \(m_n\to m\) in \(L^4\). Taking real and imaginary parts and multiplying angular derivatives back by \(g_n\) now gives strong \(W^{1,4}\) convergence of the polar pairs.

The associated physical spinors converge along this subsequence strongly in \(H^1\). Here is an exponential integrability argument requiring only the branch's fixed [homogeneous Sobolev bound](E12_CYLINDER_CONSTANT.md). Approximate \(v\) strongly in \(W^{1,4}\) by a fixed smooth \(v_0\) of the same traces so that, for all sufficiently large \(n\), \(48\|d(v_n-v_0)\|_4<1/2\). Write \(f_n=e^{2(v_n-v_0)}\), of trace one. Then
\[
 \|f_n\|_4\le2^{1/4}+24\|df_n\|_2
 \le2^{1/4}+48\|d(v_n-v_0)\|_4\|f_n\|_4 .
\]
Thus \(e^{v_n}\) is bounded in \(L^8\) and converges strongly in \(L^4\) to \(e^v\) by convergence in measure and uniform integrability. Since \(d\psi_n=e^{v_n} m_n g_n\), the derivatives converge strongly in \(L^2\) by Hölder, as do the fields. This identifies the physical limit, without requiring it to be smooth.

These claims are subsequential and refer to the set of relaxed minimizers. For every fixed strict interior slope the earlier full-sequence strong physical \(H^1\) theorem, and its uniform statement on compact subintervals, continue to hold. Here one can identify the relaxed interior minimizer with the radial field by applying that theorem to a smooth recovery sequence. At the global endpoint, identifying every limit with the radial spinor still requires uniqueness in the relaxed class.

## What a transition strictly below the crossing would require

If \(b_{\rm G}<b_{\rm H}=51\pi/16\), there is a **second relaxed minimizer at \(b_{\rm G}\)**. Take \(b_n\downarrow b_{\rm G}\) outside the radial interval and smooth fields with strictly subradial action. Their polar derivatives are bounded in \(L^4\) by (2). Transferring to \(b_{\rm G}\) changes \(v_n\) by \((b_{\rm G}-b_n)t\) and the normalized projected matrix by a constant array of size \(O(|b_n-b_{\rm G}|)\). The actions therefore change by \(o(1)\), using boundedness of their fourth powers. By the closed radial interval theorem the transferred sequence minimizes at \(b_{\rm G}\), so a subsequence converges strongly in the polar topology.

This limit cannot be radial. In E17's integrated identity the part of \(K_i\) linear in \(dg\) with first factor \(\sigma\) has zero divergence by Clifford antisymmetry and pairs to zero with \(du\). The remainder is bounded pointwise by \(\sqrt3 |g-\sigma||dg|\), using the orthogonal Clifford frame at each first argument. With \(u=v-bt\), E12 gives \(\|g-\sigma\|_4\le24\|dg\|_2\). The polar and helicity identities therefore imply, for \(0<b<b_{\rm H}\),
\[
 \int_M Q-2Cb^2\ \ge\ C\|du\|_2^2+C(1-b/b_{\rm H})\|dg\|_2^2
              -12\sqrt3\,\|du\|_2\|dg\|_2\|dg\|_4 .
\]
If the limit were radial, \(\|dg_n\|_4\to0\) and the positive quadratic terms would absorb the last one uniformly for \(b_n\) near \(b_{\rm G}<b_{\rm H}\). Jensen would then give the radial lower action bound for those strict competitors, a contradiction. The second minimizer must have nonconstant angular part (a fixed angular part leaves a strictly convex scalar comparison). These arguments give a necessary alternative before the crossing. They do not choose between that alternative and global radial minimization at the crossing.
