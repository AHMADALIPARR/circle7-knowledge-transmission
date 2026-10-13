module provenance
abstract sig Status {}
one sig Confirmed, Candidate, Contradicted, Undetermined extends Status {}
abstract sig MatchKind {}
one sig Verbatim, Semantic, Thematic extends MatchKind {}
sig Work { year: one Int }
sig Passage { work: one Work, checked: one Bool }
abstract sig Bool {}
one sig Yes, No extends Bool {}
sig Alignment { left, right: one Passage, kind: one MatchKind, checked: one Bool }
sig Evidence { checked: one Bool }
sig Transmission { from, to: one Work, support: set Evidence, status: one Status }

// Invariants (facts). These are the consistency constraints of the model.
fact NoSelfAlignments { all a: Alignment | a.left != a.right }
fact ConfirmedAlignmentIsChecked {
  all a: Alignment | a.checked = Yes implies (a.left.checked = Yes and a.right.checked = Yes)
}
fact ConfirmedTransmissionNeedsEvidence {
  all t: Transmission | t.status = Confirmed implies some e: t.support | e.checked = Yes
}
fact ChronologyForConfirmedTransmission {
  all t: Transmission | t.status = Confirmed implies t.from.year <= t.to.year
}
fact NoContradictedConfirmedTransmission {
  no t: Transmission | t.status = Confirmed and t.status = Contradicted
}

// Lemmas (asserts). Each invariant is restated as a lemma and discharged by check.
// Successful check (UNSAT counterexample) establishes the lemma within the given scope.
assert lemma_NoSelfAlignments {
  all a: Alignment | a.left != a.right
}
assert lemma_ConfirmedAlignmentIsChecked {
  all a: Alignment | a.checked = Yes implies (a.left.checked = Yes and a.right.checked = Yes)
}
assert lemma_ConfirmedHasCheckedEvidence {
  all t: Transmission | t.status = Confirmed implies some e: t.support | e.checked = Yes
}
assert lemma_ConfirmedRespectsChronology {
  all t: Transmission | t.status = Confirmed implies t.from.year <= t.to.year
}
assert lemma_NoContradictedConfirmedTransmission {
  no t: Transmission | t.status = Confirmed and t.status = Contradicted
}

// Practical scopes (bitwidth 4 keeps the integer universe tractable).
check lemma_NoSelfAlignments for 4 but 4 Int
check lemma_ConfirmedAlignmentIsChecked for 4 but 4 Int
check lemma_ConfirmedHasCheckedEvidence for 4 but 4 Int
check lemma_ConfirmedRespectsChronology for 4 but 4 Int
check lemma_NoContradictedConfirmedTransmission for 4 but 4 Int
run { some Transmission } for 4 but 4 Int
