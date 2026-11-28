# SP4-M2-E15 · A finite-centre test in the exact twisted tube

27 November 2026, America/New_York. For Edward B. Baker III with OpenAI Codex assistance. The [revision 2 request](../research-progress/handoffs/REQUEST_M2_TWISTED_MODEL_20261127.md) specifies `gpt-6.2-sol / ultra`. Actual serving variant and effort are unavailable to this return. Working base `6a422ce7814f`. Inputs are the [LINE decision](../../investigations-2/03_lines_and_broken_fibrations/brainstorm/notes/LINE_B02_LAST_CIRCLE.md), [period calculation](../../investigations-2/03_lines_and_broken_fibrations/notes/CORE_PERIOD.md), [cap-degree calculation](../../investigations-2/03_lines_and_broken_fibrations/notes/CAP_DEGREE_AND_CHAMBERS.md), their [E06](../../investigations-2/03_lines_and_broken_fibrations/reviews/LINE_E06_PERIOD_REPLAY.md) and [E07](../../investigations-2/03_lines_and_broken_fibrations/reviews/LINE_E07_CAP_DEGREE_REPLAY.md) replays, the [LINE return](../../investigations-2/03_lines_and_broken_fibrations/research-progress/handoffs/TO_MASTER2_LAST_CIRCLE_20261127.md), and the [twisted half-ray](E12_TWISTED_RAYS_20261127.md) and [signed-current](E13_CURRENT_AND_SIGNS_20261127.md) checks. Primary passages inspected on 27 November in Taubes, [*The structure of pseudo-holomorphic subvarieties for a degenerate almost complex structure and symplectic form on* \(S^1\times B^3\)](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf), *Geom. Topol.* **2** (1998), 221–332, DOI 10.2140/gt.1998.2.221. Citations below refer to this published version.

**Independent replay.** For the frozen weight-one current of signed meridional degree \(+1\), the limiting weighted density at a point of the zero circle is \(2/3+2(q_++q_-)+\sum_j\delta_j\). Each isolated cone has \(\delta_j>1/50\) in the exact model normalization. An upper bound strictly below \(2/3+1/50\) at one admissible scale, certified over a finite net with the centre error below, forces a smooth one-sheet boundary collar. A smooth one-sheet boundary collar also gives such a certificate at some sufficiently small scale. No sample values for the marked current are supplied by this calculation.

## Measure and scales

The capped manifold is smooth, oriented and Riemannian, with self-dual form \(\bar\omega\). Write \(T\) for the given finite-energy positive current in the complement of its one twisted zero circle \(Z\). The measure \(\mu=\bar\omega|_T\), with current multiplicity, is positive and has total mass \(P=\int_Z\alpha>0\), where \(d\alpha=\bar\omega\) off the marked line. Here \(P\) is the mass of the weighted measure. In the exact model the geometric mass uses the flat area measure, and \(\mu=\lambda\,dA\) on each oriented complex tangent plane, where \(\lambda=(x^2+y^2+4z^2)^{1/2}\) is the comass of \(\omega\) and \(|\omega|=\sqrt 2\lambda\) in the master convention. [Taubes, (1.1)–(1.4) and Definition 1.2, pp. 222–223](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf)

Use the exact flat metric on the twofold cover of the tube, with the self-dual form (1.1) and deck action \((t,x,y,z)\mapsto(t+L,x,-y,-z)\), where \(L\) is the downstairs circle length. Take \(2s\) strictly below the exact normal radius and \(L/2\). The cutoff about a downstairs point \(a\in Z\) then has support in a ball whose inverse image is two disjoint isometric copies. In a copy about a chosen lift of \(a\), the ambient distance to \(a\) is the Euclidean radius \(r=(|t-t_a|^2+x^2+y^2+z^2)^{1/2}\). Paths leaving the exact tube cost at least its normal radius, and the short time coordinate minimizes across deck translates. Restriction to either one lifted ball projects diffeomorphically with its original current weights and positive orientation. Each lifted meridian maps diffeomorphically to the downstairs meridian and has signed degree \(+1\). Integrating on one lifted ball therefore gives the downstairs integral directly. The full preimage of the support contains two such copies. [Taubes, §1(c), pp. 230–232](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf) · [E12](E12_TWISTED_RAYS_20261127.md) · [E13](E13_CURRENT_AND_SIGNS_20261127.md)

