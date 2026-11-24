# SP4-FOT-DIR-E18 · Hopf connection and a coexact eigenvalue obstruction · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing: gpt-6.2-sol / ultra. Actual helper
and selected lead model identifiers and reasoning efforts were unavailable.
[Request v1](SP4-FOT-DIR-E18_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Derivation](../../notes/DIR_E18_20261124.md).

**Completed.** HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc`
and all seven frozen working-tree hashes matched.

1. For the declared unit Hopf map and $\alpha=\operatorname{Im}(z^*dz)$,
   the integral cohomology hypothesis supplies a smooth lift. The scalar
   Poisson equation fixes the phase to Coulomb gauge, and $H^1(M;\mathbb R)=0$
   gives a unique coexact primitive $a$ and lift unique up to constant
   phase. The exact identities are $|dz|^2=|dF|^2/4+|a|^2$ and
   $da=F^*\omega/2$ for the declared target orientation.
2. Balance gives $\int zz^*=I/2$. With $m=\int z$, equality in
   $|m|^2\le1/2$ would put $F$ in a great circle. Independently, the
   global angle of a circle-valued eigenmap is harmonic on this
   domain, contradicting the positive eigenvalue. Thus
   $\|a\|_2^2\ge\lambda(3/4-|m|^2)>\lambda/4$.
3. With $\sigma_i$ the two singular values of $dF$, the area bound
   $|F^*\omega|=\sigma_1\sigma_2\le\lambda/2$ is an equality
   exactly at equal singular values. The coexact Rayleigh quotient
   gives $\lambda_{\mathrm{coex}}^{(1)}
   \le\lambda/[16(3/4-|m|^2)]<\lambda/4$. Equality in scalar
   Poincaré would give $\Delta z=\lambda(z-m)$ and, in Coulomb
   gauge, would force $m=0$.

At the Yamabe equality $s_g=3\lambda$, the necessary condition is
$\lambda_{\mathrm{coex}}^{(1)}<s_g/12$. An independent lower bound
at that threshold on the supplied metric would give an exclusion.
This return supplies the comparison on the fixed great-$S^2$ case
for the B12 assessment. The derivation records the checked Chern
classification and Hodge-theory passages and their hypotheses.
