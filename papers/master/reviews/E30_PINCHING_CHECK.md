# SP4-MASTER-E30 · Independent coupled recognition check

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E review. Requested GPT-6.2 Sol/ultra. Actual serving variant and reasoning effort are unavailable. Master input b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a with main TeX SHA-256 prefix c8a9f68da492. The verified E23 SHA-256 is e1e3245bd95e40a4c4a63ace2f7cf41a02be44fc50773fdc4294a1a14e028b06. The calculation uses the E26 height implication at its strict threshold. [Frozen request](../research-progress/handoffs/E30_PINCHING_CHECK.md) · [E23](../notes/E23_IMMERSION_ENTRY.md) · [E26](E26_FOUR_CRITICAL_HEIGHTS.md)

For a smooth immersion of a closed oriented homotopy four-sphere into $\mathbb R^5$, set $P=\|A^\circ\|_{L^4(g)}^2$, with $g$ the induced Riemannian metric. The coupled estimates give the inclusive sufficient bounds $P\le16\sqrt2\,\pi/3$ for entry and $P\le2\sqrt{86}\,\pi/3$ for smooth recognition. Entry refers to the existence of a positive conformal class with $E_+<8\pi^2$. On a hypothetical nonstandard type satisfying the first bound the immersion supplies that class itself, with $E_+\le64\pi^2/9$.

## Sharp determinant deficit

Use a global unit normal and write $A^\circ=A-\tfrac14 H\operatorname{Id}$ with trace mean curvature $H=\operatorname{tr}A$. Chiral Weyl energy uses the real Hilbert–Schmidt operator norm on $\Lambda^+$. All volume integrals are on the smooth domain, including each sheet of an immersion at an overlap. Put $j=(-\det A)_+$ and $J=\int_M j\,dV_g$. Reversal of the normal preserves the determinant in dimension four.

For principal data $k_1,\dots,k_4$, set

$$
(x,y,w)=\tfrac12(k_1+k_2-k_3-k_4,\ k_1-k_2+k_3-k_4,\ k_1-k_2-k_3+k_4),\qquad N=x^2+y^2+w^2.
$$

Then $|A^\circ|^2=N$. The Euclidean Gauss equation gives the chiral curvature-operator block with entries $\tfrac12(k_1k_2+k_3k_4)$ and its pair permutations. Subtracting the scalar term $R/12$ gives Weyl eigenvalues $\tfrac12(x^2-N/3)$, $\tfrac12(y^2-N/3)$, $\tfrac12(w^2-N/3)$. Hence

$$
D=\tfrac16|A^\circ|^4-|W^+|_{\mathrm{HS}}^2
=\tfrac12(x^2y^2+x^2w^2+y^2w^2).
$$

If $\det A<0$, reverse the unit normal if needed to arrange one negative and three positive curvatures. Order the positive ones, and divide by the positive sum of the negative magnitude and the smallest positive curvature. Both sides of the proposed estimate are homogeneous of degree four, so the normalized data are

$$
(k_1,k_2,k_3,k_4)=(-s,1-s,1-s+v,1-s+v+u),\qquad 0<s<1,\quad u,v\ge0 .
$$

With $z=1+2v+u$ and $b=1-2s$, the trace-free variables become $(x,y,w)=\tfrac12(-z,-(1+u),u-1)$. Direct substitution yields

$$
32D=2z^2(1+u^2)+(1-u^2)^2
=2z^2+1+u^2(2z^2-2+u^2)\ge 2z^2+1 .
$$

The determinant identity and weighted Cauchy–Schwarz yield

$$
\begin{aligned}
16j&=(1-b^2)((z+b)^2-u^2) \\
&\le (1-b^2)(2z^2+1)(1/2+b^2)\\
&=(2z^2+1)\big[9/16-(b^2-1/4)^2\big]
\le \tfrac9{16}(2z^2+1).
\end{aligned}
$$

Thus $D\ge(8/9)j$. For equality when $j>0$, the first bound gives $u=0$, Cauchy–Schwarz gives $2zb=1$, and the last bound gives $b^2=1/4$. Hence $b=1/2$, $z=1$, $v=0$, and $s=1/4$. This is the tuple $(-1,3,3,3)$ up to positive dilation, permutation and normal reversal. On that tuple $|A^\circ|^2=12$, the chiral Weyl block vanishes, $D=24$ and $j=27$. Such principal data are realized at a tangent point of a quadratic Euclidean graph. For $\det A\ge0$ the deficit formula gives the full estimate with $j=0$, with equality exactly when at most one of $x,y,w$ is nonzero. This verifies sharpness of the pointwise coefficient. Integration gives

$$
E_+(g)+\tfrac89J\le \tfrac16P^2. \tag{1}
$$

## Yamabe sign at the inclusive endpoint

