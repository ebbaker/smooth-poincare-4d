# WIN-E29 C · Independent replay of the tensor test and deficit transfer

28 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded analytical reading by a worker
who authored neither component. The frozen route specifies GPT-6.2
Sol / ultra. Actual serving variant and effort were unavailable to this
worker. Checkout 86b24d9f9c2d6d634236f723eae0de4dd99fc5a7. The
[replay request][replay], [metric request][metric], and
[comparison request][comparison] specify the inputs and scope.

| Input | SHA-256 at intake |
| --- | --- |
| [WIN-E25][e25] | f077061d0ecd08aca6eccb7d516508c273706fd5b6c80988915ee6745c6e9300 |
| [WIN-E26][e26] | 31de11b62b9b04f71fe40d8dfb266777256584ca6709b0de6dda0de9affc3e64 |

Both calculations replay with the stated constants. The first gives a
smooth round TT tensor on the specified oriented sphere, with
\(\|S\|_{\infty,q}\le128\) and probability pairing at least
\(\epsilon a^6/34992\). The second gives the transfer and sign of the
quartic deficit for every supplied smooth admissible generating positive
pencil in the regime \(\sqrt R\le t^2\), with \(t=a^6\).

## WIN-E25

Use the diagonal Euclidean curvature operator on the six elementary
wedges. In the order \(12,13,14,23,24,34\), its sectional entries are
\((1,-1,0,0,-1,1)\). The pair symmetries and diagonality give the
first Bianchi identity, and each Ricci row has sum zero. The full
four-tensor has sixteen components of absolute value one, giving
\(|C|_\delta=4\). With \(r=a/3\) and the radial bump
\(\phi=r^2\beta(|y|^2/r^2)\) of E25, contraction with the Hessian gives
\(T_{ij}=C_{ikjl}\partial_k\partial_l\phi\). Pair exchange gives
symmetry, Ricci trace gives tracefreeness, and the symmetric third
derivative in \(i,k\) contracts to zero in \(\partial^iT_{ij}\).
The cutoff is smooth to all orders, including after zero extension.

