# SP4-FOT-NECK-E10 · Finite spherical cuts near the positive-Yamabe infimum

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E proof check under NECK-B03.
Recommended gpt-6.2-sol / ultra. The helper's exact serving model and
reasoning effort are unavailable. The checkout, norms and finite scope
are fixed in the [request](../research-progress/handoffs/E10_REQUEST_20261125.md).
The weak-splice application uses the E07 return and note at SHA-256
prefix 350b86f0.

## Conditional finite-cut statement

Let \(M\) be a smooth closed connected oriented homotopy four-sphere
with a smooth Riemannian metric \(g\). Use the inherited orientation
and \(E_+(g;U)=\int_U|W^+_g|_{\mathrm{HS}}^2\,dV_g\), with \(W^+\)
acting on real \(\Lambda^+\). Suppose \(n\ge1\) pairwise disjoint
smoothly embedded separating copies of \(S^3\) are supplied on \(M\).
Cut \(M\) along all of them to give raw pieces \(U_j\). Cap each
boundary of each \(U_j\) by a smooth standard \(D^4\) with the
specified boundary identification and a smooth capped metric
\(\widehat g_j\) on \(\widehat M_j\). Write
\[
 m_j=E_+(g;U_j),\quad e_j=E_+(\widehat g_j),\quad
 E=E_+(g)=\sum_jm_j,\quad \Gamma=\sum_j\gamma_j .
\]
Assume \(Y([\widehat g_j])>0\) and \(e_j-m_j\le\gamma_j\) with
\(\gamma_j\ge0\) for every \(j\). Assume \(E+\Gamma<8\pi^2\).

At most one \(e_j\) is at least \(4\pi^2\). Every piece with
\(e_j<4\pi^2\) is standard, and \(M\) is orientation-preservingly
diffeomorphic to the possibly remaining capped piece. If every
piece is standard, \(M\) is diffeomorphic to standard \(S^4\).
This conclusion concerns smooth type, so positive Yamabe metrics
on that type may still have nonzero Weyl energy.
[SEC normalization and recognition](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L144)

### Topology of these actual cuts

The incidence graph has one vertex for each raw piece and one
edge for each spherical cut. It is connected since gluing the
edges yields \(M\). Adding each separating cut splits a single
current component into two. The two neighboring sides of that
sphere are in distinct components of its complement already in
\(M\), and its connected two-sided collar gives exactly two
pieces after this cut in its current component. Thus the graph
has \(n+1\) vertices and \(n\) edges, and is a tree. Capping
does not change \(\pi_1\) or \(H_2\) of the raw pieces, by
van Kampen and Mayer–Vietoris across \(S^3\). Applying the same
theorems to the tree gluing gives
\[
 \pi_1(M)\cong\mathop{*}_j\pi_1(\widehat M_j),\qquad
 H_2(M;\mathbb Z)\cong\mathop{\bigoplus}_j H_2(\widehat M_j;\mathbb Z).
\]
Thus each capped piece is simply connected with \(H_2=0\).
Poincaré duality gives \(H_3=0\). Hurewicz and the homological
Whitehead theorem give that each is a homotopy sphere.

