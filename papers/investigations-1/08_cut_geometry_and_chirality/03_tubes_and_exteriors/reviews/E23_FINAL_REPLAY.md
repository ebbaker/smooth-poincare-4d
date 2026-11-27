# E23 — Independent replay of the fiber and finite-shear tests

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance under [E23_REQUEST_R1](../research-progress/handoffs/E23_REQUEST_R1.md). Sol 6.2/ultra requested. Actual model and effort unavailable. Base checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Input SHA-256 prefixes are 522663791ad76fb5 for [E20](E20_SHORT_AXIS_READBACK.md), 13f0c9fd8c074d29f for [E21](../notes/E21_FINITE_CHAMBER.md), a2ba39f2eabb1d0d for its [checker](../numerics/finite_chamber_certificate.py), and c579c4b0ca8c5e8d for [E22](../notes/E22_FIBER_OBSTRUCTION.md).

The positive-scalar-curvature obstruction holds for the specified oriented fibered doubles, and the converse can be realized by a metric invariant under the actual double reflection. The finite-width shear inequality holds in the stated diagonal gauge. The fixed E21 profile gives a smooth positive-scalar-curvature cap, with its signed energy already above \(8\pi^2\) on the unchanged middle interval. All metrics are Riemannian and the Weyl norm is the Hilbert–Schmidt norm on the real chiral block.

## Fibered doubles

