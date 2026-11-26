# Positive equatorial sign for the regular right-angled hexagon

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E02 check at HEAD `1c81a3048c8c`. The issue selected GPT-6.2 Astra/ultra for the lead and requested GPT-6.2 Sol/ultra for the check. Actual serving model and effort were unavailable. Working inputs were the [regular-hexagon issue](../research-progress/handoffs/REGULAR_HEXAGON_ISSUE_20261126.md) (`296e03c2d50c`), the [reflection model and quotient identification](LONG_CUFF_SEAM.md) (`2cd30856714e`), and the [equatorial form](EQUATOR_FORM.md) (`dff167bc719a`).

For the pants obtained by doubling the regular right-angled hyperbolic hexagon, with all three cuff lengths \(2\operatorname{arcosh}2\) at curvature \(-1\), the induced conformal class on the smooth closed retained equator is Yamabe positive. The orbital series contracts strictly below exponent \(1/2\). This is a sign result for the three-dimensional equator.

## Klein coordinates after two reflections

Use the future unit hyperboloid with Lorentz product \(\langle Z,W\rangle=-Z_0W_0+Z_{\mathrm{sp}}\cdot W_{\mathrm{sp}}\) and base point \(o=(1,0,0)\). The three unit spacelike normals are \(n_i=(1,\sqrt2\,e_i)\), with the unit vectors \(e_i\) at angles \(2\pi i/3\). Thus \(-\langle n_i,n_j\rangle=2\) for distinct \(i,j\). The common perpendiculars have length \(\operatorname{arcosh}2\). The two adjacent feet on a given mirror are \((n_j+2n_i)/\sqrt3\) and \((n_k+2n_i)/\sqrt3\) for distinct \(i,j,k\). Their Lorentz product is \(-2\), so the mirror sides of the right-angled hexagon have the same length as its perpendicular sides. Let \(s_i Z=Z-2\langle Z,n_i\rangle n_i\) be the reflections, let \(G\) be their free product, and let \(\Gamma\) be its even-word subgroup. [Chamber, cuff and group identification](LONG_CUFF_SEAM.md#the-mirror-group-and-its-cuffs)

The Klein cap \(H_j\) is given by \(z\cdot e_j\ge 1/\sqrt2\). An orbit point of a nonempty reduced word belongs to the cap of its first letter. If \(w\) has length at least two and begins with \(s_i s_j\), write \(wo=s_i Z\) with \(Z\) in \(H_j\), where \(j\ne i\). In spatial coordinates aligned with \(e_i\), write \(Z=Z_0(1,x,y)\). Any point of \(H_j\) makes an angle of at most \(45^\circ\) with \(e_j\), so its angle with \(e_i\) is at least \(75^\circ\). Since \(x^2+y^2<1\), one has \(x\le c=\cos(75^\circ)\). Reflection gives
\[
 (s_i Z)_0=Z_0(3-2\sqrt2\,x),\qquad
 (X,Y)=\left(\frac{2\sqrt2-3x}{3-2\sqrt2\,x},
             \frac{y}{3-2\sqrt2\,x}\right)
\]
for the Klein coordinates of \(wo\). Consequently
\[
 X>\frac9{10},\qquad |Y|<\frac49 .
\]
Indeed \(3-2\sqrt2\,c=4-\sqrt3>9/4\) and \(|y|<1\). For the first inequality, \(c<13/50\) follows from \(c^2=(2-\sqrt3)/4\) and \(\sqrt3>173/100\). The function \((2q-3x)/(3-2qx)\) decreases in \(x\) at \(q=\sqrt2\) and increases in \(q\) for fixed \(|x|<1\) and \(24/17\le q\le\sqrt2\), as follows by differentiation. Evaluating at \(x=13/50,\ q=24/17\) gives \(193/214>9/10\).

## Uniform contraction of the orbital series

Define \(T(w)=\cosh d(o,wo)=(wo)_0\). For a reduced word \(w\) of length at least two with first letter \(s_i\), the two reduced left extensions \(s_k w\), \(k\ne i\), have ratios \(T(s_k w)/T(w)\) of the form
\[
 A-B,\quad A+B,qquad A=3+\sqrt2\,X,\quad B=\sqrt6\,|Y|.
\]
This follows from reflecting in the normals with spatial directions at \(\pm120^\circ\) from \(e_i\). The bounds \(\sqrt2>7/5\) and \(\sqrt6<5/2\) give \(A>213/50\) and \(0\le B<10/9\). The sum \((A-B)^{-1/2}+(A+B)^{-1/2}\) decreases with \(A\) and increases with \(B\ge0\) on \(A>B\), as follows by differentiation. Thus it is at most
\[
 (1417/450)^{-1/2}+(2417/450)^{-1/2}
 < \frac{141}{250}+\frac{54}{125}=\frac{249}{250}.
\]
The strict rational comparisons follow from \(1417\cdot141^2=28171377>450\cdot250^2=28125000\) and \(2417\cdot54^2=7047972>450\cdot125^2=7031250\).

Every extension ratio is positive and less than \(3+2\sqrt2<6\) because the Klein coordinate has Euclidean norm less than one. For \(s_*=499/1000\), each inverse-power weight therefore increases by a factor at most \(6^{1/1000}\) compared with its value at exponent \(1/2\). This still gives a uniform contraction, since
\[
 (250/249)^{1000}\ge 1+1000/249+499500/249^2>6.
\]
Summing over words of length \(m\ge2\) yields
\[
 \sum_{|v|=m+1}T(v)^{-s_*}
 \le 6^{1/1000}\frac{249}{250}\sum_{|w|=m}T(w)^{-s_*}.
\]
Each length-\(m+1\) reduced word has a unique length-\(m\) suffix, so iteration gives convergence. As \(e^{-s_*d(o,wo)}\le T(w)^{-s_*}\), this proves \(\delta(G)\le499/1000\). The bound passes to \(\Gamma\), and its orbital distances are unchanged by the totally geodesic embedding \(\mathbb H^2\subset\mathbb H^4\). Also \(\delta(\Gamma)>0\) since there are \(3\cdot 2^{m-1}\) reduced words of each even length \(m\ge2\) and their distances are at most \(2m\operatorname{arcosh}\sqrt2\).

## Sign on the compactified equator

The marked funnel metric gives the same closed smooth conformal class on the retained totally geodesic equator as the standard quotient \(\Omega/\Gamma\), where \(\Omega=S^3\setminus\Lambda(\Gamma)\). The cuff axes and the compact hexagon give the torsion-free, non-elementary convex-cocompact group required here. [Identification across the core circles](LONG_CUFF_SEAM.md#identification-of-the-closed-conformal-class)

For this group, Izeki–Nayatani's canonical conformal metric has scalar curvature \(R=2(1-2\delta(\Gamma))\operatorname{tr} A\), with \(A\) the covariance of the tangential covectors \(d_x\log(\tfrac12|x-\xi|^2)\) in the normalized Patterson–Sullivan measure. The covectors at a fixed \(x\in\Omega\) depend injectively on \(\xi\) by stereographic projection. The measure has support at more than one point, since it is nonzero with \(\Gamma\)-invariant support and the cuff translations have no common fixed point. Hence \(\operatorname{tr} A>0\), and the exponent bound gives \(R>0\). By compactness and conformal covariance the first eigenvalue of \(-8\Delta_h+R_h\) on the retained equator is strictly positive for its induced metric \(h\), with \(\Delta_h=\operatorname{div}_h\nabla_h\). [Izeki–Nayatani, *Canonical metric on the domain of discontinuity of a Kleinian group*, Proposition 1.1 and §2, equation (2.1), pp. 11–14, checked 26 November 2026](https://www.numdam.org/article/TSG_1997-1998__16__9_0.pdf#page=4) · [Application to the retained seam](LONG_CUFF_SEAM.md#strict-sign-on-the-quotient)
