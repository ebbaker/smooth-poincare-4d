# SP4-CME-E76 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E50 and
previously audited E47/E48 in E51. See the [request][req]
and [derivation][note].

## Disposition

For each supplied smooth datum in the fixed E49 \(m=6\) basin,
the adjusted stable solution decays exponentially to \(A_0\)
in every fixed \(H^k\), \(k\ge6\), with rate
\(\alpha=\lambda_1(G_0)/2\) from E49. The higher constants can
depend on the datum and order. The fixed basin needs only the
original \(H^6\) smallness.

- On the E48 exact second-order remainder, the chart product
  estimate allocates \(H^{k-1}\) to one factor and \(H^3\)
  to the other. Fixed-\(H^5\) jet composition bounds at order
  five start an induction that includes explicit \(x\)
  and cutoff derivatives. The mean-value coefficient
  difference and quadratic Taylor lower remainder give
  \[
   \|N(a)\|_{H^{k-1}}\le C_k\big(
     \|a\|_{H^k}\|a\|_{H^5}+
     \|a\|_{H^4}\|a\|_{H^{k+1}}+
     \|a\|_{H^4}\|a\|_{H^k}\big)
   \le C'_k\|a\|_{H^6}\|a\|_{H^{k+1}} .
  \]
- For \(J=I+G_0\) the weighted graph-energy dual pairing uses
  \(J^{(k-1)/2}e^{\alpha u}N(a)\) and
  \(J^{(k+1)/2}e^{\alpha u}a\).
  The spectral inequality \(G_0-\alpha I\ge\theta J\) with
  \(\theta=(\lambda_1-\alpha)/(1+\lambda_1)>0\) absorbs the
  nonlinear term after a finite \(k\)-dependent time, since
  the \(H^6\) norm decays. The starting high energy on that
  tail is finite by smoothness.
- The actual stable generator
  \(\xi_{\rm st}(B)=-\delta_0a-\chi_B(\Delta_0S_0^*a)\)
  has \(C^r\) norm at most \(C_r(\|a\|_{C^{r+2}}+\|a\|_{C^{r+2}}^2)\).
  It therefore decays and is integrable in every fixed \(C^r\).
  The derivative ODE for \(j_{\rm st}\) gives bounded
  derivatives and exponential \(C^r\) convergence at each
  finite order. The Jacobian bound and compactness give a
  smooth equivariant automorphism with smooth inverse over an
  orientation-preserving base diffeomorphism. The inverse
  derivative induction uses one additional limiting direct
  derivative to control moving evaluation points. It gives
  exponential inverse convergence at each finite order.
- In E50's smooth small-value basin with the transfer set
  at \(m=6\), the local recovery is finite and smooth.
  With \(c=g_{\rm loc}(\tau)\), the limiting left-action
  automorphism is \(g_\infty=cg_{{\rm st},\infty}\).
  The limiting original pair is
  \((j_{{\rm st},\infty}c^{-1})^*(A_0,F_0)\).
  The original pair converges exponentially in each fixed
  \(C^r\) on the tail, using \(C^{r+1}\) convergence of
  the direct maps and the stable curvature identity.

Rates use native elapsed time, and constants at a fixed order
may depend on finite higher norms of the given smooth path
and the finite local recovery. No uniform high norm over a
small-value ball, rough initial recovery, nonlinear slice
or arbitrary-sphere conclusion follows in this packet.
No new primary source was inspected or used. Only the
designated derivation and return were edited.

## File identities

The four frozen digests matched the request before use.
The B46 digest records the observed conceptual input.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E76_REQUEST_v1.md | `15e83007e0728869df7eb263abab5c9996c98366bd137f2c0fa3b31e8d47788c` |
| B46_HIGH_ORDER_STABLE_TAIL_20261122.md | `ddff9e9925afc1fdb4f3fc81c3578669d61e8486cd7c8a2b5333d82fa7750caa` |
| 47_ROUND_STABLE_LINEAR_20261122.md | `ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6` |
| 48_FIXED_STABILITY_GAUGE_20261122.md | `b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b` |
| 49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md | `45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16` |
| 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md | `ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf` |
| 76_HIGH_ORDER_STABLE_LIMIT_20261122.md | `2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0` |

[req]: SP4-CME-E76_REQUEST_v1.md
[note]: ../../notes/76_HIGH_ORDER_STABLE_LIMIT_20261122.md
