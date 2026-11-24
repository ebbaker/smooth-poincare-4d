# SP4-FOT-DIR-E37 · Quartic test at a Yamabe-minimizing metric · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing: gpt-6.2-sol / ultra. Actual helper
and selected lead model identifiers and reasoning efforts were unavailable.
[Request v1](SP4-FOT-DIR-E37_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Derivation](../../notes/DIR_E37_20261124.md).

**Completed.** HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc` and
all six frozen working-tree digests matched.

On the supplied unit-volume Yamabe minimizer with $s=3\lambda_1$,
write $m_j=\int\phi^j$ for a real first eigenfunction. The squared
deficit of $1+t\phi+t^2w$ has cubic coefficient $-4m_3$ and fourth
coefficient
\[
 \mathcal C_\phi(w)=\tfrac4{\lambda_1}\int|dw|^2-4\int w^2
                     -12\int\phi^2 w+9m_2^2-m_4.
\]
Both signs of $t$ give $m_3=0$, and polarization gives the vanishing
of all integrated triple products on the first eigenspace.
The choice $w=\phi^2-m_2$ gives
$\mathcal C_\phi(w)=25m_2^2-(35/3)m_4\ge0$, so
$m_4\le(15/7)m_2^2$. Equality is equivalent to
$\Delta(\phi^2-m_2)=(5\lambda_1/2)(\phi^2-m_2)$.
Necessity follows by varying $w$ over the mean-zero space at the
zero of its nonnegative quartic coefficient. Sufficiency follows
from the gradient integral of the centered square.

The unit-volume round $S^4$ saturates the bound in every first
eigenfunction direction, with $m_2=|a|^2/5$ and $m_4=3|a|^4/35$
for $\phi(x)=a\cdot x$. The round minimizing hypothesis is checked
using Talenti's sharp Sobolev theorem. E37 uses no eigenmap,
topological assumption or variation of the metric itself.
