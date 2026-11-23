# E103 — Critical curvature oscillation after an internal Coulomb gauge

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I authored E99, which is a provisional dependency of
the Coulomb application below. The arbitrary-gauge lower bound is
independent of E98 and E99. This executes the second test of
[B58][b58] under the [frozen request][req]. [Packet return][ret].

## The round pullback sequence

Use the compact oriented standard Riemannian \(S^4\), its fixed
positive perfect chiral \(\mathrm{SO}(3)\) bundle and connection
\(A_0\), and the native reference metric \(g_0\) and positive
negative-Killing internal pairing. Write \(F_0=F_{A_0}\),
\(d_0=d_{A_0}\), and \(D_0\) for the associated covariant derivative
on all slots. The reference volume is \(\mu_0=dV_{g_0}\); in a
positive-pairing orthonormal internal frame,
\(F_{0i}\wedge F_{0j}=\delta_{ij}\mu_0\). Write
\(\|U\|_{\mathcal B^{1/2}}\) for E66's localized E59 fixed-atlas
\(B^{1/2}_{8,1}\) norm. The pair norm is the sum of the two component
norms. [E66, statement and conventions][e66] ·
[E59, localized norm (7)][e59].

Choose the E95 type of principal trivialization over a chart \(U\)
with coordinates \(x\) orthonormal at the center. Write
\(e_i=\partial_{x^i}\), take cubes \(Q_j=(-jd,jd)^4\) for
\(j=1,2,3\) with \(\overline{Q_3}\) interior to the chart, and
choose a fixed smooth \(\rho\) supported in \(Q_3\) with
\(0\le\rho\le1\) and \(\rho=1\) on \(Q_2\). For \(n=2^j\)
tending to infinity, set
\[
 \epsilon_n=n^{-1/4},\qquad \delta_n=\epsilon_n/n,\qquad
 V_n=\delta_n\rho(x)\sin(nx^1)e_2.
\]
Extend \(V_n\) by zero, let \(\psi_{n,t}\) be its flow, and set
\(\psi_n=\psi_{n,1}\). The compact support is interior to the chart,
so the field is smooth globally. The flow exists for all time,
preserves the chart, and is the identity near its boundary.
Indeed exterior points and a collar are fixed, and invertibility
precludes a trajectory moving into that fixed set. The flow
preserves orientation. The displacement for \(|t|\le1\) is at
most \(\delta_n\) in the chart, and
\(\|DV_n\|_\infty\le C\epsilon_n\). The variational equation
\(\partial_t D\psi_{n,t}=(DV_n\circ\psi_{n,t})D\psi_{n,t}\)
gives \(\|D\psi_{n,t}-I\|_\infty\le e^{C\epsilon_n|t|}-1\).
On \(Q_1\) the trajectory stays in \(Q_2\) for such \(t\) once
\(\delta_n<d\), and \(x^1\) stays fixed. In particular,
\[
 \psi_n(x)=x+\delta_n\sin(nx^1)e_2,\qquad
 D\psi_n=I+\epsilon_n\cos(nx^1)e_2\otimes dx^1
                       \quad(x\in Q_1).                         \tag{1}
\]

The equivariant bundle map \(G_n(x,h)=(\psi_n(x),h)\) glues
to the identity outside the chart through the fixed collar.
It is an automorphism, with inverse given there by
\((x,h)\mapsto(\psi_n^{-1}(x),h)\). Put \(A_n=G_n^*A_0\),
\(a_n=A_n-A_0\), and \(\beta_n=F_{A_n}-F_0\).
Curvature naturality gives \(F_{A_n}=G_n^*F_0\).
In the chosen trivialization both the connection potential and
the curvature of \(A_n\) are ordinary base pullbacks of their
fixed reference coefficient arrays. For either array \(W\) of
degree \(k=1,2\), coefficient composition changes it by
\(O(\delta_n)\) using \(\|DW\|_\infty\) on the fixed support,
while replacing its \(k\) input slots by \(D\psi_n\) changes it
by \(O(\epsilon_n)\) using the variational bound. The differences
are zero off the compact support. They are tensorial on chart
overlaps, including the difference of connection potentials.
Consequently
\[
             \|a_n\|_\infty+\|\beta_n\|_\infty\le C\epsilon_n .   \tag{2}
\]
The wedge Gram matrix pulls back to the identity times
\(\psi_n^*\mu_0\). Hence the normalized \(Q(A_n)=I\), the
native curvature metric is \(\psi_n^*g_0\), and \(T(A_n)=0\)
because \(\nabla^{A_n}I=0\). These conclusions also hold after
any smooth internal gauge. Internal conjugation preserves the
wedge Gram matrix in an orthonormal frame and leaves the base
metric unchanged. [E95, shear, lift and perfectness][e95] ·
[E96, independent checks][e96].

