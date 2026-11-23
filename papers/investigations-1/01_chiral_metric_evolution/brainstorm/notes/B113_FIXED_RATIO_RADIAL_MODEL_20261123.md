# B113 — Exact radial model at each fixed nonround ratio

23 November2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Conceptual B decision by the selected lead; model/effort preserved and unavailable. Fixed E helpers configured gpt-6.2-sol/ultra, runtime attestation unavailable.

## Reason and one fixed family

The assessed near-round cutoff estimates use epsilon small. The exact leading radial curvature appears to have a stronger algebraic cap at every fixed finite r>1. Test this model and the fixed-r small-radius perturbation argument. Do not infer all-r flow or preservation failure before the static proof, its independent audit and a separate short-time application. The small-value global convergence basin remains restricted to near-round data.

Fix any finite r>1, p=sqrt(2/(1+r)) in (0,1), q=sqrt(2r/(1+r)) in (1,sqrt2), with p^2+q^2=2 and r=q^2/p^2. Here p denotes a spectral number only; use x0 for the center to avoid collision. The center root triple is (p,1,q). Use E235's exact local polynomial and E243's fixed radial cutoff c, 0<=c<=1, c'<=0, |c'|<=5/2. Now R>0 is chosen sufficiently small depending on this fixed r, rather than R=epsilon^2. On the fixed compact parameter rectangle u in[0,1],v in[-5/2,0], unit Euclidean n, define the leading actual two-form model

    F_mod=F0+u DeltaF+(v/2) n-flat wedge contraction_n DeltaF,
    DeltaF_i=-(s_i-1)Sigma_i, F0_i=-Sigma_i.

## Proposed exact algebra

Set h=u+v/4. The self-dual coefficient is -(1+h(s_i-1))Sigma_i. The anti-self-dual reflected triple Omega_i(n)=2(n-flat wedge contraction_n Sigma_i)^- should satisfy Omega_i wedge Omega_j=-2 delta_ij dV. Thus the Euclidean wedge Gram should be exactly diagonal, with

    M_i=(1+u(s_i-1)) (1+(u+v/2)(s_i-1)),  M_2=1.

Check this from exterior algebra, including all angular directions. Both factors are positive on the rectangle: for s1=p use u<=1 and u+v/2<=1; for s3=q use u+v/2>=-5/4 and q<sqrt2. The first and third entries decrease/increase respectively in both u and v. Consequently M3/M1 increases strictly in both and is at most r, with equality only at(1,0). Every other candidate eigenvalue quotient should be strictly below r throughout:

- 1/M1<=1/p^2<r, and M3<=q^2<r.
- M1<r from its maximum (9-5p)/4: equivalently 13p^2-5p^3<8, since this polynomial increases on(0,1) and equals8 at1.
- 1/M3<r from its maximum 4/(9-5q): equivalently 13q^2-5q^3>8, increasing on(1,sqrt2) and equal8 at1.
- M1/M3<r from its maximum at(0,-5/2): (9-5p)/(9-5q)<q^2/p^2. After cancellation this is 9(p+q)-5(2+pq)>0. With z=p+q in(sqrt2,2), the concave polynomial 9z-5-(5/2)z^2 is positive at both endpoints.

If verified, rho(M)<=r with equality only at(1,0), for every fixed r>1, without a near-round expansion.

## Proposed actual cutoff transfer

For fixed r the local coefficients are finite. Exact curvature of A_rd+c(|x|/R)(A_loc-A_rd) is the E243 formula. As R down to0 it approaches F_mod uniformly on R/2<=|x|<=R, all unit angles and all rectangle parameters, with the same first u,v derivatives; the weak radial reference remainder is O_r(R) and the cubic is O_r(R^2). The normalized quotient and its parameter derivatives inherit this convergence since the model Gram has a positive floor depending on r.

Near(1,0), model M1<1<M3 and both partial derivatives of log rho are strictly positive. Choose a fixed small corner neighborhood where this persists. For R small the actual quotient retains simple ordered extrema and both positive parameter derivatives. Integrating from(1,0) to an actual corner parameter then bounds f(Q_actual) by f(Q_loc(x)), which is strictly below log r throughout a sufficiently small punctured ball by assessed E235 at this fixed r. Outside the corner neighborhood, the compact rectangle has a strict model gap from r; uniform convergence transfers that gap. Positivity of the actual curvature follows from the compact positive model floor and the local/core/exterior bounds; the sign agrees with round by continuity on the connected base and its round exterior. Every radius and constant may depend on r. This proposes an actual smooth closed connection with unique global ratio maximum r and the same native local directional derivative1/2 for each fixed finite r>1.

## Scope and packets

E248 derives only the exact model and the fixed-r static transfer, one family with no computational search. A failed quotient or corner estimate returns to the lead; no alternate cutoff or mechanism inside the packet. Independent audit and actual short-time flow application will be separate. No global-in-time or round convergence assertion for arbitrary r is proposed here. No unknown-sphere initialization, uniform radius in r, or novelty is claimed.

Inputs: [E235](../../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md), [E235/E236](../../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md), [E243](../../notes/243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md), [E243–E245 assessment](../../reviews/E243_E245_GLOBAL_RATIO_CAP_ASSESSMENT_20261123.md). Exact primary dependencies remain the prior canonical records.
