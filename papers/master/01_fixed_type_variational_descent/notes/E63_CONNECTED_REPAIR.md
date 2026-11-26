# MASTER-E63a · Chiral transfer through one marked connector

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E execution, request v1 under
DESC B01. The selected lead was GPT-6.2 Astra/ultra and the request
specified GPT-6.2 Sol/ultra. Actual serving model and reasoning effort
were unavailable. Frozen working TeX generations for descent and master
begin `1dcb565392f85fb3` and `8442d18fd7d4e142`, respectively. Individual
checked inputs begin `8063d76ad6875e80` for the
[E61 spectral windows](../manuscript/spectral_windows.tex),
`9b08ae7f625363b0` for [collar capacity and signed costs](../manuscript/collar_capacity.tex),
and `12ccdc604b69034a` for [E39 first-order comparison](../../notes/E39_MARKED_COMPETITOR.md).
[Launch](../../continuation-notes/AFTER_SUBCRITICAL_CHARGED_DISKS_20261125.md)

A clamped repair of two oppositely imbalanced disks can save more than
the sum of their weaker chiral charges only by carrying a relative
connection flux through the connector, up to its raw energy. Along a
long thin connector the flux at some transverse slice is small under
bounded critical first-order and full-curvature norms. A smooth arc on
the actual source can be flattened in its thin interior at arbitrarily
small joined cost, and this flattening has vanishing flux. Thus inexpensive
raw geometry along an arc does not give a way to use cancellation of
opposite endpoint imbalances. A separate first-order cutoff test on a
supplied connected chart gives the finite signed comparison.

## The actual marked patch

Fix one smooth volume-one positive Yamabe metric \(g=g_i\) in the E61
sequence on the closed oriented smooth homotopy four-sphere \(M\).
Use \(e=E_\pm(g)=e_i<2T\), \(T=4\pi^2\), \(I=I^+(M)\), and
\(E_\pm(g;U)=\int_U |W_g^\pm|_{\mathrm{HS}}^2dV_g\).
The incoming chiral measures are \(\lambda^\pm\). An E61 disk has
one fixed positive sign and small raw curvature on its marked two-sided
collar. With the stated full-curvature ceiling small enough, the
exterior has positive charge in each chirality since
\(4\lambda^\pm\le |\mathrm{Rm}_g|_{\rm tens}^2dV_g\).
This does not ensure a regular limiting point carrying the opposite
sign at a prescribed auxiliary scale. At each actual index a small
smooth disk in the exterior can carry that sign.

If the first disk has positive net imbalance
\(p=\lambda^+(D_1)-\lambda^-(D_1)>0\), there is also a finite-source
choice with opposite imbalance at least \(p-2\epsilon\). The exterior
has net negative imbalance \(p\), so its open positive-density region
for \(\lambda^--\lambda^+\) has positive-part mass at least \(p\).
Choose finitely many pairwise disjoint small coordinate balls compactly
in this region carrying at least \(p-\epsilon\) of that signed mass.
This follows by fine ball differentiation and finite truncation on the
fixed smooth source. Join the balls in its exterior by an embedded
tree of thin arcs. Take thin tubes and round their feet so the added
raw absolute chiral mass is less than \(\epsilon\). The smoothed
boundary connected sum is a single marked standard disk \(D_2\) in
the exterior of \(D_1\). This construction fixes the source index
before choosing the balls and tube widths. It gives no uniform collar
estimates for \(D_2\).

For clarity, to join two disjoint collared disks, choose an embedded
arc in their exterior from one face to the other, transverse at the
endpoints. The exterior is connected: replace portions of paths through
either disk by paths on its connected boundary, then push into the
exterior. Paths, attaching arcs, and any finitely many earlier arcs
can be separated in the four-dimensional interior by a smooth
perturbation fixing the prescribed tips. Choose each tip straight
in a collar chart at its face and choose the attaching three-ball
inside that chart. The normal bundle of the arc is trivial over its
interval, with frames at the two ends chosen to fit the marked
attaching three-balls. A product tube uses those local identifications.
The two balls with this one handle are their boundary connected sum.
With these local standard attachments the interior model is two balls
joined by a product handle, diffeomorphic after corner rounding to a
standard ball. For many balls the same argument applies one edge of a
tree at a time. The smooth parametrization of the union gives the
actual cap mark. It uses the induced outer marking of the rounded
patch and the original marks off the attaching neighborhoods.

We use a rounded connected patch \(D=P_1\cup V\cup P_2\), with a
protected tubular shaft \(V=(0,L)\times B^3_\rho\) in actual smooth
coordinates, and with opposite end lobes \(P_j\) containing the
original disks. The coordinates extend smoothly to the shaft's
faces. Roundings and matching strips near the tips are included in
the lobes, away from the two end cuts of the protected shaft. The
lateral wall of the shaft lies in \(\partial D\). The constructions
allow arbitrarily small extra raw chiral masses in the end strips and
shaft at a fixed smooth source. Those costs refer to \(g\) alone.

