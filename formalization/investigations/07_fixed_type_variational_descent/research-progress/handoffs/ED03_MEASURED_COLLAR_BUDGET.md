# Edition 03 · Local allowance and measured collar budgets

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. `SP4-FORM-DESC-E05b` is a bounded E packet using the existing
candidate score, row budget and exact selected-width test. The serving model
identifier and reasoning effort are unavailable to the worker. [Route 07](../REGISTER.md) ·
[Prior measured choice](ED03_MEASURED_COLLAR_CHOICE.md) ·
[Independent choice review](../../reviews/ED03_MEASURED_CHOICE_REVIEW.md)

## Certified row bound

Fix a finite candidate row of smooth marked annuli on the same closed oriented
Riemannian four-manifold. Use the manuscript normalization
\(w^2=4(\lambda^+(A)+\lambda^-(A))\), take \(\tau=\|DG(m)\|_{L^2(dx)}\)
and \(d=\|h\|_{L^2(dx)}\) for \(m=\exp h\), and let \(a=\|h\|_\infty\).
The norms are Euclidean in the annulus coordinates of the stated cutoff
estimate. Let \(\bar a_j\) bound \(a\) in the row, and assume \(0\le a\le1\).
At each candidate write \(b=w+\tau+d\). Take the nonnegative certified error
\(\beta\le C_0(ab+\sqrt{db}+d)\), with one constant \(C_0\) for the chosen
normalization and cutoff profile. A geometric use must also meet the
smallness threshold of the local allowance estimate. [Refined local allowance](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/collar_capacity.tex) ·
[Gauge and fixed profile](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/disk_collar_comparison.tex)

Since \((ab)^2\le4\bar a_j^2(w^2+\tau^2)+2d^2\), squaring the three-term
allowance and expanding \(db=d(w+\tau)+d^2\) gives

$$
\beta^2\le12C_0^2\bigl(\bar a_j^2(w^2+\tau^2)+d(w+\tau)+d^2\bigr).
$$

Apply finite Cauchy–Schwarz separately to \(\sum d w\) and \(\sum d\tau\).
With \(W_j^2=\sum w^2\), \(L_j^2=\sum\tau^2\) and \(P_j^2=\sum d^2\), the
existing `measuredCollarCandidateBudget` now certifies the row at
\(C=12C_0^2\).

$$
\sum(w^2+\beta^2)\le W_j^2+12C_0^2\bigl(
 \bar a_j^2(W_j^2+L_j^2)+ P_j(W_j+L_j)+P_j^2\bigr).
$$

The estimate holds for an empty row. The choice still needs each active row to
be nonempty. `excludesStrictRepair_of_localMeasuredSelectedDiskCollars` uses
this bound directly with the actual `selectedChartDisk (F j (pick j))` and
`selectedDiskTrim (F j (pick j)) (width j (pick j))` for the minimum-score
choice. The input path, output, complete complement agreements and cap tests
must concern that same selection. At positive starting Yamabe constant,
\(e+\Gamma<2T\) and
\(\sum_j\max_\pm\lambda^\pm(C_j)>\Gamma+e-I^+(M)\), with
\(\Gamma=2\sum_j\mathcal D_j/N_j\), imply a contradiction. Both strict
margins are preserved. [Lean proof](../../../../SmoothPoincare/Variational/MeasuredCollarBudget.lean) ·
[Signed path and cap tests](ED03_SIGNED_COLLAR_REPAIR.md)

In the same module `signedCollarRawCharge_le_of_curvatureSq` checks the
normalization bound for each sign on the given annulus.
`SignedCollarCandidateControls.ofCutoffCharges` uses that normalization and
identifies the two weighted charges with the integrals of \((1-\psi)^2\)
against the original sign measure on the full annulus and on its set
difference with the marked disk. The same cutoff has values in \([0,1]\)
there, so each weighted charge is bounded by its own raw charge. Realization
of these equalities from the actual density estimates and the two local error
bounds remain premises. Disjoint physical annuli inside one containing ball
bound their summed \(W_j^2\) by four times the sum of the two physical chiral
charges on that ball. With the manuscript's covariant tensor convention this
is the squared \(L^2\) Weyl norm and is bounded by the corresponding full
curvature integral. Additivity suffices for disjoint interiors with null
faces. The argument controls the curvature contribution to the row.

## Coordinate estimates and exact-width limitations

The following coordinate calculations are analytical checks. The Lean module
starts from the certified local allowance. On \(A=\{e^{-1}<|x|<e\}\), take
Frobenius norms on the symmetric trace-free matrix \(h\) and all derivative
arrays. In a supplied determinant-one chart, \(B=m^{-1}=\exp(-h)\) and
\(G_\alpha=\sum_j\partial_j(B_{\alpha\alpha}B_{j\alpha})\). On
\(\|h\|_\infty\le1\), the first and second Fréchet derivatives of the matrix
exponential are bounded by \(e\) in these norms. For example, differentiating
the power series and bounding the undifferentiated factors in operator norm
gives \(\|D^2\exp(-h)[u,v]\|_F\le e\|u\|_F\|v\|_F\). Consequently the first
and second derivatives of each entry product have bounds \(2e^2\) and
\(4e^2\). Summing the four divergence terms and four components gives

$$
 |DG(m)|\le 8e^2|D^2h|+16e^2|Dh|^2,\qquad
 \tau\le 8e^2\|D^2h\|_2+16e^2\|Dh\|_4^2,\qquad
 d^2\le |A|a^2.
