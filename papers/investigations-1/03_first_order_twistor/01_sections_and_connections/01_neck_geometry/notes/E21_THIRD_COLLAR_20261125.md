# Weak separating cuts under perturbations

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The packet specifies gpt-6.2-sol/ultra. Serving model
and effort are unavailable. Input checkout
`7db310a2a9219c537b440d7c2fb39e602a32b729`. This is a conditional retention
estimate and a counterexample for a fixed marking. [Frozen E21 request](../research-progress/handoffs/E21_THIRD_REQUEST_20261125.md) · [Joint conventions](../../../reviews/SECOND_COLLAR_ASSESSMENT_20261125.md)

## The inherited collar and two physical quantiles

On a fixed closed oriented smooth homotopy four-sphere \(M\), start with
smooth Bach-flat unit-volume positive Yamabe minimizers \(g_i\) in the band

\[
 4\pi^2\le E_i=\mu_i(M)\le 8\pi^2-\delta,
 \qquad \mu_i=|W^+_{g_i}|_{\rm HS}^2\,dV_{g_i} .
\]

Fix \(\eta>0\), \(2\eta<E_i\), and old radii \(a_i,b_i\) about \(p_i\) with
mass \(\eta\) in \(B_{g_i}(p_i,a_i)\) and in \(M\setminus B_{g_i}(p_i,b_i)\).
Assume \(b_i/a_i\to\infty\). First choose the growing E11 block and the
midpoint rescaling of E12. Then fix a finite width, large enough for both
E07 buffers, in the exact rescaled limit. Transfer that annulus for large
\(i\) on the E12 subsequence. E08 excludes the finite quotient before
perturbation. The resulting oriented embedding \(\Phi_i\) is spherical, has
physical scale \(\rho_i\), and compares \(\rho_i^{-2}g_i\) smoothly with the
Euclidean metric on the fixed annulus, including a neighborhood of its
closure. In particular \(a_i/\rho_i\to0\) and \(\rho_i/b_i\to0\).
[E11 block](E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md) · [E12 full shell](E12_EXACT_BACH_BALANCED_CUT_20261125.md) · [E08 link test](E08_QUOTIENT_LINK_TEST_20261125.md)

Write \(\mathcal A_i\) for the closed buffered annulus and \(U_i^-,U_i^+\)
for the complementary open components, with \(p_i\in U_i^-\). For fixed
\(0<c<C\), the E12 complete-shell comparison gives

\[
 B_{g_i}(p_i,c\rho_i)\subset U_i^-,\qquad
 \{d_{g_i}(p_i,\cdot)\ge C\rho_i\}\subset U_i^+ .                 \tag{1}
\]

Indeed, choose \(c\rho_i\) below the least distance in \(\mathcal A_i\) and
\(C\rho_i\) above the greatest distance there. The ball around \(p_i\) is
connected. A path in \(U_i^-\) from \(p_i\) to distance \(C\rho_i\) would
cross a complete intermediate distance sphere contained in \(\mathcal A_i\).
The central \(S^3\) is an embedded separating slice for every smooth metric
on this same \(M\).

Let \(m_i\) be the metric after perturbation and let
\(\widehat g_i=u_i^2m_i\) be a unit-volume positive Yamabe minimizer in its
class. Denote its positive-chiral measure by \(\widehat\mu_i\), which equals
the one for \(m_i\) on the same sets by conformal invariance. Suppose the
centered distances satisfy \(l_i d_{g_i}(p_i,x)\le d_{\widehat g_i}(p_i,x)
\le L_i d_{g_i}(p_i,x)\) for all \(x\in M\), where \(0<l_i\le L_i\). The
two placement inequalities are

\[
 L_i a_i < l_i c\rho_i,\qquad L_i C\rho_i < l_i b_i .              \tag{2}
\]

