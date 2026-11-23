# SP4-CME-E85 — Audit of the smooth tame pointed local section

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E79 and E81.
I did not author E71, E80, E82 or E83. This audit independently
checks E82, E83 and their combination, using the assessed
infinitesimal inputs. All five frozen digests in the
[request][req] matched before use. [B49][b49]. [Return][ret].

**Disposition.** E82 provides the jointly smooth tame solver
required by E83 on an open neighborhood. E83 constructs a
smooth tame map of the full local automorphism and fixed
slice parameters, with a jointly smooth tame family of
differential right inverses. Hamilton III.1.1.3 applies.
The construction in Hamilton's proof gives the section
through \((\operatorname{id},0)\) at \(A_0\). I found no
substantive proof gap. The conclusion is a local choice
of representatives in the smooth topology. Orbit uniqueness,
an invariant intersection theorem and coverage of the full
value-small basin are distinct questions.

## Fresh Hamilton source check

Richard S. Hamilton, *The inverse function theorem of Nash and
Moser*, Bulletin (New Series) of the American Mathematical Society
7(1), July 1982, 65–222, DOI
`10.1090/S0273-0979-1982-15004-2`. On 22 November 2026 I
reopened the indexed text of the exact original AMS publisher
PDF. Live publisher fetch returned HTTP 403. Targeted search
and line-addressable opens of the indexed text gave selected
primary passages. No Hamilton PDF was downloaded or retained,
and there is no local byte count, digest or visual page check.
This is a fresh passage check separate from E81. Version and
bibliography key R24 / `Hamilton1982NashMoser` are unchanged.
[AMS publisher PDF][ham]. [Canonical record][canon]. [E81][e81].

| Printed primary locator | Item verified |
| --- | --- |
| I.1.1.5 p. 68, II.1.3.1–1.3.4 p. 136, II.1.3.9 p. 139 | Smooth-section gradings, tame retracts and products. |
| II.2.1.1 p. 140 and end of II.2.1 p. 143 | Local fixed grade shift per derivative. |
| II.2.2.6–2.2.7 pp. 145–146, II.2.3.1–2.3.6 pp. 146–149 | Finite-jet and bundle-section maps, composition with compact source and intermediate manifolds, compact-manifold diffeomorphism inversion. |
| II.3.1.1 p. 150, II.3.3 pp. 155–159, especially Theorem 3.3.3 p. 158 and Lemma 3.3.4 pp. 158–159 | Continuous tame inverses of smooth tame linear families, admissible mixed gradings, fixed finite-dimensional augmentation and local tame estimate. |
| III.1.1.3 p. 172, III.1.2.1–1.2.3 pp. 172–174 | Right-inverse theorem on an open domain, enlargement and normalization at the chosen preimage. |
| III.1.5.1 p. 179, III.1.6.9–1.6.10 pp. 184–185, III.1.7.1 p. 187 | Zero initial iterate, convergence and size control, smooth tame dependence of the selected limit. |

## E82 elliptic block and the common gradings

On the compact closed oriented round \(S^4\), use the smooth
positive perfect connection \(A_0\), its native metric \(g_0\),
the internal positive negative-Killing pairing, and their
fixed derivative. Take a common positive radius \(\epsilon_*\)
for E79 and E82, including E79's symbol margin. For
\(B=A_0+b\), the condition
\(\|b\|_{C^0}+\|F_B-F_0\|_{C^0}<\epsilon_*\)
is open in \(C^1\) and hence in the smooth topology.
The fixed kernel \(N=\ker(d_0^*\Pi_0d_0)\) is finite dimensional
and smooth. Write \(P_N\) for the \(L^2\) projection with
codomain \(N\), \(i:N\to\Gamma^\infty E\) for inclusion,
and \(\mathbf P_N=iP_N\). E79 and E80 give
\(P_NK_Bh=0\) on smooth sections and the bounded weak
inverse on \(N^\perp\), with higher regularity. [E71][e71].
[E79][e79]. [E80][e80].

