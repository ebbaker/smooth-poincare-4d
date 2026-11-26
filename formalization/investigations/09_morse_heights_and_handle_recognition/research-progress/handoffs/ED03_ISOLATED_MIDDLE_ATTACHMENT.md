# SP4-FORM-HT-E04f · An isolated smooth index-two attachment

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet, revision 1. Actual serving model and
reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/IsolatedMiddleAttachment.lean)
· [Height-floor audit](../../reviews/ED03_HEIGHT_FLOOR_AUDIT.md)
· [Marked end reductions](ED03_MARKED_HANDLE_GLUING.md)

Fix a compact Hausdorff smooth four-manifold with a boundaryless model,
an actual smooth real function $f$, and a band $[\ell,u]$ containing one
critical point $p$. Its value $c=f(p)$ is strictly between the cuts.
At $p$ the chart Hessian is nondegenerate and its negative signature
index is two. The native model vector space in this packet is
$\mathbb R^{\{1,2,3,4\}}$ with its product norm, `MorseModel 4`.

`exists_isolatedMiddleAttachment` derives the native `MorseChart` on
this manifold from the actual critical point and chart Hessian using
`DifferentialGeometry.Morse.exists_interior_morse_chart`. The chart
keeps its smooth radius. Its smaller working radius $R$ is half the
minimum of the old two radii, $1$, $c-\ell$, and $u-c$. Its internal
chart parameter is changed to $R^2/4$. This preserves the closed-ball
normal form and provides the strict radius inequality used by
`exists_morseHandleAdjunction_diffeomorph_upperSublevel_of_morseChart`.
Apply that theorem on the compact strip of half-width $a=R^2/16$.
That strip lies inside the supplied band and inherits the unique
critical point hypothesis. The native theorem returns $\epsilon,r>0$
with $\sqrt{2\epsilon+2r^2}\le R$. Since $R<1$, this yields
$\epsilon\le R^2/2<R<\min(c-\ell,u-c)$. Thus both regular cuts of the
returned attachment lie strictly inside the original band by a bound
available in the public native conclusion.

`IsolatedMiddleAttachment` carries the diffeomorphism from the actual
quotient of the lower sublevel and $D^2\times D^2$ to the actual upper
sublevel. Its charted structures are the native half-space structures,
the induced trace structure, and the product-with-corners structure on
the handle. Both quotient piece maps are smooth. The diffeomorphism
fixes the supplied deeply lower sublevel pointwise under the ambient
identification, and the inverse has the corresponding representative
formula. Both properties use the same positive margin $\eta$ supplied
by the native theorem. The two attaching-tube declarations verify
smoothness and topological closed embedding of the full
$S^1\times D^2$ parametrization in the actual lower regular level. Its
inclusion into the lower sublevel is the attaching map in the trace.

This is one isolated stage on the original source. Comparing the two
new cuts with the original outer cuts requires the regular bands between
them. Composing across the ends requires the outgoing boundary maps and
compatible collars. The packet supplies no orientation sign, global end
reduction, or smooth recognition theorem.

## Inputs

Issued source base `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`.
Checkout during execution `bfdf0660e4f7d574cf507333af8e5e6781fa7915`
with working sources. The manifest prefix was `839111aae86b6935`,
with Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.
