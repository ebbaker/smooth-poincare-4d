# SP4-CME-E61 — Audit of the compact critical linear estimate

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I did not write E57. I previously
audited related estimates in E43 and E58. Both frozen hashes
matched before use. The [request][req] and [return][ret]
record exact identities.

**Pass.** The E57 short-time estimate, construction, strong trace,
uniqueness and Hessian bound hold in its fixed compact-bundle
class with nonsymmetric Hermitian rank-one coefficients. No
omitted analytic premise or new primary-source input was found.
The calculation uses the fixed \(p=8,\ s=1/2\) blocks, not an
estimate for time-dependent or nonlinear leading arrays.
[E57][e57] · [E54][e54].

## Frozen matrix kernels

With \(P_a(\zeta)=4\pi^2 C_a^{ij}(x_a)\zeta_i\zeta_j\)
and \(z(\tau)=e^{-\tau P_a(\zeta)}v\), one has
\(\frac{d}{d\tau}|z|^2=-2\operatorname{Re}\langle P_a z,z\rangle\).
The fixed Hermitian rank-one bound, after the uniform master-chart
comparison of covectors, gives
\(\|e^{-\tau P_a(\zeta)}\|\le e^{-c_1\tau|\zeta|^2}\).
This does not use orthogonal diagonalization or symmetry.
Differentiating its ODE in \(\zeta\) gives the ordered
variation formula in E57. At higher derivative order, the
terms are integrals of products of exponentials and positive-order
derivatives of \(P_a\) at the same frequency, in their
ordered positions. A term with \(j_1\) insertions has a simplex
of volume \(\tau^{j_1}/j_1!\), with \(j_1\) bounded by the total
derivative order. The sum of the time lengths in the exponential
factors is \(\tau\), so their product is at most
\(e^{-c_2\tau}\) on the fixed annulus. Each derivative of \(P_a\)
there has a uniformly bounded norm. Differentiating the cutoff
symbol thus costs at most a polynomial in \(\tau\) times
\(e^{-c_2\tau}\). A smaller positive rate absorbs the polynomial.

Using the E53 periodization of the cutoff symbol and
\(\tau=2^{2j}t\) gives the high-block \(L^8\) multiplier
bound \(Ce^{-c_3 2^{2j}t}\) for \(j\ge1\). The bounded
derivative count needed for the kernel \(L^1\) estimate is
fixed, as are the annular supports. For \(j=0\) there
are finitely many lattice frequencies. Each coefficient of
an already low-localized section is bounded in magnitude by
its \(L^1\) norm, hence its \(L^8\) norm on the unit torus.
The zero mode is constant under the undamped semigroup.
Summation over this fixed set bounds the low block uniformly
for \(0\le t\le T\le1\).

