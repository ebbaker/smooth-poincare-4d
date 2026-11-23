# SP4-CME-E82 — The smooth tame family for the augmented orbit solver

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E71 and E80 and
did not author E79 or E81. All four frozen digests matched the
[request][req] before use. This derivation uses the assessed weak
inverse of E79, with a fresh check of the primary tame theorem
recorded below. See [B49][b49] and the [return][ret].

## Setting and statement

Let \(M\) be the fixed compact, closed, oriented round Riemannian
\(S^4\), \(\mathcal P\) its chiral principal \(SO(3)\) bundle,
\(E\) the adjoint bundle, and \(A_0\) the positive perfect chiral
reference. Use the native fixed \(g_0\), the negative Killing internal
pairing, and their fixed covariant derivative \(D_0\). Write
\(E_1=T^*M\otimes E\) and \(d_0=d_{A_0}\).
Let \(\Gamma^\infty\) denote smooth sections.
For \(B=A_0+b\), \(\beta(b)=F_B-F_0=d_0b+\tfrac12[b\wedge b]\).
Use the open smooth value tube in the affine chart \(b\)
\[
 \mathscr U=\{b\in\Gamma^\infty E_1:
             \|b\|_{C^0}+\|\beta(b)\|_{C^0}<\epsilon_*\},            \tag{1}
\]
with \(\epsilon_*\) satisfying E79 (2), (5), (11). This is open
already under the \(C^1\) seminorm topology, since the curvature
difference is a smooth first-jet operator. All norms and adjoints
in the inverse use the reference metrics.
[E79, reference data and weak inverse][e79] · [E80, audit][e80].

Put \(\mathscr X=\{s\in\Gamma^\infty E_1:S_0^*s=d_0^*s=0\}\)
and let \(\mathfrak X(\mathcal P)^{SO(3)}\) be the invariant
smooth vector fields on \(\mathcal P\). E79's restricted
decomposition on this tube gives, for each \(r\in\Gamma^\infty E_1\),
\[
 r=d_B\phi+S_Bu+s,\qquad
 \phi\perp_{L^2}N,\quad s\in\mathscr X,\quad S_Bu=\iota_uF_B,
 \qquad N=\ker(d_0^*\Pi_0d_0).
\]
Define \(Y=\chi_B(u)+\operatorname{vert}(\phi)\), with the actual
\(B\)-horizontal lift. We prove the map
\[
 (b,r)\longmapsto(\phi,u,s,Y)
\]
is jointly smooth tame into
\(\Gamma^\infty E\times\Gamma^\infty TM\times\mathscr X
 \times\mathfrak X(\mathcal P)^{SO(3)}\) in fixed gradings, and
linear in \(r\) for each \(b\).

## Primary theorem and fixed gradings

Richard S. Hamilton, *The inverse function theorem of Nash and Moser*,
Bulletin (New Series) of the American Mathematical Society 7(1),
July 1982, pp. 65–222, DOI `10.1090/S0273-0979-1982-15004-2`.
On 22 November 2026 (America/New_York) I reread the selected
passages in the indexed text of the original AMS publisher PDF.
A direct URL fetch returned HTTP 403. The article was read through
that index, with no retained PDF, page-image verification, local
file size or digest in this packet. This is the version already
cataloged as R24. [AMS original publisher text][ams] ·
[Canonical reference record][canonical] · [E81 source audit][e81].

Hamilton II.3.3 sets up linear differential operators of order \(r\)
between smooth vector bundles over a compact boundaryless base;
the coefficients are sections of the bundle
\(\mathcal D^r(V,W)\simeq\operatorname{Hom}(J^rV,W)\).
Ellipticity means invertibility of the principal symbol at every
nonzero real covector. For the augmented theorem, the two vector
spaces \(M_f,N_f\) of extra variables and constraints are finite
dimensional and the linear maps \(i:M_f\to\Gamma^\infty W\),
\(j:\Gamma^\infty V\to N_f\) are fixed. The required bounds, as
used in the proof, are
\(\|ix\|_n\le C_n|x|\) and \(|jh|\le C\|h\|_{r-1}\).
On the open coefficient set where the differential operator
is elliptic and the augmented map
\((h,x)\mapsto(L(c)h+ix,jh)\) is an isomorphism on smooth
sections with the finite factors, II.3.3.3 gives the joint
smooth tame solution \((c,k,y)\mapsto(h,x)\).
The needed isomorphism is that of the block with \(i,j\).
[Hamilton II.3.3 setup, pp. 155–156, and II.3.3.3,
pp. 157–158][ams].

