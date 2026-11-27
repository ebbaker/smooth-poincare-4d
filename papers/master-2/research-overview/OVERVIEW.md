# Research overview — second master

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. The [register](../research-progress/REGISTER.md) alone owns live status. This overview fixes the setting and the conventions for the six investigations of the [second series](../../investigations-2/README.md), which cite it instead of repeating it.

## The question and the frame

Three statements make up the frame.

- **A1 (existence).** For every smooth conformal class $c$ on a homotopy four-sphere $M$ and every $p\in M$, the closed $c$-self-dual two-forms on $M\setminus p$ with a pole of order four at $p$ form a three-dimensional space, with an explicit leading term. *Project theorem; a proof sketch of one session, unread.*
- **A2 (recognition).** If one nonzero such form has no zeros, $M$ is diffeomorphic to $S^4$. *Project theorem resting on one import, the theorem of Gromov and McDuff on symplectic four-manifolds that are standard at infinity; a proof sketch, unread.*
- **Z (zero-freeness).** Every $M$ carries some $c$ and $p$ with a zero-free pole form. *Open.*

Given A1 and A2, statement Z is equivalent to smooth Poincaré, because on the round sphere the pole forms are the constant self-dual forms of $\mathbb R^4$. The equivalence is a reformulation of the conjecture and is not progress on existence. What the frame changes is the location of the difficulty: existence of the object is linear analysis, recognition is imported, and all that is open is the zero set of a closed self-dual form.

## Fixed setting and conventions

