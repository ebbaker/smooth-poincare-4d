# Interior estimates for the normalized spinorial defect — SP4-FOT-MATCH-E10

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Requested configuration is gpt-6.2-sol / ultra.
The exact serving model and reasoning effort are unavailable.
[Request revision 1](../research-progress/handoffs/E10_REQUEST_20261125.md)

## Fixed strip, affine datum and first-order error

Take a supplied smooth oriented Riemannian spin strip
\(Z=[0,4]\times S^3\) with protected region \(K=[1,3]\times S^3\).
The exact sizes only fix constants. Write \(h_0=dt^2+\gamma_{S^3(1)}\),
\(h\) for the supplied normalized metric,
and \(A,P_\pm\) for the E01 tangential operator and projections
using the increasing normal \(+\partial_t\). Put
\[
 \varepsilon_1=\|h-h_0\|_{L^\infty(Z)}
        +\|\nabla^{h_0}(h-h_0)\|_{L^4(Z)},\qquad
 \varepsilon_2=\|h-h_0\|_{W^{2,p}(Z;h_0)},\quad p>4 .
\]
Here \(\varepsilon_1\) is equivalent, with fixed constants, to the
first-order slab norm from E02 on this fixed strip. Use its reference
spin identification and its spectral \(H^{1/2}\) norm \(\mathcal T\).

Put \(r=e^t\) and use the oriented Euclidean annulus via \(x=r\omega\).
Then \(g_0=r^2h_0=|dx|^2\) and \(g=r^2h\) in these coordinates.
Let \(\kappa\) be a constant unit positive spinor of \(g_0\). By
Dirac conformal covariance its cylindrical harmonic representative
is \(u_0(t)=r^{3/2}s_\kappa\), where \(s_\kappa\) is a unit section
in the \(t\)-parallel reference bundle. The product equation gives
\(As_\kappa=-\frac32s_\kappa\). In particular the prescribed positive
left trace is zero and the prescribed negative right trace is
\(e^6s_\kappa\ne0\). The same datum arises from a regular flat core
and a prescribed opposite pole with matched frame and normalization
in E04. It fixes a nonzero comparison rather than the zero solution.

Let \(u\) denote the identified reference spinor of an \(h\)-harmonic
positive half-spinor, \(H^1\) up to both strip faces. Let \(d\) be the
joint \(\mathcal T\) norm of the difference of its two prescribed
incoming traces from these reference data. For \(\varepsilon_1\)
small enough, E02 applied to \(u-u_0\) gives
\[
 \|u-u_0\|_{H^1(h_0)}\le C(\varepsilon_1+d).
 \tag{1}
\]
Indeed \(L_h(u-u_0)=-(L_h-L_0)u_0\). The same estimate and inverse
construct a strip solution for any prescribed pair of these traces.
If using a spinor on actual adjoining pieces or a punctured closed
source, (1) is conditional on measuring its incoming traces in
this gauge. E07 corrects measured jumps on a positive-Yamabe source
and therefore propagates small seam trace errors when such piecewise
data have already been supplied. A positive Yamabe bound gives no
nonzero smooth global harmonic spinor on a closed source.

Let \(\psi\) be the harmonic transport to \(g\) in the annular gauge,
and express it in the reference Cartesian spin bundle via the
symmetric-frame identification. Both the inverse scale \(r^{-3/2}\)
and the reference frame change have bounded derivatives here.
The symmetric-frame identification commutes with the common
rescaling of \(h\) and \(h_0\) by \(r^2\), since their relative
positive endomorphism is unchanged. Thus for \(w=\psi-\kappa\) in
this bundle,
\[
 \|w\|_{H^1(g_0)}\le C(\varepsilon_1+d),\qquad
 \|\nabla^g\psi\|_{L^2(g)}\le C(\varepsilon_1+d).
 \tag{2}
\]
For the last bound, the identified connection differs from the
Cartesian derivative by an endomorphism-valued one-form with
\(L^4\) norm \(O(\varepsilon_1)\). Use \(H^1\hookrightarrow L^4\)
for \(w\), and the fixed norm of \(\kappa\).
[Conformal transport, DIR §3.1](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L339)
· [E02](E02_FIXED_PROJECTION_PERTURBATION_20261125.md)
· [E04](E04_BALL_AND_POLE_TRACES_20261125.md)
· [E07](E07_GLOBAL_JUMP_SOLVER_20261125.md)

