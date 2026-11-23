# B44 — Isolate the linear slice before attempting a nonlinear gauge

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort preserved; actual identifiers unavailable.

[E66](../../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md) derives a static strain estimate under two imposed slice equations. Its independent E70 audit is pending. Even an accepted estimate would not produce those equations for a given connection. A low-order nonlinear slice theorem would need a controlled automorphism and preservation of the connection and curvature value tube.

First isolate the linear problem at the fixed native round reference. Put S=S0, d=d0 and Pi=I−S(S*S)^−1S*. This is a smooth parallel orthogonal projection. For a smooth one-form a solve

    K phi = d* Pi a,      K=d* Pi d,
    phi perpendicular to ker K,
    u=(S*S)^−1 S*(a−d phi),
    a_sl=Pi(a−d phi).

The symbol intersection already checked for G0 should make K elliptic. Its kernel need not be declared zero: the round automorphism stabilizer is relevant. The forcing is orthogonal to the kernel, because Pi d psi=0 there. The selected solution should give S*a_sl=d*a_sl=0. Establish the projection, its exact kernel/range, and the mixed Sobolev estimates: phi gains one derivative relative to a, while u and a_sl have the same order as a. No stabilizer dimension is needed for this packet.

This is fixed E71 work. Use the assessed round symbol and elementary compact elliptic energy/local regularity, stating any pseudoinverse construction explicitly. Prove H^m bounds for integers m≥0 and the exact decomposition/uniqueness modulo the kernel. Do not silently infer a nonlinear slice from the result.

The distinction matters because a finite automorphism acts by composition and pullback. The horizontal parameter has no derivative gain in this linear decomposition, while differentiating a finite pullback involves a derivative of the field being moved. A formal Banach implicit-function argument at one unchanged low regularity can therefore lose derivatives. That observation alone proves neither impossibility nor existence; the next conceptual decision must identify a genuinely compatible function-space construction or a different way to reach a controlled slice.

No new primary theorem or global geometric conclusion is imported by this decision. The relevant accepted inputs are [E47](../../notes/47_ROUND_STABLE_LINEAR_20261122.md) and its [E51 audit](../../reviews/E51_STABILITY_INPUTS_AUDIT_20261122.md).
