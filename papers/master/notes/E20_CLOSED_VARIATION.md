# E20 · Ricci-direction stability of a closed minimizer

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution for [SP4-MASTER-E20](../research-progress/handoffs/E20_CLOSED_VARIATION.md), under B04. Requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. Clean committed input `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`. The five master TeX files matched the packet's SHA-256 prefixes `c8a9f68da492`, `8b5692f2bcab`, `0c9b1dce4aa6`, `b972bc546624`, and `f93717b0b73c`. All variations concern the same smooth closed manifold after attainment.

## Stationarity and the normalized Ricci direction

Let $M$ be a smooth closed oriented homotopy four-sphere and let $g$ be a smooth unit-volume Yamabe metric in an attained minimizing class for $I^+(M)$. Write $R=Y([g])>0$, $E=\operatorname{Ric}-Rg/4$, and $F=E_+$ with the Hilbert–Schmidt norm on $\Lambda^+$. All tensor contractions and integrals below use $g$ and $dV_g$ unless a different metric is indicated. Use $\Delta=\nabla^i\nabla_i$, and write $(\mathrm{Rm}\cdot h)_{ij}=R_{ikjl}h^{kl}$, with $\mathrm{Rm}\cdot g=\operatorname{Ric}$. Signature gives $8F=\int|W|_{(0,4)}^2\,dV$. The four-dimensional Euler identity gives

$$
 F(g)=8\pi^2+\tfrac14\mathcal F(g),\qquad
 \mathcal F(g)=\int_M (|\operatorname{Ric}|^2-R^2/3)\,dV.
$$

Positive Yamabe sign is open along every smooth metric path through $g$, via the first conformal-Laplacian eigenvalue. Thus $DF_g=0$ and $Q_g=D^2F_g$ is nonnegative on all smooth symmetric tensors. Exact unit-volume normalization of a path preserves its energy. Choosing a Yamabe metric separately in each perturbed conformal class also preserves the energy. These comparisons need no differentiable choice of Yamabe minimizers. The normalized Ricci-flow tangent is $-2E$ at $g$ and has Hessian $4Q_g(E,E)$. [Gursky–Viaclovsky, (1.1)–(1.2), (2.2)–(2.5), (2.8)–(2.9), arXiv v2 mirror](https://citeseerx.ist.psu.edu/document?doi=7580e80330031de8b7399cf9ea10467d6fdf70e0&repid=rep1&type=pdf) · [Master positive path and variation](../manuscript/variational_comparison.tex#L1)

Use the Bach gradient normalization $G=\nabla_{L^2}\mathcal F=4\nabla_{L^2} F$. The cited first variations apply to arbitrary smooth metrics on closed four-manifolds. Subtracting one third of the scalar-square gradient gives

$$
 G=-\Delta E-2\mathrm{Rm}\cdot E+\tfrac13(\nabla^2 R)^0
       +\tfrac R6 E+\tfrac12 |E|^2g,
 \qquad 4Q_g(H,K)=\int_M\langle DG_g[H],K\rangle\,dV_g . \tag{1}
$$

Here $0$ denotes trace-free projection with the current metric. The pairing in (1) uses $G_g=0$, so variation of the measure and inverse-metric pairings contributes zero. On the constant scalar curvature background, $E$ is transverse-traceless by contracted Bianchi. Pairing (1) with $E$ gives the stationary identity

$$
 0=\int_M\bigl(|\nabla E|^2-2\mathrm{Rm}(E,E)+\tfrac R6|E|^2\bigr)\,dV_g,
 \qquad \mathrm{Rm}(H,K)=\langle\mathrm{Rm}\cdot H,K\rangle. \tag{2}
$$

In Weyl variables this is the constant scalar curvature case of Chang–Gursky–Yang's Bach identity. The sign of the first derivative along $-2E$ is therefore fixed at zero. [Chang–Gursky–Yang, Proposition 3.2 and (3.7)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf)

For the derivative with tangent $H=E$, set $A=E^\sharp$, and let $E^2$ denote the symmetric two-tensor associated to $A^2$. The connection variation and the transverse-traceless equation give $\operatorname{Ric}'=-\Delta_L E/2$, with $\Delta_L h=\Delta h+2\mathrm{Rm}\cdot h-\operatorname{Ric}\circ h-h\circ\operatorname{Ric}$. The two products are lowered endomorphism products. Substitution of (1) at $G=0$ gives

$$
 \operatorname{Ric}'=\tfrac R6E+(E^2)^0,
 \qquad R'=-|E|^2,
 \qquad E'=E^2-\tfrac R{12}E,
 \qquad A'=-\tfrac R{12}A,
 \qquad (dV)'=0. \tag{3}
$$

For comparison, a differentiable unit-volume constant-scalar-curvature lift in the same first-order conformal class, with tangent $E+\varphi g$, would require $\int\varphi\,dV_g=0$ and
$(-3\Delta-R)\varphi=|E|^2-\int|E|^2dV_g$. If the mean-zero operator has kernel, solvability requires orthogonality of the right-hand side to it. Whenever a lift exists its Hessian is still $Q_g(E,E)$ by conformal invariance.

## An exact integral sign test

In an orthonormal eigenframe of $A$ at each point write its eigenvalues as $\lambda_i$. Set $T_{ijk}=\nabla_i E_{jk}$ and $C_{ijk}=T_{ijk}-T_{jik}$, the Ricci curl in constant scalar curvature gauge. A necessary condition for the attained minimizer is

$$
\begin{aligned}
0\le 4Q_g(E,E)=\int_M \Big[&\sum_{i,j,k}(\lambda_j+\lambda_k-\lambda_i)T_{ijk}^2
      -\sum_{i,j,k}(\lambda_i+\lambda_j-\lambda_k)C_{ijk}^2\\
 &+\tfrac R6\operatorname{tr}(A^3)+\tfrac13|E|^4\Big]dV_g. \tag{4}
\end{aligned}
$$

The sums are invariant tensor contractions. An eigenframe can be chosen pointwise, including at repeated eigenvalues. Strict negativity of the right-hand side would yield a smooth same-type positive competitor by a sufficiently short perturbation with tangent $E$.

To derive (4), pair $G$ with $E$ at an arbitrary smooth metric and integrate by parts using $\nabla^i E_{ij}=\nabla_j R/4$. The integral is

$$
 \int_M \bigl(|\nabla E|^2-2X+R|E|^2/6-|dR|^2/12\bigr)dV,
 \qquad X=\mathrm{Rm}(E,E).
$$

Differentiate this identity at $g$ with tangent $E$. Since $G_g=0$, the left side differentiates to $4Q_g(E,E)$. Since $dR_g=0$, the last term has zero derivative. Let $L^a_{ij}=(\Gamma^a_{ij})'=\tfrac12(\nabla_i E^a_j+\nabla_j E^a_i-\nabla^a E_{ij})$. Equation (3) gives $(\nabla_i A)'=-R\nabla_i A/12+[L_i,A]$. Differentiating $g^{il}\operatorname{tr}((\nabla_i A)(\nabla_l A))$ gives

$$
 (|\nabla E|^2)'=-\tfrac R6|\nabla E|^2-\sum_{i,j,k}\lambda_i T_{ijk}^2
                 +2\sum_{i,j,k}(\lambda_j-\lambda_k)T_{jik}T_{ijk}.
$$

For the curvature term write $X=R^a{}_{k j l}A^j_a E^{kl}$. The derivative of the mixed curvature is $\nabla_j L^a_{lk}-\nabla_l L^a_{jk}$. Integrating these two terms by parts, the two divergences of $E$ vanish and the remaining contraction is $\sum_{i,j,k}\lambda_i(L^k_{ji}-L^i_{jk})T_{ijk}$. Because $L^k_{ji}-L^i_{jk}=T_{ijk}-T_{kji}$, this gives

$$
 \int_M X'\,dV_g=\int_M\Big[\sum_{i,j,k}\lambda_i(T_{ijk}^2-T_{jik}T_{ijk})
                  -\tfrac R6 X-\mathrm{Rm}(E,E^2)\Big]dV_g.
