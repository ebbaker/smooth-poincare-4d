# WIN-E29 B · Independent reading of round stability and the harmonic estimate

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [replay request, revision 1](../research-progress/handoffs/REQUEST_B08_INPUT_REPLAYS_R1.md)
specifies GPT-6.2 Sol / ultra. Actual serving model and effort are unavailable.
Baseline checkout is 86b24d9f9c2d. At intake, the SHA-256 values of
[E23](../notes/E23_ROUND_STABILITY.md) and [E24](../notes/E24_ROUND_HARMONICS.md)
were respectively
`f167ca6e03583c82bdb73cb53ae64a02cd87bf18b47aad250d0cc864b899ce9e` and
`f3d95399b300ffb4d207e5a308fcea91be1951cee1112ede311877b6136f5070`.
Independent project replay of the two inputs. The primary theorem was read
and checked for applicability, with its proof inspected at the relevant
normalization and compactness steps.

## E23 · The theorem and its frozen-metric substitution

Guerra–Lamy–Zemas take \(n=5\) for the unit round domain and target \(S^4\).
For \(f\in W^{1,4}(S^4;S^4)\) of degree \(+1\), their Theorem 1.1 bounds
\(\inf_{\phi\in\mathrm{Möb}_+}\int|df-d\phi|^4\,d\nu\) by
\(C_5\delta_q(f)\), where \(d\nu=dV_q/(8\pi^2/3)\) and
\(\delta_q(f)=\int|df|_q^4\,d\nu/16-1\). The derivative difference is between
extrinsic \(\mathbb R^5\)-valued maps on the same round domain.
Remark 1.3 gives the sign \(-1\) statement with the same \(C_5\) by a target
reflection, which preserves the Hilbert–Schmidt norm of that difference.
Section 2.2 includes all rotations and all stereographic dilations about
arbitrary poles in the appropriate sign class. Lemma 2.5 obtains the round
mean zero condition by domain precomposition with a Möbius map. For such a
precomposition \(\psi\), the physical mean uses \(\psi_*dV_g\) in place of
\(dV_g\). The numerical value of \(C_5\) is unspecified. Section 3, Step 3
uses subsequential compactness to enter the local regime, with no numerical
threshold supplied there. [Primary arXiv v1 PDF, (1.3)–(1.5), Remark 1.3, (2.10), Lemma 2.5, and §3 Steps 1 and 3](https://arxiv.org/pdf/2305.19886v1)

For the frozen metric set \(p=\epsilon\chi(s)(y^1)^2\), \(\tau=a^6\).
The auxiliary metric has relative eigenvalues \(1,1+p,1-p,1\).
At the round identity the factor multiplying \(d\nu\) in \(\delta_\gamma+1\)
is \(\sqrt{1-p^2}[\operatorname{tr}((q^{-1}\gamma)^{-1})/4]^2
=(1-p^2/2)^2/(1-p^2)^{3/2}\).
As a function of \(z=p^2\), its derivative
\((4-z^2)/(8(1-z)^{5/2})\) lies in \([1/2,1]\) for \(0\le z\le1/16\).
Integration of \((y^1)^4\) over the Euclidean ball of radius \(r\) gives
\(\pi^2r^8/32\), using the angular fourth moment \(1/8\).
The inner core \(s\le a/2\) with cutoff one and the full cap \(s\le a\)
then give
\[
    3\cdot2^{-17}a^{16}\le\delta_\gamma(\mathrm{id})
                              \le(3/16)a^{16}.
\]
The round identity itself has \(\delta_q=0\).

The four odd coordinates maintain zero physical moment under radial
dilation \(y\mapsto\lambda y\). The radial background measure is inversion
invariant, so the fifth identity moment comes entirely from the determinant
loss in the inner cap, where \(x^5=(1-s^2)/(1+s^2)>0\).
For \(\lambda=e^{-u}\) and normalized physical measure the moment \(M(u)\)
obeys \(-16a^{16}/15\le M(0)<0\), since the annulus
\(1/2\le s\le1\) has physical volume at least \(15\pi^2/512\).
For \(0\le u\le\log 2\) the pointwise derivative of the fifth coordinate
is at least \(1/16\) on that annulus. With \(\operatorname{Vol}(g)\le V_0\)
this gives \(M'(u)\ge45/65536\). Since \(2^{11}|M(0)|<\log 2\), this
moment crosses zero by \(u=2^{11}|M(0)|\). The conformal factor of the
round dilation is \(L_\lambda=\lambda(1+s^2)/(1+\lambda^2s^2)\), and its
fourth power integrates to one in the round probability measure. Inserting
this factor into the identity defect density and using
\(1/2\le L_\lambda\le2\) gives the stated bounds
\(3\cdot2^{-21}a^{16}\le\delta_\gamma(\phi_\lambda)\le3a^{16}\).
The round deficit is zero for this same map. A target reflection,
[degree-appropriate pencil realization](../notes/E13_SPINOR_PENCIL.md),
and [common normalization](../notes/CENTERED_EXTREMA.md) preserve these
deficit conclusions and the center. Letting \(\lambda\) decrease to zero
also gives the uncentered infimum of \(\delta_\gamma\) equal to zero,
since \(L_\lambda\) tends uniformly to zero on the defect support and the
limiting fifth physical moment is \(1\).

The round-to-auxiliary comparison in E23 also checks out. With
\(B=(df)^*df\), \(S=\operatorname{tr}B/4\) and \(F_q=S^2-\deg(f)J_q\),
each pairing of the four nonnegative eigenvalues of \(B\) gives an
arithmetic mean at least \(\sqrt{\det B}\). Averaging the three pairings
gives \(|B-SI|^2\le12F_q\). In the expansion using
\(D=(q^{-1}\gamma)^{-1}-I\), the scalar correction
\(c=\operatorname{tr}D/4\) is at most \(1/30\), and
\(|D:(B-SI)|/4\le\sqrt3|p|\sqrt{F_q}\). Hence the mixed term loses at
most \(4|p|S\sqrt{F_q}\). Subtracting the same signed Jacobian density
in both metrics and completing a square gives the loss
\(8p^2S^2\) with the surviving term \(F_q/2\).
For the physical density \(dV_g=(w_0/16)dV_q\), the radial factor
satisfies \(1\le 2\rho/\Omega\le1+4a^2\) on the two caps and equals
one outside. The determinant factor lies in \([\sqrt{1-\tau^2},1]\).
It follows that \(|w_0-1|\le32a^2\) on the caps. Their joint
round probability is at most \(2\cdot3(2a)^4=96a^4\) by round
inversion and \(\Omega\le2\). Since the physical center is zero,
\(|\int f\,d\nu|=|\int f(1-w_0)d\nu|\le3072a^6\).
Round Poincaré then gives
\(\int_{\{s\le a\}}S^2\,d\nu\le2(4a^4+\delta_q)\).
Using \(32\tau^2\le1/2\) to absorb the resulting \(\delta_q\) term gives
\(\delta_q\le4\delta_\gamma+256a^{16}\).
This bound applies to smooth maps of either unit degree with physical
centering. For a pencil, \(H^2=16V_0(1+\delta_\gamma)\) in the
[determinant estimate](../notes/BALANCED_SPECTRAL_BOUND.md), giving
\(\delta_\gamma\le102\sqrt{1+\delta_\gamma}\sqrt R/\sqrt{V_0}\)
after normalization. Substitution into Theorem 1.1 has an error
independent of \(R\) and a dimension constant without a supplied
numerical value. A centered Möbius trial map achieves zero round
deficit while its auxiliary deficit is positive. E23 correctly
concludes that this substitution gives no positive numerical lower
bound for \(b(g)\).

## E24 · The explicit round probability estimate

The independent reconstruction uses the decomposition
\(f=m+Ax+v\) into constants, coordinate harmonics and their orthogonal
complement in \(L^2(d\nu)\). Harmonic homogeneous polynomials of degree
\(k\) restrict to eigenfunctions with eigenvalue \(k(k+3)\) by the polar
formula for the Laplacian in \(\mathbb R^5\). The polynomial
decomposition into harmonics and multiples of \(|x|^2\) follows by
adjointness of \(\Delta_{\mathbb R^5}\) and multiplication by \(|x|^2\)
in the factorial-weighted monomial inner product. Polynomial density
then justifies using \(4\) on the coordinate span and \(10\) on the
complement. The corresponding normalization is also given in
[Guerra–Lamy–Zemas v1, §2.1, (2.1)–(2.8)](https://arxiv.org/pdf/2305.19886v1#page=5).

Let \(e\) be the upper excess in \(\int|df|^4\,d\nu\le16+e\). Unit
absolute degree gives \(e\ge0\) by signed Jacobian integration and the
arithmetic–geometric mean. The probability measure and the square-root
tangent bound give \(\|df\|_2^2\le4+e/8\). By Dirichlet orthogonality
and \(|f|=1\), with \(\delta=e/8+4|m|^2\) one obtains
\[
 \|dv\|_2^2-4\|v\|_2^2\le\delta,\qquad
 \|v\|_2^2\le\delta/6,\qquad \|dv\|_2^2\le5\delta/3 .
\]
For \(B=A^{\mathsf T}A-I\), the round moment calculation yields
\(\int(x^{\mathsf T}Bx)^2d\nu=
 (2\|B\|_F^2+(\operatorname{tr}B)^2)/35\). The denominator comes from
\(\int x_i^2 x_j^2d\nu=1/35\) for distinct \(i,j\) and
\(\int x_i^4d\nu=3/35\). Also \(\|A\|_F^2\le5\), so
\((|Ax|+|f|)^2<16\) and \(\|B\|_F^2\le280(|m|^2+\delta/6)\).
The singular value choice of \(O\in O(5)\) works even at singular \(A\)
because \((s-1)^2\le(s^2-1)^2\) for every \(s\ge0\).
The factor from differentiating \((A-O)x\) is \(4/5\) in probability
measure. Summing with the complement gives exactly
\[
 E=\|df-d(Ox)\|_2^2
 \le39\delta+224|m|^2=(39/8)e+380|m|^2.
\]
The proof has no determinant-sign restriction on \(O\) and needs no
smallness of \(e+|m|^2\) for this bound.

For the weighted version with \(w\ge0\), \(\int w\,d\nu=1\),
\(\int fw\,d\nu=0\), put \(d=\|w-1\|_2\) and
\(M=|\int xw\,d\nu|\). Subtracting \(Ox\) inside
\(m=-\int f(w-1)\,d\nu\) gives \(|m|\le M+d\|f-Ox\|_2\).
Round Poincaré gives \(\|f-Ox\|_2^2\le |m|^2+E/4\), which in turn
gives \((1-192d^2)|m|^2\le2M^2+(39/16)d^2e\).
For \(d^2\le1/384\) this yields the stated
\(|m|^2\le4M^2+(39/8)d^2e\) and \(E\le10e+1520M^2\).
When using the physical center, \(w=(dV_g/d\nu)/\operatorname{Vol}(g)\)
and both \(d\) and \(M\) pertain to that density. All derivative norms
and spectral comparisons in E24 pertain to \(q\).
