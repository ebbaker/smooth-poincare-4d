# E251 — Uniform compact-parameter static spectral cap family

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E derivation under B114, configured gpt-6.2-sol / ultra. Independent runtime and selected lead settings are unavailable. I authored E249's independent fixed-ratio model audit and the earlier E244 near-round cap audit. This derivation uses the separately assessed E248–E250 static statement, E249's exact model, the E235 polynomial and the E243 fixed cutoff. It adds uniformity over a compact ratio interval. [Request][request] · [B114 decision][b114]

## Static statement and fixed choices

Fix a finite \(r_0>1\) and a compact interval \(I=[r_-,r_+]=[r_0-\eta,r_0+\eta]\subset(1,\infty)\) with \(\eta>0\). Fix the standard smooth oriented round \(S^4\), its positive chiral principal \(SO(3)\) bundle \(P\), its round-compatible perfect connection \(A_{\rm rd}\), and a point \(x_0\). Use one oriented old \(K=1\) normal coordinate chart \(x\) centered at \(x_0\) and one fixed radial gauge of \(A_{\rm rd}\) in it. Fix the E243 smooth radial function \(c\), with \(c=1\) on \([0,1/2]\), \(c=0\) on \([1,\infty)\), and \(0\le-c'\le5/2\). There is a single radius \(R>0\), independent of \(r\in I\), such that the exact E235 polynomial \(A_L(r)\) patched by this cutoff gives
\[
 A_r=A_{\rm rd}+c(|x|/R)(A_L(r)-A_{\rm rd})
\]
in the chart, with the difference extended by zero outside. The \(A_r\) are smooth positive definite round-compatible connections on \(P\), with a smooth map \(I\to\mathcal A^\infty(P)\). For each \(r\), the native trace-three quotient has unique global ratio maximum \(r\) at \(x_0\). The native directional derivative of \(\log\rho\) along the original vector field at \(x_0\) is \(1/2\). For each finite order the relevant spatial and parameter derivatives of the connection family are bounded on \(I\). All fixed choices and bounds are allowed to depend on \(I\) and the prescribed round geometry. [Assessed fixed-ratio family][a248]

## Joint local regularity and one strict-maximum radius

In the fixed Euclidean coefficient frame let \(F_0=F_{\rm rd}(x_0)=-\Sigma\) with the normalized self-dual triple. Set
\[
 p(r)=\sqrt{2/(1+r)},\qquad q(r)=\sqrt{2r/(1+r)},\qquad
 Q_r^*=\operatorname{diag}(p(r)^2,1,q(r)^2),\qquad
 F_i^*(r)=-s_i(r)\Sigma_i ,
\]
where \(s(r)=(p(r),1,q(r))\). The E235 polynomial is \(A_L(r)=L_r+C_r\), \(L_r(x)=\frac12\iota_xF^*(r)\), \(C_r(x)=\frac16\sum_a(x^a)^3V_r^a\). Its coefficient functions are smooth on \(r>1\). In particular, the E235 scalar coefficient has denominators involving \(r-1\) and \(\sqrt r\), and the \(V_r^a\) use \(s_i(r)^{-1}\). On \(I\) these denominators have positive lower bounds by \(r_->1\) and \(p(r_+)>0\). The other coefficients \(G_r,T_r,d_r,B_r,U_r\) are smooth there by their explicit formulas. All derivatives of each fixed order are bounded on \(I\), by compactness of \(I\) inside the domain of the formulas. Consequently \(A_L(r,x)\) and its actual curvature \(F_L(r,x)\) are jointly smooth in \((r,x)\), with uniform coefficient and derivative bounds on \(I\) times any fixed closed coordinate ball. In particular,
\[
 F_L(r,x)=F^*(r)+O_I(|x|^2).
\]
This last bound also holds after \(\partial_r\), since the curvature polynomial is even in \(x\), with the first nonconstant degree two, and the coefficient bounds apply to the derivative. [E235 coefficients and quotient Hessian][e235]

At \(x=0\) the curvature wedge Gram relative to \(2dV_{\rm e}\) is \(Q_r^*\), with minimum eigenvalue at least \(p(r_+)^2>0\). The two adjacent normalized gaps are both \((r-1)/(r+1)\), bounded below on \(I\) by \(g_I=(r_--1)/(r_-+1)>0\). The uniform curvature estimate gives a common positive Gram floor on a sufficiently small fixed closed ball: the wedge Gram is polynomial in the curvature coefficients on a bounded set. The quotient \(\mathcal Q(F)=3\mathcal M(F)/\operatorname{tr}\mathcal M(F)\), \(\mathcal M_{ij}(F)=F_i\wedge F_j/(2dV_{\rm e})\), is smooth on a fixed neighborhood of those compact positive values. In particular the normalized quotient stays uniformly close to \(Q_r^*\) as \(|x|\to0\), uniformly in \(r\in I\). Ordered min–max gives a common simple-spectrum ball after shrinking to keep each adjacent gap at least \(g_I/2\). Thus
\[
 f_L(r,x)=\log\rho\bigl(\mathcal Q(F_L(r,x))\bigr)
\]
is jointly smooth on a neighborhood of \(I\) times a sufficiently small closed ball. At \(x=0\) the assessed E235 calculation gives \(f_L(r,0)=\log r\), \(D_xf_L(r,0)=0\) and \(D_x^2 f_L(r,0)=-|G_r|^2 I_4\) in the fixed chart.

Put \(\Gamma=\min_{r\in I}|G_r|^2>0\). On the compact product, uniform continuity of \(D_x^2 f_L\) allows one radius \(R_{\rm loc}>0\) on which \(D_x^2 f_L(r,x)\le-(\Gamma/2) I_4\) simultaneously for all \(r\in I\). Integrating along the straight coordinate segment from \(0\) to \(x\) yields
\[
             f_L(r,x)\le\log r-\tfrac{\Gamma}{4}|x|^2
                    \qquad(r\in I,\ |x|\le R_{\rm loc}).
 \tag{1}
\]
This chooses a common local radius directly from the smooth E235 family and its negative Hessian. No regularity of a choice of individual fixed-\(r\) radii is assumed. [Assessed local family][a248]

## Model floor, one corner box and complementary gap

On the fixed rectangle \(\mathcal P_0=[0,1]\times[-5/2,0]\), for a Euclidean unit direction \(n\), let
\[
 F_{\rm mod}(r,u,v,n)=F_0+u\Delta F(r)
             +\tfrac v2 n^\flat\wedge\iota_n\Delta F(r),
 \qquad \Delta F(r)=F^*(r)-F_0.
\]
The accepted E249 reflection calculation gives the full diagonal Gram of this angular two-form family, independent of \(n\):
\[
 M_i(r,u,v)=(1+u\delta_i(r))
             (1+(u+v/2)\delta_i(r)),\qquad
 \delta_i(r)=s_i(r)-1,\qquad M_2=1.
 \tag{2}
\]
The negative Gram of the reflected anti-self-dual triple contributes the difference of squares in (2), so the complete wedge Gram is used. The same exact computation covers every direction. Its lower bounds \(p(r)^2,1,(9-5q(r))/4\) on the three entries give a common positive lower bound
\[
           m_I=\min\{p(r_+)^2,1,(9-5q(r_+))/4\}>0 .
\]
Here \(p\) decreases and \(q\) increases in \(r\), with \(q(r)<\sqrt2\). Formula (2) is smooth in \(r,u,v\), with a trace upper bound by compactness. Thus the normalized \(Q_{\rm mod}=3\,\operatorname{diag}(M_1,M_2,M_3)/\sum_i M_i\) has a common positive eigenvalue floor as well. The six-quotient computation in E249 gives \(\rho(Q_{\rm mod})\le r\) for every \(r\in I\), with equality only at \((1,0)\). It accounts for changing order of the model entries on the full rectangle. [E249 exact Gram and quotients][e249] · [Lead assessment][a248]

At the corner \((1,0)\), \(Q_{\rm mod}=Q_r^*\) and \(M_1<1<M_3\), with ordered normalized gaps at least \(g_I\). By (2), the two corner derivatives of the model log ratio are \(2(1/p(r)-1/q(r))\) and \(\frac12(1/p(r)-1/q(r))\). Both have a common positive lower bound, since \(p<q\) and \(I\) is compact in \(r>1\). Use continuity of the diagonal entries and then of the simple log-ratio derivatives to choose one closed convex box
\[
 C_\vartheta=[1-\vartheta,1]\times[-\vartheta,0]\subset\mathcal P_0
\]
for all \(r\in I\). There are constants \(\sigma,\mu>0\) such that on \(I\times C_\vartheta\) the order is \(M_1<1<M_3\), the normalized gaps are at least \(\sigma\), and both \(\partial_u\log\rho(Q_{\rm mod})\) and \(\partial_v\log\rho(Q_{\rm mod})\) are at least \(\mu\). One may first preserve the gaps by uniform continuity, then use the smooth ratio \(M_3/M_1\) there to preserve the derivative bounds. This choice is uniform in \(r\) by compactness of the whole corner set \(I\times\{(1,0)\}\).

Let \(U_\vartheta=\{(u,v)\in\mathcal P_0:u>1-\vartheta,\ v>-\vartheta\}\). It is relatively open, contains the corner and is contained in \(C_\vartheta\). On the compact complement \(K_\vartheta=\mathcal P_0\setminus U_\vartheta\), define the gap using each parameter's own cap:
\[
            \gamma=\min_{(r,u,v)\in I\times K_\vartheta}
                        \bigl(r-\rho(Q_{\rm mod}(r,u,v))\bigr)>0 .
 \tag{3}
\]
The function is continuous by positivity and ordered min–max, and it is strictly positive throughout this compact set by the unique equality locus. This ensures a uniform strict comparison even where the eigenvalues on the complement are repeated.

## Uniform transfer of the actual annular curvature

Use the old radial-gauge coefficients of the fixed round connection,
\[
 A_{\rm rd}(x)=\tfrac12\iota_xF_0+O(|x|^2),\qquad
 F_{\rm rd}(x)=F_0+O(|x|).
\]
These follow from the radial integral of the fixed smooth reference curvature. For \(\ell=|x|\) and \(n=x/\ell\), \(a_r=A_L(r)-A_{\rm rd}\) then obeys
\[
 a_r(x)=\tfrac\ell2\iota_n\Delta F(r)+O_I(\ell^2),\qquad
 [a_r\wedge a_r]=O_I(\ell^2).
\]
The errors obey the same bounds after \(\partial_r\) because the reference is fixed and the coefficients of \(A_L\) and their parameter derivatives are bounded. In the annulus \(R/2\le\ell\le R\), extend the exact curvature formula to pointwise rectangular parameters \((u,v)\) at fixed \(r,x\):
\[
 F_{\rm act}
 =F_{\rm rd}(x)+u(F_L(r,x)-F_{\rm rd}(x))
   +\tfrac12u(u-1)[a_r\wedge a_r]
   +\frac v\ell n^\flat\wedge a_r.
 \tag{4}
\]
At \(u=c(\ell/R),\ v=(\ell/R)c'(\ell/R)\) this is the actual curvature of \(A_r\). The bracket normalization follows from \(F_L-F_{\rm rd}=d_{A_{\rm rd}}a_r+[a_r\wedge a_r]/2\) and differentiation of the scalar cutoff. The endpoint \(F_{\rm act}(r,1,0,x)=F_L(r,x)\) is exact, at the same fixed \(x\). The Euclidean flat map in (4) is the coordinate one entering the cutoff derivative.

Subtracting \(F_{\rm mod}\) from (4) gives the errors \((1-u)(F_{\rm rd}-F_0)+u(F_L-F^*)\), the \(u(u-1)\) bracket, and the radial term after replacing \(a_r\) by \(\ell\iota_n\Delta F(r)/2\). These have sizes \(O_I(\ell),O_I(\ell^2),O_I(\ell)\) on the full rectangular range. Differentiating in \(u,v\) preserves the bounds by the displayed coefficients, and differentiation in \(r\) also preserves them by the joint coefficient bounds above. Thus
\[
 \|F_{\rm act}-F_{\rm mod}\|_\infty+
 \|\partial_u(F_{\rm act}-F_{\rm mod})\|_\infty+
 \|\partial_v(F_{\rm act}-F_{\rm mod})\|_\infty+
 \|\partial_r(F_{\rm act}-F_{\rm mod})\|_\infty
 \le C_I R .
 \tag{5}
\]
The suprema are over all \(r\in I\), \(R/2\le\ell\le R\), \(n\in S^3\), and \((u,v)\in\mathcal P_0\). Contraction and wedge by Euclidean unit \(n\) have uniform coefficient bounds. No near-round smallness of \(\Delta F(r)\) is used. [E243 exact radial formula][e243] · [E249 fixed-ratio transfer][e249]

The model curvature image for \(I\times\mathcal P_0\times S^3\) is compact. Its positive Gram floor and (5) put every pointwise segment between \(F_{\rm mod}\) and \(F_{\rm act}\) inside a bounded neighborhood with a common positive Gram and trace floor when \(R\) is small. The first two derivatives of \(\mathcal Q\) are uniformly bounded there. It follows that
\[
 \|Q_{\rm act}-Q_{\rm mod}\|_\infty+
 \sum_{\zeta\in\{u,v,r\}}
       \|\partial_\zeta(Q_{\rm act}-Q_{\rm mod})\|_\infty
       \le C'_I R .
 \tag{6}
\]
For a parameter derivative the difference is \(D\mathcal Q_{F_{\rm act}}[\partial_\zeta(F_{\rm act}-F_{\rm mod})]\) plus \((D\mathcal Q_{F_{\rm act}}-D\mathcal Q_{F_{\rm mod}})[\partial_\zeta F_{\rm mod}]\). The model derivatives are uniformly bounded by smoothness and compactness, and the second quotient derivative controls the latter difference along the same positive segment. The fixed coordinate wedge volume is allowed because a positive volume change multiplies the Gram numerator and its trace by the same factor.

On the corner \(I\times C_\vartheta\), min–max and (6) keep the actual eigenvalues simple with common lower eigenvalue and gap bounds. The model ordered eigenvectors are the fixed coordinate lines there. For an actual ordered unit eigenvector \(w_i\) and model diagonal eigenvalues \(\lambda^0_j\), projection of the eigenvector equation gives, for \(j\ne i\),
\[
 (\lambda_i-\lambda^0_j)\langle e_j,w_i\rangle
        =\langle e_j,(Q_{\rm act}-Q_{\rm mod})w_i\rangle .
\]
The denominators have a common positive lower bound for small \(R\). Hence the off-line components are \(O_I(R)\), and the extreme eigenvalue derivative formula \(w_i^{\mathsf T}\partial_\zeta Q_{\rm act}w_i\) and (6) give convergence of both log-ratio partial derivatives for \(\zeta=u,v\), uniformly on this corner and across all annular points. Take one \(R\) small enough that both are at least \(\mu/2\). Then the segment from \((1,0)\) to any \((u,v)\in C_\vartheta\) stays in this box, and its coordinate displacements \(u-1,v\) are nonpositive. Integrating the partial derivatives gives
\[
 \log\rho(Q_{\rm act}(r,u,v,x))
     \le \log\rho(Q_{\rm act}(r,1,0,x))=f_L(r,x)<\log r
\]
on the annulus, using (1) once \(R\le R_{\rm loc}\). This includes \((1,0)\) at every punctured spatial point.

On \(I\times K_\vartheta\), all actual and model normalized matrices have their least eigenvalue at least some \(m'_I>0\) for small \(R\). Since the largest eigenvalues are at most \(3\) by trace three, ordered min–max gives
\[
 |\rho(Q_{\rm act})-\rho(Q_{\rm mod})|
    \le\bigl((m'_I)^{-1}+3(m'_I)^{-2}\bigr)
                                  \|Q_{\rm act}-Q_{\rm mod}\|_{\rm op}.
\]
One further uniform decrease of \(R\) makes this at most \(\gamma/2\). By (3) the actual ratio is strictly below \(r\) there, including at repeated eigenvalues. The closed corner and the compact complement together cover the whole rectangle.

## A single support, smooth parameter dependence and exact native tangent

Choose \(R>0\) below the fixed chart radius, \(R_{\rm loc}\), and the uniform thresholds in (5)–(6) and the two comparisons. This is a finite list of positive restrictions depending only on \(I\) and the fixed data. Use this same \(R\) from now on. The connection difference \(a_r\) transforms homogeneously in the adjoint bundle, and the fixed smooth multiplier \(c(|x|/R)\) is one near zero and zero on the exterior of the cutoff ball. The product extends smoothly by zero, defining a global connection on \(P\) for every \(r\in I\). The annulus is positive by its comparison with the model Gram, the core by the uniform local argument, and the exterior by the reference. The orientation sign is locally constant in this definite class on the connected sphere, and the nonempty round exterior fixes it to the round-compatible sign. The inner ball is exactly the uncut polynomial, with strict inequality away from \(x_0\) by (1). The annulus has been checked uniformly, and on the round exterior the ratio is \(1<r\). At \(x_0\) the exact ratio is \(r\). This proves its unique global maximizing point for every \(r\in I\).

For parameter regularity, subtract the fixed globally patched connection \(A_{r_0}\). In the fixed chart the E235 polynomial has finitely many smooth scalar coefficient functions \(a_\nu(r)\) multiplying fixed polynomial adjoint-valued one-forms. Multiplying each such form by the fixed cutoff and extending by zero gives fixed global smooth sections \(s_\nu\) of \(T^*S^4\otimes\operatorname{ad}P\). The difference therefore has the form
\[
                A_r-A_{r_0}=\sum_{\nu}
                           (a_\nu(r)-a_\nu(r_0))s_\nu .
\]
This finite sum is smooth as a map to the affine Fréchet space of \(C^\infty\) connections. The formula extends to an open parameter interval containing \(I\), since the E235 coefficients are smooth for \(r>1\). For each fixed pair of nonnegative orders \(j,k\), \(\|\partial_r^j(A_r-A_{r_0})\|_{C^k}\) is bounded on \(I\) in the fixed round background norms. The cutoff derivatives may enter those bounds through the chosen positive \(R\), which is now fixed. The same reasoning yields jointly smooth curvature and quotient with bounded finite-order derivatives on \(I\times S^4\), using the just-established uniform positive Gram floor. This does not require differentiability of the spectral ratio at repeated eigenvalues outside the local simple region.

Near the same \(x_0\), the cutoff equals one on the fixed inner ball, so the connection germ is exactly E235 at every \(r\in I\). The old trace-three quotient is unchanged by native normalization, as the internal scaling doubles the wedge numerator and its trace. At old \(K=1\) the native metric is twice the old metric and the original native velocity is half the old one. Thus the exact old log-ratio directional derivative \(1\) at \(x_0\) gives native \(1/2\) for every \(r\). This is the native directional derivative on the static connection germ. [E235 exact tangent and conversion][e235]

## Scope and verified identities

The argument gives one smooth compact-parameter family in the prescribed class on the supplied standard sphere. It makes no assertion of a uniform radius or seminorm as \(r_0\downarrow1\) or \(r_0\to\infty\). No parameter-dependent existence, crossing of a strict cap, convergence or global lifetime is inferred. The uniformization uses the existing E235 curvature and tangent calculation and E243/E249 cutoff algebra. No external theorem, additional source inspection, numerical computation or alternate family was used. All five frozen inputs matched. Only the assigned note and return were written.

| Input | SHA-256 |
| --- | --- |
| [E251 request][request] | 6ccf48ab026bb06db4ef96b146615afc317e49cd95b0c46bc48be69132fc6831 |
| [B114][b114] | 26aa8d71e5d10831926f2cf61ecf6a90c0f4bf2d05f056b8e69056dec2208f13 |
| [E248–E250 assessment][a248] | e740bb27791bf82eac9c160dc7f41570282d989c11cde67a18380382e34cfa19 |
| [E235 polynomial][e235] | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
| [E243 cutoff][e243] | 7c29df2ad8a5acd3aabcce9b79e5a9e9628c784028997ce8512421c4ded50cb0 |
| [E249 fixed-ratio audit][e249] | fbb09ae0835de9de37415fcfa05470e84ac55601a9056a2c9f9e5d5b5c2c17d0 |

[request]: ../research-progress/handoffs/SP4-CME-E251_REQUEST_v1.md
[b114]: ../brainstorm/notes/B114_PRESCRIBED_STRICT_CAPS_20261123.md
[a248]: ../reviews/E248_E250_FIXED_RATIO_CAP_ASSESSMENT_20261123.md
[e235]: 235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md
[e243]: 243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md
[e249]: ../reviews/E249_FIXED_RATIO_RADIAL_MODEL_AUDIT_20261123.md
