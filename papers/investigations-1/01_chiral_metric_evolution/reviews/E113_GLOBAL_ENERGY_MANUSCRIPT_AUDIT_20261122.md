# SP4-CME-E113 — Global energy manuscript integration audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E104 and E110, along with
the inherited E50, E63, E16A and E14 work. This is a manuscript
integration check against E104 as independently audited in E108.
The frozen target and three requested input hashes matched at
consumption. The lead was notified after the target was read.
Line numbers below refer to the consumed working TeX.
[Request][req] · [Return][ret].

## Adjusted tube and original geometric hypotheses

Frozen lines 5432–5443 retain two initial requirements. They are
small fixed connection and curvature values at the native positive
perfect chiral \(\mathrm{SO}(3)\) reference and, separately, small
initial live \(L^4\) strain. The earlier corollary supplies a smooth
original flow on the closed oriented round sphere. The first
condition alone, after shrinking its threshold, supplies the
interval geometry used for the energies. The flow construction
requires smoothness of each datum and no uniform higher initial
norm. Neither slice equation nor any budget \(J\) is a hypothesis.
[E104, statement][e104] · [E108, disposition][e108].

Lines 5477–5498 fix \(\mathcal T\) and
\(\sigma=\mathcal T/2\) before any shrinking of the value
threshold. Let \(v\) be the stated value sum. The stationary
round datum and local Lipschitz bound give \(C_{\rm h}v\)
through the adjusted head. On a fixed positive-time strip
containing \(\sigma\), quantitative smoothing at order six and
finite fixed volume give the stated \(H^6\) bound at the splice.
The stability estimate with \(m=6\) then gives
\(\|B(u)-A_0\|_{H^6}\le C_{\rm st}C_6 e^{-\alpha u}v\)
on the tail. With \(b=B-A_0\), \(H^6\subset C^1\) on the fixed
four-dimensional reference and
\(F_B-F_0=d_0b+\tfrac12[b\wedge b]\) give the displayed linear
plus quadratic tail value bound. Those fixed functions of \(v\)
vanish at zero. Thus a single threshold places the entire two
adjusted pieces in each prescribed admissible value tube.
This uses the existing smooth comparison at zero and recovery
splice. The individual comparison interval may depend on the
smooth datum, while the common \(\sigma\) and the value threshold
are fixed. [E104, common tube][e104] · [E108, splice][e108].

Lines 5500–5518 compare the normalized adjusted metric to
\(g_{\rm rd}=g_0/(2K)\). The eigenvalue bounds between
\(\Lambda^{-1}\) and \(\Lambda\) in four dimensions give volume
density ratios between \(\Lambda^{-2}\) and \(\Lambda^2\).
Changing the left volume in the squared \(L^4\) norm costs
\(\Lambda\). The reverse density comparison on the right costs
\(\Lambda^2\), and changing the gradient covector norm squared
costs another \(\Lambda\). This gives \(\Lambda^4\) on the
gradient term, \(\Lambda^3\) on the mass term and the common
\(C_S=\Lambda^4 C_{S,\rm rd}\).

Lines 5520–5529 correctly use an exact per-slice pullback.
On the tail the referenced recovery has the order
\((\gamma g_{\rm st}(u))\cdot B(u)\), where
\(g\cdot C=(g^{-1})^*C\) and \(\gamma=g_{\rm loc}(\sigma)\).
Thus \(A=h^*C\) on an adjusted slice, with the base map
\(f\) of \(h\) orientation-preserving. The metric satisfies
\(\widehat g_A=f^*\widehat g_C\), and \(q_A\) is \(q_C\)
composed with \(f\) and conjugated by the internal isometry.
Since the pinching norm is the invariant Hilbert–Schmidt norm,
its sup transfers. Applying the adjusted scalar Sobolev
inequality to \(z\circ f^{-1}\) transfers the \(L^4\),
gradient and mass integrals exactly. The argument leaves the
metric comparison in adjusted coordinates, with no uniform
recovery derivative estimate. Smooth original uniqueness
identifies the recovered head and tail on their right overlap,
giving continuous intrinsic energies and no jump at \(\sigma\).
[E104, original-slice comparison][e104] · [E108, recovery][e108].

## Absorptions, live conventions and weighted estimates

