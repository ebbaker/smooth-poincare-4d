# SP4-TWA-E25 · Replay of interior action excess and strong convergence

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request records the author-selected GPT-6.2 Astra/ultra lead and GPT-6.2 Sol/ultra independent reader configuration. Actual backend model and reasoning effort were unavailable. HEAD matched `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`. All nine frozen input hashes matched at execution start. The frozen lead compactness note was `3ac1369e72dfb2ab9d48384868eeef440810eb3c4a490ca6568499e98b8efe59`. The lead integrated the scope correction below at `d5962c8a92eba8d378ab862f5d9d85678596742df4f6108a56fbc04d07623622`, which I checked. [Frozen request v1](../research-progress/handoffs/E25_REQUEST_v1.md) · [Lead proof](../notes/B08_INTERIOR_COMPACTNESS.md)

**PASS after scope clarification.** The action inequality and whole-sequence strong \(H^1\) convergence hold at every fixed interior slope. The same estimates are uniform on compact subintervals of the interior. The endpoint and a uniform assertion across the whole open interval remain outside this proof.

## Endpoint comparison on the common competitor class · PASS

Take the oriented flat Riemannian cylinder \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\), of volume 2, with periodic spin structure and a parallel unit positive half-spinor \(\sigma\). The chirality is the one on which real self-dual forms act. Use the Clifford convention \(X\cdot X=-|X|^2\), the Levi–Civita spin connection and the real part of the Hermitian pairing. Let \(P=\Pi\nabla\) for the orthogonal Clifford projection \(\Pi\), and \(Ah=\Pi(dt\otimes h)\), so \(A^*A=3I/4\). The competitors are smooth fields with exact traces \(e^{\pm b}\sigma\), allowing finitely many compatible transverse interior zeros, and the action is exactly \(S=J^4\).

For any such \(\psi\) let \(h=e^{-bt}\psi\), whose end traces both equal \(\sigma\). For every real \(\beta\), multiplying by \(e^{\beta t}\) preserves the location and transversality of each zero and multiplies its first jet by the positive value of the factor. The derivative of the scalar factor times \(h\) vanishes at that zero, so its Clifford-compatible jet is preserved. For each \(h\) the ratios \(X=Ah/|h|\) and \(Y=Ph/|h|\) can be assigned arbitrary values on the finite zero set. Away from the zeros \(|X|^2=3/4\). Near an admitted zero \(|h|\asymp r\) and \(Ph=O(r)\), so \(Y\in L^4\). This is a per-field justification. It permits zeros to move, vary in number, or have changing jets in a sequence.

For signed \(b\ne0\), the product rule yields

\[
 \frac{S(e^{bt}h)}{b^4}=\int_M|X+sY|^4,\qquad
 s=1/b,\qquad S(h)=\int_M|Y|^4,\qquad \int_M|X|^4=9/8.
\]

Set \(\theta=|b|/b_{\rm G}\) for \(0<|b|<b_{\rm G}\). The closed-interval theorem gives radial minimality at \(\beta=\operatorname{sgn}(b)b_{\rm G}\). Its comparison applies to \(e^{\beta t}h\) using the very same \(h\), since the trace normalization and admissibility above are independent of the slope. Because \(\theta s=1/\beta\), we get \(\int_M|X+\theta sY|^4\ge9/8\). This works for either sign without any hypothesis of uniqueness at the endpoint. [Closed global interval](../notes/B08_GLOBAL_TRANSITION.md)

## Fourth-power deficit and action coefficient · PASS

In a real inner-product space put \(m=(x+y)/2\), \(v=(x-y)/2\). Direct expansion gives

\[
 \frac{|x|^4+|y|^4}{2}-|m|^4
 =|v|^4+2|m|^2|v|^2+4(m,v)^2\ge\frac{|x-y|^4}{16}.
\]

The midpoint constant is sharp at \(x=-y\ne0\). When \(\theta\le1/2\), write \((1-\theta)x+\theta y=(1-2\theta)x+2\theta m\) and apply convexity to this combination. Its fourth-power Jensen deficit is at least \(2\theta\) times the midpoint deficit. Exchanging \(x,y\) treats \(\theta\ge1/2\), giving the lower bound \(\tfrac18\min(\theta,1-\theta)|x-y|^4\). Apply it in each real fiber with \(x=X\), \(y=X+sY\). Integration and the endpoint comparison give

\[
 (1-\theta)\frac98+\theta\frac{S(e^{bt}h)}{b^4}
             -\frac98
 \ \ge\ \frac{\min(\theta,1-\theta)}{8b^4}S(h).
\]

