# E189 — Independent audit of the seven stationary-kernel certificates

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B92, configured
`gpt-6.2-sol` / `ultra`. Independent runtime and selected lead settings
are unavailable. I authored the inherited E07 kernel tensor and
E02C volume/jet calculation. I did not author E187, E05, E01A or
E02A. The independent verifier reconstructs the algebra without
calling E187. The [request][req], seven frozen inputs, and nine
digests in the E187 dependency/evidence table matched.

## Disposition

**Pass.** The exact ranks, restricted forms, original-coordinate
congruence certificates and witness values all check. The
restricted inertia is \((12,0,0)\) at \(t=1/2,1\) and
\((8,0,4)\) at the other five spectra, in positive, zero,
negative order. The \(t=1/4\) and \(t=2\) manual contractions
below confirm both signs independently. No repair was found.
[E187][e187] · [Independent verifier][verify] · [Stored certificates][json].

## Signs and rational equations

Use the older bracket \([e_i,e_j]=\epsilon_{ijk}e_k\),
an oriented Euclidean covector coframe \(e^a=dx^a\), and
\(K=1\). For the specified \(\Sigma_i\), wedge products are
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}\,e^{1234}\).
Taking the Hodge star of \(e^a\wedge\Sigma_j\) gives this
signed table. Each entry is \(J_j e^a\).

| | \(a=1\) | \(a=2\) | \(a=3\) | \(a=4\) |
| --- | --- | --- | --- | --- |
| \(j=1\) | \(e^4\) | \(e^3\) | \(-e^2\) | \(-e^1\) |
| \(j=2\) | \(-e^3\) | \(e^4\) | \(e^1\) | \(-e^2\) |
| \(j=3\) | \(e^2\) | \(-e^1\) | \(e^4\) | \(-e^3\) |

Put \(d=(1,1,t)\), \(D=\mathrm{diag}(d)\),
\(\lambda=3/(2+t^2)\) and \(c=\sqrt\lambda\).
Then \(S=cD\), \(F_i=-cd_i\Sigma_i\), and
\(Q=\lambda D^2\) has trace three. Its wedge Gram
has the prescribed density \(2\,e^{1234}\).
For symmetric trace-free \(X_a\), the Sylvester equation is
\(cD\nabla_a S+(\nabla_aS)cD=X_a\). With
\(Y_{a,ij}=X_{a,ij}/(d_i+d_j)\) it gives
\(\nabla_aS=Y_a/c\) and \(S^{-1}\nabla_a S=
\lambda^{-1}D^{-1}Y_a\). All denominators are nonzero
at the seven tested \(t>0\).

Bianchi for \(F\) uses \(d_{\Gamma^+}\Sigma=0\).
With \(b=A-\Gamma^+\), it gives the following unstarred
rational three-form equation after multiplying by \(-c\)
in the formula for \(d_AF\):
\[
 \sum_{a,j}Y_{a,ij}e^a\wedge\Sigma_j
                         +\lambda d_i[b,\Sigma]_i=0 .
\]
The first bracket row is \(b_2\wedge\Sigma_3-b_3\wedge\Sigma_2\)
and the others are its cyclic rotations. In starred form the
equation is \(\mathscr C b=z\), with
\(\mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k\) and
\(z_i=-(\lambda d_i)^{-1}\sum_{a,j}Y_{a,ij}J_j e^a\).
The signed table gives \(J_iJ_j=-\delta_{ij}I+\sum_k
\epsilon_{ijk}J_k\), so
\((\mathscr C^2)_{i\ell}=J_\ell J_i-\delta_{i\ell}\sum_kJ_k^2
=2\delta_{i\ell}I-\mathscr C_{i\ell}\).
The product of the two skew factors in the blocks makes
\(\mathscr C\) self-adjoint. Hence its inverse is
\((\mathscr C+I)/2\). The verifier independently constructs
the raw three-form bracket matrix and solves that equation
by rational matrix inversion. It checks the starred
identity and the unstarred Bianchi residual, rather than
using the original starred inverse in reconstruction.
[E01A compatibility][compat].

With \(m_a=\operatorname{tr}(QX_a)/3\) and
\(U_a=X_a-m_a I\), one has \(U_a=\nabla_a H\) for
\(H=q-|q|^2I/6\). Here \(\operatorname{tr}(qX_a)=
\operatorname{tr}(QX_a)\) because \(\operatorname{tr}X_a=0\).
The actual velocity is \(-4d_A^*(HF)\). Since \(HF\)
is self-dual, \(d_A^*=-*d_A*\) on two-forms and Bianchi
give \(V=4*(d_AH\wedge F)\), where the self-dual equality is
used before differentiation. Thus
\[
 V_i/c=-4\sum_{a,j} d_j(U_a)_{ij}J_j e^a .
\]
There is no extra factor from the norm of \(\Sigma_i\)
or from a putative frozen spatial Hodge star. This tests
the actual pointwise velocity constraint after removing only
the common nonzero scalar \(c\). [E07][kernel].

