# E185 — Independent audit of varying-base compactness and uniform entry

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B90, configured
`gpt-6.2-sol` / `ultra`. Independent runtime attestation and selected
lead settings are unavailable. I authored inherited E165 and E162
and audited E168 in E169. Related earlier overlap includes E01C,
E137, E147, E158, E176 and the E180 integration audit. I did not
author E182 or E183. The independent check concerns the changed
varying-base and bundle quantifiers. The [request][req], its six
frozen inputs, and the nested frozen tables of both proofs matched.

## Disposition

**Pass.** E182 supplies precisely \(H_{\rm var}\) of B90, including
the actual smooth positive diffeomorphisms and fixed-reference
regularities without a common initial smooth type. E183's transfer
and both uniform thresholds hold under its stated \(H_{\rm var}\)
premise. No additional analytic or topological premise and no
mathematical repair were identified. The lead owns discharge of
the premise in assessment. E183 remains historically conditional
as written. [B90][b90] · [E182][e182] · [E183][e183].

## E182 — vanishing radius on varying bases

Use smooth closed connected oriented homotopy four-spheres \(M_i\)
with positive smooth \(g_i\). The input is an absolute Ricci
Hilbert–Schmidt tensor bound, a uniform positive Weyl-block
Hilbert–Schmidt operator bound, a positive lower volume and a
diameter upper bound. For the Weyl block, conversion to the full
\((0,4)\) tensor doubles the norm, since both antisymmetric
pairs are summed over ordered indices. The orientation on
each \(M_i\) defines the block and is preserved by the comparison
charts. The full curvature energy below uses the full tensor
norm throughout.

### Radius, metric limit and differentiable charts

E182 uses \(p=8,m=2,\eta=1\) in the coordinate Lebesgue
harmonic-radius definition, with
\(r^{1/2}\|Dh\|_8+r^{3/2}\|D^2h\|_8\le1\).
Both weighted terms decrease under centered restriction.
Local strict inequalities in normalized small harmonic charts
give a uniform lower radius for nearby centers on one smooth
metric, hence a positive infimum \(r_i\) by a finite cover of
that individual compact base. The chart cannot cover the whole
closed manifold, so the radius is finite. Orientation can be
chosen by reflecting one coordinate. No uniformity across
indices enters this per-metric fact.

