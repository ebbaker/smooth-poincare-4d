# The twin in the roll-spun pretzel transfer

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Exact serving model and reasoning effort were unavailable. This is the fixed source reading attached to `SP4-PSE-B03` in [revision 1](../research-progress/handoffs/FIRST_ASSEMBLY_ISSUE_20261126.md), issued blob `aa97267bec13` at working HEAD `1c81a3048c8c`. The category is smooth and oriented. The evidence is a primary-source reading and an explicit smooth marking from the source isotopy.

## The two closed sides and their twin spheres

Put $K=P(-2,3,7)$, $J_m=\tau^m\rho K\subset S^4$, and $X_m=\Sigma_2(S^4,J_m)$, oriented by the branched covering. The standard side is $X_{18}\cong S^4$ because $J_{18}$ is smoothly unknotted in the positive $18$-twist convention of the cited sources. The target is the Miyazawa homotopy sphere $X_0=\Sigma_2(S^4,\rho K)$. Kuhrman's Theorem 4 changes $18$ to $0$ by the signed Gluck exponent $k=-9$, which gives one nontrivial Gluck mapping class. The smooth recognition of $X_0$ is left open in the checked sources. The twin in $X_m$ is the core $S_m=S^2\times\{0\}$ of the *upstairs* $S^2\times D^2$ piece in decomposition (2). Its normal parametrization is the disk factor. The deck-fixed branch sphere meets the twin at the two poles of that piece. In particular, the unknotted branch sphere on the standard side and the sphere to be twisted there are different embedded spheres. [Kuhrman, §2.2 (2), §2.3, Theorem 4, Corollary 2.9](https://arxiv.org/html/2507.03798v1#S2.SS3) · [Hughes–Kim–Miller, proof of Corollary 1.2 and Question 1.4](https://arxiv.org/html/2402.11706v2#S1) · [Miyazawa, Theorem 4.44](https://arxiv.org/html/2312.02041v1#S4.SS3)

Let $Y=\Sigma_2(S^3,K)$, with deck involution $\iota_K$ and fixed knot $\widetilde K$. With the complex-link orientation on the Brieskorn sphere, $Y\cong -\Sigma(2,3,7)$, as specified by Miyazawa. Kuhrman's use of $\Sigma(2,3,7)$ in §4.3 gives the unoriented identification for this calculation. Fix a point $\tilde x\in\widetilde K$ and a small closed three-ball $B$ at $\tilde x$, taken inside the region on which the lifted twist and roll monodromy $f_m=\tilde\tau^m\tilde\rho$ is the identity. Then the actual retained exterior in $X_m$ is

$$
E_m=\big((Y\setminus\operatorname{int}B)\times[0,1]\big)/((y,1)\sim(f_m(y),0)).
$$