Let \(h\) be any smooth clamped candidate metric, meaning \(h=g\)
near and outside \(\partial D\). An exterior fixed up to a smooth
conformal multiplier can be treated by choosing a clamped
representative when the multiplier extends through the matching
germ. All norm bounds below must hold in that representative. A
deformation \(h=u^2g\) everywhere produces zero energy change.

## Flux and the upper bound on common gain

Let \(A=\nabla^h-\nabla^g\) be the globally defined
\(\operatorname{End}(TM)\)-valued one-form, and \(F_h,F_g\) the
curvature forms of the two Levi-Civita connections on the same
tangent bundle. The signed chiral density satisfies
\[
 \Theta_g=(|W_g^+|_{\rm HS}^2-|W_g^-|_{\rm HS}^2)dV_g
 =-\tfrac12\operatorname{tr}(F_g\wedge F_g).
\]
Indeed in an oriented \(g\)-orthonormal frame the last expression
is \(\sum_{a<b}(F_g)_{ab}\wedge(F_g)_{ab}\). The coefficient of
\(dV_g\) is the trace of \(\mathcal R_g^{*}\circ *\circ\mathcal R_g\) for the
curvature operator on real two-forms. The off-diagonal blocks have
equal squared norm and cancel, as do the scalar parts of the diagonal
blocks \(W^\pm+R_g/12\). This establishes the pointwise normalization.

On the common bundle set \(\nabla_t=\nabla^g+tA\), not necessarily
a Levi-Civita connection. Differentiating
\(\operatorname{tr}(F_t\wedge F_t)\) and using the Bianchi identity
gives \(2d\operatorname{tr}(A\wedge F_t)\).
Integrating in \(t\), using
\(F_t=F_g+t d^{\nabla^g}A+t^2 A\wedge A\), gives
\[
 \Theta_h-\Theta_g=dQ,\qquad
 Q=-\tfrac12\operatorname{tr}\left(
 A\wedge(F_h+F_g)-\tfrac13 A\wedge A\wedge A\right).
 \tag{1}
\]
The formula is the quadratic relative Chern–Weil transgression.
[Chern–Simons, §3, Proposition 3.2 and equation (3.4), proof](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf)

In the shaft use the Euclidean product coordinate component norms
for tensors on the common bundle and \(dt\,dz\) for integration.
For the transverse slice \(S_t=\{t\}\times B_\rho^3\) give \(S_t\)
the boundary orientation of the left piece, and let
\(\varphi(t)=\int_{S_t}Q\). Stokes gives signed increments
\(\int_{D_{\rm left}(t)}(\Theta_h-\Theta_g)=\varphi(t)\) and
\(\int_{D_{\rm right}(t)}(\Theta_h-\Theta_g)=-\varphi(t)\).
The contributions off this slice vanish since \(h=g\) near
the exterior wall. The traces or gauges of the two curvatures need
no independent trivializations.

Fubini and Hölder give a slice \(t_*\in(0,L)\) with
\[
 |\varphi(t_*)|\le \mathcal B,\qquad
 \mathcal B=C(\rho/L)^{3/4}
       \big[\|A\|_{4,V}(\|F_g\|_{2,V}+\|F_h\|_{2,V})
                  +\|A\|_{4,V}^3\big].
 \tag{2}
\]
Indeed, integrate the pointwise bound
\(C(|A|(|F_g|+|F_h|)+|A|^3)\) over the coordinate cylinder,
apply Hölder with a factor \(|V|^{1/4}\), and divide by \(L\).
Both norms have the dimension-four critical scaling in these
coordinates. If needed they can be controlled by a uniformly comparable
metric in the same chart. In uniformly elliptic coordinates,
\(|A|\le C(|D(h-g)|+|h-g||Dg|)\) and
\(|F_h|\le C(|D^2h|+|Dh|^2)\) follow from the connection formula.
Full curvature enters (2). A bound only on the Weyl blocks of
the candidate does not provide this estimate.

Since the exterior is retained, the two global gains are equal.
Write \(G=e-E_\pm(h)\) and \(m_j^\pm=\lambda^\pm(P_j)\), and set
\(M_g(V)=(\lambda^++\lambda^-)(V)\). Choose the weaker incoming
sign in each lobe. If the signs match, estimate \(G\) in that sign
on the two pieces separated at \(t_*\), dropping nonnegative final
energies. If they differ, use the sign on one side globally and
switch sign on the other side using the difference of the two
local gains from (1). The absolute price of this switch is one
\(|\varphi(t_*)|\). The original shaft portions contribute at most
\(M_g(V)\). Thus
\[
 G\le
 \sum_{j=1}^2\min\{m_j^+,m_j^-\}
              +M_g(V)+\mathcal B .
 \tag{3}
\]
The energies of the added end strips can be separately charged if
the measured cores are smaller than the lobes. A fixed gain beyond
the first two terms forces the bracket in (2) to grow at order
\((L/\rho)^{3/4}\) or faster. This rules out a leading gain from the
opposite excesses for clamped candidates on increasingly thin
connectors with bounded critical norms and vanishing raw shaft
charge. It applies irrespective of candidate Yamabe sign. It allows
large connection norms or full curvature, different support
geometry, or significant common charge in the individual lobes.