The unchanged interval proposition at lines 2185–2205
displays the quadratic and quartic estimates with one common
\(C\) and one common pinching radius \(\epsilon\). In the new
proof at lines 5531–5555, \(C_2,C_4\) can be the two source
constants or can both be assigned that common positive bound.
The thresholds \(Y_2=(2C_2C_S)^{-1}\) and
\(Y_4=(2C_4C_S)^{-1}\) implement distinct absorptions. In
particular \(C_4C_SY\le1/2\) leaves at least half the quartic
zeroth-order term and leaves at least \(4D_4\) of the original
\(8D_4\) diffusion, since the Sobolev term costs \(4C_4C_SYD_4\).
Here \(Y=E_4^{1/2}\) and the sixth-power estimate comes from
Hölder and the scalar inequality on \(|T|^2\).
With \(Y(0)<Y_4\), the resulting quartic differential
inequality through a first time of equality would imply
\(Y(t)\le e^{-Kt/4}Y(0)<Y_4\). Continuity of \(Y\) includes
the splice and the zero case. The quartic estimate therefore
holds globally. Since also \(Y(0)<Y_2\), Kato and the scalar
inequality on \(|T|\) yield \(E_2'+D_2/2+(K/2)E_2\le0\).
Geometry was supplied before these absorptions.
[E104 (5)–(6)][e104] · [E108, separate thresholds][e108].

Lines 5443–5473 use live native \(g_A^{\rm F}\) and volume
and the covariant derivative combining \(A\) on internal slots
with the live Levi–Civita connection on base slots. The names
\(E_4,D_4\) are E104's \(F_4,G_4\), respectively, in both
conventions. Under \(g_A^{\rm F}=\kappa\widehat g_A\) and
\(\tau=\kappa t\) with \(\kappa=2K\), \(Q,T\) agree as
tensors. Constant metric scaling preserves the Levi–Civita
connection and constant internal pairing scaling preserves
the endomorphism norm. The tensor slots give factors
\(\kappa^{-1},\kappa^{-2}\) for \(|T|^2,|\nabla^AT|^2\)
and the live volume has factor \(\kappa^2\). Consequently
lines 5557–5565 have the correct four integral factors
\((\kappa,1,1,\kappa^{-1})\), in that order. The squared
\(L^4\) strain condition is the same in the two metrics.

The time derivative of \(E_2^{\rm F}\) equals \(E_2'\) and
the time derivative of \(E_4^{\rm F}\) equals \(\kappa^{-1}E_4'\)
at corresponding times. Therefore the native coefficients of
\(D_2^{\rm F}\) and \(D_4^{\rm F}\) remain \(1/2\) and \(4\),
and both energy damping rates are \(K/(2\kappa)=1/4\).
The exponent \(e^{\tau/4}=e^{Kt/2}\) in both weighted
integrals is correct. Under that change of variables the
quadratic weighted integral gains the same factor \(\kappa\)
as \(E_2^{\rm F}\), and in the quartic weighted integral
the time factor cancels \(\kappa^{-1}\) on \(D_4^{\rm F}\).
Monotone convergence gives full native gradient bounds
\(2E_2^{\rm F}(0)\) and \(E_4^{\rm F}(0)/4\), as stated
at lines 5571–5572. The normalized energy damping is \(K/2\).
The normalized norm rates are \(K/4,K/8\) and the native
norm rates are \(1/8,1/16\).
[E104 (6)–(8)][e104] · [E108, clock and integrals][e108].

The Lorentz sufficiency in lines 5575–5577 concerns the
initial live measure. The stated convention gives
\(\|T\|_4\le\|T\|_{4,1}/4\) by the layer formula and
Minkowski. The final paragraph limits the conclusion to
integrated energies and weighted spatial dissipation. It
does not obtain propagation of \(L^{4,1}\) or control of the
supremum-based budget \(J\).
[E104, Lorentz sufficiency][e104] · [Lead assessment][assess].

## Abstract, introduction and E110 integration

The abstract at frozen line 63 and introduction at lines
312–314 describe the quadratic and quartic energy conclusion,
with the separate initial \(L^4\) hypothesis. The new result
is confined to the existing smooth round basin after a
possible decrease of the connection/curvature value threshold.
The earlier temporal-budget statements remain attributed to
their separate hypotheses. Explicitly stating the decrease
in the two summaries would match the new proof's quantifiers
and remove a reading over an independently fixed larger ball.

All three E110 additions are present in the preceding example.
Lines 5334–5338 exhibit a self-dual form evaluating to one
on \((\partial_2,\partial_3)\). Lines 5349–5351 specify the
zero extension of the supported window within the fundamental
cube. Lines 5343–5348 and 5356–5361 record the \(C^1\)
conjugation bound and the \(O_{M_*}(\epsilon_n)\) sup
comparison to the fixed amplitude, giving \(h_*/2\) on
the rectangle at sufficiently large \(n\). The source scan
found 287 unique labels, 157 resolved reference targets
and 33 citation keys in exact manual bibliography order by
first use. The new subsection and corollary labels resolve.
[E110, precision additions][e110].

## Exact corrections and optional clarifications

1. At frozen lines 5503–5505 use “and so that \(|q|\le\epsilon\)
   for the common pinching radius of
   `Proposition~\ref{prop:strain-energy}`.”
   The two source radii are already combined into one
   \(\epsilon\) in that proposition.
2. In frozen line 63 use “After decreasing that value threshold,
   sufficiently small initial live \(L^4\) strain gives global
   quadratic and quartic strain-energy decay.” In frozen lines
   312–314 use “gives global quadratic and quartic strain-energy
   decay after decreasing the value threshold and imposing
   separate small initial live \(L^4\) strain.”
3. For a more explicit splice entry at frozen lines 5483–5486,
   record \(B_0=\widehat A(\sigma)\) and require
   \(C_6\delta<\eta_6\) before applying the stable tail theorem.
   Its strict entry condition follows from the stated smallness.
   At frozen lines 5541–5544 one can write
   \(\big|d(|T|^2)\big|\) and \(dV_{\widehat g}\) in the
   sextic integral to mark the normalized live convention.

The integration passes within the E104/E108 scope, with the
listed precision corrections. No shared file was edited, no
manuscript build was run, and no new primary source was used.

[req]: ../research-progress/handoffs/SP4-CME-E113_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E113_RETURN_v1.md
[e104]: ../notes/104_GLOBAL_VALUE_BASIN_STRAIN_ENERGY_20261122.md
[e108]: E108_GLOBAL_STRAIN_ENERGY_AUDIT_20261122.md
[e110]: E110_STATIC_DEFECT_MANUSCRIPT_AUDIT_20261122.md
[assess]: E104_E108_GLOBAL_STRAIN_ENERGY_ASSESSMENT_20261122.md
