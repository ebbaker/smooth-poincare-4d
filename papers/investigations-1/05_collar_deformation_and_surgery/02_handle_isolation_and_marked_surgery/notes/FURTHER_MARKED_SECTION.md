# A product band on the original mixed penultimate cut

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. SUR-B02 / E02o is bounded execution on the mixed continuation of the [frozen packet](../../research-progress/handoffs/EXTERIOR_RECOVERY_AND_NATIVE_CAPS_20261126.md), SHA-256 prefix `1f4b94e43838`. The packet specifies GPT-6.2 Sol/ultra for execution. Independent serving model and effort telemetry is unavailable. Intake HEAD was `8471728a1549614f155a8751c709904cbcf994d6`. The derivation uses the [nonlocal pair](GENERATOR_BAND_PAIR.md) (`e88a6a83dd98`), [cyclic lifts](LIFTED_LINKS_AND_SPHERES.md) (`6325b628f09a`), [preceding product construction](RANK_TWO_PRODUCT_BAND.md) (`2dfc5677b76a`), [surgery manuscript](../manuscript/recognition_from_marked_handle_cuts.tex) (`ea9165de0369`) and [assessment](../../reviews/NONLOCAL_BANDS_AND_PHYSICAL_TRANSPORT_20261126.md) (`51b3b161e487`). All handles, markings and metrics are smooth. The source is oriented and the metric Riemannian. The chiral Weyl norms are the Hilbert–Schmidt norms on real two-forms and the one-sign threshold is $T=4\pi^2$.

The actual section after both attachments of the one-period nonlocal pair has a smooth positive-scalar-curvature product band with native half-widths $L/2$ and outward means zero. Its lower and upper pieces are $H_1\natural A_2$ and $H_2\natural A_1$, respectively, where $H_r=\natural_r(S^1\times D^3)$ and $A_r=\natural_r(S^2\times D^2)$. The lower piece has fundamental group $\mathbb Z$. In this metric family the scalar-width threshold forces band energy above $2T$ in each chirality even using the actual scalar minimum. The two-end mean test holds at each positive length, and the retained product filling regions alone cost more than $2T$ in each sign at every length.

## Original order and closing maps

