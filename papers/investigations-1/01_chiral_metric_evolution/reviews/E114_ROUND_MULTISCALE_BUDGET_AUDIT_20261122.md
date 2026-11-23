# E114 — Audit of the actual round linearized multiscale budget

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I did not author E112 or E109. I authored the E47
normalization and E22 round heat estimates, and E111's audit of
the frozen E109 calculation. E22's analytic method is related,
but its strain-bundle estimate is not a premise of the present
rank-five Hessian estimate. I independently checked the round
tangent map, coefficient and kernel errors, and lower bound in
E112, and reinspected the exact primary theorem.
[Request][req] · [E112][e112] · [Packet return][ret].

## Disposition

Pass at the frozen scope. The smooth global initial one-forms
give attained tangents of the actual round chiral connection.
Their native linearized defect and strain solve the compact
round linearized equations and have the claimed
\(\int_0^\infty\|D_0 T_N\|_\infty\,d\tau\ge c\sqrt N\),
with value bounds \(O(N^{-1/2})\), initial strain
\(\|T_N(0)\|_4=O(N^{-1/4})\), and a finite total budget for each
\(N\). The nonlinear curvature computation in E112 concerns
only the initial connections. The proof controls the full
ordered covariant derivative \(D_0 T_N=\tfrac12D_0^2 q_N\).
Antisymmetrization would instead give \(\tfrac12d_{D_0}^2q_N\),
a curvature action on the actual bundle. In the frozen E109
model the corresponding exterior derivative is zero.
[B61][b61] · [E112 request][req112] · [E111][e111].

## Native tangent map, operator and orbit directions

Use the compact oriented round \(S^4\), its positive perfect
chiral \(\mathrm{SO}(3)\) connection \(A_0\), and the negative
Killing internal metric. With \([e_i,e_j]=\epsilon_{ijk}e_k\)
in a manuscript-orthonormal frame,
\(-\operatorname{tr}(\operatorname{ad}e_i\operatorname{ad}e_j)
=2\delta_{ij}\) by the cross-product representation. Passing
to native orthonormal components multiplies the curvature
components by \(\sqrt2\). Since \(F_{0i}=-K\Sigma_i^+\) and
\(|\Sigma_i^+|^2_{\widehat g}=2\) in the manuscript convention,
the native wedge Gram is \(4K^2 I\,dV_{\widehat g}\).
Trace normalization gives \(Q=I\) at \(A_0\), with the native
volume \(4K^2dV_{\widehat g}\). Hence \(G=2K\widehat g\), with
round curvature \(K/(2K)=1/2\), and \(F_{0i}\) is a native
self-dual orthonormal triple.

For a smooth connection tangent \(a\), \(\delta F=d_0a\).
Write \(Y_{ij}=F_i\wedge F_j/dV_G\) with the reference volume
fixed. At \(Y=I\), the variation of \(Q=3Y/\operatorname{tr}Y\)
is \(\operatorname{tf}(\delta Y)\), and self-duality of
\(F_{0j}\) gives
\[
 \delta Y_{ij}=(d_0a_i,F_{0j})_G+(d_0a_j,F_{0i})_G,\qquad
 DQ_{A_0}(a)=2\operatorname{tf}L_0d_0a .
\]
Here \(d_0a_i\) denotes the \(i\)-th component of \(d_0a\);
\(L_0\) is half the sum in the variation. Constant internal
scaling leaves the normalized Gram endomorphism and its tangent
unchanged. The natural transformation law for \(Q\) is pullback
on the base and internal conjugation. The orbit of \(A_0\)
therefore has \(Q=I\) throughout. The connection Cartan formula
for an invariant generator \(Y\) is
\(\mathcal L_Y A_0=\iota_Y F_0+d_{A_0}(A_0(Y))\).
The vertical and horizontal lifts give \(d_0\phi\) and
\(\iota_X F_0\), respectively, and differentiating the constant
orbit value \(Q=I\) shows that \(DQ_{A_0}\) annihilates both.
[E47, normalization at perfection][e47] · [Round block][manu].

