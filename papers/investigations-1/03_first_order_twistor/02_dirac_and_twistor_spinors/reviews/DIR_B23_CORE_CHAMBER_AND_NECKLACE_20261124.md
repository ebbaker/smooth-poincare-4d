# The core-and-chamber test, the necklace, and what relative pinching can see

24 November 2026, America/New_York. Prepared for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as the session's configuration records it. Lead assessment of [B23](../brainstorm/notes/DIR_B23_CORE_AND_CHAMBER_20261124.md) and of E48–E50. One model produced the decision, the three packets and this assessment in one session, without helpers and without a second reader, so nothing here is an independent review. The [register](../research-progress/REGISTER.md) links the [issued packets](../research-progress/handoffs/README.md). Inputs are the working tree at HEAD 3fb565b70247a57e4fcc7e65886c57ce0ca0e1ab. [Source records R99–R106](../../../../../references/SOURCE_NOTES_DIRAC_B23_20261124.md)

## What was established

**The proposed gluing does not change the conformal class.** Let $(M,g_0)$ be flat near $p$. Remove a ball of radius $\rho$ at $p$, remove a ball from the round sphere, and glue the collars by an inversion. The result is conformally diffeomorphic to $(M,[g_0])$ for every neck size and relative scale. Its Yamabe constant, its minimizing metrics and their pinching $\epsilon=3\lambda_5/s-1$ are those of $[g_0]$. In a minimizing metric the chamber has volume $O(\rho^4)$, and any function that is constant on the core has Rayleigh quotient at least $c/\rho^2$. More generally a class that agrees with a fixed unit-volume Yamabe metric outside a ball of radius $r$ has Yamabe constant at most $Y+O(r/\log^2(1/r))$. [E48](../notes/DIR_E48_20261124.md)

**Relative pinching tends to zero on $S^1\times S^3$.** For $L>\sqrt2\,\pi$ the unit-volume Yamabe minimizer of $S^1(L)\times S^3$ is the one-period Delaunay metric $g_m=\operatorname{dn}^2(dt^2+g_{S^3})$. It satisfies $s=3\lambda_1$ exactly, because rotation of the circle is a conformal symmetry that the minimizer breaks, and
\[
 \boxed{\quad 0\le\epsilon(g_m)\le\tfrac{15}{16}(1-m)+O\bigl((1-m)^2\log\tfrac1{1-m}\bigr),\qquad
 1-\frac{Y(g_m)}{Y(S^4)}=\tfrac38(1-m)+\dots,\qquad 1-m\sim16e^{-L}.\quad}
\]
The computed $\epsilon/(1-m)$ tends to $0.937500$, so the bound is attained at first order. The five lowest modes have fourth moments within $4.57\,\epsilon$ of $15/7$ and radial $L^2$ error tending to zero, in agreement with the near-equality theorem. Their image comes within $\tfrac12\sqrt{1-m}$ of the origin, $X/|X|$ has degree zero, the Gram defect stays of size $0.207$ in $L^2$, and $\int|{\rm Ric}_0|^2=s^2/12$ throughout. The classification of the constant scalar curvature metrics of this class is Schoen's. [E49](../notes/DIR_E49_20261124.md) · [Computation record](../numerics/README.md)

**The curvature budget.** On a homotopy four-sphere a unit-volume Yamabe metric has $E_+=(Y(S^4)^2-Y^2)/48+\tfrac14\int|{\rm Ric}_0|^2$. The Chang–Gursky–Yang theorem recognizes the standard sphere when $Y>0$ and $\int|{\rm Ric}_0|^2<s^2/12-16\pi^2$; on a general closed four-manifold the threshold is $s^2/12-8\pi^2\chi$ and the necklace and $\mathbb{CP}^2$ sit at equality. For an eigenfunction, $\int|{\rm Hess}_0\phi|^2+\int{\rm Ric}_0(\nabla\phi,\nabla\phi)=\tfrac{s^2}{12}\nu(\nu-1)\int\phi^2$ with $\nu=3\lambda/s$, so pinching bounds this sum and neither term. The exact five-eigenfunction theorem holds at local minimizers of the Yamabe functional, and such a metric, if not round, breaks at most four independent conformal symmetries. [E50](../notes/DIR_E50_20261124.md)

## The four points of the handoff

1. *One gluing profile, and where the minimizer and the low modes sit.* For the flat neck the answer is exact. The minimizer is that of $[g_0]$, a fixed metric on $M$ in which the chamber is a ball of radius comparable to $\rho$. The five chamber modes are not low modes of the minimizer.
2. *Core test against chamber tests.* The Yamabe quotient of a test supported in the core is unchanged by rescaling, and the infimum of such quotients is $Y([g_0])$, strictly below $Y(S^4)$ unless $[g_0]$ is round. The chamber tests approach $Y(S^4)$. The core wins at every scale. The failure the handoff asked to preserve occurs for every non-round input.
3. *What a positive result needs.* Still $s_j>0$ and $3\lambda_5(g_j)/s_j\to1$ on minimizers of classes that must now be found by other means, since no modification inside a small ball of a fixed class helps. Smooth recognition from such a family needs more than the pinching, by the necklace. The integral criterion of E50 is one sufficient addition and replaces the pointwise Ricci bound of [E45](../notes/DIR_E45_20261124.md) by an $L^2$ bound with an explicit threshold, at the price of needing $Y>Y(S^4)/\sqrt2$.
4. *If the gluing test fails.* It does. The alternatives named in the handoff are taken up in the [continuation](../continuation-notes/03_AFTER_CORE_CHAMBER_AND_NECKLACE_20261124.md).

