# SP4-CUT-SEAM-E09A — A positive Robin lens half

27 November 2026 (America/New_York packet date). Prepared for Edward B. Baker III with OpenAI Codex assistance. Requested GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. Working HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Inputs are [E09 request r1](../research-progress/handoffs/E09_REQUEST_R1.md), SHA-256 `432daff006fd20fdccab0733616b8235ce63636dfbf3038855fa276ecf9c0e43`, the [paired-filling criterion](B04_PAIRED_FILLING.md), and Reader C's rational parameter and polynomial choice transmitted by the lead. The estimates below concern the compact metric half and its reflected double, in the smooth oriented positive-definite category with curvature-operator HS energies and \(T=4\pi^2\).

## First jet and energy

Let \(N=L(3,1)\setminus B_{r_0}\) with the unit round quotient metric, \(r_0=\arccos(8/15)\). The quotient action is simultaneous multiplication by \(e^{2\pi i/3}\) in \(\mathbb C^2\). Each point of \(S^3\) has distance \(2\pi/3\) from either nonidentity image since their ambient real inner product is \(-1/2\). Thus balls of radius less than \(\pi/3\) are injectively marked, and \(r_0<\pi/3\). Near the puncture boundary, with \(r\) increasing into \(N\), the product metric is
\[
 g_{\rm rd}=\ell^2 d\theta^2+dr^2+\sin^2 r\,g_{S^2(1)},\qquad
 \ell=\frac{\sqrt{161}}{17}.
\]
Use \(\theta\in[0,\pi]\) on the half and its full \(2\pi\) range on the reflected double. Such a product is locally conformal to Euclidean four-space using the unit round three-sphere as the link. Let \(u>0\) be any smooth radial cutoff extension of \(\csc r\) from the collar, equal to one outside a slightly larger puncture collar. Set \(g_{\rm ext}=u^2g_{\rm rd}\). On the join collar \(d\rho=dr/\sin r\), this becomes \(d\rho^2+(\ell/\sin r)^2d\theta^2+g_{S^2(1)}\).

