# Riemannian S⁴: chiral connections, twistor defects, and a linear stability calculation

21 November 2026. Exploratory research note accompanying `generalized_isothermal_wave_metrics.tex` and `chiral_connection_descent_and_double_copy.tex`.

**Status.** This note gives explicit round-sphere formulas, algebraic perturbation calculations, and a normalization of the known Weyl-energy Hessian. It identifies a local relation to the energy of definite connections. It does not establish a new nonlinear convergence theorem, construct an ASD metric on an unknown smooth homotopy sphere, or resolve smooth four-dimensional Poincaré. The round and stability formulas are standard geometry; their role here is to test the proposed generalized-coordinate program and delimit its extension.

## 1. Conventions and scope

Let \(g_0\) be the round metric of radius \(\ell>0\) on the standard smooth \(S^4\), and set \(K=\ell^{-2}\). Choose an orientation and write \(\Lambda^2=\Lambda^+\oplus\Lambda^-\). In this note ASD conformal geometry means \(W^+=0\). All Weyl norms below are Hilbert–Schmidt norms as endomorphisms of two-forms, so the full four-index squared norm is four times the curvature-operator squared norm. Confusing those conventions changes the Hessian constants by four.

The symbols \(A^\pm\) label the two real \(SU(2)\) spin connections, associated with the two form chiralities. Their signs are not an identification with the manuscripts' unprimed and primed labels. In the ASD convention used here, the connection associated with \(\Lambda^+\) has the Weyl block that is required to vanish. The manuscript's vacuum construction transfers the other, potentially curved chiral connection. Both connections are nonflat on the round sphere.

The curvature convention is \(R=d\omega+\omega\wedge\omega\), with a round orthonormal frame satisfying \(R_{ab}=K e^a\wedge e^b\). The curvature operator has positive round eigenvalue \(K\). Thus \(R_{1212}=K\) in the sectional-curvature convention \(R_{ijkl}=\langle R(e_i,e_j)e_l,e_k\rangle\).

Real Riemannian twistor space has real dimension six. The manuscripts' holomorphic correspondence space has complex dimension five. When referring to their alpha-distribution maps below, use local complexification of the analytic round model. For general smooth perturbations, use the real almost-complex twistor space; no analytic complexification is assumed.

## 2. The round metric and both chiral connections

On a stereographic patch, put

\[
r^2=\sum_{a=1}^4(x^a)^2,\qquad d=\ell^2+r^2,\qquad
\Omega=\frac{2\ell^2}{d},\qquad
g_0=\Omega^2\delta,\qquad e^a=\Omega\,dx^a.
\]

Since \(d\log\Omega=-2x_a dx^a/d\), the torsion equations give

\[
\omega_{ab}=\frac{2(x_a\,dx_b-x_b\,dx_a)}{d},
\qquad de^a+\omega^a{}_b\wedge e^b=0.
\]

Differentiation gives

\[
R_{ab}=K e^a\wedge e^b,\qquad
\operatorname{Ric}(g_0)=3K g_0,\qquad s(g_0)=12K,
\qquad W^+=W^-=0.
\]

Use the 't Hooft symbols

\[
\eta^\pm_{i,jk}=\epsilon_{ijk},\quad
\eta^\pm_{i,j4}=\pm\delta_{ij},\quad
\eta^\pm_{i,4j}=\mp\delta_{ij},
\qquad i,j,k\in\{1,2,3\}.
\]

Set \(T_i=-i\sigma_i/2\), so \([T_i,T_j]=\epsilon_{ijk}T_k\) and \(\operatorname{tr}(T_iT_j)=-\delta_{ij}/2\). Define

\[
\Sigma_i^\pm=\frac12\eta^\pm_{i,ab}e^a\wedge e^b,
\qquad *\Sigma_i^\pm=\pm\Sigma_i^\pm,
\qquad \Sigma_i^\pm\wedge\Sigma_j^\pm=\pm2\delta_{ij}\,dV.
\]

The spin connections and curvatures are

\[
\boxed{
A^\pm=A_i^\pm T_i,\qquad
A_i^\pm=-\frac12\eta^\pm_{i,ab}\omega_{ab}
=\frac{2\eta^\pm_{i,ab}x_b\,dx^a}{d},
\qquad F_i^\pm=-K\Sigma_i^\pm.
}
\]

