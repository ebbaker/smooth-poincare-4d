# E120 — Integration audit of the multiscale and nonlinear linear-bound results

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I authored E22, E47, E114 and E117 and did not author
E112, E116 or E115. This is an integration audit of the lead-assessed
results. No external source was newly inspected and no build was run.
[Request][req] · [Packet return][ret].

## Disposition

The frozen manuscript integrates the three assessed results at their
stated mathematical scopes. I found no blocking proof gap. The short
precision edits below would put the fixed round restriction directly
in the abstract and make the compressed tangent trace and adjusted
velocity order count explicit.

I consumed the 334633-byte manuscript with SHA-256
716548123cc50e862cf04fcc30fe56335376b652d9442ad86169ed3f93297907.
The audit covers the new abstract and introduction sentences
(frozen lines 63 and 316–319), the complete new subsections
(frozen lines 6989–7367), and the specific internal dependencies
identified below. The manuscript was released to the lead after
consumption. The line numbers in this audit belong to those bytes.
[Frozen manuscript location][ms] ·
[E112/E114 assessment][a112] · [E116/E117 assessment][a116] ·
[E115/E118 assessment][a115].

## Linearized multiscale integration

The native \(F_{0i}\) wedge Gram is the identity times \(dV_G\).
The derivative of trace division at its identity is the trace-free
projection, so the symmetrized two wedge variations give exactly
\(DQ_{A_0}=2\operatorname{tf}L_0d_0\). The normalized block computes
the composition with the physical linearized velocity on any
smooth trace-free symmetric \(q\). Since
\(G=2K\widehat g\), the fixed rough Laplacian in the normalized
metric is \(2K\) times the native one. Changing \(\tau=2Kt\)
sends its scalar reaction \(-24K\) to \(-12\) and leaves the
diffusion coefficient four. The native velocity is
\(-4d_{0,G}^*(qF_0)\), since the inverse metric in the two-form
adjoint supplies the inverse clock factor. Its time integral
starting at \(a_N\) has defect \(q_N\) by the established
operator composition and equality at zero. This gives an
actual linearized connection trajectory with attained tangent,
including \(T_N=D_0q_N/2\). The annihilation of both reference
orbit directions follows by differentiating the constant
\(Q=I\) on the orbit. The nonlinear curvature identity at
\(A_0+a_N\) is correctly confined to initial values.
[Frozen lines 7038–7060, 7092–7099][ms] ·
[E112, tangent and native conventions][e112] · [E114][e114].

