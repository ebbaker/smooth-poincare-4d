# First-order two-cap estimate · SP4-FOT-NECK-E07

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Exact serving model and reasoning effort
are unavailable. This is a conditional proof for one supplied fixed
annulus. [Frozen request](../research-progress/handoffs/E07_REQUEST_20261125.md)
· [E06 form comparison](E06_WEAK_CAP_20261125.md)
· [B01 decision](../brainstorm/notes/DECISIONS_JOINT_COLLAR_20261125.md)

## Hypotheses and conclusions

Let \((M,g)\) be a smooth closed oriented Riemannian homotopy
four-sphere, with \(Y_0=Y([g])\ge y_0>0\). Suppose there is a smooth
oriented embedded annulus with fixed logarithmic coordinates
\[
 A_\ell/\Gamma,\qquad
 A_\ell=\{e^{-\ell-2}<|y|<e^{\ell+2}\},\qquad
 t=\log|y|,\quad \ell\ge1,
\]
where \(\Gamma\le SO(4)\) is finite, acts freely on the unit
\(S^3\), and has order \(N\). Include \(N=1\). Suppose the lift
of a smooth conformal representative of the source on this annulus
is \(m=\delta+v\) in the Euclidean coordinates. Write
\[
 a=\|v\|_{\infty,A_\ell}\le\tfrac14,\qquad
 d=\|Dv\|_{L^4(A_\ell,dy)},\qquad
 K=\|\mathrm{Rm}_{m}\|_{L^2((T_1\cup T_2)/\Gamma,m)}.
\]
The last expression uses the actual metric and volume downstairs,
and the full four-index Riemann norm. The \(C^0\) and \(L^4\)
conditions are on the lift. Here \(T_j\) are the two unit
splices \(0<|t|<1\), one in each side, in the cover. In what follows
region labels in integrals on the source refer to their images
downstairs. The real positive-chiral Hilbert–Schmidt Weyl energy
is \(E_+\) as in E06.

Choose the E06 cutoff \(\theta(x)\), \(x=|t|\), and start with
\(n=\delta+\theta v\) on each splice. Multiply by \(|y|^{-2}\)
to obtain the attaching product near \(t=0\) and use the
unaltered collar gauge past the splice. Cap each side by
the rotational E01 cap modulo \(\Gamma\). The spherical space
form slice separates by the intersection argument of E01,
since it is connected, oriented and two-sided, and
\(H_3(M;\mathbb Z)=0\). For \(N=1\) the two closed pieces are
smooth homotopy four-spheres. For \(N>1\) the construction gives
compact oriented orbifolds, each with a single model point of
type \(\mathbb R^4/\Gamma\). The curvature integrals on these
orbifolds use the usual quotient measures and the Yamabe constants
use smooth orbifold test functions.

Let \(q=E_+(g;T_1\cup T_2)\) and let \(A\) denote the combined
positive-chiral Weyl energy of the new splices. Define
\[
 \Delta=C_W\left(aK+N^{-1/2}(d^2+d+a)\right).
\]
Then
\[
 \sqrt A\le\sqrt q+\Delta,\qquad
 \sum_{j=1}^2 E_+(\widehat g_j)
       \le E_+(g)+2\sqrt q\,\Delta+\Delta^2.                     \tag{1}
\]
The estimate on each piece retains the incoming unchanged-region
energy and adds its own splice contribution. It is also possible to
use the same two splices to make a central product region in the
original smooth closed \(M\), keeping the slice and making no
fillings. Its new Weyl energy satisfies the same net bound.

For \(a+d\le1\) and \(C_\ell(a+d)\le1/2\), the two capped
Yamabe constants satisfy
\[
 Y([\widehat g_j])\ge
 \min\left\{Y_0,\,[1-C_\ell(a+d)]\,\frac{Y_{\rm rd}}{\sqrt N}\right\}
       -\frac{C_I}{\sqrt N}\ell^{-3/2},\qquad
       Y_{\rm rd}=8\sqrt6\,\pi.                                  \tag{2}
\]
Here \(C_W,C_I\) depend on the fixed profiles and model and
\(C_\ell\) may also depend on the fixed buffer length. These
constants are independent of \(N\) in the displayed normalization,
of physical scale, and of the geometry outside the chart.

## Comparison before chiral projection

