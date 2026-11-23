# E91 — Frozen periodic shear and horizontal derivative growth

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
This packet computes B53's frozen model. I did not author E79, E53
or E88. The model computation does not use E88 as an accepted theorem.
[Frozen request][req] · [B53][b53].

**Result.** The proposed splitting is exact with mean-zero vertical
parameter and zero residual. For \(n\) dyadic and
\(\epsilon_n=n^{-3/4}\), the full critical pair norm is comparable
to \(n^{-1/4}\). The horizontal derivative has sup norm \(n^{1/4}\)
for one fixed forcing. This excludes a uniform horizontal \(C^1\)
estimate for this frozen solver under full-pair critical smallness.

## Fixed model and volume-preserving shear

Use the oriented flat torus
\(M=(\mathbb R/(2\pi\mathbb Z))^4\), with coordinates
\(x^1,\ldots,x^4\), orthonormal coframe \(dx^i\), dual vector
fields \(e_i\), and volume \(dx^{1234}\). Write \(dx^{ij}=dx^i\wedge dx^j\).
The internal Euclidean space has a fixed oriented orthonormal basis
\(q_1,q_2,q_3\); all form, tensor and adjoint norms are fixed flat
and Euclidean unless stated otherwise. Choose the self-dual triple
\[
 (F_{0,1},F_{0,2},F_{0,3})
   =\frac1{\sqrt2}
       \bigl(dx^{12}+dx^{34},\
             dx^{13}-dx^{24},\
             dx^{14}+dx^{23}\bigr).
\]
Each form has norm one, and
\(F_{0,i}\wedge F_{0,j}=\delta_{ij}\,dx^{1234}\).
The reference contraction is \(S_0u=\iota_uF_0\), with
\(F_0\) the three-component two-form. Put
\(u_0=e_1\), \(v=e_2\), \(\xi=dx^1\) and \(r_0=S_0u_0\).
Direct contraction gives
\[
 r_0=\tfrac1{\sqrt2}(dx^2,dx^3,dx^4),\qquad
 S_0v=\tfrac1{\sqrt2}(-dx^1,-dx^4,dx^3),\qquad
 (S_0v)(u_0)=-q_1/\sqrt2 .
\]
For integer \(n\ge1\) let \(f_n(x^1)=(\epsilon_n/n)\sin(nx^1)\)
and \(a_n=f_n S_0v\). Then the prescribed two-form difference is
\[
 \beta_n=da_n
     =\tfrac{f_n'}{\sqrt2}(0,-dx^{14},dx^{13}),\qquad
 F_\theta=F_0+\theta\beta_n .
\]

The shear \(\Psi_\theta(x)=x+\theta f_n(x^1)v\) is globally
well-defined on the torus and its inverse is \(\Psi_{-\theta}\),
since \(x^1\) stays fixed. Its derivative is
\(D\Psi_\theta=I+\theta f_n' v\otimes dx^1\), with determinant
one and inverse \(I-\theta f_n'v\otimes dx^1\).
Pulling back the displayed triple replaces \(dx^2\) by
\(dx^2+\theta f_n' dx^1\) and leaves the other covectors fixed.
It gives \(F_\theta=\Psi_\theta^*F_0\) exactly, including the
two signs in \(\beta_n\). Thus
\(F_{\theta,i}\wedge F_{\theta,j}=\delta_{ij}\,dx^{1234}\).
This is a positive definite triple in the same orientation.
It is orthonormal self-dual for the live flat pullback metric
\(\Psi_\theta^*g_{\rm flat}\). The solver adjoints below use the
original fixed flat metric.

## Exact decomposition and uniqueness of the weak inverse

For \(S_\theta u=\iota_uF_\theta\), define
\[
 C_\theta=S_0^*S_\theta,\qquad H_\theta=C_\theta^{-1}S_0^*,
 \qquad \Pi_\theta=I-S_\theta H_\theta,\qquad
 K_\theta=d^*\Pi_\theta d .
\]
Contraction by each \(F_{0,i}\) is a quaternionic isometry
on vectors with scale \(1/\sqrt2\), so \(S_0^*S_0=3I/2\).
For any covector \(\zeta\), the three contractions
\(\iota_{\zeta^\sharp}F_{0,i}\) have pairwise orthogonal
values of norm \(|\zeta|/\sqrt2\). Hence for
\(w_\zeta e=\zeta\otimes e\) one has
\(|S_0^*w_\zeta e|^2=|\zeta|^2|e|^2/2\) and
\(w_\zeta^*\Pi_0w_\zeta=(2/3)|\zeta|^2 I\).
The torus Fourier formula therefore gives exactly
\(K_0=(2/3)d^*d=-(2/3)\sum_i\partial_i^2\).
This specifies the nonnegative Laplacian sign. The kernel
\(N\) is the space of constant internal vectors.
[E79, fiber and weak splitting][e79].

Since \(\|\theta\beta_n\|_\infty=|\theta|\epsilon_n\),
\(C_\theta\) is invertible for \(|\theta|\le1\) and
\(\epsilon_n\) sufficiently small, with uniformly bounded
inverse. Smooth matrix inversion or a Neumann series gives
\(\|\Pi_\theta-\Pi_0\|_\infty\le C|\theta|\epsilon_n\).
The identities \(H_\theta S_\theta=I\) and
\(S_0^*\Pi_\theta=0\) show that \(\Pi_\theta\) is the projection
onto the fixed \(\ker S_0^*\) along \(\operatorname{im}S_\theta\).

On \(V_0=H^1(M;\mathbb R^3)\cap N^\perp\) the Fourier
gap for nonzero lattice frequencies makes \(K_0\) coercive,
with form \((2/3)\|d\phi\|_2^2\). Thus \(K_0:V_0\to Z_0\)
is bounded invertible, where \(Z_0\subset H^{-1}\) annihilates
the constants. For the weak operator
\(\langle K_\theta\phi,\eta\rangle=(\Pi_\theta d\phi,d\eta)_2\),
the range lies in \(Z_0\) because the derivative of a constant
test is zero. The operator difference has norm at most
\(C|\theta|\epsilon_n\) from \(V_0\) to \(Z_0\). The Neumann
series around \(K_0\) gives a uniformly bounded inverse there
for small \(\epsilon_n\), with no derivative bound on \(\Pi_\theta\).
This is the same weak perturbation mechanism as E79 in the
frozen model.

The exact candidate fields are
\[
 \phi_\theta=\theta f_n(S_0v)(u_0)
            =-\tfrac{\theta f_n}{\sqrt2}q_1,\qquad
 u_\theta=u_0-\theta f_n'v,\qquad s_\theta=0 .
\]
They satisfy \(D\Psi_\theta\,u_\theta=u_0\), so by contraction
naturality
\[
 S_\theta u_\theta=\Psi_\theta^*r_0
       =r_0+\tfrac{\theta f_n'}{\sqrt2}\,dx^1q_1,\qquad
 d\phi_\theta=-\tfrac{\theta f_n'}{\sqrt2}\,dx^1q_1 .
\]
Consequently \(r_0=d\phi_\theta+S_\theta u_\theta+s_\theta\).
All three conditions hold: \(\phi_\theta\) has mean zero, and
\(S_0^*s_\theta=d^*s_\theta=0\). To check selection by the
actual frozen weak inverse, apply \(d^*\Pi_\theta\) to a
potential splitting. This forces
\(K_\theta\phi=d^*\Pi_\theta r_0\), since
\(\Pi_\theta S_\theta=0\), and \(\Pi_\theta s=s\) for a
fixed-slice residual. The unique mean-zero solution is
the displayed \(\phi_\theta\). Applying \(H_\theta\)
then gives \(u_\theta\) and the remaining term is unique.
The specified identity involves no first-variation truncation.

## Frequency, value and Lorentz norms

Set \(\theta=1\). Use the E53 Fourier cutoff on the integer
mode indices of the period-\(2\pi\) torus, with modes
\(e^{ik\cdot x}\). Use its inhomogeneous \(B^s_{8,1}\) sum
and the flat period-\(2\pi\) Lebesgue measure. The different
fixed period only changes overall constants compared with
a unit torus. For \(n=2^j\), \(j\ge1\), the two nonzero
modes \(k=\pm n e_1\) of \((a_n,\beta_n)\) lie entirely in
the \(j\)-th block for this cutoff: the symbol there is
\(\chi(1)-\chi(2)=1\) and all other blocks vanish at those
frequencies. Using the Euclidean direct-sum norm,
\[
 \|(a_n,\beta_n)\|_{B^{1/2}_{8,1}}
     =n^{1/2}\|(a_n,\beta_n)\|_8 .
\]
Pointwise \(|a_n|=\sqrt{3/2}(\epsilon_n/n)|\sin(nx^1)|\)
and \(|\beta_n|=\epsilon_n|\cos(nx^1)|\).
The distribution of either absolute trigonometric mode on
the fixed torus is independent of integer \(n\). The lower
bound from \(\|\beta_n\|_8\) and the upper bound from
\(\|a_n\|_8+\|\beta_n\|_8\) therefore give constants \(c,C>0\)
independent of \(n,\epsilon_n\), with
\[
 c\epsilon_n n^{1/2}\le
   \|(a_n,\beta_n)\|_{B^{1/2}_{8,1}}
 \le C\epsilon_n n^{1/2}.
\]
In particular this tends to zero as \(n^{-1/4}\) for the
prescribed \(\epsilon_n=n^{-3/4}\).
[E53, cutoff and dyadic norm][e53].

For \(\|u\|_{C^1}=\|u\|_\infty+\|Du\|_\infty\) the exact values
are
\[
 \|u_1\|_\infty=\sqrt{1+\epsilon_n^2},\qquad
 \|u_1-u_0\|_\infty=\epsilon_n,\qquad
 \|Du_1\|_\infty=n\epsilon_n,\qquad
 \|u_1-u_0\|_{C^1}=(1+n)\epsilon_n .
\]
The \(C^1\) norms of both \(u_1\) and its difference from
the reference are comparable to \(n^{1/4}\) along this sequence.
Their \(C^0\) behavior is uniformly bounded, with the
difference tending to zero. The value size of the coefficient
pair is exactly
\(\|a_n\|_\infty+\|\beta_n\|_\infty
=\epsilon_n(1+\sqrt{3/2}/n)\).

For clarity about Lorentz sizes, let \(\mathsf V=(2\pi)^4\)
and use \(\|w\|_{4,1}=\int_0^{\mathsf V}s^{-3/4}w^*(s)\,ds\)
for the rearrangement of the fixed flat norm. Let
\(L_*=\||\cos x^1|\|_{4,1}=\||\sin x^1|\|_{4,1}>0\).
By equidistribution the following exact values hold:
\[
\begin{array}{c|c}
 \text{quantity}&L^{4,1}\text{ norm}\\ \hline
 a_n & \sqrt{3/2}\,(\epsilon_n/n)L_*\\
 \beta_n & \epsilon_n L_*\\
 \phi_1 & \epsilon_n L_*/(\sqrt2 n)\\
 d\phi_1 & \epsilon_n L_*/\sqrt2\\
 u_1-u_0 & \epsilon_n L_*\\
 Du_1 & n\epsilon_n L_*
\end{array}
\]
The low-order horizontal norm is uniformly bounded and
converges to its constant-reference size since
\(1\le |u_1|\le\sqrt{1+\epsilon_n^2}\).
The strong derivative grows in Lorentz norm as well as
in sup norm. This behavior is consistent with a low-order
horizontal estimate of the type considered in E88.
[E88, endpoint scope][e88].

The original forcing \(r_0\) is fixed, with pointwise norm
\(\sqrt{3/2}\). Its flat \(L^2\), \(L^{4,1}\),
\(B^{1/2}_{8,1}\) and \(C^1\) norms are respectively
\(\sqrt{3/2}\mathsf V^{1/2}\), \(4\sqrt{3/2}\mathsf V^{1/4}\),
\(\sqrt{3/2}\mathsf V^{1/8}\) and \(\sqrt{3/2}\).
It lies in the fixed low block. The projected scalar forcing
\(d^*\Pi_\theta r_0\) is a different object and can depend on the
coefficient. It even tends to zero in \(H^{-1}\) since
\(\Pi_0r_0=0\) and \(\|\Pi_\theta-\Pi_0\|_\infty\to0\).

## Exact scope of the obstruction

This rules out any horizontal \(C^1\) bound for the selected
frozen weak inverse that is uniform on a small full-pair
\(B^{1/2}_{8,1}\) ball for data with the fixed forcing \(r_0\).
It also rules out \(C^1\) continuity of that output at the zero
coefficient pair in this norm, since the horizontal output
there is \(u_0\). An estimate uniform over a smaller positive
radius fails by the same tail of the sequence. Small values
and low-order Lorentz control persist in this example.
The example therefore identifies a derivative requirement
for the proposed use of this frozen inverse.

The prescribed curvature forms and the frozen derivative
\(d\) are independent in this model. The latter has \(d^2=0\)
on internal sections. An actual \(\mathrm{SO}(3)\) adjoint
covariant derivative would satisfy \(d_A^2\phi=[F_A,\phi]\).
Because the adjoint representation of \(\mathfrak{so}(3)\)
is faithful, this is incompatible with simultaneously taking
\(d_A=d\) and the nonzero perfect triple \(F_0\). The same
compatibility objection holds on \(S^4\). Here
\(\beta_n=da_n\) is the frozen exterior derivative,
and the actual connection bracket terms and curved
reference derivative are outside the test. The result
concerns the specified frozen differential and fiber
splitting and supplies no genuine connection counterexample
or conclusion about other gauges or nonlinear slice placement.

## Input versions

All frozen digests matched. No primary source was newly opened
or imported. Only this derivation and its return were written.

| Artifact | SHA-256 |
| --- | --- |
| [Request][req] | `677de452d57050af58cc3dc14c44aa9fc10f71d7b674e0f4c9f20d962ff51636` |
| [B53][b53] | `47539a7f11b3b10a2e37e218994c4495e431fd19d1d7e4233bba9fe464bbad8f` |
| [E79][e79] | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| [E53][e53] | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |
| [E88][e88] | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |

[req]: ../research-progress/handoffs/SP4-CME-E91_REQUEST_v1.md
[b53]: ../brainstorm/notes/B53_HORIZONTAL_SOLVER_DERIVATIVE_TEST_20261122.md
[e79]: 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[e88]: 88_LORENTZ_ORBIT_SOLVER_20261122.md
