# SP4-TWA-E16 return · Improved unrestricted slope interval

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. [Request v1](E16_REQUEST_v1.md) records
the author-selected GPT-6.2 Astra/ultra lead and configured GPT-6.2
Sol/ultra helper. Actual backend model and reasoning effort were
unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`
and all seven frozen SHA-256 digests matched at inspection.

**Disposition.** Completed the [improved comparison](../../notes/E16_GLOBAL_SLOPE_BOUND.md).
With \(s=(19+6\sqrt2)/32\) and \(\alpha=9\sqrt3/(16\pi s^3)\), the
certified range is

\[
|b|<b_*=\sqrt{(3/4)/(4\alpha-3/\pi^2)}\simeq 0.67344.
\]

In particular the full closed interval \(|b|\le2/3\) lies strictly
inside this range. On the fixed unit flat periodic cylinder, each
prescribed pair of traces \(e^{\pm b}\sigma\) with \(|b|<b_*\) has a
unique global minimizer \(e^{bt}\sigma\), of cost \(9b^4/8\), over all
smooth admissible fields including their compatible transverse zeros.
Every minimizing sequence for those fixed traces converges strongly
in \(H^1\). Equality forces the conjugated zero-trace variation to
vanish. The conclusion covers either sign of \(b\) and also \(b=0\).

Translated product cosine cutoffs and the exact Euclidean scalar
constant give the mass-retaining Sobolev bound. Combining its mass term
with the exact quadratic numerator, the sharp time Dirichlet
Poincaré constant and the tangential Clifford Fourier estimate yields
positive time and tangential coefficients. Rechecked the published
Talenti formula on p. 353. [Source inspection](../../notes/E16_GLOBAL_SLOPE_BOUND.md#sobolev-bound-with-mass-retained)

The endpoint \(b_*\) is the loss of a positive time coefficient in this
estimate. It leaves the sharp global transition unresolved. The result
is ready for independent replay and return to B08.
