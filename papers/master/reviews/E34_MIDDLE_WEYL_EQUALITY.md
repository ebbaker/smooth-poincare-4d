# E34 · Index-two Weyl estimate and equality

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E check under B02/B05. GPT-6.2 Sol/ultra requested. Actual serving model and reasoning effort were unavailable. [Frozen request](../research-progress/handoffs/E34_MIDDLE_WEYL_EQUALITY.md), revision 1. Checked HEAD `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`, master main TeX SHA-256 prefix `c8a9f68da492`, and [E29](../notes/E29_GAUSS_DEFICIT.md) SHA-256 `f00929b135fd96604c5870029a02c6b94ef761e42cff48496ef4ab55cb111140`. The topology uses the setting of [E26](E26_FOUR_CRITICAL_HEIGHTS.md) and the explicit handle reduction below.

**Checked result.** Let \(F:M\looparrowright\mathbb R^5\) be a smooth immersion of a smooth closed oriented homotopy four-sphere and \(g=F^*g_{\mathrm{Euc}}\). Either \(M\) is diffeomorphic to the standard \(S^4\), or \(E_+(g)=E_-(g)>64\pi^2/9\). Consequently an inclusive bound \(E_+(g)\le64\pi^2/9\) is a direct recognition criterion, as is \(\|A^\circ\|_{L^4(g)}^2\le(16\sqrt2/3)\pi\). The energy criterion requires neither a sign of the Yamabe constant nor a critical or minimizing conformal class. All extrinsic integrals are over the actual immersed domain with \(dV_g\), counting distinct preimages separately. The Weyl norms are Hilbert–Schmidt norms of the real chiral curvature operators.

## Middle Morse index and Gauss mass

