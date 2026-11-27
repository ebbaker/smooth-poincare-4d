# E71 · The first orbifold group's permutation quotients

27 November 2026, for Edward B. Baker III, with OpenAI assistance. Bounded independent E71 review, checkout `bc2c1bb`. Requested worker class Sol/ultra, actual serving model and effort unavailable. Inputs are [E39](../notes/E39_PRISM_FILLINGS.md) (`566185d2f1c515a7`), [E61](E61_MARKED_PATTERN.md) (`c3106dc6d7dd9c3d`), [E62](../notes/E62_FIGURE_EIGHT_LIFT.md) (`9c2a0e2235b8a591`) and [E68](../notes/E68_CROSSING_ALEXANDER.md) (`32db148ec2a35f1d`), with SHA-256 prefixes. The inputs fix the smooth oriented native slope-zero filling, with regular dual core \(U\) and the original weight-two knot \(S_0\subset S^3\). This review takes E68's determinant as input.

The actual group \(G_0=\pi_1^{\mathrm{orb}}(S^3,S_0;2)\) is \(S_3\), and \(\pi_1\Sigma_2(S_0)=C_3\). The marked E68 surgery diagram gives a finite central extension of \(S_4\) for the double cover branched over both components. This group surjects onto \(G_0\). The order-two old meridian and the free spherical action of its parity kernel force the quotient to collapse to \(S_3\). In particular \(S_0\) is a trefoil up to chirality. This group computation does not require identifying the equivariant quotient tangle.

## The double-link branched cover from the marked diagram

Let \(D=\Sigma_2(S_0\cup U)\) and \(Q=\pi_1(D)\). The E62–E68 parity character on the link exterior is odd on both components. The old branch is already filled in \(E'\), so \(D\) is the ordinary filling of \(E'\) along \(2a\). In E68's diagram let \(l_K\) denote the preferred longitude before the three Seifert fillings. It pairs with \(\mu\) as a longitude on that very same boundary torus. The positively oriented Hopf push-off is another longitude in the same direction, so \(2a=\lambda_{\mathrm H}-\mu=l_K+k\mu\) for an integer \(k\). In the primitive free abelianization of E68, the values of \(2a,l_K,\mu\) are \(-2,4,3\), respectively. Consequently \(k=-2\), and the relator for \(D\) is \(l_K\mu^{-2}\). This uses the ordinary smooth double-cover filling of the actual two-component link.

Let \(x_1,\dots,x_9\) be the E68 Wirtinger meridians and write \(b=x_1,u=x_3,v=x_5,w=x_7\). The longitude of \(K\) from the undercrossings is \(x_3^{-1}x_6x_7^{-1}x_7=x_3^{-1}x_6\), with the last positive meridian correcting its negative self-writhe. The diagram gives \(x_6=w^{-1}v w\), so the extra filling relation is \(u^{-1}w^{-1}v w^{-1}=1\). Thus \(v=wuw\) and \(x_6=uw^2\). The following reduction uses all the remaining Wirtinger and slope relations.

- The elimination words are \(x_8=u w u^{-1}\), \(x_4=x_8 u x_8^{-1}\), \(x_2=x_4^{-1}b x_4\), and \(x_9=x_6^{-1}x_8x_6=w\). The last equality follows from \(x_6=uw^2\) and satisfies the last self-crossing relation.
- Put \(g=uw\) and \(t=g^{-1}b\). The remaining relation on \(F_+\) is \(b^{-1}x_4b=u\). Since \(x_4=gug^{-1}\), it is \([t,u]=1\). The second relation on \(B\) gives \([b,x_4x_6]=1\). The remaining relation on \(F_-\) is \(x_6=bvb^{-1}\), and \(x_4x_6=buvb^{-1}=bg^2b^{-1}\), so the second relation on \(B\) is \([b,g^2]=1\). Conversely, given \([t,u]=1\) and \([b,g^2]=1\), the relation on \(F_-\) follows from \(bvb^{-1}=bu^{-1}g^2b^{-1}=gu^{-1}g=uw^2\). These two commutators therefore capture all the remaining Wirtinger relations.
- The three Seifert attachments in E68 are \(b^3(x_4x_6)^2\), \(u^3(x_8^{-1}b)^{-2}\), \(v^3(wb)^{-2}\). With \(b=gt\), the first is equivalent to \((gt)^3g^4=1\). The second uses \(x_8^{-1}b=ut\) and gives \(u=t^2\). For the third, \(v=u^{-1}g^2\) and \(wb=vt\), with \(v\) commuting with \(t\), because \([b,g^2]=1\). It gives \(v=t^2\), hence \(g^2=t^4\). Both commutators now follow from the equalities used to eliminate \(u,v,b,w\).

