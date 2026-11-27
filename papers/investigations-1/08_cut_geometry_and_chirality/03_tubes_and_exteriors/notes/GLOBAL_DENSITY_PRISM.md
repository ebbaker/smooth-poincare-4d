# A two-endpoint Yamabe test on the marked prism

27 November 2026, continued research, for Edward B. Baker III with OpenAI assistance. Actual lead settings unavailable. Inputs at bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0 include [the fixed-length identities](E26_LENGTH_TEST.md), [marked prism](MARKED_PRISM_17.md), [global Korn estimate](E34_GLOBAL_TRANSPORT.md), and [optical radial test](E36_OPTICAL_BEND.md). The orientation and Weyl normalization are those of E26. [Independent reading](../reviews/E47_DENSITY_REPLAY.md).

Let \(Y=Q_8\backslash S^3/C_{17}\) have the unit round metric and volume \(V=2\pi^2/136\). Transport the actual puncture on its marked great-circle segment, of length \(d=\pi/6\), with a rigid transvection germ on an embedded ball of radius \(r<1/10\). Inside that germ carry a fixed smooth radially bent metric, with totally geodesic, smoothly doubling face, matching the round germ at \(r\). Here assume the bend has nonnegative spatial scalar curvature. Outside it allow **any** smooth global velocity extending the germ; in particular its divergence and its support may change throughout the motion. Use the physical four-metric \(L^2dt^2+h_t\), \(t\in[0,1]\), with the correct mapping-torus jets. In the fixed punctured fiber the bend is stationary and outside it the three-metrics are pullbacks of the round metric. The first coefficient \(A\) of the exterior mean Weyl energy is supported in the bend. The cross coefficient with the time-dependent electric tensor vanishes, hence \(e_X(L)\ge AL\). On the last increasing bend segment the turning radius obeys \(a\le\sin^3 r\), and \(A\ge\pi(1-a^2)^2/(2a)>(7/5)r^{-3}\) by the [radial mass calculation](MARKED_PRISM_17.md).

Denote the density of the reference half by \(\nu=dV_{h_0}\). Work in the same fixed fiber coordinates at all times. Define
\[
 q_t=dV_{h_t}/\nu,\qquad \lambda=\log q_1,\qquad
 Q(t,x)=\log q_t(x)-t\lambda(x).
\]
Both endpoint values of \(Q\) vanish, and \(Q,\lambda\) vanish identically in the stationary bent ball. Smoothness at the time-seam is unnecessary for an \(H^1\) trial, which only needs its traces to match under the actual gluing. Write
\[
 D=\|Q\|_\infty,\qquad G^2=\int_0^1\!\int_{\rm outside}|d_xQ|_{h_t}^2\,dV_{h_t}dt,\qquad
 P^2=\int_0^1\!\int_{\rm outside}\lambda^2\,dV_{h_t}dt .
\]
All three quantities belong to a particular metric path, including the two endpoint volume forms. There is no invariant-density premise.

Let \(b\) be the time-independent radial conformal test on the bend from E36, continued by one on the outside. In radial conformal coordinates the optical three-metric is \(w^4 g_{\rm rd}\) and \(b=1/w\) on the annulus. The inner boundary is totally geodesic. The inner integration term for the three-dimensional conformal Laplacian is nonpositive, and the outer jets match the round test. Consequently on the bend alone
\(\int(6|db|^2+R b^2)\le6\,\mathrm{Vol}_{\rm rd}(B_r)\). It is legitimate to reflect this positive \(H^1\) function on the true double. There is also a cutoff test vanishing near the inner face, at the cost of an additional \(14\pi x_0/3\) in the estimate, as in E33.

