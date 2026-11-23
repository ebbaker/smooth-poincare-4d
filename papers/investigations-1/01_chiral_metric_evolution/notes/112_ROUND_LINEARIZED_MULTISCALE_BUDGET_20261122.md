# SP4-CME-E112 — A multiscale lower bound for the actual round linearized strain budget

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E109 and reuse its annular datum and scalar sign calculation. The Gaussian-quotient method and native defect map are inherited from E22 and E47, which I did not author. I rechecked the primary kernel theorem and derived the round Hessian and atom errors here. [Request][req], [B61][b61], [return and consumed versions][ret].

## Statement and native conventions

On the smooth closed oriented round Riemannian four-sphere let \(A_0\) be the positive chiral reference connection on the actual adjoint bundle \(E\). Use the positive internal metric given by the negative Killing form and Fine's native metric \(G=g(A_0)\) of sectional curvature \(1/2\). Write \(d_0=d_{A_0}\). Let \(D_0\) be the induced connection on \(\mathcal E=\operatorname{Sym}^2_0 E\), extended by the native Levi-Civita connection on base tensor slots. Put \(\mathcal L=D_0^*D_0\) on \(\mathcal E\). All norms and times in the conclusion are native.

There are smooth global \(E\)-valued one-forms \(a_N\) for all integers \(N\ge1\), with \(\delta_N=N^{-1/2}\), such that
\[
 \|a_N\|_\infty+\|d_0a_N\|_\infty\le C\delta_N,\qquad
 \|T_N(0)\|_4\le C N^{-1/4}.
\]
Here \(q_N(\tau)=e^{-\tau(4\mathcal L+12)} DQ_{A_0}(a_N)\) and \(T_N=\tfrac12 D_0q_N\) under the linearized strain convention. There is a constant \(c>0\) independent of \(N\) for which
\[
 c\sqrt N\ \le\
 \int_0^\infty\|D_0T_N(\tau)\|_\infty\,d\tau
 \ \le\ J_{\rm lin}(N)
 :=\int_0^\infty\big(\|D_0T_N(\tau)\|_\infty+\|T_N(\tau)\|_\infty^2\big)\,d\tau
 \ <\infty.
 \tag{1}
\]
The derivative \(D_0T_N=\tfrac12 D_0^2q_N\) retains both ordered base slots.

### Exact tangent map and time conversion

Use an internal orthonormal frame. At perfection \(F_{0i}\wedge F_{0j}=\delta_{ij}dV_G\), with the \(F_{0i}\) self-dual and orthonormal under \(G\). Write \(Y_{ij}=F_i\wedge F_j/dV_G\), using this fixed volume, so \(Q=3Y/\operatorname{tr}Y\). The curvature derivative at \(A_0\) is \(B=d_0a\), and
\[
 \delta Y_{ij}=(B_i,F_{0j})_G+(B_j,F_{0i})_G,\qquad
 DQ_{A_0}(a)=2\operatorname{tf}L_0(d_0a),\qquad
 (L_0B)_{ij}=\tfrac12\big((B_i,F_{0j})_G+(B_j,F_{0i})_G\big).
 \tag{2}
\]
This uses self-duality in the wedge pairing and the derivative of trace division at \(Y=I\). It reproduces the native E47 normalization. The wedge Gram and its trace normalization are equivariant under bundle automorphisms with orientation-preserving base maps. The pullback of \(Q(A_0)=I\) stays \(I\), so (2) kills all reference tangent orbit directions \(d_0\phi+\iota_XF_0\). These directions follow by differentiating pullback along a vertical fundamental field or the \(A_0\)-horizontal lift of \(X\). The connection Cartan identity is \(\mathcal L_{\widetilde X} A_0=\iota_{\widetilde X}F_0+d_{A_0}(A_0(\widetilde X))\) on the principal bundle. Thus this vanishing is an exact global infinitesimal statement. [E47][e47].

In the consumed manuscript block the normalized metric \(\widehat g\) has sectional curvature \(K>0\) and normalized time \(t\). A bracket-orthonormal internal frame in that convention has negative Killing matrix \(2I\), since \(-\operatorname{tr}(\operatorname{ad}(e_i)\operatorname{ad}(e_j))=2\delta_{ij}\) for the cross-product bracket. Passing to a negative-Killing orthonormal frame multiplies the curvature components \(-K\Sigma_i^+\) by \(\sqrt2\). As \(|\Sigma_i^+|^2_{\widehat g}=2\), the resulting wedge Gram is \(4K^2 I\,dV_{\widehat g}\). Hence the native round volume is \(4K^2dV_{\widehat g}\), giving \(G=2K\widehat g\).

