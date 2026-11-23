# SP4-CME-E101 — Audit of the finite internal gauge and static gain

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored the inherited
E89 endpoint audit and E66 fixed multiplier and Lorentz estimate.
I did not author E98, E99 or E88. The frozen input digests in the
[request][req] matched before use. I checked the two actual
operators and the combination below. No primary source was
newly inspected or imported. [B57][b57] · [Return][ret].

**Disposition.** Both bounded results pass. The finite internal
gauge has a justified smooth representative for smooth data,
with quantitative bounds from small \(L^{4,1}\) input.
Separately a supplied exact Coulomb representative has
the stated \(W^{1,8}\) and \(C^{0,1/2}\) gain from its low
norm and its curvature value. They combine as requested under
connection and curvature sup smallness. No mathematical
correction was found.

## E98 check — Finite Lorentz internal gauge

### Ordinary inverse and common endpoints

Use the fixed smooth closed oriented native round \(S^4\),
the positive perfect chiral \(\mathrm{SO}(3)\) reference
\(A_0\), and the fixed metric and bundle derivative \(D\).
On adjoint zero-forms \(K=d_0^*d_0\) has no kernel.
A weak nullvector has \(d_0\phi=0\) by testing against
itself. In a frame, \(\partial_i\phi=-\gamma_i\phi\)
bootstraps the weak field to smoothness using fixed smooth
coefficients. Then \(d_0^2\phi=[F_0,\phi]=0\).
Pointwise the perfect curvature spans the internal fiber.
The center of \(\mathfrak{so}(3)\) is zero, so \(\phi=0\).
Compactness \(H^1\hookrightarrow L^2\) gives coercivity:
a unit \(H^1\) sequence with \(d_0\phi\to0\) would limit
strongly in \(L^2\) to the zero parallel section, giving
vanishing \(H^1\) norm as well. Hence
\(L=K^{-1}d_0^*\) is bounded \(L^2\to H^1\)
and \(KLw=d_0^*w\) on all weak tests.
The kernel subtraction used for the other operator in
E88 is absent for this \(K\). [E98 (2)][e98].

The density-weighted local form is
\(P=\mu K=-\partial_i(A^{ij}\partial_j+M^i)+D_1\),
with \(A^{ij}=\mu g_0^{ij}I\),
\(M^i=A^{ij}\gamma_j-\gamma_j^*A^{ji}\), and
\(D_1=\gamma_i^*A^{ij}\gamma_j-\partial_j C^j\),
\(C^j=\gamma_i^*A^{ij}\). This follows from the
\((Dq,D\eta)\) weak form and moving
\(C^j\partial_j q\) into divergence plus value.
The flux and value in the weak equation for \(q=Lw\)
are \(F^i=\mu g_0^{ij}w_j\) and \(G=\gamma_i^*F^i\),
with divergence sign \(-\partial_i F^i\).
For \(v=\chi q\) the first cutoff flux is
\(A^{ij}(\partial_j\chi)q\), and the other is
\((\partial_j\chi)A^{ji}q\) in component \(i\).
The second flux comes from rewriting
\(-(\partial_i\chi)A^{ij}\partial_j q\), and its
value term is \(+\partial_j((\partial_i\chi)A^{ij})q\).
The remaining new values are
\((\partial_i\chi)F^i-(\partial_i\chi)M^iq\)
in addition to \(\chi G\). Thus all cutoffs cost only
the flux value and the solution value in \(L^8\).

