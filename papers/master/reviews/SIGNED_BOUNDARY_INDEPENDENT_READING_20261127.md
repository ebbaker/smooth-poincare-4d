# Signed boundary data and recognition at a marked cut

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model variant and reasoning effort were unavailable.
This is the bounded independent reading for master B01 on checkout
`72068cef1973d23aee808fe66476c44ed4b99cc5`. The 08 manuscript was read at
Git object `91ca2d3f2dbb06dc3b391186c24c875e5c888aaf`, the 05 marked-cut
manuscript at `a4529b7df605539f0fb1ba26e55bb24893a19e88`, and the 06
attainment manuscript at `bcc19e67ef1aed4890cf391d87a384a98337bfab`.
I recomputed the boundary and collar signs, Gauss positivity, the application
to both native surgery orders, and the one-end example below. The broader
manuscript reading belongs to 08. The 05 marked recognition and 06 compactness
results enter with their stated hypotheses and verification status.
[Master plan][master] · [08 manuscript][08] · [05 marked cuts][05] · [06 attainment][06]

## Boundary sign and normalization

Use a smooth compact oriented Riemannian four-manifold \(V\), with the
outward normal first, and \(E_\pm(V)=\int_V|W^\pm|_{\rm HS}^2\,dV\) on real
two-forms. Let \(B(X,Y)=g(\nabla_X\nu,Y)\) and

\[
  \mathcal T(Y)=\int_Y\sum_i B_i^\circ\wedge(d^\nabla B^\circ)_i,
  \qquad D(Y)=12\pi^2\eta_{\rm sig}(Y,h)+\mathcal T(Y) .
\]

The product-near-boundary signature theorem gives
\(\tau(V)=\tfrac13\int_Vp_1-\eta_{\rm sig}(\partial V)\), with the ordinary
even-form signature eta appearing in that formula. For the product
replacement use the same tangential metric and unit normal on the boundary.
The connection difference there has normal-tangential entries \(B_i,-B_i\).
The linear curvature and cubic terms in the relative Pontryagin form vanish
on restriction, and the quadratic term uses
\(\operatorname{tr}(\theta\wedge d_0\theta)=-2\sum_i B_i\wedge(d^\nabla B)_i\).
Multiplication by \(-1/(8\pi^2)\) and Stokes give a **positive**
\(1/(4\pi^2)\) coefficient for the extrinsic integral. The trace of \(B\)
drops out by symmetry. The conversion to chiral curvature has the same
\(1/(4\pi^2)\) coefficient, since
\(\operatorname{tr}(*\mathcal R^2)=|W^+|_{\rm HS}^2-|W^-|_{\rm HS}^2\).
Thus \(E_+(V)-E_-(V)=12\pi^2\tau(V)+D(\partial V)\). Reversing the normal
negates both \(B^\circ\) and \(d^\nabla B^\circ\), and reversing the induced
orientation negates their integrated pairing and the eta invariant.
[APS I, Theorem 4.14][aps] · [Component replay][component]

With \((\nu,e_1,e_2,e_3)\) positive and
\(\mathcal H_{ij}=\tfrac12\varepsilon_i{}^{kl}W_{klj\nu}\), one has
\(*(e^i\wedge\nu^\flat)=-\tfrac12\varepsilon_{ijk}e^j\wedge e^k\).
The tangential block is
\(W_{ijkl}=+\varepsilon_{ijm}\varepsilon_{kln}\mathcal E^{mn}\), as follows
from the Weyl trace identity. Hence \(W^\pm=\mathcal E\mp\mathcal H\) in
the corresponding bases, and the pointwise chiral difference is
\(-4\langle\mathcal E,\mathcal H\rangle\). Codazzi gives
\(\mathcal H=\operatorname{sym}(\operatorname{curl}B^\circ)\). The invariant
Hölder bound uses \(\|B^\circ\|_3\,\|\mathcal H\|_{3/2}\), with orthonormal
component weights \(-1\) and \(-2\) respectively. The full curl acquires an
antisymmetric conformal term. The existing full-curl bound holds in a
specified gauge. The draft's statement that no later result depends on
the sign should be removed because the collar formula is signed.
[Parent §3 corrections][insert]

