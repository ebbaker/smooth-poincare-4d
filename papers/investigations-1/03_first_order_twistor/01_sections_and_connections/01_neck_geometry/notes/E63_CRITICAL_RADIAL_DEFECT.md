# E63c · Critical radial flux and forward polar Jacobians

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded execution MASTER-E63c v1 under NECK-B04/B05.
The dispatch specified GPT-6.2 Sol at ultra effort. Actual serving model
and effort are unavailable. The frozen neck and master transitive TeX
bundle SHA-256 prefixes are 3ff701729d047bb6 and 8442d18fd7d4e142.
The physical flux section and master complete-limits section SHA-256
prefixes are 6f75a9186a6442c9 and c0bf42fb00527d78d.
This is a conditional analytical result and a scoped radial example.
[Input receipt](../../../../../master/research-progress/handoffs/E59_E62_SPECTRAL_WINDOWS_20261125.md)
· [E59 finite flux proof](../manuscript/physical_ricci_flux.tex)
· [E60 check](../reviews/E60_LOG_SHELLS.md)

**Result.** Critical \(L^2\) radial Ricci control suffices for logarithmic
selection of a vanishing full radial defect if there is a uniform weighted
forward bound on the polar Jacobian ratios. The proof allows cut loci
and needs no initial mean-curvature trace, pointwise Ricci lower
bound or supercritical curvature bound. The available physical
noncollapse does not give the directional estimate by the same calculation.
A rooted round-fiber warped example shows a failure of the corresponding
one-sided comparison with small critical radial Ricci energy alone. Its
tangential curvature and scalar exclude it from the actual source class.

## Physical scale, Jacobians and a finite critical estimate

Use smooth positive volume-one Yamabe metrics \(g_i\) on a fixed closed
oriented Riemannian homotopy four-sphere, in the separated-quantile band
\(e_i=E_+(g_i)\to I^+(M)<8\pi^2\).
At the attaining center \(x_i\) the full smaller physical ball of
radius \(a_i\) has charge \(\theta e_i\) and the full exterior of radius
\(b_i\) has charge at least \(e_i/2\), where
\(0<\theta<1/2\) and \(a_i/b_i\to0\). The charge is measured by
\(|W^+|_{\rm HS}^2dV_{g_i}\) in the fixed orientation. We use
the source diameter and full-curvature bounds, including
\(\int|\mathrm{Rm}|_{\rm tens}^2dV_{g_i}\le\Lambda\).
The scalar is positive and constant, giving the physical all-center
small-ball lower bound from E53. All radial estimates below use \(g_i\)
or a constant rescaling of it. [Source block](E53_PHYSICAL_SHELL.md)

