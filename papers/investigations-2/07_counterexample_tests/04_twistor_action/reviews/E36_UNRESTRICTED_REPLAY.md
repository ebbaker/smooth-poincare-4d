# SP4-TWA-E36 · Independent unrestricted slope replay

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E36_REQUEST_v1.md) records the non-author helper configuration as GPT-6.2 Sol/ultra. Serving model and reasoning effort telemetry were unavailable. HEAD was `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`. All three frozen SHA-256 digests matched. The reviewer authored none of the frozen inputs.

The unrestricted bracket \(17\pi/6<b_{\rm G}\le51\pi/16\) and both necessary conditions at \(51\pi/16\) pass. A single small helical profile with its mean-minimizing amplitude satisfies both conditions while having larger action. An explicit quantitative extension of the lower endpoint is given below.

## Current norm and the projected mean

Use the oriented flat Riemannian cylinder \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) with volume \(D=2\), periodic spin lift and the positive half-spinors on which self-dual two-forms act. Take the real Hermitian pairing and let \(\sigma\) be parallel and unit. For full traces \(e^{\pm b}\sigma\), write \(\psi=e^{bt+u}g\), \(u|_{\partial M}=0\), \(g|_{\partial M}=\sigma\), \(|g|=1\). The compatible-zero count gives this representation throughout the smooth class. Set \(C=3/4\), \(B=17\pi/8\), \(Q=|P\psi|^2/|\psi|^2\), \(Q_0=Cb^2\), \(S=\int_M Q^2\), \(d^2=\|dg\|_2^2\), and \(H=\int_M K_0\). The radial action is \(DQ_0^2=9b^4/8\). [E17 conventions and identity](../notes/E17_POLAR_LOWER_BOUND.md) · [E33 zero count](E33_AMPLITUDE_ENVELOPES_REPLAY.md#zero-count)

At each point the \(c_i g\) are an orthonormal real basis of the four-dimensional negative spin space. For \(i\neq j\) this follows from skew-adjointness of \(c_ic_j\), and the diagonal norms are one. Including \(j=i\) in \(K_i=\sum_{j\ne i}(g,c_ic_j\partial_jg)\) adds zero by \((g,\partial_i g)=0\). Then \(K_i=-(c_i g,\mathcal Dg)\) and \(|K|^2=|\mathcal Dg|^2\). The zero-end field \(w=g-\sigma\) satisfies the flat Dirichlet identity \(\|\mathcal Dw\|_2^2=\|dw\|_2^2\) and \(\mathcal D w=\mathcal Dg\). Thus \(\|K\|_2^2=d^2\), and the nonnegative amplitude remainder \(V=|Pg|^2-|K|^2/12\) satisfies \(\int_M V=(C-1/12)d^2=2d^2/3\). [E17](../notes/E17_POLAR_LOWER_BOUND.md) · [B09 amplitude remainder](../notes/B09_GLOBAL_AMPLITUDE.md#the-exact-comparison-for-each-angular-field)

Let \(G\) be the real \(L^2\) orthogonal projection onto \(dH^1_0(M)\), imposing zero traces on both end faces and spatial periodicity. The range is closed by the time Poincaré inequality. Its orthogonal complement contains \(dt\), since \(\int_M\partial_t u=0\) for each zero-end \(u\). Projecting \(K\) onto the orthogonal direct sum of the range and \(\mathbb R\,dt\) therefore gives \(\|GK\|_2^2+H^2/D\le d^2\). Combining this with the E17 identity, writing \(\Delta=\int_M Q-DQ_0\), gives

\[
\begin{aligned}
\Delta
&=C\|du+GK/3\|_2^2+Cd^2+\frac b2H-\frac{\|GK\|_2^2}{12}\\
&\ge C\|du+GK/3\|_2^2+\frac23d^2+\frac b2H+\frac{H^2}{12D}.
\end{aligned}
\tag{1}
\]

For \(|b|\le4B/3\), the middle two signed terms on the lower line sum to a nonnegative value because \(|H|\le d^2/B\). Jensen then gives \(S\ge DQ_0^2\) and equality requires \(\Delta=0\), including \(b=0\). Equality in (1) implies first \(H=0\), then \(d=0\) and \(du=0\), so the traces fix the field. The formulas and inequality apply also to the relaxed polar space with \(u,g\in W^{1,4}\): strong density with the specified traces gives strong \(L^4\) convergence of the polar derivative matrices and hence strong \(L^2\) convergence of \(Q\). The current also converges strongly in \(L^2\), by the strong derivative convergence and the unit bound on the angular factor. The same equality argument applies in this space. If \(b_{\rm G}=4B/3<3B/2=b_{\rm H}\), the compactness alternative gives a second relaxed minimizer at \(b_{\rm G}\). This would contradict the proved equality case. The upper endpoint follows from the E14 strict trial above \(b_{\rm H}\). [B09 density and coexistence](../notes/B09_POLAR_COMPACTNESS.md) · [E14 crossing](../notes/E14_FIRST_NEGATIVE_MODE.md) · [Closed radial interval](../notes/B08_GLOBAL_TRANSITION.md)

## Crossing conditions and the angular spectrum

Take \(b=b_{\rm H}=3B/2\). If \(S<DQ_0^2\), then \(Q\ge0\) and Cauchy–Schwarz imply \(\Delta<0\). If \(d=0\), the traces give \(g=\sigma\) and the mean is at least radial. If \(H\ge0\), the lower line of (1) precludes a mean deficit. Thus \(d>0\) and \(H<0\). Set \(r=-BH/d^2\). Dropping the nonnegative amplitude square from each line of (1) gives

\[
r>\frac89+\frac{H^2}{9Dd^2},\qquad
\frac{\|GK\|_2^2}{d^2}>9(1-r).
\tag{2}
\]

For \(w=g-\sigma\), \(H=\int_M(w,Tw)\) with \(T=\sum_{j=1}^3c_0c_j\partial_j\). The cross term with \(\sigma\) integrates to zero by periodicity. At spatial frequency \(k\), the symbol \(i\sum_j k_jc_0c_j\) is Hermitian with square \(|k|^2I\). The time sine level \(n\ge1\) contributes \(n^2(\pi/2)^2\) to the gradient energy. Hence a negative eigenvector contributes the ratio \(B|k|/(|k|^2+n^2(\pi/2)^2)\). Positive eigenvectors contribute the opposite sign and \(k=0\) contributes zero. This applies to the complexification of all four real angular components, with the Fourier reality condition pairing \(k\) and \(-k\).

At \(n=1\), \(|k|=2\pi\) and negative sign the ratio is one. For that spatial length the largest ratio among \(n\ge2\) is \(17/20\) at \(n=2\). For \(|k|\ge2\sqrt2\,\pi\), the largest at each \(|k|\) is at \(n=1\), and the ratio decreases with \(|k|\) there. At \(2\sqrt2\,\pi\) it is \(17\sqrt2/33<17/20\), since \(800<1089\). If \(f\) is the fraction of \(d^2\) in the first negative shell, then \(r\le f+(17/20)(1-f)\). The strict bound \(r>8/9\) gives \(f>7/27\). The shell used in this comparison includes all real positive-spin components of \(w\) and the E14 Hessian kernel is a six-dimensional tangent space at the radial solution. [E17 spectrum](../notes/E17_POLAR_LOWER_BOUND.md#sharp-helicity-bound) · [E14](../notes/E14_FIRST_NEGATIVE_MODE.md)

Both conditions (2) hold whenever the mean deficit is strict, and such a deficit occurs even for positive action excess. For example, take the E27 angular profile \(g=\cos(\varepsilon F)+\sin(\varepsilon F)n\), \(F=\cos(\pi t/2)\), \(n=\mathbf j\cos(2\pi x_1)+\mathbf k\sin(2\pi x_1)\), with its exact mean-minimizing zero-end amplitude. With \(\omega=\pi/2\), its mean excess is \(-7\omega^2\varepsilon^4/48+O(\varepsilon^6)\), while its action excess is \(48641\omega^4\varepsilon^4/2048+O(\varepsilon^6)\). Thus the conditions and shell-fraction bound do not settle the remaining sector. The exact identity \(S-DQ_0^2=2Q_0\Delta+\|Q-Q_0\|_2^2\) shows the additional term entering the full comparison. [E27 analytic test](../notes/E27_POLAR_DEFECT.md#quartic-variance-and-the-full-action) · [E30 finite mean deficit](../notes/E30_SLICE_COMPARISON.md#circular-control-with-a-finite-mean-deficit)

## Quantitative extension of the lower endpoint

The compactness argument for strict extension can be supplemented by a direct estimate. Put \(b_0=4B/3\), \(b_1=(b_0+b_{\rm H})/2\), and let \(b=b_0+\delta\in[b_0,b_1]\). Any strict competitor has \(\Delta<0\), \(H<0\), and from (1) and \(d^2\ge B|H|\),

\[
0>\Delta\ge-\frac{\delta}{2}|H|+\frac{|H|^2}{12D},
\qquad |H|<6D\delta.
\tag{3}
\]

Let \(R\) have quaternion columns \(\partial_i u+(\partial_i g)\bar g\), and let \(A=\Pi(b\,dt\otimes 1)\) be the constant projected background. Right multiplication by \(\bar g\) commutes with the fiber projection, so \(Q=|A+\Pi R|^2\). The Clifford cross term gives \(2(A,\Pi R)=2Cb\,\partial_t u+bK_0/2\). For any real vectors \(A,Y\),

\[
|A+Y|^4-|A|^4-4|A|^2(A,Y)\ge |Y|^4/3 .
\]

For \(Y\ne0\), write \(A=aY+Z\) with \(Z\perp Y\). After division by \(|Y|^4\) the left-hand side is \(6(a+1/3)^2+1/3+2|Z|^2/|Y|^2\). The case \(Y=0\) gives equality. With \(Y=\Pi R\), integration and the end conditions yield

\[
S-DQ_0^2\ge Cb^3 H+\frac13\|\Pi R\|_4^4.
\tag{4}
\]

The determinant estimate for \(R\) can use the explicit bound \(|R|^4\le289\det R+512|\Pi R|^4\), with signed determinant. To see it, write \(R=A_q+E\) with \(A_q:X\mapsto Xq\), \(E=\Pi R\) and \(|R|^2=4|q|^2+|E|^2\). For \(|q|\ge2|E|\), the path \(A_q+sE\) stays in the positive-determinant component when \(q\ne0\), and every singular value of \(R\) is at least \(|q|/2\). Thus \(\det R\ge |q|^4/16\) and \(|R|^4\le(17/4)^2|q|^4\le289\det R\). If \(|q|<2|E|\) and \(\det R\ge0\), use \(|R|^4\le289|E|^4\). If \(\det R<0\), then \(|q|<|E|\), since \(|q|>|E|\) excludes sign change and \(|q|=|E|\) gives nonnegative determinant by continuity. Thus \(|R|^4\le25|E|^4\), and the singular values give \(|\det R|\le |R|^4/16\). It follows that \(|R|^4-289\det R\le25(1+289/16)|E|^4<512|E|^4\). These cases include the zero matrix. The determinant integrates to zero, since its volume form is \(du\wedge g^*\Omega\) with \(u\) of zero end traces. Combining (3) and (4) therefore gives

\[
\|dg\|_4^4\le \|R\|_4^4\le512\|\Pi R\|_4^4
<18\cdot512\,C D b_1^3\delta .
\tag{5}
\]

Use the homogeneous Sobolev bound \(\|w\|_4\le\|dg\|_2\). Indeed E16 gives its constant squared at most \(\sqrt{3/2}/(\pi s^3)<1\), \(s=(19+6\sqrt2)/32>3/4\), using \(\sqrt{3/2}<5/4\) and \(\pi>3\). The part of \(K\) with first argument \(\sigma\) has zero divergence, by skewness in \(i,j\), so it pairs to zero with \(du\). For the rest, at fixed \(j\) the three \(-c_i c_j w\) for \(i\ne j\) are orthogonal and have length \(|w|\). The E17 componentwise Cauchy–Schwarz estimate therefore bounds its pointwise norm by \(\sqrt3|w||dg|\). Hölder, the homogeneous Sobolev bound and the helicity bound give

\[
\Delta\ge C\|du\|_2^2+C(1-b/b_{\rm H})d^2
-\frac{\sqrt3}{2}\|dg\|_4\,\|du\|_2\,d .
\tag{6}
\]

Since \(b_1/b_{\rm H}=17/18\), (6) is nonnegative whenever \(\|dg\|_4\le 1/\sqrt6\), by the discriminant inequality for the two quadratic terms. Set

\[
\delta_*=\min\left\{\frac{b_{\rm H}}{18},\,
\frac{1}{36\cdot18\cdot512\,C D b_1^3}\right\}.
\]

The second term is about \(2.38\times 10^{-9}\) in the cylinder's slope units. If \(0<\delta\le\delta_*\), (5) yields \(\|dg\|_4^4<1/36\), contradicting \(\Delta<0\) by (6). Thus \(b_{\rm G}\ge b_0+\delta_*\). The argument uses only the given product geometry, the exact traces and the stipulated smooth class, and it extends by polar density. Its smallness condition is tied to the lower endpoint, and the crossing comparison remains open. [Polar determinant](../notes/B09_POLAR_COMPACTNESS.md#the-determinant-controls-the-part-discarded-by-the-twistor-projection) · [Homogeneous Sobolev bound](../notes/E16_GLOBAL_SLOPE_BOUND.md#sobolev-bound-with-mass-retained)
