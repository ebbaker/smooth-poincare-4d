# A Weyl-energy gap at zero Yamabe constant on the fixed exterior

26 November 2026 for Edward B. Baker III with OpenAI Codex assistance. Bounded E02-wall derivation. The issue selected GPT-6.2 Astra/ultra for the lead and requested GPT-6.2 Sol/ultra for E work. Actual serving model and effort were unavailable. Intake HEAD `1c81a3048c8c`. Working inputs are the [second issue](../research-progress/handoffs/DIRECT_SECOND_ISSUE_20261126.md) `f78cde4f6651`, [tube marking](MARKED_CONNECTION_ASSEMBLY.md) `59c3993e018e`, and [completed exterior](FUNNEL_EXTERIOR.md) `0cc56c281145`.

Fix the marked hyperbolic pants metric \(q\) with all three cuff lengths \(L=2\operatorname{arcosh}5\) and the unit round sphere metric \(\sigma\). For every smooth Riemannian completion \(g\) on the specified closed oriented smooth homotopy sphere \(M\) retaining the product \(q+\sigma\) on the open set below, there is a uniform constant \(\kappa>0\) depending on the fixed local geometry such that
\[
 Y(M,[g])=0\quad\Longrightarrow\quad
 E_+(g)=E_-(g)\ge 8\pi^2+\frac{\kappa}{4}.
\]
The proof gives an existence constant through a local variational infimum. It also yields a smaller gap for negative Yamabe constants sufficiently close to zero.

## Fixed region and holonomy

Use the planar coordinates of the marking, with the holes centered at \(b_\pm=(\pm1,0)\) and colatitude \(\phi\) on the sphere. For \(D_a(b)\) the open planar disk of radius \(a\) about \(b\), choose the connected open sets
\[
\begin{aligned}
 \Omega&=\big(D_3(0)\setminus(\overline D_{1/2}(b_-)\cup
      \overline D_{1/2}(b_+))\big)\times\{|\phi-\pi/2|<\pi/12\},\\
 K&=\big(D_{5/2}(0)\setminus(\overline D_{3/4}(b_-)\cup
      \overline D_{3/4}(b_+))\big)\times\{|\phi-\pi/2|<\pi/24\}.
\end{aligned}
\]
Fix any connected open \(\Omega_1\) with \(K\Subset\Omega_1\Subset\Omega\). The marked tubes to radius \(5/4\) are contained in the two bands \(|\phi-\phi_i|\le5/64\), where \(\phi_i=\pi/3,2\pi/3\). The colatitude separation between these centers and \(\Omega\) is at least \(\pi/12>5/64\). The compactification scale is one on the marked pants core. Thus \(\Omega\) survives both surgeries and every transition in the issue with smooth fixed metric \(g_0=q+\sigma\). It has \(R_{g_0}=0\) and \(W_{g_0}=0\).

Choose a point \(p_0\) on the equator and let \(o=(0,p_0)\). The marked loop \(x\), the circle of radius one around \(b_-\) at \(p_0\), lies in \(K\) and is freely homotopic in the pants to its left cuff. Developing the hyperbolic plane in upper-half-plane coordinates \((x_1,z)\) puts this cuff holonomy in the form \((x_1,z)\mapsto(\lambda x_1,\lambda z)\), where \(\lambda=e^L\) or \(e^{-L}\) according to the orientation and choice of axis endpoints. This follows by lifting the geodesic cuff to the axis of its length-\(L\) translation, for instance in the universal cover of the hyperbolic double of the pants. On the lifted product the map
\[
 (x_1,z,p)\longmapsto(x_1,zp)\in\mathbb R^4
\]
pulls back the Euclidean metric to \(z^2g_0\). In particular it gives a conformal developing map for the restriction to \(K\), with holonomy along \(x\) given by Euclidean dilation by \(\lambda\).

