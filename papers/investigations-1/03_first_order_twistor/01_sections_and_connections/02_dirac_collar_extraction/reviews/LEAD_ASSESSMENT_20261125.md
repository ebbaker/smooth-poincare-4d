# Physical distances and curvature at a weakly marked Yamabe base

25 November 2026, for Edward B. Baker III, with OpenAI Codex assistance. The conceptual lead review was explicitly assigned GPT-6.2 Astra/ultra. Independent serving telemetry is unavailable. The [frozen B05 review request](../research-progress/handoffs/LEAD_ASSESSMENT_REQUEST_20261125.md) identifies starting checkout `7db310a2`. The working [EXTRACT-E14](../notes/E14_WEAK_MARKED_BASE_20261125.md) checked here has SHA-256 prefix `71fa1d97`. The [weak-base check](WEAK_BASE_CHECK_20261125.md), [volume check](VOLUME_CHECK_20261125.md) and [current check](CURRENT_CHECK_20261125.md) use the same source hypotheses. The conclusions below are conditional analytical implications. No original source sequence or marked embeddings were constructed here.

## Two conclusions in the physical gauge

Use the smooth, closed, oriented Riemannian homotopy four-spheres and coherent whole-truncation embeddings of E14, with a finite set of ordinary marks \(P\subset N\). On each fixed compact of \(N-P\), write \(k_i=\Phi_i^*g_i=u_i^2m_i\), where \(m_i\to h\) strongly in \(C^0\cap W^{1,4}\) and the comparison scalar is locally bounded in \(L^2\). E14 upgrades this last bound to a local full-curvature bound using the conformally invariant source Weyl budget. Let \(Y_i\to y>0\) be the scalar curvatures of the unit-volume physical Yamabe minimizers. Work on a subsequence on which E14 gives \(u_i\to u\) strongly in \(H^1_{\rm loc}\cap L^4_{\rm loc}\), with \(u>0\) smooth on \(N\) and \(k=u^2h\) of volume one. This *saturated case* holds, in particular, for a weak nonround marked base at minimizing energy, or for a strict subround sequence with a positive fixed-compact physical-volume witness under E14.

1. In the saturated case, the original physical spaces \((M,g_i,dV_{g_i})\) converge in measured Gromov–Hausdorff distance to \((N,k,dV_k)\), using the given markings. A positive gap to the round constant enters here only through the preceding saturation criterion.
2. If also \(E_+(g_i)\to E_+(k)\), the physical trace-free Ricci tensors converge strongly locally in \(L^2\) as covariant two-tensors in the comparison coordinates. The physical full-curvature energy densities converge strongly in \(L^1_{\rm loc}\), and the entire complementary curvature energy vanishes in the exhaustion limit. Equality of the chiral energies follows from E14 at exact minimization on a nonround weak marked base.

The first conclusion requires an improvement in the integrability of the physical conformal factors. Strong \(H^1\cap L^4\) alone does not give the length comparison in the following proof.

## Control of the conformal factor above the curve threshold

Fix a relatively compact coordinate ball in the marking, with room for successive interior cutoffs. All constants in this section may depend on that ball. The physical Yamabe equation in this gauge is
\[
 -6\Delta_{m_i}u_i=V_i u_i,\qquad V_i=Y_i u_i^2-R_{m_i}.
\]
Write \(d\mu_i=dV_{m_i}\). For every smooth test \(z\) supported there, E14's scalar form comparison and the uniform convergence of the principal coefficients, together with \(u_i^2\to u^2\) in \(L^2\), give
\[
 \left|\int V_i z^2\,d\mu_i\right|
 \le o_i(1)\|dz\|_2^2+C\|z\|_2^2 .
 \tag{1}
\]
Indeed, subtract the smooth bounded potential density \((yu^2-R_h)dV_h\), and apply the fixed-patch Sobolev inequality to the difference in the cubic potential. Norms on the right can be taken in the fixed Euclidean coordinates.

