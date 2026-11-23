# SP4-CME-E81 — Primary-source applicability for a finite orbit slice

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E79 and the
earlier E48 derivation and E73 audit. I did not author E71 or B48.
The requested E71 and E79 digests and Fine PDF digest matched.
E79 was returned and awaiting independent assessment at intake.
[Request][req]. [B48][b48]. [Return][ret].

**Disposition.** Hamilton supplies distinct two-sided and
right-inverse local theorems. The finite-dimensional augmentation
in his elliptic theorem matches the scalar block underlying E79
at the level of the displayed equations. The full orbit map has a
candidate pointwise differential right inverse, conditional on E79.
Its chart, smooth tame dependence and neighborhood bounds still
require verification. Fine's checked discussion supplies an
infinitesimal action, a gauge-fixed linear elliptic operator, and
time-dependent gauge changes. This audit establishes source
applicability conditions. Nonlinear slice existence is unresolved
here.

## Hamilton, published July 1982

Richard S. Hamilton, *The inverse function theorem of Nash and
Moser*, Bulletin (New Series) of the American Mathematical Society
7(1), July 1982, pp. 65–222, DOI
`10.1090/S0273-0979-1982-15004-2`. The first page and last
printed page were checked in indexed text from the original
[AMS publisher PDF][ams]. A separate [AMS bibliographic citation][amsbib]
confirms the DOI. The direct publisher fetch and attempted page
image returned HTTP 403. The selected full-text passages below
were accessible in the indexed text of that exact publisher URL.
There was no local Hamilton PDF download or retention, so the
stored-byte path, size and digest are unavailable. This is
selected-passage inspection through the text index.

| Hamilton passage, printed pages | Hypotheses and conclusion checked |
| --- | --- |
| II.1.3.1–1.3.4, p. 136, and II.1.3.9, p. 139 | Tame retracts and products are tame. Smooth sections of a vector bundle over a compact base are tame. |
| II.2.1.1, p. 140, and end of II.2.1, p. 143 | Locally on an open domain, tame estimates use a fixed grade shift above a base grade. Smooth tame requires smoothness and tameness of each derivative. |
| II.2.2.6–2.2.7 and II.2.3.1–2.3.6, pp. 145–149 | Smooth fiber maps induce tame section maps, and smooth finite-jet operators are smooth tame. Compact-base section charts are tame. Composition of smooth finite-dimensional maps is smooth tame for compact source and intermediate manifolds. Compact-manifold diffeomorphism inversion is smooth tame. |
| II.3.1.1, p. 150 | A smooth tame linear family with unique solutions and a jointly continuous tame inverse family has a smooth tame inverse family. |
| II.3.3.1–3.3.4, pp. 155–159 | On compact boundaryless bases, smooth elliptic differential operators invertible on sections have smooth tame parameter-dependent inverses. The finite-dimensional version assumes invertibility after adjoining fixed input constraints and finite-rank output corrections. |
| III.1.1.1 and III.1.1.3, pp. 171–172 | For smooth tame maps on open domains in tame spaces, a jointly smooth tame family of derivative inverses throughout the domain gives smooth tame local inverses. A family of derivative right inverses suffices for local surjectivity and smooth tame local right inverses. |

In II.3.3.1 the real cotangent symbol must be invertible away
from zero. II.3.3.3 uses fixed maps \(j\) from domain sections
into a finite-dimensional space and \(i\) from a finite-dimensional
space into target sections. The domain condition in the proof
uses \(|jh|\lesssim\|h\|_{r-1}\) for an order-\(r\) operator.
The smooth finite-dimensional output satisfies
\(\|ix\|_n\lesssim_n |x|\). Its solution family solves
\((L(c)h+ix,jh)=(k,y)\) for all data on the open set of elliptic
coefficients \(c\) with invertible augmented operator. The
estimate in II.3.3.4 separates the high forcing norm and products
of high coefficient norms with low data norms. [AMS publisher text][ams].

