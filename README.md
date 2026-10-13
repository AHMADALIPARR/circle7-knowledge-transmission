# Circle Seven Knowledge Transmission

Closed formalization of textual provenance among the 1927 Circle Seven, selected early Upanishads, the Aquarian Gospel, and Unto Thee I Grant.

## Central invariant

A transmission is Confirmed only when it has checked evidence and respects chronology:

\[
\text{status}(t) = \text{Confirmed}
\implies
\bigl(\exists e \in \text{support}(t).\ \text{checked}(e)\bigr)
\land
\text{year}(\text{from}(t)) \le \text{year}(\text{to}(t))
\]

Model consistency does not entail historical truth.

Full axiomatization (A1–A8, signature, instantiated years, non-implications): [formal/axioms.md](formal/axioms.md).

## Contents

- [formal/axioms.md](formal/axioms.md) — closed axiomatic core (no placeholders)
- [MANUSCRIPT.md](MANUSCRIPT.md) — preliminary manuscript and claim register
- [provenance.als](provenance.als) — abstract Alloy consistency gate
- [provenance-data.als](provenance-data.als) — model with bibliographical data (AG 1908, UT 1925, C7 1927)
- [alloy-results.md](alloy-results.md), [alloy-data-results.md](alloy-data-results.md) — discharged checks
- [corpus/](corpus/) — edition-locked excerpts
- [collations/](collations/) — alignments and negative findings

## Primary sources

- C7: https://www.loc.gov/item/2018662631/
- AG: https://www.gutenberg.org/files/44073/44073-h/44073-h.htm
- UT: https://iapsop.com/ssoc/1925__ramatherio___unto_thee_i_grant.pdf
- UP: https://sites.utexas.edu/sanskrit/resources/early-upanisads-olivelle-edition/

## Status

Formal core is closed. No transmission currently satisfies the central invariant. Passage-level collations remain the required external evidence.
