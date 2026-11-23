# E254 Effective static recognition from intrinsic strain

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B116, configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored E173's audit of the inherited
small-strain estimate and earlier E31's separate static transport
comparison. The combining observation here comes from N4 of the
external review, with its model and effort as reported there. Its
numerical estimate of the simplex minimum is replaced by the exact
proof below. The manuscript input is the frozen source checked
by E254. The review's earlier manuscript provenance is retained.
[External review, N4](../reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md) ·
[B116](../brainstorm/notes/B116_EXTERNAL_REVIEW_RESPONSE_20261123.md).

**Static sufficient conditions.** Let \(M\) be a smooth closed
oriented homotopy four-sphere, equipped with a supplied smooth
positive-plane, round-compatible definite \(SO(3)\) connection.
Use the native reconstructed real Riemannian metric \(g\) and
negative-Killing internal pairing. Set
\[
 \varepsilon_{\mathcal G}
    =\frac{3}{4(2+\sqrt3)(78+8\sqrt3)},\qquad
 \varepsilon_\Psi
    =\frac{4\pi}{5(1+4\sqrt3)}\,\varepsilon_{\mathcal G}.
\]
Either \(\sup_M\mathcal G\le\varepsilon_{\mathcal G}\) or
\(\sup_M\Psi\le\varepsilon_\Psi\) suffices for \(M\) to be
diffeomorphic to the standard smooth \(S^4\).

Here \(Q>0\) is the wedge quotient of trace three, \(q=Q-I\),
and \(S=Q^{1/2}\). With the trace-free projection denoted by
a subscript \(0\),
\[
 T_X=\tfrac12(S^{-1}D_X^A Q S^{-1})_0,\qquad
 \mathcal G=|\nabla^A T|+|T|^2 .
\]
The full \(\nabla^A\) uses the live metric on the base covector
slots and \(A\) on internal indices. The real whole-fiber
quantity is
\[
 \mathcal R_X(f)=P_{f^\perp}T_X f,\qquad
 \Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2 .
\]
Here \(f\) is a unit native internal target direction, the
fiber area is \(4\pi\), and \(D_\Gamma\) uses the chiral
Levi–Civita horizontal derivative and the live base connection.
The norm on internal endomorphisms is Frobenius.
[Assessed small-strain definitions and conditions](../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md) ·
[Whole-fiber comparison (6)](145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md).

## Exact simplex minimum

The assessed E171 separation constant is the minimum of
\(\mathcal P(\lambda)=\sum_{\rm cyc}\lambda_i(\lambda_j-\lambda_k)^2\)
on the compact set
\[
 K_*=
 \{\lambda_i\ge0,\ \sum_i\lambda_i=3,\
     |\lambda-(1,1,1)|\ge1/2,\ \max_i\lambda_i\le5/2\}.
\]
The inequalities are non-strict because \(K_*\) is the
complement of the two relatively open spectral neighborhoods.
Write \(z_i=\lambda_i-1\), \(t=|z|\), and
\(m=\max_i\lambda_i\). Then \(\sum z_i=0\) and \(1\le m\le5/2\).
The two remaining nonnegative eigenvalues sum to \(3-m\),
so their squares sum to at most \((3-m)^2\).
By convexity of \(m^2+(3-m)^2\) on \([1,5/2]\),
\[
 \sum_i\lambda_i^2\le m^2+(3-m)^2
    \le\max\{5,13/2\}=13/2,\qquad
 t^2=\sum_i\lambda_i^2-3\le7/2.
\]
Thus \(1/2\le t\le\sqrt{7/2}\) on all of \(K_*\). The upper
radius is attained at \((5/2,1/2,0)\) and its permutations.

With \(s_2=\sum_{i<j}\lambda_i\lambda_j\) and
\(s_3=\lambda_1\lambda_2\lambda_3\), the cyclic expansion
gives \(\mathcal P=3s_2-9s_3\), using \(\sum\lambda_i=3\).
Since \(\sum_{i<j}z_i z_j=-t^2/2\), we have
\[
 s_2=3-t^2/2,\qquad s_3=1-t^2/2+z_1z_2z_3,\qquad
 \mathcal P=3t^2-9z_1z_2z_3 .
\]
The desired upper bound \(z_1z_2z_3\le t^3/(3\sqrt6)\) is
immediate for a nonpositive product. For a positive product
and sum zero, permute the coordinates to \((a,-b,-c)\) with
\(a,b,c>0\), \(a=b+c\). Then
\[
 bc\le a^2/4,\qquad
 t^2=a^2+b^2+c^2\ge 3a^2/2,\qquad
 abc\le a^3/4\le t^3/(3\sqrt6).
\]
Equality in this positive case holds exactly when \(b=c\).
This proves the normalized product estimate over the whole
trace-zero plane.

