# A product band on the returned rank-two cut

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. SUR-B02 / E02l, [issue 1](../../research-progress/handoffs/NONLOCAL_PAIR_AND_NATIVE_STRIP_20261126.md), SHA-256 prefix `6626a8a20f1b`. The issue routes this bounded calculation to GPT-6.2 Sol/ultra. Independent serving model and effort were unavailable. Working HEAD at receipt `19c187ad8dbe936cf165017c753a94add775ebaf`. The calculation uses the [two-attachment assessment](../../reviews/TWO_ATTACHMENTS_AND_PHYSICAL_FACE_COST_20261126.md) (`ea5494dc454e`), [framed-slide trace](GST_PAIR_MOVE.md) (`4b6467e4c2b3`), [returned rank-one cut](ROUND_BAND_ON_RETURNED_UNKNOT.md) (`00a06606ef99`), [Mazur product](MIXED_WITNESS.md) (`c51c9c03de4c`) and [working surgery draft](../manuscript/recognition_from_marked_handle_cuts.tex) (`62b372832a0a`). All manifolds, markings and Riemannian metrics below are smooth and oriented.

The rank-two cut admits a closed PSC metric with a product band of any specified positive length. For the section metric constructed below, a band long enough to certify the scalar-width threshold has each chiral Weyl energy strictly above $8\pi^2$ on the band alone. Both complete sides have equal energies in the two signs, and the contribution from lengthening the band is exactly linear.

## The two pieces of the actual cut

Write $Y_j=\#_j(S^1\times S^2)$, $H_j=\natural_j(S^1\times D^3)$ and $A_j=\natural_j(S^2\times D^2)$. Attach the split zero-framed unknot $U_0$ to $D^4$ to reach $Y_1$. In a three-ball of $Y_1$ take the Figure 5 pair $(U,K)$, with $U$ the unknot and $K$ the square knot. If the input is a framed slide of this pair, first undo that supplied slide on its trace. If $F$ is the returned trace map and $F_+$ its outgoing restriction, the original closing $\gamma$ to the actual upper $H_3$ becomes $\gamma F_+^{-1}$, with inverse $F_+\gamma^{-1}$. The map fixes the incoming collar and carries the full framed tubes through each step. The marked level measured below is the pullback of the returned $U$-first level after $U_0$. The Figure 5 slide sends the pair to the split zero-framed unlink and gives outlet $Y_3$. [Gompf–Scharlemann–Thompson, §2, pp. 2308–2310 and Figures 5–6](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)

