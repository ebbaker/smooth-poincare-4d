# SP4-CME-E16A spectrum of the round strain reaction

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. This fixed
[E16A packet](../research-progress/handoffs/SP4-CME-E16A_REQUEST_v1.md)
checks the round operator selected in
[B15](../brainstorm/notes/B15_STRAIN_ENERGY_TEST_20261122.md).
The [return](../research-progress/handoffs/SP4-CME-E16A_RETURN_v1.md)
identifies the frozen inputs.

## Conventions and sign of the normalized curvature action

Use the real oriented Riemannian round background \(g_0\) on \(S^4\)
with sectional curvature \(K>0\) and its chosen self-dual chiral
connection \(A_0\). Use the fixed base and bundle identification and
the manuscript clock for the unadjusted Fine flow. In an orthonormal
internal frame use \([e_i,e_j]=\epsilon_{ijk}e_k\) and the internal
metric \(\delta_{ij}=-2\operatorname{tr}_{\mathbb C^2}(T_iT_j)\).
In an oriented round orthonormal coframe \(dx^a\) at the evaluation
point, the normalization is
\[
 \Sigma_i=\tfrac12\eta_{i,ab}dx^a\wedge dx^b,\quad
 \eta_{i,jk}=\epsilon_{ijk},\quad \eta_{i,j4}=\delta_{ij},\quad
 \eta_{i,4j}=-\delta_{ij},\quad
 (F_0)_{i,ca}=-K\eta_{i,ca}.
\]
In particular the self-dual triple satisfies
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{g_0}\) and
\(\mu_0=2K^2dV_{g_0}\).
The state space for this pointwise check is
\(V=T^*\mathbb R^4\otimes\operatorname{Sym}^2_0(\mathbb R^3)\),
real dimension \(4\cdot 5=20\), with pairing
\(\langle T,U\rangle=\sum_c\operatorname{tr}(T_c U_c)\).
Spatial derivatives in the norm consequence use the fixed
\(g_0,A_0\) tensor connection with the round volume \(dV_{g_0}\)
for any integration.

Define \(J_i\alpha=\iota_{\alpha^\sharp}\Sigma_i\) on covectors.
The matrix with output row \(c\) and input column \(a\) is
\((J_i)_{ca}=\eta_{i,ac}=-\eta_{i,ca}\).
The action is skew-adjoint and
\[
 J_i dx^4=-dx^i,\qquad
 J_i dx^j=\epsilon_{ijk}dx^k+\delta_{ij}dx^4
               \quad (j\in\{1,2,3\}).
\]
This gives \(J_i^2=-I\). The images of
\((dx^1,dx^2,dx^3,dx^4)\) under \(J_1J_2\) are
\((dx^2,-dx^1,dx^4,-dx^3)\), exactly those of \(J_3\).
Cyclic permutations of \(1,2,3\) and transposition give
\(J_iJ_j=-\delta_{ij}I+\epsilon_{ijk}J_k\).

On the internal space put \(D_i=\operatorname{ad}(e_i)\),
so \(D_i u=e_i\times u\), and on trace-free symmetric matrices
let \(R_i(X)=[D_i,X]\). Each \(R_i\) acts on the stated real
space because the commutator is symmetric and trace-free,
and cyclicity of trace gives \(R_i^*=-R_i\). Also
\([R_i,R_j]=\epsilon_{ijk}R_k\) by the Lie bracket convention
and the Jacobi identity. The normalized curvature action is
\[
 (\mathcal A T)_c=K^{-1}[\operatorname{ad}((F_0)_{ca}),T^a],
 \qquad \mathcal A=\sum_i J_i\otimes R_i .
 \tag{1}
\]
Indeed \(-( \eta_{i,ca})=(J_i)_{ca}\), which fixes the sign
in (1) with \(a\) the input covector slot. Each term is
self-adjoint since both factors are skew-adjoint. Each term
has zero trace by the tensor-product trace and
\(\operatorname{tr}J_i=0\), so \(\operatorname{tr}\mathcal A=0\).

## Exact polynomial and eigenvalues

The vector triple product gives \(\sum_i D_i^2=-2I\).
For symmetric trace-free \(X\), also \(\sum_iD_i XD_i=X\).
To see this, diagonalize \(X\) in an \(SO(3)\) frame.
The matrix sum is equivariant because the \(D_i\) rotate
as an orthonormal cross-product triple. In the diagonal
frame its entry in position \(j,j\) is the negative sum
of the other two diagonal entries of \(X\), with zero
off-diagonal entries. It equals \(X\) by trace-freeness.
It follows that
\[
 \sum_iR_i^2(X)
    =\sum_i\bigl(D_i^2X-2D_iXD_i+XD_i^2\bigr)=-6X.
\]
Using the quaternionic product and the sign of the internal
commutators in (1) now gives
\[
 \begin{aligned}
 \mathcal A^2
 &= -I\otimes\sum_iR_i^2+
            \sum_{i,j,k}\epsilon_{ijk}J_k\otimes R_iR_j \\
 &=6I+\tfrac12\sum_{i,j,k,\ell}
           \epsilon_{ijk}\epsilon_{ij\ell}J_k\otimes R_\ell
   =6I+\mathcal A .
 \end{aligned}
\]
Here the antisymmetrization uses
\([R_i,R_j]=\epsilon_{ij\ell}R_\ell\) and
\(\sum_{ij}\epsilon_{ijk}\epsilon_{ij\ell}=2\delta_{k\ell}\).
The two eigenvalues are among \(-2,+3\). Self-adjointness,
dimension 20 and zero trace give their multiplicities
\(12,8\), respectively, from \(-2\cdot12+3\cdot8=0\).
Thus for the operator selected by E15,
\[
 Z=-36K I+8K\mathcal A,\qquad
 \boxed{\operatorname{spec}(Z)=
      \{-52K\text{ with multiplicity }12,\quad
        -12K\text{ with multiplicity }8\}.}
\]
In particular, on the entire 20-dimensional tensor space,
\[
 -52K|T|^2\le\langle T,ZT\rangle\le-12K|T|^2 .
\]
The two orthogonal spectral components are
\(T_-=(3I-\mathcal A)T/5\) and \(T_+=(\mathcal A+2I)T/5\).

## Round linear strain norm

The round strain variation is \(T^{(1)}=\nabla^{A_0}q^{(1)}/2\);
its equation is \(\partial_tT^{(1)}
=4\Delta_{A_0}T^{(1)}+ZT^{(1)}\), with the rough Laplacian on
all tensor slots and \(\Delta=\nabla^a\nabla_a\) on scalar
functions. The \(-36K\) in \(Z\) combines the \(-24K\)
defect reaction and the \(-4\operatorname{Ric}\) term.
[E15 round check and commutator](17_STRAIN_EVOLUTION_STRUCTURE_20261122.md).

In the fixed background metric, the product rule gives, writing
\(T=T^{(1)}\),
\[
 \begin{aligned}
 (\partial_t-4\Delta)|T|^2
   &=-8|\nabla^{A_0}T|^2+2\langle T,ZT\rangle\\
   &=-8|\nabla^{A_0}T|^2-104K|T_-|^2-24K|T_+|^2\\
   &\le -8|\nabla^{A_0}T|^2-24K|T|^2 .
 \end{aligned}
\]
The pointwise algebra holds on the whole tensor space, so it
also holds on variations satisfying the strain curl constraint.
It verifies the round gap used in E16B. The calculation is
finite exact algebra and uses the fixed round linear equation.
Nonlinear energy control requires separate estimates.
