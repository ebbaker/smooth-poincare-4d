# SP4-CME-E22 — The Lorentz heat estimate for the round strain bundle

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This finite calculation follows [B19][decision] and the
[frozen request][request]. Input identities and source inspection
are recorded in the [return][return].

Let \(g_K\) be the round metric of sectional curvature \(K>0\)
on the real oriented standard \(S^4\), and \(E=\Lambda^+_{g_K}\)
with normalized internal metric and the round chiral connection
\(A_0\). Use the manuscript's \(F_0=-K\Sigma\), with
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{g_K}\).
The real rank-twenty bundle
\(\mathcal V=T^*S^4\otimes\operatorname{Sym}^2_0(E)\)
has the metric connection \(\nabla\) induced by \(g_K,A_0\).
The norms on its fibers use \(g_K\) on the covector slot and
Frobenius norm on the internal slot. The covariant gradient has
the corresponding full tensor norm with one additional base slot.
Set \(\Delta_{\mathcal V}=\nabla^a\nabla_a=-\nabla^*\nabla\) and
\[
(L_K T)_c=4(\Delta_{\mathcal V}T)_c-36KT_c
       +8[\operatorname{ad}((F_0)_{ca}),T^a] .
\]
For any smooth section \(T_0\), not necessarily an attained
gradient strain, put \(U_K(t)=e^{tL_K}T_0\) and
\[
N_K=\int_0^{\operatorname{Vol}(g_K)}
             s^{1/4}(|T_0|_{g_K})^*(s)\,\frac{ds}{s},
\]
using rearrangement for \(dV_{g_K}\). This is the E21
\(L^{4,1}\) convention on a finite-volume space. Then
\[
\boxed{\int_0^\infty\!
\left(\|\nabla U_K(t)\|_{\infty,g_K}
                  +\|U_K(t)\|_{\infty,g_K}^2\right)dt
\leq C(N_K+N_K^2),}
\]
with \(C\) independent of \(K\) and \(T_0\).

## Homothety and the parallel reaction

Write \(g_1=K g_K\) for the unit round representative.
The positive Hodge subbundle is unchanged as a subbundle of
two-forms. Identify its unit fiber metrics by sending a
\(g_1\)-normalized two-form to \(K^{-1}\) times that form for
\(g_K\). This is parallel because the Levi–Civita connection
does not change under constant homothety. In the internal
identification, \(\Sigma_K=K^{-1}\Sigma_1\) and the chiral
curvature two-form \(F_{0,K}=-K\Sigma_K=F_{0,1}\).
Raising the contracted covector index and taking the rough
Laplacian each supplies a factor \(K\). Hence \(L_K=K L_1\),
and \(U_K(t)=U_1(Kt)\) as sections under this identification.

A one-form norm multiplies by \(K^{1/2}\) under
\(g_1\mapsto K^{-1}g_1\), and the derivative norm of a one-form
multiplies by \(K\). The two time integrands each gain the
factor \(K\), canceled by \(d(Kt)=K\,dt\). The measure scales
by \(K^{-2}\), so
\[
(|T_0|_{g_K})^*(s)
=K^{1/2}(|T_0|_{g_1})^*(K^2s),\qquad
N_K=N_1.
\]
It suffices to prove the estimate at \(K=1\).

In the following all norms, distances, volumes and operators
are for \(g_1\). Let \(P=\nabla^*\nabla\geq0\). The
zeroth-order reaction \(Z=L_1+4P\) is self-adjoint with
eigenvalues \(-52\) and \(-12\) by [E16A][reaction].
It is parallel, since \(F_0=-\Sigma\) is parallel for the
joint connection, raising an index commutes with the connection,
and the internal bracket and commutator are parallel.
Thus \(P\) commutes with \(Z\) and \(e^{tZ}\), and
\[
e^{tL_1}=e^{tZ}e^{-4tP},\qquad
\|e^{tZ}\|_{\mathrm{op}}\leq e^{-12t}.
\]
One can check the product formula directly on smooth
sections by differentiating it. The resulting initial-value
solution is unique by the \(L^2\) energy identity, since
both \(4P\) and \(-Z\) are nonnegative.
The covariant derivative of \(e^{tZ}\) is zero, so this
factor does not add a term when differentiating a kernel
in \(x\).

