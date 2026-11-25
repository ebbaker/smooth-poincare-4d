# Exponential attenuation and exact-germ two-core matching

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Exact serving model and reasoning effort unavailable.
Conditional proof in the prior normalized collar gauges.
[Frozen request and input versions](../research-progress/handoffs/E09_REQUEST_20261125.md)
· [Return](../research-progress/handoffs/E09_RETURN_20261125.md)

## Weighted estimate from the uniform inverse

Let \(Z_L=[0,L]\times S^3\), \(L\ge2\), with the product orientation,
and let \(\mathcal L\) be the first-order operator for the positive half-Dirac
problem after the chosen normal Clifford and spin identifications. In the
fixed reference Sobolev norms let \(\Gamma_{\rm in}u\) be the pair of
positive trace at \(0\) and negative trace at \(L\). Let \(\Gamma_{\rm out}u\)
be the complementary pair, in the same left-to-right ordering. The
projections here may be either the fixed round projections of E02 or
the endpoint spectral projections of E03. Use the Hilbert direct sum
of the endpoint \(H^{1/2}\) norms. Assume
\[
 \|u\|_{H^1}\le C(\|\mathcal Lu\|_2+\|\Gamma_{\rm in}u\|),\qquad
 \|[\mathcal L,t]\|_{L^2\to L^2}\le b
 \tag{1}
\]
uniformly in \(L\), with \([\mathcal L,t]\) the principal coefficient
for \(dt\) in the real symbol convention. The second estimate is a
pointwise coefficient bound. In E02 it follows from near-product
metric equivalence and the Clifford symbol. In the E03 normal form
with a zeroth-order remainder the normal coefficient is the identity.
The commutator proof uses the local first-order operator or a
zeroth-order multiplication perturbation.
[E02 estimate](E02_FIXED_PROJECTION_PERTURBATION_20261125.md#inverse-and-traces)
· [E03 estimate](E03_VARYING_INVERSE_20261125.md#prescribed-traces)

Fix \(\tau>0\) with \(\tau Cb<1\). If \(\phi\) is Lipschitz in \(t\),
\(\|\phi'\|_\infty\le\tau\), set \(v=e^\phi u\). At each finite \(L\)
multiplication by this weight is bounded on \(H^1\). The weak product
rule gives
\[
 \mathcal L v=e^\phi\mathcal Lu+\phi'[\mathcal L,t]v,\qquad
 \Gamma_{\rm in}v=
 (e^{\phi(0)}P_+(0)u(0),\,e^{\phi(L)}P_-(L)u(L)).
\]
The trace formula uses endpoint scalar multiplication, so it holds
also for instantaneous projections at different ends. Inserting
these formulas into (1) and absorbing \(Cb\tau\|v\|_2\) gives
\[
 \|e^\phi u\|_{H^1}\le
 C_\tau(\|e^\phi\mathcal Lu\|_2+\|\Gamma_{\rm in}(e^\phi u)\|),
 \qquad C_\tau=\frac{C}{1-Cb\tau}.
 \tag{2}
\]
This estimate uses \(\|v\|_2\le\|v\|_{H^1}\). If a uniformly equivalent
bulk norm is used, absorb the corresponding constant in (1).

For \(\mathcal Lu=0\), write \(G_{\rm in}=\|\Gamma_{\rm in}u\|\) and
choose \(\phi(t)=\tau\min(t,L-t)\). The endpoints have \(\phi=0\)
and the single midpoint kink is allowed by the weak \(H^1\) product
rule, with no boundary term there. On \([d,L-d]\times S^3\),
\(0\le d<L/2\), the inverse weight is bounded by \(e^{-\tau d}\),
and its weak derivative by \(\tau e^{-\tau d}\). Consequently
\[
 \|e^{\tau\min(t,L-t)}u\|_{H^1}\le C_\tau G_{\rm in},
 \qquad
 \|u\|_{H^1([d,L-d]\times S^3)}
 \le (1+\tau)C_\tau e^{-\tau d}G_{\rm in}.
 \tag{3}
\]
This applies to actual harmonic fields restricted to the collar
whenever their incoming traces are measured in the indicated gauge.
In particular, on the middle two-unit strip,
\[
 \int_{[L/2-1,L/2+1]\times S^3}\sum_a |u_a|^2\,dV_*
 \le C_\tau^2 e^{-2\tau(L/2-1)}\sum_a G_{{\rm in},a}^2
 \tag{4}
\]
in the fixed reference volume. For \(L\to\infty\) a uniformly
bounded sum of squared incoming norms thus rules out a uniform
positive joint pointwise lower bound throughout that strip in the
fixed gauge. A corresponding physical statement requires uniform
comparison of the spinor weights and norms.

## One-sided transmission

Write \((x,y)=\Gamma_{\rm in}u\) for a homogeneous solution.
For \(y=0\) choose \(\phi(t)=\tau t\), so the weighted incoming norm
is precisely \(\|x\|\). Endpoint trace is bounded by a uniform
constant \(C_{\rm tr}\) from \(H^1\) on a unit end strip to the
corresponding outgoing space. For the fixed round gauge this is the
fixed trace inequality and orthogonal projection in the spectral norm.
For the varying family, use the ordinary \(H^1\) trace and the uniform
endpoint graph and upper operator bounds to interpolate the projector
bounds from \(L^2\) and \(H^1\) to \(H^{1/2}\). Uniformly equivalent
endpoint norms preserve the constants. Applying trace to \(v\) now
gives
\[
 \|P_+(L)u(L)\|\le C_{\rm tr} C_\tau e^{-\tau L}\|x\|.
\]
For \(x=0\) the same argument with \(\phi(t)=\tau(L-t)\) gives
\(\|P_-(0)u(0)\|\le C_{\rm tr} C_\tau e^{-\tau L}\|y\|\).
These are operator bounds between the endpoint spaces, with no common
slice spectrum used. The one-sided bounds require the specified
vanishing incoming trace at the remote end of the tested solution.

## Same-end reflection in the E02 gauge

Write \(L_0=\partial_t+A\) and \(L_h\) for the perturbed E02 operator.
Use the common reference projections and trace norm
\(\|w\|_{\mathcal T}=\||A|^{1/2}w\|_2\). Let
\(\|L_h-L_0\|_{H^1\to L^2}\le\delta=C_{\rm ref}\varepsilon<1\)
as in E02. For fixed incoming data \(\mathbf g=(x,y)\), let
\(U_h\mathbf g\) and \(U_0\mathbf g\) be the homogeneous solutions.
The difference \(w=U_h\mathbf g-U_0\mathbf g\) has zero incoming
traces and \(L_0w=-(L_h-L_0)U_h\mathbf g\). E01 gives
\(\|\Gamma_{\rm out}w\|\le\|L_0w\|_2\) in these norms. E02 gives
\(\|U_h\mathbf g\|_{H^1}\le(1-\delta)^{-1}\|\mathbf g\|\).
Writing \(S_h=\Gamma_{\rm out}U_h\) and \(S_0=\Gamma_{\rm out}U_0\),
\[
 \|S_h-S_0\|\le\frac{\delta}{1-\delta}.
 \tag{5}
\]
The round map has off-diagonal entries
\(e^{-L|A|}|_{H_-}\) and \(e^{-L|A|}|_{H_+}\) and zero diagonal
entries. Thus each same-end reflection has norm
\(\le\delta/(1-\delta)\), and
\[
 \|S_h\|\le e^{-3L/2}+\frac{\delta}{1-\delta}.
 \tag{6}
\]
The weighted estimate also bounds both off-diagonal entries of \(S_h\)
by \(C_{\rm tr}C_\tau e^{-\tau L}\). The two statements quantify different
entries, since attenuation of transmission alone leaves reflection
uncontrolled. [E01, energy identity](E01_ROUND_INVERSE_20261125.md#energy-identity-and-surjectivity)
· [E02, incoming and outgoing bound](E02_FIXED_PROJECTION_PERTURBATION_20261125.md#inverse-and-traces)

## Matching two actual E06 cores to the near-product collar

Use the two actual compact cores of E06, allowing the particular
singular solutions there with the prescribed pole normalization.
Assume each core has the exact unit-round product germ and the
positive-Yamabe capped comparison in that result. Assume the
perturbed collar metric agrees with those germs on seam neighborhoods
in the same oriented spin and conformal gauge. The collar interior
is allowed the E02 perturbation. The spin and Clifford
identifications then coincide on the seams. Use throughout
the common normal \(+\partial_t\) as in E06, so the left core
prescribes \(G_L:H_-\to H_+\) and the right core
\(G_R:H_+\to H_-\). Their trace norms in E06 can be changed to
\(\mathcal T\) with a fixed factor by the round gap. Set
\(\mathcal G=\operatorname{diag}(G_L,G_R)\) as an operator from
outgoing to incoming pairs, and \(K=\|\mathcal G\|
=\max(\|G_L\|,\|G_R\|)\) with the common \(\mathcal T\) norm.
Let \(\mathbf a=(a_L,a_R)\) be the E06 affine shifts measured
in these same normalized traces. For example, the left shift from
a specified particular pole field \(p\) is
\(P_+\operatorname{tr}p-G_LP_-\operatorname{tr}p\).
Take zero shift for a regular core.
[E06, actual graphs and affine pole shifts](E06_ACTUAL_CORE_GRAPHS_20261125.md#composing-two-actual-graphs-and-a-pole-shift)

For a collar solution \(U_h\mathbf g\), equality of its full traces
with the two core affine graphs is exactly
\[
 (I-\mathcal G S_h)\mathbf g=\mathbf a .
 \tag{7}
\]
The sufficient condition is
\[
 m=K\left(e^{-3L/2}+\frac{\delta}{1-\delta}\right)<1 .
 \tag{8}
\]
Indeed (6) bounds the return operator by \(m\). Neumann inversion
gives \(\|\mathbf g\|\le (1-m)^{-1}\|\mathbf a\|\), so the total
outgoing trace is bounded by (6) times this estimate and
\[
 \|U_h\mathbf g\|_{H^1}
 \le \frac{\|\mathbf a\|}{(1-\delta)(1-m)}.
\]
An alternative sufficient condition replaces \(e^{-3L/2}\) in (8)
by \(C_{\rm tr}C_\tau e^{-\tau L}\), using the two diagonal reflection
and two off-diagonal transmission estimates on the Hilbert product.
For \(\delta\le\delta_*<1\), \(m\le m_*<1\) and uniformly bounded
\(\|\mathbf a\|\), the incoming norms are uniformly bounded and the
middle estimates (3)–(4) apply to the glued fields.

Equation (7) selects traces in the actual affine spaces and
E06 supplies their interior solutions on the cores. Equality
of the full traces gives a global \(H^1\) spinor away from the
prescribed poles. Integration by parts across each seam cancels
the two boundary terms because of the common spin metric and
opposite outward normals. Interior elliptic regularity gives
smoothness through each seam, and the core construction preserves
the prescribed poles. Uniqueness follows from (7) applied to the
difference with zero shifts and from unique core extension.
Uniform bounds on the affine shifts must be measured for a family.
The Yamabe graph hypothesis and the matching germ do not bound a
physically normalized pole trace under arbitrary degeneration.
The graph construction used here concerns the newly joined smooth
metric with compatible germs. A varying-slice inverse by itself
does not identify the Cauchy graphs of arbitrary perturbed cores or
give small same-end reflection. These estimates give no control
of a differentiated twistor defect.
