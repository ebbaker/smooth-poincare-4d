# SP4-TWA-E29 · Three-axis Beltrami texture at the crossing

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The selected lead was GPT-6.2 Astra/ultra and
the configured bounded helper was GPT-6.2 Sol/ultra. Actual backend
model and effort telemetry were unavailable. Checkout
`7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`. All three input digests in
the [frozen request v1](../research-progress/handoffs/E29_REQUEST_v1.md)
matched.

The tested finite-amplitude ABC profiles yielded no strict witness.
The exact calculation below reduces the action within a norm-dependent
family and gives its relaxed quartic near the first shell. The finite
search used discretized local optimization.

## Exact action

Take the flat Riemannian product \([-1,1]\times(\mathbb R/\mathbb Z)^3\)
of volume two, with orientation \(dt\wedge dx_1\wedge dx_2\wedge dx_3\),
periodic spin lift and positive chirality as in [E14](E14_FIRST_NEGATIVE_MODE.md).
Here the parallel unit spinor is \(1\), and self-dual two-forms act on
the positive summand. Use \(S=J_g^4\) and the complete traces \(e^{\pm b}\)
at \(b=51\pi/16\). Set \(\omega=\pi/2\), \(T=\omega t\),
\(\beta=b/\omega=51/8\), and \(\nu=3\beta^2/4\). The spatial
derivatives with hats are divided by \(\omega\). Integrals continue to
use \(dt\,dx\).

