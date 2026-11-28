# CERT-E02 · E70 algebra and bounded comparison baseline

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Actual model and reasoning effort unavailable. Checkout `6a422ce7814fe1ad278d6904970e3b19b05a9890`. The exact algebraic inputs were [E70](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E70_EQUIVARIANT_SURGERY.md) §§3–5, SHA-256 `ade2987d8bf24aa9aecbf8e3e704d6faaad91010e4a603bb0d4bc6878f2bed7a`, and [check_05](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_05_prism_groups.py), SHA-256 `30861b3f4c89323c7988e5dd4466408322831bbc9097b0cba40cbb75082bc544`. The claims here concern the supplied presentation and its marked slopes.

## Bounded sweep

**Execution record.** `python3 e02_e70_sweep.py` under Python 3.10.0. The adapted HLT enumerator allows at most 20,000 provisional rows and launches each of the seven slope runs with a 60-second timeout. The combined wall time was about 0.44 seconds. Closure is recorded separately from the order witnesses.

| $s$ for $a+s\mu$ | Outcome | Provisional rows | Abelianization |
| ---: | --- | ---: | --- |
| $-3$ | Cap reached | 20,000 | $C_{20}$ |
| $-2$ | Cap reached | 20,000 | $C_{14}$ |
| $-1$ | Cap reached | 20,000 | $C_8$ |
| $0$ | Closed at 6 | 289 | $C_2$ |
| $1$ | Cap reached | 20,000 | $C_4$ |
| $2$ | Cap reached | 20,000 | $C_{10}$ |
| $3$ | Cap reached | 20,000 | $C_{16}$ |

## Direct order witnesses at $s=0$

**Working project theorem and finite lower certificate.** Use E70’s notation $b_1=LbL^{-1}$, $b_{\mathrm{top}}=Fb_1F^{-1}$, $c_{\mathrm{top}}=FcF^{-1}$, $\lambda_F=c^{-1}b^{-1}L^{-1}$ and $\lambda_L=b_1^{-1}F^{-1}$. The slope relation $\lambda_L=L$ and $b^2=1$ give $L=F^{-1}b$ and $b_1=F^{-1}bF$. Thus $b_{\mathrm{top}}=b$ and $\lambda_F=cF$. Commuting $F$ with $\lambda_F$ gives $[F,c]=1$, and the filling relation $F^3\lambda_F^{-2}=1$ now reads $F=1$. Hence $L=b$, $c_{\mathrm{top}}=c$ and the outer relation reduces to $(cb)^3=1$. Every element now has a representative $(cb)^i c^j$ for $0\le i<3$, $0\le j<2$, since $c(cb)c=(cb)^{-1}$. This supplies the upper bound from the relators.

The explicit assignment $F=1$, $L=b=(12)$, $c=(23)$ in $S_3$ satisfies the original relators and sends the six representatives to distinct permutations. The independent checker [e02_e70_witness.py](e02_e70_witness.py) verifies this assignment using its own word interpreter, separate from the search. The order is six and the assignment is an isomorphism.

## Independent checks at the adjacent slopes

**Working project theorem.** At $s=1$, $\lambda_L=1$ gives $F=b_1$ and $F^2=1$. Set $q=\lambda_F$. Then $F=q^2$, $q^4=1$, $L=qc$, $b=cq^2c$, $b_{\mathrm{top}}=q^2$ and $c_{\mathrm{top}}=q^2cq^2$. The boundary translations become $d=(cq^2)^2$ and $f=(cq^2)^{-1}$. These substitutions work in both directions and give the presentation $\langle q,c\mid q^4=c^2=(cq^2)^7=1\rangle$, matching E70 §4. To see infinitude directly, map $q,c$ into the unit quaternions modulo $\{\pm1\}$ by

$$q\longmapsto (1+k)/\sqrt{2},\qquad c\longmapsto \sin(\pi/7)i+\cos(\pi/7)k.$$

The lifts of $q,c,cq^2$ have real parts $1/\sqrt2,0,-\cos(\pi/7)$, verifying the three torsion relations modulo sign. Twice the real part of the lift of $qc$ is $-\sqrt2\cos(\pi/7)$. Its square is $1+\cos(2\pi/7)$. The number $x=\cos(2\pi/7)$ satisfies $8x^3+4x^2-4x-1=0$ by summing the seventh roots of unity. This polynomial is irreducible over $\mathbb Q$ by the rational root test, so $x$ and $1+x$ are not algebraic integers. A quaternion of finite order modulo sign has eigenvalues that are roots of unity in its complex two-dimensional representation. Then the square of its trace is an algebraic integer. The image of $qc$ has infinite order.

**Finite image certificate at $s=-1$.** The same checker verifies the inherited $\mathrm{PSL}_2(\mathbb F_{29})$ matrix assignment in E70 §5 directly on the seven original relators, as well as a nontrivial commutator. This proves nonabelianness. The bounded run here does not settle the order.

## Uniform algebraic comparisons

**Working project theorem.** Abelianization imposes $2b=2c=0$ and $c=b$ by the outer relation, $3F+2L=0$ by the $F$-surgery relation, and $F=(s-1)L-b$ by the marked filling. Thus $b=(3s-1)L$ and $G_s^{\mathrm{ab}}=C_{2|3s-1|}$. Killing the two old meridians gives $C_{|3s-1|}$ also at the level of the original group: the slope solves $F=L^{s-1}$ after killing $b,c$, and the $F$-surgery relation imposes $L^{3s-1}=1$. The two commutators and outer relation are then identities.

For word comparisons one can reduce all slopes to

$$\left\langle L,t\ \middle|\ (tL^s)^2=1,\ (L^{1-s}t^2)^2=1,\ (L^{-s}t^2L^s t^{-2})^2=(t^3L)^3\right\rangle.$$

Indeed $t=cL^{-s}$ and the slope gives $b_1=L^{1-s}F$, $b=L^{-s}FL$, $\lambda_F=tF$. The $F$-commutator makes $F$ commute with $t$, and the $F$-surgery relation gives $F=t^2$. The two involutions become the first two displayed relators. Since $(L^{1-s}t^2)^2=1$, $b_{\mathrm{top}}=t^2 L^{1-s}=L^{s-1}t^{-2}$. Hence $d=b b_{\mathrm{top}}=L^{-s}t^2 L^s t^{-2}$ and $f=c_{\mathrm{top}}b_{\mathrm{top}}=t^3L$. Conversely set $c=tL^s$, $F=t^2$, and $b=L^{-s}FL$. The two square relations give $b^2=c^2=1$, the inverse $b_1^{-1}$ equals $b_1$, and $\lambda_L=L^{1-s}$ and $\lambda_F=tF$ follow. These imply the required commutators and ordinary filling, and the third relation restores the outer relation.
