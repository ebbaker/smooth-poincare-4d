# E138 — Uniform value radius for the fixed-reference coupled system

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E execution under [B72][b72], configured
gpt-6.2-sol / ultra. Independent runtime attestation and actual lead
settings are unavailable. The [request][req] records the eight frozen
input digests, all verified before use. The executor wrote E43's
linear audit and E46's later integration audit, as well as related
E26/E28/E50/E63/E119/E128 analyses. E36, E41, E42 and E44 are
inherited work. The proof below refines the coefficient dependence
of E41 and E42 in their actual system.

## Statement

Fix a smooth compact closed oriented real four-manifold \(M\), the
smooth oriented Euclidean rank-three bundle, a smooth comparison
metric and product-bundle norm, a finite system of background charts,
and \(p>6\). Use the native negative Killing form internally and the
positive definite component and native time of [E36][e36]. Let
\(\mathcal K\) be a prescribed compact positive algebraic range of
reference values, recorded in fixed charts and frames, or using
connection differences from a fixed smooth background connection.
Suppose the reference metrics and pairings are uniformly equivalent
to the comparison ones and, with one fixed admissible \(\lambda\),
the principal arrays at the reference have a uniform bound and
positive real rank-one margin in the **native reference pairing**.
The set can be presented as a compact subset of the total value
bundle, using the fixed choices to identify the affine connection
fibers. Every reference considered is a smooth \(\bar A\) with
\(\bar F=F_{\bar A}\) and values in \(\mathcal K\).

There exist \(\epsilon,R>0\), depending only on this range, \(p\),
\(\lambda\) and the fixed background choices, such that for each
reference there exists a \(T_{\rm ref}>0\) with the following
properties. Every continuous independent pair
\[
 U_0=(A_0-\bar A,F_0-\bar F),\qquad
 \|U_0\|_{C^0_*}\le\epsilon
\]
has the E42 solution of (1) below on \([0,T_{\rm ref}]\). It lies in
the radius-\(R\) ball of \(X_{T_{\rm ref}}^\circ\), with that norm
taken in the actual reference bundle, metric and density. It has
strong \(C^0\) trace at zero and is unique among distributional
solutions with that trace in the completed ball. The data map is
Lipschitz there with one constant in the displayed \(C^0_*\) norm.
Solutions are smooth on \(0<t<T_{\rm ref}\), and convergence of data
implies smooth convergence on compact interior positive-time strips.
If \(F_0=F_{A_0}\) distributionally, then \(F=F_A\)
distributionally at every closed-slab slice and pointwise in the
interior. The time and any finite-order interior regularity constants
may depend on finite derivatives of this reference. The radii do not.

## Norm comparison and local scales

Write \(\bar g=g(\bar F)\). The native fixed product pairing is from
\(\bar g\) and the internal metric, \(D\) is the fixed reference
metric derivative, and \(d\nu\) the fixed reference volume density.
For a local forcing array use the flux convention in which the
principal divergence is \(\partial_i G^i\) in coordinates. With
\(Q_r=B_r^{\bar g}\times(0,r^2)\), \(Q_r^+=B_r^{\bar g}\times
(r^2/2,r^2)\), \(q=p/2\), and \(r\le\sqrt T\), use precisely
\[
\begin{aligned}
 Z(G)&=\sup r^{1-6/p}\|G\|_{L^p(Q_r^+)}
               +\sup r^{-2}\|G\|_{L^2(Q_r)},\\
 Y(f)&=\sup r^{2-6/q}\|f\|_{L^q(Q_r^+)}
               +\sup r^{-4}\|f\|_{L^1(Q_r)},\\
 X(U)&=\|U\|_\infty+Z(DU).
\end{aligned}
\]
The superscript \({}^\circ\) throughout denotes the completion of
smooth sections of the **closed** slab in the indicated norm.

Uniform \(C^0\) comparisons between \(\bar g\) and the background
give inclusions into constant multiples of background balls, and
conversely. For small \(r\), fixed background volume/packing covers
each such enlargement by at most \(C\) balls of the original radius.
The same argument with the metric inclusions gives bounded covers
by radius-\(r\) reference balls. This compares \(Y,Z\) based on
either geometry without changing the time intervals. Ball volumes
are \(\le Cr^4\) in either density. The \(C^0\) comparison constant
\(C_{\rm cmp}\ge1\) is uniform. If comparing the \(X\) norms
themselves, use \(DU-D_*U=\Gamma_{\rm diff}U\), with \(D_*\) fixed,
and \(Z(\Gamma_{\rm diff}U)\le C\sqrt T\|\Gamma_{\rm diff}\|_\infty
\|U\|_\infty\). Shrinking \(T\) to make this factor bounded gives
uniform equivalence. Our radii use the native \(X\) with \(C^0_*\)
data as stated.

