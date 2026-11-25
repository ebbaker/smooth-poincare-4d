# SP4-MASTER-E26 · Four critical heights and direct recognition

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution of the B02/B05 height test, with GPT-6.2 Sol/ultra requested. Actual serving model and reasoning effort unavailable to this worker. Inputs are [E26 revision 1](../research-progress/handoffs/E26_FOUR_CRITICAL_HEIGHTS.md), [E23 revision 1](../research-progress/handoffs/E23_IMMERSION_ENTRY.md), master commit `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a` and master manuscript main SHA-256 prefix `c8a9f68da492`. Evidence is a conditional implication on the original immersed smooth source, with explicit equality and curvature-cost tests. Gabai's named passages were read in a reproduction of the published text because the publisher's endpoint returned an interstitial.

## Exact height count

Let \(F:M\looparrowright\mathbb R^5\) be a smooth immersion of a closed oriented smooth homotopy four-sphere. Use the induced Riemannian metric \(g\), the oriented unit normal \(\nu:M\to S^4\), the shape operator \(A=-dF^{-1}d\nu\), and standard measures \(dV_g,d\sigma\). Write \(\omega=|S^4|=8\pi^2/3\) and

\[
J(F)=\int_M(\det A)_-\,dV_g,
\qquad (s)_-=\max\{-s,0\}.
\]

The signed Jacobian of \(\nu\) is \(\det A\) because the dimension is even and the oriented tangent plane of \(S^4\) at \(\nu\) is the one identified by \(dF\). For every \(u\in S^4\) such that \(u\) and \(-u\) are regular values of \(\nu\), the height \(h_u=\langle F,u\rangle\) is Morse. Its critical points are the two inverse images on the domain, and at them the Hessian is \(\langle u,\nu\rangle g(A\cdot,\cdot)\). The sign of its determinant is \((-1)^{\operatorname{ind}}=\operatorname{sgn}(\det A)\). The Morse Euler sum therefore gives \(2\deg\nu=\chi(M)=2\). This sign check is independent of the chosen orientation of \(M\) provided the normal orientation is changed with it.

