/- E54, 27 November 2026. Check every loaded constant owned by the listed
modules, including generated declarations, against the standard axiom set. -/
import SmoothPoincare
import Lean

open Lean Elab Command

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
run_cmd do
  let targets : List String := [
    "SmoothPoincare.Heights.HMPRelativeTrace",
    "SmoothPoincare.IntrinsicEntry.WidenedPauseStrip",
    "SmoothPoincare.Variational.BourBufferedCapWarp",
    "SmoothPoincare.Variational.BourBufferedCapFrame",
    "SmoothPoincare.Variational.BourMeasuredBufferedCap",
    "SmoothPoincare.Variational.BourBufferedCapCurvature",
    "SmoothPoincare.Variational.BourBufferedCapEuler"]
  let env ← getEnv
  let moduleNames := env.allImportedModuleNames
  let mut counts : Std.HashMap String Nat := {}
  let mut implementationOnly : Nat := 0
  for (name, idx) in env.const2ModIdx.toArray do
    let mod := moduleNames[idx.toNat]!.toString
    unless targets.contains mod do continue
    let some info := (env.setExporting false).find? name
      | if isPrivateName name || name.isInternalDetail then
          implementationOnly := implementationOnly + 1
          continue
        else throwError "unavailable public constant {name}"
    if let .axiomInfo _ := info then throwError "axiom declaration {name}"
    for ax in (← collectAxioms name) do
      unless ([`propext, `Classical.choice, `Quot.sound] : List Name).contains ax do
        throwError "{name} depends on {ax}"
    counts := counts.insert mod (counts.getD mod 0 + 1)
  for mod in targets do
    let some n := counts.get? mod | throwError "missing module {mod}"
    logInfo m!"{mod}: {n} checked constants"
  logInfo m!"Compiler-only private implementation names without a loaded kernel declaration: {implementationOnly}"
