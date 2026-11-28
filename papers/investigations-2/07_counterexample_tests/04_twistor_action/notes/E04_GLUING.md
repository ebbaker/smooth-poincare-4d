# Two-cylinder composition and seam regularity · SP4-TWA-E04

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request v1](../research-progress/handoffs/E04_REQUEST_v1.md)
records the author-selected GPT-6.2 Astra/ultra lead and individually configured
GPT-6.2 Sol/ultra helper. Actual backend serving variant and reasoning effort
were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and
all ten frozen input SHA-256 digests matched at inspection.

Use the fixed oriented Riemannian spin background, periodic spin lift and
positive half-spin bundle of the [overview](../research-overview/OVERVIEW.md).
Clifford multiplication satisfies \(X\cdot X=-|X|^2\), and \(P=\Pi\nabla\)
where \(\Pi=I-\tfrac14c^*c\) projects orthogonally onto the kernel of the
Clifford trace \(c\). Here \(c^*\) is the adjoint in the real pairing
\((\, ,\, )=\operatorname{Re}\langle\, ,\, \rangle\), and \(cc^*=4I\).
The action normalization is \(S=J_g^4\). [Projection and variation](E01_VARIATION.md)

## Radial composition

Take adjacent cylinders of lengths \(L_1,L_2>0\) with the same periodic
flat \(T^3\) of volume \(V>0\). Use the same unit parallel spinor \(\psi_0\)
and increasing longitudinal coordinate on both pieces. The radial endpoint
spinors are \(e^a\psi_0,e^b\psi_0,e^d\psi_0\), with seam logarithm \(b\).
Write \(L=L_1+L_2\), \(K=9V/16\), and \(\kappa=4K\).
E02 gives the on-shell action \(K(y-x)^4/\ell^3\) and the outward
logarithmic covectors \((-p,p)\), where \(p=\kappa((y-x)/\ell)^3\).
The affine logarithm on each cylinder is stationary under arbitrary
smooth fixed-end spinor variations. [Flat-torus control](E02_FLAT_TORUS.md)

The broken on-shell action and its derivative in \(b\) are

\[
\begin{aligned}
G(a,b,d)&=K\left(\frac{(b-a)^4}{L_1^3}
                    +\frac{(d-b)^4}{L_2^3}\right),\\
\partial_bG&=\kappa(v_1^3-v_2^3),\qquad
v_1=(b-a)/L_1,\quad v_2=(d-b)/L_2 .
\end{aligned}
\]

The real cube is injective, so there is one critical seam value. The
two fields are restrictions of the same affine-logarithm field with
the following common slope and seam value.

\[
v_1=v_2=v=(d-a)/L,\qquad b_*=(L_2a+L_1d)/L .
\]

Substitution gives

\[
G(a,b_*,d)=K(L_1+L_2)v^4=K(d-a)^4/L^3,\qquad
d\big(G(a,b_*,d)\big)=-\kappa v^3\,da+\kappa v^3\,dd.
\]

Thus the outward covectors on the seam are \((\kappa v^3,-\kappa v^3)\).
The outer covectors equal those of the length-\(L\) cylinder. In the
ambient spinor dual the radial covector at an endpoint with logarithm
\(u\) has density \(\pm(9/4)e^{-u}v^3\psi_0\,dA\), with the sign of the
outward longitudinal normal. The shared logarithm gives cancellation
of these densities on the seam as well. When \(a\ne d\), the common
slope is nonzero and \(\partial_b^2G(a,b_*,d)=3\kappa v^2(L_1^{-1}+L_2^{-1})>0\).
When \(a=d\), the only stationary match is the constant spinor,
with zero action, zero momenta and zero \(\partial_b^2G\).

### Radial tangent dimensions