For a Morse function on \(M\), rearrange the handles by index without changing their counts. The union of all 0- and 1-handles is connected because every subsequent attaching region is connected and cannot join two components. Form the graph of the 0-handles and 1-handle attachments. The 1-handles for its spanning tree may be taken first in their index block, since their feet in the original 0-handle boundaries are disjoint from the other feet. The thickening of the tree is a standard \(D^4\), by successive leaf cancellations of a 0-handle with the edge joining it to the remainder. Transport all remaining attaching maps across this identification. The same argument for the dual 0- and 1-handles, above the index-two block, gives one 4-handle. Both replacements identify the actual lower or upper domain, with attachments transported on its boundary. Thus this reduces to one 0-handle and one 4-handle without changing the number \(m_2\) of index-two handles. For a proof of the handle rearrangement and cancellation steps, and a published one-2-handle topology check, see the named passages. [Milnor, *Lectures on the h-Cobordism Theorem*, Theorems 4.7–4.8 and 5.4](https://www.jstor.org/stable/jj.28248897) · [Scharlemann, *Generalized Property R and the Schoenflies Conjecture*, Corollary 2.2 and maximal-tree argument, pp. 422–423](https://ems.press/content/serial-article-files/43163?nt=1)

With this normalization \(\chi(M)=2\) gives \(m_1+m_3=m_2\). If \(m_2=0\), \(M\) is the double of two actual standard disks. The boundary diffeomorphism is isotopic to the restriction of an orthogonal map by the \(\pi_0\) consequence of Hatcher's theorem, so it extends over a disk. If \(m_2=1\), reverse the handle order if necessary to have one 2-handle and one 3-handle, with no 1-handles. Cutting between them gives a knot surgery trace on \(D^4\) and a dual one-1-handle body \(S^1\times D^3\). The cut is \(S^1\times S^2\), so its first homology forces the surgery framing to be zero. Property R then makes the attaching knot an unknot. The trace is \(S^2\times D^2\), and the original boundary diffeomorphism is covered by Laudenbach–Poénaru's Theorem A for one summand. This proves standardness in both cases in the smooth category. Therefore a hypothetical nonstandard type has **at least two index-two critical points for every Morse function**, in particular for every Morse height. [Hatcher, *A Proof of the Smale Conjecture*, pp. 553–554](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf) · [Gabai, *Foliations and the topology of 3-manifolds III*, Corollaries 8.3 and 8.6 and Remark 8.5, via the E26 receipt](E26_FOUR_CRITICAL_HEIGHTS.md#all-index-distributions-and-the-actual-gluing) · [Laudenbach–Poénaru, Theorem A](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

Choose the oriented unit normal \(\nu\) and the shape convention \(d\nu(X)=-dF(AX)\), so the signed normal Jacobian is \(\det A\) in dimension four. Set \(\omega=|S^4|=8\pi^2/3\) and \(\Omega_2=\{x:A_x\text{ has two positive and two negative eigenvalues}\}\). Let \(I_2=\int_{\Omega_2}\det A\,dV_g\). For \(u\) with both \(u,-u\) regular values of \(\nu\), the height \(\langle F,u\rangle\) is Morse. Its critical preimages are \(\nu^{-1}(\{u,-u\})\), and at those preimages its Hessian is respectively \(g(A\cdot,\cdot)\) or its negative. The index is two in either case exactly on \(\Omega_2\). Thus Sard's theorem and the area formula give

\[
 \frac1\omega\int_{S^4} m_2(u)\,d\sigma(u)
 =\frac1\omega\int_{S^4}\sum_{x\in\Omega_2\cap\nu^{-1}(\{u,-u\})}1\,d\sigma(u)
 =\frac{2I_2}{\omega}.
\]

The signed Jacobian is positive on this locus. In particular \(I_2\ge\omega\) on a nonstandard source and \(\Omega_2\) is a nonempty open subset of its smooth domain. For another normalization check, the same argument over the odd-index locus gives averaged \(m_1(u)+m_3(u)=2J/\omega\) with \(J=\int_M(-\det A)_+\,dV_g\). The Euler equation for each height gives \(m_1(u)+m_3(u)=m_2(u)+m_0(u)+m_4(u)-2\ge m_2(u)\), so \(J\ge I_2\). This proves the needed \(J\ge\omega\) also from the middle count. [Chern–Lashof, original total-curvature publication](https://doi.org/10.2307/2372684) · [Owning all-index average](E26_FOUR_CRITICAL_HEIGHTS.md#exact-height-count)

## Sharp pointwise estimate and strict integrated estimate

At a point of \(\Omega_2\), permute the principal data as \((-a,-b,c,d)\) with \(a,b,c,d>0\). Set \(P=abcd=\det A\). The Euclidean Gauss curvature operator is diagonal on the frame two-forms with sectional entries \(k_i k_j\). The opposite-pair sums are

\[
 s_1=ab+cd,\qquad s_2=-ac-bd,\qquad s_3=-ad-bc .
\]

In each chiral block the three Weyl eigenvalues are \((s_j-\bar s)/2\), since \(\bar s=R/6\) and the scalar part in the curvature operator is \(R/12\). Thus \(|W^\pm|^2=\tfrac1{12}[(s_1-s_2)^2+(s_1-s_3)^2+(s_2-s_3)^2]\). By AM–GM, \(s_1\ge2\sqrt P\), \(s_2\le-2\sqrt P\), and \(s_3\le-2\sqrt P\). Both first differences are at least \(4\sqrt P\), giving

\[
 |W^\pm|^2\ge\frac{8}{3}P\qquad\text{on }\Omega_2.
\]

Equality forces equality in each of the three AM–GM comparisons. Thus \(ab=cd\), \(ac=bd\), \(ad=bc\), so \(a=b=c=d\) by positivity. Conversely the principal data \((-a,-a,a,a)\) have Weyl eigenvalues \((4a^2/3,-2a^2/3,-2a^2/3)\), yielding equality. These data occur at the origin of a local Euclidean graph with zero gradient and the corresponding quadratic Hessian. A strict pointwise replacement of the constant is impossible. [Owning principal-curvature formula](../notes/E23_IMMERSION_ENTRY.md#curvatures-on-the-domain)

Suppose that equality persisted throughout a nonempty open subset \(U\subset\Omega_2\). There \(a=|A|/2>0\) is smooth and \(A\) has smooth rank-two eigenbundles \(\mathcal E_\pm\), with projections \((I\pm A/a)/2\). The Euclidean Codazzi identity \((\nabla_XA)Y=(\nabla_YA)X\) follows by taking the normal component of the flat ambient connection commutator acting on \(dF(Z)\). For a unit local vector \(X\) in either eigenbundle choose a smooth local unit \(Y\) in the same eigenbundle with \(X\perp Y\). Writing its eigenvalue as \(\lambda=\pm a\),

\[
 X(\lambda)=\langle(\nabla_XA)Y,Y\rangle
 =\langle(\nabla_YA)X,Y\rangle=0,
\]

because \(\langle X,Y\rangle=0\) and \(\lambda I-A\) is self-adjoint and annihilates \(Y\). This holds along both eigenbundles, so \(da=0\). With \(X\in\mathcal E_+\), \(Y\in\mathcal E_-\), Codazzi now reads

\[
 -2a(\nabla_XY)_+=2a(\nabla_YX)_- .
\]

The two sides lie in orthogonal bundles and vanish separately. Metric compatibility then preserves each eigenbundle along sections from its own bundle as well. Both eigenbundles are parallel on \(U\), so for an orthonormal mixed pair \(X,Y\) one has \(R(X,Y)Y\in\mathcal E_-\) and zero sectional curvature. The Euclidean Gauss equation gives the same curvature as \(-a^2<0\). This contradiction shows that the nonnegative continuous pointwise defect is positive somewhere, and hence on a positive-volume open set, whenever \(\Omega_2\ne\varnothing\). Consequently any such immersion satisfies the strict integrated inequality

\[
 E_+(g)=E_-(g)>\frac83 I_2.
\]

On the nonstandard hypothesis, \(E_+(g)>(8/3)I_2\ge(8/3)\omega=64\pi^2/9\). This proves the inclusive recognition result. The argument proves strictness for each supplied immersion without a uniform positive size for the integrated defect.

## Shape norm endpoint and applicable metrics

Write \(B=\|A^\circ\|_4^2\) for the supplied immersion. The audited E29 inequality gives \(E_+(g)\le B^2/6-(8/9)J\), with the same measure and tensor norms. If \(M\) is nonstandard then \(J\ge I_2\ge\omega\). At \(B\le(16\sqrt2/3)\pi\) the upper bound is at most

\[
 \frac{256}{27}\pi^2-\frac{64}{27}\pi^2=\frac{64}{9}\pi^2 ,
\]

which contradicts the strict middle-index lower bound. More generally the measured upper bound \(B^2/6-(8/9)J\le64\pi^2/9\) suffices. The use of \(16\sqrt2\pi/3\) as the shape threshold takes its numerical value from E29. The positive Yamabe result at that value is unnecessary for this recognition proof. [E29 integrated deficit](../notes/E29_GAUSS_DEFICIT.md#integrated-thresholds)

The energy criterion applies to every smooth metric in the conformal class of an induced Euclidean immersion metric. For \(g'=f^2g\) the Hodge splitting on two-forms is unchanged, the Weyl operator scales by \(f^{-2}\), and the squared operator norm times the volume is unchanged. The criterion also applies after a diffeomorphic reparametrization. For example, a smooth immersion into the round \(S^5\) misses a point by Sard's theorem. Stereographic projection from that point gives a global Euclidean immersion whose induced metric is conformal to the original round-ambient induced metric. The same conformal argument covers immersions into an ambient Riemannian space with a conformal Euclidean chart containing the whole immersed image, such as the ball model of \(\mathbb H^5\). The extrinsic quantities \(I_2,J,B\) refer to the Euclidean immersion. This change of ambient chart matters for the Codazzi contradiction. The spherical mixed Gauss curvature is \(1-a^2\), zero at \(a=1\), as on the equal-radius product \(S^2\times S^2\subset S^5\).

For an arbitrary smooth metric on a homotopy four-sphere, the existence of a conformal Euclidean hypersurface immersion inducing its class is a separate condition. Universal smooth immersion existence does not ensure that condition for a prescribed metric or the quantitative bound for one of its induced metrics. The inclusive bound here concerns one actual induced conformal class. The strict bound for each immersion also does not by itself exclude a sequence of distinct induced metrics whose energies converge to the recognition threshold from above.