For any one smooth source, let \(t=d_g(x,\cdot)\), \(l=\log t\),
and \(\Theta_l\) be the unit directions at \(x\) surviving strictly
before their cut time at \(e^l\). On these directions use polar
Jacobian \(J(t,\vartheta)\), the coarea density
\(p(l,\vartheta)=J(e^l,\vartheta)e^{-3l}\), and
\[
 w=t\Delta_g t-3,\qquad
 f=e^{2l}\big(\mathrm{Ric}_g(\partial_t,\partial_t)\big)_-.
\]
Set \(p=0\) at and after the cut. Every surviving direction at \(l\)
survives all earlier radii. On the smooth segment
\[
 (\log p)'=w,\qquad w'\le-w-w^2/3+f .
\]
Here \(m=\Delta_g t\) solves \(m'=-|S|^2-\mathrm{Ric}_{tt}\)
in the \(t\) variable and \(|S|^2\ge m^2/3\). The critical
identity on a logarithmic interval \(I\) is
\[
 \int_I \int_{\Theta_l} f(l,\vartheta)^2p(l,\vartheta)\,d\vartheta\,dl
 =\int_{\{\,\log d_g(x,\cdot)\in I\,\}}
        \big(\mathrm{Ric}_g(\partial_t,\partial_t)\big)_-^2\,dV_g .
 \tag{1}
\]
The cut locus is volume-null. No line-wise unweighted
\(L^2\) hypothesis is used.

For \(s<l\) and \(\vartheta\in\Theta_l\), integrate
\(w'+w\le f\) backwards from \(l\), then integrate in the
starting time from \(s\) to \(l\). Since
\(\int_s^l w(u)\,du=\log(p(l,\vartheta)/p(s,\vartheta))\),
\[
 w(l,\vartheta)_+\le
 \frac{\log^+(p(l,\vartheta)/p(s,\vartheta))}{e^{l-s}-1}
 +\int_s^l \frac{e^{u-s}-1}{e^{l-s}-1}f(u,\vartheta)\,du .
 \tag{2}
\]
Thus directional growth carries the initial data. Write
\[
 \begin{aligned}
 P(l)&=\int_{\Theta_l}p(l,\vartheta)\,d\vartheta,\\
 Q(s,l)&=\int_{\Theta_l}\frac{p(l,\vartheta)^2}{p(s,\vartheta)}\,d\vartheta,
 &F(l)&=\int_{\Theta_l}f(l,\vartheta)^2p(l,\vartheta)\,d\vartheta,\\
 G(l)&=\int_{\Theta_l}w(l,\vartheta)_+p(l,\vartheta)\,d\vartheta .
 \end{aligned}
\]
Using \(\log^+ z\le\log(1+z)\), Jensen with
\(p(l,\vartheta)d\vartheta/P(l)\), and Cauchy–Schwarz with
the earlier weight \(p(u,\vartheta)\), gives
\[
 G(l)\le
 \frac{P(l)\log(1+Q(s,l)/P(l))}{e^{l-s}-1}
 +\int_s^l \frac{e^{u-s}-1}{e^{l-s}-1}\sqrt{F(u)Q(u,l)}\,du .
 \tag{3}
\]
When \(P(l)=0\) read the first term as zero. Equation (3) is a finite
one-sided radial defect test. It makes the loss from small
earlier Jacobians explicit.

## A sufficient polar condition and the selected mark

Suppose on physical logarithmic subintervals \([A_i,B_i]\) between
the two quantiles, \(T_i=B_i-A_i\to\infty\), that
\[
 Q_i(s,l)\le C e^{2\gamma(l-s)}
 \quad(A_i\le s<l\le B_i),\qquad C<\infty,\quad 0\le\gamma<1,
 \tag{4}
\]
with the constants fixed through the sequence. Fatou as
\(s\uparrow l\) gives \(P_i(l)\le C\). For \(l-s\ge1\), the
first term in (3) is at most \(C'(1+l-s)e^{-(l-s)}\), since
\(x\log(1+a/x)\) increases in \(x>0\). The kernel in the
second term is bounded by \(C'e^{-(1-\gamma)(l-u)}\)
after including \(\sqrt{Q_i(u,l)}\). Set \(s=A_i\) and let
\(J_i\) be the middle half of the logarithmic interval. Fubini
and (1) give
\[
 \int_{J_i}G_i(l)\,dl
 \le C''\left(1+\sqrt{T_i\int_{A_i}^{B_i}F_i(l)\,dl}\right)
 \le C'''(1+\sqrt{T_i}).
 \tag{5}
\]
This only requires bounded critical energy on the wide block.
If that energy tends to zero, the same kernel also gives local
pointwise-in-radius smallness of \(G_i\) well inside the block.

There is an exact cut correction to the normalized area law. For
each angular direction, \(p(l,\vartheta)\) is smooth up to its
cut, followed by zero, so its distributional derivative is
\(w p\,dl\) before cut minus the terminal nonnegative jump
measure. A direction conjugate at the cut has zero polar
Jacobian there. On a compact positive-radius interval the
individual \(J\) and its derivative are bounded uniformly in
direction by smooth geodesic variation on that source. Integration
over directions gives \(DP_i=(\int w p\,d\vartheta)dl-d\kappa_i\),
where \(\kappa_i\) is the pushforward of the nonnegative terminal
jump weights by the logarithmic cut time. In particular
\((DP_i)^+(J_i)\le\int_{J_i}G_i\) and
\(|DP_i|(J_i)\le C+2\int_{J_i}G_i\), choosing the appropriate
one-sided endpoint value of \(P_i\). This last step uses
\(P_i\ge0\).

Divide \(J_i\) into \(N_i=\lfloor T_i^{3/4}\rfloor\) open
adjacent intervals of equal length. The sum of the physical
full-curvature integrals, \(\int G_i\), and \(|DP_i|\) over
those intervals is \(O(1+\sqrt{T_i})\). Choose one where the
sum is \(O(T_i^{-1/4})\) and let \(\rho_i\) be the exponential
of its midpoint. Its logarithmic width is of order
\(T_i^{1/4}\), and \(a_i/\rho_i,\rho_i/b_i\le e^{-T_i/4}\).
Bounded diameter gives \(\rho_i\to0\).

Put \(h_i=\rho_i^{-2}g_i\), \(d_i=d_{h_i}(x_i,\cdot)\),
\(V_i(t)=\vol_{h_i}\{d_i<t\}\), and \(\mu_i=4dV_{h_i}
-\Delta_{h_i}(d_i^2/2)\). For fixed \([a,b]\subset(0,\infty)\)
the volume profile on \([a,b]\) satisfies
\[
 V_i(t)=C_i+\tfrac14P_i(l_i)t^4
       +O_{a,b}\big(|DP_i|(\text{selected interval})\big),
 \qquad l_i=\log\rho_i .
\]
This follows by integrating \(u^3P_i(l_i+\log u)\) from
\(a\) to \(t\), with \(C_i=V_i(a)-P_i(l_i)a^4/4\).
Use a one-sided representative of \(P_i\) for this coefficient.
The cut-locus part of \(\mu_i\) is nonnegative, whereas its
smooth part is \(-w\,dV_{h_i}\). Therefore, on the same strip,
\[
 \mu_i^-(\{a<d_i<b\})=
 \int_{\log a}^{\log b} e^{4u}G_i(l_i+u)\,du=o(1).
\]
The finite estimate of E59 gives \(|\mu_i|\to0\) on each fixed
compact normalized interior strip. This controls nonradial
tests and permits omitted image volume. The physical lower
volume bound, if used for positivity of the selected profile,
applies to a small ball centered on a radial segment reaching
the median exterior and lying wholly in a fixed normalized
annulus. It is not needed for the total variation derivation.
[Cut-locus Laplacian, Mantegazza–Mascellani–Uraltsev, Corollaries 2.11–2.12](https://msp.org/pjm/2014/270-1/pjm-v270-n1-p07-p.pdf)
· [E59 finite estimate](../manuscript/physical_ricci_flux.tex)

The proper flat comparison remains a separate premise at this
same \(\rho_i\). It has an oriented boundaryless smooth
flat four-manifold with proper continuous distance limit into
\((1/16,2L)\). There are oriented smooth source embeddings on
neighborhoods of every compact subset, with physical metric
convergence in \(C^0\cap W^{1,4}\) and locally uniform convergence
of the transported physical distance. One embedding includes the entire
buffered closed strip about \([1/8,L]\). Its transported
bounded tests inherit the full defect bound even if the image
omits source volume. The E53 unshifted equation gives the
flat cone, the quotient product test excludes a nontrivial
link, and the anchored-width and first-order cap criteria
mark both complete chiral sets off the closed trim. In the
minimizing band this is the same strict fixed-type contradiction.
No Ricci, distance, volume or first-order norm is transferred
from a variable conformal gauge. [E53 radial and marking criteria](../manuscript/anchored_physical_shell.tex)

## What the polar bound adds

Both sufficient Ricci controls of E59 imply (4) with \(\gamma=0\)
on their stated windows. Centered comparison bounds the forward
ratio \(p(l)/p(s)\) along surviving rays and \(P(l)\) itself.
Protected Ricci comparison makes the shifted area ratio
nonincreasing. Its measured inner transition bounds
\(P(l)\) at later radii, and the protected forward bound follows
from the shifted model and the fixed margin \(t\ge8s_i\).
Conversely, (4) permits negative Ricci spikes. For example, set
\(u_i(t)=t+\rho_i\epsilon_i^{7/4}
\eta((t-\rho_i)/(\rho_i\epsilon_i))\) in a rooted
round-fiber warped metric, with \(\eta\) smooth of compact
support in \((-1,1)\), \(\eta''>0\) somewhere and
\(\epsilon_i\downarrow0\). The polar densities are uniformly
comparable to one. The negative radial Ricci at some points
is of order \(\rho_i^{-2}\epsilon_i^{-1/4}\) and the full
critical curvature integral on its support is \(O(\epsilon_i^{1/2})\).
The transverse curvatures have size
\(O(\rho_i^{-2}\epsilon_i^{3/4})\) there. This is a
bilipschitz Euclidean geometric example, with a uniform
all-center ball floor. It tests the strict difference between
pointwise and Jacobian input and supplies no constant-scalar
Yamabe minimizing sequence.

More significantly, one cannot remove the earlier Jacobian
weight from (3) by critical radial Ricci alone. Here is a smooth
round-fiber model with a genuine radial distance and a nonvanishing
defect. On a fixed physical interval around \(t=1\), put
\(g=dt^2+u_N(t)^2\gamma_{\rm rd}\). Begin with
\(u_N=\varepsilon_N=N^{-2}e^{-N}\). Start an increasing
transition at \(t=1\), going first from slope zero to
\(1/N\) at a radius \(u_*\asymp\varepsilon_N\).
A fixed smooth monotone profile in
\((t-1)/(N\varepsilon_N)\), affine near its right endpoint,
does this with
\(\int u_N(u_N'')^2dt=O(N^{-3})\). Next prescribe
the positive slope \(v(u)=u_N'(t)\) up to \(u_1=N^{-2}\) by
\[
 v(u)^{3/2}=N^{-3/2}+(1-N^{-3/2})
   \chi\!\left(\frac{\log(u/u_*)}{\log(u_1/u_*)}\right),
\]
where \(\chi\) increases smoothly from zero to one, flat
near both endpoints. Integrate \(dt=du/v\). This phase
takes time at most \(Nu_1=1/N\). Its radial critical cost
is small by the exact calculation
\[
 \int u_N(u_N'')^2\,dt
 =\frac49\int\left|\frac{d}{d\log u}\big(v(u)^{3/2}\big)\right|^2
             d\log u
 =O(1/N).
\]
Continue with \(u_N'=1\). Attach a smooth pole at the left
with \(u_N(t)=t\) near zero and match the constant part well
before \(t=1/2\). Positivity of \(u_N\) away from the pole and the
length lower bound by radial variation make \(t\) its actual
distance. The exterior can continue with unit slope. On
\([1/2,2]\) the negative radial Ricci critical integral is
\(9\vol(S^3)\int (u_N''{}_+)^2 u_N\,dt=O(1/N)\). On
\([3/2,2]\), \(u_N\to t-1\), where
\(w=3tu_N'/u_N-3\to3/(t-1)\). The negative part of the
squared-distance defect has a fixed positive mass there.
At a fixed earlier radius in \((1/2,1)\), \(p(s)\to0\)
on every angle and \(Q(s,l)\to\infty\) for any fixed
\(e^l\in[3/2,2]\).

The plateau has transverse sectional curvature
\(u_N^{-2}\). Its full critical integral diverges and
all-center noncollapse fails there. The scalar is variable.
On the measured outer strip the metric is flat with
ordinary local noncollapse. This example isolates the
critical radial comparison failure. It does not show
failure of the physical full-curvature, constant-scalar,
Yamabe or separated-charge hypotheses.

In the round-fiber ansatz the exact scalar equation itself
restricts such an example. For a constant scalar \(R=12k\),
the radial scalar identity
\(R=6[(1-(u')^2)/u^2-u''/u]\) makes
\(u^2(1-(u')^2-ku^2)\) constant on any connected positive-radius
strip. A smooth pole has zero value of this first integral.
Thus a globally smooth rooted round-fiber metric of constant
positive scalar is the spherical polar model on its uncut
component. A nonzero first-integral parameter can occur
on a separately specified protected strip.

In the usual polar multiplier for
\(\psi=(\Delta t-3/t)_+\), the critical identity has the same
obstruction: \((\psi^3J)'+3\psi^3J/t\le3\rho\psi^2J\),
where \(\rho=(\mathrm{Ric}_{tt})_-\). The \(\psi^4J\)
coercive term cancels exactly. Cauchy–Schwarz on the right
would need separately controlled \(\int\psi^4J\).
Petersen–Wei's supercritical estimate cannot be substituted
at exponent two. The tangential full-curvature bound rules
out the displayed warped geometry, but we found no argument
from the available physical hypotheses to (4), a comparable
bound on (3), or the compact flat embeddings.
[Petersen–Wei, §2](https://www.math.ucla.edu/~petersen/Papers/28.pdf)
· [Petersen–Wei critical coefficient in Dai–Wei–Zhang, Theorem 2.1](https://web.math.ucsb.edu/~wei/paper/Dai-Wei-Zhang.pdf)
