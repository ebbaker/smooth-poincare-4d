# E78 smooth-limit manuscript integration audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
I authored E75 and E77, and previously authored the E47 graph-scale
input. This audit compares the lead-authored TeX integration with the
assessed proofs. It does not repeat independent mathematical review
of my own E77. All line numbers refer to the frozen TeX.
[Frozen request][req] · [E75 audit][e75] · [E77 audit][e77].

**Disposition.** The smooth-limit theorem carries the assessed
fixed-\(m=6\) basin, with data-dependent higher-order constants and
the same native exponential rate at every order. The critical
\(C^1\) bound is supported for the critical-budget recovery. Its
statement and last line should identify that recovery explicitly
because its splice time differs from the one in the small-value
theorem. The correction uses the already proved stable-tail
argument. It needs no new estimate or stronger threshold.

## Fixed basin, composition and weighted absorption

**3245–3345, `thm:round-smooth-limit`.**
The theorem at 3247–3264 chooses \(m=6\) and its one small-value
threshold before quantifying over the smooth datum and every finite
\(r\). The proof starts with the E49 stable level-six path,
with smoothness on each compact time interval and its fixed
regular jet tube. It retains \(\|a(u)\|_{H^6}\le
C_6e^{-\alpha u}\|a(0)\|_{H^6}\). The full fixed-gauge
linearization is subtracted, so the coefficient difference
multiplies \(D_0^2a\) and the lower Taylor difference begins at
quadratic order, including coefficients with explicit \(x\)
dependence. The two radial integral representations apply
on the same fixed jet tube for all orders. [E76, (1)–(2)][e76].

The weighted local Fourier convolution splits the high frequency
weight over the two factors. The low factor has Fourier \(L^1\)
bound from \(H^3\) since \(\langle\xi\rangle^{-3}\in L^2\) in
four dimensions. Nested compactly supported cutoffs allow the
calculation on zero extensions and fixed frame changes. For the
composition base at order five, at most one positive derivative
of the jet has order at least three. It is in \(L^2\), with the
remaining derivatives of order at most two in \(L^\infty\)
by the fixed \(H^5\) jet bound. At higher orders
\(\partial_i F=F_{x_i}+\vartheta F_z\partial_i z\). The same
bound at order \(s-1\) on \(F_{x_i}\) includes explicit coordinate
dependence, and cutoff derivatives use the same lower order.
The product term costs \(C_s(1+\|z\|_{H^{s-1}})\|\partial_i z\|_{H^3}\)
and \(C_s\|\partial_i z\|_{H^{s-1}}\), with the first derivative's
\(H^3\) uniformly bounded. This proves the compressed composition
claim at 3296–3308.

For \(C^\sharp\) the bounds are \(C\|z\|_{H^3}\) at order three and
\(C_s\|z\|_{H^s}\) at order \(s\). In \(L^\sharp\) the high coefficient
costs \(C_s(1+\|z\|_{H^s})\|z\|_{H^3}^2\), and a high jet costs
\(C_s\|z\|_{H^3}\|z\|_{H^s}\). The low norm is bounded by the
fixed tube constant and is controlled by the high norm, which
gives the third displayed inequality at 3311–3313. At \(s=k-1\)
the placements in the principal product cost respectively
\(\|a\|_{H^k}\|a\|_{H^5}\) and
\(\|a\|_{H^4}\|a\|_{H^{k+1}}\). The lower term costs
\(\|a\|_{H^4}\|a\|_{H^k}\). This proves the asserted one-high-factor
bound without requiring small \(H^k\) values.
[E76, (3)–(6)][e76] · [E77 audit][e77].

At 3319–3345 the fixed graph norm is the earlier E47 realization.
The weighted pairing splits \(J^k\) into exponents \((k-1)/2\)
and \((k+1)/2\) on the forcing and weighted unknown, respectively.
The tame estimate puts \(e^{\alpha u}\) on its sole high norm.
The spectral gap gives the positive margin \(\theta\) in
\(G_0-\alpha I\ge\theta J\), since \((\lambda-\alpha)/(1+\lambda)\)
increases for \(\lambda\ge\lambda_1\). Order \(k\) can use
\(U_k=\alpha^{-1}\log\max(1,2C_kC_6\eta_6/\theta)\), where
\(\eta_6\) is the fixed \(H^6\) entrance radius.
This time absorbs the nonlinear coefficient with the same spectral
rate, and the smooth path controls the weighted high norm on the
preceding finite interval. The waiting times replace any further
data smallness condition. The rate is common to all fixed orders,
and the constants can grow with order and the given path.
[E76, (7)–(10)][e76] · [E77 audit][e77].

