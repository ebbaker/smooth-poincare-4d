# SP4-FOT-DIR-E43 · Weak differential Gram estimate under directional moment pinching · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing: gpt-6.2-sol / ultra. Actual helper
and selected lead model identifiers and reasoning efforts were unavailable.
[Request v1](SP4-FOT-DIR-E43_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Derivation](../../notes/DIR_E43_20261124.md).

**Completed.** HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc` and
all six frozen working-tree digests matched.

1. The sign-averaged squared Yamabe deficit has leading second
   coefficient $4\delta$ for $\delta=\int\Gamma(\phi,\phi)-1\in[0,\varepsilon]$.
   Its fourth coefficient is $\mathcal C_\phi(w)+12\delta+4\delta^2$,
   with $\mathcal C_\phi$ as in the exact first-eigenfunction calculation
   for a unit directional test. The explicit sixth and eighth
   terms are $O(t^6)$ on bounded $H$ sets by the supplied minimizing
   inequality and $H\to L^4$.
2. Taking $t=\varepsilon^{1/4}$ gives
   $\mathcal C_\phi(w)\ge-C\sqrt\varepsilon$. The supplied fourth
   moment and $r$ bounds give
   $\mathcal C_\phi(\phi^2-1)=O(\sqrt\varepsilon)$. In the directions
   $w=\phi^2-1\pm\varepsilon^{1/4}\zeta$, the quartic functional's
   linear term is the pairing with $8(L-5/2)(\phi^2-1)$.
   This proves $\|(L-5/2)(\phi^2-1)\|_{H^*}\le C\varepsilon^{1/4}$.
   The residual pairs to zero with constants.
3. The product rule and polarization give, for all entries and
   with constants allowed as tests,
   $\|\Gamma(X_i,X_j)-(\delta_{ij}-X_iX_j)/4\|_{H^*}
    \le C\varepsilon^{1/4}$, where $X_i=u_i/\sqrt5$.

The directional pinching, uniform $L^\infty$ bound and residual
bound are supplied hypotheses. The packet is independent of E42
and establishes the weak differential comparison on those inputs.