The time relation is \(\tau=2Kt\). At the reference, changing the internal pairing by \(2\) multiplies the curvature energy by \(2\). The \(L^2\) pairing on connection variations changes by \(2(2K)\), from the internal pairing, the inverse metric on one base slot and the volume on four base dimensions. At the perfect critical point derivatives of this pairing are multiplied by the zero gradient, so the ratio of linearized gradient speeds is \((2K)^{-1}\). Constant metric rescaling leaves the connections fixed and gives \(\widehat D_0^*\widehat D_0=(2K)\mathcal L\). The normalized equation in the consumed block therefore gives
\[
 q_\tau=-\frac{4}{2K}\big((2K)\mathcal L+6K\big)q
       =-4\mathcal L q-12q .
 \tag{3}
\]
The normalized block's linear connection velocity is \(-4d_{0,\widehat g}^*(qF_0)\). Rescaling its single inverse-metric contraction and using the same time relation gives \(-4d_{0,G}^*(qF_0)\). In that block the composition of \(DQ_{A_0}\) with this velocity is calculated pointwise for any smooth trace-free symmetric \(q\), yielding (3). Accordingly, the smooth section
\[
 a_N(\tau)=a_N-4\int_0^\tau d_{0,G}^*(q_N(v)F_0)\,dv
\]
has \(DQ_{A_0}a_N(\tau)=q_N(\tau)\) by equality of their time derivatives and initial values. It solves the actual linearized connection equation. Linearizing the strain expression \(\tfrac12(Q^{-1/2}D_A Q\,Q^{-1/2})_0\) at \(Q=I\) gives \(\tfrac12 D_0 q\), since \(D_{A_0}I=0\), the connection variation commutes with \(I\), and \(D_0q\) is trace-free. [Consumed manuscript block][manu].

## Global tangent data from a fixed normal ball

Fix \(p\) and a small native normal coordinate ball \(B\) centered at \(p\). Use a radial internal orthonormal frame, a unit trace-free symmetric matrix \(M\) radially transported from \(p\), and \(C_i=M_{ij}F_{0j}\). Use the Euclidean coordinate length \(\rho=|x|=d_G(p,x)\) and \(X=x^\ell\partial_\ell\). Fix a nonzero nonnegative \(\chi\in C_c^\infty((1,2))\). For \(0<r\le r_*\) with the closed annulus inside \(B\), the unweighted atom is
\[
 a^{(r)}=\tfrac12\chi(\rho/r)\,\iota_X C,\qquad
 q^{(r)}=DQ_{A_0}(a^{(r)}).
 \tag{4}
\]
The atom vanishes near both boundary radii. It extends by zero as a smooth section of \(T^*S^4\otimes E\), and its defect has the same support enclosure.

In these coordinates \(G_{ab}-\delta_{ab}=O(\rho^2)\), \(\partial G_{ab}=O(\rho)\), and the reference connection coefficients \(A_{0,a}=O(\rho)\), with bounded first derivatives. The latter vanish at \(p\) in the radial frame. The round curvature identification \(F_0:E\to\Lambda^+\) is parallel for the product connection, because this is the chiral Levi-Civita connection and the scale is constant. Thus \(\partial F_0=O(\rho)\) and \(F_0(x)=F_0(p)+O(\rho^2)\) in the indicated coefficient arrays. The same bounds apply to the coefficients of \(C\), since \(M\) is constant in the radial frame. All coefficients have bounded second derivatives on the fixed ball.

Freeze the coefficient array of \(C\) at \(p\) in (4), obtaining \(a_{\mathrm{flat}}^{(r)}\). On the support,
\[
 |\partial^\ell(a^{(r)}-a_{\mathrm{flat}}^{(r)})|
      \le C r^{3-\ell}\quad (0\le\ell\le2),\qquad
 |\partial^\ell a^{(r)}|\le C r^{1-\ell}\quad(0\le\ell\le2).
\]
Indeed \(\iota_X(C-C(p))=O(r^3)\), its first and second derivatives have orders \(r^2\) and \(r\), and each derivative on the cutoff costs \(r^{-1}\). The bracket term from \(d_0a^{(r)}\) is \(O(r^2)\) and its first derivative is \(O(r)\), using \(A_0=O(r)\) and \(\partial A_0=O(1)\). The coefficient map \(L_0\) in (2) differs from its center map by \(O(r^2)\) with first derivative \(O(r)\), so replacing \(d_0a^{(r)}\) and \(L_0\) by their frozen counterparts introduces error \(O(r^2)\) with coefficient first derivative \(O(r)\). Converting the error's derivative to \(D_0\) adds only \(O(r)\) times the error.

