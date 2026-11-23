# E87 local-section and intrinsic orbit-budget manuscript audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
I authored E83. This audit compares the lead-authored TeX integration
against E82–E86. E85 independently audited E83 and the combined local
section argument. Line numbers below refer to the frozen manuscript.
[Frozen request][req] · [E85 local-section audit][e85] ·
[E86 orbit-budget audit][e86].

**Disposition.** The varying inverse and pointed smooth section carry
the assessed results. The intrinsic orbit-budget proof carries the
exact naturality and representative argument. State explicitly that
the final strain threshold meets both critical thresholds, since
the smooth recovery corollary reduces the budget theorem's threshold.
Two short additions would also make the elliptic symbol and open
coefficient locus explicit at the point of dependence.

## Varying inverse and native normalization

**4268–4348, `lem:varying-slice-inverse`.**
In the native normalization the perfect curvature is an isometry
onto the positive self-dual plane. The three orthonormal forms have
contractions of length \(|u|/\sqrt2\) with \(u\), giving
\(S_0^*S_0=3I/2\). For \(w_\xi(e)=\xi\otimes e\) the quaternionic
relations give \(|S_0^*w_\xi e|^2=|\xi|^2|e|^2/2\).
The displayed orthogonal fiber projection then gives
\(w_\xi^*\mathsf P_0w_\xi=\tfrac23|\xi|^2I\). This is the fixed
real-covector positive symbol under the \(i\xi\) convention.
The quadratic form is nonnegative, Gårding controls the \(H^1\)
norm modulo \(L^2\), and elliptic regularity and compact resolvent
give a finite-dimensional smooth \(N\). Compactness proves
coercivity on \(H^1\cap N^\perp\) because a normalized
contradicting sequence with vanishing form has a strong \(L^2\)
limit in \(N^\perp\cap N\), which is zero, and then Gårding
contradicts its unit \(H^1\) norm.
[E71, (2)–(6)][e71].

The E79 varying map uses \(C_B=S_0^*S_B\) and the same fixed
adjoints. \(C_B^{-1}\) exists by the reference value \(3I/2\)
and a Neumann bound on the curvature difference. Thus
\(H_BS_B=I\), \(S_0^*\mathsf P_B=0\), and
\(\mathsf P_B\) is identity on \(\ker S_0^*\) with kernel
\(\operatorname{im}S_B\). The weak form at 4326–4328 keeps
the adjoint on the test side:
\[
 \langle\mathcal K_B\phi,\eta\rangle
       =(\mathsf P_B(d_0\phi+[b,\phi]),d_0\eta)_2.
\]
For \(\eta\in N\), \(d_0\eta\) belongs to \(\operatorname{im}S_0\),
so the form and \(d_0^*\mathsf P_Br\) annihilate \(N\).
This is a projection of the output only. It imposes no requirement
\(\mathcal K_B N=0\). In the weak difference, the principal term
has coefficient \(\mathsf P_B-\mathsf P_0\) and the other
term contains \(\mathsf P_B[b,\phi]\). Their fixed value bounds
give the displayed norm of the perturbation \(H^1\to H^{-1}\).
The fixed weak inverse on \(N^\perp\) and a sufficiently small
value radius give a uniform Neumann inverse. The decomposition
uses \(I=S_BH_B+\mathsf P_B\), with
\(d_0^*s=d_0^*\mathsf P_Br-\mathcal K_B\phi=0\).
This proves the claimed weak bound, and applying \(d_0^*\mathsf P_B\)
and \(H_B\) to any other splitting proves uniqueness with
\(\phi\perp N\). Smooth elliptic regularity gives the higher
orders with coefficient-dependent constants.
[E79, (1)–(8) and (11)–(13)][e79] · [E80 audit][e80].

The residual projection onto \(\mathcal X\) is orthogonal at
\(A_0\) in \(L^2\) and bounded at each fixed Sobolev order by E71
(11). In dimension four \(H^{n+3}\) bounds \(C^n\), and the
\(C^{n+3}\) norm bounds \(H^{n+3}\) on the fixed compact manifold.
This gives the manuscript's three-grade estimate at 4353 and
the fixed tame complement. The note at 4393–4399 correctly
allows the full orbit image to have an additional residual in
the fixed slice. In particular the residual projection applied
to \(d_BN\) gives a finite-dimensional subspace of \(\mathcal X\);
the restricted image is its complementary orbit component in
that decomposition. No full orbit splitting is inferred from
the restricted solver. [E71, (7)–(11)][e71] ·
[E79, (8)–(10)][e79].

## Augmented block and primary theorem

