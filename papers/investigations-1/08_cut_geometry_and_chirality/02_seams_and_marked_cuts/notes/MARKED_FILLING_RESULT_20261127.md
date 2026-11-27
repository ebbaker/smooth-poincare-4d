# Short-axis marked filling at the quaternionic Berger face

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI assistance. Selected Astra/ultra lead with bounded Sol/ultra calculations and independent readings. Actual serving details unavailable. Working HEAD bc2c1bbccc1d. The [starting register and input versions](../research-progress/handoffs/E12_REQUEST_R1.md) fix the disk, its boundary, the inherited positive-double theorem and the prior TUBE enclosure.

## What the new fillings achieve

For the smooth normal disk bundle \(W\) of the standard projective plane, retain the short \(i\)-circle at the bolt and the actual right-invariant \(Q_8\backslash S^3\) face of lengths \((1,1,\sqrt3)\). Write \(b=E_+(W)/\pi^2\) in the outward-first convention. The following enclosures refer to the saved long triaxial trial, using rounded outward endpoints. The closed row refers to sufficiently close smooth representatives after the explicit collar modification below.

| Quantity | Certified value or interval |
| --- | --- |
| Smaller block \(b\) | \([3.94998,3.96666]\) |
| Larger block \(E_-(W)/\pi^2=b+5\) | \([8.94998,8.96666]\) |
| Side half-sum \(e_W/\pi^2=b+5/2\) | \([6.44998,6.46666]\) |
| Contribution to \(b\) from the last eighth of normalized radial distance | \([1.87399,1.87509]\) |
| Whole-side Neumann conformal eigenvalue in the certificate gauge | \(\lambda_1\ge2.69985\) |
| Each chiral energy on the smooth switched \(S^4\), in units of \(\pi^2\) | \((12.8999,12.9334)\) |

The unrestricted positive filling infimum therefore satisfies
\[
 \frac83\ \le\ \frac{F_W(h_{\sqrt3})}{\pi^2}
 \ \le\ 6.46666 .
\]
The old certified upper bound was \(7.5575\). The strict realization target is \(F_W/\pi^2<4\), equivalently \(b<3/2\). No subthreshold filling has been established. For this trial the last eighth of the meridian alone costs more than the entire smaller-block allowance. Every smooth replacement of the core retaining this terminal annulus, including a non-invariant replacement, still fails. The same statement holds for arbitrary conformal changes of the retained annular metric because its integrated Weyl cost is unchanged.

## Energy, signs and gluing

The [new long trial](E13_VARIATIONAL_TRIAL.md) permits the collapsing length to grow well beyond its boundary value and returns along a genuinely triaxial exterior. Its analytic bolt parity and normal slope four realize the prescribed disk action. Both terminal shape derivatives vanish. All 45 defining coefficients, the choice of radial scale, and the exact meaning of the decimals are in the [interval certificate](E18_LONG_CERTIFICATE.md). A full re-evaluation encloses the curvature throughout the disk, including the removable bolt terms. It gives the whole-side sign by testing the smooth positive radial function \(\phi=1+x^6-3x^8/4\), \(x=s/S\), with \(\partial_\nu\phi=0\). For every real \(H^1\) test function \(f\),
\[
 \int_W(6|\nabla f|^2+Rf^2)
 = 6\int_W\phi^2|\nabla(f/\phi)|^2
     +\int_W (L_g\phi/\phi) f^2,\qquad L_g=-6\Delta+R .
\]
The certified pointwise lower bound applies to all test functions. The fixed profile has negative scalar curvature somewhere. In the horizontal-area-one gauge the face lengths are \((A,A,\sqrt3 A)\), \(A=3^{-1/4}\). Scaling all lengths by \(1/A\) gives precisely the requested face. The lower bound for \(\lambda_1\) in that representative is multiplied by \(A^2=1/\sqrt3\), so it remains strictly positive. Weyl integrals in dimension four are unchanged. [Independent interval and supersolution check](../reviews/E21_LONG_INTERVAL_READBACK.md)

