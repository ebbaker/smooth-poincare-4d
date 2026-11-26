# Independent reading of the four-point chord obstruction

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. This is bounded E reading 1 of the
[reader request](../research-progress/handoffs/FOUR_POINT_READINGS_20261126.md).
The request selects GPT-6.2 Sol/ultra for the independent reader. Actual
serving model and effort are unavailable. The category is smooth, oriented
three-manifolds with integral surgery and fixed marked port germs.

**Verdict.** The obstruction passes on the frozen bytes. On the specified
free-outlet fixture, either prescribed twisted return chord with \(k\ne 0\)
has no bridge disk in the stationary-filled slab for any wall section.
The original chord pair still has disjoint bridge disks if the chords may
be chosen. The proof should specify homology relative to the fixed chord
endpoints and identify the two face twists by the seam marking. The
fixed-chord test is decidable given a triangulated slab and chord marking.

## The filled slab and its linking class

Write \(X_0\) for \(W=S^2\times I\) drilled along \(Q\), the through arcs
\(T_3=3_-1_+\), \(T_4=4_-2_+\), and the two returns \(R_-=1_-2_-\),
\(R_+=3_+4_+\). Write \(X=X_0\cup_{\lambda_Q}(D^2\times S^1)\) for the
actual stationary zero filling, with the meridian attached to the marked
longitude \(\lambda_Q\) on the \(Q\)-torus. Both returns and both through
arcs remain drilled. Round corners along their walls.

Cap the two unpunctured levels by balls outside \(W\). In these balls put
cap arcs just beyond the original short \(34\) chord below and \(12\)
chord above. Together with \(T_3,T_4\), these give an oriented knot \(C\).
Use the remaining short chords to cap the two returns separately. The
through access rectangles recover the actual \(V_4\) relative to \(Q\).
Thus the ambient capped manifold before stationary filling is \(S^3\)
and \((Q,C)\) is the published local \(L_{4,1}\). Define on \(H_1(X_0)\)
the character given by inclusion into \(S^3\setminus C\) and linking with
\(C\). Its values on coherently oriented through meridians are \(1\), and
on both return meridians they are \(0\). The stationary longitude is a
parallel of \(Q\) disjoint from \(C\), so its value is \(\operatorname{lk}(Q,C)=0\).
Here GST §7 establishes joint surgery \(Y_2\) for the actual local pair,
and Proposition 2.2 for a framed two-component link in \(S^3\) with that
outlet gives zero self-framings and mutual linking. Filling quotients
\(H_1(X_0)\) by the longitude class, so the character defines
\(h\in H^1(X;\mathbb Z)\).
[GST, Figure 1, Proposition 2.2 and §7](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf) ·
[Bridge construction and outlet](../02_handle_isolation_and_marked_surgery/notes/FOUR_MARKED_BRIDGE_DISKS.md)

As a check, orient the two through arcs in the direction of \(C\), so
one goes up and one goes down. Excision in \((W,X_0)\) gives one generator
for each of the five meridian disks. A product sphere generates
\(H_2(W)\) and maps to \(\mu_{T_3}-\mu_{T_4}\), from algebraic intersections.
Since \(H_1(W)=0\), these are the generators and sole relation for
\(H_1(X_0)\). The two return-wall meridians therefore remain distinct
classes even though each maps to a meridian of the same moving knot
after gluing. The character \(h\) is used before the seam gluing.

Changing any cap arcs within the exterior balls and preserving the
through pairing leaves the character on slab cycles unchanged. The
difference between the oriented through caps bounds an integral
2-chain in the balls. Push a slab cycle slightly off the faces to see
it has zero intersection with that chain. Reversing the orientation of
\(C\) reverses \(h\) throughout. A different pairing can define a
different character while the original \(h\) is still available.

## Both faces and possible changes of boundary

Use the same common four-holed face \(F\) under the seam marking.
Choose \(d\subset F\) around holes \(1,3\), intersecting each original
short chord once. Between the bounded face disk and the two hole
boundaries, the punctured disk gives \([d]\) as a signed sum of the two
port meridians. Below, \(1\) is a return port and \(3\) is a through
port. Above, \(1\) is a through port and \(3\) is a return port. Hence
\(|h(d)|=1\) on both faces. Use one twist map \(\tau_d\) of \(F\) with
support away from the port collars, and transport it to both copies by
the seam identification. Their induced boundary orientations are
opposite, so a sign convention based on those orientations describes
the two transported maps with opposite signs. This construction fixes
the port germs and the two images of the chord system coincide at the
seam.

