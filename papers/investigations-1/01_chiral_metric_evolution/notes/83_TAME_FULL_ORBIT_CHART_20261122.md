# E83 — Tame full-orbit chart and a conditional pointed local section

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and chosen lead settings are unavailable.
I authored neither E71, E79 nor E81. This packet gives the full action
chart and derivative calculation. The jointly smooth tame parameter
solver checked separately in E82 remains the named premise here.
[Frozen request][req] · [B49][b49] · [Reference workflow][workflow].

## Fixed spaces and the invariant exponential chart

Let \(M\) be the compact oriented standard round Riemannian \(S^4\)
with fixed native \(g_0\) and positive perfect chiral connection
\(A_0\). Let \(\pi:P\to M\) be its compact principal \(G=\mathrm{SO}(3)\)
bundle, and \(E\) the adjoint bundle with the positive internal
negative Killing form. The affine space of smooth connections on \(P\)
is modeled on \(\mathcal V=\Gamma^\infty(T^*M\otimes E)\).
Let \(\mathcal X=\{b\in\mathcal V:S_0^*b=d_0^*b=0\}\), with
\(S_0u=\iota_u F_0\) and \(d_0=d_{A_0}\), using fixed adjoints.
Use the increasing \(C^n\) seminorms from fixed smooth metrics and
connections on the compact bases and on their bundles. E71 (11)
gives a fixed projection \(\mathcal P_0:\mathcal V\to\mathcal X\)
bounded on each nonnegative Sobolev order. The fixed four-dimensional
Sobolev inequalities then give
\[
 \|\mathcal P_0 b\|_{C^n}\le C_n\|\mathcal P_0b\|_{H^{n+3}}
       \le C_n'\|b\|_{H^{n+3}}\le C_n''\|b\|_{C^{n+3}} .
\]
Thus \(\mathcal X\) is tame complemented in this grading. The
inclusion has degree zero. The section, direct summand and product
facts follow from the specified Hamilton passages.
[E71, (7)–(11)][e71] · [Hamilton, I.1.1.5 and
II.1.3.1–1.3.4, II.1.3.9][ham].

On \(P\) put the fixed Riemannian metric
\(k=\pi^*g_0+\langle A_0,A_0\rangle\), with the second summand given
by the bilinear product of the principal connection form values.
The two terms are positive on the complementary horizontal and vertical
spaces. Right translations \(R_h\) are isometries because
\(R_h^*A_0=\operatorname{Ad}_{h^{-1}}A_0\) and the internal metric is
Ad-invariant. Write \(\mathfrak a=\Gamma^\infty(TP)^G\) for the
vector fields invariant under this action. The projection
\[
 (\operatorname{Av}Z)(p)
   =\int_G dR_{h^{-1}}\big|_{ph}\,Z(ph)\,dh
\]
uses normalized Haar measure. Group invariance of Haar measure
gives invariant output and identity on invariant inputs.
Since \(R_h\) preserves the Levi–Civita derivative of \(k\), the
sup norm of each covariant derivative up to order \(n\) of the
average is bounded by the corresponding input norm. Differentiation
under the integral follows from smoothness and compactness.
Therefore \(\mathfrak a\) is a degree-zero tame direct summand
of \(\Gamma^\infty(TP)\), with the fixed subspace grading. The
domain model \(\mathfrak a\times\mathcal X\) is tame.
[Hamilton, II.1.3.1–1.3.4 and II.1.3.9][ham].

Use the pointwise exponential
\[
 g_Z(p)=\exp^k_p Z(p),\qquad Z\in\mathfrak a
\]
on a fixed sufficiently small \(C^1\) ball \(\mathcal U\) about
zero. The diagonal has one uniform neighborhood on which
\((p,v)\mapsto(p,\exp^k_p v)\) is a smooth diffeomorphism from a
neighborhood of the zero section, by the injectivity radius on
compact \(P\). The geodesic exponential commutes with \(R_h\),
so \(g_Z(ph)=g_Z(p)h\). In fixed charts on compact sets the
derivative of \(p\mapsto\exp^k_p Z(p)\) is a smooth function of
the first jet and equals the identity derivative at zero.
Choosing the \(C^1\) ball small enough makes \(g_{tZ}\) a local
diffeomorphism for all \(0\le t\le1\), also in one uniform
diagonal chart tube. Compactness and connectedness of \(P\)
make each such map a surjective finite covering. The orientation
of the base and the invariant orientation on the connected
fiber orient \(P\). The path from the identity has degree one,
and all these local maps preserve orientation, so this covering
has one sheet. Hence every \(g_Z\) is a diffeomorphism. Its inverse
is equivariant. The forward and inverse maps descend smoothly
to the base by composing with local smooth sections and
projection, so the base maps are inverse diffeomorphisms. The
base path descended from \(g_{tZ}\) starts at the identity and
preserves the base orientation throughout.