Test the equation with \(\eta^2u_i^{q-1}\), first for \(q=4\), then on a smaller ball for \(q=8\). Set \(v=u_i^{q/2}\). Integration by parts, uniform ellipticity and Young's inequality give
\[
 c_q\|d(\eta v)\|_2^2
 \le \int V_i(\eta v)^2d\mu_i + C_q\int |d\eta|^2 v^2 \,dx.
\]
Here positivity of \(c_q\) follows from the principal term \(24(q-1)q^{-2}\int\eta^2|dv|_{m_i}^2d\mu_i\). Absorb (1), then apply \(H^1\subset L^4\). Each test doubles the available integrability exponent for \(u_i\). The initial local \(L^4\) bound therefore gives a uniform local \(L^{16}\) bound. Interpolation gives strong local \(L^q\) convergence for \(4\le q<16\).

Put \(A_i=\sqrt{\det m_i}\,m_i^{-1}\). On a smaller patch use frozen Euclidean coefficients at the center for the smooth limit (by a constant coordinate change). Then \(\|A_i-I\|_\infty\) can be made arbitrarily small by reducing the fixed patch and then increasing \(i\). In coordinates the undifferentiated right-hand side of the Yamabe equation is bounded in \(L^s\), \(s=16/9\), by the comparison scalar \(L^2\) bound, the \(L^{16}\) bound on \(u_i\), and Hölder. For \(w=\eta u_i\), the localization adds a bounded \(L^2\) term proportional to \(A_i du_i\cdot d\eta\), and a divergence of a bounded \(L^{16}\) field proportional to \(u_iA_i d\eta\). With \(p_*=16/5\), one has \(1/s=1/p_*+1/4\). The constant-coefficient estimate for \(-\Delta w= f+\operatorname{div}G\) on \(\mathbb R^4\) reads
\[
 \|dw\|_{p_*}\le C\big(\|f\|_s+\|G\|_{p_*}\big).
\]
For completeness, Sobolev duality embeds \(L^s\) in the homogeneous \(W^{-1,p_*}\) space since \(1/s'=1/p_*'-1/4\). Extending the functional on gradients by Hahn–Banach represents it as a divergence of an \(L^{p_*}\) field. The second derivatives of the Newtonian inverse are bounded on \(L^{p_*}\) by the singular integral theorem (plus a constant identity term on the diagonal). Its kernel off the origin is homogeneous of degree \(-4\), with smooth mean-zero angular part. See A. P. Calderón and A. Zygmund, *On the existence of certain singular integrals*, Acta Math. 88 (1952), 85–139, Chapter I, Theorem 1, for \(1<p<\infty\). [Primary article](https://doi.org/10.1007/BF02392130)

Include \((A_i-I)dw\) in \(G\) and absorb it by the chosen coefficient smallness. Each \(w\) is already smooth, so the a priori absorption has no regularity assumption uniform in \(i\). A finite cover gives \(du_i\) locally bounded in \(L^{16/5}\). Interpolating with the strong \(L^2\) convergence of the gradients proves
\[
 u_i\longrightarrow u\quad\text{strongly in }W^{1,p}_{\rm loc},
 \qquad 3<p<16/5 .
 \tag{2}
\]

## Ambient distances on the marked core

Write \(d=d_k\). For each fixed sufficiently small \(b>0\), take \(K_b=N\setminus\bigcup_{a\in P} B_k(a,b)\) with disjoint smooth normal balls. All estimates use a slightly larger fixed comparison region. For each fixed \(\epsilon>0\), the set \(\{|u_i-u|>\epsilon\}\cap K_b\) admits a cover by balls whose sum of radii tends to zero. To verify this, take a chart cutoff \(f_i=\eta(u_i-u)\), equal to the difference on the core part under consideration, and extend by zero. All averages on Euclidean balls of radius one tend uniformly to zero. At a bad point, if every ball of dyadic radius \(r\le1\) satisfies \(\int_{B_r}|df_i|^p<c\epsilon^p r\), successive dyadic averages differ by at most \(C c^{1/p}\epsilon r^{1-3/p}\) by Poincaré. Their sum is smaller than \(\epsilon/2\) for small fixed \(c\), contrary to the point value for large \(i\). Select disjoint balls from the resulting family whose fivefold dilates cover it. Their total radius is at most \(C\epsilon^{-p}\|df_i\|_p^p=o(1)\) by (2). A finite chart cover gives the same assertion in \(d\).

For a fixed \(x\in K_b\), set \(F(z)=d(x,z)\). Delete from the real line open intervals covering the images under \(F\) of those bad balls and of the boundary spheres \(\partial B_k(a,b)\). Their total length is at most \(o_i(1;b,\epsilon)+C|P|b\), uniformly in \(x\), because \(F\) is 1-Lipschitz and each boundary lies in a ball of radius \(b\). If \(J\) is the union of the intervals, let \(G(t)=\int_0^t1_{\mathbb R\setminus J}(s)ds\). The continuous function \(G\circ F\) is constant on each boundary sphere and in a neighborhood of the bad set. Each physical exterior meets one face, by separation of each two-sided sphere in the homotopy sphere and connectedness of the truncated core. Extend the function by the corresponding constant on each exterior. [One-face argument](../notes/E10_METRIC_LIMIT_AND_CURVATURE_ATOMS_20261125.md)

The extended function is Lipschitz for each fixed smooth source metric. Where it can have nonzero gradient, \(u_i\ge u-\epsilon\). Uniform local \(C^0\) comparison of \(m_i\) and \(h\), and \(\min_N u>0\), bound its physical gradient by \(1+C\epsilon+o_i(1;b)\) for small \(\epsilon\). The gradient bound extends to the global metric Lipschitz bound by the usual length characterization on a smooth manifold, or by local smoothing of Lipschitz functions. The difference of the function values at \(\Phi_i(x),\Phi_i(y)\) is at least \(d(x,y)-|J|\). This proves the ambient lower bound for all \(x,y\in K_b\), including paths that enter an unmeasured exterior.

For the upper bound one can first fix two endpoints and a smooth path in \(N-P\) of \(k\)-length within \(\sigma\) of \(d(x,y)\). Such paths exist because small arcs of a geodesic near finitely many points can be detoured on small normal spheres. Subdivide and approximate by coordinate line segments with the same length tolerance. In a chart, replace each segment by two segments through a point \(z\) in a small ball about its midpoint. Their smooth \(k\)-lengths approach the original one uniformly as that ball shrinks. For a fixed ball, the average error integral of \(|u_i-u|\) on the broken segments tends to zero including at their endpoints: polar integration around each endpoint bounds the average by a fixed multiple of the integral of \(|u_i-u|(w)|w-x|^{-3}\) on a bounded set, and the kernel lies in \(L^{q'}\) for \(q>4\). Choose \(q=8\). Strong local \(L^8\) convergence and uniform \(m_i\to h\) supply a physical path with limiting upper length at most \(d(x,y)+O(\sigma)\). Let \(\sigma\downarrow0\).

The same broken-segment average on a ball of radius comparable to \(r=|x-y|\), centered at the midpoint, bounds the physical distance by \(C\|u_i\|_q r^{1-4/q}\) for nearby endpoints in smaller patches. Indeed the polar integral before division by the intermediate ball volume is bounded by \(Cr^4\int |u_i|(w)|w-x|^{-3}dw\) for each endpoint. This equicontinuity and a finite net upgrade the upper comparison to a uniform upper bound on every fixed \(K_b\).

The complement of \(\Phi_i(K_b)\) has total physical volume tending to \(\sum_a\operatorname{Vol}_k B_k(a,b)=O(b^4)\), by local convergence of the volume densities and unit total volumes. The source Yamabe inequality gives uniform physical ball noncollapse \(\operatorname{Vol} B(x,r)\ge c r^4\) for small \(r\). A ball centered in an exterior of radius less than its distance to the core is contained in the complement. Therefore every point of the source lies within \(O(b)+o_{i,b}(1)\) of the core, and within that distance of its own face if it is an exterior point. The lower comparison, the uniform upper bound and this density give measured Gromov–Hausdorff convergence after first \(i\to\infty\), then \(\epsilon\downarrow0\) and \(b\downarrow0\). Concretely use the inverse marking on the core and send each exterior to its mark with a sufficiently slow diagonal \(b_i\downarrow0\). Its distance distortion tends to zero, and volume convergence on fixed smaller cores with vanishing exterior tails identifies the limiting measure. This includes \(P=\varnothing\), where no exterior estimates are needed. [Physical noncollapse](../../01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md)

## Ricci identification and exhaustion of the curvature budget

The physical source Ricci tensor \(T_i=\operatorname{Ric}(k_i)\), with both indices down, satisfies the exact four-dimensional equality
\[
 |T_i|_{m_i}^2dV_{m_i}=|T_i|_{k_i}^2dV_{k_i}.
\]
Uniform physical Ricci energy thus bounds \(T_i\) in fixed-coordinate \(L^2\) locally. For \(\Delta=\operatorname{div}\nabla\) the conformal law is
\[
 u_i^2 T_i = u_i^2\operatorname{Ric}(m_i)
  -2u_i\nabla^2_{m_i}u_i+4du_i\otimes du_i
  -(u_i\Delta_{m_i}u_i+|du_i|_{m_i}^2)m_i .
 \tag{3}
\]
There is no division by \(u_i\) in this test. The comparison Ricci tensors converge weakly in \(L^2\) by the all-lowered curvature formula in E14, contraction with the uniformly convergent inverse metrics and their local curvature bound. Multiplication by the strongly \(L^2\) convergent \(u_i^2\) passes this term to distributions. Products of first derivatives of \(u_i\) converge in \(L^1\). In the Hessian terms use \(u_i\partial_a\partial_bu_i=\partial_a(u_i\partial_bu_i)-\partial_a u_i\partial_bu_i\). Here \(u_i du_i\to u\,du\) strongly in \(L^{4/3}\), while the smooth algebraic metric coefficients converge uniformly with first derivatives strongly in \(L^4\). This treats the trace and Christoffel products as well as the coordinate Hessian. Hence the right side converges distributionally to \(u^2\operatorname{Ric}(k)\). Every weak \(L^2\) limit \(T\) of the physical tensors gives \(u^2T\) on the left. Positivity of \(u\) identifies \(T=\operatorname{Ric}(k)\). Subtracting \(Y_i u_i^2m_i/4\), which converges strongly in \(L^2_{\rm loc}\), yields weak convergence of the physical trace-free Ricci tensors \(S_i\) to \(S=\operatorname{Ric}_0(k)\).

Now assume \(E_+(g_i)\to E_+(k)\). The scalar of \(k\) is \(y\). In the real Hilbert–Schmidt conventions on \(\Lambda^+\), Gauss–Bonnet and signature on either homotopy sphere give
\[
 \int_M |\operatorname{Ric}_0(g_i)|^2dV_{g_i}
 =4E_+(g_i)+Y_i^2/12-32\pi^2
 \longrightarrow \int_N|\operatorname{Ric}_0(k)|^2dV_k .
\]
Weak lower semicontinuity on each compact, followed by exhaustion of its complement in \(N-P\), gives the matching local upper bound for norms on smooth compact domains. Local uniform equivalence of the comparison tensors to their limit, in particular uniform convergence of the coefficient matrices defining their quadratic norms, upgrades this to strong \(L^2_{\rm loc}\) convergence of \(S_i\). The same argument makes the outside trace-free Ricci energy vanish as the truncations exhaust. Both chiral energies have the same total on each closed source by signature. Their local convergence from E14 and equality of total positive energies thus exhaust both. Scalar-square energy exhausts by volume saturation.

In four-index tensor norms
\[
 |\mathrm{Rm}|_{\rm tens}^2 =
 4(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)
 +2|\operatorname{Ric}_0|^2+R^2/6 .
\]
Consequently the full physical energy densities converge strongly in \(L^1\) on each fixed marked compact (using any fixed smooth coordinate measure), and
\[
 \lim_{b\downarrow0}\limsup_i\int_{M\setminus\Phi_i(K_b)}
      |\mathrm{Rm}_{g_i}|_{\rm tens}^2\,dV_{g_i}=0 .
\]
There is also a precise strong tensor statement: the scale-corrected covariant four-tensors \(u_i^{-2}\mathrm{Rm}(k_i)\) converge strongly to \(u^{-2}\mathrm{Rm}(k)\) in \(L^2_{\rm loc}(h)\). In the Weyl part this is the covariant conformal law \(u_i^{-2}W(k_i)=W(m_i)\), and E14's density-weighted frame convergence converts back using \(m_i\to h\) uniformly. In the trace-free Ricci and scalar parts the algebraic decomposition gives fixed multiples of \(m_i\owedge S_i\) and \(Y_i u_i^2 m_i\owedge m_i\). Both converge strongly. The scaling on the full tensor is essential: \(|u_i^{-2}\mathrm{Rm}(k_i)|_{m_i}^2dV_{m_i}\) is the physical energy density. No pointwise curvature bound is used.

## Physical volume on the regular set of the positive-Ricci distance limit

There is a second application of the power test, before any weak smooth marking exists. Let \(H_i\) be the positive-Ricci conformal metrics of [NECK-E14](../../01_neck_geometry/notes/E14_POSITIVE_RICCI_GAUGE_20261125.md), rescaled so that the least radius of any ball carrying half the physical probability \(\mu_i=dV_{g_i}\) is one, attained at \(q_i\). Write \(g_i=w_i^2H_i\), and take all balls in this paragraph in \(H_i\). EXTRACT-E16 gives uniform small-ball decay of \(\mu_i\) and tightness about \(q_i\) by the physical Yamabe inequality and the conformal four-capacity of logarithmic cutoffs in the Ricci gauge. The following deductions use that small-ball estimate without a metric marking. [E16 specification](../research-progress/handoffs/E16_THIRD_REQUEST_20261125.md) · [Derivation](../notes/E16_POSITIVE_RICCI_VOLUME_MARKING_20261125.md)

First, \(\operatorname{Vol}_{H_i}B(q_i,2)\ge v>0\). Relative Bishop comparison covers \(B(q_i,1)\) by at most \(C(4)\) balls of radius \(1/4\) with centers in that ball (take disjoint radius-1/8 balls from a maximal separated set and compare their volumes to that of the original ball). Some \(B(x,1/4)\) therefore carries \(\mu_i\ge m_0>0\), while \(\mu_i(B(x,1/2))\le1/2\). Choose a cutoff equal to one on the smaller ball, supported in the larger, with \(|d\chi|_{H_i}\le C\). The physical Yamabe test [E12 (2) and (3)](../notes/E12_THIRD_COLLAR_20261125.md) gives
\[
 Y_0(1-2^{-1/2})\sqrt{m_0}
 \le 6\!\left(\int |d\chi|_{H_i}^4dV_{H_i}\right)^{1/2}
       \mu_i(B(x,1/2))^{1/2}
 \le C\operatorname{Vol}_{H_i}(B(q_i,2))^{1/2}.
\]
For any fixed \(D<\infty\), containment of the base ball in \(B(x,D+2)\) and Bishop comparison now give \(c_D r^4\le\operatorname{Vol}_{H_i} B(x,r)\le\omega_4 r^4\) for \(x\in B(q_i,D)\), \(0<r\le1\).

Next, on each bounded normalized ball there is a uniform pointwise estimate
\[
 \sup_{B(q_i,D)}w_i\le C_D .
 \tag{4}
\]
Indeed, positive scalar curvature in the Ricci gauge yields \(-6\Delta_{H_i}w_i\le Y_i w_i^3\), with \(Y_i\le Y_{\rm rd}\). On each ball of radius \(r\le1\) centered within \(D+2\), the local Sobolev inequality for compactly supported \(z\) is \(\|z\|_4^2\le C_D(\|dz\|_2^2+r^{-2}\|z\|_2^2)\). This is Saloff-Coste, *Uniformly elliptic operators on Riemannian manifolds*, Theorem 3.1, applied with dimension four, complete manifold, nonnegative Ricci curvature and the preceding lower volume ratio. [Primary article, p. 423](https://pi.math.cornell.edu/~lsc/papers/uniformly-jdg.pdf)

Choose a fixed \(r=r(D)>0\) so that \(Y_{\rm rd}\sup_x\mu_i(B(x,r))^{1/2}\) is small compared with this Sobolev constant and the power-test constant for exponent four. For \(z=\eta w_i^{p/2}\), testing the subsolution with \(\eta^2 w_i^{p-1}\), \(p\ge 2\), and applying Young's inequality gives
\[
 \|z\|_4^2
 \le C_D p^2\!\int (|d\eta|^2+r^{-2}\eta^2)w_i^p\,dV_{H_i}
       +C_D p^2\!\int Y_i w_i^2 z^2\,dV_{H_i}.
\]
At \(p=4\) the last term absorbs by Hölder and the chosen small mass. From \(\int w_i^4\le1\) one obtains a uniform \(L^8\) bound on a smaller ball. There \(V_i=Y_iw_i^2\) is bounded in \(L^4\), so \(\int V_i z^2\le C_D\|z\|_{8/3}^2\le C_D\|z\|_2\|z\|_4\). Young absorbs the last factor with a polynomial loss in \(p\). Use cutoffs on nested balls decreasing from radius \(r/2\) to \(r/4\), with derivatives at most \(C2^j/r\), and \(p_j=4\cdot2^j\). Each step costs at most \([C_{D,r}p_j^4 4^j]^{1/p_j}\) in the norm bound. Their product is finite. Taking the center to be any point in the original bounded ball proves (4).

Consequently \(dV_{g_i}\le C_D^4 dV_{H_i}\) there, and \(d_{g_i}(x,y)\le C'_D d_{H_i}(x,y)\) for pairs in any fixed bounded normalized ball, by integrating along an \(H_i\)-minimizing geodesic inside a larger bounded ball. Pass to a pointed convergent normalized Ricci subsequence and a weak limit \(\mu\) of the physical probabilities. The noncollapse above implies local convergence of \(H_i\)-volumes to the four-dimensional Hausdorff measure. The domination passes to positive compactly supported continuous tests, and E16 tightness gives \(\mu(X)=1\). Hence \(\mu\)-almost every point of the limit \(X\) is a four-dimensional metric regular point (all its tangent cones are Euclidean). Here one applies Cheeger and Colding, *On the structure of spaces with Ricci curvature bounded below. I*, Theorems 2.1 and 5.9 for pointed limits of complete connected manifolds with a uniform Ricci lower bound and noncollapsed unit balls at the basepoints. Regular points have full limit volume by Theorem 2.1. Lower and upper \(r^4\) volume ratios exclude regular points of other Euclidean dimensions upon taking tangents. [Primary article](https://doi.org/10.4310/jdg/1214459974)

In particular one can choose a regular point in the support of \(\mu\), outside any finite prescribed marks and the at most countably many atoms of a weak limit of a bounded total curvature measure. At such a point two concentric balls of sufficiently small fixed radii have arbitrarily small limiting curvature measure on the outer buffer and positive limiting physical volume on the inner ball. Choose continuity radii and take the source limit first. This identifies a metric-regular place carrying actual physical mass. The small curvature measure can be taken in the physical gauge or conformally invariant Weyl energy. No upper scalar-square bound in the normalized Ricci gauge has been derived here.

## Consequence for the original geometric task

The [volume check](VOLUME_CHECK_20261125.md) gives an actual-source lower bound for the volume of a compared compact when every complementary exit misses a fixed fraction of the total. Once that yields subround saturation, the proof above supplies distances on the whole physical source. If energy minimality is also present, the same source has zero residual full-curvature energy. A [shrinking normal comparison](../notes/E12_THIRD_COLLAR_20261125.md) can instead give a round conformal base carrying zero physical volume on any supplied source; a chart of that kind meets neither detection criterion. The [current check](CURRENT_CHECK_20261125.md) shows how finite negative conformal flux persists in the shifted round model. Its conclusions concern the tested faces, conformal factors and log-widths.

The new local starting point for EXTRACT-B05 is a physical-volume-bearing metric regular point of the normalized positive-Ricci limit, which can be chosen away from marked curvature atoms. The next geometric question is to produce original-source tensor and gauge control there and construct a coherent weak conformal comparison on whole punctured truncations of a smooth closed base and to detect either chiral energy on a fixed compact or subround physical volume there. Constant physical rescalings already give the local comparison curvature bound. For variable conformal factors one must control the comparison scalar or another sufficient curvature input. A translated positive-time smoothing chart off a small-volume exceptional set does not yet give the required marked annulus, first-derivative control on the original source, or control of the one-dimensional size of the exceptional set. The estimate (2) is available after whole marked comparison and saturation. It supplies no route to assume its exceptional-set conclusion in the earlier smoothing step. [NECK-E23](../../01_neck_geometry/notes/E23_THIRD_COLLAR_20261125.md)

The conclusions identify a conditional metric and energy limit of the original physical representatives. Smooth compactness in their given markings, exclusion of other closed critical classes, and smooth recognition for an arbitrary homotopy four-sphere remain open.