For the flat calculation at the center, \(d(\iota_X C(p))=2C(p)\). For each self-dual two-form \(C_i(p)\), the Euclidean self-dual projection of \(d\rho\wedge\iota_X C_i(p)\) is \((\rho/2)C_i(p)\), by splitting into the radial and orthogonal slots. Hence the self-dual part of \(da_{\mathrm{flat}}^{(r)}\) is \(f(\rho/r)C(p)\), where
\[
 f(u)=\chi(u)+\tfrac14 u\chi'(u),\qquad
 u^3 f(u)=\tfrac14(u^4\chi(u))'.
\]
Under (2) at the center this gives \(2f(\rho/r)M\), using only the self-dual orthonormal triple and the symmetry and zero trace of \(M\). In the actual radial frame we have the uniform estimates
\[
 q^{(r)}=2f(\rho/r)M+e^{(r)},\qquad
 |e^{(r)}|\le Cr^2,\quad |D_0e^{(r)}|\le Cr,\quad
 |q^{(r)}|\le C,\quad |D_0q^{(r)}|\le Cr^{-1}.
 \tag{5}
\]
The final derivative includes \(D_0 M=O(r)\). Bounds (4)–(5) hold through the support collars under zero extension. [E109, flat atom and sign calculation][e109].

Take \(r_j=\sigma R^{-j}\) and \(a_N=\delta_N\sum_{j=1}^N a^{(r_j)}\), with \(R>2\) and \(0<\sigma\le r_*\) to be selected. The annuli are disjoint. The estimates on \(a^{(r)}\) and \(d_0 a^{(r)}\) prove the two supremum bounds. Since the annulus at radius \(r_j\) has volume at most \(C r_j^4\), (5) gives
\[
 \|T_N(0)\|_4^4
   \le C\delta_N^4\sum_{j=1}^N r_j^{-4}r_j^4
   = C N^{-1}.
 \tag{6}
\]
For fixed \(N\) the input lies on the actual affine space of smooth connections. Its actual curvature satisfies \(F(A_0+a_N)=F_0+d_0a_N+\tfrac12[a_N\wedge a_N]\), so its difference from \(F_0\) in the native value norm is \(O(\delta_N)\). Thus actual definiteness holds for sufficiently large \(N\) by openness and the compact reference.

## The local round differentiated heat kernel

Use heat time \(s=4\tau\) and denote the kernel of \(H_s=e^{-s\mathcal L}\) by \(p_s(x,y)\), a map \(\mathcal E_y\to\mathcal E_x\). On the compact sphere the metric connection Laplacian is formally self-adjoint and nonnegative by integration by parts, with smooth principal part \(-G^{ab}\partial_a\partial_b I\). It is of Laplace type in Ludewig's §2 convention, with the same metric connection and \(V=0\). If using Hermitian fibers, complexify \(\mathcal E\) and restrict the kernel to real sections. Choose a smaller fixed ball with compact closure in \(B\) so that pairs of points in its closure are uniformly away from the cut locus. All evaluation pairs \((p,y)\) used below and a neighborhood in the \(x\) variable belong to this set.

Ludewig's Theorem 1.1, with expansion order \(\nu=0\), time derivative order zero, \(x\) orders \(0,1,2\), and \(y\) order zero, yields
\[
 p_s(x,y)=E_s(x,y)(\Phi_0(x,y)+h_s(x,y)),\quad
 E_s(x,y)=(4\pi s)^{-2}e^{-d_G(x,y)^2/(4s)},\quad
 |D_x^\ell h_s|\le C s\quad(0\le\ell\le2)
 \tag{7}
\]
uniformly on that compact pair set for \(0<s\le s_0\), where \(s_0\le1\) is fixed. The theorem supplies the covariant derivatives of the Gaussian quotient and smoothness of the coefficient \(\Phi_0\). The compact set, derivative connection and all coefficients are fixed here. Only this local consequence of Theorem 1.1 is needed. [Ludewig, final publisher HTML, §1, (1.1)–(1.3) and following derivative convention, §2][ludewig]. [E22, related first-derivative method][e22].

