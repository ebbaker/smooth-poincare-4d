# Edition 03 assessment of rounded edges and the cost of a flat reference

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Author-selected lead GPT-6.2 Astra/ultra, with six bounded GPT-6.2 Sol/ultra assignments for proofs, intake and independent reading. Independent lead serving telemetry is unavailable. The working intake was a7bb158d6af806d2573a7702386622ed4c0bb1f1. [Frozen requests](../research-progress/handoffs/ED03_ROUNDED_EDGE_PACKETS_20261125.md) · [Six scientific generations, toolchain and pins](../research-progress/handoffs/ED03_ROUNDED_EDGE_INPUTS_20261125.md) · [Scientific and formal scope crosswalk](MASTER_MANUSCRIPT_ALIGNMENT_20261125.md)

## What the selected Morse data determine

On the compact smooth four-manifold of the supplying Riemannian immersion, use the ordered Morse height or its negative. The preceding inclusive bound \(E_+\le64\pi^2/9\) selects a height with at most one middle critical point. A one-handle in either actual end filtration can now be tested directly. Some filtrations have no merging edge.

For a birth at \(p\), an ambient chart \(E\) covers the radius-two ball and satisfies \(f(E x)=f(p)+\varepsilon |x|^2\). Its closed unit ball is the entire connected body component of \(p\) at \(f(p)+\varepsilon\). Its sphere marks the intersection with the native level. The closed disk and sphere transport together across the next regular band. This supplies an incoming marked ball when its history consists of a birth followed by regular transport. [Birth body](../../SmoothPoincare/Heights/NativeBirthBody.lean)

Let \(a_b\) label the incoming body containing the center of foot \(b\in S^0\). The map \(q\) induced by lower insertion into the adjunction followed by the stored trace diffeomorphism is onto, with
\[
 q(u)=q(v)\quad\Longleftrightarrow\quad
 u=v\ \ \text{or}\ \ \{u,v\}\subseteq\{a_-,a_+\}.
\]
Distinct body labels give disjoint level components, the premise for E40's simultaneous normalization of the two feet. Equal labels for distinct feet obstruct simple connectivity of the outgoing sublevel. For an isolated middle two-handle the component map is bijective, since its attaching circle is connected. None of these results assumes simple connectivity of an intermediate sublevel. A closed marked two-handle diagram still needs its actual knot, framing and exterior gluing. [Native incidence](../../SmoothPoincare/Heights/NativeEdgeIncidence.lean) · [Independent height readback](../09_morse_heights_and_handle_recognition/reviews/ED03_ROUNDED_EDGE_READBACK.md)

The four-dimensional block chart and inverse recover both entire native feet at their attaching radius, with their supplied parities. On the rounded core \(T\) preserves the axial vector and adds \(2\varepsilon+s-\operatorname{smoothCap}(\varepsilon,r,\delta,s)\) to the squared transverse radius, where \(s\) is the squared axial radius. Its inverse subtracts the same amount. The domains require positive transverse radius before and after the shift and the specified chart bounds. With \(R_0>\sqrt{2\varepsilon+2r^2}\), both complete rims lie in the open core. For the native outgoing chart \(\Phi\) at \(c=f(p)+\varepsilon\), the equality of maps \(\Psi=T^{-1}\Phi\) holds on \(U\times(-w,w)\), where \(U\) contains both rim images and \(0<w\le\varepsilon/2\). Its inverse is \(\Phi^{-1}T\). The center recovers every native \(S^0\times S^2\) parameter. [Block and orientations](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_ROUNDED_EDGE_BLOCK.md) · [Signed rim collar](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_ROUNDED_OUTGOING_COLLAR.md)

The next-cut comparison extends the level map \(d\) by preserving signed time, simultaneously for every remaining tube already marked in that outgoing level. The construction covers full open regular bands in both directions and applies to the reversed height. The rounded and regular comparisons now use the very same outgoing chart. If \(H\) is its band extension and \(B_1\) the next-cut collar, throughout the common positive substrip one has \(H(T(\Psi(z,t)))=B_1(dz,t)\) and \(T^{-1}H^{-1}(B_1(dz,t))=\Psi(z,t)\). This product extension agrees with the original regular transport on the zero section. A complete global merger still requires the two incoming-body-to-model maps, every residual tube, and open-overlap equations for the same rounded adjunction used by the stored global trace. Agreement only on a level permits tangential shear in its collar. No additional closed smooth type is recognized. [Next-cut transport](../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_OUTGOING_EDGE_TRANSPORT.md)

## A physical reference and its signed cost

