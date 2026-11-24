# SP4-FOT-DIR-E44 · Round probability from weak Gram estimates · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Fixed E routing was gpt-6.2-sol / ultra.
Actual helper and selected lead model identifiers and reasoning
efforts were unavailable for independent verification.
[Request v1](SP4-FOT-DIR-E44_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Technical note](../../notes/DIR_E44_20261124.md).

**Completed under the supplied hypotheses.** The integrated Gram trace
is $\sum_i\nu_i/5\le1+\varepsilon$. Positivity of the Gram matrix and
the common target range bound give uniform $H$ norms for the tests
$(\partial_jF)(X)$ for every fixed smooth $F$. Testing $LX_i=\nu_iX_i$
and passing to a subsequence yields
$4\int x_iF\,d\mu=\int\sum_j(\delta_{ij}-x_ix_j)\partial_jF\,d\mu$.
The supplied radial error puts the limit on $S^4$.

Round probability satisfies this identity by the intrinsic
divergence of $e_i-x_ix$. Choosing $F=\partial_iP$ and summing
gives $m(m+3)\int P\,d\mu=\int\sum_i\partial_{ii}P\,d\mu$
for homogeneous $P$ of degree $m\ge1$. This gives all polynomial
moments inductively, and polynomial density gives uniqueness.
The full sequence of joint laws therefore converges weakly to
round probability.

The direct fixed-threshold radial exceptional-volume bound follows
from the supplied $L^2$ radial error. The result concerns weak joint
laws and supplies no strong differential or smooth-topology control.
HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc` and all six frozen
working-tree digests matched. Return to B22 with the conditional
weak-limit identification verified.
