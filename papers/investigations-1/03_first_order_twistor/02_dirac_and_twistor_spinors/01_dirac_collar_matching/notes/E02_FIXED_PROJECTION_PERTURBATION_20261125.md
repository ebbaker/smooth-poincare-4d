# Fixed-projection Dirac perturbation — SP4-FOT-MATCH-E02

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The exact serving model and reasoning effort are
unavailable. This is a conditional analytic estimate on a supplied smooth
collar, under [request revision 1](../research-progress/handoffs/E02_REQUEST_20261125.md).

## Comparison in the round reference gauge

Use the oriented Riemannian spin product \(Z_L=[0,L]\times S^3\),
\(L\ge2\), with \(h_0=dt^2+\gamma_{S^3(1)}\).
Let \(h\) be a smooth metric on the same product, \(k=h-h_0\), and
\[
 \varepsilon=\|k\|_{L^\infty(Z_L;h_0)}
       +\sup_{\substack{J\subset[0,L]\\1\le |J|\le2}}
          \|\nabla^0 k\|_{L^4(J\times S^3;h_0)} .
 \tag{1}
\]
Here \(\nabla^0\) is the reference covariant derivative. Use the reference
volume, connections, Hilbert and trace norms of E01. In particular
\(\mathcal T\) is \(H^{1/2}(S^3)\) with norm
\(\||A|^{1/2}\cdot\|_{L^2(S^3)}\) for the round \(A\).
Keep the incoming projections \(P_+\) at \(0\) and \(P_-\) at \(L\)
of this same \(A\), and the homogeneous incoming domain
\(\mathcal D=\{u\in H^1:P_+u(0)=P_-u(L)=0\}\).
[E01, conventions and inverse](E01_ROUND_INVERSE_20261125.md)