The normal-ball atom and support collars agree with E112.
Normal metric and radial connection coefficients give an
\(O(r^3)\) change of the one-form on freezing \(F_0\) at \(p\),
with first and second derivative sizes \(O(r^2),O(r)\).
For the defect, the covariant exterior derivative contribution
from \(A_0\,a^{(r)}\) changes at the same \(O(r^2),O(r)\) orders.
The coefficient \(L_0(x)-L_0(p)\) is \(O(r^2)\), with derivative
\(O(r)\); multiplying it by the bounded frozen derivative and
its \(O(r^{-1})\) derivative preserves the stated orders. The
frozen projection \((d\rho\wedge\iota_XC)^+=(\rho/2)C\)
gives \(f(u)=\chi(u)+u\chi'(u)/4\), including the factor \(1/4\).
Disjoint annuli give the native pair value bound. Differentiating
the error uses the actual connection and does not lose an
extra inverse radius.
[Frozen lines 7062–7099][ms] · [E112, (4)–(6)][e112].

The primary compact-pair hypothesis is met by a sufficiently small
closed ball of diameter below the native injectivity radius,
including all supports and an \(x\) neighborhood of \(p\).
The existing point-of-dependence citation is appropriate:
Ludewig's Theorem 1.1, with zero expansion order, zero time and
second-variable derivative order and first-variable orders through
two, bounds the differentiated Gaussian quotient remainder by
\(O(s)\). The fixed metric connection Laplacian and real bundle
(or its complexification) meet the source hypotheses. The smooth
coefficient has fiber identity on the diagonal by the approximate
identity. The two ordered \(x\) derivatives of the Gaussian
have the quadratic first-distance-derivative term and the
distance Hessian term. At \(p\) the first derivative is
\(-2y^\flat\) and the Hessian is \(2G_p+O(|y|)\). These supply
the \(s^{-3}\exp(-|y|^2/(8s))\) bound. At \(s=r^2v\) the
rescaled full \(11\) Hessian has the Euclidean Gaussian
Hessian leading term. One derivative on the kernel coefficient
improves the scaled term by \(O(r)\) and two by \(O(r^2)\).
The atom and normal volume errors cost \(O(r^2)\) after
scale normalization. Projection on the transported unit \(M\)
then gives the verified \(\mathcal H(v)+O(r)\) limit, with
\(\mathcal H(v)\) having exactly the factor \(1/(1024v^5)\)
and the positive sign when \(0<v<1/12\).
[Frozen lines 7101–7141][ms] · [E112, (7)–(11)][e112] ·
[E114, primary inspection and own-scale verification][e114].

On the \(k\)-th heat window, an atom of radius \(r_j\) has
volume \(O(r_j^4)\), so the \(s^{-3}\) kernel bound leads to
\(r_k^{-2}(r_j/r_k)^4\exp(-(r_j/r_k)^2/(8b))\).
The coarse sum is exponentially suppressed and the fine sum
is geometric at fourth power. These are absolute estimates
on the whole curved atoms. Fixing \(R\) first gives a uniform
off-scale error bound, then taking \(\sigma\) small bounds the
own-scale error. Choosing \(\sigma\) yet smaller to require
\(br_1^2/4<T_*\) is valid for every fixed \(T_*>0\). It is
independent of \(N\); the damping lower bound only improves
and the ratios are unchanged. The disjoint native windows
have lengths \((b-a)r_k^2/4\), so the positive factor is
\(h_*(b-a)e^{-3br_1^2}/8\) times \(N\delta_N\).
The proof differentiates the output heat kernel, with the
two covariant slots retained. It does not commute the
covariant derivative through the semigroup.
[Frozen lines 7143–7170][ms] · [E112, scale sums][e112] ·
[E114, independent check][e114].

## Lorentz convention and upper estimate

On a positive-volume radial subannulus, \(|f'|\ge m>0\).
The fact that \(f\ne0\) follows from
\((u^4\chi)'=4u^3f\) and compact support. A nonzero smooth
compactly supported \(f\) has nonzero derivative somewhere.
The leading strain is \(r^{-1}f'(\rho/r)d\rho\otimes M\),
with norm \(r^{-1}|f'|\) because \(|d\rho|_G=|M|=1\).
The \(O(r)\) covariant error is absorbed on the lower region
by a fixed decrease of \(\sigma\). Normal density comparisons
give both positive subannular lower volume and whole-annular
upper volume at order \(r^4\). Thus the strict superlevel
sandwich holds including exact amplitude thresholds.
For \(1\le\theta<\infty\), the generalized-inverse relation
\(\{|w|^*(s)>\lambda\}=\{0<s<\mu(\lambda)\}\) gives the
factor \(4\) by multiplying the layer's \(\theta\) by the
inner integral factor \(4/\theta\). At \(\theta=4\) this is
the ordinary \(L^4\) norm. The weak formula follows by
approaching each positive threshold from below in the same
rearrangement equivalence. The upper bands sum the geometric
tail, including the band from zero and the vanishing
distribution at and above the top threshold. The lower
bands give a fixed contribution per annulus and are disjoint
for \(R>2\). Thus the displayed orders, including the weak
case and their \(N\)-independent constants, agree with E116.
Dividing the derivative lower bound by each initial norm
excludes a uniform linear bound at all \(1<\theta\le\infty\).
[Frozen lines 6996–7006, 7172–7206][ms] ·
[E116][e116] · [E117][e117].

The attained normalized strain equation has the exact E22
operator. The tensor commutator supplies \(-4\mathrm{Ric}\)
on the covector slot and two identical internal curvature
actions; \(D_0F_0=0\). Together with the defect reaction
\(-24K\), this gives \(4\Delta_{\mathcal V}-36K\) and
the displayed \(8[\operatorname{ad}F_0,\cdot]\) contraction.
Smooth uniqueness identifies the attained path with the
full-bundle semigroup. In the native convention the
two-slot covariant norm and the squared one-slot norm both
scale by \((2K)^{-1}\), canceled in the time integrals by
\(d\tau=2K\,dt\). The \(L^{4,1}\) layer factor from the
volume scaling is canceled by the one-form amplitude
scaling. The revised proof properly invokes the separate
linear derivative estimate in the preceding E22 subsection,
giving \(I_N\le C\sqrt N\). It does not infer it from the
combined linear-plus-quadratic bound alone. The separate
squared-strain bound is \(C\|T_N(0)\|_{4,1}^2\) and is
finite for finite \(N\). The integrated text properly gives
no matching order for this term or the full budget.
[Frozen lines 6894–6944, 7208–7226][ms] ·
[E22][e22] · [E117][e117].

## Nonlinear finite-window derivative argument

The proposition quantifies over any fixed positive value and
strain neighborhood in the established smooth round basin.
Choosing \(br_1^2/4<\mathcal T/4\) before \(N\) puts all the
native windows inside the actual recovered head before the
\(\mathcal T/2\) splice. For each finite \(N\), the finite
union \(W_N\) stays in a compact positive strip, even though
its earliest time can approach zero as \(N\) grows. The
fixed-\(N\) smooth polynomial compatible datum lies in the
stated neighborhood for sufficiently small positive
\(\varepsilon\). Its high norms need not be controlled
uniformly in \(N\).
[Frozen lines 7233–7269][ms] · [E115][e115] · [E118][e118].

The cited rough construction and smoothing lemma supply a
common small datum ball for the compact finite-dimensional
parameter ball and a jointly smooth lifted solution map.
The identity \(\Psi(z,0)=0\) also makes its parameter
derivatives at zero datum vanish. The proof uses joint
operator-norm continuity of \(D_u\partial_z^\alpha\Psi\),
not only Lipschitz smoothing. The compactness argument
is valid: if the joint limit to its value at zero failed
uniformly in \(z\), take a convergent subsequence of
parameters and use joint continuity at the limit and at
zero. Apply the mean value identity to
\(u_\varepsilon/\varepsilon\to(a_N,d_0a_N)\) in fixed
\(C^0\). For fixed positive strips, the inverse transport
patches have bounded smooth coefficients and use continuous
representatives of the completed solution space. Finite
patch differentiation uses precisely the mixed parameter
derivatives through \(k\). The unlifted derivative in the
completed space and the strip derivative have the same
value limit, so the derivative's continuous trace is
\((a_N,d_0a_N)\). No assertion about derivative convergence
at \(\tau=0\) is needed.
[Frozen lines 2749–2763, 2825–2832, 3800–3851, 7271–7300][ms] ·
[E118, Taylor limit and trace][e118].

The curvature component of the tangent pair on positive
strips is \(d_0b_N\) by the actual compatibility identity.
The first-order tangent defect map therefore gives
\(q'_N=DQ_{A_0}(b_N)\), and the continuous curvature trace
gives \(q'_N(0)=DQ_{A_0}(a_N)\).
In the adjusted equation, the vertical gauge uses a
fixed base adjoint and at most two connection derivatives.
The horizontal gauge involves two connection derivatives
and one curvature derivative through the live adjoint;
its contraction with \(F_A\) adds no differentiation.
The physical velocity involves at most one curvature
derivative. Thus \(k=3\) yields \(C^1\) convergence for
the spatially linearized right side on the fixed strip,
which justifies applying \(DQ_{A_0}\) to the time-integrated
limit. The gauge generator vanishes at \(A_0\); its
variation enters only as a reference orbit tangent and
is annihilated. In the physical term, cancel the constant
multiple of \(F_A\) by Bianchi and self-duality before
linearizing. The other coefficient vanishes at perfection,
so the physical derivative is \(-4d_{0,G}^*(q'_N F_0)\).
The native equation and its continuous trace give equality
with \(q_N\) by the positive-time \(L^2\) difference
identity and a limit to zero. These are the exact E115/E118
premises of the compressed step.
[Frozen lines 7302–7319][ms] · [E115, section on the strain derivative][e115] ·
[E118, adjusted equation audit][e118].

The \(C^2\) strip limit suffices for the strain in \(C^1\)
and its full live covariant derivative in \(C^0\).
The internal and base connection differences are uniformly
small and multiply the \(O(\varepsilon)\) strain. The live
tensor factors converge uniformly, allowing the spatial
suprema to converge. The initial live \(L^4\) norm divided
by positive \(\varepsilon\) has the stated limit by the
smooth fixed datum and convergence of the initial metrics
and volume forms. Exact per-slice pullback naturality
identifies the original supremum with the adjusted one,
with no differentiation of the recovery map in the
perturbation parameter. The square term is nonnegative and
can be discarded, and the finite window union is contained
in the same compact strip. The limit at fixed \(N\) then
gives \(c\sqrt N\le C C_0 N^{-1/4}\). Sending \(N\) to
infinity only after that limit proves failure of the
uniform linear bound. The final paragraph appropriately
limits the result and disclaims any general nonlinear
unboundedness assertion or failure of arbitrary moduli.
[Frozen lines 7321–7367][ms] · [E115][e115] · [E118][e118].

## Exact precision edits for lead integration

1. At frozen line 63, change the first added clause to
   “Actual round multiscale tangents identify Lorentz index one
   as the threshold for a uniform linear derivative-integral
   bound in the fixed round linearized flow.” In the next clause
   add “on the round value basin” to the nonlinear exclusion.
   The introduction at lines 316–319 can likewise say “linearized
   multiscale examples” and identify the round value basin.
   This keeps the threshold clause with the precise theorem
   whose upper bound is E22.
2. At lines 7101–7122, identify the compact pair set as the
   product of the closures of a fixed ball of diameter below
   the injectivity radius, and choose a fixed upper heat time
   \(0<s_0\le1\). Add \(br_1^2\le s_0\) to the scale choice at
   lines 7157–7159. The proof already makes such a choice
   implicitly through the own-scale smallness. Also specify
   “for finite \(\theta\)” just before the layer identity at
   line 7190, and write \(1<\theta\le\infty\) in the concluding
   failure claim at line 7035.
3. At lines 7293–7308, make the tangent antecedent explicit:
   “The strip limit is the continuous value derivative
   \(U'_N=D_u\Psi(0,0)[(a_N,d_0a_N)]\) from the completed
   solution space. Its trace is \(U'_N(0)=(a_N,d_0a_N)\).”
   Then write \(U'_N=(b_N,B_N)\), \(B_N=d_0b_N\) on positive
   strips and \(q'_N=DQ_{A_0}(b_N)\). Include the short
   jet count before the time-integrated passage: “The adjusted
   right side contains at most two connection derivatives
   and one curvature derivative, so \(k=3\) gives its
   first-order spatial limit in \(C(I;C^1)\). Applying the
   first-order \(DQ_{A_0}\) to the integrated limit is therefore
   justified.”
4. At lines 7239–7251, specify that the two value norms use the
   fixed native reference, while strain norms are live. In the
   nonlinear proof rename the compact strip at lines 7259 and
   7322–7328 to \(I_N^{\mathrm{strip}}\). This distinguishes
   it from the round derivative integral \(I_N\) at line 7027.

These are precision and proof-explicitness edits. The assessed
mathematical ingredients already support the stated conclusions.

## Labels, sources and provenance

In the exact frozen source I checked 291 unique labels against
all explicit reference keys, and 33 unique bibliography items
against all citation keys. There were no duplicates or missing
keys. All 33 bibliography items are in first-citation order.
In particular Ludewig2019 first occurs at frozen line 6918 in
the E22 subsection, its new compact-pair occurrence is at
line 7113, and the single item at 7866 retains its correct place.
The new proofs refer to the round defect, rough construction,
smoothing, Lorentz heat and smooth basin labels at their points
of use. The new argument has no additional primary dependency.
No new primary passage inspection, build or shared edit was
performed in this audit.
[Manuscript location][ms] · [E114 primary record][e114].

The E118 authorship correction is preserved. E118 authored
E42, E84 and E112 and did not author E115, E50, E63 or E114.
The contrary E42 statement in the frozen E118 request is
historical; E118's audit, return and lead assessment explicitly
correct it. E115 authored E50 and E63, and did not author E42,
E84 or E112. Thus the E118 check addresses the new E115
implication with assessed overlapping inputs, consistent with
the lead assessment and this integration audit.
[E115][e115] · [E118 request][req118] · [E118][e118] ·
[E118 return][ret118] · [E115/E118 assessment][a115].

| Consumed file | SHA-256 |
| --- | --- |
| [E120 request][req] | 0fd439c9a7cc43695ec1fb217b57ddbd4e05121583b29e191fbfe15350a63dcd |
| Frozen manuscript (334633 bytes) | 716548123cc50e862cf04fcc30fe56335376b652d9442ad86169ed3f93297907 |
| [E112][e112] | f3d34f89645c81128a8d16544eb1248f1839249ed7c3c6bdbd0e51e2fa43c856 |
| [E114][e114] | 585cc5c5bcadf2c61672a8be16116507bbc90b65a6688f8caa3e58f3ef572478 |
| [E116][e116] | bba74ee73fc53fd7707d4489d6b9f1dbe67957fb9517f972bfba584522a1327c |
| [E117][e117] | 60f42944e9fb00cbb7ff33cb007ab97fcb60b9f93b32867d7f4462f1684d348b |
| [E115][e115] | e4c7ce1ff2c90d57c9e5974e6dcb8b7f6520ce6337df29a9421b3744da72b863 |
| [E118][e118] | fc7ac157a00dd2cccd29a7d68c0b9fb4ff3669baf444aac3088229d650d095e5 |
| [E22][e22] | 6d25f4b39c2f75a407f73b2fd7a913cebbe46576cc39a00832b2d0cbf828a22b |
| [E112/E114 assessment][a112] | 3955a28ce41c134a66216c7cbce2083ca2dcc3c633b8a73a0ed08be0b165b58c |
| [E116/E117 assessment][a116] | 52b1f3dff1efc6080b241cf3d603bf1a49d83c9c48fa97352be796efdd03f977 |
| [E115/E118 assessment][a115] | 6da204952b63a6fe38456f01b1b852744fe1602aebce3a451528b672404db6e1 |
| [E118 request][req118] | a77657bb344fa57e238f37f3cbfc839097172edba0e74c074c44fbe1b1d9552e |
| [E118 return][ret118] | 3a42a4aee8d572e567f0a3d398aab128d5e5719eb71adbd8bdf362957f583ba5 |

[req]: ../research-progress/handoffs/SP4-CME-E120_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E120_RETURN_v1.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e112]: ../notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e114]: E114_ROUND_MULTISCALE_BUDGET_AUDIT_20261122.md
[e116]: ../notes/116_ROUND_ANNULAR_LORENTZ_NORMS_20261122.md
[e117]: E117_ROUND_LORENTZ_NORMS_AUDIT_20261122.md
[e115]: ../notes/115_NONLINEAR_LINEAR_BUDGET_TEST_20261122.md
[e118]: E118_NONLINEAR_LINEAR_BUDGET_AUDIT_20261122.md
[e22]: ../notes/22_ROUND_LORENTZ_HEAT_20261122.md
[a112]: E112_E114_ROUND_MULTISCALE_ASSESSMENT_20261122.md
[a116]: E116_E117_LORENTZ_THRESHOLD_ASSESSMENT_20261122.md
[a115]: E115_E118_NONLINEAR_LINEAR_BUDGET_ASSESSMENT_20261122.md
[req118]: ../research-progress/handoffs/SP4-CME-E118_REQUEST_v1.md
[ret118]: ../research-progress/handoffs/SP4-CME-E118_RETURN_v1.md
