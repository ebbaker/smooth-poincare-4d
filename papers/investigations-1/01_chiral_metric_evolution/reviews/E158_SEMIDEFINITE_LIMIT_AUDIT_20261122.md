# E158 — Independent audit of the semidefinite limit argument

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol`
/ `ultra`. Independent runtime and selected lead identifiers were
unavailable. I audited E145 in E147 and authored upstream E137
and E140. I did not author E155 or E157. This audit treats
E155/E156 as assessed and checks the floor-free extraction and
new low-regularity and topology arguments in E157. E157's
historical conditional wording is preserved.
[Request][req] · [E157][e157] · [E155/E156 assessment][a155].

## Disposition and hypotheses

**Pass.** Work on the fixed smooth compact closed connected
simply connected oriented real four-manifold \(M\) with
\(H^2(M;\mathbb R)=0\), on the fixed smooth principal \(SO(3)\)
bundle with its native negative Killing pairing. Supply smooth
positive-plane native definite \(A_n\) of the round-compatible
curvature-map sign, smooth orientation-preserving
\(\varphi_n:M\to M\) with \(g'_n=\varphi_n^*g_n\to g_\infty>0\)
in \(C^1\), and uniform live \(|T_n|+|\nabla^{A_n}T_n|\).
The extraction needs no common quantitative lower eigenvalue
bound on \(Q_n\). The limiting curvature pair is positive
definite in the same sign. In the specific case of times
approaching a finite endpoint of one supplied original smooth
flow, it provides the positive normalized subsequence required
by E148. No metric compactness result is an input here.
[B79][b79] · [E157][e157] · [Sequential assessment][a148].

## Floor-free extraction and distributional limits

For each \(n\) the native Gram identity gives
\((F_n^\sharp)^*F_n^\sharp=Q_n>0\), so the individual map
\(\sigma_n=-F_n^\sharp\circ S_n^{-1}\), \(S_n=Q_n^{1/2}\),
is a smooth oriented isometry to \(\Lambda_{g_n}^+\).
No uniform bound on \(S_n^{-1}\) is needed to define it.
Choose \(g_b=g_1\) and \(\sigma_b=\sigma_1\) as one fixed
smooth chiral identification. The map \(J_n\) on two-forms
is inverse pullback by the positive tangent isometry
\((g_b^{-1}g'_n)^{-1/2}\). The only matrix inverse used to
control \(J_n\) and its derivative is on the compact positive
range of \(g_b^{-1}g'_n\), supplied by the positive \(C^1\)
metric limit. Thus \(J_n\to J_\infty\) in \(C^1\).
The fiber map \(U_n=(\varphi_n^*\sigma_n)^{-1}J_n\sigma_b\)
acts on oriented orthonormal frames and gives the smooth
equivariant \(H_n\) covering \(\varphi_n\). Its exact
normalization is \(\sigma'_n=(\varphi_n^*\sigma_n)U_n
=J_n\sigma_b\).

For the pulled-back chiral connection,
\[
 D^{\Gamma'_n}=(J_n\sigma_b)^{-1}D^{+,g'_n}(J_n\sigma_b).
\]
The two changing identifications have already canceled
inside this identity. The coefficients use \(g'_n\), its
inverse and first spatial derivative, and \(J_n\sigma_b\)
and its first derivative. They converge uniformly in
the smooth fixed charts. This uses neither derivatives
of \(H_n\) as uniformly controlled maps nor derivatives
of \(S_n^{-1}\). Primes now always refer to the fixed
bundle labels from the \(H_n\).
[E155, (1)–(4)][e155] · [E155/E156 assessment][a155].

The bounds for \(b_n=A_n-\Gamma_n\) and its derivative
are the floor-free E09 bounds in native units. For
\(P_X=S^{-1}\nabla_X^AS\) the relative Sylvester equation
of E09 uses the two inverses
\(\mathcal S_S^{-1}(ZS)\) and \(\mathcal S_S^{-1}(SZ)\).
In an \(S\)-eigenframe their entrywise multipliers are
\(s_j/(s_i+s_j)\) and \(s_i/(s_i+s_j)\), each at most
one. This argument acts on the smooth positive slices.
It never takes a bare inverse estimate for \(\mathcal S_S\)
at the semidefinite limit. Together with
\(|P|\le2|T|\), it gives the stated E09 full covariant
bound for \(\nabla^\Gamma b\). In the native conversion
both sides have the same number of base slots, and
the internal vector norm adds exactly \(\sqrt2\) on
the \(b\) side. Therefore
\[
 |b_n|\le2\sqrt6|T_n|,\qquad
 |\nabla^{\Gamma_n} b_n|
 \le\sqrt2\bigl(6|\nabla^{A_n}T_n|
                  +(36+8\sqrt3)|T_n|^2\bigr).
\]
For the separate \(\nabla^A Q\) estimate, let
\(\mathcal L(Z)=SZS\) on symmetric Frobenius matrices.
The map \(T_X\mapsto\tfrac12\nabla_X^A Q\) is
\(\mathcal L-\mathcal L I\otimes\mathcal L I/3
=\mathcal L^{1/2}P_\perp\mathcal L^{1/2}\),
where \(P_\perp\) is the orthogonal projection to the
complement of \(\mathcal L^{1/2}I\) and the squared
norm of this vector is \(\operatorname{tr}Q=3\).
Its norm is bounded by \(\lambda_{\max}(Q)\le3\).
Thus \(|\nabla^A Q|\le6|T|\), with no floor or
eigenframe derivative. These are tensorial bounds
and transfer under each \(H_n\).
[E09, relative estimates][e09] · [E145][e145] · [E155, (5)–(7)][e155].

In the fixed charts, the covariant derivative on \(b'_n\)
includes both the bounded chiral coefficients and the
bounded base Christoffel terms. Subtracting them gives
bounded ordinary coordinate derivatives of \(b'_n\).
The normalized \(A'_n=\Gamma'_n+b'_n\) is uniformly
bounded in the smooth affine background. Subtracting
its commutator from \(\nabla^{A'_n}Q'_n\) similarly
bounds the coordinate derivatives of \(Q'_n\), whose
values have Hilbert–Schmidt norm at most three. Finite
smaller charts, with equicontinuity on coordinate balls,
give one subsequence with uniform limits \(A_\infty\)
and \(Q_\infty\ge0\) of trace three. All local limits
patch through the fixed smooth transition rules.

For bounded positive semidefinite matrices the positive
square-root map is continuous also at zero eigenvalues.
Indeed the roots are bounded and any matrix limit of
them is positive semidefinite and squares to the given
limit, whose positive semidefinite root is unique.
Compactness of the bounded matrix range gives uniform
continuity of that map. Thus \(S'_n\to S_\infty\)
uniformly and
\[
 F'_n=-S'_n\sigma'_n\longrightarrow
 F_\infty=-S_\infty\sigma_\infty,\qquad
 \sigma_\infty=J_\infty\sigma_b\in C^1.
\]
Here the formula is in the internal column convention.
The chiral isometry \(\sigma_\infty\) is for the
supplied \(g_\infty\). The Gram identity already gives
\((F_\infty)_i\wedge(F_\infty)_j=(Q_\infty)_{ij}dV_{g_\infty}\)
and trace wedge density \(dV_{g_\infty}\) in the
semidefinite case. It does not then identify the entire
self-dual plane with the curvature image.
[E155 extraction][e155] · [E157 semidefinite passage][e157].

In a fixed smooth local frame, write \(a'_n,a_\infty\)
for the connection forms. Both
\(da'_n=F'_n-\tfrac12[a'_n\wedge a'_n]\) and
\(dF'_n=-[a'_n\wedge F'_n]\) pass distributionally
because the products converge uniformly and \(d\)
acts on smooth test forms. Hence \(F_\infty=F_{A_\infty}\)
and \(d_{A_\infty}F_\infty=0\) in distributions.
In particular \(da_\infty\) is represented by a
continuous two-form. This conclusion is about the
exterior derivative and does not assert that every
partial derivative of \(a_\infty\) exists as a function.
All arguments use fixed frames so no weak convergence
of gauge derivatives is required. [E157][e157].

## Relative inequality and the all-path kernel conclusion

On the smooth slices trace normalization gives
\[
 \nabla_Y^A Q=2S(T_Y-\operatorname{tr}(QT_Y)I/3)S.
\]
Since \(Q\ge0\) and \(\operatorname{tr}Q=3\),
\(|\operatorname{tr}(QT_Y)|/3\le\|T_Y\|_{\rm op}\).
Thus pairing the right side against \(v\) on both
sides gives the bound
\(4|Y|_g|T|_g\,\langle Qv,v\rangle\). The same
formula holds on each smooth normalized slice.
Take an arbitrary fixed piecewise \(C^1\) curve and
arbitrary start vector. Along the \(A'_n\)-parallel
vector, differentiation of its \(Q'_n\)-quadratic
value has no vector derivative terms. Gronwall
with both signs on each curve segment gives the
factors \(e^{\pm4C\ell_{g'_n}(\gamma)}\) at the
endpoints. Metric convergence gives length
convergence for that fixed curve.

In finitely many fixed smooth chart frames along
the curve, the transport matrices solve linear
ODEs whose coefficients converge uniformly on
each smooth segment. Subtracting their integral
equations gives convergence of their solutions
by the usual Gronwall estimate. The fixed frame
changes preserve this convergence at the segment
ends. The limiting transport for continuous
\(A_\infty\) is orthogonal, since its skew
matrix coefficients preserve the internal norm.
Uniform convergence of \(A'_n,Q'_n,g'_n\) was
already obtained on this one subsequence. No
curve-dependent subsequence or diagonalization
over curves is used. For each fixed curve the
endpoint inequalities hold in the limit with
positive finite factors. A zero quadratic value
is membership of the semidefinite kernel, so
parallel transport identifies the two endpoint
kernels in both directions. Connectedness makes
the rank constant, and the orthogonal complement
is parallel as well. [E157, (1) and kernel argument][e157].

## Low-regularity projection and curvature action

At constant rank the zero eigenspace projection
\(\Pi\) of the continuous symmetric matrix
\(Q_\infty\) is continuous. Locally the positive
eigenvalues are separated from zero by continuity
at a point, so a continuous cutoff equal to one
at zero and zero on the positive spectral range
gives this projection. This local separation uses
the already established constant rank.

In a fixed local frame let
\(\mathcal A_i=\operatorname{ad}(a_{\infty,i})\).
Along any coordinate segment, in positive or
negative parameter direction, the projection is
conjugated by its transport \(P_t\):
\(\Pi(x+te_i)=P_t\Pi(x)P_t^{-1}\).
The ordinary ODE with continuous coefficients
makes \(P_t\) differentiable in \(t\). It follows
at every point that \(\partial_i\Pi=-[\mathcal A_i,\Pi]\).
The right side is continuous, so all coordinate partials
are continuous and \(\Pi\) is \(C^1\).
This does not differentiate the transport with respect
to an arbitrary endpoint parameter.

The curvature matrix is
\(\mathcal F_{ij}=\partial_i\mathcal A_j-\partial_j\mathcal A_i
+[\mathcal A_i,\mathcal A_j]=\operatorname{ad}(F_{\infty,ij})\).
To alternate derivatives in the projection equation,
localize to a smaller chart and mollify \(\mathcal A\)
there. Both the mollified one-form and its exterior
derivative converge uniformly there by continuity and
commutation with \(d\). The \(C^1\) projection can be
kept fixed. Alternating the ordinary Leibniz rule for
each mollified coefficient and then passing in
distributions gives
\[
 0=-[\partial_i\mathcal A_j-\partial_j\mathcal A_i,\Pi]
   -[\mathcal A_j,\partial_i\Pi]+[\mathcal A_i,\partial_j\Pi].
\]
The mixed derivatives of \(\Pi\) commute in distributions.
Substitution of the projection equation changes the last
two terms to \([[\mathcal A_j,\mathcal A_i],\Pi]\)
by Jacobi. Thus \([\mathcal F_{ij},\Pi]=0\).
This identity has continuous coefficients and therefore
holds everywhere. No ordinary derivative of an individual
\(\mathcal A_i\) was used. Both the kernel and its
orthogonal complement are preserved by the continuous
curvature matrices. [E157, parallel projection][e157].

## Rank exclusions and topology at \(C^1\) regularity

Trace three excludes rank zero. In
\(F_\infty^\sharp=-\sigma_\infty\circ S_\infty\),
the domain is \(E\) and the range is in two-forms.
Its adjoint, or equivalently the internal evaluation
of the curvature on base two-vectors, has image
\(\operatorname{im}S_\infty=\operatorname{im}Q_\infty\),
since \(\sigma_\infty\) is a chiral isometry.
If the rank were two, its kernel would be a real
line \(L\). A skew endomorphism preserving \(L\)
kills \(L\). As
\(\operatorname{ad}(w)v=(w\times v)/\sqrt2\)
in the native oriented unit labels, every curvature
value \(w\) would then lie in \(L\). Its internal
image is \(L^\perp\) of rank two, a contradiction.

If the rank were one, \(I-\Pi\) would project onto a
parallel \(C^1\) real line \(L\). Its unit-vector
bundle is a two-sheeted cover. A choice of unit vector
at a point extends by path lifting to a global
continuous unit section \(v\) on the simply connected
base. Locally the section is the normalized projection
of a fixed smooth local vector, multiplied by a
locally constant sign. It is therefore \(C^1\).
The parallel projection gives
\(D^{A_\infty}v\in L\), and unit length with a
metric connection gives \(D^{A_\infty}v=0\).
The rank-one form of \(Q_\infty\) and its root is
then forced by trace three:
\[
 Q_\infty=3v\otimes v,\qquad
 S_\infty=\sqrt3\,v\otimes v,\qquad
 F_\infty=v\,\omega,\quad \omega=-\sqrt3\,\sigma_\infty(v).
\]
This proves \(\omega\in C^1\) by the explicit rank-one
expression. It is self-dual for \(g_\infty\) with
ordinary two-form norm \(\sqrt3\). The previously
established distributional Bianchi identity and the
product rule for \(v\omega\) give \(v\,d\omega=0\),
because \(D^{A_\infty}v=0\). Thus \(d\omega=0\)
pointwise. This does not appeal to a smooth Bianchi
identity for \(A_\infty\) or a general derivative
bound for the square-root map at the boundary.
[E157, ranks two and one][e157].

The closed smoothing used before Stokes is valid.
Choose finitely many smooth global fields spanning
every tangent space by using cutoffs in a finite cover.
For \(\Phi_s\) the composition of their flows,
\(D_s\Phi_s(x)\) is surjective at \(s=0\) because
the fields span \(T_xM\). Compactness gives a common
parameter ball on which the map is a submersion for
every \(x\). Choose smooth nonnegative unit-mass
weights \(\rho_\epsilon\) with compact support in
that ball shrinking to zero and set
\(\omega_\epsilon=\int\rho_\epsilon(s)\Phi_s^*\omega\,ds\).
To check smoothness, fix a cover of the compact
parameter support times the base by local patches
where one four-by-four parameter minor is invertible.
On each such patch, with a smooth partition of unity
supported inside the patch, the variables
\((x,s)\) can be replaced by
\((x,y=\Phi_s(x),s_{\rm spare})\).
The derivatives of \(\Phi_s\) in the pullback
components, the parameter density, the partition,
and the change-of-variables factor are smooth.
After integrating out the spare parameters this is
an integral of the original coefficients of \(\omega\)
against smooth compactly supported kernels in \(x,y\).
The localized supports permit extension by zero
inside the variable charts. Spatial derivatives of
the resulting integral act on the kernels.
Thus each \(\omega_\epsilon\) is smooth.

As \(\omega\) is \(C^1\), the pullback commutes with
\(d\) and differentiation can pass under the compact
parameter integral. Each average is closed. The
flows tend to the identity in \(C^1\), and uniform
continuity of \(\omega\) in the fixed charts gives
uniform convergence \(\omega_\epsilon\to\omega\).
By smooth de Rham, \(H^2(M;\mathbb R)=0\) makes
\(\omega_\epsilon=d\eta_\epsilon\) for a smooth
global one-form \(\eta_\epsilon\).
Since \(M\) is closed,
\(\int_M\omega_\epsilon\wedge\omega_\epsilon
=\int_M d(\eta_\epsilon\wedge d\eta_\epsilon)=0\).
Uniform convergence of the forms gives the same
integral identity for \(\omega\). But pointwise
self-duality and its constant norm give
\(\omega\wedge\omega=3dV_{g_\infty}\) and a
strictly positive integral. Simple connectivity
is used for the global unit section, and the real
degree-two cohomology condition for exactness of
the closed smooth averages. Neither step assumes
smoothness of the limiting geometry.
[E157, closed averaging and Stokes][e157].

## Positive limit and continuation scope

The remaining rank is three. The continuous positive
matrix \(Q_\infty\) has a positive lower eigenvalue
bound on the compact base. This is a conclusion for
the limiting subsequence. In the \(\sigma_\infty\)
labels the curvature map is \(-S_\infty\), so
invertibility restores the whole positive self-dual
plane and the original curvature-map sign. Its
trace wedge density was already \(dV_{g_\infty}\).
The signed definite reconstruction therefore
recovers precisely the supplied metric \(g_\infty\).
The compatibility formula holds distributionally
on the original fixed smooth bundle.

When \(A_n\) are actual late slices of one smooth
original native solution at finite \(\tau_*\),
the \(H_n\)-normalized pair values satisfy E148
in that same fixed bundle and base category. The
consequence is original smooth definite extension by
the previously assessed criterion. This packet does
not supply the positive metric limit, the live strain
bounds, or any all-data flow estimate. No metric
compactness theorem, new primary source inspection
or numerical experiment was used. Only the two
assigned E158 artifacts were written.
[E157][e157] · [Sequential assessment][a148] · [Return][return].

[req]: ../research-progress/handoffs/SP4-CME-E158_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E158_RETURN_v1.md
[b79]: ../brainstorm/notes/B79_SEMIDEFINITE_LIMIT_ON_HOMOTOPY_SPHERE_20261122.md
[e09]: ../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[e145]: ../notes/145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md
[e155]: ../notes/155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md
[e157]: ../notes/157_SEMIDEFINITE_LIMIT_RANK_TEST_20261122.md
[a148]: E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md
[a155]: E155_E156_STATIC_PAIR_COMPACTNESS_ASSESSMENT_20261122.md
