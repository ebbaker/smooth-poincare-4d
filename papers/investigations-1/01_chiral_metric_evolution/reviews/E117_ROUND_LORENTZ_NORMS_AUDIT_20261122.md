# E117 — Audit of the round annular Lorentz norms and endpoint comparison

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I did not author E116 or E112. I authored E22 and E47,
and previously audited E112 in E114. I also authored the related
E15 strain commutator calculation. Here I check E116 and the precise
operator match to the assessed E22 estimate. This is not a fresh
independent audit of E22's primary kernel proof. No new external
source was inspected. [Request][req] · [E116][e116] · [Packet return][ret].

## Disposition

E116 passes at the frozen round linearized scope. For every fixed
\(1\le q<\infty\), the attained initial strain satisfies
\(\|T_N(0)\|_{(4,q)}\asymp_q N^{-1/2}N^{1/q}\).
At \(q=\infty\) it satisfies \(\|T_N(0)\|_{(4,\infty)}
\asymp N^{-1/2}\). In combination with E112 this excludes a uniform
linear estimate of its derivative integral for every \(q>1\).
The separate, already assessed E22 estimate applies at \(q=1\)
and gives a matching upper bound. Thus
\[
 I_N=\int_0^\infty\|D_0T_N(\tau)\|_{\infty,G}\,d\tau
       \asymp \|T_N(0)\|_{(4,1);G}\asymp \sqrt N .
\]
This two-sided order concerns the derivative integral. The second
budget term in E22 has its separate quadratic upper bound.
No nonlinear or varying-reference estimate is used.
[B62][b62] · [E112/E114 assessment][a112] · [E22 assessment][a22].

## Actual lower subannulus and strict distribution bounds

