# Tests for a least-\(D\) minimum and an umbilic cut

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E derivation under master B06. Actual serving model and reasoning effort were unavailable. Working input checkout 48f36794f9b1aafc519a3bde9abec6df57eba51b. SHA-256 prefixes of the [master register](../research-progress/REGISTER.md), [least-\(D\) selection](ATTAINED_EQUALITY_TEST_20261127.md), [physical cap proof](ATTAINED_OR_MARKED_RECOGNITION_20261127.md), [local-axis calculation](LOCAL_AXIS_MARKED_CUT_20261127.md), and [08 seam smoothing](../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md) are 2bfb3ce237f4, 9a9ce76b13b5, 84c05d0a1b9f, a5db0c73bfac, and 835cff73b949. The calculations use smooth Riemannian metrics on a smooth closed oriented homotopy four-sphere, with \(e=E_+=E_-\) in the real curvature-operator Hilbert–Schmidt normalization and \(T=4\pi^2\).

## A non-Einstein Ricci null direction cannot integrate toward lower scalar action

Assume \(I=I^+(M)<2T\) is attained and \(g\) is a volume-one Yamabe metric of least \(D=\int_M|\operatorname{Ric}^\circ|^2\,dV\) among the exact volume-one positive Yamabe minimizers with \(e=I\). Write \(Z=\operatorname{Ric}_g^\circ\), \(s=Y([g])>0\), and \(\mathcal E=\{q\text{ smooth}:Y([q])>0,\ e(q)=I\}\) on the original marked smooth manifold. This set includes all representatives of the minimizing conformal classes. The Euler identity at any exact volume-one Yamabe metric reads \(D=4I+(Y^2-Y_{\rm rd}^2)/12\), so least \(D\) gives \(Y([q])\ge s\) on \(\mathcal E\). The normalized total scalar action is
\[
 \mathscr S(q)=\operatorname{Vol}(q)^{-1/2}\int_M R_q\,dV_q.
\]
The constant Yamabe test gives \(\mathscr S(q)\ge Y([q])\) for every \(q\) and equality at \(g\). In particular \(\mathscr S\ge s\) on \(\mathcal E\). Variation of \(R\) and the volume at \(g\), followed by integration of the divergence term, gives
\[
  D\mathscr S_g[h]=-\int_M \langle Z,h\rangle\,dV_g,\qquad
  \mathscr S(g+tZ)=s-Dt+O(t^2).                                  \tag{1}
\]
The total volume in this calculation is one and the background scalar is spatially constant. [Exact selection and normalization](ATTAINED_EQUALITY_TEST_20261127.md)

For \(D>0\), any one-sided tangent \(q_j=g+t_j h+o_{C^2}(t_j)\) of \(\mathcal E\), with \(t_j\downarrow0\), must satisfy \(\int\langle Z,h\rangle\le0\). In particular \(+Z\) is excluded, and a two-sided differentiable family of exact metrics through \(g\) has tangent \(L^2(g)\)-orthogonal to \(Z\). The same obstruction holds if a smooth tangent differs from \(Z\) by a conformal or diffeomorphism tangent, since \(Z\) is trace-free and divergence-free.

In a fixed small convex \(C^2(g)\) ball \(\mathcal U\) around \(g\), metrics are uniformly comparable to \(g\), their volumes are bounded above and below, and their Ricci tensors are uniformly bounded. On this ball \(D\mathscr S_q\) has uniformly bounded operator norm on \(L^2(g)\). Indeed the scalar-action derivative is integration against a linear combination of \(\operatorname{Ric}_q\), \(R_q q\), and a scalar multiple of \(q\), with volume factors bounded on \(\mathcal U\). Integrating along the segment between two metrics proves \(|\mathscr S(q)-\mathscr S(\tilde q)|\le L\|q-\tilde q\|_{L^2(g)}\). For \(g_t=g+tZ\), (1) gives
\[
\frac D{2L}\,t\le \operatorname{dist}_{L^2(g)}(g_t,\mathcal E\cap\mathcal U)
                    \le t\|Z\|_{L^2(g)}\qquad(0<t\ll 1).          \tag{2}
\]
The upper bound uses \(g\in\mathcal E\). Taking an arbitrarily small fixed \(\mathcal U\) still gives (2) for sufficiently small \(t\).

Put \(F=e=E_+\) and \(\mathcal H=D^2F_g\). Positivity of the Yamabe sign is open. Thus \(F(g_t)\ge I\) for both signs of small \(t\), \(DF_g=0\), and \(\mathcal H\) is nonnegative on all smooth metric variations. If \(\mathcal H(Z,Z)=0\), the cubic coefficient of \(F(g_t)-I\) vanishes by the two-sided minimum. Consequently
\[
              0<F(g_t)-I=O(t^4) \qquad(0<t\ll1,\ D>0).           \tag{3}
\]
The strict inequality follows from (1) since \(\mathscr S(g_t)<s\) rules out \(g_t\in\mathcal E\). Equations (2) and (3) exclude a local lower bound \(F-I\ge c\,\operatorname{dist}_{L^2(g)}(\,\cdot\,,\mathcal E\cap\mathcal U)^\alpha\) with \(c>0\) and \(0<\alpha<4\), even along the positive Ricci line alone. Proving integrability of the Ricci null vector to a two-sided exact family, or proving this growth bound, would force \(D=0\) when the Ricci Hessian vanishes. [Ricci Hessian in the Yamabe gauge](E20_CLOSED_VARIATION.md)

The affine line energy is real analytic in \(t\). In finitely many fixed charts the Weyl-square density uses \(g_t\), its inverse, at most two spatial derivatives, and the square root of its determinant. Compactness gives a common analytic disk about \(t=0\) for these expressions and their local integrals. By (3) the energy on the line is nonconstant, and the two-sided minimum forces its first nonzero term to be \(c_{2m}t^{2m}\), with \(c_{2m}>0\) and \(2m\ge4\). In particular if the quartic coefficient vanishes, the same distance argument excludes every growth exponent below six.

There is also a fourth-variation test on the smooth competitors \(g+tZ+\tfrac12t^2 k\). The mixed Hessian \(\mathcal H(Z,k)\) vanishes by nonnegativity and polarization. In the affine chart of smooth covariant tensors set \(A=D^4F_g[Z,Z,Z,Z]\) and \(B_k=D^3F_g[Z,Z,k]\). Taylor expansion and \(\mathcal H(Z,Z)=0\) give
\[
 F\bigl(g+tZ+\tfrac12t^2 k\bigr)-I
 =\tfrac{t^4}{24}\bigl(A+6B_k+3\mathcal H(k,k)\bigr)+O(t^5).
\]
Replacing \(k\) by every real multiple gives the necessary conditions
\[
 A\ge0,\qquad 3 B_k^2\le A\mathcal H(k,k)\quad\text{for all smooth }k.
\]
When \(\mathcal H(k,k)>0\), minimizing the quadratic in that multiple gives a strict same-type positive competitor if the inequality fails. If \(\mathcal H(k,k)=0\), any \(B_k\ne0\) gives such a competitor by choosing the sign and size of the multiple. No strict violation has been shown on an unspecified attained minimum.

## Recognition from one Cotton-flat patch

Let \([g]\) attain the positive subcritical minimum \(I<2T\). Suppose \(M\) contains a smooth connected embedded totally umbilic \(\Sigma\cong S^3\) in this class, and that the Cotton tensor of the induced conformal structure vanishes on a nonempty relatively open subset of \(\Sigma\). Then the class is conformally round. The same conclusion holds if \(\Sigma\) is instead a hypersurface component of the fixed set of a smooth global conformal involution and has the same local Cotton condition. Both criteria apply without a rotational action.

The smooth attained class is Bach-flat by first variation in the open positive Yamabe locus. Near any point of the cut, fix a local analytic metric \(\bar g\) in the class in a conformal harmonic coordinate chart, using obstruction-flat analyticity in dimension four. Umbilicity persists in that gauge. Let \(\nu\) be a local unit normal and write \(B(X,Y)=\bar g(\bar\nabla_X\nu,Y)=\beta h(X,Y)\), where \(h=\bar g|_{T\Sigma}\). Use \(R(X,Y)=\nabla_X\nabla_Y-\nabla_Y\nabla_X-\nabla_{[X,Y]}\) and \(\operatorname{Ric}(X,Y)=\sum_a\bar g(R(e_a,X)Y,e_a)\). The contracted Codazzi law is \(d_\Sigma\beta(X)=-\operatorname{Ric}_{\bar g}(\nu,X)/2\). Indeed the tangential part of \(R(X,Y)\nu\) is \(X(\beta)Y-Y(\beta)X\), whose contraction over the three tangent directions gives this sign and factor.

