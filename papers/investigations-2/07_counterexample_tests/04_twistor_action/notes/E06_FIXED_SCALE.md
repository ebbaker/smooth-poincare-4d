# SP4-TWA-E06 · Fixed-scale comparison at equal endpoints

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request records the author-selected GPT-6.2 Astra/ultra lead and GPT-6.2 Sol/ultra helper configuration. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all nine frozen SHA-256 digests matched at execution start. The later B05/E09 plan appendix leaves that frozen plan text intact. [Frozen request v1](../research-progress/handoffs/E06_REQUEST_v1.md) · [B03 control](../brainstorm/notes/B03_QUADRATIC_COMPARISON.md)

## Operator, boundary density and the homogeneous Dirichlet Hessian

Take the oriented flat product \(M=[-1,1]\times(\mathbb R^3/\mathbb Z^3)\) with volume one per torus, periodic spin structure, and unit parallel positive spinor \(\sigma\). Use the complex rank-two half-spin bundle on which real self-dual two-forms act, the Levi–Civita spin lift, \(X\cdot X=-|X|^2\), \(D=\sum_i e_i\cdot\nabla_{e_i}\) and \(P_X=\nabla_X+\tfrac14 X\cdot D\). All fiber pairings are real parts of the Hermitian pairings. The comparison uses the same smooth zero-free neighborhood of the reference field \(\sigma\) as the quartic action. [Conventions and quartic variation](E01_VARIATION.md)

For a prescribed smooth positive scale \(\rho\), set \(w=\rho^{-6}\), fixed under variations. With \(\nu\) outward and \((\,,\,)_{\mathbb R}\) the real pairing, differentiation and integration by parts give

\[
\begin{aligned}
 S_{2,\rho}[\psi]&=\frac12\int_M w|P\psi|^2\,dV_g,\\
 DS_{2,\rho}(\psi)(\eta)
 &=\int_M w(P\psi,P\eta)_{\mathbb R}\,dV_g\\
 &=\int_M \big(P^*(wP\psi),\eta\big)_{\mathbb R}\,dV_g
   +\int_{\partial M}\big(w(P\psi)(\nu),\eta\big)_{\mathbb R}\,dA_g,\\
 D^2 S_{2,\rho}(\psi)(\eta,\zeta)&=\int_M w(P\eta,P\zeta)_{\mathbb R}\,dV_g.
\end{aligned}
\]

Here \(P^*\) is the formal interior adjoint. To obtain the outward sign and factor, write \(P=\Pi\nabla\) with \(\Pi=I-c^*c/4\), the orthogonal projection to the kernel of the Clifford trace \(c\). The tensor \(wP\psi\) lies in that kernel, so its pairing with \(P\eta\) equals its pairing with \(\nabla\eta\). The divergence formula then gives \(P^*(wP\psi)=-\operatorname{tr}_g\nabla(wP\psi)\) and the outward spinor covector density \(w(P\psi)(\nu)\,dA_g\).

On the selected control \(\rho=1\), use the flat parallel frame and \(\Delta_g=\sum_i\partial_i^2\). Since \(\Pi^2=\Pi=\Pi^*\), the formal differential operator is

\[
 P^*P=\nabla^*\nabla-\tfrac14D^*D
      =-\tfrac34\Delta_g\,I_{S^+}.
\]

In the middle term \(D^*\) acts from negative to positive spinors. It is the reverse chiral Dirac operator, so the flat Clifford anticommutation relations give \(D^*D=-\Delta_g I_{S^+}\). In particular, for arbitrary smooth positive spinor variations with both end traces zero,

\[
 D^2S_{2,1}(\eta,\zeta)=\tfrac34\int_M(\nabla\eta,\nabla\zeta)_{\mathbb R}\,dV_g .
\]

The form closes on \(H^1_0(M;S^+)\), with periodic torus directions and zero end traces. The Dirichlet realization on \(H^2\cap H^1_0\) acts in a parallel spin frame by the displayed scalar Laplacian on each spinor component. Its modes are \(\sin(n\pi(t+1)/2)e^{2\pi i k\cdot x}\) times a constant spinor, where \(n\ge1\) and \(k\in\mathbb Z^3\). Their eigenvalues are

\[
\frac34\left(\frac{n^2\pi^2}{4}+4\pi^2|k|^2\right).
\]

Thus the sharp \(L^2\) gap is \(3\pi^2/16\). The Hessian controls the full homogeneous Dirichlet gradient norm with coefficient \(3/4\).

## Exact comparison endpoint function

