# E249 — Independent fixed-ratio radial model audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E verification under B113, configured gpt-6.2-sol / ultra. Independent runtime attestation and selected lead settings are unavailable. I authored E244's independent near-round cap audit, E246's integration audit, E237's all-ratio local source audit and E241's preceding flow application. The shared foundations here are the assessed E235 germ and the existing radial gauge and cutoff conventions. I independently derived the exact all-angle model and fixed-\(r\) static transfer. I did not read E248's output or correspondence. [Request][request] · [B113 route][b113]

## Verdict

Pass. For each fixed finite \(r>1\), the prescribed E235 polynomial and E243 cutoff on the supplied standard oriented smooth round \(S^4\) and positive chiral \(SO(3)\) bundle give, at a sufficiently small radius depending on \(r\), a smooth positive definite round-compatible connection with exact ratio cap \(r\) attained only at its center \(x_0\). The model's wedge Gram is diagonal with the proposed entries on the full parameter rectangle. Its unique equality parameter is \((u,v)=(1,0)\). The actual curved connection preserves the exact ratio cap by a local derivative comparison at that parameter and a compact strict gap elsewhere. The germ at \(x_0\) still has native instantaneous log-ratio derivative \(1/2\). This is a static construction and vector-field evaluation.

## Exact all-angle algebra

Fix \(r>1\) finite, and use the old \(K=1\) oriented Euclidean coefficient conventions in the fixed normal chart and radial frame about \(x_0\). Let
\[
 p=\sqrt{2/(1+r)},\quad q=\sqrt{2r/(1+r)},\quad
 (s_1,s_2,s_3)=(p,1,q),\quad \delta_i=s_i-1 .
\]
These satisfy \(0<p<1<q<\sqrt2\), \(p^2+q^2=2\) and \(r=q^2/p^2\). The point \(x_0\) is distinct from the spectral number \(p\). Let \(\Sigma_i\) be the fixed Euclidean chiral triple with \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}\,dV_{\rm e}\), \(F_{0,i}=-\Sigma_i\), \(F_i^*=-s_i\Sigma_i\) and \(\Delta F_i=F_i^*-F_{0,i}=-\delta_i\Sigma_i\). All flat and star operations in the model below are Euclidean.

For a unit Euclidean direction \(n\), put \(X_i=n^\flat\wedge\iota_n\Sigma_i\). The decomposition into forms containing \(n^\flat\) and forms tangent to \(n^\perp\) gives \(\Sigma_i=X_i+*_{\rm e}X_i\) by self-duality. In particular \(X_i^+=\Sigma_i/2\) and
\[
 \Omega_i(n):=2X_i^-=X_i-*_{\rm e}X_i.
\]
If \(\mathfrak r_n\) is the orthogonal reflection negating \(n\) and fixing \(n^\perp\), then \(\mathfrak r_n^*\Sigma_i=-X_i+*_{\rm e}X_i=-\Omega_i(n)\). This gives the full angular identity
\[
 \Omega_i(n)\wedge\Omega_j(n)
    =\mathfrak r_n^*(\Sigma_i\wedge\Sigma_j)
    =-2\delta_{ij}\,dV_{\rm e}
\]
because the reflection reverses orientation. The \(\Omega_i\) are anti-self-dual, so their wedge products with all the \(\Sigma_j\) vanish. This calculation covers every direction \(n\) by the same reflection formula.

On \(\mathcal P_0=[0,1]\times[-5/2,0]\), the prescribed leading two-forms are
\[
 F_{{\rm mod},i}=F_{0,i}+u\Delta F_i+
                 \tfrac v2n^\flat\wedge\iota_n\Delta F_i.
\]
Since \(X_i=(\Sigma_i+\Omega_i)/2\), the exact components are
\[
 F_{{\rm mod},i}
 =-\bigl(1+(u+v/4)\delta_i\bigr)\Sigma_i
   -\tfrac v4\delta_i\Omega_i(n).
\]
The Gram matrix \(\mathcal M(F_{\rm mod})\) relative to \(2dV_{\rm e}\) is therefore diagonal, with
\[
 M_i=\bigl(1+(u+v/4)\delta_i\bigr)^2-(v\delta_i/4)^2
    =A_iB_i,\qquad
 A_i=1+u\delta_i,\quad B_i=1+(u+v/2)\delta_i,\quad M_2=1.
 \tag{1}
\]
It is exactly independent of \(n\), despite the angular dependence of the two-forms. This computes the full wedge Gram, including the negative anti-self-dual term.

