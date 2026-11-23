# SP4-CME-E100 — Manuscript integration audit of the actual curved example

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E96, the
underlying independent example audit, and E89 and E92, which
underlie parts of E97's assessed inputs. I did not author E95
or E97. This packet compares the lead's integration with the
assessed derivation. It is not another independent derivation
audit. The [request][req]'s frozen manuscript and three note
digests matched before use. All manuscript line numbers below
are from that frozen version. No new primary source was used.
[Return][ret].

**Disposition.** The integrated actual example preserves the
selected-solver, varying-forcing claim and the auxiliary-flow
comparison. All four E97 wording edits are present. Local
precision fixes are noted below. No substantive correction to
the proposition or its scope was found.

## Actual example integration

### Lift, compatibility and estimates

**4805–4879, `prop:horizontal-critical-loss`.** The statement
already restricts the output to the inverse in
`lem:varying-slice-inverse` and specifies smooth perfect
connections on the round bundle with varying forcings.
The proof keeps the nested cube margins and the compact
support of the cutoff field. Its time-one map fixes the
chart collar, so the formula \(G_n(x,h)=(\psi_n(x),h)\)
is a smooth right-equivariant map in the chosen
trivialization and glues to identity. The inverse is
obtained from the negative-time flow and glues on the
same collar. This is a bundle automorphism of the actual
round principal bundle. The base map is orientation
preserving because it comes from the flow.
The first and second variational equations give the
bounds used in the theorem: displacement \(O(\epsilon_n/n)\),
first-order error \(O(\epsilon_n)\), and second derivative
bound \(O(n\epsilon_n)\) in the fixed chart comparisons.
The manuscript uses only the needed upper bound on the
second derivatives of the maps. On \(Q_1\) the trajectories
stay in \(Q_2\) for the stated time interval, giving the
exact opposite shears for the map and inverse.
[E95 (1)–(2)][e95] · [E96, base and lift][e96].

The compatibility identities are unchanged:
\(A_n=G_n^*A_0\), \(F_{A_n}=G_n^*F_0\), and
\(d_{A_n}r_n=G_n^*(d_0r_0)\) with \(r_n=G_n^*r_0\).
The exterior derivative identity expresses the forcing
derivative as the pullback of a fixed two-form. Its value
uses only the first derivative of the map, and a spatial
derivative costs one second derivative of the map. The
affine frame change cancels in \(A_n-A_0\). At a fixed local form the pullback
array has the required value-composition factor and one
\(D\psi_n\) per covector slot. Subtracting the identity
pullback bounds each of the four differences by
\(O(\epsilon_n)\) in value and \(O(n\epsilon_n)\) in the
fixed first derivative. All fixed frame, transition and
cutoff derivatives multiply the corresponding lower
orders. No compatibility assumption from the frozen
periodic model enters this argument.
[E95 (3)–(4)][e95] · [E96, critical input pairs][e96].

At frozen line 4827, call \(\rho\) a smooth cutoff, with
\(0\le\rho\le1\) as in E95. At lines 4840–4842,
the scale \(C\epsilon_n/n\) bounds the value of the
base field. The displacement bound is for the map and
follows by integrating that value bound. Replacing
“displacement” by “value” in that sentence makes the
allocation explicit. These are local wording fixes.

### Joint critical convergence and exact output

**4881–4915.** The fixed localized interpolation is
the E95 estimate following from the uniform \(L^1\)
annular block kernels and the inverse derivative
representation. For high blocks the \(L^8\) bound is
the smaller of the value norm and \(2^{-j}\) times the
first derivative norm, up to a fixed constant. Summing
with weight \(2^{j/2}\) on either side of the displayed
split gives the geometric-mean estimate. The low block
uses the value norm. With the preceding derivative
bounds this gives \(O(\epsilon_n\sqrt n)=O(n^{-1/4})\)
for both input pairs and implies the strict value
smallness required for the solver for large \(n\).
At the displayed block estimate on frozen line 4883,
add \(j\ge1\). The inverse derivative argument concerns
the annular blocks, and the following sentence already
handles the low block separately. This qualification
preserves the stated estimate (5) of E95.
[E95 (5)][e95] · [E96, critical input pairs][e96].

Naturality of curvature contraction gives
\(r_n=S_{A_n}u_n\) for \(u_n=\psi_n^*u_0\).
The projection \(\mathsf P_{A_n}\) used in the
referenced lemma kills \(\operatorname{im}S_{A_n}\).
Thus the normalized vertical equation has zero right
side, so its unique solution on \(N^\perp\) is
\(\phi_n=0\). The horizontal parameter is \(u_n\)
by the fiber left inverse, and the residual is zero.
On the inner cube the cutoffs keep both \(u_0\) and
its sheared evaluation equal to the first coordinate
vector. The rank-one inverse matrix then gives
\[
          u_n=\partial_{x^1}-
                    \epsilon_n\cos(nx^1)\partial_{x^2}.
\]
At the chosen sine maximum the value difference
from \(u_0\) vanishes, so the reference connection
term in its axial derivative is zero. The resulting
\(n\epsilon_n\partial_{x^2}\) detects the asserted
global lower bound through fixed chart–metric
comparison. The proof includes the correct joint
continuity statement and repeats that the input
forcing varies. If the literal variation is to be
shown in the text, E96 provides the optional
one-line check at \(x=0\):
\[
              r_n-r_0=\epsilon_n F_0(e_1,e_2)\,dx^1\ne0 .
\]
The pullback fixes that point but shears its derivative,
and the reference perfect self-dual plane has nonzero
contraction on the simple \(e_1,e_2\) plane.
This optional line substantiates the stated varying-forcing
scope. [E95 (6) and joint topology][e95] ·
[E96, varying forcing and exact output][e96].

