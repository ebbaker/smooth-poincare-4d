# SP4-CME-E76 — High-order stable decay and the smooth recovery limit

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. All four frozen digests matched the
[request][req] before use. I authored E50, the transfer input used below,
and previously audited E47/E48 in E51. This packet derives higher-order
decay and the smooth recovery limit. See [B46][b46] and the [return][ret].

## Fixed basin and exact remainder

Fix the oriented round Riemannian \(S^4\), its positive perfect \(A_0\),
and the compact principal \(SO(3)\) bundle \(\mathcal P\). Use native time,
the native reference metric \(g_0\), the fixed internal negative Killing
pairing and the induced reference metric derivative \(D\). Let \(B(u)\)
be the E49 smooth stable adjusted solution, using exactly its
\(m=6\) basin for \(B(0)\). Put \(a(u)=B(u)-A_0\),
\(z(a)=(a,Da)\), and \(J=I+G_0\), where \(G_0\) is the positive
E47 Hessian with the fixed gauge terms. Write \(\eta_6\) for the
E49 initial \(H^6\) radius, \(C_6\) for its decay constant, and
\(\alpha=\lambda_1/2>0\) for its rate, with
\(\lambda_1=\inf\operatorname{spec}G_0\). Thus
\[
 \|a(u)\|_{H^6}\le C_6 e^{-\alpha u}\|a(0)\|_{H^6}.
                                                                         \tag{1}
\]
The E49 construction also puts the whole path in its fixed radius
of the \(H^6\) path space. In particular the values of \(z(a)\)
lie in its fixed regular first-jet tube, with the straight
segments to zero inside the coefficient domain. All smallness
below is in this same \(H^6\) setting. [E47 (2)–(4)][e47] · [E49 (1)–(5)][e49].

E48 writes the physical term, the fixed vertical term, and the
horizontal correction as a second-order expression of the form
\[
 V_{\rm st}(A_0+a)
  =C_2(x,z(a))D^2a+\mathcal L(x,z(a)).
\]
Here \(D^2a\) uses the ordered fixed reference derivatives and all
coefficients are smooth on the fixed tube. To see the source of
this order, \(F_B=F_0+\operatorname{Alt}Da+[a\wedge a]/2\),
and \(DF_B\) is affine in \(D^2a\) with remaining terms in \(z\).
The inverse metric, \(Q\), curvature contractions and their
algebraic derivatives are smooth value maps there. In the
physical codifferential both the derivative of its curvature
factor and the live Christoffel difference are affine in \(DF_B\).
The vertical correction has fixed second-order part and a first-jet
bracket. For the horizontal correction, differentiating \(S_0^*a\)
twice uses only fixed \(S_0^*\) derivatives and derivatives of \(a\).
The outer \(S_B\) is algebraic in \(F_B\).
Thus \(C_2\) is the full second-order coefficient after composing
with curvature, and fixed coefficient, frame and curvature
terms are included in \(\mathcal L\) as in E48.

Subtract the complete linearization \(-G_0a\) at the stationary
reference. With the exact Taylor differences
\[
 \begin{aligned}
 C^\sharp(x,z)&=C_2(x,z)-C_2(x,0),\\
 L^\sharp(x,z)&=\mathcal L(x,z)-\mathcal L(x,0)
                                         -D_z\mathcal L(x,0)[z],
 \end{aligned}
\]
the adjusted equation on the smooth solution is
\[
 a_u+G_0a=N(a),\qquad
 N(a)=C^\sharp(x,z(a))D^2a+L^\sharp(x,z(a)).                         \tag{2}
\]
The fixed \(x\) dependence belongs to all coefficient maps in this
formula. [E48 (2)–(4), (6), (8)–(10)][e48] · [E49, weighted contraction][e49].

## High- and low-order factors in the tame estimate

