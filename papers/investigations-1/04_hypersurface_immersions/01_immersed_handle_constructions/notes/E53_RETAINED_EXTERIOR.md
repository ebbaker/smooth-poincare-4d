# E53b · Relative Gauss budget and an exact marked exterior

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort are unavailable. SP4-IMM-HDL-B01/B02 selected the family of whole-seam quadratic collars and a cluster of three references with overlapping normal images. The fixed execution checks the signed Gauss budget and one explicit closed completion. The checkout baseline is `b5de9758f16e`, the E51 clean handle TeX bundle is `1d7716242ac05d39`, and the E52 master TeX bundle is `2867c940507acb77`. [Branch scope and normalization](../research-overview/OVERVIEW.md) · [Handle manuscript](../manuscript/marked_immersed_handle_constructions.tex) · [Parent immersion proof](../../manuscript/chiral_energy_of_hypersurface_immersions.tex) · [Master immersion criterion](../../../../master/manuscript/immersion_entry.tex)

## Relative negative Gauss mass on the given exterior

Let \(M\) be a smooth closed oriented homotopy four-sphere and \(C=M\setminus\bigcup_{j=1}^N P_j^\circ\) the exterior of pairwise disjoint marked rounded disks \(P_j\cong\Omega\). Assume the immersion germs on the whole seams agree with rigidly placed quadratic references \(F_{R_j,t_j}(z)=(R_j z,R_jt_j q(z))\), where \(q=(|y|^2-|x|^2)/2\) and \(R_j,t_j>0\). Use the induced Riemannian metric, the orientation-compatible Gauss map \(\nu\) and \(d\nu=-dF\circ A\). All counts and integrals use the domain, including when images intersect. As in the draft, let \(E_+(C)=\int_C |W^+|_{\rm HS}^2\), \(I_2(C)=\int_{C\cap U_2}\det A\), \(J(C)=\int_C(-\det A)_+\) and \(B^2(C)=\int_C|A^\circ|^4\), with induced volume and \(U_2\) the \((2,2)\) locus.

Insert the reference graphs on the patch interiors, fixing \(C\) and the smooth domain \(M\). With the compatible normal, write \(N_j\) for the injective one-sign image of \(P_j^\circ\), \(s_j=\sigma_4(N_j)\), \(S=\sum_j s_j\), and \(\omega_4=8\pi^2/3\). Each reference has positive Jacobian and produces only middle critical points. Thus the seam data give the exact signed exterior count at almost every \(u\in S^4\),
\[
 d_C(u)=1-\ell(u),\qquad \ell(u)=\sum_j\boldsymbol 1_{N_j}(u).
\]
Indeed \(d_C(u)\) sums \(\operatorname{sign}\det A\) over the \(C^\circ\) preimages of \(u\). The compatible differential identifies \(TM\) and \(\nu^*TS^4\) as oriented real bundles, so \(2\deg\nu=\chi(M)=2\). Passing from the completed immersion to \(C^\circ\) subtracts exactly \(\ell(u)\) positive preimages from the signed count \(1\). Critical values and seam images are excluded. For example, \(\ell(u)=3\) requires at least two negative-Jacobian preimages of \(u\) in \(C^\circ\). The oriented count distinguishes the actual normal signs, and the height count sums over them.

