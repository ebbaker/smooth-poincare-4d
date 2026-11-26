# Independent readback of the funnel completion

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E03c analytical review at working HEAD `1c81a3048c8c`. The lead selection was GPT-6.2 Astra/ultra and the issue requested GPT-6.2 Sol/ultra for this reading. Actual serving model and reasoning effort were unavailable. Inputs were the [issue](../research-progress/handoffs/FUNNEL_READBACK_20261126.md) at `0047e41d7299`, the [funnel construction](../notes/FUNNEL_EXTERIOR.md) at `f7a0b11baea1`, the [marked assembly](../notes/MARKED_CONNECTION_ASSEMBLY.md) at `bee42e4488db`, and the [longitude calculation](../notes/HYPERBOLIC_EXTERIOR.md) at `03c4886b6022`.

The three ends complete smoothly on the same framed exterior. Their scalar curvature is nonnegative, and the entire Weyl cost of the closed trial is localized to the two prescribed bands. The exact convex interpolation has strictly negative scalar curvature on an open subset of **each** band. The proposed strict scalar-deficit test still implies positive closed Yamabe sign for any fixed assembled trial. The actual Yamabe sign and the strict energy budget remain unresolved.

## Compactification and identification relative to the tubes

Let $q$ be the marked hyperbolic pants metric with geodesic boundary. In signed normal distance $r$ near a boundary component of length $2\pi\ell$, the tangential Jacobi field solves $a''=a$ with $a(0)=\ell$, $a'(0)=0$. Thus the product metric on a funnel can use $q=dr^2+\ell^2\cosh^2r\,d\eta^2$ on both sides of the join. The four-dimensional product $g_0=q+g_{S^2(1)}$ has $R_{g_0}=0$ and $W_{g_0}^\pm=0$ because the two sectional curvatures sum to zero. The collars and all three normal disk completions lie off the two enlarged tube images. [Funnel construction](../notes/FUNNEL_EXTERIOR.md) · [Marked tube coordinates](../notes/MARKED_CONNECTION_ASSEMBLY.md)

The normalization of $u$ gives $u=1$ on $F$ and through $r\le 1/2$. On each attached funnel, with $\Delta=\operatorname{div}\nabla$,

