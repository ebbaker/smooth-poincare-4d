# Independent check of the ALE Euler identity and the free-cut trace bound

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. This bounded master proof check uses checkout
72068cef1973d23aee808fe66476c44ed4b99cc5 and the 06 manuscript at Git object
bcc19e67ef1aed4890cf391d87a384a98337bfab. Actual serving model variant and
reasoning effort were unavailable. The Euler argument starts after
the embedded core, exclusion of nontrivial end groups and differentiated
ALE decay have been supplied. The trace argument starts at an actual
round-conformal umbilic cut. [06 marked compactification lemma][06] ·
[Master plan][master]

## Closed Euler calculation at Euclidean ends

Let \(X\) be a smooth connected oriented scalar-flat Riemannian
four-manifold with \(k\) Euclidean ends, finite total curvature and
differentiated metric decay through order two of some order
\(\alpha>0\) in the end charts. Assume that a whole compact truncation
\(U_R\) embeds with its actual \(k\) boundary spheres in a smooth
homotopy four-sphere \(M\). Each sphere separates individually because
\(H_1(M;\mathbb Z)=0\). In the incidence graph of \(U_R\) and the
complementary components, each boundary sphere is therefore a bridge.
The graph is connected and every edge joins the core to an exterior
vertex, so there is one exterior component per boundary sphere.
Van Kampen gives \(\pi_1(M)=\pi_1(U_R)*\bigast_j\pi_1(V_j)\), with all
factors trivial. Mayer–Vietoris gives
\(0=H_2(M;\mathbb Z)\cong H_2(U_R;\mathbb Z)\oplus\bigoplus_jH_2(V_j;\mathbb Z)\).
Filling the core with \(k\) balls gives a simply connected closed
manifold with zero \(H_2\), hence a homotopy sphere by duality and
Whitehead. In particular \(\chi(U_R)=2-k\) and the capped Euler
characteristic is two. This computation uses the spherical boundary
and the embedding of the whole core.

Interpolate to the Euclidean metric on disjoint annuli of fixed
relative width at radius \(R\), with a cutoff constant near each
seam. In scaled Cartesian coordinates on the annulus the \(C^2\)
error is \(O(R^{-\alpha})\). Both chiral energies and the integrals of
\(R_g^2\) and \(|Z_g|^2\) on the changed shells are
\(O(R^{-2\alpha})\). This bounds the changes in all four curvature
integrals as \(R\to\infty\), using finite curvature on the omitted
tail. On the outward continuation of each new flat sphere of
radius \(r_0\), take a ball cap with metric \(ds^2+f(s)^2\gamma\), where
\(\gamma\) is unit round, \(f(s)=r_0+s\) on an initial germ and
\(f(s)=L-s\) on a terminal germ at the pole \(s=L\). A smooth positive
interpolation on the intervening interval gives a smooth ball.
The increasing initial derivative is essential for joining the
retained expanding Euclidean germ.

Write the real two-form Hilbert–Schmidt Euler integrand as

\[
 \mathcal G=|W^+|^2+|W^-|^2-\tfrac12|Z|^2+\tfrac1{24}R_g^2 .
\]

