# First trials at the nonumbilic core interface

27 November 2026, for Edward Baker with OpenAI assistance. Selected Astra/ultra lead, bounded Sol/ultra execution. Actual serving details unavailable. [Request](../research-progress/handoffs/E23_REQUEST_R1.md) and [core/collar data](B06_SHORT_TERMINAL_COLLARS.md), HEAD bc2c1bbccc1d. This is a floating diagnostic performed in memory while the project environment was unavailable; no interval or spectral claim is made for these four core trials.

The common interface has physical lengths \((1,1,5/3)\) and outward derivatives \((0,0,8/9)\) in the collar gauge. In the core's horizontal-area-one gauge the endpoint is \(a=\sqrt{3/5},u=\frac12\log(5/3),a_s=-4/15,u_s=(4/15)\sqrt{5/3}\). Undoing the normalization at the joint restores both the physical scale and logarithmic normal derivative. The core target for the specified terminal collar is \(19/18\) in units of \(\pi^2\). The core signed difference is \(E_+-E_-=-49\pi^2/9\).

| Basis size | Start | Core \(E_+/\pi^2\) |
| --- | --- | --- |
| 14 | Long trial | 3.524502045 |
| 14 | Late shear | 3.530171093 |
| 22 | Long trial | 3.520337731 |
| 22 | Late shear | 3.527757267 |

All four reproduced the expected signed shift to numerical precision. For the best trial the smaller block plus the exact \(4\pi^2/9\) exterior is about \(3.9647822\pi^2\); the paired closed budget would approach \(12.9295644\pi^2\). The new profiles retain their physical jets, and their whole-side Robin signs have not been certified. The first half of this best core costs approximately \(0.021984\pi^2\). Its final eighth costs approximately \(2.414504\pi^2\), split into \(0.466778\pi^2\) in the axial component and \(1.947726\pi^2\) in the transverse component in the core's \(i\)-distinguished gauge. The next core has to approach the nonzero interface derivative with less transverse energy. The numerical outcome excludes no other profile.

The following subtotals use \(x=s/S\) on the best core in the \(i\)-distinguished gauge. They are in units of \(\pi^2\).

| Core interval | Axial part of \(E_+\) | Transverse part of \(E_+\) |
| --- | ---: | ---: |
| \([0,1/2]\) | 0.011442 | 0.010542 |
| \([1/2,3/4]\) | 0.169807 | 0.118670 |
| \([3/4,7/8]\) | 0.300601 | 0.494773 |
| \([7/8,1]\) | 0.466778 | 1.947726 |

Rounded subtotals account for the full \(3.520337731\pi^2\). The terminal collar and the incoming core use different distinguished axes. These component subtotals refer to the core alone.

**Replay after reconnection.** The four coefficient vectors from the in-memory V8 run were recovered at round-trip precision. The Python replay evaluated the stored profiles and reproduced both integrated chiralities, the interface lengths and derivatives, and the displayed interval subtotals. From the repository root run `python3 papers/investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/numerics/nonumbilic_core_trial.py`. SHA-256 of the replay script begins `a970136b5765430d`. [Replay and coefficients](../numerics/nonumbilic_core_trial.py).
