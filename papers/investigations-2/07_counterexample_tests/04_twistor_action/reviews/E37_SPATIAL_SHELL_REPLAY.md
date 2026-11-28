# SP4-TWA-E37 · Independent replay of the favorable first spatial shell

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The frozen request records a non-author reviewer configured GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. Checkout `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4` and all four frozen SHA-256 digests matched at the start. During replay, the working copy of E26 acquired SHA-256 `1b183b74cf2143c952b20a434e09e7062f1f16752087efaeda652bd2085f05e3`. Removing one added TeX thin space in the periodic Fourier display reproduces the frozen digest exactly. [Frozen request and input versions](../research-progress/handoffs/E37_REQUEST_v1.md)

**PASS.** The radial field uniquely minimizes the action at \(b=51\pi/16\) when the unit angular field on each spatial slice belongs to the constants plus the entire \(T=-2\pi\) eigenspace. The log amplitude can vary over the full spatial torus and the angular field can change its active axis and polarization in time. The same bound and equality case hold in the polar \(W^{1,4}\) space if the spatial spectral condition holds almost everywhere in time. [Statement under review](../notes/B09_FIRST_SPATIAL_SHELL.md)

## Signed Fourier convention and unit constraint

Use the oriented flat Riemannian product \(M=[-1,1]\times Y\), \(Y=(\mathbb R/\mathbb Z)^3\) of volume one, with the periodic spin structure and parallel positive unit spinor \(1\). The Clifford model \(c(v)(s_+,s_-)=(v s_-,-\bar v s_+)\) gives \(c_0c_j=I_j\) on positive spinors, with \(I_j\) acting by left multiplication. The positive factor carries the self-dual action and all pairings below are real. In this convention \(c_0Dg=-g_t+Tg\), \(T=\sum_{j=1}^3 I_j\partial_j\), and \(P=\Pi d\) for the orthogonal projection off the Clifford contraction. Friedrich's published §1, p. 59, supplies the projection and the sign of the \(c(X)D/4\) term in four dimensions. [Frozen quaternion convention](../notes/E14_FIRST_NEGATIVE_MODE.md) · [Friedrich, published scan](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

Write \(k=2\pi\). Since \(T^2=-\Delta_Y\), only the three pairs of frequencies \(\pm k e_j\) can contribute to \(T=-k\). For a real quaternionic coefficient pair \(p_j\cos(kx_j)+q_j\sin(kx_j)\), the eigenvalue equation gives \(q_j=I_jp_j\). The real expansion, including the constant coefficient \(a\), is therefore
\[
g(t,x)=a(t)+\sum_{j=1}^3 e^{I_j kx_j}p_j(t).
\]
The constant term of the unit constraint is \(|a|^2+\sum_j|p_j|^2=1\). The individual first harmonics give \(a\perp P_j=\operatorname{span}_{\mathbb R}\{p_j,I_jp_j\}\). For distinct \(j,l\), the four products of sine and cosine on axes \(j,l\) are linearly independent and occur only in the corresponding cross term. Thus \(P_j\perp P_l\). If both planes were nonzero, each would be the orthogonal complement of the other and invariant under both \(I_j\) and \(I_l\), since these are orthogonal and preserve their own plane. For a nonzero \(p\) in either plane, the quaternion relations make \(p,I_jp,I_lp,I_jI_lp\) orthogonal and of equal norm, a contradiction. Consequently at each time with nonzero wave there is exactly one active axis, locally constant by continuity of the coefficients. Any switch passes through a zero of the total wave.

Set \(s=(\sum_j |p_j|^2)^{1/2}\), \(c=|a|\), and \(\theta=2\arctan(s/(1+c))\). Then \(\theta\in[0,\pi/2]\), \(s=\sin\theta\), and \(c=\cos\theta\). This expression is Lipschitz as a function of \((c,s)\) on \([0,1]^2\), including \(c=0\). Smooth time coefficients give a Lipschitz angle. The full angular traces give \(a(\pm1)=1\), \(p_j(\pm1)=0\), and \(\theta(\pm1)=0\).

## Two spatial averages and the moving polarization

Write \(\psi=e^{bt+u}g\), with \(u=0\) on both full ends. Let \(C=3/4\), \(\alpha=b\,dt+du\), and \(Q=|P\psi|^2/|\psi|^2\), so \(S=\int_MQ^2\). For fixed \(g\) and \(dg\), the real Clifford projection identity gives
\[
 Q=|\Pi(\alpha\otimes g+dg)|^2
   =C|\alpha|^2+\tfrac12\alpha\cdot K+Q_g,\qquad
 K_i=\sum_{\ell\ne i}(g,c_i c_\ell\partial_\ell g),\qquad Q_g=|Pg|^2 .
\]
In fact the Dirac norm has cross term \(-2\alpha\cdot K\) by skew-adjointness of \(c_i\), and the gradient norm has zero cross term by \((g,\partial_i g)=0\). The quadratic in \(\alpha\) is nonnegative as a squared norm for every real \(\alpha\), and its Hessian is \(2CI\). Its square is convex by composition with the increasing convex square on \([0,\infty)\).

