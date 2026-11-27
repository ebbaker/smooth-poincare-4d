# SP4-CUT-TUBE-E45 · A compact negative test on the flat torus end

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable.
[Frozen E45 request](../research-progress/handoffs/E45_REQUEST_R1.md),
checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0.
Inputs are the [B07 scope](../brainstorm/notes/B07_GLOBAL_PRISM.md), the
actual round prism marking in [E28](E28_PRISM_REPLAY.md) and the
[great-circle computation](../notes/E39_PRISM_FILLINGS.md).
Here \(N\) denotes the three-dimensional complement of the projected
marked geodesic in the prism fibre, with a small open solid torus
removed.

The flat cylindrical end of any fixed smooth product-ended core
metric on this \(N\) admits a smooth compactly supported test with
\[
 \int_{N_\infty}(6|du|_h^2+R_hu^2)\,dV_h<0.
\]
Thus a sufficiently long flat collar attached to this fixed core
forces a negative four-dimensional Yamabe test wherever the rest
of the metric is static there in the base direction. If the base
gluing on the static region uses an isometry, the test can be
chosen invariant under it. The needed length depends on the fixed
core and the fixed flat torus metric.

## The actual cover and the topology of the double

Let \(Y=(Q_8\times C_{17})\backslash S^3\) with deck action
\((u,z^m)x=uxz^{-m}\), \(z=e^{2\pi i/17}\). The lifted marked
great circle is
\(C=p_0e^{j\mathbb R}\), where
\(p_0 j p_0^{-1}=n=(i+j+k)/\sqrt3\).
If \(C\) meets its translate by \((u,z^m)\), comparing their defining
relations \(xjx^{-1}=n\) gives
\[
 j\cdot\operatorname{Ad}_{z^m}j
   =n\cdot\operatorname{Ad}_u n .
\]
The left side is \(\cos(4\pi m/17)\), while the right side is
\(1\) for \(u=\pm1\) and \(-1/3\) for the other elements of \(Q_8\).
The latter value cannot occur, since twice the cosine is a sum
of a root of unity and its inverse and any rational algebraic
integer is an integer. The first value forces \(m=0\) modulo
\(17\). The stabilizer is exactly \(\{\pm1\}\) acting by the
antipodal shift, and the remaining translates are disjoint.
Thus the projected circle is embedded and has 68 lifted
components. The great circle and its tubular neighbourhood
used here are in \(Y\), with the order-two stabilizer for
this covering. The order-twelve stabilizer of E39 concerns
the further suspension orbit quotient.

Any two disjoint oriented great circles in \(S^3\) have linking
number of magnitude one. To see this, let \(P_1,P_2\) be their
real two-planes in \(\mathbb R^4\). Projection \(P_2\to P_1^\perp\)
is invertible because \(P_1\cap P_2=0\). The normalized projection
to the unit circle of \(P_1^\perp\) is the meridional circle map
on the complement of \(C_1\), and its restriction to \(C_2\)
has degree \(1\) or \(-1\). Let \(\widetilde N\) be the lifted
link exterior, with 68 small tubular neighbourhoods removed.
Alexander duality gives \(H_1(\widetilde N;\mathbb Z)=\mathbb
Z^{68}\), with the meridians as a basis by linking number.
The preferred longitude of any one component has zero
coefficient on its own meridian and coefficient \(1\) or
\(-1\) on each of the other meridians. Thus the inclusion of
each boundary torus is injective on \(H_1\), hence on \(\pi_1\)
since a torus fundamental group is abelian.

