# Independent check of the marked Mazur band

26 November 2026. For Edward B. Baker III with OpenAI Codex assistance.
SP4-CDS-SUR-E02c, [reader issue 1](../research-progress/handoffs/PREFIX_AND_INTERIOR_READERS_20261126.md).
Packet routing was GPT-6.2 Sol/ultra. The actual serving model and reasoning
effort were unavailable. Repository baseline
`e2968b2898b5aab00b307f6b6580454d0f325bb4` and the prescribed SHA-256
`c51c9c03de4c45258343d0905a29f57ce34935dff7cd618f03c201f5c0f4a74c`
of [the frozen note](../02_handle_isolation_and_marked_surgery/notes/MIXED_WITNESS.md)
matched. This fixed execution check concerns only the $n=1$ smooth oriented
closed double from Figure 37, with the actual two marked intermediate levels.

## Complete sides and the gluing

Figure 37 depicts the $0/1/2$ part with the small zero-framed meridian $b$
of the long attaching circle $a$ in a ball disjoint from the dotted unknot.
Its caption leaves one 3-handle and one 4-handle implicit. The paragraph
preceding Theorem 3.3 ties Figure 38 to Figure 37 and the theorem identifies
the trisection as standard. For $b$ first, use the disk framing in that ball.
The corresponding surgery on the ball produces punctured $S^1\times S^2$,
so the actual cut is $Y_b=\#_2(S^1\times S^2)$. The future tube of $a$ is
carried by the identity on the common exterior of the tube of $b$, including
its normal parametrization. The complete lower piece is
$V=(S^1\times D^3)\natural(S^2\times D^2)$. [Isoshima, arXiv:2403.17356v2,
pp. 10 and 35, Theorem 3.3 and Figure 37](https://arxiv.org/pdf/2403.17356v2#page=35)

Reading this cut from the upper end gives one 1-handle and the dual of $a$.
Turning the upper dot into ordinary zero surgery presents the boundary by an
unknot and a second component. The boundary group $H_1(Y_b;\mathbb Z)=\mathbb Z^2$
makes the integral two-by-two surgery matrix zero. The proof of
Gompf–Scharlemann–Thompson Proposition 3.2 gives the required isotopy inside
the once-surgered $S^1\times S^2$. The unknot-in-a-ball step is on p. 2313.
The subsequent slides on p. 2314 express that isotopy in the original
three-sphere diagram. Extend the ambient boundary isotopy through an inward
collar by tapering the isotopy time to zero. The carried tube has disk
framing since surgery in the ball adds a free $H_1$ generator. Thus the
actual complete upper trace is also diffeomorphic to $V$.
[Published paper, proof of Proposition 3.2, pp. 2313–2314](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=9)

For the actual orientation-reversing boundary identification
$f:\partial P\to\partial Q$, the model map and its inverse are
$(\partial j_+)f(\partial j_-)^{-1}$ and
$(\partial j_-)f^{-1}(\partial j_+)^{-1}$. The identifications $j_\pm$
are used to pull back metrics on the complete sides. The cylinder then
joins the actual boundary metrics by joining $h$ to $f^*h_Q$ on $\partial P$.

## Positive scalar curvature on the closed source

For the chosen radial disks, $\eta''=\chi'\cos r-\chi\sin r\le0$ until
the cutoff vanishes and $0\le\eta'<1$ for $r>0$. Thus $D^2$ has $K\ge0$,
and the three-dimensional disk has strictly positive scalar curvature
from its tangential sectional curvature when $r>0$ and from its round
tip. Both disks have product boundary germs. The products with the flat
circle and unit round two-sphere therefore give collared PSC metrics on
the two summands of $V$. The joining 1-handle traces a surgery on $S^0$ in
the disjoint three-dimensional boundaries, with normal rank three. Walsh
Definition 4.3 allows the sole Morse index $1$ since $n-2=1$ for the
incoming dimension $n=3$. Theorem 1.2 extends the incoming metric over the
compact trace and gives product structures at both ends. This imports the
index-one trace with its original attaching balls. [Walsh, arXiv:0811.1245v1,
pp. 45–46](https://arxiv.org/pdf/0811.1245#page=45)

Theorem 1.1 of Bamler–Kleiner applies on the closed connected oriented
three-manifold $Y_b$ in the $C^\infty$ topology. On the compact continuous
path between $h$ and $f^*h_Q$, PSC and positive definiteness give a uniform
$C^2$ radius within which interpolation remains in PSC. Subdivide into
short linear segments and reparametrize each with a smooth switch constant
near both ends. The resulting smooth path $h_s$ has product germs at the
ends and scalar minimum $\lambda>0$. On $dx^2+h_{x/D}$ let
$k=h_s'/2$ and $m=\operatorname{tr}_{h_s}k$. The normal second fundamental
form and its trace are $k/D$ and $m/D$. The Gauss and normal Ricci identities
give
\[
 R_{dx^2+h_{x/D}}
 =R_{h_s}-D^{-2}\bigl(m^2+|k|_{h_s}^2+2\partial_s m\bigr).
\]
Choosing fixed $D$ with $D^2>\|m^2+|k|_{h_s}^2+2\partial_s m\|_\infty/\lambda$
makes the whole transition PSC. [Bamler–Kleiner, arXiv:1909.08710v1,
pp. 1–2, Theorem 1.1](https://arxiv.org/pdf/1909.08710#page=2)

For an explicit stretch, take an original signed bicollar $-\epsilon<q<\epsilon$
with $y$ on the lower side and $f(y)$ on the upper side. In the new signed
coordinate the product occupies $[-L/2,L/2]$ and the transition occupies
$[L/2,L/2+D]$. Take smooth nonnegative bumps $\beta_-,\beta_+$ of integral
one supported strictly in the negative and positive halves of the old collar.
Define $\psi_L(-\epsilon)=-\epsilon-L/2$ and
\[
 \psi_L'=1+(L/2)\beta_-+(L/2+D)\beta_+ .
\]
It follows that $\psi_L(0)=0$, with translations by $-L/2$ and $L/2+D$
near the two outer faces. Use $t=\psi_L(q)$, retaining $y$ throughout the
cylinder and using $f(y)$ in the upper coordinates. For the inverse use
$q=\psi_L^{-1}(t)$ and $f^{-1}(z)$ from the upper angular coordinate $z$.
The matching end maps are the identity in the coordinates of the retained
pieces. The opposite signs of the two inward normals account for the
signed coordinate upon reversal. Reversing the cylinder exchanges the
actual complete sides and replaces $f$ by $f^{-1}$ in the same assembly.
The pullback is smooth and PSC on the whole original double, including
both retained pieces, and its conformal class is positive Yamabe.

## Width and both chiral energies

On $B_L$, every connecting curve has length at least $L$ by the
1-Lipschitz coordinate $t$, and constant-$y$ segments attain $L$.
The scalar minimum is $\rho=\min R_h>0$ and both outward mean curvatures
vanish. On $Y_b\times\{0\}$ the second fundamental form and normal Ricci
curvature vanish, so the stability form is $\int |\nabla u|_h^2\,dV_h$
for every smooth $u$. Orient that slice by the projection to $Y_b$.
It gives degree one. The width expression reaches equality at
$L=\pi\sqrt{3/\rho}$, and the finite-end expression is
$\sqrt{\rho/3}\,L>0$ for every $L>0$.

The $a$-first cut bounds the Mazur half with nonsimply connected integral
homology-sphere boundary $\Sigma(2,5,7)$ up to orientation. The degree theorem
would give a PSC target by connected-sum preservation. The homology and
contractible filling then force $S^3$ by Corollary 2.3 and Proposition 4.2.
From the upper end this same cut follows the dual of $b$. For its ordinary
two-component boundary surgery matrix the determinant is $-u^2$, where
$u$ is the dual winding. The homology sphere imposes $|u|=1$ and the same
degree obstruction applies with the opposite boundary orientation.
Consequently any actual product band around this other level of the same
closed source satisfies $\rho_a d_a^2<3\pi^2$. Indeed, scale by $\rho_a/12$
and apply the strict four-dimensional bound to the intrinsic width.
The stable separator test likewise excludes nonzero projection degree there.
[Mazur boundary sources](../../../../references/SOURCE_NOTES_MASTER_ENDPOINT_20261125.md)
· [Chodosh–Maximo–Mukherjee, arXiv:2407.05574v1, pp. 4–5 and 10](https://arxiv.org/pdf/2407.05574v1#page=4)
· [Räde, arXiv:2104.10120v4, Corollary 2.25, p. 6](https://arxiv.org/pdf/2104.10120v4#page=6)
· [Stable separator criterion](../02_handle_isolation_and_marked_surgery/notes/POSITIVE_SCALAR_INTERMEDIATE_CUTS.md)

For a Ricci eigenframe of $h$ with eigenvalues $r_i$, use the product
two-form pairs $dt\wedge e_i$ and the complementary $e_j\wedge e_k$.
The scalar of the product is $R=\sum r_i$. The corresponding product
curvature operator eigenvalues are $0$ and $R/2-r_i$. Its restriction
as a diagonal block on either chiral space therefore has eigenvalues
$(R/2-r_i)/2$. Removing the scalar block $R/12$ gives
$-(r_i-R/3)/2$ in both chiralities. With the Hilbert–Schmidt norm of
the operators on real two-forms, put $J=\int_{Y_b}|\operatorname{Ric}_h-\tfrac13R_hh|_h^2\,dV_h$.
For either $\sigma$, the band adds $LJ/4$ and its two halves each add $LJ/8$.
The complete $P$ energy is $E_\sigma(g_P;P)+LJ/8$. The complete $Q$ energy
is $E_\sigma(g_Q;Q)+E_\sigma(g_D;C_D)+LJ/8$ because the whole fixed
transition is on the upper side. $J>0$ since an Einstein PSC metric in
dimension three has positive constant sectional curvature, whereas
$\pi_1(Y_b)$ is free of rank two. Thus both full energies are affine in
$L$ with slope $J/4$ and cross $8\pi^2$ for sufficiently large $L$.

The readback verifies the complete PSC metric, inverse marking, native band
width and Weyl prices on this one specified trace. The width-threshold
example leaves $J$ and the complete side costs unevaluated numerically.
Linking this witness to an immersed height or a minimizing source requires
a comparison of the actual marked embeddings and metrics. The displayed
presentation retains its two middle handles.