## The short-time covariant kernel bounds

Let \(p_\sigma(x,y)\) be the connection heat kernel of
\(e^{-\sigma P}\). The compact boundaryless unit sphere and
the smooth metric bundle with compatible connection give a
formally self-adjoint Laplace-type operator with principal
part \(-g_1^{ij}\partial_i\partial_j\) times the identity.
Integration by parts gives symmetry and nonnegativity.
Ludewig's Theorem 1.1 gives the differentiated Gaussian
quotient expansion on compact subsets away from the cut locus,
and Theorem 3.5 gives Gaussian bounds with a larger time
power globally for formally self-adjoint Laplace-type
operators. These apply to \(P\) with the round covariant
derivative in \(x\). One may complexify the bundle and
restrict its real heat operator if choosing a Hermitian
bundle convention. [Ludewig, Theorem 1.1, p. 372,
§2, pp. 374–375, and Theorem 3.5, p. 382][ludewig].

For \(r=d_{g_1}(x,y)\leq\pi/2\), the pairs form a compact
subset of the complement of the cut locus, because the
unit sphere's cut points are antipodal. Apply Theorem 1.1
with expansion order zero and zero or one covariant
\(x\) derivative, for \(0<\sigma\leq4\).
With \(G_\sigma=(4\pi\sigma)^{-2}e^{-r^2/(4\sigma)}\)
this yields bounded \(p_\sigma/G_\sigma\) and bounded
\(\nabla_x(p_\sigma/G_\sigma)\) there. The smooth leading
coefficient is bounded with its derivative on that compact
set. Since \(|\nabla_x r^2|=2r\), differentiating gives
\[
|p_\sigma|\leq C\sigma^{-2}e^{-r^2/(4\sigma)},\qquad
|\nabla_x p_\sigma|
\leq C\sigma^{-2}(1+r/\sigma)e^{-r^2/(4\sigma)}
\leq C'\sigma^{-5/2}e^{-r^2/(8\sigma)} .
\]
The final inequality uses boundedness of
\((r/\sqrt{\sigma})e^{-r^2/(8\sigma)}\) and \(\sigma\leq4\).

For \(r\geq\pi/2\), Theorem 3.5 in dimension four gives
\(C\sigma^{-5-\ell}e^{-r^2/(4\sigma)}\) for \(\ell=0,1\)
\(x\) derivatives and no other derivatives.
Here \(e^{-r^2/(8\sigma)}\leq e^{-\pi^2/(32\sigma)}\)
absorbs the extra power
\(\sigma^{-(3+\ell/2)}\) on \(0<\sigma\leq4\).
The combined estimates, with \(\sigma=4t\), are therefore
\[
\|p_{4t}(x,y)\|_{\rm op}\leq C t^{-2}e^{-r^2/(32t)},\qquad
\|\nabla_xp_{4t}(x,y)\|_{\rm op}
      \leq C t^{-5/2}e^{-r^2/(32t)},\qquad 0<t\leq1.
\]
The first operator norm is from \(\mathcal V_y\) to
\(\mathcal V_x\), and the second from \(\mathcal V_y\)
to \(T_x^*S^4\otimes\mathcal V_x\). The source's tensor
norm bounds these map norms using the fixed bundle metrics.
The same bounds hold for the kernel of \(e^{tL_1}\),
since \(e^{tZ}\) is parallel and has norm at most one.
The gradient estimate uses the covariant bundle heat kernel
theorems directly.

## Finite-volume rearrangement and the small-time integral

Write \(V_0=8\pi^2/3\), \(v_4=\pi^2/2\), and
\(f=|T_0|_{g_1}\). The round polar volume
\(\operatorname{Vol}(B_\rho(x))\leq v_4\rho^4\) follows
by bounding the radial density \(\sin^3 r\) by \(r^3\).
For each \(x,t\), use
\(\rho=(s/v_4)^{1/4}\) to bound the measure of the
superlevel set of the Gaussian majorant in the \(y\) variable
by \(s\). Thus the two rearrangements above are bounded
by \(Ct^{-2}e^{-\alpha(s)/t}\) and
\(Ct^{-5/2}e^{-\alpha(s)/t}\), with
\(\alpha(s)=(s/v_4)^{1/2}/32\), \(0<s<V_0\).

