# Lean Blueprint

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The exact serving model and reasoning effort are
unavailable.

This blueprint starts with the three formalization targets and the supplied
chart argument from [Sections and Connections](../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex).
The manuscript was inspected at checkout
`fb37f1bbb1a6aea44838f2d7746ed4d6cc164a67` with source SHA-256
`329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`.
The blueprint gives mathematical statements and proof sketches. The
[pilot note](../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/brainstorm/notes/LEAN_FORMALIZATION_PILOT_20261125.md)
records the upstream geometry sources. The
[formalization register](../investigations/01_sections_and_connections/research-progress/REGISTER.md)
tracks Lean proof tasks, and the
[manuscript research register](../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/research-progress/REGISTER.md)
tracks the underlying mathematical investigation.

| Blueprint entry | Manuscript label |
| --- | --- |
| Three-axis Weyl estimate | `secjet:orthogonal` |
| Flat Weyl and Bach symbols | `msneck:symbols` |
| Chiral curvature projection | `lift:projection` |
| Weyl energy in one annular chart | `msneck:annulus` |
| Supplied chart limit and open neck control | `msneck:no-neck-target` |

The [finite accounting section](src/neck_accounting.tex) records the checked conditional energy identity, strip bounds and comparison hypotheses. The [Route 02 register](../investigations/02_neck_energy_accounting/research-progress/REGISTER.md) distinguishes those results from the open physical extraction and first-variation problems.

The [spinor transmission section](src/spin_transmission.tex) records the weighted and normalized residual criteria and the local spinor and boundary estimates. [Route 04 register](../investigations/04_dirac_collar_transmission/research-progress/REGISTER.md)

Edit [content.tex](src/content.tex) for mathematical statements, proofs and
dependencies. Place `\uses` in the statement or proof that needs the
dependency. Add `\lean` when the corresponding Lean declaration exists
and use `\leanok` in each environment whose statement or proof has been
checked. The null evaluations, the three-axis statement and its proof
have been checked in the [Lean module](../SectionsAndConnections/ThreeAxisWeyl.lean).
[Lean Blueprint documentation](https://github.com/PatrickMassot/leanblueprint#writing-your-blueprint)

## Local builds

From `formalization/`, install the pinned Python dependencies in a virtual
environment. The PyGraphviz pin has a wheel for Apple Silicon with CPython
3.10 or later. [PyGraphviz distribution](https://pypi.org/project/pygraphviz/2.0.4/#files)

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r blueprint/requirements.txt
make -C blueprint
```

The Makefile runs LaTeX and the Lean Blueprint plasTeX plugin from the
blueprint source directory. Lean Blueprint 0.0.20's CLI locates Lake at the
Git root. The Makefile supports this repository's Lake package in
`formalization/`.

The PDF is generated at `blueprint/print/print.pdf`. The web build writes
its HTML and graph under `blueprint/web/`. Run `make -C blueprint pdf`
to rebuild the PDF with TeX alone.

To serve the generated pages locally from `formalization/`, run the
following and open [localhost:8000](http://127.0.0.1:8000/).

```sh
python3 -m http.server --bind 127.0.0.1 --directory blueprint/web 8000
```

The web build runs `lake build` and writes the linked declaration names
to `blueprint/lean_decls`. For project declarations the [source links](src/localleansource.py)
use the compiled Lean declaration positions. Selecting a Lean name in the
statement or dependency graph opens the corresponding line of the local
source, included with the generated HTML.
