# A single round quotient collar below the chiral Weyl threshold

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning
effort are unavailable. This is a conditional link exclusion for
[SP4-FOT-NECK-E08, revision 1](../research-progress/handoffs/E08_REQUEST_20261125.md).
It uses the topology and signature normalization of
[SEC §11.3](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4047).

## Statement and transition on the closed source

Let \(M\) be a smooth closed oriented integral homology four-sphere
with a smooth Riemannian metric \(g\). Let \(L=S^3/\Gamma\) for a
finite subgroup \(\Gamma\subset SO(4)\) acting freely. Suppose
there is an actual orientation-preserving smooth embedding of a
buffered product cylinder \((-T,T)\times L\) on \(M\).
Use the unit round quotient metric \(\gamma_L\) and
\(h_0=dt^2+\gamma_L\). Suppose a smooth metric \(\widetilde g\)
on the same oriented \(M\) is exactly \(h_0\) near the middle
slice in this chart and
\[
 E_+(\widetilde g)\le E_+(g)+\gamma<9\pi^2,
 \qquad E_\pm(g;U)=\int_U|W_g^\pm|_{\rm HS}^2\,dV_g .
\]
Then \(\Gamma=1\).

Here is one sufficient premise for the metric replacement.
On the selected fixed-width collar let \(h\) be the pulled-back
conformal metric in the intended cylinder gauge and assume
\(\|h-h_0\|_{C^2(h_0)}\le\eta\). In a cone chart with model
\(dr^2+r^2\gamma_L\), use \(t=\log(r/r_0)\) and the metric
factor \(r^{-2}\) before taking this norm, including any
constant physical rescaling in that factor if \(r\) is in
rescaled coordinates. Extend the selected positive conformal
factor smoothly to the closed source by cutting off its
logarithm beyond the buffers. This preserves the chiral Weyl
integrals in dimension four.

Choose a fixed smooth \(0\le\theta\le1\) equal to zero near
\(t=0\) and equal to one outside two interior transition
strips, with \(\theta=1\) at both outer ends. Replace \(h\) by
\(h_0+\theta(h-h_0)\) on the collar in this conformal
representative of \(g\). The convex combination is positive,
and it agrees smoothly with the exterior metric and the
central round product. In the transition strips its \(C^2\)
difference from the product is bounded by \(C_T\eta\). The Weyl
tensor in the new metric is therefore \(O_T(\eta)\), since it
depends smoothly on the first two jets and \(h_0\) is locally
conformally flat. The same argument lifts to \(S^3\), so
constants in this pointwise estimate can be taken independent
of \(\Gamma\) for the fixed cutoff and smallness threshold.
Uniform equivalence to \(h_0\) bounds the transition volume
by \(C_T/|\Gamma|\). The resulting global cost satisfies
\[
 E_+(\widetilde g)\le E_+(g)+C_T\eta^2/|\Gamma|.
\]
The estimate drops the nonnegative old contribution in the
replaced region. Thus, for example, \(E_+(g)\le8\pi^2-\delta\)
admits this test once the cost is strictly below
\(\pi^2+\delta\).

## Topology of the embedded slice

The connected middle hypersurface \(L\) is two-sided and
separates \(M\). Otherwise a path in its complement joining
the two sides of a short normal arc would close the arc to a
loop of algebraic intersection one with \(L\), contrary to
\(H_1(M;\mathbb Z)=0\). The connected side collars ensure that
there are exactly two components. Give their closures \(K_1,K_2\)
the orientation of \(M\). Their common boundary has opposite
outward orientations. Since \(L\) has finite fundamental
group, \(H^1(L;\mathbb Z)=0\), hence \(H_2(L;\mathbb Z)=0\) by
duality. Mayer–Vietoris and \(H_2(M;\mathbb Z)=0\) give
\(H_2(K_1;\mathbb Z)=H_2(K_2;\mathbb Z)=0\), so each signature
is zero.

