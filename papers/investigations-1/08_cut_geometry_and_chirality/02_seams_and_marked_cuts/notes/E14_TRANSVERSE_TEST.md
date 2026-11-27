# E14 · A transverse energy bound on the short-axis disk

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI Codex assistance. The [frozen E14 request](../research-progress/handoffs/E14_REQUEST_R1.md), SHA-256 prefix `9e3984698584`, specifies the selected Astra/ultra lead and requests GPT-6.2 Sol/ultra for this packet. Actual serving model and effort are unavailable. Working HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Frozen inputs were [B04](B04_PAIRED_FILLING.md) `90dddbd55bcc`, [E08C](../reviews/E08C_REALIZATION.md) `243574e5c143`, [E11A](../reviews/E11A_INTEGRATION.md) `440b47fd2ec5`, [closing](../continuation-notes/CLOSING_20261127.md) `926db2d6c534`, [incoming](../../03_tubes_and_exteriors/research-progress/handoffs/TO_SEAM_SHORT_AXIS_RESULT_20261127.md) `1f0b0b3d5aff`, and [E19](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md) `5333dc4d1816`. The bound is an exact analytic result. The short check of the E19 polynomial's membership uses rational interval arithmetic.

## Statement

Use E19's smooth, oriented, positive-definite projective-plane normal disk and the right-invariant frame on the fixed left quotient \(Q_8\backslash S^3\). The \(i\) axis collapses at the core and the prescribed boundary metric, up to scale, has lengths \((1,1,\sqrt3)\) with long axis \(k\). The matching map in B04 swaps the short \(i,j\) axes and negates \(k\). Take a smooth diagonal invariant metric in the horizontal-area-one gauge
\[
 g=ds^2+a(s)^2\sigma_1^2+e^{-2u(s)}\sigma_2^2+e^{2u(s)}\sigma_3^2,\qquad
 0\le s\le S ,
\]
where the three forms obey \(d\sigma_i=2\sigma_j\wedge\sigma_k\) cyclically before descent, and the squared forms descend. At the core take the smooth expansions \(a=4s+O(s^3)\), \(u=\beta s+O(s^3)\), both odd in a smooth extension. The radial slope four is the marked normal angle \(4\alpha_{\rm ang}\) in E19. At the outer totally geodesic boundary the first derivatives vanish and
\[
 a(S)=\sqrt{\alpha},\qquad u(S)=\frac{\log3}{4},\qquad
 a_s(S)=u_s(S)=0,\qquad \alpha=1/\sqrt3 .
\]
The normalized lengths there are \((\sqrt\alpha,\sqrt\alpha,\sqrt3\sqrt\alpha)\).

Put \(v(s)=\int_0^s a(\rho)\,d\rho\), \(v_*=v(S)\), and define
\[
 x=a^2,\quad P=2\cosh(2u),\quad d=2\sinh(2u),\quad
 w=u_s+d/a,\qquad \delta=(a_s+3x-2P)_+ .
\]
If \(x\le7/12\) and \(P\le7/3\) on the disk, then
\[
 \boxed{\quad
 \frac{E_+}{\pi^2}\ \ge\
 1+\frac{2+\alpha}{5}+\frac{11v_*}{1920}
       -\frac12\int_0^{v_*}\delta\,w^2\,dv .
 \quad} \tag{1}
\]
In particular the strict-budget test \(E_+/\pi^2<3/2\) is excluded at every length in the class with \(a_s\le2P-3a^2\). The same conclusion holds if the weighted slope excess is at most
\[
 \int_0^{v_*}\delta\,w^2\,dv
 \le \frac{2\alpha-1}{5}+\frac{11v_*}{960}.
\]
There is no monotonicity assumption on \(a\) or \(u\) in (1). The estimate is valid irrespective of the Robin sign and thus also for the positive subset required by B04. It concerns this fixed boundary metric and the indicated class of smooth short-axis profiles.

## Chiral residuals from Cartan's equations

