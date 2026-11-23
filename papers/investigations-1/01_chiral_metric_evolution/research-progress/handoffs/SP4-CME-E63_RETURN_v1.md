# SP4-CME-E63 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The configured helper launch was
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. See the [request][req]
and [derivation][note].

## Disposition

For each finite order \(k\ge0\) and \(I=[\delta,T']\) with
\(0<\delta<T'<T\), the E42 adjusted solution map at the stationary
round reference is Lipschitz from a small continuous independent
pair ball in the fixed sup norm into \(C(I;C^k_x)\). The bound is
\(C_{k,I}\|u_0-v_0\|_{C^0}\) for every pair of data in the ball.
Taking \(v_0=0\) gives the corresponding linear bound relative to
the stationary reference. Taking \(k=m\ge6\) and using the fixed
volume gives the fixed-time \(H^m\) estimate for the pair and its
connection component.

The transformed zero-data solutions all vanish by the exact
residual identity and uniqueness. Uniform boundedness of the
lift and E42 (7) put all lifted small-data solutions in the
transformed uniqueness ball on a common compact parameter tube.
Joint Fréchet smoothness gives operator-norm continuity of
\(D_u\partial_s^\alpha U_s\). A finite cover of the parameter
slice at zero data provides a common positive datum radius and
bound for the finitely many derivatives needed. The Banach
mean-value formula then gives the parameter-derivative difference
bound into \(X_T^\circ\). Fixed evaluation, local inverse flow
maps and parallel transport transfer it to spatial derivatives on
a finite cover of the strip. The radius for fixed \(k\) can be
chosen before the strip using the same parameter tube. The
constants use the inverse-map and transport derivatives on the
chosen strip.

The estimate concerns the fixed E42 completed adjusted problem.
The argument supplies a finite-order neighborhood at positive
time. It gives no uniform bound as \(\delta\downarrow0\), a
common all-orders radius, a trace derivative estimate, a linear
temporal integral, or a continuous-data recovery result for the
original flow. No new primary source was used. No shared artifact
was edited.

## File identities

The E42 digest matched the frozen request before use. The B42 and
E50 digests record the observed conceptual selection and the
related stationarity reference.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E63_REQUEST_v1.md | `dfe5efdc54222ed3c3ea0c6954179499fa167093ee96e94554c86c3dcfe4ed5f` |
| B42_QUANTITATIVE_SMOOTHING_20261122.md | `fa6a470496f870955ed47dcf116eac8cdbc92eefdc6b685ead26e486fc565ba1` |
| 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md | `ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf` |
| 63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md | `427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb` |

[req]: SP4-CME-E63_REQUEST_v1.md
[note]: ../../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
