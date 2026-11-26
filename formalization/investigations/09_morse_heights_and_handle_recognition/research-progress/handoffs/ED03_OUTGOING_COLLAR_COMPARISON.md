# E43-H · Outgoing collar comparison

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. This bounded E packet uses the E42 marked-glue working generation at repository HEAD `95a4f50eb9ec6e0e98454170279f45a66b000211`, Lean `4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` and Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. [E42 assessment](../../reviews/ED03_MARKED_GLUE_READBACK.md) · [Lean source](../../../../SmoothPoincare/Heights/OutgoingCollarComparison.lean)

| E42 input | SHA-256 |
| --- | --- |
| `RetainedInwardCollar.lean` | `2bb96e22f49c1904dddc50a7bd7756dec150e2019e78fd76b53e806e6c3376a7` |
| `RetainedOutgoingCollar.lean` | `54100be471bf1e84823920cbe327ea40f68d67bc57aba2cb9d4d3a5c9c56c31b` |
| `RetainedRoundedTrace.lean` | `5460fc23d8933a64edf0ba73864475705eda9b54f888343b266210272795e2f2` |
| `OriginalRoundedTrace.lean` | `d2071ac3b778374552e1bc349091be6c83121112a38e2dac2fc8b5b4f9c7e7df` |

## The full open overlap

Let $C_{\rm up}$ be the stored retained comparison from the rounded sublevel of $g$ at $f(p)$ to the actual sublevel of $f$ at $c=f(p)+\varepsilon$. Write $A(x,t)$ for the native signed rounded collar and $F(x,t)$ for the actual ambient extension with the normal sign reversed so that $t\le0$ is inward. The whole inward half of $F$ is $C_{\rm up}(A(x,t))$. Its inverse through $C_{\rm up}^{-1}$ recovers the point $A(x,t)$. The separately calibrated actual-height collar, based on the same rounded level through the complete boundary map $d$, is $P(x,t)=B(d x,t)$.

`RetainedRoundedTrace.exists_outgoingCollarComparison` constructs the smooth partial diffeomorphism $T=P^{-1}\circ F$ between the coordinate domains of the full open intersection of the ambient images. Compactness of the rounded level puts a single full strip of positive width in both domains. Both $T$ and $T^{-1}$ fix the whole zero section pointwise. On their respective domains they preserve each strict side of the cut and satisfy
$$
 P(Tq)=F(q),\qquad (Tq)_2=f(F(q))-c,\qquad
 F(T^{-1}q)=P(q),\qquad f(F(T^{-1}q))=c+q_2.
$$
For the sign on the previously unconstrained outward half, the calibrated collar supplies points above $c$ in every neighborhood of a zero point. If an outward slice had a point strictly below $c$, its negativity persists on an open set of base points at that parameter. The image of the open box over those bases contains a point above $c$ close to zero. The intermediate value theorem would then put a nonzero collar parameter on the level, contradicting injectivity and exhaustion of that level by the zero section. The sign conclusion gives coorientation for both signs of the transverse variable. [Retained inward comparison](../../../../SmoothPoincare/Heights/RetainedInwardCollar.lean) · [Calibrated collar](../../../../SmoothPoincare/Heights/RetainedOutgoingCollar.lean)

`outgoingCollarTransition_normalDerivative_pos` gives the identity on horizontal tangent vectors and the strictly positive real derivative of $t\mapsto(T(x,t))_2$ at $0$ for every base point $x$. The fixed zero section gives the horizontal identity. The positive-side equation bounds the limit of the right difference quotients below by zero. Injectivity of the full differential excludes zero, since a vertical vector with purely horizontal image would have the same image as a horizontal vector. The same argument applies to $T^{-1}$. For either common choice of product orientation this gives positive determinant at the zero section. The normal coefficient can vary with $x$.

## Corrected model coordinates and the next cut

`RetainedRoundedTrace.exists_outgoingCollarComparison_toNextCut` invokes the E42 calibrated three-collar construction using the unique critical point in the stated band. It supplies a corrected rounded parametrization $R=A\circ T^{-1}$ with domain exactly the target of $T$. With the actual comparison $Q$ and marking $l$ to the next cut, it gives
$$
  Q(F(T^{-1}q))=E(l(d q_1),q_2),\qquad
  Q^{-1}(E(l(d q_1),q_2))=F(T^{-1}q).
$$
The two physical heights are $c+q_2$ and $\mathrm{hi}+q_2$, and the original rounded height reads $g(R(q))=f(p)+(T^{-1}q)_2$. This holds on the full open coordinate domain. On its whole inward half the point $F(T^{-1}q)$ is the actual retained image of $R(q)$, and the retained inverse recovers $R(q)$. Evaluation on any labelled family of level and signed parameters applies to the entire tube, including its disk coordinates. The displayed maps give its inverse pointwise.

`outgoingCollarTransition_fixedOn_iff` characterizes which parameters of a protected tube survive this reparametrization pointwise. On any marked subset of the overlap that is also in the calibrated coordinate domain, $T$ fixes those parameters exactly when the two collars already assign the same ambient point to every parameter there. This is also the criterion for literal same-coordinate germ equality on a common strip.

## Exact original height and verification scope

The pinned regular-family flow proof obtains forward and backward constancy on the open small-height bands in `hFconst` and `hFconstBack`. Its public return `exists_relDiffeomorph_sublevel_of_regularFamily` retains sign, inverse and deep-set equations. The pinned rounded-sublevel packaging and the E42 retained constructor follow that interface. A freshly retained flow witness with public two-sided constancy would imply exact signed height in the original rounded coordinate. The checked coordinate change instead calibrates the physical height via a smooth model-side reparametrization and retains the exact original rounded height formula through $T^{-1}$. An independently prescribed normalized collar or marked ball still requires all open overlap and coverage equations, including protected tubes. [Pinned regular-family flow](../../../../.lake/packages/DifferentialGeometry/DifferentialGeometry/Topology/Morse/RegularLevel/Isotopy.lean) · [Pinned rounded-sublevel transport](../../../../.lake/packages/DifferentialGeometry/DifferentialGeometry/Topology/Morse/Attachment/SublevelTransport.lean)

The working HEAD advanced to `c8fb08dcf2e39ae68d4c9d9ebd6a69893ce9cce4` during this packet. The four E42 artifacts above identify the inputs by content across this change.

From `formalization/`, `lake build +SmoothPoincare.Heights.OutgoingCollarComparison` completed successfully without warnings. The build log SHA-256 is `8b9b6c7d60d62dbd3f495d9a525353b50efc1b883bf2c5a2b288b975b2acaa52`. A `lake env lean` replay through the leaf import elaborated `#check` and `#print axioms` for all four declarations. Each used only `propext`, `Classical.choice` and `Quot.sound`. The replay source SHA-256 is `1dec757f6b4be5a4141051d3a7d769a051d2c38bbdd3fe75ad3376031774dcd8`, and its log SHA-256 is `a9ccf709176fdfcf80e349520beaec8e592960814167a499b438272f50fc16f9`. The checked leaf SHA-256 is `aa2e0e303f7c55cc20fd5ec4e2e3b29d301281e9547e91a52f4f83d4045ce31c`.
