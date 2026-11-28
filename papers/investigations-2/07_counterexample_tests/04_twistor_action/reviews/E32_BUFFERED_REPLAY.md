# SP4-TWA-E32 · Independent buffered-wave replay

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E32_REQUEST_v1.md) specifies GPT-6.2 Sol/ultra for the non-author reader. Serving-model and reasoning-effort telemetry were unavailable. At HEAD `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`, the [E28 input](../notes/E28_PHASE_WAVE.md) matched SHA-256 `3373ad7f542915a2a5200e934e96ff8448af58d0bbef56407310a9dcb83836a2`. The three inherited digests in the [E28 request](../research-progress/handoffs/E28_REQUEST_v1.md) also matched.

The proof and finite interval certificate pass. On the oriented flat Riemannian cylinder \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) with unit slice volume, periodic spin structure and positive chirality, set \(b=51\pi/16\), \(\lambda=2\pi\), and \(\omega=\pi/2\). The action \(S=J_g^4\) is minimized uniquely by \(\psi=e^{bt}\sigma\) in the smooth admissible class
\[
\psi=e^{bt}h,\qquad
h=a(t)+c(t)e^{\mathbf i\lambda x_1}+d(t)\mathbf j,\qquad
a,c,d\in C^\infty([-1,1],\mathbb C_{\mathbf i}),
\]
where the parallel quaternion frame has \(\sigma=1\), \(a(\pm1)=1\), and \(c(\pm1)=d(\pm1)=0\). Admissibility here forces \(h\) to be zero-free, since a zero at \((t,x_1)\) extends along the \(x_2,x_3\) torus. The result concerns this single Fourier mode with a spatially constant perpendicular component. The unrestricted endpoint question remains open.

## Density, phases and first moment

