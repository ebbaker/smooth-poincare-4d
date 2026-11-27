# A sharp transition cost on the marked projective-plane disk

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI assistance. Selected Astra/ultra lead, serving model and effort unavailable. B06, working HEAD bc2c1bbccc1d. The [paired filling theorem](B04_PAIRED_FILLING.md), [marked topology](../reviews/E11A_INTEGRATION.md), [incoming result](../../03_tubes_and_exteriors/research-progress/handoffs/TO_SEAM_SHORT_AXIS_RESULT_20261127.md) and [E19 curvature conventions](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md) are frozen in the [independent request](../research-progress/handoffs/E17_REQUEST_R1.md). Smooth oriented Riemannian dimension four. Energies use the Hilbert–Schmidt norm on the real three-dimensional Weyl blocks.

## Statement

Let \(W\) be the marked normal disk of the projective plane, with short \(i\)-meridian and outward boundary \(Q_8\backslash S^3\) of right-invariant lengths \((1,1,\sqrt3)\) and second fundamental form zero. Suppose some interior round umbilic principal orbit bounds an outer annulus with radial metric and equal \(i,j\) lengths throughout. The distinguished \(k\)-length may vary arbitrarily, as may the common horizontal scale. The core inside that orbit may be any smooth filling on this disk. Then
\[
 E_+(W)>4\pi^2,\qquad e_W>13\pi^2/2 .
\]
The infimum in this class is exactly \(4\pi^2\) for the smaller block and \(13\pi^2/2\) for the half-sum, even with strict whole-side Robin positivity. Consequently the unrestricted marked \(F_W(h_{\sqrt3})\le13\pi^2/2\), improving the previous certified upper bound \(7.5575\pi^2\). The sharp value for this class exceeds the prescribed \(3\pi^2/2\) target. The calculation below constructs a finite smooth trial with both reflected signs positive and gives its actual closed budget.

## The annular variational problem

Divide by the square of the common \(i,j\) length and use arclength \(s\) in that gauge. Integrated chiral energies are conformal invariants. The annulus has orbit lengths \((1,1,a)\). Set \(dv=a\,ds\), \(y=a^2=1+z\), with \(v=0\) at the outer face. A cyclic permutation puts \(k\) first in the positively oriented frame. Umbilicity kills the difference of logarithmic normal derivatives, so the inner data are \(z=z'=0\) and the face data \(z=2,\ z'=0\). Here and below primes differentiate in \(v\). The unnormalized orbit volume is \(\pi^2 a/4\). For horizontal lengths one, Cartan's radial sectional coefficient is \(-y''/2\), the axial tangential coefficient is \(4-3y\), and the axial mixed coefficient is \(-y'\). Hence
\[
 R/2=4-y-y''/2,\qquad
 6\lambda_+ =-z''-6z'-8z,\qquad
 |W^+|^2=3\lambda_+^2/2 .
\]
The two remaining eigenvalues equal \(-\lambda_+/2\). This calculation applies only on the stated annulus. Write \(L=D^2+6D+8\). Its smaller-block contribution in units of \(\pi^2\) is \(\int(Lz)^2\,dv/96\).

Extend \(z\) by zero from the finite inner endpoint to \(-\infty\). The two zero jets give an \(H^2\) extension. On the half-line the extremal with the same final data is
\[
 z_*(v)=4e^{2v}-2e^{4v},\qquad Lz_* =96(e^{2v}-e^{4v}),\qquad L^*Lz_*=0 .
\]
Twice integrating by parts against \(z-z_*\) gives \(\int Lz_* L(z-z_*)=0\). The outer endpoint terms vanish by the matched jets and the inner terms vanish exponentially. Therefore
\[
 \frac1{96}\int (Lz)^2=4+\frac1{96}\int |L(z-z_*)|^2,\qquad
 96(1/4-2/6+1/8)=4 .
\]
Equality forces \(L(z-z_*)=0\); the zero final Cauchy data force \(z=z_*\). The extension vanishes on an open half-line, so the inequality is strict on each finite annulus.

## A smooth positive family on the actual disk

