# Independent readback of the marked caps and fixed-source side masses

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded E readback at issue revision
`5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. Independently reported serving
model and reasoning effort unavailable.

[Physical deformation and cap proof](../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/manuscript/deformation_of_marked_spherical_collars.tex) ·
[Parent, exact-face masses](../../../../papers/investigations-1/05_collar_deformation_and_surgery/manuscript/marked_collars_and_smooth_recognition.tex) ·
[Finite-factor proof](../research-progress/handoffs/ED04_MARKED_CAP_TEST_FACTORS_20261126.md) ·
[Mass proof](../../07_fixed_type_variational_descent/research-progress/handoffs/ED04_FIXED_SOURCE_SIDE_MASSES_20261126.md)

## Positive classes and order of limits

For each smooth positive conformal test on a fixed closed cap,
`hasJoinedCapTests_of_transplantedFactors` first chooses a finite
joined metric and its smooth nonnegative transplant at tolerance
$1/(n+1)$. It then adds a positive constant to that actual factor
and takes a logarithm. The second tolerance controls the scalar
numerator and fourth-power mass simultaneously, with the additive
regularization size allowed to depend on the finite metric and test.
The two errors total less than $2/(n+1)$. The cap test has positive
volume, so the quotient converges with the square-root denominator.
`HasJoinedCapTests.yamabeFloor` then takes the infimum of the cap
quotients and retains the same positive joined floor. The construction
of the nonnegative transplants with the stated two errors is an input.
A general cap proof still needs a finite joined stretch in the actual
marking, the end compactification, and approximation by tests avoiding
the added center, with the scalar numerator and volume both controlled.
[Factor construction](../../../SmoothPoincare/Variational/MarkedCapTestFactors.lean) ·
[Joined floor](../../../SmoothPoincare/Variational/CapTestTransfer.lean)

For the mass comparison, fix the source metric, both full raw sides,
their marked capped smooth types and the orientations before choosing
any tolerance. `FixedMarkedCutCore.rawMasses_of_positiveCaps` uses one
genuine positive cap per tolerance and the same cap for the two signs.
Signature zero at that cap and the two absolute drift bounds give raw
chiral equality at the fixed source. Infimum membership uses positive
caps at each tolerance. With signature-zero caps alone the equality
still follows. The proof introduces a separate source index only in
`eventually_no_smallDriftCaps_of_chargedOriginalDisk`. At a late index
it assumes arbitrarily small exterior drift there and derives the
contradiction against the finite excess. No cross-index uniformity of
collar widths or constants is required. [Fixed-source mass declarations](../../../SmoothPoincare/Variational/FixedSourceMarkedCaps.lean)

## Markings, recognition and full cost

The fixed core maps the entire raw region to the closed complement of
the marked cap interior. The two raw masses add to the whole-source
energy using the actual measurable cover and volume-null overlap. Each
test cap energy is the integral over its entire closed type. Thus a
strip-only estimate is insufficient without the exact retained-region
identity or a bound on its full complement, including every connector
and the cap ball. The marked product plus conformally flat filling in
the scientific source gives zero chiral cost on the added part. The
formal general inference takes the appropriate complete signed drift
as an input.

Under $e<2T$, one complete raw mass is strictly below $T$. The
proof chooses a genuine positive cap at tolerance $T-m_j$ and uses
strict closeness to obtain a strict finite recognition test. The
separate inclusive cap-sum test applies once actual positive caps and
the inclusive recognition premise are provided. On the nonstandard
alternative, the oriented replacement identifies the other capped
type with the source. Its infimum is bounded by the complete kept mass,
so the discarded mass is at most $e-I^+(M)$ in both signs. Assuming
both raw masses were strictly below $T$ would recognize both capped
types by their respective finite tests, contrary to the nonstandard
hypothesis. Both orders inherit their own `MarkedSideReplacement`
premises. In particular the angular transition and actual relative
smooth gluing are geometric inputs. [Marked relative replacement and
inclusive threshold](../../../SmoothPoincare/Variational/CutNonsplitting.lean)

## Round control and orientation

The explicit standard round control uses $a=\sin w_L$ and
$b=\sin w_R$, for independently positive physical latitude widths
less than $\pi/2$. At the equator the angle chart runs on the entire
unit sphere of equatorial directions. Its inverse and the differential
of the cylinder time identify the two-slot normalization; the cylinder
time increases toward the south, with the opposite normal given by its
negative. Each symmetric whole-sphere cap profile agrees with the
appropriate retained half of the asymmetric joined profile, including
the equator and the corresponding pole. Both compactified metrics
therefore include their actual added centers. The global smooth
conformal factors preserve the two identically zero round chiral
measures. Consequently every finite positive width pair gives zero
complete raw and capped cost for both signs. The positive Yamabe sign
is supplied by the round scalar and compact Sobolev estimates, then
transported through the actual conformal class.
[Equatorial metrics](../../../SmoothPoincare/Variational/RoundEquatorialCaps.lean) ·
[Latitude and cylinder chart](../../../SmoothPoincare/Variational/RoundLatitudeProduct.lean) ·
[Round scalar and class](../../../SmoothPoincare/Variational/PositiveScalarYamabeFour.lean) ·
[Finite round theorem](../../../SmoothPoincare/Variational/RoundMarkedFaceControl.lean)

The north closure uses the identity cap marking. The south closure
uses reflection in the equatorial hyperplane, which fixes the
equator pointwise and reverses the signed normal. This gives the
stated marked cap image and its closed complement. With the same
ambient orientation on both copies of the round sphere, the
reflection has degree minus one. A relative replacement using an
orientation-preserving ambient extension of that exact south
marking composed with an orientation-preserving recognition needs an
orientation-compatible marking. A half-turn exchanging the
hemispheres and extending its angular reflection is one possible
choice. The two positive marked cap metrics and their zero complete
cost use the images already constructed. [Hemisphere markings](../../../SmoothPoincare/Variational/RoundHemisphereMarkings.lean)

## Independent check

The bounded check used the pinned Lean 4.35.0-rc3 installation and
imported the four built leaves for the factor transplant, fixed-source
masses, hemisphere markings and cylinder chart. The checked statements
include the cap Yamabe floor, both signed mass and late-index disk
consequences, the hemisphere cap witnesses, and the cylindrical metric
identity. The reported axioms on those main statements are
`propext`, `Classical.choice` and `Quot.sound`.

| Reviewed leaf | SHA-256 |
| --- | --- |
| `MarkedCapTestFactors.lean` | `3f2393057aed529b0a4942477db48d348dc033ef253955a341b5626c14e3384c` |
| `FixedSourceMarkedCaps.lean` | `f2fd7c784c6c1751bb31e0e7061d416579861bd4035ca20b26bcef5d23b263ae` |
| `RoundEquatorialCaps.lean` | `9f45252ec4103158123ac9d554b0728b29972ce7ac8e3a541e1c671b6bd075c3` |
| `RoundHemisphereMarkings.lean` | `7df2baf48968afc8be50ce14cf030bba390cc20f5b8a6db863cfaf5640c596fa` |
| `RoundLatitudeProduct.lean` | `86760efd69e05dc79436549c7b0be89895a7f01a7041dafd4b94cea41207278a` |