For \(z=(1-|y|^2/r^2)^{-1}\), the second derivative of the scalar
profile is \((z^4-2z^3)e^{-z}\). Maximizing \(z^k e^{-z}\) on the
positive axis bounds its absolute value by
\((4/e)^4+2(3/e)^3< (3/2)^4+2(9/8)^3<8\), using \(e>8/3\).
The isotropic Hessian term \(2\beta'\delta_{kl}\) contracts to zero.
The rest has norm at most \(4|\beta''|\), since
\(|y\otimes y|_\delta/r^2\le1\). Hence
\(|T|_\delta\le128\).

For \(u=\log\Omega\), contract the conformal connection coefficients
\(\Gamma^l_{ki}=\delta^l_k u_i+\delta^l_i u_k-\delta_{ki}u^l\).
The covariant divergence of \(e^{wu}T\) in \(q\) is
\(e^{(w-2)u}(\partial^iT_{ij}+(w+2)u^iT_{ij})\). In the connection
term on the contracted index one has
\(\delta^{ki}\Gamma^l_{ki}=-2u^l\), and in the term on the free
index one has \(\delta^{ki}\Gamma^l_{kj}T_{il}=0\) by symmetry
and tracefreeness. Taking \(w=-2\) gives \(S=\Omega^{-2}T\) with
zero round divergence and trace. Its round covariant norm is
\(\Omega^{-4}|T|_\delta\), at most \(128\) on the cap.

There \(\rho=\chi=1\) and
\(h=\epsilon\Omega^2(y^1)^2(dy^2\otimes dy^2-dy^3\otimes dy^3)\).
The two inverse round metrics in the pairing cancel \(\Omega^4\)
from the volume form, and the conformal powers on \(h,S\) cancel
each other. Integration by parts twice yields
\[
 \int\langle S,h\rangle_q\,dV_q
 =2\epsilon(C_{2121}-C_{3131})\int\phi\,dy
 =4\epsilon\int\phi\,dy .
\]
On the ball of radius \(r/\sqrt2\), the bump is at least
\(r^2e^{-2}>r^2/9\). That ball has volume \(\pi^2r^4/8\), so the
unnormalized pairing is at least \(\pi^2\epsilon r^6/18
=\pi^2\epsilon a^6/13122\). For the round probability measure
\(d\nu=dV_q/V_0\), \(V_0=8\pi^2/3\), the lower bound is exactly
the stated \(\epsilon a^6/34992\). In particular it exceeds
\(2^{-16}\epsilon a^6\).

## WIN-E26

Keep the fixed pencil parameter inner product under conformal transport
from \(g\) to \(\gamma\). The evaluation kernel is unchanged by the
pointwise spin identification and common positive factor. At the
incidence line, the [conformal residue transformation][rigidity] scales
the relative twistor error by inverse length, so its fourth power and
the four-dimensional volume changes cancel. In the [jet split][spectral],
differentiating zero evaluation at a local unit lift gives the Clifford
similarity \(S_0\) and its Hilbert–Schmidt orthogonal remainder \(N\);
the unit-target Hopf length factor gives
\(\|N\|_{L^4(dV_\gamma)}=2R^{1/4}\). Fibrewise quaternionic operations
preserve the orientations of the relevant real lines, so the nonzero
Clifford similarities have one common sign \(\sigma\) in the specified
oriented frames. The absolute degree follows from the evaluation
quotient \(S^+\cong f^*Q\) and \(c_2(S^+)=-u_{S^4}\),
\(c_2(Q)=u_{\mathbb{HP}^1}\). In the outward Hopf orientation this
gives \(\deg f=-1\). [Degree convention][degree]

Let \(B=(q^{-1}\gamma)^{1/2}\) in a round orthonormal tangent frame.
The eigenvalues of \(B\) belong to
\([\sqrt{1-t},\sqrt{1+t}]\), and the frame \(B^{-1}\) applied to
the round frame is positively oriented and \(\gamma\)-orthonormal.
Hence \(A_\gamma=AB^{-1}\) for \(A=df\) in round frames,
\(\|B-I\|_{\rm op}\le t\), and \(dV_\gamma\ge(1-t)^2dV_q\).
Writing \(A=S_0+E\), the conversion gives
\(E=S_0(B-I)+NB\) and
\(|S_0|\le|A_\gamma|\le(1-t)^{-1/2}|A|\) by orthogonality of
the split. Set \(X=\|A\|_{L^4(d\nu)}^2\). Minkowski followed by
the elementary bound on the square of a sum yields
\[
 \|E\|_{L^4(d\nu)}^2
 \le \frac{2t^2}{1-t}X+
     \frac{8(1+t)}{(1-t)\sqrt{V_0}}\sqrt R
 \le 4t^2X+24\sqrt R.
\]
In particular, the \(\sqrt{V_0}\) denominator comes from taking
the square root after comparing the unnormalized fourth-power
integrals. The extra \((1-t)^{-1}\) comes from the same volume
comparison.

For \(F_\sigma(M)=|M|^4-16\sigma\det M\) the singular-value inequality
gives \(F_\sigma\ge0\). At \(S_0=\lambda U\) with \(\det U=\sigma\),
\(\operatorname{cof}S_0=\sigma\lambda^2S_0\); the value and first
derivative vanish there and at zero. The second directional
derivative of \(|M|^4\) is bounded by \(12|M|^2|E|^2\).
For the determinant, each ordered choice of the two replaced
columns has Euclidean volume at most \(|M|^2|E|^2\), and there
are twelve choices. Thus the Taylor remainder has coefficient
\((12+16\cdot12)/2=102\) times the squared matrix norm along
the segment from \(S_0\) to \(A\). That norm is at most
\((1-t)^{-1}|A|^2\) by convexity. With \(t\le1/2\),
Cauchy–Schwarz gives
\[
 0\le\int F_\sigma(A)d\nu
 \le 204X(4t^2X+24\sqrt R)
 =816t^2X^2+4896\sqrt R\,X .
\]
The normalized Jacobian integral is \(\deg f\). Using initially
only \(\sigma\deg f\le1\), the right side therefore bounds
\(X^2-16\) from above. For \(t\le10^{-3}\) and \(\sqrt R\le t^2\)
this implies \(0.99X^2\le16+0.01X\), which excludes \(X\ge5\).
Substitution gives
\[
 \int F_\sigma(A)d\nu
 \le 20400t^2+24480\sqrt R<16 .
\]
If \(\sigma\deg f=-1\), the defect integral would be \(X^2+16\).
Thus \(\sigma=\deg f\) in this regime, and the signed defect is
\(X^2-16\). The transfer constant \(25000\) follows from the two
explicit coefficients. Both signs reverse under reversal of the
target orientation.

The replay concerns the prescribed round test, the auxiliary
\(\gamma\) frames, and round probability for the integrals.
Physical centering remains with \(dV_g/\operatorname{Vol}(g)\).
The two calculations impose no additional centering or
derivative estimate.

[replay]: ../research-progress/handoffs/REQUEST_B08_INPUT_REPLAYS_R1.md
[metric]: ../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md
[comparison]: ../research-progress/handoffs/REQUEST_B08_COMPARISONS_R1.md
[e25]: ../notes/E25_TT_DETECTOR.md
[e26]: ../notes/E26_TRANSFER_DEFICIT.md
[rigidity]: ../notes/PENCIL_RIGIDITY.md
[spectral]: ../notes/BALANCED_SPECTRAL_BOUND.md
[degree]: ../notes/E13_SPINOR_PENCIL.md
