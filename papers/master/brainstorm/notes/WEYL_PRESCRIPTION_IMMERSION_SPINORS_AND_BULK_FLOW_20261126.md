# Two uses of the twistor estimates and a five-dimensional bulk flow

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The manuscript inputs are at checkout 95a4f50eb9ec. The November 25 review and flow notes supply the starting arguments. The comparison of a radial Weyl variation with bulk dissipation below is a deduction for this brainstorm. The geometric estimates needed to use it are open. [Twistor and chiral-evolution review][review] · [Continuation][next]

Let $M$ be a smooth closed oriented homotopy four-sphere with Riemannian metric $g$. Write $e(g)=E_+(g)=\int_M|W_g^+|_{\rm HS}^2\,dV_g$. The first opportunity asks how far we can reduce this energy on a *fixed smooth type*. The second asks how cheaply one can immerse that type into $\mathbb R^5$. The choice of what moves in five dimensions determines which question a bulk flow can answer.

| Geometry available on the same $M$ | Sufficient condition for $M$ to be diffeomorphic to $S^4$ |
| --- | --- |
| A smooth boundary metric $g$ in a positive Yamabe class | $e(g)\le 4\pi^2$. Positive Yamabe means that some conformal representative has everywhere positive scalar curvature. [Master Proposition 2.1][intrinsic] |
| A conformal class containing $F^*\delta$ for a smooth immersion $F:M\to\mathbb R^5$ with its fixed flat metric $\delta$ | $e(F^*\delta)\le64\pi^2/9$, for any Yamabe sign. The proof uses the Euclidean Gauss equation and the Morse heights of $F$. [Master Theorem 3.1][immersed] |

## Use the exact Weyl prescription to beat the minimizing excess

Set $I=I^+(M)=\inf_{Y([g])>0}e(g)$. Suppose a hypothetical nonstandard $M$ has already entered the strict band $I<8\pi^2$. The master puts $I>4\pi^2+\varepsilon_*$ in this case. One can choose positive reference metrics with a prescribed round ball and energies $e_i\to I$. At each reference a small exterior perturbation preserves its volume form and energy and makes the linearized $W^+$ map onto. In the resulting fixed-volume chart, with the Weyl bundles identified isometrically, the sections manuscript constructs an actual smooth path for some positive duration with

$$
W^+(g_i(t))=(1-t)W^+(g_i(0)),\qquad e(g_i(t))=(1-t)^2e_i .
$$

The mark stays anti-self-dual along the path. Its metric may move. A path starting positive with $e_i<8\pi^2$ stays positive as the energy decreases. [Round marking][mark] · [Exact prescription][prescription] · [Positive-path lemma][wall] · [Master recognition gap][gap]

Write $d_i=e_i-I$ and restrict the radial parameter to $0\le t\le1$. **A single reference would suffice** if its path reached a parameter

$$
t>1-\sqrt{I/e_i}=\frac{d_i}{e_i+\sqrt{e_i I}}.
$$

At such a time the metric would be an admissible competitor below $I$. Equality only spends the excess. The sections manuscript supplies durations $C_i|a|$ or $C_i a^2$ along a small regularizing perturbation of size $|a|$, depending on whether the projection of $W^+$ onto the original adjoint kernel vanishes. Both the constant and the admissible range of $a$ depend on the geometry. The open comparison is with $d_i/(2e_i)$ to leading order. Independent control in the single direction $-W^+$ could suffice. [Radial step-size calculation][step]

There is a geometric reason the step can shrink. If $L_g$ is the linearized Weyl map in this chart, then $L_g^*W_g^+=-B_g/4$, with $B_g$ the Bach tensor. Every radial tangent $L_gh=-W_g^+$ therefore obeys $\int_M\langle B_g,h\rangle\,dV_g=4e(g)$. At a Bach-flat metric with $e>0$ such a tangent is impossible. Nearby, a radial tangent can be very large. On the master's physical charged disk, even a positive amount of Weyl energy on both sides is consistent with an upper bound $C\sqrt{d_i}$ on the absolute Bach pairing for normalized supported tests. The round mark used for prescription and the disk selected for its physical charge serve different purposes. A local application would require the actual disk, its cutoff widths and the cost of matching its complement. [Radial strain][strain] · [Charged disk, Master Theorem 6.4][disk] · [Localized variation bound][core]

