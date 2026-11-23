# E246 — Global spectral cap manuscript integration audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E audit configured gpt-6.2-sol / ultra. Independent runtime attestation and selected lead settings are unavailable. I authored E244's independent static cap verification, E241's conditional local-flow application and E237's preceding manuscript audit. This packet checks the lead's integration against the assessed inputs and does not supply a second independent proof of my earlier work. I read the frozen E243 derivation under this request after completion of the separate E244 verification. All manuscript line numbers refer to the frozen source. [Request][request] · [Frozen TeX][tex]

## Disposition

Mathematical pass, with a located pointwise-sign wording repair. The compressed proof gives the exact initial cap and its unique maximizing point for every sufficiently small \(\epsilon>0\). The fixed-point time argument in the original native flow gives the stated immediate closed-cap crossing. Strict caps accumulating at one follow by choosing separate short times for individual data. Neither argument uses a varying family of maximum points or a cross-parameter existence theorem. The assessed \(H^6\) convergence is modulo time-dependent smooth bundle automorphisms. [E243–E245 assessment][a243]

## Actual cutoff and sign

At lines 10658–10728 the proposition fixes the standard oriented round sphere, its positive chiral \(SO(3)\) bundle and \(A_{\rm rd}\). The proof fixes \(p\), the oriented old \(K=1\) normal chart and radial gauge independently of \(\epsilon\). In that gauge \(x^i(A_{\rm rd})_i=0\), so differentiating along a ray gives the displayed radial integral. Smoothness of the fixed reference curvature gives \(E_{\rm rd}=O(|x|^2)\), \(DE_{\rm rd}=O(|x|)\). The old linear part of the E235 polynomial is \(\iota_x F^*/2\) and \(F^*-F_0=O(\epsilon)\). The exact E235 coefficients have \(\epsilon\mu_r=O(1)\), and \(G,T\) are bounded and the \(s_i\) bounded away from zero on \(1<r\le2\). Thus \(B,U,V^a=O(\epsilon^{-1})\) with a common constant.

