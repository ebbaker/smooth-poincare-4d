# R06 — replay of fixed-end realization

27 November 2026, UTC. Prepared for Edward B. Baker III by the independent
Codex S02/R06 reader. The packet names Sol 6.2/ultra. The actual running
variant and effort are unavailable to this reader. Baseline `6a422ce`.
The [dependent request](../research-progress/handoffs/REQUEST_DEPENDENCIES_R1_20261127.md)
and the [E04 note](../notes/E04_REALIZATION.md) were inspected. The replayed
E04 SHA-256 prefix is `0dc61bfb07a67b35a`.

**Disposition.** The fixed-end criterion and the relative construction are
replayed. The application to the pole family uses the indicated A1 premise.
The original exact-form converse fails even for a nowhere-zero pole form on
the standard sphere in a specified inverted normal chart. A deduction at the
end of this review also produces a pole form with degenerate zeros from A1,
B02 and an independent primary import.

## Primary passages

- **Import.** Auroux, Donaldson and Katzarkov, *Singular Lefschetz pencils*,
  *Geometry & Topology* **9** (2005), 1043–1114, DOI `10.2140/gt.2005.9.1043`.
  I independently read Definition 1 and Proposition 1 at p. 1044 and §7.2
  at p. 1106 in the published layout. For a closed form that is positive
  where nonzero and has wedge-positive derivative of rank three at zeros,
  the first assertion gives a compatible smooth metric. Its proof uses the
  positive-plane graph criterion and convex patching. The following
  genericity statement is for compact \(X\) with \(b_2^+\geq1\). E04 uses
  the compatibility argument and supplies the marked-end prescription
  separately. [Published layout, PDF pp. 2, 64](https://arxiv.org/pdf/math/0410332)
- **Import.** Timothy Perutz, *Surface-fibrations, four-manifolds, and
  symplectic Floer homology* (2005), Definition 1.1.1, Lemma 1.1.3 and
  Proposition 1.1.4 with proof. The definition explicitly requires a
  three-dimensional positive-definite image at a zero. The proposition
  identifies compatible conformal metrics with smooth positive plane bundles
  containing the form and proves existence. I checked the corresponding
  compatibility statement also in *Zero-sets of near-symplectic forms*,
  Lemma 2.1, p. 241. Sources were inspected on 27 November 2026 via their
  online PDFs. [Author-hosted thesis, PDF pp. 17–20](https://web.ma.utexas.edu/users/perutz/PDF_files/PerutzThesis.pdf)
  · [Published article](https://intlpress.com/site/pub/files/_fulltext/journals/jsg/2006/0004/0003/JSG-2006-0004-0003-a001.pdf#page=5)

## Orientation, rank and gluing

**Independent replay.** The inversion derivative at \(y=\rho\nu\) is
\(\rho^{-2}R_\nu\), with \(\det R_\nu=-1\). The geometrically oriented
\(x\)-end uses the opposite orientation to its numerical coordinates if
\(y\) is positive. For an orthonormal frame of the geometric \(x\)-end
orientation, take \(\beta=a e^{12}+b e^{34}\) with \(a,b>0\). Any continuous
positive conformal extension would put every \(R_\nu^*\beta\) in a single
positive three-plane at \(p\). The span can be read off exactly. Its diagonal
part is on the line through \(a e^{12}-b e^{34}\), since its coefficients
are \(a(1-2(\nu_1^2+\nu_2^2))\) and \(b(1-2(\nu_3^2+\nu_4^2))\).
Reflection normal to \(e_1\) realizes that line. Normal vectors proportional
to \(e_1+e_3,e_2+e_4\) give \(a e^{23}-b e^{14}, b e^{23}-a e^{14}\).
Normal vectors proportional to \(e_1+e_4,e_2+e_3\) give
\(a e^{24}+b e^{13},-b e^{24}-a e^{13}\). Thus for \(a\ne b\) the two
off-diagonal pairs have rank two each and the whole span has rank five. For
\(a=b\) the exhibited vectors span the entire Euclidean self-dual plane in
the \(y\)-orientation. All reflections of \(\beta\) then belong to that
plane by orientation reversal. This checks both the obstruction and the
uniqueness of the conformal value at the pole. In particular
\(dx^1\wedge dx^2-2dx^3\wedge dx^4\) is an explicit positive symplectic
form on the standard punctured sphere in a globally defined \(x\) with
negative numerical orientation, and it fails the fixed-end criterion.

At a zero, the derivative has rank three and its image extends locally to a
positive plane field. Projection to that field gives a submersion. In the
resulting coordinates the positive component is \(u\) and the negative
component is \(b(t,u)\). Wedge-positivity off the zero set implies
\(b(t,0)=0\). Integrating its \(u\)-derivative yields the local graph map.
At the original zero the graph map vanishes, by the chosen splitting, and
its norm is strictly less than one after shrinking. This gives a smooth
positive plane through all nearby values of the form, with zero set exactly
\(u=0\). The given end form keeps the zeros on a compact core, so the
embedded one-manifold of zeros has finitely many circle components.

In a common global background splitting, compatibility is the affine
constraint \(B\omega_+=\omega_-\) in the convex operator ball \(\|B\|<1\).
An end cutoff equal to one on a smaller end fixes its graph there. Fixing
the volume to equal the background volume then gives the Euclidean
representative there. Under inversion its pullback is exactly
\(\rho^{-4}\delta_y\). A positive rescaling equal to \(\rho^4\) on the
smaller end therefore extends as the flat metric in the original marked
chart. The complete Euclidean end metric and the compact metric have the
same star in degree two on \(X\). For a constant symmetric positive metric
matrix \(H\), every matrix \(R_\nu^{\mathsf T} H R_\nu\) has the same trace.
A common conformal ray would therefore require equality of the matrices.
Choosing an eigenvector reflection and then a reflection interchanging an
arbitrary pair of eigenvectors gives equality of all eigenvalues. The
allowed constant metrics in the original \(x\) are exactly the positive
Euclidean multiples. An end change \(x'=Lx\) has compactifying transition
\(I L I\), homogeneous of degree one. Its differentiability would make it
linear, and \(L^{-1} I L I\) preserves every line, with scalar factor
\(|y|^2/|Ly|^2\). This proves the claimed similarity restriction. The
cut-off flow in E04 acts on the form without changing the original smooth
atlas, and fixes the entire zero set by taking the support outside its
compact core. Its at-most-linear growth on a finite time interval gives a
global flow, and the least singular values of \(L_t\) control the outer
region where that flow equals \(L_t\).

## Converse tests

**Explicit project check.** A fixed-normal-chart counterexample independent
of A1 follows from the first mode of the [E03 calibration](../notes/E03_ALGEBRA.md#4-the-explicit-family-on-the-standard-sphere).
Choose \(\varepsilon=1\), and write the compact representative near \(p\)
as \(\rho^4 I^*g_\varepsilon\), extending by a positive conformal multiplier
on the interior. In \(y=\rho q\) this has radial coefficient 1, no mixed
radial-angular terms, and Euclidean value at the origin. Hence each radial
line is a unit-speed geodesic from the origin, and \(y\) is a normal chart for
this representative. The explicitly closed self-dual pole form is
\(\omega_1=d(r^2F_1(r^2)\sigma_1)\) with
\(F_1(t)=\exp(-1/(1+t))\). Its only possible constant end value in \(x\) is
\(d(r^2\sigma_1)\), its asymptotic limit. On a sphere of radius \(r\) the
restrictions differ by the factor \(F_1(r^2)\ne1\), since
\(d\sigma_1=2\sigma_2\wedge\sigma_3\). This pole form is nowhere zero. The
counterexample concerns exact constancy in the specified chart.

For a pole form that is already transverse at its zeros, E04's correction
on the end is valid. The primitive estimate \(a=O(r^{-1})\) and
\(d\chi_R=O(R^{-1})\) put both terms of
\(d(\chi_R a)=\chi_R da+d\chi_R\wedge a\) at order \(R^{-2}\) on the
transition annulus. Openness of positivity gives the exact-end modification
while fixing a core containing all zeros.

## SP4-POLE-E06 — a degenerate zero on the standard sphere

**Working project theorem using A1 and B02.** There is a nonzero pole form
on the standard smooth sphere whose intrinsic derivative at a zero has rank
less than three. The [E06 request](../research-progress/handoffs/REQUEST_E06_DEGENERATE_ZERO_20261127.md)
uses the A1 note at SHA-256 prefix `db13563024da1a55` and B02 at prefix
`26d3a59ecf16a90b`.

**Import with checked local hypotheses.** Start with the constant standard
symplectic form \(\omega_0\), expressed in an orthonormal frame of the
geometric orientation on \(X=\mathbb R^4\). Taubes's Proposition 2.1
with \(n=0\) gives a closed form \(\omega_1\) positive off a new zero
circle. Its proof, including Part 5, modifies \(\omega_0\) on a compact
subset of a Darboux chart, with equality for \(r\ge 32\delta\) in that
construction. I read the proposition and Parts 1 and 5 on 27 November 2026.
[Taubes, *Mathematical Research Letters* **13** (2006), 557–570, §2, pp. 558–561, DOI 10.4310/MRL.2006.v13.n4.a6](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806605523900329985-1806605523900329985-9fa5106dca972fdc95f65c34eac2bf03.pdf#page=2)

The derivative at the new circle meets E04's positivity criterion as
follows. With the standard complex orientation in Taubes's local coordinates
\((z,w)\), his (2.2) has values in the Euclidean self-dual span of the
Kähler form and the real and imaginary parts of \(dz\wedge dw\).
Equations (2.2) and (2.5) write the form as \(T^{-1}\mu\) on the inner
ball of radius \(\delta=(2\epsilon)^{1/2}\), with \(T>0\) and coefficient
functions \(-\epsilon+|z|^2-|w|^2\) and \(zw-R\bar w\), the latter viewed
as two real coefficients. At the circle \(w=0, |z|^2=\epsilon\) the
first differential is \(2\operatorname{Re}(\bar z\,dz)\), nonzero in
the radial \(z\) direction. The differential of the second in the \(w\)
plane is \(v\mapsto zv-R\bar v\), whose real determinant is
\(\epsilon-R^2\ne0\) by the choice of \(R\). Thus the intrinsic image
is the full self-dual three-plane. The scaling by \(T^{-1}\) and
orientation-preserving Darboux coordinates preserve the rank and wedge
positivity. The circle lies inside the inner ball and is the only zero
component of the constructed form.

Apply E04 at both ends of the proposed path to choose smooth compact metrics
\(g_0,g_1\), both exactly \(\delta_y\) near \(p\), realizing \(\omega_0\)
and \(\omega_1\). Along \(g_t=(1-t)g_0+t g_1\) keep the mark and the same
nonzero leading coefficient. By A1 the unique pole forms at the two
endpoints are the prescribed forms. By [B02](../brainstorm/notes/B02_OPENNESS.md),
the forms vary smoothly on compact subsets and are uniformly nonzero on a
common sufficiently distant end. The latter follows by a finite cover of
the compact parameter interval by the neighborhoods with the B02 uniform
bound. The set of parameters with zeros is then the projection of a closed
subset of the compact product of the interval with the core. It has a least
element \(t_*>0\). At any zero for \(t=t_*\), choose a local smooth
trivialization of the varying \(\Lambda^+_{g_t}\). A rank-three zero
would restrict to an invertible derivative on a three-dimensional slice.
The parameter implicit function theorem gives zeros on that slice for nearby
earlier parameters, a contradiction. This counterexample to universal
transversality is independent of the choice of end chart. It uses the
project's A1 and B02 results at their current evidence levels.