Work in finite smooth charts and compactly supported frames, with
nested cutoffs to allow products to be formed before restriction.
Smooth reference coefficients compare coordinate Sobolev norms to
the fixed geometric norms. A suitable tame product bound for every
integer \(s\ge3\) is
\[
 \|uv\|_{H^s}\le C_s\big(
       \|u\|_{H^s}\|v\|_{H^3}+\|u\|_{H^3}\|v\|_{H^s}\big).           \tag{3}
\]
Indeed on \(\mathbb R^4\), with \(\langle\xi\rangle=(1+|\xi|^2)^{1/2}\),
\(\langle\xi\rangle^s\le C_s(\langle\eta\rangle^s+
\langle\xi-\eta\rangle^s)\) in the Fourier product convolution.
Young's inequality bounds its weighted \(L^2\) norm by the two
\(L^2,L^1\) products, and
\(\|\widehat v\|_1\le \|\langle\xi\rangle^{-3}\|_2\|v\|_{H^3}\).
Use this on the fixed zero extensions of supported chart pieces,
and sum after the fixed smooth transition and frame factors.
Finite-dimensional tensor contractions obey the same estimate
componentwise. The bound with \(s=3\) gives the algebra estimate.

Here is the composition bound used with (3). For any of the fixed
smooth coefficient maps \(F(x,z)\), including the derivatives
needed below, chartwise with a fixed cutoff one has
\[
 \|F(x,\vartheta z)\|_{H^s}\le C_s(1+\|z\|_{H^s}),\qquad s\ge5,
       \quad 0\le\vartheta\le1,                                   \tag{4}
\]
and the \(H^3\) norms of these compositions are uniformly bounded.
The constants use the fixed \(H^5\) bound on \(z\) and the compact
jet tube. To verify the bound at \(s=5\), the chain rule gives
terms with bounded mixed \(x,z\) coefficient derivatives and
products of positive-order derivatives of \(z\) of total order
at most five. There is at most one jet derivative of order
three or higher. Put it in \(L^2\) and the others in \(L^\infty\)
using the \(H^5\) bound, since at most two derivatives are
taken in those other factors. Terms with no such higher factor
are bounded in \(L^2\) on the finite supported chart volume.
This is E48's derivative allocation at order five and supplies
the fixed \(H^3\) bound too.

For the induction, differentiate \(F(x,\vartheta z)\) once.
The chain rule gives \(F_{x_i}(x,\vartheta z)\) and
\(\vartheta F_z(x,\vartheta z)\partial_i z\).
A derivative of a cutoff is part of the first fixed \(x\) term.
Apply the induction hypothesis to the fixed smooth maps
\(F_{x_i},F_z\) at order \(s-1\), and (3) to the product at
that order. The two resulting products use
\(\|\partial_i z\|_{H^3}\le C\|z\|_{H^5}\) and
\(\|F_z(x,\vartheta z)\|_{H^3}\le C\), respectively. The high
factors are at most \(C_s(1+\|z\|_{H^{s-1}})\) and
\(C\|z\|_{H^s}\), respectively. Together with the lower-order
norm this proves (4) at \(s\).
For this induction one can extend \(z\) by multiplying by a
fixed cutoff equal to one on the coefficient cutoff support.
Its scaled values stay on the permitted radial segments, and
all coefficient factors or their derivative maps are considered
with larger cutoffs compactly supported in the same chart.
Smooth multiplication and the fixed overlap maps change just
the fixed constants. This proves the needed composition
estimate directly in the recorded E48/E49 setting, including
explicit \(x\) derivatives. [E48, tame remainder][e48] ·
[E49, composition estimate in the smooth cutoff argument][e49].