The old inner mass set lies in the new ball of radius \(L_i a_i\), and that
whole new ball lies in \(U_i^-\) by (1)–(2). The old outer mass set lies in
the new exterior at radius \(l_i b_i\), and that whole exterior lies in
\(U_i^+\). If \(\|\widehat\mu_i-\mu_i\|_{\rm TV}\le\tau_i\), both new sets
carry mass at least \(\eta-\tau_i\). For any fixed \(0<\eta'<\eta\) with
\(\tau_i\le\eta-\eta'\), continuity of the ball distribution gives exact
inner and outer \(\eta'\) radii \(\widehat a_i\le L_i a_i\) and
\(\widehat b_i\ge l_i b_i\). Their entire quantile sets are in the retained
regions outside the buffers, and
\(\widehat b_i/\widehat a_i\ge l_i b_i/(L_i a_i)\to\infty\) by the first
inequality of (2) and \(\rho_i/b_i\to0\). Continuity follows from the
zero four-volume of positive-radius distance spheres as in E11.

The original level \(\eta\) works when each old mass set loses no mass.
For example the perturbation can be supported between the two old sets,
so their densities are preserved by support and conformal invariance. One
may also use old test radii lying inside both strict placement margins and
carrying mass at least \(\eta+\tau_i\) on each side. When imposing the strict
balance convention at level \(\eta\), require \(2\eta<\widehat\mu_i(M)\).

The ratio in (2) is scale-aware. A sufficient bound is

\[
 \frac{L_i}{l_i}=o\!\left(\min\{\rho_i/a_i,\ b_i/\rho_i\}\right) .      \tag{3}
\]

Another sufficient test uses any rescaling factor \(\lambda_i>0\). If
\(\sup_x|\lambda_i^{-1}d_{\widehat g_i}(p_i,x)-d_{g_i}(p_i,x)|\le
\epsilon_i\rho_i\), the same proof uses physical radii
\(\lambda_i(a_i+\epsilon_i\rho_i)\) and
\(\lambda_i(b_i-\epsilon_i\rho_i)\), provided
\(a_i+2\epsilon_i\rho_i<c\rho_i\) and
\(C\rho_i+2\epsilon_i\rho_i<b_i\).

## Perturbation on the protected buffers and Yamabe reselection

The chart metric for the cap estimate is the pulled-back auxiliary
representative \(k_i=\rho_i^{-2}\Phi_i^*m_i\). The full curvature norm in
this estimate is that of \(k_i\) in the auxiliary gauge. One sufficient
condition on the predetermined normalized annulus is

\[
 \|k_i-\rho_i^{-2}\Phi_i^*g_i\|_{\infty}
 +\|D(k_i-\rho_i^{-2}\Phi_i^*g_i)\|_{L^4}\to0,
 \qquad \|\mathrm{Rm}_{k_i}\|_{L^2(\text{splices},k_i)}=O(1).       \tag{4}
\]

Disjoint support gives (4) directly. On a buffer hit by the perturbation,
bounded \(L^2\) Cartesian second derivatives of the normalized metric
suffice for the curvature bound in (4), by its linear second-derivative
and quadratic first-derivative terms. For \(w_i=k_i-g_{\rm eucl}\), put
\(\alpha_i=\|w_i\|_\infty\), \(d_i=\|Dw_i\|_4\) and let \(K_i\) be the
curvature norm in (4). The E07 splice estimate gives new total splice
energy at most

\[
 \left[\sqrt{\widehat\mu_i(\text{old splices})}+
 C(\alpha_i K_i+d_i^2+d_i+\alpha_i)\right]^2=o(1)
\]

if \(\tau_i=o(1)\), because the old exact splices have energy \(o(1)\).
In particular the collar admits two smooth caps with positive Yamabe
constants by E07. For that conclusion choose the buffer length using
\(Y([m_i])\ge\sqrt{48\delta}\) from the physical band before choosing the
perturbation tolerances. The proof gives the positive Yamabe sign and a
vanishing Weyl cost for the caps. It supplies no Bach estimate for the
splices. [E07 first-order comparison and cap estimate](E07_FIRST_ORDER_CAP_20261125.md)

For reselection, one can obtain \(l_i,L_i\) from pointwise length bounds.
Let \(\mathcal U_i\) be the positive factors \(v\) giving unit-volume
Yamabe minimizers \(v^2g_i\). For fixed \(i\), E17 applies because the
nonzero Weyl energy gives \(Y([g_i])<Y(S^4)\) by strict Yamabe comparison.
For perturbations tending to \(g_i\) in \(C^1\cap W^{2,p}\), \(p>4\),
E17 makes every selected factor uniformly close to this compact set
at fixed \(i\). Choose the perturbation small enough that

\[
 e^{-\varepsilon_i}|X|_{g_i}\le |X|_{m_i}\le e^{\varepsilon_i}|X|_{g_i},
 \qquad \|\log u_i-\log v_i\|_\infty\le\varepsilon_i
 \quad\text{for some }v_i\in\mathcal U_i,
\]

where \(\varepsilon_i\downarrow0\). Comparison of lengths of all curves
gives \(l_i=e^{-2\varepsilon_i}\inf v_i\),
\(L_i=e^{2\varepsilon_i}\sup v_i\). Thus (2) holds for every reselection
if the ratio
\(\sup_{v\in\mathcal U_i}(\sup v/\inf v)\) satisfies (3), and in
particular when \(g_i\) is the unique unit-volume minimizing metric in its
class. The fixed-source argument uses the strict subround gap separately
at each \(i\). [E17 fixed-source compactness](E17_WEAK_BACH_CURVATURE_SPIKES_20261125.md#normalization-compactness-at-each-fixed-source) · [Lee–Parker, §4](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For an example with unbounded curvature, start with exact energies in the
interior of the band and use the E17 localized jets on each fixed source.
After the extraction and width choice, take their radii sufficiently small
to satisfy (4) in the already fixed charts and make the chiral measure and
integrated Bach changes \(o(1)\). This is possible even when the support
intersects a splice, since the fixed-source \(C^1\cap W^{2,p}\) errors tend
to zero and all the chosen coordinate conversions are fixed at that index.
The same diagonal can make \(\rho_i^2|W_{\widehat g_i}(q_i)|\) exceed any
prescribed finite threshold at each index in all the reselected metrics,
using the fixed-source upper bound on \(u_i\) and the E17 divergent jet.
The length premise remains (2). [E17 jet and intrinsic diagonal](E17_WEAK_BACH_CURVATURE_SPIKES_20261125.md#the-intrinsic-diagonal)

## What the raw assumptions determine

The physical band and integrated Bach bound do not imply (2) for the
inherited marking, even when the Weyl measures are arbitrarily close and
the new metrics have exact separated quantiles. On any supplied exact
balanced source choose \(x_i\in B_{g_i}(p_i,a_i)\setminus\{p_i\}\) and
distinct \(y_i,y'_i\) with distances strictly greater than \(b_i\). These
outer points exist because the outer mass is positive and the distance
sphere has measure zero. Join \(x_i\) to \(y_i\) by a smooth embedded arc
avoiding \(p_i,y'_i\), and give the arc a tube \(V_i\) with
\(\mu_i(V_i)\le 1/i\), possible by smoothness of the measure at each fixed
index. A smooth time-dependent vector field supported in \(V_i\) agreeing
with the velocity along the arc gives an orientation-preserving
diffeomorphism \(F_i\) with \(F_i(x_i)=y_i\), fixing \(p_i,y'_i\) and the
complement of \(V_i\).

Set \(\widehat g_i=F_i^*g_i\). This is exact Bach-flat, still a volume-one
Yamabe minimizer, and isometric to \(g_i\) with the same marked center.
It has the same quantile radii and the same global curvature integrals.
Its chiral measure changes by at most \(2\mu_i(V_i)\) in total variation
since \(F_i(V_i)=V_i\). Yet its complete outer quantile contains both
\(x_i\in U_i^-\) and \(y'_i\in U_i^+\). The anchored distance upper bound
forces \(L_i>b_i/a_i\), while the fixed \(y'_i\) forces \(l_i\le1\).
This rules out (2) in the inherited marking. The pulled-back collar
\(F_i^{-1}\circ\Phi_i\) remains a separating cut, so the example concerns
fixed-mark transfer under the raw invariant bounds.

For the \(C^1\cap W^{2,p}\)-small perturbation class, E17 controls the
distance to the set of original minimizing factors at each index. A
comparison to the selected old distances at both margins of (2) remains
unproved without control over the original minimizer set. For an arbitrary
weak balanced sequence, B05 still needs a comparison or a selection
argument producing an embedded buffered \(S^3\) that carries the two
complete physical mass sets with sufficient cap control.