## Curvature in one fixed inner window

Fix \(M_*>0\). Suppose \(u_n\) are internal gauges with
\(\|u_n-I\|_{C^1}\le M_*\epsilon_n\) in the fixed endomorphism
norm, with \(D_0\) as its derivative. Let
\(L_n=\operatorname{Ad}_{u_n}\) act on the internal slot.
In the chosen frame
\(\|L_n-I\|_{C^1}\le C_{M_*}\epsilon_n\). This follows by
differentiating conjugation and comparing ordinary and
covariant derivatives of \(u_n-I\) using the fixed smooth
coefficients. The curvature in the exact E98 action
\(A\mapsto uAu^{-1}-du\,u^{-1}\) is \(L_n F_A\).
Define \(\beta_n^u=L_nF_{A_n}-F_0\). [E98, action][e98].

When writing \(F_0(\psi_n(x))\) on \(Q_1\) we use the
coefficient array at \(\psi_n(x)\) in the chosen frames
with the coordinate index labels at \(x\). By (1), for \(v,w\)
in the coordinate slots the two linear corrections to
\(F_0(\psi_n(x))(v,w)\) are
\[
 \epsilon_n\cos(nx^1)
  \big(dx^1(v)F_0(\psi_n(x))(e_2,w)
       -dx^1(w)F_0(\psi_n(x))(e_2,v)\big).
\]
The quadratic term has repeated vector \(e_2\) and vanishes.
Put \(H=dx^1\wedge\iota_{e_2}F_0\), so the full pullback in
these coefficients equals
\[
 F_{A_n}(x)=F_0(\psi_n(x))
              +\epsilon_n\cos(nx^1)H(\psi_n(x)).
\]
Both fixed arrays \(F_0,H\) are Lipschitz on the inner support.
Replacing their compositions by their values at \(x\) gives
\[
 F_{A_n}=F_0+\epsilon_n\cos(nx^1)H+r_n,\qquad
       \|r_n\|_{L^\infty(Q_1)}\le C\delta_n.                     \tag{3}
\]
In fact the two errors are \(O(\delta_n)\) and
\(O(\epsilon_n\delta_n)\), respectively.

The coefficient \(H(e_1,e_3)=F_0(e_2,e_3)\) is a nonzero
internal vector at the center. Indeed the three \(F_{0i}\)
span the self-dual space there, as follows from the chiral
curvature and the nondegenerate wedge Gram matrix. The
self-dual form \(dx^2\wedge dx^3+*(dx^2\wedge dx^3)\) has value
\(1\) on \((e_2,e_3)\) at that point. Choose a fixed scalar
component \(\lambda\) of the coordinate and internal array
for which \(\lambda H\) is nonzero at the center. Take
a fixed scalar cutoff \(\theta\) supported inside \(Q_1\)
which is one on a closed coordinate rectangle \(R\) with
nonempty interior about the center, chosen so that
\(|\lambda H|\ge h_*>0\) there.