The block is
\[
 (K_B h+i x,P_Nh)=(k,y),\qquad
 x=P_Nk,\quad
 h=iy+B_B\big((I-\mathbf P_N)k-K_Biy\big),
\]
where \(B_B\) is E79's restricted inverse. Projection of
the first equation forces \(x=P_N k\), and the second
fixes the \(N\) component of \(h\). The remaining forcing
annihilates \(N\). Smoothness and uniqueness follow from
E79's restricted inverse and regularity. When \(k\in L^2\),
\(K_Biy\) is smooth and
\(\|h\|_{H^2}+|x|\le C_B(\|k\|_2+|y|)\)
from the weak \(H^1\) bound and elliptic \(H^2\) estimate.
Thus this is also an isomorphism \(H^2\times N\to L^2\times N\)
for each fixed \(B\).

The rank-one symbol of \(K_B\) has Hermitian part
\(\ge|\xi|^2 I/3\) in the \(i\xi\) convention. It is
invertible for each nonzero real covector. On the full
smooth operator-coefficient space, \(C^0\) perturbations
of coefficients give small \(H^2\to L^2\) perturbations.
The fixed block is therefore locally invertible there by
Neumann series, and ellipticity and smooth regularity
persist on that neighborhood. This argument applies to
nearby arbitrary smooth coefficient sections with the
same fixed \(i,P_N\). Such perturbed operators need not
retain \(P_NK=0\), which is used only for the displayed
inverse at a geometric \(B\). The mixed \(C^n\)-coefficient,
\(H^n\)-section grading is allowed on p. 156 with \(p=2\).
Here \(|P_Nh|\le\|h\|_2\le\|h\|_{H^1}\) meets the order-two
constraint bound used in the proof, and
\(\|ix\|_{H^n}\le C_n|x|\) follows from a fixed smooth basis.
The theorem concerns invertibility of the augmented block.
The unaugmented \(K_B\) remains subject to the stated
kernel and image conditions. [E82 (2), (5)–(7)][e82].
[Hamilton II.3.3.3–3.3.4][ham].

For coefficient order, expand
\(K_B h=d_0^*(\Pi_B(D_0h+[b,h]))\).
The principal part is \(-(\Pi_B)_i{}^jD_0^iD_{0,j}h\);
the product rule gives terms with \(D_0\Pi_B\), \(b\)
and \(D_0b\) below it. Since \(\Pi_B\) is a smooth
function of the first jet on the pointwise \(C_B\)-invertible
locus, \(D_0\Pi_B\) can use second derivatives of \(b\).
The coefficient section is a smooth map of \(J^2 b\)
into \(\operatorname{Hom}(J^2 E,E)\).
Likewise \(d_0^*\Pi_Br\) uses at most \(J^2b,J^1r\).
Hamilton's local finite-jet rule gives tame dependence
for these maps and their parameter derivatives. In the
mixed estimate, the high coefficient norm multiplies
low data norms, with locally bounded low coefficient
norms. This proves local tame dependence under the
augmented theorem. Pointwise weak value control alone
supplies none of the needed bounds on the second jets.
On the fixed compact base, \(H^n\) is bounded by \(C^n\)
and \(C^n\) by \(H^{n+3}\), giving tame equivalence to
E83's section grading. [E82 (3)–(4), (7)][e82].
[Hamilton II.2.2.6–2.2.7 and II.3.3.4][ham].

