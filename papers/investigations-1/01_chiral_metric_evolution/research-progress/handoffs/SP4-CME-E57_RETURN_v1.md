# SP4-CME-E57 return v1 — fixed compact-bundle critical estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. [Request][req] SHA-256 `6c0534183e51b35db255a9d0646e2a5e22049d29dfd7098f245c618824e79f5a`. All frozen input hashes matched. [Linear derivation][note] SHA-256 `8bc1cc7551e137d58324ce9f837c174d0766330f9d61586d14c6c24e4778a3d7`.

## Result

For a fixed smooth rank-one Hermitian coercive system on the closed four-manifold and bundle of the request, the stated \(s=1/2,p=8\) localized critical estimate holds. There is a complete \(E_T\) path space with unique strongly traced distributional solution, uniform in \(0<T\le T_0\). The constants use fixed coefficient and atlas bounds. No symmetry or spectral gap enters the proof.

- The fixed matrix semigroup bounds use the Hermitian norm differential inequality and iterated Duhamel differentiation of its symbol. Periodized annular kernels yield high-block decay \(e^{-c2^{2j}t}\), and finite low modes are bounded on \(T\le1\), including the undamped constant mode.
- Nested chart cutoffs support every zero extension. Actual coordinate/frame changes have bounded block transfer by their \(L^8,W^{4,8}\) bounds and the summable kernel \(\min(1,2^{4(j-k)})\). This compares the time supremum at each block as well as the \(L^1\) higher norm.
- The principal coefficient difference acts on \(D^2u_a\) in its own frozen chart, so only its small sup norm multiplies the high \(B^{5/2}\) norm before summing. The Lipschitz part of the coefficient multiplier uses \(B^2\), and overlap, cutoff and fixed lower terms use \(B^{3/2}\) and \(B^{1/2}\). Interpolation with the sup and top integral produces the factors \(T^{1/4},T^{1/2},T\). This closes absorption after fixing the cover, without placing an overlap constant on the principal small term.
- A global smooth Galerkin construction provides the approximating solutions. Smooth data density and the estimate give a Cauchy sequence in the complete localized space and a strong Besov and uniform initial trace. Uniqueness follows from the embedding into \(L^2 H^1\), the divergence-form energy for the homogeneous difference and its zero trace. The localized bound also gives \(L^1_tL^\infty_x\) control of the fixed covariant Hessian.

Disposition **fixed linear estimate proved in the stated class**. E53 supplies the periodic blocks and kernels, E54 the positive-order difference norm, and E41 the divergence-form Gårding argument, with the change to the fixed lower terms explicit. No new external source was needed. Nonlinear and geometric applications are separate from this packet. [Derivation][note].

## Consumed inputs

- E53 `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312`
- E54 `34924ef4445b1fc479b79c0f9d5452243c12ae399220e1e077b6e21bfed8073a`
- E41 `8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3`
- B38 `93a1ac866563979fa370e0e61edd629cfb35a097d5a275f0c9b44188299f0343`

[req]: SP4-CME-E57_REQUEST_v1.md
[note]: ../../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md
