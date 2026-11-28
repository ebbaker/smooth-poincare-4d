# WIN-E17 · Independent replay of the volume-centered spectral bound

28 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The [request](../research-progress/handoffs/REQUEST_REPLAY_BALANCE_R1.md)
specifies a non-author GPT-6.2 Sol / ultra dispatch. Independent serving
metadata are unavailable. The checkout is
`86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`. The reviewed
[spectral proof](../notes/BALANCED_SPECTRAL_BOUND.md) has SHA-256
`8dff6f0d96d781987d247243c6cd67704b1ea21c61ef810fc0f1409cb1a0250b`. The
[E16 control](../notes/E16_SPECTRAL_CONTROL.md) has SHA-256
`7a0725a4ad2c2e31c7cd515152a3108ac6fb49c5f94401c61d8c118cd474a45f`.
This is a written independent replay, with no formal verification.

**Disposition.** The bound with denominator \(408L\), round equality,
and existence of centered generating pencils on every smooth metric on
standard \(S^4\) pass the comparison. The large-eigenvalue theorem gives
standard smooth metrics on which this bound is as large as prescribed
for all centered pencils. Its proof gives qualitative parameter choices.
The positive spectral comparison therefore concerns the chosen metric.

## Kernel jet and target normalization

Use the right quaternionic positive half-spin line on the smooth closed
oriented Riemannian homotopy four-sphere. Write \(E_x\) for evaluation of
a generating pair, \(B_x\) for the corresponding twistor evaluation,
\(m=\|E_x\|_{\rm op}\), \(K=\ker E_x\), and \(f(x)=K\). For a unit
\(k\in K\), the residue convention is
\(R_g(E)=\int |B_xk|^4/m^4\,dV_g\). This is one twelfth of the log
coefficient for the probability angular average.
[Angular integral](../notes/E14_ANGULAR_RESIDUE.md) · [Residue convention](../notes/PENCIL_RIGIDITY.md)

The Hopf identification sends \([q:1]\) to
\((2q,|q|^2-1)/(1+|q|^2)\), with norm one in \(\mathbb H\oplus\mathbb R\).
Differentiation at \(q=0\) gives length factor 2 on a tangent map from
\(K\) to \(K^\perp\) evaluated at a unit \(k\). The factor holds at every
line because the Hopf coordinates are those of the traceless Hermitian
matrix \(2P_K-I\), and its norm from half the real trace of its square is
preserved by \(\mathrm{Sp}(2)\) conjugation. This matches the unit sphere
of volume \(V_0=8\pi^2/3\).

Differentiating \(E_y k(y)=0\) for a local unit lift of \(f\) gives
\(E_x(df(X)(k))=-\nabla_X s_k\), with \(s_k(y)=E_y k\) for the frozen
parameter on the right. On \(K^\perp\), \(E_x\) has length factor \(m\).
Use the decomposition \(\nabla_X s_k=c(X)h+(P_gs_k)(X)\), where
\(h=-D_gs_k/4\). Relative to oriented orthonormal frames it follows that
\(A=df=S+N\), with \(S\) either zero or a similarity with dilation
\(2|h|/m\), and \(|N|=2|B_xk|/m\). These are real Hilbert–Schmidt
norms. The two summands are orthogonal because
\[
\sum_i \operatorname{Re}\langle c(e_i)h,(P_gs_k)(e_i)\rangle
=-\operatorname{Re}\left\langle h,\sum_i c(e_i)(P_gs_k)(e_i)\right\rangle=0.
\]
They are independent of the right phase of \(k\), since both the
tangent-map evaluation and the spinor derivative acquire that phase.
The nonzero Clifford similarities have a common determinant sign
\(\sigma\). Locally their orientation is that of the Clifford model
in oriented spin frames. Nonzero negative spinors, unit quaternionic
changes of frames, and projective unitary frame choices vary in
connected spaces. The minus sign from differentiating evaluation
preserves orientation in dimension four. Only \(|\deg f|=1\) enters the
estimate, as follows from \(f^*Q\cong S_g^+\) and the Chern numbers of
the quotient line and the closed spin line.
[Degree and conventions](../notes/E13_SPINOR_PENCIL.md#conventions-and-kernel)

## Quantitative estimate

Set \(F(C)=|C|^4-16\sigma\det C\). At a similarity \(S=aU\),
\(U\) orthogonal with determinant sign \(\sigma\), one has
\(|S|^2=4a^2\), \(\operatorname{cof}S=\sigma a^2 S\), and
\(F(S)=DF(S)=0\). Both vanish at \(S=0\). Direct differentiation gives
\(D^2(|C|^4)[N,N]=4|C|^2|N|^2+8\langle C,N\rangle^2\), at most
\(12|C|^2|N|^2\). The second determinant derivative consists of twelve
ordered pairs of columns replaced by columns of \(N\). The absolute
value of each determinant is at most \(|C|^2|N|^2\) by the product of
column norms. Hence \(|D^2F(C)[N,N]|\le204|C|^2|N|^2\). On the segment
\(C=S+tN\), orthogonality gives \(|C|\le|A|\). Integrating the Taylor
weight \(1-t\) gives \(|F(A)|\le102|A|^2|N|^2\).

Let \(H=(\int|A|^4\,dV_g)^{1/2}\). The signed determinant integrates to
\(\deg(f)V_0\) even with critical points. Also
\((\int|N|^4\,dV_g)^{1/2}=4R_g(E)^{1/2}\), so Cauchy–Schwarz gives
\[
H^2\le16 V_0+408 H R_g(E)^{1/2}.
\]
If each of the five coordinates of \(f\) has mean zero, the scalar
Rayleigh inequality, summed over the coordinates, gives
\(\lambda_1 V\le\int|df|^2\,dV_g\le\sqrt V H\), using \(|f|^2=1\).
Thus \(H\ge L=\lambda_1\sqrt V>0\). The function
\(t-16V_0/t\) has derivative \(1+16V_0/t^2>0\). Dividing and taking the
positive part gives precisely
\[
R_g(E)^{1/2}\ge \frac{(L^2-16V_0)_+}{408 L}.
\]

The centering hypothesis uses volume without a pencil weight. In the
Hopf projector convention \(E_x^*E_x=m^2(I-(2P_K-I))/2\), so an
identity quaternionic \(L^2\) Gram matrix enforces the mean-zero
condition with weight \(m^2\). Conversely, for a centered kernel map,
replace \(E\) by \(\sqrt{2/V}\,m^{-1}E\). Its pointwise Gram operator
becomes \((2/V)P_{K^\perp}\), which integrates to \(I\). This verifies
E16's simultaneous normalization. For a concrete difference, start with
the orthonormal round twistor generators and their round kernel map
\(f_0\). Choose \(g=w^2g_{\rm rd}\), where \(w^4=1+\epsilon(f_0)_5\)
with \(0<\epsilon<1\), and multiply the unitary spin transports of both
generators by \(w^{-2}\). The volume factor \(w^4\) cancels the factor
\(w^{-4}\) in every pointwise Gram entry. The kernel map is still \(f_0\),
whose fifth-coordinate mean integral in \(g\) is \(\epsilon V_0/5>0\).

## Standard sphere controls and primary theorem

For the round generators the kernel map is \([-x:1]\) in stereographic
coordinates. The Hopf chart pulls back the unit target metric to
\(4|dq|^2/(1+|q|^2)^2\), so the map is an isometry from the unit round
domain. Its volume means vanish and \(H=4\sqrt{V_0}\). The generators
solve the twistor equation, so \(R=0\). The coordinate eigenvalue is 4.
The integrated scalar Bochner identity
with \(\operatorname{Ric}=3g_{\rm rd}\) and the trace bound
\(|\nabla^2 v|^2\ge(\Delta v)^2/4\) show that every positive eigenvalue
is at least 4. Therefore \(L=4\sqrt{V_0}\) and the estimate agrees with
the attained zero. [Round generators and their kernel](../notes/E10_ROUND_INSERTION.md)

For any smooth metric on standard \(S^4\), the smooth metric comparison
of oriented spin frames identifies the positive half-spin bundles.
It therefore supplies a generating pencil with the same diffeomorphic
kernel map \(f_0\). Push normalized volume forward by \(f_0\) to the
nonatomic probability \(\mu\) on the unit target. For \(|a|<1\) in
\(\mathbb R^5\), put
\[
\Phi_a(y)=a+(1-|a|^2)\frac{y+a}{|y+a|^2},\qquad |y|=1.
\]
This preserves the sphere, is conformal by inversion, and has inverse
\(\Phi_{-a}\). If \(a\to b\) on the unit boundary, then \(\Phi_a(y)\to b\)
for every \(y\ne-b\). Thus \(a\mapsto\int \Phi_a\,d\mu\) extends
continuously to the identity on the boundary by dominated convergence.
If it omitted zero, normalizing it would retract the ball onto its
boundary, a contradiction by homology. Choose a zero \(a\). The
isotopy \(\Phi_{ta}\circ f_0\) induces a smooth quaternionic bundle
isomorphism between the two pullbacks of \(Q\), obtained by parallel
transport in a quaternionic connection along the isotopy. Compose the
quotient at \(\Phi_a\circ f_0\) with this isomorphism and the original
identification with \(S_g^+\). This gives a generating pair whose kernel
map is the centered diffeomorphism \(\Phi_a\circ f_0\). E16 instead
transports the generators along the source isotopy \(f_0^{-1}\circ
\Phi_{ta}\circ f_0\). This also realizes the required map because
parallel transport is an invertible quaternionic map on each fibre.

I independently checked Theorem 1 on p. 905 and its proof through p.
906 in the published *Proceedings of the American Mathematical
Society* scan uploaded by coauthor Jozef Dodziuk. In the used case of
a smooth compact connected boundaryless four-manifold, for each
\(T>0\) it gives a smooth metric \(g\) of volume one with \(\lambda_1(g)>T\)
for the scalar Laplacian on functions. The proof uses a sphere metric,
small-ball excision, Neumann spectral approximation, smooth metric
collapse on the complement, and final volume normalization. Its
smallness and approximation choices are quantitative premises to
check for an individual proposed metric. This replay uses the theorem
as a published import. [Colbois–Dodziuk, 122 (1994), 905–906, Theorem 1](https://www.researchgate.net/profile/Jozef-Dodziuk/publication/265433300_Riemannian_Metrics_with_Large_l_1/links/54e5f64e0cf2cd2e028b542e/Riemannian-Metrics-with-Large-l-1.pdf)

In dimension four \(L\) is invariant under constant metric rescaling
and equals \(\lambda_1\) at volume one. Thus on standard \(S^4\) an
arbitrarily large lower bound on the centered-pencil residue is
compatible with smooth standardness, while the round metric attains
zero. The theorem supplies qualitative existence of metrics with
prescribed spectral thresholds. A positive spectral certificate on
an individually specified metric still needs a certified lower
enclosure for \(\lambda_1\sqrt V\) above \(4\sqrt{V_0}\). The comparison
supplies no estimate uniform over all smooth metrics of a candidate
smooth type.
