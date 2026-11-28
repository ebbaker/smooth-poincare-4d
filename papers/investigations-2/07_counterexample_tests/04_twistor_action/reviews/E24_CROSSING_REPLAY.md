# SP4-TWA-E24 · Independent replay at the first crossing

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E24_REQUEST_v1.md) records the author-selected GPT-6.2 Astra/ultra lead and the configured GPT-6.2 Sol/ultra helper. Independent backend model and effort telemetry were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`. All thirteen frozen SHA-256 digests matched. The reviewer authored neither the E23 calculation nor the nonlinear deduction.

| Frozen claim | Disposition |
| --- | --- |
| [E23 reduced quartic](../notes/E23_NULLSPACE_QUARTIC.md) | Pass. The minimum over the homogeneous Dirichlet \(H^1\) complement is a homogeneous quartic on the full six-real-dimensional kernel. The single-wave coefficient is \((12227/6144)\omega^4\), and the two-wave calculation certifies the stated lower bound on the mixed coefficient. |
| [Nonlinear local minimum](../notes/B08_LOCAL_MINIMUM_AT_CROSSING.md) | Pass. The reduction gives the stated strict \(C^1\)-local bound for all smooth fixed-trace competitors at each sign of the crossing, with control of the entire \(H^1\) complement. |
| [Formal statement handoff](../research-progress/handoffs/TO_FORMALIZATION_TWA_SLOPE_20261128.md) | Pass at the stated flat-product scope. The crossing theorem uses a first-jet neighborhood with exact end traces. The unresolved unrestricted threshold can still lie strictly below the Hessian crossing. |

## Chart, Hessian and quartic form

Take the oriented flat Riemannian product \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\), with volume two, orientation \(dt\wedge dx_1\wedge dx_2\wedge dx_3\), and periodic spin structure. Use a parallel unit positive half-spinor \(\sigma\) identified with \(1\) in the quaternion frame on which self-dual forms act. Pair spinors by the real part of the Hermitian pairing, take \(c(e)^2=-|e|^2 I\), and \(P=\Pi d\) with \(\Pi=I-c^*c/4\) for Clifford contraction \(c\). The full trace is \(e^{-b}\sigma,e^{b}\sigma\) at \(t=-1,1\), respectively. The original action for smooth positive half-spinors is \(S=J_g^4\), integrating the fourth power of \(|P\psi|/|\psi|\) on the nonzero set. Its admissible class allows finitely many transverse interior zeros with \(P\psi=0\) there. The chosen local chart is zero-free for a sufficiently small \(C^1\) ball. Write \(\mathcal S(v)=S(e^{bt}(1+v))\) for smooth zero-trace \(v\).

Set \(b=b_{\rm H}=51\pi/16\), \(\omega=\pi/2\), \(k_0=2\pi\), \(T=\omega t\), \(F=\cos T\), and \(\beta=b/\omega=51/8\). Derivatives with hats are divided by \(\omega\), and time primes mean \(\partial_T\). Use \(dt\,dx\) for integrals. The [E14 spectrum](../notes/E14_FIRST_NEGATIVE_MODE.md) and its [replay](E19_GLOBAL_SPECTRAL_REPLAY.md) give the six real kernel modes, \(W=F N\) where \(N=\sum_j r_j n_j^{\phi_j}\), \(a_j=r_je^{i\phi_j}\), and the \(j\)-th wave for cyclic \((j,\ell,m)\) is \(n_j^{\phi_j}=I_\ell\cos(k_0 x_j+\phi_j)+I_m\sin(k_0 x_j+\phi_j)\). Each wave is imaginary and divergence-free with spatial curl \(-k_0 n_j^{\phi_j}\). Orthogonality of distinct spatial frequencies, the torus volume one and \(\int F^2dt=1\) give \(\|W\|_2^2=\sum |a_j|^2\).

For \(A_0=\Pi(dt\otimes\cdot)\), write \(\mathcal B=\widehat P+\beta A_0\), \(a_0=\beta A_0 1\) and \(\nu=|a_0|^2=3\beta^2/4=7803/256\). In the positive quaternion frame \(c(e_0)c(e_j)=I_j\), so \((\widehat Pz)(e_0)=3z'/4+\tfrac14\sum_j I_j\widehat\partial_j z\). For \(u=\operatorname{Re}z,\ V=\operatorname{Im}z\), this gives \(L(z)=2(a_0,\widehat Pz)=(\beta/2)(3u'-\widehat{\operatorname{div}}_xV)\). For \(W=FN\), \((1,W)=(a_0,\mathcal B W)=0\). Put \(U=|W|^2\), \(M_W=|\mathcal BW|^2-\nu U\).

For smooth zero-trace \(z\), the field \(h=1+\epsilon W+\epsilon^2z\) is nonzero at sufficiently small \(|\epsilon|\). The first nonconstant denominator term in \(|h|^2\) is \(\epsilon^2(U+2u)\), followed by \(2\epsilon^3(W,z)+\epsilon^4|z|^2\). The ratio \(|\mathcal Bh|^2/|h|^2\) has zero linear term, quadratic term \(M_W+L(z)\) and quartic term \(|\mathcal Bz|^2-\nu|z|^2-(M_W+L(z))(U+2u)\). Upon squaring and integrating, the fourth-order coefficient of \(\mathcal S(\epsilon W+\epsilon^2 z)\) divided by \(\omega^4\) is
\[
\mathcal I_W(z)=\int(M_W^2-2\nu M_W U)
+2\int\big((M_W-\nu U)L(z)-2\nu M_Wu\big)
+\mathcal Q(z,z),
\]
where \(\mathcal Q=(2\omega^4)^{-1}D^2\mathcal S(0)\), seen either by expansion or by setting \(W=0\). The linear and quadratic integrated action coefficients vanish by stationarity and the null form. Translating by half a period in all three directions negates every \(W\) and preserves \(\mathcal S\), so \(D^3\mathcal S(0)\) vanishes on triples of kernel fields by polarization. The remaining cubic term \(D^2\mathcal S(0)[W,z]\) vanishes by the kernel pairing. Hence no kernel component of \(z\) contributes to \(\mathcal I_W(z)\).

The expression is continuous in \(z\) in the homogeneous Dirichlet \(H^1\) form domain, since the forcing coefficients are smooth and the quadratic part is the bounded first-jet form. The \(L^2\)-orthogonal complement also equals the \(H^1\)-orthogonal complement there, because the kernel fields are all Dirichlet Laplacian eigenfields of eigenvalue \(k_0^2+\omega^2\). The next adverse-helicity threshold on this complement is the smaller of \((3/2)(k_0^2+4\omega^2)/k_0=15\pi/4\) and \((3/2)(2k_0^2+\omega^2)/(\sqrt2 k_0)=99\pi/(16\sqrt2)\). To see this, for temporal index \(n\ge2\) first use \(n=2\) at any fixed spatial length, then minimize over lengths at least \(k_0\), where the resulting ratio is increasing. For \(n=1\) outside the lowest shell minimize at \(\sqrt2 k_0\) in the same way. The lower number is \(15\pi/4\). The exact E14 mode coefficient and positivity in the scalar and longitudinal block therefore give
\[
D^2\mathcal S(0)[z,z]\ge \tfrac{27}{80} b_{\rm H}^2\|dz\|_2^2
\ge \tfrac{27}{400} b_{\rm H}^2\|z\|_{H^1}^2
\quad(z\perp\ker D^2\mathcal S(0)),
\]
using \(\|z\|_2\le2\|\partial_t z\|_2\).

Consequently Hilbert space representation gives a unique minimizing correction in the complement. With the bilinear form \(\mathcal Q\) as inner product, the minimizer solves \(2\mathcal Q(z_W,\cdot)=-\mathcal L_W(\cdot)\) for the linear part in the displayed formula, which is quadratic in \(W\). Its norm in \(H^1\) is bounded by \(C\|W\|_2^2\). Hence the minimum \(q(W)=\omega^4(\mathcal I_W(0)-\mathcal Q(z_W,z_W))\) is a homogeneous polynomial of degree four in the real kernel coordinates. Taking the infimum over all zero-trace \(H^1\) corrections gives this same value, since the kernel correction contributes zero.

## Marked isometries and all allowed monomials

Every translation of the actual period-one torus preserves both full boundary values. The three independent translations rotate the phases of \(a_1,a_2,a_3\) independently. In a polynomial expressed using \(a_j,\overline a_j\), invariance under all three rotations forces the number of factors of \(a_j\) and \(\overline a_j\) to agree for each \(j\). At degree four this leaves only \(|a_j|^4\) and \(|a_i|^2|a_j|^2\) for \(i\ne j\).

An orientation-preserving signed coordinate permutation \(R\) preserves the actual torus lattice and periodic trivialization. Choose a unit quaternion \(p\) inducing \(R\) on imaginary quaternions by conjugation. For \(h(t,x)\) use \(p h(t,R^{-1}x)\bar p\). The left rotation on both spin factors covers the rotation of Clifford vectors, and right multiplication by \(\bar p\) commutes with the real Clifford action in the quaternion description. This is an orthogonal map on the real pairing and preserves the positive bundle, the full constant end traces and the radial field. The gradient and Dirac norms, hence the twistor projection norm and the action, are preserved. The map preserves \(L^2\) and the nullspace, so it also preserves the minimization complement. It maps each first-shell axis to the corresponding signed axis and preserves the norm of its helical amplitude. Odd axis permutations can be combined with a sign change to keep determinant \(+1\). The induced actions are transitive on the unsigned axes and unordered pairs. It follows that
\[
q(W)=A\sum_j |a_j|^4+C\sum_{i<j}|a_i|^2|a_j|^2 .
\]

## Exact one- and two-wave certificates

For \(N=(0,\cos X,\sin X)+(\sin Y,0,\cos Y)\), \(X=k_0x_1,\ Y=k_0x_2\), set \(m=\sin X\cos Y\). Here \(|N|^2=2(1+m)\), \(|\widehat{\nabla}_xN|^2=32\), and the two chiral expressions are \(\widehat{\mathcal D}W=-(F'+4F)N\) and \((\widehat PW)(e_0)=(3F'-4F)N/4\). Inserting these into the projection norm identity and the cross term with \(\beta A_0W\) gives
\[
M_W=32F^2+2(1+m)\big(\tfrac34(F')^2+(3\beta/2-2)FF'-(4+2\beta)F^2\big).
\]
With \(c_2=\cos2T,\ s_2=\sin2T\), expanding \(F^2,F'^2,FF'\) gives
\[
U=(1+m)(1+c_2),\quad
M_W=M_0+mM_1,\quad
M_0=-\tfrac32 c_2-\tfrac{121}{16}s_2,\quad
M_1=-16-\tfrac{35}{2}c_2-\tfrac{121}{16}s_2 .
\]
The forcing is entirely in the two scalar shapes \(1,m\) and the vector shape \(\widehat\nabla_x m\), by spatial integration by parts in the divergence part of \(L(z)\). These shapes give the full forced sector \(u=u_0+u_1m,\ V=v_1\widehat\nabla_xm\). Its spatial \(L^2\) projection commutes with time differentiation and separates the gradient form by the spatial Laplacian identities with eigenvalues \(0,32,32\). The scalar–divergence square has zero cross pairing with the remainder because \(\widehat{\operatorname{div}}\,\widehat\nabla_xm=-32m\), and divergence on a remainder pairs to zero with \(1\) and \(m\). Likewise spatial curl has zero pairing with a gradient, using periodic integration by parts. The forced sector has zero or mixed second-shell spatial frequencies and is orthogonal to the critical kernel. All remaining directions have zero forcing and nonnegative original Dirichlet quadratic form, so no other direction can decrease the infimum.

Write \(U_0=1+c_2,\ H_j=M_j-\nu U_0,\ G_1=3u_1'+32v_1\). Since the spatial means of \(m,m^2,|\widehat\nabla_xm|^2\) are \(0,1/4,8\), respectively, the constant term is \(575557/512\). The linear term and quadratic part in the real \(L^2(dt)\) time pairing are
\[
\begin{aligned}
\mathcal L&=3\beta\langle H_0,u_0'\rangle-4\nu\langle M_0,u_0\rangle
+(\beta/4)\langle H_1,G_1\rangle-\nu\langle M_1,u_1\rangle,\\
\mathcal Q&=\beta^2\left[
\tfrac{27}{8}\|u_0'\|^2+
\tfrac{9}{32}(\|u_1'\|^2+32\|u_1\|^2+32\|v_1'\|^2+1024\|v_1\|^2)
+\tfrac1{16}\|G_1\|^2\right].
\end{aligned}
\]
Relax only these three time coefficients from both values zero to equal endpoint values. This contains the original Dirichlet sector and keeps the displayed quadratic form nonnegative. The unforced spatial complement retains its Dirichlet condition. The periodic time frequencies have period \(\pi\) in \(T\), and the force acts only on \(1,c_2,s_2\). The constant mean scalar is unforced and null. All other frequencies have zero linear forcing and nonnegative cost. The constant time norm squared is \(2\) and the sine and cosine norms squared are \(1\).

I evaluated the four retained periodic blocks by exact rational arithmetic, using coefficient coordinates on \(1,c_2,s_2\), the derivative \((\alpha,\gamma,\eta)\mapsto(0,2\eta,-2\gamma)\), and the weighted inner product with weights \(2,1,1\). For a row with quadratic coefficients \(\beta^2(d x^2+2e xy+f y^2)\) and linear coefficients \(l_x,l_y\), its decrease is \((f l_x^2-2e l_xl_y+d l_y^2)/(4\beta^2(df-e^2))\).

| Variables | \((d,e,f)\) | \((l_x,l_y)\) | Decrease |
| --- | --- | --- | --- |
| \(u_{0,c},u_{0,s}\) | \((27/2,0,27/2)\) | \((60435/128,-9639/32)\) | \(219529/1536\) |
| \(u_{1,0},v_{1,0}\) | \((18,0,704)\) | \((7803/8,-606849/128)\) | \(375967513/720896\) |
| \(u_{1,c},v_{1,s}\) | \((99/8,-12,388)\) | \((310131/512,-6171/16)\) | \(43111473/235520\) |
| \(u_{1,s},v_{1,c}\) | \((99/8,12,388)\) | \((-29223/128,-626433/256)\) | \(8754813/81920\) |

The two off-diagonal blocks have determinant \(9315/2>0\), and the other determinants are positive. Their decreases sum to \(237360255421/248709120\). The exact periodic minimum is consequently \(42222312899/248709120\), which gives \(q(1,1,0)\ge(42222312899/248709120)\omega^4\). This replays the [E18 bound](../notes/E18_TWO_HELICES.md) as a lower certificate for the true Dirichlet minimum. [Independent E22 calculation](E22_TWO_WAVE_REPLAY.md)

For a single wave the \(U,M_W\) quantities are \(U_0/2,M_0/2\), and only the mean scalar is forced. Its constant term is \(19313/512\), one quarter of the pure mean two-wave term. Its force is one half as large and the quadratic form is unchanged, so the decrease is one quarter of \(219529/1536\). The periodic minimum for the scalar mean is attained by a smooth profile and equals the Dirichlet minimum. Subtracting the common endpoint value of the periodic minimizer changes neither derivative terms nor the source term with \(M_0\), which has zero mean. This gives
\[
A=\omega^4\left(\frac{19313}{512}-\frac{219529}{6144}\right)
=\frac{12227}{6144}\omega^4 .
\]
This agrees with the [E15 chart](../notes/E15_HELICAL_COMPETITOR.md) by the trace-preserving shift \(z=w-F^2/2\) of the second-order scalar coefficient. The higher-order path differences pair with the null Hessian direction and the zero first derivative. Since \(C=q(1,1,0)-2A\), the mixed coefficient satisfies \(C\ge (41232414979/248709120)\omega^4>165\omega^4\) and \(C-2A\ge(13414172353/82903040)\omega^4>0\). Therefore \(q(W)\ge A\|W\|_2^4\), with equality exactly for zero or single-wave directions.

## First-jet estimate and strict local minimum

Let \(v=k+y\) be the real \(L^2\) decomposition into the kernel and its complement, and set \(\kappa=\|k\|_2\). For the finite rank projection, \(\|k\|_{C^1}\le C\kappa\le C'\|v\|_{C^1}\) by an orthonormal basis of the six smooth modes and the finite volume. Hence \(\kappa+\|y\|_{C^1}\le C''\delta\) for \(\|v\|_{C^1}<\delta\). All line segments of first jets used below stay uniformly away from zeros of the field.

Write \(H=D^2\mathcal S(0)\) and \(D^j=D^j\mathcal S(0)\). By the quartic formula,
\[
\mathcal F(k,y)=\tfrac12H[y,y]+\tfrac12D^3[k,k,y]+\tfrac1{24}D^4[k,k,k,k]
=q(k)+\tfrac12H[y-z_k,y-z_k] .
\]
Here the factor \(1/2\) in the cubic cross coefficient is the coefficient of the three permutations of \((k,k,y)\) in \(D^3/6\). The minimizer \(z_k\) is the same correction as in the quartic form, obeying \(\|z_k\|_{H^1}\le C_z\kappa^2\). Thus \(\mathcal F\ge A\kappa^4+(c_H/2)\|y-z_k\|_{H^1}^2\), where \(c_H=(27/400)b_{\rm H}^2\). Using \(\|y\|_{H^1}^2\le2\|y-z_k\|_{H^1}^2+2C_z^2\kappa^4\) gives \(\mathcal F(k,y)\ge c_1(\kappa^4+\|y\|_{H^1}^2)\) for \(c_1=\min(A/(1+2C_z^2),c_H/4)>0\).

The coefficient functions of \(\mathcal S\) are smooth functions of the real first jet and have bounded derivatives of each fixed order on the compact set of first jets in these small segments. Taylor expansion in \(y\) around \(k\) has integrated quadratic term \(\tfrac12H[y,y]\) up to \(C\delta\|y\|_{H^1}^2\). Indeed each coefficient of the quadratic form changes by \(O(\delta)\) in \(L^\infty\), multiplying the product of two first jets of \(y\). The linear term \(D\mathcal S(k)[y]\) has expansion \(\tfrac12 D^3[k,k,y]+O(\kappa^3\|y\|_{H^1})\) by stationarity, kernel pairing, and the \(C^1\) bound for \(k\). Finally \(\mathcal S(k)=\mathcal S(0)+D^4[k,k,k,k]/24+O(\kappa^5)\) by the pure-kernel cubic cancellation and the same finite-dimensional estimate. The mixed remainder \(\kappa^3\|y\|_{H^1}\) is at most \(\tfrac12\kappa(\kappa^4+\|y\|_{H^1}^2)\). Hence the combined error is bounded by \(C'\delta(\kappa^4+\|y\|_{H^1}^2)\). Choosing \(\delta\) small compared to \(c_1/C'\) gives the strict bound with, for example, \(c=c_1/2\). This argument needs first-jet smallness and places no bound on higher derivatives of the smooth competitors or on the \(C^1\) norm of the form-domain minimizer \(z_k\).

At \(b=-b_{\rm H}\) use the reflection \(R(t,x)=(-t,-x)\) in the periodic parallel frame. It sends \(e^{bt}(1+v)\) to \(e^{-bt}(1+v\circ R)\), changes the sign of all derivatives in the projected norm, exchanges the two fixed end values and preserves the action. It is an \(L^2,H^1,C^1\) isometry and sends the kernel and complement to the corresponding spaces at the opposite slope. This yields the local bound there. For \(0<|b|<b_{\rm H}\), E14 gives a strictly positive quadratic term and the first-jet remainder is \(O(\|v\|_{C^1}\|v\|_{H^1}^2)\). At zero slope the unique global zero-action field already gives strictness. At the crossing the result compares only fields in a \(C^1\) neighborhood. It leaves open a strict cheaper field outside that neighborhood and hence leaves \(b_{\rm G}<b_{\rm H}\) unresolved.

## Exact handoff scope and sources

The formal handoff's fourth item matches the proved estimate on the smooth fixed-trace class and the form-domain extension of the coefficient. The minimization over the whole homogeneous \(H^1\) space is equivalent to the minimization on the complement. The handoff describes the coefficient at the positive crossing and gives the local statement at both signs. The lower constant belongs to the normalization \(S=J_g^4\), \(\omega=\pi/2\), and the three amplitudes used above.

The other three items retain their established scopes. For item 1 the common-competitor convex comparison gives a closed radial attainment interval and strict interior uniqueness. The independently [replayed strict extension](E21_STRICT_EXTENSION_REPLAY.md) gives \(17\pi/8<b_{\rm G}\), with the upper bound from E14. The [interior excess argument](../notes/B08_INTERIOR_COMPACTNESS.md) uses the midpoint gap \(|x-y|^4/16\) for the fourth power of a real Hilbert norm. Convex interpolation from the midpoint gives the factor \(\min(\theta,1-\theta)/8\). Using \(\theta s=1/b_{\rm G}\) in the radial comparison and multiplying by \(b^4/\theta\) gives the exact factor in the handoff. The zero-trace identity and the E12 homogeneous Sobolev estimate absorb the normalized action in the asserted \(H^1\) convergence for each fixed interior slope. This uses a distinct proof from the [fixed trace conclusion at \(1/200\)](E13_GLOBAL_MINIMUM_REPLAY.md) and gives no compactness at the global endpoint.

For item 2 the retained mean term and unit-field rigidity are the [replayed polar comparison](E19_GLOBAL_SPECTRAL_REPLAY.md). Under the extra [pointwise norm constraint](../notes/B08_PRESCRIBED_NORM.md), the log-amplitude derivative vanishes and the angular coefficient before the helicity term is \(3/4\). This gives the exact constrained threshold \(3(17\pi/8)/2=b_{\rm H}\) with unique equality through that endpoint. Above it normalization of the E14 helix preserves the norm and first variation direction, so its negative Hessian supplies the strict competitor in the constrained class. Item 3 is the previously replayed Jacobi form with real kernel, exact Fourier frequencies and the above-crossing competitor. The [local nearby-trace \(H^5\) theorem](../notes/E08_LOCAL_DIRICHLET.md) keeps its original nondegenerate base point and quantifiers.

All frozen inputs were read at the applicable formulas. The supplemental E22 replay corroborates the periodic lower certificate. Friedrich's published §1 projection and equation (1.1) supply the Riemannian convention. The marked symmetry, quartic constants, complement control and Taylor estimates here are direct on the flat product. The formal handoff remains a request for theorem types and prerequisites. [Friedrich, published scan](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
