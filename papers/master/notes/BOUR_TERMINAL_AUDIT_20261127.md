# Fixed-type attainment from the original Bour flow

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded execution for SP4-MASTER-B01, with the equations,
extractions and comparison tests fixed at intake. Serving model and
reasoning effort are unavailable to this reader. This is a model proof
audit of the smooth Riemannian argument and its primary references.

Intake HEAD was 72068cef1973d23aee808fe66476c44ed4b99cc5. Key SHA-256
prefixes were 840a588d4c48 for the [master plan](../research-plan/PLAN.md),
26b828212663 for the [master attainment fragment](../manuscript/attainment_on_the_original_sphere.tex),
719bbea527c6 for the [06 attainment proof](../../investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex),
1f76102af263 for the [marked-neck proof](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex),
72d9e8400315 for the [E51 public types](../../../formalization/investigations/research-progress/handoffs/ED06_E51_PUBLIC_TYPES.lean),
cbe056d30121 for the [E51 assessment](../../../formalization/investigations/reviews/ED06_E51_HARMONIC_ESTIMATES_AND_TERMINAL_LIMITS.md),
and bf5b2433f91a and 94113840eef3 for the [coupled estimate](../../../formalization/SmoothPoincare/Variational/BourStationaryW26.lean)
and [Morrey estimate](../../../formalization/SmoothPoincare/Variational/BourHarmonicMorrey.lean).
The formalization register stops at E51 at this intake.

The fixed-parameter extractions and mixed-parameter stationary extraction
give the alternatives required by the working proof, under the cited
classical geometric theorems. The marked return uses the whole core,
the actual exterior and the cap germ. The Euler end count follows
independently from closed Gauss–Bonnet and an explicit ball metric.

## Original flow and the terminal metric

Let \(M\) be a smooth closed connected oriented homotopy four-sphere.
Use real Hilbert–Schmidt norms for \(W^\pm:\Lambda^\pm\to\Lambda^\pm\),
and write \(E_\pm=\int |W^\pm|^2\), \(e=E_+=E_-\) on \(M\), and \(T=4\pi^2\).
Put \(Z=\operatorname{Ric}-Rg/4\), \(D=\int |Z|^2\) in the ordinary tensor
norm, \(S=\int R^2\), and \(I=I^+(M)<2T\). The ordered \((0,4)\) curvature
square is four times the operator Hilbert–Schmidt square. Gauss–Bonnet gives
\[
 S/24=16\pi^2-2e+D/2,\qquad
 \int |\operatorname{Rm}|_{\mathrm{op}}^2=16\pi^2+D.
\]
The Yamabe quotient has numerator \(\int(6|du|^2+Ru^2)\), and
\(Y_{\mathrm{rd}}^2=384\pi^2\).

