# E241 — Conditional actual-flow realization of growing local ratio maxima

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E derivation under B111, configured gpt-6.2-sol / ultra. Independent runtime and selected lead settings are unavailable. I authored E29 and the E52 audit of the small-value stability transfer, as well as the E217 audit of the separate \(9/4\) local example. This packet uses the accepted E49–E52 result and E235/E236 germ. It applies those inputs and does not provide another independent audit of my earlier work. [Request][request] · [B111 decision][b111]

## Conditional statement

Fix the standard oriented round \(S^4\), its round-compatible perfect chiral \(SO(3)\) connection \(A_{\rm rd}\) on the fixed round bundle \(P\), its curvature \(F_{\rm rd}\), and the point \(p\) and matched chart and gauge of B111. Use fixed reference norms and native time and internal pairing for evolution. Assume exactly \(H_{\rm cutoff}\):

For every sufficiently small \(\epsilon>0\) there is a smooth positive round-compatible connection \(A_\epsilon\) on \(P\) agreeing near \(p\) with the E235 germ at \(r=1+\epsilon\), and
\[
 d_\epsilon=\|A_\epsilon-A_{\rm rd}\|_{C^0}
          +\|F_{A_\epsilon}-F_{\rm rd}\|_{C^0}\longrightarrow0
             \qquad(\epsilon\downarrow0).
\]
The reference norms are fixed and the curvature in this premise is actual curvature. This is a conditional application of the premise, independently of the cutoff construction and its assessment.

For every sufficiently small such \(\epsilon\), \(A_\epsilon\) starts a global smooth positive round-compatible original native flow \(A_\epsilon(t)\), smooth up to \(t=0\). After a common positive smoothing time, the assessed exponential Sobolev convergence holds modulo time-dependent smooth bundle automorphisms. For each of these data there is a smooth curve \(p_\epsilon(t)\) of strict spatial local maxima of \(\rho(Q(A_\epsilon(t)))\) through \(p\), defined on a datum-dependent short native interval. On the curve the log ratio has initial derivative \(1/2\) and the ratio is strictly greater than \(1+\epsilon\) at every sufficiently small positive time. [Local germ and derivative][a235] · [Assessed round basin][a49]

## Application of the small-value basin and regularity at zero

Fix one integer \(m\ge6\) for the assessed E49–E52 theorem, for instance \(m=6\). The standard round bundle and \(A_{\rm rd}\) are the fixed reference of that theorem. Replacing the fixed old chart norms by the fixed native reference norms, where necessary, changes the value smallness by fixed equivalence constants. Each \(A_\epsilon\) is already smooth and definite in the right sign component. Its pair \((A_\epsilon,F_{A_\epsilon})\) is compatible. The only initial size condition is the strict smallness of \(d_\epsilon\) in those two fixed sup norms, so \(H_{\rm cutoff}\) puts the data inside the basin for all sufficiently small \(\epsilon\). There is no assumption on the size of the higher initial derivatives or their bounds as \(\epsilon\) varies.

By the assessed small continuous-data adjusted theorem used in E50, the compatible adjusted pair \((\widehat A_\epsilon,\widehat F_\epsilon)\) has a common positive interval with endpoint \(T>0\), continuous pair trace at zero, and smoothness on \(0<t<T\). The stationary zero datum of this fixed-reference problem is \((A_{\rm rd},F_{\rm rd})\). At that datum \(Q=I\), so the physical velocity vanishes by self-duality and Bianchi, and the fixed-reference adjustments vanish. Positive-time derivative continuity at this datum gives, at the single fixed \(\tau=T/2\),
\[
 \|\widehat A_\epsilon(\tau)-A_{\rm rd}\|_{H^m}\longrightarrow0
                  \qquad(\epsilon\downarrow0).
\]
This follows from spatial \(C^m\) convergence at \(\tau\) on the fixed compact base and implies the strict \(H^m\) entry condition for E49's stable adjusted equation. This is the common adjusted smoothing time. It does not depend on the higher norms of the initial data. [E41–E44 adjusted theorem][a42] · [E50, fixed smoothing time][e50]

