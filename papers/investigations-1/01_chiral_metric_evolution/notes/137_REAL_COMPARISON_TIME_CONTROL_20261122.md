# E137 — Time control of the complete real direction-sphere comparison

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E84 among the frozen notes and the E132/E134 head and tail audits. Upstream I authored E42 and E53 and supplied nonlinear volume verification in E02C. I did not author E03A, E09, E14, E129 or E131. This is a bounded implication of the separately assessed endpoint and real comparison identities. No new primary passage was inspected. [Request and frozen identities][req], [B71][b71], [return][ret].

## Native setting and the extra time integrals

Fix the smooth closed oriented standard round Riemannian \(S^4\), its positive perfect chiral \(\mathrm{SO}(3)\) reference \(A_0\), curvature \(F_0\), positive internal pairing from the negative Killing form and native reference metric \(G\) of curvature \(1/2\). All times below are native \(\tau\). Let \(A(\tau)\) be the supplied global smooth original solution in the assessed round value basin and \(g=g_A^{\rm F}\) its live Riemannian metric. All base norms in the comparison use \(g\). Internal matrices use the Frobenius norm, and norms on multi-slot tensors sum squared orthonormal components. Put \(q=Q-I\), \(S=Q^{1/2}\), and
\[
 v=\|A_{\rm in}-A_0\|_{\infty;0}+\|F_{A_{\rm in}}-F_0\|_{\infty;0},
 \qquad
 \ell=\|T(A_{\rm in})\|_{L^{4,1}(g_{A_{\rm in}}^{\rm F})},\qquad
 \mathcal G=|\nabla^A T|_g+|T|_g^2 .
\]
The live Lorentz strain norm has the inherited \(4\int_0^\infty \mu(\{|T|>\lambda\})^{1/4}d\lambda\) convention. The endpoint theorem gives \(J=\int_0^\infty\sup_M\mathcal G\,d\tau\le C\ell\), \(M=S^4\). [Whole-time assessment][a131].

For the additional linear strain and value integrals, start on the assessed adjusted head \([0,h]\) with \(E_h(q)\le C\ell\). Fixed reconstruction of the E57 partition pieces and the E53 block Bernstein gain \(2^{j/2}\) to \(L^\infty\) give
\[
 \int_0^h(\|q\|_\infty+\|D_0q\|_\infty)\,d\tau
 \le C\sum_{\alpha,j}2^{(1/2+2)j}
         \int_0^h\|\Delta_j q_\alpha\|_{L^8}\,d\tau
 \le C\ell .
\]
Here \(D_0\) is the fixed product derivative, and the unweighted derivative orders zero and one are both bounded by the \(H_h(q)\) weight, including its inhomogeneous low block. A derivative on a fixed reconstruction multiplier costs only a lower block power. The exact adjusted strain gives \(|T|_g\le C(|D_0q|_0+|q|)\) since the pair lies in a fixed small tube and \(Q^{-1/2}\) is uniformly bounded there. On the stable adjusted tail \(s=\tau-h\), its finite defect-sensitive bound is \(\|q(s)\|_{H^5}\le C_h\ell e^{-6s}\). Fixed Sobolev embedding gives \(C^2\), and the stable small-value background gives the same \(|T|_g\le C(|D_0q|_0+|q|)\). These estimates give integrable tails separately for \(q\) and \(T\). Exact same-time pullback preserves their pointwise live moduli up to base composition. Consequently
\[
       \int_0^\infty\bigl(\|q\|_\infty+\|T\|_{\infty,g}\bigr)\,d\tau
                          \le C_h\ell .
 \tag{1}
\]
This uses the head and tail norms rather than estimating a time \(L^1\) norm from the squared strain on the infinite interval. [E129 (1), (4) and dyadic reconstruction][e129], [head assessment][a129], [E131 (7), (14)][e131], [E84][e84].

The same adjusted head and tail give a uniform **value** bound \(\|q(\tau)\|_\infty\le C_h v\). On the head use the order-zero small-pair estimate in E129, and on the tail use its \(H^{10}\) stable background estimate, the actual curvature identity and the smooth value map to \(Q\). These bounds are transferred slice by slice. If necessary, reduce only the fixed allowed \(v\) radius to ensure \(\|q(\tau)\|_\infty\le1/8\) throughout. We use the resulting fixed spectral interval \([7/8,9/8]\) for smooth parameter norms of fiber maps. Constants may depend on this fixed tube, the finite atlas, \(h\) and the assessed estimates, and are independent of \(\ell\) and initial higher derivatives. [E129, independent pair jet][e129], [E131, stable background][e131].

