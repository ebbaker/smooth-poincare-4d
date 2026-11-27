# SP4-CUT-TUBE-E47 · Two-endpoint density test on the marked prism

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable.
[Frozen E47 request](../research-progress/handoffs/E47_REQUEST_R1.md),
checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. The
[lead calculation](../notes/GLOBAL_DENSITY_PRISM.md) was read at SHA-256
beginning 98a14d2018ca42ae4. Inputs are the [E26 length and Yamabe
forms](../notes/E26_LENGTH_TEST.md), [E34 global strain](../notes/E34_GLOBAL_TRANSPORT.md),
[E36 conformal bend test](../notes/E36_OPTICAL_BEND.md), and the
[actual marked prism](../notes/MARKED_PRISM_17.md). The check is
analytical in the parent's Riemannian, real Hilbert–Schmidt
chiral normalization, \(T=4\pi^2\).

The endpoint-corrected test gives the stated necessary length
inequality without a density preserved by the monodromy. The
numerical distortion bounds in the request exclude the full
positive-Yamabe length range for the specified class of paths.
The composed gradient flow gives an actual endpoint that changes
the reference volume, while retaining the based puncture and
the required distortion bounds.

## Geometry, static cost and doubled test

Use the round prism fibre \(Y=(Q_8\times C_{17})\backslash S^3\)
of volume \(V=\pi^2/68\). The marked displacement on its chosen
great-circle arc is \(d=\pi/6\). Take a rigidly transported
embedded round ball of radius \(0<r=r_0<1/10\); on this arc
embedding requires \(r<\pi/34\) by the
[round covering check](E32_GRADIENT_REPLAY.md).
Replace a smaller concentric punctured region by a fixed
smooth radial bend with nonnegative spatial scalar curvature,
an actual totally geodesic smoothly reflecting face, and a
germ matching the unit round metric at \(r\). Outside the
rigid ball an arbitrary smooth ambient velocity may vary with
time and have nonzero divergence. The pulled-back half-fibre
metrics \(h_t\) make the bend static and the remaining region
unit round up to pullback. Assume the correct smooth
mapping-torus endpoint jets.

In \(g_L=L^2dt^2+h_t\), intrinsic trace-free Ricci is supported
in the bend, while the time tensors of E26 vanish there.
Thus the mixed term in \(B\) is zero and
\(e_X(L)=AL+B/L+C/L^3\ge AL\). On the last increasing part of
the bend the mass identity of [E29](E29_MOVING_PUNCTURE.md)
gives a turning radius \(a\le\sin^3 r\) and
\[
 A\ge A_{\rm rad}:=\frac{\pi(1-a^2)^2}{2a}
   \ge\frac{\pi(1-r^6)^2}{2r^3}
   >\frac75r^{-3}.
\]
This step uses nonnegative spatial scalar curvature. A positive
four-dimensional Yamabe sign alone does not yield the mass
inequality, as E36 shows.

On the reference half put
\[
 \nu=dV_{h_0},\qquad q_t=dV_{h_t}/\nu,\qquad
 \lambda=\log q_1,\qquad Q=\log q_t-t\lambda .
\]
The three distortion quantities used below are
\[
 D=\sup|Q|,\qquad
 G^2=\int_{\rm round}|d_xQ|_{h_t}^2\,dt\,dV_{h_t},\qquad
 P^2=\int_{\rm round}\lambda^2\,dt\,dV_{h_t},
\]
using the actual half-fibre volume at each time and the full
reference complement of the rigid ball. By stationarity,
\(Q=\lambda=0\) on the bend. Also \(Q=0\) at both time
endpoints, independent of whether \(q_1=1\).

