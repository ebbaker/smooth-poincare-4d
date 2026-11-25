# Locating physical Yamabe volume in a positive Ricci representative

25 November 2026 for Edward B. Baker III. OpenAI Codex, with conceptual assessment configured GPT-6.2 Astra/ultra and bounded checks configured GPT-6.2 Sol/ultra. Input checkout 7db310a. [E16 request](../research-progress/handoffs/E16_THIRD_REQUEST_20261125.md) · [E17 request](../research-progress/handoffs/E17_THIRD_REQUEST_20261125.md) · [Conventions and source revisions](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md#inputs-and-versions).

## Actual source and choice of scale

Work on each fixed closed oriented smooth homotopy four-sphere \(M\) with a smooth physical unit-volume Yamabe minimizer \(g_i\), \(Y_i=s_{g_i}\ge y_0>0\), \(Y_i\le S=8\sqrt6\pi\), in the positive band of the second assessment. A positive lower bound for \(\int\sigma_2(A)\) and positive Yamabe sign supply a smooth conformal metric \(h_i\) with \({\rm Ric}_{h_i}>0\). Choose any such metric. All the conclusions through regular-point selection also hold if approximate Bach-criticality and positive-class minimization are imposed. They use neither extra premise. [NECK-E14 and the primary Chang–Gursky–Yang theorem](../../01_neck_geometry/notes/E14_POSITIVE_RICCI_GAUGE_20261125.md).

Use \(\mu_i=dV_{g_i}\) for **every** mass below, including the median used to set the distance scale. The maximum over centers of \(\mu_i(B_{h_i}(x,r))\) is continuous in \(r\), starts at zero and ends at one. Indeed the center and radius vary continuously in the integral by inclusions and the volume-zero boundaries of distance balls for either smooth conformally related volume form; the center set is compact. Choose the least radius \(r_i\) where that maximum is \(1/2\), and a maximizing \(p_i\). Write \(k_i=r_i^{-2}h_i\), \(g_i=w_i^2k_i\). Henceforth all balls \(B_s(x)\) and their radii refer to \(k_i\). Every unit ball has physical mass at most \(1/2\), and \(B_1(p_i)\) has mass \(1/2\). No physical marking or cut is assumed.

## Uniform control of the inner and outer physical masses

If \(0\le\chi\le1\) is Lipschitz and supported, up to null boundary, on a set of physical mass at most \(1/2\), the physical Yamabe inequality, Hölder, and four-dimensional conformal invariance of the fourth power of a scalar gradient give
\[
 y_0(1-2^{-1/2})\|\chi\|_{L^4(\mu_i)}^2
 \le 6\int |d\chi|_{g_i}^2\,d\mu_i
 \le 6\mu_i(T)^{1/2}\left(\int |d\chi|_{k_i}^4 dV_{k_i}\right)^{1/2}.
 \tag{1}
\]
Here \(T\) contains the gradient support up to measure zero. In particular the scalar term used to absorb the \(L^2\) norm is \(Y_i\) in the physical metric. For a logarithmic cutoff between \(B_r(x)\) and \(B_R(x)\), the coarea formula and Bishop's polar area comparison in \({\rm Ric}\ge0\) bound the last integral by \(2\pi^2[\log(R/r)]^{-3}\). The cutoff equals one at the retained end and zero at the other. With \(A=72\pi^2/[y_0^2(1-2^{-1/2})^2]\) this gives
\[
 \mu_i(B_r(x))\le {A\over A+\log^3(R/r)}\,\mu_i(B_R(x))
 \quad(0<r<R\le1).
 \tag{2}
\]
On the outside of \(B_1(p_i)\) the same proof, with the reversed cutoff, gives
\[
 \mu_i(M\setminus B_R(p_i))\le {A\over A+\log^3(R/r)}
                      \,\mu_i(M\setminus B_r(p_i))\quad(1\le r<R).
 \tag{3}
\]
Fix \(L>0\), let \(\rho=A/(A+L^3)<1\), \(\alpha=-\log\rho/L>0\). Iteration at ratio \(e^L\) and monotonicity give \(C s^\alpha\) for every small ball of radius \(s\le1\), uniformly over centers, and \(C R^{-\alpha}\) for the centered tail at \(R\ge1\), with \(C=(2\rho)^{-1}\). The exponents need not be optimal. Both estimates constrain the *physical* probability measure on the complete positive Ricci metric space.

## Noncollapse in the chosen gauge

Bishop–Gromov gives a dimension-only packing bound for \(k_i\): disjoint radius-\(s/2\) balls centered in \(B_R(p)\) each have volume at least a fixed fraction, of order \((s/R)^4\) for \(s\le R\), of the same enclosing ball volume, by relative comparison centered at the individual centers. Consequently finitely many radius-\(1/4\) balls, at most \(N(4)\), cover \(B_1(p_i)\). One has physical mass at least \(1/(2N)\). Its concentric doubled ball still has physical mass at most \(1/2\). Use (1) with a cutoff equal to one on the smaller ball, vanishing off the doubled ball, \(|d\chi|_{k_i}\le4\). This gives \(\operatorname{Vol}_{k_i}(B_2(p_i))\ge c(y_0)>0\). Relative comparison and containment now yield, for every fixed \(D\),
\[
 c(D,y_0)s^4\le \operatorname{Vol}_{k_i}(B_s(x))\le \omega_4s^4
 \quad\text{for }x\in B_D(p_i),\quad 0<s\le1,\qquad \omega_4=\pi^2/2 .
 \tag{4}
\]
This does not require normalized total \(k_i\)-volume or bounded \(k_i\)-diameter. In particular the long, unit-\(h\)-volume ellipsoids of NECK-E14 use a different choice of scale. The median construction does not transfer an upper estimate on physical geodesic balls or a scalar-square estimate to the positive Ricci gauge.

## A buffered source ball with definite physical mass

Let \(\nu_i\) be any nonnegative source measure with \(\nu_i(M)\le\Lambda\), \(A_0>1\) any fixed buffer factor, and prescribe at most \(J<\infty\) source points. For each fixed \(\varepsilon>0\) there are \(D,s,m>0\) independent of \(i\) and centers \(x_i\in B_D(p_i)\) with
\[
 \mu_i(B_s(x_i))\ge m,\qquad \nu_i(B_{A_0s}(x_i))\le\varepsilon,\qquad
 B_{A_0s}(x_i)\cap\{\text{prescribed points}\}=\varnothing .
 \tag{5}
\]
Pick \(D\) so (3) leaves at most \(1/4\) of the probability outside. Fubini gives \(\int \nu_i(B_{A_0s}(x))\,d\mu_i(x)\le \Lambda C(A_0s)^\alpha\) by (2). Markov's inequality and the same estimate around the \(J\) marks exclude at most \(1/4\) of the physical probability for small fixed \(s\) (use \(2A_0s\) for closed buffers). Cover the remaining centers by a maximal \(s\)-separated net and use the packing bound from (4) or relative comparison alone. Its cardinality is uniformly bounded by \(N(D,s)\), so some \(s\)-ball centered in the good set has mass at least \(1/(2N(D,s))\). This proves (5). In the physical Yamabe band one can take \(\nu_i=|{\rm Rm}_{g_i}|_{\rm tens}^2dV_{g_i}\), or add \(|B_{g_i}|dV_{g_i}\) when globally bounded. Conformally invariant chiral masses use the Hilbert–Schmidt curvature operator convention. The selected ball is an actual subset of \(M\); only its *distance* definition uses \(k_i\). The positive Ricci representative's full curvature need not be bounded on this ball. The constants \(m,s\) may decrease with \(\varepsilon\).

## Physical volume at regular points of an actual limit

For each fixed \(D\), (4), nonnegative Ricci and the local Sobolev inequality give a uniform four-dimensional Sobolev bound on sufficiently small \(k_i\) balls in \(B_{D+2}(p_i)\), with the usual \(s^{-2}\|z\|_2^2\) term if a cutoff is needed. For the normalized Dirichlet inequality one can choose radii a fixed small fraction of the diameter (\({\rm diam}_{k_i}M\ge1\)), and convert volume averages by (4). [Dai–Wei–Zhang, Theorem 1.1 and Corollary 4.6 (4.14)](https://web.math.ucsb.edu/~wei/paper/Dai-Wei-Zhang.pdf).

In this gauge the scalar curvature is positive. The physical Yamabe equation gives \(-6\Delta_{k_i}w_i\le S w_i^3\) and \(\int_{B_s}w_i^4dV_{k_i}=\mu_i(B_s)\). Select a small fixed radius by (2) so this mass absorbs the following nonlinear term. Testing by \(\eta^2w_i^3\) and applying the local Sobolev inequality gives
\[
 \|\eta w_i^2\|_4^2\le C_D\left[S\int w_i^2(\eta w_i^2)^2+
                  \int(|d\eta|^2+s^{-2})w_i^4\right].
\]
The first integral is at most \(\mu_i(B_s)^{1/2}\|\eta w_i^2\|_4^2\). Absorption gives a uniform interior \(L^8\) bound. Hence the potential \(S w_i^2\) in the subsolution inequality is bounded in \(L^4\), above the critical exponent 2. For the further powers \(z=\eta w_i^{p/2}\), Hölder bounds the potential term by \(C_D\|z\|_{8/3}^2\le C_D\|z\|_2\|z\|_4\). Young's inequality absorbs the \(L^4\) term with a polynomial loss in \(p\). Iterating \(p\mapsto2p\) on nested balls with cutoff derivatives \(O(2^j/s)\) gives
\[
 \sup_{B_D(p_i)} w_i\le C_D',\qquad
 d\mu_i\le (C_D')^4\,dV_{k_i}\quad\text{on }B_D(p_i).
 \tag{6}
\]
Constants can grow with \(D\). In particular physical distances between points of a bounded \(k_i\) ball have a one-sided upper comparison along their \(k_i\)-minimizing geodesics using (6) on a larger fixed ball. A lower comparison would need additional control.

Now take a pointed noncollapsed Ricci-limit subsequence in the \(k_i\) distances. Denote its limit by \((X,d,p)\). On the same realizing subsequence, \(dV_{k_i}\) converges locally to \(\mathcal H^4\) in the Euclidean normalization, and (3) gives a limiting probability \(\mu\) for the physical volumes. By testing (6) against continuous nonnegative compactly supported functions, \(\mu\ll\mathcal H^4\) locally with a locally bounded density. The noncollapsed Ricci-limit regular set, where every tangent cone is Euclidean four-space, has full \(\mathcal H^4\) measure; the transported physical probability therefore gives it mass one. The regular set need not be open. [Cheeger–Colding, *On the structure of spaces with Ricci curvature bounded below. I*](https://doi.org/10.4310/jdg/1214459974) · [Primary literature record](../../../../../../references/SOURCE_NOTES_THIRD_COLLAR_20261125.md).

One can choose \(x\) regular, with positive finite physical four-density, off any fixed finite marked set, and with zero atomic mass for the local weak limit \(\nu\) of the physical full-curvature measures. Indeed (6), differentiation of the density on a doubling noncollapsed Ricci-limit space, and positivity of \(\mu(X)\) give the density statement at \(\mu\)-almost every point. Atoms of \(\nu\) form a countable set. Choose \(x_i\to x\) in the pointed realization. Fix \(A_0>1\); first take \(i\to\infty\) at common continuity radii \(b,A_0b\), then \(b\downarrow0\) through these radii. The measured physical mass of \(B_b(x_i)\), divided by \(\omega_4 b^4\), tends in this iterated sense to a finite strictly positive value, whereas the raw physical curvature energy in \(B_{A_0b}(x_i)\) tends to zero. Rescalings of the *positive Ricci distance* limit approach Euclidean space at \(x\). This yields a specified volume-carrying location on actual sources. A compatible smooth embedding with \(C^0\cap W^{1,4}\) control of a whole truncation, its smooth removable marks, and the curvature budget in its comparison gauge remain independent requirements of E14. Small physical Weyl energy at this one point also leaves nonroundness undetermined.

## Smooth marked balls carrying nearly all physical volume

Fix a mass tolerance \(0<\epsilon<1\), a physical curvature budget per ball \(\zeta>0\), and any upper bound \(r_*>0\) for the radii in the normalized Ricci metric. On a subsequence, for all sufficiently large \(i\), there are **uniformly finitely many pairwise disjoint smoothly embedded closed standard four-balls** in \(M\) with radii of the enclosing \(k_i\)-balls at most \(r_*\), whose union carries at least \(1-\epsilon\) of the physical volume. The physical \(\int|\mathrm{Rm}_{g_i}|^2\) of each is less than \(\zeta\). The number may depend on all three choices and on the limit. The existence of one smooth ball with definite volume and small curvature already follows by retaining one member after fixing the finite family. Every marking can be made orientation-preserving by reflecting its parameter ball.

Here are the limit and marking steps. Choose a bounded window carrying mass greater than \(1-\epsilon/4\). At \(\mu\)-almost every point in it, the \(\mathcal H^4\)-density is Euclidean, the \(\mu\)-density exists and is positive, every tangent is Euclidean, and the limit curvature measure has no atom. For any small fixed \(\tau>0\) a fine family of balls about each such point therefore has all of the following properties. Its closure has curvature measure below \(\zeta/2\), its radius is below \(r_*\), and on radii \(r,(1-\tau)r,(1-3\tau)r\) it has near-Euclidean volume ratios and physical mass ratios as close as desired to the corresponding fourth powers. Choose continuity radii for all measures. Apply the Vitali covering theorem to the locally doubling \(\mathcal H^4\) measure in the window; \(\mu\ll\mathcal H^4\). Retain finitely many disjoint balls covering mass greater than \(1-\epsilon/2\). Choose \(\tau\) and the ratio tolerances so that the smallest concentric balls still carry strictly more than \(1-\epsilon\). Shrink the outer balls to radius \((1-\tau)r\) to give a positive separation margin for this finite family.

By noncollapsed volume convergence the shrunken balls on the original smooth \(k_i\) manifolds have the required almost-maximal volume and \(\mathrm{Ric}_{k_i}\ge0\). Cheeger–Colding I, Appendix A, Theorems A.1.8–A.1.9, give a smooth embedding of an open Euclidean ball into each shrunken source ball, containing the concentric ball with any prescribed slightly smaller relative radius once the volume error is small enough. Choose that error after \(\tau\), and make \(r\) small enough for the theorem when selecting the fine family. The closed \((1-3\tau)r\) metric ball lies compactly in this image for large \(i\). Its preimage is compact, so a smaller concentric **closed parameter ball** contains it in its interior. These embedded closed standard balls are disjoint on each large source and satisfy the asserted physical mass and curvature bounds by convergence on the fixed radii. Each boundary gives an actual smooth \(S^3\). There is no estimate here on the energy of the complement, on the derivative of a marking in critical norm, or on separation of two prescribed physical chiral quantiles. Finite choices and transfer precede any further decrease of \(\epsilon,\zeta,r_*\). [Cheeger–Colding I, Appendix A, pp. 458–459](https://doi.org/10.4310/jdg/1214459974) · [Independent check](../reviews/POSITIVE_RICCI_DENSITY_CHECK_20261125.md).

## Application to a supplied comparison

Suppose the **median-normalized \(k_i\)** themselves are compared on whole punctured truncations to a smooth closed \(h\) as in E14. If one fixed truncation contains a normalized ball as in (5), its volume witness is immediate. There is also an intrinsic way to handle the exits in this precise comparison. At a face point \(q_i\) on a smooth normal-coordinate sphere of small fixed \(h\)-radius \(b\), \(B_s(q_i)\) contains the compared annulus out to approximately \(s-O(b)\), at fixed small \(s\), for \(i\) large. Join points by moving around the \(O(b)\)-diameter face and then radially in the marked region. For several punctures take \(s\) below their mutual separation. Its \(k_i\)-volume is at least \(\omega_4s^4[1-O(s^2)-O(b/s)-o_i(1;b,s)]\). If the one-face exterior contained a point at distance \(s/2\) from its boundary, its \(s/8\)-ball would be disjoint from that annulus, contained in \(B_s(q_i)\) for \(b\ll s\), and have at least \(16^{-4}\) of the annulus volume by Bishop comparison about that point (its \(2s\)-ball contains the annulus). This violates the Euclidean upper volume bound when \(s\) is small, \(b/s\) is small, and \(i\) is large, in that order of choices. Consequently the entire exterior is inside \(B_s(q_i)\) for such \(i\), using connectedness, continuity of depth and the small face diameter. Formula (2) bounds the physical mass of all such exteriors by \(k C s^\alpha\) for \(k\) faces. First take the source limit at fixed radii, then exhaust. For no punctures the conclusion follows from the full closed embedding. This argument uses neither minimizing chiral energy nor a strict subround value.

Under the remaining weak comparison conditions of E14 its local Yamabe absorption argument works even at \(y=S\) in this gauge: a sufficiently small fixed coordinate ball is contained in a comparably small \(k_i\)-ball, so the local \(L^4\) mass entering the cubic difference estimate is uniformly small by (2), including for \(u_i-u\) by fourth-power splitting. Each compared compact then has strong local factor convergence, and the preceding exhaustion leaves unit limiting mass on the base. This additional conditional case supplies no full-energy conclusion for a round base with chiral atoms.

[Capacity and marking check](../reviews/CAPACITY_MARKING_CHECK_20261125.md) · [Local density check](../reviews/POSITIVE_RICCI_DENSITY_CHECK_20261125.md) · [Conceptual assessment](../reviews/LEAD_ASSESSMENT_20261125.md).