## Native geometry and whole-fiber maps

In the old manuscript conventions let \(\widehat\Sigma\) be the norm-\(\sqrt2\) self-dual triple, \(F^{\rm old}=-KS\widehat\Sigma\) and \(c=2K\). Native orthonormal internal frames are the bracket-orthonormal old frames divided by \(\sqrt2\), so curvature components are multiplied by \(\sqrt2\), the wedge volume doubles, and \(Q\) is unchanged. Thus
\[
 g=c\widehat g,\qquad \tau=ct,\qquad
 \Sigma_g=c\widehat\Sigma,\qquad
 \sigma=\Sigma_g/\sqrt2,\qquad F=-S\sigma .
\]
The triple \(\sigma\) identifies the native Euclidean \(E\) isometrically with \(\Lambda_g^+\) in the round-calibrated orientation. The base Levi-Civita connection is unchanged by this constant scale, and \(\Gamma\) denotes its positive chiral connection in these \(E\)-labels. Set \(b=A-\Gamma\), \(B_X=\operatorname{ad}(b_X)\). The native bracket is \(1/\sqrt2\) times the native Euclidean cross product. Thus \(|B_X|_{\rm HS}=|b_X|_{\rm native}\) and \(\|B_X\|_{\rm op}=|b_X|_{\rm native}/\sqrt2\). The sphere complex structure uses the unit Euclidean cross product \(j_f v=f\times v\), independently of that bracket scale. Both direction spheres have the unit round metric and area \(4\pi\). [E03A, sign and frame conventions][e03a], [E03 assessment][a03], [canonical Fine normalization, E65 reinspection][finecanon].

In those \(E\)-labels the actual curvature-ray relabeling with the fixed round sign removed is
\[
 \Phi(x,u)=(x,\phi_x(u)),\qquad \phi_x(u)=Su/|Su|,\qquad
 \phi_x^{-1}(f)=S^{-1}f/|S^{-1}f|.
 \tag{2}
\]
Positivity makes both maps smooth on the whole sphere. The path \((1-r)I+rS\) gives an isotopy of fiber diffeomorphisms to the identity, so the fiber orientation and degree are positive and one, respectively. For \(f=\phi_x(u)\), \(P_f=I-f\otimes f\),
\[
 d_u\phi(v)=P_fSv/|Su|\quad (v\perp u).
\]
With \(m=\lambda_{\min}Q\), \(M_*=\lambda_{\max}Q\), all tangent singular values are between \(D_x^{-1}\) and \(D_x\), where the maximum same-direction ratio is \(D_x=\sqrt{M_*/m}\). The lower stretch bound follows from the distance to the line \(Su\) and the upper from the largest eigenvalue of \(S\). The maximal ratio is attained at a middle eigenvector as in the pointwise check. In the fixed spectral interval with \(m_*=7/8\),
\[
 D_x-1=\frac{M_*-m}{\sqrt m(\sqrt{M_*}+\sqrt m)}
          \le m_*^{-1}|q| .
 \tag{3}
\]
It bounds the absolute deviation of any stretch from one. The target vertical complex-structure discrepancy is
\(j^\Phi_f-j_f=(d_u\phi)j_u(d_u\phi)^{-1}-j_f\).
Choosing oriented singular frames for \(d_u\phi\) gives its operator norm exactly the tangent stretch ratio at \(u\) minus one. Thus its sup on the fiber is \(D_x-1\). [Direction distortion check][dist], [E03A (2)–(3)][e03a].

