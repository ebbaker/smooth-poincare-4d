# E48 — Fixed stability gauge near the round chiral connection

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and actual lead settings are unavailable.
The [request][req] freezes the input versions and [B35][b35] selects
the fixed gauge.

## Equation and exact spatial order

Let \(M\) be the smooth closed oriented round Riemannian \(S^4\)
with its perfect chiral connection \(A_0\) on the oriented
Euclidean rank-three bundle. Write \(g_0=g_{A_0}\) for the native
curvature-volume metric of the reference, so its round scale is fixed.
Use Fine's native time, the positive internal pairing given by the
negative Killing form, and the ordinary induced form norms.
For \(a=A-A_0\), define \(d_0=d_{A_0}\), \(\delta_0=d_0^*\),
\(S_A(Y)=\iota_YF_A\), \(S_0=S_{A_0}\), and
\(\Delta_0=\nabla_0^*\nabla_0\) on vector fields for \(g_0\).
The two adjoints \(\delta_0,S_0^*\) and the Laplacian \(\Delta_0\)
are fixed at \(A_0,g_0\). The equation being checked is
\[
 V_{\rm st}(A)=v(A)-d_A\delta_0a-S_A\Delta_0 S_0^*a,\qquad
 v(A)=-d_A^{*g_A}\bigl(B(F_A)F_A\bigr),\qquad
 B(F)=4Q(F)-\tfrac23\operatorname{tr}(Q(F)^2)I .                    \tag{1}
\]
Use the round-compatible definite component of the reconstruction.
[Fine v2, Definition 1.4, Lemma 4.1 and Proposition 4.2][fine].

Let \(D\) be the fixed derivative formed from \(g_0,A_0\) on
the required tensor bundles. In fixed coordinates and internal
frames, \(g=g_A\), \(g^{-1}\), \(Q\), and form multipliers are
smooth functions of \(x,F_A\). For a smooth pointwise map
\(H(x,F)\) its spatial differentiated expression is
\[
 D_i H(x,F)=(D^x_i H)(x,F)+(D_F H)(x,F)[D_i F].
\]
Here \(D^x\) includes only fixed background coefficients. In components
the exact curvature identities are
\[
 \begin{aligned}
 F_{ij}&=(F_0)_{ij}+D_i a_j-D_j a_i+[a_i,a_j],\\
 D_\ell F_{ij}
   &=D_\ell(F_0)_{ij}+D_\ell D_i a_j-D_\ell D_j a_i
                  +[D_\ell a_i,a_j]+[a_i,D_\ell a_j].
 \end{aligned}                                                     \tag{2}
\]
Thus the map from the ordered second jet of \(a\) to the top terms
of \(DF\) is fixed. Commuting its derivatives introduces only fixed
curvature contractions, since \([D_\ell,D_i]\) acts by the
reference base curvature on tensor slots and by
\(\operatorname{ad}(F_{0,\ell i})\) on the internal slot.

For the physical term, \(F_A\) is self-dual in \(g_A\) and
\(d_AF_A=0\), so \(d_A^{*g_A}F_A=0\). We may use
\(\Omega=(B(F)-2I)F\) in place of \(B(F)F\) in (1).
Let \(C^k{}_{ij}=\Gamma^k{}_{ij}(g)-\Gamma^k{}_{ij}(g_0)\).
The exact codifferential expression is
\[
 v_j=g^{ik}\bigl(D_i\Omega_{kj}+[a_i,\Omega_{kj}]
                      -C^\ell{}_{ik}\Omega_{\ell j}
                      -C^\ell{}_{ij}\Omega_{k\ell}\bigr),\qquad
 C^\ell{}_{ij}
   =\tfrac12g^{\ell k}(D_i g_{jk}+D_j g_{ik}-D_k g_{ij}).           \tag{3}
\]
Both \(D\Omega\) and \(C\) are affine in \(DF\) with smooth value
coefficients. The undifferentiated factors \(\Omega,g^{ik}\)
are smooth in \(F\), and the connection term uses the value \(a\).
Equations (2)–(3) leave only smooth coefficients of \(x,A,F_A\)
multiplying the second derivatives of \(a\). All remaining terms
are smooth in \(x,a,Da\).

