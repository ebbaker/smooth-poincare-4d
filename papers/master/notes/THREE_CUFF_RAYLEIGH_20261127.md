# A scalar upper bound for the fixed three-cuff Neumann test

27 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E calculation under master B02. Actual serving model and reasoning effort were unavailable. Intake `48f36794f9b1`. The [07 direct trial], [band exchange], [first-jet identity] and [harmonic enclosure] had working blob prefixes `e999229fcdf9`, `03f618c377cf`, `ddb5b8b7a6bd` and `f103fccfd777`. The metric is the unchanged smooth Riemannian long-cuff trial with $L=2\operatorname{arcosh}5$, switching width $1/16$ and cap radius one. The test uses the common compact domain after both marked surgeries and before the three funnel additions.

Harmonicity makes the scalar curvature on each actual band a strictly concave quadratic in the four independent planar connection components wherever the switch is changing. Maximizing that quadratic gives a pointwise upper bound using the values of $q_L$, the fixed marking and the switch. The existing uniform bound on the harmonic Hessian improves the estimate near both ends. A certified negative integral with this potential would settle the Neumann sign. The available broad metric enclosures have yet to give a certified negative integral.

## Dependence on the harmonic connection

Work in the actual exterior coordinates $x^1,x^2,\phi,\theta$ on one band, with $x=(x^1,x^2)$ the planar coordinate. These coordinates are available because the inverse marked tube map recovers longitude, displacements and latitude. Write $q=q_L$ and $B=q+d\phi^2+\sin^2\phi\,d\theta^2$. With the actual longitude path $\bar c(\theta)$ and latitude $\phi_i$, put

\[
 \xi=16(x^1-\bar c^1(\theta),x^2-\bar c^2(\theta),\phi-\phi_i),
 \qquad r=|\xi|,\qquad s=r-1.
\]

In these coordinates $A=(1-r^{-2})dr^2+r^{-2}|d\xi|^2+\sinh^2r\,d\theta^2$. Put $a=H(16s-1)$, $\alpha=1-a$ and $G=\alpha A+aB$. The identity map from the original planar conformal structure to $q$ is harmonic because the target metric pulls back under its harmonic marking and harmonicity is conformally invariant in domain dimension two. Thus the planar Christoffel symbols satisfy $\Gamma^q_{11}+\Gamma^q_{22}=0$, as planar vectors. Write the only free entries as

\[
 \Gamma^q_{11}=u,\qquad \Gamma^q_{12}=v,\qquad \Gamma^q_{22}=-u.
\]

