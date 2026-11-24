# Subcritical Bach concentration and the first closed critical energy

24 November 2026, America/New_York. Research assessment prepared for Edward B. Baker III with OpenAI Codex assistance. The author-selected lead and effort were retained. Actual backend/effort are unavailable for independent attestation. The ten bounded proof and source-check requests were routed to helpers configured as gpt-6.2-sol/ultra. This is a lead assessment of analytical work. The [preceding assessment](SEC_EXTERIOR_REGULARITY_AND_RADIAL_COST_20261124.md), [original handoff](../continuation-notes/03_AFTER_EXTERIOR_REGULARITY_AND_RADIAL_COST_20261124.md) and [checked primary passages](../../../../../references/SOURCE_NOTES_SEC_20261124.md#fixed-margin-bach-concentration--24-november-2026) give the baseline. The [manuscript](../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) develops the earlier results through E39.

## What an inexpensive Bach gradient would have to look like

Let \(M\) be a smooth closed connected oriented homotopy four-sphere. All metrics below are Riemannian. With Hilbert–Schmidt norms of the curvature operators on \(\Lambda^\pm\), the signature theorem gives
\[
 E_i=E_{i,+}=E_{i,-},\qquad \int_M |W_i|^2_{\mathrm{four\ index}}=8E_i .
\]
Consider conformal classes with a round marked ball in some smooth representative, positive class Yamabe constant \(Y_i\), and \(4\pi^2\le E_i\le8\pi^2-\delta\), with the same \(\delta>0\) throughout. The radial strain bound \(\|h_i\|_\infty\int |B_i|\ge4E_i\) motivates asking if \(\int |B_i|/E_i\to0\) is possible. In this band the latter condition is equivalent to \(\int |B_i|\to0\). All integrals of the Bach norm use its conformally invariant four-dimensional \(L^1\) norm. [E36](../notes/SEC_E36_20261124.md) · [E48](../notes/SEC_E48_20261124.md)

The analysis gives an energy gap above \(4\pi^2\) for **exact closed critical metrics** and a quantitative exclusion of several kinds of concentration for **approximately critical metrics**. It leaves open whether the original fixed-band ratio has positive infimum. An approximately critical sequence may fail to have a smooth limit carrying its energy. Also, an exact nonround closed critical class in the interior of the band, if one exists, would directly yield marked examples with vanishing ratio.

## Counting the ends from the closed Yamabe identity

Use unit-volume Yamabe minimizers \(g_i\). Their scalar curvature is \(Y_i\), and the mark is conformally flat in this gauge. Take \(E_i\to e\), \(Y_i\to y\) on the same subsequence. Closed Gauss–Bonnet gives the exact identity
\[
 \frac{Y_i^2}{48}=8\pi^2-E_i+\frac14\int_M|\mathrm{Ric}_{0,i}|^2 .
 \tag{1}
\]
In particular \(y\ge\sqrt{48\delta}\). Supply smooth oriented pointed convergence on embedded compact subsets after rescaling by length factors tending to infinity. The limit has scalar curvature zero, Bach tensor zero, \(E_\pm^X\le e\), and homogeneous compact-support Yamabe inequality \(y\|u\|_4^2\le6\|\nabla u\|_2^2\). On an exhaustion the lower limit of the source trace-free Ricci integral bounds \(\int_X|\mathrm{Ric}_X|^2\). These conclusions require no prior Einstein or half-flat assumption. [E49](../notes/SEC_E49_20261124.md)

Now suppose \(X\) is a complete smooth limit with \(k\ge1\) differentiably ALE ends of positive order, \(q_j=|\Gamma_j|\) for the spherical links \(S^3/\Gamma_j\), and that whole sufficiently large truncations embed in the source. Throughout the combined results one may assume decay with all derivatives. Mayer–Vietoris and duality give \(\chi(X)=2-k\), \(\tau(X)=0\). On end \(j\), take compact radial Euclidean Yamabe near-extremizers in annuli, push their support to infinity by dilation, and descend to the quotient. The quotient divides the Yamabe quotient by \(\sqrt{q_j}\). Hence \(y^2\le384\pi^2/q_{\max}\). Scalar-flat Gauss–Bonnet on the full truncation and (1) now give
\[
 (8\pi^2-e)+\frac{E_+^X+E_-^X}{2}
       +4\pi^2\left(k-2+\sum_jq_j^{-1}\right)
       \le \frac{8\pi^2}{q_{\max}} .
 \tag{2}
\]
For \(k\ge2\) the left side exceeds the right side by at least
\(\delta+4\pi^2(k-2)(1+1/q_{\max})\). Thus **\(X\) has exactly one end**. This obstruction also works for source sequences without the small-Bach assumption whenever the other hypotheses and the scalar-flat limit hold. The two-ended scalar-flat Schwarzschild example has zero Weyl energy and \(\int|\mathrm{Ric}|^2=32\pi^2\), illustrating exactly where the fixed margin enters. [E50](../notes/SEC_E50_20261124.md)

## Why the remaining end is Euclidean

Hillman’s finite-group embedding theorem applies to the boundary of the full core in an integral homology four-sphere. It leaves the trivial, quaternionic and binary icosahedral possibilities. The Poincaré homology sphere would bound a smooth integral homology ball. Its \(E_8\) filling would then give a closed smooth spin four-manifold of signature of magnitude eight, contrary to Rokhlin's theorem. For the quaternionic link the magnitude of the ordinary signature eta invariant is \(3/4\). The core signature is zero, so the ALE signature formula would require \(|E_+^X-E_-^X|=9\pi^2\). Each chiral integral is bounded by \(8\pi^2-\delta\). The only possible link is \(S^3\). This uses smooth embedding of the full core and applies beyond the Ricci-flat ASD family excluded in the companion audit. [E51, including the eta normalization](../notes/SEC_E51_20261124.md) · [Companion E166](../../../01_chiral_metric_evolution/reviews/E166_ALE_CORE_AUDIT_ASSESSMENT_20261122.md)

Write \(e_X=E_+^X=E_-^X\). Open Gauss–Bonnet becomes \(\int_X|\mathrm{Ric}|^2=4e_X\). A Ricci-flat or half-conformally flat survivor is consequently flat. In the general case there is a positive harmonic end factor \(a=r^{-2}(1+O(r^{-\epsilon}))\) for some \(\epsilon>0\), with differentiated estimates. After inversion, \(a^2g_X\) is scalar-flat and Bach-flat near the new point, with coefficients \(\delta_{ij}+O(s^\epsilon)\) and the required derivative bounds at distance \(s\) from the point. Ache–Viaclovsky's removal theorem yields a smooth conformal compactification. Its topology is a smooth homotopy sphere by van Kampen and the homology sequence across \(S^3\). The argument does not identify its differentiable structure with that of the source. Zero capacity of the filled point gives
\[
 y\ \le\ Y_c(X)=Y(\widehat X,[\widehat g])=:\widehat Y_X .
\]
E52 gives the end proof already with five differentiated decay bounds and explains the inverse construction by the Green function on a positive closed class. [E52](../notes/SEC_E52_20261124.md)

## How much one smooth component can carry

On a closed positive-Yamabe Bach-flat homotopy sphere, \(0<E_+\le4\pi^2\) is impossible. Below the upper endpoint the Chang–Gursky–Yang sphere theorem permits application of Chang–Chen's Bach-flat rigidity on standard \(S^4\). At equality the alternative smooth types in the Chang–Gursky–Yang equality classification are excluded by the topology. The norm factor eight is essential. Apply this to the compactification and compare (1) with the Ricci integral on \(X\):
\[
 X\text{ nonflat}\quad\Longrightarrow\quad
 4\pi^2<e_X,\qquad
 e-e_X\ \ge\ \frac{Y_{\rm rd}^2-y^2}{48}
 \ \ge\ \frac{Y_{\rm rd}^2-\widehat Y_X^2}{48}>0,\qquad
 Y_{\rm rd}=8\sqrt6\,\pi .
 \tag{3}
\]
The strict last inequality follows from closed sharp Yamabe rigidity. A conformally round compactification would give \(e_X=0\) and, by the open identity, flatness. [E54, including the equality-source audit](../notes/SEC_E54_20261124.md)

At most one such nonflat component can have disjointly accounted cores. The residual energy in each chirality is strictly below \(4\pi^2-\delta\). If a smooth compactified base carrying this residual is itself positive-Yamabe and Bach-flat on a homotopy sphere, it must have zero Weyl energy. Therefore **a smooth base and disjoint smooth ALE components cannot give a full Weyl energy identity with any nonflat component**. With zero nonflat components such an identity puts all the source energy on the base. Each assertion about sums requires simultaneous disjoint embeddings of compact pieces or of the relevant punctured pieces. An identification of the residual with energy in a particular neck requires additional convergence information. [E56](../notes/SEC_E56_20261124.md)

## Two consequences of compactness for exactly Bach-flat sources

For smooth **exactly** Bach-flat closed positive-Yamabe homotopy spheres, use the unit-volume Yamabe minimizer in every conformal class. The band gives a uniform Sobolev bound, total curvature bound, \(b_1=0\), and a positive lower bound for integrated \(\sigma_2\). The first smooth leaf in the Chang–Qing–Yang concentration construction is nonflat and complete. The order-zero ALE asymptotics can be improved using Ache–Viaclovsky. If there is no concentration, small-energy estimates, fixed-radius volume noncollapse, and diameter control give smooth compact convergence after diffeomorphisms. E55 and E58 check both branches, including the curvature-maximum version of the argument. Exactness is used before taking a limit. [E55](../notes/SEC_E55_20261124.md) · [E58](../notes/SEC_E58_20261124.md)

1. **A uniform residual.** There is \(\kappa_\delta>0\) such that \(e-e_X\ge\kappa_\delta\) for every nonflat supplied smooth ALE limit above. Indeed the Yamabe constants of the compact exact nonround classes in the fixed band have supremum strictly below \(Y_{\rm rd}\), whenever the collection is nonempty. If they tended to \(Y_{\rm rd}\), a smooth compact limit would be conformally round, contradicting convergence of its energy. A nonflat leaf would have \(\widehat Y_X\ge Y_{\rm rd}\) and hence a round compactification, also impossible. Apply this exact-class deficit to the compactification of the supplied approximately critical limit in (3). The proof gives no numerical value of \(\kappa_\delta\). [E55](../notes/SEC_E55_20261124.md)
2. **A first closed critical value, if any exist.** Take the set \(\mathcal C\) of all \(0<E_+<8\pi^2\) attained by positive-Yamabe smooth Bach-flat metrics on smooth homotopy four-spheres. If \(\mathcal C\ne\varnothing\), \(a=\inf\mathcal C\) is attained and \(a>4\pi^2\). A sequence tending to \(a\) lies below a fixed upper margin. A nonflat smooth leaf would compactify to another member with \(0<e_X<a\) by (3). Consequently a minimizing sequence of these **critical values** has a smoothly convergent subsequence in Yamabe gauge up to diffeomorphisms, and the closed rigidity theorem excludes equality at \(4\pi^2\). In either case there is an interval above \(4\pi^2\) free of positive closed critical values. Its width is unspecified. If \(\mathcal C\) is nonempty, every supplied nonflat smooth bubble has \(e_X\ge a\), so its source must have \(e\ge a+\kappa_\delta\). [E58](../notes/SEC_E58_20261124.md)

## What happens without an ALE concentration

There is a complementary statement directly on the original \(M\). Supply smooth conformal and diffeomorphism gauges making the metrics uniformly elliptic and uniformly bounded in \(W^{2,q}\) for one \(q>2\) in a fixed smooth atlas. A subsequence converges uniformly and strongly in \(W^{1,4}\), weakly in \(W^{2,q}\). Test the first variation of the full Weyl functional against the difference \(h_i=g_i-g\) in this gauge. Its Bach pairing tends to zero. Curvature is affine in the second derivatives, so \(DW_{g_i}[h_i]=W_{g_i}-W_g+o_{L^2}(1)\) in a fixed tensor bundle. This gives convergence of the Weyl norms, hence strong \(L^2\) Weyl convergence. Fixed variations pass to the limit and show that \(g\) is critical. The compact smoothing conclusion here invokes Theorem 1.1 of the October 2026 Avalos–Cogo–Royo Abrego preprint on \(W^{2,q}\) critical metrics. Its conformal diffeomorphism is on the same smooth manifold. [E57](../notes/SEC_E57_20261124.md)

If the round marks retain positive volume in these gauges, the limiting Weyl tensor vanishes on a set of positive measure. In local analytic representatives of the resulting smooth Bach-flat conformal class this forces it to vanish identically by analytic continuation. This contradicts \(e\ge4\pi^2\). Thus under the supplied bounds the marks must shrink in volume and the limiting energy is an actual closed critical value on \(M\). There is no need for a fixed open subset common to the moving marks. [E57](../notes/SEC_E57_20261124.md)

Conversely, give a single actual closed Bach-flat positive-Yamabe class **strictly inside** the band on \(M\). Patching in a round ball of radius \(\varepsilon\) costs \(O(\varepsilon^4)\) in Weyl energy, \(O(\varepsilon^2)\) in the \(L^1\) Bach norm and \(O(\varepsilon^2)\) in the Yamabe constant. The exterior regularization preserves the splice energy and can keep its Bach bound. There are then regular marked centers in the very same band with actual radial strain at least \(c\varepsilon^{-2}\). The cap shrinks in a unit-volume Yamabe gauge even when presented as a fixed round marking in another gauge. The estimates require strict margin at the top for this construction. This proves a conditional counterexample mechanism; existence of its input class remains open in this investigation. [E53](../notes/SEC_E53_20261124.md)

## Evidence boundary

The near-critical assumption alone gives neither the compact Sobolev gauges nor an extracted smooth ALE limit nor an identity accounting for all Weyl energy. An orbifold fragment, concentration without a smooth energy-carrying limit and a long neck with unaccounted energy are outside the first test. A lower bound on the Bach ratio, even if obtained, would remove one obstruction to bounded radial strain; construction of an upper bound on the cost of lifting the prescribed radial direction remains a different estimate. The existence of a suitable positive starting class on an arbitrary smooth homotopy sphere also remains open. The [next handoff](../continuation-notes/04_AFTER_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) defines a local test on long annuli.

## Working-note versions

Repository baseline `e76752648b69969b1234d0295530c87fce9fcdcb`. The review uses the working tree. Each original request pins its inputs. The table records the assessed notes on 24 November 2026.

| Note | SHA-256 |
| --- | --- |
| [E49](../notes/SEC_E49_20261124.md) | `ecd1eb8565c7a447b5425c1bcb72d4c86ba4686a2b798c77e64df7b1efa7d690` |
| [E50](../notes/SEC_E50_20261124.md) | `76c3a0592f898dce9ff3e4c421de2db920ff64334a51ee3a93e84ab3ba3b50ff` |
| [E51](../notes/SEC_E51_20261124.md) | `c1c1e804b7ea83ca84884fdbd9478f8e36129a5ecf5225091e62035bd2bcb1ac` |
| [E52](../notes/SEC_E52_20261124.md) | `fdfa0cad457544335f2a7d9b4ca17b4f10679449dd6988014028ce27d0d9ada3` |
| [E53](../notes/SEC_E53_20261124.md) | `5031a9f742e9212ff51747b5091e2ab916484835e1cb702570865156dbde73fa` |
| [E54](../notes/SEC_E54_20261124.md) | `76de7f662bda8057e777f69901bfd6569aa3633de50246acee7b54e7740d87c1` |
| [E55](../notes/SEC_E55_20261124.md) | `64db7ecf9fb5a9a7820abc793997185c22cf95ec1ede07c694304bbbea1b4d2b` |
| [E56](../notes/SEC_E56_20261124.md) | `7454783f709702143642b17b244efa8e07415cb6b96023d09d9885a70f22f5b3` |
| [E57](../notes/SEC_E57_20261124.md) | `1f1cdde8dc84d7f4fa53c0e2a64f8edd61b4ab7b5c937de59546bfdddc2c66ba` |
| [E58](../notes/SEC_E58_20261124.md) | `5d290bda60a232407df0f85fee598fe02f80d80cfec56301ecddcbd35044a40d` |
