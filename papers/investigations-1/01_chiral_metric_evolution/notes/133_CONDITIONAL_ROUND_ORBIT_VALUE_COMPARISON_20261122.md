# E133 — Conditional quantitative comparison to one round bundle pullback

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I authored E129 and E57 and audited the E76 smooth-limit
input and the E90 manuscript integration in E77/E78 and E97.
I did not author E14, E90, E76 or E131. This is the bounded B69
implication, with the pending whole-time endpoint combination as
a premise. No new primary source was inspected.
[Frozen request][req] · [B69][b69] · [Packet return][ret].

## Setting, premises and claimed comparison

Use the smooth compact closed oriented standard \(S^4\), the actual
positive perfect chiral \(\mathrm{SO}(3)\) connection \(A_0\), its
curvature \(F_0\), and native metric \(G=g^{\rm F}_{A_0}\) of
sectional curvature \(1/2\), with the negative Killing internal
pairing. Write \(D_0\) for the induced fixed product derivative.
For smooth actual input define
\[
 v=\|A_{\rm in}-A_0\|_{C^0,G}+
      \|F_{A_{\rm in}}-F_0\|_{C^0,G},\qquad
 \ell=\|T(A_{\rm in})\|_{L^{4,1}(g^{\rm F}_{A_{\rm in}})} .
\]
The fixed connection and curvature difference norms use the
corresponding one- and two-form norms. The live Lorentz norm
uses the live tensor modulus and volume with layer formula
\(4\int_0^\infty \mu(\lambda)^{1/4}\,d\lambda\).

The original \(A(\tau)\) is the existing global smooth unadjusted
flow in the fixed base and bundle identification on the smooth
round value basin. Write \(g_\tau=g^{\rm F}_{A(\tau)}\) and
\(Q(\tau)=Q(A(\tau))\), and set
\[
 J(\tau)=\int_0^\tau\sup_{S^4}
                \bigl(|\nabla^{A(u)}T(A(u))|_{g_u}+|T(A(u))|_{g_u}^2\bigr)\,du .
\]
Assume on one fixed value-small basin the following pending
endpoint conclusions, with constants independent of initial
derivatives and \(\ell\):
\[
 J(\infty)\le C_J\ell,\qquad E_h(q_{\rm head})\le C_h\ell,\qquad
 \|q_{\rm st}(s)\|_{H^5;0}\le C_{\rm st}\ell e^{-\kappa s},
 \quad s=\tau-h\ge0 .
 \tag{1}
\]
Here \(h>0\) is fixed, the adjusted head and stable background
are in their specified fixed small value tubes, and their
recoveries at each time are the exact smooth original-flow
pullbacks. The strictly positive \(\kappa\) is fixed. This
is precisely the head/tail combination being tested, with
no extra condition on \(\ell\). The E129 and E131 returns
were read, and the E132 head audit return was observed.
The whole-time premise remains conditional in this packet.
[E129][e129] · [E129 return][r129] · [E132 return][r132] ·
[E131 frozen request][req131] · [E131][e131] · [E131 return][r131].

The claimed conclusion for one joint limit pullback
\(j_\infty\) is
\[
 \|A_{\rm in}-j_\infty^*A_0\|_{C^0,G}
 +\|F_{A_{\rm in}}-j_\infty^*F_0\|_{C^0,G}
              \le C e^{C\ell}\ell.                              \tag{2}
\]
On any fixed small interval \(0\le\ell\le\ell_*\), the right
side is bounded by \(C_{\ell_*}\ell\); (2) itself has no
\(\ell\)-threshold. The exact volume and relative geometry
consequences are given below. This uses the assessed smooth
limit on the existing value basin.
[E76, original limiting pair][e76] · [E76/E77 assessment][a76].

## The additional time integral of the strain

On the adjusted head write \(A_{\rm adj}=A_0+a\) and
\(q=q_{\rm head}=Q(A_{\rm adj})-I\). Its positive small
value tube gives a uniform equivalence of its live and
reference metrics and a uniform bound for \(Q^{-1/2}\).
These follow from the adjusted curvature values in the
premise. The strain formula on this tube yields
\[
 \|T(A_{\rm adj})\|_{\infty,\mathrm{live}}
       \le C(\|D_0q\|_\infty+\|q\|_\infty)
\]
because \(\nabla^{A_{\rm adj}}Q=D_0q+[\operatorname{ad}(a),q]\)
and \(a\) is value bounded.

