# SP4-FOT-EXTRACT-E06 · Physical end frames and signed curvature accounting

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E check under EXTRACT-B04.
Helper selected as GPT-6.2 Sol, ultra. Exact serving variant and
delivered effort are unavailable. The
[frozen request](../research-progress/handoffs/E06_REQUEST_20261125.md)
records the input versions. The companion MATCH-E12 note was
checked at SHA-256 prefix e7091dcd.

## Physical comparisons and truncations

Let \(g_i\) be smooth unit-volume positive Yamabe minimizers on
smooth closed oriented homotopy four-spheres \(M_i\), with
\(s_i=Y([g_i])\to y>0\) and
\[
  E_i=E_+(g_i)=E_-(g_i)\longrightarrow e,\qquad
  E_i\le 8\pi^2-\delta,\qquad
  D_i=\int_{M_i}|\operatorname{Ric}_{0,g_i}|^2\,dV_{g_i}.
\]
Use the real Hilbert–Schmidt norm of the Weyl block on
\(\Lambda^\pm\). The source signature, Gauss–Bonnet and round
Yamabe bounds give
\[
 D_i/4=E_i+s_i^2/48-8\pi^2\le E_i,\qquad
 0<s_i^2/48\le 8\pi^2 .
 \tag{1}
\]
Allow any positive lower chiral budget in the given source band.
No Bach estimate enters the end frame or volume argument.
[SEC §11.1, source normalizations and budgets](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

Supply oriented smooth compact comparison embeddings of an inner
smooth AE limit \((X,h_X)\) in scales \(\lambda_i\downarrow0\),
and of the exterior limit \((N\setminus P,h_N)\) **in the physical
metrics \(g_i\)**. Here \(N\) is smooth closed, \(P\) consists of
finitely many removable smooth points, and \(h_N\) itself extends
smoothly and positively to \(N\) in this same comparison gauge.
Write \(K_A\) for the whole inner truncation through AE-coordinate
radius \(A\), and \(N_b=N\setminus\bigcup_{p\in P} B_{h_N}(p,b)\)
for the exterior truncation at small common radius \(b\) in smooth
normal coordinates. For each fixed \(A,b\) require convergence on
neighborhoods of both truncations and disjoint interiors of the
images. To use both boundary charts as separate interfaces, take the
images disjoint through their faces as supplied by this comparison.
The closure of the remaining region, denoted \(U_{i,A,b}\), has as
boundary just the comparison faces. Including every component of
this complement is essential. No topology of a cylinder or common
middle coordinate is needed. Finitely many disjoint AE truncations
can be included by summing the estimates on their ends.
[EXTRACT-E04, full compact embeddings on the AE side](E04_DIAGONAL_END_20261125.md) · [SEC §12.4, matched truncations](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4639)

## Cartesian spin connection at the two ends

On a fixed annulus about the unit sphere, pull back the inner
physical metric with \(x=A\xi\), where \(x\) is the oriented AE
coordinate, and divide by \((\lambda_i A)^2\). Call the resulting
metric \(m_{i,A}^X\). It differs from \(\delta\) in \(C^2\) norm by
\(\varepsilon_{i,A}^X\le C A^{-\alpha}+o_{i;A}(1)\), using
the differentiable AE decay of order \(\alpha>0\). On an exterior
end use \(z=b\xi\) in oriented normal coordinates at \(p\),
pull back \(g_i\), and divide by \(b^2\). The resulting \(m_{i,b}^N\)
differs from \(\delta\) in \(C^2\) by
\(\varepsilon_{i,b,p}^N\le C b^2+o_{i;b,p}(1)\). The limit bound
uses \(h_N-\delta=O(|z|^2)\), \(D h_N=O(|z|)\), \(D^2h_N=O(1)\).
These are local physical length factors \(\lambda_i A\) and \(b\).
They specify the induced boundary scales and the radial directions
in the chart and do not require ambient geodesic comparisons
through \(U_{i,A,b}\).

For either unit-shell metric \(m\) take the oriented orthonormal
frame \(e_a=m^{-1/2}\partial_{\xi_a}\). Lift the frame to Spin(4)
over the shell and use the two projected frames in
\(\mathrm{SU}(2)_\pm\). The shell is simply connected, so the
pullback spin structure is the ordinary one and the lift exists
with two constant sign choices. These choices do not affect the
matrix connection. Relative to this Cartesian frame, the
Levi-Civita matrix is \(O(\|Dm\|)\) and its coordinate first
derivative is \(O(\|D^2m\|+\|Dm\|^2)\) with uniform coefficients
near the Euclidean matrix. This follows from the Christoffel
formula and differentiation of the positive inverse square root.
Projection to each half-spin connection is by a fixed linear
representation, with the orientation fixing which is \(+\).
Let \(A_\pm\) denote the connection matrix restricted to the unit
sphere in these frames. If \(\varepsilon=\|m-\delta\|_{C^2}\),
then
\[
 \|A_\pm\|_{L^3(S^3,m)}
 +\|d_\Sigma A_\pm\|_{L^{3/2}(S^3,m)}
 +\|F_\pm|_\Sigma\|_{L^{3/2}(S^3,m)}\le C\varepsilon .
\]
Indeed all three forms have pointwise \(O(\varepsilon)\) norm on
the unit sphere, with \(F_\pm|_\Sigma=d_\Sigma A_\pm+A_\pm\wedge A_\pm\).

A constant scale change preserves the ambient Levi-Civita matrix
in the correspondingly rescaled orthonormal frames. The lifted
matrices in the induced source frames are therefore the same
forms on the parameter sphere. At physical length factor \(r\)
their one- and two-form pointwise norms acquire \(r^{-1}\)
and \(r^{-2}\), while the sphere volume acquires \(r^3\).
The displayed \(L^3\) and \(L^{3/2}\) bounds remain unchanged.
For the defining rank-two matrix trace set
\[
 \operatorname{CS}(A)=\operatorname{tr}
      \left(A\wedge d A+\tfrac23 A\wedge A\wedge A\right).
\]
The transgression is \(d\operatorname{CS}(A)=\operatorname{tr}(F\wedge F)\).
Hölder gives \(|\int_\Sigma\operatorname{CS}(A_\pm)|
\le C(\varepsilon^2+\varepsilon^3)\). Thus for both chiralities
\[
 \limsup_{i\to\infty}
 \left|\int_{\partial U_{i,A,b}}\operatorname{CS}(A_\pm)\right|
 \le C\big(A^{-2\alpha}+|P|b^4\big) .                            \tag{2}
\]
Use the outward orientation of the residual on each component,
which is opposite to that of its neighboring comparison
truncation. On the exterior face it is the outward orientation
of the deleted ball in the normal chart. The estimate uses the
separate Cartesian frames. A frame adapted to a radial normal
on \(S^3\) can have a nonzero winding relative to them, even
in the flat example. No extension or identification of the
boundary frames through the residual is required.
[Chern–Simons, Proposition 3.2](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf#page=6) · [MATCH-E12 physical boundary estimates](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md)

## Volume exhaustion is automatic for the physical removable base

At each fixed pair of truncations, smooth convergence gives
\[
\begin{aligned}
 \operatorname{Vol}_{g_i}(\iota_{i,A}K_A)
     &=\lambda_i^4\big(\operatorname{Vol}_{h_X}(K_A)+o_{i;A}(1)\big),\\
 \operatorname{Vol}_{g_i}(\jmath_{i,b}N_b)
     &\longrightarrow \operatorname{Vol}_{h_N}(N_b).
\end{aligned}
\]
Therefore a sufficient volume hypothesis is
\(\operatorname{Vol}_{h_N}(N_b)\uparrow1\) as \(b\downarrow0\),
or more generally that the actual physical volumes of the
comparison regions exhaust the source total. At fixed \(A,b\)
the residual volume converges to \(1-\operatorname{Vol}_{h_N}(N_b)\).
With no exhaustion it need not be small enough to apply the
strict charge margin.

Here exhaustion follows from the ordinary physical convergence.
Smooth convergence on compact punctured regions gives \(s_{h_N}=y\)
there, and hence across the smooth omitted points. For
\(f\in C_c^\infty(N\setminus P)\), transport it into an exterior
comparison image and extend by zero. At this fixed compact
support pass \(i\to\infty\) in the source Yamabe inequality to get
\[
 y\left(\int_N |f|^4\,dV_{h_N}\right)^{1/2}
  \le \int_N(6|df|^2+y|f|^2)\,dV_{h_N}.
\]
For any smooth \(f\) on \(N\), multiply by cutoffs that vanish
in balls of radius \(b\) about \(P\), equal one outside balls of
radius \(2b\), and have gradient \(O(b^{-1})\). The total squared
gradient integral is \(O(|P|b^2)\) and the balls have
\(O(|P|b^4)\) volume. At fixed cutoff pass the source limit first.
Then send \(b\downarrow0\), with convergence of the tests in
\(H^1\) and \(L^4\). This proves the inequality for all smooth
tests on \(N\). Applying it to \(f=1\), and writing
\(V=\operatorname{Vol}_{h_N}(N)>0\), gives
\(y\sqrt V\le y V\), so \(V\ge1\). On the other hand, the
embedded physical volumes on \(N_b\) are at most one. Their
limit at fixed \(b\) and then monotone exhaustion give \(V\le1\).
Thus \(\operatorname{Vol}_{h_N}(N)=1\) and \(Y([h_N])=y\), the
last equality from the same inequality and the constant test.
If the exterior limit had multiple smooth closed components,
testing on each would give volume at least one on each, so
at most one nonempty component is possible under these data.
In particular the whole residual volume tends to zero in the
iterated limit, and the limiting exterior accounts for the
entire physical source \(\int s_i^2\,dV_{g_i}\).
[Lee–Parker, §§2–3, Yamabe quotient and the round constant](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

## Signed charge and the physical Ricci accounting criterion

For a smooth residual region \(U\) in the physical source put
\[
 Q_\pm(U)= E_\pm(g_i;U)+\frac{s_i^2}{48}\operatorname{Vol}_{g_i}(U)
            -\frac14 D_i(U),\qquad
 D_i(U)=\int_U|\operatorname{Ric}_{0,g_i}|^2\,dV_{g_i}.
\]
Use the MATCH-E12 relative relation in the supplied boundary
frames. In the defining matrix trace convention the density of
\(Q_\pm\) is \(\mp\operatorname{tr}(F_\pm\wedge F_\pm)\),
so, absorbing the chirality sign into the integer,
\[
 Q_\pm(U)=8\pi^2 k_{i,A,b,\pm}
               \mp\int_{\partial U}\operatorname{CS}(A_\pm),
 \qquad k_{i,A,b,\pm}\in\mathbb Z .
 \tag{3}
\]
In particular the distance to \(8\pi^2\mathbb Z\) is bounded
by the magnitude of the oriented sum in (2). This is an exact
relative identity. The boundary frames define the integer;
they need not extend across \(U\). The sign is consistent with
\(c_2(S^+)=-1\) on an oriented homotopy sphere in the DIR
convention.
[MATCH-E12 relative identity and scope](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md#boundary-trivializations-and-relative-integer) · [DIR §3, chiral bundle convention](../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L438)

Equation (1) supplies bounds on every physical subregion:
\[
 -(8\pi^2-\delta)\le -D_i/4\le Q_\pm(U)
 \le E_i+8\pi^2\operatorname{Vol}_{g_i}(U).
\]
If \(\operatorname{Vol}_{g_i}(U)\le\delta/(16\pi^2)\), then
\(|Q_\pm(U)|\le8\pi^2-\delta/2\). Select \(A\) large and \(b\)
small so that the volume limit and the boundary estimate have
strict slack in these bounds. At each such fixed \(A,b\),
take \(i\) large. If the boundary error is strictly less than
\(\delta/2\), the integer in (3) is zero, since every nonzero
multiple of \(8\pi^2\) is at least \(\delta/2\) from the interval
where \(Q_\pm(U)\) lies. The same reasoning applies component
by component using the sum of absolute boundary estimates,
with the global volume and curvature bounds. At fixed \(A,b\)
the remaining signed charge is a boundary value. It need
not tend to zero at that fixed pair. Taking the source
\(\limsup\) first and then \(A\to\infty,\ b\downarrow0\),
one obtains
\[
 Q_\pm(U_{i,A,b})\longrightarrow0,\qquad
 E_\pm(g_i;U_{i,A,b})-\tfrac14 D_i(U_{i,A,b})\longrightarrow0
\]
in this iterated sense. In particular, when both chiralities
are tracked the full tensor Weyl integral differs from
\(2D_i(U_{i,A,b})\) by a quantity tending to zero.

Fixed inner integrals \(E_\pm(g_i;\iota_{i,A}K_A)\) and
\(D_i(\iota_{i,A}K_A)\) converge to those of \(h_X\) on \(K_A\),
because they are invariant under the constant rescaling.
Fixed exterior integrals converge to those of \(h_N\) on \(N_b\)
in the physical comparisons. The tail of the AE Weyl or
trace-free Ricci energy is \(O(A^{-2\alpha})\) by the \(r^{-2-\alpha}\)
curvature bound and the Euclidean volume growth there. The two
energies in omitted smooth exterior balls are \(O(|P|b^4)\).
Consequently the no-neck energy defect in this comparison class
is determined by physical trace-free Ricci accounting:
\[
 e-E_\pm(h_X)-E_\pm(h_N)
   =\tfrac14\left(\lim_i D_i
      -\int_X|\operatorname{Ric}_{0,h_X}|^2\,dV_{h_X}
      -\int_N|\operatorname{Ric}_{0,h_N}|^2\,dV_{h_N}\right).
 \tag{4}
\]
Here \(D_i\) converges by the scalar and energy sequence limits
in (1). If necessary, take the common subsequence before all
truncation limits. The two chiral deficits are nonnegative and
equal to each other under these hypotheses. The vanishing of
either chiral deficit is therefore equivalent to exhaustion of
the same-gauge trace-free Ricci budget. Quantization cancels a
signed density. A residual can have positive Weyl and
trace-free Ricci energies of the ratio in (4).

A slow diagonal can realize the same estimates if desired.
Fix finite buffers and predetermined pairs \(A_m\to\infty\),
\(b_m\downarrow0\). At each fixed pair take a threshold for
disjoint embeddings, normalized \(C^2\) errors in (2), physical
volumes, and fixed-domain Weyl and Ricci integrals to be within
a prescribed tolerance going to zero with \(m\). Also impose
\(\lambda_i A_m\to0\) along the selected diagonal by demanding
\(\lambda_i A_m\le1/m\) at that threshold. With strictly
increasing thresholds and the largest available \(m\) at each
\(i\), these statements hold on one actual residual sequence.
This selection gives no overlap of the end charts. The iterated
or diagonal conclusion concerns the actual complement of all
supplied truncations, including any noncylindrical pieces.

## Outer gauges with a nonconstant conformal factor

A smooth exterior comparison of \(\widetilde g_i=\Omega_i^2g_i\)
still accounts for the corresponding chiral Weyl integrals,
since the Weyl measures are conformally invariant. It does not
supply physical volume exhaustion, \(s_{h_N}=y\), or physical
Ricci accounting by the argument above. The physical volume
weight is \(\Omega_i^{-4}\), and scalar and Ricci curvature
compare through derivatives of \(\log\Omega_i\). Similarly,
the physical spin connection relative to the conformally
related frame differs by terms in \(d\log\Omega_i\). Thus
small Cartesian-frame Chern–Simons for a conformal
comparison metric need not be small for the physical
connections in (3).

For a model of the latter distinction, use
\(g=\rho^{-2}\delta\) on a spherical shell and \(\widetilde
g=\delta\). The Euclidean comparison has zero Chern–Simons
in its Cartesian spin frames. Extend \(g\) smoothly inside
a ball by a radial conformal factor, keeping the unit round
product on a neighborhood of its boundary. Its boundary is
totally geodesic. Gauss–Bonnet with this boundary and \(W=0\)
gives \(Q_+=Q_-=4\pi^2\) on that ball, with the scalar
square integrated pointwise in the signed density. The symmetric
Cartesian conformal frame extends through the ball, so
(3) there has zero relative integer and boundary integrals
of magnitude \(4\pi^2\) in each chirality. The connection
on the shell agrees with the one in the extension.
This model illustrates the effect of the nonconstant
conformal change without positing a Yamabe-minimizing
source family. To use (3) in a nonconstant comparison
one needs separate bounds on the physical boundary
connection or on its conformal change terms, and separate
physical volume and Ricci data.
[Lee–Parker, equations (2.5)–(2.6), curvature changes](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [SEC, boundary Gauss–Bonnet conventions](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4011)
