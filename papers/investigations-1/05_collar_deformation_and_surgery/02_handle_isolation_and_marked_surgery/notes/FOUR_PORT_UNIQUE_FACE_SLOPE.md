# The unique compressible face circle of a bridged four-point return

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed execution packet SUR-E02ac from the
[four-point issue](../../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md).
The issue selects a bounded GPT-6.2 Sol/ultra helper. Actual serving model
and reasoning effort are unavailable. Intake HEAD `14cb15842422` and
issue SHA-256 `7e808251d2d8`. Inputs were the [port compression derivation](FOUR_PORT_SUBSURFACE_COMPRESSION.md)
at `0da1c477d93a` and the [marked disk test](FOUR_PORT_BOUNDARY_PATTERN.md)
at `96591a372a0c`.

In the smooth oriented marked integral \(Y_1\to Y_3\) pairing of the
issue, let \(X\) be the drilled slab after the actual stationary filling.
On one face let \(F\) be the sphere with four holes, \(A\) the wall annulus
of its returning arc, \(U=F\cup A\), and \(\mu\) the core of \(A\), the
marked return meridian. A bridge chord is a simple arc on \(F\) joining
the return holes whose closure by a section of \(A\) bounds a proper disk
in \(X\). Clipping and restoring the radial strip gives the equivalent
bridge disk along the return core. The two through meridians and the
return meridian have infinite order in \(\pi_1(X)\). In fact the seam
quotient to the stationary-filled inlet exterior sends each oriented
meridian to the primitive moving meridian there. This follows from the
rank-three homology calculation before and after the two fillings.
[Port compression derivation, the meridian calculation](FOUR_PORT_SUBSURFACE_COMPRESSION.md#the-through-cyclic-groups-and-their-base-paths)
· [Clipping and the marked boundary](FOUR_PORT_BOUNDARY_PATTERN.md#the-marked-disk-test)

**Claim.** If the return has a bridge chord, the frontier \(s\subset F\) of
a regular neighborhood of that chord and its two return holes is the
unique essential nonperipheral simple closed curve on \(F\), up to isotopy
relative to \(\partial F\), that bounds a proper disk in \(X\). Every
bridge chord is in the resulting chord class with endpoints allowed to
slide around their own holes. Conversely, suppose such a face separator
bounds a proper disk cutting off a solid torus on the marked return side.
Then any chord in its return pair of pants has a bridge for exactly one
section winding with fixed end germs.

## From the bridge to the face disk

Write \(F=P_R\cup_s P_T\) for the two pairs of pants bounded by \(s\).
Here \(P_R\) contains the return holes, and \(P_T\) contains the through
holes. The once-holed torus \(V=P_R\cup A\) meets the disk boundary
\(\gamma\) of the clipped bridge in its interior. The simple loop
\(\gamma\) meets \(\mu\) once and is therefore nonseparating in \(V\).
Take a collar of \(V\) in \(X\) and a thickening of the bridge disk
attached along an annular neighborhood of \(\gamma\) on the inner copy
of \(V\). The interior boundary produced by this compression is a disk
\(\Delta\) with boundary \(s\), after the vertical collar of \(s\) is
included. The region \(T\) between \(V\) and \(\Delta\) is a solid torus.
Indeed, reversing the compression adds one 1-handle to a disk collar,
with the two copies of the compression disk as its attaching disks.
The thickening and rounding can be chosen with \(T\cap\partial X=V\).

Let \(Z\) be the closure of the complement of \(T\). It is connected,
since the only interior interface is the connected disk \(\Delta\) and
\(X\) is connected. Based at a point of \(s\), the two sides have
\[
\pi_1(X)=\pi_1(T)*\pi_1(Z).
\]
Use collars of the interface for van Kampen. Capping \(P_R\) and \(P_T\)
by \(\Delta\) on their respective sides gives two annuli. Each annular
generator is a cuff meridian, of infinite order by the homology test.
The inclusion of \(F\) therefore induces
\[
\pi_1(F)/\langle\!\langle s\rangle\!\rangle
\cong \mathbb Z*\mathbb Z \hookrightarrow \pi_1(T)*\pi_1(Z).
\]
The two cyclic groups lie in separate ambient factors. The through
cyclic group only needs to embed in \(\pi_1(Z)\). The reduced word
argument works with an arbitrary complementary factor, including when
\(X\) is reducible. [Hatcher, *Algebraic Topology*, §1.2, free-product
normal form and Theorem 1.20](https://pi.math.cornell.edu/~hatcher/AT/AT-doublepage.pdf)

## Uniqueness in the four-holed face

An essential nonperipheral curve on \(F\) disjoint from \(s\) is
isotopic to \(s\), since any essential circle in either pair of pants
is parallel to a cuff. Otherwise put the curve in minimal position
with \(s\). Its successive arcs alternate between \(P_R\) and \(P_T\),
with both ends of each arc on \(s\). Each such arc separates the two
other cuffs of its pair of pants. If both cuffs were on the same side,
an innermost boundary-parallel arc would give a bigon allowing a
reduction of intersections. Close each arc to the basepoint by paths
on \(s\). After capping, each such loop represents a generator or its
inverse in the corresponding annulus. The choice of paths changes
the loops only by powers of \(s\), which vanish. Thus the original
curve gives a nonempty reduced word in the ambient free product and
cannot bound a disk. The four puncture circles also have nontrivial
images, by the meridian calculation.

For any other bridge chord, its own regular neighborhood gives a
second separator disk by the same construction. Its separator is
therefore isotopic to \(s\) in \(F\), relative to the boundary. Carry
it there by an ambient isotopy. Its chord now joins the return cuffs
in \(P_R\). An embedded arc between distinct cuffs of a pair of
pants has one isotopy class with endpoints allowed to slide on their
own cuffs. One sees this by capping those cuffs to marked points and
isotoping the resulting simple joining arc in the remaining disk.
For fixed end germs, the endpoint tracks can introduce turns in the
two cuff collars. This gives uniqueness of the chord modulo those
endpoint turns.

## Converse on the marked side

Suppose a proper disk \(\Delta\) with boundary \(s\) separates off a solid
torus \(T\) with \(T\cap\partial X=P_R\cup A\). In the capped torus
\(\partial T=(P_R\cup A)\cup\Delta\), choose a chord in \(P_R\) and close
it by a section of \(A\), giving a curve \(\gamma_0\). Its signed
intersection with \(\mu\) has absolute value one. Orient the section
windings so that \([\gamma_m]=[\gamma_0]+m[\mu]\). The primitive moving
meridian gives a homomorphism \(H_1(X;\mathbb Z)\to\mathbb Z\) with
\([\mu]\mapsto1\), up to orientation. Its restriction through
\(H_1(T;\mathbb Z)\cong\mathbb Z\) makes \([\mu]\) a generator there.
Consequently exactly one \(m\in\mathbb Z\) makes \([\gamma_m]\) vanish
in \(H_1(T;\mathbb Z)\). Since \(\gamma_m\) is an essential simple
curve on \(\partial T\), this is the meridian slope of \(T\). A collar
isotopy takes a meridian disk to that precise curve in the interior of
\(P_R\cup A\), and the radial strip restores the required bridge.

The argument applies face by face. It determines the admissible face
circle and chord class once the marked solid torus is present. The
existence of such a torus on some face remains the geometric selection
question after the general port compression.
