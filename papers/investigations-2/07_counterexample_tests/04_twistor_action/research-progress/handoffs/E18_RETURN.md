# SP4-TWA-E18 return · Two perpendicular critical helices

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. [Request v1](E18_REQUEST_v1.md) records the
author-selected GPT-6.2 Astra/ultra lead and configured GPT-6.2 Sol/ultra
helper. Actual backend serving variant and reasoning effort were
unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all
eight frozen input SHA-256 digests matched.

**Disposition.** The fixed equal two-helix direction at \(b=51\pi/16\)
has a strictly positive optimized fourth-order coefficient in the
tested product-mode family. With \(T=\pi t/2\), the even time profiles
are \(\cos(2jT)-(-1)^j\), the odd profiles are \(\sin(2jT)\), and
\(1\le j\le4\) in each parity. Exact rational minimization of the
forced scalar mean, mixed scalar and mixed longitudinal components
gives
\[
\frac{29772745866921709978958207563}{174281498283558407756021760}
       \left(\frac{\pi}{2}\right)^4
>170\left(\frac{\pi}{2}\right)^4 .
\]
All orthogonal product sectors are unforced with nonnegative Hessian.
The trace, helicity and Taylor signs and a reproducible exact
arithmetic calculation are in the [derivation](../../notes/E18_TWO_HELICES.md).
The optimized trial supplies no subthreshold cheaper field.

**Whole-time lower certificate.** For the same fixed first-order
direction, retaining the Dirichlet restriction on every unforced
spatial sector and allowing the three forced time coefficients to be
periodic gives the lower bound \(42222312899\,(\pi/2)^4/248709120>0\)
for every smooth homogeneous-Dirichlet second-order correction. This
uses the same quartic expression as the finite calculation.

Rechecked Friedrich's published equation (1.1) for the projection
convention and the frozen E14 quaternion sign and Hessian. The
scope is the specified equal first-order kernel amplitudes at the
fixed end data. Other first-order amplitudes, finite perturbations
and different traces are outside the sign test.
The requested negative witness returns to B08 as unachieved in this
test. [Published source](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