For the diagonal value, apply \(H_s\) at \(p\) to a smooth test section supported in the chosen ball, with arbitrary value at \(p\). The fixed nonnegative elliptic heat semigroup tends to the identity on such data in \(C^0\). For example, strong convergence follows in the graph norm of \((1+\mathcal L)^3\) by the spectral theorem, and fixed elliptic estimates and \(H^6\hookrightarrow C^2\) control this norm's \(C^0\) consequence. Insert (7), set \(y=\sqrt s\,z\) in normal coordinates, and use the unit-mass Gaussian, the bounded normal volume density and \(h_s=O(s)\) to pass to the limit by domination. This gives \(\Phi_0(p,p)v(p)=v(p)\) for every \(v(p)\), hence \(\Phi_0(p,p)=I\).

Write \(h(x,y)=d_G(x,y)^2\), which is smooth on the chosen pair set. In the normal coordinates at \(p\), \(h(p,y)=|y|^2\) and \(D_x h(p,y)=-2y^\flat\), by first variation. The diagonal Hessian in \(x\) is \(2G_p\), so \(D_x^2 h(p,y)=2G_p+O(|y|)\) with a uniform bound. Differentiating the scalar Gaussian gives
\[
 D_x E_s=-\frac{D_x h}{4s}E_s,\qquad
 D_x^2 E_s=\left(\frac{D_x h\otimes D_x h}{16s^2}
                    -\frac{D_x^2h}{4s}\right)E_s .
\]
The product rule, the two derivative orders in (7), and smooth \(\Phi_0\) now give
\[
 |D_x^2p_s(p,y)|
 \le C s^{-2}e^{-|y|^2/(4s)}
       (1+|y|/s+1/s+|y|^2/s^2)
 \le C' s^{-3}e^{-|y|^2/(8s)} .
 \tag{8}
\]
The last inequality absorbs polynomial powers of \(|y|/\sqrt s\) into the Gaussian and uses \(s\le1\). All norms in (7)–(8) use the fixed fiber metrics and the native metric on base slots.

## Own-scale term and the two off-scale sums

Fix \(0<\alpha<\beta<1/12\). Let \(K_\theta(z)=(4\pi\theta)^{-2}e^{-|z|^2/(4\theta)}\) be the ordinary Euclidean heat kernel. In the radial frame and a native unit coordinate direction \(e_1\) at \(p\), (7) implies the uniform estimate
\[
 r^6 (D_{x,11}p_{r^2\theta})(p,\exp_p(rz))
       =(\partial_{11}K_\theta)(z) I+O(r)
       \quad\text{for }1\le |z|\le2,\quad\alpha\le\theta\le\beta .
 \tag{9}
\]
In fact, \(r^4E_{r^2\theta}(p,\exp_p(rz))=K_\theta(z)\). The rescaled Hessian of this Gaussian multiplies \(K_\theta(z)\) by \(z_1^2/(4\theta^2)-1/(2\theta)+O(r)\). Its coefficient \(\Phi_0(p,\exp_p(rz))+h_{r^2\theta}(p,\exp_p(rz))\) is \(I+O(r)+O(r^2)\) using the diagonal value. A product term with one derivative on that coefficient is \(O(r)\) after rescaling, and a term with two is \(O(r^2)\), since the corresponding derivatives of the coefficient are bounded. These are covariant derivatives and include the base and bundle connections.

Project the \(11\) Hessian entry of \(H_s(q^{(r)}/2)(p)\) onto \(M(p)\). With \(dV_G(\exp_p(rz))=r^4(1+O(r^2))\,dz\), (5) and (9) give
\[
 r^2 \left\langle(D_{0,11}H_{r^2\theta}(q^{(r)}/2))(p),M(p)\right\rangle
    =\mathcal H(\theta)+O(r),\qquad
 \mathcal H(\theta)=\int_{\mathbb R^4}(\partial_{11}K_\theta)(z) f(|z|)\,dz .
 \tag{10}
\]
The input atom error and volume-density error separately contribute \(O(r^2)\) after scaling. The remaining \(O(r)\) is the kernel limit error and is uniform over the full fixed heat window.

In four dimensions the angular average of \(z_1^2\) on a radius-\(u\) sphere is \(u^2/4\). Inserting this into (10), then integrating \(u^3 f(u)=(u^4\chi(u))'/4\) by parts, gives the E109 factor and sign
\[
 \mathcal H(\theta)=
     \frac{1}{1024\,\theta^5}
     \int_1^2 u^5\chi(u)(u^2-12\theta)e^{-u^2/(4\theta)}\,du .
 \tag{11}
\]
Indeed the angular integration gives the prefactor \(|S^3|(4\pi\theta)^{-2}\), and the derivative of \((u^2/(16\theta^2)-1/(2\theta))e^{-u^2/(4\theta)}\) is \(u(12\theta-u^2)e^{-u^2/(4\theta)}/(32\theta^3)\). The support collars remove boundary terms. Thus \(h_*:=\min_{[\alpha,\beta]}\mathcal H>0\). [E109, (4)–(5)][e109].

Keep \(s\in[\alpha r_k^2,\beta r_k^2]\). For any \(j\ne k\), apply (8) to the bounded actual atom from (5). Its points have \(|y|\ge r_j\) and volume at most \(C r_j^4\). Consequently, with constants depending on the fixed ball and \(\alpha,\beta,\chi\),
\[
 |D_0^2 H_s(q^{(r_j)}/2)(p)|
 \le C s^{-3} r_j^4 e^{-r_j^2/(8s)}
 \le C' r_k^{-2}(r_j/r_k)^4
                       e^{-(r_j/r_k)^2/(8\beta)} .
 \tag{12}
\]
This controls the geometric errors as well as the leading term of every off-scale atom. Summing the absolute projected contributions for \(j<k\) costs at most
\(C'r_k^{-2}\sum_{m\ge1}R^{4m}e^{-R^{2m}/(8\beta)}\).
For \(j>k\) it costs at most
\(C'r_k^{-2}\sum_{m\ge1}R^{-4m}\).
Both coefficient sums tend to zero as \(R\to\infty\). For the first, \(z^4 e^{-z^2/(8\beta)}\le C_\beta z^{-4}\) for \(z\ge1\). Both tails are controlled in absolute value.

The order of choices is fixed. Start with the ball, the upper scale \(r_*\) inside it, \(s_0\), \(\chi\), and \(\alpha,\beta\). Shrink \(r_*\) beforehand so \(\beta r_*^2\le s_0\). Then choose \(R>2\), \(R^2>\beta/\alpha\), large enough that the two sums in (12) together have coefficient at most \(h_*/4\). Finally choose \(\sigma\le r_*\) so the own-scale error in (10) is at most \(h_*/4\). All choices are independent of \(N\). The sum of projected Hessians is then at least \(h_*r_k^{-2}/2\) throughout the \(k\)-th heat window.

Returning to native time, the disjoint intervals are
\[
 I_k=[\alpha r_k^2/4,\beta r_k^2/4],\qquad
 D_0 T_N(\tau)=\delta_N e^{-12\tau}
                 \sum_{j=1}^N D_0^2 H_{4\tau}(q^{(r_j)}/2).
\]
The norm controls the \(11\) entry projected onto the unit \(M(p)\). For each interval the damping is at least \(e^{-3\beta r_1^2}\). Its length is \((\beta-\alpha)r_k^2/4\), giving
\[
 \int_0^\infty \|D_0T_N(\tau)\|_\infty\,d\tau
 \ \ge\ \frac{h_*(\beta-\alpha)e^{-3\beta r_1^2}}{8}
               N\delta_N
 \ =\ c\sqrt N .
\]

For each finite \(N\), \(q_N(0)\) is smooth and its \((1+\mathcal L)^3\) graph norm is finite. This norm is contractive under \(H_s\) by nonnegative self-adjoint spectral calculus. Elliptic estimates for the fixed compact connection Laplacian control the \(H^6\) norm by that graph norm, and \(H^6\) controls the first and second covariant derivatives in \(L^\infty\) in dimension four. Thus \(\|D_0T_N(\tau)\|_\infty\le C_N e^{-12\tau}\) and \(\|T_N(\tau)\|_\infty^2\le C_N' e^{-24\tau}\) all the way to \(\tau=0\). This proves the finiteness in (1) with constants depending on \(N\).

The proof gives a lower bound for the actual compact round **linearized** connection flow and its attained defect and strain. The curvature estimate for \(A_0+a_N\) concerns the nonlinear initial values only. A lower bound along nonlinear trajectories would require estimates comparing their accumulated strain Hessians with those of the round linearization.

[req]: ../research-progress/handoffs/SP4-CME-E112_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E112_RETURN_v1.md
[b61]: ../brainstorm/notes/B61_ROUND_LINEARIZED_BUDGET_TRANSFER_20261122.md
[e109]: 109_FROZEN_MULTISCALE_STRAIN_BUDGET_20261122.md
[e47]: 47_ROUND_STABLE_LINEAR_20261122.md
[e22]: 22_ROUND_LORENTZ_HEAT_20261122.md
[manu]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[ludewig]: https://link.springer.com/article/10.1007/s10455-018-9630-4
