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
assert ConfirmedHasCheckedEvidence {
  all t: Transmission | t.status = Confirmed implies some e: t.support | e.checked = Yes
}
assert ConfirmedRespectsChronology {
  all t: Transmission | t.status = Confirmed implies t.from.year <= t.to.year
}
check ConfirmedHasCheckedEvidence for 8 but 16 Int
check ConfirmedRespectsChronology for 8 but 16 Int
run { some Transmission } for 8 but 16 Int