For the bent metric \(h=ds^2+f(s)^2g_{S^2}\), use the
radial conformal coordinate \(\rho\) with
\(d\rho/ds=\sin\rho/f\), equal to the round polar coordinate
near \(r\). On the bend \(h=w^4g_{\rm rd}\) with
\(w^2=f/\sin\rho\). Set \(b=1/w\) there and one outside.
Since \(f>0\) on a finite compact interval, the inner
conformal radius \(\rho_i\) satisfies \(0<\rho_i<r\).
The three-dimensional conformal scalar identity gives
\[
 \int_{\rm bend}(8|db|^2+R_h b^2)
   =6\operatorname{Vol}_{\rm rd}(B_r\setminus B_{\rho_i})
      +8\int_{\partial\,{\rm bend}} b\,\partial_\nu b .
\]
At the outer face \(w=1\) on a germ. At the inner face
\(\nu=-\partial_s,\ f'=0\), so
\(\partial_\nu b=-b\cos\rho_i/(2f(0))\).
After integrating over that sphere, its term is
\(-16\pi\sin\rho_i\cos\rho_i\le0\).
Lowering the gradient coefficient to six can only reduce
the form. In particular the bend contributes at most
\(6\operatorname{Vol}_{\rm rd}(B_r)\). All spatial integrals here
use \(dV_h\) in the interior and its induced area on the face.

On both halves use \(u=b e^{-Q/3}\). At each time the radial
face has equal traces under reflection. Across the base
seam both traces of \(u\) are \(b\), which is radial in the
bend and one in its complement. The based map preserves
the bend and is a rotation on it, so \(b\) is preserved.
This proves that \(u\) is an admissible \(H^1\) function on the
smooth doubled mapping torus. Its two endpoint derivatives
can differ. The integration by parts in the E26 form needs
only the stated trace equality and matching \(H\) and volume
data, since the boundary term pairs \(H u^2\) with the matched
volume forms.

## Exact distortion criterion and rational comparison

Divide the doubled numerator by two and write it as
\(L S[u]+T[u]/L\). In the round region \(u=e^{-Q/3}\),
\(R_h=6\), and \(\partial_t Q=H-\lambda\). Hence
\(\partial_tu+Hu/3=(\lambda/3)u\). The bend has no time
contribution. The round-region volume is
\(V-\operatorname{Vol}_{\rm rd}(B_r)\) at every time.
The scalar test above and \(|du|_{h_t}^2=
e^{-2Q/3}|dQ|_{h_t}^2/9\) on the round region give
\[
 S[u]\le e^{2D/3}(6V+2G^2/3).
\]
The actual E26 time term is
\[
 T[u]=\int_{\rm round}e^{-2Q/3}
      \bigl(\tfrac23\lambda^2-|K^\circ|^2\bigr)\,dt\,dV_{h_t}.
\]
At each time the angular direction of the germ is
\(-p_tj\). The E34 exact orthogonality to the global Killing
field \(xi\) and its round quotient estimate give
\(\int_{\rm round}|K^\circ|^2\ge5\pi r^3 v(t)^2\).
The bound is homogeneous in the signed arc speed \(v\),
applies also when it vanishes, and uses no time derivative
or fixed shape of the ambient extension. The removed rigid
ball contributes zero strain. Time integration and
\(\int_0^1v^2dt\ge d^2\) yield
\[
 T[u]\le \tfrac23 e^{2D/3}P^2-e^{-2D/3}5\pi d^2r^3 .
\]
Consequently positive Yamabe type implies the exact bound
\[
       L^2(6V+2G^2/3)
         >5\pi d^2r^3 e^{-4D/3}-2P^2/3 .                    \tag{1}
\]
This is the measured distortion test. If its right side is
positive it gives a lower squared length. With measured \(A>0\)
and \(E_*=8\pi^2/3\), any strict subcritical positive-double
length must in particular satisfy
\[
 \frac23P^2+(6V+2G^2/3)(E_*/A)^2
       >5\pi d^2r^3 e^{-4D/3};
\]
using the static lower bound \(A_{\rm rad}\) in this necessary
condition is valid as a weaker test.

For \(D\le1,\ G^2\le1,\ P^2\le r^3/2\), the right side of (1)
is greater than \((15/16-1/3)r^3\).
Here \(d>1/2,\ \pi>3,\ e^{-4/3}>1/4\), with the last inequality
following from \(\log 2>2/3\) by strict convexity of \(1/x\)
on \([1,2]\). The coefficient on the left is at most
\(6V+2/3<8/5\), using \(\pi^2<10\). This gives
\[
 L^2>\frac{145}{384}r^3,\qquad
 e_X(L)>\frac75\sqrt{\frac{145}{384}}\ r^{-3/2}.
\]
The square of the last expression is greater than
\((49/25)(145/384)1000=35525/48>(80/3)^2\) for \(r<1/10\).
Since \(\pi^2<10\), this proves \(e_X(L)>8\pi^2/3\).
The comparison retains the radius assumption and applies
only to compatible paths on the stated round background
with the specified nonnegative-scalar radial bend.

## The composed compressible path

Take the volume-preserving marked flow \(P_t\) with constant
endpoint germs as in [E28](E28_PRISM_REPLAY.md). One can choose
its germ to be the actual planar transvection: contract the
local Killing field with the round volume form, find a
primitive of the resulting closed two-form in the ball,
and differentiate the cut-off primitive to define the
extension; the exact Lie derivative of the volume vanishes.
The inverse changes only the base orientation convention.

Choose \(r\) so the doubled-radius ball also embeds.
Use the global smooth potential
\(F(x)=\sum_{\alpha=i,j,k}(xi x^{-1})_\alpha^4\)
of E34 and a reference radial cutoff \(\chi\) equal to
zero on the rigid ball and one beyond twice its radius.
Then \(W=\nabla(\chi F)\) is a global field on \(Y\)
and is zero at the rigid ball. Set
\[
 \Psi_t=P_t\circ \operatorname{Fl}^{\delta\beta(t)}_W ,
\]
where \(\beta\) is smooth, valued in \([0,1]\), and
constant near the endpoints with values zero and one.
The gradient flow fixes the reference germ at every time,
so the actual puncture transport and bend stay unchanged.
The added flow has an isotopy to the identity relative to
the puncture. The new endpoint map therefore gives the same
based framing pair, and the constant endpoint schedules give
smooth mapping-torus jets. The open reflected product collar
is unchanged. The reference volume is changed at the endpoint:
the nonconstant potential \(\chi F\) increases along its gradient
flow and increases strictly on an open set for every
\(\delta>0\). Preservation of the round volume would preserve
its integral, a contradiction. Composing with \(P_1\) and the
unpointed isometry cannot remove this change, since they
preserve round volume. On the bend the added map is the
identity and on the round region the reference volume is
round, so \(q_1\) is genuinely nonconstant there. This
example changes the reference volume form; existence of a
different invariant density is immaterial to the calculation.

Write \(H_0=\|\operatorname{div}W\|_\infty\),
\(H_1=\|d\operatorname{div}W\|_\infty\),
\(H_2=\|\nabla W\|_\infty\), and
\(K_0=\max(1,\sup_t\|dP_t^{-1}\|_\infty)\), all in the
fixed round metric. On the exterior round region the
actual \(q_t\) is the Jacobian of the reference gradient
flow, since \(P_t\) preserves volume. Its logarithm is the
flow integral of \(\operatorname{div}W\). With
\(\|d\operatorname{Fl}^{\pm s}_W\|\le e^{|s|H_2}\), the
squared gradient estimate needs one flow exponential from
differentiating that integral and another from converting
the resulting covector norm to the physical \(h_t\) norm.
The latter change uses
\(\|(d\Psi_t)^{-1}\|\le K_0e^{\delta H_2}\).
The bounds are therefore
\[
 D\le 2\delta H_0,\qquad
 P^2\le V\delta^2H_0^2,\qquad
 G^2\le 4V\delta^2H_1^2K_0^2e^{4\delta H_2}.
\]
For the specified
\[
 \delta=\frac{\min(1,r^{3/2})}
 {100(1+H_0)(1+H_1)(1+H_2)(1+K_0)}
\]
and \(r<1/10\) one has
\(\delta H_0\le r^{3/2}/100,\ \delta H_1K_0\le r^{3/2}/100\),
and \(\delta H_2\le1/100\).
Since \(V<1\) and \(e^{4/100}<2\), the requested three
inequalities hold strictly. In particular the example has
positive doubles at sufficiently long \(L\) when the bend
is chosen with strict spatial scalar positivity. Inequality
(1) still excludes every Yamabe-positive length from the
strict exterior budget. Uncontrolled distortion, a changed
lapse, or a changed outer metric lies beyond this calculation.