Thus for \(\Delta_b=S(\psi)-9b^4/8\),

\[
 \Delta_b\ge c(\theta)S(h),\qquad
 c(\theta)=\frac{\min(\theta,1-\theta)}{8\theta}.
\]

At \(b=0\), \(\psi=h\) and \(\Delta_0=S(h)\) exactly. The calculation uses the original \(J^4\) action and the volume-two normalization.

## Quotient-to-spinor absorption · PASS

With \(w=h-\sigma\) and \(x=\|\nabla w\|_2\), the flat Dirac identity on zero-trace fields and orthogonality of the Clifford projection give \(\|Ph\|_2=\|Pw\|_2=(\sqrt3/2)x\). Hölder can be applied to \(|Ph|=|Y||h|\) almost everywhere, including for fields whose zeros move. By the homogeneous E12 bound,

\[
 \frac{\sqrt3}{2}x\le a\|h\|_4\le a(2^{1/4}+24x),
 \qquad a=S(h)^{1/4}.
\]

If \(24a\le\sqrt3/4\) this gives \(x\le (4/\sqrt3)2^{1/4}a\). Since \(w\) has zero trace, \(\|w\|_2\le2x\) by time Poincaré. Multiplication by the fixed radial weight gives the precise physical estimate

\[
 \|\psi-e^{bt}\sigma\|_{H^1}
 \le e^{|b|}\sqrt{4+(1+2|b|)^2}\,x .
\]

The \(H^1\) norm here is the sum in quadrature of the ordinary \(L^2\) and covariant-gradient \(L^2\) norms on the fixed flat cylinder. At every fixed \(|b|<b_{\rm G}\), minimizing sequences have \(\Delta_b\to0\). The deficit estimate makes \(a\to0\), so absorption and the product estimate apply to the whole sequence. They require no uniform lower bound on \(|h|\), no uniform zero geometry, and no subsequence. [Flat Dirichlet identity](../notes/E08_LOCAL_DIRICHLET.md#conjugation-stationarity-and-coercivity) · [E12 product Sobolev bound](../notes/E12_CYLINDER_CONSTANT.md)

## Uniformity correction and earlier scopes

The frozen lead note excluded a uniform conclusion for varying slopes without qualification. The coefficient is exactly \(1/8\) when \(0<|b|\le b_{\rm G}/2\), and \(\Delta_0=S(h)\). More generally, for any \(0<\epsilon<1\) and \(|b|\le(1-\epsilon)b_{\rm G}\) one can use a uniform lower bound \(\epsilon/8\), including \(b=0\). The multiplication estimate is uniformly bounded because \(|b|\le b_{\rm G}\). Thus if \(b_n\) stays in a compact subinterval of the interior and \(\Delta_{b_n}(\psi_n)\to0\), then \(\|\psi_n-e^{b_nt}\sigma\|_{H^1}\to0\). The integrated lead text states this corrected quantifier. The estimate alone yields no uniform conclusion spanning the entire open interval, because \(c(\theta)\to0\) as \(\theta\uparrow1\), and the endpoint convergence question remains open.

E08 is a local \(H^5\) theorem for critical fields with independently varying nearby traces at the fixed reference slope \(1/200\). The existing \(H^5\)-unbounded minimizing sequence at that slope is consistent with strong \(H^1\) convergence. The earlier small-trace conclusion is an \(O(d^2)\) estimate in the weaker \(H^1\) norm as the normalized log difference \(d\to0\), for competitors at or below the radial trial. The interior comparison concerns action excess tending to zero and gives convergence in the original spinor variable. [Local critical-field theorem](../notes/E08_LOCAL_DIRICHLET.md) · [Earlier sequence example](../notes/B07_MINIMIZING_SEQUENCES.md) · [Small-trace estimate](../notes/SMALL_TRACE_ASYMPTOTIC.md)

The frozen inputs were inspected. I rechecked Talenti's published theorem (1)–(2), p. 353, on 28 November 2026. In dimension four with exponent two its scalar Euclidean constant is \(6^{1/4}/(2\sqrt{2\pi})<1\). E12's scalar norm cutoff on the 27-cell periodic extension gives \(\sqrt{27}(1+2\sqrt3)<24\) with zero end traces, and E13 previously replayed that step. The convexity and absorption above are direct. [Talenti, published scan](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1) · [E13 replay](E13_GLOBAL_MINIMUM_REPLAY.md)
