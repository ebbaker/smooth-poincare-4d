# SP4-FOT-DIR-E27 · Dirac Green boundary data and the compact jet · return v1

24 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing was `gpt-6.2-sol` / `ultra`.
Actual helper and selected lead model identifiers and reasoning efforts
were unavailable. [Request v1](SP4-FOT-DIR-E27_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Technical note](../../notes/DIR_E27_20261124.md).

**Completed.** HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc`
and all six frozen working-tree digests matched. For $c=1/(2\pi^2)$,
the compact Green field has expansion $-c\,x\cdot\eta/r^4+\gamma(x)$,
with smooth harmonic positive-chiral remainder $\gamma$. The signed
point-source normalization follows from the Euclidean flux and a
smooth cutoff correction. Checked Ammann–Humbert–Morel, arXiv preprint
v2, §2.1 and §§2.2 Definition 2.1, Remark 2.2 and Proposition 2.3,
pp. 3–4. The note corrects the sign of the smooth cutoff correction in
the v2 proof while retaining the proposition's pole sign.
[Primary preprint](https://arxiv.org/pdf/math/0503299#page=4).

In the oriented end chart $y=S_a x/r^2$, the even unitary spin transition
from the conformally paired compact frame is $q=a\cdot(x/r)\cdot$.
With this lift the positive $D_h$-harmonic field
$\Psi=\omega^{-3/2}\beta G_\eta$ approaches the constant $c\,a\cdot\eta$
of norm $c|\eta|$, with error $O(R^{-3})$ and derivative $O(R^{-4})$.
Two solutions in this class with the same end constant have a bounded
compact Dirac pullback of their difference. It extends across the pole
and vanishes by compact invertibility.

The compact twistor-weight field is $\psi=\omega^{-2}G_\eta$.
It extends smoothly as $-c\,x\cdot\eta+r^4\gamma(x)$, with exact
Clifford jet $\nabla_X^g\psi(p)=-c\,X\cdot\eta$ and a simple isolated
zero at $p$. The estimate near the pole and the end expansion leave
possible additional interior zeros and the global twistor defect to
the remaining [B15 tests](../../brainstorm/notes/DIR_B15_DIRAC_GREEN_BOUNDARY_20261124.md).
