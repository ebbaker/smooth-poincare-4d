# The slopes of global radial minimization form a closed interval

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex. Author-selected lead GPT-6.2 Astra/ultra. Independent backend telemetry unavailable. Baseline `280376dd7a18`. Inputs are the [B08 geometry](../brainstorm/notes/B08_SLOPE_AND_HELICITY.md), [E11 admissible class](E11_GLOBAL_COMPARISON.md) and [E14 mode](E14_FIRST_NEGATIVE_MODE.md).

Fix the oriented flat cylinder \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) of volume 2, with its periodic spin lift, parallel unit positive spinor \(\sigma\), and real spinor pairing. Write \(P=\Pi d\), \(Az=\Pi(dt\otimes z)\), \(A^*A=3I/4\). For traces \(e^{\pm b}\sigma\) test exactly \(S=J_g^4\) over all smooth admissible spinors, including finite transverse compatible zeros. The theorem concerns attainment by the radial field. Existence of any other minimizer is a separate question.

## Normalization to a common set of competitors

Put \(h=e^{-bt}\psi\). Both end traces of \(h\) equal \(\sigma\). Smoothness, zeros, invertibility of their linear jet and the condition that its twistor projection vanish are preserved in both directions, since the scalar factor is positive and its derivative multiplies the vanishing spinor at each zero. Finite-action admissibility is therefore independent of \(b\) in this variable. Locally \(|h|\gtrsim r\), \(Ph=O(r)\) at a compatible zero, so \(Ph/|h|\) is bounded there. One can equivalently discard infinite-action fields when taking the infimum. The competitor class for \(h\) allows all such jets to vary with the competitor.

For \(b>0\), let \(s=1/b\), \(X=Ah/|h|\), \(Y=Ph/|h|\) off the zeros. Then
\[
 \Phi_h(s)=S(e^{bt}h)/b^4=\int_M |X+sY|^4,\qquad
 \Phi_h(0)=9/8.
\]
This is a polynomial of degree at most four and convex on the entire real line. It is strictly convex when \(Y\) is nonzero on a set of positive measure, since \(|\cdot|^4\) is strictly convex on a real inner product space. Its leading coefficient is positive in this case. In the remaining case \(Ph=0\) everywhere by smoothness. Apply the zero-trace identity \(\|P(h-\sigma)\|_2^2=(3/4)\|d(h-\sigma)\|_2^2\) to get \(h=\sigma\). This also proves global uniqueness for \(b=0\), although the Hessian there vanishes.

For a nonconstant \(h\), write \(m_h=\Phi'_h(0)=4\int |X|^2(X,Y)\). If \(m_h\ge0\), then \(\Phi_h(s)>9/8\) for all \(s>0\). If \(m_h<0\), there is a unique positive solution \(s_h\) of \(\Phi_h(s_h)=9/8\), and this field is strictly cheaper precisely for \(b>1/s_h\). The time-space inversion \((t,x)\mapsto(-t,-x)\) in the parallel frame reverses all derivatives and preserves their projected norm. It exchanges the two prescribed end values, preserves the jet class, and sends \(b\) to \(-b\). Thus the slopes for which the radial field attains the unrestricted global minimum form a closed interval \([-b_{\rm G},b_{\rm G}]\) with
\[
 b_{\rm G}=\inf_{h:\,m_h<0}1/s_h.
\]
The set in the infimum is nonempty by the smooth E14 competitor. At every strict interior slope the radial field is the unique minimizer. Indeed, for \(0<b<b_{\rm G}\) every nonconstant \(h\) has \(\Phi_h(1/b)>9/8\). At the endpoint a second minimizer exists exactly when this infimum of roots is achieved by a nonconstant \(h\). For \(|b|>b_{\rm G}\) at least one admissible competitor has strictly smaller action, regardless of attainment of the unrestricted infimum there.

## Comparing the two thresholds

The [unrestricted polar bound](E17_POLAR_LOWER_BOUND.md) and [linearized spectrum](E14_FIRST_NEGATIVE_MODE.md) give
\[
 \frac{17\pi}{8}\le b_{\rm G}\le b_{\rm H}=\frac{51\pi}{16}.
\]
This interval follows without any compactness hypothesis on the fourth-power action. To establish \(b_{\rm G}=b_{\rm H}\) would require only one new comparison, \(\Phi_h(1/b_{\rm H})\ge 9/8\) for all admissible \(h\). Conversely a single verified strict competitor at \(b_{\rm H}\) automatically gives \(b_{\rm G}<b_{\rm H}\) by continuity for that fixed normalized field. The [nonlinear tests](E15_HELICAL_COMPETITOR.md) investigate this endpoint directly. These statements use a fixed flat metric and the given full Dirichlet traces.
