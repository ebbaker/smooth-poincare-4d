# E160 — Bounded source test for removing the injectivity premise

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E applicability check under [B81][b81],
configured gpt-6.2-sol / ultra. Independent runtime attestation and
actual lead identifiers are unavailable. The executor authored
related E145, E155 and E157, and did not author the frozen E154
or E137 work. All five inputs in the [request][req] were verified.
Four discovery/metadata queries were used and three primary works
were inspected. This is a selected-passage source check.

## Disposition and metric hypotheses

**The checked passages do not justify removing the supplied
injectivity premise.** They support orbifold compactness, a
Ricci-flat ALE blow-up mechanism in the proof discussion, and
classification of a smooth ASD ALE candidate. A precise bridge
from these inputs to exclusion of all singular limits, including
the \(b_2=0\) quotient case, remains unverified.

The input is a sequence of smooth Riemannian metrics \(g_i\) on
one fixed smooth closed oriented homotopy four-sphere \(M\), with
\[
 |\operatorname{Ric}_{g_i}|\le K,\qquad |W^+_{g_i}|\le K_+,\qquad
 \operatorname{Vol}(M,g_i)\ge v>0,\qquad
 \operatorname{diam}(M,g_i)\le D .
\]
The self-dual Weyl block \(W^+\) refers to the given orientation.
There is no derivative bound on curvature and no full curvature
supremum bound in these assumptions. The branch only needs a
positive \(C^1\) metric limit modulo same-base diffeomorphisms,
as in B80, as an input for subsequent bundle compactness.
The already assessed R29 Theorem 2.2 gives the appropriate
fixed-base conclusion with a supplied positive injectivity
lower bound. [B80][b80] · [E154 source assessment][e154a].

