# To Formalization · The sharp fixed-trace quartic minimum

28 November 2026, America/New_York, for Edward B. Baker III with Codex lead assistance. Author-selected GPT-6.2 Astra/ultra; independent backend telemetry unavailable. Checkout `280376dd7a18`, with the branch [B07 decision](../../brainstorm/notes/B07_GLOBAL_COMPARISON.md), [E11 derivation](../../notes/E11_GLOBAL_COMPARISON.md), [E12 constants](../../notes/E12_CYLINDER_CONSTANT.md) and [sequence topology](../../notes/B07_MINIMIZING_SEQUENCES.md). Request exact theorem types and prerequisites from the formalization owner. This handoff opens no Lean edition. Current pins are Lean `v4.35.0-rc3` and mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`.

**Global minimum and equality.** Let \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) with its oriented flat product metric, periodic spin structure, slice volume one, positive half-spin bundle and fixed parallel unit spinor \(\sigma\). Use the real pairing, \(P=\Pi\nabla\), \(\Pi=I-c^*c/4\), and \(b=1/200\). For every smooth positive half-spinor \(\psi\) up to the boundary with \(\psi(\pm1,x)=e^{\pm b}\sigma\) for every \(x\), zero-free or with finitely many transverse interior zeros of Clifford-compatible first jet, define \(J_g^4\) by integrating \(|P\psi|^4/|\psi|^4\) away from these zeros. Then
\[
 J_g(\psi)^4\ \ge\ \frac{9}{8\cdot 200^4},
 \qquad J_g(\psi)^4=\frac{9}{8\cdot 200^4}
 \quad\Longleftrightarrow\quad
 \forall(t,x)\in M,\quad \psi(t,x)=e^{bt}\sigma .
\]
In particular the minimum is attained. Allowing the extended cost \(+\infty\) at an incompatible transverse zero has no effect on the infimum. For any sequence in the stated finite-cost class with action tending to this value, request convergence in \(H^1(M)\) to the radial field.

**Intermediate quadratic estimate.** With \(D=2,\ A=\Pi(dt\otimes\cdot),\ B=P+bA,\ k^2=3b^2/4\), for any smooth \(v\) zero on both end faces and \(f=\sigma+v\),
\[
 \|Bf\|_2^2-k^2\sqrt D\,\|f\|_4^2\ \ge\ \tfrac23\|\nabla v\|_2^2 .
\]
A separate algebraic target is \( (29403-1296\sqrt{2})/40000>2/3\).

**Norm and domain lemmas.** For real finite-dimensional Hilbert-valued fields \(u,v\in L^4\), \(u\ne0\) as an \(L^4\) element, request
\[
 \|u+v\|_4^2\le \|u\|_4^2+
 \frac{2}{\|u\|_4^2}\int |u|^2\langle u,v\rangle
 +3\|v\|_4^2 .
\]
For the flat product, request \(\|v\|_4\le24\|\nabla v\|_2\) under the homogeneous end conditions. The scalar Euclidean input is Talenti's \(m=4,p=2\) theorem and the domain transfer is derived in E12. The existing [first-horizon request](TO_FORMALIZATION_TWA_FIRST_HORIZON_20261128.md) fixes the homogeneous twistor identity and earlier analytic context. Return types before changing any formal verification status.
