# Where the spinorial construction succeeds and where it loses degree

24 November 2026, America/New_York. SP4-FOT-DIR-B05, research assessment for Edward B. Baker III. The selected OpenAI lead made the conceptual choices and integrated the results. All bounded execution was configured for gpt-6.2-sol at ultra. The runtime did not independently expose realized model and effort. Inputs are identified by SHA-256 in the [issued requests](../research-progress/handoffs/README.md) and the [shared input audit](../../notes/SH_E00_20261124.md). This is an internal mathematical assessment.

The sharpest distinction in this investigation is between *how small an error can be* and *what survives along a sequence making it small*. A conformal change can concentrate the mass of an almost-twistor spinor. Even on a fixed metric, a sequence of maps to the round sphere can concentrate its degree. Imposing five mean-zero constraints on the maps gives a smooth spectral limit. The signed Jacobian determines whether that limit still carries the topological information needed for recognition.

## The sharp scalar comparison

Let $M$ be a smooth closed connected oriented spin four-manifold, let $h$ be the metric of sectional curvature one on the target $S^4$, and use $\Delta=d^*d$. For a smooth map $f:M\to S^4$ of degree $+1$ define
\[
Y_f([g])=\inf_{u\in H^1(M),\,u\ne0}
 \frac{\displaystyle\int_M \left(6|du|^2+
       (s_g-3|df|_{g,h}^2)u^2\right)dV_g}{\|u\|_{L^4(g)}^2}.
\]
With the potential omitted this is the ordinary conformal Yamabe constant $Y([g])$. In the comparison with a twisted Dirac equation the unknown bundle on the source is $S_g\otimes f^*S_h$, with the target spin connection pulled back. Its product-graded index is $2\deg f$. On a homotopy sphere the individual target half-twists have domain-chiral indices $+1,-1$. Thus the twist has a genuine kernel at every initial metric. Listing's Theorem 3 gives homothety once $s_g\ge 3|df|^2$ holds. A positive ground-state conformal change shows that $6\Delta+s_g-3|df|^2$ always has first eigenvalue at most zero. Equality holds exactly when $f$ is a conformal diffeomorphism. [Index, hypotheses and equality case](../notes/DIR_E05_20261124.md) · [Primary-source record](../../../../../references/SOURCE_NOTES_DIRAC_20261124.md)

For one supplied map, $Y_f$ is the **maximum** of this first eigenvalue over unit-volume metrics in $[g]$. At a negative value the maximizing metric is unique and has constant scalar deficit $s-3|df|^2=Y_f$. At zero, every unit-volume representative maximizes the eigenvalue, while the unit-volume round pullback is the unique representative with zero pointwise deficit. The fixed-potential functional and its constant-deficit minimizers have antecedents in the modified Yamabe literature. [Fixed-map proof](../notes/DIR_E08_20261124.md) · [Attribution and second proof check](../notes/DIR_E13_20261124.md)

For a fixed conformal class and *varying* map the exact answer is
\[
 \boxed{\displaystyle\sup_{\deg f=1}Y_f([g])=\min\{Y([g]),0\}.}
\]
The supremum is attained precisely in a conformally round class. Its maximizing maps are the orientation-preserving conformal diffeomorphisms. This applies to **every** smooth closed connected oriented spin four-manifold. No step requires the source to be a homotopy sphere. The individual half-index values above have the narrower scope indicated there.

The upper bound combines the sign of the twisted comparison and the ordinary Yamabe test. For the lower bound, one oriented ball carries a truncated inverse stereographic map. At scale $\epsilon$ its Euclidean conformal factor is $b_\epsilon=2\epsilon/(\epsilon^2+|x|^2)$, and the model potential is $12b_\epsilon^2$. The equation $6\Delta b_\epsilon=12b_\epsilon^3$ makes the local quadratic form nonnegative by integration by parts. A logarithmic cutoff between the shrinking ball and its exterior has vanishing $L^4$ gradient. The exterior retains the ordinary Yamabe lower bound, including when that bound is negative. The resulting estimate is uniform over all $L^4$-normalized tests. Along this same family $f_\epsilon^*dV_h$ converges as a measure to $\operatorname{Vol}_h(S^4)\delta_p$. Thus zero is universally approachable in nonnegative classes even if no map attains it. An independent helper recomputed the lower bound and all three sign cases against the same rigidity input. [Bubble construction](../notes/DIR_E09_20261124.md) · [Review](../notes/DIR_E13_20261124.md)

