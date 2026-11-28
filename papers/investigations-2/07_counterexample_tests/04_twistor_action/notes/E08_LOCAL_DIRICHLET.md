# SP4-TWA-E08 · Local nonlinear Dirichlet branch for the quartic action

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The author selected GPT-6.2 Astra/ultra for the
lead, and the [frozen request](../research-progress/handoffs/E08_REQUEST_v1.md)
records GPT-6.2 Sol/ultra for the helper. Actual backend model and reasoning
effort were unavailable. HEAD was
**280376dd7a1820fa2878d0ab0ee2e639facb2eeb**. All seven frozen input digests matched.

## Local result

Use the oriented flat Riemannian cylinder
\(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) with periodic spin structure and
parallel unit positive half-spinor \(\sigma\). Positive chirality and the
Clifford convention are those of the
[overview](../research-overview/OVERVIEW.md). Use the real parts of Hermitian
pairings throughout. Let \(b=1/200\), \(\psi_*=e^{bt}\sigma\), and let
\(X=H^{9/2}(\mathbb T^3,S^+)\times H^{9/2}(\mathbb T^3,S^+)\) over the reals,
with the \(-1\) endpoint first. There are neighborhoods of
\(\psi_*\) in \(H^5(M,S^+)\) and of its trace in \(X\) such that every trace
in the latter has a unique critical field in the former for
\(S[\psi]=\int_M |P\psi|^4|\psi|^{-4}\,dV\). The two traces can vary
independently. These fields are zero-free and solve the bulk equation in
\(H^3\). The field map and its action are \(C^\infty\) in these Banach spaces.
Their outward trace and momentum form an exact Lagrangian graph over this
open set of the real Hilbert trace space.

## Conjugation, stationarity and coercivity

Write \(P=\Pi d\) in the parallel frame, with
\(\Pi=I-c^*c/4\) the orthogonal projection to the kernel of Clifford
contraction \(c\). Clifford skew-adjointness gives \(cc^*=4I\), and
\(\lvert c(\xi\otimes z)\rvert=|\xi||z|\). Hence, with
\(A_\xi z=\Pi(\xi\otimes z)\),
\[
A_\xi^*A_\xi=\tfrac34|\xi|^2 I,\qquad
A=A_{dt},\qquad Az(\partial_t)=\tfrac34z .
\]
The last identity follows directly from the \(dt\) component of the
projection, or by pairing against \(A\) and using \(A^*A=\tfrac34 I\).
Set \(\psi=e^{bt}(\sigma+w)\), \(a=bA\sigma\), \(k=|a|=\sqrt{3/4}\,b>0\),
and \(B=P+bA\). The exponentials cancel in the conjugated density
\[
F(w,dw)=|a+Bw|^4|\sigma+w|^{-4}.
\]
At \(w=0\) its derivative in the direction \(v\) is
\(4k^2\langle a,Bv\rangle-4k^4\langle\sigma,v\rangle
=4k^2\langle a,Pv\rangle\), since \(bA^*a=k^2\sigma\).
The last integrand is a divergence with constant coefficients, so its
integral vanishes for zero Dirichlet trace. This verifies stationarity
under arbitrary fixed-trace spinor variations.

With \(Y=Bv\) and \(s=\langle\sigma,v\rangle\), the real Hessian density
in the direction \(v\) is
\[
4k^2|Y|^2+8\langle a,Y\rangle^2
-32k^2\langle a,Y\rangle s+k^4(24s^2-4|v|^2).
\]
Indeed the denominator factor has first derivative \(-4s\) and second
derivative \(24s^2-4|v|^2\). Since
\[
32k^2|\langle a,Y\rangle s|
\le 2k^2|Y|^2+128k^4|v|^2 ,
\]
the density is at least \(2k^2|Y|^2-132k^4|v|^2\). Using
\(|Y|^2\ge \tfrac12|Pv|^2-b^2|Av|^2\), \(|Av|\le |v|\), and \(k^2\le b^2\)
gives \(k^2(|Pv|^2-134b^2|v|^2)\).

