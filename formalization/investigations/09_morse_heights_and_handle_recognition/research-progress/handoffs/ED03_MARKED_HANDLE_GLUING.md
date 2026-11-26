# SP4-FORM-HT-E04c · Transport of the marked handle assembly

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet, revision 1. Actual serving model and
reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/MarkedHandleGluing.lean)
· [Marked end reductions, `lem:trees`](../../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)
· [Height-floor audit](../../reviews/ED03_HEIGHT_FLOOR_AUDIT.md)

The supplied lower-body map is $\alpha:P'\to P$ with boundary marking
$\alpha_b:\partial P'\to\partial P$, and $p:\partial P\to C_-$ is the
old incoming identification. `transportedAttachingTube` defines the
full map $a'_j=\alpha_b^{-1}p^{-1}a_j$ on $S^1\times D^2$. This also
gives the reversed tube formula with $\beta_b$ and $q$ in place of
$\alpha_b$ and $p$. `transportedMiddleTraceHomeomorph` descends
$\operatorname{id}_{\coprod_j(D^2\times D^2)}\sqcup\alpha$ through the
native adjunction. On a generator its two images agree because, with
boundary inclusions $j_{P'}$ and $j_P$,
\[
  \alpha j_{P'}a'_j=j_P\alpha_b a'_j=j_Pp^{-1}a_j.
\]
In particular the map retains the handle label and both disk coordinates.
The code uses the native `Handle.StandardHandle 2 2` and
`Handle.AttachingRegion 2 2` on every summand. The quotient statement is
valid for any index type and applies to the empty and finite families.

Let $s:X'\to X$ be the trace map, with a supplied compatible outgoing
boundary map $s_b$, and $\beta:Q'\to Q$ the upper-body map, with compatible
boundary map $\beta_b$. For $q:\partial Q\to C_+$ and
$\eta:\partial X\to C_+$, `transportedOutgoingGluing` implements
$\varphi'=\beta_b^{-1}q^{-1}\eta s_b$ by using $\eta s_b$ for its outgoing
marking. `transportedClosedAssemblyHomeomorph` descends $s\sqcup\beta$
through the actual outgoing boundary adjunction. Both commutative maps
on the generators are proved. The general construction allows a supplied
change of coordinates on the trace, including a slide for which the
marked trace comparison is available. The combined
`transportedMorsePresentationHomeomorph` takes $s$ from the lower
construction and transports the outgoing boundary inclusion by $s^{-1}$.
It sends every nested representative to its class under $\alpha$ on the
lower body, the identity on each handle, and $\beta$ on the upper body.
The inverse acts by $\alpha^{-1}$, the identity, and $\beta^{-1}$,
respectively. Both comparisons use the pinned library's
`DifferentialGeometry.Topology.adjunctionHomeomorph`, which lifts the
piecewise continuous maps through the quotient, proves both inverse
identities on representatives, and gives continuity in both directions.

`contMDiff_transportedAttachingTube` supplies smoothness of the full
transported tube under smooth marking hypotheses.
`transportedOutgoingDiffeomorph` gives the boundary diffeomorphism
itself, and its underlying homeomorphism is the same marking used in
the quotient. For independently smoothed assemblies, agreement at the
seam only controls the restriction to the boundary. Even in a real
normal coordinate, two smooth one-sided maps can have different normal
derivatives there. A smooth glued comparison needs compatible collar
germs, for example the induced boundary diffeomorphism times the
identity in a common normal coordinate, and compatible rounding at a
handle rim. The pinned `BinaryCollaredGluing` gives candidate signed
seam charts on its own boundary quotient. A smooth and oriented
comparison with the handle adjunction, the existence of reduced end
bodies, and smooth sphere recognition remain separate obligations.

## Verification

Issued source base `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`.
Checkout during execution `bfdf0660e4f7d574cf507333af8e5e6781fa7915`
with working sources. The master immersion and marked topology companion
TeX SHA-256 prefixes were `f7a9522959429fdb` and `9681e2deb71434b7`.
The manifest prefix was `839111aae86b6935`, with Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`. The native adjunction
homeomorphism module has SHA-256 prefix `84fa6fa56d6cdb3d`.

`lake build +SmoothPoincare.Heights.MarkedHandleGluing` passed with Lean
`4.35.0-rc3` and Lake `5.0.0-src+470d5ce`. A separate module import
checked six representative equations by `rfl`, covering the forward
and inverse maps on the two end bodies and the handle summands.
The six axiom checks for the
trace, outgoing assembly, combined assembly, smooth tube, outgoing
diffeomorphism and its underlying map reported `propext`,
`Classical.choice` and `Quot.sound` only. The Lean module SHA-256 begins
`c2eb2dd97745b437`.