For actual smoothness at \(t=0\), fix a single \(\epsilon\). On the curvature graph the fixed-reference adjusted connection equation has principal coefficients determined by the values \((x,A,F_A)\). They are in its open strongly parabolic region at this datum. The initial jet image of this one smooth connection is compact. The E29 smooth compact-bundle construction may use a jet cutoff around that image and gives an adjusted path with the same round reference on an individual short interval. Its lifted pair \((A,F_A)\) solves the coupled system and is smooth through zero, in particular continuous in spatial \(C^1\) at zero. For its pair difference \(U\) from the round reference on a shortened interval \([0,\ell]\), the control used in E50 is
\[
 \|U\|_{X_\ell}\le
 \sup_{[0,\ell]}\|U(t)\|_\infty+
 C\sqrt{\ell}\,\sup_{[0,\ell]}\|D U(t)\|_\infty .
\]
The first term approaches the initial value bound and the second tends to zero for this smooth datum. Hence for sufficiently small \(\ell=\ell_\epsilon>0\), the smooth lift and the restricted rough-adjusted solution lie in the same completed uniqueness ball. They agree there. It follows that \(\widehat A_\epsilon\) is smooth up to zero with its given smooth datum, and is smooth later by positive-time regularity. The interval \(\ell_\epsilon\) may depend on the individual jet and higher norms and need not reach \(\tau\). The comparison identifies the initial portion of the common adjusted path, so it does not limit the separate fixed smoothing step at \(\tau\). [E28–E29 smooth local assessment][a29] · [E50, individual comparison][e50] · [E52 audit][e52]

## Original recovery and the precise round estimate

Use E50's multiplication \(gh=g\circ h\) and left action \(g\cdot A=(g^{-1})^*A\). For either of the smooth adjusted paths, write its equation as \(A_{{\rm adj},t}=v(A_{\rm adj})-R(\xi,A_{\rm adj})\), where \(v\) is the original native velocity, \(\xi\) is the evaluated smooth invariant gauge generator and \(R\) is the infinitesimal left action. Integrate \(\dot j=-\xi\circ j,\ j(0)=\operatorname{id}\) on \(P\) and put \(g=j^{-1}\). Compactness of the bundle and smoothness on each relevant compact time interval give smooth equivariant automorphisms covering an orientation-preserving isotopy. Smoothness of the adjusted head through \(t=0\) gives smoothness of this ordinary recovery through \(t=0\) for the individual datum. The right velocity of \(g\) is \(\operatorname{Ad}_g\xi\). Equivariance cancels \(R(\operatorname{Ad}_g\xi,g\cdot A_{\rm adj})\) against the transform of \(-R(\xi,A_{\rm adj})\), leaving \(\partial_t(g\cdot A_{\rm adj})=v(g\cdot A_{\rm adj})\). The recovery starts at the identity. In particular the actual recovered path has \(A(0)=A_\epsilon\) and \(\partial_t A(0)=v(A_\epsilon)\), in the fixed original base and bundle identification.

For this datum write \(g_{\rm loc}\) for the smooth head recovery and \(c=g_{\rm loc}(\tau)\). E49 supplies the smooth stable adjusted path \(B(u)\) with \(B(0)=B_0=\widehat A_\epsilon(\tau)\), and \(g_{\rm st}(u)\) denotes its recovery from the identity. The original head is \(g_{\rm loc}(t)\cdot\widehat A_\epsilon(t)\), defined a little past \(\tau\) within \(0<t<T\). The original tail is
\[
 A_\epsilon(t)=\big(c\,g_{\rm st}(t-\tau)\big)\cdot B(t-\tau),
                          \qquad t\ge\tau.
\]
The fixed automorphism \(c\) acts on the left and preserves the original equation by naturality. The two smooth original paths have the same datum \(c\cdot B_0\) at \(\tau\). Recentered E28–E29 smooth uniqueness identifies them on a right overlap. Thus the splice is genuinely smooth, the original solution exists globally, and it stays in the positive sign class by adjusted definiteness and orientation-preserving recovery. The convergence follows from the exact ordered inverse
\[
 h(t)=g_{\rm st}(t-\tau)^{-1}c^{-1},\qquad
 h(t)\cdot A_\epsilon(t)=B(t-\tau).
\]
In the E50 fixed reference \(H^m\) norm,
\[
 \|h(t)\cdot A_\epsilon(t)-A_{\rm rd}\|_{H^m}
 \le C_m e^{-\alpha(t-\tau)}
       \|\widehat A_\epsilon(\tau)-A_{\rm rd}\|_{H^m},\qquad t\ge\tau ,
\]
where \(\alpha=\lambda_1(G_0)/2>0\) is available from E49's fixed round stability choice. Here \(G_0\) is the assessed fixed-round linear operator in the stable gauge. This compares at each time by a smooth bundle automorphism. E49–E52 supplies no limit for \(h(t)\) in this application, and no fixed pullback convergence is used. [E49 stability and rate][e49] · [E50, recovery and splice][e50] · [Lead assessment][a49]

