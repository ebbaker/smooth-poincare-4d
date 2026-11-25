# Edition 03 · Progress at the parallel route setup

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving configuration unavailable. This is a dated baseline for the [overview](../research-overview/03_OVERVIEW.md) and [plan](../research-plan/03_PLAN.md). The [program register](REGISTER.md) directs subsequent returns to one owner per task.

## What was transferred

| Scope | Edition 03 live owner | Inherited evidence and readiness |
| --- | --- | --- |
| VAR-E05, VAR-B03, VAR-E07, VAR-E08 | [06 · Physical scales](../06_physical_scales_and_marked_annuli/research-progress/REGISTER.md) | Existing measured accounting and conditional budgets supply inputs. The opening finite averaging proposition elaborates. Compactness, physical realization and the global shell remain distinct tasks. |
| VAR-E06 | [07 · Fixed-type descent](../07_fixed_type_variational_descent/research-progress/REGISTER.md) | The limit statement elaborates independently of VAR-E01. Application to marked positive repairs needs VAR-E01, a uniform cardinality bound at fixed tolerance and the full residual. |
| FOT-E36 | [08 · Immersion bounds](../08_hypersurface_immersion_bounds/research-progress/REGISTER.md) | Middle-signature bound with equality and negative-determinant deficit constitute the same inherited task. Its first scalar proposition elaborates. The smooth Gauss–Codazzi argument, height count and whole-immersion budget are further inputs. |
| New HT family | [09 · Morse heights](../09_morse_heights_and_handle_recognition/research-progress/REGISTER.md) | The probability statement elaborates. Its geometric application requires the actual indexed Gauss identity, a topological lower count and Route 08's energy estimate. Recognition of the selected marked diagram remains conditional. |
| Continuing work | [03 · Single cut](../03_single_cut_descent/research-progress/REGISTER.md), [05 · Local comparison](../05_variational_comparison/research-progress/REGISTER.md) and [parent](REGISTER.md) | CUT-E02 and VAR-E01 retained their checked opening types. CUT-E05 stays with 03. VAR-B01/B02 and VAR-E01–E04 stay with 05. FOT-E35 and E37 stay with the parent. The original pilot, accounting and spin proofs retain their owners. |

The [Edition 02 baseline](02_BASELINE.md) records the previously proved Levi-Civita, pullback, infimum, cap, measure and spinor statements, their axioms and their remaining geometric premises. Edition 03 adds four research owners, proposed theorem statements and the corresponding blueprint dependencies. The four new opening proofs await activation.

## Inputs at issue

The master manuscript in `2689540e6dae1656b7f5ad4be52504db044995f2` is the mathematical input. The parallel paper plans and registers were compared by content in the checkout at `a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`. SHA-256 prefixes below distinguish the updated planning documents from those at Edition 02. The [master ownership return](../../../papers/master/research-progress/handoffs/PARALLEL_OWNERSHIP_20261125.md) is `1012d3ecc1bbb651`.

| Scientific source | Overview SHA-256 | Plan SHA-256 | Register SHA-256 |
| --- | --- | --- | --- |
| Master · [overview](../../../papers/master/research-overview/OVERVIEW.md), [plan](../../../papers/master/research-plan/PLAN.md), [register](../../../papers/master/research-progress/REGISTER.md) | `9e70b14bd8c81222` | `5c6024486b3d6ec6` | `f74bdb90670e9fe9` |
| [Neck geometry](../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/README.md) | `05315fa48a296047` | `f14d05238404021b` | `d4762c7d55497312` |
| [Fixed-type descent](../../../papers/master/01_fixed_type_variational_descent/README.md) | `201af96516fb8d93` | `a18c98ffce5fb471` | `744ba3846315e98a` |
| [Immersed handle constructions](../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/README.md) | `592e17611649fc76` | `989d356dc54762a2` | `79f90c36925ea137` |
| [Two-middle-handle recognition](../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/README.md) | `3a75a0cf96d99754` | `5f061d42ade43b0f` | `f47e75e39856cbdf` |

The [main TeX](../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) has prefix `6c47f8fe412eb856`. The [immersion](../../../papers/master/manuscript/immersion_entry.tex), [local comparison](../../../papers/master/manuscript/variational_comparison.tex), [physical volume](../../../papers/master/manuscript/physical_volume.tex), [complete limits](../../../papers/master/manuscript/complete_limits.tex), [Ricci scales](../../../papers/master/manuscript/ricci_scales.tex) and [critical annulus](../../../papers/master/manuscript/critical_annulus.tex) inputs have respective prefixes `512ef85cfa696497`, `0c9b1dce4aa655be`, `b972bc5466245c5d`, `8b5692f2bcab8747`, `091cd448e8857f10` and `c0235f11a429cbb8`. [Variational source notes](../../../references/SOURCE_NOTES_MASTER_VARIATIONAL_20261125.md) · [Ricci, immersion and topology sources](../../../references/SOURCE_NOTES_MASTER_RICCI_IMMERSION_20261125.md)

## Lean and blueprint verification

| Check performed | Result |
| --- | --- |
| Installed [toolchain](../../lean-toolchain) and [Lake manifest](../../lake-manifest.json) | Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, Lake `5.0.0-src+470d5ce`. All ten installed dependency revisions matched the manifest (`839111aae86b6935`). Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. |
| Read the fenced Lean statements from the four new route plans and elaborate with `lake env lean --stdin` under `import SmoothPoincare` | Four propositions elaborated. They cover the annular average, fixed-tolerance residual, middle-signature curvature with its equality case, and the probability of a two-middle height. These checks establish the proposed interfaces. Each proof remains to be written. |
| `lake build` and blueprint build in [formalization](../../README.md) | The three public targets built successfully (9,556 jobs). `make -C blueprint` produced an 18-page PDF and web output. All ten labels in the new section and all 171 Lean source anchors resolved. See the [new section](../../blueprint/src/parallel_investigations.tex) next to the [master section](../../blueprint/src/master_variational.tex). |
| Combined public imports, `#check` and `#print axioms` on every blueprint-linked declaration | All 171 distinct existing declarations checked. Their axiom reports used only `propext`, `Classical.choice` and `Quot.sound`. The new blueprint targets have no proof marks. |

[Program continuation and activation prompt](../continuation-notes/AFTER_PARALLEL_ROUTE_SETUP_20261125.md)
