# SP4-CUT-E02 · bibliography and primary passages

27 November 2026 (UTC), for Edward B. Baker III with OpenAI Codex assistance. The [frozen supporting E request](E02_SOURCE_REQUEST_20261127.md) requested GPT-6.2 Sol/ultra. Actual helper and lead serving settings were unavailable. The five child records and [shared bibliography](../../../../../references/references.bib) were read at `72068ce`. The checks below are fresh online readings of the listed passages. Linked child receipts give the earlier inspections, detailed applications and project inputs. No third-party reading copies were retained.

## Citation keys at the frozen baseline

| Parent use | Reusable key or action |
| --- | --- |
| APS signature correction and spherical quotient defect | `AtiyahPatodiSinger1975I`, `AtiyahPatodiSinger1975II` are already used by the parent. `APS1975SpectralI`, `APS1975SpectralII` index the same two articles and are live in other manuscripts. Keep both pairs usable until any repository-wide consolidation migrates their consumers. The two article DOIs are `10.1017/S0305004100049410` and `10.1017/S0305004100051872`. [Cambridge I](https://doi.org/10.1017/S0305004100049410) · [Cambridge II](https://doi.org/10.1017/S0305004100051872). |
| Analytic collar and whole-ball filling | Add `LeBrun1980ComplexGeodesics` for the general analytic pair. The existing `LeBrun1982HSpace` is a distinct paper on analytic self-dual Einstein conformal infinities. `Biquard2002Autoduales` already covers the whole standard ball under additional conditions, as detailed in the [ledger replay][ledger]. |
| Analytic propagation away from an umbilic cut | `LassasLiimatainen2019ConformalHarmonic` already records the inspected preprint. The journal article has the same title, *Communications in Analysis and Geometry* **31**(8), 2101–2155, DOI `10.4310/CAG.2023.v31.n8.a8` (institutional publication date 2024). Retain the key and preprint version for the theorem numbers checked here. [Institutional metadata](https://researchportal.helsinki.fi/en/publications/conformal-harmonic-coordinates/). |
| Uniform bending | `Brendle2021Isoperimetric` already records the article (DOI `10.1090/jams/969`). Add `Nash1956Embedding`. |
| First width and near-round compactness | `Zhou2015MinMax` already records the article and linked preprint (DOI `10.4310/jdg/1427202766`). Add `Sharp2017Compactness`, and `Zhou2017MinMax` if the nonorientable stability alternative is discussed. |
| Core exterior | `ChenZhu2014Conformal` already records the article (DOI `10.4310/CAG.2014.V22.N5.A2`). Add `BourCarron2015Optimal`, `DingGeiges2010Diffeotopy`, `Gordon1976Knots`, `Kotschick2017Formal`, `CarlottoLi2024Boundary` where used. |

## Ledger and analytic collar

- **Atiyah–Patodi–Singer I, Theorem (4.14), printed p. 66.** The signature formula applies to a compact oriented Riemannian \(4k\)-manifold with metric an exact product near the boundary. The relative intersection-form signature is computed on the image of relative middle cohomology in absolute middle cohomology. The boundary correction in this signature formula is the eta value of the indicated odd signature operator on even forms, with outward-first orientation as identified in the [ledger replay][ledger]. There is no added kernel term in this formula. For a nonproduct metric the ledger derives its own transgression after product replacement. [Published scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24).
- **Atiyah–Patodi–Singer II, Proposition (2.12) and following fixed-point formulas, printed pp. 412–413.** In the finite equivariant spherical model, the oriented two-plane rotation factor at the isolated fixed point in four real dimensions is \(-\cot(\theta_1/2)\cot(\theta_2/2)\). The averaging argument and the left/right quaternionic orientation check are in the [ledger replay][ledger]. Equation (4.7) concerns variation of eta. The parent signature-eta conformal invariance can be proved directly by its cylinder transgression. [Published scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf#page=8).
- **LeBrun, Oxford D.Phil. thesis (1980), §3.6, Theorem (3.6.1), printed p. 101 and following smooth counterstatement, p. 102.** A real-analytic three-fold specified with a real-analytic positive-definite conformal metric and a real-analytic real second conformal fundamental form has a locally unique realization as an analytic hypersurface in a positive-definite real-analytic half-flat conformal four-fold. This is a local realization of the weighted trace-free second form. Use a marked normal and orientation when assigning which Weyl block vanishes. The next theorem expressly rules out a general replacement of real-analytic data by smooth data. [Oxford thesis record](https://ora.ox.ac.uk/objects/uuid%3Ae29dd99c-0437-4956-8280-89dda76fa3f8) · [Thesis scan](https://ora.ox.ac.uk/objects/uuid%3Ae29dd99c-0437-4956-8280-89dda76fa3f8/files/m9a6dd0bf9c662338c39481f32f64fdbb).
- **Lassas–Liimatainen, arXiv:1912.08030v2 (20 December 2019), Theorems 3.7(c) and 3.8, preprint pp. 26–28.** In even dimension \(n\ge4\), a \(C^r\) Riemannian metric, \(r>n-1\), on a manifold without boundary has an analytic determinant-normalized representative in its interior conformal harmonic charts where the obstruction tensor vanishes. Theorem 3.8 gives local conformal flatness at every point when the ambient manifold is connected and the Weyl tensor vanishes on a nonempty open set. Across a cut in a globally smooth opposite-half-flat metric, first show the smooth metric is Bach-flat on the two open sides and hence on the seam by continuity. The obstruction tensor in dimension four is Bach up to convention. Analyticity can then propagate a locally vanishing Weyl block in a connected chart across the cut, with the project argument establishing the open flat set, or propagate both blocks by the same analytic identity principle. This invocation is for a globally smooth ambient class. [Author preprint](https://arxiv.org/pdf/1912.08030v2#page=26).

## Uniform bending, width and compactness

- **Brendle, Theorem 1 and §2, arXiv:1907.09446v4 (6 October 2020).** For a compact \(n\)-dimensional Euclidean submanifold in codimension \(m\ge2\), possibly with boundary, and positive smooth \(f\), the lower Sobolev constant in Theorem 1 is \(n((n+m)|B^{n+m}|/(m|B^m|))^{1/n}\). The left side integrates \(\sqrt{|\nabla f|^2+f^2|\mathbf H|^2}\) and adds the boundary integral of \(f\). The mean-curvature vector is the trace of the Euclidean second fundamental form. The closed-level application takes \(n=3\), \(f=1\) and no boundary term, using the constant for the actual ambient codimension. The ambient correction when passing to intrinsic bending on a fixed Riemannian four-manifold uses the second fundamental form of its one isometric embedding. [Author preprint](https://arxiv.org/pdf/1907.09446#page=1) · [seam source receipt][seam].
- **Nash, Part C, Theorem 2, printed p. 59.** The compact Riemannian embedding theorem applies to a compact \(n\)-manifold with a positive definite \(C^k\) metric, \(3\le k\le\infty\), giving an isometric \(C^k\) Euclidean embedding. The parent uses the smooth case, for one fixed compact ambient manifold and metric. The second fundamental form of this embedding has a finite uniform bound by compactness. Trivial Euclidean directions can be added if required to meet Brendle's codimension premise. Checked the journal scan and its overview of Theorem 2. [Journal scan](https://mccuan.math.gatech.edu/courses/6455/nash55.pdf#page=40) · [Text-extracted journal scan](https://sites.math.rutgers.edu/~feehan/teaching/math866/nash.pdf).
- **Zhou 2015, arXiv:1210.2112v2 (18 October 2012), Theorems 1.1, 1.3, 1.5 and Remark 1.4.** On a connected closed orientable Riemannian \((n+1)\)-manifold of positive Ricci curvature with \(2\le n\le6\), the integral fundamental-class min-max hypersurface is connected and embedded, with multiplicity one and index one in the orientable case and multiplicity two in the nonorientable case. The width minimizes the area of orientable candidates and twice the area of nonorientable candidates. In the absence of nonorientable embedded hypersurfaces the realizer is orientable and has least area among all closed embedded minimal hypersurfaces. Simple connectivity supplies this exclusion by Remark 1.4, and an orientable hypersurface in the orientable ambient manifold is two-sided. For interpolation, Theorems 5.5 and 5.8 use a flat-continuous integral cycle path with zero endpoints, no mass concentration and bounded mass. The fundamental-class assertion additionally needs the boundary-of-regions family with empty/full endpoints and volume continuity. These interpolation statements require no positive Ricci assumption. [Author preprint](https://arxiv.org/pdf/1210.2112v2) · [geometry source receipt][geo].
- **Zhou 2017, arXiv:1504.00966v2 (30 November 2016), Theorem 1.1(ii), §2.4 and §6 Claim 5.** The expanded positive-Ricci theorem treats a closed connected oriented Riemannian ambient manifold in arbitrary dimension, allowing the stated singular set of codimension at least seven in the hypersurface. Its nonorientable multiplicity-two branch is stable for compactly supported sections of the normal bundle on the regular part. On the orientable double cover the corresponding variations are the odd functions under the deck involution. [Author preprint](https://arxiv.org/pdf/1504.00966).
- **Sharp, arXiv:1501.02703v1 (12 January 2015), Theorem A.6, Corollary A.7 and Remark A.4.** Uniform area and index bounds for closed connected embedded hypersurfaces, \(2\le n\le6\), and smooth convergence of metrics on one closed ambient manifold supply subsequential compactness. Positive Ricci curvature of the limit upgrades this to smooth single-sheet graphical convergence. Remark A.4 gives local stable compactness for integrands converging in \(C^3\) with the uniform structural conditions (8)–(12) and the requisite area bound. A global finite-\(C^4\) neighborhood requires the additional argument in the [geometry source receipt][geo]. [Author preprint, Appendix A](https://arxiv.org/pdf/1501.02703#page=14) · [Publication metadata](https://wrap.warwick.ac.uk/id/eprint/129477/).

## Core exterior

- **Bour–Carron, Corollary 1.3(iii), pp. 44–45, and §7.2, p. 61.** For a smooth closed oriented Riemannian four-manifold of positive Yamabe class satisfying (1.8), the branch \(b_1>0\) gives equality, \(b_1=1\), \(b_2=0\), and a conformal equivalence to a quotient of the round product \(S^3\times\mathbb R\). The pinching inequality is \(\int (|W|^2+\tfrac12|Z|^2)\le\tfrac1{24}\int R^2\), with curvature-operator squared Weyl norm. The child obtains (1.8) with equality on the smooth zero-Weyl double by its Euler identity. Identifying the reflected action and the marked pair is a separate step in the [exterior source receipt][tuberead]. [Published article](https://www.numdam.org/item/10.24033/asens.2238.pdf#page=6).
- **Chen–Zhu, Theorems 1.4 and 1.6, (1.5), (1.9), (1.11), printed pp. 813–815.** For a smooth closed Riemannian four-manifold with positive class Yamabe constant \(Y\), the integral of \((\max\{\lambda_{\max}(W^+),\lambda_{\max}(W^-)\})^2\) strictly below \(Y^2/36\) gives a diffeomorphism type that is a connected sum of spherical and cylindrical quotient factors of the stated kind. At equality, either the same topology occurs, the class is conformally Fubini–Study on \(\mathbb{CP}^2\), or the universal cover is conformal to a product of constant-curvature surfaces with curvatures whose sum is positive. Apply the strict theorem after a smoothing that preserves the strict margin. The equality theorem has a smooth metric premise. The marked pair requires the separate exterior argument. [Published article](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1805784609151475713-1805784609151475713-dfd4e7a2ab88de50d337d60e7620a3c8.pdf#page=3) · [exterior source receipt][tuberead].
- **Ding–Geiges, §2, Proposition 2, p. 1098.** The smooth diffeotopy kernel of the action on homology of \(S^1\times S^2\) consists of the identity and the twist. The split homology action and explicit circle reversal and sphere antipodal maps in the same section give representatives for all components, including orientation-reversing maps. On the standard exterior \(S^1\times D^3\) the formulas extend the sphere maps radially, and the boundary isotopy extends in a collar. This marking argument depends on an already identified smooth standard exterior. [Published article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/537877E89BFF957F24AF6F4C2E4E80D0/S0010437X09004606a.pdf/the-diffeotopy-group-of-s1s2-via-contact-topology.pdf#page=3).
- **Gordon, §3 Theorem 3.1 and Remark (2), pp. 587–588.** A twist-spin of a classical knot \(S^1\subset S^3\) with any integral twist number has standard total space after the alternate Gluck regluing. The article is phrased in PL language initially. Remark (2) explicitly states that its proofs in Propositions 3.2–3.3 also apply in the smooth category and give a diffeomorphism to the standard sphere. The return can cite this for the alternate smooth filling of an actual twist-spin exterior. [Published scan](https://www.e-periodica.ch/cntmng?pid=com-001%3A1976%3A51%3A%3A41).
- **Kotschick, Theorem 5, p. 440, and final paragraph of the proof of Theorem 8, pp. 443–444.** For closed connected oriented three-manifolds, rational inessentiality, absence of aspherical prime summands, the connected sum of spherical space forms and \(S^1\times S^2\) factors, and existence of a positive scalar curvature metric are equivalent. Theorem 8 is stated for geometrically formal four-manifolds. The argument on pp. 443–444 starts once the smooth oriented total space is already known to be a mapping torus: a positive-scalar-curvature representative of the fiber homology class maps to the marked fiber with total degree one after lifting along the fibration. The restriction of the pullback of the circle class to that representative vanishes because the class is Poincaré dual to the representative, whose oriented normal line is trivial. The classifying map and nonzero degree give rational inessentiality of the fiber. In the exterior application, establish the actual doubled bundle and apply this argument to its closed doubled fiber. [Published article](https://intlpress.com/site/pub/files/_fulltext/journals/pamq/2017/0013/0003/PAMQ-2017-0013-0003-a003.pdf#page=7) · [exterior source receipt][tuberead].
- **Carlotto–Li, Theorem 1.3 and Remark 4.9.** For a compact three-manifold with boundary, the space of positive-scalar-curvature metrics that reflect smoothly across the boundary is empty or weakly contractible. In the compact orientable case nonemptiness is characterized by a finite interior connected sum of handlebodies, spherical space forms and \(S^2\times S^1\) factors. This supplies a path between positive doubling metrics on the punctured fiber, including the pullback endpoint under the monodromy once the smooth bundle marking is fixed. Smooth choice of a slow path and its use in constructing a positive metric on the actual doubled mapping torus are project arguments. [Published article, §§1, 2 and 4](https://onlinelibrary.wiley.com/doi/full/10.1002/cpa.22153) · [exterior source receipt][tuberead].

The [slide source receipt][slide] records the marked surgery, domination and width references. The [seam][seam] and [geometry][geo] receipts retain the remaining dependencies and their inspection levels. The [exterior handoff][tube] records the separately proved meridian and relative gluing conclusions. The marked exterior deductions and their hypotheses are recorded in the exterior receipts.

## New BibTeX entries for insertion

```bibtex
@phdthesis{LeBrun1980ComplexGeodesics,
  author = {LeBrun, Jr., C. R.},
  title = {Spaces of Complex Geodesics and Related Structures},
  school = {University of Oxford},
  year = {1980},
  url = {https://ora.ox.ac.uk/objects/uuid%3Ae29dd99c-0437-4956-8280-89dda76fa3f8}
}

@article{Nash1956Embedding,
  author = {Nash, John},
  title = {The Imbedding Problem for {Riemannian} Manifolds},
  journal = {Annals of Mathematics},
  volume = {63}, number = {1}, pages = {20--63}, year = {1956},
  doi = {10.2307/1969989}
}

@article{Sharp2017Compactness,
  author = {Sharp, Ben},
  title = {Compactness of minimal hypersurfaces with bounded index},
  journal = {Journal of Differential Geometry},
  volume = {106}, number = {2}, pages = {317--339}, year = {2017},
  doi = {10.4310/jdg/1497405628},
  eprint = {1501.02703}, archivePrefix = {arXiv},
  url = {https://arxiv.org/abs/1501.02703}
}

@article{Zhou2017MinMax,
  author = {Zhou, Xin},
  title = {Min-max hypersurface in manifold of positive {Ricci} curvature},
  journal = {Journal of Differential Geometry},
  volume = {105}, number = {2}, pages = {291--343}, year = {2017},
  doi = {10.4310/jdg/1486522816},
  eprint = {1504.00966}, archivePrefix = {arXiv},
  url = {https://arxiv.org/abs/1504.00966}
}

@article{BourCarron2015Optimal,
  author = {Bour, Vincent and Carron, Gilles},
  title = {Optimal integral pinching results},
  journal = {Annales Scientifiques de l'{\'E}cole Normale Sup{\'e}rieure},
  series = {4}, volume = {48}, number = {1}, pages = {41--70}, year = {2015},
  doi = {10.24033/asens.2238},
  url = {https://www.numdam.org/articles/10.24033/asens.2238/}
}

@article{DingGeiges2010Diffeotopy,
  author = {Ding, Fan and Geiges, Hansj{\"o}rg},
  title = {The diffeotopy group of {$S^1\times S^2$} via contact topology},
  journal = {Compositio Mathematica},
  volume = {146}, number = {4}, pages = {1096--1112}, year = {2010},
  doi = {10.1112/S0010437X09004606},
  eprint = {0903.1488}, archivePrefix = {arXiv},
  url = {https://arxiv.org/abs/0903.1488}
}

@article{Gordon1976Knots,
  author = {Gordon, C. McA.},
  title = {Knots in the 4-sphere},
  journal = {Commentarii Mathematici Helvetici},
  volume = {51}, number = {4}, pages = {585--596}, year = {1976},
  doi = {10.1007/BF02568175}
}

@article{Kotschick2017Formal,
  author = {Kotschick, Dieter},
  title = {Geometric formality and non-negative scalar curvature},
  journal = {Pure and Applied Mathematics Quarterly},
  volume = {13}, number = {3}, pages = {437--451}, year = {2017},
  doi = {10.4310/pamq.2017.v13.n3.a3},
  eprint = {1212.3317}, archivePrefix = {arXiv},
  url = {https://arxiv.org/abs/1212.3317}
}

@article{CarlottoLi2024Boundary,
  author = {Carlotto, Alessandro and Li, Chao},
  title = {Constrained deformations of positive scalar curvature metrics, {II}},
  journal = {Communications on Pure and Applied Mathematics},
  volume = {77}, number = {1}, pages = {795--862}, year = {2024},
  doi = {10.1002/cpa.22153},
  eprint = {2107.11161}, archivePrefix = {arXiv},
  url = {https://onlinelibrary.wiley.com/doi/full/10.1002/cpa.22153}
}
```

[ledger]: ../../01_chirality_ledger/reviews/LEDGER_SOURCE_REPLAY.md
[seam]: ../../02_seams_and_marked_cuts/references/SOURCES_20261127.md
[tube]: ../../03_tubes_and_exteriors/research-progress/handoffs/TO_PARENT_SOURCE_UPDATES_20261127.md
[tuberead]: ../../03_tubes_and_exteriors/references/READING_20261127.md
[slide]: ../../04_slide_filters/references/SOURCES_20261127.md
[geo]: ../../05_cuts_from_geometry/references/SOURCE_CHECKS_20261127.md
