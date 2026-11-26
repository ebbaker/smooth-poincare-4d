# Closed conformal-Laplacian test for the direct two-band trial

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance.
SP4-PSE-E02-sign, [direct trial issue 1](../research-progress/handoffs/DIRECT_EQUATOR_ISSUE_20261126.md).
Intake HEAD `1c81a3048c8c`. The issue requests GPT-6.2 Sol/ultra. Actual serving
model and effort were unavailable. Working input Git blobs were `cbcd73ce04b1`
(issue), `59c3993e018e` (marked assembly), `0cc56c281145` (funnel exterior)
and `03137115be99` (hyperbolic exterior).

The sign test below is exact on the prescribed smooth closed Riemannian
four-manifold. Either band's first Dirichlet eigenvalue being nonpositive
forces a strictly negative closed sign. With both band Dirichlet eigenvalues
positive, the sign is the bottom of one coupled boundary form. The two
hyperbolic caps and all three compactified funnels have explicit response
operators. The remaining estimates are on the marked band metrics and the
compact retained pants product. The result concerns the closed Yamabe sign
alone.

## Pieces and traces

Use both radius-one positive-facing caps \(C_i\), both prescribed bands
\(U_i\), and the full compactified exterior \(E\) of the
[funnel construction](FUNNEL_EXTERIOR.md).
Write \(\Gamma_i^-\) for the face \(s=0\) and \(\Gamma_i^+\) for \(s=1/8\).
The product angular marking on \(U_i\) is the literal cap disk angle and
normal two-sphere coordinate. On \(\Gamma_i^+\) use
\(\Phi_i(\theta/(2\pi),(9/8)p)\) to compare exterior and band traces. Here
\(p=(p_1,p_2,p_3)\in S^2\) parametrizes the tube sphere. The face measures
are their physical induced measures and agree across each gluing.

In these charts put \(r=1+s\), \(\bar c_i(\theta)=c_i(\theta/(2\pi))\) and
\(x_i=\bar c_i+\epsilon r(p_1,p_2)\), with \(\epsilon=1/16\). The metric whose
Dirichlet form must be evaluated on the \(i\)-th band is explicitly
\[
\begin{aligned}
g_i&=(1-H(16s-1))g_c+H(16s-1)g_{\mathrm{out},i},\\
g_c&=ds^2+\sinh^2 r\,d\theta^2+g_{S^2}(p),\\
g_{\mathrm{out},i}
  &=q_{x_i}(dx_i,dx_i)+\epsilon^2[d(rp_3)]^2
    +\sin^2(\phi_i+\epsilon r p_3)d\theta^2 .
\end{aligned}
\]
Here \(q\) is the marked curvature-\(-1\) pants metric with all three cuff
lengths one. The step is flat at its endpoints, and the two terms reproduce
the originally prescribed cap and exterior jets.

For each piece \(A\) let \(L_A=-6\Delta_{g_A}+R_{g_A}\), where
\(\Delta=\operatorname{div}\nabla\), and set
\[
Q_A(f)=\int_A \bigl(6|df|^2+R_{g_A} f^2\bigr)\,dV_{g_A}.
\]
The closed Yamabe sign is the sign of the first eigenvalue of the closed
\(L\). A negative or zero first eigenvalue supplies the respective
nonpositive variational witness. For a positive first eigenvalue the quadratic
form controls the \(L^2\) norm, and bounded scalar curvature then gives
\(H^1\) control. The compact four-dimensional Sobolev inequality yields
a strictly positive Yamabe quotient infimum. Compatible piecewise \(H^1\)
functions with equal face traces are exactly the global \(H^1\) functions.

## The two fixed parts

