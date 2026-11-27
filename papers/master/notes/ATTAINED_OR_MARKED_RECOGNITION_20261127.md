# Positive caps on a conformally round umbilic cut

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Master conceptual B05/B06. Selected scientific lead GPT-6.2 Astra/ultra. Independent serving telemetry is unavailable. Source checkout `48f36794f9b1aafc519a3bde9abec6df57eba51b`. All statements below concern smooth oriented Riemannian manifolds, with nonpositive Laplacian convention \(\Delta=\mathrm{div}\,\nabla\). On a homotopy four-sphere, \(e=E_+=E_-\) uses the Hilbert–Schmidt curvature-operator normalization, and \(T=4\pi^2\). The previous [physical trace test](ROUND_CUT_TRACE_TEST_20261127.md), [marked gluing theorem](../manuscript/marked_cut.tex), [local source model](MARKED_NATIVE_DEGREE_20261127.md) and [08 diagram audit](../../investigations-1/08_cut_geometry_and_chirality/04_slide_filters/notes/TERMINAL_DIAGRAM_AUDIT_20261127.md) have SHA-256 prefixes `07d51eaba7f7`, `dac42a05369a`, `c508ac1584bc` and `491881384f52`, respectively.

## The weighted boundary inequality

Let \(h\) be any smooth representative of the round conformal structure on the three-sphere with \(R_h>0\). Use the hyperbolic four-ball with this conformal infinity. Write \(P_1^h\) for its order-one conformal half-Laplacian and \(P_2^h=-\Delta_h+R_h/8\) for the intrinsic three-dimensional conformal Laplacian in unit-leading-coefficient normalization. We claim that every real \(f\in H^{1/2}(S^3)\) satisfies
\[
 \langle f,P_1^h f\rangle_h
 \ \ge\ \int_{S^3}\sqrt{R_h/6}\, f^2\,dA_h .                 \tag{1}
\]
The constant is attained on a round sphere by constants.

