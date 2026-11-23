# SP4-CME-E66 request v1 — elliptic strain control in the fixed round slice

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured gpt-6.2-sol/ultra; lead identifiers unavailable. Execute B43's fixed estimate; own notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md and research-progress/handoffs/SP4-CME-E66_RETURN_v1.md only.

Frozen inputs:
- notes/47_ROUND_STABLE_LINEAR_20261122.md SHA-256 ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6
- notes/53_CRITICAL_FINITE_P_HEAT_20261122.md SHA-256 6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312
- notes/59_CRITICAL_PATH_STRAIN_20261122.md SHA-256 2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a
- notes/05A_REAL_TWISTOR_COMPARISON_20261122.md SHA-256 ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2

Setting: oriented standard round S4, native pairing/metric g0 and positive perfect A0. Smooth a=A−A0, beta=F_A−F0. Impose exact fixed slice S0* a=0 and d0* a=0. Assume ||a||C0+||beta||C0≤rho in fixed reference norms, for a sufficiently small fixed rho. No smallness of higher derivatives is assumed. D0 is the round induced reference derivative, W^(2,(4,1)) is the sum of the L^(4,1) norms of D0^j a, j=0,1,2. The Lorentz convention is integral_0^Vol s^(−3/4) f*(s) ds. Strain uses the live reconstructed metric; explicitly compare its norm and volume with the reference in the value tube.

Prove or precisely refute ||a||W^(2,(4,1))≤C||T(A)||L^(4,1)(g_A), and deduce ||(a,beta)||localized B^(1/2)_(8,1)≤C||T(A)||L^(4,1)(g_A). Neither estimate may assume slice existence.

Required steps: establish the fixed G0 elliptic bound ||G0^−1 f||W^(2,(4,1))≤C||f||L^(4,1). E47 supplies the positive L2/H2 realization. For p8 derive the local homogeneous matrix multiplier estimate (or provide an inspected exact primary theorem with every hypothesis), freeze and patch smooth coefficients, handle lower terms, and use the L2 inverse plus fixed H2→L8 bound to remove the zero-order remainder. A direct Fourier/CZ proof may follow the actual dyadic kernel and decomposition method in E41 if read and versioned. Derive Lorentz boundedness from the strong L2 and L8 operators on arbitrary vector layers: the output L^(4,1) norm of a layer is bounded by its L2 norm to power1/3 times L8 norm to power2/3, and then integrate layers. Supply this interpolation inequality and any completeness passage, not merely its name.

Use the exact E47 P0=sqrt(8) tf L0 normalization. Derive the q=Q−I expansion and its covariant derivative using parallel F0; express G0a on the imposed slice and estimate D0q by nabla_A Q and [ad(a),q]. Show all error terms are C rho times the W^(2,(4,1)) norm, with a finite explicit absorption choice. For the pair critical norm, one allowed route strengthens E53's low-block estimate from L8 to L1 (finite low modes) and localizes it, accounting for fixed cutoff, coordinate and connection terms. Use beta=d0a+[a wedge a]/2. Do not invoke an unverified endpoint Sobolev theorem or an unproved gauge slice.

Return exact signs, constants up to specified fixed geometric factors, norm quantifiers and first obstruction if any. New primary sources require exact version/passage/hypotheses and inspection metadata for canonical integration. This is a fixed smooth static estimate, not a new flow or topology theorem.