It follows that \(\mathcal P\ge\phi(t)=3t^2(1-t/\sqrt6)\).
On \(t>0\), \(\phi'(t)=3t(2-3t/\sqrt6)\) changes from positive
to negative once, at \(2\sqrt6/3\). In particular the minimum
on the compact range of \(t\) occurs at one endpoint.
The first endpoint gives \(\phi(1/2)=(12-\sqrt6)/16<3/4\).
At the other endpoint,
\[
 \phi(\sqrt{7/2})=\frac{21}{2}\big(1-\sqrt{7/12}\big)
                        >\frac{21}{10}>\frac34
\]
because \(7/12<16/25\). The strict comparison and derivative
sign show the lower endpoint is the only minimizing radius.
The value \((12-\sqrt6)/16\) is attained in \(K_*\) by
\[
 z=\frac{1}{2\sqrt6}(2,-1,-1),\qquad
 \lambda=(1,1,1)+z.
\]
Indeed its norm is \(1/2\), its eigenvalues are positive, and
the largest is \(1+1/\sqrt6<5/2\). The product inequality
is saturated. Thus
\[
 \boxed{p_*=\min_{K_*}\mathcal P=(12-\sqrt6)/16}
\]
with equality only at permutations of the displayed spectrum.
[Original definition of \(p_*\)](171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md).

## Exact ordering of the small-strain thresholds

The three entries of the assessed small-strain constant are
\[
 \varepsilon_1=\frac{\sqrt{p_*}}{72\sqrt6},\qquad
 \varepsilon_2=\frac{\sqrt5}{36},\qquad
 \varepsilon_3=\frac{3}{4(2+\sqrt3)(78+8\sqrt3)}.
\]
The bounds \(1<\sqrt6<5/2\) give \(1/2<p_*<1\).
In particular \(\sqrt{p_*}>2/3\) and \(72\sqrt6<180\),
so \(\varepsilon_1>1/270\). The bounds \(p_*<1\) and
\(\sqrt6>1\) give \(\varepsilon_1<1/72\). Also
\(\varepsilon_2>1/18\) because \(\sqrt5>2\).
Finally \(\sqrt3>1\) gives
\(\varepsilon_3<3/(4\cdot3\cdot86)=1/344\).
Thus the exact ordering is
\[
 \varepsilon_3<1/344<1/270<\varepsilon_1<1/72<1/18<\varepsilon_2.
\]
In particular \(\varepsilon_0=\varepsilon_3=\varepsilon_{\mathcal G}\)
in the frozen manuscript's small-strain proposition and E171 (14).
All comparisons use strict rational inequalities and square-root
bounds.
[Assessed threshold](../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md) ·
[Frozen small-strain proposition](../manuscript/chiral_curvature_and_metric_evolution.tex).

## Native curvature and the assessed smooth sphere criterion

The homotopy-sphere assumptions give connectedness, simple
connectivity and \(H^2(M;\mathbb R)=0\). The E171 result is
therefore applicable to the supplied data. If
\(\sup_M\mathcal G\le\varepsilon_{\mathcal G}\), it gives
\(|q|\le72\mathcal G\) pointwise (and \(\operatorname{Ric}_g
\ge3g/4\)). For the same connection take the older reconstruction
with \(K=1/2\). The conversion \(g=2K\widehat g\) makes the
base metrics identical. The change from the old pairing
\(\delta\) to \(2\delta\) preserves Frobenius endomorphism
norms and the trace-free projection. With identical live base
metrics the norms of \(T\) and \(\nabla^A T\) thus agree,
and the \(Q\) quotient and sign are unchanged.
The right side of the assessed chiral curvature estimate is
therefore
\[
 \begin{aligned}
 \mathfrak R_{1/2}
 &=\tfrac12|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2\\
 &\le(78+8\sqrt3)\mathcal G
 \le\frac{3}{4(2+\sqrt3)}<\tfrac12 .
 \end{aligned}
\]
The first inequality uses \(6\le42+8\sqrt3\) in the sum
defining \(\mathcal G\). The last strict inequality follows
already from \(2+\sqrt3>2\).
[Native chiral estimate and E13 calibration](../reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md).

For clarity, the E13 application of Chang–Gursky–Yang at
this scale has the following hypotheses and constants.

- The assessed chiral block bound gives
  \(s\ge6-2\sqrt3>0\) and \(|W^+|_{\rm op,HS}\le1/2\)
  on the smooth compact reconstructed Riemannian metric.
  Its particular conformal class has positive Yamabe constant:
  the dimension-four conformal energy numerator controls
  \(6\|\nabla u\|_2^2+(6-2\sqrt3)\|u\|_2^2\), and the
  compact Sobolev inequality for this metric bounds the
  denominator \(\|u\|_4^2\) by a constant times
  \(\|\nabla u\|_2^2+\|u\|_2^2\). This uses the Sobolev
  inequality of the supplied smooth closed metric, with no
  uniform Sobolev bound as a hypothesis.
- The positive curvature map identifies the adjoint bundle
  \(E\) with \(\Lambda_g^+\). The assessed characteristic
  identity gives
  \(\langle p_1(E),[M]\rangle=3\tau(M)+2\chi(M)=4\),
  with \(\chi=2,\ \tau=0\) for the oriented homotopy sphere.
  In the native orthonormal adjoint labels the trace pairing
  is \(-\delta_{ij}\). Chern–Weil therefore gives
  \(p_1(A)=\frac1{8\pi^2}\sum_i F_i\wedge F_i\) in these
  labels. The native volume is \(dV_g=\sum_iF_i\wedge F_i/3
  =(8\pi^2/3)p_1(A)\), so \(\operatorname{Vol}(M,g)=32\pi^2/3\).
  This is also \(8\pi^2/(3K^2)\) at the old \(K=1/2\).
- With \(E_\pm=\int_M|W^\pm|_{\rm op,HS}^2\,dV_g\) we
  have \(E_+\le(1/2)^2(32\pi^2/3)=8\pi^2/3\).
  The signature formula gives \(E_-=E_+\). The full
  four-index Weyl energy is \(4(E_++E_-)=8E_+\):
  the two antisymmetric index pairs account for a factor
  four relative to the two-form operator Hilbert–Schmidt
  sum. Consequently
  \[
   \int_M|W|_{\rm tensor}^2\,dV_g
          \le64\pi^2/3<32\pi^2=16\pi^2\chi(M).
  \]
  This is the strict bound with the source's tensor norm.

The published [Chang–Gursky–Yang Theorem A](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)
in *Publ. Math. IHÉS* **98** (2003), 105–143, printed p. 107,
equation (0.3) and Remarks 1–2, is used exactly at E13's
assessed scope. Positive Yamabe constant of \([g]\) and this
strict full Weyl bound imply a diffeomorphism to \(S^4\) or
\(\mathbb{RP}^4\). Simple connectivity excludes \(\mathbb{RP}^4\).
This conclusion recognizes the smooth diffeomorphism type.
It supplies no roundness assertion for the given connection
or metric. The source passage was already checked in E13;
no fresh primary inspection was used here.
[E13 derivation](15_STATIC_TRANSPORT_SPHERE_CRITERION_20261122.md) ·
[E13 source and normalization assessment](../reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md).

Finally the assessed pointwise whole-fiber estimate is
\(\Psi\ge(4\pi/5)\mathcal G/(1+4\sqrt3)\). Thus the displayed
\(\varepsilon_\Psi\) is a second sufficient threshold, since
\(\sup_M\Psi\le\varepsilon_\Psi\) implies
\(\sup_M\mathcal G\le\varepsilon_{\mathcal G}\).
These explicit constants concern supplied static data. The
non-effective dynamical round-entry thresholds have their own
flow and compactness hypotheses. No initialization, persistence,
flow existence or convergence claim is part of E254.
[Assessed real-sphere sufficient condition](../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md).

## Verified frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [E254 request](../research-progress/handoffs/SP4-CME-E254_REQUEST_v1.md) | 7db0dc4f8893f1802bbe2b1713af1eb1c020e2f08366b9461e51bf3995cdfef9 |
| [B116](../brainstorm/notes/B116_EXTERNAL_REVIEW_RESPONSE_20261123.md) | 9cb30b05b6b6747986c9659ae0a07fdb81931016a89bbb32a34a267e5d0893a1 |
| [External review](../reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md) | cf05c05f100feaa709e2e7ffd7f288a88939427b71a0c68177b5dcf39358b404 |
| [Frozen manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex) | 88553fd2f9d66740b6b236b0adcdbf3da2cf0a8f2c47085e7e54f232e3fa4808 |
| [E171/E173 assessment](../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md) | f8a1e2e86f0fdcd0d7b29ad915e6a249d6caed13d753befd140920a22cd12a9d |
| [E08–E13 assessment](../reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md) | 3a781d31480ebcc439a39d85ac18199ab71b30ea0c772636da4f882e0870f688 |

Only the designated note and return were written.