For the vertical term the exact decomposition is
\[
 -d_A\delta_0 a=-d_0\delta_0a-[a,\delta_0a],\qquad
 \delta_0a=-g_0^{ij}D_i a_j .
\]
The second-order coefficient is fixed. The bracket is of lower
order and the reference connection contributes only fixed
commutators when exchanging derivative order.

For the horizontal term the product rule for the fixed rough
Laplacian gives
\[
 \Delta_0(S_0^*a)
 =-g_0^{ij}\bigl(S_0^*D_iD_j a
          +(D_iS_0^*)D_j a+(D_jS_0^*)D_i a
          +(D_iD_jS_0^*)a\bigr).
\]
The derivative acts on the fixed tensor \(S_0^*\) and on \(a\).
The outer contraction \(S_A\) is algebraic in \(F_A\).
The horizontal principal coefficient consequently depends only
on \(x,F_A\). In the resulting bundle expression
\[
 V_{\rm st}(A_0+a)
    =\mathcal C^{ij}(x,a,F_A)D_iD_j a+\mathcal L(x,a,Da),          \tag{4}
\]
any dependence on the symmetric part of \(Da\) is confined to
the lower term. Smooth fixed chart and frame changes contribute
only fixed coefficients and lower-order terms. Keeping every term
in the ordered covariant convention in (4) accounts for these
terms and the reference curvature commutators.
[E36, coefficient inventory][e36] · [E29, fixed-bundle conventions][e29].

## Infinitesimal automorphism generator

For the E28 left action \(h(A)=(h^{-1})^*A\), let \(\chi_A\)
be the \(A\)-horizontal lift to the principal frame bundle.
For an internal section \(\phi\) and a vector field \(Y\)
the infinitesimal action is
\[
 R(\phi+\chi_A(Y),A)=-d_A\phi-S_A(Y).
\]
Thus the two correction terms in (1) are exactly
\(R(\delta_0 a+\chi_A(\Delta_0 S_0^*a),A)\).
Equivalently, with Fine's convention \(V_{\rm st}=v-R(\xi_{\rm st},A)\),
\[
 \xi_{\rm st}(A)=-\delta_0 a-\chi_A(\Delta_0 S_0^*a).               \tag{5}
\]
The base component \(\Delta_0 S_0^*a\) is second order and the
horizontal lift introduces no derivative. In a local trivialization
the generator of the correction itself has group component
\((\delta_0 a-A(\Delta_0 S_0^*a))r\) at the frame \((x,r)\).
[Fine v2, Lemma 3.2, (3.4), (4.2) and Lemma 4.4][fine] · [E28][e28].

## Full linearization and normalization