For this window alone put \(y=x/(2\pi)\) and extend the
supported scalar coefficients by zero to the unit torus.
The chart size can be chosen so the support is strictly
inside the fundamental cube. The purpose of the fixed
rescaling is to use the existing period-one E53 Fourier
convention with the original E95 phase \(nx^1=2\pi n y^1\).
The scalar projection \(\lambda\) still acts on the \(x\)
coefficient array. By (3), the resulting scalar
\(z_n(y)=(\theta\lambda\beta_n^u)(2\pi y)\) satisfies
\[
 \begin{aligned}
 z_n&=\epsilon_n p_n\cos(2\pi n y^1)+q_n+e_n,\\
 p_n&=(\theta\lambda(L_nH))(2\pi y),\\
 q_n&=(\theta\lambda((L_n-I)F_0))(2\pi y),\\
 e_n&=(\theta\lambda(L_n r_n))(2\pi y).
 \end{aligned}                                                    \tag{4}
\]
The compact cutoff and the preceding estimates give
\[
 \|p_n\|_{C^1}\le C_{M_*},\qquad
 \|p_n-(\theta\lambda H)(2\pi\,\cdot)\|_\infty
       +\|q_n\|_{C^1}\le C_{M_*}\epsilon_n,\qquad
 \|e_n\|_8\le C_{M_*}\epsilon_n/n.                               \tag{5}
\]
These use only the values of \(r_n\) and first derivatives
of the gauge. On \(R/(2\pi)\), \(|p_n|\ge h_*/2\) for large
\(n\). The integral of \(|\cos(2\pi n y^1)|^8\) on the
first-coordinate interval of that rectangle is bounded below
by a fixed positive constant: the interval contains whole
periods with total length at least half the interval length
for all sufficiently large \(n\), and the average on each
period is positive. Multiplication by the other interval
lengths gives
\[
                \|p_n\cos(2\pi n y^1)\|_8\ge c_0>0.            \tag{6}
\]
Here \(c_0\) is fixed by the reference and rectangle, while
the large-\(n\) threshold may depend on \(M_*\).

## Annular block and comparison with the fixed norm

Let \(\varphi=\chi-\chi(2\,\cdot)\) be E53's annular symbol.
For \(j=\log_2 n\ge1\) its periodized kernel \(K_j\) has
integral zero since \(\varphi(0)=0\), and
\(\|K_j\|_1\le\|\check\varphi\|_1\). With torus distance
\(d_{\mathbb T}\), its first absolute moment satisfies
\[
 \int_{\mathbb T^4}d_{\mathbb T}(y,0)|K_j(y)|\,dy
 \le \sum_{\ell\in\mathbb Z^4}
     \int_{[-1/2,1/2)^4}|y+\ell|\,2^{4j}
           |\check\varphi(2^j(y+\ell))|\,dy
 = n^{-1}\int_{\mathbb R^4}|v||\check\varphi(v)|\,dv.               \tag{7}
\]
The last integral is finite by smooth compact symbol support.
The comparison uses \(d_{\mathbb T}(y,0)\le |y+\ell|\) for
each \(\ell\). Since \(\chi(e_1)=1\) and \(\chi(2e_1)=0\) in
frequency coordinates, \(\Delta_j c_n=c_n\) for
\(c_n(y)=\cos(2\pi n y^1)\). With the commutator written as a
convolution against a difference, (7) gives
\[
 \begin{aligned}
 \Delta_j(p_n c_n)(y)-p_n(y)c_n(y)
 &=\int_{\mathbb T^4}K_j(v)(p_n(y-v)-p_n(y))c_n(y-v)\,dv,\\
 \|\Delta_j(p_n c_n)-p_n c_n\|_8
 &\le C n^{-1}\|\nabla p_n\|_\infty .
 \end{aligned}
\]
The last estimate follows already in \(L^\infty\), and the
torus has volume one. The mean-zero property and the same
moment give
\(\|\Delta_j q_n\|_8\le Cn^{-1}\|\nabla q_n\|_\infty\).
The \(L^1\) kernel bound gives
\(\|\Delta_j e_n\|_8\le C\|e_n\|_8\). Thus (4)–(6) imply
\[
 \|\Delta_j z_n\|_8
   \ge c_0\epsilon_n-C_{M_*}\epsilon_n/n
   \ge (c_0/2)\epsilon_n,\qquad
 \|z_n\|_{B^{1/2}_{8,1}}\ge(c_0/2)\epsilon_n\sqrt n               \tag{8}
\]
for all sufficiently large dyadic \(n\).
[E53, partition and periodized kernels][e53].

