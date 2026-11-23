# E224 — Sharp spectral manuscript integration audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E audit, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I authored the E222 and E221 audits and earlier contributed E205, E207, E210, E213 and E217 to the inherited arguments. I checked the lead's new manuscript integration against the full frozen analytical inputs and assessed algebra. This review supplies no second independent check of my previous audits. All lines below refer to the frozen TeX. [Request][request] · [Frozen manuscript][tex]

## Disposition

Mathematical pass, with local notation and provenance precisions below. The closed \(7/2\) bound is valid for the stationary derivative sign, independent-variation critical perfection and late spectral convergence. The new gradient estimate applies on each fixed \(1\le r<7/2\), and the occupation convergence criteria use \(1<r<7/2\). The earlier effective \(9/4\) gradient constants and the separate local \(9/4\) velocity test retain their scopes. All four E221 repairs are present.

## Stationary algebra and exact certificate

At lines 2162–2248 and 2317–2342 the identity transfer uses the rank-eight trace-corrected speed, the actual edge-coordinate inverse, full starred Bianchi recovery, and both skew contributions to the derivative form. The old formulas hold on all positive \(d=(1,u,v)\) because the edge reconstruction divides by \(d_i\), the Sylvester equation by \(c(d_i+d_j)\), and the fixed Bianchi solve uses the stated invertible constant operator. Removal of the common positive curvature factor preserves invertibility. The diagonal trace correction is also invertible between its indicated subspaces. None of these operations divides by an eigenvalue difference. The full form is \(4c^2\sum_a Z_a^{\mathsf T}GZ_a\) and \(M=2LG\) with \(L>0\). The sign calculation for \(1\le u\le v\le3/2\) stays within its original range. [Algebra assessment][algebra]

At lines 2344–2404 the substitution \(v=1+ha,\ u=1+hab\), \(h=(\sqrt{14}-2)/2=\sqrt{7/2}-1\), covers the whole triangle. When \(v>1\), \(a=(v-1)/h\) and \(b=(u-1)/(v-1)\). When \(v=1\) the edge \(a=0\) maps to the round point. The three leading minors are for edge order \(12,13,23\). Their natural tensor Bernstein bidegrees and positive/zero/negative counts are \((13,9):(140,0,0)\), \((26,16):(459,0,0)\) and \((37,23):(911,1,0)\). These are the assessed \(1511\) coefficients and the three stated denominators match the assessed exact records. For opposite nonzero signs in \(x+y\sqrt{14}\), the sign formula follows by multiplying by \(x-y\sqrt{14}\), whose sign is that of \(x\). The monomial substitution gives the stated individual contribution \(c_{mn}\binom mi\binom njh^{i+j}\) to the coefficient of \(a^{i+j}b^i\). Summation over all contributions gives the power coefficients.

The nonnegative Bernstein basis partitions unity. With positive coefficients for the first two leading minors, the leading \(2\times2\) block is positive throughout. The sole zero coefficient of the determinant has index \((37,0)\) and weight \(a^{37}(1-b)^{23}\), which is one exactly at \((a,b)=(1,0)\). Thus the determinant, and hence the remaining scalar Schur complement, is positive off that corner and zero at it. The scalar inertia changes from \((3,0,0)\) to \((2,1,0)\). The four identical tangent components give \((12,0,0)\) and \((8,4,0)\), including multiplicity strata and the collapsed round edge.

At lines 2406–2414, the axial vector \(k=(-v/2,1,-1)^{\mathsf T}\) at \(v=t=\sqrt{7/2}\) is in the one-dimensional scalar radical. Taking any one of the four coframe components yields precisely the stated covector radical. Away from the endpoint, \((2k)^{\mathsf T}M(1,v)(2k)=8Lv^2(7-2v^2)\) yields \(k^{\mathsf T}Gk=v^2(7-2v^2)\), so each axial \(v^2>7/2\) supplies a negative pointwise stationary direction. This is sharpness of the universal pointwise derivative sign. The proof uses a model first derivative and yields no existence result for nonperfect critical connections beyond the bound. [Algebra assessment][algebra]

## Certificate provenance and source comparison