The [quaternionic Clifford convention](../notes/E15_HELICAL_COMPETITOR.md) gives \(D=-\partial_t+\mathbf i\partial_{x_1}\) on these fields and \(|P\psi|^2=|d\psi|^2-|D\psi|^2/4\). Put \(A=a'+ba\), \(B=c'+bc\), \(E=d'+bd\), \(w=e^{\mathbf i\lambda x_1}\), \(R=|a+cw|^2+|d|^2\), and \(C=3/4\). Direct expansion gives
\[
R Q=C(|A+Bw|^2+|E|^2)+C\lambda^2|c|^2
       -\frac{\lambda}{2}\operatorname{Re}(\overline{A+Bw}\,cw),
\qquad Q=|P\psi|^2/|\psi|^2.
\]
Completing the square shifts \(B\) by \(-\lambda c/3\) and leaves \((8/9)\lambda^2|c|^2\) inside the factor \(C\), as in E28. At the radial field \(Q=Cb^2\), so the full volume two yields \(2C^2b^4=9b^4/8\).

After shifting the angular integration variable by the relative phase of \(a,c\), \(R\) is even. In the completed square the modulus and phase terms are \(u+ve^{\mathbf i y}\) and \(\mathbf i(A_1+B_1e^{\mathbf i y})\), with \(u,v,A_1,B_1\) real. Their cross term is \(2(vA_1-uB_1)\sin y\). The buffer gives only even terms, and its phase contribution is nonnegative. Squaring the full numerator and integrating against \(R^{-2}\) removes the odd cross terms. The resulting average is at least that for the moduli. Each coefficient and its modulus have derivative zero almost everywhere on the coefficient's zero set, so the calculation applies almost everywhere in time, with zero phase contribution there. The three moduli are Lipschitz, have the same endpoint data, and leave the slice minimum \(R_{\min}=(|a|-|c|)^2+|d|^2>0\) unchanged. Compactness gives a uniform positive denominator.

Write \(h=e^u g\) with \(g\in S^3\). With the real pairing, \(K_0=(g,\mathbf i g_{x_1})\) and \(K_1=(g_t,\mathbf i g)\). Expanding the projection in polar variables gives a mixed term \((g_t,\mathbf i g_{x_1})/2\) in \(Q\). Its integral vanishes. For \(v=g-1\), the integral of \((v_t,\mathbf i v_{x_1})\) equals its own negative after the two integrations by parts and skew-adjointness of left \(\mathbf i\). The identity extends by \(H^1\) approximation with zero end traces for \(v\). Also \(\int u_t=0\), and \(|K|^2\le |dg|^2\). In the integrated expression the amplitude term satisfies \(C|du|^2+\tfrac12 du\cdot K\ge-|K|^2/(16C)\). The coefficient remaining on \(\int|dg|^2\) is \(C-1/(16C)=2/3\), giving E28 (1).

## Angular comparison and domain edges

For nonnegative moduli, the factorization \(R=\rho^2(1+p^2+2p\cos y)\) gives \(p=ac/\rho^2<1\) and \(\Delta=\rho^2(1-p^2)>0\). With \(s=c^2/\rho^2\), one has \(F=(s-p^2)/(1-p^2)\in[0,1]\). The cosine expression (4) follows from \(a/\rho=p/\sqrt{s}\) for \(c>0\). The geometric series gives \(\langle1/R\rangle=1/\Delta\). Taking the real part of \(\overline{a+ce^{\mathbf i y}}\,ce^{\mathbf i y}\) in \(-K_0/\lambda\) then gives the mean \(F\). In the spatial energy, \(\langle|h_{x_1}|^2/R\rangle=\lambda^2s/(1-p^2)\). The logarithmic series for \(u=\log|h|\) gives \(\langle|u_{x_1}|^2\rangle=\lambda^2p^2/[2(1-p^2)]\) by orthogonality, which yields the second identity of E28 (2).

The unit-sphere distance \(\Theta=\operatorname{dist}_{S^3}(g,1)\) has zero endpoint values and \(|\Theta_t|\le |g_t|\) almost everywhere by the length bound along each time path, including paths meeting the antipode. The first Dirichlet eigenvalue on the length-two interval is \(\omega^2\). Since \(\lambda=4\omega\) and \(b\lambda=\frac32(\lambda^2+\omega^2)\), the first moment above \(2Cb^2\) is bounded below by
\[
\frac{2\omega^2}{3}\int_{-1}^1
  \left(\langle\Theta^2\rangle+\frac{8p^2}{1-p^2}-\frac{25}{8}F\right)\,dt.
\]
The domain splits cover all slices:

- If \(c=0\), then \(p=F=0\) and the bracket is nonnegative directly. If \(F=0\) and \(c>0\), then \(p^2=s>0\) and the bracket is positive.
- For \(p\ge17/32\) the spatial term is at least \(2312/735>25/8\). The excluded edge \(p=1\) would mean \(R_{\min}=0\).
- For \(0<F\le1/8\), \(p^2\ge25F/64\) suffices from the spatial term and angular positivity. Otherwise \(s\le89F/64\). The perpendicular component gives \(\langle\Theta^2\rangle\ge d^2/\Delta=(1-s)F/s\ge64/89-F>25F/8\), using \(64/89>33/64\).
- On the remaining closed rectangle the strict shortfall \(8p^2/(1-p^2)<25F/8\) implies \(s>89p^2/25\). The derivative of \(X\) in \(v=\cos y\) has the sign of \(s(1+p^2+pv)-p^2\), strictly positive by \(1+p^2-p\ge3/4\), also at \(p=0\) since \(s>0\). Thus \(\Theta^2\) increases for \(0\le y\le\pi\). The left-endpoint Riemann sum is a lower bound wherever the spatial term has a shortfall. The rectangle includes \(F=1\) and \(p=0\), where \(s\) and \(1+p^2+2pv\) remain positive. On the spatial equality boundary and every spatial-only acceptance with \(c>0\), \(c\sin y/\sqrt R\ne0\) on a set of positive measure, so the angular term gives strictness.

At every time with \(c\ne0\) the bracket is strictly positive, and a nonzero smooth wave coefficient gives a positive-measure set of such times. Hence \(\int_M Q>2Cb^2\) after reduction to the moduli, and Cauchy–Schwarz gives strict action excess for the original field as well. When \(c\equiv0\), apply the time-only identity directly to the original field, \(\int_M Q=2Cb^2+C\int_M(u_t^2+|g_t|^2)\). The end values of \(u,g\) are \(0,1\), so equality requires \(h=1\). For the separate unbuffered zero-free complex class with arbitrary smooth \(x_1\) dependence, the constant full end traces make the winding zero and give a global phase lift \(g=e^{\mathbf i\phi}\). The current \((-\phi_{x_1},\phi_t)\) is divergence-free and has zero integrated time component. The integrated mixed amplitude term vanishes by periodicity and \(u=0\) at the ends. The stronger first moment \(2Cb^2+C\int_M(|du|^2+|dg|^2)\) proves the same uniqueness for any real \(b\), including \(b=0\).

## Finite certificate replay

I extracted the C fence byte-for-byte (SHA-256 `c1b416ed3bc94e4fc0350a86cff4190d3118e04b81459442ea8014df752337a9`) and compiled it with Apple clang 15.0.0 (`clang-1500.3.9.4`) on Darwin arm64 using `-O3 -std=c17 -ffp-contract=off -Wall -Wextra -Wpedantic`. It compiled without diagnostics and exited zero. An `-O0` build with contraction disabled gave the same result.

```text
ok 1, blocks 3811, leaves 1 22 440 1143 300, depth 17, margin 2.80357093616e-05
```

The interval enclosures assume binary64 evaluation, round-to-nearest, correctly rounded primitive operations and square root, exact neighboring-value steps via `nextafter`, gradual underflow, and no fast-math reassociation or contraction. A separate local probe confirmed binary64, `FLT_EVAL_METHOD=0`, `FE_TONEAREST` and working subnormal arithmetic. The optimized assembly used standalone square-root instructions and had no fused multiply-add/subtract. The kernel does not rely on a library cosine or inverse cosine.

Exact rational arithmetic independently verified the hexadecimal \(\pi\) bracket. If \(S_n(x)=\sum_{k=0}^n(-1)^kx^{2k+1}/(2k+1)\), its lower bound was compared with \(16S_{23}(1/5)-4S_{24}(1/239)\), and its upper bound with \(16S_{24}(1/5)-4S_{23}(1/239)\). Both rational gaps are positive, approximately \(4.1193\times10^{-15}\) and \(7.8711\times10^{-15}\), respectively. The tangent addition formula gives Machin's identity, and the alternating cosine series after term 1 decreases in term magnitude throughout the enclosed range. Thus truncation at 15 supplies the lower cosine and at 14 the upper. The trial angles are exact multiples of the lower \(\pi\) endpoint, hence in \([0,\pi]\), and their squares are rounded down. A table lookup returns either zero or a certified trial square for which the lower trial cosine exceeds or equals the enclosed upper \(X\). This remains valid when interval overestimation puts that upper endpoint outside \([-1,1]\).

The rounded endpoints of each operation enclose the real interval result. The lower spatial term uses monotonicity in \(p\), the target uses the upper \(F\) endpoint, and the rewrite \(1+p^2+2pv=(1-p)^2+2p(1+v)\) retains a positive denominator over the accepted boxes. The dyadic midpoints are exactly representable through the depth cap of 42. Both children must pass, so a successful return covers the closed rectangle. In a box containing both spatially sufficient and insufficient points, the angular Riemann sum comparison is required only on the insufficient subset, while the computed bound encloses its sample values throughout the box. The early-break threshold only selects refinements. Here one leaf closed by the spatial term and 1,905 by positive downward-rounded margins for the left sums. The displayed minimum margin is rounded for printing. The floating-point search in E28 is exploratory and is independent of this proof.
