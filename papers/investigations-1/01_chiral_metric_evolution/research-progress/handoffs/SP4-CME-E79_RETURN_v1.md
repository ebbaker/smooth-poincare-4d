# SP4-CME-E79 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E48 and the
E73 audit. I did not author E71 or B47. See the [request][req] and
[derivation][note].

## Disposition

The prescribed restricted infinitesimal inverse holds in a
fixed small \(\|A-A_0\|_\infty+\|F_A-F_0\|_\infty\) tube.
The projection \(\Pi_A=I-S_A(S_0^*S_A)^{-1}S_0^*\)
takes values in \(\ker S_0^*\), so \(K_A=d_0^*\Pi_A d_A\)
and \(d_0^*\Pi_A r\) annihilate the reference kernel \(N\)
in the test argument. The weak form perturbation is bounded
by the value tube size times the two \(H^1\) norms.
The Neumann series around E71's coercive inverse provides
the bounded isomorphism \(K_A|_{H^1\cap N^\perp}\) onto the
\(H^{-1}\) annihilator of \(N\).

For each \(L^2\) one-form \(r\), the inverse gives a unique
restricted pair \((\phi,u)\in(H^1\cap N^\perp)\times L^2\)
and a fixed-slice residual. Their \(H^1,L^2,L^2\) norm
sum is bounded by \(C\|r\|_2\) with a value-only constant.
The residual map is the projection onto the fixed slice
along the closed restricted orbit image \(\mathcal Y_A\).
Orthogonality is recovered at \(A_0\). Away from \(A_0\)
the formula gives a projection along the stated complement.
For \(\psi\in N\), write \(B_A=(K_A|_{H^1\cap N^\perp})^{-1}\).
The full orbit image is
\(\mathcal Y_A\oplus z_A(N)\) with
\(z_A(\psi)=\Pi_A d_A(\psi-B_AK_A\psi)\) in the fixed slice.
A formerly stabilizing pair can move a nearby connection.
The actual stabilizer condition is \(z_A(\psi)=0\) with
the corrected parameters specified in the derivation.

For smooth \(A\) the positive real-part principal symbol
gives higher regularity. At integer order \(m\) the three
bounds control \(H^{m+1},H^m,H^m\) in terms of \(H^m\) input.
At \(m\ne0\), derivatives of \(a\) and \(F_A-F_0\) through
order \(|m|\) in \(L^\infty\) suffice for the constants.
Smooth data give smooth outputs. The active tangent from
the actual \(A\)-horizontal lift is \(d_A\phi+S_Au\), and
the inverse pullback reverses its sign. The result concerns
the infinitesimal action. Finite slice existence and orbit
evolution remain open in this packet. No new primary source
was inspected. Only the named note and return were edited.

## File identities

The three mathematical input hashes match the frozen request.
The B47 and lead-assessment digests record the observed decision
and assessment.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E79_REQUEST_v1.md | `3e0c2f38f4449c97ba85d9427c000b130339518fbc0e8d0fe1cba34a4ebe39b9` |
| B47_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `13539118593c28cbebf5399bbff0779f60e7b9acd06806c4c7ce32aaef306c9c` |
| E71_E73_LINEAR_SLICE_ASSESSMENT_20261122.md | `69ada7c5dd85409279aa3f433f8895589b73cffd3aca3e9d7198c81dd7de3547` |
| 71_LINEAR_ROUND_SLICE_20261122.md | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |
| E73_LINEAR_SLICE_AUDIT_20261122.md | `d64056adc3bfff226ba69a9cccff29a7a667b946d394f4be0a933c7eb0cc099f` |
| 48_FIXED_STABILITY_GAUGE_20261122.md | `b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b` |
| 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |

[req]: SP4-CME-E79_REQUEST_v1.md
[note]: ../../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
