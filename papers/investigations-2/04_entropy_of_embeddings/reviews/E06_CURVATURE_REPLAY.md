# ENT-E06 · Replay of the two curvature comparisons

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance by a separate reader. The serving model and reasoning effort are
unavailable to the reader. Inputs were the [revision 1 request](../research-progress/handoffs/REQUEST_E05_E06_20261127.md)
(Git blob `e95c6398dd818874269e91ee2ce68bca82fb359a`),
[B02, issue 1](../brainstorm/notes/B02_CURVATURE_COMPARISON.md)
(`334bf014ccc0ff269bb8c6d57f21c880ccc19249`), and the sections
on metric data, middle signature and heights in the
[first-series immersion manuscript](../../../investigations-1/04_hypersurface_immersions/manuscript/chiral_energy_of_hypersurface_immersions.tex)
(`953c1b3aaaace295a58da02e632e76657880896d`). Repository baseline
`6a422ce7814f`. The comparisons are independently recalculated below.

**Normalization.** For a smooth embedded four-dimensional hypersurface
\(\Sigma\subset\mathbb R^5\), use the induced Euclidean metric and its area
measure \(d\mu\). If \(\nu\) is a unit normal, let \(A=-d\nu\) under the
tangent-space identification, and let \(U\) consist of the points at which
\(A\) has two positive and two negative eigenvalues. With
\(\omega=|S^4|=8\pi^2/3\), the first-series normalization is
\[
 \tau(\Sigma)=\frac{2}{\omega}\int_\Sigma |\det A|\,d\mu,
 \qquad I_2(\Sigma)=\int_U\det A\,d\mu.
\]
The first-series height averages are \(\tau\) and \(2I_2/\omega\), respectively.
The factor two counts both normal signs as critical points of a linear
height. Reversal of \(\nu\) preserves both integrals in dimension four.
Signature \((2,2)\) refers to \(A\), with the induced metric Riemannian.

### Ellipsoids · project theorem, replayed

Write \(Q=\operatorname{diag}(L^{-2},L^{-2},L^{-2},L^{-2},L^2)\) and
\(E_L=\{p:p^TQp=1\}\). The outward normal is \(Qp/|Qp|\) and its inverse
on the unit sphere is \(u\mapsto Q^{-1}u/(u^TQ^{-1}u)^{1/2}\).
For a nonzero tangent vector \(w\),
\(\langle d\nu(w),w\rangle=w^TQw/|Qp|>0\) since \(w\perp Qp\).
Thus the shape operator is definite. Its absolute determinant is the
Gauss map's absolute Jacobian, whose integral is \(\omega\) by the area
formula. Hence \(\tau(E_L)=2\) and \(I_2(E_L)=0\). For any smooth embedded
sphere the linear height in direction \(u\) has a maximum with outward
normal \(u\), using the bounded region. The Gauss map is surjective and
the area formula gives \(\tau\ge 2\).

The upper and lower sheets on \(B_L^4\) have heights
\(\pm L^{-1}(1-|y|^2/L^2)^{1/2}\), with graph area element at least \(dy\).
The complement is the equator, which has zero four-area. At centre zero
and scale parameter one this gives
\[
 \lambda(E_L)\ge F_{0,1}(E_L)\ge
 2e^{-1/(4L^2)}\left(1-(1+L^2/4)e^{-L^2/4}\right).
\]
Indeed, in four-dimensional polar coordinates the normalized Gaussian
integral over \(B_L^4\) reduces to \(\int_0^{L^2/4}s e^{-s}\,ds\).
The lower bound tends to two. At \(L=4\), \(e^{-1/64}>63/64\) and
\(e^4>32\) give \(F_{0,1}(E_4)>1701/1024>8/5>4/e\). This uses
\(e>5/2\). Thus the minimal values of both curvature integrals fail to
force the entropy band on a given embedding. The limiting calculation
rules out a uniform ceiling strictly less than two even when both
curvature integrals are minimal.

### Shears · project theorem, replayed

For positive integers \(k\), put \(u_k(y)=k^{-3/2}\sum_{i=1}^4\cos(ky_i)\)
and \(\Phi_k(y,z)=(y,z+u_k(y))\), and set \(\Sigma_k=\Phi_k(S^4)\).
The inverse subtracts \(u_k\) at the same \(y\). The derivative norm of
each map is bounded by \(K_k=1+2k^{-1/2}\) everywhere, since
\(|Du_k|\le 2k^{-1/2}\). This is also a global Lipschitz bound for each.
For any smooth global diffeomorphism \(\Phi\) with both Lipschitz
constants bounded by \(K\), the tangential four-Jacobian is at most
\(K^4\). Given any \(a\in\mathbb R^5\) and \(t>0\), set
\(b=\Phi^{-1}(a)\). The distance estimate
\(|\Phi(x)-a|\ge |x-b|/K\) gives
\[
 F_{a,t}(\Phi\Sigma)
 \le K^4(4\pi t)^{-2}\int_\Sigma e^{-|x-b|^2/(4K^2t)}\,d\mu
 =K^8 F_{b,K^2t}(\Sigma).
\]
The factor \(K^4\) beyond the Jacobian is the scale prefactor. This
includes centres off the hypersurface and all positive scales. Taking
suprema and applying the same estimate to \(\Phi^{-1}\) gives
\(K^{-8}\lambda(\Sigma)\le\lambda(\Phi\Sigma)\le K^8\lambda(\Sigma)\).
In particular \(\lambda(\Sigma_k)\to\lambda(S^4)\).

