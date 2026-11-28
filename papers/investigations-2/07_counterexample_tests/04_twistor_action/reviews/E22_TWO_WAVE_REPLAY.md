# SP4-TWA-E22 · Independent two-wave fourth-variation replay

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance by a reviewer who did not author E18. [Frozen request v1](../research-progress/handoffs/E22_REQUEST_v1.md) records the author-selected GPT-6.2 Astra/ultra lead and the configured GPT-6.2 Sol/ultra helper. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all nine frozen SHA-256 digests matched.

| E18 claim | Disposition |
| --- | --- |
| Quaternion sign, quotient coefficients and cylinder normalization | PASS |
| Forced scalar mean, mixed scalar and mixed longitudinal sectors | PASS |
| Exact minimum in the finite time-profile family | PASS |
| Periodic-time relaxation and whole Dirichlet correction lower certificate | PASS |
| Positivity for small amplitudes in the specified nonlinear paths | PASS with the fixed first-order direction and fixed second-order correction stated below |

## Quotient and fourth variation

Use the oriented flat Riemannian \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) with orientation \(dt\wedge dx_1\wedge dx_2\wedge dx_3\), periodic spin structure, real spinor pairing and positive chirality acted on by self-dual forms. Use the normalization \(S=J_g^4\). In the E14 quaternion frame \(\sigma=1\), and the positive-spinor restriction of \(c(e_0)c(e_j)\) is left multiplication by \(I_j\), from \(c(v)(s_+,s_-)=(v s_-,-\bar v s_+)\). Thus on imaginary spatial vectors \(\sum I_j\widehat\partial_j V=-\widehat{\operatorname{div}}_x V+\widehat{\operatorname{curl}}_xV\), where a hat divides physical first derivatives by \(\omega=\pi/2\). Fix \(b=51\pi/16\), \(T=\omega t,\ X=2\pi x_1,\ Y=2\pi x_2\), and \(\beta=b/\omega=51/8\). The prescribed wave \(w=F N\) has \(F=\cos T\) and \(N=(0,\cos X,\sin X)+(\sin Y,0,\cos Y)\). Direct differentiation gives zero spatial divergence and \(\widehat{\operatorname{curl}}_xN=-4N\). Also \(m=\sin X\cos Y\), \(|N|^2=2(1+m)\), and \(|\widehat\nabla w|^2=(F')^2|N|^2+32F^2\), with primes denoting \(T\) derivatives.

Let \(A=\Pi(dt\otimes\cdot)\), \(\mathcal B=\widehat P+\beta A\), \(a=\beta A1\), and \(\nu=3\beta^2/4\). The product rule and division by \(\omega\) give \(Q_\varepsilon=|\mathcal B(1+\varepsilon w+\varepsilon^2z)|^2/|1+\varepsilon w+\varepsilon^2z|^2\) and \(S=\omega^4\int_M Q_\varepsilon^2\,dt\,dx\). In particular \(S(\psi_b)/\omega^4=2\nu^2\). The factor \(dt=dT/\omega\) makes the time integrals of \(1,\cos^2(2jT),\sin^2(2jT)\) equal to \(2,1,1\), respectively, for \(j\ge1\). All cross products of different trigonometric basis elements have integral zero. The spatial volume is \(1\).

The chiral Dirac formula gives \(\widehat D w=-(F'+4F)N\) in the opposite chirality and \((\widehat P w)_0=(3F'-4F)N/4\). This explains \((a,\mathcal Bw)=0\) pointwise since the last expression and \(w\) are imaginary. Using \(\Pi\) and \(A^*A=(3/4)I\), set \(U=|w|^2\) and \(M_w=|\mathcal Bw|^2-\nu U=|\widehat Pw|^2+2\beta((\widehat P w)_0,w)\). The result is

\[
M_w=32F^2+
\left(\tfrac34(F')^2+\tfrac{3\beta-4}{2}FF'-(4+2\beta)F^2\right)|N|^2 .
\]

Writing \(C=\cos 2T\), \(S_2=\sin 2T\) gives \(U=(1+m)U_0\), \(M_w=M_0+mM_1\), and

\[
U_0=1+C,\quad M_0=-\tfrac32 C-\tfrac{121}{16}S_2,\quad
M_1=-16-\tfrac{35}{2}C-\tfrac{121}{16}S_2 .
\]

For \(z=u+V\), \(u\) real and \(V\) imaginary, set \(L(z)=2(a,\widehat Pz)=(\beta/2)(3u'-\widehat{\operatorname{div}}_xV)\). The denominator of \(Q_\varepsilon\) is \(1+\varepsilon^2(U+2u)+2\varepsilon^3(w,z)+\varepsilon^4|z|^2\). Multiplying the quotient series by this denominator gives its coefficients through order four:

\[
q_1=0,\qquad q_2=M_w+L(z),\qquad q_3=2(\mathcal Bw,\mathcal Bz)-2\nu(w,z),
\qquad q_4=|\mathcal Bz|^2-\nu|z|^2-q_2(U+2u).
\]

The integrated coefficient of \(\varepsilon^2\) in \(S/\omega^4\) vanishes because \(\int M_w=\int L(z)=0\). The pure-\(w\) cubic vanishes by pointwise evenness at \(z=0\). For arbitrary fixed smooth zero-trace \(z\) the other cubic contribution is its real Hessian pairing with the null vector \(w\), hence zero. In the stated finite product family the translation by \((1/2,1/2,0)\) changes the sign of \(w\) and fixes \(z\), so the integrated expansion is even. In either case the fourth-order coefficient is \(\mathcal I(z)=\int(q_2^2+2\nu q_4)\), which is

\[
\mathcal I(z)=\int(M_w^2-2\nu M_wU)
+2\int\big((M_w-\nu U)L(z)-2\nu M_wu\big)+\mathcal Q(z,z).
\]

Here \(\mathcal Q(z,z)\) comes from the \(w=0\) expansion and equals half the real Hessian in the conjugated variables, divided by \(\omega^4\). For an independent coefficient check, put \(\ell=(1,(\widehat Pz)_0)\). Expanding \(L^2+2\nu(|\mathcal Bz|^2-\nu|z|^2-2uL)\) gives \(4\beta^2\ell^2+2\nu|\widehat Pz|^2+4\beta\nu(((\widehat Pz)_0,z)-2u\ell)\). The last bracket is a sum of a time derivative, a spatial divergence and \((V,\widehat{\operatorname{curl}}_x V)/4\) by the quaternion expression for \((\widehat Pz)_0\). The integrated total derivatives vanish by the end data and periodicity. The flat zero-trace twistor identity gives \(\|\widehat Pz\|_2^2=(3/4)\|\widehat\nabla z\|_2^2\). Therefore

\[
\mathcal Q(z,z)=
\tfrac98\beta^2\|\widehat\nabla z\|_2^2+
\tfrac14\beta^2\|3u'-\widehat{\operatorname{div}}_x V\|_2^2+
\tfrac34\beta^3\int(V,\widehat{\operatorname{curl}}_xV).
\]

## Forced sectors and positivity of the complement

The forcing depends on \(u\) and \(3u'-\widehat{\operatorname{div}}_xV\) paired against spatial shapes \(1,m\). Spatial integration by parts converts the second shape's divergence pairing to \(\widehat\nabla_xm\); the mean has zero divergence forcing. Thus the forced part is \(u=u_0+u_1m,\ V=v_1\widehat\nabla_xm\). This is a spatial orthogonal projection at each time, preserving smoothness and zero end values. Its quadratic cross-pairing with the spatial orthogonal complement vanishes. The gradient terms use the eigenspace equation \(-\widehat\Delta_x m=32m\) and its gradient version. The scalar–divergence square uses \(\widehat{\operatorname{div}}_x\widehat\nabla_xm=-32m\) and divergence integration by parts. The periodic curl pairing with a gradient vanishes. This decomposition holds in the indicated product modes and for every smooth zero-end \(z\).

At the chosen slope, each original Dirichlet scalar–longitudinal block is nonnegative by the displayed squares, and the spatial zero mode has no helicity. On a transverse helical line of sign \(h=\pm1\), dimensionless spatial frequency \(\lambda=4|j|\) for \(j\in\mathbb Z^3\setminus\{0\}\), and time mode \(n\ge1\), the quadratic coefficient is \(\beta^2[9(\lambda^2+n^2)/8+3\beta h\lambda/4]\). Its lowest threshold \((3/2)(\lambda^2+n^2)/\lambda\) occurs at \((\lambda,n)=(4,1)\) and is \(51/8\). This proves the nonnegativity of every unforced block on the original Dirichlet domain and verifies the kernel pairing used for the cubic term.

The torus averages are \(\int m=0,\int m^2=1/4\), \(\int|\widehat\nabla_xm|^2=8\). With \(G_1=3u_1'+32v_1\) and the time pairing \(\langle f,g\rangle=\int_{-1}^1 fg\,dt\), the resulting expressions are

\[
\begin{aligned}
\mathcal I(0)&=\|M_0\|^2+\|M_1\|^2/4-2\nu\langle U_0,M_0+M_1/4\rangle=\tfrac{575557}{512},\\
\mathcal L(z)&=3\beta\langle M_0-\nu U_0,u_0'\rangle-4\nu\langle M_0,u_0\rangle
+\tfrac{\beta}{4}\langle M_1-\nu U_0,G_1\rangle-\nu\langle M_1,u_1\rangle,\\
\mathcal Q(z,z)&=\tfrac{27}{8}\beta^2\|u_0'\|^2+
\tfrac{9\beta^2}{32}\big(\|u_1'\|^2+32\|u_1\|^2+32\|v_1'\|^2+1024\|v_1\|^2\big)
+\tfrac{\beta^2}{16}\|G_1\|^2 .
\end{aligned}
\]

These are the E18 functional and its normalization.

## Exact arithmetic and containment

The finite family gives each of \(u_0,u_1,v_1\) the eight independent time basis elements \(\cos(2jT)-(-1)^j,\sin(2jT)\) for \(1\le j\le4\). Both types vanish at \(T=\pm\pi/2\); independence follows by the cosine and sine coefficients at \(j\ge1\). The quadratic form on the forced sector is positive definite since the traces kill the constant mean-scalar null direction. The spatial shapes are present in the stated product frequencies. The unforced orthogonal product modes may be set to zero in minimizing \(\mathcal I\).

In the relaxed problem only these three time coefficients range over \(H^1\) functions periodic across the interval of length \(\pi\) in \(T\). This form domain requires equality of the two value traces, which holds for every zero-end \(H^1\) coefficient. The force is supported in the modes \(1,\cos 2T,\sin 2T\). All other time modes are orthogonal in the constant-coefficient quadratic form and contribute nonnegative energy. The constant \(u_0\) has zero cost and zero forcing because \(\int M_0=0\), so it is omitted. The retained eight coordinates have a positive definite quadratic form. The unforced spatial complement keeps its time Dirichlet restriction. Relaxing transverse modes in that complement would permit a constant-in-time negative-helicity mode at \(\lambda=4\).

The embedded E18 rational program passed all assertions. An independent exact calculation used vectors of time Fourier coefficients, with weights \(2,1,1,\ldots,1\) in the time pairing and differentiation acting by the \(2j\) rotations on each sine–cosine pair. For the force vector the three time profiles were obtained by integration by parts as

\[
-3\beta(M_0-\nu U_0)'-4\nu M_0,\quad
-\tfrac{3\beta}{4}(M_1-\nu U_0)'-\nu M_1,\quad
8\beta(M_1-\nu U_0).
\]

Pairing with the two bases and applying rational \(LDL^\mathsf T\) elimination to the polarized quadratic matrix \(H\) gave \(c\) solving \(2Hc+d=0\) exactly for the force vector \(d\). All eliminated diagonal entries were positive. The two blocks contribute separately to the exact value shift \(\tfrac12 d^\mathsf T c\).

| Time domain | Mean coordinates | Mixed coordinates | Mean shift | Mixed shift |
| --- | ---: | ---: | --- | --- |
| Finite Dirichlet family | 8 | 16 | \(-219529/1536\) | \(-47078131127275833171559535719/58093832761186135918673920\) |
| Periodic relaxation | 2 | 6 | \(-219529/1536\) | \(-67271373247/82903040\) |

Adding \(575557/512\) gives the finite minimum \(29772745866921709978958207563/174281498283558407756021760>170\) and the relaxed minimum \(42222312899/248709120>169\). The actual action coefficients carry the common factor \(\omega^4\). The finite value is achieved by the stated correction space, and the periodic value is a lower certificate for the entire original Dirichlet correction space by domain inclusion and nonnegative complement energy.

## Competitors and evidence

For each fixed smooth zero-end \(z\), the path \(\psi=e^{bt}(1+\varepsilon w+\varepsilon^2z)\) has the prescribed traces and is nowhere zero for sufficiently small \(|\varepsilon|\). The expansion has a strictly positive fourth-order coefficient at \(b=51\pi/16\), so each such path is strictly more expensive than the radial reference for sufficiently small nonzero amplitudes. The remainder is \(O_z(\varepsilon^5)\) and improves to \(O_z(\varepsilon^6)\) in the product family by translation symmetry. The claim is for this particular equal-amplitude pair of perpendicular first-order helices and a correction fixed along the path. The bound on sufficiently small amplitude can depend on \(z\). Other first-order kernel directions, finite changes of the fields and varying end traces lie outside this replay.

All nine frozen inputs were inspected. The [overview](../research-overview/OVERVIEW.md) specifies the action and chirality. The [E14 quaternion and Hessian calculation](../notes/E14_FIRST_NEGATIVE_MODE.md) and [E18 two-wave note](../notes/E18_TWO_HELICES.md) contain the operative formulas independently replayed here. Friedrich's published §1 projection and equation (1.1) supply the Riemannian twistor convention; the quaternion sign, mode splitting and arithmetic above are direct calculations. The [B07 closing](../continuation-notes/CLOSING_B07_GLOBAL_MINIMUM_20261128.md) and [E13 replay](E13_GLOBAL_MINIMUM_REPLAY.md) concern a separate fixed-slope global comparison. [Friedrich, published scan](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
