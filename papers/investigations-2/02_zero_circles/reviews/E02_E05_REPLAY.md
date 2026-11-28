# Independent replay of ZERO-E02 and ZERO-E05

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Item 2 of the [frozen request](../research-progress/handoffs/REQUEST_FINAL_READINGS_20261127.md)
(`a354959dec53ec02`) specifies a bounded gpt-6.2-sol/ultra dispatch. Actual
serving variant and effort were unavailable. The reviewer wrote the E01
solver and was independent of the E02 and E05 writers. Inputs were the
working tree based on `6a422ce`, the [E02 return](../research-progress/handoffs/RETURN_E02.md)
(`f682850b5001a5b2`), its [table](../notes/E02_GATE_TABLE.md)
(`11927731822e6546`), the [E05 return](../research-progress/handoffs/RETURN_E05.md)
(`af7cebc3d78a7a8ce`) and its [derivation](../notes/E05_STRESS_GEOMETRY.md)
(`659762ac184ac873`). Parenthetical identifiers are SHA-256 prefixes.

## Result of the replay

The curvature and Yamabe arguments, outward bounds and reported numerical
rows replay. E05 certifies geometric membership of both stress cases
among the positive Yamabe classes with either chiral energy below
\(8\pi^2\). E02 certifies zero-freeness at the marked infinity pole for B at
\(3/4\) and for the other listed cases except A at \(-3/4\). For that case
the certified minimum enclosure remains \([0,1]\).

| Profile | \(t\) | Certified \(e/T\) | Certified \(Y(c)\) | Certified minimum at the marked pole |
| --- | ---: | ---: | ---: | ---: |
| A | \(-3/4\) | \([0.00590,1.00731]\) | \(>2.21\) | \([0,1]\) |
| B | \(3/4\) | \([0.00183,1.30521]\) | \(>4.45\) | \([0.335227,1]\) |

## E02 input, minima and sign audit

The driver uses the prescribed center sequence \(0,e_0/2,2e_1/3,3e_2/4,4e_3/5\),
the two signed weight vectors and \(\mu=tFI_3\). Its rescaled convolution
variable ranges over \([-1,1]\), with every relevant translated cubic knot
included in the split for quadrature. All curvature support is interior to
the midpoint box of half-width 4. The \(17^4\) grid has 83,521 nodes per row
and the \(25^4\) grid has 390,625. There were 13 primary runs of
profile/amplitude pairs, including the shared round point twice, and three
additional stress refinements. Each spatial node uses all three leading
columns. The least singular value minimizes over the entire unit sphere
of directions at that node. In the physical coframe the graph multiplies
the plus coefficient matrix by \(1-tF\), since the \(dx^{0i}\) part gains
\((1+tF)/a=1-tF\) while the \(dx^{jk}\) part already has coefficient factor
\(1-tF\). The appended limiting value is 1.

**Sampled observations.** The [driver](../numerics/e02_gate.py)
(`1582bd5f4619a2f5`) reproduced the [execution record](../numerics/e02_results.txt)
(`d4e52df1218196bf`) byte for byte. A separate calculation of the two
\(17^4\) stress rows used a full complex Fourier transform, reconstructed
its multiplier from contractions, and evaluated the convolution with
96-point split Gauss–Legendre quadrature. It gave \((d_{\mathrm{grid}},e/T)\)
of \((0.939929502851,0.156931902201)\) for A at \(-3/4\) and
\((0.718419620448,0.092816010092)\) for B at \(3/4\). All of these agree
with the recorded values to their nine displayed decimals. The largest
recorded graph residual is \(8.850\times10^{-12}\). The residual and the
two-grid differences measure properties of the periodic diagnostics.

**Certificate replay.** I computed \(b^2\) by the full 25-term pairwise sum
in each profile, retaining the signs of the two negative weights. Both
rational moments match. I independently evaluated the positive denominator
\(d\), the norm bound \(D\), the curvature metric factor \(m\), and the
outward endpoints from the B01 proof, checking all sixteen rows. If \(L\)
denotes the rounded lower bound on \(m_\omega\), the column \(\mathrm{error}_U\)
is an upper bound on the distance from the displayed estimate to any
value in \([L,1]\). It can remain large even for a small periodic graph
residual. B01 gives positive \(K_L\), energy upper endpoint less than 2,
and a strictly positive minimum lower endpoint on the base rows and A at
\(-33/64\). Both B01 stress-geometry tests are inconclusive at A \(-3/4\)
and B \(3/4\), which E05 addresses with its separate endpoint certificates.