Throughout the rectangle \(-5/4\le u+v/2\le1\). For \(i=1\), \(\delta_1<0\) therefore gives \(A_1,B_1\ge p>0\). For \(i=3\), \(\delta_3>0\) gives \(A_3\ge1\) and \(B_3\ge(9-5q)/4>0\), since \(q<\sqrt2<9/5\). For \(i=2\) both factors are one. There is consequently a uniform \(r\)-dependent positive Gram floor, for example \(\min\{p^2,(9-5q)/4,1\}\). It bounds the denominator of \(Q_{\rm mod}=3\mathcal M(F_{\rm mod})/\operatorname{tr}\mathcal M(F_{\rm mod})\) away from zero. Both Gram and normalized quotient have the same eigenvalue ratio.

## All quotients and the unique limiting corner

Equation (1) gives \(\partial_u M_i=\delta_i(A_i+B_i)\) and \(\partial_v M_i=\delta_i A_i/2\). Thus \(M_1\) is strictly decreasing in each coordinate and \(M_3\) is strictly increasing in each. Set \(b_p=(9-5p)/4\) and \(b_q=(9-5q)/4\). The extremal values are \(M_1=p^2,\ M_3=q^2\) at \((1,0)\) and \(M_1=b_p,\ M_3=b_q\) at \((0,-5/2)\). Since \(M_2=1\), the six quotients of distinct entries have the following bounds:

| Quotient | Bound and equality conclusion |
| --- | --- |
| \(M_3/M_1\) | \(\le q^2/p^2=r\), with equality only at \((1,0)\) by strict coordinate monotonicity. |
| \(M_2/M_1\) | \(\le 1/p^2<r\) since \(q>1\). |
| \(M_3/M_2\) | \(\le q^2<r\) since \(p<1\). |
| \(M_1/M_2\) | \(\le b_p<r\). |
| \(M_2/M_3\) | \(\le 1/b_q<r\). |
| \(M_1/M_3\) | \(\le b_p/b_q<r\). |

For the fourth and fifth inequalities, clear positive denominators and use \(p^2+q^2=2\). The statements reduce respectively to \(13p^2-5p^3<8\) and \(13q^2-5q^3>8\). The polynomial \(13z^2-5z^3\) is strictly increasing on \(0<z<\sqrt2\) because \(z(26-15z)>0\), and it equals \(8\) at \(z=1\).

For the last inequality the positive-denominator comparison is
\[
 q^2(9-5q)-p^2(9-5p)
  =(q-p)\bigl(9(p+q)-5(2+pq)\bigr)>0 .
\]
Indeed \(z=p+q\in(\sqrt2,2)\), and the expression in parentheses is \(9z-5-\tfrac52 z^2\). It is concave, with positive endpoint values \(9\sqrt2-10\) and \(3\), so it is positive throughout the interval. This proves all strict inequalities, including the case in which the ordered extrema swap elsewhere in the rectangle. The maximum of the six quotients and the diagonal quotients \(1\) is \(\rho(Q_{\rm mod})\). Thus \(\rho(Q_{\rm mod})\le r\) with equality exactly at the parameter corner \((1,0)\).

At that corner \(M_1=p^2<1<M_3=q^2\). The model has simple normalized eigenvalues and \(f_{\rm mod}=\log M_3-\log M_1\) there and in a sufficiently small relative neighborhood. Because \(A_i=B_i=s_i\) at \((1,0)\), the two derivatives at the corner are
\[
 \partial_u f_{\rm mod}=2(1/p-1/q)>0,\qquad
 \partial_v f_{\rm mod}=\tfrac12(1/p-1/q)>0 .
\]
They follow by differentiating \(\log A_i+\log B_i\). The normalization cancels in this difference, including in its derivatives.

