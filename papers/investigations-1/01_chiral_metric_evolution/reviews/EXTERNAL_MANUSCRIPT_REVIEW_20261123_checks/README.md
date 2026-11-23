# Supporting checks for the external manuscript review of 23 November 2026

These scripts support [EXTERNAL_MANUSCRIPT_REVIEW_20261123.md](../EXTERNAL_MANUSCRIPT_REVIEW_20261123.md).
They were written for Edward B. Baker III by Claude (Anthropic, model `claude-fable-5-2`) during the review session,
from the manuscript's definitions only; none of the repository's own verification scripts was read or run.
Per the repository layout they could equally live in `numerics/`; they are kept beside the review so that the
review and its evidence travel together. Move them if preferred.

## What they do

Everything is tested through a fully nonlinear implementation, in stereographic coordinates on the round
four-sphere with sectional curvature `K = 0.8` (deliberately not 1), of the manuscript's definitions: symmetric-gauge
coframe, Levi-Civita spin connection, `A_i = -(1/2) eta_i,ab w_ab`, curvature, `mu_A`, `Q`, the reconstructed metric
(by Urbantke's formula, not by the manuscript's graph map) and the flow vector field
`-d_A^*[(4Q - (2/3) tr(Q^2)) F_A]`. First- and second-order statements are obtained by automatic differentiation
(JAX, float64), not by hand linearisation. Agreement is typically at the level `1e-13` to `1e-16` relative error.
The pointwise stationary form of Section 6.3 is implemented separately in `stationary_lib.py`, again from the
definitions, and compared with the manuscript's own kernel parametrisation.
The explicit examples of Section 12.2 (`check_12`, `check_13`) are run with `K = 1`, as stated in the manuscript.

Numbers below are those of the 159-page build of commit `df5b7b1`. Relative to the 155-page build of `04ef8d7` only
Section 12 is renumbered (former Props. 12.5-12.8 are now 12.7-12.10); relative to the 150-page build of `2c73984` also
Section 6 after Lemma 6.4; Sections 3-5 and 7-11 carry the same numbers back to the 39-page build of `ea004a9`.

| Script | Content |
| --- | --- |
| `sphere_lib.py` | shared nonlinear implementation |
| `stationary_lib.py` | shared implementation of the zero-speed map and of the form `R_Q` of (6.13) |
| `check_01_pointwise_algebra.py` | Sections 3, 4, 5, 9, 12: eta symbols, the two two-form bases, Lemmas 4.1-4.2, operator of Prop. 4.4, Lemma 5.1, (9.4)-(9.5), Props. 12.1-12.2, (3.15), Prop. 3.2 |
| `check_02_linear_flow_k2_modes.py` | Prop. 3.1; k=2 TT harmonics `h(X,Y)=C(x,X,x,Y)`; (1.3), (5.6), (8.1), (8.8), (8.10) |
| `check_03_linear_flow_generic.py` | generic local TT tensors, arbitrary metric variations, arbitrary connection variations: (5.5), (5.6), (7.5), (8.9), (8.10), (8.15), (8.16) |
| `check_04_nonlinear_identities.py` | Lemma 8.1 at a non-round metric; pointwise (6.5); Prop. 4.3; second-order expansions (5.17), (9.8) |
| `check_05_metric_gradient.py` | first-principles gradient of `P_met`: (6.2), Theorem 10.1 on k=2 modes, Schur averages, Prop. 11.1 end to end |
| `check_06_special_variations.py` | conformal and Lie-derivative variations, (5.9), (5.11) |
| `check_07_reviewer_remarks.py` | formulas proposed in the review (not statements of the manuscript) |
| `check_08_nonlinear_Q_equation.py` | Prop. 6.2: velocity, pointwise volume preservation, the full nonlinear `Q` equation (6.7) and the pointwise form of the energy identity (6.11), at finite distance from round; (4.26) |
| `check_09_stationary_spectral_form.py` | Lemma 6.4 on a grid (floating point; not a substitute for the exact certificate), cross-check of its kernel parametrisation (6.15) and block identity (6.16), and the reviewer's observation on the unconstrained form |
| `check_10_strain_curvature.py` | Prop. 4.6: (4.29) against the Riemann tensor of the reconstructed metric; sample values of (4.28); the operator in Section 6.7 |
| `check_11_sharp_spectral_range.py` | material added in `04ef8d7`: Lemma 6.5 (ratio 7/2, inertia, radical, sharpness), ingredients of Prop. 6.8, arithmetic and certificate consequences of Prop. 6.9, pairings and bounds of Prop. 6.10; reviewer's observations on `kappa(r)`, the optimal absorption constant and the unconstrained form |
| `check_12_local_jet_examples.py` | the explicit local connections of Section 12.2, Prop. 12.4 and Prop. 6.10, run through the actual flow vector field (old normalisation, `K = 1`) |
| `check_13_ratio_cap_examples.py` | material added in `df5b7b1`: Prop. 12.5 end to end at four ratios; for Prop. 12.6 the static part of the glued near-round datum, sampled at two values of `eps` (closeness to round, unique maximum of the ratio at the centre), and the time derivative at the centre |

## Running

```
pip install numpy scipy jax
bash run_all.sh        # about 10 minutes on two CPU cores; writes output.txt
```

[output.txt](output.txt) is the log of the run made for the review against commit `df5b7b1`
(2026-11-23T07:38:02Z; Python 3.13.18, numpy 2.5.3, scipy 1.18.1, jax 0.12.1): 183 `PASS` lines, 0 `FAIL` lines.

[output_pre_04ef8d7_20261123T0639Z.txt](output_pre_04ef8d7_20261123T0639Z.txt) is the earlier log (111 `PASS`, 0 `FAIL`)
of the first ten scripts, made while the reviewed manuscript was still commit `2c73984`. It is kept because its
`check_09` block already records the loss of positivity on the zero-speed space at eigenvalue ratio 3.5000, which
commit `04ef8d7` then added to the manuscript as Lemma 6.5.

## Limits

These are floating-point checks of local identities at sample points with random inputs, and grid evaluations of
finite-dimensional quadratic forms. They are strong evidence against algebraic and normalisation errors; they are not
proofs, they do not re-run the manuscript's exact Bernstein certificates, they say nothing about the analytic theorems
(existence, continuation, compactness, stability), and inequalities are only sampled, not established. The statement of
Prop. 12.6 is asymptotic in `eps`; sampling it at two values is a plausibility check of the construction, no more.
Lines beginning `reviewer:` record observations made in the review; they are not statements of the manuscript.
