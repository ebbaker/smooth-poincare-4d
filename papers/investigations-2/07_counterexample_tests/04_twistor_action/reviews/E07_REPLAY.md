# SP4-TWA-E07 · Independent replay of E01–E06

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E07_REQUEST_v1.md)
records GPT-6.2 Astra/ultra as the author-selected lead and GPT-6.2 Sol/ultra
as the configured helper. Actual backend model and reasoning effort were
unavailable. HEAD was **280376dd7a1820fa2878d0ab0ee2e639facb2eeb**. All
fifteen frozen working-tree digests matched. This reviewer authored none of
E01–E06.

All six results pass at their stated hypotheses. The geometric control is
an elementary monotone Lagrangian cobordism with minimal Maslov number two.
The verified chart period is nonzero. The radial endpoint functional gives
an exact cotangent graph, including where the composition intersection fails
to be clean. The transmission replay quantifies over supplied smooth pieces
at the fixed flat cut.

## E01 · First variation and conformal weights

For the fixed smooth oriented Riemannian spin four-manifold, take commuting
positive half-spinors and the real part of the Hermitian pairing.
Skew-adjoint Clifford action gives \(c^*z=-\sum_i e^i\otimes e_i\cdot z\)
and \(cc^*=4I\). Consequently the orthogonal projection
\(P=(I-c^*c/4)\nabla\) has the \(+\tfrac14 X\cdot D\) convention. For
\(r=|\psi|>0\), \(q=P\psi\), the derivative of \(|q|^4r^{-4}\) in direction
\(\eta\) is \(4(W,P\eta)-4(r^{-6}|q|^4\psi,\eta)\), where
\(W=r^{-4}|q|^2q\). Because \(W\) lies in \(\ker c\), the first term pairs
with \(\nabla\eta\). The formal interior adjoint on \(W\) is
\(-\operatorname{tr}\nabla W\), and the boundary integration contributes
the outward \(+4W(\nu)\,dA\). This fixes both signs and the factor in
\(S=J^4\).

For \(h=f^2g\), put \(U=\operatorname{grad}_g\log f\) and let \(\beta\) be
the unitary spin identification. In the paired frames the spin connection
increment is \(\tfrac14(U\cdot X\cdot-X\cdot U\cdot)\); the scalar term in
it cancels the derivative of \(f^{1/2}\). The \(h\)-frame Clifford trace
then gives \(f^{-1/2}\beta(D_g\psi+2U\cdot\psi)\).
The \(U\)-terms cancel in the twistor projection, leaving fixed-vector
weight \(+1/2\) on \(P\), hence norm weight \(-1/2\). The field norm has
weight \(+1/2\). The quotient to the fourth power has weight \(-4\),
which cancels the volume weight \(+4\). Likewise the weights of \(W\)
as a fixed covector, \(4W(\nu)\) as a section, and \(4W(\nu)\,dA\) as a
density are \(-5/2,-7/2,-1/2\). This last weight cancels that of the
transported test spinor. The bulk Euler section has weight \(-9/2\),
because the test-spinor and volume weights total \(+9/2\). Choosing
\(f=r^{-2}\) gives the stated spinor-induced unit scale and
\(\dot h=-4r^{-2}(\psi,\eta)h\).

At \(P\psi_0=0\) and \(r_0\ge m>0\), the numerator for \(\psi_0+v\) is
exactly \(|Pv|^4\). For \(\|v\|_{C^0}\le m/2\), the mean value estimate
for the denominator supplies an \(O(\|v\|_{C^1}^5)\) integrated error.
The Hessian vanishes in all directions. For \(a=P\eta\), \(b=P\zeta\),
the numerator Hessian is \(8(q,a)(q,b)+4|q|^2(a,b)\).
The denominator-factor Hessian is
\(24r^{-8}(\psi,\eta)(\psi,\zeta)-4r^{-6}(\eta,\zeta)\).
The two product-rule mixed terms have coefficient \(-16r^{-6}|q|^2\).
The fourth derivative at \(\psi_0\) is eight times the
\(|\psi_0|^{-4}\)-weighted integral of the sum of the three pairings
of the four \(P\eta_i\). These checks apply in the uniformly zero-free
class. [E01](../notes/E01_VARIATION.md)

## E02 · Radial stationarity, exactness and the diagonal

On the flat periodic cylinder of length \(L\) and torus volume \(V\),
\(P(e^u\psi_0)(\partial_t)=(3/4)e^u v\psi_0\) and
\(|P(e^u\psi_0)|^2=(3/4)e^{2u}v^2\) with \(v=u'\).
Thus the radial density after torus integration is \(9Vv^4/16\).
Strict convexity in \(v\) gives the unique affine-logarithm minimizer
in the radial class. The full bulk first variation equals
\(4\) times \(-(9/16)e^{-u}(v^3)'\psi_0\) because the differentiated
\(e^{-u}\) cancels the denominator term. This checks stationarity
against arbitrary smooth fixed-trace spinor tests when \(v\) is
constant. The outward spinor density is
\(\pm(9/4)e^{-u}v^3\psi_0\,dA\). Pairing it with \(e^u\psi_0\,du\)
and integrating gives \((-p,p)\) with \(p=(9V/4)v^3\).
The incoming reversal gives equal incoming and outgoing momenta.

The base coordinates are the two log endpoints, with generating action
\(9V(u_1-u_0)^4/(16L^3)\). The signed tautological form pulls back to its
differential and the graph is an embedded surface of half the ambient
dimension. Each phase projection has rank one at \(v=0\) and two
otherwise. Solving for the velocity gives the real cube root with optimal
Hölder exponent \(1/3\) at zero. The graph over the endpoint positions
is smooth even there. For equal endpoints, any smooth zero-action field
in the admitted class satisfies \(P\psi=0\) by continuity, also when
isolated zeros are allowed. Projection and the flat Clifford relations
give \(P^*P=-3\Delta/4\), so the field is harmonic and the zero-trace
Dirichlet energy identity gives uniqueness. The unequal-end harmonic
interpolant has nonzero normal twistor derivative, excluding zero
attainment in the stated class. [E02](../notes/E02_FLAT_TORUS.md)

## E03 · Fixed-zero, fixed-jet differentiation

In normal coordinates about a prescribed interior transverse zero let
\(r\) be the distance from the zero. The fixed jet \(X\mapsto X\cdot a\),
\(a\ne0\), has norm \(|a||X|\) and Dirac trace \(-4a\), hence its twistor
trace is zero. Uniformly in the compact smooth parameter family this
gives \(|\psi|\asymp r\) and \(P\psi=O(r)\). The tangent variation
\(\eta=O(r^2)\) has \(P\eta=O(r)\). Consequently \(W=O(r^{-1})\),
\(\nabla W=O(r^{-2})\), and the denominator variation section is
\(O(r^{-1})\). The two differentiated density pairings are bounded by
\(O(1)\) and \(O(r)\). Dominated convergence applies to the difference
quotients by writing each as an average of parameter derivatives.
On a sphere of radius \(\epsilon\), the inner outward normal of the
punctured domain is \(-\partial_r\). The flux has absolute size
\(O(\epsilon^{-1}\epsilon^2\epsilon^3)=O(\epsilon^4)\).
The adjoint term paired with \(\eta\) is \(O(1)\) in the excised ball.
These bounds localize to finitely many fixed disjoint zeros.

Stretching just the \(e_1\) component of the compatible jet by two keeps
transversality and changes the Dirac trace to \(-5a\). The \(e_1\)
twistor component becomes \((3/4)e_1\cdot a\); continuity and transverse
growth then give a density comparable to \(r^{-4}\) and logarithmic
divergence in dimension four. These checks apply to the supplied families
with the prescribed zero set and prescribed jets. [E03](../notes/E03_FIXED_JETS.md)

## E04 · Seam variation and radial composition

On two adjacent equal-cross-section cylinders put \(a,z,d\) for the
three log traces and \(\kappa=9V/4\). The derivative of the broken action
in \(z\) equals \(\kappa(v_1^3-v_2^3)\), with
\(v_1=(z-a)/L_1\) and \(v_2=(d-z)/L_2\). The cube is strictly increasing,
so this has the sign of \(v_1-v_2\), which is strictly increasing in
\(z\) and has unique zero \(z=(L_2a+L_1d)/(L_1+L_2)\). The action
there equals the length-\((L_1+L_2)\) action, with matching signed phase
momenta. The two outward spinor momenta cancel since the joined trace
and slope are common and the normals are opposite. The seam Hessian
there is \(3\kappa v^2(L_1^{-1}+L_2^{-1})\).

In the four coordinates on the product relation the matching locus
is the pair of linear equations \(v_1=v_2\), \(z=a+L_1v_1\), hence
dimension two everywhere. The original two seam constraints use
\(v_1^3-v_2^3\), so their differential has rank one at zero slope and
two away from zero. The ambient tangent intersection therefore has
dimension three at zero slope and two elsewhere. Projection of the
actual intersection to the outer relation is a diffeomorphism, since
the outer positions recover the common slope. This justifies the
exact composition at the diagonal directly.

For supplied smooth pieces on B01's unit flat cut, their common trace
cancels the seam measure in the weak first derivative. The action
splits and E03 controls interior excision. Integration by parts and
arbitrary smooth common trace variations give weak stationarity iff
the bulk equations and the sum-zero outward flux hold. In the trace
duality the smooth densities define elements of \(H^{-9/2}\), and
their vanishing on all smooth trace tests determines those covectors.

With fixed \(s\ne0\) and common tangential jet, let \(q_i=Az_i+C\),
where \(A^*A=(3/4)I\). The common-normal momentum is
\(N(z)=4|s|^{-4}A^*(|Az+C|^2(Az+C))\). Writing \(\delta=q_1-q_2\),
\[
 (|q_1|^2q_1-|q_2|^2q_2,\delta)
 =\tfrac12(|q_1|^2+|q_2|^2)|\delta|^2
 +\tfrac12(|q_1|^2-|q_2|^2)^2
 \ge \tfrac14|\delta|^4 .
\]
It follows that \((N(z_1)-N(z_2),z_1-z_2)\ge
(9/16)|s|^{-4}|z_1-z_2|^4\), including at vanishing defect. The
signed momenta determine the full first jet and imply \(C^{1,1}\)
gluing using the bounded one-sided second derivatives. Where \(q\ne0\)
the twice-normal principal coefficient is positive with lower bound
\(3|s|^{-4}|q|^2 I\), so solving for the second normal derivative and
differentiating recursively proves smooth gluing on that open seam set.
This last solved-equation argument degenerates at \(q=0\). [E04](../notes/E04_GLUING.md)

## E05 · The specified torus and strip

Keep the fixed \(K=9/4\), \(N=(\mathbb R/16\mathbb Z)^2\), and the chart
\((-8,8)^2\). For \(t\in[0,2]\), the position
\(q_t=\cos\theta+(1+t)\sin\theta\) has absolute value at most \(\sqrt{10}\),
and \(|p|=|K\sin^3\theta|\le K\). There is no chart aliasing. The momentum
determines \(\sin\theta\), and the position then determines \(\cos\theta\),
so \(\gamma_t=(q_t,p)\) is injective. The momentum derivative vanishes
only at \(\sin\theta=0\) or \(\cos\theta=0\). At those angles the position
derivative is \((1+t)\cos\theta\) or \(-\sin\theta\), respectively, both
nonzero. This proves the circles are embedded and Lagrangian.

For the specified strip parameter \(\tau\), the Legendre energy is
\(pv-(K/4)v^4=(3K/4)v^4\). The vertical term in
\(y=1-\tau'(3K/4)\sin^4\theta\) has derivative
\(-3K\tau'\sin^3\theta\cos\theta\) in \(\theta\).
This cancels \(q_s p_\theta-q_\theta p_s=3K\tau'\sin^3\theta\cos\theta\).
The strip image has dimension two since its \(s\) coordinate separates
slices and its circle derivative is nonzero. Those facts also give
injectivity, and compactness makes it an embedding up to the boundary.
The specified constant collars give precisely the two end products
at height \(1\). For the extension with constant \(\tau\) off the strip,
compact ambient sets have closed preimage in a bounded \(s\)-slab times
the circle. This verifies properness and the slab conditions. In the
journal definition the arrow goes from the positive to the negative end,
hence \(C_2\leadsto C_0\).

On the product chart the primitive is \(\lambda=-y\,ds-p\,dq\). Its
period on increasing \(\theta\) at fixed \(s\) is
\(K\int_0^{2\pi}\sin^4\theta\,d\theta=3\pi K/4=27\pi/16\), since the
other integrand is proportional to \((\sin^4\theta)'\). All primitives
on the specified contractible chart have this same period. The torus
slice has area \(256\), which obstructs an ambient global primitive as
well. The chart obstruction also holds on any open domain containing
the spanning disk below, by Stokes's theorem.

For the end circles, the strip cylinder, and its cylindrical extension,
the ambient \(\pi_2\) vanishes and inclusion sends the generator of
the Lagrangian \(\pi_1\) to zero, since each circle representative lies
in the chart. The relative homotopy sequence therefore identifies
\(\pi_2\) of each pair with \(\mathbb Z\) by the boundary. A generator
disk in the chart is \((u,w)\mapsto(u+(1+t)w,K w^3)\) on the unit
disk oriented by \(du\wedge dw\), with boundary traversed in
increasing \(\theta\). For the cylinder pair take \(t=0\) in the
negative collar and constant planar coordinates. The disk pulls
\(dq\wedge dp\) back to \(3K w^2 du\wedge dw\), whose integral is
\(3\pi K/4\). The boundary tangent angle has one positive crossing of
the upward vertical direction. Indeed \(q_\theta=0\) gives
\(\tan\theta=1+t\); the first-quadrant solution has \(p_\theta>0\)
and \(q_{\theta\theta}<0\), so the angle derivative there is
\(-q_{\theta\theta}/p_\theta>0\). At the other solution the tangent
points down. Thus the oriented tangent has winding \(+1\) and the
unoriented line has Maslov index \(+2\), using the product chart
trivialization of the disk pullback. The additional constant
horizontal line in the collar contributes zero to this index.
The generator checks yield \(\omega=(27\pi/32)\mu\) and minimal
positive-area Maslov number \(2\) for each pair. This gives
monotonicity of the chosen cobordism and ends in the journal
definition. Its uniform-family condition also tracks equality
of the Maslov-two disk counts, with common constants required when
that count is nonzero. These counts and hypotheses for a comparison
Lagrangian or application of Theorem 2.2.1 lie outside the replay.
[E05](../notes/E05_COBORDISM_CONTROL.md)

## E06 · One quadratic Dirichlet control

For \(S_{2,\rho}=\frac12\int\rho^{-6}|P\psi|^2\), the factor \(\frac12\)
gives the outward density \(\rho^{-6}P\psi(\nu)\,dA\) and Hessian
\(\int\rho^{-6}(P\eta,P\zeta)\). On the only control, the unit torus
and length-two cylinder with \(\rho=1\), the formal interior
\(P^*P=-3\Delta/4\) yields the exact Dirichlet quadratic form
\((3/4)\|\nabla\eta\|_2^2\) on the full spinor space of zero traces.
The interval sine eigenvalues are \(n^2\pi^2/4\) for \(n\ge1\).
Tensoring with the torus Fourier modes adds \(4\pi^2|k|^2\), so the
lowest Hessian eigenvalue is exactly \(3\pi^2/16\), attained at
\(n=1,k=0\) in any constant spinor component.

The positive amplitude interpolant with \(a_\pm=e^{u_\pm}\) is harmonic
and is the unique quadratic minimizer by the exact zero-trace energy
difference. Its action is \(3(a_+-a_-)^2/16\), with outward amplitude
covectors \((-p^a,p^a)\), \(p^a=3(a_+-a_-)/8\). Pulling back to log
coordinates gives \((-a_-p^a,a_+p^a)\) and a log endpoint Hessian
\((3/8)A^2\begin{pmatrix}1&-1\\-1&1\end{pmatrix}\) at common amplitude
\(A\). The signed amplitude phase map is the linear shear on its
positive-amplitude domain; the log version is its cotangent coordinate
change. For the quartic problem the radial log action on the same
cylinder is \(9(u_+-u_-)^4/128\) with outward \((-p_4,p_4)\),
\(p_4=9(u_+-u_-)^3/32\), and the quartic full homogeneous Hessian
vanishes at the parallel reference. Rescaling the prescribed
quadratic \(\rho\) by \(c>0\) scales the Hessian, gap and covectors
by \(c^{-6}\). [E06](../notes/E06_FIXED_SCALE.md)

## Source checks and formal statement coverage

Re-read Friedrich's published §1, p. 59, projection and equation (1.1),
and the pp. 59–60 conformal kernel paragraph for the Riemannian twistor
conventions. The off-shell weight and boundary laws used in the replay
follow from the calculation. Vankerschaver–Liao–Leok arXiv:1111.0280v2
§4, Theorems 4.1–4.2, explains admissible-data isotropy and assumes
manifold structures on the boundary spaces. For the radial graph here,
pullback and dimension give exactness directly. Re-read Biran–Cornea
§2.1.1 for monotonicity, §2.1.2 Definition 2.1.1 for the strip and arrow,
§4.1 for the cylindrical extension, and the hypotheses of Theorem
2.2.1 for their Floer application. [Friedrich](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
· [Vankerschaver–Liao–Leok](https://arxiv.org/pdf/1111.0280v2#page=16)
· [Biran–Cornea](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf#page=2)

The [formalization handoff](../research-progress/handoffs/TO_FORMALIZATION_TWA_FIRST_HORIZON_20261128.md)
is supported by this replay for the real radial composition and tangent
ranks, the \((9/16)|s|^{-4}\) normal monotonicity estimate, the E01/E03
variational statements, the E06 fixed quadratic statement, the E04
weak seam equivalence, and the E05 split-form embedding, collars and
proper extension. The E05 relative area and Maslov identities are
verified here in addition to its listed geometric statement. The
unequal-trace bounds, nonlinear inverse, local Sobolev composition
and higher-order transmission at zero defect have distinct replay
owners or packets. No mathematical repair is required for E01–E06
at the frozen scope.
