# E24 · Periodic realization at the actual puncture

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and effort are unavailable. This is the bounded
[E24 request R1](../research-progress/handoffs/E24_REQUEST_R1.md), blob
\(\texttt{c42a72beefc7}\), at revision
\(\texttt{bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0}\).
The [E04 action audit](../reviews/E04_PARENT_AND_BOUND.md)
(\(\texttt{a817d034d6e4}\)) and [E05 periodic cases](E05_TWISTED_EXTERIORS.md)
(\(\texttt{25714f9fd973}\)) are the specific inputs for the terminal
recognition step. The argument concerns smooth oriented manifolds.

**Result.** Let \(Y=\Gamma\backslash SU(2)\) for a finite subgroup
\(\Gamma\) acting by left multiplication in the round metric, and let
\(P\) be \(Y\) with the interior of an actual smooth ball removed.
For every smooth orientation-preserving diffeomorphism
\(\varphi:P\to P\) carrying the boundary to itself, its mapping torus
is diffeomorphic, as a bundle with boundary, to one whose monodromy
is a finite-order round isometry preserving the puncture ball.
The bundle equivalence transports the two \(D^2\times S^2\)
framings as a pair. If the closing is a homotopy sphere, both
fillings are diffeomorphic to standard \(S^4\). The conclusion
uses no Weyl-energy or Yamabe bound.

## Closed and pointed realization

