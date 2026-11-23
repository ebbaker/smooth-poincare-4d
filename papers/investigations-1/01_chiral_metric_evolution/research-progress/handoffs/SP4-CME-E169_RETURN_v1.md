# SP4-CME-E169 return v1 — Independent combined compactness audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B85, configured
`gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers
are unavailable. I authored inherited E165 and E162 and contributed
to downstream dependencies as disclosed in the [audit][audit]. The
independent check concerns E168's new unscaled construction and its
combination. I did not author E168.

## Disposition

**Pass conditional on \(H_{\rm pre}\), as frozen.** No mathematical
defect or repair was identified.

- Specializing E165 to \(p=8,m=2,\eta=1\) supplies exactly the
  assumed pre-ALE limit. The E164 theorem and remark give the
  smooth oriented ALE end. E162 then applies to the full radial
  truncation embedded by the extraction premise.
- The finite positive harmonic charts and persistent overlaps
  give \(C^{3,1/3}\) transition convergence by two interior
  Schauder estimates. The cutoff coordinate embeddings give a
  uniform separation bound and a tube radius selected before
  the smooth reference member. The segment Hessian lower bound
  and exact estimate
  \(\|Dq-I\|\le4L(1+LC_b)\delta<1/2\) both check.
- Separation and the local inverse estimate give global
  injectivity. The compact open image is the whole connected
  reference. Orientation and smoothness hold for the inverse
  maps. Their local derivative convergence gives the positive
  strong \(C^{1,1/4}\) metric limit and weak \(W^{2,8}\)
  convergence on the fixed smooth base.
- The native volume is constant by \(3dV_g=\langle F_A\wedge
  F_A\rangle\), Bianchi and Stokes. The E159 constants
  \(k^2=4\pi/5\), \(B=(1+4\sqrt3)P_0/k^2\),
  \(Z_0=\sqrt6/2+(42+8\sqrt3)B\) and
  \(K_{\rm Ric}=3+(2+2\sqrt3)Z_0\) check, with
  \(|W^+|_{\rm op,HS}\le Z_0\) and
  \(|T|+|\nabla^AT|\le\sqrt B+B\).
  On the simultaneous late sequence the fixed-bundle lifts,
  floor-free positive pair limit and original extension satisfy
  the assessed topology and sequential hypotheses.

E168 retains its historical conditional premise. Lead discharge
of \(H_{\rm pre}\) is separate. No shared file was edited and no
source was newly searched or inspected.

## Verified versions

| File | SHA-256 |
| --- | --- |
| [E169 request v1][req] | a5c85f2e3aadaec2d4658a6a05712f58624c6bb4f0f9f50713c44301d2a036aa |
| [E168][e168] | 110a1dfe4f288f82e93db40aace8972efe5aa02a3b61f6d96ab832e3aebda487 |
| [B85][b85] | e770687740c0a936fbfcef433b91ab8b9156ab8be9ddc6293cfa852e9814444e |
| [E165][e165] | 3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2 |
| [E164 source check][e164] | 5d8e17d8388945c0f8b5ab8622ca8c58d3d274d626ed9aa321b8d5b384972502 |
| [E162 assessment][e162a] | 2af867adb243f960c689967a443dc8d78279c38cd6b0c7afe4b4b611a0ab4345 |
| [E157–E159 assessment][geoma] | b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52 |
| [E159][e159] | eb5a66fc93fcf8e04e41870caa426e09399944be2a302b008befffb513851156 |
| [E169 audit][audit] | 57a28fb97f88807273140f5dc948c9d7f1d9c3b13941c0698aec1782fcc1bf01 |

[req]: SP4-CME-E169_REQUEST_v1.md
[audit]: ../../reviews/E169_COMBINED_METRIC_COMPACTNESS_AUDIT_20261122.md
[e168]: ../../notes/168_CONDITIONAL_METRIC_COMPACTNESS_CRITERION_20261122.md
[b85]: ../../brainstorm/notes/B85_METRIC_COMPACTNESS_COMBINATION_20261122.md
[e165]: ../../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md
[e164]: ../../reviews/E164_RICCI_FLAT_ALE_SOURCE_CHECK_20261122.md
[e162a]: ../../reviews/E162_ALE_CORE_TOPOLOGY_ASSESSMENT_20261122.md
[geoma]: ../../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md
[e159]: ../../notes/159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md
