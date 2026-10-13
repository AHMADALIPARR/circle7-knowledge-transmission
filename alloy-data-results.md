# Alloy Results with Actual Data

**Model:** `provenance-data.als`  
**Tool:** Alloy 6.2.0 (CLI `exec`)  
**Date:** 2026-10-13  
**Scope:** `for 3 but exactly 4 Work, 6 Int`

## Data encoded
Years are stored as offsets from 1900:

| Work | Offset | Calendar year | Status |
|------|--------|---------------|--------|
| AG   | 8      | 1908          | CONFIRMED |
| UT   | 25     | 1925          | CONFIRMED |
| C7   | 27     | 1927          | CONFIRMED |
| UP   | 0      | ancient       | comparative |

Candidate transmissions from the manuscript:
- T1_AG_C7, T1_UT_C7 — status = Candidate, no checked evidence
- T2_UP_C7 — status = Undetermined, no checked evidence

No passage-level excerpts or verified alignments exist yet; those remain CANDIDATE in the collations structure.

## Results
| Lemma | Result |
|-------|--------|
| lemma_NoSelfAlignments | UNSAT (holds) |
| lemma_ConfirmedAlignmentIsChecked | UNSAT (holds) |
| lemma_ConfirmedHasCheckedEvidence | UNSAT (holds) |
| lemma_ConfirmedRespectsChronology | UNSAT (holds) |
| lemma_NoContradictedConfirmedTransmission | UNSAT (holds) |
| lemma_AG_predates_C7 | UNSAT (holds) |
| lemma_UT_predates_C7 | UNSAT (holds) |
| lemma_no_confirmed_transmission_yet | UNSAT (holds) |
| existence run (chronology + some Transmission) | SAT |

## Interpretation
- All invariants continue to hold when the model is populated with the actual bibliographical years.
- The data-specific lemmas confirm the chronological precedence already recorded as H02 and H03.
- The lemma `no_confirmed_transmission_yet` correctly reflects that no transmission has checked evidence supporting status = Confirmed.
- Consistency with the data does not establish historical transmission. Passage-level collations and independent evidence are still required.

## Next steps
- Replace candidate transmissions with verified alignments once excerpts are added under `corpus/`.
- Promote a transmission to Confirmed only when checked evidence is present.
- Re-run the checks after each addition of collated data.
