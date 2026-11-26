# Sixth-power interpolation on a compact cutoff

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and reasoning effort were
unavailable. Bounded E51 Route 13 calculation at intake HEAD
`1c81a3048c8c21a4c1d1fb23db72f37168a15ca5`, using the pinned
Mathlib Euclidean Fréchet integration-by-parts theorem. The weighted
estimate supplies one directional term for localization of the
stationary Ricci equation. [E51 packet](../../research-progress/handoffs/ED06_E51_PACKETS_20261126.md) ·
[Stationary harmonic-coordinate calculation](E49_HARMONIC_INTERIOR.md) ·
[Earlier quartic cutoff argument](../../../FirstOrderTwistor/BufferedInterpolation.lean)

Fix a finite-dimensional real Euclidean space with its additive Haar
measure \(\mu\). Let \(\eta\) be a compactly supported \(C^1\) scalar
cutoff and let \(K=\operatorname{supp}\eta\) be its topological support.
For one fixed direction \(e\), suppose \(u\) is \(C^2\) near each point
of \(K\), \(|u|\le U\) and \(|D_e\eta|\le C\) there. The local
regularity suffices even for a total representative \(u\) that has
arbitrary values away from \(K\). Write \(v=D_eu\) and \(w=D_e v\).

The \(C^1\) flux \(\eta^6v^5\) and its directional derivative have
support in \(K\). All three products in the Euclidean integration by
parts are integrable because they are continuous on \(K\), vanish
off it and have compact support. The identity is
\[
 \int(\eta v)^6\,d\mu
 =-\int u\bigl[6(D_e\eta)(\eta v)^5
              +5(\eta v)^4(\eta^2w)\bigr]\,d\mu.
\]
In particular the Hessian term has the square of the cutoff.
[Formal flux identity](../../../SmoothPoincare/Variational/BourSixthPowerInterpolation.lean)

Put \(t=|\eta v|\), \(a=UC\) and \(b=|\eta^2w|\). The first flux
cost satisfies \(6at^5\le t^6/4+(24a)^6/2\). If \(t\ge24a\), the
first summand alone suffices. If \(t\le24a\), the cost is at most
\((24a)^6/4\). For the second flux cost, \(t^2\ge20Ub\) gives
\(5Ut^4b\le t^6/4\). When \(t^2\le20Ub\) the cost is at most
\(2000(Ub)^3\). For every \(\epsilon>0\), apply
\(2xy\le x^2+y^2\) to \(x=(\epsilon b)^3\) and
\(y=(16U/\epsilon)^3\). Their product is \(4096(Ub)^3\), which
bounds the latter cost. After integrating over \(K\) and absorbing
the two quarter terms, this gives
\[
 \int(\eta v)^6\,d\mu
 \le\epsilon^6\int(\eta^2w)^6\,d\mu
   +\bigl[(24UC)^6+(16U/\epsilon)^6\bigr]\mu(K).
\]
The sixth-root estimate is
\[
 \|\eta D_eu\|_{L^6(\mu)}
 \le\epsilon\|\eta^2D_eD_eu\|_{L^6(\mu)}
   +(24UC+16U/\epsilon)\,\mu(K)^{1/6}.
\]
The coefficient of the weighted Hessian can be chosen before applying
the estimate to an assembled system. On nested Euclidean balls,
a cutoff equal to one on the inner ball and compactly supported in the
outer ball gives the corresponding bound for the unweighted directional
gradient on the inner ball by measure restriction. The inner product
normalization of the direction matters only when comparing the
directional Hessian to the full Hessian norm. The directional estimate
does not require that normalization. [Physical weighted estimate](../../../SmoothPoincare/Variational/BourSixthPowerInterpolation.lean)

The estimate concerns the directional cutoff interpolation. The flat
principal Hessian estimate and its application to the complete
harmonic Ricci forcing are separate inputs to the stationary bootstrap.
[Flat operator and coefficient freezing](../../../SmoothPoincare/Variational/BourFlatInterior.lean) ·
[Stationary Ricci equation](../../../SmoothPoincare/Variational/BourStationaryInterior.lean)

The Lean \(L^6\) conclusions are available both in extended
\(\texttt{eLpNorm}\) and finite real \(\texttt{lpNorm}\). The latter
uses compact support to keep the right side finite before applying
\(\texttt{ENNReal.toReal}\). The inner-ball restriction of the actual
Hessian uses equality of the original and squared-cutoff functions
on an open neighborhood of each point, so their second Fréchet
derivatives agree there. The actual Fréchet first derivative is
bounded on the inner ball by the finite weighted directional sum
with the fixed chart-basis operator comparison. This last factor
is independent of the cutoff, the function and the radius.
[Inner-ball restriction and finite directional comparison](../../../SmoothPoincare/Variational/BourCutoffRestriction.lean)

The pinned Lake targets for both modules passed. A direct-module
probe applied the real interpolation theorem to the canonical
volume and a coordinate direction on the Euclidean four-space.
The ten public proof declarations in the two modules have only the
standard axiom union `propext`, `Classical.choice` and `Quot.sound`.