Joining this cap to an ordinary Euclidean ball of radius \(r_0\) in
its marked chart gives a smooth \(S^4\). Its Chern–Gauss–Bonnet
integral is \(16\pi^2\), and the flat ball contributes zero.
Thus the cap contributes \(16\pi^2\) exactly, independently of
the interpolation or radius. As a sign check, the radial and
tangential sectional curvatures are \(-f''/f\) and
\((1-(f')^2)/f^2\), respectively. The Euler integrand is six times
their product. Integration therefore gives
\(-12\pi^2[f'-(f')^3/3]_0^L=16\pi^2\) with \(f'(0)=1\) and
\(f'(L)=-1\). Apply the closed formula to the
capped core and send \(R\to\infty\). Scalar flatness gives
\(Z=\operatorname{Ric}\) on \(X\), so

\[
 \begin{aligned}
 16\pi^2
 &= E_+(X)+E_-(X)-\tfrac12\int_X|\operatorname{Ric}|^2
       +16\pi^2 k,\\
 \int_X|\operatorname{Ric}|^2
 &=2\bigl(E_+(X)+E_-(X)\bigr)+32\pi^2(k-1).
 \end{aligned}
\]

In particular the strict bound \(\int_X|\operatorname{Ric}|^2<32\pi^2\)
forces \(k=1\) when \(X\) has at least one end. This is a closed-cap
proof of the identity in 06 in the Euclidean-ended case.
[CGY, Eq. (0.4) and norm convention][cgy]

## Positive caps at the inclusive trace bound

Let a smooth closed oriented homotopy four-sphere have a smooth
metric \(g\) with \(R_g>0\) and an embedded umbilic \(\Sigma\cong S^3\)
whose induced metric \(h\) is round-conformal. All boundary data
and the bound below refer to this same representative. Let
\(H_j\) be the trace of \(B_j=g(\nabla\nu_j,\cdot)\) for the outward
normal of side \(V_j\), so \(H_1=-H_2\). It is sufficient that

\[
 \bigl\|(H_j)_-\bigr\|_{L^3(\Sigma,h)}
       \le 3(2\pi^2)^{1/3}\qquad(j=1,2).
\]

Here \((H_j)_-=\max\{-H_j,0\}\). Bounding the full \(L^3\) norm
of \(H_j\) by the same constant implies this pair of bounds.

Choose a marking with \(h=w_0^2\gamma\). On the Euclidean unit ball
with metric \(\delta\), prescribe a positive smooth multiplier \(w\)
by \(w|_{\partial B}=w_0\) and
\(\partial_{\nu_\delta}\log w=-1-w_0 H_j/3\) at the boundary.
Extend the logarithm smoothly into the ball. For \(g_C=w^2\delta\)
the boundary metric is \(h\) and its outward mean curvature is
\(w_0^{-1}(3+3\partial_{\nu_\delta}\log w)=-H_j\).
Both second fundamental forms are pure trace. Hence the metrics
have matching boundary value and first normal derivative under
opposite outward normals, in geodesic collar coordinates.
The joined metric is \(C^{1,1}\), piecewise smooth, and the cap
has vanishing Weyl curvature in both signs.

For a smooth compact side define the quadratic form with boundary term

\[
 Q_g(u)=\int\bigl(6|\nabla u|^2+R_g u^2\bigr)\,dV_g
             +2\int_{\partial} H_g u^2\,d\sigma_g .
\]

It equals \(\int u L_g u+2\int_{\partial}u P_g u\), where
\(L_g=-6\Delta_g+R_g\) and \(P_g=3\partial_\nu+H_g\).
The conformal transformation laws for \(L_g,P_g\) give
\(Q_{w^2\delta}(u)=Q_\delta(wu)\). The \(L^3\) trace norm of \(u\)
at \(h=w_0^2\gamma\) is the \(L^3\) trace norm of \(wu\) at \(\gamma\).
On the Euclidean unit ball,
\(Q_\delta(v)=6(\int_B|\nabla v|^2+\int_{S^3}v^2)\). The sharp
trace theorem with boundary dimension \(n=3\) and
\(|S^3|=2\pi^2\) gives

\[
 Q_{g_C}(u)\ge 6(2\pi^2)^{1/3}\|u|_\Sigma\|_{L^3(h)}^2 .
\]

Density extends the inequality to \(H^1\). Add the side and cap
forms on the common trace. Their boundary terms cancel, while Hölder
bounds the side boundary term from below by
\(-2\|(H_j)_-\|_3\|u|_\Sigma\|_3^2\). Even at equality in the bound,
a nonzero restriction to the side contributes a strictly positive
bulk term by \(R_g>0\). If the restriction is identically zero,
the nonzero cap restriction has zero trace, and its conformally
transformed flat Dirichlet energy is strictly positive. Thus the
joined form is strictly positive on every nonzero \(H^1\) function.
Uniform ellipticity, bounded scalar curvature and Rellich compactness
give a positive first eigenvalue, and combining that bound with the
gradient term gives \(H^1\) coercivity.
[Ngô–Nguyen–Phan, Theorem 1.1, Eq. (1.4)][trace]

Smooth the joined metric in shrinking collars, converging in \(C^1\)
and \(W^{2,2}\) with uniform ellipticity. The scalar curvature
converges in \(L^2\), so \(H^1\hookrightarrow L^4\) controls the error
in the potential term uniformly relative to the \(H^1\) norm.
For small smoothing width the closed form stays coercive and thus
the smooth closed Yamabe class is positive. Both signed Weyl
energies converge to the respective raw energy of the retained
side, since the cap is conformally flat and the smoothing converges
in \(W^{2,2}\). This gives smooth approximate costs under the
inclusive trace threshold, with exact costs for the piecewise metric.
[Seam smoothing and capped sign background][seam]

## What the strict energy bound transfers

Van Kampen and Mayer–Vietoris make each side capped along the actual
\(S^3\) a smooth homotopy sphere. The closed smoothings have signature
zero, so the two raw energies on each side also agree by passage
to the limit. Write their common values as \(e_1,e_2\), with
\(e_1+e_2=e\) and \(T=4\pi^2\). If \(e<2T\), some \(e_i<T\),
and sufficiently close positive smoothings preserve that strict
inequality. The strict CGY sphere theorem recognizes that capped
side as standard. If both \(e_j<T\), both caps are standard and
so is \(M\). Recognition of one capped side identifies the smooth
type of the other capped side with \(M\). In the recognized
standard sphere, Palais identifies the embedded cap disk and a
collar with a standard disk and collar. The remaining component is
thus a standard ball. Hatcher's extension over a ball for the
boundary diffeomorphism of \(S^3\) preserves the actual reassembly.
The inclusive raw endpoint \(e_i=T\) alone gives no strict
inequality after smoothing. [CGY, Theorem A and Remark 2][cgy] ·
[Palais, Theorems B and C][palais] · [Hatcher, p. 553 and Appendix][hatcher]

Suppose a smooth metric on a nonstandard type attains the infimum
\(I^+(M)=e<2T\) among positive classes and has a representative and
cut as above. The other capped side is of type \(M\), and its positive
smoothings have energies tending to \(e-e_i\). Thus minimality gives
\(e\le e-e_i\) and \(e_i=0\). Positive Yamabe sign is open, so the
smooth attained metric is Bach-flat by Weyl variation on a closed
manifold of fixed signature. The original Weyl tensor vanishes on
the discarded interior. Bach-flat unique continuation on the
original connected smooth metric gives global vanishing, and CGY
then recognizes \(M\), a contradiction. The method excludes such
cuts at these minima under the stated representative and trace
hypotheses. [Lassas–Liimatainen, Theorem 3.8][ll]

[06]: ../../investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex
[master]: ../research-plan/PLAN.md
[seam]: ../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md
[cgy]: https://numdam.org/item/10.1007/s10240-003-0017-z.pdf
[trace]: https://viasm.edu.vn/Cms_Data/Contents/viasm/Media/Tienanpham18/Preprint_1837.pdf
[palais]: https://doi.org/10.1090/S0002-9939-1960-0117741-0
[hatcher]: https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf
[ll]: https://arxiv.org/pdf/1912.08030
