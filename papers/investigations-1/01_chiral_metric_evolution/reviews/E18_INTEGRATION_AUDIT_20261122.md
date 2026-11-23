# SP4-CME-E18 audit of six manuscript subsections

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Independent runtime introspection and the selected lead's
actual settings were unavailable. This is the bounded
[E18 transcription and hypothesis check](../research-progress/handoffs/SP4-CME-E18_REQUEST_v1.md).
The [return](../research-progress/handoffs/SP4-CME-E18_RETURN_v1.md)
records the frozen versions.

The six central calculations and numerical constants agree with the
accepted derivations and the independent checks below. Two strict
intermediate bounds need non-strict signs at zero. Two propositions
would benefit from making inherited base/time premises explicit.
The pointwise chiral-curvature error also uses the existing symbol for
the integrated Weyl energy and should be renamed.

Line numbers refer to the frozen
[manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex),
SHA-256 `267c7c5b70a39c69e28dd828380dae81e5f6a7c2b87397495900e69e91f67e9a`.
Use the manuscript's smooth real oriented Riemannian four-dimensional
setting, rank-three internal pairing \(\delta\), positive curvature
plane, round-compatible sign \(F=-KS\Sigma\), \(K>0\) fixed, and
\(\mu=2K^2dV_{\widehat g}\). The dynamical statements use the
unadjusted independent-connection flow on a fixed base and bundle.

## Whole-sphere horizontal comparison

Lines 1204–1305, `subsec:real-transport`. The shape map \(\Phi\)
acts in the round-compatible target identification. Along an
\(A\)-horizontal lift \(D^A_Xu=0\), so
\(D^\Gamma_X(Su)=(\nabla_X^AS)u-\operatorname{ad}(b_X)Su\).
Differentiation of normalization applies \(P_f/|Su|\) and gives
`transport:horizontal` in the correct matrix order. The fixed-base
vertical differential follows by the same normalization.
The symmetric part of \((\nabla S)S^{-1}\) is
\(S^{-1}(\nabla Q)S^{-1}/2\); recovering its trace using
\(\operatorname{tr}\nabla Q=0\) gives `transport:strain` and the
inverse in `transport:inverse-bounds`.

The real projection at lines 1242–1243 uses the target round area
\(4\pi\). For a rotation field \(\Omega f\), pointwise contraction
with \(P_fTf\) equals the contraction with \(Tf\), so the integrated
pairing is \((4\pi/3)\operatorname{tr}(T\Omega^T)=0\).
The remaining real holomorphic fields \(P_fa\) are even in the
ambient components at \(-f\), while \(P_fTf\) is odd. The
orthogonality is exact. With \(\operatorname{tr}T=0\), the second
and fourth target-sphere moments give
\(4\pi(1/3-2/15)|T|^2=(4\pi/5)|T|^2\) for the real squared norm
and the same \(4\pi/5\) coefficient for the matrix moment.
The standard \((1,0)\) projection \((Y-ijY)/2\) in the
complexified real metric halves its squared norm, giving
\(2\pi/5\). The coordinate change \(w=\zeta^{-1}\) gives the
stated factor \(-\zeta^{-2}\) on vertical components.

The inverse relative-strain map on trace-free symmetric matrices
has nonnegative quadratic form by weighted Cauchy–Schwarz.
Its positive operator norm bound is \(2\lambda_{\max}(Q)\le6\).
The skew part of \(P=S^{-1}\nabla S\) uses only
\((s_j-s_i)/(s_i+s_j)\), bounded in absolute value by one.
Its symmetric part has squared norm at most \(3|T|^2\),
so \(|P|\le2|T|\). The compatibility wedge/inverse then gives
\(|b|\le\sqrt3|P|\). These checks verify the stated no-floor
constants on the open positive cone. The subsection states a
horizontal comparison. The temporal relabeling formula and
separate vertical complex-structure discrepancy in the source
remain results of the full source calculation.
[E03A real comparison and round target norms](../notes/05A_REAL_TWISTOR_COMPARISON_20261122.md).