A useful distinction is that volume noncollapse on each fixed
scale is already present. Set \(\kappa=K/3\) and choose
\(D'>D\). The Ricci lower bound gives
\(\operatorname{Vol}_{g_i} B(x,r)\ge
v\,V_{-\kappa}(r)/V_{-\kappa}(D')\) for \(0<r\le D'\)
by Bishop–Gromov comparison, where \(V_{-\kappa}\) is the
simply connected four-dimensional model ball volume.
It also gives \(\operatorname{Vol}(M,g_i)\le
V_{-\kappa}(D')\). At scales \(\widehat g_i=\lambda_i^2g_i\),
\(\lambda_i\to\infty\), the lower bound on each fixed
rescaled radius is of Euclidean order. This still allows
curvature concentration. The four-dimensional Chern–Gauss–Bonnet
identity and a Ricci bound then yield a total \(L^2\) curvature
upper bound on the fixed \(M\). In addition, \(\tau(M)=0\)
gives equal \(W^+\) and \(W^-\) squared integrals in the same
operator norm. These are bounded-integral statements and impose
no small energy threshold. [R29 §2, after (2.17)][r29].

## R29 — Anderson's stated convergence and proof discussion

Michael T. Anderson, *Cheeger–Gromov theory and applications
to general relativity*. Inspected the author-hosted PDF by its
legible indexed primary text on 22 November 2026. The inspected
file has no asserted publication crosswalk. E154 records the
author-index identification of the 2004 Birkhäuser chapter;
that identification is not a claim to have read a specific
published edition. No local reading copy was retained.
The new selected passages are §2, Example 2.5, (2.15)–(2.17),
Theorem 2.6 and the next proof paragraphs, printed pp. 8–10,
and the entries [1]–[3] in the reference list. [Author PDF][r29] ·
[Canonical R29 record][canon].

Theorem 2.6 assumes smooth metrics on a fixed four-manifold
with (2.17), namely bounded absolute Ricci curvature, positive
total volume lower bound and diameter upper bound. It gives a
subsequence converging in Gromov–Hausdorff topology to a
four-orbifold with finitely many isolated singular points.
A singular point is locally topologically a cone on
\(S^3/\Gamma\) with \(\Gamma<SO(4)\) finite. On the regular
set the metric has \(C^{1,\alpha}\) or \(L^{2,p}\) regularity
(the latter is the source's Sobolev notation), and it extends
as a \(C^0\) Riemannian metric in a local uniformization.
The comparison embeddings are from the regular set and the
stated pullback metric convergence there is \(C^{1,\alpha}\).
No ambient spin, Einstein, \(W^+\), covariant curvature-derivative
or independently prescribed energy bound occurs in (2.17).
The theorem's conclusion permits singularities, even when
all original metrics live on one smooth manifold.
If the singular set were empty, the stated regular-set
convergence would give a \(C^1\) metric limit on a smooth
compact identified base, as needed by B80.

The proof discussion goes further than the literal theorem
statement. After the four-dimensional Gauss–Bonnet energy
bound, it asserts suitable rescalings and base points near
each singular point, a subsequence converging in
\(C^{1,\alpha}\cap L^{2,p}\) to a nontrivial Ricci-flat ALE
space, and topologically essential embeddings into the
original manifold. The paragraph does not specify a full
bubble tree, exact scale selection or precise compact-core
and end embedding statements at intermediate singular
levels. The source says this result comes from reference [1],
Anderson's *Convergence and rigidity of manifolds under Ricci
curvature bounds*. R29 prints volume 106 there, while the
existing R28 publisher metadata record volume 102 and the same
page span 429–445. E154 could not verify the full theorem text
in R28. Reference [2] is *Short geodesics and gravitational
instantons*, given in the neighboring discussion of the
failure of general injectivity bounds, and [3] concerns
compactness with injectivity. Those cited works were not
opened as further primary works in this packet.

Example 2.5 uses scaled Eguchi–Hanson spaces to illustrate
concentration and an \(\mathbb R^4/\mathbb Z_2\) orbifold
limit. Neither this example nor the text's comment on compact
orbifold degeneration constructs a sequence on a homotopy
four-sphere with the full specified \(W^+\) hypothesis.
The example supplies no counterexample to the branch's exact
criterion. [R29 Example 2.5 and Theorem 2.6][r29] ·
[E154 access record][e154].

## Chirality at a supplied rescaling and Wright's smooth classification

For the named rescaling \(\widehat g_i=\lambda_i^2g_i\),
the norms of Ricci and \(W^+\) acquire \(\lambda_i^{-2}\),
while the four-dimensional full-curvature squared integral
is scale invariant. Constant positive rescaling preserves
the star on two-forms. Thus on oriented regular charts
with positive strong \(C^1\) metric convergence and local
weak \(W^{2,p}\) control, the Ricci and \(W^+\) tensors of
the limit vanish distributionally. In coordinates the curvature
is linear in the second metric derivatives with continuous
coefficients plus products of first derivatives. The former
pass weakly and the latter strongly. On a regular smooth
limit this means Ricci-flat and ASD, with \(W^+=0\).
For a weak Einstein limit, R29 discusses the usual regularity
upgrade in harmonic coordinates in its proof of Theorem 2.2.
None of these local observations removes orbifold points or
proves that a given rescaling is the complete smooth nonflat
ALE manifold needed by the next source. In particular the
bound on \(W^+\) survives any relevant oriented subsequential
limit in this sense, but does not itself furnish an extraction.
[R29 proof of Theorem 2.2 and after Theorem 2.6][r29].

Evan P. Wright, *Quotients of gravitational instantons*,
arXiv:1102.2442v2, revised 29 April 2011. The exact theorem
was inspected in the versioned primary PDF on 22 November
2026, not inferred from the abstract. Checked Theorem A,
Corollary B and §2 (preprint pp. 1–3), §3 and Proposition 1
(pp. 4–5), the end of §7 (pp. 18–19) and §8 (pp. 19–20),
including use of (9). The publisher record separately confirms
*Annals of Global Analysis and Geometry* 41, 91–108 (2012),
online 11 May 2011, DOI 10.1007/s10455-011-9272-2.
The published full text was not used for theorem wording.
The DOI resolver view was inaccessible, while the direct
publisher page was accessible. No local copy was retained.
[Preprint metadata][wrightmeta] · [Inspected primary PDF][wright] ·
[Publisher record][wrightpub].

Theorem A concerns a nonflat, non-simply-connected Ricci-flat
ASD ALE **manifold**, in the smooth oriented Riemannian
four-dimensional category. It has no assumed spin structure,
global Kähler condition or separate curvature energy threshold.
The ALE definition requires one exterior
\((\mathbb R^4\setminus B)/\Gamma_\infty\) off a compact set,
with \(\Gamma_\infty\) finite in \(SO(4)\) and free on \(S^3\),
and metric derivative decay of order
\(O(r^{-\tau-|\alpha|})\) for all multi-indices in the lifted
coordinates, \(\tau>0\). This gives a complete end of the
smooth manifold; it is a hypothesis on the candidate, not on
the original compact sequence. Wright's Remark 2 invokes
Bando–Kasue–Nakajima for order four coordinates in this
Ricci-flat ASD class. That underlying theorem was not opened
as a fourth primary work. These assumptions and the theorem
concern manifolds and do not classify a singular ALE orbifold.

The conclusion of Theorem A is a finite cyclic isometric
quotient of a Gibbons–Hawking space, and the quotient is Kähler.
The proof distinguishes restricted \(SU(2)\) holonomy from
globally hyperkähler geometry. The cyclic deck actions are
specified by the cyclic rotation groups preserving the centered
monopole set and acting freely on it. In the simply connected
case, the discussion in §2 identifies the hyperkähler space
with the Kronheimer resolution topology, citing the original
classification. This is Wright's verified use of that
classification, not a separate inspection of Kronheimer.

The quotient has a single end and Proposition 1 gives
\[
 1\longrightarrow\pi_1^\infty(\widetilde X)
 \longrightarrow\pi_1^\infty(X)
 \longrightarrow\pi_1(X)\longrightarrow1 .
\]
For a degree-\(d\) cyclic quotient of a Gibbons–Hawking
cover with Euler characteristic \(k\), §8 gives
\(b_2(X)=k/d-1\) and \(|\pi_1^\infty(X)|=dk\).
Thus \(b_2(X)=0\) is allowed, with \(k=d\ge2\) in the
nonflat case and end group order \(d^2\). A free cyclic
rotation on a single orbit of \(d\) monopoles gives the
type of quotient allowed by Theorem A. The group order
alone does not identify the boundary homology or prove
embeddability. In Wright's curvature normalization from (9),
Corollary B gives \(6\pi^2\) as an energy lower bound for
\(b_2=0\), and \(8\pi^2(b_2+1-1/(b_2+1))\) for \(b_2>0\).
The input supplies no smallness compared to
that threshold. Ambient simple connectivity was not used
to identify \(\pi_1(X)\), as Wright also emphasizes in §1.
[Wright Theorem A, Proposition 1 and Corollary B][wright].

## Third work — Kapovitch–Lott and the orbifold versus manifold distinction

Vitali Kapovitch and John Lott, *On noncollapsed almost
Ricci-flat 4-manifolds*, *American Journal of Mathematics*
141(3), 737–755 (June 2019), DOI 10.1353/ajm.2019.0015.
Inspected the author-hosted published reading text on
22 November 2026, including Theorem 1.1 and Corollary 1.2
(pp. 737–738), proof §§2.2–2.4 (pp. 742–747), and the
neighborhood of Lemma 2.22 (pp. 747–748). The Toronto
author-hosted manuscript and the arXiv metadata
(arXiv:1606.09041v3, 14 October 2017) were also accessed as
versions of this same work. The proof locators here are
from the published text. No local copies were retained.
[Published reading text][kl] · [Preprint metadata][klmeta].

Theorem 1.1 gives the K3 conclusion for a closed connected
Riemannian spin four-manifold with \(\widehat A(M)\ne0\),
\(\operatorname{Vol}\ge v\), diameter \(\le1\),
\(\operatorname{Ric}\le\Upsilon g\), and scalar curvature
bounded below by a sufficiently small negative number
depending on \(v,\Upsilon\). The proof sends that scalar
negativity to zero, uses the Ricci and \(L^2\) curvature
compactness inputs in §2.2, and crucially uses a nonvanishing
chiral harmonic spinor from the index. Corollary 1.2
uses a small absolute Ricci bound and the same index
hypothesis. A smooth homotopy four-sphere is spin but has
\(\widehat A=-\tau/8=0\), and an arbitrary bound on its
Ricci or \(W^+\) does not impose the stated additional
scalar pinching. Neither result applies directly.

In §2.3 the proof, citing [AC91, Remark 3.1] and
[Ba90a, Proposition 2], takes a pointed rescaling giving
a nonflat Ricci-flat order-four ALE **orbifold**, potentially
with isolated singularities, and states embeddings of
regions away from those singularities back into the
approximating manifolds. The spin structure on such regions
comes from embedding, while the asymptotically parallel
positive chirality spinor comes from further parts of the
argument. Section 2.4 treats iterated rescalings in a
finite tree, with a smooth ALE manifold at a terminal
vertex in that proof. It explicitly distinguishes cited
Einstein-sequence work from cited bounded-Ricci work and
uses the \(L^2\) energy accounting for finiteness.
This passage confirms that an intermediate Ricci-flat ALE
node need not be smooth. It refers to analytic sources
relevant to a bounded-Ricci tree but does not constitute
an independently checked bridge for the present topology
and \(W^+\) hypotheses. Neither the cited original
extraction works nor the spinor theorem are imported here.
[Kapovitch–Lott §§2.2–2.4][kl].

## Applicability and unresolved bridge

| Checked result | What matches | What remains |
| --- | --- | --- |
| R29 Theorem 2.6, (2.17) | Fixed real four-manifold, Ricci bound, volume and diameter give a compact orbifold and regular-set \(C^{1,\alpha}\). The neighboring proof sketch asserts a nontrivial ALE rescaling, beyond the orbifold convergence statement. | Smoothness of the full base limit is absent. Exact nested extraction, terminal smooth pieces and the compact-core/end embeddings needed here are not established by the brief discussion alone. |
| R29 rescaling plus a bound on \(W^+\) | \(\operatorname{Ric}\) and \(W^+\) go to zero on regular oriented charts with the indicated metric convergence. | This gives the chirality of a supplied regular blow-up. It supplies neither the smooth ALE candidate nor a topology exclusion. |
| Wright Theorem A, §3 and Corollary B | Applies to a supplied smooth complete nonflat Ricci-flat ASD ALE candidate, including nontrivial finite fundamental group. | It does not extract such a space from \(g_i\), classify singular ALE nodes, or exclude smooth \(b_2=0\) quotients on the ambient topology. |
| Kapovitch–Lott Theorem 1.1 and proof §§2.2–2.4 | Shows the relevant distinction between ALE orbifolds and smooth leaves, and specifies further sources for rescaling and assembly. | The stated K3 theorem and its spinor argument need a nonzero index. Its terminal and hyperkähler conclusions cannot simply be read as a general homotopy-sphere compactness theorem. |

The topological part of the suggested mechanism has a precise
conditional limit. If a smooth compact core of a nonflat
Ricci-flat ASD ALE candidate with \(b_2>0\) embeds in \(M\),
the negative definite intersection form in Wright supplies a
compactly supported nonzero self-intersection. The same
intersection calculated in the ambient homotopy sphere would
vanish because \(H_2(M;\mathbb R)=0\). This would exclude
that embedded core. The argument gives no condition on a
core with \(b_2=0\). Spin of the ambient sphere passes to
smooth embedded regions, but does not give them a parallel
spinor or make them simply connected.

For a smooth embedded end section there is a separate
elementary necessary test. A connected rational homology
three-sphere \(Y\) separating an integral homology four-sphere
has \(H_1(Y;\mathbb Z)=H_1(U;\mathbb Z)\oplus H_1(V;\mathbb Z)\)
via Mayer–Vietoris, where \(U,V\) are the two compact sides.
Their \(H_2\) groups vanish. The pair exact sequence,
Poincaré–Lefschetz duality and universal coefficients give
\(|H_1(Y)|=|H_1(U)|^2=|H_1(V)|^2\), since the kernel of
\(H_1(Y)\to H_1(U)\) is \(H_2(U,Y)\cong H^2(U)\) of
order \(|H_1(U)|\). In particular a nontrivial cyclic
\(H_1(Y)\) could not split that way. This is a conditional
test on an actual embedded boundary and its abelianized end
group, not an end classification or embedding theorem.
Wright's order formula \(d^2\) for \(\Gamma_\infty\) in
the \(b_2=0\) family cannot substitute for those checks.
The quotient case remains an obstruction to a bare
positive-\(b_2\) argument.

The next dependency is a precisely applicable bounded-Ricci
singularity extraction and embedding theorem for this
sequence, followed by actual end-topology exclusion of
the allowed smooth quotients, or one directly stated
singular-free compactness theorem with these exact inputs.
No such full implication was verified within the bounded
source check. Retain the supplied injectivity premise
in B80. E157's separate elimination of a semidefinite
connection limit presupposes a positive \(C^1\) metric limit
and does not address this metric singularity question.

## Search and access ledger

Four distinct discovery/metadata searches were run in two
batches on 22 November 2026:

~~~text
Evan Wright quotients of gravitational instantons anti-self-dual Ricci-flat ALE Theorem A b2 0 Gibbons Hawking arXiv
Ricci curvature bounded self-dual Weyl tensor W+ bound compactness four dimensional homotopy sphere injectivity ALE bubbles Anderson Cheeger Tian
Evan P Wright Quotients of gravitational instantons publication Annals Global Analysis Geometry 1102.2442 DOI
Vitali Kapovitch John Lott On noncollapsed almost Ricci-flat 4-manifolds author PDF publication arXiv DOI
~~~

Within-work navigation of the three primary texts was used
for the cited theorem and proof locators. R29's author PDF
was read through the legible fixed indexed reference; the
previously reported fresh-PDF extraction issue did not
obstruct those passages. The first batch found the two
additional relevant works, which were promptly sent to the
lead for canonical registration. Search-result summaries
of other works and cited-but-unopened references were not
used as theorem evidence. No local file was downloaded,
so retained byte counts and hashes are unavailable.
Only the designated review and return were written.

[req]: ../research-progress/handoffs/SP4-CME-E160_REQUEST_v1.md
[b81]: ../brainstorm/notes/B81_NONCOLLAPSE_SOURCE_TEST_20261122.md
[b80]: ../brainstorm/notes/B80_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md
[e154]: E154_RICCI_COMPACTNESS_SOURCE_CHECK_20261122.md
[e154a]: E154_METRIC_COMPACTNESS_SOURCE_ASSESSMENT_20261122.md
[canon]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md
[r29]: https://www.math.stonybrook.edu/~anderson/cargese.pdf
[wrightmeta]: https://arxiv.org/abs/1102.2442v2
[wright]: https://arxiv.org/pdf/1102.2442v2
[wrightpub]: https://link.springer.com/article/10.1007/s10455-011-9272-2
[kl]: https://math.berkeley.edu/~lott/almostflat.pdf
[klmeta]: https://arxiv.org/abs/1606.09041v3