Use \(e^0=ds\) and \(e^i=a_i\sigma_i\), with \(a_i=(a,e^{-u},e^u)\). The outward-first orientation has \(e^0\wedge e^1\wedge e^2\wedge e^3>0\). On the open interval let \(\mu_i=2a_i/(a_ja_k)\), \(k_i=(a_i)_s/a_i\). The torsion equation for \(de^i=k_i e^0\wedge e^i+\mu_i e^j\wedge e^k\) gives \(\omega_{i0}=k_i e^i\) and \(\omega_{jk}=f_i e^i\) with \(f_i=(\mu_j+\mu_k-\mu_i)/2\). In the curvature form \(d\omega+\omega\wedge\omega\), the radial sectional coefficient is \(A_i=-(a_i)_{ss}/a_i\), and the tangential one is
\[
 T_i=f_i\mu_i-f_jf_k-k_jk_k.
\]
The mixed coefficient on the complementary plane is \(M_i=-\mu_i k_i+f_k k_j+f_jk_k\), from the tangential derivative of \(\omega_{0i}\) and its two connection products. Compressing the curvature operator to \((e^{0i}+e^{jk})/\sqrt2\) and subtracting \(R/12\) gives \(\lambda_i^+=(A_i+T_i)/2-R/12+M_i\), with \(R=2\sum_i(A_i+T_i)\). In this convention \(E_+\) is the smaller integral at the marked datum since \(E_- - E_+=5\pi^2\), as checked in the incoming ledger and E19. The pointwise components need no size ordering.

Let \(\mathcal V=\lambda_1^+\) and \(\mathcal W=\lambda_2^+-\lambda_3^+\). Direct substitution of \(f_1=P/a-a,\ f_2=a+d/a,\ f_3=a-d/a\) yields
\[
\begin{aligned}
3\mathcal V&=-a_{ss}/a+2P-4x+2d^2/x+2u_s^2-6a_s+6(d/a)u_s,\\
\mathcal W&=u_{ss}-2d+2Pd/x-u_s a_s/a+(4P/a-2a)u_s-2d\, a_s/x .
\end{aligned}
\]
Write a dot for \(d/dv\), and set \(b=a_s+2x-P\). With \(\dot x=2a_s\), \(\dot P=2(d/a)u_s\), and \(d_s=2P u_s\), the two residuals become
\[
 3\mathcal V= -\dot b-2b+2w^2,\qquad
 \mathcal W=a\dot w+\frac{P-b}{a}w. \tag{2}
\]
Since the block is diagonal and traceless, its real Hilbert–Schmidt norm squared is \((3\mathcal V^2+\mathcal W^2)/2\). The volume of a principal orbit is \((2\pi^2/8)a\), with the order-eight quotient and horizontal product one. Hence
\[
 J:=\int_0^{v_*}(3\mathcal V^2+\mathcal W^2)\,dv
       =8E_+/\pi^2 . \tag{3}
\]
At the core \(b=2\), \(P-b=0\), and \(w\) extends as an even function with \(w(0)=2\beta\). In particular \(P-b=O(s^2)\) and \((P-b)w^2\to0\). Each integration in \(v\) below can be made from \(s>0\) and passed to the core since \(v=2s^2+O(s^4)\) and the even functions have bounded first \(v\) derivatives. At the boundary \(P=4\alpha\), \(d=2\alpha\), \(b=-2\alpha\) and \(w^2=4\alpha\), and consequently
\[
 [(P-b)w^2]_{0}^{v_*}=24\alpha^2=8. \tag{4}
\]

## The two square tests

First expand the transverse square in (2). Its cross term is \((P-b)(w^2)^{\boldsymbol\cdot}\). After integration by parts, substitution of \(\dot b=-2b+2w^2-3\mathcal V\) and completion of the axial square give the exact identity
\[
 J=8+\int_0^{v_*}\left[
     x\dot w^2+3(\mathcal V-w^2/2)^2
     +\frac34w^4+\left(\frac{(P-b)^2}{x}-2b\right)w^2
     +2(d/a-w/2)^2w^2\right]dv. \tag{5}
\]
Here the intermediate quartic coefficient \(5/4\) becomes \(3/4\) by writing \(-\dot P=2(d/a-w/2)^2-w^2/2\). The \(8\) in (5) comes from the actual outer boundary and the marked short-axis core.