The original boundary identifications realize \(M\) as the
oriented connected sum of the capped pieces along the tree.
Removing a cap ball on each side of an edge restores the actual
boundary gluing. Every smooth diffeomorphism of \(S^3\) is
isotopic to an orthogonal map of its orientation sign and
extends across \(D^4\) by the isotopy in a collar and the
orthogonal map near the center. Also, an embedded parametrized
cap ball in a standard capped sphere can be shrunk by an
ambient isotopy and straightened in a chart. These facts
identify the standard \(S^4\) summands as units in the actual
gluing. One can remove standard leaves of the tree in order
after rooting it at the remaining piece, or at any piece if
all are standard. This uses the actual standard cap balls and
the capped smooth type.
[Hatcher, p. 553, component consequence for \(\mathrm{Diff}(S^3)\)](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf) · [Single-cut gluing check](E02_E05_SAME_TYPE_DESCENT_20261125.md#the-smooth-identification)

### Chiral recognition and the minimizing inequality

Each \(\widehat M_j\) has \(\chi=2\) and signature zero. The
signature formula gives \(E_+=E_-\) on that closed piece.
The four-index tensor norm is four times the squared
curvature-operator norm, so its full tensor Weyl integral is
\(8e_j\). If \(e_j<4\pi^2\) then \(8e_j<16\pi^2\chi\).
Theorem A of Chang–Gursky–Yang applies with the positive capped
Yamabe sign, and simple connectivity selects \(S^4\) from its
two conclusions. Since \(\sum_j e_j\le E+\Gamma<8\pi^2\),
two pieces at or above \(4\pi^2\) are excluded. This proves
the assertion using the smooth gluing above.
[Chang–Gursky–Yang, Theorem A and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

Use the infimum
\[
 I^+(M)=\inf\{E_+(h): h\text{ smooth Riemannian on }M,\ Y([h])>0\}
\]
when the class of competitors is nonempty. If the capped pieces
are all standard, the standard smooth type carries a round
class and \(I^+(M)=0\). For an exotic candidate under the supplied
hypotheses or if \(I^+(M)>0\), there is exactly one capped piece
at or above \(4\pi^2\), with index \(s\). It is diffeomorphic
to \(M\) and its positive Yamabe class is a competitor. Therefore
\[
 I^+(M)\le e_s\le m_s+\gamma_s,\qquad
 \sum_{j\ne s}m_j=E-m_s\le E-I^+(M)+\gamma_s .
 \tag{1}
\]
In particular, if the inequalities for a given cut force the
right-hand side to be strictly less than the measured discarded
raw energy, they contradict the assumed smooth type or
positive infimum.

For one cut write \(\Delta=E-I^+(M)\) and use \(L,R\)
for the two sides. On a positive-Yamabe source \(\Delta\ge0\).
The alternatives are \(m_R\le\Delta+\gamma_L\) if \(L\)
survives and \(m_L\le\Delta+\gamma_R\) if \(R\) survives.
Thus a cut with both
\(m_R>\Delta+\gamma_L\) and \(m_L>\Delta+\gamma_R\)
is impossible under the nonstandard-type hypothesis. For
example, both masses bigger than
\(\Delta+\max\{\gamma_L,\gamma_R\}\) meet the criterion.
The use of strict inequality allows equality in the estimates
for the capped masses.

## Weak-splice excess and the order of limits

For a supplied E07 spherical chart use its budget separately
on each side of the cut. Let \(T_{j,b}\) be a unit splice
at a boundary \(b\) of \(U_j\), \(q_{j,b}=E_+(g;T_{j,b})\)
the raw chiral energy and \(d_{j,b}\) an upper bound for the
projected Weyl-density comparison error in E07 equation (3).
The projection is in the inherited orientation. For \(N=1\)
one may take
\[
 d_{j,b}= C_W\bigl(aK+ d_{\rm ann}^2+d_{\rm ann}+a\bigr)
\]
for the corresponding buffered normalized annulus, with
\(d_{\rm ann}=\|Dv\|_4\) and \(K\) the full incoming
\(\|\mathrm{Rm}_{m}\|_2\) bound there on its splices, in
the representative being compared. The E07 pointwise
comparison and \(0\le\theta\le1\) yield
\(\sqrt{E_+(\widehat g_j;T_{j,b})}\le\sqrt{q_{j,b}}+d_{j,b}\).
The exact product and ball cap outside the splice has zero
Weyl curvature. The unchanged conformal region has the raw
energy. Subtracting the raw splice term at each boundary gives
a valid nonnegative per-piece excess budget
\[
 \gamma_j=\sum_{b\subset\partial U_j}
     \bigl(2\sqrt{q_{j,b}}\,d_{j,b}+d_{j,b}^2\bigr).
 \tag{2}
\]
For disjoint splices, with \(Q=\sum q_{j,b}\le E\) and
\(D=(\sum d_{j,b}^2)^{1/2}\), Cauchy–Schwarz gives
\(\Gamma\le2\sqrt Q D+D^2\). Incoming splice energy can be
bounded even where it does not vanish. If \(K\) is deduced
from a source full-curvature budget, the normalized comparison
metric must be the source up to a constant rescaling.
For an additional nonconstant conformal factor, the
curvature bound in the comparison gauge is another input.
The quotient-cap case of E07 is outside (1), which requires
smooth spherical caps.
[NECK-E07, all-lowered curvature comparison](E07_FIRST_ORDER_CAP_20261125.md#comparison-before-chiral-projection)

If \(g_i\) is a positive-Yamabe minimizing sequence,
\(E_i=E_+(g_i)\to I^+(M)<8\pi^2\), and a fixed finite
collection of cuts at each \(i\) meets the hypotheses with
\(\Gamma_i\to0\), then \(E_i+\Gamma_i<8\pi^2\) for large \(i\).
Equation (1) gives
\[
 \sum_{j\ne s_i} E_+(g_i;U_{i,j})\longrightarrow0
\]
when \(I^+(M)>0\). The cuts and the survivor may depend on
\(i\). In a construction with a free buffer length \(\ell\),
first choose a fixed length giving the desired localization
error and respecting the disjointness of the supplied buffers.
At this fixed \(\ell\), let \(i\to\infty\) in the chart
comparison, inherited Yamabe and energy estimates. The
constants in E07's scalar form comparison may depend on
\(\ell\). For an exhaustion statement only then let
\(\ell\to\infty\). If
\(\lim_{\ell\to\infty}\limsup_{i\to\infty}\Gamma_{i,\ell}=0\)
and the capped Yamabe signs hold for sufficiently large fixed
\(\ell\) and large \(i\), (1) gives the same iterated zero
bound for the raw outside mass, after imposing the strict
energy margin for those \(\ell\). A diagonal choice requires
the stated input and error conditions along that diagonal.
No exchange of limits is needed.

## Finite-cut Yamabe estimate with disjoint buffers

For this sufficient test assume \(Y([g])\ge y_0>0\). On a
capped piece with \(k\) boundary caps, suppose the normalized
one-sided localization buffers are disjoint and have lengths
\(\ell_b\ge1\). Let \(Q_{\widehat g}(u)=
\int(6|du|_{\widehat g}^2+s_{\widehat g}u^2)\,dV_{\widehat g}\).
On each cap, splice and buffer assume a scalar form lower bound
\(Q_{\widehat g}(w)\ge y_b\|w\|_4^2\) for supported tests,
with a positive \(y_b\). For the E07 case this can be taken
as \((1-C_{\ell_b}(a_b+d_b))Y_{\rm rd}\), with the
first-derivative norm \(d_b\) on that chart. Outside the splices
keep the source conformal class. The caps and the conformal
representative on the retained interior must be chosen
compatibly, using the supplied disjoint chart neighborhoods.

Choose a cutoff \(\chi_b\) equal to one on the cap through
its splice and zero past its buffer. Choose \(\chi_0\) equal
to zero near every cap and one on the interior past the
buffers. In the \(b\)-buffer use a squared partition
\(\chi_0=\sin\vartheta_b,\ \chi_b=\cos\vartheta_b\),
with a fixed profile rescaled by \(\ell_b\), and the other
cap cutoffs zero. Globally
\(\chi_0^2+\sum_b\chi_b^2=1\). The exact IMS formula is
\[
 Q_{\widehat g}(u)
 =\sum_{a=0}^{k}Q_{\widehat g}(\chi_a u)
   -6\int_{\widehat M_j}\Bigl(\sum_{a=0}^{k}|d\chi_a|_{\widehat g}^2\Bigr)
                  |u|^2\,dV_{\widehat g},
\]
where \(\widehat M_j\) is the capped piece. The \(\chi_0 u\)
term is tested in the original conformal class after conformal
transport and zero extension. It has coefficient \(y_0\).
The other terms have coefficients at least \(y_b\).
The \(L^2\) triangle inequality on \(u^2\) gives
\(\sum_a\|\chi_a u\|_4^2\ge\|u\|_4^2\).
The local sum of squared gradients is \(O(\ell_b^{-2})\)
on a buffer of normalized volume \(O(\ell_b)\), so its
squared \(L^2\) norm is \(O(\ell_b^{-3})\). Disjointness and
Hölder prove
\[
 Y([\widehat g])\ge
  \min\{y_0,\min_b y_b\}-C_I\Bigl(\sum_b\ell_b^{-3}\Bigr)^{1/2}.
 \tag{3}
\]
For common \(\ell\) this is the \(\sqrt{k}\ell^{-3/2}\)
loss. With fixed finitely many cuts, choose \(\ell\) so
this loss is small relative to the positive lower bounds,
then make the local scalar form errors small at that
fixed \(\ell\). This construction requires buffers that
remain disjoint and fit on the retained sides.
[E06, single-cap localization](E06_WEAK_CAP_20261125.md) · [E07, first-order scalar form comparison](E07_FIRST_ORDER_CAP_20261125.md#first-order-form-comparison-and-quotient-normalization)

Equation (1) controls energy on the union of the discarded
raw pieces for the specific supplied cuts. It uses no
ALE comparison, Bach condition or no-neck identity. It
allows arbitrary diffusion or further concentration of
energy within the survivor and does not extract a new
usable cut there.