Let \(Q=T^*\mathbb R\), and use the incoming momentum with its sign
reversed from the outward covector. In \(Q^-\times Q\) the radial relation
is \(\Lambda_\ell=\{(x,\kappa s^3;x+\ell s,\kappa s^3)\}\), with
\((x,s)\in\mathbb R^2\) smooth global coordinates. Intersect
\(\Lambda_{L_1}\times\Lambda_{L_2}\) with \(Q\times\Delta_Q\times Q\)
in the four-factor phase space, where \(\Delta_Q\) is the diagonal
of the two middle phase spaces. The ambient, product-relation and
seam-constraint dimensions are \(8,4,6\), respectively. Use
\((a,v_1,b,v_2)\) as smooth coordinates on the product relation.
The middle phase equality is the zero set of

\[
R(a,v_1,b,v_2)=(a+L_1v_1-b,\ \kappa(v_1^3-v_2^3)).
\]

On this zero set \(v_1=v_2=v\) and \(b=a+L_1v\), so the actual
intersection is a smooth embedded two-dimensional submanifold at
every match. Its tangent obeys
\(\delta v_1=\delta v_2\) and
\(\delta b=\delta a+L_1\delta v_1\). The intersection of the two
ambient tangent spaces is the kernel of

\[
dR=(\delta a+L_1\delta v_1-\delta b,\
                  3\kappa v^2(\delta v_1-\delta v_2)).
\]

| Outer ends | \(\operatorname{rank}dR\) | Tangent to actual intersection | Intersection of ambient tangents | Sum of ambient tangents |
| --- | --- | --- | --- | --- |
| \(a\ne d\) | 2 | 2 | 2 | 8 |
| \(a=d\) | 1 | 2 | 3 | 7 |

The off-diagonal intersection is transverse and hence clean. On the
diagonal, allowing an independent first-order velocity difference
enlarges the kernel of \(dR\) beyond the actual tangent, so the
intersection there fails both transversality and cleanliness. The
projection of the actual intersection to the outer phase spaces is a
diffeomorphism onto \(\Lambda_L\). In the coordinates \((a,v)\) it is
\((a,\kappa v^3;a+Lv,\kappa v^3)\), whose inverse recovers \(a\) and
\(v=(d-a)/L\) from the positions. The radial composed relation is
therefore an embedded exact Lagrangian graph of the signed differential
of the longer-cylinder action, including on the diagonal.

## Weak transmission for the supplied B01 pieces

Fix precisely the unit flat product \(M=[-1,1]\times Y\),
\(Y=\mathbb R^3/\mathbb Z^3\), cut at \(t=0\), with the common parallel
spin identification of [B01](../brainstorm/notes/B01_BOUNDARY_PROBLEM.md).
Write \(M_-\) and \(M_+\) for the two closed halves. The common unit
normal is \(n=\partial_t\), with outward normals \(\nu_-=n\) and
\(\nu_+=-n\) at the seam and the same positive measure \(dA\).
Let \(\psi_\pm\) be supplied smooth sections up to the boundary on
their pieces, with fixed outer traces, the same nowhere-zero smooth
seam trace \(s\), and at most finitely many of the prescribed
transverse Clifford-compatible zeros in the piece interiors away
from the seam. Both pieces are assumed nonzero away from these
zeros. Consider variations with zero outer trace, common seam trace,
and fixed zero and first jet at the prescribed points.

Set \(q_\pm=P\psi_\pm\) and
\(W_\pm=|\psi_\pm|^{-4}|q_\pm|^2q_\pm\) off the prescribed zeros.
At the seam the momentum functionals in
\(X^*=H^{-9/2}(Y;S^+_{\mathbb R})\), paired with
\(X=H^{9/2}(Y;S^+_{\mathbb R})\), are

\[
\langle\mathcal P_\pm,\xi\rangle
 =4\int_Y (W_\pm(\nu_\pm),\xi)\,dA .
\]

