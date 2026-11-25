# SP4-FOT-NECK-E19 · A same-type restart at one round-base puncture

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E proof check. Helper configured
for GPT-6.2 Sol, ultra. Exact runtime variant and effort are unavailable.
The [frozen request](../research-progress/handoffs/E19_REQUEST_20261125.md)
records input versions. The lead also requested the physical diameter
test from NECK-E11 during execution.

## Supplied source and a coherent slow exhaustion

Fix a smooth closed connected oriented homotopy four-sphere \(M\).
Assume \(M\) is nonstandard in the case under test. Use smooth
unit-volume positive Yamabe minimizers \(g_i\) with
\[
 \begin{gathered}
 E_i=E_+(g_i)=E_-(g_i)\in[4\pi^2,8\pi^2-\delta],\qquad
 E_i\longrightarrow e=I^+(M),\\
 Y_i=Y([g_i])\longrightarrow Y_{\rm rd}=8\sqrt6\,\pi,\qquad
 \mathfrak B(g_i)=\int_M|B_{g_i}|\,dV_{g_i}\longrightarrow0 .
 \end{gathered}
\]
Here \(I^+(M)\) is the infimum of \(E_+\) over smooth metrics
with positive class Yamabe constant on \(M\). The chiral norm is
Hilbert–Schmidt on the real \(\Lambda^\pm\) endomorphisms. Supply
the EXTRACT-E08 round volume-one removable physical base
\((N,q)\) with a fixed finite marked smooth puncture set
\(P=\{p_1,\ldots,p_k\}\). Whole compact truncations off \(P\)
embed by orientation-preserving comparisons for which the raw
\(g_i\) converge smoothly to \(q\). In particular \(N\) has the
standard smooth type and the omitted physical volume vanishes
after the source limit and then exhaustion.
[EXTRACT-E08, maximal Yamabe branch](../../02_dirac_collar_extraction/notes/E08_PHYSICAL_BASE_ALTERNATIVE_20261125.md#at-the-round-yamabe-value)

Assume first \(k\ge1\). Use disjoint oriented round normal
coordinate balls about the marked points. Let
\(K(r)=N\setminus\bigcup_j B_q(p_j,r)\). At a fixed cut radius
\(r\), set \(t=\log(r/\rho)\) on each puncture collar,
where \(\rho\) is its normal radius. Positive \(t\) points
toward the deleted point. Use one angular reflection if needed
to keep the product coordinates oriented with the source.
For prescribed \(\ell\) take one comparison map on a
neighborhood of the whole \(K(r\,e^{-(\ell+2)})\), with all
\(|t|\le \ell+2\) buffers in that map. The normalized
physical collar representative is \(h=\rho^{-2}\Phi^*g_i\).
For the round limit of curvature \(\kappa^2>0\) it is
\[
 h_{\rm lim}=dt^2+
       \left(\frac{\sin(\kappa\rho)}{\kappa\rho}\right)^2\gamma,
       \qquad \gamma=g_{S^3(1)} .
\]
In the product norms the deviations through order two on the
full collar, and through order four on the central unit
splices, are \(O_\ell(r^2)\) and \(O(r^2)\), respectively.
For example, the full collar \(C^2\) error is bounded by
\(C(r e^{\ell+2})^2\) for small outer radius. The same estimates
for \(h\) have an added \(o_i(1;r,\ell)\) when \(r,\ell\) are
fixed. This uses smooth physical convergence on fixed
compact sets and comparison up to the needed derivatives.
[NECK-E01, normalized two-cap estimates](E01_TWO_CAP_AUDIT_20261125.md#setting-and-bounds)

For an actual diagonal, fix lengths \(\ell_m\to\infty\) and
error tolerances \(\epsilon_m\to0\), with
\(\ell_m\epsilon_m^2\to0\). At each \(m\) choose \(\ell_m\)
first so the IMS loss is small. Then choose a smaller \(r_m\)
so the \(k\) full buffered closures are disjoint, their
normal-coordinate radii lie in the chosen balls, and the
limit jet bounds on these collars are below \(\epsilon_m/2\).
We can also require \(r_m^4(1+\ell_m)\to0\). Next choose
\(i_m\) such that for \(i\ge i_m\) all the normalized errors
are below \(\epsilon_m\) in the larger whole comparison,
and the physical volume and Weyl integrals on the image
of \(K(r_m)\) are within \(\epsilon_m\) of the corresponding
\(q\) integrals. To obtain convergence on every fixed compact
after diagonal selection, also impose an unscaled comparison
tolerance through order \(m+4\) on the larger fixed
truncation at stage \(m\). These are finite tests for each
\(m\). Take the thresholds strictly increasing. For each
large \(i\) use the largest \(m\) for which \(i\ge i_m\),
and denote the resulting single comparison by \(\Phi_i\),
its cut radius by \(r_i'\), and buffer length by \(\ell_i'\).
Use only restrictions of \(\Phi_i\) to define all
coarser cuts in this exhaustion. This supplies actual
nested images within each \(i\) and gives errors
\(\eta_{2,i},\eta_{4,i}\to0\). The comparison thresholds
determine an allowable rate of shrinkage.

## The actual exterior and its caps

At \(r_i'\), the complement of \(\Phi_i K(r_i')\) consists
of \(k\) actual exterior pieces \(V_{ij}\), one with
boundary face for each \(p_j\). The degree-zero
Mayer–Vietoris argument for the whole connected truncation
and all its \(S^3\) faces gives the one-face count. Van
Kampen and the degree-two sequence imply that filling
each exterior by its marked standard ball produces a
smooth oriented homotopy four-sphere \(\widehat V_{ij}\).
Capping the central piece with its marked normal balls
recovers \(N\). The actual gluing represents \(M\) as
the oriented connected sum of \(N\) and those capped
exteriors. This uses the comparison's boundary marking
and the extension of spherical diffeomorphisms across
the attaching balls. [NECK-E09, simultaneous cuts and recognition](E09_FINITE_PUNCTURE_TRANSFER_20261125.md#simultaneous-cuts-and-complement-topology)

On each exterior use the E01 unit width splice and
positive conformally flat cap, with its \(\ell_i'\) unmodified
buffer in the exterior side. Keep the original conformal
class on the rest of the retained side. In unit product
gauge the splice is \(h_0+\theta(t)(h-h_0)\), where
\(h_0=dt^2+\gamma\) and \(\theta\) is the fixed profile.
The cut has physical scale \(r_i'\). For instance put the
cap and splice at that scale by multiplying the product
gauge by \((r_i')^2\). On the retained part of the collar
the source conformal factor is \(r_i'/\rho\), and its
logarithm extends with a cutoff in the spare buffer.
Use the identity factor away from that neighborhood.
This gives a physical-scale cap of volume \(O((r_i')^4)\)
before Yamabe minimizing. The altered long collar has
volume \(O((r_i')^4(1+\ell_i'))\) in this representative.
No bound for its volume after Yamabe minimizing is
needed.

The \(C^2\) model estimate applies both to the old and
the new unit splice. Their Weyl integrals in either
chirality are \(O(\eta_{2,i}^2)\), and the exact cap
has zero Weyl tensor. Hence for \(\sigma=\pm\), writing
\(m^\sigma_{ij}=E_\sigma(g_i;V_{ij})\) and
\(e^\sigma_{ij}=E_\sigma(\widehat g_{ij})\), one has
\[
 |e^\sigma_{ij}-m^\sigma_{ij}|\le C\eta_{2,i}^2.
 \tag{3}
\]
The \(C^4\) splice estimate gives a pointwise normalized
Bach norm \(O(\eta_{4,i})\), since the product is
conformally flat and the Bach tensor depends smoothly
on the metric jet through order four. Its volume in
the normalized splice is bounded. Under a length
factor \(r_i'\) the Bach norm scales by \((r_i')^{-4}\)
and the volume by \((r_i')^4\). The full four-dimensional
density \(|B|dV\) is likewise invariant under the
smooth conformal change used on the retained region.
The exact cap has vanishing Bach tensor. Therefore
\[
 \mathfrak B(\widehat g_{ij})
 \le \mathfrak B(g_i;V_{ij})+C\eta_{4,i}.
 \tag{4}
\]
These estimates hold for each label using disjoint
supplied collars. The close \(C^4\) comparison is on
the fixed-width central splices. It is an input to
the Bach estimate in addition to the \(C^2\) cap bounds.
[NECK-E01, Weyl and Bach costs](E01_TWO_CAP_AUDIT_20261125.md#bach-cost-and-its-gauge)

The long-buffer IMS bound gives
\[
 Y([\widehat g_{ij}])\ge
 \min\{Y_i, (1-C_Y\eta_{2,i})Y_{\rm rd}\}
              -C_I(\ell_i')^{-3/2}.
 \tag{5}
\]
The constants depend on the fixed model and profiles.
Each capped exterior has just one boundary cap, so
the one-cap localization suffices for every label.
For large \(i\), all capped classes have positive
Yamabe constant, and each tends to \(Y_{\rm rd}\)
by the sharp universal upper bound. The central
capped piece can carry the original round metric
\(q\). For NECK-E10 it then has positive Yamabe
constant, energy zero and excess allowance zero
relative to its raw piece.
[NECK-E01, Yamabe localization](E01_TWO_CAP_AUDIT_20261125.md#yamabe-localization-on-each-side)

## One survivor and concentration at one physical puncture

For all sufficiently large \(i\), the sum of the
allowances in (3) is \(o(1)\) and the total remains
strictly below \(8\pi^2\) after allowances. NECK-E10
gives at most one capped piece of energy at least
\(4\pi^2\), and all lower-energy capped pieces are
standard. Since the central piece is standard and
\(M\) is assumed nonstandard, exactly one exterior
has nonstandard capped type, and that type is
orientation-preservingly diffeomorphic to \(M\).
Its label is denoted \(j_i\). Its positive Yamabe
class is admissible for \(I^+(M)\). Therefore
\[
 I^+(M)\le e^+_{i,j_i},\qquad
 E_i-m^+_{i,j_i}
      \le E_i-I^+(M)+C\eta_{2,i}^2\longrightarrow0 .
 \tag{6}
\]
The capped exterior has zero signature, so
\(e^-_{i,j_i}=e^+_{i,j_i}\). Using (3) for the
minus chirality and \(E_-(g_i)=E_i\) gives the
same bound for the discarded minus mass. Thus
\(m^\pm_{i,j_i}\to e\); the total of all other
raw masses, including the central raw piece,
tends to zero in either chirality. There is a
subsequence with a single label \(j_*\) since
the marked set is finite.
[NECK-E10, capped budget and minimizing inequality](E10_NONSPLITTING_MINIMIZERS_20261125.md#chiral-recognition-and-the-minimizing-inequality)

At a coarser radius \(r\ge r_i'\) within the chosen
normal-coordinate range, restrict the same \(\Phi_i\).
For each label the actual image of the normal annulus
between the two cuts is a cylindrical layer
adjoined to its smaller exterior. Its two boundary
identifications come from one embedding. Thus adding
the layer preserves the marked capped smooth type,
and the larger exterior of label \(j_*\) still
contains \(e-o(1)\) of the raw mass. Disjointness
and the total energy bound make this uniform for
the other labels at these nested coarser cuts.
For finer cuts within the controlled buffer, the
topological statement also holds. The retained or
lost annular energy there is at most
\(C(1+\ell_i')\eta_{2,i}^2=o(1)\) by the product-scale
Weyl and volume bounds. This gives stability in the
specified coherent exhaustion. Independent choices
of comparison maps or puncture markings need not
pick the same label.

The physical volume of the total exterior of
\(\Phi_iK(r_i')\) tends to zero, because the fixed-domain
volume comparison was imposed before the diagonal
and the missed balls of \(q\) have volume tending
to zero. There is also physical diameter control.
The smooth uniform positive Yamabe band supplies
from NECK-E11 constants \(c_0,r_0>0\) with
\(\operatorname{Vol}_{g_i}B_{g_i}(x,u)\ge c_0 u^4\)
for \(0<u\le r_0\), uniformly over centers and \(i\).
Write \(d(x)=\operatorname{dist}_{g_i}(x,\partial V_{ij})\)
for an interior point. For \(u=\min\{d(x)/2,r_0\}\)
the ambient ball is contained in \(V_{ij}\); a path
from \(x\) exiting the exterior would first meet the
boundary. Small exterior volume excludes
\(d(x)\ge2r_0\) for large \(i\), and hence
\[
 d(x)\le 2c_0^{-1/4}
             \operatorname{Vol}_{g_i}(V_{ij})^{1/4}.
\]
A shortest segment to the boundary remains in
\(V_{ij}\) up to its first boundary point. The
one boundary sphere has intrinsic diameter at most
\(C r_i'\) by the central induced metric comparison.
Joining such segments along the boundary yields
\[
 \operatorname{diam}_{\rm intr}(V_{ij},g_i)
   \le 4c_0^{-1/4}\operatorname{Vol}_{g_i}(V_{ij})^{1/4}
         +C r_i'\longrightarrow0 .
 \tag{7}
\]
The intrinsic distance here permits paths on the boundary.
It bounds the ambient diameter as well. Thus the
survivor contains the limiting chiral energy in one
region of vanishing physical diameter, at the marked
puncture of the coherent comparison. This uses physical
ball noncollapse and the one-face topology. The
coordinate radius alone would not imply (7).
[NECK-E11, intrinsic volume bound](E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md#an-intrinsic-volume-bound-before-extracting-a-chart)

## The restarted sequence and its limits

Pull the survivor's capped metric back to \(M\)
by the oriented diffeomorphism, and take a smooth
unit-volume Yamabe minimizer in its conformal class.
The positive sign and existence of such a
representative follow from (5) and the Yamabe
theorem. Write this metric as \(g_i'\). Chiral
energy and total Bach norm are unchanged by this
conformal selection and orientation-preserving
transport. Equations (3)–(6) give
\[
 E_+(g_i')\longrightarrow I^+(M),\qquad
 \mathfrak B(g_i')\longrightarrow0,\qquad
 Y([g_i'])\longrightarrow Y_{\rm rd}.
\]
In fact along the constructed sequence
\(\mathfrak B(g_i')\le\mathfrak B(g_i)+C\eta_{4,i}\)
and \(I^+(M)\le E_+(g_i')\le E_i+C\eta_{2,i}^2\).
For large \(i\) the new sequence is in a fixed
strict upper band, for instance with margin
\(\delta/2\), allowing for the splice errors.
Its lower bound \(4\pi^2\) follows from the
nonstandard type and positive class sign. The
cap contains a marked conformally round germ.
The estimates are about class invariants,
and give no quantitative post-minimization
volume for that germ or compactness of the
restarted physical metrics.
[Schoen, §3, Yamabe minimization](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf)

If \(P\) is empty, the round base is compared
on the whole closed manifold, so its full
image gives \(E_i\to0\), incompatible with the
band. If there are punctures but all exterior
raw energies tend to zero, the same contradiction
follows by total accounting with the round
central part. If only some raw exterior masses
vanish, their caps have low energy and are
standard once (5) supplies positivity.
If \(M\) is standard, \(I^+(M)=0\) and the
stipulated minimizing band again cannot hold.
Absent positive capped Yamabe sign, the low
Weyl cost alone cannot recognize a cap or
furnish an admissible competitor.

The construction restarts the same minimizing
problem at the same limiting energy on \(M\).
For individual metrics the exact change is
\[
 E_+(g_i')-E_i=(e^+_{i,j_i}-m^+_{i,j_i})-(E_i-m^+_{i,j_i}).
\]
A strict decrease requires the discarded mass
to exceed the actual signed splice excess.
The estimates make these terms vanish and give
no sign for their difference. A further restart
requires another supplied geometric degeneration
and usable cut data. A termination result needs
additional control of such steps.