The local inverse chart for a map with graph in the diagonal
tube is \(Z(p)=\log^k_p g(p)\). This is invariant when \(g\) is
equivariant, by the same isometry identity. These formulas give
a chart onto a relative open identity neighborhood in the
group of equivariant bundle automorphisms: the graph condition
is \(C^0\)-open and the \(C^1\) bound on the inverse chart is
open. Exponential and logarithm are smooth tame of degree zero
in fixed section or mapping charts because they are smooth
fiber operations with no spatial derivatives. Hamilton's
section chart result applies on the compact total space.
Multiplication and group inversion restrict from the checked
compact diffeomorphism operations to the equivariant chart
where their values are defined. The output is tame with the
complemented subspace grading, equivalently by composing the
ambient chart output with \(\operatorname{Av}\).
[Hamilton, II.2.2.6–2.2.7 and II.2.3.1–2.3.6][ham].

In the tube let
\[
 L_Z(p)=D_v\exp^k_p\big|_{Z(p)}
         :T_pP\longrightarrow T_{g_Z(p)}P.
\]
It is invertible there and both it and its inverse are smooth
finite-dimensional fiber maps of the zero jet. The chart tangent
\(\dot Z\) has along-map representative \(W(p)=L_Z(p)\dot Z(p)\).
Under \(R_h\), these along-map tangents transform by the
derivative at \(g_Z(p)\). The exponential isometry identity makes
\(L_Z\) and \(L_Z^{-1}\) intertwine the two derivatives. Thus the
right-translated representative \(Y=W\circ g_Z^{-1}\) is invariant.
Conversely for invariant \(Y\) the chart tangent is
\[
        \dot Z(p)=L_Z(p)^{-1}Y(g_Z(p)).                         \tag{1}
\]
These are jointly smooth tame identifications. For a direct
mapping-space proof of this use ordinary composition on the
compact total space, also for maps into \(TP\), together with
the fiber operation \(L_Z^{\pm1}\). The maps being composed land
in the indicated tangent fibers by construction.
[Hamilton, II.2.2.6 and II.2.3.1–2.3.6][ham].

## Affine connection action and its exact differential