For the deviation \(\phi-\mathrm{Id}\) and its inverse counterpart, use \(E_x\)-valued maps on the unit source sphere with fixed ambient fiber derivative and round covariant domain slots. For \(j^\Phi-j\) use the intrinsic round covariant derivatives on the target sphere. Through each of orders \(j=0,1,2\), their norms are bounded by \(C_j|q|\). To see this, the formulas (2) and \(d\phi\,j\,(d\phi)^{-1}\) are smooth in \((S,u)\), or \((S,f)\) after inversion, on the compact positive spectral tube times the whole sphere. The tangent maps in the last expression are between their actual tangent planes, and can be extended as ambient maps by zero on the radial complement. Subtract the quantities at \(S=I\) and use the mean value formula in \(S\) after the specified fiber derivatives. A choice of \(C_j\) is the sup of the corresponding first \(S\)-derivative of each order-\(j\) fiber expression on that compact tube, times the fixed bound for \(|S-I|/|q|\). The tube is convex for this segment. Thus (1) bounds the time integral of the sup of each finite fiber norm and of (3) by \(C\ell\). The stretch ratio is used as a supremum, with no eigenframe differentiability assumption.

## Real horizontal comparison, moments and a specified base derivative

For live base \(X\) and the \(A\)-horizontal lift at \(u\), \(D_X^A u=0\). In the \(\Gamma\)-splitting at its image \(f\),
\[
 \Phi_*X^A=X^\Gamma+\mathcal H_X,\qquad
 \mathcal H_X(f)=P_fL_Xf,\qquad
 L_X=(\nabla_X^A S)S^{-1}-B_X .
 \tag{4}
\]
Indeed \(D_X^\Gamma(Su)=(\nabla_X^A S)u-B_XSu\), and normalization projects to \(f^\perp\). As in E03A, \(\operatorname{sym}_0 L_X=T_X=\tfrac12(S^{-1}\nabla_X^A Q S^{-1})_0\). The scalar part has zero projected field. With \(\Omega_X=\operatorname{skew}L_X\),
\[
 \mathcal H_X=\Omega_X f+\mathcal R_X,\qquad
 \mathcal R_X=P_fT_X f=\operatorname{grad}_{S^2}\tfrac12 f^TT_Xf .
\]
The remainder is orthogonal to the fiber holomorphic vector fields by integration by parts against rotations and antipodal parity against the conformal gradients. The real round area moments give
\[
 \int_{S^2}|\mathcal R_X|^2\,dA_{\rm rd}=\frac{4\pi}{5}|T_X|^2,\quad
 \int_{S^2}\mathcal R_X\otimes f\,dA_{\rm rd}=\frac{4\pi}{5}T_X,\quad
 \int_{S^2}(\Omega_X f)\otimes f\,dA_{\rm rd}=\frac{4\pi}{3}\Omega_X .
 \tag{5}
\]
For the E03A Hermitian convention on \((1,0)\) vector fields the first squared norm has factor \(2\pi/5\). These use the target round measure. In global tensor versions square-sum the live base slots and integrate over the round fiber before taking the square root. In particular \(\int_0^\infty\sup_x\|\mathcal R\|_{L^2_f}\,d\tau\le C\ell\) by (1), and its squared integral bound follows from \(J\). [E03A moments and recovered derivative][e03a].

The native mismatch bounds follow explicitly from E03A and E09. A \(k\)-base-covector \(E\)-valued tensor gains \(\sqrt2 c^{-k/2}\) in norm between their old conventions and here. An endomorphism-valued tensor gains \(c^{-k/2}\), with no internal factor. In particular
\[
 |b|_g\le2\sqrt6\,|T|_g,\qquad
 |\nabla^\Gamma b|_g
      \le\sqrt2\bigl(6|\nabla^AT|_g+(36+8\sqrt3)|T|_g^2\bigr).
 \tag{6}
\]
Thus the integral of the supremum of \(b\) is controlled by (1), and for \(\nabla^\Gamma b\) by \(J\). For \(P_X=S^{-1}\nabla_X^AS\), the bound \(|P|_g\le2|T|_g\) is unchanged. In (4) the matrix term \((\nabla_X^AS)S^{-1}\) is \(P_X^\top\), giving
\[
                            |L|_g\le(2+2\sqrt6)|T|_g .
 \tag{7}
\]
[E03A, compatibility and transpose][e03a], [E09, floor-free mismatch][e09], [E09 assessment][a09].