For a varying connection direction \(b\) let
\(\eta=d_0b\). In a native orthonormal internal frame define
\[
 (L_0\eta)_{ij}
     =\tfrac12\bigl(\langle\eta_i,F_{0,j}\rangle+
                   \langle\eta_j,F_{0,i}\rangle\bigr),\qquad
 L_0^*M=M F_0 .
\]
The pairings are those of \(g_0\) and the fixed internal metric.
Since \(Q_0=I\), the \(F_{0,i}\) are an orthonormal self-dual
frame and the normalized wedge Gram derivative in the direction
\(b\) is
\[
 \dot Q=2\Pi_0L_0(d_0b),\qquad
 \Pi_0 M=M-\tfrac13\operatorname{tr}(M)I .
\]
Indeed the numerator derivative is \(2L_0\eta\) times the
reference volume, and the relative volume derivative is
\(\tfrac23\operatorname{tr}(L_0\eta)\).
At the reference \(B_0=2I\). Since \(\dot Q\) is trace-free,
\(\dot B=4\dot Q=8\Pi_0L_0(d_0b)\). In the expression (3) for the
physical operator, \(\Omega_0=0\) identically. Thus differentiating
\(v=-d_A^{*g_A}\Omega\) gives the **full** derivative
\[
 Dv(A_0)b=-d_0^*\bigl(\dot B F_0\bigr)
         =-8d_0^*L_0^*\Pi_0L_0d_0b .
\]
The factor in Fine (4.5) is \(P_0=\Theta_0^{1/2}\Pi_0L_0
=\sqrt{8}\,\Pi_0L_0\), because \(\Theta_0\) is multiplication by
\(8\) on trace-free symmetric endomorphisms. The kernel argument
on pp. 38–39 uses \(\Theta^{-1/2}\) in recalling (4.5).
The coefficient of the Hessian here is fixed by (4.5), (4.7)
and the direct derivative. The outer variations \(D_A d_A\) and
\(D_A S_A\) in the gauge terms multiply zero at \(a=0\).
It follows that \(V_{\rm st}(A_0)=0\) and
\[
 D V_{\rm st}(A_0)b=-G_0b,\qquad
 G_0=d_0^*P_0^*P_0d_0+S_0\Delta_0 S_0^*+d_0d_0^*.                 \tag{6}
\]
There is no rescaling of time or metric in (6).
[Fine v2, (3.1)–(3.3), Lemma 4.1, (4.5), (4.7), and
Proposition 4.12][fine].

For completeness the reference quadratic Fourier symbol of \(G_0\)
at \(\xi\ne0\), tested on \(b\), is
\[
 |P_0(\xi\wedge b)|^2+|\xi|_{g_0}^2|S_0^*b|^2
                       +|\iota_{\xi^\sharp}b|^2 .
\]
The first term's null space is the sum of the images of \(S_0\)
and \(\phi\mapsto\xi\otimes\phi\). To see this, the self-dual
projection of wedge by \(\xi\) on \(\xi^\perp\) has rank three.
Thus \(P_0(\xi\wedge\cdot)\) surjects onto the five-dimensional
trace-free symmetric space. It kills \(\xi\otimes\phi\), and
Lemma 4.6 gives
\(2L_0(\xi\wedge S_0Y)=\xi(Y)I\) with the displayed one-half
normalization of \(L_0\). The trace-free projection used here
vanishes independently of the factor in the printed Corollary 4.7.
The two image spaces intersect trivially.
For \(Y\ne0\), contraction with \(Y\) gives an isomorphism from
\(\Lambda^+\) to the covectors annihilating \(Y\), whereas
all components of \(\xi\otimes\phi\) lie in one covector line.
The dimension of the sum is therefore seven, the dimension of
the null space. If all three terms vanish, \(b\) is also orthogonal
to both images and hence is zero. Compactness gives a uniform
strict margin on unit covectors, which persists on a small
\((A,F_A)\) value neighborhood by (4). This is a principal
symbol check. [Fine v2, Lemma 4.6 and Lemma 4.9][fine].

## Literal live terms in Fine (4.9)