Use the active pullback \(F(g,b)=g^*(A_0+b)\). The connection
axioms here are the principal reproduction
\(B(\xi^\#)=\xi\) for each fundamental vector and the
equivariance \(R_h^*B=\operatorname{Ad}_{h^{-1}}B\).
Every equivariant diffeomorphism carries each fundamental
vector to the corresponding fundamental vector. Thus \(g^*B\)
obeys both affine connection axioms, while the difference of two
connections is horizontal and equivariant. The latter is
exactly a section of \(T^*M\otimes E\). Pullbacks of these
tangent forms remain horizontal and equivariant, for the same
reason. In particular the centered coordinate target is
\(\widetilde F(Z,b)=F(g_Z,b)-A_0\in\mathcal V\). It is defined
on \(\mathcal U\times\mathcal B\), where \(\mathcal B\) is the
open subset of \(\mathcal X\) with \(B=A_0+b\) in the strict
E79 tube
\(\|b\|_\infty+\|F_B-F_0\|_\infty<\epsilon_*\).
The curvature identity \(F_B-F_0=d_0b+[b\wedge b]/2\) shows that
this is open in the fixed smooth topology, and it contains zero.
[E79, setup and (1)–(2)][e79].

In finite fixed trivializations the usual lift of a base tangent
one-form to a horizontal equivariant form on \(P\) uses degree-zero
fixed coefficients. Restriction via fixed local smooth sections
recovers the base components, with fixed transition maps and
cutoffs. Both directions are degree-zero tame. In total-space
coordinates the coefficient formula for a pullback is just
\[
       (g^*B)_p=B_{g(p)}Dg_p .
\]
Composition on the compact source and intermediate manifolds,
one spatial derivative of the map, and pointwise contraction
give joint smooth tameness of \(\widetilde F\) in the
indicated tame gradings. The same reasoning applies to
\((g^{-1})^*r\) for \(r\in\mathcal V\), using compact
diffeomorphism inversion. Fixed subtraction of \(A_0\) is affine
and degree zero. None of these operations treats the affine
connection form itself as a horizontal tangent.
[Hamilton, II.2.2.6–2.2.7 and II.2.3.1–2.3.6][ham].

At \(B=A_0+b\), let a chart tangent \(\dot Z\) have along-map
representative \(Y\circ g_Z\), and let \(s\in\mathcal X\).
For a path \(g_t\) with that derivative use
\(h_t=g_tg_Z^{-1}\), with \(h_0=\mathrm{id}\),
so \(g_t=h_tg_Z\). Differentiating \(g_t^*(B+ts)\)
gives the exact identity
\[
 (g_Z^{-1})^*D\widetilde F(Z,b)[\dot Z,s]
       =s+\mathcal L_Y B
       =s+d_B\phi+S_Bu,\quad
             \phi=B(Y),\quad u=\pi_*Y.                          \tag{2}
\]
The last equality is the connection Cartan identity:
\(F_B=dB+\tfrac12[B\wedge B]\), so
\(\mathcal L_YB=d(B(Y))+\iota_Y(dB)
                 =d_B(B(Y))+\iota_YF_B\).
The horizontal curvature contraction descends to
\(S_Bu=\iota_uF_B\). The active convention gives the displayed
plus sign. Fine's already checked inverse-pullback convention
has the negative sign on the infinitesimal action.
[E71, derivative and action][e71] ·
[E79, splitting and actual lift][e79] · [E81, Fine convention][e81].

## Conditional smooth tame differential right inverse

**Premise \(H_{\rm tame}\).** On the open smooth E79 value tube
for \(B\), the solver (6)
\[
 \phi=B_Bd_0^*\Pi_B r',\quad
 u=H_B(r'-d_B\phi),\quad s=\Pi_B(r'-d_B\phi)
\]
is jointly smooth tame in \((B,r')\) with the fixed section
gradings, with \(s\) in the fixed complemented \(\mathcal X\),
and linear in the target one-form \(r'\). Here \(B_B\) is the
E79 restricted scalar inverse and
\(\phi\perp N=\ker(d_0^*\Pi_0d_0)\) is its auxiliary choice.
This is the E82 dependency. E79's separate-order estimates
are used for the splitting identity and smooth output, while
the joint tame assertion in this paragraph is a premise.
[E79, (5)–(9) and regularity][e79] · [B49][b49].

Given \(r\in\mathcal V\), apply this solver to
\(r'=(g_Z^{-1})^*r\). Lift its \((\phi,u)\) at the
**actual** \(B\) to the invariant \(Y=\phi^\#+\chi_B(u)\).
In the fixed \(A_0\) splitting this can also be written as
\[
      Y=\chi_{A_0}(u)+(\phi-b(u))^\#.
\]
Indeed \(B(\chi_{A_0}(u))=b(u)\), and the corrected lift has
\(B(Y)=\phi\). It projects to \(u\). Here \(\phi^\#\) denotes
the vertical field from the equivariant \(\mathfrak{so}(3)\)-valued
function representing \(\phi\). For a fixed trivialization
\(p=s_0(x)h\), the same formula is
\((u(x),(\phi(x)-B_i(x)u^i(x))h)\). It is a fiber operation
with no spatial derivative of \(B,\phi,u\). The chart output is
the pair \(\mathcal R(Z,b)r=(L_Z^{-1}(Y\circ g_Z),s)\) from
(1). It lies in \(\mathfrak a\times\mathcal X\), and (2)
and the exact E79 splitting show
\[
      D\widetilde F(Z,b)\mathcal R(Z,b)r
        =g_Z^*(s+d_B\phi+S_Bu)=g_Z^*r'=r.                     \tag{3}
\]
The auxiliary choice \(\phi\perp N\) occurs only in the
solver, inside a right inverse on the full group chart.
In particular no nonlinear chart restriction or derivative
injectivity is required.

The degree count is fixed in the \(C^n\) grading. For the
maps themselves the exponential and logarithm, chart
fiber derivative/inverse, actual lift and tangent
translation have degree zero on local low-norm
neighborhoods. Hamilton II.2.3.4 gives degree-zero
composition on such neighborhoods, and the local
diffeomorphism inverse bound in II.2.3.6 is degree zero.
The factor \(Dg^{\pm1}\) in the direct or inverse pullback
costs one fixed derivative. Thus if the conditional solver
has local tame shift \(\ell\ge0\), the assembled map
\((Z,b,r)\mapsto \mathcal R(Z,b)r\) has shift at most
\(\ell+1\) locally, in the product norm.

For higher parameter derivatives, a fixed \(j\)-th derivative
of composition adds up to \(j\) spatial derivatives of the
outer map. The \(j\)-th parameter derivative of inversion
follows by differentiating \(g\circ g^{-1}=\mathrm{id}\) and
solving for the highest inverse variation with the inverse
Jacobian. The other terms use derivatives of \(g\) of orders
at most \(j\) and derivatives of the directions of orders at
most \(j-1\). Parameter derivatives of inverse pullback
therefore cost at most \(j+1\), including its one spatial
derivative. Products of these finite lists are tame in fixed
low norms by the pointwise finite-jet and composition rules.
For (3) the finite chain rule combines these shifts with
the shifts of the solver derivatives up to that order and
with \(j\) more derivatives for the final composition in
(1). In particular a shift bounded by
\(2j+1+\max_{0\le q\le j}\ell_q\) suffices locally if
\(\ell_q\) are the local tame shifts of the corresponding
solver derivatives. The low seminorm bound can depend
on the derivative order and neighborhood. Each shift is
independent of the output grade \(n\), which is the
requirement of smooth tameness. The complemented subspace
topologies introduce no further shift for these outputs,
since their sections already lie in the subspaces and the
gradings are inherited. This verifies a joint family, on
the entire local chart domain and arbitrary smooth target
directions, conditional on \(H_{\rm tame}\).
[Hamilton, II.2.1, II.2.2 and II.2.3][ham].

## Conditional Hamilton conclusion and basepoint

The hypotheses of III.1.1.3 are an open domain in a tame
graded Fréchet space, a smooth tame map into another tame
space, and a jointly smooth tame derivative right inverse
at every point of the chosen open domain. Here they are,
respectively, \(\mathcal U\times\mathcal B\) in
\(\mathfrak a\times\mathcal X\), the centered target
\(\mathcal V\) and map \(\widetilde F\), and (3) under
\(H_{\rm tame}\). It follows conditionally that every sufficiently
near smooth connection \(A\) has a jointly smooth tame
local assignment \((g(A),b(A))\) with
\(A=g(A)^*(A_0+b(A))\), \(b(A)\in\mathcal X\).
Equivalently \((g(A)^{-1})^*A-A_0\) satisfies the two
fixed equations. This uses the full group parameter.
[Hamilton, III.1.1.3, p. 172][ham].

The section can be chosen through the chosen preimage
\((\mathrm{id},0)\) for \(A_0\). This is verified in the
proof, in addition to the theorem statement. III.1.2.1
passes to tame sequence spaces by adding complementary
factors. In the surjective case the enlarged map acts by
the original map on the original domain component and
the identity on the added target component. A section at
zero of the normalized enlarged problem restricts to a
section by inclusion of the original target with zero
complement and projection to the original domain.
III.1.2.2 translates a prescribed preimage and its image
to zero, and III.1.2.3 uses invertible linear changes
that preserve zero. III.1.5.1 starts the smoothed residual
algorithm at \(f(0)=0\) for the normalized map \(P_*(0)=0\).
For zero target the zero path solves that algorithm, and
the uniform estimate in III.1.6.9–1.6.10 bounds its
constructed solution by the norm of the target, so its
limit at the zero target is zero. III.1.7.1 establishes
smooth tame dependence of this specific algorithm limit
for the derivative-right-inverse case. Reversing the
sequence-space, linear and translation normalizations
gives \(g(A_0)=\mathrm{id}\) and \(b(A_0)=0\). This is a
choice of a local section through the reference in the
smooth topology, with no claim of orbit uniqueness or
placement for the full value-small or critical basin.
[Hamilton, III.1.2.1–1.2.3, III.1.5.1,
III.1.6.9–1.6.10, III.1.7.1][ham].

## Primary evidence and input versions

Primary source: Richard S. Hamilton, *The inverse function
theorem of Nash and Moser*, Bulletin (New Series) of the
American Mathematical Society 7(1), July 1982, pp. 65–222,
DOI [10.1090/S0273-0979-1982-15004-2][doi]. On 22 November
2026, America/New_York, I freshly inspected the following
selected passages in the indexed text of the exact original
[AMS publisher PDF][ham]. Direct URL fetch via the PDF find
tool returned HTTP 403. Indexed publisher text was available
by targeted search and then line-addressable opens. No
local PDF was downloaded or retained, so a file path, file
size and file hash are unavailable. No page-image or full-proof
inspection is claimed. The earlier E81 access history remains
the separate check in the canonical record.
[E81 source audit][e81] · [Canonical provenance][canon].

| Freshly inspected primary passage | Exact use here |
| --- | --- |
| I.1.1.5, p. 68, and II.1.3.1–1.3.4, II.1.3.9, pp. 136 and 139 | Fixed section gradings on compact bases, tame retracts and products, and tameness of smooth sections of vector bundles. |
| II.2.1.1 and closing smooth tame definition, pp. 140 and 143 | Local fixed grade shifts and tameness of each parameter derivative. |
| II.2.2.6–2.2.7 and II.2.3.1–2.3.2, pp. 145–146 | Fiber operations and finite jets, compact-source section and mapping charts. |
| II.2.3.3–2.3.6, pp. 147–149 | Composition for compact source and intermediate manifolds and smooth tame inversion for compact-manifold diffeomorphisms. First derivative bounds and local inverse estimates use the fixed low norms. |
| III.1.1.3 and III.1.2.1–1.2.3, pp. 172–174 | Right inverse hypothesis on the open domain and normalization at a chosen preimage. |
| III.1.5.1, pp. 179–180, III.1.6.9–1.6.10, pp. 184–185, and III.1.7.1, p. 187 | Zero-initialized algorithm and its finite-time tame size bound, limit is a solution and the selected limit is a smooth tame right inverse. These passages support the pointed clause. |

No new version was imported and no shared reference record
was edited. E82's proof is outside this packet.

| Consumed artifact | SHA-256 |
| --- | --- |
| [E83 request][req] | `9e4c2a46fe6752ba54c1f14584cef493a2bf5485ea657629034a4f55d01af114` |
| [E79][e79] | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| [E71][e71] | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |
| [E81][e81] | `79a114526efdbb770be36f2629c787d55766282ac5614df1e8b36eab627717db` |
| [B49][b49] | `cd74df4c88b8e33e97c5ed20242a7bb822f98fdbf2ddeca45c70bf4f131a7bdf` |
| [Reference workflow][workflow] | `aa50161913f3d06eaaa892c75fcd39fe05089c084a64eb88785e225c66849a0e` |

[req]: ../research-progress/handoffs/SP4-CME-E83_REQUEST_v1.md
[b49]: ../brainstorm/notes/B49_SMOOTH_LOCAL_SLICE_SECTION_20261122.md
[e71]: 71_LINEAR_ROUND_SLICE_20261122.md
[e79]: 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e81]: ../reviews/E81_NONLINEAR_SLICE_SOURCE_AUDIT_20261122.md
[workflow]: ../../../../REFERENCE_WORKFLOW.md
[canon]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#nonlinear-slice-primary-hypotheses--e81
[ham]: https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf
[doi]: https://doi.org/10.1090/S0273-0979-1982-15004-2
