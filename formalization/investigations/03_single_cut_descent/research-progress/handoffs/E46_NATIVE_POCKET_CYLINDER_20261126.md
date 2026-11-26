# E46 · Central cylinder on the transported native disk

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and effort were unavailable. Bounded formalization packet on working HEAD `65f06eaac3ff5035ab48cdc77960fe210cf0d54b`, using the E45 working versions of the native compression, flattened endpoint and cap germs.

## Marking and tensor

The original full angular marking is the partial diffeomorphism $A(y,t)=F((1+t)y)$, with inverse signed height $\lVert F^{-1}(x)\rVert-1$ on its target. Where this chart is defined, the closed disk is $t\le0$, the complete closed exterior is $t\ge0$, and both contain the same face $A(y,0)=F(y)$. The oriented compression $\phi$ uses the prescribed forward and inverse identities on the full angular germ. Its forward image in the Euclidean chart is
\[
C(y,t)=\rho(t)y,\qquad \rho(t)=b\exp(t/\ell).
\]
The inverse preserves the direction $y$ and recovers $t=\ell\log(\lVert C(y,t)\rVert/b)$. [Module](../../../../SmoothPoincare/Variational/NativePocketCylinder.lean) · [Native compression](../../../../SmoothPoincare/Variational/NativeDiskCompression.lean)

Choose $a<b<c<R_{\mathrm{flat}}$ and extend $\log(\ell/\lVert z\rVert)$ from the closed annulus $a\le\lVert z\rVert\le c$ as a smooth function $u$ on the original manifold. A cutoff supported in the chart image of the punctured flat ball produces the extension. Since $\rho(0)=b$, a common closed signed subslab $[-d,d]$ with $0<d<\varepsilon$ lies inside the compression germ and maps into that annulus. For arbitrary tangent vectors $(Y,v),(Z,w)$, the radial and angular images under $dC$ are orthogonal, and the bilinear form is
\[
(\ell/\rho)^2\langle dC(Y,v),dC(Z,w)\rangle
=vw+\ell^2 g_{S^3}(Y,Z).
\]
Applying the differential identity from the open compression germ gives this same form for $A^*\phi^*(e^{2u}g_f)$ throughout the closed subslab. At $\ell=1$ it is `exactFaceRoundCylinder`. The width theorem computes the infimum of smooth path lengths within the marked image of every closed subinterval $[s,t]$ as $t-s$. [Physical transport calculation](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/notes/TRANSPORT_ON_THE_CHARGED_DISK.md) · [Intrinsic marked width](../../../../SmoothPoincare/PhysicalScales/MarkedProductWidth.lean)

## Same cap witnesses

`exists_nativePocket_matchedCylinderCaps` chooses one $u$, one $\phi$, one positive disk cap and one positive complete exterior cap at the actual positive endpoint of the native flattening. The stereographic logarithmic factor is computed from that same $u$. The cap metric germ along the whole closed disk, the complete exterior metric identification, the zero disk charge and the exact exterior charge are inherited in both signs. The exterior increment is the original complete disk charge plus the signed flattening increment. [Prior cap theorem](../../../../SmoothPoincare/Variational/NativePocketCaps.lean) · [Stereographic metric](../../../../SmoothPoincare/Variational/StereographicCapMetric.lean) · [Cap factor germ](../../../../SmoothPoincare/Variational/EuclideanPocketCapGerm.lean)

The result is at a single supplied index, conditional on the corresponding positive signed flattening endpoint. To identify $t$ with the original metric's physical Gaussian distance, supply the straightened chart with $F((1+t)y)=\exp^{g}_{F(y)}(t\nu_y)$ throughout a signed interval, for the original outward unit normal $\nu$ and unchanged face parametrization. The product calculation and intrinsic widths use the endpoint metric in their actual chart. The incoming unit normal and this collar extension remain a separate input. The second, angularly twisted inward slab and the production of positive flattening slices remain separate constructions.

## Shared reference and signed slice frames

`nativePocket_matchedCylinderCaps_of_reference` accepts the Euclidean reference used to define the supplied signed endpoint. The reference identity is required on the open ball of radius $2r$. This lets the volume, curvature and signed price estimates work with literally the same reference metric as the cylinder and both caps.

For each native metric, `nativePocketPath_frame` orthonormalizes the original oriented frames in the actual slice metric. It returns exactly the original basis off the changed closed ball. The intrinsic ordered Riemann norm controls both frame densities on that compact region, so local almost-everywhere strong measurability suffices for integrability there. The complement inherits integrability and both complete charges from the original metric and volume. The local inputs for the signed family are that measurability and conservation of the difference of the two integrated signed densities on the changed closed ball. Together with signature zero for the original metric they give signature zero for every slice. The local measurability and the first Pontryagin conservation for these densities remain explicit inputs to the Lean constructor. In the classical argument, the connection-pair transgression in Chern–Simons §3 preserves the full Pontryagin integral on the closed carrier, and Hirzebruch §4 (16) identifies its topological normalization. Equality of the exterior metric germs then localizes the signed equality to the changed closed ball. [Signed slice construction](../../../../SmoothPoincare/Variational/NativePocketSignedSlices.lean) · [Chiral normalization and Pontryagin source record](../../../../../references/SOURCE_NOTES_MASTER_BALANCED_DISKS_20261125.md)

## Measurability from the native chart

For the changed closed ball, the orientation sign of the chart differential is constant by connectedness. One fixed coordinate basis, with a single vector negated if needed, gives the supplied orientation after applying the chart differential throughout that ball. The pushed frame is smooth on the chart target. The actual metric's Gram–Schmidt normalization preserves the chosen orientation and is smooth on the ball. The exterior uses the original basis exactly. The frame over the entire manifold is assembled from these prescribed regions.

The ordered curvature components in the resulting frame are smooth on the changed ball, including at its boundary in the sense of smoothness on a set. Both chiral densities are continuous there because the Weyl compressions, trace removal and squared Hilbert–Schmidt norms are polynomial operations. Compactness yields the required almost-everywhere strong measurability in the actual metric volume. `exists_nativePocketSignedSlices_of_balance` consumes only the local signed balance for this frame. It returns the actual signed package at every native path parameter, with exact exterior bases and both complete exterior charges. [Measurable frame construction](../../../../SmoothPoincare/Variational/NativePocketMeasurableFrame.lean)
