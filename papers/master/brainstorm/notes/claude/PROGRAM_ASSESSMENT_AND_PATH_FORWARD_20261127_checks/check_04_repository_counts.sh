#!/bin/sh
# Check 04.  The repository counts and the Lean evidence quoted in the note
# PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127.md.  Read-only.  Run from anywhere inside
# the repository:  sh check_04_repository_counts.sh
# Counts use the files tracked by git, so that files a session has added but the author
# has not committed do not change them.
set -u
root=$(git rev-parse --show-toplevel) || exit 1
cd "$root" || exit 1

echo "== repository =="
echo "HEAD $(git rev-parse --short HEAD), $(git log -1 --format=%ad --date=format:'%Y-%m-%d %H:%M %z')"
echo "commits: $(git rev-list --count HEAD)"
echo "tracked files: $(git ls-files | wc -l | tr -d ' ')"
for d in papers/master papers/investigations-1/0[1-8]_* formalization; do
  echo "  $d: $(git ls-files "$d" | wc -l | tr -d ' ')"
done

echo "== added between 841d606 (26 Nov 23:05) and HEAD =="
echo "papers and formalization:$(git diff --shortstat 841d606 HEAD -- papers formalization)"
for d in papers/master papers/investigations-1/0[1-8]_* formalization; do
  s=$(git diff --shortstat 841d606 HEAD -- "$d")
  echo "  $d:${s:- no change}"
done
echo "== investigations 01 to 07 since de2125d (26 Nov 16:17) =="
s=$(git diff --shortstat de2125d HEAD -- papers/investigations-1/01_chiral_metric_evolution \
  papers/investigations-1/02_bach_flow papers/investigations-1/03_first_order_twistor \
  papers/investigations-1/04_hypersurface_immersions papers/investigations-1/05_collar_deformation_and_surgery \
  papers/investigations-1/06_bour_flow_and_fixed_type_attainment papers/investigations-1/07_positive_subcritical_entry)
echo "${s:- no change}"

echo "== Lean libraries (tracked sources) =="
total_files=0; total_lines=0; total_thm=0
for lib in SectionsAndConnections FirstOrderTwistor SmoothPoincare; do
  files=$(git ls-files "formalization/$lib" "formalization/$lib.lean" | grep '\.lean$')
  nf=$(echo "$files" | wc -l | tr -d ' ')
  nl=$(echo "$files" | xargs cat | wc -l | tr -d ' ')
  nt=$(echo "$files" | xargs grep -hE '^[[:space:]]*(private |protected )?(theorem|lemma) ' | wc -l | tr -d ' ')
  echo "  $lib: $nf files, $nl lines, $nt theorem or lemma declarations"
  total_files=$((total_files + nf)); total_lines=$((total_lines + nl)); total_thm=$((total_thm + nt))
done
echo "  together: $total_files files, $total_lines lines, $total_thm theorem or lemma declarations"
libfiles=$(git ls-files formalization/SectionsAndConnections formalization/FirstOrderTwistor formalization/SmoothPoincare \
  formalization/SectionsAndConnections.lean formalization/FirstOrderTwistor.lean formalization/SmoothPoincare.lean | grep '\.lean$')
echo "  lines containing the word sorry: $(echo "$libfiles" | xargs grep -nw 'sorry' | wc -l | tr -d ' ')"
echo "  axiom declarations: $(echo "$libfiles" | xargs grep -nE '^[[:space:]]*(private |protected )?axiom ' | wc -l | tr -d ' ')"
echo "  other tracked .lean files (checks and replays under formalization/investigations): $(git ls-files formalization/investigations | grep -c '\.lean$')"

echo "== geometric inputs that enter as hypotheses (evidence lines) =="
echo "-- the closed signature identity E_+ = E_- is a field of the metric structure:"
grep -n 'signature_zero :' formalization/SmoothPoincare/Variational/SignedCollarRepair.lean
echo "-- Bach-flatness is a predicate supplied to the theorem, with its consequences as hypotheses:"
grep -n '(BachFlat : SmoothRiemannianMetric I M → Prop)' formalization/SmoothPoincare/Variational/AttainedRoundCut.lean
grep -n 'hVariation\|hContinuation\|hRecognition' formalization/SmoothPoincare/Variational/AttainedRoundCut.lean | head -12
echo "-- closed Gauss-Bonnet and the Euler characteristic are fields of the exhaustion structure:"
grep -n 'closedGaussBonnet :\|eulerCharacteristic :' formalization/SmoothPoincare/Variational/BourClosedCapEuler.lean
echo "-- the fixed-width theorem takes the strip volume, the jet bound and the band identities as hypotheses:"
grep -n '(hvol :\|(hjet :\|(hbalance :\|(hexchange :' formalization/SmoothPoincare/IntrinsicEntry/PauseStripTrial.lean
echo "-- recognition below 4 pi^2 enters through a hypothesis structure:"
grep -n 'structure MarkedSideReplacement' formalization/SmoothPoincare/Variational/CutNonsplitting.lean
grep -n '  recognize :' formalization/SmoothPoincare/Variational/CutNonsplitting.lean
echo "-- declarations named after Gauss-Bonnet, the signature theorem or the Bach tensor in the three libraries:"
echo "$libfiles" | xargs grep -nE '^[[:space:]]*(theorem|lemma|def|noncomputable def) [A-Za-z_.]*([Gg]aussBonnet|[Hh]irzebruch|bachTensor|BachTensor)' | wc -l | tr -d ' '

echo "== dependency =="
echo "library files that import DifferentialGeometry: $(echo "$libfiles" | xargs grep -l '^import DifferentialGeometry' | wc -l | tr -d ' ')"
grep -n 'rev = ' formalization/lakefile.toml
cat formalization/lean-toolchain

echo "== continuous integration =="
ls .github/workflows
echo "workflow files that mention lake or lean: $(grep -lEi 'lake|lean' .github/workflows/* 2>/dev/null | wc -l | tr -d ' ')"

echo "== literature not cited in the manuscripts or bibliography =="
for key in '1809.05918' '1810.05897' '2505.17752' '2604.17547' '1311.5256' '2211.09091'; do
  n=$(git grep -l -- "$key" -- 'papers' 'references' 2>/dev/null | wc -l | tr -d ' ')
  echo "  arXiv:$key appears in $n tracked files under papers/ and references/"
done

echo "== half positive isotropic curvature in the research files =="
n=$(git grep -l -i -E 'half[- ]PIC|PIC_\+|PIC\$_\+|half[- ]positive isotropic' -- papers 2>/dev/null | wc -l | tr -d ' ')
echo "  tracked files under papers/ that mention it: $n"
