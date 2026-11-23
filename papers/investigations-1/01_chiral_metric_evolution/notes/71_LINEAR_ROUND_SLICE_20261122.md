# SP4-CME-E71 — The orthogonal linear slice at the round reference

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. The E47, E48 and E51
digests matched the [request][req] before use. See [B44][b44]
and the [return][ret]. No new primary source was inspected.

## Reference splitting and symbol

Fix the smooth, compact, closed, oriented round Riemannian
\(S^4\), with E47's positive perfect \(A_0\), native \(g_0\)
and internal pairing from the negative Killing form. Put
\(d=d_0=d_{A_0}\), \(S=S_0\), \(Su=\iota_u F_0\).
All adjoints and Sobolev norms use the fixed metric, internal
pairing, and their reference derivatives. \(d\) on sections
of \(E\) is first-order covariant differentiation. The map
\(F_0:E\to\Lambda^+\) is a parallel fiber isometry: \(A_0\)
is the round induced chiral connection, and the curvature
scale is constant. Thus \(S\) is parallel. The three
contractions \(\iota_uF_{0i}\) for \(u\ne0\) span \(u^\perp\),
as used in the E47 symbol argument. In particular \(S\) is
injective. [E47, conventions and (3)][e47] · [E51, symbol][e51].

Define \(H=(S^*S)^{-1}S^*\), so \(HS=I\).
The map \(SH\) has image \(\mathrm{im}S\), equals the identity
on that image, and is self-adjoint. Consequently
\[
 \Pi=I-SH=I-S(S^*S)^{-1}S^*,\qquad K=d^*\Pi d                      \tag{1}
\]
uses a smooth parallel orthogonal projection onto \(\ker S^*\).
On sections of \(E\) the quadratic form of \(K\) is
\(\|\Pi d\phi\|_2^2\). In the convention
\(\partial_j\mapsto i\xi_j\), write \(w_\xi e=\xi\otimes e\).
The principal symbol satisfies
\(\langle\sigma_2(K)(\xi)e,e\rangle=|\Pi w_\xi e|^2\).
E47 and E51 establish
\(\mathrm{im}\,w_\xi\cap\mathrm{im}\,S=\{0\}\) for each
\(\xi\ne0\): the contractions spanning \(u^\perp\) cannot all
lie in the line \(\mathbb R\xi\).
Thus the symbol is positive on nonzero \(e\).
Compactness of the fixed sphere and of its unit covector and
amplitude spheres supplies a uniform positive bound times
\(|\xi|^2|e|^2\). [E47 (3)][e47] · [E48 (6), symbol][e48] ·
[E51, symbol][e51].

The exact bound in the native pairing can also be computed.
For any self-dual two-form \(\omega\),
\(|\iota_u\omega|^2=|u|^2|\omega|^2/2\).
In an oriented orthonormal frame with \(e_1=u/|u|\) the unit
self-dual basis consists of
\((e^1\wedge e^j+*_{g_0}(e^1\wedge e^j))/\sqrt2\) for \(j=2,3,4\).
Contraction gives the three covectors \(|u|e^j/\sqrt2\).
As \(F_0\) is a fiber isometry, summing the three contractions
gives \(S^*S=\tfrac32 I\) by polarization.
Also \(g_0(S^*w_\xi e,u)=F_0(e)(u,\xi^\sharp)\), so
\(|S^*w_\xi e|^2=|\xi|^2|e|^2/2\). Subtracting the squared
orthogonal \(SH\) component yields
\[
 |\Pi w_\xi e|^2=\tfrac23|\xi|^2|e|^2,\qquad
           \sigma_2(K)(\xi)=\tfrac23|\xi|^2 I.                     \tag{2}
\]

## Compact realization and the mixed-order inverse

On \(H^1(E)\) set
\(\mathfrak q(\phi,\psi)=\langle\Pi d\phi,\Pi d\psi\rangle_{L^2}\).
The rank-one bound implies
\[
 c\|\phi\|_{H^1}^2
   \le\|\phi\|_2^2+\mathfrak q[\phi]
   \le C\|\phi\|_{H^1}^2                                            \tag{3}
\]
for fixed positive \(c,C\). To see the lower bound, freeze the
principal coefficient and density in small charts. For the
constant form on a supported section, Plancherel and (2)
control its ordinary first derivatives. The supremum of the
coefficient variations can be made smaller than this bound
in each chart. The connection terms have one fewer derivative
and cost at most a small multiple of the derivative-square
bound plus \(C\|\phi\|_2^2\). Use a finite partition with
\(\sum_\gamma\chi_\gamma^2=1\):
in \(\sum_\gamma\|\Pi d(\chi_\gamma\phi)\|_2^2\)
the mixed cutoff terms cancel because
\(\sum_\gamma\chi_\gamma d\chi_\gamma=0\), and the square cutoff
terms cost \(C\|\phi\|_2^2\). This gives
\(\mathfrak q[\phi]\ge c_1\|\phi\|_{H^1}^2-C_1\|\phi\|_2^2\).
Use \(\mathfrak q[\phi]\ge0\) to obtain (3), and extend it
by density. This is the form construction used for the
different round operator in E47 and checked in E51.
[E47, realization][e47] · [E51, fixed realization][e51].

