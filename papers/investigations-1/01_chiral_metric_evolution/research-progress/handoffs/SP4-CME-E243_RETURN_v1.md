# SP4-CME-E243 return v1 — Exact global cap for the radial cutoff

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B112, configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored E236 and E240. The E240
cutoff positivity and smooth extension are used at their returned
scope, with the separate independent audit pending at this freeze.

## Disposition

**Complete for the prescribed family.** For all sufficiently small
\(\epsilon>0\), the smooth globally positive round-compatible
connection on the standard chiral bundle over \(S^4\) has
\(\sup_{S^4}\rho=1+\epsilon\), attained only at \(p\).

On the full \(|x|\le\epsilon^2\) ball, the exact polynomial curvature
and fixed wedge quotient give
\(Q_{\rm loc}=Q_r+B|x|^2/2+O(\epsilon^{-2}|x|^4)\).
The gap is bounded below by \(\epsilon/6\) along each segment from
\(Q_r\) to \(Q_{\rm loc}(x)\), so the scalar Taylor remainder is
\(O(\epsilon^{-3}|x|^4)\). The negative term
\(-|G|^2|x|^2/2\) dominates for every nonzero point in that
ball when \(\epsilon\) is small.

In the annulus the exact curvature is
\[
 F_{\rm rd}+u(F_{\rm loc}-F_{\rm rd})
    +\tfrac12u(u-1)[a\wedge a]+(v/|x|)\,n^\flat\wedge a,
 \qquad a=A_{\rm loc}-A_{\rm rd}.
\]
The affine coefficient \(1/2\) in \(a\) and the Euclidean
self-dual projection of \(n^\flat\wedge\iota_n\Sigma_i\), which
is \(\Sigma_i/2\), give exactly the leading coefficient \(v/4\).
The quotient is \(I+\epsilon(u+v/4)D+O(\epsilon^2)\) with the
same control of first \(u,v\) derivatives of the remainder.
For \(u+v/4\ge1/2\) the gap and eigenspace estimates yield
positive partial derivatives of \(\log\rho\), so comparison
with \((1,0)\) cannot raise the polynomial ratio. In the
other region the min–max estimate gives
\(\rho\le1+3\epsilon/4\). Outside the cutoff support the
ratio is one. All constants are uniform over the stated regions.

The center germ retains the native directional derivative \(1/2\)
of \(\log\rho\). This packet establishes the static exact cap and
does not assert a trajectory or failure of preservation.

## Frozen identities

The [proof](../../notes/243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md)
has SHA-256
`7c29df2ad8a5acd3aabcce9b79e5a9e9628c784028997ce8512421c4ded50cb0`.
It records all four verified frozen input digests. The
[request](SP4-CME-E243_REQUEST_v1.md) has SHA-256
`c9f77cd8bfde6f60084dad4f54d317c952eb201e7024dd771a6891580a7b5666`.
Only the named proof and return were written.
