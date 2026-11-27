# FOT-E54 · Independent physical cap check

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Route 13 execution read requested GPT-6.2 Sol/ultra. Actual serving model and effort were unavailable. Baseline `b607bd17e79598edd18beb6d02f69fed80d72f4d`. The E54 working sources had SHA-256 prefixes `6a758d9a9c0d` (Warp), `962f624e52ab` (Frame), `f3f7c9b89760` (Volume), `1b1ede2046ba` (Curvature) and `8482df637bbc` (Euler). [Route 13 register](../13_bour_marked_limits_and_attainment/research-progress/REGISTER.md) · [E53 marked metric](../13_bour_marked_limits_and_attainment/notes/E53_BUFFERED_TRUNCATION.md) · [E54 request](../research-progress/handoffs/ED07_E54_PACKETS_20261127.md)

For every $0<r<b$, the physical external cap of the smooth Riemannian Euclidean control contributes $16\pi^2$ to the Euler integral in the $8\pi^2\chi$ normalization. The closed outward-first oriented carrier is the same standard smooth four-sphere containing the marked Euclidean disk. The disk lies in the flat region, so the entire carrier has the same integral. [Physical Euler application](../../SmoothPoincare/Variational/BourBufferedCapEuler.lean)

## Profile and volume

The inverse stereographic chart $Q\colon\mathbb R^4\to S^4\setminus\{N\}$ identifies the retained disk with $\rho=|x|\le r$ and pulls the metric back to $\lambda(\rho)^2\delta$. Put $q=\log\lambda$, $s(\rho)=\int_r^\rho\lambda(t)\,dt$, and $L=\lim_{\rho\to\infty}s(\rho)$. Since $ds/d\rho=\lambda>0$, the native inverse is smooth on $(0,L)$. There $f(s(\rho))=\rho\lambda(\rho)$ is positive. The entrance has $f=r+s$ because $r<b$ and $\lambda=1$ there. For $\rho\ge\sqrt2\,b$, the cutoff equals one and $\lambda=2r/(r^2+\rho^2)$. Integrating this factor gives $L-s(\rho)=2\arctan(r/\rho)$ and the round identity $f=\sin(L-s)$. The extended profile uses $r+s$ at $s\le0$ and $\sin(L-s)$ at $s\ge s(2b)$. The inverse profile agrees with the corresponding extension on the inner side of each join. The endpoint pairs $(f,f')$ are $(r,1)$ and $(0,-1)$. [Smooth profile](../../SmoothPoincare/Variational/BourBufferedCapWarp.lean) · [E53 polar metric and terminal distance](../../SmoothPoincare/Variational/BourBufferedTruncation.lean)

In dimension four the determinant factor for $\lambda^2\delta$ is $\lambda^8$, giving the physical measure factor $\lambda^4$. The stereographic chart omits a null pole and takes the null Euclidean boundary sphere to the seam. The cap therefore pushes forward under $\rho$ to $2\pi^2\rho^3\lambda^4\,d\rho$ on $\rho>r$, with unit three-sphere area $2\pi^2$. The change of variables $ds/d\rho=\lambda$ gives $2\pi^2 f^3\,ds$ on $(0,L)$. Both identities include the transition and use the physical metric whose curvature is computed below. [Physical volume transport](../../SmoothPoincare/Variational/BourMeasuredBufferedCap.lean)

## Curvature slots and normalization

For Euclidean unit radial and angular directions the Hessian of $q(\rho)$ has entries $q''$ and $q'/\rho$. The flat-background Schouten expression $-\mathrm{Hess}\,q+dq\otimes dq-\tfrac12|dq|^2\delta$ gives the Euclidean-frame radial entry $-q''+(q')^2/2$ and angular entry $-q'/\rho-(q')^2/2$. The physical sectional curvature is the sum of the two corresponding entries divided by $\lambda^2$. Direct differentiation gives $f'=1+\rho q'$ and $f''=(q'+\rho q'')/\lambda$, where primes on $f$ refer to $s$ and primes on $q$ refer to $\rho$. The resulting radial and tangential values are

$$
 A=-\frac{q''+q'/\rho}{\lambda^2}=-\frac{f''}{f},
 \qquad B=-\frac{2q'/\rho+(q')^2}{\lambda^2}=\frac{1-(f')^2}{f^2}.
$$

In the Lean calculation $q(\rho)=C(\rho^2/4)$. With $\sigma=C'/2$ and $\tau=C''/4$ at $\rho^2/4$, $q'=\rho\sigma$ and $q''=\sigma+\rho^2\tau$. The tangential coefficient is $(-2\sigma-\rho^2\sigma^2)/\lambda^2$. A radial plane adds $\rho^2(\sigma^2-\tau)/\lambda^2$, giving $(-2\sigma-\rho^2\tau)/\lambda^2$. An unoriented Euclidean radial-first basis gives an oriented physical orthonormal frame by the chart derivative with scale $\lambda^{-1}$ and orientation adjustment. The sign of its radial coordinate occurs quadratically. The lowered tensor uses $\mathrm{Rm}(u,v,v,u)$ for sectional curvature and the frame tensor swaps the two final arguments to read this as the $(a,b,a,b)$ operator entry. The off-diagonal wedge entries vanish. The entries $(0,i,0,i)$ give $A$, and $(i,j,i,j)$ for distinct positive indices give $B$. [Native conformal curvature and physical tensor](../../SmoothPoincare/Variational/BourBufferedCapCurvature.lean) · [Radial frame and sign](../../SmoothPoincare/Variational/BourBufferedCapFrame.lean) · [Lowered curvature convention](../../FirstOrderTwistor/GeometricChiralBlock.lean)

The three complementary pairs of planes each contribute $AB$ to the Pfaffian. The intrinsic Euler density is twice that Pfaffian, giving $6AB$. On the unit round germ both slots are $+1$, yielding density $6$. In the signed Weyl and ordinary Ricci normalization the same density is $\mathcal G=|W^+|_{\mathrm{HS}}^2+|W^-|_{\mathrm{HS}}^2-\tfrac12|\operatorname{Ric}_0|^2+R^2/24$. The unit-curvature scalar is $R=12$. Integrating against the radial measure gives

$$
 \int_C \mathcal G\,dV=-12\pi^2\left[f'-\frac{(f')^3}{3}\right]_{0}^{L}
 =-12\pi^2\left[-\frac23-\frac23\right]=16\pi^2 .
$$

The computation uses $f>0$ on the open interval when canceling its three powers. The remaining scalar integrand extends smoothly to both ends. In the physical application the frame is selected pointwise on the full-measure chart and the scalar density it supplies is measurable by its arclength expression. [Euler density and normalization](../../SmoothPoincare/Variational/IntrinsicEulerDensity.lean) · [Scalar integration](../../SmoothPoincare/Variational/BourVariablePolarCap.lean)

## Explicit physical sample at $r=2,b=3$

At $\rho=4$ the cutoff argument is $7/9\in(0,1)$. Its value is $h=(1+e^{-45/14})^{-1}$, and $\lambda=5^{-h}$. For the jet calculation put $t=\rho^2/9-1$, $a(t)=(1-t)^{-1}-t^{-1}$, and $q(\rho)=\log(4/(4+\rho^2))/(1+e^{-a(t)})$. At $\rho=4$ the derivatives $t'=8/9,t''=2/9$ and the logarithmic factor's derivatives $-2/5$, $3/50$ give $q'\simeq-1.54829712$ and $q''\simeq11.68858255$. These decimal values are diagnostics from those formulas and numerical arclength quadrature.

| Quantity at the marked physical point | Value |
| --- | ---: |
| $s(4)$ | $1.67814967$ |
| $\lambda,f$ | $0.21282976,\ 0.85131905$ |
| $f',f''$ | $-5.19318849,\ 212.40465851$ |
| Native and arclength radial densities | $2.59202484,\ 12.17886449$ |
| $A,B$ | $-249.50065218,\ -35.83224160$ |

The flat buffer $2<\rho<3$ contributes zero and has $s(3)=1$. At the start of the round region $\rho=\sqrt{18}$ the smooth round slope is $1-2\rho^2/(4+\rho^2)=-7/11$. Inserting the three slopes $1,-7/11,-1$ into the same primitive gives $19440\pi^2/1331$ on the transition and $1856\pi^2/1331$ on the round tail. Their sum is $16\pi^2$. The round tail also follows by integrating $12\pi^2\sin^3 u$ from $0$ to $2\arctan(2/\sqrt{18})$, whose endpoint cosine is $7/11$.

The application to a nonflat Bour limit still requires one simultaneous marked core from the actual flow, differentiated Euclidean-end charts, physical cutoff jets and volume on all buffers, retained integral transport, and the capped topology on that source. [E52 physical input ledger](../13_bour_marked_limits_and_attainment/notes/E52_CLOSED_CAP.md)

## Lean replay

`lake env lean investigations/reviews/E54_CAP_CHECKS.lean` passed with `import SmoothPoincare`. The replay uses the marked physical point at native radius four, with the two measured coordinates, the radial and tangential sectional slots, and a zero off-diagonal slot. It checks both measure pushforwards, the exact slope at the start of the round region, both primitive differences, the signed endpoint slopes, and the Euler values on the physical cap and closed carrier. All eleven audited public declarations depend only on `propext`, `Classical.choice` and `Quot.sound`. [Lean replay](E54_CAP_CHECKS.lean)