E02A's skew term is \(2[\nabla_aS,S]+
4S\operatorname{ad}(b_a)S\). The reconstructed rational
version is \(2[Y_a,D]+4\lambda D\operatorname{ad}(b_a)D\).
In the older bracket the matrix of \(\operatorname{ad}(b_a)\)
is the ordinary cross-product matrix. Specifically,
\((\operatorname{ad}b_a)_{13}=(b_2)_a\) and
\((\operatorname{ad}b_a)_{23}=-(b_1)_a\).
The first factor \(c\) cancels the Sylvester \(1/c\)
in the commutator, and the second term gives \(c^2=\lambda\).
There is no native negative-Killing rescaling in this packet.
[E02A][defect].

E05's integration by parts gives minus twice the integral of
the principal pairing plus twice the skew commutator pairing.
Thus the desired \(R\) subtracts
\(\langle q,[X_a,\Xi_a]\rangle\) as in E187. Its principal
part is \(4\sum_a\operatorname{tr}(Q U_a^2)\), since
\(\operatorname{tr}Q=3\) and
\(\mathscr L_QX=2(QX+XQ)-(4/3)\operatorname{tr}(QX)Q\).
For diagonal \(q\), symmetric \(X\) and skew \(\Xi\),
\([X,\Xi]_{ii}=-2\sum_j X_{ij}\Xi_{ij}\).
Thus an equivalent scalar formula used by the verifier is
\[
 R(X)=4\sum_a\operatorname{tr}(Q U_a^2)
      +2\sum_{a,i<j}(\lambda_i-\lambda_j)(X_a)_{ij}(\Xi_a)_{ij},
 \qquad \lambda_i=Q_{ii}.
\]
This checks the commutator sign directly. The stationary
integrated equation is
\(0=-2\int R\mu-48K\int\sqrt{\det Q}|q|^2\mu\)
with its original normalization. [E05, (3)][energy].

## Direct witness at \(t=1/4\)

Here \(Q=\mathrm{diag}(16,16,1)/11\). Write
\(E_{ij}^{\mathrm{sym}}=E_{ij}+E_{ji}\).
Take \(X_1=\mathrm{diag}(-3/2,-5/4,11/4)\),
\(X_3=E_{13}^{\mathrm{sym}}\), and \(X_2=X_4=0\).
The first trace correction is \(m_1=-5/4\),
so \(U_1D=\mathrm{diag}(-1/4,0,1)\).
The weighted \(J\)-sum from axis 1 is
\((-e^4/4,0,e^2)\), and axis 3 gives its negative.
This gives all twelve zero velocity coefficients.

The Sylvester arrays are
\(Y_1=\mathrm{diag}(-3/4,-5/8,11/2)\) and
\(Y_3=\frac45 E_{13}^{\mathrm{sym}}\).
The unweighted \(Y\)-contraction with the signed table is
\((e^4/20,5e^3/8,47e^2/10)\). Hence
\[
 z=\left(-\tfrac{11}{320}e^4,-\tfrac{55}{128}e^3,
                          -\tfrac{517}{40}e^2\right).
\]
Writing \(b=(B_1e^4,B_2e^3,B_3e^2)\), the three starred
bracket coefficients are
\((B_2-B_3,B_3+B_1,-B_1+B_2)\).
Solving with the indicated \(z\) gives
\[
 (B_1,B_2,B_3)=
       \left(\tfrac{1595}{256},-\tfrac{8569}{1280},-\tfrac{1705}{256}\right).
\]
Only \((\Xi_3)_{13}\) contributes in the commutator
sum. It equals
\(2(4/5)(-3/4)+(16/11)B_2=-175/16\).
Each of the two active axes gives \(68/11\) in the
principal part, and the skew correction is
\(2(15/11)(-175/16)=-2625/88\).
Thus \(R=136/11-2625/88=-1537/88\).

## Direct witness at \(t=2\)

Now \(Q=\mathrm{diag}(1/2,1/2,2)\). Put
\(u=17/38\), \(v=25/38\), \(w=4/19\), and take
\[
 X_1=uE_{23}^{\mathrm{sym}},\qquad
 X_2=vE_{13}^{\mathrm{sym}},\qquad
 X_3=E_{12}^{\mathrm{sym}},\qquad
 X_4=\mathrm{diag}(-w,0,w).
\]
Only \(m_4=w/2\) is nonzero. The three weighted \(J\)-sums
in the velocity, before multiplying by \(-4\), are
\[
 (-2v+1+3w/2)e^1,\quad
 (2u-1+w/2)e^2,\quad
 (-u+v-w)e^3 .
\]
All three coefficients vanish for these values.
The Sylvester arrays are \(uE_{23}^{\mathrm{sym}}/3\),
\(vE_{13}^{\mathrm{sym}}/3\), \(E_{12}^{\mathrm{sym}}/2\),
and \(\mathrm{diag}(-w/2,0,w/4)\) in axis order.
The three unweighted \(Y\)-contractions have coefficients
\(-v/3+1/2+w/2=22/57\), \(u/3-1/2=-20/57\), and
\((v-u)/3-w/4=1/57\) on \((e^1,e^2,e^3)\).
Thus \(z=(-44e^1,40e^2,-e^3)/57\).
For \(b=(B_1e^1,B_2e^2,B_3e^3)\) the bracket
coefficients are \((-B_2-B_3,-B_3-B_1,-B_1-B_2)\),
so \((B_1,B_2,B_3)=(-83,85,3)/114\).

