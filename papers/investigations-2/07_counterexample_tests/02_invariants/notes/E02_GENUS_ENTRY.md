# WIN-E02 · The marked latitude unknot and trefoil

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Fixed E02 revision 1, checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. The request designates GPT-6.2 Sol / ultra. Exact serving variant and effort are unavailable. The comparison matches the boundary and surface of the [frozen WEX-E04 return](../../01_examples/notes/E04_NATIVE_SURFACE.md) to the conventions and separate collar control of [WIN-E01](E01_GENUS_CONTROL.md). The WEX-E04 construction retains its working evidence status pending non-author replay. [Frozen request](../research-progress/handoffs/REQUEST_E02_R1.md)

| Oriented knot in the model \(S^3\) | Surface in the actual puncture | \(g_4\) | \(g_{\Sigma_P}\) | \(\tau\) | \(s_{\mathbb Q}\) |
| --- | --- | ---: | ---: | ---: | ---: |
| \(J\), the clockwise latitude unknot below | WEX-E04 disk through two sections of \(C_1\), with signs \(+1,-1\). It misses \(C_2\). | 0 | 0 | 0 | 0 |
| \(T=\widehat{\sigma_1^3}\), the positive right-handed trefoil | WIN-E01 positive braid Seifert surface pushed into the puncture collar. Its genus is one and it misses both caps. | 1 | 1 | 1 | 2 |

## Match the oriented diagram

The mark on the actual puncture is \(\iota(u)=\chi(rR(u))\), where \(r=1/16\), \(\chi\) is the positive pole chart and \(R(u)=(-u_1,u_2,u_3,u_4)\). The outward normal of the puncture complement points toward decreasing radius, so \(\iota\) preserves orientation from the standard outward \(S^3\). WEX-E04 uses the local sphere \(y_4=0,\ \rho^2=2ay_3\) near the puncture, with \(a=1/12\) and \(\rho=|y|\). Its surface orientation there is \(-d\rho\wedge d\alpha\) up to a positive factor, so the remaining surface has boundary orientation given by increasing \(\alpha\). Applying \(R\) once to the unit coordinates \(y/r\) yields
\[
 J(\alpha)=\left(-k\cos\alpha,\ k\sin\alpha,\ \frac38,\ 0\right),
 \qquad k=\sqrt{1-(r/2a)^2}=\frac{\sqrt{55}}8.
\]
WEX-E04's collar straightening fixes this boundary circle pointwise. In the model \(S^3\), stereographic projection \((u_1,u_2,u_3)/(1-u_4)\) from \(e_4\) sends it to the same Euclidean circle in the plane with third coordinate \(3/8\). Projection to the ordered \((u_1,u_2)\)-plane gives a clockwise circle with no crossings. The two sections in \(C_1=D^2\times S^2\) are \(D^2\times\{n(1/32)\}\) and \(D^2\times\{n(-1/32)\}\) and have the signed intersections in the table against the oriented fiber \(\{0\}\times S^2\). [WEX-E04, rounding and puncture](../../01_examples/notes/E04_NATIVE_SURFACE.md#rounding-and-the-puncture)

## Genus and invariant comparisons

In the standard oriented \(B^4\) the same \(J\) bounds the affine disk \(u_3=3/8,\ u_4=0,\ u_1^2+u_2^2\le k^2\), oriented by \(-du_1\wedge du_2\). The radial norm has nonzero radial derivative on this disk at its boundary, so the disk meets the boundary sphere transversely. This gives \(g_4(J)\le0\), and WEX-E04 gives \(g_{\Sigma_P}(J)\le0\) in the actual puncture. Genus is nonnegative. Ozsváth–Szabó's Corollary 1.3 and Rasmussen's Theorem 1 give \(|\tau(J)|\le g_4(J)\) and \(|s_{\mathbb Q}(J)|\le2g_4(J)\), respectively, hence both invariants vanish. Rasmussen uses rational coefficients and the proof of this inequality uses a smooth oriented spanning surface in standard \(B^4\). [Ozsváth–Szabó, Corollary 1.3](https://arxiv.org/pdf/math/0301149#page=3) · [Rasmussen, Theorem 1, coefficient convention and §4.4](https://arxiv.org/pdf/math/0402131v1)

For \(T\), use the two Seifert disks and three positive bands associated with the word \(\sigma_1^3\) in the model sphere. The connected surface has one boundary component and Euler characteristic \(2-3=-1\). The collar map \((u,s)\mapsto\chi((r+s)R(u))\) for \(0\le s\le r/2\) transports this surface as the graph of a small positive-in-the-interior boundary-defining function, zero at its boundary with nonzero inward derivative. Its oriented boundary is \(\iota(T)\), so the model diagram still has three positive crossings. The collar stays in the pole chart, at radius at most \(3/32\), away from both caps. The same Seifert construction pushed into the standard ball gives \(g_4(T)\le1\). Ozsváth–Szabó's Corollary 1.7 gives \(\tau(T_{2,3})=1\), and Rasmussen's positive-diagram formula in §5.2 gives \(s_{\mathbb Q}(T)=3-2+1=2\). Each gives \(g_4(T)\ge1\). [WIN-E01, positive two-braid control](E01_GENUS_CONTROL.md#the-positive-two-braid-control) · [Ozsváth–Szabó, Corollary 1.7](https://arxiv.org/pdf/math/0301149#page=4) · [Rasmussen, §5.2](https://arxiv.org/pdf/math/0402131v1#page=14)

The native puncture is an integral homology ball by excision and the homology sequence for a coordinate ball removed from the homotopy sphere. Thus \(b_1=b_2^+=0\) and \(H_2(W,\partial W;\mathbb Z)=0\). The boundary is the oriented model sphere via \(\iota\). The class terms in Ozsváth–Szabó's Theorem 1.1 vanish. Applying the theorem to \(W\) gives \(\tau(K)\le g\) for a smooth proper oriented genus-\(g\) surface with boundary \(\iota(K)\). Applying it to \(-W\) with mark \(\iota\circ R\) gives the other sign by Lemma 3.3, since the transported boundary knot is the mirror. It follows that \(g_{\Sigma_P}(T)\ge1\), with equality by the collar construction. For \(J\) the same bound merely gives \(g_{\Sigma_P}(J)\ge0\). [Ozsváth–Szabó, Theorem 1.1 and Lemma 3.3](https://arxiv.org/pdf/math/0301149)

Both entries have \(g_4(K)-g_{\Sigma_P}(K)=0\) and \(|s_{\mathbb Q}(K)|=2g_{\Sigma_P}(K)\). The strict hypothesis of the proposed genus comparison fails for these two controls.

## Input verification

The inspected WEX-E04 file matches the requested SHA-256 `cd07e974baf735688b2b698e73cc1dc26d935765936ff295246e08e0a9ea548d`. WIN-E01 has SHA-256 `dedd5676476606d1507b9c44e2945d0f1ebbd0a0d08108c322cb6cbd35dc62c7`. The linked primary theorem statements, mirror sign, rational-coefficient convention, standard-ball hypothesis and positive diagram computation were checked on 28 November. This packet matches the two surfaces to their oriented knot and bound data. It inherits the working geometry of WEX-E04.