Let \(a_\pm=e^{u_\pm}>0\), so the fixed traces are \(a_\pm\sigma\). Write \(\Delta a=a_+-a_-\). On the radial field \(\psi=a(t)\sigma\), \(|P\psi|^2=(3/4)(a')^2\) and \((P\psi)(\partial_t)=(3/4)a'\sigma\). Accordingly

\[
 \psi_{\rm lin}(t)=\left(\frac{1-t}{2}a_-+\frac{1+t}{2}a_+\right)\sigma,\qquad
 S_{2,1}[\psi_{\rm lin}]=F_2(a_-,a_+)=\frac3{16}(\Delta a)^2.
\]

The spinor is positive along the whole interval. It satisfies \(\Delta_g\psi_{\rm lin}=0\), and hence is stationary under arbitrary smooth fixed-trace spinor variations. If \(\psi=\psi_{\rm lin}+\eta\) has the same traces, stationarity and the quadratic identity give

\[
 S_{2,1}[\psi]-S_{2,1}[\psi_{\rm lin}]
 =\frac12\int_M |P\eta|^2\,dV_g
 =\frac38\int_M|\nabla\eta|^2\,dV_g.
\]

Therefore \(\psi_{\rm lin}\) uniquely minimizes the comparison action, including in the shared zero-free class. Testing the difference of any two stationary fields with that difference gives the same strict uniqueness by the Dirichlet Hessian.

On \(\psi_{\rm lin}\) the outward spinor covector density is \(-p^a\sigma\,dA_g\) at the left end and \(+p^a\sigma\,dA_g\) at the right end, where \(p^a=(3/8)\Delta a\). Pairing against \(\delta a_\pm\sigma\) or \(a_\pm\delta u_\pm\sigma\) and integrating over the unit torus yields the two outward scalar graphs

\[
 \begin{array}{c|c|c}
 \text{Coordinates}&\text{Generating function}&\text{Outward covectors}\\ \hline
 (a_-,a_+) & \frac3{16}(a_+-a_-)^2 & (-p^a,p^a)\\[2pt]
 (u_-,u_+) & \frac3{16}(e^{u_+}-e^{u_-})^2 & (-a_-p^a,a_+p^a).
 \end{array}
\]

Each graph is exact Lagrangian since the tautological form restricts to the differential of the displayed generating function. The incoming momentum is the negative of the left outward covector. In amplitude coordinates the signed relation is the smooth shear \((a_-,p^a)\mapsto(a_-+\tfrac83 p^a,p^a)\) on the domain where both amplitudes are positive. It has a smooth inverse on its image. In logarithmic coordinates, the signed momenta are \((p_-^u,p_+^u)=(a_-p^a,a_+p^a)\), the cotangent coordinate change for \(a=e^u\). The mixed derivative \(\partial_{u_+}p_-^u=(3/8)a_-a_+\) is positive, including at equality. Both phase-space projections are invertible on their images in either chart, also through equal endpoints.

With \(K=\begin{pmatrix}1&-1\\-1&1\end{pmatrix}\), the amplitude Hessian is \((3/8)K\). At a common log endpoint \(u_-=u_+=\log A\) the log Hessian is \((3/8)A^2 K\). To see the latter, differentiate \(F_2=(3/16)(e^{u_+}-e^{u_-})^2\) twice. The terms containing \(\Delta a\) vanish at the diagonal, leaving the outer product of \((-A,A)\) with itself times \(3/8\). At the unit reference \(A=1\) the endpoint derivatives in both charts therefore have the same rank-one linear response to the endpoint difference.

## Quartic comparison and scale dependence

The quartic action here is \(S_4=J_g^4\). At \(\psi=\sigma\) and for small smooth \(\eta\),

\[
 S_4[\sigma+\eta]=\int_M \frac{|P\eta|^4}{|\sigma+\eta|^4}\,dV_g
  =\int_M |P\eta|^4\,dV_g+O(\|\eta\|_{C^1}^5).
\]

The error estimate uses the uniform lower bound on the perturbed norm in the shared zero-free neighborhood. In particular the full homogeneous Dirichlet Hessian of \(S_4\) is zero. The corresponding radial stationary solution is affine in \(u\), by E02 with \(L=2\) and \(V=1\). Put \(\Delta u=u_+-u_-\). Its on-shell function is \(F_4=9(\Delta u)^4/128\) and with \(p_4=(9/32)(\Delta u)^3\) the outward log covectors are \((-p_4,p_4)\). In amplitude coordinates \(\Delta u=\log(a_+/a_-)\), so the outward covectors are \((-p_4/a_-,p_4/a_+)\). The endpoint Hessian is zero on the diagonal in both charts. The signed logarithmic momentum is cubic in the endpoint difference, with a cube-root inverse at zero. The quadratic comparison has a positive homogeneous Dirichlet Hessian and nonzero mixed endpoint derivative there. [Quartic variation](E01_VARIATION.md#polarized-hessian-and-fourth-order-expansion) · [Radial quartic graph](E02_FLAT_TORUS.md#endpoint-graph-and-its-projections)

At fixed metric and fixed traces, multiplying the prescribed scale by a constant \(c>0\) multiplies the quadratic action, operator, Hessian, outward covectors and on-shell function by \(c^{-6}\), since \(w\) has that scaling. The stationary family remains the same and the Dirichlet gap becomes \(3c^{-6}\pi^2/16\). For a fixed positive weight the quadratic formula is smooth at spinor zeros as well, since it depends polynomially on the first jet. The matched Hessian and endpoint test uses zero-free fields. [Inherited fixed-scale definition](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md#a-boundary-relation-on-a-flat-product)

## Source scope

The frozen overview, plan, inherited action and DIR-E06/E07/E10, and the B03, E01 and E02 inputs were checked. The primary passage used is Friedrich §1 equation (1.1) on p. 59 for the Riemannian twistor convention, checked in the published copy on 28 November. The weighted variational identity, flat Dirichlet operator and endpoint graph follow from the calculations above. [Thomas Friedrich, published copy, §1](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2) · [Branch source index](../references/README.md)
