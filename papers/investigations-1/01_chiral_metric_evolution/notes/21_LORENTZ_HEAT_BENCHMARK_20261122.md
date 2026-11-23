# SP4-CME-E21 — Flat heat estimates for the temporal strain norm

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This finite model calculation follows [B18][decision] and the
[frozen request][request]. Input identities are in the [return][return].

Let \(U_0\in C_c^\infty(\mathbb R^4;\mathbb R^{20})\) and
let \(U\) be the heat semigroup solution of
\[
\partial_t U=4\Delta_{\mathbb R^4}U-12K U,\qquad K\geq0 .
\]
Use Lebesgue measure, the Euclidean vector norm and the full
Euclidean tensor norm on \(\nabla U\). Write \(f=|U_0|\)
and \(f^*(s)\) for its decreasing rearrangement. Use the
[E17 convention][spatial]
\[
\|U_0\|_{4,1}=\|f\|_{4,1}
=\int_0^\infty s^{1/4} f^*(s)\,\frac{ds}{s}.
\]
It is finite because \(f\) is bounded and compactly supported.
The result is
\[
\int_0^\infty\!\left(\|\nabla U(t)\|_\infty+
                            \|U(t)\|_\infty^2\right)dt
\leq C\bigl(\|U_0\|_{4,1}+\|U_0\|_{4,1}^2\bigr)
\]
with \(C\) independent of \(K\) and \(U_0\).

## Kernel bounds before the time integral

The componentwise heat representation is
\[
U(t,x)=e^{-12Kt}\int_{\mathbb R^4}H_t(x-y)U_0(y)\,dy,
\qquad H_t(z)=(16\pi t)^{-2}e^{-|z|^2/(16t)} .
\]
For \(t>0\) differentiation in \(x\) uses the gradient of
the Gaussian inside the integral. This is valid for smooth
compactly supported data. The formula solves the stated equation
and attains its data by the Gaussian approximate identity.
The vector triangle inequality gives
\(|U(t,x)|\leq (H_t*f)(x)\) after dropping the factor
\(e^{-12Kt}\leq1\). The gradient integrand is the tensor
\(\nabla H_t(x-y)\otimes U_0(y)\), of norm
\(|\nabla H_t(x-y)|f(y)\), so
\(|\nabla U(t,x)|\leq (|\nabla H_t|*f)(x)\).

Put \(a=(16\pi)^{-2}\) and \(b=a/(2\sqrt{\mathrm e})\),
where \(\mathrm e=\exp(1)\).
With \(r=|z|\), the gradient satisfies
\[
|\nabla H_t(z)|=\frac{r}{8t}a\,t^{-2}e^{-r^2/(16t)}
\leq J_t(z):=b\,t^{-5/2}e^{-r^2/(32t)} .
\]
Indeed the maximum of \(\rho e^{-\rho^2/32}\) over
\(\rho\geq0\) is \(4e^{-1/2}\), with \(\rho=r/\sqrt t\).
The majorant \(J_t\) is radial decreasing.

For any nonnegative kernel \(L_t\) equal to \(H_t\) or \(J_t\),
the rearrangement inequality
\[
\int_{\mathbb R^4}L_t(x-y)f(y)\,dy
\leq\int_0^\infty (L_t)^*(s)f^*(s)\,ds
\]
is uniform in \(x\). To see it directly, use the layer-cake
formula for the product. The intersection measures of the
translated kernel and data superlevel sets are bounded by the
minimum of their measures. Rearrangement replaces the sets by
intervals beginning at zero whose intersection realizes that
minimum. Tonelli applies to these nonnegative integrands.

Let \(v_4=\pi^2/2\) be the volume of the Euclidean unit
four-ball. For \(s>0\), \((s/v_4)^{1/4}\) is the radius of a
ball of volume \(s\). Thus with
\(\alpha(s)=(s/v_4)^{1/2}/16\) and
\(\beta(s)=(s/v_4)^{1/2}/32\),
\[
H_t^*(s)=a\,t^{-2}e^{-\alpha(s)/t},\qquad
J_t^*(s)=b\,t^{-5/2}e^{-\beta(s)/t}.
\]
Taking spatial suprema in the preceding uniform estimates gives
\[
\|U(t)\|_\infty\leq \int_0^\infty f^*(s)H_t^*(s)\,ds,\qquad
\|\nabla U(t)\|_\infty\leq \int_0^\infty f^*(s)J_t^*(s)\,ds .
\tag{1}
\]
These are pointwise bounds in time on the spatial suprema.
The suprema are measurable, for example by spatial continuity
and restricting to countable dense spatial points.

## Time integration and the squared supremum

