# SP4-CME-E02C return v1 — volume and local connection-jet tests

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. Return to [request v1](SP4-CME-E02C_REQUEST_v1.md).
Results and source passages are in the
[derivation note](../../notes/04C_VOLUME_AND_JETS_20261122.md).

## Pointwise reconstructed volume

Verified by two routes. The first contracts the Bianchi-reduced flow
against its self-dual curvature and uses \(\operatorname{tr}(Qd_A R)=0\).
The second uses gradient orthogonality to \(\iota_XF\) from diffeomorphism
invariance with arbitrary compactly supported \(X\). For the unadjusted
flow, \(\sum_i v_i\wedge F_i=0\), hence \(\partial_t\mu_A=0\) as a four-form
in fixed base coordinates. A pure internal gauge term preserves this
conclusion. A base drift \(\iota_X F\) instead gives
\(\partial_t\mu_A=\mathcal L_X\mu_A\). An arbitrary variation gives a
locally exact volume derivative. A time-independent determinant still
requires separate estimates for anisotropy, curvature and noncollapse.

This result applies to actual smooth definite unadjusted solutions on their
intervals of existence. Manuscript `rec:invariant-velocities` remains the
right general-path identity. The specific claim after `flow:gradient` that
the total volume is constant while density may vary needs revision in the
unadjusted setting. The lead owns any revision. Initial volume densities can
of course vary across base points and between initial connections.

## Realizable adverse minimum-eigenvalue jet

Verified at \(K=1\), \(Q_* = \operatorname{diag}(1/2,1,3/2)\), and
\(H=\operatorname{diag}(1/16,-1,15/16)\). The fixed-covector variation map
has an explicit right inverse and a seven-dimensional kernel. The cubic
perturbation of an affine connection produces Hessian change
\(T\delta_{ab}H\) with all lower jets fixed. The smallest eigenvalue has
Hessian \(b+TI_4/16\) and initial velocity equal to its fixed baseline
velocity minus \(2T/3\). For sufficiently large finite \(T\), it has a
strict local spatial minimum and a negative initial derivative under the
flow vector field. Definiteness holds on a sufficiently small local ball.
This disposes of the local constraint concern in B01. The test does not
construct a flow trajectory, a global definite extension, or a singularity,
and puts no bound on preservation under additional hypotheses.

## Frozen input identities

| Input | Checked SHA-256 |
| --- | --- |
| `manuscript/chiral_curvature_and_metric_evolution.tex` | `4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0` |
| `reviews/E01_FOUNDATION_ASSESSMENT_20261122.md` | `83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6` |
| `brainstorm/notes/B01_NONLINEAR_Q_DECISION_20261122.md` | `a9a8d2640a50437278079b49fd69e54a6e2d1ab13d339222912468391a1e1d54` |
| `research-progress/handoffs/SP4-CME-E02C_REQUEST_v1.md` | `f938cb4ed143598d395958debc6744f373702c94018aeb82282db4f260d707dd` |

[Fine v2](https://arxiv.org/html/1111.5005v2) passages checked on the
research date were §3.2, Lemma 3.2, §3.3, Lemmas 3.3–3.5, and §4.1,
Proposition 4.2. The exact volume proof and cubic jet were independently
recomputed. No numerical artifact or specialist-review claim is included.
