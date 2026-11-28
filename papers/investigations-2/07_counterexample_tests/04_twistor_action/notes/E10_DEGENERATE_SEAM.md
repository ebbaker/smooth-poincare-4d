# SP4-TWA-E10 · All-order matching at the flat zero-defect seam

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request records GPT-6.2 Astra/ultra as the selected lead and GPT-6.2 Sol/ultra as the helper configuration. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all nine frozen SHA-256 digests matched at execution start. Later presentations of E01 and E04 preserve the variational identity and matching hypotheses used here. [Frozen request v1](../research-progress/handoffs/E10_REQUEST_v1.md) · [B06 strategy](../brainstorm/notes/B06_ZERO_DEFECT_TRANSMISSION.md)

## Flat collar and common twistor jet

Use the oriented Riemannian product \(M=[-1,1]\times Y\), \(Y=\mathbb R^3/\mathbb Z^3\), with periodic spin structure and its common parallel spin identification across \(t=0\). The fields are smooth commuting positive half-spinors, with positive chirality the one acted on by real self-dual two-forms. They are the supplied E04 stationary fields on the two closed pieces, with the same nowhere-zero seam trace \(s\) and cancelling outward momentum densities. The prescribed transverse compatible zeros, if present, lie strictly away from the seam. By compactness and smoothness there is a zero-free collar of the seam on both sides. E04 gives equality of the first jets on \(Y\) and equality of all one-sided jets on the closure of the open nonzero-defect seam set. Write \(q=P\psi\) for the common defect on the seam. [E04 transmission hypotheses and first jets](E04_GLUING.md#first-jets-and-regularity-across-the-seam)

Let \(U\) be a connected coordinate patch in \(\operatorname{int}_Y\{q=0\}\), using lifted Euclidean coordinates \(x^1,x^2,x^3\) on the torus. In the common parallel orthonormal frame put \(e_0=\partial_t\), \(e_i=\partial_{x^i}\) for \(1\leq i\leq3\), use the Clifford relation \(e_i\cdot e_j+e_j\cdot e_i=-2\delta_{ij}\), and let \(D=\sum_{i=0}^3 e_i\cdot\partial_i\). The convention \(P_X\psi=\nabla_X\psi+\tfrac14 X\cdot D\psi\) makes the common first jet on \(U\) satisfy

\[
 \partial_i s=e_i\cdot a(x)\quad (1\le i\le3),\qquad
 \partial_t\psi_\pm(0,x)=e_0\cdot a(x),\qquad a(x)=-D\psi_\pm(0,x)/4 .
\]

The field \(a\) has negative chirality. Let \(b_i=\partial_i a\) in the parallel trivialization. Tangential mixed derivatives of \(s\) commute, giving \(e_i\cdot b_j=e_j\cdot b_i\). For \(i\ne j\), left multiplication by \(-e_i\) and the Clifford relation give \(b_j=e_j\cdot e_i\cdot b_i\). In three tangential directions this implies

\[
 b_3=e_3\cdot e_1\cdot b_1,\qquad
 b_3=e_3\cdot e_2\cdot b_2
     =e_3\cdot e_2\cdot e_2\cdot e_1\cdot b_1=-e_3\cdot e_1\cdot b_1 .
\]

Each unit Clifford factor is invertible, so \(b_1=0\), then \(b_2=b_3=0\). Thus \(a=a_0\) is constant in this trivialization on \(U\). For \(x_*\in U\), the local affine spinor

\[
 T(t,x)=s(x_*)+
    \left(te_0+\sum_{i=1}^3 (x^i-x_*^i)e_i\right)\cdot a_0
\]

has \(DT=-4a_0\), hence \(PT=0\). Its seam trace is \(s\) by equality of tangential gradients and the value at \(x_*\). Its normal derivative is \(e_0\cdot a_0\), so it matches both Cauchy jets. The flat spin trivialization on this coordinate patch suffices for the comparison.

## Leading Euler coefficient on either side

Use the real part of the Hermitian pairing throughout. For the Clifford trace \(c\), let \(\Pi=I-\tfrac14c^*c\) be the orthogonal projection onto \(\ker c\), with \(cc^*=4I\). For \(0\le i\le3\) put \(A_i z=\Pi(dx^i\otimes z)\), \(x^0=t\), and \(A=A_0\). In this frame \(P=\sum_i A_i\partial_i\). The normal symbol satisfies

\[
 |Az|^2=|z|^2-\tfrac14|e_0\cdot z|^2=\tfrac34|z|^2,
 \qquad A^*A=\tfrac34 I .
\]

For either one-sided field let \(w=\psi-T\). The jet comparison begins with \(w|_U=\partial_t w|_U=0\). Assume for \(m\ge2\) that all normal derivatives of \(w\) through order \(m-1\) vanish as functions on \(U\). One-sided Taylor expansion in the same signed coordinate \(t\) gives

\[
 w(t,x)=t^m\big(h(x)+tR(t,x)\big),\qquad
 h(x)=\frac{\partial_t^m w(0,x)}{m!},\qquad
 R(t,x)=\frac1{m!}\int_0^1(1-\theta)^m
                         \partial_t^{m+1}w(\theta t,x)\,d\theta .
\]

The expression for \(R\) is smooth up to the one-sided boundary. On a compact subpatch \(K\subset U\), all its fixed-order derivatives are bounded for sufficiently small one-sided \(|t|\). The same formula therefore controls the differentiated tangential Taylor expansion on \(K\). In particular the tangential derivatives of \(w\) start at order \(t^m\), whereas \(\partial_t w=t^{m-1}(mh+tR_0)\) with smooth \(R_0\). With \(q=P\psi=Pw\) off the seam and \(W=|\psi|^{-4}|q|^2q\) this yields

\[
 \begin{aligned}
 q&=t^{m-1}(mAh+tQ),\\
 W&=t^{3m-3}\big(|s|^{-4}m^3 |Ah|^2Ah+tH\big).
 \end{aligned}
\]

Here \(Q,H\) are smooth up to the one-sided seam. The factor \(t^{3m-3}\) is valid on the minus side as well, because \(|q|^2\) supplies the even factor \(t^{2m-2}\). Smoothness and uniform boundedness for differentiated remainders on \(K\) follow from the factorizations and the positive collar lower bound for \(|\psi|\).

For the action \(S=J_g^4\) the normalized bulk first-variation coefficient is

\[
 4\big(P^*W-|\psi|^{-6}|q|^4\psi\big)
   =-4\sum_{i=0}^3 A_i^*\partial_i W-4|\psi|^{-6}|q|^4\psi
\]

in the flat parallel frame. It vanishes on each open piece of the zero-free collar by stationary interior testing. The normal divergence term has a possible leading order \(t^{3m-4}\). Each tangential divergence term is \(O(|t|^{3m-3})\) and the denominator force is \(O(|t|^{4m-4})\). After factoring the leading signed power, the equation on either open side reads

\[
 0=t^{3m-4}
 \left(-4(3m-3)|s|^{-4}m^3 |Ah|^2A^*Ah + tE(t,x)\right)
\]

with \(E\) smooth up to that side. This follows by differentiating the smooth factorization of \(W\); the denominator force factors at least \(t^m\) after division by \(t^{3m-4}\). Using \(A^*A=\tfrac34 I\), the constant term in parentheses is

\[
 -\frac94(3m-3)m^3 |s|^{-4}|h|^2 h.
\]

Equivalently, the coefficient after dividing the bulk equation by four is \(-\tfrac9{16}(3m-3)m^3 |s|^{-4}|h|^2h\). Divide by \(t^{3m-4}\) for \(t\ne0\) and take the one-sided limit. Since \(m\ge2\) and \(|s|>0\), it follows that \(h=0\) on the subpatch, and hence on \(U\) by localization. This proves vanishing of \(\partial_t^m w|_U\). Induction gives every normal derivative on each side, and tangentially differentiating each trace identity gives all mixed derivatives. Both one-sided jets therefore match the same \(T\) on \(U\). [Quartic Euler equation and normalization](E01_VARIATION.md#projection-and-first-variation)

## Smooth transmission and evidence

Let \(U_*=\{x\in Y:q(0,x)\ne0\}\). E04 proves all-order matching on \(U_*\), hence on its closure by continuity of every one-sided derivative. The open complement of that closure is \(\operatorname{int}_Y\{q=0\}\), covered by the patches above. Thus the one-sided derivatives of every order agree on the entire seam. For each multi-index the joined one-sided derivative is continuous. It is the corresponding classical derivative by induction on the order. At a seam point the tangential derivative is obtained by differentiating the common trace in the seam variables, and the normal derivative is obtained by the matching one-sided difference quotients. The glued field is smooth on the full flat cylinder and satisfies the classical bulk equation across the nonzero-spinor seam by continuity. The fixed-zero, fixed-jet stationarity on the supplied piece interiors is the same statement as in E04.

This proves smooth transmission for the supplied flat pieces under E04's matching hypotheses. The one-sided Taylor argument determines all seam jets. Uniqueness from those jets and transmission on a curved collar are outside this result.

The nine frozen inputs were inspected. The primary convention and flat-model comparison are Friedrich §1 equation (1.1) and §2 Example 2 in the published copy, checked on 28 November 2026. The tangential Clifford identity, Taylor induction and smooth gluing are derived directly above. [Friedrich, published copy](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2) · [Source index](../references/README.md)