Equivalently, \(F_{i,\mu\nu}^\pm=-4\ell^2\eta^\pm_{i,\mu\nu}/d^2\). These are the basic instanton and anti-instanton in regular stereographic gauge. In particular the quadratic term \(A\wedge A\) is present: the example uses the nonabelian chiral algebra, unlike the wave reduction.

An exact polynomial check of the curvature formula is included in the appendix. The identity behind it is

\[
\epsilon_{ijk}(\eta_{j,\mu a}x_a)(\eta_{k,\nu b}x_b)
=r^2\eta_{i,\mu\nu}
+x_\mu\eta_{i,\nu a}x_a-x_\nu\eta_{i,\mu a}x_a.
\]

### Global patching

Write the quaternion \(x=x^4+x^1\mathbf i+x^2\mathbf j+x^3\mathbf k\), identifying the imaginary quaternion units with \(2T_i\). Then

\[
A^+=\frac{\operatorname{Im}(\bar x\,dx)}{\ell^2+|x|^2},
\qquad
A^-=\frac{\operatorname{Im}(x\,d\bar x)}{\ell^2+|x|^2}.
\]

In the opposite-pole chart \(y=\ell^2x^{-1}\), use \(q=x/|x|\) and the gauges \(h^+=q^{-1}\), \(h^-=q\), with \(A^h=h^{-1}Ah+h^{-1}dh\). The transformed fields have the same regular formulas in \(y\). This explicitly supplies the missing pole; one formula in one trivialization is not a global connection form.

For example, \(A^+=f\bar q\,dq\), \(f=r^2/(\ell^2+r^2)\). Its gauge transform by \(q^{-1}\) is \(-(1-f)dq\,\bar q\), precisely the regular expression in \(y\).

With \(c_2=(8\pi^2)^{-1}\int\operatorname{tr}(F\wedge F)\), these labels give \(c_2(S^+)=-1\), \(c_2(S^-)=+1\). Both Yang–Mills energies \(-\int\operatorname{tr}(F\wedge *F)\) are \(8\pi^2\). This follows directly from \(F_i^\pm=-K\Sigma_i^\pm\) and \(\operatorname{Vol}(S^4,g_0)=8\pi^2/(3K^2)\).

## 3. What this does to the generalized-coordinate construction

Hodge star on two-forms in four dimensions is conformally invariant. Hence each displayed chiral connection is a self-dual or anti-self-dual gauge field for the flat stereographic metric as well as for \(g_0\).

The conformal stereographic chart has a projective-spin lift preserving the alpha distributions. Its source point is independent of the target projective direction. Therefore its full pulled-back spin connection is an ordinary flat-base connection, exactly as required by the manuscripts' full-descent definition. This is an ordinary conformal-chart realization of descent; it does not need direction-dependent source-point motion.

Indeed the common kernel of either round chiral curvature is zero. If \(v\ne0\), the triple \(\Sigma_i^\pm(v,\cdot)\) cannot all vanish. The motion constraint in Section 2 of the double-copy manuscript then forces source-point motion to be zero for any such full descent. Here that is consistent because the source is conformally flat.

There is no contradiction with the vacuum Petrov obstruction: \(\operatorname{Ric}=3K g_0\ne0\). Nor can one flatten one of the spin connections as in the wave ansatz: both have nonzero curvature. A positive-scalar-curvature extension must account for the nonzero opposite-chirality curvature; it cannot impose its flatness. A definite single chiral connection can still encode a reconstructed metric, from which the other Levi–Civita connection can be obtained.

Globally the round twistor space is \(\mathbb{CP}^3\), with its twistor real structure, rational lines, and the contact structure associated with the nonzero Einstein constant. The hyperkähler fibration over a fixed \(\mathbb{CP}^1\), used in the manuscripts' relative symplectic derivative-bundle construction, is not part of this global round model. A local conformal lift is sufficient for the calculation above.

The scale also needs attention. Unnormalized round Ricci flow is

\[
g(t)=(1-6Kt)g_0,\qquad 0\leq t<(6K)^{-1}.
\]

Its Levi–Civita connection stays unchanged under this spatially constant rescaling. A connection alone therefore does not encode even the shrinking round scale without a scale variable or normalization.

