# Independent reading of the scalar deficit and cap response

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded DEF-E03i / CDS-E02l reader at intake `8471728a1549614f155a8751c709904cbcf994d6`. The dispatch specifies GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. The [source note](../01_collar_deformation_and_adapted_coordinates/notes/SCALAR_DEFICIT_AND_CAP_RESPONSE.md) matched the [reader issue](../research-progress/handoffs/EXTERIOR_AND_CAP_READINGS_20261126.md) SHA-256 `1f5ef9308d600fc0d14e5c5c876b26a32a90e9f6a3d04828dc6599030616950d`. This is an analytical check on a smooth oriented Riemannian homotopy four-sphere at one finite marked index.

The relaxed infimum, inclusive positive-scalar endpoint, Dirichlet eigenvalue and all-trace response constants check. The collar estimate uses an exterior Gaussian width measured into the unchanged exterior. The common inward connector width supplies that parameter only if an exterior collar of at least the same width is also measured.

## Relaxation and scalar equality

Let $E$ be either integrated Hilbert–Schmidt Weyl block energy and $T=4\pi^2$. Signature gives equality of the two closed energies. With $Z=\operatorname{Ric}_0$ and $q$ the unit-volume Yamabe metric of the given conformal class, the Chern–Gauss–Bonnet formula is

\[
 16\pi^2=2E-\tfrac12\|Z_q\|_2^2+\tfrac1{24}Y^2,
 \qquad Y^2=48(2T-E)+12\|Z_q\|_2^2.
\]

The factor $2E$ uses the sum of the two operator norms, which is one quarter of the four-index Weyl norm squared. On the original metric $h$, normalize a positive Yamabe minimizer by $\|u\|_{4,h}=1$. With $n=\|R_-\|_{2,h}$ one has

\[
 Y=Q_h(u)\ge 6\|du\|_{2,h}^2+\int R_+u^2\,dV_h-n\ge -n.
\]