The trace and one-sided flux densities are smooth, and the displayed
pairing extends continuously from smooth tests to \(X\). The
piecewise field is continuous across \(Y\), so its weak first derivative
equals the classical derivative on each piece almost everywhere.
This follows by integrating first derivatives separately and
cancelling the boundary terms using the common trace. Its action
therefore splits into the two integrals. For smooth global variations
\(\eta\) in the stated fixed-zero, fixed-jet class, weak stationarity
means vanishing of the first variation of this integral. The formula
also applies to piecewise smooth variations with a matching seam trace.
Small affine variations preserve the admitted zeros because near each
zero the compatible linear part is unchanged and the variation is
quadratic in distance, while the field norm is bounded below on
the compact complement of small balls. The [E03 excision estimates](E03_FIXED_JETS.md)
justify differentiation at each prescribed zero and give shrinking-sphere
boundary terms of order \(O(r^4)\). There are no zero-related boundary
terms in the limit.

With \(\xi=\eta|_Y\), the joined first variation is

\[
DS(\psi)[\eta]=4\sum_{\alpha\in\{-,+\}}
\int_{M_\alpha\setminus Z(\psi_\alpha)}
 \big(P^*W_\alpha-|\psi_\alpha|^{-6}|q_\alpha|^4\psi_\alpha,\eta\big)\,dV
+\langle\mathcal P_-+\mathcal P_+,\xi\rangle .
\]

The two volume coefficients vanish for supplied piecewise stationary
fields, since compactly supported tests away from the prescribed zeros
give the classical equation. Conversely, these equations imply the
volume terms vanish in the fixed-zero, fixed-jet class. Any smooth
seam test \(\xi\) has a smooth global extension given by a cutoff
in \(t\) that is one near \(0\), vanishes before the outer boundaries
and has support disjoint from the prescribed zeros. Hence for stationary
pieces the joined field is weakly stationary exactly when
\(\mathcal P_-+\mathcal P_+=0\) in \(X^*\). Smooth traces are dense in
\(X\), and the smoothness of the flux densities makes this equivalent
to their pointwise cancellation. More generally, if initially only
matching of the supplied smooth fields is assumed, the joined weak
equation implies the two piecewise bulk equations by interior testing,
and then implies this covector equality.

## First jets and regularity across the seam

Fix a seam point. The common trace and the common connection identify
all tangential first derivatives. Write

\[
A z=\Pi(dt\otimes z),\qquad
z_\pm=\nabla_n\psi_\pm,\qquad q_\pm=Az_\pm+C,
\]

where \(C\) is the shared contribution from the tangential derivatives
of \(s\). Since \(c(dt\otimes z)=n\cdot z\) and \(|n\cdot z|=|z|\),

\[
|Az|^2=|z|^2-\tfrac14|c(dt\otimes z)|^2=\tfrac34|z|^2.
\]

Thus \(A^*A=\tfrac34 I\). For \(T\in\ker c\), orthogonality of \(\Pi\)
gives \(A^*T=T(n)\). The signed momentum in the common \(n\)-direction
is therefore

\[
\mathcal M(z)=4|s|^{-4}A^*(|Az+C|^2(Az+C)),
\]

the real \(z\)-gradient of \(|s|^{-4}|Az+C|^4\). If \(q_i=Az_i+C\),
then

\[
\begin{aligned}
(\mathcal M(z_1)-\mathcal M(z_2),z_1-z_2)
 &=4|s|^{-4}(|q_1|^2q_1-|q_2|^2q_2,q_1-q_2),\\
(|q_1|^2q_1-|q_2|^2q_2,q_1-q_2)
 &=\tfrac12(|q_1|^2+|q_2|^2)|q_1-q_2|^2
   +\tfrac12(|q_1|^2-|q_2|^2)^2 .
\end{aligned}
\]

For \(z_1\ne z_2\), injectivity of \(A\) gives \(q_1\ne q_2\), so
the last expression is positive. The opposite outward flux condition
is \(\mathcal M(z_-)=\mathcal M(z_+)\), which forces equality of the
normal derivatives. This includes \(q_-=0\) or \(q_+=0\), in which
case their common value is zero. Conversely, equality of the normal
derivatives at common trace gives equality of the signed momenta.

