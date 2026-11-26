# Physical collar compactness and the charged-disk comparison

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Independent reader 2 for joint CDS-E01 / DEF-E03, [review packet
revision 1](../research-progress/handoffs/TWO_WIDTH_AND_DISK_REVIEW_20261126.md).
The packet requests GPT-6.2 Sol/ultra. Actual serving model and effort are
unavailable to this reader. The base is `c8fb08dc` with the
[17 pinned sources](../references/README.md). The four frozen note hashes
match the review packet. The two arguments assessed here are the
[compact marked collar implication](../01_collar_deformation_and_adapted_coordinates/notes/COMPACT_MARKED_COLLAR_EXCLUSION.md)
and the [charged-disk budget](../02_handle_isolation_and_marked_surgery/notes/CHARGED_DISK_BUDGET.md).
The conclusions below are conditional on their supplying metrics and
markings.

## Compactness in the actual marked slab

In a smooth convergent subsequence of the positive definite conformal
pullbacks $p_i$, the Cotton tensor, second fundamental form, and face
volume converge in the common coordinates. Under $g\mapsto e^{2u}g$,
the three-covariant Cotton tensor is invariant on the three-dimensional
face, its norm has weight $-3$, and the norm of $K^\circ$ has weight $-1$.
The face area has weight $3$. Thus the hypothesis $\mathcal D_{g_i}(S_i)\to0$
passes to the limit in this gauge and forces both smooth nonnegative
integrands to vanish. Curry–Gover §4.1, equation (32) and Proposition 4.1
give local conformal flatness in this dimension. The developing map of
the simply connected compact face is a local diffeomorphism onto the full
$S^3$, since its image is open and closed. It is a covering by compactness
and hence a diffeomorphism. Write $\eta=\vartheta^*\gamma$ for the round
metric in the supplied angular coordinates. A round reflection can fix
the orientation of $\vartheta$. Prescribing a conformal logarithm $v$ with
face value making $e^{2v}h_\infty=\eta$ and with normal derivative
$-H_\infty/3$ makes the limiting face totally geodesic, where $H_\infty$
is the trace of $K_\infty$. The value and derivative extend independently
using a tubular coordinate. [Curry–Gover, §§4.1 and 6.1](https://math.okstate.edu/people/scurry/cg15.pdf) ·
[Conformal development source record](../01_collar_deformation_and_adapted_coordinates/references/README.md)

Use the signed normal chart $F$ for $e^{2v}p_\infty$ on a smaller closed
slab. Its inverse uses the limiting normal footpoint and signed distance.
The actual strip embeddings are $\Phi_i\circ F$, with inverse
$F^{-1}\circ\Phi_i^{-1}$ on their images. Put $b=dt^2+\eta$ and
$\delta_i=\|F^*(e^{2v}p_i)-F^*(e^{2v}p_\infty)\|_{C^2}$.
The limiting mismatch from $b$ has zero- and one-jet size $O(w^2)$
and $O(w)$ on a strip of width $w$ and bounded second jet. For the full
four-tensor difference between the actual and limiting pullbacks, applying
zero, one and two derivatives to its product with $1-s\chi$ costs at most
$C\delta_i$, $C(1+w^{-1})\delta_i$, and
$C(1+w^{-1}+w^{-2})\delta_i$, respectively. This includes the mixed and
normal components. The frozen choice $w_{i,L}=(\delta_i+i^{-1})^{1/3}$,
$w_{i,R}=w_{i,L}/2$ has $\delta_i/w_{i,j}^2\le
4(\delta_i+i^{-1})^{1/3}$ on both sides and fits inside the fixed slab
eventually. Convexity supplies uniform ellipticity for the interpolants.
Their curvature and density are bounded, so each entire side changes
its energy by $O(w_{i,j})$ in either chirality, uniformly along the path.
Undo the smooth multiplier on the physical chart to recover the source
near both outer faces. The density $|W^\sigma|_{\rm HS}^2dV$ is invariant
under this step. In a smaller endpoint germ, restoring an exact product
by a supported conformal change also has zero cost.

Let $\alpha_i(x)=\Phi_i(x,0)$. The cap angular coordinate $z$ maps to
the actual face by $z\mapsto\alpha_i(\vartheta^{-1}(z))$ and the inverse
is $p\mapsto\vartheta(\alpha_i^{-1}(p))$. If the original disk
parametrization $A_i:B^4\to D_i$ has a distinct boundary marking, the round
cap-to-disk transition is $(A_i|_{S^3})^{-1}\alpha_i\vartheta^{-1}$.
Its inverse is $\vartheta\alpha_i^{-1}(A_i|_{S^3})$. Any such sphere
diffeomorphism is smoothly isotopic to an orthogonal map of the same
orientation sign, by the component statement recorded at the opening of
Hatcher's paper. Given an isotopy $G_t$ from the orthogonal map to the
actual transition, the extension is $(r,z)\mapsto(r,G_{\rho(r)}(z))$
with $\rho=0$ near the center and $\rho=1$ near the boundary. The inverse
uses $G_{\rho(r)}^{-1}$. The core linear map gives smoothness at the center.
Choose the cap orientation to extend the inherited exterior orientation
across the gluing, so the boundary identification reverses the two induced
boundary orientations. This is an oriented identification of the capped
exterior with the original smooth $M$ relative to the retained exterior
away from its gluing collar. [Hatcher, p. 553](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf) ·
[Marked cut and reassembly](../../../master/manuscript/marked_cut.tex)

At a sufficiently late finite index on the positive subcritical
minimizing sequence, the joined path peak is at most $e_i+o(1)<2T$.
The master's zero wall supplies positivity. The stretching and cap
argument detailed below gives an admissible same-type competitor with
energy $e_i-m_i^\sigma+o(1)$ in each chirality, where $m_i^\sigma$ is
the raw Weyl mass of the entire removed disk. With
$m_i^{s_*}\ge a>0$, eventually it is strictly below $I^+(M)$. Hence a
precompact subsequence of these marked, charged collars cannot have a
further subsequence of defects tending to zero, proving the stated
positive lower limit. The compactness assumption is on actual
conformally gauged pullbacks across a fixed slab. If an application adds
a separately protected region, the chosen supports must avoid it while
still admitting the width inequalities in this proof.

## Fixed-index disk exclusion and the balanced core

Fix a physical source with $e_i<2T$, positive initial class, and a
path with peak $H_i<2T$ and exactly matched endpoint up to smooth
conformal scale. At this fixed index expose a product by conformal
change. Inserting length $L$ in the product by altering its normal
length element preserves both joined energies. The
[zero wall and short-cut proof](../../../master/manuscript/variational_comparison.tex)
give positivity on the original type and a Yamabe lower bound at least
$\sqrt{48(2T-H_i)}$, uniform in $L$. Every compactly supported test on
the retained side with an attached half-infinite product is a test on a
sufficiently stretched joined source with the same quotient. Compactify
that end using $r=e^{-\ell}$ for product arclength $\ell$, giving a flat
metric at the added point and zero Weyl energy on the cap. A cutoff of
a fixed smooth test near the point costs $O(r^2)$ in gradient-square
integral. Conformal covariance and density extend the same positive
bound to the compact cap. The parametrized disk, with angular transition
extended as above if needed, identifies this cap with the original
smooth type. Positivity comes from actual metrics at the chosen index.
[Exterior replacement and recognition](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

Write $d_i=e_i-I^+(M)$ and
$\Delta_V^\sigma=E_\sigma(h_i;V_i)-E_\sigma(g_i;V_i)$ for the complete
physical exterior. Comparison gives
$$
 E_\sigma(\widehat g_{V,i};M)=e_i-m_i^\sigma+\Delta_V^\sigma
 \ge I^+(M),\qquad
 m_i^\sigma\le d_i+\Delta_V^\sigma .
$$
The two closed energies also agree by signature, so
$\Delta_V^+-\Delta_V^-=m_i^+-m_i^-$. A bound $G^\sigma_i$ for the signed
exterior change makes $m^\sigma_i>d_i+G^\sigma_i$ a strict obstruction,
while a positive competitor with $e_i-m_i^\sigma+G^\sigma_i\le T$
satisfies the inclusive recognition test.

At an exact face use the round scale and zero first normal jet in the
normalized Gaussian chart. The [fixed-source estimate](../01_collar_deformation_and_adapted_coordinates/notes/EXACT_FACE_AND_BENDING.md)
gives joined peak at most $e_i+C_i(w_D+w_V)$ and exterior increment at
most $C_iw_V$ in absolute value under independent trims. Choose both
widths inside the strict headroom at that index and carry out the
stretching and cap construction for every such choice. Then let both
widths tend to zero, keeping the source, chart and $C_i$ fixed. The two
inequalities and signature identity yield
$m_i^+=m_i^-\le d_i$. After this fixed-source comparison, $d_i\to0$ on
the supplied sequence excludes an exact face at each late charged index
since $m_i^{s_*}\ge a$. This order uses the strict wall before any width
limit. The compactness implication instead first extracts its convergent
subsequence, chooses admissible widths there, and uses an actual positive
competitor at a finite late index to contradict the infimum.

For the [balanced enlargement](../../../master/manuscript/balanced_disk.tex),
the outer disk $Q_i$ containing the entire original bicollar lies in
$\operatorname{int}B_i$. On each fixed source the auxiliary ball in the
exterior contains all but the chosen tolerance in the four smooth
measures. Hyperplane bisection in that ball and smoothing with a thin
connecting tube bisect the prior exterior masses to tolerance while
preserving $Q_i$. Each fixed finite $k$ permits tolerances tending to
zero along the sequence. With $q_i^\sigma=E_\sigma(g_i;Q_i)$, the enlarged
exterior mass is $v_i^{B,\sigma}=2^{-k}(e_i-q_i^\sigma)+r_i^\sigma$
with $r_i^\sigma\to0$, so $b_i^\sigma=e_i-v_i^{B,\sigma}$ is the whole
raw enlarged disk mass.

For any matched positive exterior cap under a strict joined peak,
the signed exterior increment satisfies
$\Delta_{V^B}^\sigma\ge I^+(M)-v_i^{B,\sigma}=b_i^\sigma-d_i$.
Subtracting the exterior mass of the endpoint from its joined total
shows the disk saving is at least $b_i^\sigma+I^+(M)-H_i$, strictly
above $b_i^\sigma+I^+(M)-2T$. At $k=1$ and $I^+(M)=4T/3$, the limiting
lower bound in the selected sign is at least $a/2$ because
$q_i^{s_*}\ge m_i^{s_*}$. For $k$ with
$2^{-k}(T+\varepsilon_*)\le\varepsilon_*$ and
$I^+(M)>T+\varepsilon_*$, the limiting lower bound in either sign
is at least $(2-2^{-k})I^+(M)-2T>\varepsilon_*$. This is the
[recognition gap](../../../master/manuscript/recognition_gap.tex) on the
hypothetical nonstandard type. A modification confined to the final
thin seam saves at most the incoming disk-half seam mass. Its support
can avoid $Q_i$ by the positive clearance at the fixed source. If
$Q_i$ is preserved up to conformal scale even under a larger change,
the cap costs at least $I^+(M)$ and the kept disk core at least
$q_i^\sigma$, giving $H_i\ge I^+(M)+\max_\sigma q_i^\sigma$ by equality
of joined totals. The core condition and the vanishing-raw-strip
obstruction are separate numerical tests on the same endpoint.

Both frozen comparisons pass. The finite bounds consume the signed
changes on the complete physical regions. The compactness comparison
also consumes its stipulated positive definite smooth limit in the
physical marking.
