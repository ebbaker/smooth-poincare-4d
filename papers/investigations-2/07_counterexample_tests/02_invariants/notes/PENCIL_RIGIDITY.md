# The critical angular residue of a spinor pencil

27 November 2026 (New York). Prepared for Edward B. Baker III by the OpenAI Codex research lead. Selected GPT-6.2 Astra/ultra, serving settings not independently exposed. WIN-B05/B06, proof revision 1. Baseline 86b24d9f9c2d. Smooth Riemannian signature and right quaternionic half-spinors throughout. The first-series [twistor conventions and individual relative error](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md) and the [frozen angular calculation](../research-progress/handoffs/REQUEST_AVERAGE_R1.md) fix the inputs. Evidence at issue: a project proof for supplied smooth fields and a global infimum over them.

## A first jet on the incidence graph

Fix a closed oriented smooth homotopy four-sphere with metric g. Write P for its positive twistor operator and D for its positive Dirac operator, so that P_X s=∇_X s+c(X)Ds/4. Choose an ordered quaternionic pair of smooth positive spinors giving a fibre-surjective evaluation E_x from H² to S⁺_x. Assume constant-coefficient independence as global sections (automatic from fibre generation and nontrivial c₂). Write s_u=Eu, B_x u=(P s_u)(x) with u held constant, m=||E_x||, K_x=ker E_x. A unit k in K_x is defined up to right Sp(1). Fibre metrics are the spin metrics, twistor norms use the tensor metric. Define
\[
  R_g(E)=\int_M \frac{|B_x k|^4}{m(x)^4}\,dV_g.
\]
This is independent of the unit choices in K, of spin frame and of unitary changes of pencil basis. A common positive smooth multiplier of its generators leaves R unchanged. At the vanishing parameter the derivative of that multiplier multiplies the zero section value, and m scales by the same factor. For arbitrary constant invertible changes of basis vanishing of R is invariant, although the number need not be. With fixed parameter metric, conformal twistor transport scales |B|/m by inverse length and preserves R. Giving the pencil the ambient L² metric again after conformal change can change the angular weighting.

Use probability on unit S⁷ in H², equivalently its projective pushforward. The normalized cutoff |Eu|>εm and the fourth power of |Bu|/|Eu| give
\[
 I_\epsilon=12 R_g(E)\log(1/\epsilon)+O(1).
\]
At fixed x write u=k a+v b with v unit orthogonal to k. The density of t=|b|² is 6t(1−t)dt by polar coordinates in two real four-planes. At t=0 the numerator is |Bk|⁴ and is uniformly within O(√t) of this limit. The denominator is m⁴t². Integration from ε² gives the coefficient; m has a positive minimum by compactness. If B kills K, the integrand is bounded even before cutting off. Hence the untruncated mean is finite exactly when R=0. The zero incidence graph has product measure zero. This definition integrates the quotient on its natural nonzero set without assuming transversality of every member. [Exact angular integral](E14_ANGULAR_RESIDUE.md).

## Rigidity of an attained zero

**Claim.** An attained R=0 implies that the kernel-line map f(x)=K_x to HP¹ is a conformal diffeomorphism for the round conformal structure on HP¹. Conversely on every conformally round class the transported round twistor pencil attains zero. For a specified pencil R=0 may be tested entirely on its incidence graph.

Smoothness changes the zero integral into the pointwise equality B|K=0. Then T=B E*/m² is a smooth quaternionic-linear bundle map from S⁺ to the twistor bundle. It satisfies B=T E. In particular every constant combination solves the same equation
\[
 \nabla_X s=c(X)h+T_Xs,\qquad h=-Ds/4.
\]
We give the uniqueness step for this perturbed equation. At a normal frame, commute two derivatives. The tensor with components c(e_j)∇_i h−c(e_i)∇_j h is a smooth linear function of s,h involving the curvature, T, ∇T and T². Indeed all other differentiated terms are (∇_i T_j)s and T_j∇_i s and their antisymmetrizations, besides R^S_{ij}s. The principal linear map L from (b_i) to (c_j b_i−c_i b_j) is injective. If Lb=0 then b_j=−c_i c_j b_i for i≠j; substitution for distinct i,j,l into c_l b_j=c_j b_l gives 2c_i c_j c_l b_i=0. Clifford multiplication by each unit vector is invertible. The bundle left inverse (L*L)⁻¹L* is smooth. Thus ∇h too is a smooth linear expression in s,h. Ordinary differential uniqueness along paths implies that s and h vanishing together anywhere forces s identically zero. This proof allows arbitrary smooth T with the stated factorization. Friedrich's prolongation is the T=0 precedent, §2 (2.2), pp. 61–62. [Primary text](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf)

At x choose a unit parameter k in the kernel and hold it fixed when differentiating s_k. It vanishes at x, so h_k(x) is nonzero by independence and uniqueness. For a local unit lift k(y) of f, differentiating E_y k(y)=0 gives
\[
 E_x\,\operatorname{pr}_{K^\perp}d_X k=-\nabla_X s_k=-c(X)h_k .
\]
Under T_K HP¹=Hom_H(K,K^⊥), evaluation at k is an isometry for the homogeneous metric up to its fixed overall normalization. E on K^⊥ is a similarity of factor m. The Clifford identity |c(X)h_k|=|X||h_k| shows df is a similarity of positive factor |h_k|/m in this normalization. A local diffeomorphism from compact connected M to connected HP¹ is onto and a covering; the target is simply connected. This proves the claim including the absence of branch points. Orientation can be matched to the prescribed sphere by a round reflection. The converse uses the two-dimensional quaternionic round kernel, its surjective evaluation and conformal transport. [Round control](E10_ROUND_INSERTION.md).

## A strict first-order certificate

For a given pair it suffices at every x to verify
\[
  \|X\mapsto (P_Xs_k)(x)\|_{\rm op}<|Ds_k(x)|/4.
\]
Subtracting the two maps in the twistor equation gives a strictly positive lower singular-value bound for ∇s_k, then for df after division by m. The covering argument recognizes the supplied smooth sphere. This conclusion needs no field equation, angular evaluation or prolongation. It is open for a sufficiently small smooth perturbation of a round metric and pencil (C¹ control of fields and metric suffices in common frames), because the compact round control has a strictly positive minimum of |Ds_k|/(4m) and zero projected term. Directly checking the least singular value of ∇s_k is also sufficient and may be sharper. These are sufficient recognition tests. Finding globally generating fields and verifying estimates on a full handle cover are costs on the input side. One failed bound has no exoticity implication.
