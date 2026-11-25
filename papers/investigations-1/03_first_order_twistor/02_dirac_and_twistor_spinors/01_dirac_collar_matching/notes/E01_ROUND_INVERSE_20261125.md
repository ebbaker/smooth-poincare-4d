# Round cylinder Dirac inverse — SP4-FOT-MATCH-E01

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The exact serving model and reasoning effort are
unavailable. This is an analytic proof for the smooth exact product in
[request revision 1](../research-progress/handoffs/E01_REQUEST_20261125.md).

## Operator and norms

Let \(Y=S^3\) have sectional curvature one and let \(Z_L=[0,L]\times Y\)
have the Riemannian product metric, product orientation and product spin
structure, with \(L\ge2\). Use the DIR §2.2 convention
\(c(X)^2=-|X|^2\) and \(D=\sum_i c(e_i)\nabla_{e_i}\).
For \(n=+\partial_t\), identify the output of \(D^+\) with the source via
\(c(n)^{-1}=-c(n)\) and parallel transport the spin bundle in \(t\).
The product has no normal-connection or mean-curvature term. On positive
half-spinors this gives
\[
 L_0=c(n)^{-1}D^+=\partial_t+A,\qquad
 A=\sum_{a=1}^{3}(-c(n)c(e_a))\nabla^Y_{e_a}.
\]
The Clifford action \(-c(n)c(X)\) and slice spin connection give the
intrinsic spherical Dirac operator in the convention fixed by this
formula. The choice of sign convention for the odd-dimensional action
does not affect the spectrum as a set. Use the same \(n\) at both ends.
The boundary pairing will account for the outward normals.
[DIR §2.2](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L205)

