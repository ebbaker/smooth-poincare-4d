# E46 · Negative Weyl determinant on the positive Einstein class

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded independent E46 check. Actual serving model and
reasoning effort were unavailable. Working base
`a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`. The inspected SHA-256
prefixes were `c80e502aca58` for E05, `e6296b753013` for the working
E40 note, and `8914809a594a` for the owning
`marked_necks_and_chiral_energy.tex`.

## Uniform integral

Fix \(\delta>0\). Consider all smooth nonround positive Einstein
Riemannian metrics on connected closed oriented smooth homotopy
four-spheres, allowing the smooth type to vary, with
\(e=E_+=E_-\le8\pi^2-\delta\). The Weyl blocks act on
\(\Lambda^\pm\), with Hilbert–Schmidt norm \(w_\pm=|W^\pm|\).
Let \(q_*=1/(3\sqrt6)\), and fix \(0\le q<q_*\). Define

$$
A_q^\pm=-\det W^\pm-qw_\pm^3,\qquad
J_q^\pm(g)=\int_M[(A_q^\pm)_+]^{2/3}\,dV_g .
$$

If this family is nonempty, there is \(j_{\delta,q}>0\) such that
\(\min(J_q^+,J_q^-)\ge j_{\delta,q}\) for every member. The two
individual infima and the infimum of the minimum are attained
in the normalized family up to oriented diffeomorphism. The
assertion about the bound is vacuous for the empty family.