For the core take the distinguished direction to be the **collapsing \(i\)**, with \(j,k\) both of length one. Starting at the bolt \(v=0\), set
\[
 y_i=1+2e^{-2v}-3e^{-4v}=(1-e^{-2v})(1+3e^{-2v}),\qquad ds=dv/\sqrt{y_i}.
\]
It has \(y_i(0)=0,\ y_i'(0)=8\). The coordinate \(s=\sqrt{v/2}\,(1+O(v))\) is \(\sqrt v\) times a smooth even function of \(\sqrt v\); the inverse gives \(a_i(s)=4s+O(s^3)\) smooth and odd. With the period \(\pi/2\) and equal smooth horizontal lengths this is precisely the marked disk bolt. The same axial equation now gives \(L(y_i-1)=0\) and \(R/2=3-6x+27x^2\ge8/3\) for \(x=e^{-2v}\). The core approaches a round product at infinity with all derivatives. In an outer annulus with distinguished \(k\) take \(y_k=1+z_*\). There \(R/2=3-12x+18x^2\ge1\), \(x=e^{2v}\). Its inner infinite end also approaches a round product. At the finite face the lengths are exactly \((1,1,\sqrt3)\), with all first normal derivatives zero.

Here is a finite smoothing with explicit tolerances. Fix a nonnegative \(C^\infty\) kernel of integral one supported in \((-1/4,1/4)\). Convolve the clamped cubic \(3t^2-2t^3\), extended by zero for \(t<0\) and one for \(t>1\), with this kernel and translate to the right by \(1/2\). The resulting cutoff \(\chi(t)\) is zero for \(t\le1/4\), one for \(t\ge7/4\), and obeys \(|\chi'|\le3/2,\ |\chi''|\le6\). Cut the core at \(v=N+2\) by replacing \(y_i-1\) with \(\chi(N+2-v)(y_i-1)\). Cut the inner tail of the annulus at \(v=-N-2\) by replacing \(z_*\) with \(\chi(v+N+2)z_*\). Join the two exact round products by the identity on the labeled \(Q_8\) quotient. The distinguished profile switches from \(i\) to \(k\) within a region where the tensor is round. This keeps the short \(i\)-meridian at the bolt. For \(N=10\), put \(\eta=e^{-2N}<10^{-8}\). Before cutoff, the respective tail bounds on \((|z|,|z'|,|z''|)\) are \((6,20,64)\eta\) on both transition intervals of width at most two. Afterwards they are \((6,29,160)\eta\), so \(|Lz|\le400\eta\) there and \(R/2\ge3-86\eta\). The total added energy in units of \(\pi^2\) is at most \(4(400\eta)^2/96\).

To smooth both reflections at the original face, put \(\epsilon=10^{-5}\). On the last \(2\epsilon\) of the outer interval replace \(y_*=1+z_*\) by
\[
 \chi(-v/\epsilon)y_*+(1-\chi(-v/\epsilon))(3-8v^2).
\]
The quadratic is its exact second Taylor polynomial. With \(|y_*'''|\le160\) on this interval, Taylor's theorem and the cutoff bounds give changes at most \(215\epsilon^3,650\epsilon^2,3000\epsilon\) respectively in \(y,y',y''\). Thus \(|\Delta Lz|\le4000\epsilon\), and \(R/2\ge1-1501\epsilon>0\). The profile is positive and even near the face in \(v\). Physical signed arclength \(\int_0^v y^{-1/2}\,dv\) is odd there, giving an exactly smooth even metric in signed normal distance. The altered energy exceeds the unaltered half-line energy by at most
\[
 \frac{4(400\eta)^2}{96}
 +\frac{2\epsilon}{96}\{48(4000\epsilon)+(4000\epsilon)^2\}<10^{-6},
\]
using \(\sup|Lz_*|\le24\). This is an estimate on the whole disk. Taking \(N\to\infty,\epsilon\downarrow0\) proves sharpness of the stated infimum.

## Two smooth doubles and the actual closing

Everywhere \(R>0\) on this compact example. Its zero mean curvature face has strictly positive whole-side Neumann conformal form. Reflection by the identity gives a smooth positive-scalar-curvature double for each of the two copies. Glue the first copy to the oppositely oriented second by conjugation by \((i+j)/\sqrt2\), which exchanges \(i,j\) and negates \(k\). The normalized annular tensor is invariant under this boundary map. Evenness in physical signed distance makes the actual closing smooth. The outward normals are opposite across the seam and both second fundamental forms vanish. The two kernels are \(\langle i\rangle,\langle j\rangle\); the explicit matrix-orbit identification in [E11A](../reviews/E11A_INTEGRATION.md) identifies this assembly with standard \(S^4\). Each reflected double uses its own identity gluing.

In the outward-first orientation of the first half, the boundary correction is \(\eta=-5/12\), relative signature zero, so \(E_-=E_++5\pi^2\). A zero shape operator gives the same signature transgression as a product at the face. Reversal interchanges the two chiralities. Thus the finite positive trial has
\[
 4<E_+(W)/\pi^2<4.000001,\qquad
 9<E_-(W)/\pi^2<9.000001,\qquad
 13<E_+(M)/\pi^2=E_-(M)/\pi^2<13.000002 .
\]
The required closed budget is strictly below \(8\pi^2\). The lower bound follows from the interior round umbilic slice and the full outer annulus, with no assumption on symmetry inside that slice. The applicable signature theorem is Atiyah–Patodi–Singer I, (4.14), and the sign and chiral normalization on this quotient are independently verified in the [marked calculation](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md). [Atiyah–Patodi–Singer, §4](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24)
