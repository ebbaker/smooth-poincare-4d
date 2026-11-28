# Explicit Sobolev bound on the periodic cylinder · SP4-TWA-E12

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [frozen request v1](../research-progress/handoffs/E12_REQUEST_v1.md)
records the author-selected GPT-6.2 Astra/ultra lead and configured
GPT-6.2 Sol/ultra helper. Actual backend serving variant and reasoning
effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`
and all nine frozen SHA-256 digests matched at inspection.

Let \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) have the oriented flat
Riemannian product metric and periodic spin lift. Use the parallel frame
on the positive half-spin bundle, with the real part of its Hermitian
pairing and the associated Euclidean norm. The four real components of a
spinor \(v\in H^1(M;S^+_{\mathbb R})\) have Sobolev trace zero on both end
faces. With these conventions the homogeneous bound on \(M\) is

\[
\|v\|_{L^4(M)}\le 24\|\nabla v\|_{L^2(M)}.
\]

Here \(\nabla\) is the flat spin connection. This Sobolev estimate and its
absorption margin are the inputs requested by [B07](../brainstorm/notes/B07_GLOBAL_COMPARISON.md).

## Euclidean scalar constant

Giorgio Talenti, *Best constant in Sobolev inequality*, Ann. Mat. Pura
Appl. 110 (1976), 353–372, p. 353, theorem (1)–(2), gives
\(\|u\|_{mp/(m-p)}\le C_{m,p}\|\nabla u\|_p\) for sufficiently smooth
decaying scalar functions on \(\mathbb R^m\), \(1<p<m\). Reading formula
(2) in the published scan gives

\[
C_{m,p}=\pi^{-1/2}m^{-1/p}
\left(\frac{p-1}{m-p}\right)^{1-1/p}
\left(\frac{\Gamma(1+m/2)\Gamma(m)}
{\Gamma(m/p)\Gamma(1+m-m/p)}\right)^{1/m}.
\]

At \(m=4,\ p=2\), the norm on the left is \(L^4\). The gamma factor
inside the fourth root is
\(\Gamma(3)\Gamma(4)/(\Gamma(2)\Gamma(3))=6\). The scalar constant is

\[
C_{4,2}=\frac{6^{1/4}}{2\sqrt{2\pi}},
\qquad
C_{4,2}^4=\frac{3}{32\pi^2}<1 .
\]

For compactly supported scalar \(w\in H^1(\mathbb R^4)\), compactly
supported smooth mollifications converge in \(H^1\) and a subsequence
converges almost everywhere. The smooth inequality and Fatou's lemma
give \(\|w\|_4\le C_{4,2}\|\nabla w\|_2\).
[Published scan, p. 353](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1) ·
[Canonical R59 record](../../../../../references/SOURCE_NOTES_DIRAC_20261124.md)

## Extension, cutoff and the cell count

In the parallel frame lift \(v\) periodically in \(x\in\mathbb R^3\)
and extend by zero for \(t\notin[-1,1]\), obtaining \(\widetilde v\).
Periodicity identifies the spinor values on the tangential faces of
neighboring cells. In \(t\), the two zero traces cancel all boundary
terms when taking distributional derivatives of the extension. This
can be checked on almost every \(x\)-slice using the absolutely
continuous representative of \(v(\,\cdot\,,x)\) in \(H^1(-1,1)\).
The extension therefore lies in \(H^1_{\mathrm{loc}}(\mathbb R^4)\).
Its weak derivatives agree almost everywhere with the lifted derivatives
for \(-1<t<1\) and vanish outside that slab.

Use the scalar tent
\(\theta(s)=\max\{0,\min\{1,1+s,2-s\}\}\) and the product cutoff
\(\chi(x)=\theta(x_1)\theta(x_2)\theta(x_3)\). It satisfies
\(0\le\chi\le1\), equals one on \([0,1]^3\), vanishes outside
\([-1,2]^3\), and has \(|\nabla\chi|\le\sqrt3\) almost everywhere
because each coordinate derivative has absolute value at most one.
Put \(w(t,x)=\chi(x)|\widetilde v(t,x)|\).
The norm map is \(1\)-Lipschitz, and the Sobolev chain rule gives
\(|\nabla|\widetilde v||\le|\nabla\widetilde v|\) almost everywhere.
One can see the bound including at zeros by applying the smooth chain
rule to \(\sqrt{|\widetilde v|^2+\epsilon^2}-\epsilon\), whose real
differential has operator norm at most one, and passing to the weak
derivative limit. Thus \(w\in H^1(\mathbb R^4)\) is compactly supported
and agrees with \(|v|\) on the fundamental cylinder. Using the triangle
inequality in \(L^2\) for its product derivative gives

\[
\begin{aligned}
\|v\|_{L^4(M)}
&\le\|w\|_{L^4(\mathbb R^4)}
\le C_{4,2}\|\nabla w\|_{L^2(\mathbb R^4)}\\
&\le C_{4,2}\sqrt{27}
\big(\|\nabla v\|_{L^2(M)}+\sqrt3\|v\|_{L^2(M)}\big).
\end{aligned}
\]

The factor \(\sqrt{27}\) follows because \([-1,2]^3\) contains three
unit periods in each coordinate. The integrals of
\(|\widetilde v|^2\) and \(|\nabla\widetilde v|^2\) on
\([-1,1]\times[-1,2]^3\) are each exactly 27 times their integrals
on \(M\).

For almost every torus point \(x\), the zero trace at \(t=-1\) gives
\(v(t,x)=\int_{-1}^t\partial_t v(s,x)\,ds\). Cauchy–Schwarz implies
\(|v(t,x)|^2\le2\int_{-1}^1|\partial_t v(s,x)|^2\,ds\).
Integrating over \(t\) and \(x\) gives the sufficient interval bound
\(\|v\|_2\le2\|\partial_t v\|_2\le2\|\nabla v\|_2\).
Using \(C_{4,2}<1\) and \(\sqrt3<2\) in the cutoff estimate gives
\(\sqrt{27}(1+2\sqrt3)=18+3\sqrt3<24\) for the cylinder constant.

## Absorption at the prescribed slope

Use the B07 notation \(A=\Pi(dt\otimes\cdot)\), \(B=P+bA\),
\(k^2=3b^2/4\), and cylinder volume \(D=2\). The flat homogeneous
Dirichlet identity is \(\|Pv\|_2=(\sqrt3/2)\|\nabla v\|_2\) and
\(\|Av\|_2=(\sqrt3/2)\|v\|_2\) follows from \(A^*A=3I/4\).
Thus for \(|b|<1/2\) the triangle inequality and the interval estimate
give \(\|Bv\|_2\ge(\sqrt3/2)(1-2|b|)\|\nabla v\|_2\).
[Flat Dirichlet identity](E08_LOCAL_DIRICHLET.md#conjugation-stationarity-and-coercivity)

The B07 remainder target is \(3\|v\|_4^2\), multiplied by
\(k^2\sqrt D\) in the comparison. For the homogeneous bound with
constant \(24\), its absorption margin in units of \(\|\nabla v\|_2^2\) is

\[
c_{24}(b)
=\tfrac34(1-2|b|)^2-3k^2\sqrt2\,24^2
=\tfrac34\big((1-2|b|)^2-3\sqrt2\,24^2 b^2\big).
\]

It is positive for \(|b|<(2+24\sqrt{3\sqrt2})^{-1}\). At the
specified \(b=1/200\), the two terms are
\(29403/40000\) and \(81\sqrt2/2500\). In particular

\[
c_{24}(1/200)=\frac{29403}{40000}-\frac{81\sqrt2}{2500}
>\frac{27459}{40000}>\frac23 ,
\]

using \(\sqrt2<3/2\). This checks the numerical absorption with the
stated remainder target. The proof of the remainder estimate and any
conclusions about the variational problem belong to the separate
comparison packet. The product cutoff provides a sufficient constant
for this fixed cylinder.

## Evidence

The nine frozen inputs were checked, including the periodic product
and flat Dirichlet identities in E08 and E09 and their analytic replay.
The prior closing note and B07 fix \(b\) and the comparison target.
Talenti's theorem and formula (2), p. 353, were inspected on
28 November 2026 in the published scan. The use of that source is
the scalar Euclidean bound with \(m=4,\ p=2\). The spinor norm
reduction, extension, localization and absorption follow from the
estimates above.
[Frozen inputs](../research-progress/handoffs/E12_REQUEST_v1.md) ·
[Primary source](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1)