For the E129 supported coordinate pieces \(q_\alpha\), let
\(d_{\alpha j}(\tau)=2^{j/2}\|\Delta_j q_\alpha(\tau)\|_8\).
The block Bernstein estimate from E53 and fixed E57
reconstruction used in E129 give
\[
 \|D_0^kq(\tau)\|_\infty
        \le C\sum_{\alpha,j}2^{kj}d_{\alpha j}(\tau),\qquad k=0,1 .
\]
Here fixed reconstruction derivatives produce only lower powers
of \(2^j\), and the inhomogeneous \(j=0\) block is included.
Each \(2^{kj}\) is at most \(2^{2j}\), so Tonelli and the
definition of \(H_h\) give
\(\int_0^h(\|D_0q\|_\infty+\|q\|_\infty)\,d\tau\le C H_h(q)\).
This uses the unweighted part of E129's time-frequency estimate
and bounds the head integral of the strain by \(C_h\ell\).

On the stable adjusted background \(B(s)\) the same strain
formula with \(a=B-A_0\) in its fixed small tube, together with
the fixed \(H^5\) to \(C^2\) embedding in dimension four, gives
\[
 \|T(B(s))\|_{\infty,\mathrm{live}}
       \le C\|q_{\rm st}(s)\|_{H^5;0}
       \le C C_{\rm st}\ell e^{-\kappa s}.
\]
Its time integral is bounded by \(C C_{\rm st}\ell/\kappa\).
By E84 the pointwise live norm of \(T\) on the original slice
is the corresponding adjusted norm composed with the base
diffeomorphism. The spatial suprema therefore agree at the
same native times. Thus
\[
             \int_0^\infty \|T(A(\tau))\|_{\infty,g_\tau}
                        \,d\tau\le C_T\ell .                      \tag{3}
\]
The argument uses the quantitative head and tail norms in (1);
a squared-strain integral alone would not give (3).
[E129, (6)–(7) and block norms][e129] · [E131, (14)][e131] ·
[E84, (3)–(5)][e84].

## Physical velocities in the native convention

First track the conversion in E14. For the manuscript time
\(t\) and metric \(\widehat g\), put \(c=2K\). The native
time and live metric are \(\tau=ct\) and \(g=c\widehat g\).
At fixed bracket basis the negative Killing pairing is
twice the manuscript pairing, so the components of an
adjoint-valued tensor in orthonormal internal frames gain
\(\sqrt2\) in native norms. The induced operator norms on
endomorphisms are unchanged by this constant internal
rescaling. In particular \(Q,S=Q^{1/2},T\) are the same
endomorphism-valued tensors, with their base norms changing
only by the metric. Constant base scaling preserves the
Levi–Civita connection. Thus
\[
 |T|_g=c^{-1/2}|T|_{\widehat g},\qquad
 |\nabla^A T|_g=c^{-1}|\nabla^A T|_{\widehat g}.
\]
The time factor \(c\) cancels the factor \(c^{-1}\) for
each summand defining \(J\). The native volume factor \(c^2\)
and the strain modulus factor \(c^{-1/2}\) also cancel in
the layer formula for \(\ell\). For the adjoint-valued
time derivatives themselves, at corresponding times,
\[
 |A_\tau|_g=\sqrt2 c^{-3/2}|A_t|_{\widehat g},\qquad
 |F_\tau|_g=\sqrt2 c^{-2}|F_t|_{\widehat g}.
 \tag{4}
\]
The factors include one inverse clock as well as the base
degree. Multiplication by \(S^{-1}\) on the left of the
curvature commutes with this comparison.
[E14, conventions and (1)][e14] · [E84, native budget][e84].

The native physical velocity is
\[
 A_\tau=-d_A^{*g}[(4Q-\tfrac23\operatorname{tr}(Q^2)I)F]
        =-4d_A^{*g}[(q-\tfrac16|q|^2I)F],\quad q=Q-I .
\]
The identity follows from trace three and
\(d_A^{*g}F=0\) by self-duality and Bianchi.
The codifferential on two-forms is the negative metric
contraction of the covariant derivative. Thus, in the
actual unadjusted identification,
\[
 (A_\tau)_b=4 C^a F_{ab},\quad
 C_a=\nabla^A_a Q-\tfrac13\operatorname{tr}(Q\nabla^A_aQ)I .
\]
The trace expression uses \(\operatorname{tr}\nabla^A Q=0\).
For \(N_a=S^{-1}C_a S\), E14 gives the polynomial identity
in \(Q,T\) and \(|N|_g\le36|T|_g\); the bound is unchanged
as an endomorphism-valued one-form under native scaling.
Here \(S^{-1}F\) consists of a native orthonormal self-dual
triple by \(F_i\wedge F_j=Q_{ij}\,dV_g\).
For a native unit self-dual two-form \(\omega\),
\(|\iota_X\omega|=|X|/\sqrt2\), by using a unit covector
in the direction of \(X\) and the two orthogonal
self-dual components of \(\omega\).
The contraction over its three internal components in
\(N^a (S^{-1}F)_{ab}\) therefore has norm at most
\(\sqrt{3/2}|N|_g\) by Cauchy–Schwarz. Since
\(C^aF_{ab}=S N^a (S^{-1}F)_{ab}\) and
\(\|S\|_{\rm op}\le\sqrt3\) by trace three, one may take
\[
                  |A_\tau|_g\le216\sqrt2\, |T|_g .              \tag{5}
\]