Set \(k(u)=\ell(u)+\ell(-u)\) and let \(m_i(u)\) count all index-\(i\) critical points in the reference completion. At a Morse direction away from the seam Gauss images, all odd critical points and all extrema lie in \(C^\circ\). The alternating sum of critical points is \(2\), and each height has a minimum and a maximum. Thus, writing \(m_{2,C}(u)\) for the exterior index-two count,
\[
 m_1(u)+m_3(u)=m_{2,C}(u)+k(u)+m_0(u)+m_4(u)-2 .
\]
The Hessian at a critical point is \(\pm g(A\cdot,\cdot)\). The area formula counts each negative-determinant preimage twice in the integral of the odd height count and each middle preimage twice in the integral of \(m_{2,C}\). Also \(\frac12\int k\,d\sigma_4=S\). We obtain
\[
 J(C)=S+I_2(C)+\frac12\int_{S^4}\bigl(m_0(u)+m_4(u)-2\bigr)\,d\sigma_4(u)\ \ge S+I_2(C).
\]
In particular, an exterior with rank-deficient Gauss map or nonnegative determinant almost everywhere cannot match even one of these nonflat seams. Localizing slopes alone cannot make \(J(C)\) smaller than \(S\).

For a hypothetical nonstandard \(M\), the parent handle-count lemma gives \(m_2(u)\ge2\). With \(D_C=\frac12\int(2-k)_+\,d\sigma_4\), this implies \(I_2(C)\ge D_C\). The strict middle-signature comparison applies on the exterior side of a nonempty quadratic seam, and the parent pointwise shape deficit gives \(B^2(C)/6\ge E_+(C)+(8/9)J(C)\). Consequently the necessary exterior budgets are
\[
 J(C)\ge S+D_C
 =\omega_4+\tfrac12\int_{S^4}(k-2)_+\,d\sigma_4,
 \qquad
 B^2(C)>\tfrac{64}{3}D_C+\tfrac{16}{3}S.
\]
The converse recognition tests from these inequalities use a strict upper bound for \(J\) and an inclusive upper bound for \(B^2\). For three copies with identical one-sign images of area \(s\), \(D_C=\omega_4-2s\) and \(J(C)\ge\omega_4+s\) on a nonstandard type, stronger than the previously inherited global \(J\ge\omega_4\). The budget involves the exact shape and normal counts on the retained exterior. It applies also when an original filling was different from the reference graphs, since the proof replaces only the interiors.

