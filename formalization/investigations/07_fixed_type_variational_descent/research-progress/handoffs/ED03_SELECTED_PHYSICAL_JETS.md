# Edition 03 · Native jets on the selected physical trim

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. `SP4-FORM-DESC-E06a` is a bounded proof packet.
The selected working base was `5706ef811adc3691fd85e75507a0a399cb81d18d`.
The worker's independent serving model identifier and reasoning effort were
unavailable. [Route 07](../REGISTER.md) ·
[Prior assessment](../../../reviews/END_HANDLEBANDS_AND_FOUR_MEASURE_DIVISION_20261125.md) ·
[Checked leaf](../../../../SmoothPoincare/Variational/SelectedPhysicalJetControl.lean)

## The cutoff and its jet prices

Use the same marked outer ball chart \(F\) and the same width
\(w=1/(n+1)\) as in `eventually_protectedFourMeasureTrim`. With the fixed
smooth transition \(\phi\) from zero to one on \([0,1]\), set
\[
 p_w(x)=\frac{1+w-|x|^2}{2w},\qquad \chi_w(x)=\phi(p_w(x)).
\]
The step is smooth at the center. It equals one where \(|x|^2\le1-w\)
and zero where \(|x|^2\ge1+w\). The width buffer permits extension to the
physical source by \(\chi_w\circ F^{-1}\) on the target and zero outside it.
`exists_selectedMarkedRadialCutoff` gives the smooth extension, its range,
exact native pullback and vanishing on the whole complement of the marked
closed disk and trim. At a protected width the chart radius of every core
point is at most \(1-w\), so the step equals one on the core. A splice with
weight \(t\chi_w\) can change the core unless its reference metric agrees
there. [Protected width](../../../../SmoothPoincare/PhysicalScales/ProtectedMarkedTrims.lean)

`fderiv_selectedRadialCutoff_apply` and
`fderiv_fderiv_selectedRadialCutoff_apply` compute the actual derivatives
along fixed directions \(u,v\), with \(p=p_w(x)\).
\[
 D_u\chi_w=-\phi'(p)\frac{\langle x,u\rangle}{w},\qquad
 D_vD_u\chi_w=\phi''(p)\frac{\langle x,u\rangle\langle x,v\rangle}{w^2}
        -\phi'(p)\frac{\langle v,u\rangle}{w}.
\]
The derivative bounds over the unit transition interval and the constant
regions give universal constants \(C_1,C_2\) for the fixed four-dimensional
model and its pinned `chartModelBasis`. The chosen basis has an operator norm
bound, which is included in those constants. On the whole native trim the
first derivative bounds are \(2C_1/w\) and the second derivative bounds are
\(4C_2/w^2+C_1/w\). The proof of
`exists_selectedRadialCutoff_radial_deriv` gives a radial line point strictly
between \(1-w\) and \(1+w\) where the derivative equals \(-1/(2w)\). This
inverse-width dependence is present in a flat marked annulus as well.

## The measured coefficient commutator

`selectedTrimPullback` restricts the original measure to the entire physical
trim and pushes it back by the inverse marking. `ae_selectedTrimPullback`
verifies that this measure lies on the actual native radial band. For the
incoming physical volume $\mu$ in these coordinates, let $G,B$ be the same
scalar Gram coefficient of the incoming and reference metrics. Put
\(d_0=\|B-G\|_{L^2(\mu)}\) and
\(d_j=\|\partial_j B-\partial_j G\|_{L^2(\mu)}\). The Hessian commutator
of the coefficient splice \(G+t\chi_w(B-G)\) satisfies
\[
 \|R_{mi}(t)\|_{L^2(\mu)}\le t\left[
  \left(\frac{4C_2}{w^2}+\frac{C_1}{w}\right)d_0
       +\frac{2C_1}{w}(d_m+d_i)\right],\qquad 0\le t\le1.
\]
The terms arise respectively from \(\partial_m\partial_i\chi_w(B-G)\),
\(\partial_i\chi_w\partial_m(B-G)\) and
\(\partial_m\chi_w\partial_i(B-G)\). The proof applies the cutoff bound to
each measured product, then uses the \(L^2\) triangle inequality and the
exact factor \(t\). `exists_selectedRadialSpliceSecondPartialError_on_physicalTrim`
specializes the measure to the incoming Riemannian volume and proves the
mismatch terms are in \(L^2\) for smooth coefficients on that finite source.
[Underlying Hessian identity](../../../../SmoothPoincare/Variational/ChartSpliceJets.lean)

`exists_selectedMarkedMetricLift` constructs smooth model metrics agreeing
with the true metric pullback by \(F\) on a neighborhood of the entire
buffered ball. Its proof composes both chart derivatives and uses the local
inverse identity. Applying it to each metric, `selectedMarkedMetricLift_chartGram`
identifies the lift's `chartGramOnE` with the coordinate Gram coefficients in
that chart, and `contDiff_selectedMarkedMetricLift_chartGram` supplies the
smoothness inputs. The bound uses physical volume of the incoming metric,
so no flat coordinate-volume approximation is needed for this commutator.

## Scope of the repair test

For shrinking widths at a fixed positive path parameter, controlling the
commutator requires actual mismatch estimates relative to \(w^2\) and \(w\)
in addition to the four raw masses. For chiral energy, the lowered-curvature first-jet quadratic
remainder also requires inverse Gram and first-jet comparisons. The
moving chiral compression, density conversion to the compared volume,
retained band and full exterior accounting must still be supplied for
both signs. A usable repair also needs the signed core saving, the charged
matched cap and positive Yamabe sign at the same width. The first-derivative lower bound measures
the cutoff itself. Any curvature increment also depends on the splice
mismatch and its derivatives.
[Quadratic first-jet remainder](../../../../SmoothPoincare/Variational/SpliceRemainderL2.lean) ·
[Moving chiral frames](../../../../SmoothPoincare/Variational/MovingChiralFrame.lean) ·
[Signed comparison](ED03_SIGNED_COLLAR_REPAIR.md)

## Pinned verification

Lean `4.35.0-rc3`, mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`,
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.
The input SHA-256 prefixes were `4e356dda0d8ecb0f` (`ChartSpliceJets.lean`),
`d534a0886701062c` (`SpliceRemainderL2.lean`), `18c91f73b8196799`
(`MovingChiralFrame.lean`), `e07087c7e562db9e` (`FullDiskTrims.lean`),
`27a392ed20c4c96a` (`ProtectedMarkedTrims.lean`), `65c76bc676af0725`
(`core_variation.tex`) and `96ec25cd36bf5d31` (`balanced_exterior.tex`).

`lake build +SmoothPoincare.Variational.SelectedPhysicalJetControl` passed
(9.0 s for the leaf). A separate `lake env lean` import replay checked
`#print axioms` for the eleven named derivative, cutoff, measure,
commutator and lift theorems. Each reports only `propext`,
`Classical.choice` and `Quot.sound`. Leaf SHA-256
`a22335277211ad9150c96dcf68977272471e4f6d02864eec5f61d62cc44df995`.