The printed (4.9) uses \(d_A^{*g_A}\) in the vertical term and
\(\Delta_{g_A} S_A^*\) in the horizontal term. The following
calculation checks the literal cubic derivative order when the
latter Laplacian is the rough Laplacian, as in the gradient-square
test in Proposition 4.12. Use the real symbol convention
\(\partial_i\mapsto\xi_i\). Let \(h=h_\xi(b)=D_Fg[\xi\wedge b]\),
\(X=S_A^*a\) with the live adjoint, and
\(X_\xi(b)=(D_F S_A^*)[\xi\wedge b]a\), including the metric
dependence of that adjoint. Set
\[
 \gamma^k{}_{ij}
   =\tfrac12 g^{k\ell}
     (\xi_i h_{j\ell}+\xi_j h_{i\ell}-\xi_\ell h_{ij}).
\]
The top variation of the live connection coefficients is \(\gamma\).
In the live one-form codifferential, it produces the second-order
variation \(g^{ij}\gamma^k{}_{ij}a_k\), followed by another
derivative in \(-d_A d_A^{*g}a\). In the live rough Laplacian,
\(-g^{ij}\partial_i\partial_j X^k\) differentiates the variation
of \(X\) twice. The term \(-g^{ij}\partial_i\Gamma^k{}_{j\ell}X^\ell\)
differentiates the variation of its Christoffel coefficient once.
Other Laplacian terms vary at most to order two. The total cubic
symbol of the literal (4.9) is consequently
\[
 -\xi\otimes\bigl(g^{ij}\gamma^k{}_{ij}a_k\bigr)
   +S_A\bigl(|\xi|_g^2 X_\xi(b)
                   +g^{ij}\xi_i\gamma^k{}_{j\ell}X^\ell\partial_k\bigr).
                                                                    \tag{7}
\]
The physical \(v\) has order two by (2)–(3).
For \(b=S_A(Y)\), naturality of the curvature metric under
active pullback and Cartan's formula for a horizontal lift give
\(h=\xi\otimes Y^\flat+Y^\flat\otimes\xi\). This follows by
taking \(Y\) multiplied by a scalar vanishing at the point with
differential \(\xi\). Hence
\(g^{ij}\gamma^k{}_{ij}=|\xi|_g^2 Y^k\). The first term in (7)
is \(-|\xi|_g^2\xi\otimes a(Y)\). It cannot cancel the second
when \(a(Y)\ne0\). The second lies in \(\operatorname{im}S_A\),
which intersects \(\xi\otimes\mathfrak{so}(E)\) trivially by the
same contraction argument for any definite curvature basis.
Choose a smooth supported perturbation of \(A_0\) with nonzero
\(a(Y)\) at one point, small in \(C^1\) to preserve definiteness.
This realizes a nonzero cubic coefficient at such a connection.
The cubic expression vanishes at \(a=0\). Formula (7) concerns
the literal derivative order of the written live expression.
[Fine v2, (4.9) and Proposition 4.12][fine] · [E27, live vertical calculation][e27].

## Tame remainder in geometric Sobolev norms

Let \(m\geq6\) be an integer, \(s=m-1\), and let all Sobolev
norms use \(g_0,D\) and the fixed internal pairing. We estimate
\(a,b\in H^{m+1}\) with small \(H^m\) norms. The spatial jet
section \(j(a)=(a,Da)\) satisfies
\(\|j(a)\|_{H^s}\leq c\|a\|_{H^m}\).
The embedding \(H^s\hookrightarrow C^0\) guarantees that a
small ball has curvature in one fixed definite neighborhood.
Compose \(\mathcal C\) in (4) with the curvature expression
(2) and write the resulting coefficient as \(C_2(x,j)\).
Let \(C^\sharp(x,j)=C_2(x,j)-C_2(x,0)\). Taylor subtraction
of the lower term defines
\[
 L^\sharp(x,j)=\mathcal L(x,j)-\mathcal L(x,0)
                                -D_j\mathcal L(x,0)[j].
\]
Equation (6) identifies the complete linear contribution,
including that of all fixed derivatives and commutators.
In particular the exact nonlinear remainder is
\[
 N(a)=C^\sharp(x,j(a))D^2a+L^\sharp(x,j(a)),\qquad
                    a_t=-G_0a+N(a).                              \tag{8}
\]