## 4. Two distinct first-order defects

Consider \(g_\varepsilon=g_0+\varepsilon h+O(\varepsilon^2)\). Identify frames by the symmetric coframe variation \(e^a_\varepsilon=e^a+(\varepsilon/2)h^a{}_b e^b+O(\varepsilon^2)\). Linearizing torsion gives

\[
\dot\omega_{ab}=\frac12(\nabla_bh_{ac}-\nabla_ah_{bc})e^c,
\qquad
\dot A_i^\pm=-\frac12\eta^\pm_{i,ab}\dot\omega_{ab},
\qquad \dot F^\pm=d_{A_0^\pm}\dot A^\pm.
\]

Thus the connection variation is first order in \(h\), and its curvature variation is second order. When separating form chiralities, the variation of the Hodge decomposition must also be included.

Define

\[
D_+h=\left.\frac{d}{d\varepsilon}\right|_0 W^+(g_\varepsilon).
\]

The curvature operator has blocks

\[
\mathcal R_g=
\begin{pmatrix}
W^++sI/12&B\\
B^T&W^-+sI/12
\end{pmatrix}.
\]

Here \(B\) is the block encoding trace-free Ricci curvature; its index ordering is fixed by the row of \(F_i^+\) in the next section. Two logically different conditions appear:

* The integrability of the chosen twistor almost-complex structure is \(W^+=0\).
* The \(+\) Levi–Civita spin connection is self-dual as a gauge field relative to the given metric when \(B=0\), equivalently when that metric is Einstein. The analogous assertion holds for the minus connection.

The first can hold while the second fails. In fact, for

\[
g_\varepsilon=e^{2\varepsilon f}g_0,
\]

one has exactly \(W^\pm(g_\varepsilon)=0\), whereas

\[
\boxed{(\operatorname{Ric}_0)'=-2(\nabla^2 f)_0.}
\]

To derive this, use the four-dimensional conformal formula
\(\operatorname{Ric}(e^{2u}g)=\operatorname{Ric}(g)-2\nabla^2u-g\Delta u+2du\otimes du-2|du|^2g\), and remove the varying scalar trace. For a generic \(f\), the displayed trace-free Hessian is nonzero. The conformal chart and ordinary full-connection descent still exist, but the descended spin connection need not be an ASD/SD Yang–Mills solution. This distinguishes descent, twistor integrability, and Einstein compatibility.

## 5. An explicit perturbation that destroys integrability

At a point \(p\), choose round geodesic normal coordinates \(y\). Let \(c\ne0\), set

\[
h_{11}=-c(y^2)^2,\qquad h_{ij}=0\text{ otherwise},
\]

near \(p\), and multiply by a smooth cutoff equal to one there. It extends to a global smooth tensor on the standard sphere, and \(g_0+\varepsilon h\) is positive-definite for sufficiently small \(\varepsilon\). At \(p\), \(h=\nabla h=0\); only its second derivative contributes to curvature variation.

Using

\[
R'(h)_{ijkl}=\frac12\bigl(
\partial_j\partial_kh_{il}+\partial_i\partial_lh_{jk}
-\partial_j\partial_lh_{ik}-\partial_i\partial_kh_{jl}\bigr),
\]