In Cartesian coordinates put \(G_{ijk}=m_{ip}\Gamma^p{}_{jk}(m)\),
the Christoffel symbols of the first kind. They are linear in
\(Dm\) with constant coefficients. Substitute the differentiated
symbols in the coordinate Riemann tensor and lower all its indices.
Differentiating the lowered symbols gives the constant-coefficient
linear second-derivative part. The differentiated inverse metric
terms and the Christoffel products are quadratic in \(Dm\) with
coefficients smooth in \(m\). Thus with the fixed curvature
convention one has
\[
 \mathrm{Rm}_{\rm low}(\delta+w)=L(D^2w)
           +Q(\delta+w)[Dw,Dw],
\]
where \(L\) is constant. This feature is specific to keeping
all indices down before the comparison. [SEC §14.1, second-order
terms in the variation](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5240)

On each unit splice \(D^2(\theta v)-\theta D^2v\) consists of
terms involving \(D\theta\,Dv\) and \(D^2\theta\,v\), and the
fixed product-coordinate cutoff has bounded Cartesian derivatives
on \(e^{-1}\le |y|\le e\). The quadratic expression is bounded
using \(|D(\theta v)|^2\le C(|Dv|^2+a^2)\). Therefore
\[
 |\mathrm{Rm}_{\rm low}(n)-\theta\mathrm{Rm}_{\rm low}(m)|
       \le C(|Dv|^2+|Dv|+a).
\]
For a fixed positive metric matrix \(p\), let \(\mathcal P_p\)
be the linear map taking an all-lowered algebraic curvature tensor
to its Weyl trace-free part, its positive-chiral matrix in the
oriented \(p^{-1/2}\) orthonormal frame, and then multiplying
by \((\det p)^{1/4}\). Both the frame and \(\mathcal P_p\) vary
smoothly with \(p\). The target is the fixed Euclidean chiral
matrix space as in E06. Writing
\(\mathcal F(p)=\mathcal P_p(\mathrm{Rm}_{\rm low}(p))\), one has
\[
 \begin{split}
 \mathcal F(n)-\theta\mathcal F(m)
 &=\mathcal P_n\big(\mathrm{Rm}_{\rm low}(n)
                     -\theta\mathrm{Rm}_{\rm low}(m)\big)
  +\theta(\mathcal P_n-\mathcal P_m)\mathrm{Rm}_{\rm low}(m),\\
 |\mathcal F(n)-\theta\mathcal F(m)|
 &\le C\big(|Dv|^2+|Dv|+a+a|\mathrm{Rm}_{\rm low}(m)|\big).
 \end{split}                                                     \tag{3}
\]
The estimate of the second term uses \(|n-m|\le a\), so it
applies to the moving Weyl trace subtraction and Hodge projection
together. All component comparisons are uniform because
\(a\le1/4\).

The construction and the norms are equivariant under
\(\Gamma\). In an oriented Cartesian chart the integral of
\(|\mathcal F|^2\) on the cover is \(N\) times the chiral
energy downstairs. Estimate (3) on the union of the fixed
central splices. By Hölder, \(\|Dv\|_2\le C d\)
there, and \(\||Dv|^2\|_2\le d^2\). The \(L^2(dy)\) norm on
the cover of \(\mathrm{Rm}_{\rm low}(m)\) is at most \(C\sqrt N\,K\).
Dividing through by \(\sqrt N\) gives an error at most \(\Delta\).
Equivalently, with \(d_{\downarrow}=N^{-1/4}d\), the error
has the bound
\[
 C_W\left(aK+d_{\downarrow}^2
                +N^{-1/4}d_{\downarrow}+N^{-1/2}a\right).
\]
Thus the density norm and \(\theta\le1\) yield
\(\sqrt A\le\sqrt q+\Delta\). Chiral energy is unchanged by
the \(|y|^{-2}\) factor, so this estimate uses the correct
physical chiral energies. The exact caps contribute zero.
With the same source conformal representative on the unchanged
pieces, the change in combined energy is \(A-q\). Expanding
\((\sqrt q+\Delta)^2-q\) gives (1). In particular when \(q\) is
globally bounded and \(\Delta\to0\), the increase in total
energy is at most \(o(1)\), even if \(q\) does not tend to zero.
The same argument applies to the negative chirality with its
own incoming transition energy.

