# SP4-CME-E249 return v1 — Independent fixed-ratio radial model audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E verification under B113, configured gpt-6.2-sol / ultra. Independent runtime attestation and selected lead settings are unavailable. I authored E244, E246, E237 and E241, and independently checked this fixed-ratio static model without reading E248. [Detailed review](../../reviews/E249_FIXED_RATIO_RADIAL_MODEL_AUDIT_20261123.md)

## Disposition

Pass. For each fixed finite \(r>1\) and all sufficiently small radii depending on \(r\), the prescribed smooth cutoff on the supplied standard oriented round \(S^4\) and positive chiral bundle gives a positive definite round-compatible connection with maximum ratio exactly \(r\), attained only at its center \(x_0\).

For the reflection negating \(n\) and fixing \(n^\perp\), the reflected anti-self-dual triple is its pullback of the self-dual triple with common sign minus. Its wedge Gram is \(-I\) relative to \(2dV_{\rm e}\). The full model Gram is exactly diagonal with \(M_i=(1+u\delta_i)(1+(u+v/2)\delta_i)\), \(\delta_i=s_i-1\) and \(M_2=1\). Both factors are positive on the full rectangle. All six quotients check, with \(M_3/M_1=r\) only at \((1,0)\). At that corner the two log-ratio derivatives are \(2(1/p-1/q)>0\) and \((1/p-1/q)/2>0\).

The exact annular curvature and its two parameter derivatives converge uniformly to the angle-dependent two-form model at \(O_r(R)\). The Gram floor carries this to normalized quotient and derivative convergence. The actual simple gaps and positive derivatives persist on a closed convex corner. Segment integration compares there to the exact uncut value, which is strictly lower than \(r\) away from the center by E235 at this fixed \(r\). A compact complement of a relatively open neighborhood of \((1,0)\) has a strict model gap and allows a uniform comparison without simplicity. The patched connection keeps positive planes and round-compatible sign. Exact agreement of germs retains the native instantaneous log-ratio derivative \(1/2\).

This is a static result on the fixed standard sphere, with all radius and perturbation constants allowed to depend on \(r\). No trajectory, preservation, global lifetime, or all-ratio basin claim enters.

## Integrity

All five frozen inputs matched. Only this return and the assigned review were written.

- [Request v1](SP4-CME-E249_REQUEST_v1.md) SHA-256 9ed843fe6c5762402333cb189402236110ad9001f302eb91ad1df30dee488e39.
- [Independent review](../../reviews/E249_FIXED_RATIO_RADIAL_MODEL_AUDIT_20261123.md) SHA-256 fbb09ae0835de9de37415fcfa05470e84ac55601a9056a2c9f9e5d5b5c2c17d0.