The prose at lines 2378–2390 names the corrected v2 generator and the original canonical JSON. The assessed correction replaces \(p=11/(12t),r=-1/(12t)\) with \(p=16/(11t),r=5/(11t)\) in the intermediate axial basis. Both entries shift by \(71/(132t)\), which cancels in \(B_{10}-B_{11}\) and \(B_{16}-B_{15}\). The other two radical combinations use neither pair. The frozen v1 remains historical and the rendered certificate quantities are unaffected. The code passages inspected for provenance were the v2 endpoint entries, E219's header, leading-minor construction, triangular conversion and backward expansion, and endpoint velocity and corrected-basis checks. E219 reuses the assessed scalar block and quaternion matrices, then substitutes the matrix entries before its Leibniz minors, solves the triangular exact coefficient equations and compares after reverse expansion. Its independence is at that certificate-verification level. This packet did not replay the scripts or retrieve new primary sources. [Algebra assessment][algebra] · [Corrected generator][generator] · [Canonical JSON][json] · [Independent verifier][verifier]

Lines 2724–2737 preserve the source distinction. Fine's inspected arXiv:1111.5005v2 §1.6 supplies the historical question for the defect functional. Fine–Krasnov–Panov's published Theorem 4.14 concerns the connection-volume action with the supplied positive definite connection on a compact four-manifold satisfying \(d_A\Phi_A=0\). The pointwise stationary-sign, critical theorem and temporal criteria are branch arguments. The axial statement remains a separate repeated-spectrum result and the local obstruction's Fine–Yao citation is for a different triple flow. The existing manuscript keys agree with the canonical bibliography. No new claim about open status or novelty enters. [Source comparison][sources] · [Primary source bibliography][bib]

## Stationary critical theorem

Lines 2419–2481 impose smoothness, closedness, orientation, the positive curvature-plane convention and the round-compatible sign, without a homotopy-sphere assumption. The independent connection first variation is the actual old gradient speed. The topological shift integrates to zero under variation because \(\delta\mu_A=\frac23\langle d_Aa\wedge F\rangle\) is exact by Bianchi. The polar identification and surjectivity of \(SO(4)\) onto the positive chiral \(SO(3)\) permit pointwise ordered model frames including repeated eigenvalues. All fields at issue are tensorial in those values. Common \(K>0\) cancels in the Bianchi solve and rescales speed by a positive scalar. For the constant critical path the old energy identity is a sum of the negatives of two nonnegative integrals, with the coefficient \(48K\sqrt{\det Q}\) strictly positive in the reaction term. This forces \(Q=I\) even at the semidefinite endpoint. Compatibility yields \(W^+=0\), \(\operatorname{Ric}_0=0\), \(s_{\widehat g}=12K\). The native metric is \(2K\widehat g\), its energy is \(2\mathcal P\), and \(Q\) and criticality are unchanged. Hence \(s_{\rm native}=6\). [Application assessment][applications] · [Frozen E220][e220]

## Strict gradient estimates

At lines 2617–2721 the continuous full form and continuous speed operator on the compact spectral triangle and a fixed tensor unit sphere define a nonempty compact unit zero-speed set. Rank eight and the model frame calculation handle repeated eigenvalues without differentiating eigenvectors. Strict positivity on every fixed \(r<7/2\) yields \(\kappa(r)>0\), with the round value \(4\). The pointwise radical makes the corresponding closed \(7/2\) minimum zero.

I checked the constants using the displayed bounds and inherited right inverse. Trace three and \(u^2,v^2\le7/2\) give \(m=c^2\ge3/8\) and \(\det Q\ge(3/8)^3=27/512>1/25\). The diagonal right inverse cost \(3|W|^2=3|V_{\rm o}|^2/(16K^2c^2)\) is at most \(|V_{\rm o}|^2/(2K^2)\). Orthogonal projection minimizes the cost. The unrestricted principal and commutator bounds give \(12+4\sqrt6(\sqrt{7/2}+\sqrt6\,7/2)=96+4\sqrt{21}\le120\). The symmetric full form therefore has mixed bound \(2L_0|X_0||X_\perp|\). Using Young's inequality with \(\kappa/2\) on the kernel component and restoring \(|X|^2\) gives
\[
\mathfrak R_Q(X)\ge\frac{\kappa(r)}2|X|^2-\frac{C(r)}{K^2}|V_{\rm o}|^2,\qquad
C(r)=\tfrac12\left(\frac{2L_0^2}{\kappa(r)}+L_0+\frac{\kappa(r)}2\right).
\]
The affine tangent path supplies the instantaneous identity already derived in the preceding proposition. Twice the negative speed cost integrated against \(\mu_{\rm o}=2K^2dV_{\widehat g}\) gives \(4C(r)\mathscr D_{\rm o}\). The reaction contributes \(48K\mathcal P/5\). With the internal factor two in the native velocity norm, \(g_{\rm n}=2K\widehat g\), \(V_{\rm n}=V_{\rm o}/(2K)\), \(dV_{\rm n}=2\mu_{\rm o}\) and the native clock \(2Kt\), one has \(\mathscr D=\mathscr D_{\rm o}/K,\ \mathscr G=\mathscr G_{\rm o}/K,\ \mathscr E=2\mathcal P\). Thus \((1+4C)\mathscr D\ge\kappa\mathscr G+(24/5)\mathscr E\), yielding the stated \(\gamma,\beta\) and weighted interval inequality. The use of coarse auxiliary constants on the closed cone supplies no positive endpoint \(\kappa\).

