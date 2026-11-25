# E25c · Recognized exterior with the recorded cap

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The delegated helper was configured as GPT-6.2 Sol
with ultra reasoning. The serving variant and effort are unavailable
independently of that configuration. This packet uses the frozen E25 review
inputs at `7db310a2a9219c537b440d7c2fb39e602a32b729` and the working checkout
`0c3399d831d71a1a17c29ffcba14ee0593315cbe`. [Assignment](ACTIVATION_20261125.md) ·
[Marked descent audit](../../reviews/MARKED_DESCENT_AUDIT_20261125.md)

## Result

`FirstOrderTwistor.exists_recognition_eqOn_capNeighborhood` constructs an
actual oriented smooth diffeomorphism of the capped exterior to the
model sphere from an initial oriented recognition and an ambient
extension of a specified local germ. In the geometric application the
marking goes from the cap neighborhood in the standard sphere to the
recorded cap neighborhood of the smooth capped exterior. It is
the composition of the inverse reference chart with the recorded cap
chart, both extended past their cap boundary.

The germ to extend is the marking followed by the initial recognition.
The extension hypothesis gives an orientation-preserving ambient
diffeomorphism of the model agreeing with that germ on an open neighborhood
of the cap. The proof composes the initial recognition with the inverse
ambient diffeomorphism using the existing manifold orientation laws. It
obtains agreement of the corrected inverse on the model neighborhood and
agreement of the corrected forward map on the open image neighborhood.
Bijectivity gives both directions of the complement mapping. The image
identities cover the complements of the caps and the complements of their
interiors, so the latter include the cut boundary in the modeled
hemisphere case. [Lean declaration](../../../../FirstOrderTwistor/MarkedCapRecognition.lean)

Palais Theorem C on p. 277 gives the needed geometric extension for a
specified smooth cell and an orientation-preserving neighborhood
diffeomorphism. In Lean the extension instance is an explicit proposition
argument. Realizing the two cap charts, producing the initial recognized
map from Chang–Gursky–Yang and installing the resulting exterior map
in the overlapping smooth gluing pieces remain separate obligations.
The theorem's cap is a point set, with the recorded cap its image under
the supplied smooth neighborhood marking. [Palais Theorem C](https://paperzz.com/doc/8888202/extending-diffeomorphisms) ·
[Source record R126](../../../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md)

## Verification

On Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`
and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`,
the targeted build succeeded with 2,612 jobs. A fresh import of
`FirstOrderTwistor.MarkedCapRecognition` accepted the elaborated theorem
type and axiom report. The axiom report is `propext`, `Classical.choice`
and `Quot.sound`. [Lake manifest](../../../../lake-manifest.json)