The two pieces have identical full first jets on the seam, so their
union is \(C^1\). If their second derivatives are bounded on each side,
the joined first derivative is locally Lipschitz. In a product chart,
split a straight segment at its intersection with \(t=0\), bound
the difference in first derivatives on each segment by its length
times the one-sided Hessian bound, and use continuity to add the
estimates. Segments in the seam obey the same bound by a one-sided
limit. Thus the joined field is \(C^{1,1}\) across the seam. The Hessian
bound holds on the stipulated smooth compact pieces.

### Smoothness at nonzero defect

Use flat coordinates in the parallel frame, \(x^0=t\), \(w_i=\partial_i\psi\),
and \(A_i z=\Pi(dx^i\otimes z)\), so \(q=\sum_i A_iw_i\) and \(A_0=A\).
On the nonzero-spinor locus put \(\mathscr L(\psi,w)=|\psi|^{-4}|q|^4\).
Its derivative Hessian blocks in the real pairing are

\[
B_{ij}=\mathscr L_{w_i w_j}
 =4|\psi|^{-4}A_i^*(|q|^2I+2q\otimes q)A_j,
\qquad (q\otimes q)T=(q,T)q.
\]

In particular
\((z,B_{00}z)\ge 3|\psi|^{-4}|q|^2|z|^2\).
Let \(U\subset Y\) be the open patch where the common seam value of
\(q\) is nonzero. Near each point of \(U\), \(\psi\) and \(q\) are nonzero
on each side by continuity. The classical Euler–Lagrange equation
\(\sum_i\partial_i\mathscr L_{w_i}=\mathscr L_\psi\) gives the double
normal derivative on each side.

\[
\partial_t^2\psi
= B_{00}^{-1}
  \left(\mathscr L_\psi-\sum_i(D_\psi\mathscr L_{w_i})w_i
            -\sum_{(i,j)\ne(0,0)}B_{ij}\partial_i\partial_j\psi\right).
\]

The right side is smooth in its arguments and uses only derivatives
with at most one normal differentiation. Equality of the trace and
normal derivative as smooth functions on \(U\) gives equality of all
their tangential derivatives. The solved equation on the two pieces
therefore gives equality of the second normal derivatives on \(U\).
If normal derivatives through order \(k+1\) match as functions on \(U\),
differentiate the solved equation \(k\) times in \(t\) separately on
each side. Each resulting term uses only derivatives with at most
\(k+1\) normal differentiations and their tangential derivatives.
The matching therefore extends to order \(k+2\). All one-sided jets
match on \(U\), which gives a smooth joined field in a neighborhood
of each seam point in \(U\). The classical equation holds there
by continuity.

At \(q=0\) the block \(B_{00}\) vanishes, so the solved-equation
induction cannot be started there. Continuity gives equality of the
one-sided jets at seam points in the closure of \(U\). On the interior
of the zero-defect seam set, the argument yields \(C^{1,1}\) and leaves
higher-order matching unresolved. Existence of stationary pieces for
arbitrary prescribed traces and a full Sobolev boundary relation
remain separate analytical questions. The transmission theorem
quantifies over supplied smooth pieces and any of their common
nowhere-zero smooth traces.

## Source inspection and evidence

Rechecked the [canonical action note](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md),
using its factor-four conversion, the relevant parts of DIR-E06,
DIR-E07 and DIR-E10 identified in the request, and B01 and E01–E03.
On 28 November 2026, checked Friedrich's published §1, p. 59,
equation (1.1) and the preceding projection. Also checked Vankerschaver,
Liao and Leok, arXiv:1111.0280v2, §4, Theorems 4.1–4.2, which assume
manifold structures for their boundary spaces, and Biran and Cornea,
journal Definition 2.1.1 and §4.1, for the product embedding and
cylindrical end conditions. The radial intersection and transmission
statements above follow by direct derivation and use no external
solvability, regularity or cobordism theorem.
[Friedrich](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2) ·
[Vankerschaver–Liao–Leok](https://arxiv.org/pdf/1111.0280v2) ·
[Biran–Cornea](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf)