## What relative pinching can recognize

On a general closed four-manifold, nothing topological: $S^1\times S^3$ carries unit-volume Yamabe minimizers with $A(g)/s\to0$. The handle occupies vanishing volume and capacity, the five modes do not see it in law, and the weak Gram estimate tolerates the unit-size $L^2$ defect it causes. The open sentence of the previous assessment, whether pinching alone detects a region of vanishing volume carrying nonstandard geometry, has a negative answer in this generality.

For homotopy spheres the question is open. The example needs a handle, and no simply connected analogue is known to me. What the three packets say about a hypothetical nonstandard homotopy sphere $\Sigma$ is the following. Every Yamabe metric with $Y>0$ on $\Sigma$ has $\int|{\rm Ric}_0|^2\ge s^2/12-16\pi^2$. A pinched family on $\Sigma$ cannot converge in $C^{2,\alpha}$ after diffeomorphisms. If its Yamabe constants tend to $Y(S^4)$, then $\int|{\rm Ric}_0|^2\ge16\pi^2-o(1)$ and $E_+\ge4\pi^2$ along it while the Gram identity of the five modes holds weakly; in the necklace curvature of this size sits in the neck.

## A reduced picture, not proved

This section is heuristic. Its one quantitative test is the necklace.

Near a round sphere of volume one the Yamabe functional is flat along the conformal factors $B_b(y)=\sqrt{1-|b|^2}/(1-b\cdot y)$, $|b|<1$, and for a unit-volume constant scalar curvature metric the second variation along this family is $E(b)-E(0)=\tfrac25s\,(\nu_{\hat b}-1)|b|^2+O(|b|^3)$, where $\nu_{\hat b}=3\lambda/s$ for the mode in the direction $\hat b$. Suppose small defects add interaction terms to the reduced energy $E(b)$: a thin handle joining $p$ and $q$ contributes $-\kappa B_b(p)B_b(q)$, and a small core at $p$ whose scalar-flat blow-up has mass $\mu>0$ contributes $-c\,\mu\,B_b(p)^2$, the term in Schoen's test-function expansion.

*Handle between antipodal points.* $E(b)=Y(S^4)-\kappa(1-|b|^2)/(1-(b\cdot e)^2)$. The axial direction is exactly flat and the transverse directions give $\epsilon=5\kappa/(2s)$, while $1-Y/Y(S^4)=\kappa/Y(S^4)$. The predicted ratio $5/2$ is the ratio $\tfrac{15}{16}:\tfrac38$ computed in E49, and the flat axial direction is the exact eigenvalue $s/3$ found there.

*Cores.* The gradient at $b=0$ is $-2c\sum\mu_ip_i$. A single core is never balanced: positive mass pulls the conformal factor into the core. This is the reduced form of E48, where the class of one core and a chamber is $[g_0]$ and its minimizers live at the scale of the core. A balanced family with inertia matrix $I=\sum\mu_ip_ip_i^{\mathsf T}$ has $E(b)-E(0)=c\bigl(({\rm tr}I)|b|^2-3\,b^{\mathsf T}Ib\bigr)$, which is positive definite exactly when $I<\tfrac13({\rm tr}I)\,{\rm Id}$, and then $A/s\approx1-Y/Y(S^4)$, against twice that for a handle. Such a metric would be a local minimizer only. A test function concentrated in one core has Yamabe quotient equal to the Yamabe constant of that core's own class, which is below $Y(S^4)$ by a margin that does not shrink with the core. Cores can therefore be invisible to pinching at local minimizers, or when their own classes have Yamabe constants tending to $Y(S^4)$, and not otherwise.

*Conjecture.* For unit-volume Yamabe minimizers on closed four-manifolds, $\epsilon\to0$ if and only if $Y\to Y(S^4)$, and $A/s$ is comparable to $1-Y/Y(S^4)$. The evidence is the necklace and the model. Neither implication is proved. For "pinching implies $Y\to Y(S^4)$" the obstacle is specific: every estimate in the near-equality theorem is stated in units of $s$ and controls the Gram matrix of the five modes weakly, whereas a lower bound for $s$ needs their Jacobian in measure. In the exact case the covering argument supplies it and gives $s=Y(S^4)\sqrt{\deg}$. For the converse one needs five soft directions at the minimizer from the near-sharpness of its Sobolev inequality.

