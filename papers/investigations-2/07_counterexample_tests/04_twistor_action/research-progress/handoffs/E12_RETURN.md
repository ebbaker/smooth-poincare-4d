# SP4-TWA-E12 return · Explicit periodic-cylinder Sobolev bound

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. [Request v1](E12_REQUEST_v1.md) records
the author-selected GPT-6.2 Astra/ultra lead and configured GPT-6.2
Sol/ultra helper. Actual backend model and reasoning effort were
unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`
and all nine frozen input SHA-256 digests matched.

**Disposition.** Completed the [explicit product estimate](../../notes/E12_CYLINDER_CONSTANT.md)
for real \(H^1\) spinors with zero traces at \(t=\pm1\) on the unit flat
periodic cylinder. Checked the actual printed formula (2) in Talenti's
theorem on p. 353. Substituting \(m=4,\ p=2\) gives
\(C_{4,2}=(3/(32\pi^2))^{1/4}<1\) for
\(\|u\|_{L^4(\mathbb R^4)}\le C_{4,2}\|\nabla u\|_{L^2(\mathbb R^4)}\).
Zero extension in time, the product cutoff over 27 tangential cells,
the Sobolev chain rule for the spinor norm and
\(\|v\|_2\le2\|\partial_t v\|_2\) give
\(\|v\|_4\le(18+3\sqrt3)\|\nabla v\|_2\le24\|\nabla v\|_2\).
[Primary source](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1)

For \(b=1/200\), the E11-compatible absorption margin using the prescribed
constant \(24\) is \(29403/40000-81\sqrt2/2500>2/3\).
The arithmetic uses the target \(3\|v\|_4^2\) as the remainder bound.
Proof of that bound and all variational conclusions remain in the
separate comparison packet. E12 is ready for the lead to integrate.