- *Category and signature.* $M$ is a closed, connected, oriented smooth four-manifold homotopy equivalent to $S^4$, in the smooth category. All metrics are smooth and Riemannian, and $c$ is a conformal class of such metrics. No complex, neutral or Lorentzian structure is used anywhere in this series.
- *Orientation and chirality.* $\Lambda^\pm$ are the $\pm1$ eigenbundles of the Hodge star on two-forms, which depends only on $c$. Self-dual means $\Lambda^+$ for the given orientation of $M$. Reversing the orientation exchanges the two bundles; every statement is made for one orientation and holds for the other with the roles exchanged. For a one-form $A$, $d^\pm A$ are the two components of $dA$.
- *Norms.* The norm on two-forms has $|e^1\wedge e^2|=1$ for an orthonormal coframe, so $\omega\wedge\omega=|\omega|^2dV$ for a self-dual $\omega$. The $L^2$ norm of a two-form depends only on $c$.
- *Curvature and energies.* As in the [first master](../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex): the curvature operator of the unit sphere is the identity, $W^\pm$ are trace-free symmetric endomorphisms of $\Lambda^\pm$ with Hilbert–Schmidt norms, $e=E_+=E_-$ on $M$, $T=4\pi^2$, and $Y(c)$ is the Yamabe constant of the conformal Laplacian $-6\Delta+R$. These enter only in the bridge question and in calibrations.
- *The puncture.* $p\in M$, $X=M\setminus p$, which is contractible. For $g\in c$, $y$ are normal coordinates at $p$ and $x=y/|y|^2$ the inverted coordinates, with $r=|x|$. Near infinity means near $p$. The metric $|y|^{-4}g$ is asymptotically Euclidean of order two in $x$. A form is standard at infinity when it has constant coefficients in $x$ outside a compact set.
- *The transform.* $T_c:L^2(\Lambda^-)\to L^2(\Lambda^+)$, $d^-A\mapsto d^+A$. It is a well-defined isometry because $b_1(M)=b_2(M)=0$.
- *Pole forms.* $\mathcal H_p(c)$ is the space of closed $c$-self-dual two-forms $\omega$ on $X$ with $|\omega|_g=O(d_g(p,\cdot)^{-4})$. Its elements are the pole forms of $(M,c,p)$. In the chart $y$ a pole form has leading term $|y|^{-4}R_y^*\eta$, with $R_y$ the reflection in the hyperplane orthogonal to $y$ and $\eta$ a constant anti-self-dual form, its leading coefficient. The conformal weight of $\eta$ and its dependence on the chart are fixed by task POLE-B01.
- *The triple.* For a basis $\eta_1,\eta_2,\eta_3$ of $\Lambda^-_p$ the forms $\omega_1,\omega_2,\omega_3$ are a pole triple, and $\omega_u=\sum u_i\omega_i$. The evaluation map is $\mathrm{ev}_q:\Lambda^-_p\to\Lambda^+_q$. The Gram matrix is $Q_{ij}\,dV=\omega_i\wedge\omega_j$. The triple is definite at $q$ when $\mathrm{ev}_q$ is invertible. The degeneracy set is $H=\{q:\det\mathrm{ev}_q=0\}$, and the kernel map $\kappa$ sends a point of $H$ where the rank is two to the line of $u$ with $\omega_u(q)=0$. A zero circle is a component of the zero set of one $\omega_u$.
- *Weights.* Weight $\delta$ means decay $O(r^\delta)$ at infinity; the operator $d^*\oplus d^-$ lowers the weight by one.
- *Named objects.* The calibration family $c_\varepsilon$, $\varepsilon>-4$, of section 3.5 of the [proposing note](../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md). The prism closings $\Sigma_{\rm ev}$ and $\Sigma_{\rm odd}$ of the [first master's prism section](../../master/manuscript/claude/even_prism_closing.tex). The presentation sphere $\Sigma_P$ of [investigation 07](../../investigations-1/07_positive_subcritical_entry/notes/PRESENTATION_SOURCES.md).
- *Labels.* Import, project theorem (working, replayed, established), certificate and heuristic, as defined in the [working rules](../../investigations-2/README.md#working-rules).

## What is inherited, with evidence level

| Statement | Source | Evidence level |
| --- | --- | --- |
| A1 and A2 | Sections 3.2 and 3.3 of the [proposing note](../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md) | Proof sketches written in one session; not read by anyone else; the analytic part has no script |
| Inversion formula, self-duality of $d(f\sigma_i)$ on diagonal Bianchi IX metrics, the family $c_\varepsilon$ with its energies | `check_06` of the note's [checks](../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/README.md) | Checked case: symbolic identities and numerical integrals, with $E_+=E_-$ as a built-in test |
| Every near-symplectic form on $X$ that is standard at infinity is a pole form of some class | Section 3.4 of the note | Derived from A1 and a standard local construction that was not written out |
| Gromov–McDuff, with agreement at infinity | McDuff–Salamon, Theorem 9.4.2 | Import; read as quoted in two later papers, the book not opened |
| Zero circles, their number and parity; curves bounding the zero set | Perutz; Taubes; Gerig | Imports; abstracts and excerpts |
| The invariants of $M\#\mathbb{CP}^2$ equal those of $\mathbb{CP}^2$ in the relevant chamber | Section 3.6 of the note | Heuristic; no source checked |
| Recognition from low entropy | Chodosh–Mantoulidis–Schulze, Corollary 1.5 | Import; read through a summarizing reader |
| The even prism closing | [First master, prism section](../../master/manuscript/claude/even_prism_closing.tex) | Working proof of the tube investigation with two model replays; group computation replayed by `check_05`; the tangle diagram not rederived |

## Inputs that need a global extension

The leading term of a pole form is a local computation at $p$; that it extends to a closed self-dual form on all of $X$, uniquely, is the weighted Fredholm argument of A1, which is not written in full. A2 needs the clause of the imported theorem that the symplectomorphism agrees with the given chart at infinity; without it the conclusion would be only that $X$ is diffeomorphic to $\mathbb R^4$. The identification of pole forms with near-symplectic forms needs a metric that is flat near infinity and makes a given form self-dual. Transversality of the zero set, proved in the literature for harmonic forms on closed manifolds, has not been proved for pole forms. The map from $X\times S^2$ to the twistor space of $X$ given by the normalized triple is real, is defined only off the zero sets and is linear on each fibre; the twistor space carries the Atiyah–Hitchin–Singer almost complex structure, which is integrable only when $W^+=0$, and no integrability or holomorphy is assumed anywhere.

## The route and its gates

1. [Investigation 01](../../investigations-2/01_chiral_transfer_and_pole_forms/README.md) writes A1 and A2 in full and has them replayed.
2. [Investigation 02](../../investigations-2/02_zero_circles/README.md) computes pole forms on $S^4$ and answers the bridge question: does a positive class with $e<8\pi^2$ on $S^4$ always have a zero-free pole form at some point? **Gate 1** (SP4-M2-B02) is decided on its return. A counterexample closes the bridge to the first master and the second master stands alone. If none is found in the stated scope, the statement that an entered class has a zero-free pole form is recorded as open and offered to the first master as a form of its recognition statement.
3. Investigations 02 and [03](../../investigations-2/03_lines_and_broken_fibrations/README.md) study the last zero circle. **Gate 2** (SP4-M2-B03) is decided after a number of sessions that the author fixes: if no mechanism removes or constrains the last circle, the frame is recorded as a reformulation and the effort moves.
4. [Investigations 04](../../investigations-2/04_entropy_of_embeddings/README.md), [05](../../investigations-2/05_certificates/README.md) and [06](../../investigations-2/06_invariants_and_candidates/README.md) do not depend on the frame. **Gate 3** (SP4-M2-B04): if the sweeps of 05 isolate named spheres that resist every recognition tried, the effort moves to 06.

## Relation to the first master

The [first master](../../master/README.md) reduces the conjecture to entry into the band $e<8\pi^2$ and recognition there. Nothing in it is changed. The two frames meet in the bridge question of gate 1, and the regularity of an attained Bach-flat minimizer from [investigation 06 of the first series](../../investigations-1/06_bour_flow_and_fixed_type_attainment/README.md) would be the natural place to study pole forms at subcritical energy. The calibration family shows that A2 is not an energy criterion: its triple is definite at energies far above the wall.

## Unresolved decisions

The normalization of the kernel of $T_c$ and of the leading coefficient (POLE-B01). The topology in which zero-freeness is open (POLE-B02). The number of sessions before gate 2, and whether and when a Lean edition for the second master is opened; both are questions for the author in the [register](../research-progress/REGISTER.md).

## Ownership

This branch owns the manuscript, the statements A1, A2 and Z as the children use them, and the three gate decisions. Each child owns its task family and its own files. Results that bear on the first master or the first series are returned to their registers by handoff, not written into their files.