Use Hamilton's allowed mixed grading, with \(C^n\) for
coefficient sections and \(H^n=W^{n,2}\) for \(h,k\).
Here \(r=2\). This supplies the multiplicative coefficient
bound and the elliptic Sobolev estimate in the proof, without
using a bare \(C^n\) elliptic estimate. In these gradings,
II.3.3.4 bounds
\[
 \|h\|_{H^{n+2}}+|x|
 \le C_n\big(\|k\|_{H^n}+\|c\|_{C^n}\|k\|_{L^2}
                         +(1+\|c\|_{C^n})|y|\big)                 \tag{2}
\]
locally for coefficients \(C^0\)-close to an admissible
\(c_*\). It keeps the high coefficient norm paired with
low data. We apply the smooth tame theorem II.3.3.3,
whose proof uses this estimate. Hamilton II.3.1.1 is the
general upgrade for a smooth tame family of linear maps
from a jointly continuous tame inverse to a smooth tame
inverse. There is no separate nonlinear inverse theorem
application here. [Hamilton II.3.3 gradings, p. 156,
II.3.3.4, pp. 158–159, and II.3.1.1, p. 150][ams].

For \(\Gamma^\infty\) on \(M\) use the fixed \(C^n\) grading
when composing the maps below. It is tamely equivalent to
the fixed \(H^n\) grading since
\(\|w\|_{H^n}\le C_n\|w\|_{C^n}\) by compactness and
\(\|w\|_{C^n}\le C_n\|w\|_{H^{n+3}}\) by the fixed
four-dimensional Sobolev embedding. The latter follows
chartwise by Fourier Cauchy–Schwarz with the integrable
weight \((1+|\xi|^2)^{-3}\). We use smooth tameness
in Hamilton's local sense: above a base grade there is
a fixed grade shift in a neighborhood of each point for
each of the derivatives of the map. Smooth section spaces,
finite products and tame direct summands have the tame
Fréchet structures of II.1.3. The smooth finite-jet and
composition rules used below are II.2.2.6–2.2.7 and the
smooth tame composition rule from II.2.1. No claim of
uniform tame constants on the full value tube is used.
[Hamilton II.1.3.1–1.3.4, p. 136, II.1.3.9, p. 139,
II.2.1.1, 2.1.6 and the end of 2.1, pp. 140–143,
and II.2.2.6–2.2.7, pp. 145–146][ams].

## Finite-jet coefficients and the augmented block

Let \(S_Bu=\iota_uF_B\), \(C_B=S_0^*S_B\),
\(H_B=C_B^{-1}S_0^*\), and \(\Pi_B=I-S_BH_B\).
On \(\mathscr U\), \(C_B\) is invertible as a smooth bundle
endomorphism. The maps \(S_B,C_B,H_B,\Pi_B\) are induced
by smooth functions of \(J^1b\) over the pointwise open
invertibility locus, because \(\beta(b)\) is first-jet
and matrix inversion there is smooth. The global norm tube
ensures every point lies in this locus. The unaugmented
operator on adjoint sections is
\[
 K_B h=d_0^*\Pi_Bd_Bh
       =d_0^*\big(\Pi_B(D_0h+[b,h])\big).
\]
The principal symbol, with derivative convention \(i\xi\),
is \(w_\xi^*\Pi_Bw_\xi\) for \(w_\xi e=\xi\otimes e\).
Its real part is at least \(\tfrac13|\xi|_{g_0}^2 I\) by
E79 (11). This gives Hamilton's invertible real-covector
symbol. Using \(\partial\mapsto\xi\) instead changes the
overall sign for order two and preserves invertibility.
[E79 (1)–(4), (11)][e79] · [E80, local regularity][e80].

