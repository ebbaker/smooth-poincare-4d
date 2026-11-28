# WIN-E09 A · Independent reading of the angular residue and its rigidity

28 November 2026 UTC, 27 November in America/New_York. Prepared for Edward B.
Baker III with OpenAI Codex assistance. The [frozen reading request](../research-progress/handoffs/REQUEST_REPLAY_PENCIL_R1.md)
lists GPT-6.2 Sol/ultra. Actual serving variant and effort are unavailable.
The reader did not author the proofs under review. The baseline is
`86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`. Input SHA-256 digests are:

| Input | SHA-256 |
| --- | --- |
| [Pencil rigidity, proof revision 1](../notes/PENCIL_RIGIDITY.md) | `91df5d33802e285f9eb212296e512e150fa12be18fa1d22c6117cf163ca2503f` |
| [E14 angular residue](../notes/E14_ANGULAR_RESIDUE.md) | `5a9a6302bb32375d015686174b40d8bdd9d3d1999c04cc900601ece1791eb3df` |
| [E10 round control](../notes/E10_ROUND_INSERTION.md) | `591e74c7f80bf2b5851df64b7ff79235a2e06ea6a204d31514122aa03c64a235` |

The initial E14 digest was `7da4970e7df0c8cb58eda54a3a2fac597a49c669cf69238de8804bee56915c5f`.
The re-read checked the later date and citation refinements and the same
mathematical calculation.

The residue formula, the smooth prolongation, the attained-zero rigidity
and the strict-jet condition replay as stated. On a fixed smooth metric,
existence of an attaining generating pencil is equivalent to conformal
roundness. A given pencil can have a conformal kernel map and positive
residue, as checked below. Evidence is an independent mathematical reading.

## Angular coefficient and finite part

Use the submitted smooth oriented Riemannian setting, positive half-spin
line with the right quaternionic action and the fixed parameter metric on
\(\mathbb H^2\). Write \(E_x\) for the surjection, \(m=\|E_x\|>0\),
\(K=\ker E_x\), and \(B_xu=P_g(s_u)(x)\) with \(u\) constant. Choose unit
vectors \(e\in K^\perp\) and \(k\in K\). Decompose a uniform unit parameter
as \(u=e\sqrt t\,q+k\sqrt{1-t}\,r\) with \(q,r\) uniform independent unit
quaternions. The probability density of \(t\) is \(6t(1-t)\). Indeed, model the
two squared Gaussian radii by independent variables of density
\(s e^{-s/2}/4\) on \(s>0\). The change of variables to their sum \(w\) and
ratio \(t\) gives density \(w^3e^{-w/2}t(1-t)/16\). Integrating \(w\) gives
the factor 6. The quotient and cutoff are right-unit invariant, so the
same calculation uses the stated projective probability.

Write \(a=B_xe\), \(b=B_xk\), \(A=|a|^2\), \(C=|b|^2\), and
\(D_0=|\langle a,b\rangle_{\mathbb H}|^2\). The scalar mixed term in
\(|B_xu|^2\) is \(2\sqrt{t(1-t)}\operatorname{Re}(\bar q\langle a,b\rangle r)\).
For fixed \(q\) the quaternion in parentheses is uniform on the sphere of
radius \(\sqrt{D_0}\), or is zero. Its real part has mean zero and second
moment \(D_0/4\). Thus the conditional fourth moment is
\(t^2 A^2+(1-t)^2 C^2+t(1-t)(2AC+D_0)\).
Since \(|E_xu|^2=m^2 t\), the three terms in the cutoff integral at a point
are \(6/m^4\) times \(A^2,C^2,2AC+D_0\) times the respective integrals of
\(t(1-t),(1-t)^3/t,(1-t)^2\) from \(\epsilon^2\) to 1. Their constant terms
after extracting the logarithm are \(1/6,-11/6,1/3\), and the sole
logarithm is \(2\log(1/\epsilon)\) in the second integral. This gives a
coefficient \(12\int_M|B_xk|^4/m^4\,dV_g=12R_g(E)\) and finite part
\(\int_M(A^2-11C^2+4AC+2D_0)/m^4\,dV_g\). The three integral remainders
are uniformly \(O(\epsilon^2)\) after multiplication by the displayed
coefficients because \(m\) has a positive minimum. E14 uses \(R\) for the
coefficient including 12. Its linear control integrates \((1-t)^3/t\)
alone, giving \(12\log(1/\epsilon)-11+18\epsilon^2-9\epsilon^4+2\epsilon^6\).

Nonnegativity and continuity imply that zero residue is equivalent to
\(B_x|_{K_x}=0\) everywhere. In that case \(B_xu\) depends only on the
component in \(K_x^\perp\), and the integrand has the bounded pointwise
value \(A^2/m^4\) away from the incidence. At each \(x\) the excluded
parameter line has projective probability zero. The cutoff integrals
increase to the mean by monotone convergence, and divergence applies
whenever the residue is positive.

## Prolongation with arbitrary smooth zeroth-order term

If \(B|_K=0\), then \(E E^*=m^2\operatorname{id}\) and
\(E^*E/m^2=\operatorname{pr}_{K^\perp}\). Hence the smooth bundle map
\(T=B E^*/m^2\) gives \(B=TE\). For every fixed parameter, write
\(s=s_u,\ h=-D_g s/4\), so \(\nabla_i s=c_i h+T_i s\), with
\(c_i=c(e_i)\) acting between the chiralities. In a normal frame, with
curvature defined by the commutator of covariant derivatives, expansion gives
\[
 \begin{aligned}
 R^S_{ij}s={}&c_j\nabla_i h-c_i\nabla_j h\\
 &+\big((\nabla_iT)_j-(\nabla_jT)_i+T_jT_i-T_iT_j\big)s
 +(T_jc_i-T_ic_j)h.
 \end{aligned}
\]
The alternation map \(L(b)_{ij}=c_jb_i-c_i b_j\) is injective. Indeed, if
\(L(b)=0\), then \(b_j=-c_i c_j b_i\) for every \(j\ne i\). For two
distinct indices \(j,\ell\) different from \(i\), the equation
\(c_\ell b_j=c_j b_\ell\) becomes \(2c_i c_j c_\ell b_i=0\) after
anticommuting distinct Clifford matrices. This makes \(b_i=0\) for
every \(i\). The smooth left inverse \((L^*L)^{-1}L^*\) therefore
expresses \(\nabla h\) linearly in \((s,h)\) with smooth coefficients.
Together with the equation for \(\nabla s\) this is a homogeneous linear
system along paths. Ordinary differential uniqueness gives global
vanishing on the connected base from a single common zero of \((s,h)\).
No bound on \(T\) or its derivative is needed. The calculation reduces to
the usual twistor uniqueness at \(T=0\), checked against Friedrich's
published formula (2.2) and Proposition 1, pp. 61–62.
[Friedrich, 1990, §2, inspected 27 November 2026 (New York)](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=4)

## Kernel map and strict recognition test

No nonzero constant parameter can give the identically zero spinor. If
it did, the kernel line would be the same at every point and evaluation
on a fixed complementary line would give a nowhere-zero section of the
quaternionic spin line, contrary to \(c_2(S^+)[M]=-1\). Thus if \(R_g=0\),
the fixed member corresponding to a unit \(k\in K_x\) satisfies
\(h_k(x)\ne0\) wherever \(s_k(x)=0\). Differentiate the identity
\(E_y k(y)=0\) for a local unit lift of the kernel map \(f(y)=K_y\).
Its derivative at \(x\) gives
\[
 E_x\operatorname{pr}_{K_x^\perp}d_Xk=-\nabla_X s_k=-c(X)h_k.
\]
In this display the derivative on the right holds the parameter at its
value \(k(x)\). The graph chart identifies \(T_K\mathbb H\mathbb P^1\)
with \(\operatorname{Hom}_{\mathbb H}(K,K^\perp)\), where the tangent
norm of a map is its value's norm at a unit \(k\). In the chart
\([q:1]\) with lift \((q,1)/\sqrt{1+|q|^2}\), the squared norm of the
horizontal derivative in direction \(v\) is
\(|v|^2/(1+|q|^2)-|\bar qv|^2/(1+|q|^2)^2
=|v|^2/(1+|q|^2)^2\). This is the round metric of radius \(1/2\).
Since \(E_x|_{K_x^\perp}\) scales lengths by \(m\), the Clifford norm
identity gives a positive similarity factor \(|h_k|/m\) for \(df\), with
no branch points. Compactness gives a proper local diffeomorphism onto
the connected target, and its simple connectivity makes the covering
one-sheeted. Hence the given metric is conformally round.

For any generating pencil, even with positive residue, the same first
derivative identity has \(-\nabla_Xs_k=-(P_X s_k)-c(X)h_k\) at incidence.
The smallest singular value of \(df\) is at least
\[
 \frac{|D_g s_k|/4-\|X\mapsto P_Xs_k\|_{\mathrm{op}}}{m}.
\]
A strictly positive numerator everywhere suffices for the same covering
argument. In the explicit unit round control \(f=[-x:1]\), the round
domain metric in the spatial chart is \(4\,|dx|^2/(1+|x|^2)^2\).
Thus in the target normalization just checked, \(|h_k|/m=1/2\) and the
twistor term is zero. The same value holds at infinity by smoothness.
Under \(C^1\) perturbations of metric and sections in common spin
identifications, the incidence matrix and projector onto \(K\) vary
continuously, and \(D_gs_k\) and \(P_gs_k\) depend continuously on the
first derivatives when the parameter is held fixed. Generation and the
strict margin thus persist for sufficiently small perturbations by
compactness. The strict condition gives smooth recognition.

For the converse existence, on a conformally round class use the
pulled-back round generating pair and transport it by the positive
conformal weight and spin isometry. Both fields remain exact twistor
solutions and evaluation stays surjective. An orientation mismatch can
be corrected by a round reflection before taking the spin pullback.
[Conformal transport formula](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L359)

The converse need not hold for an individual pencil with a conformal
kernel map. On the round pair, apply the same smooth bundle automorphism
\(U\) to both sections. Take it unitary and quaternionic-linear, equal to
the identity off a spin chart and equal at one point to left multiplication
by a noncentral unit quaternion \(q\). Such a map is obtained by
exponentiating a bump times a fixed imaginary quaternion in the chart.
This leaves \(K\) unchanged. At the incidence at that point,
\(\nabla_X(Us_k)=U\nabla_Xs_k\) because \(s_k=0\). In the local Clifford
model it is \(qXh_k\). If its twistor projection were zero, one would
have \(qXh_k=Xh'\) for every real tangent quaternion \(X\). Taking \(X=1\)
gives \(h'=qh_k\), and then \(h_k\ne0\) would force \(q\) to commute with
all \(X\), a contradiction. This pencil has positive residue with the
same conformal kernel map. Taking \(q\) sufficiently close to 1 also
leaves the strict-jet test valid by the round margin.
