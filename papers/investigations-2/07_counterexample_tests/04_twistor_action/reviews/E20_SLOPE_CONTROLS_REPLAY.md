# SP4-TWA-E20 · Independent replay of the scalar estimates and one-wave control

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E20_REQUEST_v1.md)
records GPT-6.2 Astra/ultra as the author-selected lead and GPT-6.2 Sol/ultra
as the configured helper. Actual backend model and reasoning effort were
unavailable. HEAD was **280376dd7a1820fa2878d0ab0ee2e639facb2eeb**. All
twelve frozen digests matched. This reviewer authored none of E15, E16
or the B08 prescribed-norm comparison. The review uses E14 as a checked
input and checks the E17 identity and estimate needed for that comparison.

All three targets pass at their stated scopes. On the oriented flat
length-two cylinder with the periodic unit torus, use the real part of
the Hermitian positive half-spinor pairing, the orientation
\(dt\wedge dx_1\wedge dx_2\wedge dx_3\), and the Clifford square
\(X\cdot X=-|X|^2\). The action is \(S=J^4\) and the trace pair is
\(e^{-b}\sigma,e^b\sigma\), with \(\sigma\) parallel and unit.

## E15 · PASS · One helical wave and optimized log amplitude

Use the oriented quaternion model of the frozen note. On the positive
factor \(c(e_0)c(e_1)=\mathbf i\), and for the rotating imaginary
direction \(n=\mathbf j\cos(\lambda x_1)+\mathbf k\sin(\lambda x_1)\)
one has \(n_{x_1}=\lambda\mathbf i n\) and
\(\operatorname{curl}n=-\lambda n\), where \(\lambda=\pm2\pi\). Put
\(g=\cos\theta+\sin\theta\,n\), \(v=b+u'\), and \(\psi=e^{bt+u}g\).
The chiral Dirac quotient is
\(-vg-g_t+\mathbf i g_{x_1}=-(vg+g_t+\lambda\sin\theta\, n)\).
Since \(g\) and \(g_t\) are real orthogonal and
\((n,g)=\sin\theta,\ (n,g_t)=\theta'\cos\theta\), subtracting one
quarter of this squared norm from the gradient quotient gives
\[
 Q=\tfrac34\big(v^2+(\theta')^2+\lambda^2\sin^2\theta\big)
       -\tfrac\lambda2(v\sin^2\theta+\theta'\sin\theta\cos\theta),
 \qquad
 S=\int_{-1}^1 Q^2\,dt.
\]
In particular the total derivative term inside \(Q\) has its stated
sign and participates in the quartic coefficient of \(S\).

Write \(C=3/4\), \(\omega=\pi/2\), \(F=\cos(\omega t)\),
\(\theta=\varepsilon F\), and \(u=\varepsilon^2 w\) with zero end traces.
The expansions \(\sin^2(\varepsilon F)=\varepsilon^2F^2-\varepsilon^4F^4/3
+O(\varepsilon^6)\) and
\(\sin(\varepsilon F)\cos(\varepsilon F)
=\varepsilon F-2\varepsilon^3F^3/3+O(\varepsilon^5)\)
give the two coefficients of \(Q\) in the frozen calculation.
The coefficient of \(\varepsilon^2\) in the action is
\(2Cb^2[C(\omega^2+\lambda^2)-\lambda b/2]\), using
\(\int F^2=1\), \(\int (F')^2=\omega^2\), and
\(\int w'=\int FF'=0\). The lowering sign has \(\lambda b>0\),
and the first crossing in E14 gives
\(\lambda b=2C(\omega^2+\lambda^2)\). At this value set
\[
 q=-C\omega^2\cos(2\omega t)+(\lambda\omega/4)\sin(2\omega t),
 \qquad \ell=4Cbq-Cb^2\lambda F^2 .
\]
Then \(Q_2=2Cbw'+q\), and the coefficient of \(\varepsilon^4\) in the
action is \(I[0]+\int[6C^2b^2(w')^2+\ell w']\). Here \(I[0]=
C^2\omega^4+\lambda^2\omega^2/16+C^2b^2\omega^2/2\), since the sine
and cosine at \(2\omega=\pi\) each have squared norm one on the
time interval, \(\int F^4=3/4\), and \(\int F^3F'=0\).

The feasible \(w'\) have mean zero. Subtracting the mean of \(\ell\)
and completing the square gives the optimum
\(w_*'=-(\ell-\overline\ell)/(12C^2b^2)\). It is smooth and integrates
to a smooth zero-trace \(w_*\). The difference from \(I[0]\) is
\(-[(4C\omega^2+b\lambda/2)^2+\lambda^2\omega^2]/24\).
With \(|\lambda|=4\omega\), \(|b|=(51/8)\omega\) and \(\lambda b>0\),
the two exact terms in units of \(\omega^4\) are \(26609/2048\)
and \(4225/384\). The resulting optimized coefficient is
\(12227/6144\) times \(\omega^4\), or \(12227\pi^4/98304>0\).

For fixed \(\theta=\varepsilon F\), \(Q(v)\ge0\) is quadratic with
\(Q_{vv}=2C\). The second derivative of \(Q^2\) is
\(2Q_v^2+4CQ\), strictly positive except possibly at a single point
at any fixed \(t\). Thus \(Q^2\) is strictly convex in \(v\). At any
fixed \(b\ne0\), the pointwise equation
\(\partial_v Q^2=\kappa\) can be inverted smoothly near the base
uniformly over the compact time interval, since the \(v\)-derivative
there is \(12C^2b^2\). The derivative of \(\int v\,dt\) with respect
to \(\kappa\) is \(2/(12C^2b^2)\) at the base, and so the scalar
implicit function theorem imposes the exact constraint
\(\int v\,dt=2b\) smoothly. A tangent-line inequality for the
strictly convex integrand proves the resulting amplitude is the
unique global minimizer at that fixed angular test. The solution is
even in \(\varepsilon\) because the pointwise integrand and constraint
are even and the solution is unique. Its order-two derivative
correction is \(w_*'\) at the crossing by the multiplier equation.
Its order-four correction to \(v\) has zero mean and pairs with the
constant radial derivative \(4C^2b^3\), so it makes no contribution
to the displayed optimized quartic term.

The strictly positive quartic coefficient proves that at the crossing
every sufficiently small nonzero \(\varepsilon\) raises the action
in the prescribed family even after exact minimization in \(u(t)\).
This is a result for the one polarized wave with prescribed first
Dirichlet time profile. Mixtures of independent null directions,
general angular profiles and full nonlinear minimality at the
crossing are separate questions. [E15](../notes/E15_HELICAL_COMPETITOR.md)

## E16 · PASS · Translated localization and fixed-slope convergence

Talenti's printed theorem (1)–(2) on p. 353 at \(m=4,p=2\) has
\(q=4\), the gamma quotient \(6\), and prefactor
\(1/(2\sqrt{2\pi})\). The fourth power of the scalar constant is
therefore \(3/(32\pi^2)\). Density and Fatou give the compactly
supported \(H^1\) version of the printed inequality. For a real
spinor with zero end trace, extend by zero in time and periodically
in the three spatial variables. The norm of that lift has weak
gradient bounded by the norm of the spinor gradient and may be
multiplied by the translated cutoff for the scalar inequality.

For the product of the three truncated cosines
\(\theta(y)=\cos(\pi y/2)\) on \([-1,1]\), the fourth-power
periodization in each coordinate is \(h(y)=1-\sin^2(\pi y)/2\).
Applying concavity of the square root to the normalized density
\(|v|^4/\|v\|_4^4\) for each translation, then averaging over the
translations, gives the lower bound
\(\|v\|_4^2(\int_0^1\sqrt h)^3\) for the averaged squared localized
\(L^4\) norm. Put \(z=\sin^2(\pi y)/2\). The identity
\(1-z/2-\sqrt{1-z}=z^2/[2(1+\sqrt{1-z})^2]\) bounds this loss by
\((3-2\sqrt2)z^2\). The means of \(z,z^2\) are \(1/4,3/32\);
thus \(\int_0^1\sqrt h\ge s=(19+6\sqrt2)/32\).

The product cutoff has integrated square one, integrated squared
gradient \(3\pi^2/4\), and zero mixed coefficient
\(\int\chi\nabla\chi\). These follow from the integrals of \(\theta^2\),
\((\theta')^2\), and the compact support of \(\chi^2\). Unfolding the
translated cutoffs therefore proves
\[
 \|v\|_4^2\le \frac{C_E^2}{s^3}
       \big(\|\nabla v\|_2^2+(3\pi^2/4)\|v\|_2^2\big),\qquad
 C_E^4=3/(32\pi^2).
\]
Time Dirichlet Poincaré, \(\|v\|_2^2\le(4/\pi^2)\|\partial_tv\|_2^2\),
also yields \(\|v\|_4\le C_M\|\nabla v\|_2\),
\(C_M^2=4C_E^2/s^3\).

For \(A=\Pi(dt\otimes\cdot)\) and \(B=P+bA\), expansion gives
\[
 \|Bv\|_2^2=\tfrac34(\|\nabla v\|_2^2+b^2\|v\|_2^2)
            +\tfrac b2\int(v,Tv),\qquad T=\sum_j c_0 c_j\partial_j .
\]
The \(t\)-cross term integrates to zero. The torus symbol of \(T\)
has norm \(|\xi|\), with no zero-frequency term, so
\(|\int(v,Tv)|\le\|\nabla_Yv\|_2^2/(2\pi)\).
The E11 Taylor comparison subtracts at most
\(3(3b^2/4)\sqrt2\,\|v\|_4^2\) from this numerator. By localization
this costs \(\alpha b^2\) in the gradient and
\((3\pi^2/4)\alpha b^2\) in the mass, with
\(\alpha=9\sqrt3/(16\pi s^3)\). The net mass coefficient is
nonpositive because \(\pi^2\alpha>1\). Using the sharp time Poincaré
bound at this step gives the two coefficients
\[
 c_t(b)=\tfrac34-(4\alpha-3/\pi^2)b^2,\qquad
 c_Y(b)=\tfrac34-\alpha b^2-|b|/(4\pi).
\]

The elementary rational bounds stated in E16 imply
\(1373/1600<s<7/8\) and \(9/20<\alpha<99/200\); I checked the
substituted lower and upper rational fractions. These imply
\(4\alpha-3/\pi^2>22/15\) and \(c_t(2/3)>1/300\), while
\(c_Y(b)>3/4-(99/200)(9/16)-1/16>0\) for \(|b|\le3/4\).
Thus its strict sufficient radius
\[
 r_{\rm E16}=\sqrt{(3/4)/(4\alpha-3/\pi^2)}
\]
lies strictly between \(2/3\) and \(3/4\), with
\(\alpha\approx0.4894210613\), \(r_{\rm E16}\approx0.6734409967\).
The older E12 sufficient radius is below \(1/26\), since
\(\sqrt{3\sqrt2}>1\).

For fixed \(|b|<r_{\rm E16}\), write \(f=e^{-bt}\psi=\sigma+v\),
\(k^2=3b^2/4\), and \(\delta=J^2-k^2\sqrt2\). Hölder and the
E11 comparison give
\(\delta\|f\|_4^2\ge c_b\|\nabla v\|_2^2\),
\(c_b=\min(c_t,c_Y)>0\). This comparison allows finitely many
compatible transverse interior zeros since the quotient is bounded
near those zeros and the Hölder step disregards the finite set.
Equality gives \(v=0\) by the traces and the action equals \(9b^4/8\).
For a minimizing sequence at this fixed \(b\), \(\delta\to0\) and
\(\|f\|_4\le2^{1/4}+C_M\|\nabla v\|_2\). Absorbing
\(C_M\sqrt\delta\,\|\nabla v\|_2\) gives convergence to zero of
\(\|\nabla v\|_2\). Poincaré and multiplication by the fixed
\(e^{bt}\) give strong convergence of the original spinors in
\(H^1\). This also covers \(b=0\). The proof uses a positive
margin in the strict range, with the time margin vanishing at
its endpoint. [E16](../notes/E16_GLOBAL_SLOPE_BOUND.md)

## B08 · PASS · Exact transition at prescribed pointwise norm

In this class \(\psi=e^{bt}g\) with \(|g|=1\) and trace \(\sigma\).
In particular these fields are smooth and zero-free. Let \(w=g-\sigma\),
\(T=\sum_j c_0c_j\partial_j\), and \(Q=|P\psi|^2/|\psi|^2\).
Expanding the Dirac square, its crossed term is
\(-2b(g,Tg)\), by Clifford skew-adjointness. Using the integrated
flat identity \(\|Dg\|_2^2=\|dg\|_2^2\) on \(g-\sigma\) and
periodicity in \(\int(\sigma,Tw)\) gives
\[
 \int_M Q-\tfrac32b^2=\tfrac34\|dg\|_2^2+\tfrac b2\int_M(w,Tw).
\]
For \(w\) with zero trace, the Hermitian torus symbol \(T_\xi\)
has absolute value \(|\xi|\). On each nonzero mode
\((|\xi|^2+(\pi/2)^2)/|\xi|\) is at least
\(B=17\pi/8\), since its minimum over the lattice is at \(|\xi|=2\pi\).
The zero mode retains its full time Poincaré bound, giving
\[
 \|dg\|_2^2-B|\textstyle\int_M(w,Tw)|
 \ \ge\ (\pi/2)^2\|w_0\|_{L^2_t}^2,
\]
where \(w_0\) is the spatial mean. If \(w_0=0\), the pointwise
identity \(|w|^2=-2(\sigma,w)\), integrated in the torus, gives
\(w=0\). Therefore
\[
 \int_M Q-\tfrac32 b^2
 \ge \left(\tfrac34-\frac{|b|}{2B}\right)\|dg\|_2^2
       +\frac{|b|(\pi/2)^2}{2B}\|w_0\|_{L^2_t}^2 .
\]
This gives strict inequality for nonconstant \(g\) below and at
\(b_{\rm H}=3B/2=51\pi/16\) in absolute slope, including \(b=0\)
via the first term. On the cylinder of volume two,
\(S=\int Q^2\ge(\int Q)^2/2\), so the unique minimizer in this
class throughout \(|b|\le b_{\rm H}\) is the radial field.

Above \(b_{\rm H}\), choose the E14 first-time, first-spatial-mode
eigendirection \(w_*\), imaginary and of the helicity lowering
the action. The curve \(g_\varepsilon=(\sigma+\varepsilon w_*)/
|\sigma+\varepsilon w_*|\) is smooth and has the exact same unit
norm and boundary trace. Its tangent is \(w_*\), and its acceleration
has zero end trace. Unconstrained stationarity therefore removes the
acceleration contribution, and the constrained second derivative of
the action is the strictly negative E14 Hessian on \(w_*\).
A sufficiently small nonzero \(\varepsilon\) gives strictly smaller
cost. The transition class permits arbitrary angular dependence with
the specified pointwise norm. In the full class, a cheaper field at
or below \(b_{\rm H}\) would have to depart from that norm in the
interior. [B08 prescribed norm](../notes/B08_PRESCRIBED_NORM.md)
· [E17 polar estimate](../notes/E17_POLAR_LOWER_BOUND.md)
· [E14 Hessian input](../notes/E14_FIRST_NEGATIVE_MODE.md)

## Sources and disposition

I checked the twelve frozen inputs and the relevant live-register
scope. Friedrich's published §1, p. 59, projection and equation
(1.1) supply the twistor convention. Talenti's published p. 353,
theorem (1)–(2), was inspected in the printed scan for the scalar
Euclidean constant. The signs, arithmetic, localization estimates,
relaxation argument and prescribed-norm comparison above were
recomputed for the stated cylinder. No correction is required in
the three frozen targets. [Friedrich](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
· [Talenti](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1)