Fix one oriented smooth type of signature zero with positive-class energy infimum \(I\). At one finite source use the nested physical disks \(Q\subset\operatorname{int}B\), width \(w_n=1/(n+1)\), full trim \(W\) and \(R=(B\cup W)^c\). All sufficiently thin widths protect the original core from the transition and make the sum of the four raw trim masses small. The two physical chiral measures and the supplied absolutely continuous spectral-square and full-curvature measures all use the same disk. A smooth Euclidean reference on the buffered native chart realizes a path starting at \(g\), ending flat on \(B\setminus W\), and fixing exterior metric germs on \(R\). It replaces the core. The shifted inner seam has an open flat neighborhood. The original unit seam generally meets the transition. The measured jet estimates use the original physical volume and this same width. Yamabe positivity is an additional condition on an attained competitor. [Physical metric and measured estimates](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_DISK_REFERENCE.md)

For a division at depth \(k\) of tolerance \(\epsilon\), put \(q=2^{-k}\), \(e=E_+(g)\). Every attained Yamabe-positive metric \(h\) on this type that is flat on \(B\setminus W\) satisfies, separately for \(s=+,-\),
\[
 \lambda_h^s(W)+\bigl(\lambda_h^s(R)-\lambda_g^s(R)\bigr)
 > I-q\bigl(e-\lambda_g^s(Q)\bigr)-\epsilon .
\]
Indeed the sum of the new trim and exterior charges is \(E_s(h)\ge I\). The full incoming exterior from division bounds \(\lambda_g^s(R)\). With matching exterior metric germs and frames the full price lies on \(W\). For independent frames, equality of restricted measures follows given the orthogonal wedge lift, Hodge projection commutation and actual curvature conjugacy. The actual tangent frame change lies in \(SO(4)\). Identifying its ordered wedge coordinates with the curvature matrices is an explicit remaining premise. [Public price theorem](../../SmoothPoincare/Variational/SelectedReferenceCost.lean) · [Exterior comparison](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_EXTERIOR_GERM_CHARGE.md)

At fixed \(k\), if \(e_i\to I\) and \(\epsilon_i\to0\), for each \(\eta>0\) the left side is eventually greater than \((1-q)I-\eta\) for every such positive endpoint and both signs. If \(k>0\) and \(I>0\), this excludes a late endpoint with zero trim charge and unchanged exterior charge in even one sign. The tolerance precedes the index. The proof uses the finite competitors defining \(I\), without assuming attainment at \(I\). [Independent physical applications](../07_fixed_type_variational_descent/reviews/ED03_REFERENCE_AND_FLUX_READBACK.md)

If the incoming metric matches \(L^*L\) in the original marking on an open neighborhood of the entire closed trim, the flat reference with this Gram matrix has zero trim curvature throughout its path and fixes the complete closed exterior of the original disk. Its endpoint is flat on a neighborhood of the original disk. At an actual positive endpoint in matching exterior frames,
\[
 E_s(h)=\lambda_g^s((\operatorname{int}B)^c),\qquad
 \lambda_g^s(B)=e-E_+(h)\le e-I .
\]
Positive incoming disk charge gives strict finite saving in this case. The factor \(L\) can be obtained at a chosen collar point from the physical metric and derivative of the native chart. Extending the same constant Gram across the whole closed trim remains a geometric condition. [Matched disk](../../SmoothPoincare/Variational/MatchedFlatDisk.lean) · [Construction receipt](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_MATCHED_FLAT_DISK.md)

Two paper-level examples delimit the price theorem. On the standard \(S^4\), a localized Weyl perturbation and a disjoint conformal adjustment give a positive matched endpoint with strict saving and all four incoming divisions. Here \(I=0\). In the original coordinates, splicing a constant anisotropic flat collar to the Euclidean tensor can cost at least \(c\alpha^2w^{-3}\) in each chirality despite zero raw curvature. Taking the matching constant Gram eliminates this cost in that example. Neither example supplies a positive matched repair on a hypothetical nonstandard minimizing sequence. [Calculations](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_DISK_REFERENCE.md) · [Independent checks](../07_fixed_type_variational_descent/reviews/ED03_REFERENCE_AND_FLUX_READBACK.md)

## Spatial Euler transgression

Use the smooth modified Ricci solution at regular times, its volume, orientation and Levi-Civita connection. The normalized Euler density is twice the Pfaffian coefficient in the implemented convention. Unit sectional curvature gives \(6\) and \(3\), respectively. The differential Bianchi identity and connection variation give the local product rule and the bound \(144|\mathrm{Rm}|\,|\nabla\mathrm{Ric}|\) in the proved frame norm. On the actual solution the base vectors are fixed and only the two endomorphism slots move with Ricci gauge velocity. Skew symmetry cancels the metric-lowering terms. This derives the curvature jet needed to differentiate the fixed-base Pfaffian. [Coefficient and spatial estimates](../07_fixed_type_variational_descent/research-progress/handoffs/ED03_SPATIAL_EULER_FLUX.md) · [Actual curvature variation](../../SmoothPoincare/Variational/SpatialEulerVariation.lean)

