# E212 — Conditional return from intermittent spectral pinching

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E derivation under B102. The helper launch was configured gpt-6.2-sol/ultra. Independent runtime and lead settings are unavailable. I authored the proposed E209 static estimate and the inherited E76 and E183 arguments, and audited E181. E209 is kept as the explicit premise \(H_{\rm grad}\) in this packet pending its separate assessment.

## Native setting and premise

Let \(M\) be a smooth closed connected oriented real four-manifold and \(P\to M\) a smooth principal \(SO(3)\) bundle. Let \(A(t)\) be a supplied maximal smooth original native trajectory on \(P\) for \(0\le t<T_*\), \(0<T_*\le\infty\), with positive curvature planes and the round-compatible curvature-map sign. Time \(t\) is native throughout. Use the native negative-Killing pairing on \(\operatorname{ad}P\) and positive reconstructed metric \(g_A\), with
\[
 \mu_A=dV_{g_A}=\tfrac13\langle F_A\wedge F_A\rangle,\qquad
 (Q_A)_{ij}=\frac{(F_A)_i\wedge(F_A)_j}{\mu_A}
\]
in native orthonormal internal frames. Then \(Q_A>0\) with trace three. Define the energy, dissipation and differentiated defect integral
\[
 \mathcal E(A)=\int_M|Q_A-I|_{\mathrm F}^2\,dV_{g_A},\qquad
 \mathscr D(A)=\int_M |V_{\rm native}(A)|^2_{g_A,\,2\delta}\,dV_{g_A},\qquad
 \mathscr G(A)=\int_M|\nabla^A Q_A|_{g_A}^2\,dV_{g_A}.
\]
The single covector slot in \(\nabla^AQ_A\) uses \(g_A\), and the endomorphism slot uses the full Frobenius pairing. The native gradient identity on the supplied original path is \(\mathcal E'(t)=-\mathscr D(A(t))\), where \(\mathcal E(t)=\mathcal E(A(t))\). It uses the negative gradient for independent connection variations, with native volume. [E179 native gradient identity](179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md).

Assume **\(H_{\rm grad}\)** with fixed \(\gamma,\beta>0\). At every supplied smooth positive-plane round-compatible definite connection for which \(\sup_M \rho(Q_A)\le9/4\), where \(\rho(Q)=\lambda_{\max}(Q)/\lambda_{\min}(Q)\), one has
\[
                     \mathscr D(A)\ge \gamma\,\mathcal E(A)+\beta\,\mathscr G(A).
 \tag{1}
\]
The \(\gamma,\beta\) are fixed in the native normalization. E209 proposes explicit values, and their verification is outside this conditional argument. [B102](../brainstorm/notes/B102_INTERMITTENT_SPECTRAL_RETURN_20261123.md) · [E209 proposed estimate](209_PINCHED_GRADIENT_DOMINATION_20261123.md).

## Occupation-time estimate on the actual lifespan

Define
\[
 r(t)=\sup_{x\in M}\rho(Q_{A(t)}(x)),\qquad
 S=\{t\in[0,T_*):r(t)\le9/4\}.
\]
On each compact slab \([t_0,t_1]\subset[0,T_*)\), the smooth trajectory and the positive wedge quotient give a continuous symmetric bundle endomorphism \(Q_{A(t)}(x)\) on the compact product. In a fixed internal pairing the extreme eigenvalues are continuous by the Rayleigh quotient bounds, including at repeated spectra. The smallest eigenvalue has a positive product minimum on that slab. Hence the ratios are continuous and uniformly continuous there, and
\[
 |r(s)-r(t)|\le
       \sup_{x\in M}\left|\rho(Q_{A(s)}(x))-\rho(Q_{A(t)}(x))\right|\longrightarrow0
       \quad\text{as }s\to t.
\]
This proves continuity on the full relative lifespan, including time zero on the right. The set \(S\) is relatively closed and Borel. Membership means the spectral bound holds at every point of \(M\) for that time.

For \(0\le t_0\le t\le t_1<T_*\), set
\[
 \Theta_{t_0}(t)=\int_{t_0}^t \mathbf 1_S(s)\,ds
               =\big|S\cap[t_0,t]\big|,
\]
where the right side is Lebesgue measure in native time. The function \(\Theta_{t_0}\) is nondecreasing and \(1\)-Lipschitz, hence absolutely continuous with derivative \(\mathbf 1_S\) almost everywhere. The gradient identity and (1) give
\[
 \mathcal E'(t)+\mathbf 1_S(t)\big(\gamma\mathcal E(t)+\beta\,\mathscr G(A(t))\big)
 \le 0
\]
at each interior smooth time. This uses (1) only on \(S\), and the nonnegativity of \(\mathscr D\) at all other times. The integrating factor \(f=e^{\gamma\Theta_{t_0}}\) is absolutely continuous on the slab, since the exponential is smooth with bounded derivative on its compact range there. The chain rule gives \(f'=\gamma\mathbf 1_S f\) almost everywhere. The product \(f\mathcal E\) is absolutely continuous and satisfies \((f\mathcal E)'\le-\beta f\mathbf 1_S\mathscr G(A(t))\) almost everywhere by the product rule. Integration and \(\Theta_{t_0}(t_0)=0\) give for every such \(t\)
\[
 \boxed{\quad
 e^{\gamma\Theta_{t_0}(t)}\mathcal E(t)
 +\beta\int_{S\cap[t_0,t]} e^{\gamma\Theta_{t_0}(s)}
                  \left(\int_M|\nabla^AQ_{A(s)}|_{g_{A(s)}}^2\,dV_{g_{A(s)}}\right) ds
 \le \mathcal E(t_0).
 \quad}                                                         \tag{2}
\]
In particular, since \(\mathscr G\ge0\),
\[
              0\le\mathcal E(t)\le
                        \mathcal E(t_0)e^{-\gamma\Theta_{t_0}(t)} . \tag{3}
\]
If the whole time interval is pinched, the exponent becomes \(-\gamma(t-t_0)\). With intermittent pinching (3) uses the measured time inside \(S\). The proof applies to arbitrary measurable shapes of \(S\), regardless of its interior, and uses no derivative of the indicator. No division by \(\mathcal E\) is made. If \(\mathcal E(t_0)=0\), (2) and nonnegativity give zero energy thereafter, and the weighted gradient integral on \(S\) is zero as well.

## Homotopy-sphere lifetime and two sufficient round-tail conditions

Now fix a smooth oriented homotopy four-sphere \(M\) and a fixed \(P\) as above. Assume one sequence \(t_n\uparrow T_*\) with both
\[
  \sup_M\Psi(A(t_n))\le P_0,\qquad
  \operatorname{diam}(M,g_{A(t_n)})\le D_0,
       \qquad P_0\ge0,\quad D_0>0
\]
for finite \(P_0,D_0\). These are E179's simultaneous bounds. Its \(\Psi\) is the native real full-sphere density with round area \(4\pi\),
\[
 T_X=\tfrac12(Q^{-1/2}D_X^AQ\,Q^{-1/2})_0,\qquad
 \mathcal R_X(f)=P_{f^\perp}T_X f,\qquad
 \Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2,
\]
with the chiral Levi–Civita horizontal derivative and live base covector derivative. The assessed E179/E181 continuation result applies to precisely these two bounds and excludes a finite maximal lifespan, independently of \(H_{\rm grad}\) and time spent in \(S\). Hence \(T_*=\infty\), and the following are two different sufficient energy conditions on this same supplied trajectory. [E179/E181 assessment](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md).

**Infinite total pinched time.** Suppose \(\lim_{t\to\infty}\Theta_{t_0}(t)=\infty\) for some finite \(t_0\); this property is unchanged by changing the finite start. Equation (3) applies at every finite time, so \(\mathcal E(t)\to0\) as \(t\to\infty\). In particular the monotone limit \(\mathcal E_\infty\) in E179 is zero. Its assessed zero-energy alternative gives the actual original fixed round tail. It uses the geometrically controlled sequence for its positive shifted compactness and smooth perfect limit, while (3) uses pinched time over the whole path. No \(t_n\) needs to belong to \(S\) and no pinched time needs to satisfy a \(\Psi\) or diameter bound. [E179 smooth perfect limit and tail](179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md).

**One finite strict entry test.** Let \(\delta(P_0,D_0)>0\) be the non-effective threshold in the assessed E182/E183/E185 uniform intrinsic entry theorem. Suppose that for one actual geometrically qualifying slice \(t_n\ge t_0\),
\[
              \mathcal E(t_0)e^{-\gamma\Theta_{t_0}(t_n)}
                      <\delta(P_0,D_0).                         \tag{4}
\]
By (3) the smooth datum \(A(t_n)\) is strictly below the threshold and has the required native \(\Psi\) and diameter bounds. Apply uniform entry directly to this datum on \(P\). The theorem yields a global smooth definite original solution with that initial value and positive-time entry into the fixed native round value basin, then smooth exponential convergence to a fixed round pullback on \(P\). With its time origin translated to \(t_n\) it solves the same original equation as the supplied trajectory. Smooth original uniqueness identifies them near \(t_n\) and then on the full common tail by recentering at later common smooth slices. Thus the round limit is a limit of the supplied original trajectory. The strict comparison is at the actual slice, with no requirement that \(t_n\in S\) and no entry-time estimate. This condition can hold with finite total pinched time. [Uniform entry assessment](../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) · [E179 original uniqueness interface](179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md).

Under either sufficient condition there is one smooth equivariant bundle isomorphism \(L_\infty:P\to P_{\rm rd}\) covering an orientation-preserving diffeomorphism to the standard native round sphere, with limiting pair \(L_\infty^*(A_0,F_0)\). In a fixed smooth background on \(P\), each fixed \(C^k\) pair error decays for sufficiently late time with datum-dependent constant and an available rate \(\alpha=\lambda_1(G_0)/2>0\) in native time. Here \(G_0\) is the assessed positive round stability operator. Fixed smooth pullbacks and time translations carry this exponent to the original pair. This is the rate from the assessed smooth round tail, distinct from the \(\gamma\) in (2)–(4), which controls defect energy as a function of pinched occupation time. [Smooth limiting recovery assessment](../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md).

The occupation estimate applies on the actual supplied lifespan for the general closed base. Its lifetime and round-tail applications above use the stated homotopy-sphere hypotheses. The argument does not show that the sufficient occupation or entry conditions occur, preserve pinching, or give a bound for actual waiting time. It supplies no initial-data construction, additional regularity of arbitrary orbits, or compactness beyond the assessed late-sequence theorem and the stated assumptions. No new sources or numerical work were used.

## Verified identities

| Input | SHA-256 |
| --- | --- |
| [E212 request](../research-progress/handoffs/SP4-CME-E212_REQUEST_v1.md) | b112fe7f818991f9428fedfd0dce9f1632b01c806804232232abded215e75e3b |
| [B102](../brainstorm/notes/B102_INTERMITTENT_SPECTRAL_RETURN_20261123.md) | d7fddf87589d41caad7c60f0851cdc0e0b7352dda8082c5913830faa98f1164b |
| [E209](209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E179](179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md) | 7bc0ab37b5b6a787159aaaede0aceed413306049925d965b92fbc3436f7bd5da |
| [E179/E181 assessment](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) | 0c9eb889bb10092e631fb3bea7d06e0120934e6a80682e9f3a05b2d1ff7d3881 |
| [E182–E185 assessment](../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) | 0f55dfd759e5dfd1f86e69cc7bd201688de0a2cf5e2bd9ce68414f9ffe96761f |
| [E76/E77 assessment](../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md) | c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1 |

The [E212 return](../research-progress/handoffs/SP4-CME-E212_RETURN_v1.md) records the output identity and scoped disposition.
