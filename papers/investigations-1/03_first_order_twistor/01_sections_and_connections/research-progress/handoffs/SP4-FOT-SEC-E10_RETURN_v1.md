# SP4-FOT-SEC-E10 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [issued request][request] records
`gpt-6.2-sol` / `ultra` as the requested helper configuration. Actual
backend model identifier and reasoning effort were unavailable for
independent verification.

**Result.** For a supplied \(C^2\)-continuous path of smooth positive
metrics on the closed oriented homotopy four-sphere, fixed pointwise
volume \(dV_r\) and an isometrically transported Weyl block
\((1-t)W_r^+\) give \(E_+(g_t)=(1-t)^2E_+(r)\). Write \(E_0=E_+(r)>0\).
The strict Chang–Gursky–Yang energy range is
\(t>1-2\pi/\sqrt{E_0}\), relative to the supplied path. The connected
low-energy interval \(J\) given by \(E_+(g_t)<8\pi^2\) starts at the
strict inequality \(t>1-2\sqrt2\pi/\sqrt{E_0}\). On a unit-volume
Yamabe minimizer \(\widehat g_t\),
\[
 Y(M,[g_t])^2=48(8\pi^2-E_+(g_t))+
             12\int_M|\operatorname{Ric}_0(\widehat g_t)|^2dV_{\widehat g_t}.
\]
Thus the square root of the first term is a strictly positive lower
bound on \(|Y|\) in \(J\). The continuous first conformal-Laplacian
eigenvalue has the sign of \(Y\), which is constant on \(J\).

**Certificate.** One independently positive checkpoint in \(J\)
and a supplied \(t_{\mathrm{rec}}<1\) in the strict spherical energy
range imply \(M\cong_{\mathrm{diff}}S^4\) by Theorem A. A negative
checkpoint propagates the negative sign throughout \(J\), and the
gap with unknown sign supplies only nonvanishing. At \(E_+=8\pi^2\)
a scalar-flat Yamabe minimizer must be Ricci-flat. At \(E_+=4\pi^2\)
the sign gap still holds, with \(|Y|\ge8\sqrt3\pi\), and Theorem A
uses strict energy. A supplied zero-energy slice gives exact
recognition and a Yamabe-positive conformal class by SH-E01. This
includes zero initial energy or a supplied smooth \(t=1\) slice.
[Derivation][proof]

**Inputs and disposition.** Observed HEAD was
`e76752648b69969b1234d0295530c87fce9fcdcb`. All seven [crosswalk][crosswalk]
pins and the two SH prerequisite hashes matched. The request had
SHA-256 `fdc571ec1de6e397dbdfb073e230f2c57fc0a0e41a878764f8f20b1f88c73f85`.
The B01/B06 decision and [B09 decision][b09] hashes are given in the
proof. Primary checks on 24 November used the published texts of
Chang–Gursky–Yang, p. 107, Theorem A, eqs. (0.3)–(0.4), Remarks 1–2;
Schoen, pp. 479–480 and §3 Theorem 3, pp. 493–495; and Gover–Gursky,
pp. 293–294, Definition 1.1 and the signature formula. Lee–Parker,
§2, eqs. (2.6)–(2.7), p. 43 was checked for the conformal
scalar equation. The full source links are in the [derivation][proof].

The conditional question is resolved. Constructing a smooth path to
strict entry and supplying its positive checkpoint remain the
geometric premises. The lead owns assessment and integration in the
[SEC register][register].

[request]: SP4-FOT-SEC-E10_REQUEST_v1.md
[proof]: ../../notes/SEC_E10_20261124.md
[register]: ../REGISTER.md
[b09]: ../../brainstorm/notes/SEC_B09_SIGN_ALONG_RADIAL_PATH_20261124.md
[crosswalk]: ../../../brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md
