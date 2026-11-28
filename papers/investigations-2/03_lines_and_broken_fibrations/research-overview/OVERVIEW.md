# Research overview — Lines and broken fibrations

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. An investigation of the [second series](../../README.md). The [register](../research-progress/REGISTER.md) alone owns live status.

## Return of 27 November 2026

**Project theorem, replayed.** In the transverse marked setting, the single zero circle bounds a degree-zero finite-energy Taubes current disjoint from the line. Exactness gives one global irreducible component, weight one, and area equal to the absolute primitive period on the circle. Both chamber values have independent proofs. The first open boundary lemma asks for a single regular half-sheet along the entire twisted circle. The six original components and the fibration alternative are summarized in the [closing](../continuation-notes/CLOSING_20261127.md). The earlier expectations below are preserved as setup history.

## Objective

For a pole form with zeros, what do the pseudoholomorphic curves of the closed manifold $M\#\mathbb{CP}^2$ and the broken Lefschetz fibrations attached to the form say about removing its last zero circle?

Establish, from primary sources, exactly which published theorems apply to a pole form with zeros, state the last-circle problem in the analytic and in the combinatorial language, and choose a first attack on it or record that none is visible.

## Setting

The conventions are those of the [second master's overview](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions). This investigation adds the following.

- *Compactification.* A pole form made standard outside a compact set is, near infinity, the standard symplectic form of $\mathbb R^4$. Collapsing the Hopf circles of a large sphere turns $X$ into the closed manifold $M\#\mathbb{CP}^2$ with a closed two-form $\bar\omega$ that is symplectic off the zero set of the pole form, and with a sphere $L_\infty$ of self-intersection one, the line at infinity. Here $b_1=0$, $b_2^+=1$ and $b_2^-=0$. The construction is described in the proposing note and its details are task LINE-B01.
- *Near-symplectic forms.* A closed two-form that is symplectic off a union of circles along which it vanishes transversally. A zero circle is untwisted or twisted according to whether a certain line subbundle of its normal bundle is orientable; the definition is taken from the source in LINE-E03.
- *The last circle.* By Perutz's moves a form with zeros can be brought to one with a single circle, and by his parity statement a single circle on this manifold is twisted. The last-circle problem is to decide when it can be removed.
- *Lines.* Pseudoholomorphic curves in the class of $L_\infty$ for an almost complex structure compatible with $\bar\omega$ off its zero set.

## Inherited at setup, with its original evidence level

- **Number and parity of zero circles.** Perutz. Import; abstracts of both versions and excerpts of the statement of results.
- **Curves that bound the zero set.** Taubes: a nonzero Seiberg–Witten invariant gives a pseudoholomorphic curve in the complement of the zero set that bounds it homologically. Import; read only as quoted in Gerig's introduction.
- **Near-symplectic Gromov invariants.** Gerig: defined when all zero circles are untwisted, and equal to the Seiberg–Witten invariants modulo two. Import; abstracts and introductory excerpts.
- **The invariants of $M\#\mathbb{CP}^2$.** The proposing note expects them to equal those of $\mathbb{CP}^2$ in the chamber of a large multiple of $\bar\omega$, by a connected-sum principle and the wall-crossing formula. Heuristic; no source checked.
- **Broken Lefschetz fibrations and trisections.** Auroux, Donaldson and Katzarkov; Gay and Kirby; Lekili; Baykur and Saeki; Hayano's classification in genus one. Pointers and abstracts.
- **Gromov's proof.** The recognition theorem is proved by a family of lines that fills the manifold. A pointer; the proof was not read.

## Global extensions identified at setup

Gerig's theorem assumes untwisted circles, while the last circle here is twisted. The chamber in which the invariants are computed must be matched with the chamber of $\bar\omega$. The connected-sum statement is needed for a summand that is a homotopy sphere, with $b_2^+=1$ on the other side. Taubes's theorem gives one curve that bounds the zero set, not a family that fills the manifold, and the passage from such curves to a diffeomorphism is the whole difficulty. The dictionary with broken fibrations is proved for closed manifolds and must be checked for a form with a prescribed line at infinity.

## Place in the route at setup

This investigation and [02](../../02_zero_circles/README.md) feed [gate 2](../../../master-2/research-overview/OVERVIEW.md#the-route-and-its-gates): is there a mechanism that removes or constrains the last circle? Nothing here is on the route before the readings return, because every statement about curves is at present an import that has not been read or a heuristic.

## Decisions originally reserved

Whether the analytic path through curves or the combinatorial path through fibrations is tried first (LINE-B02). Whether a certificate format for the standardness of a diagram of fixed genus is worth defining (LINE-B03, reserved).

## Ownership

Owns the readings, the compactification, the statement of the last-circle problem and the dictionary. It does not own the local theory of zeros ([02](../../02_zero_circles/README.md)), certificate formats ([05](../../05_certificates/README.md)) or anything in the first series; a result that bears on the group trisections of 07 is sent there by handoff.
