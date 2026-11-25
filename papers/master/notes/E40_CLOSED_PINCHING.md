# E40 · Signed Weyl pinching for a closed positive Einstein survivor

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E40 calculation and source comparison. Actual serving
model and reasoning effort were unavailable. The frozen scientific input is
commit `2689540e6dae1656b7f5ad4be52504db044995f2`. Its main master TeX
has SHA-256 prefix `6c47f8fe412e`, E05 `c80e502aca58`, E20
`0d637f3ddede`, and the owning `closed_and_conformal_alternatives.tex`
`4e7e947122b4`. The fixed-type continuation is a setup input at
`a1a8b88`, SHA-256 prefix `2ae48578e45d`. The calculation concerns
smooth, closed, positive Einstein representatives on the attained type.
[E05](E05_CLOSED_STABILITY.md) · [E20](E20_CLOSED_VARIATION.md) ·
[Fixed-type continuation](../01_fixed_type_variational_descent/continuation-notes/CONTINUATION.md)

## Quantitative restriction

Let \(M\) be a connected, closed, oriented smooth homotopy four-sphere
with a smooth Riemannian Einstein metric \(g\) of scalar curvature
\(R>0\). Write \(V=\operatorname{Vol}(g)\) and \(Y=Y([g])=R\sqrt V\).
Use Weyl endomorphisms on \(\Lambda^\pm\) with Hilbert–Schmidt norm.
Signature and Chern–Gauss–Bonnet give

$$
e=\int_M |W^+|^2\,dV=\int_M |W^-|^2\,dV,
\qquad Y^2=48(8\pi^2-e).
\tag{1}
$$

If one block vanishes identically, both vanish by signature and the
Einstein metric has constant positive sectional curvature. Simple
connectivity gives a global round isometry up to scale. Otherwise,
for each block write \(x\le y\le z\) for its eigenvalues, \(w=|W^\pm|\),
and

$$
\phi=\frac{36\det W^\pm}{w^2},\qquad
\mathcal D_\pm=\int_M\left(24w^2-(\phi_+)^2\right)dV,qquad
D_\pm=\int_M(x-y)^2\,dV.
\tag{2}
$$

Here \(\phi=0\) on \(w=0\), and \(\phi_+=\max(\phi,0)\).
The exact determinant deficit and its simpler spectral bound yield

$$
e>\frac{16\pi^2}{3}+\frac{1}{72}\max(\mathcal D_+,\mathcal D_-)
\ \ge\ \frac{16\pi^2}{3}+\frac{2}{9}\max(D_+,D_-).
\tag{3}
$$

The coefficient \(2/9\) strengthens E05's \(1/6\) for the same
\(D_\pm\). For example, (3) excludes the part of the band with
\(e\le 6\pi^2\) and \(\max D_\pm/e\ge 1/2\). E05's spectral correction
at the same upper energy requires \(\max D_\pm/e\ge 2/3\). The exact
deficit also gives

$$
e>\frac{16\pi^2}{3}+
\frac13\max_{\pm}\int_{\{\det W^\pm\le 0\}}|W^\pm|^2\,dV.
\tag{4}
$$

Thus a nonpositive determinant region carrying at least a third of
either chiral energy rules out \(e\le 6\pi^2\). The estimates apply
independently of minimizing stability. Equations (2)–(4) are homogeneous
under conformal change in four dimensions, and harmonicity is tested
in the supplied Einstein gauge.

## Signed Yamabe test and equality

For either nonzero block \(W_0\), the Einstein equation gives
\(\delta W_0=0\). With \(\Delta=\nabla^i\nabla_i\), the half-harmonic
Weitzenböck identity and refined Kato inequality read

$$
\tfrac12\Delta w^2=|\nabla W_0|^2+\tfrac12Rw^2-18\det W_0,
\qquad |\nabla W_0|^2\ge\tfrac53|\nabla w|^2\quad(w>0).
$$

[Gursky–McKeown–Tyrrell, published §3, (3.3), (3.7), (3.9)](https://doi.org/10.1017/S1474748025101060) ·
[Owning half-harmonic test](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex#L878)

Keep the signed cubic in this identity. For \(a=w^2+\varepsilon^2\)
and \(f_\varepsilon=a^{1/6}\), the chain rule gives
\(6\Delta f_\varepsilon=a^{-5/6}(\Delta w^2-
\tfrac56a^{-1}|\nabla w^2|^2)\). Kato bounds the subtracted
term by \(2|\nabla W_0|^2\), also at zeros since there
\(\nabla(w^2)=0\). It follows that

$$
(-6\Delta+R)f_\varepsilon
\le \left(\frac{36\det W_0}{a}+\frac{R\varepsilon^2}{a}\right)f_\varepsilon .
$$

Multiply by \(f_\varepsilon\) and integrate. The two potentials
are bounded uniformly on the compact manifold, using
\(|\det W_0|\le w^3/(3\sqrt6)\). Thus \(f_\varepsilon\) is bounded in
\(H^1\). The signed term converges by dominated convergence and the
integrated \(R\varepsilon^2/a\) contribution is at most
\(R V\varepsilon^{2/3}\). Passing to the weak \(H^1\) and uniform limit
\(f=w^{1/3}\) gives

$$
Y\|f\|_4^2
\le \int_M (6|\nabla f|^2+Rf^2)dV
\le \int_M \phi f^2dV
\le \|\phi_+\|_2\|f\|_4^2 .
\tag{5}
$$

Equality at the ends makes \(f\) a nonzero nonnegative Yamabe minimizer.
The Yamabe Euler equation and regularity give a smooth positive conformal
factor. Obata's theorem on the nonround positive Einstein metric makes
it constant. Equality in Hölder and in discarding the negative potential
then gives \(\phi=R\) everywhere. The Weitzenböck identity at constant
\(w\) makes \(W_0\) parallel. A nonzero trace-free symmetric endomorphism
in rank three has a simple eigenvalue. Its parallel eigenline gives a
parallel nonzero two-form on the simply connected cover. On a homotopy
sphere this contradicts \(b_2=0\), proving strictness in (5).
[Akutagawa–Endo–Seshadri, arXiv:1801.10305v2, §2 and (1), for the Einstein Yamabe normalization](https://arxiv.org/html/1801.10305v2)

For the spectral coefficient in (3), set \(t=(x-y)^2/z^2\)
where the block is nonzero. Trace zero and the ordering give \(0\le t\le9\)
and

$$
w^2=\tfrac{3+t}{2}z^2,\qquad
\phi_+=18z\frac{(1-t)_+}{3+t}.
$$

For \(0\le t\le1\) we have \(\phi_+\le 6z(1-t)\), so
\(24w^2-\phi_+^2\ge z^2(84t-36t^2)\ge48z^2t\).
For \(1\le t\le9\) the deficit is \(12(3+t)z^2\ge16tz^2\).
This proves \(\mathcal D_\pm\ge16D_\pm\); the pointwise constant
is attained at spectrum \((-2z,z,z)\), where \(\phi_+=0\).
At any nonzero block, \(\phi_+\le6z\), so the exact defect retains
all of E05's pointwise control. Equations (1) and (5) give (3).
The determinant-nonpositive set contributes its full \(24w^2\)
to the defect, which proves (4). Branca, Catino, Dameno and
Mastrolia's Theorem 1.1 retains the absolute value of the cubic
quotient for the full tensor. Their Remark 1.3 records the older sharp
single-block norm bound. The signed single-block defect calculation
here uses the same modified Yamabe method. No novelty claim is made.
[Published source, Theorem 1.1 and Remark 1.3](https://doi.org/10.1007/s10455-025-09996-x)

There is a global classification of the equality geometry in signature
zero. On a smooth connected closed oriented positive Einstein
four-manifold with \(\tau=0\) and \(e>0\), equality in (5) for one
block gives a parallel nonzero block as above. If it had three distinct
eigenvalues, all three eigenlines would be parallel and trivial on the
simply connected cover, making the induced connection on its
\(\Lambda^\pm\) flat. That is incompatible with the nonzero trace
\(R/4\) of its Einstein curvature block \(W_0+(R/12)\mathrm{Id}\).
Thus \(W_0\) has two distinct eigenvalues. Positive determinant and
\(\phi=R\) give the spectrum \((-R/12,-R/12,R/6)\).
Consequently \(Y^2=24e\). Signature gives the same chiral total for
the opposite block, so (5) and \(\phi_+^2\le24w^2\) force equality
for that block too. The same classification applies if one starts
with equality \(Y^2=24e\), or equality \(Y^2=24e-16D_\pm\) in the
refined bound. In the last case (5) and the intervening pointwise
deficit inequality must both be equalities.

On the universal cover the parallel simple eigenlines of opposite
chirality give parallel two-forms of norm \(\sqrt2\), hence commuting
orthogonal complex structures of opposite orientation. Their product
is a symmetric parallel involution with two rank-two eigenspaces.
The de Rham splitting and the positive Einstein equation give the
product of equal round two-spheres, each of Gauss curvature \(k=R/4\).
Conversely the product has \(V=16\pi^2/k^2\), \(W^\pm\) eigenvalues
\((-k/3,-k/3,2k/3)\), and \(E_\pm=32\pi^2/3=R^2V/24\).
The equality descends under free orientation-preserving isometric
quotients, since both energies and \(R^2V\) divide by the degree.
Thus the equality metric is globally homothetic to the product or
such a quotient. A conformal class containing this equality metric
is the corresponding global product or quotient class. A homotopy
sphere cannot have that cover.

For completeness, the nontrivial oriented isometric quotients have
degree two. Every product isometry either acts factorwise or swaps
the factors. An orientation-preserving swap has the form
\((p,q)\mapsto(Aq,Bp)\) with \(\det(AB)=1\), hence a fixed point
from an axis of \(AB\). A nonidentity free factorwise isometry must
act by orientation-reversing maps in both factors, since each
orientation-preserving two-sphere isometry has a fixed point. The
sign on the first factor therefore embeds the deck group in
\(\{\pm1\}\). Its nontrivial involution has an antipodal action in
at least one factor, and the other involution is antipodal or a
reflection. These oriented quotients have \(\chi=2\), \(\tau=0\)
and \(e=16\pi^2/3\), verifying the need for a topological input
beyond the two characteristic numbers at the gap endpoint.
Fu's Theorem 1.5 already gives a product-quotient alternative at
its inclusive full-Weyl threshold for harmonic Weyl curvature.
The global Kähler wording of Fu's Theorem 1.1 should be read with
the possible eigenline cover in mind. The oriented free quotients
just exhibited attain the equality in that theorem but have
\(b_2=0\). Fu's Theorem B* explicitly includes a free isometric
antiholomorphic quotient in its equality statement. The cover
in the derivation above accounts for this issue directly.
[Fu, Theorems 1.1, 1.5 and B*](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf)

## Independent pointwise rigidity tests

In an Einstein four-metric the curvature operator on \(\Lambda^2\)
has diagonal blocks \(R\mathrm{Id}/12+W^\pm\) and zero mixed block.
A unit simple two-form has arbitrary chiral parts of norm
\(1/\sqrt2\). Consequently, writing \(x_\pm\) for the least Weyl
eigenvalues, the minimum sectional curvature at a point is

$$
K_{\min}=\frac R{12}+\frac{x_++x_-}{2}.
\tag{6}
$$

The 4 October 2026 preprint *Zero-Plane Rigidity for Einstein
Four-Manifolds*, Theorem 1.1 and Corollary 1.2, classifies the
universal Riemannian cover under \(\operatorname{Ric}=3g\) and
\(K\ge0\) as round \(S^4\), Fubini–Study \(\mathbb{CP}^2\), or
\(S^2(1/\sqrt3)\times S^2(1/\sqrt3)\). Its zero-plane case
specifies the product. The positive case also follows from the
23 September 2026 companion preprint, Theorem 1.1, or on the
present topology from Cheng's and Gursky–Malchiodi's arXiv
statements, which retain strictly positive sectional curvature.
In the homotopy-sphere application simple connectivity identifies
\(M\) with its cover and \(b_2=0\) leaves only the round metric.
Thus every nonround candidate must have \(x_++x_-<-R/6\) somewhere.
The preprint classification is an imported theorem. Its theorem
statements, normalization, Lemma 2.1 and final splitting were
checked in the TeX reading rendition, and the proof was not
independently audited here. Cheng and Gursky–Malchiodi were checked
at abstract level for this pointwise comparison.
[Zero-plane preprint, source commit `fd4aeeb2ee4f`](https://github.com/openai/math/blob/fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb/preprints/Zero-Plane-Rigidity-for-Einstein-Four-Manifolds-October-4-2026/einstein-boundary.pdf) ·
[Inspected TeX rendition](https://wcook04.github.io/plectis-atlas/papers/Zero-Plane-Rigidity-for-Einstein-Four-Manifolds-October-4-2026.html) ·
[Companion preprint, Theorem 1.1](https://github.com/openai/math/blob/fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb/preprints/Positively-curved-Einstein-four-manifolds-September-23-2026/paper.pdf) ·
[Cheng, arXiv:2609.23337](https://arxiv.org/abs/2609.23337) ·
[Gursky–Malchiodi, arXiv:2609.30803v1](https://arxiv.org/abs/2609.30803v1)

E05's positive Einstein compactness across smooth homotopy-sphere
types gives a uniform strengthening for each fixed band. Given
\(\delta>0\), there exists \(\kappa_\delta>0\) such that any
nonround metric with \(e\le8\pi^2-\delta\) satisfies

$$
\min_{p,\sigma} K_g(p,\sigma)/R\le-\kappa_\delta.
\tag{7}
$$

Indeed a countersequence with the left side tending to zero from
below can be normalized to volume one, with
\(R_i=\sqrt{48(8\pi^2-e_i)}\ge\sqrt{48\delta}\).
By E05 the sequence has a smooth closed subsequential limit on a
homotopy sphere. The sectional ratio is continuous through this
convergence, and the limit is nonround since \(e_i\ge16\pi^2/3\).
This contradicts the nonnegative sectional classification.
The assertion is vacuous if the fixed band has no nonround metrics,
and the proof supplies no effective \(\kappa_\delta\).
[E05 smooth compactness argument](E05_CLOSED_STABILITY.md#uniform-gap-in-the-homotopy-sphere-class)

Another independently applicable preprint gives a restriction on
each chiral spectral shape. Catino–Dameno, *Conformal Kähler
rigidity of Einstein four-manifolds*, arXiv:2607.21538,
Theorem 1.4 and Corollary 1.5, consider a compact oriented
Einstein four-manifold with a nonzero block. Uniform separation
\(y\le\rho_0z\) for some \(\rho_0<1\) on the nonzero locus gives
global conformal Kähler geometry with positive scalar curvature,
after at most a twofold cover. Their §4 treats the zero set.
For the homotopy sphere no nontrivial connected cover is needed,
and the Kähler form would have nonzero cohomology class by its
positive square integral. Apply the theorem with each orientation.
Every nonround candidate satisfies

$$
\sup_{\{W^\pm\ne0\}} y_\pm/z_\pm=1
\quad\text{and}\quad
\inf_{\{W^\pm\ne0\}}
\frac{\det W^\pm}{|W^\pm|^3}=-\frac1{3\sqrt6}
\tag{8}
$$

in each chirality. The equivalence follows by substituting
\(x=-z-y\) into the normalized determinant, which is strictly
decreasing in \(y/z\in[-1/2,1]\) and reaches its minimum at 1.
Where a block vanishes, a sequence approaching this ratio can
have arbitrarily small energy density. Thus (8) supplies
no explicit integrated lower bound on either defect in (2).
[Primary author preprint, Theorems 1.2 and 1.4, Corollaries 1.5–1.6, §4](https://cvgmt.sns.it/document/11018/) ·
[arXiv record](https://arxiv.org/abs/2607.21538)

## Comparison with the existing energy thresholds

- Chang–Gursky–Yang, *A conformally invariant sphere theorem in four
  dimensions*, IHÉS **98** (2003), pp. 107–109, Theorems A–C and Remarks 1–2,
  gives smooth recognition below the full four-index bound
  \(16\pi^2\chi=32\pi^2\). At zero signature the full energy is
  \(8e\), so this is \(e<4\pi^2\). Their equality cases do not add
  a positive Einstein homotopy sphere at the threshold.
  [Journal text](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf)
- Gursky–LeBrun's chiral norm gap, Gursky's sphere gap as quoted
  in Akutagawa–Endo–Seshadri Theorem 1.1, and Fu's Proposition E
  recover the coefficient \(Y^2/24\) in the operator norm convention.
  Their unrefined chiral test and (1) give the E05 endpoint
  \(16\pi^2/3\). Akutagawa–Endo–Seshadri Theorem 1.2 and
  Proposition 1.4 work on the standard smooth \(S^4\) and improve
  its gap non-effectively. E05 obtains the gap over all homotopy
  four-spheres in the subcritical band using its own marked
  compactness input. The present calculation improves the
  explicit shape-dependent term.
  Gursky's journal page was checked for metadata, with the theorem
  statement checked through Akutagawa–Endo–Seshadri and Fu.
  The journal abstract of the 1999 Gursky–LeBrun paper gives a
  separate sectional rigidity theorem with a positive intersection
  form. That theorem is not used on the homotopy sphere.
  [Akutagawa–Endo–Seshadri v2, §§1–4](https://arxiv.org/html/1801.10305v2) ·
  [Fu, Proposition E and Theorem 1.1, published full four-index norm](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf) ·
  [Gursky 2000](https://doi.org/10.1007/s002080000130) ·
  [Gursky–LeBrun 1999](https://doi.org/10.1023/A:1006597912184)
- The Gursky–Malchiodi mass gap in *Mass and volume of
  four-dimensional Einstein metrics*, arXiv:2512.07257v1,
  Theorem 1.2, gives a different quantitative test. Normalize
  \(\operatorname{Ric}=3g\) and let \(m_p\) be their ADM mass of
  the one-pole conformal blow-up using the Green coefficient
  \(r^{-2}\). Then (1) gives \(V=(8\pi^2-e)/3\), and their
  mass-times-volume formula (1.8) gives

  $$
  m_p\ge\frac{e(e+2\pi^2)}{2\pi^2(8\pi^2-e)}>\frac{22}{3}
  \qquad(e>0)
  $$

  at every pole, using \(e>16\pi^2/3\). This application uses the
  general theorem on a smooth closed positive Einstein manifold
  and does not require the standard smooth sphere premise of their
  Corollary 1.6. An upper mass bound that conflicts with this lower
  bound would exclude a survivor. The subcritical Weyl budget
  supplies no such upper bound in the passages checked.
  [Primary v1, (1.5)–(1.8), Theorem 1.2 and Corollary 1.6](https://arxiv.org/html/2512.07257v1)

Primary passages were inspected on 25 November 2026. The cubic
calculation, equality analysis and normalized conversions in this
note were checked independently of the preprint curvature
classification. There is no new energy-only endpoint beyond the
non-effective E05 gap. The remaining Einstein case has negative
sectional curvature somewhere and satisfies (3), (7) and (8).
A lower bound on either defect large enough to exclude the residual
band, a theorem forcing the sectional premise, or a same-type
descending variation would be needed to continue this route.
A closed Bach-flat class without an Einstein representative remains
outside these rigidity tests.
