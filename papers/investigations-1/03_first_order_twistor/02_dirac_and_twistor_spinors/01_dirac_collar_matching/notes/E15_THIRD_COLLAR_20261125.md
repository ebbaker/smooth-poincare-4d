# Weak physical covers with long cutoff transitions · MATCH-E15

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The frozen request assigned gpt-6.2-sol/ultra.
Exact serving model and reasoning effort are unavailable. Inputs at checkout
`7db310a2a9219c537b440d7c2fb39e602a32b729`.
[Frozen request](../research-progress/handoffs/E15_THIRD_REQUEST_20261125.md)
· [Joint hypotheses and marking](../../../reviews/SECOND_COLLAR_ASSESSMENT_20261125.md)

## Estimate on the physical source

Let \(g\) be one of the supplied smooth volume-one positive Yamabe metrics
on a fixed closed oriented smooth homotopy four-sphere. Use chiral
Hilbert–Schmidt energy \(E_+(U)=\int_U|W_g^+|_{\mathrm{HS}}^2\,dV_g\)
and the full four-index Riemann tensor norm. The argument also holds on
any smooth closed oriented Riemannian four-manifold. In the joint band,
SEC §11.1 gives a uniform source bound
\(\int_M|\mathrm{Rm}_g|^2\,dV_g\le\Lambda\).
[SEC §11.1](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

Supply finitely many oriented embedded buffered annular charts
\(\Phi_j:A_j^*\to M\) with \(\Phi_j^*g=c_j^2m_j\), where \(c_j>0\)
is constant and \(m_j=\delta+v_j\) satisfies
\(a_j=\|v_j\|_{\infty,A_j^*}\le1/4\). A log-radius cutoff
\(\eta_j\in C^\infty_c(A_j^*)\) with \(0\le\eta_j\le1\) equals
one on its protected annulus. Each of its two transitions uses a fixed
smooth profile stretched to log-width at least \(L_j\ge1\). Let
\(T_j\) be the union of the transition shells and define
\[
 d_j=\|\eta_j Dv_j\|_{4,A_j^*},\qquad
 d_{T,j}=\|\eta_j Dv_j\|_{4,T_j},\qquad
 K_j=\|\eta_j^2\mathrm{Rm}_{m_j}\|_{2,m_j}.
\]
The first two norms use Cartesian coordinates and Lebesgue measure.
Push the weights \(\eta_j^4\) to \(M\) and extend each by zero.
Write \(\chi_j\) for these source weights and \(\omega=\sum_j\chi_j\).
For any measurable residual \(U\subset M\), put \(V=U\cap\{\omega\ge1\}\).
In particular \(V\) includes the part of \(U\) in the union of the
protected annuli. The estimate is
\[
\begin{split}
 E_+(U)\le E_+(U\setminus V)+C\bigg[
 &\int_M |B_g|\sum_j a_j\chi_j\,dV_g
   +\int_M|\mathrm{Rm}_g|^2\sum_j a_j^2\chi_j\,dV_g\\
 &+\sum_j\left(d_j^4+L_j^{-3/2}d_{T,j}^2+L_j^{-1}a_j^2\right)
 \bigg].
\tag{1}
\end{split}
\]
The constant depends on the fixed profiles and the uniform metric
neighborhood. The same local estimate holds on a supplied oriented
annular quotient by a finite free spherical group, with equivariant
metrics and radial cutoffs. Coordinate integrals defining \(d_j\)
and \(d_{T,j}\) are then divided by the group order before taking
their fourth roots. The proof with these norms uses quotient measure
throughout. The cutoff norms are at most their values upstairs.

If the chart supports have multiplicity at most \(P_0\), the two
integrals in (1) are at most \(P_0 a_*\|B_g\|_1\) and
\(P_0 a_*^2\Lambda\), where \(a_*=\sup_j a_j\). One can use the
bound on \(\omega\) instead of \(P_0\), or keep the weighted
integrals as measured. All these integrals and the uncovered energy
in (1) are on the actual source. A nonconstant conformal chart
would require its own full-curvature bound in the comparison
metric. The cutoff construction uses the Euclidean log radius
to define profiles in the physical comparison metric.

## Variation and cutoff costs

In a chart write \(t=\log|x|\). On a transition of width \(L\),
\(\eta(t)=f((t-t_0)/L)\) for a fixed profile \(f\), up to reversal.
Then \(|D\eta|\le C L^{-1}|x|^{-1}\) and
\(|D^2\eta|\le C(L^{-1}+L^{-2})|x|^{-2}\). Using
\(dx=|x|^4\,dt\,d\Omega\) gives
\[
 \|D\eta_j\|_4\le C L_j^{-3/4},\qquad
 \|D^2\eta_j\|_2\le C L_j^{-1/2}.
\tag{2}
\]
For unequal widths the terms involving \(d_{T,j}\) and \(a_j\)
in (1) can be split over the two transitions with their own
widths, by taking the squared norms separately on the disjoint shells.

On each chart let \(F_j(m)\) be the positive Weyl matrix in the
oriented symmetric \(m^{-1/2}\) frame times \((\det m)^{1/4}\).
Its squared Euclidean norm represents the chiral energy density.
The all-lowered Riemann tensor equals
\(R(m)=\mathcal L(D^2v)+Q_m[Dv,Dv]\), where the linear principal coefficient
\(\mathcal L\) is constant. The MATCH-E14 differentiation of \(F_j\) at
\(m_j\) with variation \(\eta_j^4 v_j\) therefore yields
\[
 F'_j[\eta_j^4 v_j]-\eta_j^4 F_j=\eta_j^2 H_j,\qquad
 \|H_j\|_2\le C\Big(a_jK_j+d_j^2+
     \|D\eta_j\|_4d_{T,j}+
     a_j(\|D^2\eta_j\|_2+\|D\eta_j\|_4^2)\Big).
\tag{3}
\]
Indeed \(D^2(\eta_j^4v_j)-\eta_j^4D^2v_j\) involves
derivatives of the weight and at most one derivative of \(v_j\).
The variation of the matrix projection, orthonormal frame and
density contributes at most \(C\eta_j^4 a_j|R(m_j)|\).
After extracting \(\eta_j^2\), Hölder bounds the mixed term by
\(\|D\eta_j\|_4 d_{T,j}\) and the quadratic term by \(d_j^2\).
[MATCH-E14](E14_WEAK_CHART_BACH_DEFECT_20261125.md#the-weighted-first-variation)
· [NECK-E07](../../../01_sections_and_connections/01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md#comparison-before-chiral-projection)

On \(M\) take the single smooth tensor variation
\[
 h=\sum_j (\Phi_j)_*(c_j^2\eta_j^4 v_j)
\]
with summands extended by zero. The first variation adds after
pushforward, and each error is paired in the frame that produced
it. This uses the actual source tensors and allows arbitrary frame
transitions at the ends and overlaps. If a smooth partition with
controlled fourth roots in the respective chart coordinates is
supplied, the proof uses those weights as well, with the derivative
norms in (3). Pointwise normalization of independent cutoffs by
their sum would require controlling the first two derivatives of
that denominator in each chart.

In the SEC normalization
\(\mathcal W=4(E_++E_-)\), \(E_+-E_-\) is topological, and the
closed first variation gives \(DE_+[h]=-\tfrac12\int_M\langle
B_g,h\rangle\,dV_g\). Set \(S=\int_M\omega |W_g^+|^2\,dV_g
=\sum_j\|\eta_j^2 F_j\|_2^2\). Variation in the charts gives
\[
 2S+2\sum_j\langle\eta_j^2F_j,H_j\rangle_{L^2}
   =-\tfrac12\int_M\langle B_g,h\rangle\,dV_g.
\]
The Bach pairing is bounded by \(C\int_M |B_g|\sum_j a_j\chi_j\,dV_g\).
Cauchy–Schwarz for the chart sum bounds the mixed pairing by
\(\sqrt S(\sum_j\|H_j\|_2^2)^{1/2}\). Young's inequality
absorbs this term into \(S\). In (3) use (2) and
\(K_j^2=\int_M\chi_j|\mathrm{Rm}_g|^2\,dV_g\) by constant scale invariance.
This proves the estimate for \(S\) and hence for \(E_+(V)\le S\).
[SEC §14.1, compactly supported first variation](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5220)
· [SEC §14.3, annular testing](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5460)

## What a growing cover needs

Suppose each unit log slab in chart \(j\) has
\(\|Dv_j\|_4\le\epsilon_j\), and let \(n_j\) count the unit slabs
meeting the cutoff support. If the two transition widths are both
\(L_j\), then
\[
 d_j^4\le n_j\epsilon_j^4,\qquad
 L_j^{-3/2}d_{T,j}^2\le C L_j^{-1}\epsilon_j^2 .
\tag{4}
\]
For unequal widths apply (4) to each transition with its own width.
Each transition now costs \(O((\epsilon_j^2+a_j^2)/L_j)\),
compared to a unit-width cost \(O(\epsilon_j^2+a_j^2)\).
The bulk \(\sum_j d_j^4\) has no cutoff denominator. For \(k\)
charts of common width \(L\) and \(\epsilon_j\le\epsilon\),
the transition cost is at most \(C k(\epsilon^2+a_*^2)/L\).
The slabwise bound for the bulk is \(\epsilon^4\sum_j n_j\),
which can grow with \(L\). The quantities in (1) give a sufficient
summability criterion for the full residual, including the measured
\(E_+(U\setminus V)\). In a marked compact exhaustion, first
take the sequence limsup at fixed truncations with the supplied
finite covers and then enlarge the truncations. Equation (1) holds
at each index and truncation.

To test the bulk condition, start with an oriented orthonormal
normal chart at an ordinary point of a smooth physical source.
In its punctured ball use the smooth orientation-preserving map
\(\varphi_\epsilon(x)=\exp(\epsilon\log|x|\,J)x\), where \(J\)
is a fixed orthogonal complex structure on \(\mathbb R^4\).
It preserves \(|x|\) and is inverted by replacing \(\epsilon\)
with \(-\epsilon\). Set \(n=x/|x|\). Its flat pullback is
\[
 \varphi_\epsilon^*\delta-\delta=
 \epsilon(n\otimes Jn+Jn\otimes n)+\epsilon^2 n\otimes n.
\tag{5}
\]
Differentiate along the Euclidean unit vector \(Jn\). The coefficient
of \(\epsilon/|x|\) is \(2(Jn\otimes Jn-n\otimes n)\).
It is orthogonal to the coefficient of \(\epsilon^2/|x|\).
Thus the Cartesian derivative has size comparable to
\(\epsilon/|x|\) for \(0<\epsilon\ll1\). For the actual metric
\(g=\delta+w\) in the normal chart,
\[
 |D(\varphi_\epsilon^*w)|\le
 C\big(|Dw|\circ\varphi_\epsilon+
              \epsilon |x|^{-1}|w|\circ\varphi_\epsilon\big).
\]
This follows from the bounded first derivative of
\(\varphi_\epsilon\) and its second derivative bound \(C\epsilon/|x|\).
By smoothness, shrink the physical normal ball until
\(\sup (|w|+|x||Dw|)\) is at most a sufficiently small fixed
multiple of \(\epsilon\). Then \(a_j\le C\epsilon\) and every
full unit log slab has \(L^4\) derivative norm comparable to
\(\epsilon\), uniformly in the log radius. This construction
applies separately on every member of any supplied smooth
physical sequence and preserves its Yamabe, curvature and Bach
bounds.

Inside the punctured normal ball take \(k\) consecutive protected
intervals of length \(L\) in log radius, each extended by two
buffers of length \(L\) and an arbitrarily small cutoff collar.
Choose the buffers strictly inside the normal ball. The same chart
restricted to these intervals gives coherent transitions and
uniformly bounded overlap. For integer \(L\),
\(\sum_j d_j^4\ge c kL\epsilon^4\) on the protected intervals alone,
whereas the transition cost is bounded by \(C k\epsilon^2/L\).
With fixed \(\epsilon>0\), \(k=i\) and \(L=i^2\), the cutoff cost
tends to zero and the bulk sum diverges. Even \(k=L=i\) and
\(\epsilon=i^{-1/2}\) leave the bulk sum bounded below while
the slab errors and the cutoff cost tend to zero. The example
can be placed in balls of arbitrarily small physical chiral
energy. It disproves an implication for the coefficient norms
in the supplied gauge. MATCH-B05 and SEC-B36/E62 need gauges
on the actual residual with small bulk sum and negligible
uncovered energy, or an independent estimate of that energy.
NECK-E11 gives intrinsic noncollapse and one low-curvature block
at separated scales. NECK-E17 permits curvature spikes even there
in the approximate Bach class. The required residual cover
remains open. [NECK-E11](../../../01_sections_and_connections/01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md)
· [NECK-E17](../../../01_sections_and_connections/01_neck_geometry/notes/E17_WEAK_BACH_CURVATURE_SPIKES_20261125.md)
· [SEC register](../../../01_sections_and_connections/research-progress/REGISTER.md)

## Actual normalized fields

In the physical metric or a harmonic conformal representative
let \(\psi\) be an actual smooth positive half-spinor away from its
prescribed poles. The algebraic formula in DIR §2.3 implies that on
\(\{|\psi|>0\}\) its unit normalization \(\widehat\psi=\psi/|\psi|\)
satisfies
\[
 \left|\Pi(d^\nabla P\widehat\psi)^+\right|^2
   =\frac{\left|\Pi(d^\nabla P\psi)^+\right|^2}{|\psi|^2}
   =\tfrac12|W^+|_{\mathrm{HS}}^2 .
\tag{6}
\]
Here \(P\) is the twistor operator and \(\Pi\) projects to the
Clifford kernel in the positive two-form slot. The chiral density
times volume is conformally invariant, so (1) bounds twice the
integral in (6) over the actual part of \(U\) where it is defined.
For a finite family the sum of the unnormalized numerator squares
divided by the sum of the denominator squares has the same value
on its joint nonzero set. [DIR §2.3](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L276)

In the positive scalar curvature physical gauge an actual field is
available on \(M\setminus\{p\}\) for any prescribed point \(p\).
Invert the full ordinary Dirac operator on the distribution
\(\delta_p\xi\), where \(\xi\) is a unit negative half-spinor at
\(p\). The Schrödinger–Lichnerowicz formula gives zero kernel on
the closed \(M\), and ellipticity and self-adjointness give the
inverse on smooth sections and distributions. Its image is
positive chiral and smooth \(D_g\)-harmonic on the punctured
source by elliptic regularity. It is nontrivial there. A distribution
supported at \(p\) is a finite sum of derivatives of a delta,
and its highest-order homogeneous polynomial is multiplied by
the invertible Dirac symbol away from the zero covector. Hence
its Dirac image would have order at least one, ruling out the
order-zero point source. Bär's main theorem on the connected
punctured source gives a volume-zero nodal set. Thus the integral
in (6) equals \(E_+(U)/2\) for this field, with the pole and nodal
set omitted. This controls the projected differentiated defect
uniformly in the spinor amplitude.
[DIR, closed energy identity](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L173)
· [Bär, Main Theorem and the ordinary spin Dirac example](https://arxiv.org/pdf/dg-ga/9707008)