For cyclic \((j,\ell,m)\), define
\[
 n_j=I_\ell\cos(2\pi x_j)+I_m\sin(2\pi x_j),\qquad
 N=\sum_j c_j n_j,\qquad R=\sum_j c_j^2.
\]
Independent axis phase shifts are torus translations. In the
quaternionic frame \(\widehat{\operatorname{div}}N=0\),
\(\widehat{\operatorname{curl}}N=-4N\), and
\(|\widehat\nabla N|^2=16R\). Write \(r=|N|^2\),
\(p=\widehat\nabla r\), \(d=|p|^2\), and \(m=p\cdot N\).
Consider
\[
 \psi=e^{bt+u(T,r)}(a(T,r)+f(T,r)N),\qquad
 \rho=a^2+f^2r>0 .
\]
Smooth real \(a,f,u\) with \(a=1,f=u=0\) at the two ends give smooth,
zero-free fields of the full required traces. Set
\[
 \begin{aligned}
 A&=a_T+(\beta+u_T)a,& F&=f_T+(\beta+u_T)f,\\
 C&=a_r+u_ra,& H&=f_r+u_rf .
 \end{aligned}
\]
The time derivative divided by \(\omega e^{bt+u}\) is \(A+FN\).
The rescaled spatial derivative in direction \(j\) is
\(Cp_j+Hp_jN+f\widehat\partial_jN\). The Dirac derivative in the
negative factor is
\[
 -A-Hm-(F+4f)N+Cp+Hp\times N.
\]
In the gradient norm, the cross term between
\(Hp_jN\) and \(f\widehat\partial_jN\) sums to \(Hf d\).
Apply the orthogonal projection identity
\(|P\psi|^2=|\nabla\psi|^2-|D\psi|^2/4\), the four-dimensional norm
identity of \(P=\Pi\nabla\). [Friedrich, §1, p. 59](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
The rescaled quotient \(Q=|P\psi|^2/(\omega^2|\psi|^2)\) splits as
\(Q=Q_{\rm e}+Q_{\rm o}\), with
\[
 \begin{aligned}
 Q_{\rm e}&=\rho^{-1}\left[
   \tfrac34(A^2+F^2r)-2Ffr-4f^2r
   +\left(\tfrac34(C^2+H^2r)+Hf\right)d+16Rf^2\right],\\
 Q_{\rm o}&=\frac{((F+4f)C-AH)m}{2\rho}.
 \end{aligned}
\]
Translation by \((1/2,1/2,1/2)\) changes the sign of \(N\) and \(m\)
and preserves \(r,p,d\). Thus
\[
 \frac{S[\psi]-S[e^{bt}]}{\omega^4}
 =\int_M(Q_{\rm e}^2+Q_{\rm o}^2-\nu^2)\,dt\,dx.
 \tag{1}
\]
For a unit spinor factor with \(u=0\), the prescribed-norm theorem
gives the nonnegative sign of (1) at every amplitude.
With \(R=r=1\) and \((a,f)=(\cos\theta,\sin\theta)\), (1) also
reduces to the one-wave density of E15, including its
\(-\partial_T(\sin^2\theta)\) term in \(Q_{\rm e}\).
[Prescribed norm](B08_PRESCRIBED_NORM.md) · [One-wave formula](E15_HELICAL_COMPETITOR.md)

## Exact small-amplitude controls

Take \(W=\cos T\,N\) in the first-shell kernel. In any smooth path in
this family through the radial field with tangent \(W\), the additive
second-order scalar correction is even under the simultaneous half
translation, and the possible imaginary correction is odd. The E18
linear quartic forcing of the imaginary correction is longitudinal,
along the gradient of a norm product mode. Those gradients are even.
The odd correction therefore has zero forcing and can add only the
nonnegative E14 Hessian contribution. For the equal perpendicular two
waves with unscaled \(c_1=c_2=1,c_3=0\), the forced scalar modes are the
constant spatial mode and \(m_{12}=\sin(2\pi x_1)\cos(2\pi x_2)\). Since
\(r=2(1+m_{12})\), this scalar relaxation lies within the original
norm-dependent family.

In the E18 quartic \(\mathcal I(z)\), set \(v_1=0\). Write
\(z=u_0(T)+u_1(T)m_{12}\) and \(K=\cos(2T)\), \(L=\sin(2T)\).
In the relaxed periodic time form domain, the exact minimizing scalar
coefficients, with the unforced mean of \(u_0\) arbitrary, are
\[
 \begin{aligned}
 u_{0,\rm per}&=\text{constant}-\tfrac{395}{918}K+\tfrac{14}{51}L,\\
 u_{1,\rm per}&=-\tfrac23-\tfrac{2027}{3366}K+\tfrac{382}{1683}L,\\
 \mathcal I_{\rm per}&=\tfrac{30263725}{67584}.
 \end{aligned}
\]
These values follow by minimizing the E18 scalar quadratic on the
constant, \(K,L\) modes. All other time frequencies have positive
quadratic energy and zero forcing. Choose the constant in \(u_0\) so
its two end values vanish. Both end values of \(u_{1,\rm per}\) are
\(d_*=-217/3366\). Its scalar quadratic energy is
\[
 \beta^2\int_{-1}^1\left(\tfrac{27}{32}|\partial_Tu_1|^2+9u_1^2\right)dt.
\]
The exact Dirichlet correction subtracts
\(d_*\cosh(\lambda T)/\cosh(\lambda\pi/2)\), where
\(\lambda=\sqrt{32/3}\). This function solves the homogeneous
Euler equation and shifts both ends by \(-d_*\). The periodic
minimizer is stationary against this equal-end correction, so the
increase is its quadratic energy. Integration by parts gives the
Dirichlet minimum
\[
 D_2=\frac{30263725}{67584}
 +\frac{27}{32}\beta^2 d_*^2\frac{4\lambda}{\pi}
     \tanh(\lambda\pi/2)
 =448.3868235\ldots .
 \tag{2}
\]
For comparison, with \(u=0\) and
\(a+fN=\exp(\varepsilon\cos T\,N)\), the two-wave coefficient is
\(1112653/2048\). It is obtained by substituting
\(z=-|W|^2/2\) into the E18 quartic. The two endpoints and scalar
Fourier controls use the E18 action coefficients with the original
Dirichlet traces. [Two-wave formulas](E18_TWO_HELICES.md)

The scalar forcing for general \(c_j\) is a linear combination of the
spatial mean and the three pairwise norm products. For each pair the
two signed spatial frequencies have squared length \(32\) in the
rescaled variables, and the three pairs have disjoint Fourier support.
Thus the minimizing scalar correction remains affine in \(r\) at fixed
\(T\). Equivalently the scalar minimization over all spatial profiles
produces exactly the same quartic within the norm-dependent family.
Independent phase shifts and permutations then give
\[
 \omega^{-4} q_{\rm scalar}(W)
 =A_1\sum_j c_j^4+(D_2-2A_1)\sum_{i<j}c_i^2c_j^2,
 \qquad A_1=\tfrac{12227}{6144}.
\]
The one-wave coefficient is the E15-amplitude minimum. In particular,
for \(c_j=1/\sqrt3\), the scalar-relaxed quartic is
\((D_2-A_1)/3=148.7989\ldots\) in units of \(\omega^4\).
For the unrelaxed \(u=0\) angle test the one-wave coefficient is
\(26609/2048\) and the pair coefficient is \(1059435/2048\).
The equal normalized coefficient is \(271511/1536=176.76497\ldots\).
The nearby field result from the full unrestricted quartic remains
the E23–E24 result. [Quartic symmetries](E23_NULLSPACE_QUARTIC.md) ·
[Local minimum](../reviews/E24_CROSSING_REPLAY.md)

## Finite profile search

The reported quantity is (1), in units of \(\omega^4\). Normalize
the indicated weights to \(\sum_jc_j^2=1\). Put \(s=T+\pi/2\) and
let \(y=r-1\). The polar angle parameterization was
\[
 a=\cos(\varphi\sqrt r),\qquad
 f=\frac{\sin(\varphi\sqrt r)}{\sqrt r},\qquad
 \varphi=\sum_{j=1}^{J}\sum_{\ell=0}^L
    v_{j\ell}\sin(js)y^\ell,\qquad
 u=\sum_{j=1}^{K}\sum_{\ell=0}^L
    w_{j\ell}\sin(js)y^\ell.
\]
The power series in \(r\) extends \(a,f\) smoothly at zero, and
\(a^2+f^2r=1\) exactly. The columns below fix the listed
\(v_{10}=\alpha\) and fit the other coefficients. The base fit used
\(J=3,K=4,L=1\) and initialized all free coefficients to zero. The
other tested \(\alpha\) values were \(0.2,0.9,1.8,2.4,4.5\).

| Weights before normalization | \(\alpha=0.05\) | \(\alpha=0.5\) | \(\alpha=1.35\) | \(\alpha=3.2\) |
| --- | ---: | ---: | ---: | ---: |
| \(1,1,1\) | 0.000928814 | 8.334632 | 316.151019 | 4141.098645 |
| \(1,1,0.3\) | 0.000755118 | 6.776465 | 253.477410 | 3338.058639 |
| \(1,0.3,0.3\) | 0.000383950 | 3.465263 | 112.335601 | 681.676052 |
| \(1,0.08,0.08\) | 0.000046993 | 0.481151 | 26.886864 | 470.824158 |
| \(1,0,0\) | 0.000012576 | 0.177882 | 20.378073 | 469.909774 |

The fitting quadrature had \(8^3\) equally spaced torus nodes and 14
Gauss–Legendre time nodes. The evaluation quadrature had \(20^3\)
torus nodes and 28 time nodes. With a Gauss–Legendre grid on \([-1,1]\)
and the time angle evaluated at each node, the weights in time sum to
two. The minimized function was implemented as
\((Q_{\rm e}-\nu)(Q_{\rm e}+\nu)+Q_{\rm o}^2-3\nu\beta u_T\).
The last term integrates to zero because the end traces of \(u\)
vanish. A dense BFGS iteration used complex-step gradient size
\(10^{-24}\), inverse Hessian initialization \(10^{-3}I\),
backtracking from step one with successive halving and Armijo
parameter \(10^{-4}\), and at most 65 updates. The target free
gradient sup norm was \(2\cdot10^{-7}\). The fixed-amplitude runs
that hit the iteration limit kept positive excess. Twenty-five
further fits freed every coefficient, using five independent
\(0.15\)-scale standard normal perturbations per weight triple with
NumPy generator seed 42429, adding \(0.5,1,1.5,2,2.5\) to the
leading coefficient and allowing 110 updates. All the resulting
excesses rounded to zero at nine decimal places and the leading
coefficients were near zero. Tiny roundoff-level values do not give
a strict sign.

With \(J=4,K=5,L=2\) and 18 time nodes in the fit, equal-weight
\(\alpha=0.2,1.35,3.2\) gave respectively \(0.232547445\),
\(299.8503214\), and \(3922.372803\) upon evaluation at \(24^3\)
torus nodes and 36 time nodes. The same values on \(16^3\) by 24
nodes differ by at most \(0.004\). For weights \(1,0.08,0.08\),
\(\alpha=0.2,0.9,2.4\) gave \(0.012058715,5.212349,210.249931\)
on the finer grid. Two of these fits reached the 85-update cap with
free gradient sup norm about \(7.7\cdot10^{-5}\) and
\(1.7\cdot10^{-3}\). For the one-wave control with \(L=0\), the same
three \(\alpha\) values gave \(0.003411693,2.900478,206.160284\).
When both \(\varphi,u\) were kept spatially constant (\(L=0\)),
equal weights and \(\alpha=0.05,0.2,0.9,2.4\) gave
\(0.001035199,0.261702355,89.645340,2209.750153\) after fitting the
remaining time coefficients with \(J=3,K=4\).
The corresponding unequal and one-wave checks were also positive.

The literal constant scalar family used \(a=1\),
\(f=\sum_{j=1}^3 v_{j0}\sin(js)\), and \(K=4\) for \(u\),
first spatially constant and then affine in \(r\). Here
\(\rho=1+f^2r\ge1\), and the action measurement still uses (1).
With \(v_{10}\) fixed in
\(0.05,0.2,0.5,0.9,1.35,2.4,4.5,10\), all 56 fits were positive
when evaluated at \(20^3\) by 28 nodes. Representative results for
the affine log amplitude appear below, using just the spatial
constant for the one-wave case where \(r=1\).

| Weights before normalization | \(v_{10}=0.05\) | \(v_{10}=0.5\) | \(v_{10}=2.4\) | \(v_{10}=10\) |
| --- | ---: | ---: | ---: | ---: |
| \(1,1,1\) | 0.000931603 | 6.863481 | 530.793385 | 7297.519540 |
| \(1,0.3,0.3\) | 0.000386879 | 2.830370 | 111.747707 | 355.726441 |
| \(1,0.08,0.08\) | 0.000050039 | 0.400394 | 26.956876 | 172.574025 |
| \(1,0,0\) | 0.000015634 | 0.155121 | 20.834428 | 161.500782 |

All finite profiles here are zero-free. The profiles share a fixed
spatial wave mixture and allow its spin angle, real component and
amplitude to depend on time and texture norm. These finite bases and
optimization starts cover only part of the smooth family. The further
grid evaluations track numerical error empirically. There is no
interval integration certificate, global search bound, or conclusion
about the unrestricted endpoint. [Endpoint question](../continuation-notes/CLOSING_B08_SLOPE_20261128.md)
