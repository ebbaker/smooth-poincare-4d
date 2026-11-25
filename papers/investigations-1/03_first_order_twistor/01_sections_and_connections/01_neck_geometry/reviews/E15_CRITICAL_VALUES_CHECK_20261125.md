# Independent check of the fixed-type Bach-flat critical values — NECK-E15

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The exact serving model and reasoning effort
are unavailable. Inputs are the SEC manuscript and NECK-E02/E05 at
checkout `6879850`, and the primary passages linked below.

The local constancy argument and the fixed-type compact-band consequence
hold. The local step uses analyticity of the gauged equation as a map of
metric perturbations. A choice of gauge for every nearby metric need
only put those solutions on the local analytic graph.

## The analytic graph includes all nearby solutions

Let \(g\) be any smooth Bach-flat Riemannian metric on a closed oriented
four-manifold. Use the \(g\)-pointwise traceless spaces
\(X=C^{4,\alpha}(S^2_0T^*M)\) and
\(Y=C^{0,\alpha}(S^2_0T^*M)\) for \(0<\alpha<1\).
Gursky–Viaclovsky's §2.3 uses the equation
\[
 P_g^B(\theta)
 =\pi_0^g\!\left(B(g+\theta)
          + K_{g+\theta}\bigl(\square_{K_g}\beta_g\theta\bigr)\right),
 \qquad
 \pi_0^g H=H-\tfrac14(\operatorname{tr}_g H)g .
 \tag{1}
\]
Here \(B\) has their normalization, \(K\) is the conformal Killing
operator, \(\square_{K_g}=\delta_g K_g\), and on the trace-free slice
\(\beta_g\theta=\delta_g\theta\). Equation (2.59) gives (1).
The linearization \(S=(P_g^B)'(0)\) is elliptic by Theorem 2.11(i).
It is formally self-adjoint because \(B'_g\) is a metric Hessian at a
critical point and \(K_g^*=-2\delta_g\) there on trace-free tensors.
In particular \(K_g\square_{K_g}\delta_g\) is self-adjoint as well,
using self-adjointness of \(\delta_g K_g\). The trace-free projection
pairs unchanged against trace-free variations. The paper uses the
same kernel/cokernel identification in §2.4 and describes its kernel
in Lemma 2.12, equation (2.73).

The formula defines a real analytic map from the open set of small
\(\theta\in X\) with \(g+\theta>0\) to \(Y\). In local frames the
curvature, its covariant derivatives and the gauge term are formed
by products and contractions of the inverse metric and metric
derivatives through order four. The inverse admits a Neumann
series near the fixed smooth \(g\) in the Hölder algebra. Derivatives
and fixed-background projections are continuous linear operations.
One can also see these operations directly in equations (2.79)–(2.83).
Analyticity here is in \(\theta\); the components of \(g\) as functions
of the manifold coordinates only have to be smooth.

Let \(H=\ker S\), which is finite-dimensional and smooth by
ellipticity, and \(\Pi\) the \(L^2(g)\) projection onto \(H\).
It acts continuously on both Hölder spaces. Elliptic Fredholm
theory gives an isomorphism
\(S:(I-\Pi)X\to(I-\Pi)Y\).
The analytic implicit function theorem applied to
\((I-\Pi)P_g^B(k+z)=0\) gives an analytic \(z=\phi(k)\)
on a neighborhood of \(0\) in \(H\). The entire graph
\(k\mapsto k+\phi(k)\) lies in a small metric neighborhood.
The zeros of \(\Psi(k)=\Pi P_g^B(k+\phi(k))\) are precisely
the small zeros of the gauged equation, by the local uniqueness of
the complement equation. Corollary 2.14 gives the finite-dimensional
description; the explicit analyticity and complement inversion
justify the analytic version needed here.

Theorem 2.11(iii), with gauge constructed in (2.68)–(2.70),
puts each sufficiently \(C^{4,\alpha}\)-close smooth Bach-flat
metric into this small zero set by a diffeomorphism near the
identity and a positive conformal change. Conversely, (2.62)–(2.65)
show \(B(g+\theta)=0\) for every small zero: trace first, then
pair with \(B\) and use its divergence-free identity.
This yields the Bach equation already in \(C^{0,\alpha}\)
before the theorem's additional local smoothness up to conformal
change. The usual integration by parts in the first variation
of Weyl energy is valid at \(C^{4,\alpha}\) regularity, or extends
by approximation in \(C^4\). Thus the proof neither assumes
smoothness of every graph metric nor requires the uniqueness of
the quotient slice. The condition \(C(g)=I(g)\) in the orbit-space
statement of Corollary 2.14 is unnecessary for representing nearby
solutions and therefore for this argument.
[Gursky–Viaclovsky, arXiv:1105.4648v2, §§2.3–2.4](https://arxiv.org/abs/1105.4648)

## The energy on the whole graph has one nearby critical value

Let \(\mathcal W(h)=\int_M |W_h|_{\mathrm{4ind}}^2\,dV_h\)
and \(F(k)=\mathcal W(g+k+\phi(k))\).
This is real analytic on the open kernel neighborhood. Its
integrand is obtained from inverse metric, derivatives through
order two and the analytic near-background volume density.
At every \(\Psi(k)=0\), the ambient first variation of
\(\mathcal W\) is zero in every metric direction, since its
gradient is a fixed multiple of the Bach tensor. It follows by
the chain rule that \(DF(k)=0\) as a derivative on all of \(H\).
This point avoids treating the possibly singular zero set as a
manifold and does not require the converse implication
\(DF(k)=0\Rightarrow\Psi(k)=0\).

The finite-dimensional Łojasiewicz gradient inequality applied to
\(F-F(0)\) bounds \(|F(k)-F(0)|^\vartheta\) by \(C\|DF(k)\|\)
near \(0\), for some \(0<\vartheta<1\).
On all nearby critical parameters it gives \(F(k)=F(0)\).
An identically constant \(F\) or zero-dimensional \(H\) gives
the same conclusion immediately. Weyl energy is invariant
under the conformal changes and diffeomorphisms used to place
metrics on the graph. Hence **every smooth Bach-flat metric
sufficiently close to \(g\) has its same Weyl energy**, with
no assumption on the kernel or integrability. On a fixed
oriented type \(E_+-E_-\) is topological, and on a homotopy
sphere \(\mathcal W=8E_+\) with the SEC conventions.
[Łojasiewicz, §III.9](https://eudml.org/serve/251330/accessibleLayeredPdf/0)
· [Feehan, Theorem 1](https://msp.org/gt/2019/23-7/gt-v23-n7-p02-p.pdf)

## Fixed-type sublevel and the first value

For a fixed smooth oriented homotopy four-sphere \(M\), let
\(\mathcal A_M\) consist of the exact positive subcritical values
\(0<E_+<8\pi^2\) of its smooth positive-Yamabe Bach-flat classes,
and \(a_M=\inf\mathcal A_M\) if nonempty. A nonzero value is
strictly above \(4\pi^2\) by SEC §12.1. In a closed band
\(4\pi^2\le E_+\le 8\pi^2-\delta\), restrict to a sublevel
\(E_+\le b<a_M+\kappa_\delta\) and choose smooth volume-one
Yamabe minimizing representatives. Any sequence admits a
subsequence of convergent energies with limit \(e\le b\).
The rescaled alternative in SEC §12.2 and the same-type
transfer of NECK-E02/E05 would supply the compactified
bubble's value on \(M\), in \(\mathcal A_M\), with
\[
 a_M\le e_X\le e-\kappa_\delta\le b-\kappa_\delta<a_M .
\]
The strict sublevel condition and the same-type conclusion
are both needed for this exclusion. The other SEC alternative
gives smooth convergence modulo diffeomorphisms, to a
volume-one positive-Yamabe Bach-flat minimizer on the same
smooth type. The limit has the limiting energy and lies in the
closed sublevel. This uses exact Bach-flatness throughout.

If infinitely many distinct values lay in that sublevel, choose
one representative for each. The compact alternative gives a
smoothly converging subsequence after diffeomorphisms. Local
constancy forces all sufficiently late values in that subsequence
to equal the limit, a contradiction. The same-type argument
also gives attainment for a minimizing sequence when
\(\mathcal A_M\ne\varnothing\): first fix a band with upper
endpoint strictly above \(a_M\), choose
\(a_M<b<\min(8\pi^2-\delta,a_M+\kappa_\delta)\) and take its
tail. The finite set of attained values in this sublevel makes
\(a_M\) isolated among the exact fixed-type positive subcritical
values. The gap is non-effective and depends on \(M\).
The argument does not produce a lowest class on types where
\(\mathcal A_M\) is empty, or show that a surviving critical
metric is isolated or unstable.
[SEC §§12.1–12.3](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4350)
· [NECK-E02/E05](../notes/E02_E05_SAME_TYPE_DESCENT_20261125.md)

## Input versions

- SEC manuscript SHA-256
  `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`.
- NECK-E02/E05 SHA-256
  `61d01e1cf53be476e2f7379449c70da40884444cec435f44f5a9246d1647f26f`.
- Inspected Gursky–Viaclovsky arXiv:1105.4648v2, 20 April 2013,
  equation (1.9), Theorem 2.11 and its gauge and zero verification,
  Lemma 2.12, the coordinate expansions in Lemma 2.13, and
  Corollary 2.14. The proof above uses the analytic implicit
  function theorem on the explicit map, which the cited passage
  presents through a finite-dimensional reduction.
- Inspected Łojasiewicz's author exposition *On semi-analytic and
  subanalytic geometry*, §III.9, and Feehan's *Resolution of
  singularities and geometric proofs of the Łojasiewicz inequalities*,
  Theorem 1, for the finite-dimensional gradient inequality.