## Uniform comparison with the actual annular curvature

The fixed round reference has radial connection form \(A_{\rm rd}=\frac12\iota_xF_0+O(|x|^2)\) and \(F_{\rm rd}(x)=F_0+O(|x|)\) in these fixed coordinates. The radial integral of the smooth reference curvature gives the first formula. For the fixed \(r\), \(A_L=A_1+A_3\) is the assessed E235 polynomial with \(A_1=\frac12\iota_xF^*\) and finite cubic coefficients. Its actual curvature is \(F_L(x)=F^*+O_r(|x|^2)\) because \(dA_3\) and the affine self-bracket start at degree two. Put \(\ell=|x|\), \(n=x/\ell\) and \(a=A_L-A_{\rm rd}\). Then
\[
 a=\tfrac\ell2\iota_n\Delta F+O_r(\ell^2),\qquad
 [a\wedge a]=O_r(\ell^2).
\]
The reference and the local polynomial are fixed as the cutoff radius \(R\downarrow0\). Every \(O_r\) constant may depend on \(r\). [Assessed local polynomial][e235] · [Inherited radial conventions][e243]

Use the fixed smooth nonincreasing \(c\) from E243, with \(c=1\) on \([0,1/2]\), \(c=0\) on \([1,\infty)\), and \(0\le-c'\le5/2\). For \(R/2\le\ell\le R\) the actual parameters are \(u=c(\ell/R)\), \(v=(\ell/R)c'(\ell/R)\) in \(\mathcal P_0\), and \(dc(\ell/R)=(v/\ell)n^\flat\). Applying \(F=dA+[A\wedge A]/2\) to \(A_{\rm rd}+c(\ell/R)a\) gives the exact pointwise formula
\[
 F_{\rm act}(u,v,x)=F_{\rm rd}(x)+u(F_L(x)-F_{\rm rd}(x))
        +\tfrac12u(u-1)[a\wedge a]+\frac v\ell n^\flat\wedge a .
 \tag{2}
\]
Indeed \(F_L-F_{\rm rd}=d_{A_{\rm rd}}a+[a\wedge a]/2\). The same display defines values for all parameters at the fixed \(x\), with \(F_{\rm act}(1,0,x)=F_L(x)\) exactly. The parameter derivatives concern the formula at fixed \(x\).

Subtract \(F_{\rm mod}(u,v,n)\) from (2). The three types of errors are \((1-u)(F_{\rm rd}-F_0)+u(F_L-F^*)\), the quadratic bracket, and \((v/\ell)n^\flat\wedge(a-\ell\iota_n\Delta F/2)\). Their norms are \(O_r(\ell)\), \(O_r(\ell^2)\) and \(O_r(\ell)\), respectively. Each first \(u,v\) derivative obeys the same bounds by the displayed coefficients. Thus
\[
 \sup_{\substack{R/2\le\ell\le R,\ n\in S^3\\(u,v)\in\mathcal P_0}}
 \left(
  |F_{\rm act}-F_{\rm mod}|+
  |\partial_u(F_{\rm act}-F_{\rm mod})|+
  |\partial_v(F_{\rm act}-F_{\rm mod})|
 \right)\le C_r R .
 \tag{3}
\]
All unit angular directions are included because contraction and wedge by unit \(n\) are uniformly bounded in the fixed coefficient norm. There is no derivative in \(x\) or \(n\) in (3), and no near-round expansion of \(F^*-F_0\).