Lines 1294–1304 also append the round \(\mathcal O(1)\) benchmark.
The written identities \(w_S=\eta w_N\),
\(w_N-\zeta\partial_\zeta w_N=z\) and
\(\partial_\zeta w_N=jz\) follow directly. The identification of
the round twistor chart and the projection nonextension claim are outside
the real \(\mathcal O(2)\) result of the designated E03A source.
Those assertions belong to the separate round benchmark evidence.

## Reconstructed chiral curvature

Lines 1307–1364, `subsec:transport-curvature`. The joint
\(\Gamma\) and reconstructed tangent connection preserves \(\Sigma\),
the Hodge operator, and the compatibility inverse. Differentiating
\(b=-\mathscr C^{-1}\mathcal J(P)\) therefore yields the
\(\nabla^\Gamma P\) derivative. The replacement
\(\nabla^\Gamma P=\nabla^A P-[\operatorname{ad}b,P]\)
explains the \(2|b||P|\) contribution.
Differentiate \(SP_X+P_XS=2U_XS\) using
\(\nabla_Y^A S=SP_Y\) and \(2U_X-P_X=P_X^T\).
The remaining products on the right combine to
\(S[P_X,P_Y]\), with that matrix order. Inverting on left
or right multiples of \(S\) yields ratios \(s_i/(s_i+s_j)\)
or \(s_j/(s_i+s_j)\), so the no-floor estimate is legitimate.
The coefficient calculation is
\[
 \sqrt3\left(2(\sqrt3|\nabla^AT|+2\sqrt3|T|^2)
               +8|T|^2+8\sqrt3|T|^2\right)
 =6|\nabla^AT|+(36+8\sqrt3)|T|^2 .
\]
With unordered base pairs counted once,
\(\tfrac12[b\wedge b]\) has norm at most \(|b|^2/\sqrt2\).
The extra factor \(1/\sqrt2\) in the normalized curvature error
therefore contributes at most \(6|T|^2\). The matrix block
norms use \(\Sigma\) and \(\Sigma^-\) of squared norm two.
\(|B_{\mathrm{Ric}}|^2=|\mathrm{Ric}_0|^2/4\), and the
scalar block has squared norm
\(3((s-12K)/12)^2=(s-12K)^2/48\).
This verifies `transport:derivative`, `transport:curvature`,
and `transport:curvature-block` on smooth definite slices.
The proof controls the self-dual chiral curvature and retains
the opposite Weyl block outside that conclusion.
[E09 uniform relative version](../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md).

**Notation correction.** Lines 1315 and 1321 use \(\mathcal E_+\)
for a pointwise curvature norm. Line 334 and the later Weyl
energy calculation use the same symbol for the integrated Weyl
functional. Rename the pointwise quantity in these two equations,
for example to \(\mathfrak R_+\). The displayed bound and block
coefficients remain valid.

## Divergence form and conditional stationary gap

Lines 1897–1953, `subsec:pinched-energy`. Differentiating
\(\mathscr L_Q\) in direction \(X_c\) and applying to \(X_c\)
gives exactly the three stated noncommutator terms, so
`flow:divergence-Q` and `flow:exact-energy-Q` hold using
\(\mu_t=0\) and \(\mu=2K^2dV_{\widehat g}\) at each time.
Under Frobenius pointwise pinching \(m\ge7/8\), \(M\le9/8\),
the coercive contribution is \(-8m|\nabla Q|^2\).
Cyclicity gives
\(\langle q,[X_c,\Xi_c]\rangle
=-\langle[q,X_c],\Xi_c\rangle\),
and the summed absolute commutator contribution is at most
\(4|q||\nabla Q||\Xi|\). Bounding the coefficient of
\(|\nabla Q|\) in \(|\Xi|\) by \(10\) yields the claimed
\(-2\) after absorption. Also
\((7/8)^3=343/512>9/16\), giving the claimed \(-36K\).
The exponential estimate applies throughout the specified
smooth, pointwise pinched interval. For a critical point of
the independent connection functional, \(A_t=0\) gives
a constant solution and the same closed-base inequality forces
\(\mathcal P=0\). This verifies the use of the critical equation
without an additional Einstein premise.
[E05 energy and stationarity](../notes/07_PINCHED_ENERGY_GAP_20261122.md).