The Fubini–Study calibration uses the complex orientation and holomorphic
sectional curvature four. For \(0<r<\pi/2\), the radius-\(r\) ball has
\(\tau=0\), \(E_+-E_-=12\pi^2\sin^4r\), \(12\pi^2\eta=8\pi^2\sin^4r\)
and \(\mathcal T=4\pi^2\sin^4r\). The eta value comes from the intrinsic
Berger path on a product-ended cylinder. It independently tests the
nonzero extrinsic coefficient with the actual outward orientation.
[Exact ball calculation][ball]

On a cut of a smooth homotopy sphere, each side has signature zero since
its absolute cycles intersect inside a closed manifold with zero second
homology. When \(D(Y)\ge0\) with \(Y\) outward from \(V\), the deficit is

\[
 e-|D(Y)|=E_-(V)+E_+(V').
\]

Interchange \(V,V'\) for \(D(Y)\le0\). This determines the required sign
for each side. An umbilic cut in the strict band has
\(|\eta_{\rm sig}|<2/3\), and at \(e<T\) it has \(|\eta_{\rm sig}|<1/3\).
Equality \(e=|D|\) on a smooth connected sphere makes the two sides
oppositely half-flat. Locally the total Weyl functional and twice either
chiral functional have the same first variation, so the metric is
Bach-flat on each side and hence through the smooth interface. In a local
analytic conformal representative the Hodge projectors are analytic as
well, and each vanishing chiral block continues to the whole sphere.
Thus the equality mechanism forces global conformal flatness. For a weak
reflection join one still has the deficit under matched data, while the
smooth propagation argument requires additional regularity.
[Lassas–Liimatainen, Theorem 3.7(c)][ll] · [Smooth and reflected examples][half]

## Both ends of the actual collar

Orient the slices of \(C=Y\times[t_0,t_1]\) with the increasing collar
normal. The cylinder has signature zero, the initial boundary uses the
opposite orientation, and consequently

\[
 E_-(C)=E_+(C)-\bigl(D(Y_1)-D(Y_0)\bigr) .
\]

On fixed-size end windows, if the marked cylindrical Riemannian metric
is \(C^2\)-close to the same unit round product with errors \(\delta_0,\delta_1\),
then \(D(Y_j)=12\pi^2\eta(\gamma)+O(\delta_j^2)\). Indeed restriction controls
the first jets of \(B^\circ\). Interpolating each end's intrinsic metric
to \(\gamma\) on a fixed auxiliary strip gives two Weyl blocks
of order \(O(\delta_j)\), since the round product has zero Weyl tensor.
Product APS on those strips gives the quadratic eta error. The collar
imbalance is \(O(\delta_0^2+\delta_1^2)\) independently of the length
between the end windows. A weak splice with controlled energies in both
signs can instead bound the **combined** endpoint error. Each raw end
needs its own such estimate or a separately verified cancellation.
[03/06 end table and weaker alternatives][neck] · [Independent reading][neckreplay]

In 06's marked compactification lemma the ALE end comparison in the
original source is \(O(R^{-2})+o_i(1;R,\ell)\) in \(C^2\) on a fixed
relative-width window, with buffer length \(\ell\) fixed before taking
large \(R\) and then large \(i\). In the smooth removable chart the
source comparison in the same marked truncation has \(C^2\) error
\(O_\ell(s^2)+o_i(1;s,\ell)\) near the actual normal cut, with the order
\(\ell\), small \(s\), large \(i\). These supply both raw end estimates on
each of those collars. The estimates concern their comparison charts.
Dirac transmission and a slice spectral gap on their own give neither
both endpoint errors nor curvature estimates throughout an unmarked
residual. The closed 06 alternative does not specify a cut. This reading
checks the end premise of the working argument, while the extraction,
smooth marked return and parameter-uniform estimates retain the
specialist-review status in the master register.
[06 marked lemma and second critical sequence][06] · [Master register][masterreg]

**One-end obstruction.** Give a Fubini–Study polar shell the orientation
opposite to the complex orientation, take the outer radius \(\pi/4\), and
let its inner radius \(\epsilon\) tend to zero. In the cylindrical metric
\(r^{-2}g_{\rm FS}\) and coordinate \(t=\log r\), the radial coefficient is
one and the tangential coefficients tend to the unit round ones with
error \(O(\epsilon^2)\) through two derivatives on a fixed inner \(t\)-window.
Interpolate to the exact unit product near its initial face with a fixed
cutoff supported in that window. The two splice energies are
\(O(\epsilon^4)\). Beyond the splice conformal invariance and the calibrated
ball formula give \(E_+=0\) and \(E_-\to3\pi^2\). Therefore the resulting
smooth shells have an exactly round umbilic initial end and
\(E_+\to0\), while \(E_-\to3\pi^2\). The final face carries
\(D(Y_1)=-3\pi^2\), and the initial one has \(D(Y_0)=0\). This disproves a
length-independent vanishing transfer from arbitrarily small \(E_+\) and
one ideal end. Each shell embeds in standard \(S^4\) and its smooth metric
extends across unspecified complements. This calculation gives a collar
counterexample with unrestricted exterior energy and Yamabe sign.
[Fubini–Study polar coefficients and energies][ball]

## Recognition and its missing geometric premise

For \(T=4\pi^2\), an entering class has positive Yamabe sign and common
\(e=E_+=E_-<2T\). Chern–Gauss–Bonnet gives
\(\int\sigma_2(A)=T-e/2>0\) for \(A=(\operatorname{Ric}-Rg/6)/2\).
Chang–Gursky–Yang give a positive-scalar representative with
\(\sigma_2(A)>0\). Since \(Z=\operatorname{Ric}-Rg/4\) is trace-free,
\(|Z(\nu,\nu)|\le(\sqrt3/2)|Z|<R/4\) in this gauge. Gauss then gives
\(R_Y=R-2\operatorname{Ric}(\nu,\nu)+2H^2/3-|B^\circ|^2\), so an actual
umbilic hypersurface carries positive scalar curvature. The strict
small-bending criterion in the same fixed gauge suffices for positive
Yamabe type. The inclusive inequality in the parent remark gives weak
two-convexity at \(H>0\), as \((H,0,0)\) shows.
[CGY, Theorem 1.3 restating the 2002 result][cgy] · [SEAM bending estimate][bend]

Fix the reduced mixed presentation and its normalized winding row
\((1,0)\), including both framings and the actual upper identification.
The first winding-one trace is contractible, and the first winding-zero
cut has an auxiliary zero-linking-matrix trace. For the winding-one cut
apply the obstruction to a signed Poincaré-sphere sum bounding a smooth
compact contractible four-manifold. In the winding-zero trace, compression
along the two product-factor spheres reduces the PSC-dominated boundary
to the same obstruction. The geometric closing in either case is the
working marked theorem of 05. A nonzero-degree map from a closed oriented
PSC source to either **actual** cut therefore gives
\(Z_a\cong S^3\) or \(Z_b\cong\#_2(S^1\times S^2)\), respectively, and
\(M\cong S^4\). In particular an umbilic source diffeomorphic to either
actual cut suffices. The same application works with a weakly bent source
under SEAM's strict positivity test. The source need only carry the map.
The reflected Yamabe signs are irrelevant to this implication.
[Chodosh–Maximo–Mukherjee, Prop. 2.2, Cor. 2.3 and Prop. 4.2][cmm] · [05, The two normalized mixed cuts][05]

The separate seam theorem uses **both** positive reflected doubles.
For a PSC connected sum of free rank \(k\), Mayer–Vietoris and duality
give \(b_1(V)=a\), \(b_2(V)=k-a\) and the opposite values on \(V'\).
The doubles have \(b_1=a,k-a\) and \(b_2=2(k-a),2a\), respectively.
The positive-double estimates force \(e\ge2T\) for mixed first Betti ranks
and \(e\ge2T(1+k)/3\) in the extreme case with \(k\ge1\). Thus a winding-zero
cut in the entering band cannot itself be an umbilic seam with both
doubles positive. Its positive induced scalar curvature would give
\(Z_b\cong\#_2(S^1\times S^2)\), and \(k=2\) contradicts the seam bound.
This is a restriction on selecting that cut by a positive-double
construction. The actual cut can still be targeted by a PSC source and
degree map; neither this review nor a local positive cut produces the map.
[SEAM comparison with native cuts][seam] · [Fu, statement witness for Gursky's inequalities][fu]

## Intake as of this reading

| 08 lane | Available evidence and its scope |
| --- | --- |
| Parent E02 and B01 | The parent register retains setup text. The working tree contains the issued E02 reading request (`E02_REQUEST_20261127.md`), pinned to the manuscript object above. A full independent E02 return or parent B01 integration was absent at this read. This bounded review covers the sign and marked applications. [Parent register][cutreg] |
| LED | Former E01 and E03 are now LED-E01 and LED-E02. The Fubini–Study sign, correction sheet and actual two-end comparison return are available. Exact smooth opposite-half-flat joining at positive energy is excluded. [Crosswalk][cross] · [LED register][ledreg] |
| SEAM | Former E05 is now SEAM-E01. The seam and native cut comparison, Robin sign test, fixed-class weak bending and matched smoothing returns are available. The raw and capped energies may agree in a smooth limit, and capped positivity requires its stated sign test. The prescribed short-axis triaxial trial's certified half-sum upper bound is \(6.46666\pi^2\) against a \(4\pi^2\) target. These are scope-limited metric and obstruction results. [SEAM register][seamreg] · [Free-cut descent][free] |
| GEO | The specific negative Berger germ has signed differences \(-75\pi^2,+75\pi^2\), by \(-2401\pi^2/32+\pi^2/32\) on the first side. It forces \(e>75\pi^2\) on every smooth homotopy-sphere completion of the marked data. This removes that local candidate from the entering band, while selection of a positive first-width cut remains open in general. [GEO register][georeg] · [Germ derivation][berger] |
| TUBE and SLIDE | The marked tube models supply positive cap and exterior calibrations with finite budgets and exact obstructions in their stated classes. The register and in-progress working files contain no certified strict entry on a new type or unrestricted marked-closing theorem. SLIDE's native GST and prefix exclusions concern specified labels and histories, and the decision to redirect further enumeration remains with 05. [TUBE register][tubereg] · [SLIDE register][slidereg] |

The master can use the signed comparison on specified marked collars and
the conditional recognition criterion for either normalized cut. The
remaining direct-S premise is an actual PSC source with nonzero degree to
one native cut in a presentation of a type still in question.

[master]: ../research-plan/PLAN.md
[masterreg]: ../research-progress/REGISTER.md
[08]: ../../investigations-1/08_cut_geometry_and_chirality/manuscript/cuts_of_subcritical_conformal_classes.tex
[05]: ../../investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex
[06]: ../../investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex
[aps]: https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24
[ll]: https://arxiv.org/pdf/1912.08030
[cgy]: https://www.numdam.org/article/PMIHES_2003__98__105_0.pdf#page=8
[cmm]: https://www2.math.upenn.edu/~dmaxim/floer.pdf
[fu]: https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-p.pdf#page=3
[component]: ../../investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/reviews/PARENT_SECTION_3.md
[insert]: ../../investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/research-progress/handoffs/TO_PARENT_SECTION_3_AND_LANE_20261127.md
[ball]: ../../investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/notes/FS_BALLS.md
[half]: ../../investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/notes/HALF_FLAT.md
[neck]: ../../investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/notes/NECK_TABLE.md
[neckreplay]: ../../investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/reviews/NECK_VARIATION_CUT_REPLAY.md
[bend]: ../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E05_UNIFORM_BENDING.md
[seam]: ../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E01_DERIVATION.md
[cutreg]: ../../investigations-1/08_cut_geometry_and_chirality/research-progress/REGISTER.md
[cross]: ../../investigations-1/08_cut_geometry_and_chirality/research-progress/CROSSWALK_20261126.md
[ledreg]: ../../investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/research-progress/REGISTER.md
[seamreg]: ../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/research-progress/REGISTER.md
[free]: ../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/QUANTITATIVE_DESCENT_20261127.md
[georeg]: ../../investigations-1/08_cut_geometry_and_chirality/05_cuts_from_geometry/research-progress/REGISTER.md
[berger]: ../../investigations-1/08_cut_geometry_and_chirality/05_cuts_from_geometry/notes/BERGER_COMPLETION_OBSTRUCTION_20261127.md
[tubereg]: ../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/research-progress/REGISTER.md
[slidereg]: ../../investigations-1/08_cut_geometry_and_chirality/04_slide_filters/research-progress/REGISTER.md