For the frozen \(L_*=-A_*^{ij}\partial_i\partial_j\),
the flux for \((I+L_*)v\) is
\(F_\chi^i+(A_*^{ij}-A^{ij})\partial_jv-M^iv\),
and the value is \(G_\chi+(I-D_1)v\).
The gradient's flux multiplier has
\(\xi_i\xi_j(I+A_*(\xi))^{-1}\), with positive
numerator from \(i\xi_i(-i\xi_j)\).
The scalar principal symbol here is
\(A_*(\xi)=\mu(x_*)|\xi|_{g_0(x_*)}^2I\).
The scaled annular flux symbols and their fixed-order
derivatives are uniformly bounded, since the denominator
\(2^{-2\ell}I+A_*(\eta)\) is uniformly positive on the
unit annulus. After scaling and summing, the kernel and
its first derivative cost \(|x|^{-4}\) and \(|x|^{-5}\)
off zero. Plancherel gives the \(L^2\) action.
The vector dyadic cancellation test applies to these
kernels and their adjoints: off each enlarged cube
the kernel difference has \(L^1\) norm bounded by
\(C\ell(Q)\int_{c\ell(Q)}^\infty r^{-2}\,dr\), and
the good part is handled in \(L^2\).
The resulting weak \((1,1)\) and strong \(L^2\) bounds
give adjoint \(L^{8/7}\) by distribution integration
and original \(L^8\) by duality.
The value gradient symbol \(i\xi_i(I+A_*(\xi))^{-1}\)
has a smooth low block and summable high \(L^1\)
kernel costs \(C2^{-\ell}\). These are the needed
multipliers for this ordinary Laplacian.
[E98, divergence inverse][e98] · [E88][e88] · [E89][e89].

Absorb the fixed coefficient oscillation multiplying
\(\partial v\) on each supported patch before summing.
The resulting estimate is
\(\|Dq\|_8\le C(\|w\|_8+\|q\|_8)\).
The translation part of the patch mollifier estimate
costs \(Ch\|\partial v\|_8\), and the convolution part
costs \(Ch^{-3/2}\|v\|_2\) by Young at kernel exponent
\(8/5\). Sum and first absorb the \(Ch\|q\|_8\) cutoff
and frame error. Choosing \(h\) then yields
\(\|q\|_8\le\varepsilon\|Dq\|_8+C_\varepsilon\|q\|_2\).
Absorb in the gradient estimate and apply the weak
\(L^2\to H^1\) bound and finite volume. Thus \(Lw\)
has the asserted \(W^{1,8}\) estimate on smooth
inputs. \(L^8\) approximation also converges in
\(L^2\), so the two extensions agree as distributions.

For a vector layer of measure \(m\), its endpoint
norms are \(m^{1/2}\) and \(m^{1/8}\).
For the value and the derivative output,
\(\|h\|_{4,1}\le12\|h\|_2^{1/3}\|h\|_8^{2/3}\)
bounds the layer by \(Cm^{1/4}\).
The endpoint layer maps are continuous in the height
away from the at most countably many positive-measure
level sets. This gives strong measurability also
in the interpolated norm. Integrate using the
complete Lorentz norm and its layer convention.
Finite volume gives input convergence in \(L^2\),
so the Bochner output agrees with the common weak
inverse, including its derivative component. This
proves \(L:L^{4,1}\to X=W^{1,(4,1)}\) for the
ordinary kernel-free operator, with fixed constants.
[E98 (3)][e98] · [E66 (6)–(9)][e66] · [E89][e89].

### Exponential contraction and action sign

The endpoint \(X\) embeds in \(C^0\) by the inherited
ray estimate and smooth graph density, valid for
finite-rank bundles in fixed frames. Completeness
follows from Lorentz completeness and distributional
closedness of the weak derivative.
Also \(\|w\|_4\le\|w\|_{4,1}/4\) by Minkowski on its
layers, so \(X\subset W^{1,4}\subset H^1\).
In \(\operatorname{End}(V)\) the Leibniz bounds
\[
 \|pq\|_{4,1}\le\|p\|_\infty\|q\|_{4,1},\qquad
 \|D(pq)\|_{4,1}\le
   \|Dp\|_{4,1}\|q\|_\infty+\|p\|_\infty\|Dq\|_{4,1}
\]
hold up to the fixed matrix norm factors.
Smooth approximation in \(X\), hence uniformly,
validates the weak product identity.
This gives a complete unital algebra with bounded
multiplication. One can approximate skew fields by
skew smooth fields using the fixed antisymmetric
projection. The exponential series converges in
the algebra and is pointwise orthogonal of
determinant one for skew \(\phi\).
The smooth identity
\[
  (D e^\phi)e^{-\phi}
   =\int_0^1 e^{s\phi}(D\phi)e^{-s\phi}\,ds
\]
follows by differentiating the series and integrating
the two-sided exponential powers. The products
converge in the derivative Lorentz norm under
smooth approximation, so the identity also holds
on \(X\).
[E98, algebra and exact exponential][e98] ·
[E88, continuous endpoint][e88] · [E89][e89].

