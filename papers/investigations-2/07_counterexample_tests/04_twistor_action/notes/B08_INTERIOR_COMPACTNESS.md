# Action excess and minimizing sequences at fixed interior slopes

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex, author-selected GPT-6.2 Astra/ultra. Independent backend telemetry unavailable. Baseline `280376dd7a18`. Inputs are the [convex comparison on the common trace class](B08_GLOBAL_TRANSITION.md), the [flat homogeneous identity](E14_FIRST_NEGATIVE_MODE.md) and [E12 Sobolev bound](E12_CYLINDER_CONSTANT.md).

For each **fixed** \(|b|<b_{\rm G}\), every minimizing sequence at the smooth admissible traces \(e^{\pm b}\sigma\) converges in the ordinary strong \(H^1\) topology to \(e^{bt}\sigma\). A quantitative comparison proves this throughout the interior even where the E12 and E16 Sobolev coercivity coefficients have lost their sign.

For \(0<b<b_{\rm G}\), put \(\theta=b/b_{\rm G}\), \(s=1/b\), and \(h=e^{-bt}\psi\). The smooth finite-action competitors \(h\) have both end values \(\sigma\); the finite compatible zero condition is preserved by multiplication as in the threshold proof. In each real spin tensor fiber take \(X=Ah/|h|\), \(Y=Ph/|h|\) away from the finite zero set. For any two vectors \(x,y\), the midpoint estimate
\[
 \frac{|x|^4+|y|^4}{2}-\left|\frac{x+y}{2}\right|^4
 \ \ge\ \frac{|x-y|^4}{16}
\]
follows by writing \(x=m+v,\ y=m-v\) and expanding. Convexity on either side of the midpoint yields
\[
 (1-\theta)|x|^4+\theta |y|^4-|(1-\theta)x+\theta y|^4
 \ \ge\ \tfrac18\min(\theta,1-\theta)|x-y|^4 .
\]
Apply this with \(x=X,\ y=X+sY\) and integrate. The [closed endpoint](B08_GLOBAL_TRANSITION.md) gives \(\int |X+\theta sY|^4\ge9/8\) for this same \(h\), since \(\theta s=1/b_{\rm G}\). Also \(\int|X|^4=9/8\). Multiplying the resulting inequality by \(b^4/\theta\) gives
\[
 S(e^{bt}h)-9b^4/8\ \ge\
 \frac{\min(\theta,1-\theta)}{8\theta}S(h).
\]
Reflection proves the same comparison with \(\theta=|b|/b_{\rm G}\) at negative interior slopes. At zero the excess already equals \(S(h)\).

Thus any minimizing sequence gives \(S(h_n)\to0\). With \(x_n=\|d(h_n-\sigma)\|_2\), Hölder and the flat zero-trace identity imply
\[
 \tfrac{\sqrt3}{2}x_n=\|Ph_n\|_2
 \le S(h_n)^{1/4}\|h_n\|_4
 \le S(h_n)^{1/4}\big(2^{1/4}+24x_n\big).
\]
The last step uses the E12 homogeneous \(H^1\)-to-\(L^4\) estimate. Absorption gives \(x_n\to0\), then time Poincaré gives \(h_n\to\sigma\) strongly in \(H^1\). Multiplying by the fixed smooth radial weight gives the claim in the original spinor variable. On each compact subinterval of \((-b_{\rm G},b_{\rm G})\) the excess factor is uniformly positive (and is exactly \(1/8\) when \(0<|b|\le b_{\rm G}/2\)). Multiplication by \(e^{bt}\) is uniformly bounded on \(H^1\) for these slopes. Consequently if \(b_n\) stays in such a subinterval and the physical action excess at \(b_n\) tends to zero, then \(\|\psi_n-e^{b_nt}\sigma\|_{H^1}\to0\). The coefficient tends to zero as \(|b|\uparrow b_{\rm G}\), leaving compactness at that endpoint open. The earlier fixed-slope \(H^5\) local theorem, weak \(H^1\) small-data estimate and explicit unbounded-\(H^5\) example keep their separate quantifiers.
