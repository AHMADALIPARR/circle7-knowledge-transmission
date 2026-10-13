# Circle Seven Knowledge Transmission

Preliminary research manuscript and executable-model specification using Horn clauses and Alloy for examining textual provenance among:

- The 1927 *Holy Koran of the Moorish Science Temple of America* (Circle Seven)
- Selected early Upanishads
- *The Aquarian Gospel of Jesus the Christ*
- *Unto Thee I Grant*

**Status:** Not a completed exhaustive textual collation or verified proof of historical transmission. Logical consistency is not a substitute for evidence of who read which text.

## Contents
- [MANUSCRIPT.md](MANUSCRIPT.md) — full preliminary manuscript, claim register, method, and validation pipeline
- [provenance.als](provenance.als) — Alloy consistency-gate model (invariants restated as lemmas)
- [alloy-results.md](alloy-results.md) — successful discharge of all lemmas (UNSAT checks at scope 4)
- [corpus/](corpus/) — edition-locked excerpts (C7, AG, UT, UP) with inspection rules
- [collations/](collations/) — alignment and negative-finding structure + templates

## Primary sources

- C7: Library of Congress, https://www.loc.gov/item/2018662631/
- AG: https://www.gutenberg.org/files/44073/44073-h/44073-h.htm
- UT: https://iapsop.com/ssoc/1925__ramatherio___unto_thee_i_grant.pdf
- UP: https://sites.utexas.edu/sanskrit/resources/early-upanisads-olivelle-edition/

## Quick start for collations
1. Read the rules in [corpus/README.md](corpus/README.md) and [collations/README.md](collations/README.md).
2. Copy a template from [collations/templates/](collations/templates/).
3. Add an excerpt under the appropriate `corpus/<SOURCE>/excerpts/` directory.
4. Create an alignment under `collations/alignments/`.
5. Keep status = CANDIDATE until directly verified against the named edition.

## License

This research framework and manuscript are released for scholarly use. Please cite appropriately if used.

## Contributing

Contributions of edition-locked collations, rare-phrase alignments, negative findings, and Alloy model refinements are welcome, provided they maintain the evidentiary standards described in the manuscript.
