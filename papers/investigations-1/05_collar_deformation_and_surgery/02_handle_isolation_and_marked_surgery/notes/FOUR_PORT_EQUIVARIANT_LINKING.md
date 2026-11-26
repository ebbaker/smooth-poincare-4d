# Equivariant linking at a mixed four-port cut

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded derivation SUR-E02ab on the [frozen issue](../../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md), SHA-256 ac934a5d025385349fe1a9f7cf14b4090c4f60b6052e6ddcf003108e96a40996. Selected helper GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. Working HEAD at intake 14cb1584242225baeccc28674d5a681572ea00ee. Smooth oriented three-manifolds, parametrized attaching tubes, and integral slopes. The computation treats the stated mixed pairing with arbitrary tangle interiors and an actual rank-three free outlet.

## Character and surgery presentation

Let \(S\) be the marked nonseparating sphere in \(Y_1=S^1\times S^2\), disjoint from the stationary knot \(Q\). The moving knot \(K\) cuts into returns \(R_-:1_-\to2_-\), \(R_+:4_+\to3_+\) and through strands \(3_-\to1_+\), \(2_+\to4_-\). Orient \(K\) by these arrows. Its crossings in the order \(3,1,2,4\) have signs \(+,+,-,-\) when positive means crossing from the upper face of one slab to the lower face of the next. Both knots have winding zero. The inlet generator character restricts to a surjection on the drilled exterior since loops can be perturbed off the two cores. It takes each meridian to zero and each framed longitude to the winding of its knot, also zero. It therefore kills the two filling slopes and gives a surjection on the actual outlet \(Y\). On either filling solid torus it is zero, since the torus boundary maps onto its core group.

Write \(\Lambda=\mathbb Z[t,t^{-1}]\). On \(\widetilde Y_1=S^2\times\mathbb R\) the deck map \(t\) raises the slab label by one. Each tube lifts homeomorphically. Let \(\widetilde E\) be the drilled cover. Excision identifies \(H_2(\widetilde Y_1,\widetilde E;\mathbb Z)\) with the direct sum of one meridian disk generator per lifted tube. The map from \(H_2(\widetilde Y_1;\mathbb Z)\) records intersections with the core lifts, all zero since those lifts are closed curves null-homologous in \(S^2\times\mathbb R\). Also \(H_1(\widetilde Y_1;\mathbb Z)=0\). The pair sequence therefore gives \(H_1(\widetilde E;\mathbb Z)=\Lambda\mu_Q\oplus\Lambda\mu_K\) using the oriented meridians of chosen lifts \(L_Q,L_K\).

Use row \(i\) for \(\mu_i\) and column \(j\) for the filling at \(L_j\), for \(i,j\in\{Q,K\}\). The relation is the oriented framed push-off \(L_j^f\). Bounding it by a compact two-chain in the inlet cover and intersecting with the core lifts gives the meridian coordinates

\[
 M_{ij}(t)=\sum_{n\in\mathbb Z}\operatorname{lk}(L_j^f,t^nL_i)t^n.
\]

The sum is finite by local finiteness. These linking numbers are independent of the two-chain by the same zero intersections, and equal the linking numbers in the \(S^3\) obtained by adding the two ends. Except when \(i=j\) and \(n=0\), the push-off can be replaced by its core in the linking number since the other core misses the tube. Symmetry gives \(M_{ji}(t)=M_{ij}(t^{-1})\). Replacing the chosen lifts by \(t^{a_i}L_i\) multiplies entry \(ij\) by \(t^{a_j-a_i}\). Reversing orientations and their corresponding meridians multiplies that entry by the product of the two orientation signs.

In the outlet cover, glue a solid torus to every lifted boundary torus using the translated slope. The old meridian represents the filling core up to sign because the slope is integral. The degree-zero Mayer–Vietoris map from the disjoint boundary tori is injective on its solid torus summand. Consequently

\[
 H_1(\widetilde Y;\mathbb Z)\simeq\operatorname{coker}(M:\Lambda^2\to\Lambda^2).
\]

When \(\pi_1Y=F_3\), choose a free basis with character \((1,0,0)\). The Euclidean algorithm on the original character values is realized by Nielsen swaps, inversions and basis multiplications. The cyclic cover of the wedge of three circles for this basis has \(C_1=\Lambda^3\), \(C_0=\Lambda\) and boundary \((t-1,0,0)\). Its fundamental group is the same kernel as that of the outlet cover. In both cases the deck action on the abelianization is induced by conjugation by the chosen positive generator. Thus \(H_1(\widetilde Y;\mathbb Z)\simeq\Lambda^2\). Tensoring the surgery presentation with \(\mathbb Q(t)\) forces the matrix to have rank zero. Each Laurent coefficient therefore vanishes.

## The coefficients from the marked chords

