# SP4-CME-E39 — continuous heat data with a nonintegrable uniform Hessian

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This is the finite flat test in the
[E39 request][request] under the [B32 decision][decision].
Frozen versions are in the [return][return].

## Gaussian estimates and the Dini sufficient condition

Use the flat torus \(\mathbb T^4=\mathbb R^4/\mathbb Z^4\) of side one,
its quotient distance \(d\) and its Lebesgue volume of total mass one.
Derivatives, the gradient norm and the Frobenius Hessian norm are those
of the fixed flat metric. For a continuous real scalar \(f\), let
\[
 \omega_f(r)=\sup_{d(x,y)\le r}|f(x)-f(y)|,\qquad r\ge0 .
\]
This function is nondecreasing, tends to zero at \(r=0\), and saturates
at the diameter. The Dini condition is
\(\int_0^1 \omega_f(r)\,dr/r<\infty\).

Let \(G_t(z)=(4\pi t)^{-2}e^{-|z|^2/(4t)}\) on \(\mathbb R^4\),
and extend \(f\) periodically to \(\widetilde f\) on \(\mathbb R^4\).
Then \(H_t f\) is \(G_t*\widetilde f\) on the quotient. The Gaussian
integrates to one and satisfies \(\partial_tG_t=\Delta G_t\) directly.
Its derivatives are integrable for each \(t>0\), so this convolution
is smooth at positive time, solves the heat equation, and attains
\(f\) uniformly using uniform continuity and Gaussian tail decay.
Equivalently one uses the periodization
\(\sum_{n\in\mathbb Z^4}G_t(x-y+n)\) on a fundamental domain.
The periodic series and its fixed-positive-time derivatives converge
absolutely by Gaussian decay.

Each entry of \(D^2G_t\) has zero integral over \(\mathbb R^4\) by
Gaussian decay and integration of a derivative. Therefore
\[
 D^2H_t f(x)
  =\int_{\mathbb R^4}D^2G_t(z)
       \bigl(\widetilde f(x-z)-\widetilde f(x)\bigr)\,dz .
 \tag{1}
\]
Let \(R=\sqrt t\). The straight segment in the lift from \(x\) to \(x-z\)
can be subdivided into at most \(1+|z|/R\) segments of length at most
\(R\), so the difference in (1) is bounded by
\((1+|z|/R)\omega_f(R)\). With
\(C_2=\int_{\mathbb R^4}|D^2G_1(z)|(1+|z|)\,dz<\infty\),
Gaussian scaling gives the pointwise-in-time bound
\[
 \|D^2 H_t f\|_\infty\le C_2 t^{-1}\omega_f(\sqrt t).
\]
In particular, for \(0<T\le1\),
\[
 \int_0^T\|D^2 H_t f\|_\infty\,dt
 \le 2C_2\int_0^{\sqrt T}\frac{\omega_f(r)}{r}\,dr .
 \tag{2}
\]
The subdivision bound covers the whole Gaussian tail, so this form
needs no separate large-scale term. Equation (2) is a finite
sufficient estimate under the Dini condition. For continuous data
without that condition the right-hand side may be infinite.

The gradient is controlled without any modulus. With
\(C_1=\int_{\mathbb R^4}|\nabla G_1(z)|\,dz<\infty\),
differentiating the convolution gives
\[
 \|\nabla H_t f\|_\infty\le C_1 t^{-1/2}\|f\|_\infty,\qquad
 \int_0^T\|\nabla H_t f\|_\infty\,dt
        \le 2C_1\sqrt T\,\|f\|_\infty .
 \tag{3}
\]
Both constants depend only on the stated dimension, normalization
and tensor norms.

## A continuous non-Dini example

In the fundamental domain centered at zero use the Euclidean
coordinate ball of radius \(1/4\). Fix any nonnegative nonzero
\(\psi\in C_c^\infty(B_1(0))\) on \(\mathbb R^4\). For integers \(j\ge3\)
choose
\[
 x_j=2^{-j} e_1,\qquad
 r_j=2^{-j^2-4},\qquad a_j=1/j .
\]
Thus the fixed separation integer of the request is \(L=4\).
Extend \(f_j(x)=a_j\psi((x-x_j)/r_j)\) smoothly by zero and put
\(f=\sum_{j\ge3}f_j\). For \(j\ne k\),
\(|x_j-x_k|\ge2^{-(\min(j,k)+1)}\), while
\(r_j+r_k\le 2^{-\min(j,k)-3}\) because
\(r_\ell\le2^{-\ell-4}\). The supports are disjoint and lie in
the coordinate ball. They avoid the origin. A tail of the series
has supremum at most \(\|\psi\|_\infty/(J+1)\) when it starts
after \(J\), so convergence is uniform and \(f\) is continuous
with \(f(0)=0\). In particular \(\|f\|_1<\infty\).

To verify the non-Dini property directly, choose \(y_*\in B_1(0)\)
with \(\psi(y_*)=m>0\). The two points
\(x_j+r_j y_*\) and \(x_j+2r_j e_2\) are at distance at most \(3r_j\).
The latter is outside all supports. Indeed its distance from
its own center is \(2r_j\) and its displacement from \(x_j\) is
less than the distance from \(x_j\) to any other support.
Hence \(\omega_f(3r_j)\ge m/j\). For large \(j\), on the successive
intervals \([3r_j,3r_{j-1}]\) monotonicity yields
\[
 \int_{3r_j}^{3r_{j-1}}\frac{\omega_f(r)}r\,dr
 \ge \frac{m}{j}\log\frac{r_{j-1}}{r_j}
 =\frac{m}{j}(2j-1)\log 2 .
\]
Their sum diverges.