Taking the linear inclusion into $\mathbb R^6$ adds a normal direction with zero second fundamental form. The Brendle constant on the closed four-dimensional source is $4\omega_4^{1/4}$, with $\omega_4=\operatorname{Vol}(B^4)=\pi^2/2$ and the vector mean curvature the trace of the second fundamental form. The inequality in Corollary 2 extends to the immersed domain by its proof. The compact-domain divergence equation and the contact condition are intrinsic to that domain. In §2, Lemma 4 obtains coverage by minimizing the auxiliary function minus the ambient linear function on the whole domain. Lemmas 5–6 compute the determinant in local tangent and normal frames. The following shell estimate uses the area formula with coverage, so coincident sheets contribute multiplicity on the correct side of the inequality. In codimension two the shell bound gives the stated constant. [Brendle, JAMS 34 (2021), pp. 595–603, Corollary 2 and §2, Lemmas 4–6](https://par.nsf.gov/servlets/purl/10232897)

For a smooth real test $f$ use the weight $|f|^3$ by approximation. The inequality and Cauchy–Schwarz give

$$
4\omega_4^{1/4}\|f\|_4^3
\le\int_M |f|^2(9|df|^2+H^2 f^2)^{1/2}\,dV_g
\le \|f\|_4^2(9\|df\|_2^2+\|Hf\|_2^2)^{1/2}.
$$

Using $R_g=\tfrac34H^2-|A^\circ|^2$ and Hölder for the negative term, retain the part of the mean curvature omitted from the crude scalar-form bound:

$$
Q_g(f)\ge (P_Y-P)\|f\|_4^2+\tfrac1{12}\|Hf\|_2^2,
\qquad P_Y=\tfrac{32}{3}\sqrt{\omega_4}=\tfrac{16\sqrt2}{3}\pi. \tag{2}
$$

The coefficient $1/12$ comes from $\tfrac34-\tfrac23$, after multiplying the squared Brendle estimate by $2/3$ to match the gradient coefficient six. For $P<P_Y$ the uniform Yamabe lower bound is $P_Y-P$. At $P=P_Y$, first infer $Y([g])\ge0$. If the value were zero, the smooth positive Yamabe factor $f$ would have $Q_g(f)=0$. Its mean-curvature term in (2) is strictly positive, since $H\equiv0$ would make the coordinate functions of the closed immersion harmonic and hence constant. Thus $Y([g])>0$ at equality as well. The endpoint argument uses the actual positive test and gives strict sign for each immersion. It supplies no additional uniform margin there. [Yamabe existence, Lee–Parker, Bull. AMS 17 (1987), §11, p. 85](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf)

There is also an intrinsic zero-sign test on any smooth oriented homotopy four-sphere. If $Y([g])=0$, choose the smooth scalar-flat conformal representative $\widetilde g$. Signature zero implies that the full four-index Weyl integral is $8E_+(\widetilde g)=8E_+(g)$. The Chern–Gauss–Bonnet formula with $\chi=2$ becomes

$$
16\pi^2=2E_+(g)-\tfrac12\int_M |\operatorname{Ric}_{0,\widetilde g}|^2\,dV_{\widetilde g}.
$$

It follows that $E_+(g)\ge8\pi^2$. Therefore $Y([g])\ge0$ together with $E_+(g)<8\pi^2$ forces strict positivity. A weak energy bound at $8\pi^2$ leaves the scalar-flat Ricci-flat case at the level of this identity. [Chang–Gursky–Yang, IHÉS 98 (2003), Remark 2 and equation (0.4), p. 107](https://numdam.org/item/10.1007/s10240-003-0017-z.pdf)

## Entry and recognition

The E26 implication is $J<|S^4|=8\pi^2/3\Rightarrow M\cong S^4$. Its contrapositive gives $J\ge8\pi^2/3$ on every hypothetical nonstandard type. Equation (1) then gives

$$
E_+(g)\le P^2/6-64\pi^2/27. \tag{3}
$$

| Target on the supplied class or source | Sufficient bound from (2)–(3) | Endpoint check |
| --- | --- | --- |
| Energy bound for entry when $J\ge8\pi^2/3$ | $P<4\sqrt{35}\,\pi/3$ | At equality (3) gives $E_+\le8\pi^2$. The required strict inequality follows below this ceiling. |
| Positive-band entry on a hypothetical nonstandard type | $P\le16\sqrt2\,\pi/3$ | The sign is positive by (2) and $E_+\le64\pi^2/9=8\pi^2-8\pi^2/9$ by (3). |
| Smooth recognition on any homotopy four-sphere | $P\le2\sqrt{86}\,\pi/3$ | This lies strictly below $P_Y$. On a hypothetical nonstandard type (3) gives $E_+\le4\pi^2$, contrary to inclusive recognition. |

The last row uses Chang–Gursky–Yang's Theorems A and B. In the author's tensor convention the threshold is $16\pi^2\chi=32\pi^2$. The strict case recognizes $S^4$ or $\mathbb{RP}^4$, and the latter has the wrong fundamental group. At equality the nonstandard alternatives are the Fubini–Study class on $\mathbb{CP}^2$ and a conformal quotient covered isometrically by $S^3\times S^1$. The first has the wrong $H^2$ and the second the wrong fundamental group. [Chang–Gursky–Yang, Theorems A and B and Remark 2, pp. 107–108](https://numdam.org/item/10.1007/s10240-003-0017-z.pdf) · [Master recognition proposition](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L195)

For any immersed source with $P\le P_Y$, there are two ways to certify existential entry. When $J\ge8\pi^2/3$, the induced conformal class works by (2)–(3). When $J<8\pi^2/3$, E26 gives the standard smooth sphere and the round metric supplies entry. For the induced class itself the more general sufficient check is $P\le P_Y$ and $P^2/6-(8/9)J<8\pi^2$. A separate nonnegative Yamabe sign also suffices in that check by the intrinsic zero-sign test.

The recognition claim gives an equivalence of smooth type with the *existence* of an immersion satisfying $P\le2\sqrt{86}\,\pi/3$, since the standard round immersion has $P=0$. On a nonstandard candidate every actual immersion must therefore have $P>2\sqrt{86}\,\pi/3$. A bound by $P_Y$ on some immersion yields entry, which leaves the minimizing problem. The tabulated thresholds are the largest cutoffs delivered by the two scalar bounds with only the E26 lower bound on $J$. The equality tuple proves optimality of the pointwise coefficient in (1). These calculations give no optimal global immersion threshold and no existence of a pinched immersion on an arbitrary candidate. [E26 height criterion and scope](E26_FOUR_CRITICAL_HEIGHTS.md) · [E23 immersion and curvature-control scope](../notes/E23_IMMERSION_ENTRY.md)