The same Hölder inequality bounds the quotient for all $H^1$ functions, even before existence is invoked. Set $y=\sqrt{48(2T-E)}$ when $E<2T$. If $Y\le0$, then $Y\le-y$, so $n<y$ excludes this sign. When $n=y$, the nonpositive branch forces $Y=-y=-n$ and $Z_q=0$. Equality in the quotient bound gives $du=0$ and $R_+=0$ since $u>0$. The Yamabe equation then makes $R_h$ constant, so equality on this branch requires $h$ itself to be negative Einstein up to constant normalization. Conversely such a metric in the subcritical band would give this equality by testing the quotient with a constant. A positive scalar region in the fixed representative excludes the nonpositive branch. At $E=2T$ the strict hypothesis $E<2T$ is essential for the asserted positive spectral lower bounds. If also $Y\le0$ and $F=2T$, the identities give $n=Y=0$ and $Z_q=0$. Equality in $Q_h(u)=0$ then makes $h$ scalar-flat and Ricci-flat. [Lee–Parker, Theorem 4.5 and the closing Yamabe theorem](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [Master energy and quotient definitions](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [The scalar wall](../../../master/manuscript/variational_comparison.tex)

In a nonpositive class, $n\ge -Y$ and the formula above give $F=E+n^2/48\ge2T$. In a positive class $F\ge E\ge I^+(M)$. When $I^+(M)<2T$, positive unit-volume Yamabe representatives realize $F=E$ along an energy-minimizing sequence. Hence $\inf_h F(h)=I^+(M)$ and every $F$-minimizing sequence has positive class eventually, with $I^+(M)\le E\le F$ and $n^2=48(F-E)\to0$. On an unrestricted conformal class the unit-volume Yamabe metric attains $\inf n=\max(0,-Y)$. The fixed-exterior cap test evaluates $n$ in the assembled physical representative.

On a marked disk replacement smooth across the seam, the unchanged exterior of the unit-volume Yamabe source has constant scalar curvature $Y_i>0$. The cap gives all of $n^2$ and the closed ledger gives $E=e_i-m_i^\sigma+c_\sigma$. Equating its two signs yields $c_+-c_-=m_i^+-m_i^-$. For $E<I^+(M)<2T$, positive class would contradict the defining infimum. The positive exterior therefore forces $n^2>48(2T-E)$. At $E=I^+(M)$ that contradiction is absent. For $I^+(M)>T$ and $E\le T$ the strict lower scalar cost is at least the wall value in the sense $n^2>48(2T-E)\ge48T$. Conversely $E\le T$ together with the inclusive $n^2\le48(2T-E)$ supplies both hypotheses of the master recognition proposition. At $E=T$ the four-index energy is $8T=16\pi^2\chi(M)$. The equality alternatives of Chang–Gursky–Yang are incompatible with $H_2(M)=0$ and $\pi_1(M)=0$. On a balanced disk the signed removal includes the protected core by definition of the complete disk mass. [Chang–Gursky–Yang, Theorems A and B](https://numdam.org/item/10.1007/s10240-003-0017-z.pdf) · [Balanced enlargement](../../../master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex)

## Dirichlet and outward forms

Use $L_X=-6\Delta_X+R$ with $\Delta=\operatorname{div}\nabla$. The first Dirichlet eigenvalue is relative to $L^2(X)$ for the physical cap or exterior metric. Extension by zero of $u\in H^1_0(C)$ across the smooth seam and Hölder give

\[
 Q_C(u)\ge y\|u\|_{4,C}^2\ge \frac{y}{\sqrt{\operatorname{Vol}(C)}}\|u\|_{2,C}^2.
\]

This also applies to $V$. The stated weak inequality suffices. A first Dirichlet eigenfunction on the smooth connected piece would need constant absolute value to attain the Hölder equality, which is incompatible with its zero trace and nonzero norm. Since $R$ is bounded, positive $\lambda_1^D$ makes the form coercive on $H^1_0$ by combining its spectral $L^2$ bound with $6\|du\|_2^2\le Q_X(u)+\|R_-\|_\infty\|u\|_2^2$. Thus a trace lift and the zero-trace variational problem give a unique $L_X$-harmonic extension for every $\varphi\in H^{1/2}(\Sigma)$.

Let $f$ be the function obtained by gluing the two harmonic extensions, whose traces agree. It belongs to $H^1(M)$ and $Q(f)=Q_V(f_V)+Q_C(f_C)$. For the joined endpoint in a positive class of $E<2T$,

\[
 Q_C(f_C)\ge-n\|f_C\|_4^2\ge-n\|f\|_4^2,
 \qquad Q(f)\ge Y\|f\|_4^2\ge y\|f\|_4^2.
\]

It follows that $Q_V(f_V)\le (1+n/y)Q(f)$. Green's identity gives $Q_X(f_X)=6\langle\varphi,N_X\varphi\rangle_{h_0}$, where $N_X=\partial_{\nu_X}f_X$ is the outward normal derivative and the pairing is the $H^{1/2}$–$H^{-1/2}$ pairing based on the assembled boundary metric. In particular the two operators add and

\[
 6(N_V+N_C)\succeq \frac{y}{y+n}\,6N_V\succeq\tfrac12,6N_V\qquad(n\le y).
\]

The second step uses exterior form positivity. At $n=y$ the guaranteed coefficient is $1/2$. For a nonzero trace and $n>0$, the combined quadratic form is strictly larger than $y/(y+n)$ times the exterior form on that trace because $\|f_C\|_4^2<\|f\|_4^2$. For $n>y$ the first comparison still holds if the sign was obtained independently. [Outward derivative convention and exact boundary test](../01_collar_deformation_and_adapted_coordinates/notes/PHYSICAL_BOUNDARY_RESPONSE.md)

For a measured exterior Gaussian width $a>0$, let $t$ increase into $V$ and $j_a=\inf_{[0,a]\times\Sigma}dA_{h_t}/dA_{h_0}$. Drop the nonnegative angular term and retain the normal and scalar terms over this collar. In each angular fiber the infimum of $\int_0^a (6|v'|^2+Y_i|v|^2)\,dt$ at $v(0)=b$ uses the natural condition $v'(a)=0$. The solution is $v(t)=b\cosh((a-t)\sqrt{Y_i/6})/\cosh(a\sqrt{Y_i/6})$. Its energy is $-6v(0)v'(0)=\sqrt{6Y_i}\tanh(a\sqrt{Y_i/6})|b|^2$. Applying it with $b=\varphi(x)$ and integrating establishes the stated exterior form bound with $a$ in place of $w$. Smooth approximation extends the fiber calculation to all $H^{1/2}$ traces. This estimate can use $a=w$ when that much exterior width is supplied. Otherwise it uses a separately available exterior width, or the minimum of that width and $w$. The cap cost and its scalar bound are still measured at the actual connector width $w$.

## Scope of the finite applications

The original cap has scalar $Y_i>0$ and $c_\sigma=m_i^\sigma$, so $n=0$, its form is positive and the closed energy is exactly $e_i$. A replacement which matches the prescribed full exterior germ has $n^2\le s+B_w^2J_w w\operatorname{Area}_{h_0}(\Sigma)$ whenever the connector scalar is at least $-B_w$, $B_w\ge0$, its volume has the stated bound, and $s$ is its off-strip negative scalar charge. An upper energy bound $\bar E<2T$ can be inserted on the right as $48(2T-\bar E)$ because the threshold decreases with energy. For trace-matched fixed smooth jets the potentially divergent normal term in scalar curvature is a trace-free second derivative at the face. Its trace at nearby slices is $O(w)$, so the inverse-width factor gives a bounded scalar contribution. The trace-free Weyl cost is still measured at that width, and all off-strip cost must enter. A preliminary cap joined with only matching trace of the shape operator is outside the smooth closed scalar test until its smooth connector is supplied. [Guarded connector, scalar cancellation and signed costs](../01_collar_deformation_and_adapted_coordinates/notes/FINITE_CURVED_CONNECTOR.md)

E61 supplies the actual smooth charged disk, its physical exterior and raw curvature bookkeeping. A new cap still requires its own full energy and negative scalar integral or simultaneous bounds at a common certified cap width. No such cap or joined metric path is exhibited here. The strictly subcritical joined path is the hypothesis of the earlier scalar-wall proof along a path. The endpoint test supplies only its own metric's sign. [Charged disk source](../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) · [Path argument](../../../master/manuscript/variational_comparison.tex)

Input SHA-256 prefixes at inspection were `ffa99fafe678ce33` (source issue), `c9320f8f8b8c111d` (master normalizations and recognition), `d52c8d2ad83e21d0` (master wall), `d1b1dced54363b77` (previous response), `cd10e9537da67da9` (connector), `8063d76ad6875e80` (E61) and `96ec25cd36bf5d31` (balanced exterior).
