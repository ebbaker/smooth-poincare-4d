# E171/E173 assessment — Small intrinsic strain forces pinching

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Selected lead retained; actual lead model/effort
unavailable. Helpers configured gpt-6.2-sol/ultra, with no independent
runtime attestation. The lead read the full derivation, independent audit
and both returns, and checked their hashes.

Accept [E171](../notes/171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md)
with [E173](E173_SMALL_STRAIN_SPECTRAL_AUDIT_20261122.md).
For a smooth definite positive-plane, round-compatible connection on a
smooth closed connected simply connected oriented four-manifold with
H2(M;R)=0, use the native metric and negative Killing pairing. There is
a universal positive threshold epsilon, exactly E171 (14), such that
sup G≤epsilon, G=|nabla^A T|+|T| squared, gives the pointwise bound
|Q−I|≤72G and Ric≥3g/4. Equivalently the sufficient real-sphere
condition is sup Psi≤(4pi/5)epsilon/(1+4sqrt(3)).

The threshold is defined using the positive minimum of an explicit
polynomial on a specified compact simplex complement, together with
the displayed plane-curvature and Ricci thresholds. No optimization
or numerical evaluation of that minimum was performed or needed.

The full covariant Hessian estimate is
|nabla^(2,A)Q|≤6sqrt(3)|nabla^A T|+36sqrt(3)|T| squared.
Exterior alternation has norm at most sqrt(2) in the ordinary
two-form convention. The exact squared curvature commutator is
sum_cyclic lambda_i(lambda_j−lambda_k) squared =3s2−9s3.
Its only nonnegative trace-three zeros are the round point and
the three rank-one vertices. Compact separation and connectedness
select one spectral neighborhood globally under the threshold.

The rank-one neighborhood has a top gap exceeding two. Its global
unit eigenvector v exists by simple connectivity and satisfies
|D_A v|≤3|T|. For the induced oriented plane connection the exact
global closed curvature is
Omega=<F,v>/sqrt(2)−beta1 wedge beta2.
The self-dual leading term has norm at least sqrt(5)/2; the
quadratic error has norm at most 9G/2. The stated smallness gives
Omega wedge Omega≥(5/8)dV, contradicting exactness and Stokes.
This argument supplies the eigenvalue neighborhood instead of
assuming a lower eigenvalue bound. The remaining neighborhood
gives the constant 72 and the stated native Ricci lower bound.

No diameter, Sobolev inequality, full-curvature bound or metric
compactness is used. The result is a static criterion for existing
smooth definite data; it does not construct such data. It discharges
the H_small premise in the separately issued conditional E174
combination, whose dynamical argument still requires its own audit.
Neither novelty nor independent specialist verification is claimed.
The auditor's authorship of inherited E145/E155/E157 is disclosed;
it independently recomputed the new E171 algebra and plane curvature.

## Verified evidence

| Artifact | SHA-256 |
| --- | --- |
| [E171 note](../notes/171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md) | 4fc28853a3866f7094aa67471c4e1df40f56ac4a516146a752fd33df624f7e60 |
| [E171 return](../research-progress/handoffs/SP4-CME-E171_RETURN_v1.md) | 9b675be37b8e75675f3c5e4ded1f678b01882d17cf3545a533602cb0374a96be |
| [E173 audit](E173_SMALL_STRAIN_SPECTRAL_AUDIT_20261122.md) | bd2375c6a7d8b97d3c78551667caceb7d1635be5564c5a6c845f7b58dae7b981 |
| [E173 return](../research-progress/handoffs/SP4-CME-E173_RETURN_v1.md) | c13ede1a9452cfa652a302c731a5c98c5f159558d487ddc6338a863a3bcb58ea |
