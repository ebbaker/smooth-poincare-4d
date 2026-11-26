# E68b · The fixed boundary class on the Mazur half

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI
Codex assistance. MASTER-E68b revision 1, bounded execution for
construction B02. Actual serving model and effort are unavailable.
Inputs are the construction draft `1f537ec8142a495d`,
[the eta-zero section](../manuscript/eta_zero_filling.tex)
`9dbaa580a7d3ce89`, the [E63 derivation](E63_ETA_ZERO_FILLING.md)
`c0cd002efd95bb2e`, the [E64 check](../reviews/E64_ETA_ZERO_FILLING.md)
`0b061f9a562b360c` and the
[E63–E67 assessment](../../../../master/research-progress/handoffs/E63_E67_BALANCED_DISKS_20261125.md)
`f69af8f092261af6`. The results concern smooth intrinsic Riemannian
metrics in the given boundary identification.

Work on the contractible \(W=W^-(0,3)\) cut of the \(n=1\) Isoshima
diagram, equipped with the contact-oriented boundary marking
\(Y=\Sigma(2,5,7)\) from E59. Its identity double is the standard smooth
\(S^4\). The boundary class in question is \([\gamma(v_*)]\), where
\(\gamma(v)=(e^1)^2+(e^2)^2+v^2(e^3)^2\) in the fixed Milnor coframe
with cyclic constants \((a,a,-a)\), \(a>0\), and
\(v_*^2=\sqrt{159}/11-1\). The topological identification, sign conventions
and frozen scale are those of [E56](E56_MARKED_EXTERIOR.md#the-actual-mazur-double)
and [E59](E59_SHORT_SEAM.md#the-actual-homogeneous-mazur-seam).

## Existence with the boundary class free

Sweeney's Proposition 1.2 applies to this actual smooth half because
it is a Mazur manifold with one handle of each index \(0,1,2\).
It supplies positive scalar curvature and mean-convex boundary.
Apply Bär–Hanke Theorem 3.7 to this metric with lower scalar bound
zero and target second fundamental form zero, taking a singleton
parameter space. The hypothesis is the original nonnegative mean
curvature. Their \(H\) is the trace divided by three and is positive
on a Euclidean ball. The deformation fixes the induced metric
and yields a smooth PSC metric on the same \(W\) with boundary totally
geodesic. The terminal normal collar is
\(dt^2+(1-Ct^2)\gamma_0\) near \(t=0\), where \(\gamma_0\) is the
induced metric of the original mean-convex fill and \(C\) is sufficiently
large. Its reflected metric is smooth, invariant under the specified
double reflection and PSC on the actual marked identity double.
A diffeomorphism of the identity double to \(S^4\) and the round metric
alone give no such invariance. The construction supplies neither an
identification of \([\gamma_0]\) with \([\gamma(v_*)]\) nor an energy
estimate for the boundary deformation.
[Sweeney, Proposition 1.2](https://doi.org/10.1007/s00208-026-03333-8) ·
[Bär–Hanke v5, Definition 3.1 and Theorem 3.7(a)–(d), (g)](https://arxiv.org/pdf/2012.09127v5)

Near any actually filled metric on \(Y\), neighboring smooth metrics
in a sufficiently small \(C^2\) neighborhood are also filled on the
same \(W\). In the Fermi collar add a tensor equal to the prescribed
boundary metric difference, pulled back from \(Y\) and multiplied
by a fixed cutoff constant near the boundary. The normal derivative
at zero remains zero. Positive definiteness and strict PSC persist
by uniform \(C^2\) closeness on the compact half. This supplies a
nonempty open set of marked boundary metrics.

## One exact spectral test for a prescribed class

For any fixed smooth marked boundary metric \(\gamma\) on this \(Y\),
let \(g\) range over smooth PSC extensions on \(W\) with
\(g|_Y=\gamma\). This collection is nonempty by Shi–Wang–Wei Theorem
1.1, which prescribes the first fundamental form. Their proof
attaches a product topological collar to the original \(W\) and
uses a boundary-preserving conformal deformation. Collared
reparametrization returns the marked metric to \(W\).
Their mean curvature bound in Remark 2.1 has no sign guarantee.
[Shi–Wang–Wei v3, Theorem 1.1, its proof, and Remark 2.1](https://arxiv.org/pdf/2007.06756v3)

Let \(\nu\) be the outward unit normal, \(H_g\) the trace of
\(\mathrm{II}_g(U,V)=g(\nabla_U\nu,V)\), and \(J_g=-6\Delta_g+R_g\).
Define \(\mathcal N_g f=\partial_\nu u_f|_Y\), where \(J_gu_f=0\)
and \(u_f|_Y=f\), with the weak conormal interpretation for
\(f\in H^{1/2}(Y)\). The positive Dirichlet form for \(g\) gives a
unique solution. Put
\[
 \mathcal S_g[f]=6\langle f,\mathcal N_g f\rangle
                   +2\int_Y H_g f^2\,dA_\gamma .
\]
The duality bracket is the boundary integral for smooth \(f\).
The following three conditions are equivalent.

1. There is a PSC metric with totally geodesic boundary in the
   marked class \([\gamma]\).
2. There is a PSC metric with \(H\ge0\) in that marked class.
3. At least one smooth PSC extension \(g\) of the exact boundary
   representative \(\gamma\) has \(\mathcal S_g[f]>0\) for every
   nonzero \(f\in H^{1/2}(Y)\).

The implication \(2\Rightarrow1\) is the Bär–Hanke deformation at
fixed induced metric, and \(1\Rightarrow2\) uses \(H=0\).
For \(3\Rightarrow1\), put
\[
 Q_g^{\rm Rob}(u)=\int_W(6|du|_g^2+R_gu^2)\,dV_g
                      +2\int_Y H_g u^2\,dA_\gamma .
\]
Subtracting \(u_f\) for \(f=u|_Y\) splits this as \(\mathcal S_g[f]\)
plus the positive Dirichlet remainder. Strict positivity gives a
positive first Robin eigenvalue \(\lambda_1\). The trace
inequality bounds the boundary term in absolute value by
\(\varepsilon\|du\|_2^2+C_\varepsilon\|u\|_2^2\), and the embeddings
into interior and boundary \(L^2\) are compact. The lowest Rayleigh
value is attained. Its smooth positive eigenfunction \(u\) satisfies
\(\partial_\nu u+(H_g/3)u=0\) and is positive through the boundary
by the strong maximum principle and the boundary point lemma.
The conformal metric \(u^2g\) has \(R=\lambda_1u^{-2}>0\) and
\(H=0\). Apply Bär–Hanke with fixed induced metric to make the
boundary totally geodesic.

For \(1\Rightarrow3\), normalize the induced metric to \(\gamma\)
by a positive conformal factor on the whole half. The normalized
metric \(h\) has a positive Robin form by conformal covariance.
Explicitly, for \(\widehat h=b^2h\), \(b>0\), Green's formula with
\(\widehat H=b^{-1}(H_h+3b^{-1}\partial_\nu b)\) gives
\(Q_{\widehat h}^{\rm Rob}(\phi)=Q_h^{\rm Rob}(b\phi)\).
In particular the normalized \(h\) has strictly positive first
Dirichlet eigenvalue. Solve \(J_hw=1\) with \(w|_Y=1\).
The negative-part test and Dirichlet positivity give \(w\ge0\).
At an interior zero minimum \(J_hw\le0\), a contradiction.
Thus \(w>0\) and \(g=w^2h\) is smooth, has exact boundary value
\(\gamma\), and has \(R_g=w^{-3}>0\). Its Robin form is positive
by the same covariance. Testing it on \(u_f\) gives condition 3.
[Bär–Hanke v5, Lemma 2.18 and Theorem 3.7](https://arxiv.org/pdf/2012.09127v5)

In the notation of Akutagawa–Botvinnik, this equivalently asks for
\(Y(W,Y;[\gamma])>0\). In a fixed extension class, the relative
Yamabe sign is the Robin sign above. After conformal normalization
to \(H=0\), strict positivity of the first Neumann eigenvalue
implies \(H^1\) coercivity and the Sobolev bound. The positive first
eigenfunction gives the converse sign test when the eigenvalue is
nonpositive. Taking the supremum over extension classes gives the
relative invariant. The boundary Yamabe sign is a separate invariant.
For the actual face \(R_{\gamma(v)}=-a^2(2+v^2/2)\) is constant,
so its intrinsic conformal Laplacian \(-8\Delta_\gamma+R_\gamma\)
has negative first eigenvalue. Gluing or cylindrical extension
theorems with positive boundary Yamabe sign do not apply here.
Rosenberg–Ruberman–Xu v8 Theorem 3.1 requires positive intrinsic
boundary conformal-Laplacian sign as well as an extending
representation. Every flat representation extending over this
contractible \(W\) restricts trivially to \(Y\).
[Akutagawa–Botvinnik, §§1.1 and 1.3](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2002/0010/0005/CAG-2002-0010-0005-a002.pdf) ·
[Rosenberg–Ruberman–Xu v8, Theorem 3.1](https://arxiv.org/pdf/2302.05521v8)

## A spin obstruction for larger fibers on the same marked half

There is a first zero crossing \(v_c\) of the actual homogeneous
spin Dirac family, with
\[
 2/11\ \le\ v_c^2\ \le\ 2 .
\]
The ordinary spin APS conditions of E63 hold at all \(0<v<v_c\).
For every \(v\ge v_c\) they obstruct a PSC totally geodesic
filling on any smooth oriented contractible half with that boundary
class and marking. In particular every \(v\ge\sqrt2\) is excluded
on the actual \(W\).

Use the unique spin structure and the E63 spin frame. On the fixed
Haar \(L^2\) space, let
\[
 H=C_1X_1+C_2X_2,\quad V=C_3X_3+a\omega/2,\quad
 D_v=H+v^{-1}V-av\omega/4,\qquad \omega=C_1C_2C_3\in\{1,-1\}.
\]
These operators are symmetric on smooth spinors,
\(HV+VH=0\), and \(V^2\ge a^2/22^2\) by the E63 period calculation.
The positive self-adjoint elliptic operator \(F=H^2+V^2\)
has scalar positive principal symbol, because \(X_1,X_2,X_3\)
are a frame and the Clifford generators anticommute. Its
finite-dimensional smooth eigenspaces are preserved by \(H\) and
\(V\). On each eigenspace, decompose further into their commuting
square eigenspaces with \(H^2=\mu I\) and \(V^2=\nu I\).
There \((H+v^{-1}V)^2=(\mu+v^{-2}\nu)I\), with \(\mu\ge0\)
and \(\nu\ge a^2/22^2\). Its positive and negative sign
multiplicities are constant in \(v>0\), by continuity and the
strictly positive square. The branches of \(D_v\) are therefore
\[
 \pm\sqrt{\mu+v^{-2}\nu}-av\omega/4
\]
with constant multiplicities. If \(\omega=1\), only the plus
branches can cross zero, each from positive to negative with
strictly negative derivative. If \(\omega=-1\), only the minus
branches can cross, each in the reverse direction. For a crossing
at \(v\le M\), \(\mu+\nu\le
\max(1,M^2)(aM/4)^2\), so only finitely many branches matter on
each compact interval. The spinors constant in the global spin
frame give a branch \(a(2-v^2)\omega/(4v)\) of complex
multiplicity at least two. They cross at \(v=\sqrt2\).
The small-fiber gap gives the other bound for \(v_c\).

Choose a smooth path of product-ended extensions on a fixed \(W\)
using the given smooth marking. For invertible boundary operators
the APS index is locally constant. At a crossing the trace domain
changes by exactly the crossing eigenspace, after transporting the
other spectral subspaces and separating off the finite-dimensional
crossing block. The Sobolev trace has a bounded right inverse, so
adding or removing that trace block changes the Fredholm index
by its complex dimension with the corresponding sign. All
jumps have the same sign in either oriented convention. The
index computed in E63 begins at zero. It stays zero until the
first crossing and has nonzero absolute value at every later
invertible parameter. All crossing parameters have nonzero
boundary Dirac kernel. Both tests are necessary in a PSC
totally geodesic filling, independently of product structure
or the boundary conformal representative, by E63/E66.
Since \(v_*^2<2/11\), this obstruction leaves the prescribed
eta-zero class in the initial invertible component.

## Zero Weyl energy is excluded at the eta-zero scale

Let \(e_i\) denote the \(\gamma(v)\)-orthonormal left-invariant
frame and \(P=\operatorname{Ric}_\gamma-(R_\gamma/4)\gamma\)
the three-dimensional Schouten tensor. By E59,
\(P_{33}-P_{11}=P_{33}-P_{22}=a^2(1+v^2)\).
In Koszul's formula the \(e_3\)-components of
\(\nabla_1e_2\) and \(\nabla_2e_1\) are \(-av/2\)
and \(av/2\), respectively. Consequently
\[
 (\nabla_1P)_{23}-(\nabla_2P)_{13}=a^3v(1+v^2)>0.
\]
Hence every \([\gamma(v)]\), including \([\gamma(v_*)]\),
has nonvanishing Cotton tensor. A smooth locally conformally flat
four-metric with totally geodesic boundary has locally conformally
flat induced boundary. By Gauss with \(\mathrm{II}=0\), its ambient
Schouten restricts to the intrinsic one. Contracted Bianchi and
zero ambient Weyl give the ambient Schouten Codazzi identity up
to the boundary. Its tangential restriction is the intrinsic
Cotton identity because the second fundamental form vanishes.
The computation therefore forbids a smooth totally geodesic
filling with \(E_++E_-=0\). At the eta-zero face E63 also gives
\(E_+=E_-\), so each is strictly positive for any such metric.
This is an endpoint argument, with no uniform positive lower
bound on the half sum.

## Packet disposition

The actual half supports smooth reflection-compatible PSC when
the conformal class is allowed to vary. The prescribed eta-zero
class has smooth PSC extensions before the mean-curvature condition
is imposed. To obtain the requested filling it remains to exhibit
one such extension with positive Robin trace form, or to rule
that out for every extension. The earlier product collar sign
restrictions and instability of any PSC totally geodesic eta-zero
seam retain their hypotheses. No half energy or spectral upper
budget is obtained for E66 recognition.

Primary passages inspected on 26 November 2026 were Sweeney,
*Positive curvature conditions on contractible manifolds*,
Math. Ann. 394 (2026), Article 53, Proposition 1.2 and its
following paragraph, Bär–Hanke, *Boundary conditions for scalar
curvature*, arXiv:2012.09127v5, Lemma 2.18, Definition 3.1,
Theorem 3.7 and Remark 3.9, Shi–Wang–Wei, *Total mean curvature
of the boundary and nonnegative scalar curvature fill-ins*,
arXiv:2007.06756v3, Theorem 1.1 and Remark 2.1, and
Akutagawa–Botvinnik, *The relative Yamabe invariant*,
Comm. Anal. Geom. 10 (2002), 935–969, §§1.1 and 1.3.
The published metadata of Lawson–Michelsohn,
*Embedding and surrounding with positive mean curvature*,
Invent. Math. 77 (1984), 399–419, was inspected. Its original
§5 is an inherited pointer in Sweeney and was not accessible
at the publisher. The Rosenberg–Ruberman–Xu result was checked
in arXiv:2302.05521v8, Theorem 3.1, with the positive boundary
sign condition stated there.
