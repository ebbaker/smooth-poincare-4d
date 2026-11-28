# Gate 1 table for the second master

27 November 2026. From the SP4-ZERO lead for Edward B. Baker III, to SP4-M2-B02. Codex lead, actual serving variant and effort unavailable. Tree 6a422ce. [E02 table with every grid, residual and error enclosure](../../notes/E02_GATE_TABLE.md) · [E05 exact geometry bounds](../../notes/E05_STRESS_GEOMETRY.md) · [E01 calibration](../../notes/E01_FLAT.md) · [independent gate reading](../../reviews/E02_E05_REPLAY.md).

**Certificate / project theorem inputs.** The smooth sphere, the end \(p=\infty\), the positive orientation of the end chart, the two translated tensor profiles, \(g=a^2dx_0^2+|dy|^2\), the parameter grid and the unit-leading normalization are fixed in [B01](../../brainstorm/notes/B01_GATE_SCOPE.md). Write \(m_\omega=\inf_{q\ne p,\,|u|=1}|\omega_u(q)|_g\) and \(T=4\pi^2\). The chiral integrals agree on these metrics. The energy and continuum-minimum columns are rigorous enclosures conditional on the written project arguments. The Yamabe column is the certified sign on that same compact class. **Heuristic:** \(d_{\rm grid}\) is a floating diagnostic, computed on a periodic grid. It is the minimum over the full direction sphere at each sampled node. The E02 table gives the per-row bound on the discrepancy from the continuum infimum.

| Profile | \(t\) | Certified \(e/T\) | \(Y(c)\) | Certified \(m_\omega\) | \(d_{\rm grid}\) at finest tested grid |
| --- | ---: | ---: | --- | ---: | ---: |
| A and B | 0 | 0 | Positive | 1 | 1 |
| A | \(-1/4\) | \([0,0.176113]\) | Positive | \([0.731691,1]\) | 0.979536257 |
| A | \(1/4\) | \([0,0.490201]\) | Positive | \([0.576902,1]\) | 0.795871167 |
| A | \(-5/16\) | \([0,0.329518]\) | Positive | \([0.640499,1]\) | 0.974498295 |
| A | \(5/16\) | \([0,1.265092]\) | Positive | \([0.471128,1]\) | 0.746460741 |
| A | \(-33/64\) | \([0,1.634722]\) | Positive | \([0.225946,1]\) | 0.956864515 |
| A | \(-3/4\) | \([0.00590,1.00731]\) | \(>2.21\) | \([0,1]\) | 0.938061107 |
| B | \(-1/4\) | \([0,0.236978]\) | Positive | \([0.778409,1]\) | 0.982217393 |
| B | \(1/4\) | \([0,0.236978]\) | Positive | \([0.778409,1]\) | 0.904795809 |
| B | \(-5/16\) | \([0,0.484945]\) | Positive | \([0.723011,1]\) | 0.977830568 |
| B | \(5/16\) | \([0,0.484945]\) | Positive | \([0.723011,1]\) | 0.881227557 |
| B | \(3/4\) | \([0.00183,1.30521]\) | \(>4.45\) | \([0.335227,1]\) | 0.710453984 |

**Project theorem / heuristic by column.** No first zero was detected in the finite runs. The continuum estimate excludes zeros at this pole throughout B's tested parameter span and for A when \(|t|<1/(2b_A)\), \(b_A^2=4403963/6150400\). Going from \(0\) towards \(-3/4\) in A, a first zero, if present, has parameter in \([-3/4,-1/(2b_A)]\). The marked endpoint's compact-core zero question remains open. Every sampled class has certified positive sign and subcritical energy. Other pole points were outside the experiment. Gate 1 is returned to its owner.
