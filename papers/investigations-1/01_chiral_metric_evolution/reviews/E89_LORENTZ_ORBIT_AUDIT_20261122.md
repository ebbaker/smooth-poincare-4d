# SP4-CME-E89 — Independent audit of the Lorentz orbit solver

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E71, E66
and E80. I did not author E88, E79 or E70. The [E89 request][req]
and [E88 request][e88req] identify the frozen note and inherited
inputs. Their digests matched before use. No primary source was
newly inspected or imported. See [B51][b51] and the [return][ret].

**Disposition.** E88 passes for the exact E79 infinitesimal
solver on the specified fixed native round reference. Its
divergence-forcing estimate is distinct from the E66
non-divergence inverse estimate. The endpoint bound uses
only the fixed reference and sup-small \(a,\beta\). The
audit found no mathematical correction to the claimed
norms, identities, or scope. [E88 (1)][e88].

## Kernel subtraction and the weak \(L^2\) endpoint

In the native reference of E71, \(K_0=d_0^*\Pi_0d_0\)
is nonnegative and has a finite smooth kernel
\(N=\{\psi\in H^1:\Pi_0d_0\psi=0\}\).
The weak inverse is bounded from the \(H^{-1}\)
annihilator to \(H^1\cap N^\perp\). For arbitrary
\(L^2\) flux \(w\), \(d_0^*w\) is the functional
\(\eta\mapsto(w,d_0\eta)_{L^2}\). Thus subtracting its
fixed kernel component gives
\[
 R_Nw=\sum_j(w,d_0\psi_j)_{L^2}\psi_j,\qquad
 K_0Lw=d_0^*w-R_Nw,\qquad L=K_0^\dagger d_0^*,                     \tag{1}
\]
with an \(L^2\)-orthonormal basis of \(N\).
Indeed pairing the right side against \(\psi_i\)
gives zero term by term. Finite rank and the smooth
basis give \(\|R_Nw\|_{C^k}\le C_{k,p}\|w\|_p\)
by Hölder for \(p=2,8\). The right side of (1) has
\(H^{-1}\) norm bounded by \(C\|w\|_2\), so E71 gives
\(\|Lw\|_{H^1}\le C\|w\|_2\) and \(Lw\perp N\).
Smooth \(w\) gives smooth \(Lw\) by the fixed E71
regularity.

