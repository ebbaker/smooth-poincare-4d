# SP4-TWA-E23 return · Full nullspace quartic

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. [Request v1](E23_REQUEST_v1.md) records
the author-selected GPT-6.2 Astra/ultra lead and configured GPT-6.2
Sol/ultra helper. Actual backend model and reasoning effort were
unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`
and all nine frozen input SHA-256 digests matched.

**Disposition.** Completed the [full reduced quartic](../../notes/E23_NULLSPACE_QUARTIC.md)
at \(b=51\pi/16\) on the flat periodic cylinder, with amplitudes
normalized to unit spatial helices and time factor \(\cos(\pi t/2)\).
Translations and orientation-preserving cubic rotations give
\(q(W)=A\sum|a_j|^4+C\sum_{i<j}|a_i|^2|a_j|^2\).
Recomputing the one-wave forcing gives \(A=(12227/6144)\omega^4\),
\(\omega=\pi/2\), since only the scalar mean is forced and its
periodic relaxation is exact. This recovers E15 after the
second-order chart shift and accounts for all scalar and vector
corrections.

For the equal perpendicular pair, only the scalar mean, the mixed
scalar \(m=\sin(2\pi x_1)\cos(2\pi x_2)\), and the corresponding
imaginary gradient are forced. The entire orthogonal complement is
unforced and nonnegative in the original Dirichlet space. Relaxing
only the three forced time profiles to periodic \(H^1\), the four
explicit rational blocks give
\(q(1,1,0)\ge (42222312899/248709120)\omega^4>169\omega^4\).
Thus \(C\ge(41232414979/248709120)\omega^4>2A\), which gives
\(q(W)\ge A(\sum|a_j|^2)^2\) for the full six-dimensional real
kernel, with equality exactly when at most one amplitude is nonzero.

Rechecked the Friedrich twistor sign and the frozen E14 and E15
inputs. The result proves the reduced quartic sign. Nonlinear local
minimality and the sharp global transition return to the lead as
separate targets. [Source inspection](../../notes/E23_NULLSPACE_QUARTIC.md#sources-and-reproducibility)
