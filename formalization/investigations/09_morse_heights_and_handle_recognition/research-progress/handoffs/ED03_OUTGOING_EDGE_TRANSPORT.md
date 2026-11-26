# HT-E07c · Signed transport of the outgoing edge marking

26 November 2026 UTC (25 November 2026, America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and effort are unavailable. Bounded execution over `a7bb158d6af806d2573a7702386622ed4c0bb1f1`. The supplying sources `OutgoingHandleCollar.lean` and `NativeHeightCollar.lean` have SHA-256 prefixes `b8c7a2c9441a6e97e718151e` and `33b435d9ffc5235923b43a10`. [Route register](../REGISTER.md) · [Intake and toolchain](../../../research-progress/handoffs/ED03_ROUNDED_EDGE_INPUTS_20261125.md)

## Comparison on the actual open bands

For the selected isolated one-handle $D$ on the compact Hausdorff smooth boundaryless source, put $c=f(p)+D.\varepsilon$. Assume that $p$ is the unique critical point in the complete closed isolating band $[\mathrm{lo},\mathrm{hi}]$. The regular comparison supplies the ambient diffeomorphism $\Phi$, its actual closed-sublevel marking, and its native level restriction $d:f^{-1}(c)\to f^{-1}(\mathrm{hi})$. The outgoing axis point lies on $f^{-1}(c)$, and its image under $d$ supplies nonemptiness of the next level. The inherited `RegularEndMarked` evidence retains both sublevel/level inclusion equations. [Outgoing collar and marked comparison](../../../../SmoothPoincare/Heights/OutgoingHandleCollar.lean)

Let $A$ and $B$ be the native signed collars centered at $c$ and $\mathrm{hi}$. Their height coordinates are $c+t$ and $\mathrm{hi}+t$. Use the minimum of their two positive widths and $D.\varepsilon/2$ as a common positive radius $r$. The open-band diffeomorphism $T$ is the restriction of $B\circ(d\times\operatorname{id})\circ A^{-1}$. Its source and target are the full open inverse images $f^{-1}(c-r,c+r)$ and $f^{-1}(\mathrm{hi}-r,\mathrm{hi}+r)$. Both lie strictly above $f(p)$. On the zero sections $T,T^{-1}$ agree with $\Phi,\Phi^{-1}$. For any parameter $z$ of a tube $u$ into the outgoing level, the two maps satisfy

\[
 T\bigl(A(u(z),t)\bigr)=B(d(u(z)),t),\qquad
 T^{-1}\bigl(B(d(u(z)),t)\bigr)=A(u(z),t)
\]

throughout $(-r,r)$. The reversed height uses the same ambient bands and both equations with $-t$. Its normal coordinates are $-f+c$ and $-f+\mathrm{hi}$. The ambient forward and inverse signed shift equations hold on the complete bands for both choices of height. The smooth rounded-body comparison through the actual four-dimensional rim remains a further input to the end reduction. [Lean source](../../../../SmoothPoincare/Heights/OutgoingEdgeTransport.lean)

## Checks

`lake build SmoothPoincare.Heights.OutgoingEdgeTransport` passed in 9,980 jobs. The E07c source SHA-256 was `657292cf4f2f8eaad950c95fedee72ea810a43c6465255dc00bc11d53584ebe0`. The separate leaf-import replay checked the exact types of `outgoingNextCut_regular` and `exists_outgoingSignedBandTransport`. Both declarations reported `propext`, `Classical.choice` and `Quot.sound`. An application instantiated the two entire bands and replayed both maps on every parameter of an arbitrary outgoing marking in both normal orientations. It also verified that the reversed coordinates have forward heights $-c+t$ and $-\mathrm{hi}+t$. The application can be rerun in this workspace from `formalization/` with `lake env lean /tmp/sp4-e41-outgoing-replay.lean`. Its output SHA-256 is `e00da7bf618d059158c503e70d9cd3c3897d63faa3a023cd68a9ff6fda44ec13`.

## HT-E07g · The same collar on both comparisons

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort are unavailable. This bounded follow-on uses the E07c comparison and the rounded collar witness on the same isolated one-handle. [Rounded outgoing collar](ED03_ROUNDED_OUTGOING_COLLAR.md) · [Coupled transport](../../../../SmoothPoincare/Heights/OutgoingEdgeTransport.lean)

`exists_outgoingSignedBandTransport_fromCollar` accepts a specified full native outgoing collar $A$ of width $\rho$. Its hypotheses give the exact source and height band, the actual level inclusion at zero, and the forward and inverse height coordinates. The theorem constructs the next-cut collar $B$ and comparison $T$ using the same $A$, with the common width $r\le\rho$. The original `exists_outgoingSignedBandTransport` obtains its own $A$ and applies this result with its original statement.

`exists_roundedRimTransport_toNextCut` uses the very same $A$ in the rounded collar and the next-cut comparison. Let $R$ be the rounded-to-actual radial comparison and $\Psi$ the rounded collar. Its source is $U\times(-w,w)$, where $U$ contains every native rim mark $\beta(a)$ for $a\in S^0\times S^2$. The theorem retains the ambient regular comparison and its induced level map $d$, the full current and next-cut bands of $T$, and the exact restriction of the common strip to $s=\min(w,r)>0$. For every $(x,t)\in U\times(-s,s)$ it gives

\[
\begin{aligned}
 R\bigl(\Psi(x,t)\bigr)&=A(x,t),&
 T\bigl(R(\Psi(x,t))\bigr)&=B(d(x),t),\\
 T^{-1}\bigl(B(d(x),t)\bigr)&=A(x,t),&
 R^{-1}\bigl(T^{-1}(B(d(x),t))\bigr)&=\Psi(x,t).
\end{aligned}
\]

All four evaluations are in the specified partial diffeomorphism domains. The last point has rounded collar coordinates $(x,t)$. Its rounded defining function is $f(p)+t$ and the point at the next cut has height $\mathrm{hi}+t$. At $t=0$, the actual chart point of each entire marked rim maps to $d(\beta(a))$ and the inverse recovers the original point with its two rim parameters. The strict core-radius condition of the rounded collar ensures the common strip exists across all rim parameters. The smooth exterior comparison and the two marked body inclusion squares are still needed for an assembled end-body map. [Coupled transport](../../../../SmoothPoincare/Heights/OutgoingEdgeTransport.lean)

The E07g leaf build `lake build SmoothPoincare.Heights.OutgoingEdgeTransport` passed in 10,116 jobs. The source SHA-256 is `915c846c4fa1ae9c417c2df9f2414106b1b64da822f293dfde7ca7b5fdbf02bf`, using rounded outgoing collar source `20bad2b6b3a5f04dbd19cce4fde88d80abec086afe71e716dd685c6eef078fe5`. The three exact type and axiom checks cover the original wrapper, the supplied-collar theorem, and the coupled theorem. Lean reported only `propext`, `Classical.choice` and `Quot.sound`. The check log SHA-256 is `dd255af9afd3d00d456ae81d8124f779fbb55229327e38bd56aaf34247976ae1`. The independent public replay uses a supplied collar for every parameter of an arbitrary tube and tests the partial composite $T\circ R$ over both entire native rims in the two normal orientations. [Independent public replay](../../reviews/ED03_COUPLED_OUTGOING_READBACK.lean)