To compare this window with the actual norm, let \(v_\gamma\)
be the zero-extended components of \(\chi_\gamma U\) for the
fixed E59 partition and frames, for any smooth section \(U\)
of the same curvature bundle. Reconstruct \(U\) by summing its
pieces, first multiplying \(v_\gamma\) by a fixed inner cutoff
equal to one near \(\operatorname{supp}\chi_\gamma\) as in E59.
The scalar window \((\theta\lambda U)(2\pi\,\cdot)\) is then a
finite sum of terms \(\mathcal T_\gamma v_\gamma\). Each
\(\mathcal T_\gamma\) takes the form \(v\mapsto J(y)v(\Phi(y))\)
on the overlap, extended by zero. Its fixed smooth matrix
\(J\) includes the two cutoffs, the scalar projection and the
tensor and internal frame transitions. The cutoffs give a
compact support inside the coordinate overlap. The smooth
coordinate diffeomorphism \(\Phi\) includes the fixed change
from \(y\) into the original atlas coordinates. Change of
variables and the chain rule give \(L^8\) and \(W^{4,8}\)
bounds for \(\mathcal T_\gamma\), with fixed constants.

For completeness, write \(v_\ell=\Delta_\ell v\).
The E53 enlarged block cutoff and its differentiated
\(L^1\) kernels give
\(\|v_\ell\|_{W^{4,8}}\le C2^{4\ell}\|v_\ell\|_8\),
including \(\ell=0\) with the low cutoff. For \(k\ge1\)
divide the annular symbol by \((2\pi|\zeta|)^4\), apply the
resulting uniformly \(L^1\)-bounded block, and obtain
\(\|\Delta_k w\|_8\le C2^{-4k}\|w\|_{W^{4,8}}\).
Also all output blocks are \(L^8\) bounded. Consequently
\[
 \|\Delta_k\mathcal T_\gamma v_\ell\|_8
 \le C\min(1,2^{4(\ell-k)})\|v_\ell\|_8 \quad(k\ge1),
 \qquad
 \|\Delta_0\mathcal T_\gamma v_\ell\|_8\le C\|v_\ell\|_8.
\]
The geometric sums for \(k\le\ell\) and \(k>\ell\) with
weights \(2^{k/2}\) are bounded by \(C2^{\ell/2}\). Summing
in \(\ell\) and the finite atlas, with smooth input
reconstructed by \(\sum_\ell v_\ell\), gives
\[
 \|(\theta\lambda U)(2\pi\,\cdot)\|_{B^{1/2}_{8,1}}
                   \le C_{\mathrm{loc}}\|U\|_{\mathcal B^{1/2}}.
\]
Combining this with (8) gives, in the original fixed-atlas norm,
\[
 \|\beta_n^u\|_{\mathcal B^{1/2}}
                    \ge c\,\epsilon_n\sqrt n=c\,n^{1/4}.        \tag{9}
\]
The comparison uses only fixed changes of coordinate and frame.
[E59, norm (7)][e59] · [E57, block comparison (3)][e57].

## Provisional Coulomb application

For compact reference volume \(V\), the E98 Lorentz convention
gives \(\|a_n\|_{4,1}\le4V^{1/4}\|a_n\|_\infty\).
In the same convention Minkowski applied to the layer
representation of \(|b|\) gives
\(\|b\|_4\le\int_0^\infty\mu_0(\{|b|>v\})^{1/4}\,dv
=\|b\|_{4,1}/4\). Thus (2) and E98 (1) supply, provisionally,
smooth \(u_n,b_n\) with the exact E98 action and
\[
 \|u_n-I\|_\infty+\|b_n\|_4\le C\epsilon_n,\qquad d_0^*b_n=0 .
\]
Their curvature difference is \(\beta_n^u\) as in (4).
Conjugating \(\beta_n\) preserves its pointwise norm.
The term \((L_n-I)F_0\) is \(O(\epsilon_n)\) in \(C^0\)
by the \(C^0\) gauge bound, so \(\|\beta_n^u\|_\infty\le
C\epsilon_n\) independently of a gradient bound on the gauge.
The smallness premise of E99 (1) consequently holds for
large \(n\), and this provisional dependency gives
\[
           \|b_n\|_{W^{1,8}}+\|b_n\|_{C^{0,1/2}}
                         \le C\epsilon_n.                       \tag{10}
\]
The exact action gives \(D_0u_n=u_n a_n-b_nu_n\).
Together with (2), (10) and \(\|u_n-I\|_\infty=O(\epsilon_n)\)
it gives \(\|u_n-I\|_{C^1}\le C\epsilon_n\), since \(D_0I=0\).
Thus the arbitrary-gauge estimate (9) applies to these gauges.
[E98, result (1) and action][e98] · [E99, supplied estimate (1)][e99].