Write \(h(X,Y)=h_0(HX,Y)\), \(b=H^{-1/2}\), and let
\(\beta:S_{h_0}\to S_h\) be the spin identification from the symmetric
frame isometry \(b\). Write
\[
 L_h=c_0(\partial_t)^{-1}(\beta^-)^{-1}D_h^+\beta^+,\qquad L_0=\partial_t+A.
\]
The pairings in the following estimate use the fixed measure \(dV_{h_0}\).
In particular this pointwise frame isometry is used without a volume
density factor. It preserves chirality.
For \(\|k\|_\infty\le\tfrac12\), \(H\) takes its values in a compact
spectral interval about the identity. The matrix inverse square root
and its derivative are bounded uniformly there, so \(|b-I|\le C|k|\)
and \(|\nabla^0 b|\le C|\nabla^0 k|\). The transported Dirac principal
part is \(\sum_i c_0(e_i)\nabla^0_{b e_i}\) in a reference orthonormal
frame. The zeroth-order correction comes from the spin lift of
\[
 b^{-1}\nabla^h_X(b\,\cdot)-\nabla^0_X
  = b^{-1}(\nabla^0_X b)+b^{-1}(\nabla^h-\nabla^0)_Xb.
\]
The Koszul formula for the connection difference bounds the last
term by \(C|\nabla^0 k|\), since \(h^{-1}\) is uniformly bounded.
These formulas give the operator difference in the form
\[
 L_h-L_0=E\cdot\nabla^0+F,\qquad
 |E|\le C|k|,\quad |\nabla^0 E|\le C|\nabla^0 k|,\quad
 |F|\le C(|k|+|\nabla^0 k|).
 \tag{2}
\]
The derivative of the principal coefficient tensor uses the parallel
reference Clifford multiplication and reference normal. All frame
estimates are tensorial in this gauge. This is the finite metric
comparison of Bourguignon–Gauduchon, Theorem 3.1 and Remark 3.2.
[Primary comparison](https://www.igt.uni-stuttgart.de/dokumente/schwahn/SpineursVariations_EN.pdf)
· [DIR §3.3](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L489)

Let \(S\) be an \(H^1\to L^4\) Sobolev constant valid on the reference
product slabs of lengths in \([1,2]\). It is uniform by linear
rescaling in \(t\) to the fixed unit product slab. Partition \([0,L]\)
into \(\lfloor L\rfloor\) equal subintervals \(J_i\), whose lengths
satisfy the stipulated bound and whose interiors are disjoint. For a
spinor \(u\) put \(Z_i=J_i\times S^3\). Hölder and the Sobolev inequality give
\[
 \||\nabla^0 k|\,|u|\|_{L^2(Z_L)}^2
   \le \sum_i \|\nabla^0 k\|_{L^4(Z_i)}^2\|u\|_{L^4(Z_i)}^2
   \le S^2\Big(\sup_J\|\nabla^0 k\|_{L^4(J\times S^3)}\Big)^2
            \|u\|_{H^1(Z_L)}^2 .
\]
Thus \(\|L_h-L_0\|_{H^1\to L^2}\le C_*(\mathrm{ref})\varepsilon\),
where \(C_*\) may be chosen as \(C_0(1+S)\) for a sufficiently large
coefficient constant \(C_0\) depending only on the reference product and
the neighborhood \(\|k\|_\infty\le\tfrac12\). We fix it below to
include the same comparison for the adjoint. This accounts for the
critical \(L^4\) coefficient without a factor in \(L\).

## Inverse and traces

Let \(\delta=C_*\varepsilon\) and take
\(\varepsilon\le\min(\tfrac12,(2C_*)^{-1})\), with \(C_*\) as above.
On \(\mathcal D\), the E01 inverse has \(L^2\to H^1\) norm at most one.
Thus \(L_h=[I+(L_h-L_0)L_0^{-1}]L_0\) on \(\mathcal D\); Neumann
inversion proves bijectivity, with inverse norm at most \((1-\delta)^{-1}\)
and in particular at most \(2\). The same argument for the full map
\(u\mapsto (L_hu,P_+u(0),P_-u(L))\) uses the norm-one E01 inverse on the
product target \(L^2\oplus P_+\mathcal T\oplus P_-\mathcal T\).
For the resulting solution with data \((f,g_+,g_-)\) set
\[
 G^2=\|g_+\|_{\mathcal T}^2+\|g_-\|_{\mathcal T}^2,\qquad
 X^2=\|u\|_{H^1}^2+\|P_-u(0)\|_{\mathcal T}^2+\|P_+u(L)\|_{\mathcal T}^2 .
\]
E01 applied to reference forcing \(f-(L_h-L_0)u\) gives
\(X\le(\|f\|_2^2+G^2)^{1/2}+\delta X\). Consequently
\[
 X\le (1-\delta)^{-1}(\|f\|_2^2+G^2)^{1/2}.
 \tag{3}
\]
The fixed unit-strip lift \(R\) of E01 continues to prescribe exactly
the reference endpoint projections. It satisfies
\(\|Rg\|_{H^1}\le\sqrt{17}G/3\) and
\(\|L_h Rg\|_2\le(\sqrt2+\delta\sqrt{17})G/3\).
Together with the homogeneous inverse this also constructs the
inhomogeneous solution. All spaces and constants in (3) are in the
reference gauge.
[E01, unit-strip lifting](E01_ROUND_INVERSE_20261125.md#lift-in-the-unit-end-strips)

## Adjoint for the fixed domain

Let \(B\) be the coefficient of \(\partial_t\) in \(L_h\), so
\(L_h=B\partial_t+A+T\) with \(T\) a tangential operator of order
at most one. Equation (2) bounds \(B-I\), \(\nabla^0B\), and the
coefficients of \(T\) and their principal coefficient derivatives.
Enlarge \(C_0\) to ensure invertibility of \(B\) when \(\delta\le\tfrac12\).
Then \(M=(B^*)^{-1}\) satisfies \(|M-I|\le C|k|\) and
\(|\nabla^0 M|\le C|\nabla^0 k|\). The composition of the formal
reference-measure adjoint with \(M\) is
\[
 L_h^{\mathrm{form}*} M w
       =-\partial_tw + A(Mw)+T^{\mathrm{form}*}(Mw).
\]
Indeed the adjoint of \(B\partial_t\) acts by \(-\partial_t(B^*\cdot)\).
The difference from \(-\partial_t+A\) has principal coefficients
bounded by \(C|k|\) and order-zero coefficient bounded by
\(C(|k|+|\nabla^0k|)\). In addition to (2), this uses the divergence
of the tangential principal coefficient of \(T\) and the first
derivative of \(M\). The same slab proof with an enlarged \(C_0\)
therefore bounds this comparison by \(\delta\) in \(H^1\to L^2\).
Consequently \(L_h^{\mathrm{form}*}M\) is bijective on the fixed
reference complementary domain by E01.
The multiplication bound and the same slab estimate give
\(\|M-I\|_{H^1\to H^1}\le C_*\varepsilon\) after increasing \(C_0\).

For \(u,v\in H^1\), Green's formula has boundary pairing
\((u,B^*v)_Y\) at \(L\) minus that at \(0\). Hence
\[
 \mathcal D_h^*=\{v\in H^1:
 P_-(B^*v)(0)=0,\quad P_+(B^*v)(L)=0\}
 \tag{4}
\]
is contained in the Hilbert adjoint domain. The realization of
\(L_h^{\mathrm{form}*}\) on (4) is already bijective by the
comparison for \(w=B^*v\). For an arbitrary vector in the Hilbert
adjoint domain, choose a vector in (4) with the same adjoint value.
Their difference annihilates the range of \(L_h\) on \(\mathcal D\);
this range is all of \(L^2\). This proves equality of the two domains.
The adjoint's \(L^2\to H^1\) inverse bound is at most
\((1+\delta)/(1-\delta)\), in particular \(3\), from the multiplication
and inverse bounds. In general the reference test projections act on
the conormal pairing \(B^*v\) in (4).

## Scope and inputs

To use this estimate after extracting a physical collar with metric
\(g=\Omega^2 h\), one must measure (1) for the normalized \(h\) in the
specified product chart. The Dirac kernel transforms by
\(\psi_g=\Omega^{-3/2}\beta_{h,g}\psi_h\), including at the endpoint
traces, and an inhomogeneous Dirac source transforms by
\(\Omega^{-5/2}\). Thus (3) directly controls the reference-gauge
traces, and an estimate for physical traces requires the corresponding
weights. The fixed spectral conditions in this note are a collar
problem. The boundary spaces of the actual adjoining pieces still
require a matching argument.

For the supplied buffered strip in EXTRACT-E01, \(h=\rho^{-2}\Phi^*g\)
with \(\rho=\rho_0e^t\). Its estimate gives
\(\varepsilon\le C_{\mathrm{ext}}(a+\sqrt{a(K+a)})\), with \(a,K\) the
Euclidean-coordinate metric bounds defined there and \(C_{\mathrm{ext}}\)
independent of radii and length. Thus a sufficient extraction condition is
\(C_{\mathrm{ext}}(a+\sqrt{a(K+a)})\le\min(\tfrac12,(2C_*)^{-1})\).
The physical-to-cylinder spinor and source weights are respectively
\(\rho^{3/2}\) and \(\rho^{5/2}\), and both endpoint trace weights use
the radii at their own endpoints. These use the same reference spin
identification and measure as the operator in this note.
[DIR §3.1](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L339)
· [EXTRACT-E01, reference gauge and weights](../../../01_sections_and_connections/02_dirac_collar_extraction/notes/E01_BUFFERED_SPIN_STRIP_20261125.md)

- [E01 proof](E01_ROUND_INVERSE_20261125.md), completed on the unit round
  cylinder, and [branch model at cec037f](../brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md).
- [DIR §§3.1 and 3.3](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex),
  source revision `0a0abde6f5481fc564d8ca159769cb092e1996d2`,
  SHA-256 `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`.
- [Bourguignon–Gauduchon](https://www.igt.uni-stuttgart.de/dokumente/schwahn/SpineursVariations_EN.pdf),
  Theorem 3.1 and Remark 3.2, inspected in Paul Schwahn's
  author-proofread translation dated 14 September 2023. This compares
  two smooth positive metrics on the same fixed spin manifold.
  [Published record](https://doi.org/10.1007/BF02099184).
