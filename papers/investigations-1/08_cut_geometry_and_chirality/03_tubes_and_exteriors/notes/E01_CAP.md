# SP4-CUT-TUBE-E01 — a certified cap for the trefoil row

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. This is the bounded E return to [E01_REQUEST_R1](../research-progress/handoffs/E01_REQUEST_R1.md). Requested helper setting gpt-6.2-sol/ultra. Actual model and effort are unavailable to this worker. All fixed repository inputs below were read at `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`.

For the one prescribed row, the smooth cap below has \(R\ge819/625\) and
\[
   \frac{38411}{5000}\le \frac{e_{\rm cap}}{\pi^2}
      \le \frac{19281}{2500}<8.
\]
The certified margin is at least \(719\pi^2/2500\). The exact boundary jets give a \(C^{1,1}\) seam. In the original product gauge on the exterior, a first-jet-matched rescaling makes the scalar curvature uniformly positive on both open sides, and the seam admits a smooth approximation with \(e<8\pi^2\) and \(R>0\).

## Input and conventions

The [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex), Sections 5–6 and specifically Proposition 6.1, supplies the exterior model (6.1), cap metric (6.2), scalar-curvature formula and Weyl functional (6.3). The source for the curvature expressions is [check_01](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_01_kk_cap_energy.py), whose symbolic calculation and normalization were inspected. These curvature identities are inputs to the enclosure. The fixed row is in [check_02](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_02_cap_costs.py) and its [recorded output](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/output.txt). Its geometric identification is as given in Section 6 and in that row.

Use the smooth oriented Riemannian setting, the positive unit-sphere curvature convention and \(e=(E_++E_-)/2=\tfrac12\int |W|_{\rm HS}^2\,dV\). Here \(\theta=8\pi/25\), \(\ell=16/5\), and \(\beta=1/2\) in the displayed exterior angular frame. In the input model \(\theta<\pi/3\), the recorded injectivity radius. Put
\[
    A=\frac{8}{5\pi\sin\theta},
    \qquad f=-A\cos\theta .
\]
Use the same \(\psi,\phi\) framing on both sides and take \(s\) increasing from the cap pole across the seam into the exterior. In a common normal coordinate for (6.1) and (6.2), \(dr/ds=\sin r\) on the exterior, \(r(S)=\theta\).

## Analytic profile and matching

