# SP4-POLE-E03 — pointwise algebra and the diagonal calibration

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Serving model variant and reasoning effort were unavailable to this helper. The [revision 1 request](../research-progress/handoffs/REQUESTS_R1_20261127.md#sp4-pole-e03) prescribes Sol 6.2/ultra. Input baseline `6a422ce7814fe1ad278d6904970e3b19b05a9890`. The exact results below are project theorems at working status.

## Inputs inspected

| Input | Passage and version |
| --- | --- |
| [Second master overview](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions) | Orientation, norm, inversion, growth definition of pole forms and Gram matrix |
| [Proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md) | §§3.2, 3.4 and 3.5, especially the orientation of the leading term, conformally orthonormal triples and the first calibration. SHA-256 prefix `091aa015355ef938` |
| [check_06_pole_forms.py](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_06_pole_forms.py) | Source sections (a)–(d), SHA-256 prefix `50523f0bf3006aed` |
| [Recorded output](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/output.txt) and [check receipt](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/README.md) | Lines 21–60 of the output, SHA-256 prefix `2ba41ad2c9e8e839`, and the recorded Python package versions |

The proofs below use definitions and explicit calculations. The second calibration in §3.5 uses the Perutz result and belongs to a separate packet.

## 1. Star and inversion

**Project theorem (working).** On an oriented Riemannian four-manifold, if \(\widehat g=\Omega^2 g\) with \(\Omega>0\), then
\[
*_{\widehat g}\big|_{\Lambda^k}=\Omega^{4-2k}*_g\big|_{\Lambda^k}.
\]
Indeed, the \(k\)-form inner product scales by \(\Omega^{-2k}\) and the volume form by \(\Omega^4\). The formula follows from the defining wedge identity for the star. At \(k=2\) this proves invariance of the splitting and of the squared-norm density.

**Project theorem (working).** Put \(I(y)=y/|y|^2\) on \(\mathbb R^4\setminus\{0\}\), and let \(R_y=\operatorname{Id}-2yy^{\mathsf T}/|y|^2\) be reflection in \(y^\perp\). For every constant two-form \(\eta\), differentiation gives \(dI_y=|y|^{-2}R_y\), so
\[
 (I^*\eta)_y=|y|^{-4}R_y^*\eta,\qquad
 d(I^*\eta)=0,\qquad
 |I^*\eta|_{\mathrm{euc}}^2=|y|^{-8}|\eta|_{\mathrm{euc}}^2.
\]
The reflection is orthogonal of determinant \(-1\). With the same fixed Euclidean orientation on both coordinate spaces, the wedge identity gives \(*\circ R_y^*=-R_y^*\circ *\) on two-forms. Thus inversion exchanges the fixed coordinate self-dual and anti-self-dual spaces, and every nonzero constant \(\eta\) gives a pole of order four. In particular, with \(y\) positively oriented on the manifold, the inverted \(x\) chart is negatively oriented. Geometric self-duality in that chart uses the orientation opposite to its positive coordinate volume, so its flat leading coefficient \(\eta\) is anti-self-dual in the fixed positive coordinate orientation. This is the sign in §3.2.

## 2. Gram inequality and equality

**Project theorem (working).** For any three self-dual two-forms at a point, set \(Q_{ij}\,dV_g=\omega_i\wedge\omega_j\). Then \(Q_{ij}=\langle\omega_i,\omega_j\rangle_g\) and \(Q\) is positive semidefinite, since \(u^{\mathsf T}Qu=|\sum_i u_i\omega_i|_g^2\). Its rank is the rank of the map \(u\mapsto\sum_i u_i\omega_i\).

Let \(a,b,c\) be the nonnegative cube roots of its three eigenvalues. The identity
\[
a^3+b^3+c^3-3abc=
\tfrac12(a+b+c)\big((a-b)^2+(b-c)^2+(c-a)^2\big)
\]
proves \(\tfrac13\operatorname{tr}Q\ge(\det Q)^{1/3}\). Equality holds precisely for \(Q=\lambda I_3\) with \(\lambda\geq0\). In rank zero both sides vanish. In ranks one and two the trace is positive and the determinant vanishes. In rank three equality gives \(\lambda>0\) and the evaluation is a linear similarity for the Euclidean metric on the coefficient space.

On an open set on which \(Q=\lambda I_3\) with \(\lambda>0\), the metric \(\widehat g=\sqrt{\lambda}\,g\) makes the triple orthonormal. The star and closedness are preserved, and the metric is smooth whenever \(g\) and the forms are smooth.

## 3. A closed orthonormal triple is parallel

**Project theorem (working).** Let \(\omega_1,\omega_2,\omega_3\) be smooth self-dual forms that are closed and orthonormal at every point of an open set in an oriented Riemannian four-manifold. Each is parallel for the Levi–Civita connection.

In a positively oriented orthonormal coframe \(e^0,e^1,e^2,e^3\), use \((e^{0i}+e^{jk})/\sqrt{2}\), for cyclic \((i,j,k)\), to orient \(\Lambda^+\). This orientation is independent of the coframe because the induced action of the connected group \(SO(4)\) has determinant \(+1\). Locally one can fix the sign of one member of the triple so that it has this orientation. For the positive orthonormal triple define
\[
J_i\beta=\sqrt2\,*(\beta\wedge\omega_i)
\]
on one-forms. In the displayed frame \(J_i e^0=e^i,\ J_i e^i=-e^0,\ J_i e^j=e^k,\ J_i e^k=-e^j\) for cyclic \((i,j,k)\). These give \(J_iJ_j=-\delta_{ij}\operatorname{Id}+\sum_k\epsilon_{ijk}J_k\), where \(\epsilon_{ijk}\) is the alternating symbol. The relations are \(SO(3)\)-equivariant in the basis of self-dual forms and therefore apply to the chosen triple.

The connection preserves the star and the inner product, so \(\nabla\omega_i=\sum_j B_{ij}\otimes\omega_j\) with \(B_{ij}=-B_{ji}\). Alternation is \(d\) because the connection is torsion-free. Set \(b_1=B_{23}\), \(b_2=B_{31}\), \(b_3=B_{12}\). Closedness gives
\[
J_2b_3-J_3b_2=0,\qquad
J_3b_1-J_1b_3=0,\qquad
J_1b_2-J_2b_1=0.
\]
The last two equations give \(b_2=-J_3b_1\), \(b_3=J_2b_1\). Substitution into the first gives \(-2b_1=0\), so every connection coefficient vanishes. The initial sign choice has no effect on parallelism.

## 4. The explicit family on the standard sphere

### Coframe, orientation and closed modes

**Project theorem (working).** Identify \(\mathbb R^4\) with the quaternions, write \(x=rq\), \(q\in S^3\), and let \(\sigma_i=-(q^{-1}dq)_i\) denote components in the standard imaginary units. The spaces of forms here are over the reals. Differentiating \(q^{-1}dq\) and using the quaternion multiplication table gives \(d\sigma_i=2\sigma_j\wedge\sigma_k\) for cyclic \((i,j,k)\). Multiplication by \(q^{-1}\) is an isometry, so the \(\sigma_i\) form a unit round coframe on \(S^3\). Choose the geometric orientation on \(\mathbb R^4\) that makes \(dr\wedge\sigma_1\wedge\sigma_2\wedge\sigma_3\) positive. This is the orientation of the polar calculation in `check_06`. Write
\[
g=dr^2+\sum_{i=1}^3a_i^2\,\sigma_i\otimes\sigma_i,\qquad
e^0=dr,\quad e^i=a_i\sigma_i,
\]
with all \(a_i>0\) for \(r>0\). Then
\[
d(f_i\sigma_i)=\frac{f_i'}{a_i}e^{0i}+
                       \frac{2f_i}{a_ja_k}e^{jk}.
\]
The form is closed, and the star sends \(e^{0i}\) to \(e^{jk}\) for cyclic \((i,j,k)\), giving the equation \(f_i'=2a_i f_i/(a_ja_k)\). For positive solutions all three modes form a basis of the self-dual fibre. Their Gram matrix is diagonal with entries \(8f_i^2/(a_j^2a_k^2)\), since the three sums \(e^{0i}+e^{jk}\) are orthogonal and have squared norm \(2\).

### Smooth positive metric at both ends

**Project theorem (working).** Set \(t=r^2\), \(h=t/(1+t)^2\), \(A=1+\varepsilon h\), and take \(a_1=rA,\ a_2=a_3=r\). For \(t\geq0\), the inequality \((1+t)^2\geq 4t\) proves \(0\leq h\leq1/4\), with equality at \(t=1\) for the upper bound. Thus \(A>0\) for every \(r>0\) exactly when \(\varepsilon>-4\).

The one-forms
\[
\alpha_i=r^2\sigma_i=-\operatorname{Im}_i(\bar x\,dx)
\]
extend to all of \(\mathbb R^4\), with linear Cartesian coefficients. Their norms in the Euclidean metric are \(r\), and \(\alpha_i\) annihilates the radial vector. Hence
\[
g_\varepsilon=g_{\mathrm{euc}}+
\left(\frac{2\varepsilon}{(1+t)^2}
+\frac{\varepsilon^2 t}{(1+t)^4}\right)\alpha_1\otimes\alpha_1 .
\]
The coefficient is smooth in \(t\) at \(t=0\), and \(\alpha_1(0)=0\), giving a smooth positive extension at the origin. In the inverted chart \(y\), \(\rho=|y|\), the angular variable stays fixed, \(r=\rho^{-1}\), and \(h(r^2)=h(\rho^2)\). Thus \(\rho^4 I^*g_\varepsilon\) has the same expression in \(y\) as \(g_\varepsilon\) in \(x\), with \(t\) replaced by \(\rho^2\). The Cartesian calculation therefore applies at \(\rho=0\) as well. A global smooth positive representative is \(4(1+r^2)^{-2}g_\varepsilon\) on the \(x\) chart, which in \(y\) is \(4(1+\rho^2)^{-2}(\rho^4 I^*g_\varepsilon)\). The charts give the standard \(S^4\) with points at \(r=0\) and \(r=\infty\). The factor \(\rho^4\) absorbs the inversion singularity of the metric. The forms below have a pole at infinity.

### Normalized modes at both ends

**Project theorem (working).** For every \(\varepsilon>-4\), define \(P_\varepsilon(t)=t^2+(2+\varepsilon)t+1=(1+t)^2A\) and
\[
\begin{aligned}
f_1(r)&=r^2F_1(r^2), &F_1(t)&=\exp(-\varepsilon/(1+t)),\\
f_2(r)&=r^2F_2(r^2), &F_2(t)&=\exp\!\left(\varepsilon\int_t^\infty\frac{ds}{P_\varepsilon(s)}\right),\\
f_3(r)&=r^2F_3(r^2), &F_3(t)&=F_2(t).
\end{aligned}
\]
The first logarithmic derivative in \(r\) is \(2/r+2\varepsilon r/(1+r^2)^2=2A/r\). For modes \(2,3\) the target derivative is \(2/(rA)\), which after subtracting \(2/r\) and dividing by \(2r\) gives \(d(\log F_i)/dt=-\varepsilon/P_\varepsilon(t)\). The formulas solve the equations with \(F_i(\infty)=1\). The polynomial is positive on \(t\ge0\), and the integrals converge because their integrands are \(O(s^{-2})\) at infinity. All three \(F_i\) are smooth and strictly positive at \(t=0\).

The forms \(\omega_i=d(F_i(t)\alpha_i)\) extend smoothly at \(r=0\). At that point \(\omega_i(0)=F_i(0)d\alpha_i\), where \(d\alpha_i\) has constant Cartesian coefficients and equals \(2(e^{0i}+e^{jk})\) in the Euclidean polar coframe on \(r>0\). The three \(d\alpha_i\) thus form a basis of the Euclidean self-dual space everywhere, including at \(r=0\). Since the metric at \(r=0\) is Euclidean, the extended triple is definite there. For \(r>0\) its Gram entries from the mode calculation are strictly positive.

At infinity put \(\tau=1/t\). Direct substitution gives
\[
F_1(1/\tau)=\exp(-\varepsilon\tau/(1+\tau)),\qquad
F_i(1/\tau)=\exp\!\left(\varepsilon\int_0^\tau
\frac{du}{P_\varepsilon(u)}\right)\quad(i=2,3).
\]
For the integral use \(s=1/u\) and \(P_\varepsilon(1/u)=u^{-2}P_\varepsilon(u)\). These expressions are smooth in \(\tau\) at zero with value \(1\). Therefore \(F_i(t)-1=O(r^{-2})\) and \(d(F_i(r^2))=O(r^{-3})\) in the Euclidean \(x\) chart. Since \(\alpha_i=O(r)\), the forms satisfy \(\omega_i=d\alpha_i+O(r^{-2})\) in \(x\), and in \(y\)
\[
I^*\omega_i=\rho^{-4}R_y^*(d\alpha_i)+O(\rho^{-2}).
\]
The \(O\)-bounds are on Euclidean coefficients for each fixed \(\varepsilon\). The compact metric is smooth positive and uniformly comparable to the Euclidean metric near \(y=0\). Its geodesic distance from \(p\) is comparable to \(\rho\). By the growth definition, each mode is a pole form. The three forms span a three-dimensional subspace of \(\mathcal H_p(c_\varepsilon)\), and every nonzero element of this subspace is nowhere zero. Calling these a basis of the full pole space uses its dimension statement from A1.

## 5. Recorded symbolic tests and numerical diagnostics

- The file reports `21 ok, 0 FAIL`. Its block (a) uses particular constant forms, whereas §1 proves the inversion statement for every constant two-form. In block (b), the Cartesian arguments above also cover the cyclic modes and the origin. In block (d), checking reciprocal symmetry, limiting orders or the value and derivative at \(t=1\) is supplemented here by an explicit smooth Cartesian formula and the global inequality for \(h\).
- Block (c) reports symbolic checks of the curvature routine on the three calibrating metrics. Block (d) obtains the family energies by `mpmath.quad` at 20 decimal digits of working precision with breakpoints \(0,0.5,1,2,5,20,\infty\). In the reported normalization \(T=4\pi^2\), the ratios \(E_+/T\) at \(\varepsilon=1,2,12\) are approximately \(0.787357, 4.2322, 1172.41\). The test compares the two block integrals using \(|E_+-E_-|\leq10^{-9}\max(1,|E_+|)\) on the 12 sampled parameter values. These are numerical diagnostics. Equality of the two numerical integrals does not bound their common error.
- The comparisons to \(2T\) are reported floating-point observations. The file contains neither a certified quadrature bound for those comparisons nor a proof that the energy ranges over all nonnegative values. Test (d6) checks only \(0<E_+(0.01)<10^{-2}\) and gives no asymptotic estimate by itself. The exact definiteness proved in §4 holds for every \(\varepsilon>-4\) independently of these energy experiments.

The original output was inspected. The local `python3` lacks SymPy, and the proof above was obtained independently of reexecuting the script.