Write \(\mathcal I=\operatorname{Isom}^+(Y)\),
\(\mathcal D=\operatorname{Diff}^+(Y)\) and use a subscript \(p\)
for the stabilizers of the actual puncture point \(p\).
Right multiplication of \(SU(2)\) commutes with the deck group and
is transitive on \(Y\). Around each \(q\in Y\), a local lift of the
covering \(SU(2)\to Y\) gives a smooth local family of right
translations taking \(p\) to the varying point. Composing with
the inverse family identifies both evaluation maps at \(p\) as
locally trivial bundles, with fibers \(\mathcal I_p,\mathcal D_p\).
These are compatible trivializations of the map of fibrations
\[
\begin{array}{ccccc}
\mathcal I_p&\longrightarrow&\mathcal I&\xrightarrow{\mathrm{ev}_p}&Y\\
\downarrow&&\downarrow&&\Vert\\
\mathcal D_p&\longrightarrow&\mathcal D&\xrightarrow{\mathrm{ev}_p}&Y .
\end{array}
\]
Bamler–Kleiner Theorem 1.3 gives a homotopy equivalence for the
full isometry and diffeomorphism groups of an isometric round
quotient. It restricts to weak equivalences on the oriented
subgroups since the inclusion preserves orientation components.
Comparing the homotopy exact sequences gives a bijection on
\(\pi_0\) of the two fibers. In particular, the images of the
\(\pi_1\) terms in \(\pi_1(Y,p)\) are the same, so an unpointed
isotopy cannot silently discard the point-pushing class.
The inspected 2019 author version includes the trivial group
and \(\Gamma=C_2\), where \(Y=S^3,\mathbb{RP}^3\) respectively.
The earlier paper that excludes \(\mathbb{RP}^3\) is unnecessary
here. [Bamler–Kleiner, *Ricci flow and contractibility of spaces of
metrics*, Theorem 1.3 and §9 proof](https://escholarship.org/content/qt5z36g6jt/qt5z36g6jt_noSplash_16f120402b68a07462cf3d7695ae7ba3.pdf)

There is also a direct construction of the pointed representative
from an unpointed isotopy \(F_t\) that starts with \(F_0(p)=p\) and
ends at an isometry. Lift the path \(F_t(p)\) by the right
translations starting at the identity. If \(u_t\) is the
resulting path of isometries, \(u_t^{-1}F_t\) fixes \(p\) for
every \(t\) and ends at an isometry. Even a loop of point
positions is treated this way. For \(p=[1]\), its lift is a path
in \(SU(2)\) from \(1\) to some element of \(\Gamma\), and the
endpoint right translation belongs to \(\mathcal I_p\).
This argument alone gives the needed surjectivity on
\(\pi_0\), using only the unpointed component assertion and
transitivity. Any continuous path in the smooth topology of
the pointed group can be replaced by a smooth isotopy. Subdivide
into \(C^1\)-small successive changes and interpolate each
diffeomorphism near the identity by the exponential chart built
from a vector field. The field vanishes at \(p\) for a pointed
change, so the smoothing of the parameter keeps \(p\) fixed.

The point stabilizer \(\mathcal I_p\) is a compact Lie group.
Let \(a\) be a representative of one of its components and
\(C=\overline{\langle a\rangle}\). This is a compact abelian
Lie group with torus \(C^\circ\). For \(m\) the order of the
image of \(a\) in \(C/C^\circ\), choose an \(m\)-th root
\(b\in C^\circ\) of \(a^m\). Then \(g=ab^{-1}\) has finite
order and lies in the same component of \(\mathcal I_p\).
Its derivative at \(p\) is an orientation-preserving orthogonal
map, and in geodesic coordinates
\(g\exp_p(v)=\exp_p(D_pg\,v)\). The order of this derivative
equals the order of \(g\), since an isometry of a connected
complete manifold is determined by its value and derivative at
a point. Thus every sufficiently small round ball about this
same \(p\) is preserved, with its boundary acted on by this
actual rotation.

## Smooth comparison with the original puncture

One can first move any smooth embedded ball to a small geodesic
ball about its chosen center by an ambient isotopy fixing the
center. In a parametrized ball, restrict the parametrization to
successively smaller concentric subballs. At small radius replace
the resulting parametrization in normal coordinates by its
linearization, through embeddings by radial rescaling and then
through orientation-preserving linear maps. All these embeddings
fix the center. Their velocities extend to ambient vector fields
vanishing there, using a collar of the images, so the isotopy
extends to the ambient manifold. This transports the original
boundary marking instead of choosing a new one without a map.

After this comparison take \(P=Y\setminus\operatorname{int}
B_\epsilon(p)\) for a small geodesic ball. By uniqueness of a
boundary collar up to isotopy, \(\varphi\) can be straightened on a
smaller collar to \((r,\omega)\mapsto(r,h(\omega))\) with
\(h=\varphi|_{\partial P}\). Concretely the pullback of the target
collar \(c\) with parameter adjusted gives
\((r,\omega)\mapsto\varphi^{-1}(c(r,h(\omega)))\). This is
another smooth collar of the identity boundary embedding.
Integrating a collar-straightening isotopy
supported near the boundary gives this product form and keeps
the boundary map \(h\).

The oriented diffeomorphism group of \(S^2\) is path connected.
Choose a smooth path \(h_r\) of sphere diffeomorphisms,
identically the identity near \(r=0\) and identically \(h\) near
\(r=\epsilon\). Define \(F=\varphi\) outside the ball and
\((r,\omega)\mapsto(r,h_r(\omega))\) inside. This is a smooth
closed diffeomorphism fixing \(p\), with product jets at the
joining sphere. [Smale, *Diffeomorphisms of the 2-sphere*,
Proc. AMS 10 (1959), Theorem A](https://doi.org/10.1090/S0002-9939-1959-0112149-8)

Real blow-up of \(p\) in \(Y\) replaces the point by the unit
tangent directions with collar \(r\ge0\). Every smooth isotopy
fixing \(p\) acts smoothly on this blow-up. In the geodesic
chart a map \(F_t\) in the isotopy has
\[
F_t(r\omega)=r V_t(r,\omega),\qquad
V_t(r,\omega)=\int_0^1 D F_t(\theta r\omega)\,\omega\,d\theta .
\]
The pair \((r|V_t|,V_t/|V_t|)\) is smooth up to \(r=0\)
and its inverse is the blow-up of \(F_t^{-1}\).
At the boundary its value is \(D_pF_t\,\omega/|D_pF_t\,\omega|\).
The same formula proves smoothness in the isotopy parameter.

To see the comparison with the actual monodromy, the blow-up
adds the radial collar \(0\le r\le\epsilon\) at the boundary of
the original \(P\). The lifted \(F\) acts there by \(h_r\).
Replace \(h_r\) along this collar by
\(h_{(1-v)r+v\epsilon}\) for \(0\le v\le1\), leaving the
original \(P\) action fixed. Its parameter remains in the
constant range \(h\) near the joining sphere, so the isotopy
matches smoothly and ends with a constant boundary map \(h\)
on the added collar. An increasing radial reparametrization
identifies the enlarged collar with the collar in \(P\) and
intertwines the final product lifts. The pointed isotopy from
\(F\) to \(g\) now gives a boundary-preserving isotopy of the
actual punctured monodromy to \(g|_P\). At the terminal map the
radial reparametrization commutes with \(g\), since its geodesic
polar action is \((r,\omega)\mapsto(r,D_pg\,\omega)\).
The isotopy may move angular boundary points. That is why the
next step tracks the framing pair.

## Both marked fillings

Write the mapping torus convention as
\([t+1,x]=[t,\varphi(x)]\). Given a boundary-preserving isotopy
from \(\varphi\) to \(g|_P\), choose a path \(v_t\) of
diffeomorphisms from the identity to \(g^{-1}\varphi\) that is
constant near its two endpoints. Then
\([t,x]_{\varphi}\mapsto[t,v_t(x)]_g\) defines a smooth bundle
diffeomorphism with boundary, since \(g v_1=v_0\varphi\).
In particular it takes the geometric boundary to the boundary,
preserves the bundle-circle orientation, and takes the
peripheral cyclic subgroup to the peripheral cyclic subgroup.

In any product coordinates on \(S^1\times S^2\), the factor
reversals extend over \(D^2\times S^2\), and the third mapping
class generator is one full rotation of \(S^2\) along \(S^1\).
The smooth boundary classification therefore gives the two
possible fillings up to the extendible factor maps and a
collar isotopy. Composing a gluing with the induced boundary
map of the bundle equivalence permutes the two classes. No
identification of the individual labels follows without the
tracked angular isotopy. In particular, a sphere-frame path
can carry the parity in \(\pi_1(SO(3))=\mathbb Z/2\).
[Hatcher, *On the Diffeomorphism Group of \(S^1\times S^2\)*,
December 2003 revision, p. 1](https://www.maths.gla.ac.uk/~mpowell/Hatcher-newDiffS1xS2.pdf)
· [E05 boundary-action conventions](E05_TWISTED_EXTERIORS.md#periodic-punctured-monodromy)

Let \(d\) be the order of \(g\), and write its boundary
rotation as \(R_{2\pi k/d}\) about a fixed axis. With
\(\psi=2\pi t\) and \(w=R_{2\pi kt/d}x\) on the boundary,
suspension translation by \(d\theta/(2\pi)\) gives the circle
action
\[
  (\psi,w)\longmapsto(\psi+d\theta,R_{k\theta}w).
\]
The translation has least period \(d\) in the original
suspension time, so this circle action is effective. For cap
attachment \((\psi,w)\mapsto(\psi,R_{j\psi}w)\) from the cap
boundary to the exterior, with \(j=0,1\) for the two framings,
the cap action is
\[
  (z,w)\longmapsto(e^{id\theta}z,R_{(k-jd)\theta}w).
\]
Conjugation by the stated attaching map verifies the signs of
these weights. The cap action is smooth at \(z=0\). The
exterior radial boundary collar from the isometry and the cap
radial collar carry the same equivariant product action, so
the closed action is smooth across the gluing.

Both framings kill the same peripheral cyclic subgroup and
have the same Euler characteristic. In particular, if either
filling is a homotopy sphere then both are. For instance,
van Kampen kills the geometric meridian and
\(\chi(X_g)=0\), \(\chi(D^2\times S^2)=2\),
\(\chi(S^1\times S^2)=0\). Closed orientable duality and
simple connectivity then give the homology sphere and the
usual Hurewicz–Whitehead argument. Each homotopy-sphere
filling now carries a smooth effective circle action.
The checked smooth classification states that a closed
simply connected smooth four-manifold with such an action is
smoothly a connected sum of \(S^4\), signed
\(\mathbb{CP}^2\), and \(S^2\times S^2\).
Vanishing \(b_2\) leaves the standard \(S^4\).
This uses the published Galaz-García–Searle Theorem 3.2
restatement after three-dimensional Poincaré. E04 records
the limits of access to the original Fintushel and Pao
classification proofs. [Galaz-García and Searle, Geom.
Topol. 18 (2014), §3.2, Theorem 3.2](https://msp.org/gt/2014/18-3/gt-v18-n3-p05-s.pdf)
· [E04 original-source receipt](../references/E04_SOURCES.md#primary-topology-passages)

## Range of the result

The readback requires an actual boundary-preserving smooth
punctured-fiber monodromy and the transitive isometry action
on the closed spherical fiber. The base-preserving comparison
uses that given puncture. The wider condition that an exterior
double has positive Yamabe type does not furnish a fibration
or such an action. For a nontransitive quotient the
isometry evaluation fibration onto all of \(Y\) used here is
unavailable. The pointed issue remains in that class even
with an unpointed spherical Smale theorem. The E05
Plotnick–Suciu family with group \(Q_8\times C_m\),
odd \(m>1\), lies outside the one-sided class. A nonabelian
\(Q_8\) in \(SU(2)\) has centralizer \(\{\pm1\}\), so it
cannot commute with a subgroup of odd order \(m>1\)
in a faithful one-sided action.

Primary passages were inspected on 27 November 2026. The
stabilizer and framing arguments are deductions from the
stated smooth inputs. No numerical or curvature-size
certification is used.