## Own bump, other bumps and periodic images

Use the time window \(I_j=[r_j^2,2r_j^2]\) and evaluate the
\(11\)-entry of the Hessian at \(x_j\). The derivative of the
Euclidean kernel is
\[
 \partial_{11} G_t(z)
  =\left(\frac{z_1^2}{4t^2}-\frac1{2t}\right)G_t(z).
\]
For the own bump with the unshifted kernel, \(|z|\le r_j\) and
\(t\in I_j\). Thus the displayed parenthesis is at most
\(-1/(4t)\le-1/(8r_j^2)\) and
\(G_t(z)\ge (8\pi)^{-2}r_j^{-4}e^{-1/4}\).
Since the bump is nonnegative, this contribution is at most
\[
 -c_\psi\,\frac{a_j}{r_j^2},\qquad
 c_\psi=\frac{e^{-1/4}}{8(8\pi)^2}\int_{\mathbb R^4}\psi(y)\,dy>0 ,
 \tag{4}
\]
by changing spatial variables to the unit-radius bump.

For the remaining terms use the elementary Gaussian majorant
\[
 |\partial_{11}G_t(z)|\le C_3 t^{-3} e^{-|z|^2/(8t)},
 \tag{5}
\]
where \(C_3\) is finite and universal. This follows by absorbing
\(1+|z|^2/t\) into half the Gaussian exponent. For any other bump
\(f_k\) and any point \(y\) in its support, the unshifted distance
from \(x_j\) is at least
\[
 |x_j-x_k|-r_k
 \ge \left(\tfrac12-\tfrac1{16}\right)2^{-\min(j,k)}
 \ge d_j,\qquad d_j=2^{-j-2}.
\]
Consequently the absolute value of the sum of all unshifted
other-bump contributions is at most
\[
 C_3\|f\|_1 r_j^{-6}
               \exp\!\left(-\frac{d_j^2}{16r_j^2}\right)
 \quad (t\in I_j).
 \tag{6}
\]
Here \(t^{-3}\le r_j^{-6}\), and \(t\le2r_j^2\) was used in the exponent.

For the periodic images, write the periodized kernel using
the shifts \(n\in\mathbb Z^4\). If \(n\ne0\), then
\(|x_j-y+n|\ge |n|-1/2\ge |n|/2\), since both \(x_j\) and the
support of \(f\) are in the coordinate ball of radius \(1/4\).
For \(0<t\le1\),
\[
 \sum_{n\ne0} e^{-|n|^2/(32t)}
 \le e^{-1/(64t)}\sum_{n\ne0}e^{-|n|^2/64}.
\]
The last sum is finite by factorization into one-dimensional
Gaussian series. Using (5), the resulting bound for all the
nonzero-shift terms, including images of the own bump, is
\[
 C_4\|f\|_1 r_j^{-6}
              \exp\!\left(-\frac{1}{128r_j^2}\right)
 \quad(t\in I_j)
 \tag{7}
\]
with \(C_4\) independent of \(j\). Estimates (6)–(7) justify
taking absolute values of the entire remaining sum, not only
of an individual bump.

Divide the sum of (6)–(7) by \(a_j/r_j^2\).
The prefactor is bounded by a constant times \(j r_j^{-4}\).
The exponent \(d_j^2/(16r_j^2)\) grows like
\(2^{2j^2-2j}\) times a fixed positive constant, and
\(1/(128r_j^2)\) grows faster still. These dominate the
logarithm of the prefactor, which is \(O(j^2)\). It follows
that (6)–(7) together are at most half the magnitude in (4)
for all sufficiently large \(j\), uniformly on \(I_j\).
Therefore
\[
 \|D^2H_t f\|_\infty
   \ge |\partial_{11}H_t f(x_j)|
   \ge \frac{c_\psi a_j}{2 r_j^2}
 \qquad (t\in I_j,\ j\text{ sufficiently large}).
\]
The windows are disjoint because
\(2r_{j+1}^2/r_j^2=2^{-4j-1}<1\). They tend to zero and have
length \(r_j^2\). For every \(T>0\), all sufficiently late
windows are contained in \((0,T]\). Their contributions are
at least \(c_\psi/(2j)\) each, so
\[
 \int_0^T\|D^2H_t f\|_\infty\,dt=\infty
 \qquad (T>0).
\]

## Scope of the failure

For \(X_t=\nabla H_t f\), (3) gives integrable uniform
velocity near zero, whereas \(DX_t=D^2H_t f\) has
nonintegrable uniform norm. This rules out the implication
from continuous scalar data and standard heat smoothing to
the time-integrable uniform Hessian condition in a direct
\(C^1\) ordinary-flow estimate. Dini continuity supplies that
condition by (2).

The scalar data impose no curvature or connection constraint.
The estimate does not decide whether the ordinary flow
associated with this \(X_t\) has a limit, whether another
derivative estimate is possible, or whether the actual
geometric gauge can be recovered. The geometric continuous
endpoint data and the smooth automorphism correspondence
enter only as the motivation for this sufficient-condition
test. [E24 endpoint control][endpoint] · [E28 correspondence][gauge].

[request]: ../research-progress/handoffs/SP4-CME-E39_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E39_RETURN_v1.md
[decision]: ../brainstorm/notes/B32_GAUGE_DERIVATIVE_MODEL_20261122.md
[endpoint]: 24_TEMPORAL_BOOTSTRAP_20261122.md
[gauge]: 28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