An intrinsic affinely parametrized geodesic of the cut, with ambient position \(x\) and velocity \(v\), therefore solves
\[
 \dot x=v,\qquad
 \bar\nabla_v v=-\beta|v|_{\bar g}^2\nu,\qquad
 \bar\nabla_v\nu=\beta v,\qquad
 \dot\beta=-\tfrac12\operatorname{Ric}_{\bar g}(\nu,v).
\]
In the analytic ambient coordinates this is a first-order analytic ODE on \((x,v,\nu,\beta)\). At a fixed base point \(p\) use the initial data \((p,v_0,\nu_p,\beta_p)\) and let \(v_0\) vary in a small ball in \(T_p\Sigma\). Uniqueness identifies the analytic ODE flow with the cut's intrinsic geodesic exponential there. Evaluation at time one gives an analytic parametrization of the cut, with derivative equal to the inclusion at zero. Its induced metric and Cotton tensor are therefore analytic in a connected cut patch about every point. [Lassas–Liimatainen, Theorem 3.7(c)](https://arxiv.org/pdf/1912.08030#page=26)

In dimension three, vanishing of the Cotton tensor is conformally invariant and characterizes local conformal flatness. The interior of its zero set on \(\Sigma\) is open and closed. At any limit point the analytic gauge just constructed gives a connected cut chart meeting an open set of zeros, so the analytic identity theorem gives vanishing throughout the chart. Connectedness suffices even with separate analytic ambient gauges. Equivalently, the local condition can be replaced by vanishing of the Cotton tensor to infinite order at one point of the cut. The resulting smooth locally conformally flat \(S^3\) develops into a round \(S^3\). Compactness makes its local conformal diffeomorphism a covering, hence a conformal diffeomorphism. This parametrizes the actual cut in its induced conformal class.