Use the actual oriented compact round sphere of native curvature
\(1/2\), with its chiral connection and negative-Killing internal
metric. Fix the E112 normal ball and radial orthonormal internal
frame. On the annulus \(r<\rho<2r\), E112 (5) gives
\(q^{(r)}=2f(\rho/r)M+e^{(r)}\),
where \(|D_0e^{(r)}|\le C r\) and \(M\) is a radially transported
unit trace-free symmetric endomorphism. Its coefficients are
constant in the radial frame, so \(D_0M=O(r)\) using the actual
reference connection coefficients. The covariant product rule gives
\[
 T^{(r)}
 =\frac{f'(\rho/r)}r\,d\rho\otimes M+
                   f(\rho/r)D_0 M+\tfrac12D_0 e^{(r)} .
\]
Since \(\rho=d_G(p,\cdot)\), \(d\rho\) has unit norm throughout
the annulus. The tensor product with unit \(M\) has unit norm.
The combined error is \(O(r)\) in the actual native tensor norm.

Here \(f(u)=\chi(u)+u\chi'(u)/4\).
If \(f\) vanished identically, \((u^4\chi)'=4u^3 f\) would make
\(u^4\chi\) constant, hence zero by the cutoff support; this is
impossible. Since \(f\) is itself smooth, compactly supported in
\((1,2)\) and nonzero, some \(f'\ne0\). Continuity gives a closed
interval \([u_-,u_+]\subset(1,2)\) with positive length and
\(|f'|\ge m>0\) on it. Fix the E112 \(R>2\) and shrink the
permitted \(\sigma\) so that \(C_1\sigma^2\le m/2\) for the
constant \(C_1\) in the \(O(r)\) error. This shrink preserves the
short-time upper constraint, disjoint intervals and uniform kernel
bounds of E112. Its own-scale error shrinks and the damping lower
bound can only improve. All these choices precede \(N\).

It follows that \(|T^{(r)}|\ge L/r\) on the true radial subannulus
\(B_r=\{u_-r<\rho<u_+r\}\) with \(L=m/2\), and that
\(|T^{(r)}|\le U/r\) on \(A_r=\{r<\rho<2r\}\) for a fixed \(U\).
The positive upper and lower normal volume density comparisons
and scaling of the Euclidean annuli give
\(\operatorname{Vol}_G(B_r)\ge v r^4\) and
\(\operatorname{Vol}_G(A_r)\le V r^4\) for fixed \(v,V>0\).
The atom and its derivatives vanish outside \(A_r\) and through
its support collars. Thus these estimates allow the entire upper
annulus while the lower annulus lies within the nonzero strain
region. The E112 atoms are smooth and global for finite \(N\).
[E112, (4)–(6)][e112] · [E116, (1)–(3)][e116].

With \(r_k=\sigma R^{-k}\), \(\delta_N=N^{-1/2}\) and
\(g_N=|T_N(0)|_G\), on each annulus the full initial strain is
just its one scaled atom; disjointness precludes inter-atom
cancellation. With \(L_k=L\delta_N/r_k\), \(U_k=U\delta_N/r_k\),
the strict level bounds are
\[
 v\sum_k r_k^4{\bf1}_{\{\lambda<L_k\}}
   \le \mu_N(\lambda)=\operatorname{Vol}_G\{g_N>\lambda\}
   \le V\sum_k r_k^4{\bf1}_{\{\lambda<U_k\}}
       \qquad(\lambda\ge0).
\]
If \(\lambda=L_k\), the lower proof omits that subannulus
because only a value \(\ge L_k\) was proved there. If
\(\lambda=U_k\), the upper bound correctly discards the
\(k\)-th annulus. Consequently these inequalities hold
including at both conventions' threshold levels.
[E116, (4)][e116].

## Rearrangement identity and level sums

For a bounded nonnegative \(g\), the distribution
\(\mu_g(\lambda)=\operatorname{Vol}_G\{g>\lambda\}\)
is right-continuous by countable monotone convergence of the
strict superlevel sets as levels decrease. Define
\(g^*(s)=\inf\{\lambda\ge0:\mu_g(\lambda)\le s\}\) for \(s>0\).
For \(s\ge\mu_g(\lambda)\), the level \(\lambda\) belongs to
this defining set, so \(g^*(s)\le\lambda\). If
\(s<\mu_g(\lambda)\), some \(\epsilon>0\) has
\(\mu_g(\lambda+\epsilon)>s\); all levels at most
\(\lambda+\epsilon\) are then outside the set. Hence
\(g^*(s)>\lambda\) exactly for \(0<s<\mu_g(\lambda)\).
This also gives extension by zero above the total volume
and handles plateaux of \(g\).

By applying the ordinary layer formula to \((g^*)^q\) and
Tonelli, the integral of \(s^{q/4-1}\) over
\((0,\mu_g(\lambda))\) supplies a \(4/q\), which cancels
the layer's \(q\). Thus for \(1\le q<\infty\),
\[
 \|g\|_{(4,q)}^q
   =4\int_0^\infty\lambda^{q-1}\mu_g(\lambda)^{q/4}\,d\lambda .
\]
This gives \(4\int\mu_g(\lambda)^{1/4}\,d\lambda\) at \(q=1\).
At \(q=4\) it gives \(4\int\lambda^3\mu_g(\lambda)\,d\lambda
=\int g^4\,dV_G\) exactly. For \(q=\infty\), fixing \(\lambda>0\)
and letting \(s\) approach \(\mu_g(\lambda)\) from below gives
one bound for the rearrangement supremum. Fixing \(s>0\)
and letting \(\lambda\) approach \(g^*(s)\) from below gives
the other. Therefore the weak norm equals
\(\sup_{\lambda>0}\lambda\mu_g(\lambda)^{1/4}\) without any
factor. [E116, (5)–(6)][e116].

For the upper estimate set \(U_0=0\). On
\([U_{k-1},U_k)\) only the annuli with indices \(j\ge k\)
can contribute to the upper distribution bound. Their summed
volume is at most \(C_{\rm vol}r_k^4\) with
\(C_{\rm vol}=V/(1-R^{-4})\). This includes the lowest band
\([0,U_1)\) with the total volume of the support. At and above
\(U_N\) the distribution vanishes. The integral over all the
bands is bounded by
\[
 \frac4q C_{\rm vol}^{q/4}\sum_{k=1}^N
       r_k^q(U_k^q-U_{k-1}^q)
       \le\frac4q C_{\rm vol}^{q/4} U^q\delta_N^q N .
\]
The integral of \(\lambda^{q-1}\) down to zero is finite in
the first band. In the weak case the product
\(\lambda\mu_N(\lambda)^{1/4}\) is at most
\(U C_{\rm vol}^{1/4}\delta_N\) on every band.

For the lower estimate the intervals \([L_k/4,L_k/2]\)
are disjoint by \(L_{k+1}=R L_k\) and \(R>2\).
On each one the measure is at least \(v r_k^4\), so their
contribution has the bound
\[
 \|g_N\|_{(4,q)}^q\ge
 \frac4q v^{q/4}L^q(2^{-q}-4^{-q})\delta_N^q N .
\]
This argument also includes \(N=1\). Taking
\(\lambda=L_k/2\) gives the weak lower bound
\(L v^{1/4}\delta_N/2\).
The constants depend on fixed \(q\), the fixed geometry and
choices, independently of \(N\). The ordinary \(L^4\) norm
thus has exact order \(\delta_N N^{1/4}=N^{-1/4}\),
consistent with the E112 upper estimate.
Combining these upper bounds with \(I_N\ge c\delta_N N\)
from E112 gives \(I_N/\|g_N\|_{(4,q)}\ge c_q N^{1-1/q}\)
for finite \(q>1\) and \(\ge cN\) for the weak endpoint.
The lower bound for \(J_{\rm lin}\) follows since it contains
\(I_N\). These are failures of uniform linear estimates for
the round linearized problem on attained data.
[E116, (7)–(11)][e116] · [E112, derivative integral][e112].

## Matching the assessed E22 strain operator

Let \(\kappa=2K\), \(G=\kappa\widehat g\) and
\(\tau=\kappa t\). The round connections are unchanged
under this constant rescaling. Endomorphism Hilbert–Schmidt
norms are unchanged by constant internal metric rescaling.
Thus \(q\) and \(T=\tfrac12D_0q\) are the same tensors at
corresponding times. E112's native defect equation
\(q_\tau=4\Delta_{\mathcal E,G}q-12q\) becomes
\[
 q_t=4\Delta_{\mathcal E,\widehat g}q-24Kq
\]
because the normalized rough Laplacian is
\(\kappa\Delta_{\mathcal E,G}\). Here and below
\(\Delta=D_0^a D_{0,a}\) is the nonpositive rough Laplacian
on all indicated tensor slots.

To check the differentiated equation, set \(W_c=D_{0,c}q\)
and raise covectors using \(\widehat g\). The difference
\(D_{0,c}\Delta_{\mathcal E}q-(\Delta_{\mathcal V}W)_c\)
is the sum of \([D_{0,c},D_0^a]W_a\) and
\(D_0^a(D_{0,c}W_a-D_{0,a}W_c)\).
The first is \(-\mathrm{Ric}_c{}^a W_a+
[\operatorname{ad}(F_{0,ca}),W^a]\), with the Ricci term
coming from the covector slot. In the second, the difference
of derivatives on the zero-form \(q\) equals
\([\operatorname{ad}(F_{0,ca}),q]\).
After the divergence it contributes a second internal
action and the reference curvature derivative term
\([\operatorname{ad}(D_0^aF_{0,ca}),q]\). This last term is
zero by reference parallelness. Thus
\[
 T_{t,c}=4(\Delta_{\mathcal V,\widehat g}T)_c-36KT_c
                +8[\operatorname{ad}(F_{0,ca}),T^{a,\widehat g}],
 \qquad \mathcal V=T^*S^4\otimes\operatorname{Sym}_0^2(E),
\]
with \(-36K=-24K-4(3K)\). The coefficient and sign of the
internal action are essential. This is E22's precise \(L_K\)
on the full rank-twenty bundle. Its parallel reaction
\(Z_K=-36KI+8K\mathcal A\) has eigenvalues \(-52K,-12K\)
by E16A, with \(\mathcal A(T)_c=K^{-1}
[\operatorname{ad}(F_{0,ca}),T^{a,\widehat g}]\).
Equivalently in native time the reaction has eigenvalues
\(-26,-6\), with scalar term \(-18I\) and internal term
\(8[\operatorname{ad}(F_{0,ca}),T^{a,G}]\).
This verifies the operator identification, including its
lower-order action. If two smooth solutions of this full
normalized strain equation share initial data, their
difference \(V\) satisfies
\(\frac12\partial_t\|V\|_2^2
=-4\|D_0V\|_2^2+(Z_KV,V)\le0\).
Hence the attained \(T_N\) is exactly the E22 semigroup
path from its attained initial strain. No commutation of
the round covariant derivative through heat is asserted.
[E112, (3)][e112] · [E15, round commutator][e15] ·
[E16A, reaction][e16a] · [E22, statement and reaction][e22].

## Exact native endpoint consequence

The normalized and native initial Lorentz norms agree
with the convention audited above. Indeed
\(|T|_G=\kappa^{-1/2}|T|_{\widehat g}\),
\(dV_G=\kappa^2 dV_{\widehat g}\), and hence
\(\mu_G(\lambda)=\kappa^2\mu_{\widehat g}(\sqrt\kappa\lambda)\).
Changing variables in the \(q=1\) layer formula cancels
its factor \(\kappa^{1/2}\) from the measure with
\(\kappa^{-1/2}\) from the level. The two covector slots of
\(D_0T\) give \(\|D_0T\|_{\infty,G}
=\kappa^{-1}\|D_0T\|_{\infty,\widehat g}\), exactly canceled
by \(d\tau=\kappa\,dt\). The squared strain norm has the
same pointwise scaling and the same time cancellation.

In E22's short-time proof the derivative integral alone
is bounded by \(CN_K\) via Tonelli, and its long-time proof
bounds that integral again by \(CN_K\). The squared strain
is bounded separately by \(CN_K^2\) in the two time ranges.
This separation is stronger for the derivative than taking
it from the boxed combined estimate \(C(N_K+N_K^2)\) alone.
With \(N_K=\|T_N(0)\|_{(4,1);G}\), the exact equality of the
two clocks' derivative integrals proves
\[
 I_N\le C\|T_N(0)\|_{(4,1);G}\le C'\sqrt N .
\]
Together with E112 and E116 this gives matching order for
the derivative integral. E22's separate bound for
\(\int_0^\infty\|T_N(\tau)\|_{\infty,G}^2\,d\tau\) is
\(C\|T_N(0)\|_{(4,1);G}^2=O(N)\); these facts do not
determine a matching order for the full \(J_{\rm lin}\).
The last sentence of E116 about the upper estimate is
properly read as the limit of its rearrangement calculation.
The existing E22 upper theorem already holds for the fixed
round linear strain equation, including these attained data.
[E22, small-time integral and large times][e22] ·
[E22 assessment][a22] · [E116, final consequence][e116].

## File identities

| Consumed file | SHA-256 |
| --- | --- |
| [E117 request][req] | 9f2253323961b82a6a339d7cdfa77e81bbed7ba875bc25ef0824440049a5aee7 |
| [E116 request][req116] | ac0995740e6634fd59e958c30a36c82a8323284389e19d910af68877eab085e8 |
| [E116 return][ret116] | b7b7a48422fc4e116dedddf18d31620e750a6431fffdcf15e97ad1bdb10c93a6 |
| [B62][b62] | 2fc388067ee0a45b8da327547fb9e6ff1033a97299a80df4c3e37d247c8841e5 |
| [E116][e116] | bba74ee73fc53fd7707d4489d6b9f1dbe67957fb9517f972bfba584522a1327c |
| [E112][e112] | f3d34f89645c81128a8d16544eb1248f1839249ed7c3c6bdbd0e51e2fa43c856 |
| [E22][e22] | 6d25f4b39c2f75a407f73b2fd7a913cebbe46576cc39a00832b2d0cbf828a22b |
| [E15][e15] | d8caa4e811178ba1357552526f311e5d283ec5e04ffd18851c7e378bfcfd5ec3 |
| [E16A][e16a] | eb12c9f24b25d0ae8ed99eaa65485218ad8caed3c6497a9fb44e8dfa94c0dd4d |
| [E112/E114 assessment][a112] | 3955a28ce41c134a66216c7cbce2083ca2dcc3c633b8a73a0ed08be0b165b58c |
| [E22 assessment][a22] | 5968a5cca8afbb4a00bd342e768526b0ffa5f7afebfaa01dd8bcddcad0de7e93 |

[req]: ../research-progress/handoffs/SP4-CME-E117_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E117_RETURN_v1.md
[req116]: ../research-progress/handoffs/SP4-CME-E116_REQUEST_v1.md
[ret116]: ../research-progress/handoffs/SP4-CME-E116_RETURN_v1.md
[b62]: ../brainstorm/notes/B62_LINEARIZATION_TEST_AND_LORENTZ_THRESHOLD_20261122.md
[e116]: ../notes/116_ROUND_ANNULAR_LORENTZ_NORMS_20261122.md
[e112]: ../notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e22]: ../notes/22_ROUND_LORENTZ_HEAT_20261122.md
[e15]: ../notes/17_STRAIN_EVOLUTION_STRUCTURE_20261122.md
[e16a]: ../notes/18A_ROUND_STRAIN_REACTION_20261122.md
[a112]: E112_E114_ROUND_MULTISCALE_ASSESSMENT_20261122.md
[a22]: E22_E25_TRANSFER_ASSESSMENT_20261122.md