On an open interval with active axis \(j\), write \(g=a+e^{I_j kx_j}p\). The coefficients of this quadratic depend only on \((t,x_j)\), so Jensen in the two other coordinates bounds the original spatial average of \(Q^2\) by the one for the transversely averaged amplitude, denoted \(\tilde u\). The averaged derivative components in those other coordinates vanish by periodicity. Differentiation in the retained coordinates commutes with averaging, and the full spatial mean of the amplitude is unchanged. Below \(Q\) in slice formulas is for \(\tilde u\), a bar is the mean over \(Y\), and \(v=b+\overline{u_t}=b+\overline{\tilde u_t}\).

Orthogonality of \(a\) and the wave gives \(K_0=(g,Tg)=-ks^2\) pointwise. Also \(K_j=-(g,I_jg_t)\) and \(\|\partial_jg\|_2^2=k^2s^2\), where all \(L^2\) norms in the slice calculation use \(Y\). Using \(c_0Dg=-g_t+Tg\) and \(\|Tg\|_2=\|\partial_jg\|_2\) gives
\[
\overline{Q_g}=C(\|g_t\|_2^2+k^2s^2)+\tfrac12\overline{(g_t,Tg)}
=C(\|g_t\|_2^2+k^2s^2)-\tfrac{k}{4}(s^2)' .
\]
Here \(\overline{(g_t,Tg)}=-k(p',p)=-k(s^2)'/2\). Inserting the amplitude and current terms yields
\[
\bar Q=C\bigl(v^2+\overline{(\tilde u_t-\overline{\tilde u_t})^2}
+\|\tilde u_j\|_2^2+\|g_t\|_2^2+k^2s^2\bigr)
-\tfrac k2 vs^2-\tfrac k4(s^2)'+\tfrac12\overline{\tilde u_j K_j}.
\tag{1}
\]
This also recovers the signed E30 slice flux \(H'/4\) with \(H=-ks^2\). [Frozen E30 slice identity](../notes/E30_SLICE_COMPARISON.md)

Where \(0<s,c<1\), put \(A=a/c\), \(N=e^{I_jkx_j}p/s\), and \(G_\theta=-sA+cN\). The planes of \(A,I_j A\) and \(N,I_j N\) are orthogonal. The real pairing gives \(|G_\theta|=1\) and \((g,I_jG_\theta)=0\) pointwise. Spatial integration eliminates the constant-wave cross terms in \(\overline{(g_t,G_\theta)}\), leaving \(-sc'+cs'=\theta'\). It follows that
\[
 \|K_j\|_2^2
 \le\|g_t-\theta'G_\theta\|_2^2
 =\|g_t\|_2^2-\theta'^2 .
\tag{2}
\]
On the level set \(s=1\), \(\theta'=0\) almost everywhere and \(|K_j|\le|g_t|\) gives (2) directly. This includes \(s=1\) sets of positive measure. No differentiation of \(A\) or \(N\) at a zero denominator is needed.

The sum \(C\|\tilde u_j\|_2^2+\overline{\tilde u_jK_j}/2\) in (1) equals \(C\|\tilde u_j+K_j/3\|_2^2-\|K_j\|_2^2/12\). By (2) the subtraction leaves at least \((2/3)(\|g_t\|_2^2-\theta'^2)\) of the angular kinetic surplus. Hence \(\bar Q\ge Q_{\rm hel}\), where
\[
 Q_{\rm hel}
 =C(v^2+\theta'^2+k^2s^2)-\tfrac k2 vs^2-\tfrac k4(s^2)'
 =C(v-ks^2/3)^2+C(\theta'-ksc/3)^2+\tfrac23 k^2s^2
 \ \ge0 .
\tag{3}
\]
Jensen in the remaining spatial coordinate bounds the averaged \(Q^2\) from below by \(\bar Q^2\ge Q_{\rm hel}^2\). This second step uses the mixed-current estimate and the nonnegative scalar comparison before squaring. [Favorable E15 quotient](../notes/E15_HELICAL_COMPETITOR.md)

At almost every time in the level set \(s=0\), all \(p_j'=0\) and \(\theta'=0\), because an absolutely continuous function has derivative zero almost everywhere on each constant level set. Thus \(g,g_t\) are spatially constant there. With \(K_0=0\) and \(K_x\) spatially constant, \(\overline{\nabla_xu\cdot K_x}=0\) by periodicity. The original spatial mean of \(Q\) is at least \(Cv^2\), since its remaining terms are nonnegative squares, and Jensen gives \(\overline{Q^2}\ge (Cv^2)^2=Q_{\rm hel}^2\). These almost-everywhere inequalities cover the union of all active intervals and the zero set, with no restriction on the number or accumulation of switches.

## Scalar comparison, equality and weak polar pairs

The full traces of \(u\) give \(\int_{-1}^1 v\,dt=2b\), so \(v\) meets the scalar amplitude constraint exactly. Under \(\xi=\omega t\), \(\omega=\pi/2\), the scalar expression (3) has \(q=Q_{\rm hel}/(C\omega^2)\) and \(B=b/\omega=51/8\) as in E26. Its estimate (4) gives
\[
 \mathbb E q^2-B^4
 \ \ge 2(B^2-5\mathbb E w)\,\mathbb E\bigl(z_\xi^2-z^2\bigr)
       +\tfrac{95}{32}\operatorname{Var}(w)
 \ \ge 0,\qquad z=\sin\theta,\quad w=z^2 .
\]
The first term uses the Dirichlet Poincaré inequality on the interval of length \(\pi\), and \(\mathbb E\) denotes its normalized mean. Its hypotheses continue to hold for \(\theta\in W^{1,4}(-1,1)\) of zero trace and \(v\in L^4(-1,1)\) of mean \(b\). The quadratic completion is pointwise, the derivative of the quadratic primitive in \(w\) integrates to its endpoint values, and \(w,w^{3/2}\) have matching traces and belong to periodic \(H^1\). The last Fourier estimate uses absolute uniform convergence of the periodic \(H^1\) series. Thus E26's inequality proof applies directly with this regularity. The frozen E26 statement itself is phrased for smooth profiles. [Frozen E26 proof](../notes/E26_FINITE_HELIX.md) · [Replay of the scalar constants](E31_HELIX_REPLAY.md)

This yields \(S\ge\int_{-1}^1 Q_{\rm hel}^2\,dt\ge2C^2b^4=9b^4/8\). For equality the variance gap and zero traces force \(w\equiv0\), so \(g=g(t)\). Strict convexity of \(v^4\) and its mean give \(v=b\) in the scalar equality case. In the original action the current pairing with the amplitude integrates to zero for \(g=g(t)\), since \(K_0=0\), \(K_x\) depends only on time, and each periodic spatial derivative of \(u\) has zero mean. The \(2bu_t\) term integrates to zero by the full end traces. Consequently
\[
 \int_M Q=2Cb^2+C\bigl(\|du\|_{L^2(M)}^2+\|dg\|_{L^2(M)}^2\bigr).
\]
Jensen over \(M\) forces both derivatives to vanish for action equality. The end traces then give \(u=0\), \(g=1\), and the radial field attains equality.

For the weak extension, take \(u\in W^{1,4}(M,\mathbb R)\) and \(g\in W^{1,4}(M,S^3)\) with the same end traces, and define \(Q=|\Pi((b\,dt+du)\otimes g+dg)|^2\) almost everywhere. This is the squared quotient in the polar relaxation and needs no differentiation of \(e^{bt+u}\). Each of the finitely many spatial coefficient projections sends \(g\) to a \(W^{1,4}(-1,1)\) coefficient: its derivative is the projection of \(g_t\) by testing against time functions, and its endpoint values are the projected Sobolev traces. Their absolutely continuous representatives give the finite expansion everywhere after redefining \(g\) on a null set. Unit length then holds everywhere by continuity of this finite expansion. The norm and angle compositions give \(\theta\in W^{1,4}\) with zero end values. The spatial averages commute with weak derivatives by periodicity and Fubini. The entire slice argument and equality calculation thus hold almost everywhere, with the scalar estimate just justified at that regularity. [Polar action convention](../notes/B09_POLAR_COMPACTNESS.md)

## Remaining endpoint sector

The spectral condition concerns the spatial \(T\)-eigenspace on all four real components of the unit angular field at every time, with arbitrary time frequencies. Any strict competitor or second minimizer at the crossing must have positive angular gradient energy outside the constants plus \(T=-k\). This requires the opposite helicity at spatial length \(k\), or a higher spatial frequency. Higher time modes confined to the favorable first spatial shell are covered. A strict competitor must also meet the separate helicity and gradient-current necessary conditions of the unrestricted estimate. The shell comparison supplies a qualitative exclusion with no positive lower bound on the fraction outside the shell. The full crossing inequality and the value of the unrestricted global endpoint remain open. [Unrestricted slope estimate](../notes/B09_UNRESTRICTED_SLOPE.md)

The same exclusion applies to the possible second relaxed minimizer at a strictly subcrossing positive global endpoint. For a fixed polar pair with the shell condition, set \(A=\Pi(dt\otimes g)\) and \(R=\Pi(du\otimes g+dg)\). Its normalized action as a function of \(r=1/b\) is \(F(r)=\int_M|A+rR|^4\). It has \(F(0)=2C^2=9/8\) and \(F(1/b_{\rm H})\ge9/8\). If \(R\) vanishes almost everywhere, equality at \(b_{\rm H}\) forces the radial pair. Otherwise \(F\) is strictly convex, and interpolating between \(0\) and any \(r>1/b_{\rm H}\) shows \(F(r)>9/8\). Thus the shell comparison is strict for every nonradial pair at all \(0<b\le b_{\rm H}\). [Unrestricted coexistence alternative](../notes/B09_POLAR_COMPACTNESS.md)
