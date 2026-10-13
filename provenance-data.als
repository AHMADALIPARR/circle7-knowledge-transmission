module provenance_data

abstract sig Status {}
one sig Confirmed, Candidate, Contradicted, Undetermined extends Status {}
abstract sig MatchKind {}
one sig Verbatim, Semantic, Thematic extends MatchKind {}

// Years stored as offset from 1900 so they fit in small bitwidth
// AG = 8 (1908), UT = 25 (1925), C7 = 27 (1927), UP = 0 (ancient / pre-modern English availability)
sig Work { year: one Int }
one sig C7, AG, UT, UP extends Work {}

sig Passage { work: one Work, checked: one Bool }
abstract sig Bool {}
one sig Yes, No extends Bool {}
sig Alignment { left, right: one Passage, kind: one MatchKind, checked: one Bool }
sig Evidence { checked: one Bool }
sig Transmission { from, to: one Work, support: set Evidence, status: one Status }

// ---- Actual bibliographical data (CONFIRMED in manuscript claim register) ----
fact ActualYears {
  AG.year = 8
  UT.year = 25
  C7.year = 27
  UP.year = 0
}

fact ChronologicalPrecedence {
  // H02, H03: AG and UT predate C7
  AG.year < C7.year
  UT.year < C7.year
  UP.year < C7.year
}

// ---- Candidate transmissions from manuscript hypotheses (not confirmed) ----
// T1: C7 drew from AG and UT (candidate)
one sig T1_AG_C7, T1_UT_C7 extends Transmission {}
fact T1_candidates {
  T1_AG_C7.from = AG and T1_AG_C7.to = C7 and T1_AG_C7.status = Candidate
  T1_UT_C7.from = UT and T1_UT_C7.to = C7 and T1_UT_C7.status = Candidate
  // no checked evidence yet
  no T1_AG_C7.support
  no T1_UT_C7.support
}

// T2: independent Sanskrit route (undetermined / not established)
one sig T2_UP_C7 extends Transmission {}
fact T2_undetermined {
  T2_UP_C7.from = UP and T2_UP_C7.to = C7 and T2_UP_C7.status = Undetermined
  no T2_UP_C7.support
}

// ---- Invariants ----
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

// ---- Lemmas ----
assert lemma_NoSelfAlignments { all a: Alignment | a.left != a.right }
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

// Data-specific lemmas
assert lemma_AG_predates_C7 { AG.year < C7.year }
assert lemma_UT_predates_C7 { UT.year < C7.year }
assert lemma_no_confirmed_transmission_yet {
  no t: Transmission | t.status = Confirmed
}

// Scopes: exactly the four works, bitwidth 6 covers offsets 0–27
check lemma_NoSelfAlignments for 3 but exactly 4 Work, 6 Int
check lemma_ConfirmedAlignmentIsChecked for 3 but exactly 4 Work, 6 Int
check lemma_ConfirmedHasCheckedEvidence for 3 but exactly 4 Work, 6 Int
check lemma_ConfirmedRespectsChronology for 3 but exactly 4 Work, 6 Int
check lemma_NoContradictedConfirmedTransmission for 3 but exactly 4 Work, 6 Int
check lemma_AG_predates_C7 for 3 but exactly 4 Work, 6 Int
check lemma_UT_predates_C7 for 3 but exactly 4 Work, 6 Int
check lemma_no_confirmed_transmission_yet for 3 but exactly 4 Work, 6 Int

run { some Transmission and AG.year < C7.year and UT.year < C7.year } for 3 but exactly 4 Work, 6 Int