The cap is \(S^2(1)\) times a round unit-curvature disk sector \(0\le s\le s_0,\ 0\le\theta\le\pi\), with metric
\[
 g_{\rm cap}=g_{S^2(1)}+ds^2+\sin^2s\,d\theta^2,\qquad
 \sin s_0=15/17,\quad \cos s_0=-8/17 .
\]
It is a smooth spherical half-disk at the centre. The smooth reflecting faces of the joined side are the two end copies of \(N\) and the diameter of the disk times \(S^2\). The boundary is diffeomorphic to \(L(3,1)\#-L(3,1)\) with the opposed side orientations on the two ends. The cap's outward direction \(\partial_s\) continues as \(\partial_\rho\) in the exterior. On the join, \(\ell/\sin r_0=15/17=\sin s_0\) and
\[
 \partial_\rho(\ell/\sin r)|_{r_0}
 =-(\ell/\sin r_0)\cos r_0=-8/17=\cos s_0.
\]
The unit sphere fibre has zero radial derivative on both sides. Thus the glued tensor \(G\) is \(C^{1,1}\). The boundary is totally geodesic on either open piece and retains this first jet along the interface.

The exterior Weyl curvature vanishes. On the cap the curvature operator of the product has eigenvalues one on the two factor area forms and zero on the other four two-forms. On each Hodge block, subtracting \(R/12=1/3\) gives Weyl eigenvalues \((2/3,-1/3,-1/3)\), with HS square \(2/3\). The half-disk area is \(\pi(1-\cos s_0)=25\pi/17\). Hence on the piecewise half metric
\[
 E_+(V)=E_-(V)=e_V
 =\frac23\cdot 4\pi\cdot\frac{25\pi}{17}
 =\frac{50}{51}T.
\]
A full reflected double has energy \(100T/51\) in each chirality. Two copies of the half have a total pair budget \(100T/51\), with strict margin \(2T/51\).

## Positive supersolution and smoothing

For the original round product the radial Laplacian is
\[
 \Delta f=\frac{1}{\sin^2r}(\sin^2r\,f')',
 \qquad \Delta(\csc r)=\csc r,\qquad
 (-6\Delta+6)(\csc r)=0 .
\]
Thus the scaled exterior has \(R=0\) on the inner collar. Nothing about the sign of the cutoff region is needed. Take \(w_{\rm ext}=1/u\) over the entire exterior. Then \(w_{\rm ext}^2g_{\rm ext}=g_{\rm rd}\) is the PSC quotient product, and conformal covariance gives \(L_{g_{\rm ext}}w_{\rm ext}=6w_{\rm ext}^3\) with \(L_g=-6\Delta_g+R_g\). In the increasing signed collar coordinate, \(w_{\rm ext}(r_0)=\sin r_0\) and \(\partial_\rho\log w_{\rm ext}(r_0)=\cos r_0=8/15\).

On the cap let \(z=(1-\cos s)/2\) and \(P(z)=\sum_{n=0}^5 a_n z^n\), where
\[
 (a_0,\ldots,a_5)=
 \left(1,\frac35,\frac{39}{100},\frac{143}{500},\frac{9009}{40000},\frac{927927}{5000000}\right).
\]
For a radial function of \(s\), \(\Delta_{\rm cap}P=z(1-z)P''+(1-2z)P'\). The recurrence \((n+1)^2a_{n+1}=(3/5+n(n+1))a_n\) for \(0\le n<5\) gives
\[
 \Delta_{\rm cap}P=\tfrac35P-\tfrac{153}{5}a_5z^5 \ \le\ \tfrac35P.
\]
At \(s=s_0\) we have \(z_0=25/34\), \(z'_0=15/34\). Exact rational evaluation gives
\[
 z'_0P'(z_0)-\tfrac8{15}P(z_0)
 =\frac{85090847}{43618007040}>0 .
\]
Let \(P_\lambda=1-\lambda+\lambda P\). The logarithmic derivative \(z'_0P_\lambda'(z_0)/P_\lambda(z_0)\) increases continuously from zero to a value greater than \(8/15\) for \(0\le\lambda\le1\), since its derivative in \(\lambda\) is \(z'_0P'(z_0)/P_\lambda(z_0)^2>0\). The exact matching choice is \(\lambda=23262937088/23348027935\), obtained by solving the equation with derivative ratio \(8/15\). Set \(w_{\rm cap}=\sin r_0\,P_\lambda(z)/P_\lambda(z_0)\). This is smooth at the centre and positive. We have \(L_{g_{\rm cap}}w_{\rm cap}\ge(4-18/5)w_{\rm cap}=(2/5)w_{\rm cap}\) since \(R_{g_{\rm cap}}=4\). The first jets of \(w_{\rm cap}\) and \(w_{\rm ext}\) agree. Their normal derivative on the reflecting boundary is zero, including at the diameter across the centre since \(w_{\rm cap}\) is smooth and radial.

The matched \(w\) and \(G\) are \(C^{1,1}\), so their weak conformal scalar identity has no seam measure. The scalar curvature of \(w^2G\) is \(6\) on the exterior and at least \((2/5)(\sup_Vw)^{-2}>0\) almost everywhere on the cap. Its boundary is totally geodesic because \(G\) has \(H=0\) and \(w\) has zero boundary normal derivative. Its Neumann form is coercive, and multiplication by \(w\) gives the positive sign for \(G\). Equivalently, integration by parts across the matched jets gives the identity \(Q_G(v)=6\int w^2|\nabla(v/w)|^2+\int(L_Gw/w)v^2\) for the original piecewise metric, with boundary conormal and interface fluxes zero or canceling.

For controlled smoothing keep the collar fibre metric round and use the same signed arc coordinate on both sides. Convolve the radial circle radius with a smooth even mollifier of width \(\epsilon\) and insert it with a cutoff equal to one for normal distance below \(\epsilon\) and zero above \(2\epsilon\). The original radius is \(C^{1,1}\), so the mollified radius differs by \(O(\epsilon^2)\) and its first derivative by \(O(\epsilon)\). The rescaled cutoff therefore keeps the second derivatives uniformly bounded on a shrinking layer. This gives convergence in \(C^1\) and \(W^{2,p}\) for finite \(p\). The operation is independent of \(\theta\) and agrees with the original near the disk centre, so the smooth boundary and even reflection persist. Strong curvature convergence in \(L^2\) gives the stated energy limits. On the half, curvature and uniform metric convergence give \(|Q_{G_\epsilon}(v)-Q_G(v)|=o(1)\|v\|_{H^1}^2\) by \(H^1\hookrightarrow L^4\). Thus the Robin sign remains positive and the energies remain strict under any sufficiently small such smoothing. If two resulting halves have a common boundary metric under an admissible marking, one can also productize their totally geodesic seam collars with the same \(C^1\cap W^{2,p}\) control, as in the paired-filling argument.

## Dependence on the marking

These conclusions hold for the displayed product metric and for isometric pullbacks in whatever smooth compatible fibre markings preserve its actual boundary data. Pullback by a flat gauge changes the coordinate description and the endpoint labels together. Because the two paths in the disk from one endpoint to the other are homotopic relative to endpoints, parallel transport across a flat connector gives the same physical rotation along the attaching arc and the boundary diameter. This flat construction supplies no verified relative rotation between the two transported endpoint frames. Any non-isometric modification that introduces such a rotation requires its own curvature, Robin and common-boundary checks within the strict margin. The conclusion here is the positive Robin half with a measured energy budget. Combining two halves into the indicated homotopy sphere requires the independent signed marking and common-boundary verification.

**Passages.** The smooth conformal scalar formula in the two local scales is Lee–Parker, *The Yamabe problem*, §1, (1.1), with their opposite sign convention for the Laplacian. The rough identity here follows by the displayed first-jet integration and does not require a rough Yamabe theorem. The pointwise block formula is Atiyah–Hitchin–Singer, *Self-duality in four-dimensional Riemannian geometry*, §1, p. 427, Eq. (1.1) and the following decomposition, for oriented Riemannian four-metrics. Both passages were checked this turn from the primary texts. For smoothing and the Robin sign use the independently replayed local estimates. [Lee–Parker](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [Atiyah–Hitchin–Singer](https://doi.org/10.1098/rspa.1978.0143) · [Robin and smoothing](E04_ROBIN_DESCENT.md) · [Independent replay](../reviews/E07B_ANALYSIS_READBACK.md)