The contributing skew entries are
\[
 (\Xi_1)_{23}=2u/3-4B_1=61/19,\qquad
 (\Xi_2)_{13}=2v/3+4B_2=65/19 .
\]
The \(12\) entry on axis 3 makes no contribution because
\(Q_{11}=Q_{22}\). The principal part equals
\(10(u^2+v^2)+4+7w^2=3841/361\).
The skew correction is
\(-3(u\cdot61+v\cdot65)/19=-3993/361\).
Hence \(R=-152/361=-8/19\).
Both manual derivations use the displayed wedge contractions,
the sparse bracket equations and the scalar pairing, without
calling E187's geometric routines.

## Exact basis and inertia checks

The [verifier][verify] uses the standard library and rational
arithmetic only. It derives wedge products and Hodge star from
exterior-monomial coefficients, reconstructs the raw Bianchi
matrix from signed bracket wedges, solves that matrix, and
evaluates the scalar form above. For the symmetric form it
uses \((R(u+v)-R(u)-R(v))/2\), not E187's mixed contractions or
its congruence algorithm. Exact elimination on the velocities of
all twenty coordinate directions gives rank eight at each sample,
with the recorded pivot and free columns. The input dimension is
four times five because every \(X_a\) is symmetric trace-free.

Both the stored kernel basis and the stored congruence basis
have twelve independent original-coordinate vectors, and
each has twelve zero velocity components under the independent
reconstruction. They therefore each span the actual kernel.
Scalar polarization reproduces the whole stored restricted
Gram matrix on the former basis and the full diagonal with
zero off-diagonal entries on the latter. Sylvester's law of
inertia then gives the counts below. The verifier also checks
every listed negative witness against the actual constraint
\(V=0\) via the rational rows \(V/c=0\).

| \(t\) | Rank | Kernel dimension | Inertia | Stored witness \(R\) |
| --- | ---: | ---: | --- | ---: |
| \(1/8\) | 8 | 12 | \((8,0,4)\) | \(-156673/1376\) |
| \(1/4\) | 8 | 12 | \((8,0,4)\) | \(-1537/88\) |
| \(1/2\) | 8 | 12 | \((12,0,0)\) | — |
| \(1\) | 8 | 12 | \((12,0,0)\) | — |
| \(2\) | 8 | 12 | \((8,0,4)\) | \(-8/19\) |
| \(4\) | 8 | 12 | \((8,0,4)\) | \(-11/54\) |
| \(8\) | 8 | 12 | \((8,0,4)\) | \(-11651/2662\) |

At \(t=1\), \(q=0\) and \(\mathscr L_I=4I\) on trace-free
endomorphisms. Hence the form is \(4\) times Frobenius on the
whole twenty-dimensional space, independently of the reconstructed
\(\Xi\). For E07 \(X_1=\mathrm{diag}(1,-1,0)\) and
\(X_2=-E_{12}^{\mathrm{sym}}\), the two velocity \(J\)-sums
are \((e^4,e^3,0)\) and its negative. The squared norm is
four, so \(R=16\). The verifier checks the full round Gram
and that tensor separately.

Run `python3 numerics/e189_stationary_kernel_verify.py` from
the investigation directory. Python 3.10.0 completed all exact
assertions. Separately, replaying the original E187 script into
a temporary file on that interpreter produced byte-identical
JSON with the frozen SHA-256. The replay is supplementary.
The verification above reconstructs the geometry instead of
trusting E187's routines. No new primary source was inspected.

The five failures concern pointwise nonnegativity on abstract
stationary first derivatives at exactly the indicated spectra.
The work supplies no actual critical connection realizing the
negative arrays, no interpolation of their signs between
samples, and no unpinched stationary gap, classification or
singular trajectory. Only the audit, verifier and return were
written. [Return and verified digests][ret].

[req]: ../research-progress/handoffs/SP4-CME-E189_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E189_RETURN_v1.md
[e187]: ../notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md
[compat]: E01A_AUDIT_20261122.md
[kernel]: ../notes/09_DISSIPATION_KERNEL_20261122.md
[energy]: ../notes/07_PINCHED_ENERGY_GAP_20261122.md
[defect]: ../notes/04A_NONLINEAR_Q_20261122.md
[verify]: ../numerics/e189_stationary_kernel_verify.py
[json]: ../numerics/e187_stationary_kernel_results.json
