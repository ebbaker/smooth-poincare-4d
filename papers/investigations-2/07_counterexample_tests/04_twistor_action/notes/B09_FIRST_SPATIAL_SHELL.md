# Endpoint comparison on the entire favorable first spatial shell

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance, author-selected GPT-6.2 Astra/ultra lead and independent serving telemetry unavailable. Checkout `7c6bbab9a0a6`. Inputs are [E14's quaternion convention](E14_FIRST_NEGATIVE_MODE.md), [E26's verified scalar inequality](../reviews/E31_HELIX_REPLAY.md), the [E30 slice identity](E30_SLICE_COMPARISON.md), and the [unrestricted sector test](B09_UNRESTRICTED_SLOPE.md).

**Statement.** At \(b=51\pi/16\), allow an arbitrary smooth real amplitude \(u(t,x)\) with zero end traces. Let the smooth unit angular field \(g\) have full end traces \(1\). On each time slice suppose its spatial Fourier content consists of the constant mode and the whole eigenspace of \(T=\sum I_j\partial_j\) at eigenvalue \(-k\), \(k=2\pi\). There is no time frequency restriction. Then \(S(e^{bt+u}g)\ge 9b^4/8\), with equality only for the radial field. In particular, a strict competitor needs angular spectral content outside these two spatial eigenspaces, even with full freedom to change its log norm.

## Angular rigidity on each slice

The real Fourier expansion of such a unit field is
\[
 g=a+\sum_{j=1}^3 e^{I_j kx_j}p_j ,
\]
with smooth quaternionic coefficients depending on time. In \(|g|^2=1\), the first harmonics give \(a\perp P_j\), where \(P_j=\operatorname{span}_{\mathbb R}(p_j,I_jp_j)\). The mixed harmonics \(\pm e_j\pm e_l\) for each pair of axes give all four scalar products between the respective spanning vectors equal to zero, by independence of the sine and cosine products on the two circles. Thus nonzero \(P_j,P_l\) would be orthogonal real planes filling \(\mathbb H\). Both would be invariant under \(I_j\), since \(P_j\) and its orthogonal complement are invariant. Likewise both would be invariant under \(I_l\). But for any nonzero \(p\) in one such plane, \(p,I_jp,I_l p,I_jI_l p\) are four mutually orthogonal vectors there. Hence at most one \(p_j\) is nonzero at a given time. Its index is constant locally on its open nonvanishing set. This allows the rotation axis and the active coordinate to change through times with zero wave amplitude.

Put \(s=(\sum |p_j|^2)^{1/2}\), \(c=|a|\), and write \(s=\sin\theta,c=\cos\theta\) with \(0\le\theta\le\pi/2\). Since \(c^2+s^2=1\), the time angle is Lipschitz with zero end values. Let \(v=b+\overline{u_t}\) where the bar is the mean over the whole spatial torus. Its time mean is \(b\).

## Spatial averaging with a moving polarization

On an open interval with active axis, write it as axis 1 by an oriented permutation of coordinates and the corresponding quaternion units. Convexity of \(Q^2\) in \(du\) for fixed \(g\) permits Jensen averaging in the inactive coordinates. Indeed the coefficients of \(Q=C|b\,dt+du+K/3|^2+V\), \(C=3/4\), are independent of those coordinates, and their averaged derivative components vanish. Denote the averaged amplitude again by \(u\) locally; its full spatial mean is unchanged.

Here \(g=a+e^{I_1kx_1}p\), \(s=|p|\). We have \(K_0=-ks^2\), \(\|\partial_1g\|_{L^2(Y)}^2=k^2s^2\), and \(K_1=-(g,I_1\partial_tg)\). Wherever \(0<c,s<1\), write \(A=a/c\), \(N=e^{I_1 k x_1}p/s\) and \(g_\theta=-s A+c N\). The complex orthogonality of the planes of \(A\) and \(N\) gives \((g,I_1g_\theta)=0\) pointwise and \(|g_\theta|=1\). Integration over \(x_1\) gives \(\int_Y (\partial_tg,g_\theta)=-sc'+cs'=\theta'\). Therefore
\[
 \|K_1\|_{L^2(Y)}^2\le\|\partial_t g-\theta'g_\theta\|_{L^2(Y)}^2
                    =\|\partial_t g\|_{L^2(Y)}^2-\theta'^2 .
\]
At almost every time where \(s=1\), \(\theta'=0\) and the inequality follows directly from \(|K_1|\le|\partial_tg|\).

The E30 slice formula for the transversely averaged field gives
\[
 \bar Q=C\big(v^2+\overline{(u_t-\overline{u_t})^2}+\overline{u_1^2}
            +\|\partial_tg\|_2^2+k^2s^2\big)
       -\tfrac k2 v s^2-\tfrac k4(s^2)' +\tfrac12\overline{u_1K_1}.
\]
Complete the \(u_1\) square. Its possible negative contribution is at most \(\|K_1\|_2^2/12\) and is absorbed by \(C(\|\partial_tg\|_2^2-\theta'^2)\). Thus \(\bar Q\) bounds from below the nonnegative E15 squared quotient for the time angle \(\theta\), velocity \(v\) and favorable signed frequency \(k\). Spatial Jensen now bounds the original spatially averaged quartic density from below by the square of that E15 quotient.

At almost every time in \(s=0\) all coefficients \(p_j\) and their derivatives vanish (the derivative of an absolutely continuous function vanishes a.e. on its zero set), and \(\theta'=0\). Then \(g,g_t\) are spatially constant. Jensen on the full torus bounds the original density there by at least \((Cv^2)^2\), the same scalar comparison. These almost-everywhere inequalities integrate across arbitrary switching sets. Since \(v-b\) is the derivative of the full spatial mean of the original \(u\), it has exactly the mean constraint required in E26. Applying its proved Lipschitz-angle version gives the action lower bound. Equality forces \(\theta\equiv0\), by the variance gap and the end trace, and \(v\equiv b\). Now \(g=g(t)\). The integrated polar identity has \(H=0\), and \(du\cdot K\) integrates to zero because \(K_0=0\) and \(K_x\) depends only on time. Equality forces \(dg=du=0\), proving uniqueness.
