# One expanding diagonal chart on the supplied ALE end

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning
effort are unavailable. This is a conditional derivation under
[EXTRACT-E04 revision 1](../research-progress/handoffs/E04_DIAGONAL_REQUEST_20261125.md)
and [NECK-E04 revision 1](../../01_neck_geometry/research-progress/handoffs/E04_DIAGONAL_REQUEST_20261125.md).
The requests record the source versions and the selected route.
An editorial repair to two relative source links in NECK-E03 after the
requests were issued gives current SHA-256 `6ecef368cfe3b840cd0561afc5b5cea4f5a42a5feb1801050ca22e18f490d642`.
The mathematical input is the same.

Let \((X,h)\) be the supplied smooth oriented Riemannian bubble
and let \(r=|x|\) be the oriented radius on the single AE end
from [SEC §11.3](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4110).
Use the full compact comparison embeddings, scales \(\lambda_i\to0\),
and decay \(D_x^j(h-\delta)=O(r^{-\alpha-j})\) in
[NECK-E03](../../01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md).
Fix \(R_*\) in this end, with the annulus beginning at \(R_*/e\)
also in the coordinate range. Increase \(R_*\) if needed to make
the differentiated comparison of \(h\) to the Euclidean metric
small on the buffered end.

## Select a slow diagonal on full truncations

For sufficiently large integers \(m\) let \(R_m=e^m\). Fix an
embedding sequence \(\iota_{i,m}\) on the neighborhood of the
whole truncation through \(e R_m\), with pointed smooth convergence
of \(g_{i,m}=\iota_{i,m}^*(\lambda_i^{-2}g_i)\) to \(h\).
For each \(m\), compact convergence and \(\lambda_i\to0\) give
\(i_m\) so that for every \(i\ge i_m\)
\[
 \max_{0\le j\le4}
 \sup_{R_*/e\le r\le e R_m}
     r^j|D_x^j(g_{i,m}-h)|\le R_m^{-\alpha},\qquad
 \lambda_i R_m\le R_m^{-1}.
\]
At the same threshold one may impose
\(\|g_{i,m}-h\|_{C^4(h;K_{R_*})}\le R_m^{-\alpha}\) on the
fixed compact core \(K_{R_*}\). These are finitely many tests
on a fixed comparison domain for each \(m\). Take the thresholds
strictly increasing and define
\(m(i)=\max\{m:i_m\le i\}\) for all sufficiently large \(i\).
Then \(m(i)\to\infty\), and use only \(\iota_i=\iota_{i,m(i)}\)
for the entire comparison at index \(i\), including its full core
and both buffers. The existence argument places no quantitative
lower bound on the growth of \(m(i)\).

With \(t=\log r\) and \(\Phi(t,\omega)=\chi(e^t\omega)\) in the
oriented end chart, put \(F_i=\iota_i\circ\Phi\) and use the
single cylinder metric
\[
 H_i=(\lambda_i e^t)^{-2}F_i^*g_i,\qquad
 h_0=dt^2+\gamma_{S^3(1)} .
\]
The factor normalizes the cross-section to unit size at leading
order while \(dt=dr/r\). As in NECK-E03, for every \(j\le4\)
the \(j\)-th covariant product derivative of the metric
difference is bounded pointwise by a constant times
\(\sum_{d=0}^j r^d|D_x^d(g_{i,m(i)}-\delta)|\).
One contribution is \(O(r^{-\alpha})\) from \(h\). The
comparison contribution is \(O(R_{m(i)}^{-\alpha})\), which
is at most \(O(r^{-\alpha})\) on the buffered interval.
Thus
\[
 \sum_{j=0}^4|(\nabla^{h_0})^j(H_i-h_0)|_{h_0}
  \le C r^{-\alpha}
 \quad\text{for }R_*/e\le r\le eR_{m(i)} .
\]
The constant is independent of \(i,r\) and of the length.
The construction uses an embedding on the entire annulus at once,
so there are no transition maps between independently selected
slabs of that annulus.

## Spin estimate on the expanding interval

