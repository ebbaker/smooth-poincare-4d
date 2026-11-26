# FOT-E43-D · Local nonconformal saving and protected cap cost

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution on the existing clamped disk and signed cost framework. Actual serving model and reasoning effort are unavailable. Intake was the E42 working generation over 95a4f50eb9ec6e0e98454170279f45a66b000211. [Shared input and toolchain receipt](../../../research-progress/handoffs/ED03_COLLAR_CHARGE_INPUTS_20261126.md) · [E42 assessment](../../../reviews/MARKED_GLUE_AND_CURVED_COST_20261125.md)

## A fixed finite source

Use a closed oriented smooth Riemannian homotopy four-sphere with signature zero and a positive Yamabe metric $g$ of chiral Hilbert–Schmidt energy $e<2T$, $T=4\pi^2$. The radial trim $W$, original closed protected disk $Q$, and larger disk $B$ are those of the actual marked comparison. Set $V=(\operatorname{int} B)^c$ and $U=\operatorname{int} B\setminus(Q\cup W)$. If the smooth Bach tensor satisfies $B_g(x)\ne0$ at some $x\in U$, choose $0\le\chi\in C^\infty_c(U)$ with $\chi(x)>0$. Its support is contained in a compact $K\subset U$. Take $C>0$ bounding the pointwise operator norm of $\chi B_g$ relative to $g$ and set
\[
 D=\chi B_g/C,\qquad g_t=g+tD\quad (|t|\le 1/2).
\]
The path is smooth and positive definite since $|D(v,v)|\le g(v,v)$. At $x$, the direction is a nonzero trace-free bilinear form. If $g_t(x)$ were a multiple of $g(x)$ for $t\ne0$, $D(x)$ would be a scalar multiple too, contrary to its trace and nonzero value. The metric is defined on the full original carrier including the closed disk. It preserves the original germs on the full trim, protected core and closed exterior at every parameter. [Selected native disk](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) · [Marked enlargement](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex) · [Lean construction](../../../../SmoothPoincare/Variational/NonconformalDiskSaving.lean)

