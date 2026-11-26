# Fixed-type attainment after positive subcritical entry

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Selected lead GPT-6.2 Astra/ultra with four bounded GPT-6.2 Sol/ultra derivations and two independent GPT-6.2 Sol/ultra readings. Exact serving telemetry unavailable. This is a research manuscript result, conditional on positive subcritical entry and the cited analytical and marked-neck theorems. The checks are model readings. Human specialist verification and formal proof verification remain outstanding.

## Result

Let \(M\) be one fixed closed, connected, oriented smooth homotopy four-sphere with a smooth Riemannian class satisfying \(Y>0\) and \(e=E_+=E_-<8\pi^2\), in curvature-operator Hilbert–Schmidt normalization. Then a smooth positive Bach-flat class on \(M\) has \(e=I^+(M)\). The standard type has the round minimizer. On a nonstandard type this proves \(I^+(M)=a_M\) and gives the nonnegative Weyl second variation of a true minimum. Combining attainment with the master's existing exact-class finiteness theorem gives finitely many oriented nonstandard smooth types with \(I^+(M)\le8\pi^2-\delta\) for each \(\delta>0\), including equality in that fixed band. [Attainment manuscript](../manuscript/fixed_type_attainment.tex) · [Master corollary](../../../master/manuscript/exact_closed_types.tex)

## What the original flow controls

Start with a unit-volume positive Yamabe metric with \(\epsilon=e_0-I\le\alpha^2\). Write \(Y_0=Y([g_0])\) and \(Y_{\rm rd}=8\sqrt6\pi\). Strict pinching eventually holds with a uniform margin \(m=16\pi^2-2e_0-\alpha Y_0^2/24>0\). Along each original flow the Yamabe sign stays positive and the type stays fixed, so \(e(t)\ge I\). Monotonicity of \(2(1-\alpha)e+\alpha D/2\) and Gauss–Bonnet on the initial representative give the sharper form
\[
 D(g(t))\le 4I+\frac{4\epsilon}{\alpha}
       -\frac{Y_{\rm rd}^2-Y_0^2}{12}
 \le4I+4\alpha<32\pi^2 .
\]
All smooth times of every sufficiently late original flow satisfy this strict bound. Here \(D\) integrates the squared norm of the full trace-free Ricci tensor in the physical metric. The alternative form of the functional gives \(S(t)=\int R^2\le Y_0^2+48\alpha\), and \(I\le e(t)\le e_0/(1-\alpha)\). The upper and lower bounds on \(e(t)\) meet as \(\alpha\downarrow0\). [Original-flow calculation](../01_regularized_flow_and_energy/notes/ORIGINAL_FLOW_20261126.md)

Bour v1 supplies the fixed-parameter alternatives in the **strict** regime used here. His reverse DeTurck pullback holds the reference metric fixed at a step where it also transforms. Bahuaud–Helliwell's Theorem A covers the actual equation and supplies uniqueness and existence. The differentiated energy sum in Bour §6 requires the power \(2j+2\). The corrected inequality gives the needed bounded-slab smoothing at fixed \(\alpha>0\). The printed integrated dissipation identity needs \(1/2\). First hitting times and comparison from the terminal slice give the limiting stationary equation at the curvature maximum itself. The source audit records the supporting interpolation and positivity arguments. [Strict Bour audit](../01_regularized_flow_and_energy/notes/BOUR_AUDIT_20261126.md) · [Primary-source receipt](../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md)

## Coverage of the alternatives

| Stage and output | Argument on the supplying metric | Conclusion on the entered type |
| --- | --- | --- |
| Fixed \(\alpha_j>0\), bounded curvature | Finite dissipation selects critical times. The compact comparison is onto. The trace of the regularized gradient gives constant scalar curvature. | A positive, volume-one regularized critical metric on \(M\) with the physical budgets. |
| Fixed \(\alpha_j>0\), unbounded curvature | On the scalar-flat Bach-flat rescaling, smooth pointed comparison embeds a neighborhood of one whole truncation with all disjoint end buffers. The physical bounds pass separately to both chiralities and to \(D\). | Smooth one-point compactification on \(M\), with \(I\le e_X\le e_{j,0}/(1-\alpha_j)\). Choose its positive unit-volume Yamabe representative for the parameter sequence. |
| \(\alpha_j\to0\), bounded critical curvature | On the closed regularized or exact representative, the physical constant scalar and Sobolev bound control small balls. In harmonic coordinates the stationary trace-free Ricci equation has principal part \(\nabla^*\nabla/2\) and bounded coefficients. | Smooth convergence on the whole closed manifold gives \(Y>0,\ B=0,\ e=I\). |
| \(\alpha_j\to0\), unbounded critical curvature | At curvature maximum rescale by \(Q_j=\max|\mathrm{Rm}|\). The constant scalar becomes \(R_j/Q_j\to0\), curvature is one at the base point, and every compact test and both chiral budgets pass to the limit. Apply the whole-core comparison a second time. | The oriented smooth pullback supplies \(I\le e_X\), and exhaustion supplies \(e_X\le\liminf e_j=I\). The ordered exterior loss vanishes in each chirality. |

