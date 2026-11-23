# B43 — Test intrinsic strain control in a specified round slice

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable.

The critical pair norm is stronger than the geometric strain norm because fixed derivatives see internal gauge and coordinate directions. Test the missing elliptic estimate after explicitly removing those directions, without assuming that an arbitrary small-value connection can be moved into that slice.

Fix the native round reference and write a=A−A0. Require exactly S0* a=0 and d0* a=0, the fixed orthogonality conditions to the infinitesimal horizontal and internal automorphism directions. For the positive E47 operator G0, these imply G0a=d0*P0*P0d0a. With beta=F_A−F0, the algebraic curvature map near the parallel reference has

    Q(F0+beta)−I = 2 tf L0 beta + R(beta),
    beta = d0 a + [a wedge a]/2,

where R=O(beta²) and D0R=O(|beta||D0beta|). Differentiating the exact relation should express G0a in D0q and these nonlinear errors. The full covariant derivative satisfies D0q=nabla_A q−[ad(a),q]. E03 controls nabla_A Q by T. Since q is itself bounded by a first derivative of a and a², small values of a and beta should make every remaining term absorbable in a fixed W^(2,(4,1)) estimate for G0.

Freeze E66 on this implication. First establish the fixed elliptic Lorentz estimate from actual L2 and L8 bounds for D0^j G0^−1, j≤2, then a layer decomposition at exponent4. A direct local matrix Calderón–Zygmund proof at p8 is allowed; no endpoint theorem may be imported by name. E47 already supplies the positive L2 realization. The target is

    ||a||W^(2,(4,1)) <= C ||T(A)||L^(4,1)(g_A)

under a sufficiently small fixed C0 bound on a and beta and the exact slice conditions. All constants are tied to the fixed round geometry.

Then test whether this controls the initial pair's localized B^(1/2)_(8,1) norm linearly. E53's high-block proof uses only the full gradient, and its finite low block can be estimated by an L1 norm instead of L8. Localize that strengthened version. D0beta is controlled by D0²a and a D0a; fixed cutoff/frame lower terms are retained. This may give the full critical pair norm directly without first proving a separate endpoint C1 embedding.

This is a concrete conditional reduction of full-gradient data to the real strain in a specified slice. It is not a slice-existence theorem. Removing the slice hypothesis would require a separate construction with appropriate regularity and quantitative estimates; a formal infinitesimal decomposition or a high-Sobolev slice theorem cannot automatically supply it under these low-order assumptions.
