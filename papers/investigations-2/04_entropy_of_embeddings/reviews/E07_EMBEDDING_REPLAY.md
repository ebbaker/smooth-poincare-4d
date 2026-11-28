# SP4-ENT-E07 — Independent replay of the embedding lemma

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Intake `6a422ce7814f`. The request routes this check to `gpt-6.2-sol` / ultra.
The serving variant and reasoning effort are unavailable to this worker.
Reviewed [E02](../research-progress/handoffs/E02_EMBEDDING_RETURN.md), SHA-256
`7669cf0c1221ecbc3303c671d828cf512fc9a37e815bc47e857a87f6b93f4b60`,
under [request revision 1](../research-progress/handoffs/REQUEST_E07_EMBEDDING_REPLAY_20261127.md).

**Replayed project theorem.** The proof gives a smooth embedding of each
closed smooth homotopy four-sphere $M$ in $\mathbb R^5$. For every such
embedding $f$, the closure $C_f$ of its bounded complementary component is
diffeomorphic to $D^5$ as a smooth manifold with boundary if and only if $M$
is diffeomorphic to the standard $S^4$. The conclusion concerns unmarked
diffeomorphism types and is independent of the orientation chosen on $M$.
This replay supplies the topological part of N2 for the lead's formal
statement handoff.

## Filling, seam and dimensions

**Import checked.** Kervaire's Theorem 3, p. 70, applies to a smooth integral
homology four-sphere. The opening proof paragraph for dimension four starts
from a smooth parallelizable five-manifold with boundary $M$ and modifies
it to a smooth contractible five-manifold $V$ with the same boundary. A
homotopy four-sphere has the required integral homology.
[Kervaire 1969, Theorem 3 and opening proof paragraph](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kervsmoo.pdf#page=5)

In the collar of $M=\partial V$, the corners of $V\times[-1,1]$ are products
with planar quadrants. Rounding their profiles near the ends yields a smooth
compact six-manifold $W$ with the same homeomorphism type as the product,
so $W$ is contractible. On the lateral boundary the rounding is supported
away from $t=0$. The induced boundary collar of $M\times\{0\}$ has the
interval coordinate $t$ across the seam. The two closed halves of $\partial W$
are each diffeomorphic to $V$, since each consists of an end face with its
boundary collar extended through the rounded corner to $t=0$. Their
boundary coordinates identify the same point of $M$ on both halves. This
recovers the smooth double, including the smooth embedded seam and the
opposite orientations on the two copies of $V$. Van Kampen in an open
cover thickening both halves gives $\pi_1(\partial W)=0$, since each half is
contractible and the overlap is connected. The reduced Mayer–Vietoris
sequence gives $\widetilde H_j(\partial W;\mathbb Z)\cong
\widetilde H_{j-1}(M;\mathbb Z)$ for $j\ge 1$.

**Import checked.** Smale's Theorem (1.1), p. 498, requires a compact smooth
contractible $n$-manifold with simply connected boundary and lists the
excluded dimensions $3,4,5,7$. Here $n=6$, so $W\cong D^6$ and the
restriction to the boundary puts the smooth seam in $S^5$. Stereographic
projection away from a point off the seam puts it in $\mathbb R^5$. The
case $2m=6$ of Smale's earlier Theorem M also supplies the same disk
statement. Kervaire's proof of Theorem I explicitly uses the double
for $n=4$.
[Smale 1961, Theorem (1.1)](https://www.maths.gla.ac.uk/~mpowell/Smale-diff-comb.pdf#page=2) · [Smale 1961, Theorem M, p. 394](https://www.math.uchicago.edu/~shmuel/tom-readings/Smale%2C%20PC.pdf#page=5) · [Kervaire 1965, p. 112](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kervhknt.pdf#page=8)

The optional cobordism calculation also checks. Puncturing $W$ in a smooth
interior six-ball gives a simply connected six-manifold $P$ with ends
$\partial W$ and $S^5$. Van Kampen and Mayer–Vietoris for gluing back the
ball give simple connectivity and a homology equivalence $S^5\hookrightarrow
P$. The boundary of the relative orientation class $[P,\partial P]$
identifies the top-degree classes of the ends up to sign in $H_5(P)$,
so $\partial W\hookrightarrow P$ is a homology equivalence too. Both
inclusions are homotopy equivalences by the simply connected Whitehead
theorem. Smale's Theorem 1.1, p. 387, compares closed oriented simply
connected $n$-manifolds with $n\ge5$ that are smoothly $h$-cobordant. The
ends of $P$ have dimension five and its cobordism has dimension six.
The same homotopy argument for punctured $V$ gives a five-dimensional
$h$-cobordism with four-dimensional ends. This proves $[M]=[S^4]=0$ in
Kervaire–Milnor's $\Theta_4$ and falls outside Smale's range for promoting
an $h$-cobordism to a diffeomorphism of its ends. The proof uses no
classification of smooth homotopy four-spheres.
[Smale 1962, Theorem 1.1](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/structur.pdf#page=2) · [Kervaire–Milnor 1963, §1, p. 504](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/kervaire-milnor.pdf#page=2)

## Bounded side for every embedding

Given arbitrary $f$, Alexander duality in $S^5$ gives two complementary
components because $H^4(f(M);\mathbb Z)=\mathbb Z$. The two-sided collar
has connected halves and each complementary component meets the collar,
so each closure has smooth boundary $f(M)$. Removing the point at infinity
leaves its component connected, since it is an open connected
five-manifold. The other component has compact closure in $\mathbb R^5$
and gives the unique bounded side. Any diffeomorphism $C_f\cong D^5$
restricts to a diffeomorphism of boundaries, yielding $M\cong S^4$.

**Import checked.** Smale's Corollary (1.3), p. 498, applies to a smooth
embedding of the standard $S^{n-1}$ in $\mathbb R^n$ and concludes that the
bounded closure is diffeomorphic to $D^n$. Its exclusions are ambient
dimensions $4,7$, so $n=5$ is allowed. If $u:S^4\to M$ is a
diffeomorphism, the corollary applies to $f\circ u$ for each $f$ separately.
The image and bounded region are the same for $f$ and $f\circ u$. Palais's
Theorem B and Corollary 1 concern matching two already parametrized smooth
disks, with matching orientations in the orientable codimension-zero case.
The disk assertion here comes from Smale's corollary.
[Smale 1961, Corollary (1.3)](https://www.maths.gla.ac.uk/~mpowell/Smale-diff-comb.pdf#page=2) · [Palais 1960, Theorem B and Corollary 1, pp. 275–276](https://www.researchgate.net/publication/238867175_Extending_Diffeomorphisms)