In one slab complete \(R_-\) by the lower \(12\) chord and \(R_+\) by the upper \(34\) chord, giving \(J_-\) and \(J_+\). Close the through strands with the upper \(12\) chord and lower \(34\) chord, giving \(C\). Orient each completion by the orientations on its original arcs. The two chords on each face are disjoint with distinct endpoint germs. Cap the slab by balls to compute linking, or push the completed cycles slightly into its interior. Set

\[
\begin{gathered}
 a_-=\operatorname{lk}(J_-,Q),\quad a_0=\operatorname{lk}(C,Q),\quad
 a_+=\operatorname{lk}(J_+,Q),\\
 b_-=\operatorname{lk}(J_-,C),\quad b_+=\operatorname{lk}(J_+,C),\quad
 c=\operatorname{lk}(J_-,J_+).
\end{gathered}
\]

Choose the stationary lift \(Q_0\) in \(W_0\) and the moving lift \(K_0\) with its two through strands in \(W_0\). Its lower \(12\) return lies in \(W_1\) and its upper \(34\) return in \(W_{-1}\). The chosen seam charts identify each completion chord with its opposite occurrence, with the reverse orientation. This gives the chain identity \(K_0=(J_-)_{1}+C_0+(J_+)_{-1}\), with indices specifying slabs. For example, the upper \(12\) chord of \(C_0\) points \(1\to2\) while the lower \(12\) chord of \((J_-)_{1}\) points \(2\to1\). The \(34\) cancellation is the same with the arrows reversed on the opposite sides. This identity is in the complement of every \(Q_n\). A completed cycle pushed into one slab bounds a two-chain there, so it has linking zero with a cycle in any different slab.

For \(K_0\) and \(K_1\), the chords on their one shared seam belong to the disjoint \(12\) and \(34\) port disks. Each decomposition therefore takes place in the complement of the other core. After decomposition both sets of chords can be pushed into their own slabs with all cross-set curves still disjoint. The only common slabs are \(W_0\) with pair \((C,J_+)\) and \(W_1\) with pair \((J_-,C)\). For \(K_0\) and \(K_2\) the chords are already in distinct seams, and only \(W_1\) is common, with pair \((J_-,J_+)\). For \(n>2\) there is no common slab. Negative shifts give the same respective coefficients by symmetry and deck translation. This gives

\[
 M(t)=\begin{pmatrix}
 f_Q & a_+t^{-1}+a_0+a_-t\\
 a_-t^{-1}+a_0+a_+t & F_K+(b_-+b_+)(t+t^{-1})+c(t^2+t^{-2})
 \end{pmatrix}.
\]

Here \(f_Q=\operatorname{lk}(Q_0^f,Q_0)\) is the inlet framing of \(Q\) and \(F_K=\operatorname{lk}(K_0^f,K_0)\) is the moving diagonal constant term. If \(f_K\) is the ordinary inlet framing of \(K\), then \(F_K=f_K-2(b_-+b_+)-2c\). This follows by pushing a compact bounding two-chain of \(K_0^f\) down to the inlet. Its intersection downstairs is the sum over all core lifts, namely the augmentation at \(t=1\). Ordinary linking is well defined because the inlet cores are null-homologous.

## The fixed marked bridge test

The vanishing matrix gives \(a_-=a_0=a_+=c=0\), \(b_-+b_+=0\) and \(f_Q=F_K=f_K=0\). Both charted returns link the stationary knot trivially, separately. The moving diagonal forces the two completed returns to have zero mutual linking and their two linkings with \(C\) to cancel.

Linking with \(C\), using its chord completions in the cap balls, defines a homomorphism on the drilled slab. It gives zero on the prescribed stationary filling slope since its push-off is isotopic to \(Q\) in the complement of \(C\) and \(a_0=0\). The homomorphism descends to the stationary-filled drilled slab. A fixed return chord closed by a strip on its own return tube has image \(b_-\) or \(b_+\) because before filling the strip can be collapsed to the return in the complement of \(C\). Changing the strip winding adds only a return meridian, of image zero. A bridge disk for either prescribed chord missing the other moving strands would give a null-homologous loop after clipping its own tube. Thus its corresponding \(b\) would vanish. The sum equation forces the other \(b\) to vanish as well. Any nonzero \(b_-\) rules out both prescribed bridges even when intersections with the stationary filling core are allowed. The moving diagonal equation permits opposite nonzero values. Vanishing of the individual \(b\)'s is a necessary homological test for a marked bridge.

For the issued example the prior [explicit disks and filling comparison](FOUR_MARKED_BRIDGE_DISKS.md), SHA-256 prefix 5859f9f3b565, verify both bridges and the actual free outlet. Its outlet calculation uses the two specified slides restoring the local pair and the published joint zero surgery of \(L_{4,1}=Q\cup V_4\). [Gompf–Scharlemann–Thompson, §7, p. 2332](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=28)
