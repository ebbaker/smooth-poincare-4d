# Necessary conditions for a short-axis filling

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI assistance. Selected Astra/ultra lead, serving details unavailable. Working HEAD bc2c1bbccc1d. Sources are the [frozen E12 inputs](../research-progress/handoffs/E12_REQUEST_R1.md), [axial derivation](E12_AXIAL_MOMENT.md) and [independent causal calculation](../reviews/E16_CAUSAL_READBACK.md). Energies below use the outward-first orientation and real chiral operator norm. Write \(b=E_+/\pi^2\) on the marked disk. The signed signature correction gives \(e_W/\pi^2=b+5/2\). On the actual switched pair made from this same filling both closed chiral integrals tend to \((2b+5)\pi^2\) under smoothing. Smoothness across the seam and positivity of both reflected doubles are separate requirements in the [paired filling theorem](B04_PAIRED_FILLING.md).

## A conformally invariant overshoot on an actual orbit

Write the three orbit lengths as \(\ell_i,\ell_j,\ell_k\) and the original radial arclength as \(r\). Define
\[
 y=\frac{\ell_i^2}{\ell_j\ell_k},\qquad dv=\frac{\ell_i\,dr}{\ell_j\ell_k},
 \qquad v=0\ \text{at the bolt},\qquad V=v(\partial W).
\]
Here \(i\) is the collapsing short direction and \(y(V)=1/\sqrt3\). These ratios and \(dv\) are unchanged by orbitwise conformal rescaling. The bounds hold for all smooth diagonal triaxial metrics on this disk, with arbitrary anisotropy and mixed signs of its derivative. For the standard orbit action the principal stabilizer acts by distinct sign characters on the three tangent directions and has no invariant tangent vector. Thus the radial direction is orthogonal in a normal-geodesic gauge and the invariant orbit tensor is diagonal. The principal stabilizer and corresponding radial description appear in Bettiol–Krishnan, §3.1. [Primary paper, §3.1](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cag/2019/0027/0003/CAG-2019-0027-0003-a001.pdf#page=7)

A subthreshold diagonal cap must satisfy **both**
\[
 V> V_* = 0.38381065\ldots,\qquad
 y\bigl(\tfrac12\log(8/5)\bigr)>
 \frac{69}{64}-12\sqrt{\frac{207}{131072}}=0.60124242\ldots .
\]
Here \(V_*\) is the exact root given in [E12](E12_AXIAL_MOMENT.md). In particular \(y\le3/5\) throughout excludes the target at every length, even for a positive Robin filling. More precisely \(b\ge867/575=3/2+9/1150\) for that class. With \(y\le1/\sqrt3\) the lower bound is at least \((69/64-1/\sqrt3)^2/(621/4096)=1.654067\ldots\). The short-volume proof comes from an exponentially weighted moment and a nonnegative square. It also gives \(b>2/9\) at every finite \(V\) for the invariant family. A separate unweighted moment requires the \(dv\)-average of \(y\) to exceed \(1-9/[2(34/\sqrt3-12)]\) for strict entry.

For the shape bound divide the metric by \(\ell_j\ell_k\), put \(u=\tfrac12\log(\ell_k/\ell_j),\ c=\cosh(2u),\ d=2\sinh(2u)\), and let \(D=\partial_v\). Its axial Weyl entry satisfies
\[
 6\lambda_i=-(D+2)(D+4)(y-1)+8(c-1)+4d^2/y+4y u_v^2+12c_v,\qquad
 b\ \ge\ \frac1{96}\int_0^V(6\lambda_i)^2\,dv .
\]
The bolt enforces \(y(0)=0,\ y_v(0)=8\). The solution with zero right-hand forcing for \(y-1\) is \(y_0=1+2e^{-2v}-3e^{-4v}\). Its causal kernel \(K=(e^{-2v}-e^{-4v})/2\) and \(K'\) are nonnegative through \(\tfrac12\log2\). Integrating \(K*c_v\) by parts uses \(K(0)=0,\ c(0)=1,\ c\ge1\); hence it has nonnegative sign even when \(u\) oscillates. At \(v_0=\tfrac12\log(8/5)\) one gets
\[
 y(v_0)\ge69/64-\sqrt{96 b I_0},\qquad I_0=\int_0^{v_0}K^2=207/131072 .
\]
The short-volume inequality ensures \(v_0\) exists on a putative strict competitor. For an energy bound valid on the full height-capped class even when \(V<v_0\), use the [unweighted short-interval estimate](../reviews/E16_CAUSAL_READBACK.md). The bolt normalization, transverse regularity and direct endpoint computation of \(E_+-E_-=-5\pi^2\) are checked there and in [E12](E12_AXIAL_MOMENT.md). The two independent computations use the same orientation.

## How far the outer annulus must depart from a round umbilic slice

Use any specified **outer** triaxial region filled by principal orbits, with arbitrary core behind it. Use the conformal gauge in which \(\ell_i\ell_j=1\), and now distinguish the long \(k\) direction on the annulus. Set \(y=\ell_k^2/(\ell_i\ell_j),\ z=y-1,\ u=\tfrac12\log(\ell_j/\ell_i)\), with the ratios here taken before normalization. Use \(dv=\ell_k\,dr/(\ell_i\ell_j)\), increasing outward, with face at \(v=0\) and chosen inner orbit at \(v=-l\). The change of distinguished axis is a cyclic relabeling in the curvature equation on this annulus. The actual core still collapses \(i\). At the face \(z=2,z'=0,u=0,u'=0\).

Put \(p=e^{2v}-e^{4v}\), \(c=\cosh(2u)\), \(d=2\sinh(2u)\), and
\[
 B_l=\big[p z'+(6p-p')z\big]_{v=-l},\qquad
 J_l=\int_{-l}^0p\left\{8(c-1)+4d^2/y+4y u_v^2+12c_v\right\}dv .
\]
Since \(p''-6p'+8p=0,\ p(0)=0,\ p'(0)=-2\), the axial equation gives \(6\int p\lambda_k=-4+B_l+J_l\). Consequently every strict competitor must pass the following test on **every such annulus**:
\[
 |4-B_l-J_l|<12\Big(\int_{-l}^0p^2\Big)^{1/2}<\sqrt6 .
\]
The finite-interval expression follows from Cauchy–Schwarz and the full-side bound \(96b<144\); on the half-line \(\int p^2=1/24\). For a round umbilic starting orbit \(B_l=0\). The condition \(J_l>4-\sqrt6\) then quantifies how much the two short directions must separate along the subsequent transition. Its form requiring only first derivatives has integrand \(4p(d^2/y+y u_v^2)+(40e^{4v}-16e^{2v})(c-1)\) with boundary contribution \(-12p(-l)(c(-l)-1)\). For an exactly biaxial outer annulus \(J_l=0\); the sharp all-core bound and positive comparison family are in the [transition calculation](B06_ROUND_TRANSITION.md).

The same excess also has a positive-square formula with a single lower endpoint correction:
\[
 J_l=-4p(-l)(c(-l)-1)+\int_{-l}^0
 \left\{8e^{4v}(c-1)+4p y\left(u_v+d/y\right)^2\right\}\,dv .
\]
Indeed \(H=8(c-1)+4y(u_v+d/y)^2+4c_v\) and \(8p-4p'=8e^{4v}\). At a round umbilic starting orbit both the jet and endpoint corrections vanish, so a strictly positive quantified amount of anisotropy is necessary. The full smaller block, positive Robin form and actual switched assembly remain necessary for realization. [Independent annular check](../reviews/E19_ANNULAR_DUAL.md)