In particular the exact group is

\[
Q=\langle g,t\mid g^2=t^4,\ (gt)^3=t^{-8}\rangle .
\]

The common power \(h=g^2=t^4\) is central. The presentation modulo \(h\) is the rotation group of the spherical \((2,4,3)\) triangle tiling, namely \(S_4\), with \(g\) a transposition, \(t\) a four-cycle and \(gt\) a three-cycle. In the abelianization the relator matrix rows are \((2,-4),(3,11)\), of determinant 34. Thus \(Q^{\mathrm{ab}}\) is finite. If \(\langle h\rangle\) were infinite cyclic, the rational first homology of this subgroup would be one-dimensional with trivial action of \(S_4\), because \(h\) is central. Transfer for this finite-index subgroup would give nonzero rational first homology of \(Q\), a contradiction. Hence \(Q\) is finite.

To map to the native group, take the orbifold group of \((S^3,S_0\cup U;2,2)\). It contains \(Q\) as the index-two kernel of the character sending both meridians to 1. Killing the meridian \(a\) of \(U\) gives \(G_0\). The restriction \(Q\to G_0\) is surjective because any representative of odd character can first be multiplied by \(a\), which is killed in \(G_0\) and has odd character. This comparison allows us to use the double-link cover to bound the native group without identifying it with the single-knot cover.

## The parity and threefold covers

Let \(Y=\Sigma_2(S_0)\), \(H=\pi_1(Y)\), and \(N=[H,H]\). Meridian parity gives the extension \(1\to H\to G_0\to C_2\to1\), split by the weight-two meridian. The knot meridian generates \(G_0^{\mathrm{ab}}=C_2\), so \(H=[G_0,G_0]\). By E68, \(H/N=C_3\). The meridian acts by inversion on \(H/N\), since the trivial action would make \(G_0/N\cong C_3\times C_2\), contradicting \(G_0^{\mathrm{ab}}=C_2\). Thus

\[
G_0/N\cong C_3\rtimes_{-1} C_2\cong S_3.
\]

This is the metabelian quotient of \(G_0\). The connected cyclic threefold cover \(\widehat Y\to Y\) from \(H\to H^{\mathrm{ab}}\) has \(\pi_1(\widehat Y)=N\).

Let \(Z\leq G_0\) be the image of \(\langle h\rangle\) under \(Q\to G_0\). It is central and contained in \(H\) since \(h=g^2\). The canonical map \(G_0\to S_3\) kills \(Z\) because \(S_3\) has trivial center. It follows that \(G_0/Z\) lies between \(S_4\) and \(S_3\) as a quotient. The kernel of a surjection \(S_4\to S_3\) is the normal Klein four group, whose only subgroups invariant under conjugation by all of \(S_4\) are itself and the identity. Thus \(G_0/Z\) is either \(S_3\) or \(S_4\).

Suppose \(G_0/Z=S_4\). Meridian parity becomes the sign character of \(S_4\), so the order-two old meridian projects to a transposition. Every element of \(Q\) above a transposition is conjugate to \(g h^k\) for some integer \(k\), since transpositions are conjugate and the kernel of \(Q\to S_4\) is \(\langle h\rangle\). Its square is \(h^{2k+1}\). The old meridian has an antecedent in \(Q\), so its order forces the order of \(Z\) to divide an odd integer. Now \(H/Z=A_4\). The preimage in \(H\) of the Klein four subgroup of \(A_4\) has order \(4|Z|\), and its Sylow two-subgroup maps isomorphically onto the Klein four. This is impossible: \(H\) is the finite fundamental group of the closed orientable three-manifold \(Y\), so it acts freely and orientation-preservingly on the round three-sphere by elliptization. A nontrivial linear involution acting freely on that sphere must be \(-I\). In particular a Klein four subgroup cannot act freely.