**Import at the point of use.** The primary journal PDF of Colding and
Minicozzi, *Generic mean curvature flow I: generic singularities*,
Annals of Mathematics 175 (2012), 755–833, was checked on 27 November
2026 at Lemma 7.10, its proof and the preceding statement in §7.2
(bibliography key `ColdingMinicozzi2012Generic`). For a smooth complete
self-shrinker with empty boundary, polynomial volume growth and no
isometric line factor, the unrestricted Gaussian maximum is attained
at the normalized shrinker centre and scale \((0,1)\). A round \(S^j\)
of radius \(\sqrt{2j}\) meets these hypotheses. Evaluating at \((0,1)\)
and using dilation invariance gives
\(\lambda(S^j)=|S^j|(j/(2\pi e))^{j/2}\). In particular
\(\lambda(S^4)=32/(3e^2)<\lambda(S^3)<\lambda(S^2)=4/e\).
For the strict inequalities the squared ratios \(\lambda(S^3)^2/\lambda(S^4)^2\)
and \(\lambda(S^3)^2/\lambda(S^2)^2\) are \(243\pi e/2048\) and
\(27\pi/(32e)\), respectively. The elementary bounds
\(25/8<\pi<22/7\) and \(e>27/10\) suffice.
[Primary source](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n2-p07-p.pdf#page=31)

On the upper hemisphere over the cube \(C=(-1/8,1/8)^4\), write the
sheared graph as \(v=g+u_k\), where \(g(y)=\sqrt{1-|y|^2}\). Its Hessian
is \(D^2g+D_k\) with \(D_k=-\sqrt{k}\,\operatorname{diag}(\cos(ky_i))\).
On the region of \(C\) with the first two cosines at least \(1/2\) and
the last two at most \(-1/2\), \(D_k\) has two signs of each kind and
\(|D_k w|\ge \sqrt{k}|w|/2\). If \(B=\sup_C\|D^2g\|\), then every
matrix \(D_k+sD^2g\), \(0\le s\le1\), has smallest singular value at
least \(\sqrt{k}/2-B\ge\sqrt{k}/4\) for sufficiently large \(k\).
Inertia is constant along this nonsingular symmetric path and
\(\det D^2v\ge k^2/4^4\) on the region.

Each of the two one-dimensional cosine conditions occupies a third of
each full period. An interval of length \(\ell=1/4\) contains whole
periods of total length at least \(\ell-4\pi/k\). For large \(k\) the
four-coordinate region thus has Lebesgue measure at least
\((\ell/6)^4\). The Riemannian graph area there is at least this large.
To compute the weighted determinant, set \(s_v=(1+|Dv|^2)^{1/2}\).
The graph metric \(G=I+Dv\otimes Dv\) has determinant \(s_v^2\), the
area measure is \(s_v\,dy\), and the second fundamental form is
\(\pm D^2v/s_v\). The shape operator is similar to the symmetric
congruence of this form by \(G^{-1/2}\), so it has signature \((2,2)\)
throughout the region. Its determinant times graph area is
\((\det D^2v)s_v^{-5}\,dy\), preserving the positive sign on that
region. Since \(s_v\) is bounded by a constant independent of \(k\),
the integral over the region is bounded below by a positive constant
times \(k^2\). The integrand on the rest of \(U\) is nonnegative.
Hence \(I_2(\Sigma_k)\to\infty\) and
\(\tau(\Sigma_k)\ge 2I_2(\Sigma_k)/\omega\to\infty\).

### Quantifiers

The ellipsoid is a counterexample to a curvature-to-entropy implication
with ceiling \(\lambda(S^2)\) or \(\lambda(S^3)\) on the tested embedding.
In the other direction, for every fixed \(c>\lambda(S^4)\) and finite
\(B_0\), there is a shear with \(\lambda(\Sigma_k)<c\) and both
\(I_2(\Sigma_k)>B_0\) and \(\tau(\Sigma_k)>B_0\). This includes both
recognition ceilings. The ellipsoid estimate is a lower limit, and the
shear estimate requires a strict gap above the round value. Both are
statements about the geometry of a given embedding of the standard
smooth sphere. The infimum over embeddings of another smooth type,
including the marked minus presentation sphere, is outside the scope
of the comparisons. The first-series Weyl and Yamabe hypotheses enter
neither proof. No mathematical conflict with B02 issue 1 emerged.