For completeness, the normalized block has
\(U(a)_{ik}=\frac12\eta_{k,ab}\nabla_a a_{ib}\),
\(q=-2\operatorname{sym}_0 U(a)/K\) and
\((a_t)_{ib}=-4K\eta_{j,cb}\nabla_c q_{ij}\).
For the self-dual symbols there, their antisymmetric matrices
satisfy \(J_kJ_j=-\delta_{kj}I-\epsilon_{kjl}J_l\), as checked
from the displayed entries in the block. Therefore the product
with the second \(b\) index contracted gives
\(\eta_{k,ab}\eta_{j,cb}=\delta_{kj}\delta_{ac}
+\epsilon_{kjl}\eta_{l,ac}\). The symmetric second-derivative
part is the rough Laplacian. For the remaining part,
\(\eta_{l,ac}\eta_{t,ac}=4\delta_{lt}\), and
\(\sum_l\epsilon_{kjl}\epsilon_{ilm}
=\delta_{km}\delta_{ji}-\delta_{ki}\delta_{jm}\),
\(\sum_{j,l}\epsilon_{kjl}\epsilon_{jlm}=2\delta_{km}\).
Thus the internal curvature contribution inside the operator
with prefactor \(4\) is
\(-2K(q_{ki}-\delta_{ki}\operatorname{tr}q+2q_{ik})=-6Kq_{ik}\).
No base curvature term is added to this commutator on an
endomorphism-valued zero-form. These contractions apply to
any smooth trace-free symmetric \(q\).

Let \(\kappa=2K\). The internal metric conversion doubles the
energy and scales the connection-variation pairing by
\(2\kappa^{-1}\kappa^2=2\kappa\), the two latter factors being
the inverse metric for one base slot and the four-dimensional
volume. At the round critical point the variation of the
gradient pairing multiplies the zero gradient. This gives
the clock relation \(\tau=\kappa t\). Equivalently the two-form
adjoint contraction in the native connection velocity scales
by \(\kappa^{-1}\) with \(G=\kappa\widehat g\), so the same
clock relation converts \(-4d_{0,\widehat g}^*(qF_0)\) into
\(-4d_{0,G}^*(qF_0)\). Constant homothety preserves the relevant
connections and gives \(\widehat D_0^*\widehat D_0=\kappa\mathcal L\)
on \(\mathcal E=\operatorname{Sym}_0^2E\), where
\(\mathcal L=D_0^*D_0\) in the native metric. Hence
\[
 -4\kappa^{-1}(\kappa\mathcal L+6K)=-4\mathcal L-12 .
\]
In particular \(DQ_{A_0}(-4d_{0,G}^*(qF_0))=-(4\mathcal L+12)q\)
for any smooth \(q\in\Gamma(\mathcal E)\).

Given \(q(0)=DQ_{A_0}(a)\), define \(q(\tau)\) by the last
heat equation and
\[
 a(\tau)=a-4\int_0^\tau d_{0,G}^*(q(v)F_0)\,dv .
\]
Smooth data give a smooth heat path through \(\tau=0\).
Applying the time-independent operator \(DQ_{A_0}\) inside
the integral yields \(DQ_{A_0}(a(\tau))=q(\tau)\), by the
computed operator identity and equality initially. Thus
\(a(\tau)\) solves the actual linearized connection equation.
Variation of the strain formula at \(Q=I\) gives
\(\tfrac12D_0q\): the variations of the square roots multiply
\(D_{A_0}I=0\) and the variation of the connection commutes
with \(I\). The trace-free projection leaves \(D_0q\) unchanged.
The construction proves attainment along the whole linearized
trajectory from the specified connection tangent.
[Round block, linear connection, linear Q map and round heat][manu] ·
[E112, exact tangent map and time conversion][e112].

## Actual annular one-forms and initial estimates

