# SP4-FORM-IMM-E01b · Saturation at the lower induced-energy threshold

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet on the equality case of the geometric energy
split. The actual serving model and reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Immersions/EndpointSaturation.lean)

`SmoothPoincare.indexedHeight_endpoint_saturation` uses the same actual
positive Weyl density and Riemannian volume as the indexed energy split.
The indexed mean identity, pointwise comparison on the open middle locus
\(U\), and almost-sure count floor are explicit inputs. With a continuous
middle deficit on \(U\) and \(E_+\le64\pi^2/9\), it returns the conclusions

- \(E_+=64\pi^2/9\) and the energy integral over \(U^c\) vanishes.
- The middle signed Gauss integral equals \(\omega=8\pi^2/3>0\), so \(U\)
  is nonempty.
- The pointwise comparison \(|W^+|^2_{\rm HS}\ge(8/3)\det A\) saturates
  at each point of \(U\), and the middle count is two almost surely.

The split forces each of its three nonnegative terms to vanish at the
endpoint. The nonnegative middle deficit therefore vanishes almost
surely in the restricted Riemannian measure. The pinned theorem
`riemannianVolumeMeasure_isOpenPosMeasure` and the continuity hypothesis
let `Measure.eqOn_open_of_ae_eq` upgrade this equality throughout \(U\).
The count conclusion uses integrability and the nonnegative count
excess over two. [Indexed split](../../../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_INDEXED_BUDGET.md)

This supplies the equality premise for a Codazzi obstruction on a
nonempty open set of middle signature. A geometric application still
requires the indexed Gauss identity, smooth handle floor, the link to
principal curvatures, and the argument excluding open saturation.
Those dependencies determine whether the inclusive lower threshold
implies recognition. [Immersion argument](../../../../../papers/master/manuscript/immersion_entry.tex#L91) · [Route plan](../../research-plan/PLAN.md)

## Inputs and verification

The shared checkout advanced from `9c579f0126ce` to `483ad3cef5a0`.
The geometric split checked in HT-E02a matches the latter commit at
SHA-256 `73763265b0d7349ede45ab3e79831670919863d35dfd44432d9dddb528584205`.
The manifest retained SHA-256 prefix `839111aae86b6935`. The volume
comparison comes from pinned
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`,
`Analysis/Integration/Measure/Riemannian/Properties.lean`. The
almost-everywhere upgrade uses Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`,
`MeasureTheory/Measure/OpenPos.lean`.

The module passed `lake build +SmoothPoincare.Immersions.EndpointSaturation`
on Lean `4.35.0-rc3` and Lake `5.0.0-src+470d5ce`. A separate import
checked the declaration and reported only `propext`, `Classical.choice`
and `Quot.sound`.