For a single metric, the signature identity shows that the
vanishing of either block forces both to vanish. Positive
Einstein curvature then has constant positive sectional
curvature, and simple connectivity gives the round sphere,
up to scale and isometry. Thus both blocks are nonzero for a
nonround member. The real continuous integrand in \(J_q^+\)
has zero integral only if \(A_q^+\le0\) everywhere. This is
the pointwise determinant inequality of Catino–Dameno,
Corollary 1.5, with \(c=q\). Their Theorem 1.4, including
the zero-set argument in §4, gives a global positive-scalar
Kähler metric in the conformal class after at most a double
cover. Every connected cover of a homotopy sphere is trivial.
A Kähler form would represent a nonzero \(H^2(M;\mathbb R)\)
class since the integral of its square is positive. This
contradicts \(b_2=0\). Applying the same argument in the reverse
orientation proves \(J_q^->0\).
[Catino–Dameno, author PDF pp. 4–5 and §4 proof of Corollary 1.5](https://cvgmt.sns.it/document/11018/) ·
[Preprint record, arXiv:2607.21538, first posted 23 July 2026](https://arxiv.org/abs/2607.21538)

The integral is invariant under smooth positive conformal
rescaling. For \(\widetilde g=f^2g\), the Weyl endomorphism has
weight \(f^{-2}\), the cubic \(A_q^\pm\) has weight \(f^{-6}\),
and its positive part to power \(2/3\) has weight \(f^{-4}\),
which cancels the volume factor. The integral is continuous
under smooth convergence on a fixed oriented closed manifold.
The integrand is a continuous function of the metric and
its first two derivatives, including at Weyl zeros. Oriented
pullback preserves each sign's integral. There is no division
by the Weyl norm.

Normalize to volume one. The scalar curvatures of a sequence
in this family are \(R_i=Y([g_i])\ge\sqrt{48\delta}>0\) by
Gauss–Bonnet and the Einstein Yamabe normalization. E05
supplies smooth compactness up to oriented diffeomorphisms,
allowing changing smooth types. The limit remains Einstein
and positive and satisfies the fixed upper energy bound.
E05's strict bound \(e_i>16\pi^2/3\) suffices to keep
\(e_\infty\ge16\pi^2/3>0\), so the limit is nonround.
Apply this to any minimizing sequence for either sign, or
for their minimum. Continuity gives the attained infimum,
which is positive by the preceding argument. The hypothesis
\(q<q_*\) is essential for this functional, since
\(|\det W^\pm|\le q_*w_\pm^3\) makes \(J_{q_*}^\pm\)
identically zero.
[E05, fixed-band compactness and gap](../notes/E05_CLOSED_STABILITY.md#uniform-gap-in-the-homotopy-sphere-class)

## Scope of the compactness input

The owning band and exact compactness lemma take a sequence
on oriented homotopy spheres \(M_i\). The eventual whole comparison
in the bounded curvature case gives diffeomorphisms to the
closed limit. In the blow-up case for Einstein metrics the
constant-scaled Einstein constant tends to zero, so the complete
smooth ALE limit is Ricci-flat. The end identities used by E05
are prior to any same-type minimizing conclusion. For \(k\)
ends of orders \(n_j\), the Euler formula with the embedded
core gives

$$
E_+(h)+E_-(h)=8\pi^2(2-k-\textstyle\sum_j n_j^{-1}).
$$

For \(k\ge2\) this is negative. A single allowed nontrivial
link is \(Q_8\), and in that case the signature correction has
absolute value \(9\pi^2\), larger than each available chiral
budget \(8\pi^2-\delta\). The binary icosahedral link is
excluded by the owning spin argument. With the trivial
single link the Euler identity gives both chiral integrals
zero and hence flatness in the Ricci-flat limit. This contradicts
the chosen nonflat blow-up. These steps use the ambient
smooth homotopy sphere and the band. They apply to standard
and hypothetical nonstandard smooth types without assuming
attainment or a fixed underlying smooth type along the sequence.
[Owning band](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L119) ·
[Owning link and spin argument](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L363) ·
[Owning ALE identities and exact compactness](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L554)

## Local geodesic balls and effect on attainment

There are constants \(r_{\delta,q},m_{\delta,q}>0\) for the
volume-one Einstein metrics such that for **each** sign there
is a genuine geodesic ball of radius \(r_{\delta,q}\) on which
\(\det W^\pm<-q w_\pm^3\) everywhere and which carries at
least \(m_{\delta,q}\) chiral energy of that sign.

To see this, choose \(q'=(q+q_*)/2\). The maximum of
\(A_{q'}^\pm\) is a continuous positive quantity by the
same pointwise argument and smooth convergence. The compactness
check above gives a common lower bound \(a>0\) for the two
maxima. It also gives uniform curvature and first curvature
derivative bounds and a positive uniform lower injectivity
radius. In particular there is a common Lipschitz upper
bound \(L\) for \(A_{q'}^\pm\), since the determinant is
cubic and the derivative of \(|W|^3\) is bounded by
\(3|W|^2|\nabla W|\), including at zero.
Choose a fixed radius below the uniform injectivity radius
and small enough that \(Lr_{\delta,q}\le a/2\). Around a
maximizer the expression is at least \(a/2\) on the ball.
The determinant bound gives
\[
w_\pm^2\ge\bigl(a/[2(q_*-q')]\bigr)^{2/3}
\]
there. The ball volumes have a common positive lower bound,
either by smooth compactness or by Bishop–Gromov using
volume one, positive Ricci curvature, and the diameter
upper bound from the positive scalar lower bound. This
proves the energy assertion on the ball. In an arbitrary
Einstein scale of volume \(V\) its radius is
\(V^{1/4}r_{\delta,q}\), with unchanged chiral energy.
The assertion selects balls in the Einstein representative.
It supplies no favorable splice surcharge on their boundaries.

For any nonround attained class with a positive Einstein
representative in the band, combine E40's determinant
deficit with the pointwise bound
\((A_q^\pm)_+\le(q_*-q)w_\pm^3\).
The integrand is supported where the determinant is
negative, so the E40 estimate gives

$$
e>\frac{16\pi^2}{3}
   +\frac{\max(J_q^+,J_q^-)}{3(q_*-q)^{2/3}} .
$$

The constant yielded by compactness is non-effective, and
this comparison supplies no demonstrated improvement over
E05's unconditional non-effective energy endpoint. It
provides a shape-dependent restriction on Einstein candidates
and fixed-scale chiral charge in the negative determinant region.
Eliminating the remaining attained classes would require a
further rigidity or comparison step.
[E40, (3)–(4)](../notes/E40_CLOSED_PINCHING.md#quantitative-restriction)

The cited Catino–Dameno theorem statement, its determinant
normalization and the reduction at the Weyl zero set were
rechecked on 25 November 2026 in the 39-page author PDF
linked from the CVGMT record updated 15 November 2026.
The arXiv identifier records the submission.
[CVMGT version record](https://cvgmt.sns.it/paper/7876/)