**Sign correction.** At line 1937 the literal
\(|\Xi|<10|\nabla Q|\) fails when \(\nabla Q=0\), in which
case \(\Xi=0\). Use \(|\Xi|\le10|\nabla Q|\), or write the
strict comparison between the scalar coefficients before
multiplication. The estimate in `flow:pinched-decay` is unchanged.
In Proposition `prop:pinched-gap` make the spatial and stationary
quantifiers explicit by saying the pinching holds at every
\((x,t)\in M\times[t_0,t_1]\), and that a critical connection on
a closed base is critical for \(\mathcal P\) on the
independent-connection space. Lines 1950–1952 can specify
Fine's fixed-background \(L_k^2\) closeness with integer \(k\ge3\),
as in the accepted source comparison. The stated interval
premise supplies neither its preservation nor compactness.

## Temporal strain criterion

Lines 1956–2045, `subsec:temporal-strain`.
\(S^{-1}(\nabla_cQ)S=2T_cQ-(2/3)h_cQ\) and
\(\operatorname{tr}(Q\nabla_cQ)=2k_c-(2/3)h_cr\) verify the
polynomial \(N_c\). The coefficient sums \(36\) and \(26\)
give \(156=26\cdot6\) on differentiating the \(Q\)-entries.
Conjugating the full derivative of \(C^c\) gives
\(\nabla_a^AN^c+[P_a,N^c]\). The order of the final
matrix product is \(N^c(P_c+B_c)\) because the differentiated
curvature is \(-KS(P_c+B_c)\Sigma\).
The base-slot derivatives and raising of \(c\) are the joint
covariant operations defined in the preceding nonlinear subsection.
The first two relative curvature terms have contraction norm
\(\sqrt6\) from three covector isometries and two-slot
antisymmetrization. The third has norm at most
\(\sqrt2|N|(|P|+|B|)\). This yields
\(4(5/2)\cdot36=360\) and
\(4[(5/2)300+(3/2)252]=4512\).

Since \(\mu_t=0\), the metric logarithmic velocity is trace-free,
and the wedge quotient has \(Q_t=Z+Z^T\).
Writing \(F_t=U\Sigma+V\Sigma^-\), the relative \(Q\) velocity
is bounded by \(2K^{-1}|S^{-1}U|\) and the metric logarithmic
velocity equals \(2K^{-1}|S^{-1}V|\). The combined two-form norm contributes the additional
factor \(\sqrt2\), so the common constant \(4512\sqrt2\) is correct.
The Rayleigh comparison with fixed vectors applies at multiplicities.
Both logarithmic extreme eigenvalues change by at most \(C_*J(t)\).
Their half-difference yields the same bound for \(\log D\), and
the direct lower bound for \(m(t,x)\) in
`flow:temporal-comparison` uses the same exponent. This integrated
statement assumes \(J(t)\) from the initial time, with a finite
improper integral for a uniform estimate up to an endpoint.
[E14 relative curvature and Rayleigh bounds](../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md).

**Sign correction.** At line 2007 the literal
\(2\sqrt6|T|<5|T|\) fails at \(T=0\). Replace by
\(2\sqrt6|T|\le5|T|\), or separate the strict coefficient
comparison. State explicitly that the comparisons apply to
an interval starting at \(0\). At lines 1980–1981,
“prevents metric anisotropy” should read “bounds metric distortion
relative to the initial metric” since the metrics need only be
uniformly comparable. The manuscript keeps higher regularity,
gauge and smooth continuation separate.

## Strain time derivative and principal coefficient

Lines 2047–2118, `subsec:strain-evolution`.
The chain rule for \(T_c=G_Q(\nabla_c Q)\) has both
inverse-square-root terms and the contribution
\([\operatorname{ad}(v_c),Q]\). The time derivative uses a fixed
coordinate base covector slot, for which there is no Christoffel
time term. The base metric derivative enters the norm contraction.
In `flow:strain-commutator`, commuting \(\nabla_c\) and
\(\nabla_a\) on \(X_b\) gives
\([\operatorname{ad}(F_{ca}),X_b]-R^d{}_{bca}X_d\).
The second term in the two successive commutations differentiates
\([\operatorname{ad}(F_{cb}),Q]\). Contracting gives another
\([\operatorname{ad}(F_{ca}),X^a]\), the divergence term, and
\(-\mathrm{Ric}_c{}^aX_a\) from the covector slot.
\(\nabla^aF_{ca}=(d_A^{*\widehat g}F)_c=0\) by self-duality
and Bianchi. The sign of the Ricci term is therefore also
consistent with \(-12K\) from \(4\) times the round commutator.

