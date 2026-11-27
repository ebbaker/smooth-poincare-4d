# FOT-E54 · Physical polar volume of the buffered Euclidean cap

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Route 13 bounded execution packet E54-V. The selected geometry, density calculation and test were fixed by E53. Actual serving model and effort were unavailable. Input checkout `b607bd17e79598edd18beb6d02f69fed80d72f4d`. [Live register](../research-progress/REGISTER.md) · [E53 construction](E53_BUFFERED_TRUNCATION.md) · [Lean proof](../../../SmoothPoincare/Variational/BourMeasuredBufferedCap.lean)

## Entire physical chart and the open cap

Let $0<r<b$. Write $G$ for the E53 smooth Riemannian metric on the standard smooth four-sphere, oriented outward-first, and $Q$ for its marked inverse stereographic chart, with source $\mathbb R^4$ and image the sphere minus the north pole. The retained closed hemisphere is $Q(\overline B_r(0))$. Define the native radius $\rho(p)=\lVert Q^{-1}(p)\rVert$ in the chart, using the total inverse function's value at the omitted pole. This measurable radius satisfies $\rho(Qz)=\lVert z\rVert$ for every $z\in\mathbb R^4$.

With
\[
 \lambda(\rho)=\exp\!\left[
   \operatorname{smoothTransition}(\rho^2/b^2-1)
   \log\!\left(\frac{2r}{r^2+\rho^2}\right)\right],
\]
E53 identifies $Q^*G=\lambda(\lVert z\rVert)^2\delta$ on the entire Euclidean chart. The logarithm of this factor is smooth even at the origin, since it depends smoothly on $\lVert z\rVert^2$. The conformal volume theorem in dimension four and local-isometry measure transport therefore give
\[
 dV_G=Q_*(\lambda(\lVert z\rVert)^4\,dz).
\]
The target of $Q$ omits a null singleton. The proof obtains nullity from the image-of-null-set lemma applied to a constant smooth map from $\mathbb R^4$. Thus the measure equality holds on the whole closed sphere. The same chart gives an almost-everywhere representation on the open cap $C=(Q(\overline B_r(0)))^c$ by $p=Qz$ with $\lVert z\rVert>r$.

## Native and physical radial measures

On the punctured Euclidean chart, the polar homeomorphism transports Lebesgue measure to the unit-link measure times $\rho^3\,d\rho$ on $(0,\infty)$. The link mass in this normalization is $2\pi^2$. Restriction to the physical cap selects native radii $\rho>r$, so the actual pushforward is
\[
 \rho_* (dV_G\rvert_C)
   = 2\pi^2\rho^3\lambda(\rho)^4\,
      (d\rho\rvert_{(r,\infty)}).
\]
E53 gives the strict increasing arclength $s(\rho)=\int_r^\rho \lambda(t)\,dt$ with derivative $\lambda(\rho)>0$ and image $(0,L)$ for $\rho>r$, where $L$ is the finite cap length. The one-dimensional Jacobian theorem applies on the preimage of every measurable test set. If a measurable profile satisfies $f(s(\rho))=\rho\lambda(\rho)$ throughout $\rho>r$, the resulting pushforward is
\[
 (s\circ\rho)_*(dV_G\rvert_C)
   = 2\pi^2 f(s)^3\,(ds\rvert_{(0,L)}).
\]
Both formulas include the transition $b<\rho<\sqrt{2}\,b$, where the cutoff varies. The arclength result supplies the physical measure field of `BourVariableCapPolar` for any smooth profile realizing this angular radius. The independent curvature calculation and its endpoint germs supply the remaining data for the direct $16\pi^2$ Euler integral. [Unit-link area](../../../SmoothPoincare/Variational/BourMarkedEnd.lean) · [Variable-profile Euler theorem](../../../SmoothPoincare/Variational/BourVariablePolarCap.lean) · [Scientific Euler calculation](../../../../papers/master/reviews/EULER_AND_CAP_READBACK_20261127.md)

## Verification

The targeted Lake build passed with Lean `v4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`, and Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. A downstream import instantiated the native volume theorem on the actual metric at $r=2$, $b=3$ and proved the mass formula for $(3,21/5)$, which contains $\rho=4$ and lies in the transition. The whole-chart, almost-everywhere coverage, native polar and arclength measure declarations depend on `propext`, `Classical.choice` and `Quot.sound`.

The geometric claim concerns the E53 Euclidean control and its concrete capped sphere. For a nonflat extracted Bour limit, constructing the differentiated ALE charts and the simultaneous cutoff and capped topology on one marked core remains a separate geometric input. [E52 hypothesis ledger](E52_CLOSED_CAP.md)