The boundary torus of \(N\) is also \(\pi_1\)-injective. If a
nontrivial element of its fundamental group were killed in
\(N\), some nonzero power would be in the finite-index subgroup
of a lifted boundary torus. Its null homotopy would lift,
contradicting injectivity upstairs. The double \(DN\) retracts
onto one half by folding, so the embedded seam is still
\(\pi_1\)-injective. The no-positive-scalar-curvature input is
Gromov–Lawson's Definition 8.3 and Theorem 8.4, which apply to a
properly embedded surface with infinite and injective fundamental
group. On the closed orientable double any strictly positive
scalar curvature is uniformly positive. Schoen–Yau's
Theorem 3 on a compact orientable three-manifold containing a
positive-genus closed surface subgroup gives the same exclusion.
[Gromov–Lawson, Publ. Math. IHÉS 58 (1983), pp. 164–165](https://www.numdam.org/item/PMIHES_1983__58__83_0.pdf)
· [Schoen–Yau, PNAS 75 (1978), p. 2567](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11113-Shing-Tung_Yau_216.pdf)

The connected double of \(\widetilde N\) is a finite smooth cover
of \(DN\) by doubling the covering map in boundary collars.
Folding this cover onto \(\widetilde N\) gives \(b_1\ge68\).
A compact connected flat three-manifold has \(b_1\le3\):
harmonic one-forms are parallel by the integrated Bochner formula,
and evaluation at one point is injective on parallel one-forms.
A flat metric would lift to the finite cover, which rules out
flatness of \(DN\). The two topological hypotheses in the
question are therefore verified.

## A general fixed-core cylinder argument

Let \((N,h)\) be any such compact connected smooth three-manifold,
with metric \(ds^2+k\) in a boundary collar and \(k\) a fixed
flat torus metric. Append the complete half-cylinder to obtain
\(N_\infty\). Assume its smooth closed double type \(DN\) admits
neither a positive scalar curvature metric nor a flat metric.
Use \(\Delta=\operatorname{div}\nabla\).
For \(L\ge3\), append only \([0,L]\times T^2\) to form \(N_L\)
and double over the far face \(s=L\). The result is smoothly
diffeomorphic to \(DN\) and its metric is smooth because it is a
product near that face. Let \(\lambda_L\) be the first eigenvalue
of \(-8\Delta+R\) there. It lies in a fixed interval
\([\min(0,\min_N R_h),0]\). The lower bound is the Rayleigh
bound. A positive eigenvalue would let the positive ground
state give a smooth metric with positive scalar curvature via
the three-dimensional conformal transform. Positivity and
simplicity of the first eigenfunction make it even under the
doubling reflection. Its restriction \(u_L\) therefore solves
\[
 (-8\Delta_h+R_h)u_L=\lambda_Lu_L,\qquad
 \partial_su_L(L,\cdot)=0 .
\]
Normalize \(u_L(x_*)=1\) at one fixed point in the compact
core. The potential \((R_h-\lambda_L)/8\) is uniformly bounded
and the metric is fixed on the core and every fixed initial
cylinder segment. A finite local Harnack chain from \(x_*\)
there gives bounds above and away from zero on these compact
sets, with constants independent of \(L\) as long as they stay
away from the far face. Interior elliptic estimates on a
slightly larger fixed set give uniform \(C^j\) bounds for each
fixed \(j\). The interface \(s=0\) is smooth in that set.
In particular \(\|u_L(0,\cdot)\|_{H^1(T^2,k)}\) is uniformly
bounded.

Use an orthonormal eigenbasis of \(-\Delta_k\) on the torus, with
eigenvalues \(0=\mu_0<\mu_1\le\cdots\). On the flat cylinder
each coefficient at the far face is
\[
 (u_L)_j(L)
  =\frac{(u_L)_j(0)}
     {\cosh\!\left(L\sqrt{\mu_j-\lambda_L/8}\right)} .
\]
This follows by solving the constant-coefficient equation with
zero normal derivative at \(L\). When \(\mu_0=\lambda_L=0\)
the solution is constant and the same formula is read with
denominator one. Write the trace as \(m_L+w_L\), with \(m_L\)
constant and \(w_L\) of mean zero. The mean is bounded, and
\[
 \|w_L\|_{H^1(T^2,k)}\le
   2e^{-L\sqrt{\mu_1}}\|u_L(0,\cdot)\|_{H^1(T^2,k)} .
\]
Here the torus and its positive spectral gap are fixed, and
the inequality includes every nonconstant mode by
\(\lambda_L\le0\).

Choose a smooth cutoff \(\xi:[0,\infty)\to[0,1]\)
equal to one near zero and zero for \(s\ge1\).
On \(N_\infty\) take \(U_L=u_L\) up to \(s=L\), and on the exterior
continue it by
\[
 m_L\,\xi((s-L)/L)+w_L\,\xi(s-L).
\]
The matching trace makes this a compactly supported \(H^1\)
function. The continued constant part has gradient energy
\(O(1/L)\), and the nonconstant part costs
\(O(\|w_L\|_{H^1}^2)\) on its unit cylinder. Their gradient
cross term vanishes by the zero mean of \(w_L\).
The cylinder scalar curvature is zero. In the three-dimensional
conformal numerator on \(N_L\), the eigenfunction and its
Neumann condition give exactly
\[
 \int_{N_L}(8|du_L|^2+R_hu_L^2)=\lambda_L\|u_L\|_{L^2(N_L)}^2.
\]
Consequently the numerator with gradient coefficient six for
the extended function satisfies
\[
 Q_6[U_L]\le
    \lambda_L\|u_L\|_{L^2(N_L)}^2
     -2\int_{N_L}|du_L|^2
     +O(L^{-1}+e^{-2L\sqrt{\mu_1}}).                         \tag{1}
\]
Every constant in the remainder is uniform in \(L\) with \(h,k\)
fixed. In particular it does not require a uniform bound on
the \(L^2\) norm over the whole long cylinder.

If no negative compact test existed, approximation by compactly
supported smooth functions would give \(Q_6[U_L]\ge0\).
The same inference applies if the prescribed extensions have
nonnegative numerators for any sequence \(L\to\infty\). Because
\(\lambda_L\le0\), (1) forces their gradient norms on \(N_L\)
to tend to zero. Take a converging subsequence of \(\lambda_L\)
and of \(u_L\) in \(C^2\) on the fixed core and initial
cylinder segment. The limit is constant there with value one
by normalization and connectedness. In the flat segment the
limiting eigenfunction equation forces the limiting eigenvalue
to be zero. On the core it therefore gives \(R_h=0\) pointwise.
The smooth compact double across the original product collar
would have a scalar-flat metric.

For general \(DN\) with the stated two exclusions, the last
step can be checked directly. Let \(g\) be this hypothetical
scalar-flat metric and set \(g_\epsilon=g-\epsilon\operatorname{Ric}_g\).
The first variation of scalar curvature at \(\epsilon=0\) is
\(|\operatorname{Ric}_g|^2\), since the contracted Bianchi identity
and \(R_g=0\) make the divergence and trace terms vanish.
Solve the scalar Poisson equation
\[
 8\Delta_g w=|\operatorname{Ric}_g|^2-
                    \overline{|\operatorname{Ric}_g|^2}
\]
on the closed connected double. If the Ricci tensor is nonzero,
the conformal change \((1+\epsilon w)^4 g_\epsilon\) has
strictly positive first derivative of scalar curvature, constant
equal to the positive average on the right. Its scalar curvature
is positive everywhere for sufficiently small positive
\(\epsilon\), contradicting the assumption. If Ricci is zero,
the dimension-three curvature decomposition makes \(g\) flat,
also excluded. For the actual prism double this conclusion is
also immediate from the compact Schoen–Yau rigidity theorem
and the finite-cover Betti calculation.

This proves that the displayed extensions have negative
numerator for all sufficiently large \(L\). Smoothing a chosen
one preserves its strict sign and compact support. Thus the
proof gives a finite procedure: extend the normalized even
first eigenfunction at successive cylinder lengths and test
its coefficient-six form. No numerical choice of minimal
length is asserted.

## Transfer to the static part of the four-dimensional double

An attaching isometry of the fixed core with its product-ended
metric acts on the torus as an isometry and extends along the
cylinder with \(s\) unchanged. It preserves each double used
in the construction, so the positive simple ground state is
invariant under it. For instance an isometry preserves its
\(L^2\) norm on the compact double, fixing the possible scalar
multiple. The extension using its mean and mean-zero part
also respects the symmetry. Approximation at the single
cut interface can be done by smoothing in \(s\) with a radial
cutoff, so the invariant compact test can be kept smooth.
On the actual prism the endpoint isometry preserves the
projected geodesic and its round tubular neighbourhood. A
static metric in a compatible mapping-torus construction is
invariant on its static region, as required here.

If a region of the four-dimensional double carries the metric
\(b^2dt^2+h\) with \(b>0\) constant and contains \(N\) and
the complete support of that compact test before the moving
region begins, lift \(u\) independently of \(t\). It descends
through the base seam by the stated isometry and extends
smoothly by zero outside the static region. The
four-dimensional conformal numerator is a positive base-length
factor times \(Q_6[u]\), since the scalar curvature and
the derivative of this test are spatial on its support.
A reflected copy, if used, only doubles the negative number.
This forces negative Yamabe type for this long fixed-collar
construction regardless of the later metric gluing. The
proof uses a fixed core and a fixed flat torus cross-section.
It does not supply a uniform cutoff length for a family in
which either of them degenerates, or a sign conclusion for
a moving or nonproduct static-region metric.
