# Edition 03 independent review of curved replacements and the global Euler current

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. DESC-R08 is a bounded independent execution review. The actual
serving model identifier and reasoning effort are unavailable. The working
intake is `95a4f50eb9ec6e0e98454170279f45a66b000211`.
[Prior readback](ED03_REFERENCE_AND_FLUX_READBACK.md) ·
[Route 06](../../06_physical_scales_and_marked_annuli/research-progress/REGISTER.md) ·
[Route 07](../research-progress/REGISTER.md) ·
[Exact Lean replay](ED03_CURVED_AND_GLOBAL_READBACK.lean)

The latest tracked master, fixed-type companion, and physical-neck sources
remain those at `4b15d52a9301ca6796002774b712fc51a82c09c9`. No new
original-gauge separated comparison window is supplied there. The
protected-window compactness theorem takes the whole buffered band with
bounded rescaled volume, pointwise curvature and vanishing full-curvature
integral on the same scale. The radial defect is an additional requirement
for the marked cut. The modified flow and exact compactness alternatives
use their own gauges and markings.
[Physical-window proposition](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/physical_window.tex) ·
[Scientific assessment](../../../../papers/master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md)

## A curved charged trim with a positive finite saving

Fix any finite depth \(k\ge1\) and a raw trim tolerance \(\eta_W>0\),
and let \(q=2^{-k}\) and \(m=2^k-1\).
Work on the oriented standard sphere with its round unit sectional metric
\(g_{\mathrm{rd}}\). Choose a closed geodesic ball \(B\) of radius
\(r_B<\pi\) with volume greater than \((1-q)\operatorname{Vol}(S^4)\).
The concentric protected ball \(Q\) can be chosen with the exact round
volume relation
\[
\operatorname{Vol}_{g_{\mathrm{rd}}}(B\setminus Q)
     =m\operatorname{Vol}_{g_{\mathrm{rd}}}(V_B),\qquad
V_B=S^4\setminus\operatorname{int}B.
\]
The required volume of \(Q\) is strictly between zero and the volume of
\(B\), so the existence follows from continuity and strict monotonicity
of round ball volume. Use the scaled round exponential marking by the
unit Euclidean ball. Choose a fixed \(w=(n+1)^{-1}>0\) so that the
complete buffered ball is inside this marking and the full annular
trim \(W\) misses \(Q\). The strict margins follow from
\(r_Q<r_B<\pi\). Also require \(24\operatorname{Vol}_{g_{\mathrm{rd}}}(W)
<\eta_W/2\), possible because the round seam is null.

In \(W\cap\operatorname{int}B\) choose \(m\) disjoint equal-radius round
geodesic balls, and in \(W\setminus B\) choose one more of the same
radius. Each is taken with compact closure inside its respective
open region. By transitivity of orientation-preserving round isometries,
the exterior ball's metric perturbation can be transported isometrically
into each of the \(m\) interior balls, including its germ near the
boundary. In a stereographic chart at the exterior ball, use a
nonzero perturbation \(\omega^2\zeta f\,dx_2^2\), with \(f=x_1^2\)
near its center and compactly supported in the ball. There the
unscaled metric has nonzero curvature only in the \(12\) plane,
and both chiral blocks are nonzero. For sufficiently small
\(\zeta>0\), the metric with these copies is \(C^2\)-close to the
round metric, has positive scalar curvature and has sum of the
four raw trim masses less than \(\eta_W\).

