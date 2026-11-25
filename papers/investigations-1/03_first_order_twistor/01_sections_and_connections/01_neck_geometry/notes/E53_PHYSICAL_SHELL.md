# E53a · The radial Laplacian of a physical shell

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded execution SP4-MASTER-E53a under
SP4-FOT-NECK-B04/B05. Actual serving model and effort are unavailable.
Input HEAD is b5de9758f16e14f22162b4a1e091166ea126c389. The transitive E51
neck and E52 master TeX SHA-256 prefixes are 10435384942fae65 and
2867c940507acb77. The original neck shell and master critical annulus source
hashes begin 6eee2914d412b1de and 8fdb856aaac2dd9c1. These were recomputed
using the E51 path-and-content convention. [E51](../../../../../master/research-progress/handoffs/E51_COMPANION_DRAFTS_20261125.md)
· [E52](../../../../../master/research-progress/handoffs/E52_RECOGNITION_ENDPOINT_20261125.md)
· [Neck register](../research-progress/REGISTER.md#physical-shell-setup)

**Result.** One proper flat comparison region with compact smooth source
comparisons at the physical scale gives the full marked cut if its physical
radial squared-distance Laplacian tends weakly to four. The scalar test
forces a spherical space-form cone by the Bochner identity, and the closed
source energy obstruction makes its link \(S^3\). This is a conditional
upgrade of a flat comparison. For a fixed window, a one-component flat
cylinder with Euclidean upper volume ratios has a nonzero singular radial
defect. Proper flat source comparison and control of the radial defect on
the actual separated-quantile sequence remain open.
[Manuscript proposition and proof](../manuscript/anchored_physical_shell.tex)

## Source block and the missing transition volume

Take smooth volume-one Riemannian positive Yamabe minimizers \(g_i\) on one
closed oriented nonstandard smooth homotopy four-sphere \(M\), with
\(Y_i=R_{g_i}\ge y_0=\sqrt{48\delta}\),
\(e_i=E_+(g_i)\to I^+(M)\), and
\(4\pi^2\le e_i\le8\pi^2-\delta\) for fixed \(\delta>0\).
The measure is \(|W^+|^2_{\rm HS}dV\) in the fixed orientation. Write
\(a_i=r_i(\theta)\), \(b_i=r_i(1/2)\) at fixed \(0<\theta<1/2\),
\(a_i/b_i\to0\), and take \(x_i\) attaining the smaller quantile. The
complete marks \(D_{i,-}=B_{g_i}(x_i,a_i)\) and
\(D_{i,+}=M\setminus B_{g_i}(x_i,b_i)\) have masses \(\theta e_i\) and
at least \(e_i/2\). This uses attainment of the small quantile and the
maximum over all centers in the definition of the median.
[Energy radii and full curvature budget](../../../../../master/manuscript/complete_limits.tex)

Let \(\Lambda\) bound the full four-index curvature integral on the source.
Of \(N_i\to\infty\) dyadic layers between the two quantiles, remove layers
near both ends and choose one of order \(\sqrt{N_i}\) disjoint interior
blocks of width of order \(\sqrt{N_i}\) layers. The winning block has
full curvature integral \(O(\Lambda/\sqrt{N_i})\). Its endpoints
\(s_i^-,s_i^+\) satisfy \(a_i/s_i^-\to0\), \(s_i^+/b_i\to0\), and
\(s_i^+/s_i^-\to\infty\). For
\(\rho_i=(s_i^-s_i^+)^{1/2}\) put \(h_i=\rho_i^{-2}g_i\) and
\(d_i=d_{h_i}(x_i,\cdot)\). Diameter packing bounds \(b_i\), so
\(\rho_i\to0\). Each fixed compact interval of positive normalized
radii lies in the block eventually. These are constant rescalings of the
physical comparison, and \(\int |\mathrm{Rm}|_{\rm tens}^2\) is invariant
under these rescalings. [NECK-E11](E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md)
· [Master E16](../../../../../master/notes/E16_SEPARATED_BLOCK.md)

For a physical transition scale \(s\) the actual bound obtained directly
from the scalar term of the budget is
\[
 \operatorname{vol}_{g_i}\{s<d_{g_i}(x_i,\cdot)<2s\}
 \le 6y_0^{-2}\int_{\{s<d_{g_i}(x_i,\cdot)<2s\}}
               |\mathrm{Rm}_{g_i}|_{\rm tens}^2\,dV_{g_i}.
\]
The two-component test instead rules out two arms reaching \(R>2s\) if
the left side is less than \(c_Ys^2\min(1,R-2s)^2\).
At \(s=\sigma\rho_i,\ R=\mathcal R\rho_i\), with fixed
\(\mathcal R>2\sigma>0\), this threshold is fourth order in \(\rho_i\).
The winning block estimate gives an absolute \(o(1)\), with no fourth-order
rate. A supplementary relative volume bound gives a through-component
test via the Yamabe cutoff, but the cutoff controls a component and gives
no radial differential identity. [Master E25](../../../../../master/reviews/E25_ANNULAR_VOLUME.md)

## Scalar test and the source embedding

Fix \(H=A_0=2\) and \(L>8\) satisfying both inequalities of the neck
anchored-width test for those constants and \(y_0\). Use
\(J=(1/16,2L)\). The supplementary comparison premise is one nonempty
connected oriented flat smooth four-manifold \((U,h)\) without boundary
and a proper
continuous function \(r:U\to J\). Each compact subset has one oriented
smooth embedding of a neighborhood into the source for each large \(i\),
with pullback of \(h_i\) tending to \(h\) in \(C^0\cap W^{1,4}\) and
pullback of \(d_i\) tending locally uniformly to \(r\). Properness
means every closed radial strip compactly contained in \(J\) has compact
preimage. If the entire open annulus of a proper pointed limit on \(J\)
is regular, a component is closed relative to that annulus and its
intersection with a compact closed radial strip is compact. Local
charts alone leave this compact comparison and its radial alignment
unproved.

For each fixed smooth compactly supported \(\varphi\) on \(U\), transport
it to the source by one such comparison and extend it by zero as
\(\varphi_i\). The additional scalar premise is
\[
 \mathcal D_i(\varphi_i)=
 \int_M\left(\langle d(d_i^2/2),d\varphi_i\rangle_{h_i}
                  +4\varphi_i\right)\,dV_{h_i}\longrightarrow0.
\]
Written entirely in the original physical metric this is
\[
 \rho_i^{-4}\int_M
 \left(\langle d(d_{g_i}(x_i,\cdot)^2/2),
                    d\varphi_i\rangle_{g_i}+4\varphi_i\right)\,dV_{g_i}
 \longrightarrow0.
\]
The distributional test includes the contribution of the cut locus.
The pullbacks of \(d_i\) are uniformly locally Lipschitz, so uniform
convergence gives weak convergence of the derivatives. Passing the form
with the uniformly converging metrics gives \(\Delta_h(r^2/2)=4\).
Use \(\Delta=\operatorname{div}\nabla\). Flat coordinate regularity
makes \(r\) smooth. At any point \(p\) in the comparison region,
a fixed short final segment of a source minimizing geodesic from \(x_i\)
to the image of \(p\) stays inside a buffered chart. First exit costs
a definite normalized length by uniform ellipticity. The pulled-back
segments converge along a subsequence to a curve of speed at most one
on which \(r\) changes at speed one. The local Lipschitz upper bound then
gives \(|dr|_h=1\).

With \(f=r^2/2\), Bochner on the flat metric gives
\(\frac12\Delta_h|df|_h^2=|\nabla_h^2 f|_h^2\).
The left side is \(\Delta_h f=4\). With trace four, equality in
the matrix trace inequality forces \(\nabla_h^2 f=h\). The
\(\nabla_h r\) flow exists across any compact subinterval of \(J\),
since the trajectories stay in compact radial strips and
\(dr(\nabla_h r)=1\). It produces \(U=J\times N\),
\(N=\{r=1\}\), with \(h=dr^2+r^2\gamma\). Indeed,
\(\nabla_h^2 r=(h-dr^2)/r\) and the metric on flowing levels solves
\(\partial_r h_{\rm tan}=2h_{\rm tan}/r\). The link \(N\) is compact,
connected and orientable. The tangential curvature formula implies
\(K_\gamma=1\). The standard simply connected space-form classification
gives \(N=S^3/\Gamma\) with \(\Gamma\subset\mathrm{SO}(4)\) finite and
acting freely. The argument needs a finite buffered radial range.

One embedding of a compact band containing \(1/8\le r\le L\) in its
interior now gives the full quotient comparison. Fix a short cutoff at
\(r=1\) on the cover to straighten to the Euclidean metric there. For
\(m_i\) the lifted physical rescaling and \(v_i=m_i-\delta_{\rm Euc}\),
the critical curvature error on the fixed transition strip is bounded by
\[
 C\bigl(\|\mathrm{Rm}_{m_i}\|_2+\|Dv_i\|_4+
                 \|Dv_i\|_4^2+\|v_i\|_2\bigr)=o(1).
\]
This uses constant principal coefficients for the all-lowered curvature,
ellipticity of the interpolation and the product rule for derivatives of
the cutoff. The interpolation is equivariant and its squared curvature
integral downstairs is divided by \(|\Gamma|\). Multiplication of the
physical straightened metric by \((\rho_i r)^{-2}\) near the middle slice
produces the exact unit round quotient product at zero additional chiral
cost. The resulting closed
source metric satisfies \(E_+\le e_i+o(1)<9\pi^2\). The neck's product
boundary signature obstruction then makes \(\Gamma\) trivial.
[First-order curvature comparison](../../../../../master/manuscript/first_order_splice.tex)
· [Neck quotient obstruction](../manuscript/marked_necks_and_chiral_energy.tex#L370)

The spherical source chart from the original physical metrics on
\(A(1/8,L)\) is uniformly elliptic with bound \(H=2\), and
\(d_{g_i}(x_i,S_i(1))\le 2\rho_i\) by radial convergence.
The anchored-width argument puts the full inner ball and full median
exterior on opposite sides, off the closed \(1/4\le r\le4\) trim.
In particular, the cutoff on the smaller side bounds its volume by
\(C_*(2,y_0)\rho_i^4\) and depth from the slice by \(C\rho_i\).
The large coordinate-outer volume identifies the inner side, and the
distance charge excludes the inner ball from the protected band.
The trim remains \(O(\rho_i)\) from \(x_i\). This accounts for both
entire marks even if another part of the physical distance annulus
has no chart. In the supplied source chart the physical rescaling
converges uniformly and strongly in \(W^{1,4}\) on \(A(1/8,8)\)
and its full curvature integral vanishes there. This is the master's
first-order splice alternative. If the supplementary protected
supercritical Ricci bound also holds, the harmonic Dirichlet
reparametrization from master E16 gives the harmonic alternative on
the fixed trimmed chart after using the extra buffers.
[Anchored comparison and first-order alternative](../../../../../master/manuscript/critical_annulus.tex)
· [Master E16 harmonic reparametrization](../../../../../master/notes/E16_SEPARATED_BLOCK.md)

The same closed straightening path has \(E_+\le e_i+o(1)<8\pi^2\)
throughout, so the zero-Yamabe threshold excludes loss of sign.
Stretch the exact product within the positive closed type at constant
chiral energy to test the two ends, and compactify each using conformal
invariance and zero point capacity. Each cap is positive and has a
nonnegative upper allowance \(\gamma_{i,\pm}=o(1)\) over its own raw
side energy. Thus \(e_i+\gamma_{i,+}+\gamma_{i,-}\le8\pi^2-\delta/2\)
and \(e_i-I^+(M)+\max_\pm\gamma_{i,\pm}<4\pi^2\theta\) for large \(i\).
If the capped sides split the source, at least one has energy below
\(4\pi^2\) and is standard. Capping and gluing recover the fixed
nonstandard type from the other side, which has admissible energy
below \(I^+(M)\) because the discarded side carries at least
\(\theta e_i\). This contradicts the infimum.
[Short-cut sign and fixed-type inequalities](../../../../../master/manuscript/variational_comparison.tex)

## Scope of the radial failure

For a fixed normalized window \(R>s>\ell/2>0\), take the complete
oriented flat model \(X=(\mathbb R/\ell\mathbb Z)\times\mathbb R^3\)
with product metric and center \((0,0)\). Use the representative
\(-\ell/2<\vartheta\le\ell/2\). Its distance is given by
\(r^2=\vartheta^2+|y|^2\). The full annulus \(s<r<R\) is connected:
for each \(\vartheta\) its \(\mathbb R^3\) fiber is the radial annulus
with radii \((s^2-\vartheta^2)^{1/2}\) and
\((R^2-\vartheta^2)^{1/2}\). These are positive continuous functions of
the circle variable. All full-curvature and Ricci integrals vanish, and
ball volumes have the Euclidean upper bound by projection from the
cover. On every bounded range of ball radii there is a positive
four-dimensional lower volume ratio, obtained by fitting a product of
an arc of length \(2\min(r/2,\ell/4)\) and a Euclidean three-ball of
radius \(r/2\) inside the radius-\(r\) ball.

Across the antipodal cut locus the \(\vartheta\) derivative of
\(r^2/2\) jumps by \(-\ell\). Hence
\[
 \Delta(r^2/2)=4-\ell\,
   \delta_{\{\vartheta=\ell/2\}}\otimes d^3y,\qquad
 \mathcal D(\varphi)=\ell\int_{\mathbb R^3}\varphi(\ell/2,y)\,d^3y .
\]
A nonnegative test supported where the cut locus crosses the annulus
gives a fixed positive defect. The individual protected flat
coordinates, upper transition volume bound, and through component
therefore do not imply the scalar equation on this comparison class.
At large radii the model has only cubic volume growth, and it has an
infinite cyclic fundamental group. It supplies neither the
scale-uniform physical Yamabe noncollapse on every rescaled bounded
window nor a closed near-minimizing source satisfying the energy and
quantile conditions. E53a leaves the radial test open for that source.

## Primary passage checks

- Petersen–Wei, *Relative volume comparison with integral curvature
  bounds*, GAFA 7 (1997), §§2.1–2.3, especially Lemma 2.3. The integral
  of the negative Ricci deficit is taken over the comparison ball,
  with exponent greater than \(n/2\). On protected balls interpolation
  of \(o(1)\) critical curvature with a bounded physical
  \(\rho_i^{2-4/p}\|\operatorname{Ric}_{g_i}\|_p\) norm gives the
  needed \(2<q<p\) convergence. Centered comparison requires the
  omitted core. [Author's journal copy](https://www.math.ucla.edu/~petersen/Papers/28.pdf)
- Deane Yang, *Convergence of Riemannian manifolds with integral bounds
  on curvature. II*, Ann. Sci. ÉNS 25 (1992), Theorem 7.1, pp. 186–187.
  A buffered geodesic ball with homogeneous Sobolev control, small
  critical full curvature and supercritical Ricci gives smaller-ball
  harmonic coordinates and coordinate second-derivative estimates.
  Applied on protected balls, this gives local flat limits. The theorem
  does not give a single compact-compare embedding of a radial band.
  [Journal text](https://www.numdam.org/item/10.24033/asens.1647.pdf)
- Chang–Qing–Yang, arXiv:math/0508621v2, Theorem 3.1, p. 10. This
  comparison assumes exact Bach-flatness in positive Yamabe gauge,
  \(b_1=0\), separated scales, the inner area bounds across
  \([r_1,100r_1]\), and small curvature on the stated component.
  Its output permits a free spherical quotient. Its hypotheses
  have not been established here. [Primary preprint](https://arxiv.org/pdf/math/0508621v2)
- Sun–Zhang, *Collapsing geometry of hyperkähler 4-manifolds and
  applications*, Acta Math. 232 (2024), p. 365, Question 4.13 and the
  start of §4.3. They flag even the flat one-point completion
  question and use a Ricci-limit structure in their setting.
  This is context for the gap. The present finite-band proof
  uses the scalar identity and no puncture-removability theorem.
  [Journal text](https://doi.org/10.4310/ACTA.2024.v232.n2.a2)
- The retained quotient and gluing steps are the manuscript's existing
  uses of Hillman, APS, Kirby–Scharlemann and Rokhlin, with the
  product-boundary and orientation hypotheses checked above.
  [Canonical exact passages R92–R94](../../../../../../references/SOURCE_NOTES_SEC_20261124.md)

The available actual data provide the physical block, normalized
small-ball lower bound and charged complete sets. At this stage the
annular scalar defect, the proper compact source comparison and the
supercritical Ricci premise are each supplementary. No independent
smooth recognition, existence or formalization claim enters the proof.