Locally \(d_0u=du+A_0u-uA_0\). Thus
\(uau^{-1}-(d_0u)u^{-1}\) equals
\(u(A_0+a)u^{-1}-du\,u^{-1}-A_0\), as required
by the stipulated active internal gauge action.
With \(E_\phi=\operatorname{Ad}(e^\phi)\), the
remainder after \(a-d_0\phi\) is exactly
\((E_\phi-I)a-\int_0^1(E_{s\phi}-I)d_0\phi\,ds\).
On the fixed small \(C^0\) chart,
\(\|E_{s\phi}-I\|_\infty\le C\|\phi\|_\infty\)
and \(\|E_{s\phi}-E_{s\psi}\|_\infty
\le C\|\phi-\psi\|_\infty\), uniformly in \(s\).
For the difference of integral terms subtract on
the coefficient and on the differentiated factor
separately. This yields E98 (7) with Lipschitz
factor \(C(\|a\|_{4,1}+\|\phi\|_X+\|\psi\|_X)\).

The sign of the contraction is
\(\phi=L(a+N(\phi,a))\), since
\(d_0^*b=d_0^*(a+N)-K\phi\).
With \(R=2C_L\|a\|_{4,1}\), decreasing just the
reference bound on \(\|a\|_{4,1}\) puts the whole
ball in the small exponential chart, makes the
image stay in the ball, and makes the Lipschitz
constant at most \(1/2\). The zero-datum case
is immediate. The contraction, the derivative
identity and the endpoint embedding give
\(\|\phi\|_X,\|u-I\|_{C^0},\|d_0u\|_{4,1},\|b\|_{4,1}
\le C\|a\|_{4,1}\).
The weak equation of \(L\) gives \(d_0^*b=0\)
distributionally. No small curvature or input
derivative is used in these bounds.
[E98 (6)–(8)][e98].

### Product test and smoothness

On the endomorphism bundle \(D\) preserves transpose,
so the Coulomb test originally imposed on skew
sections also pairs to zero with any endomorphism
test. The pairings can be taken in the Hilbert–Schmidt
norm since its restriction to the adjoint bundle
is a fixed constant multiple of the chosen pairing.
By density and the finite-volume \(L^4\) bounds,
this extends to \(W^{1,4}\) tests. For a smooth
endomorphism test \(v\), \(vu^\top\) is such a test.
The product rule and cyclic trace give
\[
  0=\int\langle b_i,D^i(vu^\top)\rangle
   =\int\big(\langle b_i u,D^i v\rangle
                    +\langle b_iD^iu,v\rangle\big).
\]
The first term defines minus the divergence of
\(b_i u\). Both products exist in the displayed
Lebesgue spaces. Therefore
\(D^i(b_i u)=b_iD^iu\) distributionally.
This proves the multiplication identity directly
by testing. Inserting the exact gauge identity
\(b_i u=u a_i-D_i u\) yields
\[
 \Delta_0 u=b_iD^iu-(D^iu)a_i-uD^ia_i,\qquad
 \Delta_0=D^*D .
\]
Thus with \(w=u-I\), \(DI=0\), the sign and
terms of (9) follow:
\((I+\Delta_0)w=\mathcal B(Dw)+f\), with
\(\mathcal B(Dz)=b_iD^iz-(D^iz)a_i\) and
\(f=w-uD^ia_i\).
The coefficient norm \(\|\mathcal B\|_4\)
is bounded by \(C(\|b\|_4+\|a\|_4)\le C\|a\|_{4,1}\)
already at the weak stage of the proof.
For smooth \(a\), \(f\) is bounded from \(u,w\in C^0\).
That bound can depend on \(Da\).
[E98 (9) and product testing][e98].