The marked argument first obtains finite ends using decay, finite negative-Ricci energy and a homogeneous Sobolev bound. Finite topology permits the differentiated ALE result and the obstruction-flat order upgrade. Small product splices on the closed source keep \(E_+<9\pi^2\) and hence force trivial link groups. With \(k\) Euclidean ends, the embedded core has \(\chi=2-k\). Gauss–Bonnet gives \(D_X=2(E_++E_-)+32\pi^2(k-1)\), so \(k=1\). The normal chart after smooth removal supplies the collar used for the actual identification. The positive cap of the exterior has energy strictly below \(4\pi^2\). An extension of the prescribed parametrized cap in the double agrees with the inverse core map on the seam. The inverse restrictions glue in the other direction. [Marked derivation](../02_marked_limits_and_attainment/notes/MARKED_CORE_20261126.md) · [Gauge decision](../02_marked_limits_and_attainment/brainstorm/notes/PHYSICAL_AND_STATIONARY_GAUGES_20261126.md) · [Uniform elliptic estimates](../02_marked_limits_and_attainment/notes/CSC_ESTIMATES_20261126.md)

There is a further restriction at a bubble of an **original** flow. Once \(M\) is identified, \(4I\le4e_X=D_X\). The sharper physical bound then gives
\[
  4(e_X-I)+(Y_{\rm rd}^2-Y_0^2)/12\le4\epsilon/\alpha .
\]
Along any bubbling subsequence of original flows the *initial* Yamabe constants consequently approach the round value. This is a necessary test for that alternative. The attainment proof treats it directly and requires zero restarts. [Independent scalar-deficit check](../research-progress/handoffs/READING_ADDENDUM_20261126.md)

## Review and reproducibility

The [analytical reader](READING_FLOW_AND_LIMIT_20261126.md) checked the strict Bour proof repairs, all-times budgets, fixed-time markings, and stationary bootstrap through both final outcomes. The [marked reader](READING_MARKED_ATTAINMENT_20261126.md) reconstructed the ALE theorem chain, the link aperture, Gauss–Bonnet, the harmonic factor, the cap sign and the smooth disk-neighborhood extension. Both reviewed exact attainment and the master corollary. The revised proof makes the exterior Dirichlet boundary values, Bach-flatness across the point and ordered exterior energy loss explicit.

Input checkout 4da586548b445ccfe9145c6a5671c0f7ecd433f3. Recomputed Git blobs agree with the setup receipts for F2 (b27951843bab22833f9d00806cbbf9005508cea7), the principal marked-neck source (dcfcc42d8e04064930f2b90a25d8d70818b34630) and its closed-alternatives input (2cef7df161172e5ee92754054b98360ece8c20f3). Primary versions include Bour 1012.0342v1, Tian–Viaclovsky math/0310302v3 and CMH 83 (2008), and Ache–Viaclovsky 1106.1249v2. The primary source receipt records the additional uniqueness and harmonic-coordinate imports. [Frozen requests](../research-progress/handoffs/ACTIVATION_20261126.md) · [Independent reading instructions](../research-progress/handoffs/READINGS_20261126.md)

| Scientific artifact | SHA-256 prefix |
| --- | --- |
| Fixed-parameter source audit | 34138752da571bad |
| Original-flow energy proof | 51f5a14278dcd7ca |
| Marked-core proof | f3899cded68baa98 |
| Uniform stationary estimates | db5e120ef9dbbb0b |
| Manuscript as first issued to readers | 60b0b09152cff7dc |
| Revised manuscript read by both readers | 67fa6a8da4b6bb8a |
| Manuscript with final exponent, citation and upper-limit wording | 719bbea527c6db64 |
| Master corollary source | c0a711c557f41c0d |

## Remaining geometry

The first missing premise on a general homotopy sphere is positive subcritical entry. On an entered nonstandard type the remaining question is rigidity of the attained global minimum. A negative Weyl Hessian direction or a finite positive-class competitor of lower energy on that type would contradict minimality. The scoped attainment argument establishes existence of a minimizing class. It does not establish a general theorem for every choice of regularization or convergence of every original minimizing sequence. [Next research handoff](../continuation-notes/AFTER_ATTAINMENT_20261126.md)
