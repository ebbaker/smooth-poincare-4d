# SP4-CME-E240 return v1 — Closed realization of near-round ratio germs

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B111, configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored the E236 audit and E215.
The cutoff proof uses the separately assessed E235/E236 local
construction and the fixed round normalization.

## Disposition

**Complete for the prescribed \(R=\epsilon^2\).** The radial
gauge gives \(A_{\rm rd}=\frac12\iota_x F_{\rm rd}(0)+E_{\rm rd}\)
with \(|E_{\rm rd}|\le C_{\rm rd}|x|^2\) and
\(|DE_{\rm rd}|_{\rm op}\le2C_{\rm rd}|x|\).
For \(0<\epsilon\le1\) the local coefficients obey
\(|G|\le2\), \(|T|\le3\), \(\epsilon\mu(r)<10\),
\(|U|\le33/\epsilon\) and
\(|V^a|\le33\sqrt{3/2}/\epsilon\).
The linear difference is \(O(\epsilon|x|)\).
At radius \(R\) the product rule gives
\[
 \sup|a_\epsilon|=O(\epsilon R+R^2+R^3/\epsilon),\qquad
 \sup|Da_\epsilon|=O(\epsilon+R+R^2/\epsilon).
\]
These give \(O(\epsilon^3)\) fixed-background connection value
closeness and \(O(\epsilon)\) fixed-background \(C^1\) closeness.

The cutoff difference extends smoothly as a global adjoint-valued
one-form. Actual curvature is
\(F_{\rm rd}+d_{A_{\rm rd}}a_\epsilon+[a_\epsilon\wedge a_\epsilon]/2\),
with \(O(\epsilon)\) difference in the fixed background.
The old-background wedge matrix is uniformly \(I+O(\epsilon)\)
and positive. The segment to the reference keeps it positive,
preserving the round-compatible sign. Hence the result is a
globally definite connection on the standard chiral bundle,
with \(1+\epsilon\le\sup\rho\le1+C\epsilon\).

Exact agreement on \(|x|<R/2\) gives the strict local ratio
maximum at \(p\) and native instantaneous log-ratio derivative
\(1/2\) there. The local-maximum neighborhood can be smaller than
the cutoff core. The annulus has the stated round-closeness bound.
An exact global ratio cap, a global maximum at \(p\), and a flow
conclusion are outside this packet.

## Identities

The [proof](../../notes/240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md)
has SHA-256
`e8bf6be314dbde48a6495057f800de637534dbc7ec1c5b6d0c054514540770fa`.
It lists the three verified frozen inputs and all constant dependencies.
The [request](SP4-CME-E240_REQUEST_v1.md) has SHA-256
`473e5f66d3dadfc663be385a6478eb4f7085bb8564e2f3f578c09a0b18c50792`.
Only the named note and return were written.
