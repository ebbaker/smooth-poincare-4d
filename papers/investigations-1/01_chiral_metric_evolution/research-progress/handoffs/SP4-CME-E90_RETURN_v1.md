# SP4-CME-E90 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored the inherited
E02C and E84 inputs. [Request][req]. [Derivation][note].

## Disposition

Under the assessed smooth-neighborhood assumption
\(A_{\rm in}\in\mathcal W\) and
\(\ell=\|T(A_{\rm in})\|_{L^{4,1}(g^{\rm F}_{A_{\rm in}})}
\le\ell_*\), write \(g\) for the initial reconstructed
metric and \(h\) for the smooth limiting round pullback.
With \(D=4512\sqrt2\,C_{\rm budget}\ell\), E14 and the
smooth limit in the original identification give
\[
 e^{-D}h\le g\le e^D h,\qquad
 e^{-D}I\le Q(A_{\rm in})\le e^D I,\qquad
 dV_g=dV_h .
\]
The exact volume equality uses the unadjusted pointwise
volume identity. Under any internal isometry the limiting
\(Q\) is \(I\) by conjugation. Metrics satisfy these same
inequalities at either scale and the budget is unchanged.
The native metric is \(c=2K\) times normalized, with
native round curvature \(1/2\) and normalized round
curvature \(K\).

Distance and diameter compare by \(e^{\pm D/2}\), with
scale factor \(\sqrt c\) between normalizations. Every
scalar eigenvalue with multiplicity compares by
\(e^{\pm D}\) by the Rayleigh min–max principle on a
common form domain and common \(L^2\) measure. The change
from normalized to native multiplies eigenvalues by \(c^{-1}\).
A supplied round inhomogeneous \(L^4\) inequality with
gradient coefficient \(C_\nabla\) and squared \(L^2\)
coefficient \(C_2\) transfers with coefficients
\(e^D C_\nabla,C_2\) at the same scale. Native scaling
leaves \(C_\nabla\) unchanged and divides \(C_2\) by \(c\).
The identical volume form removes extra density factors
in both arguments.

Zero strain in these hypotheses gives a stationary round
pullback of the reference connection. The derivation
gives no general positive-strain curvature or injectivity
bound, higher coordinate derivative control, or extension
beyond \(\mathcal W\) and its stated threshold. No new
primary source was inspected or needed. Only the named
note and return were edited.

## File identities

All five frozen input digests matched when consumed.
The B52 digest records the observed decision.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E90_REQUEST_v1.md | `e58e895d0ef9dc2b465876f31b36fc5f1d8f028cf259bdaacedbb3e854568f04` |
| B52_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md | `58fdea26948421c2137a7e1d3268e1d85c48ee0e920fe34152563ad2ea60e27b` |
| 16_TEMPORAL_STRAIN_CRITERION_20261122.md | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| 04C_VOLUME_AND_JETS_20261122.md | `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838` |
| 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md | `fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9` |
| E84_E86_INTRINSIC_ORBIT_ASSESSMENT_20261122.md | `1c8976f6678234480e163a5ddce106e916880426e7ec71b8afee03e019864f27` |
| chiral_curvature_and_metric_evolution.tex | `02ae44f97f59670272c326d5d3675482228b9799e89beafc6258e5454f709901` |
| 90_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md | `6d67f6bc601df3dc0940ee8815be30f26c83c2849f6153913deb61569ef69395` |

[req]: SP4-CME-E90_REQUEST_v1.md
[note]: ../../notes/90_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md