For the curvature derivative use the assessed relative
bound of E14. In the native norm (4) gives
\[
 \begin{aligned}
 |S^{-1}F_\tau|_g
 &\le \sqrt2\,c^{-2}K
        \big(360|\nabla^A T|_{\widehat g}+4512|T|_{\widehat g}^2\big)\\
 &=\tfrac1{\sqrt2}
        \big(360|\nabla^A T|_g+4512|T|_g^2\big).
 \end{aligned}
\]
Multiplication by \(S\) and its trace-three upper bound
give
\[
 |F_\tau|_g\le\sqrt{\tfrac32}
                 \big(360|\nabla^A T|_g+4512|T|_g^2\big).
 \tag{6}
\]
The relative estimate controls the conjugated combination
polynomially and uses no fixed positive lower eigenvalue
of \(Q\). Removing \(S^{-1}\) in (5)–(6) uses its inverse
\(S\) only with the upper bound \(\sqrt3\). Thus the
physical bounds on the original flow require no coordinate
value tube or extra eigenvalue-floor premise along it.
[E14, (1)–(3)][e14] · [E14 assessment][a14] ·
[E84, native physical velocity (7)][e84].

## Fixed-reference integration and the common limiting map

Put \(C_*=4512\sqrt2\) as in E14 and
\(\mathfrak d=C_*J(\infty)\le C_* C_J\ell\).
The relative velocity bounds for \(g^{-1}\partial_\tau g\)
and \(S^{-1}(\partial_\tau Q)S^{-1}\) in E14 carry unchanged
to native time. Each left side acquires \(c^{-1}\) and the
live integrand on its right acquires the same factor.
Thus for all \(\tau\ge0\) in the unadjusted identification
\[
 e^{-\mathfrak d}g_{\rm in}\le g_\tau
           \le e^{\mathfrak d} g_{\rm in},\qquad
 e^{-\mathfrak d}Q_{\rm in}\le Q(\tau)
           \le e^{\mathfrak d} Q_{\rm in},
 \quad g_{\rm in}=g^{\rm F}_{A_{\rm in}} .
 \tag{7}
\]
For the metric this comes from integrating the logarithm
of its squared length on fixed nonzero tangent vectors.
For \(Q\) it uses the relative operator acting on \(S\)
times each fixed nonzero internal vector. It therefore
compares full quadratic forms without choosing time-varying
eigenvectors.

Small initial curvature values give \(g_{\rm in}\le C_0 G\)
by smooth fixed reference reconstruction, with \(C_0\) uniform
on the basin. Then \(G^{-1}\le C_0 e^{\mathfrak d}g_\tau^{-1}\).
For a covariant \(k\)-form with a fixed native internal
norm, the comparison in the induced metric gives
\[
 |W|_G\le C_0^{k/2}e^{k\mathfrak d/2}|W|_{g_\tau}.
\]
Indeed in a \(g_\tau\)-orthonormal diagonalizing frame
for the reference dual metric, the squared norms of
alternating components acquire products of \(k\) dual
eigenvalues, each bounded by \(C_0e^{\mathfrak d}\).
Apply this with \(k=1\) to \(A_\tau\) and \(k=2\)
to \(F_\tau\). There is no measure factor in these
spatial supremum norms. Equations (3), (5) and (6)
then give
\[
 \begin{split}
 \int_0^\infty\|A_\tau\|_{C^0,G}\,d\tau
       &\le C e^{\mathfrak d/2}\ell,\\
 \int_0^\infty\|F_\tau\|_{C^0,G}\,d\tau
       &\le C e^{\mathfrak d}\ell .
 \end{split}                                                      \tag{8}
\]
All these estimates are on the fixed original base
and bundle. Connection differences on this fixed
bundle are adjoint-valued one-forms, so integrating
the velocity in the affine connection space is
legitimate in the reference norm.

The E76 assessed smooth limit on the value basin supplies
one smooth equivariant automorphism \(j_\infty\), with
orientation-preserving base map \(f_\infty\), and the
joint smooth limit
\[
             (A_\infty,F_\infty)=j_\infty^*(A_0,F_0).
 \tag{9}
\]
Indeed on its stable recovered tail the compatible pair is
\(j(\tau)^*(B(s),F_{B(s)})\) with the same \(j(\tau)\),
which converges smoothly to a smooth automorphism with
smooth inverse. The base maps of these recoveries are
orientation-preserving; the limit is a diffeomorphism
and the nonzero Jacobian determinant therefore retains
that sign. Curvature is natural under the same pullback
of the connection, hence both components in (9) use the
same bundle map. The E76 original flow and the earlier
splice recovery in the pending premise represent the same
smooth original solution by smooth uniqueness. It is
enough to use the E76 \(j_\infty\); no equality of gauge
paths or uniqueness of the limit map is needed.

Integrate the two physical velocities to finite time in
(8), then pass to the already supplied smooth limit (9).
This proves (2) since \(\mathfrak d\le C\ell\). If
\(0\le\ell\le\ell_*\) for a fixed \(\ell_*>0\), absorb
\(e^{C\ell_*}\) into the constant to obtain \(C_{\ell_*}\ell\).
In particular when \(\ell=0\), the physical velocities
vanish by (3), (5)–(6), so \(A_{\rm in}=A_\infty\) and the
original connection is stationary. No threshold on \(\ell\)
was used to obtain the fixed reference norm conversion.
[E14, (4)–(5)][e14] · [E76, (15)–(16)][e76] ·
[E76/E77 assessment][a76].

## Metric, volume, scalar distances and variational comparisons

Let \(g=g_{\rm in}\) and \(h_\infty=g^{\rm F}_{A_\infty}
=f_\infty^*G\). The latter is a round metric of sectional
curvature \(1/2\), and \(Q(A_\infty)=I\) by naturality.
In the fixed unadjusted identification the curvature volume
is preserved pointwise as a positive four-form. With the
native pairing this is the metric volume \(dV_{g_\tau}\);
equivalently the normalized preserved form is a fixed
multiple of the normalized metric volume and the scale
factor to the native metric volume is constant. Passing
to the supplied smooth limit gives the exact endpoint
identity
\[
                dV_g=dV_{h_\infty}=f_\infty^*dV_G .              \tag{10}
\]
This is equality of forms on the same base, hence also
equality of total volumes. It is the original-flow
identity, independent of whether adjusted volume is advected.

Taking the smooth limit in (7) and reversing the two form
inequalities gives
\[
 e^{-\mathfrak d}h_\infty\le g\le e^{\mathfrak d}h_\infty,\qquad
 e^{-\mathfrak d}I\le Q(A_{\rm in})\le e^{\mathfrak d}I .         \tag{11}
\]
These bounds and the ones below are valid for all the
smooth value-small data under (1), with no extra
initial strain threshold. The sharper exponent
\(C_*J(\infty)\) or its fixed upper bound \(C_*C_J\ell\)
can be used.

Taking square roots of (11) on tangent vectors and
integrating each piecewise smooth curve gives, for all
\(x,y\in S^4\),
\[
 e^{-\mathfrak d/2}d_{h_\infty}(x,y)
   \le d_g(x,y)\le e^{\mathfrak d/2}d_{h_\infty}(x,y).
\]
The same factors compare \(\operatorname{diam}(g)\) to
\(\operatorname{diam}(h_\infty)=\pi\sqrt2\). The metric
\(h_\infty\) is isometric via \(f_\infty\) to \(G\);
the lengths compare \(g\) to that round metric in
this possibly different identification.

Use the common volume \(d\nu=dV_g=dV_{h_\infty}\).
The inverse form comparison bounds the scalar
Dirichlet energies on the common \(H^1\) domain:
\[
 e^{-\mathfrak d}\int |du|_{h_\infty}^2\,d\nu
 \le \int |du|_g^2\,d\nu
 \le e^{\mathfrak d}\int |du|_{h_\infty}^2\,d\nu .
\]
Their Rayleigh quotients have the identical denominator
\(\|u\|_{L^2(d\nu)}^2\). The variational min–max formula
therefore gives simultaneously for all \(j\ge0\),
including multiplicities and \(\lambda_0=0\), the
nonnegative scalar spectral comparisons
\[
 e^{-\mathfrak d}\lambda_j(G)
       \le\lambda_j(g)\le e^{\mathfrak d}\lambda_j(G).
\]
Here \(\lambda_j(h_\infty)=\lambda_j(G)\) by the isometry.
With normalized scale \(\widehat g\) instead, all native
eigenvalues are \(1/(2K)\) times their normalized
counterparts and native lengths are \(\sqrt{2K}\)
times normalized lengths. The distortion exponent is
the same across the two scales.

For any supplied round Sobolev constants
\(C_\nabla,C_2>0\) in
\(\|u\|_{L^4(G)}^2\le C_\nabla\int |du|_G^2dV_G+
 C_2\|u\|_{L^2(G)}^2\), pull back by \(f_\infty\).
The volume equality identifies both function norms
and the energy bound gives, for every \(u\in H^1(S^4)\),
\[
 \|u\|_{L^4(g)}^2
       \le e^{\mathfrak d} C_\nabla\int |du|_g^2\,dV_g
                               +C_2\|u\|_{L^2(g)}^2 .
\]
Under constant scaling to the native metric from the
normalized one \(C_\nabla\) is unchanged and \(C_2\)
divides by \(2K\), since squared \(L^4\) and the
Dirichlet energy scale by \(2K\), while squared \(L^2\)
scales by \((2K)^2\).

These are the E90 intrinsic relative comparisons under
the broader **conditional** basin hypothesis of (1).
They compare to a round pullback and do not require
closeness of its base diffeomorphism to the identity
in the fixed coordinates. Separately, (2) is an absolute
fixed-reference value bound on the initial pair relative
to that same bundle pullback. It supplies no derivative
norm or recovery-map distance estimate, and uses the
already established smooth original flow and limit.
[E90, endpoint forms, spectrum and Sobolev][e90] ·
[E90/E92 assessment][a90] · [E84, curvature and metric naturality][e84].

## Consumed identities

All frozen digests matched. The observed E132 return and E131
note and return are recorded as such. These observations do
not promote the pending whole-time combination.

| Input | SHA-256 |
| --- | --- |
| [E133 request][req] | b41a9b2b2dca45080a429f0160a0c950266b775caaa50fc29d09607d39d2951d |
| [B69][b69] | 6ba84ef0e69ec0576098ce7fc1e4372049adda82b3757e0c0f11d0087e410dc5 |
| [E14][e14] | 204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193 |
| [E84][e84] | fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9 |
| [E90][e90] | 6d67f6bc601df3dc0940ee8815be30f26c83c2849f6153913deb61569ef69395 |
| [E129][e129] | d8934b1c8fce1ed0cec01ae8f4deec591d85eaccdab25e6a7cd08abd065cf707 |
| [E129 return][r129] | 2d255a480f8df5f584770a8f9217f5a0b5e1e5bacc0c23176478e22ea3128129 |
| [E132 return][r132] | 0a856856c80e09b0b61e52bb73e1fe3d0e61807c37a3a2f566c77e405579c902 |
| [E131 request][req131] | 8e438e8674a666f8b70272c850fbd58d3709e4d1796c44c3cdc841fa0c38dba2 |
| [E131][e131] | 8fc6b6416e2e4d5bb0a17b1dad74eada29a2bf41668d197880fbf313d9ab4e80 |
| [E131 return][r131] | a727bd65aabaa7efefe33a117b46c0b2a8304707c0742e2315d5479bbfab33d1 |
| [E76][e76] | 2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0 |
| [E14 assessment][a14] | bd724f630ce71c496dca082b931c1c01a908c7bc2042d09079d3c225c8eca87e |
| [E76 assessment][a76] | c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1 |
| [E90 assessment][a90] | 8dc76b69d4143043a95958f42005f12b348999ee59d7265aa33e2d5073bc52ad |

[req]: ../research-progress/handoffs/SP4-CME-E133_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E133_RETURN_v1.md
[b69]: ../brainstorm/notes/B69_QUANTITATIVE_ORBIT_COMPARISON_20261122.md
[e14]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e84]: 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e90]: 90_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md
[e129]: 129_CONDITIONAL_INTRINSIC_ENDPOINT_HEAD_20261122.md
[r129]: ../research-progress/handoffs/SP4-CME-E129_RETURN_v1.md
[r132]: ../research-progress/handoffs/SP4-CME-E132_RETURN_v1.md
[req131]: ../research-progress/handoffs/SP4-CME-E131_REQUEST_v1.md
[e131]: 131_CONDITIONAL_DEFECT_SENSITIVE_TAIL_20261122.md
[r131]: ../research-progress/handoffs/SP4-CME-E131_RETURN_v1.md
[e76]: 76_HIGH_ORDER_STABLE_LIMIT_20261122.md
[a14]: ../reviews/E14_TEMPORAL_ASSESSMENT_20261122.md
[a76]: ../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
[a90]: ../reviews/E90_E92_GEOMETRY_ASSESSMENT_20261122.md