the only independent nonzero curvature entry is \(R'_{1212}=c\). Hence

\[
\operatorname{Ric}'(p)=\operatorname{diag}(c,c,0,0),\qquad s'(p)=2c.
\]

In the orthonormal chiral bases
\((e^{12}\pm e^{34},e^{13}\mp e^{24},e^{14}\pm e^{23})/\sqrt2\),

\[
\boxed{
D_\pm h(p)=\frac c6\operatorname{diag}(2,-1,-1),
\qquad \|D_\pm h(p)\|^2=\frac{c^2}{6}.
}
\]

For this affine metric family these pointwise Weyl blocks are exactly \(\varepsilon D_\pm h(p)\): the metric and its first derivatives at \(p\) do not vary. Thus every sufficiently small nonzero \(\varepsilon\) produces a nonintegrable twistor almost-complex structure.

This cannot be fixed by choosing different exact generalized charts. A local diffeomorphism preserving a distribution also preserves its Frobenius integrability. In the holomorphic setting a nonintegrable alpha distribution cannot map to the integrable flat one. In the smooth real setting an almost-complex isomorphism to an integrable model would similarly force \(N_J=0\). An extension suitable for a flow must keep a nonzero defect in its geometric data.

There is nevertheless a useful flat-coordinate calculation. In a stereographic patch write \(h=\Omega^2 k\). Conformal covariance and \(W(g_0)=0\) give, as curvature operators,

\[
D_{+,g_0}h=\Omega^{-2}D_{+,\delta}k.
\]

For a perturbation supported inside that patch,

\[
\int_{S^4}\|D_{+,g_0}h\|^2dV_{g_0}
=\int_{\mathbb R^4}\|D_{+,\delta}k\|^2dx.
\]

Here \(D_{+,\delta}k\) is the plus block of
\(R'(k)-\tfrac12(\delta\owedge\operatorname{Ric}')+\tfrac{s'}{12}(\delta\owedge\delta)\), with \(\owedge\) the Kulkarni–Nomizu product. The calculation retains a general tensor \(k\); it is not a reduction to a single scalar potential.

## 6. A local bridge to definite connections

Use the plus chiral connection of the varying metric and write

\[
F_i^+=-C_{ij}\Sigma_j^+-B_{ij}\Sigma_j^-,
\qquad C=W^++\frac{s}{12}I.
\]

The normalization of \(\Sigma_i\) is the one in Section 2. Taking wedge products gives the exact algebraic identity

\[
F_i^+\wedge F_j^+=2M_{ij}\,dV_g,
\qquad M=C^2-BB^T.
\]

Near the round metric, \(M\) is positive definite. Define

\[
\mu_A=\frac13\sum_i F_i\wedge F_i
=\frac23\operatorname{tr}(M)\,dV_g,
\qquad
Q_{ij}=\frac{F_i\wedge F_j}{\mu_A}
=\frac{3M_{ij}}{\operatorname{tr}M}.
\]

Thus \(\operatorname{tr}Q=3\); \(Q=I\) is the perfect-connection condition. This is the algebraic condition used in the definite-connection approach to ASD Einstein geometry [Fine; FKP], with our volume normalization made explicit.

At round, \(C=KI\), \(B=0\), and \(Q=I\). Differentiating yields

\[
\dot M=2K\left(D_+h+\frac{s'}{12}I\right),
\qquad
\boxed{\dot Q=\frac{2}{K}D_+h.}
\]

The scalar part cancels on trace normalization. The vanishing of \(B_0\) makes \(BB^T\) second order, and volume changes cancel in the ratio defining \(Q\). Since \(Q_0=I\) and \(W_0=0\), changes of the identifying frame do not alter this first-order conclusion.

For the explicit curvature jet in Section 5,

\[
\dot Q(p)=\frac{c}{3K}\operatorname{diag}(2,-1,-1).
\]

This is a concrete relation between the linear twistor-integrability obstruction and a gauge-covariant connection defect. It uses the chiral connection whose Weyl block is \(W^+\), not automatically the chiral field transferred in the vacuum manuscript.

Let

\[
\mathcal P(g)=\int_{S^4}\|Q(A_g^+)-I\|^2\mu_{A_g^+},
\qquad
\mathcal E_+(g)=\int_{S^4}\|W^+(g)\|^2dV_g.
\]

Since \(\mu_{A_0}=2K^2dV_{g_0}\),

\[
\boxed{
\mathcal P(g_\varepsilon)
=8\varepsilon^2\|D_+h\|_{L^2(g_0)}^2+O(\varepsilon^3),
\qquad
\mathcal E_+(g_\varepsilon)
=\varepsilon^2\|D_+h\|_{L^2(g_0)}^2+O(\varepsilon^3).
}
\]

These are matching quadratic energies, up to the stated normalization. They do not identify the nonlinear functionals or their flows. The exact discrepancy is already visible if \(a=s/12\):

\[
Q-I=\frac3{\operatorname{tr}M}
\left[2aW^++(W^+)^2-BB^T\right]_0.
\]

For a pure conformal perturbation of round, \(W^+=0\) exactly, while

\[
Q-I=-\frac{\varepsilon^2}{K^2}
\left[\dot B\dot B^T\right]_0+O(\varepsilon^3).
\]

Thus \(\mathcal P\) can begin at fourth order even though \(\mathcal E_+\) vanishes identically. For example, take \(f=((y^1)^2-(y^2)^2)/2\) near \(p\), with a cutoff. Then \(\operatorname{Ric}_0'(p)=\operatorname{diag}(-2,2,0,0)\). In the bases of Section 5, \(\dot B(p)=\operatorname{diag}(0,-1,-1)\), so

\[
Q(p)-I=\frac{\varepsilon^2}{3K^2}
\operatorname{diag}(2,-1,-1)+O(\varepsilon^3).
\]

There is also a reconstruction distinction: the three curvature forms span the graph of \(C^{-1}B\) over \(\Lambda_g^+\), in the chosen row convention. The conformal metric reconstructed by declaring this span self-dual generally differs from \([g]\) when \(B\ne0\). Every definite connection is self-dual for its reconstructed conformal metric; being self-dual for the original metric imposes the Einstein condition. A flow on independent connections and a flow on metrics restricted through \(g\mapsto A_g^+\) must therefore be compared separately.

## 7. The metric energy and its exact linear stability operator

The first variation of \(\mathcal E_+\) vanishes at round, and

\[
\operatorname{Hess}_{g_0}\mathcal E_+(h,h)=2\|D_+h\|_{L^2}^2.
\]

Diffeomorphism and conformal directions lie in the kernel:

\[
D_+(\mathcal L_Xg_0+2fg_0)=0.
\]

Remove these directions by taking \(h\) transverse-traceless (TT): \(\operatorname{tr}_{g_0}h=0\), \(\nabla^ih_{ij}=0\). Write \(L=\nabla^*\nabla\geq0\). With our curvature-operator norm, the round identity is

\[
\boxed{
D_+^*D_+=\frac1{16}(L+2K)(L+4K)
\quad\text{on TT tensors}.
}
\]

For clarity, the normalization follows from Gauss–Bonnet and signature:

\[
\mathcal E_+=4\pi^2\chi+6\pi^2\tau
+\frac14\int_M\left(|\operatorname{Ric}|^2-\frac13s^2\right)dV.
\]

Gursky–Viaclovsky [GV, Theorem 3.10, equation (3.41)] give the TT Hessian of the last integral as
\(\tfrac12(\Delta_L+s/2)(\Delta_L+s/3)\).
On round \(S^4\), their convention is \(\Delta_L=-L-8K\), \(s=12K\). Multiplication by \(1/4\) therefore gives \(\operatorname{Hess}\mathcal E_+=\tfrac18(L+2K)(L+4K)=2D_+^*D_+\). This is a specialization of their known Hessian formula, not a newly established sphere-stability theorem.

The linearized negative metric \(L^2\)-gradient flow is consequently

\[
\boxed{
\partial_t h=-\frac18(L+2K)(L+4K)h.
}
\]

For an eigentensor \(Lh_\lambda=\lambda h_\lambda\), its amplitude is

\[
h_\lambda(t)=
\exp\!\left[-\frac{(\lambda+2K)(\lambda+4K)}8t\right]
h_\lambda(0).
\]

The round TT spectrum has \(\lambda\geq8K\) [GV, Section 7.1]. Thus, for this linear equation,

\[
\|h(t)\|_{L^2}\leq e^{-15K^2t}\|h(0)\|_{L^2},
\qquad
\|D_+h(t)\|_{L^2}^2\leq e^{-30K^2t}\|D_+h(0)\|_{L^2}^2.
\]

The positive TT factor also shows that the full kernel of \(D_+\) consists of diffeomorphism and conformal directions, after the standard decomposition of symmetric tensors. Its principal symbol on TT tensors is \(|\xi|^4I/16\) for \(D_+^*D_+\). The flow is fourth order, and its time variable has the corresponding length-to-the-fourth scaling.

These statements establish a linear restoring mechanism near a known round metric. They do not assert global nonlinear existence, preservation of definite connections under a chosen flow, or access to the round neighborhood from arbitrary initial data. The nonlinear metric functional is the usual chiral Weyl functional, whose gradient is a normalization of the Bach tensor. The calculation has not produced a new independent flow.

## 8. Consequences for the research direction

The nonzero-scalar-curvature model passes the first consistency test: curved positive-definite geometry gives nontrivial flat-background gauge fields, and global spin-bundle patching is explicit. It also shows why keeping a flat opposite chirality would lose the round target.

The more useful extension is to keep both kinds of defect, \(W^+\) and the trace-free Ricci block, along with the conformal scale or a normalization. Exact alpha-preserving charts cease to exist once \(W^+\ne0\); the almost-twistor geometry remains available. The relation \(\dot Q=2D_+h/K\) makes definite connections a concrete candidate language for the extension, but its nonlinear correction \(-(BB^T)_0\) must be retained.

The next bounded analytical task is to compare an independent definite-connection flow with the metric flow through second order, including the change from the original metric \(g\) to the curvature-reconstructed metric \(g_A\). In particular, determine whether a gauge-fixed equation for \(Q-I\) gives useful estimates on the Ricci block or on loss of definiteness. The formulas above supply its linear normalization and an explicit conformal perturbation testing any proposed nonlinear equivalence.

For smooth Poincaré, the missing input remains global. A smooth homotopy four-sphere admitting a Riemannian ASD metric is standard by signature zero and conformal developing-map rigidity. Perturbing the known round sphere presupposes that smooth model; it cannot show that an arbitrary homotopy sphere possesses the required starting geometry. A viable global program needs a construction and compactness mechanism that do not assume that conclusion.

## References and relation to the manuscripts

* **BakerWave.** E. B. Baker III, *Generalized isothermal coordinates and chiral connection descent: A construction for holomorphic wave metrics*, working manuscript, 20 November 2026. Sections 2, 4, 6 and 8.
* **BakerDC.** E. B. Baker III, *Chiral connection descent and the classical double copy: Curvature obstructions and holomorphic wave geometry*, working manuscript, 21 November 2026. Sections 2–3 and 7–9.
* **AHS.** M. F. Atiyah, N. J. Hitchin and I. M. Singer, *Self-duality in four-dimensional Riemannian geometry*, Proc. R. Soc. Lond. A 362 (1978), 425–461. [DOI](https://doi.org/10.1098/rspa.1978.0143).
* **Fine.** J. Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*. [arXiv:1111.5005](https://arxiv.org/html/1111.5005v2). Definite and perfect connections, induced metric, and a connection flow.
* **FKP.** J. Fine, K. Krasnov and D. Panov, *A gauge theoretic approach to Einstein 4-manifolds*, New York J. Math. 20 (2014), 293–323. [arXiv:1312.2831](https://arxiv.org/html/1312.2831v3).
* **GV.** M. J. Gursky and J. A. Viaclovsky, *Rigidity and stability of Einstein metrics for quadratic curvature functionals*. [arXiv:1105.4648v2](https://arxiv.org/html/1105.4648v2), Theorem 3.10, equation (3.41), and Section 7.1.
* **GG.** A. R. Gover and M. J. Gursky, *The anti-self-dual deformation complex and a conjecture of Singer*. [arXiv:2307.12432](https://arxiv.org/html/2307.12432v1), Section 1.1. The deformation complex and the distinction between its metric and gauge directions.

## Verification

The following standard-library Python checks were run successfully. The BPST test is an exact homogeneous-polynomial verification, rather than numerical sampling: the values at basis vectors and their pairwise sums determine every quadratic coefficient. The Weyl-jet calculation uses rational arithmetic. The final normalization check is an arithmetic check of the cited Hessian conversion, not an independent proof of that theorem.

```text
BPST curvature: all 960 quadratic coefficient checks passed
Local perturbation: Weyl blocks and operator norm verified
Perfect-connection defect: Q' = 2 W'/K normalization verified
Hessian normalization and minimum linear decay rate verified
```

The complete verification code follows.

```python
"""Exact algebra checks for the S4 exploratory note; standard library only."""
from fractions import Fraction as F
from itertools import product, combinations

def eps(i, j, k):
    if len({i, j, k}) < 3:
        return 0
    return 1 if (i, j, k) in ((0, 1, 2), (1, 2, 0), (2, 0, 1)) else -1

def eta(s, i, a, b):
    if a < 3 and b < 3:
        return eps(i, a, b)
    if a < 3 and b == 3:
        return s * int(i == a)
    if a == 3 and b < 3:
        return -s * int(i == b)
    return 0

# The cleared BPST curvature residual is homogeneous quadratic in x.
# Values at e_a and e_a+e_b determine every polynomial coefficient.
unit = [tuple(int(a == b) for a in range(4)) for b in range(4)]
points = unit + [tuple(unit[a][j] + unit[b][j] for j in range(4))
                 for a, b in combinations(range(4), 2)]
checks = 0
for s, i, mu, nu, x in product((1, -1), range(3), range(4), range(4), points):
    v = [[sum(eta(s, j, a, b) * x[b] for b in range(4))
          for a in range(4)] for j in range(3)]
    residual = (-sum(t*t for t in x)*eta(s, i, mu, nu)
                - v[i][nu]*x[mu] + v[i][mu]*x[nu]
                + sum(eps(i, j, k)*v[j][mu]*v[k][nu]
                      for j, k in product(range(3), repeat=2)))
    assert residual == 0
    checks += 1
print(f"BPST curvature: all {checks} quadratic coefficient checks passed")

# Algebraic curvature variation of h_11 = -(y^2)^2 at its zero 1-jet.
pairs = list(combinations(range(4), 2))
def delta(a, b):
    return int(a == b)
def H(i, j, a, b):
    return -2 * int(i == j == 0 and a == b == 1)
def R(i, j, k, l):
    return F(H(i,l,j,k)+H(j,k,i,l)-H(j,l,i,k)-H(i,k,j,l), 2)
Ric = [[sum(R(a,i,a,j) for a in range(4)) for j in range(4)] for i in range(4)]
scalar = sum(Ric[a][a] for a in range(4))
def W(i,j,k,l):
    wedge = (Ric[i][k]*delta(j,l)+Ric[j][l]*delta(i,k)
             -Ric[i][l]*delta(j,k)-Ric[j][k]*delta(i,l))
    return R(i,j,k,l)-F(1,2)*wedge+F(scalar,6)*(delta(i,k)*delta(j,l)-delta(i,l)*delta(j,k))
assert Ric == [[int(i==j and i<2) for j in range(4)] for i in range(4)]
assert scalar == 2
Wmat = [[W(i,j,k,l) for k,l in pairs] for i,j in pairs]
# The three rows below are sqrt(2) times an orthonormal +/- basis.
for s in (1,-1):
    basis = [[1,0,0,0,0,s], [0,1,0,0,-s,0], [0,0,1,s,0,0]]
    block = [[sum(F(basis[i][a]*basis[j][b],2)*Wmat[a][b]
                  for a,b in product(range(6),repeat=2))
              for j in range(3)] for i in range(3)]
    assert block == [[(F(1,3),F(-1,6),F(-1,6))[i] if i==j else 0
                      for j in range(3)] for i in range(3)]
    assert sum(v*v for row in block for v in row) == F(1,6)
print("Local perturbation: Weyl blocks and operator norm verified")

# Frechet derivative Q=3 M/tr(M) at M=K^2 I with M'=2K(W'+s'/12 I).
K = F(2,3)
Wp = [[F(1),F(2),F(3)],[F(2),F(-4),F(5)],[F(3),F(5),F(3)]]
sp = F(7)
Mp = [[2*K*(Wp[i][j]+(sp/12 if i==j else 0)) for j in range(3)] for i in range(3)]
trMp = sum(Mp[i][i] for i in range(3))
Qp = [[Mp[i][j]/K**2-(trMp/(3*K**2) if i==j else 0) for j in range(3)] for i in range(3)]
assert Qp == [[2*Wp[i][j]/K for j in range(3)] for i in range(3)]
print("Perfect-connection defect: Q' = 2 W'/K normalization verified")

# Convert the published quadratic-curvature Hessian to E_+ with operator norm.
# E_+ differs from F_{-1/3}/4 by a topological constant.
for lam in (F(8),F(18),F(30),F(44)):
    # Unit curvature: Delta_L eigenvalue = -lam-8, scalar curvature = 12.
    converted = F(1,4)*F(1,2)*(-lam-8+6)*(-lam-8+4)
    assert converted == (lam+2)*(lam+4)/8
assert (F(8)+2)*(F(8)+4)/8 == 15
print("Hessian normalization and minimum linear decay rate verified")
```