Choose a second family with the same isometric multiplicities, one
exterior ball and \(m\) inside \(B\setminus Q\), now with compact
closures away from the full closed trim. Choose the thin width
above so that both open regions have room. On a stereographic
chart of this exterior ball write the round metric as
\(\omega^2\delta\) again. Insert a metric of the form
\[
 \omega^2\bigl(dx_1^2+a_s(x)^2 dx_2^2+dx_3^2+dx_4^2\bigr),\qquad
 a_s=1+s\eta\psi(x)\cos(Nx_1),
\]
where \(0<\eta<1/2\), \(s\in[0,1]\), and \(\psi\) is one on a fixed
interior box and compactly supported in the ball. The affine
coefficient stays positive. On the box, before the common conformal
multiplier, the curvature operator is \(K\) on the surface area
two-form and zero on the other five directions, with
\(K=-\partial_1^2 a_s/a_s\). Each chiral trace-free block has
eigenvalues \(K/3,-K/6,-K/6\) and Hilbert–Schmidt square \(K^2/6\).
The orientation of the chart only assigns the two blocks. Their
integrated densities are conformally invariant. At \(s=1\) the box
therefore has chiral energy bounded below by \(c\,\eta^2 N^4\) for
all sufficiently large \(N\), since \(a_s\) is uniformly bounded
away from zero and the integral of \(\cos^2(Nx_1)\) on the fixed
interval is bounded below.
[Owning warp and wall calculation](../../../../papers/master/01_fixed_type_variational_descent/manuscript/core_variation.tex)

Keep the first family fixed, and let \(h_s\) be the global metric
with this second perturbation in the exterior ball and its copies
in the \(m\) interior balls. Choose any
\(e_*\in(T,2T)\) and then choose \(N\) large enough that
\(E_+(h_1)>e_*\). The first family's amplitude can be chosen so that
\(E_+(h_0)<e_*\). Stop at the first \(s_*\) with
\(E_+(h_{s_*})=e_*\), and set \(h=h_{s_*}\). For the compact smooth
path the first conformal-Laplacian eigenvalue detects the continuous
Yamabe sign. A zero-Yamabe class on this sphere has \(E_+\ge2T\)
by Gauss–Bonnet and signature in its scalar-flat representative.
Thus \(h_s\) and \(h\) are positive up to the stopping time. Both
chiral charges of every perturbed ball at \(s_*>0\) are strictly
positive by the box computation. So is its spectral charge, with
the square of the larger leading eigenvalue as density.

Add a further smooth Weyl perturbation to \(h\) strictly inside \(Q\)
with amplitude positive and sufficiently small, and call the result
\(g\). For example, in a disjoint conformal chart of \(Q\), use the
coefficient \(\delta_{22}+\zeta f\) with \(f=x_1^2\) near its center.
Its chiral blocks at the center are the two nonzero surface-curvature
blocks just computed. Choose \(\zeta\) sufficiently small to keep the
whole removal path below \(2T\), with \(0<S=E_+(g)-e_*<2T-e_*\).
The same wall gives positive Yamabe sign for \(g\) and the path.
The actual native cutoff is one on this perturbation's support and
the two metrics agree off it. The radial affine splice to the
reference \(h\) thus merely removes the \(Q\) perturbation. It equals
\(h\) at its endpoint, fixes both sides of the full trim, and
matches at the original unit seam. Its complete exterior and trim
incur exactly zero increase. The nonzero removed Weyl charge \(S\)
is the same in each sign by zero closed signature and unchanged
exterior. The actual trim is Weyl-charged at both endpoints, with
sum of its four raw masses below \(\eta_W\), and the replacement
metric is curved on the disk.

All four divisions at the stated depth hold exactly for the incoming
metric \(g\). For the two chiral measures, the spectral measure, and the
ordered full-curvature measure, write \(d_\mu\) for the sum of the
changes of mass on the two exterior balls relative to
\(g_{\mathrm{rd}}\). Orientation-preserving isometry gives the same
change on every copy in each family. The
round background has zero Weyl and spectral densities and constant
full curvature square \(24\). Its masses on \(B\setminus Q\) and
\(V_B\) are thus in the ratio \(m:1\) in all four cases. Adding \(m\)
identical increments on \(B\setminus Q\) and one on \(V_B\) preserves
that ratio. The new perturbation in \(Q\) changes neither mass.
The smooth seams are null for all four measures. Consequently
\(\mu(V_B)=q\,\mu(V_Q)\) and \(\mu(V_B)>0\) for every tested measure.
This supplies a finite case in the strict joined energy band and in a
fixed standard smooth type with infimum \(I^+(S^4)=0\). The four
measures are those of the explicitly built metrics. Passing to a
constant-scalar Yamabe representative changes the physical full
curvature measure and need not preserve this equality. A replacement
on the manuscript's nonstandard minimizing sequence needs its own
original-gauge construction and a gain larger than its finite excess.