The model curvature image over the rectangle and unit angular sphere is compact, with its Gram floor from (1). The Gram is a quadratic polynomial in the two-form coefficients. Thus (3) places the pointwise segment between \(F_{\rm mod}\) and \(F_{\rm act}\) inside a fixed \(r\)-dependent bounded neighborhood with positive Gram and trace floor for all small \(R\). On that neighborhood the smooth quotient \(\mathcal Q(F)=3\mathcal M(F)/\operatorname{tr}\mathcal M(F)\) has bounded first and second derivatives. It follows that
\[
 \|Q_{\rm act}-Q_{\rm mod}\|_{\infty}
 +\|\partial_u(Q_{\rm act}-Q_{\rm mod})\|_{\infty}
 +\|\partial_v(Q_{\rm act}-Q_{\rm mod})\|_{\infty}
       \le C'_r R .
 \tag{4}
\]
For a parameter \(\zeta=u,v\), the derivative difference is the sum of \(D\mathcal Q_{F_{\rm act}}[\partial_\zeta(F_{\rm act}-F_{\rm mod})]\) and \((D\mathcal Q_{F_{\rm act}}-D\mathcal Q_{F_{\rm mod}})[\partial_\zeta F_{\rm mod}]\). The model parameter derivatives are uniformly bounded for this fixed \(r\). This verifies each term in (4). The fixed positive coordinate volume is valid even with the varying reconstructed metric, since a positive reference-volume change multiplies the Gram and its trace by the same scalar. Internal orthonormal frame changes conjugate the quotient. [Inherited exact cutoff formula][e243]

## Transfer at the corner and on its compact complement

For fixed \(r\), choose \(\eta>0\) small enough that the closed convex relative corner
\[
 C_\eta=[1-\eta,1]\times[-\eta,0]\subset\mathcal P_0
\]
has \(M_1<1<M_3\), normalized gaps bounded below, and both derivatives of \(f_{\rm mod}\) bounded below by a positive \(r\)-dependent constant. This follows from the strict gaps and derivative values at \((1,0)\), and continuity in the simple-spectrum region. To obtain an actually compact complement, let \(U_\eta=\{(u,v)\in\mathcal P_0:u>1-\eta,\ v>-\eta\}\). It is relatively open, contains \((1,0)\) and is contained in \(C_\eta\).

On \(C_\eta\), min–max and (4) preserve the simple gaps for \(R\) small. The eigenvectors of \(Q_{\rm act}\) approach the corresponding coordinate lines uniformly. In fact, if \(\lambda_i\) is its \(i\)-th ordered eigenvalue, \(w_i\) a unit eigenvector and \(\lambda_j^0\) the diagonal entries of \(Q_{\rm mod}\), then
\[
 (\lambda_i-\lambda_j^0)\langle e_j,w_i\rangle
     =\langle e_j,(Q_{\rm act}-Q_{\rm mod})w_i\rangle,\qquad j\ne i.
\]
The denominators have a positive uniform lower bound depending on the fixed \(r,\eta\), so the transverse components are \(O_r(R)\). With a choice of sign near \(e_i\), this gives \(w_i=e_i+O_r(R)\). The simple eigenvalue derivative \(\partial_\zeta\lambda_i=w_i^{\mathsf T}\partial_\zeta Q_{\rm act}w_i\), (4), and the positive eigenvalue floor now give uniform convergence of both derivatives of \(f_{\rm act}=\log\rho(Q_{\rm act})\) to those of \(f_{\rm mod}\) on \(C_\eta\). Shrinking \(R\) makes both actual derivatives strictly positive there for every annular \(x\). The differentiations are valid at the relative boundary as the parameter formula extends to an open neighborhood of each point with simple positive spectrum.

For any actual cutoff parameters in \(C_\eta\), the segment from \((1,0)\) to \((u,v)\) is contained in \(C_\eta\). Both coordinate displacements are nonpositive. Integrating the positive partial derivatives along the segment gives \(f_{\rm act}(u,v,x)\le f_{\rm act}(1,0,x)=\log\rho(Q_L(x))\). Since \(x\) lies in the punctured annulus, this last value is strictly below \(\log r\) after choosing \(R\) smaller than a fixed-\(r\) strict local maximum radius from E235. It is legitimate here to use that radius because \(r\) was fixed first and \(R\) is free to shrink. This includes the parameter corner itself, where the comparison segment is constant but \(x\ne x_0\). [E235 strict local comparison][a235]

