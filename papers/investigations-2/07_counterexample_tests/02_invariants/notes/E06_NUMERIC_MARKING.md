# WIN-E06 · A numerical area lower bound at the specified insertion marking

28 November 2026 UTC, 27 November in America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. Actual serving model and effort unavailable. This calculation uses the [frozen numeric marking](../research-progress/handoffs/REQUEST_E06_NUMERIC_MARKING_R1.md), the [E03 matched insertion](E03_AREA.md#matching-check-for-the-relative-insertion), its [E04 reading](../reviews/E04_AREA.md), and the [E05 coefficient inequality](E05_FIXED_AREA.md#boundary-enclosure-and-projective-area).

**Result.** For the specified graph class \(c_{\rm num}\) on the oriented standard smooth \(S^4\), with the specified pole and signed coordinates, its normalized projective direction area satisfies
\[
 \mu(D(c_{\rm num},p))\ \ge\ 2^{-256}.
\]
This is a working rational bound using the E05 operator estimate. The earlier arbitrary realization of E03 has its own coefficient data.

## Fixed class and shell estimates

Use the inherited positive Euclidean stereographic coordinates \(z,w\) of E03. They are obtained from the numerically reversed inversion of the positive \(y\) chart by the fixed orthogonal reflection. Use the flat two-form norm in these coordinates. Write \(\beta\) for the standard form of norm \(\sqrt2\), and \(Q,B_1\) for the closed quadratic and linear parts of the core, so the core form is \(\omega=T^{-1}(-\epsilon\beta+Q+R B_1)\). Thus \(B_1\) is pointwise orthogonal to \(\beta\), \(|Q|\le\sqrt2 r^2\), and \(|B_1|\le\sqrt2 r\). Use \(\lambda,\tau,\nu\) for the respective Euler primitives of \(\beta,Q,B_1\) with divisors \(2,4,3\). The cutoff derivative is a convolution of a nonnegative density of total mass one and height two with the normalized bump. Consequently \(0\le\gamma'\le2\), \(\gamma=0\) through \(9/8\), and \(\gamma=1\) from \(15/8\). Put \(\gamma_b(r)=\gamma(r^2/b^2)\). In shell 3, write \(c_0=(1-\epsilon)/T\) and use \(\chi(r)=c_0+(1-c_0)\gamma_{8\delta}(r)\) exactly as frozen. These plateaus give matching on neighborhoods of \(r=\delta,4\delta,8\delta,16\delta,32\delta\), using \(d\lambda=\beta\), \(d\tau=Q\) and \(d\nu=B_1\).

Set \(P=|\omega^+|\), \(N=|\omega^-|\) in the flat chiral splitting, and \(\Delta=P^2-N^2\), the coefficient of \(\omega\wedge\omega\) in positive Euclidean volume. The estimates below hold on the whole indicated shells. In particular the quotient defining the rank-one graph is smooth there.

| Shell | Lower bound for \(P\) | Upper bound for \(P\) | Lower bound for \(\Delta\) |
| --- | ---: | ---: | ---: |
| \(\delta\le r\le4\delta\) | \(\epsilon/(2T)\) | \(64/T\) | \(\epsilon^2/(2T^2)\) |
| \(4\delta\le r\le8\delta\) | \(3/(4T)\) | \(3/T\) | \(1/(2T^2)\) |
| \(8\delta\le r\le16\delta\) | \(1/(2T)\) | \(16\) | \(1/(2T^2)\) |
| \(16\delta\le r\le32\delta\) | \(3/4\) | \(3\) | \(1/2\) |

**Shell 1.** Let \(\vartheta=\gamma_{\delta}-\epsilon+|z|^2-|w|^2\), \(F=zw-R\bar w\), and \(k=\gamma'(r^2/\delta^2) r^2/\delta^2\). The radial term \(d\gamma_{\delta}\wedge\lambda\) has norm \(k\), is decomposable of type \((1,1)\), and wedges to zero with the complex off-diagonal terms. The corrected E03 expression is
\[
 \frac{T^2\Delta}{2}=\vartheta^2+k\vartheta+|F|^2 .
\]
Write \(v=|w|^2\). Here \(\vartheta\ge\epsilon-2v\), \(0\le k\le32\), and \(|F|\ge(R-4\delta)\sqrt v\ge127\sqrt v\). Thus
\[
 \frac{T^2\Delta}{2}\ \ge\ \vartheta^2+(127^2-64)v.
\]
If \(v\le\epsilon/4\), then \(\vartheta^2\ge\epsilon^2/4\). Otherwise the second term alone is at least \(\epsilon/4\ge\epsilon^2/4\). This proves the gap and the lower bound on \(P\) by \(P^2\ge\Delta\). Also \(|\vartheta|<2\) and \(|F|\le(R+4\delta)4\delta<1\), so \(TP\le T|\omega|\le \sqrt2(|\vartheta|+|F|)+k<64\).

**Shell 2.** Before scaling by \(T^{-1}\), the self-dual base \((1-\epsilon)\beta+RB_1\) has norm between \(1\) and \(2\), using \(r\le8\delta=2^{-9}\) and orthogonality. With \(b=4\delta\), the correction \(d[(1-\gamma_b)\tau]\) has norm at most
\[
 \sqrt2 r^2(1+2\|\gamma'\|_\infty)\le5\sqrt2\,2^{-18}<1/4 .
\]
Here \(|\tau|\le\sqrt2 r^3/4\), \(|d\gamma_b|\le 2\|\gamma'\|_\infty r/b^2\), and \(r\le2b\). The positive norm is at least \(3/(4T)\), the negative norm at most \(1/(4T)\), and \(\Delta\ge1/(2T^2)\).

**Shell 3.** In a unitary frame taking the point to \((r,0)\), the \((1,1)\) part \(d(\chi\lambda)\) has diagonal coefficients \(\chi+k'\), \(\chi\), where
\[
 k'=(1-c_0)\gamma'(r^2/(8\delta)^2)\,r^2/(8\delta)^2\in[0,8].
\]
The remaining \((R/T)B_1\) has zero mixed wedge with this part and nonnegative square. Hence \(\Delta\ge 2c_0^2\ge 1/(2T^2)\). The full norm is bounded by \(2\chi+k'+(R/T)\sqrt2 r<16\), using \(r\le16\delta=2^{-8}\). Again \(P^2\ge\Delta\).

**Shell 4.** For \(b=16\delta\), the form differs from \(\beta\) by \((R/T)d[(1-\gamma_b)\nu]\). Its norm is bounded by
\[
 \frac RT \sqrt2 r(1+8\|\gamma'\|_\infty/3)
 \le 2^{-9}\sqrt2\,2^{-7}(1+16/3)<1/4 .
\]
This uses \(|\nu|\le\sqrt2 r^2/3\), \(r\le2b\), and the same derivative bound on \(\gamma_b\). Since \(1<|\beta|<2\), the positive norm lies between \(3/4\) and \(3\) and the negative norm is at most \(1/4\), giving the stated gap. Beyond the shell the form equals \(\beta\).

## Graph, flat buffer and area

On the shells use the graph map
\[
 G(v)=\frac{\langle v,\omega^+\rangle}{|\omega^+|^2}\,\omega^-,\qquad
 v\in E_+ ,
\]
and set it to zero in the core and tail. The matching neighborhoods are flat-self-dual, so \(G\) is smooth and supported in \(\overline{B_L(0)}\) with \(L=32\delta\). In particular the core prescription is smooth through the newborn zero circle. The positive plane is the graph of \(G\) and contains \(\omega\). The shell table yields, respectively,
\[
 \frac{\Delta}{P^2}\ \ge\ 2^{-63},\quad \frac1{18},\quad 2^{-41},\quad \frac1{18}.
\]
Thus \(\|G\|_{\infty}\le\sqrt{1-2^{-63}}\le b_*=1-2^{-64}<1\). Its graph is wedge-positive and determines the compactifiable conformal class. Choose a representative Euclidean in the flat core and tail using the puncture's Euclidean volume there, and use \(|y|^4\) as conformal multiplier near \(p\) to extend it as \(\delta_y\). This gives the E05 norms on the core and at the pole. The residue of the insertion has the numerical coefficients of the reflected Euclidean \(\beta\) and is anti-self-dual in positive \(y\). A1 identifies the form with its pole field at this class. [Leading coefficient and uniqueness](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md) · [Relative realization and smooth compactification](../../../01_chiral_transfer_and_pole_forms/notes/E04_REALIZATION.md)

The closed normal disk \(K\) of radius \(a=\delta/16=2^{-16}\) is centered at \(z_0=\sqrt\epsilon=\delta/\sqrt2,\ w=0\) in the E03 affine normal plane. Every \(\ell\)-ball about its boundary is within the flat core, since \(z_0+a+\ell < 7\delta/8 <\delta\) for \(\ell=\delta/16\). In particular \(\ell<\operatorname{dist}(\partial K,\operatorname{supp} G)\). The E05 bound for the perpendicular evaluation operator therefore gives
\[
 M\ \le\ 1+\frac{b_*}{1-b_*}\left(\frac{L}{\ell}\right)^2
 \ \le\ 1+2^{82}\ \le\ 2^{83}.
\]
The E03 signed disk has local degree \(-1\) in its ordered coordinates. Its least linear singular value is \(s=\min(2\sqrt\epsilon,R-\sqrt\epsilon)=\sqrt2\,\delta\). The radius satisfies \(a<\min(\delta-\sqrt\epsilon,s)\), and the boundary minimum after unit-residue normalization satisfies
\[
 m\ \ge\ \frac{sa-a^2}{T}
 = \frac{(\sqrt2-1/16)\delta a}{T}\ \ge\ 2^{-44},
\]
using \(\sqrt2>17/16\). Take \(m_0=2^{-44}\) and \(M_0=2^{83}\), so \(m_0/M_0=2^{-127}\). The boundary degree persists on the projective disk prescribed by \(m_0,M_0\). Its probability gives the rational bound
\[
 \mu(D(c_{\rm num},p))\ \ge\
 \frac{m_0^2}{2(M_0^2+m_0^2)}
 \ \ge\ \frac{(m_0/M_0)^2}{4}
 =2^{-256}.
\]
All rounding is by explicit inequalities. The cutoff estimates use only normalization, support and positivity of the prescribed exponential bump. The printed proof's parameter regime \(R\sqrt\epsilon\gg1\) is replaced here by the direct inequalities for the corrected shell expressions. The bound concerns this inserted standard-sphere marking and is an enclosure from below of its direction area.

**Input bytes.** SHA-256 prefixes `1ac78f9a9d1ef8a5` (E06 request), `784f047d1c8ff3a5` (E03 area), `f80ebf2372b9d635` (E04 area), and `25ad856773105401` (E05 coefficient estimate). The underlying insertion uses [Taubes, Proposition 2.1 and §2](https://archive.intlpress.com/site/pub/files/_fulltext/journals/mrl/2006/0013/0004/MRL-2006-0013-0004-a006.pdf) with the local formula corrections recorded in the E03/E04 inputs. The present shell and area inequalities are exact deductions for the newly specified member of that family.