Lines 2483–2615 retain the explicit \(9/4\) subcase with \(\kappa=32768/2205225,\ L_0=81,\ C_0=(11/32)(2L_0^2/\kappa+L_0+\kappa/2)\), and \(\gamma=48/[5(1+4C_0)]\), \(\beta=\kappa/(1+4C_0)\). Its stronger old determinant lower bound \(2/5\) accounts for the different coefficient of energy. All uses of this proposition stay within \(\sup\rho(Q)\le9/4\). [Application assessment][applications] · [Analytical audit][e222]

## Late sequence and occupation criteria

Lines 6488–6585 use the same unshifted geometric sequence as the preceding late-critical theorem. Positive normalized \(C^0\) pair accumulation and the strong adjusted trace imply convergence of the extreme eigenvalue ratio. Equivariance and Rayleigh quotients give the displayed conjugacy and ratio bound with constant \(m_0^{-1}+3m_0^{-2}\). The compact smooth strip \([\epsilon,s_0]\) admits the equivariant flow of the negative adjusting generator, so the two endpoints have equal spatial ratio suprema. Letting \(\epsilon\downarrow0\) transfers the closed bound to a smooth critical slice through the scalar equality. The proof requires neither a limiting gauge at zero nor a ratio bound at intervening original times. Perfection at that slice gives zero limiting energy. With \(K_n=h_n\circ j_n(s_0)^{-1}\) and \(L=\Phi\circ K_n^{-1}\), \((L^{-1})^*=(\Phi^{-1})^*K_n^*\) is the direction that enters the round basin. A fixed sufficiently late index gives \(A(t)=L^*B(t-t_b)\) and limit \((b_\infty\circ L)^*(A_0,F_0)\). The native exponent \(\lambda_1(G_0)/2\) and datum-dependent higher constants are inherited from the fixed round tail. The independent geometric late-sequence hypotheses already exclude finite maximal lifetime.

Lines 6589–6686 use a fixed \(1<r<7/2\). The global spatial ratio is continuous on compact smooth time slabs by uniform continuity and the positive eigenvalue floor, so the pinched time set is measurable. The a.e. product rule for the absolutely continuous integrating factor applies even to a set with empty interior and to zero energy. The occupation inequality holds on the supplied original lifespan on a general closed base. The homotopy-sphere geometric hypotheses are additional for the convergence tests. Infinite accumulated time drives the limiting energy to zero. The finite observation through a geometrically qualifying unshifted \(t_n\) gives strict entry below the inherited non-effective \(\delta(P_0,D_0)\). Recentered smooth uniqueness identifies the rest of the original solution. No time alignment between visits and geometric slices is necessary. The finite condition uses only accumulated past time. The resulting uniform \(Q\to I\) implies eventual membership in \(S\), since \((1+\epsilon)/(1-\epsilon)=(3r+1)/(r+3)<r\) for \(\epsilon=(r-1)/(2(r+1))\). The occupation energy rate and the eventual native round rate remain distinct. [Application assessment][applications] · [Analytical audit][e222]

## Ratio inventory and E221 repairs

| Frozen lines | Role |
| --- | --- |
| 94–102, 393–405 | Closed \(7/2\) critical and late statements, strict-subregion gradient and occupation statements, explicit \(9/4\) constants. |
| 2162, 2339, 2487–2615, 2714–2717 | Old square-root triangle ends at \(3/2\), hence old \(9/4\) coercivity. The old sign does not underwrite the new certificate. |
| 2321–2332, 2412, 2428 | Closed \(7/2\) algebraic sign and critical theorem. Larger axial ratios enter solely as sharpness tests on the pointwise kernel. |
| 2619–2664, 2669–2682, 2717 | Strict fixed \(r\) gives positive \(\kappa\). The closed ratio is used for coarse bounds or to identify the vanishing endpoint minimum. |
| 6495, 6531, 6554, 6594, 6683 | Closed late limsup and transported bound, strictly interior occupation cutoff, optional substitution of the explicit constants at \(r=9/4\). |
| 10102, 10220 | One actual local simple-spectrum \(9/4\) maximum with positive original native directional derivative. Its bound is specific to this \(9/4\) datum. |