The matched curved Lean construction takes a nonzero full-curvature
value of the reference as input and outputs nonzero full curvature
at the same marked point. Nonzero Weyl charge is an additional
measurement. With matching metric germs and oriented frames the
signed identities are
\[
E_+(h)=\lambda_g^s(V_B)+\lambda_h^s(B),\qquad
E_+(g)-E_+(h)=\lambda_g^s(B)-\lambda_h^s(B).
\]
Positivity of \(h\) supplies
\(I-\lambda_g^s(V_B)\le\lambda_h^s(B)\). When both the trim and
complete exterior are fixed, the lower bound on the remaining
interior \(B\setminus W\) subtracts the incoming charge of \(B\cap W\),
with coefficient \(+q\) on the protected \(Q\) charge. The common
nonzero trim charge and its zero increase are different terms.
[Matched curved disk](../../../SmoothPoincare/Variational/MatchedCurvedDisk.lean)

For a separate positive cap satisfying
\(E_s(\mathrm{cap})\le\lambda_h^s(V_B)+\delta\), split the complete
retained side into \(V_B\cap W\) and \(V_B\setminus W\).
The two signed charge increases plus \(\delta\) then equal
\(\lambda_h^s(V_B)-\lambda_g^s(V_B)+\delta\). They are at least
\(I-\lambda_g^s(V_B)\), so strict dyadic division gives
\[
 \text{retained trim increase}+\text{remaining exterior drift}+\delta
   > I-q(e-\lambda_g^s(Q))-\epsilon .
\]
For \(I>T\), small fixed \(q\) with \((1-q)I>T\) forces
\(\delta>T\) at late indices when both exterior parts match exactly.
The standard-sphere witness has \(I=0\). Using its exact matched
endpoint as its own cap, the allowance is the already measured
\(\delta=\lambda_h^s(B)=(1-q)e_*\). In particular at depth one
\(\delta=e_*/2<T\). Although zero transition increase is achieved,
the curved fill still contributes its whole disk charge.
[Curved cap allowance](../../../SmoothPoincare/Variational/CurvedCapPrice.lean)

## Conformal curvature and the signed cost

For any positive starting class a smooth logarithmic conformal factor
supported inside the protected inner disk preserves that class and
the metric germs on the full trim and complete closed exterior.
Where the differential of a bump \(u\) is nonzero, the coefficient
\[
 R_g-6t\Delta_g u-6t^2|du|_g^2
\]
has a nonzero quadratic term. Some arbitrarily small nonzero \(t\)
therefore gives nonzero scalar curvature for \(e^{2tu}g\) at that
point. This proves actual nonflatness of the endpoint, and the
metric differs from the input if the chosen bump value at the
marked center is one. The three-factor finite test uses distinct
\(t=a,-a,2a\).

The same conformal path has exactly zero signed chiral saving on
every region. The oriented orthonormal frames scale by \(e^{-tu}\).
The conformal correction to lowered curvature is a metric
Kulkarni–Nomizu term, which gives a scalar matrix in each chiral
compression. Trace removal annihilates it. Both chiral blocks
therefore scale by \(e^{-2tu}\) in the matched frames. The volume
factor \(e^{4tu}\) cancels the square of this change. Positive
homogeneity of leading eigenvalues gives the same conclusion for
the spectral-square density.

An analytic large-parameter test explains the difference between
full curvature and the compactness-relevant signed charges in this
case. In four dimensions the scalar-square measure of the same
conformal family is
\[
 R_{e^{2tu}g}^{\,2}dV_{e^{2tu}g}
       =(R_g-6t\Delta_g u-6t^2|du|_g^2)^2\,dV_g .
\]
The leading coefficient of its integral on a region containing the
support of \(du\) is \(36\int |du|_g^4>0\). The physical full
curvature measure dominates one sixth of this scalar-square
measure. Hence a chosen raw full-curvature side can be increased
without bound, continuously from the initial metric, by supporting
the bump inside that side. The three conformal measures stay
fixed. The small nonflat witness and the exact signed conformal
measure equalities have Lean declarations. This large-parameter
integral argument tests their analytical scope.
[Conformal core](../../../SmoothPoincare/Variational/ConformalCoreReference.lean) ·
[Signed conformal charges](../../../SmoothPoincare/Variational/ConformalChiralCharges.lean)

