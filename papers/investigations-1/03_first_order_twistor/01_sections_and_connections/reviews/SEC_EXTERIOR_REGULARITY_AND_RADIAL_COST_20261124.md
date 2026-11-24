# Removing the exterior correction and measuring the radial step

24 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The author-selected lead and effort were retained. Actual lead backend and effort were unavailable. The bounded proofs used helpers configured as gpt-6.2-sol/ultra. Working HEAD was e76752648b69969b1234d0295530c87fce9fcdcb. [Input manifest](../brainstorm/notes/SEC_B24_EXTERIOR_REFERENCE_20261124.md) · [Sole register and versioned proofs](../research-progress/REGISTER.md)

## Exact prescription after changing the exterior reference

Let \(M\) be a closed smooth oriented homotopy four-sphere. Fix a smooth positive-definite Riemannian metric \(r\), unit round on a neighborhood of a closed coordinate ball \(K\), with density \(\nu=dV_r\). In the positive symmetric fixed-volume frame comparison write \(W=W_r^+\) and \(E_+(r)=\int|W|_{\rm op,HS}^2\,\nu\). Call \(r\) regular if its **full trace-free** linearization \(L=dF_r(0):H^{s+2}(S^2_0T^*M)\to H^s(S^2_0\Lambda_r^+)\), \(s\ge5\), is onto. The fixed transverse-traceless slice has a different range. [Manuscript, section on prescribing chiral curvature](../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

**Local theorem.** Arbitrarily close to \(r\) in \(C^\infty\) there are regular references \(r_a\) of the same density, equal to \(r\) near \(K\), and with \(E_+(r_a)=E_+(r)\) exactly. Every sufficiently small smooth change in the self-dual Weyl block at \(r_a\) is realized by a smooth metric on the original \(M\). In particular, for all sufficiently small \(t\), there is a smooth fixed-volume family through \(r_a\) with
\[
 F_{r_a}(h_a(t))=(1-t)W^+_{r_a},\qquad E_+(g_a(t))=(1-t)^2E_+(r).
\]
The reference perturbation is supported in the actual exterior. The ensuing metric solve can deform the cap; it retains \(W^+=0\) there. Regular references are relatively open and dense even in the fixed-density class of smooth extensions equal to a marked round metric only on the closed ball. In this boundary version the conclusion for a radial solve applies on that ball. [Moving inverse](../notes/SEC_E40_20261124.md) · [Exterior perturbation](../notes/SEC_E41_20261124.md) · [Independent check and boundary argument](../notes/SEC_E45_20261124.md) · [Equal-energy construction](../notes/SEC_E46_20261124.md)

The finite space \(\mathcal C=\ker L^*\) is smooth by ellipticity of \(P=LL^*\). Every member is determined by its restriction to the exterior: a section supported on \(K\) extends by zero to a smooth round adjoint solution on standard \(S^4\), where that kernel vanishes. In the boundary version, the extended section has zero jets along the boundary. Thus finitely many polarized fiber evaluations in disjoint exterior balls distinguish the \(m=\dim\mathcal C\) old modes. [E27](../notes/SEC_E27_20261124.md) · [E45](../notes/SEC_E45_20261124.md)

Use a reference perturbation \(v_N\) of amplitude \(N^{-2}\cos(N\phi_j)\) on each ball, with the symbol of \(L\) chosen so its leading curvature has polarization \(Y_j\). Choose longitudinal vector fields \(X_{j,N}\) of amplitude \(N^{-1}\sin(N\phi_j)\). Put \(k_{j,N}=(1-L^*G_P L)(\mathcal L_{X_{j,N}}r)_0\). These are genuine old kernel tensors and may have global support. Let \(A_a\) be the full linearization centered at \(r\exp(a v_N^\sharp)\), pulled back to fixed bundles. For old adjoint basis \(Z_i\) the rank test is
\[
 \langle Z_i,A'_0 k_{j,N}\rangle\longrightarrow
  -\tfrac14\int b_jd_j\langle Z_i,Y_j\rangle\,\nu ,
\]
where \(b_j,d_j\) are fixed cutoffs for \(X_{j,N},v_N\). The factor comes from integrating transport by parts, adding the half-divergence of the normalized Weyl pullback, and averaging \(\cos^2(N\phi_j)\). The correction \(L^*G_PL(\mathcal L_Xr)_0\) is small in \(L^2\) by compactness. The mixed formal adjoint contains at most two derivatives of \(v_N\), allowing that smallness to pass to the pairing. The limit matrix is invertible by the choice of evaluations. One then fixes a **finite** frequency. [E41](../notes/SEC_E41_20261124.md)

Adjoin the columns \(A_a k_j/a\) to \(A_aL^*u\), \(u\perp\mathcal C\). At \(a=0\) this map is invertible: the old normal operator accounts for the range and the displayed matrix accounts for its missing moments. Invertibility persists for small \(a\), including \(a\ne0\) where the new adjoint kernel is zero. When \(E_+(r)>0\), exterior stationarity is impossible with this cap by E24. A fixed exterior variation with nonzero energy derivative adjusts \(v_N\) onto the tangent energy level at cost \(O(N^{-2})\) in the rank matrix. A scalar implicit equation preserves the level exactly. The zero-energy class is already conformally round and regular. [E24](../notes/SEC_E24_20261124.md) · [E40](../notes/SEC_E40_20261124.md) · [E46](../notes/SEC_E46_20261124.md)

## How far the estimates reach

Write \(b(f)_i=\langle Z_i,f\rangle_{L^2(r)}\). For a fixed rank-lifting path with \(m>0\), the optimal full right-inverse norm has order \(|a|^{-1}\). The actual radial forcing distinguishes two cases. [Directional estimates](../notes/SEC_E46_20261124.md)

| Old moments | Norm of a radial preimage at the new center | Fractional steps within a metric ball of radius proportional to \(\lvert a\rvert\) |
| --- | --- | --- |
| \(b(W)\ne0\) | All have size at least \(c/\lvert a\rvert\), and a solution of that order exists. | Order \(a^2\). |
| \(b(W)=0,\ E_+(r)>0\) | There is a bounded choice even as the full inverse diverges. | Order \(\lvert a\rvert\). |

The lower orders for reachable step length follow by contraction; the upper orders follow by projecting the equation onto \(\mathcal C\) in the first case and using the full Lipschitz bound in the second. They are sharp **on the specified shrinking metric scale**. All constants may depend on the reference and the chosen finite perturbation. Composing positive symmetric comparisons also rotates the old Weyl bundle. Consequently a chord centered at \(r_a\) does not by itself solve the original prescription through \(r\). [E40, comparison of targets](../notes/SEC_E40_20261124.md)

## Keeping the original reference

In the original chart let \(H=D^2F_r(0)\). A lift with leading strain \(\sqrt t\,k\) needs \(Lk=0\) and \(\tfrac12 b(H[k,k])=-b(W)\). Every smooth kernel tensor compactly supported in a smaller round ball equals \((\mathcal L_Xr)_0\) for a vector field supported there. This follows by closed round TT rigidity and conformal Killing extension across an annulus. A cap diffeomorphism preserves the full radial target, so its projected Hessian vanishes even when paired with an arbitrary global kernel tensor. [E42](../notes/SEC_E42_20261124.md)

For an exterior unit phase normal \(n\), vector polarization \(u\) and cutoff \(\beta\), set \(X_N=N^{-1}\beta\sin(N\phi)u\), \(k_N=(1-L^*G_PL)(\mathcal L_{X_N}r)_0\), and \(d=\langle u,n\rangle\). Let \(A\) be the infinitesimal pullback on \(\Lambda^+\) induced by the skew part of \(u\otimes n^\flat\). For each old adjoint field \(Z\), the unhalved second derivative satisfies
\[
 \lim_N\langle Z,H[k_N,k_N]\rangle
 =\tfrac12\int\beta^2\left(\tfrac{d^2}{4}\langle Z,W\rangle
              +\langle[A,Z],[A,W]\rangle\right)\nu .
\]
Mixed limits for disjoint supports vanish. In the longitudinal case the coefficient is \(+1/8\). The projection to the true kernel is essential to its sign. The polar-frame calculation was independently repeated before extending it to transverse polarizations. [E43](../notes/SEC_E43_20261124.md) · [E47](../notes/SEC_E47_20261124.md)

A sufficient criterion for a local chord **through \(r\)** is that there be no nonzero \(Z\in\ker L^*\) for which
\[
 A\longmapsto\langle[A,Z(x)],[A,W(x)]\rangle_{\rm HS}
\]
is positive semidefinite at every exterior point. Its trace on the three unit axial rotations is \(6\langle Z,W\rangle\). Transverse polarizations supply all three rotation axes. Under the criterion, finitely many disjoint probes positively span \(\mathcal C^*\) with a strict margin. Positive squared amplitudes represent \(-b(W)\) with a surjective parameter derivative. This zero persists at one finite frequency. Solving the range equation and dividing the moment equation by \(\tau^2\), \(t=\tau^2\), gives an exact smooth family \(F_r(h(\tau))=(1-\tau^2)W\). Its metric can be only Hölder \(1/2\) in \(t\) at zero. A semidefinite witness limits this particular cone of probes. If the witness form vanishes identically it gives a missing row, and if it is nonzero somewhere it strictly separates the limiting contracting target. The existence of such fields for general marked metrics is open. [E44](../notes/SEC_E44_20261124.md) · [E47](../notes/SEC_E47_20261124.md)

## A geometric obstruction to uniformly inexpensive radial motion

In the E24 Bach convention, a solution of \(L_gh=-W_g^+\) has \(dE_+(h)=-2E_+(g)=-\tfrac12\int\langle B_g,h\rangle\,dV_g\), hence
\[
 \|h\|_{L^\infty(g)}\int_M|B_g|_g\,dV_g\ \ge\ 4E_+(g).
\]
The strain norm and total Bach norm are measured in the actual reference geometry. [First variation](../notes/SEC_E24_20261124.md) · [E48](../notes/SEC_E48_20261124.md)

On standard smooth \(S^4\), the marked doubles may be made regular with exactly zero Yamabe constant, \(E_+=8\pi^2+O(R^{-1})\) and total Bach norm \(O(R^{-1})\). To stay on the zero wall, let \(v\) be a positive first eigenfunction of the conformal Laplacian. Variation of its simple zero eigenvalue in an exterior direction \(h\) pairs \(v^2 h\) with the Ricci tensor of the scalar-flat metric \(v^2g\). That tensor is nonzero somewhere in the exterior. Otherwise the metric would be Bach-flat there and on the conformally flat cap, forcing global conformal roundness, inconsistent with zero sign. This supplies the scalar correction that preserves the zero eigenvalue during the exterior rank perturbation. A second sequence retains \(0<Y=O(R^{-1/2})\). In both sequences all actual radial preimages have \(\|h\|_\infty\ge cR\). Thus even the specific radial target can be arbitrarily expensive at regular references. These sequences approach \(8\pi^2\); a band with a fixed positive margin below it remains a separate question. [Wall construction](../notes/SEC_E37_20261124.md) · [Regular examples and strain bound](../notes/SEC_E48_20261124.md)

Smooth recognition would follow by continuing to \(W^+=0\), or by reaching a positive-Yamabe point with \(E_+<4\pi^2\). Repetition needs control of the accumulated fractional contraction, the cap after each solve, and any re-marking cost. A sequence approaching zero energy also requires sufficient compactness for a limit on the original manifold if recognition has not occurred at a finite step. The independent compactness route in E31 still requires a positive limit with a surviving open cap. [SH-E01](../../notes/SH_E01_20261124.md) · [E31](../notes/SEC_E31_20261124.md) · [Continuation](../continuation-notes/03_AFTER_EXTERIOR_REGULARITY_AND_RADIAL_COST_20261124.md)

## Evidence versions

SHA-256 of each assessed working derivation, relative to the branch at the checkout above. The individual requests preserve the versions they consumed.

```
46d5a0aee3956c2d66b1d4a16bd2f75ecd38f1ea560a983c9560b147aa305556  notes/SEC_E40_20261124.md
d189a283f012caa481ba34c518f668bb27914c89387e411c5e8b6ca4de9acbbd  notes/SEC_E41_20261124.md
34363082297258b9a23f26153469c44d65c5189b87ddeb76f92aa415993351be  notes/SEC_E42_20261124.md
1479bd68a393c64d5e1c2a0b6f0ac9a775a7f6528b111a03388295d646ee724c  notes/SEC_E43_20261124.md
5b8e7f3a944441b7d4d12f8b53593502fe1de70ad7b46587bb65dbce9a7b1061  notes/SEC_E44_20261124.md
052fd0c933ad223136f749649c81c7f46392a26ad3a7e1c0de593c9c43876421  notes/SEC_E45_20261124.md
b7a481c39d2b53f023f9c1c0e62d381e0e2c46723908706c4c5d4f049bfdad73  notes/SEC_E46_20261124.md
2ccaebf17f44c889a3230f70504094c8703be877d93ea425c8eed99b3cd1985e  notes/SEC_E47_20261124.md
932c383c66c5e614712b29c545de85856556c4053914d89e3deb0d916005c74b  notes/SEC_E48_20261124.md
```