The example cutoff density integrates to \((5/2)(19/20-11/20)=1\), has support inside \((1/2,1)\), and has supremum at most \(5/2\) by positivity and integral one of the mollifier. Therefore \(c\) has the stated plateaus and \(-c'\in[0,5/2]\). The radial cutoff is smooth at the center because the inner plateau is constant, and its extension by zero is smooth at the outer plateau. The difference of the two local connection forms transforms by the adjoint representation. This makes the construction an actual smooth global connection on the original bundle.

For \(a=A_{\rm loc}-A_{\rm rd}\), the linear difference, radial remainder and cubic bound give
\[
 |a|=O(\epsilon|x|+|x|^2+|x|^3/\epsilon),\qquad
 |Da|=O(\epsilon+|x|+|x|^2/\epsilon).
\]
On the support of radius \(R=\epsilon^2\), the derivative hitting the cutoff costs at most \(C/R\) times the undifferentiated bound. This gives the stated \(O(\epsilon^3)\) connection value bound and \(O(\epsilon)\) fixed \(C^1\) bound. Fixed reference covariant derivatives and coordinate derivatives differ by bounded background coefficients multiplying the difference. The actual curvature differs by \(d_{A_{\rm rd}}(c a)+[ca\wedge ca]/2\), hence by \(O(\epsilon)\) in the fixed \(C^0\) norm.

For the sign, the wedge Gram relative to the fixed round volume is \(I\) at \(F_{\rm rd}\) and stays within \(O(\epsilon)\) of \(I\) on the pointwise straight segment of **curvature values** from \(F_{\rm rd}\) to \(F_{A_\epsilon}\). The orientation sign is continuous along that positive segment and hence constant. This matches E240–E242 and E243/E244. In lines **10726–10728**, say “The wedge Gram matrix stays positive along the pointwise curvature segment from \(F_{\rm rd}\) to \(F_{A_\epsilon}\), by this uniform closeness, so positivity and the round-compatible sign follow.” The current “its pointwise segment” can be read as interpolating the Gram matrices alone, which would establish a positivity comparison but would not track the orientation sign of the curvature maps. This is a local wording repair of the proof actually available from closeness. [E240–E242 assessment][a240] · [E243 construction][e243]

## Uniform Taylor estimate on the full cutoff ball

Lines 10730–10769 use a positive fixed Euclidean reference volume in the normalized quotient. Changing that volume multiplies the wedge Gram and its trace by the same positive scalar. The old-to-native uniform internal scaling doubles both in the normalized labels and leaves \(Q\) and its ratio unchanged. The map \(\mathcal Q\) has uniformly bounded first and second derivatives in a fixed coefficient ball about \(F_0\), where \(\mathcal M(F_0)=I\) and the trace has a fixed positive lower bound.

The actual polynomial curvature has even coefficient degrees \(0,2,4,6\). Exterior differentiation of its cubic term and the affine self-bracket are the quadratic term, the affine/cubic cross bracket is the quartic term, and the cubic self-bracket is the sextic term. Thus the displayed sizes \(O(\epsilon^{-1}\ell^2)\), \(O(\epsilon^{-1}\ell^4)\) and \(O(\epsilon^{-2}\ell^6)\) hold with constants independent of \(\ell=|x|\le R\). On that whole ball both \(F^*\) and \(F_{\rm loc}\) are \(O(\epsilon)\) from \(F_0\), and \(F_{\rm loc}-F^*=O(\epsilon^{-1}\ell^2)\). The first-order Taylor expansion of \(\mathcal Q\) along the curvature segment keeps \(D\mathcal Q_{F^*}[F_2]\). The quartic and sextic terms and the quadratic error are \(O(\epsilon^{-2}\ell^4)\). The previous generic Hessian computation identifies that exact quadratic polynomial as \(B\ell^2/2\).

The center adjacent gaps are \(\epsilon/(2+\epsilon)\ge\epsilon/3\) for \(\epsilon\le1\), and the matrix increment from \(Q_r\) to \(Q_{\rm loc}\) is \(O(\epsilon^{-1}\ell^2)\le O(\epsilon^3)\). The ordered min–max bound gives a lower gap \(a_0\epsilon>0\) all along the line segment, for a fixed \(a_0\) and sufficiently small \(\epsilon\). The eigenvalues stay bounded below independently of \(\epsilon\). Differentiating the unit eigenpair along that affine matrix segment gives \(D\lambda_i[Y]=Y_{ii}\) and \(D^2\lambda_i[Y,Y]=2\sum_{j\ne i}|Y_{ji}|^2/(\lambda_i-\lambda_j)\) in its local eigenbasis. The logarithm derivative therefore gives \(D^2 f=O(\epsilon^{-1})\) on the segment, where \(f=\log\rho\). Its quadratic Taylor error is \(O(\epsilon^{-3}\ell^4)\), and its first derivative on the matrix remainder has smaller order \(O(\epsilon^{-2}\ell^4)\). This verifies the displayed scalar expansion and its uniformity. The exact \(df[B]=-|G|^2\), with \(|G|^2\ge (G_{33}-G_{11})^2/2\ge2\), gives strict decrease because \(\epsilon^{-3}\ell^4\le\epsilon\ell^2\) on \(\ell\le\epsilon^2\). No fixed-\(r\) Taylor radius from the preceding local theorem is needed. [E243 Taylor estimate][e243] · [E244 independent estimate][e244]

## Exact annular curvature and spectral estimates

At lines 10771–10803 put \(u=c(\ell/R)\), \(v=(\ell/R)c'(\ell/R)\), \(n=x/\ell\). In the fixed Euclidean coordinate coframe \(d(c(\ell/R))=(v/\ell)n^\flat\). The exact curvature is \(F_{\rm rd}+u\,d_{A_{\rm rd}}a+\frac12u^2[a\wedge a]+(v/\ell)n^\flat\wedge a\). Since \(F_{\rm loc}-F_{\rm rd}=d_{A_{\rm rd}}a+[a\wedge a]/2\), the manuscript's equivalent bracket coefficient \(u(u-1)/2\) has the right sign and factor. At fixed \(x\ne0\) the display defines a pointwise polynomial in \((u,v)\) on \([0,1]\times[-5/2,0]\). Its endpoint \((1,0)\) is exactly the uncut curvature at the same \(x\).

Write \(\Delta F=F^*-F_0\). The leading \(u\) term is \(u\Delta F\) with remainder \(O(\ell+\ell^2/\epsilon)\). The leading \(v\) term is \((v/2)n^\flat\wedge\iota_n\Delta F\) with that same remainder, because the affine remainder in \(a\) is \(O(\ell^2+\ell^3/\epsilon)\) before division by \(\ell\). The bracket is \(O(\epsilon^2\ell^2)\) since \(|a|=O(\epsilon\ell)\) on the support. Differentiating the coefficients \(u,u(u-1)/2,v\) keeps these estimates uniform in \(u,v\). The round \(O(\ell)\) term has zero parameter derivative. This establishes the claimed curvature error and both parameter-derivative errors \(O(\epsilon^2)\) on the annulus, at all angles and endpoints of the parameter rectangle.

For a Euclidean self-dual \(\omega\), writing it as the sum of the part containing \(n^\flat\) and its Euclidean dual gives \((n^\flat\wedge\iota_n\omega)^+=\omega/2\). The full curvature retains the anti-self-dual component, while \(D\mathcal Q_{F_0}\) kills it by the linear wedge pairing with the self-dual \(F_0\). Thus the leading perturbation entering this derivative is \((u+v/4)\Delta F\). Since \(\mathcal Q(F^*)=Q_r\), Taylor expansion at \(F_0\) gives
\[
 D\mathcal Q_{F_0}[\Delta F]
      =Q_r-I+O(\epsilon^2)=\epsilon D+O(\epsilon^2),
 \qquad D=\operatorname{diag}(-1/2,0,1/2).
\]
All parameter curvatures are \(O(\epsilon)\) from \(F_0\) and lie in the same fixed coefficient neighborhood for small \(\epsilon\). Accordingly \(D\mathcal Q_F-D\mathcal Q_{F_0}=O(\epsilon)\), and both parameter derivatives of \(F\) are \(O(\epsilon)\). The chain rule gives the displayed first partials of \(Q\) with uniform errors \(O(\epsilon^2)\), even if \(Q\) has repeated eigenvalues. Lines 10771–10793 could explicitly name the Euclidean flat map and star and insert the identity for \(D\mathcal Q_{F_0}[\Delta F]\) above. The current compressed proof uses them correctly.

For lines 10805–10823, if \(h=u+v/4\ge1/2\), the ordered model eigenvalues \(\ell^0_i\) have gaps at least \(\epsilon/4\), and those of \(Q\) retain gaps at least \(\epsilon/8\) for sufficiently small \(\epsilon\). If \(w_i\) is an actual unit eigenvector for \(\lambda_i\), then for \(j\ne i\),
\[
 (\lambda_i-\ell_j^0)\langle w_i,e_j\rangle
   =\langle (Q-I-\epsilon hD)w_i,e_j\rangle .
\]
The denominator is of order at least \(\epsilon\), and the numerator is \(O(\epsilon^2)\). This supplies the stated transverse \(O(\epsilon)\) bound without differentiating eigenvectors. Rayleigh differentiation of the eigenvalues with \(\partial_u Q=\epsilon D+O(\epsilon^2)\) and \(\partial_v Q=\epsilon D/4+O(\epsilon^2)\) gives the positive derivatives of \(f\) because \(\lambda_i=1+O(\epsilon)\). Along the straight segment from \((1,0)\) to \((u,v)\), \(h\) stays at least \(1/2\). The parameter velocities \(u-1,v\) are nonpositive, so the lower bounds \(\epsilon/2,\epsilon/8\) for the two partials give the displayed upper bound for the change in \(f\). The uncut value at the same noncentral point is already strictly below \(\log r\), including when the parameter segment is constant.

For lines 10823–10832, the low regime includes \(h=0\) and possible multiplicities. There \(|h|\le5/8\), so min–max gives \(\lambda_{\max}-\lambda_{\min}\le(5/8)\epsilon+O(\epsilon^2)\) and \(\lambda_{\min}=1+O(\epsilon)>0\). Dividing the spectral spread by \(\lambda_{\min}\) gives the stated bound on \(\rho-1\). Shrinking the common \(\epsilon_0\) makes this at most \(3\epsilon/4\). The inner ball is the polynomial and the exterior is exactly round. The point \(p\) retains value \(r\), while every other point is strictly below that value. Both annulus endpoints are covered. These bounds check the unique global initial maximum with the requisite uniform constants and no dependence on a chosen higher norm of the input family. [E243 annular proof][e243] · [E244 independent parameter verification][e244]

## Original crossing and precise convergence scope

Lines 10834–10846 apply the referenced small-value basin with \(m=6\) to the smooth actual pair from the cutoff. Its fixed pair values converge uniformly to the reference, which is all that the smallness hypothesis uses. The basin proof at lines 5979–5991 has a common adjusted interval and smoothing time \(T/2\). Each individual smooth datum has an initial adjusted comparison interval that can depend on its higher derivatives. That comparison makes the common adjusted head smooth up to zero. Smooth equivariant ODE recovery starts at the identity and cancels the adjustment in the actual velocity at zero. The stable original tail splices across a genuine smooth overlap by recentered original uniqueness. The ordered inverse in lines 6014–6016 gives the exponential estimate in the fixed reference \(H^6\) norm at each time after the common positive time. Neither a uniform initial \(H^6\) bound nor convergence of the comparison maps is used. [E240–E242 assessment][a240] · [E49–E52 basin][a49]

The cutoff is one near \(p\), preserving its entire local connection germ, so the actual initial original velocity has native log-ratio derivative \(1/2\) there. This uses the corrected local calculation in lines 10627–10645 and the fact that differentiating the curvature quotient along the original path gives the derivative along the local velocity tangent. With fixed \(p\), its initial spectrum is simple for each \(\epsilon>0\). The simple spectrum continues on a short time interval by continuity of the actual smooth quotient. Thus \(t\mapsto f(Q(A_\epsilon(t))(p))\) is smooth up to zero there. Continuity of its derivative gives a datum-dependent interval with derivative at least \(1/4\). Integrating from its initial value \(\log r\) gives \(f(Q(A_\epsilon(t))(p))\ge\log r+t/4>\log r\) throughout that interval. Taking the spatial supremum only increases the ratio. The proof need not follow a spatial maximum or differentiate the global supremum. The alternative one-sided implicit-function branch in the text is already assessed by E240–E242 and is dispensable for the global crossing. At lines 10839–10841, adding “the simple spectrum at \(p\) persists for a short time” would make the derivative-continuity premise explicit.

At lines 10848–10858 take any sequence \(\epsilon_j\downarrow0\) in the fixed small interval. For each supplied trajectory the fixed-point ratio is continuous and begins at \(1+\epsilon_j\), so some short positive time has fixed-point ratio strictly between \(1+\epsilon_j\) and \(1+2\epsilon_j\). A threshold between that value and the initial exact global supremum is initially satisfied strictly and later exceeded. The resulting thresholds approach one by squeeze. The proof compares only one solution at a time. For the automorphism \(j\) over \(\bar j\), the Gram numerator and normalized volume both pull back, giving \(Q(j^*A)(x)=j_E(x)^{-1}Q(A)(\bar j(x))j_E(x)\) with the forward adjoint isometry \(j_E(x)\). Its eigenvalues therefore compose with the onto base map. This verifies the crossing independently of the time-dependent comparisons used for convergence. [E245 application and invariance][e245] · [E243–E245 assessment][a243]

The generic all-r paragraph at lines 10648–10653 retains the local vector-field scope for every finite \(r>1\), and the next statement is explicitly a near-round global cutoff family. The new result makes no assertion for every larger cap, a uniform crossing time, singularity, or initialization off the supplied standard sphere. The convergence assertion at lines 10677–10681 is the assessed modulo-automorphism \(H^6\) result. The note on a round-attracting basin does not import the stronger fixed-limit result. The existing stationary and weighted-margin results retain their distinct stated assumptions.

## Static integrity and release

The frozen TeX is 588116 bytes and all six frozen hashes matched. The round equation block at lines 9153–9280, from its section command up to the next section command, is exactly 4501 bytes with SHA-256 c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab. Active source checking found 399 unique labels and all 550 references resolved, with 301 ordinary references and 249 equation references. The new proposition and its three equation labels each occur once, and its environments and math delimiters balance. The 95 citation-key uses cover 40 manuscript bibliography entries in first-use order, all present in the canonical bibliography. The new proposition adds no external citation. The canonical consumer at lines 388–390 records the new proposition as relying on the existing R15 Fine gradient/action/recovery and R19 smooth-local inputs through the assessed branch proofs, with no fresh source inspection. [Canonical consumer][canonical]

The normal output remains byte-identical to the recorded 157-page checkpoint at this inspection, with 1352720 bytes and SHA-256 9fe90901633f5bae5ec927946a25aed7b1be6ad96b6f4821cc2783a129667d01. This was an identity check only. No build, visual inspection, source retrieval, or promotion of the 159-page scratch output entered this audit. Only the assigned review and return were written. The frozen manuscript source is released to the lead for the located wording repair.

| Input | SHA-256 |
| --- | --- |
| [E246 request][request] | e508d08b8014df32d9fcdbe47e1208875fb7df2166019b9f0da02162170fce60 |
| [Frozen TeX][tex] | 9f0352529530329f7776aef985d58cda6aa283996fe23bf2ef3301254b3ffd13 |
| [E243–E245 assessment][a243] | ddd09db779021672716faf6968fb8065a78c1ac6053ea2d4459f92f3b44669e1 |
| [E243 derivation][e243] | 7c29df2ad8a5acd3aabcce9b79e5a9e9628c784028997ce8512421c4ded50cb0 |
| [E244 independent verification][e244] | 4ebd6efc628bbf9afa4aba141b7c8a85df11509d9059ca774699bb81af4f0eb2 |
| [E245 application][e245] | 51bdbefca995164f60bde3557f23c74d7f964840602d0049fbeab275eebdc5e4 |
| [E240–E242 assessment][a240] | 9d35b2f9b78f432c6068cb2adf70be9c907065d790beba11d563de356140a907 |
| [E49–E52 inherited basin][a49] | f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee |
| [Inherited checkpoint disposition][checkpoint] | d0e42994df775b8f0183728c856d968ff22c111bffecf7e393a65ebdc1763628 |
| [Canonical consumer record at inspection][canonical] | 59cdec3c0d505b53a7f426e5c6c0e173f3080fa3c94f5603f20ac3cac0fb41ee |

[request]: ../research-progress/handoffs/SP4-CME-E246_REQUEST_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[a243]: E243_E245_GLOBAL_RATIO_CAP_ASSESSMENT_20261123.md
[e243]: ../notes/243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md
[e244]: E244_RADIAL_GLOBAL_CAP_VERIFICATION_20261123.md
[e245]: ../notes/245_CONDITIONAL_GLOBAL_RATIO_CAP_CROSSING_20261123.md
[a240]: E240_E242_CLOSED_LOCAL_FLOW_ASSESSMENT_20261123.md
[a49]: E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[checkpoint]: E224_E239_SHARP_MARGIN_MANUSCRIPT_DISPOSITION_20261123.md
[canonical]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