## The unit-round germ and positivity of a small patch

The native round-core theorem puts a unit-round germ near the marked
center by compactly supported convex interpolation. It transports
the round sectional curvature \(1\) into a nonzero covariant
curvature witness. Both the full trim and the complete closed
exterior stay fixed as metric germs throughout the exact-width
path. Positive definiteness is automatic from the convex
construction. A positive Yamabe sign of this particular path
requires a separate estimate.

There is a per-source positive realization by choosing the
comparison in matched normal coordinates. Let the incoming metric
\(g\) have positive Yamabe constant. Center a small \(g\)-normal
ball at the selected point inside the protected disk and pull the
round germ into those same tangent coordinates. The metric values
and first partial derivatives at the center agree. On the radius
\(r\) ball the difference of coefficients and their first two
derivatives are bounded by \(C r^2, C r, C\), respectively. A
cutoff supported there with derivatives bounded by \(C/r\) and
\(C/r^2\) preserves these scales for every affine parameter.
This bounds the full curvature of the changed patch uniformly.
Its chiral energy costs in either sign are \(O(r^4)\) on that
individual source.

To verify positivity independently of a scalar lower bound at
each point, put \(Q_g(f)=\int(6|df|_g^2+R_g f^2)\,dV_g\).
It bounds \(Y_g\|f\|_{4,g}^2\) and also
\(6\|df\|_{2,g}^2-\|R_g^-\|_{2,g}\|f\|_{4,g}^2\).
A convex combination with weight sufficiently close to one on
the first estimate yields
\(Q_g(f)\ge c\|df\|_{2,g}^2+\delta\|f\|_{4,g}^2\) for
\(c,\delta>0\). The leading term of the interpolated quadratic
form changes by at most \(Cr^2\|df\|_{2,g}^2\), by the uniform
metric and volume comparison. The scalar term changes on the
patch by at most \(Cr^2\|f\|_{4,g}^2\), by Hölder on its
\(O(r^4)\) volume and the uniform curvature bound. Sufficiently
small \(r\) therefore preserves the positive Yamabe sign along
the whole interpolation. This analytical estimate permits a
positive local round-germ insertion on each fixed smooth source.
Its signed curvature cost bound alone does not give strict
decrease or uniform estimates along a minimizing sequence.
[Native unit-round germ](../../../SmoothPoincare/Variational/NativeRoundCore.lean)

## Contraction, divergence and the tested volume

Use the actual ordered frame convention
\(R_{ijab}=g(\mathrm{Rm}(e_i,e_j)e_b,e_a)\), and let
\(D_{ajb}=(\nabla_{e_a}\operatorname{Ric})(e_j,e_b)\). In an oriented
orthonormal frame let \(\varepsilon_{0123}=1\) and
\(\alpha_{ab,j}=D_{ajb}-D_{bja}\). With the ordinary curvature forms
\(\Omega_{ab}(e_k,e_l)=R_{klab}\), the project density is
\(\mathcal E=2\operatorname{Pf}(\Omega)
=\tfrac14\varepsilon_{abcd}\Omega_{ab}\wedge\Omega_{cd}\).
The spatial primitive is
\[
  \mathcal T=\tfrac12\varepsilon_{abcd}\alpha_{ab}\wedge\Omega_{cd}.
\]
If \(\iota_X dV=\mathcal T\), its frame coefficients have the exact
signs \((\mathcal T_{123},-\mathcal T_{023},
\mathcal T_{013},-\mathcal T_{012})\). Define the double Hodge dual
\[
 P_{ijab}=\tfrac14\varepsilon_{ijkl}\varepsilon_{abcd}R_{klcd}.
\]
The alternating contraction of the wedge and the endomorphism skew
give \(g(X,e_i)=\sum_{jab}P_{ijab}\alpha_{ab,j}
=2\sum_{jab}P_{ijab}D_{ajb}\). Here the two factors of two come from
distinct operations. The \(2\operatorname{Pf}\) convention fixes
the primitive and the endomorphism skew combines the two terms in
\(\alpha\). On constant sectional curvature \(K\), \(P=R\), and
\(X_0=2K\sum_j(D_{0jj}-D_{jj0})\), which fixes the relative sign
of the insertion convention without requiring \(D\) to be an
actual nonzero derivative of that constant curvature metric.