## Differentiated equation and Ricci forcing

Write \(P_g\) for the twistor projection, \(U=\nabla^g\psi=P_g\psi\)
for this harmonic field, and \(\mathcal D_g^{T^*}\) for the Dirac
operator on \(T^*\otimes S\), using the tensor-product connection.
At a point choose a normal frame and extend \(X\) with
\(\nabla X=0\) at that point. Commuting the two spin derivatives gives
\[
 (\mathcal D_g^{T^*}U)(X)-\nabla_X(D_g\psi)
   =\sum_i c(e_i) R^S(e_i,X)\psi
   =\tfrac12 c(\operatorname{Ric}_g^\sharp X)\psi .
 \tag{3}
\]
For the last sign, DIR §2.2 gives the spin Ricci contraction with
\(R^S(X,e_i)\). The sign reverses in (3). This uses the ordinary
Dirac equation and the tensor connection, including the derivative
of the \(T^*\) slot. The equation has contracted Ricci forcing.
[DIR §2.2](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L227)

On the fixed annulus, identify \(T^*\) via the symmetric
orthonormal frame comparison as well. The tensor-product connection
has a reference coefficient difference bounded by \(C|\partial g|\),
as follows separately for the spin part from E02 and for the
cotangent part from the Levi-Civita connection difference formula.
The principal-symbol difference is \(O(|g-g_0|)\). Hölder and the
fixed \(H^1\to L^4\) embedding therefore give
\(\|\mathcal D_g^{T^*}-\mathcal D_0^{T^*}\|_{H^1\to L^2}
\le C\varepsilon_1\) in these identified frames.
For a fixed cutoff \(\zeta=1\) on \(K\) and supported in
\(K'=(1/2,7/2)\times S^3\), apply
\(\|\partial V\|_2=\|\mathcal D_0^{T^*}V\|_2\) to the compactly
supported tensor-spinor \(V=\zeta U\). The equality is componentwise
flat integration by parts. The term from differentiating \(\zeta\)
costs \(C\|U\|_{L^2(K')}\); absorb \(C\varepsilon_1\|V\|_{H^1}\).
Returning to the \(g\) tensor connection adds a term bounded by the
same \(L^4\)-coefficient argument. Equation (3) now gives
\[
 \|\nabla^g U\|_{L^2(K,g)}
 \le C\bigl(\|U\|_{L^2(K',g)}+
                   \|\operatorname{Ric}_g\,\psi\|_{L^2(K',g)}\bigr).
 \tag{4}
\]
The second norm is the pointwise product of the Ricci and spinor norms.
Antisymmetrization and orthogonal projection bound
\(\|\Pi(d^\nabla P_g\psi)^+\|_2\le C\|\nabla^g U\|_2\).
In particular, if \(|\psi|\ge c_*>0\) on \(K\), the independent
estimate for the normalized projected derivative is
\[
 \left\|\frac{\Pi(d^\nabla P_g\psi)^+}{|\psi|}\right\|_{L^2(K,g)}
 \le \frac{C}{c_*}\bigl(\varepsilon_1+d+
                   \|\operatorname{Ric}_g\,\psi\|_{L^2(K',g)}\bigr).
 \tag{5}
\]
The comparison is to the **flat annular** representative. In the
cylindrical representative the background Ricci tensor and
first twistor defect of the reference harmonic field are nonzero.
The bound (5) leaves open separate ways to control the Ricci term
and the lower bound. It uses no Weyl-defect identity in its proof.
For example, a uniform upper bound on \(\psi\) and small
\(\|\operatorname{Ric}_g\|_2\) on \(K'\) suffice for the weighted
Ricci input once a floor is available.

## Second-order field estimate and summation

Assume also that \(\varepsilon_2\) is small, with fixed \(p>4\).
In the Euclidean reference frame write the identified chiral operator
as \(D_0+a^i\partial_i+b\), with
\[
 \|a\|_\infty+\|Da\|_\infty+\|b\|_\infty+\|Db\|_p
       \le C_p\varepsilon_2 .
\]
The comparison and its differentiated coefficient bounds follow
from the smooth matrix inverse square root and the connection
formula in E02. Sobolev embedding gives uniformly small first
metric derivatives, and \(Db\) contains terms with one second
metric derivative or products of first metric derivatives.
The equation for \(w\) is \((D_0+a^i\partial_i+b)w=-b\kappa\).

For nested interior annuli, the local estimate
\[
 \|v\|_{W^{1,q}(K_0)}\le
 C\bigl(\|(D_0+a^i\partial_i+b)v\|_{L^q(K_1)}+
                                      \|v\|_{L^q(K_1)}\bigr)
 \tag{6}
\]
holds for \(q=4,p\), with \(K_0\Subset K_1\) and fixed cutoffs.
Indeed \(\|\partial f\|_q\le C_q\|D_0f\|_q\) for compactly
supported \(f\), by the Cartesian Dirac symbol and the \(L^q\)
bounds for Riesz transforms. Apply this to a cutoff times \(v\),
absorb \(C_q\|a\|_\infty\|\partial(\zeta v)\|_q\), and estimate
the commutator with the cutoff and the \(b\)-term in \(L^q\).
Interior smoothness holds for every supplied smooth metric and
harmonic spinor, regardless of rough face data. Using (2),
\(H^1\hookrightarrow L^4\), (6) for \(q=4\), and then
\(W^{1,4}\hookrightarrow L^p\) on a slightly smaller annulus,
one obtains the \(W^{1,p}\) estimate with right-hand side
\(C_p(\varepsilon_2+d)\).
Differentiating gives
\[
 (D_0+a^i\partial_i+b)\partial_jw
   =-(\partial_ja^i)\partial_iw-(\partial_jb)(w+\kappa).
\]
Apply (6) once more to \(\partial_jw\). The last source term is
bounded by the \(L^p\) norm of \(\partial_jb\) and the
\(W^{1,p}\to L^\infty\) bound for \(w\). After choosing the
nested annuli to contain \(\overline{K'}\Subset Z\), this yields
\[
 \|w\|_{W^{2,p}(K)}\le C_p(\varepsilon_2+d).
 \tag{7}
\]
The current argument only uses the \(H^{1/2}\) incoming trace
discrepancy. It does not assert a second-order estimate up to the
two strip faces with traces of this regularity.

For sufficiently small \(\varepsilon_2+d\), (7) gives
\(|\psi|\ge\tfrac12\) on \(K\), in a fiberwise isometric gauge.
The corresponding cylindrical spinor has norm at least \(r^{3/2}/2\).
The estimate also yields \(\|P_g\psi\|_{W^{1,p}(K)}\le C_p(\varepsilon_2+d)\)
in the fixed frame, using the connection coefficients and
their first derivatives. Thus the normalized projected derivative
in (5) is at most \(C_p(\varepsilon_2+d)\) in \(L^2(K,g)\);
the same bound follows from (5) and
\(\|\operatorname{Ric}_g\|_{L^p}\le C\varepsilon_2\).
The second-order comparison itself controls metric curvature.
The additional spinorial conclusion is quantitative stability of
the nonzero normalized harmonic field, including (7), and the
separate estimate (5) exposes the weaker Ricci input it can use.

For matching to the curvature accounting, apply DIR §2.3 **after**
obtaining (5) or (7). On a nonzero region it identifies twice the
squared normalized projected \(L^2\) integral with \(E_+\).
That ratio times the volume density is conformally invariant.
For a residual covered by protected strips with estimates uniform
in their reference scales, a sufficient condition is
\[
 \sum_j(\varepsilon_{2,j}+d_j)^2\longrightarrow0
\]
over a cover of the entire required residual on each source.
Alternatively sum the squared right sides of (5) on such a cover.
A uniformly small worst-strip bound gives a vanishing total only
with a corresponding bound on the number of strips or sharper
summability. The field on each strip may have its own nonzero
normalization. No common solution across the cover is needed for
this local curvature identity, and the estimates do not supply
any missing strips or the associated choices of incoming data.
[DIR projected derivative](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L276)
· [E05, residual accounting](E05_NORMALIZATION_AND_RESIDUAL_20261125.md)

## Bounded-energy oscillation on an actual positive-Yamabe source

The following test keeps the Weyl energy bounded, in contrast to
the growing-energy family in DIR §4.4. On the standard smooth
oriented spin \(S^4\setminus\{p\}\cong\mathbb R^4\), choose
\(g_b=f^2\delta\) smooth on the compactification, with \(f=1\)
on a neighborhood of the fixed annulus and \(f=r^{-2}\) near
infinity. This gives a flat germ at \(p\) in an oriented inverted
frame. Take a nonzero real smooth cutoff \(\chi\) supported in
the Euclidean image of the protected strip, and put
\[
 H=\operatorname{diag}(0,1,-1,0),\qquad
 F_n=\chi(x)\cos(nx^1),\qquad
 k_n=a n^{-2} F_n H,\qquad g_n=g_b+k_n,\qquad a>0.
 \tag{8}
\]
Extend \(k_n\) by zero. For every fixed \(a\), all sufficiently large
\(n\) give smooth positive metrics with the common flat pole germ.
On the annulus the punctured metric \(q_n=f^{-2}g_n=\delta+k_n\);
this formula holds on all of \(\mathbb R^4\) by support.
The cylinder \(h_n=r^{-2}q_n\) is first-order close to \(h_0\),
with \(\|h_n-h_0\|_\infty=O(n^{-2})\) and
\(\|\nabla^{h_0}(h_n-h_0)\|_\infty=O(n^{-1})\).
It is the exact round product outside the support of the oscillation.

The scalar linearization on the Euclidean patch is
\(\partial_i\partial_j k_{ij}-\partial_i\partial_i\operatorname{tr}k\).
Here \(\operatorname{tr}H=0\) and \(H_{1i}=0\), so both derivatives
in the first term fall on \(\chi\). The nonlinear error is bounded
by \(C(|k|\,|D^2k|+|Dk|^2)\). Hence
\(\|s_{g_n}-s_{g_b}\|_\infty=O(n^{-2})\).
In particular the Yamabe quotients converge uniformly in relative
error to the background quotients. To see this, \(Y_b=Y(S^4)>0\)
implies
\(Q_b(v)\ge Y_b\|v\|_{4,b}^2\ge Y_b V_b^{-1/2}\|v\|_{2,b}^2\)
for the scalar quadratic numerator \(Q_b\).
Together with bounded \(s_b^-\) this implies
\(Q_b(v)\ge c\|v\|_{H^1(g_b)}^2\).
The \(O(n^{-2})\) scalar and metric differences now give
\(Q_n(v)=Q_b(v)(1+O(n^{-2}))\) and the same relative comparison
of denominators \(\|v\|_{4,n}^2\).
Consequently \(Y([g_n])=Y(S^4)+O(n^{-2})\), uniformly positive.
On the cylindrical strip \(s_{h_n}=6+O(n^{-1})\) by scalar conformal
covariance with the fixed \(r^{-1}\) factor and the first-order
bound for \(q_n\). Thus even in the normalized cylinder there is
pointwise scalar closeness to the reference value.

### Actual nonvanishing Green fields

Choose the common negative spinor source at \(p\) so the background
Dirac Green field \(G_b\) transports to the fixed unit parallel
spinor \(\kappa\) in the Euclidean end gauge. This uses the flat pole
and reflected inversion in DIR §4.1 or E04.
For any fixed \(p_*>4\), the first-order coefficient comparison
on the compact manifold gives
\[
 \|\widetilde D_n-D_b\|_{W^{1,p_*}\to L^{p_*}}=O(n^{-1})
\]
after symmetric frame transport. The compact \(D_b\) is invertible
by positive Yamabe sign, and its inverse on this \(L^{p_*}\) scale
is bounded by elliptic regularity. The perturbative inverse for
\(\widetilde D_n\) therefore gives the unique regular correction
\(z_n\) with
\[
 \widetilde D_n z_n=-(\widetilde D_n-D_b)G_b,\qquad
 \|z_n\|_{W^{1,p_*}}=O(n^{-1}).
\]
The right-hand side is supported away from the pole. The actual
\(G_n=G_b+z_n\), in these identified frames, has the same
distributional source and leading singular term. It is smooth off
the pole. The correction is exactly flat Dirac harmonic near the
pole, with derivative bounds on a smaller pole ball by interior
regularity. After harmonic transport to \(q_n\), the actual field
\(\Psi_n\) converges uniformly to \(\kappa\) on \(\mathbb R^4\):
on bounded sets this follows from Sobolev embedding and conformal
transport, and at the end the regular correction is
\(O(n^{-1}r^{-3})\), with derivative \(O(n^{-1}r^{-4})\).
In particular \(|\Psi_n|\ge\tfrac12\) for large \(n\).
On the fixed cylinder the incoming trace discrepancy is \(O(n^{-1})\)
by the \(H^1\) trace bound. In the punctured gauge
\(\|\nabla^{q_n}\Psi_n\|_{L^4}=O(n^{-1})\), by the same
\(W^{1,p_*}\) estimates on bounded sets, the first metric derivatives
and the end decay. The fourth-power relative first-order twistor
defect therefore tends to zero. This field is the actual Green
solution with its prescribed source, rather than a trial spinor.

### Weyl and Bach scales

Use the DIR §2.3 curvature sign and its curvature-operator norm on
two-forms. Let \(T=(dx^1)^2\circledast H\) and
\(C=2T-H\circledast\delta\), with \(T_{1a1b}=H_{ab}\).
In the leading second-order terms of the curvature linearization,
both derivatives fall on the cosine. This gives
\(R'_{1a1b}=\frac a2 F_n H_{ab}\) and
\(\operatorname{Ric}'=\frac a2 F_n H\), up to \(O(n^{-1})\).
The Weyl projection is therefore
\[
 W(q_n)=\tfrac a4 F_n C+\mathcal R_n,\qquad
 \|D^j\mathcal R_n\|_\infty\le C_a n^{j-1}\quad(0\le j\le2).
 \tag{9}
\]
Indeed every cutoff differentiation in the linearization loses
at least one factor of \(n\), and the smooth nonlinear curvature
terms \(O(|k_n|\,|D^2k_n|+|Dk_n|^2)\) give \(O(n^{j-2})\)
after \(j\) more derivatives. Here the constants may depend on
\(a,\chi\). The curvature-operator entries of \(C\), under the
two-form basis \(12,13,14,23,24,34\), are
\(1,-1,0,0,-1,1\), with no off-diagonal entries. In particular
\(\|C^+\|_{\rm HS}^2=2\). The orientation is the standard oriented
Cartesian orientation. Uniform convergence of metric norms,
and \(\int F_n^2\to\frac12\int\chi^2\), give
\[
 E_+(g_n)=E_+(q_n)
   \longrightarrow e_a=\frac{a^2}{16}\int_{\mathbb R^4}\chi^2\,dx>0.
 \tag{10}
\]
The same limit holds over \(K\), since the Weyl tensor vanishes
outside the perturbation. Also the leading Ricci term above has
a nonzero \(L^2\) limit in norm, even though the scalar tends to zero
in the flat gauge. By the exact DIR identity, the squared normalized
projected derivative on \(K\) is \(E_+(q_n)/2\). The unnormalized
squared integral has the same positive limit \(e_a/2\) in the
\(q_n\) gauge, because \(|\Psi_n|\to1\) uniformly.

In the convention
\(B_{ij}=\nabla^k\nabla^\ell W_{ikj\ell}
+\tfrac12\operatorname{Ric}^{k\ell}W_{ikj\ell}\),
one more use of (9) gives
\[
 B(q_n)_{ij}=-\tfrac a4 n^2 F_n H_{ij}+O(n)
 \tag{11}
\]
in the fixed Cartesian norm. The principal term uses exactly
\(C_{i1j1}=H_{ij}\). Raising indices by \(q_n\) instead of
\(\delta\) in the principal term costs \(O(1)\), as do products
\(\Gamma DW\), \(D\Gamma W\) and \(\operatorname{Ric}W\),
using the derivative sizes in (8)–(9). The differentiated linear
remainder is \(O(n)\). Since \(\int|F_n|\) is bounded below by
\(\int F_n^2/\|\chi\|_\infty\), (11) proves
\(\|B(q_n)\|_{L^1}\asymp n^2\).
In dimension four \(B\) as a covariant two-tensor has conformal
weight \(-2\) under \(g\mapsto e^{2\varphi}g\). Thus both the
\(L^1\) Bach density and the chiral Weyl energy density used
here are invariant under conformal change. These estimates hold
in any volume-one Yamabe representative of \([g_n]\) as well,
where scalar curvature is \(Y([g_n])\). No bound on the Yamabe
conformal factor or near-product chart in that representative
is claimed. Choosing \(a\) fixes any \(e_a>0\). In particular one
may place \(e_a\) strictly inside the SEC positive-Yamabe band
\(4\pi^2<E_+<8\pi^2-\delta\) when its interior is nonempty.
The comparison specifically tests first-order collar control,
bounded Weyl energy, positive Yamabe constants and field
normalization. It gives a growing Bach norm, so it does not
test the small-total-Bach premise of the SEC no-neck problem.
[Derdziński, §2, Remark 1](https://www.numdam.org/item/CM_1983__49_3_405_0.pdf)
· [Catino–Mastrolia–Monticelli–Rigoli, §2, equation (2.12)](https://cvgmt.sns.it/document/2850/)
· [SEC, positive-Yamabe band](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L249)

## Evidence and input versions

The two parts are a conditional local interior theorem for a supplied
strip and one exact family on the standard smooth four-sphere.
Neither supplies collars or quantitative pole data on arbitrary
homotopy spheres. The bounded-energy test uses a direct
\(n^{-2}\) polarized bump, whereas DIR §4.4 uses a
divergence-free potential with leading amplitude \(n^{-3/2}\)
to produce growing Weyl energy. The additional calculations
here are the finite nonzero limit (10), the Bach scale (11) and
the scalar and Yamabe comparisons. The direct bump is only
transverse at principal order; the scalar calculation above
does not require exact divergence freeness.

- [DIR §§2.2–2.3, 3.1, 4.1 and 4.4](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex),
  verified SHA-256 `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`.
- [SEC](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex),
  verified SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`.
  Used the stated positive-Yamabe band and its small-\(L^1\)-Bach
  premise in the no-neck discussion.
- E01, E02, E04, E05 and E07 in checkout `6879850` furnish the
  model, comparison, pole datum and prior residual test.
- Inspected Derdziński, Compositio Math. 49 (1983), 405–433,
  Remark 1 at p. 411, for the four-dimensional Bach weight, and
  equation (2.12) in Catino–Mastrolia–Monticelli–Rigoli for the
  displayed Bach convention.