## Mapping the elliptic inverse to E79

Here the reference is the smooth compact closed oriented round
Riemannian \(S^4\), its positive perfect chiral connection \(A_0\),
a fixed native metric, and the positive internal metric from the
negative Killing form. Write \(S_0 u=\iota_uF_0\), use fixed
\(d_0^*\), and let
\(\mathscr X=\ker S_0^*\cap\ker d_0^*\) on smooth one-forms.
E71 gives a bounded projection onto \(\mathscr X\) at every
nonnegative Sobolev order. Thus \(\mathscr X\) is already a tame
complemented section subspace in that grading. The standard
fixed Sobolev-to-sup derivative shifts on this compact base also
give a tame projection in the \(C^n\) grading. The same reference
pairings make \(N=\ker(d_0^*\Pi_0d_0)\) a smooth finite-dimensional
space and its \(L^2\) projection \(P_N\) a tame linear map.
[E71][e71]. [Hamilton II.1.3.3 and II.1.3.9][ams].

For \(B=A_0+b\) in E79's value tube, the scalar operator
\(K_B=d_0^*\Pi_Bd_B\) has invertible second-order symbol by its
positive real part. The candidate augmentation is
\[
 \widehat K_B(h,x)=(K_B h+i x,\;P_N h),
 \qquad i:N\hookrightarrow C^\infty(E).
\]
The inclusion \(i\) has fixed smooth finite-dimensional image,
and \(P_N\) is bounded already on \(L^2\) by the fixed smooth
kernel basis. Under the E79 conclusion, the inverse is seen
algebraically for smooth data \((k,y)\) with \(y\in N\). Take
\(x=P_N k\), \(h=y+h_\perp\), and solve
\[
 K_B h_\perp=(I-P_N)k-K_B y,\qquad h_\perp\perp N .
\]
The right side annihilates \(N\) because the range of \(K_B\)
does. This also proves uniqueness by the restricted inverse.
The specific forcing \(k=d_0^*\Pi_B r,\ y=0\) has \(x=0\).
Thus the fixed block restrictions fit the finite-dimensional
format, conditional on E79's invertibility and smooth output
claims. This identifies an ingredient of a possible tame
family. [E79 (3)–(7), (11)–(13)][e79]. [Hamilton II.3.3.3][ams].

The principal coefficient depends on \(F_B\). In strong form
\(d_0^*\) also differentiates \(\Pi_B\), so lower coefficients
can contain \(D_0F_B\) and therefore second derivatives of \(b\).
The finite-jet coefficient map has a regularity shift. To use
the elliptic theorem, identify these coefficients as smooth
sections of the operator bundle and verify their joint tame
dependence, keeping the reference finite-rank maps fixed.
The pointwise coefficient inverses \(C_B^{-1}\) must stay on
the same open invertible locus. E79's value-only weak bound
and separate \(H^m\) estimates allow arbitrary high coefficient
norms with constants depending on them. Those estimates as
stated do not give a joint tame estimate or smooth dependence
of the full derivative inverse in nonlinear chart variables.
The scalar augmentation above does not by itself verify that
larger family. [E79][e79]. [Hamilton II.2.2.6–2.2.7 and II.3.3][ams].

## Two-sided chart and full-action right inverse

For comparison let a candidate full smooth chart map use the
active convention
\[
 \mathcal F(g,b)=g^*(A_0+b),\qquad b\in\mathscr X,\quad B=A_0+b ,
\]
where \(g\) is an equivariant automorphism of the oriented
principal frame bundle \(P\). At \((g,b)\) write a group
tangent as \(Y\circ g\) for an invariant vector field \(Y\)
on \(P\). Differentiating \(g_t=h_t\circ g\) with
\(h_0=\operatorname{id}\), and then undoing the fixed
pullback \(g^*\), gives
\[
 (g^{-1})^* D\mathcal F(g,b)(Y\circ g,s)
     =s+\mathcal L_Y B
     =s+d_B\phi+S_Bu,\qquad
 \phi=B(Y),\quad u=\pi_*Y .
\]
An inverse-pullback left-action chart changes the sign of
the corresponding group tangent. For the active expression,
given target tangent \(r\), apply E79 to \((g^{-1})^*r\).
It yields \(\phi\perp N\), \(u\) and \(s\in\mathscr X\).
Lift these to \(Y\) using the actual \(B\)-horizontal
lift and the equivariant vertical field of \(\phi\).
This gives an algebraic differential right inverse on smooth
sections, conditional on E79. [E79 (6)–(9), actual lift][e79].
[Fine Lemma 3.2 and (3.4)][fine].