On the compact complement \(\mathcal P_0\setminus U_\eta\), the continuous model ratio has maximum \(r-\gamma_r\) for some \(\gamma_r>0\), since the unique equality corner is omitted. No eigenvalue simplicity is required there. The model normalized eigenvalues are bounded below on the full rectangle by the Gram floor and a uniform upper bound on its trace, and the actual normalized eigenvalues have a common positive lower bound for small \(R\) by (4). Ordered min–max then bounds the difference of the extreme eigenvalues by \(\|Q_{\rm act}-Q_{\rm mod}\|_{\rm op}\). The ratio therefore converges uniformly, as its denominators have that floor. For sufficiently small \(R\) it differs from the model ratio by at most \(\gamma_r/2\), proving strict inequality there as well. The closed corner and the compact complement cover the full rectangle, including their relative boundary.

## Global construction and static scope

The difference \(a\) transforms as an adjoint-valued one-form because it is the difference of connection forms in the same trivialization. The radial multiplier \(c(\ell/R)\) is smooth at zero by its inner plateau and vanishes smoothly at the outer plateau. With \(R\) inside the fixed chart, the difference extends smoothly by zero to define an actual global connection \(A_R=A_{\rm rd}+c(\ell/R)a\) on the same bundle. The curvature is that of this connection and hence satisfies Bianchi. Positivity holds on the annulus by the Gram floor and (3), on the inner region by the E235 definite germ after shrinking \(R\), and on the exterior by the round reference. The sign of the definite curvature map is locally constant on the connected sphere and equals the round-compatible sign on the nonempty round exterior. Equivalently, in the annulus the short positive curvature segment to the model and then the model parameter path to \((0,0)\) track the same sign.

These radius restrictions require only fixed \(r\). Choose one positive \(R_r\) meeting the chart, local-germ radius, Gram, corner, and complement restrictions just established. Then every \(0<R\le R_r\) with the same cutoff has strict ratio bound on the punctured inner ball and throughout the annulus. The exterior is round with ratio \(1<r\). At \(x_0\) the cutoff is one on an open neighborhood and the quotient is exactly \(\operatorname{diag}(p^2,1,q^2)\), so \(x_0\) is the unique global maximum and the ratio there is \(r\). This verifies the actual cap, including both cutoff boundaries.

The native pairing and time conversion at old \(K=1\) leave \(Q\) invariant and halve the velocity derivative. Agreement as a germ retains the complete local E235 directional calculation, giving native \(\left(d\log\rho[V_{\rm n}]\right)_{x_0}=1/2\) and \(\left(d\rho[V_{\rm n}]\right)_{x_0}=r/2\). This packet establishes the static cap and that tangent on the supplied standard sphere. Fixed-\(r\) shrinking only controls closeness to the model on the annulus. It supplies no uniform-in-\(r\) estimates, no general small-curvature-value basin entry, no trajectory, no preservation result, and no global lifetime claim. [E235/E236 assessment][a235] · [Earlier near-round assessment][a243]

## Frozen identities

All five frozen inputs matched. No E248 artifact, new source, alternate family or numerical search entered the verification. Only this review and its assigned return were written.

| Input | SHA-256 |
| --- | --- |
| [E249 request][request] | 9ed843fe6c5762402333cb189402236110ad9001f302eb91ad1df30dee488e39 |
| [B113][b113] | d7a6013999897e167521f1564f10cb83da4eff35934faf1d44b4c51ef349fa51 |
| [E235 construction][e235] | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
| [E235/E236 assessment][a235] | c8f229dbc5421449ccc1e548af0502d5524a8bf771d7e9544efed5ce846a7c50 |
| [E243 cutoff and radial formula][e243] | 7c29df2ad8a5acd3aabcce9b79e5a9e9628c784028997ce8512421c4ded50cb0 |
| [E243–E245 assessment][a243] | ddd09db779021672716faf6968fb8065a78c1ac6053ea2d4459f92f3b44669e1 |

[request]: ../research-progress/handoffs/SP4-CME-E249_REQUEST_v1.md
[b113]: ../brainstorm/notes/B113_FIXED_RATIO_RADIAL_MODEL_20261123.md
[e235]: ../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md
[a235]: E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md
[e243]: ../notes/243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md
[a243]: E243_E245_GLOBAL_RATIO_CAP_ASSESSMENT_20261123.md