On \(C_i\) the sum of the curvatures of the two surface factors is zero.
Thus \(R_{C_i}=0\), and Poincaré gives a strictly positive Dirichlet form.
For boundary trace \(e^{im\theta}Y_{\ell k}(p)\), where
\(-\Delta_{S^2}Y_{\ell k}=\ell(\ell+1)Y_{\ell k}\), the regular radial
extension on \(0\le t\le1\) is \(b_{m\ell}(t)/b_{m\ell}(1)\) times the
same angular mode. It solves
\[
b''+\coth t\,b'
 -\left(\frac{m^2}{\sinh^2 t}+\ell(\ell+1)\right)b=0 .
\]
For \(a=|m|\) and \(z=\sinh^2(t/2)\) a regular solution is
\[
b_{m\ell}(t)=\tanh(t/2)^a P_{a\ell}(z),\qquad
P_{a\ell}(z)=\sum_{j=0}^{\ell} d_j z^j,\qquad
d_0=1,\quad d_{j+1}=\frac{(\ell-j)(\ell+j+1)}{(j+1)(a+j+1)}\,d_j .
\]
Indeed substitution gives
\(z(z+1)P''+(a+2z+1)P'-\ell(\ell+1)P=0\), and the displayed solution
has smooth behavior \(t^a\) times a smooth even factor at the disk center.
The outward cap response \(\mathcal N_{C_i}\), defined as the normal derivative
of the \(L_{C_i}\)-harmonic extension, is diagonal in these modes with
\[
\nu_{m\ell}=\frac{b'_{m\ell}(1)}{b_{m\ell}(1)}
  =\frac{|m|}{\sinh1}
    +\frac{\sinh1}{2}\,
      \frac{P'_{|m|\ell}(\sinh^2(1/2))}{P_{|m|\ell}(\sinh^2(1/2))}.
\]
Its only zero mode is the constant one. For example,
\(\nu_{m0}=|m|/\sinh1\) and \(\nu_{0,1}=\tanh1\).
These multipliers are for the actual cap, with \(dA=\sinh1\,d\theta\,d\omega\).
The cap energy response is six times the pairing with this operator.

The exterior \(E\) is connected. Paths in the presurgery manifold can
avoid both cores by transversality and retract radially to the complement of
the open enlarged tubes. Its scalar curvature is nonnegative everywhere and
strictly positive on the retained ends. Thus \(Q_E\) controls all of
\(H^1(E)\). Otherwise an \(L^2\)-normalized sequence with form tending to
zero would converge in \(L^2\) to a constant, and the strictly positive
potential on an open set forces that constant to vanish. In particular,
the exterior has positive first Dirichlet eigenvalue, and its response
\(\mathcal N_E\) on \(\Gamma_1^+\sqcup\Gamma_2^+\) has a strict positive
\(L^2\) lower bound by the trace inequality. The estimate includes traces
that are constant on each face.

The entire exterior response can equivalently be evaluated on the retained
compact pants product with explicit boundary operators at its three cuffs.
On the product before compactification write \(g_0=q+g_{S^2}\) and use the
positive multiplier \(u\) in the funnel construction, so \(g_E=u^2g_0\).
The equation for \(v=uf\) is \(\Delta_{g_0}v=0\) wherever \(L_Ef=0\).
The multiplier is identically one near the tube faces and cuffs. Integration by
parts gives \(Q_E(f)=6\int |dv|_{g_0}^2\,dV_{g_0}\) for smooth \(f\) on
the compactification. The term \(6\int u f^2\partial_\nu u\,dA_{g_0}\)
on a distant funnel cut tends to zero since \(u,|\partial_r u|=O(e^{-r})\)
and \(dA_{g_0}=O(e^r)d\eta\,d\omega\).
[Lee–Parker, conformal covariance (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=7)

At a cuff of length \(2\pi a_0=1\) use the funnel coordinates of the
[exterior construction](FUNNEL_EXTERIOR.md) and put
\(\tau=\int_0^r\operatorname{sech} t\,dt\in[0,\pi/2)\).
For a unit cuff mode \(e^{im\eta}Y_{\ell k}\), its decaying product-harmonic
extension has radial coefficient \(V\) characterized by
\[
V''-\left(\frac{m^2}{a_0^2}+\ell(\ell+1)\sec^2\tau\right)V=0,\qquad
V(0)=1,\qquad V(\tau)=O((\pi/2-\tau)^{\ell+1}).
\]
The inward coordinate of the compactifying ball is
\(x=\pi/2-\tau=\arcsin(\operatorname{sech} r)\), and \(u=B^{-1}\sin x\)
in its germ. The displayed regular branch follows because the \(\ell\)-th
spherical coefficient of smooth \(f\) is \(O(x^\ell)\). Conversely the
regular radial solution has \(x^{\ell+1}\) times an even analytic factor
at zero, so \(V/u\) extends smoothly across the ball core. The outward
funnel derivative at the cuff is \(-V'(0)\) because \(d\tau/dr=1\) there.
The \(\ell=0\) multipliers are \(2/\pi\) for \(m=0\) and
\(\kappa\coth(\kappa\pi/2)\) for \(\kappa=|m|/a_0>0\). For any \(\ell\) the
multiplier is at least \(2/\pi\), by minimizing the one-dimensional
energy with the displayed nonnegative potential and endpoints 1 and 0.
The measure at a cuff is \(a_0\,d\eta\,d\omega\). This includes the three
ends and their core circles through the regularity condition.

For a prescribed pair of tube traces, minimize the Dirichlet energy on
the compact retained pants product plus the sum of these three cuff
responses, all multiplied by six. This gives \(6\mathcal N_E\) as a form.
Equivalently the product-harmonic function on the compact core obeys
\(\partial_{\nu_{\rm core}}v+\mathcal N_{\rm funnel}v=0\) at each cuff.
The normals in this equation point outward from their own pieces.

## Closed sign and the zero cases

If \(\lambda_1^D(U_i)<0\), extend the first Dirichlet eigenfunction by
zero to get \(Q_M<0\). If \(\lambda_1^D(U_i)=0\), take its positive first
eigenfunction \(\psi\) and extend by zero. The boundary point lemma gives
\(\partial_{\nu_{U_i}}\psi<0\) on both band faces. It applies by shifting
the scalar potential to a nonnegative one, since \(\psi\ge0\). Then
\[
Q_M(\psi,1)=6\int_{\partial U_i}\partial_{\nu_{U_i}}\psi\,dA<0.
\]
Adding a sufficiently small positive constant to the zero extension
gives a strictly negative test. This distinguishes a band Dirichlet
zero from a possible zero eigenvalue of the closed metric.

Suppose now that both band Dirichlet eigenvalues are positive. For any
piece \(A\) write \(\mathcal N_A\xi=\partial_{\nu_A}\mathcal H_A\xi\),
where \(\mathcal H_A\xi\) is its unique \(L_A\)-harmonic Dirichlet extension.
Green's identity splits the energy at each trace as
\[
Q_A(f)=6\langle\xi,\mathcal N_A\xi\rangle
       +Q_A(f-\mathcal H_A\xi).
\]
The second term is a positive definite form on zero-trace functions.
Let \(\alpha_i\) and \(\beta_i\) be the inner and outer traces, respectively,
and let \(\beta=(\beta_1,\beta_2)\). The exact closed response at fixed traces is
\[
\mathcal B(\alpha,\beta)=6\langle\beta,\mathcal N_E\beta\rangle
+6\sum_{i=1}^2\left(
\langle\alpha_i,\mathcal N_{C_i}\alpha_i\rangle
+\langle(\alpha_i,\beta_i),\mathcal N_{U_i}(\alpha_i,\beta_i)\rangle
\right).
\]
All pairings are between \(H^{1/2}\) and \(H^{-1/2}\), based on the
measures of the matching faces. Each band response acts on both
of its traces. The complete exterior likewise couples the two outer
faces. The matching germs give a smooth closed metric and hence the
unmodified sum of these forms.

Put \(\mu=\inf \mathcal B(\alpha,\beta)\) on \(H^{1/2}\) traces of total
\(L^2\) norm one. This infimum is finite. On each piece the harmonic extension
\(P_A=\mathcal H_A1\) is smooth and strictly positive by Dirichlet positivity
and the strong maximum principle. Integrating \(f=P_A(f/P_A)\) by parts gives
\[
Q_A(f)=6\int_A P_A^2|d(f/P_A)|^2\,dV
       +6\int_{\partial A}(\partial_{\nu_A}P_A)\,|\operatorname{tr}f|^2\,dA.
\]
The summed boundary terms are bounded below by a finite multiple of minus
the squared trace norm, which bounds \(\mu\) from below.

The closed sign is \(\operatorname{sgn}\mu\). If the
closed first eigenvalue is negative, the first eigenfunction gives a
negative trace test by the splitting. Its trace is nonzero because every
piece is Dirichlet-positive. If the closed first eigenvalue is zero, the
same argument yields a nonzero trace attaining zero and \(\mathcal B\)
is everywhere nonnegative. If it is positive, the closed coercive
\(H^1\) bound and the trace inequality give a strictly positive lower
bound for \(\mathcal B\) per squared trace norm. In the zero case the weak
kernel equation for the trace is precisely cancellation of the two
outward normal derivatives at every face. It includes the band maps
and the positive exterior response on traces constant at both outlets.

## A band integral at the prescribed width

In the given \(s\)-slicing write \(g_i=N^2ds^2+
h_{ab}(dy^a+b^a ds)(dy^b+b^b ds)\). Define
\(n=N^{-1}(\partial_s-b)\), \(K=(\partial_s h-\mathcal L_b h)/(2N)\),
and \(J=\operatorname{tr}_h K\). This includes the shift \(b\) of the
actual pullback. The contracted Gauss and normal curvature identities
give \(R_{g_i}=R_h-|K|^2-J^2-2n(J)-2\Delta_h N/N\).
Since \(\operatorname{div}_{g_i}n=J\), integration by parts gives
\[
\begin{aligned}
Q_{U_i}(f)={}&
\int_{U_i}\left[
6(nf+Jf/3)^2+6|d_h f|_h^2+
\left(R_h-|K^\circ|^2-2\Delta_h N/N\right)f^2\right]\,dV\\
& +2\int_{\Gamma_i^-}J f^2\,dA-2\int_{\Gamma_i^+}J f^2\,dA.
\end{aligned}
\]
The endpoint terms vanish in the Dirichlet test and enter this version
of the integral for arbitrary traces. For arbitrary smooth band test
functions, adding the cap and full exterior minimizing energies to their
\(Q_{U_i}\) gives a closed upper test. A negative value decides the
closed sign before either band equation is solved.

The intrinsic cuff lengths fix the funnel factors and the abstract
hyperbolic pants. To evaluate the band formula, \(q\) is needed in the
displayed planar tube marking, including its jets. The two band Dirichlet
eigenvalues and the coupled minimum \(\mu\) remain unestimated for this
fixed profile on the band of length \(1/8\), with switching width \(1/16\). The unconditional closed sign at the
baseline remains open.
