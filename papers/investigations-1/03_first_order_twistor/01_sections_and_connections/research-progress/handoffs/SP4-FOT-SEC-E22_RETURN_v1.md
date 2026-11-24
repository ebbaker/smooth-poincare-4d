# SP4-FOT-SEC-E22 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper configuration was
gpt-6.2-sol / ultra. Actual backend model and effort are unavailable
for independent verification. The author-selected lead was retained,
with actual identifier and effort unavailable here.
[Request v1](SP4-FOT-SEC-E22_REQUEST_v1.md)

**Completed the single-degree Euclidean exterior calculation.**
For the quartic \(H\) and bounded symbol \(H(\xi)/|\xi|^4\), let
\(M_0=\int_{\mathbb R^4}\chi\,dx\) and
\(M_2=\int_{\mathbb R^4}|x|^2\chi\,dx\). The field is
\((6/\pi^2)(M_0\rho^{-4}-2M_2\rho^{-6})H(x/\rho)\) for
\(\rho\ge1/2\). The derivation uses
\(-\log\rho/(8\pi^2)\) and the exact spherical mean
\(\log\rho+t^2/(4\rho^2)\). Homogeneity fixes the Fourier
extension at \(\xi=0\), and the angular mean removes the
possible physical point mass. For nonzero \(H\), a signed
bump has identically vanishing exterior precisely when both
moments vanish. The stipulated positive bump has strictly
positive radial factor throughout the exterior.
[Derivation](../../notes/SEC_E22_20261124.md)

If \(H\) acts isometrically on \(S^3\) and the input is B16's
\(\chi Z\), the equatorial round-scaled norm is
\(6\sqrt6(M_0-2M_2)/\pi^2\), and the southern pole norm limit
is \(3\sqrt6 M_0/(2\pi^2)\). The southern squared \(L^2\) norm is
\((432/\pi^2)(M_0^2/4-2M_0M_2/3+M_2^2/2)\).
Identifying this abstract multiplier with the Weyl transmission
operator and identifying its angular isometry are separate B16
dependencies. [B16 decision](../../brainstorm/notes/SEC_B16_SPHERICAL_TRANSMISSION_20261124.md)

Observed HEAD e76752648b69969b1234d0295530c87fce9fcdcb and verified
all sixteen B16 working-file pins and all seven setup crosswalk
pins. The derivation identifies the B16 and E02 source passages.
The evidence is direct analytic calculation in the prescribed
normalization.