For a supplied smooth slice current representing \(m'(s)=\int\chi\,\operatorname{div}_{g(s)}X_s\,dV_s\), spatial integration by parts and time integration give
\[
 |m(\tau)-m(0)|\le144\,\delta A L\sqrt{\tau/(1-2b)}.
\]
Here \(\tau>0,\ b<1/2\), the fixed smooth cutoff obeys \(|d\chi|_s\le\delta(\tau/s)^b\), the slice curvature norm is at most \(A\) in \(L^2\), and the squared spatial-derivative budget over time is at most \(L^2\). Endpoint continuity and flux measurability are retained. A formal construction of the smooth frame-invariant current, its intrinsic norm and the derivative of the common-cutoff integral would join the pointwise and integrated results. No separated-quantile physical rescaling with the required proper flat charts, volume and pointwise curvature bounds was supplied. The evolved measure remains on the modified approximation. [E69–E72 scientific handoff](../../../papers/master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md) · [Dated continuation](../continuation-notes/AFTER_ROUNDED_EDGES_AND_REFERENCE_COST_20261125.md)

## Public acceptance and working generations

The final default public Lake build completed successfully with 10,564 jobs on Lean 4.35.0-rc3. The 11 new modules contribute 94 public declarations. Each was replayed with its full type and axiom report through the sole import SmoothPoincare. The complete authored inventory passed 837 such pairs in 129 contributing modules. The blueprint passed all 470 referenced declaration checks through the three public roots. The axiom union was propext, Classical.choice and Quot.sound. Of 171 non-topic historical blueprint names, 102 require one of the two historical roots. [Exact E41 queries](../research-progress/handoffs/ED03_ROUNDED_EDGE_CHECKS.lean)

| Independent public replay | Exact type queries | Axiom reports | Applications |
| --- | ---: | ---: | ---: |
| [Native height](../09_morse_heights_and_handle_recognition/reviews/ED03_ROUNDED_EDGE_READBACK.lean) | 27 | 42 | 17 |
| [Coupled outgoing collar](../09_morse_heights_and_handle_recognition/reviews/ED03_COUPLED_OUTGOING_READBACK.lean) | 0 | 2 | 2 |
| [Physical reference and flow](../07_fixed_type_variational_descent/reviews/ED03_REFERENCE_AND_FLUX_READBACK.lean) | 45 | 45 | 9 |

The six historical Edition 03 acceptance files also passed 256 type queries, 254 axiom reports and 31 applications. The two earlier physical reader fixtures passed a further public-root replay. The balanced-physical fixture retains two existing unused-tactic diagnostics at the same line. [Balanced-physical fixture](../07_fixed_type_variational_descent/reviews/ED03_BALANCED_PHYSICAL_PUBLIC_REPLAY.lean) · [Quadratic fixture](../07_fixed_type_variational_descent/reviews/ED03_QUADRATIC_PUBLIC_REPLAY.lean)

Both blueprint builds passed. All 143 labels resolve in both formats, including all seven new headings on PDF pages 35–37. The audit checked 470 distinct Lean anchors in 471 text occurrences and 471 dependency-graph occurrences, across 216 source pages with 38,923 source-line anchors. The PDF has 37 pages. [Blueprint chapter](../../blueprint/src/rounded_edges_and_reference_cost.tex) · [Rendered PDF](../../blueprint/print/print.pdf) · [Web chapter](../../blueprint/web/sec-ed03-rounded-edges.html)

| Frozen working set | Files | SHA-256 prefix |
| --- | ---: | --- |
| Six manuscript directories | 42 | 80be9ab59f1ddbfc2c0c4647 |
| Scientific plans and registers | 18 | 187d405ee044f01a8b798bb8 |
| Lean topic sources | 131 | b23a1d541605ac895d8045f3 |
| Blueprint TeX sources | 14 | f900d1a78621cdd85f321031 |
| Formalization plans and owning registers | 36 | 6a90fee29f85769d6d1dabd7 |

All six transitive scientific source and PDF pairs still match the intake. The scientific crosswalk, bibliography, root manifest and toolchain are unchanged. The public root SHA-256 starts bfded74abbafb74d7fa292f8. All ten resolved dependency revisions match their root pins, their tracked checkouts are clean, and all nineteen nested entries agree. The linked executable reproduces the working and intake inventories. [Reproduction script](../research-progress/handoffs/ED03_ROUNDED_EDGE_GENERATIONS.py) · [Input versions and individual pins](../research-progress/handoffs/ED03_ROUNDED_EDGE_INPUTS_20261125.md)

The repository capture diagnostic could not locate an exact public thread source and the desktop thread reader did not return it. No authenticated public transcript was registered.
