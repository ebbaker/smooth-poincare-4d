# SP4-CME-E131 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E50, E63, E76 and E125,
audited E84 in E86, and authored the E119/E128 inputs upstream of
the head premise. I did not author E48, E49, E84 or E129. This is
the tail implication under the named E129 head premise. See the
[request][req], [B68 decision][b68] and [derivation][note].

## Fixed positive splice

Pass, conditional on the specified E129 estimate. The E63 order-ten
estimate on the fixed strip containing \([h/2,h]\) controls the head
pair from the fixed initial value size \(v\). The E125 coefficient
arrays have the required bounded orders there. For the defect,
differentiate the head equation through order five and integrate by
parts in the fixed volume. This gives
\(y_m'+c y_{m+1}\le C_m y_m\) for \(0\le m\le5\) and
\(y_m=\|q\|_{H^m}^2\). The weighted sum with factors
\(\nu_m(\tau-h/2)^m\), \(m\nu_m\le c\nu_{m-1}/2\), absorbs each
time-weight derivative. It gives
\(\|q(h)\|_{H^5}\le C_h\|q(h/2)\|_2\le C_h\ell\)
from the \(M_h\) component of \(E_h\).

At \(B(0)=\widehat A(h)\), E63 gives \(\|a(0)\|_{H^{10}}\le C_h v\).
E49 at \(H^6\) gives its usual exponential bound. One fixed reduction
in \(v\) makes the E76 order-ten graph tame term absorbable starting
at \(s=0\), so \(\|a(s)\|_{H^{10}}\le C_h v e^{-\alpha s}\)
with no datum-dependent higher-norm constant. The earlier splice
uses the same E50 constructions. The local recovery exists slightly
past \(h\), and the recovered stable tail is
\((g_{\rm loc}(h)g_{\rm st}(s))\cdot B(s)\). Both solve the original
equation and match at \(h\). Smooth uniqueness recentered at their
common definite datum identifies the right overlap and the same
original solution.

## Stable defect and intrinsic budget

E48 has \(B_s=v_{\rm F}-d_B\phi+\iota_uF_B\) with
\(\phi=d_0^{*G}a\) and \(u=-\Delta_{\rm vec}S_0^*a\), where
\(\Delta_{\rm vec}\) is the nonnegative fixed vector Laplacian.
The exact normalized defect correction is
\(+[\operatorname{ad}\phi,q]+\nabla_u^Bq\), with the common density
term canceling the derivative of \(u\). In the stable background,
\(H^{10}\hookrightarrow C^7\) gives \(F,g,Q\) in \(C^6\).
The principal perturbation is small in \(C^6\), while all
lower arrays are small in \(C^5\). This includes the fixed
order-two base velocity, the live Levi–Civita difference, and the
physical first-jet products with one explicit defect factor.

For \(L_{\mathcal V}=4D_0^*D_0+12I\) and \(P=I+L_{\mathcal V}\),
the perturbation is bounded \(H^6\to H^4\) by \(C_h v e^{-\alpha s}\).
Set \(Z=P^2q\). The exact graph energy
\(\mathscr E_5=\langle PZ,Z\rangle\) has dissipation
\(\|PZ\|_2^2-\mathscr E_5\) and source
\(\langle P^2\mathcal R_s q,PZ\rangle\). Since \(P\ge13I\)
and \(\|q\|_{H^6}\le C\|PZ\|_2\), a fixed \(v\) decrease absorbs
the perturbation. This gives
\(\|q(s)\|_{H^5}\le C_h\ell e^{-6s}\).

The full live \(\nabla^B T\) uses both connections. The \(C^2\)
defect bound and E125's fixed Hessian comparison control its
linear factors by \(C\|q(s)\|_{H^5}\). Its quadratic factors and
\(|T|^2\) keep one background-small factor, so the sum is linear
in \(\ell\). Exact same-time pullback preserves the live supremum
on the original recovered tail. The tail budget is thus bounded
by \(C_h\ell\), and adding the E129 head budget gives the
conditional whole-time bound. No threshold here depends on
\(\ell\) or higher initial derivatives. No new primary source
was inspected. Only the two named E131 artifacts were written.

## Verified identities

| File | SHA-256 |
| --- | --- |
| E131 request | `8e438e8674a666f8b70272c850fbd58d3709e4d1796c44c3cdc841fa0c38dba2` |
| B68 decision | `6c38ba1f5e019229a55ac7b66baefef487a424efd787442c671303b30e95ee53` |
| B67 decision | `5f8fbf092752ba84c9cd0d3e7a68a203bb0dc46197d4cecc22075b5a57c04cc2` |
| E129 request, frozen head premise | `b5a201d86a9b88804ff934894762268389ea16c2384b690a05726e5fce22e455` |
| E125 | `74480ee1c5700672acd651820f2b64df2e4159ccd0f08aa478abdaffe0340c11` |
| E125/E127 assessment | `afd1a81cea5dff21fa50ff42f972e25c2b101edc3216f1eaeb2a651abc6a8d2b` |
| E48 | `b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b` |
| E49 | `45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16` |
| E50 | `ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf` |
| E63 | `427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb` |
| E76 | `2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0` |
| E84 | `fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9` |
| Observed E129 derivation | `d8934b1c8fce1ed0cec01ae8f4deec591d85eaccdab25e6a7cd08abd065cf707` |
| Observed E129 return | `2d255a480f8df5f584770a8f9217f5a0b5e1e5bacc0c23176478e22ea3128129` |
| Observed E128/E130 assessment | `1982e35a2d1d4f587f7ea94bb41e31964caa911ae59f6869147f1fbfeac37548` |
| E131 derivation | `8fc6b6416e2e4d5bb0a17b1dad74eada29a2bf41668d197880fbf313d9ab4e80` |

[req]: SP4-CME-E131_REQUEST_v1.md
[b68]: ../../brainstorm/notes/B68_DEFECT_SENSITIVE_STABLE_TAIL_20261122.md
[note]: ../../notes/131_CONDITIONAL_DEFECT_SENSITIVE_TAIL_20261122.md