## Use the master's immersion to supply the spinor fields

Every smooth homotopy four-sphere admits a smooth immersion $F:M\to\mathbb R^5$. On $g_F=F^*\delta$, restrict an orthonormal basis of four complex parallel ambient spinors, giving fields $\Psi_j$. Their chiral projections $\psi_j^\pm$ satisfy $\sum_j|\psi_j^\pm|^2=2$ at every point. This supplies the joint lower bound needed by the earlier spinor estimates, even where an individual projection vanishes. [Master Theorem 3.1][immersed] · [Bär, Gauduchon and Moroianu, §§3 and 8][spin-gauss]

Let $A$ be the shape operator, $H=\operatorname{tr}A$ and $A^\circ=A-H\,\mathrm{Id}/4$. With the Clifford convention of the review, the spinorial Gauss equation gives $D\Psi_j=-H\Psi_j/2$. For the twistor operator $P_X=\nabla_X+\tfrac14c(X)D$ it follows that

$$
P_X\Psi_j=\tfrac12c(A^\circ X)\Psi_j,\qquad
\sum_{j=1}^4|P\Psi_j|^2=|A^\circ|^2 .
$$

There are two ways to use these fields. The projected derivative identity gives $\sum_j|\Pi_\pm(d^\nabla P\psi_j^\pm)^\pm|^2=|W^\pm|_{\rm HS}^2$, where $\Pi_\pm$ removes the Clifford trace. Alternatively the immersion estimate bounds either chiral energy directly by first derivatives of the full spinor fields,

$$
E_\pm(g_F)\ \le\
\frac16\int_M\left(\sum_j|P\Psi_j|^2\right)^2dV_{g_F}
-\frac89\int_M(-\det A)_+\,dV_{g_F}.
$$

The identity gives a curvature measurement. A saving would come from an **independent upper bound** on one actual immersion. A first test is a framed handle attachment with both matching regions and the retained exterior. Can estimates for the restricted fields control the total on the right to $64\pi^2/9$? On an exact round cylinder only homogeneous incoming Dirac modes have the simple exponential decay. Here $-H\Psi_j/2$ supplies forcing, and the actual attaching metric, the ends and the full complement all carry costs. The master supplies the immersion on every type. Controlling those costs on a candidate type is the missing construction. [Projected derivative identity][curl] · [Integrated shape estimate][shape] · [Marked exterior and its necessary costs][exterior]

## What should move in the five-dimensional space?

**Keep Euclidean space flat and move the immersion.** A normal speed $f\nu$ gives $\dot g=-2f\,\mathrm{II}$ and $\dot e=\int_M f b\,dV_g$, with $b=\langle B_g,\mathrm{II}^\circ\rangle_g$. In the Loewner analogy a pole in the exterior of an embedded hypersurface drives an outward normal velocity through its Poisson kernel. The energy derivative is the harmonic extension of $b$ evaluated at that pole, so its sign depends on the driver. A different choice solves a vector Neumann problem with boundary force $b\nu$ and moves the immersion by the negative boundary value of that harmonic field $V$. On a smooth trajectory, $\dot e=-\int|\nabla V|^2$. An abstract normal collar distinguishes sheets at a self-intersection. A single field on $\mathbb R^5$ gives coincident image points a common velocity and permits cancellation of sheet forces. These variations preserve the immersed recognition threshold. Even when sheets move independently, $b=0$ suffices for stationarity. [Ambient driving and sheet forces][ambient] · [Neumann shape variation][bulk]

**Let the bulk metric move.** On a compact collar $(X^5,G)$ with near face $M$ and a fixed far face, the boundary metric is $g=G|_{TM}$. Every $g$ occurs on the product collar $ds^2+g$. A Green identity realizes the boundary energy as a positive volume integral. Take $-\Delta_G\tau=1$ with zero values on both faces, $q=-\partial_n\tau>0$ on $M$, and harmonically extend $q^{-1/2}W_g^+$ to a tensor $U$ with zero far value. Then