Fix master charts with smaller covering charts and cutoffs
independent of the reference. Reference-orthonormal local frames can
be formed by the positive square root of the local fiber metric in
the fixed frames. Their values and inverse values are uniformly
bounded. Their derivatives can depend on reference derivatives.
Use uniform coordinate metric comparisons on these charts.
In the estimates below \(\lesssim\) allows constants depending only
on the fixed choices and the specified algebraic bounds. Quantities
carrying “ref” can depend on the particular reference.

## Uniform E41 Cauchy and Duhamel estimate

Let \(L=\operatorname{div}_D(P_0 D)\), \(P_0(x)=P(x,0)\),
with the actual reference density and pairing. We prove a single
\(A_*\ge1\), independent of the reference derivatives, for
\[
 \|Hu_0\|_X\le A_*\|u_0\|_\infty,\qquad
 \|S(f,G)\|_X\le A_*[Y(f)+Z(G)]                         \tag{L}
\]
for every \(0<T\le T_{\rm lin,ref}\). Here \(S\) has zero trace and
solves \((\partial_t-L)S=f+\operatorname{div}_D G\).
This separates the constants of the E41 construction
instead of taking its original smooth-coefficient constant as
uniform. [E41][e41] · [E43 audit][e43] · [Lead assessment][assess].

### Gårding and localized energy

Freeze the principal array and the density on a sufficiently small
reference-dependent chart scale. Uniform rank-one positivity,
Plancherel on each localized chart section in a reference-orthonormal
frame, and uniform density comparisons give a uniform leading
constant. Choose the scale so that errors from freezing are at
most a fixed fraction of that constant. Replacing \(\partial\)
by \(D\) with Young's inequality costs a further fixed fraction
and a zeroth-order term. A squared partition \(\sum_i\chi_i^2=1\)
localizes the result globally. In the expansion of both derivative
slots, both cross sums vanish by \(\sum_i\chi_i d\chi_i=0\),
including for nonsymmetric arrays. The remaining cutoff terms are
bounded by \(C\sup_x\sum_i|d\chi_i|^2\|v\|_2^2\).
Such partitions come from a maximal separated net at the chosen
scale, smooth chart bumps, and division by the square root of
their square sum. Uniform fixed-background packing bounds their
overlap, so \(\sum_i|d\chi_i|^2\lesssim\delta_{\rm ref}^{-2}\)
for that scale. In particular the global number of charts
does not multiply the leading constant. The result is
\[
 \operatorname{Re}\!\int\langle P_0 Dv,Dv\rangle\,d\nu
        \ge c_*\|Dv\|_2^2-M_{\mathrm G,ref}\|v\|_2^2,\qquad c_*>0.
\]
For a solution \(u\) with supremum \(U_*\), test with \(\eta^2 u\),
where \(\eta=1\) on \(B_r^{\bar g}\) is supported on a constant
enlargement and \(|d\eta|\lesssim r^{-1}\). Apply the displayed
inequality to \(\eta u\); the flux forcing and cutoff cross
terms are bounded by Young. Integrate to \(r^2\). A bounded
cover of the support by radius-\(r\) balls then gives
\[
 r^{-4}\int_{Q_r}|Du|^2\lesssim
 \|u_0\|_\infty^2+(1+r^2 M_{\mathrm G,ref})U_*^2
             +U_*Y(f)+Z(G)^2.
\]
The initial term uses the strong \(L^2\) trace. The same
inequality without localization gives homogeneous weak energy
uniqueness with strong zero trace by an integrating factor.
For the uniform tent estimate require \(TM_{\mathrm G,ref}\le1\).

### Kernel, adjoint, and supremum

