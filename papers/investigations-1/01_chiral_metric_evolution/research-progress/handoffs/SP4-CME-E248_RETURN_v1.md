# SP4-CME-E248 return v1 — Exact static cutoff at each fixed ratio

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B113, configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored the E236 audit, E240
cutoff construction and E243 near-round cap proof.

## Disposition

**Complete for each fixed finite \(r>1\).** In the prescribed model,
reflection through the hyperplane perpendicular to \(n\) gives
\(\Omega_i=-\tau_n^*\Sigma_i\), with wedge Gram \(-I\) in
units of \(2dV_{\rm e}\). The cross-chiral pairing vanishes, so
the exact wedge Gram of the model is diagonal with
\[
 M_i=(1+u(s_i-1))(1+(u+v/2)(s_i-1)),\qquad s=(p,1,q).
\]
It has a positive lower bound on the full parameter rectangle
for each fixed \(r\). All six ordered quotients satisfy the cap.
Only \(M_3/M_1\) can equal \(r=q^2/p^2\), and equality then
requires the corner \((1,0)\).

The actual curvature formula retains the difference bracket and
the radial derivative term. It converges uniformly to the model
with first \(u,v\) derivatives at order \(O_r(R)\) on the annulus.
The positive Gram floor transfers to the actual parameter
matrices and gives the corresponding normalized quotient convergence.
The corner log-ratio partial derivatives are strictly positive.
A fixed convex box retains the ordered spectral gaps and these
signs for small \(R\). Comparison along the straight segment from
\((1,0)\) thus gives the upper bound by the exact polynomial value
at that \(x\). The compact complement has a separate strict
model gap. The assessed local polynomial decreases strictly
throughout a sufficiently small fixed-\(r\) punctured ball.

The global cutoff therefore gives a smooth positive definite
round-compatible connection on the standard round chiral
bundle, with \(\sup\rho=r\) attained only at the center.
Its native log-ratio directional derivative there is \(1/2\).
All small radii and constants may depend on \(r\). This is a
static result for the prescribed cutoff, with no trajectory
or preservation claim.

## Frozen identities

The [proof](../../notes/248_FIXED_RATIO_RADIAL_MODEL_20261123.md)
has SHA-256
`c86c9768910aedfb0e117042a6b5f049dc5ee98aa7de8782904cc7f106f4dcf5`.
It records all five verified frozen inputs. The
[request](SP4-CME-E248_REQUEST_v1.md) has SHA-256
`21de1f066ec9d74e05252613a8e432b971d6964ebf6f502a59ec1c1fbfe1a8d9`.
Only the named note and return were written.
