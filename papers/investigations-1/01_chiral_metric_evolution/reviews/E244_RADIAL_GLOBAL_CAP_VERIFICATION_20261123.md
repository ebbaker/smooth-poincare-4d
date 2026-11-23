# E244 — Independent verification of the radial global ratio cap

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E verification under B112, configured gpt-6.2-sol / ultra. Independent runtime and selected lead settings are unavailable. I authored E241's separate conditional flow application and E237's manuscript check of the local germ. This audit uses the shared assessed E235 Hessian and explicit polynomial, and the radial chart and bounds recorded in returned E240. I rederive the estimates needed for the cap, including the relevant radial remainders. E240's independent audit was pending at dispatch. I did not read E243's work or correspondence. [Request][request] · [B112 route][b112]

## Verdict

Pass for the fixed radial cutoff. For every sufficiently small \(\epsilon>0\), the actual B112 cutoff connection on the supplied standard oriented round \(S^4\) and positive chiral \(SO(3)\) bundle is smooth, globally positive definite and round-compatible. With \(r=1+\epsilon\) and \(R=\epsilon^2\),
\[
 \rho(Q_{A_\epsilon})(p)=r,\qquad
 \rho(Q_{A_\epsilon})(x)<r\quad\text{for all }x\ne p.
\]
The pointwise cutoff coefficient is \(h=u+v/4\), with all the claimed parameter error estimates. The whole cutoff ball's strict comparison with the local polynomial value follows from a uniform expansion, independently of the size of the fixed-\(r\) E235 neighborhood. The proof concerns the actual initial connection for this one family.

## Choice of cutoff and fixed-coordinate bounds

Choose a nonnegative smooth integral-one mollifier \(\eta\) compactly supported in \((-1/20,1/20)\). Define \(d_c(s)=(5/2)({\bf1}_{[11/20,19/20]}*\eta)(s)\), and \(c(s)=\int_s^\infty d_c(z)\,dz\). Convolution with \(\eta\) gives a smooth nonnegative density supported strictly inside \((1/2,1)\). Its integral is \((5/2)(8/20)=1\), and \(d_c\le5/2\) since the indicator is at most one. Thus \(0\le c\le1,\ c'\le0,\ |c'|\le5/2\), with the stated plateaus. The radial cutoff \(c(|x|/R)\) is smooth at zero by the constant inner plateau, and vanishes smoothly at the outer support. The function \(c\) is fixed as \(\epsilon\) varies.

Use B112's fixed oriented normal chart and old \(K=1\) radial gauge. Write \(F_0=F_{\rm rd}(0)=-\Sigma\), with the constant Euclidean self-dual triple \(\Sigma\) in the matched old orthonormal internal frame. On a fixed closed coordinate ball \(\overline B_{R_0}\), the radial identity is
\[
 A_{\rm rd}(x)=\int_0^1 t\,\iota_x F_{\rm rd}(tx)\,dt
             =\tfrac12\iota_x F_0+E(x).
\]
Indeed \(x^i(A_{\rm rd})_i=0\) gives \(x^i F_{{\rm rd},ij}(x)=x^i\partial_i(A_{\rm rd})_j(x)+(A_{\rm rd})_j(x)\), and integration of \(\frac{d}{dt}(t(A_{\rm rd})_j(tx))\) gives the formula. Smoothness of the fixed reference curvature and differentiation under this integral yield \(|E|\le C|x|^2\), \(|DE|\le C|x|\), and \(F_{\rm rd}(x)=F_0+O(|x|)\) in fixed coefficient norms. The radial frame is smooth by smooth dependence of the parallel-transport ODE on the coordinate endpoints. These checks use only one fixed round chart. [E240 radial gauge][e240]

