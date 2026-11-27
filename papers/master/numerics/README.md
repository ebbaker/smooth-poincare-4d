# Supporting computations

The first edition uses analytical arguments. Keep any subsequently authorized numerical checks here with their inputs and scope.

The [fixed-width rational check](fixed_width_enclosure.py) replays the hyperbolic radius bound, the two local derivative-energy ceilings and the finite lower sum for pure switching shear. Run with Python 3. The [derivation](../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md) specifies the physical domain and the terms still needed for the full Rayleigh form.

The [pause-strip calculation](pause_strip_cost.py) verifies the scalar constants in the sectional contrast and the strict complete-band floor using rational arithmetic. The [native multipole calculation](native_harmonic_measures.py) validates two harmonic fields on the original circular pants with boundary residual below \(2\cdot10^{-15}\). These fields span the two-real-parameter Hopf data; their residual alone does not bound the nonlinear cuff-length fit. [Energy proof](../reviews/NATIVE_TRIAL_INTEGRATION_20261127.md) · [Field construction and search bounds](../notes/HARMONIC_MEASURE_CERTIFICATE_20261127.md)

The [cuff fit](hopf_cuff_fit.py) solves the two-length problem on a structured quarter-pants mesh. The [radial test](native_rayleigh_fit.py) and [chiral integration](native_chiral_fit.py) use its coefficients on the original marked bands. These are floating-point diagnostics. The [smooth comparator](whole_pants_residual.py) uses a [frozen dyadic coefficient family](whole_pants_residual_d18.json). The [physical boundary-flux replay](cuff_flux_certificate.py) verifies inequalities on entire cuffs with exact polynomial arithmetic. [Rayleigh results and reproduction commands](../notes/NATIVE_RAYLEIGH_TRIAL_20261127.md)

The complete native marking certificate combines the [outer polar tiles](outer_residual_certificate.py), [central squares](interior_residual_certificate.py), [hole annuli](hole_residual_certificate.py), [four cuff edges](cuff_length_certificate.py) and [native anchor jets](native_jet_intervals.py). The [rank-two kinetic comparison](radial_kinetic_certificate.py) propagates its true parameter and height errors to the frozen radial test. [Coverage and field bounds](../notes/NATIVE_MARKED_JET_CERTIFICATE_20261127.md)

The [late-cell replay](native_late_cell.py) encloses both terms of the radial Rayleigh density on a positive-width four-dimensional cell using the actual harmonic marking.