The fixed endomorphism mass resolvent
\(I+\Delta_0\) is coercive on \(H^1\).
The claimed \(H^2\) estimate for \(L^2\) forcing
follows by the stated weak difference-quotient test
\(-\delta_{-h}(\chi^2\delta_h q)\). Translation of
the leading coefficient preserves the fixed local
positivity, its quotient multiplies the known
first derivative, and the \(L^2\) forcing is tested
against the original test with norm bounded by
\(C(\|\chi\delta_h q\|_{H^1}+\|q\|_{H^1})\).
Cutoff terms cost the same lower norm with a
gradient factor. Local absorption and a weak limit
give \(H^2\).
For \(p=3,6\), freezing the scalar top symbol yields
the fixed second-derivative multiplier
\(-\xi_i\xi_j/(g_0^{k\ell}(x_*)\xi_k\xi_\ell)\).
The same annular weak–strong argument at dual
\(p/(p-1)\) supplies the \(L^p\) bound. Freezing
and patching absorb the leading oscillation.
Cutoffs and lower coefficients cost first and
zeroth orders. The small-scale mollifier
interpolations absorb the first derivative
against the second, and the value against the
first with an \(L^2\) remainder. In the latter,
the \(L^2\to L^p\) kernel exponent is
\(2p/(p+2)\). The weak mass inverse bounds the
\(L^2\) remainder by the \(L^2\) forcing norm,
which is bounded by its \(L^p\) norm on the
compact manifold. Smooth approximation in
\(L^p\) and \(L^2\) gives the same weak solution
in \(W^{2,p}\). Commuting derivatives in nested
cutoffs gives the fixed higher \(W^{m+2,6}\)
estimates, with lower field derivatives paid
for by induction. Thus E98 (4) applies to the
three nonsmooth forcing stages, as well as to
the later iteration.
[E98 (4) and fixed local regularity][e98] ·
[E66, non-divergence method][e66].

The embeddings entering the bootstrap have the
correct exponents. The local \(W^{1,1}\to L^{4/3}\)
inequality comes from the fundamental theorem in
each of the four coordinate directions, then
iterated Hölder for the product of the four
three-coordinate majorants. Applying it to
\(|q|^{3p/(4-p)}\) and using Hölder against
\(\|\partial q\|_p\) gives the exponent
\(4p/(4-p)\). At \(p=2,3\) this is \(4,12\),
respectively. Apply on supported chart pieces to
the field and its first derivative to get
\(H^2\subset W^{1,4}\) and
\(W^{2,3}\subset W^{1,12}\).
For \(W^{1,6}\subset C^0\), the local ray
kernel \(|x-y|^{-3}\) is in \(L^{6/5}\)
on bounded patches, since \(3(6/5)<4\).
Hölder and smooth density yield the continuous
embedding with the usual cutoff value costs.
[E98 (5)][e98] · [E88, ray estimate][e88].

Initially \(Dw\in L^4\). Thus
\(\mathcal B(Dw)\in L^2\) and \(f\in L^2\), and
the fixed inverse and weak uniqueness yield
\(w\in H^2\). Hold \(\mathcal B,f\) obtained
from this solution fixed. By Hölder and the
fixed embeddings, the linear perturbation
\((I+\Delta_0)^{-1}\mathcal B D\) is bounded on
\(W^{2,3}\) and on \(H^2\) with operator norms
at most \(C\|\mathcal B\|_4\): the pairs of
gradient and coefficient exponents are
\((12,4)\) for \(L^3\) and \((4,4)\)
for \(L^2\). One further fixed reduction of
\(\|a\|_{4,1}\) makes both norms at most \(1/2\).
The \(W^{2,3}\) Neumann solution for \(f\in L^3\)
belongs to \(H^2\) and solves the same weak
equation there. Uniqueness of the \(H^2\)
perturbation equation identifies it with \(w\).
This proves \(Dw\in L^{12}\).
The formula for \(b\) and bounded \(u,u^{-1}\)
then give \(b\in L^{12}\); the smooth \(a\)
is in \(L^{12}\) too. Thus
\(\mathcal B(Dw)\in L^6\) by \(12\) with \(12\),
and the fixed inverse with weak uniqueness
gives \(w\in W^{2,6}\).

Now \(u^{-1}=u^\top\), and the right side, after
inserting \(b=u a u^\top-(Du)u^\top\), uses
polynomial products in \(u,Du,a,Da\).
For integers \(m\ge1\), \(W^{m,6}\) is an
algebra: factors with fewer than \(m\)
derivatives are bounded by \(W^{1,6}\subset C^0\)
applied to those derivatives, and only one
factor can take all \(m\) derivatives in a
Leibniz term. Starting from \(W^{2,6}\), the
right side belongs to \(W^{1,6}\), then higher
orders follow from the fixed resolvent estimates.
This gives smooth \(u\), and hence smooth \(b\).
The small \(C^0\) exponential chart ensures its
smooth logarithm is the original \(\phi\).
Only low-norm bounds on \(\mathcal B\) entered
the additional smallness requirement. Neither
\(f\) nor its derivatives must be small. Their
norms can affect the qualitative bootstrap's
higher constants. This checks that the finite
gauge is smooth without an extra derivative
restriction on the low threshold.
[E98, regularity bootstrap][e98].