$$
e(g)=\int_X\bigl(|U|^2+2\tau|\nabla U|^2\bigr)\,dV_G .
$$

The field $U$ measures **how much curvature is present**. A different field measures **how fast its energy can fall**. Take the harmonic symmetric tensor $H_B$ with zero far value and outward covariant normal derivative $B_g$ on the near face, extended by zero on normal slots. Evolving by $\dot G=H_B$ gives, on any smooth solution interval,

$$
-\dot e=\tfrac12\int_X|\nabla H_B|^2\,dV_G .
$$

Stationarity now requires the full $B_g=0$. The boundary can leave the Euclidean-induced conformal classes, so the intrinsic recognition criterion is available once positivity and its energy bound hold. The bulk note also constructs a *different*, fixed-smoothing-scale gradient flow for all finite times, with loss $\int_0^t\|\dot Z\|_2^2\,du$ in its own variable $Z$. Existence for the unsmoothed equation, long-time compactness, and sufficient integrated loss remain open. A Bach-flat metric can have Weyl curvature. The product of two equal round two-spheres illustrates this phenomenon on a different topology. [Bulk formulas and both evolutions][bulk]

There is a second way to read the energy in five dimensions. For a Poincaré–Einstein metric normalized by $\mathrm{Ric}=-4G$, the logarithmic volume coefficient on this boundary is $L_{\rm vol}=\pi^2-e(g)/8$. The coefficient is determined by the formal expansion at the boundary. Interpreting it as the volume coefficient of a complete filling requires an actual filling. Holding the boundary conformal class fixed holds $L_{\rm vol}$ fixed. [Graham, §3][graham] · [Fefferman and Graham, Theorem 3.2][fg]

## One calculation joining Weyl prescription to bulk descent

Suppose a radial tangent $h$ exists at a boundary metric of energy $e>0$. Extend it to any symmetric tensor $S$ on the collar with tangential trace $h$ at $M$ and zero far value. The radial pairing and the weak Neumann equation give

$$
4e=\int_M\langle B_g,h\rangle\,dV_g
=\int_X\langle\nabla H_B,\nabla S\rangle\,dV_G,\qquad
-\dot e\ \ge\ \frac{8e^2}{\int_X|\nabla S|^2\,dV_G}.
$$

This is an instantaneous bound for the unsmoothed velocity, including when it is used only as an initial variation. On the product collar of width $w$ one can try the tangential extension $S(x,s)=(1-s/w)h(x)$. Its exact cost at that reference is

$$
\int_X|\nabla S|^2\,dV_G
=w^{-1}\|h\|_{L^2(M,g)}^2+\tfrac{w}{3}\|\nabla^g h\|_{L^2(M,g)}^2 .
$$

This suggests a narrower question than bounding a full curvature inverse. **Can a radial tangent with large pointwise strain still have a cheap bulk extension, for long enough to beat $d_i$?** On a smooth unsmoothed path, if its extensions have cost $C(u)$ while the energy is $e(u)$, a sufficient contradiction test is $\int_0^t 8e(u)^2/C(u)\,du>d_i$ on one positive source. The fixed-scale flow has its own metric on variations and needs its own estimate. The intrinsic entry assumption $I<8\pi^2$ also remains a separate problem. [Radial pairing][strain] · [Weak Neumann identity][bulk] · [Master proof status][status]

### A test on a shrinking round mark

Suppose we are given a smooth positive Bach-flat class of energy $E$ strictly between $4\pi^2$ and $8\pi^2$. Insert the earlier round mark of radius $\rho$ in a fixed smooth representative. Its splice has $|e_\rho-E|=O(\rho^4)$, $\|B_\rho\|_1=O(\rho^2)$ and $\|B_\rho\|_\infty=O(\rho^{-2})$. At each radius the equal-energy regular center can be chosen sufficiently close in $C^4$ to preserve these bounds. Use the original shrinking coordinates and a product collar of *fixed* width $w>0$. [Splice estimates][splice] · [Regular centers and pointwise strain][shrinking]

