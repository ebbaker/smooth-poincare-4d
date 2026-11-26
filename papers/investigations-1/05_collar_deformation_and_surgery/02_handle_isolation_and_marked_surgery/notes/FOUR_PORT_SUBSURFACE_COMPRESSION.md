# A compression in the drilled four-point slab

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. SUR-E02z is a fixed E derivation on the
[issued four-point pairing](../../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md)
at Git `4d73fdde6804`, issue SHA-256 `2a4ced74aa2d`. The selected bounded
helper was GPT-6.2 Sol/ultra. Actual serving model and effort telemetry
are unavailable. The [two-point cut](INTEGRAL_FILLING_AT_TWO_PORTS.md)
and [slope calculation](COMPRESSED_PORT_SLOPE.md) were read at
`542369426bf5` and `27b35bdba6db`. [Owning register](../research-progress/REGISTER.md)

Let \((Q,K)\) be smooth oriented marked integral attachments from \(Y_1\)
to \(Y_3\), with \(Y_j=\#_j(S^1\times S^2)\). Suppose a supplied
nonseparating product sphere misses \(Q\), meets \(K\) transversely in
four points, and cuts \(K\) into the specified two same-face returns and
two through arcs. Drill the proper arcs and \(Q\) in the slab, then fill
\(Q\) along its actual slope to obtain \(X\). Let \(U_\pm\subset\partial
X\) consist of the punctured face and its return wall. **At least one
\(U_\pm\) has a smooth properly embedded compressing disk in \(X\).**
Its boundary is in the interior of that twice-punctured torus and is
essential and nonperipheral there. The proof allows reducible \(X\).

## The three pieces of the moving fill

Write \(S^\circ_\pm\) for the spheres with the four meridional disks
deleted, \(L_\pm\) for the return walls, and \(A_1,A_2\) for the walls of
the through arcs \(3_-\!-\!1_+\), \(4_-\!-\!2_+\). Each wall is a lateral
annulus of an actual drilled tube. Thus
\(U_\pm=S^\circ_\pm\cup L_\pm\) after rounding, and the two boundary
circles of \(U_\pm\) are its seams with \(A_1,A_2\).

Use the integral moving filling \(V=D^2\times S^1_f\), with \(f\) the
positive meridian of \(K\). The filling parametrization makes the four
puncture circles the fibers \(\{p_i\}\times S^1_f\) on \(\partial V\).
Indeed, in meridian and longitude coordinates on the marked \(K\)-tube,
the integral slope has longitude coefficient one after orienting it
along \(K\). The filling is fiber-preserving in these coordinates,
including its integer shear. The orientations on the disk and torus
are those of the given filling. Orient \(K\) along the lower return
from \(1_-\) to \(2_-\). Its cyclic endpoint order is then
\(p_1,p_2,p_4,p_3\). The successive intervals correspond to
\(L_-,A_2,L_+,A_1\).
The signs at \(1,2,4,3\) are \(+,-,-,+\) up to an overall sign.

Choose two disjoint chords \(d_{12},d_{34}\) in \(D^2\) cutting off the
intervals \(p_1p_2\) and \(p_4p_3\) respectively. The two fiber annuli
over the chords complete the original punctured sphere to a closed
surface \(F\) in the filled outlet. At each chord the puncture
orientations are opposite as measured against \(f\), so \(F\) is
orientable. Corner rounding gives a smooth two-sided genus-two surface,
since the punctured sphere is connected with Euler characteristic
\(-2\).

Cutting the outlet along \(F\) gives a connected manifold \(C\). Its
part in the exterior of \(V\) is \(X\), and its part in \(V\) has the
following three pieces.

| Base-disk piece | Where it attaches to \(X\) | Remaining chord annulus on \(\partial C\) |
| --- | --- | --- |
| End sector at \(p_1p_2\) | \(L_-\) | \(d_{12}\) on the lower side |
| End sector at \(p_4p_3\) | \(L_+\) | \(d_{34}\) on the upper side |
| Middle quadrilateral | \(A_1\) and \(A_2\) | \(d_{34}\) on the lower side and \(d_{12}\) on the upper side |

The product of either end sector with \(S^1_f\) extends the collar of
its attaching wall. For this identification, view the sector as a
rounded rectangle with one side its attaching interval and the
remaining boundary its chord. The ends are absorbed by collar
rescaling. The middle piece \(M=D^2_{\mathrm{mid}}\times S^1_f\) is a
solid torus. Both attaching annuli go once around its \(S^1_f\)
factor. Its remaining annuli \(B_-,B_+\) join the two boundary
circles on each corresponding \(U_-,U_+\). For example the middle
copy of \(d_{34}\) joins \(3_-\) to \(4_-\) because both adjacent
through intervals meet the lower face at those endpoints. The exposed
closed surfaces are consequently
\[
F_- = U_-\cup B_-,\qquad F_+ = U_+\cup B_+
\]
under the collar identifications. The connectedness of the drilled
slab follows by perturbing paths off the cores and then off their
tube interiors. Filling the \(Q\)-torus and attaching the three
moving-fill pieces preserve connectedness.

The outlet is recovered by the actual gluing \(h:F_-\to F_+\).
On \(S^\circ_\pm\) it identifies the copies of the original punctured
sphere by the inlet seam marking. At \(d_{12}\) it identifies the
lower end-sector copy with the upper middle copy, and at \(d_{34}\)
it identifies the lower middle copy with the upper end-sector copy.
The identifications of the annuli use the same filling coordinates
\((d,f)\) on both copies. These maps reverse the induced boundary
orientation on the two copies, and reversing the listed
identifications gives \(h^{-1}\).

## The through cyclic groups and their base paths

The rank jump preserves the moving meridian integrally. To see this,
put \(E=Y_1\setminus\operatorname{int}\nu(Q\cup K)\) and let \(E_Q\)
be \(E\) after the stationary filling alone. Both cores are
nullhomologous in \(Y_1\), by their algebraic intersections with the
product sphere. The pair sequence and excision give
\[
0\longrightarrow \mathbb Z\langle\mu_Q,\mu_K\rangle
\longrightarrow H_1(E;\mathbb Z)
\longrightarrow H_1(Y_1;\mathbb Z)\longrightarrow 0 .
\]
The preceding map from \(H_2(Y_1;\mathbb Z)\) into the meridian-disk
group is zero by the same intersection calculation. In particular
\(H_1(E;\mathbb Z)\cong\mathbb Z^3\). The two fillings quotient by the
two slope classes. Since \(H_1(Y_3;\mathbb Z)\) has rank three, each
slope class vanishes in \(H_1(E;\mathbb Z)\). Thus \(\mu_K\) still has
infinite order in \(H_1(E_Q;\mathbb Z)\). The seam quotient
\(X\to E_Q\) identifies each of the oriented wall meridians with
\(\mu_K\) in homology. In particular the two through cyclic groups
embed in \(G=\pi_1(X)\), and the meridian of either same-face return
also has infinite order in \(G\).

Use paths composed from left to right. Choose a common basepoint
\(b\) in \(X\), and for each sign \(\epsilon\) choose a path from
\(b\) to a basepoint in \(U_\epsilon\). Continue inside \(U_\epsilon\)
to \(x_{i,\epsilon}\in A_i\cap B_\epsilon\), for \(i=1,2\).
Write \(a_{i,\epsilon}\) for the concatenated path. Take all four
endpoints at one value of the circle coordinate in \(M\). Let \(f_{i,\epsilon}\) be
their positively oriented fiber loops, and \(m_\epsilon\) an arc in
\(B_\epsilon\) from \(x_{1,\epsilon}\) to \(x_{2,\epsilon}\) at that
value of \(f\). Define
\[
c_{i,\epsilon}=a_{i,\epsilon}f_{i,\epsilon}a_{i,\epsilon}^{-1},
\qquad
t_\epsilon=a_{1,\epsilon}m_\epsilon a_{2,\epsilon}^{-1}.
\]
Use \(A_1\) as the first edge of the van Kampen graph with vertices
\(X,M\). Its map to \(\pi_1(M)\) is an isomorphism, so amalgamating
along it eliminates \(\pi_1(M)\). The \(A_2\) edge then gives
\[
H:=\pi_1(C,b)=
\langle G,t_\epsilon\mid
t_\epsilon^{-1}c_{1,\epsilon}t_\epsilon=c_{2,\epsilon}\rangle .
\]
The relation identifies the two positive fibers, and the same
relation on all their powers follows. Consequently \(G\) embeds
in \(H\). This uses the inclusion of the base group for an HNN
extension with isomorphic edge subgroups. [Higman–Neumann–Neumann,
Theorem I and Theorem I', pp. 248–249](https://doi.org/10.1112/jlms/s1-24.4.247)

These are two presentations of the same HNN extension. If
\(\eta_i\subset A_i\) goes from \(x_{i,-}\) to \(x_{i,+}\) at that
same circle coordinate, the quadrilateral gives
\(m_+\simeq\eta_1^{-1}m_-\eta_2\) relative to its endpoints in \(M\).
For \(g_i=a_{i,+}\eta_i^{-1}a_{i,-}^{-1}\in G\), this gives
\[
c_{i,+}=g_ic_{i,-}g_i^{-1},
\qquad
t_+=g_1t_-g_2^{-1}.
\]
In particular the upper-side boundary groups may use their own
paths through \(U_+\), even when the cut outlet is first presented
using lower-side paths.

## Port injection and compression

Let \(P_\epsilon=\pi_1(U_\epsilon)\) with the basepoint used above,
and let \(e_{1,\epsilon},e_{2,\epsilon}\in P_\epsilon\) be the two
boundary loops following the positive fiber and based by the chosen
paths in \(U_\epsilon\). Their images in \(G\) are
\(c_{1,\epsilon},c_{2,\epsilon}\). Closing \(U_\epsilon\) by
\(B_\epsilon\) gives
\[
\pi_1(F_\epsilon)=
\langle P_\epsilon,s_\epsilon\mid
s_\epsilon^{-1}e_{1,\epsilon}s_\epsilon=e_{2,\epsilon}\rangle .
\]
The two boundary circles are essential in \(U_\epsilon\), so this
is an HNN extension over two infinite cyclic subgroups and
\(P_\epsilon\) embeds. Under inclusion in \(C\), the image of
\(s_\epsilon\) is \(t_\epsilon\).

Suppose \(P_\epsilon\to G\) is injective. A word reduced in the
port HNN presentation remains reduced in the cut-outlet HNN
presentation based on that same sign. In fact, if the image of a
coefficient \(u\in P_\epsilon\) lies in
\(\langle c_{i,\epsilon}\rangle\), it equals the image of
\(e_{i,\epsilon}^n\) for some \(n\), so
\(u=e_{i,\epsilon}^n\). Hence any potential reduction in the
cut-outlet word already occurs in the port word. Britton's lemma
handles a reduced word involving a stable letter, and the injection
of \(G\) handles a word in the base group. Thus
\(\pi_1(F_\epsilon)\to H\) is injective. Conversely a nontrivial
kernel element of \(P_\epsilon\to G\) survives in
\(\pi_1(F_\epsilon)\) and maps to \(1\) in \(H\). This proves the
port-by-port equivalence of the two injections. [Britton, *The Word
Problem*, Ann. of Math. 77 (1963), Lemmas 3–4, pp. 20–21](https://doi.org/10.2307/1970200)
· [Published text inspected](https://lib.ysu.am/articles_art/ff248019fda39fba752a57bb459f99cd.pdf#page=5)

If both port maps into \(H\) were injective, the actual regluing by
\(h\) would give a second HNN extension of \(H\), over the two
embedded genus-two surface subgroups. For base paths \(q_\pm\)
from \(b\) to points identified by \(h\), the new stable letter is
\(q_-\) followed by a crossing of the regluing cylinder and then
\(q_+^{-1}\). Its conjugation identifies the two images via \(h_*\).
The base-group injection would embed a genus-two surface group in
\(\pi_1(Y_3)\), the free group of rank three. Subgroups of a free
group are free, as seen by taking covers of a graph. A closed
orientable genus-two surface is aspherical and its group has
second integral homology \(\mathbb Z\), whereas free groups have
zero second homology. This proves that some \(P_\epsilon\to G\)
has nontrivial kernel.

Apply the Loop Theorem to the manifold obtained from \(X\) by
deleting every boundary point outside the relative interior of
that \(U_\epsilon\). Its boundary is \(\operatorname{int}U_\epsilon\),
with the same fundamental group as \(U_\epsilon\). A kernel loop
there admits a nullhomotopy after the deletion by pushing the
interior of any given nullhomotopy into \(\operatorname{int}X\)
using the boundary collar. The theorem gives a proper embedded
disk with essential boundary in the remaining subsurface. Smoothing
in the rounded slab yields the claimed disk in \(X\) itself. Each
boundary component of \(U_\epsilon\) has infinite order in
\(\pi_1(X)\), so the disk boundary is nonperipheral.
[Hatcher, *Notes on Basic 3-Manifold Topology*, Theorem 3.1 and
the boundary deletion in Corollary 3.2, pp. 45 and 48](https://pi.math.cornell.edu/~hatcher/3M/3M.pdf#page=46)

The simultaneous-injectivity contradiction uses freeness and the
integral cut. For that contradiction the two through cyclic groups
already inject under the assumed \(U_\pm\) injections. The rank
argument additionally gives their unconditional injection and
rules out peripheral disk boundaries. The geometric intersection
of the disk boundary with the fixed return meridian, and hence a
marked return bridge, is the separate question posed in SUR-E02aa.
