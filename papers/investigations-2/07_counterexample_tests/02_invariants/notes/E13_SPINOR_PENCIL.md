# WIN-E13 · Kernel map and zero incidence of a spinor pencil

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Requested configuration GPT-6.2 Sol / ultra. Actual
serving variant and effort are unavailable. Inputs are frozen
[WIN-E13 revision 1](../research-progress/handoffs/REQUEST_TWISTOR_R1.md),
checkout `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`, and the positive
[half-spin normalization](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md#chiral-chernweil-density-and-sign).
Working proof for smooth linear pencils on a fixed smooth base, pending
independent replay and formal verification. Cohomology is integral.

## Conventions and kernel

Let \(M\) be a closed, oriented, smooth homotopy four-sphere with any fixed
smooth Riemannian metric, and let \(L=S^+\) be its right quaternionic
positive half-spin line. Write \(u_M\) for the orientation generator and
use the stipulated \(c_2(L)=-u_M\). For a right quaternionic line the
complex structure is right multiplication by \(i\). The model real
orientation is then \((1,i,j,-k)\), and the resulting Euler class is
\(e(L_{\mathbb R})=c_2(L)\).
[Milnor–Stasheff, *Characteristic Classes* (1974), §14.2 and Lemma 14.1](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/milnor-stasheff2.pdf)

Put \(P=\mathbb H\mathbb P^1\) with tautological right line \(T\) and
quotient right line \(Q=\underline{\mathbb H}^2/T\). Orient \(P\) by the
right-\(i\) complex orientation in the chart \(q\mapsto[q:1]\), and write
\(u_P\) for its orientation generator. The second chart has transition
\(q\mapsto q^{-1}\), with differential \(h\mapsto -q^{-1}h q^{-1}\).
Left and right multiplication by nonzero quaternions preserve real
orientation. These charts give the standard smooth \(S^4\) by
stereographic coordinates, with conjugation in one chart to convert
radial inversion to quaternionic inversion.

For right lines \(A,B\), orient the real four-plane
\(\operatorname{Hom}_{\mathbb H}(A,B)\) by the quaternionic coefficient
of a map in local nonzero frames, using \((1,i,j,-k)\). Frame changes act
by left and right multiplication. The adjoint from
\(\operatorname{Hom}_{\mathbb H}(T,\underline{\mathbb H})\) to \(T\), using
the Hermitian metrics and evaluation at \(1\), is represented in unit
frames by quaternionic conjugation. It reverses real orientation. The
restriction of first-coordinate projection \(\mathbb H^2\to\mathbb H\)
is a section of \(\operatorname{Hom}_{\mathbb H}(T,\underline{\mathbb H})\)
with one zero at \([0:1]\) and local expression \(q\). Thus its zero has
index \(+1\), and
\[
  c_2(T)=-u_P,\qquad c_2(Q)=u_P.
\]
The second equality uses the Whitney formula for \(T\oplus Q\cong
\underline{\mathbb H}^2\). The complex determinants of quaternionic lines
are trivial. The Euler class represents the oriented transverse zero
locus because the section pulls the ambient Thom class back to the normal
Thom class. Pullback followed by forgetting relative supports agrees
with zero-section pullback by the linear homotopy of sections.
[Milnor–Stasheff, §§9 and 11.1 and formula (14.7) in §14.4](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/milnor-stasheff2.pdf)

Let \(s_0,s_1\) be smooth sections of \(L\) with no common zero and set
\(F_x(q_0,q_1)=s_0(x)q_0+s_1(x)q_1\). This is surjective at every point
because a nonzero element of a quaternionic line spans it. The kernel map
\(\kappa(x)=\ker F_x\) is smooth. Where \(s_0\ne0\) and \(s_1=s_0a\) its
formula is \([-a:1]\). Where \(s_1\ne0\) and \(s_0=s_1b\) it is
\([1:-b]\). Taking the kernel and quotient of \(F\) gives
\[
  \ker F=\kappa^*T,\qquad L\cong\kappa^*Q,
  \qquad \kappa^*u_P=-u_M,\qquad \deg\kappa=-1.
\]
In particular, \(c_2(\ker F)=u_M\). The nonzero degree forces
surjectivity, since a map omitting a point factors through a contractible
chart of \(P\).

## Incidence class and the two restrictions

Write \(\pi_M,\pi_P\) for the projections on \(M\times P\), and set
\[
  E=\operatorname{Hom}_{\mathbb H}(\pi_P^*T,\pi_M^*L),\qquad
  \sigma(x,\ell)=F_x|_\ell,\qquad Z=\sigma^{-1}(0)=\Gamma_\kappa.
\]
At incidence, identify \(T_\ell P\) with
\(\operatorname{Hom}_{\mathbb H}(\ell,\mathbb H^2/\ell)\) by writing nearby
lines as graphs. The identification preserves orientation by the chart
convention at \([0:1]\) and continuity. Varying \(\ell\) in this chart
gives \(D_\ell\sigma(\eta)=\overline F_x\circ\eta\), where
\(\overline F_x:\mathbb H^2/\ell\to L_x\) is the induced isomorphism.
This is an orientation-preserving isomorphism, so \(\sigma\) is transverse
to zero. In the product orientation of \(M\times P\), the zero-locus
orientation on \(Z\) makes \(\pi_M|_Z\) orientation-preserving. Indeed a
graph tangent basis followed by a positive parameter basis has the product
orientation, and \(D_\ell\sigma\) carries the second basis to a positive
one in \(E\).

The Künneth decomposition of \(H^4(M\times P)\) has one summand for each
factor. On \(M\times\{\ell\}\), evaluation at any nonzero \(v\in\ell\)
identifies the real oriented bundle \(E\) with \(L_{\mathbb R}\). On
\(\{x\}\times P\), choosing a nonzero vector in \(L_x\) identifies \(E\)
with the Hom bundle used to compute \(c_2(T)\). Consequently
\[
  \operatorname{PD}_{M\times P}[Z]=e(E)
  =\pi_M^*c_2(L)-\pi_P^*c_2(T)=-\pi_M^*u_M+\pi_P^*u_P.
\]
The oriented normal Euler class is \(e(\nu Z)=e(E)|_Z=-2u_M\) under
\(\pi_M|_Z\). The tangent Euler class, under the same identification, is
\(2u_M\) because \(Z\) is diffeomorphic to \(M\) and \(\chi(M)=2\).
[Milnor–Stasheff, §11.5, Corollary 11.12](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/milnor-stasheff2.pdf)

The point insertion at fixed \(x\) is \(e(E|_{\{x\}\times P})=u_P\),
pairing to \(+1\) on the parameter sphere. It counts the unique vanishing
line with positive parameter derivative. The restriction of \(\pi_M^* L\)
at \(x\) is a constant bundle and has zero \(c_2\) there. The closed
spin-bundle number \(\langle c_2(L),[M]\rangle=-1\) is the pairing on the
base, also obtained by restricting \(e(E)\) at fixed parameter. These
ordinary cohomology calculations give the same values on every homotopy
four-sphere.

## Existence on the fixed smooth base

Use locally supported real frame sections to obtain a finite family
\(t_1,\ldots,t_N\) spanning each real fibre of \(L\). The zero locus of
\((x,a)\mapsto\sum_j a_jt_j(x)\), with \(a\in\mathbb R^N\), is smooth of
dimension \(N\) because the parameter derivative is onto. A regular value
of the projection of this locus to \(\mathbb R^N\) supplies a transverse
section \(s_0\). To see this, a tangent pair \((v,b)\) at a zero satisfies
\(D_x(\sum a_jt_j)(v)+\sum b_jt_j(x)=0\). Projection onto every \(b\)
is possible exactly when the \(x\)-derivative is onto. Sard gives such
parameters and compactness makes the zeros of \(s_0\) finite. Choose
\(s_1\) in disjoint trivializing neighborhoods, with bump-supported local
sections that are nonzero at each zero of \(s_0\). This supplies the
required pair for every \(M\) and every fixed metric. These are arbitrary
smooth sections of the half-spin bundle.
[Milnor, *Topology from the Differentiable Viewpoint*, §§2–3, Sard for smooth maps](https://people.dm.unipi.it/benedett/MILNOR-TDVPOINT.pdf)

## Regular fibres and everywhere invertible differential

For a regular value \(\ell\) of \(\kappa\), the zero set of \(F_x(v)\) for
\(0\ne v\in\ell\) is the finite fibre \(\kappa^{-1}(\ell)\). Differentiating
\(\sigma(x,\kappa(x))=0\) gives \(D_x\sigma=-D_\ell\sigma\,d\kappa_x\).
Since the fibre dimension is even and the parameter derivative preserves
orientation, the local index at each zero equals the local degree of
\(\kappa\). Therefore the positive and negative counts satisfy
\(n_+-n_-=-1\). In particular the unsigned cardinality is odd, and a
singleton regular fibre has index \(-1\).
[Milnor, §§5–6, signed degree and local index](https://people.dm.unipi.it/benedett/MILNOR-TDVPOINT.pdf)

In fact every smooth degree \(-1\) map \(f:M\to P\) is realized as the
kernel of a generating pair. The Hopf degree theorem, applied to the
connected oriented closed four-manifold \(M\) and the standard smooth
target sphere \(P\), gives a smooth homotopy from \(\kappa\) to \(f\).
Parallel transport along it in the quaternionic connection on \(Q\)
obtained by orthogonal projection of the trivial connection onto
\(T^\perp\) identifies \(f^*Q\) with \(\kappa^*Q\cong L\). Compose the
quotient map \(\underline{\mathbb H}^2\to f^*Q\) with that isomorphism.
The images of the constant basis are the generating pair with kernel
\(f\).
[Milnor, §7, Hopf degree theorem](https://people.dm.unipi.it/benedett/MILNOR-TDVPOINT.pdf)

For example, use an oriented coordinate closed unit ball in \(M\). On
its interior let \(f(y)=[q(y):1]\) with
\(q(y)=R(y)\exp(1/(1-|y|^2))\), where \(R\) is a real linear reflection
in the oriented quaternion coordinates. Send the rest of \(M\) to
\([1:0]\). Near the boundary use the second chart coordinate
\(q(y)^{-1}=\exp(-1/(1-|y|^2))R(y)^{-1}\), which extends smoothly by zero.
The only inverse image of \([0:1]\) is the ball center and its derivative
is invertible of negative sign. Thus even a singleton regular fibre is
available on every smooth homotopy four-sphere. This map has zero
differential on the open exterior of the ball.

If \(d\kappa_x\) is invertible for every \(x\), the inverse function
theorem gives a local diffeomorphism. The derivative sign is constant on
connected \(M\). Every target value is regular and has signed count
\(-1\), so every value has one preimage. The local inverses give a smooth
global inverse. Conversely a smooth identification of \(M\) with \(S^4\)
gives a degree \(-1\) diffeomorphism to \(P\) after choosing the sign by a
reflection if needed, and the realization argument gives a pencil with
everywhere invertible differential. Existence of such a pencil is
equivalent to smooth standardness on the fixed base. The construction of
generating pairs and the ordinary incidence class hold universally, while
everywhere invertible differential supplies the additional hypothesis
equivalent to the target.
