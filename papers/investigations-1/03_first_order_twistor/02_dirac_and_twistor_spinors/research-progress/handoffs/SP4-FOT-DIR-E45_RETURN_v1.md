# SP4-FOT-DIR-E45 · Aubry sphere theorem comparison · return v1

24 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing in [request v1](SP4-FOT-DIR-E45_REQUEST_v1.md)
was `gpt-6.2-sol` / `ultra`. Actual helper and selected lead model
identifiers and reasoning efforts were unavailable. Observed HEAD
`f178fbb604f7f972b639fa8c1fc05f649c9bc8fc` and verified all five frozen
working-tree digests. The [check][audit] records the source passages and
the scaling.

**Pass.** Aubry’s published Theorem 1, p. 388, uses the first \(n\)
positive eigenvalues counted with multiplicity, so \(\lambda_4\)
suffices in dimension four. The supplied pointwise Ricci inequality
gives \(\operatorname{Ric}_k\ge3k\) for \(k=(1-\delta)s g/12\).
Yamabe stability and the spectral pinching then give
\(4/(1-\delta)\le\lambda_i(k)\le4(1+\epsilon)/(1-\delta)\)
for \(1\le i\le5\). If \(4(\epsilon+\delta)/(1-\delta)<a_4\), with
\(a_4\) the dimension-four constant of Theorem 1, that theorem gives
a diffeomorphism type of standard \(S^4\) and a quantitative
Gromov–Hausdorff bound for \(k\).

The assumed Ricci inequality bounds all Ricci eigenvalues by
\((1-\delta)s/4\) below and \((1+3\delta)s/4\) above. At \(\delta=0\)
the metric is Einstein. The exact \(\epsilon=0\) quartic argument
already gives the round metric without this supplementary hypothesis.
The weak Gram and joint-law controls have not supplied the pointwise
Ricci premise. No new B escalation was triggered.

[audit]: ../../notes/DIR_E45_20261124.md
