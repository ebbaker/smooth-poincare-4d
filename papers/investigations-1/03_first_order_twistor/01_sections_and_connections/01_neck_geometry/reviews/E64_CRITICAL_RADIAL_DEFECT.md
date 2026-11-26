# MASTER-E64c · Independent check of the critical radial defect

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded independent E64c v1 review under NECK-B04/B05.
The dispatch specified GPT-6.2 Sol/ultra. Actual serving model and
effort were unavailable. The frozen neck and master transitive TeX
generation prefixes were `3ff701729d047bb6` and `8442d18fd7d4e142`.
I checked the [E63 derivation](../notes/E63_CRITICAL_RADIAL_DEFECT.md)
and [standalone TeX](../manuscript/critical_radial_defect.tex) with
SHA-256 prefixes `2c622075d1bd1530` and `371052ae1ab42639`, respectively.
The inherited finite defect theorem is [E59](../manuscript/physical_ricci_flux.tex),
and the conditional physical cut is the
[E53 radial comparison](../manuscript/anchored_physical_shell.tex).
[Owning register](../research-progress/REGISTER.md)

**Assessment.** The critical polar condition, logarithmic selection
and full-defect transfer are valid on the stated physical sequence.
The initial mean-curvature trace is replaced by a weighted forward
Jacobian moment before angular averaging. The condition on that moment
is additional to the physical curvature budget. The conclusion controls
all transported compact tests, including when the comparison omits
annular volume. It still requires the proper flat comparison with
compact first-order physical embeddings at the selected scale.

## Backward integration and its earlier weight

On a ray surviving strictly before the cut at logarithmic radius \(l\),
all radii at smaller log times still precede the cut. With
\(t=e^l\), \(p=t^{-3}J\), \(w=t\Delta_g t-3\), and
\(f=t^2(\operatorname{Ric}_g(\partial_t,\partial_t))_-\),
the shape operator satisfies the Riccati trace inequality
\(d_t(\Delta t)\le-(\Delta t)^2/3+(\operatorname{Ric}_{tt})_-\).
In log radius this gives
\[
 (\log p)'=w,\qquad w'+w+w^2/3\le f .
\]
The factors in \(f^2p\,dl=(\operatorname{Ric}_{tt})_-^2J\,dt\)
are \(t^4,t^{-3},t^{-1}\). In particular the integrated forcing over
a physical annulus is critical in dimension four, and controlled by
the physical full-curvature integral there.

For \(s\le u<l\), integrate \(w'+w\le f\) with integrating factor
\(e^u\). This gives
\[
 w(u)\ge e^{l-u}w(l)-\int_u^l e^{v-u}f(v)\,dv .
\]
Now integrate with respect to \(u\in[s,l]\), use
\(\int_s^l w=\log(p(l)/p(s))\), and exchange the two forcing
integrals. The coefficient of \(w(l)\) is \(e^{l-s}-1\).
The numerator multiplying \(f(v)\) is \(e^{v-s}-1\).
Taking positive parts proves (2) in E63. This calculation involves
the whole backward segment from the final radius rather than a
bound on \(w(s)\).

Let \(P(l)=\int_{\Theta_l}p(l,\vartheta)\,d\vartheta\) and
\(G(l)=\int_{\Theta_l} w(l,\vartheta)_+p(l,\vartheta)\,d\vartheta\).
Multiply the raywise estimate by \(p(l,\vartheta)\) and integrate on
the surviving direction set \(\Theta_l\). For \(P(l)>0\),
Jensen with the probability measure \(p(l,\vartheta)d\vartheta/P(l)\)
gives the logarithmic term
\[
 P(l)\log(1+Q(s,l)/P(l)),\qquad
 Q(s,l)=\int_{\Theta_l}p(l,\vartheta)^2/p(s,\vartheta)\,d\vartheta .
\]
The \(P(l)=0\) case contributes zero. At a forcing time \(u\), write
\(f(u)p(l)=(f(u)p(u)^{1/2})(p(l)/p(u)^{1/2})\).
Since \(\Theta_l\subset\Theta_u\), Cauchy--Schwarz bounds the first
factor's squared angular norm by \(F(u)=\int_{\Theta_u}f(u)^2p(u)\).
The other squared norm is exactly \(Q(u,l)\). This is the earlier
Jacobian weight needed for E63 (3). A bound on the angular total
\(P(l)\) alone does not bound this ratio moment.

If \(Q(s,l)\le C e^{2\gamma(l-s)}\), then \(P(l)\le C\) for
\(A<l\le B\) by Fatou from below along fixed surviving directions.
The selection never uses the endpoint \(P(A)\). For \(l-s\ge1\)
monotonicity of \(x\log(1+y/x)\) in \(x>0\) and the exponential
denominator bound the first term by
\(C'(1+l-s)e^{-(l-s)}\). The forcing kernel obeys the exact bound
\[
 \frac{e^{u-s}-1}{e^{l-s}-1}\sqrt{Q(u,l)}
 \le \sqrt C e^{-(1-\gamma)(l-u)} .
\]
The exponent is \(1-\gamma\), because Cauchy--Schwarz takes one
square root of \(Q\). In particular the kernel is integrable with a
fixed mass when \(0\le\gamma<1\). On the middle half \(J_i\) of the
long log window, fixing the initial time \(s=A_i\) and integrating
bounds \(\int_{J_i}G_i\) by \(C(1+\int\sqrt{F_i})\). By
Cauchy--Schwarz this is \(O(1+\sqrt{T_i})\) as claimed, using
the given total curvature bound. This proof at \(\gamma=1\)
would no longer give an integrable kernel bound independent of length.

## Variation, selection and the rescaled signed measure

The signed polar Jacobian extends smoothly to each ray's cut
on a compact positive-radius window. Extend its pre-cut values
by zero beyond that point. Its distributional derivative in the
window consists of \(wp\,dl\) before cut and a downward jump of the
terminal value. If the endpoint is conjugate the latter value is
zero. On a fixed smooth source, the Jacobi equation and smooth
variation of the radially parametrized Jacobi fields bound the
Jacobian and its derivative uniformly over the compact angular
sphere and the given compact radial interval. Thus angular
integration and distributional differentiation commute on that
interval, giving
\[
 DP_i=\left(\int_{\Theta_{i,l}}w p_i\,d\vartheta\right)dl-d\kappa_i
 \quad\text{with }\kappa_i\ge0 .
\]
It follows that \((DP_i)^+(J_i)\le\int_{J_i}G_i\). Regardless of
the number of cut jumps, \(0\le P_i\le C\) bounds the negative
net change by \(C\) using the one-sided traces on the endpoints
of \(J_i\). This gives
\(|DP_i|(J_i)\le C+2\int_{J_i}G_i\).

The sum of the full-curvature integrals, positive-excess integrals
and variations over \(N_i=\lfloor T_i^{3/4}\rfloor\) disjoint
open subintervals is \(O(1+\sqrt{T_i})\). Their endpoints can carry
variation atoms, which can be omitted because the selected
interval is open and every future fixed normalized compact strip
lies strictly inside it. The winning interval therefore has
total budget \(O(T_i^{-1/4})\) and log width of order \(T_i^{1/4}\).
Its midpoint's exponential \(\rho_i\) stays separated from the
original quantiles by log distance at least \(T_i/4\).
The physical diameter bound then gives \(\rho_i\to0\).

With \(h_i=\rho_i^{-2}g_i\), \(d_i=d_{h_i}(x_i,\cdot)\)
and \(l_i=\log\rho_i\), the volume derivative is
\(V_i'(t)=t^3 P_i(l_i+\log t)\) almost everywhere. On a fixed
normalized interval \(0<a<b\), the variation bound gives the
uniform approximation by \(C_i+P_i(l_i)t^4/4\) with error
\(O_{a,b}(T_i^{-1/4})\). Choose \(P_i(l_i)\) as a one-sided
representative. The prefix constant can be arbitrary.
The defect \(\mu_i=4dV_{h_i}-\Delta_{h_i}(d_i^2/2)\) has
nonnegative singular part. Since the regular part is \(-w\,dV_{h_i}\),
its negative mass on the fixed window is exactly
\[
 \int_{\log a}^{\log b}e^{4u}G_i(l_i+u)\,du=o(1).
\]
Here the singular sign uses the distributional Laplacian
decomposition away from the center and the Lipschitz chain rule.
Together with the approximate fourth-power profile, this proves the
full total variation bound via the inherited E59 estimate on an
inner trim. The volume floor is unnecessary for this signed-measure
conclusion. [Mantegazza–Mascellani–Uraltsev, Corollaries 2.11–2.12](https://msp.org/pjm/2014/270-1/pjm-v270-n1-p07-p.pdf)
· [E59 finite defect estimate](../manuscript/physical_ricci_flux.tex)

## Scope of the polar input and cut

The centered physical lower Ricci bound in E59 gives
\(p(l)/p(s)\le C\) on each surviving ray and \(P(l)\le C\)
by comparison with the unshifted model. For the protected Ricci
premise, the one-ray comparison after the inner protected physical
radius \(s_i\) gives monotonicity of
\(J(t,\vartheta)/\operatorname{sn}_K(t-s_i)^3\) before the cut.
The ratio of \(\operatorname{sn}_K(t-s_i)/t\) at two radii
with both at least \(8s_i\) and bounded above is uniformly bounded.
The model-weighted mean of the normalized shifted area on
\((2s_i,4s_i)\) is bounded by the measured initial transition
volume \(O(s_i^4)\). Monotonicity thus gives a uniform later
area bound and \(P(l)\le C\). In either case
\(Q(s,l)\le C P(l)\), verifying \(\gamma=0\). The critical
polar multiplier also checks: for
\(\psi=(\Delta t-3/t)_+\), the cubic product derivative has
\((\psi^3J)'+3\psi^3J/t\le 3(\operatorname{Ric}_{tt})_-\psi^2J\),
because the two fourth-power terms cancel. The comparison estimate
of Dai–Wei–Zhang Theorem 2.1 explicitly requires \(p>n/2\).
[Dai–Wei–Zhang, Theorem 2.1](https://web.math.ucsb.edu/~wei/paper/Dai-Wei-Zhang.pdf)

The examples in the note illustrate the two scopes. The small
warp bump has \(u''=O(\rho^{-1}\epsilon^{-1/4})\) on a shell of
volume \(O(\rho^4\epsilon)\), so the stated critical
\(O(\epsilon^{1/2})\) upper bound holds while the radial lower
Ricci requirement can fail. The forward-moment bound continues
to hold because all the polar densities stay comparable to one.
In the collapsing example, after the initial slope ramp one has
\(u'=v(u)\) and
\(u(u'')^2dt=u v(v')^2du=(4/9)|\partial_{\log u}(v^{3/2})|^2
d\log u\). The log transition length is of order \(N\), and
the interval of transition in distance tends to zero. On the
outer strip \(u_N\to t-1\) and the negative squared-distance
defect has positive mass. The preceding small-radius plateau
has diverging tangential curvature energy and loses the
all-center volume floor. This example therefore concerns a
radial-only critical norm, without the full geometric
hypotheses of the actual physical minimizing sequence. The
round-fiber constant-scalar first integral in the note checks
by differentiating \(u^2(1-(u')^2-ku^2)\) and using
\(R=12k\).

For a supplied proper flat comparison at the selected physical
scale, every smooth compact test can be transported on one
compact source comparison and is supported in a fixed normalized
annular trim at late indices. The signed measure bound controls
it even if the comparison image omits source annular volume.
The unshifted equation then transfers by local uniform metric and
distance convergence with local Lipschitz control. Properness
and the existing first-order and whole-marked-band hypotheses
are still used for the cone, quotient exclusion and both complete
marks. The cut costs follow from the existing comparison, rather
than from the polar moment or the scalar volume profile alone.
The proof supplies neither the polar moment on arbitrary
surviving sources nor the requisite compact physical embeddings.
[Inherited physical collar and cap argument](../manuscript/anchored_physical_shell.tex)
