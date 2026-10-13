# Alloy Model Results

**Model:** `provenance.als`  
**Tool:** Alloy 6.2.0 (CLI `exec`)  
**Date:** 2026-10-13  
**Scope:** `for 4 but 4 Int` (bitwidth 4)

## Summary
All invariants have been restated as lemmas and successfully discharged.
No counterexamples were found within the stated finite scope.

| Lemma | Command | Result |
|-------|---------|--------|
| lemma_NoSelfAlignments | check ... for 4 but 4 Int | UNSAT (holds) |
| lemma_ConfirmedAlignmentIsChecked | check ... for 4 but 4 Int | UNSAT (holds) |
| lemma_ConfirmedHasCheckedEvidence | check ... for 4 but 4 Int | UNSAT (holds) |
| lemma_ConfirmedRespectsChronology | check ... for 4 but 4 Int | UNSAT (holds) |
| lemma_NoContradictedConfirmedTransmission | check ... for 4 but 4 Int | UNSAT (holds) |
| existence of Transmission | run { some Transmission } ... | SAT (models exist) |

## Interpretation
- The lemmas confirm that the model is consistent with its own invariants inside the examined scope.
- UNSAT on `check` means the assertion holds (no counter-model exists at that scope).
- SAT on the `run` shows that non-trivial instances are possible.
- These results are a **consistency gate only**. They do not establish historical transmission, reading, or authorship. External evidence, edition-locked passages, and expert review remain required (see MANUSCRIPT.md).

## Notes on scope
The original `for 8 but 16 Int` exceeded Alloy’s translation capacity (integer universe too large). The reduced bitwidth is sufficient for the relational constraints under consideration and keeps analysis tractable.

## Next steps
- Increase scope gradually if additional signatures or fields are introduced.
- Export relation tables from collations once verified excerpts exist.
- Preserve any future counterexamples as negative findings.
