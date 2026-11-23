# E214 Audit of the integrated intermittent spectral return

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable. I
authored E204, E208 and E211. E212 and its independent E213 audit
were authored by other helpers.

## Disposition

**Pass.** The corollary uses the assessed static native estimate,
and its two convergence tests use the assessed geometric sequence
and uniform entry theorems. The manuscript gives the correct
interpretation of the finite test and incorporates all E211
repairs. No further TeX repair is needed within this audit.

## Instantaneous input and the occupation estimate

At TeX 2377–2403, the static proposition applies on a closed
connected oriented smooth four-manifold to any smooth definite
connection in the positive-plane, round-compatible class with
\(\sup_M\rho(Q)\le 9/4\). Its \(\mathscr E,\mathscr D,\mathscr G\)
use the native reconstructed measure and metric. The velocity
norm uses the native negative-Killing pairing. The derivative
integral uses the Frobenius endomorphism norm. The proposition
uses the precise E209/E210 constants
\[
 \kappa=\frac{32768}{2205225},\qquad L_0=81,\qquad
 C_0=\frac{11}{32}\left(\frac{2L_0^2}{\kappa}+L_0+\frac\kappa2\right),
 \qquad
 \gamma=\frac{48}{5(1+4C_0)},\qquad \beta=\frac{\kappa}{1+4C_0}.
\]
The occupation proof at 6419–6425 invokes the static estimate
\(\mathscr D\ge\gamma\mathscr E+\beta\mathscr G\) at each qualifying
time. This argument requires only the instantaneous bound.
[E209/E210 assessment](E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md).

At 6374–6388 and 6409–6417, \(S\) is the subset of the supplied
original native lifespan on which every spatial point satisfies
the closed ratio bound. Positivity and continuity of the
symmetric \(Q\) on each compact product \(M\times[t_0,t_1]\)
give a positive slab minimum of \(\lambda_{\min}\). The extreme
eigenvalues are continuous also through repeated spectra, and
the ratio is uniformly continuous on the product. The difference
of the spatial suprema at two times is bounded by the supremum
of the pointwise difference. Thus \(S\) is relatively closed
and Borel over the actual lifespan. The slab minimum is local
to that compact slab.

