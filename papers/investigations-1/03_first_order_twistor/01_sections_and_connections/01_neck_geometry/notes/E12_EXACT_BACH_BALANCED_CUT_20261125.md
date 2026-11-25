# A balanced spherical cut in the exact Bach-flat band

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The assignment specifies
gpt-6.2-sol/ultra. The runtime does not independently expose serving
settings. The input versions and finite scope are in
[E12 revision 1](../research-progress/handoffs/E12_REQUEST_20261125.md).

## Statement

Let \(g_i\) be smooth, exactly Bach-flat, volume-one positive Yamabe
minimizers on closed oriented smooth homotopy four-spheres \(M_i\).
Use the SEC Hilbert–Schmidt positive chiral Weyl energy
\[
 4\pi^2\le E_i=E_+(g_i)\le8\pi^2-\delta,\qquad \delta>0.
\]
Suppose there are centers \(p_i\), fixed \(\eta>0\), and radii
\(a_i<b_i\) about \(p_i\) for which the cumulative positive chiral
energies are \(\eta\) and \(E_i-\eta\), respectively, with
\(2\eta<E_i\) and \(b_i/a_i\to\infty\). Fix any finite log half-width
\(T>2\). On a subsequence there is an oriented smooth collar
\[
 \Phi_i:A_T/\Gamma\longrightarrow M_i,\qquad
 A_T=\{e^{-T}<|x|<e^T\},\qquad
 \Phi_i^*(s_i^{-2} g_i)\longrightarrow g_{\rm eucl}
\]
smoothly on the closed annulus, with both embedding and comparison
defined on a slightly larger buffered annulus, for a scale
\(s_i\to0\). The initial comparison has a finite orthogonal
free spherical group \(\Gamma\subset SO(4)\); under the stated band
it is trivial. The collar lies in a selected balanced E11
block and its middle slice separates \(B(p_i,a_i)\) from
\(M_i\setminus B(p_i,b_i)\). Both masses \(\eta\) lie outside
the splices. Neither the chart nor the proof requires any
specified ALE bubble with an embedded full core.

For a fixed \(M\) in the same exact class, if \(E_i\to I^+(M)\)
then such separated quantiles are impossible. The extracted
chart and this conclusion are particular to the exact equation.
[SEC §§11.1 and 12.2](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868) · [E11 quantile selection](E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md)

## Pick a growing balanced block

Let \(N_i=\lfloor\log_2(b_i/a_i)\rfloor\). The E11 selection
also permits \(m_i=\lfloor\sqrt{N_i}\rfloor\) rather than a
fixed number of shells. In the middle half of the dyadic
indices choose one of at least
\(\lfloor (N_i/2-2)/m_i\rfloor\) disjoint blocks of \(m_i\)
shells. The total full tensor curvature bound \(\Lambda\)
gives a block
\[
 \mathcal C_i=\{\ell_i\le d_{g_i}(p_i,\cdot)\le u_i\},\qquad
 u_i/\ell_i=2^{m_i},\qquad
 \mathcal E_i=\int_{\mathcal C_i}|{\rm Rm}_{g_i}|_{\rm tens}^2\,dV_i
 \longrightarrow0 .
\]
Distance spheres have four-volume zero, so the common faces
do not affect the bound. Both \(a_i/\ell_i\) and \(u_i/b_i\)
tend to zero by the middle-half placement. The diameter
bound of E11 makes \(b_i\) bounded and hence \(u_i\to0\).
For
\[
 \rho_i=\sqrt{\ell_i u_i},\qquad h_i=\rho_i^{-2}g_i
\]
the block exhausts every fixed rescaled radial interval
away from its center. In particular, for any
\(0<A<B<\infty\), balls of fixed small rescaled radius around
points of \(\{A\le d_{h_i}(p_i,\cdot)\le B\}\) are contained
in \(\mathcal C_i\) for all large \(i\). This is a choice
of a growing block by the E11 method.

