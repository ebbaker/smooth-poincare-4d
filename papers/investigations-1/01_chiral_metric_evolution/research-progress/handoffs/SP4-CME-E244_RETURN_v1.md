# SP4-CME-E244 return v1 — Independent radial global-cap verification

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E verification under B112, configured gpt-6.2-sol / ultra. Independent runtime and selected lead settings are unavailable. I authored E241 and E237 and used the assessed E235 germ and E240's returned fixed reference setup as declared inputs. I checked the cap independently without reading E243. [Detailed review](../../reviews/E244_RADIAL_GLOBAL_CAP_VERIFICATION_20261123.md)

## Disposition

Pass. On the fixed standard oriented round sphere and its positive chiral bundle, for all sufficiently small \(\epsilon>0\) the prescribed radial cutoff at radius \(R=\epsilon^2\) gives an actual smooth positive definite round-compatible connection with \(\sup\rho=1+\epsilon\) and unique maximum \(p\).

The exact curvature parameterization for \(a=A_L-A_{\rm rd}\) is
\[
 F=F_{\rm rd}+u\,d_{A_{\rm rd}}a+\tfrac12 u^2[a\wedge a]
                  +(v/|x|)n^\flat\wedge a.
\]
The Euclidean self-dual projection of the leading affine cutoff term gives \(h=u+v/4\). The curvature remainder and its \(u,v\) derivatives are \(O(|x|+|x|^2/\epsilon)=O(\epsilon^2)\) uniformly in the fixed parameter rectangle, all angles, and \(0<|x|\le R\). The normalized wedge quotient has the claimed value and parameter-derivative expansions with the same \(O(\epsilon^2)\) orders.

The uncut polynomial gives \(Q_L=Q_r+\frac12 B|x|^2+O(\epsilon^{-2}|x|^4)\), using its even curvature coefficients. On the straight matrix segment its gaps stay bounded below by \(\epsilon/6\), so the second eigenvalue derivative gives scalar remainder \(O(\epsilon^{-3}|x|^4)\). The negative center Hessian then gives strict comparison with \(r\) throughout the punctured full \(R\)-ball. In the \(h\ge1/2\) regime the \(u,v\) derivatives of the log ratio are positive with uniform lower bounds \(\epsilon/2,\epsilon/8\), and integration compares to the exact uncut value. In the \(h\le1/2\) regime eigenvalue Lipschitz bounds give \(\rho\le1+(3/4)\epsilon<r\) without requiring simplicity. The round exterior has ratio one. These are static estimates for the fixed family. No flow conclusion enters.

## Integrity

All four frozen inputs matched. The review records the fixed cutoff construction, positive wedge denominator, gauge and metric factors, and a uniform choice of sufficiently small parameters. Only the assigned review and return were written.

- [Request v1](SP4-CME-E244_REQUEST_v1.md) SHA-256 eb4ee0448b464867789e6eb75fe75e1645e30e09933c8906faec5755698589fa.
- [Independent review](../../reviews/E244_RADIAL_GLOBAL_CAP_VERIFICATION_20261123.md) SHA-256 4ebd6efc628bbf9afa4aba141b7c8a85df11509d9059ca774699bb81af4f0eb2.