The bundle integral and its spatial derivative are bounded
by the scalar pairings of those kernel norms with \(f\).
By the layer-cake argument of [E21][flat], the measure of
each intersection of superlevel sets is at most the minimum
of their separate measures, which the rearranged intervals
realize. The bounds are uniform in \(x\), so the spatial
suprema are bounded for each \(t\leq1\) by the actual
rearranged integrals,
\[
\begin{aligned}
\|U_1(t)\|_\infty
&\leq C\int_0^{V_0} f^*(s)t^{-2}e^{-\alpha(s)/t}\,ds,\\
\|\nabla U_1(t)\|_\infty
&\leq C\int_0^{V_0} f^*(s)t^{-5/2}e^{-\alpha(s)/t}\,ds.
\end{aligned}
\]
All integrands in these bounds are nonnegative. For any
\(\alpha>0\),
\(\int_0^1t^{-5/2}e^{-\alpha/t}\,dt
\leq \Gamma(3/2)\alpha^{-3/2}\);
this follows from the substitution \(z=\alpha/t\).
Tonelli then bounds both
\(\int_0^1\|\nabla U_1\|_\infty\,dt\) and
\(\int_0^1 t^{-1/2}\|U_1\|_\infty\,dt\)
by \(C\int_0^{V_0}s^{-3/4}f^*(s)\,ds=C N_1\).
The pointwise inequality
\[
t^{-3/2}e^{-\alpha/t}
\leq \alpha^{-3/2}(3/(2\mathrm e))^{3/2}
\]
bounds \(\sup_{0<t\leq1}\sqrt t\,\|U_1(t)\|_\infty\)
by \(C N_1\). Multiplying it by the weighted time
integral just obtained gives
\(\int_0^1\|U_1\|_\infty^2\,dt\leq C N_1^2\).
All time integrations follow the uniform spatial estimates.

## Large times and scope

For \(u(t)=e^{-4tP}u_0\) and
\(\varphi_\epsilon=(|u|^2+\epsilon^2)^{1/2}\), the
metric connection product rule gives
\[
(\partial_t-4\Delta_{g_1})\varphi_\epsilon
=-4|\nabla u|^2/\varphi_\epsilon
  +4|\langle u,\nabla u\rangle|^2/\varphi_\epsilon^3
\leq0 .
\]
Integrating over the closed sphere and taking
\(\epsilon\downarrow0\) proves \(L^1\) contraction for the
connection heat operator. This supplies the needed connection
heat domination without a gradient comparison with the scalar
heat kernel. At \(t=1\), the established kernel and gradient
bounds show that \(e^{-4P}\) maps \(L^1\) to \(L^\infty\)
with bounded covariant gradient into \(L^\infty\).
For \(t\geq1\) factor \(U_1(t)=
e^{tZ}e^{-4P}e^{-4(t-1)P}T_0\).
Both \(\|U_1(t)\|_\infty\) and
\(\|\nabla U_1(t)\|_\infty\) are then bounded by
\(Ce^{-12t}\|T_0\|_1\).
Since \(\int_0^{V_0} f^*(s)\,ds\leq V_0^{3/4}N_1\),
the late gradient and squared solution integrals are bounded
by \(CN_1\) and \(CN_1^2\), respectively.
Combining the time ranges and rescaling proves the estimate
on the entire rank-twenty round bundle.

This is the actual round linear strain operator, with its
parallel reaction and covariant derivative. Variable principal
matrix, moving metric, gauge, and nonlinear compatibility-source
control remain separate in the full evolution.

[decision]: ../brainstorm/notes/B19_ENDPOINT_TRANSFER_DECISION_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E22_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E22_RETURN_v1.md
[reaction]: 18A_ROUND_STRAIN_REACTION_20261122.md
[flat]: 21_LORENTZ_HEAT_BENCHMARK_20261122.md
[ludewig]: https://pure.mpg.de/rest/items/item_3086319_4/component/file_3135346/content
