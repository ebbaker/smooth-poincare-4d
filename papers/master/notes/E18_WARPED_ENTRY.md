# SP4-MASTER-E18 · Tangential warping and outer cone jets

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E calculation for B02 under the
[frozen E18 handoff](../research-progress/handoffs/E18_WARPED_ENTRY.md),
from committed input `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`.
The five master TeX hashes matched the packet. Requested GPT-6.2 Sol/ultra.
Actual serving model and reasoning effort were unavailable to this helper.
The results concern smooth local metric patches and arbitrary smooth closed
completions that contain them.

## The local metric and its two gauges

Iori–Piergallini's representation theorem gives every closed connected
oriented PL four-manifold a simple five-sheeted PL cover of the standard
PL $S^4$ with locally flat PL branch surface. A meridian transposes two
sheets, so its cycle lengths are $(2,1,1,1)$. On a local metric model
over a common cone angle $2\pi\alpha$, the four source disks have slopes
$\beta_j=\kappa_j\alpha$, where $(\kappa_0,\kappa_1,\kappa_2,\kappa_3)
=(2,1,1,1)$. The exact smooth metrics and any global compatibility with
the branched map are additional hypotheses. See the definition of simplicity
and displayed theorem on p. 395, together with the definition of PL
branched covering on p. 394.
[Iori–Piergallini, Geom. Topol. 6 (2002), 393–401](https://arxiv.org/pdf/math/0203087#page=3)

Use the sheetwise metric
\[
 g=dr^2+f(r)^2d\theta^2+b(r)^2h,qquad 0\le r<R_*,\quad
 \theta\in\mathbb R/(2\pi\mathbb Z).
\]
Here $r$ is normal distance in the constructed metric, $h$ is fixed
and smooth on an oriented sheet patch $U$, $A=\operatorname{Area}_hU$
is fixed and positive, and $K=K_h$ is bounded. At the smooth axis,
$f$ has an odd smooth extension with $f'(0)=1$, and $b$ is smooth,
positive and even there. Require $f>0$ away from the axis. At
$r=\epsilon$, set $q=f(\epsilon)>0$, $f'(\epsilon)=\beta>0$,
$b(\epsilon)=1$ and $b'(\epsilon)=0$. On the fixed exterior range
$\epsilon\le r<R_*$ use $b=1$ and $f=q+\beta(r-\epsilon)$. This
allows the shifted exterior of [E10](E10_BRANCH_PATCH.md) and
[E15](E15_SHEET_ANGLES.md). A common exact cone has $q=\beta\epsilon$.
The obstruction below assumes $q\le C\epsilon$ and requires no
upper bound for $f$ elsewhere in the core. The examples also have the
stronger core bound $f\le C\epsilon$.

With primes in $r$ and dots in $s$, set
\[
 s(r)=\int_0^r b^{-1}\,dr,\qquad S=s(\epsilon),\qquad F=f/b,
 \qquad \bar g=b^{-2}g=ds^2+F(s)^2d\theta^2+h .
\]
The conformal core width is $S$, and its normal area divided by
$2\pi$ is $V=\int_0^S F\,ds=\int_0^\epsilon f b^{-2}\,dr$.
The slope satisfies $\dot F=f'-fb'/b$. In particular
$(F,\dot F)=(0,1)$ at the axis and $(F,\dot F)=(q,\beta)$ at
$S$. The two volume densities are
$dV_{\bar g}=F\,ds\,d\theta\,dA_h$ and
$dV_g=f b^2\,dr\,d\theta\,dA_h=b^4dV_{\bar g}$.

In an orthonormal frame with tangential indices $a,c$, the curvature
operator of $g$ on the frame two-forms is diagonal. Its sectional
entries are
\[
 k=-f''/f\quad(r\theta),\quad
 p=-b''/b\quad(ra,rc),\quad
 m=-f'b'/(fb)\quad(\theta a,\theta c),\quad
 t=(K-(b')^2)/b^2\quad(ac).
\]
For example, in the frame $\partial_r,f^{-1}\partial_\theta,b^{-1}e_a,
b^{-1}e_c$, the connection in each circle or sheet direction has radial
principal curvature $f'/f$ or $b'/b$. The radial sections give the
listed second derivatives. The Gauss formula on the $r$-slices, whose
intrinsic metric is the circle times $(U,b^2h)$, gives the other
entries. The principal curvature endomorphism is parallel on each
slice, so the Codazzi components vanish. Hence
\[
 R_g=2(k+2p+2m+t),\qquad
 |\mathrm{Rm}_g|_{\mathrm{tens}}^2=4(k^2+2p^2+2m^2+t^2).
\]
The two chiral projections of the curvature operator each have
diagonal entries $(k+t)/2,(p+m)/2,(p+m)/2$. Subtraction of
$R_g/12$ gives Weyl eigenvalues $D/3,-D/6,-D/6$, with
$D=k+t-p-m=b^{-2}(K-\ddot F/F)$. Thus both chiral
Hilbert–Schmidt squared norms are $D^2/6$. Equivalently one can compute
in the product gauge, since the chiral Weyl density is conformally
invariant in dimension four. Reversing orientation exchanges the two
equal answers. In particular, on the core $C$,
\[
 E_\pm(g;C)=\frac{\pi}{3}\int_U\int_0^S
                   \frac{(\ddot F-KF)^2}{F}\,ds\,dA_h .
 \tag{1}
\]
The same formula integrated to a later $s$ includes the exterior.
[Master normalization and Yamabe form](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L165)

## Thickness and the terminal slope obstruction

Write $K_*=\|K\|_\infty$, $H=\sqrt{3E_\pm(g;C)/(\pi A)}$ and
$J=\int_0^S\ddot F^2/F\,ds$. The triangle inequality in
$L^2(F\,ds\,dA_h/A)$ gives $\sqrt J\le H+K_*\sqrt V$. Applying
Cauchy–Schwarz to $\int\ddot F\,ds$, and integrating the corresponding
bound for $|\dot F-1|$ from the axis, gives
\[
 |\beta-1|\le H\sqrt V+K_*V,qquad
 V\le \tfrac12 S^2(1+H\sqrt V+K_*V).
 \tag{2}
\]
A bounded-energy family with $|\beta-1|$ uniformly positive must have
$V$ bounded below. It must also have $S$ bounded below, since $S\to0$
in the second inequality, after absorbing $K_*S^2 V/2$, forces $V\to0$.
In particular, if the four sheet cores have bounded energy, the
inequalities $\max_j |\beta_j-1|\ge 1/3$ and $S\le
\epsilon/\min b$ force $\min b=O(\epsilon)$ on at least one sheet.
The bound $1/3$ follows by comparing $\alpha$ and $2\alpha$ to $1$,
with equality at $\alpha=2/3$. For a single sheet with $f\le C\epsilon$,
a core area bounded below also forces $\int_0^\epsilon b^{-2}dr\gtrsim
\epsilon^{-1}$. A transition of large conformal area elsewhere cannot
necessarily deliver the outer derivative at a small outer radius.

For $\beta\ne1$, let $d=\min\{\beta/2,|\beta-1|\}$. Starting at
$S$ and moving inward, stop at the first $s_0$ with
$|\dot F(s_0)-\beta|=d$. It exists by the axis slope. On $[s_0,S]$,
$\dot F\ge\beta/2$, so $F\le q$ and
\[
 V_\mathrm{end}=\int_{s_0}^S F\,ds
 \le \frac{2}{\beta}\int_{F(s_0)}^q y\,dy\le\frac{q^2}{\beta}.
\]
Radial Cauchy–Schwarz gives $\int_{s_0}^S\ddot F^2/F\,ds\ge
d^2/V_\mathrm{end}$. Applying the same triangle inequality as in (2)
on this interval, and using nonnegativity on the rest of the core,
gives
\[
 H\ge\left(\frac{d\sqrt\beta}{q}
                  -\frac{K_*q}{\sqrt\beta}\right)_+ .
 \tag{3}
\]
For $\beta=1$ the bound has right side zero. The estimate uses both
outer jets and $F>0$ all the way to the axis. It applies to nonmonotone
interior profiles and arbitrarily large $S$ or $V$.

With $q_j\le C\epsilon$ and a common $\alpha\ge a_0>0$, there is
a sheet with $d\ge\min(a_0/2,1/3)$, so some core energy grows at least
on the order of $\epsilon^{-2}$. This includes the smooth-base angle
$\alpha=1$ and the product-optimal angle $5/7$. Bounded four-sheet
energy as $\epsilon\downarrow0$ therefore forces $\alpha\to0$.
For small $\alpha$, apply (3) to a single sheet with
$\beta=\alpha$, $d=\beta/2$. A uniform $H$ bound yields
$\beta^2/2\le H q\sqrt\beta+K_*q^2$, hence
$\alpha=O(\epsilon^{2/3})$ when $q\le C\epsilon$.
For the exact cone $q=\beta\epsilon$ one gets
$(1/2-K_*\epsilon^2)\sqrt\beta\le H\epsilon$ and
the stronger necessary rate $\alpha=O(\epsilon^2)$. These conclusions
are purely local obstructions to the global entry band.

## The full scalar form

With $B=\log b$ in the conformal coordinate,
\[
 R_g=b^{-2}\{2(K-\ddot F/F)
                -6[\ddot B+(\dot F/F)\dot B+(\dot B)^2]\}.
\]
Equivalently $L_g(v)=b^{-3} L_{\bar g}(bv)$, using
$L_g=-6\Delta_g+R_g$ and the convention $\Delta_g=\operatorname{div}_g\nabla$.
For compactly supported $v$, $Q_g(v)=Q_{\bar g}(bv)$ and
$\|v\|_{L^4(g)}=\|bv\|_{L^4(\bar g)}$. For a general test
$u=bv$ the complete form in the product gauge is
\[
 Q_{\bar g}(u)=\int
 \left[6\left(|u_s|^2+F^{-2}|u_\theta|^2+|d_Uu|_h^2\right)
                +2(K-\ddot F/F)u^2\right]F\,ds\,d\theta\,dA_h .
 \tag{4}
\]
For $u=\phi(x)\chi(s)$ define $A_2=\int_U\phi^2$,
$D_2=\int_U|d\phi|^2_h$ and $B_2=\int_U K\phi^2$, all in $dA_h$.
Then $Q_{\bar g}(u)/(2\pi)$ equals
\[
 6 A_2\int F|\dot\chi|^2ds-2 A_2\int\ddot F\chi^2ds
                 +(6D_2+2B_2)\int F\chi^2ds .
\]
The integrated normal scalar defect with $\chi=1$ on the entire core
is $-2(\beta-1)$ before the tangential and angular factors. If the radial
test is cut off within the core, its sign also depends on the distribution
of $\ddot F$. A cutoff between two positive radii with endpoint values
$0,1$ has minimum radial gradient integral $(\int ds/F)^{-1}$,
by Cauchy–Schwarz, attained with derivative proportional to $1/F$.
The radial resistance is unchanged by the warp,
$\int ds/F=\int dr/f$. The scalar covariance in (4) applies to smooth
positive $b$ at each fixed $\epsilon$ and also to $H^1$ tests by
approximation on compact support.
[Lee–Parker, §2, (2.7), p. 43](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf#page=7)

## Exact cones with vanishing common angle

Fix flat $h$, a radius $R_*>0$ and a conformal length $L>0$ before
taking $\epsilon\downarrow0$. Choose a smooth $P$ on $[0,1]$, positive
on the interior, equal to $x$ near zero and $(1-x)^4$ near one.
On each sheet take $S=L$, $F_0(s)=L P(s/L)$, $t=L-s$ and
$\beta_j=\kappa_j(\epsilon/L)^3$. Set $F=F_0$ for $t\ge\epsilon/2$,
$F=\beta_j(\epsilon-t)$ for $t\le\epsilon/4$, and use a smooth convex
cutoff between these formulas as a function of $t/\epsilon$.
On the interpolation strip, $F\asymp\epsilon^4/L^3$ and
$|\ddot F|\lesssim\epsilon^2/L^3$. All comparison constants are
independent of $\epsilon$ for the four sheets. The last linear piece
extends into the exterior.

For the compression, take a smooth $\eta$ with values in $[0,1]$,
zero except in $0\le t<\epsilon/4$ and one for $0\le t\le\epsilon/8$,
obtained from a fixed cutoff of $t/\epsilon$. Put $b(s)=a^{1-\eta}$,
choosing $a\in(0,1)$ so that $\int_0^L b\,ds=\epsilon$.
The integral is continuous and strictly increasing in $a$, with
lower limit at most $\epsilon/4$ and upper value $L$.
Also $3\epsilon/(4L)\le a\le\epsilon/L$.
Define $r(s)=\int_0^s b\,ds$ and $f=bF$. Near zero,
$b$ is constant and $F=s$, so $f=r$. Near $L$ and on the exterior,
$b=1$ and $r=\epsilon+s-L$, so $f=\beta_j r$ with all jets matched.
The bound $f\le C\epsilon$ on the core follows from $a\lesssim
\epsilon/L$ away from the restoration strip and
$F=O(\epsilon^4/L^3)$ there. The conformal core normal area stays
positive as the physical width vanishes.

The contribution of the interpolation strip to $J$ is
$O(\epsilon/L^3)$, and the removed quartic tail has the same order
of $J$. The exact cone exterior has zero Weyl curvature for flat $h$.
In each chirality the sum over the four patches is therefore
\[
 E_\pm=\frac{4\pi A}{3L^2}\int_0^1\frac{P''(x)^2}{P(x)}\,dx
                      +O(A\epsilon/L^3).
\]
The integral is finite, since $P''=0$ near zero and
$P''^2/P$ is bounded near one. This cost can be made arbitrarily
small by choosing a large fixed $L$. In this example even the
full curvature squared integral of the warp restoration strip
tends to zero at fixed $L$. Indeed, multiplying the entries
$k,p,m,t$ by $b^2$ gives, in order,
$-\ddot F/F-\ddot B-(\dot F/F)\dot B$, $-\ddot B$,
$-(\dot F/F+\dot B)\dot B$, and $K-\dot B^2$.
On the strip $\dot F/F=O(\epsilon^{-1})$,
$\dot B=O(|\log a|/\epsilon)$ and
$\ddot B=O(|\log a|/\epsilon^2)$. The $b^{-4}$ in the squared
curvature cancels against the volume factor, leaving
$O(A\epsilon(1+|\log a|)^4/L^3)$ there.

These particular conformal classes have negative Yamabe constant on
every smooth closed completion. To see it, choose a fixed compact
interval of $t>0$ in the exact quartic region that stays outside the
interpolation strip for small $\epsilon$. Use
$\chi(t)=t^{-3/2}\zeta(\log(t/t_0))$ with smooth $\zeta$ compactly
supported in $(-\ell,0)$, so this interval lies in
$(t_0e^{-\ell},t_0)$. The radial part of (4), divided by
$2\pi A_2/L^3$, is
\[
 \int_{-\ell}^0 \left(6|\zeta'|^2-\tfrac{21}{2}|\zeta|^2\right)dy ,
 \qquad y=\log(t/t_0).
\]
Here $\ddot F=12t^2/L^3$ and the cross term integrates to zero.
Fix $\ell$ and $\zeta\ne0$ with $6\int|\zeta'|^2<
(21/4)\int\zeta^2$, possible by rescaling a bump to a long interval.
The tangential term in these units is at most
$6(D_2/A_2)t_0^2\int\zeta^2$. Fix $t_0$ small enough to make
the full test strictly negative, then let $\epsilon$ shrink.
Use $v=b^{-1}\phi\chi$ in the physical patch and extend it by zero.

## Shifted exterior with positive local scalar form

There is also a bounded-energy model with positive local scalar
form if the shifted exterior permitted by E15 is used. On each
sheet take $S=\log(1/\epsilon)$ and
$F_0(s)=\operatorname{sech}(s)\tanh(s)$ for $s\le S-1$. Use
$F=\kappa_j\epsilon[1+(s-S)/4]$ for $s\ge S-1/2$ and interpolate
by a fixed smooth convex cutoff on $[S-1,S-1/2]$.
On the interpolation strip the two functions are bounded above and
below by positive multiples of $\epsilon$, and their derivatives
through order two are $O(\epsilon)$. Thus $|\ddot F/F|$ is bounded
uniformly in $\epsilon$. On the inner profile
$\ddot F_0/F_0=1-6\operatorname{sech}^2(s)$, and $F_0$ is smooth
odd with $\dot F_0(0)=1$. Choose a fixed spherical $h$ with Gauss
curvature $K$ greater than the uniform upper bound on $\ddot F/F$
by at least one. Then $R_{\bar g}\ge2$ on the entire patch, and
(4) is positive on every nonzero compactly supported test.
Since $\int_0^\infty F_0\,ds=1$, the core and the fixed exterior
range have uniformly bounded conformal normal area. Equation (1)
bounds the four-sheet energy in each chirality by a constant times
$A$. A sufficiently small fixed spherical patch gives any specified
positive upper bound for this local contribution.

Use the same $b=a^{1-\eta}$ construction with $L$ replaced by $S$.
It gives $a\asymp\epsilon/S$, a smooth axis and $b=1$ near the
match. The physical profile has $f\le C\epsilon$ on the core.
On the exterior it is exactly
$\kappa_j\epsilon[1+(r-\epsilon)/4]$, the common shifted base
radius on the single sheets and twice that radius on the ramified
sheet. Thus $q_j=\kappa_j\epsilon$ and $\beta_j=\kappa_j\epsilon/4$.
The positivity statement concerns the conformal form in the local
patch. Physical scalar curvature includes the derivatives of $b$
and is not claimed positive.

## Return to B02

Tangential collapse alone leaves the outer-jet obstruction for a
nondegenerate common opening. A degenerating opening can remove
the local chiral divergence, even with smooth axis and exact cone
matching. The exact-cone example above fails the positive-class
requirement. The shifted example supplies positivity for supported
tests on the model patch. To use a degenerating opening for entry
on an arbitrary smooth homotopy sphere still requires global smooth
sheet neighborhoods with compatible base exterior geometry, control of
the transitions at tangential patch boundaries and of the remaining
chiral energy, and positivity of the full closed Yamabe form.
The PL theorem supplies the monodromy used here. No volume-one Yamabe
representative or admissible minimizing sequence on an arbitrary
smooth type has been constructed by this packet.
