# Edition 03 · Ambient foot motion on a signed height collar

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded packet HT-E06h. The serving model and reasoning effort
are unavailable to the worker. The working base was
`5706ef811adc3691fd85e75507a0a399cb81d18d` with Lean `4.35.0-rc3`, Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`.

Let \(A\) be a supported smooth level isotopy and \(\chi\) a signed collar
whose full source is \(L\times(-r,r)\) and whose ambient manifold is
Hausdorff. For \(0<a<b<r\), the signed product lift and its inverse fix
every point outside the compact product of `A.support` with \([-b,b]\).
This product lies inside the collar source. The pinned
`PartialDiffeomorph.exists_diffeomorph_family_extension` applied to the
constant family of signed lifts gives a smooth ambient self-diffeomorphism.
Its forward and inverse agree with the relative comparison on the entire
collar target. Both maps fix every point outside the image under \(\chi\)
of that compact product, which is contained in the collar target.
[Ambient extension](../../../../SmoothPoincare/Heights/AmbientFootMotion.lean) ·
[Supported signed lift](../../../../SmoothPoincare/Heights/RelativeFootCollar.lean)

On the central interval \(|t|\le a\), the extension has the endpoint foot
motion and its inverse in the original marking. If the height satisfies
\(h(\chi(x,t))=c+t\), both maps preserve \(h\) everywhere. The lift
keeps \(t\) fixed inside the chart and both maps fix points outside
it. The native regular height collar supplies this calibration on its
entire source strip.
[Native calibration](../../../../SmoothPoincare/Heights/NativeHeightCollar.lean)

The leaf compiled with `lake env lean -j1` without diagnostics. Its source
SHA-256 is `fa3813225a015afc2943f56fd0a6f02d14c454b7a4f0aa4b4d71f36518634400`.
The replay checked `SupportedLevelIsotopy.exists_ambientSignedCollarDiffeomorph`
through the leaf import and reported only `propext`, `Classical.choice` and
`Quot.sound`. A specialization to `exists_nativeSignedHeightCollar` checked
both endpoint marking equations on the closed central interval, identity
off the open height band, and preservation of height on the whole ambient
manifold for the forward and inverse maps.
