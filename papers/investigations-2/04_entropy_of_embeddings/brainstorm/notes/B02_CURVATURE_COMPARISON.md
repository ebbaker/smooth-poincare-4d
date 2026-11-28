# Entropy and total absolute curvature on the same embedding

27 November 2026, for Edward B. Baker III. ENT-B02, OpenAI Codex lead, exact serving model/effort unavailable. Intake 6a422ce7814f. The [first-series immersion manuscript](../../../../investigations-1/04_hypersurface_immersions/manuscript/chiral_energy_of_hypersurface_immersions.tex), sections on metric data and heights, uses both normal signs. On a smooth embedded hypersurface of dimension four write
\[
 \omega=|S^4|,\quad \tau=\frac{2}{\omega}\int|\det A|\,d\mu,
 \qquad I_2=\int_{\operatorname{sig}A=(2,2)}\det A\,d\mu .
\]
The formula for \(\tau\) here is a definition. The comparisons below are proved directly, without importing a recognition criterion from that manuscript.

**Decision (heuristic assessment).** Open the reserved comparison in both directions relevant to recognition: can minimal total absolute curvature force the entropy band on this embedding, or can the entropy band bound the total or index-two curvature of the same embedding? The following smooth embedded standard spheres decide both tests. Comparing infima over embeddings or imposing additional second-derivative control is a different question.

**Project theorem (working at issue), minimal total curvature.** For \(L>1\), take the ellipsoid \(E_L=\{(y,z)\in\mathbb R^4\times\mathbb R: |y|^2/L^2+L^2 z^2=1\}\). Its Gauss map is a diffeomorphism: with \(Q=\mathrm{diag}(L^{-2},\ldots,L^{-2},L^2)\), it sends \(p\) to \(Qp/|Qp|\) with inverse \(u\mapsto Q^{-1}u/\sqrt{u^TQ^{-1}u}\). The Gauss Jacobian is \(|\det A|\), so \(\tau=2\) and \(I_2=0\) by strict convexity. This is the minimum on embedded spheres: the outward normal assumes each direction at a support plane, hence its absolute Jacobian integrates to at least \(\omega\) by the area formula. The two graphical sheets over \(B_L^4\) have area element at least \(dy\) and height at most \(L^{-1}\) in magnitude. Thus
\[
 \lambda(E_L)\ge F_{0,1}(E_L)\ge
 2e^{-1/(4L^2)}\big[1-(1+L^2/4)e^{-L^2/4}\big].
\]
Here the bracket is the mass of \(B_L^4\) for the normalized Gaussian \((4\pi)^{-2}e^{-|y|^2/4}\). The right side tends to two. Already \(L=4\) gives a lower bound exceeding \(4/e\): use \(e^{-1/64}>63/64\), \(e^4>32\), and \(e>5/2\). The conclusion is \(\liminf\lambda(E_L)\ge2\); no upper estimate for the ellipsoids is needed.

**Project theorem (working at issue), converse failure.** There are smooth embeddings \(F_k:S^4\hookrightarrow\mathbb R^5\) with \(\lambda(F_kS^4)\to\lambda(S^4)=32/(3e^2)\), and \(I_2(F_k),\tau(F_k)\to\infty\). Take the unit sphere and the ambient shear
\[
 \Phi_k(y,z)=(y,z+u_k(y)),\qquad u_k(y)=k^{-3/2}\sum_{i=1}^4\cos(ky_i).
\]
Set \(F_k=\Phi_k|_{S^4}\). Both this global diffeomorphism and its inverse have Lipschitz constant at most \(K_k=1+2/\sqrt{k}\), by the bound on \(|Du_k|\). For any globally invertible smooth map with both Lipschitz constants at most \(K\), a four-area increases by at most \(K^4\). Relative to any centre \(a=\Phi(b)\), the new distance is at least \(|x-b|/K\). Consequently
\[
 F_{a,t}(\Phi\Sigma)\le K^8 F_{b,K^2t}(\Sigma),\qquad
 K^{-8}\lambda(\Sigma)\le\lambda(\Phi\Sigma)\le K^8\lambda(\Sigma).
\]
Applying the same bound to the inverse gives the lower inequality; it tends to equality for these shears. The spherical value uses the [primary shrinker maximum](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n2-p07-p.pdf), Lemma 7.10 and its proof.

On a fixed small coordinate cube inside \(B_{1/2}^4\), the upper hemisphere is the graph of \(g(y)=\sqrt{1-|y|^2}\). Both \(Dg\) and \(D^2g\) are uniformly bounded there. The new Hessian is \(D^2g-\sqrt{k}\,\mathrm{diag}(\cos(ky_i))\). On the part of the cube with the first two cosines \(\ge1/2\) and the last two \(\le-1/2\), the diagonal term has two eigenvalues of each sign and smallest absolute eigenvalue at least \(\sqrt{k}/2\). For large \(k\), the bounded perturbation preserves inertia and all four absolute eigenvalues are at least \(\sqrt{k}/4\): interpolate linearly, using the reverse triangle inequality on every unit vector. The region occupies a fixed positive volume for all large \(k\), by counting whole periods in each coordinate. The graph shape has the Hessian's inertia up to a common sign. Its absolute Gauss–Kronecker density is
\[
 |\det D^2(g+u_k)|\,(1+|D(g+u_k)|^2)^{-5/2}\,dy .
\]
This follows from the graph metric \(I+Dv\otimes Dv\) and second fundamental form \(D^2v/\sqrt{1+|Dv|^2}\). Slopes are uniformly bounded. The positive contribution on this middle-signature region grows at least as a constant times \(k^2\). This proves both divergences and, in particular, rules out a finite uniform bound on either integral under any fixed entropy ceiling strictly above the round value.

**Scope (project theorem).** These two constructions refute the proposed threshold implications for individual embeddings, even in the standard smooth type. They give neither a bound nor an obstruction for \(I_{\rm ent}\) of the minus presentation sphere. The comparison concerns total and middle Gauss curvature; no converse about a fixed intrinsic Yamabe or Weyl class is used.

Evidence at integration: [E06](../../reviews/E06_CURVATURE_REPLAY.md) independently replayed both examples, with the all-centre distortion estimate and both normal signs. The [formal request](../../research-progress/handoffs/TO_FORMALIZATION_ENTROPY_20261127.md) includes their precise conclusions.
