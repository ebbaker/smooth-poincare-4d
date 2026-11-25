# SP4-MASTER-E42 · Fixed-germ height and exterior energy audit

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded independent analytical check of the local E37 lower
bound and the proposed exterior replacement criterion. Actual serving model
and reasoning effort were unavailable. The frozen mathematical baseline is
`2689540e6dae1656b7f5ad4be52504db044995f2`. The working HEAD observed at
intake was `a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`. Exact input hashes
are below.

**Checked conclusions.** The fixed quadratic germ forces at least one
middle point for almost every direction in its normal image or antipode.
A compact sublevel pair gives an independent proof. For finitely many
disjoint marked patches with those germs, write \(E_{+,C}\) for the induced
chiral energy on the common exterior and \(s_j\) for the one-sign spherical
normal area of reference patch \(j\). On a nonstandard sphere,
\(E_{+,C}+\frac83\sum_j s_j>\frac83\omega\), with \(\omega=8\pi^2/3\).
The actual nondegenerate graph seams force a strict exterior comparison.
A sharper directional bound charges at most two reference saddles per
direction. For references in common vertical and horizontal coordinates
it charges only the two largest normal areas.

## Local count from a compact sublevel pair

In the E37 domain \(\Omega\subset\mathbb R^2\times\mathbb R^2\), set
\(q(z)=(|y|^2-|x|^2)/2\), \(D=\operatorname{diag}(-1,-1,1,1)\), and
\(F_{R,t}(z)=(Rz,Rtq(z))\) with \(R,t>0\). Use the Euclidean ambient
metric, orientation-compatible unit normals, \(d\nu=-dF\circ A\), and
the Hilbert–Schmidt norm of the Weyl curvature operator on the real chiral
bundles. Let \(N_t=\nu_{F_{R,t}}(\Omega^\circ)\) for the upward
normal. Its gnomonic coordinate \(p=u_h/u_5\) is \(-tDz\).
The unit sphere metric in this chart has three eigenvalues
\((1+|p|^2)^{-1}\) transverse to \(p\) and one
\((1+|p|^2)^{-2}\) in its direction. Its area density therefore gives
\[
 s_t:=\sigma_4(N_t)=t^4\int_\Omega(1+t^2|z|^2)^{-5/2}\,dz>0.
\]
The reference shape operator has signature \((2,2)\) everywhere, including
the boundary, by congruence with its graph Hessian. Its normal is injective,
and the indexed Gauss mass of the reference patch is exactly \(s_t\).
[E37 reference geometry](../notes/E37_GRAPH_HANDLE.md#quadratic-energy-and-matching-estimates)

Let \(G:\Omega\to\mathbb R^5\) be any smooth immersion agreeing with
\(F_{R,t}\) near the entire marked boundary. Fix \(u\in N_t\) with \(u,-u\)
regular for the Gauss map of \(G\) on the interior. The reference tilted
height on \(\mathbb R^4\) is \(h_0=c+bq(z-z_0)\), where \(b=Rt u_5>0\)
and its unique critical point \(z_0\) lies in \(\Omega^\circ\). Extend
\(h_G=\langle G,u\rangle\) to \(h\) by \(h_0\) outside \(\Omega\). This
extension is smooth by the germ agreement. Put
\((\xi,\eta)=z-z_0\), \(s=|\xi|^2+|\eta|^2\). Choose \(L>0\) larger than
the absolute deviations of both heights from \(c\) on \(\Omega\). Choose
\(r_0\) with \(\Omega\subset\{s<r_0^2\}\) and \(b r_0^2/2>L\).

Add to both heights a smooth radial function \(\psi(s)\) that vanishes on
\([0,r_0^2]\), with \(\psi'\) strictly increasing from zero to infinity for
\(s>r_0^2\). The resulting \(H=h+\psi\) and \(H_0=h_0+\psi\) are proper,
and their sublevel sets agree at \(c\pm L\). Any new exterior critical
point has \(\eta=0\) and \(\psi'(s)=b/2\), since the two block gradients
are \((-b+2\psi'(s))\xi\) and \((b+2\psi'(s))\eta\). Its value is at most
\(c-br_0^2/2<c-L\): the radial function \(-bs/2+\psi(s)\) decreases up to
that critical radius. The compact band \([c-L,c+L]\) of \(H\) therefore
contains precisely the critical points of \(h_G\) inside the patch. The
auxiliary critical locus below the band can be degenerate.

Both end sublevel sets, viewed as sets of \(H_0\), retract together under
\((\xi,\eta)\mapsto(\xi,(1-\tau)\eta)\). The height decreases along this
deformation. On \(\eta=0\), the function \(-b|\xi|^2/2+\psi(|\xi|^2)\)
decreases from zero to a minimum below \(-L\) before increasing to
infinity. Thus the upper retract is a disk and the lower one a concentric
annulus. The pair has relative \(H_2\cong\mathbb Z\). The compact regular
band and single-critical-level theorems apply to \(H\). One may separate
equal critical values by small bumps constant near their critical points.
Crossing an index-\(i\) critical point gives a relative cell in degree
\(i\). The long exact sequences for the successive triples then bound
the rank of the full relative \(H_2\) by the number of middle points.
This proves at least one in \(\Omega^\circ\). Milnor's theorem is used on
compact bands, with no assertion about the critical locus below the first
end. [Milnor, *Morse Theory*, Princeton, 1963, Theorems 3.1–3.2 and
Remark 3.3, §§3–5, checked in a reproduction on 25 November 2026](https://pagine.dm.unipi.it/~a019210/Milnor_Morse%20theory.pdf)

Sard's theorem removes a null set of directions. If \(n_{G,2}(v)\) denotes
the number of preimages of the single normal \(v\) on the middle-signature
locus of \(G\), then the height has \(n_{G,2}(u)+n_{G,2}(-u)\) middle
points. Integrate this count over \(N_t\). The sets \(N_t\) and \(-N_t\)
are disjoint, so the area formula gives
\[
 I_2(G;\Omega)=\int_{S^4}n_{G,2}(v)\,d\sigma_4(v)\ge s_t.
\]
The strict local E34 inequality on a nonempty open middle-signature locus
now gives \(E_\pm(G^*\delta;\Omega)>\frac83 s_t\). This proof uses heights
on the domain and applies to self-intersecting immersions. For any
direction off the seam normal images where both heights are Morse, the
explicit graph attains the smallest middle count among fillings of its
germ. Its count is one on \(N_t\cup(-N_t)\) and zero outside those sets.
[E34 operator comparison and strictness](E34_MIDDLE_WEYL_EQUALITY.md#sharp-pointwise-estimate-and-strict-integrated-estimate)

## What the boundary fixes

If a height has no critical point on the seam, the Brouwer degree of its
coordinate gradient relative to zero is determined by the boundary germ.
For the quadratic tilt the degree is \(+1\), since the derivative of the
reference gradient at its unique zero is \(bD\). The degree gives the
alternating sum \(m_0-m_1+m_2-m_3+m_4\). It yields an index-two point if
minima and maxima are excluded independently. The arbitrary fillings in
E37 do not impose that exclusion. Even the definite function
\(|z-z_0|^2\) has local gradient degree \(+1\); the coincidence of the
scalar degree illustrates the need for a degree-specific invariant.

The compact-pair argument supplies such an invariant. For any supplied
smooth auxiliary extension of a reference height outside a patch, choose
regular end levels \(a<b\) with compact band and with both heights on the
modified region strictly between them. Extend a filling by the same
exterior data. Let \(B_-,B_+\) be the fixed end sublevel sets, and let
\(m_{2,\mathrm{aux}}\) be the known count in the band outside the patch.
Then the filling has at least
\[
 \max\{0,\operatorname{rank} H_2(B_+,B_-;\mathbb Z)-m_{2,\mathrm{aux}}\}
\]
middle points, whenever the critical points in the band are nondegenerate.
The proof uses the same exact sequences of successive triples. A nondegenerate
quadratic of index \(i\) at infinity has the analogous compactification
after normalizing its positive and negative squares by a linear change
of coordinates. The pair is a disk and radial shell in the \(i\)-dimensional
negative plane (the lower set is empty for \(i=0\)), yielding one point of
index \(i\). More general germs need an extension with computable end
homology and exterior critical count.

## Exterior criterion with the actual seams

Let \(M\) be a closed connected oriented smooth homotopy four-sphere and
\(F:M\looparrowright\mathbb R^5\) a smooth immersion. Assume finitely many
pairwise disjoint closed embedded marked patches \(P_j\cong\Omega\). The
germ of \(F\) along each boundary agrees in its marking with a reference
graph \(F_{R_j,t_j}\), \(t_j>0\), allowing actual rigid motions of the
references. Let \(C=M\setminus\bigcup_j P_j^\circ\) and patch the interiors
with those reference graphs to obtain \(F^*\). The collar agreements give
a smooth immersion of the same \(M\), and \(F^*|_C=F|_C\). Here the exterior
energies and the exterior middle determinant mass \(I_{2,C}\) refer to
the common induced geometry. Each \(N_j\) is the one-sign normal image in
its actual ambient coordinates and \(s_j=\sigma_4(N_j)\).

Define the measurable profile \(k(u)=\sum_j\mathbf 1_{N_j\cup(-N_j)}(u)\).
Sard's theorem and the null measure of the seam normal images give, for
almost every \(u\), the exact count of the patched height as
\(m_{2,C}(u)+k(u)\). The possible intersections of the immersed images of
distinct pieces do not affect this domain count. Each Morse height on a
nonstandard sphere has at least two middle points by E34. Therefore
\[
 \begin{aligned}
 m_{2,C}(u)&\ge (2-k(u))_+,\\
 I_{2,C}&\ge D_C:=\frac12\int_{S^4}(2-k(u))_+\,d\sigma_4(u)\\
 &=\omega-\sum_j s_j+\frac12\int_{S^4}(k(u)-2)_+\,d\sigma_4(u).
 \end{aligned}
\]
The factor \(1/2\) is the two normal signs in the indexed area formula.
The final integral accounts for contributions beyond two reference
saddles in the same direction. In particular \(I_{2,C}+\sum_js_j\ge\omega\).
[E34 indexed area and Morse-count input](E34_MIDDLE_WEYL_EQUALITY.md#middle-morse-index-and-gauss-mass)

On any open exterior middle-signature set, E34 gives strict local defect
after integration, so \(E_{+,C}>\frac83I_{2,C}\). In the actual
germ-matched setting there is such a set for every nonempty patch family.
The reference signature is \((2,2)\) on the seam, and smoothness and
nondegeneracy give an open set on the exterior side. When the family is
empty, the nonstandard assumption itself gives an open middle-signature
set by \(I_{2,C}\ge\omega\). Consequently either of the following sufficient
exterior conditions recognizes the standard sphere, with arbitrary
original patch fillings and with no Yamabe sign assumption:
\[
 E_{+,C}\le\frac83D_C,
 \qquad\text{or, more coarsely,}\qquad
 E_{+,C}+\frac83\sum_j s_j\le\frac83\omega.
\]
For other references the profile calculation uses their indexed height
counts and the corresponding \(s_j\) are middle normal areas counted with
multiplicity. If the open exterior has no middle-signature points, its
middle mass is zero and one only gets the non-strict curvature comparison.
Equality in the coarse obstruction on a nonstandard source would then
require both \(E_{+,C}=0\) and \(k=2\) almost everywhere. Indeed \(k\ge2\)
almost everywhere by the directional bound, and its integral must be
exactly \(2\omega\) for equality. The actual graph germs exclude this case.

For E37 graphs in common ambient coordinates, the gnomonic description
and star-shapedness of \(\Omega\) give \(N_{t_1}\subset N_{t_2}\) whenever
\(t_1\le t_2\). A common ambient rotation preserves this nesting. Writing
\(s_{(1)},s_{(2)}\) for the two largest areas (zero for an absent patch),
\(\min(2,k)\) is the sum of the two largest antipodal-pair indicators and
\[
 D_C=\omega-s_{(1)}-s_{(2)}.
\]
Thus the stronger exterior recognition threshold depends on those two
areas, regardless of the number of patches sharing the same axis and
horizontal marking. With independently rotated patches, the integral
formula retains the actual coverage. These tests use the supplied exterior
and seam data. Existence of such an exterior with a qualifying energy is a
separate construction problem.

## Checked inputs

| Input | SHA-256 |
| --- | --- |
| [E37 graph handle note, working version](../notes/E37_GRAPH_HANDLE.md) | `008bea06b958d5cb6286a2fe3560546c44320c72c3a0e45f2516d6cae30b2785` |
| [E34 middle Weyl estimate at the frozen base](E34_MIDDLE_WEYL_EQUALITY.md) | `af154cb515a24a51c9d4fb2aa58a61325fc023cdde5897ec08ea6826f77ec3bc` |
| [Master immersion section at the frozen base](../manuscript/immersion_entry.tex) | `512ef85cfa696497da0b43e6efee36c4c60dd1f7d1eb78f4442b6d078a0b2c8e` |