Set \(S=2\), \(x=s^2/4\), \(P=A/2-1\), and \(Q=f-1\). Define
\[
    k=-\frac1{10},\qquad v=\frac{Q-3P}{2}-2k,\qquad u=P-v-k,
    \qquad p(x)=1+ux+vx^2+kx^3,\qquad a(s)=s\,p(x).
\]
Then \(u+v+k=P\) and \(3u+5v+7k=Q\). Hence \(a(0)=0\), \(a'(0)=1\), \(a(2)=A\), and \(a'(2)=f\), since \(a'=p+2xp_x\). With
\[
    J=\sum_{j=0}^3\frac{p_j}{(j+1)(j+2)}
      =\int_0^1p(x)(1-x)\,dx,\qquad c=\frac1{4J},
\]
where the \(p_j\) are the coefficients of \(p\), set
\[
 F(s)=-c(1-x),\qquad b(s)=-2c\int_0^x p(y)(1-y)\,dy .
\]
Since \(a\,ds=2p(x)\,dx\), this gives \(b'=aF\) and \(\int_0^2aF\,ds=-2cJ=-1/2\) exactly. At \(s=2\), the exterior coefficient is \(b_{\rm ext}=-\beta=-1/2\) and \(F(2)=0\) gives \(b'(2)=0=b'_{\rm ext}(2)\). The value and first derivative of \(a\) also coincide. At the seam the profiles are piecewise smooth with continuous first derivatives and bounded second derivatives, so the glued metric is \(C^{1,1}\).

At the pole \(p(0)=1\). In disc coordinates \((U,V)=(s\cos\psi,s\sin\psi)\), \(s^2d\psi=U\,dV-V\,dU\) and \((p^2-1)/s^2\) is smooth in \(s^2\). Thus \(ds^2+a^2d\psi^2\) extends smoothly across \(U=V=0\). Also \(b(s)=s^2\) times a polynomial in \(s^2\), so \(b\,d\psi\) extends smoothly. In the fibre metric the cross term with \(b\,d\psi\) uses the metric dual of the smooth rotation field on \(S^2\), and the quadratic term uses its squared norm. This proves smoothness at both the disc pole and the spherical polar axes. Positivity of \(p\) gives nondegeneracy away from the pole.

## Rational enclosure

The [certificate](../numerics/trefoil_certificate.py) uses Python 3.10 standard-library rational arithmetic. It encloses \(\pi\) by Machin's identity \(16\arctan(1/5)-4\arctan(1/239)=\pi\) and bounds each alternating series between its 16-term sum and the sum with the next term. The identity follows from the tangent addition formula, with \(\tan(4\arctan(1/5)-\arctan(1/239))=1\) in the principal first quadrant. The sine and cosine of the resulting \(\theta\) interval are enclosed by monotonicity on \((0,\pi/2)\) and 12-term endpoint Taylor sums with the next-term bound. The enclosures for \(\pi,\sin\theta,\cos\theta\) are rounded outwards to multiples of \(10^{-15}\).

For \(s>0\) and by continuous extension to \(s=0\),
\[
   K=-\frac{6u+20vx+42kx^2}{4p(x)},\qquad F^2=c^2(1-x)^2,
   \qquad (F')^2=c^2x.
\]
On each of the 2,048 closed equal \(x\)-intervals the certificate evaluates the polynomial and rational expressions by interval arithmetic. It checks \(p>0\) before the division, and bounds \(R\) below by \(2(1+K)-F^2/2\). The same intervals bound the density
\[
   2p\left[\frac43(1+K-\tfrac23F^2)^2+4F^2
                +\frac{16}{135}F^4+\frac23(F')^2\right]
\]
for \(e_{\rm cap}/\pi^2\). Rounding the density endpoints outwards to multiples of \(10^{-9}\) and summing their rectangles gives integral bounds. The displayed results are rounded outwards to multiples of \(10^{-4}\). The result is independent of any optimizer or numerical quadrature.

Run `python3 papers/investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/numerics/trefoil_certificate.py` from the repository root. The recorded run gives

```text
cells: 2048
p >= 3013/10000
R >= 819/625
w >= 2259/5000
(-6 Delta_g + R_g)w >= 3951/10000
e/pi^2 in [38411/5000, 19281/2500]
(8 pi^2 - e)/pi^2 >= 719/2500
```

## Positive scalar curvature through seam smoothing

Use the original product metric on the exterior. Its scalar curvature is \(6\), and it is conformal to the metric (6.1) in the collar by the factor \(\sin^2 r\). Give the cap the metric \(\widehat g=w^2g\), with
\[
  w(x)=\sin\theta+\sin\theta\cos\theta\,(x-1)+\frac{3}{50}(x-1)^2 .
\]
Since \(dx/ds=1\) at the seam, the value there is \(\sin\theta\) and the derivative with respect to \(s\) is \(\sin\theta\cos\theta\), the first jet of \(\sin r\) there. The polynomial in \(s^2\) is smooth at the pole. The cap volume density in the polar coordinates is \(a\sin\vartheta\), so, with \(\Delta_g=\operatorname{div}_g\nabla\),
\[
   \Delta_g w
    = w_{ss}+\frac{a'}{a}w_s
    = x w_{xx}+\left(1+\frac{x p_x}{p}\right)w_x .
\]
The certificate uses this formula and the cap scalar lower bound to enclose \(w\) and \((-6\Delta_g+R_g)w\) on the same cells. Its positive lower bounds give \(R_{\widehat g}=w^{-3}(-6\Delta_g+R_g)w>0\) uniformly up to the seam on the cap side. The exterior remains smooth with \(R=6\). The average chiral energy of the piecewise metric equals the certified cap energy by four-dimensional conformal invariance on each piece and conformal flatness of the exterior.

Mollify the three profiles \(a,b,w\) in the common coordinate \(s\) with a nonnegative smooth kernel of integral one supported in \((-\epsilon,\epsilon)\), using a smooth cutoff equal to one near the seam and supported in the collar. On the collar \(a>0\) and \(w>0\). In the region where the cutoff is one, scalar curvature in any smooth local sphere chart has the form of a continuous lower-order function of the profiles and their first derivatives, plus a linear form in their second derivatives whose coefficients depend smoothly on the profiles and their first derivatives. The profiles and their first derivatives converge uniformly and are uniformly Lipschitz. The smoothed second derivatives are the convolutions of the original bounded second derivatives. Hence the smoothed scalar curvature is the radial convolution of the original scalar curvature plus a uniformly vanishing error, by uniform continuity of the coefficients and the boundedness of the second derivatives. This argument is uniform on the seam using finitely many local charts. In the cutoff transition regions, the original profiles are smooth and the convergence is \(C^2\). The uniform positive scalar lower bound therefore persists for small \(\epsilon\). The curvature is uniformly bounded in the collar and converges off the seam, giving convergence of \(E_+\) and \(E_-\) by dominated convergence. The strict energy margin gives smooth approximations below the wall.

## Floating diagnostic and scope

The recorded optimizer gave \(e/\pi^2=7.6271\) for this row. A floating midpoint computation for this explicit competitor gave approximately \(7.6973\). The certificate bounds this competitor's energy, and the topological identification of the glued exterior and its marking enters through the frozen model. The packet establishes existence for this row.
