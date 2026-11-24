# SP4-FOT-DIR-E38 · Multiplicity and recognition from a sharp directional moment · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The request routing was gpt-6.2-sol /
ultra. Actual helper and selected lead model identifiers and reasoning
efforts were unavailable for independent verification.
[Request v1](SP4-FOT-DIR-E38_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) ·
[Technical note](../../notes/DIR_E38_20261124.md).

**Completed.** HEAD was f178fbb604f7f972b639fa8c1fc05f649c9bc8fc
and all six frozen working-tree digests matched. For a real orthonormal
first eigenbasis $u=(u_1,\ldots,u_d)$ on the volume-one domain,
\[
 \frac{3d}{d+2}
 \le \frac{3}{d(d+2)}\int_M|u|^4\,dV_g
 =\mathbb E_{|c|=1}\int_M(c\cdot u)^4\,dV_g
 \le \frac{15}{7}.
\]
Thus $d\le5$. At $d=5$, $|u|^2=5$ everywhere and every direction
attains its fourth-moment bound. The assumed eigen-equation for
centered squares and polarization give
$\langle du_i,du_j\rangle_g=(\lambda/4)(5\delta_{ij}-u_i u_j)$.

The normalized basis map $U=u/\sqrt5$ has
$dU dU^*=(\lambda/4)(I-UU^\top)$, so is a homothetic local
diffeomorphism. Compactness and simple connectivity make it a
diffeomorphism onto $S^4$, with $U^*h=(\lambda/4)g$ and
$\lambda=4\operatorname{Vol}_h(S^4)^{1/2}$. Every first eigenmap
$F:M\to S^4$ when $d=5$ is $AU$. The quadratic form of $A^\top A$
equals one on the entire image sphere, so $A\in O(5)$. These
maps have degree $\pm1$ when oriented. Full span gives $d\ge5$
algebraically and hence triggers this conclusion under the two
premises.

For an E14 limit on a supplied metric satisfying both premises,
the remaining degree-zero case must have proper span, $d\le4$,
and a nonround metric. A separately recognized round metric
admits only full-span first eigenmaps. The underlying smooth
manifold could be standard and admit a different round metric.
Both moment premises hold in the round model. Their derivation
from Yamabe minimization is outside the conditional E38 proof.