Orient a return chord \(b\) and keep its endpoints \(p,q\) fixed. In the
twist annulus its single crossing picks up \(k\) turns around the core,
with the sign of the crossing. The absolute cycle difference is
\([\tau_d^k(b)-b]=\pm k[d]\) in \(H_1(F;\mathbb Z)\). Equivalently the
difference lies in the image of absolute homology inside
\(H_1(F,\{p,q\};\mathbb Z)\). Relativity to the whole boundary would
lose this detection, since \([d]\) is a sum of boundary classes.

Close \(b\) along the wall of its own return using the section from the
original clipped bridge disk. The completed loop has \(h=0\).
Keep that section when replacing \(b\) by \(\tau_d^k(b)\). Every other
section with those endpoints changes the loop by an integer multiple
of that return's meridian. Thus for either side and every wall winding
\(n\) the new loop has \(|h|=|k|\). For \(k\ne0\) any proper bridge disk
would contradict its boundary's nonzero value in \(H_1(X)\). Isotopy of
the boundary in the fixed slab preserves that value up to orientation.
The disk obstruction applies separately to either chord and therefore
also excludes a disjoint system prescribed to contain one of them.
When the two chord isotopy classes can be reselected with the same
pairing, the original simultaneous bridge disks supply a system on the
same fixture. This reading gives no obstruction to that selection or
to other tunnel patterns.

## Finite test for a fixed chord system

For a general integral \(Y_1\to Y_3\) pair with this pairing, the
stationary and moving cores are null-homologous. The former misses the
product sphere and the latter has one through passage in each
direction. In the full exterior \(E\), the pair sequence gives
\(H_1(E)\cong\mathbb Z^3\) with the two meridians spanning a direct
summand. Both filling slopes have zero class, since quotient by the
slopes still has rank three. The quotient map from \(X\) to the
stationary-filled exterior before moving filling sends every
return-wall meridian to the corresponding signed moving meridian.
The moving meridian there is primitive and infinite, and a dual
integer character pulls back to give value \(1\) on an oriented
return-wall meridian \(\mu_R\).

For fixed endpoints and a fixed embedded chord, sections of the
return annulus are classified up to isotopy fixing the endpoints by
their integer winding \(n\). The boundary class has the form
\([w_0]+n[\mu_R]\). The pulled-back dual character determines the only
possible \(n\). Integral homology of the filled slab can then reject
that candidate. For a survivor the simple closed boundary word must be
trivial in \(\pi_1(X)\). An embedded boundary collar and a nullhomotopy
whose remaining interior lies in \(\operatorname{int}X\) supply the
hypotheses of Dehn's lemma. The resulting proper disk can be smoothed
relative to the marked boundary and extended along the radial strip
in the return tube. With boundaries in the two disjoint port
subsurfaces, make the proper disks transverse. Choose an intersection
circle innermost on the first disk and replace the subdisk it bounds on
the second by a pushoff of the first disk's innermost subdisk. Iteration
gives disjoint disks with the same marked boundaries. A finite
triangulation respecting those boundaries supplies the finite
presentation and words. Uniform decidability of the word problem for
3-manifold groups makes this a terminating test when words survive
homology. For the twisted specimen none survive, so no group word
computation is required. This procedure fixes the chords throughout.
[Papakyriakopoulos, Dehn's lemma, p. 169](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/papa.pdf#page=2) ·
[Aschenbrenner–Friedl–Wilton, Theorems 4.1–4.2 and Lemma 4.3](https://www.math.ucla.edu/~matthias/pdf/decision_problems_052314_submitted%20version.pdf)

Frozen [twist note](../02_handle_isolation_and_marked_surgery/notes/FOUR_POINT_TWISTED_CHORDS.md)
SHA-256 `48e5a935dc2d3561d0ed6366097b114ffe44c22d77a332a60fda6bf5e7e04a01`.
The [issue](../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md)
had SHA-256 prefix `ac934a5d0253` at reading and the bridge note prefix
`5859f9f3b565`. Primary passage checks covered the cited GST and
Papakyriakopoulos portions. The uniform word-problem statement and its
residual-finiteness justification were checked in the cited
Aschenbrenner–Friedl–Wilton text. This review checks the marked obstruction
and the fixed-system test only.
