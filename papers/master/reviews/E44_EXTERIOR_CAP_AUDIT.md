# E44 · Simultaneous exterior capping on the original smooth type

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Independent bounded E44 review. Actual serving model and
reasoning effort were unavailable. Working base
`a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`. The checked SHA-256
prefixes for the master main TeX, `variational_comparison.tex`,
`first_order_splice.tex`, and `marked_cut.tex` were
`5656ed2bf024`, `0c9b1dce4aa6`, `f93717b0b73c`, and
`3f3722b56d34`. The E03, E17, and E09 inputs had prefixes
`8e09d60395f9`, `008b6b25e030`, and `18fac6165ba0`.

## Disposition

The simultaneous exterior cap comparison holds for the supplied
marked family and the strict joined-path energy ceiling. Let
\(g_i\) be smooth Riemannian metrics in positive Yamabe classes on
one closed connected oriented smooth homotopy four-sphere \(M\).
Write \(e_i=E_+(g_i)\) in the Hilbert–Schmidt endomorphism convention.
At each \(i\), let \(D_{ij}\), \(1\le j\le N_i<\infty\), be disjoint
actual smoothly parametrized closed standard disks. Suppose the
disjoint oriented embedded collar charts are
\(A=\{e^{-1}<|x|<e\}\), with \(t=\log|x|\), \(t=0\) the
disk boundary in its given angular marking, and \(t>0\) the
retained side. In those charts
\(\Phi_{ij}^{*}g_i=u_{ij}^2m_{ij}\) with smooth positive \(u_{ij}\)
and smooth \(m_{ij}\). Put

$$
\begin{gathered}
a_{ij}=\|m_{ij}-\delta_{\mathrm{Euc}}\|_\infty,qquad
b_{ij}=\|Dm_{ij}\|_{L^4(dx)},qquad
K_{ij}=\|\mathrm{Rm}_{m_{ij}}\|_{L^2(A,m_{ij})},\\
\epsilon_{ij}=C(a_{ij}K_{ij}+a_{ij}+b_{ij}+b_{ij}^2),\quad
\xi_i=\Big(\sum_j\epsilon_{ij}^2\Big)^{1/2},\quad
c_i=2\sqrt{e_i}\,\xi_i+\xi_i^2.
\end{gathered}
$$

The \(a_{ij}\) are within a fixed small metric-comparison threshold.
It suffices to measure \(K_{ij}\) on a fixed closed subannulus
containing the interpolation support. Let
\(m_i^{\rm disk}=\sum_j E_+(g_i;D_{ij})\) be the sum of the full raw
disk charges, and let \(P_i=M\setminus\bigcup_j\operatorname{int}D_{ij}\).
If \(e_i+c_i<8\pi^2\), there is a smooth metric \(\widehat g_i\)
on the original oriented smooth type satisfying

$$
E_+(\widehat g_i)\le e_i-m_i^{\rm disk}+c_i,qquad
Y([\widehat g_i])\ge \sqrt{48(8\pi^2-e_i-c_i)}>0.
\tag{1}
$$

The Yamabe bound is the one furnished by the joined energy ceiling.
There is no comparison here to the actual value \(Y([g_i])\).
For \(e_i\to I^+(M)\), it follows that
\(m_i^{\rm disk}\le e_i-I^+(M)+c_i\). The comparison contradicts
near-minimality whenever the left side exceeds that right side.
In particular a fixed positive limiting charge and \(\xi_i\to0\)
in a fixed subcritical band suffice. This argument makes one
competitor and uses the minimizing excess once.

## Simultaneous interpolation and energy

Choose a fixed smooth \(0\le\psi\le1\), equal to one on
\(|t|\le1/4\) and zero on \(|t|\ge3/4\). For \(0\le s\le1\) set

$$
n_{ij,s}=\delta_{\mathrm{Euc}}+
  (1-s\psi)(m_{ij}-\delta_{\mathrm{Euc}}).
$$

First push forward \(u_{ij}^2n_{ij,s}\) and keep \(g_i\) outside the
collars. This is a smooth family on the actual closed source,
since it agrees with the incoming metric near all chart ends.
Positivity of the metric tensors follows from convexity. Outside
the middle layer the two transitions can be viewed as the two
separate strips of the same formula. The middle layer itself
also changes along the homotopy and is included in the estimate.
Any profile must control derivatives there and in both transitions
in the given Cartesian annular gauge.

Let \(F(p)\) be the chiral Weyl matrix in the oriented
\(p^{-1/2}\) coordinate frame times \((\det p)^{1/4}\). Its
Euclidean squared norm integrates to chiral energy. The
all-lowered Riemann tensor is constant-coefficient linear in
\(D^2p\) plus terms quadratic in \(Dp\) with smooth coefficients
in \(p\). With \(\theta=1-s\psi\), the principal second derivatives
in \(\mathrm{Rm}_{\rm low}(n)-\theta\mathrm{Rm}_{\rm low}(m)\)
cancel except for the cutoff commutators. Their \(L^2(dx)\) norm
is controlled by \(C(a_{ij}+b_{ij})\), using the fixed
annulus and cutoff. The quadratic terms are bounded by
\(C(a_{ij}+b_{ij}+b_{ij}^2)\). Changing the algebraic chiral
projection and density costs \(Ca_{ij}K_{ij}\). Thus

$$
\|F(n_{ij,s})-\theta F(m_{ij})\|_{L^2(dx)}
\le \epsilon_{ij}
$$

uniformly in \(s\). Constants are independent of the number of
collars and of derivatives of \(u_{ij}\). The error is in the
annular comparison gauge. Incoming charges are still the
physical ones by conformal invariance.
[Owning curvature estimate, `weak:splice`](../manuscript/first_order_splice.tex#L56)

In the Hilbert direct sum of all the disjoint collar domains and
their complement, the leading vector has norm at most
\(\sqrt{e_i}\), since \(0\le\theta\le1\); the error has norm at
most \(\xi_i\). This proves the height bound \(e_i+c_i\) along the
joined path. Restrict the same comparison to \(P_i\) at \(s=1\).
It gives energy at most
\((\sqrt{E_+(g_i;P_i)}+\xi_i)^2\le E_+(g_i;P_i)+c_i\).
Only the outer halves enter this restricted estimate. The more
precise bound can use their own error norms and the actual
splice support energy. The same simple upper bound \(c_i\)
works for the stated comparison.

At \(s=1\) the middle metric in each chart is \(u_{ij}^2\delta_{\mathrm{Euc}}\).
On a smaller open subcollar, multiply by
\((|x|^{-1}/u_{ij})^2\). Extend the logarithm with a smooth cutoff
in the collar and use this as a global conformal change. This
gives an exact \(dt^2+g_{S^3}\) product while preserving energy
on all subsets. All metrics are smooth across collar boundaries.
Let \(e_i'\le e_i+c_i\) be the resulting joined energy.

## Positivity, stretching, and the smooth marking

On the original closed homotopy sphere, the zero first
conformal-Laplacian eigenvalue gives a scalar-flat representative
by the positive first eigenfunction. The Euler and signature
formulas then give \(E_+=8\pi^2+\frac14\|\operatorname{Ric}\|_2^2\).
Continuity of the first eigenvalue keeps the entire joined path
positive under its strict height bound. A positive class on
this type with energy \(e'\) has
\(Y^2=48(8\pi^2-e')+12\|\operatorname{Ric}_0\|_2^2\) in a Yamabe
representative. These identities use the factor four from each
Weyl operator block to its four-index squared norm.
[Zero-Yamabe wall and short-cut argument](../manuscript/variational_comparison.tex#L1) ·
[Chang–Gursky–Yang (2003), (0.4) and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

For each fixed \(i\), stretch a product subcollar on every disk
seam. In its fixed signed coordinate replace \(dt^2\) by
\((1+L\kappa(t))^2dt^2\), where \(\kappa\) is a nonnegative
smooth bump supported within the exact product and has integral
one. Arclength identifies this with adding length \(L\) and
preserves the angular marking. One may take \(\kappa\) symmetric
and positive near the middle so that length is available on
both sides. More directly the exterior can start at the
unchanged outer product face and use the whole stretched
interval. For every finite \(L\) the resulting metric is smooth
on \(M\) and has the same energy \(e_i'\). The common lower bound
\(y_i'=\sqrt{48(8\pi^2-e_i')}\) follows from the wall argument.

Form \(X_i\) from the entire straightened \(P_i\) by appending a
half-infinite unit product at each marked boundary. A compact
test meets only finite length on every end. Take one finite
common \(L\) large enough to realize all these portions
isometrically in the joined source. If a stretch changes the
coordinate metric on the outer part of \(P_i\)'s product
subcollar, its product arclength embeds the unchanged model with
the rest of \(P_i\) fixed, starting at the fixed outer product
face. Thus the support embeds with a margin beyond it, and
extension by zero leaves the quotient unchanged. Every compact
test on \(X_i\) has Yamabe quotient at least \(y_i'\).
This construction needs no ambient compactness or convergence
of parametrizations as \(i\) varies.

For an end with inward length coordinate \(s\ge0\), choose a
positive conformal factor equal to one near the gluing face
and to \(e^{-s}\) near infinity. In the radius \(r=e^{-s}\) the
end metric is then exactly \(dr^2+r^2g_{S^3}\) near \(r=0\).
It fills smoothly by an ordinary marked ball. Smooth functions
cut off near these finitely many new centers converge to the
uncut test in \(H^1\) and \(L^4\), since the squared gradient
cost of the cutoff at each point is \(O(r^2)\). At each fixed
\(i\) this gives density, with no bound in \(i\) for the number
of centers required. The conformal covariance of the Yamabe
quotient on compact tests transfers \(y_i'\) to the compact
filling. All appended ends have zero Weyl energy, before and
after compactification.
[Lee–Parker (1987), §2, (2.7)](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf#page=7) ·
[E09 short-cut audit](E09_SHORT_COLLAR_CHECK.md)

The cap is glued using exactly the angular map of the original
disk marking. The cap collar uses \(s=-t\), and its radial
coordinate matches \(r=e^t\) at the seam. The given disk
parametrization maps the model boundary to the same marked
sphere. Its inward collar can be adjusted to agree with the
actual inner half of the bicollar on a smaller neighborhood,
fixing the boundary. For this adjustment interpolate two
smooth inward transverse vector fields which generate the two
collars. Their convex interpolation is inward at the boundary,
and its flows give a collar isotopy of sufficiently small
width. The isotopy's velocity vanishes on the boundary. Extend
it by a cutoff in the collar and integrate it as a time-dependent
vector field on the disk. The resulting filling diffeomorphism
agrees with the bicollar on a smaller seam neighborhood, so it
glues smoothly to the identity on \(P_i\) and preserves the
orientation. Carry out the adjustment on each disjoint disk.
The compactified exterior is therefore on the supplied smooth
type. No choice of an exceptional capped piece is needed.

## Relation to previous packets

- E09 and the master's short marked cut already give the
  flatten–stretch–compactify positivity mechanism for one
  sphere. The present extension applies that mechanism
  simultaneously, using the square sum of the collar errors and
  the supplied smooth type of the retained exterior. Neither
  separate estimates for capped disk signs nor subthreshold
  recognition of the capped pieces enters this proof.
  [E09](E09_SHORT_COLLAR_CHECK.md) ·
  [Master short cut](../manuscript/variational_comparison.tex#L22)
- E03's selection supplies actual smoothly marked balls and
  charges in its setting. It does not supply the matching
  annular jets. Its conditional flattening assumes control of
  a whole physical disk in a constant-scale chart and retains
  the exterior metric. Here the approximation is required
  only on the two-sided collars in a variable conformal gauge.
  The competitor changes the exterior halves of those
  collars and retains the original metric away from the
  collars there. This is a weaker interior hypothesis with
  a different geometric support, plus one aggregate signed
  comparison for the entire family.
  [E03](../notes/E03_JOINT_SELECTION.md)
- In the controlled fixed smooth normal-ball setting of E17,
  a radial flattening through a collar of the smaller removed
  disk can also be viewed, up to a conformal choice, as a
  boundary-fixed radial flattening of the larger normal ball
  containing the whole collar. It has E17's leading cost
  obstruction at a nonzero Weyl center. On such a normal
  metric, \(a,b,K=O(r^2)\) at physical radius \(r\), while the
  raw charge is \(O(r^4)\). Even the refined upper bound
  using only the collar charge has contributions of order
  \(r^4\), so this estimate gives no forced strict gain
  in that regime.
  [E17, (1) and (3)](../notes/E17_DIFFUSE_REPAIR.md)

All auxiliary stretches and cap cutoffs are taken at fixed
\(i\) and fixed finite family before comparing along the source
sequence. Uniform \(N_i\), physical-volume information, and
jet control beyond the two-sided collars are unnecessary.
Pointwise smallness of the errors over a growing family alone
does not control \(\xi_i\). The outstanding geometric input is
one actual charged family for which the square-summed error,
the joined-path margin, and the strictly positive net gain
hold on the same physical sources. The bibliography passages
above were rechecked on 25 November 2026.