The four-dimensional double Hodge dual is
\[
\begin{aligned}
P_{ijab}={}&R_{ijab}-
(\delta_{ia}\operatorname{Ric}_{jb}+\delta_{jb}\operatorname{Ric}_{ia}
 -\delta_{ib}\operatorname{Ric}_{ja}-\delta_{ja}\operatorname{Ric}_{ib})\\
 &+\tfrac R2(\delta_{ia}\delta_{jb}-\delta_{ib}\delta_{ja}).
\end{aligned}
\]
The curvature–Ricci expression permits a metric contraction in
arbitrary charts. It gives the overlap law intrinsically, using three
inverse-metric traces and the musical isomorphism. It does not require
a global orthonormal tangent frame. Its divergence can also be checked
via the contracted second Bianchi identity
\(\nabla_i P^{ijab}=0\). The factor in the resulting contraction with
the Ricci Hessian is \(2\), as in the current itself.
The independent finite contraction proof used only the two skews
and pair exchange of the algebraic tensor. This also permits its
application to each fixed-derivative-direction covariant curvature
tensor in the divergence proof. Covariant Bianchi applies to the
actual spatial curvature form with its endomorphism slots fixed.
[Prior normalized frame variation](../../../SmoothPoincare/Variational/SpatialEulerVariation.lean) ·
[Chern–Simons, §3](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf)

The derivative needed for the modified charge is the derivative of
the top form, evaluated on fixed base vectors. In the smooth flow,
write \(\mathcal E_t=e_t\,dV_t\). A fixed-frame pointwise identity
then has coefficient \(\partial_t e_t-R_t e_t\), because
\(\partial_t dV_t=-R_t dV_t\). If the covariant derivative of the
current gives \(d(\iota_XdV_t)=\operatorname{div}_{g(t)}X\,dV_t\),
the unambiguous stationary-cutoff identity is
\[
 \frac{d}{dt}\int \chi e_t\,dV_t
   =\int\chi\operatorname{div}_{g(t)}X\,dV_t
   =-\int d\chi(X)\,dV_t.
\]
The integration derivative follows on a compact smooth source by
working against one fixed smooth background volume and differentiating
the smooth volume ratio along with the density. For actual fixed
terminal cutoffs this has no time derivative of \(\chi\). If a
time-dependent cutoff is used instead, the extra
\(\int(\partial_t\chi)e_t\,dV_t\) term must be included.
The assembled proof treats the full carrier moment and constructs
its derivative at every regular time. The finite interval uses
the specified Riemann and Ricci derivative budgets, with the
actual volume on each slice. For a smooth fixed cutoff and the
weighted gradient budget \(\delta\sqrt{\tau^{2b}s^{-2b}}\), the
factor is \(144\,\delta A L\sqrt{\tau/(1-2b)}\). The terminal
Ricci-square computation loses twice this factor, and subtracts
the two initial chiral cutoff moments with coefficient \(4\) and
its scalar-square moment with coefficient \(1/6\).

For the actual terminal Lipschitz cutoff a lower Ricci form bound
\(\operatorname{Ric}_{g(s)}\ge-(b/s)g(s)\) yields
\(d_{g(\tau)}\le(\tau/s)^b d_{g(s)}\). This direction follows
from the monotonicity of \(s^{-2b}g(s)\) under Ricci flow.
The terminal Lipschitz constant therefore acquires this same
factor on earlier slices. Smooth approximation proves the
spatial divergence estimate for the original test, and the
original test retains its prescribed supporting sets throughout
the time calculation. At \(b=0\) and nonnegative Ricci the
terminal distance has no expansion and the time factor is
\(\sqrt{\tau}\). Integrability of the time budget and the
actual cutoff geometry remain inputs. The conclusions concern
the modified gauge and its slice volumes.

