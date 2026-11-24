# SP4-FOT-DIR-E01 · Fixed-metric benchmark return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. [Request v1](SP4-FOT-DIR-E01_REQUEST_v1.md)
specifies fixed E routing to gpt-6.2-sol / ultra. The executing model
identifier and reasoning effort are unavailable as independent metadata.
[Owning register](../REGISTER.md).

**Disposition.** All five requested benchmarks are verified for the
frozen operator and chirality. The [derivation and primary passage record](../../notes/DIR_E01_20261124.md)
give the complete curvature and zero-set argument, the independent symbol
calculation, and the exact scope of the round metric comparison.
The observed HEAD and all frozen working-file hashes matched, including
the CME source pinned in the crosswalk.

| Requested output | Result |
| --- | --- |
| Unit-round chirality and equation checks | A full Killing spinor with $\kappa=\pm1/2$ has $D\Psi=-4\kappa\Psi$. Both projections are nontrivial twistor spinors with $D^2\psi_\pm=4\psi_\pm$. The global untwisted harmonic kernel is zero and the higher ordinary Dirac modes have strictly positive twistor energy. |
| Curvature compatibility | With $A=(\operatorname{Ric}^\sharp-sI/6)/2$ and $\chi=D\psi$, the prolonged equation is $\nabla_X\chi=-2c(A(X))\psi$. The Schouten contribution equals the spin curvature from the twistor commutator, leaving $W^S(X,Y)\psi=0$. Invertibility of the nonzero real $\Lambda^+$ action on $S^+$ yields $W^+=0$ where $\psi\ne0$. |
| Zeros and global scope | A nontrivial prolonged pair is nowhere simultaneously zero. At a zero of $\psi$, $\operatorname{Hess}_p\lvert\psi\rvert^2=\lvert D\psi(p)\rvert^2g_p/8$. The zero set is isolated and finite on the closed base, and continuity gives $W^+=0$ through it. Prescribing a pure negative initial value for a round Killing field gives an example where the positive projection vanishes. |
| Fixed-metric operator | $P^*P=\tfrac34D^2-\tfrac14sI$ on $S^+$ and $\sigma_2(P^*P)(\xi)=\tfrac34\lvert\xi\rvert^2I$. The Rayleigh infimum is its least eigenvalue, with a smooth minimizing eigensection for each supplied smooth metric. |
| CME round TT factorization | With $L=\nabla^*\nabla$ and $\mathcal D=(W^+)'$, the unit-round TT identity is $16\mathcal D^*\mathcal D=(L+2)(L+4)$. The bound $L\ge8$ on TT gives $\mathcal D^*\mathcal D\ge15/2$. This controls the round metric Weyl linearization on TT. |

The exact checked passages are Friedrich (1.1), (2.1)–(2.2) and
Propositions 1–2, Bär §2 equation (1), Lemma 1 and Theorem 1, and
Friedrich–Kim arXiv:math/9906168v1, proof of Theorem 2.6. The conditional
use of each is recorded at the point of dependence in the derivation.

The selected chiral twistor operator passes the B01 consistency check.
The lead can carry this benchmark to DIR-B02. Coupled linearized
solvability and construction or attainment for a variable metric
remain separate proof obligations.
