# Independent check of the round band on the returned unknot cut

26 November 2026, America/New_York. For Edward B. Baker III with OpenAI Codex assistance. Independent readback of the [returned-band note](../02_handle_isolation_and_marked_surgery/notes/ROUND_BAND_ON_RETURNED_UNKNOT.md), SHA-256 `00a06606ef998b745b9a26de3182025cd9a251ec26f44271c92121658ec553fd`. The [slide packet](../02_handle_isolation_and_marked_surgery/notes/GST_PAIR_MOVE.md) matched `4b6467e4c2b36bddec6baae46d0e08401882669be3541b62feaab84a8ae9d908`. The [surgery manuscript](../02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) matched `e53bc30bb034b6db9d2576cc370d1d6f032cfca8a815c284956deaba15869b7d`. Independent serving model and effort are unavailable. This check uses the smooth oriented category and a unit-radius Riemannian metric.

The named section is the pullback of the returned $U$-first level, of type $S^1\times S^2$, through the inverse of the Figure 6 slide. Its measured outward end means are $1$ and $-5/\sqrt 3$. Its two half-widths are $\pi/24$, and the intrinsic width $\pi/12$ exceeds the comparison width from the two means. Property R distinguishes the band's central $S^1\times S^2$ from both original Figure 6 prefixes for the selected band.

## The diffeomorphism of pairs

Let $M_6=D^4\cup T_6\cup_{\gamma_6}H_2$ be the original smooth assembly, where $H_j=\natural_j(S^1\times D^3)$ and $T_6$ is the two-attachment trace. The inverse Figure 6 slide gives $F_6:T_6\to T_5$ with the incoming collar fixed and outgoing restriction $\phi_6$. It sends the assembly to $M_5=D^4\cup T_5\cup_{\gamma_5}H_2$, where $\gamma_5=\gamma_6\phi_6^{-1}$. Denote the whole map by $\mathcal F_6$. Its inverse is $F_6^{-1}$ on the trace and the identity on the unchanged end bodies. This uses the inverse slide alone. In the returned Figure 5 presentation attach $U$ first. The zero-framed unknot trace $A=D^4\cup h_U^2$ is $S^2\times D^2$ and its boundary $Z_U$ is $Y_1$. The second integral attachment sends this $Y_1$ to $Y_2$. By the one-knot theorem its framed attaching knot in $Y_1$ is a local zero-framed unknot. The dual knot in $Y_2$ crosses the new product sphere once, so the outgoing marking extends over the actual $H_2$ and there is a reverse 1/2 cancellation. The resulting diffeomorphism $\Xi:B\to H_1$ is on the upper piece $B$ consisting of that dual handle and the original upper body. The actual closing from $A$ to $H_1$ is $\delta=(\partial\Xi)\delta_0$, where $\delta_0:\partial A\to\partial B$ was the closing before the cancellation. The inverse is $\delta_0^{-1}(\partial\Xi)^{-1}$. [GST, §2 and Figures 5–6](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf) · [Meier–Schirmer–Zupan, Theorem 5.1](https://arxiv.org/pdf/1507.06561#page=9) · [Marked cancellation readback](LAST_HANDLE_READER.md#upper-marking-and-cancellation)

In the round unit sphere in $\mathbb R^3\oplus\mathbb R^2$ the lower region up to $\theta_0$ is parametrized by $(x,z)\mapsto(\sqrt{1-|z|^2}\,x,z)$ with $x\in S^2$ and $|z|\le\sin\theta_0$. The upper one is parametrized by $(y,v)\mapsto(v,\sqrt{1-|v|^2}\,y)$ with $y\in S^1$ and $|v|\le\cos\theta_0$. Call the regions $A_{\rm rd},B_{\rm rd}$ and their actual boundary identification $\iota$. Choose an oriented diffeomorphism $f:A\to A_{\rm rd}$. The needed upper map $h:H_1\to B_{\rm rd}$ must satisfy

$$
\partial h = \iota\,\partial f\,\delta^{-1}.
$$

The right side preserves the boundary orientations since $\iota$ and $\delta$ each reverse them. Laudenbach–Poénaru's boundary extension gives $h$. Choose product representatives in collars of $\partial A$ and $\partial H_1$ using collar straightening. Then $f\cup h$ and its inverse glue smoothly across the specified face. Composing with $\operatorname{id}_A\cup\Xi$ and $\mathcal F_6$ gives a diffeomorphism of pairs

$$
\Phi:(M_6,\mathcal F_6^{-1}(Z_U))
    \longrightarrow (S^4,\{\theta=\theta_0\}).
$$

The inverse is the composition of the three actual inverses in reverse order. Thus $\Phi^*g_{\rm rd}$ realizes the whole measured band about the stated embedded section in $M_6$. The pullback uses the original upper gluing through $\gamma_5$ and $\delta$ at their respective stages. [Laudenbach–Poénaru, proof of Theorem A, pp. 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=6)

## Intrinsic widths and the two outward means

Write the parametrization on the band as $(\cos\theta\,x,\sin\theta\,y)$ and let $g_j$ denote the unit sphere metric in dimension $j$. The induced metric is $d\theta^2+\cos^2\theta\,g_2+\sin^2\theta\,g_1$. Its scalar curvature is $12$, and its central slice has scalar curvature $2/\cos^2\theta_0$. Projection to that marked slice has degree $+1$ on the central slice with matching orientations. Every curve inside the band has length at least its net angular displacement, and a curve with constant $(x,y)$ attains this bound. Thus the distance from either end to the central slice is $\pi/24$ with $\theta_-=\pi/4$, $\theta_0=7\pi/24$ and $\theta_+=\pi/3$. These distances also hold pointwise from the central slice to either end. The end-to-end distance is $d=\pi/12$. The width-only threshold at $\rho=12$ is $d\ge\pi/2$, while the measured $\rho d^2=\pi^2/12$. [Räde, Definition 1.1 and Corollary 2.25](https://arxiv.org/pdf/2104.10120v4)

The shape eigenvalues with normal $+\partial_\theta$ are $-\tan\theta,-\tan\theta,\cot\theta$, hence $H(\theta)=\cot\theta-2\tan\theta$. The outward normals at the lower and upper ends are $-\partial_\theta$ and $+\partial_\theta$. The outward means are constant on each end and their infima are

$$
a=-H(\theta_-)=1,\qquad b=H(\theta_+)=-5/\sqrt 3.
$$

If all closed separators fail to admit positive scalar curvature, the finite comparison at $\rho=12$ requires $\arctan(a/3)+\arctan(b/3)+2d\le0$. Set $A(\theta)=\arctan(H(\theta)/3)$ and $t=\tan\theta$. Since $H'=-(1+t^2)(t^{-2}+2)$, direct differentiation gives

$$
\frac{d}{d\theta}\big(A(\theta)+2\theta\big)
=2-\frac{3(1+2t^2)}{1+4t^2}
=\frac{2t^2-1}{1+4t^2}.
$$

Here $1\le t\le\sqrt 3$. The derivative is at least $1/5$ and strictly larger in the interior. The expression, obtained by integrating this derivative, is greater than $\pi/60$. In exact endpoint form it is

$$
\arctan(1/3)-\arctan(5/(3\sqrt 3))+\pi/6
\simeq 0.07918668.
$$

The measured width $d\simeq0.26179939$ therefore exceeds the model width $[\arctan(5/(3\sqrt 3))-\arctan(1/3)]/2\simeq0.22220605$. Since the band is a product, any closed separating hypersurface has an oriented component of nonzero projection degree. The strict comparison is consequently a certificate at the returned marked cut. The induced central slice already provides a positive-scalar-curvature metric in its own right. The sectional curvature of the entire unit round source is one, so $W^+$ and $W^-$ vanish on the band and both complete sides. [Räde, Remark 1.4, §2.A, Theorem 2.7, Corollary 2.9 and Proposition 2.21](https://arxiv.org/pdf/2104.10120v4) · [Normalization readback](END_CURVATURE_READER.md)

## Scope on the original assembly

The inverse slide fixes the collar through the $Q$-first prefix when the comparison is constructed with anchor $Q$ first. The new $U$-first section pulls back an embedded level of a returned presentation. The original $Q$- and $V$-first sections have types $S^3_0(Q)$ and $S^3_0(V)$ for the selected Figure 6 band. Both knots are nontrivial by the input slide packet, so Property R distinguishes both section types from $Y_1$. In particular the diffeomorphism of pairs above specifies which section is being measured in the original smooth source. Its scalar and mean values and widths refer to the constructed round metric at that section. The prior Mazur band and the charged E61 disk have separate physical markings. [Original prefix table and selected band](../02_handle_isolation_and_marked_surgery/notes/GST_PAIR_MOVE.md#individual-prefixes) · [GST, Theorem 1.1 (Gabai)](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf) · [Earlier Mazur witness and physical disk](PENULTIMATE_CUTS_AND_CURVED_FILLINGS_20261126.md)
