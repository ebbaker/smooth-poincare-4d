# SP4-LINE-E05 · Independent replay of the marked cap

27 November 2026, for Edward B. Baker III. OpenAI Codex independent helper. The dispatch used `gpt-6.2-sol` / ultra, as specified in the frozen request. Independent serving metadata were unavailable to the reader. Working tree based on `6a422ce7814f`. Inputs are the [frozen r1 request](../research-progress/handoffs/LINE_E05_REQUEST.md) (Git blob `5e55c8de96ad`), [B01 as read](../notes/LINE_B01_MARKED_CAP.md) (`16629dd8e64c`), the [master conventions](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions) (`7bbeb0970fb1`), and the [proposal](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md#36-the-failure-set) §§3.2–3.6 (`72047744c9a6`).

**Project theorem, independently replayed.** The constant flat input gives the standard complex-oriented $\mathbb{CP}^2$ with its scaled Fubini–Study form and the marked line of square $+1$ and area $\pi R_c^2$. The same cap glues to the stated smooth near-symplectic core, with the marked oriented connected-sum identification. The end estimate and gluing require no change of hypotheses. This is an analytical replay without Lean verification.

## End straightening

Write the smooth closed error on the end as $\beta=dr\wedge\gamma_r+\delta_r$. The metric $dr^2+r^2 g_{S^3}$ gives $|\gamma_r|_{g_{S^3}}=O(r^{-1})$ and $|\delta_r|_{g_{S^3}}=O(1)$ from $|\beta|=O(r^{-2})$. Closedness gives $d_{S^3}\delta_r=0$ and $\partial_r\delta_r=d_{S^3}\gamma_r$. Choose a smooth $u$ with $d_{S^3}u=\delta_{r_0}$, using $H^2(S^3;\mathbb R)=0$. For

\[
b(r)=u+\int_{r_0}^r\gamma_s\,ds
\]

one has $\partial_r b=\gamma_r$ and $d_{S^3}b=\delta_r$, so $db=\beta$ and $|b|_{\mathrm{Eucl}}=O((1+\log r)/r)$. Each integration interval is finite. Smoothness follows from smoothness of $\beta$, with only its zeroth-order bound used in the estimate.

Use a cutoff $\chi$ equal to one for $r\le R$ and zero for $r\ge 2R$, with $|d\chi|=O(R^{-1})$. Then $d(\chi b)=\chi\beta+d\chi\wedge b$ differs from zero by $O((1+\log R)/R^2)$ on the changing annulus. The same bound holds uniformly there for $d((1-t+t\chi)b)$, $0\le t\le1$. Beyond $2R$ the latter is $(1-t)\beta$. For large $R$ the end stays inside the open positive cone about $\omega_0$. The deformation is identical to the input on a neighborhood of every zero and is smooth and closed across the cutoff. The replay uses the decay and transversality as hypotheses.

## Flat quotient, form and orientation

Take $Z=(z_1,z_2,w)\in\mathbb C^3$, $\Omega=d\lambda$ with $\lambda=\tfrac12\operatorname{Im}\sum\bar Z_j\,dZ_j$, and let $T$ generate diagonal rotations with period $2\pi$. Then $\iota_T\Omega=-d(|Z|^2/2)$. The restriction of $\Omega$ to $|Z|=R_c$ is basic and has kernel the orbit direction. The quotient is smoothly $\mathbb{CP}^2$ via $Z\mapsto[Z]$, with $w=0$ descending to $L_\infty$. The section $w=\sqrt{R_c^2-|z|^2}>0$ on the open ball removes the $w$ summand of $\Omega$ and gives exactly $\sum du_j\wedge dv_j$ for $z_j=u_j+i v_j$. Every boundary fiber is a Hopf circle.

With affine coordinate $a=z/w$, use the section $Z=R_c(a,1)/\sqrt{1+|a|^2}$. The real scale contributes no imaginary term to the pulled-back primitive, which is

\[
\frac{R_c^2}{2}\frac{\operatorname{Im}\sum_j\bar a_j\,da_j}{1+|a|^2}.
\]

Its derivative is $(iR_c^2/2)\partial\bar\partial\log(1+|a|^2)$. The same local formula in each projective chart has positive Hermitian Hessian. On an overlap the logarithms differ by the log squared modulus of a nonvanishing holomorphic function, so the forms agree. This gives the smooth extension and its complex orientation on all of the quotient. In the affine coordinate $a$ on $L_\infty$, the density is $R_c^2(1+|a|^2)^{-2}$ for ordinary planar area. Its integral is $2\pi R_c^2\int_0^\infty r(1+r^2)^{-2}\,dr=\pi R_c^2$. The line $Z_3=\epsilon Z_1$, $\epsilon\ne0$, is isotopic to $L_\infty$ through complex lines and meets it transversely at $[0:1:0]$ with local intersection $+1$.

For a positive puncture chart $y$, set $x=y/|y|^2$. Its differential is $|y|^{-2}(I-2\theta\theta^{\mathsf T})$ for $\theta=y/|y|$ and reverses coordinate orientation. A positively self-dual limiting coefficient therefore looks anti-self-dual for the raw $x$ coordinate orientation. Choose $A$ with $A^*\omega_{\rm st}=\omega_0$ and put $z=Ax$. It has negative determinant relative to the raw $x$ and complex $z$ coordinate orientations, so $z$ is a positive chart on the end. In the self-dual case $A$ can be taken as a positive dilation times an orthogonal map of determinant $-1$, since a nonzero Euclidean self-dual form is an equal-scale sum on two orthogonal oriented planes. In the general constant positive case, a linear symplectic identification gives $A$ with the same determinant sign.

## Collar and connected-sum marking

Choose $s$ in the normalized standard region with a two-sided collar and $s<R_c$. On that collar the map to the affine chart is $a=z/\sqrt{R_c^2-|z|^2}$, a smooth diffeomorphism onto an affine annulus. Its pullback agrees with the core form there. The glued form is smooth and closed. The line lies in the cap with its full projective neighborhood. The core zero circles and their first jets are identical under the core inclusion. Their splitting types carry over using the same local data.

For the general linear normalization, the omitted ball in the $y$ chart has boundary $y=b(\theta)\theta$ for $b(\theta)=|A\theta|/s$. It has a smooth coordinate-ball parametrization. Choose $0<\varepsilon<\min b$ and write the radial map as

\[
u\theta\longmapsto u\big(\varepsilon+(b(\theta)-\varepsilon)\chi_0(u)\big)\theta,
\]

where $\chi_0$ increases from zero near $0$ to one near $1$. This map is a positive dilation near the origin, is strictly increasing along each ray and sends $u=1$ to the required boundary. It extends to a collar and stays in the positive chart by taking $s$ large. There $|z|=s/u$ and the affine radial coordinate is $h(s/u)$ with $h(r)=r/\sqrt{R_c^2-r^2}$ increasing. The radial parameter reverses and the angular map is $f(\theta)=A\theta/|A\theta|$ of degree $-1$. The affine ball omitted from the projective side has radius $h(s)$.

To exhibit the marking, write $A=QP$ with $P$ positive symmetric and $Q$ orthogonal of determinant $-1$. Each $P_t=(1-t)I+tP$ is invertible. The map $u\theta\mapsto u QP_{\chi_0(u)}\theta/|P_{\chi_0(u)}\theta|$ is a diffeomorphism of the unit ball, equal to $Q$ near the center and to the conical form of $f$ near the boundary. Equivalently $Q^{-1}f$ extends by an orientation-preserving coordinate reparametrization. The angular marking thus reduces to the orthogonal orientation reversal in an oriented connected sum, with the radial identification given by opposite collar parameters. This establishes $Y\cong M\#\mathbb{CP}^2$ without using a smooth classification of the punctured core.

Van Kampen applied to each ball decomposition and then to the sum gives $\pi_1(Y)=0$. Mayer–Vietoris across $S^3$ gives $H_2(Y;\mathbb Z)=\mathbb Z[L_\infty]$ and $H^2(Y;\mathbb R)=\mathbb R\operatorname{PD}[L_\infty]$. The line square makes the form $(1)$, so $b_1=0$, $b^+=1$, $b^-=0$, and $[\bar\omega]=\pi R_c^2\operatorname{PD}[L_\infty]$. If the form was locally self-dual near the core zeros, the graph construction in B01 preserves its positive planes there and the projective positive planes near the line. Containment of the given form is affine in the graph map and the strict contraction condition is convex, so local choices patch. A smooth metric in the resulting conformal class makes the closed form self-dual and coclosed. For the solely intrinsic near-symplectic hypothesis, the local metric input remains the Perutz passage assigned to E03. A modified closed form that agrees on the marked collar can be restricted to the core and reattached to the same exterior. An unmarked diffeomorphism alone supplies no such collar identification.

## Primary source and corrections

**Import, checked passage.** E. Lerman, *Symplectic cuts*, Math. Res. Lett. **2** (1995), 247–258, DOI `10.4310/MRL.1995.v2.n3.a2`, §1.1 pp. 248–249 and Remarks 1.7–1.8 p. 251, read in the [publisher PDF](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806607578769551362-1806607578769551362-63b7fa632c3a4295584533280cd73de5.pdf) on 27 November 2026. §1.1 gives a smooth cut for a Hamiltonian circle action free at the cutting level. Its lower-side formula uses the diagonal action and $\mu+|w|^2=\epsilon$, adjoins the reduced level to the retained sublevel and identifies the flat lower cut with $\mathbb{CP}^n$. Remark 1.8 allows a separating hypersurface with principal circle null foliation in a symplectic manifold. Here the calculation uses only the symplectic model and the equality on the collar, so it makes no application of the global symplectic theorem to the core with zeros.

Two precision edits for B01 are to make the coordinate-ball and angular extensions explicit as above and to specify that Remark 1.7 gives the associated normal bundle on the exterior side. The positive square on the retained interior side was checked by the projective intersection. This replay terminates at the stated marked cap and its elementary transfers. Existence and generic transversality of pole forms, applicability of later closed-manifold curve or fibration theorems, and removal of the final zero circle lie outside the replayed claim.
