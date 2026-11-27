# SP4-CUT-TUBE-E60 — Marked arcs in one prism Dirichlet cell

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. [Frozen E60 request](../research-progress/handoffs/E60_REQUEST_R1.md), baseline bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Requested helper setting gpt-6.2-sol/ultra. Actual helper model and effort are unavailable. Inputs are the [E39 group and frame](E39_PRISM_FILLINGS.md), [E48 surgery lattice](E48_LINK_SURGERY.md), [E54 underlying slopes](E54_UNDERLYING_SLOPES.md), and [E58 Hopf check](E58_HOPF_PRISM_KNOT.md). The finite interval calculation is replayed by [e60_prism_pattern.py](../numerics/e60_prism_pattern.py).

For the spherical Dirichlet cell about the normalized quaternion \(2+3i+5j+7k\), the original singular knot is represented by five oriented arcs in self-paired faces. The regular surgery knot is represented by two oriented chords, through one distinct face pair and one self-paired face. The self-paired face contains an old singular arc separating its two regular crossing points. The tables and exact half-spaces below specify the marked link in this fundamental cell, including its peripheral helix. The filled orbifold groups are not computed by this packet.

## Exact cell and labels

Put \(p=(2,3,5,7)\), \(z=e^{2\pi i/17}\), and label group elements \(g=(A,r,b)\), acting by \(q\mapsto A q(z^rj^b)^{-1}\), with \(r\in\mathbb Z/17\), \(b=0,1\). There are 24 left values \(A\): the eight signed basis units and the 16 quaternions \((\pm1\pm i\pm j\pm k)/2\). A label of four signs specifies the latter in that order. The group multiplication and inverse are
\[
(A,r,b)(C,s,c)=((-1)^{bc}AC,\ r+(-1)^b s,\ b+c\bmod2),\qquad
(A,r,b)^{-1}=((-1)^b\bar A,\ (-1)^{b+1}r,\ b).
\]
The normalization of \(p\) does not affect any inequality. The closed cell and each of its face identifications are
\[
D=\{q\in S^3:q\cdot(p-gp)\ge0\text{ for every }g\in\Lambda\},\quad
F_g=D\cap\{q\cdot(p-gp)=0\},\quad
F_g\longrightarrow F_{g^{-1}},\quad q\longmapsto g^{-1}q.
\]
The checker certifies that \(p\) has trivial stabilizer. The full list of inequalities suffices to reconstruct every face, including faces disjoint from the marked link. All of \(D\) lies in \(p\cdot q>0\): if \(p\cdot q=0\), both \(gp\) and \(-gp\) occur, forcing all products \(gp\cdot q=0\), contrary to the spanning by four left quaternionic translates of \(p\). In the gnomonic section \(p\cdot x=1\), the cell is a compact convex polytope and all the arcs below are straight segments. Compactness also follows there from the six bounding inequalities using \(\pm ip,\pm jp,\pm kp\).

