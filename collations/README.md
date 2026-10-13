# Collations — Alignments and Comparisons

This directory holds **evidence-checked alignments** between passages. Alignments are the input to the Horn-clause facts and the Alloy model.

**Critical rules:**
- An alignment is never inferred from theme alone.
- Similarity types: VERBATIM, CLOSE_PARAPHRASE, THEMATIC, NARRATIVE, NONE.
- Only VERBATIM or CLOSE_PARAPHRASE with chronological precedence can support a `transmission_candidate`.
- Shared themes do **not** imply documented transmission.
- Record both matches and non-matches / negative findings.

## Layout
```
collations/
├── templates/
│   ├── excerpt.md
│   └── alignment.md
├── alignments/
│   └── (individual alignment files or an index)
└── negative-findings/
```

## Workflow
1. Add or verify an excerpt under `corpus/<SOURCE>/excerpts/`.
2. Create an alignment file under `collations/alignments/` using the template.
3. Set status to CANDIDATE until human-checked against original scans/editions.
4. Only after verification emit corresponding Horn facts (future `facts/` or Datalog loader).
5. Export relation tables for Alloy `check` runs.

See `MANUSCRIPT.md` for the full evidentiary states and non-rules.