## What balance recovers

Fix a smooth **unit-volume Yamabe minimizer** $g$, with constant scalar curvature $s$ of initially unrestricted sign. Let $\lambda_1>0$ be the first positive **scalar Laplace** eigenvalue. Call a map balanced when $\int_M f\,dV_g=0$ in $\mathbb R^5$. Smooth balanced degree-one maps exist for every supplied smooth positive density. Balance is a real restriction in the optimization because target conformal changes alter $|df|^2$. [Initialization](../notes/DIR_E16_20261124.md)

For such maps one has
\[
 Y_f([g])\le s-3\int_M|df|^2dV_g\le s-3\lambda_1\le0.
\]
These inequalities come from testing with $1$, applying the scalar Poincaré inequality to the five coordinates, and taking the second variation at the Yamabe minimizer. In particular a strictly stable minimizer ($3\lambda_1>s$) gives a quantitative gap **uniform over all balanced maps**. If balanced degree-one maps satisfy $Y_{f_j}\to0$, then $s=3\lambda_1>0$, and the spectral gap above the first eigenspace gives a subsequence converging strongly in $W^{1,2}$ to a smooth $F:M\to S^4$. Its coordinates are first eigenfunctions (or zero) and $|dF|^2=\lambda_1$. This is where positivity is deduced. [Balanced spectral limit](../notes/DIR_E14_20261124.md)

If the absolute Jacobians are uniformly integrable with respect to $dV_g$, convergence in measure of their signed densities upgrades to $L^1$ convergence. Then $\deg F=1$ and $s=3|dF|^2$ gives a homothety by Listing. Uniform integrability means that the absolute Jacobian mass of sets of volume at most $\delta$ tends to zero as $\delta\downarrow0$, uniformly in the sequence. An $L^{4+\eta}$ derivative bound with $\eta>0$ suffices. A uniform critical $L^4$ bound can coexist with a nonzero point mass. [Degree and recognition](../notes/DIR_E14_20261124.md)

Conversely, if $s=3\lambda_1$ and there is any sphere-valued first eigenmap, the balanced degree-one supremum is zero. At nonzero degree the eigenmap already gives a homothety. At degree zero, one can implant one positive bubble. At degree $-1$, one can implant two. A small target conformal correction restores the exact mean without altering the limiting value of the scalar test. Thus $W^{1,2}$ convergence to the first eigenspace and exact balance can coexist with integer loss of degree. On the round sphere a sequence of balanced degree-$+1$ maps can converge to a reflection of degree $-1$. The degree-zero construction assumes such an eigenmap has first been supplied. The example with a reflection demonstrates loss of degree on a known smooth sphere; it gives no example of a nonstandard smooth sphere. [Converse and model](../notes/DIR_E15_20261124.md) · [Second proof check covering necessity, converse and initialization](../notes/DIR_E17_20261124.md)

## The ordinary twistor equation

On the same real Riemannian spin base, $P_X\psi=\nabla_X\psi+\tfrac14X\cdot D\psi$ for a positive half-spinor. A nontrivial exact solution forces $W^+=0$, including at its zeros. On a homotopy sphere signature and conformal development then give a diffeomorphism to $S^4$. A chiral projection of a round Killing spinor realizes the converse. Ordinary harmonic spinors, full-Dirac eigenspinors and twistor spinors solve different equations. [Fixed-metric proof](../notes/DIR_E01_20261124.md) · [Shared endpoint audit](../../notes/SH_E01_20261124.md)

For $\mu(g)=\lambda_{\min}(P_g^*P_g|_{S^+})$, **every fixed conformal class** on a smooth closed spin four-manifold satisfies $\inf_{h\in[g],\,\mathrm{Vol}(h)=1}\mu(h)=0$. Magnify a reference ball of radius $r$ by length factor $r^{-1}$ and cut off a local test spinor beyond the magnified region. The squared residual quotient is $O(r^3)$. In a kernel-free class even the actual lowest eigenspinors have $O(r^3)$ of their normalized mass outside $B_{2r}$. If $E_+(g)>0$ this example admits no positive $C^2$ metric limit after orientation-preserving spin diffeomorphisms. Attainment in a fixed class is equivalent to its having a twistor kernel. [Trial estimate](../notes/DIR_E02_20261124.md) · [Eigenspinors and obstruction](../notes/DIR_E03_20261124.md)

