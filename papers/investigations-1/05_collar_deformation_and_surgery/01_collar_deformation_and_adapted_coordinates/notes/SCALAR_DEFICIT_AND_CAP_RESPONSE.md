# The scalar cost of a cheap cap and its outward response

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance, selected lead GPT-6.2 Astra/ultra. Actual serving telemetry unavailable. CDS-B03 / DEF-E03i, [frozen question and input revision](../../research-progress/handoffs/EXTERIOR_RECOVERY_AND_NATIVE_CAPS_20261126.md). Use the smooth oriented closed homotopy four-sphere and the real Hilbert–Schmidt chiral norms of the [master comparison](../../../../master/manuscript/variational_comparison.tex). The [preceding boundary test](PHYSICAL_BOUNDARY_RESPONSE.md) gives the exact sign when a cap response operator is available. Here a curvature integral on the candidate gives both spectral estimates before either boundary problem is solved.

## A variational test without a sign constraint

Let E denote either complete chiral Weyl energy on the closed sphere. They agree by signature. Set T=4π² and, in a smooth Riemannian representative h, put
\[
 n(h)=\|(R_h)_-\|_{L^2(h)},\qquad F(h)=E(h)+n(h)^2/48 .
\]
The sign-independent Yamabe bound is \(Y([h])\ge -n(h)\). Indeed the Yamabe quotient has numerator \(6\|df\|_2^2+\int R_h f^2\), and Hölder bounds its negative term by \(n(h)\|f\|_4^2\). At a volume-one Yamabe representative the four-dimensional Gauss–Bonnet identity reads
\[
 Y([h])^2=48(2T-E(h))+12\int|\operatorname{Ric}_0|^2 .
\]
In particular, if \(E<2T\), put \(y=\sqrt{48(2T-E)}\). If \(n<y\) the class is positive and \(Y([h])\ge y\). If \(n=y\), the same follows when h has positive scalar curvature on some open set. In fact a nonpositive class in this case has \(Y=-n=-y<0\); on its smooth strictly positive Yamabe minimizer equality in the quotient bound forces zero gradient and \(\int R_+ f^2=0\). At equality the latter contradicts the specified positive region. Without that condition a negative Einstein metric could saturate the algebraic bound. [Lee–Parker, the Yamabe theorem and smooth positive minimizers](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [Master normalizations](../../../../master/manuscript/variational_comparison.tex)

Consequently on any entered smooth type with \(I=I^+(M)<2T\),
\[
   \inf_{h\text{ smooth on }M} F(h)=I .
\]
Every positive class has \(F\ge E\ge I\), and every nonpositive class has \(F\ge2T\) (trivial if \(E\ge2T\)). Positive Yamabe representatives of an energy-minimizing sequence have \(F=E\to I\). In fact on each conformal class the infimum of \(n\) equals \(\max(0,-Y)\), attained in a Yamabe representative. This formula concerns an unrestricted conformal class; using an arbitrary minimizer to evaluate a cap would also change the prescribed exterior representative. At the level of metrics on the original type, a minimizing sequence for F has positive class eventually, its Weyl energies tend to I, and its negative scalar norms tend to zero. Indeed eventually \(F<2T\) and \(I\le E\le F\). No geometric compactness is involved.

## Native cap, finite thresholds and both spectra

Keep the whole original volume-one Yamabe exterior V, with scalar \(Y_i>0\), and glue a standard cap C by the original disk chart and inverse, with matching smooth germs. Use the connector's actual inward width \(w>0\) in its two buffered charts. For the displayed same-width exterior bound also require an available outward Gaussian width of at least w; otherwise use a measured exterior length \(a\le w\) in the barrier alone, leaving the connector integrals at w. Denote its inner strip by A, the remainder of the cap by O, and set
\[
 c_\sigma=E_\sigma(C;A)+E_\sigma(C;O),\quad
 n^2=\int_A(R_- )^2+\int_O(R_-)^2,\quad
 E=e_i-m_i^\sigma+c_\sigma .
\]
Integrals use the assembled metric in each region. The notation \(E_\sigma(C;U)\) means the energy of that cap metric on U. Closed signature gives \(c_+-c_-=m_i^+-m_i^-\). The cap's outward normal points into V; the exterior uses the opposite normal. On this comparator the complete exterior alone supplies the strictly positive scalar region. If \(E<2T\) and \(F\le2T\), the preceding argument proves positive sign, including the equality case. If \(E<I\), it follows necessarily that
\[
 n^2>48(2T-E).
\]
In particular on a smooth type with \(I>T\), every cap with \(e_i-m_i^\sigma+c_\sigma\le T\) must have \(n^2>48(2T-E)\ge48T\). Conversely the same inclusive Weyl cost and \(n^2\le48(2T-E)\) give an actual positive metric meeting the recognition test. At \(E=I\) a positive cap can attain the infimum; equality alone gives no contradiction. On a balanced disk use its full \(m_i^\sigma=(1-2^{-k})e_i+2^{-k}q_i^\sigma-r_i^\sigma\). Replacing that disk consumes the core. The lemma is an endpoint result; the sufficient joined stretching argument uses a strictly subcritical path.

For a cap which passes this scalar test write \(Q_X(f)=\int_X(6|df|^2+R f^2)\). Extension by zero of zero-trace functions and the closed Yamabe bound give
\[
 \lambda_1^D(C)\ \ge\ y/\sqrt{\operatorname{Vol}(C)}>0 .
\]
The same conclusion holds for V, where scalar positivity already suffices. The two zero-energy harmonic extensions of a common boundary trace \(\varphi\) now exist. Their union f lies in \(H^1(M)\). Write \(Q=Q_V+Q_C\). On the entire cap \(Q_C\ge-n\|f\|_4^2\), while \(Q\ge y\|f\|_4^2\). Therefore as quadratic forms on all traces,
\[
 6(N_V+N_C)\ \succeq\ \frac{y}{y+n}\,6N_V\ \succeq\ \tfrac12\,6N_V .
\]
Here both responses are outward and the factors six result from Green's formula. For the unchanged physical Gaussian collar of V write \(j_w=\inf_{0\le t\le w}(dA_{h_t}/dA_{h_0})>0\) in the actual angular marking. Retaining normal gradient and scalar terms yields
\[
 6\langle\varphi,N_V\varphi\rangle\ge
 j_w\sqrt{6Y_i}\tanh(w\sqrt{Y_i/6})\|\varphi\|_{L^2(h_0)}^2 .
\]
For each normal line the minimizing function with initial value 1 and free other end is \(\cosh((w-t)\sqrt{Y_i/6})/\cosh(w\sqrt{Y_i/6})\). All other exterior terms are nonnegative. This gives a numerical lower response from measured geometry even for nonconstant boundary traces. The global Dirichlet and response bounds also hold with factor \(y/(y+n)\) for an independently known positive endpoint with \(E<2T\), even when \(n>y\).

## Original cap and finite connector

The unchanged physical cap on the E61 disk has \(n=0\), positive first Dirichlet eigenvalue and \(6(N_C+N_V)\succeq6N_V\). It pays \(c_\sigma=m_i^\sigma\) including all off-strip mass; its complete cost passes the inclusive T test exactly when the source energy does. This realizes the tests at the same finite index. An actual cheaper cap has to supply its own scalar and Weyl integrals. If \(R\ge-B_w\) on its physical connector, \(\operatorname{Vol}(A)\le J_w w\operatorname{Area}(\Sigma)\), and the off-strip scalar charge is s, then \(n^2\le s+B_w^2J_w w\operatorname{Area}(\Sigma)\). If this upper bound is at most \(48(2T-E)\) for an actual strict-energy candidate, the spectral estimates apply at that very width. A certified upper bound for E can be substituted on the right. Trace matching can bound \(B_w\) at fixed smooth jets as in the [finite connector](FINITE_CURVED_CONNECTOR.md). The Weyl cost still includes its inverse-width trace-free price and all of O. If the available Weyl upper bound qualifies only at longer widths than the scalar bound, there is no common certificate. E61 supplies neither a uniformly measured cap nor such a common width for a lower-energy replacement.