## E99 check — Static gain for a supplied Coulomb representative

### Fixed overdetermined estimate

For \(\mathcal D=d_0\oplus d_0^*\) on adjoint
one-forms, in the \(i\xi\) convention its two
symbols are \(i\xi\wedge\) and
\(-i\iota_{\xi^\sharp}\).
Split a one-form into its component along
\(\xi\) and the perpendicular component.
Their squared contributions sum to
\(|\xi|_{g_0}^2|v|^2\). Thus
\(\mathcal P=I+\mathcal D^*\mathcal D\)
has the scalar top symbol of \(I+D_0^*D_0\).
The lower difference is a fixed operator of
order at most one. Its quadratic form is
bounded by
\(C\|D_0v\|_2\|v\|_2+C\|v\|_2^2\).
Absorb half of the first-derivative energy to
obtain the stated \(H^1\) form comparison.
The \(I\) term makes the weak form coercive
regardless of any kernel of \(\mathcal D\).
The proof conserves the full \(\|v\|_2\) term
and requires no projection or kernel vanishing.

For \(q=\mathcal Dv\), \(f=v\), the identity
\(\mathcal Pv=\mathcal D^*q+f\) uses no inverse
on \(q\). In a chart with \(\mu\,dx=dV_{g_0}\)
the density-weighted top coefficients are
\(A^{ij}=\mu g_0^{ij}I\). The remaining fixed
coefficients can be written in the form
\[
 Pv=-\partial_i(A^{ij}\partial_j v+M^iv)+Zv ,
 \qquad P=\mu\mathcal P.
\]
For \(\mathcal D=L^i\partial_i+L^0\),
the forcing has divergence flux
\(F^i=\mu(L^i)^*q\) and value
\(G=\mu(L^0)^*q+\mu f\), by integration by
parts with the fixed density.
Multiplying by a fixed cutoff \(\chi\) gives
two additional principal terms:
\(-\partial_i(A^{ij}(\partial_j\chi)v)\) and
\(-(\partial_i\chi)A^{ij}\partial_jv\).
The latter is rewritten as a flux
\(-\partial_j((\partial_i\chi)A^{ij}v)\)
and a value \(+\partial_j((\partial_i\chi)A^{ij})v\).
The lower cutoff term \(-(\partial_i\chi)M^iv\)
and the value \((\partial_i\chi)F^i\)
are retained. Thus the localized flux and value
cost \(q,f,v\) in \(L^p\). Freezing the leading
array yields (4) of E99 with the difference
\(A_*-A\) multiplying only the supported
gradient inside the divergence. This is the
right sign and derivative allocation.
[E99 (2)–(4)][e99] · [E88][e88] · [E89][e89].

The \(L^p\) estimate uses the frozen scalar
\(a_*(\xi)=\mu(x_*)|\xi|_{g_0(x_*)}^2 I\).
The \(L^2\) bounded flux matrix
\(\xi_i\xi_j(I+a_*)^{-1}\) has uniform annular
derivative bounds from the fixed symbol margin.
The summed high-frequency kernel estimates
are \(C|x|^{-4}\) and \(C|x|^{-5}\) for
the kernel and its first derivative, and the
smooth low kernel also has these bounds off
zero. The vector weak \((1,1)\) cancellation
test and distribution integration apply to the
adjoint. The exponents \(3/2,6/5,8/7\)
are precisely the duals of \(3,6,8\).
The separate value gradient multiplier
\(i\xi_i(I+a_*)^{-1}\) has summable \(L^1\)
high-block costs and a smooth low block.
Thus both forcings have the asserted
\(L^p\) gradient bounds. One finite fixed
atlas suffices to absorb the leading oscillation
for all three exponents.

