# Native isolation of the transported metric

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution DEF-E03g, [issue 1](../../research-progress/handoffs/TRANSPORT_ON_THE_SELECTED_DISK_20261126.md), at working HEAD `19c187ad8dbe936cf165017c753a94add775ebaf`. The dispatch specifies GPT-6.2 Sol/ultra and independent serving model and effort are unavailable. The input SHA-256 prefixes are `69cba30478b8` for the delivery packet, `952edc992dfe` for the [deformation manuscript](../manuscript/deformation_of_marked_spherical_collars.tex), `c5ce2a1b550f` for [the isolation identities](ISOLATING_A_COUPLED_PATH.md), `8063d76ad687` for [E61 and its marked bicollar](../../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) and `fe25b0b69af4` for [E21's exact restart](../../../../master/notes/E21_ROUND_RESTART.md). The checked [companion transport](../../notes/TRANSPORT_ON_THE_CHARGED_DISK.md) had SHA-256 prefix `3afb193895a7`. The estimate is at one smooth source index in the actual marking and for a fixed joined path and conformal gauge.

Both affine isolations of the transported metric have a strictly positive $w^{-3}$ leading energy at an inner slice where the two tangential metrics are nonproportional. There is a two-sided finite error bound, uniform along the joined path, in each ambient chirality. The resulting isolated paths reach $8\pi^2$ on sufficiently thin positive native strips even when the joined transport stays strictly subcritical. All complete regions, including the part between the inner strip and the original face, enter the ledger.

## The marked slab and the two isolations

Fix a smooth oriented Riemannian homotopy four-sphere $M$ with a parametrized disk $D$, complete exterior $V$, and smooth source metric $g$. Write its Gaussian marking as $g=dt^2+h_t$, with $t=0$ at the original face and $t$ increasing toward $V$. At a fixed inner level $t_0<0$, put $h_\circ=h_{t_0}$. Use an available width $w_0>0$ so the closed slabs $A_w=[t_0-w/2,t_0+w/2]\times S^3$ of width $0<w\le w_0$ lie in the given Gaussian marking and strictly inward of the face. These are native widths in $g$. Define $x=(t-t_0)/w$ and $X=[-1/2,1/2]$. Fix any smooth $0\le\eta\le1$ on $X$ which equals zero near the inner end and one near the outer end. Extend $\chi_w=\eta(x)$ by zero toward the interior and by one through the remainder of $D$ and throughout $V$.

Let $H_s$, $0\le s\le1$, be the smooth joined path, with $H_0=g$. Its two closed affine isolations are

$$p_{s,w}=\chi_wg+(1-\chi_w)H_s,\qquad q_{s,w}=(1-\chi_w)g+\chi_w H_s.$$

Both are smooth metrics by positivity of convex combinations. On $A_w$ write them jointly as $G_{s,w,u}=(1-u)g+uH_s$ for $u=1-\eta,\eta$, respectively. Each $u$ is fixed before $w$ is chosen. Along the path the coefficients of $H_s$ are written in the original marking. In particular the affine isolation is computed after the transport and its specified conformal multiplier have been fixed.

At the endpoint the [marked transport](../../notes/TRANSPORT_ON_THE_CHARGED_DISK.md) permits $H_1=dt^2+k$ on the chosen inner plateau, with $k=\ell^2A^*\gamma_{\rm rd}$ for $\ell>0$ and an angular diffeomorphism $A$ isotopic to the identity. In that construction the Gaussian buffer parameter is $\epsilon$, $t_0=-\epsilon/2$, and the plateau has $|t-t_0|\le\epsilon/16$. Thus one may take $w_0\le\epsilon/8$. Locally the transported flat radial coordinate is $\rho(t)A(y)$ with $\rho'/\rho=1/\ell$ on that plateau. The multiplier $\ell^2/\rho^2$ on its pulled Euclidean metric gives $dt^2+k$. The angular change can be supported away from the original face using an angular isotopy. At any chosen $y_0$ an angular flow fixing $y_0$ with derivative having two different positive stretch factors at $y_0$ produces $k(y_0)$ nonproportional to $h_\circ(y_0)$ if the initially chosen round tensor was proportional. This is obtained from a locally linear vector field times a compactly supported angular cutoff. Freeze $A$, $\ell$ and the actual path before shrinking $w$. The original face retains its angular marking.

## The scaled leading curvature at all path times

For each $s,y$, freeze the incoming and joined full tensors at $(t_0,y)$ in the actual normal marking. For the frozen metric with coefficient $(1-u(x))g(t_0,y)+u(x)H_s(t_0,y)$ write the blocks as

$$
\begin{pmatrix}\alpha & b^{\mathsf T}\\ b & Q\end{pmatrix},\qquad
Q=(1-u)h_\circ+u(H_s)_{\mathrm{tan}}(t_0,y),\quad
n=(\alpha-b^{\mathsf T}Q^{-1}b)^{1/2},\quad \beta=Q^{-1}b.
$$

Here $b$ is the column of mixed covariant components and $n>0$. The frozen model lives on $X\times T_yS^3$ with coefficients independent of its affine tangential variables $Y$. Its expression is $n^2dx^2+Q(dY+\beta\,dx,dY+\beta\,dx)$. Translation $Z=Y+\int^x\beta$ removes the shift, and increasing proper normal coordinate $\tau=\int^x n$ gives $d\tau^2+Q(x(\tau))$. These changes preserve the chosen product orientation. Diagonalize $(H_s)_{\mathrm{tan}}(t_0,y)$ in an $h_\circ$-orthonormal basis. Its eigenvalues are $\lambda_i>0$, so the diagonal components of $Q$ are $q_i=1+u(\lambda_i-1)$ in that same basis throughout $X$. For a cyclic triple $(i,j,k)$ define

$$
a_i=\frac{\partial_x q_i}{2nq_i},\qquad B_i=-\frac{1}{n}\partial_x a_i-a_i^2-a_ja_k,\qquad B_i^\circ=B_i-\tfrac13\sum_m B_m.
$$

In the orthonormal frame the normal curvature is $-\partial_\tau a_i-a_i^2$ in plane $(0,i)$. The complementary tangential plane $(j,k)$ has curvature $-a_j a_k$ by Gauss, since the frozen tangential slices are flat. Mixed entries vanish by Codazzi on these slices. In the real chiral vectors $(e^0\wedge e^i\pm e^j\wedge e^k)/\sqrt2$, the curvature entries are $B_i/2$. Subtracting the scalar part gives $B_i^\circ/2$ in both signs. With physical energy $E_\sigma=\int|W^\sigma|_{\rm HS}^2dV$ the coefficient is therefore

$$
\Lambda_u(s)=\frac14\int_{X\times S^3} n\sqrt{\det_{h_\circ}Q}\sum_i |B_i^\circ|^2\,dx\,dA_{h_\circ}.\tag{1}
$$

This is the same coefficient in both signs. The finite physical integrals can differ. The determinant factor follows from the metric block determinant $n^2\det Q$. At the transport endpoint $n=1$, $b=0$ and $Q=(1-u)h_\circ+uk$. In particular the diagonal normal term becomes $-q_i''/(2q_i)+(q_i')^2/(4q_i^2)$, and the Gauss contribution remains $-q'_j q'_k/(4q_j q_k)$. This recovers the finite-amplitude mode coefficient `eq:fixed-a` in the manuscript when the shape is evaluated on that diagonal mode. No angular symmetry of the incoming metric is needed here, since the simultaneous diagonalization is pointwise at the frozen $y$. The frame-free formula below also gives continuity through repeated eigenvalues.

## Positivity of the coefficient

For any positive definite tangential path $Q(\tau)$ with clamped ends at fixed $y$, let $L=Q^{-1}\partial_\tau Q/2$ be its shape endomorphism, $m=\operatorname{tr}L/3$ and $S=L-m\mathrm{Id}$. Use a parallel orthonormal frame along the normal coordinate. The normal block and the complementary tangential block of the frozen curvature operator are $-\nabla_\tau L-L^2$ and $-\operatorname{cof} L$, respectively. The cofactor identity in dimension three gives $\operatorname{cof} L=L^2-(\operatorname{tr}L)L+e_2(L)\mathrm{Id}$, with $e_2$ the second elementary symmetric function. Thus the trace-free part of their sum is

$$-\nabla_\tau S-mS-2(S^2)^\circ.$$

If the coefficient in (1) vanishes, this matrix vanishes identically by continuity and positivity of the volume density. At each fixed $y$, the clamped initial interval has $L=0$, hence $S=0$ there. Uniqueness for the smooth matrix ODE $\partial_\tau S=-mS-2(S^2)^\circ$ in the parallel frame forces $S\equiv0$. The equation $\partial_\tau Q=2m Q$ then makes the two tangential end metrics proportional at that point. The argument applies to a general clamped positive definite tangential path, including one with moving eigenspaces. For the affine paths in (1), pointwise proportionality of the endpoint tensors also makes $Q$ a pointwise scalar path, so $\Lambda_u(s)=0$ in that case. Consequently a nonproportional pair somewhere on the slice forces $\Lambda_{1-\eta}(s),\Lambda_\eta(s)>0$ for every fixed such time $s$. In particular both are strictly positive at the prepared endpoint.

## Finite error and the first crossing

The following estimate holds for the same finite constant $C$ for both profiles, both signs and every $0\le s\le1$ after fixing the native slab, path and $w_0\le1$:

$$
\left|w^{3/2}\sqrt{E_\sigma(G_{s,w,u};A_w)}-\sqrt{\Lambda_u(s)}\right|\le Cw.\tag{2}
$$

To see the finite control, choose a finite angular atlas with a compactly buffered subchart cover. In coordinates at a point $y_0$, pull the metric back by $(x,Y)\mapsto(t_0+wx,y_0+wY)$ and multiply it by $w^{-2}$. Its coefficient matrix is exactly the original convex combination evaluated at the displayed point. At $(x,0)$ this dilated two-jet differs by at most $C_0w$ from the two-jet of the model frozen at $(t_0,y_0)$. Indeed two $x$ derivatives give the frozen term from $u''$, an $O(w)$ coefficient variation in that term, terms with $wu'$ times original derivatives, and second derivatives carrying $w^2$. Every angular derivative of the unfrozen coefficients has a factor $w$. The zeroth and first derivative comparisons follow from the same chain rule and the mean value estimate. The constant $C_0$ is controlled by the uniform original two-jet bounds in the atlas and the two fixed $C^2$ profile norms. Compactness of the supplied path and closed slab gives a common eigenvalue lower bound and upper bound on both families, by convexity. A finite atlas and, if necessary, smaller $w_0$ keep candidate charts within their buffers.

Measure both Weyl matrices in the same positively oriented reference frame via the positive metric square root. Multiply by $(\det_{dt^2+h_\circ}G)^{1/4}$ to express the integral in the fixed volume $dx\,dA_{h_\circ}$. The resulting matrix is a smooth function of positive zeroth and unrestricted first and second jets. Its derivative has a finite upper bound $C_1$ on the convex jet guard from the ellipticity and jet bounds, enlarged to include the line segments between compared jets. Choose the maximum over the finite reference frames and both signs. With frame changes included in $C_0$, one may take $C=C_0C_1\sqrt{\operatorname{Area}(S^3,h_\circ)}$. Curvature of the dilated metric is $w^2$ times the physical curvature operator at the point, and the physical volume adds one factor $w$ in the strip integral. Consequently the $L^2$ norm of its weighted matrix is $w^{3/2}\sqrt{E_\sigma}$, while the frozen norm is $\sqrt{\Lambda_u(s)}$ by (1). The triangle inequality yields (2). This proof covers the actual path times when the joined metric has nonzero mixed components or nonunit normal lapse.

For example (2) gives the two-sided finite interval

$$
w^{-3}\bigl(\sqrt{\Lambda_u(s)}-Cw\bigr)_+^2
\le E_\sigma(G_{s,w,u};A_w)\le
w^{-3}\bigl(\sqrt{\Lambda_u(s)}+Cw\bigr)^2.\tag{3}
$$

Let $b_* = \min_u\sqrt{\Lambda_u(1)}>0$. For any target $B>0$, the single native strip width choice

$$0<w<\min\left\{w_0,\frac{b_*}{2C},\left(\frac{b_*}{2\sqrt B}\right)^{2/3}\right\}$$

gives both endpoint connector energies greater than $B$ in each sign. Omit the middle bound if $C=0$. This chooses a finite width after the source and path. The constants may degenerate along the E61 sequence.

## Complete costs and the source comparison

Let $D_-$ be the disk portion inward of $A_w$ and $U$ the portion between its outer end and the original face, so $D=D_-\cup A_w\cup U$ up to shared boundaries of measure zero. For each sign use $g_B=E_\sigma(g;B)$, $h_B(s)=E_\sigma(H_s;B)$, $P_\sigma(s)=E_\sigma(p_{s,w};A_w)$ and $Q_\sigma(s)=E_\sigma(q_{s,w};A_w)$. The two complete sides at every time are

| Metric | Complete disk $D$ | Complete exterior $V$ |
| --- | --- | --- |
| $g$ | $g_{D_-}+g_{A_w}+g_U$ | $g_V$ |
| $H_s$ | $h_{D_-}(s)+h_{A_w}(s)+h_U(s)$ | $h_V(s)$ |
| $p_{s,w}$ | $h_{D_-}(s)+P_\sigma(s)+g_U$ | $g_V$ |
| $q_{s,w}$ | $g_{D_-}+Q_\sigma(s)+h_U(s)$ | $h_V(s)$ |

The initial flattening and conformal supports are inward of $A_w$ for the chosen small central ball. During those stages $p_{s,w}=H_s$ and $q_{s,w}=g$. The flattening increments are exactly the local changes on that support and the conformal stage adds zero. In the transport stage $H_s=c_s^2\Phi_s^*g^{\flat}$, where $g^{\flat}$ is the flattened metric and $\Phi_s$ is orientation preserving. Each $h_B(s)$ is then exactly $E_\sigma(g^{\flat};\Phi_s(B))$ by four-dimensional conformal invariance and change of variables. In the buffered parametrization, $D_-,A_w,U,V$ are separated by coordinate radii $1+t_0-w/2$, $1+t_0+w/2$ and $1$. Their images are the successive regions separated by the images of these three radii under the transport's increasing radial map. The angular map does not change any of those image regions. At the transported endpoint the full marked disk and its core are sent inside the flattened ball. Thus $h_D(1)=0$ and $h_V(1)=E_\sigma(g^\flat;M)$, including all transported charge. The joined peak is its flattening-stage peak since its post-flattening closed total is constant. The finite-index flattening construction can keep that peak below $2T$ by choosing the small ball once $e=E_\sigma(g;M)<2T$ is fixed. The two endpoint caps have positive Yamabe class by the explicit marked identifications, the disk cap with the round class and the exterior cap with the flattened source class. [Transport construction and side measures](../../notes/TRANSPORT_ON_THE_CHARGED_DISK.md)

Subtracting the original row from the table gives both signed side increments for every path. Using the notation of [the isolation identities](ISOLATING_A_COUPLED_PATH.md), their interaction and disk-side remainder are

$$
\begin{aligned}
J_\sigma(s)&=P_\sigma(s)+Q_\sigma(s)-h_{A_w}(s)-g_{A_w},\\
R_\sigma(s)&=P_\sigma(s)-h_{A_w}(s)+g_U-h_U(s).
\end{aligned}
$$

The existing definition uses the entire collar $A_w\cup U$. Its terms on $U$ cancel in $J$ and explicitly remain in $R$. Since $h_{A_w}(1)=0$, taking $B$ large in (3) gives $J_\sigma(1)>2B-e$ and, for the evacuated disk, $R_\sigma(1)>B$. Define $e_s=E_\sigma(H_s;M)$, $H=\max_s e_s$, $I=I^+(M)$ and $d=e-I$. By locality and closed signature, $E_\sigma(p_{s,w};M)+E_\sigma(q_{s,w};M)=e+e_s+J_\sigma(s)$ and $J_+(s)=J_-(s)$. For $B\ge2T=8\pi^2$, each isolated closed path starts below $2T$ and ends above it. At the first hitting time $s_*$ for either one, the other has energy at least $I$ by continuity and positivity before the first hitting time. This uses the scalar-flat barrier for the first conformal Laplacian eigenvalue and the initial positivity. In particular

$$J_+(s_*)=J_-(s_*)\ge2T+I-e-e_{s_*}\ge2T-d-H.$$

Any strict joined headroom $2T-H>d$ then yields a positive witnessed lower margin at the hitting time. On the E61 minimizing sequence one can choose each flattening error to tend to zero, giving $H_i\to I<2T$ and $d_i\to0$. The hitting-time lower bound is then uniformly positive at late indices, with the width still chosen independently at each index. Crossing $2T$ determines an energy threshold. The scalar-curvature or Yamabe sign of the isolated metrics after that threshold would need a separate test. [Scalar-flat barrier and marked capping](../../../../master/manuscript/variational_comparison.tex)

## A charge-preserving pullback loop

The same strip estimate also applies to a loop with no transport of charge across the actual face. Take a balanced disk with a protected compact core, and an inner Gaussian slab disjoint from the core and the face. Let $\beta_0(t)$ be a smooth bump supported in that slab and equal to one near $t_0$. Fix an angular flow $\Psi_v$ supported in an angular chart, fixing one point with derivative nonconformal for $h_\circ$ there for some $v\ne0$. Choose a smooth scalar loop parameter $a(s)$, zero near both endpoints and equal to that $v$ at a middle time. The diffeomorphisms

$$\Phi_s(t,y)=(t,\Psi_{a(s)\beta_0(t)}(y))$$

extend by the identity outside the slab. They preserve $D,V$, fix a neighborhood of the protected core and the actual face, and return to the identity. For $H_s=\Phi_s^*g$, both chiral masses of $D$ and $V$, the core metric and charge, and the total joined energy stay fixed. At the middle pass the frozen tangential endpoints are nonproportional and (3), with that time in place of time one, forces both isolated connectors above any positive threshold at a sufficiently small fixed width. The loop returns the original metric and face. It can precede a separately supplied matched path on the same marking, with joined peak equal to the larger of $e$ and that path's peak. An arbitrarily large isolation interaction is therefore compatible with exact conservation of the original side charges and the protected core metric.
