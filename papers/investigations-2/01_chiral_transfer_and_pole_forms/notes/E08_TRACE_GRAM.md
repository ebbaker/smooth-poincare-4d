# SP4-POLE-E08c · The true trace Gram and two local triples

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. The fixed E packet specifies GPT-6.2 Sol/ultra. The exact serving variant and reasoning effort of this helper are unavailable. Baseline `6a422ce7814fe1ad278d6904970e3b19b05a9890`. This is a working project derivation on the frozen smooth oriented Riemannian pilot, with one primary import. [Request and input versions](../research-progress/handoffs/RETURN_E08_TRACE_GRAM_20261127.md)

## True tangential trace on each cap boundary

Write \(X=M\setminus\{p\}\) for the connected punctured manifold of the marked minus presentation. Fix the B04 coefficient basis \(u_1,u_2,u_3\in\Lambda^-_p\) and physical metric \(h\). Write \(\Omega_j=Lu_j=d\alpha_j\), where \(\alpha_j=A^0_j+a_j\) is the true smooth global A1 primitive on \(X\). For \(u=\sum_j v_ju_j\), set \(\Omega_u=\sum_j v_j\Omega_j\). The leading constant at the inverted end has the coefficients of \(u\) in the fixed frame. Each \(\Omega_u\) is \(h\)-self-dual and closed. Its period on each complete sphere fibre in either cap or the second enlargement is zero by Stokes. [B04 mark](../brainstorm/notes/B04_MARKED_PILOT_20261127.md) · [A1, §§1 and 3](E01_A1.md)