By Sard and the area formula, with \(C(u)=\#\operatorname{Crit}(h_u)\) for the full-measure set of these directions,

\[
\frac1\omega\int_{S^4} C(u)\,d\sigma(u)
=\frac{2}{\omega}\int_M |\det A|\,dV_g
=2+\frac{4J(F)}\omega.
\]

The factor two in the first equality counts the two components of the unit normal bundle. This is the hypersurface Chern–Lashof averaging identity, derived here on the smooth domain, counting coincident image sheets separately. Since \(C(u)\) is even by the Euler sum, \(J<\omega\) implies a Morse height with either two or four critical points. The normalization can also be stated as \(\int_M|\det A|\,dV_g<3\omega=8\pi^2\), or normalized Chern–Lashof average less than six. [Chern–Lashof, original 1957 publication record](https://doi.org/10.2307/2372684) · [Original 1958 sequel record](https://doi.org/10.1307/mmj/1028998005)

## All index distributions and the actual gluing

Reorder a supplied Morse function by index on the same smooth manifold, retaining its index counts. The integral handle chain groups have free ranks \(m_j\) and homology ranks \(b_0=b_4=1\), \(b_1=b_2=b_3=0\). If \(r_j\) is the rank of the boundary from index \(j\) to \(j-1\), then \(m_j=b_j+r_j+r_{j+1}\), with \(r_0=r_5=0\). Thus with two critical points the index vector is \((1,0,0,0,1)\). With four it is exactly one of \((2,1,0,0,1)\), \((1,1,1,0,1)\), \((1,0,1,1,1)\), or \((1,0,0,1,2)\). This use of ranks gives the list only. The cancellation below uses geometric handles. [Milnor, Lectures on the h-Cobordism Theorem, Theorems 4.7–4.8 and 5.4](https://www.jstor.org/stable/jj.28248897)

- **Two critical points.** The lower and upper pieces are actual standard \(D^4\)'s. The boundary identification differs from the standard doubled-disk one by a diffeomorphism of \(S^3\). Hatcher's \(\operatorname{Diff}(S^3)\simeq O(4)\) makes it isotopic to an orthogonal restriction, which extends linearly. The isotopy extends through a collar of the disk. Composition handles either orientation of the boundary identification and gives the standard smooth double. [Hatcher, Ann. of Math. 117 (1983), pp. 553–554](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf)

- **One extra \(0,1\) pair or its dual.** For \((2,1,0,0,1)\), the 1-handle has one foot in each 0-handle. Otherwise the manifold stays disconnected since there are no intermediate handles and the 4-handle attaches along a connected sphere. Separate the two minimum levels within their index block. The attaching zero-sphere meets the belt sphere of the later 0-handle in exactly one transverse point, so geometric cancellation relative to the first disk reduces to the two-disk case. For \((1,0,0,1,2)\), reverse the Morse function. [Milnor, first cancellation theorem, Theorem 5.4](https://www.jstor.org/stable/jj.28248897)

- **One extra \(2,3\) pair or its dual.** Reverse the function if necessary to take \((1,0,1,1,1)\). The cut between the 2- and 3-handles separates the trace \(P=D^4\cup h_K^2\) of an integer-framed knot in the marked lower \(S^3\) from an upper piece \(Q\) which dually has one 0- and one 1-handle. The orientable one-1-handle body \(Q\) is \(S^1\times D^3\), so the surgery boundary of \(P\) is diffeomorphic to \(S^1\times S^2\). For framing \(n\), the meridian generates the knot exterior's first homology and the filling kills \(n\) times that generator. Thus the surgery has \(H_1=\mathbb Z/n\mathbb Z\) and the framing must be zero. Gabai's Corollary 8.3, as stated for Property R in Remark 8.5, forces the knot to be the unknot. Indeed the nonseparating sphere in \(S^1\times S^2\) gives knot genus zero. A framed isotopy and its collar extension to the lower disk identifies \(P\) with the zero-framed unknot trace \(S^2\times D^2\). The actual gluing now differs from the standard gluing of \(\partial(D^3\times D^2)\) by a self-diffeomorphism of \(\partial Q\). It extends over \(Q\) by Laudenbach–Poénaru. Equivalently their original Theorem A with \(p=1\) gives \(S^4\) for every gluing of this pair. For the oriented claim choose the orientation of the final standard sphere, using a reflection if necessary. [Gabai, JDG 26 (1987), pp. 525–526](https://doi.org/10.4310/jdg/1214441488) · [Laudenbach–Poénaru, original Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf) · [Moussard, arXiv:2412.10210v3, independent extension proof, Theorem 2.5](https://arxiv.org/pdf/2412.10210)

The middle result has direct precedents. Gabai's p. 526 Corollary 8.6, attributed there to Poénaru (1974), proves that the disk with one 2- and one 3-handle is a standard disk when its \(H_2\) vanishes. This premise holds here because adding the last 4-handle leaves \(H_2\) unchanged. Scharlemann's published Corollary 2.2 proves recognition for a homology four-sphere with one 2-handle and no 3-handles, allowing the dual form above. The 1957/1958 Chern–Lashof papers are the historical attribution for the average, whose needed specialization is proved directly here. The underlying recognition and averaging inputs are established. [Gabai, Corollary 8.6](https://doi.org/10.4310/jdg/1214441488) · [Scharlemann, Comment. Math. Helv. 83 (2008), p. 422](https://ems.press/content/serial-article-files/43163?nt=1)

## Equality can give exactly six

At \(J=\omega\), the averaging argument gives a Morse height with at most six points. If every Morse height has at least six, the count is six throughout the open regular antipodal direction set, by local constancy there and the mean. This latter possibility occurs for actual immersions of the standard sphere.

For an integer \(k\ge1\), let \(\Theta=(2k+1)\pi\). Choose a smooth nonnegative \(b\) supported in \((0,\pi/2)\) with \(C=\int b(t)\cos t\,dt>1\), and put \(\rho(t)=1+b(t)+b(\Theta-t)\). Define

\[
r(t)=\int_0^t\rho(s)\cos s\,ds,\qquad
z(t)=\int_0^t\rho(s)\sin s\,ds,\qquad
F(t,y)=(z(t),r(t)y),\quad y\in S^3.
\]

The symmetry gives \(r(\Theta-t)=r(t)\) and \(r(\Theta)=0\). In the middle the radius is \(C+\sin t>0\), and on either end it is positive away from the endpoint by monotonicity and reflection. Near the two collapsed endpoint orbits, \(\rho=1\) and \(r\) is the sine of the respective cap parameter. In the smooth coordinates \(w=r y\) each cap is a smooth spherical graph. The parameter cylinder with these caps is the standard \(S^4\), and \(|(z',r')|=\rho>0\) verifies immersion on the cylinder. The unit normal is \((\cos t,-\sin t\,y)\) up to a global sign. Each nonaxial unit direction has one preimage in each of the \(2k+1\) length-\(\pi\) meridian intervals, all regular. Axial heights are degenerate on interior critical latitude orbits. Thus every Morse height has \(4k+2\) critical points and \(J=k\omega\). In particular \(k=1\) verifies that equality need not produce a four-critical-point height.

The induced metric in this example is \(\rho^2dt^2+r^2g_{S^3}\). Changing variable by \(d\tau=(\rho/r)dt\) yields a conformal multiple of the cylinder. The round conformal factor \(\operatorname{sech}^2\tau\) gives a smooth positive comparison factor after dividing by \(r^2\), since both ends have round cap coordinates. Thus the examples have positive Yamabe classes and zero Weyl energy while \(J=k\omega\) grows without bound.

## Immersion existence and remaining estimate

Kervaire–Milnor Theorem 3.1 gives \(TM\oplus\mathbb R\cong M\times\mathbb R^5\) for a smooth homotopy four-sphere by their explicit definition of \(s\)-parallelizability. That trivialization is a bundle monomorphism into the pullback of \(T\mathbb R^5\) over a constant map. Hirsch's positive-codimension immersion theorem realizes an immersion into \(\mathbb R^5\). This construction controls the bundle map up to formal homotopy. [Kervaire–Milnor, Ann. of Math. 77 (1963), §3, p. 508](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/kervaire-milnor.pdf) · [Hirsch, Trans. AMS 93 (1959), Theorems 5.7 and 6.1, pp. 265 and 269](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/hirsch.pdf)

The determinant cost has no upper bound in \(C^1\) neighborhoods even in one regular homotopy class. Take any immersed graph chart \(F(x)=(x,u_0(x))\) and modify only there by \(u_n=u_0+n^{-3/2}\chi(x)\sum_{j=1}^4\cos(nx_j)\), with \(\chi\) supported in the chart and one on a fixed interior cube. Graph interpolation preserves immersion throughout and the modification tends to zero in \(C^1\). In the cube the Hessian perturbation is diagonal with entries \(-n^{1/2}\cos(nx_j)\). On a subset of uniformly positive measure, each cosine is bounded away from zero and the entries have an odd number of negative signs. The bounded background Hessian preserves that inertia for large \(n\), and \((\det D^2u_n)_-\) is at least a constant times \(n^2\) there. The graph identity

\[
(\det A)_-\,dV_g=\frac{(\det D^2u_n)_-}{(1+|Du_n|^2)^{5/2}}\,dx
\]

gives \(J(F_n)\to\infty\) with unchanged outer graph. Also a fixed-shape patch rescaled by an ambient dilation has exactly the same determinant integral, since the four principal curvatures scale inversely and the four-volume scales directly to the fourth power. These tests rule out an estimate from shrinking support or small first-order displacement alone. They quantify variation in the class of actual immersions and do not test the infimum of \(J\) on an unknown smooth type.

The remaining geometric input is an immersion of each smooth homotopy four-sphere with \(J<8\pi^2/3\), or directly one Morse function with at most four critical points. The strict sufficient condition and the direct height condition each characterize the standard smooth type among homotopy four-spheres, since the standard round inclusion has \(J=0\). The existence theorem for immersions supplies neither quantitative premise.