For the forcing \(k=d_0^*\Pi_Br,\ y=0\) one has \(x=0\)
and \(h=\phi\perp N\). Applying \(H_B\) and \(\Pi_B\)
to \(r-d_B\phi\) gives \(u\) and \(s\) and proves
\(r=d_B\phi+S_Bu+s\), with \(S_0^*s=d_0^*s=0\). These
identities have precisely E83's signs and fixed constraints.
The target slice \(\mathcal X\) is a tame subspace by
E71's projection and the estimate
\(\|\mathcal P_0r\|_{C^n}\le C_n\|r\|_{C^{n+3}}\).
Its inclusion is degree zero, and the retraction realizes
the ambient smooth tame \(s\) as a map into the inherited
grading. The E82 invariant lift
\(Y=\chi_{A_0}(u)+(\phi-b(u))^\#\) uses a pointwise
correction, so \(B(Y)=\phi\) and \(\pi_*Y=u\).
Its fixed base-to-total-space identification and inverse
use local sections and fixed smooth coefficients, with
the same derivative order. Thus the E82 outputs match
the gradings used for E83's chart and the solver is
linear in the target direction at each \(b\).
[E71 (11)][e71]. [E82 (8)–(11)][e82].

## E83 chart, action and exact right inverse

On the compact principal \(SO(3)\) bundle \(P\), the
metric \(k=\pi^*g_0+\langle A_0,A_0\rangle\) is positive
on the horizontal and vertical summands and invariant
under the principal right action. Averaging pullbacks
of vector fields by these right isometries gives a fixed
projection onto invariant fields. The covariant derivative
for \(k\) commutes with their pullback, so the projection
has degree zero in the total-space \(C^n\) grading.
This makes the full automorphism chart model \(\mathfrak a\)
a tame retract of a section space. The product
\(\mathfrak a\times\mathcal X\) and the affine model
\(\mathcal V=\Gamma^\infty(T^*S^4\otimes E)\) are tame.
[E83, fixed spaces][e83]. [Hamilton II.1.3][ham].

In the uniform exponential and logarithm domain, the map
\(g_Z(p)=\exp_p^k Z(p)\) is equivariant for invariant \(Z\).
Small \(C^1\) norm makes each \(g_{tZ}\), \(0\le t\le1\),
a local diffeomorphism. The compact connected oriented
total space then makes each map a finite covering.
The path starts at the identity and its degree is one.
The locally constant orientation sign is positive along
the path, so the covering degree counts one sheet.
The equivariant inverse descends along with \(g_Z\), using
local bundle sections, to an inverse on the base. The
descended path shows that the base map preserves orientation.
The inverse chart is the pointwise logarithm in the
uniform diagonal tube. The graph and small \(C^1\) conditions
define a relative open chart, with the two pointwise maps
smooth tame. Its parameter domain is open in
\(\mathfrak a\), which is the openness needed for the theorem.
[E83, exponential chart][e83]. [Hamilton II.2.3][ham].

The affine connection pullback preserves reproduction
of fundamental vectors and equivariance. The two
connection terms can therefore be subtracted in the
horizontal equivariant tangent model. In fixed
coordinates the operation \(B(g_Z(p))Dg_Z(p)\) uses one
spatial derivative of \(Z\), composition and contraction.
Hamilton's composition applies on the compact total
space. Its inverse operation uses compact-manifold
diffeomorphism inversion. As \(g_Z\) is equivariant,
the tangent representatives and their inverses keep
the correct fibers. In the equalities below,
\(L_Z(p)=D_v\exp_p^k|_{Z(p)}\) is the invertible
fiber derivative. It and its inverse have pointwise
smooth dependence on \(Z(p)\).
[E83 (1) and affine action][e83]. [Hamilton II.2.2–2.3][ham].

Set \(\widetilde F(Z,b)=g_Z^*(A_0+b)-A_0\).
For an invariant field \(Y\), the chart tangent
\(\dot Z=L_Z^{-1}(Y\circ g_Z)\) has along-map variation
\(Y\circ g_Z\). Writing \(g_t=h_t\circ g_Z\) differentiates
the active pullback, so
\[
 (g_Z^{-1})^*D\widetilde F(Z,b)(\dot Z,s)
     =s+\mathcal L_Y B
     =s+d_B(B(Y))+\iota_{\pi_*Y}F_B .
\]
In the principal Cartan formula the curvature bracket
\(\iota_Y(F_B-dB)=[B(Y),B]\) cancels \([B,B(Y)]\)
from the covariant derivative.
Given \(r\), use E82 with \(r'=(g_Z^{-1})^*r\). Its
actual-\(B\) lift yields \(s+\mathcal L_YB=r'\). Therefore
\[
  \mathcal R(Z,b)r=(L_Z^{-1}(Y\circ g_Z),s),\qquad
  D\widetilde F(Z,b)\mathcal R(Z,b)r=r .
\]
This is defined for all smooth target directions and all
points of the product of the open chart and the open
intersection of the E82 tube with \(\mathcal X\).
The \(\phi\perp N\) convention occurs inside the solver.
The chart tangent stays in the full automorphism model.
[E82][e82]. [E83 (1)–(3)][e83].

The grade count also agrees. Direct and inverse pullback
use one derivative of the diffeomorphism. Zero-order
composition and inversion on their fixed low-norm
neighborhoods have no extra shift at parameter order zero.
For example the first inversion variation is
\(-D(g^{-1})(\dot g\circ g^{-1})\); differentiating
\(g\circ g^{-1}=\operatorname{id}\) at order \(j\)
and solving for the highest inverse variation uses
spatial derivatives of \(g\) through order \(j\) and
of directions through order \(j-1\). The one spatial
derivative in pullback raises the available shift to
\(j+1\). The final translated composition \(Y\circ g_Z\)
may add \(j\) more. Therefore a shift bounded by
\(2j+1+\max_{0\le q\le j}\ell_q\) is sufficient as
in E83, where \(\ell_q\) are local tame shifts for the
solver derivatives. Low seminorm bounds may be enlarged
for each derivative order. The inherited gradings cause
no additional shift for \(\mathfrak a\)- and
\(\mathcal X\)-valued outputs. This verifies the joint
family needed by the theorem. [E83, degree count][e83].
[Hamilton II.2.1 and II.2.3.3–2.3.6][ham].

## Pointed application and precision corrections

Hamilton III.1.1.3 requires the smooth tame map on an
open domain in tame spaces and the jointly smooth tame
derivative right inverse there. These are
\(\widetilde F\) and \(\mathcal R\) above. The proof yields
the section based at the specified domain point.
In the surjective normalization III.1.2.1, if the target
is embedded as a tame summand with complement \(G'\),
the added target output is the \(G'\) coordinate passed
unchanged. Embed the original target with zero complement
and project the resulting section to the original domain.
The translations and linear normalizations III.1.2.2–1.2.3
center the prescribed point and preserve this reduction.
The algorithm III.1.5.1 starts at zero. Its zero-target
limit is zero by the size estimate in III.1.6.10, and
III.1.7.1 verifies smooth tameness of that particular
limit as a function of the target. Thus the centered
section takes \(0\) to \((0,0)\); translating back gives
\(g(A_0)=\operatorname{id}\) and \(b(A_0)=0\).
This argument fixes the pointed value of the constructed
section. It requires no claim about the pointed value
of an arbitrary right inverse. [Hamilton III.1.1.3 and
proof locators above][ham]. [E83, basepoint][e83].

The two editorial precisions are to cite Theorem II.3.3.3
itself on p. 158, with the augmentation setup starting
on p. 157, and to identify E83's displayed
\(H_{\rm tame}\) input by the E79 splitting or E82
(7), (10), (11), since the phrase “solver (6)” has no
local equation (6) in E83. Neither changes the proof.
The local section uses the open smooth topology. Its
neighborhood size and tame bounds may use higher finite
norms. No uniqueness modulo stabilizers, invariant orbit
intersection, or coverage of all value-small data is
asserted.

[req]: ../research-progress/handoffs/SP4-CME-E85_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E85_RETURN_v1.md
[b49]: ../brainstorm/notes/B49_SMOOTH_LOCAL_SLICE_SECTION_20261122.md
[e71]: ../notes/71_LINEAR_ROUND_SLICE_20261122.md
[e79]: ../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e80]: E80_ORBIT_INVERSE_AUDIT_20261122.md
[e81]: E81_NONLINEAR_SLICE_SOURCE_AUDIT_20261122.md
[e82]: ../notes/82_TAME_ORBIT_SOLVER_20261122.md
[e83]: ../notes/83_TAME_FULL_ORBIT_CHART_20261122.md
[canon]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#nonlinear-slice-primary-hypotheses--e81
[ham]: https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf
