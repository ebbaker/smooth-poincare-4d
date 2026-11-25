# Recognizing the exterior and descending on the original smooth type

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex. Lead requested as GPT-6.2 Astra, ultra. The lead runtime does not independently expose its serving variant or reasoning setting. Delegated checks explicitly select gpt-6.2-sol, ultra. Working checkout `cec037fa20d8b9e74636e4c313e802df9f71bd3d`. [Verified starting inputs](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md#inputs-and-versions)


## Proposition

Fix a smooth, closed, connected, oriented homotopy four-sphere $M$. Use smooth Riemannian metrics. Suppose $g_i$ are volume-one positive Yamabe minimizers, $4\pi^2\le E_+(g_i)\le 8\pi^2-\delta$, $\delta>0$, $E_+(g_i)\to e$ and $\int_M |B_{g_i}|\,dV_i\to0$. The energy integrates the squared Hilbert–Schmidt norm of the Weyl endomorphism on the real bundle $\Lambda^+$. Suppose an orientation-preserving smooth rescaled limit $X$ at scales $\lambda_i\downarrow0$ is supplied as in SEC §11. It is complete, connected, smooth, nonflat, with finitely many differentiated ALE ends of positive order through order five. The comparison embeds neighborhoods of entire fixed compact truncations, including their boundaries, simultaneously in $M$.

Then the smooth one-point conformal compactification $(\widehat X,\bar h)$ is orientation-preservingly diffeomorphic to $M$. Its class gives on $M$ a smooth positive-Yamabe Bach-flat metric of energy
$$
 4\pi^2< e_X=E_+(\bar h)\le e-\kappa_\delta .
$$
Here $\kappa_\delta>0$ is the constant in SEC §12.2. For the strict inequality $e_X<e$ on a single sequence only §11.5's strict residual is needed. This result uses one cut. There is no base-limit or full neck energy identity hypothesis. [SEC §§11–12](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

### Inputs from the component

The embedded full core and curvature/Yamabe budgets in SEC §11.3 give one end with trivial group. Section 11.4 constructs the smooth pointed compactification, gives $Y([\bar h])\ge\lim Y_i>0$ on a subsequence, and preserves the chiral energy. Section 12.1 gives $e_X>4\pi^2$ for the nonflat case and §12.2 supplies the lower bound for $e-e_X$. Thus the outside budget already satisfies $e-e_X<4\pi^2-\delta$. Smoothness at the added point is used in its actual smooth chart. [Compactification and its hypotheses](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4171) · [Uniform residual](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4549)

### One choice of the cut and all margins

Let $y_*=\sqrt{48\delta}$ and $b=\min(y_*,Y_{\rm rd}/2)>0$. Fix $0<\varepsilon<\delta/4$. In the two-cap audit choose a fixed buffer length $\ell$ so $C_I\ell^{-3/2}<b/2$. In smooth normal coordinates at the compactification point $p$, let the radius of the middle sphere be $s$. Its two surrounding strips are parameterized by $\rho=s e^{-t}$, $|t|\le \ell+2$. By E03 the pullback in product gauge tends in $C^2$ to within $C_\ell s^2$ of the round product at fixed $s$. The unmodified region strictly inside the inner unit splice contains the compact truncation $K_{\exp(1)s}=\widehat X\setminus B_{\exp(1)s}(p)$. Monotone exhaustion and smooth convergence on that compact set control its chiral energy. Choose $s$ small enough for the limiting tail to cost less than $\varepsilon$, and for the cap cost and Yamabe perturbation to have slack. Then choose $i$ large enough that
$$
 E_+(g_i)<e+\varepsilon,\quad
 E_+(g_i;\iota_i K_{\exp(1)s})> e_X-2\varepsilon,\quad
 \eta_2\le\eta_*,\quad C_W\eta_2^2<\varepsilon,\quad C_Y\eta_2<1/2.
$$
In particular the capped exterior $V_i^\wedge$ has
$$
 Y([g_{V_i}])>b/2,\qquad
 E_+(g_{V_i})\le E_+(g_i)-E_+(g_i;\iota_i K_{\exp(1)s})+C_W\eta_2^2
 < e-e_X+4\varepsilon<4\pi^2 .
$$
All energy on the source exterior, including additional concentration at unknown scales, is charged to the original global budget. By reducing $\varepsilon$ and increasing $\ell$ one can approach $e-e_X$ from above and $\lim Y_i$ from below in these respective estimates. No rate of convergence with moving radius was used. [E01 cap lemma](E01_TWO_CAP_AUDIT_20261125.md) · [E03 smooth marked cut](E03_EMBEDDED_CUT_20261125.md)

### The smooth identification

The cut is the boundary of the embedded $K_s$. The two sides are connected and simply connected by separation and van Kampen. Mayer–Vietoris makes both integral homology balls. Capping either by the designated smooth ball produces a homotopy four-sphere. On $V_i^\wedge$, the signature vanishes, so its full four-index Weyl energy is $8E_+<32\pi^2=16\pi^2\chi$. Chang–Gursky–Yang recognize this smooth closed positive-Yamabe manifold as $S^4$ or $\mathbb{RP}^4$. Its fundamental group selects $S^4$. [Theorem A and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

On the core side the cap is the actual normal-coordinate $D^4$ deleted from $\widehat X$. The comparison embedding and its boundary marking thus give a diffeomorphism $K_s^\wedge\cong\widehat X$. Recovering $M$ by removing the two gluing balls and reattaching along the original identification gives an oriented connected sum. To see the standard-sphere unit here, a parametrized embedded smooth ball can be shrunk inside itself by an embedding isotopy and then straightened in a local chart, extending the isotopy to the ambient manifold. The attaching map on $S^3$ is isotopic to an orthogonal map in the appropriate orientation component and extends smoothly over the ball (use that isotopy in a collar and the linear extension near the center). This proves $M\cong\widehat X\# S^4\cong\widehat X$ with its inherited orientation. It makes no assumption about a side of an arbitrary embedded three-sphere before the capped exterior is recognized. [Hatcher, opening theorem and component consequence](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf)

### Variational consequence

Define $I^+(M)=\inf\{E_+(g):g\text{ smooth Riemannian on }M,\;Y([g])>0\}$. Transfer $[\bar h]$ over the oriented diffeomorphism. The criterion for the infimum is exactly satisfied, giving
$$
 I^+(M)\le e_X\le e-\kappa_\delta.
$$
In particular *any* sequence satisfying the input hypotheses with $e-I^+(M)<\kappa_\delta$ excludes this bubble; exact minimization is one instance. For $e=I^+(M)$ even the qualitative strict residual gives the contradiction. On a general sequence this proves an actual lower-energy competitor, which can itself be a nonround positive closed critical class above $4\pi^2$. Using its constant Yamabe sequence would give a closed critical metric with zero Bach error, but supplies no new scale of concentration or decreasing direction. Existence of a band sequence on each smooth type, its approximately critical minimizing selection and the classification or instability of a surviving closed class remain distinct hypotheses.