## Stable generator, smooth maps and metric

**3347–3415.** The actual stable equation for \(j_{\rm st}=g_{\rm st}^{-1}\)
uses \(W=-\xi_{\rm st}=\delta_0a+\chi_B(\Delta_0S_0^*a)\).
The principal chart component \((\phi-B_iY^i)h\) has the
horizontal sign from the connection form and the genuine vertical
term. The inner operators are fixed. In every finite \(C^r\)
norm on the total space, \(W\) costs \(C^{r+2}\) of \(a\) and its
square, including group-coordinate conversion derivatives. There
is no stationary forcing. Base dimension four gives the strict
embedding margin \(k>r+4\), so \(k\ge\max(6,r+5)\) supplies the
claimed generator bound, integrability and rate.
[E76, (11)–(13)][e76].

Starting in late relative coordinates requires only a late time,
chosen so the tail displacement is smaller than the fixed chart
margins. The first derivative ODE and the higher derivative
induction bound all derivatives, with an integrable coefficient
\(DW(u,Z)\) and forcing in order \(r\) that is bounded by fixed
products of lower derivatives of \(Z\) times \(\|W\|_{C^r}\).
Integrating the time derivatives from \(u\) to infinity gives
the claimed \(e^{-\alpha u}\) errors. Determinant evolution and
the bounded first derivative give a positive Jacobian lower
bound and bounded inverse derivatives. The finite inverses
are uniformly Lipschitz, giving injectivity of the limit.
Compactness of finite inverse images gives surjectivity. Base
maps and their inverses descend by equivariance and smooth local
sections. Their limiting derivatives are invertible, and the
positive sign of the finite base determinants passes to the limit.

In inverse rates, the \(C^0\) error follows from the direct \(C^0\)
error and the inverse Lipschitz bound. Differentiating the composition
identity recursively solves for the highest inverse derivative with
\(D\widetilde j(u)\circ\widetilde g(u)\) as coefficient. Comparison
at the moving points costs the same-order direct error and the
inverse value error multiplied by the next bounded limiting direct
derivative. Both terms decay at the stated rate. The fixed
finite-time factor in each map preserves these estimates. The
proof correctly uses spatial \(C^r\) norms and the native clock.
[E76, (14) and inverse-rate argument][e76].

The small-value transfer uses the smooth finite head of the \(m=6\)
case. The composition order
\(g(\tau)=c\,g_{\rm st}(\tau-\tau_0)\) and
\(j(\tau)=j_{\rm st}(\tau-\tau_0)c^{-1}\) agrees with the earlier
left action \(g\cdot A=(g^{-1})^*A\). Thus \(A_\infty=j_\infty^*A_0\),
\(F_{A_\infty}=j_\infty^*F_0\), and the metric is
\(\bar j_\infty^*g_0\). The curvature identity gives
\(F_B-F_0=d_0a+[a\wedge a]/2\), so its \(C^r\) error is
controlled by the stable \(C^{r+1}\) error for \(a\). Native
reconstruction is smooth in the definite tube and natural by
preservation of the internal pairing, self-dual plane and
curvature volume. The metric and other tensors pull back with
\(r+1\) map derivatives to control a \(C^r\) error. It would
make the derivative count clearer to place the curvature identity
in one sentence at 3408–3414 before the metric reconstruction
sentence. The conclusion and rate are supported as stated.
[E76, (15)–(16)][e76] · [E77, metric limit][e77].

## Critical recovery corollary and splice correction

**3969–4064, `cor:critical-recovery-limit`.**
The estimate applies to the genuine direct generator. The compatible
head uses \(\eta=d_Aa=\beta+\tfrac12[a\wedge a]\). In the fixed
metric vertical term, symmetry contracts \([a_i,a_j]\) to zero,
leaving \(d_0^*a\). The live codifferential has both base-slot
connection differences with the covector signs, and the covariant
fiber chain rule gives \(D_0L=O(h_2+h_1^2)\). The wording at
4014–4015 correctly invokes tensor differentiation at a point.
The first derivative of the principal lift includes both the base
derivative of \(A_iY^i\) and fixed group factors. The displayed
\(C^1\) cost follows, with a linear part integrable by \(H\) and
\(\|h_1\|_{L^2_\tau}\le C\sqrt{MH}\) by the blockwise
Cauchy–Schwarz interpolation. This gives \(C(\delta+\delta^2)\)
for the head.

