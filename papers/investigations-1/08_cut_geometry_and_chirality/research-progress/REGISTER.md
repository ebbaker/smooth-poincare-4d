# Cut geometry and chirality — progress register

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `4655e38`. Sole live owner of the parent task family `SP4-CUT`, which since the split of 26 November 2026 consists of SP4-CUT-E02 and SP4-CUT-B01. The ten tasks assigned to the children moved to the five child registers under new identifiers; the [crosswalk](CROSSWALK_20261126.md) records each. This register links the child registers and does not copy their rows. Nothing is activated. [Plan](../research-plan/PLAN.md) · [Overview](../research-overview/OVERVIEW.md) · [Continuation](../continuation-notes/CONTINUATION.md)

| Task | Current state | Evidence or exact dependency |
| --- | --- | --- |
| SP4-CUT-E02 | Ready, unactivated | Inputs fixed: Sections 2 to 5, 7 and 8 of the [manuscript](../manuscript/cuts_of_subcritical_conformal_classes.tex) as first drafted at `841d606`. |
| SP4-CUT-B01 | Dependent | Needs the returns of SP4-CUT-LED-E01 and SP4-CUT-E02 and at least one of SP4-CUT-GEO-B01, SP4-CUT-TUBE-B01, SP4-CUT-SEAM-B01. |

| Child register | Family | Ready on activation | Dependent or reserved |
| --- | --- | --- | --- |
| [Chirality ledger](../01_chirality_ledger/research-progress/REGISTER.md) | `SP4-CUT-LED` | LED-E01, LED-E02, LED-B01 | LED-E03, LED-E04, LED-B02 |
| [Seams and marked cuts](../02_seams_and_marked_cuts/research-progress/REGISTER.md) | `SP4-CUT-SEAM` | SEAM-E01, SEAM-B01, SEAM-B02, SEAM-E03 | SEAM-E02, SEAM-B03 |
| [Tubes and exteriors](../03_tubes_and_exteriors/research-progress/REGISTER.md) | `SP4-CUT-TUBE` | TUBE-B01, TUBE-E01, TUBE-E02, TUBE-B02 | TUBE-E03, TUBE-B03 |
| [Slide filters](../04_slide_filters/research-progress/REGISTER.md) | `SP4-CUT-SLIDE` | SLIDE-E02 | SLIDE-B01, SLIDE-E01, SLIDE-B02 |
| [Cuts from geometry](../05_cuts_from_geometry/research-progress/REGISTER.md) | `SP4-CUT-GEO` | GEO-B01, GEO-E02, GEO-E03, GEO-B02 | GEO-E01, GEO-B03 |

**Imported material, not a task.** The manuscript's statements carry the status they had in the session that wrote them: proofs written out and not read independently; the cap functional verified symbolically; the table of cap costs floating point; the sign of the ledger's boundary term untested (SP4-CUT-LED-E01). The working theorems of 05, 06 and the master are used as stated.

**Request issued.** [To the lead of 05](handoffs/SLIDE_B01_REQUEST_TO_05_20261126.md), on the redirection of the slide enumeration; not answered.

**Returns owed to other registers once tasks complete.** To master B02 and 07: the selection rules for seams and tubes (after SP4-CUT-SEAM-E01). To 03 and 06: the collar statement with its verified hypotheses (after SP4-CUT-LED-E02). To 05: the corollary at the winding-one cut (after SP4-CUT-SEAM-E01).