The regular circle \(R(A,r)\), \(A\in\{1,i,j,k\}\), is the translate by \((A,r,0)\) of \(C\) from E39. Its oriented spanning pair before translation is \(u=1-nj,\ v=uj\) with \(n=(i+j+k)/\sqrt3\). The singular circle \(S(A,r)\), \(A\in\{\pm i,\pm j,\pm k\}\), is pointwise fixed by \(\tau=(A,r,1)\). It is oriented by \(q'=q B\) for \(B=z^rj\). Its spanning pair is \(u=c-AcB,\ v=uB\) with \(c=1\) except \(c=i\) at \((A,r)=(-j,0)\). These pairs have orthogonal equal-norm terms and specify all 68 regular and 102 singular circles.

For every pair set \(x=(u\cdot p)u+(v\cdot p)v\) and \(y=(u\cdot p)v-(v\cdot p)u\). Then \(x+t y\) parametrizes the positive-hemisphere part of the oriented circle up to positive scale. It gives the points in \(D\) exactly where
\[
 a_g+b_g t\ge0,\qquad
 a_g=(p-gp)\cdot x,\quad b_g=(p-gp)\cdot y.
\]
The constant \(p\cdot y=0\), so this parametrization is affine in the gnomonic section. In the table \(g_{\rm lo},g_{\rm hi}\) give the exact endpoints \(-a_g/b_g\). At each regular endpoint the only tight nonidentity constraint is the listed one, so these endpoints lie in face interiors. The singular arc on \(\tau\) lies in its face interior away from endpoints. At each singular endpoint the three tight nonidentity constraints are \(\tau,g,\tau g\); they are independent on the affine section, so each endpoint is a vertex. To see the paired equality, \(q\in\operatorname{Fix}\tau\) gives \(q\cdot gp=q\cdot\tau gp\).

| Arc | \(g_{\rm lo}\) | \(g_{\rm hi}\) | Approximate oriented parameter interval |
| --- | --- | --- | --- |
| \(R(1,10)\) | \((-k,9,1)\) | \((\texttt{-+--},11,0)\) | \([-0.106817,\ 0.161382]\) |
| \(R(k,16)\) | \((\texttt{--++},6,0)\) | \((-k,9,1)\) | \([-0.157646,\ 0.101168]\) |
| \(S(+j,5)\) | \((-i,4,0)\) | \((\texttt{-+--},11,0)\) | \([-0.144169,\ -0.094718]\) |
| \(S(-j,14)\) | \((\texttt{-+--},11,0)\) | \((+i,13,0)\) | \([0.138930,\ 0.168510]\) |
| \(S(+k,0)\) | \((\texttt{--++},6,0)\) | \((-1,8,0)\) | \([-0.362392,\ -0.151811]\) |
| \(S(+k,1)\) | \((-1,9,0)\) | \((+i,13,0)\) | \([-0.176282,\ 0.392546]\) |
| \(S(-k,9)\) | \((-i,4,0)\) | \((\texttt{--++},6,0)\) | \([-0.399125,\ 0.385378]\) |

For each of the other 163 circles, the checker verifies one strict lower bound greater than one strict upper bound, so the statement excludes isolated points as well. For the seven arcs it verifies both parameter signs, endpoint ordering and the strict positivity of every other inequality at both endpoints. These are outward-rounded interval tests with integer endpoints at scale \(10^{45}\). Quaternion operations are polynomial, \(\sqrt3\) is bracketed by integer square roots, and the trigonometric data come from the alternating series in Machin's formula for \(\pi\) and from Taylor enclosures. Floating point only proposes the two witnesses in each excluded case. The assertions verify those witnesses independently and check the determinant at each singular endpoint.

## Identifications and peripheral longitude

Traverse every arc from its lower to its upper endpoint. Left-multiplying an endpoint's tight-label set by \(g^{-1}\) computes the tight-label set at its paired point on \(F_{g^{-1}}\). Apply the same conjugations to the right and left axes of its circle. The checker uses these two attributes together to identify the paired endpoint; the regular endpoints on their common self-face have the same tight-label set but lie on different circles. This gives the singular cycle
\[
S(+j,5)\ \longrightarrow S(+k,0)\ \longrightarrow S(+k,1)\
 \longrightarrow S(-k,9)\ \longrightarrow S(-j,14)\ \longrightarrow S(+j,5).
\]
Each of the five open singular arcs is the fixed-line segment of its self-paired face. The five selected upper faces concatenate in the displayed order to the developed element \((+j,0,0)\), modulo the initial isotropy \(\tau=(+j,5,1)\). On the initial marked fixed circle write \(B=z^5j\), \(q=q_0u\), \(q_0Bq_0^{-1}=j\). In tangent and normal angles \((x,\theta)\) built using left multiplication by \(e^{B\theta}\) on the perpendicular two-plane, the developed element shifts \((x,\theta)\) by \((\pi/2,\pi/2)\), while \(\tau\) shifts by \((0,\pi)\). These two shifts describe the peripheral lattice near the old singular knot. In particular the underlying positive meridian has deck image \(\tau\), and the indicated longitude has image \((+j,0,0)\). Changing one face choice by its fixed half-turn adds a meridian to that longitude representative.

For the regular cycle the upper end of \(R(1,10)\) goes to the lower end of \(R(k,16)\) across the mutually inverse faces
\[
g_0=(\texttt{-+--},11,0),\qquad g_0^{-1}=(\texttt{--++},6,0).
\]
The upper end of \(R(k,16)\) goes to the lower end of \(R(1,10)\) across the face of \(g_1=(-k,9,1)=g_1^{-1}\). The half-turn \(g_1\) preserves this face, interchanges the two regular endpoints, and fixes the \(S(-k,9)\) diameter. Its restriction to the face is reflection across that diameter, since the fixed two-plane in \(\mathbb R^4\) contributes a line in the affine face. Thus the two regular crossing points are on opposite sides of the old singular strand in that face.

The developed deck element of the positive regular cycle is
\[
 g_0g_1=(\texttt{-+++},3,1)
   =(+1,10,0)\,J^{-1}\,(+1,10,0)^{-1}.
\]
The group word keeps track of the covered circuit. Its meridional choice in the complement comes from the normal coordinate as well. To construct the actual slope \(a+s\mu\) as a path, take a starting point on the developed \(C\) and advance \(x\) by \(\pi/6\) in the coordinates
\[
 q=p_0\big(\cos\rho\, e^{jx}+\sin\rho\, e^{j\theta}i\big),
 \qquad \theta(x)=\theta(0)+(12s-5)x .
\]
Use a fixed small \(\rho>0\), translate the chart to \(R(1,10)\), and follow the two face maps above. The open face margins ensure these same face crossings for sufficiently small \(\rho\). The phase accrual is \(-5\pi/6+2\pi s\), and the endpoint identifies by the developed deck element. In the regular tube the positive meridian is the circle of increasing \(\theta\). This supplies literal representatives of both tested peripheral paths in the marked cell.

The quotient of this convex cell with the stated face maps and arc data is a finite geometric description of \((|O|,S,\ell)\), with branch index two along the first marked curve. To form \(Q_s\) one removes the regular tube and fills along the displayed helix. The unresolved step is a group presentation or a diagram reduction of this specific complemented and filled cell. In particular the two-letter developed deck word lies in \(\Lambda\); treating it as the complete slope relation before retaining the meridian information would discard the distinction between the two surgeries.

The disk from the Hopf proof belongs to the outer solid torus before the marked core transfer. Its two singular intersections have opposite signs. After meridional filling let \(U\) be the dual unknot in \(S^3\). The meridian disk needed for the geometric winding of \(S_0\) lies in \(S^3\setminus\nu U=E\) instead. The winding given by E54 proves that a transverse meridian disk in \(E\) has at least three intersections. The face and arc calculation here does not produce a disk with exactly three. In particular there is no geometric winding upper bound from the algebraic slope alone.