If the conjecture holds, three quantities measure the same first-order defect: the spectral gap $A$, the Yamabe deficit $Y(S^4)-Y$, and the mass of the scalar-flat blow-up, which in the normalization of the manuscript's boundary section equals $\tfrac{2}{3\omega_3}\int|\nabla\Psi|^2$ for the harmonic spinor asymptotic to a unit constant. The spectral and the punctured Dirac halves of this investigation would then describe one obstruction.

## The construction problem restated

The spectral route needs conformal classes on the unknown manifold, and E48 shows that they cannot be obtained from one input class by a change confined to a small region. Two facts from the literature bound what is known.

- *Positive scalar curvature.* Surgery in codimension at least three preserves the existence of positive scalar curvature (Gromov–Lawson, Schoen–Yau; R105). A homotopy four-sphere obtained from a connected sum of copies of $S^1\times S^3$ by surgery on circles, which is the homotopy sphere attached to a balanced presentation of the trivial group (R106), therefore carries such a metric. I found no statement that every smooth homotopy four-sphere does.
- *Yamabe invariant.* $\sigma(S^1\times S^3)=\sigma(S^4)$ (Kobayashi, Schoen; R99, R101), and connected sums do not lower it. For surgery on a circle in dimension four Ammann, Dahl and Humbert prove $\sigma(N)\ge\min(\sigma(M),\Lambda_{4,1})$ with $\Lambda_{4,1}>38.9$, against $\sigma(S^4)\approx61.56$ (R103). So the homotopy spheres of the previous item have $\sigma\ge\Lambda_{4,1}$, and whether $\sigma=\sigma(S^4)$ is not known. The same authors record that the corresponding bound for 2-connected four-manifolds is unknown precisely because exotic four-spheres are not excluded.

Under the conjecture above, a pinched family of global minimizers exists on $M$ exactly when $\sigma(M)=\sigma(S^4)$. That is a statement about the Yamabe invariant of homotopy four-spheres which the cited literature leaves open, and by the necklace it would still not recognize the sphere without a further estimate.

## Remaining global gap

Unchanged in substance and sharper in form. There is a recognizing equality on a supplied metric, now also at local minimizers. Relative near equality gives the round joint law and, on general closed four-manifolds, provably nothing more topological. On a homotopy sphere, recognition from a Yamabe metric follows from $\int|{\rm Ric}_0|^2<s^2/12-16\pi^2$, equivalently $E_+<4\pi^2$ in a positive class, and no construction of such a class on an arbitrary homotopy sphere is known. The investigation has not produced a positive Yamabe class on every homotopy four-sphere, a class with Yamabe constant near $Y(S^4)$, or a mechanism by which simple connectivity enters the spectral estimates.

## Evidence and limits

The statements of E48 and E50 are direct proofs with two imported theorems each, named in the notes. E49 combines closed forms, an imported classification and floating-point computation with two methods that agree to $2\times10^{-9}$ and that reproduce on a second machine. The leading coefficient $15/16$ is proved as an upper bound and observed as an equality. Sources were read through a web extraction tool, in one case from a scanned copy with noisy text; the levels are recorded in the source notes. The reduced picture and the conjecture are not results. A single model and session produced everything, so shared blind spots between the decision, the packets and this assessment are possible. The shared conventions and the recognition record SH-E01 were used and not changed. The manuscript was not edited.

## Changes the manuscript would need

Proposed for the author's decision; none was made.

1. A proposition after the near-equality theorem stating the necklace example, with the closed forms and the table of E49, and the sentence that relative pinching does not determine the diffeomorphism type on a general closed four-manifold.
2. In the section on outstanding challenges, replace the description of the chamber-and-core test by the statement of E48, and add the integral criterion of E50 beside the Aubry route.
3. A remark after the spectral theorem that its proof uses the minimizing inequality only to fourth order at the metric, so that it holds at local minimizers, with the bound on broken conformal symmetries as a corollary.
4. Bibliography entries for Schoen's lecture notes, Kobayashi, Chang–Qing–Yang and Ammann–Dahl–Humbert, already added to the shared bibliography file.

## Addendum, 24 November 2026: the manuscript changes were made

At the author's request the same session made the four changes above later on the same day; the [draft history](../DRAFT_HISTORY.md) gives the versions. The necklace is Theorem 10.3 of the manuscript and E48 and the integral criterion are Propositions 10.1, 10.2 and 10.4, in a new Section 10 placed before the outstanding challenges instead of after the near-equality theorem. Local minimizers and broken conformal symmetry are Section 7.3. The reduced picture and the conjecture of this assessment were left out of the manuscript, which states the comparison of $\epsilon$ with $1-Y/Y(S^4)$ as an open question. The [E49 supplement](../notes/DIR_E49_SUPPLEMENT_20261124.md) records three arguments completed on the way, so that the bound $\epsilon\le R(m)-1$ and the identification of the minimizer no longer rest on numerics or on an uninspected source. The assessment above is otherwise unchanged; its sentences that the manuscript was not edited describe the state before this addendum.