**4357–4391.** The fixed projection \(p_N\) has codomain \(N\),
and \(i\) is its smooth inclusion into sections. Applying
\(p_N\) to the first row and using \(p_N\mathcal K_B h=0\)
gives \(x=p_Nk\). The second row gives the \(N\) component
\(iy\) of \(h\). Thus the parentheses at 4369 are in the
annihilator, even when \(\mathcal K_Biy\ne0\). The example's
fixed input constraint has \(|p_Nh|\le\|h\|_{H^1}\), and
\(\|ix\|_{H^n}\le C_n|x|\), giving Hamilton's order-two
finite-rank bounds. For the actual forcing \(k=d_0^*\mathsf P_Br\),
\(y=0\), the finite correction is zero and the recovered solution
is the stated \(\phi\perp N\). [E82, (5)–(7)][e82] ·
[E85, elliptic block][e85].

At 4372–4382, the required real-covector ellipticity concerns
\(\mathcal K_B\), the differential part of the block. An explicit
one-line check is
\[
 \operatorname{Re}\langle w_\xi^*\mathsf P_Bw_\xi e,e\rangle
 \ge \bigl(\tfrac23-\|\mathsf P_B-\mathsf P_0\|_\infty\bigr)
                 |\xi|^2|e|^2 .
\]
The scalar block is generally nonsymmetric, so this estimate
tests the Hermitian part on real covectors with complex
fiber vectors as allowed. The inverse formula extends to a
bounded isomorphism \(H^2(E)\times N\to L^2(E)\times N\) using
the weak estimate and elliptic regularity. A small \(C^0\)
perturbation of all strong coefficients is small in the
corresponding operator norm. The same fixed block therefore
stays invertible by Neumann series, and ellipticity and smooth
regularity persist. This is the open locus in the full smooth
coefficient space. Nearby arbitrary coefficients need not obey
the geometric cancellation \(p_N\mathcal K_B=0\). Both steps
are proved in the assessed inputs. A sentence stating the
block realization and this openness would justify the short
invocation directly in the manuscript.
[E79, (11)–(13)][e79] · [E82, (5)–(7)][e82] · [E85][e85].

The strong coefficient section depends on \(J^2b\), since
\(\mathsf P_B\) is a smooth first-jet function and \(d_0^*\)
differentiates it. The forcing \(d_0^*\mathsf P_Br\) uses
that same second jet of \(b\) and one jet of \(r\). Hamilton
II.3.3.3, p. 158, with II.3.3.4, pp. 158–159, is the
augmented inverse theorem used here. The setup for the mixed
coefficient \(C^n\) and section \(W^{n,p}\) gradings is
pp. 155–156, with \(p=2\) in this application. The different
gradings are tamely equivalent by the fixed Sobolev shifts.
This use yields a local smooth tame family with a fixed
grade shift at each derivative order. The high coefficient
norms can appear in those estimates. The value-uniform weak
bound does not replace them. The native trivialization of
the actual lift
\(Y=\chi_{A_0}(u)+\operatorname{vert}(\phi-b(u))\)
is a smooth zeroth-order bundle operation and has the claimed
grade. [E82, coefficient and solver checks][e82] ·
[E85][e85] · [Hamilton, II.3.3][ham].

## Full chart and pointed section

**4402–4491, `thm:smooth-local-slice`.**
The invariant metric \(k\) is positive on the fixed complementary
horizontal and vertical spaces, and right translations are isometries
by \(\operatorname{Ad}\)-invariance. Haar averaging commutes with
the fixed Levi–Civita derivative of \(k\), so the invariant model
space is a tame degree-zero retract. The pointwise exponential
is equivariant, and its logarithm is defined on a uniform diagonal
tube. Small \(C^1\) norm gives a local diffeomorphism throughout
the radial path. Compactness gives a covering, and orienting the
total space by the oriented base and oriented fiber makes its
homotopy degree one. Thus it is a diffeomorphism. Equivariance
of the inverse makes the induced base maps inverse
diffeomorphisms, with the forward base map isotopic to identity.
The logarithm chart is relatively open by its \(C^0\) diagonal
and \(C^1\) bounds. The model space product is tame. Hamilton
II.1.3.1–1.3.4 and II.1.3.9, pp. 136 and 139, and
II.2.2.6–II.2.3.6, pp. 145–149, are the checked compact
section, finite-jet, composition and inversion passages.
[E83, charts][e83] · [E85][e85] · [Hamilton][ham].

