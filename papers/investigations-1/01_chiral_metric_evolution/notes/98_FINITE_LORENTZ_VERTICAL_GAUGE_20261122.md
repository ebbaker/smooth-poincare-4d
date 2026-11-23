# SP4-CME-E98 — Finite internal Coulomb gauge from small Lorentz values

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E88 and did
not author E89, E66 or E93. The four frozen digests matched the
[request][req]. This is the finite internal part of [B57][b57].
No new primary source was inspected or imported. E93 supplies
context, with no use of Feehan's theorem. [E93][e93]. [Return][ret].

## Setting and result

Work on the fixed compact closed oriented smooth round \(S^4\)
with positive perfect chiral \(SO(3)\) connection \(A_0\) and its
native metric \(g_0\). Let \(V\) be the associated oriented
Euclidean rank-three bundle and write
\(\mathfrak g_P=\mathfrak{so}(V)\) for the adjoint bundle.
Use the fixed positive negative-Killing pairing on the adjoint
bundle, and the fixed equivalent matrix norm when working in
\(\operatorname{End}(V)\). The same symbol \(D\) denotes the
fixed connection derivative induced by \(A_0\) and the
Levi-Civita derivative on base slots. Its exterior derivative
on adjoint forms is \(d_0\). Every norm uses fixed base volume
and pairings. Let
\(X=W^{1,(4,1)}\) with norm \(\|q\|_{4,1}+\|Dq\|_{4,1}\).
Use the E88 convention
\(\|w\|_{4,1}=4\int_0^\infty \nu_0(\{|w|>v\})^{1/4}\,dv\),
where \(\nu_0=dV_{g_0}\).

There are reference constants \(\eta_*,C>0\) such that every
smooth adjoint one-form \(a\) with \(\|a\|_{4,1}\le\eta_*\)
admits a smooth skew-adjoint section \(\phi\) and a smooth
gauge \(u=\exp\phi\in\Gamma SO(V)\) over the identity with
\[
 b=u a u^{-1}-(d_0 u)u^{-1},\qquad d_0^*b=0,\qquad
 \|\phi\|_X+\|u-I\|_{C^0}+\|d_0u\|_{4,1}+\|b\|_{4,1}
       \le C\|a\|_{4,1}.                                             \tag{1}
\]
Here \(d_0u=Du\) on endomorphism-valued zero-forms. In a local
frame \(u\) acts by \(A\mapsto uAu^{-1}-du\,u^{-1}\).
Subtracting \(A_0\) gives the displayed \(b\) because
\(d_0u=du+[A_0,u]\). The constants in (1) use no curvature
hypothesis or higher derivative bound on \(a\).

## Separate divergence inverse for the ordinary Laplacian

Let \(K=d_0^*d_0\) on adjoint sections. A weak \(H^1\)
nullvector has \(d_0\phi=0\) by testing against itself.
It is smooth, either by the fixed elliptic regularity
below or by commuting coordinate derivatives in the weak
first-order parallel equation. Then
\([F_0,\phi]=d_0^2\phi=0\). At each point the values of
\(F_0(X,Y)\) span the adjoint fiber, because the perfect
curvature identification \(E\to\Lambda^+\) is an isomorphism.
The center of \(\mathfrak{so}(3)\) is zero, so \(\phi=0\).
Compactness of \(H^1\hookrightarrow L^2\) gives
\(\|\phi\|_{H^1}\le C\|d_0\phi\|_2\): otherwise a
unit-\(H^1\) sequence with derivative tending to zero has
a parallel \(L^2\) limit by weak \(H^1\) and strong \(L^2\)
convergence. That limit is zero, contradicting the norm
normalization. The weak inverse therefore gives
\[
 L=K^{-1}d_0^*,\qquad
 \|Lw\|_{H^1}\le C\|w\|_2,\qquad
 KLw=d_0^*w\ \text{in }H^{-1}.                                        \tag{2}
\]
There is no finite-rank subtraction for this ordinary \(K\).

The fixed \(L^8\) divergence estimate follows by applying
the E88/E89 local argument to its actual symbol and lower
blocks. In an orthonormal internal frame write
\(D=\partial+\gamma\) on sections and
\(dV_{g_0}=\mu\,dx\). With \(P=\mu K\) the weak form gives
\(A^{ij}=\mu g_0^{ij}I\), \(B^i=A^{ij}\gamma_j\),
\(C^j=\gamma_i^*A^{ij}\), \(D_1=\gamma_i^*A^{ij}\gamma_j
-\partial_j C^j\). Thus
\[
 Pq=-\partial_i(A^{ij}\partial_j q+M^i q)+D_1q,\qquad
 M^i=B^i-C^i .
\]
The weak equation for \(q=Lw\) is locally
\(Pq=-\partial_i F^i+G\), with
\(F^i=\mu g_0^{ij}w_j\) and \(G=\gamma_i^*F^i\).
For \(v=\chi q\) supported inside the chart, the
localized flux and value are exactly
\[
 \begin{split}
 F_\chi^i&=\chi F^i+A^{ij}(\partial_j\chi)q
                     +(\partial_j\chi)A^{ji}q,\\
 G_\chi&=\chi G+(\partial_i\chi) F^i
        +\partial_j((\partial_i\chi)A^{ij})q
        -(\partial_i\chi)M^i q .
 \end{split}
\]
In particular \(Pv=-\partial_i F_\chi^i+G_\chi\) and
both inputs cost only \(C(\|w\|_8+\|q\|_8)\) on the
patch. The second cutoff flux comes from moving
\(-(\partial_i\chi)A^{ij}\partial_j q\) into divergence
form. Freeze \(A_*^{ij}=A^{ij}(x_*)\) and
\(L_*=-A_*^{ij}\partial_i\partial_j\). Then
\[
 (I+L_*)v=-\partial_i\big(F_\chi^i+
              (A_*^{ij}-A^{ij})\partial_jv-M^iv\big)
                         +G_\chi+(I-D_1)v .
\]
The gradient multipliers for the flux and value forcing are
\(\xi_i\xi_j(I+A_*(\xi))^{-1}\) and
\(i\xi_i(I+A_*(\xi))^{-1}\), where
\(A_*(\xi)=\mu(x_*)|\xi|_{g_0(x_*)}^2I\).
For the flux multiplier, on each rescaled annulus the symbol
and fixed derivatives are uniformly bounded, since the
denominator is \(2^{-2\ell}I+A_*(\xi)\).
Rescaling the annular kernels gives off-origin bounds
\(C|x|^{-4}\) and \(C|x|^{-5}\) for the kernel and
its first derivative. The \(L^2\) multiplier bound and
the same bounds for the adjoint are uniform. The E88/E89
zero-mean cube decomposition applies to these bounds:
outside enlarged cubes the cancellation integral is
\(C\ell(Q)\int_{c\ell(Q)}^\infty r^{-2}\,dr\le C\).
This gives weak \((1,1)\) for the multiplier and its adjoint.
Splitting data at their modulus threshold and integrating
the weak \((1,1)\) and strong \((2,2)\) distribution bounds
gives strong \(L^{8/7}\) for the adjoint and hence \(L^8\)
for the flux multiplier. The value multiplier has a smooth
low block and \(L^1\) high block kernel norms \(O(2^{-\ell})\),
so it is \(L^8\)-bounded by Young's inequality.
[E88, local divergence estimate][e88]. [E89, cutoff and
multiplier audit][e89].

On sufficiently small fixed patches, absorb the leading
coefficient oscillation multiplying \(\partial v\).
Then sum the fixed cutoffs and compare back to \(D\) to get
\(\|Dq\|_8\le C(\|w\|_8+\|q\|_8)\).
In a supported patch use a normalized mollifier at scale
\(h\) to bound the value by
\(Ch\|\partial v\|_8+Ch^{-3/2}\|v\|_2\) from translations
and Young's inequality. Sum charts and absorb the cutoff
errors to get
\(\|q\|_8\le\varepsilon\|Dq\|_8+C_\varepsilon\|q\|_2\).
Choose \(\varepsilon\) small in the preceding estimate and
use (2), together with finite volume. This proves
\(\|Lw\|_{W^{1,8}}\le C\|w\|_8\), first for smooth inputs
and then for \(L^8\) by density and the common \(H^1\) limit.
For smooth inputs the applicability of the a priori
estimate follows by fixed elliptic regularity, as proved
in the next section.

Both endpoint bounds apply to arbitrary flux layers
\(w_v=(w/|w|)1_{\{|w|>v\}}\). With the endpoint norms
\(\mu_w(v)^{1/2},\mu_w(v)^{1/8}\), the rearrangement
estimate \(\|f\|_{4,1}\le12\|f\|_2^{1/3}\|f\|_8^{2/3}\)
on each of \(Lw_v,DLw_v\) gives the layer bound
\(C\mu_w(v)^{1/4}\). These strongly measurable layers
integrate by Lorentz completeness. The common \(L^2\)
action identifies the integral with the weak inverse
because \(w=\int w_v\,dv\) also in \(L^2\), by finite
volume and the layer norm. We obtain the separate
estimate
\[
                         \|Lw\|_X\le C_L\|w\|_{4,1}.                 \tag{3}
\]
This argument uses the ordinary symbol \(A_*(\xi)\) and
the kernel-free coercivity of \(K\). [E66 (6)–(9)][e66].
[E88/E89, common layers][e89].

## Fixed value resolvents and Sobolev comparisons for regularity

Let \(\Delta_0=D^*D\) on endomorphism-valued zero-forms,
with nonnegative sign. The following fixed reference
estimates will be used:
\[
 \|(I+\Delta_0)^{-1}f\|_{W^{2,p}}\le C_p\|f\|_p
                      \quad (p=2,3,6).                              \tag{4}
\]
The weak inverse exists by coercivity of the form
\(\|q\|_2^2+\|Dq\|_2^2\) and has a bounded \(H^1\)
norm for \(L^2\) forcing. In a fixed chart, difference
quotients of the divergence form, tested with
\(-\delta_{-h}(\chi^2\delta_h q)\), give the interior
\(H^2\) estimate. The translated leading coefficient
is uniformly positive. Terms with a coefficient
quotient and terms with differentiated cutoffs are
controlled by the known \(H^1\) norm times
\(C(\|\chi\delta_h q\|_{H^1}+\|q\|_{H^1})\).
The \(L^2\) right side has the same estimate with
\(\|f\|_2\) in place of the first factor, since
\(\|\delta_{-h}(\chi^2\delta_h q)\|_2\)
is bounded by the second factor. Young's inequality
bounds the localized quotient in \(H^1\) uniformly.
A weak limit gives \(H^2\), and commuting derivatives
with smooth coefficients gives all higher integer
orders for smooth forcing. The same local argument
and (2) give smooth \(Lw\) for smooth \(w\).

For \(p=3,6\) freeze the scalar principal coefficients
in the expanded operator. The frozen second derivative
multiplier has symbol
\(-\xi_i\xi_j/(g_0^{k\ell}(x_*)\xi_k\xi_\ell)\).
The annular kernel and its derivative have the same
size bounds just used. The weak \((1,1)\) and strong
\((2,2)\) bounds for the adjoint, integrated at
\(p/(p-1)\in(1,2)\), imply \(L^p\) boundedness by
duality. Shrinking fixed charts absorbs the leading
oscillation, and the lower coefficients and cutoffs
cost \(C(\|Dq\|_p+\|q\|_p)\). The mollifier bound
\(\|Dq\|_p\le\varepsilon\|D^2q\|_p+C_\varepsilon\|q\|_p\),
proved by subtracting a mollifier from \(Dq\) and
moving the derivative onto the mollifier in the
remaining term, absorbs the first-order cost.
The resulting value remainder can also be absorbed:
the patch translation and convolution estimates give
\(\|q\|_p\le\varepsilon\|Dq\|_p+C_\varepsilon\|q\|_2\).
For the convolution use Young's inequality with
mollifier exponent \(1/(1/2+1/p)\), and absorb the
fixed cutoff errors as in (3). The weak mass inverse
gives \(\|q\|_2\le\|f\|_2\le C\|f\|_p\).
This proves (4) for the smooth weak solutions.
Approximation of \(f\) in \(L^p\) and \(L^2\)
identifies the resulting \(W^{2,p}\) limits with the
weak inverse. Commuting derivatives in nested patch
cutoffs gives the fixed higher estimates
\(\|q\|_{W^{m+2,6}}\le C_m\|f\|_{W^{m,6}}\):
the order-\(m\) commutator has at most \(m+1\)
derivatives of \(q\), already controlled by induction.
Approximation of \(f\) by smooth fields extends the
estimates to those data. [E66, fixed non-divergence
kernel method][e66]. [E89, annular weak-to-strong
bounds][e89].

For the embeddings used with (4), the compactly supported
Euclidean inequality
\(\|q\|_{4/3}\le C\|\partial q\|_1\) follows by bounding
\(|q|\) on each coordinate line by the line integral of
\(|\partial_i q|\). Multiplying the four bounds to
power \(1/3\) and integrating gives the product of the
four \(L^1\) derivative norms to power \(1/3\).
The product-integral inequality follows by Hölder in
the last variable on the three factors depending on
it, then Hölder to split the remaining factor, and
repeating this argument in the lower-dimensional
integral. Applying the inequality to
\(|q|^{3p/(4-p)}\) and using Hölder on its derivative
gives \(W^{1,p}\subset L^{4p/(4-p)}\) for \(p=2,3\)
on the fixed compact manifold after localization.
In particular
\[
 H^2\subset W^{1,4},\qquad W^{2,3}\subset W^{1,12}.
                                                                            \tag{5}
\]
The E88 ray bound with kernel \(|x-y|^{-3}\) and
Hölder, using \(3(6/5)<4\) on bounded patches, gives
\(W^{1,6}\subset C^0\) by smooth density. Those
comparisons include the fixed coordinate, connection
and cutoff terms.

## Exact exponential and the contraction

By E88/E89, \(X\) is complete and embeds in \(C^0\).
Its product estimate follows from the value and derivative
Leibniz bounds and this embedding. These identities hold
distributionally by approximation in \(X\), which
also converges uniformly. The Lorentz layer formula
additionally gives \(\|w\|_4\le\|w\|_{4,1}/4\) by
Minkowski on the layers, so \(X\subset W^{1,4}\subset H^1\)
on the fixed finite-volume base.
[E88, endpoint continuity and density][e88].
[E89, endpoint audit][e89].

Take \(\phi\) skew-adjoint. The exponential is \(SO(V)\)-valued
and belongs to \(X\). The matrix power series converges in
the \(X\) algebra, and smooth approximation in \(X\) gives
the exact derivative identity
\[
 (d_0 e^\phi)e^{-\phi}
      =\int_0^1 e^{s\phi}(d_0\phi)e^{-s\phi}\,ds .
\]
For example this identity for smooth sections follows by
differentiating the exponential series, grouping terms
using the beta-integral coefficients. Both sides
converge in the Lorentz derivative norm under the
\(X\) approximation. Thus with \(E_\phi=\operatorname{Ad}(e^\phi)\)
the exact remainder is
\[
 b=a-d_0\phi+N(\phi,a),\qquad
 N(\phi,a)=(E_\phi-I)a
          -\int_0^1(E_{s\phi}-I)d_0\phi\,ds .                         \tag{6}
\]
On a fixed small \(C^0\) ball, the finite-dimensional
smooth conjugation satisfies
\(|E_{s\phi}-I|\le C|\phi|\) and
\(|E_{s\phi}-E_{s\psi}|\le C|\phi-\psi|\) for \(0\le s\le1\).
Consequently
\[
 \begin{split}
 \|N(\phi,a)\|_{4,1}
   &\le C\|\phi\|_\infty(\|a\|_{4,1}+\|d_0\phi\|_{4,1}),\\
 \|N(\phi,a)-N(\psi,a)\|_{4,1}
   &\le C(\|a\|_{4,1}+\|\phi\|_X+\|\psi\|_X)\|\phi-\psi\|_X .
 \end{split}                                                          \tag{7}
\]
For the second inequality write the integral difference
as a term with \((E_{s\phi}-I)d_0(\phi-\psi)\) plus a
term with \((E_{s\phi}-E_{s\psi})d_0\psi\), then use the
\(C^0\) embedding. The remainder is adjoint-valued.

On the skew-adjoint \(X\) ball of radius \(2C_L\|a\|_{4,1}\)
solve
\[
                         \phi=L(a+N(\phi,a)).                        \tag{8}
\]
The sign follows from \(d_0^*b=d_0^*(a+N)-K\phi\).
For a sufficiently small reference \(\eta_*\), (3) and (7)
map the ball into itself and give contraction constant
at most \(1/2\); the case \(a=0\) gives the zero section.
The derivative identity, the \(C^0\) embedding and
the gauge formula yield all the bounds in (1).
In particular \(\phi\) takes values in a small
exponential chart, chosen with a fixed margin.
Since (8) holds through the weak inverse
and all flux inputs lie in \(L^2\), (6) gives
\(d_0^*b=0\) distributionally. The smoothness
argument below identifies this weak gauge as a smooth
one for every smooth input.

## Smoothness for smooth input

Regard \(u\) as an orthogonal endomorphism section,
so \(u^{-1}=u^\top\). Write \(w=u-I\).
Thus \(w\in W^{1,4}\cap C^0\), \(b\in L^4\), and
\(b_i u=u a_i-D_i u\).
The Coulomb equation pairs to zero with derivatives
of arbitrary endomorphism tests because \(b\) is
skew-adjoint and \(D\) preserves the symmetric and
skew-adjoint subbundles. It extends by density to
\(W^{1,4}\) tests since the base has finite volume.
For a smooth endomorphism test \(v\), use \(vu^\top\)
as test and apply the weak product rule. The
Hilbert–Schmidt pairing gives
\[
 0=\int\langle b_i,D^i(vu^\top)\rangle
   =\int\langle b_i u,D^i v\rangle+
         \langle b_iD^iu,v\rangle .
\]
This proves \(D^i(b_i u)=b_iD^iu\) in distributions
without multiplying an unrestricted distribution by
\(u\). Substituting \(b_i u=u a_i-D_i u\) gives
\[
 \Delta_0 u=b_iD^i u-(D^i u)a_i-uD^ia_i .
\]
Thus, since \(DI=0\),
\[
 (I+\Delta_0)w=\mathcal B(Dw)+f,\qquad
 \mathcal B(Dz)=b_iD^iz-(D^iz)a_i,\qquad
 f=w-uD^ia_i .                                                       \tag{9}
\]
The matrix coefficients of \(\mathcal B\) have
\(L^4\) norm bounded by \(C(\|b\|_4+\|a\|_4)\le
C\|a\|_{4,1}\). For smooth \(a\), \(f\) is bounded,
possibly with a bound depending on \(Da\).
Since \(Dw\in L^4\), the original right side is in
\(L^2\). Estimate (4) and uniqueness of the fixed
weak mass equation show \(w\in H^2\).

Now regard \(\mathcal B,f\) from this solution as fixed
coefficients and forcing. By (4)–(5),
\[
 \big\|(I+\Delta_0)^{-1}\mathcal B(Dz)\big\|_{W^{2,3}}
    \le C\|\mathcal B\|_4\|Dz\|_{12}
    \le C'\|\mathcal B\|_4\|z\|_{W^{2,3}} .
\]
Reduce \(\eta_*\) so the last operator norm is at most
\(1/2\). The same reduction makes the perturbation
operator on \(H^2\) have norm at most \(1/2\), by
\(H^2\subset W^{1,4}\) and (4) at \(p=2\).
Solve (9) by its \(W^{2,3}\) Neumann series with
\(f\in L^3\). That solution is also in \(H^2\)
by finite volume and satisfies the \(H^2\) equation.
Uniqueness there from the small perturbation
identifies it with \(w\). Thus \(Dw\in L^{12}\).
The formula for \(b\) now gives \(b\in L^{12}\)
because \(u,u^{-1}\) are bounded and \(a\) is smooth.
Hence \(\mathcal B(Dw)\in L^6\) and (4) gives
\(w\in W^{2,6}\), again by weak uniqueness for the
fixed mass equation with this right side.

For higher regularity, the right side of (9) is
polynomial in \(u,Du\) and the smooth \(a,Da\), using
\(b=u a u^\top-(Du)u^\top\).
The space \(W^{m,6}\) is an algebra for every integer
\(m\ge1\) by \(W^{1,6}\subset C^0\), the product rule
and boundedness of all derivatives of order below \(m\).
Starting with \(w\in W^{2,6}\), the right side is in
\(W^{1,6}\). The higher fixed estimate following (4)
gives \(W^{3,6}\), and iteration gives all orders.
The corresponding continuous derivative embeddings
give smoothness of \(u\). The smooth local logarithm
on the fixed small exponential chart recovers
\(\phi\) from \(u\), so \(\phi\) and \(b\) are smooth
as well. The constants in the regularity steps can
depend on higher norms of \(a\); the reductions in
the threshold used only \(\|\mathcal B\|_4\) controlled
by (1), not those higher norms.

This proves (1) for a finite internal gauge on the
fixed bundle. Horizontal placement, horizontal
regularity and stabilizer uniqueness are outside
the result.

[req]: ../research-progress/handoffs/SP4-CME-E98_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E98_RETURN_v1.md
[b57]: ../brainstorm/notes/B57_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
[e88]: 88_LORENTZ_ORBIT_SOLVER_20261122.md
[e89]: ../reviews/E89_LORENTZ_ORBIT_AUDIT_20261122.md
[e66]: 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e93]: ../reviews/E93_CRITICAL_GAUGE_SOURCE_AUDIT_20261122.md