$$

Here \(e=\exp(1)\) in the coordinate constants. These suffice to measure
\(\tau,d\) given a small \(C^2\) chart on that normalized annulus. If a parent
chart has an actual width-two log annulus of radius \(r\) about its origin,
normalizing it by the genuine dilation \(y=rx\) gives
\(h_r(x)=h(rx)\) and \(DG(m_r)(x)=r^2DG(m)(rx)\). Thus the \(L^2\)-square
of \(DG\) is preserved and the deviation square is
\(r^{-4}\int_{rA}|h(y)|^2dy\le e^4\int_{rA}|h(y)|^2|y|^{-4}dy\).
Both expressions sum over disjoint such parent annuli. An arbitrary radial
change normalizing a thin trim does not supply these dilation identities.
Theorem 1.1 of Liimatainen–Salo concerns smooth Riemannian metrics after
\(n\)-harmonic coordinates and determinant normalization are in place. The
prescribed annular diffeomorphism and a bound on its residual are additional
data. [Liimatainen–Salo, Theorem 1.1](https://doi.org/10.1093/imrn/rnv255) ·
[Fixed-width coordinate calculation](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/disk_collar_comparison.tex)

For a fixed smooth metric and one point, an oriented geodesic normal chart
has \(h(y)=O(|y|^2)\), \(Dh(y)=O(|y|)\) and \(D^2h(y)=O(1)\) near the
center after determinant normalization. Genuine dilations to \(rA\) give
\(a,d,\tau=O(r^2)\). Bounded Weyl curvature and the volume \(O(r^4)\) there
give \(w=O(r^2)\) and hence \(\beta=O(r^2)\). The score is \(O(r^4)\), the
same order as the general upper bound for the protected disk's charge.
These estimates concern a fixed source and give no strict gain inequality
or uniform chart on a varying source sequence.

There is a quantitative obstruction for preserving the angular marking of a
conformally Euclidean parent chart while moving the full outer model interval
\(1\le r\le e\) onto the outer half of a thin trim. If \(r\mapsto f(r)\) is
smooth and increasing with \(f(1)=1\), \(f(e)=1+\delta\) and positive
derivative, put \(\rho=rf'/f\). The determinant-one metric has radial
eigenvalue \(\rho^{3/2}\) and three tangential eigenvalues \(\rho^{-1/2}\).
Thus \(a=\|h\|_\infty\) implies \(\rho\ge e^{-2a/3}\). Integration yields

$$
\log(1+\delta)=\int_1^e\rho\,\frac{dr}{r}\ge e^{-2a/3},\qquad
a\ge\frac32\log\frac{1}{\log(1+\delta)}.
$$

For the trim \(\delta=1/(n+1)\), this diverges as \(n\) grows while conformal
flatness keeps \(w=0\). This applies to the specified radial normalizations
of the original angular mark, including nonlinear radial changes with these
faces. It leaves open a different marked selection or an allowance formulated
directly with width-dependent cutoff constants. The endpoint thin-trim charge
statement concerns the raw curvature measure. A small raw charge alone cannot
give the coordinate hypothesis or guarantee a small matched repair. [Exact trim](../../../../SmoothPoincare/PhysicalScales/SelectedDiskCollars.lean) ·
[Full buffered trims](../../../../SmoothPoincare/PhysicalScales/FullDiskTrims.lean)

## Pinned inputs and verification

The working base at intake was `4bec4df82e8b949935dd5a43f12f52cd3d018acb`.
Read SHA-256 prefixes were `9b08ae7f625363b0` for `collar_capacity.tex`,
`c1de1c225230b140f` for `disk_collar_comparison.tex`, `ddc9665f7901d3a5`
for `fixed_type_chiral_energy_descent.tex`, `414ebd4d4eaaa62b` for
`MeasuredCollarChoice.lean`, `d8b63804f565d2e9` for `SignedCollarRepair.lean`,
`572b7dd9566a736a` for `SignedCollarCapTests.lean`, `708f616a6d020b4f` for
`SelectedDiskCollars.lean`, and `855dd41bf6ad0a91` for `FullDiskTrims.lean`.
The existing coordinate-side files `ChartSpliceJets.lean`,
`SpliceRemainderL2.lean`, `MovingChiralFrame.lean`, and `SpliceDensity.lean`
had prefixes `4e356dda0d8ecb0f`, `d534a0886701062c`, `18c91f73b8196799`,
and `45260991e7582a12`. They control linear metric-splice jets,
quadratic remainders and moving chiral projectors. The determinant-one
matrix-exponential interpolation and the differentiated four-harmonic
residual remain inputs to the local error estimate used here.
The pinned Lean version is `4.35.0-rc3` at
`470d5ce1400764999581fd26d5d72b00d990b0f4`. Lake is `5.0.0-src+470d5ce`,
the manifest SHA-256 is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`,
Mathlib is `c55e6e786f49471c72fbddbec5415808896aec1e` and
DifferentialGeometry is `788efe97894474c032de6dfb1289d515f613d15a`.

The final leaf compiled to its standard output path using
`lake env lean -o .lake/build/lib/lean/SmoothPoincare/Variational/MeasuredCollarBudget.olean SmoothPoincare/Variational/MeasuredCollarBudget.lean`
with no diagnostics. The source SHA-256 was
`090d00065c43808a9dc3d60d78182a784119b0aba3a4fc574fe5e1594969a0e4`.
The aggregate declaration and axiom replay is part of integration.
