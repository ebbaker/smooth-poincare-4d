# B58 — Separate intrinsic pinching from residual horizontal oscillation

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Conceptual B decision by the selected lead; actual model/effort identifiers unavailable. This opens two bounded tests, not an accepted theorem.

The finite internal gauge and static gain in [B57](B57_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md) have returned and are under E101 audit. They control one connection derivative, but not the full curvature derivative or the horizontal slice. Two independent tests will make that boundary more precise.

## Intrinsic defect pinching without a slice

At the fixed round reference, the induced connection D0 on Sym0(E) has no parallel section. Indeed a parallel q commutes with the adjoint action of every curvature value; F0 spans so(3), whose standard three-dimensional representation has only scalar self-adjoint commutant, and trace-freeness removes that scalar. The fixed divergence inverse for D0*D0 should therefore give

    ||q||W1,(4,1) + ||q||C0 <= C ||D0 q||4,1.

For an actual connection A=A0+a in the small connection/curvature value tube, q=Q(A)-I satisfies exactly

    D0 q = nabla^A Q - [ad(a),q],
    |nabla^A Q| <= 6 |T(A)|.

Fixed/live metric and volume comparisons depend only on the value tube. A small ||a||C0 absorbs the last term. E102 should test the resulting W1,(4,1) and pointwise defect bound by live Lorentz strain, with neither d0*a nor S0*a imposed. If valid, small strain gives initial eigenvalue pinching throughout this value tube. This is static; it does not by itself control the temporal budget or prove a horizontal representative exists. The C0 norm of q is internally invariant; the fixed covariant derivative norm is not.

## A vertical Coulomb representative need not have a small critical pair

Modify E95's actual compactly supported round pullback with epsilon_n=n^(-1/4) and displacement delta_n=epsilon_n/n, n dyadic. The connection and curvature values tend to zero, Q=I, and T=0, but the curvature on an inner chart contains the oscillatory term epsilon_n cos(nx1) H(x), H=dx1 wedge i_(e2)F0 nonzero. Its localized B^(1/2)_(8,1) norm should grow like epsilon_n sqrt(n).

Apply the finite internal construction and static gain, if accepted. They give a smooth Coulomb representative b_n with ||b_n||W1,8=O(epsilon_n) and an internal gauge u_n with ||u_n-I||C1=O(epsilon_n), using Du=u a-bu. Such gauges cannot remove the leading curvature frequency: a dyadic multiplier commutator costs n^(-1)||Du_n||infinity, and the reference-curvature gauge correction has C1 size O(epsilon_n). E103 should prove the lower bound for the transformed curvature, including actual-bundle patching and fixed-atlas localization. A convenient block has symbol one near frequency e1; the fixed smooth amplitude and localized cutoff create only O(1/n) errors. This would show why the vertical regularity gain alone cannot replace the horizontal equation in E66. It would not obstruct finite horizontal placement: all input connections are explicitly on the round orbit.

Inputs: E66 SHA-256 09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66; E88 91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274; E95 1a5930ba2052e2f97d0c8fe869cc0f9a0407509ad9182c33a6efbea60e4b59af; E98 06c883cc5a6626f4748c218b75633ce1cdb947758b04f923b2255ca207251bf4; E99 6785cff000ac53238e95ef2254b0f06aa868636d91b9107400215eff6a116330. No new external source or novelty claim is used by this decision.