In the Bach convention of Bahuaud–Guenther–Isenberg–Mazzeo, $D\mathcal W_g=-4B_g$ for the full tensor Weyl functional on a smooth compact four-manifold. On the source $\mathcal W=4(E_++E_-)=8E_+$, so
\[
 f'(0)=-\frac{1}{2C}\int_M\chi\, |B_g|_g^2\,dV_g,\qquad f(t)=E_+(g_t).
\]
The integrand is positive on an open neighborhood of $x$ of positive physical volume. For $\alpha=(4C)^{-1}\int_M\chi|B_g|_g^2\,dV_g>0$, the right difference quotient gives $f(0)-f(t)>\alpha t$ for sufficiently small positive $t$. The only energy hypothesis on the variation is its initial derivative identity. [Primary first variation, v1 §1, before (1.1)](https://arxiv.org/html/2508.06633v1#S1) · [Manuscript variation](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/core_variation.tex) · [Independent normalization check](../../../../../papers/master/01_fixed_type_variational_descent/reviews/E70_CORE_VARIATION.md)

For the fixed compact base $g$, write $Q_g(u)=6\int|du|_g^2+\int R_gu^2$ in its own volume. Smoothness and compactness give a difference bound $C_1|t|(\|du\|_{2,g}^2+\|u\|_{2,g}^2)$ and uniform relative $L^4$ comparison. The estimates
\[
 Y_g\|u\|_{4,g}^2\le Q_g(u),\qquad
 6\|du\|_{2,g}^2\le Q_g(u)+\|R_g^-\|_\infty\operatorname{Vol}_g^{1/2}\|u\|_{4,g}^2
\]
give $|Q_{g_t}-Q_g|\le C_2|t|Q_g$. Comparing the infima of the normalized quotients gives continuity at zero and a positive Yamabe floor near zero. Continuity of $f$ gives the common strict joined ceiling $(e+2T)/2<2T$ on a sufficiently small segment. The exact joined charge in each sign is $\lambda_g^s(V)+\lambda_{g_\tau}^s(B)$ because the full exterior is fixed and the smooth boundary has zero physical mass. The admissible radius is finite and depends on the source. [Positive-class wall](../../../../SmoothPoincare/Variational/YamabeWall.lean) · [Complete exterior charge](../../../../SmoothPoincare/Variational/BalancedMarkedExterior.lean)

The Lean module constructs the affine metric slices from a bounded symmetric form with smooth local coefficients. It checks the one-sided derivative estimate, positivity of the weighted square integral, and the signed costs of the certified path. The signed theorem takes the derivative identity and continuous-at-zero sign detector as inputs, together with the signature-zero and integrability certificates carried by each slice. Its germ-to-measure step uses compatible oriented frames on $K^c$. Smooth geometry allows the same pointwise oriented frames there because the metrics agree. The Bach identity and Yamabe continuity estimate in this note are analytic; the Lean result does not derive either from a formalized Bach tensor. [Signed path](../../../../SmoothPoincare/Variational/NonconformalDiskSaving.lean) · [Earlier two-sided Taylor test](../../../../SmoothPoincare/Variational/PositiveCoreVariation.lean)

## An actual finite example

An unequal positive-curvature product of two surfaces supplies a germ with $B_g\ne0$. For curvatures $k_1\ne k_2>0$, the Schouten tensor is parallel and the Weyl sectional coefficients on factor and mixed planes are $(k_1+k_2)/3$ and $-(k_1+k_2)/6$. Contracting the Weyl term in (1.1) gives the Bach eigenvalue $(k_1^2-k_2^2)/6$ on the first factor and its opposite on the second. Paste a sufficiently small normal ball of this metric into a round chart of standard $S^4$. The metric differences through second derivative are $O(r^2)$, $O(r)$ and $O(1)$ under the scaled cutoff. Curvature on the patch is bounded and its volume is $O(r^4)$. The gradient comparison and localized scalar error $O(r^2)\|u\|_4^2$ preserve positivity. The integrated chiral energy introduced tends to zero. Place the product patch in the unprotected interior of a fixed marked disk, separated from a second smaller protected disk and the outer trim. [Primary Bach convention, v1 (1.1), (2.5)–(2.8)](https://arxiv.org/html/2508.06633v1#S2) · [Normal-chart positivity and E42 finite comparison](../../reviews/ED03_CURVED_AND_GLOBAL_READBACK.md)

Replacing that interior with the original round ball gives an independently positive cap. It agrees on the full native trim and introduces zero chiral mass, so its energy equals the complete retained exterior charge. A small charged perturbation outside the disk may be shared by the source and cap. This makes both complete sides charged while the cap allowance stays zero. A disjoint warp inside the disk, away from the Bach test and trim, can raise the source to a prescribed $e\in(T,2T)$ by the E70 first-crossing argument. Positivity holds until that crossing because the path stays below the scalar-flat wall. These analytical examples have $I^+(S^4)=0$. They supply no late source or prescribed four-measure division on a hypothetical nonstandard type. [Checked disjoint warp and first crossing](../../../../../papers/master/01_fixed_type_variational_descent/reviews/E70_CORE_VARIATION.md)

For an actual positive endpoint on $M$, the signature identity and exact exterior matching give, in both signs,
\[
 0<\alpha t<E_s(g;B)-E_s(g_t;B)
 = E_s(g;K)-E_s(g_t;K)\le e-I^+(M).
\]
The gain is also bounded above by the accessible incoming charge on $K$. Every such clamped gain tends to zero on a minimizing tail. An exact minimizer has zero Bach tensor wherever this bump test is admissible. The selected physical widths and charge budgets supply no positive lower bound on the Bach slope. The equal-curvature product germ in the companion source is Bach flat and positively charged and can obstruct subwall clamped descent. [Companion core analysis](../../../../../papers/master/01_fixed_type_variational_descent/notes/E68_CORE_VARIATION.md) · [Independent comparison](../../../../../papers/master/01_fixed_type_variational_descent/reviews/E70_CORE_VARIATION.md)

## Protected cap obstruction with exterior changes

Let $h$ be any actual joined metric with $E_+(h)<2T$. Assume $Q\cap W=\varnothing$ and the two regions $Q$ and $B\cap W$ individually retain their original chiral charges. Let $c$ be an independently positive same-type cap satisfying $E_s(c)\le\lambda_h^s(V)+\delta_s$. In each chirality,
\[
 \delta_s>I^+(M)+\lambda_g^s(Q)+\lambda_g^s(B\cap W)-2T.
\]
In fact $I^+(M)\le E_s(c)$, and the strict joined ceiling with the complete seam gives $\lambda_h^s(V)=E_+(h)-\lambda_h^s(B)<2T-\lambda_g^s(Q)-\lambda_g^s(B\cap W)$. The proof permits arbitrary changes on $V$ and requires no dyadic exterior division. A late protected charge at least $2T-I^+(M)+a$ forces every late qualifying allowance to exceed $a$ in that sign. The eventual Lean theorem states the simultaneous two-sign form. If the protected charge is smaller, the lower bound can be nonpositive. [Protected cost theorem](../../../../SmoothPoincare/Variational/NonconformalDiskSaving.lean)

For the clamped path the complete exterior is fixed. An independently positive cap on any slice must also satisfy $\delta_s\ge I^+(M)-\lambda_g^s(V)=\lambda_g^s(B)-(e-I^+(M))$, independent of saving on $K$. The E42 dyadic exterior price remains a further estimate on measured divisions. The available sequence supplies neither a useful nonzero slope nor a uniformly affordable cap, and a sufficiently high protected charge has not been extracted throughout the nonstandard band. [Existing curved cap price](../../../../SmoothPoincare/Variational/CurvedCapPrice.lean) · [E42 assessment](../../../reviews/MARKED_GLUE_AND_CURVED_COST_20261125.md)


## Paying both costs from the actual joined saving

Suppose the independently positive cap $c$ satisfies the same exterior estimate with allowance $\delta_s$, and let $j_s\ge0$ be a separate measured additional joined cost. Impose the payment convention
\[
 \delta_s+j_s\le e-E_s(h).
\]
Then the actual remaining joined disk charge and the additional cost satisfy
\[
 \lambda_h^s(B)+j_s\le e-I^+(M).
\]
Indeed the cap floor and the exterior estimate give $I^+(M)\le E_s(h)-\lambda_h^s(B)+\delta_s$, and the payment inequality cancels the joined energy. The complete signed split includes the boundary seam. No exterior matching is needed. The payment implication also holds under the separate strict joined ceiling. The preceding strict allowance estimate is the inequality that uses that ceiling.

If $e_i\to I^+(M)$ and for every sufficiently late index the preserved original core has charge at least $\rho>0$ in either sign, the same argument tests that sign even when it varies with the index. Since $\lambda_{h_i}^s(B_i)\ge\lambda_{h_i}^s(Q_i)\ge\rho$, eventually the excess cannot finance this payment in both signs. This tests funding from the actual joined savings, with the given separate costs and preserved core. Other coupled repair mechanisms need not satisfy this payment convention. [Finite and eventual payment tests](../../../../SmoothPoincare/Variational/NonconformalDiskSaving.lean)

## Frozen sources

| Input | SHA-256 prefix |
| --- | --- |
| PositiveCoreVariation.lean | c3bfd70d18450513 |
| MatchedCurvedDisk.lean | bc0973419f64bf8c |
| CurvedCapPrice.lean | 674c5713f9e8085a |
| E42 marked glue and curved cost assessment | 402d5f42df4267fc |
| Companion core_variation.tex | 65c76bc676af0725 |
| Independent E70_CORE_VARIATION.md | b04e77aebfe5deeb |
| lean-toolchain | bc84812c94489d1e |
| lake-manifest.json | 839111aae86b6935 |

## Verification

Direct elaboration and the named Lake leaf build passed on Lean 4.35.0-rc3. The final build completed 9,827 jobs. The eleven public declarations were checked with `#print axioms` through the leaf import. Each used only `propext`, `Classical.choice` and `Quot.sound`. The checked Lean source SHA-256 is `5bc5f036f715e79905aa1fb6150e42596abc484ff5105d165016f017acfe60f3`.

## Applying payment to the supplied original charged disk

The master charged-disk extraction and the activated surgery budget give a fixed $\rho>0$, one chirality $s_*$, and at every sufficiently late index of the selected subsequence an original marked disk $D_i$ of charge at least $\rho$. The Lean comparison uses precisely that selected output and the actual inclusion $D_i\subset Q_i$. The fixed positive charge bounds the original charge of $Q_i$ by measure monotonicity. Exact retained germs with compatible frames preserve that charge on the joined metric; the finite payment test then excludes paying both costs from the joined saving at every sufficiently late index. The late index is chosen before the joined metric, cap and costs, and no agreement is imposed on the enlarged exterior. The comparison uses the supplied disk extraction and does not rederive its compactness or selection argument in Lean. [Master charged-disk theorem](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Activated charged disk budget](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/CHARGED_DISK_BUDGET.md) · [Lean composition](../../../../SmoothPoincare/Variational/ChargedCorePayment.lean)

A separate fixed-source comparison assumes that for every positive tolerance there is one actual independently positive same-type cap with both signed energies within that tolerance of the corresponding original exterior charges. The infimum bounds both limiting exterior charges below. Closed signature zero makes the two limiting exterior charges equal. The complete exterior identity therefore gives $\lambda_g^+(D)=\lambda_g^-(D)\le e-I^+(M)$ on the original disk, with the inclusive inequality at equality. The activated exact conformally round, umbilic face supplies the analytic cap construction via its original marking and the strict joined wall at each sufficiently small positive width. The Lean comparison consumes the cap drift output of such a construction. Its tolerance is taken at a fixed source before using any minimizing-sequence limit. [Lean fixed-source limit](../../../../SmoothPoincare/Variational/ChargedCorePayment.lean) · [Exact face and positive caps](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/CHARGED_DISK_BUDGET.md)

The integration leaf passed all 9,828 jobs on Lean 4.35.0-rc3. Both public axiom checks reported only `propext`, `Classical.choice` and `Quot.sound`. The checked leaf SHA-256 is `f65642abda570232c6ce7c636e78b047ba3967591419cb27fbaa8a11ae7838b9`. The supplying master and activated budget sources have SHA-256 prefixes `c9320f8f8b8c111d` and `aca743d7c46704ce`.