The indexed area calculation uses the normal-bundle identity in Onti–Vlachos, arXiv:1610.07349v3, §3, equation (5), inspected 25 November 2026. The odd-count specialization and the same-domain subtraction above follow directly from that identity and the Morse Euler sum. The strict middle-energy bound, pointwise shape deficit and smooth handle-count input are inherited from the parent manuscript, with the primary sources at those points of dependence. [Onti–Vlachos](https://arxiv.org/pdf/1610.07349) · [Canonical source record](../../../../../references/SOURCE_NOTES_MASTER_RICCI_IMMERSION_20261125.md)

## Three exact collars on one standard sphere

Take the unit sphere translated so its north pole is at the origin, with the usual outward orientation. In its upper graph chart \(X\in\mathbb R^4\), let \(h_0(X)=\sqrt{1-|X|^2}-1\). Fix \(a_j=5j e_1\) for \(j=1,2,3\) and a smooth cutoff \(\chi\) supported in \(B_2(0)\), equal to one on \(B_{3/2}(0)\). For \(r>0\) sufficiently small, replace the graph height in that chart by
\[
 h_r(X)=h_0(X)+\sum_{j=1}^3 \chi(X/r-a_j)\bigl[r^2q(X/r-a_j)-h_0(X)\bigr].
\]
The supports are pairwise disjoint and inside a fixed upper chart. The horizontal map is unchanged and has rank four. The map agrees with the round embedding off those supports, and the changed upper sheet stays separated from the lower sheet by the \(O(r^2)\) height bound. Thus this is one smooth embedding on the given standard \(S^4\).

In each patch use the marked chart \(z\mapsto X=r(a_j+z)\) for \(z\in\Omega\). The rounded bidisk \(\Omega\) satisfies \(|z|\le\sqrt2<3/2\), and the graph there and on a collar of the whole seam is exactly \((ra_j,0)+F_{r,r}(z)\). The retained exterior is the complement of the interiors of these three marked chart disks. Its transition regions are precisely the chart supports outside the removed interiors, and the rest of the exterior is round. For levels \(q=\pm\lambda\), where \(\delta_0<\lambda<1/2\), the actual height levels are \(\pm r^2\lambda\). The incoming face is parametrized by \((\theta,v)\mapsto(\sqrt{2\lambda+|v|^2}\theta,v)\) and the outgoing face by \((w,\phi)\mapsto(w,\sqrt{2\lambda+|w|^2}\phi)\), with the two disk radii at most \(\sqrt{1-2\lambda}\). The side uses \((q,\theta,\phi)\), so the angle identifications across the rounded corner and the normal framing vectors are the product ones on all three patches. For each \(r\), Sard's theorem permits choosing \(\lambda\) so both levels are regular on the whole closed domain. These are simultaneous local trace markings in the actual global levels.

On the supports the sheet difference has size \(O(r^2)\), first derivatives \(O(r)\) and second derivatives \(O(1)\). In fact \(h_0(0)=0\), \(Dh_0(0)=0\) and each cutoff derivative of order \(k\le2\) costs \(O(r^{-k})\). The graph formula gives uniformly bounded shape and curvature on a set of induced volume \(O(r^4)\). On the round part \(W^\pm=0\), \(A^\circ=0\) and \(\det A>0\). It follows that
\[
 E_\pm(S^4),\ B^2(S^4),\ J(C) = O(r^4),\qquad E_\pm(C)\le E_\pm(S^4).
\]
These bounds account for every transition point. The three actual reference normal images agree and have common area
\[
 s_r=r^4\int_\Omega(1+r^2|z|^2)^{-5/2}\,dz=|\Omega|r^4+O(r^6).
\]
Thus \(3s_r\le J(C)\le C_0 r^4\), for a constant \(C_0\) independent of \(r\), showing the quartic order of the necessary seam cost. We have \(D_C=\omega_4-2s_r\), so for sufficiently small positive \(r\) the actual exterior satisfies \(E_+(C)\le (8/3)D_C\) and the global \(E_+(S^4)\le64\pi^2/9\). The full metric also satisfies \(E_+<8\pi^2\) and \(Y>0\). For the sign, the induced metrics \(g_r\) are uniformly equivalent to the unit round \(g_0\). Gauss and the support-volume estimate give \(\|\operatorname{Scal}_{g_r}-12\|_{L^2(g_r)}=O(r^2)\). Compact Sobolev for \(g_0\) therefore gives \(\|f\|_{L^4(g_r)}^2\le C(\|df\|_{L^2(g_r)}^2+\|f\|_{L^2(g_r)}^2)\) with a uniform constant. Hölder gives
\[
 Q_{g_r}(f)\ge (6-C'r^2)\bigl(\|df\|_{L^2(g_r)}^2+\|f\|_{L^2(g_r)}^2\bigr),
\]
which makes the Yamabe quotient uniformly positive for small \(r\). For the compact Sobolev embedding and the normalization of \(Q\), see Lee–Parker, §2, Theorem 2.3 and equations (1.3)–(1.4), primary text inspected 25 November 2026. [Lee–Parker](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

## Scope on other types

The same cutoff fits inside a tangent graph chart on any supplied smooth immersion of a smooth homotopy four-sphere. After a rigid placement the chart height again has zero constant and linear terms at the origin. Rank and the \(O(r^4)\) local curvature integral estimates persist. For each of \(E_+,B^2,J\), the integral on the resulting \(C\) differs from the corresponding original full-domain integral by \(O(r^4)\), since both changed regions have bounded densities and volume \(O(r^4)\). The exterior energy converges to the entire original energy and \(D_C\to\omega_4\). On a nonstandard type the strict recognition gap of that fixed original immersion therefore persists for all sufficiently small \(r\). Prescribed global attaching maps and a low-cost initial immersion on an unclassified type remain additional inputs. The three-patch example resolves the compatibility and threshold on one explicitly given standard smooth type.