Use a fixed small normal chart centered at \(p\) and its
radial orthonormal internal frame. Set \(\rho=|x|=d_G(p,x)\),
\(X=x^\ell\partial_\ell\) and choose a fixed unit trace-free
symmetric \(M\), transported radially. In the indicated
coframe and internal frame, \(G-\mathrm{Id}=O(\rho^2)\),
\(\partial G=O(\rho)\), and the reference internal connection
coefficients are \(O(\rho)\) with bounded first derivatives.
The round curvature identification \(F_0\) is parallel for
the product connection. Therefore \(\partial F_0=O(\rho)\)
and \(F_0(x)=F_0(p)+O(\rho^2)\), with bounded second
derivatives on the chart. The coefficient array of
\(C_i=M_{ij}F_{0j}\) has the same bounds since \(M\) is
constant in the radial frame.

For \(a^{(r)}=\frac12\chi(\rho/r)\iota_X C\), the difference
from freezing \(C\) at \(p\) is \(O(r^3)\) on the annulus.
A derivative can act on \(X\), \(C-C(p)\), or the cutoff,
costing at most a factor \(r^{-1}\) each time through order
two. Thus the first and second derivatives of the difference
are \(O(r^2)\) and \(O(r)\). The atom itself has derivative
bounds \(O(r^{1-\ell})\) up to order \(\ell=2\).
The connection part of \(d_0a^{(r)}\) has value \(O(r^2)\)
and first derivative \(O(r)\) by the coefficient estimates.
Analogous multiplication by \(L_0(x)-L_0(p)=O(r^2)\)
and its derivative \(O(r)\) preserves these orders, even
when the derivative falls on \(d_0a^{(r)}\), which is
\(O(r^{-1})\) in the differentiated slot. The center calculation
uses \(d(\iota_X C(p))=2C(p)\) and
\((d\rho\wedge\iota_X C(p))^+=(\rho/2)C(p)\).
It gives \(q^{(r)}=2f(\rho/r)M+e^{(r)}\) with
\(f(u)=\chi(u)+u\chi'(u)/4\), \(|e^{(r)}|\le Cr^2\)
and \(|D_0e^{(r)}|\le Cr\). The radial-frame covariant
correction on the error is \(O(r)|e^{(r)}|\).
It also gives \(|q^{(r)}|\le C\), \(|D_0q^{(r)}|\le Cr^{-1}\).
[E109, atom formula][e109] · [E112, (4)–(5)][e112].

Each atom vanishes on collars at the two radii and extends
smoothly by zero to an actual global adjoint one-form.
At finite \(N\), all \(r_j=\sigma R^{-j}\) are positive.
With fixed \(R>2\) the supports are disjoint, so
\(a_N=\delta_N\sum_j a^{(r_j)}\) gives
\(\|a_N\|_\infty+\|d_0a_N\|_\infty\le C\delta_N\),
\(\delta_N=N^{-1/2}\). Each annulus has volume \(O(r_j^4)\),
so its contribution to \(\|T_N(0)\|_4^4\) is bounded by
\(C\delta_N^4r_j^{-4}r_j^4\). The total is \(O(N^{-1})\).
For the actual nonlinear initial connection \(A_0+a_N\),
\(F_{A_0+a_N}-F_0=d_0a_N+\frac12[a_N\wedge a_N]\);
the second term is \(O(\delta_N^2)\) in sup norm.
Thus the initial nonlinear curvature values are small and
definiteness holds for sufficiently large \(N\). No
nonlinear evolution is used in these computations.
[E112, (6)][e112].

## Primary quotient estimate and leading Hessian

I opened the final publisher HTML of Matthias Ludewig,
*Strong short-time asymptotics and convolution approximation
of the heat kernel*, *Annals of Global Analysis and Geometry*
55(2) (2019), 371–394, DOI 10.1007/s10455-018-9630-4, on
22 November 2026, America/New_York. The metadata give
22 September 2018 for the version of record and 4 March 2019
for the issue. I directly inspected §1, (1.1)–(1.3),
Theorem 1.1 and its following derivative convention, and
§2's opening local Laplace-type definition and formal
adjoint convention. The indexed HTML passages were lines
63–85, 145–152, and 814–830 for the metadata. No PDF or
new reading copy was retained. This is a reinspection of
canonical R18, key Ludewig2019.
[Publisher text][ludewig] · [Canonical R18][refs].

Theorem 1.1 applies to a Laplace-type operator on a vector
bundle over a compact Riemannian manifold, on a compact
set of pairs away from the cut locus and for a fixed finite
upper time. It bounds the differentiated quotient by the
scalar distance Gaussian after subtracting the prescribed
expansion. Here \(\mathcal L\) is the nonnegative,
formally self-adjoint metric connection Laplacian on the
real rank-five bundle, with leading part
\(-G^{ab}\partial_a\partial_b I\) and zero potential
for the same connection. Complexification, if needed,
preserves the real heat operator. A fixed small closed
ball containing the atom supports and a neighborhood of
\(p\) has diameter smaller than the injectivity radius,
so its product satisfies the required pair condition.
For expansion order \(\nu=0\), time derivative \(k=0\),
second variable derivative \(m=0\), and first variable
derivatives \(\ell=0,1,2\), the bound in (1.3) is
\(C s^{\nu+1-k}=Cs\) for each \(\ell\).
The source permits the induced metric connection in the
kernel derivatives. The only kernel theorem used is this
fixed compact-pair estimate. [Ludewig, §1 and §2][ludewig].

Writing \(p_s=E_s(\Phi_0+h_s)\), the preceding hypotheses give
bounded \(D_x^\ell\Phi_0\) and \(|D_x^\ell h_s|\le Cs\)
on the compact pair set. A smooth section supported in the
ball and with any chosen value at \(p\) converges to itself
under \(e^{-s\mathcal L}\) in the graph norm of
\((1+\mathcal L)^3\) by spectral dominated convergence.
The fixed elliptic estimates and \(H^6\hookrightarrow C^2\)
give in particular convergence of the value at \(p\).
Inserting the kernel and using \(y=\sqrt s\,z\) in normal
coordinates instead gives the value \(\Phi_0(p,p)v(p)\)
in the limit, by domination with the unit-mass Gaussian
and the bounded volume density. Thus \(\Phi_0(p,p)=I\)
on the fiber. This computation only uses the local kernel
because the test section is supported in the ball.

For \(h=d_G(x,y)^2\), the first variation gives
\(D_xh(p,y)=-2y^\flat\) in normal coordinates, exactly.
The Hessian \(D_x^2h(p,p)\) is \(2G_p\), and smoothness
on the pair set gives \(D_x^2h(p,y)=2G_p+O(|y|)\).
Using
\[
 D_xE_s=-\tfrac1{4s}(D_xh)E_s,\qquad
 D_x^2E_s=\left(\tfrac{D_xh\otimes D_xh}{16s^2}
                   -\tfrac{D_x^2h}{4s}\right)E_s
\]
in the covariant product rule, including both ordered
cross terms, gives an upper bound for \(|D_x^2p_s(p,y)|\)
of \(Cs^{-2}e^{-|y|^2/(4s)}(1+|y|/s+s^{-1}+|y|^2/s^2)\).
For \(s\le1\), absorbing the polynomial factors into the
Gaussian gives \(Cs^{-3}e^{-|y|^2/(8s)}\). This bound
differentiates the output kernel in its first variable
and never commutes \(D_0\) through heat.
[E112, (7)–(8)][e112].

At \(s=r^2\theta\) and \(y=\exp_p(rz)\) with
\(|z|\in[1,2]\) and \(\theta\in[\alpha,\beta]\subset
(0,1/12)\), write \(K_\theta\) for the ordinary Euclidean
heat kernel. Then \(r^4 E_s(p,y)=K_\theta(z)\).
The \(11\) Gaussian Hessian after multiplication by \(r^6\)
is \(K_\theta(z)(z_1^2/(4\theta^2)-1/(2\theta))+O(r)\).
Its coefficient \(\Phi_0+h_s\) is \(I+O(r)+O(r^2)\)
in the radial frame. The ordered terms with one derivative
on that coefficient are \(O(r)\) after rescaling, and those
with two are \(O(r^2)\), uniformly in this window. This
proves (9) for the full-Hessian entry, including the
connection terms. The normal volume is
\(r^4(1+O(r^2))\,dz\). Hence integration against
\(q^{(r)}/2=f(|z|)M+O(r^2)\) and projection onto \(M(p)\)
give an \(r^{-2}\) Hessian value with coefficient
\(\mathcal H(\theta)+O(r)\); the atom and density each
cost \(O(r^2)\) in that coefficient.
[E112, (9)–(10)][e112].

## Positivity, absolute scale sums and native budget

The radial scalar leading term is
\[
 \mathcal H(\theta)=\frac1{1024\theta^5}
       \int_1^2 u^5\chi(u)(u^2-12\theta)e^{-u^2/(4\theta)}\,du .
\]
Indeed the angular measure and Gaussian prefactor give
\(1/(8\theta^2)\), and spherical averaging replaces
\(z_1^2\) by \(u^2/4\). Insert
\(u^3f(u)=(u^4\chi(u))'/4\); the radial derivative of
\((u^2/(16\theta^2)-1/(2\theta))e^{-u^2/(4\theta)}\)
has factor \(u(12\theta-u^2)/(32\theta^3)\).
Integration by parts gives the displayed sign and coefficient.
Thus \(h_*=\min_{[\alpha,\beta]}\mathcal H>0\).
Only the own-scale term uses this sign.
[E109, (4)–(5)][e109] · [E111][e111].

For \(s\in[\alpha r_k^2,\beta r_k^2]\) and \(j\ne k\),
the compact-pair Hessian bound integrated over the support
of the actual atom yields
\[
 C s^{-3}r_j^4 e^{-r_j^2/(8s)}
 \le C' r_k^{-2}(r_j/r_k)^4
                   e^{-(r_j/r_k)^2/(8\beta)} .
\]
The \(r_j^4\) is its volume and the atom has bounded value.
It controls the curved perturbation together with the leading
coefficient. The coarse sum \(j<k\) is bounded by a fixed
multiple of \(r_k^{-2}\sum_{m\ge1}R^{4m}e^{-R^{2m}/(8\beta)}\).
For \(j>k\) discard the exponential and obtain the fine
sum \(r_k^{-2}\sum_{m\ge1}R^{-4m}\).
The coarse series also tends to zero as \(R\to\infty\) by
\(z^4e^{-z^2/(8\beta)}\le C_\beta z^{-4}\) for \(z\ge1\).
The curved proof does not need the finer cancellation
power or the signed coarse contribution of E109.
[E112, (11)–(12)][e112].

Fix the ball, \(\chi,\alpha,\beta\), a heat cutoff \(s_0\le1\),
and the largest permitted atom radius \(r_*\) with
\(\beta r_*^2\le s_0\), before choosing the scale separation.
Choose \(R>2\) with \(R^2>\beta/\alpha\) so that both
absolute off-scale sums together cost at most
\(h_*r_k^{-2}/4\). Then choose \(\sigma\le r_*\) small
enough that the own-scale \(O(r_k)\) error in the
rescaled coefficient costs at most \(h_*/4\). All
constants are fixed independently of \(N,j,k\).
The total projection is then at least \(h_*r_k^{-2}/2\).

Since \(s=4\tau\), the disjoint native intervals have
endpoints \(\alpha r_k^2/4,\beta r_k^2/4\).
The budget integrand is bounded below by the absolute
\(11\) slot projected onto the unit \(M(p)\), times
\(\delta_N\) and the mass damping \(e^{-12\tau}\).
This damping is bounded below by \(e^{-3\beta r_1^2}\)
on the entire selected union. Each interval has length
\((\beta-\alpha)r_k^2/4\), so multiplying by the
\(r_k^{-2}\) lower bound and summing gives
\[
 \int_0^\infty\|D_0T_N(\tau)\|_\infty\,d\tau
 \ge \frac{h_*(\beta-\alpha)}8 e^{-3\beta r_1^2}
                        N\delta_N=c\sqrt N.
\]
The pointwise projection at \(p\) is bounded by the
spatial essential supremum because the field is smooth.

For each finite \(N\), the initial defect is smooth, so
its \((1+\mathcal L)^3\) graph norm is finite. Integration
by parts gives the nonnegative form, and the self-adjoint
realization on the compact smooth bundle is the fixed
connection Laplacian. Its spectral calculus contracts this
graph norm under \(e^{-s\mathcal L}\). Iterating the fixed
elliptic estimate through Sobolev orders \(0,2,4\) bounds
\(H^6\) by the graph norm, and the dimension-four Sobolev
embedding controls the first two covariant derivatives
in sup norm. This gives
\(\|D_0T_N(\tau)\|_\infty\le C_Ne^{-12\tau}\) and
\(\|T_N(\tau)\|_\infty^2\le C_N'e^{-24\tau}\) for all
\(\tau\ge0\), with finite constants depending on \(N\).
The estimates use spectral commutation only for powers
of \(\mathcal L\), never for \(D_0\).
Thus both integrals are finite individually. This completes
the actual linearized lower bound with attained data, with
no nonlinear trajectory or varying-geometry kernel conclusion.
[E112, lower bound and finiteness][e112].

## Frozen identities and read scope

The raw manuscript block begins at the section command titled
“The closed defect equation at the round connection” and ends
immediately before the next line beginning with the section
command, including trailing newlines. It was 4501 bytes,
then at lines 5587–5714. Its digest matches E112's consumption.
Only that scientific block is identified here, rather than the
moving source as a whole.

| Consumed input | SHA-256 |
| --- | --- |
| [E114 request][req] | 75b889bd528a3889ffe521e8bd4b77fd0b80ae5ee75a7a05a0bf4ade243e0768 |
| [E112 request][req112] | 78683618f35b8674881a72bafd2e443d124100c94a104c48181e639cccdc3e8e |
| [E112 return][ret112] | 8d8923e511d1a1000588a20fae62ec63938db53eae230f12aa212ebf8cd0ed2f |
| [B61][b61] | f5be86a830143259179ba74f7ffae9a59b51c4d4a8c8e7a0d2f6c6453287bc44 |
| [E112][e112] | f3d34f89645c81128a8d16544eb1248f1839249ed7c3c6bdbd0e51e2fa43c856 |
| [E109][e109] | 360544867c56de98eda76d45cd7cf33ebd02631d95820e839b19500d6bb5e2a6 |
| [E47][e47] | ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6 |
| [E22][e22] | 6d25f4b39c2f75a407f73b2fd7a913cebbe46576cc39a00832b2d0cbf828a22b |
| [E111][e111] | 920aaf851a4b8b33fab65f9db600e998a0fc527cc5e74e65225403d26645edb3 |
| Manuscript scientific block | c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab |

[req]: ../research-progress/handoffs/SP4-CME-E114_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E114_RETURN_v1.md
[req112]: ../research-progress/handoffs/SP4-CME-E112_REQUEST_v1.md
[ret112]: ../research-progress/handoffs/SP4-CME-E112_RETURN_v1.md
[b61]: ../brainstorm/notes/B61_ROUND_LINEARIZED_BUDGET_TRANSFER_20261122.md
[e112]: ../notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e109]: ../notes/109_FROZEN_MULTISCALE_STRAIN_BUDGET_20261122.md
[e47]: ../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e22]: ../notes/22_ROUND_LORENTZ_HEAT_20261122.md
[e111]: E111_FROZEN_MULTISCALE_BUDGET_AUDIT_20261122.md
[manu]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[ludewig]: https://link.springer.com/article/10.1007/s10455-018-9630-4
[refs]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