For precisely one base derivative fix a time slice. Use the pullback of \(D^\Gamma\) to the target sphere bundle and project to the vertical plane \(f^\perp\). For any one-form \(Z_X(f)\) with values in vertical tangent fields set
\[
 (\mathcal D_Y^\Gamma Z)_X
   =P_f(\pi^*D^\Gamma)_{Y^\Gamma}Z_X-Z_{\nabla^g_YX}.
 \tag{8}
\]
The live \(\nabla^g\) acts on the existing base covector slot. Both \(f\) and \(P_f\) are parallel along the \(\Gamma\)-horizontal lift. Hence
\[
 (\mathcal D_Y^\Gamma\mathcal H)_X=P_f(\nabla_Y^\Gamma L)_Xf,\qquad
 (\mathcal D_Y^\Gamma\mathcal R)_X=P_f(\nabla_Y^\Gamma T)_Xf .
 \tag{9}
\]
The connections in \(\nabla^\Gamma\) use the same live Levi-Civita on the base slots as in \(\nabla^A\). In particular E09's derivative using \(A\)-parallel labels is not directly the derivative (8). Correct it by
\[
 (\nabla^\Gamma_Y P)_X=(\nabla^A_Y P)_X-[B_Y,P_X],
 \qquad
 (\nabla^\Gamma_Y T)_X=(\nabla^A_Y T)_X-[B_Y,T_X].
\]
Since the native \(\|B_Y\|_{\rm op}\) is \(|b_Y|_{\rm native}/\sqrt2\), Cauchy–Schwarz over the independent base slots and (6) give
\[
 |\nabla^\Gamma T|_g\le|\nabla^AT|_g+4\sqrt3|T|_g^2 .
\]
For \(U_X^{\rm sym}=\operatorname{sym}P_X\), the relative Sylvester identity of E09 gives \(|\nabla^A P|\le2|\nabla^A U^{\rm sym}|+2|P|^2\) and
\(|\nabla^A U^{\rm sym}|\le\sqrt3|\nabla^AT|+2\sqrt3|T|^2\).
These constants are unchanged in native norms because both sides have two base slots. The connection correction costs at most \(2(|b|_{\rm native}/\sqrt2)|P|\). It follows that
\[
 \begin{split}
 |\nabla^\Gamma P|_g
   &\le2\sqrt3|\nabla^AT|_g+(12\sqrt3+8)|T|_g^2,\\
 |\nabla^\Gamma L|_g
   &\le(2\sqrt3+6\sqrt2)|\nabla^AT|_g
            +(12\sqrt3+8+36\sqrt2+8\sqrt6)|T|_g^2 .
 \end{split}
 \tag{10}
\]
Here the second line differentiates \(P^\top-B\) with the metric \(\Gamma\) connection. The derivative of \(B\) uses \(\operatorname{ad}(\nabla^\Gamma b)\), with native Hilbert–Schmidt norm equal to \(|\nabla^\Gamma b|\). The compatibility estimate closes (8)–(10) with no higher base derivative. The exact \(L^2\) factor \(\sqrt{4\pi/5}\) in (5) also measures the derivative \(\mathcal D^\Gamma\mathcal R\) by \(|\nabla^\Gamma T|\). [E09, relative Sylvester and connection correction][e09], [E03A, horizontal field][e03a].

For a fixed matrix \(M_1\) put \(Y_{M_1}(f)=P_fM_1f\). Write \(\nabla^{\rm rd}\) for the round target fiber derivative. At \(f\) and tangent directions \(v_1,w_1\), direct projected differentiation gives
\[
 \begin{split}
 \nabla^{\rm rd}_{v_1}Y_{M_1}
    &=P_fM_1v_1-\langle f,M_1f\rangle v_1,\\
 ((\nabla^{\rm rd})^2Y_{M_1})(v_1,w_1)
    &=-v_1\langle f,M_1w_1\rangle
       -\langle v_1,w_1\rangle P_fM_1f
       -(\langle v_1,M_1f\rangle+\langle f,M_1v_1\rangle)w_1 .
 \end{split}
\]
In the second identity take \(w_1\) round-parallel at the evaluation point, so its ambient derivative is \(-\langle v_1,w_1\rangle f\). It follows in full component norms that
\[
 \sup_f|(\nabla^{\rm rd})^jY_{M_1}|\le c_j |M_1|,\qquad
 (c_0,c_1,c_2)=(1,2\sqrt2,8).
 \tag{11}
\]
Apply (11) with the matrix-valued base slots of \(L,T,\nabla^\Gamma L,\nabla^\Gamma T\), keeping the live base norms. The \(\tau\)-integral of each supremum of \((\nabla^{\rm rd})^j\mathcal H,(\nabla^{\rm rd})^j\mathcal R\) is at most \(C_j\ell\) by (1), (7). The corresponding orders on \(\mathcal D^\Gamma\mathcal H,\mathcal D^\Gamma\mathcal R\) are bounded by \(C_j\ell\) by \(J\) and (9)–(11). Parallel motion by \(\Gamma\) identifies fibers by round isometries, so its differentiation commutes with the round derivative if the latter's covariant slots are also transported by that identification. This specifies the mixed derivatives with one base slot of differentiation and at most two vertical ones.