Take \(C=C_1,C_2\) or \(C_2^{+}\), where \(C_2^{+}\) adjoins the second signed collar through \(s=1/16\). Let \(i_C:Y_C=\partial C\hookrightarrow X\). In E07 coordinates the boundaries of the two original caps have \(s=0\) and mark \(\Psi_i(0,t,n)\). The enlarged boundary has \(s=1/16\), with mark \(m_+(t,n)=\Phi_2(t,(17/16)n)\). The outward-first boundary orientation in each mark is \(dt\wedge dA_n\), since the physical collar orientation is \(ds\wedge dt\wedge dA_n\) and outward is increasing \(s\). [E07, §2](E07_MARKED_ATLAS.md#2-cartesian-caps-and-signed-seams)

Define \(\tau_j=i_C^*\Omega_j\). It is exact on \(Y_C\), with one choice of primitive \(i_C^*\alpha_j\). The integrated matrix in the fixed basis is
\[
 G_{C,jk}=\int_C\Omega_j\wedge\Omega_k
         =\int_C\langle\Omega_j,\Omega_k\rangle_h\,dV_h
         =\int_{Y_C}\lambda_j\wedge\tau_k,
 \qquad d\lambda_j=\tau_j .
\]
The first equality of integrals uses self-duality of \(\Omega_k\). For the boundary identity use \(d(\alpha_j\wedge\Omega_k)=\Omega_j\wedge\Omega_k\) and Stokes. An arbitrary primitive differs from \(i_C^*\alpha_j\) by a closed one-form \(\eta\). Since \(\eta\wedge\tau_k=-d(\eta\wedge i_C^*\alpha_k)\), its integral over the closed boundary is zero. In particular the boundary formula is symmetric in \(j,k\). This Gram uses the boundary primitive and oriented wedge pairing.

If \(i_C^*\Omega_u=0\), the boundary formula with the same coefficient in both slots gives \(v^{\mathsf T}G_C v=0\). The volume formula then gives \(\Omega_u=0\) on the open interior of \(C\) by smoothness and nonnegative squared norm. The same argument starts directly from a zero quadratic energy. Extend the conclusion to all of \(X\) by the following import.

**Import.** Aronszajn–Krzywicki–Szarski, §2, Theorem 1, printed pp. 421–422, checked 28 November 2026 UTC in the primary scan. On the connected manifold under consideration, apply the theorem for a \(C^{1,1}\) manifold with locally Lipschitz metric to a form with locally \(L^2\) coefficients and strong first derivatives locally in \(L^2\). It assumes a zero of infinite order in 1-mean at one point and, on each compact subset \(K\), the a.e. inequality \(Q(d\Omega)+Q(d_h^*\Omega)\le M_K Q(\Omega)\), where \(Q\) is the squared metric norm in each degree. Here the manifold is the smooth boundaryless \(X\) with smooth metric \(h\). The form is smooth and \(d\Omega_u=d_h^*\Omega_u=0\), the latter by self-duality. At a point in the open zero set the coefficient integrals vanish on all sufficiently small coordinate balls. The theorem gives a.e. vanishing on \(X\), hence everywhere by continuity. The A1 leading coefficient is then zero, so \(u=0\). [Primary scan](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/6988-11512_2007_Article_BF02591624.pdf) · [Source receipt](../references/AKS_TRACE_20261127.md)

Thus \(u\mapsto i_C^*\Omega_u\) is injective as a map into smooth tangential two-forms on the entire marked boundary. The symmetric \(G_C\) is positive definite and satisfies
\[
 \lambda_{\min}(G_C)=\min_{|v|=1}\int_C|\Omega_{\sum_j v_j u_j}|_h^2\,dV_h>0.
\]
The inequality is qualitative. The numerical value and a quantitative lower bound for it are unevaluated. The integrated estimate implies \(\max_C|\Omega_u|_h\ge\sqrt{\lambda_{\min}(G_C)/\operatorname{Vol}_h(C)}\) for each unit \(u\). The difference \(G_{C_2^+}-G_{C_2}\) is positive definite by applying the same open-set argument to its volume integral on the intervening collar. The smallest eigenvalue therefore increases strictly in this enlargement.

## Two triples in the same conformal chart

Use either fixed radius \(\sigma=1\) or \(\sigma=17/16\) for the second cap, with \(\tau=t'\), \(\theta=2\pi t\), and \(h=d\tau^2+\sinh^2(\tau)d\theta^2+g_{S^2}\) on \(\tau\le\sigma\). In the B04 chart put \(w=\tanh(\tau/2)e^{i\theta}\), \(\xi+i b=i(1+w)/(1-w)\), and \(y=F(\xi,b,n)=(\xi,bn_1,bn_2,bn_3)\). Indeed \(4|dw|^2/(1-|w|^2)^2=d\tau^2+\sinh^2(\tau)d\theta^2\), and the Cayley transform gives \(b=(1-|w|^2)/|1-w|^2\) and \((d\xi^2+db^2)/b^2=4|dw|^2/(1-|w|^2)^2\). The disk map is orientation-preserving, smooth at its centre and maps to \(b>0\). Polar coordinates on \(bn\) give Euclidean volume \(b^2d\xi\wedge db\wedge dA_n\) and \(F^*g_{\mathrm E}=d\xi^2+db^2+b^2g_{S^2}=b^2h\). The inverse recovers \(b\) as the radius of the last three coordinates, and \(n\) as their unit direction. On the chart image \(D_\sigma\), \(e^{-\sigma}\le b\le e^\sigma\) follows by bounding \(|1-w|\) between \(1-|w|\) and \(1+|w|\). Pullback preserves self-duality and the wedge integrals, and \(|F^*B|_h=b^2|B|_{\mathrm E}\) for a two-form \(B\). [B04 conformal chart](../brainstorm/notes/B04_ANALYTIC_METHOD_20261127.md) · [B04 local comparison](../brainstorm/notes/B04_INTERFACE_DATA_20261127.md)

Write \(dy^{ij}=dy^i\wedge dy^j\) in this orientation. Take the constant triple \(B=(B_1,B_2,B_3)\) with columns
\[
 B_1=(dy^{12}+dy^{34})/\sqrt2,\qquad
 B_2=(dy^{13}-dy^{24})/\sqrt2,\qquad
 B_3=(dy^{14}+dy^{23})/\sqrt2.
\]
These form a Euclidean orthonormal self-dual basis at every point. Each is exact, with primitive \(\tfrac12\iota_{\sum_i y^i\partial_{y^i}}B_j\) by differentiation. For the other triple put \(z_1=y^1+i y^2\), \(z_2=y^3+i y^4\), and choose the interior point \(q_*\) at the disk centre with \(n=(1,0,0)\). This has \(y=(0,1,0,0)\), so choose the complex values \((a,b_*)=(i,0)\). With \(\rho=dz_1\wedge dz_2\), take
\[
 T=\big(\operatorname{Re}[(z_1-a)\rho],\quad
          \operatorname{Re}[i(z_1-a)\rho],\quad
          \operatorname{Re}[(z_2-b_*)\rho]\big).
\]
The real and imaginary parts of \(\rho\) are \(\sqrt2 B_2\) and \(\sqrt2 B_3\). Hence the columns are self-dual, even with complex-valued multipliers before taking the real parts. The differentials of the multipliers wedge to zero with \(\rho\), so the columns are closed. Explicit real primitives are the real parts of \(\tfrac12(z_1-a)^2 dz_2\), \(\tfrac i2(z_1-a)^2 dz_2\) and \(-\tfrac12(z_2-b_*)^2 dz_1\), respectively. Both triples thus pull back to smooth exact self-dual forms on the cap with boundary. They have zero integral on every complete fibre, as does each true A1 column.

The fields in \(T\) are linearly independent over \(\mathbb R\). If the combination with real coefficients \(c_1,c_2,c_3\) vanishes identically on the interior, the orthogonal real and imaginary parts of \(\rho\) force \((c_1+i c_2)(z_1-a)+c_3(z_2-b_*)=0\) on the open chart image. Both complex coefficients must be zero. At the specified point \(q_*\), all three columns vanish. For any nonzero \(c\), the constant combination \(Bc\) has Euclidean norm \(|c|\) at every point, so its pulled-back physical norm is at least \(e^{-2\sigma}|c|\) on the closed cap.

## Exact matching of the integrated data

For either triple \(A=B,T\), its matrix \(H_A\) with entries \(\int_{D_\sigma}A_j\wedge A_k\) is positive definite by independence as smooth fields and self-duality. Fix any symmetric positive definite matrix \(S\), including the actual \(G_C\) for the chosen second-cap domain. Regard the triple as a row of columns acting on coefficient vectors, and replace it by
\[
 \widetilde A=A\,H_A^{-1/2}S^{1/2}.
\]
The square roots are the positive symmetric roots. The congruence makes the entire matrix of wedge integrals equal to \(S\) for both triples. Polarized Stokes gives that same matrix from their respective exact boundary traces and any primitives. All fibre periods stay zero. The invertible column combination preserves the evaluation zero of \(\widetilde T\) at \(q_*\) and the zero-freeness of \(\widetilde Bv\) for every nonzero \(v\). More precisely, for \(V_\sigma=\operatorname{Vol}_{\mathrm E}(D_\sigma)\), the physical norm of the pulled-back constant combination is at least \(e^{-2\sigma}\sqrt{v^{\mathsf T}Sv/V_\sigma}\), since \(H_B=V_\sigma I\). Matching is for the full prescribed matrix on either chosen boundary, with the column changes allowed to depend on that domain.

Equal marked tangential traces would force equality of the two local triples on the cap. Apply the energy identity to the difference of corresponding columns, using its exactness. The boundary term would vanish and each difference would have zero energy, contrary to the evaluations at \(q_*\). The local triples carry no prescribed asymptotic coefficient. A1 would give a unique field if the smooth global equation and a common marked leading coefficient were imposed.

The positive definite integral and the fibre periods therefore cannot decide zero-freeness of even one direction on this cap within the tested class of local exact chiral fields. For the true A1 form, the first missing bound is a strict pointwise cap estimate. The chosen scalar method needs the angularly resolved tangential trace \(m_+^*\Omega_u\) on the enlarged boundary for a fixed input, including the trial \(u_1\). A strictly positive minimum of the full Euclidean inner product of \(B_1\) with the actual Euclidean field on that boundary would suffice by harmonicity. The marked trace gives this inner product as twice its tangential counterpart in the induced Euclidean metric, since the normal component of a self-dual form at a hypersurface is the boundary star of its tangential pullback. The aggregate data leave this signed minimum and the true field's interior zeros undetermined.