For the source term on each high block the time integral
of the positive majorant after its source time \(r\) is
\(\int_r^T Ce^{-c_3 2^{2j}(t-r)}\,dt
\le C'2^{-2j}\). The low-block integral costs at most \(CT\).
The time supremum costs \(C\) on every block. Hence the
two sums with weights \(2^{sj}\) and \(2^{(s+2)j}\)
are both controlled by the frozen datum and \(L^1_tB^s\)
forcing. Uniform bounds on the starting master charts
and fixed matrix coefficient range give one \(A_{\rm fr}\)
independent of the later cutoff sizes, derivatives and
number of charts. No scalar or commuting principal matrix
assumption has entered. [E57, frozen matrix problem][e57] ·
[E53, kernel and time summation][e53].

## Fixed atlas, support and completed norms

Each chart is refined within a precompact master chart,
without rescaling the coordinate derivatives. Translation
into the torus cube leaves the frozen coefficient comparison
unchanged. For reconstruction
\(R(v)=\sum_a (\rho_a v_a)_{a,\rm push}\), one has
\(RIU=\sum_a\rho_a\eta_a U=U\), where \(I\) takes
the \(\eta\) pieces. A component of \(IR\) expresses the
cutoff reconstruction in another chart. Its multiplier
contains the smooth frame change, and its support is
compact inside the overlap because it uses both compact
cutoffs. Thus it has the stated form \(Tv=A(x)v\circ\Phi\)
extended by zero. Fixed bounded Jacobians give its
\(L^8\) bound. Derivatives through order four are controlled
by the chain rule on a compact overlap and the same
\(L^8\) comparisons, giving the \(W^{4,8}\) bound.

For an input block \(v_j\) the derivative bound gives
\(\|Tv_j\|_{W^{4,8}}\le C2^{4j}\|v_j\|_8\).
For \(k\ge1\), the smooth annular symbol obtained by
dividing by the normalized symbol of \((-\Delta)^2\)
gives \(\|\Delta_k z\|_8\le C2^{-4k}\|z\|_{W^{4,8}}\).
Then E57 (3) follows by taking the minimum with the
\(L^8\) bound. For \(0<\sigma<4\), the part \(k\le j\)
of the weighted sum is at most \(C_\sigma 2^{\sigma j}\),
and for \(k>j\) it is bounded by
\(C 2^{\sigma j}\sum_{\ell\ge1}2^{-(4-\sigma)\ell}\).
The low block satisfies the bound separately. This covers
\(s,\ s+1,\ 2,\ s+2\), namely \(1/2,\ 3/2,\ 2,\ 5/2\).
To compare \(M_T\), take the time supremum of each
output block estimate with the sum of input-block suprema
on the right, and then sum the weights. For \(H_T\),
integrate before summing by Tonelli. These are the correct
orders of the time norms and chart comparisons. First
derivatives of a reconstruction use the input at order
\(s+1\) before the output comparison at order \(s\).
The coefficient and coordinate terms from the chain rule
are bounded smooth multipliers on fixed compact overlaps.

The identity \(RI=\mathrm{id}\) makes \(IR\) a bounded
projection on products of local \(B^\sigma\) spaces and
products of local path spaces with the two E57 sums.
Each local path space is complete: its first norm controls
uniform convergence in \(B^s\) and the continuity of the
limit path. Taking each block limit, then Fatou for the
time integral and the nonnegative block sums, bounds the
full norm of its difference from a Cauchy member by the
lower limit of the norms of Cauchy differences. Conversely
blockwise continuity and a summable tail of the time
suprema give strong \(B^s\) continuity. The projection's
range is closed and provides exactly the global normed
space in the statement. Smooth datum density follows
by approximating each piece by trigonometric polynomials
and applying \(R\). The same argument together with
Bochner time approximation gives smooth source density
in \(L^1_t\mathcal B^s\), including smooth choices
on the closed slab. For the path class, one may also
truncate the summable block tails and smooth the resulting
finitely many continuous temporal Fourier coefficients,
then project by \(IR\). This confirms compatibility with
completion in the exact blockwise path norm. The
summable critical Bernstein bound and reconstruction
give the continuous spatial representative of the trace.
[E57, localized spaces][e57] · [E53, completeness and density][e53].

## Exact localized equation and absorption

In chart coordinates
\(L=C_a^{ij}(x)\partial_i\partial_j+b_a^i(x)\partial_i+c_a^0(x)\);
the fixed bundle and base derivatives contribute only to
the latter two arrays. Spatial testing of a compactly
supported chart piece on the torus is well defined by
pushing the test back with a cutoff equal to one on a
neighborhood of the support. Derivatives of this auxiliary
cutoff pair with zero, since the distribution and its
derivatives are supported away from where the cutoff
varies. Thus extension by zero and spatial differentiation
commute here. The cutoff is time-independent, so it
does not produce a time term in the interior equation.
Both derivatives of \(u_a=\eta_a U\) and the
\([L,\eta_a]U\) terms have compact support in the chart.
The multiplier \(\chi_a\) is one on the relevant
neighborhood, so extension of the tilded coefficients
does not change their action on \(u_a\).

The sign is
\((\partial_t-L)(\eta_a U)=\eta_a f-[L,\eta_a]U\).
Subtracting \(L_a^{\rm fr}\) then puts
\((C_a(x)-C_a(x_a))\partial^2u_a\) on the right.
Its commutator with the partition includes both
\(C_a^{ij}(\partial_i\eta_a)\partial_jU\) and
\(C_a^{ij}(\partial_j\eta_a)\partial_iU\), as well
as the zeroth-order Hessian of \(\eta_a\) and the
first-order coefficient acting on \(\eta_a\).
No symmetry of \(C_a^{ij}\) is needed to combine it.
This is exactly (4), with no chart boundary forcing.

The increment of \(ev\) has terms
\((\tau_h e)\delta_hv\) and \((\delta_he)v\).
The first uses \(\|e\|_\infty\); the second uses
\(\|\delta_he\|_\infty\le |h|\operatorname{Lip}(e)\).
The weight \(\int_0^1 r^{-s}\,dr\) is finite.
Together with the \(L^8\) term this gives (5).
For \(v=\partial_{ij}u_a\), the first term costs
\(C\|e_a\|_\infty\|u_a\|_{B^{s+2}}\), and the second
costs \(C\operatorname{Lip}(e_a)\|u_a\|_{B^2}\) by
block reconstruction and derivative estimates. These
are different spatial orders. The first constant uses
only the torus estimate and the fixed finite array
dimension. Summing over \(a\) leaves
\(A_{\rm fr} C\delta H_T\) with no atlas comparison
factor, since it is the same piece on both sides.
Take \(\delta\) small before selecting the refined atlas.
Afterwards all Lipschitz, commutator and reconstruction
constants can depend on that finished atlas. They
multiply only \(B^2,\ B^{s+1}\) and \(B^s\).

Write \(m_a=\sup_t\|u_a(t)\|_{B^s}\) and
\(h_a=\int_0^T\|u_a(t)\|_{B^{s+2}}dt\). Block Hölder
gives the pointwise interpolation with
\(\theta=(\sigma-s)/2\). Time Hölder gives
\(\int\|u_a\|_{B^\sigma}\le
T^{1-\theta}m_a^{1-\theta}h_a^\theta\).
Hölder in the finite chart sum and
\(\sum_a m_a\le M_T,\ \sum_a h_a=H_T\)
give (6), also at \(\theta=0\) directly.
For \(\sigma=2,\ s+1,\ s\) the powers are respectively
\(1/4,\ 1/2,\ 1\). At \(T\le1\) each lower term can
thus use the \(T^{1/4}\) factor. With the indicated
choices of \(\delta\) and \(T_0\), the right side after
source terms is at most \(H_T/4+E_T/4\le E_T/2\).
This proves the claimed uniform short-time bound for
smooth global solutions, with the principal absorption
taken independently of atlas count.
[E57 (4)–(6)][e57] · [E54, positive-order difference norm][e54].

## Global construction, weak uniqueness and Hessian

Rewriting \(L\) in the fixed metric connection
\(\nabla\) yields a divergence term and fixed first-
and zeroth-order terms. Integration by parts tests
the principal form with \(C^{ij}\nabla_jw,\nabla_iw\).
For a constant frozen array its negative form estimate
uses Plancherel on \(i\xi\otimes\widehat w\), which
is exactly rank-one. Smooth coefficient and density
variations can be absorbed on small charts. Linear
cutoff cross terms sum to zero with
\(\sum\chi_\ell\,d\chi_\ell=0\) in a squared
partition. Other cutoff terms and lower-order terms
are absorbed by Young's inequality with a fixed
\(L^2\) cost. Thus (7) applies to this nonsymmetric
\(L\), with no assumption of positivity on arbitrary
gradient arrays.

The self-adjoint spectral projections belong to the
auxiliary positive operator \(I+\nabla^*\nabla\),
whose form is coercive on \(H^1\) and whose inverse
is compact on \(L^2\). The fixed-coefficient
local elliptic estimate and the weak \(H^2\)
difference-quotient start identify the Sobolev graph
norms at each integer order. Even orders follow by
iteration and odd ones from the \(H^1\) form norm.
Then \(Q_N\) is uniformly bounded in these norms.
For even \(k\), \(\Lambda^k\) is differential
with scalar top symbol. Testing the Galerkin
equation against \(\Lambda^{2k}U_N\) drops \(Q_N\).
The order \(k+2\) commutator term is zero by scalar
top symbol, leaving order at most \(k+1\).
Its product with \(\|\Lambda^kU_N\|_2\) is absorbed
in the Gårding gradient cost up to \(C_k\|U_N\|_{H^k}^2\).
Indeed \(\|\nabla\Lambda^kU_N\|_2^2+\|\Lambda^kU_N\|_2^2\)
is equivalent to \(\|U_N\|_{H^{k+1}}^2\). The finite
ODEs and this energy estimate give uniform \(H^k\)
bounds on the fixed interval for smooth data and forcing.
There is no spectral construction or spectral positivity
assumption for \(L\) itself.

The projected time derivative is bounded in \(H^{k-2}\)
from the equation and uniform projection bounds.
Interpolation gives equicontinuity in \(H^{k-1}\),
and the \(H^k\) bounds give pointwise compactness there.
A diagonal subsequence converges in \(C_tH^{k-1}\)
at every such even \(k\). Passing in the equation
uses strong convergence of the projected data and
operator terms in lower fixed Sobolev norms. The
smooth spatial limit and equation give all time
derivatives on the closed slab. The smooth solution's
critical norms are finite since the high-block
\(2^{-4j}\) bound applies and both orders are below four.
Applying the a priori estimate to differences of smooth
solutions and using data density gives a Cauchy sequence
in the actual localized path norm. Its limit is strong
in \(\mathcal B^s\) at zero and hence uniform in
space. Uniform \(L^8\) convergence and \(L^1_tL^8\)
forcing convergence pass the equation by testing with
the fixed formal adjoint.

For the difference \(W\) of two strongly traced
solutions of the same data, square the pointwise
\(B^{s+1}\) interpolation bound and integrate in time.
It gives \(\|w_a\|_{L^2B^{s+1}}\le\sqrt{m_a h_a}\).
Summing by Cauchy–Schwarz gives exactly
\(M_T(W)^{1/2}H_T(W)^{1/2}\).
The derivative kernel and the reconstruction show
\(W\in L^2H^1\), using fixed compact volume to pass
from the chart \(W^{1,8}\) estimates to \(H^1\).
The fixed divergence form gives \(W_t=LW\in L^2H^{-1}\).
Time smoothing justifies the \(L^2\) energy identity
in this pairing. With the strong \(L^2\) trace and (7),
Gronwall gives uniqueness in the stated class.

For the Hessian, reconstruction differentiates the
fixed cutoffs and frame coefficients at most twice.
It costs a fixed sum of the coordinate \(C^0\) norms
of the pieces and their derivatives of orders one and two.
On each block, the order-\(d\) Bernstein bound in \(L^\infty\),
\(0\le d\le2\), is \(C2^{(d+1/2)j}\|u_{a,j}\|_8\).
Every such weight is at most \(C2^{(s+2)j}\).
Integrating and summing gives
\(\int_0^T\|\nabla^2 U\|_\infty\,dt\le C H_T(U)\).
These derivatives are obtained as \(L^1_t C^0_x\)
limits and agree with the distributional covariant
derivatives. This is the last claimed endpoint bound,
with all metric and frame factors fixed.
[E57, global construction and uniqueness][e57] ·
[E41, Gårding][e41] · [E53, Bernstein][e53].

The checks used the frozen derivations and their fixed
Fourier, energy and approximation arguments. No new
primary theorem or reading copy was needed. The result
stays within the fixed linear short-time problem.

[req]: ../research-progress/handoffs/SP4-CME-E61_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E61_RETURN_v1.md
[e57]: ../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md
[e54]: ../notes/54_CRITICAL_QUASILINEAR_MODEL_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e41]: ../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
