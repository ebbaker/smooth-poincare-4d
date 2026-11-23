# SP4-CME-E06 — Gauge-equivalent round endpoints with a nondefinite affine midpoint

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. The helper was configured as gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This one explicit example executes the [frozen request][request] from
the [B05 gluing decision][decision]. The [return][return] records the
input byte identities.

On the standard smooth closed oriented \(S^4\), two globally defined
gauge-equivalent connections can be perfect and round-positive, with
the same reconstructed metric and volume, while their affine midpoint
loses definiteness. The example uses only first-jet freedom of a gauge
transformation and the quadratic curvature term.

## Global connections and endpoint geometry

Fix the positive Riemannian round metric \(g_K\) of sectional curvature
\(K>0\), the self-dual rank-three bundle \(E\) with its chiral
Levi–Civita connection \(A_0\), the manuscript's internal metric, and
the bracket \([e_i,e_j]=\epsilon_{ijk}e_k\). The fixed connection has
\(F_0=-K\Sigma\), with
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{g_K}\).
The round sign is positive when measured in the target's
bracket-oriented two-form frame, as checked in the
[orientation calibration][round].

Choose \(p\in S^4\), oriented geodesic normal coordinates \(x\) centered
at \(p\), and a trivializing ball \(U\) within the coordinate patch.
Let \(\theta^i=(dx^i)_p\). Choose the standard compatible round chiral
triple at \(p\), with \(\Sigma_3(p)=\theta^1\wedge\theta^2+
\theta^3\wedge\theta^4\). Then
\(F_0(\partial_1,\partial_2)(p)=-K e_3\).
Extend this internal frame over \(U\) by radial \(A_0\)-parallel
transport. The resulting local gauge has \(A_0(p)=0\) and preserves the
prescribed frame at \(p\).

Take a smooth \(\chi\) compactly supported in \(U\) with
\(\chi=1\) near \(p\). In the chosen trivialization use the smooth
Lie-algebra section and gauge transformation
\[
\xi(x)=2\sqrt K\,\chi(x)\bigl(x^1e_1-x^2e_2\bigr),\qquad
g(x)=\exp(\xi(x)).
\]
Here the Lie-algebra basis is identified with infinitesimal
\(\mathrm{SO}(3)\) rotations by the fixed bracket.
On an open collar of \(\partial U\), \(g=I\), so extending it by
identity defines a smooth gauge transformation of the whole bundle.
Since \(\xi(p)=0\) and \(d\exp_0\) is the identity,
\[
g(p)=I,\qquad (g^{-1}dg)_p
=2\sqrt K(e_1\theta^1-e_2\theta^2).
\]
Let \(A_1=g^{-1}A_0g+g^{-1}dg\) and \(a=A_1-A_0\).
Then \(a_i=a(\partial_i)(p)\) satisfy
\[
a_1=2\sqrt K e_1,\qquad
a_2=-2\sqrt K e_2,\qquad a_3=a_4=0 .
\]
The conjugation term in \(a(p)\) vanishes since \(g(p)=I\).
In fact this equality for \(a(p)\) does not require \(A_0(p)=0\).

Globally \(F_1=\operatorname{Ad}_{g^{-1}}F_0\), an oriented
orthogonal change of the internal curvature components. In particular
\(F_1(p)=F_0(p)\). Both endpoints have the same self-dual curvature
plane, round-compatible sign, and volume form
\[
\mu_{A_0}=\mu_{A_1}=\tfrac13\sum_i(F_0)_i\wedge(F_0)_i
=2K^2dV_{g_K}.
\]
Their normalized matrices defined by
\(F_i\wedge F_j=Q_{ij}\mu\) are both \(I\), so the
reconstructed metric is \(g_K\) at each endpoint under
\(dV_{\widehat g}=\mu/(2K^2)\).

## Affine curvature and loss of definiteness

The convention is
\(\big([a\wedge a]\big)(X,Y)=2[a(X),a(Y)]\).
For the global affine path \(A_t=A_0+t a\) with \(0\leq t\leq1\),
the curvature expansion gives
\[
\begin{aligned}
F_t
&=F_0+t\,d_{A_0}a+\tfrac{t^2}{2}[a\wedge a]\\
&=(1-t)F_0+t F_1-\tfrac{t(1-t)}2[a\wedge a],
\end{aligned}
\]
where the second identity follows by eliminating \(d_{A_0}a\)
using the same expansion at \(t=1\).
For the chosen coordinate plane,
\([a_1,a_2]=-4K e_3\), so
\[
F_t(\partial_1,\partial_2)(p)
=-K e_3-t(1-t)(-4K e_3)
=-K(2t-1)^2 e_3 .
\]
Thus \(F_{1/2}(\partial_1,\partial_2)(p)=0\).
Only this curvature component changes at \(p\), since
\(a(\partial_3)(p)=a(\partial_4)(p)=0\) and \(F_1(p)=F_0(p)\).
Writing \(\theta^{ij}=\theta^i\wedge\theta^j\), the third midpoint
curvature form is \(-K\theta^{34}\) and the other two are the
round \(-K\Sigma_i\). The third form is nonzero and decomposable.
The wedge Gram of the triple at \(p\) is
\[
\bigl((F_{1/2})_i\wedge(F_{1/2})_j\bigr)
=2K^2\operatorname{diag}(1,1,0)\,dV_{g_K},
\]
because neither \(\Sigma_1\) nor \(\Sigma_2\) has a
\(\theta^{12}\) component. The wedge Gram fails positive
definiteness. Its trace still gives
\(\mu_{A_{1/2}}(p)=\tfrac43K^2dV_{g_K}(p)\), and the
normalized wedge matrix at that point is
\(\operatorname{diag}(3/2,3/2,0)\). No reconstructed
Riemannian metric is assigned there.

## Scope of the gluing test

This example disproves preservation of definiteness by unqualified
affine averaging, even for endpoints describing the same round
geometry. The independent change of gauge alters \(a\) and its
commutator despite leaving \(F_1(p)=F_0(p)\). The same failure at
\(p\) occurs if two partition-of-unity weights are locally equal to
\(1/2\) near \(p\), so no derivative of the weights enters this
particular example. Gluing after gauge alignment has different
input. For these endpoints, undoing \(g\) first makes the two
connections coincide and their affine average is then round
and definite. The path parameter here is an interpolation
parameter. The calculation gives no evolution trajectory,
global obstruction to gauge-aligned gluing, or conclusion about
initializing a connection on an unknown smooth homotopy sphere.

[request]: ../research-progress/handoffs/SP4-CME-E06_REQUEST_v1.md
[decision]: ../brainstorm/notes/B05_INITIALIZATION_GLUiNG_20261122.md
[return]: ../research-progress/handoffs/SP4-CME-E06_RETURN_v1.md
[round]: 05B_REAL_TWISTOR_COMPARISON_20261122.md
