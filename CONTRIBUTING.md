# Contributing

Contributions should make a mathematical claim more precise or easier to
check. Begin with the relevant investigation's overview, plan and sole progress
register, and follow [AGENTS.md](AGENTS.md).

For a verification, identify the exact manuscript version, proposition or
equation and its hypotheses. Work from definitions and primary references;
state what was checked independently and which premises were reused. Save the
assessment in `reviews/` and link it from the task's live register. A scoped
failure or reproducible counterexample is useful evidence. Model changes alone
do not constitute independent specialist review.

For a possible error, provide the source, location, disputed assertion and a
counterexample, recomputation or precise failing step where possible. Preserve
prior evidence and record corrections explicitly. Do not silently promote
conditional or local claims to global results.

For a formalization, first identify the exact statement, definitions,
normalizations, dependencies and intended proof assistant. Coordinate ownership
through a task or issue; place actual formal code under the investigation when
work begins. No formalization framework or completion is implied by this setup.

Before a code contribution, run relevant existing tests and the repository
hygiene check. Before a manuscript contribution, build the changed source and
inspect the resulting PDF. Record meaningful validation and limitations; tests
of organization or compilation do not validate mathematics.

Disclose substantial language-model assistance and actual available
model/effort. Text and code contributions follow the existing dual-license
notice in [LICENSE.txt](LICENSE.txt): text under CC BY 4.0 and code under MIT.
Third-party reading copies retain their own rights and remain excluded from Git.