In the ordered reference derivative convention the strong
form, with \((\Pi_B w)_i=(\Pi_B)_i{}^j w_j\), is
\[
 \begin{split}
 K_Bh={}&-(\Pi_B)_i{}^j D_0^iD_{0,j}h
         -(D_0^i\Pi_{B i}{}^j)D_{0,j}h
         -(\Pi_B)_i{}^j[b_j,D_0^i h]\\
        &-(D_0^i\Pi_{B i}{}^j)[b_j,h]
         -(\Pi_B)_i{}^j[D_0^i b_j,h].
 \end{split}                                                       \tag{3}
\]
Here \(D_0^iD_{0,j}h\) includes the fixed derivative on the
new covector slot. Fixed frame, metric and connection
terms are included in these expressions and in the conversion
to coordinate derivatives. Thus in Hamilton's bundle
\(\mathcal D^2(E,E)\) the coefficient section \(c_B\) of
\(K_B\) is a smooth fiber map of \(J^2b\).
In particular \(D_0\Pi_B\) can contain \(D_0\beta\) and hence
a second derivative of \(b\). The leading coefficient uses
only \(J^1b\), and the lower coefficients in (3) use no jet
above order two. This defines the map intrinsically because
\(K_B h(x)\) depends linearly on \(J^2_xh\). The linear
jet section map shifts the \(C^n\) grading by two, and
the following fiber map has degree zero locally. In particular
\[
       \|c_B\|_{C^n}\le C_n(1+\|b\|_{C^{n+2}})
                                                                         \tag{4}
\]
on a neighborhood of any given \(b\) in \(\mathscr U\).
Each parameter derivative is a pointwise multilinear map
of the same jets of the parameter directions. Applying
the smooth finite-jet rule gives the two-grade shift for
the coefficient map and its derivative maps on their product
domains. [Hamilton II.2.2.6–2.2.7 and II.3.3 setup][ams] ·
[E80, raw form blocks and strong coefficients][e80].

The finite-dimensional smooth space \(N\) is fixed by
E71. Let \(P_N\) denote \(L^2\) projection with codomain
\(N\), \(i:N\hookrightarrow\Gamma^\infty E\) its inclusion,
and \(\mathbf P_N=iP_N\) the corresponding endomorphism.
With the \(L^2\) norm on \(N\),
\(|P_Nh|\le\|h\|_{L^2}\le\|h\|_{H^1}\).
For every \(n\) and \(x\in N\) one has
\(\|ix\|_{H^n}+\|ix\|_{C^n}\le C_n|x|\) by a fixed smooth
basis. Thus Hamilton's \(j=P_N\) and \(i\), with
\(M_f=N_f=N\), satisfy exactly the fixed finite-dimensional
bounds for order two. [E71, weak inverse and smooth kernel][e71] ·
[Hamilton II.3.3.3–3.3.4][ams].

For smooth \(k\) and \(y\in N\), the block is
\[
 \widehat K_B(h,x)=(K_Bh+i x,P_Nh)=(k,y).                           \tag{5}
\]
The weak annihilator of E79 gives \(P_NK_Bh=0\) for smooth
\(h\). Therefore \(x=P_N k\). Write \(h=iy+h_\perp\) with
\(P_Nh_\perp=0\). Then
\[
 f=(I-\mathbf P_N)k-K_B(iy)
\]
annihilates \(N\) in the \(H^{-1},H^1\) duality and is smooth.
Let \(B_B\) be E79's restricted inverse on the annihilator
with range \(H^1(E)\cap N^\perp\). The unique solution is
\[
       x=P_Nk,\qquad h=iy+B_B f .                                 \tag{6}
\]
The second term is smooth by E79 (12). This proves
surjectivity, and applying the same calculation to zero
data gives injectivity. It also verifies the transversality
used in the source proof: \(\operatorname{im}K_B=\ker P_N\)
on smooth sections, so \(iN\) complements the image, and
\(P_N\) is injective on \(\ker K_B\) by the weak restricted
inverse. Formula (6) also defines a bounded inverse
\(L^2(E)\times N\to H^2(E)\times N\), by E79's weak and
\(H^2\) estimates for \(B_B\). In particular at each \(c_B\)
the strong block isomorphism required in the proof is
available.