All first derivatives of $q$ at the point are $\partial_k q_{ij}=q(\Gamma^q_{ki},\partial_j)+q(\partial_i,\Gamma^q_{kj})$. The curvature of $q$ is $-1$ for the first-jet identity, independently of the variables $u,v$. [Wolf, p. 449 and §3, harmonic marking of the hyperbolic metric](https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf#page=6)

Let $F(u,v)$ be the scalar obtained by inserting the above first derivatives and the exact end curvatures into the [first-jet identity] and contracting with $G^{il}G^{jk}$. When $u,v$ are the actual symbols, $F=R_G$. The construction defines a polynomial even for synthetic $u,v$, for which it is only an algebraic evaluation. Let $M=(G^{ab})_{a,b=1}^2$ be the planar principal block of $G^{-1}$, and let $W_P$ be the planar restriction of

\[
 W=aB-a^2 B G^{-1} B
   =\big[(\alpha A)^{-1}+(aB)^{-1}\big]^{-1} .
\]

Both blocks are positive definite for $0<a<1$. Write $F_0=F(0,0)$. The covectors $\ell_u,\ell_v$ are the linear coefficients of $F$. For example $\ell_u(e)=[F(e,0)-F(-e,0)]/2$, with the same expression in the second variable for $\ell_v$. Then

\[
 F(u,v)=F_0+\ell_u(u)+\ell_v(v)
  -2\det M\,[W_P(u,u)+W_P(v,v)] .
 \tag{1}
\]

To check the quadratic term, let $S_{ab}=\Gamma^q_{ab}$ be the planar-output array, extended by zero in all other slots. In the first-jet identity, the differentiated-switch term is affine in $S$. The $S$-dependent part of the first-kind Christoffel symbol of $G$ is $a B S$. The quadratic connection difference is therefore contracted using $a^2 B G^{-1}B-aB=-W$. With $R_{ijji}$ positive on the round sphere, contracting its scalar gives $W_P(\operatorname{tr}_M S,\operatorname{tr}_M S)-|S|^2_{M,W_P}$. For each scalar component of $S$ in a $W_P$-orthonormal basis, the contraction is $2\det M\det(S_{ab})$. Each component matrix has trace zero in the Euclidean planar coordinates, so its determinant is minus its diagonal entry squared minus its off-diagonal entry squared. Summing the two components yields (1). A numerical algebra check on 150 synthetic positive-metric jets reproduced (1) to an absolute difference below $3\times10^{-12}$. The contraction argument provides the exact identity.

## A potential using only values of $q_L$

Completing both squares gives the upper bound

\[
 R_G\le F_0+\frac{\ell_u^\top W_P^{-1}\ell_u+\ell_v^\top W_P^{-1}\ell_v}{8\det M}.
 \tag{2}
\]

At a fixed metric value this is the maximum over all trace-free planar connections. The actual connection also satisfies $2[q(u,u)+q(v,v)]<360^2$ by the [harmonic enclosure]. Indeed $dh_L(\Gamma^q_{ab})=(\nabla dh_L)_{ab}$ in the Euclidean source chart. Cauchy–Schwarz gives the additional upper bound

\[
 R_G\le F_0+\frac{360}{\sqrt2}
        \sqrt{\ell_u^\top q^{-1}\ell_u+\ell_v^\top q^{-1}\ell_v} .
 \tag{3}
\]

Use the smaller of (2) and (3) as the potential $P$. At $a=0$ or $1$ the step has vanishing jets and $R_G=0$, so set $P=0$. For the fixed smooth positive $q$, $F_0$ and both linear coefficients go to zero there uniformly in the slice, by the first-jet identity and the scalar-flat ends. Formula (3) then also gives a continuous bound through the end faces. It retains the known negative outer layer: as $a\to1$, the covectors are $O(1-a+|a'|)$ in the $q^{-1}$ norm. The $a''$ term is independent of $u,v$; its coefficient is $-N^{-2}\operatorname{tr}(h^{-1}\partial_a h)>0$ there, with the strict estimate in the [band exchange]. Since $1-a,|a'|,(a')^2=o(|a''|)$ and $a''<0$, the right-hand side of (3) is strictly negative sufficiently near the outer face. This argument uses the actual harmonic map bound and applies at the physical width.

For any radial $\chi(s)$, extend by the corresponding constant through each cap and through the common retained exterior. Copy the profile to the second band using the isometric exchange. The extensions are $H^1$ on the compact three-cuff core $V$, with zero outward mean curvature at all cuffs. Using $d\mu=d\theta\,dA_\sigma$, $dA_h=J\,d\mu$ and the positive lapse $N=|ds|_G^{-1}$, this test gives

\[
 Q_V(f)\le 2\int_0^{1/8}\!\int_{S^1\times S^2}
      \left(6N^{-2}|\chi'|^2+P\chi^2\right) NJ\,d\mu\,ds.
\]

These coefficients require a quantitatively positive $q_L$ enclosure where inverse factors occur. An especially simple first test integrates $P$ on one band, using $\chi=1$. A strict negative upper bound decides the three-cuff Neumann sign and the sign of the reflected double. For the original closed class the radial test has the additional term $144L\,\chi(1/8)^2$. This sign calculation is independent of the two chiral curvature integrals. [Constant extensions and cuff multipliers][band exchange]

## From a position certificate to metric values

The position enclosure in the [harmonic enclosure] can support the scalar test without differentiating an approximate marking. Suppose the exact lift $U$ and a proposed approximate lift $U_0$ obey $d(U,U_0)\le \eta$, with the same lifts over straight planar segments. For a unit planar vector $e$, set $D_h=d(U_0(z),U_0(z+he))/h$. If $|\nabla dU|\le B_2$ and $|dU|^2\le B_1$ on the segment, then

\[
 \left|\sqrt{q_z(e,e)}-D_h\right|
 \le \frac{(B_2+B_1)h}{2}+\frac{2\eta}{h} .
 \tag{4}
\]

The upper estimate for the exact displacement uses the length of the image segment and the acceleration bound $B_2$. For the lower estimate take the signed distance to the target geodesic through $U(z)$ perpendicular to $dU_z(e)$, with the sign chosen to make the initial derivative positive. The signed distance is $1$-Lipschitz and has Hessian norm at most $1$ by the hyperbolic Fermi metric $d\rho^2+\cosh^2\rho\,dt^2$. Its composition with $U$ has second derivative bounded by $B_2+B_1$. The zero-velocity case follows directly from nonnegativity of distance and the length upper bound. The position errors at the two endpoints contribute $2\eta/h$. Squaring the nonnegative stretch intervals in directions $e_1,e_2,(e_1+e_2)/\sqrt2$ and polarizing gives intervals for all three entries of $q_z$. This requires resolved position data at the indicated separation and can be applied uniformly over planar cells if those data are bounded there.

One choice valid for every native footprint point is $B_1=30$, $B_2=400$ and $0<h\le1/64$. In the $1/64$-neighborhood of a footprint the disk argument of the [harmonic enclosure] applies with the radius $87/128-1/64$. This gives $|dU|^2<30$ at each such point and $E<53$ on its $2/12$ disk for the Hessian argument. In detail $2(127/50)^2/(87/128-1/64-2/12)^2<53$. The three-ball mean estimate uses $e^{\sqrt{12\cdot53}/12}<9$, $\log 2>2/3$ and the same disk radius $1/12$, giving $|\nabla dU|^2<154548<400^2$. The smaller radius ensures the same target distance enclosure by meeting at most one seam. It suffices to evaluate (4) at any certified $h$ in this range. No approximate marking with such a position certificate or rigorous quadrature of the resulting potential is supplied here. The Neumann and original closed signs remain open. The independent [Weyl calculation](../reviews/NATIVE_TRIAL_INTEGRATION_20261127.md) proves the shared cost exceeds the width-$1/16$ entry budget.

[07 direct trial]: ../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md
[band exchange]: FIXED_WIDTH_BAND_TEST_20261127.md
[first-jet identity]: FIRST_JETS_FOR_BOTH_BAND_COSTS_20261127.md
[harmonic enclosure]: HARMONIC_MARKING_ENCLOSURE_20261127.md