By (3) the weak inverse \(R=(I+K)^{-1}\) sends \(L^2(E)\)
boundedly into \(H^1(E)\). Indeed for \(f\in L^2\) solve the
coercive symmetric equation
\(\langle\phi,\psi\rangle+\mathfrak q(\phi,\psi)=\langle f,\psi\rangle\)
for all \(\psi\in H^1\). This inverse is positive, symmetric,
and compact on \(L^2\) by the compact inclusion \(H^1\subset L^2\).
It is injective since \(H^1\) is dense. Its strictly positive
eigenvalues \(\nu\le1\) give an orthonormal basis of \(L^2\),
with finite multiplicities and accumulation only at zero.
Define the self-adjoint \(K=R^{-1}-I\) on the range of \(R\),
equivalently on the domain of the spectral operator with
eigenvalues \(\nu^{-1}-1\ge0\). This realization has compact
resolvent. Its domain is the weak form domain with
\(K\phi\in L^2\), as follows by using \(f=\phi+K\phi\)
in the variational equation.

For the local regularity step, write the form in smooth
bundle frames and absorb the smooth volume density into
its coefficients. The leading term has the form
\(\int\langle A^{ij}(x)\partial_j\phi,\partial_i\eta\rangle\).
The derivative coefficients and the first- and zero-order
terms are smooth and bounded on fixed subcharts. Suppose
\(\phi\in H^1\), \(K\phi=f\in L^2\) weakly. Let
\(\delta_h v=(v(\cdot+h e_i)-v)/h\) along a coordinate
direction. Test by \(-\delta_{-h}(\chi^2\delta_h\phi)\) with a
smooth interior cutoff \(\chi\) and small \(|h|\).
The quotient integration by parts gives a leading form for
\(\chi\delta_h\phi\) with the translated leading coefficients.
The fixed lower bound used in (3) is uniform for these small
translations. Derivatives of \(\chi\) cost terms controlled
by \(\|\delta_h\phi\|_2\le C\|\phi\|_{H^1}\).
The quotient on the principal coefficients multiplies
\(\partial\phi\), so those terms are bounded by
\(C\|\phi\|_{H^1}(\|\chi\delta_h\phi\|_{H^1}+\|\phi\|_{H^1})\).
For form terms with a derivative on the test, the quotient
on their smooth coefficient times \(\phi\) is bounded by
\(C\|\phi\|_{H^1}\). For lower-order terms with no derivative
on the test, use
\(\|\delta_{-h}(\chi^2\delta_h\phi)\|_2
 \le C(\|\chi\delta_h\phi\|_{H^1}+\|\phi\|_{H^1})\).
This bound also handles the forcing, with the fixed bounded
density factors. Applying Young's inequality and (3) on
the patch gives
\[
 \|\chi\delta_h\phi\|_{H^1}\le
 C(\|f\|_2+\|\phi\|_{H^1})
\]
uniformly for small \(h\). Weak compactness and the
distributional limit of difference quotients yield
local \(H^2\). For \(f\in H^s\), \(s\ge1\) integer,
differentiate the coordinate equation \(s\) times on
nested smaller patches. The commutators with smooth
coefficients have at most \(s+1\) derivatives of \(\phi\),
which are already controlled by induction starting from
the \(H^2\) step. Applying the local \(H^2\) estimate to
each order-\(s\) derivative gives \(H^{s+2}\). A finite
cover with compact chart interiors and iteration of the
lower-order bounds give
\[
 \|\phi\|_{H^{s+2}}\le C_s(\|f\|_{H^s}+\|\phi\|_{H^1}),
             \qquad s\ge0.                                         \tag{4}
\]
In particular the operator domain is \(H^2\). The converse
inclusion follows because the smooth-coefficient
differential operator maps \(H^2\) to \(L^2\) and agrees
with the form by density. The regularity argument also
shows smoothness of nullvectors and of sections with
smooth forcing. [E47, realization and regularity][e47] ·
[E51, fixed realization][e51].

Let \(N=\ker K\) in \(L^2\). It is finite dimensional
from the eigenspace \(\nu=1\), and it equals
\(\{\psi\in H^1(E):\Pi d\psi=0\}\) from the form.
On \(V=H^1(E)\cap N^\perp\) one has
\[
 \|\phi\|_{H^1}^2\le C_\perp\,\mathfrak q[\phi].                      \tag{5}
\]
Otherwise a sequence of unit \(H^1\) norm in \(V\) has form
tending to zero. Pass to a subsequence weakly in \(H^1\)
and strongly in \(L^2\). Its limit lies in \(N\) since
\(\Pi d\) is bounded \(H^1\to L^2\), and it lies in \(N^\perp\)
by the strong \(L^2\) convergence. Thus its \(L^2\) norm tends
to zero, contradicting (3).