A conformally invariant alternative is $J_g(\psi)=\||P_g\psi|/|\psi|\|_4$ away from isolated zeros. For every metric on a smooth homotopy sphere one can construct a test spinor with a single zero having first jet $X\mapsto X\cdot\eta$, $\eta\ne0$. Its local index matches $\langle c_2(S^+),[M]\rangle=-1$ and its cost is finite. In a fixed kernel-free class a reference estimate $\|\psi\|_4\le C_g\|P_g\psi\|_2$ gives $J_g\ge C_g^{-1}>0$. In the punctured metric $|\psi|^{-4}g$, the unit spinor supplies a spin frame whose chiral connection has $L^4$ norm comparable to $J$. Finite cost supplies admissible initial data. No estimate makes it approach zero across conformal structures on an arbitrary $M$. [Prescribed zero](../notes/DIR_E06_20261124.md) · [Conformal gap](../notes/DIR_E07_20261124.md) · [Punctured metric and connection](../notes/DIR_E10_20261124.md)

The derivative needed for approximate recognition is explicit. Set $T=P\psi$, and let $\Pi$ project $\Lambda^+\otimes S^+$ onto the kernel of Clifford contraction. With the curvature-operator Hilbert–Schmidt norm,
\[
 \frac{|\Pi(d^\nabla T)^+|^2}{|\psi|^2}=\frac12 |W^+|^2.
\]
The right side extends the quotient across zeros. The formal adjoint $P^*T$ sees the complementary component. The integral threshold is therefore $2\pi^2$ with positive Yamabe constant in the same class. On standard $S^4$ a sequence of unit-volume metrics converging in $C^1$ has spinors with a fixed transverse zero and $J=O(n^{-1/2})$, while $E_+\ge cn$. The derivative identity recovers curvature exactly, and the example shows why an independent derivative bound is essential. [Projection and constants](../notes/DIR_E12_20261124.md) · [Oscillatory counterexample](../notes/DIR_E11_20261124.md)

## Assessment of the global premises

| Obligation on every smooth homotopy four-sphere | Disposition |
| --- | --- |
| Initialize smooth fields and bundles | Established for finite-cost one-zero sections, the degree-one twist, and balanced degree-one maps. |
| Produce a small value | Established unconditionally for the normalized ordinary twistor spectral value. The unrestricted coupled value reaches zero as a supremum exactly in the nonnegative Yamabe classes. The balanced value has the sharper eigenmap criterion above. |
| Retain spinor mass and regular geometry | Conditional. With suitable gauges, uniform and strong $W^{1,4}$ convergence of the metrics to a smooth positive limit suffices. Spinor and covector identifications give $H^1\to L^2$ convergence of $P$ and preserve a normalized nonzero limit. No construction supplies those metric bounds for every $M$. [Limit proof](../notes/DIR_E04_20261124.md) |
| Retain the degree of near-optimal balanced maps | Conditional. Uniform integrability suffices. The bubble constructions locate the missing compactness in the given smooth structure. |
| Recognize achieved geometry | Audited for the chiral exact and strict small-energy endpoints and for the degree-one homothety. |

**Global gap.** No argument produces, on every $M$, a Yamabe-minimizing metric with a balanced near-zero sequence that retains nonzero degree, or a sequence of metrics and normalized half-spinors reaching a nontrivial smooth twistor limit. Either construction would yield the standard smooth type. The fixed-class variational values alone cannot supply it. The [continuation](../continuation-notes/01_AFTER_CONCENTRATION_AND_BALANCE_20261124.md) identifies the next question about a degree-zero first eigenmap.

**Evidence and routing.** The lead retained the selected settings. Two shared and seventeen DIR requests were executed by helpers explicitly configured as gpt-6.2-sol/ultra. The two optimization reviews (E13 and E17) used different helpers from those that produced E09 and E15. They share the primary rigidity input. All 97 file-hash entries in the nineteen requests were rechecked against the working tree. Source attribution, including the prior modified Yamabe theory, is in the [source catalog](../../../../../references/SOURCE_NOTES_DIRAC_20261124.md).
