# R01 — Independent replay of the transfer kernel

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance by the R01 reader, dispatched as `gpt-6.2-sol` at ultra. Working-tree baseline `6a422ce7814f`. Inputs were the [frozen R01 request](../research-progress/handoffs/REQUEST_REPLAYS_R1_20261127.md), [proposal §3.2](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md#32-the-transform-and-its-pole-forms) (`091aa015355ef938`), the [second master's conventions](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions) (`08293b2062cfcd324`), and the [B01 decision](../brainstorm/notes/B01_KERNEL.md) (`e8c1089f347455ac`). I computed the flat sign and distributional contact before reading the B01 derivation.

**Disposition.** The flat graph normalization, source density, independence of the oriented normal chart, and orientation-reversed reciprocal adjoint are replayed. The curved identification of the kernel with the A1 solutions is replayed conditional on A1 existence and the stated normal-coordinate remainder. This packet did not assess the proof of A1 or use A2.

## Flat computation from the exact subspace

**Project theorem, replayed.** Use the standard orientation and two-form norm on Euclidean $\mathbb R^4$. Write $\epsilon(\xi)$ for exterior multiplication by a covector and $\iota(\xi)$ for contraction by its metric dual. On the Fourier side at nonzero frequency $\xi$, the orthogonal projection onto the exact subspace is

$$
P_{\mathrm{ex}}(\xi)=|\xi|^{-2}\epsilon(\xi)\iota(\xi).
$$

The splitting into forms with and without a factor $\xi$ is orthogonal, and the Hodge star interchanges the two summands. Thus the reflection $S=2P_{\rm ex}-\mathrm{Id}$ interchanges the chiral spaces and fixes exact forms. Its restriction to the anti-self-dual summand is the graph map $d^-A\mapsto d^+A$. For $R_\xi=\mathrm{Id}-2\xi\otimes\xi/|\xi|^2$, the induced pullback on two-forms is $\mathrm{Id}-2P_{\rm ex}(\xi)$. For example, at $\xi=e^1$ the graph sends $e^{12}-e^{34}$ to $e^{12}+e^{34}$, while $R_\xi^*$ sends it to $-(e^{12}+e^{34})$. The Fourier multiplier of the graph is therefore $-R_\xi^*$ on its input summand.

Use the positive Laplacian $\Delta=d\delta+\delta d=-\sum_i\partial_i^2$ and its Euclidean fundamental solution $G=(4\pi^2)^{-1}|x|^{-2}$. The coefficient follows by integrating the outward flux of $-\nabla G$ over a sphere of area $2\pi^2r^3$. The angular means of the ordinary Hessian away from zero vanish. Integrating once by parts outside the small sphere, with $\partial_jG=-x_j/(2\pi^2r^4)$, gives

$$
 \partial_i\partial_jG
 =\operatorname{pv}\!\left(
      \frac{-2\delta_{ij}|x|^{-4}+8x_i x_j|x|^{-6}}{4\pi^2}
   \right)-\tfrac14\delta_{ij}\delta_0.
$$

Here the contact uses $\int_{S^3} n_i n_j\,dS=(2\pi^2/4)\delta_{ij}$. Since $d\delta G=-\sum_{ij}\epsilon(e^i)\iota(e^j)\partial_i\partial_jG$ and the sum of $\epsilon(e^i)\iota(e^i)$ equals twice the identity on two-forms,

$$
 d\delta G
 =\tfrac12\delta_0\,\mathrm{Id}
   +\pi^{-2}\operatorname{pv}(|x|^{-4}R_x^*),\qquad
 S=\frac{2}{\pi^2}\operatorname{pv}(|x|^{-4}R_x^*).
$$

The delta contact cancels in $S$. Equivalently, for a constant anti-self-dual vector $\eta$, the exact current $2d\delta(G\eta)$ splits into the delta source $\eta\delta_0$ and the principal-value self-dual output. In B01's notation $\delta(G\eta)=\pi^{-2}b$, which independently confirms the positive contact $(\pi^2/2)\eta\delta_0$ in $db$.

## Curved column and reciprocal adjoint

**Project theorem, replayed conditional on A1 for the column.** Let $P_g(\cdot,p)\eta$ have A1's leading term and $O(|y|^{-2})$ remainder. The remainder is closed on the punctured ball and locally integrable. In the distributional derivative the boundary contribution is bounded by $C\rho^3\rho^{-2}=O(\rho)$. Hence

$$
 \operatorname{pv}(P_g(\cdot,p)\eta)+\tfrac{\pi^2}{2}\eta\,\delta_p^g
$$

is closed. The principal-value part is self-dual distributionally because self-duality holds at each cutoff before the limit. Pair this current by wedge against $dB$ with $d^+B=\beta$, for arbitrary smooth self-dual $\beta$. The anti-self-dual contact contributes $-(\pi^2/2)\langle\eta,d^-B(p)\rangle_g$. The remaining term pairs with $\beta$ in the positive inner product, so its value is $(\pi^2/2)\langle\eta,T_o^*\beta(p)\rangle_g$. This fixes the distributional column and gives $K_g^o=(2/\pi^2)P_g$ off the diagonal.

At fixed representative, $T_o$ is unitary by the exact graph and $T_{-o}=T_o^*$ by reversal. Taking the kernel adjoint exchanges source and target and takes the finite-dimensional adjoint in their respective metrics. This gives $K_g^{-o}(p,q)=(K_g^o(q,p))^*$ for distinct points. As an alternative to the moving-source argument of B02, write the full Hodge reflection on two-forms as $S=2d\delta\Delta_g^{-1}-\mathrm{Id}$ using the vanishing harmonic space. Both $\Delta_gT_o$ and $T_o\Delta_g$ are local differential operators, since $d\delta$ and the chiral projections commute with $\Delta_g$. The kernel therefore satisfies the two Hodge Laplace equations away from the diagonal, with the formal adjoint acting on the dual fibre on the source side. Their sum is elliptic on the product, giving joint smoothness there.

## Source density and normal coordinates

**Project theorem, replayed.** With the volume-dependent kernel $K_g(q,p)$, the density-valued kernel is $K_g(q,p)dV_g(p)$. The conformal operator and chiral bundles are fixed, so under $\widehat g=e^{2f}g$, with $a=e^{f(p)}$, the volume-dependent kernel on a fixed source tensor carries factor $a^{-4}$. In the reciprocal identity the adjoint on an unscaled map from the source at $p$ to the target at $q$ acquires $e^{4f(p)-4f(q)}$ by the two inner products. In combination with $a^{-4}$ this gives $e^{-4f(q)}$, the correct factor for the exchanged source. The leading covariant two-form of a fixed output has factor $a^4$. Its numerical components in aligned orthonormal coframes have factor $a^2$.

For a fixed metric normal coordinates from two oriented orthonormal bases differ by a rotation, which commutes with inversion. For $\widehat g=e^{2f}g$, align the orthonormal bases after scaling and set $v=\nabla_g f(p)$ in the old frame. In the old normal coordinates $y$, the new geodesic with initial vector $u$ has endpoint $u-(v\cdot u)u+|u|^2v/2+O(|u|^3)$. This follows from the conformal difference tensor of the two connections and the geodesic equation. Inverting the Taylor map gives the new coordinate $z=a[y+(v\cdot y)y-|y|^2v/2+O(|y|^3)]$. Its squared radius is $a^2|y|^2[1+v\cdot y+O(|y|^2)]$, so inversion cancels the radial quadratic term and gives

$$
 x_{\widehat g}=a^{-1}(x_g-v/2+O(|x_g|^{-1})),\qquad
 D_{x_g}x_{\widehat g}=a^{-1}(\mathrm{Id}+O(|x_g|^{-2})).
$$

The derivative estimate follows by differentiating the smooth Taylor remainders in the punctured normal ball. This preserves the order of the two-form remainder in the inverted coordinates. The derivative contributes twice to a constant two-form, which checks the $a^2$ component relation and hence the $a^4$ covariant relation. The spherical principal values also agree under the new cutoff for a fixed output form. The leading angular mean is zero, so a constant rescaling of the cutoff has zero leading contribution. The nonradial change is contained in a shell of thickness $O(\rho^2)$ where the integrand is $O(\rho^{-4})$, giving $O(\rho)$.

## Primary-source comparison

**Import used.** Donaldson–Sullivan, *Quasiconformal 4-manifolds*, Acta Math. 163 (1989), 181–252, §2(ii), pp. 188–189, (2.9)–(2.14), treats a smooth compact oriented Riemannian homology four-sphere. It gives the smooth coclosed inverse $Q$ of $d^+$ and identifies $d^-Q$ as the order-zero isometry on the opposite chirality. The pointwise conformal-class graph of norm less than one is the separate construction of §2(i), Lemma 2.3. Read the indicated passages in the archived journal text. [Primary PDF](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6436-11511_2006_Article_BF02392736.pdf) · [DOI](https://doi.org/10.1007/BF02392736)

**Primary-source comparison.** Iwaniec–Martin, *Quasiregular mappings in even dimensions*, Acta Math. 170 (1993), 29–81, §8, pp. 55–60, defines $S$ to be the identity on exact forms and minus the identity on coexact forms. Theorem 8.1(vi) gives the two chiral graph identities. The printed (8.7) and Theorem 8.10 give the symbol $R_\xi^*$, and Theorem 8.13 gives its middle-degree principal-value kernel, with constant $-2/\pi^2$ in degree two and dimension four. These formulas correspond to the negative of the §8 graph definition, as the single-frequency test above shows. The review used the archived primary PDF text for all three statements, with a page image for the opening definition. The sign and contact used here come from the independent calculation. [Primary PDF](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6478-11511_2006_Article_BF02392454.pdf) · [DOI](https://doi.org/10.1007/BF02392454)