For \(f\in H^{-1}(E)\) vanishing on \(N\), solve
\(\mathfrak q(\phi,\psi)=\langle f,\psi\rangle\) on \(V\)
by (5). The solution belongs to \(V\), is unique there, and
solves on all of \(H^1\) because both sides vanish on \(N\).
It satisfies
\[
 \|\phi\|_{H^1}\le C_\perp\|f\|_{H^{-1}}.                            \tag{6}
\]
For arbitrary \(f\in H^{-1}\), subtract
\(\sum_{\ell}\langle f,\psi_\ell\rangle\psi_\ell\) for an
\(L^2\)-orthonormal smooth basis \(\{\psi_\ell\}\) of \(N\).
The resulting solution map is \(K^\dagger\).
On \(L^2\) it equals the spectral pseudoinverse, with
multiplier \((\nu^{-1}-1)^{-1}\) when \(\nu<1\) and zero
on the \(\nu=1\) eigenspace. The nonzero eigenvalues of
\(K\) have a positive lower bound by the compact resolvent
or (5).

## Decomposition, projection and Sobolev estimates

For \(a\in L^2(T^*S^4\otimes E)\), define \(f=d^*\Pi a\)
as an \(H^{-1}\) functional by
\[
 \langle f,\psi\rangle=\langle a,\Pi d\psi\rangle_{L^2}.
\]
It has norm at most \(C\|a\|_2\) and vanishes on \(N\).
In particular this compatibility holds for all smooth \(a\).
Set
\[
 \phi=K^\dagger d^*\Pi a,\qquad
 u=H(a-d\phi),\qquad
 a_{\rm sl}=\Pi(a-d\phi).                                           \tag{7}
\]
These are smooth for smooth \(a\).
They satisfy the exact identity
\[
 a=d\phi+Su+a_{\rm sl},\qquad
 S^*a_{\rm sl}=0,\quad d^*a_{\rm sl}=d^*\Pi a-K\phi=0.              \tag{8}
\]
The last identity holds in \(H^{-1}\), and is pointwise on
smooth sections.

For uniqueness, any decomposition satisfying (8) with
\(\phi\in H^1,\ u\in L^2\) has the same equation \(K\phi=f\)
by applying \(d^*\Pi\). Thus any other \(\tilde\phi\) differs
by \(\psi\in N\). Applying \(H\) to (8) gives
\(\tilde u-u=-H d\psi\) and applying \(\Pi\) gives the same
slice residual since \(\Pi d\psi=0\). More generally,
two pairs give the same orbit direction \(d\phi+Su\)
exactly when they differ by
\[
 (\psi,-H d\psi),\qquad \psi\in N.                                  \tag{9}
\]
Necessity follows by applying \(\Pi\) and \(H\) to the
difference. Conversely \(\Pi d\psi=0\) implies
\(d\psi=SHd\psi\), so these changes cancel. This identifies the
ambiguity without computing a stabilizer dimension.

In \(L^2(T^*S^4\otimes E)\) put
\[
 \mathcal X=\{a:S^*a=0,\ d^*a=0\ {\rm weakly}\},\qquad
 \mathcal Y=d\big(H^1(E)\big)+S\big(L^2(TS^4)\big).                  \tag{10}
\]
Testing against \(Su\) and \(d\phi\) for arbitrary \(u,\phi\)
gives \(\mathcal Y^\perp=\mathcal X\). By (8) every \(a\)
has a decomposition into \(\mathcal X\) and \(\mathcal Y\).
If \(a\perp\mathcal X\), pair this decomposition with
\(a_{\rm sl}\in\mathcal X\) to see \(a_{\rm sl}=0\).
Hence \(\mathcal Y=\mathcal X^\perp\) is closed as the
stated sum. In particular
\[
 \mathcal P:a\longmapsto a_{\rm sl}
     =(\Pi-\Pi d K^\dagger d^*\Pi)a
\]
has range \(\mathcal X\) and kernel \(\mathcal Y\).
For a slice element \(f=0\), and (7) gives
\(\mathcal Pa=a\), so \(\mathcal P^2=\mathcal P\).
For two \(L^2\) fields \(a,b\), both
\(\langle\mathcal Pa,b\rangle\) and
\(\langle a,\mathcal Pb\rangle\) equal
\(\langle\mathcal Pa,\mathcal Pb\rangle\).
Thus the projection is self-adjoint and orthogonal in \(L^2\).

