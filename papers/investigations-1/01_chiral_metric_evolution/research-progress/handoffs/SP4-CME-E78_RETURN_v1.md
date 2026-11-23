# SP4-CME-E78 return v1 — smooth-limit manuscript integration audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and selected lead settings are unavailable.
I authored E75 and E77. This is an audit of the lead's manuscript
integration against those assessed results. [Frozen request][req] ·
[Detailed audit][review].

## Disposition

The smooth-limit theorem passes. It uses the single \(m=6\) small-value
threshold, the fixed-tube tame estimate, and order-dependent eventual
absorption, with a common native rate and data-dependent higher-order
constants. The direct generator, map and inverse rates, exact recovery
order, and the round pullbacks of the limiting connection, curvature
and metric are supported.

The critical \(C^1\) proof estimates the actual maps of the critical
budget splice. The theorem it currently points to uses the original
small-value splice at \(T/2\), while the critical proof uses a splice
strictly inside its \([0,\tau_c]\) with \(\tau_c\le T/2\). Smooth
original-flow uniqueness identifies the connection trajectories, and
does not identify these selected recovery maps.

**Correction on the frozen version.** At 3904–3905 choose \(m=6\)
in the critical-budget transfer. At 3971–3975 state that the limiting
maps are those of the critical-budget splice. At 4062–4063 apply the
stable-tail part of the proof of `thm:round-smooth-limit` to that
splice's \(B\), together with its finite local factor \(c\).
This proves exactly the \(O(\delta)\) fixed \(C^1\) distance from
identity for those two limit maps. No additional analytic estimate
is needed.

Lines 63, 291–319 and 3420–3425 keep the intended smooth fixed-round
scope. The introduction and later qualifications contain no
contradictory no-limit claim. All six distinct reference targets in
the new statements and proofs resolve uniquely. The audit records
minor wording opportunities for the curvature derivative count and
the abstract's quantitative \(C^1\) scope.

No new primary source was opened or imported. The frozen manuscript
was consumed and released to the lead. Only the audit and this
return were written.

## Versions

| Artifact | SHA-256 |
| --- | --- |
| [E78 request][req] | `8e447e3efc595a54a140d2ecaf26c8e77357a3ca400b2d9601c51d7bfdf90abb` |
| Frozen manuscript | `13f51799c37689dc5e06be923cda8deb4eaa8d98516674be1e1859e644238af7` |
| E74 | `b2178fb149712df61c6b660bca00e10451c1d38c5434bb562607d9ba369139fa` |
| E75 | `6b499ac9696dedcb9c4147e6a61e35fdb7e50c0bf947185e160666de586b6d92` |
| E76 | `2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0` |
| E77 | `e8776fd678cfb87b4361920db7053682eee5ee99151b8c086c70d0122c75543e` |
| [E78 audit][review] | `e22475414a099461f8308a88ff03918485562eeb3daa4cbabc670de694941e3d` |

[req]: SP4-CME-E78_REQUEST_v1.md
[review]: ../../reviews/E78_SMOOTH_LIMIT_MANUSCRIPT_AUDIT_20261122.md