The restriction to the middle slice gives a smooth and thus
locally flat embedding in an integral homology four-sphere.
The finite-group case of Hillman's Theorem 5.2(1) leaves only
the trivial group, \(Q_8\) and the binary icosahedral group of
the Poincaré homology sphere. The cited Corollary 4.4.2 is the
circle-bundle obstruction used in the proof of the finite case.
These are the statements from the December 2024 author version
cited by SEC. [Hillman, Theorem 5.2(1) and Corollary 4.4.2](https://www.maths.usyd.edu.au/u/jonh/embkDec24.pdf)

The Poincaré case is incompatible with **smooth** embedding,
as Hillman also notes after the proof’s list of classified examples. The boundary of the negative
\(E_8\) plumbing is that smooth three-manifold up to orientation.
The plumbing is simply connected with even intersection form,
hence spin, and has signature \(-8\). Both \(K_j\) are spin by
restriction of the spin structure of \(M\), since
\(H^2(M;\mathbb Z/2)=0\). The homology-sphere link has a unique
spin structure. Glue either \(K_j\) to the plumbing with
opposite boundary orientations, reversing the plumbing
orientation if necessary. Since \(H_1(L;\mathbb Z)=H_2(L;\mathbb Z)=0\),
the middle homology and intersection form of the resulting
closed spin four-manifold come from the plumbing. Its signature
is \(\pm8\), contrary to Rokhlin's divisibility by \(16\).
[Kirby–Scharlemann, Descriptions (1) and (4)](https://web.math.ucsb.edu/~mgscharl/papers/Poincare.pdf) · [Rokhlin, §1.2](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/rohlin2.pdf)

## The round \(Q_8\) eta invariant and the chiral budget

Every free orthogonal realization of \(Q_8\) in dimension four
gives the standard quaternionic round quotient up to orientation.
Its unique central involution is \(-\mathrm{Id}\), since it
has eigenvalues in \(\{1,-1\}\) and no fixed point on the unit
sphere. Matrices \(I,J\) for two quaternionic generators
therefore satisfy \(I^2=J^2=-\mathrm{Id}\), \(IJ=-JI\).
They and \(IJ\) are skew-orthogonal. For any unit \(v\),
\((v,Iv,Jv,IJv)\) is an orthonormal basis, by skew symmetry
and the quaternion relations. In this basis the representation
is left multiplication on \(\mathbb H\). With its quaternion
orientation, left multiplication by \(i\) rotates the
\((1,i)\) and \((j,k)\) planes by \(\pi/2\), and the generators
in the other order-four subgroups are conjugate by
orientation-preserving unit quaternion multiplications.

Use the eta value of the odd signature operator on even forms,
with zero modes excluded, in the convention of APS I,
Theorem (4.14). APS II, Proposition (2.12), gives for an
order-\(m\) cyclic subgroup with generator rotation angles
\(\theta_1,\theta_2\) the quotient value
\[
 -\frac1m\sum_{\ell=1}^{m-1}
        \cot(\ell\theta_1/2)\cot(\ell\theta_2/2).
\]
Each of the three order-four cyclic quotients has value
\(-1/2\). The common antipodal order-two quotient has value
zero. On each nonzero signed eigenspace, the projection to
group invariants averages the group action, so the eta
function is the average of equivariant eta functions.
This holds first in the convergence half-plane and then at
zero. The three order-four subgroups cover \(Q_8\) and
overlap in their common order-two subgroup, giving
\[
 8\,\eta_{\rm sig}(L)
    =3\cdot4(-1/2)-2\cdot2(0)=-6 .
\]
Orientation reversal changes the sign. The needed absolute
value for either boundary marking is \(3/4\).
[APS II, §2 and Proposition (2.12)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf)

Apply APS I on each \(K_j\) with the single smoothly
modified metric \(\widetilde g\). It is a product near
the boundary. In dimension four the Hirzebruch density in
the SEC normalization is
\(L_1=(|W^+|_{\rm HS}^2-|W^-|_{\rm HS}^2)dV/(12\pi^2)\).
Using zero signature on each side gives
\[
 E_+(\widetilde g;K_j)-E_-(\widetilde g;K_j)
   =12\pi^2\,\eta_{\rm sig}(\partial K_j,\gamma_L).
\]
The two right-hand sides have opposite signs and one is
\(+9\pi^2\). That side forces \(E_+(\widetilde g;K_j)\ge9\pi^2\)
by nonnegativity of its negative-chirality energy. Since both
interiors retain the orientation of \(M\), and their union
covers it up to the measure-zero hypersurface,
\(E_+(\widetilde g)\ge9\pi^2\). This contradicts the assumed
budget. [APS I, Theorem (4.14)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf) · [SEC signature convention](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4022)

Only the trivial link remains. The argument uses the geometry of
one actual embedded collar and a positive-chirality budget for
the transition. Its application to budget-selected blocks
requires a separate construction of this collar geometry.
