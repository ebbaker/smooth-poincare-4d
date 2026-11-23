# SP4-CME-E43 — Focused audit of the compact linear estimates

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I did not write E41. My earlier work
included the related reference audit and several geometric packets.
This is a proof audit within the same investigation. I read E41 in
full, matched all four frozen hashes and rechecked the calculations
below. The [request][req] and [return][ret] identify versions.

Both estimates in E41 (1) hold in the stated fixed-operator setting.
The compact kernel, energy argument, upper-cylinder estimate and
finite-norm extension all check. In the uniform-trace statements
at E41 lines 26 and 134, specify that the smooth approximating
forces are smooth through \(t=0\). The finite-norm distributional
trace is a genuinely weaker conclusion. The example below checks
this distinction. No missing analytic premise remains within the
specified linear setting. [Frozen E41][e41].

The fixed-pairing symbol is assumed Hermitian coercive on rank-one
spatial covectors. Take \(n=4\), \(p>6\), \(q=p/2\).
Keep the upper-cylinder weights \(r^{1-6/p}\),
\(r^{2-6/q}\), and \(r^{1-6/p}\) for \(Du,f,G\).
The tent weights are \(r^{-2},r^{-4},r^{-2}\) for their
respective \(L^2,L^1,L^2\) norms. I reopened the primary
Koch–Lamm preprint arXiv:1310.3658v1, 14 October 2013,
§2, printed pp. 4–5, on 22 November 2026. The printed upper
\(Y^0\) has the factor \(r\) outside and \(r^{-(d+2)/2}\)
inside the integral's \(1/q\) power. E41 uses the packet weights
rather than importing that expression. The kernel and upper
estimates here are verified using the displayed Fourier, energy
and decomposition arguments. No new external theorem is invoked
and no local PDF was saved. [Koch–Lamm v1][kl] · [Existing source record][source].

## Global kernel, causal series and adjoint