Let \(H^1_0\) denote the closure in \(H^1\) of smooth periodic fields
supported away from the two ends. This is the zero-trace \(H^1\) space.
For this identification, zero \(H^1\) trace gives
\(\int_0^\epsilon |v(s,x)|^2ds\le \epsilon^2
\int_0^\epsilon|\partial_s v(s,x)|^2ds\) in the inward distance
coordinate, by writing \(v\) as the integral of \(\partial_s v\) from
the end. Integrating in \(x\) shows that cutting off in boundary layers
of width \(\epsilon\) converges in \(H^1\), and one can then smooth by
convolution in the interior. Zero extension in \(t\) gives an \(H^1\)
field on \(\mathbb R\times\mathbb T^3\), so applying Plancherel to
\(A_\xi^*A_\xi\) gives the exact identity
\(\|Pv\|_2^2=\tfrac34\|\nabla v\|_2^2\). The interval estimate
\(\|v\|_2^2\le 4\|\partial_t v\|_2^2\) follows by integrating the bound
\(|v(t,x)|^2\le 2\int_{-1}^1|\partial_t v(\tau,x)|^2d\tau\).
Thus the integrated Hessian \(\mathcal H\) satisfies
\[
\mathcal H(v,v)\ge k^2(\tfrac34-536b^2)\|\nabla v\|_2^2
\ge \tfrac7{10} k^2\|\nabla v\|_2^2
\ge \tfrac7{50} k^2\|v\|_{H^1}^2 .
\]
Here \(\tfrac34-536b^2=0.7366\), and the \(H^1\) norm squared is
\(\|v\|_2^2+\|\nabla v\|_2^2\). These are fixed-slope bounds.

Let \(L\) denote the operator obtained from the integrated Hessian, with
\(\langle Lu,v\rangle=\mathcal H(u,v)\) for \(v\in H^1_0\).
Its coefficients are constant. In the convention with symbol of
\(-\partial_i\partial_j\) given by \(\xi_i\xi_j\), the principal symbol is
\[
A_\xi^*(4k^2 I+8a\otimes a)A_\xi\ \ge\ 3k^2|\xi|^2 I ,
\]
where \(a\otimes a\) is the real rank-one operator. In particular the matrix
multiplying \(-\partial_t^2\) is
\[
M_{00}=3k^2 I+6k^2\,\sigma\otimes\sigma ,
\]
with eigenvalues \(9k^2\) in the real radial direction and \(3k^2\) on its
real orthogonal complement. The nonzero normal block is the one used for
boundary derivative recovery.

## Homogeneous Dirichlet inverse

