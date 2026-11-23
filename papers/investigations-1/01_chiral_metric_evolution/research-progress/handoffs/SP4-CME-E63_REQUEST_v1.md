# SP4-CME-E63 request v1 — fixed positive-time linear smoothing bound

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured gpt-6.2-sol/ultra; lead actual identifiers unavailable. Read B42. Own notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md and research-progress/handoffs/SP4-CME-E63_RETURN_v1.md only.

Frozen input: notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md SHA-256 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77. Use its exact fixed compact-bundle system, norms, completed source/solution spaces and smooth spatial-flow parameter construction, restricted to the round stationary reference. No independent claim about the underlying linear estimates is assigned.

For fixed integers k≥0 and any compact positive-time strip [delta,T'] with 0<delta<T'<T, prove or refute a neighborhood estimate

 sup_(t in [delta,T']) ||U(t;u0)−U(t;v0)||C^k ≤ C_(k,delta,T') ||u0−v0||C0

for continuous independent initial pairs u0,v0 in a sufficiently small C0 ball about zero, with all fixed parameters made explicit. A fixed-time H^m estimate for integer m≥6 follows if the C^m assertion is proved. At zero datum obtain ||U(t;u0)||C^k ≤C||u0||C0 by stationarity. The result may shrink the datum ball with k/strip and may deteriorate as delta→0. Do not assert a common all-orders threshold or a trace derivative bound at time zero.

Start from E42's proved joint C-infinity map (s,u0)↦U_s in X_T° via the Neumann inverse. Show the needed mixed derivatives D_u0 partial_s^alpha are bounded on a common small finite-parameter tube and small datum neighborhood, without invoking compactness of an infinite-dimensional ball. Verify that all parameterized zero-data solutions vanish. Extract spatial derivatives by the datum-independent local inverse of s↦phi_(t,s)(x*) and parallel transport, with bounded finite coefficients on a finite cover of the strip; justify uniform evaluation and the C^k Banach norm. State exactly what E42 smoothness implies and prove any additional operator-norm step.

Optional fixed finite time-derivative versions may use the actual PDE and the same spatial bounds, but are unnecessary. No original continuous-data recovery, global derivative bound or linear temporal budget is proved in this packet. Report hashes and any primary-source reinspection accurately. If the exact estimate fails, identify the first missing differentiability premise; do not silently replace it by a continuity claim.
