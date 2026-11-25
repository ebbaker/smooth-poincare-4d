# Review of the same-type descent and balanced block selection

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The reviewer is a separate Codex agent
from the lead derivations reviewed here and prepared the earlier E08
link test. Exact serving model and reasoning effort are unavailable.
This is an internal research proof check. I recomputed the energy,
Yamabe and scale inequalities and checked the composition with
E07–E08 and the cited recognition and neck benchmarks.

## Same smooth type and energy descent

The conditional conclusion of [E02/E05](../notes/E02_E05_SAME_TYPE_DESCENT_20261125.md)
passes. In its notation, choosing the fixed buffer first gives
\(C_I\ell^{-3/2}<b/2\), where \(b=\min\{\sqrt{48\delta},Y_{\rm rd}/2\}\).
Taking the normal cut radius small and then \(i\) large gives
\(C_Y\eta_2<1/2\). Thus the cap lower bound is strictly larger
than \(b/2\). The exterior includes only its incoming energy
plus its cap transition. Subtracting the disjoint part of the
embedded core \(K_{\exp(1)s}\) from the global budget gives
\[
 E_+(g_{V_i})
 < (e+\varepsilon)-(e_X-2\varepsilon)+\varepsilon
  = e-e_X+4\varepsilon<4\pi^2
\]
since \(e_X>4\pi^2\), \(e\le8\pi^2-\delta\) and
\(4\varepsilon<\delta\). To apply the audit verbatim, include
its \(\eta_2\le\eta_*\) in the small-radius choice as well.
That threshold is attainable in the same limit order.
[Cap estimate](../notes/E01_TWO_CAP_AUDIT_20261125.md) · [Marked cut](../notes/E03_EMBEDDED_CUT_20261125.md)

Both capped manifolds are homotopy spheres by van Kampen
and Mayer–Vietoris. On the exterior cap, signature zero makes
the integrated four-index Weyl norm squared \(8E_+\), strictly
below \(16\pi^2\chi=32\pi^2\). The strict Chang–Gursky–Yang
hypotheses, including positive class Yamabe constant, hold.
The recognition alternatives reduce to \(S^4\) by simple
connectivity. On the core the boundary marking extends using
the actual compactification's smooth normal-coordinate ball.
The complementary cap ball in the recognized \(S^4\) is a
parametrized embedded \(D^4\). Shrinking it by an embedding
isotopy and straightening the small image in a coordinate chart
identifies this cap with a standard ball by ambient isotopy.
The component statement for \(\operatorname{Diff}(S^3)\) allows
the marked boundary attachment to extend over the standard ball.
This is the oriented connected-sum identity used in the note.
[Chang–Gursky–Yang, Theorem A and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf) · [Hatcher, opening statement and component theorem](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf)

The transfer of the compactified class gives \(I^+(M)\le e_X\).
SEC §12.2 gives the non-effective band constant \(\kappa_\delta>0\)
by applying its exact-class Yamabe deficit to the exact smooth
Bach-flat compactification. Thus \(e-I^+(M)\ge\kappa_\delta\)
whenever the supplied bubble occurs. Qualitative strict residual
suffices for an exact minimizing sequence. The argument uses
no budget split for other concentration regions. As written,
the conclusion concerns only a supplied full embedded smooth
ALE bubble and leaves compactness and the fate of a nonround
closed critical class open. [SEC §§11.5 and 12.1–12.2](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4288)

## Noncollapse, diameter and quantile scales

The cutoff in [E11](../notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md)
has \(|du|\le2/r\) almost everywhere. With \(v(r)=V(r)/r^4\),
the Yamabe inequality yields
\[
 v(r)\ge\frac{y_0}{4(24+Sr_0^2)}\,v(r/2)^{1/2}
 \quad (r\le r_0).
\]
The factor \(1/4\) comes from \(V(r/2)^{1/2}=(r^2/4)v(r/2)^{1/2}\).
Taking the \(j\)-fold iterate and using pointwise Euclidean
small-ball asymptotics separately at each center gives
\(V(r)\ge c^2r^4\) with the displayed coefficient \(c\).
No uniform error in the small-ball asymptotics is required.

**Add the resulting diameter bound to E11.** Fix \(0<\rho\le r_0\).
Mark a minimizing diameter geodesic every \(2\rho\). Its
\(n_i=1+\lfloor D_i/(2\rho)\rfloor\) centers give disjoint
open radius-\(\rho\) balls, because distances between the centers
equal geodesic parameter differences. Volume one gives
\(n_i c^2\rho^4\le1\) and hence
\[
 D_i=\operatorname{diam}(M_i,g_i)
 <2\rho n_i\le 2/(c^2\rho^3).
\]
In particular every upper quantile radius \(b_i\) is uniformly
bounded since its cumulative mass is strictly less than the total.
This removes the additional bounded-\(b_i\) subsequence condition
in the chart problem. The same packing step already appears in
the exact case in SEC §12.2, and its proof here uses only the
unit-volume Yamabe inequality. [SEC §§11.1 and 12.2](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4452)