Hamilton's coefficient set is open. At \(c_B\) the
openness can also be checked in these gradings: perturbing
a coefficient section by a small \(C^0\) amount perturbs
the block as \(H^2\times N\to L^2\times N\) by a small
operator norm, with \(i,P_N\) fixed. The bounded inverse
and a Neumann series preserve invertibility locally there.
Ellipticity persists by uniform positivity in the fixed
unit covector and fiber spheres. For smooth nearby
coefficients and data, the weak local \(H^2\) and higher
elliptic regularity argument applies by writing the
perturbed differential operator in divergence form with
smooth lower blocks. Thus its isomorphism acts on smooth
sections as well. This openness is local at each \(c_B\);
the full preimage (1) lies in the augmented-invertible
set by (6). Hamilton II.3.3.3 now gives a jointly smooth
tame family
\[
       (b,k,y)\longmapsto
          S(c_B)(k,y)=\widehat K_B^{-1}(k,y),
                                                                         \tag{7}
\]
by composition with the finite-jet map (4).
[E79 (3)–(5), (12)][e79] · [E80, \(H^2\) and higher regularity][e80] ·
[Hamilton II.3.3.3–3.3.4][ams].

## Fixed complemented slice and invariant vector fields

Use the fixed smooth projection \(\mathcal P_0\) of E71 onto
\(\mathscr X\). Its boundedness in every integer \(H^m\)
and the fixed comparisons above give
\[
 \|\mathcal P_0 r\|_{C^n}
    \le C_n\|\mathcal P_0r\|_{H^{n+3}}
    \le C'_n\|r\|_{H^{n+3}}
    \le C''_n\|r\|_{C^{n+3}}.                                      \tag{8}
\]
Thus \(\mathscr X\), with the inherited \(C^n\) grading,
is a tame direct summand. It is closed by the two fixed
linear slice equations. The inclusion is tame of degree
zero, and \(\mathcal P_0:\Gamma^\infty E_1\to\mathscr X\)
is a fixed tame linear retraction. A smooth tame
ambient section map with image in \(\mathscr X\) can
be considered as an \(\mathscr X\)-valued map by
composition with this retraction. [E71 (7)–(11)][e71] ·
[Hamilton II.1.3.1–1.3.4, II.1.3.9][ams].

The space of invariant vector fields has a fixed tame
identification
\[
 (u,\zeta)\longmapsto
      \chi_{A_0}(u)+\operatorname{vert}(\zeta),
 \qquad
 \mathfrak X(\mathcal P)^{SO(3)}
    \simeq \Gamma^\infty TM\times\Gamma^\infty E .                \tag{9}
\]
Indeed each invariant field determines \(u=\pi_*Y\) and
the adjoint section \(\zeta=A_0(Y)\), by equivariance.
In a fixed trivialization \(p=\sigma(x)h\), the map
in (9) has coordinates
\((u(x),(\zeta(x)-A_{0i}u^i(x))h)\).
This expression uses only fixed smooth frame coefficients
and group tangent conversions. On the finite compact
subcharts its \(C^n\) norm is bounded by the \(C^n\) norms
of \((u,\zeta)\) with fixed constants. Conversely \(u,\zeta\)
are obtained by restricting to fixed smooth local sections
and applying the fixed \(\pi_*,A_0\) to \(Y\), with the same
order of derivative. Hence the product grading is tamely
equivalent to the fixed total-space smooth field grading.
This is an identification of linear section spaces.

## Joint parameter solver and the actual lift