A two-sided inverse with restricted parameters requires a
genuine local manifold of finite automorphisms and an
invertible derivative on an open neighborhood in its
coordinates. A linear complement at the round point
specifies the basepoint tangent. Nearby chart tangents
must be identified after translation and \(B\)-horizontal
splitting. In particular, the fixed
\(A_0\)-horizontal lift of a base vector \(u\) has vertical
component \(b(u)\) at \(B\). The E71 transport formula
contains \(u^j(D_0)_j b_i+b_j\nabla_i u^j\).
Thus the moving condition \(\phi\perp N\) cannot be assigned
to the tangent of a proposed restricted chart without
checking its derivative. The exact reference stabilizer
pairs are \((\psi,-H_0d_0\psi)\), with \(\psi\in N\).
E79 reports that after moving the connection the excluded
parameters may contribute a finite-dimensional slice
residual \(z_B(N)\), so stabilizer directions and the
projection kernel have to be identified in the chosen
parameterization. [E71 (8)–(14)][e71]. [E79 (8)–(10)][e79].
[Hamilton III.1.1.1][ams].

The full action map gives a different use of the source.
III.1.1.3 would require a jointly smooth tame **right**
inverse of its differential in compatible open charts.
It permits use of the full group parameter and a linear
complement only inside the differential solver. In that
setting there is no need to integrate that complement to
a restricted parameter manifold or prove injectivity.
The required conclusion would be a local section of
\(\mathcal F\), meaning a choice of an automorphism and a
representative \(A_0+b\) for each nearby connection.
Uniqueness modulo the stabilizer and an invariant
orbit-slice theorem are separate assertions.
[Hamilton III.1.1.3][ams].

The remaining checks for that right-inverse use include
the smooth tame local charts on the equivariant
automorphism group and the chart formulas for pullback,
inverse pullback, tangent translation and the actual
horizontal lift. Hamilton's smooth-map composition and
diffeomorphism results apply on compact finite-dimensional
manifolds. For this action one must also verify equivariance
and the bundle constraints in the proposed charts. Locally
the connection pullback uses composition with the base
map, its first spatial derivative, and the first derivative
of the local rotation. A derivative of the pullback can
differentiate the moved tensor. Those losses must enter a
fixed tame grading and a joint family estimate for the
composed right inverse. The lifted parameters and the
\(N^\perp\) selection from E79 must be tracked in this
family on an open smooth neighborhood. None of these
claims follows from boundedness of the right inverse for
each fixed smooth \(B\). [Hamilton II.2.3, II.3.1 and
III.1.1.3][ams]. [E71][e71]. [E79][e79].

Even a successful application would give a local result
in the specified smooth tame topology. A neighborhood
may require smallness in a higher norm and allow constants
depending on more than connection and curvature values.
Inclusion of the full value tube, quantitative control of
the automorphism, and placement of continuous or
critical-regularity data in the fixed slice are separate
assertions requiring estimates in those norms.

## Fine, checked passages in arXiv v2

