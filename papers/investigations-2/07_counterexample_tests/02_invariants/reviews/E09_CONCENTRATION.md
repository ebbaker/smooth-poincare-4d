# WIN-E09 B · Independent replay of pencil concentration

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual model identifier and reasoning effort were
unavailable to the reader. I did not author the concentration proof. This
replays the estimate and the exact quaternionic normalization in
[reading B of request revision 1](../research-progress/handoffs/REQUEST_REPLAY_PENCIL_R1.md)
at checkout `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`. The zero-attainment
classification uses the separate rigidity implication assigned to reading A.

| Frozen input | SHA-256 |
| --- | --- |
| [Concentration proof revision 1](../notes/PENCIL_CONCENTRATION.md) | `d6b5cfef1bddefa9a6d685f716639e22169fb9df6023b6fa26ac016af02d59b4` |
| [First-series DIR-E06](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md) | `6fde85f36d0ab14db70293e5023d6372d1cb9174f0340fe87a4da4fc6940e136` |
| [Rigidity proof revision 1, definition of \(R\)](../notes/PENCIL_RIGIDITY.md#a-first-jet-on-the-incidence-graph) | `91df5d33802e285f9eb212296e512e150fa12be18fa1d22c6117cf163ca2503f` |
| [Request revision 1](../research-progress/handoffs/REQUEST_REPLAY_PENCIL_R1.md) | `384921082609474b59361ac5d3693389cf4432a54a71d6bba137c15a7fa9b8b7` |

## Smooth generating pairs and the rate

Fix any smooth Riemannian metric \(g\) on a smooth closed oriented homotopy
four-sphere \(M\). Use the right quaternionic positive half-spin line with
\(c_2(S^+)[M]=-1\). In an oriented normal chart and a unit spin frame fix
unit spinors \(a\in S_p^-\) and \(b\in S_p^+\). Use a section \(s\) equal
to \(c_p(x)a\) throughout a smaller chart and nonzero off \(p\).
DIR-E06 gives this precise local model. Its local zero index is \(-1\)
in the right-complex orientation, and the coordinate-ball complement is
simply connected and acyclic by van Kampen and excision, hence contractible
by the CW argument in DIR-E06. In an exterior trivialization, the boundary
direction has degree equal to the remaining signed zero count, which is
\(-1-(-1)=0\). A nullhomotopy, smoothed relative to the matching collar,
extends the direction without zeros. Extending its length positively
gives a smooth \(s\) agreeing with the local formula. Choose
\(t(x)=\chi(|x|)b\), with a smooth radial cutoff supported strictly inside
the region of the formula for \(s\) and equal to \(1\) on \(r\le r_0\).
Extend \(t\) by zero.

For \(\lambda>0\), \(E_\lambda=(s,\lambda t)\) generates \(S^+\) everywhere
since \(s\) vanishes only where \(t=b\). The two sections are globally right
quaternionically independent by evaluation outside the chart and then at
\(p\). Put \(m^2=|s|^2+\lambda^2|t|^2\), the squared evaluation norm,
and let \(k=(k_1,k_2)\) be any unit vector of \(\ker E_\lambda\).
The equality \(|s||k_1|=\lambda |t||k_2|\), together with
\(|k_1|^2+|k_2|^2=1\), gives
\[
 |k_1|=\frac{\lambda|t|}{m},\qquad |k_2|=\frac{|s|}{m}.
\]
These formulas also hold when one generator vanishes. With
\(B_\lambda=(Ps,\lambda Pt)\), right quaternionic linearity then gives
\[
 \frac{|B_\lambda k|}{m}
 \le \frac{\lambda(|t||Ps|+|s||Pt|)}{|s|^2+\lambda^2|t|^2}.
\]
Here the local jet gives
\(Ds(p)=\sum_i c(e_i)^2 a=-4a\) and \(Ps(p)=0\). Thus on \(r\le r_0\)
the bounds \(|s|=r\), \(|t|=1\), \(|Ps|\le C r\), and \(|Pt|\le C\)
give \(C\lambda r/(r^2+\lambda^2)\) for this ratio. On the compact
complement, \(|s|\) has a positive minimum and the ratio is \(O(\lambda)\).

The fourth power on the inner ball integrates to at most
\[
 C\lambda^4\int_0^{r_0}\frac{r^7}{(r^2+\lambda^2)^4}\,dr
 \le C\lambda^{-4}\int_0^\lambda r^7\,dr
      +C\lambda^4\int_\lambda^{r_0}\frac{dr}{r}
 =O\bigl(\lambda^4(1+|\log\lambda|)\bigr)
\]
for \(0<\lambda<r_0\). The exterior contributes \(O(\lambda^4)\).
The constants may depend on the fixed metric and choices. The proof
requires no curvature hypothesis and applies to the nonround standard
control.

## Exact orthonormalization at fixed \(g\)

In the chart write \(dV_g=J_{\mathrm{vol}}(x)\,dx\). A cutoff of
\(-\log J_{\mathrm{vol}}\), exponentiated and extended by \(1\), gives
a positive smooth \(w_0\) with \(w_0J_{\mathrm{vol}}=1\) on a neighborhood
of \(\operatorname{supp}t\). Let \(\eta\) be a smooth nonnegative nonzero
radial bump supported in \(|y|<1/2\), and use
\(\eta_\lambda(x)=\eta(x/\lambda)\) extended by zero. With
\(\Delta_\lambda=|s|^2-\lambda^2|t|^2\), set
\[
 N_\lambda=\int_M w_0\Delta_\lambda\,dV_g,\qquad
 D_\lambda=\int_M w_0\eta_\lambda\Delta_\lambda\,dV_g
           =\lambda^6\int_{\mathbb R^4}\eta(y)(|y|^2-1)\,dy .
\]
The factor \(\lambda^6\) is the product of \(\lambda^4\) from the
Jacobian and \(\lambda^2\) from \(\Delta_\lambda\) on the bump. Since
\(N_\lambda\to\int_M w_0|s|^2\,dV_g>0\) and \(D_\lambda<0\), the choice
\(A_\lambda=-N_\lambda/D_\lambda\) is positive for small \(\lambda\).
Then \(w=w_0(1+A_\lambda\eta_\lambda)\) is positive and smooth and
\(\int_M w\Delta_\lambda\,dV_g=0\) exactly.

Use the quaternionic pairing \(\langle q,q'\rangle_{\mathbb H}=\bar q q'\)
in a unit frame. Identifying the flat model with \(c_p(x)a=xa\) as in
DIR-E06, the mixed weighted entry on the chart is the integral against
\(dx\) of
\[
 \lambda(1+A_\lambda\eta_\lambda(x))\,\chi(|x|)\,\bar a\,\bar x\,b .
\]
Each real component is odd on the symmetric support of \(\chi\).
Outside the chart \(t=0\). Thus the mixed quaternionic entry is exactly
zero. The diagonal entries are equal and positive. Multiplying the two
generators by \(\sqrt w\) and dividing by their common positive \(L^2\)
norm gives a smooth fibre-generating quaternionic orthonormal pair.

For any common positive smooth multiplier \(f\), \(\ker(fE)=\ker E\)
and \(m\) changes to \(fm\). With \(k\) fixed at \(x\), the product
rule gives \(P(fE k)(x)=f(x)P(E k)(x)\), since its additional term is
\((df\otimes E k+\tfrac14 c(\,\cdot\,)c(\operatorname{grad} f)E k)(x)\).
Thus the normalized generators have the same \(R\) as \(E_\lambda\)
despite the size of the correcting weight. This proves the stated
infimum \(0\) in the orthonormal generating class.

## Residue, angular mean and attainment

For a fixed generating \(E\), write a uniformly sampled unit parameter
as \(u=k a+v b'\), where \(v\) is a unit vector orthogonal to \(k\).
Then \(|Eu|^2=m^2z\), \(z=|b'|^2\), and splitting the eight real
coordinates into two four-planes gives density \(6z(1-z)\,dz\).
For each direction of \(a,b'\), the difference
\(\bigl||Bu|^4-|Bk|^4\bigr|\) is \(O(\sqrt z)\), uniformly on this fixed
compact pencil. This follows by comparing \(Bu\) to \(Bk\,a/|a|\) and
using the boundedness of \(B\). The denominator for the fourth-power
integrand is \(m^4z^2\). The error is integrable at \(z=0\), since \(m\)
has a positive minimum and the remaining power is \(z^{-1/2}\).
The lower truncation \(z>\epsilon^2\) therefore yields the leading term
\(12R_g(E)\log(1/\epsilon)\), using
\(6\int_{\epsilon^2}^1(1-z)\,dz/z=12\log(1/\epsilon)-6+6\epsilon^2\).
The bounded remainder as the cutoff tends to zero may depend on the
pencil. The angular mean diverges for each fixed \(R_g(E)>0\). If \(R_g(E)=0\),
continuity gives \(Bk=0\) everywhere, so \(|Bu|/|Eu|=|Bv|/m\) on the
nonzero set and the mean is finite.

Zero attainment uses the separate rigidity result that \(R=0\) forces
the conformal class to be round. In the converse direction the
transported round twistor pencil is generating and has \(B=0\), and a
constant quaternionic Gram–Schmidt change preserves these properties.
Thus, with that rigidity input, every pencil in a conformal class
that is not conformally round has infinite untruncated angular mean
even along this sequence with \(R\to0\). The same argument applies to
the nonround kernel-free control. This replay ends at the fixed-metric
theorem and its dependence on the separate attainment proof.