For this cap the normal derivative is zero on both copies, with opposite outward normals across the actual seam. In geodesic distance from the face, smoothly replace the orbit metric \(h_s\) by \(h+\theta(s/\delta)(h_s-h)\) with product near zero and identity past \(2\delta\). Because \(h_s-h=O(s^2)\), the modification converges in \(C^1\cap W^{2,p}\) for finite \(p\), with bounded curvature on a layer of vanishing volume. This preserves strict Robin positivity on the compact halves and their smooth identity doubles. On the actual closing use the boundary isometry \(i\leftrightarrow j,\ k\mapsto-k\), induced by conjugation by \((i+j)/\sqrt2\); the second copy has the opposite orientation. The near-face products match exactly, so the switched closed metric is smooth. Its form is positive by adding the two positive whole-side forms on trace-matched tests. The kernels are \(\langle i\rangle\) and \(\langle j\rangle\); the matrix-sphere model identifies this specific smooth assembly as \(S^4\). Each identity double has positive Yamabe sign as well. Boundary eta \(-5/12\) and relative signature zero give \(E_- -E_+=5\pi^2\), also checked by direct transgression. The two closed chiral energies are equal, and approach \((2b+5)\pi^2\). The uniform open interval in the table follows by taking \(\delta\) sufficiently small. It includes the smoothing error and exceeds the strict \(8\pi^2\) budget. [Paired filling and smoothing](B04_PAIRED_FILLING.md) · [Actual switched gluing](../reviews/E11A_INTEGRATION.md) · [Doubles and cover](../reviews/E15_DOUBLES_AND_COVERS.md)

## Lower bounds and continuation

1. **A triaxial cap must overshoot.** In terms of \(y=\ell_i^2/(\ell_j\ell_k)\), every cap with \(y\le3/5\) has \(b\ge867/575>3/2\) at every length and for either Robin sign. A subthreshold cap requires a normalized radial volume \(V>0.38381065\ldots\), and \(y>0.60124242\ldots\) at a specific interior orbit. Its boundary value is \(1/\sqrt3\). The causal lower bound and the exponentially weighted moment are independent of the particular trial functions. [Proof](B06_SHORT_AXIS_OBSTRUCTIONS.md) · [Transverse slope estimate](E14_TRANSVERSE_TEST.md)
2. **A round umbilic starting orbit incurs a sharp outer cost if the two short lengths agree through the face.** For any core, every finite such collar has \(b>4\). An explicit positive family attains this infimum in the limit, with signed costs tending to \((4,9)\pi^2\). The finite even construction gives both positive doubles and an exact smooth switched closing. The annular dual gives a necessary weighted anisotropy for more general transitions. [Sharp cost and finite construction](B06_ROUND_TRANSITION.md) · [Annular measurement](E20_TERMINAL_ANNULI.md)
3. **A cheaper outer collar specifies new core data.** The explicit outer solution restricted to \(e^{2v}\in[2/3,1]\) spends \(4\pi^2/9\) in the smaller chirality. Its inner lengths are \((1,1,5/3)\) and the outward length derivatives are \((0,0,8/9)\). A compatible core has a remaining smaller-block allowance of \(19\pi^2/18\). A superficially cheaper-core alternative starting the same curve at \(e^{2v}=1/2\) is excluded by the incoming first jet. The new test must use the actual short \(i\) bolt and verify the whole joined Robin form. [Core budget and jet calculations](B06_SHORT_TERMINAL_COLLARS.md)

Four exploratory core fits at the \(2/3\) interface missed the remaining allowance. The best core gave \(E_+/\pi^2\approx3.52034\). Its final eighth alone contributed \(1.94773\pi^2\) to the transverse part. These figures come from floating quadrature. The strict marked realization remains open. [Trial results](E23_NONUMBILIC_CORE_TRIAL.md) · [Continuation](../continuation-notes/AFTER_SHORT_AXIS_20261127.md).