For a projected flux \(w=\Pi_0w'\), the finite-rank
term vanishes because \(\Pi_0\) is orthogonal and
\(\Pi_0d_0\psi_j=0\).
The same holds for every \(w\) in the fixed pointwise
range \(\ker S_0^*\), since all \(d_0\psi_j\) lie in
\(\operatorname{im}S_0\).
The arbitrary-flux estimate must retain \(R_Nw\)
until this cancellation applies. [E88 (2)][e88] ·
[E71 (4)–(6)][e71] · [E79, weak annihilator][e79].

## Local form, cutoffs and the fixed divergence multiplier

Write \(P=\mu K_0\) in a fixed internal frame and
coordinate density \(\mu\,dx=dV_{g_0}\).
The weak form gives leading \(A^{ij}=\mu g_0^{i\ell}
(\Pi_0)_\ell{}^j\), and the lower blocks are
\(B^i=A^{ij}\gamma_j\), \(C^j=\gamma_i^*A^{ij}\),
\(D=\gamma_i^*A^{ij}\gamma_j\) for \(d_0=\partial+\gamma\).
Consequently
\[
 P\phi=-\partial_i(A^{ij}\partial_j\phi+M^i\phi)+D_1\phi,
 \qquad M^i=B^i-C^i,\quad D_1=D-\partial_jC^j .
\]
The sign of \(-\partial_j C^j\) follows from putting
\(C^j\partial_j\phi\) into divergence form.
The right side of (1), after multiplication by \(\mu\),
is \(-\partial_iF^i+G\) with
\(F^i=\mu g_0^{ij}w_j\) and
\(G=\gamma_i^*F^i-\mu R_Nw\).
Thus the kernel correction appears in the value
forcing with the same minus sign. [E88 (2)–(3)][e88] ·
[E80 (1)–(2), specialized to the reference][e80].

For \(v=\chi\phi\), expanding the divergence gives
\[
 \begin{split}
 F_\chi^i
  &=\chi F^i+A^{ij}(\partial_j\chi)\phi
                +(\partial_\ell\chi)A^{\ell i}\phi,\\
 G_\chi
  &=\chi G+(\partial_i\chi)F^i
     +\partial_j((\partial_i\chi)A^{ij})\phi
     -(\partial_i\chi)M^i\phi,\\
 P v&=-\partial_iF_\chi^i+G_\chi .
 \end{split}                                                       \tag{2}
\]
The last flux in the first line comes from moving the
cutoff commutator \( -(\partial_i\chi)A^{ij}\partial_j\phi\)
into divergence form. Its differentiated coefficient
is the plus term in \(G_\chi\). Thus these cutoff inputs
cost only \(w,R_Nw,\phi\) in \(L^8\).
All multipliers there are fixed smooth coefficients on
the compact support. Freezing \(A_*=A(x_*)\) gives
\[
 (I+L_*)v=-\partial_i\!\bigl(F_\chi^i+
                (A_*^{ij}-A^{ij})\partial_jv-M^iv\bigr)
            +G_\chi+(I-D_1)v,\quad
 L_*=-A_*^{ij}\partial_i\partial_j.                                \tag{3}
\]
In particular the coefficient difference multiplies only
the localized first derivative inside the flux. The
cutoffs are supported in chart interiors, so this is
the compactly supported identity on \(\mathbb R^4\)
after extension. [E88 (3)–(4)][e88].

In the \(i\xi\) convention, E71's symbol yields
\(A_*(\xi)=\tfrac23\mu(x_*)|\xi|_{g_0(x_*)}^2 I_E\).
This is scalar on the internal bundle. The input flux
and output gradient have coordinate slots, and their
matrix multiplier has entries
\(m_{ij}(\xi)=\xi_i\xi_j(I+A_*(\xi))^{-1}\).
The positive sign comes from \(i\xi_i(-i\xi_j)\).
The gradient of the resolvent on the value forcing has
symbol \(n_i(\xi)=i\xi_i(I+A_*(\xi))^{-1}\).
The flux symbol is bounded in \(L^2\) by Plancherel,
and localization does not use the \(G_0^{-1}\)
multiplier for non-divergence data.
[E71 (2)][e71] · [E88 (5)][e88] · [E66,
fixed non-divergence method][e66].

On the rescaled flux annuli, the denominator is
\(2^{-2\ell}I+A_*(\eta)\). Its inverse and each fixed
number of annular derivatives are uniformly bounded for
all integer \(\ell\), by the uniform positive annular
bound on the fixed atlas and differentiation of the
inverse. Scaling and integration by parts give block
kernel bounds \(C_N2^{(4+j)\ell}(1+2^\ell|x|)^{-N}\)
for \(j=0,1\). Splitting the sum at \(2^\ell|x|=1\)
gives the off-origin \(C|x|^{-4}\) and \(C|x|^{-5}\)
bounds. Finite partial multipliers converge strongly in
\(L^2\) by bounded overlap and Plancherel. Away from a
compact input support the absolutely summed estimate
identifies this action with the kernel. The same holds
for the adjoint matrix symbol.

For vector inputs, the maximal dyadic cube argument
uses the average of the modulus to select cubes and the
vector average on each cube for cancellation. At height
\(\lambda\), the total cube measure is at most
\(\|f\|_1/\lambda\), and the good part has squared
\(L^2\) norm at most \(C\lambda\|f\|_1\).
For a bad cube \(Q\) use its zero vector integral and
subtract the kernel at its center. The first derivative
bound integrates outside the enlarged cube to
\(C\ell(Q)\int_{c\ell(Q)}^\infty r^{-2}\,dr\le C\),
so the \(L^1\) bound there is \(C\|b_Q\|_1\).
Disjoint bad parts sum in \(L^2\), allowing the finite
sum bounds to pass by \(L^2\) continuity and Fatou.
Together with the good-part output and enlarged cube
measure bounds this gives weak \((1,1)\) for the flux
matrix and its adjoint. Splitting the input at
\(\lambda\) and integrating the resulting weak
\((1,1)\) and strong \((2,2)\) distribution estimates
against \(p\lambda^{p-1}\,d\lambda\) is valid for
\(1<p<2\). The two inner powers are \(p-2\) below the
input modulus and \(p-3\) above it.
Use \(p=8/7\) on the adjoint and duality to get the
required flux \(L^8\) bound. Dual testing reconciles this
action with the \(L^2\) multiplier on common inputs.
[E88, flux kernel and dyadic estimate][e88] ·
[E66, kernel method][e66] · [E70, strong endpoints][e70].

The value symbol has a smooth low-frequency block
with a Schwartz kernel. On a high annulus the extra
inverse derivative gives \(2^{-\ell}\) times uniformly
smooth rescaled symbols. The kernel \(L^1\) norms
therefore sum, giving the value \(L^8\) bound by Young.
This step deals with the smooth kernel force as well
as the cutoff and lower-order value terms in (3).
All annular and chart constants are fixed by \(K_0\).

## Common strong endpoints and Lorentz layers

On small fixed patches, the leading oscillation times the
uniform flux multiplier constant is less than \(1/2\),
including the finite slot count. Absorb this term on each
supported partition piece before summing.
All cutoff and lower-order forcings in (2)–(3) are
controlled by \(\|w\|_8+\|\phi\|_8\), including the
finite-rank bound in (1). Reconstruction and comparison
with \(D_0\) therefore give
\(\|D_0\phi\|_8\le C_1(\|w\|_8+\|\phi\|_8)\).
For a supported patch function \(v\), a normalized
mollifier \(\eta_h\) gives
\[
 \|v-\eta_h*v\|_8\le Ch\|\partial v\|_8,\qquad
 \|\eta_h*v\|_8\le Ch^{-3/2}\|v\|_2 .
\]
The first follows by integrating differences along
translations, and the second uses the \(L^{8/5}\)
kernel norm in dimension four.
Sum in the fixed charts; differentiating a cutoff or
frame adds \(Ch\|\phi\|_8\) to the right. Absorbing
that term gives
\(\|\phi\|_8\le\varepsilon\|D_0\phi\|_8+C_\varepsilon\|\phi\|_2\)
for any fixed \(\varepsilon>0\) by a small enough \(h\).
Take \(C_1\varepsilon<1/2\) and use the weak estimate
and \(\|w\|_2\le V^{3/8}\|w\|_8\).
This proves the \(W^{1,8}\) estimate without importing
a \(G_0\) inverse or using more than one derivative of
the solution in the localized norm. Smooth \(L^8\)
approximation converges in \(L^2\) by finite volume.
Thus the \(W^{1,8}\) and \(H^1\) limits agree, retaining
\(N^\perp\) and the projected weak equation.
[E88 (6)–(7)][e88].

For \(h\) in both endpoint spaces, let
\(A_2=\|h\|_2\) and \(A_8=\|h\|_8\).
The pointwise rearrangement majorants switch at
\(s_*=(A_2/A_8)^{8/3}\). Their two integrals, extending
the upper range to infinity, are \(8A_8s_*^{1/8}\)
and \(4A_2s_*^{-1/4}\). This verifies
\(\|h\|_{4,1}\le12 A_2^{1/3}A_8^{2/3}\).
A vector layer \(w_v=(w/|w|)1_{\{|w|>v\}}\) lies in
both endpoint spaces, with norms \(\mu_w(v)^{1/2}\) and
\(\mu_w(v)^{1/8}\). For \(j=0,1\) the endpoint
norms for \(D_0^jL\) imply its output bound
\(12c_{j,2}^{1/3}c_{j,8}^{2/3}\mu_w(v)^{1/4}\).
The operator applies to arbitrary layers, so the
nonlinear formation of a layer requires no pointwise
projection or exact derivative structure.
Almost all thresholds have zero-measure level sets,
so layer continuity at such thresholds in the two
endpoints gives strong measurability. The same
interpolation inequality gives this for the output
Lorentz layers. The norm is complete by E66/E70,
and the layer identity integrates the bound.

In \(L^2\), the integral of the input layers converges
to \(w\) with
\(\|w\|_2\le V^{1/4}\|w\|_{4,1}/4\), since
\(\mu_w(v)^{1/2}\le V^{1/4}\mu_w(v)^{1/4}\).
The truncated layer integral is the corresponding
pointwise truncation, identifying this \(L^2\) limit.
The \(L^2\) and Lorentz integrals of the output agree
in \(L^1\) via the common endpoint operator, giving
the two weak derivative components of the same section.
Hence the fixed divergence inverse has norm at most
\(3\sum_{j=0}^1c_{j,2}^{1/3}c_{j,8}^{2/3}\) into
\(W^{1,(4,1)}\). The factor \(3\) is \(12/4\) from
the layer convention. The projected forcing version
uses \(\|\Pi_0w\|_{4,1}\le\|w\|_{4,1}\) and the
kernel cancellation in (1).
[E88 (8)][e88] · [E66 (6)–(9)][e66] ·
[E70, common inverse and layers][e70].

## Actual weak perturbation and all kernel terms

Put \(\epsilon=\|a\|_\infty+\|\beta\|_\infty\).
The E79 fiber estimates bound \(H_A,\Pi_A\) uniformly,
and \(\|\Pi_A-\Pi_0\|_\infty\le C\|\beta\|_\infty\).
The exact difference on weak fluxes is
\[
 K_A\phi=K_0\phi+d_0^*M_A\phi,\qquad
 M_A\phi=(\Pi_A-\Pi_0)d_0\phi+\Pi_A[a,\phi].
\]
This follows by expanding \(d_A=d_0+[a,\cdot]\) on
sections before applying \(d_0^*\). It puts the
nonsymmetric projection in the required order.
The bracket contributes at most
\(C\|a\|_\infty\|\phi\|_{4,1}\) and the other term
at most \(C\|\beta\|_\infty\|d_0\phi\|_{4,1}\).
Neither flux estimate differentiates its coefficient.

Both \(\Pi_A r\) and \(M_A\phi\) lie in \(\ker S_0^*\)
pointwise, because \(\Pi_A\) and \(\Pi_0\) have this
range. Their \(R_N\) corrections from (1) therefore
vanish individually. This is a test-kernel cancellation,
which is distinct from claiming \(K_A\psi=0\) for
input \(\psi\in N\).
The graph norm of \(W^{1,(4,1)}\) is complete by
Lorentz completeness and distributional closedness of
the weak derivative. It embeds into \(H^1\) by the
finite-volume layer bound for both the value and
derivative. The \(N^\perp\) condition defines a closed
subspace using this \(L^2\) pairing.

On that subspace \(LM_A\) takes values in \(N^\perp\).
Its norm is bounded by \(C_L C\epsilon\) by the
fixed inverse and flux bound. Shrinking the same
value tube to make this at most \(1/2\) gives the
Neumann solution of
\((I+LM_A)\phi=L\Pi_A r\).
Both fluxes are \(L^2\); applying \(K_0\) to the
identity in the weak spaces uses (1) and both
\(R_N\) cancellations, producing exactly
\(K_A\phi=d_0^*\Pi_A r\) on all \(H^1\) tests.
Since \(\phi\in H^1\cap N^\perp\), E79's uniqueness
there identifies it with the actual parameter.
For smooth \(A,r\) the assessed E79 regularity then
makes it smooth. That qualitative use of regularity
does not enter the quantitative estimate.
The formulas
\(u=H_A(r-d_A\phi)\), \(r_{\rm sl}=\Pi_A(r-d_A\phi)\)
have the desired \(L^{4,1}\) bounds by the fiber
bounds and the zeroth-order bracket.
[E88 (9) and weak identification][e88] ·
[E79 (1)–(9), (12)][e79] · [E80, weak inverse][e80].

## Endpoint continuity and the exact scope

A smooth compactly supported coordinate function or
vector \(v\) in \(\mathbb R^4\) can be integrated
along every ray from \(x\). Its value at the far end
is zero. Averaging the absolute derivative bounds
over the unit sphere and using polar coordinates
gives the kernel \(|x-y|^{-3}/|S^3|\) applied
to \(|\partial v|\).
For any set of measure \(m\), split the kernel
integral at radius \(m^{1/4}\).
The inner ball costs \(|S^3|m^{1/4}\), and the
outer part costs at most \(m^{1/4}\).
Layer integration proves the stated endpoint uniform
bound by \(\|\partial v\|_{4,1}\).
On fixed compactly supported chart pieces, cutoff
and connection terms cost the value norm and the
fixed coordinate derivative is bounded by \(D_0\)
plus those terms. Bounded density ratios compare
local Lorentz norms by the distribution formula.
This yields \(\|v\|_{C^0}\le C\|v\|_{W^{1,(4,1)}}\)
for smooth sections in the fixed bundle norms.

The weak-space density step also works. After
cutoff and zero extension in a chart the piece and
its distributional first derivatives are compactly
supported \(L^{4,1}\) fields. There is no boundary
term because the support is interior. For any of
these fields, the high-modulus tail above \(M\)
has distribution function bounded by the original
one and tending to zero as \(M\to\infty\). The layer
integral therefore sends its Lorentz norm to zero.
The complementary bounded supported field is in
\(L^2\cap L^8\), and its translations are continuous
in the Lorentz norm by the two-endpoint bound.
Translation invariance extends this to the full
field. Convolution with a smooth approximate
identity thus converges in the Lorentz norm for the
piece and its derivative by the triangle inequality
under the integral. The needed integrals can be
taken on a fixed enlarged bounded coordinate set.
Derivatives commute with convolution in distributions,
and small supports keep the approximants in chart
interiors. Reconstructing in the fixed bundle frames
gives convergence in the weak graph norm.
The endpoint estimate makes the approximants Cauchy
in \(C^0\); the graph convergence and its \(L^2\)
bound identify the uniform limit with the original
section. This proves the continuous representative
claim. [E88, continuous endpoint][e88] ·
[E66, Lorentz completeness][e66] · [E70, norm audit][e70].

All coefficient derivatives in the \(L^8\) localization,
kernel estimates, coordinate comparisons and endpoint
embedding belong to the fixed reference. The varying
connection is used quantitatively only through the
sup bounds on \(a,\beta\) and the resulting fiber
multipliers. The estimate applies to the specified
infinitesimal \(W^{1,(4,1)}/C^0/L^{4,1}\) outputs.
The horizontal parameter has only an \(L^{4,1}\)
bound in this estimate. Finite placement and a
\(C^1\) horizontal-flow estimate remain outside the
audit. [E88, scope][e88] · [B51][b51].

[req]: ../research-progress/handoffs/SP4-CME-E89_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E89_RETURN_v1.md
[e88req]: ../research-progress/handoffs/SP4-CME-E88_REQUEST_v1.md
[b51]: ../brainstorm/notes/B51_VALUE_UNIFORM_LORENTZ_ORBIT_INVERSE_20261122.md
[e88]: ../notes/88_LORENTZ_ORBIT_SOLVER_20261122.md
[e71]: ../notes/71_LINEAR_ROUND_SLICE_20261122.md
[e79]: ../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e80]: E80_ORBIT_INVERSE_AUDIT_20261122.md
[e66]: ../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e70]: E70_FIXED_SLICE_AUDIT_20261122.md