$$
 \Delta_{g_0}u=(\cosh r)^{-1}(\cosh r\,u')',\qquad
 (\cosh r\,u')'=-B^{-1}(h'\tanh r+h\,\operatorname{sech}^2 r).
$$

Consequently $R_{u^2g_0}=-6u^{-3}\Delta_{g_0}u\ge0$. For $r\ge1$, $u=B^{-1}\operatorname{sech}r$ and $v=\arcsin(\operatorname{sech}r)$ satisfies $dv=-\operatorname{sech}r\,dr$. The end metric is exactly

$$
 B^{-2}(dv^2+\sin^2 v\,g_{S^2}+\ell^2d\eta^2).
$$

In Cartesian normal coordinates $z=vp$, the radial part is the pullback of the round three-sphere metric by $z\mapsto(\cos|z|,\tfrac{\sin|z|}{|z|}z)$. It is smooth and positive definite at $z=0$. The product with the circle therefore has scalar curvature $6B^2$ through the added core and zero Weyl curvature by continuity. This works for every positive length $2\pi\ell$. [Lee–Parker, §1, conformal scalar formula](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf)

For the relative identification, keep the identity on a compact region of $\operatorname{int}F\times S^2$ containing the radius-$5/4$ tubes. In each remaining corner collar use the same underlying point of $\partial F$, labeled by its arclength angle, and keep $p$ unchanged. A product rounding is parametrized by a smooth arc in the two inward collar coordinates of $F\times D^3$. Reparametrize this arc by the extended funnel coordinate, making the map the identity on the interior face where it joins the fixed region. Near the disk core use the product radial map $z=vp\mapsto cvp$ for $c>0$ in the original normal $D^3$. Away from the core, extend by a strictly monotone smooth interpolation of the radial parameters. The linear choice at the core ensures a smooth map and inverse in Cartesian coordinates. Relative collar and rounding uniqueness allow the same identification with another compatible small rounding, supported away from the enlarged tubes. The map preserves orientation because it fixes an open set on the connected presurgery boundary. Its restriction fixes the attaching circles, the whole framed tubes, and the closing maps. [Wall, §2.6, Propositions 2.6.2 and 2.6.4](https://people.math.ethz.ch/~dkosanovic/24-FS/Wall-Differential-Topology.pdf)

## Cap orientation and exact localization

Both disks have the hyperbolic radial factor $a(t')=\sinh t'$ with smooth disk center. The outward disk derivative at $t'=1$ gives $a'(1)/a(1)=+\coth 1$ for the boundary geodesic curvature convention in disk Gauss–Bonnet. The smooth transverse coordinate $s=t'-1$ continues as framed tube radius minus one, keeping the same $\theta,p$. On both sides of the join the exact metric is

$$
 g_c=ds^2+\sinh^2(1+s)d\theta^2+g_{S^2(1)}.
$$

The outward normals of the cap and exterior point in the $+\partial_s$ and $-\partial_s$ directions, respectively. For the standard orientations on the marked planar and normal factors, the pullback of the exterior volume orientation by $\Phi_i$ has sign $-dt\wedge du\wedge dv\wedge dw$. In radial tube coordinates this has sign $ds\wedge dt\wedge dA_{S^2}$. Thus the boundary orientation from the exterior is $-dt\wedge dA_{S^2}$, and that from the cap is $+d\theta\wedge dA_{S^2}$. The specified closing reverses boundary orientation and matches the entire two-sided metric germ. On the outer germ the identification fixes the coordinates on the same marked tube in the pants product. [Closing and inverse](../notes/MARKED_CONNECTION_ASSEMBLY.md#the-attaching-maps-exterior-and-inverse)

The compactified exterior and both caps are Weyl-flat, including the exact germs. Hence for the chiral Hilbert–Schmidt convention, $E_\pm(M)=\sum_i E_\pm(U_i)$ on the glued smooth metric. Each outer marked longitude projects to a relator in the hyperbolic pants, by homotoping its fixed planar translation to zero inside $F$. Its conformal holonomy is nonidentity by faithfulness of the pants development. On the cap side the corresponding longitude extends over the disk at fixed $p$ and has identity conformal holonomy. An everywhere Weyl-flat band with both exact germs would give conjugate holonomies for these homotopic loops. This excludes zero **combined** energy in either band. Signature zero gives equality of the two **closed** chiral energies. The criterion for the strict budget is $\sum_i(E_+(U_i)+E_-(U_i))<16\pi^2$. [Marked longitude calculation](../notes/HYPERBOLIC_EXTERIOR.md)

## Negative scalar curvature in the prescribed interpolation

Write $g_X=\Phi_i^*(q+g_{S^2})$ on a tube, $k=g_c-g_X$, and $g=g_X+\beta k$ with $\beta(s)=1-H(16s-1)=H(2-16s)$. Put $s_0=1/8$. For $\tau=2-16s\downarrow0$, $H(\tau)=a(\tau)e^{-1/\tau}$ with $a$ smooth and $a(0)>0$. Thus $\beta''>0$ near $s_0$ and $\beta,\beta',\beta'^2=o(\beta'')$. The second derivative part of the scalar variation at $g_X$ is $\nabla^i\nabla^j(\beta k_{ij})-\Delta\operatorname{tr}_{g_X}(\beta k)$. Since $R_{g_X}=0$, only the $\beta''$ coefficient survives after division by $\beta''$ and passage to the outer endpoint. This follows also from the coordinate expression for scalar curvature, which is linear in the second derivatives with smooth metric coefficients, with lower-order terms quadratic in the first derivatives. At each fixed $\theta,p$ the resulting limit is

$$
 \lim_{s\uparrow s_0}\frac{R_g(s,\theta,p)}{\beta''(s)}
 =-|ds|_{g_X}^2\operatorname{tr}_{g_X|T\{s=s_0\}}k|_{s=s_0}.
$$

Indeed the principal expression is $|ds|^2(k(n,n)-\operatorname{tr}_{g_X}k)$ for $n=(ds)^{\sharp_{g_X}}/|ds|_{g_X}$. In the framed sphere take $p=(1,0,0)$ and the sphere tangent $Z=(0,0,1)$. Under $\Phi_i(t,(1+s)p)$ this variation changes only physical latitude. Thus $g_X(Z,Z)=\epsilon^2(1+s)^2$, while $g_c(Z,Z)=1$. The trace of $g_c$ on the three-dimensional tangent hyperplane with the $g_X$ inner product is at least the ratio on this direction. Hence at $s_0$

$$
 \operatorname{tr}_{g_X|T\{s=s_0\}} k
 \ge \frac{1}{\epsilon^2(1+s_0)^2}-3
 =\frac{16384}{81}-3>0.
$$

At such points $R_g<0$ for $s<s_0$ sufficiently close to $s_0$, and smoothness gives open negative-scalar regions on both bands. The result uses the specified flat cutoff and framed radius, and holds for every hyperbolic pants metric in this trial. It excludes the pointwise scalar-nonnegative shortcut for this interpolation. The closed conformal Laplacian still requires an estimate. [Prescribed convex interpolation](../notes/FUNNEL_EXTERIOR.md)

## The critical estimate for a fixed trial

On the connected closed smooth assembled $(M,g)$ the scalar curvature is nonnegative off the two bands. Fix a smooth $V\ge0$, positive somewhere, supported in a retained positive-scalar tail and bounded by $R_g$ there. The form $A(f)=6\|df\|_2^2+\int_M Vf^2\,dV_g$ controls $\|f\|_2^2$. Otherwise a normalized $L^2$ sequence with $A(f_j)\to0$ would have $df_j\to0$ in $L^2$ and converge strongly in $L^2$ along a subsequence to a constant by compactness of $H^1\hookrightarrow L^2$. The potential forces that constant to be zero, contradicting normalization. Together with $A\ge6\|df\|_2^2$, this gives $H^1$ coercivity. The critical embedding $H^1\hookrightarrow L^4$ in dimension four is **continuous**. It is noncompact, as seen from rescaled smooth bumps in one chart with bounded gradients and $L^4$ norm bounded away from zero, while their $L^2$ norm tends to zero. Continuity and coercivity give $\Lambda(g,V)=\inf_{f\in H^1\setminus\{0\}} A(f)/\|f\|_4^2>0$. The same argument applied to the full presurgery compactification with its nonnegative scalar curvature proves its positive Yamabe sign. [Lee–Parker, Theorem 2.2(a)–(b) and §3](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf)

Write $R_-:=\max(0,-R_g)$ and $\delta=(\|R_-\|_{L^2(U_1)}^2+\|R_-\|_{L^2(U_2)}^2)^{1/2}$. Pointwise $R_g\ge V-R_-$ and $R_-$ is supported in the bands. Hölder implies

$$
 \int_M(6|df|_g^2+R_g f^2)\,dV_g\ \ge\ (\Lambda(g,V)-\delta)\|f\|_4^2.
$$

The strict inequality $\delta<\Lambda(g,V)$ therefore gives $Y(M,[g])\ge\Lambda(g,V)-\delta>0$ on that one closed trial, using the closed conformal Laplacian. Uniform positivity of $\Lambda$ across the unrestricted allowed band interpolations fails for fixed retained $V$. Rescale one allowed metric to $b_L^2g$, with $b_L=1$ outside a compact subset of one band and $b_L=L$ on a smaller open set inside it. The volume grows without bound as $L\to\infty$ while $\int V\,dV$ stays fixed. Testing $\Lambda$ on $1$ gives the upper bound $\int V\,dV/\operatorname{Vol}(M)^{1/2}\to0$. The sign estimate needs control of the band geometry or a fixed metric estimate. [Proposed sufficient criterion](../notes/FUNNEL_EXTERIOR.md)