For \(m=0\), (6) with the \(H^{-1}\) bound on \(d^*\Pi a\)
gives \(\|\phi\|_{H^1}\le C\|a\|_2\). The zeroth-order
operators \(H,\Pi\) in (7) then bound \(u,a_{\rm sl}\) in
\(L^2\). If \(a\in H^m\) with integer \(m\ge1\), the first-order
operator \(d^*\Pi\) gives
\(\|f\|_{H^{m-1}}\le C_m\|a\|_{H^m}\). Apply (4) with
\(s=m-1\), and use (6) to bound its \(H^1\) remainder.
The fixed smooth bundle maps \(H,\Pi\) are bounded on each
\(H^m\), and \(\|d\phi\|_{H^m}\le C_m\|\phi\|_{H^{m+1}}\).
Consequently
\[
 \|\phi\|_{H^{m+1}}+\|u\|_{H^m}+\|a_{\rm sl}\|_{H^m}
       \le C_m\|a\|_{H^m},\qquad m\ge0.                             \tag{11}
\]
For each such \(m\), the range on \(H^m\) is the intersection
of \(\mathcal X\) with \(H^m\), and the kernel is the sum
\(d(H^{m+1}(E))+S(H^m(TS^4))\), by (7) and (11).
The same identities with smooth fields hold by regularity.

## Derivative count for the finite horizontal action

Use the active pullback convention of E48. Let \(Y\) be the
\(A_0\)-horizontal lift of a smooth base field \(X\) to the
principal frame bundle, and \(\Psi_t\) its flow. In a local
trivialization with base diffeomorphism \(f_t\) and bundle
rotation \(h_t(x)\), the tensor \(a\) transforms as
\[
  (\Psi_t^*a)_i(x)=\operatorname{Ad}_{h_t(x)^{-1}}
       \big(a_j(f_t(x))\,\partial_i f_t^j(x)\big).                 \tag{12}
\]
The full connection form also has the local inhomogeneous
term \(h_t^{-1}dh_t\). Cartan's formula on the principal
bundle gives for a connection
\(\mathcal L_Y A=\iota_YF_A+d_A(\iota_Y A)\).
Here \(\iota_Y A_0=0\), so at \(A_0\) the horizontal
derivative is exactly \(S X\). The vertical generator with
\(A_0\)-component \(\phi\) gives \(d\phi\). These are the
orbit directions in (8). [E48, automorphisms and active pullback][e48].

For \(A=A_0+a\) the same fixed lift has
\(\iota_Y A=a(X)\). With
\(F_A=F_0+d a+\tfrac12[a\wedge a]\), the term
\(\iota_X[a\wedge a]/2=[a(X),a]\) cancels the bracket
\([a,a(X)]\) from \(d_A(a(X))\). Therefore the exact derivative
of the smooth pullback at \(t=0\) is
\[
 \left.\frac{d}{dt}\Psi_t^*(A_0+a)\right|_{0}
   =S X+\iota_X d a+d(a(X)).
                                                                         \tag{13}
\]
If \(D_0\) denotes the reference derivative including
the base slots, the last two terms have components
\[
 \big(\iota_X d a+d(a(X))\big)_i
    =X^j(D_0)_j a_i+a_j\nabla^{g_0}_i X^j.                          \tag{14}
\]
Equation (12) contains both derivatives through composition
and the derivative of the base map. At the reference,
(13) reduces to the zeroth-order horizontal direction. Away
from it, (14) contains a derivative of the field being moved
as well as a derivative of the horizontal parameter.
Even for fixed smooth \(X\) nonzero on a chart, its
first-order transport term is unbounded \(H^m\to H^m\).
For example choose \(X=\partial_1\) on the support of a
nonzero smooth cutoff, and a localized section with
components \(n^{-m}\chi(x)\sin(nx^1)\) times one fixed
nonzero form component. The \(H^m\) norms stay bounded
while the order-\(m\) derivative of
\(X^j(D_0)_j a_i\) has an \(L^2\) term of size \(n\).
Cutoff and connection terms and the term \(a_j\nabla_i X^j\)
are bounded at that order.

Estimate (11) gives \(\phi\) in \(H^{m+1}\) and \(u\) in
\(H^m\). Equations (12)–(14) identify a derivative
requirement that a low-order nonlinear argument would
have to handle. Nonlinear slice existence remains open
in the setting of this packet.

[req]: ../research-progress/handoffs/SP4-CME-E71_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E71_RETURN_v1.md
[b44]: ../brainstorm/notes/B44_LINEAR_SLICE_AND_REGULARITY_20261122.md
[e47]: 47_ROUND_STABLE_LINEAR_20261122.md
[e48]: 48_FIXED_STABILITY_GAUGE_20261122.md
[e51]: ../reviews/E51_STABILITY_INPUTS_AUDIT_20261122.md
