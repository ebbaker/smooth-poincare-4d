# Both fixed-band chiral costs from the first jets of the two marked metrics

27 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Master B02 at 48f36794f9b1, selected scientific lead GPT-6.2 Astra/ultra, independent check GPT-6.2 Sol/ultra. The [07 trial](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md) has blob e999229fcdf9. All curvatures below use the actual smooth Riemannian metrics, in any regular coordinate chart on the closed band. The master signed energy uses the Hilbert–Schmidt norm on real two-forms.

**Reduction.** At width \(1/16\) pointwise full Riemann curvature, scalar curvature and both signed Weyl densities require \(q_L,\partial q_L\) in the original planar coordinates. There is an exact calculation that removes \(\partial^2 q_L\), including at both endpoints of the switch. Thus one enclosure through the *second* derivatives of the harmonic map can serve the original closed sign and both signed integrals. It still has to be tight enough to decide the inequalities.

Write \(g=A+aD\), \(D=B-A\), \(a=H(16s-1)\). For any metric \(m\), write \(\Gamma_{ik}(m)=\nabla^m_{\partial_i}\partial_k\) in the chosen coordinate frame, and put
\[
 Q(m)_{ijkl}=\langle\Gamma_{ik}(m),\Gamma_{jl}(m)\rangle_m
             -\langle\Gamma_{jk}(m),\Gamma_{il}(m)\rangle_m .
\]
Use \(R_{ijkl}=\langle R(\partial_i,\partial_j)\partial_k,\partial_l\rangle\), so \(R_{ijji}\) on an orthonormal pair is the sectional curvature. For an array \(X_{pq;uv}\) write
\[
 \mathcal P(X)_{ijkl}=\tfrac12(X_{ik;jl}+X_{jl;ik}-X_{il;jk}-X_{jk;il}).
\]
Expanding the two differentiated Christoffel symbols of the first kind gives
\(R(m)=\mathcal P(\partial^2 m)+Q(m)\).
Set \(C_{pq;uv}=a_{,pq}D_{uv}+a_{,p}D_{uv,q}+a_{,q}D_{uv,p}\).
The product rule gives the exact all-lowered tensor
\[
 R(g)=(1-a)R(A)+aR(B)+\mathcal P(C)
             +Q(g)-(1-a)Q(A)-aQ(B).
\]
All \(Q\) and derivative terms are computed in the same chart. The full displayed sum is a tensor. For each of \(m=A,B\), write \(m=k+t\) as the sum of the pulled-back hyperbolic and unit spherical factors. Then
\[
 R(m)_{ijkl}=-(k_{il}k_{jk}-k_{ik}k_{jl})+(t_{il}t_{jk}-t_{ik}t_{jl}).
\]
The second formula uses the local isometry onto the product chart for each actual end metric. It includes all components from the framing, the time-dependent planar relator and the two polar displacements. No constancy of \(q_L\) in the planar chart has been assumed. At a flat end of the cutoff \(C=0\), and the three connection terms cancel to the chosen end result. There are no divisions by \(a\) or \(1-a\). Inverse metrics used in the connection and in the final contractions must still be bounded on a certified quadrature cell.

For two checks, a constant weight on identical metrics gives exactly their curvature; independent endpoint changes of coordinates would spoil this check unless the same marking is used for every term. On the unit round stereographic chart \(m=4(1+|x|^2)^{-2}I\), at \(x=(1,0,0,0)\) one gets \(\mathcal P(\partial^2m)_{1221}=-1\), \(Q(m)_{1221}=2\) and \(R_{1221}=1\). In four dimensions one obtains the curvature operator from \(\langle\mathcal R(e_i\wedge e_j),e_k\wedge e_l\rangle=R_{ijlk}\). Compress to the two Hodge eigenspaces and subtract \(R_g I/12\) in each diagonal block to get \(W^\pm\). The volume factor is \(\sqrt{\det g}\). The same contracted tensor yields the potential in the full scalar quadratic form. All trace and Hodge operations use the chosen physical orientation and \(g\).

The [absolute enclosure](HARMONIC_MARKING_ENCLOSURE_20261127.md) supplies upper bounds for precisely these native jets, but the intervals do not give a signed full Rayleigh numerator or a useful enclosure of \(c\). Uniformly tight two-sided metric data and quantitative first-derivative errors or an alternate test are still needed. The [isometric exchange](FIXED_WIDTH_BAND_TEST_20261127.md) makes a rigorously integrated band sufficient for both costs; the independent single-relator closings already give equality of its two chiral integrals. The unchanged width has no certified energy crossing.