Here $Y\setminus\operatorname{int}B$ is the double cover of the punctured knot ball branched over its proper arc. The time circle is $e^{2\pi it}$. Choose an orientation-preserving chart $\beta$ from a neighborhood of the unit three-ball in $\mathbb R\times\mathbb C$ to the tube of $\widetilde K$, with $\beta(D^3)=B$ and the real coordinate directed along the lifted longitude. The cap $N_m=S^2\times D^2$ is attached by $\kappa_m(u,e^{2\pi it})=[\beta(u),t]_m$. Its inverse sends $[y,t]_m\in\partial E_m$ to $(\beta^{-1}(y),e^{2\pi it})$. Orient $S^2$ as $\partial B$, the cap disk by its complex coordinate, and $E_m$ by the fiber-then-circle orientation. The cap and exterior induced boundary orientations are opposite under $\kappa_m$ because the exterior outward normal points into the removed ball. At the core $S_m$, the real and imaginary directions of the cap disk give the ordered normal frame. [Kuhrman, §§2.1–2.2 and §2.3](https://arxiv.org/html/2507.03798v1#S2) · [Miyazawa, Proposition 4.31](https://arxiv.org/html/2312.02041v1#S4.SS2)

## The common exterior and signed regluing

For $m=0,18$, choose the smooth isotopy $\phi^m_t$ of $Y$ from the identity to $f_m$ in the proof of Theorem 4. In coordinates $(s,w)\in(\mathbb R/2\pi\mathbb Z)\times\mathbb C$ near $\widetilde K$, it is

$$
\phi^m_t(s,w)=(s+2\pi b(|w|)t,e^{i\pi m b(|w|)t}w),
$$

with $b=1$ near the core and $b=0$ outside the tube. Choose $\beta(x_0,z)=(\varepsilon x_0,\varepsilon z)$ in these coordinates, with the ball and a larger collar contained in the $b=1$ region. The mapping-torus trivialization is

$$
L_m([y,t]_m)=(\phi^m_t(y),e^{2\pi it}),\qquad
L_m^{-1}(y,e^{2\pi it})=[(\phi^m_t)^{-1}(y),t]_m.
$$

The angular formula extends to all real $t$ and satisfies $\phi^m_{t+1}=\phi^m_t f_m$, so the trivialization is smooth across the mapping-torus seam. It takes the deleted ball bundle to the same tube for both $m$, since the $m$-dependent rotation preserves the translated ball. Thus both exteriors identify with

$$
E=(Y\times S^1)\setminus\operatorname{int}\nu(\gamma),
\qquad \gamma(t)=((2\pi t,0),e^{2\pi it}).
$$

The angular coordinate $2\pi t$ in the first factor traverses the actual lifted fixed knot once. The two tube markings differ by the rotation of the transported three-ball frame. If $R_\alpha(x_0,z)=(x_0,e^{i\alpha}z)$ on the unit sphere and $T(u,e^{i\theta})=(R_\theta u,e^{i\theta})$, then

$$
a_m=L_m\kappa_m,
\qquad
a_m(u,e^{2\pi it})=(\phi^m_t(\beta(u)),e^{2\pi it}),
\qquad a_m=a_0\circ T^{m/2}.
$$

In the original boundary coordinates on $E_{18}$ and $E_0$, the exterior identification $L_0^{-1}L_{18}$ therefore has boundary map $\kappa_0 T^9\kappa_{18}^{-1}$, with inverse $\kappa_{18}T^{-9}\kappa_0^{-1}$. In the common $E$ coordinates the two closed manifolds and the standard-to-target map are

$$
X_{18}=E\cup_{a_{18}}N_{18},\qquad
X_0=E\cup_{a_{18}\circ T^{-9}}N_0,\qquad
(a_{18}\circ T^{-9})^{-1}=T^9\circ a_{18}^{-1}.
$$

The boundary inverse of $T$ sends $(u,e^{i\theta})$ to $(R_{-\theta}u,e^{i\theta})$. Since $\pi_1(SO(3))=\mathbb Z/2$, $T^{-9}$ can be replaced by $T^{-1}$ or $T$ up to smooth boundary isotopy for the underlying closed smooth type. The literal maps above fix the sign and marking when comparing the two original branched covers. A smooth exterior collar is obtained by substituting $\beta((1+s)u)$ for $\beta(u)$ for small $s\geq0$, and on the cap by using a radial collar of the disk. These coordinates specify a smooth collar map, with the same $T^{-9}$ on its boundary, without introducing a metric. With azimuth $\psi$ increasing along $R_\alpha$, the new cap end pulls back the standard product angular differential to $d\psi-9\,d\theta$. The signed single-twist representative gives $d\psi-d\theta$. [Kuhrman, proof of Theorem 4 and Corollary 2.9](https://arxiv.org/html/2507.03798v1#S2.SS3)

The common exterior also shows that $S_{18}$ is knotted. Removing $\gamma$, of codimension three, preserves the fundamental group by transversality of loops and their homotopies, and the open complement retracts onto $E$. Hence $\pi_1(E)=\pi_1(Y)\times\mathbb Z$. The first factor surjects onto the nonabelian hyperbolic triangle group $\Delta(2,3,7)$. The exterior of the smooth unknotted two-sphere is $D^3\times S^1$, whose group is cyclic. [Kuhrman, §4.1](https://arxiv.org/html/2507.03798v1#S4.SS1)

## Deck symmetry and the missing geometric input

On the mapping torus, the deck involution is induced by $(y,t)\mapsto(\iota_K y,t)$. In the common exterior coordinates it is $\iota_K\times\mathrm{id}$, since $\iota_K(s,w)=(s,-w)$ in the tube and commutes with the isotopy. On the cap it is $(u,z)\mapsto(R_\pi u,z)$, with fixed disks at the two poles. The exact $T^{-9}$ commutes with this action. Kuhrman's Theorem 3 and proof in §4.2 apply to the target deck involution $\delta_0$ of $X_0$. In this example Miyazawa's Theorem 4.32 assigns absolute degree $3$ to $J_0$ and $1$ to $J_{18}$. The obstruction forbids a smooth positive-scalar-curvature metric invariant under $\delta_0$. It also forbids a positive conformal class preserved by $\delta_0$. In a preserved class, $(g+\delta_0^*g)/2$ is an invariant representative, and the unique positive $L^2$-normalized first eigenfunction of its conformal Laplacian is invariant. If its first eigenvalue were positive, this eigenfunction would produce an invariant metric of positive scalar curvature. An invariant retained exterior together with invariant cap and transition metrics would therefore fail the positive Yamabe test under the literal marking. The unconstrained Yamabe sign on $X_0$ lies outside that obstruction. [Kuhrman, Theorem 3 and §4.2](https://arxiv.org/html/2507.03798v1#S4.SS2) · [Miyazawa, Theorems 4.32 and 4.46](https://arxiv.org/html/2312.02041v1#S4)

The cap and exterior identifications supply the smooth data for a transfer. The checked passages give no Riemannian metric in the resulting collar, physical width, or signed exterior and transition costs. The cap chart alone can be given the product metric of a finite disk of any prescribed radius in $\mathbb H^2(-1)$ with $S^2(1)$ by reparametrization. For that exact model through the core, a background in the round conformal class on the standard smooth sphere is impossible. The core is totally geodesic in the product, hence totally umbilic in a round representative, and a closed embedded totally umbilic surface in the round sphere is round and unknotted. The first missing input for the proposed transfer is a nonround background with the matched physical collar and strict budget on the full exterior, together with sign and transition estimates for the closure. Positive $Y(X_0,[g])$ and $E_+(g;X_0)=E_-(g;X_0)<8\pi^2$ remain to be proved on a single assembled conformal class in the branch's Hilbert–Schmidt convention. [Prior assessment of the exact core and proposed transfer](../../../master/reviews/DIRECT_ENTRY_AND_REDUCIBLE_CUT_PRIORITIES_20261126.md#which-other-proposals-merit-a-test)

Sources inspected on 26 November 2026 were Kuhrman, arXiv:2507.03798v1, 4 July 2025, §§2.1–2.3, 4.1–4.3 and §5 at the passages above, Hughes–Kim–Miller, arXiv:2402.11706v2, 20 February 2024, Introduction, and Miyazawa, arXiv:2312.02041v1, 4 December 2023, the cited 4.2–4.3 results. The Teragaito unknotting input, *Twist-Roll Spun Knots*, Proc. Amer. Math. Soc. 122 (1994), 597–599, is used as quoted by Kuhrman and checked against the account in Hughes–Kim–Miller. Teragaito's full text was unavailable in this reading. [Shared receipt](../../../../references/SOURCE_NOTES_DIRECT_ENTRY_20261126.md) · [Teragaito publication record](https://doi.org/10.2307/2161054)
