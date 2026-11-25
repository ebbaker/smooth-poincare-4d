# How much geometry does Dirac transmission need on a surgery collar?

Prepared for Edward B. Baker III with OpenAI Codex assistance,
25 November 2026 (America/New_York). The exact serving model and
reasoning effort are unavailable. This is a scoping note with a
first-order model calculation for fixed spectral boundary conditions.

## Which hypotheses can be relaxed?

Consider a supplied smooth, oriented Riemannian spin collar with
cross-section \(S^3\) and a specified rescaling and conformal gauge.
In the eventual surgery application a cut will join a retained region
to a standard \(D^4\) cap. A useful first question is whether spinor
data can be compared or matched across the collar with estimates that
survive a degenerating family. The collar may have nonzero Weyl
curvature. One can formulate the ordinary Dirac equation directly
from its metric and spin structure.

[DIR §4.1](../../../manuscript/dirac_twistor_and_yamabe_rigidity.tex)
uses a flat germ at the **puncture of the capped manifold** and an
invertible compact Dirac operator. The flat germ gives the exact Green
pole expansion and, after inversion, the Euclidean end on which the
harmonic spinor approaches a prescribed constant. A conformally flat
region inside a model cap can supply that germ after a smooth conformal
change. Positive Yamabe sign on the capped class gives invertibility
by the Schrödinger–Lichnerowicz formula and conformal covariance.
Quantitative estimates in the chosen collar gauge require control of
the conformal weights as well. The exact insertion of DIR §10.1 uses a
conformally flat overlap for its conformal-class identity. The Dirac
boundary estimates below start from the given collar metric.
[Supplied-collar note, “Construct controlled boundary data”](../../../../01_sections_and_connections/01_neck_geometry/brainstorm/notes/USING_A_SUPPLIED_COLLAR_20261125.md#construct-controlled-boundary-data)

## First test with a reference round cylinder

On \(I\times S^3\), \(I=[a,b]\), compare \(h\) with
\(h_0=dt^2+\gamma_{S^3(1)}\). Use the symmetric frame isometry to
identify the spin bundles for \(h\) and \(h_0\), as in [DIR
§3.3](../../../manuscript/dirac_twistor_and_yamabe_rigidity.tex).
Identifying the target chirality with the source by inverse normal
Clifford multiplication for the reference, the model is
\(L_0=\partial_t+A\), with \(A\) the tangential Dirac operator in
this normal convention. Its spectral gap is \(3/2\). Prescribe the
positive spectral trace \(P_+u(a)\) at the left end and the negative
trace \(P_-u(b)\) at the right end, where \(P_\pm\) project onto the
corresponding eigenspaces of \(A\).
[Bär, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf)

For homogeneous prescribed traces, integrating the cross term gives
\[
 \|L_0u\|_2^2=\|\partial_tu\|_2^2+\|Au\|_2^2+
       \langle u(b),Au(b)\rangle-\langle u(a),Au(a)\rangle .
\]
Here the boundary pairings are on \(S^3\), with the trace understood
by continuity from smooth spinors. Both signed boundary terms are
nonnegative on this domain. The gap and the fixed tangential elliptic
estimate give \(\|u\|_{H^1}\leq C\|L_0u\|_2\) independently of
\(|I|\). One solves each eigenmode from its prescribed end using
the decaying exponential kernel. Finite spectral sums and the
estimate then give the inverse for \(L^2\) forcing.

For \(|I|\geq 2\), write \(k=h-h_0\). A candidate smallness hypothesis
in this gauge is
\[
 \varepsilon=\|k\|_{L^\infty(I\times S^3)}
       +\sup_{B}\|\nabla^{h_0}k\|_{L^4(B\times S^3)}\ll1 ,
\]
where \(B\) ranges over subintervals of lengths between one and two
in \(I\), and the reference measure and tensor norms are used.
The identified operator \(L_h\) has a principal coefficient
difference bounded by \(C|k|\). Its zeroth-order coefficient
difference is bounded by \(C(|k|+|\nabla^{h_0}k|)\).
This is the first-order comparison in DIR §3.3 applied on the
cylinder. Hölder and the uniform slab embedding
\(H^1\hookrightarrow L^4\), followed by summation over a partition
into slabs of those lengths, give
\[
 \|(L_h-L_0)u\|_2\leq C\varepsilon\|u\|_{H^1}.
\]
The reference inverse thus gives a perturbative inverse on the same
fixed boundary domain for sufficiently small \(\varepsilon\), with
a uniform \(H^1\) estimate. Given \(H^{1/2}\) prescribed spectral
traces, one can lift them in fixed-width end strips and apply the
inverse to the remaining forcing. The constants in this calculation
are independent of collar length. Smoothness is assumed here,
with only \(L^\infty\) and local \(W^{1,4}\) smallness entering
the operator comparison.

## Beyond comparison to a round metric

If a slice description and a unitary identification of the slice
\(L^2\) spaces are available, test whether the identified Dirac
operator has the form \(\partial_t+A_t+B_t\), with \(A_t\)
self-adjoint and with a controllable remainder \(B_t\). The energy
identity for \(\partial_t+A_t\) then has the extra term
\(-\int_I\langle u,(\partial_t A_t)u\rangle\,dt\).
A uniform tangential spectral gap, uniform tangential elliptic
estimates, and a bound
\[
 |\langle u,(\partial_t A_t)u\rangle|
     \leq \theta\|A_tu\|_2^2,\qquad \theta<1 ,
\]
would give a candidate coercivity estimate with spectral
projections at the endpoints. A sufficiently small \(B_t\) could be
absorbed. This allows the link metric to vary and motivates checking
the boundary domains, the complementary adjoint problem, and exactly
what the metric evolution of the slices supplies. With small or
zero eigenvalues, one can instead ask how many modes need explicit
transmission estimates. Even a single zero mode on a long product
has only \(\partial_t\) as its model operator, so its inverse can
grow with length.

## Actual gluing and Weyl energy

In a surgery problem, the admissible traces are determined by
solutions on the adjoining regions. The fixed model projections
provide a test for the collar operator. The next boundary question
is whether the collar solution can be matched to those interior
trace spaces with a uniform estimate, accounting for any kernels
and the normalizations at the cap poles. If only the cut is needed,
the comparison can be tested first on a fixed-width buffer around
the chosen cross-section.

Using these fields to estimate curvature requires additional
information. With \(T=P_h\psi\), [DIR
§2.3](../../../manuscript/dirac_twistor_and_yamabe_rigidity.tex)
gives
\[
 |\Pi(d^\nabla T)^+|^2
   =\tfrac12 |W_h^+|_{\mathrm{HS}}^2|\psi|^2 .
\]
One needs control of the differentiated defect and of the spinor
norm in the same gauge. On the exact cylinder a harmonic field
with bounded incoming traces can be exponentially small in the
middle. Local normalization or several independent fields, with a
uniform lower bound on their sum of squared norms, are candidates
to test. DIR §4.4 exhibits zero-free normalized Green fields
with small first-order twistor error and growing Weyl energy.
Any use of the identity over a long collar also needs a bound
on the total squared defect, since errors on individual slabs
can accumulate.

The initial test is to verify the fixed-projection comparison and
then quantify the matching with cap traces. Compare the resulting
metric and spectral hypotheses with what the [neck extraction
problem](../../../../01_sections_and_connections/01_neck_geometry/README.md)
can supply. A successful matching estimate would extend the use of
the Dirac construction to more candidate collars. A neck-energy
argument would additionally have to supply the derivative and
normalization estimates above.

## Inputs inspected

- [Dirac manuscript](../../../manuscript/dirac_twistor_and_yamabe_rigidity.tex),
  §§2.3, 3.3, 4.1, 4.4 and 10.1, at source commit `0a0abde`.
  SHA-256 `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`.
- [Supplied-collar note](../../../../01_sections_and_connections/01_neck_geometry/brainstorm/notes/USING_A_SUPPLIED_COLLAR_20261125.md),
  “What the Dirac manuscript supplies after the cut”, at `f6e10f0`.
- [Bär, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf),
  round sphere of sectional curvature one. The [reference
  catalog](../../../../../../../references/README.md) records this as R52.