## Persistence and growth of the local maximum

Fix one of the sufficiently small data and use native \(t\) and the fixed chart \(x\) at \(p\), writing \(x(p)=0\) and \(r=1+\epsilon>1\). On a sufficiently small spacetime neighborhood of \((0,0)\) in the half-space \(t\ge0\), put
\[
 f(x,t)=\log\rho\bigl(Q(A_\epsilon(t))(x)\bigr).
\]
At \((0,0)\) the quotient has the positive simple spectrum of the E235 germ. For this fixed \(\epsilon\), openness and smooth initial recovery give a neighborhood with positive simple spectrum. In that neighborhood \(f\) is smooth up to the initial time by smooth dependence of the simple ordered eigenvalues. Agreement of connections on an open neighborhood of \(p\) retains the entire E235 germ, including the spatial Hessian and the native instantaneous derivative. The velocity and the derivative of the curvature quotient along it are local differential expressions in the connection, so agreement of the germ suffices. Smoothness of the actual recovered solution and its original tangent at zero give
\[
 f(0,0)=\log r,\qquad \partial_x f(0,0)=0,\qquad
 D_x^2 f(0,0)=-|G_r|^2 I_4,\qquad \partial_t f(0,0)=\tfrac12 .
\]
The Hessian here is the coordinate matrix in the old Euclidean-normalized chart. Its negativity is independent of the old/native metric scale. \(G_r\) is the E235 trace-free Frobenius gradient and is nonzero for each fixed \(r>1\). The time derivative uses native time, including the E235 factor \(1/2\) from the old \(K=1\) directional derivative \(1\). [E235 germ and clock factors][e235] · [Lead local assessment][a235]

Set \(\Phi(x,t)=\partial_x f(x,t)\) for \(t\ge0\). To apply the ordinary finite-dimensional implicit-function theorem at the time boundary, extend this coordinate function by \(\widetilde\Phi(x,t)=2\Phi(x,0)-\Phi(x,-t)\) for \(t<0\), and keep \(\widetilde\Phi=\Phi\) for \(t\ge0\). Its value and its spatial and temporal first derivatives match across zero, so this extension is \(C^1\) locally. It extends only the function used in the implicit equation. Since \(D_x\widetilde\Phi(0,0)=D_x^2 f(0,0)\) is invertible, there is a unique nearby coordinate branch \(y(t)\) with \(y(0)=0,\ \Phi(y(t),t)=0\) for all sufficiently small \(t\ge0\). It is smooth in the positive interior. Differentiating the implicit relation gives
\[
 y'(t)=-[D_x\Phi(y(t),t)]^{-1}\partial_t\Phi(y(t),t).
\]
The matrix stays invertible on the short branch. The right-hand side is smooth as a function of \((x,t)\) up to \(t=0\) on the original half-neighborhood. Starting from the \(C^1\) implicit branch, this relation and the chain rule give successive continuous right derivatives of all orders at zero. Thus the corresponding point \(p_\epsilon(t)\) is a smooth curve up to the initial time. Continuity of the Hessian makes \(D_x^2 f(y(t),t)\) negative definite on a short interval. Each branch point is consequently a strict spatial local maximum of \(f\), and of \(\rho=e^f\).