In each master chart freeze \(P_0\) at the source point.
The real part of the symbol \(P_0(y,\xi)\) controls \(|\xi|^2\)
with uniform margin for all amplitudes, including complex
amplitudes by separation of real and imaginary parts. On the
complex shift \(\xi+i\eta\), expand the quadratic polynomial and
absorb the mixed term to get real part \(\ge c|\xi|^2-C|\eta|^2\).
The exponential norm inequality and Fourier shift
\(\eta=c'z/t\) give the bound
\[
 |\partial_z^\alpha\partial_t^j k_y(t,z)|
       \lesssim_{\alpha,j}t^{-2-|\alpha|/2-j}e^{-b|z|^2/t}.
\]
These constants use only the algebraic array bound and margin
and the fixed chart comparisons. No eigenbasis regularity is
needed. With fixed source partition \(\phi_\ell\), outer
cutoffs \(\chi_\ell\), and the coordinate density \(\rho_\ell\),
form \(K_0\) by summing
\(\chi_\ell(x)\phi_\ell(y)\rho_\ell(y)^{-1}
k_{\ell,y}(t,x_\ell-y_\ell)\) interpreted in the local frames.
This uses the **fixed** number of master charts, regardless
of the Gårding scale. If \(N_b=t^{-2}e^{-bd_*^2/t}\) in fixed
background distance, then, for \(k=0,1\),
\[
 |D_x^kK_0|\lesssim t^{-k/2}N_b,\qquad
 |(\partial_t-L_x)K_0|_{t>0}\le M_{\rm ref}t^{-1/2}N_b .
\]
For the first bound with \(k=1\), the frame/connection derivative
term is \(O_{\rm ref}(N_b)\); impose \(\sqrt T M_{\rm ref}\le1\)
after including its coefficient in \(M_{\rm ref}\).
The residual's top term uses
\(|P_0(x)-P_0(y)|\lesssim\|\partial P_0\|_\infty |x_\ell-y_\ell|\).
The first and zeroth order local operator coefficients, and
derivatives of the outer cutoffs, give the remaining terms.
Allow \(T\le1\), and enlarge \(M_{\rm ref}\) to cover the
formal adjoint as well. The residual bound and the strong
initial approximate identity for \(K_0\) give the causal equation
\((\partial_t-L_x)K_0=\delta+\mathcal R\),
where \(\mathcal R\) is the residual at \(t>0\).
The initial identity follows by rescaling \(x_\ell-y_\ell=\sqrt t z\)
in each chart, dominated convergence with the Gaussian tail,
and the identity integral of each frozen kernel.

For a convolution chain of \(m+1\) links in
\(K_0*\mathcal R^{*m}\), extract half the exponent by
\(\sum_i d_{*,i}^2/\tau_i\ge d_*^2/t\).
Use the largest time link for the factor \((m+1)^2t^{-2}\)
and integrate all other spatial links by uniform Gaussian
mass bounds. The remaining time integral is
\[
 t^{m/2-k/2}
 \frac{\Gamma(1-k/2)\Gamma(1/2)^m}
      {\Gamma(1-k/2+m/2)},\qquad k=0,1 .
\]
The ratio is bounded by a fixed exponential in \(m\).
Thus for \(C M_{\rm ref}\sqrt T\le1/2\) the alternating
resolvent series, and one output derivative, are bounded in
a common Gaussian by summing \((m+1)^2(CM_{\rm ref}\sqrt t)^m\).
The distributional residual telescopes, and the correction
has \(C^0\)- and \(L^2\)-operator norm \(O_{\rm ref}(\sqrt t)\).
This gives the Cauchy kernel with strong initial trace.
The formal adjoint is again divergence form with transposed
array and the same rank-one margin. Its independent construction
and weak-energy duality identify its kernel as the reversed
transpose. Hence the *input* gradient bound needed for flux
forcing has the same uniform constants. The estimates used are
\[
 |K|\lesssim N_{b/2},\qquad |D_xK|+|D_yK|\lesssim t^{-1/2}N_{b/2}.
\]

For the source supremum set \(r=\sqrt t\). Cover spatial annuli
of radius \(\sim (a+1)r\) by at most \(C(a+2)^4\) radius-\(r\)
balls using the background packing comparison. The annular
Gaussian factor is summable. For \(s<t/2\), the kernels use
\(r^{-4}\) for values, \(r^{-5}\) for flux, and the tent bounds
give masses respectively \(\lesssim r^4Y(f)\) and
\(\lesssim r^5Z(G)\). For \(s>t/2\), the Hölder kernel powers
are \(r^{6/q'-4}\) and \(r^{6/p'-5}\), where \(q',p'\) are
conjugates and \(4q',5p'<6\) by \(p>6\). Pairing with the
upper-cylinder powers \(r^{6/q-2}\) and \(r^{6/p-1}\)
gives zero net powers of \(r\). The Cauchy supremum bound
uses uniform kernel mass. The conclusion is
\[
 U_*\lesssim\|u_0\|_\infty+Y(f)+Z(G).
\]
Combining with localized energy gives the tent part of (L).

### Upper cylinders

Use a fixed master chart based at each cylinder center and
rescale space by \(r\), time by \(r^2\).
In a reference-orthonormal frame the unscaled equation has
leading \(\partial_i(P_0^{ij}\partial_j u)\) and extra
\(b^j_{\rm ref}\partial_j u+c_{\rm ref}u\). The flux forcing
has extra \(d_{\rm ref,i}G^i\). Choose a spatial cutoff on
a constant enlargement of the target ball, with uniformly
bounded first and second derivatives in the scaled coordinates,
and a time cutoff zero for \(\tau\le1/4\) and one on
\([1/2,1]\). For \(v=\eta u\) freeze at the center \(P_*\).
Uniform small-time restrictions make
\[
 \|P_r-P_*\|_\infty\lesssim r\|\partial P_0\|_\infty
 \quad\hbox{small},\qquad
 \|\partial_yP_r\|_\infty+
 \|r b_{\rm ref}\|_\infty+\|r^2\partial b_{\rm ref}\|_\infty+
 \|r^2 c_{\rm ref}\|_\infty+\|r d_{\rm ref}\|_\infty
 \ \hbox{bounded}.
\]
This includes the density, frame and connection terms.
Here \(P_r\) is the rescaled array and \(y\) the scaled spatial
coordinate. The cutoff terms with one \(\partial u\), including
\((\partial_i\eta)P_r^{ij}\partial_j u\), can be written as
a divergence on a bounded multiplier of \(u\) minus its
coefficient derivative times \(u\). The scaled first-order
drift on \(v\) is rewritten the same way. The only flux
coefficient error on \(\partial v\) remaining is
\((P_r-P_*)\partial v\).

For the frozen operator the gradient of its causal divergence
inverse has a uniform \(L^p\) bound. Its \(L^2\) multiplier
uses \(\|(i\tau+P_*(\xi))^{-1}\|\le (c|\xi|^2)^{-1}\),
and the parabolic kernel difference estimate uses the Gaussian
bounds through two spatial derivatives and their first spatial
and time derivatives. The \(L^p\) step in E41 uses the resulting
uniform Hörmander bound and \(L^2\) bound, hence is uniform in
the frozen array. The value forcing inverse to gradient on
the unit time slab maps \(L^q\) into \(L^p\) by Young, using
the gradient kernel in \(L^{p/(p-1)}\), since \(p>6\).
Choose \(T\) so the frozen \(L^p\) constant times
\(\|P_r-P_*\|_\infty\) is \(\le1/2\). Absorption yields
\[
 \|\partial_y v\|_p
 \lesssim U_*+\|r^2f\|_{L^q(\mathcal Q)}
                   +\|rG\|_{L^p(\mathcal Q)}
\]
in the scaled variables on the unit time slab, with support
cylinder \(\mathcal Q\) at times \([1/4,1]\). The zeroth
order flux terms use \(L^p\subset L^q\) there. For the earlier
half of the support interval use upper cylinders of radius
\(r/\sqrt2\) covering the spatial support. For the later half
use radius-\(r\) upper cylinders. Both covers have uniform counts.
The conversion to the target norm is \(r^{1-6/p}\) on the
unscaled gradient, \(r^{2-6/q}\) on value forcing, and
\(r^{1-6/p}\) on flux. The term \(r\Gamma_{\rm ref}u\) for
conversion to the scaled covariant gradient is uniformly bounded
by \(C U_*\) after the time restriction. This proves the upper
gradient estimate. Only positive-time smooth kernel solutions
with smooth sources are used at this step, with their interior
regularity as in E41 by local energy/difference quotients.
All constants in (L) are now uniform.

Concretely, one can take
\[
 T_{\rm lin,ref}=
 \min\{T_*,(1+M_{\mathrm G,ref})^{-1},c(1+M_{\rm ref})^{-2}\},
\]
with fixed \(T_*,c>0\) and \(M_{\rm ref}\ge1\) enlarged for
the norms just listed, for native versus comparison \(X\)
if desired, and for both residuals. The residuals, drift
and drift derivative, rescaled connection coefficients and
Gårding mass require only finitely many chart derivatives.
For the natural reference Levi-Civita and internal derivative,
a conservative choice uses \(C^3\) bounds of the smooth
\((\bar A,\bar F)\) in the fixed charts, plus fixed chart data.
For example the drift uses first derivatives of \(P_0,\rho\)
and the reference connection, and differentiation uses their
next derivatives; the zeroth order terms require the first
derivative of the reference connection. A different chosen
fixed smooth metric derivative may be recorded by its own
finite coefficient norms. This time choice is a lower bound
on the construction's available horizon, with no assertion
that the particular derivative count is optimal.

### Completed estimates and trace

For smooth initial sections the Cauchy solution belongs to
\(X^\circ\). Indeed
\(H(t)u_0=u_0+\int_0^t H(s)Lu_0\,ds\), and the first
gradient kernel bound gives uniform convergence of the spatial
gradient to \(Du_0\) as \(t\downarrow0\).
For smooth forcing combine \(f+\operatorname{div}_D G\) as
a smooth value forcing, for this trace argument only.
The differentiated integral gives gradient \(O_{\rm ref}(\sqrt t)\),
so the solution and spatial gradient extend continuously to
zero. Uniform spatial \(C^1\) approximation on the closed
slab by smooth sections then gives membership in \(X^\circ\),
since \(Z(W)\lesssim\sqrt T\|W\|_\infty\).
Apply (L) to continuous data by uniform approximation, and
to the source pair by smooth completion in \(Y^\circ,Z^\circ\).
The estimates pass with the same constants and uniform convergence
keeps the strong \(C^0\) initial traces. At a fixed positive \(T\)
a finite cover at radius \(\sqrt T\) identifies the completed
gradient and flux as global \(L^2\) and the value forcing as
global \(L^1\). The cover may have many elements; it is used
only to identify the distributions and test uniqueness, not
in the constant of (L). These are the completed source spaces
in E41/E42. [E44 audit][e44] · [Lead assessment][assess].


## Algebraic principal and quadratic coefficients of E36

Write \(U=(a,\zeta)\), \(a=A-\bar A\), \(\zeta=F-\bar F\),
with independent \(A,F\). Keep the actual coefficients and signs
\[
\begin{aligned}
 \beta&=\zeta+[a\wedge a]/2,\qquad
 C=\zeta-d_{\bar A}a-[a\wedge a]/2,\qquad
 \phi=d_A^{*\bar g}a,\\
 W&=*_{g(F)}((d_AB(F))\wedge F)
                  -S_FS_F^*d_A^{*g(F)}\beta,\\
 A_t&=W-d_A\phi+d_A^{*g(F)}C,\\
 F_t&=d_AW-[F,\phi]-\lambda d_A^{*g(F)}d_A F.          \tag{1}
\end{aligned}
\]
Here \(B(F)\) is E36's native physical coefficient and \(S_F^*\)
uses the live \(g(F)\). The metric in the vertical gauge is fixed
at \(\bar g\). In particular the off-constraint physical term
uses exactly the displayed Bianchi-reduced extension. [E36][e36].

In fixed coordinates write \(z=(\bar A,\bar F)\), using the
allowed affine comparisons. The derivative of a live metric
coefficient is a sum of an explicit \(x\) derivative at fixed
value and \(D_Fg[\partial z_F+\partial\zeta]\). The live
Christoffel term is therefore affine in \(\partial\zeta\);
its coefficient on \(\partial\zeta\) is a value map.
Likewise \(W\) has form
\(W_1(x,z,U)\partial U+W_0(x,z,\partial z,U)\).
The derivative of the algebraic \(\beta\) and the live
Christoffel term multiplying \(\beta\) have this form, and
the commutators in the metric codifferential contribute
only value multipliers. In \(d_AW\), \(W_1\partial^2U\)
has an algebraic coefficient and
\((D_UW_1[\partial U])\partial U\) is purely quadratic
with a value coefficient. Explicit derivatives of \(W_1\)
at fixed \(U\), including its derivatives in \(z\) times
\(\partial z\), multiply one \(\partial U\).
Derivatives of \(W_0\) have degree at most one in \(\partial U\).

For the other terms, the zeroth degree part of \(\phi\) can
contain derivatives of \(\bar g\), but the coefficient of
\(\partial a\) uses only \(\bar g\) itself. The derivative
in \(-d_A\phi\) gives an algebraic principal array and
terms of degree at most one in the unknown first jet.
The commutator \(-[F,\phi]\) remains first order.
The ordinary derivative of \(C\) in \(d_A^{*g}C\) produces
\(\partial^2a\) with a value coefficient and terms of degree
at most one in the unknown first jet. Its live Christoffel
term times \(C\) gives a product of \(\partial\zeta\) and the
exterior part of \(\partial a\), with purely algebraic coefficient.
The same calculation for \(d_A^{*g}d_A F\) uses \(d_AF\)
affine in \(\partial\zeta\); its derivative gives a
second derivative with value coefficient and its live Christoffel
term gives a product of first curvature derivatives with value
coefficient. Reference derivatives in both products occupy a
slot that otherwise contains an unknown first derivative.
Fixed density, frame and connection derivatives affect terms of
lower unknown degree. This accounts for every term with two
unknown first derivatives or one unknown second derivative.

Collect \(\partial_i\partial_j U\) into \(P^{ij}(x,U)\)
before converting to \(D\) and taking divergence. Conversion
\(\partial U=DU+\gamma_{\rm ref}(x)U\) in a quadratic first-jet
term leaves its pure \((DU)^2\) coefficient intact.
Converting the second jet changes only first and zeroth order
terms. The divergence rewrite adds a pure quadratic term using
\(D_U P\), while the spatial derivative of \(P\) at fixed
value and all connection/density corrections to the divergence
are of degree at most one in \(DU\). Thus (1) is
\[
 U_t=LU+\operatorname{div}_D\!\big((P(x,U)-P_0)DU\big)
           +h_0(x,U)+h_1(x,U)DU+h_2(x,U)[DU,DU],        \tag{2}
\]
with \(P\) and \(h_2\) smooth functions of the reference values,
the comparison chart data at \(x\), and \(U\).
The derivative-dependent \(h_0,h_1\) are smooth with finite
value derivative bounds for each reference. This reasoning
also bounds the required value derivatives of \(h_2\),
including those from \(D_U^2P\), uniformly on a compact tube.
The choice of smooth frame for the local analysis has values
controlled by the metric equivalence; its derivatives appear
only in the lower-degree terms.

Choose a uniform \(\rho>0\) so \(|U|\le2\rho\) in native
reference norm lies in the positive component and has a
uniform positive rank-one margin in the fixed native
reference pairing. This uses continuity of the actual
value arrays on the enlarged compact bundle range. Choose
\(\rho\) also for the smooth compatible graph-start argument
below. Cut off smoothly in \(|U|^2/\rho^2\) by one on
\(|U|\le\rho\), zero for \(|U|\ge2\rho\), interpolating \(P\)
to \(P_0\) and the \(h_j\) to zero. Convexity keeps a positive
rank-one margin. Value derivatives of the cutoff are uniform.
A spatial derivative of the cutoff in a coordinate rewriting
of divergence still carries at most one unknown derivative
aside from the value derivative already included in the quadratic
bookkeeping. After cutoff there is a single finite \(K_*\)
bounding the needed \(D_U P,h_2,D_U h_2\), and finite
\(H_{\rm ref}\ge1\) bounding \(h_0,D_Uh_0,h_1,D_Uh_1\).
For the natural comparison these lower coefficient bounds
can be obtained from the same conservative \(C^3\) reference
bounds. In particular \(h_0(x,0)\) may be nonzero at a
nonstationary reference. It is the zeroth-degree value of the
actual right hand side of (1), since \(DU=0\) when the section
is identically zero.

## Uniform contraction and variable time

Bounded multiplication on \(Y,Z\), Hölder on the late
cylinders, and Cauchy–Schwarz on the full tents give
\[
\begin{aligned}
 Z(MG)&\le\|M\|_\infty Z(G),&
 Y(M[G,H])&\le\|M\|_\infty Z(G)Z(H),\\
 Y(k)&\lesssim T\|k\|_\infty,&
 Y(G)&\lesssim\sqrt T\,Z(G).
\end{aligned}
\]
The comparisons are uniform by the volume bounds. Let
\(\mathcal N(U)\) be the ordered source pair in (2), valued
in \(Y^\circ\times Z^\circ\) with sum norm. For
\(X(U),X(V)\le R\le\min(1,\rho/4)\), value mean estimates and
these product bounds give
\[
 \|\mathcal N(U)-\mathcal N(V)\|
 \le [C_*R + C_{\rm ref}(T+\sqrt T)]\,X(U-V),\qquad
 \|\mathcal N(0)\|\le C T\|h_0(\cdot,0)\|_\infty.        \tag{3}
\]
Here \(C_*\) depends on \(K_*\) and uniform product constants,
and \(C_{\rm ref}\) also includes \(H_{\rm ref}\).
For the flux, use the two terms with coefficients
\(L_P R\) and \(L_P Z(DV)\). For the quadratic part,
the two argument differences give \(2\|h_2\|_\infty R\),
and its value difference gives \(\|D_Uh_2\|_\infty R^2\).
The \(h_0\) value difference costs \(T\); the argument and
value differences for \(h_1DU\) cost \(\sqrt T\).
All statements pass from smooth sections to the completed
spaces by the same bounds. In particular the nonstationary
source in (3) is small by shortening time.

First choose \(R\) in the above range with \(A_*C_*R\le1/16\).
Fix \(\epsilon=R/(64 A_*C_{\rm cmp})\).
Only then choose \(T_{\rm ref}\le T_{\rm lin,ref}\) so
\[
 A_* C_{\rm ref}(T_{\rm ref}+\sqrt{T_{\rm ref}})\le1/16,\qquad
 A_* C T_{\rm ref}\|h_0(\cdot,0)\|_\infty\le R/32 .
\]
For example additional bounds of the form
\(c(1+C_{\rm ref})^{-2}\) and
\(cR/(1+\|h_0(\cdot,0)\|_\infty)\), with constants absorbing
\(A_*\), suffice with \(T_{\rm ref}\le1\). The mild map
\(HU_0+S\mathcal N(U)\) contracts with factor at most \(1/8\).
It sends the radius-\(R\) ball into the radius-\(3R/16\)
ball even for the enlarged data range
\(\|U_0\|_{C^0_*}\le2\epsilon\). The strict margins protect
the cutoff agreement and permit smooth approximation of data.
The difference estimate from the contraction is at most
\(A_*C_{\rm cmp}/(1-1/8)\) times the comparison \(C^0\)
difference. Distributional uniqueness follows on every
shorter or full slab by subtracting the linear mild solution
of the prescribed sources of a candidate, then using weak
homogeneous energy uniqueness on the zero-trace remainder.
In the completion that remainder is continuous into \(L^2\)
and belongs to \(L^2H^1\), with time derivative in \(L^2H^{-1}\)
by the homogeneous equation. This is the E42 uniqueness class.

## Positive-time smoothing and curvature compatibility

For each fixed reference apply E42's spatial parameter
construction with finitely many smooth spanning fields.
The time-\(t\) flow at parameter \(s\), lifted by \(D\)-parallel
transport, is the identity at \(s=0\) and on the initial
slice for every \(s\). Its image of a radius-\(r\) ball for
\(t\le r^2\) lies in a uniformly coverable enlargement for
\(s\) small. The pullbacks and their spatial derivative
formula are bounded on the closed-slab completion for
small \(s\) for that reference, and are strongly continuous
there at zero by density. Conjugation in fixed smooth
coordinates, followed by the divergence rewrite, yields the
same source form (2). The smooth transformed coefficient maps
and their value derivatives tend to the original ones in the
bounds used in (3) as \(s\to0\) for this reference. Thus on
the **same** ball and time one may shrink the spatial
parameter neighborhood so the transformed map remains
strictly inward and contractive. In particular the perturbation
of the possibly nonzero transformed \(h_0(x,0)\) is treated
in \(Y\), with the factor \(T\). No equality
\(\mathcal N(0)=0\) is used. For each datum the lifted
solution lies in the ball for small \(s\) by strong
continuity and the strict margin, and the resulting
identification persists on a neighborhood of the datum by
the Lipschitz data map and bounded pullbacks. These
reference-dependent parameter sizes impose no smaller datum
radius.

The coefficient substitution and source bounds on the
completed spaces give a jointly smooth mild map in parameter
and datum near each of these points. Its fixed point is jointly
smooth by the inverse \(I-D_U\Phi\) supplied by the
contraction bound. As in E42, residual intertwining holds
distributionally by smooth approximation. Evaluating the
lift and inverting its pointwise base parameter map at
\(t>0\) gives the spatial derivatives, since the base
parameter derivative is \(t\) times the chosen spanning
fields. The equation supplies the time derivatives. Joint
continuity gives smooth convergence on compact interior
positive-time strips for converging data, by finite covers
in each strip. Each finite-order step uses finite smooth
coefficient derivatives for the chosen reference; a uniform
derivative-independent smoothing constant is unnecessary.
[E42][e42] · [E44 audit][e44].

For compatibility, the graph equation obtained by setting
\(F=F_A\) in the \(A\) row of (1) is E29's actual adjusted
connection equation. Its principal array on the graph is a
smooth function of \(x,z,A,F_A\), with no other first-jet
dependence. Indeed \(d_A^{*g}C\) disappears on the graph,
the vertical principal part uses fixed \(\bar g\), and
substituting the curvature formula into \(W_1\partial U\)
introduces a second unknown derivative only through the
fixed exterior linear map on \(\partial a\) in \(F_A\).
To check the base of the uniform graph tube, E29's
reference symbol at a unit covector splits \(b=\xi\otimes x+c\)
and has quadratic lower bound
\[
 |H_\xi c|^2+(1-\sqrt3/2)
           \big(|S_{\bar A}^*c|^2+|x|^2\big).
\]
The exact sequence used there makes this positive on unit
amplitudes at each positive definite reference value.
All its symbol data are algebraic and continuous in
the reference values. Its minimum over the compact unit symbols
above \(\mathcal K\) is positive, uniformly in reference
derivatives. Continuity of the graph coefficients therefore
allows the uniform reduction of \(\rho\) used earlier.
This is a separate native-pairing symbol check for the graph,
not a transfer of the pair inequality to a different pairing.
[E29][e29] · [E42 compatible passage][e42].

For continuous compatible initial values, use E38 smooth
graph approximation \(A_0^j\to A_0\),
\(F_{A_0^j}\to F_0\) uniformly. Eventually these data fit
the enlarged \(2\epsilon\) range with the same reference.
For each \(j\) separately apply the smooth E29 graph local
construction. Its initial jets lie in the open parabolic
jet region by the tube just proved, even when large symmetric
first derivatives occur. The smooth jet cutoff used in E42
can depend on \(j\), as can the short graph solution time.
The smooth-data graph solution in the E29 regularity lifts
to the pair on some interval \([0,\ell_j]\) by the E36
converse identity. The lifted pair has continuous spatial
first derivatives up to zero by the \(C_tH^6\) bound in
dimension four, and hence belongs to the smooth completion
there. The \(X_{\ell}\) norm tends to its datum sup norm
as \(\ell\downarrow0\), using the \(C\sqrt\ell\) bound on
the gradient seminorm. It therefore coincides on a short
interval with the E42 fixed point, by the completed-ball
uniqueness. No uniform lower bound on \(\ell_j\) is needed.

From any overlapping positive slice, the exact E36 equation
\[
 C_t=-[C,\phi]-\lambda d_A^{*g}d_A C-d_A d_A^{*g}C
\]
and its moving-metric energy propagate vanishing on
each compact subsequent interior interval of the smooth pair.
The approximate solutions converge uniformly on the closed
slab by the data estimate. In the curvature identity at
each slice, test the exterior derivative of \(a^j\) by the
fixed smooth formal adjoint. The quadratic brackets converge
uniformly. This proves distributional compatibility of the
limit, including the final continuous slice by continuity.
On the smooth interior the equality is pointwise.
[E36][e36] · [E38][e38] · [E42][e42].

## Scope of the refinement

The conclusion is a uniformly sized value neighborhood for
the fixed-reference local **adjusted pair** equation on each
specified compact positive range. The common time belongs
to one chosen smooth reference and its whole datum ball.
It can shrink when the reference changes. In particular
this refines the local input used by [E45][e45]. It does not
decide the separate geometric restart or extension implication
for an incoming original flow. Koch–Lamm arXiv:1310.3658v1
and Taylor 1991, §7.3, retain the methodological/technical
roles and recorded source inspections in E41/E42/E29. No
new source theorem, rough-coefficient heat result, or change
to those source records is used here.

[req]: ../research-progress/handoffs/SP4-CME-E138_REQUEST_v1.md
[b72]: ../brainstorm/notes/B72_UNIFORM_RADIUS_ENDPOINT_RESTART_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e38]: 38_CONTINUOUS_COMPATIBLE_DATA_20261122.md
[e41]: 41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e43]: ../reviews/E43_COMPACT_LINEAR_AUDIT_20261122.md
[e44]: ../reviews/E44_ROUGH_SYSTEM_AUDIT_20261122.md
[assess]: ../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[e45]: 45_ADJUSTED_VALUE_CONTINUATION_20261122.md