The exact Fourier inequality gives the zero-free interval
\((-1/(2b_A),5/16]\) within the tested A span, with
\(1/(2b_A)\simeq0.5908807674\). The corresponding statement for B holds
throughout \([-5/16,3/4]\) because \(3b_B/4\simeq0.3323863203<1/2\).
The B01 geometry estimates apply continuously on \([-33/64,5/16]\) for A
and \([-5/16,5/16]\) for B by monotonicity of their one-sided bounds.
E05 certifies geometry at the two stated endpoints. For A along the
negative segment, a first zero could still occur in
\([-3/4,-1/(2b_A)]\). The test found no sampled zero.

## E05 interval and geometry audit

**Certificate replay.** The support of \(F\) lies in \([-3,3]^4\) since every
coordinate shift is at most \(4/5\) and the convolved one-dimensional support
has radius \(2+1/64\). In one cell the convolution is a probability average
of the matching derivative of \(h\) on the enlarged translated interval.
The endpoints, cubic knots, and \(\pm2/3\) cover the extrema at derivative
orders 0, 1 and 2. Tensor products and signed
sums then enclose \(F\) and all transverse derivatives used. Both profiles
satisfy \(|tF|\le3/4\) from the absolute weights and \(0\le h*\rho\le1\).
For negative A the product \(tF\) is nonpositive. The clipped intervals
therefore retain the exact fields and leave the denominators positive.

The [interval program](../numerics/e05_stress_geometry.py)
(`99d8648a4e5a87f4`) represents endpoints on the \(2^{-20}\) scale. Its
integer multiplication checks the four signed endpoint products and
rounds outwards, with separate nonnegative treatment of a square across
zero. Addition, negation and reciprocal preserve inclusion. Magnitude
guards exclude signed 64-bit overflow in the slab computations and sums,
with whole-box accumulation in Python integers. Both \(32^4\) runs reproduced
the published rational integrals and global reciprocal bounds. In a
separate exact \(\mathbb Q\) calculation I checked twelve cells per profile,
including central, edge and shifted cells. All exact interval evaluations
of the profile derivatives, \(a\), \(1/a\), energy integrand, positive trace
squared and gradient potential fit inside the fixed-point integer intervals.

**Geometry replay.** In the oriented coframe \((a,dx_0,dy)\), the curvature
operator restricts to \(-D_y^2a/a\) on the \(0i\) sector and is zero on
the spatial sector. This yields the two equal Weyl blocks
\(-(D_y^2a)_0/(2a)\) in the Hilbert–Schmidt energy, the scalar curvature
\(-2\Delta_y a/a\), and chart volume \(a\,dx\). The energy identity
\(|B_0|^2=\tfrac13\sum_{i<j}(B_{ii}-B_{jj})^2+2\sum_{i<j}B_{ij}^2\)
holds for any symmetric transverse Hessian \(B\). The interval upper
energy divides by \(16\pi_{\rm lo}^2\) and the lower energy divides by
\(16\pi_{\rm hi}^2\). The quoted Machin bounds have the correct directions
by alternating-series remainders.

**Primary import checked.** Talenti §0 equations (1)–(3), pp. 353–354, gives
the sharp flat Sobolev inequality for sufficiently smooth decaying tests
with \(1<p<n\) and \(q=np/(n-p)\). For \(n=4,p=2\), the equality function
\((1+r^2)^{-1}\) has fourth-power integral \(\pi^2/6\) and squared gradient
integral \(4\pi^2/3\), confirming \(S^2=\sqrt6/(8\pi)\) for the squared
norm inequality used here. Smooth compactly supported tests qualify.
[Talenti, primary article](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf)

For B, the Yamabe numerator satisfies the direct lower bound
\((6m/S^2-2\| (\Delta_y a)_+\|_2)\|z\|_4^2\). For A, integration by parts
changes the scalar term into \(4\int zD_y a\cdot D_yz\). Completing the
square with \(\lambda a|D_yz|^2\), \(\lambda=24/7\), gives a lower potential
\(-4|D_y a|^2z^2/(\lambda a)\). The constant remaining gradient coefficients
\(b_0=6m_0\), \(b_1=(6-\lambda)m_1\) yield a flat Sobolev coefficient
\((b_0b_1^3)^{1/4}/S^2\) by diagonal rescaling. Both estimates use
\(\|z\|_{4,g}^2\le m_0^{-1/2}\|z\|_{4,dx}^2\) with positive numerator
coefficient. Taking \(z=\Omega f\), conformal covariance passes to tests
away from the marked point, then the point cutoff gives the compact
Yamabe bounds. The reproduced rational Yamabe lower bounds exceed \(2.21\) for A
and \(4.45\) for B. Both rational energy upper endpoints are strictly below 2.

Thus the finite membership computation certifies exact smooth metrics at
the two stated amplitudes. The unresolved A minimum and the all-poles
quantifier remain matters for the lead's stated gate scope.
