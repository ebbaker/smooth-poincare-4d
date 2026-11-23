# SP4-CME-E94 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I did not author E91.
[Request][req]. [Derivation][note].

## Disposition

For \(u_n=e_1-\epsilon_n\cos(nx^1)e_2\) on the flat
period-\(2\pi\) torus, let \(\epsilon_n=n^{-3/4}\) and
\(f_n(s)=(\epsilon_n/n)\sin(ns)\). Then the specified
\(\Psi_n(x)=x+f_n(x^1)e_2\) satisfies \(D\Psi_n u_n=e_1\),
and the autonomous flow is
\(\Phi_{n,t}=\Psi_n^{-1}R_t\Psi_n\), with \(R_t(x)=x+te_1\).
It has second-coordinate increment
\(f_n(x^1)-f_n(x^1+t)\). The inverse is obtained by
\(t\mapsto-t\).

For either sign, the canonical periodic displacement
\(\Delta_{n,\pm t}=\Phi_{n,\pm t}-R_{\pm t}\) has exact norms
\[
 \|D^k\Delta_{n,\pm t}\|_\infty
       =2n^{k-7/4}|\sin(nt/2)|,\qquad k\ge0 .
\]
The displacement and first derivative are uniformly
\(O(n^{-7/4})\) and \(O(n^{-3/4})\) over all real times.
For every fixed \(T>0\), the interval maxima attain the
displayed amplitudes on \([0,T]\) once \(n\ge\pi/T\).
Thus the higher spatial derivatives have growing interval
suprema, with the sine factor retained at each fixed time.

On every fixed \([0,T]\) with \(T>0\),
\(\int_0^T\|u_n\|_{C^1}\,dt
=T(\sqrt{1+n^{-3/2}}+n^{1/4})\) diverges. So does the
integral of the derivative sup norm by itself.
The finite flow and its inverse nevertheless stay
uniformly \(C^1\)-close to their respective
translations. The large instantaneous derivative comes
from the frozen model with a separately prescribed
nonzero curvature triple and the flat exterior derivative
on internal sections. This result concerns only that
explicit autonomous field and makes no curved connection,
finite slice or general transport claim.
No new primary source was inspected. Only the named
note and return were edited.

## File identities

The E91 digest matched the frozen request. The B55 digest
records the observed decision.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E94_REQUEST_v1.md | `b205387d638b509c39368dafaace1b67532411aae97200d41da7fb701dde5b1d` |
| B55_FINITE_FLOW_CANCELLATION_TEST_20261122.md | `8ad3385a4587ddcaf8ae5c679ee96d2bbe8d0ddcc4b3e3c793d0758237614582` |
| 91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md | `d566e2d9594c1ab42af2523ebd74c25b403e58fa4146a3f9e761a964a082a7f0` |
| 94_FROZEN_FINITE_FLOW_CANCELLATION_20261122.md | `7181861c247b0a63a70743072031e6966a24bef274d0177f75c23115861e7f5b` |

[req]: SP4-CME-E94_REQUEST_v1.md
[note]: ../../notes/94_FROZEN_FINITE_FLOW_CANCELLATION_20261122.md