Every Möbius conjugate of this dilation has two fixed points on \(S^4\), at least one finite in \(\mathbb R^4\). At that finite fixed point the derivative has eigenvalues all equal to \(\lambda\) or all equal to \(\lambda^{-1}\). This follows by smooth conjugation at either original fixed point, using inversion coordinates at infinity. A Euclidean isometry has orthogonal derivative, so the holonomy is not conjugate into the Euclidean isometry group. A flat conformal representative on \(K\) would give a Euclidean developing map by integrating a parallel coframe on its simply connected universal cover. The transitions for that development have Euclidean isometry holonomy even if the representative is incomplete. By Liouville uniqueness, the two conformal developing maps on the connected universal cover differ by a single Möbius transformation. Hence no smooth positive conformal scale on \(K\) gives a flat representative. This uses the cuff multiplier, which is stronger than nonidentity of the holonomy. [Frances, §4.2, Fact 4.1 and equation (8)](https://ems.press/content/serial-article-files/43352#page=21)

## Local Ricci floor

For a four-metric \(h\), put \(S_h=\operatorname{Ric}_h-R_h h/4\). For \(v>0\) smooth on \(\Omega_1\) write
\[
 \mathcal D_K(v)=\int_K |S_{v^2g_0}|_{v^2g_0}^2\,dV_{v^2g_0}.
\]
This integral is invariant under multiplying \(v\) by a positive constant. As a covariant two-tensor \(S\) is unchanged under constant metric scaling, while its squared norm and the volume density scale by inverse factors in dimension four. The integral is continuous under \(C^2(\overline K)\) convergence to a positive function.

With \(\Delta=\operatorname{div}\nabla\), define
\[
 \kappa=\inf\{\mathcal D_K(v): v\in C^\infty(\Omega_1),
             \ v>0,\ v(o)=1,\ \Delta_{g_0}v=0\}.
\]
The constant function shows finiteness. If the infimum were zero, choose a sequence with \(\mathcal D_K(v_j)\to0\). Harnack chains based at \(o\) give upper and positive lower bounds on each compact subset of \(\Omega_1\). Interior estimates for the fixed Laplace operator and a diagonal extraction give a positive harmonic limit \(v_\infty\), with convergence in \(C^2\) on \(\overline K\). In particular \(S_{v_\infty^2 g_0}=0\) on \(K\). Harmonicity gives \(R_{v_\infty^2g_0}=-6v_\infty^{-3}\Delta_{g_0}v_\infty=0\) and conformal invariance gives \(W_{v_\infty^2g_0}=0\). The curvature decomposition then makes \(v_\infty^2g_0\) flat, contradicting the cuff holonomy. Thus \(\kappa>0\). The uniformity is over conformal scales and completions of this fixed representative. The same proof applies separately to a different fixed hyperbolic pants representative with geodesic cuffs. [Gilbarg–Trudinger, interior estimates and Harnack inequality](https://doi.org/10.1007/978-3-642-61798-0)

## Closed zero and nearby negative Yamabe constants

On the closed \(M\), write \(Y=Y(M,[g])\) and choose a smooth unit-volume Yamabe minimizer \(h=u^2g\), with \(u>0\), \(R_h=Y\) and \(\int_M u^4\,dV_g=1\). The four-dimensional conformal scalar equation is \(-6\Delta_g u+R_g u=Y u^3\). If \(Y=0\), then \(u/u(o)\) is an admissible harmonic scale for \(\kappa\). Thus \(\int_M |S_h|_h^2\,dV_h\ge\kappa\). [Yamabe existence and conformal scalar equation](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf)

Use Hilbert–Schmidt norms on the real Weyl operators \(W^\pm\) on self-dual and anti-self-dual two-forms. Signature gives \(E_+-E_-=12\pi^2\tau(M)=0\). Each chiral integral is conformally invariant, so write \(e=E_+(g)=E_-(g)\). In this norm convention Chern–Gauss–Bonnet reads
\[
 8\pi^2\chi(M)=
 2e-\frac12\int_M |S_h|_h^2\,dV_h+
 \frac1{24}\int_M R_h^2\,dV_h .
\]
In the tensor-norm convention the Weyl coefficient is \(1/4\), since \(|W|_{\rm tensor}^2=4(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)\). In unit volume and with \(\chi(M)=2\) this gives the exact identity
\[
 e=8\pi^2+\frac14\int_M |S_h|_h^2\,dV_h-\frac{Y^2}{48}.
\]
At \(Y=0\) it yields the claimed gap in each sign. [Chang–Gursky–Yang, equation (0.2) with their \(A=\operatorname{Ric}-Rg/6\)](https://arxiv.org/pdf/math/0409583#page=2) · [Master normalization](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

For a sequence of completions with \(Y_j\uparrow0\) from below, the unit-volume scales satisfy \(\Delta_{g_0}u_j=|Y_j|u_j^3/6\) on \(\Omega\). In particular they are positive subharmonic and \(\int_\Omega u_j^4\,dV_{g_0}\le1\). The interior local \(L^4\)-to-sup estimate for subharmonic functions on fixed coordinate balls gives \(\sup_{\Omega_1}u_j\le C\), by covering \(\overline{\Omega_1}\) with finitely many balls whose enlarged balls lie in \(\Omega\). Now \(v_j=u_j/u_j(o)\) solves \(\Delta_{g_0}v_j=(|Y_j|u_j^2/6)v_j\), with uniformly bounded zeroth-order coefficient on \(\Omega_1\). Harnack and \(v_j(o)=1\) bound \(v_j\) above and away from zero on compact subsets. More precisely the equation is \(\Delta_{g_0}v_j=a_jv_j^3\) with \(a_j=|Y_j|u_j(o)^2/6\to0\). Interior \(W^{2,p}\) bounds for \(p>4\) and then Schauder estimates give a subsequence converging locally in \(C^2\) to a positive harmonic \(v_\infty\) on \(\Omega_1\). Thus any such sequence with \(\mathcal D_K(v_j)<\kappa/2\) would contradict \(\mathcal D_K(v_\infty)\ge\kappa\). [Gilbarg–Trudinger, Theorems 8.17 and 8.20 and interior regularity](https://doi.org/10.1007/978-3-642-61798-0)

Consequently there is some \(\eta>0\) such that all completions under consideration with \(-\eta<Y<0\) satisfy \(\int_M |S_h|_h^2\,dV_h\ge\kappa/2\). Shrinking \(\eta\) to at most \(\sqrt{3\kappa}\) gives \(e\ge8\pi^2+\kappa/16\) on that negative interval. Both \(\eta\) and the energy margin are existence constants. The negative extension uses the subharmonic sign and unit-volume normalization. The sign and energy of a specified positive completion, and the energy at more negative \(Y\), require separate estimates.
