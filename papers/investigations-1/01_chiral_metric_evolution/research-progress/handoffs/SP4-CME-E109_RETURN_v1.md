# SP4-CME-E109 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I did not author E47 or E21.
[Request][req]. [Derivation][note].

## Disposition

The fixed annular family gives the requested lower bound.
The self-dual part of \(da_*\) is \(f C\) with
\(f=\chi+r\chi'/4\). E47's normalized linearized defect
is therefore \(2fM\). For \(r_k=R^{-k}\),
\(\delta_N=N^{-1/2}\), and the prescribed finite sum,
disjoint support gives \(O(\delta_N)\) bounds for
\(\|a_N\|_\infty+\|da_N\|_\infty\) and the exact rate
\(\|T_N(0)\|_4=N^{-1/4}\|df_{\rm rad}\|_4>0\).

With heat coefficient one, the unit-atom diagonal
Hessian at the origin is
\[
 \mathcal H(s)=\frac{1}{1024s^5}\int_1^2
     r^5\chi(r)(r^2-12s)e^{-r^2/(4s)}\,dr .
\]
The signed formula follows by integration by parts from
\(r^3f=(r^4\chi)'/4\). It is positive for \(s<1/12\)
and negative for \(s>1/3\).
On \(I_k=[a r_k^2,b r_k^2]\), \(0<a<b<1/12\),
the own-scale Hessian has lower bound \(h_* r_k^{-2}\)
and the coarser atoms have the same sign.
Taking a fixed large \(R\) makes the finer atoms
negative and bounds their absolute total by half the
own-scale lower bound. The direct Gaussian gives
the power-four ratio bound, and the canceled formula
improves it to power six. The intervals are disjoint.
The fixed damping is bounded below on their union,
so \(J_{\rm lin}(N)\ge cN\delta_N=c\sqrt N\).
Each finite \(N\) has finite budget by the damped heat
sup bounds for the initial strain and its derivative.

The derivative in \(J_{\rm lin}\) is the full spatial
derivative of the strain one-form. The calculation
is a compatible frozen first-order pair with ordinary
\(d\) and independently prescribed nonzero \(F_0\).
It makes no claim about an actual round-bundle operator
or nonlinear flow. No primary source was newly used.
Only the named note and return were edited.

## File identities

The E47 and E21 frozen note digests matched. The B60
digest records the observed decision. E53 was not
needed in the derivation.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E109_REQUEST_v1.md | `962c3783918a5f30cc48f630f23bd240ca81ab72f81eff1aedc30b3cff2d4341` |
| B60_MULTISCALE_STRAIN_BUDGET_TEST_20261122.md | `85f70ca2c48fb0e905aa42ec409010cbb6024b39ed8a6d23be5b5543f24669d8` |
| 47_ROUND_STABLE_LINEAR_20261122.md | `ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6` |
| 21_LORENTZ_HEAT_BENCHMARK_20261122.md | `c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2` |
| 109_FROZEN_MULTISCALE_STRAIN_BUDGET_20261122.md | `360544867c56de98eda76d45cd7cf33ebd02631d95820e839b19500d6bb5e2a6` |

[req]: SP4-CME-E109_REQUEST_v1.md
[note]: ../../notes/109_FROZEN_MULTISCALE_STRAIN_BUDGET_20261122.md
