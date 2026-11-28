# WIN-E11 · Ordered chiral transport on two round caps

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and effort were unavailable to
the helper. Input checkout `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`
and the working-tree [frozen request, revision 1](../research-progress/handoffs/REQUEST_TWISTOR_R1.md).
This is a working analytical calculation for the specified smooth marked
standard sphere. The proof uses two axes and one smooth conformal modification.
The positive half-spin line is quaternionic, with Clifford convention
\(c(v)^2=-|v|^2\), and branch orientation convention \(c_2(S^+)[S^4]=-1\).
[Clifford action](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E12_20261124.md#setting-and-the-two-form-contraction) ·
[Chern normalization](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md#chiral-chernweil-density-and-sign)

## Two based circles and their spin transport

Take the unit round \(S^4\subset\mathbb R^5\) with outward-normal-first
orientation, using the standard Euclidean basis \(e_1,\ldots,e_5\).
Let \(p=e_5\), so that \((e_1,e_2,e_3,e_4)\) orients \(T_p S^4\).
For \(j=2,3\) set \(N_j=S^4\cap\operatorname{span}(p,e_1,e_j)\),
oriented by \((e_1,e_j)\) at \(p\). Each is a totally geodesic unit
two-sphere, since its great circles are also great circles of \(S^4\).
Its normal space in \(S^4\) has a constant ambient orthonormal basis
whose covariant derivatives along \(N_j\) vanish.

For \(0<r\leq\pi/2\), define
\[
 m_r=\cos r\,p+\sin r\,e_1,\qquad
 v_r=\sin r\,p-\cos r\,e_1,\qquad
 \gamma_{j,r}(t)=\cos r\,m_r+
                \sin r\,(\cos t\,v_r-\sin t\,e_j),
 \quad 0\leq t\leq 2\pi.
\]
The loop begins and ends at \(p\). It is the positively oriented boundary
of the geodesic cap \(D_{j,r}\subset N_j\) of radius \(r\) about \(m_r\).
The outward tangent conormal at \(p\) is \(-e_1\), and the boundary
velocity is \(-\sin r\,e_j\). Replacing \(r\) by a radial variable in the
display for \(\gamma_{j,r}\), with the centre and the two directions
held fixed, gives the polar metric \(d\vartheta^2+\sin^2\vartheta\,dt^2\)
on the cap. Hence its swept area is \(A(r)=2\pi(1-\cos r)\).

Fix an oriented orthonormal tangent frame \((U,V)\) on the cap with
\((U,V)|_p=(e_1,e_j)\) and complete it to a positive ambient frame by two
parallel normals. Write \(\omega=\langle\nabla U,V\rangle\). In the polar
orthonormal frame off the centre, the polar metric gives
\(\omega=\cos\vartheta\,dt\), so \(d\omega=-dA\), with \(dA\) the
oriented area form. Changing the oriented tangent frame changes \(\omega\)
locally by an exact form, and the curvature identity extends over the
centre in the smooth cap frame.

The infinitesimal lift of the rotation \(U\mapsto V,\ V\mapsto -U\)
is \(\tfrac12 c(U)c(V)\). Its commutators with \(c(U)\) and \(c(V)\)
are \(c(V)\) and \(-c(U)\), and it commutes with the two normal Clifford
multiplications. The ambient frame lifts over the disk, so the spin
connection matrix on the cap is \(\tfrac12\omega\,c(U)c(V)\), represented
by one constant generator in that frame. The parallel transport equation
has the negative of this matrix as its coefficient. Stokes' theorem fixes
the endpoint in the actual spin cover.
\[
 H_j(r)=\exp\left(-\tfrac12\oint_{\gamma_{j,r}}\omega\, I_j\right)
        =\exp\left(\tfrac12 A(r) I_j\right),
 \qquad I_j=c(e_1)c(e_j)\big|_{S^+_p}.
\]
In particular a hemisphere gives \(H_j=-1\). The Clifford relations give
\(I_j^2=-1\) and \(I_2I_3=-I_3I_2\). In a unit right-quaternionic
frame for \(S^+_p\), they act by left multiplication by orthogonal unit
imaginary quaternions.

## Exact trace and changes of marking

Put \(\alpha=A(r_2)/2\), \(\beta=A(r_3)/2\), and
\(q=H_2(r_2)=\cos\alpha+I_2\sin\alpha\). Then
\[
 qI_3q^{-1}=\cos(2\alpha)I_3+\sin(2\alpha)I_2I_3 .
\]
The scalar part of
\((\cos\beta+\sin\beta\,qI_3q^{-1})(\cos\beta-\sin\beta\,I_3)\)
is \(\cos^2\beta+\sin^2\beta\cos(2\alpha)\). The defining complex
trace of a unit quaternion is twice its scalar part. Therefore
\[
 \operatorname{tr}_{\mathbb C^2}(H_2H_3H_2^{-1}H_3^{-1})
 =2-4\sin^2\!\left(\frac{A(r_2)}{2}\right)
       \sin^2\!\left(\frac{A(r_3)}{2}\right).
\]

| \(r_2\) | \(r_3\) | Swept areas \((A(r_2),A(r_3))\) | Trace |
| --- | --- | --- | --- |
| \(\pi/2\) | \(\pi/3\) | \((2\pi,\pi)\) | \(2\) |
| \(\arccos(3/4)\) | \(\pi/3\) | \((\pi/2,\pi)\) | \(0\) |
| \(\pi/3\) | \(\pi/3\) | \((\pi,\pi)\) | \(-2\) |

At fixed \(r_3=\pi/3\), the smooth family \(r_2\in[\pi/3,\pi/2]\)
realizes the full interval \([-2,2]\). It varies through based loops with
the same basepoint and in the same based homotopy class. Within this
family reversing either loop replaces the corresponding spin rotation
by its inverse and keeps the trace. For any smooth \(\mathrm{SU}(2)\)
change of frame \(b\) on the two loops with the same value at \(p\),
transport changes each \(H_j\) to \(b(p)^{-1}H_jb(p)\) by the transport
equation. Thus the trace survives simultaneous gauge conjugation.

## Fixed loops in a flat chart

Use stereographic coordinates \(x\in e_4^\perp\cong\mathbb R^4\) from
\(e_4\). The inverse map is
\[
 y(x)=\frac{2x+(|x|^2-1)e_4}{1+|x|^2},
 \qquad g_{\mathrm{rd}}=\frac{4}{(1+|x|^2)^2}\,\delta .
\]
Both complete spheres \(N_j\) have \(\langle y,e_4\rangle=0\), so
their caps and all the specified loops lie on \(|x|=1\). Choose
\(\chi\in C_c^\infty(\mathbb R^4)\) equal to \(1\) on \(|x|\leq 2\),
and define \(u(x)=\chi(x)\log((1+|x|^2)/2)\), extended by zero near
the omitted point. The global metric \(g_{\mathrm{flat}}=e^{2u}g_{\mathrm{rd}}\)
is Euclidean on \(|x|<2\). There the constant oriented orthonormal frame
lifts to a spin frame because the ball is simply connected. Its spin
connection matrix vanishes. Both original loops have identity transport
in this metric, and their commutator trace is \(2\).

With \(r_2=r_3=\pi/3\), the same basepoint and maps \(\gamma_{j,r}\)
give trace \(-2\) for the round metric and \(2\) for the modified metric
in the same conformal class. The round loop variation and the fixed-loop
metric comparison show that this scalar depends on the loop choices and
on the metric representative. The calculation concerns the specified
marked transports on \(S^4\) and stops at this comparison.
