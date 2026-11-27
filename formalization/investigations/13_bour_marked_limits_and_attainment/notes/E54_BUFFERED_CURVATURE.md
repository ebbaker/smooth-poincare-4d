# FOT-E54 · Curvature of the buffered Euclidean cap

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 07 Route 13 calculation. Input checkout `b607bd17e79598edd18beb6d02f69fed80d72f4d`, with Lean `4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` and Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. Actual serving model and effort were unavailable. [E53 metric](E53_BUFFERED_TRUNCATION.md) · [Lean calculation](../../../SmoothPoincare/Variational/BourBufferedCapCurvature.lean)

## The physical tensor in the transition

Fix $r>0$ and $b>r$. Let $Q$ be the actual scaled inverse stereographic chart of the E53 smooth Riemannian metric on the closed sphere, and set $\rho=|x|$ for a Euclidean chart point $x$. On the full native chart $Q^*g=\lambda(\rho)^2\delta$ for the E53 positive factor $\lambda$. An explicit smooth potential for this pullback is
\[
 F(x)=H\left(\frac{|x|^2}{4}\right),\qquad
 H(q)=\operatorname{smoothTransition}(4q/b^2-1)
         \log\frac{2r}{r^2+4q}.
\]
The product is identically zero for $q\le b^2/4$. This gives a smooth function on the whole real line even though the logarithm alone is only used where its argument is positive. In the actual chart $e^{F(x)}=\lambda(\rho)$.

Write $\sigma=H'(\rho^2/4)/2$ and $\tau=H''(\rho^2/4)/4$. The flat differential and Hessian are
\[
 dF(u)=\sigma\langle x,u\rangle,\qquad
 D^2F(u,v)=\sigma\langle u,v\rangle+
       \tau\langle x,u\rangle\langle x,v\rangle.
\]
The proof obtains the Hessian by the scalar composition rule applied to the flat potential $|x|^2/4$. Substituting these two jets in the Levi–Civita conformal curvature identity and lowering with the conformal metric gives the full native tensor. In the convention $\mathrm{Rm}(u,v,v,u)$ for a sectional numerator, set
\[
 \begin{aligned}
 D(u,v,w,z)&=\langle u,z\rangle\langle v,w\rangle-
                 \langle u,w\rangle\langle v,z\rangle,\\
 N(u,v,w,z)&=x_u x_z\langle v,w\rangle+x_v x_w\langle u,z\rangle
              -x_u x_w\langle v,z\rangle-x_v x_z\langle u,w\rangle,
 \quad x_u=\langle x,u\rangle.
 \end{aligned}
\]
The tensor on the sphere evaluated on the $dQ$ images is
\[
 \mathrm{Rm}_g(dQ,u,dQ,v,dQ,w,dQ,z)
 =\lambda^2\left[(-2\sigma-\sigma^2\rho^2)D+
                     (\sigma^2-\tau)N\right].
\]
This identity uses curvature naturality for the same chart and the exact metric equality on its whole domain. It applies through both transition seams. The flat germ has both jets zero. On the unit round germ $H(q)=\log(2r/(r^2+4q))$, so $\sigma=-2/(r^2+\rho^2)$ and $\tau=\sigma^2$, and the physical sectional value is one. [E53 metric](E53_BUFFERED_TRUNCATION.md) · [Pinned conformal Riemann identity](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Metric/Conformal/Curvature.lean)

## Orthonormal curvature and Euler normalization

Set $s(\rho)=\int_r^\rho\lambda(t)\,dt$ and use the angular radius $f(s(\rho))=\rho\lambda(\rho)$. The derivative of $\lambda$ is $\lambda\rho\sigma$, so
\[
 f'(s(\rho))=1+\rho^2\sigma,\qquad
 f''(s(\rho))=\frac{2\rho\sigma+\rho^3\tau}{\lambda}.
\]
For $\rho>0$, take a Euclidean orthonormal frame with its index zero equal to $\pm x/\rho$ and transport its vectors by $dQ\circ(\lambda^{-1}\operatorname{Id})$ to a physical oriented orthonormal frame. For slots $a,b,i,j$ of the framed operator, evaluate $\mathrm{Rm}(e_a,e_b,e_j,e_i)$ in the physical basis. In native coordinates $D$ gives the alternating Kronecker product. The $N$ coefficient is $\rho^2D$ when $a=0$ or $b=0$, and zero otherwise. Both radial signs give the same coefficient. Thus the four-index framed tensor has the two values
\[
 A=-\frac{f''}{f}=\frac{-2\sigma-\rho^2\tau}{\lambda^2},\qquad
 B=\frac{1-(f')^2}{f^2}=\frac{-2\sigma-\rho^2\sigma^2}{\lambda^2},
\]
with every off-diagonal wedge entry zero. Its intrinsic Euler coefficient is $6AB$ in the $8\pi^2\chi$ normalization. It gives the radial density $-12\pi^2 f''(1-(f')^2)$ after multiplication by the independently computed physical pushforward $2\pi^2f^3\,ds$. [E52 Pfaffian and normalization](E52_CLOSED_CAP.md) · [Variable-profile integral interface](../../../SmoothPoincare/Variational/BourVariablePolarCap.lean)

The native theorem verifies four-slot curvature directly, and the frame theorem converts its coefficients to the physical arclength expressions from a local matching identity for the smooth profile. The accompanying frame and volume constructions supply the inputs for the capped Euclidean model. The marked finite ALE end family, simultaneous nonflat metric cutoff and closed Euler exhaustion are separate dependencies of the nonflat Bour application.

`lake build SmoothPoincare.Variational.BourBufferedCapCurvature` passed against the pins above. Lean's axiom inspection for both `bourBufferedCapCurvature_native` and `bourBufferedCapCurvature_frame` reports only `propext`, `Classical.choice` and `Quot.sound`.
