# SP4-FOT-SEC-E37 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [issued request][request] records
`gpt-6.2-sol` / `ultra` as the requested helper configuration. Actual
backend model identifier and reasoning effort were unavailable for
independent verification.

**Result.** On the standard oriented smooth \(S^4\) with the fixed
marked round coordinate ball, the infimum of \(E_+\) over smooth
positive-definite metrics with Yamabe constant zero is \(8\pi^2\)
and is unattained. The norm is Hilbert–Schmidt on the self-dual
curvature endomorphism. The proof [records][proof] a marked
minimizing sequence with equal chiral energies \(8\pi^2+O(R^{-1})\)
and total \(L^1\) Bach norm \(O(R^{-1})\). Its smooth unit-volume
scalar-flat Yamabe representatives have
\(\int|\operatorname{Ric}|^2=4(E_+-8\pi^2)\to0\) and the same
total Bach norm, which is conformally invariant.

The E34 and E35 endpoints are put on their common
identity-marked double by a uniformly \(C^5\)-controlled axial
reparametrization of the positive neck, preserving the exact end
germs. Convex interpolation on fixed lifted charts preserves
uniform matrix positivity and \(C^4\) control. The scaled neck
has volume \(O(R^{-1})\), so its Weyl and Bach integrals are
\(O(R^{-1})\) uniformly along the path. A single
\(\varepsilon(R)\le\varepsilon_*/R\) is chosen in a common
unscaled core germ, small enough for the E34 positivity
comparison. The replacement and identical marking preserve
the negative test on the neck and cost \(O(R^{-4})\) in each
chiral energy and \(O(R^{-2})\) in the total Bach norm.
Continuity of the lowest conformal-Laplacian eigenvalue, with
both forms and measures compared, gives an exact Yamabe-zero
parameter for each \(R\).

For any oriented smooth homotopy sphere the same
Gauss–Bonnet and signature calculation gives \(E_+\ge8\pi^2\)
at Yamabe constant zero, with equality exactly for a
Ricci-flat conformal representative. The fixed round cap
excludes equality by Bach covariance and E24 continuation.
If the marked infimum on an arbitrary such sphere equals
\(8\pi^2\), it is therefore unattained. The construction of
sharpness here uses the known standard smooth sphere.
On that sphere the unmarked infimum is also \(8\pi^2\), with
attainment equivalent to existence of a smooth Ricci-flat
metric. Unmarked attainment is unresolved in this packet.
E31's small-Bach variant excludes cap-surviving uniformly
positive same-manifold \(C^4\) compactness for this sequence.

**Verification.** Observed HEAD was
`e76752648b69969b1234d0295530c87fce9fcdcb`. All pins in the
setup crosswalk and the B16, B19, B21 and [B23][b23] manifests
matched, including all eight B23 proof inputs. The E37 request
SHA-256 was
`b462071a0d204604507b46b3ebd73da0c5b520e9fb1ca50659c06c4cb114e465`.
On 24 November 2026 the selected primary checks used Schoen
§3 Theorem 3, Lee–Parker §2 eqs. (2.6)–(2.7),
Chang–Gursky–Yang p. 107 Remark 2 and eq. (0.4), and BGI+M
arXiv:2508.06633v1 §1 for the Bach weight. The exact sources
and earlier proof inputs are linked in the [proof][proof].

The bounded proof is ready for the distinct E38 audit. The
lead owns integration into the [SEC register][register].

[request]: SP4-FOT-SEC-E37_REQUEST_v1.md
[proof]: ../../notes/SEC_E37_20261124.md
[b23]: ../../brainstorm/notes/SEC_B23_EXACT_ZERO_SIGN_INFIMUM_20261124.md
[register]: ../REGISTER.md
