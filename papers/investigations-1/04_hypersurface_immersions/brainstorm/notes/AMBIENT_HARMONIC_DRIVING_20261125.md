# Driving an immersed four-sphere from the surrounding five-dimensional space

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance in response to his Loewner analogy. Serving model and effort were unavailable. The comparison uses the immersion theorem and chiral first variation at checkout `95a4f50eb9ec`. The calculations give instantaneous variations, and integrated identities on any smooth interval of the proposed evolutions. Existence of a qualifying trajectory on every smooth type is open. [Master Theorem 3.1](../../../../master/manuscript/immersion_entry.tex#L13) · [Chiral first variation](../../../03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3671)

## A pole drives growth on an embedded boundary

Suppose first that a smooth closed oriented hypersurface $F(M)=\Sigma$ is the boundary of a bounded region $K\subset\mathbb R^5$, with connected exterior $\Omega$. Write $g=F^*\delta$ and let $\nu$ point into the exterior. Choose a point $z\in\Omega$. Let $G_\Omega(z,y)$ be the Green function for $-\Delta$ with zero Dirichlet boundary values and decay at infinity. Its inward normal derivative for the exterior problem is the positive Poisson kernel

$$
 P_\Omega(z,y)=\partial_{\nu_y}G_\Omega(z,y),\qquad y\in\Sigma .
$$

Take the outward speed of the hypersurface to be $V(y)=P_\Omega(z,y)$, with a moving pole $z_t$ along an evolution. A positive distribution of poles gives the corresponding average of the speeds. This is a five-dimensional version of Green-function-driven Laplacian growth. The features borrowed from Loewner evolution are the changing domain, a driver, and a capacity parametrization. In real dimension five smooth conformal maps of connected domains are restrictions of Möbius maps, so planar conformal uniformization cannot supply the evolution maps for general hulls. [Viklund and Wang on the planar driving measure](https://arxiv.org/abs/2012.05771) · [Lundberg and Totik, Green-function boundary velocity, eq. (1)](https://publicatio.bibl.u-szeged.hu/3232/1/2220876.pdf) · [Higher-dimensional Laplacian growth](https://liu.diva-portal.org/smash/get/diva2%3A727948/FULLTEXT01.pdf) · [Liouville's theorem, §3.8](https://www.ams.org/bookstore/pspdf/surv-216-prev.pdf)

Use $\mathrm{II}(X,Y)=\langle\nabla_X^{\mathbb R^5}dF(Y),\nu\rangle$, let $\mathrm{II}^\circ$ denote its trace-free part, and let $B_g$ be the Bach tensor in the manuscript's convention. Put $b=\langle B_g,\mathrm{II}^\circ\rangle_g$. For a normal variation $V\nu$, differentiating the induced metric gives $\dot g=-2V\,\mathrm{II}$. The chiral first variation and the trace-freeness of $B_g$ give

$$
 \dot E_+=\int_\Sigma Vb\,dA_g
          =\int_\Sigma P_\Omega(z,y)b(y)\,dA_g(y)
          =(\mathcal H_\Omega b)(z).
$$

Here $\mathcal H_\Omega$ denotes harmonic extension with decay at infinity. The sign of this one harmonic function determines which pole positions lower the induced chiral Weyl energy at this shape. Near any smooth boundary point $y$ these values converge to $b(y)$. A point where $b<0$ therefore gives descending outward speeds for finite poles nearby. Every smooth speed used here defines a first variation. Continuing the prescribed law requires a smooth moving boundary and an admissible pole at subsequent times.

## The energy change per unit capacity

Let $u$ be harmonic on $\Omega$, equal to one on $\Sigma$ and tending to zero at infinity. Write $q=-\partial_\nu u>0$ and use the unnormalized Newtonian capacity $C(K)=\int_\Omega|\nabla u|^2dy$. Under outward speed $V$, the derivative of $u$ at fixed spatial points has boundary value $Vq$. Integration by parts in the differentiated Dirichlet integral gives $2\int_\Sigma q^2V\,dA_g$ from the potential variation and $-\int_\Sigma q^2V\,dA_g$ from the moving boundary. Thus $\dot C=\int_\Sigma q^2V\,dA_g$. [De Philippis, Marini and Mukoseeva, capacity variation in §2](https://cvgmt.sns.it/media/doc/paper/4207/stabisocap.pdf)

For the pole law the capacity is increasing and

$$
 \frac{dE_+}{dC}
  =\frac{(\mathcal H_\Omega b)(z)}
          {(\mathcal H_\Omega q^2)(z)},\qquad
 \inf_{z\in\Omega}\frac{(\mathcal H_\Omega b)(z)}
                         {(\mathcal H_\Omega q^2)(z)}
  =\min_{y\in\Sigma}\frac{b(y)}{q(y)^2}.
$$

The ratio is a weighted average of $b/q^2$. Approaching a minimizing boundary point proves the infimum formula. A lower bound on pole clearance restricts that optimization. The quantity $C\,dE_+/dC$ is dimensionless because capacity has length dimension three in $\mathbb R^5$. The target would be to accumulate a decrease of at least $E_+(g_0)-64\pi^2/9$ at a finite smooth slice whenever the initial energy exceeds the recognition threshold. A negative derivative at one pole gives a local direction. An estimate on its magnitude and duration is still required.

## An ambient field that includes every sheet

The master supplies a smooth immersion on every smooth homotopy four-sphere. A single exterior of its image can miss sheets and can have crossings on its boundary. One way to keep the actual immersion is to use all its sheets as sources for a vector-valued Newtonian potential. Define the ambient vector measure $\sigma_F=F_*(b\nu\,dV_g)$ on $\mathbb R^5$. For any smooth ambient velocity $X$, tangential velocity contributes only reparametrization, so $\dot E_+=\int X\cdot d\sigma_F$. Both signs in $b\nu$ reverse together under reversal of the normal.

For a smooth version fix an even compactly supported mollifier $\rho_\epsilon$ of integral one. Solve componentwise on the entire Euclidean space and advect the given immersion by the resulting ambient velocity,

$$
 -\Delta U=\rho_\epsilon*\sigma_F,\qquad U(\infty)=0,
 \qquad X=-\rho_\epsilon*U,\qquad \partial_t F=X\circ F .
$$

The fields are smooth at fixed $\epsilon>0$. Symmetry of convolution and integration by parts in $\mathbb R^5$ give, on any smooth evolution,

$$
 \dot E_+=-\int_{\mathbb R^5}U\cdot(\rho_\epsilon*\sigma_F)\,dy
         =-\int_{\mathbb R^5}|\nabla U|^2\,dy .
$$

This version allows inward and outward motion. Every preimage contributes to the measure, and a common ambient point receives one velocity. The tradeoff is that nested hulls are no longer assured. A stationary immersion can have $\langle B_g,\mathrm{II}^\circ\rangle=0$, and the smoothing introduces a length scale. A proof using this version would need to exclude high-energy stationary or degenerating trajectories, or find another way to bound their integrated dissipation. The exterior pole model is the closer analogue of Loewner growth. The all-sheet model retains the starting object furnished by the master.