### Conjugacy, stationary flow and scope

**4917–4947.** The curvature pullback gives \(Q(A_n)=I\)
and \(T(A_n)=0\). The original Fine gradient is zero
there by self-duality and Bianchi, so the original
paths are stationary.
The auxiliary generator \(Y_n=\chi_{A_n}(u_n)\) has
base projection \(u_n=\psi_n^*u_0\) and zero \(A_n\)
component. These two conditions characterize
\(G_n^*Y_0\), with \(Y_0=\chi_{A_0}(u_0)\).
The direct and inverse maps therefore have the
composition orders \(G_n^{-1}\circ\Theta_{0,t}\circ G_n\)
and \(G_n^{-1}\circ\Theta_{0,-t}\circ G_n\).

On any fixed bounded interval, the smooth reference
flow has uniformly bounded spatial derivatives
through order two. In common chart pairs the
displacements of the two \(G_n\) factors give the
position error \(O_T(\epsilon_n/n)\).
The change in \(D\Theta_{0,t}\) between \(G_n p\) and
\(p\) is bounded by the same error using its fixed
second derivative. The other two matrices differ
from identity by \(O(\epsilon_n)\).
This gives the required \(O_T(\epsilon_n)\) \(C^1\)
error, also with \(t\) replaced by \(-t\). The proof
uses no second derivative of \(G_n\) in this comparison
and clearly distinguishes the auxiliary evolution
from the stationary gradient path.
The last paragraph preserves the selected-inverse
boundary and points out that the \(A_n\) are already
on the actual round orbit via explicit finite maps.
No general inverse or finite placement failure is
claimed. [E95 (7) and scope][e95] ·
[E96, finite maps and stationary flow][e96] ·
[Lead assessment][assess].

## Four E97 precision edits

**4453–4456, zeroth-order block.**
The fixed \(D_1\) is now explicitly a zeroth-order matrix
after moving first-order terms into the flux. This
makes \((I-D_1)v\) in the frozen equation a value
forcing. The wording matches the raw divergence
form and finite-rank value correction in E97.

**4485–4499, ordered absorption.**
The leading coefficient oscillation is absorbed on
each small fixed patch before summing. After the
local mollifier inequalities, the text explicitly
absorbs the \(Ch\|\phi\|_8\) cutoff and frame terms
first. The resulting interpolation inequality is
used next in the global gradient estimate, with the
weak \(L^2\) bound closing the \(W^{1,8}\) endpoint.
These are the two distinct absorption steps identified
in E97, in the correct order.

**4722–4727, scalar spectrum convention.**
The statement specifies nonnegative scalar Laplace
eigenvalues with multiplicity, starting at
\(\lambda_0=0\). This identifies the sign of the
common-volume Rayleigh min–max argument without
changing its \(e^{\pm D}\) factors.

**4743–4755, reversal of both endpoint comparisons.**
The proof now explicitly reverses both limiting
form comparisons on the fixed unadjusted base and
bundle. The metric limit is \(h\), and internal
conjugation fixes the limiting \(Q=I\). Thus reversal
gives the bounds on both the initial metric and
the initial \(Q\), with the same \(D\). The
pointwise-volume equality and normalization are
unchanged. [E97, precision findings][e97] ·
[Frozen manuscript, two audited results][ms].

## Labels and immediate scope

A source check on the same frozen bytes found 278
distinct active labels with no duplicate and 149
distinct internal reference targets with no unresolved
target. The new `prop:horizontal-critical-loss` occurs
once. Its proof and statement use
`lem:varying-slice-inverse`, which resolves uniquely
and defines the normalization and fiber projection used
in the proof. The Lorentz proposition's references to
`lem:varying-slice-inverse` and `prop:fixed-slice-strain`
resolve uniquely. The geometry corollary's references
to `cor:intrinsic-orbit-budget`, `prop:temporal-strain`
and `flow:pointwise-volume` also resolve uniquely.
None of the three checked blocks adds a citation key.
The preceding paragraph preserves the smooth orbit
neighborhood and placement scope. There is no immediate
claim extending this example to a full value basin or
a different solver. No manuscript edit or build was
performed as part of this audit.

[req]: ../research-progress/handoffs/SP4-CME-E100_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E100_RETURN_v1.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e95]: ../notes/95_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md
[e96]: E96_CURVED_ORBIT_EXAMPLE_AUDIT_20261122.md
[e97]: E97_ENDPOINT_GEOMETRY_MANUSCRIPT_AUDIT_20261122.md
[assess]: E95_E96_CURVED_ORBIT_ASSESSMENT_20261122.md