Start with the boundary $Y_1=S^1\times S^2$ of the lower $H_1$. Use the one-period pair $(Q,K)$ of the [generator-band construction](GENERATOR_BAND_PAIR.md#place-the-pair-and-route-one-band), where $Q$ is the stationary square knot and $K$ is the tube obtained from the original unknot by the generator slide. Attach $Q$ first and $K$ second in their original framed tubes. Denote the resulting lower piece by $P$ and its actual outlet by $Z=\partial P$. Both knots are null-homotopic in the original $Y_1$. The framed slides from the prerequisite identify the two-handle trace with the split, zero-framed two-unknot trace, fixed on the incoming collar. They preserve the outer boundary as a marked outlet of the whole block. Write $F:P\longrightarrow P_0=H_1\natural A_2$ for this diffeomorphism, using the identity on $H_1$ and collar-compatible coordinates on the two traces. Write $\phi=\partial F:Z\longrightarrow\partial P_0=Y_3$, with $Y_j=\#_j(S^1\times S^2)$. For the inverse of each trace slide, use the inverse angular isotopy on its outgoing collar and the inverse transport in the moving tube coordinates. The composite inverse $F^{-1}$ has boundary map $\phi^{-1}$. The split disks and hence the two $A_1$ summands lie in the specified ball disjoint from the retained lower handle. [Gompf–Scharlemann–Thompson, §2, Lemma 2.1 and Figure 5, pp. 2308–2310](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=6) · [Both trace maps](GENERATOR_BAND_PAIR.md#undo-the-band-and-track-the-closing)

To fix one explicit closure, choose the product tube $a_0:S^1\times D^2\to Y_3$ along $S^1\times\{p\}$ in the $H_1$ summand disjoint from the two zero-surgery summands. Use $a=\phi^{-1}a_0$ as the actual last tube on $Z$, with inverse $a_0^{-1}\phi$ on its image. Its attachment in split coordinates removes that $Y_1$ factor, since $D^2\times S^1$ fills the complementary solid torus $S^1\times D^2$ with meridian and longitude interchanged. The final boundary is $Y_2$. Extend $F$ across the last handle by its coordinates and denote the resulting outlet map by $\widehat\phi$. Choose the closing $\gamma_0$ from the split outlet to the actual upper $H_2$ by matching the two remaining labeled $S^1\times S^2$ factors to the complementary standard factors. Use the orientation-reversing closing $\gamma=\gamma_0\widehat\phi$ on the original outlet. The forward comparison sends the last tube to $\phi a$, the closing to $\gamma\widehat\phi^{-1}$, and its inverse to $\widehat\phi\gamma^{-1}$. The split closed model pairs the $S^1\times D^3$ bottom factor with $D^2\times S^2$ and the two $S^2\times D^2$ bottom factors with $D^3\times S^1$. Each factor closes to the smoothed boundary of $D^2\times D^3$. The paired boundary sums give their ordinary connected sum, hence the explicit source is a standard smooth sphere. Its chosen height still has the original order $(Q,K,a)$ and counts $(n_1,n_2,n_3)=(1,3,2)$.

The upper-piece calculation also applies to any prescribed compatible final tube and closing with outlet $Y_2$. Let $o:D^2\times S^1\to Y_2$ denote the final handle's outgoing face in the original outlet, before the closing, and let $\tau(z,v)=(v,z)$ exchange the two factors. The reversed attaching tube in the actual $H_2$ boundary is $\gamma o\tau$, with inverse $\tau^{-1}o^{-1}\gamma^{-1}$ on its image. The reverse surgery takes $Y_2$ to $Z\cong Y_3$ and its integral slope is nonmeridional. The rank-increase case of Meier–Schirmer–Zupan makes this reversed tube a zero-framed local unknot. Move its ball into a boundary chart by an isotopy and extend that isotopy over an upper collar. The corresponding relative trace is a boundary sum with $S^2\times D^2$. Thus the entire upper piece $U$ of the original cut is diffeomorphic to $H_2\natural A_1$ with a transported marking. If $G:U\to H_2\natural A_1$ is that map and $\delta:\partial P\to\partial U$ the actual orientation-reversing cut gluing, the model gluing is $\partial G\,\delta\,\phi^{-1}$ with inverse $\phi\,\delta^{-1}(\partial G)^{-1}$. The metric construction below uses $\delta$ itself. [Meier–Schirmer–Zupan, Theorem 5.1, pp. 9–10](https://arxiv.org/pdf/1507.06561#page=9)

On this cut $\pi_1(P)=\mathbb Z$, so the simply connected penultimate-prefix hypothesis is unavailable. The reversed last core is null-homologous in the actual $Y_2$. Its algebraic intersection with every upper belt sphere is zero, which rules out a single transverse intersection for this tube after any upper re-marking. The band supplies a PSC certificate on the actual $Z$ of this rank-increase description. The closed recognition for more general compatible homotopy-sphere closures uses the [relative two-slide identification and interior sphere surgery](../../reviews/NONLOCAL_BANDS_AND_PHYSICAL_TRANSPORT_20261126.md#two-failed-cuts-across-one-nonlocal-pair).

## Section metric and closed realization

Construct a metric $h$ on the model $Y_3$ using the unit round $S^3\subset\mathbb R^4$ and centers $\pm e_1,\pm e_2,\pm e_3$. Use $b=3$ and remove the interiors of the six polar balls of radius $2\arctan(e^{-b})<\pi/4$. Near each boundary use $v=-\log\tan(\theta/2)$, where $\theta$ is polar distance from its center. The round germ is $\operatorname{sech}^2 v(dv^2+g_{S^2})$. Set $B=b+1/2$, $v_*=5B+1/2$ and use the six identical shoulders

$$
q_0(v)=
\begin{cases}
v, & v\le B,\\
\max\{0,B-(v-B)/4\}, & v>B,
\end{cases}
\qquad
q=q_0*\varphi,\qquad
u(v)=\operatorname{sech} b\exp\left[-\int_b^v\tanh q(w)\,dw\right].
$$

Here $\varphi$ is the even unit-integral bump proportional to $\exp[-1/(1-16v^2)]$ on $|v|<1/4$ and zero off that interval. The shoulder has metric $u^2(dv^2+g_{S^2})$ on $[b,v_*]\times S^2$. Near $b$ one has $q=v$ and $u=\operatorname{sech}v$. Near $v_*$ one has $q=0$ and $u=a_{\mathrm n}:=u(v_*)>0$. Connect the opposite shoulders at each pair of centers by a product cylinder of radius and length $a_{\mathrm n}$. Gluing one end by the identity on its angular coordinates and the other by reflection gives the oriented $S^1\times S^2$ connected-sum addition. In the oriented tangent frames at each center take $e_4$ for the last coordinate and use its reflection. The ambient reflection in $x_4=0$ commutes with the gluing and extends as an orientation-reversing isometry of $h$. Use $\phi$ to pull the metric and this isometry to $Z$.

With native shoulder coordinate $ds=u\,dv$, the first derivative of $u$ is $-\tanh q$ and the radial and tangential sectional curvatures are

$$
K_\perp=u^{-2}q'\operatorname{sech}^2q,\qquad
K_{\mathrm{tan}}=u^{-2}\operatorname{sech}^2q .
$$

The convolution gives $0\le q\le B$ and $q'\ge-1/4$ on the shoulders. There $R_h=2u^{-2}\operatorname{sech}^2q(1+2q')$. On the round portion $R_h=6$ and on a cylinder $R_h=2/a_{\mathrm n}^2$. Consequently

$$
0<\rho_*:=\frac{\cosh^2 b}{\cosh^2 B}\le \rho_{\min}:=\min_Z R_h\le 6,
\qquad 0<a_{\mathrm n}\le \operatorname{sech}b .
$$

Give each $S^1\times D^3$ and $S^2\times D^2$ factor a product metric with a unit flat circle or a unit round two-sphere. On $D^d$ ($d=2,3$) use $dw^2+\eta(w)^2g_{S^{d-1}}$ for $0\le w\le1$, where $\eta(w)=\int_0^w\chi(v)\cos v\,dv$ with a smooth nonincreasing cutoff $\chi$ equal to one on $[0,1/4]$ and zero on $[1/2,1]$. For a fixed choice take $\chi$ to be one minus the cumulative integral of a unit-integral smooth bump proportional to $\exp[-1/((v-1/4)(1/2-v))]$ on $(1/4,1/2)$ and zero elsewhere. The tip has the round germ. The two-disk has nonnegative curvature, and the three-disk is PSC by the concavity of $\eta$ and $\eta'<1$ at positive $w$. Thus the factors are PSC with product boundary collars. Apply Walsh's PSC trace extension to the index-one cobordism for each boundary connected sum, with $1\le 3-2$ in the admissibility bound. Attach the trace to the full boundary of the original product pieces, so the whole factor metrics are retained in each fixed filling. This gives fixed PSC metrics $g_P^0,g_U^0$ with product collars on the actual pieces by $F$ and $G$. Denote their boundary metrics by $h_P,h_U$. [Walsh, Theorem 1.2 and Definition 4.3](https://arxiv.org/pdf/0811.1245)

On the single closed connected oriented $Z$, use the path-connectedness of the space of PSC metrics to connect $h_P$ to $h$ and $h$ to $\delta^*h_U$. Smooth these two paths by a fine subdivision in the $C^2$-open PSC set, linear interpolation there, and a smooth time switch constant near each subinterval endpoint. Denote the paths by $h_j(s)$, $s\in[0,1]$, $j=P,U$. Put $k_j=\partial_s h_j/2$, $m_j=\operatorname{tr}_{h_j}k_j$, $\lambda_j=\min_{Z\times[0,1]} R_{h_j}>0$, and

$$
D_j=\max\left\{1,\sqrt{\frac{2\,\|m_j^2+|k_j|^2+2\partial_sm_j\|_\infty}{\lambda_j}}\right\}.
$$

Use the transition metric $g_j^{\rm tr}=dx^2+h_j(x/D_j)$, $0\le x\le D_j$. The Gauss and normal Ricci equations give
$R(g_j^{\rm tr})=R_{h_j}-D_j^{-2}(m_j^2+|k_j|^2+2\partial_sm_j)\ge\lambda_j/2$.
Fix the fillings, paths and transition lengths as $L$ varies. Their end germs allow smooth joining to $dt^2+h$ on $[-L/2,L/2]\times Z$. [Bamler–Kleiner, Theorem 1.1](https://math.nyu.edu/~bkleiner/psc.pdf#page=2)

On a signed bicollar $-\epsilon\le z\le\epsilon$ in the original source, use angular coordinates $y$ from $Z$ and $\delta(y)$ on the upper side. Choose nonnegative bumps $\beta_P,\beta_U$ of integral one supported in the respective open halves, away from zero and the endpoints. Pull the extended coordinate $t$ back by the increasing function

$$
\psi(-\epsilon)=-\epsilon-D_P-L/2,\qquad
\psi'=1+(D_P+L/2)\beta_P+(D_U+L/2)\beta_U.
$$

Then $\psi(0)=0$ and $\psi(\epsilon)=\epsilon+D_U+L/2$. It is the required translation near each retained end germ. The inverse normal coordinate is $\psi^{-1}$ and the upper angular inverse is $\delta^{-1}$. The resulting smooth closed metric $g_L$ is PSC on the original source, with center the actual unmodified $Z$ in order $(Q,K,a)$. In particular its Yamabe class is positive.

## Width, signed end means and complete costs

In $g_L$ the intrinsic widths of the two product halves are $L/2$ and the full width is $L$. Constant-angle segments attain these distances. Clamping $t$ to its end values outside the band also gives a globally 1-Lipschitz function, so the same distances hold in the closed metric. At the two ends the trace mean curvatures with their own outward unit normals are both zero. The central slice is totally geodesic, and its unrestricted minimal stability form is $\int_Z|\nabla f|_h^2\,dV_h$ since the normal Ricci curvature vanishes. The slice has PSC and its projection to itself has degree $+1$. Independently the two-end test applies for every $L>0$, since the normalized mean sum is zero and the no-PSC-separator inequality is strictly negative. At the explicit $L_*=\pi\sqrt{3/\rho_*}$ the certified scalar floor satisfies $\rho_* L_*^2=3\pi^2$ and the native half-widths are both $L_*/2$. Rescaling the metric tensor by $\rho_*/12$ gives scalar curvature at least $12$ and width $\pi/2$, the inclusive certifying side of the strict comparison. [Räde, §2.A and Corollaries 2.9 and 2.25](https://arxiv.org/pdf/2104.10120v4)

In a Ricci eigenframe of $h$, with eigenvalues $r_i$, the complementary sectional curvatures of $dt^2+h$ are $0,R_h/2-r_i$. Each chiral block of the curvature operator has diagonal entries $(R_h/2-r_i)/2$ in the associated orthonormal basis. Subtracting $R_h/12$ gives the two Weyl blocks with the same eigenvalues $-(r_i-R_h/3)/2$. Put $J=\int_Z|\operatorname{Ric}^{\circ}_h|^2\,dV_h$. Each shoulder gives $2(K_\perp-K_{\mathrm{tan}})^2/3$ in the integrand, with volume differential $u^3\,dv\,dV_{S^2}$. Each cylinder contributes $8\pi/(3a_{\mathrm n})$, and the round region has zero trace-free Ricci curvature. Thus the exact coefficient in either sign is determined by

$$
J=16\pi\int_b^{v_*}u^{-1}(q'-1)^2\operatorname{sech}^4q\,dv
+\frac{8\pi}{a_{\mathrm n}}.
$$

Using orientations inherited from the closed metric, fix the exterior constants

$$
C_j^\sigma=
\int_j |W^\sigma_{g_j^0}|_{\mathrm{HS}}^2\,dV_{g_j^0}
+D_j\int_0^1\int_Z
\left.|W^\sigma_{g_j^{\rm tr}}|_{\mathrm{HS}}^2\right|_{x=D_js}\,dV_{h_j(s)}\,ds,
\qquad j=P,U,\quad \sigma\in\{+,-\}.
$$

The first integral is over the entire original compact side with its fixed filling metric, and the second gives its entire transition. These include the portions of the fixed product germs retained outside the band. For the filling integral, write $B_H$ and $B_A$ for the full single-factor energies of $S^1\times D^3$ and $S^2\times D^2$. For the first factor apply the product chiral formula above to its three-disk and flat circle. For the second, the only nonzero complementary curvature pair consists of the two surface curvatures $1$ and $-\eta''/\eta$. Its chiral norm squared is $(1-\eta''/\eta)^2/6$ in either sign. The factor costs are therefore

$$
\begin{aligned}
B_H&=\frac{4\pi^2}{3}\int_0^1
\eta^2\left(-\frac{\eta''}{\eta}-\frac{1-\eta'^2}{\eta^2}\right)^2dw,\\
B_A&=\frac{4\pi^2}{3}\int_0^1
\eta\left(1-\frac{\eta''}{\eta}\right)^2dw .
\end{aligned}
$$

The first integral in $C_P^\sigma$ is $B_H+2B_A+K_P^\sigma$, and that in $C_U^\sigma$ is $2B_H+B_A+K_U^\sigma$. Here $K_j^\sigma$ is the nonnegative sum of the integrals of $|W^\sigma|_{\mathrm{HS}}^2$ over the attached PSC traces of the boundary sums in side $j$. These trace terms and the transition integrals are finite and depend on the fixed choices of trace metrics and paths.

| Region of the closed source with metric $g_L$ | Cost for each $\sigma$ |
| --- | --- |
| Product band | $LJ/4$ |
| Entire exterior of the band | $C_P^\sigma+C_U^\sigma$ |
| Complete side below the marked center | $C_P^\sigma+LJ/8$ |
| Complete side above the marked center | $C_U^\sigma+LJ/8$ |
| Whole closed source | $C_P^\sigma+C_U^\sigma+LJ/4$ |

Each $C_j^+=C_j^-$. Glue two equally oriented copies of one complete side at its product germ by the orientation-reversing isometry of $(Z,h)$, conjugated by the marking on that side. This gives a smooth closed oriented double with twice its complete energy in each sign. For either piece $H_r\natural A_s$, the boundary inclusion on $H_2$ is onto of rank $s$, and its boundary inclusion on $H_1$ is onto of rank $r$ with kernel of rank $s$. Work over $\mathbb R$ and identify the boundaries by the gluing. The kernel of either $H_2$ inclusion is Poincaré dual to the image of the restriction of $H^1$ from that side, by the relative sequence and duality. This cohomology image annihilates the kernel of the corresponding $H_1$ inclusion. If the two $H_1$ kernels intersect in dimension $d$, the joint boundary $H_1$ map has rank $r+s-d$. The joint boundary $H_2$ map has rank $2s-d$ because its kernel is dual to the annihilator of the sum of the two $H_1$ kernels. Mayer–Vietoris gives the second Betti number of the double as $d+d=2d$. One copy contributes a $d$-dimensional image to $H_2$ of the double. Its loss from the original dimension $s$ is $s-d$, the dimension of the image of the other copy's boundary $H_2$ kernel under the first inclusion. The $s$ classes on that side are generated by disjoint square-zero interior spheres, so their image is isotropic. Its dimension is half that of the closed intersection form, which therefore has signature zero. The closed identity $E_+-E_-=12\pi^2\tau$ gives equality of the complete-side energies, and the product halves have equal costs in the two signs. [Hirzebruch, §4, equation (16)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/hirzrem.pdf#page=8) · [Normalization](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

In fact every $g_L$ satisfying the width-only test with the *actual* scalar minimum has $L\ge\pi\sqrt{3/\rho_{\min}}\ge\pi/\sqrt2$. The three cylinders alone force

$$
E_\sigma(g_L;\mathrm{band})\ \ge\ \frac{2\pi L}{a_{\mathrm n}}
\ \ge\ \sqrt 2\,\pi^2\cosh 3\ >\ 8\pi^2 .
$$

The last strict inequality follows from $\cosh 3>1+9/2+81/24>4\sqrt2$. Each complete side also exceeds $T$ in each sign at such a width.

For shorter lengths, the two-end criterion remains strict, but the fixed exterior of this construction already exceeds $2T$. Indeed, put $a_{\mathrm f}=\eta(1/2)$. Every $S^1\times D^3$ factor retains the interval $[1/2,1]$ with metric $dw^2+d\theta^2+a_{\mathrm f}^2g_{S^2}$. On that interval, $B_H$ contributes exactly $2\pi^2/(3a_{\mathrm f}^2)$ in each sign. Since $0<a_{\mathrm f}\le\sin(1/2)<1/2$, the lower exterior contains one such contribution, the upper exterior contains two, and

$$
C_P^\sigma+C_U^\sigma\ \ge\ \frac{2\pi^2}{a_{\mathrm f}^2}
\ \ge\ \frac{2\pi^2}{\sin^2(1/2)}\ >\ 8\pi^2 \qquad (\sigma=+,-).
$$

Thus the full-energy obstruction holds for all $L>0$ in these fillings with any of the fixed PSC transitions. The residual trace and transition integrals have not been evaluated numerically and contribute nonnegatively. The conclusion concerns the constructed metrics on this marked cut. A different filling construction or an independently supplied metric on the same cut requires its own cost test.