On that double use \(u=b\,e^{-Q/3}\), and divide both spatial and temporal quadratic forms by two. The traces of \(b\) match because the end action on the bend is a rotation. On the round region,
\[
 \partial_tu+Hu/3=(\lambda/3)u,\qquad H=\partial_t\log q_t.
\]
The bend has no temporal energy. The spatial part \(S\) of the numerator is at most \(e^{2D/3}(6V+2G^2/3)\); the bend term has been counted against its original round ball. Its temporal part satisfies
\[
 T=\int_{\rm outside}e^{-2Q/3}
             \bigl(\tfrac23\lambda^2-|K^\circ|^2\bigr)\,dt\,dV_{h_t}
 \ \le\ \tfrac23e^{2D/3}P^2-e^{-2D/3}5\pi r^3d^2 .
\]
Indeed at each center the germ is orthogonal in the ball integral to the sole round global Killing field \(x i\); E34 gives \(\int|K^\circ|^2\ge5\pi r^3 v(t)^2\) on the round region. Time integration uses \(\int_0^1 v^2\ge d^2\). This step does not require the spatial field to have a fixed shape. If the doubled Yamabe sign is positive, \(LS+T/L>0\) and therefore
\[
 L^2(6V+2G^2/3) >
      5\pi d^2 r^3 e^{-4D/3}-2P^2/3.                    \tag{1}
\]
This inequality and \(e_X\ge AL\) are valid with their actual measured constants. In particular if \(D\le1,\ G^2\le1,\ P^2\le r^3/2\), then
\[
 L^2 > \frac{(15/16-1/3)}{8/5}\,r^3=\frac{145}{384}\,r^3,
 \qquad
 e_X >\tfrac75\sqrt{145/384}\ r^{-3/2}>8\pi^2/3 .
\]
Here \(e^{-4/3}>1/4,\ 6V+2/3<8/5,\ \pi^2<10\), and \(r<1/10\). The estimates apply at all positive-double lengths, irrespective of instantaneous shear, acceleration or a nonzero endpoint speed. They give quantitative conditions on the distortions that a qualifying compressible path on this background would have to exceed.

## A non-volume-preserving endpoint

Start with any smooth volume-preserving correction \(P_t\) with the specified rigid germ, stationary near the two time ends, as constructed in [E28](../reviews/E28_PRISM_REPLAY.md); one may choose the pure transvection germ by taking a curl cutoff of its local primitive. On the reference closed \(Y\), take \(W=\nabla(\chi F)\), where \(F(x)=\sum_{\alpha=i,j,k}(x i x^{-1})_\alpha^4\) and \(\chi\) is a smooth radial bump equal to zero on the reference ball, one outside twice that ball. Choose the positive radius small enough that the doubled-radius chart is embedded. Outside that chart the analytic gradient is nonzero on a dense open set. Set
\[
 \Psi_t=P_t\circ\mathrm{Fl}_W^{\delta\beta(t)},
\]
where \(0\le\beta\le1\) is a smooth nondecreasing cutoff flat and constant near both endpoints with \(\beta(0)=0,\ \beta(1)=1\). This is an actual compressible global deformation with the same marked germ. Its end map gives the same smooth framing pair, since the extra flow fixes the punctured ball and is isotopic to the identity there. End jets are constant; the reflecting radial face is unchanged. The end volume is not preserved: a nontrivial positive-time gradient map of a nonconstant potential on a compact manifold strictly increases the potential on an open set, contradicting conservation of its integral if the map preserved volume.

For one specified amplitude put \(H_0=\|\operatorname{div} W\|_\infty,\ H_1=\|d\operatorname{div} W\|_\infty,\ H_2=\|\nabla W\|_\infty,\ K_0=\max(1,\sup_t\|dP_t^{-1}\|_\infty)\), all in the closed round metric. For example take
\[
 \delta=\frac{\min(1,r^{3/2})}
 {100(1+H_0)(1+H_1)(1+H_2)(1+K_0)} .
\]
Since \(P_t\) preserves volume, \(q_t\) outside the ball is the Jacobian of the reference gradient flow. The identity \(\log\mathrm{Jac}(\mathrm{Fl}^s_W)=\int_0^s(\operatorname{div}W)\circ\mathrm{Fl}^\sigma_W\,d\sigma\) gives \(D\le2\delta H_0,\ P^2\le V\delta^2H_0^2\). The chain rule and \(\|d\mathrm{Fl}^{\pm s}_W\|\le e^{|s|H_2}\) give \(G^2\le4V\delta^2H_1^2K_0^2e^{4\delta H_2}\). These satisfy the preceding strict test. Increasing the length makes the smooth doubled scalar positive for a strictly positive-scalar choice of bend, but the Weyl budget has already failed throughout the positive range. Large integrated spatial variation in the intermediate density, large endpoint compression, changed lapse, or a different spatial background are outside this numerical corollary.