For \(\Theta=\Theta_{t_0}\), the indicator integral is
\(1\)-Lipschitz, absolutely continuous, and has
\(\Theta'=\mathbf 1_S\) almost everywhere. The native identity
\(\mathscr E'=-\mathscr D\), the static estimate on \(S\), and
\(\mathscr D\ge0\) everywhere give
\(\mathscr E'+\mathbf1_S(\gamma\mathscr E+\beta\mathscr G)\le0\).
The factor \(f=e^{\gamma\Theta}\) and the product \(f\mathscr E\)
are absolutely continuous on compact slabs, with
\(f'=\gamma\mathbf1_S f\) almost everywhere. Hence
\((f\mathscr E)'\le-\beta f\mathbf1_S\mathscr G\). Integration
using \(f(t_0)=1\) proves the displayed estimate at every
\(t<T_*\), including \(t=t_0\). The argument also covers zero
initial energy, null \(S\), and sets with empty interior. The
base and lifespan hypotheses for this energy result stay at
the general supplied smooth-flow scope.
[E212/E213 assessment](E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md).

## Geometric sequence and round tail

TeX 6390–6407 and 6436–6449 add the hypotheses of the late
critical accumulation theorem (6138–6149). The original
trajectory is on a fixed smooth principal \(SO(3)\) bundle over a
closed connected oriented smooth homotopy four-sphere. The same
sequence \(t_n\uparrow T_*\) carries both the native bound
\(\sup_M\Psi(A(t_n))\le P_0\) and the native diameter bound
\(\operatorname{diam}(M,g_{A(t_n)})\le D_0\). That theorem
gives \(T_*=\infty\) before either occupation test is used.

1. **Infinite occupation.** The nonnegative energy is at most
   \(e^{-\gamma\Theta(t)}\mathscr E(t_0)\). If \(\Theta(t)\) tends
   to infinity this implies \(\mathscr E_\infty=0\). The
   zero-energy branch of late critical accumulation (6167–6173)
   gives the actual original fixed round tail.
2. **Finite observation.** At a single qualifying unshifted
   \(t_n\ge t_0\), the strict inequality
   \(e^{-\gamma\Theta(t_n)}\mathscr E(t_0)<\delta(P_0,D_0)\)
   makes the energy of the actual datum \(A(t_n)\) strictly
   subthreshold, with both geometric bounds already available.
   The uniform entry theorem (6015–6027) supplies an original
   round-convergent solution from that slice. Recentered
   smooth original uniqueness identifies its entire global
   tail with the supplied one. The qualifying slice may
   occur outside \(S\).

In either case the limiting connection and curvature are the
pullback of one round pair by one fixed smooth bundle
identification covering an orientation-preserving diffeomorphism.
The available native rate
\(\lambda_1(G_0)/2\) follows from the round smooth limit theorem
at 5564–5583. A fixed pullback and a finite time translation
alter only the constants at each spatial order. At 6457–6459
the manuscript distinguishes this pair rate from the occupation
energy rate \(\gamma\).
[E212/E213 assessment](E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md).

## Finite observation and scope

The frozen E212 note at line 91 says “This condition can hold
with finite total pinched time.” E213 and the lead assessment
reject that assertion about the resulting full trajectory.
TeX 6452–6455 correctly limits the test's time input to occupation
through \(t_n\), and then states the eventual full occupation
consequence. Smooth convergence of the original curvature to
the fixed perfect round bundle pullback gives uniform convergence
of the native wedge quotient to \(I\). Eventually
\(\|Q-I\|_{\rm op}\le1/4\), so the ratio is at most \(5/3<9/4\)
and \(S\) contains a whole tail interval of infinite measure.
Future full occupation is a consequence of the round conclusion.
[Frozen E212 note](../notes/212_CONDITIONAL_INTERMITTENT_SPECTRAL_RETURN_20261123.md) ·
[E213 audit](E213_INTERMITTENT_SPECTRAL_RETURN_AUDIT_20261123.md).

The abstract at 91–101 ties late spectral convergence to the
bounded late sequence and summarizes the explicit occupation
energy estimate. The introduction at 387–402 introduces the
intermittent criterion in the context of that geometric
sequence, with no alignment of its times required. The body
quantifies the two sufficient tests and states that the visit
occurrence and actual waiting time are unproved (6456–6457).
The static estimate's stated scope (2505–2508), the source
comparison (2511–2520), and the abstract (121–124) preserve
the limits on spectral preservation and initial-data construction.

## E211 repair follow-through

- **Trace delimiter, 6192–6198.** The strong \(C^0\) pair trace
  \((A_*,F_*)\) has its closing inline math delimiter. The
  referenced rough-local and uniform value-radius interfaces
  are intact.
- **Uniform operator bound, 2435–2445.** The maximum eigenvalue
  is \(M_*=\lambda_{\max}(Q)\), distinct from the base \(M\).
  Both homogeneous inequalities are non-strict, allowing
  \(X=0\). The scalar constant and polarization bound are
  as assessed.
- **Stationary referent and comparator, 2511–2519.** The
  paragraph explicitly names the stationary spectral pinching
  theorem. Fine's v2 §1.6 concerns nonperfect critical points
  of the connection energy. The separate FKP volume-action
  comparator is Theorem 4.14 for positive definite connections
  on compact four-manifolds satisfying \(d_A\Phi_A=0\). The
  text uses the comparator at the assessed scope. The
  occupation proof uses the pinched gradient proposition.
  [E211 audit](E211_QUANTITATIVE_SPECTRAL_MANUSCRIPT_AUDIT_20261123.md).

## Mechanical checks and versions

The TeX has 378 distinct label declarations and 510 resolved
reference instances. All 40 citation keys resolve without
duplicate bibliography keys. The new corollary and two equation
labels are unique, each with its intended reference. The exact
4,501-byte round block at 8603–8730, from the closed defect
section title through the bytes before the next section, has
SHA-256 c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab.
The frozen source is released to the lead after this audit.
The work was limited to these two audit records and static
manuscript inspection.

| Artifact | SHA-256 |
| --- | --- |
| [E214 request](../research-progress/handoffs/SP4-CME-E214_REQUEST_v1.md) | c4eb66812d98aa0f8c773adcb58f6634baa46af1bb494ef43b1771d57b39f146 |
| [Frozen TeX](../manuscript/chiral_curvature_and_metric_evolution.tex) | 334b666e5a0058048154d3a3e60e094ea02764f99c74f9e1e5eb536d787531fd |
| [E212/E213 assessment](E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md) | 63942e67c937280a0ea88f635d79be51c81b6e54f873e6b1bccf9ad2529ead3c |
| [E211 audit](E211_QUANTITATIVE_SPECTRAL_MANUSCRIPT_AUDIT_20261123.md) | e9e2b35b53a31c5a76c07e4e368682b63f2f582c1178b9f5aa8a324cc9b04422 |
| [E209/E210 assessment](E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md) | 83df0cc9c6157a847c23c875c5f8078deb89ff63f72db97836f2b998557628e1 |
| [E205/E206 assessment](E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) | bca701d680e3e0f66dca5c56ba4caa3edb43c0005b8a94d7db4c2225b49858aa |
| [Frozen E212 note](../notes/212_CONDITIONAL_INTERMITTENT_SPECTRAL_RETURN_20261123.md) | 581dcc209b7f2683ad0a676f5a225d3c41f675c47578a9bb2871dc2ce1ca0a99 |
| [E213 audit](E213_INTERMITTENT_SPECTRAL_RETURN_AUDIT_20261123.md) | 341c4f3c7fbeceeacbb62f4637b80c73f1fef0179d5b9b24fefe362ff7f4d160 |