After summing, the only unwanted \(L^p\)
remainder is the value norm of \(v\).
For each supported local field \(z\), the
translation estimate is \(Ch\|\partial z\|_p\),
and Young gives the mollified value bound
\(Ch^{-2+4/p}\|z\|_2\) with kernel exponent
\(2p/(p+2)\). Indeed
\(4(1-(1/2+1/p))=2-4/p\).
Summing absorbs \(Ch\|v\|_p\) from cutoff
and frame derivatives first, giving
\(\|v\|_p\le\varepsilon\|D_0v\|_p+C_\varepsilon\|v\|_2\).
Set \(q=\mathcal Dv\) and \(f=v\).
Then both copies of the value cost are absorbed
in the global derivative inequality using the
chosen \(\varepsilon\), retaining the \(L^2\) term.
This yields
\(\|v\|_{W^{1,p}}\le C_p(\|\mathcal Dv\|_p+\|v\|_2)\)
with reference-only constants for \(p=3,6,8\).
No curvature derivative appears in this estimate.
[E99, fixed overdetermined estimate][e99] ·
[E66, multiplier method][e66].

### Embeddings and nonlinear static gain

For compactly supported Euclidean \(w\), the
one-direction fundamental theorem gives
\(|w(x)|\le F_i(\widehat x_i)\) for each \(i\),
where \(F_i=\int|\partial_i w|\,dx^i\).
Thus \(|w|^{4/3}\le\prod_i F_i^{1/3}\).
Integrating one coordinate first uses Hölder
with exponent three on the three factors
depending on it. A second Hölder split with
exponents \(3,3/2\) separates the remaining
factor and leaves the three-dimensional product
inequality. Repeating this leads to
\(\int\prod_i F_i^{1/3}\le\prod_i(\int F_i)^{1/3}\).
Taking the \(3/4\) power and bounding the
geometric mean gives the required \(W^{1,1}\)
bound. Apply it to \(|v|^9\).
The left side is \(\|v\|_{12}^9\),
and the derivative is bounded by
\(C\int|v|^8|\partial v|
\le C\|v\|_{12}^8\|\partial v\|_3\).
Fixed localization then gives
\(\|v\|_{12}\le S_3\|v\|_{W^{1,3}}\).
This uses supported coordinate pieces, so
their frame and cutoff derivatives cost the
corresponding value terms.
[E99 (5)][e99].