An equivariant bundle automorphism carries the fundamental vector
for \(\xi\) to that same fundamental vector. Hence it preserves
connection reproduction and equivariance and pulls back
horizontal, equivariant tangent forms within the same space.
Subtracting \(A_0\) therefore centers the affine expression in
the target section space. In coordinates \(g^*B=B(g)Dg\);
the direct and inverse pullbacks use smooth tame composition
and one spatial derivative of the map or inverse. The
inverse fiber derivative \(L_Z^{-1}\) is a zeroth-order
smooth map. For \(g_t=h_tg_Z\), differentiation of the
active pullback yields after undoing \(g_Z^*\)
\[
 s+\mathcal L_Y B=s+d_B(B(Y))+S_B(\pi_*Y).
\]
The curvature bracket in \(\iota_Y F_B\) combines with
the covariant derivative to give the Cartan formula. This
has the positive sign, as opposed to Fine's inverse-pullback
infinitesimal action in his Lemma 3.2. Solving for target
\((g_Z^{-1})^*r\) and assigning
\(\dot Z=L_Z^{-1}(Y\circ g_Z)\) with the actual \(B\) lift
makes \(D\mathcal F(\dot Z,s)=r\). The chart opens in the
full invariant space, and \(\phi\perp N\) is an internal
solver choice. Joint tameness follows from the indicated
maps for every target tangent and each point of the open
product chart. For any fixed order of parameter variation,
composition and inversion use only finitely many extra
spatial derivatives, independent of the output grade.
[E82, (10)–(11)][e82] · [E83, (1)–(3)][e83] ·
[E85][e85].

The Hamilton invocation on p. 172 at 4478–4480 matches
III.1.1.3. The pointed value is supported by its proof,
which the integration cites separately at 4481–4488.
The product sequence-space reduction, translation and
linear changes in III.1.2 center a specified preimage.
Algorithm III.1.5.1 starts with zero, III.1.6.9–1.6.10
bounds its paths and limit by the target norm, and
III.1.7.1 makes the limit a smooth tame right inverse.
Zero target has zero limit through the constructed section.
Undoing the normalizations gives \(g(A_0)=\operatorname{id}\)
and \(b(A_0)=0\). The value-tube shrink follows by continuity
of \(b(A)\) and \(F_{A_0+b(A)}\). These are open smooth
neighborhood claims and impose no uniqueness modulo
stabilizers. [E83, pointed applicability][e83] ·
[E85][e85] · [Hamilton, III.1.1–1.7][ham].

## Saturation, norm and time invariances, and limit

**4493–4566, `cor:intrinsic-orbit-budget`.**
For \(A=g^*B\) with covered \(f\) and internal isometry \(U_x\),
the curvature transforms on both base slots and by \(U_x^{-1}\)
on its internal slot. The positive self-dual plane and
\(\tfrac13\sum_i F_i\wedge F_i\) both pull back. These determine
the metric, so \(g_A^{\rm F}=f^*g_B^{\rm F}\) and the volume
is \(f^*dV_B\). The normalized wedge Gram transforms by
\(Q_A=U^{-1}(Q_B\circ f)U\). Its square root, inverse and
trace-free part are conjugation equivariant. The pullback
product connection intertwines the internal derivative and
the live Levi–Civita derivative on base slots. Thus \(|T|\)
and \(|\nabla T|\) compose with \(f\). The pullback volume
preserves the distribution function of \(|T|\), and the
fourth-root layer formula then gives identical Lorentz strain.
There is no reference-coordinate comparison constant in this
equality. [E84, (1)–(6)][e84] · [E86][e86].

The pullback is an isometry for the live \(L^2\) pairings,
so it intertwines the covariant exterior derivatives and
their adjoints. The polynomial in \(Q\) and the curvature
factor have the same covariance. Thus a fixed \(g\) pulls back
the native original trajectory at unchanged time, and the
onto base map preserves the integrand supremum. Under the
constant conversion \(c=2K\), \(g^{\rm F}=c\widehat g\) and
\(\tau=ct\), the endomorphism tensors retain their internal
norm convention and the Levi–Civita derivative is unchanged.
The native \(|T|^2\) and \(|\nabla T|\) both acquire \(c^{-1}\),
which cancels \(d\tau=c\,dt\). In the initial Lorentz norm
the modulus scales by \(c^{-1/2}\) and the measure by \(c^2\).
Taking one-quarter power of the distribution measure and
changing the layer variable cancels the two factors. This is
the exact four-dimensional invariant used at 4533–4536.
[E84, timewise transfer][e84] · [E86, clocks][e86].

