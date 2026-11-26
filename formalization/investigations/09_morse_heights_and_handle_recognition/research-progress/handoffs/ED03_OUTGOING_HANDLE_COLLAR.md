# HT-E06g · The actual one-handle outgoing height collar

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual worker model and reasoning effort were unavailable. Base commit `5706ef811adc3691fd85e75507a0a399cb81d18d`. The working inputs were `EndHandleBands.lean` at SHA-256 `e5ed60df91de130f8f4203bba83cb5f5fe8cf7f1e5e4c4a69e762bd3437d31f0` and `NativeHeightCollar.lean` at `33b435d9ffc5235923b43a10fec0950e3cdb2c878a91768b59a9b856d53108c7`. [Route register](../REGISTER.md)

For the chosen isolated index-one trace `D`, take the point in its existing Morse chart with zero negative coordinate and positive coordinate $\sqrt{2\epsilon}$ times the first standard basis vector. Its squared Morse norm is $2\epsilon\le R^2$ by the attaching-radius bound on the same trace. The preserved normal form gives height $c=f(p)+\epsilon$. The returned `outgoingAxisPoint` is therefore on the actual outgoing regular level in the original manifold.

`exists_outgoingSignedHeightCollar` applies the signed height collar to this point and the regularity field of the same trace. For some $\rho>0$, it maps the full product of the outgoing level with $(-\rho,\rho)$ diffeomorphically onto the full open band $f^{-1}(c-\rho,c+\rho)$. At zero it is the level inclusion, and it satisfies $f(\Phi(x,t))=c+t$ throughout its source and $(\Phi^{-1}(y))_2=f(y)-c$ throughout its target.

`exists_outgoingMarkedComparison` uses the uniqueness of the critical point on the original isolating band to show regularity all the way from $c$ to its upper endpoint. It supplies the ambient regular-flow diffeomorphism and its two smooth native restrictions with both inclusion identities. The collar of the outgoing height is available independently of that comparison's wider uniqueness hypothesis. Comparison to a prescribed rounded rim and its signed collar remains geometric input. [Lean source](../../../../SmoothPoincare/Heights/OutgoingHandleCollar.lean) · [Native signed collar](../../../../SmoothPoincare/Heights/NativeHeightCollar.lean)

## Checks

`lake build SmoothPoincare.Heights.OutgoingHandleCollar` passed with 9,978 jobs. The source SHA-256 was `b8c7a2c9441a6e97e718151e21c7996c5d98fc577ee0723be51365ce3ccccfcf`. A separate import checked the exact outgoing height, the complete open source and target equations, the forward and inverse signed height equations, and the marked comparison to the next cut. All four public declarations report only `propext`, `Classical.choice`, and `Quot.sound` under `#print axioms`. [Package pins](ED03_MARKED_MORSE_FEET.md)