For the reflection criterion, averaging a smooth representative and its pullback makes the involution an isometry. A fixed hypersurface component is totally geodesic, hence umbilic in the full class. It separates since \(H^1(M;\mathbb Z/2)=0\), and the action interchanges its two sides by reflection of the normal. Folding gives a retraction from \(M\) onto each closed side. Each side is simply connected and acyclic, hence contractible, so the cut is an integral homology sphere. In the pinched gauge below its actual induced metric has positive scalar curvature. The three-dimensional PSC homology sphere classification and smooth contractible-filling obstruction then give \(\Sigma\cong S^3\). [Chodosh–Maximo–Mukherjee, Corollary 2.3 and Proposition 4.2](https://arxiv.org/pdf/2407.05574#page=10)

For either criterion, choose the smooth Chang–Gursky–Yang entering representative in the same conformal class. Write \(h_{\rm ph}\) for its actual induced cut metric and \(H_i\) for the trace of its second fundamental form with the outward unit normal \(\nu_i\) of side \(i\). The pinching \(R>0,\ |\operatorname{Ric}^\circ|^2<R^2/12\) implies \(a=R-2\operatorname{Ric}(\nu_i,\nu_i)>0\), since \(|\operatorname{Ric}^\circ(\nu_i,\nu_i)|\le(\sqrt3/2)|\operatorname{Ric}^\circ|\). The scalar Gauss identity and the actual opposite signs \(H_1=-H_2\) give
\[
 R_{h_{\rm ph}}=a+\tfrac23H_i^2,\qquad
 6V+2H_i\ge \frac{3a}{3V+|H_i|}>0,\qquad
 V=\sqrt{R_{h_{\rm ph}}/6}.
\]
This is the strict physical trace margin for each cap. In the conformal parametrization just produced, write \(h_{\rm ph}=w^2 g_{S^3}\). The cap is \(w_i^2g_{\rm Eucl}\) with outward normal derivative \(3\partial_\nu\log w_i=-wH_i-3\) and boundary value \(w_i=w\). This carries the actual first jets with opposite outward signs. Raulot's order-one Rayleigh comparison, applied with boundary metric \(V^2 h_{\rm ph}\), gives the cap pairing \(6\langle f,P_1^{h_{\rm ph}}f\rangle\ge6\int V f^2\,dA_{h_{\rm ph}}\). Thus the first-jet joins have strictly positive scalar quadratic forms on the two actual capped manifolds. The matched smoothing preserves positivity and tends to the raw signed costs. [Chang–Gursky–Yang, Theorem A and Corollary B](https://arxiv.org/pdf/math/0409583#page=4) · [Raulot, equations (24)–(25), \(n=3\)](https://arxiv.org/pdf/1909.08274#page=10) · [Physical cap and smoothing proof](ATTAINED_OR_MARKED_RECOGNITION_20261127.md)

Signature gives equal chiral costs on each capped homotopy sphere and hence on each raw side in the limit. At least one side's capped cost is strictly less than \(T\) for sufficiently close smoothings. Recognition at that threshold and marked reassembly identify the other capped side with \(M\). Its limiting positive-class cost is bounded below by \(I=e\), forcing the discarded raw cost to be zero. The original Bach-flat metric therefore has \(W=0\) on a nonempty open set and hence everywhere. This proves the asserted conformal roundness. [Marked reassembly](../manuscript/marked_cut.tex) · [Lassas–Liimatainen, Theorem 3.8](https://arxiv.org/pdf/1912.08030#page=27)

## A curvature test on a proposed cut

The Codazzi law yields \(W_{\nu abc}=0\) along every umbilic hypersurface, for all tangent indices \(a,b,c\). Indeed the mixed Riemann term from \(B=\beta h\) is exactly the mixed Schouten term, because \(P^g(\nu,X)=\operatorname{Ric}_g(\nu,X)/2=-X(\beta)\). Use components \(R_{ijkl}=g(R(e_i,e_j)e_l,e_k)\). For \(u_a=\nu^\flat\wedge e_a^\flat\), the adapted chiral orthonormal bases are \((u_a\pm *u_a)/\sqrt2\). In these bases the matrices of \(W^+\) and \(W^-\) are equal, since the \((u_a,*u_b)\) pairings of \(W\) vanish and \(W\) commutes with \(*\). Every smooth umbilic cut is therefore contained in the common zero locus of
\[
 \Phi_2=|W^+|^2-|W^-|^2,\qquad
 \Phi_3=\operatorname{tr}((W^+)^3)-\operatorname{tr}((W^-)^3).
\]
At a common zero where the pair \((d\Phi_2,d\Phi_3)\) has rank two, there is no umbilic hypersurface through the point. When an entire closed connected umbilic cut is in the regular \(\Phi_2=0\) locus, it equals a connected component of that locus by local immersion and closedness. These statements are conformally invariant, since the functions have fixed scalar weights and the differentials on their zero loci transform by the same weights.

In the physical gauge the \(\nabla\Phi_2/|\nabla\Phi_2|\) normal on a regular component gives its second fundamental form as \(\nabla^2\Phi_2|_{T\Sigma}/|\nabla\Phi_2|\). The two outward traces use opposite signs of its tangential trace, and a vanishing trace-free part checks umbilicity. For the local Cotton input, in an arbitrary ambient representative let \(P^g\) be its Schouten tensor, \(P^h=\operatorname{Ric}_h-\tfrac14R_h h\), and \(J_{bc}=W_{\nu b\nu c}\). The tangential Gauss equation and ambient Weyl trace-freeness give
\[
 P^h_{bc}=P^g_{bc}-J_{bc}+\tfrac12\beta^2 h_{bc}.
\]
Taking the antisymmetric covariant derivative in tangent indices \(a,b\), the connection correction to the \(P^g\) term cancels the derivative of \(\beta^2 h/2\) by \(d_\Sigma\beta=-P^g(\nu,\cdot)\). The normal-variation terms in the derivative of \(J\) vanish by \(W_{\nu abc}=0\). With \(C_{abc}=\nabla_a P_{bc}-\nabla_b P_{ac}\) this gives the local test
\[
 C^h_{abc}=C^g_{abc}-(\nabla^g_a W)_{\nu b\nu c}
                             +(\nabla^g_b W)_{\nu a\nu c}.
\]
For the product test \(g=dt^2+h\), the vanishing of \(R_{\nu b\nu c}\) gives \(J=-\tfrac12\operatorname{Ric}_h+\tfrac16R_hh\) and \(P^g|_{T\Sigma}=\tfrac12\operatorname{Ric}_h-\tfrac1{12}R_hh\), recovering \(P^h\) and its Cotton tensor.

**Selection on a regular zero component.** Suppose a smooth attained positive subcritical class has a compact connected component of its regular \(\Phi_2=0\) locus diffeomorphic to \(S^3\). To recognize the class it suffices that the trace-free tangential Hessian of \(\Phi_2\) and the displayed Cotton test vanish on one nonempty relatively open patch of that component, with the Cotton formula evaluated where the first test gives umbilicity. Indeed in each local Bach-flat analytic gauge \(\Phi_2\) is analytic. Its regular zero hypersurface is analytic by the implicit function theorem. The trace-free second fundamental form is analytic in such a chart, and its vanishing is a conformal property. The open-and-closed argument above therefore propagates umbilicity from the patch to the full component. Cotton flatness then propagates, and the two marked caps use the physical outward traces specified by the gradient and their strict physical margin. This gives an ambient intrinsic way of specifying the candidate cut without an assumed reflection or rotational action. The signature identity \(\int_M\Phi_2\,dV=0\) leaves the existence, topology and local geometric tests of the component undecided.

## Generic metrics have no umbilic hypersurface

On every smooth closed oriented four-manifold an open dense set of smooth metrics has \(0\) as a regular value of \((\Phi_2,\Phi_3)\colon M\to\mathbb R^2\). Each such conformal class admits no smooth immersed totally umbilic hypersurface, even locally. In particular this applies on an open dense subset of any nonempty positive subcritical set on a fixed smooth homotopy sphere.

In oriented orthonormal frames the algebraic Weyl fiber consists of pairs \((A,B)\) of trace-free symmetric \(3\)-by-\(3\) matrices and has dimension ten. Their common invariants determine the characteristic polynomial \(x^3-\tfrac12\operatorname{tr}(A^2)x-\tfrac13\operatorname{tr}(A^3)\), so equality of both invariants is equality of the unordered spectra. At a pair with simple common spectrum, \(2A\) and \(3(A^2-\operatorname{tr}(A^2)\operatorname{Id}/3)\) are linearly independent as gradients in the \(A\) variable. Otherwise \(A\) would satisfy a quadratic relation and could not have three distinct eigenvalues. This part of the common zero locus is smooth of codimension two. At a nonzero repeated common spectrum \((a,a,-2a)\), the pair is uniquely specified by \(a\ne0\) and the two unoriented simple eigenlines. The inverse is smooth, since \(a=-\operatorname{tr}(A^3)/\operatorname{tr}(A^2)\) and \((a\operatorname{Id}-A)/(3a)\) gives the first line projector, with the same formula for \(B\). This is an embedded stratum of dimension \(1+2+2=5\). The remaining common zero is \((0,0)\), of codimension ten.

In the bundle of positive metric two-jets, the inverse images of these strata have codimensions \(2,5,10\), respectively. To see this, hold the metric value and its first derivatives fixed at a point in normal coordinates. The quadratic coefficient in the normal-coordinate expansion of a metric can realize any algebraic Riemann tensor, so its projection onto the two trace-free symmetric Weyl blocks is surjective in the second-derivative variables. A smooth orthonormal trivialization over metric values gives the same local submersion in arbitrary coordinates.

For density, around any smooth reference metric choose finitely many coordinate balls and cutoff functions that equal one on smaller balls covering \(M\). In each add the coordinate tensor monomials of degrees at most two, multiplied by the cutoff, with independent real coefficients in a small parameter ball. Their two-jets span every vertical jet fiber at each point of a smaller ball. Thus the map from the parameter ball times \(M\) to the positive metric two-jet bundle, taking the perturbed two-jet, is a submersion. The preimages of the three strata are submanifolds. Sard's theorem applied to their three projections onto the parameter ball makes almost every parameter a regular value of all three projections. At a point of a regular fiber, every parameter tangent lifts to a tangent of the corresponding preimage. Subtracting such a lift from an arbitrary parameter-and-base tangent leaves a base tangent with the same class in the normal space of the stratum. Thus each individual jet section at a regular parameter is transverse to the three strata. The two strata of codimension greater than four are missed, and the simple common zero stratum pulls back transversely. Perturbations can be arbitrarily small in the smooth topology. On the compact manifold, zero being a regular value of \((\Phi_2,\Phi_3)\) is open in the \(C^1\) topology of this pair and hence in the \(C^3\) metric topology. [Boardman, *Singularities of differentiable maps*, Theorem (1.5), for the general jet-transversality statement](https://www.numdam.org/item/PMIHES_1967__33__21_0.pdf#page=5)

The regular common zero locus is empty or two-dimensional, while the derivative of an immersed umbilic hypersurface would have rank three and lie in its tangent space. Openness of the strict energy and Yamabe inequalities places these metric perturbations inside an already entered band, including near the round class on the known standard sphere. The argument concerns the full smooth metric space. It supplies no admissible transverse perturbation within the set of exact Bach-flat minima. Thus a universal cut theorem at the minimum would need information from the critical equation or some other restriction beyond entry. Recognition for a general smooth attained minimum and universal positive entry remain open.