## Positive chiral curvature block in native scale

E09's block in the old scale is \(\frac1{\sqrt2}|F_\Gamma^{\rm old}+K\widehat\Sigma|_{\widehat g}\). On multiplying lengths squared by \(c\) its curvature norm scales by \(c^{-1}\), as do the live \(\operatorname{Ric}_0\) norm and scalar curvature. Since the internal components of the curvature gain \(\sqrt2\), the exact native block norm is
\[
 \mathfrak B_+(g)
 :=\bigl(|W^+|_{\rm HS,op}^2+\tfrac14|\operatorname{Ric}_0|_g^2
                  +\tfrac1{48}(s_g-6)^2\bigr)^{1/2}
   =\tfrac12|F_\Gamma+\sigma|_{g,{\rm native}} .
 \tag{12}
\]
Here \(|W^+|_{\rm HS,op}\) denotes the Hilbert–Schmidt norm of the chiral curvature operator on unit two-forms, and \(s_g\) is the scalar curvature. Indeed
\(F_\Gamma+\sigma=\sqrt2(F_\Gamma^{\rm old}+K\widehat\Sigma)\) in the corresponding component arrays, and \(12K/c=6\). E09's pointwise estimate divided by \(c\) therefore reads
\[
  \mathfrak B_+(g)
     \le \tfrac12|q|+6|\nabla^AT|_g+(42+8\sqrt3)|T|_g^2.
 \tag{13}
\]
It follows from (1) and \(J\) that \(\int_0^\infty\sup_x\mathfrak B_+(g)\,d\tau\le C\ell\). Individual constants relative to this bound are \(1,2,4\sqrt3\) for the three summands' norms, respectively. The negative chiral diagonal Weyl block is absent from the pointwise identity and its estimate. [E09, chiral coefficient identity][e09], [E09 assessment][a09].

## Original-time derivative with fixed labels

At fixed \(x,u\) in the original base and a time-independent \(E\)-label, let \(M_\tau=S_\tau S^{-1}\). Differentiating (2) gives
\[
 \partial_\tau\phi_x(u)=P_f M_\tau f .
\]
The Sylvester equation \(S S_\tau+S_\tau S=Q_\tau\) gives a norm estimate without differentiating an eigenframe. In an \(S\)-eigenbasis at the evaluation time, with eigenvalues \(s_i>0\),
\[
 (M_\tau)_{ij}=\frac{(Q_\tau)_{ij}}{(s_i+s_j)s_j}
          =\frac{s_i}{s_i+s_j}(S^{-1}Q_\tau S^{-1})_{ij}.
\]
The multiplier is in \([0,1]\), so \(|M_\tau|\le|S^{-1}Q_\tau S^{-1}|\) in Frobenius norm, even without a quantitative floor. E14 (4) is for the original equation in a fixed base and internal identification. Since \(Q_\tau=c^{-1}Q_t\), and \(\mathcal G=c^{-1}(|\nabla^AT|_{\widehat g}+|T|_{\widehat g}^2)\), its bound becomes \(|S^{-1}Q_\tau S^{-1}|\le4512\sqrt2\,\mathcal G\). At fixed \(\tau\), relabel the velocity in target \(f\)-labels and apply (11) with \(M_1=M_\tau\), including vertical orders \(0,1,2\). If using ambient derivatives in the source \(u\)-labels, the same bounded-fiber-parameter argument up to order two for the composition with \(\phi_x\) gives constants depending only on the spectral tube. In particular
\[
 \int_0^\infty\sup_{x,u}|\partial_\tau\phi_x(u)|\,d\tau\le4512\sqrt2\,J\le C\ell .
 \tag{14}
\]
The derivative is in \(E\)-labels for the evolving adapted identification. An independently chosen temporal frame on the varying \(\Lambda_g^+\) target contributes its own velocity. [E14 (4)][e14], [E14 assessment][a14].