Given \(r\in\Gamma^\infty E_1\), put \(k_B(r)=d_0^*\Pi_B r\).
The map \((b,r)\mapsto k_B(r)\) is a smooth finite-jet map
using \(J^2b,J^1r\). In particular the differentiated
\(\Pi_B\) costs a second derivative of \(b\), and the
differentiated input costs one derivative of \(r\).
The strong product rule
\(d_0^*\Pi_Br=-(D_0^i\Pi_{B i}{}^j)r_j
               -(\Pi_B)_i{}^jD_0^ir_j\)
shows every coefficient term. Thus the finite-jet rule
applies jointly in \((b,r)\). The weak annihilator gives
\(P_N k_B(r)=0\). Apply (7) with \((k,y)=(k_B(r),0)\)
to obtain \((\phi,0)\), where \(\phi=B_B k_B(r)\) and
\(\phi\perp N\). Consequently \(\phi\) is jointly smooth
tame. [E79 (3), (5)–(6)][e79] ·
[Hamilton II.2.2.6–2.2.7, II.3.3.3][ams].

Now set
\[
     u=H_B(r-d_B\phi),\qquad
     s=\Pi_B(r-d_B\phi).                                          \tag{10}
\]
The adjoint bundle derivative \(d_B\phi=D_0\phi+[b,\phi]\)
costs one derivative of \(\phi\). The coefficients
\(H_B,\Pi_B\) depend smoothly on \(J^1b\); multiplication
and contraction use the finite-jet rule. Therefore (10)
gives joint smooth tame maps by composition with the
map for \(\phi\). The identities \(I=S_BH_B+\Pi_B\)
and \(S_0^*\Pi_B=0\) give the decomposition and first
slice equation. The second is
\[
 d_0^*s=d_0^*\Pi_B r-K_B\phi=0.
\]
Thus \(s\) is \(\mathscr X\)-valued, and composition with
the fixed retraction in (8) gives the asserted tame map
with that target. No moving kernel space is used.
For fixed \(b\), the augmented solution is linear in its
data and (10) is linear in \(r,\phi\), so the three
outputs are linear in \(r\). [E79 (6)–(9)][e79] ·
[E80, exact restricted complement][e80].

For the actual lift, define \(Y\) by (9) with
\(\zeta=\phi-b(u)\):
\[
       Y=\chi_{A_0}(u)+\operatorname{vert}\big(\phi-b(u)\big)
        =\chi_B(u)+\operatorname{vert}(\phi).                     \tag{11}
\]
The equality holds because \(\pi_*Y=u\) and
\(B(Y)=A_0(Y)+b(u)=\phi\). Both projections determining
the lift use the same principal right action. In the
trivialization of (9), (11) has components
\((u,(\phi-B_i u^i)h)\).
Thus the lift uses a smooth pointwise multiplication and
the fixed tame linear identification. This proves its
joint smooth tameness and its linearity in \(r\) for
fixed \(b\). With the active pullback convention it has
\(\mathcal L_Y B=d_B\phi+S_Bu\), since the vertical
contraction is \(B(Y)=\phi\) and the horizontal curvature
contraction is \(S_Bu\). The solver gives
\(s+\mathcal L_YB=r\) on the fixed base and total-space
bundles. [E79, actual horizontal action][e79] ·
[E80, action signs][e80].

The radius (1) ensures pointwise inversion and weak
solvability for every smooth datum there. The high
estimates are the local tame estimates of Hamilton's
smooth category, using neighborhoods of individual
coefficient sections. The coefficient map includes
second jets, so (2) gives no uniform tame constants
from just the connection and curvature values. The
construction supplies the linear parameter and lift
family. A finite automorphism chart and a nonlinear
local section are separate steps.

[req]: ../research-progress/handoffs/SP4-CME-E82_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E82_RETURN_v1.md
[b49]: ../brainstorm/notes/B49_SMOOTH_LOCAL_SLICE_SECTION_20261122.md
[e71]: 71_LINEAR_ROUND_SLICE_20261122.md
[e79]: 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e80]: ../reviews/E80_ORBIT_INVERSE_AUDIT_20261122.md
[e81]: ../reviews/E81_NONLINEAR_SLICE_SOURCE_AUDIT_20261122.md
[canonical]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#nonlinear-slice-primary-hypotheses--e81
[ams]: https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf
