# E255 — Independent effective static recognition audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B116, configured
gpt-6.2-sol/ultra. Selected-lead settings and independent runtime
attestation are unavailable. I independently derived the new
minimum and static implication from the frozen inputs, without
access to E254 or its correspondence. I previously contributed
the E01C signature normalization review and the E147 whole-fiber
equivalence audit used in the inherited background.

## Result and evidence scope

**Pass.** On a smooth closed oriented homotopy four-sphere \(M\),
suppose a smooth positive-plane round-compatible definite
\(SO(3)\) connection \(A\) is supplied. Use the native reconstructed
Riemannian metric \(g\), the negative Killing internal pairing and
\(\mathcal G=|\nabla^A T|+|T|^2\). With the real whole-fiber density
\(\Psi\) in the manuscript, either of
\[
 \sup_M\mathcal G\le\varepsilon_{\rm static},
 \qquad
 \sup_M\Psi\le
   \frac{4\pi}{5(1+4\sqrt3)}\,\varepsilon_{\rm static},
 \qquad
 \varepsilon_{\rm static}
   =\frac{3}{4(2+\sqrt3)(78+8\sqrt3)}
 \tag{1}
\]
suffices for \(M\) to be diffeomorphic to the standard smooth
\(S^4\). The combining observation is N4 in the external review.
Its numerical estimate for \(p_*\) is replaced here by an exact
minimum calculation. [External review, N4](EXTERNAL_MANUSCRIPT_REVIEW_20261123.md)
· [B116](../brainstorm/notes/B116_EXTERNAL_REVIEW_RESPONSE_20261123.md).

## Exact compact-complement minimum

Let \(\Delta=\{\lambda\in[0,\infty)^3:\sum_i\lambda_i=3\}\)
and \(z=\lambda-(1,1,1)\), \(t=|z|\) in the Euclidean norm.
The compact set for the E171 minimum is the complement in
\(\Delta\) of the union of the two relatively open sets
\(t<1/2\) and \(\lambda_{\max}>5/2\). Thus the constraints on
the complement are \(t\ge1/2\) and \(m=\lambda_{\max}\le5/2\).
Because the other two nonnegative entries sum to \(3-m\),
\[
 \sum_i\lambda_i^2\le m^2+(3-m)^2.
\]
Here \(m\in[1,5/2]\), and the convex right side is bounded by
its larger endpoint value, \(13/2\). Consequently
\(t^2=\sum_i\lambda_i^2-3\le7/2\). The upper radius is
attained by a permutation of \((5/2,1/2,0)\), so this
global radius bound is precise.

Write \(s_2=\sum_{i<j}\lambda_i\lambda_j\) and
\(s_3=\lambda_1\lambda_2\lambda_3\). Expanding the six
ordered terms in the cyclic polynomial gives
\[
 \mathcal P(\lambda)
  =\sum_{\rm cyc}\lambda_i(\lambda_j-\lambda_k)^2
  =\Bigl(\sum_i\lambda_i\Bigr)s_2-9s_3
  =3s_2-9s_3 .
\]
Since \(\sum_i z_i=0\), one has \(s_2=3-t^2/2\) and
\(s_3=1-t^2/2+z_1z_2z_3\). Therefore
\[
 \mathcal P=3t^2-9z_1z_2z_3.
\]
For nonpositive product the bound
\(z_1z_2z_3\le t^3/(3\sqrt6)\) is immediate. For positive
product, reorder the coordinates as \((x,-b,-c)\) with
\(b,c>0\) and \(b+c=x>0\). Then \(bc\le x^2/4\) and
\(t^2=2x^2-2bc\ge3x^2/2\). Hence
\[
 z_1z_2z_3=xbc\le x^3/4\le t^3/(3\sqrt6).
\]
For \(t>0\) equality requires \(b=c=x/2\) and is attained at
\(z=(t/\sqrt6)(2,-1,-1)\) up to permutation.

It follows that \(\mathcal P\ge f(t)=3t^2(1-t/\sqrt6)\).
On \(1/2\le t\le\sqrt{7/2}\), the derivative
\(f'(t)=3t(2-3t/\sqrt6)\) can only change sign from positive
to negative. The minimum is at one of the interval endpoints.
At the larger endpoint
\[
 f(\sqrt{7/2})
 =\frac{21}{2}\bigl(1-\sqrt{7/12}\bigr)
 >\frac{21}{10}>\frac34>f(1/2),
\]
using \(7/12<16/25\). At the smaller endpoint
\[
 f(1/2)=\frac34-\frac{3}{8\sqrt6}
       =\frac{12-\sqrt6}{16}.
\]
The equality triple \(z=(2,-1,-1)/(2\sqrt6)\) has \(t=1/2\)
and gives positive \(\lambda\) with
\(\lambda_{\max}=1+1/\sqrt6<5/2\). It lies in the compact
complement and attains both bounds. Thus its minimum is
exactly \(\boxed{p_*=(12-\sqrt6)/16}\).

## Exact ordering of the strain thresholds

The three entries of the assessed \(\varepsilon_0\) are
\[
 e_{\rm sep}=\frac{\sqrt{p_*}}{72\sqrt6},\qquad
 e_{\rm plane}=\frac{\sqrt5}{36},\qquad
 e_{\rm Ric}=\frac{3}{4(2+\sqrt3)(78+8\sqrt3)} .
\]
The exact inequalities \(\sqrt6<3\) and \(\sqrt6>1\) give
\(9/16<p_*<1\) and then \(1/288<e_{\rm sep}<1/72\).
Also \(\sqrt3>1\) and \(78+8\sqrt3>78\) give
\(e_{\rm Ric}<3/(4\cdot3\cdot78)=1/312\). Finally
\(e_{\rm plane}>1/36\). In particular
\[
 e_{\rm Ric}<1/312<1/288<e_{\rm sep}<1/72
               <1/36<e_{\rm plane}.
\]
No numerical comparison is needed. The assessed
\(\varepsilon_0\) equals \(e_{\rm Ric}=\varepsilon_{\rm static}\).

A homotopy four-sphere is connected, simply connected and
has \(H^2(M;\mathbb R)=0\), as required by the assessed
small-strain proposition. The separation entry and the
commutator bound give \(\mathcal P\le p_*/4\), so
connectedness selects one of the two disjoint spectral
neighborhoods. The plane-curvature and Stokes argument of
that proposition excludes the neighborhood \(\lambda_{\max}>5/2\).
On the round neighborhood \(\lambda_i\ge1/2\) and
\(\mathcal P\ge\tfrac32|Q-I|^2\) by the trace-three identity
for the sum of squared eigenvalue differences. The assessed
\(|[\operatorname{ad} F,Q]|\le36\sqrt6\,\mathcal G\)
then gives \(|q|\le72\mathcal G\) pointwise, with \(q=Q-I\).
[E171/E173 assessment](E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md)
· [Frozen manuscript, small intrinsic strain proposition (line 5501)](../manuscript/chiral_curvature_and_metric_evolution.tex).

The measured \(\Psi\) uses the complete target unit round
sphere of area \(4\pi\), all ordered base slots and the
native live metric. The assessed lower bound is
\(\Psi\ge(4\pi/5)\mathcal G/(1+4\sqrt3)\), so the \(\Psi\)
condition of (1) implies its \(\mathcal G\) condition.
[Frozen manuscript, complete-fiber criterion (line 4499)](../manuscript/chiral_curvature_and_metric_evolution.tex).

## Native curvature comparison and the sphere theorem

At \(K=1/2\) in the old reconstruction \(g=2K\widehat g\)
gives \(g=\widehat g\). The normalized endomorphism \(Q\)
is unchanged by the internal metric conversion. The fiber
norms of \(q,T,\nabla^A T\) are endomorphism Hilbert–Schmidt
norms, which are unchanged by multiplying the inner product
on \(E\) by a positive constant. The base metric and
Levi–Civita derivative agree at this \(K\). Thus these native
norms are the ones in the static comparison, and
\[
 \mathfrak R_{1/2}
 =\tfrac12|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2
 \le (78+8\sqrt3)\mathcal G
 \le \frac{3}{4(2+\sqrt3)}<\frac12 .
 \tag{2}
\]
The coefficient follows from \(|q|\le72\mathcal G\) and
\(6\le42+8\sqrt3\). The final strict inequality is immediate
from \(3<2(2+\sqrt3)\).
[Frozen manuscript, normalization and curvature comparison (line 1863)](../manuscript/chiral_curvature_and_metric_evolution.tex)
· [E08–E13 assessment](E08_E13_CONTROL_ASSESSMENT_20261122.md).

The assessed chiral block comparison at \(K=1/2\) gives
\[
 \left(|W^+|_{\rm op,HS}^2+\tfrac14|\operatorname{Ric}_0|^2
                  +\tfrac1{48}(s-6)^2\right)^{1/2}
    \le\mathfrak R_{1/2}.
\]
In particular \(|W^+|_{\rm op,HS}\le1/2\) and
\(s\ge6-2\sqrt3>0\). Positive scalar curvature of this
smooth closed metric makes the Yamabe constant of its own
conformal class positive. The quotient numerator is
\(\int_M(6|du|^2+s u^2)dV_g\), and the compact Sobolev
inequality for this fixed metric bounds the denominator
\(\|u\|_4^2\) by a constant times
\(\|du\|_2^2+\|u\|_2^2\). This uses no supplied quantitative
Sobolev bound.

The curvature-plane isomorphism is \(E\simeq\Lambda_g^+\).
For this chirality
\(\langle p_1(E),[M]\rangle=2\chi(M)+3\tau(M)=4\).
Indeed the formal plane Euler roots \(x,y\) give
\(p_1(\Lambda^+)=(x+y)^2=p_1(TM)+2e(TM)\).
In a native orthonormal internal frame,
\(\operatorname{tr}_{\mathbb R^3}(\operatorname{ad}e_i
 \operatorname{ad}e_j)=-\delta_{ij}\), so
\(p_1(A)=\sum_iF_i\wedge F_i/(8\pi^2)\).
The native density is \(dV_g=\tfrac13\sum_iF_i\wedge F_i\),
and therefore
\[
 \operatorname{Vol}(M,g)=\frac{8\pi^2}{3}\cdot4
     =\frac{32\pi^2}{3}.
\]
This agrees with the old scale volume \(8\pi^2/(3K^2)\)
at \(K=1/2\).

Writing \(E_\pm=\int_M|W^\pm|_{\rm op,HS}^2dV_g\),
we get \(E_+\le\tfrac14\operatorname{Vol}(M,g)=8\pi^2/3\).
The signature identity \(\tau(M)=(E_+-E_-)/(12\pi^2)=0\)
gives \(E_-=E_+\). For the full four-index Weyl norm the
ordered tensor sum counts each independent index-pair entry
four times relative to the operator norm. Orthogonality
of the two chiral blocks now yields
\[
 \int_M|W|_{\rm tensor}^2dV_g
   =4(E_++E_-)=8E_+
   \le\frac{64\pi^2}{3}
   <32\pi^2=16\pi^2\chi(M).
\]
These are the two hypotheses of Chang–Gursky–Yang's
Theorem A for the smooth closed metric. The conclusion is
a diffeomorphism to \(S^4\) or \(\mathbb{RP}^4\).
Simple connectivity rules out \(\mathbb{RP}^4\), giving the
standard smooth sphere. The theorem is used only at the
previously inspected scope, published p. 107, Theorem A,
equation (0.3) and Remarks 1–2. [CGY published version](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)
· [Canonical source record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#broad-run-static-calibration--22-november-2026)
· [Existing static implication (line 13216)](../manuscript/chiral_curvature_and_metric_evolution.tex).

The explicit thresholds are sufficient for the supplied-data
static diffeomorphism conclusion. The separate dynamical entry
theorems retain their non-effective energy and small-strain
thresholds.
The only classification input here is the previously assessed
CGY theorem. No new source retrieval or numerical calculation
was used. [Frozen uniform-entry theorem and proof (line 6479)](../manuscript/chiral_curvature_and_metric_evolution.tex).