## An inexpensive flat shaft on the same source

In a protected middle interval choose physical Fermi coordinates
along the actual smooth unit-speed arc with a smooth orthonormal
normal frame. On the axis the pullback metric is the Euclidean
product. With \(v=g-\delta\) in this chart, smoothness on the
fixed compact arc gives
\(\|v\|_\infty\le C_i\rho\) and
\(\|Dv\|_\infty+\|D^2v\|_\infty\le C_i\) at small \(\rho\).
The constants may vary with the index and the arc. For
\(0<\rho\ll L\), take a cutoff \(\chi\) equal to one on a
smaller middle shaft and zero near the lateral wall and both
end faces, with \(|D^j\chi|\le C\rho^{-j}\) for \(j=1,2\).
The path \(p_s=\delta+(1-s\chi)v\) is smooth on the actual
source after extending by \(g\), and is positive definite.
It leaves the two cores and the tip attachments fixed.
At \(s=1\) the protected smaller shaft is exactly flat in
this chart.

The all-lowered Riemann tensor's principal part is constant
coefficient in the second metric derivatives. Subtracting
\((1-s\chi)\mathrm{Rm}_{\rm low}(g)\) leaves cutoff terms of
pointwise size at most \(C_i s/\rho\), by the bounds on \(v\),
\(Dv\), \(\chi\) and their products. The chiral projection and
density change by \(O_i(s\rho)\) as algebraic maps. For each
sign the density error on the shaft is bounded in \(L^2\) by
\(C_i s\sqrt{L\rho}\). Its raw chiral energy is at most
\(C_i L\rho^3\). Adding the unchanged energy outside the
shaft gives the joined bound
\[
 E_+(p_s;M)\le e+C_i L\rho,\qquad 0\le s\le1.
 \tag{4}
\]
After choosing \(\rho\) small at the fixed index it is strictly
below \(2T\), so the inherited scalar-flat wall keeps this a
positive path on \(M\). The modified connection difference is
bounded by \(C_i\) in coordinates and \(F_{p_s}\) by
\(C_i/\rho\). Each transverse slice therefore has absolute
flux at most \(C_i\rho^2\) by (1). This actual flattening
cost and flux can both be made arbitrarily small. They do not
straighten a round bicollar of the boundary of the joined patch.

## Signed sufficient test in a supplied connected chart

Suppose a single actual marked chart covers the whole changed
region, with a smooth flat background \(\delta\) in its coordinates.
Let \(p=g_{\rm chart}\) after any fixed smooth conformal normalization,
put \(v=p-\delta\), assume \(\|v\|_\infty\) small on the changed
support, and take a smooth cutoff \(0\le\chi\le1\) supported there,
equal to one on both measured cores. Use the same interpolation
\(p_s=\delta+(1-s\chi)v\), restoring the source multiplier.
Let \(U\) contain the cutoff support compactly in the chart. One may
use the measured allowance
\[
 \begin{aligned}
 B=C\big(&\|\chi |v|\,|\mathrm{Rm}_{p,\rm low}|\|_{2,U}
       +\|\chi|Dv|^2\|_{2,U}
       +\||D\chi|\,|Dv|\|_{2,U}\\
       &+\||D^2\chi|\,|v|\|_{2,U}
          +\||D\chi|^2 |v|^2\|_{2,U}\big).
 \end{aligned}
 \tag{5}
\]
All component norms in (5) use this one chart. The first term
comes from the change in chiral projection and measure on the raw
curvature. The remaining terms follow by expanding the second
derivative of \((1-s\chi)v\) and the quadratic first derivative
part of the all-lowered curvature. The mixed quadratic term
\(s|D\chi|\,|v|\,|Dv|\) is absorbed by the third term. Each
error carries a factor \(s\) after using \(s^2\le s\).
This is an explicit-width version of the first-order cutoff:
derivatives of \(\chi\) are counted across the entire connector,
its feet, and the outer transition strips.

For each sign put
\(S^\pm=\lambda^\pm(U)\) and
\(H^\pm=\int_U (1-\chi)^2\,d\lambda^\pm\).
The squared Hilbert norm of the leading path plus error is
bounded by the maximum of its endpoint squares as in the
signed collar argument. The joined bound is therefore
\(e+\max\{0,(\sqrt{H^\pm}+B)^2-S^\pm\}\).
If both the threshold and strict endpoint tests
\[
 e+\max\{0,(\sqrt{H^\pm}+B)^2-S^\pm\}<2T,\qquad
 S^\pm-(\sqrt{H^\pm}+B)^2>e-I
 \tag{6}
\]
hold for one sign, this clamped cutoff produces a positive
same-type competitor below \(I\). Since \(I\le e<2T\), the strict
endpoint inequality here implies the joined bound is \(e<2T\).
The exact energy outside the
changed region is retained, and (6) gives both the required
path sign and signed endpoint without a separate scalar bound.
The E61 bicollar controls its incoming curvature but neither the
width-dependent errors in (5) on the whole changed chart nor the
first-order and full-curvature terms for a candidate through the
connector. Equation (3) is an independent necessary restriction on
any strict comparison using that connector.