Let \(A_L=A_r^{\rm loc}\) be the E235 polynomial. Write \(A_L=A_1+A_3\) with \(A_1=\iota_x F^*/2\), \(F_i^*=-s_i\Sigma_i\), \(s_i=\sqrt{(Q_r)_{ii}}\), and \(A_3\) its homogeneous cubic term. For \(0<\epsilon\le1\) the eigenvalues of \(Q_r=\operatorname{diag}(2/(1+r),1,2r/(1+r))\) are in \([2/3,4/3]\). Its gradient \(G_r\), the diagonal direction \(T\), and \(d=\sqrt{\det Q_r}\) are bounded in fixed norms. The prescribed coefficient satisfies \(\epsilon\mu(r)=O(1)\), directly from its formula, so \(B=-G_r+\mu(r)T\) and \(U=B-d(Q_r-I)/2\) are \(O(\epsilon^{-1})\). The coefficients \(V_i^a=-\sum_j U_{ij}J_jdx^a/s_j\) are \(O(\epsilon^{-1})\) as the square roots have a uniform positive floor. For \(\ell=|x|\) this gives \(|A_3|\le C\epsilon^{-1}\ell^3\), \(|DA_3|\le C\epsilon^{-1}\ell^2\). These are polynomial coefficient estimates on the fixed chart, regardless of the E235 radius. [E235 polynomial and Hessian][e235] · [Assessed local identity][a235]

All subsequent big-O constants are independent of small positive \(\epsilon\), the radius \(0<\ell\le R=\epsilon^2<R_0\), the unit Euclidean direction \(n=x/\ell\), and the cutoff parameters in the fixed rectangle
\[
 \mathcal P_0=[0,1]\times[-5/2,0].
\]
They can depend on the fixed chart, reference and cutoff. In particular, for \(\Delta F=F^*-F_0\) and \(a=A_L-A_{\rm rd}\),
\[
 a=\tfrac12\iota_x\Delta F+O(\ell^2+\epsilon^{-1}\ell^3),
 \qquad |Da|\le C(\epsilon+\ell+\epsilon^{-1}\ell^2).
\]
Here \(\Delta F=O(\epsilon)\), since \(Q_r-I=O(\epsilon)\) and the positive square root is smooth on the fixed spectral interval. Thus \(|a|\le C\epsilon\ell\) on \(0<\ell\le R\).

## Exact curvature formula and the self-dual coefficient

