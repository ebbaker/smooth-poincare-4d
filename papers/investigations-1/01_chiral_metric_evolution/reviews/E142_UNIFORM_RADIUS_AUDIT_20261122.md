# E142 — Independent audit of the E138 uniform local radius

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol`
/ `ultra`. Independent runtime and selected lead identifiers were
unavailable. I authored E36, E42 and E140, with E27 upstream. I
did not author E138. This independent check concerns E138's new
uniformity argument, using the [assessed E41/E42 construction][assess]
as inherited work. It does not assess E140.
[Request][req] · [Frozen E138][e138] · [Return][return].

## Disposition and quantifiers

**Pass.** Fix the compact closed oriented real four-manifold and the
smooth \(SO(3)\) bundle, fixed comparison geometry, finite \(p>6\),
the native positive internal metric from the negative Killing form,
and the E36 native clock. Fix a compact range of positive definite
connection and curvature values in the chosen chiral component,
with uniformly equivalent reference metrics and pairings, and one
admissible \(\lambda\) with a uniform reference rank-one margin.
The refined theorem supplies uniform \(\epsilon,R>0\) for the
comparison \(C^0\) datum norm and native \(X^\circ\) solution norm,
respectively. Each smooth compatible reference then has a positive
time \(T_{\rm ref}\) for **every** datum in its \(\epsilon\)-ball
on the closed slab. Compatibility of a datum implies compatibility
of the solution. The time and interior regularity constants may
depend on that reference's derivatives. The new estimates below
close without putative derivative bounds on the datum or on an
incoming trajectory. There is no missing external theorem for
these estimates. [E138, statement and scope][e138].

## Fixed pairings, cutoffs, and the tent energy

Uniform equivalence of the native reference and comparison metrics
compares tensors, volume densities, and lengths. To compare a
space cylinder in one of the geometries with the other, cover its
enlarged comparison ball by balls of the *same radius* using
fixed-background packing at a uniformly smaller radius. Metric
equivalence puts those smaller balls inside reference balls of the
desired radius for the reverse comparison. The number is uniform
and the time windows stay \( (0,r^2)\) or \( (r^2/2,r^2)\).
The volume bound is \(Cr^4\), and the superscript \({}^\circ\)
is completion on the closed slab. If one also compares the
reference and fixed \(X\) spaces, the tensorial difference of their
derivatives satisfies
\[
 Z((D-D_*)U)\le C\sqrt T\,\|D-D_*\|_\infty\|U\|_\infty .
\]
Thus that optional comparison only adds a time restriction. E138
uses native \(X^\circ\) and needs only uniform equivalence for the
data's \(C^0\) norm. In a fixed local frame with fiber metric matrix
\(J(x)\), the frame transformed by \(J(x)^{-1/2}\) is orthonormal
for the reference pairing. The change and its inverse are value
bounded. In that frame the symbol is the corresponding conjugate
and accretive for the Euclidean fiber product. Changes of frame
are used this way before testing accretivity. Metric equivalence
alone would not permit testing the original nonsymmetric matrix in
a different pairing. Derivatives of the frame contribute only to
the coefficient bounds used to shorten time. [E138, lines 53–112][e138].

For the global energy choose a separated net in fixed background
geometry at scale \(\delta_{\rm ref}\) sufficiently small to make
the reference array and density variations absorbable in each
reference-orthonormal chart. Plancherel gives the uniform leading
lower bound from the real rank-one inequality, including on
complex amplitudes by real and imaginary decomposition. The local
form errors are bounded by a small multiple of \(\|\partial v\|_2^2\).
Writing \(D=\partial+\gamma\) and using Young gives a further
uniform absorption and a mass cost \(C\|\gamma\|_\infty^2\).
For a normalized square partition \(\sum_i\chi_i^2=1\), both
cross terms in \(\sum_i\langle P_0D(\chi_i v),D(\chi_i v)\rangle\)
vanish separately since \(\sum_i\chi_i d\chi_i=0\). This uses no
symmetry of \(P_0\). Likewise
\(\sum_i\|D(\chi_i v)\|_2^2\ge\|Dv\|_2^2\). The pure cutoff
term is bounded by \(C\delta_{\rm ref}^{-2}\|v\|_2^2\) because
packing gives bounded overlaps. The chart count never multiplies
the leading bound
\[
 \operatorname{Re}\int\langle P_0Dv,Dv\rangle d\nu
 \ge c_*\|Dv\|_2^2-M_{\mathrm G,ref}\|v\|_2^2 .
 \tag{1}
\]
Here \(\delta_{\rm ref}\) may be obtained from a first coefficient
modulus, for instance the relevant Lipschitz seminorm. The resulting
mass \(M_{\mathrm G,ref}\) is allowed to grow.

In the localized equation, choose a fixed-background chart cutoff
equal to one on \(B_r^{\bar g}\), supported in a constant
enlargement. It has \(|d\eta|\le C/r\) in the reference norm.
Use (1) on \(\eta u\) and absorb the cutoff and flux gradient
terms by Young. The spatial mass \(Cr^4\), time length \(r^2\),
and squared cutoff scale \(r^{-2}\) give, with \(U_*=\sup|u|\),
\[
 r^{-4}\int_{Q_r}|Du|^2
 \le C\big(\|u_0\|_\infty^2+(1+r^2M_{\mathrm G,ref})U_*^2
                         +U_*Y(f)+Z(G)^2\big).
 \tag{2}
\]
The forcing integrals on the enlarged support use bounded covers
at the same radius \(r\). Thus \(TM_{\mathrm G,ref}\le1\)
controls the only reference-dependent coefficient in (2).
The zero-trace homogeneous uniqueness test uses (1) without
localization and the integrating factor for its finite mass.
[E138, lines 114–152][e138] · [E41, fixed-bundle energy][e41].

## Frozen kernels, residuals, and the input derivative

In a master chart put \(P_y(\xi)=P_0^{ij}(y)\xi_i\xi_j\).
Reference-pairing conjugation and the spatial norm comparison give
uniform Euclidean matrix bounds and accretivity on real \(\xi\).
Upon expanding \(P_y(\xi+i\eta)\), the mixed term costs at most
\(C|\xi||\eta|\), so the Hermitian part is bounded below by
\(c|\xi|^2-C'|\eta|^2\) after absorption. The norm-square ODE
for the matrix exponential yields the bound with exponential
\(-ct|\xi|^2+C't|\eta|^2\) even for nonnormal matrices.
The shifted Fourier integrand is entire and its tails on
intermediate contours are controlled by the same bound. Choose
\(\eta=\theta z/t\) with fixed \(0<\theta\) small. The phase
factor is \(e^{-\theta |z|^2/t}\), which dominates the
\(C'\theta^2|z|^2/t\) term. Polynomials from spatial or temporal
derivatives cost the stated powers after scaling
\(\xi\mapsto \xi/\sqrt t\) and reducing the Gaussian exponent.
This proves the uniform frozen
\(t^{-2-|\alpha|/2-j}e^{-b|z|^2/t}\) estimate without an
eigenbasis bound. [E41, (3)][e41] · [E138, lines 154–169][e138].

In \(K_0\), the source factor \(\rho(y)^{-1}\) cancels the integration
density. The cutoff \(\chi_\ell(x)\) equals one near the associated
source partition supports. On the diagonal the partitions sum to
one and the integral of the rescaled frozen kernel is the identity.
Rescaling and Gaussian domination give the strong approximate
identity in \(C^0\) for a fixed reference, and the two Schur mass
bounds extend the \(L^2\) trace by density. No uniform rate of this
trace in all references is needed. The kernel uses fixed master
charts, independently of the Gårding net. The top part of
\((\partial_t-L_x)K_0\) is a difference \(P_x-P_y\) times a second
kernel derivative. The difference supplies \(|x-y|\), gaining
\(\sqrt t\) in the Gaussian. Derivatives of frames, cutoffs and
the first and zeroth order local coefficients contribute at most
\(M_{\rm ref}t^{-1/2}N_b\) for \(t\le1\), where
\(N_b=t^{-2}e^{-bd_*^2/t}\). A first \(D_x\) derivative of \(K_0\)
may also differentiate the frame. Its error \(M_{\rm ref}N_b\)
is included in the uniform \(t^{-1/2}N_b\) bound after requiring
\(M_{\rm ref}\sqrt T\) small.

For \(K_0*\mathcal R^{*m}\), where
\((\partial_t-L_x)K_0=\delta+\mathcal R\) causally, allocate half
of the Gaussian exponent via
\(\sum d_i^2/\tau_i\ge d_*^2/t\). Bound the largest-time
remaining link by \((m+1)^2t^{-2}\), and integrate all other links
outward from it by the two uniform Gaussian mass bounds. When
\(k=0,1\) output derivatives land on \(K_0\), the time weights are
\(\tau_0^{-k/2}\prod_{i=1}^m\tau_i^{-1/2}\).
The simplex scaling with \(m\) independent time variables is
\(t^{m/2-k/2}\) times
\(\Gamma(1-k/2)\Gamma(1/2)^m/\Gamma(1-k/2+m/2)\).
The ratio is bounded by \(C^m\) for \(k=0,1\) after a fixed
prefactor. The correction therefore has a small factor
\(O_{\rm ref}(\sqrt t)\) in its order-zero Schur bounds, and the
kernel bounds are uniform after \(CM_{\rm ref}\sqrt T\le1/2\).
The causal alternating series telescopes including the identity
distribution at \(t=0\); integrable time weights justify convolution
and the single differentiated series. This construction does not
use a twice differentiated variable-coefficient Gaussian bound.

The adjoint has array \((P_0^{ji})^*\) in the same fixed pairing
and density. Its symbol is the matrix adjoint of \(P_y(\xi)\).
Use the same reasoning with \(M_{\rm ref}\) enlarged for this
array. Pair forward and backward Cauchy solutions for the
operator and the adjoint on \(0<s<t\), differentiate using the
weak equations, and take the two strong traces. The kernels are
reversed fiber adjoints. This proves the required uniform first
*input* derivative, with adjoint transpose in the fixed native
pairing. Integration by parts in the flux term uses
\(-D_yK\) with the fixed density. [E138, lines 170–223][e138] ·
[E41, (4)–(5)][e41].

## Pointwise and upper-cylinder estimates

For the source supremum use \(r=\sqrt t\). Annuli of width \(r\)
need at most \(C(a+2)^4\) radius-\(r\) balls in their \(a\)-th
region. For the early interval \(s<t/2\), value and flux kernels
have powers \(r^{-4}\) and \(r^{-5}\); full tent masses have
\(r^4Y(f)\) and \(Cr^5Z(G)\), the latter by Cauchy–Schwarz
against a volume \(Cr^6\). For \(s>t/2\), the kernel powers on
the Hölder norms are \(r^{6/q'-4}\) and \(r^{6/p'-5}\).
Integrability is precisely \(4q',5p'<6\). These match the datum
powers \(r^{6/q-2}\) and \(r^{6/p-1}\), respectively, and the
Gaussian annular losses sum. Thus
\(U_*\le C(\|u_0\|_\infty+Y(f)+Z(G))\) uniformly, and (2)
gives the full-time gradient tents.

For the upper cylinder in scaled coordinates write the operator as
\(\partial_\tau-\partial_i(P_r^{ij}\partial_j)\) with extra
coefficients \(rb^j_{\rm ref}\), \(r^2c_{\rm ref}\), and flux
coefficient \(rd_{\rm ref,i}\). For \(v=\eta u\) the gradient
commutator \((\partial_i\eta)P_r^{ij}\partial_j u\) can be
rewritten as \(\partial_j((\partial_i\eta)P_r^{ij}u)
-\partial_j((\partial_i\eta)P_r^{ij})u\). In the drift,
\(\eta b^j\partial_j u=b^j\partial_j v-b^j(\partial_j\eta)u\),
and the first term is \(\partial_j(b^jv)-(\partial_j b^j)v\)
with the scaled drift coefficient. Therefore its derivative cost
uses \(r^2\partial_x b_{\rm ref}\), and the cutoff derivative
of \(P_r\) uses \(r\partial_x P_0\). The spatial derivatives
here refer to the original chart when written with the subscript
\({\rm ref}\). Both are controlled by a short reference-dependent
time. All those commutators act on \(u,v\) or the sources.
The only term retaining \(\partial v\) as an unknown on the
right is the flux \((P_r-P_*)\partial v\) to be absorbed.

For the frozen divergence-to-gradient operator, the \(L^2\)
multiplier bound follows from
\(\|(i\tau+P_*(\xi))^{-1}\|\le(c|\xi|^2)^{-1}\).
For \(\varrho=\sqrt{|t|}+|x|\), the off-diagonal kernel and
its spatial and temporal first derivatives have uniform orders
\(\varrho^{-6},\varrho^{-7},\varrho^{-8}\). Outside the fixed
enlargement of a translation increment this gives an integrated
Hörmander difference bound for the kernel and its adjoint.
The E41 parabolic rectangle proof gives weak \((1,1)\) with
these constants and the \(L^2\) bound. Interpolation and duality
give the uniform \(L^p\) constant \(C_{\rm CZ}\). For value
forcing, the first kernel derivative restricted to the unit
time slab is in \(L^{p/(p-1)}\), again by \(5p'<6\),
and Young gives \(L^q\to L^p\). The frozen operator is causal.
One can estimate up to times approaching the top slice and
take the monotone limit. The reference solution has the needed
positive-time \(H^1\) start from the first kernel derivative
for smooth sources, combining \(f+\operatorname{div}_D G\)
as a smooth value source there. Fixed-reference difference
quotients then justify testing on smooth interior solutions.
Reference-dependent constants for that justification do not
enter \(C_{\rm CZ}\).

Choose \(C_{\rm CZ}\|P_r-P_*\|_\infty\le1/2\) by shortening
time with the bound \(Cr\|\partial_xP_0\|_\infty\). The
transition of the time cutoff on \([1/4,1/2]\) uses the
upper cylinders at radius \(r/\sqrt2\). The later support
\([1/2,1]\) uses radius \(r\). Both have bounded covering
counts. The weights after unscaling are \(r^{1-6/p}\)
for gradient and flux and \(r^{2-6/q}\) for value forcing.
Converting the gradient back to \(D\) costs at most
\(Cr\|\gamma_{\rm ref}\|_\infty U_*\). Consequently a
finite reference-dependent \(M_{\rm ref}\) can absorb these
scaled bounds and the kernel residual together through
\(T\le c(1+M_{\rm ref})^{-2}\). With \(TM_{\mathrm G,ref}\le1\)
and a fixed master-chart time ceiling, all the linear estimates
use a common \(A_*\). A conservative \(C^3\) coefficient bound
on the smooth reference pair in fixed charts suffices for these
restrictions with the natural \(D\). In particular the needed
drift derivative uses derivatives of the principal array,
density, frame and connection of finite order. Interior
regularity at a specified higher order is a separate bound.
[E138, lines 225–326][e138] · [E41, (6)–(7)][e41].

## Completion and zero-trace uniqueness

For smooth \(u_0\), the fixed operator semigroup identity
\(H(t)u_0=u_0+\int_0^t H(s)Lu_0\,ds\) follows from the
linear equation and uniqueness. The \(D_xK\) bound gives a
gradient correction of size \(C\sqrt t\,\|Lu_0\|_\infty\).
For smooth sources combine \(f+\operatorname{div}_D G\) as
a smooth value source to prove the same type of spatial-gradient
continuity at zero. This regrouping is for completion membership.
The bounded linear estimate on the two separate source norms
was proved above. Once the gradient and value are continuous
on the closed slab, approximation by smooth sections in
the uniform spatial \(C^1\) norm gives convergence in \(X\)
because \(Z(G)\le C\sqrt T\|G\|_\infty\). The \(A_*\)
estimates pass to the completions and preserve strong \(C^0\)
traces. At fixed \(T>0\) the \(r=\sqrt T\) covers give
distributional embeddings into global \(L^2\) for the gradient
and flux and \(L^1\) for values. Their total count is used
only for these embeddings, with no appearance in \(A_*\).
The difference of a distributional solution and the mild solution
of its own sources has \(C_tL^2_x\), \(L^2_tH^1_x\), and,
by its homogeneous equation, \(\partial_tu\in L^2_tH^{-1}_x\).
Apply (1) to the weak energy identity and the strong zero
trace. This also holds on every shorter slab because restriction
lowers \(X\) and sends smooth closed-slab sections to such
sections. The completion qualification is essential for the
strong trace. [E138, lines 328–351 and 506–514][e138] · [Assessment][assess].

## Actual coefficient grading and uniform nonlinear radii

For \(a=A-\bar A,\ \zeta=F-\bar F,\ U=(a,\zeta)\), keep
the E36 fixed vertical metric \(\bar g\) and all live horizontal
and constraint adjoints. Grade terms by the degree of derivatives
of \(U\), treating \(x,z=(x,\bar A,\bar F)\) and its derivatives
as prescribed. The pointwise coefficients, including
\(g(F),B(F),S_F^*\), have smooth algebraic value dependence.
The live Christoffel symbol has one \(\partial\zeta\) component
with value coefficient plus a prescribed component. \(W\) is
affine in \(\partial U\) with value-only linear part. In
\(d_AW\) only that part gives a coefficient of \(\partial^2U\)
or two first derivatives. When the coefficient is differentiated,
its \(D_U\) term gives an algebraic quadratic coefficient, and
its \(x,z\) derivative times \(\partial U\) goes into the linear
coefficient. Differentiating the prescribed-degree-zero part
of \(W\) yields at most one unknown first derivative.

In the vertical term, \(d_A^{*\bar g}a\) has value-only
coefficient on \(\partial a\), so \(-d_A\phi\) supplies a
value-only principal array and lower-degree terms. \([F,\phi]\)
is at most linear in the unknown jet. In the constraint correction,
ordinary differentiation of \(C=\zeta-d_{\bar A}a-[a\wedge a]/2\)
gives the fixed exterior map on the second derivative and at most
one first derivative elsewhere. The live-Christoffel product
with \(C\) can multiply \(\partial\zeta\) by the exterior
first derivative of \(a\), with coefficient depending only on
values. Similarly \(d_AF\) is affine in \(\partial\zeta\),
and the live codifferential gives one value-only principal
coefficient and a value-only quadratic coefficient from the
Christoffel multiplication. There is no derivative of \(A\)
hidden in a live metric coefficient off the graph, since \(F\)
is independent. These terms exhaust the E36 equations.

Conversion to \(D\) preserves the pure two-gradient coefficient
under \(\partial U=DU+\gamma U\), and moves all differentiated
fixed-frame or connection terms into lower degrees. Moving
\(P^{ij}(x,U)D_iD_jU\) into divergence adds the pure quadratic
coefficient \(-D_U P\) in the normalized remainder. The
derivative of \(P\) at fixed \(U\), differentiated density,
and extra connection coefficients multiply at most one \(DU\).
Consequently \(P,D_U P,h_2,D_Uh_2\) are bounded on a common
value tube by compact value bounds, including the needed
second value derivative of \(P\). Reference derivatives enter
the bounds for \(h_0,h_1\) and their value derivatives.
With \(U\equiv0\) one has \(\beta=C=\phi=0\) and
\(d_{\bar A}\bar F=0\), hence the actual forcing is
\[
 h_0(x,0)=\big(V(\bar A),\,d_{\bar A}V(\bar A)\big),\qquad
 V(\bar A)=-d_{\bar A}^{*\bar g}(B(\bar F)\bar F).
 \tag{3}
\]
The reference is fixed in time and may be nonstationary. There
is no subtraction of (3). [E138, (1)–(3)][e138] · [E36][e36].

Choose the compact value tube with the positive curvature and
native principal margin and the graph margin checked below.
The value cutoff has uniform \(U\)-derivatives, and interpolation
of the principal array to \(P_0\) preserves accretivity in the
native reference pairing. The proof uses the uncut coefficients
inside \(|U|\le R\le\rho/4\). The late-cylinder Hölder
and full-cylinder Cauchy–Schwarz estimates give
\(Y(GH)\le C Z(G)Z(H)\), \(Y(G)\le C\sqrt T Z(G)\) and
\(Y(k)\le CT\|k\|_\infty\). For the quadratic estimate the
weights split as \(r^{2-6/q}=(r^{1-6/p})^2\) and
\(r^{-4}=(r^{-2})^2\).
The flux difference and the \(h_2\) argument differences
cost a uniform \(O(R)\). The \(h_2\) coefficient difference
costs \(O(R^2)\) with a uniform constant. The \(h_0\) and
\(h_1\) difference terms cost \(O_{\rm ref}(T+\sqrt T)\);
the source at zero has size \(CT\|h_0(\cdot,0)\|_\infty\).
These same estimates give the map into the source completions
by smooth closed-slab approximation.

The order of choices is valid. Fix the uniform linear constant
\(A_*\) and tube and choose \(R\) with
\(A_* C_*R\le1/16\). Then set
\(\epsilon=R/(64A_*C_{\rm cmp})\). Each reference allows
one short \(T_{\rm ref}\) for all its data, giving Lipschitz
constant at most \(1/16\) from the derivative-dependent term
and source at zero at most \(R/32\) after \(S\). On the
enlarged \(2\epsilon\) ball the image radius is bounded by
\(R/32+R/32+R/8=3R/16\). Therefore the contraction factor
is at most \(1/8\), and the \(C^0_*\)-to-\(X^\circ\)
Lipschitz bound is at most \(A_*C_{\rm cmp}/(1-1/8)\)
for each fixed reference with one common constant. There is
strict room for cutoff agreement and compatible approximation.
No datum derivatives enter \(T_{\rm ref}\), \(R\), or
\(\epsilon\). [E138, lines 431–514][e138] · [E42, product
and contraction estimates][e42].

## Parameter smoothing and the curvature graph

For a fixed reference the E42 lifted pullbacks are induced
by a smooth time-dependent base map with speed \(O(|s|)\)
and metric parallel transport. For \(t\le r^2\) their
images of \(r\)-balls fit uniformly coverable enlargements
at radius \(r\). The derivatives are bounded transformations
of \(DU\) and order-zero terms on \(U\). The latter cost
\(\sqrt T\) in \(Z\); boundedness and density give strong
continuity on \(X^\circ_T\). At zero time the bundle map and
base map are the identity. The transformed principal array
acts through two inverse base Jacobian slots and conjugation
of fiber slots. Time differentiation of the lifted pullback
introduces a smooth drift and zeroth order term. The transformed
coefficients converge in the requisite value norms on the
fixed tube as \(s\to0\), for each fixed reference. In particular
even the transformed principal coefficient at zero can move
and gives a small additional \(Z(DU)\) multiplier. The moved
nonzero forcing (3) is a value source costing \(T\).
The strict contraction and interior-image bounds allow a
smaller parameter neighborhood with all existing radii and
time retained. The neighborhood ensuring that the lifted
solution itself is in the ball may depend on the datum.
Strong continuity and Lipschitz data dependence make the
identification valid on a neighborhood of that datum, which
suffices for each local smooth parameter-and-data construction.
Pullback of distributional residuals is justified by the
smooth approximation in \(X^\circ\) and the product bounds.
The inverse \(I-D_U\Phi_s\) comes from the strict contraction,
so the parameter solution is smooth by repeated differentiation.
For \(t>0\) its base parameter derivative on four chosen
spanning fields is \(t\) times an isomorphism. Local inversion
and evaluation give the spatial derivatives and, from the
equation, all time derivatives. Finite strip covers and the
joint dependence give convergence of all derivatives on compact
positive-time strips. None of these constants is used for the
uniform radii. [E138, parameter passage][e138] · [E42][e42].

On the graph \(F=F_A\) the constraint correction vanishes.
In \(W\), substituting \(F_A=\bar F+d_{\bar A}a+[a\wedge a]/2\)
creates a second derivative only through the constant
exterior first-jet map in local coordinates. The vertical
principal term still uses \(\bar g\). Thus the principal array
depends on current and reference values of \((A,F)\), with
no dependence on the uncontrolled symmetric first jet of \(a\).
At reference equality the native graph-symbol quadratic lower
bound is
\[
 |H_\xi c|^2+(1-\sqrt3/2)(|S_{\bar A}^*c|^2+|x|^2)
 \quad\text{on }b=\xi\otimes x+c,\quad |\xi|_{\bar g}=1.
\]
The exact sequence checked in E29 makes it strict for
\(b\ne0\). All terms are algebraic at the reference values,
so compactness of the reference range and the two native
unit spheres gives a uniform gap. Continuity gives the
smaller value tube chosen before \(R\). This is the separate
graph symbol calculation in the reference pairing, with
no transfer of a nonsymmetric pair inequality to other metrics.

E38 approximates a continuous compatible datum by smooth
compatible pairs within the same \(2\epsilon\) ball eventually.
For each, the initial first-jet image is compact in the open
parabolic graph region. E29 can use a separate jet cutoff
there, interpolating to a fixed Laplacian, and a separate
positive smooth time. The \(C_tH^6\) graph solution controls
the lifted pair in spatial \(C^1\) through zero since the
curvature takes one derivative in dimension four. Its lift
solves E36 by the compatible converse. As \(\ell\downarrow0\)
the short-slab \(X_\ell\) norm approaches the datum's sup norm
by the \(C\sqrt\ell\) gradient bound. Thus uniqueness compares
it with the restricted mild solution in the actual completed
ball on an individual short interval. From a strictly
positive slice there, the smooth constraint equation and its
moving-metric energy propagate zero to each subsequent compact
interior interval. The metric-velocity coefficient is needed
only on those intervals. The uniform \(C^0\) pair limit
preserves compatibility distributionally by testing
\(d_{\bar A}a\) with its fixed formal adjoint and passing the
bracket by uniform convergence. This holds at the final
continuous slice as well. The individual smooth lifespans
need no common lower bound and no approximation has to fit
a newly chosen reference radius.
[E29, native graph symbol and smooth cutoff][e29] · [E36][e36] ·
[E38][e38] · [E138, compatible passage][e138].

## Assessment boundary

The audit validates the uniform radius for the adjusted pair
equation and its stated regularity and compatibility on
each reference's own slab. No original-flow restart, recovery
derivative bound or derivative-independent positive time across
references is inferred. The existing E41/E42 assessment remains
the baseline, and the canonical Fine, Taylor and Koch–Lamm
source records keep their inherited scopes. No new primary
inspection was needed. All ten frozen inputs were verified and
only the two assigned E142 files were written. [Return][return] ·
[Canonical source record][sources].

[req]: ../research-progress/handoffs/SP4-CME-E142_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E142_RETURN_v1.md
[e138]: ../notes/138_UNIFORM_VALUE_RADIUS_LOCAL_THEOREM_20261122.md
[e29]: ../notes/29_LOCAL_PARABOLIC_INPUT_20261122.md
[e36]: ../notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e38]: ../notes/38_CONTINUOUS_COMPATIBLE_DATA_20261122.md
[e41]: ../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[assess]: E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
