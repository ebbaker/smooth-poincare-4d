# Independent reading of the two product-strip isolations

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded DEF-E03e readback, [assignment 5](../research-progress/handoffs/NATIVE_STRIP_AND_LIFT_READBACKS_20261126.md). The dispatch specifies GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. Working HEAD `19c187ad8dbe936cf165017c753a94add775ebaf`. The [strip note](../01_collar_deformation_and_adapted_coordinates/notes/COUPLED_PRODUCT_STRIP.md) matches the final SHA-256 `3eff51c406318c837ff6363deb280e31380c1125de56089716aa0b8374a9dfa3`. This is an independent analytical recomputation on the prescribed smooth oriented standard four-sphere.

The joined peak is its incoming charge $e<\pi^2/1000$ in each chirality. Both isolated paths reach $8\pi^2$ and each endpoint strip alone has chiral energy greater than $72\pi^2$ in each sign. Positive scalar curvature holds along all three paths, including their crossings. Both complete matched sides retain strictly positive core charge and admit the stated smooth zero-Weyl additions. The bounds, chiral signs and normalization in the frozen note check out. In its quadrature display, the four instances of `,dx` read as the intended differential `\,dx`.

## Curvature and orientation

Write $E_i=(1+q_i f)^{-1/2}e_i$ and $E_0=\partial_x$, with $q=(1,-1,0)$ and $d=1-f^2$. The frame $(E_0,E_1,E_2,E_3)$ is positively oriented. For cyclic $(i,j,k)$ its slice bracket is $[E_j,E_k]=\mu_i E_i$ with $\mu_i=2(1+q_i f)/\sqrt d$. The slice Koszul formula gives $c_{jk}^i=(\mu_i-\mu_j+\mu_k)/2$. The slice curvature of the plane complementary to $E_i$ is therefore

$$
K_i^{\mathrm{slice}}=-c_{jk}^i c_{ki}^j+\mu_i c_{ij}^k
=\frac{(\mu_j-\mu_k)^2}{4}
  +\frac{\mu_i(\mu_j+\mu_k)}2-\frac{3\mu_i^2}{4}.
$$

This gives the slice Ricci $r_i=K_j^{\mathrm{slice}}+K_k^{\mathrm{slice}}$ in the note. The second fundamental form in the slice orthonormal frame is diagonal with $k_i=(1+q_if)'/[2(1+q_if)]$. Since $\nabla_{E_i}E_0=k_i E_i$ and $\nabla_{E_0}E_i=0$, the sectional entries are $N_i=-k_i'-k_i^2$ and $T_i=K_i^{\mathrm{slice}}-k_jk_k$. For the mixed entry use the convention $\langle\mathcal R(X\wedge Y),Z\wedge W\rangle=\langle R(X,Y)W,Z\rangle$. Computing $\langle R(E_j,E_k)E_i,E_0\rangle$ gives $-c_{ki}^j k_j-c_{jk}^i k_k+\mu_i k_i$ in that order. Hence it is $M_i$ as stated and $\sum_iM_i=0$ by cancellation of the $k_i$ coefficients. Independent rotations by $\pi$ about each principal axis force the three real two-form pairs to be invariant blocks.