Write \(u(t)=f(y(t),t)\). The spatial term in the chain rule vanishes along the branch, giving \(u'(0)=\partial_t f(0,0)=1/2\). Its continuity allows the interval to be shortened for this datum so \(u'(t)\ge1/4\). Then for every sufficiently small positive \(t\) in that interval,
\[
 \rho(Q(A_\epsilon(t)))(p_\epsilon(t))=e^{u(t)}
      \ge r e^{t/4}>r.
\]
In particular the native derivative of the ratio value on the branch at zero is \(r/2\). This concerns the continuing strict local maximum of the actual solution in its original identification.

## Scope and source dependencies

The only pending premise in this derivation is \(H_{\rm cutoff}\) as stated above. It is kept conditional in this record while the cutoff derivation and audit are separate. The proof neither constructs nor alters the cutoff. The assumptions control small fixed-reference pair values and agreement of a local germ. They do not place a global ratio cap at \(r\), identify \(p\) as a global initial maximum, or force failure of a globally pinched set under evolution. The individual smooth comparison interval, the simplicity neighborhood, and the local-maximum growth interval may all depend on the datum. The conclusion concerns the standard sphere and round bundle and gives no uniform crossing time, singularity claim, or initialization on an unknown smooth homotopy sphere.

The original gradient and action conventions inherit the inspected Fine arXiv:1111.5005v2 of 29 November 2011. The relevant recorded passages are Proposition 4.2/(4.1), p. 30 for the native gradient, and Lemmas 3.2 and 4.4 with (3.4) and (4.3)–(4.4), pp. 19 and 31, for the action and recovery. The smooth comparison uses the assessed E29 compact-bundle argument based on the undated author-hosted Taylor revision, §7.3, printed pp. 147 and 149, with Propositions 7.3.A–B. The fixed-gauge stability and small-value transfer are the branch's accepted E49–E52 construction. No fresh external inspection, new source version, or expanded external theorem is claimed. The implicit argument is finite-dimensional and displayed above. [Canonical source record][sources] · [E49–E52 assessment][a49]

## Verified identities

All six frozen inputs matched. The additional inherited E49, E52 and E41–E44 records below were checked for their role and identities. Only the assigned note and return were written.

| Input | SHA-256 |
| --- | --- |
| [E241 request][request] | a729543cf6b8554c96177b9662997bbe0c06c697f57856ebfe62d520bac535dd |
| [B111 lead decision][b111] | 15db8371803239f8e98f739b43100ca743909bce983fa3c922291268d3e094ca |
| [E235/E236 assessment][a235] | c8f229dbc5421449ccc1e548af0502d5524a8bf771d7e9544efed5ce846a7c50 |
| [E235 local construction][e235] | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
| [E49–E52 stability assessment][a49] | f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee |
| [E50 small-value transfer][e50] | ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf |
| [E28–E29 smooth local assessment][a29] | c2d34ccb51417c0f7a99d932c8fa932ec8434630428a6ab5a0c720eaa666e3cf |
| [E49 inherited rate][e49] | 45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16 |
| [E52 inherited transfer audit][e52] | a5b19a37220c701154725ab7e2ca280a37a829aac06ae8b7a16203cdf9317a61 |
| [E41–E44 inherited adjusted assessment][a42] | cd4081efe286ebe299a911b4a79c3fe9904ec84601c9a1e6ddc0209c1fb6eb75 |

[request]: ../research-progress/handoffs/SP4-CME-E241_REQUEST_v1.md
[b111]: ../brainstorm/notes/B111_CLOSED_REALIZATION_OF_LOCAL_RATIO_GERMS_20261123.md
[a235]: ../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md
[e235]: 235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md
[a49]: ../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[a29]: ../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md
[e49]: 49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e52]: ../reviews/E52_STABILITY_TRANSFER_AUDIT_20261122.md
[a42]: ../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#taylor-composition-and-commutator-input-for-stability