The self-adjoint \(A\) has an \(L^2(Y)\) orthonormal eigenbasis
\(\phi_j\) with eigenvalues \(\lambda_j=\pm(3/2+k)\),
\(k\in\mathbb N_0\). Set \(m=3/2\), \(\mu_j=|\lambda_j|\), and let
\(P_\pm\) project onto the eigenspaces of the indicated sign.
The trace norm and the product norms used below are
\[
 \|g\|_{\mathcal T}^2=\||A|^{1/2}g\|_{L^2(Y)}^2
     =\sum_j\mu_j|g_j|^2,\qquad
 Q(u)^2=\|\partial_tu\|_2^2+\|Au\|_2^2,\qquad
 \|u\|_{H^1}^2=\|u\|_2^2+\|\partial_tu\|_2^2+\|\nabla^Yu\|_2^2 .
\]
Here a bulk \(L^2\) norm is over \(Z_L\) with the product measure.
The norm \(\mathcal T\) is an equivalent \(H^{1/2}(Y)\) norm.
The spectral squared norm with weights \((1+\lambda_j^2)^{1/2}\)
lies between \(\|g\|_{\mathcal T}^2\) and
\((\sqrt{13}/3)\|g\|_{\mathcal T}^2\).
The Schrödinger–Lichnerowicz formula on the closed unit round link,
where \(\operatorname{scal}_Y=6\), gives
\(A^2=(\nabla^Y)^*\nabla^Y+3/2\).
Consequently
\[
 \|u\|_{H^1}^2=Q(u)^2-\tfrac12\|u\|_2^2,\qquad
 \tfrac79 Q(u)^2\le\|u\|_{H^1}^2\le Q(u)^2 .
 \tag{1}
\]
The first inequality uses \(\|Au\|_2\ge m\|u\|_2\).
In particular the spatial spectral truncations of \(u\in H^1\) converge
in \(H^1\) by the modal expression for \(Q\).
[Bär, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf)
· [Friedrich–Kim, proof of Theorem 2.6](https://arxiv.org/pdf/math/9906168v1)

For completeness the endpoint estimates are uniform in these norms.
If \(\eta(s)=(1-s)_+\) for \(s\ge0\), apply the fundamental theorem
of calculus to \(\eta(s)|u_j(s)|^2\). At the left endpoint,
\[
 \mu_j|u_j(0)|^2
 \le\int_0^1 \bigl(|u_j'|^2+(\mu_j^2+\mu_j)|u_j|^2\bigr)\,dt .
\]
In fact the right side bounds the integral of
\(\mu_j|u_j|^2+2\mu_j|u_j'||u_j|\). Apply the same estimate in reversed
time at \(L\). The unit strips have disjoint interiors, so summation gives
\[
 \|u(0)\|_{\mathcal T}^2+\|u(L)\|_{\mathcal T}^2
    \le (1+m^{-1})Q(u)^2
    \le \tfrac{15}{7}\|u\|_{H^1}^2 .
 \tag{2}
\]
This defines the endpoint traces by continuity from finite sums and
agrees with the usual Sobolev trace.

## Energy identity and surjectivity

For \(f=L_0u\), set
\[
 G^2=\|P_+u(0)\|_{\mathcal T}^2+\|P_-u(L)\|_{\mathcal T}^2,\qquad
 H^2=\|P_-u(0)\|_{\mathcal T}^2+\|P_+u(L)\|_{\mathcal T}^2 .
\]
Here \(G\) measures the prescribed trace and \(H\) the trace in the
complementary projections. For finite spectral sums, the cross term
in \(\|u'+Au\|_2^2\) is
\(\sum_j\lambda_j\int_0^L (|u_j|^2)'\,dt\). Thus
\[
 \|f\|_2^2
  =Q(u)^2+\langle u(L),Au(L)\rangle_Y
                  -\langle u(0),Au(0)\rangle_Y,\qquad
 Q(u)^2+H^2=\|f\|_2^2+G^2 .
 \tag{3}
\]
The boundary brackets are real \(H^{1/2},H^{-1/2}\) pairings,
\(\langle g,Ag\rangle_Y=\sum_j\lambda_j|g_j|^2\).
Their continuity follows from the \(\mathcal T\) norm. Equations (1)
and (2) extend (3) to \(H^1(Z_L)\). In particular, for homogeneous
prescribed traces the two signed boundary contributions are
nonnegative, and \(\|u\|_{H^1}\le \|L_0u\|_2\).

For \(f\in L^2(Z_L)\) and
\((g_+,g_-)\in P_+\mathcal T\times P_-\mathcal T\), the scalar solutions are
\[
 u_j(t)=
 \begin{cases}
 e^{-\lambda_j t}(g_+)_j+
       \displaystyle\int_0^t e^{-\lambda_j(t-s)} f_j(s)\,ds,
      &\lambda_j>0,\\[4pt]
 e^{-|\lambda_j|(L-t)}(g_-)_j-
       \displaystyle\int_t^L e^{-|\lambda_j|(s-t)} f_j(s)\,ds,
      &\lambda_j<0 .
 \end{cases}
 \tag{4}
\]
Each is \(H^1([0,L])\), solves \(u_j'+\lambda_ju_j=f_j\) and has the
specified value at its selected end. The negative sign in front of
the second integral comes from evolution backward from \(L\).
The finite spectral sums solve the truncated problems, and (1) and
(3) applied to differences make these sums Cauchy in \(H^1\). The
forcing converges in \(L^2\). The traces converge by (2) and by
completeness of \(\mathcal T\). This proves surjectivity of the
bounded map
\[
 H^1(Z_L)\longrightarrow L^2(Z_L)\oplus P_+\mathcal T\oplus P_-\mathcal T,
 \qquad u\longmapsto (L_0u,P_+u(0),P_-u(L)).
\]
Coercivity gives injectivity. For the unique solution, (1) and (3)
give the joint estimate
\[
  \|u\|_{H^1}^2+\|P_-u(0)\|_{\mathcal T}^2+\|P_+u(L)\|_{\mathcal T}^2
       \le \|f\|_2^2+\|g_+\|_{\mathcal T}^2+\|g_-\|_{\mathcal T}^2 .
 \tag{5}
\]
If \(f=0\), the two complementary traces in (5) together have norm
at most \(e^{-3L/2}G\), directly from (4).

## Lift in the unit end strips

For \(g=(g_+,g_-)\), with
\(G^2=\|g_+\|_{\mathcal T}^2+\|g_-\|_{\mathcal T}^2\), let
\[
 Rg(t)=\eta(t)e^{-t|A|}g_+
           +\eta(L-t)e^{-(L-t)|A|}g_- .
\]
It is supported in the two unit strips, has precisely the prescribed
projections there and has zero complementary traces. On a mode of
absolute eigenvalue \(\mu\), write \(s\) for the distance to its
prescribed end. Both signs give the same \(Q\) calculation, with
\(|\partial_s(\eta e^{-s\mu})|\le(1+\mu)e^{-s\mu}\) and
\(|\mu\eta e^{-s\mu}|\le \mu e^{-s\mu}\).
The homogeneous exponentials solve \(L_0u=0\), so \(L_0\) acts on the
lift only through the cutoff derivative, of magnitude at most one.
Using \(\int_0^\infty e^{-2s\mu}\,ds=(2\mu)^{-1}\), we get
\[
 \begin{split}
 Q(Rg)^2&\le \left(1+\tfrac1m+\tfrac1{2m^2}\right)G^2
             =\tfrac{17}{9}G^2,\\
 \|L_0 Rg\|_2^2&\le \tfrac1{2m^2}G^2=\tfrac29 G^2 .
 \end{split}
 \tag{6}
\]
For general data these inequalities follow by applying the bounds
to spectral truncations and taking their \(H^1\) limit. There is no
jump at the strip boundaries because the cutoff is continuous and
vanishes there. The lifting is valid at \(L=2\). For the exact product
one can also obtain the solution as \(Rg+L_{0,\mathrm{hom}}^{-1}(f-L_0Rg)\).

## Hilbert adjoint

On \(L^2(Z_L)\) take the densely defined realization
\[
 \mathcal D=\{u\in H^1:P_+u(0)=0,\ P_-u(L)=0\}.
\]
Its domain contains the compactly supported interior test sections.
It is closed as an unbounded operator by the homogeneous estimate
and trace continuity. The Green formula on \(H^1\times H^1\) is
\[
 (L_0u,v)_2-(u,(-\partial_t+A)v)_2
    =(u(L),v(L))_Y-(u(0),v(0))_Y .
\]
The free test traces lie in \(P_-\) at \(0\) and \(P_+\) at \(L\).
Hence
\[
 \mathcal D^\dagger=\{v\in H^1:P_-v(0)=0,\ P_+v(L)=0\}
 \tag{7}
\]
is contained in the Hilbert adjoint domain. To show equality, let
\(v\) be in the Hilbert adjoint domain, with adjoint value \(w\in L^2\).
Testing against compactly supported scalar multiples of \(\phi_j\)
gives \(-v_j'+\lambda_j v_j=w_j\) distributionally. Thus each
\(v_j\in H^1([0,L])\). Testing the mode again with arbitrary free
endpoint values gives \(v_j(L)=0\) if \(\lambda_j>0\) and \(v_j(0)=0\)
if \(\lambda_j<0\). Time reflection \(Jv(t)=v(L-t)\) sends (7) to
\(\mathcal D\) and conjugates \(-\partial_t+A\) to \(L_0\). The finite
mode projections of \(Jv\) therefore satisfy the homogeneous estimate
with forcing given by the corresponding projections of \(Jw\).
Applying the estimate to differences proves convergence in \(H^1\)
to \(Jv\). This gives \(v\in\mathcal D^\dagger\) and identifies the
full \(L^2\) Hilbert adjoint. Its kernel vanishes, its range is all of
\(L^2\), and its inverse has \(L^2\to H^1\) norm at most one by
conjugation. Equations (5) and (6) also apply to its reversed trace
prescription.

## Evidence scope and inputs

The estimate applies in the unit round reference gauge with fixed
spectral projections. Applying it to a varying metric requires an
operator comparison or a separate varying-slice estimate. Gluing
requires Cauchy trace information for the adjoining pieces. The
exponential transfer estimate for homogeneous solutions describes a
boundary operator, and a lower bound on a spinor in the middle of a
long cylinder requires additional data.

- [Branch plan](../research-plan/PLAN.md#sp4-fot-match-e01) and
  [round model calculation](../brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md#first-test-with-a-reference-round-cylinder),
  repository revision `cec037f`.
- [DIR](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex), §§2.2
  and 3.3 for conventions and the downstream comparison, source
  commit `0a0abde6f5481fc564d8ca159769cb092e1996d2` and verified
  working-file SHA-256
  `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`.
- [Bär](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf),
  J. Math. Soc. Japan 48 (1996), no. 1, 69–83. Theorem 1 was inspected
  in the author-hosted PDF. Theorem 1 is used only for the Dirac
  spectrum on the smooth standard sphere of sectional curvature one.
  [R52 record](../../../brainstorm/notes/DIRAC_AND_PROOF_ARCHITECTURE_20261124.md#5-source-inspection-24-november-2026).
- [Friedrich–Kim](https://arxiv.org/pdf/math/9906168v1),
  arXiv:math/9906168v1, 25 June 1999. The proof of Theorem 2.6 states
  the Schrödinger–Lichnerowicz formula used on the compact spin link.
