# SP4-CME-E83 return v1 — tame full orbit chart and right inverse

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and lead settings are unavailable.
I authored neither E71, E79 nor E81. [Request][req] · [Derivation][note].

## Disposition

The full group chart and action pass. With the fixed invariant
connection metric on compact \(P\), Haar averaging gives a degree-zero
tame projection onto invariant vector fields. The pointwise
exponential and logarithm give the equivariant chart on a small
\(C^1\) ball. Each finite chart map is a local diffeomorphism
homotopic to identity through local diffeomorphisms, so it is a
degree-one covering and therefore a global automorphism.
Its inverse and tangent operations are jointly smooth tame.
The base maps preserve orientation.

The affine connection pullback is jointly smooth tame. The centered
target and its variations are horizontal equivariant forms, which
identify with adjoint-valued base one-forms. For a tangent \(Y\circ g\),
undoing \(g^*\) gives \(s+\mathcal L_YB=s+d_B\phi+S_Bu\).
Under the named E82 premise that the E79 solver is jointly smooth
tame, apply it to \((g^{-1})^*r\) and lift the output at the actual
\(B\). The chart component is
\((D_v\exp_p|_{Z(p)})^{-1}Y(g_Z(p))\). The solver identity then proves
\(D\widetilde F\,\mathcal R r=r\). The geometric operations add one
fixed derivative for the inverse pullback at the map level. Each
parameter derivative has its own bounded grade shift independent of
the output grade. The full chart suffices with the \(N^\perp\)
restriction inside the scalar solver.

Conditional on this same E82 premise, Hamilton III.1.1.3 gives
a smooth tame local section for the smooth orbit problem. It can
be chosen through \((\mathrm{id},0)\) over \(A_0\). The proof passes
to sequence spaces and centers the prescribed preimage in
III.1.2.1–1.2.3. The algorithm starts at zero, its size estimate
forces zero limit for zero target, and III.1.7.1 gives smooth tame
dependence of that specific limit. Undoing the normalizations keeps
the prescribed preimage. The conclusion concerns a neighborhood in
the smooth topology near the fixed native round reference. It
establishes existence of a chosen representative satisfying the two
fixed equations, without an orbit uniqueness or full value-small
placement claim.

## Primary source status

Freshly checked selected indexed passages of Hamilton's original
[AMS publisher article][ham], *Bulletin of the American Mathematical
Society* (N.S.) 7(1), July 1982, pp. 65–222,
DOI [10.1090/S0273-0979-1982-15004-2][doi].

- Fixed section gradings and tame section spaces, retracts and products
  at I.1.1.5 and II.1.3.1–1.3.4, II.1.3.9, pp. 68, 136, 139.
- Local tame and smooth tame definitions, finite-jet operators,
  section and mapping charts, compact-source/intermediate composition,
  and compact diffeomorphism inverse at II.2.1, II.2.2.6–2.2.7,
  II.2.3.1–2.3.6, pp. 140, 143, 145–149.
- Right-inverse theorem and normalization at III.1.1.3 and
  III.1.2.1–1.2.3, pp. 172–174. Pointed algorithm, a priori limit
  and smooth tame section at III.1.5.1, III.1.6.9–1.6.10,
  III.1.7.1, pp. 179–180, 184–185, 187.

Direct PDF fetch returned 403. The original publisher's indexed text
was accessible, including line-addressable portions after search.
There was no downloaded copy or visual verification. Only the
designated note and return were written. The E82 premise is explicitly
left to E82.

## Versions

| Artifact | SHA-256 |
| --- | --- |
| [Request][req] | `9e4c2a46fe6752ba54c1f14584cef493a2bf5485ea657629034a4f55d01af114` |
| E79 | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| E71 | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |
| E81 | `79a114526efdbb770be36f2629c787d55766282ac5614df1e8b36eab627717db` |
| [E83 derivation][note] | `6400b48a1194d6568f32c1b139d67263dc455d70acaadad18b5d1be472c3fdaf` |

[req]: SP4-CME-E83_REQUEST_v1.md
[note]: ../../notes/83_TAME_FULL_ORBIT_CHART_20261122.md
[ham]: https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf
[doi]: https://doi.org/10.1090/S0273-0979-1982-15004-2
