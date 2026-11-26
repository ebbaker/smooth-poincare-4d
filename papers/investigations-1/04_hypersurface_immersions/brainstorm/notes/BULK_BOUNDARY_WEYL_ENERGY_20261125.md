# Five-dimensional bulk formulas for boundary Weyl energy

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance in response to his proposal to minimize a boundary energy by evolving a bulk field. Exact serving model and effort were unavailable. The manuscript conventions below are those at checkout `95a4f50eb9ec`. The volume anomaly is an existing theorem. The collar identities, proposed gradient dynamics and fixed-regularization argument are analytical deductions in this note. [Earlier harmonic driving proposal](AMBIENT_HARMONIC_DRIVING_20261125.md) · [Master normalization](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L173) · [Immersed recognition theorem](../../../../master/manuscript/immersion_entry.tex#L13)

## An intrinsic energy read from five-dimensional volume

Let $M$ be a smooth closed oriented homotopy four-sphere and $g$ a smooth Riemannian metric. If $G_+$ is a five-dimensional Poincaré–Einstein metric with conformal infinity $(M,[g])$, normalize $\mathrm{Ric}(G_+)=-4G_+$. In a geodesic defining function $r$ corresponding to $g$, denote by $L$ the coefficient multiplying $\log(1/\epsilon)$ in the expansion of the volume cut off at $r=\epsilon$. Graham's four-dimensional boundary formula reads

$$
 L=\frac{\pi^2}{2}\chi(M)-\frac1{64}\int_M |W_g|_{(0,4)}^2\,dV_g
   =\pi^2-\frac18 E_+(g).
$$

The second equality uses $\chi(M)=2$, vanishing signature and the manuscript's Hilbert–Schmidt norm on the chiral blocks. Equivalently, $L=\frac14\int_M\sigma_2(P_g)\,dV_g$, for the Schouten tensor $P_g=(\mathrm{Ric}_g-R_g g/6)/2$. Fefferman and Graham also derive the integrated $Q$-curvature formula for $L$ by Green's identity on a truncated collar. The local formal Poincaré expansion already determines $L$ for every boundary class. An interpretation as the volume of a complete Einstein filling requires such a filling. [Graham, §3](https://arxiv.org/pdf/math/9909042#page=9) · [Fefferman and Graham, Theorem 3.2](https://arxiv.org/pdf/math/0110271#page=8)

| Hypothesis on the boundary metric | Condition on $E_+$ | Equivalent condition on $L$ |
| --- | --- | --- |
| Positive Yamabe class, entry into the strict band | $E_+<8\pi^2$ | $L>0$ |
| Positive Yamabe class, intrinsic recognition | $E_+\le4\pi^2$ | $L\ge\pi^2/2$ |
| Metric induced by an actual Euclidean hypersurface immersion, immersed recognition | $E_+\le64\pi^2/9$ | $L\ge\pi^2/9$ |

The round boundary has $L=\pi^2$. Evolving only the interior while fixing its conformal infinity preserves $L$. A descent mechanism based on this coefficient must move the boundary conformal class.

## A positive volume integral on the actual collar

Take a compact five-dimensional Riemannian collar $(X,G)$ with boundary faces $M_0=M$ and $M_1$, and let $g=G|_{TM_0}$. Here $G$ is free. Write $n$ for the outward bulk normal and $\Delta=\operatorname{div}\nabla$ on functions. Solve the torsion problem $-\Delta_G\tau=1$ with zero Dirichlet values on both faces. Then $\tau>0$ in the interior and $q=-\partial_n\tau>0$ on $M_0$. Embed the endomorphism $W_g^+$ isometrically into $\operatorname{End}(\Lambda^2 T^*X)$ along $M_0$ by extending it by zero on the orthogonal complement of $\Lambda^+_g$. Take its harmonic extension $U$ in this ambient tensor bundle with the following data,

$$
 \nabla_G^*\nabla_G U=0,\qquad
 U|_{M_0}=q^{-1/2}W_g^+,\qquad U|_{M_1}=0.
$$

The connection is metric, so $\Delta_G|U|^2=2|\nabla_G U|^2$. Green's second identity with $\tau$ now gives the exact positive bulk formula

$$
 E_+(g)=\int_{M_0} q|U|^2\,dV_g
       =\int_X \left(|U|^2+2\tau|\nabla_G U|^2\right)dV_G.
$$

This is the value of the boundary energy itself. The trace condition enforces the relation between $U$ and the Weyl curvature of the evolving metric. The identity works on the actual bounded interior of an embedded hypersurface with $M_0$ as its sole boundary. For an arbitrary immersion $F$ one can take the abstract collar of $(x,s)\mapsto F(x)-s\nu(x)$ with its pulled-back Euclidean metric, choosing its width before the first focal point. This counts all sheets. On a Euclidean face the tangential Hessian of $\tau$ also recovers the second fundamental form in the outward-normal convention, $\nabla^2\tau(X,Y)=q\,\mathrm{II}(X,Y)$. Gauss' equation then determines the Weyl tensor used as boundary data.

## A bulk metric that moves in the descending direction

At each smooth bulk metric $G$ on a collar, extend the boundary Bach tensor $B_g$ by zero on normal slots to obtain $\widetilde B_g$. Solve on symmetric two-tensors and evolve the entire five-dimensional metric by

$$
 \nabla_G^*\nabla_G H=0,\qquad
 \nabla_n H|_{M_0}=\widetilde B_g,\qquad H|_{M_1}=0,
 \qquad \partial_tG=H .
$$

The far Dirichlet face removes the parallel kernel. Mixed elliptic theory on disjoint smooth faces gives a unique smooth $H$ at each smooth $G$. Testing against a tensor $S$ vanishing on $M_1$ gives $\int_X\langle\nabla H,\nabla S\rangle=\int_{M_0}\langle B_g,S^\top\rangle$. In the manuscript normalization $DE_+(g)[h]=-\frac12\int_{M_0}\langle B_g,h\rangle$. Taking $S=H$ yields, on every smooth interval,

$$
 \frac{d}{dt}E_+(g_t)=-\frac12\int_X |\nabla_G H|^2\,dV_G .
$$

This velocity is twice the negative gradient for the indicated bulk Dirichlet inner product. Its dissipation vanishes exactly when $B_g=0$. Freezing $H$ at a non-Bach-flat initial metric gives a strict decrease along the actual metrics $G+tH$ for sufficiently small positive $t$. The coupled unsmoothed evolution has a separate well-posedness question. The boundary coefficient $L([g_t])$ increases at one eighth of the energy loss. The actual evolving $G$ is the compact collar metric. Realizing $L([g_t])$ by a family of complete Einstein fillings is an additional problem. [Chiral Bach variation](../../../03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3671)

There is a more restrictive choice if the boundary must remain induced by a Euclidean immersion. For an embedded interior $K$, set $b=\langle B_g,\mathrm{II}^\circ\rangle_g$ and solve the vector Neumann problem $\Delta V=0$, $\partial_n V=b\nu$, $\int_K V=0$. The compatibility condition $\int_{\partial K}b\nu=0$ follows by applying the first variation to each constant ambient translation. Moving $F$ with velocity $-V|_{\partial K}$ gives $\dot E_+=-\int_K|\nabla V|^2$. On a sheet-labelled collar use the same data on $M_0$ and homogeneous Neumann data on $M_1$. This allows distinct velocities for different sheets. The single ambient velocity formulation is in the earlier note. These Euclidean shape variations retain the immersed recognition threshold, and stationarity only requires $b=0$. A freely evolving bulk metric accesses the full $B_g$, and its boundary is governed by the intrinsic recognition criteria. [Ambient first variation](AMBIENT_HARMONIC_DRIVING_20261125.md#an-ambient-field-that-includes-every-sheet)

## A globally defined regularization

One can make a smooth bulk descent exist at all finite times by choosing a fixed smoothing scale. Take $X=M\times[0,1]$, $\gamma=g_0+ds^2$ with $g_0$ any given smooth metric, and let $Z$ range over the real $L^2(X,\gamma)$ space of $\gamma$-self-adjoint endomorphism fields. Use the product connection heat operator $K_\ell=\exp(-\ell^2 A)$, $\ell>0$, where $A=-\partial_s^2+\nabla_M^*\nabla_M$ has Neumann condition at $s=0$ and Dirichlet condition at $s=1$. Define

$$
 G_Z=\gamma\bigl(\exp(K_\ell Z)\,\cdot,\cdot\bigr),\qquad
 J(Z)=E_+(G_Z|_{TM_0}),\qquad
 \dot Z=-\operatorname{grad}_{L^2(X,\gamma)}J(Z),\quad Z(0)=0 .
$$

The product eigenmodes are tangential eigentensors times $\cos((k+\tfrac12)\pi s)$, $k\ge0$. Their heat multipliers give bounded maps $L^2\to C^m$ for every finite $m$, by elliptic Sobolev estimates or the product heat kernel. The exponential gives a smooth positive metric and fixes the far face. Curvature depends smoothly on a positive metric and its first two derivatives, so $J$ is smooth with locally Lipschitz gradient on the Hilbert space. Picard's theorem gives a local solution. Its exact loss is $\dot J=-\|\dot Z\|_2^2$. For $s<t$ this implies

$$
 \|Z(t)-Z(s)\|_2\le\sqrt{(t-s)(J(Z(s))-J(Z(t)))} .
$$

Since $J\ge0$, there is an $L^2$ limit at every finite maximal endpoint. The evolution restarts there, proving existence for all finite times with spatially smooth positive metrics. At $M_0$ the traces of heat-smoothed variations contain all finite sums of tangential eigenmodes, dense in smooth boundary tensors. The fiberwise differential of the exponential on self-adjoint matrices is invertible. Consequently $DJ=0$ exactly at a Bach-flat boundary. This is a regularized choice of bulk gradient depending on $\gamma$ and $\ell$. The proof gives neither a uniform estimate as $\ell\downarrow0$ nor compactness as $t\to\infty$. [Heat kernels on compact bundles](https://arxiv.org/abs/1607.05152)

## The estimate needed for smooth recognition

Start with a positive Yamabe class on a fixed smooth type and energy $e_0<8\pi^2$. A continuous decreasing path stays in positive classes by the manuscript's scalar-flat barrier. For the regularized metric flow, with $I^+(M)$ the positive-class infimum, this gives the sharper test

$$
 \int_0^\infty \|\dot Z\|_{L^2(X,\gamma)}^2dt
       = e_0-\lim_{t\to\infty}E_+(g_t)
       \le e_0-I^+(M).
$$

On a minimizing sequence the right side tends to zero. An independent lower bound for bulk dissipation exceeding this excess at one index would exclude that hypothetical smooth type in the stated band. The positive bulk formula for $E_+$ controls a harmonic lift of $W^+$, whereas dissipation measures a response to $B_g$. Bounding the latter using the former on the charged geometry, or excluding a nonround stationary or degenerating limit, is the missing research step. [Positive-class barrier](../../../../master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex#L120) · [Current charged geometry](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L425)

The equal-radius product $S^2\times S^2$ illustrates the need for the topology and energy range in such an estimate. Its unit-factor metric is Einstein, hence Bach-flat. The eigenvalues of its $W^+$ block are $2/3,-1/3,-1/3$, and its volume is $16\pi^2$, giving $E_+=32\pi^2/3$ and zero bulk gradient dissipation. This example lies outside the homotopy-sphere class and above the strict band. [Product curvature calculation](../../../../master/01_fixed_type_variational_descent/manuscript/core_variation.tex#L104)

The repository recorder had no authenticated public transcript for this exchange.