The full curvature bound \(K\) is available from the full
source \(L^2\) Riemann bound whenever \(m\) is the pullback of
the source metric at most rescaled by a constant. For example
in the volume-one Yamabe band, SEC §11.1 supplies this bound.
Under constant rescaling \(|\mathrm{Rm}|\) has length weight
\(-2\) and its \(L^2\) norm is invariant in four dimensions.
In the Euclidean chart with coefficients viewed as dimensionless
after constant normalization, \(d=\|Dv\|_4\) is also critical.
If \(m\) instead uses a nonconstant conformal factor, \(K\)
is a separate input in that representative. The normalized
cylinder is used only after (3). [SEC §11.1, full curvature
budget](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

## First-order form comparison and quotient normalization

On the cover use \(b=b_\infty\), the E01 model cap with its
semi-infinite product, and extend the actual capped metric
to a comparison \(k=b+e\) using the E06 outer cutoff. These
are \(\Gamma\)-invariant and smooth on the cap cover. In the
product identification the perturbation pulled back from
\(|y|^{-2}v\) has \(\|e\|_{\infty,b}\le a\). With \(\ell\)
fixed, the coordinate and cutoff derivatives give
\[
 \|\nabla_b e\|_{4,b}\le C_\ell(d+a).
\]
The same estimate applies to each side; the reverse
log-radius coordinate on the inner side merely describes the
same scalar problem in product coordinates.

The scalar-density identity in E06,
\(\mu R_k-R_b=\operatorname{div}_b V+H\) with
\(|V|\le C|\nabla_b e|\) and
\(|H|\le C(|e|+|\nabla_b e|^2)\), uses only these zeroth-
and first-order bounds after integration by parts. The model
form controls both the \(H^1\) and \(L^4\) norms on the cover.
For \(a+d\le1\) the E06 calculation thus gives
\[
 Q_k(w)\ge [1-C_\ell(a+d)]Y_{\rm rd}\|w\|_{4,k}^2
\]
for every smooth compactly supported test on the cover, after
including the norm comparison. Here the coefficient is positive
by the stated smallness condition. [E06, scalar-density
derivation](E06_WEAK_CAP_20261125.md#scalar-density-estimate-on-the-comparison-cap)

A compactly supported smooth orbifold test on the quotient
lifts to a \(\Gamma\)-invariant test. The form divides by \(N\)
and the square of the \(L^4\) norm divides by \(\sqrt N\).
This gives the localized lower coefficient
\([1-C_\ell(a+d)]Y_{\rm rd}/\sqrt N\) in the quotient.
The model constant \(Y_{\rm rd}/\sqrt N\) is sharp because the
radial Euclidean tests for the round value on the cover can
be taken \(\Gamma\)-invariant. For these tests use the radial
stereographic sphere factor and a radial cutoff at infinity.
The retained source cutoff test is supported away from the
attaching region and extends by zero in the source, giving
the other localized coefficient \(Y_0\).

The stretched angle on the unmodified quotient buffer has
\(|d\chi|^2+|d\xi|^2=O(\ell^{-2})\) and the volume is
\(O(\ell/N)\). The IMS coefficient therefore has \(L^2\) norm
at most \(C N^{-1/2}\ell^{-3/2}\). The IMS identity and
Hölder apply to smooth invariant lifts and hence to the
quotient. The \(L^2\) triangle inequality for the squares
of the localized functions proves (2).
[Classical form and IMS computation](E01_TWO_CAP_AUDIT_20261125.md#yamabe-localization-on-each-side)

## Choice of margins and use

Choose \(\ell\) large enough that
\(C_I\ell^{-3/2}\le\tfrac12\min\{y_0,Y_{\rm rd}/2\}\),
then ask for \(C_\ell(a+d)\le\tfrac12\). This choice of
\(\ell\) suffices for all group orders in the cover-normalized
hypotheses and yields \(Y([\widehat g_j])\ge
\tfrac12\min\{y_0,Y_{\rm rd}/(2\sqrt N)\}\).
If the \(L^4\) derivative input is specified downstairs,
the form comparison needs \(a+N^{1/4}d_{\downarrow}\) small.
For the Weyl bound a strict prescribed net margin follows
by choosing \(2\sqrt q\,\Delta+\Delta^2\) below it.
If the energy needed is the absolute contribution to a
specified side, use the individual square-root bound rather
than the combined net estimate. The calculation gives no
fourth-order Bach estimate. A B01 or extraction result
must supply the embedded chart and the first-order controls.
For a nontrivial group the modeled filling is orbifold;
smooth filling and the use of a productified slice to test
its link are separate questions.
