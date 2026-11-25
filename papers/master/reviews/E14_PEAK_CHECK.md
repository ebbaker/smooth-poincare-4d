# SP4-MASTER-E14 · Full curvature on bounded physical windows

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded B04 follow-on, E14 revision 1. The request and dispatch specified GPT-6.2 Sol/ultra. The helper could not independently attest the serving values. Checked at `64a0bfae5759353d49a68cb47e59305566809061`, with working TeX fingerprints `17b553e1f6df` for `complete_limits.tex` through the end of its theorem and `ac78efcc82b2` for `variational_comparison.tex`. This review independently verifies the local curvature-energy step and the source quantifiers, using the E12 regularity argument and the E13 complete-limit exclusion as inputs. [Issued request](../research-progress/handoffs/E14_PEAK_CHECK.md) · [E12](../notes/E12_HARMONIC_LIMIT.md) · [Frozen complete comparison](../manuscript/complete_limits.tex#L8)

## Vanishing on shrinking windows with bounded rescaled curvature

Fix a hypothetical nonstandard closed oriented smooth homotopy four-sphere $M$ and a minimizing sequence of smooth volume-one Riemannian positive-Yamabe representatives $g_i$. Write $R_{g_i}=Y_i\in[y_0,S]$, $S=8\sqrt6\,\pi$, and $e_i=E_+(g_i)=E_-(g_i)\to I^+(M)$ with $4\pi^2\le e_i\le8\pi^2-\delta$. The chiral norms are Hilbert–Schmidt on the real Weyl endomorphism blocks. Norms of $W$ and $\mathrm{Rm}$ without chiral subscripts below are full four-index tensor norms. For arbitrary $p_i\in M$ and $a_i\to0$, assume that on the same sequence, for every fixed finite $B$,

$$
 a_i^2\sup_{B_{g_i}(p_i,Ba_i)}|\mathrm{Rm}_{g_i}|\le C_B.
 \tag{1}
$$

Then for every fixed $A<\infty$,

$$
\int_{B_{g_i}(p_i,Aa_i)}|\mathrm{Rm}_{g_i}|^2\,dV_{g_i}\longrightarrow0.
\tag{2}
$$

Indeed, on any subsequence set $\widehat g_i=a_i^{-2}g_i$. The E12 cutoff iteration uses only the uniform Yamabe lower bound and the upper bound for the scaled nonnegative scalar $a_i^2Y_i$. It gives uniform volume lower bounds $c r^4$ for $0<r\le1$ at every center. For example, writing $v_x(r)=r^{-4}\operatorname{Vol}_{\widehat g_i} B_r(x)$, a cutoff of slope $2/r$ gives $v_x(r)\ge c_1 v_x(r/2)^{1/2}$ with $c_1$ independent of $i,x,r$. Iteration ends at the Euclidean small-ball ratio for each smooth metric. Enlarge any fixed pointed window before using (1), so there is room for the curvature and noncollapse arguments that bound injectivity and harmonic radii. The E12 compactness and variational regularity steps then give a further subsequence with a connected complete smooth limit $h$, oriented embeddings of neighborhoods of whole compact exhaustions, locally uniform and strong $W^{1,4}$ metric convergence there, weak local $W^{2,p}$ convergence in harmonic charts for finite $p>4$, and strong local convergence of the two chiral energy densities. The bounded-window argument uses no chiral anchor. The anchor entered E12 only to infer nonflatness from chiral convergence. Here `thm:complete-limit` instead forces $h$ flat. A fixed compact limit neighborhood chosen using radius $A+1$ has image containing the entire actual $\widehat g_i$-ball of radius $A$ for large $i$, by the E12 first-exit argument. [E12 noncollapse, smoothness and source-ball inclusion](../notes/E12_HARMONIC_LIMIT.md#noncollapse-and-pointed-markings) · [Local variational comparison](../manuscript/variational_comparison.tex)

To upgrade from chiral to full curvature on that compact, define the unnormalized Euler four-form in the fixed orientation by

$$
 \mathcal E(m)=32\pi^2 e(TM,m)
 =\bigl(|\mathrm{Rm}_m|^2-4|\mathrm{Ric}_m|^2+R_m^2\bigr)dV_m,
$$

where $e(TM,m)$ is the normalized Euler form. In a fixed local oriented chart, use oriented orthonormal frames for the pulled-back metrics $m_i$ and for $h$ from the positive matrix square root. The local metric convergence yields $\alpha_i=\omega_i-\omega_h\to0$ in $L^4$ for the connection matrices, because they are smooth functions of the metric coefficients, linear in their first derivatives, on the uniformly elliptic range. The curvature forms $\Omega_i$ have uniformly bounded $L^2$ norm by the physical budget and uniform local metric comparison. In flat coordinates $\omega_h=0$. The following relative expression also works in arbitrary oriented local charts and for a smooth nonflat limit. With $P$ the invariant degree-two symmetric polarization of the Pfaffian in the normalization for $\mathcal E$, write

$$
 \Omega_{i,t}=(1-t)\Omega_h+t\Omega_i-t(1-t)\alpha_i\wedge\alpha_i,
 \qquad T_i=2\int_0^1P(\alpha_i,\Omega_{i,t})\,dt.
$$

The curvature formula follows by inserting $\omega_h+t\alpha_i$ into $d\omega+\omega\wedge\omega$. Differentiating $P(\Omega_{i,t},\Omega_{i,t})$ and applying the Bianchi identity and invariance of $P$ gives $\mathcal E(m_i)-\mathcal E(h)=dT_i$. Thus on any fixed compact subchart

$$
 \|T_i\|_{4/3}\le C\|\alpha_i\|_4
 \bigl(\|\Omega_h\|_2+\|\Omega_i\|_2+\|\alpha_i\|_4^2\bigr)\longrightarrow0.
$$

In particular $\int \chi (\mathcal E(m_i)-\mathcal E(h))=-\int d\chi\wedge T_i\to0$ for any smooth compactly supported chart cutoff. A fixed finite partition gives the same assertion for a test on a whole compact region. No boundary trace or derivative of a varying cutoff is used. [Chern–Simons, *Characteristic forms and geometric invariants*, Ann. of Math. 99 (1974), §3, Proposition 3.2](https://annals.math.princeton.edu/1974/99-1/p03)

The algebraic check uses $|\mathrm{Rm}|^2=|W|^2+2|\mathrm{Ric}_0|^2+R^2/6$ and $|\mathrm{Ric}|^2=|\mathrm{Ric}_0|^2+R^2/4$. Consequently

$$
 |\mathrm{Rm}_m|^2dV_m+\mathcal E(m)=(2|W_m|^2+R_m^2/3)dV_m.
 \tag{3}
$$

In the flat limit $\mathcal E(h)=0$. Strong local convergence of both chiral Weyl densities and $|W|^2=4(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)$ give vanishing of the Weyl term against a compact test. Also $R_{m_i}=a_i^2Y_i\to0$, and each fixed test support has uniformly bounded $m_i$-volume. Choose a nonnegative smooth test at least one on a fixed compact whose image covers the source $A$-ball. Equation (3) now gives vanishing full curvature energy there. Constant rescaling preserves that energy in dimension four. Since every subsequence with a failure of (2) would have the further marked subsequence just used, (2) holds on the original sequence satisfying (1). [Master curvature normalization and budget](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L160) · [Master budget calculation](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L238)

## Center uniformity and the half-chiral radius

On any subsequence with $K_i=\max_M|\mathrm{Rm}_{g_i}|\to\infty$, take $a_i=K_i^{-1/2}$. The entire rescaled source has curvature norm at most one, so (1) holds at any chosen $p_i$ with every $C_B=1$. If the supremum over centers of the $A$-ball energies did not tend to zero, choose centers carrying at least a fixed positive amount on a bad subsequence. Equation (2) applied to those centers is a contradiction. This gives exactly

$$
\sup_{x\in M}\int_{B_{g_i}(x,A/\sqrt{K_i})}|\mathrm{Rm}_{g_i}|^2\,dV_{g_i}\longrightarrow0
\qquad\text{for each fixed }A<\infty.
$$

Let $r_i$ be the least physical radius attaining half the total positive chiral mass in some ball, as in E12. The pointwise comparison $|W^+|_{\rm HS}^2\le |\mathrm{Rm}|^2/4$ makes the supremum of chiral mass at radius $A/\sqrt{K_i}$ tend to zero. The attaining half mass is at least $2\pi^2$ on the nonstandard band, so $r_i>A/\sqrt{K_i}$ for all sufficiently large $i$ at each fixed $A$. Thus $r_i\sqrt{K_i}\to\infty$ on this subsequence.

The argument yields a limit at each fixed window, without a rate or a conclusion for an arbitrarily prescribed $A_i\to\infty$. The more general contrapositive of (2) is that any sequence of shrinking windows carrying a fixed positive full curvature energy on some fixed multiple must contain a subsequence on which the rescaled curvature supremum diverges in at least one fixed enlarged window. The multiple can be increased to include the energy-bearing window. If all such integer-radius suprema instead had finite limsup on the positive-energy subsequence, they would supply (1) simultaneously on that subsequence. Finally, pointwise curvature at a maximum is compatible with the vanishing integrated mass. In a local Euclidean model, the perturbations $\delta+\rho_i^2\psi(x/\rho_i)$ of a metric by a smooth compactly supported symmetric tensor $\psi$ can have fixed nonzero curvature at the origin, uniform curvature bounds, and full curvature integral $O(\rho_i^4)$, by choosing $\psi$ with a nonzero linearized curvature at zero and zero first jet there. This just tests the topology of convergence.

## Bounded maximum curvature and attainment

If $K_i$ is bounded on a subsequence, use the unscaled noncollapse estimate with scalar bounded by $S$ at all centers and $r\le1$. Since $\operatorname{Vol}_{g_i}(M)=1$, disjoint balls of one fixed small radius along a minimizing diametral geodesic bound the physical diameter uniformly. The curvature and noncollapse bounds give a global positive injectivity bound. Compact harmonic-coordinate convergence gives a connected closed limit on the same oriented smooth type after choosing the smooth limit atlas and markings as in E12. In its harmonic charts E12's interpolation and stationarity apply at scale one, giving strong chiral densities and distributional Bach-flatness. After passing to $Y_i\to y\ge y_0$, the weak scalar identity gives $R_h=y$. The Ricci regularity argument still applies because the Hessian of this constant scalar is zero. Bounded weak curvature makes the remaining quadratic curvature term locally bounded. Interior regularity for the tensor Laplacian and the harmonic metric equation then bootstrap $h$ to smoothness. [E12 stationarity and regularity](../notes/E12_HARMONIC_LIMIT.md#local-stationarity-and-smoothness) · [Avalos–Cogo–Royo Abrego, arXiv:2610.35257v1, Theorem 2.2(ii), Lemma 5.1](https://arxiv.org/html/2610.35257v1#S5)

The smooth whole-domain embeddings are diffeomorphisms in this closed case, since the image of a compact connected four-manifold under a local diffeomorphism is closed and open in the connected source. Uniform convergence gives $\operatorname{Vol}_h(M)=1$. Passing fixed test functions through these diffeomorphisms gives $Q_h(v)\ge y\|v\|_{L^4(h)}^2$, and equality for the constant test gives $Y([h])=y>0$. Strong chiral densities give $E_+(h)=I^+(M)$. Thus the bounded-curvature case supplies a smooth closed Bach-flat Yamabe minimizer on $M$. This is incompatible with a nonstandard smooth type if $I^+(M)=4\pi^2$ by inclusive recognition. For $I^+(M)>4\pi^2$ it is a closed survivor, so nonstandardness alone gives no $K_i\to\infty$ inference. The source-level alternatives are attainment along a bounded-curvature subsequence, or divergence of $K_i$ with the uniform vanishing estimate along the divergent subsequence.
