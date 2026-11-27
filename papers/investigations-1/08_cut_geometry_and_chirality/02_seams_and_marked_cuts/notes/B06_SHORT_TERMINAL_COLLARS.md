# A cheaper terminal collar and its incoming jets

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI assistance. Selected Astra/ultra lead, serving details unavailable. Working HEAD bc2c1bbccc1d. Uses the [explicit extremal](B06_ROUND_TRANSITION.md), the [short-axis moment](E12_AXIAL_MOMENT.md) and the [annular cost localization](E18_LONG_CERTIFICATE.md). B06 finite test, independently assigned in [E22](../research-progress/handoffs/E22_REQUEST_R1.md).

The last eighth of the fixed long trial already exhausts the entire smaller-block allowance. To change that region while keeping the original face, take just the final segment of the explicit extremal. Its inner boundary has a specified nonzero first jet. A choice of the cut determines both the paid exterior cost and the required incoming core. This separates two concrete tests at the same physical boundary.

On the outer annulus normalize the \(i,j\) lengths to one and use \(dv=b\,ds\), where \(s\) is physical outward arclength and \(b=\ell_k\). Write \(x=e^{2v}\) and put \(b^2=1+4x-2x^2\), \(r\le x\le1\). The physical end at \(x=1\) has lengths \((1,1,\sqrt3)\) and zero slopes. On the interior circle orbit at \(x=r\) the transverse lengths are \((1,1,b)\), and their \(s\)-derivatives directed from core to face are \((0,0,4r(1-r))\). The conformal Gauss normal derivative uses increasing \(s\) on both sides of the internal join. The collar has \(R>0,\ E_-=0\), and in units of \(\pi^2\)
\[
 C(r)=E_{+,\mathrm{ann}}/\pi^2
     =48\int_r^1 x(1-x)^2\,dx=16(1-r)^3-12(1-r)^4 .
\]

For a smooth invariant filling of the incoming jet, return to the gauge in which the \(j,k\) length product is one, with distinguished short meridian \(i\). Use the notation \(y=\ell_i^2/(\ell_j\ell_k)\) and \(P=\ell_k/\ell_j+\ell_j/\ell_k\). The endpoint is \(y=1/b,\ y'=-h,\ P=b+1/b\), where \(h=4r(1-r)/b\) and the prime is now the core's conformally invariant \(v_i\) derivative. Integrating the exact square in [E12](E12_AXIAL_MOMENT.md) against \(e^{2(v_i-V)}\) gives the core estimate
\[
 \frac{E_{+,\mathrm{core}}}{\pi^2}\ \ge\
 \frac{[D_0+(4+8(P-2))e^{-2V}]^2}{24(1-e^{-4V})},\qquad
 D_0=2b-2/b+h .
\]
Here \(-y'-4y+2P=D_0\) at the cut and \(-y'-4y+2P=-4\) at the bolt. The nonnegative square contributes at least \(8e^{-2V}(P-2)\) to the weighted moment. The quantity in brackets is positive in the two cases below. This derivation retains the nonumbilic inner jet and uses no positivity assumption on the core.

| Starting value \(r\) | \(b\) | \(db/ds\) | Paid \(C(r)\) | Remaining smaller-block allowance |
| --- | --- | --- | --- | --- |
| \(1/2\) | \(\sqrt{5/2}\) | \(1\) | \(5/4\) | \(1/4\) |
| \(2/3\) | \(5/3\) | \(8/9\) | \(4/9\) | \(19/18\) |

At \(r=1/2\), \(D_0=4/b\), so every such finite invariant core costs strictly more than \(D_0^2/24=4/15\). Thus the full cost exceeds \(91\pi^2/60>3\pi^2/2\). This excludes an entire class even though its prescribed outer collar spends less than the threshold.

At \(r=2/3\), \(D_0=8/3,\ P=34/15\). The resulting necessary condition for the core is
\[
 [8/3+(92/15)q]^2 < (76/3)(1-q^2),\qquad q=e^{-2V}.
\]
It requires \(V>0.5428645\ldots\). Applying the [bolt observation](B06_SHORT_AXIS_OBSTRUCTIONS.md) with \(E_{+,\mathrm{core}}/\pi^2<19/18\) requires \(y(v_0)>69/64-\sqrt{(621/4096)(19/18)}=0.6780822\ldots\), where \(v_0=\tfrac12\log(8/5)\). At its own cut \(y=3/5\). The known estimates leave the existence of this incoming core open. They do not assert that this radius is optimal.

For a positive result one can supply a core with strict remaining energy and positive scalar curvature, matching both first jets in the stated physical gauge, or certify the conformal form on the complete joined disk. With positive scalar curvature on both pieces, smoothing their matched first jets gives \(C^1\) convergence with uniformly bounded second derivatives in a shrinking internal collar. The two positive scalar lower bounds on the pieces originally give a coercive form, which persists by \(L^2\) convergence of scalar and the four-dimensional Sobolev inequality. Alternatively an exactly matched collar on the core gives smoothness directly. At the final face the small even modification in [B06](B06_ROUND_TRANSITION.md) costs \(o(1)\) and preserves strict scalar positivity on the collar. The same occupied face and the \(i,j\) switch then give both smooth reflected doubles and each closed chiral energy \((2b_{\rm side}+5)\pi^2+o(1)\), where \(b_{\rm side}=E_{+,\mathrm{core}}/\pi^2+C(r)\). A strict margin gives the required closed budget only after the core is supplied. [Independent nonumbilic jet check](../reviews/E22_SHORT_TERMINAL_COLLARS.md)