**Pass.** In a fixed chart write \(P_y(\xi)=P_0(y,\xi)\).
Expanding \(P_y(\xi+i\eta)\) changes the real Hermitian quadratic
form by at worst
\(-C(2|\xi||\eta|+|\eta|^2)|v|^2\), so it is bounded below
by \((c|\xi|^2/2-C'|\eta|^2)|v|^2\).
For \(z(t)=e^{-tP_y(\xi+i\eta)}v\),
\((|z|^2)'=-2\operatorname{Re}\langle P_y(\xi+i\eta)z,z\rangle\).
This bounds the matrix exponential on every intermediate
shifted contour without diagonalization. Shift the Fourier
integral in the direction \(\eta=\kappa z_0/t\), where \(z_0\)
is the kernel's spatial argument and \(\kappa>0\) is small.
The combined exponent in the shift factor is
\(-\kappa|z_0|^2/t+C'\kappa^2|z_0|^2/t\). It gives a
strict Gaussian. Entire matrix exponentials and the intermediate
Gaussian bound give vanishing side-face integrals by truncation.
For derivatives, \(\partial_{z_0}^{\alpha}\) inserts a
polynomial of degree \(|\alpha|\), and \(\partial_t^j\)
inserts \(P_y^j\) of degree \(2j\) before shifting.
Scale \(\xi\) by \(1/\sqrt t\); factors of \(|z_0|/\sqrt t\)
are absorbed in a slightly weaker Gaussian. The resulting
power is exactly \(t^{-2-|\alpha|/2-j}\) in E41 (3).

E41 uses chart frames to identify the two fibers of each
kernel term separately. The cutoffs make its zero extension
a smooth bundle kernel at positive time. Summing these
maps is a global operation. The \(y\) denominator cancels
the fixed coordinate density in the input integral.
Rescaling \(y=x-\sqrt t\,z_0\) in each chart gives a uniform
approximate identity on continuous sections by the Gaussian
tail and uniform continuity of the frozen symbol parameters,
sections and smooth factors. At the rescaled limit the
integral of the frozen kernel is \(I\), since its Fourier
multiplier is \(I\) at \(\xi=0\). The partition sum fixes the
initial input. Uniform two-sided Schur bounds and density
give the strong \(L^2\) approximate identity as well.

The residual contains \((P_0(x)-P_0(y))D_x^2k_y\) with a
factor \(O(|x-y|)\) in the chart and smooth connection,
density and cutoff terms of order at most one on \(k_y\).
Consequently \(|R|\le Ct^{-1/2}N_b\). After causal extension
\((\partial_t-L_x)K_0=\delta+R\), where the boundary term
\(\delta\) follows from the strong initial identity.
For a chain with \(m+1\) links,
\[
 d(x,y)^2\le
 \Big(\sum_i d_i\Big)^2\le t\sum_i d_i^2/\tau_i .
\]
Use half the Gaussian exponent for the endpoint bound.
In the remaining product discard the exponential on a
longest time link, whose prefactor is at most
\((m+1)^2t^{-2}\). Removing that link leaves two chains
that can be integrated from their free ends toward \(x\) and
\(y\), using one \(L^1\) bound for each remaining Gaussian.
The fixed metric has \(\int N_{b/2}\,d\nu\le C\) in both
variables. This step preserves one endpoint exponent for all
convolution orders.

With \(k=0,1\) derivatives on the first link only, the time
weights are \(\tau_0^{-k/2}\prod_{i=1}^m\tau_i^{-1/2}\).
The simplex dimension \(m\) gives the power \(t^{(m-k)/2}\).
The beta integrals give the quotient
\(\Gamma(1-k/2)\Gamma(1/2)^m/\Gamma(1-k/2+m/2)\).
Splitting the series into even and odd \(m\), the factorial
growth of the denominator dominates \(C^m(m+1)^2\) uniformly
for bounded \(t\). For \(k=0\), the sum of all correction
terms carries a factor \(\sqrt t\). For \(k=1\) the weight
on each link stays integrable, permitting the first
distributional spatial derivative and its continuous
representative for positive time. One can first truncate
each link away from zero and pass to the limit uniformly on
positive compact time intervals by the integrable simplex
majorant. The argument does not require differentiating a
second time through a \(\tau_0^{-1/2}\) convergence bound.

The telescoping identity applies \((\partial_t-L_x)\) in
distributions to the first link. With \(K\) summed through
order \(m\), the error is the signed \(R^{*(m+1)}\). The
Schur \(L^1\)-time norm of its causal convolution is bounded
by \(C^{m+1}T^{(m+1)/2}\Gamma(1/2)^{m+1}/
\Gamma(1+(m+1)/2)\), which tends to zero. This justifies
the distributional Cauchy equation and the common Gaussian
bound of E41 (5). The \(O(\sqrt t)\) correction in Schur
norm preserves both the uniform trace of continuous data
and the \(L^2\) trace of bounded measurable data.

Energy uniqueness applies on positive compact time intervals
because \(K(t)u_0\) and \(D K(t)u_0\) are bounded there and
the equation gives \(\partial_t u\in L^2H^{-1}\).
Time approximation of the weak pairing gives the energy
identity; (2) and the strong \(L^2\) initial trace give
uniqueness. The adjoint has array \(P_0^{ji*}\), hence the same
rank-one Hermitian form. Pair its Cauchy solution at \(t-s\)
with the original one at \(s\). The derivative of that pairing
is zero on interior intervals, since the two weak form terms
cancel. Passing to the strong traces gives the adjoint
kernel identity. Its first output derivative is the original
source derivative \(D_yK\). The Duhamel divergence contribution
therefore uses \(-D_yK\) with the fixed fiber pairing and
density. This obtains the source derivative without a
singular differentiation of the residual in \(y\).

## Sup norm and localized energy

**Pass.** Freezing the coefficients and density in the
energy form tests the constant array by Plancherel only at
gradient arrays \(i\xi\otimes\widehat v(\xi)\), where the
rank-one hypothesis applies. The variable coefficient form
differs by \(O(\operatorname{osc}P_0+\operatorname{osc}\rho)
\|\partial v\|_2^2\) on a small chart. The comparison
\(Dv=\partial v+\Gamma v\) costs a small gradient term and a
fixed \(L^2\) term. Let \(\sum\chi_\ell^2=1\) be a smooth
squared partition. In the form of \(\chi_\ell v\) both types
of linear cutoff cross term sum to zero by
\(\sum\chi_\ell d\chi_\ell=0\), even for nonsymmetric arrays.
The remaining cutoff terms are zeroth order. This proves
E41 (2) without a positivity condition on arbitrary gradient
arrays.

Set \(r=\sqrt t\). Each annulus of width \(r\) admits a cover
by at most \(C(a+2)^4\) radius-\(r\) balls, from packing
disjoint radius-\(r/4\) balls and volume comparison on the
fixed compact base. Extraction of part of \(e^{-bd^2/(t-s)}\)
gives \(e^{-c a^2}\) on each outer annulus. In the early
slab the kernels have sizes \(r^{-4}\) and \(r^{-5}\).
The local tent \(L^1\) mass of \(f\) is bounded by
\(r^4\|f\|_{Y_T^0}\). The tent \(L^2\) norm of \(G\) is
bounded by \(r^2\|G\|_{Y_T^1}\), and the square root of the
spacetime volume adds \(O(r^3)\) in its \(L^1\) bound. The
early powers therefore cancel separately.

In the late slab let \(h=t-s\). After Gaussian extraction
the spatial integral of the remaining exponential is
\(O(h^2)\). Thus the \(q'\)-th power for \(K\) is integrated
in \(h\) as \(h^{2-2q'}\), and the \(p'\)-th power for
\(D_yK\) as \(h^{2-(5/2)p'}\). Integrability is \(4q'<6\)
and \(5p'<6\), both equivalent to \(p>6\). Integrating
through \(h\lesssim r^2\) and taking roots gives the powers
\(r^{6/q'-4}\) and \(r^{6/p'-5}\). In the product with the
forcing norms the total exponents are
\[
 (6/q'-4)+(6/q-2)=0,\qquad
 (6/p'-5)+(6/p-1)=0.
\]
The annulus factors are summable. This verifies the sup
bound in (6) including the divergence estimate.

For the tent use \(X=\eta Du\) and \(Y=d\eta\otimes u\).
The diffusion term for testing by \(\eta^2u\) is
\(\operatorname{Re}\langle PX,X+2Y\rangle\); the integrated
Gårding lower bound tests \(D(\eta u)=X+Y\).
Their difference in absolute value is bounded by
\(C(|D(\eta u)||Y|+|Y|^2)\), so Young's inequality absorbs
the first factor even without symmetry. The divergence
forcing is tested against \(\eta D(\eta u)+\eta Y\) and costs
the same cutoff term and \(C\int|G|^2\) after absorption.
The lower-order form loss contributes \(C\int|\eta u|^2\).
The combined constant terms have size
\((1+r^{-2})r^2|B_{2r}|U^2=O(r^4U^2)\) for \(r\) small.
The \(f\) product is at most \(U\int|f|\).
Covering \(B_{2r}\) by a bounded number of radius-\(r\)
balls gives the respective \(r^4\|f\|_{Y_T^0}\) and
\(r^4\|G\|_{Y_T^1}^2\) in the right side of the squared
energy estimate. The initial energy is \(O(r^4\|u_0\|_\infty^2)\)
by the strong \(L^2\) trace. After division by \(r^4\) and a
square root, the mixed \(U\|f\|_{Y_T^0}\) is controlled by
the same linear sum. This is the tent bound in (1).

## Frozen singular integral and upper cylinders

**Pass.** For the constant operator \(H_*\), accretivity of
\(P_*(\xi)\) implies
\(\|(i\tau+P_*(\xi))^{-1}\|\le(c|\xi|^2)^{-1}\)
by taking the real part of the pairing with the input vector.
The multiplier with two powers of \(\xi\) is therefore
bounded on spacetime \(L^2\). It is the causal distributional
operator, as can be checked first with a factor \(e^{-\delta t}\)
on the heat kernel for \(\delta>0\) and then by bounded
multiplier convergence. Away from the spacetime origin its
kernel is the second spatial derivative of that heat kernel,
extended by zero to negative time. With
\(\varrho=\sqrt{|t|}+|x|\), (3) gives bounds
\(\varrho^{-6},\varrho^{-7},\varrho^{-8}\) for the kernel,
spatial derivative and time derivative. At \(t=0\) away
from the origin the Gaussian vanishes to every order.
For \(\varrho(z)>C\varrho(h)\), integrate along the segment
to obtain the difference bound
\[
 C\big(|h_x|\varrho(z)^{-7}+|h_t|\varrho(z)^{-8}\big)
 \le C\varrho(h)\varrho(z)^{-7}.
\]
Its integral over that region is \(O(1)\), since parabolic
ball volume grows as the sixth power. The difference bound
also holds for the adjoint kernel.

Dyadic rectangles split into 4 temporal and 16 spatial
children. In the decomposition at height \(\lambda\), the
good part has squared \(L^2\) norm \(O(\lambda\|F\|_1)\).
Each bad part has mean zero. Outside its fixed enlarged
rectangle its convolution has \(L^1\) norm \(O(\|F_{\rm bad}\|_1)\)
by subtracting the kernel at the rectangle center and using
the difference bound. Summing and counting the enlarged
volumes proves weak \((1,1)\). For clarity, strong
\(L^b\) with \(1<b<2\) follows by splitting \(F\) at a
multiple of \(\lambda\), applying the weak and \(L^2\)
bounds to the large and small parts, respectively, and
integrating their distribution estimates against
\(\lambda^{b-1}d\lambda\). The two inner \(\lambda\)
integrals after Fubini are proportional to
\(\int_0^{|F|}\lambda^{b-2}d\lambda\) and
\(\int_{|F|}^\infty\lambda^{b-3}d\lambda\).
Duality with the adjoint gives the requested \(p>6\).
The two-derivative convolution here is used as a bounded
singular integral, with a distributional multiplier at its
singularity.

For the nondivergence forcing \(g\) in (7), the first
derivative kernel on \(0<t<1\) is in spacetime \(L^{p'}\)
by the same calculation \(5p'<6\), now on Euclidean space.
The Young exponents satisfy
\(1+1/p=1/q+1/p'\). This proves (7) with the divergence
estimate just obtained. Zero initial data and causal source
extension make the result valid up to any earlier top time.

After rescaling \(x=x_0+r y\), \(t=r^2\tau\) in the chosen
chart, \(f_*=r^2 f\) and \(G_*=rG\), with the latter
components raised by the fixed smooth base metric if needed.
The variable principal divergence coefficient differs from
its frozen value on the cutoff support by \(O(r)\).
Coordinate density factors and connection matrices cost
terms \(O(r)\partial_y u\) and \(O(r^2)u\), and \(O(r)G_*\)
from the forcing divergence. With \(v=\eta u\), all cutoff
terms containing \(\partial u\), such as
\((\partial_i\eta)P_r^{ij}\partial_j u\), are written
as a divergence of a bounded coefficient times \(u\)
plus a bounded coefficient times \(u\).
Derivative bounds for the fixed coefficients on the scaled
chart and the fixed cutoffs bound all these coefficients.
The sole coefficient error multiplying \(\partial v\)
is inside a divergence with \(L^p\) norm at most
\(Cr\|\partial v\|_p\), absorbed for small \(T_0\).
The cutoff divergence of \(G_*\) adds a unit-cylinder
zeroth-order term in \(L^q\) by \(p>q\).
The coordinate contribution of \(D-\partial\) costs at
most \(CrU\) in the unit-cylinder norm.

The source terms after changing variables have factors
\(r^{2-6/q}\) and \(r^{1-6/p}\); the output gradient has
\(r^{1-6/p}\). Cover the enlarged spatial support by a
fixed number of radius-\(r\) balls for times \([r^2/2,r^2]\)
and radius-\(r/\sqrt2\) balls for \([r^2/4,r^2/2]\).
Both intervals are upper cylinders and the change of radius
costs only fixed factors. To cap the top time, the forcing
in the constant-coefficient equation is extended by zero
after an earlier top time; the solution is compared only
before that time. There is no derivative of a time jump in
the extended solution. Let that time increase to the slab's
top after absorption. All constants may depend on fixed
coefficient derivatives and the fixed atlas.

There is a separate positive-time regularity input to this
absorption for smooth forcing. Before CZ, (5) applied to
the undifferentiated smooth source \(f+\operatorname{div}_D G\)
gives \(H^1\) on positive compact slabs, since the first
output derivative costs \(h^{-1/2}\) in the spatial
integral. On smaller positive-time chart cylinders,
spatial difference quotients satisfy the translated
principal equation with a divergence source
\((\delta_hP_0)\partial u\) and smooth lower-order coefficient
contributions. The quotient's own \(L^2\) norm is bounded
by the known spatial \(H^1\) norm on the buffered chart.
Time cutoff and the local Gårding form bound give a uniform
\(L^2\) estimate for the spatial gradient of the quotient.
Iteration uses the differentiated coefficient terms on lower
spatial derivatives already controlled, giving all spatial
orders on nested positive-time slabs. The smooth equation
then supplies time derivatives successively. Sobolev embedding
on interior spacetime cubes follows directly by Fourier
Cauchy–Schwarz at high orders. This establishes the smoothness
needed in the cutoff calculation without assuming a
second derivative of the Levi series or the desired
upper-cylinder estimate.

## Finite-norm forcing and the meaning of the trace

**Pass, with the smooth class explicit.** Let smooth forces
in the definition of the smooth completion be smooth on the
closed time slab. Their \(f+\operatorname{div}_D G\) is bounded,
so the sup semigroup estimate makes the uniform zero initial
trace immediate. Convergence in the \(Y\) norms implies
convergence in the \(X_T\) sup component by (1), which preserves
this trace. The local gradient limits define the weak
gradient of the uniform limit by testing, giving completeness
and passage of the equation in the completion.

An arbitrary finite-\(Y\) pair belongs globally to \(L^1\oplus
L^2\) by the tents and a finite radius-\(\sqrt T\) cover.
After truncating to \(s\ge\delta\), it belongs globally to
\(L^q\oplus L^p\): use the finite dyadic time intervals
\((2^{-j-1}T,2^{-j}T)\) meeting \([\delta,T]\) and their
radius-\(\sqrt{2^{-j}T}\) covers. Approximate this truncation
strongly in \(L^q\oplus L^p\) with smooth pairs supported
above \(\delta/2\). Radii below \(\sqrt{\delta/2}\) see zero
forcing, so for the approximation fixed-\(\delta\) norm
comparisons imply convergence in \(Y\). Each truncation
has \(Y\) norm bounded by the original pair's norm. For
\(t\ge t_1>0\), the discarded integrals over \(s<\delta<t_1/2\)
are bounded uniformly in \(x,t\) by \(C(t_1)\) times their
\(L^1\) masses, using (5). These masses go to zero.
Weak compactness on each defining cylinder and distributional
identification of the gradients therefore give the same
\(X_T\) estimate for the limit. The equation holds by
distributional convergence.

For any smooth spatial \(\psi\), the formula
\(S^*(t)\psi=\psi+\int_0^t S^*(s)L^*\psi\,ds\) follows by
integrating the adjoint Cauchy equation and using its
uniqueness with the given trace. From (5),
\(\|D S^*(s)L^*\psi\|_\infty\le Cs^{-1/2}\|L^*\psi\|_\infty\),
so \(S^*(t)\psi\) stays uniformly \(C^1\) for small time.
Pairing the forcing solution with \(\psi\) gives an upper
bound \(C_\psi\int_0^t(\|f(s)\|_1+\|G(s)\|_1)\,ds\),
which tends to zero. This proves the distributional trace for
every finite-\(Y\) pair.

To check the uniform-trace boundary explicitly, take the
scalar flat \(\mathbb T^4\) Laplacian and \(G=0\).
For a nonzero nonnegative smooth bump \(\phi\) supported in
the Euclidean unit ball, set \(f(s,y)=s^{-1}\phi(y/\sqrt s)\)
in a fixed coordinate ball about \(0\), with zero extension
and \(T_0\) small. Its spatial \(L^1\) mass is \(Cs\), so
every radius-\(r\) tent mass is \(O(r^4)\).
On \((r^2/2,r^2)\), its spacetime \(L^q\) norm is
at most \(C r^{6/q-2}\) since the spatial \(q\)-th power
integral is \(C s^{2-q}\). Hence \(f\in Y_T^0\).
For \(s\in[t/2,3t/4]\) and \(y\) in the bump support,
the periodized Gaussian kernel at \((t-s,0,y)\) is at least
\(c t^{-2}\) from its central Gaussian term. Duhamel at
\((t,0)\) is at least \(c t^{-2}\int_{t/2}^{3t/4}s\,ds\),
a positive constant independent of \(t\). Thus uniform zero
trace fails for this finite-norm forcing, even though it is
smooth at positive times. This is consistent with E41 and
shows the importance of the closed-slab qualifier.

[req]: ../research-progress/handoffs/SP4-CME-E43_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E43_RETURN_v1.md
[e41]: ../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[kl]: https://arxiv.org/pdf/1310.3658v1#page=4
[source]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#rough-data-source--inspected-preprint-and-publication-metadata
