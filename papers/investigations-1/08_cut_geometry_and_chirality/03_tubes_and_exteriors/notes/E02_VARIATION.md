# SP4-CUT-TUBE-E02 · variation and the first three untwisted caps

27 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Actual helper model and reasoning effort are unavailable.
Bounded E work from [request R1](../research-progress/handoffs/E02_REQUEST_R1.md),
baseline `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Scope is the functional
of the smooth oriented Riemannian ansatz on \(S^2\times D^2\), with
\(T=4\pi^2\) and \(e_{\rm cap}\) the mean of the Hilbert–Schmidt chiral
energies. The equal-cell comparisons concern \(C^{1,1}\) profiles.

The first row attains \(e_{\rm cap}/\pi^2=16/3\). The second and third
rows reproduce the reported costs on 24 equal proper-length cells. Their
continuum minima with \(F=0\) are \(7.41917470\ldots\) and
\(7.84619264\ldots\). The equal-area 24-cell problems give certified
lower bounds on the equal proper-length mesh costs.

## Analytical variation

Use [parent Section 6, equations (6.1)–(6.3)](../../manuscript/cuts_of_subcritical_conformal_classes.tex)
and write \(A=a(S)>0\), \(f=a'(S)\), \(K=-a''/a\) and
\(q=K+1-2F^2/3\). In the displayed exterior gauge
\(d\phi-\beta\,d\psi\) and cap gauge \(d\phi+b\,d\psi\), fixing
the coordinates and the framing gives \(b(0)=0\), \(b(S)=-\beta\).
Put \(B=b(S)\) with its sign and use the constrained Lagrangian
\[
 L=aG,\qquad
 G=Q+\lambda F,\qquad
 Q=\frac43q^2+4F^2+\frac{16}{135}F^4+\frac23F'^2 .
\]
Here \(\lambda\) multiplies \(\int_0^S aF\,ds-B\) in
\(e_{\rm cap}/\pi^2\). At fixed \(a\), an interior variation of \(F\)
changes the flux to first order, so the scalar flux constraint has full
rank. The variation is taken where \(a>0\) for \(0<s\le S\) and
\(R>0\) on the cap, so these inequalities are inactive. Reversing signed
flux sends \((F,\lambda)\) to \((-F,-\lambda)\).

Set \(P=G_K=8q/3\). Since
\(\partial L/\partial a=G-KP\) and
\(\partial L/\partial a''=-P\), the interior system is
\[
 \begin{aligned}
 P'' &=G-KP, & a''&=-aK,\\
 \frac43(aF')'
 &=a\left[\left(8-\frac{32}{9}q\right)F
       +\frac{64}{135}F^3+\lambda\right], & b'&=aF .
 \end{aligned}
\]
Primes in this section denote \(s\)-derivatives. In the \(b\) formulation
with \(F=b'/a\), \(b\) is cyclic. Its momentum, with \(Q\) as the
unaugmented density, is
\[
 Q_F-\frac{1}{a}\frac{d}{ds}\left(a Q_{F'}\right)=-\lambda .
\]
This is the flux first integral with the sign chosen above. The absence of
explicit \(s\) in \(L\) gives the conserved quantity
\[
 \mathcal H=a'P'-a''P+\frac43aF'^2-aG
            =a'P'+a\left(KP+\frac43F'^2-G\right).
\]
The first variation at fixed endpoints in \(s\) has boundary term
\(P'\delta a-P\delta a'+\tfrac43 a F'\delta F\). At the moving seam
\(a(S)=A\), \(a'(S)=f\) and \(F(S)=0\) remain fixed. The variations at
fixed argument there are \(-a'(S)\delta S\), \(-a''(S)\delta S\) and
\(-F'(S)\delta S\). Adding \(L(S)\delta S\) gives
\(-\mathcal H(S)\delta S\), so a free positive length requires
\(\mathcal H=0\). The seam imposes no independent value on \(K(S)\) or
\(F'(S)\).

At the pole \(\delta a(0)=\delta a'(0)=0\), while the value of \(F\)
can vary. The natural condition is
\(\lim_{s\downarrow0}aF'=0\) when the boundary momentum has a limit.
For a smooth pole, \(a\) has an odd smooth extension with \(a'(0)=1\),
and \(b\) is smooth even with \(b(0)=0\). Thus \(K,F\) extend evenly,
\(K'(0)=F'(0)=0\), and the pole already gives \(\mathcal H(0)=0\).
In particular the smooth radial \(F\)-equation at the pole is
\[
 \tfrac83 F''(0)
  =\left(8-\tfrac{32}{9}q(0)\right)F(0)
   +\tfrac{64}{135}F(0)^3+\lambda .
\]
The pole prescribes neither \(F(0)\) nor \(K(0)\).

For \(F=0\), the \(F\)-equation gives \(\lambda=0\) and the \(a\)-equation
becomes \(2K''=1-K^2\). It has the scalar first integral
\((K')^2-K+K^3/3=\mathrm{const}\). The conserved quantity takes the form
\(\mathcal H=\tfrac43[2a'K'+a(K^2-1)]=\tfrac83(a'K'-aK'')\)
on the system. In particular \(\mathcal H=0\)
gives \(K'/a=\mathrm{const}\) on \(s>0\).

## Exact continuum comparison for \(F=0\)

Let \(x(s)=\int_0^s a\,ds\), \(X=x(S)>0\), \(u(x)=a(s(x))^2\),
\(U=A^2\), \(D=1-f\), \(C=1+f\). Then
\(u_x=2a'\), \(u_{xx}=-2K\), and
\[
 u(0)=0,\qquad u_x(0)=2,\qquad u(X)=U,\qquad u_x(X)=2f .
\]
For fixed \(X\), the endpoint constraints are equivalent to the two
moments
\[
 \int_0^X K\,dx=D,\qquad
 \int_0^X (x-X/2)K\,dx=(U-CX)/2.
\]
The energy is \((4/3)\int_0^X (1+K)^2\,dx\). Projection onto the span
of \(1,x-X/2\) gives the exact minimizer at fixed \(X\) if the resulting
\(u\) is positive for \(0<x\le X\). Its curvature and energy are
\[
 K_*(x)=\frac D X+\frac{6(U-CX)}{X^3}(x-X/2),\qquad
 J_3(X)=\frac43\left[X+2D+\frac{D^2}{X}
                    +\frac{3(U-CX)^2}{X^3}\right].
\]
For any fixed-area competitor the energy excess over \(J_3(X)\) is
\((4/3)\int_0^X (K-K_*)^2dx\). Equivalently \(u\) is the
unique cubic with these four endpoint data,
\[
 u(x)=2x+\frac{3U-(4+2f)X}{X^2}x^2
          +\frac{2(CX-U)}{X^3}x^3 .
\]
The positive admissible critical \(X\) calculated below is the unique
minimum over all \(X>0\) for rows 2 and 3. There \(K_*>0\), hence \(u\) is
concave and \(u(x)\ge Ux/X>0\) for \(x>0\). Recover
\(s(x)=\int_0^x u^{-1/2}dt\), a finite integral since \(u(x)=2x+O(x^2)\),
and \(a=\sqrt u\). The cubic gives a smooth pole, and \(R=2(K+1)>0\)
on the cap.

For the hemisphere row there is also a stronger statement in the full
circle ansatz. The integrand satisfies the exact identity
\[
 Q=\tfrac{16}{3}K+\tfrac43(q-2)^2
             +\tfrac49 F^2+\tfrac{16}{135}F^4+\tfrac23 F'^2 .
\]
Since \(\int aK\,ds=D\), this proves
\(e_{\rm cap}\ge (16/3)\pi^2(1-f)\) for every admissible cap in (6.2).
Equality forces \(F=0\) and \(K=1\). With \(A=1,f=0\) the unique cap
profile is \(a=\sin s\), \(S=\pi/2\), and \(X=1\).

## Exact comparison on relaxed 24-cell meshes

A piecewise constant \(K\) on \(N\) proper-length cells is piecewise
constant on the \(N\) induced area cells. For any such partition of
\([0,X]\), write \(h_i\) for cell lengths in \(x\). In the second moment
constraint, \(x-X/2\) may be replaced on each cell by its mean. The squared
norm of this projected function is
\((X^3-\sum_i h_i^3)/12\). Applying the same projection argument gives
\[
 \frac{e_{\rm cap}}{\pi^2}\ge
 \frac43\left[X+2D+\frac{D^2}{X}
   +\frac{3(U-CX)^2}{X^3-\sum_i h_i^3}\right]
 \ \ge\ J_\gamma(X),
 \qquad
 J_\gamma(X)=\frac43\left[X+2D+\frac{D^2}{X}
  +\frac{\gamma (U-CX)^2}{X^3}\right],\qquad
 \gamma=\frac{3}{1-N^{-2}} .
\]
The last inequality uses \(\sum_i h_i^3\ge X^3/N^2\).
Equality for freely positioned cells is attained on an equal-area
partition by setting \(K\) to \(D/X+2\gamma(U-CX)(x-X/2)/X^3\) at each
cell's midpoint. At the minimizing \(X\) for these rows this gives \(K>0\), so the
concavity and positivity argument again applies. The finite cell competitor
has \(a,a'\) continuous and \(a''\) bounded, as required for the
\(C^{1,1}\) comparison.

## Certified and floating results

For \(\gamma=3\) and \(\gamma=1728/575\) the sign of \(J_\gamma'(X)\)
is that of
\[
 p_\gamma(X)=X^4-(D^2+\gamma C^2)X^2
              +4\gamma UCX-3\gamma U^2.
\]
For rows 2 and 3 each of the five Bernstein coefficients of
\(p_\gamma\) on \([0,1]\) is strictly negative, whereas
\(p_\gamma''>0\) for \(x\ge1\), \(p_\gamma(1)<0\), and
\(p_\gamma\to+\infty\). This proves there is exactly one positive
root. The [comparison script](../numerics/e02_cap_comparison.py) checks
these signs, brackets the root and encloses \(J_\gamma\) at that root
using exact rational intervals. It bounds \(\pi\) with the alternating
arctangent sums in Machin's identity and checks the bounds on \(\sqrt3\)
by squaring. It also checks positivity of the candidate \(K\) at the
right edge, its minimum for the affine continuum curvature and a lower
bound for the cell-midpoint curvatures. The costs below are in units
of \(\pi^2\). The two minimum columns are certified, and the
equal-area mesh gives the lower bound for the equal proper-length
mesh.

| Case in check_02 | Continuum \(F=0\) minimum | 24 equal-area cells minimum | 24 equal proper-length cells, floating | Recorded check_02 |
| --- | ---: | ---: | ---: | ---: |
| \(\theta=\pi/2,\ell=2\pi\) | \(16/3\) exactly | \(16/3\) exactly | 5.3333333333 | 5.3333 |
| \(\theta=\pi/3,\ell=3.8\) | \([7.41917470,7.41917471]\) | \([7.41950973,7.41950974]\) | 7.4196423197 | 7.4196 |
| \(\theta=\pi/4,\ell=2.3\) | \([7.84619264,7.84619265]\) | \([7.84716627,7.84716629]\) | 7.8474693423 | 7.8475 |

The floating solve of the interior discrete stationarity equations uses the
constant-\(K\) transfer matrix and exact cell integration formulas
evaluated in floating point. Python 3.10.0 and NumPy 1.25.1 give maximum
first-order and endpoint residuals \(8.9\cdot10^{-16}\),
\(4.2\cdot10^{-14}\), \(2.9\cdot10^{-13}\), respectively. The last
two equal proper-length costs exceed the continuum values by about
\(4.68\cdot10^{-4}\) and \(1.28\cdot10^{-3}\). The independent
stationarity solve reproduces all three values to the printed
precision. Global minimality
on the equal proper-length mesh remains unproved for rows 2 and 3.
The continuum claims for those rows concern \(F=0\), the restriction
made by check_02 when the specified flux is zero. Allowing nonzero
\(F\) of zero signed mean in those rows remains a separate problem.

## Source record

Checked locally on 27 November 2026. The variation imports only the explicit
functional and metric matching data of the
[parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex),
Sections 5–6, SHA-256
`ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`.
Read the
[original symbolic check](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_01_kk_cap_energy.py)
(`5698a20161157b2736e1a4f4fe07da54b6f6ad180e6546ecf3faf0f1aeddc4cd`)
for the curvature normalization, and
[check_02](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_02_cap_costs.py)
(`9c0e9056143dc9bb4cd717078ef91949ecc23eea8325b9d8ba3a4f1179b616e2`)
and its
[recorded output](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/output.txt)
(`62caf15a5bc45539c9ac4009ace7cd53af53a7f7728c50b38d3c4dc536570347`)
for the three cases and the 24-cell discretization. The comparison used
the independent script above.