All four E221 repairs appear. Lines 10139–10146 give the ordered self-dual triple, wedge normalization and quaternion sign. Lines 10167–10186 give the affine bracket pairing, its subtraction and trace correction in the curvature quotient, and the normalization \(\widehat g(0)=g_{\rm eucl}\). Lines 10195–10198 explicitly evaluate the local tangent \(A+\sigma V_{\rm old}(A)\) and its first curvature derivative. Lines 10230–10233 identify the following subsection as the separate global static example. The jet retains the exact local \(9/4\) scalar, the directional bound \(>12119/14364\) in native time, and its open-ball scope. [E221 audit][e221] · [Jet assessment][jet]

## Located lead edits

1. At line 2329, replace \(W\in T^*M\) with “\(W\) is an arbitrary tangent covector in the fixed model four-space,” or locally name that space and use its dual. The lemma is a pointwise model statement with no bound \(M\) as base manifold.
2. At line 2367 use “contributes” for the specified coefficient of \(a^{i+j}b^i\) and say to add contributions with the same powers. The current expression is correct term by term.
3. At lines 2738, 6585–6588 and 6680–6686, align the comments with the integrated range. For the stationary comparison, cite E199/E201 for axial and E202–E204 for the earlier range alongside E218/E219 and E220/E222 for the new threshold. Place E205/E206 trace, transport and tail with E218/E219 and E220/E222's closed \(7/2\) input immediately after the late corollary. Place E212/E213's occupation argument and the E220/E222 strict-range estimate together after the occupation corollary. Keep E209/E210 attached to the separate explicit \(9/4\) constants.
4. At lines 102 and 401, “for ratio at most \(9/4\)” makes the explicit bound's scope clearer. At lines 10168–10169, attaching the component \(i\) to the text introducing the symmetrized pairing makes the two free internal indices on its right side explicit. Both are optional precisions.

These edits concern notation and provenance. The lead independently reported a layout issue in the filename sentence at lines 2378–2390. Rendering was outside this audit.

## Static integrity and release

The protected round-defect section from its section command through the byte before the next section command is exactly 4501 bytes, SHA-256 c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab. The active TeX contains 383 unique labels, 521 reference calls with no unresolved targets and 95 citation-key uses covering all 40 bibliography entries in first-use order. The seven frozen input identities below match the request. The certificate artifact hashes were also checked for identity. Only this assigned review and return were written. The frozen TeX is released to the lead.

| Input | SHA-256 |
| --- | --- |
| [E224 request v1][request] | 39d4bdcdad81daa40fb3f6f8920d3152709c5c50c7d6b1e998aceeedadcd01e6 |
| [Frozen manuscript][tex] | 5ddcf80e79a7ca7d7dc997633803459bfd1d0992074ddecb9ff934045a5e8f8c |
| [E218/E219 assessment][algebra] | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E220/E222 assessment][applications] | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E220 frozen note][e220] | c9e3e7ca52f86c830e391f9c39d84207a455c95772001bb561c607842be010f2 |
| [E222 audit][e222] | dcd7282b264ce8b0db80ae86d6b4eab1cf9572e5649a60a13353b57869bd50a3 |
| [E221 audit][e221] | 95fa540da36c746e31b1bc835347c1f22fcc35347ea707131512ad541d9408bb |
| [E215/E217 assessment][jet] | 26c877a82aa97c12fc85e95d58524301b2c1dbe2b58a1c8a3e6d5d2973679c4a |
| [Corrected v2 generator][generator] | da2fc957f844eecbd91a9366ee570b60eacd2352d0a92e3f289894a628516092 |
| [Canonical certificate JSON][json] | 77dbb9396eda03efeeafa375eeaa11e7bba31a3773e0e9f80309df54b2c1cc55 |
| [Independent verifier][verifier] | 446e8d4bf2b77f68bbae3345b5db65eccdeff73b22c933631bd0d8fada1252ae |

[request]: ../research-progress/handoffs/SP4-CME-E224_REQUEST_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[algebra]: E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md
[applications]: E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md
[e220]: ../notes/220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md
[e222]: E222_SHARP_SPECTRAL_APPLICATIONS_AUDIT_20261123.md
[e221]: E221_SPECTRAL_RATIO_MANUSCRIPT_AUDIT_20261123.md
[jet]: E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md
[generator]: ../numerics/e218_stationary_spectral_range_v2.py
[json]: ../numerics/e218_stationary_spectral_range.json
[verifier]: ../numerics/e219_sharp_stationary_verify.py
[sources]: E207_SOURCE_COMPARISON_ASSESSMENT_20261123.md
[bib]: ../../../../references/references.bib
