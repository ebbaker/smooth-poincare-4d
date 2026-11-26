# Signed Weyl budget of an inverse-facing connection cap

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. This is the bounded E02b calculation requested for Sol/ultra. Actual serving settings are unavailable. The input is the stipulated first diagonal in [connection-cap issue revision 1](../research-progress/handoffs/CONNECTION_CAP_ISSUE_20261126.md), working blob `c510d0817f71`, at HEAD `1c81a3048c8c`. The signed boundary convention and entry normalization are from the [product-circle calculation](../../../master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex#L525) and the [07 overview](../research-overview/OVERVIEW.md#what-would-establish-entry).

## Trace-free estimate and fiber integral

Let $D$ be a smooth compact oriented disk and let $g$ be a smooth Riemannian connection metric on its framed $S^2$ bundle, with positive base-dependent fiber radius and an arbitrary smooth positive conformal multiplier. Divide out the multiplier and the square of the fiber radius. The resulting representative has unit round fibers, the same $SO(3)$ horizontal distribution and the adjusted base metric $q$. Write $K$ for the Gaussian curvature of $q$ and $b$ for the curvature vector of the connection evaluated on a positively oriented $q$-orthonormal pair. In the normalized metric the volume disintegrates as $dA_q\,d\omega$, where $d\omega$ has total mass $4\pi$ on the unit sphere. Each $|W^\pm|_{\mathrm{HS}}^2dV$ is pointwise conformally invariant in four dimensions, since the Hodge star on two-forms is unchanged and the squared Weyl-operator norm and volume scale with opposite weights.

For a real symmetric trace-free $3\times3$ matrix $S$ with first diagonal entry $d$, its other diagonal entries sum to $-d$. Hence $\lVert S\rVert_{\mathrm{HS}}^2\ge\tfrac32d^2$, with equality exactly when $S=\operatorname{diag}(d,-d/2,-d/2)$ in that basis. Use the stipulated diagonal

$$
d_\pm=\frac{K+1-|b\times p|^2\mp3b\cdot p}{3},\qquad p\in S^2(1).
$$

At a fixed base point write $a=K+1$, $x=|b|^2$, and $t=(b\cdot p)/|b|$ when $b\ne0$. The normalized fiber moments are $\overline{t^2}=1/3$, $\overline{t^4}=1/5$, and the signed cross term averages to zero by $t\mapsto-t$. The formula extends to $b=0$ directly. Thus for either chirality,

$$
\begin{aligned}
\overline{(3d_\pm)^2}
 &=\overline{(a-x(1-t^2)\mp3\sqrt{x}\,t)^2}\\
 &=P(K,x):=(K+1)^2-\tfrac43(K+1)x+\tfrac8{15}x^2+3x,\\
\int_{S^2}|W^\pm|_{\mathrm{HS}}^2\,d\omega
 &\ge \tfrac{2\pi}{3}P(K,x).
\end{aligned}
$$

The factor is $4\pi(3/2)/9$. The estimate is optimal given only a prescribed diagonal and the trace constraint. When the connection is flat it agrees with the exact product formula, since $W^\pm=(K+1)\operatorname{diag}(1/3,-1/6,-1/6)$. Reversal of the four-dimensional orientation exchanges the chiralities. Reversal of the base orientation changes the sign of the oriented curvature component. The fiber integral gives the same lower bound in both signs.

## Square completion and radius

The polynomial has the exact identities

$$
\begin{aligned}
P(K,x)&=(K+1-\tfrac23x)^2+3x+\tfrac4{45}x^2\\
      &=4K+(K-1-\tfrac23x)^2+\tfrac13x+\tfrac4{45}x^2.
\end{aligned}
$$

Consequently $P(K,x)\ge4K$ for every real $K$ and $x\ge0$, with equality only at $K=1$, $x=0$. The coefficient $4$ is optimal for a universal bound of this linear form, as seen at that pair. At fixed $K$, minimization over $x\ge0$ gives the sharper pointwise elimination

$$
\min_{x\ge0}P(K,x)=\varphi(K):=(K+1)^2-\tfrac56(K-\tfrac54)_+^2,
\qquad x_{\min}=\tfrac54(K-\tfrac54)_+.
$$

Suppose the complete cap base boundary in the normalized gauge has the length and signed geodesic curvature of the inverse-facing hyperbolic germ of radius $\rho>0$. In the Gauss–Bonnet convention positive for the boundary of a Euclidean disk, these are $2\pi\sinh\rho$ and $-\coth\rho$. For example, the base germ is $ds^2+\sinh^2(\rho+s)d\theta^2$ with $s$ increasing into the cap, so the normal component of the unit tangent acceleration is $-\coth\rho$. Disk Gauss–Bonnet gives

$$
C:=\int_D K\,dA_q=2\pi-\int_{\partial D}k_g\,ds_q=2\pi(1+\cosh\rho).
$$

It follows that the cap obeys, for each sign,

$$
E_\pm(g;\mathrm{cap})
\ge \tfrac{2\pi}{3}\int_D P(K,|b|^2)\,dA_q
\ge \frac{16\pi^2}{3}(1+\cosh\rho)
>8\pi^2.
$$

The lower bound has infimum $32\pi^2/3$ as a function of $\rho>0$. If the area $A=\operatorname{Area}_q(D)$ is also given, convexity of $\varphi$ gives $E_\pm\ge(2\pi/3)A\varphi(C/A)$. Optimizing this algebraic estimate over $A>0$ recovers the same radius bound, since $\varphi(m)\ge4m$ with equality at $m=1$. Attaining the radius bound in a metric would require $K\equiv1$ and $b\equiv0$. A smooth match of the full normalized hyperbolic product germ forces $K=-1$ at the boundary and hence a strictly positive integral of the remainder in the square completion. The calculation establishes algebraic sharpness and leaves the geometric infimum over smoothly matched caps undetermined.

## Matching and scope

Apply Gauss–Bonnet to the full base disk through the transitions. Smooth changes in $q$, fiber radius, connection or conformal multiplier inside that disk are included when the normalized connection ansatz holds on the whole cap and the final base boundary data are as stated. Fiber disintegration and the prescribed diagonal are needed throughout this region. If a connector leaves the ansatz before the inverse-facing boundary, applying the formula on a truncated disk uses that disk's own signed boundary curvature. A connector on the exterior side of the qualifying disk only adds a nonnegative contribution to either closed Weyl integral. Thus, conditional on the stipulated diagonal and the matching hypotheses, this cap alone obstructs the strict energy condition on any closed assembly. No scalar-curvature or Yamabe hypothesis on the cap or exterior enters the estimate.
