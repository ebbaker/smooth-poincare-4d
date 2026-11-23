# SP4-CME-E123 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E50, E76, E115 and E119,
and audited E84 in E86. I did not author E84, E112 or E116. The
trajectory lower bound below retains E119 as an explicit premise.
See the [request][req], [B64 decision][b64] and [derivation][note].

## Actual static data

Pass independently of E119. The E112 annuli have disjoint
supports with smooth zero collars.
For \(A_{\delta,N}=A_0+\delta b_N\) the exact curvature difference
is \(\delta d_0b_N+\delta^2[b_N\wedge b_N]/2\), and the fixed
connection and curvature sup sizes are \(O(\delta)\) uniformly
in \(N\). On each annulus the curvature correction is \(O(\delta)\)
and its first derivative is \(O(\delta/r_j)\). The quadratic
bracket has size \(O(\delta^2r_j^2)\) and derivative
\(O(\delta^2r_j)\). Taylor's formula for the wedge Gram
endomorphism and the exact strain give
\[
 |T(A_{\delta,N})-\delta T^{(r_j)}|_G\le C\delta^2/r_j .
\]
The native live metric and volume are uniformly \(1+O(\delta)\)
relative to the reference in the pointwise comparisons. The static
lower subannulus and full annulus upper bound of E116 persist,
with uniformly comparable live volumes. Integrating the strict
distribution sandwich gives \(\|T\|_{(4,q)}\asymp_q\delta N^{1/q}\)
for \(1\le q<\infty\) and weak size \(\asymp\delta\), in the
actual live metric. The single fixed \(\delta_*\) can enforce the
established E50 smooth \(m=6\) value-basin condition for all \(N\).

## Conditional jet error and signed transfer

Assume the E119 first and quadratic weighted remainder bounds.
The compatible pair is \(\delta v_N+\delta^2w_N\), with uniformly
bounded sup sizes of \(v_N,w_N\). Linearity and the independent-pair
domain yield the additional \(\delta^2D_u\mathsf S(0)[w_N]\)
response. Weighted bounds through order two are \(C\delta\) for
the nonlinear pair and \(C\delta^2\) for the difference from
\(\delta D_u\mathsf S(0)[v_N]\). Fixed derivative conversion
adds only fixed lower orders. The exact \(\nabla^A T\) formula
keeps the internal bracket and the live Levi–Civita change on the
one-form slot. Its jet remainder has terms
\(|U||D_0^2U|+|D_0U|^2+|U||D_0U|+|U|^2\).
With the linear pair error this yields \(C\delta^2/\tau\),
also after the live norm conversion.

E115's reference orbit cancellation identifies the linearized
geometric tensor with the unweighted E112 Hessian sum.
With one fixed upper scale before \(N,\delta\), all windows lie
in the recovered head. On each \(I_j\) the E112 signed projection
at \(p\) is bounded below by \(c_0r_j^{-2}\) before multiplying
by \(\delta\). The error integrates to
\(C\delta^2\log(\beta/\alpha)\). The leading term integrates to
\(c_0(\beta-\alpha)\delta/4\). Exact same-time bundle pullback
transfers the live supremum to the original flow. Summation
gives the conditional \(J\ge cN\delta-CN\delta^2\).

Smoothness through zero and the splice and E76's future exponential
decay of \(C^3\) connection and \(C^2\) curvature errors give
finite \(J\) for each finite datum, with data-dependent constants
allowed. This finiteness is independent of E119.

Conditionally, \(\delta=N^{-1/2}\) gives \(J\ge c\sqrt N-C\)
and initial live \(L^4\) strain \(\asymp N^{-1/4}\).
For fixed \(1<q\le\infty\) and
\(\max(1/q,1/4)<a<1\), \(\delta=N^{-a}\) gives both
initial \(L^{4,q}\) and \(L^4\) strains tending to zero and
the conditional lower bound tending to infinity. The initial
\(L^{4,1}\) norm is \(\asymp\delta N\). There is no single-flow
blowup or endpoint failure conclusion. No new source was accessed.
Only the two named E123 files were written.

## Verified file identities

| File | SHA-256 |
| --- | --- |
| E123 request | `9a6a9e859c1f14737df1ff4ce1e12f22ec6f918e356828fc990831f2ea3a3a47` |
| B64 decision | `f71615b28b978678df1b3ad087cf57185ee04bebec14ad325d3efe73508c2e32` |
| E112 | `f3d34f89645c81128a8d16544eb1248f1839249ed7c3c6bdbd0e51e2fa43c856` |
| E116 | `bba74ee73fc53fd7707d4489d6b9f1dbe67957fb9517f972bfba584522a1327c` |
| E115 | `e4c7ce1ff2c90d57c9e5974e6dcb8b7f6520ce6337df29a9421b3744da72b863` |
| E119, explicit premise | `4f95593842c04f25d45535912cc91c032cb1588e5fd3892d33cbc194382988ea` |
| E50 | `ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf` |
| E76 | `2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0` |
| E84 | `fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9` |
| Observed E112/E114 lead assessment | `3955a28ce41c134a66216c7cbce2083ca2dcc3c633b8a73a0ed08be0b165b58c` |
| Observed E115/E118 lead assessment | `49e19a88bc5f77473ec14393033bbe6185dd80cab44177b3451fc74161b57e94` |
| Observed E116/E117 lead assessment | `52b1f3dff1efc6080b241cf3d603bf1a49d83c9c48fa97352be796efdd03f977` |
| Observed E49/E52 lead assessment | `f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee` |
| Observed E76/E77 lead assessment | `c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1` |
| E123 derivation | `8d2e32f25ad75eae6bdc21d1df374d804b82464b96de95268c56d20162837064` |

[req]: SP4-CME-E123_REQUEST_v1.md
[b64]: ../../brainstorm/notes/B64_CONDITIONAL_NONLINEAR_MULTISCALE_TRANSFER_20261122.md
[note]: ../../notes/123_CONDITIONAL_NONLINEAR_MULTISCALE_BUDGET_20261122.md
