# Corpus — Edition-Locked Excerpts

This directory holds **edition-locked** source excerpts for the four primary works. Every excerpt must be tied to a specific inspected edition, page/chapter/verse locator, and editorial decision.

**Rules (from the manuscript):**
- Exact text or bounded paraphrase only.
- Preserve original spelling and punctuation.
- Mark OCR uncertainty explicitly.
- Record source hash or stable identifier when available.
- Status of each excerpt: CONFIRMED (directly inspected against edition), CANDIDATE (awaiting verification), CONTRADICTED, or UNDETERMINED.
- Do not treat thematic resemblance as transmission evidence.

## Directory layout
```
corpus/
├── C7/          # 1927 Holy Koran of the Moorish Science Temple of America (LOC)
├── AG/          # Aquarian Gospel (early English edition)
├── UT/          # Unto Thee I Grant (1925 Rosicrucian edition)
└── UP/          # Early Upanishads (named individual texts + specified translation)
```

Each work directory contains:
- `README.md` — edition control notes, links, inspection status, any hash.
- `excerpts/` — individual excerpt files (Markdown with YAML frontmatter).

Use the template at `collations/templates/excerpt.md` when adding new excerpts.

## Inspection status (current)
| Source | Edition control | Status |
|--------|-----------------|--------|
| C7     | LOC digitized copy | CANDIDATE (needs page-level verification) |
| AG     | Gutenberg early text | CANDIDATE |
| UT     | 1925 PDF | CANDIDATE |
| UP     | UT Austin Olivelle resources | CANDIDATE (passage-level alignment outstanding) |

No excerpts are yet CONFIRMED at the line level. Add them only after direct inspection of the named edition.
