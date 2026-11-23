# SP4-CME-E63 — Lipschitz smoothing on a fixed positive-time strip

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. The [request][req] freezes E42, whose
digest matched before use. [B42][b42] selects this finite-order
consequence of E42's joint parameter and datum map.

## Statement

Use the exact fixed compact-bundle problem and completed spaces of
E42, at the stationary round reference \(A_0\) on oriented \(S^4\).
Write \(F_0=F_{A_0}\) and center the independent pair as
\(U=(A-A_0,F-F_0)\). Let \(\mathcal W\) denote its fixed pair
bundle, equipped with the native reference metric, negative Killing
pairing and fixed smooth metric connection \(D\). Write
\(\mathscr D=C^0(S^4;\mathcal W)\), with the fixed sup norm,
and \(\mathscr X=X_T^\circ\), the E42 smooth completion on the
closed time cylinder. In particular its norm controls the sup
norm of the continuous representative on that cylinder. Its
source spaces are the same \(Y_{0,T}^\circ,Y_{1,T}^\circ\) as
in E42. Fix its density, \(p>6\), Bianchi diffusion coefficient,
reference cutoff and constants. Use the E42 common time \(T>0\)
and weighted cylinder norms without changing them. [E42 (1)–(6)][e42].

For each fixed integer \(k\ge0\) and strip
\(I=[\delta,T']\), \(0<\delta<T'<T\), there are
\(r_{k,I}>0\) and \(C_{k,I}<\infty\) such that for
\(u_0,v_0\in\mathscr D\) with
\(\|u_0\|_{\mathscr D},\|v_0\|_{\mathscr D}\le r_{k,I}\),
the E42 solutions satisfy
\[
 \sup_{t\in I}\|U(t;u_0)-U(t;v_0)\|_{C^k_x}
 \le C_{k,I}\|u_0-v_0\|_{\mathscr D}.
 \tag{1}
\]
Here \(C^k_x\) is the spatial section norm from the fixed
connection and metrics. Compatibility of either independent
datum is unnecessary. The proof below uses the already
proved E42 joint Fréchet smooth map into \(\mathscr X\).
No new linear estimate is assumed.

## Parameter domain and uniform identification

Keep E42's finite family \(V_1,\ldots,V_N\) of smooth tangent
fields spanning each tangent space. For \(s\in\mathbb R^N\),
let \(\varphi_{t,s}\) be the time-\(t\) flow of
\(\sum_{\ell=1}^N s_\ell V_\ell\). The linear lift
\(\mathcal T_s\) evaluates a centered section at
\(\varphi_{t,s}(x)\) and transports its value back to \(x\)
along the flow path using \(D\). In particular
\(\mathcal T_s\) is the identity at \(t=0\) and preserves
the zero section. Let
\[
 \Psi(s,u_0)=U_s(u_0)\in\mathscr X
\]
be the transformed mild fixed point. By E42 it is jointly
Fréchet \(C^\infty\) in the finite parameter and the
\(\mathscr D\) datum. The transformed equations use the
same fixed linear \(L,H,S\), with the parameter-dependent
coefficient terms in the completed source side. The
contraction margin in E42 gives a bound on
\(\|D_U\Phi_s\|\) and a Neumann inverse for
\(I-D_U\Phi_s\). This gives a joint smooth map into the
Banach space \(\mathscr X\) on an open parameter and datum
neighborhood. Choose
\(a>0\) and an open datum radius such that the product
containing \(\{|s|\le a\}\times\{0\}\) lies in that
neighborhood, strictly inside the E42 contraction choices
\(|s|\le R,\ \|u_0\|\le R/(8A)\).
[E42, lifted parameter and Neumann inverse argument][e42].

The untransformed centered zero solution is stationary.
Indeed \(Q(F_0)=I\), \(B(F_0)=2I\), so \(d_{A_0}B(F_0)=0\).
At \((A_0,F_0)\) the vertical and horizontal gauge inputs
and \(F-F_A\) are zero, and \(d_{A_0}F_0=0\) by Bianchi.
The independent system therefore has zero right-hand side
there. Since the lift acts linearly on the centered pair,
the lifted zero section is still zero. The exact transformed
residual identity of E42, applied to this smooth zero
section, shows that zero solves the transformed equation.
It has the same zero trace and belongs to the radius-\(R\)
ball. Transformed uniqueness gives
\[
 \Psi(s,0)=0,\qquad
 \partial_s^\alpha\Psi(s,0)=0
 \tag{2}
\]
throughout the selected parameter tube and for every finite
multi-index \(\alpha\), using the open neighborhood at its
boundary. This stationarity calculation is also the one
used at the round reference in E50. [E42][e42] · [E50][e50].

For all \(|s|\le a\), E42 bounds the lift
\(\mathcal T_s:\mathscr X\to\mathscr X\) by one constant
\(C_{\mathcal T}\). Indeed its Jacobian and fiber transport
bounds are fixed, the distance moved on \(t\le r^2\) stays
within a fixed enlargement of each radius-\(r\) ball, and
the extra spatial derivative of the lift is a bounded
multiplier on the value. The scaled norms are therefore the
same ones used in its strong-continuity argument. The
untransformed difference estimate (7) in E42 and stationarity
give \(\|U(u_0)\|_{\mathscr X}\le L\|u_0\|_{\mathscr D}\),
where \(L=A/(1-\vartheta)\) and
\(\vartheta\le1/16\). Shrink the common datum radius below
\(R/(2 C_{\mathcal T}L)\) and the E42 initial threshold.
For all data in it and all \(|s|\le a\) we then have
\[
 \|\mathcal T_s U(u_0)\|_{\mathscr X}<R/2 .
\]
The transformed residual identity for rough sections is the
one already obtained by smooth approximation in E42. The
lift has trace \(u_0\), so uniqueness of the transformed
problem in the radius-\(R\) ball gives
\[
 \Psi(s,u_0)=\mathcal T_s U(u_0).
 \tag{3}
\]
This gives one parameter and datum product neighborhood.
It avoids choosing an \(s\)-neighborhood separately for
each datum by strong continuity alone. It does not require
differentiability of the pullback operator on arbitrary
rough sections. [E42 (7) and transformed uniqueness][e42].

## Operator-norm bound and the mean-value estimate

For the finite set of multi-indices \(|\alpha|\le k\)
define
\[
 G_\alpha(s,u)=D_u\,\partial_s^\alpha\Psi(s,u)
       \in\mathcal L(\mathscr D,\mathscr X).
\]
The asserted Fréchet \(C^\infty\) regularity implies that
each \(G_\alpha\) is continuous in the operator norm.
Indeed it is the mixed Fréchet derivative of order
\(|\alpha|+1\) on the product Banach space with the
finite parameter unit vectors inserted in the
\(|\alpha|\) parameter slots. Such a restriction
is a bounded linear operation on multilinear operators.

For each \(s_*\) in the compact finite-dimensional ball
\(K_a=\{|s|\le a\}\), continuity at \((s_*,0)\) gives
a product neighborhood \(O_{s_*}\times B_{r(s_*)}(0)\)
on which the norms of all these operators are bounded by
\(1+\max_{|\alpha|\le k}\|G_\alpha(s_*,0)\|\).
Take finitely many of the \(O_{s_*}\) covering \(K_a\).
Choose a positive common datum radius strictly below
the minimum of their radii and the radius in (3), and
take the maximum of their finitely many bounds.
Writing the resulting bound as \(L_k\), we obtain
\[
 \sup_{\substack{|s|\le a\\ \|u\|_{\mathscr D}\le r_{k,I}}}
       \max_{|\alpha|\le k}\|G_\alpha(s,u)\|_{\mathcal L(\mathscr D,\mathscr X)}
 \le L_k.
 \tag{4}
\]
Only the parameter ball was covered by compactness. The
datum neighborhood comes from continuity at the points
\((s_*,0)\), so no compactness of a \(C^0\) datum ball
has been used.

The straight segment from \(v_0\) to \(u_0\) stays in
this datum ball. The Banach-space fundamental theorem
along the segment gives
\[
 \begin{split}
 \partial_s^\alpha\Psi(s,u_0)-\partial_s^\alpha\Psi(s,v_0)
 &=\int_0^1G_\alpha(s,v_0+\theta(u_0-v_0))[u_0-v_0]\,d\theta ,\\
 \sup_{|s|\le a}\max_{|\alpha|\le k}
 \|\partial_s^\alpha\Psi(s,u_0)-\partial_s^\alpha\Psi(s,v_0)\|_{\mathscr X}
 &\le L_k\|u_0-v_0\|_{\mathscr D}.
 \end{split}
 \tag{5}
\]
The integrand is norm-continuous, with the bound from
(4). This is the additional operator-norm step beyond
joint continuity. In particular (2) gives the corresponding
bound for \(\partial_s^\alpha\Psi(s,u_0)\) at \(v_0=0\).

## Extraction of spatial derivatives

Fix \((t_*,x_*)\in I\times S^4\). Choose four of the
fields spanning \(T_{x_*}S^4\) and let \(J_*:\mathbb R^4
\to\mathbb R^N\) insert their four parameter coordinates.
The derivative at \(\sigma=0\) of
\(\sigma\mapsto\varphi_{t,J_*\sigma}(x_*)\) is
\[
 \sigma\longmapsto t\sum_{j=1}^4\sigma_j V_{\ell_j}(x_*).
 \tag{6}
\]
This follows by differentiating the flow at the zero
vector field, where its trajectory is constant. It is
invertible at \(t=t_*>0\). Apply the finite-dimensional
inverse function theorem to
\((t,\sigma)\mapsto(t,\varphi_{t,J_*\sigma}(x_*))\).
It gives a smooth local inverse with inserted parameter
\(s_*(t,y)=J_*\sigma(t,y)\). Shrink to a neighborhood
with compact closure inside its domain and
\(|s_*(t,y)|<a\) on that closure. The neighborhoods
are taken in \(0<t<T\), so the endpoints of the strip
give no issue. All such maps and the transport along
their prescribed paths are independent of the datum.

Let \(P_*(t,y):\mathcal W_{x_*}\to\mathcal W_y\) be
parallel transport from \(x_*\) to \(y\) along that flow
path. Evaluation \(E_{t,x_*}\) at \((t,x_*)\) has norm
at most one from \(\mathscr X\) to \(\mathcal W_{x_*}\)
in the fixed pointwise norms. This bound is uniform in
\(t,x_*\). It follows from the sup term in \(X_T\), using
the continuous representative of its completion. Equation
(3) gives the exact representation
\[
 U(t,y;u_0)-U(t,y;v_0)
 =P_*(t,y)\,E_{t,x_*}
   \left[\Psi(s_*(t,y),u_0)-\Psi(s_*(t,y),v_0)\right].
 \tag{7}
\]
In a fixed local frame apply the spatial derivatives at
fixed \(t\). The product and chain rules give for every
order \(|\beta|\le k\) a finite sum of terms of the form
\[
 A_{\beta,\alpha}(t,y)E_{t,x_*}
  \left[\partial_s^\alpha\Psi(s_*(t,y),u_0)
       -\partial_s^\alpha\Psi(s_*(t,y),v_0)\right],
 \qquad |\alpha|\le|\beta|.
 \tag{8}
\]
Here \(A_{\beta,\alpha}\) is a fixed smooth coefficient
formed from derivatives of the inverse map and the inverse
lift transport, with local frame factors included. At
fixed \(t,x_*\) the bounded evaluation commutes with the
parameter derivatives. There is no differentiation
of the evaluation time or of the datum in (8).
The coefficients have uniform bounds on the shrunken
compact closure. Equation (5) therefore bounds all
these spatial derivatives there by a constant times
\(\|u_0-v_0\|_{\mathscr D}\).

Finitely many such neighborhoods cover \(I\times S^4\).
On them the fixed connection derivatives \(D^j\) differ
from the component derivatives by smooth lower-order
coefficients. Thus the local derivative bounds give the
global fixed spatial norm
\(\sum_{j\le k}\sup_{S^4}|D^j[U(t;u_0)-U(t;v_0)]|\),
uniformly for \(t\in I\). The evaluations of the parameter
derivatives in (8) are jointly continuous on these
neighborhoods. To see this without operator-norm
continuity of \(E_{t,x_*}\) as \(t\) changes, separate
variation of its argument in \(\mathscr X\), controlled
by its uniform norm, from varying the evaluation time of
a fixed continuous representative. Joint continuity of all
spatial derivatives and compactness of the strip give
continuity in the spatial \(C^k\) norm. This proves (1)
as an estimate in \(C(I;C^k(S^4;\mathcal W))\).

## Fixed-time Sobolev consequence and dependencies

Take \(v_0=0\) in (1). By stationarity,
\[
 \sup_{t\in I}\|U(t;u_0)\|_{C^k_x}
 \le C_{k,I}\|u_0\|_{\mathscr D}.
\]
For integer \(m\ge6\) and any fixed \(t_s\in I\),
apply (1) with \(k=m\) and integrate the squares of the
fixed covariant derivatives through order \(m\).
The fixed volume is finite, so
\(\|W(t_s)\|_{H^m}\le C_{\bar g,m}\|W(t_s)\|_{C^m}\)
for the difference \(W\). Hence the corresponding
linear \(H^m\) bound holds for the pair at \(t_s\),
and for its connection component by projection.

Constants can use the fixed reference geometry, bundle and
pairing, fixed \(D\) and density, the E42 coefficient tube
and smooth coefficient bounds, the chosen \(p,\lambda\),
\(T,R,A,\vartheta\), and the fixed spanning fields and
lift. In (4) the bound uses finitely many mixed derivatives
of the E42 solution map on neighborhoods of the finite
parameter slice. In (8) it also uses finitely many inverse
map, transport and frame derivatives on the positive strip.
With the parameter ball fixed as above, (4) supplies a datum
radius depending on \(k\) and the fixed E42 setup. Each strip
then uses that same ball by shrinking its local inverse patches.
These constants are independent of the selected initial
sections in that ball. The proof gives no bound uniform
as \(\delta\downarrow0\), no common threshold over all
orders, and no trace derivative estimate at zero.

This packet uses E42's established smoothing construction
and proves its finite-order Lipschitz consequence.
It does not prove a temporal integral over the
initial slab or recovery of an original flow from
continuous initial data. No new primary source was
reinspected or imported.

[req]: ../research-progress/handoffs/SP4-CME-E63_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E63_RETURN_v1.md
[b42]: ../brainstorm/notes/B42_QUANTITATIVE_SMOOTHING_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
