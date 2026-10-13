# The Circle Seven Knowledge Transmission Manuscript
## A Horn-Clause and Alloy Framework for Textual Provenance

**Status:** Preliminary research manuscript and executable-model specification. **Not** a completed exhaustive textual collation or verified proof of historical transmission.

## Abstract
This study tests whether philosophical and narrative parallels among the 1927 *Holy Koran of the Moorish Science Temple of America* (Circle Seven), selected early Upanishads, *The Aquarian Gospel of Jesus the Christ*, and *Unto Thee I Grant* establish textual borrowing, conceptual resemblance, or historical transmission. It uses evidence-linked Horn clauses and Alloy constraints. Logical consistency is not a substitute for evidence of who read which text.

## Primary corpus and edition controls
- C7: *Holy Koran of the Moorish Science Temple of America*, 1927, Library of Congress, https://www.loc.gov/item/2018662631/ (63 printed pages; 68 images).
- AG: Levi H. Dowling, *The Aquarian Gospel of Jesus the Christ*, early edition text https://www.gutenberg.org/files/44073/44073-h/44073-h.htm .
- UT: *Unto Thee I Grant*, 1925 Rosicrucian edition, https://iapsop.com/ssoc/1925__ramatherio___unto_thee_i_grant.pdf .
- UP: early Upanishads, Sanskrit transcription via University of Texas, https://sites.utexas.edu/sanskrit/resources/early-upanisads-olivelle-edition/ . Use named individual Upanishad, passage numbering, Sanskrit original, and a specified translation; the Bhagavad Gita is not itself an Upanishad.

## Method and evidentiary states
Each proposition must have a source ID, edition, chapter/verse or page, exact text or bounded paraphrase, and editorial decision. Statuses: CONFIRMED (directly inspected), CANDIDATE (plausible, awaiting collation), CONTRADICTED (positive counterevidence), UNDETERMINED (insufficient evidence). Similarity types: VERBATIM, CLOSE_PARAPHRASE, THEMATIC, NARRATIVE, NONE. Distinguish religious metaphysical claims *within* a text from externally verified historical facts.

### Horn clauses (Datalog-like)
```
source(S, Edition) :- catalogued(S, Edition), edition_inspected(S, Edition).
valid_passage(P) :- passage_in(P,S), source(S,E), locator(P,L), text_checked(P).
lexical_match(A,B) :- valid_passage(A), valid_passage(B), verified_alignment(A,B,verbatim).
semantic_match(A,B) :- valid_passage(A), valid_passage(B), verified_alignment(A,B,semantic), reviewed_by_scholar(A,B).
shared_theme(A,B) :- semantic_match(A,B), theme(A,T), theme(B,T).
chronologically_possible(A,B) :- published_before(A,B).
transmission_candidate(A,B) :- lexical_match(A,B), chronologically_possible(A,B).
documented_transmission(A,B) :- transmission_candidate(A,B), independent_historical_evidence(A,B,E), evidence_checked(E).
```
**Critical non-rules:** `shared_theme(A,B) => documented_transmission(A,B)` is invalid; `lexical_match(A,B) => DrewAliRead(A)` is invalid; `consistent_model => historical_truth` is invalid. Claims that all scriptures share one source are not inferable merely from a recurring soul motif.

## Initial claim register
| ID | Claim | Evidence | Current disposition |
|---|---|---|---|
| H01 | A Circle Seven edition was issued in 1927 | LOC catalogue and digitized copy | CONFIRMED bibliographically |
| H02 | An English-language *Aquarian Gospel* predates the 1927 Circle Seven edition | Early edition and publication records | CONFIRMED chronologically |
| H03 | A 1925 edition of *Unto Thee I Grant* predates Circle Seven | 1925 edition | CONFIRMED chronologically |
| H04 | Circle Seven chapter 1 discusses spirit-man as distinct from body and soul | Public chapter transcription, needs LOC page check | CANDIDATE passage |
| H05 | Early Upanishads distinguish self from body and discuss ultimate reality | Named Sanskrit texts; individual passage alignment outstanding | CANDIDATE comparative theme |
| H06 | Circle Seven reproduces Aquarian Gospel passages | Established scholarly comparison; line-level audit pending | CANDIDATE at passage level |
| H07 | Circle Seven reproduces Unto Thee I Grant passages | Established scholarly comparison; line-level audit pending | CANDIDATE at passage level |
| H08 | Drew Ali personally translated Sanskrit scriptures | No direct documentation in reviewed sources | UNDETERMINED, not proven |
| H09 | Similar metaphysics prove a direct Vedic-to-Drew-Ali chain | No unique transmission evidence | NOT ESTABLISHED |

## Comparative themes requiring close collation
1. **Self and embodiment:** C7 chapter 1's spirit/body distinction against Kaṭha Upaniṣad 2.18 (edition-specific numbering) and Bṛhadāraṇyaka 4.4. Distinguish spirit, ātman, soul and personal identity; do not translate them as synonyms by fiat.
2. **Ultimate reality and individual identity:** C7 divine-part language against Chāndogya 6.8.7 and Bṛhadāraṇyaka 1.4.10. Record differences between monistic and theistic readings.
3. **Knowledge and liberation:** Compare explicit teachings about ignorance, insight, self-knowledge, and emancipation. Moral self-improvement and mokṣa are not automatically equivalent.
4. **Moral causality:** Compare UT's 'Manifestations of Karma' to specific Upanishadic karma passages, e.g. Bṛhadāraṇyaka 4.4.5; require a literal text-level alignment before labeling direct influence.
5. **Jesus in India:** AG's India narratives versus C7 narratives. The presence of an Indian setting in a modern esoteric gospel is not independent evidence of a historical visit by Jesus.

## Historical transmission hypotheses
- T1: C7 drew directly from AG and UT English-language editions. **Test:** sequential rare-phrase alignments, unusual shared errors, omission patterns, chronological precedence.
- T2: C7 independently drew from Sanskrit/Upanishadic teachings. **Test:** direct archival evidence of Drew Ali's reading, teachers, manuscripts, or correspondences, plus uniquely shared features not explained by AG/UT.
- T3: All three modern works shared broader Western esoteric vocabulary. **Test:** earlier dated translations, periodicals, lecture circuits, Theosophical/Rosicrucian publication records.
These hypotheses may overlap; do not enforce artificial exclusivity.

## Alloy invariants
See `provenance.als` for the finite relational model. The model is intentionally a **consistency gate**: `check` searches for counterexamples within a stated scope, not for proof of historical truth. Historical validity additionally requires external evidence, exact passages, and expert review. Alloy was not run in preparing this preliminary manuscript.

## Validation pipeline
1. Acquire edition-locked source text and scan images; record source hashes.
2. Segment by page/chapter/verse, preserve original spelling, and mark OCR uncertainty.
3. Generate candidate n-gram, rare-phrase, and semantic alignments, never treating embeddings alone as proof.
4. Human-check original scans and Sanskrit translations; record precise paired locations.
5. Emit Horn facts only for evidence-checked matches; infer candidate relationships.
6. Export relation tables to Alloy; run `check` at increasing finite scopes, repair inconsistent claims or schema, preserve counterexamples.
7. Write an evidence appendix with all matches, nonmatches, negative findings, dates, and unresolved alternatives.

## Conclusion (provisional)
The 1927 edition and the prior availability of English-language spiritual books are independently supportable. Philosophical overlap with the Upanishads is a serious comparative question but does not by itself establish direct Sanskrit reading or a personal transmission route to Drew Ali. The manuscript's claim register is preliminary: no claim of exhaustive matching, formal verification, or completed source-by-source comparison is made.