$$

Using (3), the accumulated $-R/6$ multiple of (2) integrates to zero. The other scalar term from $(R|E|^2/6)'$ is $-|E|^4/6$. Integrating the pairing of $G_g=0$ with $E^2$ eliminates the curvature term through

$$
 2\int_M\mathrm{Rm}(E,E^2)dV_g=\int_M\Big[\sum_{i,j,k}(\lambda_j+\lambda_k)T_{ijk}^2
              +\tfrac R6\operatorname{tr}(A^3)+\tfrac12|E|^4\Big]dV_g.
$$

Finally $2T_{ijk}T_{jik}=T_{ijk}^2+T_{jik}^2-C_{ijk}^2$. Swapping $i,j$ in the symmetric coefficient of the cross term, and $j,k$ in the squared terms using $T_{ijk}=T_{ikj}$, yields (4). As a normalization check on a closed manifold outside the target, the locally conformally flat product $S^2_k\times\Sigma_{-k}$ of constant opposite curvatures has $R=0$, parallel $E$, and $|E|^2=4k^2$. The path $g+tE$ changes the sum of the two sectional curvatures at speed $-2k^2$. Each chiral squared norm in such a product equals the square of the sum divided by six, so direct differentiation gives $Q(E,E)=4k^4\operatorname{Vol}(g)/3$, as in (4).

## Conformal changes and the principal symbol

