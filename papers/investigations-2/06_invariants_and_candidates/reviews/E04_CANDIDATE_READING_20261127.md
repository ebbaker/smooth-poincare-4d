# SP4-INV-E04 · Independent reading of the candidate consequences

27 November 2026, for Edward B. Baker III, with OpenAI Codex assistance.
The frozen request selected GPT-6.2 Sol at ultra. Actual serving variant
and reasoning effort were unavailable to this reader. Checkout
6a422ce7814f. Evidence consists of checked primary passages and independent
mathematical replays. The results are paper-level checks.

[Frozen request](../research-progress/handoffs/REQUEST_INV_E04_20261127.md)
(e4ec5d136bd324256…) ·
[Candidate inputs](../notes/CANDIDATE_INPUTS_20261127.md) (59ead88f6f7361a9…) ·
[Lead's presentation tests](../notes/PRESENTATION_TESTS_20261127.md) (cffbb08b7b39b843…) ·
[Even-prism proposition](../../../master/manuscript/claude/even_prism_closing.tex) (d2c1322e2ed91100…) ·
[07's presentation sources](../../../investigations-1/07_positive_subcritical_entry/notes/PRESENTATION_SOURCES.md) (395cbf7750b3f9b2…).

## 1. Rasmussen bounds over every field for a Gluck sphere

**Imports.** In the proof of Corollary 1.13, Manolescu, Marengon, Sarkar
and Willis use two oriented smooth stabilization identities for a Gluck
twist $X$ on a $2$-knot in standard $S^4$.
They are $X\#\mathbb{CP}^2\cong\mathbb{CP}^2$ and
$X\#\overline{\mathbb{CP}^2}\cong\overline{\mathbb{CP}^2}$.
Qiuyu Ren, Corollary 1.4 at $\ell=0$ and $k=1$, gives
$$
s_{\mathbb F}(L_1)\le s_{\mathbb F}(L_0)-\chi(F)-[F]^2-|[F]|'
$$
for an oriented smooth properly embedded cobordism $F$ from $L_0$ to
$L_1$ in $(I\times S^3)\#\overline{\mathbb{CP}^2}$ whenever each component
of $F$ meets the outgoing link. Both links are null-homologous in $S^3$.
Here $[F]$ is the relative class, and $|[F]|'$ is the absolute value of
its pairing with the projective-plane generator. Ren explicitly allows
every field at $\ell=0$. The Beliakova–Wehrli normalization uses the
Bar–Natan deformation in characteristic two. Schütz, Definition 2.1 and
Lemma 2.3(1), gives $s_{\mathbb F}(U_m)=1-m$ for an oriented unlink with
$m$ components over every field. In the crossingless Bar–Natan complex,
the orientation element is the tensor product of $X$ or $1-X$ on the
circles. Its lowest quantum degree is $-m$, with a nonzero all-$X$
coefficient in every field, and the definition adds one.
[Manolescu–Marengon–Sarkar–Willis, arXiv:1910.08195v2, Corollary 1.13 and §6, pp. 6, 32–33](https://arxiv.org/pdf/1910.08195v2) ·
[Ren, arXiv:2305.16089v3, Corollary 1.4, the following coefficient paragraph, and §§2.2–2.3](https://arxiv.org/html/2305.16089v3) ·
[Schütz, arXiv:2508.11373v1, §2](https://arxiv.org/pdf/2508.11373v1).

**Project deduction, replayed.** Let a nonempty oriented $m$-component
link $L$ in the outward-oriented boundary of
$X\setminus\operatorname{int}B_0$ bound $m$ disjoint smooth oriented
properly embedded disks there. Take a small coordinate ball at an
interior point of each disk, meeting it in a standard disk. Join the
small balls with thin four-dimensional one-handles along an embedded
tree of arcs disjoint from the disks and $B_0$. After rounding, their
union $B_1$ is a boundary connected sum of balls along a tree, hence a
ball. Each link circle bounds a disk in its original small
three-sphere away from the joining regions. These disjoint boundary
disks show that the newly exposed link is $U_m$. The remaining surface
$F$ is a union of $m$ annuli, one between each corresponding pair of
components. Set $B_1$ incoming and $B_0$ outgoing, with
$\partial F=-U_m\sqcup L$.

Excision and the pair exact sequence give
$H_2(X\setminus\operatorname{int}(B_0\sqcup B_1),\partial;\mathbb Z)=0$.
Perform the connected sum away from both balls and $F$. Removing the
connected-sum ball preserves this relative second homology by excision,
so the image of the surface in the stabilized pair has relative class
zero. Its square and stabilizing pairing vanish. The oriented closed
stabilization diffeomorphisms give the stated twice-punctured bordisms
after shrinking the ball embeddings and moving them to standard
coordinate balls by ambient isotopy, transporting their endpoint charts.
One negative summand in the forward direction gives
$s_{\mathbb F}(L)\le s_{\mathbb F}(U_m)$. For the reverse direction
use the positive stabilization of $X$, reverse the ambient and surface
orientations, and exchange the incoming and outgoing ends. This again
has one negative summand. In the original endpoint charts,
$\partial(-F)=-L\sqcup U_m$. The outgoing incidence condition holds in
both directions. The reverse inequality at $\chi(F)=0$ gives
$s_{\mathbb F}(L)=1-m$ for all fields.

If a knot $K$ bounds a connected oriented genus-$g$ surface with one
boundary component, a single local puncture gives a connected cobordism
from the unknot to $K$ with Euler characteristic $-2g$. The same
argument gives $|s_{\mathbb F}(K)|\le 2g$. Both deductions apply to
$\Sigma_{\rm odd}(17)$ conditional on the even-prism identification and
the described belt gluing. They give the same Rasmussen tests as in
the standard ball. Existence of the corresponding surface in the
standard ball for a specified link is a separate question.

**Cross-check of general link surfaces.** Suppose instead that an
oriented surface $G$ in the puncture has boundary $L$ and no closed
components. Write $c=|\pi_0(G)|$ and $m=|\pi_0(L)|$, so $1\le c\le m$.
Puncturing once on each component and joining the balls as above gives
a cobordism $U_c\to L$ of Euler characteristic $\chi(G)-c$, with all
components incident to both ends. The same two inequalities give
$$
1-2c+\chi(G)\le s_{\mathbb F}(L)\le 1-\chi(G).
$$
In particular the bound with $m$ in the lower estimate in E02 is valid.
E02 punctures $m$ times with at least one puncture per component, and
the proof still applies. The case $c=m$ includes both the connected
knot calculation and the strong-slicing calculation above.
[E02's all-field return](../research-progress/handoffs/RETURN_INV_E02_20261127.md).

## 2. Rational empty-link comparison for the prism

**Imports.** Ren–Willis Proposition 6.17 proves that an oriented smooth
homotopy four-sphere with
$\Sigma\#k\overline{\mathbb{CP}^2}\cong k\overline{\mathbb{CP}^2}$
has ordinary Khovanov skein lasagna module
$\mathcal S_0^2(\Sigma;\mathbb Q)\cong\mathbb Q$ in tridegree $(0,0,0)$.
The proof uses the rational connected sum formula and the graded
finiteness and nonvanishing of the negative-summand factor.
Ren–Sullivan–Wedrich–Willis–Zhang, Theorem 7.1, construct rational
isomorphisms of the ordinary modules under an interior Gluck twist along
an embedded sphere of trivial normal bundle. The degree shifts in
Theorem 7.1(1) vanish for a null-homologous sphere, giving the graded
comparison in Corollary 7.2. Manolescu–Walker–Wedrich, Corollary 3.5,
give the standard empty-link value $\mathbb Z$ in bidegree $(0,0)$,
with homology-class degree zero since $H_2(S^4)=0$.
[Ren–Willis, arXiv:2402.10452v3, §§1.1 and 6.10](https://arxiv.org/html/2402.10452v3) ·
[Ren–Sullivan–Wedrich–Willis–Zhang, arXiv:2510.05273v1, §7, pp. 48–50](https://arxiv.org/pdf/2510.05273v1) ·
[Manolescu–Walker–Wedrich, arXiv:2206.04616v2, Corollary 3.5](https://arxiv.org/pdf/2206.04616v2).

**Conditional project comparison.** Under the even-prism identification,
$\Sigma_{\rm odd}(17)$ is the twist of standard $S^4$ along the
transported even-cap belt. It meets Proposition 6.17 with $k=1$ and
Corollary 7.2 because the belt has a product normal bundle and zero
homology class. Both routes give the standard graded rational value.
The rational comparison leaves the odd closing's integral torsion and
integral degree-zero group undetermined. The supplied inputs for
$\Sigma_P$ provide neither a negative projective-plane stabilization
identity nor a presentation as a Gluck twist of standard $S^4$. Its
ordinary module remains undetermined by these results.

## 3. Two presentation-sphere tests

**Project deduction, replayed.** An orientation-preserving embedding of a
single trace $X_n(K)$ in an oriented smooth integral homology four-sphere
$Y$ forces $n=0$. Push the interior of a Seifert surface into the trace's
zero-handle, cap it with the two-handle core, and smooth the seam.
The attaching framing differs from the Seifert normal framing by $n$.
The capped surface has normal Euler number and self-intersection $n$
in the oriented trace. The embedding preserves that number, and the
image surface represents zero in $H_2(Y;\mathbb Z)$.

**Import and conditional application.** Ren–Willis, §1.1, identify an
embedded trace $X_n(K)$ with $(-n)$-sliceness of the mirror of $K$ in
the puncture, whose boundary is oriented as $-\partial B^4$. Equivalently,
a disk for $J$ with framing $m$ gives the trace $X_{-m}(\overline J)$,
where $\overline J$ is the mirror. Their Theorem 1.4 uses
$n\ge -TB(\overline K)$ for the embedded trace. Corollary 1.5 says
nonvanishing implies $m>TB(J)$. Consequently, a verified zero-framed
disk in the puncture of $\Sigma_P$ for a knot $J$ with $TB(J)\ge0$
would force vanishing of the ordinary empty-link module, including
over $\mathbb Q$. One Legendrian representative with $tb\ge0$ suffices
for the maximal $TB$ bound. The supplied marking contains no such disk.
[Ren–Willis, §1.1, Theorem 1.4 and Corollary 1.5](https://arxiv.org/html/2402.10452v3#S1.SS1).

**Project deduction, replayed.** In the four-dimensional Gay–Kirby
identity double for the presentation, the two unchanged native relators
are $r_1=x^{-1}y^2xy^{-3}$ and $r_2=x^{-1}yx^2y^{-1}x^{-2}$.
Killing the normal closure of a primitive element in a rank-two free
group leaves the infinite cyclic group, since a primitive element
belongs to a free basis. Use maps acting on the left on the
rational line, with $T(t)=t+1$ and $D_a(t)=at$ for $a>0$.

| Relator imposed | Images of $(x,y)$ | Check |
| --- | --- | --- |
| $r_1$ | $(D_{2/3},T)$ | $D_{2/3}^{-1}T^2D_{2/3}(t)=T^3(t)=t+3$ |
| $r_2$ | $(T,D_{3/2})$ | $D_{3/2}T^2D_{3/2}^{-1}(t)=T^3(t)=t+3$, so $yx^2y^{-1}=x^3$ and $r_2=1$ |

In each row $D_aT(0)=a\ne1=TD_a(0)$, so the corresponding single-relator
quotient admits a nonabelian image. Each native relator is nonprimitive
in every free basis. Each zero-framed small meridian giving a dual
two-handle bounds a transverse disk in the boundary of the one-handlebody
when the other attaching curves are forgotten. Each dual meridian
represents the identity and is also nonprimitive. A geometric
one-/two-handle cancellation requires one transverse passage through
the relevant belt sphere. In a basis with the selected handle as
generator $a$, a word read from such a curve has, up to conjugation,
the form $u a^{\pm1}v$ with $u,v$ words in the other generator.
Substitution for $a$ is an automorphism. This rules out all four
unchanged curves as the first cancelling partner of a one-handle
before slides, relator changes, and stabilization, with arbitrary free
basis changes allowed. Cancellation involving the three-handles and
the meridians' linking with other curves are separate questions.
[Gay–Kirby, *Constructing Lefschetz-type fibrations on four-manifolds*, Geom. Topol. 11 (2007), pp. 2091, 2095, Lemma 4.7](https://msp.org/gt/2007/11-4/gt-v11-n4-p03-p.pdf) ·
[07's ordered relators](../../../investigations-1/07_positive_subcritical_entry/notes/PRESENTATION_SOURCES.md).

I replayed both written presentation tests after deriving the sign and
the affine representations independently. The derivations agree. The
identification of the marked 07 sphere with the presentation-sphere
type uses CERT-E06/E09 as a certificate premise. The four-dimensional
double supplies an unmarked model for this replay.
[Candidate inputs and certificate links](../notes/CANDIDATE_INPUTS_20261127.md).

## 4. Further immediate comparisons

**Conditional project comparison with a boundary link.** Choose a common
coordinate ball $B$ in the exterior, disjoint from the cap, and use
the same outward-oriented boundary marking. For each framed oriented
link $L$ on that boundary the Gluck twist is an interior operation on
$\Sigma_{\rm ev}\setminus\operatorname{int}B$. The belt is still
null-homologous because puncturing preserves $H_2$. Under the even-prism
identification the punctured even closing is the standard ball.
Theorem 7.1 and Corollary 7.2 then give graded rational isomorphisms
$$
\mathcal S_0^2(\Sigma_{\rm odd}(17)\setminus\operatorname{int}B,L;\mathbb Q)
\cong\mathcal S_0^2(B^4,L;\mathbb Q)
\cong KhR_2(L;\mathbb Q).
$$
The relative homology-class grading has a unique class lifting the total
oriented $[L]$ because the punctures have zero $H_1$ and $H_2$. The
last identification is Ren–Willis Proposition 2.6 in its framing-sensitive
$\mathfrak{gl}_2$ convention. More generally, their Proposition 2.4
expresses the ordinary module for any homotopy sphere puncture with $L$
over $\mathbb Q$ as its closed ordinary module tensored with
$KhR_2(L;\mathbb Q)$, by writing the puncture as $\Sigma\#B^4$ and
using field monoidality. Thus adding a boundary link gives no additional
distinguishing power for these rational modules. For $\Sigma_P$ the
closed factor is still undetermined.
[Ren–Sullivan–Wedrich–Willis–Zhang, §7.2](https://arxiv.org/pdf/2510.05273v1) ·
[Ren–Willis, Propositions 2.4 and 2.6, and §6.11's twice-punctured version](https://arxiv.org/html/2402.10452v3).

**Project comparison for the Lee filtration.** Ren–Willis Theorem 4.1
gives one canonical generator $x_{0,0}$ for the rational empty-link Lee
module of a homotopy sphere. Its homological degree and homology-class
degree are both zero. Definition 4.10 identifies its filtration with
$s(\Sigma;0)$. Proposition 1.14 gives
$s(\overline{\mathbb{CP}^2};0)=0$. For a negatively projective-plane-stably
standard homotopy sphere, apply Theorem 4.11(4) to the zero classes on
both sides of the stabilization identity. The equality has a finite
zero on the standard side and the stabilizing summands have finite
zero filtration. It follows that $s(\Sigma;0)=0$, even allowing
$s(\Sigma;0)=-\infty$ a priori. The one-dimensional Lee module then
has the standard full filtration, including for the odd prism under
the same premise as in §2. The same argument with $\Sigma=S^4$ fixes the
standard comparison. For $\Sigma_P$ this deduction fixes the unfiltered
dimension and the homological and homology-class degrees, with the
quantum filtration still undetermined by these inputs.
[Ren–Willis, Proposition 1.14, Theorem 4.1, Definition 4.10, and Theorem 4.11(4)](https://arxiv.org/html/2402.10452v3).

**Project comparison under reversal of orientation.** Swapping the two
halves of the identity double $W\cup_{\partial W}(-W)$ is a smooth
orientation-reversing involution, given in a seam collar by
$(p,t)\mapsto(p,-t)$. Hence $\Sigma_P$ and $-\Sigma_P$ have equal values
for closed oriented diffeomorphism invariants. An invariant coordinate
ball centered on the seam makes the involution restrict to a reflection
of its puncture boundary. A zero-framed disk could therefore meet the
criterion in §3 via a $TB\ge0$ witness for either its knot or its mirror.
The current inputs leave the existence of such a witness open.
[Gay–Kirby, §4.1, Lemma 4.7](https://msp.org/gt/2007/11-4/gt-v11-n4-p03-p.pdf).