Fix a late \(0<\alpha<1\) with an initial positive unit-volume Yamabe metric
and \(\epsilon=e_0-I\le\alpha^2\). The equation is
\(\partial_tg=-2G_\alpha(g)\), where \(G_\alpha\) is the covariant gradient of
\(F^\alpha=2(1-\alpha)e+\alpha D/2=2e+\alpha S/24-16\alpha\pi^2\).
The initial margin
\[
 m_\alpha=(1-\alpha)16\pi^2-F^\alpha(g_0)
          =16\pi^2-2e_0-\alpha Y_0^2/24
\]
has a common positive lower bound. Volume is preserved by scale invariance.
Monotonicity gives \(e(t)\le2T-m_\alpha/[2(1-\alpha)]\).
On each slice the Yamabe representative and Gauss–Bonnet give
\(Y(t)^2\ge48(2T-e(t))\). Continuity from \(Y_0>0\) gives \(Y(t)\ge y>0\)
and then \(e(t)\ge I\) on the same type. Using
\(D_0=4e_0+(Y_0^2-Y_{\mathrm{rd}}^2)/12\) gives
\[
 \begin{split}
 e(t)&\le e_0/(1-\alpha)\le2T-\eta,\\
 S(t)&\le Y_0^2+48\epsilon/\alpha,\\
 D(t)&\le D_0+4(1-\alpha)\epsilon/\alpha
       =4I+4\epsilon/\alpha+(Y_0^2-Y_{\mathrm{rd}}^2)/12 .
 \end{split}
\]
The late flows share \(\eta>0\) and \(D(t)\le d_*<32\pi^2\) on the original
uncut metrics. [Bour, §§1, 4 and 8](https://arxiv.org/html/1012.0342v1) ·
[06 physical budget](../../investigations-1/06_bour_flow_and_fixed_type_attainment/01_regularized_flow_and_energy/notes/ORIGINAL_FLOW_20261126.md)

In Bahuaud–Helliwell's rough Laplacian convention the principal part has
\(k=c=1\), \(a=-(1-\alpha)/6>-1/6\) and \(b=(2+\alpha)/6\).
Their Theorem A supplies existence and uniqueness in the original equation.
With time measured from the start of a bounded slab, Bour's Lemma 6.2
applied in order \(2j\) gives the factor \(K^{2j+2}\) for the slab
curvature ceiling \(K\). In the sum
\(f_k(t)=\sum_{j=0}^k c_\alpha^jt^j\mathcal R_{2j}(t)/j!\),
the positive derivative terms cancel against adjacent leading negative
terms. Thus \(f'_k\le C_{\alpha,k}K^2(1+K^2t)^kf_k\). Gronwall bounds
every even curvature derivative in \(L^2\) at a positive lag from the
slab start, in terms of the initial full curvature integral. The two
adjacent even orders bound each odd order by integration by parts.
The Yamabe inequality at bounded scalar and Kato give \(L^4\) bounds
for every curvature derivative. Applying the same inequality to the
squared tensor norm gives \(L^8\), since the tensor and its derivative
are both bounded in \(L^4\). Bour's Proposition 9.16 with \(q=m=8\)
then gives pointwise estimates. These estimates use the scale-invariant
full curvature integral and the normalized scalar bound. They apply on
each normalized slab with constants depending on the fixed \(\alpha\).
[Bahuaud–Helliwell, Theorem A and (4)](https://arxiv.org/pdf/1407.4406v1#page=2) ·
[Bour, Lemma 6.2 and Proposition 9.16](https://arxiv.org/html/1012.0342v1)

A useful uniform volume calculation applies with \(Y\ge y\) and
\(|R|\le S_*\). Test a cutoff of \(B(x,r/2)\) inside \(B(x,r)\),
with \(|du|\le 2/r\), using smooth approximation. For \(0<r\le1\)
and \(v(r)=\operatorname{Vol}B(x,r)/r^4\), this gives
\[
 v(r)\ge\frac{y}{4(24+S_*)}\,v(r/2)^{1/2}
 \quad\Longrightarrow\quad
 v(r)\ge c_v=\left(\frac{y}{4(24+S_*)}\right)^2.
\]
The limit in the halved-radius iteration uses the smooth infinitesimal
Euclidean ratio at each point. The sectional curvature bound and this
lower ratio give injectivity by Cheeger–Gromov–Taylor. At volume one, a
chain of disjoint equal-radius balls along a minimizing geodesic bounds
the diameter. [Cheeger–Gromov–Taylor, Theorem 4.7](https://doi.org/10.4310/jdg/1214436699)

If curvature remains bounded and the maximal time is finite, the
positive-lag estimates bound all covariant derivatives of the velocity.
Relative to a late fixed reference connection, metric equivalence follows
by integrating the velocity as a bilinear form. The time derivative of
the connection difference is a contraction of \(g^{-1}\nabla\partial_tg\).
Its \(m\)th derivative in the reference connection involves reference
derivatives of the connection difference through order \(m-1\) and
bounded current derivatives of velocity. Induction bounds all reference
derivatives and then all reference derivatives of velocity. Integration
gives a smooth positive metric at the finite terminal time, so the
short-time theorem continues the solution. In the immortal bounded case
overlapping slabs give uniform late derivative bounds. The exact identity
\(\frac{d}{dt}F^\alpha(g_t)=-2\int|G_\alpha(g_t)|^2\,dV_{g_t}\)
selects times tending to infinity with vanishing \(L^2\) gradient.
Compact smooth convergence and bounded diameter give whole oriented
comparison diffeomorphisms. The limit is stationary and retains the
volume, energy and positive Yamabe bounds. Its scalar is constant by
the trace and connectedness. [Bour, Theorems 1.8–1.11 and §8](https://arxiv.org/html/1012.0342v1#S8)

For unbounded curvature choose first hits \(t_i\) of increasing levels
\(Q_i\) of the ordered curvature supremum, and maximum points \(x_i\)
at the hits. Continuity gives the first hits and regularity on compact
time prefixes makes them cofinal at the finite or infinite maximal time.
For any fixed \(A>0\), eventually \([-A,0]\) in
\(h_i(s)=Q_i g(t_i+s/Q_i^2)\) corresponds to regular times with both
original endpoints cofinal. The ordered curvature is at most one there
and is one at \((x_i,0)\), where the squared operator norm is \(1/4\).
Start smoothing on a longer window. Use pointed compactness on the
final slices and keep those maps fixed in normalized time. The
reference-connection argument above runs backwards on a bounded window
and gives all reference spatial derivatives on each comparison domain.
The flow equation and differentiation give all time derivatives there.
Arzelà–Ascoli and diagonal extraction give smooth convergence through
\(s=0\) on the same maps. The terminal spatial limit is complete by
pointed compactness. [Bour, Theorem 7.1 and §8](https://arxiv.org/html/1012.0342v1) ·
[E51 terminal comparison](../../../formalization/investigations/12_bour_regularized_flow/notes/E51_TERMINAL.md)

Scale invariance of the functional and the covariant \(L^2\) pairing give
\(G_\alpha(Q_i g)=Q_i^{-1}G_\alpha(g)\). The squared pointwise gradient
contributes \(Q_i^{-4}\), volume \(Q_i^2\) and \(ds=Q_i^2dt\). Thus the
normalized spacetime dissipation equals half the original endpoint energy
drop, tending to zero. A nonzero limiting gradient would have positive
integral over a compact neighborhood and time subinterval, with a one-sided
interval at the endpoint. Hence the limit is stationary through \(s=0\).
It is noncompact because a compact limit embeds onto the connected \(M\)
and its whole-image volume converges, whereas the rescaled volumes are
\(Q_i^2\). Compact tests transfer \(Y_c\ge y\). The radius iteration on
the complete limit gives a uniform unit-ball lower volume bound, so
infinitely many disjoint unit balls give infinite volume. Exhaustion
gives finite scalar square integral and bounds each chiral integral
and \(D\) separately. The trace is \(\alpha\Delta R=0\). Testing by
\(\eta_L^2R\) with \(|d\eta_L|\le C/L\) gives
\(\int\eta_L^2|dR|^2\le4\int R^2|d\eta_L|^2\to0\).
The constant scalar is zero by infinite volume. The remaining
stationary equation is Bach-flatness. [Bour, Proposition 4.4 and Lemma 8.2](https://arxiv.org/html/1012.0342v1) ·
[E51 pointed scalar estimate](../../../formalization/investigations/12_bour_regularized_flow/notes/E51_POINTED_SCALAR.md)

## One oriented core and the Euler count

A complete noncompact nonflat scalar-flat Bach-flat pointed model
\((X,h)\) inherits a homogeneous Sobolev inequality, finite full curvature
integral and finite \(L^2\) negative Ricci. Tian–Viaclovsky 2005, Theorem 1.1,
gives differentiated little-\(o\) quadratic curvature decay. The 2008
Theorem 1.1 uses the Sobolev inequality, this decay and finite negative
Ricci energy to give finitely many order-zero ALE ends. Finite topology
then permits the differentiated order-zero charts from the 2005 theorem.
Ache–Viaclovsky Theorem 1.2 with \(n=4,k=1\) upgrades the ends to
differentiated order two. [TV 2005, Theorem 1.1](https://arxiv.org/pdf/math/0310302v3#page=2) ·
[TV 2008, Theorem 1.1](https://ems.press/content/serial-article-files/43177#page=2) ·
[Ache–Viaclovsky, Theorem 1.2](https://arxiv.org/pdf/1106.1249v2#page=3)

Choose the orientation at the base point consistently along the comparison
subsequence. The whole connected truncation, together with inner and outer
buffers on **all** its ends, lies in a single open convergence domain.
One oriented embedding into one slice contains all of those data. In
logarithmic radius the gauge \(r^{-2}\) gives round quotient product error
\(O_\ell(R^{-2})+o_i(1;R,\ell)\) in \(C^2\) on each fixed-width buffer.
Extend the positive gauge by cutting off its logarithm away from the
buffers and use a fixed cutoff to productize near each link. Each
disjoint unit splice increases either sign's energy by at most
\(C\eta_{\nu,2}^2\), through bounded volume and zero product Weyl.
Choosing radius and then index with total increase below \(\pi^2+\eta\)
retains \(E_+<9\pi^2\) on the uncut closed source.

Each quotient link is a rational homology sphere, so the two sides have
zero signature by Mayer–Vietoris. Hillman Theorem 5.2(1) limits the group to
\(1,Q_8,I^*\). For the Poincaré link the unique boundary spin structure
allows the signed \(E_8\) plumbing to close a spin side, contradicting
Rokhlin's theorem. For a free orthogonal \(Q_8\) in dimension four the
central involution is \(-1\), and \((v,iv,jv,ijv)\) is an orthonormal
quaternionic basis. In a fixed orientation the noncentral six terms in
the cotangent formula have the same sign and magnitude one, and the
central term is zero. Thus the even-form odd-signature eta has magnitude
\(6/8\). By APS in the exact product germ one side has
\(E_+-E_-=12\pi^2(6/8)=9\pi^2\), exhausting more than the allowed
total \(E_+\). Every link is therefore \(S^3\). [Hillman, Theorem 5.2(1)](https://www.maths.usyd.edu.au/u/jonh/embkDec24.pdf#page=64) ·
[APS I, (4.14)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24) ·
[APS II, (2.12)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf#page=8) ·
[Marked-neck quotient obstruction and spin input](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L370)

For the entire embedded connected core \(K_R\), the map from boundary
\(H_0\) to the sum of core and complement \(H_0\) is injective since
\(H_1(M)=0\). Two spheres incident to the same exterior would give a
difference in its kernel. Every exterior meets the boundary by
connectedness. Van Kampen gives a free product of the fundamental groups
of these pieces along the resulting star of simply connected spheres.
Mayer–Vietoris gives the direct sum of their \(H_2\). Each \(\pi_1\) is
trivial and each \(H_2\) vanishes. Filling each actual face with a ball
preserves these conclusions. Poincaré duality and Hurewicz–Whitehead give
a homotopy four-sphere for each capped piece. For \(k\) ends,
\(\chi(K_R)=2-k=\chi(X)\), using end retraction.

**Independent Euler calculation.** On a fixed-fraction collar
\((1-\delta)R\le r\le R\) of each Euclidean face, interpolate with a cutoff
of \(r/R\) to exact Euclidean metric near \(r=R\). After unit dilation both
metrics converge in \(C^2\) to flat, so their bulk Euler integrals on the
fixed annulus tend to zero. At radius one attach the ball metric
\(ds^2+f(s)^2\gamma_{S^3}\), with \(f=1+s\) near \(s=0\), \(f=3-s\)
near \(s=3\), and \(f>0\) for \(0\le s<3\). A smooth convex interpolation
of the two positive profiles on an interior subinterval suffices.
Its seam matches the outward Euclidean continuation from the flat unit
ball. Its Euler bulk is \(16\pi^2\), by closed Gauss–Bonnet on that
standard double and zero bulk on the flat ball. Attach copies scaled
by \(R^2\) at the \(k\) actual faces. The bulk is scale invariant, and the
Euler characteristic of the filled core is \(\chi(K_R)+k\). Closed
Gauss–Bonnet for that metric and finite curvature on the original
scalar-flat core give
\[
 8\pi^2(\chi(X)+k)
   =E_+(X)+E_-(X)-D_X/2+16\pi^2 k,\qquad
 D_X=2(E_+(X)+E_-(X))+32\pi^2(k-1).
\]
This proves an outgoing boundary contribution of \(+8\pi^2\) per
Euclidean face. In the boundary Pfaffian calculation the unit-dilated
outward shape tends to the identity, ambient tangential curvature to
zero and area to \(2\pi^2\). The E51 polynomial
\(2\langle S_{\partial K},C\rangle+4\det S_{\partial K}\) therefore
gives the same contribution. Here \(C\) is tangential ambient curvature
transported by the boundary Hodge star, and \(S_{\partial K}\) is
positive on a Euclidean sphere with outward normal. This agrees with
TV (7.2). Since \(D_X\le d_*<32\pi^2\), \(k=1\).
[TV 2005, (7.2)](https://arxiv.org/pdf/math/0310302v3#page=51) ·
[Cibotaru–Moroianu, (1.1) and §3](https://www.imar.ro/~sergium/fisiere/pfa.pdf) ·
[E51 Euler calculation](../../../formalization/investigations/13_bour_marked_limits_and_attainment/notes/E51_EULER.md)

## Smooth compactification and the actual positive exterior

Solve the end harmonic Dirichlet problem on \(r_0\le r\le L\) with
values \(r_0^{-2},L^{-2}\). For \(\Delta=\operatorname{div}\nabla\),
\(\Delta_h r^{-2}=O(r^{-6})\) and
\(\Delta_h r^{-2-\beta}=\beta(2+\beta)r^{-4-\beta}+O(r^{-6-\beta})\)
for \(0<\beta<1\). For large \(r_0\), small multiples of
\(r^{-2}(1+r^{-\beta})\) and large multiples of \(r^{-2}(1-r^{-\beta})\)
are lower and upper barriers uniformly in \(L\). Exhaustion and
rescaled interior estimates give a positive harmonic \(a\) comparable
to \(r^{-2}\) with \(\partial^m a=O(r^{-2-m})\).
The Euclidean Laplacian of the inner-cutoff solution is \(O(r^{-6})\)
on the tail and has finite absolute \(\beta\)-moment. The difference
from its Newton potential is decaying entire harmonic, hence zero.
The kernel difference on \(|z|\le r/2\) is
\(O(r^{-2-\beta}|z|^\beta)\). On the tail near the evaluation point
within radius \(r/4\), the potential is \(O(r^{-4})\) by local kernel
integrability, and in the rest of the tail it is \(O(r^{-2})\) times
\(O(r^{-2})\) source mass. Hence \(a=c r^{-2}+O(r^{-2-\beta})\),
with \(c>0\) by the lower barrier. Scaled interior estimates
differentiate this remainder through order five. Extend \(a\) positively
across the core and normalize \(c\) to one. The metric \(a^2h\) is
Bach-flat and is scalar-flat near the end. Inversion gives
\(O(\rho^\beta)\) Euclidean convergence with \(m\)th derivative error
\(O(\rho^{\beta-m})\) for \(m\le5\). This meets the differentiated
\(C^0\) orbifold hypothesis with \(k=1\) and trivial local group.
Removal gives a smooth added point on the oriented compactification \(N\).
[Ache–Viaclovsky, Definition 1.6, Theorem 1.8 and Remark 7.2](https://arxiv.org/pdf/1106.1249v2)

Write \(q\) for the smooth extension. Compact tests give
\(Y([q])=Y_c(X,h)\ge y\): a smooth test on \(N\) can be cut off near
the point with Dirichlet cost \(O(\rho^2)\), and the punctured
quotients are related by conformal covariance. \(N\) is a homotopy
sphere by the capped-core topology. The two conformally invariant
chiral integrals thus equal \(e_X\), and the one-end formula gives
\(D_X=4e_X\). If \(e_X\le T\), Chang–Gursky–Yang A and B give the
standard smooth type, since the other alternatives have incompatible
homology or fundamental group. The ordered Weyl integral is \(8e_X\).
Chang–Chen Theorem 2.1 gives zero Weyl for the positive Bach-flat
class on the standard sphere if \(8e_X\le32\pi^2\). Then \(D_X=R_h=0\)
and \(h\) is flat, contradicting the marked curvature maximum.
Therefore \(e_X>T\). [Chang–Gursky–Yang, Theorems A and B](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf) ·
[Chang–Chen, Theorem 2.1](https://web.math.princeton.edu/~chang/21Chang-Chen-nz.pdf)

Fix a logarithmic buffer length \(\ell\) and then a small normal ball
\(B_s\) of \(q\) in the extending chart so that \(\rho=s e^{\pm(\ell+2)}\)
lies in the chart. \(K_s=N\setminus\operatorname{int}B_s\) and both
buffers belong to one connected comparison domain, with embedding
\(\Phi_i\). In gauge \(a^2\rho^{-2}\) on the rescaled source, the collar
error is \(O_\ell(s^2)+o_i(1;s,\ell)\) in \(C^2\) by normal coordinates.
For the actual exterior \(V_i=M\setminus\Phi_i(\operatorname{int}K_s)\),
separately in either sign on the uncut source,
\[
 \limsup_i E_\pm(g_i;V_i)
 =\limsup_i E_\pm(g_i)-e_X+E_\pm(q;B_s)
 \le2T-\eta-e_X+E_\pm(q;B_s).
\]
Productizing the one seam and adding a Weyl-flat rotational ball
increases this exterior energy by at most \(C\eta_2^2\). The cutoff
angle identity in the buffered cap proof has error \(C_I\ell^{-3/2}\)
times the squared \(L^4\) norm, from derivative squares \(O(\ell^{-2})\)
on volume \(O(\ell)\). Tests transplant to the original conformal
source and the cap model. This gives the capped Yamabe lower bound
\(\min\{y,(1-C_Y\eta_2)Y_{\mathrm{rd}}\}-C_I\ell^{-3/2}\).
Choose \(\ell\) for positivity first, then \(s\) small and \(i\)
large for positivity and capped energy below \(T\) in both signs.
The actual capped exterior is a positive homotopy sphere and the
strict sphere theorem recognizes its smooth type.
[Marked-neck buffered cut](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L208)

Let \(C_i\) be that attached ball. Orient the normal-ball double
\(B_s^{\mathrm{opp}}\cup B_s\) by the orientation of \(N\) on the
\(B_s\) side. Send an exterior strip to \(B_s\) by \(\Phi_i^{-1}\).
On the cap side use the same signed collar coordinate and angular
map onto \(B_s^{\mathrm{opp}}\), extending radially with increasing
radial profile and linear germ at the center. This gives an oriented
diffeomorphism on a neighborhood of the actual cell \(C_i\).
Choose an oriented global diffeomorphism from the recognized capped
exterior to the oriented double and transport the neighborhood map
by it. Palais Theorem C extends the resulting local map near the
transported cell to the whole double. Compose back and restrict to
\(V_i\). This is a diffeomorphism \(V_i\to B_s\) agreeing with
\(\Phi_i^{-1}\) on the seam germ, so it glues to the inverse core
map. The inverse restrictions agree with \(\Phi_i\) on the
corresponding strip. Thus \(M\cong N\) oriented in the actual marking.
[Palais, Theorem C](https://doi.org/10.1090/S0002-9939-1960-0117741-0)

Take the source liminf on each fixed whole truncation, then exhaust
\(X\), separately in each sign. This gives \(E_\pm(X)\le\liminf_i
E_\pm(g_i)\). Positivity and marked identification give \(I\le e_X\).
At fixed \(\alpha\), the upper bound on exterior loss, with source
index first and \(s\downarrow0\) second, is \(e_0/(1-\alpha)-I\) in
either sign. Keeping the exact initial Ricci term gives
\[
 4(e_X-I)+(Y_{\mathrm{rd}}^2-Y_0^2)/12\le4\epsilon/\alpha .
\]
Actual first-flow pointed outcomes therefore require initial Yamabe
deficit at most \(48\alpha\).

## Uniform estimates at the two stationary scales

For the second extraction, take the physical volume-one stationary
first limits with \(p_j=\alpha_j\). For a compactified Bach-flat
first limit use a volume-one Yamabe representative and \(p_j=0\).
These metrics \(q_j\) are on the same oriented \(M\), satisfy
\(I\le e(q_j)\le e_{j,0}/(1-\alpha_j)\to I\), and share \(Y\ge y\)
and \(D\le d_*<32\pi^2\) for late \(j\). In the Bach-flat Yamabe
case \(D\le4e(q_j)\) follows afresh from Gauss–Bonnet. In the
regularized stationary case the trace gives constant scalar, and
the constant function test plus the scalar square budget give
\(y\le R(q_j)\le S_*\) in volume one.

Take \(h=a q_j\) with \(a=1\) on a bounded curvature subsequence
or \(a=Q_j=\max|\operatorname{Rm}(q_j)|_{\mathrm{ord}}\to\infty\)
on a divergent subsequence, discarding earlier \(Q_j<1\).
Let \(K\) be a common ordered curvature supremum in both chosen
gauges and \(s=R(q_j)/a\). The Yamabe form in this gauge has
zeroth-order coefficient \(s\le S_*/a\). The radius estimate above
gives \(c_v\) at both scales, and injectivity has a common lower
bound depending only on \(K,c_v\) and dimension. Peters Theorem
4.3 then supplies harmonic coordinate maps \(\psi:B_{4r}\to(M,h)\)
of common positive radius, with metric and inverse uniformly
elliptic and metric \(C^{1,\gamma}\) bounded, for a fixed
\(0<\gamma<1\). Choosing \(L\ge1\) with \(L^{-2}\delta\le\psi^*h\le
L^2\delta\), the image of the closed coordinate \(r\)-ball contains
the original \(q_j\)-ball of radius \(r/(L\sqrt a)\). Indeed any
path leaving that image spends at least \(r/L\) length in the
normalized chart before its first boundary crossing. Constants
are chosen before \(j\), center and either scale. [Peters, Theorem 4.3](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=10)

As a covariant tensor \(Z(h)=Z(q_j)\). Bour's CSC equation in the
nonnegative rough Laplacian convention is
\[
 0=\tfrac12\nabla^*\nabla Z-W^\circ(Z)
   +Z\circ Z-\tfrac14|Z|^2 h+\tfrac{2-p_j}{12}s Z .
\]
The leading coefficient of the rough term is common, and the
last coefficient has size at most \(S_*/(6a)\). With the ordered
curvature bound \(K\) the ordinary tensor norms satisfy
\(|\operatorname{Ric}|\le2K\), \(|Z|\le2K\) and
\(|W|_{\mathrm{ord}}\le K\), by orthonormal contraction and
orthogonal curvature decomposition. Cauchy–Schwarz on the two
contracted slots gives \(|W^\circ(Z)|\le K|Z|\). Thus the ordinary
two-tensor size of the right side of the rough equation, after
multiplication by two, is bounded by
\(16 K^2+2S_*K/(3a)\). The \(p_j=0\) equation is the same CSC
Bach equation. In the positive-parameter case it also gives
\(\operatorname{grad}F_W=p_j s Z/12\). [Bour, Proposition 4.4](https://arxiv.org/html/1012.0342v1#S4)

On one harmonic realization, the scalar diagonal principal
operator is \(h^{ab}\partial_{ab}\). Its metric forcing is
\(-2\operatorname{Ric}_{ij}+Q_{ij}(h,\partial h)\). In the rough
equation for the components of \(Z\), the undifferentiated trace
\(h^{ab}\Gamma^c_{ab}=0\). The contracted term
\(h^{ab}\partial_a\Gamma^c_{bi}\) is a curvature contraction,
\(-(\partial_i h^{ab})\Gamma^c_{ab}\), and quadratic first-jet
terms, by differentiating harmonicity and commuting the Christoffel
derivative. This gives bounded zeroth-order source and bounded
first-order coefficients for the tensor equations. In both systems
the inverse coefficients have the same fixed ellipticity and
modulus. Freezing at a point with least eigenvalue \(\lambda_0>0\)
gives flat scalar Hessian constant at most \(C_{4,6}/\lambda_0\)
by a linear change of variables. On fixed small patches absorb
the resulting inverse-coefficient error when its Frobenius size
is at most \(\lambda_0/(2C_{4,6})\). Interior cutoff interpolation
absorbs the bounded first-order terms. E51 performs this step with
the actual full first derivative and Hessian in \(L^6\) on
\(B_{5r/2}\) for both fields on the same coordinate domain.
Its \(C^{1,1/3}\) estimate on \(B_{2r}\) follows by Morrey.
[DeTurck–Kazdan, Lemma 4.1 and (4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7) ·
[E51 coupled estimate and its inputs](../../../formalization/investigations/13_bour_marked_limits_and_attainment/notes/E51_COUPLED.md)

For the remaining classical upgrade put \(\beta=1/3\). From common
\(C^{1,\beta}\) estimates, metric Schauder gives \(h\) in
\(C^{2,\beta}\) on a smaller ball, using
\(\operatorname{Ric}=Z+sh/4\). Then the same operator on \(Z\)
has \(C^{0,\beta}\) source and lower coefficients, including
curvature and all relevant metric derivatives. Tensor Schauder
gives \(Z\) in \(C^{2,\beta}\) on a further smaller ball.
Inductively, common \(C^{m,\beta}\) gives \(h\) in
\(C^{m+1,\beta}\) by the metric equation, then \(Z\) in
\(C^{m+1,\beta}\) by the tensor equation. Each pair of estimates
uses nested balls with radii decreasing from \(2r\) to \(r\).
Thus for each \(m\) a bound \(C_m(K,y,S_*,r,L)\) holds on \(B_r\)
at either scale, with the initial harmonic modulus fixed. Differentiation
of \(s\) contributes zero in each physical chart. The limiting
comparison maps on connected compact domains follow from standard
smooth pointed compactness with uniform curvature derivatives
and injectivity radius.

Bounded unscaled curvature and the volume-one diameter bound give a
whole oriented closed limit on \(M\). It is positive, has both
chiral energies equal to \(I\), and is Bach-flat by \(p_j\to0\).
On the divergent curvature subsequence, the complete pointed limit
is noncompact by the rescaled-volume argument, nonflat by the maximum,
scalar-flat by \(s\to0\) and Bach-flat by the stationary equations.
The same one-core marking applies on these original \(q_j\) slices,
with the transferred Ricci margin. On the marked compactification,
\(I\le e_X\le\liminf_j e(q_j)=I\). Both raw exterior masses then
vanish in the ordered limit of source index followed by normal ball
radius. This proves the attainment implication on the strictly
entered type at paper level.

## Verification scope

E51's public theorem supplies the coupled harmonic estimates once
the physical chart and flat scalar input are given. Its terminal
theorem uses the actual same-map spacetime convergence and its
Euler calculation supplies local boundary algebra. The geometry
above supplies these dependencies at paper level using the cited
source theorems and recovers the Euler evaluation via a closed
argument. The [public E51 fixture](../../../formalization/investigations/reviews/E51_INDEPENDENT_PUBLIC_CHECKS.lean)
was replayed on Lean 4.35.0-rc3. The 65 axiom reports list
only propext, Classical.choice and Quot.sound. The fixture and
replay output SHA-256 prefixes are 8f87512ea968 and ccb3b2f00562.
Positive entry on every smooth homotopy sphere, rigidity
of a nonround attained minimum and human specialist review remain
separate questions.