There is already a restriction on the initial bulk velocity in this example. Interpolation gives $\|B_\rho\|_{8/5}\le\|B_\rho\|_1^{5/8}\|B_\rho\|_\infty^{3/8}=O(\rho^{1/2})$. For every tensor $S$ vanishing on the far face, the five-dimensional trace inequality gives $\|S^\top\|_{L^{8/3}(M)}\le C\|\nabla S\|_{L^2(X)}$. Apply the scalar trace inequality to $|S|$, use $\lvert d\,|S|\rvert\le|\nabla S|$, and use the far Dirichlet value for Poincaré's inequality. The collar metrics are uniformly comparable to a fixed product metric, so $C$ is uniform here. Testing the weak Neumann equation against $H_B$ now gives

$$
-\dot e(0)=\tfrac12\|\nabla H_B\|_2^2
\le C\|B_\rho\|_{8/5}^2\le C'\rho .
$$

Since $e_\rho\to E>0$, the radial pairing then forces **every** extension $S$ of a radial tangent, with zero far value, to cost $\int_X|\nabla S|^2\ge c/\rho$. Allowing a fifth dimension still leaves an increasingly expensive radial direction on this family. These are initial estimates for the unsmoothed velocity on the specified collars. [Five-dimensional trace exponent][trace] · [Bulk Neumann variation][bulk]

**What remains open even in this example?** If the original class attained $I$, returning to it would spend precisely the excess $d_\rho=e_\rho-I$, which is at most $C\rho^4$. The bound on initial dissipation is only an upper bound. A rate proportional to $\rho$ lasting a time proportional to $\rho^3$ would dissipate an amount of order $\rho^4$. The coefficients, persistence time and actual excess would then decide whether the flow merely recovers the cost of the mark. If the original critical class has $E>I$, the excess also contains $E-I$. This example explains why the duration and the geometry away from the mark matter even when the initial variation is explicitly available.

[review]: ../../reviews/TWISTOR_AND_CHIRAL_EVOLUTION_TOOL_REVIEW_20261125.md
[next]: ../../continuation-notes/CONTINUE_TWISTOR_AND_BULK_FLOW_BRAINSTORM_20261126.md
[status]: ../../continuation-notes/AFTER_CORE_VARIATIONS_AND_CHARGED_FLOW_20261125.md
[intrinsic]: ../../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L208
[immersed]: ../../manuscript/immersion_entry.tex#L13
[gap]: ../../manuscript/recognition_gap.tex#L8
[disk]: ../../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L425
[wall]: ../../01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex#L120
[core]: ../../01_fixed_type_variational_descent/manuscript/core_variation.tex#L20
[mark]: ../../../investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L2885
[prescription]: ../../../investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L1190
[step]: ../../../investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L1534
[strain]: ../../../investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3684
[splice]: ../../../investigations-1/03_first_order_twistor/01_sections_and_connections/notes/SEC_E53_20261124.md#L67
[shrinking]: ../../../investigations-1/03_first_order_twistor/01_sections_and_connections/notes/SEC_E53_20261124.md#L259
[curl]: ../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/manuscript/dirac_transmission_on_marked_collars.tex#L254
[shape]: ../../../investigations-1/04_hypersurface_immersions/manuscript/chiral_energy_of_hypersurface_immersions.tex#L189
[exterior]: ../../../investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/notes/E53_RETAINED_EXTERIOR.md
[ambient]: ../../../investigations-1/04_hypersurface_immersions/brainstorm/notes/AMBIENT_HARMONIC_DRIVING_20261125.md
[bulk]: ../../../investigations-1/04_hypersurface_immersions/brainstorm/notes/BULK_BOUNDARY_WEYL_ENERGY_20261125.md
[spin-gauss]: https://arxiv.org/pdf/math/0303095#page=20
[graham]: https://arxiv.org/pdf/math/9909042#page=9
[fg]: https://arxiv.org/pdf/math/0110271#page=8
[trace]: https://sites.math.rutgers.edu/~yyli/Li-Zhu1997.pdf
