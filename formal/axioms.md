# Axiomatic Core

Closed formalization. No placeholders.

## Central invariant

A transmission claim is Confirmed only when it is supported by checked evidence and respects chronology:

\[
\text{status}(t) = \text{Confirmed}
\implies
\bigl(\exists e \in \text{support}(t).\ \text{checked}(e)\bigr)
\land
\text{year}(\text{from}(t)) \le \text{year}(\text{to}(t))
\]

Model consistency does not entail historical truth.

## Signature

- \(\text{Work}\), with \(\text{year} : \text{Work} \to \mathbb{Z}\)
- \(\text{Passage}\), with \(\text{work} : \text{Passage} \to \text{Work}\), \(\text{checked} : \text{Passage} \to \{\text{Yes}, \text{No}\}\)
- \(\text{Alignment}\), with \(\text{left}, \text{right} : \text{Alignment} \to \text{Passage}\), \(\text{kind} \in \{\text{Verbatim}, \text{Semantic}, \text{Thematic}\}\)
- \(\text{Evidence}\), with \(\text{checked} : \text{Evidence} \to \{\text{Yes}, \text{No}\}\)
- \(\text{Transmission}\), with \(\text{from}, \text{to} : \text{Transmission} \to \text{Work}\), \(\text{support} \subseteq \text{Evidence}\), \(\text{status} \in \{\text{Confirmed}, \text{Candidate}, \text{Contradicted}, \text{Undetermined}\}\)

## Axioms

**A1 (Status exclusivity).**  
\(\text{status}(t)\) is unique for every transmission \(t\).

**A2 (Confirmed evidence).**  
\(\text{status}(t) = \text{Confirmed} \implies \exists e \in \text{support}(t).\ \text{checked}(e)\).

**A3 (Confirmed chronology).**  
\(\text{status}(t) = \text{Confirmed} \implies \text{year}(\text{from}(t)) \le \text{year}(\text{to}(t))\).

**A4 (Irreflexive alignment).**  
\(\text{left}(a) \neq \text{right}(a)\) for every alignment \(a\).

**A5 (Checked alignment).**  
\(\text{checked}(a) = \text{Yes} \implies \text{checked}(\text{left}(a)) = \text{Yes} \land \text{checked}(\text{right}(a)) = \text{Yes}\).

**A6 (Non-implication: theme).**  
Shared theme does not entail documented transmission:

\[
\text{shared\_theme}(A, B) \not\Rightarrow \text{documented\_transmission}(A, B)
\]

**A7 (Non-implication: lexical match).**  
Lexical match does not entail that a named individual read the source:

\[
\text{lexical\_match}(A, B) \not\Rightarrow \text{DrewAliRead}(A)
\]

**A8 (Non-implication: consistency).**  
Consistency of the model does not entail historical truth:

\[
\text{consistent\_model} \not\Rightarrow \text{historical\_truth}
\]

## Instantiated data (bibliographical)

Years as offsets from 1900:

- \(\text{year}(\text{AG}) = 8\) (1908)
- \(\text{year}(\text{UT}) = 25\) (1925)
- \(\text{year}(\text{C7}) = 27\) (1927)
- \(\text{year}(\text{UP}) = 0\) (ancient)

Hence \(\text{year}(\text{AG}) < \text{year}(\text{C7})\) and \(\text{year}(\text{UT}) < \text{year}(\text{C7})\).

No transmission currently satisfies the antecedent of the central invariant.

## Discharge

The Alloy models `provenance.als` and `provenance-data.als` discharge A2–A5 (and the data lemmas) as UNSAT checks at the stated finite scopes. A6–A8 are enforced by the absence of the corresponding implication rules.