The product rule on \(X=M_Q(T)\) retains all terms in E15.
\(\Delta_AQ=\nabla^a(M_Q(T_a))\) has one derivative of \(T\).
\(\Delta_AM_Q=DM_Q(\Delta_AQ)+D^2M_Q(X^a,X_a)\), and
\(S_t\) uses the Sylvester equation with \(Q_t\).
In \(\nabla\mathcal N\), the spatial derivative of
\(\Xi\) uses the algebraic compatibility inverse,
\(\nabla^A\Sigma=\operatorname{ad}(b)\Sigma\), and one derivative
of \(T\). The Ricci term is controlled by the chiral-curvature
estimate using at most one derivative of \(T\). This confirms
the stated derivative count and locates the single two-derivative
term \(G_Q\mathscr L_QM_Q((\Delta_AT)_c)\).
On each symmetric off-diagonal line, \(M_Q\) and \(\mathscr L_Q\)
are scalars with their stated multipliers. On the diagonal
trace-free plane, \(ST S=QT\) and \(\mathscr L_Q=2M_Q\).
Since \(G_Q=M_Q^{-1}\), the principal coefficient is
\(\mathscr L_Q\) itself, with Frobenius bounds \(4m,4M\).
The resulting symbol is for the constrained derived strain.
The round equation keeps the internal curvature action and
combines \(-24K-4(3K)=-36K\) as in E15.
[E15 full chain rule, commutator and principal coefficient](../notes/17_STRAIN_EVOLUTION_STRUCTURE_20261122.md).

## Energy anchor and spatial transport

Lines 3175–3227, `subsec:transport-anchor`.
The cost is a path infimum on a connected base. It is
reparametrization-invariant and measured by the real target-fiber
norm, whose reciprocal coefficient is \(\sqrt{5/(4\pi)}\).
In an \(A\)-parallel frame the right derivatives of the minimum
and maximum eigenvalues are the extremal Rayleigh quotients
of \(Q'\) on the corresponding fixed eigenspaces. They choose
orthogonal attaining unit vectors when the extreme eigenspaces
differ. At triple multiplicity they choose extremal eigenvectors
of \(Q'\), which can also be orthogonal. The common scalar
term cancels in the derivative of \(\log D\).
The difference of the two rank-one orthogonal projections has
Frobenius norm \(\sqrt2\), which checks the path coefficient.
Positivity on the compact path gives the absolute continuity used
for integration and requires no uniform lower eigenvalue input.

On a closed compact slice the positive volume measure and
energy monotonicity give a point with \(|q|^2\le e_0\).
Trace-freeness yields \(|q|^2\ge3|\lambda_i-1|^2/2\),
so \(r=\sqrt{2e_0/3}<1\) is correct.
For the lower eigenvalue, \(3=m+\lambda_2+M\le m+2M\)
gives \(m\ge3/(1+2D^2)\); the path bound gives \(D_*\).
Integration of \(|\nabla^AQ|\le6|T|\) gives the last estimate.
The illustrative constants give \(1/16+6/96=1/8\).
The theorem applies at each smooth definite time at which the
measured cost premise holds. Applying the pinched-energy result
throughout an interval requires the spatial cost hypothesis
throughout that interval, as stated. To avoid conflating the
free cap \(C_*\) here with the fixed \(4512\sqrt2\) in the temporal
subsection, use a distinct symbol such as \(C_{\rm path}\).
[E04 energy anchor and path proof](../notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md).

The audit concerns the six supplied subsections against their accepted
inputs, with the exact checks above. The manuscript was held fixed
for the comparison. This assessment establishes neither the remaining
flow hypotheses nor independent peer review.