In a fixed finite atlas, differentiate a smooth coefficient
\(f(x,j)\) up to order \(s\). The chain rule gives bounded
coefficient derivatives times products of positive-order
derivatives of \(j\) of total order at most \(s\).
There is at most one factor of order at least \(s-2\), since
\(2(s-2)>s\). Place that factor in \(L^2\), and all factors
of order at most \(s-3\) in \(L^\infty\) by the \(H^3\)
embedding in dimension four. A term with no large factor
is also controlled on the finite coordinate volumes.
The same allocation in the Leibniz rule gives the \(H^s\)
algebra estimate.
This gives uniform \(H^s\) bounds on a small \(H^s\)
jet ball for all fixed coefficient maps used in the next
mean-value identities. Smooth approximation extends the
bounds to Sobolev sections. Smooth partition and transition
multipliers preserve the bounds.

Applying the mean-value formula to \(C_2\) and the Taylor
formula to \(\mathcal L\), followed by the algebra estimate, gives
\[
 \begin{aligned}
 \|C^\sharp(j(a))\|_s &\le C\|a\|_m,\\
 \|C^\sharp(j(a))-C^\sharp(j(b))\|_s
        &\le C\|a-b\|_m,\\
 \|L^\sharp(j(a))\|_s &\le C\|a\|_m^2,\\
 \|L^\sharp(j(a))-L^\sharp(j(b))\|_s
        &\le C(\|a\|_m+\|b\|_m)\|a-b\|_m .
 \end{aligned}                                                     \tag{9}
\]
For the last line, \(D_j L^\sharp(z)\) equals the integral of
\(D_j^2\mathcal L(\theta z)[z,\cdot]\) along the segment to zero.
It has \(H^s\) norm bounded by \(C\|z\|_{H^s}\).
Every segment used in these formulas lies in the small smooth
jet region. In the principal product,
\(\|D^2a\|_s\le C\|a\|_{m+1}\). In its difference write
\(C^\sharp(j(a))D^2(a-b)+(C^\sharp(j(a))-C^\sharp(j(b)))D^2b\).
Use (9) and absorb each lower norm into its next higher norm.
Then
\[
 \begin{aligned}
 \|N(a)\|_{H^{m-1}}
   &\le C\|a\|_{H^m}\|a\|_{H^{m+1}},\\
 \|N(a)-N(b)\|_{H^{m-1}}
   &\le C\bigl[
      (\|a\|_{H^m}+\|b\|_{H^m})\|a-b\|_{H^{m+1}}\\
   &\hspace{65pt}
      +(\|a\|_{H^{m+1}}+\|b\|_{H^{m+1}})\|a-b\|_{H^m}\bigr].
 \end{aligned}                                                     \tag{10}
\]
In particular \(N(0)=DN(0)=0\) as a map from \(H^{m+1}\)
to \(H^{m-1}\). Constants may depend on \(m\), the fixed scale
and smooth reference tensors, and the derivatives of the
coefficients on the chosen jet ball. The estimates concern
(1) on the round reference. Long-time nonlinear evolution
and transfer to the unadjusted flow require further arguments.

## Primary source record

The repository copy of Joel Fine, *A gauge theoretic approach
to the anti-self-dual Einstein equations*, arXiv:1111.5005v2,
29 November 2011, was rendered directly for this check on
22 November 2026, America/New_York. The copy is 447930 bytes
with the verified digest in the [return][ret].
The relevant printed passages are p. 4 Definition 1.4, pp. 17–18
(3.1), Lemma 3.1 and (3.2)–(3.3), p. 19 Lemma 3.2 and (3.4),
pp. 29–31 Lemma 4.1, Proposition 4.2 and (4.1)–(4.4),
pp. 32–35 (4.5), Proposition 4.5, (4.7), Lemma 4.6, Corollary 4.7 and
Lemma 4.9, and pp. 38–39 (4.9) and Proposition 4.12.
The formulas above use only the displayed local definitions
and identities, together with the separate calculations in
this note. [Frozen local primary PDF][fine].

[req]: ../research-progress/handoffs/SP4-CME-E48_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E48_RETURN_v1.md
[b35]: ../brainstorm/notes/B35_FIXED_STABILITY_GAUGE_20261122.md
[fine]: ../../../../references/1111.5005v2.pdf
[e27]: 27_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[e28]: 28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
