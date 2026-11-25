# What the companion manuscripts provide on a supplied collar

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning
effort are unavailable. This is a brainstorm for SEC-B36. It combines
the cited results with model calculations under explicit collar
hypotheses. The construction of the collar in an almost Bach-flat
sequence remains the main geometric prerequisite.

| Input | Source version |
| --- | --- |
| [Chiral curvature and metric evolution](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex), abbreviated CME below | Commit `541786549bf62dc70b55c9e9fd8072519755e413`, SHA-256 `8f7c71f36835f62acdd587960d8b61108908dd3fc1b50ab8b74a2549752796f6`. |
| [Twistor spinors, Dirac concentration, and Yamabe spectral rigidity](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex), abbreviated DIR below | Commit `0a0abde6f5481fc564d8ca159769cb092e1996d2`, SHA-256 `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`. |
| [Twistor sections and chiral Weyl curvature](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex), abbreviated SEC below | 25 November working source including the no-neck application, SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. |

## Specify the geometry of the cut

Let \(M\) be a smooth closed oriented Riemannian homotopy
four-sphere. Consider an actual oriented embedding of a product
collar \((-L-2,L+2)\times S^3\) in \(M\), with central slice \(t=0\).
After a change of scale and a positive conformal change on the collar,
write its metric as \(h\). Compare it with
\[
 h_0=dt^2+\gamma,\qquad \gamma=g_{S^3(1)} .
\]
Here the three-sphere has sectional curvature one. The estimates below
use \(C^2(h_0)\) closeness \(\eta_2\) on the full collar and, for
direct Bach control, \(C^4(h_0)\) closeness \(\eta_4\) in the fixed
central strip. Both norms refer to the rescaled product coordinates.
The outer parts of length \(L\) provide room for comparisons with
each retained side. A conformal factor specified on the collar can
be extended positively outside a slightly smaller closed collar,
so the retained metric can be treated as an actual representative
of the original conformal class.

The orientation and \(S^3\) link specify the smooth operation. The
slice separates \(M\). Cutting on it and filling the two boundaries
with four-balls gives smooth homotopy four-spheres by van Kampen
and Mayer–Vietoris. The spin structure on the slice is unique and
extends across a ball. Keep the gluing identifications, so that
\(M\) is recovered by connected sum of the capped pieces. The
component statement for \(\mathrm{Diff}(S^3)\) permits the usual
orientation-compatible identification of the round ball boundaries.
A quotient link would require its own filling and smooth accounting.
[SEC §12.4](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Surgery comparison and source references](CHIRAL_DIRAC_AND_SURGERY_APPROACHES_20261125.md)

## Make the metric cap and control its costs

Choose a fixed rotationally symmetric metric on a four-ball,
\[
 h_{\mathrm{cap}}=ds^2+a(s)^2\gamma ,
\]
round near its center and with \(a=1\) near the boundary. For
example, choose \(a'\) smooth and nonincreasing from one to zero,
with a sine profile for \(a\) near the center, and rescale the
eventual constant radius to one. The function can be chosen
with \(a'<1\) for \(s>0\) before the constant part. The scalar
curvature is positive by
\[
 s_{h_{\mathrm{cap}}}
   =6\left(\frac{1-(a')^2}{a^2}-\frac{a''}{a}\right).
\]
In the coordinate \(du=ds/a(s)\) the metric is
\(a(s)^2(du^2+\gamma)\), which is conformally flat. The extension
at the center is smooth by the round germ. The exact cap and its
product extension therefore have \(W=B=0\).

On each retained side choose a fixed cutoff across a strip of
product width one, separated from the outer region used for
comparison. Interpolate by \(h_\theta=h_0+\theta(h-h_0)\), with
\(\theta=0\) near the attached cap and \(\theta=1\) on the retained side
of the transition. This is a positive metric by convexity. In the
transition strip its difference from \(h_0\) has \(C^k\) norm
bounded by a constant times the corresponding collar error.
The Weyl tensor is a smooth expression in the metric jets
through order two, and the Bach tensor through order four.
Since both vanish on \(h_0\) and the transition volume is
uniformly bounded in product scale, the total transition costs
have the bounds
\[
 \int_{\mathrm{transition}} |W|_{\mathrm{tens}}^2\,dV
       \le C\eta_2^2,\qquad
 \int_{\mathrm{transition}} |B|\,dV\le C\eta_4 .
\]
These are also the costs in physical scale because the integrals
are conformally invariant in dimension four. The exact cap
contributes zero to both. Thus if \(\widehat g_1,\widehat g_2\) are
the capped metrics, with the inherited orientation on each side,
\[
 \sum_{j=1}^2 E_+(\widehat g_j)\le E_+(g)+C\eta_2^2,\qquad
 \sum_{j=1}^2\mathfrak B(\widehat g_j)
       \le\mathfrak B(g)+C\eta_4 .
\]
The disjoint unchanged regions contribute at most the incoming
integrals. The estimate controls the cost of one replacement.
A strict decrease would require separate information about the
discarded region or subsequent evolution. SEC §13.2 gives a
related splice at a fixed smooth point, where matching first
jets gives physical-radius decay. SEC §§6.3–6.5 provides tests
for the additional restrictions that arise if a chiral curvature
target is prescribed while boundary data are retained.
[SEC §§6.3–6.5, 13.2 and 14.1](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

### Preserve the Yamabe sign with a product buffer

The positive scalar curvature of the model cap controls the
transition locally. Positivity of the class of the whole capped
piece can be checked using the Yamabe quadratic form and a
buffer contained in the supplied product geometry. This gives
one sufficient condition that allows arbitrary scalar curvature
on the retained core in the chosen representative.

Write \(Y_{\rm src}\) for the positive class Yamabe constant of
the incoming manifold, and fix one capped metric \(\widehat g_j\).
Let
\[
 \mathcal Q_h(u)=\int(6|du|_h^2+s_hu^2)\,dV_h.
\]
On the retained buffer of product length \(L\), take smooth real
\(\chi,\xi\) with \(\chi^2+\xi^2=1\), \(\chi=1\) toward the core
and \(\xi=1\) toward the cap. The buffer lies outside the splice
so that \(\chi u\) can be extended by zero as a test function
on the source in the chosen conformal representative. The
function \(\xi u\) is supported in the cap, transition and
product buffer. Extend the reference cap by a semi-infinite
product cylinder. This is conformal to Euclidean \(\mathbb R^4\)
by the radial coordinate \(\exp(\int ds/a(s))\). The
compact-support Yamabe constant of that model is the round
value \(Y_{\rm rd}=8\sqrt6\,\pi\).

The metric on the support of \(\xi u\) is \(C^2\)-close to that
reference cap and cylinder with error \(O(\eta_2)\). The
reference scalar curvature has a uniform positive lower bound,
so the gradient and scalar terms in the two quadratic forms
compare from below by \(1-C\eta_2\). Comparing the \(L^4\)
norms at the same time gives a lower constant
\((1-C\eta_2)Y_{\rm rd}\) for these cap-supported tests, uniformly
in \(L\). Expanding the two squared gradients gives the exact
localization identity
\[
 \mathcal Q_{\widehat g_j}(u)
 =\mathcal Q_{\widehat g_j}(\chi u)+
   \mathcal Q_{\widehat g_j}(\xi u)
   -6\int (|d\chi|^2+|d\xi|^2)u^2\,dV_{\widehat g_j}.
\]
Use a fixed cutoff angle stretched over the buffer, so that
\(|d\chi|+|d\xi|\le C/L\). The buffer has volume at most
\(CL\), and the \(L^2\) norm of the coefficient in the error
integral is \(O(L^{-3/2})\). Hölder bounds the integral by
\(CL^{-3/2}\|u\|_4^2\). Finally,
\(\|\chi u\|_4^2+\|\xi u\|_4^2\ge\|u\|_4^2\) by the triangle
inequality in \(L^2\) applied to the squares. This gives
\[
 Y([\widehat g_j])\ \ge\
 \min\{Y_{\rm src},(1-C\eta_2)Y_{\rm rd}\}-CL^{-3/2}.
\]
In the fixed band \(Y_{\rm src}\ge\sqrt{48\delta}\), one can
choose the required finite buffer length from the margin
before selecting the cut. The same argument applies on the
other side. A second sufficient condition would be a supplied
representative of positive scalar curvature on the entire
retained region with a positive scalar transition.
[DIR §5, conformal scalar operator and form](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) · [SEC §§8.3, 11.1 and 11.3, Yamabe and Euclidean sharp quotient](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Lee–Parker, §§2–3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

The bound preserves positivity under these model hypotheses.
DIR §10.1 is a useful check on what can be expected of the
Yamabe value. In its exact construction the inversion and
reflection that attach a round region to a flat ball extend
as a conformal diffeomorphism of the original compact class.
The Yamabe minimizers and their eigenvalues are identical under
that map. The small-ball proposition in the same section gives
a one-sided obstruction to raising \(Y\) by modifying only
a shrinking ball of a fixed core. These tests delimit the
changes one can expect from the gluing itself.
[DIR §10.1, the flat-neck and small-ball propositions](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex)

## What chiral evolution supplies on this geometry

### The exact cylinder lies on the boundary of definiteness

In an oriented orthonormal coframe \(e^0=dt,e^1,e^2,e^3\), put
\(\omega_i=\tfrac12\sum_{j,k=1}^3\epsilon_{ijk}e^j\wedge e^k\)
and \(\Sigma_i^\pm=e^0\wedge e^i\pm\omega_i\), with the form
norms of CME §4.1. Then
\(\Sigma_i^\pm\wedge\Sigma_j^\pm=\pm2\delta_{ij}dV\).
The curvature operator of \(dt^2+\gamma\) annihilates
\(e^0\wedge e^i\) and acts as the identity on \(\omega_i\).
In the paired chiral bases its diagonal blocks are
\(C=I/2\) and its off-diagonal block is \(D=-I/2\), where \(D\)
denotes the Ricci block called \(B\) in CME §5. In particular
\(s=6\), \(W^\pm=0\) and \(\operatorname{Ric}_0\ne0\).
The chiral Levi–Civita curvature in the convention of CME §5 is
\[
 F_i=-\tfrac12(\Sigma_i^+-\Sigma_i^-)=-\omega_i.
\]
Thus the \(F_i\) span the three tangential two-forms. The
wedge of two such forms vanishes in the three spatial dimensions,
so \(F_i\wedge F_j=0\) for every \(i,j\).
The same cancellation is
\(C^2-DD^\top=0\) in the wedge Gram matrix of CME §5.

The construction in CME §§4.1–4.2 declares the span of the
\(F_i\) to be the self-dual three-plane of the reconstructed metric.
For a nonzero self-dual two-form in Riemannian signature,
\(\alpha\wedge\alpha=|\alpha|^2dV>0\). Every element of the
cylinder's curvature span has wedge square zero, so that
span is a totally isotropic three-plane. The definite
construction also uses
\[
 \mu_A=\tfrac13\sum_i F_i\wedge F_i,\qquad
 dV_{\widehat g_A}=\mu_A/(2K^2),\qquad
 F_i\wedge F_j=Q_{ij}\mu_A ,
\]
where \(K>0\) is the round reference curvature. On the cylinder
\(\mu_A=0\), and the wedge matrix cannot be normalized to
\(Q\). The product metric and its ordinary connection are
smooth. The degeneracy concerns recovering a Riemannian
metric **from that connection's curvature**.
[CME §§4.1–4.2 and §5, curvature graph](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex) · [Fine, arXiv:1111.5005v2, Definitions 1.3–1.4](https://arxiv.org/pdf/1111.5005)

The calculation applies to the rotationally symmetric cap
as well. Its sectional curvatures on mixed and tangent
planes are \(k_r=-a''/a\) and \(k_t=(1-(a')^2)/a^2\).
In the same bases \(C=(k_r+k_t)I/2\) and
\(D=(k_r-k_t)I/2\), so
\(C^2-DD^\top=k_r k_t\,I\).
A round cap interior can be definite, and a product part
has \(k_r=0\). A cap chosen to give positive scalar curvature
and a smooth product boundary therefore requires a
separate check before use as definite-connection data.

There is useful flexibility in the conformal representative.
With \(\rho=e^t\) the metric \(\rho^2h_0\) is flat and its
Levi–Civita curvature vanishes. The representative
\[
 g_{\rm rd}=\operatorname{sech}^2(t)\,h_0
\]
is unit round in stereographic coordinates. Its own chiral
Levi–Civita curvature has positive wedge matrix. On a **fixed**
product strip, applying this factor to a sufficiently \(C^2\)-close
metric gives locally definite chiral data by openness.
On \([-L,L]\), the smallest factor is of order \(e^{-2L}\),
so this comparison loses uniform equivalence to the cylinder
as the length grows. Matching the gauge to the rest of the
capped manifold and keeping a positive curvature margin there
are separate problems. The calculation refers throughout to
the Levi–Civita connection of the chosen representative. A
nonconstant conformal change generally changes that connection.

In the radial class one can see a limitation on a uniformly
definite gauge. For \(g_f=e^{2f(t)}h_0\), the change
\(ds=e^fdt\) gives \(a=e^f\), \(a'=f'\) and
\[
 k_r=-e^{-2f}f'',\qquad k_t=e^{-2f}(1-(f')^2).
\]
Suppose both curvatures are positive, \(e^{2f}\ge m>0\),
and \(k_rk_t\ge\kappa>0\). Then \(|f'|<1\),
\(k_t\le m^{-1}\), and \(f''\le-\kappa m^2\). Integrating
the last inequality bounds the product-coordinate length
by \(2/(\kappa m^2)\). Thus a radial conformal factor with
these bounds cannot give a fixed positive wedge margin on
arbitrarily long cylinders. This is a bound for the stated
radial conformal gauges of the Levi–Civita connection.
[CME §§3.2, 4.2 and 5](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

### Compare connections and metrics before invoking a flow

1. **Start from the actual metric where the curvature plane
   degenerates.** On a supplied metric let \(\Sigma\) be its
   normalized self-dual frame, and let \(A\) be an independent
   connection on the correctly identified oriented bundle.
   CME §4.4 inverts the pointwise map
   \(b\mapsto[b,\Sigma]\), where \(b=A-\Gamma^+\).
   In SEC §3.1 the same algebra applies with \(\Sigma\) specified
   independently of \(F_A\). In the manuscript normalization,
   \(d_A\Sigma=[b,\Sigma]\) and
   \(|b|\le |d_A\Sigma|\le2|b|\). The map uses the frame
   and the Riemannian star, so this comparison is available on
   a product collar. It converts errors in metric compatibility
   into errors of the connection. Curvature comparison also
   needs a derivative of \(b\) because
   \(F_{\Gamma^+}=F_A-d_{\Gamma^+}b-\tfrac12[b\wedge b]\).
   [CME §4.4 and SEC §3.1](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex) · [SEC independent fields](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

2. **Fix the overlap identification before interpolating.** If
   two connections are expressed on the same bundle over the
   transition and one equals \(\Gamma^++b\), a cutoff extension
   satisfies
   \[
    F_{\Gamma^++\theta b}
       =F_{\Gamma^+}+\theta\,d_{\Gamma^+}b+
        d\theta\wedge b+\tfrac12\theta^2[b\wedge b].
   \]
   This isolates the curvature cost of the transition. If the
   reference wedge Gram has a uniform positive margin, small
   \(C^1\) connection error in that identification preserves
   definiteness. The margin vanishes for the product
   Levi–Civita connection. CME §16.5 also gives a gauge-dependent
   affine interpolation of two gauge-equivalent round
   connections whose midpoint loses definiteness. This makes
   gauge alignment part of the estimate. Track the bundle
   extensions on the two caps. The positive chiral
   characteristic number is
   \(p_1(\Lambda^+)[M]=2\chi(M)+3\tau(M)=4\) on each closed
   homotopy sphere. The capped characteristic numbers add to
   eight, so curvature-volume conservation on the original
   fixed bundle gives no additive post-cut volume budget.
   [CME §14.1 and §16.5](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

3. **Use the strain estimate once positive data are available.**
   For a round-compatible definite connection set \(q=Q-I\)
   and use the whole direction-sphere comparison to obtain
   the strain \(T\) of CME §4.5. Section 4.6 bounds the
   reconstructed curvature by
   \[
    \left(|W^+|_{\mathrm{HS}}^2+
     \tfrac14|\operatorname{Ric}_0|^2+
     \tfrac1{48}(s-12K)^2\right)^{1/2}
      \le K|q|+6|\nabla^AT|+(42+8\sqrt3)|T|^2.
   \]
   This explains which derivatives of the connection data
   must be controlled on a comparison region. If the bound
   is at most \(K\) **on the whole closed capped piece**, §14.1
   gives \(s\ge(12-4\sqrt3)K>0\),
   \(\operatorname{Vol}=8\pi^2/(3K^2)\) and
   \(E_+\le8\pi^2/3\), which meets the strict recognition
   threshold. A collar bound is useful for checking the
   transition, and the rest of the piece needs the same
   certificate or another global bound.
   [CME §§4.5–4.6 and 14.1](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

4. **Choose the dynamical conclusion that fits the input.**
   CME §6.10 constructs adjusted solutions from small
   continuous compatible connection–curvature pairs near a
   chosen smooth definite reference. Section 6.11 extends a
   supplied original trajectory at a positive continuous
   endpoint on its fixed bundle. After cutting, a trajectory
   on a capped piece would start from new smooth definite
   data on the extended bundle. Section 6.15 has a global
   round-basin entry theorem under small total defect energy
   and supplied intrinsic transport and diameter bounds.
   Section 6.13 gives fixed-base metric compactness from
   pointwise Ricci and \(W^+\) bounds, a volume lower bound
   and a diameter upper bound. Each could be used after
   checking its hypotheses on the capped piece. The
   round transverse traceless Ricci-flow linearization in
   §8.1 and the nonlinear discrepancy in §§9–11 require that
   any surgery-restart estimates be proved for the chosen
   evolution and energy. The intrinsic strain estimate of
   §13.3 is an endpoint model within its supplied round value
   basin. The pointed twistor exclusion of §15.1 pertains to
   a supplied nonflat Ricci-flat ASD ALE limit under strict
   metric twistor taming and pointed \(C^1\) embeddings.
   [CME §§6.10–6.15, 8.1, 9–11, 13.3 and 15.1](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

## What the Dirac manuscript supplies after the cut

### Construct controlled boundary data

On each smooth oriented capped homotopy sphere choose a point
in the conformally flat part of the cap. The cap germ can
be made flat by a smooth conformal change supported near that
point. If the capped class has \(Y>0\), a positive scalar
curvature representative has invertible Dirac operator by the
Schrödinger–Lichnerowicz identity. Conformal covariance
preserves the triviality of its kernel in the flat-germ
representative. Thus in this setting one has the flat germ
and invertibility in DIR §4.1 directly. The proposition also
supplies these inputs via a relative metric deformation on
a general smooth homotopy sphere.

Puncture the capped piece at this point and set \(h=\omega^2g\)
with \(\omega=r^{-2}\) in the flat germ as in DIR §4.1. The positive
Green field \(\Psi\) is harmonic on an exactly Euclidean end
and equals a prescribed constant spinor up to \(O(R^{-3})\)
at Euclidean radius \(R\). Its inverse twistor transport into
the compact metric has a prescribed transverse zero at the
pole and \(P\psi=O(r^3)\) there. This fixes end data and pole
normalization. A uniform inverse in the flat-germ gauge and an
interior lower norm bound for the Green field are stronger
requirements. For comparison, in a unit-volume Yamabe
representative with \(s=Y>0\), Lichnerowicz gives an \(L^2\)
inverse bound \(2/\sqrt Y\) on full spinors, and comparison
with a different representative uses its conformal weights.
[DIR §§2.2, 3 and 4.1, especially the Green-end and pole-jet identities](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex)

The exact product collar gives a separate boundary matching
model. In the product spin identification, the Dirac equation
reduces to \((\partial_t+D_{S^3})\Psi=f\) after multiplication
by the inverse normal Clifford action, with the sign of the
tangential operator fixed by the chosen normal. The spectrum
on the unit round link is \(\pm(k+3/2)\) for \(k\ge0\). Thus
a homogeneous mode of eigenvalue \(\lambda\) is proportional
to \(e^{-\lambda t}\). Positive modes propagate with decay
from the left end and negative modes with decay from the
right end. If the model interval is \([a,b]\) and \(P_+\),
\(P_-\) denote the positive and negative spectral projections
of the **tangential** Dirac operator, this gives
\[
 \|\Psi(t)\|_{L^2(S^3)}
 \le e^{-\frac32(t-a)}\|P_+\Psi(a)\|_{L^2(S^3)}
    +e^{-\frac32(b-t)}\|P_-\Psi(b)\|_{L^2(S^3)}
\]
for \(f=0\). With \(f\ne0\), integration from the appropriate
end gives the same exponential kernel for the forcing. In
particular bounded boundary traces alone permit the unweighted
spinor norm to become very small in the middle of a long
cylinder. Lower norm control must be proved in a specified
normalization. A useful matching test on a perturbed collar
would bound the solution and derivatives from compatible
end data, using these model projections and controlling the
perturbed operator. The actual traces on both caps are
constrained by their interior Dirac problems.
[DIR §§2.2 and 4.1](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) · [Bär, Theorem 1, unit sectional curvature](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf)

### Convert a spinorial comparison into a curvature estimate

Let \(\psi\) be a smooth positive half-spinor, and put \(T=P_g\psi\).
DIR §2.3 projects its covariant exterior derivative off the
Clifford trace. The identity is
\[
 |\Pi(d^\nabla T)^+|^2
       =\tfrac12 |W^+|_{\mathrm{HS}}^2|\psi|^2 .
\]
Where \(|\psi|\ge c>0\) in the chosen collar gauge, an \(L^2\)
bound for the projected derivative gives an \(L^2\) Weyl bound
with squared-norm factor \(2c^{-2}\). An alternative bounded
test could use several spinors and divide the sum of the
identities by \(\sum_a|\psi_a|^2\) wherever that sum is uniformly
positive. The uniform lower bound and the derivative controls
would have to come from the particular fields being matched.
Changing the unit source at a fixed Green pole preserves the
interior zero set by §4.2. The oscillatory example in §4.4
has zero-free interior Green fields, small relative first-order
twistor error, and large \(E_+\). It therefore isolates the
need for the derivative estimate even with well-posed end data.
If a global approximate twistor spinor is obtained, the
conditional attainment criterion in §3.3 supplies an exact
one in a smooth nondegenerate metric limit under its stated
uniform and \(W^{1,4}\) metric convergence. Exact chiral
recognition then uses §§2.1–2.2.
[DIR §§2.1–2.3, 3.3, 4.2 and 4.4](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex)

### Certify the whole capped piece

The most direct certificate after the energy and Yamabe checks
is \(Y>0\) and \(E_+<4\pi^2\). DIR §10.3 gives the same
criterion at a volume-one constant positive scalar curvature
metric \(g\) on the capped homotopy sphere. Gauss–Bonnet and
signature give
\[
 E_+(g)=8\pi^2-\frac{s^2}{48}
              +\frac14\int |\operatorname{Ric}_0|^2\,dV ,
\]
so the strict recognition inequality is
\(\int|\operatorname{Ric}_0|^2\,dV<s^2/12-16\pi^2\).
This criterion uses a global Ricci budget as well as the
positive scalar curvature. If the two capped energies total
strictly less than \(8\pi^2\), at least one passes the energy
criterion, provided both classes have positive Yamabe constant.
If both pass, smooth gluing recovers standard \(S^4\).
If one piece remains above the threshold, further progress
requires a decrease or a different certificate on that piece.
[DIR §10.3](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) · [SEC §§1.1 and 12.4](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

The spectral route in DIR §7 certifies roundness at exact equality
\(\frac35\sum_{j=1}^5\lambda_j=s\) for a volume-one Yamabe
minimizer. Section 9 controls the joint law of the five modes
under relative near equality. To turn this into a certificate
after surgery, one would need either exact equality or a
nondegenerate metric limit on the capped piece in which
minimality and equality pass to the limit. The Delaunay examples
in §10.2 have conformally flat geometry, positive Yamabe
constant approaching the round value and the relative
five-eigenvalue gap tending to zero, on \(S^1\times S^3\).
They identify an observable that can overlook low-volume
regions. If a degree-one map is part of a construction, the
degree-retention theorem of §6.2 offers a separate test.
It requires control of concentration of the map's critical
fourth energy and applies under its map-convergence
hypotheses. Weyl energy accounting alone leaves that control
to be shown.
[DIR §§6.2, 7, 9 and 10.2](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex)

## How to obtain a collar with these hypotheses

If a smooth pointed rescaling already has a differentiably
Euclidean end, one collar is available directly. In the
coordinates of that end suppose
\(|D^j(h_{\mathrm{end}}-\delta)|\le C_j \rho^{-\tau-j}\)
for some positive order \(\tau\) and the needed derivatives.
Fix a product length \(2L+4\). Choose a sufficiently large
**fixed** central radius \(R\) so that the annulus
\(Re^{-L-2}<\rho<Re^{L+2}\) lies in the end and is close to
the flat cone. Multiplication by \(\rho^{-2}\) and the
coordinate \(t=\log(\rho/R)\) give the product comparison.
Smooth oriented convergence on a slightly larger compact
truncation transfers this collar to the original sequence.
For the smooth ALE limits in SEC §11.3 the embedded full
core and fixed-margin bounds give the trivial link group.
The order of steps matters. Extraction of the smooth limit,
regularity at the end and the comparison embeddings are
inputs to this use of the end, with \(R\) chosen before
passing to the sequence limit.
[SEC §§11.2–11.4 and 12.4](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

With only the almost Bach-flat sequence, scale selection is an
earlier step. Suppose two scales are already separated and
there are \(N_i\) dyadic shells between them, \(N_i\to\infty\).
For a fixed integer \(m\), partition into disjoint blocks
of \(m\) shells, with room in each block for its own smaller
interior. The uniform \(L^2\) Riemann curvature energy gives
a block of energy at most
\(C/\lfloor N_i/m\rfloor\). Increasing fixed \(m\) first gives
room for the chosen Yamabe buffer length if the block can be
identified geometrically. The total \(L^1\) Bach error on
any block also tends to zero. This chooses where to look
for a collar. One must still establish, at that scale:

- a noncollapsed rescaled comparison with usable local
  volume estimates and regularity of the metric in a gauge,
  sufficient for the desired jet estimates on a protected
  strip
- an annular identification with a spherical space-form
  link, then triviality of its group for an ordinary
  four-ball cap
- a conformal normalization from a nearly flat **cone**
  to a nearly round **product**, with enough uniform length
  and derivative control for the transition and the
  retained-side buffer.

Chang–Qing–Yang's Theorem 2.4 gives curvature derivative
estimates for exact Bach-flat metrics in positive Yamabe
gauge. Their Theorem 3.1 adds \(b_1=0\), suitable radial
separation, an upper bound on the inner geodesic
sphere areas and small annular \(L^2\) curvature. It gives
the spherical quotient model and rescaled local
\(C^{1,\alpha}\) comparison in the central region. Their
local regularity uses \(B=0\) on each source metric.
The present sequence supplies
scale-invariant \(L^1\) forcing. Small curvature integrals at
one scale can hide large derivatives at much smaller scales.
For example on a fixed Euclidean region a smooth perturbation
\(a\,v((x-x_0)/\rho)\) with compactly supported fixed \(v\)
has \(L^2\) curvature energy \(O(a^2)\) and total Bach norm
\(O(a)\) for small \(a\). Its curvature can have size
\(a\rho^{-2}\) at a point, while the fourth metric derivatives
have size \(a\rho^{-4}\). This local scaling test explains
why the two integrals alone do not yield a strong product
chart on a prescribed strip. Extraction may select another
region or give a weaker gauge with enough structure for the
desired surgery costs. The cancellation in SEC §§14.4–14.5
and the density identity in §15 are available inputs for
developing such a result.
[Chang–Qing–Yang, arXiv:math/0508621v2, Theorems 2.4 and 3.1](https://arxiv.org/pdf/math/0508621) · [SEC §§14.4–15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

For a product comparison that has already been obtained,
the choice \(X=\partial_t\) gives \(X(t)=1\),
\(\Lambda=1+O(\eta_2)\), and pointwise
\(|(L_Xh)_0|+|\nabla(L_Xh)_0|=O(\eta_2)\).
If the cutoff has fixed transition widths and support of
product length \(O(L)\), the weighted conformal Killing
defect in SEC §14.4 is bounded by
\(C\eta_2(1+\sqrt L)\). Hence a fixed strip and a long neck
need different limiting estimates. For a long neck the
amplitude must decay with the length or the defect must
have better integrated control.
[SEC §14.4, energy of a nearly conical neck](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

A single controlled collar and a full no-neck theorem serve
different stages of the argument. The first can support one
cut, cap and comparison. An energy identity requires accounting
for the entire region between the extracted components. A
repeated surgery argument would also need a way to find the
next collar, keep the accumulated cap costs within the
margin, and finish the remaining components while tracking
smooth gluing. These are candidate uses of the companion
tools under the existing SEC-B36 decision.
[Parent SEC register](../../../research-progress/REGISTER.md)