The spatial comparison quantities \(q,T\), the fiber map and distortion, the vertical complex-structure discrepancy, \(\mathcal H,\mathcal R\), the compatibility mismatch and the chiral curvature block are natural under orientation-preserving bundle pullback at a fixed time. The metric and its chiral connection are pulled back, the fiber maps conjugate by the isometric action, and the same action takes each horizontal lift and projected round derivative to its counterpart. This includes (8), since it uses the induced chiral and base connections and the round orthogonal projection. Thus the corresponding live suprema transfer under same-time recovery. The fixed-reference auxiliary derivatives and path norms are used on their adjusted representatives. Equation (14) uses the original equation and fixed temporal labels. Differentiating a time-dependent recovery introduces base and internal generator terms, which the same-slice isometry does not control. [E84, naturality and native clock][e84], [E14, temporal identification][e14].

## Fiber transition and scope

In an oriented orthonormal frame the two stereographic coordinates are \(\zeta=(f_1+i f_2)/(1+f_3)\) and \(w=(f_1-i f_2)/(1-f_3)=1/\zeta\). With \(j_f v=f\times v\), their complex orientations agree. A smooth real vertical field \(Y\) has \(Y^{1,0}=(Y-ijY)/2=y_\zeta\partial_\zeta\) and \(y_w(w)=-\zeta^{-2}y_\zeta(\zeta)\) on the overlap. This is the \(\mathcal O(2)=T^{1,0}\mathbb{CP}^1\) transition for its smooth vertical part. The globally smooth formulas (2), (4) include both poles, with \(\zeta\) regular at the north pole and \(w\) at the south pole. Frame rotations are round sphere isometries, and in the comparison of lifts their base derivatives occur on both sides and cancel. These are statements on the entire real direction sphere and its smooth bundle, with no spin lift needed for these fiber assertions. [E03A frame and transition formulas][e03a], [canonical real twistor source record][twistorcanon].

Fine–Panov §2.3 Definition 2.9 and Remark 2.10 supply the inherited distinction between the curvature-based almost complex structure and the Levi–Civita one. Atiyah–Hitchin–Singer Theorem 4.1, journal pp. 435–436, concerns exact integrability for the selected chirality, which here would require \(W^+=0\). The integrated comparison gives neither that identity at each time nor the holomorphic section, flat partial connection or \(\mathcal O(1)\) hypotheses of the earlier first-jet constructions. It is a real comparison along the established round-basin flow, at the finite derivative orders specified above, with no pointwise estimate on \(W^-\) and no new holomorphic chart or initialization theorem. The canonical records retain the earlier selected-passage inspection levels. [Canonical real twistor record][twistorcanon], [E03 assessment][a03].

[req]: ../research-progress/handoffs/SP4-CME-E137_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E137_RETURN_v1.md
[b71]: ../brainstorm/notes/B71_REAL_COMPARISON_TIME_CONTROL_20261122.md
[a131]: ../reviews/E131_E134_WHOLE_TIME_ENDPOINT_ASSESSMENT_20261122.md
[a129]: ../reviews/E129_E132_INTRINSIC_HEAD_ASSESSMENT_20261122.md
[e129]: 129_CONDITIONAL_INTRINSIC_ENDPOINT_HEAD_20261122.md
[e131]: 131_CONDITIONAL_DEFECT_SENSITIVE_TAIL_20261122.md
[e03a]: 05A_REAL_TWISTOR_COMPARISON_20261122.md
[dist]: 03_direction_distortion_check_20261122.md
[e09]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[e14]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e84]: 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[a03]: ../reviews/E03_COORDINATE_ASSESSMENT_20261122.md
[a09]: ../reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md
[a14]: ../reviews/E14_TEMPORAL_ASSESSMENT_20261122.md
[finecanon]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#critical-path-and-smoothing-follow-up
[twistorcanon]: ../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md