Hodge duality takes $E^0\wedge E^i$ to $E^j\wedge E^k$ for these cyclic indices. After projection on the corresponding normalized basis of chirality $\sigma$, the curvature entry is $(N_i+T_i)/2+\sigma M_i$. Subtracting $R/12$ with $R=2\sum_i(N_i+T_i)$ gives (1). The angular integration factor is $2\pi^2\sqrt d$, and no ordered-tensor factor survives in the Hilbert–Schmidt energy. At first order the explicit curvatures below give $T_i=1-4q_i f+O((|f|+|f'|)^2)$, $N_i=-q_i f''/2$ to first order, and $M_i=3q_i f'/2$ to first order. Thus the linear Weyl entry is $q_i(-f''/4-2f+\sigma\,3f'/2)$ with the same orientation and signs. [Manuscript conventions, §1](../01_collar_deformation_and_adapted_coordinates/manuscript/deformation_of_marked_spherical_collars.tex)

## Finite curvature and scalar bounds

With $d=1-f^2$ the three slice curvatures are $(1-4f-4f^2)/d$, $(1+4f-4f^2)/d$ and $(1+4f^2)/d$. On $|f|\le1/2$, each differs from one by at most $9|f|$. On this range $\ell_i=1+q_if\ge1/2$, so $|k_i|\le|f'|$, $|N_i+q_i f''/2|\le|ff''|+(f')^2$, and the bound $|\mu_i|<3.5$ gives $|M_i|\le14|f'|$. For a three-component vector the half trace-free projection has componentwise norm at most $2/3$ in the uniform norm. The density multipliers obey $d^{1/4}\le1$ and $1-d^{1/4}\le f^2$. Applying this to the linear term $-q_i f''/4$ costs at most $|ff''|/8$ on the stated range. The combined componentwise bound fits each constant in (3):

$$
|d^{1/4}W_i^\sigma+q_i f''/4|
\le2|ff''|+2(f')^2+9|f|+16|f'|.
$$

The scalar contraction alternatively gives $R=R_{\mathrm{slice}}-2H'-H^2-\sum_i k_i^2$. Here $R_{\mathrm{slice}}=6-2f^2/d$, $H=-ff'/d$, and $\sum_i k_i^2=(1+f^2)(f')^2/(2d^2)$. Substitution gives (2) with the positive coefficient $(3+f^2)/(2d^2)$ of $(f')^2$. On $[1/4,3/4]$ the bump $P$ is at least $e^{-16/3}$, and on its support the substitution $u=1/[r(1-r)]\ge4$ gives $|P'|\le u^2e^{-u}\le16e^{-4}$. This verifies the two bounds for $\Theta$ and the stated profile derivative bounds after rescaling. On the isolated connector $|ff''|\le1152w=1.152\cdot10^{-5}$, and on the two cores $|ff''|\le8192\cdot10^{-12}$. The bridge away from the connector has smaller bounds. Since $d\ge3/4$, the estimate $R\ge6-\frac83(f^2+|ff''|)>5$ holds on the full product chart for every time.

Off the support, the common background conformal factor gives $R=6\phi^{-2}(1-v^2+v')$. On the transition $3\le |x|\le4$, $v'\ge0$, $v\le\tanh(1)$ and $\phi\le1$. Beyond it, $\phi=C\operatorname{sech}(|x|-3)$ with $C\le\cosh(1)$. The radial substitution $\rho=e^{-(|x|-3)}$ gives the round polar expression $4C^2(d\rho^2+\rho^2\gamma)/(1+\rho^2)^2$. This yields smooth positive-scalar pole germs. At $h_1$ the product germ extends across the marked seam on both sides. An opposite unperturbed half therefore attaches smoothly with the identity angular map, reversing the induced boundary orientation as the two normals are opposite. Its positive scalar and zero Weyl are exact. This cap is used on the two matched sides of $h_1$. Each isolated path is itself a smooth closed sphere throughout.

## Complete energies at the fixed width

On the four metrics, the ordered data $(u_L,G,u_R)$ for the bridge off the left strip, the strip, and the right bridge are

| Metric | $(u_L,G,u_R)$ |
| --- | --- |
| $g$ | $(a,1,a)$ |
| $h_s$ | $((1-s)a,1-s,(1-s)a)$ |
| $p_s$ | $((1-s)a,1-s+s\eta,a)$ |
| $q_s$ | $(a,1-s\eta,(1-s)a)$ |

The core metrics are fixed and all the remaining regions are conformally flat. In each row the complete disk cost is $C_{L,\sigma}+L_\sigma(u_L)+S_\sigma[G]$ and the complete exterior cost is $C_{R,\sigma}+U_\sigma(u_R)$. This verifies the full-side ledger and the affine isolation formulas in the $x$-coordinate, which is Gaussian at the same prescribed strip of width $w$. Each core has a constant open plateau, where $f=b_j\ne0$, $M_i=N_i=0$, and $W_1^\sigma-W_2^\sigma=(T_1-T_2)/2=-4f/d$. This proves both core charges strictly positive in both signs. Reflection about a core center, and separately reflection about the bridge center, fixes the even terms and negates $M_i$, so each full core and the full bridge have equal chiral charges.

At bridge amplitude $u$, the full bridge energy $F(u)$ has leading coefficient $F_2\ge16\pi^2$ from the width-one unit plateau. For complex $|z|\le1/4$ the expression is holomorphic using the branch of $\sqrt{1-(zB)^2}$ with value one at zero. Here $|f'|\le4$, $|f''|\le128$, $|\ell_i|\ge3/4$, $|\mu_i|<3$ and $|k_i|\le8/3$. The formulas give $|N_i|\le 128/(3/2)+64/9$, $|r_i|\le22.5$, $|T_i|\le 33.75+64/9$, and $|M_i|\le32$. Even using the unit uniform bound for the half trace-free projection gives $|W_i^\sigma|<200$. Thus $|F(z)|\le 480000\sqrt{17/16}\,\pi^2<5\cdot10^5\pi^2$. The differentiated Cauchy tail is at most

$$
64(5\cdot10^5\pi^2)u^2\sum_{j\ge0}(j+3)(4u)^j
<256(5\cdot10^5\pi^2)u^2\qquad(0<u\le10^{-12}).
$$

This is smaller than $2F_2u$, so $F$ is strictly increasing up to $a$. Equation (3) bounds each weighted chiral entry by $0.004$ on the cores and by $10^{-9}$ on the joined bridge. The total length of the core supports is one and the bridge support length is two. Their contribution is therefore less than $2\pi^2\cdot3[(0.004)^2+2\cdot10^{-18}]<\pi^2/1000$. The full joined peak is $e$, and the decrease to $h_1$ is strict.

On an isolated connector multiply the Weyl entries by $\sqrt w\,d^{1/4}$. The leading entries for $p_s,q_s$ are respectively $-s q_i\eta''/4$ and $+s q_i\eta''/4$, since $a=w^{3/2}$. By (3) the error in each entry is at most $3456w^{3/2}+9w^2+384w<10^{-5}$ at $w=10^{-8}$. Thus $\sqrt{E/(2\pi^2)}$ for either whole isolated strip differs from $s\sqrt{2\int(\eta'')^2}/4$ by less than $\sqrt3\cdot10^{-5}$. Integration by parts gives $\int_0^1(1/2-r)\Theta''\,dr=1$, and the squared $L^2$ norm of $1/2-r$ is $1/12$. Rescaling the resulting $\int(\Theta'')^2\ge12$ inequality to the middle third gives $\int(\eta'')^2\ge324$. At $s=1$ the resulting lower bound on the norm exceeds six. This verifies both endpoint strip costs greater than $72\pi^2$ in both signs. The incoming strip costs less than $e$, and the matched strip costs zero. Therefore $R_\sigma(1)>72\pi^2$ and $J_\sigma(1)>143\pi^2$. Each isolated closed path crosses $8\pi^2$ by continuity. At a first crossing of either one, the sum identity and nonnegativity of the other whole path energy give $J_\sigma(s_*)\ge8\pi^2-e-E_\sigma(h_{s_*})>(8-2/1000)\pi^2$.

For the quadratic interaction, set $U=-\eta''/(4w^2)-2\eta+\sigma\,3\eta'/(2w)$ in scaled strip coordinates. Applying the linear Weyl operator to each profile yields the combined quadratic contribution $8\pi^2a^2ws^2\int_0^1(U^2+2U)\,dr$. The cross term $\int\eta\,\eta''=-\int(\eta')^2$ changes the first-derivative coefficient from $9/(4w^2)$ to $5/(4w^2)$. The odd chiral terms vanish by $\eta'(0)=\eta'(1)=0$ and $\int\eta\eta'=1/2$. This recovers all three coefficients in the note. The exact interaction and its first $s$ derivative vanish at $s=0$, and the analytic amplitude remainder has bounded $s$ derivatives through order two at fixed $w$, giving $O_w(a^3s^2)$. Closed signature applied to the four full totals gives $J_+=J_-$ exactly, separately from the quadratic check. [Isolation identities](../01_collar_deformation_and_adapted_coordinates/notes/ISOLATING_A_COUPLED_PATH.md)

The control establishes the isolation effect at one supplied width on the standard sphere. Extension to the physical E61 marking would require its own path and both isolated prices. The source note supplies neither a Yamabe-minimizing representative for this control nor a finite fit on E61.

The dispatch SHA-256 begins `95d3fa9fb50c2ba5`, the checked isolation note `c5ce2a1b550fe8f6`, and the deformation manuscript `2575660c6240b615`. The computations above use exact inequalities and the prescribed decimal amplitudes.