Set \(V=\sqrt{R_h/6}\) and \(\widehat h=V^2h\). Conformal covariance of the order-two operator gives, on writing \(z=V^{1/2}v\),
\[
 \frac{\langle v,P_2^{\widehat h}v\rangle_{\widehat h}}
      {\|v\|_{L^2(\widehat h)}^2}
 =\frac{\int (|\nabla z|^2+R_h z^2/8)\,dA_h}
        {\int V^2 z^2\,dA_h}\ \ge\ \frac34 .
\]
Raulot's Theorem 3.1 applies to the hyperbolic four-ball for every smooth boundary representative in its round, positive Yamabe conformal infinity. At boundary dimension three it gives
\[
  \lambda_1(P_1^{\widehat h})^2
        \ \ge\ \tfrac43\lambda_1(P_2^{\widehat h})\ \ge\ 1.
\]
The order-one form is positive by conformal covariance from the unit sphere, where its operator is harmonic Dirichlet-to-Neumann plus the identity. Taking the positive square root is therefore justified. Set \(v=f/V\) in its Rayleigh inequality. The identity \(P_1^{\widehat h}v=V^{-2}P_1^h(Vv)\) gives the left side of (1) as its numerator, and its squared norm is \(\int V f^2dA_h\). Density extends (1) to the trace space. The temporary boundary metric \(\widehat h\) serves solely to evaluate the two Rayleigh quotients. All curvatures appearing in (1) use the physical boundary metric \(h\). [S. Raulot, *Scalar flat compactifications of Poincaré–Einstein manifolds and applications*, equations (20), (24) and Theorem 3.1, equation (25)](https://arxiv.org/pdf/1909.08274#page=10)

## Automatic signs and recognition

**Theorem.** Suppose a smooth closed homotopy four-sphere has a positive conformal class of energy \(e<2T\) and a smooth embedded totally umbilic three-sphere with round conformal structure in that class. Both sides, capped by conformally flat marked balls, have positive Yamabe sign, and each signed energy converges under smoothing to its corresponding original side integral. If the class attains \(I^+(M)\), it is conformally round.

Take the Chang–Gursky–Yang representative of this same class with \(R>0\) and \(|\mathrm{Ric}^\circ|^2<R^2/12\). Umbilicity and the conformal structure of the cut persist. Trace-freeness in four dimensions gives \(|\mathrm{Ric}^\circ(\nu,\nu)|\le (\sqrt3/2)|\mathrm{Ric}^\circ|<R/4\). Thus \(R-2\mathrm{Ric}(\nu,\nu)>0\). For the trace \(H\) of the second fundamental form in either outward convention, the Gauss equation yields
\[
 R_h=R-2\mathrm{Ric}(\nu,\nu)+\tfrac23 H^2,
 \qquad 3\sqrt{R_h/6}>|H|.                                  \tag{2}
\]
The input to (1) is consequently positive and smooth. [Chang–Gursky–Yang, Main Theorem](https://annals.math.princeton.edu/2002/155-3/p02) · [08 entering gauge and Gauss formula](../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E01_DERIVATION.md)

Use the cut's conformal parametrization to attach a copy of the unit ball to a side \(U\), with reversed boundary orientation. If \(h=w^2g_{S^3}\), extend \(w>0\) smoothly, choosing its boundary derivative so that the outward mean curvatures are opposite. In fact \(3\partial_\nu\log w=-wH_U-3\) on the Euclidean ball boundary, and both second fundamental forms are pure trace. This matches the physical first jets in normal coordinates. The resulting cap metric \(w^2 g_{\rm eucl}\) is a smooth compactification of the hyperbolic ball. For a trace \(f\), the cap Robin form minimized over all extensions is \(6\langle f,P_1^h f\rangle_h\). Indeed on the flat ball its value on an extension \(u\) is \(6\int |\nabla(wu)|^2+6\int_{S^3}(wf)^2\), minimized by harmonic extension of \(wf\). The order-one boundary weight then gives the claimed physical pairing. The two outward Robin terms cancel in the joined form. Its lower bound is
\[
    \int_U (6|\nabla v|^2+Rv^2)\,dV+
    \int_\Sigma (6\sqrt{R_h/6}+2H_U) f^2\,dA_h .
\]
The boundary coefficient is strictly positive on the compact cut by (2), including on the side with negative outward mean curvature. The side bulk is positive for a nonzero side restriction. When the side restriction vanishes, the cap extension has zero trace and strictly positive Dirichlet energy unless it vanishes as well. The compact joined form attains its lowest eigenvalue, hence is strictly positive. The argument applies to both outward choices. The \(C^{1,1}\) joins have smooth approximations converging in \(C^1\cap W^{2,p}\) for every finite \(p\), preserving the positive sign and converging in both Weyl energies. [Raulot, equation (24)](https://arxiv.org/pdf/1909.08274#page=10) · [Matching, coercivity and smoothing](../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md)

Each capped side is a homotopy sphere. Since the chiral energies agree there, they also agree on each original side in the smoothing limit. Their costs sum to \(e<2T\), so at least one side with raw cost \(m<T\) gives a smooth positive cap below \(T\). This cap is standard by the recognition theorem. Reassembly with the marked ball identifies the other capped smooth type with \(M\). It follows, even before attainment, that
\[
                              m\le e-I^+(M).
\]
At attainment, \(m=0\) gives a nonempty Weyl-flat open set in the original metric. A smooth minimizer is Bach-flat by first variation in the open positive Yamabe locus. Weyl unique continuation on the connected manifold, followed by the developing map on the simply connected closed locally conformally flat manifold, gives conformal roundness. [Marked gluing and threshold](../manuscript/marked_cut.tex) · [Lassas–Liimatainen, Theorem 3.8](https://arxiv.org/pdf/1912.08030#page=27)

## A cut specified by reflection

Suppose an attained class as above admits a smooth conformal involution with a hypersurface component \(F\) in its fixed set. If the induced conformal three-geometry is locally conformally flat, the class is conformally round. One way to verify the intrinsic hypothesis is an action of \(SO(3)\) on \(F\) preserving its conformal class with principal orbits two-spheres.

Indeed averaging a representative with its pullback makes the involution isometric. The fixed component is totally geodesic in this gauge, hence umbilic in the entire class. The closed embedded hypersurface separates the homotopy sphere, as the mod-two class dual to an intersecting loop must vanish. Its two sides are exchanged since the derivative reflects the normal. Folding onto either side is a continuous retraction (the identity on that side and the involution on the other). Each compact side is consequently simply connected and acyclic, using the retraction on homology in degrees one through three and the nonempty boundary in degree four. It is contractible by the homological Whitehead theorem. The cut is therefore an integral homology three-sphere, and (2) gives a positive-scalar metric on it. By the PSC prime classification and the smooth contractible-filling obstruction it is diffeomorphic to \(S^3\). Its locally conformally flat structure now develops to a covering of \(S^3\), giving the required round conformal parametrization. This produces the cut from the reflection. In the stated rotation case an averaged induced metric on the principal stratum is \(ds^2+a(s)^2g_{S^2}\) in orthogonal orbit coordinates. It is locally conformal to the cylinder, and its Cotton tensor vanishes. Smoothness gives vanishing on the singular orbits by continuity. [Chodosh–Maximo–Mukherjee, Corollary 2.3 and Proposition 4.2](https://arxiv.org/pdf/2407.05574#page=10)

For an actual attained control write the unit sphere as \(\{(x_1,x_2,x_3,x_4,t):|x|^2+t^2=1\}\). Use \(g_\epsilon=e^{2\epsilon(x_1^2+tx_1)}g_{\rm rd}\). The conformal class attains energy zero, and \(t\mapsto-t\) is its conformal involution. For small nonzero \(\epsilon\) this representative lies in the strict pinched cone by openness. On the specified equator the normal towards increasing \(t\) gives \(H=3\epsilon x_1e^{-\epsilon x_1^2}\) and \(h=e^{2\epsilon x_1^2}g_{S^3}\). Its boundary scalar is \(6+\epsilon(20x_1^2-8)+O(\epsilon^2)\), hence is nonconstant for small \(\epsilon\ne0\). The induced metric and both signs of the actual mean curvature enter (1)–(2). This tests the calculation on the known standard type. On a remaining minimizer the existence of a conformally round umbilic cut, or of symmetry producing one, is still open.

## A separate local source and a one-sided marked example

For \(Y_j=\#_j(S^1\times S^2)\), \(Y_0=S^3\), every coordinate ball of every smooth Riemannian four-manifold contains a smoothly embedded \(Y_j\) of positive induced scalar curvature. The metric may be prescribed in advance.

Take the rounded planar-domain model in the [native degree calculation](MARKED_NATIVE_DEGREE_20261127.md), using a planar disk with \(j\) disjoint smaller disks removed in place of the pair of pants. Its rounded boundary is \(\partial(D\times D^2)=Y_j\). Each circular rim obeys the same estimates independently after choosing a common sufficiently small radius. The Euclidean induced scalar curvature is positive on the open rims and nonnegative everywhere, with zero set the flat product \(D\times S^1_\rho\) including its joins. Write \(y\in\mathbb R^2\) for the planar coordinates. Vary the embedding outward normally with smooth speed \(u=-|y|^2\), using its ambient restriction on the whole hypersurface. On the flat product the induced-metric variation is \(2uB\), a tensor supported in the circle direction with trace \(2u/\rho\). The divergence-divergence term in the scalar first variation vanishes since \(u\) is independent of the circle parameter, and the intrinsic Ricci tensor vanishes. Thus
\[
                  \dot R=-2\Delta_Du/\rho=8/\rho>0 .
\]
Smooth jets agree at the joins. The variation is uniformly positive on a neighborhood of the compact zero set for small time, and its compact complement initially has positive minimum. A fixed sufficiently small positive time gives a compact embedded strictly PSC hypersurface in Euclidean four-space. Dilation into a prescribed normal coordinate ball brings the rescaled ambient coefficients to the Euclidean coefficients in \(C^2\) on a fixed compact neighborhood of the model. Strict induced positivity persists in the original metric.

In fact a closed connected oriented three-manifold \(Z\) admits such a physical source mapping to it with nonzero degree if and only if \(Z\) admits PSC. For sufficiency, the PSC prime list gives spherical and \(S^1\times S^2\) factors. The free product of their fundamental groups has a finite-index torsion-free subgroup: map to the direct product of all finite factors by the identity on each finite factor, killing the free generators. Every finite-order element in a free product is conjugate into a finite factor, so the kernel is torsion-free. Pull back the PSC metric to the connected oriented finite cover, where the prime list now leaves only \(S^3\) or \(Y_j\). An oriented parametrization of the local model followed by the covering map supplies the required nonzero degree. Necessity is the three-dimensional PSC domination theorem. For a specified target diffeomorphic to \(Y_j\), the parametrization alone gives degree \(+1\). [Chodosh–Maximo–Mukherjee, Proposition 2.2 and Corollary 2.3](https://arxiv.org/pdf/2407.05574#page=4)

Take the one-sided GST Figures 5–6 example with the actual selected nontrivial band, its two zero-framed attachments and its original upper closing. Undo the exhibited slides to the stage with designated disk-framed unknot \(U\). In the \(U\)-first order the intermediate cut is \(Z_U=S^3_0(U)\cong Y_1\), oriented as the outgoing boundary of its zero trace. The boundary identification uses the disk longitude and the two solid tori of zero surgery. Compose that identification with an oriented parametrization of the embedded \(Y_1\) just constructed. This gives degree \(+1\) to the actual returned cut in every fixed metric, including any entering metric on this sphere. At each outgoing marked diffeomorphism \(P\) from the slides, the upper closing is \(qP^{-1}\) and each remaining tube is carried by \(P\). The two initial cuts of the chosen banded pair still fail PSC domination. This is a returned one-sided presentation on a previously recognized sphere. The local-source equivalence explains exactly why changing the ambient metric alone cannot settle an unclassified mixed target. More restrictive projection or homology requirements inside a particular native band retain genuine geometric content. [GST, Proposition 3.2 and Figures 5–6](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=8) · [08 marked return and two original cuts](../../investigations-1/08_cut_geometry_and_chirality/04_slide_filters/notes/TERMINAL_DIAGRAM_AUDIT_20261127.md)

## Bach flatness at a smooth rotation axis

**Local rigidity.** Let a smooth Riemannian Bach-flat four-dimensional conformal structure admit, on an invariant neighborhood, a smooth conformal action of \(SO(3)\) with a one-dimensional fixed component and its standard three-dimensional normal slice. Then the Weyl tensor vanishes on a neighborhood of that axis. A connected boundaryless Bach-flat extension is locally conformally flat everywhere. If the extension is closed and simply connected, it is conformally round. This consequence uses the smooth regular axis and Bach stationarity alone. It applies in particular at a smooth attained minimum with that local action.

Average a representative over the compact rotation group. The average is smooth, invariant and conformal to the original metric, so is still Bach-flat. Use axial arclength \(s\) and normal exponential distance \(r\) to the fixed curve, with an equivariant parallel normal frame on an interval. The radial Gauss lemma and the absence of an invariant one-form on the principal two-sphere give
\[
 g_{\rm rot}=dr^2+a(s,r^2)^2 ds^2+\phi^2 g_{S^2},\qquad
 \phi=r b(s,r^2),\quad a(s,0)=b(s,0)=1 .
\]
Smoothness and rotation invariance give even coefficients in the radius, with the displayed angular leading coefficient fixed by the normal exponential map. On \(r>0\) put \(q=\phi^{-2}(dr^2+a^2ds^2)\). The product \(q+g_{S^2}\) is Bach-flat there. Let \(K\) be the Gaussian curvature of \(q\) and \(u=K+1\). The Weyl curvatures of the two factor planes equal \(u/3\), and those of the four mixed coordinate planes are \(-u/6\), by subtracting the Schouten terms from the product Riemann tensor. All mixed off-diagonal entries vanish.

For \(B_{ij}=\nabla^k\nabla^l W_{ikjl}+\tfrac12\mathrm{Ric}^{kl}W_{ikjl}\), contraction in the sphere block gives \(6B|_{S^2}=(-\Delta_q u+(1-K)u)g_{S^2}\). The trace-free part in the base gives \(3(B|_q)^\circ=-(\mathrm{Hess}_q u)^\circ\). Consequently
\[
     \mathrm{Hess}_q u=\tfrac12(1-K^2)q,\qquad
     |du|_q^2= K-K^3/3+C .                                   \tag{3}
\]
To see the second equation, differentiate the squared norm, contract the Hessian with the gradient and integrate on the connected quotient collar. This derivation also holds at critical points. These are the Riemannian specializations of the product Bach equations. With scalar curvatures \(P=2K,Q=2\), equations (31)–(32) of Dzhunushaliev–Schmidt give \((\mathrm{Hess}_q K)^\circ=0\) and \(\Delta_q K+K^2=1\). [Dzhunushaliev–Schmidt, *New vacuum solutions of conformal Weyl gravity*, §4.3, equations (31)–(32)](https://arxiv.org/pdf/gr-qc/9908049#page=9)

On a fixed angular ray choose a smooth physical orthonormal frame tangent to the spherical orbits, by normalizing two transverse Cartesian coordinate vectors of the normal exponential chart. Their limits and first derivatives exist as \(r\to0\). Consequently the physical angular Weyl component \(F(s,r)\) and its first derivatives are locally bounded. Conformal scaling of the orthonormal Weyl component gives \(u=3\phi^2 F\). In particular \(u=O(r^2)\), \(u_r=O(r)\), \(u_s=O(r^2)\) and \(|du|_q=O(r^2)\). Hence \(K\to-1\) in (3) and \(C=2/3\). Factoring gives
\[
            |du|_q^2=u^2(1-u/3).
\]
For any fixed \(0<\eta<1\), near an interior axis point one has \(|\partial_r u|\le\phi^{-1}|u|\sqrt{1-u/3}\le (1+\eta)|u|/r\). Along a fixed \(s\) ray, an initial nonzero value at \(r_0\) then stays nonzero towards the axis: integration on its maximal nonzero interval gives \(|u(r)|\ge |u(r_0)|(r/r_0)^{1+\eta}\), ruling out a positive left endpoint. At zero the same inequality contradicts \(u=O(r^2)\). Thus \(u=0\) throughout a collar of an axis subinterval. The product Weyl tensor and the physical Weyl tensor vanish there. The extension statement follows by Weyl unique continuation for smooth obstruction-flat metrics in dimension four. Simple connectivity and compactness give a covering developing map onto the round four-sphere. [Lassas–Liimatainen, Theorem 3.8](https://arxiv.org/pdf/1912.08030#page=27)

This proof also supplies actual small cuts at an attained minimum with the specified axis: in a conformally Euclidean chart of the resulting Weyl-flat open set take inverse images of Euclidean round coordinate spheres. They are smooth embedded umbilic spheres with round conformal boundary. In the locally Euclidean representative they bound actual Euclidean balls. In the global CGY representative both cap signs follow from (1)–(2).