At level six the quantitative smoothing slice has
\(q_b(0)\le C\delta\) and the stable decay gives
\(\|W_{\rm st}\|_{C^1}\le C(q_b+q_b^2)\). Its integral is
\(O(\delta)\) for \(\delta\le1\). The fixed chart displacement
and derivative ODE give \(O(\delta)\) for \(j-\mathrm{id}\)
and \(Dj-I\). The inverse displacement uses the same charts
and the inverse derivative uses the matrix inverse near
identity at the inverse point. This produces an \(O(\delta)\)
fixed \(C^1\) bound without high initial norms. The proof
properly concerns \(W\) and never transfers the estimate
to the conjugated right velocity. [E74, (3)–(17)][e74] ·
[E75 audit][e75].

**Required identification at 3897–3907, 3971–3975 and 4062–4063.**
The small-value corollary uses its fixed splice \(\tau_0=T/2\)
at 3207, and the smooth-limit theorem uses the resulting
maps at 3403–3407. The critical-budget proof chooses a different
splice strictly inside its common \([0,\tau_c]\), with
\(\tau_c\le T/2\). At 4041 it estimates the maps of this
critical splice. Smooth uniqueness identifies the recovered original
trajectory, and does not by itself identify the two gauge recoveries.
The proof establishes the stated \(C^1\) bound for the limiting
maps of the **critical-budget recovery**.

A direct manuscript correction is to take \(m=6\) at 3904–3905
and use this wording at 3971–3975:
“After decreasing the threshold in the whole-time critical theorem,
the recovery maps \(j\) and \(g=j^{-1}\) of its critical-time
splice have smooth limits \(j_\infty,g_\infty\) satisfying ….”
At 4062–4063 invoke the stable-tail argument in the proof of
`thm:round-smooth-limit` for this \(B\), together with the
fixed finite local factor \(c\). That argument applies to every
smooth \(B(0)\) in the E49 \(H^6\) basin. It gives smooth limits
for these maps, so the finite-time \(C^1\) bounds pass to
them. This identifies the maps to which the quantitative
statement belongs and retains both fixed thresholds.

## Abstract, introduction and remaining scope

Line 63 accurately connects smooth exponential convergence
to the round smooth small-value basin. The quantitative sentence
could specify "\(C^1\)" and "smooth data with small fixed critical
pair norm" to separate it from the previous rough-data result.
The introduction at 291–305 keeps data-dependent higher constants
and distinguishes the whole-time budget from smooth convergence.
The qualifications at 315–319, 2895–2900, 3420–3425,
5919 and 5935 concern arbitrary-sphere initialization, general
rough endpoints or intrinsic-only estimates. None contradicts
the new round-basin limit. The final fixed-slice conclusion
only imposes the slice at the initial datum and contains no
general slice-existence claim.

All six distinct references used by the two new statements and
proofs resolve uniquely. The \(\tau\) in these sections is
the native clock, with the earlier normalized rate obtained via
\(\tau=2Kt\). \(J=I+G_0\) is a local graph-operator notation and
\(J(t)\) is the strain budget in the later subsection. The
notation is distinguishable in context, though adding "graph
operator \(J\)" at 3319 would make it immediate.

## Versions and source status

The frozen manuscript was consumed and released to the lead.
All four assessed derivation and audit hashes matched. No
primary source was newly opened or imported. Only the assigned
audit and return were written.

| Artifact | SHA-256 |
| --- | --- |
| [E78 request][req] | `8e447e3efc595a54a140d2ecaf26c8e77357a3ca400b2d9601c51d7bfdf90abb` |
| [Frozen manuscript][ms] | `13f51799c37689dc5e06be923cda8deb4eaa8d98516674be1e1859e644238af7` |
| [E74][e74] | `b2178fb149712df61c6b660bca00e10451c1d38c5434bb562607d9ba369139fa` |
| [E75][e75] | `6b499ac9696dedcb9c4147e6a61e35fdb7e50c0bf947185e160666de586b6d92` |
| [E76][e76] | `2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0` |
| [E77][e77] | `e8776fd678cfb87b4361920db7053682eee5ee99151b8c086c70d0122c75543e` |

[req]: ../research-progress/handoffs/SP4-CME-E78_REQUEST_v1.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e74]: ../notes/74_CRITICAL_RECOVERY_LIMIT_20261122.md
[e75]: E75_RECOVERY_LIMIT_AUDIT_20261122.md
[e76]: ../notes/76_HIGH_ORDER_STABLE_LIMIT_20261122.md
[e77]: E77_SMOOTH_LIMIT_AUDIT_20261122.md
