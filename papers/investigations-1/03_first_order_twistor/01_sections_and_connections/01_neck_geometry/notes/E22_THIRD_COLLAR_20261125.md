# Cotton obstruction for a closed Bach-flat class

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The request specified GPT-6.2 Sol/ultra for execution.
Serving model and effort are unavailable for independent attestation.
Checkout `7db310a2a9219c537b440d7c2fb39e602a32b729`.
[Frozen request](../research-progress/handoffs/E22_THIRD_REQUEST_20261125.md)
· [Joint hypotheses](../../../reviews/SECOND_COLLAR_ASSESSMENT_20261125.md)
· [Return](../research-progress/handoffs/E22_THIRD_RETURN_20261125.md)

Let \(M\) be a smooth closed oriented homotopy four-sphere. Use the smooth
unit-volume Yamabe representative \(g\) of a positive Bach-flat Riemannian
class and the SEC band \(4\pi^2\le E_+(g)\le8\pi^2-\delta\). The tests
below are on one closed class. The separate conformal factor being tested
need not select a Yamabe representative. No sequence or exhaustion enters.

## Pointwise test and conformal covariance

Let \(C_{ijkl}=(W^+)_{ijkl}\) be the all-lowered tensor,
\(D_{jkl}=\nabla^i C_{ijkl}\) its positive divergence, and
\(L(\alpha)_{jkl}=\alpha^i C_{ijkl}\) for a real one-form \(\alpha\).
Use the full three-index norm on \(D\) and the image of \(L\).
Use \(w=|W^+|_{\rm HS}\) on \(\Lambda^+\), so \(|C|_{\rm tens}^2=4w^2\).
Under \(\widehat g=e^{2f}g\), Hodge projection on two-forms is unchanged
and \(\widehat C=e^{2f}C\). The divergence formula is
\(\widehat D=D+L(df)\) as a covariant three-tensor, and \(\widehat L=L\).
[Gursky–McKeown–Tyrrell, (3.3)–(3.4)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/103164BB62A5E9277B869CCA6213BD80/S1474748025101060a.pdf/self-dual-and-even-poincare-einstein-metrics-in-dimension-four.pdf)

Diagonalize \(W^+\) in an orthonormal frame \(\Sigma_a\) of \(\Lambda^+\)
with eigenvalues \(\lambda_a\). Then \(C_{ijkl}=\sum_a\lambda_a
(\Sigma_a)_{ij}(\Sigma_a)_{kl}\). Each \(\Sigma_a\) is a compatible
orthogonal complex structure's two-form divided by \(\sqrt2\).
Consequently \(|\iota_{\alpha^\sharp}\Sigma_a|^2=|\alpha|^2/2\), and the
ordered \(k,l\) sum gives \(2\langle\Sigma_a,\Sigma_b\rangle\). It follows
that \(L^*L=w^2{\rm Id}\), even if \(W^+\) has rank two. On \(U=\{w>0\}\)
define
\[
 \beta=-w^{-2}L^*D,\qquad \mathcal R=D+L(\beta),\qquad
 r^2=|\mathcal R|^2=|D|^2-w^{-2}|L^*D|^2 .
\]
On \(M\setminus U\) set \(\mathcal R=D\). The exact pointwise identity is
\[
 |D+L(df)|_g^2=r^2+w^2|df-\beta|_g^2 \quad\text{on }U .
 \tag{1}
\]
On the zero set the left side is \(r^2\). The coefficients \(\beta\) can
be singular there, although \(w|\beta|\le |D|\) on \(U\).

The transformed adjoint and squared norm have the same factor
\(e^{-4f}\), so \(\widehat\beta=\beta-df\) and
\(\widehat{\mathcal R}=\mathcal R\). With the three-index convention,
\(|\widehat{\mathcal R}|_{\widehat g}=e^{-3f}r\). This gives the
conformal invariant estimate
\[
 \int_M |\widehat D|_{\widehat g}^{4/3}\,dV_{\widehat g}
 \ \ge\ \int_M r^{4/3}\,dV_g .
 \tag{2}
\]
A nonzero residual at any point rules out a smooth half-harmonic
representative. Inequality (2) detects a nonzero residual on an open
subset of \(U\). A residual supported on the Weyl zero set can require
the pointwise test.

## Differential and global compatibility

On \(U\) a solution requires \(df=\beta\) in addition to
\(\mathcal R=0\). Local exactness requires \(d\beta=0\).
If \(d\beta=0\), all periods on each component of \(U\) must vanish to
obtain a primitive there. The constants of those primitives must allow
a smooth \(f\) across \(M\setminus U\). For every piecewise smooth closed
regular curve \(\gamma\subset U\), (1) and weighted Cauchy–Schwarz give
\[
 \int_\gamma |D+L(df)|_g^2\,ds_g
 \ \ge\ \int_\gamma r^2\,ds_g+
       \frac{|\oint_\gamma\beta|^2}{\int_\gamma w^{-2}\,ds_g}.
 \tag{3}
\]
This also detects \(d\beta\ne0\) by a small disk with nonzero flux and
boundary in \(U\).

On the homotopy sphere the exact global criterion is
\(\mathcal R|_U=0\) and existence of a smooth closed extension of
\(\beta\) to \(M\). The forward direction uses \(df\). Conversely, such
an extension is exact since \(H^1(M;\mathbb R)=0\). The resulting smooth
equation extends by continuity to \(\overline U\) and holds on the
interior of \(M\setminus U\) where \(C\) vanishes identically. Simple
connectivity of \(M\) applies to this extended form. Periods on \(U\)
are measured before that extension.

## What Bach-flatness adds

Set \(P=(\operatorname{Ric}-s g/6)/2\). Adopt
\(B_{ij}=2(\nabla^k\nabla^l+P^{kl})C_{ikjl}\).
This is the usual full-Weyl formula
\((\nabla^k\nabla^l+\operatorname{Ric}^{kl}/2)W_{ikjl}\).
Substituting \(D=\mathcal R-L(\beta)\) on \(U\) twice gives
\[
 \tfrac12 B_{ij} =
 C_{ikjl}\big(P^{kl}-\nabla^k\beta^l+\beta^k\beta^l\big)
       -\nabla^k\mathcal R_{jik}-\beta^k\mathcal R_{ikj}.
 \tag{4}
\]
Here \(\nabla^l C_{ikjl}=-D_{jik}\) by pair symmetry, and
\(\nabla^k C_{ajik}=-D_{iaj}\) gives the last two factors involving
\(\beta\) after the substitution. Thus the Bach equation controls a
derivative of the residual coupled to the Schouten tensor and \(\beta\).
[LeBrun, *Einstein Manifolds and Extremal Kähler Metrics*, §3, p. 78](https://www.math.stonybrook.edu/~claude/crelle13.pdf)

Suppose \(\mathcal R=0\) throughout \(U\). The skew part of (4) gives
\(W^+((d\beta)^+)=0\), since \(C_{ikjl}F^{kl}=\tfrac12 C_{ijkl}F^{kl}\)
for skew \(F\) by the first Bianchi identity. In fact
\(\det W^+\ne0\) on a dense subset of \(U\). To see this, suppose \(W^+\)
has rank two on an open subset of \(U\), and choose a local orthogonal
quaternionic frame \(I,J,K=IJ\) with \(J\) the zero eigenline and
eigenvalues \(\lambda,-\lambda\) on \(I,K\). Differentiate
\(W^+(\omega_J)=0\) and contract a derivative against the first Weyl
pair. The term involving \(D=-L(\beta)\) vanishes against \(\omega_J\).
Writing \(\nabla J=a\otimes I+b\otimes K\), the remaining terms give
\(a(IX)=b(KX)\) for all \(X\). Hence \(b=a\circ J\), which implies
\((\nabla_{JX}J)JY=(\nabla_XJ)Y\), the integrability condition. The
Hermitian \(W^+\) formula has a diagonal term proportional to its
Hermitian scalar and off-diagonal terms only between \(\omega_J\) and
its orthogonal complement. Thus \(W^+(\omega_J)=0\) makes all these terms
vanish, contrary to rank two. This argument uses only the chiral
divergence equation. [Gover–Nagy, §4, Theorem 4.1 and the calculation
in Proposition 4.1](https://www.math.auckland.ac.nz/Research/Reports/Series/555.pdf)

By continuity \((d\beta)^+=0\) on \(U\). For the nonzero Bach-flat block,
\(U\) is dense in \(M\) by local conformal analyticity in Bach gauge and
the coordinate and conformal invariance of its zero set. Any smooth
extension \(\bar\beta\) now satisfies \((d\bar\beta)^+=0\) on \(M\).
Stokes gives \(0=\int_M d\bar\beta\wedge d\bar\beta=-\|d\bar\beta\|_2^2\).
In this case smooth extension suffices for closedness, and
\(H^1(M;\mathbb R)=0\) then removes global periods.
[SEC Lemma on continuation of a vanishing block](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L2932)
· [Lassas–Liimatainen, arXiv:1912.08030v2, Theorems 2.2 and 3.7(c)](https://arxiv.org/pdf/1912.08030)

In the harmonic representative \(\widehat D=0\) and
\(B_{ij}=2\widehat C_{ikjl}\widehat P^{kl}\).
On \(S^2_0\simeq\Lambda^+\otimes\Lambda^-\), the map
\(h\mapsto \widehat C_{ikjl}h^{kl}\) acts by \(W^+\) on the first factor.
Indeed, in a diagonal unit-quaternion frame on \(\Lambda^+\) the
products \(I_aJ_b\), with \(J_b\) an opposite-chirality frame, are a
basis for \(S^2_0\). Conjugation by \(I_c\) multiplies \(I_aJ_b\) by
\(+1\) if \(a=c\) and \(-1\) otherwise. The factor \(1/2\) from the
two-form norms and \(\sum_c\lambda_c=0\) yield eigenvalue \(\lambda_a\).
Hence \(\widehat P_0=0\) on the invertible locus and, by density,
everywhere. A smooth half-harmonic representative of a nonzero
Bach-flat block is Einstein. This supplements the harmonic-Weyl gap
of E16. In particular a candidate in \(4\pi^2<E_+\le16\pi^2/3\)
must fail the smooth harmonic-scale test. For an Einstein representative
above that cutoff, the E13 TT test still requires an eigenvalue in
\((s/3,s/2)\) in the stated positive-leading convention.
[NECK-E16](E16_HARMONIC_WEYL_SUBBAND_20261125.md)
· [NECK-E13](E13_CLOSED_EINSTEIN_STABILITY_20261125.md)

## Stability and remaining implication

There are closed positive-Yamabe, Bach-flat, globally stable metrics
without a smooth half-harmonic representative on other smooth types.
Use LeBrun's self-dual positive class on \(N=\#_4\mathbb{CP}^2\) in the
positive-signature orientation, with \(W^-=0\). The signature identity
\(E_+=12\pi^2\tau(N)+E_-\) makes this an unrestricted absolute minimum
on \(N\), with \(E_+=48\pi^2\). If the nonzero \(W^+\) became harmonic
in a smooth scale, the argument above would make that metric Einstein.
An Einstein metric in this positive class has \(s>0\), by testing the
Yamabe quotient on constants. But \(2\chi-3\tau=2(6)-3(4)=0\) and the
Einstein Gauss–Bonnet and signature identities give
\(4\pi^2(2\chi-3\tau)=2E_-+\int s^2/24>0\).
[LeBrun, *Explicit Self-Dual Metrics on \(\mathbb{CP}^2\#\cdots\#\mathbb{CP}^2\)*,
J. Differential Geom. 34 (1991), §5 corollary and positivity calculation](https://www.math.stonybrook.edu/~claude/jdg1991.pdf)

That example disproves the general implication to a smooth harmonic
scale, without identifying which of its compatibility conditions fails.
In the fixed smooth-type subcritical band the missing implication is
that Bach-flatness, possibly supplemented by nonnegative unrestricted
Weyl Hessian, forces \(\mathcal R=0\) on \(U\) **and** smooth extension of
\(\beta\) across \(w=0\). Equation (4) derives compatibility once the
residual vanishes. It supplies no vanishing or extension from stability.
The least exact critical energy in E15 need not have variational
stability under all positive-class perturbations. The resulting
specific implication, or a different approach to closed descent, is
for NECK-B05. [NECK-E15](E15_FIXED_TYPE_CRITICAL_VALUES_20261125.md)