Second take \(t=4/5\) in \(3(\mathcal V-w^2/2)^2\ge6t(\mathcal V-w^2/2)-3t^2\). Integrate the axial identity in (2), using \(b=a_s+2x-P\) and \(\int a_s\,dv=\alpha/2\). This gives
\[
 \int_0^{v_*}3\mathcal V\,dv
   =2+\alpha+\int_0^{v_*}(2P-4x+2w^2)\,dv .
\]
Write \(\zeta=P-b\). For \(x>0\),
\[
 \frac{\zeta^2}{x}-2b
 =3x-2P+\frac{(\zeta-x)^2}{x}+4(\zeta-x)
 \ \ge\ 3x-2P-4\delta,
 \qquad \delta=(x-\zeta)_+ .
\]
In (5) drop the two explicit nonnegative derivative and correction terms, \(x\dot w^2\) and \(2(d/a-w/2)^2w^2\). Putting \(y=w^2\ge0\) then gives
\[
 J\ge8+2t(2+\alpha)
     +\int_0^{v_*}\!\left[
       4t(P-2x)-3t^2+(t+3x-2P)y+\tfrac34 y^2-4\delta y
                       \right]dv. \tag{6}
\]
The constant and the first two powers of \(y\) in the integrand are bounded from below by
\[
 D(x,P)=4t(P-2x)-3t^2-\tfrac13(2P-t-3x)_+^2 .
\]
This is a concave function of \((x,P)\), being affine minus a convex squared positive part. On \([0,7/12]\times[2,7/3]\) its minimum is bounded below by its smallest corner value. The four values at \((0,2),(0,7/3),(7/12,2),(7/12,7/3)\) are \(16/15,\ 76/135,\ 11/240,\ 691/2160\). Thus \(D\ge11/240\), giving (1) by (3). The derivation uses the transverse square and one constant axial test, with no search over profile lengths or multipliers.

## Exact membership check for the E19 trial

For this check only set \(q=(s/L)^2\), with the E19 constant \(L=0.391295\). Let \(p(q),r(q)\) be the two polynomials in E19. Then \(x=q p^2\), \(u_s=(r+2q r')/L\), and
\[
 \frac{a_s-4+3x}{q}
       =\frac{p+2q p'-4L}{L q}+3p^2=:H(q).
\]
The numerator of the first quotient has zero constant term. Use outward rational intervals \(A=3^{-1/4}\in[0.759835,0.759836]\) and \(B=(\log3)/4\in[0.274653,0.274654]\). Fourth powers check the first interval. For the second use \(B=\tfrac12\sum_{k\ge0}(1/2)^{2k+1}/(2k+1)\), whose twelve-term remainder is at most \(\tfrac23(1/2)^{25}/25\). All listed decimal coefficients in E19 are the exact rationals specified there.

Here is a finite certificate using power-to-Bernstein conversion. For an interval polynomial \(f=\sum_{k=0}^n c_k q^k\) on \([l,h]\), take the power coefficients \(\tilde c_j=(h-l)^j\sum_{k=j}^n {k\choose j}l^{k-j}c_k\) and Bernstein coefficients \(\sum_{j=0}^i \tilde c_j {i\choose j}/{n\choose j}\). The polynomial takes values between the smallest and largest of its Bernstein coefficients. The following bounds on the interval coefficients were checked using exact rational operations.

| Polynomial and interval | Bound on Bernstein coefficients |
| --- | --- |
| \(q p^2\) on \([0,1/4]\) | all \(<2/5\) |
| \(q p^2\) on \([1/4,1/2]\) | all \(<27/50\) |
| \(q p^2\) on \([1/2,3/4]\) | all \(<23/40\) |
| \(q p^2\) on \([3/4,1]\) | all \(<29/50\) |
| \((r+2q r')/(1-q)\) on \([0,1]\) | all \(>3/8\) |
| \(H(q)\) on \([0,1]\) | all \(<-2\) |

In the next-to-last row, the coefficients of the quotient are the successive partial sums of the numerator coefficients through degree three, since the numerator vanishes exactly at \(q=1\). This table gives \(x<29/50<7/12\), monotone \(u\) between zero and \((\log3)/4\), hence \(P\le4/\sqrt3<7/3\), and \(a_s-4+3x\le0\). With \(P\ge2\), the required slope bound follows. The E19 trial therefore belongs to the analytically excluded class. E19's certified separate scalar calculation supplies the positive Robin sign for that example alone.

## Disposition for B06

The marked short-axis filling and its exact \(j\) switch remain the problem of B04. This estimate rules out strict success anywhere in the specified shape and slope class, a class of smooth functions with no finite-dimensional restriction. While the shape bounds hold, a potentially successful diagonal profile must exceed the stated weighted slope bound. Profiles leaving the shape box, profiles with a larger weighted excess, and other smooth metrics on the marked disk still require an energy and whole-side Robin test. The result gives no unrestricted lower bound for the B04 infimum and supplies no new positive filling.
