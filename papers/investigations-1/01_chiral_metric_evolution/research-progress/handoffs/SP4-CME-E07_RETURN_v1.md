# SP4-CME-E07 return v1 — realized pointwise dissipation kernel

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. Return to [request v1](SP4-CME-E07_REQUEST_v1.md).
Exact evidence is in the
[derivation note](../../notes/09_DISSIPATION_KERNEL_20261122.md).

## Disposition

Completed the one rational kernel and the prescribed local realization.
The matrices \(X_1=\operatorname{diag}(1,-1,0)\),
\(X_2=-(E_{12}+E_{21})\), \(X_3=X_4=0\) give cancelling contributions of
\((dx^4,dx^3,0)\) and its negative to the required curvature contraction.
The quadratic connection with \(V^1=(-dx^4,-dx^3,0)\), \(V^2=-V^1\) gives
\(Q(p)=I\), \(A(p)=0\), and \(\nabla_a^A Q(p)=tX_a\) for arbitrary finite
\(t>0\). It is definite on a sufficiently small local ball depending on
\(t\). The wedge quotient gives these jets exactly.

The reconstructed Hodge star has a nonzero spatial first derivative. The
self-duality and Bianchi identity make the contracted expression for the
actual unadjusted flow exact nonetheless. At the displayed point, the
velocity is zero, \(|T(p)|=t\), and the sum of the squared real fiber
remainder norms is \((4\pi/5)t^2\). This rules out the B06 pointwise algebraic
bound through \(|q|+|v|\), even at a fixed round curvature value. The return
concerns local initial data and leaves all integrated or neighborhood
estimates, stationary behavior, and global evolution open.

## Frozen input identities

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B06_DISSIPATION_TO_TRANSPORT_20261122.md` | `79158329ed71e57bec258f1a7f8e56e73dbb9092304b235df3f6e975338fe1de` |
| `notes/04C_VOLUME_AND_JETS_20261122.md` | `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838` |
| `notes/05A_REAL_TWISTOR_COMPARISON_20261122.md` | `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2` |
| `research-progress/handoffs/SP4-CME-E07_REQUEST_v1.md` | `425c635ace057ff88ef2cd5e80ad711d4759535b5daf41c6af8c555a7b71bd55` |

The one kernel system and the connection jet were checked by exact hand
calculation. No numerical artifact was needed.

## 22 November 2026 — typesetting correction

The derivation was corrected in two places to restore LaTeX spacing commands.
The original output used as frozen E10 input had SHA-256 `59409de49d5d8a2cb3ef490e39d89b4df7e0fd188fc13a2acbfabeffe4ef7d31`.
The corrected note SHA-256 is `dba99850da0f4ed3f56a46c3c8753d3cf69c0d3505ef97976523a907baf17ab9`.
