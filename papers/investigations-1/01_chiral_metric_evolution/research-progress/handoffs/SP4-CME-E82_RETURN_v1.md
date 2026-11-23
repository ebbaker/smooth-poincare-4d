# SP4-CME-E82 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E71 and E80 and
did not author E79 or E81. See the [request][req] and [derivation][note].

## Disposition

The E79 parameter and actual-lift map
\((B,r)\mapsto(\phi,u,s,Y)\) is jointly smooth tame on the strict
open smooth value tube. It is linear in \(r\) for each \(B\), and
satisfies \(\phi\perp N,\ s\in\mathscr X,\ s+\mathcal L_YB=r\)
for the active pullback convention.

- For \(P_N\) valued in \(N\), inclusion \(i\), and
  \(\mathbf P_N=iP_N\), the exact augmented solution is
  \[
   x=P_Nk,\qquad
   h=iy+B_B\big((I-\mathbf P_N)k-K_B(iy)\big).
  \]
  The right side in the restricted solve annihilates \(N\),
  so E79 gives unique smooth solvability of the block.
  Each block also has a bounded inverse
  \(L^2(E)\times N\to H^2(E)\times N\).
- The canonical operator coefficient bundle is
  \(\mathcal D^2(E,E)=\operatorname{Hom}(J^2E,E)\).
  Ellipticity follows from the positive real-part symbol.
  Strong coefficients use at most \(J^2(B-A_0)\),
  with a fixed two-grade shift in \(C^n\).
  The constraints \(j=P_N\) and the smooth forcing
  inclusion \(i\) are fixed and satisfy Hamilton's
  order-two bounds. Each coefficient section lies in
  the open augmented-invertible locus.
- Hamilton II.3.3.3 gives the jointly smooth tame inverse
  family. We use \(C^n\) coefficient grades and \(H^n\)
  solution and forcing grades, as allowed in his setup.
  The estimate II.3.3.4 separates high forcing and the
  product of high coefficient norms with low data.
  The Sobolev and \(C^n\) gradings compare by fixed shifts.
- The forcing \(d_0^*\Pi_B r\) uses two derivatives of
  \(B-A_0\) and one of \(r\). The remaining E79 formulas
  are tame finite-jet operations. E71's fixed projection
  is a tame retraction onto the smooth slice by a
  three-grade Sobolev-to-\(C^n\) estimate.
  The actual lift is
  \(Y=\chi_{A_0}(u)+\operatorname{vert}(\phi-(B-A_0)(u))\),
  using a fixed tame identification of invariant fields.
  It satisfies \(B(Y)=\phi\) and projects to \(u\).

These are local tame estimates in the smooth topology,
with a fixed parameter tube on which the block is invertible.
The constants need not follow from value sizes alone. The
packet supplies the linear solver family for later use.
Finite automorphism charts and a nonlinear section are
outside the derivation. Only the named note and return were edited.

## Source inspection

Reread selected text of Richard S. Hamilton, *The inverse
function theorem of Nash and Moser*, Bull. Amer. Math. Soc.
(N.S.) 7(1), July 1982, pp. 65–222, DOI
`10.1090/S0273-0979-1982-15004-2`, on 22 November 2026
(America/New_York). The checked passages were II.1.3.1–1.3.4
and II.1.3.9 (pp. 136, 139), II.2.1.1 and II.2.1.6
through the smooth tame definition (pp. 140–143),
II.2.2.6–2.2.7 (pp. 145–146), II.3.1.1 (p. 150),
and II.3.3 setup and II.3.3.3–3.3.4 (pp. 155–159).
The exact original publisher text was available through the
web index. Direct fetch returned HTTP 403. No PDF or
page image was retained. No new Fine source inspection
was used. [AMS publisher text][ams] · [Canonical R24][canonical].

## File identities

The four frozen inputs matched before use. The B49 digest
records the observed conceptual input.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E82_REQUEST_v1.md | `cd36b78688d936e85572f05c83eda9d1990af0592cbddf7dc1307c8657f43d0d` |
| B49_SMOOTH_LOCAL_SLICE_SECTION_20261122.md | `cd74df4c88b8e33e97c5ed20242a7bb822f98fdbf2ddeca45c70bf4f131a7bdf` |
| 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| E80_ORBIT_INVERSE_AUDIT_20261122.md | `10009438d0eca3e7fe8eb8ebdb78082b9b200812ca8fdb31b99698368ebab39f` |
| 71_LINEAR_ROUND_SLICE_20261122.md | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |
| E81_NONLINEAR_SLICE_SOURCE_AUDIT_20261122.md | `79a114526efdbb770be36f2629c787d55766282ac5614df1e8b36eab627717db` |
| 82_TAME_ORBIT_SOLVER_20261122.md | `d6dfaca55a61107ac8b97952d32d828d51b7f0469c8c2eca8e03e3b0ba8b780d` |

[req]: SP4-CME-E82_REQUEST_v1.md
[note]: ../../notes/82_TAME_ORBIT_SOLVER_20261122.md
[canonical]: ../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#nonlinear-slice-primary-hypotheses--e81
[ams]: https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf
