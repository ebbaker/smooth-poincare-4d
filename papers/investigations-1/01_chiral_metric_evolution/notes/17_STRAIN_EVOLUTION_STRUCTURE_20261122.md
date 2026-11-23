# SP4-CME-E15 — Exact strain evolution and its principal structure

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This fixed derivation follows the [B14 decision][decision] and
[frozen request][request]. The [return][return] records input identities.

The principal strain operator is \(\mathscr L_Q\) itself in the
instantaneous reconstructed metric. The inverse strain map commutes
with \(\mathscr L_Q\), so the coefficient is self-adjoint in the
ordinary Frobenius pairing. The first spatial commutator uses
Ricci and the internal curvature action. The internal divergence
vanishes and \(W^-\) does not enter this commutator.

## Setting and exact time derivative

Let \(A(t)\) be a smooth solution on its definite interval on a
smooth oriented real four-manifold. Use the positive curvature
plane and the round-compatible self-dual sign. The internal bracket
is \([e_i,e_j]=\epsilon_{ijk}e_k\), with
\(\delta_{ij}=-2\operatorname{tr}_{\mathbb C^2}(e_ie_j)\).
Fix \(K>0\) and use \(F=F_A=-KS\Sigma\),
\(S=Q^{1/2}>0\), \(q=Q-I\), \(\operatorname{tr}Q=3\),
\(F_i\wedge F_j=Q_{ij}\mu\),
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}\), and
\(\mu=2K^2dV_{\widehat g}\).
Write \(\nabla=\nabla^A\) for the full spatial connection using
\(A\) on internal factors and the instantaneous Levi–Civita
connection of \(\widehat g\) on base factors. Put
\(\Delta_A=\nabla^a\nabla_a\) with nonpositive Laplacian
sign. All norms use \(\widehat g\) on base slots and the
Frobenius or Euclidean norm on the indicated internal slots.
Time components below are in fixed base coordinates and a
time-independent orthonormal internal frame.

Use the unadjusted Fine flow in the manuscript clock. With
\(v=A_t\), \(X_c=\nabla_c Q\), and
\(C_c=X_c-\tfrac13\operatorname{tr}(QX_c)I\), the flow
and the exact \(Q\) calculation give
\[
\begin{split}
v_b&=4C^a F_{ab},\\
Q_t&=\mathscr L_Q(\Delta_A Q)+\mathcal N,\qquad
\mathscr L_Q(H)=2(QH+HQ)-\tfrac43\operatorname{tr}(QH)Q .
\end{split}
\]
Here \(\mathcal N\) is the full remainder of E02A. In an
instantaneous orthonormal frame, with \(\Gamma^+\) transported to
\(E\) by \(\Sigma/\sqrt2\), write \(b=A-\Gamma^+\) and
\(\Xi_a=2[\nabla_a S,S]+4S\operatorname{ad}(b_a)S\). Then
\[
\mathcal N=-24K\sqrt{\det Q}\,q
+\sum_a\left(4X_a^2-\tfrac43\operatorname{tr}(QX_a)X_a+
     [X_a,\Xi_a]\right)-\tfrac43|X|^2 Q .
\]
[E02A exact \(Q_t\) and \(v\)][qflow] ·
[Fine v2, Proposition 4.2, eq. (4.1)][fine].

On \(\operatorname{Sym}^2_0 E\) define the strain map and its inverse
\[
G_Q(H)=\tfrac12(S^{-1}HS^{-1})_0,\qquad
M_Q(V)=2SVS-\tfrac23\operatorname{tr}(QV)Q .
\]
In fact \(G_Q(M_Q(V))=V\) since \(S^{-1}QS^{-1}=I\), and
\(\operatorname{tr}M_Q(V)=0\) since \(\operatorname{tr}Q=3\).
The maps act on a finite-dimensional space of equal source and
target dimension, so they are inverses. In particular
\(T_c=G_Q(X_c)\) and \(X_c=M_Q(T_c)\).
[E03A strain and inverse][strain].

Write \(U=S^{-1}\) for the inverse square root and let
\(\mathcal S_S(Z)=SZ+ZS\). The time derivative is
\[
S_t=\mathcal S_S^{-1}(Q_t),\qquad U_t=-U S_t U.
\]
The first formula differentiates \(S^2=Q\); all eigenvalues of
\(\mathcal S_S\) are \(s_i+s_j>0\), where \(s_i\) are the
eigenvalues of \(S\). The full time derivative of \(X_c\) is
\[
\partial_t X_c=\nabla_c Q_t+[\operatorname{ad}(v_c),Q] .
\]
This follows directly by differentiating
\(X_c=\partial_c Q+[\operatorname{ad}(A_c),Q]\).
There is no Christoffel symbol on a base slot of \(Q\),
and the output index \(c\) is a fixed lower coordinate index.
Since the trace-free projection uses only the time-independent
internal metric, the exact strain equation by the chain rule is
\[
\boxed{\displaystyle
\partial_t T_c
=G_Q\!\left(\nabla_cQ_t+[\operatorname{ad}(v_c),Q]\right)
-\tfrac12\bigl(U S_t U X_c U+U X_c U S_t U\bigr)_0 .}
\tag{1}
\]
Both inverse-square-root terms are retained. The right-hand
side uses the exact \(Q_t,v\) given above.

The evolving metric still enters every spatial contraction. For
example in these fixed coordinates
\[
\partial_t|T|^2
=2\widehat g^{cd}\langle\partial_t T_c,T_d\rangle
+(\partial_t\widehat g^{cd})\langle T_c,T_d\rangle .
\]
Equation (1) differentiates the tensor components prior to
contracting. A time-dependent base frame adds its base frame
derivative. In an internal frame rotated by a time-dependent
\(g\), write \(\omega_t=g^{-1}\partial_tg\) in the defining
representation. Then the temporal derivative of an endomorphism
is \(\partial_t+[\omega_t,\,\cdot\,]\) in that frame. The mixed
curvature velocity is \(\partial_t A_c-\nabla_c\omega_t\),
using the same representation on \(A_c\). This gives the
covariant form of (1). No time-dependent base diffeomorphism or
added gauge term occurs in the fixed calculation.

## One derivative of the rough Laplacian

Use curvature conventions
\([\nabla_c,\nabla_a]Q=[\operatorname{ad}(F_{ca}),Q]\)
and, on base covectors,
\([\nabla_c,\nabla_a]\omega_b=-R^d{}_{bca}\omega_d\).
Here \(g^{ab}R^d{}_{bca}=\operatorname{Ric}_c{}^d\) and
the round sign is
\(R_{ca e b}=K(g_{ce}g_{ab}-g_{cb}g_{ae})\).
Set \(\mathcal F_{ca}=\operatorname{ad}(F_{ca})\).
At an evaluation point in base normal coordinates, metric
compatibility and torsion freeness give
\[
\begin{aligned}
\nabla_c\Delta_A Q-(\Delta_A X)_c
&=g^{ab}\bigl([\nabla_c,\nabla_a]X_b+
              \nabla_a(\nabla_cX_b-\nabla_bX_c)\bigr)\\
&=g^{ab}\bigl([\mathcal F_{ca},X_b]-R^d{}_{bca}X_d
             +\nabla_a[\mathcal F_{cb},Q]\bigr)\\
&=-\operatorname{Ric}_c{}^a X_a
   +2[\operatorname{ad}(F_{ca}),X^a]
   +[\operatorname{ad}(\nabla^a F_{ca}),Q].
\end{aligned}
\tag{2}
\]
Here \(\Delta_A X\) is the rough Laplacian on the entire
endomorphism-valued base one-form. The factor two comes
from the internal action on \(X_b\) and the differentiated
commutator on \(Q\).
The last term vanishes since
\(\nabla^a F_{ca}= (d_A^{*\widehat g}F)_c=0\).
For this sign, \((d_A^{*\widehat g}F)_c=-\nabla^a F_{ac}\)
and \(F_{ca}=-F_{ac}\). Self-duality and \(d_AF=0\) give the
vanishing in the reconstructed geometry. Denote the resulting
right-hand side by \(\mathcal K_c\).

The tangent contraction in (2) gives precisely Ricci. The E09
identity for \(F_{\Gamma^+}=F_A-d_\Gamma b-[b\wedge b]/2\)
determines \(\operatorname{Ric}_0\) and \(s\) from the chiral
blocks, so it can be used for this term without a full Riemann
bound. More explicitly, the E09 estimate, written
\(\mathfrak R=K|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2\),
gives
\[
|\operatorname{Ric}-3K\widehat g|^2
=|\operatorname{Ric}_0|^2+\tfrac14(s-12K)^2
\leq12\mathfrak R^2 .
\]
Also \(|F|^2=2K^2\operatorname{tr}Q=6K^2\) in the
two-form norm, so the other curvature action in (2) has a
pointwise coefficient bounded in terms of \(K\).
The \(W^-\) diagonal block of metric curvature is absent at
this step. Higher derivatives on additional tangent slots
could introduce Riemann curvature not present in (2).
[E09 chiral curvature and Ricci constants][curvature].

## Exact remainder and principal operator

Apply (2) to the derivative of \(Q_t\), then differentiate
\(X_c=M_Q(T_c)\) twice by the product rule. Write \(\nabla M_Q\),
\(\Delta_A M_Q\) and \(\nabla\mathscr L_Q\) for the induced
derivatives of these internal linear maps, so that, for example,
\(\Delta_A M_Q=DM_Q(\Delta_A Q)+D^2 M_Q(X^a,X_a)\).
The exact expression preceding the spatial leading term is
\[
\begin{split}
\partial_t T_c={}&G_Q\mathscr L_Q M_Q\bigl((\Delta_A T)_c\bigr)
 +G_Q\mathscr L_Q\!\left(\mathcal K_c
    +2(\nabla^a M_Q)((\nabla_a T)_c)
    +(\Delta_A M_Q)(T_c)\right)\\
&+G_Q\!\left((\nabla_c\mathscr L_Q)(\Delta_A Q)
                 +\nabla_c\mathcal N+[\operatorname{ad}(v_c),Q]\right)
-\tfrac12\bigl(U S_t U X_c U+U X_c U S_t U\bigr)_0 .
\end{split}
\tag{3}
\]
For derivative counting, \(\Delta_A Q=\nabla^a X_a\) contains
one derivative of \(T\), since \(X=M_Q(T)\). So does \(S_t\)
through its Sylvester equation. In \(\mathcal N\), the quantities
\(\nabla S,b\) in \(\Xi\) are algebraic in \(Q,T,\Sigma\) and the
instantaneous \(\widehat g\), by the spatial Sylvester equation
and the compatibility inverse. Differentiating them requires at
most one derivative of \(T\). In the \(A\) derivative of \(\Sigma\)
one uses \(\nabla^A\Sigma=\operatorname{ad}(b)\Sigma\).
The velocity \(v\) is algebraic in \(F,Q,T\).
The term \(\mathcal K_c\) uses the curvature dependencies in (2).
Thus (3) contains exactly the displayed second derivatives of
\(T\) when coefficients are frozen at a definite background.

For a cotangent frequency \(\xi\), the Fourier symbol of this
part is
\[
-|\xi|_{\widehat g}^2
\,\mathrm{Id}_{T^*M}\otimes(G_Q\mathscr L_Q M_Q).
\]
In fact \(M_Q\) and \(\mathscr L_Q\) commute. In a \(Q\)-eigenframe
with eigenvalues \(\lambda_i=s_i^2\), each symmetric
off-diagonal matrix line has multiplier \(2s_i s_j\) for
\(M_Q\) and \(2(\lambda_i+\lambda_j)\) for \(\mathscr L_Q\).
On diagonal trace-free matrices, \(ST S=QT\) and
\(\mathscr L_Q=2M_Q\). Therefore
\[
G_Q\mathscr L_Q M_Q=\mathscr L_Q.
\tag{4}
\]
This observation also proves directly that the ordinary Frobenius
pairing symmetrizes the principal part. In that pairing, for
\(m=\lambda_{\min}Q\), \(M_*=\lambda_{\max}Q\),
\[
4m|V|^2\leq\langle V,\mathscr L_Q(V)\rangle\leq4M_*|V|^2 .
\]
To check the constants, for a trace-free symmetric \(V\) put
\(u=\operatorname{tr}(QV)/3\). The quadratic form is
\(4\operatorname{tr}(Q(V-uI)^2)\). The lower bound follows from
\(Q\ge mI\) and \(|V-uI|^2=|V|^2+3u^2\).
Subtracting the nonnegative scalar correction in the trace
formula gives the upper bound. Thus for \(m\geq m_0>0\) the
positive diffusion coefficient has bounds \(4m_0\) and \(12\),
relative to \(|\xi|_{\widehat g}^2\).

The natural pullback symmetrizer for the similarity form,
\(\mathcal H_Q=M_Q^*M_Q\), also satisfies
\(\mathcal H_Q G_Q\mathscr L_Q M_Q=M_Q^*\mathscr L_Q M_Q\).
Its eigenvalues lie in \([4m^2,4M_*^2]\).
Indeed \(M_Q\) is Frobenius self-adjoint. On the off-diagonal
lines its multipliers lie in \([2m,2M_*]\); on trace-free diagonal
matrices it equals \(\mathscr L_Q/2\), with the same bounds.
In the pullback pairing, the diffusion coefficient has the same
\([4m,4M_*]\) bounds. At \(Q=I\), \(G_I=\tfrac12 I\),
\(M_I=2I\), \(\mathscr L_I=4I\) and \(\mathcal H_I=4I\).
Here the identities denote operations on trace-free endomorphisms.

This is a symbol in the derived strain variable. \(Q,T,A\) and
\(\widehat g\) are linked by the curvature reconstruction and
\(M_Q(T)=\nabla Q\); the latter satisfies the covariant curl
constraint
\(\nabla_a X_c-\nabla_c X_a=[\operatorname{ad}(F_{ac}),Q]\).
Full coupled connection parabolicity requires a prescribed gauge
and the appropriate connection symbol. Fine's Proposition 4.5
computes that different symbol on connection one-forms, and §4.2
uses a gauge adjustment to study short-time existence. Bounds
relative to \(\widehat g\) do not provide fixed-coordinate ellipticity
without comparison of metrics.
[Fine v2, §4.2 and Proposition 4.5][fine].

## Round check and remaining dependency

At the stationary round connection \(Q=I\), \(X=T=0\) and
\(Q_t=v=0\). For a linear variation \(q^{(1)}\), the strain
variation is \(T^{(1)}_c=\nabla_c q^{(1)}/2\); the variation
of the connection contributes no term because \(Q_0=I\).
The E02 round equation
\(\partial_t q^{(1)}=4\Delta_{A_0}q^{(1)}-24Kq^{(1)}\) and
(2), with \(\operatorname{Ric}=3K\widehat g\), give
\[
\partial_t T^{(1)}_c
=4(\Delta_{A_0}T^{(1)})_c-36K T^{(1)}_c
+8[\operatorname{ad}((F_0)_{ca}), (T^{(1)})^a].
\]
This agrees with the linearization of (3). The internal curvature
commutator remains part of this differentiated round equation.

The first-derivative and quadratic terms, the evolving metric in
norms and spatial contractions, and the pointwise eigenvalue
lower bound for quantitative ellipticity remain in an estimate
based on (3). The calculation supplies no bound for
\(\sup_M(|\nabla^A T|+|T|^2)\) or its time integral.
[E14 conditional temporal criterion][temporal].

[decision]: ../brainstorm/notes/B14_STRAIN_EVOLUTION_SYMBOL_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E15_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E15_RETURN_v1.md
[qflow]: 04A_NONLINEAR_Q_20261122.md
[strain]: 05A_REAL_TWISTOR_COMPARISON_20261122.md
[curvature]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[temporal]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2#S4