Shrinking the smooth section domain makes its representatives
satisfy both fixed slice equations and the joint \(\rho\) value
bound. For a datum \(A'=h^*A\) in the saturation, if the local
section writes \(A=\gamma(A)^*B\), then
\(A'=(\gamma(A)\circ h)^*B\). Each fixed pullback is
a smooth-topology homeomorphism and the union is open,
invariant and contains the round orbit. This does not require
choosing a single section on the union. It keeps the same
representative value bound on every translate.

The fixed-slice estimate gives
\(\delta_B\le C_{\rm sl}\ell(B)=C_{\rm sl}\ell(A_{\rm in})\).
At 4550–4553, specify the **common** critical threshold
\(\epsilon_{\rm cr}\) for the budget theorem and its
decreased-threshold recovery corollary. For example,
\(\ell_*=\epsilon_{\rm cr}/(2C_{\rm sl})\) meets both.
The frozen earlier 3977–3985 is already corrected to identify
the critical-budget recovery. The \(m=6\) critical tail
supplies its smooth limiting \(j_\infty\). Composition of the
two fixed pullbacks gives
\(g^*j_\infty^*=(j_\infty\circ g)^*\) for the limit
connection, curvature and native round metric. Smooth
exponential decay at each fixed order persists after a fixed
smooth pullback, with a constant allowed to depend on that
map and datum. Budget constants are uniform across the
saturation from exact invariance. At 4558, "requires no bound
on derivatives of \(g\)" is more precise than "uses no
derivatives of \(g\)" because \(Df\) occurs in the norm
transport identity. [E84, (8)–(11)][e84] · [E86][e86].

## Scope, cross-references and source status

The abstract at 63, introduction at 302–304, preceding
transition at 4248–4251 and challenges at 6249 keep the
conclusion on the smooth round-orbit neighborhood. Adding
“sufficiently small” to the intrinsic Lorentz-strain condition
in these summaries would carry the corollary's actual
threshold explicitly. The smooth topology may require
higher finite norms. The open saturation and strain condition
give no placement throughout the value-small or critical
basins and no initialization on other homotopy spheres.
The interval hypotheses discussed at 6224–6230 remain
conditional on an arbitrary homotopy sphere and do not
contradict the fixed-round orbit-budget result.

All seven distinct internal reference targets used by the
new subsection resolve uniquely. The 32 distinct citation
keys agree with the 32 manual bibliography entries in
first-use order. `Hamilton1982NashMoser` first appears at
4380 and is entry 28 at 6449–6453, matching the canonical
July 1982 original, DOI and pagination. The cited Hamilton
locators agree with E82/E83/E85. No new primary passage or
version was needed in E87. The prior evidence is selected
indexed original AMS text with direct fetch 403 and no
retained copy. Fine's Lemma 3.2 action sign is from the
assessed primary v2 inspection in E81. Only this audit
and its return were written.
[E81 source audit][e81] · [Canonical reference provenance][canon].

## Versions

| Frozen or supporting artifact | SHA-256 |
| --- | --- |
| [E87 request][req] | `a986da3e0341071d0877eaf9ca648862347b9126e7eb78b3ba10b2258af99aa9` |
| [Frozen TeX][ms] | `190a4f405f1932dbd86af0b05345a7f47e34256c656694de3b5349cd4ab34bd9` |
| [E82][e82] | `d6dfaca55a61107ac8b97952d32d828d51b7f0469c8c2eca8e03e3b0ba8b780d` |
| [E83][e83] | `6400b48a1194d6568f32c1b139d67263dc455d70acaadad18b5d1be472c3fdaf` |
| [E85][e85] | `9c132a9f12b8e9f9b21b480bef9fdc1204f751e13735379393c8b261458e44cb` |
| [E84][e84] | `fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9` |
| [E86][e86] | `7a880181999d9449d41fccd98edbdb5787ecf307ffa13bd88085ac3913cc3aba` |
| [E71][e71] | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |
| [E79][e79] | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| [E80][e80] | `10009438d0eca3e7fe8eb8ebdb78082b9b200812ca8fdb31b99698368ebab39f` |

[req]: ../research-progress/handoffs/SP4-CME-E87_REQUEST_v1.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e71]: ../notes/71_LINEAR_ROUND_SLICE_20261122.md
[e79]: ../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e80]: E80_ORBIT_INVERSE_AUDIT_20261122.md
[e81]: E81_NONLINEAR_SLICE_SOURCE_AUDIT_20261122.md
[e82]: ../notes/82_TAME_ORBIT_SOLVER_20261122.md
[e83]: ../notes/83_TAME_FULL_ORBIT_CHART_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e85]: E85_TAME_LOCAL_SECTION_AUDIT_20261122.md
[e86]: E86_INTRINSIC_ORBIT_BUDGET_AUDIT_20261122.md
[canon]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#nonlinear-slice-primary-hypotheses--e81
[ham]: https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf
