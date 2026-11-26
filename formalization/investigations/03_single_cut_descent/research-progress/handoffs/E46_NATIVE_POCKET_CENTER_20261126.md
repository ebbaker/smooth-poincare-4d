# FOT-E46 · Center normalization inside the original marked disk

26 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable. This bounded execution uses a smooth four-dimensional
Riemannian source, its actual disk chart, and the center-value hypothesis
of the existing physical coefficient estimate. Intake HEAD
`65f06eaac3ff5035ab48cdc77960fe210cf0d54b`. The working
`NativePocketFlattening` input SHA-256 prefix was
`d768a96c9ebe`. The pinned DifferentialGeometry inputs were
`MetricSignature` and `RelativeCollarIsotopy` at
`788efe97894474c032de6dfb1289d515f613d15a`.
[E45 pocket comparison](E45_EUCLIDEAN_POCKET_CAP_GERM_20261126.md)
· [Native coefficient estimate](../../../../SmoothPoincare/Variational/NativePocketFlattening.lean)

Let \(B=F^*g(0)\) be the Gram form of the incoming metric in its original
marking. The differential of \(F\) at zero is invertible, so \(B\) is
symmetric positive definite. The Euclidean Riesz operator of \(B\)
has an orthonormal eigenbasis and positive eigenvalues \(\lambda_i\).
In this basis \(A\) multiplies the \(i\)-th coordinate by
\(\lambda_i^{-1/2}\), giving
\[
B(Av,Aw)=\langle v,w\rangle,\qquad
\langle Av,v\rangle>0\quad(v\ne0).
\]
The straight line \((1-t)\operatorname{id}+tA\) is injective for every
\(t\in[0,1]\), since its inner product with any nonzero input is positive.
The pinned compact relative isotopy extends this family near the singleton
\(\{0\}\) with support inside the prescribed ball of radius \(r\), for
every \(0<r<1\). Its endpoint \(J\) fixes the center, has germ \(A\) there,
and agrees with the identity in both directions off a compact subset
of that ball. A point on the unit rim has identity differential on an
open neighborhood, which proves orientation preservation for every
supplied orientation on the connected Euclidean carrier.

`SmoothPoincare.exists_nativePocketCenter_normalizedChart`
returns \(F'=F\circ J\) with exactly the old chart source, closed unit
disk image, and center point. The actual chain rule gives
\(dF'_0=dF_0\,A\) and \(F'^*g(0)=g_{\rm Eucl}(0)\) simultaneously in every
coefficient. `SmoothPoincare.nativePocketCenter_chartTargetAndRim`
gives the same target, and equality of both forward and inverse
germs at every chart point of norm greater than \(r\). Since the
incoming metric itself is fixed, the old angular and Gaussian normal
data on any supplied rim neighborhood remain valid on its intersection
with this exterior annulus.

Using the returned marking to select the Euclidean reference and keep
the marked disk fixed supplies the center-value premise of the
inverse-radius coefficient Hessian estimate. A first-jet match requires
a further chart or metric argument. The frame curvature estimate and
the positive-slice and signed-cost conclusions use their separate
inputs in the physical package.
[Lean leaf](../../../../SmoothPoincare/Variational/NativePocketCenter.lean)

The targeted Lake build completed 9,912 jobs without warnings. A direct
Lean readback selects support radius \(1/2\), then applies the two
theorems to the same chart. The application checks the unchanged
closed disk and target, every center coefficient, and both germs
on the whole original unit rim. Both public axiom reports contain
only `propext`, `Classical.choice` and `Quot.sound`. The leaf SHA-256 is
`c2274b58de83731c23dd01701acc952526fb251e311fcc56331291a3bb5df365`.
The temporary replay source and output SHA-256 prefixes are
`16fc55c4c811` and `85f78085ce50`.
