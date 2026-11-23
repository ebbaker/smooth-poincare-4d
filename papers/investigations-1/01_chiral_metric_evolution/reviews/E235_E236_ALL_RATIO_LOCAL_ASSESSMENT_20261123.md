# E235/E236 — All-ratio local maximum assessment

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead assessment, actual model/effort unavailable and preserved. Separate derivation and independent audit configured gpt-6.2-sol/ultra, independent runtime attestation unavailable. [Sole register](../research-progress/REGISTER.md).

## Accepted local statement

For every finite r>1, the prescribed explicit cubic connection on an oriented real four-ball is positive definite and round-compatible and has rho(Q)=r at its center and rho(Q)<r everywhere else on a sufficiently small closed ball. Its instantaneous original native directional derivative of log rho is exactly 1/2 at the center (that of rho is r/2). This is an actual smooth local connection and evaluation of the original vector field, without a produced local PDE solution or closed extension. It defeats the inference of a nonpositive original direction from the scalar ratio contact and its negative spatial Hessian alone at every such threshold. It does not establish global nonpreservation or a singularity.

In old K=1 conventions, Q_r=diag(a,1,b), a=2/(1+r), b=2r/(1+r), q=Q_r-I and d=2sqrt(r)/(r+1). The gradient on trace-free symmetric matrices is G=(r+1)diag(-2r-1,r-1,r+2)/(6r). With T=diag(a,-2,b), df(T)=0, L_QG=diag(-4,0,4), df(L_QT)=8(r-1)/(r+1), <G,L_QG>=2(r+1)^2/r and df(q)=(r^2-1)/(2r).

The prescribed mu=(r+1)[8(r+1)^2/r+24(r-1)/sqrt(r)+1]/[32(r-1)] and B=-G+mu T give df(B)=-|G|^2. The cubic connection cancels the affine curvature-quotient Hessian d q/2 and realizes ordinary Hessian B delta_ab with all first curvature/metric/quotient jets zero. Differentiating the actual velocity gives Qdot=4L_QB-24d q, so df(Qdot)=1 exactly. Native g=2ghat and time tau=2t halve this derivative. Taylor's theorem gives a small strictly pinched ball; all radii and coefficient sizes may depend on r. No limit uniformity at r=1 or infinity is asserted.

## Lead review and independent calculation

The lead read the complete E235 proof and return and E236 audit and return, verified their frozen identities, and checked the gradient and coefficient cancellation directly. The scalar differential kills the internal Hessian commutator by [Q,G]=0. The mixed principal direction is nonzero for every r>1, which supplies the chosen positive offset despite the negative scalar spatial Hessian.

E235 derives the affine contraction from the symmetrized two-form pairing and differentiates velocity in components. E236 independently polarizes raywise curvature products to recover every Hessian slot and uses the contraction sum_p F_k(u,e_p)F_j(e_p,z)=s_k s_j<J_jJ_k u,z> for the velocity reaction. Both retain the differentiated internal connection, giving curvature tangent 12(d/s_i)q_i Sigma_i and quotient tangent -24d q. Shared inherited velocity/reconstruction formulas and prior authorship are disclosed. The E215/E217 specific 9/4 datum stays preserved; it is not silently relabeled as this new all-r family.

No new primary source or numerical campaign was used. The canonical reference record should identify this as a further branch consumer of the inspected Fine gradient. No novelty certification is claimed.

## Frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [brainstorm/notes/B109_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md](../brainstorm/notes/B109_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | `64a38e686f1a56da4916fc534a51ded2d3c729cfab046a8afeb59dc84e56eaa4` |
| [notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md](../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | `4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d` |
| [research-progress/handoffs/SP4-CME-E235_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E235_RETURN_v1.md) | `c1e994a85760e68007b6865b929fe728e840ef95fcc6a5e59b1344e22031f357` |
| [reviews/E236_ALL_RATIO_LOCAL_MAXIMUM_AUDIT_20261123.md](../reviews/E236_ALL_RATIO_LOCAL_MAXIMUM_AUDIT_20261123.md) | `5a07d3caee02536a15b25dd4d130594b2aea6bfcc45e9d67fc43998d1a744b6a` |
| [research-progress/handoffs/SP4-CME-E236_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E236_RETURN_v1.md) | `abac5ea9dac505a0106f9ada6b191b030b5d5d41d5eae0bfee1523aaf65f719b` |
| [reviews/E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md](../reviews/E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md) | `26c877a82aa97c12fc85e95d58524301b2c1dbe2b58a1c8a3e6d5d2973679c4a` |