For any smooth vector field $X$ and function $a$, $Q_g(\mathcal L_Xg+ag,K)=0$ for every $K$. Differentiate the invariance identity $DF_{g'}(\mathcal L_Xg'+ag')=0$ in $g'$ at the critical metric to see why the mixed Hessian vanishes. In particular $\nabla^2u=\mathcal L_{\nabla u}g/2$ is a null direction. The same statement holds in each conformal representative.

For $\widehat g=f^{-2}g$ with $f>0$ smooth, the exact Ricci transformation law gives $\widehat E=E+2f^{-1}(\nabla^2 f)^0$. Here trace-free projection in this formula can be taken with $g$ because the two metrics are conformal. For fixed $f$ the map $g'\mapsto f^{-2}g'$ preserves $F$. Thus, with $[H]$ denoting the tensor modulo conformal and diffeomorphism tangents at $g$,

$$
 [f^2\widehat E]=[f^2E+2f\nabla^2f]=[f^2E-2df\otimes df],\qquad
 Q_{\widehat g}(\widehat E,\widehat E)=Q_g(f^2E-2df\otimes df,f^2E-2df\otimes df). \tag{5}
$$

The middle equality subtracts $\nabla^2(f^2)$. Since $\widehat{\operatorname{Ric}}-\widehat E$ is a trace term, the same equality holds for the unprojected Ricci direction. Constant rescaling by $c=\operatorname{Vol}(\widehat g)^{-1/2}$ gives volume one, preserves the covariant Ricci direction, and multiplies its Hessian by $c^{-2}$. For $f=1+tu$, the representative of the quotient tangent is exactly $E+2tuE+t^2(u^2E-2du\otimes du)$ for sufficiently small $t$. There is a linear reweighting of $E$ and a quadratic gradient term. If $Q_g(E,E)=0$ at a stable point, polarization gives $Q_g(E,K)=0$ for every $K$, so the first possibly nonzero term of the gauge-family Hessian is $4t^2Q_g(uE,uE)$. Stability makes that coefficient nonnegative. Separately, $du\otimes du$ is equivalent in the quotient to $-u\nabla^2u$. This weighted Hessian need not vanish in the quotient.

At a nonzero real covector $\xi$, let $\Pi_\xi H$ denote the orthogonal projection onto trace-free symmetric tensors on $\xi^{\perp}$, extended by zero in the $\xi$ direction. Its kernel consists of $a g+\xi\odot b$, where $a$ is scalar and $b$ is a covector. The symbol of the Hessian operator for $F$ at a Bach-flat metric is

$$
 \sigma_4(Q_g)(\xi)H=\tfrac18|\xi|^4\Pi_\xi H . \tag{6}
$$

Indeed, on the transverse-traceless symbol space, $D\operatorname{Ric}[H]$ has leading symbol $|\xi|^2H/2$, $DR[H]$ has zero principal symbol, and $-\Delta E$ in (1) supplies the remaining $|\xi|^2$ and the positive sign. Invariance gives the symbol kernel, and self-adjointness leaves the image in its orthogonal complement. The coefficient agrees with the leading term of the Einstein-only factorization with $\tau=-1/3$. For a single oscillatory phase of $u$, the leading oscillating tensor of $du\otimes du$ is proportional to $\xi\otimes\xi$ and lies in this kernel. Two independent phases have cross terms at the covectors $\xi\pm\eta$. The restriction of $\xi\odot\eta$ to either perpendicular hyperplane is a nonzero rank-one tensor because their restricted covectors are proportional and nonzero. Its trace-free projection in dimension three is nonzero and has positive symbol energy. Null leading terms leave a lower-order calculation. [Gursky–Viaclovsky, §2.3, (2.59) and Theorem 2.11, and the Einstein comparison in Theorem 3.10](https://citeseerx.ist.psu.edu/document?doi=7580e80330031de8b7399cf9ea10467d6fdf70e0&repid=rep1&type=pdf)

## Remaining closed class

Equation (4) supplies a test in the physical Yamabe gauge and (5) supplies the exact tests after any smooth conformal change. The integrand in (4) has no algebraic strict negative sign. For example, with $T=0$ and $A$ having eigenvalues $(-3a,a,a,a)$ for $a>0$, its algebraic part is $-4Ra^3+48a^4$, which changes sign at $a=R/12$. With the opposite eigenvalues that part is positive. These are algebraic tests of the sign, with no existence claim for metrics realizing those jets globally. The energy band gives integral information. A further global estimate would be needed to force (4) or one of (5) to be negative. The Hessian kernel and positive symbol give no such estimate.

On a hypothetical nonstandard type, the owning closed Bach-flat gap places a nonround attained minimum in $4\pi^2<e=I^+(M)\le 8\pi^2-\delta$. Both chiral blocks have nonzero energy by signature. The non-Einstein class left by these tests consists of such smooth Bach-flat minimizing classes with no Einstein representative. By the owning harmonic-scale theorem, for each chirality a smooth harmonic representative would be Einstein, so at least one of its residual-vanishing and smooth-extension conditions must fail. Neither condition follows here from stability. Within the Einstein class the previous estimate [E05](E05_CLOSED_STABILITY.md) and the established transverse-traceless spectral window remain the relevant restrictions. This calculation proves no closed rigidity or strict descent for the surviving class. [Owning closed gap](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L139) · [Owning harmonic scale result](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex#L780)
