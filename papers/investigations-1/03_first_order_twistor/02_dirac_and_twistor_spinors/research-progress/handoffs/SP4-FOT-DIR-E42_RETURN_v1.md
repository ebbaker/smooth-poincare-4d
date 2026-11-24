# SP4-FOT-DIR-E42 · Uniform eigenfunction and fourth-moment estimates · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The request routing was gpt-6.2-sol /
ultra. Actual helper and selected lead model identifiers and reasoning
efforts were unavailable for independent verification.
[Request v1](SP4-FOT-DIR-E42_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) ·
[Technical note](../../notes/DIR_E42_20261124.md).

**Completed.** HEAD was f178fbb604f7f972b639fa8c1fc05f649c9bc8fc
and all six frozen working-tree digests matched. On the supplied
unit-volume Yamabe minimizer with the normalized five-eigenvalue
cluster, testing against dyadic powers gives
$\|u_i\|_{2p}\le(1+2p)^{1/p}\|u_i\|_p$. The finite iteration product
gives universal $\|u_i\|_\infty$ bounds and
$\|(L-1)\phi\|_\infty\le C\varepsilon$ for unit combinations $\phi$.

The mean of the squared deficits at $1\pm t\phi+t^2w$ has quadratic
term $4\delta t^2$, where $\delta=\int_M\Gamma(\phi,\phi)-1$, and
quartic term $(\mathcal C_\phi(w)+12\delta+4\delta^2)t^4$, with
\[
 \mathcal C_\phi(w)=9-q+4\int_M\Gamma(w,w)
   -4\int_Mw^2-12\int_M\phi^2w,\qquad q=\int_M\phi^4.
\]
The remainder is $O_K(t^6)$ for mean-zero $\|w\|_H\le K$ and $|t|\le1$.
At $w=\phi^2-1$ the coefficient $\mathcal C_\phi(w)$ is
$25-(35/3)q+(16/3)\int_M\phi^3(L-1)\phi$.
Taking $t=\varepsilon^{1/4}$ yields the one-sided
$q\le15/7+C\sqrt{\varepsilon}$ in every direction.

For $S=\sum_i u_i^2$, the coefficient-sphere mean of $q$ is
$15/7+(3/35)\int_M(S-5)^2$. This gives
$\int_M(S-5)^2\le C\sqrt{\varepsilon}$. The nonnegative excess
quartic over each directional value has average
$O(\sqrt{\varepsilon})$ and hence uniform size
$O(\sqrt{\varepsilon})$ by fixed-dimensional norm equivalence.
Thus $|q-15/7|\le C\sqrt{\varepsilon}$ in every unit direction.
All bounds use the supplied cluster and normalized Sobolev
inequality.