Fix a smooth nonincreasing \(\chi:[0,\infty)\to[0,1]\), equal to \(1\) on \([0,1]\) and \(0\) on \([2,\infty)\), as in Taubes (2.1). Put
\[
c_\chi=3\int_0^\infty \chi(r)r^2\,dr>0,\qquad
\sigma_a(s)=\int \chi(d(a,y)/s)\,d\mu(y),\qquad
D_s(a)=\frac{\sigma_a(s)}{c_\chi s^3}.
\]
The cutoff is smooth in the one lifted ball, since it is constant near its centre. Taubes Proposition 2.1 gives \(\sigma_a'(s)\ge 3\sigma_a(s)/s\) and geometric area \(O(s^2)\) in the ball of radius \(s\), uniformly in its zero-circle centre for all sufficiently small \(s\). Thus \(D_s(a)\) increases with \(s\) and has a finite limit \(D_0(a)=\inf_{s>0\ {m small}}D_s(a)\). The scale condition concerns the exact model. The following local Stokes calculation also gives the monotonic inequality at any scale with the cutoff support strictly within one such exact chart. [Taubes, §2, (2.1)–(2.12), pp. 236–238](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf)

## Off-circle testing and monotonicity

Write \(N=(x^2+y^2+z^2)^{1/2}\), \(\rho^2=x^2+y^2\), \(f=\rho^2/2-z^2\), and
\[
\beta=-f\,dt-z(x\,dy-y\,dx).
\]
Then \(d\beta=\omega\), the deck action preserves \(\beta\), and \(|\beta|^2=\rho^4/4+z^4\le N^4\). Hence \(|\beta|/\lambda\le N\). Use a cutoff \(\eta_\epsilon\) equal to zero for \(N\le\epsilon\), equal to one for \(N\ge2\epsilon\), and with \(|d\eta_\epsilon|\le C/\epsilon\). For \(\chi_s=\chi(d(a,\cdot)/s)\), Stokes on the proper boundaryless normalization applies to the compactly supported form \(\eta_\epsilon\chi_s\beta\). The term with \(d\eta_\epsilon\) is bounded in absolute value by \(2C\mu(\{\epsilon<N<2\epsilon\})\), which tends to zero by finiteness of \(\mu\). Thus
\[
\sigma_a(s)=-\int_T d\chi_s\wedge\beta,
\qquad
\left|\sigma_a(s)+\int_T \eta_\epsilon\,d\chi_s\wedge\beta\right|
\le \frac{2\epsilon\|\chi'\|_\infty P}{s}.
\]
The approximating form \(-\eta_\epsilon d\chi_s\wedge\beta\) is smooth with compact support away from \(Z\) after extension by zero. It is therefore a valid test for weak convergence on the complement of \(Z\). In the normalized density the cutoff error is bounded by \(2\epsilon\|\chi'\|_\infty P/(c_\chi s^4)\), separately from any error in the weak-current pairing. That latter error requires its own bound for a numerical certificate.

For the monotonic estimate, let \(R=(t-t_a)\partial_t+x\partial_x+y\partial_y+z\partial_z\) in the lifted chart and \(\theta=\iota_R\omega/3\). Then \(\theta-\beta=d((t-t_a)f)/3\). The integral of \(d\chi_s\wedge d((t-t_a)f)\) against \(T\) vanishes by Stokes with \(eta_\epsilon\) followed by \(\epsilon\downarrow0\). Indeed, on the support of \(d\chi_s\), \(|(t-t_a)f|\le2s N^2\), so the cutoff error is at most a constant times \(\mu(\{\epsilon<N<2\epsilon\})\). Since \(|\theta|\le r\lambda/3\), the identity with \(\beta\) gives
\[
\sigma_a(s)=-\int_T d\chi_s\wedge\theta
\le \frac{1}{3s}\int -\chi'(r/s)r\,d\mu
=\frac{s}{3}\sigma_a'(s).
\]
Differentiation follows by dominated convergence for \(s>0\), since \(\chi'\) vanishes off the annulus \(s\le r\le 2s\) and \(\mu\) is finite. This is the positive-energy form of Taubes's calculation with the radial primitive (2.8). [Taubes, (1.8), (1.10) and (2.8)–(2.12), pp. 226–227, 238](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf)

## Density of the tangent current

**Imports.** For any sequence \(s_i\downarrow0\), use Taubes Proposition 3.2 on the rescaling of the lifted current by \(1/(3s_i)\) about the chosen lift. A subsequence converges geometrically on the complement of the straight zero line, in particular as currents against smooth compactly supported two-forms there, by Definition 3.1. Proposition 4.1 identifies the contributions in the unit ball as \(p\) equatorial half-planes, \(q_+,q_-\) axial half-planes, and a finite weighted list of isolated cones from Example 1.5. All contributions count with their positive multiplicities. Step 1 of its proof identifies \(p-q_+-q_-\) with the signed meridional degree. [Taubes, Definition 3.1, Propositions 3.2 and 4.1, pp. 239–242, 251–252](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf)

The form \(\chi(3r)\omega\) has support in the rescaled ball of radius \(2/3\) where all these contributions are known. Use an additional cutoff \(\eta_\epsilon\) to pair away from the zero line. The rescaled geometric mass in this ball is bounded uniformly by Proposition 2.1. Since \(\lambda\le2N\), removing the cutoff causes an \(O(\epsilon)\) error uniformly along the rescaled sequence. The same bound for the tangent current follows from the finite area of its smooth links and half-planes. This proves convergence of the weighted pairing through the line. The argument concerns this pairing, whose form vanishes on the line, and needs only the stated off-line weak convergence.

An equatorial half-plane has integral \(\int_{t^2+u^2<b^2,\,u>0}u\,dt\,du=2b^3/3\) in a ball of radius \(b\). For either axial direction the positive measure is \(2u\,|dt\,du|\), giving \(4b^3/3\). An isolated cone has integral \(b^3\delta_j\), by the dilation degree three of \(omega\). Whenever the energy in a centred ball is \(A b^3\), integration against \(\chi(b/s)\) gives \(A c_\chi s^3\) by the radial measure \(3A b^2\,db\). In the scale \(3s_i\) the factor \(3^3\) from pulling back \(\omega\) cancels the factor \(3^{-3}\) from \(\chi(3r)\). It follows that, with \(q=q_++q_-\),
\[
D_0(a)=\frac23p+\frac43q+\sum_j\delta_j
       =\frac23+2q+\sum_j\delta_j.
\]
The second equality uses \(p-q=1\) on a single lifted meridian. Every tangent current gives the same weighted scalar, including when the angular directions are only fixed up to rotation. [Taubes, Examples 1.3–1.5, Lemma 1.10 and Proposition 4.1, pp. 223–225, 233–236, 251–252](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf)

## Explicit isolation gap

For an Example 1.5 cone, use its unit link from (1.6)–(1.7), parametrized by the lifted polar angle \(\tau\),
\[
v(\tau)=\left(\pm\tfrac32u',\sqrt{c/u}\cos\tau,\sqrt{c/u}\sin\tau,\pm u\right),\qquad
\tfrac94(u')^2+u^2+c/u=1,\qquad
u''=-\tfrac49u+\tfrac29cu^{-2}.
\]
Here \(0<c\le 2/3^{3/2}\) and \(u>0\). Along a closed link the \(\tau\) interval covers at least one full turn because the angular radius is positive and \(\phi=\tau\) advances monotonically in this parametrization. Use the common period that closes the link, with endpoints interpreted periodically. Since \(v\perp v'\), the geometric area factor of \((b,\tau)\mapsto b v(\tau)\) is \(b|v'|\). The comass is \(b\sqrt{c/u+4u^2}\), so
\[
\delta_c=\frac13\int_{\text{link}}\sqrt{c/u+4u^2}\,|v'(\tau)|\,d\tau.
\]
If \(c\ge1/100\), both factors in the integrand are at least \(\sqrt{c/u}\), using the angular part of \(v'\). As \(u\le1\), this gives \(\delta_c\ge2\pi/300>1/50\). If \(0<c<1/100\), at a maximum \(u_m\) one has \(u_m^2+c/u_m=1\) and \(c/u_m\le2u_m^2\). Thus \(u_m\ge1/\sqrt3\). Since \(|u'|\le2/3\), on an interval of length \(1/2\) centred at that maximum one has \(u\ge1/\sqrt3-1/6>2/5\). On this interval \(\sqrt{c/u+4u^2}>4/5\) and
\[
|v'|\ \ge\ \tfrac32|u''|\ \ge\ \tfrac23u-\frac{c}{3u^2}\ >\ \tfrac15.
\]
Consequently \(\delta_c>2/75>1/50\). The use of the positive geometric area gives the same bound for both signs and for the constant solution at the upper endpoint of the parameter range. This derives the numerical bound from the normalized link and comass. Lemma 1.10 supplies the qualitative uniform bound. [Taubes, (1.3), Example 1.5, Lemma 1.10 and Proposition 3.2 proof, pp. 222, 225, 233–236, 241–242](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf)

## Finite test and collar

Let \(a_1,\ldots,a_m\) be an \(h\)-net of the downstairs zero circle in its intrinsic metric, and fix one admissible \(s>0\). By the reverse triangle inequality for ambient distances, \(|d(a,y)-d(a_i,y)|\le d(a,a_i)\le h\) whenever the intrinsic distance from \(a\) to \(a_i\) is at most \(h\). Applying this under the integral on the same downstairs measure gives
\[
\sup_{a\in Z} D_s(a)\le \max_i D_s(a_i)+\frac{\|\chi'\|_\infty P h}{c_\chi s^4}.
\]
Rigorous upper bounds on \(D_s(a_i)\) may be used in place of the exact samples. If the right-hand bound is strictly below \(2/3+1/50\), monotonicity and the gap force \(p=1,\ q_+=q_-=0\) and no isolated cone at every point. Once \(n_+=n_-=0\) on the entire lifted circle, §7 defines regular points as local minima of \(p\). Hence every point is regular, and Proposition 7.1 gives exactly one real-analytic equatorial half-sheet at every lift. The deck map takes each germ to the unique one at the other lift. Compactness allows these germs to be restricted to a collar, whose quotient is embedded with boundary mapping diffeomorphically onto \(Z\). [Taubes, §7, Proposition 7.1 and §8, pp. 261–262, 275–285](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf) · [E12 descent](E12_TWISTED_RAYS_20261127.md)

Conversely, a smooth embedded weight-one boundary collar of signed degree \(+1\) gives a single equatorial tangent half-plane at each point, so \(D_0\equiv2/3\). For any fixed positive margin \(\varepsilon\), each centre admits an admissible scale with \(D_s(a)<2/3+\varepsilon\). The inequality persists in an open neighbourhood of the centre by the Lipschitz bound. A finite subcover and the minimum of its scales, using monotonicity, give one scale at which this strict bound holds on all of \(Z\). Taking \(\varepsilon<1/50\), then choosing \(h\) small enough at that fixed scale, gives the finite-centre inequality. The test decides a sufficient condition on a given current in a prepared exact tube, with an existence-of-certificates converse for an actual collar. It supplies no bound on the actual samples from degree, the period identity, or cap avoidance alone.