In each fixed atlas piece, the \(W^{1,8}\) norm is bounded
by a fixed constant times the global reference \(W^{1,8}\)
norm of \(b_n\). The E53 annular inverse derivative yields
\(\|\Delta_j v\|_8\le C2^{-j}\|\partial v\|_8\) for \(j\ge1\).
Its weighted sum at \(s=1/2\) converges, and the low block
is controlled by \(\|v\|_8\). Hence
\[
  \|b_n\|_{\mathcal B^{1/2}}\le C\epsilon_n,\qquad
  \|(b_n,\beta_n^u)\|_{\mathcal B^{1/2}}\ge c n^{1/4}.
\]
The connection \(A_0+b_n\) has zero intrinsic strain and
satisfies exact internal Coulomb, with connection and curvature
values tending to their reference values and the stated
first-derivative bound on \(b_n\). Thus the conclusion of E66,
including smallness of the critical pair, fails if the
horizontal equation \(S_0^*b=0\) alone is omitted. This sequence
lies on the round orbit. For example, if \(U_n\) is the
vertical automorphism whose pullback implements the E98 action
(in a local principal chart \(U_n(x,h)=(x,u_n(x)^{-1}h)\)),
then \(A_0+b_n=(G_n\circ U_n)^*A_0\) and its inverse
automorphism gives explicit full placement at \(A_0\).
The estimate covers only gauges with the prescribed fixed
\(C^1\) bound and addresses the vertical replacement of the
E66 hypotheses. E98 and E99 remain provisional dependencies
here pending lead assessment of E101.

## Frozen inputs

All requested hashes matched. Auxiliary E59, E57 and E66
passages specify and compare the norm and identify the slice
hypotheses. This computation used no new external source.

| Input | SHA-256 |
| --- | --- |
| [E103 request][req] | ec799c31f7623947135dc3da0aa295f59d8cfa9865e9506f728cdedca4879a5f |
| [B58][b58] | 279b4f58a292c24c3c978b8a40709ec2bdd3d9679c46e6672f5bc8b62938d2e4 |
| [E95][e95] | 1a5930ba2052e2f97d0c8fe869cc0f9a0407509ad9182c33a6efbea60e4b59af |
| [E96][e96] | 4d46618e45e51902f81bbc8c180f183005bbea376dd9ee572945636f1f0f7747 |
| [E53][e53] | 6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312 |
| [E98][e98] | 06c883cc5a6626f4748c218b75633ce1cdb947758b04f923b2255ca207251bf4 |
| [E99][e99] | 6785cff000ac53238e95ef2254b0f06aa868636d91b9107400215eff6a116330 |
| [E59][e59] | 2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a |
| [E57][e57] | 8bc1cc7551e137d58324ce9f837c174d0766330f9d61586d14c6c24e4778a3d7 |
| [E66][e66] | 09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66 |

[b58]: ../brainstorm/notes/B58_DEFECT_PINCHING_AND_VERTICAL_RESIDUAL_20261122.md
[req]: ../research-progress/handoffs/SP4-CME-E103_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E103_RETURN_v1.md
[e95]: 95_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md
[e96]: ../reviews/E96_CURVED_ORBIT_EXAMPLE_AUDIT_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[e98]: 98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
[e99]: 99_VALUE_SMALL_COULOMB_ESTIMATE_20261122.md
[e59]: 59_CRITICAL_PATH_STRAIN_20261122.md
[e57]: 57_COMPACT_CRITICAL_LINEAR_20261122.md
[e66]: 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