The terminal distance cutoff
\(\min(1,\max(0,R+1-d_{g(\tau)}(p,\cdot)))\) is one on the
closed radius-\(R\) plateau and vanishes at the radius \(R+1\)
boundary. Its Lipschitz constant is one. The terminal Ricci
bound applies when the measured initial charged set is in this
actual terminal plateau. The right-hand integral is over the
whole open terminal radius-\(R+1\) ball in its own volume. The
containment of the initial charged set is a geometric input.

The intrinsic terminal estimate combines the two initial Weyl
moments and the scalar square into a single density
\(P=|\mathrm{Rm}|^2/2+2e\), and measures the terminal trace-free
Ricci square as \(Z^2=|\mathrm{Rm}|^2/4-e\). The pointwise
normalizations identify \(P=4(|W^+|^2+|W^-|^2)+R^2/6\) and give
\(-2e\le Z^2\). Continuity of these slice scalars and the cutoff
on a compact manifold supplies endpoint integrability. The full
terminal ball estimate has no endpoint frame or transgression
premise. Its exponent-zero application uses nonnegative Ricci
curvature and time factor \(\sqrt\tau\).
[Owning modified-flow proof](../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex) ·
[Global current](../../../SmoothPoincare/Variational/GlobalEulerCurrent.lean) ·
[Tested derivative](../../../SmoothPoincare/Variational/TestedEulerTransgression.lean) ·
[Finite transport](../../../SmoothPoincare/Variational/TestedEulerTransport.lean) ·
[Terminal Lipschitz transport](../../../SmoothPoincare/Variational/TerminalLipschitzEuler.lean) ·
[Terminal ball charge](../../../SmoothPoincare/Variational/TerminalBallEulerCharge.lean) ·
[Intrinsic terminal charge](../../../SmoothPoincare/Variational/IntrinsicTerminalCharge.lean)

## Verification

The pinned Lean `4.35.0-rc3` replay with the sole import
`SmoothPoincare` passed 61 type and axiom pairs and fourteen exact
applications without diagnostics, covering seventeen reviewed leaves.
The axiom union was `propext`, `Classical.choice`, and `Quot.sound`.
The public replay log SHA-256 was
`42c2c07abddd3ed7f7de1a386c32ec1327fbc4bdd2d0cf408ff7ae8986f163b2`.
The applications cover the curved and unit-round native marked
paths, the measured depth-one core and cap costs in both signs,
fixed-base scaling, frame independence of the normalized scalar,
the actual local and tested volume derivatives, finite weighted
transport, contraction at nonnegative Ricci curvature, the exact
terminal plateau and outer boundary, the intrinsic terminal ball
estimate at \(b=0\), and conformal class preservation with zero signed
chiral saving.

| Reviewed source | SHA-256 prefix |
| --- | --- |
| MatchedCurvedDisk | `bc0973419f64bf8c` |
| CurvedCapPrice | `674c5713f9e8085a` |
| NativeRoundCore | `f6964e7d4e05ea8b` |
| ConformalCoreReference | `7314515321ee202e` |
| ConformalChiralCharges | `ad894d246295c306` |
| EulerBaseChange | `8f49420b2deb5c91` |
| EulerGaugeFrames | `b69347beb95c1e40` |
| IntrinsicEulerDensity | `4dce68219b405de6` |
| GlobalEulerCurrent | `b4aaa0c6834cd7e5` |
| TestedEulerIntegral | `08264aad5ce0a534` |
| TestedEulerTransgression | `ea46be5ecee6991a` |
| TestedEulerTransport | `f4545f8536bf5c69` |
| LipschitzEulerFlux | `2576666cb6be1914` |
| TerminalMetricPowerBound | `355edaee6889c300` |
| TerminalLipschitzEuler | `ee56a96f257e6460` |
| TerminalBallEulerCharge | `3489cbe08d22e05d` |
| IntrinsicTerminalCharge | `d58d9de51ac42995` |