Joel Fine, *A gauge theoretic approach to the anti-self-dual
Einstein equations*, arXiv:1111.5005v2, 29 November 2011
(11:54:34 UTC on the primary version record). I identified
and read selected passages in the existing Git-ignored
`references/1111.5005v2.pdf`, 447930 bytes, SHA-256
`d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8`.
The primary v2 PDF URL identifies the version, and the
original retrieval date and transfer URL of the local
bytes remain unknown. No new Fine copy was retrieved.
I checked the text from this PDF and visually verified
printed pp. 19, 22, 31–32 and 37–38. These are fresh
E81 checks distinct from the inherited E48 source reading.
[Version record][fineabs]. [Primary PDF][fine].
[Existing provenance][provenance].

- Section 3, printed pp. 16–17, uses bundle isometries
  allowed to cover base diffeomorphisms. It introduces the
  linearized ellipticity problem for \(Q\) modulo the
  infinitesimal action.
- Section 3.2, pp. 18–19, first identifies the subgroup over
  the identity, then splits its Lie algebra complement
  by the actual connection's horizontal lift. The author
  calls it a vector-space complement and observes that
  curvature prevents it from being a Lie subalgebra.
  Lemma 3.2 and (3.4) give
  \(R_A(\xi,u)=-d_A\xi-\iota_uF_A\) for smooth \(\xi,u\).
  The proof writes the action as a negative Lie derivative,
  consistent with the inverse-pullback convention.
- Section 3.3, pp. 20–21, especially Lemma 3.5, (3.7)
  and Proposition 3.6, uses a definite \(A\). The symbol
  sequence is exact at each nonzero covector, and
  \(D_A=\delta_AQ\oplus d_A^*\) is elliptic on the
  bundle orthogonal to \(\operatorname{im}S_A\).
  The adjoint here uses \(g_A\). This is an operator on
  the linearized problem; E71 and E79 use the fixed
  reference pairing to define their target slice.
  Section 3.4, p. 22, then specializes to perfect
  \(A\) and the self-dual isometry.
- Section 4.2, printed pp. 30–32 and 36–37, Theorem 4.3,
  Lemma 4.4, (4.2)–(4.4) and (4.8), concerns a smooth
  time-dependent gauge correspondence. The equation
  transporting a solution of the adjusted flow back to
  the original flow is an automorphism ODE with a given
  time-dependent generator. The opposite direction
  has the unknown automorphism on the right and is
  analyzed there as a separate PDE. Section 4.3,
  pp. 37–40, Theorems 4.11 and 4.13 and (4.9), presents
  stability near a given perfect connection on a compact
  four-manifold under fixed-background \(L^2_k\) smallness
  with integer \(k\ge3\). The implicit-function argument
  in Theorem 4.13 concerns a weighted parabolic evolution
  space and its initial trace. The printed use of
  the word “slice” on p. 40 refers to \(X\times\{t\}\).
- Section 6.2, pp. 45–46, treats the action on the associated
  sphere bundle and its vertical tangent bundle. Section 6.3,
  pp. 48–49, Lemma 6.10 and Theorem 6.11, uses a separate
  unitary line-bundle stabilizer lift and a moment-map
  zero condition. Its discussion distinguishes the
  infinitesimal lift from a group homomorphism. It does
  not supply the chiral orbit slice.

No static finite slice theorem for the fixed two equations
of E71/E79 was found in these passages or in a text search
of v2 for slice and nearby automorphism terminology. This
is a focused source check. It does not assess all the
proofs of Fine's flow results.

[req]: ../research-progress/handoffs/SP4-CME-E81_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E81_RETURN_v1.md
[b48]: ../brainstorm/notes/B48_NONLINEAR_SLICE_SOURCE_AUDIT_20261122.md
[e71]: ../notes/71_LINEAR_ROUND_SLICE_20261122.md
[e79]: ../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[ams]: https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf
[amsbib]: https://www.ams.org/journals/bull/2023-60-02/S0273-0979-2023-01794-1/S0273-0979-2023-01794-1.pdf
[fineabs]: https://arxiv.org/abs/1111.5005v2
[fine]: https://arxiv.org/pdf/1111.5005v2
[provenance]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#endpoint-heat-source-and-fine-version-check--broad-run-follow-up