Therefore \(G_0/Z=S_3\) and \(H/Z=C_3\). A group with a cyclic quotient by a central subgroup is abelian, so \(H=H^{\mathrm{ab}}=C_3\). This proves \(G_0=S_3\) and \(\widehat Y\cong S^3\).

There is a symmetric-link recognition consequence if \(N=1\). Then \(H=C_3\), so \(Y\) is elliptic by three-dimensional geometrization. Its universal cover is \(S^3\), and the full group of lifts of its smooth branched involution is \(G_0\cong S_3\), acting smoothly and orientation-preservingly on \(S^3\). Theorem E conjugates this action to an isometric one. The normal \(C_3\) acts freely, so it has no fixed vector in the ambient real four-dimensional orthogonal representation. The representation therefore consists of two copies of the real two-dimensional irreducible representation of \(S_3\), since the trivial and sign representations both restrict trivially to \(C_3\). [Dinkelbach and Leeb, *Equivariant Ricci flow with surgery and applications to finite group actions on geometric 3–manifolds*, Theorem E](https://msp.org/gt/2009/13-2/gt-v13-n2-p15-p.pdf)

This real representation is the complexification of the standard permutation plane, modeled by permuting the three complex coordinates with \(z_1+z_2+z_3=0\). The quotient coordinates \(p,q\) are the coefficients of the monic cubic with roots \(z_1,z_2,z_3\). The branch locus is its repeated-root set \(4p^3+27q^2=0\). Positive scaling of the roots induces \((p,q)\mapsto(r^2p,r^3q)\), and each nonzero scaling orbit meets an ordinary sphere in the coefficient space once. Thus on the quotient sphere the branch is the link of this cusp. Its parametrization \((p,q)=(-3s^2,2s^3)\) gives a \((2,3)\) torus knot, with either chirality allowed under the conjugacy. Conversely, this model realizes a trefoil with exactly this \(S_3\) orbifold group. Consequently the first-group question is equivalent to recognition of the actual \(S_0\) as a trefoil.

## An exact finite obstruction

Put \(W=H_1(\widehat Y;\mathbb F_2)\). Conjugation induces an \(S_3\)-action on \(W\). The coinvariants \(W_{C_3}\) vanish, since for the extension \(N\subset H\) the homology five-term sequence over \(\mathbb F_2\) gives \(W_{C_3}\cong H_1(H;\mathbb F_2)=0\). Here the positive-degree homology of \(C_3\) vanishes because 3 is invertible in \(\mathbb F_2\). It follows that \(W\) is an \(\mathbb F_4\)-space on which a generator of \(C_3\) acts by multiplication by a primitive cube root \(\omega\). The meridian acts by a semilinear involution \(j\) with \(j(\omega w)=\omega^2j(w)\). Every \(w\) has a unique expression \(x+\omega y\) with \(j(x)=x\), \(j(y)=y\). Take \(y=w+j(w)\) and \(x=w+\omega y\), and use \(\omega+\omega^2=1\) for existence and uniqueness. If \(W\ne0\), a nonzero linear functional on this fixed \(\mathbb F_2\)-space extends to an \(S_3\)-equivariant surjection \(W\to\mathbb F_4\).

Let \(K\lhd G_0\) be the kernel of the resulting map \(N\to\mathbb F_4\). Its additive quotient is the Klein four group \(V_4\), with the natural faithful permutation action of \(S_3\) on the three nonzero elements. In \(G_0/K\), the preimage of \(C_3\) has order 12 and is \(A_4=V_4\rtimes C_3\). The extension over \(C_3\) splits by taking an element of order 3. Conjugation on this normal \(A_4\) embeds \(G_0/K\) into \(\operatorname{Aut}(A_4)\). Indeed, the centralizer of \(A_4\) maps to the centralizer \(C_3\) of \(C_3\) in \(S_3\), hence lies in \(A_4\) and is trivial. The automorphism group is \(S_4\): an automorphism permutes the four subgroups of order 3, this action is faithful by the faithful conjugation action of \(A_4\) on the same four subgroups, and conjugation in \(S_4\) supplies all 24 automorphisms. The orders now give \(G_0/K\cong S_4\). Conversely, a surjection \(G_0\to S_4\) maps \(H=[G_0,G_0]\) onto \(A_4\) and \(N=[H,H]\) onto \(V_4\), so \(W\ne0\).

For the actual native filling the preceding group calculation gives \(W=0\). The exterior characters exhibit the distinction. In the double-link exterior of E48, the original sign character underlying E62 sends \((a,\mu,\sigma)\) to \((1,0,1)\), with \(\sigma\) the old meridian. The character for \(Y\) sends them to \((0,1,1)\). The first takes the value 1 on the filling meridian \(a\), so its filling branches along \(U\) as well. Its filled cover has group \(Q\), which does admit \(S_4\). The second kills \(a\) and extends over the regular filling. The computation of \(Q\) alone must therefore be followed by the order-two meridian and free-action argument above.

## The actual strong inversion and mirror ordering

Write \(n=(i+j+k)/\sqrt3\), \(A=(i-j)/\sqrt2\) and choose E62's \(p_0\) so \(p_0ip_0^{-1}=A\), \(p_0jp_0^{-1}=n\). The map

\[
\iota(q)=Aq i^{-1}
\]

normalizes the actual group \(T^*\times_{\{\pm1\}}Q_{68}\). Left conjugation by \(A\) exchanges \(i\) with \(-j\), takes \(k\) to \(-k\), and sends \(n\) to \(-n\), hence preserves \(Q_8\) and takes \(b\) to \(b^{-1}\). Right conjugation by \(i\) fixes \(z\) and takes \(j\) to \(-j\). Both squares are \(-1\), so the induced map is an orientation-preserving involution. For the tube \(q=p_0(\cos r\,e^{jx}+\sin r\,e^{j\theta}i)\) it takes \((x,\theta)\) to \((-x,-\theta)\), since \(A p_0=p_0 i\). This negates both peripheral generators and extends across each ordinary marked filling by simultaneous complex conjugation of the disk and circle coordinates. In particular the regular dual unknot \(U\) is strongly inverted. The orientation on each lifted old fixed circle specified by \(q'=qu\), with \(u\in\{z^rjz^{-r}:r\in\mathbb Z/17\}\), descends to the single old knot. That set is invariant under right deck conjugation and disjoint from its negatives. Conjugation by \(i\) sends \(u\) to \(-u\), so the involution reverses the old knot as well.

For the local mirror, use E61's \(q_0(t,y)=e^{kt/2}e^{-jy/2}\) and phase \(\phi\) of period \(P=\pi/17\). Compose the representative of \(\iota\) with the deck element \((1,j)\), to obtain \((A,-k)\). Since \(e^{-k\pi/4}A=-j\), its action in the chart is

\[
(t,y,\phi)\longmapsto(\pi/2-t,\ y,\ \pi/2-\phi)\pmod P.
\]

Accordingly in \(W_{\rm loc}=\cosh(y+2\pi i(\phi-\pi/4)/P)\) it is \((t,W_{\rm loc})\mapsto(\pi/2-t,\overline{W_{\rm loc}})\). The involution's local fixed axis is therefore the real \(W_{\rm loc}\)-axis at \(t=\pi/4\). The two fixed points on the old branch occur at \(W_{\rm loc}=\pm1\), on opposite sides of the actual contact \(0<W_{\rm loc}<1\) with the original surgery curve. The choice of the underlying smooth quotient charts is equivariant here: in the transverse square coordinate at either branch endpoint a reflection lifts to a reflection and descends by conjugation.

After the first filling \(M_0=S^3\), the smooth involution is conjugate to a half-turn about an unknotted circle, by Dinkelbach–Leeb's theorem cited above. Its quotient is \(S^3\), and both \(U\) and \(S_0\) project to embedded arcs with their endpoints on the fixed circle. The computed ordering is in the original mirror chart. The arcs outside that chart and the boundary pairing for the first replacement were unnecessary for the group calculation and remain untracked in this tangle description.