The complete lower piece $P$ is $A_2$. The ball for the local pair can be shrunk and moved into the part of the original three-sphere disjoint from the tube of $U_0$ by an ambient isotopy of $Y_1$, extended over an inward collar. In those coordinates the prefix uses two unlinked disk-framed unknots, so the two handle cores capped by their disks give the disjoint generators with trivial normal bundles in $A_2$. The remaining framed knot on the cut produces $Y_3$ from $Y_2$. The one-knot surgery theorem for a rank increase identifies the knot on this actual $Y_2$ as an unknot in a ball and the slope as zero. Its dual core on $Y_3$ crosses the new product sphere once. Denote its outgoing solid torus by $o:D^2\times S^1\to Y_3$ and let $\tau$ switch the two factors. Its tube in the upper body is $\gamma F_+^{-1}o\tau$, with inverse $\tau^{-1}o^{-1}F_+\gamma^{-1}$ on its image. Use the identity for $F$ when the input is already Figure 5. The boundary change from this marked $Y_3$ identification to standard product coordinates extends over the actual $H_3$. The reverse 1/2 cancellation gives a diffeomorphism $\Xi$ from the complete upper piece $Q$ to $H_2$. This cancels the last returned 2-handle with one 3-handle. If $f:\partial P\to\partial Q$ is the actual reversed-orientation gluing, the model map is $(\partial\Xi)f$ with inverse $f^{-1}(\partial\Xi)^{-1}$. Laudenbach–Poénaru Theorem A identifies the resulting $A_2\cup H_2$ as $S^4$. [Meier–Schirmer–Zupan, Theorem 5.1](https://arxiv.org/pdf/1507.06561#page=9) · [Laudenbach–Poénaru, Theorem A and boundary extension in its proof, pp. 337, 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf) · [Milnor, Theorem 5.4](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=53)

## A specified section metric

Start with the unit $S^3\subset\mathbb R^4$ and centers $\pm e_1,\pm e_2$. Put $T=2$. The four balls of polar radius $2\arctan(e^{-T})<\pi/4$ are disjoint. In each ball use $t=-\log\tan(\theta/2)$, where $\theta$ is polar distance, so the round metric is $\operatorname{sech}^2 t\,(dt^2+g_{S^2})$. Replace the interior beyond $t=T$ by a finite collar with metric $u^2(dt^2+g_{S^2})$ as follows.

Set $B=T+1/2$, $t_*=5B+1/2$, and define $q_0$ on $\mathbb R$ and $q,u$ by

$$
\begin{aligned}
q_0(t)&=\begin{cases}t,&t\le B,\\
\max(0,B-(t-B)/4),&t>B,
\end{cases}\\
q&=q_0*\varphi,\qquad
u(t)=\operatorname{sech} T\exp\left(-\int_T^t\tanh q(v)\,dv\right),\qquad T\le t\le t_*.
\end{aligned}
$$

Here $\varphi(v)$ is proportional to $\exp[-1/(1-16v^2)]$ for $|v|<1/4$ and zero elsewhere, normalized to integral one. Its evenness gives $q(t)=t$ near $T$. Also $q=0$ for $t\ge 5B+1/4$, $0\le q\le B$ on $[T,t_*]$, and $q'\ge -1/4$. Thus $u=\operatorname{sech}t$ near $T$ and $u=a:=u(t_*)>0$ near the other end. Pair the holes at opposite centers, joining each pair by a cylinder $[0,a]\times S^2$ with metric $ds^2+a^2g_{S^2}$. The round angular identification at one end of each cylinder is the identity and at the other end is a reflection. This makes the two surgeries joining pairs of balls oriented and gives $Y_2$. In oriented tangent frames at the centers with last vector $e_4$, use reflection of that last angular coordinate. The reflection of the whole round sphere in $x_4=0$ then acts isometrically on the collars and cylinders and is orientation reversing on the resulting $Y_2$. Pull the resulting metric $h$ to the actual $\partial P$ by an oriented identification.

Use native radial differential $ds=u\,dt$ in each of the four modified collars. Put $p=\tanh q$, so $\partial_s u=-p$. The radial and tangential sectional curvatures are

$$
K_{\perp}=u^{-2}p',\qquad K_{\mathrm{tan}}=u^{-2}(1-p^2),
\qquad R_h=4K_{\perp}+2K_{\mathrm{tan}}=2u^{-2}\operatorname{sech}^2q\,(1+2q').
$$

Since $u\le\operatorname{sech}T$ and $q'\ge-1/4$, an analytic lower bound throughout $Y_2$ is

$$
\rho=\frac{\cosh^2 T}{\cosh^2 B}>0.
$$

The unmodified region has $R_h=6$ and the inserted cylinders have $R_h=2/a^2$, so the same bound holds there. The normalization is the unit-radius round input. Under $g\mapsto b^2g$ for $b>0$, the band lengths multiply by $b$, the scalar floor divides by $b^2$, the end means divide by $b$, and the four-dimensional chiral energies are invariant.

## A closed metric with product germs on the marked section

Give the actual complete pieces product-collared PSC metrics $g_P,g_Q$ with boundary metrics $h_P,h_Q$. To obtain them on the models, use the round unit metric on $S^2$ and the flat unit circle. On each required radial disk in dimensions two and three use $dv^2+\eta(v)^2g_{S^{j-1}}$, where $\eta(v)=\int_0^v\chi(s)\cos s\,ds$ for $0\le v\le1$ and $\chi$ is smooth, nonincreasing, equal to one near zero and zero on $[1/2,1]$. The tip is round, $\eta''\le0$, and $0\le\eta'<1$ for $v>0$. The two-disk has nonnegative sectional curvature and the three-disk has positive scalar curvature. Their products give PSC metrics on the summands of $A_2,H_2$. Attach the actual 1-handle of each boundary connected sum by applying the positive trace theorem to the index-one surgery on $S^0$ in a three-dimensional level. The theorem gives a product germ at each end of the trace. Pull both fillings back to the marked sides and take product coordinates on their chosen inward collars. [Walsh, Theorem 1.2 and Definition 4.3](https://arxiv.org/pdf/0811.1245#page=45)

On the single closed oriented manifold $\partial P$, join $h_P$ to $h$ and $h$ to $f^*h_Q$ by two smooth PSC paths $h_s^P,h_s^Q$, for $s\in[0,1]$, constant near both endpoints. Bamler–Kleiner gives continuous paths. Compactness of each path and $C^2$ openness of PSC allow a subdivision with linear metric interpolation on each segment in PSC. A smooth time switch constant near both ends of each segment yields the required paths. For path $j=P,Q$ put $k_j=\tfrac12\partial_s h_s^j$, $m_j=\operatorname{tr}_{h_s^j} k_j$, $\lambda_j=\min R_{h_s^j}>0$, and $C_j=\lVert m_j^2+|k_j|^2_{h_s^j}+2\partial_s m_j\rVert_\infty$. On the transition $g_j^{\rm tr}=dx^2+h_{x/D_j}^j$ the Gauss and normal Ricci identities give

$$
R(g_j^{\rm tr})=R_{h_s^j}-D_j^{-2}\bigl(m_j^2+|k_j|_{h_s^j}^2+2\partial_s m_j\bigr).
$$

Fix $D_j=\max\{1,\sqrt{2C_j/\lambda_j}\}$ in the above length units, so $R(g_j^{\rm tr})\ge\lambda_j/2$. Both transition lengths and the two fillings are fixed as the band length varies. The four pieces outside the band are PSC. [Bamler–Kleiner, Theorem 1.1](https://arxiv.org/pdf/1909.08710#page=2)

For any $L>0$, insert $dt^2+h$ on $B_L=\partial P\times[-L/2,L/2]$, with the $P$ transition on its lower end and the $Q$ transition on its upper end. To return this metric to the original smooth source, use its signed bicollar $-\epsilon<z<\epsilon$, where the lower angular coordinates are $y\in\partial P$ and the upper ones are $f(y)$. Take smooth nonnegative bumps $\beta_P,\beta_Q$ of integral one supported in the respective open halves of this collar. Put

$$
\psi(-\epsilon)=-\epsilon-L/2-D_P,
\qquad
\psi'=1+(L/2+D_P)\beta_P+(L/2+D_Q)\beta_Q.
$$

Then $t=\psi(z)$ preserves the marked center, and it is a translation near both ends of the old collar. The inverse normal map is $z=\psi^{-1}(t)$, with the upper angular inverse $f^{-1}$. The filled metric $g_L$ pulled back by these coordinates is smooth on both complete sides. Its scalar curvature has positive lower bound $\min\{\rho,\lambda_P/2,\lambda_Q/2,\min R(g_P),\min R(g_Q)\}$, so its conformal class is positive Yamabe. Here and below $B_L$ also denotes the pulled-back marked band.

## Native width, means and separator

Each half width is exactly $L/2$ and the end-to-end width is $L$. Any path length in the band dominates its displacement in $t$, and the constant-$y$ normal segments attain equality. The same endpoint distances in the whole closed metric follow by extending $t$ by constants $-L/2,L/2$ on the two sides beyond the band, giving a global 1-Lipschitz function. The mean traces using the two outward unit normals are both zero. The central slice is totally geodesic and its normal Ricci curvature is zero, so the unrestricted stability form is $\int|\nabla v|_h^2\,dV_h$. Its projection to the oriented section has degree $+1$ and the slice itself is PSC.

Set $L_*=\pi\sqrt{3/\rho}=\pi\sqrt3\,\cosh(5/2)/\cosh 2$. The certified native widths at this choice are each $L_*/2$. The scalar-width value is $\rho L_*^2=3\pi^2$. Scaling the metric by $\rho/12$ as a metric tensor gives $R\ge12$ on the band and width $\pi/2$, the strict upper bound in the non-PSC case of Corollary 2.25. Both end means vanish, so the comparison expression is $\sqrt{\rho/3}\,L>0$ for every $L>0$. This contradicts the no-PSC-separator hypothesis of Corollary 2.9. Positive scalar curvature, stability and degree one for the specified central slice follow directly from the product calculation above. [Räde, Definition 1.1, §2.A, Corollaries 2.9 and 2.25](https://arxiv.org/pdf/2104.10120v4) · [Two-end normalization](../../reviews/END_CURVATURE_READER.md)

## Both chiral energies and the price per unit width

Use the norm of the Weyl operator on real chiral two-forms. For a Ricci eigenframe of $h$ with eigenvalues $r_i$, the three complementary curvature pairs for $dt^2+h$ have sectional curvatures $0,R_h/2-r_i$. The diagonal curvature block on either chiral space therefore has eigenvalues $(R_h/2-r_i)/2$. Removing the scalar block $R_h/12$ gives $-(r_i-R_h/3)/2$. Put $J=\int_{Y_2}|\operatorname{Ric}_h-\tfrac13 R_hh|_h^2\,dV_h$. Each band energy is $LJ/4$ and each half contributes $LJ/8$ in each sign. Under a uniform length change $b$, $J$ divides by $b$.

On a modified collar the traceless Ricci norm squared is $\tfrac23(K_{\perp}-K_{\mathrm{tan}})^2$. The angular volume is $4\pi$ and the volume differential is $u^3dt\,dV_{g_{S^2}}$. The unmodified round region contributes zero, and each inserted cylinder contributes $8\pi/(3a)$ because its native length is $a$ and $K_{\mathrm{tan}}=1/a^2$. This gives the exact quadrature and analytic lower bound

$$
J=\frac{32\pi}{3}\int_T^{t_*}u^{-1}(q'-1)^2\operatorname{sech}^4(q)\,dt
  +\frac{16\pi}{3a}\ \ge\ \frac{16\pi}{3a}.
$$

At $L=L_*$ the cylinders alone imply, for each sign,

$$
E_\sigma(g_{L_*};B_{L_*})\ge\frac{4\pi L_*}{3a}
\ge \frac{4\pi^2\sqrt3}{3}\cosh2>8\pi^2.
$$

Here $a\le\operatorname{sech}2$, $\rho<1$, and $\cosh 2>1+2+2/3>2\sqrt3$. The same estimate applies for $L\ge L_*$. In particular each complete side already has more than $4\pi^2$ in each sign at this choice of width.

Let $U_j^\sigma=E_\sigma(g_j;j)$ for the fixed filling $j=P,Q$ and $V_j^\sigma=E_\sigma(g_j^{\rm tr};[0,D_j]\times\partial P)$ for the corresponding fixed transition with its orientation from the source. In the complete-side ledger, $j$ denotes the actual side up to the central section in $g_L$.

| Region | Energy for either $\sigma=+,-$ |
| --- | --- |
| Entire band | $LJ/4$ |
| Entire exterior of the band | $U_P^\sigma+V_P^\sigma+U_Q^\sigma+V_Q^\sigma$ |
| Complete lower side $P$ | $U_P^\sigma+V_P^\sigma+LJ/8$ |
| Complete upper side $Q$ | $U_Q^\sigma+V_Q^\sigma+LJ/8$ |
| Closed source | $U_P^\sigma+V_P^\sigma+U_Q^\sigma+V_Q^\sigma+LJ/4$ |

In fact $U_j^++V_j^+=U_j^-+V_j^-$ for each $j$. To see this, glue two copies of one measured complete side, both with the orientation inherited from the source, by the orientation-reversing isometry of $(Y_2,h)$. The product germs give a smooth closed metric. For the double of $Q$, its second real homology vanishes by Mayer–Vietoris since $H_2(H_2;\mathbb R)=0$ and the inclusion from its boundary is an isomorphism on $H_1$. For the double of $P$, the boundary inclusion is an isomorphism on $H_2(\cdot;\mathbb R)$ by the product sphere generators and $H_1(P;\mathbb R)=0$. Mayer–Vietoris gives second Betti number four and an injection of the rank-two second homology of either copy. The disjoint square-zero sphere generators from that copy give a half-dimensional isotropic subspace of the closed intersection form, so its signature is zero. The closed signature identity $E_+-E_-=12\pi^2\tau$ now gives zero signed difference for each measured complete side separately. [Hirzebruch, §4, equation (16)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/hirzrem.pdf) · [Project energy normalization](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

For two lengths the exact added energy is $(L_2-L_1)J/4$ per sign on the whole source and half of that on either complete side. The filling and transition energies are finite fixed constants in this construction. Their separate sizes have not been evaluated. At smaller widths the two-end test still holds and the band charge is proportional to $L$. Deciding whether the whole constructed metric is subcritical at such a width would require the fixed exterior sums. The calculation concerns this prescribed marked source and its constructed metrics. The independently selected immersion height and the charged minimizing disk have their own markings and cost data.

The construction applies at each finite rank $r\ge2$ on a given cut of type $A_r\cup Y_r\cup H_r$, in particular on the returned penultimate level obtained by inserting $r-1$ split unknots before the same local pair. Use $2r$ centers on the equatorial two-sphere, take $T\ge2$ large enough for disjoint balls, and form $r$ necks as above. The scalar floor is $\cosh^2T/\cosh^2(T+1/2)$, the quadrature has $2r$ identical collar contributions and $r$ cylinder contributions, and the same strict chiral threshold follows from the $r$ cylinder terms. Iterating the boundary connected sums gives the two PSC fillings. The signature argument uses a rank-$r$ isotropic space in the double of $A_r$ and zero second homology in the double of $H_r$.