For fixed \(A\ge R_*\), take
\(I_i(A)=[\log A,\log R_{m(i)}]\) for all large \(i\). It
has length tending to infinity, with the positive \(t\) direction
pointing away from the core. On the buffered interval the product
spin structure and the pullback of the source structure agree,
with one sign choice of lift throughout. The symmetric spin
frame comparison of
[EXTRACT-E02](E02_ALE_SPIN_TRANSFER_20261125.md#compare-dirac-operators-in-the-fixed-product-bundles)
applies in this gauge. With \(+\partial_t\) as reference
normal, write \(L_i=c_0(dt)^{-1}U_-^{-1}D_{H_i}^+U_+\) and
\(L_0=\partial_t+D_{\mathrm{tan}}\), where \(D_{\mathrm{tan}}\)
is the fixed self-adjoint tangential operator on positive chiral
spinors in this convention. The first- and zeroth-order coefficient
differences are \(O(e^{-\alpha t})\) pointwise. Integrating the
squared pointwise bound gives
\[
 \|(L_i-L_0)u\|_{L^2(h_0)}
   \le C A^{-\alpha}\|u\|_{H^1(h_0)}
 \quad \text{on }I_i(A)\times S^3.
\]
This estimate has no boundary condition and the constants in
the coefficient and local \(W^{1,4}\) matching norms are independent
of length. For each slab of length between one and two, the latter
bound follows by the fixed volume bound \(4\pi^2\), as in E02.
Thus for large fixed \(A\) the entire diagonal interval meets a
fixed product-domain smallness threshold.

The inverse conformal factors at the inner and outer slices
are exactly \(\lambda_i A\) and \(\lambda_i R_{m(i)}\).
Transport from the source chiral spinor to the cylinder uses the
field weight \((\lambda_i e^t)^{3/2}\) and the Dirac right-hand
side weight \((\lambda_i e^t)^{5/2}\), with the oriented spin
identification. The outer endpoint tends to infinity in bubble
units while its physical conformal scale tends to zero. At fixed
\(A\) the ratio of the inner to outer physical scale is
\(A/R_{m(i)}\to0\).

## Chiral and full Weyl energy on the same annuli

The product is conformally flat. On these annuli the \(C^2\) jet
estimate and uniform metric equivalence give
\[
 |W_{H_i}|_{\rm tens}\le C e^{-\alpha t},\qquad
 dV_{H_i}\le C\,dt\,dV_\gamma .
\]
This follows from smooth dependence of the tensor curvature on
the metric and its first two derivatives near the fixed product
jet, in translated product frames on a fixed angular atlas.
The orientation fixes each chiral label. In the SEC conventions
the full tensor squared norm equals
\(4(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)\) pointwise. Conformal and
pullback invariance in dimension four then give on the actual
source annulus \(\mathcal A_i(A)=F_i(I_i(A)\times S^3)\)
\[
 \begin{aligned}
 E_+(g_i;\mathcal A_i(A)),\ E_-(g_i;\mathcal A_i(A))
 &\le C A^{-2\alpha},\\
 \int_{\mathcal A_i(A)}|W_{g_i}|_{\rm tens}^2\,dV_{g_i}
 &\le C\int_{\log A}^{\log R_{m(i)}}e^{-2\alpha t}\,dt
 \le \frac{C}{2\alpha}A^{-2\alpha}.
 \end{aligned}
\]
In particular
\[
 \lim_{A\to\infty}\limsup_{i\to\infty}
       \int_{\mathcal A_i(A)}|W_{g_i}|_{\rm tens}^2\,dV_{g_i}=0
\]
and likewise in either chirality. For fixed \(A\), the same domination
and convergence on every bounded \(t\)-interval show that the
integral on \(\mathcal A_i(A)\) converges to the corresponding
integral on \(r\ge A\) of the bubble. To see this, split at fixed
\(B>A\), take the source limit on \([A,B]\), bound both tails by
\(CB^{-2\alpha}\), then send \(B\to\infty\). With the fixed-core
threshold above, this also gives convergence of the chiral energy
of the entire embedded \(r\le R_{m(i)}\) truncation to \(e_X\).

## Extent of the geometric result

The outer endpoint is chosen by the fixed-compact convergence
thresholds. Its location relative to a separate base chart,
another bubble or an a priori adjacent-scale annulus is
undetermined. Extension toward any of them would require a
new comparison, including overlap control for the metric,
spin lift and conformal factors. The energy estimate covers
the single diagonal end region. The remainder of an adjacent-scale
neck is still the global accounting problem.
