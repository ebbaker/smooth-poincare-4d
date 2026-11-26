# E51 local trace of the physical Bour gradient

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and effort were unavailable. Input is
the E50 curvature-commuted gradient and crossed Ricci identity at
`1c81a3048c8c21a4c1d1fb23db72f37168a15ca5`, with the working E50
general-scalar component formula. The calculation uses a smooth
boundaryless Riemannian four-manifold. Orientation, compactness and
Euler data play no role in the pointwise identity.

For \(R=R_g\), \(Q=\operatorname{Ric}_g\), and
\(\Delta_g=\operatorname{tr}_g\nabla^2\), choose an orthonormal frame
at the point. Metric compatibility identifies the trace of
\(\nabla^2Q\) in its \(Q\) slots with \(\nabla^2R\). The two traces
can be performed in either order, so
\(\operatorname{tr}_g(\operatorname{tr}_g\nabla^2Q)=\Delta_g R\).
The trace of the Hamilton curvature–Ricci contraction is \(|Q|^2\).
To check its sign, trace the E50 crossed Ricci commutator. Its
first and second double sums agree by renaming the two trace axes
and using symmetry of the last two Ricci slots. The trace of the
remaining Ricci square is the ordinary tensor square.

Let \(G_p\) denote the actual covariant E50 gradient. Tracing its
commuted expression gives
\[
\begin{aligned}
\operatorname{tr}_g G_p
={}&
\left[-\frac12+\frac{p+2}{12}
             -\frac{4(p-1)}{12}\right]\Delta_g R
-|Q|^2-\frac{p-4}{12}R^2\\
&+2\left(\frac{|Q|^2}{2}+\frac{p-4}{24}R^2\right)
=-\frac p4\,\Delta_g R .
\end{aligned}
\]
Here \(\Delta_g\) is nonnegative at a local minimum of a scalar.
The coefficient refers to the gradient itself. For the physical
velocity \(-2G_p\), the corresponding trace is
\((p/2)\Delta_g R\).
[E50 component formula](../../../SmoothPoincare/Variational/BourGradientComparison.lean)
[Bour v1, §3](https://arxiv.org/html/1012.0342v1#S3)

Positive-parameter physical stationarity gives \(\Delta_g R=0\)
pointwise, including on an outward noncompact model where the local
stationary gradient vanishes. On a connected closed four-manifold
the harmonic scalar is constant by the checked Green identity.
At \(p=0\) the gradient trace vanishes for every metric and supplies
no scalar equation. The noncompact positive-parameter conclusion is
harmonicity.
[Checked pointwise trace and stationarity](../../../SmoothPoincare/Variational/BourStationaryTrace.lean)
