import SmoothPoincare

/-!
# FOT-E48 public input replay

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving configuration unavailable. This checks the inherited public
import and the principal measured, compact-limit and rigidity interfaces.
-/

open Lean Elab Command

run_cmd do
  let modules := (← getEnv).allImportedModuleNames.toList
  let bour := modules.filter (fun n => n.toString.startsWith "SmoothPoincare.Variational.Bour")
  logInfo m!"Imported E47 Bour modules: {bour}"
  let groups : List String := ["SmoothPoincare", "FirstOrderTwistor", "SectionsAndConnections",
    "DifferentialGeometry", "Mathlib"]
  logInfo m!"Transitive modules: {modules.length}"
  for group in groups do
    let count := (modules.filter fun n => n.toString == group || n.toString.startsWith (group ++ ".")).length
    logInfo m!"{group}: {count}"
  for name in [
      `DifferentialGeometry.Geometry.Compactness.CheegerGromov.Pointed.Bounds.InjectivityRadius,
      `DifferentialGeometry.Geometry.Compactness.CheegerGromov.Pointed.Convergence.CompactGlobalization,
      `DifferentialGeometry.Geometry.Compactness.CheegerGromov.Pointed.Compactness.BoundedGeometryCanonical,
      `DifferentialGeometry.Geometry.Flow.RicciFlow.Compactness.Limits.Hamilton] do
    logInfo m!"{name}: imported = {modules.contains name}"

set_option pp.universes false

#check @SmoothPoincare.exists_bourYamabeStarts
#print axioms SmoothPoincare.exists_bourYamabeStarts
#check @SmoothPoincare.Bour.eventually_bourOriginalFlow_budget
#print axioms SmoothPoincare.Bour.eventually_bourOriginalFlow_budget
#check @SmoothPoincare.Bour.original_gradient_sublevel
#print axioms SmoothPoincare.Bour.original_gradient_sublevel
#check @SmoothPoincare.Bour.parabolic_dissipation_eq
#print axioms SmoothPoincare.Bour.parabolic_dissipation_eq
#check @SmoothPoincare.bourWholeCoreComparison
#print axioms SmoothPoincare.bourWholeCoreComparison
#check @SmoothPoincare.bourPointedTraceFreeRicci_real_le_liminf
#print axioms SmoothPoincare.bourPointedTraceFreeRicci_real_le_liminf
#check @SmoothPoincare.bourCappedExterior_both_lt
#print axioms SmoothPoincare.bourCappedExterior_both_lt
#check @SmoothPoincare.bourGlueMarkedInverse
#print axioms SmoothPoincare.bourGlueMarkedInverse
#check @SmoothPoincare.bourBallVolume_lower_of_yamabe_scale
#print axioms SmoothPoincare.bourBallVolume_lower_of_yamabe_scale
#check @SmoothPoincare.Bour.mixedReturn_uniform_physical_budget
#print axioms SmoothPoincare.Bour.mixedReturn_uniform_physical_budget
#check @SmoothPoincare.Bour.mixedReturn_pointed_saturation
#print axioms SmoothPoincare.Bour.mixedReturn_pointed_saturation
#check @SmoothPoincare.bourClosedReturn
#print axioms SmoothPoincare.bourClosedReturn
#check @SmoothPoincare.bourNegativeSecondVariationExcludesAttainment
#print axioms SmoothPoincare.bourNegativeSecondVariationExcludesAttainment