For \(p>4\), average the integral of
\(|\partial v|\) along radial segments from \(x\)
over \(B_r(x)\). Interchanging polar radii gives
\(\fint_{B_r(x)}|v(x)-v(y)|\,dy
\le C\int_{B_r(x)}|x-y|^{-3}|\partial v(y)|\,dy\).
Hölder with \(p'=p/(p-1)\) gives
\(Cr^{4/p'-3}\|\partial v\|_p\),
since \(3p'<4\).
For two points at distance \(r\), compare their
values to the mean over \(B_{2r}(x)\);
this same ball is in \(B_{3r}(y)\) and the
volume ratio is bounded. Hence the difference
has the factor \(r^{1-4/p}\).
A fixed-radius mean and the \(L^p\) norm also
give the uniform bound. Thus \(p=8\) yields
the \(1/2\) Hölder power and \(p=6\) suffices
for \(C^0\). Fixed coordinate distances,
cutoffs and frame coefficients give the
fixed bundle estimates. A smooth transition
or fixed reference parallel transport
changes the local comparison by at most
\(C d(x,y)\|v\|_\infty\); this is controlled
at the asserted Hölder power on small
patches. Long-distance pairs are controlled
by the sup norm. [E99 (6)][e99].

Apply the fixed estimate to the smooth exact
Coulomb data with
\(\mathcal Db=(\beta-\tfrac12[b\wedge b],0)\).
Put \(\eta=\|b\|_4+\|\beta\|_\infty\) and
\(V=\operatorname{vol}(g_0)\).
At \(p=3\), the bracket uses
\(1/3=1/4+1/12\), and
\(\|b\|_2\le V^{1/4}\|b\|_4\).
Hence the bracket cost in the fixed estimate
is at most
\(C_3 C_{\rm br}S_3\eta\|b\|_{W^{1,3}}\).
Choose \(C_3 C_{\rm br}S_3\eta\le1/2\).
This gives the \(W^{1,3}\) and \(L^{12}\) bounds
\(C\eta\).
At \(p=6\) the bracket costs \(C\|b\|_{12}^2\);
the reference lower norm and curvature value
cost \(C\eta\).
Thus \(\|b\|_{W^{1,6}}\le C(\eta+\eta^2)\)
and with \(\eta\le1\), \(\|b\|_\infty\le C\eta\).
At \(p=8\) use
\(\|[b\wedge b]\|_8\le C\|b\|_\infty\|b\|_8\)
and \(\|b\|_8\le V^{1/24}\|b\|_{12}\).
The resulting bound is again \(C(\eta+\eta^2)\).
The fixed Morrey endpoint gives
\(\|b\|_{C^{0,1/2}}+\|b\|_{W^{1,8}}\le C\eta\).
The only datum restrictions are the first
absorption and \(\eta\le1\).
No derivatives of \(\beta\) or higher-order
norms of \(b\) enter. This remains an estimate
for a supplied exact Coulomb representative.
[E99 (1) and finite bootstrap][e99].

## Combined consequence and limits

For smooth \(a\) and
\(\beta=F_{A_0+a}-F_0\), assume
\(\epsilon=\|a\|_\infty+\|\beta\|_\infty\)
small in the fixed reference norms.
Finite volume gives
\(\|a\|_{4,1}\le4V^{1/4}\|a\|_\infty\).
Thus E98 supplies the smooth internal gauge \(u\)
and exact Coulomb \(b\), with
\(\|u-I\|_\infty+\|b\|_{4,1}\le C\epsilon\).
The latter controls \(\|b\|_4\) by the layer
inequality. The chosen action transforms curvature
by \(F_{A_0+b}=uF_{A_0+a}u^{-1}\), so
\[
 \beta_b = u\beta u^{-1}+(uF_0u^{-1}-F_0).
\]
The adjoint action of the orthogonal \(u\) is
bounded uniformly in the fixed internal pairing.
The second term is bounded pointwise by
\(C|F_0||u-I|\), by inserting and subtracting
\(F_0u^{-1}\) and using the bounded inverse.
Hence \(\|\beta_b\|_\infty\le C\epsilon\).
By one fixed reduction of \(\epsilon\), the low
norm \(\|b\|_4+\|\beta_b\|_\infty\) is in the
E99 range. This gives
\[
 \|b\|_{W^{1,8}}+\|b\|_{C^{0,1/2}}\le C\epsilon .
\]
The internal action leaves the reconstructed
metric unchanged: curvature conjugation preserves
the plane and the wedge-Gram volume at the same
base point.
[E98 (1)][e98] · [E99 (1)][e99] · [B57][b57].

Multiplying the gauge equation on the right by
\(u\) gives \(d_0u=u a-bu\).
The fixed \(L^8\) bound of \(a\) follows from its
sup norm and finite volume; that of \(b\) has
just been proved. Thus \(\|d_0u\|_8\le C\epsilon\).
Together with \(D I=0\) and
\(\|u-I\|_\infty\le C\epsilon\) this yields
\(\|u-I\|_{W^{1,8}}\le C\epsilon\).
The same identity in \(C^0\) gives
\(\|d_0u\|_\infty\le C(\|a\|_\infty+\|b\|_\infty)
\le C\epsilon\).
The fixed coordinate \(C^1\) comparison only
adds connection coefficients times \(u-I\).
Consequently \(\|u-I\|_{C^1}\le C\epsilon\).
There is no uniform Hölder estimate on this
first derivative from the argument, since the
term \(u a\) still has only the uniform \(C^0\)
control on \(a\). The quantitative conclusion
is vertical Coulomb placement. It provides no
\(S_0^*b=0\) condition, full slice, intrinsic-budget
extension, or arbitrary-sphere initialization.
Higher regularity for each given smooth input
remains consistent with these low-norm constants.

[req]: ../research-progress/handoffs/SP4-CME-E101_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E101_RETURN_v1.md
[b57]: ../brainstorm/notes/B57_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
[e98]: ../notes/98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
[e99]: ../notes/99_VALUE_SMALL_COULOMB_ESTIMATE_20261122.md
[e88]: ../notes/88_LORENTZ_ORBIT_SOLVER_20261122.md
[e89]: E89_LORENTZ_ORBIT_AUDIT_20261122.md
[e66]: ../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