Let \(P=Q\setminus\operatorname{int}B^3\) for closed, connected, oriented smooth \(Q\), and let \(X_\varphi\) be the mapping torus of a smooth orientation-preserving diffeomorphism of \(P\) preserving its boundary. Choose a smooth vertical inward field along \(\partial X_\varphi\) and use its flow for a short fiberwise collar. The smooth double \(M\) is a mapping torus over \(S^1\) with fiber \(F=P\cup_{\partial P}\overline P=Q\#\overline Q\). One can take the transport field on the double to be reflection invariant by averaging over the reflection. It still projects to the unit velocity on \(S^1\). The resulting monodromy \(\Phi\) commutes with the fixed reflection \(\iota\) on \(F\). This construction works for \(\varphi\) with arbitrary smooth boundary jets.

Suppose \(M\) has a smooth metric of strictly positive scalar curvature. Write \(\alpha=p^*[d\theta]\), with \(p:M\to S^1\) the bundle projection and \([d\theta]\) the integral generator. The long exact homotopy sequence, using connectedness of \(F\), gives surjectivity of \(p_*\) onto \(\mathbb Z\). Thus \([F]=\operatorname{PD}(\alpha)\) is primitive of infinite order. Minimize the mass of an integral current in that class. In ambient dimension four the minimizer is a finite union of disjoint closed embedded oriented, hence two-sided, minimal hypersurfaces \(S_i\) with positive integer multiplicities \(m_i\). Each is stable by varying it in a disjoint collar. Stability and the Gauss equation give, for every smooth function \(v\) on \(S_i\),
\[
 \int_{S_i}\bigl(2|\nabla v|^2+R_{S_i}v^2\bigr)
 \ \ge\ \int_{S_i}(R_M+|A|^2)v^2.
\]
The three-dimensional conformal Laplacian \(-8\Delta_{S_i}+R_{S_i}\) has positive first eigenvalue, so conformal change by its positive first eigenfunction gives positive scalar curvature on \(S_i\). [Schoen–Yau, proof of Theorem 1, equations (1.1)–(1.9)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11170-Shing-Tung_Yau_358.pdf)

Pushing any loop in \(S_i\) slightly along its global normal yields a homologous loop disjoint from the entire weighted cycle. Thus each restriction of \(\alpha\) vanishes on loops and each inclusion lifts to the cyclic cover \(F\times\mathbb R\). Projecting a lift to \(F\) gives a degree \(d_i\), independent of lift since \(\Phi\) preserves orientation. The generator of \(H_3(F\times\mathbb R;\mathbb Z)\) pushes forward to \([F]\), so \(\sum_i m_i d_i=1\). In particular some \(S_i\) maps to \(F\) with nonzero degree.

If \(F\) had an aspherical prime \(N\), pinching other summands would give a degree-one map \(F\to N\). Every map from a closed orientable positive-scalar-curvature three-manifold to \(N\) has degree zero. In fact, the three-dimensional classification leaves prime summands with finite fundamental group and copies of \(S^1\times S^2\). The group of \(N\) is torsion-free since it admits a finite-dimensional classifying space. A map from a finite-group prime to \(N\) is then nullhomotopic, and maps from an \(S^1\times S^2\) prime factor up to homotopy through \(S^1\). The pinch to a wedge of primes induces an isomorphism on fundamental groups, so any map into the aspherical \(N\) factors up to homotopy through it and every summand contributes zero to the degree. This proves that \(F\), hence \(Q\), has no aspherical prime. Kotschick's Theorem 5 expresses the three-dimensional step as rational inessentiality. The closing part of his proof of Theorem 8 already uses the mapping-torus domination argument after geometric formality provides the fibration. For a given fibration the argument requires neither formality nor a Betti-number assumption. [Gromov–Lawson, Theorem 8.1](https://www.numdam.org/item/PMIHES_1983__58__83_0.pdf) · [Kotschick, Theorem 5 and proof of Theorem 8, pp. 440, 443–444](https://intlpress.com/site/pub/files/_fulltext/journals/pamq/2017/0013/0003/PAMQ-2017-0013-0003-a003.pdf)

The passage in E22 from a positive weak Yamabe quotient on a \(C^{1,1}\) double also checks. \(C^1\cap W^{2,2}\) smoothing gives \(L^2\) convergence of the scalar curvature. With \(Q_h\) the weak conformal-Laplacian quadratic form, the resulting form error is \(o(1)(\|dv\|_{L^2}^2+\|v\|_{L^4}^2)\). The gradient norm is at most \((Q_h(v)+\|R_h\|_{L^2}\|v\|_{L^4}^2)/6\). A strict positive Yamabe quotient bounds \(\|v\|_{L^4}^2\) by a constant times \(Q_h(v)\), so sufficiently close smooth forms have positive first eigenvalue. A smooth conformal representative of positive scalar curvature then follows for the approximating metric. The topology argument only needs the resulting existence on the smooth double.

### Reflective converse

If \(Q\) has no aspherical prime, it is a connected sum of spherical space forms and \(S^1\times S^2\) factors, allowing \(Q=S^3\). Thus \(P\) has the interior connected-sum description in Carlotto–Li's Remark 4.9, with a genus-zero handlebody contributing its sphere boundary. By that remark and Theorem 1.3, the space of positive-scalar-curvature doubling metrics is nonempty and path connected. The proof of Theorem 1.3 identifies it with positive-scalar-curvature smooth metrics on the fixed double invariant under the fixed involution. [Carlotto–Li, *Constrained deformations of positive scalar curvature metrics, II*, CPAM 77 (2024), 795–862, Theorem 1.3, Remark 4.9 and proof of Theorem 1.3](https://doi.org/10.1002/cpa.22153)

Choose such an invariant \(h_0\) on \(F\). Since \(\Phi\) commutes with the reflection, \(\Phi^*h_0\) is also invariant. Join them through invariant metrics \(h_t\) of positive scalar curvature, with a smooth parameter and constant end intervals. To smooth a continuous path, use a sufficiently fine partition in the \(C^2\) topology and interpolate along the line segments between neighboring metrics with smooth parameter cutoffs. Scalar positivity is open in \(C^2\) and reflection invariance is linear in the tensors, so these interpolations retain both properties. With the convention \((1,y)\sim(0,\Phi(y))\), the metric \(g_L=L^2dt^2+h_t\) descends smoothly to \(M\). Put \(K=\tfrac12\partial_t h_t\) and \(H=\operatorname{tr}_{h_t}K\). Its scalar curvature is
\[
 R(g_L)=R(h_t)-L^{-2}\bigl(2\partial_t H+H^2+|K|_{h_t}^2\bigr).
\]
Compactness gives a uniform positive lower bound on \(R(h_t)\) and bounded corrections. Taking \(L\) sufficiently large gives strict positivity. The actual reflection is an isometry of \(g_L\), so its seam is totally geodesic and the restriction to \(X_\varphi\) has a smooth positive reflective double. This supplies a metric for the scalar sign. The construction has no small Weyl-energy estimate or prescribed Berger seam germ.

## Finite-width shear

For the diagonal orbit metric \(g=ds^2+\sum_i l_i^2\sigma_i^2\), put \(P_l=l_1l_2l_3\), \(k_i=l_i'/l_i\), \(A_i=-k_i'-k_i^2\) and \(T_i=K_{h_s}(j,k)-k_jk_k\) with cyclic \(i,j,k\). The \(i\)th diagonal of either Weyl block is \(\mathcal E_i\pm M_i\), where \(M_i\) is the mixed curvature entry and \(\mathcal E_i=(A_i+T_i)/2-R/12\). In particular,
\[
 \mathcal E=-\tfrac12(k^\circ)' + G,\qquad
 G=\tfrac12(T-k^2)^\circ .
\]
Here \({}^\circ\) subtracts the three-axis mean and \(k^2\) denotes componentwise squares. With the quotient orbit volume \(\pi^2 P_l/4\), the arithmetic mean \(e\) of the two signed energies satisfies \(e/\pi^2=\tfrac14\int P_l(|\mathcal E|^2+|M|^2)\,ds\) on the transition. If the outgoing face is umbilic, integration of the identity and weighted Cauchy–Schwarz give
\[
 \frac{e}{\pi^2}
 \ \ge\
 \frac{\bigl(\tfrac12|k^\circ_{\rm in}|-\int|G|\,ds\bigr)_+^2}
      {4\int P_l^{-1}\,ds}.
\]
For transition length \(\epsilon\), \(P_l\ge v_{\min}>0\) and \(|G|\le C\), this is E20's \(v_{\min}(\tfrac12|k^\circ_{\rm in}|-C\epsilon)_+^2/(4\epsilon)\). Uniform positive lower and finite upper bounds for the lengths, together with a uniform bound on \(k_i\), suffice for these coefficient bounds. At the actual round midpoint the ordered shape values are \((\sqrt3,-\sqrt3,0)\), from differentiating \(4(\sin s,\sin(\pi/3-s),\sin(\pi/3+s))\) at \(s=\pi/6\). Thus the bound diverges for widths tending to zero under those uniform bounds with the inner round shear bounded away from zero. A finite width can exhaust the numerator, and a family with unbounded shape or degenerating radii falls outside this inference. The inequality controls the mean and hence at least one chirality.

## E21 finite-chamber replay

The actual round chamber cut at \(s_0=\arctan(7/24)\) gives the stated value and derivative triples. Writing \(d_i=C_i-l_i(s_0)\), \(m_i=\tfrac12 l_i'(s_0)\) and \(x=2(s-s_0)\), the independent cubic formula is
\[
 l_i(x)=l_i(s_0)+m_ix+(3d_i-2m_i)x^2+(m_i-2d_i)x^3 .
\]
It meets the terminal constant metric to first order. The terminal ratio is \(\sqrt3\), its scalar curvature is \(50/121\), and its length-\(1/100\) product contributes \(2\sqrt3\pi^2/165\) to each chirality. The unit round part has \(R=6\) and zero Weyl energy.

The supplied 2,048-cell rational checker reproduced the recorded bounds, including \(R\ge2379/500\) on the cubic and \(E_-/\pi^2\ge2503/200\) on the middle interval. As a second calculation I used the independent radial expression \(A_i=-l_i''/l_i\) and, with \(\mu_i=2l_i/(l_jl_k)\), the Ricci and mixed expressions
\[
 \rho_i=\tfrac12\bigl(\mu_i^2-(\mu_j-\mu_k)^2\bigr),\qquad
 T_i=\tfrac12(\rho_j+\rho_k-\rho_i)-k_jk_k,\qquad
 M_i=\tfrac12\bigl[\mu_i(k_j+k_k-2k_i)+(\mu_k-\mu_j)(k_k-k_j)\bigr].
\]
The last expression expands to the same signed mixed term in the outward-first quaternion orientation. I enclosed each polynomial and its normal derivatives on 4,096 dyadic cells with rational interval operations, using the shared interval primitives and consecutive \(10^{-15}\) grid endpoints bracketing \(\sqrt3\). I rounded each density range outwards on a \(10^{-8}\) grid before summing its lower and upper rectangles with weight given by the cell width. Rounding the final totals outwards on a \(10^{-3}\) grid gave the following enclosures. The independent calculation used the common shareable arithmetic primitives and different curvature expressions and cell widths. It was an inline calculation, with the recorded E21 checker providing the repository reproduction route.

| Quantity | Independent rational enclosure or strict bound |
|---|---:|
| \(l_i\) on the cubic | \(\ge28/25\) |
| \(R\) on the cubic | \(>4\) |
| \(E_+/\pi^2\) on the cubic | \([11.401,11.514]\) |
| \(E_-/\pi^2\) on the cubic | \([16.392,16.524]\) |
| \(E_-/\pi^2\) on \(1/8\le x\le7/8\) | \([12.571,12.668]\) |

Both joins have matching first jets with bounded one-sided second derivatives. Positive-kernel convolution in small neighborhoods preserves positivity for sufficiently small supports because scalar curvature is affine in the second derivatives there, the lengths stay positive and the coefficient commutator tends uniformly to zero. A cutoff in the smooth regions gives \(C^2\) convergence off the joins. This leaves the closed middle interval, the bolt, and a terminal product strip fixed. Hence the middle alone excludes the subcritical closed band for this cap and these smoothings, using nonnegative exterior energy in the corresponding chirality. Reversing orientation simply exchanges which chirality exceeds the wall. The bound gives no infimum over other finite-width profiles.