The band gives \(Y_i\ge y_0=\sqrt{48\delta}>0\) and
\(s_{g_i}=Y_i\le Y_{\rm rd}\). Its Yamabe inequality gives
the scale-invariant Sobolev estimate in the form
\[
 \|f\|_{L^4(h_i)}
 \le \sqrt{6/y_0}\,\|df\|_{L^2(h_i)}
       +\operatorname{Vol}(h_i)^{-1/4}\,\|f\|_{L^2(h_i)}.
\]
The coefficient of the lower order term is exactly the one
in Tian–Viaclovsky's equation (1.2). The analogous estimate
holds in \(g_i\). The metrics satisfy their exact
constant-scalar-curvature Bach-flat equation
\(\Delta{\rm Ric}={\rm Rm}*{\rm Ric}\), and \(b_1(M_i)=0\).
The full curvature bound is invariant under the constant
rescaling. Tian–Viaclovsky's Theorem 1.2 supplies
\(\operatorname{Vol}_{g_i}B(x,r)\le V_1 r^4\) uniformly.
Their introductory definition of “critical” lists three
subclasses. The remark after Theorem 1.3 expressly extends
the results to the broader Bach-flat case, with the
\(C^0\)-orbifold and order-zero ALE qualifications relevant
below. The proof uses that broader version and the stronger
Sobolev inequality (1.2).
[Tian–Viaclovsky, arXiv:math/0312318v4, §1, Theorems 1.1–1.3 and following remark, §§2 and 4](https://arxiv.org/pdf/math/0312318)

Exact epsilon-regularity, either their Theorem 4.1 or the
positive Yamabe version in CQY Theorem 2.4, applies on the
protected annular balls. In physical scale, for a radius \(r\)
with \([r/4,2r]\subset[\ell_i,u_i]\), use at every point \(q\)
of \(\{r/2\le d_{g_i}(p_i,q)\le r\}\) a ball of radius \(r/8\).
It lies in the block and exact regularity yields
\[
 \bigl|\nabla^k {\rm Rm}_{g_i}\bigr|(q)
 \le C_k r^{-2-k}\mathcal E_i^{1/2}.
\]
The constants are uniform for every fixed \(k\). The ball radius
is below half the ambient diameter, since the outer quantile
lies further out. In \(h_i\) these bounds tend to zero
uniformly on every fixed compact radial interval away from
zero. [CQY, arXiv:math/0508621v2, Lemma 2.1 and Theorem 2.4](https://arxiv.org/pdf/math/0508621)

## All-radii area on a protected window

Here is a local polar argument for the extra area input
in CQY Theorem 3.1. For \(r\) as above, every \(g_i\)-minimizing
unit-speed ray that reaches \(S_r(p_i)\) has
\(\operatorname{Ric}(\dot\gamma,\dot\gamma)\ge -3k_r^2\)
on \([r/2,r]\), where one can take \(k_r=K/r\) with uniform
\(K>0\). This follows from the preceding exact estimate.
For a unit direction \(\theta\) minimizing to \(r\), write
\(J(s,\theta)\) for its angular polar Jacobian and put
\(y(s)=J(s,\theta)^{1/3}\). It is positive for \(s<r\).
The radial Riccati inequality, using
\(|{\rm II}|^2\ge(\operatorname{tr}{\rm II})^2/3\), gives
\(y''\le k_r^2 y\) on \([r/2,r)\). Compare with the positive
function \(z(s)=\sinh(k_r(s-r/2))/k_r\) there.
The Wronskian \(y'z-yz'\) is nonincreasing and starts
at \(-y(r/2)\le0\), so \(y/z\) is nonincreasing. Consequently
\[
 J(r,\theta)\le C_K J(s,\theta)
 \qquad(3r/4\le s\le 7r/8),
\]
by passage to the endpoint and the bounded ratio \(z(r)/z(s)\).

The set of directions minimizing to \(r\) is closed, since
it is given by \(d(p_i,\exp_{p_i}(r\theta))=r\). Their images
under the smooth angular exponential map cover \(S_r(p_i)\).
Its area formula bounds \(\mathcal H^3(S_r(p_i))\) by the
integral of the angular Jacobian over that set. Multiple
minimizers merely add multiplicity in this bound, and
conjugate directions at the endpoint have vanishing
Jacobian. For \(s<r\) on these directions there are no cut
points. Integrating the Jacobian comparison over
\(s\in[3r/4,7r/8]\) and using the ordinary polar volume formula
before the cut times gives
\[
 \mathcal H^3(S_r(p_i))
 \le \frac{8C_K}{r}\operatorname{Vol}_{g_i}B(p_i,r)
 \le 8C_K V_1 r^3.
\]
This holds at every radius with the geometric protection
specified above. It gives the full CQY window
\([r_{1,i},100r_{1,i}]\) for
\(r_{1,i}=4\ell_i\), \(r_{2,i}=u_i/4\), for large \(i\).
The same argument also works on any other fixed inner
window protected in the long block.

## CQY's component and a fixed-width comparison

With these \(r_{1,i},r_{2,i}\), a component reaching the outer
sphere exists by a minimizing geodesic from \(p_i\) to any
point at distance \(\ge b_i\). Its entire curvature is bounded
by \(\mathcal E_i\). The inner area bound is uniform, the
Yamabe and Sobolev inputs are uniform, and \(b_1=0\).
In CQY's boundary convention choose any fixed finite
distance parameter \(a>0\) because \(M_i\) is closed.
For fixed theorem constants,
\(r_{2,i}\le c_2a\) and \(r_{1,i}/r_{2,i}\le\delta_0\)
hold for large \(i\); \(\mathcal E_i\to0\) supplies its
energy threshold. Uniqueness of the component that reaches
the outer sphere is Lemma 3.2 and Theorem 3.1, and applies
also to any protected trim with sufficient scale separation.
Theorem 3.1 gives the cone comparison with local rescaled
\(C^{1,\alpha}\) control. A separating conclusion uses
coverage of the entire outer-reaching annular component
at a protected intervening range, including every possible
crossing, rather than a local cone around one point of a
distance sphere. In the printed sandwich the inner coverage
ends at \((\delta_0^{1/4}-\epsilon)r_2\). A literal use of
this bound needs it positive and the smaller annulus
nonempty. The theorem statement does not separately give
\(\delta_0^{1/4}>\epsilon\) when \(\delta_0\) is chosen after
the tolerance. The growing-block argument below gives the
specific fixed-width coverage independently of those
trim constants. [CQY, Theorem 3.1, Lemma 3.2 and proof Part II](https://arxiv.org/pdf/math/0508621)

Apply Tian–Viaclovsky's pointed compactness theorem 1.1
to \((M_i,h_i,p_i)\), using its Bach-flat extension as above.
The volume lower bound holds since
\(\operatorname{Vol}(h_i)=\rho_i^{-4}\to\infty\).
It gives a complete pointed length limit with pointed
Gromov–Hausdorff convergence and smooth convergence on
regular compact sets. The singularities have one local
orbifold cone each by \(b_1(M_i)=0\) and the exact coefficient
in the Sobolev estimate. Outside \(p_\infty\), small annular
curvature and the exact derivative bounds, together with
E11's scale-uniform lower volume bound, give local
injectivity and smooth convergence everywhere. Thus at most
\(p_\infty\) can be singular, and the regular metric is
flat. Distances tending to arbitrarily large fixed values
exist on the rescaled metrics, since \(b_i/\rho_i\to\infty\).
Their pointed limit is noncompact. The same compactness
theorem gives finitely many order-zero ALE ends, so the
limit has finite first Betti number: there is a compact
orbifold core and finitely many product ends.
[Tian–Viaclovsky, Theorem 1.1 and §7](https://arxiv.org/pdf/math/0312318)

If \(p_\infty\) is singular, use Streets' smooth removability
Theorem 1.2 for the exact constant scalar curvature Bach-flat
metric on its punctured neighborhood. The local punctured
ball is connected by the one-cone conclusion. The curvature
integral is zero there, and the test-function Sobolev inequality
passes on supports away from the point, since the lower
order coefficient is \(\rho_i\to0\). The upper volume bound
passes by smooth convergence on such supports and exhaustion,
using pointed distance convergence and the fact that the
added point has zero four-volume. The global limit has finite
first Betti number as above. These give the stated
removability inputs (after rescaling a small limit ball
to unit radius if desired). The smooth orbifold metric is
flat across the origin by continuity. In a sufficiently
small orbifold normal-coordinate ball about \(p_\infty\)
it is therefore exactly Euclidean modulo the finite local
group. If \(p_\infty\) is smooth, the same step uses ordinary
flat normal coordinates. Orientation on the regular part
comes from the oriented source on a subsequence, and the
finite local group preserves it. A free orthogonal action
preserves orientation here also algebraically: in \(O(4)\)
an orientation-reversing matrix has a real \(+1\)
eigenvalue. The normal radius in a smaller ball is the
pointed distance to \(p_\infty\).
[Streets, arXiv:0708.0869v1, Theorem 1.2 and §5](https://arxiv.org/pdf/0708.0869)

Choose a fixed \(s>0\) so a slightly larger annulus than
\([s e^{-T},s e^T]\) is in that normal ball. On it use the
smooth comparison embeddings compatible with the pointed
convergence. This compatibility is the regular-set
Cheeger–Gromov construction in the proof of TV Theorem 1.1:
on compact sets away from the concentration balls, the
curvature and injectivity bounds give smooth local charts
realizing the pointed metric limit. In particular the
source distances from \(p_i\) in \(h_i\), restricted to the
images of the fixed compact annulus, converge uniformly to
the normal radius in it. After \(x\mapsto sx\) and the
constant physical rescaling \(s_i=s\rho_i\), the embeddings
give the stated \(C^k\) product comparison for every fixed \(k\).
For each fixed width and each prescribed tolerance,
first take the long-block rescaling and its limit, then fix
the finite chart inside that limit, then take \(i\) large.
This produces vanishing errors along the comparison
subsequence without a rate or a growing chart assertion.

## The comparison carries the two source masses

Fix a compact model cylinder \(\mathcal K\) in the larger
compared annulus that contains the requested buffer, with
end radii \(r_-<r_+\). Take
\(r_-<\beta_-<\beta_+<r_+\), a fixed radial shell in the
regular limit. For all large \(i\), the image \(\mathcal K_i\)
contains the **whole** shell
\(\{\beta_-\le d_{h_i}(p_i,\cdot)\le\beta_+\}\).
Indeed, a sequence of omitted points has a subsequence
converging in pointed distance to an interior limit point
of \(\mathcal K\). The comparison images of that interior
point are asymptotically at distance zero from the omitted
points. The distance to the comparison boundary is bounded
below, since the two boundary components have limiting
pointed distances \(r_-\) and \(r_+\). A path from the
interior image to an omitted point must meet this boundary,
a contradiction. This argument uses coverage in the
regular pointed limit and discards no other component
of the intervening radial shell.

The whole cylinder lies in \(\mathcal C_i\) for large \(i\),
because its distances in \(h_i\) are uniformly bounded away
from zero and infinity. Every path from \(B(p_i,a_i)\)
to \(M_i\setminus B(p_i,b_i)\) crosses the covered radial
shell, since \(a_i/\rho_i\to0\) and \(b_i/\rho_i\to\infty\).
The central round space-form slice separates \(M_i\):
it is oriented and two-sided, and a loop intersecting it
once would contradict \(H_1(M_i)=0\). The connected
cross-section and the two product halves imply that the
complement of the compact cylinder has two components, one
adjacent to each of its ends. A path within either component
avoids the covered shell. The inner ball is connected and
lies in one component, so every point of the outer quantile
set lies in the other component. Replacing the metric in
the two unit splices leaves both prescribed masses on their
respective unchanged sides.

The E07 transition can make the central slice exactly
product in the same closed source for \(o(1)\) net
positive chiral cost. Here even \(C^2\) smallness is
available, so the direct transition in E08 gives cost
\(o(1)\) as well. The total remains below \(9\pi^2\).
E08 implies \(\Gamma=1\). For \(T\) chosen to accommodate
the fixed positive-Yamabe buffer in E01 or E07, this gives
smooth spherical caps with positive Yamabe constants and
\(o(1)\) transition cost on each side. E10 then excludes
this separation on a fixed nonstandard smooth type when
\(E_i\to I^+(M)\), because each unchanged side has energy at
least \(\eta\). The standard type has \(I^+(M)=0\), so its
minimizing sequence cannot meet the positive lower band
in the first place.
[E07 splice](E07_FIRST_ORDER_CAP_20261125.md) · [E08 link test](E08_QUOTIENT_LINK_TEST_20261125.md) · [E10 minimizing inequality](E10_NONSPLITTING_MINIMIZERS_20261125.md)

This result supplies the exact-case extraction benchmark
for one balanced block. The proof uses exact elliptic
regularity and exact pointed compactness; no \(L^1\)-Bach
replacement for either estimate is established here.