On a subsequence with \(r_i\to0\), choose approximate minimizers
\(x_i\) and rescale by \(r_i^{-2}\). Scaling the harmonic
coordinates gives a global radius at least one and the near-minimum
upper bound \(1+i^{-1}\) at \(x_i\). Curvature bounds in metric
norm gain \(r_i^2\), and the chosen chiral splitting is unchanged.
With \(D'>D\) and \(\kappa=K/3\), Bishop–Gromov on each \(M_i\)
gives original total volume at most \(\mathcal V_{-\kappa}(D')\).
Using the whole base ball of radius \(D'\) in the same comparison
gives
\[
 \operatorname{Vol}_{\bar g_i} B_{\bar g_i}(y,t)
 \ge \frac{v\omega_4}{\mathcal V_{-\kappa}(D')}t^4
\]
whenever \(r_it\le D'\), uniformly in the center. The upper model
bound at a fixed rescaled radius is \(\mathcal V_{-\kappa r_i^2}(t)\).
Thus fixed-radius disjoint small balls in bounded regions give
uniform packing. Finite distance lists with fixed mesh and radius,
padded and diagonalized, produce a proper pointed metric limit
by quotient and completion. Limits of approximate midpoints give
the geodesic property. The list correspondences compare only
distances within each \(M_i\), with no point presumed shared
by different bases.

A common radius-\(a_0\) harmonic chart contains the Euclidean
ball of radius \(a_0/\sqrt m\) by lifting radial paths of
length below \(a_0\). For \(16\sqrt m\,\rho<a_0\), straight
segments in \(B_{4\rho}\) and short ambient minimizers
give the ambient bi-Lipschitz bounds. A minimizing path
of length less than \((B-b)/(2\sqrt m)\) from a point
with \(|u|\le b<B\le4\rho\) stays in the full chart and its
coordinate displacement is smaller than \((B-b)/2\).
This puts it in \(B_B\) with margin. Passing this inclusion
to the metric limit makes the limiting parametrizations open.
Dense centers cover the pointed limit. On a compact limiting
overlap the strict margin puts the corresponding approximating
point into the other chart on the same \(M_i\), giving actual
transitions and their uniform limit. Each elliptic equation is
then on fixed Euclidean coordinate domains.

For \(a_i=h_i^{-1}\), the harmonic Ricci equation is
\(-a_i^{jk}\partial_{jk}h_i/2+Q(h_i,Dh_i)=\mathrm{Ric}_i\).
Weak \(W^{2,p}\), strong \(C^1\), and vanishing right side
yield a weak Ricci-flat equation with a smooth limit by interior
regularity. In the difference equation, the first-jet terms,
the Ricci terms and the coefficient error times the smooth
limiting \(D^2h\) all tend to zero in \(L^p\). Interior estimates
give strong \(W^{2,p}\). Transition components are harmonic
for \(a_i\). The interior weak limit solves the smooth-coefficient
equation, and the difference equation has right side
\((a-a_i)D^2\theta\to0\) in \(W^{1,p}\). Its derivative adds
\(-Da_i\,D^2(\theta_i-\theta)\to0\) in \(L^p\).
This gives strong \(W^{3,p}\) transition convergence, with
positive Jacobians on the smooth limiting transitions and their
inverses. Short paths and uniform local metric convergence identify
the length metric with the proper geodesic limit's distance.
Thus the smooth oriented rescaled limit is complete. Anderson's
method and the E165 proof are used at the chart level, with no
compactness theorem quoted after dropping its fixed hypotheses.
[Pre-ALE assessment][prea].

### Whole compacts, energy, and the contradiction

For any fixed compact region, the finite cutoff blocks
\((\zeta_a,\zeta_a u_a)\) embed the covered limit neighborhood
by recovery of a coordinate from a nonzero block. The corresponding
smooth maps on \(M_i\) converge in local representations in
\(W^{3,p}\) and \(C^2\), using overlap estimates on closed
supports and eventual vanishing off the supports. Project
these into the fixed smooth limit image near the compact
region to obtain \(R_i\) on the relevant neighborhoods in
\(M_i\). Its local derivatives converge to identity. Nested
chart balls give genuine inverse branches, by injectivity on the
larger convex ball and contraction onto the smaller one.
Candidates on overlaps are metrically close to the same limit
point and so lie in the same larger approximating chart by
the strict margin. Local injectivity makes them agree. The
glued right inverse is an embedding on an open neighborhood of
the whole region. A small supported independent domain correction
makes it based, preserving orientation and the comparison margins.

The inverse-coordinate formula uses derivatives through order
three and uniformly bounded Jacobians, so the pullback
metric convergence is strong \(W^{2,8}\) and local
\(C^{1,\beta}\), \(\beta<1/2\). On a region containing a
larger limit ball the maps capture the smaller intrinsic
approximating balls: a point in one such ball is metrically
near a limit point strictly inside the desired ball, lies
in the larger local comparison chart, and has \(R_i\)-image
inside the limit ball. The local inverse returns that original
point by uniqueness. The outer inclusion follows from metric
comparison. This gives actual embeddings into each corresponding
\(M_i\), with whole-ball coverage for fixed radii. Distance
spheres in the complete smooth limit lie inside the exponential
images of the corresponding tangent spheres, giving zero
four-volume. Volume convergence then passes the uniform
quartic lower bound to every center and radius. Strong metric
convergence passes curvature in local \(L^8\), including the
vanishing of Ricci and \(W^+\) with the chosen orientation.

The specific topological energy input is
\(\chi(M_i)=2\) for every member. Chern–Gauss–Bonnet with
the full tensor norm gives
\[
 \int_{M_i}|\operatorname{Rm}_{g_i}|^2\,dV_{g_i}
 \le64\pi^2+4K^2\mathcal V_{-\kappa}(D').
\]
This bound is uniform regardless of smooth types and is
invariant under the rescaling. Curvature convergence under
the compact embeddings and exhaustion give finite full \(L^2\)
curvature of the smooth limit.

The flat alternative test uses no smooth input identification.
On a Euclidean universal cover a nontrivial free deck isometry
has a nonzero translation along the fixed space of its
linear part, since a translation lying wholly in the orthogonal
complement would give a fixed point. Its cyclic intermediate
quotient has a fundamental slab of width \(\ell\) and transverse
radius invariant under that isometry. Balls there have volume
at most \(\ell\omega_3t^3\) about a point on the translation
axis. Lifting minimizing paths bounds the volume in the
further quotient by the volume upstairs. Quartic growth
therefore leaves only the Euclidean flat limit.

If the limit is Euclidean, pull back to a based Euclidean
ball of radius five. On radius four the metric tends to identity
strongly in \(W^{2,8}\). The first-order coefficient of its
scalar Laplace–Beltrami operator tends to zero in \(W^{1,8}\),
and the principal coefficient tends to identity in \(W^{2,8}\).
Solve the Dirichlet problem for coordinates \(x+w_i\) with
zero boundary correction. The Euclidean Dirichlet inverse
absorbs the small coefficient errors in \(W^{2,8}\). An
interior differentiated estimate on radius three gives
\(w_i\to0\) in \(W^{3,8}\), since \(Da_i\) is bounded,
\(D^2w_i\to0\) in \(L^8\), \(Db_i\to0\) in \(L^8\),
and \(Dw_i\to0\) uniformly. This yields a smooth
harmonic coordinate diffeomorphism there for each large \(i\).
The transformed metric tends to identity strongly in \(W^{2,8}\)
and uniformly. Whole-ball coverage allows restriction to all
of \(B_{\bar g_i}(x_i,2)\), and translation centers the chart.
At radius two the distortion and derivative conditions become
strict, contradicting the near-minimum upper bound. This uses
the actual compact maps rather than harmonic-radius continuity.

The remaining limit is smooth, complete, nonflat,
Ricci-flat and ASD, with positive quartic volume growth
and finite full \(L^2\) curvature. This meets BKN Theorem
(1.5), which in dimension four gives the one smooth order-four
ALE end. Remark (1.8)(1) supplies all metric derivative
orders. Orientation makes the spherical quotient group a
free subgroup of \(SO(4)\). One sufficiently large smooth
radial truncation of this end is a full core and embeds by
the proved compact comparison into each sufficiently late
oriented \(M_i\). Each target separately is an integral
homology four-sphere, so the assessed full-core obstruction
applies. No common smooth type is used to exclude that
embedding. This contradicts any vanishing-infimum subsequence
and proves a common positive radius floor. [ALE assessment][ale] ·
[Core assessment][core].

## E182 — unscaled global maps and regularity

Using the radius floor and finite diameter, global packing
gives a compact distance limit with vanishing distortion and
density errors. Choose a finite \(\rho/(16\sqrt m)\)-net
there. The corresponding centers in each \(M_i\) are
within \(\rho/(2\sqrt m)\) of every point after accounting
for the small errors and the mesh. Thus inner \(B_\rho\)
images of the finite positive chart collection cover the
entire corresponding base for all large \(i\).
The margin gives persistent overlaps as above. The metric
matrices have local \(C^{1,5/12}\) convergence and bounded
\(W^{2,8}\). The harmonic transition equation and the
equation differentiated once have respectively uniform
elliptic \(C^{0,5/12}\) coefficients and a differentiated
right side \(-Da_iD^2\theta_i\) uniformly \(C^{0,5/12}\)
on the interior. Two Schauder estimates with shrinking domains
give \(C^{3,5/12}\) bounds and compact \(C^{3,1/3}\) convergence
on smaller overlaps. This requires no smoothness of the
unscaled metric-space limit.

Each \(I_i:M_i\to\mathbb R^{5A}\) assembles the same finite
coordinate blocks with \(\zeta_a=1\) on \(B_{2\rho}\) and
support strictly in \(B_{3\rho}\). An inner block recovers
its coordinates and makes the map an immersion. Equality
of two images forces the same chart and coordinate, so these
are global smooth embeddings of the separate compact bases.
The transition convergence and support margins give
\(C^{3,1/3}\) convergence of \(F_{ia}=I_i\phi_{ia}\)
on \(\overline B_{7\rho/4}\), with fixed derivative bound
\(L\) for orders one and two and
\((DF_{ia})^TDF_{ia}\ge I\) by the own coordinate block.
If \(|u|\le3\rho/2\) and two images have Euclidean gap
\(d_e<1/2\), the same positive scalar block of the second
has \(s\ge1-d_e\) with \(|su'-u|\le d_e\).
Consequently
\[
 |u'-u|\le\frac{d_e+d_e|u|}{1-d_e}\le C_b d_e,\qquad
 C_b=2(1+2\rho).
\]

The tube radius is fixed before the reference choice.
If two nearest points to an ambient \(z\) in the radius-\(r\)
tube exist, take an inner chart at one of them. Their gap is
at most \(2r\) and coordinate separation at most \(2C_b r\).
For \(r<\min\{1/4,\rho/(4C_b)\}\) the coordinate segment is
inside \(B_{3\rho/2}\), and the residual on it is at most
\(r(1+2LC_b)\). Thus the foot Hessian is at least
\[
 I-Lr(1+2LC_b)I\ge I/2
\]
at the chosen \(r\). Strict convexity excludes the second
nearest point. The positive Hessian and local implicit
equation make the unique nearest projection smooth, by
continuity of the minimum under compactness.

Fix the displacement \(d_0\) as in E182 before choosing one
late reference \(M_{\rm ref}=M_{i_0}\). All \(I_i(M_i)\) are
within \(d_0<r/2\) of its image by the \(C^1\)-Cauchy convergence
of corresponding local embeddings. Thus the smooth map
\(P_i=I_{i_0}^{-1}\pi_{\rm ref}I_i:M_i\to M_{\rm ref}\) is
globally defined. With \(F_0=F_{i_0a}\) and local foot
coordinate \(q\), the separation bound gives
\(|q-u|\le 2C_b d_0<\rho/8\) on \(B_{3\rho/2}\).
The segment from \(u\) to \(q\) stays within
\(B_{7\rho/4}\). The foot equation
\[
 H Dq=(DF_0(q))^TDF_{ia}(u),\qquad
 H=(DF_0(q))^TDF_0(q)
       +\langle F_0(q)-F_{ia}(u),D^2F_0(q)\rangle
\]
has \(H\ge I/2\). The residual is at most \(d_0\) and
the derivative difference is at most \((1+2LC_b)d_0\).
Subtracting \(H\) yields
\[
 \|Dq-I\|\le2\bigl[L(1+2LC_b)d_0+Ld_0\bigr]
                    =4L(1+LC_b)d_0<1/2.
\]
This makes \(P_i\) an orientation-preserving local
diffeomorphism. If \(P_i\) identifies two points of one
\(M_i\), their embedding images differ by at most \(2d_0\).
The source separation bound puts both in one convex larger
source chart, where integrating \(Dq-I\) proves injectivity.
The image is open by local invertibility and closed by compactness.
The fixed reference is connected so the image is the whole
reference. Thus \(f_i=P_i^{-1}:M_{\rm ref}\to M_i\)
are genuine smooth orientation-preserving diffeomorphisms.
Here the common smooth type emerges only after the maps exist.
Keeping the reference member as one finite term is compatible with
any further convergent subsequence.

With the smooth reference fixed, composition with its smooth
projection and chart inverse gives local \(C^{3,1/3}\)
convergence of the foot maps. The radius-\(\rho/8\)
contraction about targets in \(B_{5\rho/4}\) stays in
\(B_{3\rho/2}\). It gives the global inverse's local coordinates
\(v_{ia}\), with strong \(C^2\) convergence and uniformly
bounded third derivatives by differentiating the inverse identity.
Interpolation gives \(C^{2,1/4}\) convergence. The metric
formula \((Dv_{ia})^Th_{ia}(v_{ia})Dv_{ia}\) is on the
fixed reference charts. Coefficient and inverse convergence
give strong \(C^{1,1/4}\) and positive limiting matrices.
Second metric derivatives enter through \(D^2h_{ia}\circ v_{ia}\)
with bounded first derivative factors, whose \(L^8\) bound
uses the change of variables and inverse Jacobian bounds.
The other terms use bounded first coefficient derivatives
and three inverse derivatives. A fixed finite smooth atlas
gives a uniform \(W^{2,8}\) bound and a weak subsequence
with that same limit. The local derivative estimates do
not assert bounds on the maps in unrelated input atlases.
[Earlier fixed-reference assessment][metrica].

## E183 — fixed-family contradiction after transport

Fix \(P_0\ge0\) and \(D_0>0\) finite. If no universal
positive threshold works, pick a bad sequence on possibly
different smooth bases and bundles with these two bounds and
native energy tending to zero. An empty bounded class is
vacuous. The floor-free transport and chiral estimates with
\(C=(1+4\sqrt3)/(4\pi/5)\) give
\(\mathcal G\le CP_0\),
\(Z=\sqrt6/2+(42+8\sqrt3)CP_0\),
\(|W^+|_{\rm op,HS}\le Z\), and
\(|\operatorname{Ric}|_g\le3+(2+2\sqrt3)Z\), including
the case \(P_0=0\). They use the live native metrics,
negative Killing pairing and positive round-compatible
curvature-map sign on each base. For the volume, tracing
the native wedge Gram gives
\[
 v_i=\tfrac13\int_{M_i}\langle F_i\wedge F_i\rangle
     =\tfrac{8\pi^2}{3}\langle p_1(E_i),[M_i]\rangle .
\]
The native internal trace identity
\(\operatorname{tr}_{\mathbb R^3}(\operatorname{ad}e_j
\operatorname{ad}e_k)=-\delta_{jk}\) gives the coefficient.
The Pontryagin pairing is a positive integer in the chosen
orientation because the slice is definite. Therefore
\(v_i\ge8\pi^2/3\), enough for \(H_{\rm var}\).
No formula for the Pontryagin number of \(\Lambda^+\)
or comparison of characteristic numbers across bases is needed.

Apply \(H_{\rm var}\). The bundle comparison uses just
the resulting \(f_i:M_{\rm ref}\to M_i\), not the
regularity of the metric limit. For one fixed smooth metric
\(g_b\) on \(M_{\rm ref}\), put \(g_i'=f_i^*g_i\).
The positive tangent map \((g_b^{-1}g_i')^{-1/2}\) is an
orientation-preserving isometry from \(g_b\) to \(g_i'\).
Its inverse pullback induces
\(J_i:\Lambda^+_{g_b}\to\Lambda^+_{g_i'}\).
The signed polar map
\(\sigma_i=-F_{A_i}^{\sharp}Q_i^{-1/2}:E_i\to\Lambda^+_{g_i}\)
is an oriented isometry by the positive-plane,
round-compatible sign. Pulling back its form output
gives \(\widetilde\sigma_i:f_i^*E_i\to\Lambda^+_{g_i'}\).
Thus \(\widetilde\sigma_i^{-1}J_i\) has source
\(\Lambda^+_{g_b}\) and target \(f_i^*E_i\).
On oriented native adjoint frames this gives one smooth equivariant
bundle isomorphism \(H_i:P_{\rm ref}\to P_i\) over
\(f_i\), with \(P_{\rm ref}\) the fixed frame bundle of
\(\Lambda^+_{g_b}\) using the faithful adjoint \(SO(3)\) model.
No identification between the starting bundles is assumed.

The pulled-back connection \(\widetilde A_i=H_i^*A_i\)
has curvature \(H_i^*F_{A_i}\), native metric \(g_i'\), and
the specified sign. By covariance \(Q,T\) are pulled back and
conjugated with the corresponding internal rotation.
The live base Levi–Civita connection and chiral connection are
natural under this oriented isometry. Consequently the fiber
rotation intertwines the perpendicular projection, the
\(\Gamma\)-horizontal derivative and the live base covector
derivative in the definition of \(\Psi\), and preserves the
round sphere area \(4\pi\). Thus
\(\Psi(\widetilde A_i)=\Psi(A_i)\circ f_i\). Base metric
pullback preserves diameter and the defect integral by change
of variables. The native clock is unchanged.

Only now apply the assessed fixed-base E177 theorem
with the fixed smooth \(M_{\rm ref},P_{\rm ref}\) and
the fixed \(P_0,D_0\). Its single positive threshold
\(\delta_{\rm ref}\) eventually exceeds the pulled-back energies
because they equal the original energies tending to zero.
No pair convergence is required in this application. The
reference and threshold may be selected after the metric
subsequence, which suffices for contradiction.
[Fixed-family assessment][a177].

For each such \(i\) the E177 original solution \(B_i\)
on \(P_{\rm ref}\) pulls back to \(P_i\) by \((H_i^{-1})^*\).
It is the original solution from \(A_i\) by naturality under
this fixed map and smooth uniqueness. If \(R_i:P_{\rm ref}\to
P_{\rm rd}\) is its round entry isomorphism, the original
entry map on \(P_i\) is \(R_i\circ H_i^{-1}\). Its inverse
pullback applied to the \(P_i\) path gives
\[
 (H_i\circ R_i^{-1})^*(H_i^{-1})^*B_i
       =(R_i^{-1})^*B_i .
\]
If the fixed reference limit is
\((L_i^{\rm rd})^*(A_0,F_0)\), the actual limit on \(P_i\)
is \((L_i^{\rm rd}\circ H_i^{-1})^*(A_0,F_0)\).
The base round map similarly composes on the right with
\(f_i^{-1}\). Fixed smooth pullback preserves smooth exponential
convergence with datum-dependent constants. Thus all the
asserted properties hold for late bad data, a contradiction.
This is a non-effective uniform threshold
\(\delta(P_0,D_0)>0\) under the exact varying-base premise.

## E183 — universal small initial transport density

For \(p=\sup_M\Psi(A)\) the sufficient static threshold is
\(Cp\le\varepsilon_{171}\). It gives
\(|q|\le72Cp\) and \(\operatorname{Ric}\ge3g/4\).
On any length-\(l\) unit-speed minimizing segment the
three parallel normal sine fields give summed nonnegative
index at most \(3\pi^2/(2l)-3l/8\). Therefore
\(l\le2\pi\), giving the native diameter bound on the
complete closed base. For \(p\le1\) the absolute Ricci
bound gives \(\operatorname{Ric}\ge-R_0g\), with
\(R_0=3+(2+2\sqrt3)(\sqrt6/2+(42+8\sqrt3)C)\).
The four-dimensional comparison curvature is \(-R_0/3\).
A ball of radius \(2\pi+1\) is the whole manifold.
Bishop–Gromov from the smooth small-radius Euclidean ratio gives
\(\operatorname{Vol}(M,g_A)\le
V_{\max}=\mathcal V_{-R_0/3}(2\pi+1)\), the finite B90
constant independent of the base and bundle.
[Small-strain assessment][small].

For \(\delta_0=\delta(1,2\pi)>0\), take half the minimum
of \(1,\varepsilon_{171}/C,\sqrt{\delta_0/V_{\max}}/(72C)\).
If \(p\) is strictly below this choice, then the static
and family bounds apply and
\[
 \mathcal E(A)\le V_{\max}(72Cp)^2<\delta_0/4<\delta_0.
\]
This is the stated universal non-effective threshold under
\(H_{\rm var}\). It gives no uniform entry time, derivative
bounds for identifying maps, higher convergence constants
independent of the datum, or existence of qualifying data.
A common threshold is a uniform implication for existing data
over the tested category. No source was newly inspected,
and only the audit and return were written. [Return][ret].

[req]: ../research-progress/handoffs/SP4-CME-E185_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E185_RETURN_v1.md
[b90]: ../brainstorm/notes/B90_VARYING_BASE_COMPACTNESS_AND_UNIFORM_ENTRY_20261122.md
[e182]: ../notes/182_VARYING_BASE_METRIC_COMPACTNESS_20261122.md
[e183]: ../notes/183_CONDITIONAL_UNIFORM_INTRINSIC_ENTRY_20261122.md
[prea]: E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md
[ale]: E164_RICCI_FLAT_ALE_SOURCE_ASSESSMENT_20261122.md
[core]: E166_ALE_CORE_AUDIT_ASSESSMENT_20261122.md
[metrica]: E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md
[a177]: E177_E178_COMPACT_FAMILY_ENERGY_ASSESSMENT_20261122.md
[small]: E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md