Use the mean-value representation
\[
 C^\sharp(x,z)=\int_0^1 D_z C_2(x,\vartheta z)[z]\,d\vartheta,\qquad
 L^\sharp(x,z)=\int_0^1(1-\vartheta)
                  D_z^2\mathcal L(x,\vartheta z)[z,z]\,d\vartheta .
\]
Write \(z_3=\|z\|_{H^3}\), \(z_s=\|z\|_{H^s}\).
In the first identity (3)–(4) give the high norm bound
\(C_s[z_s+(1+z_s)z_3]\le C'_s z_s\), since \(z_3\le z_s\)
and \(z_3\) has a fixed upper bound. Its \(H^3\) bound is
\(Cz_3\) by the algebra estimate and the low composition
bound. In the second identity the high-order coefficient
factor costs \(C_s(1+z_s)z_3^2\), and the terms with a
high-order \(z\) factor cost \(C_s z_3 z_s\). Again the
uniform bound on \(z_3\) and \(z_3\le z_s\) give
\[
 \|C^\sharp(x,z)\|_{H^3}\le C z_3,\quad
 \|C^\sharp(x,z)\|_{H^s}\le C_s z_s,\quad
 \|L^\sharp(x,z)\|_{H^s}\le C_s z_3 z_s.                            \tag{5}
\]
In particular the constant term of the composition bound
never appears alone in a remainder estimate.

For \(k\ge6\) set \(s=k-1\). Since
\(z_3\le C\|a\|_{H^4}\),
\(z_s\le C\|a\|_{H^k}\),
\(\|D^2a\|_{H^3}\le C\|a\|_{H^5}\), and
\(\|D^2a\|_{H^s}\le C\|a\|_{H^{k+1}}\),
the two product allocations and the lower term are bounded by
\[
 \begin{split}
 \|N(a)\|_{H^{k-1}}
 \le C_k\big(
   \|a\|_{H^k}\|a\|_{H^5}
   +\|a\|_{H^4}\|a\|_{H^{k+1}}
   +\|a\|_{H^4}\|a\|_{H^k}\big)
 \le C'_k\|a\|_{H^6}\|a\|_{H^{k+1}} .
 \end{split}                                                       \tag{6}
\]
The estimate is on the same fixed \(H^6\) tube for each order.
It keeps just one high norm. Because the energy below uses the
fixed graph scale and the full linearization is subtracted, no
additional principal commutator is introduced in that pairing.

## Eventual graph-energy absorption

Write \(\|w\|_{\mathcal H^\ell}=\|J^{\ell/2}w\|_2\).
The E47 elliptic graph equivalence identifies this with the
geometric \(H^\ell\) norm for each nonnegative integer \(\ell\).
For \(\alpha=\lambda_1/2\),
\[
 G_0-\alpha I\ \ge\ \theta J,\qquad
                  \theta=\frac{\lambda_1-\alpha}{1+\lambda_1}>0    \tag{7}
\]
in spectral order. Indeed for \(\lambda\ge\lambda_1\) the ratio
\((\lambda-\alpha)/(1+\lambda)\) is increasing.
Set \(v=e^{\alpha u}a\).
On the smooth path the graph energy at integer \(k\ge6\) satisfies
\[
 \begin{split}
 \tfrac12\frac{d}{du}\|v\|_{\mathcal H^k}^2
    +\langle (G_0-\alpha I)J^{k/2}v,J^{k/2}v\rangle
  &=\operatorname{Re}\big\langle
       J^{(k-1)/2}e^{\alpha u}N(a),J^{(k+1)/2}v
       \big\rangle\\
  &\le C_k\|a\|_{H^6}\|v\|_{\mathcal H^{k+1}}^2 .
 \end{split}                                                       \tag{8}
\]
The spectral pairing on the right splits the \(k\) powers of \(J\)
between its two factors, using the \(H^{k-1}\) bound for \(N\).
It is the same dual pairing as in E47 (5). One can obtain
the identity first with finite spectral sums and pass by
smoothness on each finite time interval. The estimate uses (6)
and places the single factor \(e^{\alpha u}\) on the high norm.

By (1) there is a finite \(U_k\) such that
\(C_k\|a(u)\|_{H^6}\le\theta/2\) for \(u\ge U_k\).
One can choose \(U_k\) using \(C_6\eta_6\) in (1), depending on
\(k\) and the fixed constants rather than the individual high norm.
On that tail (7)–(8) give
\[
  \|v(u)\|_{\mathcal H^k}^2+
       \theta\int_{U_k}^{u}\|v(s)\|_{\mathcal H^{k+1}}^2\,ds
  \le\|v(U_k)\|_{\mathcal H^k}^2,\qquad u\ge U_k.                   \tag{9}
\]
The starting energy at \(U_k\) is finite for this datum by E49's
smooth path. The weighted norm is also finite on the preceding
compact interval. Thus for every \(k\ge6\) and each supplied
smooth datum in the same \(m=6\) basin,
\[
   \|B(u)-A_0\|_{H^k}\le C_{k,B(0)}e^{-\alpha u},\qquad u\ge0 .     \tag{10}
\]
The rate is the fixed \(H^6\) rate. The constants in (10) use
the high norm of the given path on \([0,U_k]\). This argument
does not require smallness in \(H^k\) or change the E49
datum radius for higher orders. [E47, graph scale and (5)][e47] ·
[E49 (2)–(5)][e49].

## The actual generator and smooth stable recovery

The stable generator of E50, evaluated on \(B\), is
\[
 \xi_{\rm st}(B)=-\delta_0 a-\chi_B(\Delta_0 S_0^*a).
\]
The operators \(\delta_0=d_{A_0}^{*g_0}\), \(S_0^*\), and
\(\Delta_0\) are fixed. Set \(W=-\xi_{\rm st}(B)\), the field
for \(\dot j_{\rm st}=W\circ j_{\rm st}\).
In a fixed smooth trivialization \(p=s(x)h\), with
\(h\in SO(3)\), put \(\phi=\delta_0a\) and
\(Y=\Delta_0 S_0^*a\). With the right principal action,
\[
          W(x,h)=\big(Y(x),(\phi(x)-B_i(x)Y^i(x))h\big).             \tag{11}
\]
Indeed the connection form in this trivialization is
\(\operatorname{Ad}_{h^{-1}}(B_i\,dx^i)+h^{-1}dh\).
Use finitely many such charts with fixed group coordinates and
fixed compactly contained supports. The conversion of matrix
tangents to group coordinates and all its derivatives on the
supports are fixed and bounded. The field \(\phi\) has first
order fixed coefficients and \(Y\) second order fixed
coefficients. In (11), the \(A_{0i}\) part of \(B_i\) is fixed,
and the \(a_iY^i\) part is estimated by the ordinary product
rule. Thus for any fixed integer \(r\ge0\),
\[
 \|W(u)\|_{C^r(\mathcal P)}\le
 C_r\big(\|a(u)\|_{C^{r+2}}
        +\|a(u)\|_{C^{r+2}}^2\big).                                \tag{12}
\]
Equivalently these norms can use a fixed smooth metric on
the compact total space.

On the fixed base charts, \(H^k\) controls \(C^{r+2}\) for
\(k>r+4\) in dimension four, by Fourier Cauchy–Schwarz and
\(\int_{\mathbb R^4}(1+|\zeta|^2)^{-(k-r-2)}\,d\zeta<\infty\).
Apply (10) with \(k\ge\max(6,r+5)\). This gives
\[
 \|\xi_{\rm st}(B(u))\|_{C^r(\mathcal P)}
 =\|W(u)\|_{C^r(\mathcal P)}
 \le C_{r,B(0)}e^{-\alpha u},\qquad u\ge0 .                        \tag{13}
\]
In particular every one of these norms is integrable in \(u\).
The estimate is for the generator in the stable direct
inverse-recovery ODE in E50 (8). [E50 (5), (7)–(9)][e50].

The \(W\) flow is smooth for every finite elapsed time and
equivariant by uniqueness, since \(\mathcal P\) is compact
and (11) is invariant under the principal right action.
To work throughout one coordinate chart for each starting
point, choose a large but finite \(u_*\) such that the tail
integral of \(\|W\|_{C^1}\) is small. Take fixed nested chart
sets \(V_i\Subset O_i\Subset U_i\) with the \(V_i\) covering
\(\mathcal P\), using coordinate balls for the interior
sets, and choose the integral small relative to their
positive margins. This changes a late start time and does
not restrict the initial datum. Define
\(\widetilde j(u)=j_{\rm st}(u)j_{\rm st}(u_*)^{-1}\) for
\(u\ge u_*\), composition written right to left. Then
\(\widetilde j(u_*)=\mathrm{id}\) and
\(\dot{\widetilde j}=W\circ\widetilde j\).
The displacement of every point is bounded by the tail
integral of \(\|W\|_\infty\) in the fixed metric, so
trajectories from \(O_i\) lie in a compact interior subset
of \(U_i\). Inverses have the same displacement bound.
This permits use of common charts on \(V_i\) and at their
inverse points in \(O_i\).

Let \(Z(u,x)\) be such a coordinate flow and \(W_i\) its
coordinate field. The first derivative satisfies
\(\partial_u DZ=(DW_i)(u,Z)DZ\). For \(r\ge2\),
differentiating the same ODE \(r\) times in the initial
coordinate gives
\[
 \partial_u D^r Z=(DW_i)(u,Z)D^r Z+Q_r(u,x),                         \tag{14}
\]
where each term in \(Q_r\) uses \(D^\ell W_i(u,Z)\),
\(2\le\ell\le r\), contracted with \(\ell\) derivatives
of \(Z\) of positive orders summing to \(r\). Each of those
orders is at most \(r-1\). Integrability of \(\|W\|_{C^1}\)
gives a uniform bound for \(DZ\) by its linear equation.
Assuming uniform bounds through \(r-1\), the remainder in
(14) is bounded by \(C_{r,B(0)}\|W(u)\|_{C^r}\).
Gronwall and (13) then bound \(D^r Z\) uniformly.
Substitution in (14) bounds \(\partial_u D^r Z\) by
\(C_{r,B(0)}e^{-\alpha u}\). The undifferentiated ODE and
the first derivative equation give the same bound for
\(r=0,1\). Integrating from \(u\) to infinity gives
uniformly Cauchy maps and each of their derivatives, with
error at most \(C_{r,B(0)}e^{-\alpha u}/\alpha\).
The limits are derivatives of the limiting map by
integration along coordinate segments. Hence
\(\widetilde j_\infty\) is smooth and
\(\widetilde j(u)\to\widetilde j_\infty\) exponentially in
each fixed \(C^r\) norm. A finite chart cover suffices for
all steps.

At finite time the first derivative determinant in a common
chart evolves by multiplication by
\(\exp(\int_{u_*}^u\operatorname{tr}DW_i(s,Z(s))\,ds)\);
it is positive and bounded below away from zero.
Uniform derivative bounds, or closeness of \(DZ\) to
identity for this late start, give uniform bounds for
the inverse derivatives of order one. The finite maps
are global diffeomorphisms with inverse, so this gives
a uniform lower distance bound on the direct maps by
applying the derivative estimate to inverse images of
curves. The compact total space is connected. The limit
is injective by the lower distance bound and surjective
by compactness, taking a subsequential limit of the
finite inverse image of each fixed target. Its positive
Jacobian and the inverse function theorem give a smooth
inverse \(\widetilde g_\infty\).
Equivariance passes to the limit, as does orientation
preservation on the base. For the base assertion, use
smooth local sections and bundle projection for the
induced maps and their inverses. The base derivatives
converge by these local expressions, are invertible at
the limit, and have positive determinant at finite time.

For precision about inverse convergence, write
\(\widetilde g(u)=\widetilde j(u)^{-1}\).
The uniform lower distance bound and direct \(C^0\)
error first give
\(\|\widetilde g(u)-\widetilde g_\infty\|_{C^0}
\le C_{B(0)}e^{-\alpha u}\).
In common charts
\[
       D\widetilde g(u)
           =[D\widetilde j(u)(\widetilde g(u))]^{-1}.
\]
For higher derivatives differentiate
\(\widetilde j(u)\circ\widetilde g(u)=\mathrm{id}\).
At order \(r\ge2\) the term with \(D^r\widetilde g(u)\)
has coefficient \(D\widetilde j(u)(\widetilde g(u))\);
all remaining terms use direct derivatives through
order \(r\) evaluated at \(\widetilde g(u)\) and inverse
derivatives of orders at most \(r-1\).
Each order-\(\ell\) direct derivative at that moving
point differs from its limit at \(\widetilde g_\infty\)
by its direct \(C^\ell\) error plus
\(C_{\ell,B(0)}\|\widetilde g(u)-\widetilde g_\infty\|_{C^0}\).
The second term follows from the already proved smooth
limit and its bounded derivative of order \(\ell+1\)
on the fixed compact interior chart sets. The margins
ensure both evaluation points lie there. The matrix
inverse is Lipschitz on the uniformly bounded matrices
with uniformly bounded inverses, by the difference of
inverses identity. The displayed first derivative
formula and the higher derivative identities therefore
give, by induction, \(C^r\) inverse error at most
\(C_{r,B(0)}e^{-\alpha u}\) for every fixed \(r\).
The extra direct derivative is used here for the inverse
rate.

Since
\(j_{\rm st}(u)=\widetilde j(u)j_{\rm st}(u_*)\) and
\(g_{\rm st}(u)=j_{\rm st}(u_*)^{-1}\widetilde g(u)\),
the fixed smooth factors preserve these per-order rates,
with constants allowed to depend on the datum and the
finite segment. Thus \(j_{\rm st,\infty}\) is a smooth
equivariant automorphism and
\(g_{\rm st,\infty}=j_{\rm st,\infty}^{-1}\) is smooth.

## The original solution and its limiting pair

Take the smooth compatible small-value initial data of E50,
using its threshold for \(m=6\). At the fixed positive time
\(\tau\) the local adjusted solution supplies
\(B(0)=\widehat A(\tau)\) in the E49 \(H^6\) basin.
The local recovery is smooth on its finite interval through
the splice for each such datum. Its end value is the fixed
smooth \(c=g_{\rm loc}(\tau)\). The smoothly spliced original
solution of E50 then has tail automorphism
\(g(t)=c\,g_{\rm st}(t-\tau)\) and inverse
\(j(t)=j_{\rm st}(t-\tau)c^{-1}\), with no change to the
basin. E50's original-flow right-overlap uniqueness gives
the time-smooth splice there. This recovery uses the left
action \(g\cdot A=(g^{-1})^*A\). [E50 (3), (8)–(10)][e50].

With \(F_0=F_{A_0}\), the exact limits are
\[
 \begin{gathered}
      j_\infty=j_{\rm st,\infty}c^{-1},
             \qquad g_\infty=c\,g_{\rm st,\infty},\\
 (A_\infty,F_{A_\infty})
       =j_\infty^*(A_0,F_0)=g_\infty\cdot(A_0,F_0).                 \tag{15}
 \end{gathered}
\]
Indeed for \(u=t-\tau\) the compatible pair on the original
tail is \(j(t)^*(B(u),F_{B(u)})\).
From (10) and the fixed Sobolev embedding,
\(B(u)-A_0=O(e^{-\alpha u})\) in each fixed \(C^{r+1}\)
norm. The curvature identity at the beginning then gives
\(F_{B(u)}-F_0=O(e^{-\alpha u})\) in \(C^r\), since its
quadratic part has bounded factors as well as a decaying
factor. Pullback of these errors uses bounded derivatives
through order \(r+1\) of \(j(t)\) in fixed charts.
For pullback of the fixed smooth round pair, the order-\(r\)
chain and product rules give a bound by the \(C^{r+1}\) map
error, using a fixed additional derivative of the smooth
round coefficients to compare evaluations. Hence for each
fixed \(r\ge0\)
\[
 \|A(t)-A_\infty\|_{C^r}
   +\|F_{A(t)}-F_{A_\infty}\|_{C^r}
          \le C_{r,A_{\rm in}}e^{-\alpha(t-\tau)},\qquad t\ge\tau,  \tag{16}
\]
in the fixed bundle charts or equivalent fixed geometric
norms. Constants may be enlarged on an initial compact
interval of the tail. The limiting connection is smooth,
and curvature commutes with this smooth pullback.
Equations (15)–(16) give smooth convergence of the original
pair for each supplied smooth datum.

The fixed coefficients, charts, \(H^6\) tube and stability
constants determine the small basin and the common rate
\(\alpha\). Each higher constant may depend on its order,
the given path on finite intervals, and in the recovered
path on the fixed finite local recovery of that datum.
No uniform estimate for all orders from its initial value
norm is used. No new primary source was inspected or used.

[req]: ../research-progress/handoffs/SP4-CME-E76_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E76_RETURN_v1.md
[b46]: ../brainstorm/notes/B46_HIGH_ORDER_STABLE_TAIL_20261122.md
[e47]: 47_ROUND_STABLE_LINEAR_20261122.md
[e48]: 48_FIXED_STABILITY_GAUGE_20261122.md
[e49]: 49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