For \(\ell>0\) set \(s=\ell/R\), \(u=c(s)\), \(v=s c'(s)\), and \(h=u+v/4\). Then \(d(c(\ell/R))=(v/\ell)n^\flat\), with the flat symbol referring to the coordinate Euclidean metric. On the cutoff support the actual curvature is given by the pointwise parameter formula
\[
 F(u,v,x,\epsilon)
   =F_{\rm rd}(x)+u\,d_{A_{\rm rd}}a(x)
        +\tfrac12u^2\bigl([a\wedge a]\bigr)(x)+\frac v\ell n^\flat\wedge a(x).
 \tag{1}
\]
This follows by substituting \(A_{\rm rd}+c(\ell/R)a\) into \(F=dA+[A\wedge A]/2\). For comparison below, \((u,v)\) are independent parameters of (1) at the fixed \(x\). This does not associate a new connection field to an arbitrary parameter pair. The actual cutoff values lie in \(\mathcal P_0\). At \((u,v)=(1,0)\), (1) is exactly \(F_L(x)\), since the first three terms are the curvature of \(A_{\rm rd}+a=A_L\).

The leading part and parameter errors in (1) can be read off from the same exterior identity. The exterior derivative of \(\iota_x\Delta F/2\) is \(\Delta F\). Since \(|A_{\rm rd}|=O(\ell)\) and \(|a|=O(\epsilon\ell)\) on \(B_R\),
\[
 \begin{aligned}
 d_{A_{\rm rd}}a
   &=\Delta F+O(\ell+\epsilon^{-1}\ell^2),\\
 \ell^{-1}n^\flat\wedge a
   &=\tfrac12 n^\flat\wedge\iota_n\Delta F
                                      +O(\ell+\epsilon^{-1}\ell^2),\\
 [a\wedge a]&=O(\epsilon^2\ell^2).
 \end{aligned}
\]
The error in the first line follows from \(DA_3\), \(DE\) and the bracket \(O(\epsilon\ell^2)\). The second line uses the bound on the undifferentiated remainders, divided by \(\ell\). All operations are bounded in coefficient norms for every Euclidean unit \(n\). Consequently
\[
 F(u,v,x,\epsilon)
   =F_0+u\Delta F+\tfrac v2 n^\flat\wedge\iota_n\Delta F+\mathcal E,\qquad
 |\mathcal E|+|\partial_u\mathcal E|+|\partial_v\mathcal E|
      \le C(\ell+\epsilon^{-1}\ell^2)\le C'\epsilon^2 .
 \tag{2}
\]
The derivative bounds follow term by term by differentiating the coefficients \(u,u^2/2,v\) in (1). The round term has zero parameter derivative. Also \(\ell^2/\epsilon\le\epsilon^3\) on this radius. Bound (2) accommodates all angular directions and endpoints of the parameter rectangle. Both the scale and all coefficient norms are on the fixed chart.

Use the Euclidean star at the center, with constant coefficient action on the coordinate forms. For a self-dual two-form \(\beta\) and a Euclidean unit \(n\), decomposition with respect to the normal direction gives
\[
 \beta=n^\flat\wedge\iota_n\beta+*_{\rm eucl}(n^\flat\wedge\iota_n\beta),
 \quad\text{so}\quad (n^\flat\wedge\iota_n\beta)^+=\tfrac12\beta.
\]
The splitting is exact in a Euclidean frame starting with \(n\), as the star interchanges the normal and the tangential two-form subspaces. Each component of \(\Delta F\) is Euclidean self-dual, so (2) has self-dual leading perturbation \((u+v/4)\Delta F\). This gives the asserted coefficient, including both factors \(1/2\).

For the normalized quotient use the fixed positive coordinate volume and the map
\[
 \mathcal M_{ij}(F)=\frac{F_i\wedge F_j}{2dV_{\rm eucl}},\qquad
 \mathcal Q(F)=\frac{3\mathcal M(F)}{\operatorname{tr}\mathcal M(F)} .
\]
At \(F_0\), \(\mathcal M=I\). There is a fixed convex coefficient neighborhood of \(F_0\) in which \(\mathcal M\) is positive, the trace stays bounded below, and the first two derivatives of \(\mathcal Q\) are bounded. All values in (2) lie there for small \(\epsilon\), by the uniform \(O(\epsilon)\) norm bound. The derivative \(D\mathcal Q_{F_0}\) kills anti-self-dual directions, since the derivative of the wedge product pairs with the self-dual \(F_0\) components. Let \(D=\operatorname{diag}(-1/2,0,1/2)\). The exact \(Q_r\) gives \(Q_r=I+\epsilon D+O(\epsilon^2)\) and \(s_i=1+\epsilon D_{ii}/2+O(\epsilon^2)\). The derivative of \(\mathcal M\) on \(\Delta F_i=(s_i-1)F_{0,i}\) is diagonal with entries \(2(s_i-1)\). Removing the trace part leaves \(D\mathcal Q_{F_0}[\Delta F]=\epsilon D+O(\epsilon^2)\).

Taylor expansion of \(\mathcal Q\) in (2) now gives, uniformly,
\[
 \begin{aligned}
 Q(u,v,x,\epsilon)&=I+\epsilon hD+O(\epsilon^2),\\
 \partial_u Q&=\epsilon D+O(\epsilon^2),&
 \partial_v Q&=\tfrac{\epsilon}{4}D+O(\epsilon^2).
 \end{aligned}
 \tag{3}
\]
For the derivatives, the chain rule uses \(D\mathcal Q_F-D\mathcal Q_{F_0}=O(\epsilon)\) and \(\partial_u F,\partial_v F=O(\epsilon)\) from (2). Thus the derivative errors are genuine uniform \(O(\epsilon^2)\) estimates even at repeated eigenvalues of \(Q\). No estimates on \(x\)-derivatives of those parameter errors are needed.

The ratio and \(Q\) are unchanged by replacing the fixed volume in \(\mathcal M\) by another positive one, as the numerator matrix and its trace gain the same scalar. In particular there is no spatial reference-volume error from using the fixed Euclidean denominator. Internal changes of oriented old orthonormal frame give orthogonal conjugacies. Native internal rescaling doubles both numerator and trace, keeping the same \(Q\) and ratio. The Euclidean star was used only in the derivative at the center reference form, so (3) does not treat the varying reconstructed metric as Euclidean.

## Uniform strict decrease for the uncut germ on the full ball

In the fixed chart the curvature of the odd polynomial is even in coordinate coefficients. More precisely,
\[
 F_L=F^*+F_2+F_4+F_6,\qquad
 F_2=dA_3+\tfrac12[A_1\wedge A_1],\quad
 F_4=[A_1\wedge A_3],\quad F_6=\tfrac12[A_3\wedge A_3].
\]
Thus \(|F_2|\le C\epsilon^{-1}\ell^2\), \(|F_4|\le C\epsilon^{-1}\ell^4\), and \(|F_6|\le C\epsilon^{-2}\ell^6\) by the preceding coefficient estimates. For \(\ell\le R\) and \(\epsilon\le1\), \(|F_L-F^*|\le C\epsilon^{-1}\ell^2\) and \(|F_4+F_6|\le C\epsilon^{-2}\ell^4\). The normalized wedge map is smooth in the same fixed curvature neighborhood, so its exact degree-two term is \(D\mathcal Q_{F^*}[F_2]\), with error bounded by \(C\epsilon^{-2}\ell^4\). E235 computes the complete ordinary Hessian of this quotient to be \(B\delta_{ab}\). Since the degree-two term agrees with the Hessian's Taylor polynomial,
\[
 Q_L(x)=Q_r+\tfrac12 B\ell^2+\mathcal J(x),\qquad
 |\mathcal J(x)|\le C\epsilon^{-2}\ell^4,\qquad
 |Q_L(x)-Q_r|\le C_P\epsilon^{-1}\ell^2 .
 \tag{4}
\]
The quotient is even as well. The Hessian identity is used only at the center, and (4) supplies its own uniform remainder on the entire chosen ball. [E235 ordinary quotient Hessian][e235]

Write \(W=Q_L(x)-Q_r\). The two adjacent gaps at \(Q_r\) are exactly \(\epsilon/(2+\epsilon)\ge\epsilon/3\) for \(\epsilon\le1\). Along \(Q_r+\theta W\), \(0\le\theta\le1\), each ordered eigenvalue changes by at most \(\|W\|_{\rm op}\le C_P\epsilon^3\), by the min–max characterization of symmetric eigenvalues and (4). Shrink \(\epsilon\) so \(2C_P\epsilon^2\le1/6\). The gaps are then at least \(\epsilon/6\) and the eigenvalues at least \(1/2\) along the whole segment. On this simple-spectrum segment, normalized differentiation for a unit eigenvector \(w_i(\theta)\) gives
\[
 \lambda_i'=\langle w_i,Ww_i\rangle,\qquad
 \lambda_i''=2\sum_{j\ne i}
 \frac{|\langle w_j,Ww_i\rangle|^2}{\lambda_i-\lambda_j}.
\]
The second formula follows by projecting the derivative of \((Q_r+\theta W)w_i=\lambda_iw_i\) onto the other two eigendirections. Positivity and the gap bound imply \(|(\log\lambda_i)''|\le C\epsilon^{-1}\|W\|_{\rm op}^2\). Hence for \(f=\log\rho\),
\[
 f(Q_L(x))=f(Q_r)+df_{Q_r}[W]+O(\epsilon^{-1}\|W\|_{\rm op}^2)
          =\log r-\tfrac12|G_r|^2\ell^2+O(\epsilon^{-3}\ell^4).
 \tag{5}
\]
Here \(df_{Q_r}\) is uniformly bounded since the eigenvalues of \(Q_r\) are uniformly bounded below. Its contribution from \(\mathcal J\) is \(O(\epsilon^{-2}\ell^4)\), and \(df_{Q_r}[B]=-|G_r|^2\) by the assessed germ. The norm of \(G_r\) has a uniform positive floor: \(G_{r,33}-G_{r,11}=1/a+1/b=(r+1)^2/(2r)\ge2\), where \(a=2/(1+r)\) and \(b=2r/(1+r)\) are the extreme center eigenvalues. Thus \(|G_r|^2\ge2\) by Cauchy–Schwarz. If \(C_T\) is the uniform remainder constant in (5), then \(C_T\epsilon^{-3}\ell^4\le C_T\epsilon\ell^2\) at \(\ell\le R\). Shrinking so \(C_T\epsilon\le1/2\) yields \(f(Q_L(x))\le\log r-\ell^2/2\) for every \(0<\ell\le R\).

## High- and low-\(h\) parameter regimes

For \((u,v)\in\mathcal P_0\), \(-5/8\le h\le1\). In the high regime \(h\ge1/2\), the ordered eigenvalues of \(I+\epsilon hD\) have gaps at least \(\epsilon/4\). By (3), for small \(\epsilon\), the actual gaps are at least \(\epsilon/8\). The eigenvectors also have uniform angular control. If \(Qw_i=\lambda_iw_i\) with \(|w_i|=1\), and \(\ell_j^0\) are the diagonal entries of \(I+\epsilon hD\), then
\[
 (\lambda_i-\ell_j^0)\langle e_j,w_i\rangle
     =\langle e_j,(Q-I-\epsilon hD)w_i\rangle\qquad(j\ne i).
\]
Each denominator has magnitude at least \(\epsilon/8\) for small \(\epsilon\), using the model eigenvalue gaps and the individual eigenvalue shift bound \(O(\epsilon^2)\). Hence \(|\langle e_j,w_i\rangle|=O(\epsilon)\) for \(j\ne i\). Choosing the sign with nonnegative \(i\)-component gives \(w_i=e_i+O(\epsilon)\). The estimate holds simultaneously for the whole high-\(h\) part of the rectangle and every \(0<|x|\le R\).

For either parameter \(p=u,v\), simple-eigenpair differentiation gives \(\partial_p\lambda_i=w_i^{\mathsf T}(\partial_p Q)w_i\). With (3), the ordered extremes have \(u\)-derivatives \(-\epsilon/2+O(\epsilon^2)\) and \(+\epsilon/2+O(\epsilon^2)\), and \(v\)-derivatives \(-\epsilon/8+O(\epsilon^2)\) and \(+\epsilon/8+O(\epsilon^2)\). The eigenvalues are \(1+O(\epsilon)\), whence
\[
 \partial_u f=\epsilon+O(\epsilon^2),\qquad
 \partial_v f=\tfrac14\epsilon+O(\epsilon^2).
\]
After one uniform reduction of \(\epsilon\), these are at least \(\epsilon/2\) and \(\epsilon/8\), respectively. At a point with actual \(h\ge1/2\), join \((1,0)\) to \((u,v)\) by \(\theta\mapsto(1+\theta(u-1),\theta v)\). It stays in \(\mathcal P_0\), with \(h(\theta)\ge1/2\) by linearity. The integrand for \(f\) along it is at most
\[
 (u-1)\epsilon/2+v\epsilon/8
 =-\tfrac{\epsilon}{2}\bigl((1-u)+|v|/4\bigr)
\]
since \(u-1\le0,\ v\le0\). Thus \(f(Q(u,v,x,\epsilon))\le f(Q_L(x))\). The parameter change is strictly negative unless \(u=1,v=0\), and (5) already gives strict decrease from \(\log r\) at every nonzero \(x\). This argument applies at the boundary \(h=1/2\) as well.

In the low regime \(h\le1/2\), \(|h|\le5/8\). By min–max and (3) the eigenvalues are between \(1-b_\epsilon\) and \(1+b_\epsilon\) with \(b_\epsilon=(5/16)\epsilon+C_Q\epsilon^2\), where \(C_Q\) is the uniform matrix error in (3). If \(\epsilon\le1/4\) and \(C_Q\epsilon\le1/64\), then \(b_\epsilon\le(21/64)\epsilon\) and
\[
 \rho(Q)\le\frac{1+b_\epsilon}{1-b_\epsilon}
    \le1+\frac{168}{235}\epsilon
    <1+\tfrac34\epsilon<r .
\]
This uses only eigenvalue Lipschitz bounds and covers the possible repeated spectra, including \(h=0\) and negative \(h\).

## Global assembly and uniform quantifiers

The local form difference \(a=A_L-A_{\rm rd}\) is adjoint-valued and transforms homogeneously because the inhomogeneous parts of the two connection transformations cancel. The cutoff difference has support strictly inside the chart and extends smoothly by zero. Thus \(A_\epsilon=A_{\rm rd}+c(|x|/R)a\) defines an actual smooth global connection on the same bundle. Its \(\|A_\epsilon-A_{\rm rd}\|_{C^0}\) is \(O(\epsilon R)=O(\epsilon^3)\), and its fixed-reference \(C^1\) difference is \(O(\epsilon)\). For the latter use \(|a|\le C\epsilon\ell\) and \(|d(c(\ell/R))|\le(5/2)/R\), as well as the uniform bound on \(Da\). The fixed metric and frame changes are bounded on the compact chart and add only bounded multiples of the undifferentiated difference to its first covariant derivative. The curvature difference is \(O(\epsilon)\) by the exact curvature formula and (2). Within \(B_R\) the uniformly close curvatures lie in the fixed convex neighborhood of \(F_0\) used for the quotient. The positive plane and round-compatible orientation sign persist along the segment to \(F_0\) in that neighborhood. Outside the support the connection is the positive definite round reference.

For a concrete uniform choice, take positive constants at least one in the bounds above. Let \(\eta_0\) be a fixed radius of the curvature neighborhood, and take \(C_F\) for the uniform \(O(\epsilon)\) curvature deviation from \(F_0\) in that chart, including the uncut \(F^*\) and \(F_L\). Let \(C_{\rm par}\) bound the high-regime \(O(\epsilon^2)\) errors in the two \(f\)-derivatives after the gap restriction. One may choose \(\epsilon_0\) smaller than
\[
 \min\left\{\tfrac14,\sqrt{R_0},\frac{\eta_0}{C_F},
           (12C_P)^{-1/2},\frac1{2C_T},
           \frac1{64C_Q},\frac1{8C_{\rm par}}\right\}.
\]
The \(C_Q\) restriction covers the small matrix error used in the high-regime gap and angular estimates. Each constant depends only on the fixed data, and all these restrictions are independent of \(x,u,v,n\). In particular no lower bound on a previously chosen E235 radius enters.

At \(p\) the cutoff is identically one nearby, so the exact value is \(r\). For each \(0<|x|\le R\) either of the two parameter estimates gives strict inequality. At \(R\) and all points outside the support the ratio is \(1\). The plateau endpoints are covered as actual parameter values, including \((1,0)\) where the polynomial bound alone is strict away from \(p\). Consequently \(p\) is the unique global maximum. This establishes the prescribed global **initial** cap on the standard sphere. No global flow conclusion is used or derived in this audit.

## Frozen identities

All four frozen input hashes matched. No new source access, numerical search or alternative family was used. Only this independent review and its return were written.

| Input | SHA-256 |
| --- | --- |
| [E244 request][request] | eb4ee0448b464867789e6eb75fe75e1645e30e09933c8906faec5755698589fa |
| [B112][b112] | 65f4bc96b23c11bae954d31e81d0dd5e377a1ef8a08ee49ec24407c8677fc037 |
| [E235][e235] | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
| [E235/E236 assessment][a235] | c8f229dbc5421449ccc1e548af0502d5524a8bf771d7e9544efed5ce846a7c50 |
| [E240 returned derivation][e240] | e8bf6be314dbde48a6495057f800de637534dbc7ec1c5b6d0c054514540770fa |

[request]: ../research-progress/handoffs/SP4-CME-E244_REQUEST_v1.md
[b112]: ../brainstorm/notes/B112_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md
[e235]: ../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md
[a235]: E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md
[e240]: ../notes/240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md