The Hessian is a bounded symmetric bilinear form on \(H^1_0\). Coercivity
makes it an inner product with norm equivalent to the \(H^1\) norm, so
Riesz representation gives a unique weak solution \(u\in H^1_0\) of
\(Lu=f\) for every \(f\in(H^1_0)'\), with
\(\|u\|_{H^1}\le \frac{50}{7k^2}\|f\|_{(H^1_0)'}\).

For \(f\in H^3(M,S^+)\), let \(S_N\) be the Fourier projection onto
tangential modes \(|n|\le N\). The projection is bounded in all the integer
Sobolev norms in use, it preserves zero Dirichlet trace, and it commutes
with \(L\) because the coefficients are constant. For a tangential
multi-index \(\alpha\) with \(|\alpha|\le4\),
\(\partial_x^\alpha S_Nu\in H^1_0\) and solves the weak equation with
forcing \(\partial_x^\alpha S_N f\). If \(|\alpha|\le3\), the forcing has
\(L^2\) norm bounded by \(\|f\|_{H^3}\). If \(|\alpha|=4\), write
\(\alpha=\beta+e_j\), with \(|\beta|=3\). Integration by parts in \(x_j\)
gives
\[
|\langle\partial_x^\alpha S_N f,v\rangle|
=|(\partial_x^\beta S_N f,\partial_{x_j}v)_{L^2}|
\le\|f\|_{H^3}\|v\|_{H^1}.
\]
The weak estimate bounds all these differentiated solutions uniformly in
\(H^1\). As \(S_Nu\to u\) in \(H^1\), bounded weak subsequences identify the
distributional derivatives \(\partial_x^\alpha u\) in \(H^1\). This
controls all derivatives of total order at most five with zero or one
normal derivative.

In the distributional equation, solve for \(\partial_t^2 u\) by applying
\(M_{00}^{-1}\) to a linear combination of \(f\) and constant multiples of
derivatives of \(u\) of total order at most two and normal order at most
one. For normal order \(q=2,3,4,5\), apply
\(\partial_t^{q-2}\partial_x^\alpha\) with \(|\alpha|\le5-q\) to this
identity. The derivatives of \(f\) have total order at most three, and
the derivatives of \(u\) on the right have total order at most five and
normal order at most \(q-1\). Induction bounds each derivative in \(L^2\)
on the entire cylinder. Thus \(\|u\|_{H^5}\le C_b\|f\|_{H^3}\).
Conversely an \(H^5\) field with zero trace that solves \(Lu=f\)
satisfies the weak equation by integration by parts. It follows that
\(L:H^5\cap H^1_0\to H^3\) is a bounded isomorphism.

## Trace and nonlinear inversion

Write \(T\) for the pair of traces and
\(\lambda_n=(1+4\pi^2|n|^2)^{1/2}\) for the tangential Fourier weights.
The \(H^m\) norm squared is equivalent to
\(\sum_{n\in\mathbb Z^3}\sum_{q=0}^m
\lambda_n^{2(m-q)}\|\partial_t^q u_n\|_{L^2_t}^2\).
At each endpoint \(e\), the fundamental theorem of calculus,
Cauchy–Schwarz and averaging over an inward interval of length
\(1/\lambda_n\) give
\[
|u_n(e)|^2\le 2\lambda_n\|u_n\|_{L^2_t}^2
             +2\lambda_n^{-1}\|\partial_t u_n\|_{L^2_t}^2 .
\]
This gives the continuous trace to \(H^{m-1/2}\) for \(m\ge1\), by
multiplying by \(\lambda_n^{2m-1}\). A bounded right inverse \(E:X\to H^5\)
is given separately at each end by extending its coefficient \(g_n\) to
\(\chi(s)e^{-\lambda_n s}g_n\), where \(s\) is inward distance and \(\chi\)
is a smooth cutoff equal to one near \(s=0\), with support in \(s<1/2\).
The two extensions have disjoint support. For \(0\le q\le5\) the squared
\(L^2_s\) derivative norm of the mode is bounded by
\(C_q\lambda_n^{2q-1}|g_n|^2\), from the product rule and
\(\|e^{-\lambda_n s}\|_{L^2(0,\infty)}^2=(2\lambda_n)^{-1}\).
Substitution gives \(\|Eg\|_{H^5}\le C\|g\|_X\) and \(TEg=g\).

The Sobolev facts used for the nonlinear map are \(H^4\hookrightarrow C^0\)
and bounded multiplication \(H^4\times H^4\to H^4\) in dimension four.
On this product they follow by bounded extension in \(t\) across each
end by reflected dilations, then Fourier analysis on
\(\mathbb R\times\mathbb T^3\). For extension in \(H^m\), take \(m\)
distinct positive dilation factors \(j\) and solve for the coefficients
by matching jets of order \(0,\ldots,m-1\) with the matrix
\(((-j)^q)_{q,j}\). This matrix is invertible, and using a fixed collar
cutoff gives the norm bound from the derivative rule and rescaling.
One may justify the matching first on smooth fields and extend by
density. In Fourier variables, the Cauchy–Schwarz bound with
\(\langle\xi\rangle^{-4}\) gives an \(L^1\) Fourier transform and hence
the continuous embedding. For multiplication use
\(\langle\xi+\eta\rangle^4\le C(\langle\xi\rangle^4+\langle\eta\rangle^4)\)
and the \(L^1\)-\(L^2\) convolution bound, where frequency is continuous
in \(t\) and discrete in \(x\).

In a small \(H^5\) ball about \(0\), \(|\sigma+w|\) is bounded below by
\(1/2\) and above by \(3/2\). One can also impose \(|Bw|\le k/2\) by
the \(H^4\) embedding applied to \(Bw\). The leading symbol of
\(D\mathcal E(w)\) then has quadratic form bounded below by
\(|\sigma+w|^{-4}4|a+Bw|^2|A_\xi z|^2\ge
(4/27)k^2|\xi|^2|z|^2\). Thus normal ellipticity persists on the
neighborhood. Moreover \(|\sigma+w|^2=1+q(w)\) where \(q(w)\) is a polynomial
in \(w\) small in \(H^4\). Its inverse is analytic via the convergent
geometric series in the \(H^4\) algebra, after rescaling the norm by
the algebra constant. Both partial derivatives of the density \(F\)
with respect to \(w\) and \(dw\) are therefore smooth maps into \(H^4\).
The conjugated bulk Euler expression
\(\mathcal E(w)=F_w(w,dw)-\sum_i\partial_i F_{\partial_i w}(w,dw)\)
is a smooth \(H^5\to H^3\) map. Integration by parts gives its equivalence
to fixed-trace stationarity and identifies \(D\mathcal E(0)=L\).
It also gives \(\mathcal E(0)=0\) from the stationarity check above.

The derivative of \(w\mapsto(\mathcal E(w),Tw)\) at \(0\) is \(v\mapsto
(Lv,Tv)\). This is a bounded isomorphism onto \(H^3\times X\), with inverse
\[
(f,g)\longmapsto Eg+L^{-1}(f-LEg)
\]
using the homogeneous Dirichlet inverse in the second term. The Banach
inverse function theorem applies to this smooth map between open sets in
real Banach spaces with invertible derivative. Its smooth local inverse,
evaluated at \((0,g)\), supplies the conjugated solution and uniqueness
among fields in an \(H^5\) neighborhood. The trace in the original
variable is \((e^{-b}(\sigma+g_-),e^{b}(\sigma+g_+))\), an affine
isomorphism in \(X\). Shrinking to a product of small balls in \(X\)
allows every direction at both endpoints. The algebra argument and
integration show the action is smooth in \(H^5\) on this neighborhood.

## Outward momentum and exact graph

For \(q=(q_-,q_+)\) in the open trace neighborhood \(U\subset X\), write the
field as \(\psi(q)\) and its on-shell action as
\(\mathcal A(q)=S[\psi(q)]\). Differentiating that action along a trace
direction \(h\in X\) gives
\[
d\mathcal A(q)[h]=
4\sum_{e\in\{-,+\}}\int_{\mathbb T^3}
\left\langle W(\nu_e),h_e\right\rangle\,dA ,
\qquad W=|\psi(q)|^{-4}|P\psi(q)|^2P\psi(q),\qquad
\nu_\pm=\pm\partial_t .
\]
Indeed the density derivative at \(\psi\) is
\(4\langle W,P\eta\rangle-4|\psi|^{-6}|P\psi|^4\langle\psi,\eta\rangle\).
Since \(W\) is Clifford-trace-free, \(\langle W,P\eta\rangle
=\langle W,d\eta\rangle\) and integration by parts yields the stated
boundary term and the original bulk expression
\(4(P^*W-|\psi|^{-6}|P\psi|^4\psi)\), where \(P^*\) is the formal
interior adjoint. This bulk term vanishes and \(T(D\psi(q)[h])=h\).
The trace is justified by \(W\in H^4\), with
\(W(\nu_e)\in H^{7/2}\) embedded into the real continuous dual
\(H^{-9/2}\) using the \(L^2\) pairing. At the base field the outward
momentum section is \(\pm(9/4)b^3 e^{\mp b}\sigma\) at the respective
ends \(t=\pm1\).

In the canonical cotangent space \(X\times X'\), where \(X'\) is the
continuous real dual, the relation of this local solution family is
\(\{(q,d\mathcal A(q)):q\in U\}\). The canonical one-form pulls back to
\(d\mathcal A\), giving exactness. For maximality, write the canonical
symplectic pairing as \(\Omega((u,\alpha),(v,\beta))=\beta(u)-\alpha(v)\).
It is strong because \(X\) is reflexive.
The tangent graph consists of \((v,D^2\mathcal A(q)[v,\cdot])\) for all
\(v\in X\). A vector \((u,\alpha)\) is symplectically orthogonal to it
exactly when \(\alpha(v)=D^2\mathcal A(q)[v,u]\) for all \(v\). By symmetry
of the second derivative this is membership in the tangent graph, which
is complemented by the vertical fiber. In the incoming/outgoing
cotangent convention the incoming covector changes sign, giving the
product with reversed incoming symplectic form. This is a local relation
over both trace variables.

## Sources and evidence scope

Rechecked the [canonical flat-cylinder calculation and variation](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md)
at the old normalization \(J_g^4/4\) and used the overview's normalization
\(S=J_g^4\). The three frozen DIR inputs were inspected for
[admissible zeros](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md),
[the Clifford symbol and conformal convention](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md)
and [the induced punctured scale](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E10_20261124.md).
The frozen calculation here uses the flat spinor projection on a
zero-free neighborhood.

Primary passages inspected on 28 November were Friedrich's published
§1 equation (1.1), its conformal paragraph, and §2 equation (2.2) and
Propositions 1, 2 and 6, for the frozen spinor context. Vankerschaver–Liao–Leok,
arXiv:1111.0280v2 §4, Theorems 4.1–4.2, describe generating functionals
and admissible-data isotropy with manifold hypotheses. The Hilbert
spaces, analytic well-posedness and maximality above are checked directly.
Biran–Cornea, *Lagrangian cobordism. I*, Definition 2.1.1 and the cylindrical
end description in §4.1 supply the separate geometric context. The proof
here has the fixed \(H^5\), zero-free, nonzero-slope scope and supplies the
local Dirichlet result to B04 and E07 for replay.
[Friedrich](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf)
· [Generating functionals](https://arxiv.org/pdf/1111.0280v2#page=16)
· [Lagrangian cobordism](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf#page=2)