The continuity of the distance-ball distribution follows from
the distance function's almost-everywhere unit gradient away
from its center, and from the almost-everywhere vanishing of
the gradient on any positive-volume level set. Hence each
level has four-volume zero and the curvature measure, which
has a smooth density, assigns it zero mass. The separated
positive quantiles therefore exist when \(0<2\eta<E_i\).
The fixed \(m\)-shell blocks have disjoint interiors and zero
curvature measure on their common boundaries. Since the number
of blocks tends to infinity, the pigeonhole bound holds for
the full tensor curvature. If \(N_i=\lfloor\log_2(b_i/a_i)\rfloor\),
the entire selected block lies at radii between
\(a_i 2^{N_i/4-O(m)}\) and \(b_i2^{-N_i/4+O(m)}\).
Thus its outer radius tends to zero in the volume gauge,
while the block stays multiplicatively far from both quantile
radii. These statements hold for the radial region itself.

## Geometric input and transition norms

**Specify the norm and order of operations in E11.** For each
selected oriented quotient chart \(\Phi_i\), fix its log width and
assume that the lift of \(\Phi_i^*(r_i^{-2}g_i)\) is
\(\delta+v_i\) on the selected Euclidean annulus, for one
positive constant scale \(r_i\) per index. State
\(\|v_i\|_{\infty}+\|Dv_i\|_{L^4(dy)}=o(1)\) on this lift
as in E07, or use the corresponding downstairs derivative
norm with the following order of operations. The norm on an
annular quotient with group order \(n_{\Gamma,i}\) is
\(d_{\downarrow,i}=n_{\Gamma,i}^{-1/4}\|Dv_i\|_{4}\).
For the metric that only makes the middle region product,
E07's error
\[
 C\big(\|v_i\|_\infty K_i+
      d_{\downarrow,i}^{\,2}+n_{\Gamma,i}^{-1/4}d_{\downarrow,i}
      +n_{\Gamma,i}^{-1/2}\|v_i\|_\infty\big)
\]
tends to zero under downstairs smallness and \(K_i=O(1)\)
uniformly in \(n_{\Gamma,i}\). Here \(K_i\) is the actual \(L^2\)
four-index Riemann norm on the two source splices. The same
source budget applies under constant physical rescaling.
A nonconstant conformal factor before the first-order comparison
would require an additional Riemann bound in its own gauge.
If the chart lies inside the selected block, then
\(K_i^2\le\Lambda/p_i\to0\) and the incoming chiral splice
energy \(q_i\) also tends to zero. The positive-chirality
cost \(2\sqrt{q_i}\Delta_i+\Delta_i^2\) follows from E07's
density comparison, with both the Weyl trace subtraction and
chirality projection taken in their respective metrics.
[E07](../notes/E07_FIRST_ORDER_CAP_20261125.md)

Apply E08 to this productized metric on the same smooth
closed source, before capping. Its budget is below \(9\pi^2\),
so \(n_{\Gamma,i}=1\) for all large \(i\). If only the downstairs
derivative norm was assumed, lift and downstairs norms then
coincide for the Yamabe estimate. Alternatively, E08's
topological part already bounds \(n_{\Gamma,i}\le8\) for these actual
smooth embedded links before any metric change. A sequence
of charts with changing groups and gauges requires no overlap
identifications for this single-cut application.
[E08](../notes/E08_QUOTIENT_LINK_TEST_20261125.md)

The separation condition must put the two quantile sets in
opposite complementary pieces and keep them out of the modified
strips. A chart contained in the block gives the second
property automatically. If its position is prescribed only
by separation at the middle slice, keep the quantitative
requirement that both unchanged pieces still carry the needed
mass. For a nonstandard smooth type, positive-Yamabe caps
with combined \(E_+\le E_i+o(1)<8\pi^2\) give a standard
summand by strict recognition. Its partner has the original
smooth type by the marked connected sum, so has
\(E_+\ge I^+(M)\). The standard cap has \(E_+=o(1)\) if
\(E_i\to I^+(M)\), contrary to its preserved mass \(\eta\).
This independently checks the implication needed in E11.

The ball lower bound and total curvature and Bach budgets
leave a separating cone chart, component area control,
and first-order compactness open. The exact Chang–Qing–Yang
neck theorem uses additional inputs, including exact Bach
flatness and the inner area hypothesis. The conditional
contradiction bounds only the scale separation between
the chosen positive quantiles if a chart of the stated
quality can always be obtained. Compactness on bounded
log-width and the global recognition argument remain open.
[Chang–Qing–Yang, Theorem 3.1](https://arxiv.org/pdf/math/0508621)

## Versions checked

Checkout `cec037fa20d8b9e74636e4c313e802df9f71bd3d`. Working source SHA-256 values follow.

| Input | SHA-256 |
| --- | --- |
| [E02/E05](../notes/E02_E05_SAME_TYPE_DESCENT_20261125.md) | `50cc3f66dde5818feba71babd692b35e6b9324f2cef716d08498db322b7d1d38` |
| [E11](../notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md) | `1d675693e498652563a7ddc623c684cd266a96d391b414b92325321020975601` |
| [E07](../notes/E07_FIRST_ORDER_CAP_20261125.md) | `350b86f03790daa347b2ee8d9ab6a75f2a4d58beed735a77b72608a984696257` |
| [E08](../notes/E08_QUOTIENT_LINK_TEST_20261125.md) | `77516d152f1664b80ce67a6b4463df99267064e3009104e01640888dbc7490c9` |
| [SEC](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) | `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66` |
