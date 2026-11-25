# A fixed-width cut from a supplied embedded ALE end

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning
effort are unavailable. This is a conditional geometric estimate for
SP4-FOT-NECK-E03, using the inputs and scope of [revision 1](../research-progress/handoffs/E03_EMBEDDED_REQUEST_20261125.md).

## Input and order of choices

Use the smooth oriented Riemannian source of SEC §11.1. The \(g_i\)
are unit-volume positive Yamabe minimizers on smooth closed oriented
homotopy four-spheres \(M_i\), with
\(4\pi^2\le E_i=E_+(g_i)=E_-(g_i)\le8\pi^2-\delta\) and
\(\int|B_{g_i}|\,dV_{g_i}\to0\). Each \(E_\pm\) integrates the
Hilbert–Schmidt norm squared of the specified chiral Weyl block.
Fix a nonflat complete smooth connected limit \((X,h)\) and
scales \(\lambda_i\to0\). For every fixed full compact truncation,
assume orientation-preserving comparison embeddings \(\iota_i\) on
an open neighborhood with
\(\iota_i^*(\lambda_i^{-2}g_i)\to h\) smoothly there. Each construction
below uses a single such embedding for the cut and its entire core
and buffers. SEC §11.3 gives one end with trivial link group and
oriented ALE coordinates \(x\) with radius \(r=|x|\) and
\[
 |\partial^\beta(h_{ab}-\delta_{ab})|
 \le C_\beta r^{-\alpha-|\beta|},\qquad |\beta|\le5,\quad \alpha>0 .
\]
SEC §11.4 gives a smooth oriented compactification
\(\widehat X=X\cup\{p\}\), with smooth Riemannian \(\bar h\) equal to
\(a^2h\) on \(X\). Its proof gives, on the end, \(a=r^{-2}(1+O(r^{-\epsilon}))\)
for some \(\epsilon>0\), and in the punctured inverted coordinate
\(z=x/r^2\) gives \(\bar h_{ab}(z)=\delta_{ab}+O(|z|^\epsilon)\).
The smooth chart at \(p\) is supplied by removability. The use of
that result here is through the already specified SEC compactification
with constant scalar curvature near \(p\) and trivial group.
[SEC §§11.1–11.5](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3859) · [Ache–Viaclovsky, Definition 1.6, Theorem 1.8 and Remark 7.2](https://arxiv.org/pdf/1106.1249)

Specify a finite retained length \(\ell\ge1\) and put \(T=\ell+2\),
\(I_T=[-T,T]\), \(h_0=dt^2+\gamma_{S^3(1)}\) with the product
orientation. The central unit strips are available for transitions,
and each side has a retained buffer of length \(\ell\) before
the outer margin. All \(C^k\) error norms below are sup norms of
product covariant derivatives through \(k\) on this cylinder.
The coordinates are defined on an open neighborhood of \(I_T\)
after a slightly larger fixed truncation is embedded. For each
target error choose the width first, then a fixed remote placement,
then take \(i\) large at that placement.

## The ALE-coordinate cylinder

Let \(\chi\) denote the oriented map from the Euclidean exterior
onto the end. Put \(\Phi_R(t,\omega)=\chi(Re^t\omega)\) for
sufficiently large \(R\) and \(F_{i,R}=\iota_i\circ\Phi_R\).
Choose the comparison on a truncation extending past \(R e^T\).
In the cylinder,
\[
 H_{i,R}=(\lambda_i R e^t)^{-2}F_{i,R}^*g_i,\qquad
 H_{\infty,R}=(R e^t)^{-2}\Phi_R^*h .
\]
For a Euclidean-coordinate error \(v_{ab}(x)\,dx^a dx^b\), the
corresponding normalized cylindrical error is
\[
 v_{ab}(R e^t\omega) Z^a Z^b,\qquad Z=\omega\,dt+d\omega .
\]
The angular tensors and all their covariant derivatives have
fixed bounds on \(S^3(1)\). The composed Cartesian components
have each cylindrical derivative through order \(k\) bounded by
a constant times a sum of \(r^j|\partial^j v|\), \(0\le j\le k\).
For \(v=h-\delta\), each summand is \(O(r^{-\alpha})\).
Smooth comparison gives the analogous error for
\(\iota_i^*(\lambda_i^{-2}g_i)-h\) tending to zero in \(C^k\) on the
fixed annulus. Thus, for \(0\le k\le5\),
\[
 \|H_{i,R}-h_0\|_{C^k(h_0)}
 \le C_{k,T} R^{-\alpha}+o_i(1;R,T).
\]
The constants do not depend on the physical scale \(\lambda_i R\).
There is no uniform control of the \(o_i\) term as \(R\to\infty\)
in these assumptions. This cylinder is embedded on the source
and its middle sphere bounds the image of the full \(r\le R\) core.

## The cylinder with a prescribed smooth cap marking

Take an oriented \(\bar h\)-orthonormal frame at \(p\) to identify
a small normal coordinate ball with a Euclidean ball in
\(\mathbb R^4\). Write \(y\) for these coordinates and
\(\rho=|y|=d_{\bar h}(p,\cdot)\) there. Let \(J\) be one fixed
orthogonal reflection. For \(s>0\) sufficiently small at the chosen
\(T\), set
\[
 P_s(t,\omega)=\exp_p(s e^{-t}J\omega),\qquad
 K_s=\widehat X\setminus\{\rho<s\},\qquad
 F_{i,s}=\iota_i\circ P_s .
\]
In the definition of \(K_s\), the removed set is the open
normal-coordinate ball. The positive \(t\) direction moves from
the bubble core toward \(p\). Since both this radial reversal and
the angular reflection change orientation, \(P_s\) and \(F_{i,s}\)
preserve the product orientation. Choose the comparison on a
whole ALE truncation containing \(K_s\) and the buffered cylinder
with room on the puncture side. This is possible since the union
is compact in \(X\). Define the positive factor on the cylinder
\[
 f_{i,s}=\frac{a\circ P_s}{\lambda_i \rho},\qquad
 H_{i,s}=f_{i,s}^{\,2}F_{i,s}^*g_i
        =\left(\frac{a\circ P_s}{\rho}\right)^2
            P_s^*\big(\iota_i^*(\lambda_i^{-2}g_i)\big).
\]
Here \(\rho=s e^{-t}\) on the right. For fixed \(s,T\), the
limit is \(H_{\infty,s}=\rho^{-2}P_s^*\bar h\), with convergence
in \(C^k\) on the full buffer. This uses smooth convergence
only on the selected compact truncation and smoothness of \(a>0\)
there.

In the normal coordinate ball put \(q_{ab}(y)=\bar h_{ab}(y)-\delta_{ab}\).
One has \(q=O(\rho^2)\), \(\partial q=O(\rho)\), and the higher Cartesian
derivatives are bounded on a smaller closed ball. For \(0\le j\le5\),
\(\rho^j|\partial^j q|=O(\rho^2)\) when \(\rho\le1\).
Apply the same polar tensor estimate with
\(Z=-J\omega\,dt+Jd\omega\). This gives
\[
 \boxed{\displaystyle
 \|H_{i,s}-h_0\|_{C^k(h_0)}
 \le C_{k,T}s^2+o_i(1;s,T),\qquad 0\le k\le5 .
 }
\]
The constants depend on the fixed smooth limit and fixed width.
For every fixed width this proves
\(\lim_{s\downarrow0}\limsup_{i\to\infty}\|H_{i,s}-h_0\|_{C^k}=0\).
The metric on the source collar is conformal to the product
representative just constructed. The factor \(f_{i,s}\) can be
extended positively to the whole source, agreeing on the needed
closed collar, using a smooth cutoff of its logarithm in a
slightly larger collar.

### Which physical scales the normal chart measures

Let \(u=|z|=r^{-1}\). The punctured metric comparison
\((1-Cu^\epsilon)\delta\le\bar h_z\le(1+Cu^\epsilon)\delta\)
gives \(\rho=u(1+O(u^\epsilon))\). For the upper bound, use
the radial segment to the puncture and take the endpoint limit
in the continuous compactification. For the lower bound, a path
that stays in the small inverted ball has length at least
\(\int_0^u\sqrt{1-Cv^\epsilon}\,dv\) by integrating its radial
variation. Exiting the small ball first has a fixed positive
length lower bound and cannot improve the upper bound when
\(u\) is small. It follows that \(r=\rho^{-1}(1+O(\rho^\epsilon))\)
and \(a=\rho^2(1+O(\rho^\epsilon))\) uniformly in direction.
On the source the inverse conformal scale and slice sizes are
therefore
\[
 f_{i,s}^{-1}
  =\frac{\lambda_i}{\rho}\big(1+O_T(s^\epsilon)\big),\qquad
 \operatorname{Vol}_3(F_{i,s}(\{t\}\times S^3),g_i)
  \asymp_T (\lambda_i s^{-1}e^t)^3
\]
for sufficiently small \(s\) and large \(i\) at fixed \(s\). The
first relation uses only the transition of radii. The second also
uses uniform product comparison of the tangential metric.
These relations give size and location. They make no derivative
claim about the transition between the normal \(y\) and inverted
\(z\) charts at the added point.

### Separation, capping and exhaustion

The middle sphere is the smooth boundary of the embedded compact
codimension-zero core \(\iota_i(K_s)\). The core is connected:
the normal sphere has a connected exterior collar, so any component
of \(K_s\) meeting its boundary meets that collar, and a component
missing the boundary would disconnect \(\widehat X\). In the same
way the closure of the complementary side in \(M_i\) is connected,
using the connected collar on its side of the embedded boundary.
Thus the sphere separates.

For the core, choose the attaching map that uses its recorded
normal-coordinate boundary marking. Explicitly, using the same
copy of \(S^3\) for the cap, the cap coordinates are
\(v\mapsto\exp_p(sJv)\), \(|v|\le1\), and the boundary is sent to
\(F_{i,s}(0,v)\) in \(M_i\). The coordinate reflection is accounted
for by giving the cap the orientation it inherits from
\(\widehat X\). This marked cap is a standard smooth \(D^4\),
with matching smooth collars, and gives an orientation-preserving
diffeomorphism from the capped core to \(\widehat X\).
This construction uses the cap in the smooth chart from the outset.
The separate ALE estimate does not depend on an extension of
the old inverted ALE coordinates as smooth coordinates at \(p\).

The \(K_s\) exhaust \(X\) as \(s\downarrow0\). Even the part of the
core strictly before a fixed-width transition exhausts \(X\):
for \(0<c<T\), the slice at \(t=-c\) gives \(K_{s e^c}\).
For fixed \(s\), each chiral Weyl energy converges on every one of these
fixed cores by smooth convergence and constant-scale invariance,
with the original orientation. Hence the bubble energy enclosed
before the transition converges to \(e_X\) when the source limit
precedes \(s\downarrow0\). In particular the normal-coordinate cut
can simultaneously enforce a prescribed small chart error and
leave an arbitrarily small limit bubble tail. [SEC §§11.1 and 11.5](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3900)

## What the chart supplies

- Fixed cutoffs on the transition strips preserve the above
  \(C^2\) and \(C^4\) clearances. The exact product is conformally
  flat, as are the rotationally symmetric reference caps in the
  supplied-collar construction. The Weyl expression has order
  two and gives a squared Weyl cost \(O(\eta_2^2)\) on each
  fixed transition. The Bach expression has order four and gives
  total Bach norm cost \(O(\eta_4)\). Here \(\eta_k\) denotes the
  appropriate \(C^k\) error bound and the norms are in product gauge.
  Both costs are conformally invariant in dimension four.
- The \(C^2\) comparison holds on each full retained buffer, of
  length chosen before the radius. In the supplied-collar Yamabe
  localization estimate, the cutoff gradient error is
  \(O(\ell^{-3/2})\). The source Yamabe lower bound
  \(\sqrt{48\delta}\) allows a finite \(\ell\) to be chosen first
  to make this term small, followed by a small \(C^2\) error on
  that width. The cut provides all of that audit's geometric input.
  [Supplied-collar construction and Yamabe test](../brainstorm/notes/USING_A_SUPPLIED_COLLAR_20261125.md#make-the-metric-cap-and-control-its-costs)
- The result uses the embedded smooth bubble and §11 link theorem.
  If an annular decomposition with \(N\) disjoint blocks is supplied,
  a total curvature budget \(C\) gives some block with integrated
  curvature squared at most \(C/N\). That estimate by itself
  furnishes neither an \(S^3\) link nor the asserted pointwise
  derivative bounds on a buffered chart. Likewise a fixed transferred
  collar does not control the entire intervening neck. [NECK plan](../research-plan/PLAN.md#sp4-fot-neck-b01)

The [spin transfer](../../02_dirac_collar_extraction/notes/E02_ALE_SPIN_TRANSFER_20261125.md)
uses the same normal-coordinate cut and its direct ALE-coordinate
counterpart. The global energy and gluing consequence is the
separate NECK-E02 check.