For each \(\gamma>0\), changing variables \(z=\gamma/t\)
gives
\[
\int_0^\infty t^{-5/2}e^{-\gamma/t}\,dt
=\gamma^{-3/2}\int_0^\infty z^{1/2}e^{-z}\,dz
=\gamma^{-3/2}\Gamma(3/2).
\]
The integral converges at zero and infinity. With
\(\gamma=\alpha(s)\) or \(\beta(s)\), the \(s\) dependence
is \(s^{-3/4}\). Integrate (1) using Tonelli on the
nonnegative rearrangement integrands to obtain
\[
\begin{aligned}
\int_0^\infty\|\nabla U(t)\|_\infty\,dt
&\leq C_{\nabla}\|f\|_{4,1},
& C_{\nabla}&=b\,\Gamma(3/2)32^{3/2}v_4^{3/4},\\
\int_0^\infty t^{-1/2}\|U(t)\|_\infty\,dt
&\leq C_{\rm int}\|f\|_{4,1},
& C_{\rm int}&=a\,\Gamma(3/2)16^{3/2}v_4^{3/4}.
\end{aligned}
\tag{2}
\]
Thus the resulting time integrals are finite. The endpoint
weight is exactly the one in the defining Lorentz norm.

For each \(t,s>0\),
\[
t^{-3/2}e^{-\alpha(s)/t}
\leq \alpha(s)^{-3/2}\left(\frac{3}{2\mathrm e}\right)^{3/2},
\]
since \(z^{3/2}e^{-z}\) has its maximum at \(z=3/2\).
Use this bound in the \(s\) integral in (1) for every \(t\).
It gives
\[
\sup_{t>0}\sqrt t\,\|U(t)\|_\infty
\leq C_{\rm sup}\|f\|_{4,1},\qquad
C_{\rm sup}=a\left(\frac{3}{2\mathrm e}\right)^{3/2}
                     16^{3/2}v_4^{3/4}.
\]
In particular the time integral of the squared supremum obeys
\[
\int_0^\infty\|U(t)\|_\infty^2\,dt
\leq \left(\sup_{t>0}\sqrt t\,\|U(t)\|_\infty\right)
      \int_0^\infty t^{-1/2}\|U(t)\|_\infty\,dt
\leq C_{\rm sup}C_{\rm int}\,\|f\|_{4,1}^2 .
\]
This is a product of a time supremum and a time integral
of the separate factors in \(\|U(t)\|_\infty^2\).
Together with (2) it proves the claim, for example with
\(C=\max(C_{\nabla},C_{\rm sup}C_{\rm int})\).
The damping factor only improves these estimates, including
for \(K=0\).

## Scaling and the distinction from the geometric equations

Under the critical parabolic rescaling
\(U_\lambda(t,x)=\lambda U(\lambda^2t,\lambda x)\), \(\lambda>0\),
the equation has \(K_\lambda=\lambda^2K\).
The two spatial suprema \(\|\nabla U_\lambda(t)\|_\infty\)
and \(\|U_\lambda(t)\|_\infty^2\) carry the common factor
\(\lambda^2\), canceled by \(dt\) after the change of time.
The rearranged initial norm scales by
\(f_\lambda^*(s)=\lambda f^*(\lambda^4s)\). The substitution
\(r=\lambda^4s\) in the defining integral shows that the
initial Lorentz norm is invariant. This is a joint scaling of
the model family in \(K\), and is a symmetry for fixed \(K=0\).

For comparison the actual differentiated round equation
in E15 uses \(T^{(1)}=\nabla_{A_0}q^{(1)}/2\) on
\(T^*S^4\otimes\operatorname{Sym}^2_0 E\) and is
\[
\partial_tT_c^{(1)}
=4(\Delta_{A_0}T^{(1)})_c-36K T_c^{(1)}
+8[\operatorname{ad}((F_0)_{ca}),(T^{(1)})^a].
\]
Its rough Laplacian uses the round base and chiral
connections, and the curvature action is part of its
linear operator. The flat model uses scalar Euclidean
convolution in a trivial rank-twenty bundle and independent
flat components. The value \(12K\) is a parameter of that
model, not a replacement for the displayed round terms.
[E15 differentiated round equation][round].

A transfer to actual geometry would require heat kernel and
gradient estimates for the corresponding bundle operator,
including its large-time behavior. In the nonlinear flow the
operator has evolving metric and matrix diffusion coefficients,
as well as compatibility constraints and terms involving the
connection. A transfer there would need controlled ellipticity
and geometry, coefficient regularity, a fixed bundle and base
identification or a compatible gauge, and bounds on the
nonlinear terms in the time and spatial norms used for the
evolution. The present result alone gives no bound on E14's
temporal integral for Fine's flow.
[E14 conditional temporal criterion][temporal] ·
[E15 strain symbol and gauge scope][round].

[decision]: ../brainstorm/notes/B18_LORENTZ_HEAT_BRIDGE_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E21_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E21_RETURN_v1.md
[spatial]: 19_LORENTZ_SPATIAL_BENCHMARK_20261122.md
[temporal]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
[round]: 17_STRAIN_EVOLUTION_STRUCTURE_20261122.md
